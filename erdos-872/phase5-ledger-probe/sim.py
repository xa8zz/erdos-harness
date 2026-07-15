import numpy as np
import random
import math
import time
import json
import sys

def sieve_spf(n):
    spf = np.zeros(n + 1, dtype=np.int32)
    for i in range(2, n + 1):
        if spf[i] == 0:
            spf[i::i] = np.where(spf[i::i] == 0, i, spf[i::i])
    return spf

def divisors_trial(x):
    """Return proper divisors 2<=d<x of x via trial division up to sqrt(x)."""
    ds = []
    i = 2
    r = int(math.isqrt(x))
    while i <= r:
        if x % i == 0:
            ds.append(i)
            j = x // i
            if j != i and j < x:
                ds.append(j)
        i += 1
    return ds

class ForwardScanner:
    __slots__ = ("pos", "hi")
    def __init__(self, lo, hi):
        self.pos = lo
        self.hi = hi
    def find(self, status):
        p = self.pos
        hi = self.hi
        while p <= hi and status[p] != 0:
            p += 1
        self.pos = p
        return p if p <= hi else None


class Game:
    def __init__(self, n, seed):
        self.n = n
        self.q = n // 4          # S1 lower bound (exclusive)
        self.h = n // 2          # S1 upper bound (inclusive)
        self.rng = random.Random(seed)

        N = n
        self.status = np.zeros(N + 1, dtype=np.int8)  # 0 legal, 1 chosen, 2 blocked
        self.status[0] = 3  # dummy, never a legal candidate, never "chosen"
        self.status[1] = 3

        # legal proper divisor count (all proper divisors 2<=d<y)
        self.legal_pdc = np.zeros(N + 1, dtype=np.int32)
        for d in range(2, N + 1):
            self.legal_pdc[2 * d:N + 1:d] += 1

        q = self.q
        # small_div_count[p] = count of legal divisors d<=q of p (including p itself if p<=q)
        self.small_div_count = np.zeros(N + 1, dtype=np.int32)
        for d in range(2, q + 1):
            self.small_div_count[d:N + 1:d] += 1

        # degree[e] for e in [2,q] = count of S1 targets y (legal & nonminimal) divisible by e
        self.degree = np.zeros(q + 1, dtype=np.int64)
        h = self.h
        for e in range(2, q + 1):
            cnt = h // e - q // e
            self.degree[e] = cnt

        # nonmin S1 population: composite y in S1 (legal_pdc>0) -- all legal initially
        if h >= q + 1:
            self.nonmin_S1_pop = int(np.sum(self.legal_pdc[q + 1:h + 1] > 0))
            self.legal_S1_count = h - q
        else:
            self.nonmin_S1_pop = 0
            self.legal_S1_count = 0
        self.S1_size = h - q

        # legal pool with swap-pop removal for RANDOM sampling
        self.legal_pool = list(range(2, N + 1))
        self.pos_of = np.zeros(N + 1, dtype=np.int64)
        for idx, v in enumerate(self.legal_pool):
            self.pos_of[v] = idx

        # scanners
        self.scan_full = ForwardScanner(2, N)
        self.scan_S1 = ForwardScanner(q + 1, h) if h >= q + 1 else ForwardScanner(1, 0)

        # bookkeeping / stats
        self.T_total = 0
        self.shortener_turns_active = 0
        self.release_events_active = 0
        self.release_events_total = 0
        self.degree_ledger_sum = 0  # sum of degree value achieved at each Shortener active-phase move
        self.nu_sums = {Y: 0 for Y in (10, 30, 100, 300)}
        self.greedy_root_count = 0
        self.moves_log = []  # optional, kept small

        self.spf = None  # set externally (shared sieve)

    # ---------- pool management ----------
    def _pool_remove(self, y):
        idx = self.pos_of[y]
        last_idx = len(self.legal_pool) - 1
        last_val = self.legal_pool[last_idx]
        self.legal_pool[idx] = last_val
        self.pos_of[last_val] = idx
        self.legal_pool.pop()

    # ---------- S1 exit bookkeeping ----------
    def _handle_S1_exit(self, y):
        q = self.q
        h = self.h
        if q < y <= h:
            if self.legal_pdc[y] > 0:
                self.nonmin_S1_pop -= 1
                for e in divisors_trial(y):
                    if e <= q:
                        self.degree[e] -= 1
            self.legal_S1_count -= 1

    # ---------- core move ----------
    def play_move(self, x):
        n = self.n
        q = self.q
        status = self.status

        assert status[x] == 0, "attempted to play illegal integer"

        D = [d for d in divisors_trial(x) if status[d] == 0]
        if x < n:
            mult_candidates = np.arange(2 * x, n + 1, x)
            if mult_candidates.size:
                mask = status[mult_candidates] == 0
                M = mult_candidates[mask].tolist()
            else:
                M = []
        else:
            M = []

        # 1) mark x chosen
        self._handle_S1_exit(x)
        status[x] = 1
        self._pool_remove(x)

        # 2) mark D blocked
        for d in D:
            self._handle_S1_exit(d)
            status[d] = 2
            self._pool_remove(d)

        # 3) mark M blocked
        for m in M:
            self._handle_S1_exit(m)
            status[m] = 2
            self._pool_remove(m)

        # 4) small_div_count propagation: for every w in {x}+D+M with w<=q,
        #    decrement small_div_count[p] for currently-legal multiples p of w.
        all_deact = [x] + D + M
        for w in all_deact:
            if w <= q:
                mc = np.arange(w, n + 1, w)
                stat_slice = status[mc]
                live_mask = stat_slice == 0
                if live_mask.any():
                    live_p = mc[live_mask]
                    self.small_div_count[live_p] -= 1

        # 5) legal_pdc propagation + minimal-transition detection: only from D
        q_local = q
        for d in D:
            mc = np.arange(2 * d, n + 1, d)
            if mc.size == 0:
                continue
            stat_slice = status[mc]
            live_mask = stat_slice == 0
            if not live_mask.any():
                continue
            live_m = mc[live_mask]
            self.legal_pdc[live_m] -= 1
            zero_mask = self.legal_pdc[live_m] == 0
            if zero_mask.any():
                newly_min = live_m[zero_mask]
                for m2 in newly_min.tolist():
                    if q_local < m2 <= self.h:
                        # release event: was nonmin, now minimal, still legal
                        self.nonmin_S1_pop -= 1
                        for e in divisors_trial(m2):
                            if e <= q_local:
                                self.degree[e] -= 1
                        self.release_events_total += 1
                        if self._active_flag_this_move:
                            self.release_events_active += 1

        self.T_total += 1

    # ---------- Shortener policy ----------
    def shortener_move(self):
        q = self.q
        status = self.status
        deg = self.degree
        if q >= 2:
            seg = deg[2:q + 1]
            stat_seg = status[2:q + 1]
            masked = np.where(stat_seg == 0, seg, -1)
            degMax = int(masked.max()) if masked.size else -1
        else:
            degMax = -1

        chosen = None
        if degMax > 0:
            cand_idx = np.flatnonzero(masked == degMax) + 2
            cands = cand_idx.tolist()
            if len(cands) == 1:
                chosen = cands[0]
            else:
                if len(cands) <= 300:
                    minimal = []
                    for c in cands:
                        is_min = True
                        for c2 in cands:
                            if c2 != c and c % c2 == 0:
                                is_min = False
                                break
                        if is_min:
                            minimal.append(c)
                    chosen = min(minimal) if minimal else min(cands)
                else:
                    chosen = min(cands)
        if chosen is None:
            # fallback: smallest legal integer overall
            p = self.scan_full.find(status)
            chosen = p
        return chosen, degMax

    # ---------- Prolonger policies ----------
    def prolonger_random(self):
        pool = self.legal_pool
        if not pool:
            return None
        idx = self.rng.randrange(len(pool))
        return pool[idx]

    def prolonger_greedy_block(self):
        n = self.n
        status = self.status
        sdc = self.small_div_count
        seg = sdc[2:n + 1]
        stat_seg = status[2:n + 1]
        masked = np.where(stat_seg == 0, seg, -1)
        best = int(masked.max()) if masked.size else -1
        if best <= 0:
            # no legal integer has a legal small divisor; fall back to smallest legal
            p = self.scan_full.find(status)
            return p
        cand_idx = np.flatnonzero(masked == best) + 2
        return int(cand_idx.min())

    def prolonger_shell_defender(self):
        status = self.status
        if self.legal_S1_count > 0:
            p = self.scan_S1.find(status)
            if p is not None:
                return p
        return self.prolonger_random()

    def prolonger_move(self, policy):
        if policy == "random":
            return self.prolonger_random()
        elif policy == "greedy_block":
            return self.prolonger_greedy_block()
        elif policy == "shell_defender":
            return self.prolonger_shell_defender()
        else:
            raise ValueError(policy)

    # ---------- main loop ----------
    def run(self, prolonger_policy, eta=0.25):
        status = self.status
        turn = 0  # 0 = Prolonger's turn (moves first), 1 = Shortener
        while True:
            if not self.legal_pool:
                break
            pop = self.nonmin_S1_pop
            active = (self.S1_size > 0) and (pop > eta * self.S1_size)
            self._active_flag_this_move = active

            if turn == 0:
                mv = self.prolonger_move(prolonger_policy)
                if mv is None:
                    break
                self.play_move(mv)
            else:
                mv, degval = self.shortener_move()
                if mv is None:
                    break
                if active:
                    self.shortener_turns_active += 1
                    self.degree_ledger_sum += max(degval, 0)
                    if self.spf is not None:
                        nus = self._nu_values(mv)
                        for Y, v in nus.items():
                            self.nu_sums[Y] += v
                    self.greedy_root_count += 1
                self.play_move(mv)

            turn ^= 1

        # sanity: no legal integers remain
        assert not self.legal_pool, "game ended with legal integers remaining"
        assert np.all(self.status[2:self.n + 1] != 0), "unblocked integer at game end"

    def _nu_values(self, g):
        # number of distinct primes <= Y dividing g, for Y in {10,30,100,300}
        spf = self.spf
        factors = set()
        x = g
        while x > 1:
            p = spf[x]
            factors.add(int(p))
            while x % p == 0:
                x //= p
        out = {}
        for Y in (10, 30, 100, 300):
            out[Y] = sum(1 for p in factors if p <= Y)
        return out

    def verify_antichain(self):
        chosen = np.flatnonzero(self.status == 1)
        chosen_set = set(int(v) for v in chosen)
        n = self.n
        for x in chosen_set:
            for d in divisors_trial(x):
                if d in chosen_set:
                    return False, (x, d, "divisor also chosen")
            m = 2 * x
            while m <= n:
                if m in chosen_set:
                    return False, (x, m, "multiple also chosen")
                m += x
        return True, None


def run_one(n, policy, seed, spf):
    g = Game(n, seed)
    g.spf = spf
    t0 = time.time()
    g.run(policy)
    elapsed = time.time() - t0
    ok, viol = g.verify_antichain()
    S1_size = g.S1_size
    result = {
        "n": n,
        "policy": policy,
        "seed": seed,
        "elapsed_sec": round(elapsed, 3),
        "T_total": g.T_total,
        "T_total_over_n": g.T_total / n,
        "active_shortener_turns": g.shortener_turns_active,
        "active_shortener_turns_over_n": g.shortener_turns_active / n,
        "release_events_active": g.release_events_active,
        "release_events_active_over_n": g.release_events_active / n,
        "release_events_total": g.release_events_total,
        "degree_ledger_sum": g.degree_ledger_sum,
        "degree_ledger_sum_over_n": g.degree_ledger_sum / n,
        "greedy_root_count": g.greedy_root_count,
        "nu_sums": dict(g.nu_sums),
        "S1_size": S1_size,
        "antichain_ok": ok,
        "antichain_violation": viol,
    }
    for Y in (10, 30, 100, 300):
        ll = math.log(math.log(Y))
        result[f"nu{Y}_sum_over_n"] = g.nu_sums[Y] / n
        result[f"nu{Y}_sum_over_n_loglogY"] = g.nu_sums[Y] / (n * ll) if ll != 0 else float('nan')
    return result


if __name__ == "__main__":
    ns = [2000, 5000, 10000, 20000, 50000]
    policies = ["random", "greedy_block", "shell_defender"]
    policy_seed_offset = {"random": 1, "greedy_block": 2, "shell_defender": 3}
    seed_base = 20260714000  # fixed base; seed = seed_base + n*10 + policy_offset

    max_n = max(ns)
    print(f"Building SPF sieve up to {max_n}...")
    spf = sieve_spf(max_n)

    results = []
    for n in ns:
        for policy in policies:
            seed = seed_base + n * 10 + policy_seed_offset[policy]
            print(f"Running n={n} policy={policy} seed={seed} ...", flush=True)
            t0 = time.time()
            r = run_one(n, policy, seed, spf)
            print(f"  done in {time.time()-t0:.2f}s  T_total={r['T_total']}  antichain_ok={r['antichain_ok']}", flush=True)
            results.append(r)

    with open("results.json", "w") as f:
        json.dump(results, f, indent=2)
    print("Wrote results.json")

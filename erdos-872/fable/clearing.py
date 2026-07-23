#!/usr/bin/env python3
"""The clearing game (F23.3 abstraction of the erdos-872 defusal race).

W = interior {2..n/2}. Z = top-half composites (n/2, n]; R(z) = proper
divisors >= 2 of z (all lie in W). Alternating, P first:
  P move: delete one live w in W.
  S move: fire one live w in W: w removed AND every pending z with w | z dies.
z banked when R(z) is entirely P-deleted (then unkillable forever).
Score = banked composites (top-half primes are born-banked; counted apart).

Modes:
  exact <n>          alpha-beta on tiny boards (n <= ~26) for ground truth
  sim <n>            greedy sim: P = EDF on prefix-criterion family, S = maxfreq
  crit <n>           just build the criterion family and report its mass
  scan <n1,n2,...>   sim across sizes, report scaling table
"""
import sys, heapq
from math import log

def spf_sieve(n):
    spf = list(range(n + 1))
    for i in range(2, int(n**0.5) + 1):
        if spf[i] == i:
            for j in range(i*i, n + 1, i):
                if spf[j] == j: spf[j] = i
    return spf

def divisors_of(z, spf):
    ds = [1]
    while z > 1:
        p = spf[z]; e = 0
        while z % p == 0: z //= p; e += 1
        ds = [d * p**k for d in ds for k in range(e + 1)]
    return ds

def build(n):
    spf = spf_sieve(n)
    half = n // 2
    Z = []          # (z, R(z) tuple) for composite top-half z
    born = 0        # top-half primes (R empty): auto-banked floor
    for z in range(half + 1, n + 1):
        R = tuple(d for d in divisors_of(z, spf) if 2 <= d <= z // 2)
        if R: Z.append((z, R))
        else: born += 1
    return Z, born, half

# ---------------- exact (tiny) ----------------
def exact(n):
    Z, born, half = build(n)
    Ws = list(range(2, half + 1))
    wi = {w: i for i, w in enumerate(Ws)}
    zR = [sum(1 << wi[d] for d in R) for _, R in Z]
    from functools import lru_cache
    full_w = (1 << len(Ws)) - 1
    @lru_cache(maxsize=None)
    def val(liveW, pend, turn):
        # banked already counted incrementally; count z in pend cleared -> bank now
        bank = 0; p2 = pend
        m = pend
        while m:
            b = m & -m; i = b.bit_length() - 1; m ^= b
            if zR[i] & liveW == 0:
                bank += 1; p2 ^= b
        pend = p2
        if not pend or not liveW:
            return bank
        best = None
        mm = liveW
        while mm:
            b = mm & -mm; j = b.bit_length() - 1; mm ^= b
            if turn == 0:                       # P deletes w_j
                v = bank + val(liveW ^ b, pend, 1)
                if best is None or v > best: best = v
            else:                               # S fires w_j
                kill = 0
                m = pend
                while m:
                    bb = m & -m; i = bb.bit_length() - 1; m ^= bb
                    if zR[i] >> j & 1: kill |= bb
                v = bank + val(liveW ^ b, pend ^ kill, 0)
                if best is None or v < best: best = v
        return best
    full_p = (1 << len(Z)) - 1
    return val(full_w, full_p, 0), born, len(Z)

# ---------------- criterion family ----------------
def criterion_family(n, share=0.5):
    """Greedy Z* whose closure keeps |C ∩ [2..m]| <= share*|W ∩ [2..m]| ∀m."""
    Z, born, half = build(n)
    # order stock by |R| ascending (cheap first), tie by z desc (bigger first)
    Z = sorted(Z, key=lambda t: (len(t[1]), -t[0]))
    inC = bytearray(half + 1)
    # slack(m) = floor(share*(m-1)) - |C ∩ [2..m]|  must stay >= 0 for all m
    # maintain via a fenwick of C-counts; check only at the tau positions we touch
    # simple O(sqrt-ish): keep sorted list of C, binary-search prefix counts.
    import bisect
    Csorted = []
    def ok_after_adding(newds):
        # check slack at every m = each element of C ∪ newds (worst points)
        trial = sorted(set(newds))
        # merge counts: for each candidate m among trial + existing C elements,
        # prefix count = bisect(Csorted, m) + count(trial <= m, not already in C)
        pts = trial + Csorted
        for m in pts:
            cnt = bisect.bisect_right(Csorted, m) + sum(1 for d in trial if d <= m)
            if cnt > share * max(0, m - 1):
                return False
        return True
    fam = []
    for z, R in Z:
        newds = [d for d in R if not inC[d]]
        if not newds:
            fam.append(z); continue
        if ok_after_adding(newds):
            for d in newds:
                inC[d] = 1; bisect.insort(Csorted, d)
            fam.append(z)
    return fam, Csorted, born, len(Z)

# ---------------- greedy sim ----------------
def sim(n, p_policy="edf", s_policy="maxfreq", family=None, verbose=False):
    Z, born, half = build(n)
    zidx = {z: i for i, (z, _) in enumerate(Z)}
    R = [list(r) for _, r in Z]
    z_of = [z for z, _ in Z]
    need = [0] * len(Z)              # live requirement count
    pend = [True] * len(Z)
    liveW = bytearray(half + 1)
    cones = {}                        # w -> list of z-indices with w in R(z)
    for i, r in enumerate(R):
        need[i] = len(r)
        for d in r:
            cones.setdefault(d, []).append(i)
    for w in range(2, half + 1): liveW[w] = 1
    freq = {w: len([i for i in cones.get(w, [])]) for w in range(2, half + 1)}
    heap = [(-freq[w], w) for w in range(2, half + 1) if freq[w] > 0]
    heapq.heapify(heap)
    banked = []
    moves = 0
    # P policy "group": claim the live requirement-vertex maximizing
    # (pending z it advances, weighted by how close each z is to banked):
    # score(w) = sum over pending z ∋ w of 1/2^(need(z)-1)  — completes
    # near-done groups first, values shared vertices.
    def p_pick():
        best, bw = -1.0, None
        for w in range(2, half + 1):
            if not liveW[w]: continue
            s = 0.0
            for i in cones.get(w, []):
                if pend[i]: s += 0.5 ** (need[i] - 1)
            if s > best: best, bw = s, w
        return bw
    while True:
        w = p_pick()
        if w is not None:
            liveW[w] = 0
            for i in cones.get(w, []):
                if pend[i]:
                    need[i] -= 1
                    if need[i] == 0:
                        pend[i] = False; banked.append(z_of[i])
                        for d in R[i]:
                            if liveW[d] and d != w:
                                freq[d] -= 1
                                heapq.heappush(heap, (-freq[d], d))
            freq[w] = 0
        moves += 1
        if not any(pend): break
        # S move: fire max-freq live w
        w = None
        while heap:
            f, cand = heap[0]
            if liveW[cand] and freq.get(cand, 0) == -f and -f > 0: w = cand; break
            heapq.heappop(heap)
        if w is None: break           # nothing worth firing; S idles -> done
        liveW[w] = 0
        for i in list(cones.get(w, [])):
            if pend[i]:
                pend[i] = False       # dies
                for d in R[i]:
                    if liveW[d] and d != w:
                        freq[d] -= 1
                        heapq.heappush(heap, (-freq[d], d))
        freq[w] = 0
        moves += 1
        if not any(pend): break
    return dict(n=n, banked=len(banked), born=born, stock=len(Z),
                fam=0, moves=moves,
                banked_frac=len(banked) / max(1, len(Z)))

if __name__ == "__main__":
    mode = sys.argv[1]
    if mode == "exact":
        n = int(sys.argv[2]); v, born, tot = exact(n)
        print(f"n={n}: optimal banked={v} (+{born} born-free primes) of {tot} composite stock")
    elif mode == "crit":
        n = int(sys.argv[2]); fam, C, born, tot = criterion_family(n)
        print(f"n={n}: criterion family |Z*|={len(fam)} closure={len(C)} "
              f"(+{born} primes) of {tot} stock; frac={len(fam)/tot:.3f}")
    elif mode == "sim":
        n = int(sys.argv[2]); r = sim(n)
        print(r)
    elif mode == "scan":
        for n in map(int, sys.argv[2].split(",")):
            r = sim(n)
            ll = log(log(n))
            print(f"n={n:>8} stock={r['stock']:>7} fam={r['fam']:>7} "
                  f"banked={r['banked']:>7} frac={r['banked_frac']:.4f} "
                  f"banked/(n/ll^1)={r['banked']/(n/ll):.4f} "
                  f"banked/(n/ll^2)={r['banked']/(n/ll**2):.4f}", flush=True)

"""Faster simulator focused on measuring L/n vs n for strong Prolongers."""
from __future__ import annotations

import math
import sys
import time
from sim import sieve, factorize, divisors, block_product_blocks


def run_game_fast(n: int, primes, spf, prolonger_choice, shortener_choice) -> dict:
    legal = bytearray(n + 1)
    for v in range(2, n + 1):
        legal[v] = 1
    played = bytearray(n + 1)
    played_count = 0
    shortener_moves = 0
    prolonger_moves = 0
    shortener_prime_set = set()

    def divisors_of(v):
        divs = [1]
        probe = v
        facs = []
        while probe > 1:
            p = spf[probe]
            e = 0
            while probe % p == 0:
                probe //= p
                e += 1
            facs.append((p, e))
        for p, e in facs:
            newd = []
            pe = 1
            for _ in range(e):
                pe *= p
                for d in divs:
                    newd.append(d * pe)
            divs.extend(newd)
        return [d for d in divs if d >= 2 and d != v]

    def play(v: int):
        nonlocal played_count
        for d in divisors_of(v):
            if legal[d]:
                legal[d] = 0
        m = v
        while m <= n:
            if legal[m]:
                legal[m] = 0
            m += v
        played[v] = 1
        played_count += 1

    p_state = {}
    s_state = {}
    turn = 0
    while True:
        if turn % 2 == 0:
            v = prolonger_choice(legal, played, p_state, n, primes, spf)
            if v is None:
                break
            play(v)
            prolonger_moves += 1
        else:
            v = shortener_choice(legal, played, s_state, n, primes, spf)
            if v is None:
                break
            play(v)
            shortener_moves += 1
            if spf[v] == v:  # v is prime
                shortener_prime_set.add(v)
        turn += 1
    L = played_count
    s_mass = sum(1.0/p for p in shortener_prime_set)
    return {
        "L": L,
        "L/n": L/n,
        "Llogn/n": L * math.log(n) / n,
        "S": shortener_moves,
        "P": prolonger_moves,
        "smass": s_mass,
    }


def shortener_slop(legal, played, state, n, primes, spf):
    idx = state.get("idx", 0)
    while idx < len(primes):
        p = primes[idx]
        if p == 2:
            idx += 1
            continue
        if legal[p]:
            state["idx"] = idx
            return p
        idx += 1
    state["idx"] = idx
    # fallback: any legal
    for v in range(2, n + 1):
        if legal[v]:
            return v
    return None


def make_prolonger_smooth_dense(n, primes, spf):
    """Precompute sorted list by score (sum 1/p over prime factors), descending."""
    candidates = []
    for v in range(2, n + 1):
        probe = v
        score = 0.0
        seen = set()
        while probe > 1:
            p = spf[probe]
            if p not in seen:
                score += 1.0 / p
                seen.add(p)
            probe //= p
        candidates.append((score, -v, v))
    candidates.sort(reverse=True)
    sorted_v = [c[2] for c in candidates]

    def choice(legal, played, state, n_, primes_, spf_):
        idx = state.get("idx", 0)
        while idx < len(sorted_v):
            v = sorted_v[idx]
            idx += 1
            if legal[v]:
                state["idx"] = idx
                return v
        state["idx"] = idx
        return None
    return choice


def make_prolonger_block_product_fast(n, primes, spf):
    blocks = block_product_blocks(n, primes)
    # greedy-descending already
    block_vals = [x for x, _ in blocks]
    def choice(legal, played, state, n_, primes_, spf_):
        idx = state.get("idx", 0)
        while idx < len(block_vals):
            v = block_vals[idx]
            idx += 1
            if v <= n and legal[v]:
                state["idx"] = idx
                return v
        # fallback: largest legal
        for v in range(n, 1, -1):
            if legal[v]:
                return v
        return None
    return choice


def main():
    ns = [int(x) for x in sys.argv[1:]] if len(sys.argv) > 1 else [10000, 30000, 100000, 300000, 1000000]
    print(f"{'n':>8} {'prolonger':>14} {'L':>9} {'L/n':>7} {'Llogn/n':>9} {'L/(V/2 n)':>11} {'time':>7}")
    V_half = 0.22002
    for n in ns:
        primes, spf = sieve(n)
        for pname, pfn_factory in [
            ("block_product", make_prolonger_block_product_fast),
            ("smooth_dense", make_prolonger_smooth_dense),
        ]:
            t0 = time.time()
            pfn = pfn_factory(n, primes, spf)
            r = run_game_fast(n, primes, spf, pfn, shortener_slop)
            dt = time.time() - t0
            ratio = r['L/n'] / V_half
            print(f"{n:>8} {pname:>14} {r['L']:>9} {r['L/n']:>7.4f} {r['Llogn/n']:>9.4f} {ratio:>11.4f} {dt:>6.1f}s")


if __name__ == "__main__":
    main()

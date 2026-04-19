"""Test the fan-hierarchy Prolonger (from the lower bound proof) vs SLOP.

Rank-1 odd fan: targets ab with a odd prime <= n^delta, b prime in (n/(2a), n/a].
Prolonger activates smallest-a-first.

Rank-2 fan: targets acb with a<c odd primes <= n^delta, b prime in (n/(2ac), n/(ac)].
"""
from __future__ import annotations

import math
import sys
import time
from sim import sieve, block_product_blocks
from fast_sim import run_game_fast, shortener_slop, make_prolonger_smooth_dense


def make_prolonger_rank1_fan(n, primes, spf, delta=0.4):
    """Play rank-1 upper-half fan targets ab smallest-a-first."""
    Y = int(n ** delta)
    A = [p for p in primes if 3 <= p <= Y]
    targets = []
    for a in A:
        lo = n // (2 * a)
        hi = n // a
        if lo >= hi:
            continue
        # primes in (lo, hi]
        for b in primes:
            if b <= lo:
                continue
            if b > hi:
                break
            if b == a:
                continue
            t = a * b
            if t > n:
                continue
            targets.append((a, b, t))
    # sort by a first (activation), then by b
    targets.sort(key=lambda x: (x[0], x[1]))

    def choice(legal, played, state, n_, primes_, spf_):
        idx = state.get("idx", 0)
        while idx < len(targets):
            a, b, t = targets[idx]
            idx += 1
            if legal[t]:
                state["idx"] = idx
                return t
        state["idx"] = idx
        # fallback: largest legal
        for v in range(n, 1, -1):
            if legal[v]:
                return v
        return None
    return choice


def make_prolonger_rank2_fan(n, primes, spf, delta=0.3):
    """Play rank-2 fan targets acb smallest-(ac)-first."""
    Y = int(n ** delta)
    A = [p for p in primes if 3 <= p <= Y]
    targets = []
    for i, a in enumerate(A):
        for c in A[i+1:]:
            ac = a * c
            if ac > n // 2:
                continue
            lo = n // (2 * ac)
            hi = n // ac
            if lo >= hi:
                continue
            for b in primes:
                if b <= lo:
                    continue
                if b > hi:
                    break
                if b == a or b == c:
                    continue
                t = ac * b
                if t > n:
                    continue
                targets.append((ac, t))
    # sort by ac, then t
    targets.sort()

    def choice(legal, played, state, n_, primes_, spf_):
        idx = state.get("idx", 0)
        while idx < len(targets):
            ac, t = targets[idx]
            idx += 1
            if legal[t]:
                state["idx"] = idx
                return t
        state["idx"] = idx
        for v in range(n, 1, -1):
            if legal[v]:
                return v
        return None
    return choice


def main():
    ns = [int(x) for x in sys.argv[1:]] if len(sys.argv) > 1 else [10000, 30000, 100000, 300000]
    V_half = 0.22002
    print(f"{'n':>8} {'prolonger':>18} {'L':>9} {'L/n':>7} {'Llogn/n':>9} {'L/(V/2 n)':>11} {'time':>7}")
    for n in ns:
        primes, spf = sieve(n)
        for pname, pfn_factory in [
            ("rank1_fan_d=0.4", lambda np_, sp_: make_prolonger_rank1_fan(n, np_, sp_, 0.4)),
            ("rank1_fan_d=0.3", lambda np_, sp_: make_prolonger_rank1_fan(n, np_, sp_, 0.3)),
            ("rank2_fan_d=0.25", lambda np_, sp_: make_prolonger_rank2_fan(n, np_, sp_, 0.25)),
            ("smooth_dense", lambda np_, sp_: make_prolonger_smooth_dense(n, np_, sp_)),
        ]:
            t0 = time.time()
            pfn = pfn_factory(primes, spf)
            r = run_game_fast(n, primes, spf, pfn, shortener_slop)
            dt = time.time() - t0
            ratio = r['L/n'] / V_half
            print(f"{n:>8} {pname:>18} {r['L']:>9} {r['L/n']:>7.4f} {r['Llogn/n']:>9.4f} {ratio:>11.4f} {dt:>6.1f}s")


if __name__ == "__main__":
    main()

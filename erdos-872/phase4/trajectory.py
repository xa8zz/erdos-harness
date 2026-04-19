"""Clean trajectory measurement of L(n) vs n across strongest Prolongers.

Goal: determine if L is linear, n/log n, or n log log n / log n.
"""
from __future__ import annotations

import math
import sys
import time
from sim import sieve
from fast_sim import run_game_fast, shortener_slop, make_prolonger_smooth_dense
from fan_prolonger import make_prolonger_rank1_fan, make_prolonger_rank2_fan


def make_prolonger_mixed_dense_upper(n, primes, spf):
    """Combine smooth_dense with upper-half preference.
    Score = (sum 1/p) + 1[v > n/2] * 0.5
    """
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
        if v > n // 2:
            score += 0.5
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


def main():
    ns = [int(x) for x in sys.argv[1:]] if len(sys.argv) > 1 else [
        10000, 30000, 100000, 300000, 1000000, 3000000
    ]
    print(f"{'n':>8} {'prolonger':>20} {'L':>10} {'L/n':>7} {'Llogn/n':>9} "
          f"{'Lln/(n loglogn)':>17} {'L/(V/2 n)':>10} {'time':>7}")
    V_half = 0.22002
    for n in ns:
        primes, spf = sieve(n)
        strategies = [
            ("smooth_dense", make_prolonger_smooth_dense),
            ("mixed_dense_upper", make_prolonger_mixed_dense_upper),
        ]
        for pname, pfn_factory in strategies:
            t0 = time.time()
            pfn = pfn_factory(n, primes, spf)
            r = run_game_fast(n, primes, spf, pfn, shortener_slop)
            dt = time.time() - t0
            llogn_n = r['L/n'] * math.log(n)
            lln_nll = r['L'] * math.log(n) / (n * math.log(math.log(n)))
            ratio = r['L/n'] / V_half
            print(f"{n:>8} {pname:>20} {r['L']:>10} {r['L/n']:>7.4f} "
                  f"{llogn_n:>9.4f} {lln_nll:>17.4f} {ratio:>10.4f} {dt:>6.1f}s")


if __name__ == "__main__":
    main()

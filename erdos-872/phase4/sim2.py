"""Extended Shortener strategy comparison.

Strategies tested:
- slop: smallest-legal-odd-prime (baseline)
- semi_T: preemptive semiprimes pq with p,q <= T, then SLOP
- race_large: play largest primes <= n/2 first, then SLOP
- slp_plus_semi: alternate SLOP with semiprime kill
- smart_semi: play semiprime pq for the two smallest UNCAPTURED primes

Against: block-product Prolonger greedy-descending.

Metric: L (total moves), captured mass, and L log n / n.
"""
from __future__ import annotations

import math
from typing import Callable
from sim import (
    Game, sieve, factorize, divisors, block_product_blocks,
    shortener_slop, make_prolonger_block_product, run_game,
)


def make_shortener_semi_T(n: int, T: int) -> Callable[[Game, dict], int | None]:
    """Play all squarefree semiprimes pq (p<q <= T) that are legal.
    Then fall back to SLOP.
    """
    primes_T = []
    primes, _ = sieve(T)
    primes_T = [p for p in primes if 3 <= p <= T]
    semis = []
    for i, p in enumerate(primes_T):
        for q in primes_T[i+1:]:
            if p * q <= n:
                semis.append(p * q)
    semis.sort()

    def fn(g: Game, state: dict) -> int | None:
        idx = state.get("idx", 0)
        while idx < len(semis):
            v = semis[idx]
            idx += 1
            state["idx"] = idx
            if v > g.n or not g.is_legal(v):
                continue
            # verify antichain-legality
            ok = True
            for d in divisors(v, g.spf):
                if g.played[d]:
                    ok = False
                    break
            if not ok:
                continue
            m = v
            while m <= g.n:
                if g.played[m]:
                    ok = False
                    break
                m += v
            if ok:
                return v
        return g.smallest_legal_odd_prime()
    return fn


def make_shortener_smart_semi(n: int, T: int) -> Callable[[Game, dict], int | None]:
    """After each Prolonger move, if it's a composite with primes in [2, T],
    play the smallest semiprime pq with p,q in its support (to force future
    moves with the same primes to avoid this pair). Otherwise, SLOP.
    """
    def fn(g: Game, state: dict) -> int | None:
        # Look at the most recent Prolonger move
        if not g.played_list:
            return g.smallest_legal_odd_prime()
        last_val, last_role = g.played_list[-1]
        if last_role == "P":
            facs = [p for p, e in factorize(last_val, g.spf) if p <= T]
            facs.sort()
            for i, p in enumerate(facs):
                for q in facs[i+1:]:
                    v = p * q
                    if v > g.n or not g.is_legal(v):
                        continue
                    # antichain-legal?
                    ok = True
                    for d in divisors(v, g.spf):
                        if g.played[d]:
                            ok = False
                            break
                    if not ok:
                        continue
                    m = v
                    while m <= g.n:
                        if g.played[m]:
                            ok = False
                            break
                        m += v
                    if ok:
                        return v
        return g.smallest_legal_odd_prime()
    return fn


def make_shortener_race_large(n: int) -> Callable[[Game, dict], int | None]:
    """Play largest legal prime <= n/2 first; then SLOP."""
    primes, _ = sieve(n)
    large = [p for p in reversed(primes) if p <= n // 2]

    def fn(g: Game, state: dict) -> int | None:
        idx = state.get("idx", 0)
        while idx < len(large):
            v = large[idx]
            idx += 1
            state["idx"] = idx
            if g.is_legal(v):
                return v
        return g.smallest_legal_odd_prime()
    return fn


def make_shortener_all_odd_semiprimes_small(n: int) -> Callable[[Game, dict], int | None]:
    """Play every odd semiprime pq with pq <= n^{2/3} first, then SLOP.
    This is the "aggressive semiprime flood."
    """
    cutoff = int(n ** (2/3))
    primes, _ = sieve(int(cutoff ** 0.5) + 1)
    semis = []
    for i, p in enumerate(primes):
        if p == 2:
            continue
        for q in primes[i+1:]:
            if p * q > cutoff or p * q > n:
                break
            semis.append(p * q)
    semis.sort()

    def fn(g: Game, state: dict) -> int | None:
        idx = state.get("idx", 0)
        while idx < len(semis):
            v = semis[idx]
            idx += 1
            state["idx"] = idx
            if v > g.n or not g.is_legal(v):
                continue
            ok = True
            for d in divisors(v, g.spf):
                if g.played[d]:
                    ok = False
                    break
            if not ok:
                continue
            m = v
            while m <= g.n:
                if g.played[m]:
                    ok = False
                    break
                m += v
            if ok:
                return v
        return g.smallest_legal_odd_prime()
    return fn


def main():
    import sys
    ns = [int(x) for x in sys.argv[1:]] if len(sys.argv) > 1 else [1000, 3000, 10000, 30000, 100000]
    print(f"{'n':>7} {'shortener':>28} {'L':>8} {'L/n':>7} {'Llogn/n':>9} {'Smass':>7} {'Pmass':>7}")
    for n in ns:
        primes, _ = sieve(n)
        blocks = block_product_blocks(n, primes)
        prol_fn = make_prolonger_block_product(blocks)
        strategies = [
            ("slop", shortener_slop),
            ("semi_T=n^{1/4}", make_shortener_semi_T(n, int(n**0.25))),
            ("semi_T=n^{1/3}", make_shortener_semi_T(n, int(n**(1/3)))),
            ("smart_semi_T=n^{1/3}", make_shortener_smart_semi(n, int(n**(1/3)))),
            ("race_large", make_shortener_race_large(n)),
            ("all_odd_semi_small", make_shortener_all_odd_semiprimes_small(n)),
        ]
        for name, sfn in strategies:
            r = run_game(n, name, sfn, prol_fn)
            print(f"{n:>7} {name:>28} {r['L']:>8} {r['L_over_n']:>7.4f} {r['L_log_n_over_n']:>9.4f} {r['shortener_mass']:>7.4f} {r['prolonger_mass']:>7.4f}")


if __name__ == "__main__":
    main()

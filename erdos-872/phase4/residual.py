"""Analyze the sieve residual: is the V/2 bound tight against the block-product?

Compute:
- |A| = final antichain size
- K = Shortener prefix length
- |P| = Prolonger moves
- R = residual count (odd integers <= n not divisible by any q in D)
- R_tight = odd integers <= n not div by any q in D AND incomparable with each x in P

Compare R vs (n/2) * prod(1 - 1/q) vs final antichain residual.
"""
from __future__ import annotations

import math
from sim import (
    Game, sieve, factorize, divisors, block_product_blocks,
    shortener_slop, make_prolonger_block_product,
)


def run_and_analyze(n: int):
    primes, spf = sieve(n)
    blocks = block_product_blocks(n, primes)
    prol_fn = make_prolonger_block_product(blocks)

    g = Game.create(n)
    p_state = {}
    s_state = {}
    turn = 0
    D_short = []  # shortener's primes
    P_prol = []   # prolonger's moves
    while True:
        if turn % 2 == 0:
            v = prol_fn(g, p_state)
            if v is None:
                break
            g.play(v, "P")
            P_prol.append(v)
        else:
            v = shortener_slop(g, s_state)
            if v is None:
                break
            g.play(v, "S")
            D_short.append(v)
        turn += 1

    L = len(g.played_list)
    K = len(D_short)
    P_count = len(P_prol)

    # Captured prime set
    D_primes = set(p for p in D_short if all(v == p for v, e in [(p, 0)]) or len(factorize(p, spf)) == 1)
    # Simpler: SLOP only plays primes
    D_primes = set(D_short)
    D_mass = sum(1.0/p for p in D_primes)

    # Residual under prime-only sieve: odd integers <= n not div by any q in D
    residual_prime_sieve = 0
    for m in range(3, n + 1, 2):
        ok = True
        for q in D_primes:
            if m % q == 0:
                ok = False
                break
        if ok:
            residual_prime_sieve += 1

    # Residual tight: also incomparable with each Prolonger move
    # i.e., exclude m that is a multiple of any x in P, or m that is a proper divisor of any x in P
    residual_tight = 0
    P_set = set(P_prol)
    for m in range(3, n + 1, 2):
        ok = True
        for q in D_primes:
            if m % q == 0:
                ok = False
                break
        if not ok:
            continue
        # check incomparable with each x in P
        for x in P_prol:
            # m | x or x | m?
            if m == x:
                ok = False
                break
            if x % m == 0 or m % x == 0:
                ok = False
                break
        if ok:
            residual_tight += 1

    # Theoretical bound (n/2) * prod(1 - 1/q)
    theoretical = (n / 2.0)
    for q in D_primes:
        theoretical *= (1.0 - 1.0 / q)

    return {
        "n": n,
        "L": L,
        "K": K,
        "P_count": P_count,
        "residual_in_A": L - K - P_count,  # remaining antichain elements
        "D_mass": D_mass,
        "residual_prime_sieve": residual_prime_sieve,
        "residual_tight": residual_tight,
        "theoretical_nV_over_2": theoretical,
        "actual/theoretical": (residual_prime_sieve / theoretical) if theoretical > 0 else 0,
    }


def main():
    import sys
    ns = [int(x) for x in sys.argv[1:]] if len(sys.argv) > 1 else [1000, 3000, 10000, 30000]
    print(f"{'n':>7} {'L':>7} {'K':>6} {'|P|':>6} {'resid_A':>8} {'D_mass':>7} {'resid_sieve':>12} {'resid_tight':>12} {'(n/2)*prod':>12}  {'sieve/th':>9}")
    for n in ns:
        r = run_and_analyze(n)
        print(f"{r['n']:>7} {r['L']:>7} {r['K']:>6} {r['P_count']:>6} {r['residual_in_A']:>8} "
              f"{r['D_mass']:>7.4f} {r['residual_prime_sieve']:>12} {r['residual_tight']:>12} "
              f"{r['theoretical_nV_over_2']:>12.1f}  {r['actual/theoretical']:>9.4f}")


if __name__ == "__main__":
    main()

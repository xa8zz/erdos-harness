"""Test multiple Shorteners against the strongest Prolonger (smooth_dense)."""
from __future__ import annotations

import math
import sys
import time
from sim import sieve, factorize, divisors
from fast_sim import run_game_fast, shortener_slop, make_prolonger_smooth_dense


def shortener_slp_full(legal, played, state, n, primes, spf):
    """Smallest legal prime (including 2)."""
    idx = state.get("idx", 0)
    while idx < len(primes):
        p = primes[idx]
        if legal[p]:
            state["idx"] = idx
            return p
        idx += 1
    state["idx"] = idx
    return None


def shortener_smallest_legal(legal, played, state, n, primes, spf):
    """Smallest legal integer, ignoring primeness."""
    start = state.get("ptr", 2)
    while start <= n and not legal[start]:
        start += 1
    if start > n:
        state["ptr"] = start
        return None
    state["ptr"] = start
    return start


def make_shortener_adaptive_semi(n, primes, spf):
    """Play smallest legal odd prime; if Prolonger last played composite c
    with smallest-prime-factor p <= sqrt(n), also consider playing p*q for
    smallest legal odd prime q."""
    def choice(legal, played, state, n_, primes_, spf_):
        return shortener_slop(legal, played, state, n, primes, spf)
    return choice


def make_shortener_semi_then_slop(n, primes, spf):
    """Play semi-primes 3p for each odd prime p <= sqrt(n) first.
    This targets composites with small prime factor 3.
    Then SLOP.
    """
    y = int(n ** 0.5)
    semis = []
    for p in primes:
        if p == 2 or p == 3:
            continue
        if p > y:
            break
        if 3 * p <= n:
            semis.append(3 * p)
    semis.sort()

    def choice(legal, played, state, n_, primes_, spf_):
        idx = state.get("semi_idx", 0)
        while idx < len(semis):
            v = semis[idx]
            idx += 1
            state["semi_idx"] = idx
            if not legal[v]:
                continue
            ok = True
            # antichain-legal
            probe = v
            divs = [1]
            facs = []
            while probe > 1:
                pp = spf[probe]
                e = 0
                while probe % pp == 0:
                    probe //= pp
                    e += 1
                facs.append((pp, e))
            for pp, e in facs:
                nd = []
                pe = 1
                for _ in range(e):
                    pe *= pp
                    for d in divs:
                        nd.append(d * pe)
                divs.extend(nd)
            divs = [d for d in divs if d >= 2 and d != v]
            for d in divs:
                if played[d]:
                    ok = False
                    break
            if not ok:
                continue
            m = v
            while m <= n:
                if played[m]:
                    ok = False
                    break
                m += v
            if ok:
                return v
        return shortener_slop(legal, played, state, n, primes, spf)
    return choice


def shortener_largest_legal_prime(legal, played, state, n, primes, spf):
    """Largest legal prime <= n/2."""
    cap = n // 2
    ptr = state.get("ptr", None)
    if ptr is None:
        # find largest prime <= n/2
        for i in range(len(primes) - 1, -1, -1):
            if primes[i] <= cap:
                ptr = i
                break
        else:
            return None
    while ptr >= 0:
        v = primes[ptr]
        if v == 2:
            ptr -= 1
            continue
        if legal[v]:
            state["ptr"] = ptr - 1
            return v
        ptr -= 1
    state["ptr"] = -1
    # fallback
    return shortener_slop(legal, played, state, n, primes, spf)


def main():
    ns = [int(x) for x in sys.argv[1:]] if len(sys.argv) > 1 else [100000, 300000, 1000000]
    print(f"{'n':>8} {'shortener':>20} {'L':>9} {'L/n':>7} {'Llogn/n':>9} {'time':>7}")
    for n in ns:
        primes, spf = sieve(n)
        pfn = make_prolonger_smooth_dense(n, primes, spf)
        shorteners = [
            ("slop", shortener_slop),
            ("slp_full_incl_2", shortener_slp_full),
            ("smallest_legal", shortener_smallest_legal),
            ("semi_then_slop", make_shortener_semi_then_slop(n, primes, spf)),
            ("largest_legal_prime", shortener_largest_legal_prime),
        ]
        for sname, sfn in shorteners:
            t0 = time.time()
            # re-make Prolonger each time (state)
            pfn_fresh = make_prolonger_smooth_dense(n, primes, spf)
            r = run_game_fast(n, primes, spf, pfn_fresh, sfn)
            dt = time.time() - t0
            print(f"{n:>8} {sname:>20} {r['L']:>9} {r['L/n']:>7.4f} {r['Llogn/n']:>9.4f} {dt:>6.1f}s")


if __name__ == "__main__":
    main()

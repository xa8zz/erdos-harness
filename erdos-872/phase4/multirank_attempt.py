"""Numerical investigation of multi-rank compression candidates.

For each candidate compression pi: A -> S, check if |S| = o(n) over our
sieve-residual universe.

Candidates tested:
- phi_{2}: standard odd-part. |image| ~ V/2 n (Pro's bound).
- phi_{2,3}: 2-3-smooth-strip. Not injective, but fiber-wise bounded.
- phi_{P} for larger P.
- Entropy/DTK-chain-per-fiber.
"""
from __future__ import annotations

import math
import sys
from functools import lru_cache
from sim import sieve, factorize, divisors, block_product_blocks
from fast_sim import run_game_fast, shortener_slop, make_prolonger_smooth_dense


def max_antichain_23_smooth(N: int) -> int:
    """Max antichain in {(a,b) : 2^a 3^b <= N} under componentwise order."""
    if N < 2:
        return 1 if N >= 1 else 0
    # enumerate all (a, b) and find max level
    points = []
    a = 0
    while 2 ** a <= N:
        b = 0
        while (2 ** a) * (3 ** b) <= N:
            points.append((a, b))
            b += 1
        a += 1
    # max antichain: Dilworth. Brute force bipartite matching
    # since #points = O(log^2 N), feasible.
    n_pts = len(points)
    if n_pts == 0:
        return 0
    # divisibility edges: (a1,b1) -> (a2,b2) if a1<=a2 and b1<=b2 and (a1,b1) != (a2,b2)
    adj = [[] for _ in range(n_pts)]
    for i, (a1, b1) in enumerate(points):
        for j, (a2, b2) in enumerate(points):
            if i == j:
                continue
            if a1 <= a2 and b1 <= b2:
                adj[i].append(j)
    # max matching on bipartite graph
    match = [-1] * n_pts
    def try_match(u, visited):
        for v in adj[u]:
            if visited[v]:
                continue
            visited[v] = True
            if match[v] == -1 or try_match(match[v], visited):
                match[v] = u
                return True
        return False
    m = 0
    for u in range(n_pts):
        visited = [False] * n_pts
        if try_match(u, visited):
            m += 1
    return n_pts - m


def max_antichain_P_smooth(N: int, primes_P: tuple[int, ...]) -> int:
    """Max antichain in P-smooth integers <= N under divisibility."""
    if N < 2:
        return 1 if N >= 1 else 0
    # enumerate all P-smooth integers <= N
    smooth = set([1])
    added = True
    while added:
        added = False
        new = set()
        for s in smooth:
            for p in primes_P:
                ns = s * p
                if ns <= N and ns not in smooth:
                    new.add(ns)
        if new:
            smooth |= new
            added = True
    elements = sorted(smooth - {1})
    n_pts = len(elements)
    if n_pts == 0:
        return 0
    # build comparability
    adj = [[] for _ in range(n_pts)]
    for i, x in enumerate(elements):
        for j in range(i + 1, n_pts):
            y = elements[j]
            if y % x == 0:
                adj[i].append(j)
    match = [-1] * n_pts
    def try_match(u, visited):
        for v in adj[u]:
            if visited[v]:
                continue
            visited[v] = True
            if match[v] == -1 or try_match(match[v], visited):
                match[v] = u
                return True
        return False
    m = 0
    for u in range(n_pts):
        visited = [False] * n_pts
        if try_match(u, visited):
            m += 1
    return n_pts - m


def bound_via_multi_pivot(n: int, pivot: tuple[int, ...], D: set[int]) -> dict:
    """Compute |A| <= sum_m (max antichain in pivot^{-1}(m) ∩ [1,n])
    for m coprime to pivot ∪ D.
    """
    pivot_primes = set(pivot)
    forbidden = pivot_primes | D
    # enumerate m: coprime to forbidden, m <= n
    primes_pi = sorted(pivot)
    total_bound = 0
    total_residual_count = 0
    # iterate m
    for m in range(1, n + 1):
        if any(m % p == 0 for p in forbidden):
            continue
        N = n // m
        if N < 1:
            continue
        ac = max_antichain_P_smooth(N, pivot)
        total_bound += ac
        # fiber size
        # count P-smooth <= N
        smooth_count = 0
        stack = [(1,)]
        seen = {1}
        while stack:
            s = stack.pop()[0]
            smooth_count += 1
            for p in pivot:
                ns = s * p
                if ns <= N and ns not in seen:
                    seen.add(ns)
                    stack.append((ns,))
        total_residual_count += smooth_count
    return {
        "n": n,
        "pivot": pivot,
        "|D|": len(D),
        "|A|_bound": total_bound,
        "|A|_bound/n": total_bound / n,
        "residual_count": total_residual_count,
    }


def compute_D_for_game(n: int) -> set[int]:
    primes, spf = sieve(n)
    prol_fn = make_prolonger_smooth_dense(n, primes, spf)
    # run game
    legal = bytearray(n + 1)
    for v in range(2, n + 1):
        legal[v] = 1
    played = bytearray(n + 1)
    D = set()
    p_state = {}
    s_state = {}
    turn = 0
    while True:
        if turn % 2 == 0:
            v = prol_fn(legal, played, p_state, n, primes, spf)
        else:
            v = shortener_slop(legal, played, s_state, n, primes, spf)
        if v is None:
            break
        # play
        for d in divisors(v, spf):
            if legal[d]:
                legal[d] = 0
        m = v
        while m <= n:
            if legal[m]:
                legal[m] = 0
            m += v
        played[v] = 1
        if turn % 2 == 1 and spf[v] == v:
            D.add(v)
        turn += 1
    return D


def main():
    ns = [int(x) for x in sys.argv[1:]] if len(sys.argv) > 1 else [500, 1000, 3000]
    for n in ns:
        print(f"\nn={n}")
        D = compute_D_for_game(n)
        print(f"  |D| = {len(D)}")
        # pivot = {}  (just sieve via D, Pro's bound)
        r_single = bound_via_multi_pivot(n, (2,), D)
        print(f"  phi_{{2}}: |A| bound = {r_single['|A|_bound']:>7d}  = {r_single['|A|_bound']/n:.4f}*n")
        # pivot = {2, 3}
        r_23 = bound_via_multi_pivot(n, (2, 3), D)
        print(f"  phi_{{2,3}}: |A| bound = {r_23['|A|_bound']:>7d}  = {r_23['|A|_bound']/n:.4f}*n")
        # pivot = {2, 3, 5}
        r_235 = bound_via_multi_pivot(n, (2, 3, 5), D)
        print(f"  phi_{{2,3,5}}: |A| bound = {r_235['|A|_bound']:>7d}  = {r_235['|A|_bound']/n:.4f}*n")


if __name__ == "__main__":
    main()

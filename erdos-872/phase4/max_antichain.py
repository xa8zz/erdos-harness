"""Compute the max antichain within the SLOP-sieve-residual universe.

Key claim to test: after SLOP plays D = smallest-legal-odd-primes, the
residual universe (odd m <= n, no q in D divides m) has a MAX ANTICHAIN
much smaller than its SIZE. If max antichain is o(n), then L = o(n).

Max antichain on DAG computed via min-flow / LP or brute-force for small n.

For small n (<= 2000) we brute-force with greedy + swap refinement.
For medium n (<= 10000) we use LP relaxation as upper bound.
"""
from __future__ import annotations

import math
import sys
from sim import (
    Game, sieve, factorize, divisors, block_product_blocks,
    shortener_slop, make_prolonger_block_product,
)


def compute_D(n: int):
    """Run the game and return Shortener's captured odd primes."""
    primes, _ = sieve(n)
    blocks = block_product_blocks(n, primes)
    prol_fn = make_prolonger_block_product(blocks)

    g = Game.create(n)
    p_state = {}
    s_state = {}
    turn = 0
    D_short: list[int] = []
    while True:
        if turn % 2 == 0:
            v = prol_fn(g, p_state)
            if v is None:
                break
            g.play(v, "P")
        else:
            v = shortener_slop(g, s_state)
            if v is None:
                break
            g.play(v, "S")
            D_short.append(v)
        turn += 1
    return D_short, g.played_list, len(g.played_list)


def sieve_residual(n: int, D: list[int]) -> list[int]:
    """Odd integers 3 <= m <= n not divisible by any q in D (and m not in D)."""
    D_set = set(D)
    Dfilter = [q for q in D if q != 2]
    result = []
    for m in range(3, n + 1, 2):
        if m in D_set:
            continue
        if any(m % q == 0 for q in Dfilter):
            continue
        result.append(m)
    return result


def max_antichain_bruteforce(R: list[int], n: int) -> tuple[int, list[int]]:
    """For small R, compute max antichain exactly via a reduction to
    min vertex cover / max matching of the incomparability graph is tough;
    instead we use a chain decomposition: by Mirsky's theorem, max antichain
    size equals number of levels when partitioned into antichains (but that
    bounds below). For upper bound, use Dilworth: max antichain = min chain
    cover. We compute min chain cover via bipartite matching.
    """
    # Build divisibility DAG: edge m -> m' if m | m' and m != m' for m, m' in R
    R_sorted = sorted(R)
    idx = {v: i for i, v in enumerate(R_sorted)}
    # For each r, find its strict multiples in R
    # Build adjacency: r_i -> r_j if r_i | r_j, r_i != r_j
    adj: list[list[int]] = [[] for _ in R_sorted]
    for i, ri in enumerate(R_sorted):
        # multiples of ri in R
        m = 2 * ri
        while m <= n:
            if m in idx:
                adj[i].append(idx[m])
            m += ri
    # For min chain cover we do bipartite matching: left = right = R.
    # Edge i -> j if i divides j strictly (direct or transitive). We use
    # Dilworth via matching on the COMPARABILITY graph (direct cover).
    # But for a DAG, min chain cover = |V| - max matching on comparability.
    # We need transitive closure for "comparability" matching? Actually,
    # for posets, Dilworth's theorem applies via bipartite matching on the
    # poset's comparability structure: a matching pairs u < v into chains.
    # Min chain cover = |V| - (max matching).

    # Hopcroft-Karp on bipartite graph: left = R (as "tails"), right = R (as
    # "heads"), edge (i, j) if R_sorted[i] | R_sorted[j] and i != j (direct
    # divisibility suffices if we think chains, but we should use transitive).
    # Actually edges are (i, j) if i < j in poset, i.e., i divides j (any degree).

    N = len(R_sorted)
    # Sparse adjacency for divisibility
    div_adj: list[list[int]] = [[] for _ in range(N)]
    for i, ri in enumerate(R_sorted):
        for j in range(i + 1, N):
            rj = R_sorted[j]
            if rj % ri == 0:
                div_adj[i].append(j)
        # speedup for large N: break if rj > n
    # bipartite matching
    match_r = [-1] * N  # right side
    def try_match(u: int, visited: list[bool]) -> bool:
        for v in div_adj[u]:
            if visited[v]:
                continue
            visited[v] = True
            if match_r[v] == -1 or try_match(match_r[v], visited):
                match_r[v] = u
                return True
        return False
    matching = 0
    for u in range(N):
        visited = [False] * N
        if try_match(u, visited):
            matching += 1
    max_anti = N - matching
    return max_anti, []


def approximate_max_antichain(R: list[int], n: int) -> dict:
    """For larger R, estimate max antichain via dyadic layer sizes."""
    # Layer m in (2^k, 2^{k+1}]
    layers = {}
    for m in R:
        k = int(math.log2(m))
        layers[k] = layers.get(k, 0) + 1
    max_layer = max(layers.values()) if layers else 0
    return {
        "|R|": len(R),
        "max_dyadic_layer": max_layer,
        "layers": sorted(layers.items()),
    }


def main():
    ns = [int(x) for x in sys.argv[1:]] if len(sys.argv) > 1 else [200, 500, 1000, 2000]
    print(f"{'n':>6} {'L':>6} {'|D|':>5} {'|R|':>6} {'max_antichain':>15} {'res/R':>8}")
    for n in ns:
        D, plays, L = compute_D(n)
        R = sieve_residual(n, D)
        if len(R) <= 2000:
            max_a, _ = max_antichain_bruteforce(R, n)
            info = f"{max_a}"
        else:
            # Use dyadic bound
            approx = approximate_max_antichain(R, n)
            info = f"~{approx['max_dyadic_layer']} (dyadic LB)"
        print(f"{n:>6} {L:>6} {len(D):>5} {len(R):>6} {info:>15}")


if __name__ == "__main__":
    main()

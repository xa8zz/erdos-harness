"""Test stronger Prolonger strategies against SLOP.

The question: how close does the actual L get to the (V/2)*n bound?

Strategies tested:
- block_product (baseline, existing)
- largest_legal: always play the largest legal integer
- upper_half: play elements in (n/2, n] in decreasing order (max antichain region)
- max_antichain_prol: compute max antichain in current residual, play from it
- adaptive: play move maximizing residual max-antichain potential
"""
from __future__ import annotations

import math
from typing import Callable
from sim import (
    Game, sieve, factorize, divisors, block_product_blocks,
    shortener_slop, make_prolonger_block_product, run_game,
)


def make_prolonger_largest(n: int) -> Callable[[Game, dict], int | None]:
    """Play largest legal integer at each turn."""
    def fn(g: Game, state: dict) -> int | None:
        for v in range(g.n, 1, -1):
            if g.legal[v]:
                return v
        return None
    return fn


def make_prolonger_upper_half(n: int) -> Callable[[Game, dict], int | None]:
    """Play elements in (n/2, n] first (descending), then largest-legal."""
    def fn(g: Game, state: dict) -> int | None:
        # upper half first
        for v in range(g.n, g.n // 2, -1):
            if g.legal[v]:
                return v
        # fallback: largest legal
        for v in range(g.n // 2, 1, -1):
            if g.legal[v]:
                return v
        return None
    return fn


def make_prolonger_smooth_dense(n: int) -> Callable[[Game, dict], int | None]:
    """Play elements with MANY small prime factors (to efficiently block them)."""
    primes, spf = sieve(n)
    # score each integer by sum 1/p over its prime factors
    candidates = []
    for v in range(2, n + 1):
        facs = [p for p, e in factorize(v, spf)]
        score = sum(1.0 / p for p in facs)
        candidates.append((score, -v, v))  # higher score first, tie-break by larger v
    candidates.sort(reverse=True)

    def fn(g: Game, state: dict) -> int | None:
        idx = state.get("idx", 0)
        while idx < len(candidates):
            _, _, v = candidates[idx]
            idx += 1
            if g.legal[v]:
                state["idx"] = idx
                return v
            state["idx"] = idx
        return None
    return fn


def run_game_nofall(n: int, shortener_name: str, shortener_fn,
                    prolonger_fn) -> dict:
    g = Game.create(n)
    p_state = {}
    s_state = {}
    turn = 0
    prolonger_moves: list[int] = []
    shortener_moves: list[int] = []
    while True:
        if turn % 2 == 0:
            v = prolonger_fn(g, p_state)
            if v is None:
                break
            g.play(v, "P")
            prolonger_moves.append(v)
        else:
            v = shortener_fn(g, s_state)
            if v is None:
                break
            g.play(v, "S")
            shortener_moves.append(v)
        turn += 1

    L = len(g.played_list)
    B_short = set()
    for v in shortener_moves:
        for p, _ in factorize(v, g.spf):
            B_short.add(p)
    s_mass = sum(1.0 / p for p in B_short)
    return {
        "n": n,
        "shortener": shortener_name,
        "L": L,
        "L/n": L / n,
        "Llogn/n": L * math.log(n) / n,
        "S_moves": len(shortener_moves),
        "P_moves": len(prolonger_moves),
        "s_mass": s_mass,
    }


def main():
    import sys
    ns = [int(x) for x in sys.argv[1:]] if len(sys.argv) > 1 else [1000, 3000, 10000, 30000, 100000]
    print(f"{'n':>7} {'prolonger':>22} {'L':>8} {'L/n':>7} {'Llogn/n':>9} {'Smass':>7} {'Pm':>6}")
    for n in ns:
        primes, _ = sieve(n)
        blocks = block_product_blocks(n, primes)
        strategies = [
            ("block_product", make_prolonger_block_product(blocks)),
            ("largest_legal", make_prolonger_largest(n)),
            ("upper_half", make_prolonger_upper_half(n)),
            ("smooth_dense", make_prolonger_smooth_dense(n)),
        ]
        for name, pfn in strategies:
            r = run_game_nofall(n, "slop", shortener_slop, pfn)
            print(f"{n:>7} {name:>22} {r['L']:>8} {r['L/n']:>7.4f} {r['Llogn/n']:>9.4f} {r['s_mass']:>7.4f} {r['P_moves']:>6}")


if __name__ == "__main__":
    main()

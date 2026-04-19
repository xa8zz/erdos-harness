"""Simple, fast simulator for the divisibility-antichain game.

Goal: quickly probe Shortener strategies against the universal block-product
Prolonger counter. Measure L(n), captured prime-reciprocal mass, odd-part
residual sizes, and other diagnostics to guide sharpening the upper bound
below 0.22n.

Design:
- `Game(n)` maintains the antichain state efficiently.
- Prolonger: block-product greedy-descending (the binding adversary per the
  dossier). Constructs coprime blocks with primes <= n^{1/3}, each block's
  product just exceeds sqrt(n). Greedy-descending by reciprocal mass.
- Shortener strategies (pluggable):
    * smallest_legal_odd_prime (baseline)
    * adaptive_hijacker: plays Prolonger's anticipated first block-product
      x_1 = prod primes >= sqrt(n), then falls back to smallest-legal-odd-prime
    * large_prime_race: plays largest primes first
    * hybrid_C: alternates SLOP with periodic block-product hijacks
"""
from __future__ import annotations

import math
from dataclasses import dataclass, field
from typing import Callable

# --- number-theory helpers ---

def sieve(n: int) -> tuple[list[int], list[int]]:
    """Return (primes up to n, smallest-prime-factor array of length n+1)."""
    spf = list(range(n + 1))
    for p in range(2, int(n**0.5) + 1):
        if spf[p] == p:
            for q in range(p * p, n + 1, p):
                if spf[q] == q:
                    spf[q] = p
    primes = [i for i in range(2, n + 1) if spf[i] == i]
    return primes, spf


def factorize(x: int, spf: list[int]) -> list[tuple[int, int]]:
    """Return list of (prime, exponent) pairs."""
    out: list[tuple[int, int]] = []
    while x > 1:
        p = spf[x]
        e = 0
        while x % p == 0:
            x //= p
            e += 1
        out.append((p, e))
    return out


def divisors(x: int, spf: list[int]) -> list[int]:
    """All divisors of x >= 2."""
    divs = [1]
    for p, e in factorize(x, spf):
        new = []
        pe = 1
        for _ in range(e):
            pe *= p
            for d in divs:
                new.append(d * pe)
        divs.extend(new)
    divs.sort()
    return [d for d in divs if d >= 2]


# --- block-product Prolonger construction ---

def block_product_blocks(n: int, primes: list[int]) -> list[tuple[int, tuple[int, ...]]]:
    """Build Prolonger's block-products greedy-descending by reciprocal mass.

    Partition primes <= n^{1/3} greedily into disjoint S_1, ..., S_r,
    filling each block until its product just exceeds sqrt(n). Each block
    is <= n^{5/6}. Sort blocks by decreasing reciprocal sum.
    """
    y = int(n ** (1/3))
    sqrt_n = int(n ** 0.5)
    n_max = int(n ** (5/6)) + 1
    small_primes = [p for p in primes if 3 <= p <= y]  # skip 2 (antichain)
    blocks: list[tuple[int, tuple[int, ...]]] = []
    i = 0
    while i < len(small_primes):
        prod = 1
        members = []
        while i < len(small_primes):
            p = small_primes[i]
            if prod * p > n_max:
                i += 1
                continue
            if prod * p > sqrt_n and prod >= 1:
                # Crossing sqrt_n with this prime finishes the block
                prod *= p
                members.append(p)
                i += 1
                break
            prod *= p
            members.append(p)
            i += 1
        if members:
            blocks.append((prod, tuple(members)))
    blocks.sort(key=lambda b: -sum(1.0 / p for p in b[1]))
    return blocks


# --- game state ---

@dataclass
class Game:
    n: int
    primes: list[int] = field(default_factory=list)
    spf: list[int] = field(default_factory=list)
    legal: bytearray = field(default_factory=bytearray)
    played: bytearray = field(default_factory=bytearray)
    played_list: list[tuple[int, str]] = field(default_factory=list)  # (value, role)

    @classmethod
    def create(cls, n: int) -> "Game":
        primes, spf = sieve(n)
        legal = bytearray(n + 1)
        for v in range(2, n + 1):
            legal[v] = 1
        return cls(n=n, primes=primes, spf=spf, legal=legal, played=bytearray(n + 1))

    def is_legal(self, v: int) -> bool:
        return 2 <= v <= self.n and bool(self.legal[v])

    def play(self, v: int, role: str) -> None:
        if not self.is_legal(v):
            raise ValueError(f"illegal move {v}")
        # invalidate all multiples and divisors
        for d in divisors(v, self.spf):
            if self.legal[d]:
                self.legal[d] = 0
        m = v
        while m <= self.n:
            if self.legal[m]:
                self.legal[m] = 0
            m += v
        self.played[v] = 1
        self.played_list.append((v, role))

    def smallest_legal_odd_prime(self) -> int | None:
        for p in self.primes:
            if p == 2:
                continue
            if self.legal[p]:
                return p
        return None

    def smallest_legal_prime(self) -> int | None:
        for p in self.primes:
            if self.legal[p]:
                return p
        return None

    def largest_legal_prime_below(self, cap: int) -> int | None:
        # linear scan for simplicity at this scale
        for p in reversed(self.primes):
            if p > cap:
                continue
            if self.legal[p]:
                return p
        return None


# --- Shortener strategies ---

ShortenerFn = Callable[[Game, dict], int | None]

def shortener_slop(g: Game, state: dict) -> int | None:
    return g.smallest_legal_odd_prime()

def shortener_slp(g: Game, state: dict) -> int | None:
    return g.smallest_legal_prime()

def make_shortener_hijacker(blocks: list[tuple[int, tuple[int, ...]]], k: int) -> ShortenerFn:
    """Shortener first plays the first k block-products (if legal),
    then falls back to smallest-legal-odd-prime."""
    def fn(g: Game, state: dict) -> int | None:
        idx = state.get("hijack_idx", 0)
        while idx < min(k, len(blocks)):
            x, members = blocks[idx]
            idx += 1
            state["hijack_idx"] = idx
            if x <= g.n and g.is_legal(x):
                # also make sure it's antichain-legal: divisors/multiples not played
                ok = True
                for d in divisors(x, g.spf):
                    if g.played[d]:
                        ok = False
                        break
                if ok:
                    mm = x
                    while mm <= g.n:
                        if g.played[mm]:
                            ok = False
                            break
                        mm += x
                if ok:
                    return x
        return g.smallest_legal_odd_prime()
    return fn

def shortener_large_first(g: Game, state: dict) -> int | None:
    # play the largest legal prime <= n/2
    cap = g.n // 2
    return g.largest_legal_prime_below(cap)


# --- Prolonger: block-product greedy-descending ---

def make_prolonger_block_product(blocks: list[tuple[int, tuple[int, ...]]]) -> Callable[[Game, dict], int | None]:
    """Play block-products in greedy-descending reciprocal-mass order.
    After blocks exhausted, play smallest legal integer."""
    def fn(g: Game, state: dict) -> int | None:
        idx = state.get("prol_idx", 0)
        while idx < len(blocks):
            x, members = blocks[idx]
            idx += 1
            state["prol_idx"] = idx
            if x <= g.n and g.is_legal(x):
                # antichain legality check
                ok = True
                for d in divisors(x, g.spf):
                    if g.played[d]:
                        ok = False
                        break
                if not ok:
                    continue
                mm = x
                while mm <= g.n:
                    if g.played[mm]:
                        ok = False
                        break
                    mm += x
                if ok:
                    return x
        # fallback: smallest legal
        for v in range(2, g.n + 1):
            if g.legal[v]:
                return v
        return None
    return fn


# --- run a game ---

def run_game(n: int, shortener_name: str, shortener_fn: ShortenerFn,
             prolonger_fn: Callable[[Game, dict], int | None]) -> dict:
    g = Game.create(n)
    p_state: dict = {}
    s_state: dict = {}
    turn = 0
    prolonger_moves: list[int] = []
    shortener_moves: list[int] = []
    while True:
        if turn % 2 == 0:
            # Prolonger
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

    # diagnostics
    L = len(g.played_list)
    # Captured prime mass by Shortener
    B_short = set()
    for v in shortener_moves:
        for p, _ in factorize(v, g.spf):
            B_short.add(p)
    # Blocked primes by Prolonger
    B_prol = set()
    for v in prolonger_moves:
        for p, _ in factorize(v, g.spf):
            B_prol.add(p)
    s_mass = sum(1.0 / p for p in B_short)
    p_mass = sum(1.0 / p for p in B_prol)
    # Residual: odd integers <= n not divisible by any captured Shortener prime
    # (rough proxy for the sieve residual, excluding the full divisibility structure)
    odd_residual = 0
    for v in range(3, n + 1, 2):
        ok = True
        for p in B_short:
            if v % p == 0:
                ok = False
                break
        if ok:
            odd_residual += 1
    return {
        "n": n,
        "shortener": shortener_name,
        "L": L,
        "L_over_n": L / n,
        "L_log_n_over_n": L * math.log(n) / n,
        "shortener_moves": len(shortener_moves),
        "prolonger_moves": len(prolonger_moves),
        "shortener_mass": s_mass,
        "prolonger_mass": p_mass,
        "odd_sieve_residual": odd_residual,
        "odd_residual_over_half_n": odd_residual / (n / 2),
    }


def main():
    import sys
    ns = [int(x) for x in sys.argv[1:]] if len(sys.argv) > 1 else [1000, 3000, 10000, 30000, 100000]
    print(f"{'n':>7} {'shortener':>24} {'L':>8} {'L/n':>7} {'Llogn/n':>9} {'Smass':>7} {'Pmass':>7} {'resid':>8} {'resid/0.5n':>11}")
    for n in ns:
        primes, spf = sieve(n)
        blocks = block_product_blocks(n, primes)
        prol_fn = make_prolonger_block_product(blocks)
        for name, sfn in [
            ("slop", shortener_slop),
            ("hijack_k=1", make_shortener_hijacker(blocks, 1)),
            ("hijack_k=3", make_shortener_hijacker(blocks, 3)),
            ("hijack_k=all", make_shortener_hijacker(blocks, len(blocks))),
        ]:
            r = run_game(n, name, sfn, prol_fn)
            print(f"{n:>7} {name:>24} {r['L']:>8} {r['L_over_n']:>7.4f} {r['L_log_n_over_n']:>9.4f} {r['shortener_mass']:>7.4f} {r['prolonger_mass']:>7.4f} {r['odd_sieve_residual']:>8} {r['odd_residual_over_half_n']:>11.4f}")


if __name__ == "__main__":
    main()

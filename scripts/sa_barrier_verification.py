#!/usr/bin/env python3
"""Exact checks for the Section 8 Sherali-Adams barrier.

This reproduces the finite sanity checks from
erdos-872/researcher-58-pro-R52-integrality-barrier-audit-confirmed-sharpened.md.
It verifies, by exhaustive enumeration for N <= 7, that the product
Bernoulli pseudo-solution with p = 1 / (ell - r) satisfies every lifted
literal-cover constraint.
"""

from __future__ import annotations

import math
from fractions import Fraction
from itertools import combinations


def log_binom(n: int, k: int) -> float:
    return math.lgamma(n + 1) - math.lgamma(k + 1) - math.lgamma(n - k + 1)


def numerical_table(alpha: float = 0.25) -> None:
    print("alpha =", alpha)
    print("N ell q -log(delta) log_s_draft_approx ratio_to_(N/logN)")
    for n in [1000, 5000, 10000]:
        ell = math.floor(n / math.log(n))
        q = math.floor(alpha * n)
        neg_log_delta = log_binom(n, ell) - log_binom(n - q, ell)
        log_s_draft_approx = math.log(2 * log_binom(n, q)) + neg_log_delta
        ratio = neg_log_delta / (n / math.log(n))
        print(
            n,
            ell,
            q,
            f"{neg_log_delta:.12f}",
            f"{log_s_draft_approx:.12f}",
            f"{ratio:.12f}",
        )


def check_counting_identity() -> None:
    print("counting identity checks:")
    for n, ell, q in [(8, 3, 2), (10, 4, 3), (12, 5, 4)]:
        left = math.comb(n, ell) * math.comb(n - ell, q)
        right = math.comb(n, q) * math.comb(n - q, ell)
        print((n, ell, q), left == right, left, right)


def all_subsets(n: int, max_size: int):
    for k in range(max_size + 1):
        yield from (frozenset(comb) for comb in combinations(range(n), k))


def expectation_cover_literal(
    n: int,
    ell: int,
    r: int,
    c_set: frozenset[int],
    i_set: frozenset[int],
    j_set: frozenset[int],
) -> Fraction:
    """Return E[(sum_{u in C} x_u - 1) L_{I,J}(x)] exactly."""

    p = Fraction(1, ell - r)
    expval = Fraction(0, 1)
    for mask in range(1 << n):
        ones = mask.bit_count()
        prob = (p**ones) * ((1 - p) ** (n - ones))
        literal = all((mask >> i) & 1 for i in i_set) and all(
            not ((mask >> j) & 1) for j in j_set
        )
        if literal:
            expval += prob * (sum((mask >> c) & 1 for c in c_set) - 1)
    return expval


def brute_verify_sa(max_n: int = 7):
    total = 0
    worst = None
    for n in range(1, max_n + 1):
        subsets_by_size = {k: list(combinations(range(n), k)) for k in range(n + 1)}
        subset_cache = {k: list(all_subsets(n, k)) for k in range(n + 1)}
        for ell in range(1, n + 1):
            for r in range(0, ell):
                for c_tuple in subsets_by_size[ell]:
                    c_set = frozenset(c_tuple)
                    for i_set in subset_cache[r]:
                        remaining = [x for x in range(n) if x not in i_set]
                        for b in range(r - len(i_set) + 1):
                            for j_tuple in combinations(remaining, b):
                                j_set = frozenset(j_tuple)
                                expval = expectation_cover_literal(
                                    n, ell, r, c_set, i_set, j_set
                                )
                                total += 1
                                if expval < 0:
                                    return False, total, (
                                        n,
                                        ell,
                                        r,
                                        c_set,
                                        i_set,
                                        j_set,
                                        expval,
                                    )
                                if worst is None or expval < worst[-1]:
                                    worst = (n, ell, r, c_set, i_set, j_set, expval)
    return True, total, worst


def main() -> None:
    numerical_table()
    print()
    check_counting_identity()
    print()
    ok, total, worst = brute_verify_sa(7)
    print("SA exhaustive check through N=7:", ok)
    print("literal-cover constraints checked:", total)
    print("minimum expectation found:", worst[-1])
    print("minimum attained at (N, ell, r, C, I, J):", worst[:-1])
    print()
    n, ell, r = 100, 21, 20
    draft_m = math.ceil(r + n / (ell - r))
    print(
        "Draft fixed-cardinality M example:",
        {"N": n, "ell": ell, "r": r, "ceil(r+N/(ell-r))": draft_m, "M<=N": draft_m <= n},
    )
    print("Sharper product objective N/(ell-r):", n / (ell - r))


if __name__ == "__main__":
    main()

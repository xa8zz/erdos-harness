#!/usr/bin/env python3
"""Extract 4-root q=2 pair-column matrices from order-6 K4^3 moments."""

from __future__ import annotations

import argparse
import math
import sys
from collections import defaultdict
from fractions import Fraction
from itertools import permutations
from pathlib import Path

SCRIPT_DIR = Path(__file__).resolve().parent
if str(SCRIPT_DIR) not in sys.path:
    sys.path.insert(0, str(SCRIPT_DIR))

from build_4root_alphabet import PAIR_ORDER, ROOT_TYPES, build_alphabet  # noqa: E402
from de_finetti_utils import (  # noqa: E402
    canonical_edge,
    frac_to_str,
    is_k4_free,
    load_json,
    parse_type_record,
    write_json,
)


def parse_records(payload: dict) -> list[tuple[int, set[tuple[int, int, int]], Fraction]]:
    records = payload.get("types", [])
    moments = payload.get("pseudo_moments", [])
    parsed: list[tuple[int, set[tuple[int, int, int]], Fraction]] = []
    for i, record in enumerate(records):
        if isinstance(record, dict) and "moment" not in record and i < len(moments):
            record = dict(record)
            record["moment"] = moments[i]
        parsed.append(parse_type_record(record))
    return parsed


def induced_root_edges(edges: set[tuple[int, int, int]], roots: tuple[int, int, int, int]) -> set[tuple[int, int, int]]:
    root_index = {vertex: i for i, vertex in enumerate(roots)}
    induced = set()
    for edge in permutations(range(4), 3):
        if edge != tuple(sorted(edge)):
            continue
        actual = canonical_edge(roots[i] for i in edge)
        if actual in edges:
            induced.add(edge)
    return induced


def column_for(
    edges: set[tuple[int, int, int]], roots: tuple[int, int, int, int], outside: int
) -> tuple[int, ...]:
    return tuple(
        int(canonical_edge((roots[i], roots[j], outside)) in edges)
        for i, j in PAIR_ORDER
    )


def type_kernel(
    n: int,
    edges: set[tuple[int, int, int]],
    root_type: str,
    alphabet_index: dict[tuple[int, ...], int],
) -> dict[tuple[int, int], Fraction]:
    """Average a type over all ordered roles (root0..3, outside x, outside y)."""

    if n < 6:
        raise ValueError("4-root q=2 extraction needs at least 6 vertices")
    if not is_k4_free(n, edges):
        raise ValueError("input type is not K4^3-free")

    wanted_root_edges = {tuple(edge) for edge in ROOT_TYPES[root_type]}
    den = math.perm(n, 6)
    accum: dict[tuple[int, int], Fraction] = defaultdict(Fraction)
    for role_vertices in permutations(range(n), 6):
        roots = role_vertices[:4]
        if induced_root_edges(edges, roots) != wanted_root_edges:
            continue
        alpha = column_for(edges, roots, role_vertices[4])
        beta = column_for(edges, roots, role_vertices[5])
        try:
            ai = alphabet_index[alpha]
            bi = alphabet_index[beta]
        except KeyError as exc:
            raise ValueError(
                f"encountered forbidden column {exc.args[0]} for root type {root_type}"
            ) from exc
        accum[(ai, bi)] += Fraction(1, den)
    return dict(accum)


def extract(payload: dict, root_type: str) -> dict:
    alphabet = build_alphabet(root_type)
    alphabet_index = {bits: i for i, bits in enumerate(alphabet)}
    records = parse_records(payload)
    matrix = [[Fraction(0, 1) for _ in alphabet] for _ in alphabet]
    type_kernels = []
    kernel_masses = []

    for type_index, (n, edges, moment) in enumerate(records):
        kernel = type_kernel(n, edges, root_type, alphabet_index)
        kernel_mass = sum(kernel.values(), Fraction(0, 1))
        kernel_masses.append(kernel_mass)
        type_kernels.append(
            {
                "type_index": type_index,
                "root_mass": frac_to_str(kernel_mass),
                "entries": [
                    [i, j, frac_to_str(value)]
                    for (i, j), value in sorted(kernel.items())
                    if value
                ],
            }
        )
        if moment:
            for (i, j), value in kernel.items():
                matrix[i][j] += moment * value

    root_mass = sum(sum(row, Fraction(0, 1)) for row in matrix)
    if root_mass <= 0:
        raise ValueError(f"root type {root_type} has zero mass in the input moments")
    normalized = [[value / root_mass for value in row] for row in matrix]

    max_asym = max(
        abs(normalized[i][j] - normalized[j][i])
        for i in range(len(alphabet))
        for j in range(len(alphabet))
    )
    min_entry = min(value for row in normalized for value in row)
    row_sums = [sum(row, Fraction(0, 1)) for row in normalized]
    col_sums = [
        sum(normalized[i][j] for i in range(len(alphabet)))
        for j in range(len(alphabet))
    ]
    max_row_col_delta = max(abs(a - b) for a, b in zip(row_sums, col_sums))

    return {
        "root_type": root_type,
        "pair_order": [list(pair) for pair in PAIR_ORDER],
        "root_edges": [list(edge) for edge in ROOT_TYPES[root_type]],
        "alphabet": [list(bits) for bits in alphabet],
        "alphabet_size": len(alphabet),
        "root_mass": frac_to_str(root_mass),
        "root_mass_float": float(root_mass),
        "normalized_sum": frac_to_str(sum(sum(row, Fraction(0, 1)) for row in normalized)),
        "unnormalized_sum": frac_to_str(root_mass),
        "max_asymmetry": frac_to_str(max_asym),
        "max_asymmetry_float": float(max_asym),
        "min_normalized_entry": frac_to_str(min_entry),
        "min_normalized_entry_float": float(min_entry),
        "max_row_col_sum_delta": frac_to_str(max_row_col_delta),
        "max_row_col_sum_delta_float": float(max_row_col_delta),
        "row_sums": [frac_to_str(x) for x in row_sums],
        "col_sums": [frac_to_str(x) for x in col_sums],
        "matrix_unnormalized": [[frac_to_str(x) for x in row] for row in matrix],
        "matrix_normalized": [[frac_to_str(x) for x in row] for row in normalized],
        "type_kernels": type_kernels,
        "type_root_masses": [frac_to_str(x) for x in kernel_masses],
        "projection_rule": (
            "For each unlabeled type representative, average over every ordered "
            "assignment of vertices to (root0,root1,root2,root3,x,y)."
        ),
    }


def assert_sane(result: dict) -> None:
    if result["max_asymmetry_float"] > 1e-20:
        raise AssertionError(f"{result['root_type']} matrix is not symmetric")
    if result["min_normalized_entry_float"] < -1e-20:
        raise AssertionError(f"{result['root_type']} matrix has a negative entry")
    if result["normalized_sum"] != "1":
        raise AssertionError(f"{result['root_type']} normalized matrix does not sum to 1")
    if result["max_row_col_sum_delta_float"] > 1e-20:
        raise AssertionError(f"{result['root_type']} row/column sums disagree")


def self_test() -> None:
    # Six-vertex graph with B2 on roots 0..3 and two isolated outside vertices.
    payload = {
        "types": [{"n": 6, "edges": [[0, 1, 2], [0, 1, 3]], "moment": "1"}],
        "pseudo_moments": ["1"],
    }
    result = extract(payload, "B2")
    assert_sane(result)
    zero_index = result["alphabet"].index([0, 0, 0, 0, 0, 0])
    value = Fraction(result["matrix_normalized"][zero_index][zero_index])
    if value != 1:
        raise AssertionError(f"expected all mass on the zero column pair, got {value}")
    print("self-test passed: B2 hand example projects to the zero-column pair")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--input", help="flag_sdp_r6.json")
    parser.add_argument("--out", help="output JSON containing both B2 and B3")
    parser.add_argument("--root-type", choices=sorted(ROOT_TYPES), help="extract only one root type")
    parser.add_argument("--self-test", action="store_true")
    args = parser.parse_args()

    if args.self_test:
        self_test()
    if not args.input:
        if args.self_test:
            return
        parser.error("--input is required unless --self-test is used")
    if not args.out:
        parser.error("--out is required")

    payload = load_json(args.input)
    roots = [args.root_type] if args.root_type else sorted(ROOT_TYPES)
    results = {root_type: extract(payload, root_type) for root_type in roots}
    for result in results.values():
        assert_sane(result)
    write_json(
        args.out,
        {
            "input": args.input,
            "roots": results,
        },
    )
    for root_type, result in results.items():
        print(
            f"{root_type}: |A|={result['alphabet_size']} root_mass={result['root_mass_float']:.12g} "
            f"max_asym={result['max_asymmetry_float']:.3g}"
        )


if __name__ == "__main__":
    main()

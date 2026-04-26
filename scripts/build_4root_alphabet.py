#!/usr/bin/env python3
"""Build 4-root outside-column alphabets for K4^3-free roots."""

from __future__ import annotations

import argparse
import sys
from itertools import product
from pathlib import Path

SCRIPT_DIR = Path(__file__).resolve().parent
if str(SCRIPT_DIR) not in sys.path:
    sys.path.insert(0, str(SCRIPT_DIR))

from de_finetti_utils import write_json  # noqa: E402

PAIR_ORDER = ((0, 1), (0, 2), (0, 3), (1, 2), (1, 3), (2, 3))
PAIR_INDEX = {pair: i for i, pair in enumerate(PAIR_ORDER)}
ROOT_TYPES = {
    "B2": ((0, 1, 2), (0, 1, 3)),
    "B3": ((0, 1, 2), (0, 1, 3), (0, 2, 3)),
}
EXPECTED_SIZES = {"B2": 50, "B3": 45}


def edge_pair_indices(edge: tuple[int, int, int]) -> tuple[int, int, int]:
    a, b, c = edge
    return tuple(
        PAIR_INDEX[tuple(sorted(pair))]
        for pair in ((a, b), (a, c), (b, c))
    )


def is_allowed_column(bits: tuple[int, ...], root_edges: tuple[tuple[int, int, int], ...]) -> bool:
    for edge in root_edges:
        i, j, k = edge_pair_indices(edge)
        if bits[i] and bits[j] and bits[k]:
            return False
    return True


def build_alphabet(root_type: str) -> list[tuple[int, ...]]:
    if root_type not in ROOT_TYPES:
        raise ValueError(f"unknown root type {root_type!r}; expected one of {sorted(ROOT_TYPES)}")
    root_edges = ROOT_TYPES[root_type]
    return [
        bits
        for bits in product((0, 1), repeat=len(PAIR_ORDER))
        if is_allowed_column(bits, root_edges)
    ]


def payload_for(root_type: str) -> dict:
    alphabet = build_alphabet(root_type)
    return {
        "root_type": root_type,
        "root_edges": [list(edge) for edge in ROOT_TYPES[root_type]],
        "pair_order": [list(pair) for pair in PAIR_ORDER],
        "alphabet": [list(bits) for bits in alphabet],
        "alphabet_size": len(alphabet),
        "expected_alphabet_size": EXPECTED_SIZES[root_type],
        "sanity_check_passed": len(alphabet) == EXPECTED_SIZES[root_type],
        "ordering": "lexicographic 6-bit tuples in pair_order",
    }


def self_test() -> None:
    for root_type, expected in EXPECTED_SIZES.items():
        actual = len(build_alphabet(root_type))
        if actual != expected:
            raise AssertionError(f"{root_type}: expected {expected}, got {actual}")
    print("self-test passed: |A_B2| = 50 and |A_B3| = 45")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--root-type", choices=sorted(ROOT_TYPES), help="one root type to emit")
    parser.add_argument("--out", help="output JSON path for --root-type")
    parser.add_argument("--out-dir", help="write alphabet_F_B2.json and alphabet_F_B3.json here")
    parser.add_argument("--self-test", action="store_true")
    args = parser.parse_args()

    if args.self_test:
        self_test()

    if args.root_type:
        if not args.out:
            raise ValueError("--out is required with --root-type")
        payload = payload_for(args.root_type)
        if not payload["sanity_check_passed"]:
            raise SystemExit(f"alphabet sanity check failed for {args.root_type}")
        write_json(args.out, payload)
        print(f"{args.root_type}: wrote {payload['alphabet_size']} columns to {args.out}")

    if args.out_dir:
        out_dir = Path(args.out_dir)
        for root_type in sorted(ROOT_TYPES):
            payload = payload_for(root_type)
            if not payload["sanity_check_passed"]:
                raise SystemExit(f"alphabet sanity check failed for {root_type}")
            out = out_dir / f"alphabet_F_{root_type}.json"
            write_json(out, payload)
            print(f"{root_type}: wrote {payload['alphabet_size']} columns to {out}")

    if not (args.self_test or args.root_type or args.out_dir):
        parser.error("provide --self-test, --root-type, or --out-dir")


if __name__ == "__main__":
    main()

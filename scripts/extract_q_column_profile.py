#!/usr/bin/env python3
"""Extract rooted-edge q-column occupancy profiles from pseudo-moments."""

from __future__ import annotations

import argparse
import math
from collections import defaultdict
from fractions import Fraction
from itertools import combinations

from de_finetti_utils import (
    STATE_INDEX,
    column_state,
    frac_to_str,
    is_k4_free,
    load_json,
    occupancy_rows,
    parse_fraction,
    parse_type_record,
    write_json,
    write_profile_csv,
)


def type_records(payload: dict) -> list[tuple[int, set[tuple[int, int, int]], Fraction]]:
    records = payload.get("types", [])
    moments = payload.get("pseudo_moments", [])
    parsed = []
    for i, record in enumerate(records):
        if isinstance(record, dict) and "moment" not in record and i < len(moments):
            record = dict(record)
            record["moment"] = moments[i]
        parsed.append(parse_type_record(record))
    return parsed


def extract_profile(payload: dict, q: int) -> tuple[list[tuple[int, ...]], list[Fraction], list[Fraction], Fraction]:
    if payload.get("status") == "blocked":
        raise ValueError(payload.get("error", "input pseudo-moment payload is blocked"))

    accum: dict[tuple[int, ...], Fraction] = defaultdict(Fraction)
    edge_density = Fraction(0, 1)
    used_mass = Fraction(0, 1)

    for n, edges, moment in type_records(payload):
        if moment == 0:
            continue
        if n < q + 3:
            continue
        if not is_k4_free(n, edges):
            raise ValueError(f"input type on {n} vertices is not K4^3-free")

        roots = list(combinations(range(n), 3))
        edge_den = Fraction(sum(1 for root in roots if tuple(root) in edges), len(roots))
        edge_density += moment * edge_den
        used_mass += moment

        den = math.comb(n, 3) * math.comb(n - 3, q)
        if den == 0:
            continue
        for root in roots:
            root = tuple(root)
            if root not in edges:
                continue
            outside = [v for v in range(n) if v not in root]
            for sample in combinations(outside, q):
                occ = [0] * len(STATE_INDEX)
                for x in sample:
                    state = column_state(root, x, edges)
                    if state not in STATE_INDEX:
                        raise ValueError("encountered forbidden 111 column in K4-free input")
                    occ[STATE_INDEX[state]] += 1
                accum[tuple(occ)] += moment * Fraction(1, den)

    if used_mass == 0:
        raise ValueError("no usable type moments with at least q+3 vertices")
    if edge_density <= 0:
        raise ValueError("edge density is zero; cannot condition on a rooted edge")

    occupations = occupancy_rows(q)
    unnormalized = [accum[occ] for occ in occupations]
    normalized = [value / edge_density for value in unnormalized]
    return occupations, normalized, unnormalized, edge_density


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--input", required=True, help="flag_sdp_r{r}.json")
    parser.add_argument("--q", type=int, required=True)
    parser.add_argument("--out", required=True, help="output CSV path")
    parser.add_argument("--meta-out", help="optional JSON metadata path")
    args = parser.parse_args()

    payload = load_json(args.input)
    occupations, normalized, unnormalized, edge_density = extract_profile(payload, args.q)
    write_profile_csv(args.out, occupations, normalized, unnormalized)
    if args.meta_out:
        write_json(
            args.meta_out,
            {
                "input": args.input,
                "q": args.q,
                "rows": len(occupations),
                "edge_density": frac_to_str(edge_density),
                "normalized_sum": frac_to_str(sum(normalized, Fraction(0, 1))),
                "unnormalized_sum": frac_to_str(sum(unnormalized, Fraction(0, 1))),
            },
        )


if __name__ == "__main__":
    main()

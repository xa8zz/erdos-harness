#!/usr/bin/env python3
"""Add a q=3 de Finetti separator constraint to a Flagmatic SDPA file.

Flagmatic writes the CSDP problem in the convention

    maximize a.y subject to A'(y) - C = Z,  Z >= 0.

For the K_4^(3) order-6 run the coordinates y_i are the six-vertex type
densities.  A linear separator b.y <= 0 is therefore enforced by adding a
new 1x1 PSD block with C=0 and A_i=-b_i, so the new scalar slack is
Z_new = -b.y >= 0.
"""

from __future__ import annotations

import argparse
import math
import sys
from fractions import Fraction
from itertools import combinations
from itertools import permutations
from pathlib import Path

SCRIPT_DIR = Path(__file__).resolve().parent
if str(SCRIPT_DIR) not in sys.path:
    sys.path.insert(0, str(SCRIPT_DIR))

from de_finetti_utils import (  # noqa: E402
    STATE_INDEX,
    column_state,
    frac_to_str,
    is_k4_free,
    load_json,
    occupancy_rows,
    parse_fraction,
    parse_type_record,
    write_json,
)


def type_records(payload: dict) -> list[tuple[int, set[tuple[int, int, int]], Fraction]]:
    records = payload.get("types", [])
    moments = payload.get("pseudo_moments", [])
    parsed: list[tuple[int, set[tuple[int, int, int]], Fraction]] = []
    for i, record in enumerate(records):
        if isinstance(record, dict) and "moment" not in record and i < len(moments):
            record = dict(record)
            record["moment"] = moments[i]
        parsed.append(parse_type_record(record))
    return parsed


def type_unnormalized_separator_score(
    n: int,
    edges: set[tuple[int, int, int]],
    separator: list[Fraction],
    q: int,
) -> Fraction:
    """Return b_T = a · u(T), where u is the unconditioned rooted profile."""

    if n < q + 3:
        raise ValueError(f"type has {n} vertices, but q={q} needs at least {q + 3}")
    if not is_k4_free(n, edges):
        raise ValueError("input type is not K4^3-free")

    occ_to_index = {occ: i for i, occ in enumerate(occupancy_rows(q))}
    den = math.comb(n, 3) * math.comb(n - 3, q)
    total = Fraction(0, 1)
    for root in combinations(range(n), 3):
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
            total += separator[occ_to_index[tuple(occ)]]
    return total / den


def relabel_edges(
    edges: set[tuple[int, int, int]], perm: tuple[int, ...]
) -> set[tuple[int, int, int]]:
    return {tuple(sorted((perm[a], perm[b], perm[c]))) for a, b, c in edges}


def label_averaged_type_score(
    n: int,
    edges: set[tuple[int, int, int]],
    separator: list[Fraction],
    q: int,
) -> Fraction:
    """Average the rooted projection over all labelings of an unlabeled type.

    Flagmatic coordinates are unlabeled isomorphism classes.  The rooted
    column profile has labeled root coordinates (ab, ac, bc), so a canonical
    representative alone is not a well-defined projection.  Averaging over
    all labelings gives the invariant projection supported by unlabeled type
    densities.
    """

    total = Fraction(0, 1)
    count = 0
    for perm in permutations(range(n)):
        total += type_unnormalized_separator_score(n, relabel_edges(edges, perm), separator, q)
        count += 1
    return total / count


def compute_separator_coefficients(
    flag_json: Path,
    cert_json: Path,
    q: int,
    *,
    label_average: bool,
) -> tuple[list[Fraction], dict]:
    payload = load_json(flag_json)
    cert = load_json(cert_json)
    separator = [parse_fraction(x) for x in cert["separator_a_rational"]]
    if len(separator) != len(occupancy_rows(q)):
        raise ValueError(
            f"separator has {len(separator)} entries, expected {len(occupancy_rows(q))}"
        )

    records = type_records(payload)
    coeffs: list[Fraction] = []
    moments: list[Fraction] = []
    edge_density = Fraction(0, 1)
    for n, edges, moment in records:
        if label_average:
            coeffs.append(label_averaged_type_score(n, edges, separator, q))
        else:
            coeffs.append(type_unnormalized_separator_score(n, edges, separator, q))
        moments.append(moment)
        edge_density += moment * Fraction(len(edges), math.comb(n, 3))

    plateau_violation = sum((m * b for m, b in zip(moments, coeffs)), Fraction(0, 1))
    objective_bound = -sum(
        parse_fraction(x) * Fraction(len(edges), math.comb(n, 3))
        for x, (n, edges, _moment) in zip(payload.get("pseudo_moments", []), records)
    )
    nonzero = [x for x in coeffs if x]
    meta = {
        "flag_json": str(flag_json),
        "separator_json": str(cert_json),
        "q": q,
        "num_type_coefficients": len(coeffs),
        "num_nonzero_type_coefficients": len(nonzero),
        "min_type_coefficient": frac_to_str(min(nonzero) if nonzero else Fraction(0, 1)),
        "max_type_coefficient": frac_to_str(max(nonzero) if nonzero else Fraction(0, 1)),
        "plateau_separator_unnormalized_score": frac_to_str(plateau_violation),
        "plateau_separator_unnormalized_score_float": float(plateau_violation),
        "edge_density_from_types": frac_to_str(edge_density),
        "edge_density_from_types_float": float(edge_density),
        "negative_edge_density_check": frac_to_str(objective_bound),
        "separator_profile_score_rational": cert.get("profile_score_rational"),
        "separator_margin_rational": cert.get("margin_rational"),
        "label_average": label_average,
        "sdpa_dual_convention": "CSDP enforces A'(y)-C=Z>=0; appended entries are -b_i so -b.y>=0.",
    }
    return coeffs, meta


def first_noncomment_indices(lines: list[str], count: int) -> list[int]:
    indices: list[int] = []
    for i, line in enumerate(lines):
        stripped = line.strip()
        if not stripped or stripped.startswith('"') or stripped.startswith("*"):
            continue
        indices.append(i)
        if len(indices) == count:
            return indices
    raise ValueError(f"could not find {count} SDPA header lines")


def augment_sdpa(input_path: Path, output_path: Path, coeffs: list[Fraction]) -> dict:
    lines = input_path.read_text().splitlines()
    h0, h1, h2, h3 = first_noncomment_indices(lines, 4)
    num_constraints = int(lines[h0].strip())
    num_blocks = int(lines[h1].strip())
    block_sizes = [int(x) for x in lines[h2].split()]
    objective = lines[h3].split()

    if num_constraints != len(coeffs):
        raise ValueError(
            f"SDPA has {num_constraints} variables/constraints, but {len(coeffs)} coefficients"
        )
    if len(block_sizes) != num_blocks:
        raise ValueError(f"SDPA declares {num_blocks} blocks but lists {len(block_sizes)}")
    if len(objective) != num_constraints:
        raise ValueError(f"objective vector has {len(objective)} entries, expected {num_constraints}")

    new_block = num_blocks + 1
    lines[h1] = str(new_block)
    lines[h2] = " ".join(str(x) for x in [*block_sizes, 1])

    augmented_entries = []
    for i, coeff in enumerate(coeffs, start=1):
        if coeff == 0:
            continue
        # A_i entry is -b_i, so the scalar slack is -b.y >= 0.
        augmented_entries.append(f"{i} {new_block} 1 1 {float(-coeff):.18e}")

    output_path.parent.mkdir(parents=True, exist_ok=True)
    output_path.write_text("\n".join([*lines, *augmented_entries]) + "\n")
    return {
        "input_sdpa": str(input_path),
        "output_sdpa": str(output_path),
        "original_num_blocks": num_blocks,
        "augmented_num_blocks": new_block,
        "num_augmented_entries": len(augmented_entries),
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--sdpa-in", required=True, type=Path)
    parser.add_argument("--sdpa-out", required=True, type=Path)
    parser.add_argument("--flag-json", required=True, type=Path)
    parser.add_argument("--separator-json", required=True, type=Path)
    parser.add_argument("--q", required=True, type=int)
    parser.add_argument("--meta-out", required=True, type=Path)
    parser.add_argument(
        "--representative-labels",
        action="store_true",
        help=(
            "diagnostic only: use the single canonical representative labeling. "
            "The default label-averages each unlabeled type and is the sound lift."
        ),
    )
    args = parser.parse_args()

    coeffs, meta = compute_separator_coefficients(
        args.flag_json,
        args.separator_json,
        args.q,
        label_average=not args.representative_labels,
    )
    meta.update(augment_sdpa(args.sdpa_in, args.sdpa_out, coeffs))
    write_json(args.meta_out, meta)


if __name__ == "__main__":
    main()

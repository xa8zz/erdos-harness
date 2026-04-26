#!/usr/bin/env python3
"""Test finite complete-positivity extendibility for 4-root pair matrices."""

from __future__ import annotations

import argparse
import math
import sys
from fractions import Fraction
from itertools import combinations
from pathlib import Path

import numpy as np
from scipy.optimize import linprog
from scipy.sparse import coo_matrix, vstack

SCRIPT_DIR = Path(__file__).resolve().parent
if str(SCRIPT_DIR) not in sys.path:
    sys.path.insert(0, str(SCRIPT_DIR))

from de_finetti_utils import frac_to_str, load_json, parse_fraction, write_json  # noqa: E402


def compositions(total: int, parts: int):
    if parts == 1:
        yield (total,)
        return
    for first in range(total + 1):
        for rest in compositions(total - first, parts - 1):
            yield (first,) + rest


def occupancy_count(alphabet_size: int, Q: int) -> int:
    return math.comb(Q + alphabet_size - 1, alphabet_size - 1)


def positive_compositions(total: int, parts: int):
    if parts == 1:
        if total > 0:
            yield (total,)
        return
    for first in range(1, total - parts + 2):
        for rest in positive_compositions(total - first, parts - 1):
            yield (first,) + rest


def exact_matrix_nnz(alphabet_size: int, Q: int) -> int:
    total = 0
    for support_size in range(1, min(Q, alphabet_size) + 1):
        per_support = 0
        for positive in positive_compositions(Q, support_size):
            singles = sum(1 for value in positive if value == 1)
            per_support += support_size * support_size - singles + 1
        total += math.comb(alphabet_size, support_size) * per_support
    return total


def pair_entries(occ: tuple[int, ...], Q: int):
    den = Q * (Q - 1)
    support = [i for i, value in enumerate(occ) if value]
    for i in support:
        ni = occ[i]
        for j in support:
            value = ni * (occ[j] - (1 if i == j else 0))
            if value:
                yield i, j, Fraction(value, den)


def build_vertex_matrix(alphabet_size: int, Q: int, max_nnz: int | None = None):
    num_vertices = occupancy_count(alphabet_size, Q)
    exact_nnz = exact_matrix_nnz(alphabet_size, Q)
    if max_nnz is not None and exact_nnz > max_nnz:
        raise MemoryError(
            f"exact nnz {exact_nnz:,} exceeds max_nnz={max_nnz:,}"
        )
    rows = np.empty(exact_nnz, dtype=np.int32)
    cols = np.empty(exact_nnz, dtype=np.int32)
    data = np.empty(exact_nnz, dtype=float)
    norm_row = alphabet_size * alphabet_size
    cursor = 0
    for col, occ in enumerate(compositions(Q, alphabet_size)):
        rows[cursor] = norm_row
        cols[cursor] = col
        data[cursor] = 1.0
        cursor += 1
        for i, j, value in pair_entries(occ, Q):
            rows[cursor] = i * alphabet_size + j
            cols[cursor] = col
            data[cursor] = float(value)
            cursor += 1
    if cursor != exact_nnz:
        raise AssertionError(f"nnz count mismatch: expected {exact_nnz}, filled {cursor}")
    matrix = coo_matrix(
        (data, (rows, cols)),
        shape=(alphabet_size * alphabet_size + 1, num_vertices),
    ).tocsc()
    return matrix


def matrix_from_pair_json(pair_json: Path, root_type: str) -> tuple[int, list[Fraction]]:
    payload = load_json(pair_json)
    root = payload["roots"][root_type]
    matrix = [
        [parse_fraction(value) for value in row]
        for row in root["matrix_normalized"]
    ]
    flat = [value for row in matrix for value in row]
    return int(root["alphabet_size"]), flat


def solve_membership(matrix, target: list[Fraction], tol: float):
    b_eq = np.array([float(x) for x in target] + [1.0])
    result = linprog(
        c=np.zeros(matrix.shape[1]),
        A_eq=matrix,
        b_eq=b_eq,
        bounds=(0, None),
        method="highs",
        options={"primal_feasibility_tolerance": tol, "dual_feasibility_tolerance": tol},
    )
    return result


def solve_l1_slack(matrix, target: list[Fraction], tol: float):
    rows = matrix.shape[0]
    pair_rows = rows - 1
    cols = matrix.shape[1]
    profile_matrix = matrix[:pair_rows, :]
    norm_matrix = matrix[pair_rows:, :]
    ident = coo_matrix(np.eye(pair_rows))
    a_ub = vstack(
        [
            coo_matrix(np.hstack([profile_matrix.toarray(), -np.eye(pair_rows)])),
            coo_matrix(np.hstack([-profile_matrix.toarray(), -np.eye(pair_rows)])),
        ],
        format="csc",
    )
    p = np.array([float(x) for x in target])
    b_ub = np.concatenate([p, -p])
    a_eq = coo_matrix(np.hstack([norm_matrix.toarray(), np.zeros((1, pair_rows))])).tocsc()
    c = np.array([0.0] * cols + [1.0] * pair_rows)
    return linprog(
        c=c,
        A_ub=a_ub,
        b_ub=b_ub,
        A_eq=a_eq,
        b_eq=np.array([1.0]),
        bounds=(0, None),
        method="highs",
        options={"primal_feasibility_tolerance": tol, "dual_feasibility_tolerance": tol},
    )


def solve_separator(alphabet_size: int, Q: int, target: list[Fraction]):
    """Find C with C.h_N >= eps, C.target <= -eps, ||C||_1 <= 1."""

    num_pairs = alphabet_size * alphabet_size
    rows: list[int] = []
    cols: list[int] = []
    data: list[float] = []
    b_ub: list[float] = []
    row = 0
    for occ in compositions(Q, alphabet_size):
        for i, j, value in pair_entries(occ, Q):
            # -C.h_N + eps <= 0
            rows.append(row)
            cols.append(i * alphabet_size + j)
            data.append(-float(value))
        rows.append(row)
        cols.append(2 * num_pairs)
        data.append(1.0)
        b_ub.append(0.0)
        row += 1
    for index, value in enumerate(target):
        # C.target + eps <= 0
        rows.append(row)
        cols.append(index)
        data.append(float(value))
    rows.append(row)
    cols.append(2 * num_pairs)
    data.append(1.0)
    b_ub.append(0.0)
    row += 1
    for index in range(num_pairs):
        # C = C_plus - C_minus
        rows.append(row)
        cols.append(index)
        data.append(1.0)
        rows.append(row)
        cols.append(num_pairs + index)
        data.append(1.0)
    b_ub.append(1.0)

    # Convert C coefficients into plus-minus variables.
    expanded_rows = []
    expanded_cols = []
    expanded_data = []
    for r, c, v in zip(rows, cols, data):
        if c < num_pairs:
            expanded_rows.extend([r, r])
            expanded_cols.extend([c, num_pairs + c])
            expanded_data.extend([v, -v])
        else:
            expanded_rows.append(r)
            expanded_cols.append(c)
            expanded_data.append(v)
    a_ub = coo_matrix(
        (expanded_data, (expanded_rows, expanded_cols)),
        shape=(row + 1, 2 * num_pairs + 1),
    ).tocsc()
    objective = np.array([0.0] * (2 * num_pairs) + [-1.0])
    result = linprog(
        c=objective,
        A_ub=a_ub,
        b_ub=np.array(b_ub),
        bounds=(0, None),
        method="highs",
    )
    if not result.success:
        return result, None, None
    x = result.x
    coeffs = x[:num_pairs] - x[num_pairs : 2 * num_pairs]
    return result, coeffs.tolist(), float(x[2 * num_pairs])


def witness_entries(alphabet_size: int, Q: int, result, limit: int) -> tuple[list[dict], bool]:
    entries = []
    total = 0
    for i, (occ, value) in enumerate(zip(compositions(Q, alphabet_size), result.x)):
        if value > 1e-8:
            total += 1
            if len(entries) < limit:
                entries.append(
                    {
                        "N_sparse": [[j, int(n)] for j, n in enumerate(occ) if n],
                        "z": float(value),
                        "z_rational_decimal": frac_to_str(Fraction(str(float(value)))),
                    }
                )
    return entries, total > limit


def synthetic_case(out: Path) -> None:
    alphabet_size = 3
    Q = 4
    matrix = build_vertex_matrix(alphabet_size, Q)
    target = [Fraction(0, 1)] * (alphabet_size * alphabet_size)
    occ = (2, 1, 1)
    for i, j, value in pair_entries(occ, Q):
        target[i * alphabet_size + j] = value
    feasible = solve_membership(matrix, target, 1e-9)
    if not feasible.success:
        raise AssertionError("synthetic in-polytope profile was not feasible")
    bad = [Fraction(0, 1)] * (alphabet_size * alphabet_size)
    bad[1] = Fraction(1, 1)
    infeasible = solve_membership(matrix, bad, 1e-9)
    if infeasible.success:
        raise AssertionError("synthetic nonzero diagonal-only profile was feasible")
    sep_result, coeffs, eps = solve_separator(alphabet_size, Q, bad)
    if not sep_result.success or coeffs is None or eps is None or eps <= 0:
        raise AssertionError("synthetic separator failed")
    write_json(
        out,
        {
            "synthetic_in_feasible": bool(feasible.success),
            "synthetic_out_feasible": bool(infeasible.success),
            "synthetic_separator_margin_float": eps,
        },
    )
    print(f"self-test passed: wrote {out}")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--pair-json", type=Path)
    parser.add_argument("--root-type", choices=("B2", "B3"))
    parser.add_argument("--Q", type=int)
    parser.add_argument("--out", required=True, type=Path)
    parser.add_argument("--tol", type=float, default=1e-7)
    parser.add_argument("--max-nnz", type=int, default=60_000_000)
    parser.add_argument("--max-witness-entries", type=int, default=200)
    parser.add_argument("--self-test", action="store_true")
    args = parser.parse_args()

    if args.self_test:
        synthetic_case(args.out)
        return
    if not args.pair_json or not args.root_type or not args.Q:
        parser.error("--pair-json, --root-type, and --Q are required unless --self-test is used")

    alphabet_size, target = matrix_from_pair_json(args.pair_json, args.root_type)
    num_vertices = occupancy_count(alphabet_size, args.Q)
    try:
        matrix = build_vertex_matrix(alphabet_size, args.Q, args.max_nnz)
    except MemoryError as exc:
        write_json(
            args.out,
            {
                "root_type": args.root_type,
                "Q": args.Q,
                "alphabet_size": alphabet_size,
                "feasible": None,
                "status": "blocked_scale",
                "error": str(exc),
                "num_vertices": num_vertices,
            },
        )
        print(f"{args.root_type} Q={args.Q}: blocked by scale: {exc}")
        return

    result = solve_membership(matrix, target, args.tol)
    feasible = bool(result.success)
    witness = None
    witness_truncated = False
    separator = None
    sep_margin = None
    sep_status = None

    if feasible:
        witness, witness_truncated = witness_entries(
            alphabet_size, args.Q, result, args.max_witness_entries
        )
    else:
        sep_result, separator, sep_margin = solve_separator(alphabet_size, args.Q, target)
        sep_status = sep_result.message

    payload = {
        "root_type": args.root_type,
        "Q": args.Q,
        "alphabet_size": alphabet_size,
        "pair_json": str(args.pair_json),
        "feasible": feasible,
        "status": "ok",
        "solver": "scipy.optimize.linprog/highs",
        "solver_status": result.message,
        "tol": args.tol,
        "num_matrix_coordinates": alphabet_size * alphabet_size,
        "num_vertices": num_vertices,
        "matrix_nnz": int(matrix.nnz),
        "witness_z": witness,
        "witness_z_truncated": witness_truncated,
        "separator_matrix_float": separator,
        "separator_margin_float": sep_margin,
        "separator_solver_status": sep_status,
    }
    write_json(args.out, payload)
    outcome = "feasible" if feasible else "infeasible"
    print(f"{args.root_type} Q={args.Q}: {outcome}; vertices={num_vertices:,}; nnz={matrix.nnz:,}")


if __name__ == "__main__":
    main()

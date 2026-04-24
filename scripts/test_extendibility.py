#!/usr/bin/env python3
"""Test membership in the finite extendibility polytope E_{q,Q}."""

from __future__ import annotations

import argparse
from fractions import Fraction

from scipy.optimize import linprog
from scipy.sparse import coo_matrix
import numpy as np

from de_finetti_utils import (
    frac_to_str,
    hypergeom_value,
    occupancy_rows,
    read_profile_csv,
    write_json,
)


def vertex_matrix(q: int, Q: int, occupations: list[tuple[int, ...]]):
    vertices = occupancy_rows(Q)
    row_index = {occ: i for i, occ in enumerate(occupations)}
    rows = []
    cols = []
    data = []
    exact_columns: list[list[Fraction]] = []
    for j, big_occ in enumerate(vertices):
        exact_col = []
        for occ in occupations:
            value = hypergeom_value(big_occ, occ)
            exact_col.append(value)
            if value:
                rows.append(row_index[occ])
                cols.append(j)
                data.append(float(value))
        exact_columns.append(exact_col)
    matrix = coo_matrix((data, (rows, cols)), shape=(len(occupations), len(vertices))).tocsc()
    return vertices, matrix, exact_columns


def solve_membership(matrix, profile: list[Fraction], tol: float):
    dense = matrix.toarray()
    n_cols = dense.shape[1]
    a_eq = np.vstack([dense, np.ones((1, n_cols))])
    b_eq = np.array([float(x) for x in profile] + [1.0])
    result = linprog(
        c=np.zeros(n_cols),
        A_eq=a_eq,
        b_eq=b_eq,
        bounds=[(0, None)] * n_cols,
        method="highs",
        options={"primal_feasibility_tolerance": tol, "dual_feasibility_tolerance": tol},
    )
    return result


def solve_l1_slack(matrix, profile: list[Fraction], tol: float):
    dense = matrix.toarray()
    rows, cols = dense.shape
    ident = np.eye(rows)
    a_ub = np.vstack([np.hstack([dense, -ident]), np.hstack([-dense, -ident])])
    p = np.array([float(x) for x in profile])
    b_ub = np.concatenate([p, -p])
    a_eq = np.hstack([np.ones((1, cols)), np.zeros((1, rows))])
    b_eq = np.array([1.0])
    c = np.array([0.0] * cols + [1.0] * rows)
    bounds = [(0, None)] * (cols + rows)
    result = linprog(
        c=c,
        A_ub=a_ub,
        b_ub=b_ub,
        A_eq=a_eq,
        b_eq=b_eq,
        bounds=bounds,
        method="highs",
    )
    return result


def solve_separator(vertices, exact_columns, profile: list[Fraction]):
    """Find a float separator with ||a||_1 <= 1, if one is visible."""
    m = len(profile)
    p = np.array([float(x) for x in profile])
    a_rows = []
    b_ub = []
    for col in exact_columns:
        v = np.array([float(x) for x in col])
        diff = p - v
        a_rows.append(np.concatenate([-diff, diff, [1.0]]))
        b_ub.append(0.0)
    a_rows.append(np.array([1.0] * (2 * m) + [0.0]))
    b_ub.append(1.0)
    a_ub = np.vstack(a_rows)
    c = np.array([0.0] * (2 * m) + [-1.0])
    bounds = [(0, None)] * (2 * m) + [(0, None)]
    result = linprog(c=c, A_ub=a_ub, b_ub=np.array(b_ub), bounds=bounds, method="highs")
    if not result.success:
        return result, None, None
    x = result.x
    a = x[:m] - x[m : 2 * m]
    eps = x[2 * m]
    return result, a.tolist(), eps


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--profile", required=True)
    parser.add_argument("--Q", type=int, required=True)
    parser.add_argument("--r", type=int, required=True)
    parser.add_argument("--out", required=True)
    parser.add_argument("--tol", type=float, default=1e-7)
    parser.add_argument("--max-witness-entries", type=int, default=200)
    args = parser.parse_args()

    q, occupations, profile = read_profile_csv(args.profile)
    if args.Q < q:
        raise ValueError("Q must be at least q")

    vertices, matrix, exact_columns = vertex_matrix(q, args.Q, occupations)
    result = solve_membership(matrix, profile, args.tol)
    feasible = bool(result.success)
    witness = None
    separator = None
    margin = None
    slack_l1 = None
    sep_status = None

    if feasible:
        nz = [
            {
                "N": list(vertices[i]),
                "z": float(value),
                "z_rational_decimal": frac_to_str(Fraction(str(float(value)))),
            }
            for i, value in enumerate(result.x)
            if value > 1e-8
        ]
        witness = nz[: args.max_witness_entries]
    else:
        slack = solve_l1_slack(matrix, profile, args.tol)
        if slack.success:
            slack_l1 = float(slack.fun)
        sep_result, a, eps = solve_separator(vertices, exact_columns, profile)
        sep_status = sep_result.message
        if a is not None:
            separator = a
            margin = float(eps)

    payload = {
        "r": args.r,
        "q": q,
        "Q": args.Q,
        "feasible": feasible,
        "solver": "scipy.optimize.linprog/highs",
        "solver_status": result.message,
        "profile": args.profile,
        "num_profile_coordinates": len(occupations),
        "num_vertices": len(vertices),
        "margin_float": margin,
        "margin_rational": frac_to_str(Fraction(str(margin))) if margin is not None else None,
        "l1_slack_float": slack_l1,
        "witness_z": witness,
        "witness_z_truncated": bool(witness and len(witness) == args.max_witness_entries),
        "separator_a_float": separator,
        "separator_a_rational": None,
        "separator_solver_status": sep_status,
    }
    write_json(args.out, payload)


if __name__ == "__main__":
    main()

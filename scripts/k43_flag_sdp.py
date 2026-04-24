#!/usr/bin/env python3
"""Prepare or validate K4^3-free flag-SDP pseudo-moment data.

This script intentionally fails closed when no real flag-algebra solver or
external pseudo-moment export is present. The downstream de Finetti test is
only meaningful for a genuine plateau pseudo-extremizer, so this script does
not fabricate a finite-graph surrogate.
"""

from __future__ import annotations

import argparse
import itertools
import shutil
from pathlib import Path

from de_finetti_utils import canonical_edge, is_k4_free, load_json, write_json

PLATEAU_BY_R = {5: 0.565, 6: 0.5626, 7: 0.5617}


def count_labeled_k4_free(n: int) -> int | None:
    edge_list = list(itertools.combinations(range(n), 3))
    if len(edge_list) > 25:
        return None
    count = 0
    for mask in range(1 << len(edge_list)):
        edges = {
            canonical_edge(edge_list[i])
            for i in range(len(edge_list))
            if (mask >> i) & 1
        }
        if is_k4_free(n, edges):
            count += 1
    return count


def normalize_external_payload(payload: dict, r: int, solver: str) -> dict:
    if "types" not in payload:
        raise ValueError("external pseudo-moment JSON must contain a 'types' key")
    if "pseudo_moments" not in payload:
        pseudo_moments = []
        for record in payload["types"]:
            if isinstance(record, dict):
                pseudo_moments.append(record.get("moment", record.get("weight", 0)))
            else:
                pseudo_moments.append(0)
        payload["pseudo_moments"] = pseudo_moments
    payload.setdefault("r", r)
    payload.setdefault("solver", solver)
    payload.setdefault("status", "ok")
    payload.setdefault("edge_density", PLATEAU_BY_R.get(r))
    payload.setdefault("dual_upper_bound", PLATEAU_BY_R.get(r))
    return payload


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--r", type=int, required=True, help="flag basis order")
    parser.add_argument("--out", required=True, help="output JSON path")
    parser.add_argument(
        "--external-json",
        help="existing genuine flagmatic/Razborov pseudo-moment export to normalize",
    )
    parser.add_argument(
        "--solver",
        default="auto",
        help="metadata label for an external export; auto probes local tools",
    )
    args = parser.parse_args()

    if args.external_json:
        payload = normalize_external_payload(load_json(args.external_json), args.r, args.solver)
        write_json(args.out, payload)
        return

    available = {
        "flagmatic": bool(shutil.which("flagmatic")),
        "csdp": bool(shutil.which("csdp")),
        "sdpa": bool(shutil.which("sdpa")),
    }
    payload = {
        "r": args.r,
        "types": [],
        "pseudo_moments": [],
        "edge_density": None,
        "dual_upper_bound": None,
        "target_plateau_density": PLATEAU_BY_R.get(args.r),
        "solver": "none",
        "status": "blocked",
        "available_solvers": available,
        "error": (
            "No local flag-algebra SDP backend or external plateau pseudo-moment "
            "export was available. Re-run with --external-json pointing at a "
            "genuine flagmatic/Razborov pseudo-extremizer export."
        ),
        "labeled_k4_free_type_counts": {
            str(n): count_labeled_k4_free(n) for n in range(1, min(args.r, 5) + 1)
        },
        "output_contract": {
            "types": (
                "preferred: list of {'n': int, 'edges': [[i,j,k],...], "
                "'moment': rational_or_decimal} records"
            ),
            "pseudo_moments": "parallel list is accepted for legacy consumers",
        },
    }
    Path(args.out).parent.mkdir(parents=True, exist_ok=True)
    write_json(args.out, payload)


if __name__ == "__main__":
    main()

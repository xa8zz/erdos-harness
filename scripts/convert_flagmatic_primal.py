#!/usr/bin/env python3
"""Convert a Flagmatic 1.5 flags.py/flags.out primal row to JSON.

The converter is intentionally narrow: it supports the Flagmatic 1.x Python
artifact layout used by the K4^3 order-6 run, where `flags.py` defines `H`,
`densities`, and metadata, and the first row of `flags.out` is the primal
probability vector over the admissible type representatives.
"""

from __future__ import annotations

import argparse
import json
from fractions import Fraction
from pathlib import Path


def frac_to_str(x: Fraction) -> str:
    return str(x.numerator) if x.denominator == 1 else f"{x.numerator}/{x.denominator}"


def parse_flagmatic_graph(encoded: str) -> dict:
    n_text, edge_text = encoded.split(":", 1)
    n = int(n_text)
    if len(edge_text) % 3:
        raise ValueError(f"edge encoding length is not a multiple of 3: {encoded}")
    edges = []
    for i in range(0, len(edge_text), 3):
        edge = [int(ch) - 1 for ch in edge_text[i : i + 3]]
        if len(set(edge)) != 3:
            raise ValueError(f"bad edge in {encoded}: {edge}")
        edges.append(sorted(edge))
    return {"n": n, "edges": edges}


def load_flags_py(path: Path) -> dict:
    namespace: dict = {}
    exec(path.read_text(), namespace)
    return namespace


def load_primal_row(path: Path) -> list[Fraction]:
    lines = path.read_text().splitlines()
    if not lines:
        raise ValueError(f"empty flags.out: {path}")
    return [Fraction(token) for token in lines[0].split()]


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--flags-py", required=True)
    parser.add_argument("--flags-out", required=True)
    parser.add_argument("--out", required=True)
    parser.add_argument("--r", type=int, default=6)
    parser.add_argument("--solver", default="flagmatic-1.5.1+csdp-6.2.0")
    parser.add_argument("--source-url", default="https://lidicky.name/flagmatic/flagmatic-1.5.1.zip")
    parser.add_argument("--csdp-source-url", default="https://github.com/coin-or/Csdp")
    args = parser.parse_args()

    flags = load_flags_py(Path(args.flags_py))
    moments = load_primal_row(Path(args.flags_out))
    graphs = [parse_flagmatic_graph(encoded) for encoded in flags["H"]]
    densities = [Fraction(text) for text in flags["densities"]]

    if len(graphs) != len(moments):
        raise ValueError(f"H length {len(graphs)} != primal length {len(moments)}")
    if len(densities) != len(moments):
        raise ValueError(f"densities length {len(densities)} != primal length {len(moments)}")

    total_mass = sum(moments, Fraction(0, 1))
    edge_density = sum((m * d for m, d in zip(moments, densities)), Fraction(0, 1))
    records = []
    for graph, moment in zip(graphs, moments):
        record = dict(graph)
        record["moment"] = frac_to_str(moment)
        records.append(record)

    payload = {
        "status": "ok",
        "r": args.r,
        "solver": args.solver,
        "path": "flagmatic-order-6-primal",
        "source_url": args.source_url,
        "csdp_source_url": args.csdp_source_url,
        "reproduce_command": (
            "CSDP=~/.codex/bin/csdp ~/.codex/bin/flagmatic-1.5.1 "
            "--r 3 --n 6 --forbid-k4 --dir erdos-500/phase0/flagmatic_r6_q3"
        ),
        "dual_upper_bound": 0.56166560,
        "edge_density": float(edge_density),
        "edge_density_rational_from_primal": frac_to_str(edge_density),
        "primal_mass": float(total_mass),
        "primal_mass_rational": frac_to_str(total_mass),
        "num_types": len(records),
        "types": records,
        "pseudo_moments": [float(m) for m in moments],
        "pseudo_moments_rational": [frac_to_str(m) for m in moments],
        "notes": [
            "Type moments are exact rational parses of the decimal CSDP flags.out primal row.",
            "The 6-vertex coverage is valid for q=3 profile extraction and is not used for q>=4.",
        ],
    }
    Path(args.out).parent.mkdir(parents=True, exist_ok=True)
    Path(args.out).write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")


if __name__ == "__main__":
    main()

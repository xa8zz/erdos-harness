#!/usr/bin/env python3
"""Shared utilities for the K4^3 de Finetti extendibility experiment."""

from __future__ import annotations

import csv
import json
import math
from fractions import Fraction
from itertools import combinations
from pathlib import Path
from typing import Iterable

STATES = tuple(
    s for s in (
        (0, 0, 0),
        (0, 0, 1),
        (0, 1, 0),
        (0, 1, 1),
        (1, 0, 0),
        (1, 0, 1),
        (1, 1, 0),
    )
)
STATE_INDEX = {s: i for i, s in enumerate(STATES)}


def compositions(total: int, parts: int) -> Iterable[tuple[int, ...]]:
    """Yield all weak compositions of total into parts parts."""
    if parts == 1:
        yield (total,)
        return
    for first in range(total + 1):
        for rest in compositions(total - first, parts - 1):
            yield (first,) + rest


def occupancy_rows(q: int) -> list[tuple[int, ...]]:
    return list(compositions(q, len(STATES)))


def occ_key(occ: tuple[int, ...]) -> str:
    return ",".join(str(x) for x in occ)


def frac_to_str(x: Fraction) -> str:
    return str(x.numerator) if x.denominator == 1 else f"{x.numerator}/{x.denominator}"


def parse_fraction(value: object) -> Fraction:
    if isinstance(value, Fraction):
        return value
    if isinstance(value, int):
        return Fraction(value, 1)
    if isinstance(value, float):
        return Fraction(str(value))
    text = str(value).strip()
    if not text:
        raise ValueError("empty rational value")
    return Fraction(text)


def load_json(path: str | Path) -> dict:
    with Path(path).open() as f:
        return json.load(f)


def write_json(path: str | Path, payload: dict) -> None:
    Path(path).parent.mkdir(parents=True, exist_ok=True)
    with Path(path).open("w") as f:
        json.dump(payload, f, indent=2, sort_keys=True)
        f.write("\n")


def comb(n: int, k: int) -> int:
    if k < 0 or k > n:
        return 0
    return math.comb(n, k)


def hypergeom_value(big_occ: tuple[int, ...], small_occ: tuple[int, ...]) -> Fraction:
    q = sum(small_occ)
    q_big = sum(big_occ)
    den = comb(q_big, q)
    if den == 0:
        return Fraction(0, 1)
    num = 1
    for n_big, n_small in zip(big_occ, small_occ):
        c = comb(n_big, n_small)
        if c == 0:
            return Fraction(0, 1)
        num *= c
    return Fraction(num, den)


def read_profile_csv(path: str | Path) -> tuple[int, list[tuple[int, ...]], list[Fraction]]:
    with Path(path).open(newline="") as f:
        reader = csv.DictReader(f)
        rows = list(reader)
    if not rows:
        raise ValueError(f"profile CSV is empty: {path}")
    occ_cols = [f"occ_{i}" for i in range(len(STATES))]
    occupations = [tuple(int(row[col]) for col in occ_cols) for row in rows]
    q = sum(occupations[0])
    values = []
    for row in rows:
        if "profile_normalized_rational" in row and row["profile_normalized_rational"]:
            values.append(parse_fraction(row["profile_normalized_rational"]))
        else:
            values.append(parse_fraction(row["profile_normalized"]))
    return q, occupations, values


def write_profile_csv(
    path: str | Path,
    occupations: list[tuple[int, ...]],
    normalized: list[Fraction],
    unnormalized: list[Fraction],
) -> None:
    Path(path).parent.mkdir(parents=True, exist_ok=True)
    fieldnames = (
        [f"occ_{i}" for i in range(len(STATES))]
        + [
            "profile_normalized",
            "profile_unnormalized",
            "profile_normalized_rational",
            "profile_unnormalized_rational",
        ]
    )
    with Path(path).open("w", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        writer.writeheader()
        for occ, norm, unnorm in zip(occupations, normalized, unnormalized):
            row = {f"occ_{i}": occ[i] for i in range(len(STATES))}
            row.update(
                {
                    "profile_normalized": float(norm),
                    "profile_unnormalized": float(unnorm),
                    "profile_normalized_rational": frac_to_str(norm),
                    "profile_unnormalized_rational": frac_to_str(unnorm),
                }
            )
            writer.writerow(row)


def canonical_edge(edge: Iterable[int]) -> tuple[int, int, int]:
    e = tuple(sorted(int(x) for x in edge))
    if len(e) != 3 or len(set(e)) != 3:
        raise ValueError(f"not a 3-edge: {edge}")
    return e


def parse_type_record(record: object) -> tuple[int, set[tuple[int, int, int]], Fraction]:
    """Parse one type from a permissive JSON schema.

    Preferred record shape:
      {"n": 7, "edges": [[0,1,2], ...], "moment": "1/23"}

    A legacy string may contain JSON with the same shape.
    """
    if isinstance(record, str):
        record = json.loads(record)
    if not isinstance(record, dict):
        raise ValueError(f"type record must be an object, got {type(record)}")
    n = int(record.get("n", record.get("vertices")))
    edges = {canonical_edge(edge) for edge in record.get("edges", [])}
    moment = parse_fraction(record.get("moment", record.get("weight", 0)))
    return n, edges, moment


def is_k4_free(n: int, edges: set[tuple[int, int, int]]) -> bool:
    for quad in combinations(range(n), 4):
        if all(canonical_edge(e) in edges for e in combinations(quad, 3)):
            return False
    return True


def column_state(root: tuple[int, int, int], x: int, edges: set[tuple[int, int, int]]) -> tuple[int, int, int]:
    a, b, c = root
    return (
        int(canonical_edge((a, b, x)) in edges),
        int(canonical_edge((a, c, x)) in edges),
        int(canonical_edge((b, c, x)) in edges),
    )

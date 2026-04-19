from __future__ import annotations

import argparse
from pathlib import Path

from transversal_small_h import (
    prolonger_highest_degree_vertex,
    prolonger_smallest_neighborhood,
    run_amortization_audit,
    write_results,
)
from transversal_small_h_strategy import (
    make_prolonger_lookahead_one,
    make_prolonger_shadow_pressure,
    make_prolonger_simplex_star_cascade,
    make_shortener_sigma,
    prolonger_max_claimed_overlap,
)


def default_cases() -> list[tuple[int, int]]:
    cases: list[tuple[int, int]] = []
    for h, max_N in ((3, 12), (4, 11), (5, 10), (6, 9)):
        for N in range(h + 1, max_N + 1):
            cases.append((N, h))
    return cases


def main() -> None:
    parser = argparse.ArgumentParser(description="Audit shadow-pressure growth against sigma.")
    parser.add_argument(
        "--csv",
        type=Path,
        default=Path("transversal_small_h_amortization_audit_results.csv"),
        help="Where to write the audit table",
    )
    args = parser.parse_args()

    sigma = make_shortener_sigma()
    prolonger_policies = {
        "simplex_star_cascade": make_prolonger_simplex_star_cascade(),
        "smallest_neighborhood": prolonger_smallest_neighborhood,
        "highest_degree_vertex": prolonger_highest_degree_vertex,
        "max_claimed_overlap": prolonger_max_claimed_overlap,
        "lookahead1": make_prolonger_lookahead_one(sigma),
        "shadow_pressure": make_prolonger_shadow_pressure(sigma),
    }
    rows = run_amortization_audit(default_cases(), sigma, prolonger_policies)
    write_results(rows, args.csv)

    rows_by_case: dict[tuple[int, int], dict[str, object]] = {}
    for row in rows:
        key = (int(row["N"]), int(row["h"]))
        incumbent = rows_by_case.get(key)
        if incumbent is None or float(row["max_useful_top_facets_over_edges_per_h"]) > float(
            incumbent["max_useful_top_facets_over_edges_per_h"]
        ):
            rows_by_case[key] = row

    for key in sorted(rows_by_case):
        row = rows_by_case[key]
        print(
            f"N={row['N']} h={row['h']} policy={row['policy']} "
            f"useful={row['max_useful_top_facets']} "
            f"useful/(E/h)={float(row['max_useful_top_facets_over_edges_per_h']):.3f} "
            f"norm/(E/h)={float(row['max_normalized_captured_boundary_over_edges_per_h']):.3f}"
        )


if __name__ == "__main__":
    main()

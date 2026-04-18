from __future__ import annotations

import argparse
import csv
import json
from pathlib import Path

from simulator import (
    ANALYSIS_PATH,
    GROUND_TRUTH_PATH,
    LOG_PATH,
    N_VALUES,
    PROLONGERS,
    RANDOM_SEEDS,
    RESULTS_PATH,
    ROOT,
    SHORTENERS,
    SUMMARY_PATH,
    append_result_row,
    build_analysis,
    build_ground_truth,
    log_line,
    play_match,
    summarize_results,
    write_summary_csv,
    ProbeContext,
)


def deterministic_prolongers() -> tuple[str, ...]:
    return tuple(name for name in PROLONGERS if name != "P_random")


def priority_pairs() -> list[tuple[str, str]]:
    return [
        ("S_slp_odd", "P_block_product"),
        ("S_slp_odd", "P_interval_top"),
        ("S_adaptive_prime", "P_block_product"),
        ("S_adaptive_prime", "P_interval_top"),
    ]


def extended_priority_pairs() -> list[tuple[str, str]]:
    pairs = priority_pairs()
    for shortener in ("S_primorial_anchor", "S_pair_response"):
        for prolonger in ("P_block_product", "P_interval_top"):
            pairs.append((shortener, prolonger))
    return pairs


def full_pairs() -> list[tuple[str, str]]:
    return [(shortener, prolonger) for shortener in SHORTENERS for prolonger in PROLONGERS]


def practical_jobs() -> list[tuple[str, str, int, int]]:
    jobs: list[tuple[str, str, int, int]] = []
    promising_random_shorteners = (
        "S_slp_odd",
        "S_adaptive_prime",
        "S_primorial_anchor",
        "S_pair_response",
    )

    for shortener in SHORTENERS:
        for prolonger in deterministic_prolongers():
            for n in N_VALUES:
                jobs.append((shortener, prolonger, n, 0))

    for shortener in SHORTENERS:
        for n in (10**3, 10**4, 10**5):
            for seed in RANDOM_SEEDS:
                jobs.append((shortener, "P_random", n, seed))

    for shortener in promising_random_shorteners:
        for seed in RANDOM_SEEDS:
            jobs.append((shortener, "P_random", 10**6, seed))

    return jobs


def select_jobs(mode: str) -> list[tuple[str, str, int, int]]:
    if mode == "priority1":
        pairs = priority_pairs()
        n_values = (10**3, 10**4, 10**5)
    elif mode == "priority2":
        pairs = extended_priority_pairs()
        n_values = (10**3, 10**4, 10**5)
    elif mode == "priority3":
        pairs = extended_priority_pairs()
        n_values = N_VALUES
    elif mode == "practical":
        return practical_jobs()
    elif mode == "full":
        pairs = full_pairs()
        n_values = N_VALUES
    else:
        raise ValueError(f"unknown mode {mode}")

    jobs: list[tuple[str, str, int, int]] = []
    for shortener, prolonger in pairs:
        seeds = RANDOM_SEEDS if prolonger == "P_random" else (0,)
        for n in n_values:
            for seed in seeds:
                jobs.append((shortener, prolonger, n, seed))
    return jobs


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Run the full dynamical carrier probe sweep.")
    parser.add_argument(
        "--mode",
        choices=("priority1", "priority2", "priority3", "practical", "full"),
        default="practical",
        help=(
            "Select the sweep size. `practical` keeps full deterministic coverage, full random coverage "
            "through 1e5, and 1e6 random runs for the most promising Shorteners. "
            "`full` reproduces the requested complete grid."
        ),
    )
    parser.add_argument(
        "--skip-ground-truth",
        action="store_true",
        help="Skip the optional small-n exact comparison.",
    )
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    ROOT.mkdir(parents=True, exist_ok=True)
    LOG_PATH.parent.mkdir(parents=True, exist_ok=True)

    for path in (RESULTS_PATH, SUMMARY_PATH, ANALYSIS_PATH):
        if path.exists():
            path.unlink()

    jobs = select_jobs(args.mode)
    total = len(jobs)
    rows: list[dict[str, object]] = []
    context_cache: dict[int, ProbeContext] = {}

    log_line(f"starting run_all mode={args.mode} jobs={total}")
    for index, (shortener, prolonger, n, seed) in enumerate(jobs, start=1):
        context = context_cache.get(n)
        if context is None:
            context = ProbeContext(n)
            context_cache[n] = context
        log_line(
            f"[{index}/{total}] start shortener={shortener} prolonger={prolonger} n={n} seed={seed}"
        )
        row = play_match(context, shortener, prolonger, seed)
        rows.append(row)
        append_result_row(RESULTS_PATH, row)
        log_line(
            f"[{index}/{total}] done shortener={shortener} prolonger={prolonger} "
            f"n={n} seed={seed} L={row['L']} sum_inv_p={row['sum_inv_p']:.6f} "
            f"ratio_to_loglog={row['ratio_to_loglog']:.6f} wall={row['wall_seconds']:.3f}"
        )

    summary_rows = summarize_results(rows)
    write_summary_csv(SUMMARY_PATH, summary_rows)
    ANALYSIS_PATH.write_text(build_analysis(rows, summary_rows), encoding="utf-8")
    log_line(f"wrote summary rows={len(summary_rows)} analysis={ANALYSIS_PATH}")

    if args.skip_ground_truth:
        if GROUND_TRUTH_PATH.exists():
            GROUND_TRUTH_PATH.unlink()
        log_line("skipped ground truth")
    else:
        GROUND_TRUTH_PATH.write_text(build_ground_truth(), encoding="utf-8")
        log_line(f"wrote ground truth {GROUND_TRUTH_PATH}")

    print(
        json.dumps(
            {
                "mode": args.mode,
                "jobs": total,
                "results_csv": str(RESULTS_PATH),
                "summary_csv": str(SUMMARY_PATH),
                "analysis_md": str(ANALYSIS_PATH),
                "ground_truth_md": None if args.skip_ground_truth else str(GROUND_TRUTH_PATH),
            },
            indent=2,
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()

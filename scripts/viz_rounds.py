#!/usr/bin/env python3
"""Render a visualization of the research program's round history.

Three-band timeline: each round is a dot positioned by round number (x) and
outcome (y = survived / open / ruled out). Red arcs connect refuted claims
to the rounds that refuted them. Output: SVG + high-res PNG.

Usage:
    scripts/viz_rounds.py  [--problem erdos-872] [--out docs/blog]
"""
from __future__ import annotations
import argparse
import re
import sys
from pathlib import Path
from collections import defaultdict

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
from matplotlib.patches import FancyArrowPatch

sys.path.insert(0, str(Path(__file__).resolve().parent))
from compile_rounds import collect_rounds, derive_status, bucket  # noqa: E402


ROUND_RE = re.compile(r"[Rr]?(\d+)")


def round_num(rid: str) -> int:
    m = ROUND_RE.search(rid)
    return int(m.group(1)) if m else 0


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--problem", default="erdos-872")
    ap.add_argument("--out", default="docs/blog")
    args = ap.parse_args()

    repo_root = Path(__file__).resolve().parent.parent
    rounds = collect_rounds(repo_root / args.problem)
    overrides = derive_status(rounds)
    buckets = bucket(rounds, overrides)

    status_of: dict[str, str] = {}
    refuter_of: dict[str, str] = {}

    for r in buckets["Established"]:
        status_of[r["id"]] = "Established"
    for item in buckets["Ruled Out"]:
        r = item["round"]
        status_of[r["id"]] = "Ruled Out"
        rb = item.get("refuted_by")
        if isinstance(rb, dict):
            refuter_of[r["id"]] = rb["id"]
    for r in buckets["Open / Partial"]:
        status_of[r["id"]] = "Open"
    for item in buckets["Retracted chains"]:
        r = item["round"]
        status_of[r["id"]] = "Retracted"
    for r in buckets["Pending-target refutations"]:
        status_of[r["id"]] = "Pending"

    # Refutations that stand are deliberately excluded from compile buckets
    # (their target shows up Ruled Out with the refuter as the "because").
    # For the viz they belong in the survived band: they are the moves that
    # killed something and themselves survived.
    by_id = {r["id"]: r for r in rounds}
    for r in rounds:
        rid = r["id"]
        if rid in status_of:
            continue
        if r.get("type") == "refutation":
            status_of[rid] = "Established"
        else:
            status_of[rid] = "Open"

    BAND = {
        "Established": 0.85,
        "Pending": 0.85,
        "Open": 0.15,
        "Retracted": 0.15,
        "Ruled Out": -0.75,
    }
    COLOR = {
        "Established": "#2E7D32",
        "Pending": "#558B2F",
        "Open": "#9E9E9E",
        "Retracted": "#FB8C00",
        "Ruled Out": "#C62828",
    }

    # Size / importance by type. Research and refutation are the thinking
    # units; synthesis / diagnostic are the stitching; verification is the
    # audit backdrop.
    SIZE = {
        "research": 70,
        "refutation": 80,
        "synthesis": 45,
        "diagnostic": 45,
        "verification": 14,
    }
    RING = {
        "refutation": "#B71C1C",
        "synthesis": "#1565C0",
    }

    positions: dict[str, tuple[float, float]] = {}
    stack_counter: dict[tuple[int, int], int] = defaultdict(int)
    # Stack verifications last so they sit outside the research core.
    def sort_key(rid: str):
        r = by_id[rid]
        t = r.get("type", "research")
        # research/refutation/synthesis first, verification after
        type_rank = 0 if t in ("research", "refutation", "synthesis", "diagnostic") else 1
        return (round_num(rid), type_rank, rid)
    sorted_ids = sorted(by_id.keys(), key=sort_key)

    for rid in sorted_ids:
        rn = round_num(rid)
        if rn == 0:
            continue
        r = by_id[rid]
        t = r.get("type", "research")
        status = status_of.get(rid, "Open")
        base_y = BAND.get(status, 0.0)
        key = (rn, int(base_y * 10))
        offset = stack_counter[key]
        stack_counter[key] += 1
        # Pack: main types get a tight inner cluster, verifications fan out.
        sign = 1 if base_y >= 0 else -1
        if t == "verification":
            col = offset % 6
            row = offset // 6
            dy = (col - 2.5) * 0.055 * sign + (row * 0.04 * sign)
            dx = (row - 0.5) * 0.22
        else:
            col = offset % 4
            row = offset // 4
            dy = (col - 1.5) * 0.08 * sign + (row * 0.05 * sign)
            dx = (row - 0.5) * 0.15
        positions[rid] = (rn + dx, base_y + dy)

    fig, ax = plt.subplots(figsize=(18, 9))
    fig.patch.set_facecolor("#FAFAFA")
    ax.set_facecolor("#FAFAFA")

    # Soft band backgrounds
    ax.axhspan(0.35, 1.4, color="#2E7D32", alpha=0.05, zorder=0)
    ax.axhspan(-0.25, 0.35, color="#9E9E9E", alpha=0.04, zorder=0)
    ax.axhspan(-1.4, -0.25, color="#C62828", alpha=0.05, zorder=0)

    ax.text(0.2, 1.25, "survived", fontsize=11, fontweight="bold",
            color="#2E7D32", alpha=0.85, family="sans-serif")
    ax.text(0.2, 0.22, "open / retracted", fontsize=10, fontweight="bold",
            color="#616161", alpha=0.85, family="sans-serif")
    ax.text(0.2, -1.25, "ruled out", fontsize=11, fontweight="bold",
            color="#C62828", alpha=0.85, family="sans-serif")

    # Day-boundary markers on X. Map each round number to the earliest date
    # of any artifact at that round; day boundaries become vertical rules.
    rn_dates: dict[int, list[str]] = defaultdict(list)
    for r in rounds:
        rn = round_num(r["id"])
        if rn == 0:
            continue
        d = str(r.get("date", ""))
        if d:
            rn_dates[rn].append(d)
    rn_min_date = {rn: min(ds) for rn, ds in rn_dates.items() if ds}
    if rn_min_date:
        sorted_rns = sorted(rn_min_date.keys())
        day_starts: list[tuple[int, str]] = []
        seen_dates: set[str] = set()
        for rn in sorted_rns:
            d = rn_min_date[rn]
            if d not in seen_dates:
                seen_dates.add(d)
                day_starts.append((rn, d))
        for rn, d in day_starts:
            ax.axvline(rn - 0.5, color="#CFD8DC", linewidth=0.6, zorder=0, alpha=0.8)
            ax.text(rn, -1.55, d, fontsize=7, color="#90A4AE",
                    ha="left", va="top", rotation=0)

    # Refutation arcs behind dots: bolder so the pruning is visible.
    for rid, refuter_id in refuter_of.items():
        if rid not in positions or refuter_id not in positions:
            continue
        x1, y1 = positions[rid]
        x2, y2 = positions[refuter_id]
        arc = FancyArrowPatch(
            (x1, y1), (x2, y2),
            connectionstyle="arc3,rad=-0.32",
            color="#C62828", alpha=0.45, linewidth=1.1,
            arrowstyle="->,head_width=3.2,head_length=4",
            zorder=2,
        )
        ax.add_patch(arc)

    # Dots, sized by type so research/refutation dominate and verifications recede.
    for rid, (x, y) in positions.items():
        status = status_of.get(rid, "Open")
        r = by_id[rid]
        t = r.get("type", "research")
        c = COLOR.get(status, "#9E9E9E")
        s = SIZE.get(t, 40)
        edge = RING.get(t, "white")
        lw = 1.2 if t in RING else 0.6
        alpha = 0.35 if t == "verification" else 1.0
        ax.scatter(x, y, color=c, s=s, zorder=4,
                   edgecolor=edge, linewidth=lw, alpha=alpha)

    # Bound-trajectory milestones above the survived band.
    milestones = [
        (0, "≤ 0.416n", "forum baseline"),
        (7, "≤ 0.361n", "13/36 closeout"),
        (8, "≤ 0.3125n", "5/16 improvement"),
        (15, "≤ 0.22n", "Round 15 piecewise"),
        (57, "≤ 0.190n", "Bonferroni-4 proof"),
    ]
    last_x = -5
    for mround, value, label in milestones:
        if mround - last_x < 4:
            y_offset = 1.95
        else:
            y_offset = 1.72
        last_x = mround
        ax.annotate(
            value,
            xy=(mround, 1.30),
            xytext=(mround, y_offset),
            fontsize=9, ha="center", color="#1B5E20", fontweight="bold",
            arrowprops=dict(arrowstyle="-", color="#81C784", linewidth=0.8, alpha=0.8),
        )
        ax.text(mround, y_offset + 0.1, label,
                fontsize=7.5, ha="center", color="#424242", alpha=0.85)

    ax.set_xlabel("Round number", fontsize=11, color="#424242")
    ax.set_xlim(-2, 61)
    ax.set_ylim(-1.75, 2.35)
    ax.set_yticks([])
    ax.set_xticks(range(0, 61, 5))

    for spine in ("top", "right", "left"):
        ax.spines[spine].set_visible(False)
    ax.spines["bottom"].set_color("#BDBDBD")
    ax.tick_params(axis="x", colors="#616161")

    fig.text(
        0.5, 0.95,
        "Erdős Problem 872  ·  5-day research program  ·  267 artifacts across 57 rounds",
        ha="center", fontsize=15, fontweight="bold", color="#212121",
    )
    sub = ("each dot is one research artifact (researcher response, audit, "
           "verification, followup).  red arcs connect refuted claims to the "
           "rounds that refuted them.")
    fig.text(0.5, 0.915, sub, ha="center", fontsize=10, color="#616161")

    # Two legends: color = outcome, size = artifact type.
    from matplotlib.lines import Line2D
    outcome_legend = [
        mpatches.Patch(color="#2E7D32", label="survived"),
        mpatches.Patch(color="#C62828", label="ruled out"),
        mpatches.Patch(color="#FB8C00", label="retracted"),
        mpatches.Patch(color="#9E9E9E", label="open / partial"),
    ]
    type_legend = [
        Line2D([0], [0], marker="o", color="w", markerfacecolor="#616161",
               markersize=9, label="research / refutation"),
        Line2D([0], [0], marker="o", color="w", markerfacecolor="#616161",
               markersize=7, label="synthesis / diagnostic"),
        Line2D([0], [0], marker="o", color="w", markerfacecolor="#616161",
               markersize=4, alpha=0.4, label="verification / audit"),
    ]
    leg1 = ax.legend(handles=outcome_legend, loc="lower right",
                     frameon=False, fontsize=9,
                     bbox_to_anchor=(1.0, 0.0), title="outcome",
                     title_fontsize=9)
    leg1.get_title().set_color("#424242")
    ax.add_artist(leg1)
    leg2 = ax.legend(handles=type_legend, loc="lower right",
                     frameon=False, fontsize=9,
                     bbox_to_anchor=(0.82, 0.0), title="artifact",
                     title_fontsize=9)
    leg2.get_title().set_color("#424242")

    n_estab = len(buckets["Established"])
    n_ruled = len(buckets["Ruled Out"])
    n_open = len(buckets["Open / Partial"])
    n_retr = len(buckets["Retracted chains"])
    stats = (f"{n_estab} survived   ·   {n_ruled} ruled out   ·   "
             f"{n_retr} retracted   ·   {n_open} open")
    fig.text(0.5, 0.03, stats, ha="center", fontsize=10,
             color="#424242", family="sans-serif")

    plt.tight_layout(rect=[0, 0.05, 1, 0.91])

    out_dir = repo_root / args.out
    out_dir.mkdir(parents=True, exist_ok=True)
    svg = out_dir / "progress-graph.svg"
    png = out_dir / "progress-graph.png"
    plt.savefig(svg, bbox_inches="tight", facecolor="#FAFAFA")
    plt.savefig(png, bbox_inches="tight", dpi=180, facecolor="#FAFAFA")
    print(f"Saved {svg.relative_to(repo_root)}")
    print(f"Saved {png.relative_to(repo_root)}")
    print(f"Stats: {stats}")


if __name__ == "__main__":
    main()

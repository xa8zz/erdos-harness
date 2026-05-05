#!/usr/bin/env python3
"""Branch graph of the research program — HTML + inline SVG output.

Each non-verification round is a node. Lanes are lines of attack (weakly
connected components of the predecessor + extends + confirms backbone).
Node color is the model family that produced it. Red dashed arcs connect
each refuter to the round it refuted (crossing lanes).

Open the output file in a browser.

Usage:
    scripts/viz_branches.py  [--problem erdos-872] [--out docs/blog]
"""
from __future__ import annotations
import argparse
import re
import sys
from pathlib import Path
from collections import defaultdict
from html import escape

sys.path.insert(0, str(Path(__file__).resolve().parent))
from compile_rounds import collect_rounds, derive_status, bucket  # noqa: E402


ROUND_RE = re.compile(r"[Rr]?(\d+)")


MODEL_COLOR = {
    "GPT Pro":    "#10B981",
    "Codex":      "#047857",
    "Claude":     "#F97316",
    "Gemini":     "#3B82F6",
    "DeepThink":  "#1E3A8A",
    "Aristotle":  "#8B5CF6",
    "Unknown":    "#94A3B8",
}


def detect_model(rid: str, extra: str = "") -> str:
    text = (rid + " " + (extra or "")).lower()
    if "aristotle" in text:
        return "Aristotle"
    if "deepthink" in text or "deep-think" in text:
        return "DeepThink"
    if "codex" in text:
        return "Codex"
    # Several naming conventions for GPT Pro: -pro-, -pro1, -pro2, fresh-pro, pro-...
    if re.search(r"\bpro\b", text) or "-pro-" in text or "-pro1" in text or "-pro2" in text or "fresh-pro" in text or "chatgpt" in text:
        return "GPT Pro"
    if "gemini" in text:
        return "Gemini"
    if "claude" in text:
        return "Claude"
    return "Unknown"


def round_num(rid: str) -> int:
    m = ROUND_RE.search(rid)
    return int(m.group(1)) if m else 0


def derive_status_map(rounds_all: list, buckets) -> dict:
    status_of: dict[str, str] = {}
    for r in buckets["Established"]:
        status_of[r["id"]] = "survived"
    for item in buckets["Ruled Out"]:
        status_of[item["round"]["id"]] = "ruled_out"
    for r in buckets["Open / Partial"]:
        status_of[r["id"]] = "open"
    for item in buckets["Retracted chains"]:
        status_of[item["round"]["id"]] = "retracted"
    for r in buckets["Pending-target refutations"]:
        status_of[r["id"]] = "survived"
    for r in rounds_all:
        if r["id"] not in status_of:
            if r.get("type") == "refutation":
                status_of[r["id"]] = "survived"
            else:
                status_of[r["id"]] = "open"
    return status_of


def shorten(text: str, n: int) -> str:
    text = (text or "").strip()
    if len(text) <= n:
        return text
    cut = text[:n].rsplit(" ", 1)[0]
    return cut + "…"


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--problem", default="erdos-872")
    ap.add_argument("--out", default="docs/blog")
    args = ap.parse_args()

    repo_root = Path(__file__).resolve().parent.parent
    rounds_all = collect_rounds(repo_root / args.problem)

    rounds = [
        r for r in rounds_all
        if r.get("type") in ("research", "refutation", "synthesis", "diagnostic")
        and round_num(r["id"]) > 0
    ]

    overrides = derive_status(rounds_all)
    buckets = bucket(rounds_all, overrides)
    status_of = derive_status_map(rounds_all, buckets)

    node_ids = {r["id"] for r in rounds}
    by_id = {r["id"]: r for r in rounds}

    # Edges: for lane clustering, use PREDECESSOR edges only (stricter: each
    # new line-of-attack forks its own component). extends/confirms are
    # tracked separately for backbone rendering. Refutes/supersedes are
    # the cross-lane arcs.
    pred_edges: list[tuple[str, str]] = []
    link_edges: list[tuple[str, str]] = []   # extends / confirms
    refute_edges: list[tuple[str, str]] = []
    for r in rounds:
        rid = r["id"]
        preds = r.get("predecessors") or []
        if not isinstance(preds, list):
            preds = [preds]
        for p in preds:
            if p and p in node_ids:
                pred_edges.append((p, rid))
        action = r.get("action") or {}
        if not isinstance(action, dict):
            continue
        akind = action.get("kind")
        atgt = action.get("target")
        if akind in ("extends", "confirms") and atgt and atgt in node_ids:
            link_edges.append((atgt, rid))
        elif akind in ("refutes", "supersedes") and atgt and atgt in node_ids:
            refute_edges.append((rid, atgt))

    backbone_edges = pred_edges + link_edges

    # Union-find on PREDECESSOR edges only for lane clustering
    parent = {rid: rid for rid in node_ids}
    def find(x):
        while parent[x] != x:
            parent[x] = parent[parent[x]]
            x = parent[x]
        return x
    def union(a, b):
        ra, rb = find(a), find(b)
        if ra != rb:
            parent[ra] = rb
    for src, dst in pred_edges:
        union(src, dst)

    comps_dict: dict[str, list[str]] = defaultdict(list)
    for rid in node_ids:
        comps_dict[find(rid)].append(rid)
    comps = list(comps_dict.values())

    # Sort: biggest first, then by earliest round
    def comp_key(comp):
        earliest = min(round_num(n) for n in comp)
        return (-len(comp), earliest)
    comps.sort(key=comp_key)

    # Collapse lanes with fewer than SMALL_LANE nodes into a single "misc" lane
    SMALL_LANE = 3
    main_comps = [c for c in comps if len(c) >= SMALL_LANE]
    small_comps = [c for c in comps if len(c) < SMALL_LANE]

    lane_of: dict[str, int] = {}
    lane_names: dict[int, str] = {}
    lane_sizes: dict[int, int] = {}
    for lane_idx, comp in enumerate(main_comps):
        for rid in comp:
            lane_of[rid] = lane_idx
        earliest_rid = min(comp, key=lambda x: (round_num(x), x))
        er = by_id[earliest_rid]
        intent = er.get("intent") or ""
        name = shorten(intent, 50)
        if not name:
            name = earliest_rid[:40]
        lane_names[lane_idx] = name
        lane_sizes[lane_idx] = len(comp)

    if small_comps:
        misc_idx = len(main_comps)
        misc_nodes = [rid for comp in small_comps for rid in comp]
        for rid in misc_nodes:
            lane_of[rid] = misc_idx
        lane_names[misc_idx] = f"misc. short attempts ({len(small_comps)} branches)"
        lane_sizes[misc_idx] = len(misc_nodes)

    # Positions with intra-slot stacking
    slot_total: dict[tuple[int, int], int] = defaultdict(int)
    for rid in node_ids:
        slot_total[(round_num(rid), lane_of[rid])] += 1
    slot_counter: dict[tuple[int, int], int] = defaultdict(int)
    positions: dict[str, tuple[float, float]] = {}

    ROUND_PX = 22
    LANE_PX = 64
    MARGIN_L = 300
    MARGIN_R = 48
    MARGIN_T = 90
    MARGIN_B = 40
    max_round = max(round_num(rid) for rid in node_ids)
    num_lanes = len(main_comps) + (1 if small_comps else 0)
    width = MARGIN_L + MARGIN_R + (max_round + 2) * ROUND_PX
    height = MARGIN_T + MARGIN_B + num_lanes * LANE_PX

    for rid in sorted(node_ids, key=lambda x: (round_num(x), x)):
        rn = round_num(rid)
        lane = lane_of[rid]
        total = slot_total[(rn, lane)]
        slot = slot_counter[(rn, lane)]
        slot_counter[(rn, lane)] += 1
        dy = (slot - (total - 1) / 2) * 9
        x = MARGIN_L + rn * ROUND_PX
        y = MARGIN_T + lane * LANE_PX + dy
        positions[rid] = (x, y)

    # SVG
    svg_lines = [
        f'<svg width="{width}" height="{height}" xmlns="http://www.w3.org/2000/svg" '
        f'font-family="-apple-system, BlinkMacSystemFont, \'Segoe UI\', sans-serif">',
        '<defs>',
        '<marker id="arrow-refute" viewBox="0 0 10 10" refX="9" refY="5" '
        'markerWidth="5" markerHeight="5" orient="auto-start-reverse">'
        '<path d="M0,0 L10,5 L0,10 Z" fill="#DC2626" opacity="0.65"/></marker>',
        '</defs>',
    ]

    # Lane backgrounds
    for lane_idx in range(num_lanes):
        y = MARGIN_T + lane_idx * LANE_PX
        shade = "#F8FAFC" if lane_idx % 2 == 0 else "#F1F5F9"
        svg_lines.append(
            f'<rect x="0" y="{y - LANE_PX / 2}" width="{width}" '
            f'height="{LANE_PX}" fill="{shade}"/>'
        )

    # Vertical round markers
    for rn in range(0, max_round + 1, 5):
        x = MARGIN_L + rn * ROUND_PX
        svg_lines.append(
            f'<line x1="{x}" y1="{MARGIN_T - 30}" x2="{x}" '
            f'y2="{MARGIN_T + (num_lanes - 1) * LANE_PX + LANE_PX / 2}" '
            f'stroke="#E2E8F0" stroke-width="1" stroke-dasharray="2,3"/>'
        )
        svg_lines.append(
            f'<text x="{x}" y="{MARGIN_T - 42}" text-anchor="middle" '
            f'font-size="11" fill="#64748B">R{rn}</text>'
        )

    # Lane labels
    for lane_idx, name in lane_names.items():
        y = MARGIN_T + lane_idx * LANE_PX
        size = lane_sizes.get(lane_idx, 0)
        label = name if name else f"lane {lane_idx}"
        svg_lines.append(
            f'<text x="{MARGIN_L - 14}" y="{y + 4}" text-anchor="end" '
            f'font-size="11" fill="#334155">{escape(label)}</text>'
        )
        svg_lines.append(
            f'<text x="{MARGIN_L - 14}" y="{y + 17}" text-anchor="end" '
            f'font-size="9" fill="#94A3B8">{size} rounds</text>'
        )

    # Backbone edges (thin gray)
    for src, dst in backbone_edges:
        if src not in positions or dst not in positions:
            continue
        x1, y1 = positions[src]
        x2, y2 = positions[dst]
        if abs(y2 - y1) < 1:
            svg_lines.append(
                f'<line x1="{x1}" y1="{y1}" x2="{x2}" y2="{y2}" '
                f'stroke="#CBD5E1" stroke-width="1.1" opacity="0.75"/>'
            )
        else:
            mx = (x1 + x2) / 2
            svg_lines.append(
                f'<path d="M{x1},{y1} C{mx},{y1} {mx},{y2} {x2},{y2}" '
                f'stroke="#CBD5E1" stroke-width="1.1" fill="none" opacity="0.75"/>'
            )

    # Refute edges (curved red dashed with arrow). Curve direction based on
    # vertical relationship so the arc avoids overlapping the target lane.
    for src, dst in refute_edges:
        if src not in positions or dst not in positions:
            continue
        x1, y1 = positions[src]
        x2, y2 = positions[dst]
        mx = (x1 + x2) / 2
        # Curve away from the mid-y so arcs don't pile up on other lanes
        bow = 28 if y1 < y2 else -28
        my = (y1 + y2) / 2 + bow
        svg_lines.append(
            f'<path d="M{x1},{y1} Q{mx},{my} {x2},{y2}" '
            f'stroke="#DC2626" stroke-width="1.6" fill="none" opacity="0.8" '
            f'stroke-dasharray="5,3" marker-end="url(#arrow-refute)"/>'
        )

    # Nodes
    for rid in node_ids:
        x, y = positions[rid]
        r = by_id[rid]
        intent = r.get("intent", "") or ""
        claim = r.get("claim", "") or ""
        failure = r.get("failure_mechanism", "") or ""
        model = detect_model(rid, intent + " " + claim)
        color = MODEL_COLOR[model]
        status = status_of.get(rid, "open")
        rtype = r.get("type", "research")

        data_attrs = (
            f'data-id="{escape(rid)}" '
            f'data-intent="{escape(intent)}" '
            f'data-claim="{escape(shorten(claim, 500))}" '
            f'data-failure="{escape(shorten(failure, 300))}" '
            f'data-model="{escape(model)}" '
            f'data-status="{escape(status)}" '
            f'data-type="{escape(rtype)}" '
            f'data-round="R{round_num(rid)}"'
        )

        radius = 6 if rtype in ("research", "refutation") else 4
        if status == "ruled_out":
            svg_lines.append(
                f'<g class="node" {data_attrs}>'
                f'<circle cx="{x}" cy="{y}" r="{radius}" fill="#FEE2E2" '
                f'stroke="{color}" stroke-width="1.8"/>'
                f'<line x1="{x - radius + 1}" y1="{y - radius + 1}" '
                f'x2="{x + radius - 1}" y2="{y + radius - 1}" '
                f'stroke="#991B1B" stroke-width="1.5"/>'
                f'<line x1="{x - radius + 1}" y1="{y + radius - 1}" '
                f'x2="{x + radius - 1}" y2="{y - radius + 1}" '
                f'stroke="#991B1B" stroke-width="1.5"/>'
                f'</g>'
            )
        elif status == "retracted":
            svg_lines.append(
                f'<g class="node" {data_attrs}>'
                f'<circle cx="{x}" cy="{y}" r="{radius}" fill="#FED7AA" '
                f'stroke="{color}" stroke-width="2"/>'
                f'</g>'
            )
        else:
            # refutation-type gets a red ring to show it was a killer move
            ring = "#991B1B" if rtype == "refutation" else "#fff"
            rw = 1.5 if rtype == "refutation" else 1.0
            svg_lines.append(
                f'<g class="node" {data_attrs}>'
                f'<circle cx="{x}" cy="{y}" r="{radius}" fill="{color}" '
                f'stroke="{ring}" stroke-width="{rw}"/>'
                f'</g>'
            )

    svg_lines.append('</svg>')
    svg = "\n".join(svg_lines)

    model_chips = "\n".join(
        f'<span class="legend-item"><span class="chip" style="background:{color}"></span>{name}</span>'
        for name, color in MODEL_COLOR.items()
    )

    total_nodes = len(node_ids)
    total_refutes = len(refute_edges)
    stats = (
        f"{total_nodes} research nodes across {num_lanes} attack families "
        f"— {total_refutes} refutation arcs — "
        f"{len([n for n in node_ids if status_of.get(n) == 'ruled_out'])} ruled-out rounds"
    )

    html = f"""<!DOCTYPE html>
<html lang="en"><head>
<meta charset="utf-8">
<title>Erdős 872 · branch graph</title>
<style>
  body {{
    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
    background: #FAFAFA; margin: 0; color: #0F172A;
  }}
  .container {{ padding: 28px 24px 48px; max-width: 100%; }}
  h1 {{ font-size: 22px; margin: 0 0 4px; font-weight: 700; }}
  .sub {{ color: #64748B; font-size: 13px; margin-bottom: 16px; max-width: 900px; line-height: 1.5; }}
  .legend {{
    display: flex; gap: 14px 22px; flex-wrap: wrap; font-size: 12px;
    color: #475569; margin: 0 0 18px;
  }}
  .legend-item {{ display: inline-flex; align-items: center; }}
  .chip {{
    display: inline-block; width: 11px; height: 11px; border-radius: 50%;
    margin-right: 6px;
  }}
  .sep {{ color: #CBD5E1; margin: 0 4px; }}
  .graph-wrap {{
    overflow-x: auto; border: 1px solid #E2E8F0; border-radius: 8px;
    background: #fff;
  }}
  .node {{ cursor: pointer; }}
  .node:hover circle {{ stroke: #0F172A !important; stroke-width: 2.4 !important; }}
  .stats {{ color: #475569; font-size: 12px; margin-top: 10px; }}
  #tooltip {{
    position: fixed; background: #0F172A; color: #F1F5F9; padding: 10px 12px;
    border-radius: 6px; font-size: 12px; pointer-events: none; display: none;
    max-width: 380px; z-index: 100; line-height: 1.5;
    box-shadow: 0 6px 18px rgba(0,0,0,0.2);
  }}
  #tooltip .hdr {{ font-weight: 700; color: #FDE68A; margin-bottom: 2px; }}
  #tooltip .sub {{
    color: #A7F3D0; font-size: 11px; margin-bottom: 4px; padding: 0;
  }}
  #tooltip .label {{
    color: #94A3B8; font-size: 10px; text-transform: uppercase;
    margin-top: 7px; letter-spacing: 0.04em;
  }}
  #tooltip .body {{ color: #E2E8F0; }}
</style>
</head>
<body>
<div class="container">
  <h1>Erdős 872 · branch graph</h1>
  <div class="sub">
    Each node is one research artifact. Lanes are attack families (weakly
    connected by continuation / extension). Red dashed arcs are refutations —
    the arrow points from the killer to the round it killed. Hover any node
    for detail.
  </div>
  <div class="legend">
    {model_chips}
    <span class="sep">|</span>
    <span class="legend-item"><span class="chip" style="background:#DC2626"></span>refutation arc</span>
    <span class="legend-item"><span class="chip" style="background:#FEE2E2; border:1.5px solid #991B1B"></span>ruled out</span>
    <span class="legend-item"><span class="chip" style="background:#FED7AA; border:1.5px solid #9A3412"></span>retracted</span>
    <span class="legend-item"><span class="chip" style="background:#10B981; border:1.5px solid #991B1B"></span>refutation (killer move)</span>
  </div>
  <div class="graph-wrap">
    {svg}
  </div>
  <div class="stats">{escape(stats)}</div>
</div>
<div id="tooltip"></div>
<script>
  const tooltip = document.getElementById('tooltip');
  document.querySelectorAll('.node').forEach(el => {{
    el.addEventListener('mouseenter', () => {{
      const d = el.dataset;
      let html = `<div class="hdr">${{d.id}}</div>`;
      html += `<div class="sub">${{d.round}} · ${{d.model}} · ${{d.type}} · ${{d.status}}</div>`;
      if (d.intent) html += `<div class="label">intent</div><div class="body">${{d.intent}}</div>`;
      if (d.claim) html += `<div class="label">claim</div><div class="body">${{d.claim}}</div>`;
      if (d.failure) html += `<div class="label">failure mechanism</div><div class="body">${{d.failure}}</div>`;
      tooltip.innerHTML = html;
      tooltip.style.display = 'block';
    }});
    el.addEventListener('mousemove', (e) => {{
      const w = 380;
      let left = e.clientX + 16;
      if (left + w > window.innerWidth) left = e.clientX - w - 16;
      tooltip.style.left = left + 'px';
      tooltip.style.top = (e.clientY + 16) + 'px';
    }});
    el.addEventListener('mouseleave', () => {{
      tooltip.style.display = 'none';
    }});
  }});
</script>
</body></html>
"""

    out_html = repo_root / args.out / "progress-branches.html"
    out_html.parent.mkdir(parents=True, exist_ok=True)
    out_html.write_text(html)
    print(f"Saved {out_html.relative_to(repo_root)}")
    print(f"Lanes: {num_lanes} · Nodes: {total_nodes} · Backbone: {len(backbone_edges)} · Refutations: {total_refutes}")


if __name__ == "__main__":
    main()

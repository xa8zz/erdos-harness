#!/usr/bin/env python3
"""Generate program-chart.html for Erdős 872.

X = round number, Y = cumulative weight of results in the paper.
Trunk = polyline through result moments. Branches = blocked attempts.
Black background, dark-mode minimalist aesthetic.
"""
import math
from pathlib import Path

# Geometry
VBW, VBH = 1800, 1050
PLOT_L, PLOT_R = 220, 1500
PLOT_T, PLOT_B = 100, 950
ROUND_MAX = 62
W_MAX = 50

def x(r): return PLOT_L + r * (PLOT_R - PLOT_L) / ROUND_MAX
def y(w): return PLOT_B - w * (PLOT_B - PLOT_T) / W_MAX

# (round, cumulative_weight, label, sig_contribution, label_pos)
# label_pos: 'L'=left, 'R'=right, 'B'=below, 'T'=top
RESULTS = [
    (0,  0,  'public baseline',                                0, 'B'),
    (1,  14, 'structural burst',                               4, 'T'),
    (7,  16, '13/36 closeout',                                 2, 'R'),
    (8,  19, '5/16 improvement',                               3, 'R'),
    (13, 28, 'fan capture + unconditional LB',                 4, 'B'),
    (56, 31, 'separator-only barrier',                         3, 'B'),
    (57, 38, 'Bonferroni-4 · L(n) ≤ 0.190n',                   5, 'R'),
    (58, 41, 'Sherali-Adams transversal barrier',              3, 'R'),
    (59, 44, 'q-shadow covering dichotomy',                    3, 'R'),
    (60, 46, 'W₄ interval certificate',                        2, 'R'),
]

# Compact sub-text for bursts: rendered as a single secondary line
R1_SUB  = 'Shield Reduction · τ(n) = 5n/24 cover · Theorem A'
R13_SUB = 'fan-capture lemma · (1/8) n log log n / log n · T2 target'

# (round, label, branch-length, side: +1 above-right, -1 below-right)
NAMED = [
    (5,  'Bonferroni flaw',                          180, +1),
    (12, 'cross-block semiprime',                    230, +1),
    (18, 'matching UB · O(n log log n / log n)',     280, +1),
    (22, 'Bernoulli-star refuted',                   170, +1),
    (39, 'dense-packet projection',                  240, +1),
    (41, 'collision-forcing reduction',              340, +1),
    (52, 'CPD chain · multi-apex obstruction',       210, -1),
]

UNLABELED = [2, 3, 4, 6, 9, 10, 11, 14, 15, 16, 17, 19, 20, 21, 23, 24, 25, 26,
             27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 40, 42, 43, 44, 45,
             46, 47, 48, 49, 50, 51, 53, 54, 55]

ANGLE = 35  # degrees from horizontal
SIN_A = math.sin(math.radians(ANGLE))
COS_A = math.cos(math.radians(ANGLE))

def poly_y(r: float) -> float:
    """Y position on the trunk polyline at round r."""
    for i in range(len(RESULTS) - 1):
        r0, w0 = RESULTS[i][0], RESULTS[i][1]
        r1, w1 = RESULTS[i+1][0], RESULTS[i+1][1]
        if r0 <= r <= r1:
            if r1 == r0:
                return y(w0)
            w = w0 + (w1 - w0) * (r - r0) / (r1 - r0)
            return y(w)
    return y(RESULTS[-1][1])

def branch_end(sx: float, sy: float, L: float, side: int = +1) -> tuple[float, float]:
    """side=+1 above-right (up), -1 below-right (down)."""
    return (sx + L * COS_A, sy - side * L * SIN_A)

# Build SVG
parts = []
parts.append(f'<svg viewBox="0 0 {VBW} {VBH}" xmlns="http://www.w3.org/2000/svg" '
             f'font-family="Geist, ui-sans-serif, system-ui, sans-serif">')
parts.append(f'<rect width="{VBW}" height="{VBH}" fill="#000000"/>')

# Title + legend INSIDE the chart area, top-left
parts.append('<text x="260" y="160" fill="#FFFFFF" font-size="26" font-weight="600" '
             'letter-spacing="-0.015em">attempting Erdős 872</text>')
parts.append('<text x="260" y="190" fill="#A1A1A1" font-size="13.5">'
             '60+ rounds of AI research attempts</text>')

parts.append('<g transform="translate(260, 232)" font-size="13">')
parts.append('<circle cx="6" cy="0" r="6" fill="#4ADE80"/>')
parts.append('<text x="22" y="4" fill="#A1A1A1">progress</text>')
parts.append('<line x1="0" y1="24" x2="12" y2="36" stroke="#F87171" stroke-width="1.8"/>')
parts.append('<line x1="12" y1="24" x2="0" y2="36" stroke="#F87171" stroke-width="1.8"/>')
parts.append('<text x="22" y="34" fill="#A1A1A1">blocked attempt</text>')
parts.append('</g>')

# Soft baseline guide along x-axis (very subtle)
parts.append(f'<line x1="{PLOT_L}" y1="{PLOT_B}" x2="{PLOT_R + 30}" y2="{PLOT_B}" '
             f'stroke="#1A1A1A" stroke-width="0.6"/>')

# Trunk: polyline through result dots
trunk_pts = ' '.join(f"{x(r):.1f},{y(w):.1f}" for (r, w, _, _, _) in RESULTS)
parts.append(f'<polyline points="{trunk_pts}" stroke="#FFFFFF" stroke-width="2.4" fill="none" stroke-linejoin="round"/>')

# Unlabeled small X branches (texture)
named_rounds = {r for r, _, _, _ in NAMED}
result_rounds = {r for r, _, _, _, _ in RESULTS}
for r in UNLABELED:
    if r in named_rounds or r in result_rounds:
        continue
    sx, sy = x(r), poly_y(r)
    L = 50
    ex, ey = branch_end(sx, sy, L)
    parts.append(f'<line x1="{sx:.1f}" y1="{sy:.1f}" x2="{ex:.1f}" y2="{ey:.1f}" '
                 f'stroke="#525252" stroke-width="0.7" opacity="0.65"/>')
    s = 4
    parts.append(f'<line x1="{ex - s:.1f}" y1="{ey - s:.1f}" x2="{ex + s:.1f}" '
                 f'y2="{ey + s:.1f}" stroke="#F87171" stroke-width="1.3" opacity="0.85"/>')
    parts.append(f'<line x1="{ex + s:.1f}" y1="{ey - s:.1f}" x2="{ex - s:.1f}" '
                 f'y2="{ey + s:.1f}" stroke="#F87171" stroke-width="1.3" opacity="0.85"/>')

# Named refutations
for (r, label, L, side) in NAMED:
    sx, sy = x(r), poly_y(r)
    ex, ey = branch_end(sx, sy, L, side)
    parts.append(f'<line x1="{sx:.1f}" y1="{sy:.1f}" x2="{ex:.1f}" y2="{ey:.1f}" '
                 f'stroke="#525252" stroke-width="0.9"/>')
    s = 6
    parts.append(f'<line x1="{ex - s:.1f}" y1="{ey - s:.1f}" x2="{ex + s:.1f}" '
                 f'y2="{ey + s:.1f}" stroke="#F87171" stroke-width="1.7"/>')
    parts.append(f'<line x1="{ex + s:.1f}" y1="{ey - s:.1f}" x2="{ex - s:.1f}" '
                 f'y2="{ey + s:.1f}" stroke="#F87171" stroke-width="1.7"/>')
    parts.append(f'<text x="{ex + 12:.1f}" y="{ey - 2:.1f}" '
                 f'fill="#FCA5A5" font-size="13" font-weight="500">{label}</text>')
    parts.append(f'<text x="{ex + 12:.1f}" y="{ey + 14:.1f}" '
                 f'fill="#737373" font-size="10.5" font-family="Geist Mono, monospace">'
                 f'R{r} · blocked</text>')

# Result dots (drawn last)
for (r, w, label, sig, lpos) in RESULTS:
    px, py = x(r), y(w)
    if r == 0:
        # Baseline marker
        parts.append(f'<circle cx="{px:.1f}" cy="{py:.1f}" r="6" fill="#A1A1A1" '
                     f'stroke="#000000" stroke-width="2"/>')
        parts.append(f'<text x="{px - 14:.1f}" y="{py + 4:.1f}" text-anchor="end" '
                     f'fill="#FFFFFF" font-size="13" font-weight="600">public baseline</text>')
        parts.append(f'<text x="{px - 14:.1f}" y="{py + 20:.1f}" text-anchor="end" '
                     f'fill="#A1A1A1" font-size="11" font-family="Geist Mono, monospace">'
                     f'R0 · ≤ 0.416n</text>')
        continue

    # Headline ring for biggest result (sig=5)
    if sig == 5:
        parts.append(f'<circle cx="{px:.1f}" cy="{py:.1f}" r="16" fill="none" '
                     f'stroke="#4ADE80" stroke-width="1.2" opacity="0.35"/>')
        parts.append(f'<circle cx="{px:.1f}" cy="{py:.1f}" r="22" fill="none" '
                     f'stroke="#4ADE80" stroke-width="0.7" opacity="0.18"/>')

    radius = {2: 5, 3: 6, 4: 9, 5: 11}.get(sig, 6)
    parts.append(f'<circle cx="{px:.1f}" cy="{py:.1f}" r="{radius}" fill="#4ADE80" '
                 f'stroke="#000000" stroke-width="2"/>')

    # Label placement
    if lpos == 'B':  # below
        parts.append(f'<text x="{px:.1f}" y="{py + radius + 22:.1f}" text-anchor="middle" '
                     f'fill="#FFFFFF" font-size="12.5" font-weight="600">{label}</text>')
        parts.append(f'<text x="{px:.1f}" y="{py + radius + 38:.1f}" text-anchor="middle" '
                     f'fill="#A1A1A1" font-size="10.5" font-family="Geist Mono, monospace">'
                     f'R{r}</text>')
    elif lpos == 'T':  # top
        parts.append(f'<text x="{px:.1f}" y="{py - radius - 26:.1f}" text-anchor="middle" '
                     f'fill="#FFFFFF" font-size="12.5" font-weight="600">{label}</text>')
        parts.append(f'<text x="{px:.1f}" y="{py - radius - 12:.1f}" text-anchor="middle" '
                     f'fill="#A1A1A1" font-size="10.5" font-family="Geist Mono, monospace">'
                     f'R{r}</text>')
    elif lpos == 'L':  # left
        parts.append(f'<text x="{px - radius - 12:.1f}" y="{py + 4:.1f}" text-anchor="end" '
                     f'fill="#FFFFFF" font-size="12.5" font-weight="600">{label}</text>')
        parts.append(f'<text x="{px - radius - 12:.1f}" y="{py + 20:.1f}" text-anchor="end" '
                     f'fill="#A1A1A1" font-size="10.5" font-family="Geist Mono, monospace">'
                     f'R{r}</text>')
    elif lpos == 'R':  # right
        parts.append(f'<text x="{px + radius + 12:.1f}" y="{py + 4:.1f}" '
                     f'fill="#FFFFFF" font-size="12.5" font-weight="600">{label}</text>')
        parts.append(f'<text x="{px + radius + 12:.1f}" y="{py + 20:.1f}" '
                     f'fill="#A1A1A1" font-size="10.5" font-family="Geist Mono, monospace">'
                     f'R{r}</text>')

# Axis hints (subtle, inside viewBox)
parts.append(f'<text x="{(PLOT_L + PLOT_R)/2:.1f}" y="1030" text-anchor="middle" '
             f'fill="#525252" font-size="11" letter-spacing="0.06em">round number →</text>')
parts.append(f'<text x="80" y="{(PLOT_T + PLOT_B)/2:.1f}" text-anchor="middle" '
             f'fill="#525252" font-size="11" letter-spacing="0.06em" '
             f'transform="rotate(-90 80 {(PLOT_T + PLOT_B)/2:.1f})">'
             f'cumulative weight of results in paper →</text>')

parts.append('</svg>')

svg_content = '\n'.join(parts)

html = f"""<!DOCTYPE html>
<html><head>
<meta charset="utf-8">
<title>Erdős 872 · program tree</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Geist:wght@400;500;600&family=Geist+Mono:wght@400;500&family=Newsreader:ital,wght@1,400&display=swap" rel="stylesheet">
<style>
  html, body {{ margin: 0; padding: 0; background: #000000; }}
  .frame {{ max-width: 1800px; margin: 0 auto; }}
  svg {{ display: block; width: 100%; height: auto; }}
</style>
</head><body>
<div class="frame">
{svg_content}
</div>
</body></html>"""

repo = Path(__file__).resolve().parent.parent
out_html = repo / 'docs' / 'blog' / 'program-chart.html'
out_svg = repo / 'docs' / 'blog' / 'program-chart.svg'
out_html.write_text(html)
out_svg.write_text('<?xml version="1.0" encoding="UTF-8"?>\n' + svg_content)
print(f"Saved {out_html.relative_to(repo)}")
print(f"Saved {out_svg.relative_to(repo)}")

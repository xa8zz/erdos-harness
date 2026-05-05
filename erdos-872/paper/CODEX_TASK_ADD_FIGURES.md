# Codex Task: Add Three Pedagogical Figures

## Scope and intent

The paper currently has zero figures. Three sections would benefit
meaningfully from a visual: the shield reduction framework in §3, the
exact $5/24$ cover construction in §5, and the piecewise lower-profile
function driving §7. Each figure demystifies the single most
load-bearing object of its section without changing any mathematical
content.

This task adds all three figures plus the minimal preamble support.
It does **not** add figures elsewhere (Theorem 4.4 fan, numerical
grid convergence, worked game-tree example) — those were considered
and deferred.

Working directory: `/Users/omisverycool/erdos-harness`.
Paper directory:   `erdos-872/paper/`.

## Compile / workflow rules

- Rebuild with `tectonic -X compile main.tex` from `erdos-872/paper/`
  after each commit. Zero undefined references, zero missing figures,
  zero new `Overfull \hbox` beyond pre-existing bibliography
  `Underfull`s.
- **Four commits**, one per group (A–D).
- No amend, no force-push, no `--no-verify`. Do not push to remote.
- If a figure overflows the text width or breaks float placement,
  iterate on `scale=` / `xscale=` / `width=` until it fits cleanly; do
  not reduce content to force a fit.

---

## Group A — Preamble support

**Commit message:** `Paper: add pgfplots and tikz libraries for figures`.

### Where

`erdos-872/paper/preamble.tex`.

### What to change

`tikz` is already loaded at `preamble.tex:11`. Add the following
immediately after the existing `\usepackage{tikz}` line:

```latex
\usepackage{pgfplots}
\pgfplotsset{compat=1.18}
\usetikzlibrary{arrows.meta, positioning, patterns}
```

### Verification

Compile `main.tex` after this commit with no content changes elsewhere.
Output must be byte-identical to the current `main.pdf` except for the
PDF metadata (pgfplots registers its version in the preamble). No new
warnings.

---

## Group B — Shield reduction schematic (§3)

**Commit message:** `Paper: add shield reduction schematic to Section 3`.

### Where

Insert immediately after the statement of
`\begin{theorem}[Shield reduction framework]...\end{theorem}` in
`erdos-872/paper/sections/03-shield-reduction.tex` (or wherever the
current `\Cref{thm:shield-reduction}` lives — grep for the label to
locate).

### What to produce

```latex
\begin{figure}[!htbp]
\centering
\begin{tikzpicture}[
    scale=1.0,
    box/.style={draw, rectangle, minimum width=3.2cm, minimum height=2.2cm, thick, rounded corners=1pt},
    subset/.style={draw, rectangle, minimum width=1.4cm, minimum height=0.7cm, thick, fill=blue!15, rounded corners=1pt},
    residual/.style={draw, rectangle, minimum width=1.8cm, minimum height=0.9cm, thick, fill=green!15, rounded corners=1pt},
    antichain/.style={draw, circle, inner sep=0pt, minimum size=4pt, fill=red!70!black},
    arr/.style={-{Latex[length=2mm]}, dashed, gray!60!black, thin}
]
  % Lower-half ambient box
  \node[box] (L) at (0, 0) {};
  \node[above=2pt of L] {$L_n = \{2, \ldots, \lfloor n/2 \rfloor\}$};

  % Upper-half ambient box
  \node[box] (U) at (5.5, 0) {};
  \node[above=2pt of U] {$\mathcal{U}_n = (n/2, n]$};

  % Prefix P inside U_n
  \node[subset] (P) at (5.5, 0.4) {$P$};

  % Residual L_n(P) inside L_n
  \node[residual] (LP) at (0, -0.3) {$\mathcal{L}_n(P)$};

  % Antichain B inside L_n(P), drawn as three small dots
  \node[antichain] (b1) at (-0.55, -0.35) {};
  \node[antichain] (b2) at (0,     -0.25) {};
  \node[antichain] (b3) at (0.55,  -0.35) {};
  \node[right=1pt of b3, font=\scriptsize] {$B$};

  % Divisibility arrows from B to U_n \ P
  \draw[arr] (b1) to[bend left=5]  (4.1, 0.25);
  \draw[arr] (b2) to[bend left=0]  (4.3, -0.15);
  \draw[arr] (b3) to[bend right=5] (4.2, -0.5);

  % Caption-style label
  \node[below=16pt of L, font=\scriptsize] {$w_n(x) = |\mathcal{M}_n(x)| - 1$};
  \node[below=16pt of U, font=\scriptsize] {$\mathcal{U}_n \setminus P$};
\end{tikzpicture}
\caption{The shield reduction framework. A prefix $P \subseteq \mathcal{U}_n$
of Shortener-captured upper-half elements defines the residual
$\mathcal{L}_n(P) = \{x \in L_n : x \nmid u \text{ for every } u \in P\}$.
The weighted antichain $B \subseteq \mathcal{L}_n(P)$ maximizing
$\sum_{x \in B} w_n(x)$ realizes the quantity $\beta_n(P)$.
\Cref{thm:shield-reduction} gives $|A| \ge |\mathcal{U}_n| - \beta_n(P)$
for any terminal antichain $A$.}
\label{fig:shield-reduction}
\end{figure}
```

### In-text cross-reference

Add one sentence before or after the shield reduction theorem:
"\Cref{fig:shield-reduction} illustrates the setup." (Or fold the
reference into existing prose if there's a natural spot.)

### Verification

- Figure fits in text width without overflow.
- All labels legible at default zoom.
- `\Cref{fig:shield-reduction}` resolves.

---

## Group C — 5/24 cover construction (§5)

**Commit message:** `Paper: add 5/24 cover construction figure to Section 5`.

### Where

Insert immediately after the statement of the cover definition in
`erdos-872/paper/sections/05-524-cover.tex` (grep for `thm:intro-cover`
or `H_n` to locate a natural insertion point). Place before the proof
begins.

### What to produce

```latex
\begin{figure}[!htbp]
\centering
\begin{tikzpicture}[scale=1.0, xscale=0.55]
  % x-axis: u from n/2 to n, rescaled to [0, 12]
  \draw[thick] (0, -0.5) -- (12, -0.5);
  \foreach \x/\l in {0/{$n/2$}, 4/{$2n/3$}, 12/{$n$}} {
    \draw (\x, -0.45) -- (\x, -0.55);
    \node[below, font=\scriptsize] at (\x, -0.55) {\l};
  }

  % Four residue-class bands, top to bottom: r = 0, 1, 2, 3 (mod 4)
  \foreach \y/\r in {3/{$\equiv 0 \pmod 4$}, 2/{$\equiv 1 \pmod 4$}, 1/{$\equiv 2 \pmod 4$}, 0/{$\equiv 3 \pmod 4$}} {
    \draw[thick] (0, \y) rectangle (12, \y + 0.8);
    \node[left, font=\scriptsize] at (0, \y + 0.4) {\r};
  }

  % Cover piece 1: all u \equiv 2 (mod 4)
  \fill[blue!25] (0, 1.05) rectangle (12, 1.75);
  \node[font=\scriptsize] at (6, 1.4) {cover piece 1: $u \equiv 2 \pmod 4$};

  % Cover piece 2: u > 2n/3 and u \equiv 0 (mod 4)
  \fill[blue!25] (4, 3.05) rectangle (12, 3.75);
  \node[font=\scriptsize] at (8, 3.4) {cover piece 2: $u > 2n/3$, $u \equiv 0 \pmod 4$};

  % Annotation of total
  \node[below, font=\small] at (6, -1.4) {$|H_n| = \tfrac{5n}{24} + O(1)$};
\end{tikzpicture}
\caption{The exact first-hit cover $H_n$ from \Cref{thm:intro-cover}.
Upper-half elements are stratified by residue mod $4$. The cover consists
of all $u \equiv 2 \pmod 4$ (entire band) together with $u \equiv 0 \pmod 4$
restricted to $u > 2n/3$ (right portion of the $\equiv 0$ band). Residue
classes $\equiv 1$ and $\equiv 3$ are odd and require no cover element
beyond their own presence. The matching lower-half packing (not shown)
gives $\tau(n) = 5n/24 + O(1)$.}
\label{fig:cover-5-24}
\end{figure}
```

### In-text cross-reference

Add one sentence pointing to the figure from either the cover
definition or the proof, e.g. "See \Cref{fig:cover-5-24} for the
explicit construction."

### Verification

- Figure fits in text width.
- Residue-class labels and position markers all legible.
- `\Cref{fig:cover-5-24}` resolves.

---

## Group D — Lower-profile $\rho(u)$ plot (§7)

**Commit message:** `Paper: add lower-profile envelope plot to Section 7`.

### Where

Insert immediately after the definition of
$\rhoU(u) = 1/((\lfloor 1/u \rfloor + 1)u)$ in
`erdos-872/paper/sections/07-main-upper-bound.tex` (currently around
the "lower-profile envelope for Shortener's primes" subsection —
grep for `rhoU` or `lower-profile function`).

### What to produce

```latex
\begin{figure}[!htbp]
\centering
\begin{tikzpicture}
\begin{axis}[
    width=0.85\textwidth,
    height=5.5cm,
    xmin=0.12, xmax=1.02,
    ymin=0, ymax=1.1,
    xlabel={$u = \log X / \log n$},
    ylabel={$\rho(u)$},
    xtick={0.1667, 0.2, 0.25, 0.3333, 0.5, 1},
    xticklabels={$\tfrac{1}{6}$, $\tfrac{1}{5}$, $\tfrac{1}{4}$, $\tfrac{1}{3}$, $\tfrac{1}{2}$, $1$},
    ytick={0.5, 0.6667, 0.75, 0.8, 0.8333, 1},
    yticklabels={$\tfrac{1}{2}$, $\tfrac{2}{3}$, $\tfrac{3}{4}$, $\tfrac{4}{5}$, $\tfrac{5}{6}$, $1$},
    axis lines=left,
    tick label style={font=\scriptsize},
    label style={font=\small},
    every axis plot/.append style={very thick, blue}
]
  % Piece h=1 on (1/2, 1]: rho(u) = 1/(2u)
  \addplot[domain=0.5:1, samples=80] {1/(2*x)};
  % Piece h=2 on (1/3, 1/2]: rho(u) = 1/(3u)
  \addplot[domain=0.3334:0.5, samples=80] {1/(3*x)};
  % Piece h=3 on (1/4, 1/3]: rho(u) = 1/(4u)
  \addplot[domain=0.2501:0.3333, samples=80] {1/(4*x)};
  % Piece h=4 on (1/5, 1/4]: rho(u) = 1/(5u)
  \addplot[domain=0.2001:0.25, samples=80] {1/(5*x)};
  % Piece h=5 on (1/6, 1/5]: rho(u) = 1/(6u)
  \addplot[domain=0.1667:0.2, samples=80] {1/(6*x)};

  % Vertical discontinuity markers (dotted) at each breakpoint
  \foreach \b in {0.5, 0.3333, 0.25, 0.2} {
    \addplot[dotted, gray, forget plot] coordinates {(\b, 0) (\b, 1)};
  }
\end{axis}
\end{tikzpicture}
\caption{The lower-profile function $\rho(u) = 1/((\lfloor 1/u\rfloor+1)u)$ on
$(0, 1]$. On each interval $(1/(h+1), 1/h]$ with $h \ge 1$, $\rho$ is the
strictly decreasing hyperbola $u \mapsto 1/((h+1)u)$, jumping up to $1$ at
each left endpoint $u = 1/(h+1)^+$ and descending to $h/(h+1)$ at $u = 1/h$.
The monotone right-continuous cumulative envelope built in
\Cref{lem:right-continuous-cumulative-envelope} and inverted in
\Cref{lem:generalized-inverse-comparison} is derived from this profile.}
\label{fig:lower-profile}
\end{figure}
```

### In-text cross-reference

Add one sentence in the paragraph immediately after the $\rho(u)$
definition: "\Cref{fig:lower-profile} plots this piecewise-hyperbolic
profile on $(0, 1]$."

### Verification

- Plot fits in text width.
- Breakpoints at $1/2, 1/3, 1/4, 1/5$ all visible and labeled.
- Curves render as five distinct hyperbolic pieces with visible jumps
  at each breakpoint (the dotted verticals help).
- `\Cref{fig:lower-profile}` resolves.

---

## Deferred / explicitly out of scope

Do **not** add any of the following in this task:

- Fan-structure diagram for Theorem 4.4 (considered, deferred — the
  combinatorics are simple enough in prose).
- Numerical grid-convergence plot for $W_4$ in Appendix B (nice to
  have, not ship-blocking).
- Worked game-tree example for small $n$ (belongs in §2 if ever; not
  in this pass).
- Harness/workflow diagram (belongs in the separate methodology paper,
  not here).
- Progress-graph or research-tree HTML from `docs/blog/` (blog
  asset, not paper content).

## After this task

The paper will have three figures. If the final PDF page count shifts
by more than two pages, re-check that no float placement is orphaned
(figure at the top of a page with a blank below, etc.). If so, adjust
the placement specifier from `[!htbp]` to `[!h]` for that specific
figure and recompile.

No other follow-up work is required.

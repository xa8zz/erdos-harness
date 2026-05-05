# Codex Task: Polish the Three Figures

## Scope and intent

The three figures added in
`CODEX_TASK_ADD_FIGURES.md` compile cleanly but have label-collision
and tick-crowding issues visible in the rendered PDF. This task
applies a single polish pass: three small TikZ/pgfplots edits, one
commit, plus a visual-inspection step where you render each figure's
page to PNG and actually look at it before declaring done.

Working directory: `/Users/omisverycool/erdos-harness`.
Paper directory:   `erdos-872/paper/`.
Base branch:       `codex/add-three-paper-figures` (continue on this
branch; do not branch off). If not currently checked out, run
`git checkout codex/add-three-paper-figures` first.

## Compile / workflow rules

- Rebuild with `tectonic -X compile main.tex` from `erdos-872/paper/`
  after the edits.
- **One commit** covering all three polish changes:
  `Paper: polish three figures (label collisions, tick crowding)`.
- No amend of the existing figure commits; create a new commit on top.
- No push.

## Mandatory visual-inspection step

Before declaring the task done, you must actually see the rendered
figures, not only confirm compile success. Source-level correctness
does not imply the rendered output is legible.

Workflow:

1. Compile `main.tex` with `tectonic -X compile main.tex` from
   `erdos-872/paper/`.
2. Identify the page number of each figure by grepping
   `main.log` for the relevant page anchors, or by inspection.
   (As of the prior commit the figures land on roughly pages 7, 17,
   and 30 — but recompile output is the source of truth.)
3. For each of the three figure pages, render to PNG at sufficient
   resolution to read labels:

   ```bash
   pdftoppm -f <PAGE> -l <PAGE> -r 150 main.pdf /tmp/fig<N> -png
   ```

   If `pdftoppm` is not installed, `brew install poppler` first, or
   fall back to `magick convert -density 150 main.pdf[<PAGE-1>] /tmp/fig<N>.png`
   (ImageMagick uses zero-indexed pages).
4. Open each PNG with the image-viewing tool available in your
   environment (e.g. Read it, or `open /tmp/fig1-7.png` on macOS for
   manual viewing if interactive).
5. Confirm visually that:
   - Figure 1: no red dots overlap the $\mathcal{L}_n(P)$ label; $B$ annotation is legible.
   - Figure 2: cover piece labels do not bleed past the band edges.
   - Figure 3: y-axis tick labels are individually legible with no overlapping fractions.
6. If any figure still has the issue, iterate on that figure's TikZ
   source and recompile before the commit.

Do not commit until all three visual checks pass.

---

## Fixes

### Figure 1 — Shield reduction schematic

**File:** `erdos-872/paper/sections/03-shield-reduction.tex`.

**Problems:**
- The three red $B$ dots at `(-0.55, -0.35)`, `(0, -0.25)`, `(0.55, -0.35)` sit on top of the `$\mathcal{L}_n(P)$` label inside the green residual box.
- The trailing captions `$w_n(x) = |\mathcal{M}_n(x)| - 1$` and `$\mathcal{U}_n \setminus P$` below the two outer boxes look orphaned and duplicate the caption text.

**Fix:** move the $\mathcal{L}_n(P)$ label above the green box so the interior is clear for the dots, and delete the two trailing captions entirely. Concrete replacement for the residual node and subsequent label nodes:

```latex
  % Residual L_n(P) inside L_n — label moved above so dots don't collide
  \node[residual, label=above:{\footnotesize $\mathcal{L}_n(P)$}] (LP) at (0, -0.3) {};

  % Antichain B inside L_n(P), three red dots
  \node[antichain] (b1) at (-0.55, -0.25) {};
  \node[antichain] (b2) at (0,     -0.35) {};
  \node[antichain] (b3) at (0.55,  -0.25) {};
  \node[right=1pt of b3, font=\scriptsize] {$B$};
```

Delete both `\node[below=16pt ...]` lines (the $w_n(x)$ and $\mathcal{U}_n \setminus P$ orphan captions).

### Figure 2 — 5/24 cover construction

**File:** `erdos-872/paper/sections/05-524-cover.tex`.

**Problem:** cover piece 2's inline label "cover piece 2: $u > 2n/3$, $u \equiv 0 \pmod 4$" is too long; its trailing "(mod 4)" bleeds past the right band edge. Cover piece 1's label is similarly verbose.

**Fix:** shorten both inline labels. The residue-class row labels on the left (`$\equiv r \pmod 4$`) already tell the reader the residue. Replace the two `cover piece` annotation nodes with:

```latex
  % Cover piece 1: all u \equiv 2 (mod 4)
  \fill[blue!25] (0, 1.05) rectangle (12, 1.75);
  \node[font=\footnotesize] at (6, 1.4) {cover piece 1};

  % Cover piece 2: u > 2n/3 and u \equiv 0 (mod 4)
  \fill[blue!25] (4, 3.05) rectangle (12, 3.75);
  \node[font=\footnotesize] at (8, 3.4) {cover piece 2: $u > 2n/3$};
```

### Figure 3 — Lower-profile $\rho(u)$ plot

**File:** `erdos-872/paper/sections/07-main-upper-bound.tex`.

**Problem:** y-axis ticks at $3/4, 4/5, 5/6$ are so close they visually merge into an unreadable stack.

**Fix:** reduce the `ytick` and `yticklabels` set to four values. Replace the current lines:

```latex
    ytick={0.5, 0.6667, 0.75, 0.8, 0.8333, 1},
    yticklabels={$\tfrac{1}{2}$, $\tfrac{2}{3}$, $\tfrac{3}{4}$, $\tfrac{4}{5}$, $\tfrac{5}{6}$, $1$},
```

with:

```latex
    ytick={0.5, 0.6667, 0.75, 1},
    yticklabels={$\tfrac{1}{2}$, $\tfrac{2}{3}$, $\tfrac{3}{4}$, $1$},
```

The $4/5$ and $5/6$ ticks are dropped; the decreasing trend of the curves is visually clear without them.

---

## Commit and done

Single commit on top of `2d8d9f0`:

```
Paper: polish three figures (label collisions, tick crowding)
```

After committing, re-run the visual-inspection step one more time on
the final PDF to confirm all three figures render cleanly. Report
back with the commit hash and the page numbers of the three figures.

## Deferred / explicitly out of scope

- Re-styling figure fonts or colors beyond the three specific fixes.
- Moving figures to different sections or changing captions.
- Any changes to body text other than the TikZ source and the four-line polish edits described.

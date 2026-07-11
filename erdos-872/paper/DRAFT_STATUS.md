# Paper Draft Status

Last refreshed: 2026-07-10.

## Per-section status

- `main.tex`: complete
- `preamble.tex`: complete
- `references.bib`: complete
- `sections/01-introduction.tex`: complete
- `sections/02-notation-and-setup.tex`: complete
- `sections/03-shield-reduction.tex`: complete
- `sections/04-lower-bounds.tex`: complete
- `sections/05-524-cover.tex`: complete
- `sections/06-intermediate-upper-bounds.tex`: complete
- `sections/07-main-upper-bound.tex`: complete
- `sections/08-obstructions.tex`: complete
- `sections/09-conclusion.tex`: complete
- `sections/appendix-A-deferred-proofs.tex`: complete
- `sections/appendix-B-numerical.tex`: complete (see open items below)
- `sections/appendix-C-formalization.tex`: complete

## `\todo{}` inventory

No `\todo{}` markers are currently present in the draft sources under
`erdos-872/paper/`.

## Estimated page count

- Current compiled draft: **52 pages** including appendices.
- Source of count: `pdfinfo main.pdf` on the most recent build.

## Build status

- Command: `tectonic -X compile --keep-logs --print main.tex` from
  `erdos-872/paper/`.
- Result: successful `main.pdf` (~388 KiB).
- Remaining warnings: two `Underfull \hbox` warnings in `main.bbl` lines
  39--44 (the URL-heavy forum-thread bibliography entry).
  No `Overfull \hbox`, no unresolved references, no missing citations.

## Open items

- **Section 8 barrier theorems.** `prop:sa-barrier`, `prop:q-shadow-dichotomy`,
  and `prop:separator-only` are restored to rigorous form from audit sources
  R58, R59, R56 respectively.  A final pass from a skeptical referee may
  still request condensation; treat these as complete for the current
  submission and queue any follow-up rewrites separately.
- **Section 7 prime-rounding bridge.** Decomposed into nine named lemmas
  (four for envelope inversion, five for the rounding bridge) during the
  R57 repair cycle and supplemented with an explicit truncated-bin case.
  No further repairs outstanding.
- **Rank-three selector formalization.** The unconditional exact-move proof is
  complete in Appendix A and has passed independent symbolic audits and the
  exact-rational finite-state harness.  The new max-threat selectors are not
  yet Lean-formalized; external mathematical peer review remains desirable
  before public submission.

## Recently closed

- **F4 unconditional rank-three lower bound (closed 2026-07-10).**
  Appendix A now credits exact targets played by either player in the real
  game-length potential.  A weighted activation selector and a disjoint-fiber
  residual selector remove the former restricted safe-edge hypothesis, giving
  unconditionally
  \(L(n)\ge c_\delta n(\log\log n)^2/\log n\) for fixed
  \(0<\delta<1/4\).  The old \(K_4/K_5\) obstruction is retained as a
  counterexample to the stronger auxiliary game with artificial unscored
  exact-edge deletion.
- **F1 interval certificate (closed 2026-04-21).**
  `scripts/wfour_certification.py` now reproduces the four $J_r$ intervals
  from first principles via exact breakpoint-split cell masses and
  FFT-accelerated interval convolution with an explicit outward
  $\ell^1$-error bound (formula in Appendix B).  Runs in ~20s and produces
  intervals strictly tighter than those displayed in
  `prop:wfour-certification`.
- **F2 truncated-bin case (closed 2026-04-21).** Section 7
  monotone-assignment proof now explicitly handles the final truncated source
  bin and makes the error-term dependence on $(H, a, s, \lambda)$ explicit.
- **F3 draft-status refresh (closed 2026-04-21).** This file.

## Authorship / artifact attribution

- Author: Om Buddhdev (Independent Researcher).
- AI research assistants (GPT-5.4 Pro, Claude Opus 4.7, Gemini 3.1
  DeepThink) acknowledged in the AI Declaration section of `main.tex`, with
  harness workflow URL `https://www.sensho.xyz/autonomous-research`.
- Public artifact repository: `https://github.com/xa8zz/erdos-harness`
  (snapshot commit archived in the `ErdosHarness26` bib entry).

## Notes

- Section 7 reflects the R57 envelope / prime-rounding decomposition and the
  R60 promotion of the finite Bonferroni-4 theorem to theorem-grade status.
- Appendix A uses the existing Lean-checked local T2 identities but no longer
  assumes a safe-edge hypothesis.  The replacement selectors are prose proofs
  stress-tested by
  `codex-scripts/test-harness/erdos-872-safe-edge-potential/`.
- Appendix C's formalization status table is accurate as of this refresh.

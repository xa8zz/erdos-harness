# Codex Task: Decompose Section 7's Prime-Rounding Bridge into Named Lemmas

## Prerequisite

This task runs **after** `CODEX_TASK_SHIP_BLOCKER_CLEANUP.md` has been
completed and pushed. If that task has not landed, stop and surface that
instead.

## Motivation

Two full-paper Pro audits flagged Section 7's prime-rounding bridge and
envelope inversion as the single weakest presentation point in the paper.
Per Review #1:

> "The main upper bound depends on a highly compressed prime-rounding
>  bridge whose Hall matching, atom handling, and diagonal uniformity are
>  not yet presented at a level where the claimed moment preservation is
>  referee-checkable."

The mathematics is correct and already rigorous in the repo — it was just
compressed during integration into the paper. This task is **extraction and
repackaging**, not new mathematics.

Working directory: `/Users/omisverycool/erdos-harness`.

## Ground-truth sources

The mathematical content for every named lemma below already exists inline
in the following repo files. Do **not** re-derive from scratch.

1. **Primary source:** `erdos-872/paper/SECTION_7_REPAIR_PRO_RETURN.md`
   (~1700 lines). This is Pro's verbatim rigorous repair, containing bin
   demand, bin supply, queue-clearing Hall inequality, exceptional-mass /
   flat-atom handling, cutoff-discrepancy, and right-continuous envelope
   — all inline in a single long proof narrative. Key line ranges:
   - Flat atoms / flat-block mass bounds: lines 103, 245, 309, 704, 730
   - Queued bin assignment / queue-clearing inequality: lines 225–242
   - Exceptional-index reciprocal mass bound: line 379
   - Cutoff discrepancy from tuples: line 570

2. **Secondary source:**
   `erdos-872/researcher-57-pro-round15-bonferroni4-PROVED-L-le-0.19n.md`
   Contains Steps 1–7 with envelope construction, inversion, flat-block
   bookkeeping, and factorial-moment convergence. Cleanest statement of
   Step 3 (explicit inversion to monotone comparison sequence) and
   Step 4 (log-scale measure convergence).

3. **Lean anchor:**
   `erdos-872/lean/erdos_872_core/RequestProject/Round15Bonferroni4/`
   Files `Envelope.lean`, `FlatMass.lean`, `Inversion.lean`, `Target.lean`
   contain zero-sorry formal proofs of envelope properties, flat-block
   mass estimates, and the W_4 interval bound. Use these as shape
   references for the named lemmas. (Do not claim Lean coverage for
   anything not actually in Lean.)

4. **Prior extraction attempt:**
   `erdos-872/paper/CODEX_TASK_SECTION_7_REPAIRS.md` Tasks A–D asked for
   this same decomposition earlier. A partial extraction landed; the
   current paper compressed it back down. Check the file's Task A–D
   specs for the intended sub-lemma names.

## Target file

All edits in `erdos-872/paper/sections/07-main-upper-bound.tex`. Current
problematic regions (locate by label, not line number):

- `\begin{proposition}...\label{prop:envelope-inversion}`
- `\begin{proposition}...\label{prop:queued-prime-rounding}`
- `\begin{proposition}...\label{prop:prime-bridge-diagonalization}`
- `\begin{theorem}...\label{thm:prime-bridge}`

## Required decomposition

Replace the dense propositions with a sequence of named lemmas, each
self-contained and individually verifiable. Specifically extract:

### Envelope-inversion block

1. **Lemma (Right-continuous cumulative envelope).** Define `C_{H,n}` as
   a right-continuous step function on the profile. Prove
   `C_{H,n}(b_j) >= j` explicitly at endpoints. Cite `FlatMass.lean` for
   the zero-sorry shape reference.

2. **Lemma (Generalized inverse comparison sequence).** Define `(b_j)` as
   the generalized inverse of `C_{H,n}` and verify `q_j <= b_j` where
   `q_j` are Shortener's actual primes. This is the core inversion step.
   Cite `Inversion.lean`.

3. **Lemma (Flat-block mass and repeated indices).** For the log-scale
   reciprocal-mass profile, bound the mass concentrated in filler blocks
   and in repeated indices. Key technical content is in
   `SECTION_7_REPAIR_PRO_RETURN.md` lines 103 / 245 / 309 / 704 / 730.
   Cite `FlatMass.lean`.

4. **Lemma (Log-scale measure convergence).** Show convergence of the
   appropriate log-scale measure to the simplex indicator, handling
   atoms and discontinuity hyperplanes explicitly. State that the
   discontinuity set has zero limit measure, so weak convergence holds.

Then restate `prop:envelope-inversion` as a short proposition assembling
lemmas 1–4.

### Prime-rounding bridge block

5. **Lemma (Bin demand estimate).** Count `d_k` = demand for primes in
   bin `k` coming from the comparison sequence. State as an explicit
   asymptotic with error bound. Extract from
   `SECTION_7_REPAIR_PRO_RETURN.md` equations 1–4.

6. **Lemma (Bin prime supply estimate).** Count `P_k` = available primes
   in bin `k` via PNT in a fixed multiplicative interval. Use the
   Hardy–Wright citation added in Group B of the preceding task.

7. **Lemma (Interval-order Hall / suffix inequality).** State the
   suffix inequality `sum_{k >= k_0} d_k <= sum_{k >= k_0} P_k` and
   prove it from Lemmas 5 and 6. This is Pro #1's "Hall matching"
   step — the most compressed part of the current paper. Ground truth
   at `SECTION_7_REPAIR_PRO_RETURN.md` lines 225–242.

8. **Lemma (Monotone assignment).** Given Lemma 7, construct a strictly
   increasing assignment `j -> p_j` of demands to supply primes,
   preserving bin membership and ordering. State explicitly that flat
   atoms go to primes above `n` (so they contribute nothing to the
   final antichain count).

9. **Lemma (Exceptional-mass / cutoff discrepancy).** Bound the
   reciprocal-mass error from (i) flat-atom bins, (ii) top bin
   truncation, (iii) moment cutoff. Ground truth at
   `SECTION_7_REPAIR_PRO_RETURN.md` lines 379 and 570.

Then restate `prop:queued-prime-rounding` as a short proposition
assembling lemmas 5–9.

### Diagonalization

10. **Keep `prop:prime-bridge-diagonalization`** but move its
    twelve-condition list to an appendix (new subsection in
    `sections/appendix-A-deferred-proofs.tex`) titled "Diagonal
    selection conditions." The main body retains a short summary
    citing the appendix.

### Theorem assembly

11. **`thm:prime-bridge` stays as-is** but its proof now reads: "This
    follows by combining Lemma [1–4] on the envelope side with Lemmas
    [5–9] on the rounding side, and selecting the diagonal parameters
    per Proposition [diagonalization]." Short and referee-friendly.

## What NOT to do

- **Do not change the mathematics.** Every statement must be
  mathematically equivalent to the current dense version. If you
  discover an apparent discrepancy between the paper and
  `SECTION_7_REPAIR_PRO_RETURN.md`, stop and flag it — do not
  silently reconcile.

- **Do not add new proofs.** Each named lemma's proof should be a
  condensed version of the inline content from
  `SECTION_7_REPAIR_PRO_RETURN.md`, not freshly written reasoning.

- **Do not claim Lean coverage for anything not in Lean.** Check
  `Round15Bonferroni4/*.lean` files for actual theorem names before
  citing them in Appendix C.

- **Do not inflate the section.** The total length of Section 7 should
  increase by roughly 150–250 lines (one named lemma + short proof +
  one-sentence link per extraction), not 500+.

## Compile / workflow rules

- Rebuild with `tectonic -X compile main.tex` from `erdos-872/paper/`
  after each commit. Zero undefined references, zero missing citations.
- **Three commits**, one per extraction block:
  - Commit 1 (envelope): Lemmas 1–4 extracted,
    `prop:envelope-inversion` restated as assembly.
  - Commit 2 (bridge): Lemmas 5–9 extracted,
    `prop:queued-prime-rounding` restated as assembly.
  - Commit 3 (diagonal + theorem): Diagonalization conditions moved to
    appendix, `thm:prime-bridge` proof rewritten as short assembly.
- No amend, no force-push, no `--no-verify`. Push after all three
  commits.

Commit message template:
- `Paper: extract envelope-inversion into four named lemmas from SECTION_7_REPAIR_PRO_RETURN`
- `Paper: extract prime-rounding bridge into five named lemmas (bin demand/supply, Hall suffix, monotone assignment, exceptional mass)`
- `Paper: move diagonal-selection conditions to appendix, shorten thm:prime-bridge proof to assembly`

## Final self-audit

After three commits, write a short self-audit (under 400 words) covering:

1. **Faithfulness.** For each named lemma: which lines of
   `SECTION_7_REPAIR_PRO_RETURN.md` you pulled the statement and proof
   from. Flag any step where you had to condense aggressively or
   interpolate between repo content and paper style.

2. **Mathematical equivalence.** Confirm the new lemma sequence is
   mathematically equivalent to the old `prop:queued-prime-rounding` +
   `prop:envelope-inversion`. If you found a discrepancy, quote it
   and state whether you corrected toward the repo source or the
   paper.

3. **Length delta.** Report the net change in Section 7 line count.
   If the increase is >300 lines, flag for re-audit — you may have
   inflated beyond the decomposition mandate.

4. **Lean citation audit.** List every Lean theorem name you cite in
   paper body or Appendix C and confirm it exists in
   `Round15Bonferroni4/*.lean` (by file and theorem name).

5. **Remaining gaps.** Any Review #1 repair item (right-continuity,
   atom removal, strict assignment ordering, moment cutoff) that you
   did not fully address — flag explicitly so Pro can audit.

Push after the three commits and the self-audit.

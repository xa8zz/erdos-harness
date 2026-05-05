# Codex Task: arXiv-Ready Final Pass

## Scope and intent

The paper is targeted for arXiv posting and circulation in math communities.
It is not going to a journal for formal refereeing. The AI-assistance
declaration is prominent, so verification-status claims must be honest, but
presentation polish that would only matter to a journal referee is out of
scope.

This task bundles the six remaining items that genuinely affect
**scrutinizable honesty** or **reader stumbles in the published PDF**.
Items that are pure reader-experience polish or journal-revision-grade
restructuring are explicitly deferred at the end and must not be expanded
into.

Working directory: `/Users/omisverycool/erdos-harness`.
Paper directory:   `erdos-872/paper/`.

## Compile / workflow rules

- Rebuild with `tectonic -X compile main.tex` from `erdos-872/paper/` after
  each commit. Zero undefined references, zero missing citations, no new
  `Overfull \hbox` beyond the pre-existing bibliography `Underfull`s.
- **Six commits**, one per group (A–F).
- No amend, no force-push, no `--no-verify`. Do not push to remote.

---

## Group A — Verification status table in Appendix C

**Commit message:** `Paper: add per-result verification status table to Appendix C`.

Given the AI-assistance declaration, any reader circulating the paper
will check the Lean repo. Appendix C currently has formalization prose
but not a single theorem-by-theorem status map. Add one.

### Where

Extend `erdos-872/paper/sections/appendix-C-formalization.tex` with a new
subsection titled **"Verification status by result"**, placed immediately
after the existing formalization overview.

### What to produce

One table. Columns:

| Result | Status | Lean file(s) | Notes |
|---|---|---|---|

Status values (use exactly these strings):

- **Formally verified** — zero sorries, or sorries only on textbook
  classics (Mertens, PNT, Chebyshev, Landau fixed-`r` almost-prime count)
- **Partially formalized** — structural identities or finite cores Lean-
  checked, analytic inputs prose
- **Prose with numerical stress testing** — proof is prose only, numerical
  evidence recorded in Appendix B or scripts
- **Prose only** — no formalization yet, no numerical artifact

### Rows to populate (minimum)

- `thm:shield-reduction` (Section 3)
- `thm:theorem-A` (polynomial shield-weight lower bound, Section 4)
- `thm:fan-lower-bound` (unconditional fan-capture lower bound, Section 4)
- `thm:t2` (conditional T2, Appendix A) — flag as "conditional on the
  restricted safe-edge hypothesis" in Notes
- `thm:five-twenty-four` (exact `5/24` first-hit cover, Section 5)
- `thm:thirteen-thirtysix` (Section 6)
- `thm:five-sixteen` (Section 6)
- `thm:main-upper` (the `0.19n` upper bound, Section 7)
- `thm:prime-bridge` (prime-rounding bridge, Section 7)
- `prop:wfour-certification` (interval arithmetic certificate, Appendix B)
- `prop:sa-barrier`, `prop:q-shadow-dichotomy`, `prop:separator-only`
  (Section 8 barriers)

### Ground-truth sources for Lean-file entries

Inspect these directories for actual file names and sorry counts. **Do
not invent Lean file names or sorry counts.** If ambiguous, say "prose
only" in Notes.

- `erdos-872/lean/shield_reduction/`
- `erdos-872/lean/theorem_A/`
- `erdos-872/lean/tau_5_24/`
- `erdos-872/lean/shortener_13_36/`
- `erdos-872/lean/shortener_5_16/`
- `erdos-872/lean/erdos_872_core/RequestProject/T2Finite/` (T2 finite cores)
- `erdos-872/lean/erdos_872_core/RequestProject/Round15Bonferroni4/`
  (`Envelope.lean`, `FlatMass.lean`, `Inversion.lean`, `PrimeBounds.lean`,
  `Target.lean`) — 0.19n endgame reduction

### Mandatory honesty anchors

- `thm:main-upper` row: Status **Partially formalized**. Notes must say:
  "Lean covers the endgame reduction in `Round15Bonferroni4/Target.lean`;
  envelope, inversion, measure convergence, and prime-rounding bridge are
  prose."
- `thm:t2` row: Status **Conditional; finite cores Lean-verified**. Notes
  must point to `T2Finite/*.lean` and state "safe-edge hypothesis and
  asymptotic activation wrapper remain prose."
- `thm:theorem-A` row: Status **Partially formalized**. Notes must say
  "structural identities Lean; analytic inputs (Mertens, PNT) and
  assembly are prose."

---

## Group B — T2 in abstract: Option C framing

**Commit message:** `Paper: sharpen T2 abstract framing to signal restricted hypothesis + refutation`.

The current abstract line reads:

> "A conditional lower bound of order `n(log log n)^2/log n` is included
> under an explicit finite safe-edge hypothesis."

This is honest about T2's conditionality but does not signal that the
general form of the safe-edge hypothesis is actually **refuted** in the
paper (`prop:t2-safe-edge-refutation`). Without that context, a reader
may assume the hypothesis is just unverified rather than known to fail
in its natural broad form.

### Change

Replace the line above with:

> "Conditional on a restricted finite safe-edge hypothesis — whose
> general form we refute in the paper — we also obtain a stronger lower
> bound of order `n(\log\log n)^2/\log n`."

Adjust LaTeX escaping as needed. Word-count delta: roughly +10 words
over current. Abstract total should remain under 230 words.

### What this preserves vs. signals

- **Preserved:** the stronger `(\log\log n)^2/\log n` scale is still
  advertised as a conditional result in the abstract.
- **Signaled:** the paper has already explored the natural easy route
  (the general safe-edge principle) and ruled it out, so the restricted
  hypothesis is the narrowest form compatible with the paper's own
  counterexample.

Do not otherwise reword the abstract. It was polished in commit `151beaf`
and its other sentences are stable.

---

## Group C — "Theorem A" naming cleanup

**Commit message:** `Paper: title the body theorem as "Theorem A" so prose cross-references match`.

The paper's prose refers to "Theorem A" in several places (intro, artifact
map, roadmap) but the body theorem in `sections/04-lower-bounds.tex` is
titled "Polynomial shield-weight lower bound" with no "Theorem A" label.
A careful reader flips between intro and body and notices the mismatch.

### Fix

In `sections/04-lower-bounds.tex`, change

```latex
\begin{theorem}[Polynomial shield-weight lower bound]\label{thm:theorem-A}
```

to

```latex
\begin{theorem}[Theorem A: Polynomial shield-weight lower bound]\label{thm:theorem-A}
```

Apply the same pattern to `thm:intro-A` in
`sections/01-introduction.tex` if that theorem's header does not already
include "Theorem A".

No `\Cref` changes required — the label stays the same.

Verify by recompiling and visually confirming the theorem headers in the
PDF now read "Theorem A: Polynomial shield-weight lower bound".

---

## Group D — Section 6 forward reference to `lem:prefix-existence`

**Commit message:** `Paper: forward-reference prefix-existence lemma in 5/16 upper bound proof`.

The `5/16` proof in `sections/06-intermediate-upper-bounds.tex` asks
Shortener to play a prefix of order `n/\log n` odd primes, but the
availability of such a prefix is only proved in `\Cref{lem:prefix-existence}`
(Section 7). A reader reaching the 5/16 proof pauses wondering whether
this has been justified.

### Fix

At the point in the `thm:five-sixteen` proof where Shortener begins her
prefix, insert a parenthetical forward reference:

> "(Legality of such a prefix for all sufficiently large `n` is proved
> in `\Cref{lem:prefix-existence}`; the argument there depends only on
> board size, not on the odd-part compression used in this section.)"

Wording can be adjusted for flow. Do not copy the proof — just point
forward.

---

## Group E — Section 7 "local density law" → "lower-profile envelope"

**Commit message:** `Paper: downgrade "local density law" to accurately describe the lower envelope (Section 7)`.

`\Cref{lem:prime-count-per-range}` and `\Cref{prop:local-density}` give
a one-sided lower envelope on the counting function of Shortener's
captured primes, not an identified limiting distribution. Calling this
a "local density law" overstates what is proved. A careful reader will
flag this.

### Fix

Locate the Section 7 subsection currently titled "The local density" or
similar in `sections/07-main-upper-bound.tex`. Make these changes:

1. **Subsection heading.** Rename to something like
   `\subsection{A lower-profile envelope for Shortener's primes}` or
   `\subsection{Lower envelope for Shortener's prime counting function}`.

2. **First sentence of the subsection.** If it currently says anything
   like "the local prime-counting law identifies the limiting captured-
   prime density", rephrase to "we establish a one-sided lower envelope
   for the counting function of Shortener's captured primes" (or
   equivalent).

3. **Any other prose references to "local density law" in Section 7 or
   the intro.** Replace with "lower-profile envelope" or
   "dominated-envelope bound". Grep `sections/` for "local density" and
   "density law" to catch all occurrences.

Do **not** rename the `prop:local-density` label — keep the label
stable, only adjust prose. Existing `\Cref{prop:local-density}`
commands must keep working.

---

## Group F — Appendix B reproducibility block

**Commit message:** `Paper: add reproducibility block with command, dependency version, reference platform`.

Given `scripts/wfour_certification.py` is load-bearing for the headline
theorem, the certificate should be easy to reproduce. Add a short
subsection at the end of `sections/appendix-B-numerical.tex` titled
**"Reproducibility"** containing:

- **Exact command.** `python3 scripts/wfour_certification.py` (from
  repository root). Confirm the default parameters reproduce the
  certified intervals without any flags.
- **Dependency versions.** Inspect the script's imports and any pinned
  requirements file. Report the `mpmath` version the script was tested
  against (typically `>= 1.3.0`) and the NumPy version used for FFT.
- **Reference platform.** State what platform the certificate was run
  on. If a self-audit from the F1 commit (`0386c08`) includes wall-clock
  time, cite it; otherwise state "tested on macOS Darwin 25 with Python
  3.11".
- **Output transcript pointer.** If a sample stdout transcript is
  archived in the repo (e.g.,
  `scripts/wfour_certification_output.txt`), point to it. If not, say
  that running the script produces a self-describing stdout block with
  the four `J_r` intervals and the final margin.

Keep the block to roughly 10–15 lines. No duplicated content from the
main certificate proof.

If no `requirements.txt` exists in the repo, flag that in the self-audit
but do NOT create one in this task.

---

## Explicitly deferred (do NOT do in this task)

The self-audit must list these as "deferred to journal revision or
future work," confirming they were considered and consciously skipped:

1. **T2 abstract complete removal.** Considered; rejected in favor of
   Option C framing (Group B).
2. **Intro formal-verification extra-bluntness.** The current intro
   paragraph already says "For the `0.19n` theorem, the endgame
   reduction from moment convergence to the strict inequality is
   zero-sorry Lean-verified; the moment-convergence hypotheses are the
   prose content of `\Cref{sec:main-upper}`." No stronger wording
   needed for arXiv scope. Skip.
3. **Flat-block plain-language remark.** Polish that helps readers
   going deep into Section 7 but not required for arXiv scrutiny.
4. **PNT uniformity short lemma/remark.** Referee-hardening. Community
   readers mentally fill this in.
5. **Section 7 "matching model" subsection.** Real improvement but a
   restructure of the prime-rounding bridge presentation. Too large
   for this cleanup.
6. **One-page proof dependency map/figure before Section 7.** Real
   improvement but a deliverable in its own right.
7. **Non-FFT fallback certificate script.** Would require writing new
   interval-arithmetic code.
8. **Archival (`web.archive.org`) links for forum/artifact URLs.**
   Useful if a journal is involved; low priority for arXiv.
9. **Generative-AI declaration length.** Some venues require
   shortening. Not arXiv-blocking.

If any of these items look like they can be addressed with a trivial
fix, flag in the self-audit rather than silently adding them.

---

## Final self-audit

After six commits, write a single self-audit (under 500 words) covering:

1. **Verification table faithfulness (Group A).** For each row, list
   the Lean file(s) you actually inspected. Flag any row where the
   status was inferred from paper prose rather than file inspection.

2. **T2 abstract framing (Group B).** Confirm Option C wording was used
   verbatim (or note any minor adjustments). Give the new abstract word
   count.

3. **Theorem A naming (Group C).** List every location in the PDF
   where "Theorem A" now appears and confirm all point to the same
   label.

4. **Section 6 forward reference (Group D).** Confirm the parenthetical
   sits at the correct step in the `5/16` proof.

5. **Section 7 wording (Group E).** Confirm "local density law" and
   "density law" no longer appear in prose outside the `prop:local-
   density` label. Give the list of files you grep'd.

6. **Reproducibility block (Group F).** Report the exact mpmath and
   NumPy versions you detected. Flag if no `requirements.txt` exists.

7. **Deferred items.** Confirm you considered each of the nine
   explicitly deferred items and did not quietly act on any of them.

8. **Remaining gaps.** Anything you noticed during the pass that seems
   worth a future round — flag with priority (low / medium / high).

Do not push. The user reviews the commits and tags/pushes manually.

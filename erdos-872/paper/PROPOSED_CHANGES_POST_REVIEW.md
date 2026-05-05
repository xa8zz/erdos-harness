# Proposed Changes — Post-Review Discussion

Written: 2026-04-21.

## Context

An external AI suggested seven framing/positioning edits on top of the in-flight
technical fixes. After cross-discussion, these four are the final set worth
considering. The paper's S-tier unconditional claims remain:

1. `L(n) < 0.19n` upper bound
2. `L(n) ≥ (1/8 − o(1)) n log log n / log n` lower bound
3. `τ(n) = 5n/24 + O(1)` first-hit cover
4. Polynomial shield-weight barrier
5. Shield reduction framework
6. Intermediate `13/36` and `5/16` upper bounds
7. Three proof-class **barriers** (SA, q-shadow, separator-only)
8. Partial Lean formalization

The analysis below flags which items change rhetoric vs. substance.

---

## Item 1 — §7 opening load-bearing signpost

**Decision:** do it.

**Proposed wording** (at the top of `sections/07-main-upper-bound.tex`, after the
subsection 7.1 intro):

> "The assembly from `\Cref{lem:right-continuous-cumulative-envelope}` through
> `\Cref{lem:exceptional-mass-cutoff-discrepancy}` is the longest prose stretch
> in the paper and the part most sensitive to auditing. Its arithmetic kernels
> — envelope properties and flat-block mass estimates — have zero-sorry Lean
> artifacts in `Envelope.lean` and `FlatMass.lean`; the assembly itself is
> prose, with the moment-convergence hypotheses feeding the zero-sorry
> endgame reduction in `Round15Bonferroni4/Target.lean`."

**Effect on S-tier claims:** none. Section 7's math is unchanged. Signals
"this is the load-bearing prose" which a careful reader would form anyway
from the lemma decomposition.

**Minor coolness cost:** a casual reader now has an explicit "attack here"
marker. Acceptable; pre-empts exactly the reviewer-style criticism we've
already seen twice.

---

## Item 2 — §8 "barrier" → "limitation" rename

**Decision needed — user's call.**

**What's proposed:** rename Section 8 from "Obstructions" / "Barriers" to
"Limitations of Related Proof Classes". Replace "barrier" throughout Section
8 with "limitation" or "proof-class obstruction". Update references in intro
and abstract accordingly.

**The conflict:**

- **"Barrier" is standard terminology** in complexity theory for
  proof-class impossibility results (Natural Proofs barrier, Relativization
  barrier, Algebrization barrier). Our Section 8 theorems have the same
  structure: specific proof techniques cannot certify specific `L(n)` bounds.
- **"Limitation" is more modest** and may read better in a primitive-sets /
  number-theory audience less familiar with the complexity-theory convention.

**Effect on S-tier claim #7:**

- S-tier claim #7 is currently "three proof-class barriers (SA, q-shadow,
  separator-only)."
- Renaming to "limitations" is a rhetorical **underclaim** by complexity-theory
  convention, a more conservative voice by math-paper convention.

**My position:** keep "barrier." Complexity-theory convention applies here;
renaming underclaims what we actually prove. The second AI's assertion that
"barrier" overclaims is incorrect under the complexity-theory reference class.

**Alternative if you want more modesty without full underclaim:** keep
"barrier" in theorem statements (standard usage) but relax the Section 8
**title** to "Structural Obstructions" or "Proof-Class Obstructions." That
softens the top-level rhetoric without touching the theorem language itself.

---

## Item 3 — Abstract Lean anchor sentence

**Decision:** do it.

**Proposed wording** (as the last sentence of the abstract, before the
barriers line or between main results and auxiliary results):

> "Shield reduction, the exact `5n/24` cover identities, the `13/36`
> upper-bound core, and the `Wfour/2 < 0.19` endgame reduction have zero-sorry
> Lean 4 artifacts; the formalization status of remaining results is documented
> in `\Cref{app:formalization}`."

**Effect on S-tier claims:** **coolness BOOST, not cost.** Lifts the Lean
credibility signal to the abstract — where skeptical readers form their first
judgment about the paper. For an AI-assisted paper, this is a net positive.

**Duplication concern:** the duplication with Appendix C is the entire point.
A skeptical reader never reaches Appendix C before deciding whether to keep
reading. The abstract is load-bearing for positioning.

**Word cost:** ~30 words. Abstract goes from 225 to ~255. Still within normal
abstract length (150–300).

---

## Item 4 — Engineered-hypothesis remark after `def:safe-edge`

**Decision needed — user's call.**

**What's proposed:** add one sentence immediately after `def:safe-edge` in
`sections/04-lower-bounds.tex`:

> "The narrowing to strategy-generated states is specifically engineered to
> avoid the counterexample of `\Cref{prop:t2-safe-edge-refutation}`; the
> restricted hypothesis is therefore the narrowest form compatible with the
> paper's own refutation of the general version, and its plausibility is an
> open target."

**Effect on S-tier claims:** none. T2 is not S-tier (it's a conditional
target theorem, not an unconditional result).

**Small T2 coolness cost:** makes explicit that the hypothesis is custom-fit
to avoid our own counterexample. An honest reader will appreciate this; a
skeptical reader may read "engineered" as "ad hoc" or "cherry-picked."

**Why it's honest:** the restricted hypothesis literally removes the states
where the K_4 fiber counterexample applies. Whether the remaining states
satisfy safe-edge is the genuine open question. The current
`def:safe-edge` statement signals this obliquely ("states **actually reached
by** the T2 activation strategy"); the proposed sentence signals it
explicitly.

**My position:** include it. T2 coolness cost is contained because T2 is
already conditional, and the transparency signal helps more than it hurts for
the skeptical-reader audience this paper is positioned for.

---

## Recommended dispatch

If the user approves, the Codex task (or direct execution) should cover:

1. **Item 1** — §7 signpost. ~5 sentences, one location, ~10 min.
2. **Item 3** — Abstract Lean anchor. ~30 words, one location, ~5 min.
3. **Item 4 (if approved)** — Engineered-hypothesis remark. ~2 sentences,
   one location, ~5 min.

Total: 20-30 minutes of direct wording work, or one small Codex task.

**Item 2 (barrier rename) requires an explicit user decision before
dispatch.** If the user prefers to keep "barrier" (my recommendation), skip
entirely. If the user wants softer rhetoric, the minimum-damage version is
relaxing only the Section 8 title ("Structural Obstructions") while keeping
"barrier" in theorem language.

---

## Deferred from prior discussions

Explicitly NOT doing in this round (flagged as journal-revision scope or
polish):

- Section 7 dependency-map figure (real improvement, non-trivial effort)
- Section 7 "matching model" subsection restructure
- Non-FFT fallback certificate script
- Archival (web.archive.org) links for forum citations
- Shortened AI disclosure for venue fit (not needed for arXiv)

---

## After this round

Paper should be fully arXiv-ready. Remaining operational items:

- `arxiv-v1` tag will need re-creation at the final commit (same procedure
  as before: `git tag -d arxiv-v1 && git tag -a arxiv-v1 -m "..."`).
- `git push origin main --tags` to publish.
- Optional future work (not arXiv-blocking): Erdős 1992 verification done;
  Lean artifact status table done; reproducibility block done.

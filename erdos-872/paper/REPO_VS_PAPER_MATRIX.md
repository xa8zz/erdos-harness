# Repo vs Paper Support Matrix

Internal working note. This separates:

- what appears to exist in the repo as mathematics or formal artifact support;
- what the current local paper draft actually supports to a cold outside reader.

This is not a verdict on whether a result is true. It is a verdict on whether the
current manuscript is carrying the burden of proof in normal paper form.

## Audit Scope

This document now tracks three different things at once:

1. **Paper claim inventory**: what the current local draft actually states as a
   theorem / proposition / corollary.
2. **Repo support inventory**: where the strongest current backing for that
   claim lives in the repo.
3. **Research-paper support level**: whether the current PDF carries the burden
   of proof in a normal math-paper sense.

When this document says a claim is "not yet supported," that does **not** mean
the claim is false. It means the current manuscript is not yet presenting the
claim at a publishable theorem-proof standard.

## Status Legend

- `Repo status`
  - `Banked`: there is a strong repo-level theorem source (paper-grade note, Lean artifact, or both).
  - `Strong`: substantial repo math exists, but it is still spread across notes / artifacts.
  - `Partial`: important pieces exist, but not yet enough to treat as settled from repo materials alone.
- `Paper status`
  - `Supported`: the current draft basically supports the claim in a normal theorem-proof sense.
  - `Mostly supported`: the draft is close, but still relies too much on proof sketches or compressed exposition.
  - `Not yet supported`: the current draft does not yet justify stating the claim as a theorem without major rewrite.

## Current Main-Results Tension

There is a real mismatch between:

- the optimistic repo-level triage in
  [publication_source_of_truth.md](/Users/omisverycool/erdos-harness/erdos-872/publication_source_of_truth.md),
  which treats several items as banked or near-banked; and
- the current paper draft, which still presents a number of those items only via
  proof sketches, imported-note references, or compressed theorem chains.

This matrix should therefore be read as:

- **repo evidence level** = how much we seem to have in the warehouse;
- **paper evidence level** = what the current PDF is actually earning.

## Support Snapshot

On the current local evidence, the most honest coarse-grained picture is:

- **Paper-ready or close to paper-ready now**
  - Shield Reduction
  - exact `5/24` cover theorem
  - probably Theorem A
  - probably `13/36`
  - probably `5/16`
  - the finite Bonferroni-4 `< 0.19n` theorem, after one remaining
    local-density lemma is inlined rather than cited by name
- **Repo-strong, but the paper still underwrites them too weakly**
  - T2 residual comparison machinery, now appendix-backed but still conditional
    on the safe-edge hypothesis
  - Theorem 5
  - Theorem 6
  - R52 / R53 / R56
  - universal block-product carrier-mass counter
- **Strong project-level claims that the current PDF still does not earn as unconditional headline theorems**
  - T1
  - T2 as an unconditional lower-bound theorem, because the paper now states it
    only conditionally on the safe-edge hypothesis

So the project does not look empty. It looks **ahead of its current manuscript**.
The main task is evidentiary consolidation, not starting the mathematics over.

## Downloaded Pro Rewrite Assessment

The downloaded draft at
`/Users/omisverycool/Downloads/erdos_final_paper_sources/` is best understood
as a **paper-architecture rewrite**, not as a substantially new proof of the
remaining Section 6 local-density input.

What it improves:

- it removes the problematic T1 game-lower-bound theorem from the headline
  story and reframes Theorem A correctly as a shield-weight obstruction;
- it adds a conventional notation/setup section;
- it leads with the `<0.19n` theorem, which is the right paper spine if the
  Section 6 proof is accepted;
- it makes T2 explicitly conditional and moves the proof to deferred material;
- it strips much of the internal round/source vocabulary from the main prose.

What it does **not** yet close:

- Section 7 of the downloaded draft still invokes the "local
  prime-count-per-range lemma" by name rather than proving its short
  adversarial counting argument inline;
- it compresses or removes some barrier/restricted-class material, so it is a
  cleaner paper shape but not a complete preservation of all repo work;
- it should not be imported wholesale without checking notation compatibility
  (`\U_n`, `w_n(x)=|M_n(x)|-1`, section labels, bibliography entries).

Recommended use:

- import its **structure and lower-bound reframing**;
- keep our richer Section 6 proof text, but inline the local prime-count lemma;
- keep selected obstruction results deliberately rather than allowing the
  rewrite to erase high-value R52/R53/R56 material.

## Paper Claim Inventory

This section follows the current paper theorem/proposition inventory in body
order. Intro theorem statements are not listed separately; they inherit the
status of the corresponding body results and therefore overclaim exactly when
the body result overclaims.

## Core Results

| Result | Paper location | Strongest repo source(s) | Repo status | Paper status | Main issue in current draft | Recommended action |
|---|---|---:|---|---|
| Problem setup / move order / definition of `L(n)` | [01-introduction.tex](/Users/omisverycool/erdos-harness/erdos-872/paper/sections/01-introduction.tex) and [preamble/main.tex](/Users/omisverycool/erdos-harness/erdos-872/paper/main.tex) | `publication_source_of_truth.md`, current paper setup | Banked | Supported | Fine overall. | Keep. Tighten wording only if needed. |
| Shield Reduction | [02-shield-reduction.tex](/Users/omisverycool/erdos-harness/erdos-872/paper/sections/02-shield-reduction.tex:48) | `current_state.md`; `lean/shield_reduction/.../ShieldReduction.lean` | Banked | Supported | Cleanest theorem in the paper. Lean support matches the paper posture reasonably well. | Keep as-is, maybe polish exposition only. |
| Theorem A (`beta(P)` lower bound for `|P| <= n^alpha`) | [03-lower-bounds.tex](/Users/omisverycool/erdos-harness/erdos-872/paper/sections/03-lower-bounds.tex:15) | `current_state.md`; `lean/theorem_A/.../ShieldMainTheorem.lean` | Strong | Mostly supported | The static theorem itself is written in theorem-proof form, but Section 10 still overreads its formal status. | Keep theorem. Make formal-verification language more exact. |
| T1 lower bound | [03-lower-bounds.tex](/Users/omisverycool/erdos-harness/erdos-872/paper/sections/03-lower-bounds.tex:90) | `current_state.md`; Theorem A note chain | Partial-to-Strong in repo, depending on how much weight you place on the current note chain | Not yet supported | The paper says Shield Reduction turns lower bounds on `L(n)` into upper bounds on `beta(P)`, then proves a lower bound on `beta(P)` and jumps via "the current-state note." As written this is not a complete paper proof. | Either inline the calibrated shield construction fully, or demote/remove T1 from theorem status. |
| T2 residual comparison theorem | [appendix-A-t2-lower-bound.tex](/Users/omisverycool/erdos-harness/erdos-872/paper/sections/appendix-A-t2-lower-bound.tex:129) | `phase4/t2_core_paper_note.md`; `RequestProject/T2Finite/{EmbeddingCore,EmbeddingFamily,ResidualComparison}.lean` | Strong | Mostly supported | The arithmetic/residual slot model is now written in the appendix and aligned with the Lean-backed finite core. | Keep appendix proof; audit wording around "unavailable" vs. "played" carefully. |
| T2 activation-stage inequality | [appendix-A-t2-lower-bound.tex](/Users/omisverycool/erdos-harness/erdos-872/paper/sections/appendix-A-t2-lower-bound.tex:218) | `phase4/t2_core_paper_note.md`; `researcher-22-codex-T2-activation-audit.md`; T2 finite-core Lean | Strong | Mostly supported conditionally | The activation bookkeeping is now explicit, but it still depends on the finite safe-edge hypothesis rather than proving that hypothesis for all generated states. | Keep as a conditional theorem; do not advertise unconditional T2. |
| Conditional T2 lower bound | [03-lower-bounds.tex](/Users/omisverycool/erdos-harness/erdos-872/paper/sections/03-lower-bounds.tex:130), [appendix-A-t2-lower-bound.tex](/Users/omisverycool/erdos-harness/erdos-872/paper/sections/appendix-A-t2-lower-bound.tex:377) | `phase4/t2_core_paper_note.md`; `phase4/t2_maker_first_lemmas.md`; `researcher-21-*`; `researcher-22-*`; T2 Lean finite core | Strong as a conditional result | Mostly supported as conditional | This is much improved: the paper now states T2 conditionally on the safe-edge hypothesis and gives an appendix proof. It is not an unconditional lower bound. | Keep exactly this conditional posture unless the safe-edge hypothesis is closed. |
| Exact `5/24` cover theorem | [04-5-24-cover.tex](/Users/omisverycool/erdos-harness/erdos-872/paper/sections/04-5-24-cover.tex:18) | `current_state.md`; `lean/tau_5_24/.../{Cover,Packing,Tau}.lean` | Banked | Supported | This is the cleanest auxiliary theorem in the draft. The paper version is close to normal math-paper style already. | Keep and consider making it even more self-contained. |
| `13/36` upper bound | [05-intermediate-upper-bounds.tex](/Users/omisverycool/erdos-harness/erdos-872/paper/sections/05-intermediate-upper-bounds.tex:19) | `current_state.md`; `lean/shortener_13_36/.../MainTheorem.lean` | Banked | Mostly supported | The section reads as a compressed proof sketch, but the logic is much more standard and self-contained than T1/T2/0.19. | Keep; modest expansion would likely suffice. |
| `5/16` upper bound | [05-intermediate-upper-bounds.tex](/Users/omisverycool/erdos-harness/erdos-872/paper/sections/05-intermediate-upper-bounds.tex:82) | `researcher-08-5-16-improvement.md`; `lean/shortener_5_16/.../Theorems.lean` | Strong | Mostly supported | Similar to `13/36`: mathematically plausible in the draft, but still compressed enough that a skeptical reader may want one more layer of detail. | Keep; expand slightly or move routine details to appendix. |
| Round 15 local density proposition | [06-main-upper-bound.tex](/Users/omisverycool/erdos-harness/erdos-872/paper/sections/06-main-upper-bound.tex:50) | `round15_upper_bound_status.md`; `researcher-57-pro-round15-bonferroni4-PROVED-L-le-0.19n.md`; R57/R60 repair chain | Strong | Mostly supported | The proposition is now written with quantifiers and a real proof, but it still invokes the "Round 15 local prime-count-per-range lemma" by name rather than proving its short adversarial-counting argument inline. | Inline the lemma from `round15_upper_bound_status.md`: primes in `(Y,X]` are either played or divide earlier Prolonger moves, each such move has at most `h` prime factors above `Y`, hence `S(X) >= (pi(X)-pi(Y))/(h+1)-O(1)`. |
| Envelope and inversion proposition | [06-main-upper-bound.tex](/Users/omisverycool/erdos-harness/erdos-872/paper/sections/06-main-upper-bound.tex:193) | `researcher-57-pro-round15-bonferroni4-PROVED-L-le-0.19n.md`; `r57_bonferroni4_audit_and_repair.md`; `Round15Bonferroni4/{Envelope,FlatMass,Inversion}.lean` | Strong | Supported to Mostly supported | This is now a detailed theorem-proof writeup with monotone envelope, flat-block mass, weak convergence, repeated-index control, and diagonalization. | Keep. A final line-by-line audit is still wise, but this is no longer a proof-sketch bottleneck. |
| Prime-sequence Bonferroni comparison theorem | [06-main-upper-bound.tex](/Users/omisverycool/erdos-harness/erdos-872/paper/sections/06-main-upper-bound.tex:572) | `researcher-60-pro-R57-repair-PROVED-theorems-2-1-and-4-1.md`; `r57_bonferroni4_audit_and_repair.md` | Strong | Supported to Mostly supported | Reads like a normal theorem-proof argument. The remaining improvement is citation/reference polish for the squarefree divisor-count estimate. | Keep. |
| Prime-rounding bridge theorem | [06-main-upper-bound.tex](/Users/omisverycool/erdos-harness/erdos-872/paper/sections/06-main-upper-bound.tex:649) | `researcher-60-pro-R57-repair-PROVED-theorems-2-1-and-4-1.md`; `r57_bonferroni4_audit_and_repair.md`; `Round15Bonferroni4/PrimeBounds.lean` | Strong | Supported to Mostly supported | The half-density bin-to-next-bin proof is now substantially written out. It still deserves a final quantifier/uniformity audit, but the earlier major gap is fixed. | Keep. |
| Finite Bonferroni-4 `< 0.19n` upper bound | [06-main-upper-bound.tex](/Users/omisverycool/erdos-harness/erdos-872/paper/sections/06-main-upper-bound.tex:932) | R57 + R60 notes; `Round15Bonferroni4/{Envelope,FlatMass,Inversion,PrimeBounds,Target}.lean` | Strong | Mostly supported; near headline-ready | The current paper now carries most of the theorem chain. The remaining paper-facing gap is that the local prime-count-per-range lemma should be proved inline rather than imported by name. | After inlining that short local lemma and doing one final Section 6 audit, this can reasonably be the headline theorem. |

## Restricted-Class Results

| Result | Paper location | Strongest repo source(s) | Repo status | Paper status | Main issue in current draft | Recommended action |
|---|---|---:|---|---|
| Theorem 5 (disjoint small-prime carriers) | [07-restricted-class.tex](/Users/omisverycool/erdos-harness/erdos-872/paper/sections/07-restricted-class.tex:13) | `phase4/theorem5_disjoint_carriers_note.md` | Strong | Mostly supported to Not yet supported | The canonical note is better than the paper sketch and does handle the in-range issue by conditioning phase 2 on `p^{e(p)+1} <= n`, but the current paper sketch still does not communicate those details. | Reprove carefully in paper form or downgrade to proposition / announced theorem. |
| Theorem 6 (squarefree rank-`<= 3` carriers) | [07-restricted-class.tex](/Users/omisverycool/erdos-harness/erdos-872/paper/sections/07-restricted-class.tex:62) | `phase4/theorem6_rank3_squarefree_note.md` | Strong | Mostly supported to Not yet supported | The canonical note is substantially cleaner than the paper sketch, especially on phase-2 wording and the `|supp(x)| >= 4` survivor case, but the draft still compresses too much casework for a published theorem. | Expand significantly or move full proof to appendix. |

## Barrier / Diagnostic Results

| Result | Paper location | Strongest repo source(s) | Repo status | Paper status | Main issue in current draft | Recommended action |
|---|---|---:|---|---|
| R52 transversal-integrality / Sherali-Adams barrier | [08-proof-class-barriers.tex](/Users/omisverycool/erdos-harness/erdos-872/paper/sections/08-proof-class-barriers.tex:19) | `researcher-58-pro-R52-integrality-barrier-audit-confirmed-sharpened.md` | Strong | Mostly supported | This is closer to normal paper style than many other late sections, but still sketch-heavy. The sharpened note is stronger and cleaner than the paper sketch. | Keep if you want a barriers section; tighten proof and references. |
| R53 q-shadow / covering dichotomy | [08-proof-class-barriers.tex](/Users/omisverycool/erdos-harness/erdos-872/paper/sections/08-proof-class-barriers.tex:82) | `researcher-59-pro-R53-q-shadow-dichotomy-audit-confirmed-sharpened.md` | Strong | Mostly supported | The statement is clean, but the paper still compresses the spectral step heavily. | Keep if central to the paper's narrative; otherwise move to appendix or companion note. |
| R56 separator-only barrier | [08-proof-class-barriers.tex](/Users/omisverycool/erdos-harness/erdos-872/paper/sections/08-proof-class-barriers.tex:152) | `phase4/r56_separator_only_barrier_note.md` | Strong | Mostly supported | Reads like a real theorem, but still depends on the reader trusting compressed route-level argument. | Keep with modest strengthening. |
| R54 strategy-dependence classification | [08-proof-class-barriers.tex](/Users/omisverycool/erdos-harness/erdos-872/paper/sections/08-proof-class-barriers.tex:200) | `researcher-54-pro-sigma-star-audit-class-C-named-shortener-class.md` | Strong as a meta-result | Mostly supported as taxonomy only | Fine as a classification proposition, but not a flagship theorem. | Keep only as taxonomy framing. |
| Conditional `sigma^*` tools (R44/R46 family) | [08-proof-class-barriers.tex](/Users/omisverycool/erdos-harness/erdos-872/paper/sections/08-proof-class-barriers.tex:239) | `phase4/r44_residual_floor_note.md`; `phase4/r46_st_capture_refutation_note.md` | Strong | Mostly supported as diagnostic only | Best read as a diagnostic / conditional subsection, not a main theorem package. | Keep only if the paper explicitly quarantines sigma-star-dependent material. |
| Universal block-product carrier-mass counter | [09-structural-negatives.tex](/Users/omisverycool/erdos-harness/erdos-872/paper/sections/09-structural-negatives.tex:11) | `phase4/block_product_carrier_mass_note.md` | Strong | Mostly supported | The canonical note is stronger than the paper sketch, and this is one of the better structural-negative propositions. | Use selectively or keep as the lead structural negative. |
| Separate-rank fan no-go | [09-structural-negatives.tex](/Users/omisverycool/erdos-harness/erdos-872/paper/sections/09-structural-negatives.tex:34) | `researcher-17-codex-negative-on-separate-rank-fan-route.md` | Strong | Mostly supported | Plausible and useful, but still in compressed proposition-proof-sketch form. | Keep if space allows; otherwise move to appendix. |
| Same-`b` coupling / residual-width / Ford / band-local / rank-3 / dyadic-fiber negatives | [09-structural-negatives.tex](/Users/omisverycool/erdos-harness/erdos-872/paper/sections/09-structural-negatives.tex) | respective `researcher-*` and `phase4/*` sources | Strong-to-Partial depending on item | Mostly supported as diagnostic only | These read as structural diagnoses more than indispensable headline results. | Compress, appendicize, or split into companion note if the main paper gets crowded. |

## Formalization / Artifact Claims

| Claim area | Paper location | Strongest repo source(s) | Repo status | Paper status | Main issue in current draft | Recommended action |
|---|---|---:|---|---|
| Shield Reduction formalization | [10-formal-verification.tex](/Users/omisverycool/erdos-harness/erdos-872/paper/sections/10-formal-verification.tex:3) | `lean/shield_reduction/.../ShieldReduction.lean` | Banked | Supported | Good. | Keep. |
| `5/24` formalization | [10-formal-verification.tex](/Users/omisverycool/erdos-harness/erdos-872/paper/sections/10-formal-verification.tex:4) | `lean/tau_5_24/.../{Cover,Packing,Tau}.lean` | Banked for structural core | Mostly supported | The paper now says the floor-sum part remains prose, which is good, but this must stay exact. | Keep exact wording. |
| `13/36` formalization | [10-formal-verification.tex](/Users/omisverycool/erdos-harness/erdos-872/paper/sections/10-formal-verification.tex:7) | `lean/shortener_13_36/.../MainTheorem.lean` | Banked | Mostly supported | Probably fine, but the paper should still avoid implying the entire surrounding strategy ecosystem is formalized if only the theorem artifact is. | Keep but stay artifact-exact. |
| Theorem A / T1 formalization | [10-formal-verification.tex](/Users/omisverycool/erdos-harness/erdos-872/paper/sections/10-formal-verification.tex:9) | `lean/theorem_A/.../ShieldMainTheorem.lean` | Partial | Not yet supported if presented too strongly | Section 10 still calls the remaining sorries "Mathlib-dependency gaps rather than logical holes." That is stronger than the manuscript should say unless independently audited theorem-by-theorem. | Soften Section 10 to exact artifact description. |
| `5/16` formalization | [10-formal-verification.tex](/Users/omisverycool/erdos-harness/erdos-872/paper/sections/10-formal-verification.tex:9) | `lean/shortener_5_16/.../Theorems.lean` | Partial | Mostly supported if described narrowly | Same issue: okay to say there is a partial Lean artifact, not okay to blur that into full theorem formalization. | Keep, but exactify wording. |
| T2 formalization | [10-formal-verification.tex](/Users/omisverycool/erdos-harness/erdos-872/paper/sections/10-formal-verification.tex:12) | `lean/erdos_872_core/RequestProject/T2Finite/*.lean` | Partial | Supported only as "finite core formalized" | Current Section 10 is reasonably close here, because it says the activation wrapper is pending. | Keep, maybe sharpen the wording further. |
| Round 15 / `<0.19` formalization | [10-formal-verification.tex](/Users/omisverycool/erdos-harness/erdos-872/paper/sections/10-formal-verification.tex:13) | `lean/erdos_872_core/RequestProject/Round15Bonferroni4/Target.lean` | Partial | Supported only as "endgame reduction formalized" | The paper is much better than before, but it must not let readers infer that Lean proves the full `<0.19n` theorem. | Keep the current caveat structure and possibly strengthen it further. |

## Paper Infrastructure

| Area | Repo status | Paper status | Main issue in current draft | Recommended action |
|---|---|---:|---|---|
| Bibliography / `Er92c` metadata | Partial | Not yet supported | `Er92c` still has placeholder metadata. This is a real submission blocker. | Fix before any public posting. |
| Internal harness vocabulary | Strong internal context exists | Not yet in normal paper form | The paper still says things like `current-state note`, `Round 57 note`, `R60`, etc. | Replace with theorem/lemma names, appendix references, or artifact references. |
| Section 10 formal-verification tone | Strong artifact ecosystem exists | Too optimistic in places | The current draft is much better than earlier versions, but it still occasionally blurs "related Lean artifact" into "formal support for the theorem as stated." | Rewrite to be strictly artifact-exact. |
| Section 8 / 9 scope | Strong repo material exists | Paper-ready only if tightened | These sections are not inherently illegitimate, but they cannot read like research-memo taxonomy. | Either sharpen to theorem-proof style or compress heavily / move to appendix. |

## What the Intro/Main Results Currently Overclaim

The intro theorem list in
[01-introduction.tex](/Users/omisverycool/erdos-harness/erdos-872/paper/sections/01-introduction.tex:66)
inherits the strongest current paper-status problem from each body result.

In particular:

- the intro statement of **Theorem A / T1** currently overclaims because T1 is
  not yet supported as written in the body;
- the intro statement of **T2** currently overclaims if the body remains at
  proof-sketch level;
- the intro statement of the **`<0.19n` upper bound** currently overclaims if
  Section 6 remains at mixed theorem / proof-sketch level;
- the intro statement of **restricted classes and barriers** is okay as a broad
  summary only if the body sections remain in the paper and are clearly labeled
  by support level.

## Bottom Line

The project looks ahead of the paper.

That is good news. It means the current problem is not "we have no math." The
current problem is:

1. some results that likely exist in repo form are still only sketched in the PDF;
2. some theorem statements, especially in the introduction, are stronger than
   what the current manuscript text actually proves on the page;
3. the formalization section still needs stricter claim discipline;
4. internal harness language is still leaking into the public paper.

The immediate paper-facing priorities are:

1. Decide whether T1 is being repaired, downgraded, or removed.
2. Decide whether T2 is staying as a theorem in Paper A or moving to appendix / separate note.
3. Rewrite Section 6 so the `<0.19n` theorem is either fully carried in the paper or explicitly conditional.
4. Decide whether Theorems 5 and 6 get full appendix proofs or a more modest posture.
5. Make Section 10 artifact-exact.
6. Remove all internal-note vocabulary from the main text.
7. Fix the bibliography, especially `Er92c`.

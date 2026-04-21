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
- **Repo-strong, but the paper still underwrites them too weakly**
  - T2 residual comparison machinery
  - Theorem 5
  - Theorem 6
  - R52 / R53 / R56
  - universal block-product carrier-mass counter
- **Strong project-level claims that the current PDF still does not earn as unconditional headline theorems**
  - T1
  - T2 as a full lower-bound theorem
  - the finite Bonferroni-4 `< 0.19n` theorem unless Section 6 is rewritten at true theorem-proof level

So the project does not look empty. It looks **ahead of its current manuscript**.
The main task is evidentiary consolidation, not starting the mathematics over.

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
| T2 residual comparison theorem | [03-lower-bounds.tex](/Users/omisverycool/erdos-harness/erdos-872/paper/sections/03-lower-bounds.tex:153) | `phase4/t2_core_paper_note.md`; `RequestProject/T2Finite/{EmbeddingCore,EmbeddingFamily}.lean` | Strong | Mostly supported | The arithmetic picture is better-backed than the final T2 theorem, but the paper still labels the proof a sketch and compresses key invariants. | Keep if T2 stays; consider moving full proof into appendix. |
| T2 activation-stage inequality | [03-lower-bounds.tex](/Users/omisverycool/erdos-harness/erdos-872/paper/sections/03-lower-bounds.tex:201) | `phase4/t2_core_paper_note.md`; `researcher-22-codex-T2-activation-audit.md` | Strong | Not yet supported | This is still a proof-sketch theorem in the paper, even if the repo note chain may be solid. | Expand heavily or move to appendix if T2 remains. |
| T2 lower bound | [03-lower-bounds.tex](/Users/omisverycool/erdos-harness/erdos-872/paper/sections/03-lower-bounds.tex:251) | `phase4/t2_core_paper_note.md`; `phase4/t2_maker_first_lemmas.md`; `researcher-21-*`; `researcher-22-*`; T2 Lean finite core | Strong | Not yet supported | The repo has a serious note package, but the paper still presents only a compressed final assembly and relies on imported note structure. | Either expand T2 into a full appendix-level proof or downgrade it to a program / announced theorem to appear separately. |
| Exact `5/24` cover theorem | [04-5-24-cover.tex](/Users/omisverycool/erdos-harness/erdos-872/paper/sections/04-5-24-cover.tex:18) | `current_state.md`; `lean/tau_5_24/.../{Cover,Packing,Tau}.lean` | Banked | Supported | This is the cleanest auxiliary theorem in the draft. The paper version is close to normal math-paper style already. | Keep and consider making it even more self-contained. |
| `13/36` upper bound | [05-intermediate-upper-bounds.tex](/Users/omisverycool/erdos-harness/erdos-872/paper/sections/05-intermediate-upper-bounds.tex:19) | `current_state.md`; `lean/shortener_13_36/.../MainTheorem.lean` | Banked | Mostly supported | The section reads as a compressed proof sketch, but the logic is much more standard and self-contained than T1/T2/0.19. | Keep; modest expansion would likely suffice. |
| `5/16` upper bound | [05-intermediate-upper-bounds.tex](/Users/omisverycool/erdos-harness/erdos-872/paper/sections/05-intermediate-upper-bounds.tex:82) | `researcher-08-5-16-improvement.md`; `lean/shortener_5_16/.../Theorems.lean` | Strong | Mostly supported | Similar to `13/36`: mathematically plausible in the draft, but still compressed enough that a skeptical reader may want one more layer of detail. | Keep; expand slightly or move routine details to appendix. |
| Round 15 local density proposition | [06-main-upper-bound.tex](/Users/omisverycool/erdos-harness/erdos-872/paper/sections/06-main-upper-bound.tex:50) | `researcher-57-pro-round15-bonferroni4-PROVED-L-le-0.19n.md`; R57/R60 repair chain | Strong | Not yet supported | It is still a proof sketch in the paper, but it is one of the load-bearing theorem inputs. | Write at theorem-proof level or explicitly make later theorem conditional on it. |
| Envelope and inversion proposition | [06-main-upper-bound.tex](/Users/omisverycool/erdos-harness/erdos-872/paper/sections/06-main-upper-bound.tex:114) | `researcher-57-pro-round15-bonferroni4-PROVED-L-le-0.19n.md`; `r57_bonferroni4_audit_and_repair.md` | Strong | Not yet supported | Same issue as local density: crucial theorem input, still presented as sketch. | Expand or conditionalize. |
| Prime-sequence Bonferroni comparison theorem | [06-main-upper-bound.tex](/Users/omisverycool/erdos-harness/erdos-872/paper/sections/06-main-upper-bound.tex:160) | `researcher-60-pro-R57-repair-PROVED-theorems-2-1-and-4-1.md`; `r57_bonferroni4_audit_and_repair.md` | Strong | Mostly supported | This is one of the cleaner parts of Section 6 and reads more theorem-like than the density/envelope pieces. | Keep, but tighten if Section 6 is rewritten. |
| Prime-rounding bridge theorem | [06-main-upper-bound.tex](/Users/omisverycool/erdos-harness/erdos-872/paper/sections/06-main-upper-bound.tex:246) | `researcher-60-pro-R57-repair-PROVED-theorems-2-1-and-4-1.md`; `r57_bonferroni4_audit_and_repair.md` | Strong | Mostly supported | Stronger than the density/envelope exposition, but still part of a section that is overall more compressed than a referee will want. | Keep; likely survives in a rewritten Section 6. |
| Finite Bonferroni-4 `< 0.19n` upper bound | [06-main-upper-bound.tex](/Users/omisverycool/erdos-harness/erdos-872/paper/sections/06-main-upper-bound.tex:357) | R57 + R60 notes; `Round15Bonferroni4/Target.lean` | Strong | Not yet supported | The repo may well have the full argument, but the paper still carries the local density law and envelope/inversion as proof-sketch-level ingredients. | Either write Section 6 at true theorem-proof level, or temporarily mark the theorem conditional on the named Section 6 inputs. |

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

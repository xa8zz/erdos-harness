# Codex Prove / Formalize / Repair Backlog

Purpose: prioritized work list for Codex to strengthen the main Erdős 872 paper. Items are ranked by expected paper-impact, not by effort.

Legend:
- **Status** — current rigor (Lean-verified / rigorous prose / near-banked / needs repair)
- **Type** — kind of work (Lean formalization, math repair, fresh proof, audit)
- **Effort** — rough time estimate
- **Impact** — what changes in the paper if completed

## Recommended execution order (2026-04-20)

If the goal is to strengthen the paper fastest, the best order is:

1. **Item 4 (T2 lower bound Lean attempt).**
   - If this lands, the paper's lower-bound side becomes much more credible.
   - Even partial formalization is valuable.

2. **Item 7 (universal block-product carrier-mass counter).**
   - Cleanest next obstruction theorem to formalize.
   - Best candidate for the anchor theorem in a "landscape of impossibility" section.

3. **Item 5 (Theorem 5).**
   - Cleanest next restricted-class Lean win.
   - Builds reusable carrier / legality infrastructure for Theorem 6.

4. **One clean late obstruction theorem: Item 18 (R56 barrier) or Item 19 (R44), then Item 20 (R46).**
   - These strengthen the paper’s structural narrative more than another marginal constant push.

5. **Item 6 (Theorem 6).**
   - Strong but slightly less likely to be a fast clean win than Theorem 5 because of the triple-count layer.

6. **Item 3 (`0.18969n` full R15 bound).**
   - High upside, but lower probability and still needs the full breakpoint / monotone-envelope / comparison-sequence repair.

7. **Item 1(b) (full `5/16` game theorem).**
   - Valuable if it lands, but not the fastest paper-strengthening route.

## Current paper position (2026-04-20)

- Use the Round 15 sub-`0.19` constant as the current paper-facing Shortener headline, but label it as computationally certified / pending the monotone-envelope transfer rather than as a theorem.
- Mention `L(n) <= (\mathcal W/2 + o(1)) n \approx 0.18969 n` only as the sharper numerically certified refinement from the same Round 15 density, not yet as a banked theorem.
- Keep `13/36` as the fully formalized unconditional anchor and the `5/16` combinatorial Lean core as formal support for the older prime-prefix route.
- Do **not** spend parallel proof effort on the full `0.18969` repair before the finite sub-`0.19` writeup is normalized.
- If the paper adds more obstruction material, the best next promotion targets are:
  - the universal block-product carrier-mass counter,
  - one clean R56 separator-only barrier theorem,
  - R44 residual-floor diagnosis,
  - R46 smallest-legal-prime lemma.

---

## Tier 1 — Flagship upper-bound upgrades

### 1. Close the 5/16 Lean gap
- **Status**: 15/16 sub-theorems sorry-free; one remaining sorry at `game_value_per_parameter` (needs Chebyshev + game-tree induction).
- **Type**: Split into two subgoals.
  - **(a) Zero-sorry combinatorial core**: replace the Chebyshev invocation by fixing `D = {3, 5}` explicitly (`Σ 1/q = 8/15 > 1/2`), and prove the corresponding `countOddDFree` / antichain compression bound with no strategy-executability dependence.
    - **Progress (2026-04-20)**: landed in `RequestProject/Shortener516/Theorems.lean` as `antichain_card_le_countOddDFree`, `countOddDFree_three_five_bound`, and `antichain_three_five_core_bound`; `lake build RequestProject.Shortener516.Theorems` succeeds and the only remaining `sorry` in that file is still `game_value_per_parameter`.
  - **(b) Full game theorem**: treat separately. The fixed `D = {3,5}` substitution does **not** by itself prove the actual game-theoretic `L(n) ≤ 5n/16 + o(n)` strategy, because a fixed `D` is not the same as proving Shortener can realize that prefix in every game tree.
- **Files**: [aristotle/shortener_5_16.tex](aristotle/shortener_5_16.tex), [lean/shortener_5_16/](lean/shortener_5_16/)
- **Effort**: ~30 min.
- **Impact**:
  - **(a)** gives a zero-sorry Lean verification of the 5/16 sieve/compression core, which is still strong paper support and likely worth citing the same way the 13/36 Aristotle artifact is cited.
  - **(b)** if separately closed, promotes the full `L(n) ≤ 5n/16 + o(n)` game theorem from near-banked to banked.

### 2. Normalize the finite sub-`0.19` Bonferroni-4 writeup
- **Status**: Strong computational result, not yet theorem-safe. The strongest fully safe Round 15 theorem-content today is the local prime-count-per-range / piecewise-density lemma away from breakpoints. Audit #2 treats the finite `0.190n` theorem as valid via the "phantom atoms carry only O(1/log n) reciprocal mass" argument, while Audit #1 and Audit #3 still want the monotone-envelope / breakpoint writeup before promoting even the finite statement as a theorem. The numerical truncation itself is independently ratified in `phase3/shortener_piecewise_bonferroni4_summary.md`, with finest-grid `W4/2 = 0.189710592 < 0.19`.
- **Type**: Fresh writeup first. Shortener strategy is the same odd-prime prefix as 13/36 / 5/16; improvement comes from piecewise density ρ(u) = 1/((⌊1/u⌋+1)u) and a 4-term Bonferroni cutoff. Aristotle only after the missing monotone-comparison transfer is written explicitly.
- **Files**: [researcher-15-pro-shortener-upperbound-prime-count-refinement.md](researcher-15-pro-shortener-upperbound-prime-count-refinement.md), audits [verify-postresp-15-*](./) 1/2/3
- **Effort**: 1–2 hrs.
- **Impact**: Dominates 5/16 significantly on the constant level (sub-`0.19` vs `0.3125`). Once the transfer is normalized, this becomes the paper's flagship upper-bound theorem; before that, it is still the strongest computational headline.

### 3. Repair + formalize the full R15 bound at 0.18969n
- **Status**: Constant numerically verified by three audits. One mathematical gap: explicit boundary-uniform monotone comparison sequence `b_j` across breakpoints u = 1/h for the factorial-moment machinery.
- **Type**: Math repair first (write out the monotone sequence + boundary argument); then Aristotle attempt. Aristotle may struggle with infinite-series evaluation even after repair; the finite sub-`0.19` Bonferroni-4 statement (#2) is the fallback paper headline.
- **Files**: [researcher-15-pro-shortener-upperbound-prime-count-refinement.md](researcher-15-pro-shortener-upperbound-prime-count-refinement.md), [researcher-14-pro-shortener-upperbound-01-log-density.md](researcher-14-pro-shortener-upperbound-01-log-density.md)
- **Effort**: 2–3 hrs math + 1 hr Aristotle attempt.
- **Impact**: Sharpest constant in the repo. If (2) lands, this is a stretch goal.

---

## Tier 2 — Formalize core rigorous-prose results

### 4. Attempt Lean formalization of the T2 lower bound
- **Status**: Rigorous prose after R21/R22 Codex repair + activation audit. Strong Lean progress landed on 2026-04-20: both the finite graph-potential core and the abstract scored 3-uniform slot-hypergraph core are now formalized in `lean/erdos_872_core/`; the arithmetic embedding and finite-family comparison layers are largely Lean-banked; and `phase4/t2_core_paper_note.md` now consolidates the paper-grade wrapper. The remaining formal-only gap is the final integrated Lean theorem.
- **Type**: Direct Lean 4 port. Maker-first hypergraph capture with Q_t potential + activation bookkeeping. May need Mathlib hypergraph coverage.
- **Files**: [phase4/t2_core_paper_note.md](phase4/t2_core_paper_note.md), [phase4/t2_maker_first_lemmas.md](phase4/t2_maker_first_lemmas.md), [researcher-21-codex-T2-maker-first-repair.md](researcher-21-codex-T2-maker-first-repair.md), [researcher-22-codex-T2-activation-audit.md](researcher-22-codex-T2-activation-audit.md)
- **Effort**: 2–3 hrs; accept graceful failure.
- **Impact**: Formally verifies the entire lower-bound direction. Even a partial formalization (main potential + union bound, with Mathlib sorries for prime counting) is valuable.
- **Progress (2026-04-20)**:
  - New Lean project: `lean/erdos_872_core/`
  - Build status: `~/.elan/bin/lake build RequestProject` passes cleanly.
  - Banked finite-core graph lemmas:
    - `Q8_empty_eq_totalWeight`
    - `Q8_terminal_eq_eight_claimedWeight`
    - `Q8_maker_ge_add_selfPot`
    - support lemmas `liveEdge_maker_iff_of_ne`, `capturedCount_mono_after_maker`, `edgeContrib_mono_after_maker_of_ne`
  - Banked finite-core hypergraph lemmas:
    - `HQ8_empty_eq_totalWeight`
    - `HQ8_terminal_eq_eight_scoredWeight`
    - `HQ8_maker_ge`
    - `HQ8_maker_ge_add_selfPot_of_count_le_two`
    - `HQ8_breaker_score_ge`
  - Banked local embedding arithmetic lemmas in `EmbeddingCore.lean`:
    - `smallDivisors_eq_divisors_ac`
    - `dvd_value_mem_smallDivisors_or_b_mul_smallDivisor`
    - `mem_slots_or_eq_value_of_dvd_value_not_small`
    - `mem_harmfulMoves_iff`
    - `eq_b_of_b_dvd_value`
    - `eq_b_and_a_eq_or_eq_of_ab_dvd_value`
    - `eq_b_and_c_eq_or_eq_of_cb_dvd_value`
    - `b_dvd_value_iff_mem_slots`
    - `ab_dvd_value_iff_mem_slots`
    - `cb_dvd_value_iff_mem_slots`
    - `eq_of_value_eq`
    - `value_legal_against_of_disjoint_smallDivisors_and_harmfulMoves`
  - Banked family-level comparison lemmas in `EmbeddingFamily.lean`:
    - `harmfulTargets_eq_slotIncidentTargets_b`
    - `harmfulTargets_eq_slotIncidentTargets_ab`
    - `harmfulTargets_eq_slotIncidentTargets_cb`
    - `mem_harmfulTargets_value_iff_eq_of_upperHalf`
    - `harmfulTargets_eq_singleton_value_of_upperHalf`
  - The exact-target side of the comparison is now Lean-banked for upper-half families: exact target plays hit only their own residual target, matching scored-edge semantics.
  - The local legal-live-edge arithmetic is now Lean-banked too: `value_legal_against_of_disjoint_smallDivisors_and_harmfulMoves` proves that once the played set avoids a target's accounted-for small divisors and harmful moves, the target value is automatically incomparable with every played number.
  - A new canonical note `phase4/t2_core_paper_note.md` now packages the remaining non-Lean comparison and bookkeeping arguments in theorem-proof form suitable for paper writing.
  - Next exact target: formalize the global wrapper that shows the actual activation-stage played set satisfies the disjointness hypotheses of `value_legal_against_of_disjoint_smallDivisors_and_harmfulMoves`, and then formalize the activation/token bookkeeping estimate (`Q_end >= W0/8 - E`) inside Lean, so the current artifact becomes a fully integrated formal T2 skeleton rather than a Lean core plus prose wrapper.

### 5. Formalize Theorem 5 — O(n/log n) against disjoint small-prime carriers
- **Status**: Banked theorem-grade prose. `phase4/theorem5_disjoint_carriers_note.md` now gives a canonical paper-facing writeup with the online-priority patch and the corrected pure-prime-power argument.
- **Type**: Lean formalization.
- **Files**: [phase4/theorem5_disjoint_carriers_note.md](phase4/theorem5_disjoint_carriers_note.md), [current_state.md](current_state.md) ("Round 12 follow-up -- Theorem 5"), [followup-12-pro-closeout-response.md](followup-12-pro-closeout-response.md)
- **Effort**: 1–2 hrs.
- **Impact**: Strengthens restricted-class section with a verified theorem.

### 6. Formalize Theorem 6 — rank ≤ 3 extension of Theorem 5
- **Status**: Banked theorem-grade prose. `phase4/theorem6_rank3_squarefree_note.md` now packages the four-phase strategy, the fixed-`alpha` triple-count estimate, the expanded survivor induction, and the `{30,42,70}` resolution in one canonical paper-facing note.
- **Type**: Lean formalization.
- **Files**: [phase4/theorem6_rank3_squarefree_note.md](phase4/theorem6_rank3_squarefree_note.md), [current_state.md](current_state.md) ("Theorem 6 -- rank-<=3 extension of Theorem 5"), [researcher-13-pro-rank3-extension.md](researcher-13-pro-rank3-extension.md)
- **Effort**: 1–2 hrs.
- **Impact**: Completes the restricted-class pair.

### 7. Formalize the universal block-product carrier-mass counter
- **Status**: Banked theorem-grade prose. `phase4/block_product_carrier_mass_note.md` now packages the sieve implication, the universal block-product theorem, and the resulting closure of the bounded-carrier-mass route in one paper-grade note.
- **Type**: Lean formalization. Pure combinatorial + number-theoretic; no game-tree recursion.
- **Files**: [phase4/block_product_carrier_mass_note.md](phase4/block_product_carrier_mass_note.md), [current_state.md](current_state.md) ("Universal Prolonger counter on carrier mass"), [verify-postresp-10-audit-universal-block-product.md](verify-postresp-10-audit-universal-block-product.md)
- **Effort**: 1–2 hrs.
- **Impact**: Flagship negative theorem — formally verified refutation of the bounded-carrier-mass paradigm. Biggest impact in Section 8.

---

## Tier 3 — Additional standalone theorems worth formalizing

### 8. Separate-rank fan no-go (R17/R18)
- **Status**: Banked prose. `max_h W_h(n) ~ n/√(log log n) = o(n)`; summed fan contributions give `n/(log n)^(1-o(1))`.
- **Type**: Lean formalization.
- **Files**: [researcher-17-codex-negative-on-separate-rank-fan-route.md](researcher-17-codex-negative-on-separate-rank-fan-route.md), [researcher-18-pro-multi-rank-coupling-refuted.md](researcher-18-pro-multi-rank-coupling-refuted.md)
- **Effort**: 1–2 hrs.
- **Impact**: Another formally verified negative theorem.

### 9. Band-local closure explosion (R24)
- **Status**: Banked prose. High-band triple reciprocal mass + low-pool squarefree mass forces one dyadic skeleton band with constant reciprocal mass.
- **Type**: Lean formalization.
- **Files**: [researcher-24-codex-band-local-closure-explosion.md](researcher-24-codex-band-local-closure-explosion.md)
- **Effort**: 1–2 hrs.
- **Impact**: Crisp structural result — reinforces "right invariant is squarefree multiplicative closure."

### 10. Dyadic collision tail (R39)
- **Status**: Rigorous prose. `μ(T_c) ≪ N_h · c⁴/h²`. Pure analytic/combinatorial.
- **Type**: Lean formalization.
- **Files**: [researcher-39-pro-dyadic-packet-absorption-static.md](researcher-39-pro-dyadic-packet-absorption-static.md)
- **Effort**: 1 hr.
- **Impact**: Verified technical lemma; natural packet-analysis subsection lemma.

### 11. Residual-width refutation (R20)
- **Status**: Banked counterexample.
- **Type**: Lean formalization of the upper-half lift obstruction.
- **Files**: [researcher-20-codex-residual-width-framework-refuted.md](researcher-20-codex-residual-width-framework-refuted.md)
- **Files**: `researcher-20-codex-residual-width-framework-refuted.md`
- **Effort**: 1 hr.
- **Impact**: Section 8 reinforcement.

### 12. Ford-route correction (R23)
- **Status**: Banked. Prevents invalid use of divisor-interval literature.
- **Type**: Lean is overkill here; prose note is enough. Flag for math audit to ensure the correction reads cleanly in the paper.
- **Files**: [researcher-23-codex-ford-route-correction.md](researcher-23-codex-ford-route-correction.md), [ford-integration-audit.md](ford-integration-audit.md)
- **Effort**: 30 min math review.
- **Impact**: Cautionary subsection; keeps the paper honest.

### 18. Normalize one R56 separator-only barrier theorem
- **Status**: Banked theorem-grade prose. `phase4/r56_separator_only_barrier_note.md` now packages the finite odd-carrier separator-only no-go theorem and the concrete `tau_SF` dyadic-shielding corollary in one canonical paper-facing note.
- **Type**: Audit + normalization first; Lean only if the statement stabilizes in final paper form.
- **Best source**: [phase4/r56_separator_only_barrier_note.md](phase4/r56_separator_only_barrier_note.md), with raw source in [researcher-56-pro-finite-odd-carrier-separator-only-negative-theorem.md](researcher-56-pro-finite-odd-carrier-separator-only-negative-theorem.md) and the concrete strategy corollary in [researcher-56-pro-tau-sf-refuted-upper-half-dyadic-shielding.md](researcher-56-pro-tau-sf-refuted-upper-half-dyadic-shielding.md)
- **Effort**: 30–60 min audit + writeup normalization.
- **Impact**: Promotes the late packet/separator era from "supporting collapse evidence" to one named theorem about a real proof class.

### 19. Normalize R44 residual-floor diagnosis
- **Status**: Banked theorem-grade prose. `phase4/r44_residual_floor_note.md` now packages the conditional SFLU-E statement, the local-star obstruction, and the R35 residual-floor theorem in one canonical paper-facing diagnosis note.
- **Type**: Write a clean theorem/diagnosis statement plus one paragraph explaining why it blocks the conjectured sharp rate from existing ingredients.
- **Files**: [phase4/r44_residual_floor_note.md](phase4/r44_residual_floor_note.md), [current_state.md](current_state.md) (Round 44 section)
- **Effort**: 30–60 min writeup normalization.
- **Impact**: Gives the paper its cleanest "why the matching upper bound is hard" structural section.

### 20. Normalize R46 smallest-legal-prime lemma + ST-capture refutation
- **Status**: Banked theorem-grade prose. `phase4/r46_st_capture_refutation_note.md` now packages the unconditional ST-capture refutation, the conditional smallest-legal-prime lemma that remains valid, and the later local obstruction to the unconditional rule.
- **Type**: Write a clean positive lemma + negative corollary pair in paper form.
- **Files**: [phase4/r46_st_capture_refutation_note.md](phase4/r46_st_capture_refutation_note.md), [current_state.md](current_state.md) (R46 section)
- **Effort**: 30–60 min writeup normalization.
- **Impact**: Supplies one crisp dynamic lemma and one crisp refutation from the late-stage packet program.

---

## Tier 4 — Audit first, then formalize if stable (remaining R52–R55 packet-era items)

Codex's `publication_source_of_truth.md` still flags most of R52–R55 as not fully normalized — the packet formalism changed repeatedly. R56 is the exception and now has a canonical note. Before formalizing the remaining packet-era items, audit the source statement and ensure it's stable.

### 13. q-shadow covering dichotomy (R53)
- **Status**: Python-verified on ~2.4M states; not folded into current_state.md.
- **Type**: (a) Audit source, (b) add to current_state.md if stable, (c) Lean formalize.
- **Files**: [researcher-53-codex-q-shadow-covering-dichotomy.md](researcher-53-codex-q-shadow-covering-dichotomy.md)
- **Effort**: 30 min audit + 1–2 hrs formalization.
- **Impact**: Standalone extremal-combinatorics theorem; adds a late-stage positive result.

### 14. Spectral live-space separator (R52)
- **Status**: SVD-verified for 5 parameter settings.
- **Type**: Audit + Lean.
- **Files**: [researcher-52-pro-spectral-live-space-johnson-scheme.md](researcher-52-pro-spectral-live-space-johnson-scheme.md)
- **Effort**: 30 min audit + 1–2 hrs formalization.
- **Impact**: Standalone spectral-graph theorem.

### 15. Sherali-Adams barrier + transversal-integrality barrier (R52)
- **Status**: Rigorous per Sonnet audit but R52-era; Codex did not highlight it.
- **Type**: Audit source, then Lean.
- **Files**: [researcher-52-pro-fresh-zoom-transversal-integrality-barrier.md](researcher-52-pro-fresh-zoom-transversal-integrality-barrier.md)
- **Effort**: 30 min audit + 1–2 hrs formalization.
- **Impact**: Standalone LP-hierarchy barrier theorem; crisp explanation of why local/fractional methods plateau at the r_2 scale.

### 16. Near-top Johnson-shadow theorem + sharp C(L+s,s) multiplier (R53)
- **Status**: Tight multiplier; covering-design saturation example; not yet integrated.
- **Type**: Audit, then Lean.
- **Files**: [researcher-53-pro-continuation-near-top-shadow-refuted-by-covering-design.md](researcher-53-pro-continuation-near-top-shadow-refuted-by-covering-design.md)
- **Effort**: 30 min audit + 1–2 hrs formalization.
- **Impact**: Standalone weighted-incidence inequality; publishable in extremal combinatorics independent of Erdős 872.

---

## Tier 5 — Speculative / likely to fail

### 17. Close the 5 remaining Theorem A sorries
- **Status**: Mertens' second theorem, Chebyshev π(x) ≤ 3x/log x, PNT θ(x) ~ x.
- **Type**: Lean — requires Mathlib analytic NT imports that largely don't exist. Alternative: prove weaker admissible versions in-place.
- **Files**: [aristotle/theorem_A_shield_lower_bound.tex](aristotle/theorem_A_shield_lower_bound.tex), [lean/theorem_A/](lean/theorem_A/)
- **Effort**: 3+ hrs with high failure risk.
- **Impact**: Theorem A becomes fully sorry-free. Nice-to-have, not load-bearing.

---

## Parallelization notes

Aristotle runs are async — can dispatch 4–6 in parallel. Rough batching:
- **Batch A (Tier 1 focused)**: #1 (trivial), #2 (main new upper bound), dispatch in parallel.
- **Batch B (Tier 2 core)**: #5, #6, #7 — all structurally similar, can run in parallel.
- **Batch C (Tier 3 negatives)**: #8, #9, #10, #11 — parallel Aristotle.
- **Batch D (Tier 4 audit-gated)**: audit 13–16 first (sequential), formalize in parallel after.
- **Batch E (Tier 2 stretch)**: #3 (math repair first), #4 (T2 Lean attempt).

## Concrete parallel split for the next wave

- **Main thread (do locally, blocking):** keep the paper-facing docs coherent: Round 15 status, one clean R56 theorem promotion, and the "landscape of impossibility" section logic.
- **Worker A:** T2 finite-core Lean attempt, *not* the full asymptotic theorem first. Target the Maker-first graph/hypergraph potential core plus the `Q_end >= W0/8 - E` style finite statement; allow number-theory assumptions or wrapper sorries in the asymptotic corollary.
- **Worker B:** Theorem 5 first, then Theorem 6. Theorem 5 is the cleaner first Lean win because it builds the reusable "resolved prime / carrier / legality" infrastructure and avoids the rank-3 triple-count step.
- **Worker C:** universal block-product theorem formalization.
- **Worker D:** normalize one late obstruction theorem: R56 first, then R44 or R46.
- **Stretch worker only after the above:** either the full `0.18969` breakpoint repair or the final `5/16` game-theorem gap. These are meaningful, but they are not the fastest paper-strengthening wins.

## Reporting

For each item, when complete, produce:
1. One-line theorem statement (updated constants / strategy if relevant).
2. Formalization outcome: zero sorry / sorries with locations / structural failure + reason.
3. Pointer to the output tarball or Lean file.
4. One-line paper insert: which section it goes in + how it reads in the paper.

If an attempt fails, note the specific Mathlib / structural gap and stop — no grinding. The paper survives without any single item.

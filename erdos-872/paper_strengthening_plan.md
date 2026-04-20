# Paper Strengthening Plan

Last updated: 2026-04-20

This file is the operational plan for turning the current repo state into the strongest honest paper package.

## 1. Current paper stance

- The strongest fully banked Shortener upper-bound theorem is still `L(n) <= (13/36 + o(1)) n`.
- The Round 15 piecewise-density route gives a **computationally certified sub-`0.19` candidate** on the Shortener side. The current reproducible verifier reports `W4/2 = 0.189710592 < 0.19`.
- The sharper Round 15 limit constant `0.18969n` is the same story pushed one step further: numerically very well supported, but still not theorem-grade until the monotone-envelope / breakpoint transfer is written explicitly.
- If we want a literal theorem extracted from Round 15 today, the safest one is the local prime-count-per-range / piecewise-density lemma away from the breakpoints `u = 1/h`, not the full sub-`0.19` constant.
- So the honest paper posture today is:
  - theorem section: `13/36`, `5/24`, Shield Reduction, Theorem A, T1, and T2 if we are willing to stand behind the repaired prose;
  - upper-bound discussion / computational section: Round 15 gives a certified sub-`0.19` candidate;
  - do not state `0.190n` or `0.18969n` as a theorem yet.

## 2. What the paper should say right now

- Safe theorem claim: `L(n) <= (13/36 + o(1)) n`.
- Safe near-theorem support claim: the `5/16` Lean combinatorial core is in place except for the final game-theoretic bridge.
- Safe computational claim: the Round 15 piecewise-density model yields a reproducible candidate upper constant below `0.19`, with Bonferroni-4 truncation numerically certified by `phase3/shortener_piecewise_bonferroni4_summary.md`.
- Safe sharper remark: the same model points to a limiting constant near `0.18969`, but the proof still needs the global monotone comparison sequence across the breakpoints `u = 1/h`.

## 2A. Most Worth Incorporating

If we are deciding what additional math should actually enter the paper, the best next incorporations are:

1. The Round 15 local prime-count-per-range theorem plus the computational sub-`0.19` note.
2. The universal block-product carrier-mass counter as the main obstruction theorem.
3. One clean R56 separator-only barrier theorem, not just a passing mention.
4. R44 residual-floor diagnosis as the best explanation of why the sharp-rate upper-bound program keeps failing.
5. R46 smallest-legal-prime lemma as a reusable positive dynamic lemma.
6. R54 strategy-dependence classification as a taxonomy subsection, not as a flagship theorem.

This naturally suggests a dedicated "landscape of impossibility" section rather than scattering the obstructions as isolated remarks.

## 3. Highest-leverage next tasks

1. T2 Lean attempt, but only for the finite combinatorial core first.
   - Goal: formalize the Maker-first graph/hypergraph potential package and the `Q_end >= W0/8 - E` style finite statement.
   - Do not begin with the full asymptotic lower bound; the number-theory wrapper is the part most likely to be blocked by Mathlib.

2. Formalize Theorem 5.
   - This is the cleanest next restricted-class theorem and the best first Lean win in that lane.

3. Formalize the universal block-product carrier-mass counter.
   - This is the cleanest next obstruction theorem and the best candidate for a named "landscape of impossibility" theorem.

4. Formalize Theorem 6.
   - Natural follow-on after Theorem 5, reusing the same carrier / resolved-prime infrastructure.

5. Normalize one late-stage obstruction theorem for the paper body.
   - Best candidates: the R56 finite odd-carrier / separator-only barrier first, then R44 residual-floor diagnosis, then R46.

6. Only after the above: chase the full `0.18969` repair or the last `5/16` game-theorem gap.

7. As a framing task rather than a proof task, add an R54-based strategy-dependence taxonomy subsection if the paper wants a structured proof-landscape narrative.

## 4. Recommended parallel split

- **Main thread:** Round 15 paper normalization.
  - This is the blocking narrative task because multiple docs were saying slightly different things.

- **Worker A:** T2 finite-core Lean skeleton.
  - Target statement should be a finite activation / token-mass theorem, not the full asymptotic `c n (log log n)^2 / log n` statement.

- **Worker B:** Theorem 5 Lean preparation and first formalization pass.
  - Focus on resolved primes, carrier uniqueness, legality of the phase moves, and the survivor-classification lemma.

- **Worker C:** theorem-selection memo for the next obstruction result.
  - Pick exactly one of: universal block-product counter, R44 residual-floor diagnosis, R46 smallest-legal-prime + ST-capture refutation, or the cleanest R56 separator-only barrier.
  - Deliverable is a paper-facing theorem statement plus proof-scope estimate.

- **Stretch worker only if extra capacity exists:** the full Round 15 breakpoint repair or the last `5/16` game-theorem bridge.

## 5. Ready-to-send prompts

### Prompt for Worker A

```text
Please work only on the T2 lower-bound Lean/formalization scope in this repo.

Target the finite combinatorial core first, not the full asymptotic theorem. I want:

1. the cleanest finite theorem statement that captures the Maker-first graph/hypergraph potential argument;
2. the exact list of core lemmas needed;
3. which parts are pure finite combinatorics vs which parts are number-theory wrapper;
4. a recommendation for the first Lean file / definitions to create.

Please do not spend time re-proving the asymptotic prime-count estimates yet. I care about the highest-value finite formal core.
```

### Prompt for Worker B

```text
Please work only on Theorem 5 (and secondarily Theorem 6) in this repo.

I want:

1. a clean paper statement for Theorem 5;
2. the minimal static/combinatorial core that should be formalized first;
3. the exact legality / resolved-prime / carrier lemmas that need to exist in Lean;
4. whether Theorem 6 should wait until after Theorem 5 infrastructure is built.

Please optimize for the fastest likely zero-sorry theorem artifact, not for maximum ambition.
```

### Prompt for Worker C

```text
Please inspect the strongest obstruction theorems in this repo and pick the best next one to elevate for the paper.

Candidates:
- universal block-product carrier-mass counter;
- R44 residual-floor diagnosis / local-star obstruction;
- R46 smallest-legal-prime lemma + ST-capture refutation.

I want:

1. the cleanest paper-facing theorem statement among these;
2. why it strengthens the paper materially;
3. how hard it looks to formalize or normalize;
4. which one should be next after T2 / Theorem 5.
```

### Prompt for Stretch Worker

```text
Please look only at the Round 15 piecewise-density upper-bound writeup.

I want a memo on the missing monotone-envelope / breakpoint transfer:

1. exact statement of the missing repair;
2. a proposed sequence of lemmas to make the `0.18969` limit theorem-grade;
3. whether the finite Bonferroni-4 sub-0.19 statement becomes theorem-safe first;
4. what should be called computational only vs theorem-grade right now.
```

## 6. What not to parallelize yet

- Do not put a worker on the full `0.18969` repair before the Round 15 sub-`0.19` writeup is normalized.
- Do not spend a worker on Theorem 6 before Theorem 5 unless someone has already built the carrier / legality infrastructure.
- Do not spend paper time polishing packet-era statements that are not yet normalized into `current_state.md`, except when extracting one clearly stable negative theorem.

## 7. Highest-Impact Remaining Proofs

If the question is not "what is most interesting?" but "what proof would most strengthen the paper if it landed next?", my current ranking is:

1. T2 finite-core formalization.
2. Universal block-product carrier-mass counter Lean formalization.
3. Theorem 5 Lean formalization.
4. Theorem 6 Lean formalization.
5. R44 residual-floor diagnosis normalized into a theorem-grade note.
6. R46 smallest-legal-prime / ST-capture refutation normalized into a theorem-grade note.
7. Full Round 15 breakpoint repair for theorem-grade sub-`0.19`.
8. Final `5/16` game-theorem bridge.

Why this order:

- T2 most improves the credibility of the lower-bound side.
- Block-product is the cleanest major obstruction theorem still waiting on a formal artifact.
- Theorem 5 and Theorem 6 are now normalized on paper, so the remaining value there is formal verification.
- R44 and R46 are the next best short theorem-writeup wins after R56.
- The full Round 15 and `5/16` repairs are high upside, but lower probability and more delicate.

Progress note (2026-04-20):

- T2 item now has a genuine Lean foothold: `aristotle/t2_finite_core/` builds cleanly and formalizes both
  - the graph-potential `Q8` core (`Q8_empty_eq_totalWeight`, `Q8_terminal_eq_eight_claimedWeight`, `Q8_maker_ge_add_selfPot`), and
  - the scored 3-uniform `HQ8` slot-game core (`HQ8_empty_eq_totalWeight`, `HQ8_terminal_eq_eight_scoredWeight`, `HQ8_maker_ge`, `HQ8_breaker_score_ge`).
- The local arithmetic part of the embedding is now Lean-banked too: `EmbeddingCore.lean` proves `smallDivisors_eq_divisors_ac`, `dvd_value_mem_smallDivisors_or_b_mul_smallDivisor`, `mem_slots_or_eq_value_of_dvd_value_not_small`, the exact harmful-move characterization `mem_harmfulMoves_iff`, the slot-incidence lemmas `eq_b_of_b_dvd_value`, `eq_b_and_a_eq_or_eq_of_ab_dvd_value`, `eq_b_and_c_eq_or_eq_of_cb_dvd_value`, the exact incidence iff-statements `b_dvd_value_iff_mem_slots`, `ab_dvd_value_iff_mem_slots`, `cb_dvd_value_iff_mem_slots`, and the value-uniqueness lemma `eq_of_value_eq`.
- A new family-level file `EmbeddingFamily.lean` now proves `harmfulTargets_eq_slotIncidentTargets_b`, `harmfulTargets_eq_slotIncidentTargets_ab`, `harmfulTargets_eq_slotIncidentTargets_cb`, and the exact-target singleton statements `mem_harmfulTargets_value_iff_eq_of_upperHalf`, `harmfulTargets_eq_singleton_value_of_upperHalf`. So both halves of the residual comparison now exist in Lean at the finite-family level: slot moves delete exactly incident hyperedges, and exact target plays score only their own upper-half target.
- `EmbeddingCore.lean` now also proves the exact local legal-live-edge criterion `value_legal_against_of_disjoint_smallDivisors_and_harmfulMoves`, so the arithmetic heart of “live hyperedge implies legal actual move” is no longer only in prose.
- `phase4/t2_core_paper_note.md` now consolidates the entire repaired T2 core in one paper-grade note, so the paper no longer has to cite three separate round artifacts for the lower-bound mechanism.
- The next T2 subgoal is now sharper again: formalize the global wrapper that feeds the actual activation-stage played set into the Lean-banked local legal-live-edge criterion, then formalize the activation/token bookkeeping. That is the remaining gap between "finite combinatorial + arithmetic embedding + exact family-level comparison core + local legal-live-edge criterion + paper-grade wrapper" and the full asymptotic lower bound as one integrated formal theorem.
- The universal block-product obstruction now also has a canonical paper-grade note at `phase4/block_product_carrier_mass_note.md`. That gives the obstruction section a real theorem source rather than pointing readers back to an audit artifact.
- Theorem 5 now also has a canonical paper-grade note at `phase4/theorem5_disjoint_carriers_note.md`, with the online scheduling patch and the corrected pure-prime-power argument folded in. That gives the restricted-class section one clean positive theorem source instead of relying on the raw follow-up thread.
- Theorem 6 now also has a canonical paper-grade note at `phase4/theorem6_rank3_squarefree_note.md`, with the phase-2 legality qualifier, the expanded blocked-triple survivor induction, the fixed-`alpha` triple-count bound, and the `{30,42,70}` resolution all normalized into one citeable source.
- R56 now also has a canonical paper-grade obstruction note at `phase4/r56_separator_only_barrier_note.md`, packaging the finite odd-carrier separator-only no-go theorem together with the `tau_SF` dyadic-shielding corollary. That gives the "landscape of impossibility" section a clean late packet-era theorem source instead of relying on raw round prose.
- R44 now also has a canonical diagnosis note at `phase4/r44_residual_floor_note.md`, packaging the conditional SFLU-E theorem, the local-star same-coface multiplicity obstruction, and the R35 residual-floor theorem in one paper-facing source. That gives the “why the matching upper bound is hard” section a single citeable theorem/diagnosis reference.
- R46 now also has a canonical note at `phase4/r46_st_capture_refutation_note.md`. It keeps the unconditional ST-capture refutation, but narrows the positive `sigma^*` response lemma to the conditional form that actually survives the later cross-core local obstruction. That makes the obstruction section more honest and more reusable.

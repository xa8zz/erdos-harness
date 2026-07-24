---
id: V181-fable-kernel-check
type: verification
date: 2026-07-24
intent: >
  Independent curator verification of the tier-1 Lean result: rebuild the
  project, query the kernel for the final theorem's axioms directly, and
  audit statement fidelity of the full definition chain against the
  manuscript, without relying on the formalizer's own report.
predecessors: [R179-lean-verified-manuscript, V180-lean-r179-tier1-verification]
action:
  kind: confirms
  target: R179-lean-verified-manuscript
claim: >
  Independently reproduced: lake build succeeds (8,061 jobs) and a fresh
  kernel query returns verbatim "'Erdos872.main' depends on axioms:
  [propext, Classical.choice, Erdos872.A3_exceptional_set_estimate,
  Quot.sound]" — Lean's three classical axioms plus exactly one
  problem-specific axiom. Statement fidelity audited by direct reading:
  the final theorem is Tendsto (originalRatio L) atTop (nhds 0) with
  originalRatio L N = L(N)/N; L is the backward-induction value
  (Prolonger-first sup/inf alternation, every selection by either player
  scored) of the game on Finset.Icc 2 n with legality equal to
  divisibility-incomparability (Comparable x y := x dvd y or y dvd x)
  against all earlier selections; the bridge L(n) <= V_1(n) is proved by
  literally walking the robust protocol stages including null erasures and
  the opening-end declaration. The axioms A1-A3 are transcribed
  quantifier-for-quantifier from the manuscript appendix; the exceptional
  set used by axiom A3 is the honest arithmetic definition (insert 1;
  filter on x <= delta*N or a_K(x) <= A or a_K(x) > N^gamma with a_K the
  greedy K-dense prefix of the increasing prime factor list), and the same
  definition is consumed by the game-side accounting modules, so the axiom
  and the proof speak about the same object. Trust-surface scan of all 35
  source modules found exactly the three declared axiom commands and no
  sorry, admit, native_decide, unsafe, opaque, or partial def. A1 and A2
  are declared but absent from the final theorem's dependency cone: the
  formalization axiomatizes Lemma 2.3 directly (the boundary explicitly
  permitted by the verification plan), so the section-2 derivation of 2.3
  from 2.1-2.2 remains paper-only, and the single analytic statement to
  trust on paper is Lemma 2.3, whose prose proof was validated by the
  blind referee. Caveats recorded: the rebuild used the warm lake cache
  (a cold rebuild was not run), and tier-3 status — formalizing A3 itself
  — remains open.
verifiers_at_time:
  - [fable-independent-rebuild-and-kernel-query, agrees]
  - [fable-statement-fidelity-audit, agrees]
confidence_at_time: high
strategy_dependence: independent
---

# Independent kernel check of the tier-1 result (V181)

Method: no reliance on the formalizer's harness or report. From the
verification worktree, `lake build` (completed, 8,061 jobs), then a fresh
file containing only `import Erdos872R177.Main` and
`#print axioms Erdos872.main`, compiled via `lake env lean`.

Kernel output, verbatim:

    'Erdos872.main' depends on axioms: [propext, Classical.choice,
    Erdos872.A3_exceptional_set_estimate, Quot.sound]

Statement-fidelity audit (direct source reading, files under
erdos-872/lean/r177_verification/Erdos872R177/):

- Main.lean: `theorem main : Tendsto (originalRatio Erdos872R177.L) atTop
  (nhds 0)`.
- Asymptotic.lean: `originalRatio L N = (L N : ℝ) / (N : ℝ)`.
- OriginalValue.lean: `originalValue` is backward induction on the live
  set — Prolonger nodes take `sup'`, Shortener nodes `inf'`, each
  selection adds 1 regardless of mover, termination by the measure
  `2*|live| + turnbit`; `L n = originalValue prolonger (originalBoard n)`.
- OriginalComparison.lean: `originalBoard n = Finset.Icc 2 n`;
  `afterSelect` removes the selected vertex and everything comparable.
- GameKernel.lean: `Comparable x y := x ∣ y ∨ y ∣ x`; robust boards are
  `Finset.Icc 1 N` with downsets containing 1, per the manuscript.
- L_le_v_one_full: the (1.2) bridge is proved by literally traversing the
  robust stages (null erasure, opening selection, null erasure, explicit
  opening end, Shortener scheduled first), matching the R178 protocol.
- AnalyticInputs.lean: A1, A2, A3 match the manuscript appendix
  quantifier-for-quantifier (A3 in the epsilon-N_0 form with K > 2 real,
  A >= 2 integer, delta, gamma in (0,1), absolute C existentially
  quantified with positivity).
- AnalyticDefs.lean: `exceptionalSet` is the honest arithmetic set; it is
  the same object consumed by MasterAccounting / ConcreteGeometry /
  ConcreteMaster / FiniteToDensity on the game side.

Trust surface: grep across all .lean sources for axiom, opaque, sorry,
admit, native_decide, unsafe, partial def — exactly three `axiom`
declarations (A1, A2, A3), nothing else.

Interpretation: the entire game half of the proof — robust envelope
semantics with adaptive strategies, the a_K/t_K decomposition, self-rough
tags, Lemma 3.1 nesting, cone disjointness and projection, the total
sweep strategy with provenance-classed accounting, the drafting
inequality, master inequality (4.7), the density recursion, the limit
passage, and the reduction to the original game — is machine-verified.
The single analytic input assumed is Lemma 2.3 (A3), referee-validated on
paper and formalizable in principle (tier-3). The three
formalization-era specification repairs (response-rule precedence;
pass-insertion timing; provenance-based class assignment) changed no
constant, bound, or inequality — confirmed by the R179 change log and by
the diff-audit lineage V177 -> R178 -> R179.

This crosses the harness's own promotion bar for formal verification
(zero sorry with axioms confined to named standard-style analytic
inputs). Remaining gates are non-Lean: cross-model-family audit and the
publication push.

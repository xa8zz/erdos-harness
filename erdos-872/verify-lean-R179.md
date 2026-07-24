---
id: V180-lean-r179-tier1-verification
type: verification
date: 2026-07-24
intent: >
  Test the final divisor-antichain manuscript against the Tier-1 Lean gate:
  prove the entire finite game, cone sweep, accounting, and limiting argument
  with zero proof holes while isolating the analytic number theory in named
  appendix axioms.
predecessors: [R179-lean-verified-manuscript, V178-lean-r177-partial-verification]
action:
  kind: confirms
  target: R179-lean-verified-manuscript
claim: >
  Lean 4.28 proves Erdos872.main with no sorry, admit, or unsafe declaration.
  Its only manuscript-specific logical dependency is the explicit exceptional
  set estimate A3; the robust extensive game, local traces, total root-sweep
  strategy, online drafting injection, three-class accounting, density
  recursion, and asymptotic endpoint are all proved.
verifiers_at_time:
  - [lean-4.28-local, accepts-tier1]
  - [independent-ledger-audit, agrees]
  - [independent-terminal-accounting-audit, agrees]
confidence_at_time: high
strategy_dependence: independent
prompt: erdos-872/prompts/codex-R179-tier1-verification.md
---

# Tier-1 Lean verification: ACCEPTED

The final repaired divisor-antichain proof passes the Tier-1 gate.

The formal endpoint is

\[
\operatorname{Tendsto}
\left(N\mapsto \frac{L(N)}{N}\right)
\operatorname{atTop}
(\mathcal N(0)),
\]

implemented as theorem “Erdos872.main”. Thus Lean verifies \(L(N)=o(N)\)
relative only to the named analytic input recorded below.

## Environment

- Lean: 4.28.0.
- Mathlib release: v4.28.0.
- Project: “erdos-872/lean/r177_verification”.
- Lean modules: 35.
- Lean source lines: 11,893.
- Proof holes: zero.

The project contains exactly three explicit manuscript analytic axioms,
transcribed from the axiom-ready appendix:

1. “Erdos872.A1_rough_number_bound”;
2. “Erdos872.A2_sparse_dense_components”;
3. “Erdos872.A3_exceptional_set_estimate”.

The final theorem uses only A3. A1 and A2 remain declared for direct
correspondence with Lemmas 2.1 and 2.2 but are not in the dependency closure
of the endpoint.

## Exact axiom report

The final “#print axioms” line is:

~~~text
'Erdos872.main' depends on axioms: [propext, Classical.choice, Erdos872.A3_exceptional_set_estimate, Quot.sound]
~~~

Here “propext”, “Classical.choice”, and “Quot.sound” are standard Lean
foundational axioms used throughout Mathlib. The only problem-specific axiom
is the fully quantified exceptional-set estimate from Lemma 2.3.

Accordingly, this is a complete Tier-1 verification: all game-theoretic,
finite-combinatorial, arithmetic-structural, and limiting steps are kernel
checked, while the designated analytic number-theory input is axiomatized.
Discharging A3 from A1 and A2 is the separate Tier-2 task.

## Formalized proof chain

The zero-hole development proves all of the following.

1. The robust envelope is a terminating finite extensive-form game. It has
   explicit adaptive Shortener, Prolonger, and erasure strategies, opening-end
   actions, pass behavior, availability-only erasures, and the normal-form
   quantifier order
   \[
   \inf_{\sigma_S}\sup_{\sigma_P,\sigma_E}.
   \]
2. Backward induction produces saddle policies, proves \(V_b(N)\le N\), and
   proves the exact comparison \(L(N)\le V_1(N)\).
3. The computable \(a_K/t_K\) decomposition, dense-prefix facts, self-rough
   tags, minimal roots, disjoint incomparable cones, and exceptional-set
   coverage are proved.
4. External selections and upset erasures project to valid quotient-game
   erasures. The local trace has at most
   \[
   \max\{b+1,2\}=b+1
   \]
   opening selections.
5. One public, total Shortener strategy is defined on every nonterminal
   history. Its computed branch order is immediate local response when one
   exists, root sweep, active-game advance, then the exceptional outside-cone
   fallback.
6. Every history following that one strategy has a replay certificate. The
   simultaneous local states preserve the projected robust-game traces and
   terminal active cones obey \(V_{b+1}(N/t)\).
7. An online drafting ledger constructs an injective map from all but the
   first post-opening activation to an earlier fired root of at least the same
   weight. This proves the drafting inequality without future-history choice.
8. Every actual selection is classified pointwise by provenance as an active-
   cone selection, a genuine root-sweep firing, or an outside-cone selection.
   The terminal three-class cardinality estimate is derived from that
   classification; it is not assumed.
9. The finite master inequality, tail-supremum passage, parameter limit,
   recursion
   \[
   c_b\le \frac12c_{b+1},
   \]
   bounded iteration, and transfer back to \(L(N)\) are proved.

## Additional manuscript repairs exposed by formalization

Formalization found three specification defects in R177. None changes a
constant, inequality, or asymptotic estimate.

1. The response clauses must mean “the first clause that supplies a legal
   move.” If Prolonger's move makes an active local position terminal, the
   immediate-response clause supplies no move and the global policy falls
   through.
2. A projected local Prolonger pass may be inserted only after the first local
   Shortener selection. Before that selection, the projected Prolonger moves
   form the opening block; ending the opening already schedules Shortener, so
   inserting a pass there is illegal.
3. A fired root is identified by root-sweep provenance, not merely by the
   numerical value selected. If a local strategy selects a vertex equal to its
   root tag inside an active cone, that selection remains in the active-cone
   class.

R179 incorporates these repairs explicitly.

## Independent audits

Two read-only audits were run after exact-source compilation.

- The drafting-ledger audit checked injection direction, temporal precedence,
  weight dominance, opening/post disjointness, firing provenance, and the
  fresh-activation waiting invariant. It found no defect.
- The terminal-accounting audit checked the replay induction for every action,
  equality of the fired set with the firing log, derivation rather than
  assumption of the three-class bound, active/fired disjointness, the exact
  \(V_{b+1}(N/t)\) local bound, and transport from terminal score to play
  length. It found no defect.

## Reproduction

From the repository root:

~~~bash
cd erdos-872/lean/r177_verification
lake build
lake env lean Erdos872R177/AxiomReport.lean

cd ../../../codex-scripts/test-harness/erdos-872-r177-lean-verification
./run.sh
~~~

The final harness output is:

~~~text
verdict=accepted build_status=0 axiom_status=0 main_status=0 proof_hole_count=0
~~~

In addition to the authoritative project build, the newly introduced
load-bearing modules were compiled directly from source with explicit output
paths, preventing stale object files from masking source failures.

## Verdict

**ACCEPTED at Tier 1.**

The theorem is not yet Tier 3 axiom-free because the analytic exceptional-set
estimate A3 is deliberately part of the formal boundary. No new mathematics
is needed for the game proof. The remaining optional work is the independent
formalization of the analytic appendix.

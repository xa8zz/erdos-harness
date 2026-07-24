---
id: V177-lean-tier0-report
type: verification
date: 2026-07-24
intent: >
  Record the Lean 4 tier-0/tier-1 formalization report for the repaired
  manuscript: what compiles, what remains, and the defects the
  formalization surfaced.
predecessors: [R177-repaired-manuscript, V177-fable-diff-audit]
action:
  kind: confirms
  target: R177-repaired-manuscript
claim: >
  A 2,460-line Lean 4 project compiles with zero sorry and exactly the
  three declared analytic axioms matching the manuscript's appendix
  (rough-number bound, K-dense density, exceptional-set estimate),
  machine-verifying the robust-game semantics with adaptive saddle
  policies, L(n) <= V_1(n), the a_K/t_K decomposition, useful tags,
  the nesting lemma for self-rough tags, cone disjointness, external-move
  projection, tail suprema, and the section-5 limit argument. The global
  local-trace/root-sweep proof of the master inequality (4.7) is not yet
  formalized, so the final theorem is absent and the evidence gate reports
  rejected — an incompleteness verdict, not a mathematical refutation.
  The formalization independently re-derived exactly the two scheduling
  defects flagged by the human diff-audit (response-rule precedence;
  projected-pass insertion before the first local Shortener move), both
  repaired in the superseding manuscript with no inequality changes.
  Estimated remaining effort for the full tier-1 target: two to five
  focused agent-days, with the acknowledged risk that formalizing the
  sweep argument could expose a further genuine gap.
verifiers_at_time:
  - [codex-lean-4-28-local-build, agrees-partial]
confidence_at_time: high
strategy_dependence: independent
---

What do i say to them?

"Lean verdict: the full Tier-1 proof is not verified yet. The theorem is not disproved, and no numerical inequality failed, but R177 is incomplete as written.
The final gate reports:

```
verdict=rejected build_status=0 axiom_status=0 main_status=1 proof_hole_count=0
```

Meaning:

* All 2,460 Lean lines compile successfully: 8,048 build jobs.
* Zero `sorry`/`admit`.
* Exactly three declared analytic axioms, matching A1–A3.
* Game semantics, adaptive saddle policies, \(L(n)\le V_1(n)\), \(a_K/t_K\), useful tags, Lemma 3.1, cones, projection, tail suprema, and the §5 limit argument are checked.
* `Erdos872.main` is absent because the global local-trace/root-sweep proof of (4.7) remains unformalized.

Lean exposed two proof-level defects in §4:

1. The response policy is undefined when Prolonger’s active-cone move makes that cone terminal. It must use the first rule that actually supplies a legal move.
2. The projected local pass in §4.3 must only be inserted after the first local Shortener move. Before then, ending the opening already schedules Shortener.

Neither affects the constants or inequalities, but both must be repaired before formalizing the sweep.
Full evidence and exact axiom output: [verify-lean-R177.md](/Users/omisverycool/.codex/worktrees/lean-r177/erdos-harness/erdos-872/verify-lean-R177.md)
Lean project: [Main.lean](/Users/omisverycool/.codex/worktrees/lean-r177/erdos-harness/erdos-872/lean/r177_verification/Erdos872R177/Main.lean)
Evidence gate: [latest.json](/Users/omisverycool/.codex/worktrees/lean-r177/erdos-harness/codex-scripts/test-harness/erdos-872-r177-lean-verification/artifacts/data/latest.json)
Committed on `codex/lean-r177-verification` at `aa6c816`. Cloud Aristotle was not run because `ARISTOTLE_API_KEY` is not cached; local Lean 4.28 verification was unaffected.
Edited 17 files+698-39Review changes
UndoReview
codex-scripts/test-harness/erdos-872-r177-lean-verification/harness.yamlcodex-scripts/test-harness/erdos-872-r177-lean-verification/harness.yaml+14-7
codex-scripts/test-harness/erdos-872-r177-lean-verification/iterations/000-bootstrap.mdcodex-scripts/test-harness/erdos-872-r177-lean-verification/iterations/000-bootstrap.md+10-7
codex-scripts/test-harness/erdos-872-r177-lean-verification/notes.mdcodex-scripts/test-harness/erdos-872-r177-lean-verification/notes.md+26-17
Show 14 more files
12:20 AM
Would you be able to continue and fully verify it yourself? or does it require new math/effort that we dont have yet?
12:51 AM
Yes, I can continue—but there are two meanings of “fully verify.”

* Tier 1, with Lemmas 2.1–2.3 as explicit analytic axioms: likely achievable. No new mathematical idea is currently known to be necessary. The main work is formalizing the load-bearing §4 local-trace and root-sweep argument.
* Completely axiom-free Lean verification: substantially more work. It also requires formalizing the Selberg-sieve and multiplicative-moment proofs. That is likely weeks of formalization, though not necessarily new mathematics.

R177 cannot be verified literally as written because of the two scheduling defects. Repairing those is straightforward and changes no inequalities:

1. Shortener uses the first response clause that supplies a legal move.
2. A projected Prolonger pass is inserted only after the first local Shortener move.

After that, the difficult remaining steps are:

1. Define each active cone’s projected local history and prove it is a legal robust game.
2. Run all local optimal strategies simultaneously without synchronization conflicts.
3. Formalize the sweep pairing proving (4.1).
4. Prove the three-class partition and master inequality (4.7).
5. Connect (4.7), A3, and the already-verified limit machinery to produce `Erdos872.main`.

My honest estimate for Tier 1 is roughly 2–5 focused agent-days, assuming the sweep argument survives exact formalization. The risk is not routine Lean syntax; §4 is the theorem’s central combinatorial step, so formalization could expose another genuine gap. Nothing found so far indicates that new mathematics is definitely needed, but we cannot rule that out until (4.7) compiles.
The current precise boundary is documented in [verify-lean-R177.md](/Users/omisverycool/.codex/worktrees/lean-r177/erdos-harness/erdos-872/verify-lean-R177.md). I can continue autonomously from this point on the existing `codex/lean-r177-verification` branch."

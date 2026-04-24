---
id: R11-q3-separator-infeasible-E3Q
type: research
date: 2026-04-24
intent: >
  Run Phases 2-5 of the de Finetti pipeline at q=3 on the order-6
  Flagmatic K_4^(3) primal to test whether the specific pseudo-
  extremizer lies outside finite-extendibility polytopes E_{3, Q} for
  small Q.
predecessors: [R10-flagmatic-csdp-unlock, R08-pro-1-de-finetti-reduction, R08-pro-2-de-finetti-reduction]
action:
  kind: extends
  target: R10-flagmatic-csdp-unlock
claim: >
  Phase 2-5 pipeline run end-to-end on the order-6 Flagmatic K_4^(3)
  primal (bound 0.56166560, 964 six-vertex type moments). Result: the
  q = 3 rooted-edge column profile of this specific pseudo-extremizer
  is feasible in E_{3, 3} but INFEASIBLE in E_{3, Q} for every
  Q in {4, 5, 6, 7, 8}. For each infeasible Q, an exact rational
  separator certificate a_n was verified to separate the pseudo-
  profile from every hypergeometric vertex of E_{3, Q} with positive
  rational margin. First separator already at Q = 4 (the smallest
  non-trivial case beyond Q = 3). Artifacts:
  extendibility_r6_q3_Q{3..8}.json plus
  rational_certificate_r6_q3_Q{4..8}.{json,tex}.
  
  CAVEAT: the separator certificates show that THIS specific order-6
  Flagmatic pseudo-extremizer fails finite-extendibility at q = 3 for
  Q >= 4. They do NOT yet give a rigorous Turán upper bound on
  pi(K_4^(3)). The remaining step is the augmented-SDP dual lift:
  add the separator inequality as a linear constraint on the Flagmatic
  primal, reoptimize, and check whether the new SDP dual bound drops
  strictly below 0.56166560. If the augmented SDP bound is < c for
  some rational c < 0.56166560, that c is a rigorous new upper bound
  on pi(K_4^(3)) — the first improvement since Razborov 2010.
  
  Infrastructure fix captured in the same PR: the LP containment
  check originally used sparse HiGHS with 1e-9 tolerance and falsely
  reported E_{3, 3} infeasible; corrected to dense matrices with
  1e-7 default tolerance. The Q >= 4 infeasibilities are robust under
  the corrected tolerance and are verified exactly via rational
  certificates independent of the LP solver.
prompt: erdos-500/prompts/codex-run-q3-on-order-6-primal.md
---

Ran the q=3 experiment end to end and opened PR [#3](https://github.com/xa8zz/erdos-harness/pull/3).

Result: the order-6 Flagmatic primal is feasible in `E_{3,3}` but fails finite extendibility for every `Q=4..8`. Exact rational separator certificates verified for all infeasible Q values, with the first already at `Q=4`.

Important caveat: this is an exact separator for the selected order-6 Flagmatic primal profile, not yet a rigorous Turán upper bound. The next step is the dual lift / augmented SDP reoptimization proving the separator over the whole high-density pseudo-feasible face `P_3(c)`.

Key outputs are in [erdos-500/phase0/de_finetti_experiment_report.md](/Users/omisverycool/erdos-harness/erdos-500/phase0/de_finetti_experiment_report.md), plus:
- `flag_sdp_r6.json` now `status: ok`
- `q_profile_r6_q3.csv`
- `extendibility_r6_q3_Q3..Q8.json`
- `rational_certificate_r6_q3_Q4..Q8.{json,tex}`

I also fixed a real LP issue: sparse HiGHS + `1e-9` tolerance falsely marked `E_{3,3}` infeasible. The script now uses dense matrices for this small hierarchy and `1e-7` default tolerance.

::git-create-branch{cwd="/Users/omisverycool/.codex/worktrees/erdos-500-q3-experiment" branch="codex/erdos-500-q3-experiment"}
::git-stage{cwd="/Users/omisverycool/.codex/worktrees/erdos-500-q3-experiment"}
::git-commit{cwd="/Users/omisverycool/.codex/worktrees/erdos-500-q3-experiment"}
::git-push{cwd="/Users/omisverycool/.codex/worktrees/erdos-500-q3-experiment" branch="codex/erdos-500-q3-experiment"}
::git-create-pr{cwd="/Users/omisverycool/.codex/worktrees/erdos-500-q3-experiment" branch="codex/erdos-500-q3-experiment" url="https://github.com/xa8zz/erdos-harness/pull/3" isDraft=false}

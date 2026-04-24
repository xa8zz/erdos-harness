---
id: R10-flagmatic-csdp-unlock
type: diagnostic
date: 2026-04-24
intent: >
  Unlock Phase 1 of the de Finetti pipeline via three paths so that
  the q = 5..7 separator sweep can run on real SDP data.
predecessors: [R09-codex-pipeline-scaffolded]
action:
  kind: extends
  target: R09-codex-pipeline-scaffolded
claim: >
  Partial unlock: flagmatic-1.5.1 + CSDP 6.2.0 installed locally from
  source (macOS Accelerate, OpenMP flags removed) and persisted at
  ~/.codex/bin and ~/.codex/tools for future sessions. Reproduced the
  standard order-6 K_4^(3)-free flag-algebra SDP with approximate
  floating-point bound 0.56166560, matching the published Razborov
  value. The CSDP output file flags.out first row is a genuine 964-
  coordinate primal probability vector over the 964 non-isomorphic
  6-vertex K_4^(3)-free type classes (consistent with R02's |F_6|
  = 964 enumeration). The vector sums to 0.9999999999998522 and the
  reconstructed edge density is 0.5616656023358584.
  
  Path 1 (flagmatic) therefore SUCCEEDED at order 6 but is blocked at
  higher orders for the requested q = 5..7 sweep: those need type
  moments on 8, 9, 10 vertices respectively. A bounded attempt at
  flagmatic --r 3 --n 7 --forbid-k4 was killed after ~2 minutes. The
  Flagmatic guide notes n=7 3-graph computations run 1.5-10 hours
  wall-time, and even n=7 only supports q=4.
  
  Path 2 (existing export) is blocked: Flagmatic certificate URLs at
  lidicky.name/flagmatic and web.archive.org 404; Baber arXiv 1201.3587
  ancillary K4.txt is rational dual / verification data on colored
  order-6 subgraphs, not a primal 7-10 vertex pseudo-moment export;
  Razborov pages surfaced papers but no machine-readable primal export.
  
  Path 3 (from scratch cvxpy + SCS/CLARABEL) is effectively subsumed by
  Path 1's success: cvxpy installed cleanly and reports solvers
  [CLARABEL, HIGHS, OSQP, SCIPY, SCS], but reimplementing a correct
  K_4^(3) flag algebra SDP to export high-order pseudo-moments is not
  a solver problem — it is a combinatorial / enumeration / recursion
  implementation task that exceeds the current budget.
  
  What was NOT done: Phase 2-5 was not run on surrogate data; the
  current phase0/flag_sdp_r{5,6,7}.json artifacts remain status:
  "blocked" with empty pseudo_moments. Codex failed closed rather
  than fabricate.
  
  Important implication not yet exploited: the genuine 964-coordinate
  6-vertex primal CAN support a q = 3 experiment (rooted edge plus 3
  outside vertices = 6 total). If the pseudo-profile at q = 3 falls
  outside E_{3, Q} for some finite Q at density c = 0.5616656, that
  would be a rigorous new upper bound on pi(K_4^(3)). Smaller than
  the originally requested q = 5..7 sweep but still decisive as a
  first real-data test.
  
  Infrastructure reusable: flagmatic-1.5.1 + CSDP binaries persisted
  per-user; AGENTS.md updated with durable Flagmatic/CSDP notes.
prompt: erdos-500/prompts/codex-unlock-phase-1-three-paths.md
---

Tried all three unlock paths and stopped cleanly: Phase 1 is still blocked for `q=5..7`.

What did work: I built and persisted `flagmatic-1.5.1` plus `csdp` locally, and reproduced the standard K4 order-6 Flagmatic run with bound `0.56166560`. The CSDP output’s first row is a genuine 964-coordinate primal vector over 6-vertex K4-free types.

Why it still blocks: the requested sweep needs type moments on 8, 9, and 10 vertices. The public artifacts I found are order-6 only or dual/verification data, not a primal 7-10 vertex pseudo-moment export. I did not run Phases 2-5 on surrogate data.

Updated:
- [unlock_log.md](/Users/omisverycool/erdos-harness/erdos-500/phase0/unlock_log.md)
- [de_finetti_experiment_report.md](/Users/omisverycool/erdos-harness/erdos-500/phase0/de_finetti_experiment_report.md)
- blocked `flag_sdp_r{5,6,7}.json` artifacts with clearer blocker state
- `AGENTS.md` with durable Flagmatic/CSDP notes

PR opened: [#2](https://github.com/xa8zz/erdos-harness/pull/2)

Sources checked included the [Flagmatic page](https://lidicky.name/flagmatic/), [Baber arXiv:1201.3587 source](https://arxiv.org/abs/1201.3587), and [COIN-OR CSDP](https://github.com/coin-or/Csdp).

::git-create-branch{cwd="/Users/omisverycool/.codex/worktrees/erdos-500-de-finetti-phase1-unlock" branch="codex/erdos-500-de-finetti-phase1-unlock"}
::git-stage{cwd="/Users/omisverycool/.codex/worktrees/erdos-500-de-finetti-phase1-unlock"}
::git-commit{cwd="/Users/omisverycool/.codex/worktrees/erdos-500-de-finetti-phase1-unlock"}
::git-push{cwd="/Users/omisverycool/.codex/worktrees/erdos-500-de-finetti-phase1-unlock" branch="codex/erdos-500-de-finetti-phase1-unlock"}
::git-create-pr{cwd="/Users/omisverycool/.codex/worktrees/erdos-500-de-finetti-phase1-unlock" branch="codex/erdos-500-de-finetti-phase1-unlock" url="https://github.com/xa8zz/erdos-harness/pull/2" isDraft=false}

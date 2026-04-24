---
id: R09-codex-pipeline-scaffolded
type: diagnostic
date: 2026-04-24
intent: >
  Implement and verify the de Finetti / finite-extendibility LP
  experiment pipeline in-repo, then run it against a K_4^(3)-free
  flag-algebra SDP pseudo-extremizer at the plateau.
predecessors: [R08-pro-1-de-finetti-reduction, R08-pro-2-de-finetti-reduction]
action:
  kind: extends
  target: R08-pro-1-de-finetti-reduction
claim: >
  Computational pipeline for the de Finetti / finite-extendibility
  separator test implemented and verified on synthetic inputs, but the
  real experiment is blocked by missing Phase-1 inputs. Scripts landed:
  scripts/k43_flag_sdp.py, scripts/extract_q_column_profile.py,
  scripts/test_extendibility.py, scripts/rationalize_separator.py, and
  a shared scripts/de_finetti_utils.py. Verification passed on
  (a) synthetic feasible E_{2,3} profile accepted with expected
  exchangeable-witness z, (b) synthetic non-extendible q=2 profile
  separated and rationalized with exact margin 1/6, (c) py_compile on
  all scripts, (d) JSON artifact parse checks. The E_{q,Q}
  hypergeometric vertex construction, LP membership check, and
  rational-separator verification machinery are therefore working.
  Phase 1 (flag-algebra SDP pseudo-extremizer) could not run: local
  environment has no flagmatic, CSDP, SDPA, or cvxpy, and the repo
  does not contain a genuine Razborov plateau pseudo-moment export.
  Codex failed closed rather than fabricate a surrogate — correct
  discipline. Placeholder phase0/flag_sdp_r{5,6,7}.json artifacts
  record the block with null pseudo_moments and a blocked status.
  Branch codex/erdos-500-de-finetti-experiment and PR #1 at
  https://github.com/xa8zz/erdos-harness/pull/1 .
  Unlock path: install flagmatic (Python) or cvxpy+CSDP, or procure
  a machine-readable plateau pseudo-moment export with type moments
  through at least q+3 vertices (for q in the 4-7 range). No
  mathematical conclusion about pi(K_4^(3)) at this round; infrastructure
  is ready for the actual test once Phase 1 input is available.
prompt: erdos-500/prompts/codex-de-finetti-extendibility-experiment.md
---

Implemented and pushed the experiment pipeline on `codex/erdos-500-de-finetti-experiment`, with PR open here: [#1](https://github.com/xa8zz/erdos-harness/pull/1).

Important outcome: no separator was actually tested, because the local environment has no `flagmatic`/`CSDP`/`SDPA`/`cvxpy` and the repo does not contain a genuine Razborov plateau pseudo-moment export. I made Phase 1 fail closed rather than fabricate a surrogate. The exact `E_{q,Q}` LP and rational certificate machinery is implemented and sanity-checked.

Added:
- [scripts/k43_flag_sdp.py](/Users/omisverycool/erdos-harness/scripts/k43_flag_sdp.py)
- [scripts/extract_q_column_profile.py](/Users/omisverycool/erdos-harness/scripts/extract_q_column_profile.py)
- [scripts/test_extendibility.py](/Users/omisverycool/erdos-harness/scripts/test_extendibility.py)
- [scripts/rationalize_separator.py](/Users/omisverycool/erdos-harness/scripts/rationalize_separator.py)
- [erdos-500/phase0/de_finetti_experiment_report.md](/Users/omisverycool/erdos-harness/erdos-500/phase0/de_finetti_experiment_report.md)

Verification passed: `py_compile`, JSON parse checks, synthetic feasible LP witness, and synthetic non-extendible separator rationalized with exact margin `1/6`.

Next unlock: we need either `flagmatic` installed/configured or a real machine-readable plateau pseudo-moment export with type moments through at least `q+3` vertices.

::git-create-branch{cwd="/Users/omisverycool/.codex/worktrees/erdos-500-de-finetti-experiment" branch="codex/erdos-500-de-finetti-experiment"}
::git-stage{cwd="/Users/omisverycool/.codex/worktrees/erdos-500-de-finetti-experiment"}
::git-commit{cwd="/Users/omisverycool/.codex/worktrees/erdos-500-de-finetti-experiment"}
::git-push{cwd="/Users/omisverycool/.codex/worktrees/erdos-500-de-finetti-experiment" branch="codex/erdos-500-de-finetti-experiment"}
::git-create-pr{cwd="/Users/omisverycool/.codex/worktrees/erdos-500-de-finetti-experiment" branch="codex/erdos-500-de-finetti-experiment" url="https://github.com/xa8zz/erdos-harness/pull/1" isDraft=false}

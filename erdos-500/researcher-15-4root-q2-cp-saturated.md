---
id: R15-4root-q2-cp-saturated
type: verification
date: 2026-04-26
intent: >
  Empirically test R14-pro-1's prediction that the bounded-order
  plateau pseudo-moment may fail to be in CP(A_F) at 4-vertex roots.
predecessors: [R14-pro-1-cp-cuts-4-root, R12-augmented-sdp-no-improvement]
action:
  kind: extends
  target: R14-pro-1-cp-cuts-4-root
claim: >
  Sound label-averaged 4-root q=2 complete-positivity test on the
  order-6 Flagmatic K_4^(3) primal: no rational separator exists at
  the tested parameters. For both rooted 4-types F = B_2 (2-edge
  book, |A_F|=50) and F = B_3 (K_4^(3) minus one edge, |A_F|=45),
  the pair-column matrix M_F lies in E_{2, Q}(A_F) at Q=4 and Q=5
  (LP feasible with rational margin). Q=6 is direct-LP-scale
  blocked (~16-29M occupancy vertices). With no rational separator,
  the augmented-SDP lift was replaced by a no-op CSDP sanity check
  which reproduced 0.56166560.
  
  Implication: at order 6 the plateau pseudo-moment is in CP(A_F)
  for the tested parameters (or at least in E_{2, Q}(A_F) which
  contains CP(A_F) by the nested-polytope identity). R14-pro-1's
  predicted obstruction (plateau is doubly-nonneg-but-not-CP at
  4-vertex roots) does not manifest at order 6, q=2, Q in {4, 5}
  for B_2 or B_3. The proposal's underlying mathematics
  (CP(A_F) strictly contained in DNN(A_F) for dim 45/50; every
  actual pair-column matrix is in CP(A_F)) remains valid.
  
  Combined with R12 (q=3 single-class de Finetti at r=6 saturated
  under sound projection), this is the second structural saturation
  observed at order 6 for bounded-radius local-statistics
  approaches. Pattern is consistent with R08-pro-1's prediction
  that any successful separator must use compatibility between the
  column law and other flag coordinates, not just bounded-order
  de Finetti / CP constraints on a single root class.
  
  Infrastructure improvement: AGENTS.md updated with the exact-NNZ
  scaling note for the LP. Scripts added:
  build_4root_alphabet.py, extract_4root_pair_column.py,
  test_cp_extendibility.py, rationalize_cp_separator.py.
prompt: erdos-500/prompts/codex-4root-q2-cp-cuts.md
---

Implemented, pushed, and opened the PR: [xa8zz/erdos-harness#4](https://github.com/xa8zz/erdos-harness/pull/4).

Result: no new upper bound. The sound label-averaged 4-root q=2 CP tests are feasible for `B2/B3` at `Q=4,5`; `Q=6` is recorded as direct-LP scale blocked. No rational separator existed to lift, so I ran the no-op CSDP sanity check instead and it reproduced `0.56166560`.

Notable files:
- `scripts/build_4root_[alphabet.py](http://alphabet.py)`
- `scripts/extract_4root_pair_[column.py](http://column.py)`
- `scripts/test_cp_[extendibility.py](http://extendibility.py)`
- `scripts/rationalize_cp_[separator.py](http://separator.py)`
- `erdos-500/phase0/M_F_B2_B3_r6.json`
- `erdos-500/phase0/de_finetti_experiment_[report.md](http://report.md)`

Verification passed: all script self-tests, `py_compile`, `compile_[rounds.py](http://rounds.py)`, real LP runs, and no-op CSDP. I also ran `session-self-update` and added the exact-nnz scaling note to `[AGENTS.md](http://AGENTS.md)`.

Small wrinkle: this repo has no `internal` branch, so the PR targets `main`.

::git-create-branch{cwd="/Users/omisverycool/.codex/worktrees/6ea8/erdos-harness" branch="codex/erdos-500-4root-q2-cp-cuts"}
::git-stage{cwd="/Users/omisverycool/.codex/worktrees/6ea8/erdos-harness"}
::git-commit{cwd="/Users/omisverycool/.codex/worktrees/6ea8/erdos-harness"}
::git-push{cwd="/Users/omisverycool/.codex/worktrees/6ea8/erdos-harness" branch="codex/erdos-500-4root-q2-cp-cuts"}
::git-create-pr{cwd="/Users/omisverycool/.codex/worktrees/6ea8/erdos-harness" branch="codex/erdos-500-4root-q2-cp-cuts" url="https://github.com/xa8zz/erdos-harness/pull/4" isDraft=false}

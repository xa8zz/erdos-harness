---
id: R12-augmented-sdp-no-improvement
type: verification
date: 2026-04-24
intent: >
  Convert the R11 q=3, Q=4 rational separator into a rigorous Turán
  upper bound via augmented-SDP dual lift (add separator as linear
  constraint on Flagmatic type densities, reoptimize CSDP).
predecessors: [R11-q3-separator-infeasible-E3Q]
action:
  kind: supersedes
  target: R11-q3-separator-infeasible-E3Q
claim: >
  Augmented SDP dual lift at Q=4 does not produce a new upper bound on
  pi(K_4^(3)) at order 6. The sound label-averaged augmented SDP
  returns the original plateau bound 0.56166560 unchanged. The R11
  separator does not cut the actual unlabeled order-6 Flagmatic
  pseudo-moment vector when projected correctly.
  
  Labeling subtlety uncovered. Projecting unlabeled Flagmatic type
  densities to the rooted-labeled q-column profile is only SOUND if
  one averages over all vertex labelings of each type (equivalently,
  all choices of rooted edge consistent with the type's automorphism
  group). The initial R11 pipeline used a canonical representative
  labeling per type (the unsound representative-label lift). Under
  the sound projection, the Q=4 separator's constraint is strictly
  satisfied by the pseudo-moment vector, so adding it to the
  augmented SDP leaves the optimum at 0.56166560.
  
  Diagnostic that the representative-label path is genuinely unsound:
  the representative-label augmented SDP returns an apparent bound
  0.54905272, which is BELOW the known 5/9 lower bound and therefore
  cannot correspond to any rigorous Turán argument.
  
  What's established: the augmented-SDP dual lift pipeline is
  implemented and numerically sound with the corrected projection.
  The Q=4 separator certificate, while exact, does NOT produce a
  new Turán bound at order 6 because the pseudo-moment vector
  survives that single-separator constraint. Higher Q separators
  from R11 (Q=5..8) are also for the representative-label profile
  and need to be re-checked under sound projection.
  
  Infrastructure durable: AGENTS.md updated with "average over all
  vertex labelings" rule so future agents do not repeat the error.
  
  What's implied: at order 6 with q=3, any single-Q de Finetti
  separator alone is unlikely to cut the correct pseudo-moment
  vector, because the sound label-averaging spreads profile mass
  across many columns and tends to stay inside E_{3, Q} for
  small Q. Next candidates:
    (a) joint-Q separators combining Q=4..8 into one constraint,
        checked against sound projection;
    (b) higher order flagmatic (order 7 for q=4), requiring 1.5-10
        hour wall-time per run;
    (c) treating the saturation as a diagnostic per R08 Pro #1:
        "any successful separator would have to use extra
        compatibility between the column law and other flag
        coordinates, not just higher-q de Finetti moment
        constraints."
prompt: erdos-500/prompts/codex-augmented-sdp-dual-lift.md
failure_mechanism: >
  The R11 separator certificates were computed against the
  representative-label projection of Flagmatic unlabeled type
  densities to the q=3 column profile. The sound projection requires
  averaging over all vertex labelings of each type. Under the sound
  label-averaged projection, the pseudo-moment vector is feasible in
  E_{3, 4} and the Q=4 separator does not exclude it. The
  representative-label augmented SDP returns an apparent bound
  0.54905272 below the known 5/9 lower bound, confirming the
  representative-label path is mathematically unsound and cannot
  yield a valid Turán bound.
---

Implemented and pushed `codex/erdos-500-augmented-sdp-q4-separator`.

Outcome: no new Turán bound. The sound label-averaged Q=4 augmented SDP returns the original printed bound `0.56166560`; the separator does not cut the actual unlabeled order-6 Flagmatic pseudo-moment vector.

Important finding: the representative-label lift gives an apparent `0.54905272` bound, but that is unsound and even below the known `5/9` construction. The issue is that unlabeled Flagmatic type densities must be projected to rooted labeled column profiles by averaging over all vertex labelings.

Artifacts added:
- `scripts/augment_flag_sdp.py`
- `erdos-500/phase0/augmented_sdp_r6_Q4_result.json`
- `erdos-500/phase0/projection_labeling_audit_r6_Q4.json`
- augmented SDPA/CSDP output/log files
- updated `erdos-500/phase0/de_finetti_experiment_report.md`

Verified with:
- `python3 -m py_compile ...`
- JSON parse checks
- CSDP run on the sound augmented SDPA input

I pushed the branch, but PR creation is blocked right now: `gh pr create` repeatedly hit GitHub API TLS handshake timeouts, and the GitHub connector returned 403. Branch URL for manual PR creation:
`https://github.com/xa8zz/erdos-harness/pull/new/codex/erdos-500-augmented-sdp-q4-separator`

::git-create-branch{cwd="/Users/omisverycool/.codex/worktrees/erdos-500-augmented-sdp-q4-separator" branch="codex/erdos-500-augmented-sdp-q4-separator"}
::git-stage{cwd="/Users/omisverycool/.codex/worktrees/erdos-500-augmented-sdp-q4-separator"}
::git-commit{cwd="/Users/omisverycool/.codex/worktrees/erdos-500-augmented-sdp-q4-separator"}
::git-push{cwd="/Users/omisverycool/.codex/worktrees/erdos-500-augmented-sdp-q4-separator" branch="codex/erdos-500-augmented-sdp-q4-separator"}

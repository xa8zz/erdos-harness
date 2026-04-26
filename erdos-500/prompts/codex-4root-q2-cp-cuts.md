# Codex task: 4-root q=2 complete-positivity cuts on order-6 Flagmatic primal

## Goal

Use the existing order-6 Flagmatic + CSDP K_4^(3) primal (964-
coordinate, bound 0.56166560) to test whether the pair-column matrix
M_F at a 4-vertex root F lies in the completely-positive cone CP(A_F)
for the alphabet A_F of K_4^(3)-free outside-vertex columns. Test for
F = B_2 (2-edge book) and F = B_3 (K_4^(3) minus one edge), at
Q = 4, 5 (and Q = 6 if LP scale permits). If a rational separator is
found and the augmented-SDP dual lift gives a bound c_new < 0.56166560
with verifiable rational envelope, the result is the first rigorous
upper-bound improvement on pi(K_4^(3)) since Razborov 2010.

## Context

Reduction logic and structural object:

- `erdos-500/researcher-14-pro-1-cp-cuts-4-root.md` — the proposal
  with full mathematical setup. The two rooted 4-types and their
  alphabet sizes:
  - F = B_2: 2-edge book on {1,2,3,4} with rooted edges {1,2,3},
    {1,2,4}. |A_F| = 50.
  - F = B_3: K_4^(3) minus one edge on {1,2,3,4} with rooted edges
    {1,2,3}, {1,2,4}, {1,3,4}, missing {2,3,4}. |A_F| = 45.
- `erdos-500/researcher-08-pro-1-de-finetti-reduction.md` — the
  underlying de Finetti / finite-extendibility reduction, now applied
  with q = 2 outside vertices instead of q = 3.
- `erdos-500/researcher-12-augmented-sdp-no-improvement.md` — the
  R12 lesson on label-averaging projection; same discipline applies
  to extracting M_F from unlabeled type densities.

Validated primal data:

- `erdos-500/phase0/flag_sdp_r6.json` — 964 six-vertex K_4^(3)-free
  type records with edge lists and rational pseudo-moment values.
- `~/.codex/bin/flagmatic` and `~/.codex/bin/csdp` — persisted from
  R10 unlock.

Pipeline scripts already in place:

- `scripts/k43_flag_sdp.py`
- `scripts/extract_q_column_profile.py` — has the label-averaging
  pattern for the edge-rooted q-column projection. Use as a template
  for the 4-root extraction.
- `scripts/test_extendibility.py` — LP feasibility + rational
  separator extraction. Generalizes to arbitrary alphabet.
- `scripts/rationalize_separator.py` — verifies a rational separator
  with positive exact margin against every hypergeometric vertex.
- `scripts/augment_flag_sdp.py` — adds a linear constraint on
  type densities to the SDPA-format CSDP input and reruns CSDP. The
  R12 sound-projection version is the one to use.
- `scripts/de_finetti_utils.py` — common utilities.

## Why this is likely to escape the bounded-order plateau

For an actual K_4^(3)-free limit, the pair-column matrix M_F lies
in the completely-positive cone CP(A_F): there is a measure mu on
Delta(A_F) with M_F = E_mu[mu mu^T]. Equivalently, every copositive
matrix C over A_F gives a valid linear inequality
sum C_{alpha, beta} M_F(alpha, beta) >= 0. Bounded-order flag-square
SDP enforces only M_F psd plus entrywise nonneg (the doubly-nonneg
cone DNN). For dimensions 45 and 50, CP(A_F) is strictly contained
in DNN(A_F), so the plateau pseudo-moment may be doubly-nonneg but
not completely positive — exactly the obstruction bounded-order SDP
misses by construction. Same flag order (6 vertices = 4 root + 2
outside) as the existing pipeline; alphabet jumps from 7 to 45 or 50.

## Inputs

- File: `erdos-500/phase0/flag_sdp_r6.json` — order-6 Flagmatic primal
  in the standard contract.
- File: `erdos-500/researcher-14-pro-1-cp-cuts-4-root.md` — the full
  proposal.
- Tooling: `~/.codex/bin/{flagmatic,csdp}`, `scripts/*.py`.

Parameters to sweep:

- F in {B_2, B_3}.
- Q in {4, 5}; attempt Q = 6 if LP variable count is tractable
  (|A_F|=50, Q=6 has C(55, 49) = C(55, 6) ~ 29M occupancy vertices,
  likely too large for direct LP; |A_F|=45, Q=5 has ~1.9M, near LP
  edge).

Constraints:

- All polytope-side arithmetic must be exact rational.
- LP feasibility may be float; rational certification of infeasibility
  must be exact. Use the dense-LP / 1e-7 tolerance pattern Codex
  established in R11.
- Apply the R12 label-averaging discipline: when projecting an
  unlabeled 6-vertex type density to M_F(alpha, beta), AVERAGE over
  all labelings consistent with type automorphism, all 4-vertex
  subset choices, all isomorphism classes within Aut(F), and the
  symmetry between the 2 outside vertices. Failing this gives an
  unsound projection (R12 representative-label lift gave an apparent
  bound below 5/9, mathematically impossible).

## Phases

### Phase A -- alphabet construction

- Script: `scripts/build_4root_alphabet.py`. Enumerate
  A_F = {alpha in {0,1}^6 : alpha_{ij} alpha_{ik} alpha_{jk} = 0 for
  every rooted edge ijk in E(F)} for F in {B_2, B_3}. Verify
  |A_{B_2}| = 50 and |A_{B_3}| = 45.
- Output: `erdos-500/phase0/alphabet_F_B2.json`,
  `erdos-500/phase0/alphabet_F_B3.json`. Each lists the alphabet
  elements in a canonical order (e.g., lex-ordered 6-bit tuples that
  pass the alphabet test) and prints a sanity check.

### Phase B -- pair-column matrix M_F from order-6 primal

- Script: `scripts/extract_4root_pair_column.py`. For each F in
  {B_2, B_3}:
  - For every 6-vertex K_4^(3)-free type T (964 of them) with primal
    moment p(T) and edge list:
    - Enumerate every labeled embedding of F as a 4-vertex subset
      S of T's 6 vertices, modulo Aut(F). For each embedding:
      - Identify the 2 outside vertices {x, y} = {1..6} \ S.
      - Compute alpha = col_F(x) and beta = col_F(y) using the F-edge
        labeling.
      - Add p(T) / num_labelings(T) * weight(F-embedding) to
        M_F(alpha, beta) and to M_F(beta, alpha) (or symmetrize at
        end).
  - Normalize by p(F) = sum_{alpha, beta} M_F(alpha, beta) to get
    the conditional matrix.
  - Sanity check: M_F is symmetric, nonnegative, sums to 1; row
    sums match the column-distribution profile.
- Output: `erdos-500/phase0/M_F_{B2,B3}_r6.json` with both the
  unnormalized (homogenized) version and the normalized version.

### Phase C -- E_{2, Q}(A_F) extendibility LP

- Script: `scripts/test_cp_extendibility.py`. For each (F, Q):
  - Variables: z_N >= 0 for each occupancy vector N in N^{A_F} with
    sum_alpha N_alpha = Q.
  - Constraints: M_F(alpha, beta) = sum_N z_N * (Q (Q-1))^{-1} *
    N_alpha * (N_beta - 1[alpha = beta]).
  - Normalization: sum_N z_N = 1.
  - Objective: feasibility (or l_1-slack minimization).
  - LP variable count is C(Q + |A_F| - 1, |A_F| - 1):
    F=B_2: Q=4 -> 292825, Q=5 -> 3162510, Q=6 -> ~29M.
    F=B_3: Q=4 -> 194580, Q=5 -> 1906884, Q=6 -> ~16M.
  - Use HiGHS or SCIPY linprog with dense matrices; for the larger
    cases (Q=5), consider sparse + 1e-7 tolerance. Q=6 likely needs
    column generation if attempted.
  - If feasible: record the witness z_N (sparse).
  - If infeasible: extract dual separating matrix C_{alpha, beta}
    and float margin epsilon.
- Output:
  `erdos-500/phase0/cp_extendibility_F{B2,B3}_Q{4,5,6}.json` per
  (F, Q) pair.

### Phase D -- rational separator certification

- Script: `scripts/rationalize_cp_separator.py`. For each (F, Q)
  with infeasibility:
  - Round float C to small rationals.
  - Verify: for every occupancy vertex N (sum_alpha N_alpha = Q),
    the inner product (Q(Q-1))^{-1} sum_{alpha, beta} C_{alpha,
    beta} N_alpha (N_beta - 1[alpha=beta]) >= 0 EXACTLY in rationals.
  - Verify: sum_{alpha, beta} C_{alpha, beta} M_F^*(alpha, beta) <
    -epsilon' for an exact rational epsilon' > 0.
- Output:
  `erdos-500/phase0/cp_certificate_F{B2,B3}_Q{4,5,6}.{json,tex}`.

### Phase E -- augmented SDP dual lift

- Use `scripts/augment_flag_sdp.py`. For the smallest (F, Q) where
  Phase D verified a rational certificate, compose the linear
  inequality on the 964 type densities:
  separator_coefficient(type_T) =
  sum_{alpha, beta} C_{alpha, beta} M_F_kernel(T, alpha, beta)
  where M_F_kernel is the linear map from type_T density to
  M_F(alpha, beta) computed in Phase B.
- Add this constraint as an additional linear constraint row in
  the SDPA-format CSDP input that produced the order-6 0.56166560
  bound, then re-run CSDP.
- Record c_new_float and verify a rational upper envelope
  c_new_rational < 0.56166560 with safety margin against solver
  tolerance. If verified, this is a new rigorous upper bound:
  pi(K_4^(3)) <= c_new_rational.
- Output: `erdos-500/phase0/augmented_sdp_4root_F{B2,B3}_Q{Q}.json`
  with structure mirroring R12's augmented_sdp_r6_Q4_result.json.

### Phase F -- summary report

- Append to `erdos-500/phase0/de_finetti_experiment_report.md`:
  - Headline: "NEW RIGOROUS UPPER BOUND pi(K_4^(3)) <= c_new_rational"
    (if achieved) OR "4-root q=2 CP cuts at order 6 are
    feasible / not strictly tightening" (if no improvement).
  - Per (F, Q) outcome table.
  - If new bound: rational envelope verification, separator
    coefficients, next-step recommendation (researcher round for
    audit + Aristotle/Lean formalization plan).
  - If no improvement: where exactly the projected pseudo-moment
    sits in DNN \ CP for the LP feasibility tested.

## Deliverables

- `scripts/build_4root_alphabet.py`
- `scripts/extract_4root_pair_column.py`
- `scripts/test_cp_extendibility.py`
- `scripts/rationalize_cp_separator.py`
- All `erdos-500/phase0/...` artifacts above.
- Updated `erdos-500/phase0/de_finetti_experiment_report.md`.

## Verification

Each script must include a synthetic test:

- Phase A: alphabet sizes match 50 and 45 exactly.
- Phase B: M_F is symmetric, nonneg, sums to 1; small-case sanity
  against a hand-computed example.
- Phase C: LP test on a synthetic profile known to be in / out of
  E_{2, Q}.
- Phase D: rational certificate verifies on every hypergeometric
  vertex of the test polytope with exact margin.
- Phase E: re-run CSDP on a no-op constraint as a sanity check
  (should reproduce 0.56166560 to solver tolerance).

## Time estimate

- Phase A: minutes.
- Phase B: 30-60 minutes (the 4-root embedding combinatorics on 964
  types with proper label-averaging is fiddly).
- Phase C at Q=4: minutes per (F, Q). At Q=5 with sparse LP: ~30 min.
- Phase D: minutes if Phase C found infeasibility.
- Phase E: minutes per CSDP rerun.
- Phase F: minutes.

Total: 2-4 hours wall-time.

## Branch and PR

- Branch: `codex/erdos-500-4root-q2-cp-cuts`.
- Push and open a PR. Do NOT auto-merge.
- PR title suggestion: "4-root q=2 complete-positivity cuts on order-6
  K_4^(3) primal".

## What NOT to do

- Do not modify any round docs in `erdos-500/researcher-*.md`,
  `erdos-500/verify-*.md`, `erdos-500/_forum_transcript.md`, or
  `erdos-500/current-research.md`.
- Do not use a representative labeling for the F-embedding without
  averaging — repeat the R12 mistake and you get an unsound
  projection (R12 gave 0.54905272 below 5/9 with that bug).
- Do not produce a rational upper bound without an explicit
  computation showing it lies above the float bound plus solver
  tolerance plus a safety buffer.
- Do not fabricate numerical output if the LP / CSDP fails. Fail
  closed and report.
- Do not auto-merge the PR.
- Do not touch `erdos-872/` or other problem directories.

## Interpretation of outcomes

- **Infeasible at some (F, Q) with rational certificate AND augmented
  SDP gives c_new < 0.56166560**: NEW RIGOROUS UPPER BOUND on
  pi(K_4^(3)). Publication-grade. First improvement since 2010.
  Hand off to a researcher round for stability/audit.

- **Infeasible at some (F, Q) but augmented SDP gives c_new
  >= 0.56166560**: the CP separator excludes the specific Flagmatic
  pseudo-extremizer but does not strictly tighten the SDP at order
  6. Diagnostic: order-6 SDP can find a different pseudo-extremizer
  satisfying the CP constraint. Recommend higher-order Flagmatic or
  joint multi-Q CP constraints.

- **Feasible at all tested (F, Q)**: the order-6 plateau pseudo-moment
  is in CP(A_F) at q=2 for the tested Q. Diagnostic that 4-root
  q=2 CP cuts at order 6 are saturated; consider widening to 5-root
  or scaling to higher r.

- **Mixed**: investigate honestly; LP numerical issues can cause
  false infeasibility. Rational certification is the arbiter.

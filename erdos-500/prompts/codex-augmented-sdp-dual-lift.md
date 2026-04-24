# Codex task: augmented SDP dual lift — turn the Q=4 separator into a rigorous pi(K_4^(3)) bound

## Goal

The exact rational separator produced in R11 excludes the specific order-6
Flagmatic pseudo-extremizer from E_{3, Q >= 4}. To convert this into a
rigorous upper bound on pi(K_4^(3)), reoptimize the Flagmatic K_4^(3)
SDP with the separator added as an additional linear constraint on the
six-vertex type densities. If the augmented SDP's dual bound c_new is
strictly less than 0.56166560 with a safety margin, c_new (rounded up
to a rational) is a new rigorous upper bound on pi(K_4^(3)) — the first
improvement since Razborov 2010.

## Context

- R11 result:
  `erdos-500/researcher-11-q3-separator-infeasible-E3Q.md`
  - Order-6 Flagmatic K_4^(3) primal: bound 0.56166560, 964 type moments.
  - q=3 column profile infeasible in E_{3, Q} for every Q in {4..8}.
  - Exact rational separator a_Q for Q=4 (smallest / cleanest) at
    `erdos-500/phase0/rational_certificate_r6_q3_Q4.json`.
- Pipeline scripts already in place at `scripts/`.
- Tooling persisted from R10:
  `~/.codex/bin/flagmatic`, `~/.codex/bin/csdp`,
  sources under `~/.codex/tools/{flagmatic-1.5.1,csdp}`.

### The lift in one paragraph

Let `d(m) = 0.56166560` be the Flagmatic primal edge-density at the
plateau, and let `proj3 : (type densities) -> (q=3 occupancy profile)`
be the linear map from 6-vertex K_4^(3)-free type densities to the
84-dim q=3 column-occupancy profile (implemented in
`scripts/extract_q_column_profile.py`). The Q=4 separator is a
rational vector `a` over the 84-dim profile space with rational
margin `epsilon_4 > 0` such that
  a . proj3(m_actual) <= 0 for every actual K_4^(3)-free 3-graph
    pseudo-profile of edge density >= 5/9,
  a . proj3(m_plateau) >= epsilon_4 (positive by exactly this
    margin on the Flagmatic primal).
Adding `a . proj3(m) <= 0` as a linear constraint to the Flagmatic
SDP feasible set yields an augmented SDP whose optimum is strictly
below the original 0.56166560. Call that optimum `c_new`. Then
  pi(K_4^(3)) <= c_new + solver_tolerance
and if c_new_rational is a rational upper envelope of the SDP dual
certificate, `pi(K_4^(3)) <= c_new_rational` is rigorous.

## Approach A (preferred) -- modify CSDP SDPA-format input to add one linear constraint

CSDP reads problems in SDPA sparse format. Each linear constraint is
a row in the `A_i` matrices. The augmented problem adds one new
constraint row with the separator coefficients.

### Steps

1. Locate the SDPA-format CSDP input used by the order-6 Flagmatic
   run (check `~/.codex/tools/flagmatic-1.5.1/` and any run dirs).
   Or, re-run flagmatic at order 6 with the flag to keep the CSDP
   input file.
2. Parse the separator certificate
   `erdos-500/phase0/rational_certificate_r6_q3_Q4.json` to get the
   84-dim coefficient vector `a_n` and margin `epsilon_4`.
3. Compose the linear constraint on the 964 six-vertex type densities
   by composing `a` with the known `proj3` linear map:
     constraint_coefficient(type_T) = sum_n a_n * proj3_entry(n, T)
   producing a 964-dim coefficient vector `b_T`.
4. Inject `sum_T b_T * m_T <= 0` (or `>= 0` depending on sign
   convention in your separator) as an additional linear constraint
   row in the SDPA input.
5. Re-run CSDP on the augmented input.
6. Record the new dual bound `c_new`.

### Script deliverables

- `scripts/augment_flag_sdp.py`: given the original SDPA input, the
  Q=4 separator JSON, and output path, emit the augmented SDPA input.
- Invoke CSDP on the augmented input and capture stdout / log.
- `erdos-500/phase0/augmented_sdp_r6_Q4.log`: full CSDP log.
- `erdos-500/phase0/augmented_sdp_r6_Q4_result.json`:
  `{"c_new_float": ..., "c_new_rational_upper_envelope": "p/q",
    "strict_improvement_over_0.56166560": bool,
    "gap": ..., "csdp_status": ...}`.

### Rational envelope

CSDP gives a float bound. To certify rigorously, verify that the
float bound plus solver tolerance plus a small safety buffer can be
rounded UP to a rational `c_new_rational`. Document the computation:
  c_new_rational = ceil((c_new_float + solver_tolerance + safety)
                          * 10^k) / 10^k
for a suitable k such that c_new_rational < 0.56166560 (or the
Razborov-Baber published 0.5611666 if available at higher precision).

## Approach B (fallback) -- rebuild the augmented SDP in cvxpy + CSDP

If Approach A's SDPA-format manipulation is blocked (e.g., input
files not retrievable, sparse-format parser too fiddly), rebuild the
K_4^(3) flag-algebra SDP in cvxpy using the 964-type enumeration
and the flag-square structure from the order-6 Flagmatic run.

### Steps

1. Load the 964 type records from
   `erdos-500/phase0/flag_sdp_r6.json`.
2. Reconstruct the flag-square PSD constraints by enumerating each
   root type sigma on 1-3 vertices, rooted flags on 3-5 vertices,
   and computing the flag-product structure constants.
3. Set up the cvxpy optimization: variables `m_T` and Q_sigma
   matrices, objective = edge density, original flag-SDP constraints,
   plus the augmented separator constraint.
4. Solve with `cvxpy.CSDP` or `cvxpy.SCS`.
5. Extract the new bound.

### Script deliverables

- `scripts/augmented_flag_sdp_cvxpy.py`: self-contained rebuild.
- Same output artifacts as Approach A.

### Time budget

- Approach B is 4-8 hours because re-implementing the flag-square
  structure is substantial. Prefer Approach A if at all feasible.

## Approach C (cheap lower-informativeness fallback) -- LP on type simplex only

If both Approach A and B are blocked, solve a strictly weaker LP
that IGNORES the flag-square PSD constraints and just imposes:
  m_T >= 0,
  sum_T m_T = 1,
  the separator constraint a . proj3(m) <= 0.
Maximize edge density over this LP. The optimum `c_LP` is an upper
bound on the original SDP's augmented optimum (since LP feasible
region is a superset of SDP feasible region). So:
  pi(K_4^(3)) <= c_SDP_augmented <= c_LP.
If `c_LP` is strictly less than 0.56166560, we have a new rigorous
upper bound. If `c_LP` >= 0.56166560, this approach yields nothing
and we fall back to Approach A or B.

### Expected outcome

Approach C almost certainly gives `c_LP >= 0.56166560` because the
LP doesn't benefit from the PSD constraints. Only run this if A and
B both fail. Record the result anyway for diagnostic.

## Decision tree

1. Try Approach A. If CSDP returns a valid float bound < 0.56166560
   with verifiable rational envelope, SUCCESS.
2. If Approach A produces an unreliable bound (solver failure or
   numerical issues), try Approach B.
3. If both fail, record blockers and run Approach C for completeness.
4. If Approach A or B succeeds but the bound is >= 0.56166560, the
   separator constraint does not strictly tighten the SDP in practice
   despite being analytically valid. Record this as a paradigm-
   exhaustion diagnostic: single-Q q=3 separators insufficient for
   a rigorous upper bound on pi at order 6.

## Reporting

Append to `erdos-500/phase0/de_finetti_experiment_report.md`:

- Headline: one line stating the outcome.
  - "NEW RIGOROUS UPPER BOUND pi(K_4^(3)) <= c_new_rational"
    with c_new_rational < 0.56166560, or
  - "Augmented SDP at order 6 with Q=4 separator gives bound c_new
    >= 0.56166560; separator does not strictly tighten the SDP".
- Full output of CSDP (or cvxpy.solve) with the augmented constraint.
- Rational envelope and verification steps if a new bound is obtained.
- Next-step recommendation:
  - If new bound: publication-grade write-up, researcher round for
    audit, Aristotle/Lean formalization plan.
  - If not: try combining separators from multiple Q (Q=4, 5, 6, 7,
    8) as joint constraints; then escalate to order-7 flagmatic for
    the q=4 experiment.

## Budget

- Approach A: 2-4 hours wall-time including CSDP reruns.
- Approach B: 4-8 hours wall-time.
- Approach C: 1 hour wall-time.

Total if A succeeds: ~3 hours.
Total worst case (A fails, B tried, C done): ~10-12 hours.

## Branch and PR

- Branch: `codex/erdos-500-augmented-sdp-q4-separator`.
- Push and open a PR. Do NOT auto-merge.
- PR title suggestion: "Augmented SDP reoptimization with Q=4
  de Finetti separator for K_4^(3)".

## What NOT to do

- Do not modify any round docs in `erdos-500/researcher-*.md`,
  `erdos-500/verify-*.md`, `erdos-500/_forum_transcript.md`, or
  `erdos-500/current-research.md`.
- Do not produce a rational upper bound without an explicit
  computation showing it lies above the float bound plus solver
  tolerance plus a safety buffer. A "close to" claim is not
  rigorous.
- Do not fabricate numerical output; if CSDP fails, report the
  failure and stop.
- Do not auto-merge the PR.
- Do not touch `erdos-872/` or other problem directories.

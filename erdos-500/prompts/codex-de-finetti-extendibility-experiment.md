# Codex task: test de Finetti / finite-extendibility separator for K_4^(3)-free flag-algebra plateau

## Goal

Determine whether the Razborov-style K_4^(3)-free flag-algebra SDP
pseudo-extremizer at or near the plateau projects into the finite-
extendibility polytope E_{q,Q} for computationally tractable (q, Q).
If a separating hyperplane exists with rational margin at some density
c < 0.5611, construct an exact rational certificate. If no separation
holds for all tested (q, Q), record the paradigm-exhaustion diagnostic.

## Context

The full mathematical setup is in:

- `erdos-500/researcher-07-localized-separator-attempt.md`
  Corrected soundness theorem; finite-projection no-go criterion; the
  original sublemma statement (now known flawed).
- `erdos-500/researcher-08-pro-1-de-finetti-reduction.md`
  Refutation of the R07 sublemma via L_q(c) is a subset of P_q(c);
  proof that E_q^(infinity) equals the intersection over m >= q of
  E_q^(m).
- `erdos-500/researcher-08-pro-2-de-finetti-reduction.md`
  Concrete separator schematic with rational margin; finite E_{q,Q}
  hierarchy and its intersection identity.

### Key definitions

- State space S = {0, 1}^3 \ {(1, 1, 1)}, so |S| = 7. These are the
  column patterns consistent with K_4^(3)-freeness: for a rooted edge
  abc and outside vertex x, the column is
    ( 1[abx in E], 1[acx in E], 1[bcx in E] )
  which can never be (1, 1, 1) since that would complete a K_4^(3).

- For an actual K_4^(3)-free 3-graph limit rooted at a random edge,
  sampling q outside vertices gives a symmetrized q-column profile
  m_n on occupancy counts n in N^S with sum_s n_s = q. By conditional
  i.i.d. of the columns, m_n lies in the de Finetti moment cone
    D_q = conv{ nu^q : nu in Delta(S) }.

- Finite extendibility polytope: E_{q,Q} is the set of q-profiles m
  with
    m_n = sum_N z_N * C(Q, q)^{-1} * prod_s C(N_s, n_s)
  for some z_N >= 0 with sum_N z_N = 1, where N ranges over N^S with
  sum_s N_s = Q.

- P_q(c) is the set of q-column profiles arising from pseudo-feasible
  flag-algebra SDP solutions at edge density >= c.

### Open sub-sub-lemma

Find q, Q, c in Q (rationals) with 5/9 < c < 0.5611 and rational
margin such that P_q(c) intersect E_{q,Q} is empty.

- Positive result: pi(K_4^(3)) < c.
- Negative result at all tested small scales: the de Finetti-only
  route is saturated; any successful separator must use compatibility
  between the column law and other flag coordinates.

## Inputs

- File: `erdos-500/researcher-08-pro-1-de-finetti-reduction.md`
  (reduction proof).
- File: `erdos-500/researcher-08-pro-2-de-finetti-reduction.md`
  (explicit linear-certificate schematic).
- File: `erdos-500/current-research.md`
  (literature landmarks; SDP plateau numerics around 0.5611).

### Parameters to sweep

- Flag-algebra basis order r in {5, 6, 7}. Start with r = 5 for
  feasibility; escalate.
- Column count q in {4, 5, 6, 7}.
- Extendibility order Q in {q, q+1, q+2, q+3, q+4}.
- Target density c at each r: use the achieved SDP plateau bound
  (approximately 0.565 at r=5, 0.5626 at r=6, 0.5617 at r=7).

### Constraints

- All arithmetic on the polytope side (hypergeometric vertex
  enumeration of E_{q,Q}) must be exact rational / integer.
- LP feasibility check can be floating-point. Rational certification
  of infeasibility must be exact.
- If infeasibility is reported, the rounded rational separating
  hyperplane must be independently verified to separate with positive
  rational margin.

## What to produce

### Phase 1 -- flag-algebra SDP pseudo-extremizer

- Script: `scripts/k43_flag_sdp.py`. Set up the K_4^(3)-free
  flag-algebra SDP at basis order r and solve for the primal
  pseudo-moment vector and dual certificate.
  - Use `flagmatic` (preferred; Python), `CSDP` / `SDPA` via command
    line, or a minimal Python implementation with `cvxpy` / `scipy`
    as fallback.
  - Output the primal pseudo-moment vector indexed by K_4^(3)-free
    3-graph types on up to r vertices.
- Output: `erdos-500/phase0/flag_sdp_r{r}.json` -- structured JSON
  containing
    { "types": [...], "pseudo_moments": [...],
      "edge_density": ..., "dual_upper_bound": ... }.

### Phase 2 -- q-column profile extraction

- Script: `scripts/extract_q_column_profile.py`. Given the
  pseudo-moment vector from Phase 1, compute the rooted-edge q-column
  profile by enumerating flag types on q + 3 vertices and projecting.
  - For each (q + 3)-vertex K_4^(3)-free type T with a designated
    edge {a, b, c}, compute the multiset of columns C_i for the q
    outside vertices.
  - Accumulate into occupancy coordinates m_n for n in N^S,
    sum_s n_s = q.
  - Normalize by the total edge density to get the conditional
    profile; also emit the unnormalized version u_n = d * m_n for
    the homogenized linear separator.
- Output: `erdos-500/phase0/q_profile_r{r}_q{q}.csv` with columns:
    occupancy_count_0, ..., occupancy_count_6,
    profile_value_normalized, profile_value_unnormalized.

### Phase 3 -- E_{q,Q} containment LP

- Script: `scripts/test_extendibility.py`. For each (q, Q) pair,
  build and solve the LP:
  - Variables: z_N >= 0 for each N in N^S with sum_s N_s = Q.
  - Equality constraints:
      sum_N z_N * C(Q, q)^{-1} * prod_s C(N_s, n_s) = m_n
    for each n with sum_s n_s = q.
  - Normalization: sum_N z_N = 1.
  - Objective: feasibility (or minimize L1-slack on equality
    constraints for robustness).
  - If feasible: record z_N as the exchangeable representation
    witness.
  - If infeasible: extract dual LP separating hyperplane a_n and
    margin epsilon.
- Output: `erdos-500/phase0/extendibility_r{r}_q{q}_Q{Q}.json` with
  structure:

  ```json
  {
    "r": int, "q": int, "Q": int, "feasible": bool,
    "margin": rational_str or null,
    "witness_z": [...] or null,
    "separator_a": [...] or null,
    "separator_rational": [...] or null
  }
  ```

### Phase 4 -- rational certificate (only if Phase 3 finds infeasibility)

- Script: `scripts/rationalize_separator.py`. Round the floating-point
  a_n to small rationals (e.g., dyadic with bounded denominator),
  verify that
    sum_n a_n * m_n > epsilon' > 0
  for the pseudo-profile and
    sum_n a_n * m_n < -epsilon'
  for every hypergeometric vertex of E_{q,Q}, with epsilon' exact
  rational.
- Output: `erdos-500/phase0/rational_certificate_r{r}_q{q}_Q{Q}.json`
  and a corresponding `.tex` file. The JSON has machine-checkable
  coefficients; the `.tex` has a paper-grade write-up of the
  certificate and the implied bound
    pi(K_4^(3)) <= c'
  where c' = c - epsilon' / (max-edge-density-coefficient).

### Phase 5 -- summary report

- Output: `erdos-500/phase0/de_finetti_experiment_report.md` with:
  - Headline: either "rigorous new upper bound pi <= c' established"
    or "de Finetti-only route saturated at (r, q, Q) tested".
  - Summary table: for each (r, q, Q) tested, feasibility outcome
    and (if infeasible) margin and rational-certificate status.
  - Next-step recommendations: if universally feasible at small
    scales, escalate q and Q; if infeasible at small scales, lift to
    rigorous publication-grade certificate.

## Expected output format

### `flag_sdp_r{r}.json`

```json
{
  "r": 6,
  "types": ["type_id_1", "type_id_2", "..."],
  "pseudo_moments": [0.12345, 0.67890],
  "edge_density": 0.5626,
  "dual_upper_bound": 0.5626,
  "solver": "flagmatic"
}
```

### `q_profile_r{r}_q{q}.csv`

```
occ_0,occ_1,occ_2,occ_3,occ_4,occ_5,occ_6,profile_normalized,profile_unnormalized
7,0,0,0,0,0,0,0.04251,0.02391
6,1,0,0,0,0,0,0.11783,0.06628
```

Exactly C(q + 6, 6) rows; S indexed in a canonical order, e.g., lex-
ordered binary tuples with (1, 1, 1) excluded.

### `extendibility_r{r}_q{q}_Q{Q}.json`

```json
{
  "r": 6, "q": 5, "Q": 7, "feasible": false,
  "margin_float": 0.00148,
  "margin_rational": "37/25000",
  "witness_z": null,
  "separator_a_float": [0.12, -0.07],
  "separator_a_rational": ["3/25", "-7/100"]
}
```

## Reporting

When complete, append a one-paragraph summary at
`erdos-500/phase0/de_finetti_experiment_report.md` and a one-line
headline at the top of that same file. Include:

- Outcome: "certificate found at (r, q, Q) = (...) giving pi <= c'"
  OR
  "no separator at tested scales, paradigm saturated for
  r <= ..., q <= ..., Q <= ...".
- Any anomalies: LP solver numerical issues, SDP failing to converge,
  rational rounding failing margin check.
- Recommended next step: if saturated, escalate parameters; if
  certificate found, hand off to a researcher round for publication-
  grade verification.

## Copy back to main

Codex works in `.codex/worktrees/<hash>/`. After completion:

- Copy all scripts to `scripts/` in the main tree.
- Copy all `erdos-500/phase0/` outputs to the main tree.
- Create a branch with a clear name (e.g.,
  `codex/erdos-500-de-finetti-experiment`) and push it for review.
- Do NOT auto-merge. This is research output that needs human
  curator review before integration.

## Time estimate

- Phase 1 (flag-algebra SDP) at r = 5: minutes. At r = 6: hours if
  implementing from scratch; minutes with flagmatic.
- Phase 2 (profile extraction): minutes once flag types are
  enumerated.
- Phase 3 (LP): seconds to minutes per (q, Q) pair. For q = 7,
  Q = 10, LP has about 10^4 variables; tractable.
- Phase 4 (rationalization): minutes.
- Full sweep at r = 5, q in {4, 5, 6}, Q in {q, ..., q + 3}: about
  one hour wall-time.

## Prioritization

If the full sweep is infeasible, prioritize:

1. r = 5, q = 5, Q in {5, 6, 7}. Establishes the pipeline end-to-end
   on the smallest case.
2. r = 6, q = 5, Q = 7. First realistic test against a tight
   plateau-ish SDP output.
3. r = 6, q = 7, Q = 10. Larger LP, most likely to reveal a
   separator if one exists.
4. Escalate r toward 7 only if the smaller cases suggest a separator
   is plausible.

A negative outcome at (r = 6, q = 7, Q = 10) is the strongest
diagnostic that the de Finetti-only route is saturated. A positive
outcome is our new rigorous upper bound.

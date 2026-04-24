# Codex task: unlock Phase 1 of the de Finetti extendibility experiment

## Goal

Produce a genuine K_4^(3)-free flag-algebra SDP plateau pseudo-moment export
in the JSON contract consumed by `scripts/k43_flag_sdp.py`, then actually run
Phases 2-5 of the existing pipeline. Try three unlock paths in the order
below, stopping at the first that succeeds. If all three are blocked,
record the blocker for each and stop.

## Context

- Pipeline already implemented and verified on synthetic inputs. Current
  blocker: Phase 1 has no real pseudo-moment export and no SDP backend.
- Diagnostic round: `erdos-500/researcher-09-codex-pipeline-scaffolded.md`.
- Math setup and reduction:
  - `erdos-500/researcher-07-localized-separator-attempt.md`
  - `erdos-500/researcher-08-pro-1-de-finetti-reduction.md`
  - `erdos-500/researcher-08-pro-2-de-finetti-reduction.md`
- Target input format: see the "external-json" contract in
  `scripts/k43_flag_sdp.py` (the `--external-json` flag and the rejection
  logic defines exactly what fields and vertex counts are required).

## Required output format (same for all three paths)

Whatever path succeeds, the Phase 1 output must be a
`erdos-500/phase0/flag_sdp_r{r}.json` artifact that:

1. Has `status: "ok"` (not `"blocked"`).
2. Carries genuine primal pseudo-moment values (or equivalent type-moment
   coordinates) at or near the known plateau upper bound for the chosen r.
3. Includes type moments on at least `q + 3` vertices, for the target
   `q` range {4, 5, 6, 7}. Concretely: type moments on 7, 8, 9, 10 vertex
   K_4^(3)-free 3-graph isomorphism classes.
4. Records the achieved dual upper bound and identifies which solver
   and which path (1 / 2 / 3) produced it.
5. Is reproducible: either from a command in the path's writeup, or from a
   downloaded source file pinned with a URL.

Then Phase 2, 3, 4, 5 run via the existing scripts without further
modification.

## Path 1: install and use flagmatic (first attempt — lowest implementation cost if it works)

### Try to install

- `pip install flagmatic` — most likely fails in 2026 (historically SageMath-
  dependent, repo may be stale).
- `pip install git+https://github.com/emil-vaughan/flagmatic` or similar
  community fork — try this.
- Check for any Python-only flagmatic replacement packages on PyPI:
  search "flag algebra" "hypergraph turan" on PyPI via `pip index versions`
  or `pip search` (may be deprecated; fall back to browsing PyPI).

### If installed

- Run flagmatic on the K_4^(3) Turán problem at basis order r = 6 first,
  then r = 7 if r = 6 succeeds.
- Export the primal pseudo-moment vector and dual certificate in the
  required JSON format.
- Write to `erdos-500/phase0/flag_sdp_r{r}.json` with `status: "ok"`.

### If blocked

- Record the specific install / runtime blocker in
  `erdos-500/phase0/unlock_log.md` (create the file) with headings
  "Path 1: flagmatic" and the exact error messages.
- Move to Path 2. Do not fabricate a surrogate.

## Path 2: procure an existing published pseudo-moment export (second attempt — zero implementation cost if data exists)

### Target sources

- Razborov, A., "On the minimal density of triangles in graphs" /
  "Flag algebras", JSL 2007; and the K_4^(3)-specific paper cited in
  `erdos-500/current-research.md`. Check for supplementary material on
  Razborov's publications page (www.mi-ras.ru and his UChicago page).
- Baber, R., and Talbot, J., "Hypergraphs do jump", 2011 — supplementary
  data sometimes included.
- Falgas-Ravry, V., and Vaughan, E. R., "Applications of the
  semi-definite method to the Turán density problem for 3-graphs",
  Combinatorics Probability and Computing 2013 — Vaughan maintains
  flagmatic outputs on his GitHub.
- Flagmatic project page (GitHub emil-vaughan/flagmatic or similar) may
  have pre-computed K_4^(3) certificates.
- Pikhurko's website at Warwick may have K_4^(3)-adjacent SDP data
  (e.g., for K_4^(3)-free 3-graphs with an added forbidden edge pattern).

### Workflow

- Perform a focused web search (use `WebSearch` if available, or `curl`
  to the publisher / author websites). Look for CSDP / SDPA / .mat /
  .json / .txt formatted SDP output specifically for K_4^(3).
- If a file is found, download it, verify its format, and write a
  converter that maps it into the `flag_sdp_r{r}.json` contract.
- Run the converter. Verify the dual upper bound reproduces the
  plateau numeric (~ 0.5611 - 0.5617 depending on r).
- Write to `erdos-500/phase0/flag_sdp_r{r}.json` with `status: "ok"` and
  document the source URL and conversion logic.

### If blocked

- Record in `erdos-500/phase0/unlock_log.md` under "Path 2: procure
  existing export" the specific sources checked and why each did not
  yield a usable file (404, wrong format, insufficient vertex coverage,
  license restriction, etc.).
- Move to Path 3. Do not fabricate a surrogate.

## Path 3: implement a minimal K_4^(3) flag-algebra SDP from scratch (third attempt — highest implementation cost, most controllable)

### Try to install

- `pip install cvxpy` and a free SDP solver: `pip install scs` or
  `pip install clarabel`. Verify with `python -c "import cvxpy; print(cvxpy.installed_solvers())"`.
- If the free solver is not powerful enough for r = 6 or r = 7, fall
  back to r = 5 (still produces a pseudo-extremizer with density
  around 0.565, sufficient to test the de Finetti reduction at the
  pilot scale).

### Implementation at `scripts/k43_flag_sdp_minimal.py`

1. Enumerate non-isomorphic K_4^(3)-free 3-graphs on up to r vertices.
   Use canonical form via `networkx.weisfeiler_lehman_graph_hash` or
   custom nauty-style invariants. For r = 5 this is a small list
   (under 100 types).
2. For each pair of flag types, enumerate all ways to embed the flags
   into a K_4^(3)-free (2k)-vertex type with a common s-vertex rooted
   sub-type. Produce the flag-product matrix.
3. Set up the SDP: maximize edge density subject to
   sum_sigma <Q_sigma, flag_products_sigma> <= edge_density - c_j for
   each non-negative flag inequality, plus Q_sigma positive semidefinite.
4. Solve with CVXPY + SCS / CLARABEL.
5. Extract the primal pseudo-moment vector: for each K_4^(3)-free type
   T on up to r vertices, its density in the optimal solution.
6. Compute type moments on r + 2 up to r + 5 vertices by recursively
   evaluating flag products (standard flag-algebra recursion).
7. Write `erdos-500/phase0/flag_sdp_r{r}.json` with `status: "ok"` and
   include the dual upper bound + the pseudo-moment vector.

### Validation

- Before writing the artifact, verify the output bound matches known
  published values within solver tolerance:
  r = 5: upper bound about 0.565 - 0.567.
  r = 6: upper bound about 0.5626.
  r = 7: upper bound about 0.5617.
- If the bound is significantly off (> 0.01 above the published value),
  the flag construction or SDP setup is wrong. Log the discrepancy in
  `unlock_log.md` and stop.

### If blocked

- Specific blockers expected: (a) flag enumeration too slow at r = 6-7,
  (b) SDP solver out of memory / timeout at r = 7, (c) SDP solution far
  from published bound, indicating setup error.
- Record the blocker in `unlock_log.md` under "Path 3: from scratch".
- Do NOT proceed to Phases 2-5 with a bad pseudo-extremizer. Fail
  closed.

## Phases 2-5: run on the Path-X output

Once Path 1 / 2 / 3 has produced a good `flag_sdp_r{r}.json`, run
the existing pipeline:

```bash
scripts/extract_q_column_profile.py --input erdos-500/phase0/flag_sdp_r{r}.json --q {q} --out erdos-500/phase0/q_profile_r{r}_q{q}.csv

scripts/test_extendibility.py --r {r} --profile erdos-500/phase0/q_profile_r{r}_q{q}.csv --Q {Q} --out erdos-500/phase0/extendibility_r{r}_q{q}_Q{Q}.json
```

For each `(q, Q)` in `q in {5, 6, 7}, Q in {q, q+1, q+2, q+3}`:

- If the LP is feasible, record the exchangeable witness and move on.
- If infeasible: run `scripts/rationalize_separator.py` on the result.
  If rationalization succeeds with positive exact margin, the output
  rational certificate at
  `erdos-500/phase0/rational_certificate_r{r}_q{q}_Q{Q}.{json,tex}`
  is a proof sketch of `pi(K_4^(3)) < c'` for `c'` a rational below
  0.5611.

## Reporting

Update `erdos-500/phase0/de_finetti_experiment_report.md` with:

- Which path (1 / 2 / 3) succeeded (or a note that all three are
  blocked).
- Summary of the sweep outcomes at tested `(r, q, Q)` parameters.
- If a certificate was found: the exact rational upper bound and a
  one-line note of the separating hyperplane coefficients.
- If all three paths blocked: the consolidated blocker log from
  `unlock_log.md` and a recommendation for what would unlock the
  experiment (e.g., "needs a SageMath install", "needs purchase of
  MOSEK license", etc.).

## Copy back and branch

- All new scripts go to `scripts/` in the main tree.
- All new artifacts go to `erdos-500/phase0/` in the main tree.
- Create a branch `codex/erdos-500-de-finetti-phase1-unlock` and push.
- Open a PR targeting main. Do NOT auto-merge.

## Time budget

- Path 1: 15-30 minutes wall-time including install attempts.
- Path 2: 30-60 minutes wall-time including web search and format
  conversion.
- Path 3: 1-3 hours wall-time at r = 5; longer at r = 6-7.
- Phases 2-5 (after Path X succeeds): 30-60 minutes wall-time.

Total budget: about 4 hours if all paths are tried sequentially. Stop
at the first success.

## What NOT to do

- Do not fabricate or simulate pseudo-moment data. If all three paths
  are blocked, write the blocker log and stop.
- Do not merge the PR automatically.
- Do not modify any files under `erdos-500/` that are not in
  `erdos-500/phase0/` or are already round docs.
- Do not touch `erdos-872/` or other problems' directories.

# Codex task: run Phases 2-5 at q=3 on the order-6 Flagmatic primal

## Goal

Use the already-unlocked Flagmatic 1.5.1 + CSDP 6.2.0 order-6 K_4^(3)
run (bound 0.56166560, 964-coordinate primal over 6-vertex K_4^(3)-free
type classes) to actually run Phases 2-5 of the de Finetti pipeline at
q = 3. This produces either:

- a new rigorous upper bound pi(K_4^(3)) < c' for some rational
  c' < 0.56166560, via a rational separator certificate between the
  pseudo-profile and E_{3, Q}, or
- a clean diagnostic that the order-6 pseudo-profile is q=3 de-Finetti
  extendible up to Q = 8, providing the first real-data evidence about
  where the separator route can work.

## Context

- Round R10 (`erdos-500/researcher-10-flagmatic-csdp-unlock.md`) records
  that `flagmatic-1.5.1` and `csdp` are persisted at `~/.codex/bin/`
  with source trees under `~/.codex/tools/`. The order-6 K_4^(3) run
  has been reproduced once; re-running should take minutes.
- Round R08 (`erdos-500/researcher-08-pro-1-de-finetti-reduction.md`)
  and the Pro #2 sibling set up the de Finetti moment cone D_q, the
  finite extendibility polytope E_{q,Q}, and the sharp sub-sub-lemma.
- Pipeline scripts already implemented and verified:
  - `scripts/k43_flag_sdp.py`
  - `scripts/extract_q_column_profile.py`
  - `scripts/test_extendibility.py`
  - `scripts/rationalize_separator.py`
  - `scripts/de_finetti_utils.py`
- Blocker that does not apply at q = 3: the q = 5..7 sweep needed
  moments on 8-10 vertices. The q = 3 experiment only needs moments on
  6 vertices, which the order-6 Flagmatic primal provides directly.

## Inputs

- Tool: `~/.codex/bin/flagmatic` (Flagmatic 1.5.1 wrapper) with
  `CSDP=~/.codex/bin/csdp` or the path embedded in that wrapper.
- Local source + build: `~/.codex/tools/flagmatic-1.5.1/`,
  `~/.codex/tools/csdp/`.
- Pipeline scripts: `scripts/*.py` as above.
- Target output directory: `erdos-500/phase0/`.

## Steps

### Step 1 -- reproduce or recover the order-6 K_4^(3) run

- If the Flagmatic run outputs (`flags.out`, type enumeration files,
  etc.) are still present from the prior session, use them.
- Otherwise, re-run:

  ```bash
  cd $(mktemp -d)
  ~/.codex/bin/flagmatic --r 3 --n 6 --forbid-k4
  ```

  (Or whatever exact incantation the wrapper expects to reproduce the
  0.56166560 order-6 K_4^(3) bound.)
- Verify the reconstructed edge density is approximately
  0.5616656023358584, matching the R10 record.

### Step 2 -- parse the primal and type enumeration

- Parse `flags.out` to extract the first-row primal probability vector
  (964 coordinates).
- Parse Flagmatic's 6-vertex K_4^(3)-free type enumeration to get each
  type's edge list (3-edges on 6 labeled vertices).
- Sanity-check: the parsed primal sums to ~1.0 (tolerance 1e-6) and
  weighted edge-density sum matches 0.5616656023358584.

### Step 3 -- write the structured pseudo-moment JSON

- Produce `erdos-500/phase0/flag_sdp_r6.json` with
  `status: "ok"` and the payload:

  ```json
  {
    "status": "ok",
    "r": 6,
    "solver": "flagmatic-1.5.1+csdp-6.2.0",
    "dual_upper_bound": 0.56166560,
    "edge_density": 0.5616656023358584,
    "types": [
      {"n": 6, "edges": [[0,1,2], [0,1,3], ...], "moment": "p/q"},
      ...
    ],
    "pseudo_moments": [0.001234, 0.005678, ...]
  }
  ```

- Moments should be exact rationals (`"p/q"` string form) if the CSDP
  output is convertible; otherwise high-precision decimals with a
  clear note about precision.
- The `types` list should contain exactly 964 records; verify count.
- The `pseudo_moments` parallel list is legacy-format backward-compat.

### Step 4 -- run Phase 2 at q = 3

```bash
scripts/extract_q_column_profile.py \
  --input erdos-500/phase0/flag_sdp_r6.json \
  --q 3 \
  --out erdos-500/phase0/q_profile_r6_q3.csv
```

- The script already exists. It enumerates rooted-edge 6-vertex type
  flags (edge {a, b, c} plus 3 outside vertices x_1, x_2, x_3) and
  computes the column-occupancy profile.
- Output CSV has C(3 + 6, 6) = 84 rows.

### Step 5 -- run Phase 3 containment LP for Q = 3, 4, 5, 6, 7, 8

```bash
for Q in 3 4 5 6 7 8; do
  scripts/test_extendibility.py \
    --r 6 --profile erdos-500/phase0/q_profile_r6_q3.csv \
    --Q $Q --out erdos-500/phase0/extendibility_r6_q3_Q$Q.json
done
```

- For each Q, record feasibility + (if feasible) witness z_N OR (if
  infeasible) separating hyperplane coefficients a_n and margin.

### Step 6 -- if any Q is infeasible, run rational certification

For each Q with `feasible: false`:

```bash
scripts/rationalize_separator.py \
  --input erdos-500/phase0/extendibility_r6_q3_Q$Q.json \
  --out erdos-500/phase0/rational_certificate_r6_q3_Q$Q.json
```

- Verify that the rationalized hyperplane separates with positive
  exact margin against every hypergeometric vertex of E_{3, Q}.
- If verification passes, the implied upper bound is
  pi(K_4^(3)) <= c' for c' = 0.56166560 - (margin / max-coefficient).
- Also produce the LaTeX sibling at
  `erdos-500/phase0/rational_certificate_r6_q3_Q{Q}.tex`.

### Step 7 -- summary report

Append to `erdos-500/phase0/de_finetti_experiment_report.md`:

- Headline (top of file): either
  - "New rigorous upper bound: pi(K_4^(3)) <= [exact rational] via
    q = 3, Q = [Q*] de Finetti separator on order-6 Flagmatic
    primal", OR
  - "Order-6 pseudo-profile is q = 3 extendible up to Q = 8; de
    Finetti-only route saturated at q = 3 at this order".
- Summary table: for each Q in {3..8}, feasibility + margin + witness
  / separator presence.
- Next-step recommendation: if a separator was found, hand off to a
  researcher round for publication-grade verification; if universally
  feasible at q = 3, recommend trying q = 4 (which requires order-7
  flagmatic, 1.5-10 hour wall-time).

## Expected runtime

- Step 1 (Flagmatic re-run if needed): ~10 minutes.
- Step 2-3 (parse + JSON write): ~10 minutes.
- Step 4 (Phase 2 extract): seconds.
- Step 5 (Phase 3 LP, 6 values of Q): seconds each.
- Step 6 (rational certification, if needed): minutes.
- Step 7 (report): minutes.

Total: ~30-60 minutes wall-time.

## Deliverables

- `erdos-500/phase0/flag_sdp_r6.json` with `status: "ok"` and real 964
  type moments.
- `erdos-500/phase0/q_profile_r6_q3.csv`.
- `erdos-500/phase0/extendibility_r6_q3_Q{3..8}.json`.
- `erdos-500/phase0/rational_certificate_r6_q3_Q{Q}.{json,tex}` if any
  Q is infeasible.
- Updated `erdos-500/phase0/de_finetti_experiment_report.md` with
  headline outcome.

## Branch and PR

- Branch: `codex/erdos-500-q3-experiment`.
- Push and open a PR targeting main. Do NOT auto-merge.

## What NOT to do

- Do not modify any round docs under `erdos-500/researcher-*.md`,
  `erdos-500/verify-*.md`, `erdos-500/_forum_transcript.md`, or
  `erdos-500/current-research.md`.
- Do not synthesize higher-vertex moments from the 6-vertex primal.
  The experiment at q = 3 does not need them and anything else would
  be surrogate data.
- Do not auto-merge the PR.
- Do not touch `erdos-872/` or other problem directories.

## Interpretation of outcomes

- **Infeasible at some Q and rationally certified**: NEW RIGOROUS UPPER
  BOUND on pi(K_4^(3)). This is a publication-grade result on a Turán
  conjecture open since 1941. Immediate follow-up: dispatch to a
  researcher round for stability audit + formal write-up.

- **Feasible at all tested Q in {3..8}**: first real-data evidence
  that at order 6, the q = 3 projection of the pseudo-profile lies
  inside the de Finetti moment cone. The de Finetti-only route at
  q = 3 is saturated; higher q (requiring higher-order Flagmatic)
  or additional compatibility constraints are needed.

- **Mixed (infeasible at small Q, feasible at larger Q, or numerical
  issues)**: investigate and report honestly; LP numerical precision
  issues can cause false infeasibility. The rational-certification
  step is the arbiter — if rationalization verifies with exact margin,
  the bound holds; otherwise report the precision failure.

# Phase 1 Unlock Log

## Path 1: flagmatic

Status: blocked for the requested q range.

What succeeded:

- `pip install flagmatic` failed because no package exists on PyPI:
  `ERROR: No matching distribution found for flagmatic`.
- `pip install git+https://github.com/emil-vaughan/flagmatic` failed:
  `remote: Repository not found.`
- `pip install git+https://github.com/jsliacan/flagmatic-2.0.git` cloned a
  mirror but failed as a pip install:
  `does not appear to be a Python project: neither 'setup.py' nor 'pyproject.toml' found.`
- The old Flagmatic 1.5.1 source was downloaded from
  `https://lidicky.name/flagmatic/flagmatic-1.5.1.zip` and compiled.
- CSDP was not available from Homebrew:
  `Warning: No available formula with the name "csdp".`
- CSDP 6.2.0 was built from `https://github.com/coin-or/Csdp.git` by removing
  OpenMP flags and linking against macOS Accelerate.
- With `CSDP=/tmp/Csdp/solver/csdp`, Flagmatic reproduced the published
  order-6 K4 run:
  `Approximate floating-point bound is 0.56166560`.
- The first row of `flags.out` is a genuine primal probability vector over the
  964 admissible 6-vertex K4-free types; it sums to `0.9999999999998522` and
  gives edge density `0.5616656023358584`.

Final blocker:

- The artifact is only on 6 vertices. The required q-profile extraction for
  `q in {5,6,7}` needs type moments on 8, 9, and 10 vertices, and the task's
  required Phase 1 contract asks for 7-10 vertex type moments.
- A bounded attempt at `./flagmatic --r 3 --n 7 --forbid-k4` produced no output
  files after about two minutes and was killed. The Flagmatic guide warns that
  n=7 3-graph computations can take 1.5-10 hours depending on hardware, and
  even n=7 would still only support q=4, not q=5-7.

Persistent tooling improvement:

- `flagmatic-1.5.1` and `csdp` were copied to `~/.codex/bin/`, with source trees
  under `~/.codex/tools/flagmatic-1.5.1` and `~/.codex/tools/csdp`, so future
  sessions can reproduce the order-6 Flagmatic run without rebuilding.

## Path 2: procure existing export

Status: blocked.

Sources checked:

- Flagmatic result page: `https://lidicky.name/flagmatic/`.
  - The page lists the K4 transcript and certificate.
  - Transcript URL works:
    `https://lidicky.name/flagmatic/transcripts/k4.txt`.
  - Certificate URLs checked:
    `https://lidicky.name/flagmatic/certificates/k4.js`,
    `https://lidicky.name/flagmatic/certificates/k4.js.bz2`,
    `http://lidicky.name/flagmatic/certificates/k4.js`,
    `https://web.archive.org/web/20180721123635/http://flagmatic.org/certificates/k4.js`,
    and
    `https://web.archive.org/web/20180721123635/http://www.flagmatic.org/certificates/k4.js`.
    These returned 404s, Wayback 404 pages, or DNS failure for `flagmatic.org`.
- Baber, `Turán densities of hypercubes`, arXiv:1201.3587.
  - Source bundle downloaded from `https://arxiv.org/e-print/1201.3587`.
  - Ancillary `K4.txt` was present and states that it proves the `0.5615`
    upper bound for `pi(K_4^3)`.
  - The file is rational dual/regularity-constraint data on colored order-6
    subgraphs (`Order of coloured subgraphs H : 6`), not primal type moments on
    7-10 vertex K4-free isomorphism classes.
- Razborov K4-specific material and author/publisher pages surfaced papers and
  transcripts but no machine-readable primal pseudo-moment export with 7-10
  vertex coverage.

Final blocker:

- Public files found are dual certificates or verification data, not the
  requested primal plateau pseudo-moment export with 7-10 vertex type moments.

## Path 3: from scratch

Status: blocked.

What succeeded:

- In a disposable venv, `pip install cvxpy scs clarabel` succeeded.
- `cvxpy.installed_solvers()` reported:
  `['CLARABEL', 'HIGHS', 'OSQP', 'SCIPY', 'SCS']`.
- The already-built Flagmatic+CSDP stack is a stronger minimal implementation
  for the standard order-6 K4 SDP than reimplementing the same flag algebra
  matrices by hand.

Final blocker:

- Reimplementing a correct K4 flag algebra SDP to the required high-order
  moment export is not just a solver-install problem. The existing, validated
  order-6 computation only gives a primal vector on 6-vertex types. Producing
  7-10 vertex pseudo-moments would require either a much larger SDP or a
  mathematically justified extension/recursion implementation. No such
  implementation was completed in this run.
- Proceeding by inventing an exchangeable extension or using finite-graph
  surrogate data would violate the task's "do not fabricate or simulate
  pseudo-moment data" constraint and would contaminate the de Finetti test.

## Consolidated Recommendation

The experiment is unlocked at the level of reproducing the published order-6
Flagmatic/CSDP plateau bound, but remains blocked for the requested q-column
sweep. The next real unlock is one of:

- obtain an existing primal plateau export that already contains 7-10 vertex
  type moments;
- run a long Flagmatic/Sage/CSDP computation capable of producing and extending
  the pseudo-moment vector beyond order 6;
- implement and independently validate the high-order moment-extension
  recursion from the flag algebra SDP solution.

Until one of those exists, Phases 2-5 should not be run on research data.

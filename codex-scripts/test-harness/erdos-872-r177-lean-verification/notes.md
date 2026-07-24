# erdos 872 r177 lean verification

## Target

The repaired R177 manuscript's theorem `L(n)=o(n)`, at the Tier-1 boundary
defined in `erdos-872/fable/LEAN-PLAN.md`: all finite-game, cone, sweep, and
limit arguments proved in Lean; only the three appendix analytic inputs may
remain as named axioms.

## Source Of Truth

- `erdos-872/researcher-R177-repaired-manuscript.md`
- `erdos-872/verify-R177-fable-audit.md`
- `erdos-872/fable/LEAN-PLAN.md`

## Metric

`lake build` exit status, source proof-hole count, and verbatim
`#print axioms Erdos872.main` output.

## How To Run

```bash
./run.sh
```

## Artifacts

- `artifacts/screenshots/`
- `artifacts/data/`
- `artifacts/logs/`
- `artifacts/repros/`

## Target Evidence Map

- Public/user-facing surfaces: R177 theorem and its formal-verification claim.
- Promised behaviors: formal game quantifiers, repaired local-opening count,
  total Shortener strategy, density recursion, and final asymptotic theorem.
- Existing tests: prior Lean projects cover unrelated earlier bounds only.
- Known failures: no R177 Lean project existed at bootstrap.
- Unsupported cases: Tier 2 analytic discharge is explicitly deferred.
- Performance claims: none.
- External sources: Mathlib v4.28.0 only.

## Source Pass

- Fetch command: `lake update` in the Lean project.
- Manifest/cache path: `erdos-872/lean/r177_verification/lake-manifest.json`.
- Accepted transfers: the established repo pattern of one self-contained Lake
  project and verbatim `#print axioms` reporting.
- Rejected ideas: Mathlib game theory APIs; they do not model this finite
  alternating selection game or the erasure coalition.

## Corpus / Repros

- Corpus path:
- Repro path:
- Promotion rule:

## Benchmarks

- Result JSON:
- Baseline or threshold:
- Caveats:

## Verdict

`logged` until all gates pass.

## Deferred

Tier 2 proofs of Lemmas 2.1-2.3.

## Results

Run `./run.sh`; inspect `artifacts/data/latest.json` and the two logs.

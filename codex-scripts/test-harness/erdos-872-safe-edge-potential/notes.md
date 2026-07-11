# erdos 872 safe edge potential

## Target

Falsify the exact-move selectors used in the unconditional rank-three lower
bound.

## Source Of Truth

The auxiliary-game definitions and arithmetic wrappers in
`erdos-872/paper/sections/appendix-A-deferred-proofs.tex`, with the vendored
K5 trace as a regression shape.

## Metric

Exact rational full-round potential change under the proposed selector versus
the largest modeled reply loss.

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

- Public/user-facing surfaces:
- Promised behaviors: zero negative selector transitions in generated states.
- Existing tests: none before this harness.
- Known failures: the old unscored auxiliary edge-deletion hypothesis fails on
  K4/K5 fibers.
- Unsupported cases: this harness does not prove the asymptotic wrapper.
- Performance claims: none.
- External sources: vendored Edwin snapshot at the commit in `SOURCE.md`.

## Source Pass

- Fetch command: none; sources are already local and commit-pinned.
- Manifest/cache path: `research/sources.json`.
- Accepted transfers: K5 exact-edge deletion as a regression shape.
- Rejected ideas: treating an unscored auxiliary deletion as an actual game
  move, or treating finite enumeration as a proof.

## Corpus / Repros

- Corpus path: `corpus/cases.json`.
- Repro path: `artifacts/repros/latest-failure.json`.
- Promotion rule: any smallest failing state becomes a permanent corpus case.

## Benchmarks

- Result JSON: `artifacts/data/latest.json`.
- Baseline or threshold: zero failures.
- Caveats: finite state evidence only.

## Verdict

`measured`

## Deferred

Lean formalization of the new selectors and external mathematical peer review.

## Results

Run `./run.sh`; the latest structured result is written under
`artifacts/data/`.

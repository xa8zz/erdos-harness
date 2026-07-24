---
date: 2026-07-24
verdict: reference
tags: [source-pass, research]
---

# erdos 872 r177 lean verification Source Pass

## Question

What exact local sources define a faithful Tier-1 formalization, and which
dependency snapshot makes the result reproducible?

## Sources

- R177 manuscript: theorem/proof source of truth.
- V177 linewise audit and Lean plan: repaired semantics and formalization traps.
- Mathlib v4.28.0 at commit `8f9d9cff6bd728b17a24e163c9402775d9e6a365`:
  pinned dependency used by the existing Erdős Lean projects.

## Accepted Transfers

The harness gates `lake build`, proof-hole tokens, and exact axiom reporting.

## Rejected Ideas

- `SetTheory.Game`: rejected because it does not encode the manuscript's
  finite erasure-before-action protocol.
- Additional combinatorial axioms: rejected because Tier 1 permits only the
  three analytic inputs.

## Verification

The pinned Lake project resolves and builds locally under Lean 4.28.0.

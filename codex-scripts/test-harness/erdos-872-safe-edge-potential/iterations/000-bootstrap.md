---
date: 2026-07-10
verdict: logged
tags: [evidence, harness]
---

# erdos 872 safe edge potential Bootstrap

## Goal

Encode the activation and residual safe-move claims as falsifiable finite
contracts.

## Implemented

An exact-rational exhaustive activation checker and seeded random activation /
multi-fiber residual checker.

## Current Result

Passed with seed 872. The current structured run covers 270,992 weighted
activation states and 54,898 residual states, including exhaustive one-fiber
states through five side vertices. An earlier 100,000-case random run covered
350,992 activation states and 100,000 random multi-fiber residual states. No
negative full-round transition was found.

## Decision

Retain the harness even after a symbolic proof so future edits can regression
check the selector formulas.

## Deferred

Symbolic proof and arithmetic-wrapper verification.

## Verification

`./run.sh` on 2026-07-10.

## Artifacts

`artifacts/data/latest.json` or a replay under `artifacts/repros/`.

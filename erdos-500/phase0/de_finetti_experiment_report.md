# Headline: all three Phase 1 unlock paths blocked before the q=5..7 de Finetti sweep.

## Summary

This run partially unlocked the tooling but not the required Phase 1 artifact.
Flagmatic 1.5.1 and CSDP 6.2.0 were built successfully, and the standard
K4-free order-6 Flagmatic run reproduced the published plateau-ish bound
`0.56166560`. Its CSDP solution contains a genuine primal probability vector
over the 964 admissible 6-vertex K4-free types, summing to 1 and giving edge
density `0.5616656023358584`. However, this is still insufficient for the
requested experiment: q-profile extraction for `q in {5,6,7}` needs type moments
on `q+3 in {8,9,10}` vertices, and the required Phase 1 contract asks for
7-10 vertex type moments.

No `flag_sdp_r{r}.json` artifact was changed to `status: "ok"`, and Phases 2-5
were not run on research data.

## Unlock Path Outcomes

| Path | Outcome | Blocker |
|---:|---|---|
| 1 | partial tooling success | Flagmatic+CSDP reproduces order-6 K4 bound, but only yields 6-vertex type moments; n=7 bounded attempt made no progress and still would not cover q=5-7. |
| 2 | blocked | Public sources found transcripts and rational dual/regularity data, including arXiv:1201.3587 `K4.txt`, but no primal 7-10 vertex pseudo-moment export. |
| 3 | blocked | `cvxpy`, `SCS`, and `CLARABEL` installed, but no validated from-scratch high-order moment-extension implementation was completed. |

Full command-level details are in `erdos-500/phase0/unlock_log.md`.

## Sweep Table

| r | q | Q range | Outcome | Certificate |
|---:|---:|---|---|---|
| 5 | 5-7 | q..q+3 | not run | blocked before valid pseudo-profile extraction |
| 6 | 5-7 | q..q+3 | not run | blocked before valid pseudo-profile extraction |
| 7 | 5-7 | q..q+3 | not run | blocked before valid pseudo-profile extraction |

## Useful Artifacts

| Artifact | Status | Notes |
|---|---|---|
| `~/.codex/bin/flagmatic-1.5.1` | installed locally | Built from `https://lidicky.name/flagmatic/flagmatic-1.5.1.zip`. |
| `~/.codex/bin/csdp` | installed locally | Built from `https://github.com/coin-or/Csdp.git` with macOS-compatible flags. |
| `/tmp/flagmatic-k4-output/flags.out` | ephemeral evidence | First row is the 964-coordinate order-6 primal vector from the reproduced K4 run. |
| `/tmp/arxiv1201.3587/K4.txt` | ephemeral evidence | Rational dual/regularity data for the `0.5615` bound, not a usable primal export. |

## Recommendation

The next real unlock is not another package install. It requires one of:

- a published or private primal plateau export with type moments on 7-10 vertex
  K4-free isomorphism classes;
- a long Flagmatic/Sage/CSDP run plus a mathematically justified way to extend
  the order-6 pseudo-solution to 8-10 vertex coordinates;
- a new, validated implementation of the high-order flag-algebra moment
  extension recursion.

Until then, running `scripts/extract_q_column_profile.py` for `q=5,6,7` would
require fabricated or surrogate data, so the de Finetti separator diagnostic
remains blocked rather than saturated.

## One-Paragraph Run Summary

Outcome: all three requested Phase 1 unlock paths are blocked for the target
q-range. The tooling situation improved materially: local Codex now has working
`flagmatic-1.5.1` and `csdp`, and the standard K4 order-6 computation was
reproduced. But no genuine 7-10 vertex plateau pseudo-moment export was found or
generated, so no separator, rational certificate, or paradigm-exhaustion result
was produced.

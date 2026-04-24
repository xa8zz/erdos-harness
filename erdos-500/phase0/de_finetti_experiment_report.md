# Headline: experiment blocked before separator sweep because no genuine plateau flag-SDP pseudo-moment export was available locally.

## Summary

This run implemented the finite-extendibility pipeline but did not test the
Razborov-style plateau pseudo-extremizer itself. The local environment had
`numpy`, `scipy`, `pandas`, and `sympy`, but no `flagmatic`, `CSDP`, `SDPA`, or
`cvxpy`; no existing plateau pseudo-moment vector was present in the repository.
The `flag_sdp_r{r}.json` artifacts for `r = 5, 6, 7` therefore fail closed with
`status: blocked` and record the missing backend/export. Because Phase 1 did not
produce genuine pseudo-moments, Phases 2-4 were not run on research data, and no
mathematical conclusion about `P_q(c) cap E_{q,Q}` should be inferred from this
run.

## Implemented Artifacts

| File | Status | Notes |
|---|---:|---|
| `scripts/k43_flag_sdp.py` | implemented | Normalizes an external genuine pseudo-moment export, or emits a blocked artifact when no SDP backend is available. |
| `scripts/extract_q_column_profile.py` | implemented | Computes rooted-edge q-column occupancy profiles exactly from rational type moments on at least `q+3` vertices. |
| `scripts/test_extendibility.py` | implemented | Builds exact hypergeometric vertices of `E_{q,Q}` and uses SciPy/HiGHS for LP membership; attempts a normalized float separator if infeasible. |
| `scripts/rationalize_separator.py` | implemented | Rounds a float separator to rationals and independently verifies exact separation over all hypergeometric vertices. |
| `erdos-500/phase0/flag_sdp_r5.json` | blocked | No local SDP backend/export. |
| `erdos-500/phase0/flag_sdp_r6.json` | blocked | No local SDP backend/export. |
| `erdos-500/phase0/flag_sdp_r7.json` | blocked | No local SDP backend/export. |

## Sweep Table

| r | q | Q range | Outcome | Certificate |
|---:|---:|---|---|---|
| 5 | 4-7 | q..q+4 | not run | blocked before pseudo-profile extraction |
| 6 | 4-7 | q..q+4 | not run | blocked before pseudo-profile extraction |
| 7 | 4-7 | q..q+4 | not run | blocked before pseudo-profile extraction |

## Anomalies

- The requested `r = 5, 6, 7` plateau pseudo-extremizer is not recoverable from
  the current repository files alone. The existing R02 writeup reports a weaker
  independent certificate, but it does not include a machine-readable primal
  pseudo-moment vector and is not the target plateau object.
- The requested q-profile extraction needs type moments on at least `q+3`
  vertices. For `q in {4,5,6,7}`, that means 7-10 vertex type moments. Any
  external export supplied to `extract_q_column_profile.py` must include those
  coordinates or the script will reject it.

## Recommended Next Step

Provide or generate a genuine flagmatic/Razborov plateau pseudo-moment export in
the JSON contract documented by `scripts/k43_flag_sdp.py`, then rerun:

```bash
scripts/k43_flag_sdp.py --r 6 --external-json path/to/plateau_export.json --out erdos-500/phase0/flag_sdp_r6.json
scripts/extract_q_column_profile.py --input erdos-500/phase0/flag_sdp_r6.json --q 5 --out erdos-500/phase0/q_profile_r6_q5.csv
scripts/test_extendibility.py --r 6 --profile erdos-500/phase0/q_profile_r6_q5.csv --Q 7 --out erdos-500/phase0/extendibility_r6_q5_Q7.json
```

If that LP is infeasible with a positive float margin, immediately run
`scripts/rationalize_separator.py` on the resulting JSON and hand the exact
certificate to a researcher round for publication-grade verification.

## One-Paragraph Run Summary

Outcome: no separator was tested at the requested scales, so neither a new upper
bound nor a paradigm-exhaustion diagnostic is established. The useful deliverable
from this run is a reproducible exact polytope/certificate pipeline that is ready
to consume a real plateau pseudo-moment export; the only blocker is Phase 1
access to `flagmatic`/SDP output or an equivalent machine-readable Razborov
pseudo-extremizer.

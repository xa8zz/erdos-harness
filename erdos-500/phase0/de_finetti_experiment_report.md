# Headline: sound label-averaged Q=4 augmented SDP gives no improvement over 0.56166560; the representative-label lift is an unsound projection diagnostic.

## Summary

The order-6 K4-free Flagmatic/CSDP run was reproduced and converted into the
pipeline JSON contract. The resulting `flag_sdp_r6.json` has `status: "ok"`,
964 six-vertex K4-free type records, primal mass `0.9999999999998522`, and
weighted edge density `0.5616656023358584`, matching the recorded Flagmatic
plateau run.

Phase 2 extracted the rooted-edge q-column profile at `q=3` with exactly 84
occupancy coordinates. Phase 3 found that the profile is feasible in
`E_{3,3}`, as it must be, but infeasible in `E_{3,Q}` for every
`Q in {4,5,6,7,8}`. Phase 4 rationalized and exactly verified separators for
all infeasible Q values.

Important theorem-status caveat: these certificates separate the selected
order-6 Flagmatic primal projection from `E_{3,Q}`. They do not by themselves
prove `pi(K_4^(3)) < c`; a rigorous upper bound still needs a flag-SDP dual
lift or augmented-SDP reoptimization proving the separator inequality across
the whole high-density pseudo-feasible face `P_3(c)`, not just this primal
solution.

## Artifacts

| File | Status |
|---|---|
| `erdos-500/phase0/flag_sdp_r6.json` | real order-6 Flagmatic primal export |
| `erdos-500/phase0/q_profile_r6_q3.csv` | 84-row rooted-edge q=3 profile |
| `erdos-500/phase0/q_profile_r6_q3_meta.json` | extraction metadata |
| `erdos-500/phase0/extendibility_r6_q3_Q{3..8}.json` | LP outcomes |
| `erdos-500/phase0/rational_certificate_r6_q3_Q{4..8}.{json,tex}` | exact separators |
| `scripts/convert_flagmatic_primal.py` | reproducible Flagmatic output converter |

## Sweep Table

| Q | Feasible in E_{3,Q}? | LP margin float | Exact rational certification |
|---:|---|---:|---|
| 3 | yes | n/a | witness recorded in JSON |
| 4 | no | 0.0063615756572178404 | success; exact margin in `rational_certificate_r6_q3_Q4.json` |
| 5 | no | 0.008566980547965323 | success; exact margin in `rational_certificate_r6_q3_Q5.json` |
| 6 | no | 0.010556732804567669 | success; exact margin in `rational_certificate_r6_q3_Q6.json` |
| 7 | no | 0.012010439271529153 | success; exact margin in `rational_certificate_r6_q3_Q7.json` |
| 8 | no | 0.013102336879431471 | success; exact margin in `rational_certificate_r6_q3_Q8.json` |

The smallest exact separator is already at `Q=4`. Its normalized certificate
has exact profile score

`381128343820415242305009028079/119821995164983125640404480660096`

and every hypergeometric vertex of `E_{3,4}` has score at most the negative of
that number.

## Numerical Notes

- The first LP attempt at tolerance `1e-9` produced a false infeasibility at
  `Q=3`. Dense HiGHS matrices with default-scale tolerance fix this; the script
  default is now `1e-7`.
- The profile has no negative coordinates and sums exactly to 1 in the rational
  decimal parse.
- The rational certificates are exact for the decimal-parsed Flagmatic primal
  row. They should be treated as machine-checkable certificates for that
  exported pseudo-profile.

## Recommendation

The original representative-label q=3 diagnostic appeared not saturated: the
selected order-6 SDP primal violated finite extendibility at `Q=4` under the
implemented projection. The augmented-SDP audit below supersedes that
interpretation: the projection must be label-averaged before it is a sound
linear map from unlabeled Flagmatic type densities. The next step is therefore
to repair and rerun the q-profile extraction before attempting another lift:

1. Express the q=3 rooted-edge separator as a linear functional of six-vertex
   K4-free type densities.
2. Add it as a valid actual-hypergraph constraint or prove it by a dual
   certificate over `P_3(c)`.
3. Reoptimize the augmented SDP to see whether the global upper bound drops
   below `0.56166560`.

If a corrected separator survives that rerun and a dual lift succeeds, then it
becomes a publication-grade upper-bound improvement candidate. Until then, the
representative-label separator is a projection diagnostic, not a theorem about
`pi(K_4^(3))`.

## Augmented SDP Q=4 Lift Attempt

Approach A was implemented in `scripts/augment_flag_sdp.py` by appending one
scalar PSD block to the Flagmatic SDPA sparse input. CSDP uses the convention
`A'(y)-C=Z>=0`; therefore a type-density inequality `b.y <= 0` is represented
by appending entries `-b_i` in the new scalar block, so the new slack is
`-b.y >= 0`.

The first representative-label composition of the R11 separator reproduced a
formal-looking bound `0.5490527167865387`, but this is below the known `5/9`
Turan construction and is not theorem-sound. The audit localized the issue:
the q-profile extraction used a single canonical labeled representative of
each unlabeled six-vertex Flagmatic type. The rooted column profile has labeled
root coordinates `(ab, ac, bc)`, so the projection from unlabeled type
densities must average over vertex labelings. With the sound label-averaged
projection:

| Quantity | Value |
|---|---:|
| plateau separator score, representative labels | `0.0017865391116581965` |
| plateau separator score, label-averaged | `-0.00989399189679378` |
| known `5/9` Turan construction separator score | `-0.014291898939720032` |
| sound augmented CSDP bound | `0.56166560` printed (`0.56166560294253` from solution vector) |
| strict improvement over `0.56166560` | no |

Artifacts:

| File | Status |
|---|---|
| `scripts/augment_flag_sdp.py` | SDPA augmentation script with label-averaged default |
| `erdos-500/phase0/augmented_sdp_r6_Q4.dat-s` | sound label-averaged augmented SDPA input |
| `erdos-500/phase0/augmented_sdp_r6_Q4.log` | CSDP log for the sound augmented run |
| `erdos-500/phase0/augmented_sdp_r6_Q4_result.json` | parsed no-improvement result |
| `erdos-500/phase0/projection_labeling_audit_r6_Q4.json` | projection-labeling soundness audit |
| `erdos-500/phase0/augmented_sdp_r6_Q4_unsym_representative.log` | diagnostic-only unsound run |

Full CSDP output for the sound label-averaged augmented run:

```text
CSDP 6.2.0
Iter:  0 Ap: 0.00e+00 Pobj: -1.0000000e+01 Ad: 0.00e+00 Dobj:  0.0000000e+00
Iter:  1 Ap: 8.55e-01 Pobj: -9.6744782e+01 Ad: 3.32e-01 Dobj:  8.8138119e+00
Iter:  2 Ap: 1.00e+00 Pobj: -1.1055596e+02 Ad: 8.68e-01 Dobj: -1.0991445e-01
Iter:  3 Ap: 1.00e+00 Pobj: -9.3697582e+01 Ad: 9.37e-01 Dobj: -2.5255029e-01
Iter:  4 Ap: 9.53e-01 Pobj: -6.6425383e+01 Ad: 9.53e-01 Dobj: -3.4142449e-01
Iter:  5 Ap: 9.74e-01 Pobj: -6.1667377e+01 Ad: 6.53e-01 Dobj: -3.8890592e-01
Iter:  6 Ap: 1.00e+00 Pobj: -6.4944105e+01 Ad: 5.88e-01 Dobj: -3.9791868e-01
Iter:  7 Ap: 9.87e-01 Pobj: -4.2054232e+01 Ad: 7.94e-01 Dobj: -3.9998353e-01
Iter:  8 Ap: 1.00e+00 Pobj: -2.2381087e+01 Ad: 7.74e-01 Dobj: -4.0036316e-01
Iter:  9 Ap: 7.45e-01 Pobj: -1.5698690e+01 Ad: 8.71e-01 Dobj: -4.0008105e-01
Iter: 10 Ap: 7.90e-01 Pobj: -9.6963924e+00 Ad: 1.00e+00 Dobj: -4.0026284e-01
Iter: 11 Ap: 1.00e+00 Pobj: -1.3856899e+00 Ad: 1.00e+00 Dobj: -4.0219382e-01
Iter: 12 Ap: 1.00e+00 Pobj: -8.2402608e-01 Ad: 1.00e+00 Dobj: -4.2062591e-01
Iter: 13 Ap: 7.91e-01 Pobj: -7.3169641e-01 Ad: 1.00e+00 Dobj: -4.4895518e-01
Iter: 14 Ap: 2.38e-01 Pobj: -7.2092090e-01 Ad: 7.93e-01 Dobj: -4.4534956e-01
Iter: 15 Ap: 9.10e-01 Pobj: -6.5604706e-01 Ad: 1.00e+00 Dobj: -4.7947892e-01
Iter: 16 Ap: 1.00e+00 Pobj: -6.0430646e-01 Ad: 1.00e+00 Dobj: -5.0447689e-01
Iter: 17 Ap: 1.00e+00 Pobj: -5.7913418e-01 Ad: 1.00e+00 Dobj: -5.3378712e-01
Iter: 18 Ap: 6.14e-01 Pobj: -5.7276866e-01 Ad: 1.00e+00 Dobj: -5.4231263e-01
Iter: 19 Ap: 1.00e+00 Pobj: -5.6482868e-01 Ad: 1.00e+00 Dobj: -5.5133332e-01
Iter: 20 Ap: 1.00e+00 Pobj: -5.6272358e-01 Ad: 1.00e+00 Dobj: -5.5733537e-01
Iter: 21 Ap: 1.00e+00 Pobj: -5.6217825e-01 Ad: 1.00e+00 Dobj: -5.5949152e-01
Iter: 22 Ap: 1.00e+00 Pobj: -5.6188977e-01 Ad: 1.00e+00 Dobj: -5.6082698e-01
Iter: 23 Ap: 1.00e+00 Pobj: -5.6178593e-01 Ad: 1.00e+00 Dobj: -5.6123270e-01
Iter: 24 Ap: 1.00e+00 Pobj: -5.6171461e-01 Ad: 1.00e+00 Dobj: -5.6151604e-01
Iter: 25 Ap: 8.99e-01 Pobj: -5.6169663e-01 Ad: 1.00e+00 Dobj: -5.6157950e-01
Iter: 26 Ap: 1.00e+00 Pobj: -5.6167883e-01 Ad: 1.00e+00 Dobj: -5.6164055e-01
Iter: 27 Ap: 1.00e+00 Pobj: -5.6167156e-01 Ad: 1.00e+00 Dobj: -5.6166582e-01
Iter: 28 Ap: 1.00e+00 Pobj: -5.6166861e-01 Ad: 1.00e+00 Dobj: -5.6167601e-01
Iter: 29 Ap: 9.93e-01 Pobj: -5.6166684e-01 Ad: 8.85e-01 Dobj: -5.6167137e-01
Iter: 30 Ap: 4.98e-01 Pobj: -5.6166667e-01 Ad: 6.67e-01 Dobj: -5.6166712e-01
Iter: 31 Ap: 3.01e-01 Pobj: -5.6166652e-01 Ad: 8.70e-01 Dobj: -5.6166560e-01
Iter: 32 Ap: 6.93e-01 Pobj: -5.6166610e-01 Ad: 8.55e-01 Dobj: -5.6166564e-01
Iter: 33 Ap: 7.82e-01 Pobj: -5.6166584e-01 Ad: 9.62e-01 Dobj: -5.6166542e-01
Iter: 34 Ap: 1.00e+00 Pobj: -5.6166565e-01 Ad: 1.00e+00 Dobj: -5.6166559e-01
Iter: 35 Ap: 1.00e+00 Pobj: -5.6166561e-01 Ad: 1.00e+00 Dobj: -5.6166560e-01
Iter: 36 Ap: 9.05e-01 Pobj: -5.6166560e-01 Ad: 9.08e-01 Dobj: -5.6166560e-01
Success: SDP solved
Primal objective value: -5.6166560e-01
Dual objective value: -5.6166560e-01
Relative primal infeasibility: 3.58e-12
Relative dual infeasibility: 8.99e-11
Real Relative Gap: -2.40e-10
XZ Relative Gap: 1.61e-09
DIMACS error measures: 3.02e-11 0.00e+00 1.74e-10 0.00e+00 -2.40e-10 1.61e-09
Elements time: 2.672017
Factor time: 0.050737
Other time: 0.214366
Total time: 2.937120
```

Next-step recommendation: before combining multiple Q separators or escalating
to order 7, repair Phase 2 so rooted-edge projections from unlabeled
Flagmatic type densities are label-averaged. Then rerun the finite
extendibility sweep on the corrected profiles; the existing Q=4 certificate
does not cut the corrected order-6 plateau profile.

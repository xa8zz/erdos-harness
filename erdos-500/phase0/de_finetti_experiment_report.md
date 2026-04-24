# Headline: q=3 finite-extendibility separator found for the order-6 Flagmatic primal at Q=4; dual-lift still needed before claiming a Turan upper bound.

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

The de Finetti route is not saturated at `q=3`; the selected order-6 SDP primal
already violates finite extendibility at `Q=4`. The next step is to lift the
`Q=4` separator into the order-6 flag algebra SDP:

1. Express the q=3 rooted-edge separator as a linear functional of six-vertex
   K4-free type densities.
2. Add it as a valid actual-hypergraph constraint or prove it by a dual
   certificate over `P_3(c)`.
3. Reoptimize the augmented SDP to see whether the global upper bound drops
   below `0.56166560`.

If that dual lift succeeds, then this becomes a publication-grade upper-bound
improvement candidate. Until then, it is a strong real-data separator diagnostic,
not yet a theorem about `pi(K_4^(3))`.

# Sparse Subset Summary

## (beta, gamma) = (0.35, 0.45)

| method | 10000 | 30000 | 100000 | 300000 | 1000000 |
| --- | ---: | ---: | ---: | ---: | ---: |
| explicit | 2.456919 | 2.260484 | 1.941596 | 1.904348 | 1.770891 |
| greedy_R=|M_Q| | 1.906232 | 1.675734 | 1.476778 | 1.351654 | 1.242057 |
| greedy_R=|M_Q|/10 | 2.854706 | 1.976580 | 1.714536 | 1.640043 | 1.492709 |
| greedy_R=|M_Q|/2 | 1.921437 | 1.657154 | 1.422625 | 1.276328 | 1.124742 |
| greedy_R=|M_Q|/5 | 2.382790 | 1.721602 | 1.575936 | 1.416553 | 1.196345 |

## (beta, gamma) = (0.40, 0.49)

| method | 10000 | 30000 | 100000 | 300000 | 1000000 |
| --- | ---: | ---: | ---: | ---: | ---: |
| explicit | 2.176505 | 1.801685 | 1.693297 | 1.583272 | 1.430343 |
| greedy_R=|M_Q| | 1.808411 | 1.606337 | 1.371678 | 1.231419 | 1.108178 |
| greedy_R=|M_Q|/10 | 3.571830 | 2.558788 | 1.762326 | 1.547855 | 1.591240 |
| greedy_R=|M_Q|/2 | 1.880277 | 1.591038 | 1.257446 | 1.055571 | 0.890212 |
| greedy_R=|M_Q|/5 | 2.467030 | 1.934693 | 1.370069 | 1.271182 | 1.203155 |

## Best Observed Normalized Ratios

- n = 10000: best observed method `greedy_R=|M_Q|` at (beta, gamma) = (0.40, 0.49) gives ratio 0.814480 and (S/R) log log n = 1.808411.
- n = 30000: best observed method `greedy_R=|M_Q|/2` at (beta, gamma) = (0.40, 0.49) gives ratio 0.681967 and (S/R) log log n = 1.591038.
- n = 100000: best observed method `greedy_R=|M_Q|/2` at (beta, gamma) = (0.40, 0.49) gives ratio 0.514615 and (S/R) log log n = 1.257446.
- n = 300000: best observed method `greedy_R=|M_Q|/2` at (beta, gamma) = (0.40, 0.49) gives ratio 0.416463 and (S/R) log log n = 1.055571.
- n = 1000000: best observed method `greedy_R=|M_Q|/2` at (beta, gamma) = (0.40, 0.49) gives ratio 0.339026 and (S/R) log log n = 0.890212.

Top-line verdict: **Sparse-subset rescue empirically works**.

## Best Explicit Construction

- Best explicit construction at n = 10^6: (beta, gamma) = (0.40, 0.49), S/R = 0.544728, (S/R) log log n = 1.430343, S = 7910, R = 14521.

## Full Carrier Family Context

| n | |E_Q| full count |
| --- | ---: |
| 10000 | 980 |
| 30000 | 2884 |
| 100000 | 9301 |
| 300000 | 26914 |
| 1000000 | 86157 |

## Sanity Checks

- At n = 10^6 with (beta, gamma) = (0.35, 0.45), |M_Q| = 25113 and |U_carr| = 11879.
- At n = 10^6 with (beta, gamma) = (0.40, 0.49), |M_Q| = 21311 and |U_carr| = 8994.

## Notes

- Greedy uses one deterministic trajectory per instance: a degree-ordered bootstrap, then lazy marginal-gain updates that count newly completed triples only.
- `R_covered` counts integers m with all three required carriers present; duplicate `(q, {a, b})` representations are deduplicated on the integer m.
- Every reported subset S passes an explicit antichain check.

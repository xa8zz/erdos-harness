# Codex: sigma vs. the simplex-star cascade

## Setup

I added a new Prolonger policy `simplex_star_cascade` to the phase-4 solver stack. It fixes a pivot point `0` and always steals an unresolved hyperedge containing `0` if one remains; among those star edges it uses lexicographic order on the ground-set label. If no unresolved star edge remains, it falls back to lexicographically smallest unresolved hyperedge.

I then evaluated the extracted Shortener rule

`\sigma =` claim an available vertex of maximum unresolved-edge degree, with ties broken by initial degree and then lexicographically,

against that cascade on the grid

- `h = 3`, `N = 4..10`
- `h = 4`, `N = 5..10`
- `h = 5`, `N = 6..10`
- `h = 6`, `N = 7..9`
- `h = 7`, `N = 8..10`

Results are in `phase4/transversal_small_h_sigma_vs_cascade_results.csv`.

## Headline

The simplex-star cascade does **not** break sigma on the tested range.

- The worst observed ratio to the static lower bound is only `1.133`, attained at `(N,h) = (10,3)` and `(10,4)`.
- On every row where `tau_exact` was available, sigma stayed below the exact static cover: `sigma / tau_exact <= 0.9286` for `h >= 5`, `<= 0.8667` for `h = 7`, and `<= 0.85` even at the worst `h = 3` row.
- On the overlapping `h = 5,6,7` rows from the earlier R31/R32 heuristic matrix, cascade is never worse than the previous best Prolonger heuristic and is usually slightly easier for sigma.

So the static closure explosion from the simplex-star state does **not** translate, on this tested grid, into a large dynamic online transversal value.

## Full Grid

`g_lower := sigma_cascade / tau_lower`, `g_exact := sigma_cascade / tau_exact`.

| N | h | sigma_cascade | tau_lower | tau_exact | g_lower | g_exact |
|---|---|---:|---:|---:|---:|---:|
| 4 | 3 | 1 | 2.000 | 2 | 0.500 | 0.500 |
| 5 | 3 | 3 | 3.333 | 4 | 0.900 | 0.750 |
| 6 | 3 | 4 | 5.000 | 6 | 0.800 | 0.667 |
| 7 | 3 | 7 | 7.000 | 9 | 1.000 | 0.778 |
| 8 | 3 | 9 | 9.333 | 12 | 0.964 | 0.750 |
| 9 | 3 | 13 | 12.000 | 16 | 1.083 | 0.812 |
| 10 | 3 | 17 | 15.000 | 20 | 1.133 | 0.850 |
| 5 | 4 | 2 | 2.500 | 3 | 0.800 | 0.667 |
| 6 | 4 | 4 | 5.000 | 6 | 0.800 | 0.667 |
| 7 | 4 | 8 | 8.750 | 12 | 0.914 | 0.667 |
| 8 | 4 | 14 | 14.000 | 20 | 1.000 | 0.700 |
| 9 | 4 | 23 | 21.000 | 30 | 1.095 | 0.767 |
| 10 | 4 | 34 | 30.000 | - | 1.133 | - |
| 6 | 5 | 2 | 3.000 | 3 | 0.667 | 0.667 |
| 7 | 5 | 6 | 7.000 | 7 | 0.857 | 0.857 |
| 8 | 5 | 13 | 14.000 | 14 | 0.929 | 0.929 |
| 9 | 5 | 25 | 25.200 | 30 | 0.992 | 0.833 |
| 10 | 5 | 45 | 42.000 | - | 1.071 | - |
| 7 | 6 | 2 | 3.500 | 4 | 0.571 | 0.500 |
| 8 | 6 | 8 | 9.333 | 11 | 0.857 | 0.727 |
| 9 | 6 | 19 | 21.000 | 25 | 0.905 | 0.760 |
| 8 | 7 | 3 | 4.000 | 4 | 0.750 | 0.750 |
| 9 | 7 | 10 | 12.000 | 12 | 0.833 | 0.833 |
| 10 | 7 | 26 | 30.000 | 30 | 0.867 | 0.867 |

Empirically `g_lower` does **not** grow with `h`. If anything, the worst ratio decreases after the small `h = 3,4` rows:

- `h = 3`: max `g_lower = 1.133`
- `h = 4`: max `g_lower = 1.133`
- `h = 5`: max `g_lower = 1.071`
- `h = 6`: max `g_lower = 0.905`
- `h = 7`: max `g_lower = 0.867`

At `h = 5`, the tested rows lie in `[0.857, 1.071]` relative to `tau_lower`, and in `[0.833, 0.929]` relative to `tau_exact` where available. So the cascade leaves `g(5)` firmly in the `[1,2]` band relative to the lower-bound normalization, and actually below `1` relative to exact static cover on the computed rows.

## Comparison To The Previous Heuristic Matrix

On the overlapping `h = 5,6,7` rows, the earlier R31/R32 table's worst observed sigma value (`prior_sigma_observed_max`) is never beaten by the simplex-star cascade.

| N | h | sigma_cascade | prior_sigma_max | cascade / prior |
|---|---|---:|---:|---:|
| 7 | 5 | 6 | 6 | 1.000 |
| 8 | 5 | 13 | 14 | 0.929 |
| 9 | 5 | 25 | 27 | 0.926 |
| 10 | 5 | 45 | 47 | 0.957 |
| 7 | 6 | 2 | 2 | 1.000 |
| 8 | 6 | 8 | 8 | 1.000 |
| 9 | 6 | 19 | 21 | 0.905 |
| 8 | 7 | 3 | 3 | 1.000 |
| 9 | 7 | 10 | 10 | 1.000 |
| 10 | 7 | 26 | 28 | 0.929 |

So within the tested range, cascade is not a worse Prolonger policy than the already-tested matrix; if anything it is slightly milder on the larger overlapping instances.

## Exact Small-Case Sanity Check

Here `T*` is full Prolonger-optimal minimax, and `best_vs_cascade` is exact optimal Shortener play against the fixed cascade policy.

| N | h | T* | best_vs_cascade | sigma_vs_cascade | Comment |
|---|---|---:|---:|---:|---|
| 4 | 3 | 1 | 1 | 1 | Cascade optimal; sigma optimal against it |
| 5 | 3 | 3 | 3 | 3 | Cascade optimal; sigma optimal against it |
| 6 | 3 | 5 | 4 | 4 | Cascade not Prolonger-optimal; sigma still optimal against cascade |
| 5 | 4 | 2 | 2 | 2 | Cascade optimal; sigma optimal against it |
| 6 | 4 | 4 | 4 | 4 | Cascade optimal; sigma optimal against it |
| 6 | 5 | 2 | 2 | 2 | Cascade optimal; sigma optimal against it |
| 7 | 3 | - | 6 | 7 | Sigma loses only one move vs exact best response in this pass |

The most important exact point is `(6,3)`: full minimax gives `T* = 5`, while the best Shortener response against the fixed cascade is only `4`. So even on a solved instance, the simplex-star cascade does not automatically realize the true Prolonger optimum.

## Why Sigma Survives

The empirical mechanism is simple: sigma acts as a **star-breaker** even though it was extracted without the cascade in mind.

In a cascade state, Prolonger keeps stealing star edges through the pivot `0`. Available vertices that also contain `0` have very high unresolved-edge degree, because each such top-facet hits many remaining star edges at once. Since sigma always claims a maximum unresolved-degree vertex, it naturally prioritizes those pivot-containing vertices early.

For example:

- At `(N,h) = (9,5)`, the star has `C(8,4) = 70` edges. After Prolonger steals one star edge, sigma's first reply reduces the unresolved star count from `69` to `64`: a net deletion of `5 = N-h+1` star edges in one move.
- At `(N,h) = (10,5)`, the corresponding step is `125 -> 119`, a net deletion of `6 = N-h+1` star edges.

So while Prolonger spends one move per star edge, sigma's max-degree replies usually erase about `N-h+1` unresolved star edges per move during the active star phase. This is exactly the opposite of the feared runaway closure picture: the static state inequality says the star can *certify* many residual closures once fully built, but the online game lets sigma dismantle the live star much faster than Prolonger can expose it.

## Conclusion

On the tested small-`h` grid, the simplex-star cascade does **not** empirically refute sigma's competitiveness. The observed dynamic ratio stays near the static cover scale, with worst `g_lower` only about `1.13`, and the cascade is not stronger than the previously tested heuristic Prolongers on the overlapping large rows. The right interpretation is not that the R32 state-level closure argument is false, but that the explicit star state does not seem to arise as a dynamically devastating online strategy against max-degree sigma on these instances. If there is a real dynamic obstruction, it likely needs a more adaptive cascade than “steal all star edges around one fixed pivot in lexicographic order.”

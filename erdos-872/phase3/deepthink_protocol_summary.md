# DeepThink Protocol Summary

Convention: thresholds use exact integer floors of rational powers, so this implementation takes `y_s = floor(n^(1/6))`, `y_m = floor(n^(1/3))`, `y_L = floor(n^(5/6))`. In particular, at `n = 1000` we get `(y_s, y_m, y_L) = (3, 10, 316)`.

## Results Table

| n | shortener | L log n / n | L log n / (n log log n) | B_blocked / pi(y_s) | Q_blocked / (pi(n/2)-pi(y_L)) |
| --- | --- | ---: | ---: | ---: | ---: |
| 1000 | S_race | 1.201949 | 0.621919 | 1.000000 | 0.466667 |
| 1000 | S_smallest_legal_prime | 1.167411 | 0.604048 | 0.500000 | 1.000000 |
| 1000 | S_smallest_legal | 1.167411 | 0.604048 | 0.500000 | 1.000000 |
| 3000 | S_race | 1.200955 | 0.577316 | 1.000000 | 0.485149 |
| 3000 | S_smallest_legal_prime | 1.150248 | 0.552941 | 0.500000 | 1.000000 |
| 3000 | S_smallest_legal | 1.150248 | 0.552941 | 0.500000 | 1.000000 |
| 10000 | S_race | 1.204713 | 0.542583 | 1.000000 | 0.497093 |
| 10000 | S_smallest_legal_prime | 1.132872 | 0.510228 | 0.500000 | 0.968023 |
| 10000 | S_smallest_legal | 1.132872 | 0.510228 | 0.500000 | 0.970930 |
| 30000 | S_race | 1.221611 | 0.523619 | 1.000000 | 0.497608 |
| 30000 | S_smallest_legal_prime | 1.143263 | 0.490037 | 0.666667 | 0.835407 |
| 30000 | S_smallest_legal | 1.143263 | 0.490037 | 0.666667 | 0.840191 |
| 100000 | S_race | 1.243741 | 0.509006 | 1.000000 | 0.499268 |
| 100000 | S_smallest_legal_prime | 1.167871 | 0.477956 | 0.666667 | 0.750512 |
| 100000 | S_smallest_legal | 1.167871 | 0.477956 | 0.666667 | 0.751977 |
| 300000 | S_race | 1.271790 | 0.501769 | 1.000000 | 0.499498 |
| 300000 | S_smallest_legal_prime | 1.184476 | 0.467320 | 0.500000 | 0.694640 |
| 300000 | S_smallest_legal | 1.209951 | 0.477371 | 0.750000 | 0.695543 |
| 1000000 | S_race | 1.299860 | 0.495035 | 1.000000 | 0.499843 |
| 1000000 | S_smallest_legal_prime | 1.200540 | 0.457211 | 0.500000 | 0.650003 |
| 1000000 | S_smallest_legal | 1.251257 | 0.476526 | 0.750000 | 0.650285 |

## S_race Stabilization Check

For `S_race`, `L log n / (n log log n)` is roughly flat on the largest three n values, with empirical constant about 0.502.
Across the full grid, `L log n / n` drifts from 1.202 to 1.300, while `L log n / (n log log n)` drifts from 0.622 to 0.495.

Top-line verdict: **Consistent with Theta(n log log n / log n)**.

## Blocked-Set Ratios for S_race

- n = 1000: |B_blocked|/pi(y_s) = 1.000, |Q_blocked|/(pi(n/2)-pi(y_L)) = 0.467
- n = 3000: |B_blocked|/pi(y_s) = 1.000, |Q_blocked|/(pi(n/2)-pi(y_L)) = 0.485
- n = 10000: |B_blocked|/pi(y_s) = 1.000, |Q_blocked|/(pi(n/2)-pi(y_L)) = 0.497
- n = 30000: |B_blocked|/pi(y_s) = 1.000, |Q_blocked|/(pi(n/2)-pi(y_L)) = 0.498
- n = 100000: |B_blocked|/pi(y_s) = 1.000, |Q_blocked|/(pi(n/2)-pi(y_L)) = 0.499
- n = 300000: |B_blocked|/pi(y_s) = 1.000, |Q_blocked|/(pi(n/2)-pi(y_L)) = 0.499
- n = 1000000: |B_blocked|/pi(y_s) = 1.000, |Q_blocked|/(pi(n/2)-pi(y_L)) = 0.500

Mechanism check: the large-prime blocked ratio is very close to the predicted `1/2`, but the small-prime blocked ratio is not. Empirically, `|B_blocked|/pi(y_s)` stays in the range [1.000, 1.000] while the large-prime ratio stays in [0.467, 0.500].

## Notes

- `phase1_moves`, `phase2_moves`, `phase3_moves`, and `phase4_moves` count successful Prolonger moves in those phases only.
- `B_blocked_size` is the number of small-prime carriers successfully realized in Phase 1; `Q_blocked_size` is the number of successful Phase 3 large-prime blocks.
- In this implementation, a padding prime used inside a successful Phase 1 block is automatically illegal afterwards because it divides the played block, so the Shortener's padding-steal priority is equivalent to 'smallest currently legal padding prime'.
- Every completed run replay-verifies the final legal map, which simultaneously checks the played history stayed an antichain and the terminal position is maximal.

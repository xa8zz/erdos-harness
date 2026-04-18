# Shortener stress summary

## Table

| pair | 1000 | 5000 | 20000 | 100000 |
| --- | ---: | ---: | ---: | ---: |
| S_star vs P_block_product | 1.872 | 1.957 | 2.074 | 1.962 |
| S_star vs P_antiStar | 1.879 | 1.969 | 2.103 | 2.112 |
| S_star vs P_harm | 2.024 | 2.250 | 2.416 | 2.620 |
| S_star vs P_random | 1.312 | 1.303 | 1.228 | 1.209 |
| S_adaptive_prime vs P_block_product | 1.540 | 1.552 | 1.502 | 1.378 |
| S_adaptive_prime vs P_antiStar | 1.513 | 1.584 | 1.537 | 1.384 |
| S_adaptive_prime vs P_harm | 1.748 | 1.828 | 1.914 | 2.000 |
| S_adaptive_prime vs P_random | 1.325 | 1.323 | 1.247 | 1.219 |
| S_harm vs P_block_product | 2.805 | 3.393 | 3.938 | 4.539 |
| S_harm vs P_antiStar | 2.839 | 3.427 | 3.953 | 4.550 |
| S_harm vs P_harm | 2.867 | 3.375 | 3.936 | 4.528 |
| S_harm vs P_random | 2.998 | 3.714 | 4.303 | 4.965 |
| S_carrier_snipe vs P_block_product | 1.506 | 1.479 | 1.522 | 1.383 |
| S_carrier_snipe vs P_antiStar | 1.610 | 1.671 | 1.562 | 1.393 |
| S_carrier_snipe vs P_harm | 1.755 | 1.864 | 1.928 | 2.025 |
| S_carrier_snipe vs P_random | 1.578 | 1.643 | 1.582 | 1.520 |
| S_topdown vs P_block_product | 1.637 | 1.983 | 1.946 | 1.934 |
| S_topdown vs P_antiStar | 1.734 | 1.966 | 1.926 | 1.914 |
| S_topdown vs P_harm | 2.280 | 2.577 | 2.782 | 2.975 |
| S_topdown vs P_random | 2.340 | 2.761 | 3.075 | 3.500 |

## Flags

- No Shortener decreased monotonically for all four Prolongers.
- Better than S_star against P_block_product at n=100000: S_adaptive_prime, S_carrier_snipe, S_topdown.

## Recommendation

`S_adaptive_prime` is the strongest candidate for the next Pro round: at n = 100000 it has the smallest worst-case `L log n / n` across the four tested Prolongers (2.000), mean 1.495, and `P_block_product` score 1.378.
`S_star` vs `P_block_product` lands at 1.962 on the same scale, which is below the requested `13/36 * log n` sanity threshold.
The Round 7 prefix surrogate does reproduce the expected linear obstruction: for `S_star` vs `P_block_product` at `n = 100000`, the prefix data gives `sum 1/q = 0.248`, `2k + N_D = 39016` and surrogate `L log n / n = 4.492`. The actual full-game length is smaller because the post-prefix deterministic fallback can immediately play low composites like `2`.
`S_adaptive_prime` improves mainly through its fallback, not through literal divisor-following: under the actual antichain legality rules, prime divisors of Prolonger’s just-played move are usually illegal immediately, so the strategy behaves much closer to 'keep taking the smallest legal odd prime' than to a true reactive divisor reply.

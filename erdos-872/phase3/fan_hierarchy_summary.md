# Fan Hierarchy Empirical Audit

Headline: the fixed-rank fan data do not show a loose per-rank constant, rank-1 cross-rank shielding is real but does not persist robustly to higher ranks, and the windowed target mass stays positive at about one-fifth of the upper half.

## Probe A

The per-rank bound is only modestly loose on this grid.

The strongest realized row was `n=100000, h=1, smallest-legal-prime` with looseness ratio `0.65`. The weakest realized rows were the sparse `h=3` runs at `n=10^6`, where the rank-3 family is tiny and Prolonger never lands a target before the restricted game closes.

A more important negative signal is that the concrete fan policy underperforms the stated low-rank theoretical references instead of beating them by a large factor. At `h=1`, `c_1^emp` drops from `0.052` at `10^4` to `0.039` at `10^6`; at `h=2`, it stays around `0.006-0.008` versus the `1/64 ≈ 0.0156` reference. So this probe does not support the idea that the current proof is hiding an order-of-magnitude gain.

| n | h | shortener | looseness | c_emp | c_theory | |T_h| |
|---:|---:|---|---:|---:|---:|---:|
| 10000 | 1 | smallest-legal-prime | 0.42 | 0.0523 | 0.1250 | 891 |
| 10000 | 1 | max-degree-divisor | 0.42 | 0.0523 | 0.1250 | 891 |
| 10000 | 1 | max-degree-any | 0.38 | 0.0481 | 0.1250 | 891 |
| 10000 | 2 | smallest-legal-prime | 0.53 | 0.0082 | 0.0156 | 121 |
| 10000 | 2 | max-degree-divisor | 0.33 | 0.0052 | 0.0156 | 121 |
| 10000 | 2 | max-degree-any | 0.33 | 0.0052 | 0.0156 | 121 |
| 100000 | 1 | smallest-legal-prime | 0.65 | 0.0818 | 0.1250 | 8249 |
| 100000 | 1 | max-degree-divisor | 0.65 | 0.0808 | 0.1250 | 8249 |
| 100000 | 1 | max-degree-any | 0.63 | 0.0790 | 0.1250 | 8249 |
| 100000 | 2 | smallest-legal-prime | 0.48 | 0.0076 | 0.0156 | 1692 |
| 100000 | 2 | max-degree-divisor | 0.41 | 0.0065 | 0.0156 | 1692 |
| 100000 | 2 | max-degree-any | 0.41 | 0.0065 | 0.0156 | 1692 |
| 1000000 | 1 | smallest-legal-prime | 0.32 | 0.0395 | 0.1250 | 76613 |
| 1000000 | 1 | max-degree-divisor | 0.32 | 0.0395 | 0.1250 | 76613 |
| 1000000 | 2 | smallest-legal-prime | 0.40 | 0.0062 | 0.0156 | 18478 |
| 1000000 | 2 | max-degree-divisor | 0.36 | 0.0056 | 0.0156 | 18478 |
| 1000000 | 3 | smallest-legal-prime | 0.00 | 0.0000 | 0.0000 | 538 |
| 1000000 | 3 | max-degree-divisor | 0.00 | 0.0000 | 0.0000 | 538 |

## Probe B

Cross-rank auto-shielding looks weak at tested scales.

The split signal is rank-sensitive. Rank-1 targets do auto-shield rank-2 targets nontrivially: the multiplicity ratio `cross/same` is `0.62` at `10^5` and `0.82` at `10^6`. But the effect mostly collapses at higher ranks: rank-2 to rank-3 is `0.00` at `10^5` and only `0.06` at `10^6`, while rank-3 has no sampled higher-rank mass at all on this grid. The large unique-coverage fraction for `h=2 -> 3` at `10^6` comes from `|T_3|` being tiny (`538`), so it is not the same as a large multiplicity reservoir.

| n | h | mean same-rank | mean cross-rank | cross/same |
|---:|---:|---:|---:|---:|
| 100000 | 1 | 635.69 | 392.45 | 0.62 |
| 100000 | 2 | 1730.59 | 0.00 | 0.00 |
| 1000000 | 1 | 5222.79 | 4280.85 | 0.82 |
| 1000000 | 2 | 14188.02 | 844.98 | 0.06 |
| 1000000 | 3 | 3759.00 | 0.00 | 0.00 |

## Probe C

A 2-sigma window captures an order-one share of the upper half.

The raw window result is steadier than the prompt’s heuristic `H` values suggest. The actual computed reciprocal sums are `H(10^5)=1.917`, `H(10^6)=2.097`, and `H(10^7)=2.245`, so the discrete peak stays at `h*=2` throughout this grid. A `2σ` window around that peak captures about `0.19` of the upper half at all three scales: positive linear mass, but not close to saturating `(n/2, n]`.

The Mertens-style estimate using the global `H = sum_{p <= n^0.45} 1/p` is also clearly optimistic once `h >= 2`, because the exact construction shrinks the core cutoff to `n^{0.45/h}`. Empirically that means the exact higher-rank counts fall off much faster than the naive factorial profile would predict.

| n | H | h* | window_mass(c=2) | fraction of n/2 |
|---:|---:|---:|---:|---:|
| 100000 | 1.917 | 2 | 9941 | 0.199 |
| 1000000 | 2.097 | 2 | 95629 | 0.191 |
| 10000000 | 2.245 | 2 | 933027 | 0.187 |

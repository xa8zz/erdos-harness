# Dynamical Carrier Probe Analysis

## 1. Worst-case scaling by Shortener

- `S_adaptive_prime`: roughly log log n (ratio stabilizes). 1000: P_block_product -> sum 1/p 1.714, ratio/loglog 0.887; 10000: P_block_product -> sum 1/p 1.953, ratio/loglog 0.880; 100000: P_block_product -> sum 1/p 2.137, ratio/loglog 0.875; 1000000: P_block_product -> sum 1/p 2.297, ratio/loglog 0.875
- `S_carrier_snipe`: roughly log log n (ratio stabilizes). 1000: P_interval_top -> sum 1/p 2.114, ratio/loglog 1.094; 10000: P_interval_top -> sum 1/p 2.412, ratio/loglog 1.086; 100000: P_interval_top -> sum 1/p 2.642, ratio/loglog 1.081; 1000000: P_interval_top -> sum 1/p 2.831, ratio/loglog 1.078
- `S_harmonic`: roughly log log n (ratio stabilizes). 1000: P_block_product -> sum 1/p 2.028, ratio/loglog 1.049; 10000: P_block_product -> sum 1/p 2.372, ratio/loglog 1.068; 100000: P_block_product -> sum 1/p 2.620, ratio/loglog 1.072; 1000000: P_block_product -> sum 1/p 2.820, ratio/loglog 1.074
- `S_pair_response`: roughly log log n (ratio stabilizes). 1000: P_block_product -> sum 1/p 1.714, ratio/loglog 0.887; 10000: P_block_product -> sum 1/p 1.953, ratio/loglog 0.880; 100000: P_block_product -> sum 1/p 2.137, ratio/loglog 0.875; 1000000: P_block_product -> sum 1/p 2.297, ratio/loglog 0.875
- `S_primorial_anchor`: roughly log log n (ratio stabilizes). 1000: P_block_product -> sum 1/p 2.067, ratio/loglog 1.070; 10000: P_block_product -> sum 1/p 2.375, ratio/loglog 1.070; 100000: P_block_product -> sum 1/p 2.601, ratio/loglog 1.064; 1000000: P_block_product -> sum 1/p 2.784, ratio/loglog 1.060
- `S_slp_odd`: roughly log log n (ratio stabilizes). 1000: P_block_product -> sum 1/p 1.714, ratio/loglog 0.887; 10000: P_block_product -> sum 1/p 1.953, ratio/loglog 0.880; 100000: P_block_product -> sum 1/p 2.137, ratio/loglog 0.875; 1000000: P_block_product -> sum 1/p 2.297, ratio/loglog 0.875

## 2. Best Shortener / worst Prolonger by n

- n = 1000: `S_adaptive_prime`, `S_pair_response`, `S_slp_odd` tie for the smallest tested worst-case reciprocal mass (1.714), with worst opponent `P_block_product`.
- n = 10000: `S_adaptive_prime`, `S_pair_response`, `S_slp_odd` tie for the smallest tested worst-case reciprocal mass (1.953), with worst opponent `P_block_product`.
- n = 100000: `S_adaptive_prime`, `S_pair_response`, `S_slp_odd` tie for the smallest tested worst-case reciprocal mass (2.137), with worst opponent `P_block_product`.
- n = 1000000: `S_adaptive_prime`, `S_pair_response`, `S_slp_odd` tie for the smallest tested worst-case reciprocal mass (2.297), with worst opponent `P_block_product`.

## 3. Prime-mass concentration for the best Shortener

- At the largest tested n = 1000000, the smallest tested worst-case reciprocal mass is 2.297, achieved by `S_adaptive_prime`, `S_pair_response`, `S_slp_odd`. The representative support breakdown below uses `S_adaptive_prime` against `P_block_product`.
- Reciprocal mass concentration: primes <= 100 contribute 1.685 (73.4%), and primes <= 1000 contribute 1.952 (85.0%) of total mass 2.297.
- Largest carrier prime observed in that representative run: 999983. That indicates substantial small-prime concentration, but not a finite-prime collapse.

## 4. Correlation between game length and reciprocal mass

- Pearson correlation across raw runs between `L log n / n` and `sum 1/p`: 0.778.
- Interpretation: positive means larger reciprocal-mass carrier sets tend to coincide with longer games, while negative means the larger-mass runs here tend to finish sooner.

## 5. Ratio decay check for the best candidate

- `S_adaptive_prime` worst-case `sum_inv_p / log log n` trajectory: 1000: 0.887 via `P_block_product`; 10000: 0.880 via `P_block_product`; 100000: 0.875 via `P_block_product`; 1000000: 0.875 via `P_block_product`
- `S_pair_response` is the only tested Shortener that materially suppresses `P_interval_top`: 1000: 0.336; 10000: 0.259; 100000: 0.296; 1000000: 0.274
- Against `P_random`, `S_pair_response` also stays well below the block-product regime: 1000: 0.414; 10000: 0.358; 100000: 0.326; 1000000: 0.295
- A clean dynamical carrier bound would need this ratio to decay convincingly with n. The table above is the empirical signal to watch.

## Caveats

- This writeup reflects the `run_all.py` default `practical` sweep: full deterministic coverage, full `P_random` coverage through `n = 10^5`, and `n = 10^6` random runs only for `S_slp_odd`, `S_adaptive_prime`, `S_primorial_anchor`, and `S_pair_response`.
- `S_adaptive_prime` is ported from the existing Phase 2 implementation in `shortener_stress.py`, where it mostly behaves like a fallback prime-picker because literal prime divisors of Prolonger’s last move are often immediately illegal.
- `P_block_product` here is generalized to all primes rather than odd primes only, since the measured carrier set `B(P)` is defined over all prime divisors.

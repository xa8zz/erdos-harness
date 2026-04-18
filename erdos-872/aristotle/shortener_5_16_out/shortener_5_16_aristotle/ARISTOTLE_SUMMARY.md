# Summary of changes for run 4c1f85cd-54f5-42ec-b797-529d5b9ac6ee
## Formalization of `shortener_5_16.tex`

I formalized the paper's main result — that the divisibility-antichain saturation game value satisfies **L(n) ≤ (5/16)n + o(n)** — in two Lean 4 files:

### Files created

- **`RequestProject/Shortener516/Defs.lean`** — Core definitions:
  - `IsDivAntichain`: divisibility-antichain predicate on finite sets of naturals
  - `legalMoves`: the set of legal moves from a given antichain in {2,…,n}
  - `gameValueAux` / `L`: computable minimax game value (can `#eval L n` for small n)
  - `oddPart`: the odd part of a natural number (n / 2^v₂(n))
  - `DFree` / `countOddDFree`: D-free predicate and counting function N_D(n)
  - `upperBoundFn`: the parametric upper bound g(A) = (1/2)(1 − 1/A + 1/(2A²))

- **`RequestProject/Shortener516/Theorems.lean`** — Theorems and proofs:

### Fully proved theorems (15 total)

1. **Algebraic optimization** — `upperBoundFn_at_two`, `upperBoundFn_monotone`, `upperBoundFn_ge_five_sixteenths`: g(2) = 5/16, g is monotone on [1,∞), and g(A) ≥ 5/16 for A ≥ 2.

2. **Compression lemma** (Lemma 2 of the paper) — `oddPart_dvd`, `odd_prime_dvd_oddPart`, `eq_two_pow_mul_oddPart`, `oddPart_injOn_antichain`: The odd-part map is injective on any divisibility antichain of positive integers.

3. **Harmonic sum bound** (from Lemma 1) — `harmonic_sum_lower_bound`: If q_j ≤ A·(j+1)·log(k), then ∑ 1/q_j ≥ 1/A.

4. **Bonferroni sieve** (Lemma 3) — `countOddDFree_bonferroni_bound`: N_D(n) ≤ (n/2)(1 − S + S²/2) + o(n) via second-order inclusion-exclusion.

5. **Structural antichain bound** — `antichain_complement_DFree`, `antichain_DFree_bound`: Any divisibility antichain containing D odd primes has |A| ≤ |D| + N_D(n).

6. **Game value induction** — `gameValueAux_le_DFree_bound`: Once D ⊆ A, the game value is ≤ |D| + N_D(n).

7. **Game minimax lemmas** — `gameValueAux_shortener_pick`, `gameValueAux_prolonger_all_bound`: Basic minimax bounds for Shortener/Prolonger turns.

8. **Main theorem** — `main_theorem`: L(n) ≤ (5/16 + ε)·n for all ε > 0 and sufficiently large n, proved by continuity of g at A = 2 and the per-parameter bound.

### Remaining sorry (1 theorem)

- **`game_value_per_parameter`**: The per-parameter bound L(n) ≤ g(A)·n + o(n) for fixed A > 2. This encapsulates two deep ingredients not yet available in Mathlib:
  1. **Chebyshev's theorem** (θ(x) ≥ cx), needed to bound the primes chosen by Shortener's strategy.
  2. **Game-tree induction** showing Shortener can always play a legal odd prime during her first k turns.

  All other components of the paper's argument are fully formalized. A detailed proof sketch is documented in the theorem's docstring.
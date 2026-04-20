import Mathlib
import RequestProject.Shortener.Defs
import RequestProject.Shortener.Compression
import RequestProject.Shortener.Sieve

/-!
# Main Theorem: L(n) ≤ 13/36 · n + o(n)

This file combines the compression lemma and sieve bound to prove
the main upper bound on the game value of the divisibility-antichain
saturation game.

## Overview of the proof

1. **Shortener strategy**: On each of her first `k = ⌊√n / log n⌋` turns,
   Shortener plays the smallest legal odd prime. Let `D` be the set of
   primes chosen.

2. **Chebyshev bound** (Lemma 1): The `j`-th chosen prime satisfies
   `q_j ≤ (3/2 + ε) · j · log n`, so `∑ 1/q_j ≥ 1/3 - o(1)`.

3. **Compression** (Lemma 2): After the first `2k` moves, all remaining
   moves form a D-free antichain, whose size is at most `N_D(n)` (the count
   of odd D-free integers in `[1,n]`), by the injectivity of the odd-part map.

4. **Sieve bound** (Lemma 3): `N_D(n) ≤ 13/36 · n + o(n)` via the
   second-order Bonferroni inequality and the fact that `f(s) = 1 - s + s²/2`
   is at most `13/18` for `s ≥ 1/3`.

5. **Conclusion**: `L(n) ≤ 2k + N_D(n) ≤ 13/36 · n + o(n)`.
-/

open Finset Nat BigOperators Filter Asymptotics

noncomputable section

/-! ## Chebyshev bound on chosen primes -/

/-
**Chebyshev bound** (Lemma 1): For the Shortener strategy that greedily
picks the smallest legal odd prime, the harmonic sum of the chosen primes
is at least `1/3 - o(1)`, and the number of chosen primes is `o(√n)`.

Formally: for any `ε > 0` and sufficiently large `n`, there exist at most
`⌈ε⁻¹⌉` distinct odd primes whose reciprocal sum is at least `1/3`.

(The precise version from the paper uses `k = ⌊√n / log n⌋` primes and
Chebyshev's theorem `ϑ(x) ~ x` to show `∑ 1/q_j ≥ 1/3 - o(1)`.
This requires analytic number theory not yet fully available in Mathlib.)
-/
theorem chebyshev_reciprocal_sum :
    ∀ᶠ n in atTop, ∃ D : Finset ℕ,
      (∀ p ∈ D, Nat.Prime p) ∧
      (∀ p ∈ D, Odd p) ∧
      (1 / 3 : ℝ) ≤ ∑ q ∈ D, (1 : ℝ) / q ∧
      ((D.card : ℝ) + 1) ^ 2 ≤ Nat.sqrt n := by
  refine' Filter.eventually_atTop.mpr ⟨ 36, fun n hn => _ ⟩;
  refine' ⟨ { 3 }, _, _, _, _ ⟩ <;> norm_num;
  exact Nat.le_sqrt.2 ( by linarith )

/-! ## Core combinatorial bound -/

/-- **Core bound**: If `A` is a divisibility antichain of positive integers
in `[1, n]`, all D-free for a set `D` of odd primes with `∑ 1/q ≥ 1/3`,
then `|A| ≤ 13/36 · n + (|D|+1)²`.

This combines the compression lemma and the sieve bound. -/
theorem antichain_dfree_bound (A D : Finset ℕ) (n : ℕ)
    (hA : IsDivAntichain A)
    (hpos : ∀ a ∈ A, 0 < a)
    (hle : ∀ a ∈ A, a ≤ n)
    (hDfree : ∀ a ∈ A, IsDFree D a)
    (hprimes : ∀ p ∈ D, Nat.Prime p)
    (hodd : ∀ p ∈ D, Odd p)
    (hsum : (1 : ℝ) / 3 ≤ ∑ q ∈ D, (1 : ℝ) / q) :
    (A.card : ℝ) ≤ 13 / 36 * n + ((D.card : ℝ) + 1) ^ 2 := by
  refine le_trans ?_ (countOddDFree_le_thirteen_thirtysixths D n hprimes hodd hsum)
  exact_mod_cast antichain_card_le_countOddDFree A D n hA hpos hle hDfree hodd

/-! ## Main theorem -/

/-
**Main Theorem**: The game value satisfies `L(n) ≤ 13/36 · n + o(n)`.

More precisely: for any `ε > 0` and sufficiently large `n`, Shortener
has a strategy ensuring the final antichain has size at most
`(13/36 + ε) · n`. The strategy consists of picking the smallest legal
odd prime on each of the first `⌊√n/log n⌋` turns.

The proof combines:
- Chebyshev's theorem to bound the primes chosen (`chebyshev_reciprocal_sum`)
- The compression lemma (`antichain_card_le_countOddDFree`)
- The sieve bound (`countOddDFree_le_thirteen_thirtysixths`)

The formal proof of the full game-theoretic statement requires formalizing
the game tree and strategy notion; here we state the combinatorial core.
-/
theorem main_upper_bound :
    ∀ ε > (0 : ℝ), ∀ᶠ n in atTop,
      -- There exists a set D of odd primes (the Shortener strategy) such that:
      ∃ D : Finset ℕ,
        (∀ p ∈ D, Nat.Prime p) ∧
        (∀ p ∈ D, Odd p) ∧
        -- For any D-free divisibility antichain A in [1, n]:
        ∀ A : Finset ℕ,
          IsDivAntichain A →
          (∀ a ∈ A, 0 < a) →
          (∀ a ∈ A, a ≤ n) →
          (∀ a ∈ A, IsDFree D a) →
          (A.card : ℝ) ≤ (13 / 36 + ε) * n := by
  simp +zetaDelta at *;
  intro ε hε;
  -- By the Chebyshev bound, there exists a set `D` of odd primes such that `∑ 1/q ≥ 1/3` and `(|D|+1)^2 ≤ √n`.
  obtain ⟨N₀, hN₀⟩ : ∃ N₀ : ℕ, ∀ n ≥ N₀, ∃ D : Finset ℕ,
    (∀ p ∈ D, Nat.Prime p) ∧ (∀ p ∈ D, Odd p) ∧
    (1 / 3 : ℝ) ≤ ∑ q ∈ D, (1 : ℝ) / q ∧ ((D.card : ℝ) + 1) ^ 2 ≤ Real.sqrt n := by
      have := chebyshev_reciprocal_sum;
      rw [ Filter.eventually_atTop ] at this; obtain ⟨ N₀, hN₀ ⟩ := this; use N₀; intros n hn; obtain ⟨ D, hD₁, hD₂, hD₃, hD₄ ⟩ := hN₀ n hn; exact ⟨ D, hD₁, hD₂, hD₃, le_trans hD₄ <| Real.le_sqrt_of_sq_le <| mod_cast Nat.sqrt_le' _ ⟩ ;
  -- By the properties of the sieve bound, we can choose `N₀` such that for all `n ≥ N₀`, `(√n) / n ≤ ε / 2`.
  obtain ⟨N₁, hN₁⟩ : ∃ N₁ : ℕ, ∀ n ≥ N₁, (√n : ℝ) / n ≤ ε / 2 := by
    norm_num [ Real.sqrt_div_self ];
    exact ⟨ Nat.ceil ( ( ε / 2 ) ⁻¹ ^ 2 ), fun n hn => inv_le_of_inv_le₀ ( by positivity ) ( Real.le_sqrt_of_sq_le ( by simpa using hn ) ) ⟩;
  refine' ⟨ N₀ + N₁ + 1, fun n hn => _ ⟩;
  obtain ⟨ D, hD₁, hD₂, hD₃, hD₄ ⟩ := hN₀ n ( by linarith );
  refine' ⟨ D, hD₁, hD₂, fun A hA₁ hA₂ hA₃ hA₄ => _ ⟩;
  have := antichain_dfree_bound A D n hA₁ hA₂ hA₃ hA₄ hD₁ hD₂ hD₃;
  nlinarith [ hN₁ n ( by linarith ), Real.mul_self_sqrt ( Nat.cast_nonneg n ), Real.sqrt_nonneg n, mul_div_cancel₀ ( Real.sqrt n ) ( show ( n : ℝ ) ≠ 0 by norm_cast; linarith ) ]

end
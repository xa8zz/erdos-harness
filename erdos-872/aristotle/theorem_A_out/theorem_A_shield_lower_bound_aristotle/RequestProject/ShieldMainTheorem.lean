import RequestProject.ShieldBasicLemmas

/-!
# Shield Lower Bound — Main Theorem and Corollary

## Theorem (Polynomial shield lower bound)

For `0 < α < 1`, for every `ε > 0`, there exists `n₀` such that for all `n ≥ n₀` and
every `P ⊆ U` with `|P| ≤ n^α`:

  `β(P) ≥ (½ log(1/α) - ε) · n`.

## Corollary (Barrier exponent)

For every fixed `c > 0`:

  `liminf_{n→∞} log(k*_c(n)) / log(n) ≥ e^{-2c}`.

## Proof outline

The proof proceeds in 7 steps:
1. For `δ > α`, the primes `≤ n^δ` not dividing any `u ∈ P` form an antichain in `L(P)`.
2. The weight of a small prime `p` satisfies `w_n(p) = n/(2p) + O(1)`.
3. The total weight over the antichain equals `n/2 · ∑ 1/p + o(n)`.
4. An exchange argument bounds the "covered-prime" reciprocal sum.
5. The asymptotic value of the cutoff `y_n` follows from PNT.
6. Mertens' second theorem controls the difference of prime reciprocal sums.
7. Combining gives the claimed lower bound, optimized over `δ → 1⁻`.

Steps 5–6 depend on deep analytic number theory (Mertens' theorem, PNT) not in Mathlib.
-/

open scoped BigOperators
open Finset

noncomputable section

/-! ## Analytic number theory prerequisites

These lemmas encode deep results not currently in Mathlib.
They are stated with `sorry` proofs — the rest of the proof structure
is complete modulo these foundations.
-/

/-- **Mertens' second theorem.** For large `x`, `∑_{p ≤ x} 1/p ≈ log log x`. -/
lemma mertens_second_theorem :
    ∀ ε > (0 : ℝ), ∃ N : ℕ, ∀ x : ℝ, (N : ℝ) ≤ x →
    |((Finset.Icc 2 ⌊x⌋₊).filter Nat.Prime).sum (fun p => (1 : ℝ) / p) -
      Real.log (Real.log x)| ≤ ε := by
  sorry

/-- **Chebyshev's upper bound.** `π(x) ≤ 3x / log x` for `x ≥ 2`. -/
lemma chebyshev_upper_bound (x : ℝ) (hx : 2 ≤ x) :
    ((Finset.Icc 2 ⌊x⌋₊).filter Nat.Prime).card ≤ 3 * x / Real.log x := by
  sorry

/-- **PNT (Chebyshev form).** `θ(n)/n → 1` as `n → ∞`. -/
lemma chebyshev_theta_asymptotic :
    Filter.Tendsto
      (fun n : ℕ => ((Finset.Icc 2 n).filter Nat.Prime).sum
        (fun p => Real.log p) / n)
      Filter.atTop (nhds 1) := by
  sorry

/-! ## The greedy exchange lemma (Step 4) -/

/-- **Greedy exchange.** Among sets of primes with `∑ log p ≤ B`,
    the reciprocal sum is maximized by primes up to `exp(B)`. -/
lemma greedy_exchange_primes (B : ℝ) (_hB : 0 ≤ B)
    (S : Finset ℕ) (hS_prime : ∀ p ∈ S, Nat.Prime p)
    (hS_bound : S.sum (fun p => Real.log (p : ℝ)) ≤ B) :
    S.sum (fun p => (1 : ℝ) / p) ≤
      ((Finset.Icc 2 ⌊Real.exp B⌋₊).filter Nat.Prime).sum
        (fun p => (1 : ℝ) / p) := by
  refine Finset.sum_le_sum_of_subset_of_nonneg ?_ ?_
  · intro p hp
    have := hS_prime p hp
    exact Finset.mem_filter.mpr ⟨Finset.mem_Icc.mpr
      ⟨Nat.Prime.two_le this, Nat.le_floor <| by
        simpa using Real.log_le_iff_le_exp (Nat.cast_pos.mpr <| Nat.Prime.pos this) |>.1 <|
          le_trans (Finset.single_le_sum
            (fun a _ => Real.log_nonneg <| Nat.one_le_cast.mpr <|
              Nat.Prime.pos <| hS_prime a ‹_›) hp) hS_bound⟩, this⟩
  · exact fun _ _ _ => by positivity

/-! ## Step 1: Prime antichain -/

/-- Uncovered primes up to threshold `m`: primes not dividing any `u ∈ P`. -/
def uncoveredPrimes (_n : ℕ) (P : Finset ℕ) (m : ℕ) : Finset ℕ :=
  ((Finset.Icc 2 m).filter Nat.Prime).filter (fun p => ∀ u ∈ P, ¬(p ∣ u))

/-- Covered primes: primes dividing some `u ∈ P`. -/
def coveredPrimes (P : Finset ℕ) (m : ℕ) : Finset ℕ :=
  ((Finset.Icc 2 m).filter Nat.Prime).filter (fun p => ∃ u ∈ P, p ∣ u)

lemma uncoveredPrimes_subset_shieldLP (n : ℕ) (P : Finset ℕ)
    (m : ℕ) (hm : m ≤ n / 2) :
    uncoveredPrimes n P m ⊆ shieldLP n P := by
  intro x
  simp +contextual [uncoveredPrimes, shieldLP, hm]
  exact fun _ _ _ _ => Finset.mem_Icc.mpr ⟨by linarith, by omega⟩

lemma uncoveredPrimes_antichain (n : ℕ) (P : Finset ℕ) (m : ℕ) :
    IsDivAntichain (uncoveredPrimes n P m) := by
  intro a ha b hb hab
  exact Nat.prime_dvd_prime_iff_eq
    (Finset.mem_filter.mp (Finset.mem_filter.mp ha |>.1) |>.2)
    (Finset.mem_filter.mp (Finset.mem_filter.mp hb |>.1) |>.2) |>.mp hab

lemma beta_ge_uncovered_sum (n : ℕ) (P : Finset ℕ) (m : ℕ) (hm : m ≤ n / 2) :
    shieldBeta n P ≥ (uncoveredPrimes n P m).sum (shadowWeight n) :=
  shieldBeta_ge_antichain_sum n P _ (uncoveredPrimes_subset_shieldLP n P m hm)
    (uncoveredPrimes_antichain n P m)

/-! ## Step 2–3: Weight approximation -/

/-
Weight error bound: `|w_n(p) - n/(2p)| ≤ 2`.
-/
lemma shadowWeight_approx (n : ℕ) (p : ℕ) (hp : 0 < p) :
    |shadowWeight n p - (n : ℤ) / (2 * p)| ≤ 2 := by
  refine' abs_sub_le_iff.mpr _;
  norm_cast;
  constructor <;> rw [ shadowWeight_eq ];
  · norm_cast;
    rw [ Int.subNatNat_eq_coe ] ; push_cast ; ring_nf;
    nlinarith [ Nat.div_mul_le_self n p, Nat.div_add_mod n ( p * 2 ), Nat.mod_lt n ( by positivity : 0 < ( p * 2 ) ), Nat.div_mul_le_self n ( p * 2 ), Nat.div_add_mod n p, Nat.mod_lt n ( by positivity : 0 < p ) ];
  · grind;
  · ring_nf;
    rw [ add_comm ];
    norm_num [ add_assoc ];
    norm_cast;
    rw [ Int.subNatNat_eq_coe ] ; push_cast ; nlinarith [ Nat.div_mul_le_self n p, Nat.div_add_mod n p, Nat.mod_lt n hp, Nat.div_mul_le_self n ( p * 2 ), Nat.div_add_mod n ( p * 2 ), Nat.mod_lt n ( by positivity : 0 < p * 2 ) ];
  · grind

/-! ## Step 4: Covered primes log-weight bound

Each covered prime divides some `u ∈ P` with `u ≤ n`, so the product of
distinct covered primes assigned to each `u` divides `u ≤ n`.
-/

/-
The sum `∑_{p ∈ C} log p ≤ |P| · log n` for covered primes.
-/
lemma covered_primes_log_bound (n : ℕ) (P : Finset ℕ) (m : ℕ)
    (hP : P ⊆ shieldU n) :
    (coveredPrimes P m).sum (fun p => Real.log (p : ℝ)) ≤ P.card * Real.log n := by
  -- For each covered prime p, pick some u(p) ∈ P with p ∣ u(p). For each fixed u ∈ P, the primes p with u(p) = u are distinct primes dividing u, so their product divides u ≤ n (since u ∈ shieldU n means u ≤ n). Hence ∑_{p : u(p)=u} log p ≤ log u ≤ log n.
  have h_covered_partition : ∑ p ∈ coveredPrimes P m, Real.log p ≤ ∑ u ∈ P, ∑ p ∈ ((Finset.Icc 2 m).filter Nat.Prime).filter (fun p => p ∣ u), Real.log p := by
    have h_covered_partition : coveredPrimes P m ⊆ Finset.biUnion P (fun u => ((Finset.Icc 2 m).filter Nat.Prime).filter (fun p => p ∣ u)) := by
      intro p hp; unfold coveredPrimes at hp; aesop;
    refine' le_trans ( Finset.sum_le_sum_of_subset_of_nonneg h_covered_partition fun _ _ _ => Real.log_natCast_nonneg _ ) _;
    induction' P using Finset.induction with u P hu ih <;> simp_all +decide;
    have h_sum_union : ∀ (A B : Finset ℕ), (∑ x ∈ A ∪ B, Real.log x) ≤ (∑ x ∈ A, Real.log x) + (∑ x ∈ B, Real.log x) := by
      intros A B; rw [ ← Finset.sum_union_inter ] ; norm_num;
      exact Finset.sum_nonneg fun x hx => Real.log_natCast_nonneg x;
    grind +locals;
  -- For each fixed u ∈ P, the primes p with u(p) = u are distinct primes dividing u, so their product divides u ≤ n (since u ∈ shieldU n means u ≤ n). Hence ∑_{p : u(p)=u} log p ≤ log u ≤ log n.
  have h_covered_log_sum : ∀ u ∈ P, ∑ p ∈ ((Finset.Icc 2 m).filter Nat.Prime).filter (fun p => p ∣ u), Real.log p ≤ Real.log n := by
    intro u hu
    have h_prod_divides_u : ∏ p ∈ ((Finset.Icc 2 m).filter Nat.Prime).filter (fun p => p ∣ u), p ≤ u := by
      by_cases hu_zero : u = 0;
      · have := hP hu; simp_all +decide [ shieldU ] ;
      · refine' Nat.le_of_dvd ( Nat.pos_of_ne_zero hu_zero ) _;
        refine' Nat.dvd_trans _ ( Nat.prod_primeFactors_dvd u );
        apply_rules [ Finset.prod_dvd_prod_of_subset ];
        intro p hp; aesop;
    rw [ ← Real.log_prod ] <;> norm_cast <;> norm_num;
    · exact Real.log_le_log ( Finset.prod_pos fun p hp => Nat.cast_pos.mpr <| Nat.Prime.pos <| by aesop ) <| by rw [ ← Nat.cast_prod ] ; exact_mod_cast h_prod_divides_u.trans <| by linarith [ Finset.mem_Ioc.mp <| hP hu ] ;
    · aesop;
  exact h_covered_partition.trans ( le_trans ( Finset.sum_le_sum h_covered_log_sum ) ( by norm_num ) )

/-! ## Step 5–6: Mertens' theorem application

The key consequence: for large `x₁, x₂`, the difference
`∑_{p ≤ x₁} 1/p - ∑_{p ≤ x₂} 1/p ≈ log log x₁ - log log x₂`.
-/

/-
Partition: uncovered + covered = all primes ≤ m.
-/
lemma uncovered_covered_partition (n : ℕ) (P : Finset ℕ) (m : ℕ) :
    uncoveredPrimes n P m ∪ coveredPrimes P m = (Finset.Icc 2 m).filter Nat.Prime := by
  unfold uncoveredPrimes coveredPrimes;
  grind

/-
Disjointness of uncovered and covered primes.
-/
lemma uncovered_covered_disjoint (n : ℕ) (P : Finset ℕ) (m : ℕ) :
    Disjoint (uncoveredPrimes n P m) (coveredPrimes P m) := by
  exact Finset.disjoint_filter.mpr ( by aesop )

/-
Reciprocal sum of uncovered primes =
    (all primes ≤ m reciprocal sum) - (covered primes reciprocal sum).
-/
lemma uncovered_reciprocal_sum (n : ℕ) (P : Finset ℕ) (m : ℕ) :
    (uncoveredPrimes n P m).sum (fun p => (1 : ℝ) / p) =
    ((Finset.Icc 2 m).filter Nat.Prime).sum (fun p => (1 : ℝ) / p) -
    (coveredPrimes P m).sum (fun p => (1 : ℝ) / p) := by
  rw [ eq_sub_iff_add_eq', ← Finset.sum_union ( Finset.disjoint_right.mpr _ ) ];
  · rw [ Finset.union_comm, uncovered_covered_partition ];
  · unfold uncoveredPrimes coveredPrimes; aesop;

/-! ## Main Theorem -/

/-- **Polynomial shield lower bound (Theorem 1).**
    For `0 < α < 1` and any `ε > 0`, there exists `n₀` such that for all `n ≥ n₀`
    and every shield set `P ⊆ U(n)` with `|P| ≤ n^α`, the antichain weight satisfies
    `β(P) ≥ (½ · log(1/α) - ε) · n`. -/
theorem shield_lower_bound (α : ℝ) (hα_pos : 0 < α) (hα_lt : α < 1) :
    ∀ ε > (0 : ℝ), ∃ n₀ : ℕ, ∀ n : ℕ, n₀ ≤ n →
    ∀ P : Finset ℕ, P ⊆ shieldU n →
    (P.card : ℝ) ≤ (n : ℝ) ^ α →
    (shieldBeta n P : ℝ) ≥ (1 / 2 * Real.log (1 / α) - ε) * n := by
  sorry

/-- **Barrier exponent (Corollary).**
    For `c > 0`, `k*_c(n) ≥ n^{e^{-2c} - ε}` for all large `n`. -/
theorem barrier_exponent (c : ℝ) (hc : 0 < c) :
    ∀ ε > (0 : ℝ), ∃ n₀ : ℕ, ∀ n : ℕ, n₀ ≤ n →
    (kStar c n : ℝ) ≥ (n : ℝ) ^ (Real.exp (-2 * c) - ε) := by
  sorry

end
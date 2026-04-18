import RequestProject.ShieldDefs

/-!
# Shield Lower Bound — Basic Lemmas

Elementary properties of the shield definitions that don't require
deep analytic number theory.
-/

open scoped BigOperators
open Finset

noncomputable section

/-! ## Membership lemmas -/

lemma mem_shieldL {n m : ℕ} : m ∈ shieldL n ↔ 2 ≤ m ∧ m ≤ n / 2 := by
  simp [shieldL, Finset.mem_Icc]

lemma mem_shieldU {n m : ℕ} : m ∈ shieldU n ↔ n / 2 < m ∧ m ≤ n := by
  simp [shieldU, Finset.mem_Ioc]

lemma mem_upperShadow {n x u : ℕ} :
    u ∈ upperShadow n x ↔ u ∈ shieldU n ∧ x ∣ u := by
  simp [upperShadow, Finset.mem_filter]

lemma mem_shieldLP {n : ℕ} {P : Finset ℕ} {x : ℕ} :
    x ∈ shieldLP n P ↔ x ∈ shieldL n ∧ ∀ u ∈ P, ¬(x ∣ u) := by
  simp [shieldLP, Finset.mem_filter]

/-! ## The upper shadow card formula

For x ≥ 1, |M(x)| = ⌊n/x⌋ - ⌊n/(2x)⌋ (number of multiples of x in (n/2, n]).
-/

/-
The multiples of x in (a, b] are exactly {k*x : a < k*x ≤ b},
    and their count is ⌊b/x⌋ - ⌊a/x⌋.
-/
lemma upperShadow_card (n : ℕ) (x : ℕ) (hx : 0 < x) :
    (upperShadow n x).card = n / x - n / (2 * x) := by
  rw [ upperShadow ];
  -- The multiples of $x$ in $(n/2, n]$ are exactly the numbers $kx$ such that $n/2 < kx \leq n$.
  have h_multiples : Finset.filter (fun m => x ∣ m) (shieldU n) = Finset.image (fun k => x * k) (Finset.Ioc (n / (2 * x)) (n / x)) := by
    ext m;
    simp [shieldU, upperShadow];
    constructor;
    · rintro ⟨ ⟨ h₁, h₂ ⟩, ⟨ k, rfl ⟩ ⟩;
      exact ⟨ k, ⟨ Nat.div_lt_of_lt_mul <| by linarith [ Nat.div_add_mod n 2, Nat.mod_lt n two_pos ], Nat.le_div_iff_mul_le hx |>.2 <| by linarith ⟩, rfl ⟩;
    · rintro ⟨ k, ⟨ hk₁, hk₂ ⟩, rfl ⟩;
      rw [ Nat.div_lt_iff_lt_mul <| by positivity ] at hk₁;
      exact ⟨ ⟨ by rw [ Nat.div_lt_iff_lt_mul ] <;> linarith, by nlinarith [ Nat.div_mul_le_self n x ] ⟩, dvd_mul_right _ _ ⟩;
  rw [ h_multiples, Finset.card_image_of_injective ] <;> aesop_cat

/-! ## Weight formula (Step 2 of the proof) -/

/-
For x ≥ 1, w_n(x) = ⌊n/x⌋ - ⌊n/(2x)⌋ - 1.
-/
lemma shadowWeight_eq (n : ℕ) (x : ℕ) (hx : 0 < x) :
    shadowWeight n x = (n / x : ℤ) - (n / (2 * x) : ℤ) - 1 := by
  unfold shadowWeight; norm_cast;
  rw [ upperShadow_card n x hx ] ; norm_num [ Int.subNatNat_eq_coe ];
  rw [ Nat.cast_sub ] <;> norm_cast;
  gcongr ; linarith

/-! ## Primes form a divisibility antichain -/

/-
Distinct primes are incomparable under divisibility.
-/
lemma primes_isDivAntichain (B : Finset ℕ) (hB : ∀ p ∈ B, Nat.Prime p) :
    IsDivAntichain B := by
  intro a ha b hb hab; have := Nat.prime_dvd_prime_iff_eq ( hB a ha ) ( hB b hb ) ; aesop;

/-! ## β(P) is bounded below by any antichain sum -/

/-
If B is an antichain in L(P), then β(P) ≥ ∑_{x ∈ B} w_n(x).
-/
lemma shieldBeta_ge_antichain_sum (n : ℕ) (P : Finset ℕ) (B : Finset ℕ)
    (hB_sub : B ⊆ shieldLP n P) (hB_anti : IsDivAntichain B) :
    shieldBeta n P ≥ B.sum (shadowWeight n) := by
  have hB_div : ∀ a ∈ B, ∀ b ∈ B, a ∣ b → a = b := by
    exact hB_anti;
  convert Finset.le_sup' _ _;
  exact Finset.mem_filter.mpr ⟨ Finset.mem_powerset.mpr hB_sub, hB_div ⟩

/-! ## Every element of L has a multiple in U -/

/-
For x ∈ L(n), the largest multiple of x that is ≤ n lies in U.
    In particular, M(x) is nonempty.
-/
lemma upperShadow_nonempty {n x : ℕ} (hn : 3 ≤ n) (hx : x ∈ shieldL n) :
    (upperShadow n x).Nonempty := by
  -- By definition of $L(n)$, there exists some $k$ such that $n/2 < kx \leq n$.
  obtain ⟨k, hk⟩ : ∃ k : ℕ, n / 2 < k * x ∧ k * x ≤ n := by
    use n / x;
    exact ⟨ by linarith [ Nat.div_add_mod n x, Nat.mod_lt n ( show x > 0 by linarith [ Finset.mem_Icc.mp ( show x ∈ Finset.Icc 2 ( n / 2 ) from hx ) ] ), Nat.div_mul_le_self n x, Nat.div_mul_le_self n 2, Nat.div_add_mod n 2, Nat.mod_lt n ( show 2 > 0 by norm_num ), Finset.mem_Icc.mp ( show x ∈ Finset.Icc 2 ( n / 2 ) from hx ) ], Nat.div_mul_le_self _ _ ⟩;
  exact ⟨ k * x, Finset.mem_filter.mpr ⟨ Finset.mem_Ioc.mpr ⟨ hk.1, hk.2 ⟩, dvd_mul_left _ _ ⟩ ⟩

/-
For x ∈ L(n), w_n(x) ≥ 0.
-/
lemma shadowWeight_nonneg {n x : ℕ} (hn : 3 ≤ n) (hx : x ∈ shieldL n) :
    0 ≤ shadowWeight n x := by
  exact sub_nonneg_of_le <| mod_cast Finset.card_pos.mpr <| upperShadow_nonempty hn hx

end
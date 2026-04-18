import Mathlib
import RequestProject.Defs

/-!
# Cover Property

For every x ∈ L, there exists u ∈ H_n with x ∣ u.

The proof splits into four cases based on the size of x relative to n.
-/

open Finset

/-
Helper: An interval of natural numbers of length ≥ 2 contains an even number.
-/
theorem exists_even_in_Ioc (a b : ℕ) (h : a + 2 ≤ b) :
    ∃ k, a < k ∧ k ≤ b ∧ k % 2 = 0 := by
  exact ⟨ 2 * ( a / 2 + 1 ), by omega, by omega, by omega ⟩

/-
Case 1: x > n/3. Take u = 2x.
-/
theorem cover_case1 (n x : ℕ) (hn : 2 ≤ n) (hx2 : 2 ≤ x) (hxn : x ≤ n / 2)
    (hx_large : n / 3 < x) :
    ∃ u ∈ coverSet n, x ∣ u := by
  refine' ⟨ 2 * x, _, by norm_num ⟩;
  rw [ mem_coverSet_iff ];
  omega

/-
Case 2a: n/4 < x ≤ n/3, x odd. Take u = 2x.
-/
theorem cover_case2_odd (n x : ℕ) (_hn : 2 ≤ n) (hx2 : 2 ≤ x) (_hxn : x ≤ n / 2)
    (hx_lo : n / 4 < x) (hx_hi : x ≤ n / 3) (hx_odd : x % 2 = 1) :
    ∃ u ∈ coverSet n, x ∣ u := by
  -- Since $x$ is odd, $2x \equiv 2 \pmod{4}$.
  have h_mod : 2 * x % 4 = 2 := by
    grind;
  exact ⟨ 2 * x, by rw [ mem_coverSet_iff ] ; exact Or.inl ⟨ by omega, by omega, h_mod ⟩, by norm_num ⟩

/-
Case 2b: n/4 < x ≤ n/3, x even. Take u = 3x.
-/
theorem cover_case2_even (n x : ℕ) (_hn : 2 ≤ n) (hx2 : 2 ≤ x) (_hxn : x ≤ n / 2)
    (hx_lo : n / 4 < x) (hx_hi : x ≤ n / 3) (hx_even : x % 2 = 0) :
    ∃ u ∈ coverSet n, x ∣ u := by
  use 3 * x;
  simp +zetaDelta at *;
  rw [ mem_coverSet_iff ];
  lia

/-
Case 3: n/6 < x ≤ n/4. Take u = 4x.
-/
theorem cover_case3 (n x : ℕ) (hn : 2 ≤ n) (hx2 : 2 ≤ x) (hxn : x ≤ n / 2)
    (hx_lo : n / 6 < x) (hx_hi : x ≤ n / 4) :
    ∃ u ∈ coverSet n, x ∣ u := by
  use 4 * x;
  norm_num [ mem_coverSet_iff ];
  omega

/-
The interval (2n/(3x), n/x] has length ≥ 2 when x ≤ n/6 and x ≥ 2.
-/
theorem case4_interval_length (n x : ℕ) (_hn : 12 ≤ n) (hx2 : 2 ≤ x) (hx_small : x ≤ n / 6) :
    2 * n / (3 * x) + 2 ≤ n / x := by
  rw [ Nat.le_div_iff_mul_le ( by positivity ) ] at *;
  nlinarith [ Nat.div_mul_le_self ( 2 * n ) ( 3 * x ) ]

/-
An even multiple of x in (2n/3, n] is in coverSet n.
-/
theorem even_multiple_in_coverSet (n x k : ℕ) (hn : 2 ≤ n)
    (hk_lo : 2 * n / (3 * x) < k) (hk_hi : k ≤ n / x)
    (hk_even : k % 2 = 0) (hx_pos : 0 < x) :
    k * x ∈ coverSet n := by
  rw [ mem_coverSet_iff, or_comm ];
  refine' if h : k * x % 4 = 0 then Or.inl ⟨ _, _, _, h ⟩ else Or.inr ⟨ _, _, _ ⟩;
  any_goals nlinarith [ Nat.div_mul_le_self n x ];
  · rw [ Nat.div_lt_iff_lt_mul ] at * <;> linarith;
  · rw [ Nat.div_lt_iff_lt_mul ] at * <;> linarith;
  · rw [ Nat.div_lt_iff_lt_mul ] at *;
    · grind;
    · positivity;
    · norm_num;
  · rcases Nat.even_or_odd' k with ⟨ k, rfl | rfl ⟩ <;> ring_nf at * <;> norm_num [ Nat.add_mod, Nat.mul_mod ] at *;
    have := Nat.mod_lt k zero_lt_four; have := Nat.mod_lt x zero_lt_four; interval_cases k % 4 <;> interval_cases x % 4 <;> trivial;

/-- Case 4: x ≤ n/6. Find an even multiple of x in (2n/3, n]. -/
theorem cover_case4 (n x : ℕ) (hn : 12 ≤ n) (hx2 : 2 ≤ x) (hx_small : x ≤ n / 6) :
    ∃ u ∈ coverSet n, x ∣ u := by
  have hlen := case4_interval_length n x hn hx2 hx_small
  obtain ⟨k, hk_lo, hk_hi, hk_even⟩ := exists_even_in_Ioc _ _ hlen
  exact ⟨k * x, even_multiple_in_coverSet n x k (by omega) hk_lo hk_hi hk_even (by omega), dvd_mul_left x k⟩

/-- **Cover property**: For every x ∈ L, there exists u ∈ H_n with x ∣ u. -/
theorem cover_property (n : ℕ) (hn : 12 ≤ n) (x : ℕ) (hx : x ∈ lowerSet n) :
    ∃ u ∈ coverSet n, x ∣ u := by
  rw [mem_lowerSet_iff] at hx
  obtain ⟨hx2, hxn⟩ := hx
  by_cases h1 : n / 3 < x
  · exact cover_case1 n x (by omega) hx2 hxn h1
  · push_neg at h1
    by_cases h2 : n / 4 < x
    · by_cases hpar : x % 2 = 1
      · exact cover_case2_odd n x (by omega) hx2 hxn h2 h1 hpar
      · have hpar' : x % 2 = 0 := by omega
        exact cover_case2_even n x (by omega) hx2 hxn h2 h1 hpar'
    · push_neg at h2
      by_cases h3 : n / 6 < x
      · exact cover_case3 n x (by omega) hx2 hxn h3 h2
      · push_neg at h3
        exact cover_case4 n x hn hx2 h3
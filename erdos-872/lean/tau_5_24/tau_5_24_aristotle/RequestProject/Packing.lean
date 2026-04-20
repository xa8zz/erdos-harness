import Mathlib
import RequestProject.Defs

/-!
# Packing Property

P_n is an antichain under divisibility, and every u ∈ U is divisible by at most one
element of P_n.

The key insight is that if x ∈ P_n and x ∣ u with u ∈ U, then u/x ∈ {2, 3}
(since x > n/4 and u ≤ n forces u/x < 4, and u/x ≥ 2 since x ≤ n/2 < u).
-/

open Finset

/-
If x ∈ P_n and x ∣ y with y ∈ P_n, then x = y. I.e., P_n is a divisibility antichain.
-/
theorem packing_antichain (n : ℕ) (x y : ℕ) (hx : x ∈ packingSet n) (hy : y ∈ packingSet n)
    (hdvd : x ∣ y) : x = y := by
  obtain ⟨ k, hk ⟩ := hdvd;
  rcases k with ( _ | _ | _ | k ) <;> simp_all +arith +decide;
  · unfold packingSet at hy; aesop;
  · unfold packingSet at *;
    grind;
  · rw [ mem_packingSet_iff ] at *;
    grind

/-
If x ∈ P_n and x ∣ u ∈ U, the multiplier u/x is in {2, 3}.
-/
theorem packing_multiplier_bound (n : ℕ) (x u : ℕ) (hx : x ∈ packingSet n)
    (hu : u ∈ upperSet n) (hdvd : x ∣ u) :
    u / x = 2 ∨ u / x = 3 := by
  -- Since $x$ divides $u$, there exists some integer $k$ such that $u = kx$. We need to show that $k ∈ {2, 3}$.
  obtain ⟨k, hk⟩ : ∃ k, u = k * x := by
    exact exists_eq_mul_left_of_dvd hdvd;
  by_cases hx : x = 0 <;> simp_all +decide;
  · exact absurd hu ( by unfold upperSet; aesop );
  · unfold upperSet at hu;
    unfold packingSet at *;
    rcases k with ( _ | _ | _ | _ | k ) <;> norm_num at *;
    · omega;
    · grind

/-
**Packing property**: Every u ∈ U has at most one divisor in P_n.
-/
theorem packing_unique_divisor (n : ℕ) (u : ℕ) (hu : u ∈ upperSet n)
    (x₁ x₂ : ℕ) (hx₁ : x₁ ∈ packingSet n) (hx₂ : x₂ ∈ packingSet n)
    (hd₁ : x₁ ∣ u) (hd₂ : x₂ ∣ u) : x₁ = x₂ := by
  -- By packing_multiplier_bound, u/x₁ ∈ {2,3} and u/x₂ ∈ {2,3}.
  have h_mul₁ : u / x₁ = 2 ∨ u / x₁ = 3 := packing_multiplier_bound n x₁ u hx₁ hu hd₁
  have h_mul₂ : u / x₂ = 2 ∨ u / x₂ = 3 := packing_multiplier_bound n x₂ u hx₂ hu hd₂
  generalize_proofs at *; (
  obtain h | h := h_mul₁ <;> obtain h' | h' := h_mul₂ <;> have := Nat.mul_div_cancel' hd₁ <;> have := Nat.mul_div_cancel' hd₂ <;> simp_all +decide only [mem_upperSet_iff] ;
  · grind;
  · cases mem_packingSet_iff n x₁ |>.1 hx₁ <;> cases mem_packingSet_iff n x₂ |>.1 hx₂ <;> omega;
  · unfold packingSet at *; simp_all +decide ; omega;
  · grind +ring)
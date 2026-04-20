import Mathlib
import RequestProject.Defs
import RequestProject.Cover
import RequestProject.Packing

/-!
# The Main Theorem: τ(n) = 5n/24 + O(1)

We prove:
- **Upper bound**: H_n is a valid cover, so τ(n) ≤ |H_n| = 5n/24 + O(1).
- **Lower bound**: P_n gives a packing lower bound, so τ(n) ≥ |P_n| = 5n/24 + O(1).
-/

open Finset

/-- A cover is a subset C of U such that every x ∈ L has a multiple in C. -/
def IsCover (n : ℕ) (C : Finset ℕ) : Prop :=
  C ⊆ upperSet n ∧ ∀ x ∈ lowerSet n, ∃ u ∈ C, x ∣ u

/-- **Upper bound**: H_n is a valid cover. -/
theorem coverSet_is_cover (n : ℕ) (hn : 12 ≤ n) : IsCover n (coverSet n) :=
  ⟨coverSet_subset_upperSet n, fun x hx => cover_property n hn x hx⟩

/-
For each x in the packing set, pick a covering element. This is injective.
-/
theorem cover_injective_on_packingSet (n : ℕ) (hn : 4 ≤ n) (C : Finset ℕ) (hC : IsCover n C)
    (f : ℕ → ℕ) (hf : ∀ x ∈ packingSet n, f x ∈ C ∧ x ∣ f x) :
    Set.InjOn f (packingSet n : Set ℕ) := by
  intros x hx y hy hxy;
  exact packing_unique_divisor n ( f x ) ( by have := hC.1 ( hf x hx |>.1 ) ; aesop ) x y hx hy ( hf x hx |>.2 ) ( hxy.symm ▸ hf y hy |>.2 )

/-
**Lower bound**: Any cover has at least |P_n| elements.
-/
theorem cover_card_lower_bound (n : ℕ) (hn : 4 ≤ n) (C : Finset ℕ) (hC : IsCover n C) :
    (packingSet n).card ≤ C.card := by
  -- For each x in the packing set, pick a covering element. This is injective.
  have h_inj : ∃ f : ℕ → ℕ, (∀ x ∈ packingSet n, f x ∈ C ∧ x ∣ f x) ∧ Set.InjOn f (packingSet n : Set ℕ) := by
    choose! f hf using hC.2;
    exact ⟨ f, fun x hx => hf x ( packingSet_subset_lowerSet n hn hx ), cover_injective_on_packingSet n hn C hC f fun x hx => hf x ( packingSet_subset_lowerSet n hn hx ) ⟩;
  obtain ⟨ f, hf₁, hf₂ ⟩ := h_inj;
  have := Finset.card_le_card ( show Finset.image f ( packingSet n ) ⊆ C from Finset.image_subset_iff.mpr fun x hx => hf₁ x hx |>.1 ) ; rw [ Finset.card_image_of_injOn hf₂ ] at this; exact this;
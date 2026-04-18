import Mathlib

/-!
# The 5/24 First-Hit Cover of the Divisibility Poset

## Setup and Definitions

Fix an integer n ≥ 2. We define:
- `lowerSet n` = {m ∈ ℕ : 2 ≤ m ≤ ⌊n/2⌋}
- `upperSet n` = {m ∈ ℕ : n/2 < m ≤ n}
- `coverSet n` (H_n) = {u ∈ U : u ≡ 2 mod 4} ∪ {u ∈ U : u > 2n/3 ∧ u ≡ 0 mod 4}
- `packingSet n` (P_n) = {m : n/3 < m ≤ n/2} ∪ {m : n/4 < m ≤ n/3, m odd}
-/

open Finset

/-- The lower set L = {m ∈ ℕ : 2 ≤ m ≤ ⌊n/2⌋} -/
def lowerSet (n : ℕ) : Finset ℕ := Finset.Icc 2 (n / 2)

/-- The upper set U = {m ∈ ℕ : n/2 < m ≤ n} -/
def upperSet (n : ℕ) : Finset ℕ := Finset.Ioc (n / 2) n

/-- The cover set H_n = {u ∈ U : u ≡ 2 mod 4} ∪ {u ∈ U : u > 2n/3 ∧ u ≡ 0 mod 4} -/
def coverSet (n : ℕ) : Finset ℕ :=
  (upperSet n).filter (fun u => u % 4 = 2) ∪
  (upperSet n).filter (fun u => 2 * n / 3 < u ∧ u % 4 = 0)

/-- The packing set P_n = {m : n/3 < m ≤ n/2} ∪ {m : n/4 < m ≤ n/3, m odd} -/
def packingSet (n : ℕ) : Finset ℕ :=
  Finset.Ioc (n / 3) (n / 2) ∪
  (Finset.Ioc (n / 4) (n / 3)).filter (fun m => m % 2 = 1)

/-- The cover set is a subset of the upper set -/
theorem coverSet_subset_upperSet (n : ℕ) : coverSet n ⊆ upperSet n := by
  intro u hu
  simp only [coverSet, mem_union, mem_filter] at hu
  exact hu.elim (fun h => h.1) (fun h => h.1)

/-
The packing set is a subset of the lower set
-/
theorem packingSet_subset_lowerSet (n : ℕ) (hn : 4 ≤ n) : packingSet n ⊆ lowerSet n := by
  unfold packingSet lowerSet at *;
  grind

theorem mem_lowerSet_iff (n : ℕ) (x : ℕ) : x ∈ lowerSet n ↔ 2 ≤ x ∧ x ≤ n / 2 := by
  simp [lowerSet, Finset.mem_Icc]

theorem mem_upperSet_iff (n : ℕ) (u : ℕ) : u ∈ upperSet n ↔ n / 2 < u ∧ u ≤ n := by
  simp [upperSet, Finset.mem_Ioc]

theorem mem_coverSet_iff (n : ℕ) (u : ℕ) : u ∈ coverSet n ↔
    (n / 2 < u ∧ u ≤ n ∧ u % 4 = 2) ∨
    (n / 2 < u ∧ u ≤ n ∧ 2 * n / 3 < u ∧ u % 4 = 0) := by
  simp only [coverSet, mem_union, mem_filter, mem_upperSet_iff]
  tauto

theorem mem_packingSet_iff (n : ℕ) (m : ℕ) : m ∈ packingSet n ↔
    (n / 3 < m ∧ m ≤ n / 2) ∨ (n / 4 < m ∧ m ≤ n / 3 ∧ m % 2 = 1) := by
  simp only [packingSet, mem_union, Finset.mem_Ioc, mem_filter]
  tauto
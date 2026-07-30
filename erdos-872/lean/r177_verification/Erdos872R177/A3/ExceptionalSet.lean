import Erdos872R177.A3.BoundedPrefix

namespace Erdos872.A3

open Filter Finset Real
open scoped Topology

/-- The small-integer part of the exceptional set. -/
noncomputable def lowSet (delta : ℝ) (N : ℕ) : Finset ℕ := by
  classical
  exact (Finset.Ioc 0 N).filter fun x ↦ (x : ℝ) ≤ delta * (N : ℝ)

theorem lowSet_card_le {delta : ℝ} (hdelta : 0 < delta) (N : ℕ) :
    ((lowSet delta N).card : ℝ) ≤ delta * N := by
  classical
  let M := Nat.floor (delta * (N : ℝ))
  have hy : 0 ≤ delta * (N : ℝ) := mul_nonneg hdelta.le (Nat.cast_nonneg N)
  have hsubset : lowSet delta N ⊆ Finset.Ioc 0 M := by
    intro x hx
    have hx' : x ∈ Finset.Ioc 0 N ∧ (x : ℝ) ≤ delta * (N : ℝ) := by
      simpa [lowSet] using hx
    exact Finset.mem_Ioc.mpr
      ⟨(Finset.mem_Ioc.mp hx'.1).1, by simpa [M] using Nat.le_floor hx'.2⟩
  have hcard : (lowSet delta N).card ≤ M := by
    have := Finset.card_le_card hsubset
    simpa using this
  calc
    ((lowSet delta N).card : ℝ) ≤ (M : ℝ) := by exact_mod_cast hcard
    _ ≤ delta * N := by simpa [M] using Nat.floor_le hy

theorem exceptionalSet_subset_cover {K delta gamma : ℝ} {A N : ℕ} :
    exceptionalSet K A delta gamma N ⊆
      insert 1 (lowSet delta N ∪ (smallAKSet K A N ∪ largeAKSet K gamma N)) := by
  classical
  intro x hx
  rw [Finset.mem_insert]
  rcases Finset.mem_insert.mp hx with rfl | hx
  · exact Or.inl rfl
  · right
    have hx' : x ∈ Finset.range (N + 1) ∧ 2 ≤ x ∧
        ((x : ℝ) ≤ delta * (N : ℝ) ∨
          aK K x ≤ A ∨ (N : ℝ) ^ gamma < (aK K x : ℝ)) := by
      simpa [exceptionalSet] using hx
    have hxN : x ≤ N := by
      have := Finset.mem_range.mp hx'.1
      omega
    have hxIoc : x ∈ Finset.Ioc 0 N := Finset.mem_Ioc.mpr ⟨by omega, hxN⟩
    rcases hx'.2.2 with hlow | hsmall | hlarge
    · apply Finset.mem_union_left
      unfold lowSet
      exact Finset.mem_filter.mpr ⟨hxIoc, hlow⟩
    · apply Finset.mem_union_right
      apply Finset.mem_union_left
      unfold smallAKSet
      exact Finset.mem_filter.mpr ⟨hxIoc, hsmall⟩
    · apply Finset.mem_union_right
      apply Finset.mem_union_right
      unfold largeAKSet
      exact Finset.mem_filter.mpr ⟨hxIoc, hlarge⟩

theorem exceptionalSet_card_le_cover {K delta gamma : ℝ} {A N : ℕ} :
    (exceptionalSet K A delta gamma N).card ≤
      1 + (lowSet delta N).card + (smallAKSet K A N).card +
        (largeAKSet K gamma N).card := by
  classical
  let U := lowSet delta N ∪ (smallAKSet K A N ∪ largeAKSet K gamma N)
  have hsub : (exceptionalSet K A delta gamma N).card ≤ (insert 1 U).card :=
    Finset.card_le_card exceptionalSet_subset_cover
  have hins := Finset.card_insert_le 1 U
  have hunion1 := Finset.card_union_le (lowSet delta N)
    (smallAKSet K A N ∪ largeAKSet K gamma N)
  have hunion2 := Finset.card_union_le (smallAKSet K A N) (largeAKSet K gamma N)
  dsimp only [U] at hsub hins
  omega

/-- Lemma 2.3, with the exact public statement required by `AnalyticInputs`. -/
theorem exceptional_set_estimate :
  ∃ Cexc : ℝ, 0 < Cexc ∧
    ∀ K : ℝ, 2 < K →
    ∀ A : ℕ, 2 ≤ A →
    ∀ delta : ℝ, 0 < delta → delta < 1 →
    ∀ gamma : ℝ, 0 < gamma → gamma < 1 →
    ∀ epsilon : ℝ, 0 < epsilon →
      ∃ N₀ : ℕ, ∀ N : ℕ, N₀ ≤ N →
        ((exceptionalSet K A delta gamma N).card : ℝ) ≤
          (delta + Cexc * (1 + Real.log (A : ℝ)) / Real.log K + epsilon) * N := by
  refine ⟨1, zero_lt_one, ?_⟩
  intro K hK A hA delta hdelta hdelta1 gamma hgamma hgamma1 epsilon hepsilon
  have heps3 : 0 < epsilon / 3 := by linarith
  have hsmall := eventually_smallAKSet_card_le hK hA heps3
  have hlarge := eventually_largeAKSet_card_le hK hgamma heps3
  have hcast : Tendsto (fun N : ℕ ↦ (N : ℝ)) atTop atTop :=
    tendsto_natCast_atTop_atTop
  have hmul : Tendsto (fun N : ℕ ↦ (epsilon / 3) * (N : ℝ)) atTop atTop :=
    (tendsto_const_mul_atTop_of_pos heps3).2 hcast
  have hone : ∀ᶠ N : ℕ in atTop, 1 ≤ (epsilon / 3) * (N : ℝ) :=
    hmul.eventually (eventually_ge_atTop 1)
  have hall : ∀ᶠ N : ℕ in atTop,
      ((exceptionalSet K A delta gamma N).card : ℝ) ≤
        (delta + 1 * (1 + Real.log (A : ℝ)) / Real.log K + epsilon) * N := by
    filter_upwards [hsmall, hlarge, hone] with N hsmallN hlargeN honeN
    have hlowN := lowSet_card_le hdelta N
    have hcoverNat := exceptionalSet_card_le_cover
      (K := K) (delta := delta) (gamma := gamma) (A := A) (N := N)
    have hcover : ((exceptionalSet K A delta gamma N).card : ℝ) ≤
        1 + ((lowSet delta N).card : ℝ) + ((smallAKSet K A N).card : ℝ) +
          ((largeAKSet K gamma N).card : ℝ) := by
      exact_mod_cast hcoverNat
    calc
      ((exceptionalSet K A delta gamma N).card : ℝ) ≤
          1 + ((lowSet delta N).card : ℝ) + ((smallAKSet K A N).card : ℝ) +
            ((largeAKSet K gamma N).card : ℝ) := hcover
      _ ≤ (epsilon / 3) * N + delta * N +
            (((1 + Real.log (A : ℝ)) / Real.log K + epsilon / 3) * N) +
            (epsilon / 3) * N := by linarith
      _ = (delta + 1 * (1 + Real.log (A : ℝ)) / Real.log K + epsilon) * N := by
        ring
  rw [eventually_atTop] at hall
  obtain ⟨N₀, hN₀⟩ := hall
  exact ⟨N₀, hN₀⟩

end Erdos872.A3

import RequestProject.T2Finite.Defs
import RequestProject.T2Finite.EmbeddingFamily

open Finset

namespace RequestProject.T2Finite

/-- Concrete legality for an actual divisibility move `x` in the bounded game on `[2, N]`
against an already-played set `A`. -/
def IsLegalMove (N : ℕ) (A : Finset ℕ) (x : ℕ) : Prop :=
  x ∈ Finset.Icc 2 N ∧ x ∉ A ∧ (∀ a ∈ A, ¬ a ∣ x) ∧ ∀ a ∈ A, ¬ x ∣ a

namespace ResidualTarget

lemma value_isLegalMove_of_upperHalf_live
    {Y N : ℕ} {A : Finset ℕ} {T : Finset (ResidualTarget Y)} {t : ResidualTarget Y}
    (ht : t ∈ T)
    (hUpper : IsUpperHalfFamily N T)
    (hApos : ∀ m ∈ A, 0 < m)
    (hAupper : ∀ m ∈ A, m ≤ N)
    (hsmall : ∀ u ∈ T, Disjoint A u.smallDivisors)
    (hharm : Disjoint A t.harmfulMoves) :
    IsLegalMove N A t.value := by
  have hcmp :=
    value_legal_against_of_disjoint_smallDivisors_and_harmfulMoves
      (t := t) (N := N) (A := A) (hUpper t ht).2 hApos hAupper (hsmall t ht) hharm
  have hvalue_ge_two : 2 ≤ t.value := by
    have hone_lt : 1 < t.value := by
      exact Nat.one_lt_iff_ne_zero_and_ne_one.mpr ⟨Nat.ne_of_gt t.value_pos, t.value_ne_one⟩
    exact Nat.succ_le_of_lt hone_lt
  have hvalue_not_mem : t.value ∉ A := by
    intro hmem
    exact (Finset.disjoint_left.mp hharm hmem) (by simp [ResidualTarget.harmfulMoves])
  refine ⟨Finset.mem_Icc.mpr ⟨hvalue_ge_two, (hUpper t ht).1⟩, hvalue_not_mem, ?_, ?_⟩
  · intro m hmA hdiv
    exact (hcmp m hmA).1 hdiv
  · intro m hmA hdiv
    exact (hcmp m hmA).2 hdiv

theorem comparison_package
    {Y N : ℕ} {A : Finset ℕ} {T : Finset (ResidualTarget Y)} {t : ResidualTarget Y}
    (ht : t ∈ T)
    (hUpper : IsUpperHalfFamily N T)
    (hApos : ∀ m ∈ A, 0 < m)
    (hAupper : ∀ m ∈ A, m ≤ N)
    (hsmall : ∀ u ∈ T, Disjoint A u.smallDivisors)
    (hharm : Disjoint A t.harmfulMoves) :
    (∀ m : ℕ, m ∈ t.harmfulMoves ↔ m ∣ t.value ∧ m ∉ t.smallDivisors) ∧
      harmfulTargets T t.b = slotIncidentTargets T t.b ∧
      harmfulTargets T (t.a * t.b) = slotIncidentTargets T (t.a * t.b) ∧
      harmfulTargets T (t.c * t.b) = slotIncidentTargets T (t.c * t.b) ∧
      harmfulTargets T t.value = {t} ∧
      IsLegalMove N A t.value := by
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_⟩
  · intro m
    exact t.mem_harmfulMoves_iff (m := m)
  · simpa using t.harmfulTargets_eq_slotIncidentTargets_b T
  · simpa using t.harmfulTargets_eq_slotIncidentTargets_ab T
  · simpa using t.harmfulTargets_eq_slotIncidentTargets_cb T
  · simpa using t.harmfulTargets_eq_singleton_value_of_upperHalf (T := T) hUpper ht
  · exact value_isLegalMove_of_upperHalf_live ht hUpper hApos hAupper hsmall hharm

end ResidualTarget

end RequestProject.T2Finite

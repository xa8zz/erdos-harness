import Erdos872R177.Asymptotic
import Erdos872R177.OriginalValue

open Filter

namespace Erdos872R177

/-- The original board is empty below the theorem's natural range `n ≥ 2`. -/
lemma originalBoard_eq_empty_of_lt_two {n : ℕ} (hn : n < 2) :
    originalBoard n = ∅ := by
  exact Finset.Icc_eq_empty (Nat.not_le_of_lt hn)

/-- The original game has value zero on the empty small boards. -/
lemma L_eq_zero_of_lt_two {n : ℕ} (hn : n < 2) : L n = 0 := by
  rw [L, originalBoard_eq_empty_of_lt_two hn]
  simp [originalValue]

/-- The comparison `L(N) ≤ V₁(N)` holds for every natural `N`. -/
theorem L_le_V_one_all (n : ℕ) : L n ≤ V 1 n := by
  by_cases hn : 2 ≤ n
  · exact L_le_V_one n hn
  · rw [L_eq_zero_of_lt_two (by omega)]
    exact Nat.zero_le _

/--
Conditional endpoint for the actual formalized games: once the manuscript's
density recursion is supplied, the normalized original game value tends to
zero. This theorem isolates the remaining proof obligation without assuming
any additional axiom.
-/
theorem conditional_main
    (hrec : ∀ b : ℕ, 1 ≤ b →
      Erdos872.upperDensity V b ≤
        (1 / 2 : ℝ) * Erdos872.upperDensity V (b + 1)) :
    Tendsto (Erdos872.originalRatio L) atTop (nhds 0) := by
  exact Erdos872.original_ratio_tendsto_zero L V V_le L_le_V_one_all hrec

end Erdos872R177

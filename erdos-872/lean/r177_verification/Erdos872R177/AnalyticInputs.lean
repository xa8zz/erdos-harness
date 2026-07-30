import Erdos872R177.AnalyticDefs
import Erdos872R177.A3.ExceptionalSet

namespace Erdos872

/-- Lemma 2.1 in the exact quantified form of the R177 appendix. -/
axiom A1_rough_number_bound :
  ∃ Crough : ℝ, 0 < Crough ∧
    ∀ X z : ℝ, 2 ≤ X → 2 ≤ z →
      ((roughUpTo X z).card : ℝ) ≤ Crough * (X / Real.log z + 1)

/-- Lemma 2.2 in the exact quantified form of the R177 appendix. -/
axiom A2_sparse_dense_components :
  0 < kappa ∧
    ∀ K : ℝ, 2 < K →
      ∃ Cdense : ℝ, 0 < Cdense ∧
        ∀ X : ℝ, 2 ≤ X →
          ((denseUpTo K X).card : ℝ) ≤
            Cdense * X / (Real.log X) ^ kappa

/-- Lemma 2.3 in the exact quantified form of the R177 appendix. -/
theorem A3_exceptional_set_estimate :
  ∃ Cexc : ℝ, 0 < Cexc ∧
    ∀ K : ℝ, 2 < K →
    ∀ A : ℕ, 2 ≤ A →
    ∀ delta : ℝ, 0 < delta → delta < 1 →
    ∀ gamma : ℝ, 0 < gamma → gamma < 1 →
    ∀ epsilon : ℝ, 0 < epsilon →
      ∃ N₀ : ℕ, ∀ N : ℕ, N₀ ≤ N →
        ((exceptionalSet K A delta gamma N).card : ℝ) ≤
          (delta + Cexc * (1 + Real.log (A : ℝ)) / Real.log K + epsilon) * N :=
  A3.exceptional_set_estimate

end Erdos872

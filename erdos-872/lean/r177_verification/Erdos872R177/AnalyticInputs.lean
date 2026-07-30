import Erdos872R177.AnalyticDefs
import Erdos872R177.A3.ExceptionalSet

/-!
The manuscript's Lemmas 2.1 (rough-number bound) and 2.2 (sparse dense
components) were previously stated here as axioms `A1_rough_number_bound` and
`A2_sparse_dense_components`. The formal proof never used them — the large-tail
estimate is proved directly through the finite-prime Rankin moment and an
explicit reciprocal-prime bound — so both were deleted once Lemma 2.3 was
proved, leaving the project axiom-free beyond Lean's standard three. Their
historical statements are recorded in `erdos-872/verify-lean-R179.md`.
-/

namespace Erdos872

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

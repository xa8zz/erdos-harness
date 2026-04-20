import Mathlib.NumberTheory.Chebyshev

noncomputable section

namespace RequestProject.Round15Bonferroni4

open Filter Real
open scoped Nat.Prime

/-- The pinned Mathlib snapshot already supplies Chebyshev's eventual upper bound
`π(x) ≤ (log 4 + ε)x / log x`. We record the concrete `ε = 1` instance used for the Round 15
top-tail estimate. -/
lemma eventually_primeCounting_upper :
    ∀ᶠ x : ℝ in atTop,
      (Nat.primeCounting ⌊x⌋₊ : ℝ) ≤ (log 4 + 1) * x / log x := by
  simpa using (Chebyshev.eventually_primeCounting_le (ε := (1 : ℝ)) zero_lt_one)

/-- Dividing the Chebyshev upper bound by `x` yields the reciprocal-mass profile needed for the
top flat block: `π(x) / x = O(1 / log x)` along the concrete eventual inequality used in the
Round 15 bookkeeping. -/
lemma eventually_primeCounting_div_le :
    ∀ᶠ x : ℝ in atTop,
      (Nat.primeCounting ⌊x⌋₊ : ℝ) / x ≤ (log 4 + 1) / log x := by
  filter_upwards [eventually_gt_atTop (2 : ℝ), eventually_primeCounting_upper] with x hx hπ
  have hxpos : 0 < x := by linarith
  have hlogpos : 0 < log x := log_pos (lt_trans one_lt_two hx)
  have hxnonneg : 0 ≤ x := le_of_lt hxpos
  have hxne : x ≠ 0 := ne_of_gt hxpos
  have hlogne : log x ≠ 0 := ne_of_gt hlogpos
  calc
    (Nat.primeCounting ⌊x⌋₊ : ℝ) / x ≤ ((log 4 + 1) * x / log x) / x := by
      exact div_le_div_of_nonneg_right hπ hxnonneg
    _ = (log 4 + 1) / log x := by
      field_simp [hxne, hlogne]

end RequestProject.Round15Bonferroni4

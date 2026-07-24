import Erdos872R177.DenseFactorization

namespace Erdos872

/-- The non-exceptional hypotheses used for a useful vertex in manuscript §3. -/
def UsefulTagHypotheses
    (K delta gamma : ℝ) (A N x : ℕ) : Prop :=
  delta * (N : ℝ) < (x : ℝ) ∧
    A < aK K x ∧
    (aK K x : ℝ) ≤ (N : ℝ) ^ gamma ∧
    x ≤ N ∧
    0 < delta ∧ delta < 1 ∧
    0 < gamma ∧ gamma < 1 ∧
    1 < K * delta

/-- A useful vertex is positive, hence so is its complementary tag. -/
theorem useful_tK_pos
    {K delta gamma : ℝ} {A N x : ℕ}
    (h : UsefulTagHypotheses K delta gamma A N x) :
    0 < tK K x := by
  rcases h with ⟨hxLower, _, _, _, hdeltaPos, _⟩
  have hdeltaNNonneg : 0 ≤ delta * (N : ℝ) :=
    mul_nonneg hdeltaPos.le (Nat.cast_nonneg N)
  have hxRealPos : 0 < (x : ℝ) := lt_of_le_of_lt hdeltaNNonneg hxLower
  have hxPos : 0 < x := by exact_mod_cast hxRealPos
  have hfactor := aK_mul_tK K (Nat.ne_of_gt hxPos)
  have hproductPos : 0 < aK K x * tK K x := by omega
  exact pos_of_mul_pos_right hproductPos (Nat.zero_le _)

/-- Manuscript (3.1), with the quotient scale represented in `ℝ`. -/
theorem useful_scale_bounds
    {K delta gamma : ℝ} {A N x : ℕ}
    (h : UsefulTagHypotheses K delta gamma A N x) :
    (aK K x : ℝ) ≤ (N : ℝ) / (tK K x : ℝ) ∧
      (N : ℝ) / (tK K x : ℝ) < (aK K x : ℝ) / delta := by
  have htPosNat : 0 < tK K x := useful_tK_pos h
  rcases h with ⟨hxLower, _, _, hxUpper, hdeltaPos, _⟩
  have htPos : 0 < (tK K x : ℝ) := by exact_mod_cast htPosNat
  have hxPos : 0 < x := by
    have hdeltaNNonneg : 0 ≤ delta * (N : ℝ) :=
      mul_nonneg hdeltaPos.le (Nat.cast_nonneg N)
    exact_mod_cast (lt_of_le_of_lt hdeltaNNonneg hxLower)
  have hfactorNat := aK_mul_tK K (Nat.ne_of_gt hxPos)
  have hfactor : (x : ℝ) = (aK K x : ℝ) * (tK K x : ℝ) := by
    exact_mod_cast hfactorNat
  constructor
  · apply (le_div_iff₀ htPos).2
    rw [← hfactor]
    exact_mod_cast hxUpper
  · apply (div_lt_div_iff₀ htPos hdeltaPos).2
    rw [← hfactor]
    simpa [mul_comm] using hxLower

/-- Manuscript (3.2): useful quotient scales lie in the advertised window. -/
theorem useful_scale_window
    {K delta gamma : ℝ} {A N x : ℕ}
    (h : UsefulTagHypotheses K delta gamma A N x) :
    (A : ℝ) < (N : ℝ) / (tK K x : ℝ) ∧
      (N : ℝ) / (tK K x : ℝ) ≤ (N : ℝ) ^ gamma / delta := by
  have hscale := useful_scale_bounds h
  rcases h with ⟨_, hA, haUpper, _, hdeltaPos, _⟩
  constructor
  · exact lt_of_lt_of_le (by exact_mod_cast hA) hscale.1
  · exact le_trans hscale.2.le
      (div_le_div_of_nonneg_right haUpper hdeltaPos.le)

/--
For a fixed `0 < gamma < 1`, the explicit inequality below is the manuscript's
"sufficiently large `N`" condition. It rules out a useful tag equal to one.
-/
theorem useful_tK_gt_one_of_large
    {K delta gamma : ℝ} {A N x : ℕ}
    (h : UsefulTagHypotheses K delta gamma A N x)
    (hlarge : (N : ℝ) ^ gamma < delta * (N : ℝ)) :
    1 < tK K x := by
  have htPos : 0 < tK K x := useful_tK_pos h
  by_contra hnot
  have htEq : tK K x = 1 := by omega
  rcases h with ⟨hxLower, _, haUpper, _, hdeltaPos, _⟩
  have hxRealPos : 0 < (x : ℝ) := by
    exact lt_of_le_of_lt
      (mul_nonneg hdeltaPos.le (Nat.cast_nonneg N)) hxLower
  have hxPos : 0 < x := by exact_mod_cast hxRealPos
  have hfactorNat := aK_mul_tK K (Nat.ne_of_gt hxPos)
  have hfactor : (x : ℝ) = (aK K x : ℝ) * (tK K x : ℝ) := by
    exact_mod_cast hfactorNat
  rw [htEq, Nat.cast_one, mul_one] at hfactor
  nlinarith

/-- Manuscript (3.3)–(3.5): every useful tag is self-rough at scale `K * delta`. -/
theorem useful_minFac_gt_scale
    {K delta gamma : ℝ} {A N x : ℕ}
    (h : UsefulTagHypotheses K delta gamma A N x)
    (hlarge : (N : ℝ) ^ gamma < delta * (N : ℝ)) :
    (K * delta) * ((N : ℝ) / (tK K x : ℝ)) <
      (Nat.minFac (tK K x) : ℝ) := by
  have htOne : 1 < tK K x := useful_tK_gt_one_of_large h hlarge
  have hxTwo : 2 ≤ x := by
    have htPos : 0 < tK K x := useful_tK_pos h
    rcases h with ⟨hxLower, _, _, _, hdeltaPos, _⟩
    have hxRealPos : 0 < (x : ℝ) :=
      lt_of_le_of_lt (mul_nonneg hdeltaPos.le (Nat.cast_nonneg N)) hxLower
    have hxPos : 0 < x := by exact_mod_cast hxRealPos
    have hfactor := aK_mul_tK K (Nat.ne_of_gt hxPos)
    have haPos : 0 < aK K x := by
      have hproductPos : 0 < aK K x * tK K x := by omega
      exact pos_of_mul_pos_left hproductPos (Nat.zero_le _)
    calc
      2 = 1 * 2 := by norm_num
      _ ≤ aK K x * tK K x := Nat.mul_le_mul haPos htOne
      _ = x := hfactor.symm
  have hjump := minFac_tK_gt_of_one_lt (K := K) (x := x) hxTwo htOne
  have hscale := (useful_scale_bounds h).2
  rcases h with ⟨_, _, _, _, hdeltaPos, _, _, _, hH⟩
  have hdeltaScale :
      delta * ((N : ℝ) / (tK K x : ℝ)) < (aK K x : ℝ) := by
    have h' := (lt_div_iff₀ hdeltaPos).1 hscale
    simpa [mul_comm] using h'
  have hKPos : 0 < K := by
    have hKdeltaPos : 0 < K * delta := lt_trans (by norm_num) hH
    exact pos_of_mul_pos_left hKdeltaPos hdeltaPos.le
  have hthreshold :
      (K * delta) * ((N : ℝ) / (tK K x : ℝ)) < K * (aK K x : ℝ) := by
    have := mul_lt_mul_of_pos_left hdeltaScale hKPos
    simpa [mul_assoc] using this
  exact lt_trans hthreshold hjump

end Erdos872

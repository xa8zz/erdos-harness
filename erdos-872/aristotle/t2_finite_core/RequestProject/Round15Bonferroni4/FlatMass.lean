import RequestProject.Round15Bonferroni4.Envelope

noncomputable section

namespace RequestProject.Round15Bonferroni4

open Real

/-- Multiplying one interval-envelope value by the reciprocal scale `n^{-u}` cancels the `n^u`
term exactly. This is the arithmetic core of the flat-block `O(1 / log n)` estimates in Step 5. -/
lemma envelopeA_mul_rpow_neg
    {n ξ u : ℝ} {h : ℕ}
    (hn : 0 < n) :
    envelopeA n ξ h u * n ^ (-u) =
      (1 - ξ) / (((h + 1 : ℝ) * u) * log n) := by
  unfold envelopeA
  have hpow : n ^ u * n ^ (-u) = 1 := by
    calc
      n ^ u * n ^ (-u) = n ^ (u + (-u)) := by
        symm
        simpa using (Real.rpow_add hn u (-u))
      _ = n ^ (0 : ℝ) := by ring_nf
      _ = 1 := by simp
  calc
    (1 - ξ) * n ^ u / ((((h + 1 : ℝ) * u) * log n)) * n ^ (-u)
        = (1 - ξ) * (n ^ u * n ^ (-u)) * ((((h + 1 : ℝ) * u) * log n)⁻¹) := by
            rw [div_eq_mul_inv]
            ring
    _ = (1 - ξ) * ((((h + 1 : ℝ) * u) * log n)⁻¹) := by
          simp [hpow, mul_assoc]
    _ = (1 - ξ) / (((h + 1 : ℝ) * u) * log n) := by rw [div_eq_mul_inv]

/-- Any flat filler block with size bounded by the interval envelope contributes at most the
corresponding reciprocal-mass profile after multiplying by the worst-case weight `n^{-u}`. -/
lemma mul_rpow_neg_le_profile
    {m n ξ u : ℝ} {h : ℕ}
    (hm : m ≤ envelopeA n ξ h u)
    (hn : 0 < n) :
    m * n ^ (-u) ≤ (1 - ξ) / (((h + 1 : ℝ) * u) * log n) := by
  have hpos : 0 < n ^ (-u) := Real.rpow_pos_of_pos hn _
  have hm' := mul_le_mul_of_nonneg_right hm hpos.le
  calc
    m * n ^ (-u) ≤ envelopeA n ξ h u * n ^ (-u) := hm'
    _ = (1 - ξ) / (((h + 1 : ℝ) * u) * log n) := envelopeA_mul_rpow_neg hn

lemma bottomFlatMass_eq
    {n ξ : ℝ} {H : ℕ}
    (hH : 0 < H)
    (hn : 0 < n) :
    envelopeA n ξ (H - 1) (alpha H (H - 1)) * n ^ (-(alpha H (H - 1))) =
      (1 - ξ) / ((H : ℝ) * alpha H (H - 1) * log n) := by
  have hhm1 : H - 1 + 1 = H := Nat.sub_add_cancel hH
  rw [envelopeA_mul_rpow_neg hn]
  rw [show ((H - 1 : ℕ) : ℝ) + 1 = H by exact_mod_cast hhm1]

/-- The same reciprocal-mass profile controls any gap block attached to the left endpoint
`α_{h-1}`. -/
lemma gapFlatMass_le
    {m n ξ : ℝ} {H h : ℕ}
    (hh : 0 < h)
    (hm : m ≤ envelopeA n ξ (h - 1) (alpha H (h - 1)))
    (hn : 0 < n) :
    m * n ^ (-(alpha H (h - 1))) ≤
      (1 - ξ) / ((h : ℝ) * alpha H (h - 1) * log n) := by
  have hhm1 : h - 1 + 1 = h := Nat.sub_add_cancel hh
  calc
    m * n ^ (-(alpha H (h - 1))) ≤
        (1 - ξ) / ((((h - 1 : ℕ) : ℝ) + 1) * alpha H (h - 1) * log n) := by
          simpa using
            (mul_rpow_neg_le_profile (h := h - 1) hm hn)
    _ = (1 - ξ) / ((h : ℝ) * alpha H (h - 1) * log n) := by
          rw [show ((h - 1 : ℕ) : ℝ) + 1 = h by exact_mod_cast hhm1]

end RequestProject.Round15Bonferroni4

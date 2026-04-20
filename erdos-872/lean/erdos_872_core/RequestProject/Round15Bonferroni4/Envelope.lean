import Mathlib

noncomputable section

namespace RequestProject.Round15Bonferroni4

open Real

/-- The fixed gap size used in the Round 57 envelope construction. -/
def tau (H : ℕ) : ℝ :=
  1 / (8 * (H : ℝ) ^ 2)

/-- Left endpoint of the `h`-th good interval. -/
def alpha (H h : ℕ) : ℝ :=
  1 / ((h + 1 : ℝ)) + tau H

/-- Right endpoint of the `h`-th good interval. -/
def beta (H h : ℕ) : ℝ :=
  1 / (h : ℝ) - tau H

/-- The model lower profile on one good interval. -/
def envelopeA (n ξ : ℝ) (h : ℕ) (u : ℝ) : ℝ :=
  (1 - ξ) * (n ^ u) / (((h + 1 : ℝ) * u) * log n)

lemma tau_pos {H : ℕ} (hH : 0 < H) : 0 < tau H := by
  unfold tau
  positivity

lemma alpha_pos (H h : ℕ) : 0 < alpha H h := by
  unfold alpha tau
  positivity

lemma beta_pos {H h : ℕ} (_hh : 0 < h) (hτ : tau H < 1 / (h : ℝ)) : 0 < beta H h := by
  unfold beta
  linarith

lemma alpha_sub_beta_eq_two_tau (H h : ℕ) :
    alpha H h - beta H (h + 1) = 2 * tau H := by
  unfold alpha beta
  have hcast : (((h + 1 : ℕ) : ℝ)) = 1 + (h : ℝ) := by
    calc
      (((h + 1 : ℕ) : ℝ)) = (h : ℝ) + 1 := by norm_num [Nat.cast_add]
      _ = 1 + (h : ℝ) := by ring
  rw [hcast]
  ring_nf

lemma envelopeA_ratio_boundary
    {n ξ : ℝ} {H h : ℕ}
    (hh : 0 < h)
    (hn : 0 < n)
    (hlog : log n ≠ 0)
    (hξ : ξ ≠ 1)
    (hβ : beta H h ≠ 0) :
    envelopeA n ξ (h - 1) (alpha H (h - 1)) / envelopeA n ξ h (beta H h) =
      n ^ (2 * tau H) * (((h + 1 : ℝ) * beta H h) / ((h : ℝ) * alpha H (h - 1))) := by
  have hhm1 : h - 1 + 1 = h := Nat.sub_add_cancel hh
  have hcast : ((h - 1 : ℕ) : ℝ) + 1 = h := by
    exact_mod_cast hhm1
  have hα : alpha H (h - 1) ≠ 0 := ne_of_gt (alpha_pos H (h - 1))
  have hβ_factor : ((h : ℝ)) ≠ 0 := by exact_mod_cast (Nat.ne_of_gt hh)
  have hone : 1 - ξ ≠ 0 := sub_ne_zero.mpr hξ.symm
  have hpow :
      n ^ alpha H (h - 1) = n ^ (beta H h + 2 * tau H) := by
    have hEq : alpha H (h - 1) = beta H h + 2 * tau H := by
      unfold alpha beta
      rw [Nat.cast_sub (Nat.one_le_iff_ne_zero.mpr (Nat.ne_of_gt hh))]
      ring_nf
    rw [hEq]
  unfold envelopeA
  rw [hcast]
  field_simp [hlog, hone, hα, hβ, hβ_factor]
  rw [hpow]
  have ht : 2 * tau H = tau H * 2 := by ring
  rw [ht]
  simpa using (Real.rpow_add hn (beta H h) (tau H * 2))

end RequestProject.Round15Bonferroni4

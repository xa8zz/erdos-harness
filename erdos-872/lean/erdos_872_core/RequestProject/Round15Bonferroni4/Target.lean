import Mathlib.Data.Real.Basic
import Mathlib.Order.Filter.AtTopBot.Basic
import Mathlib.Tactic

noncomputable section

namespace RequestProject.Round15Bonferroni4

open Filter

/-- The finite Bonferroni-4 constant `W₄ = 1 - J₁ + J₂ - J₃ + J₄`. -/
def bonferroni4Const (J1 J2 J3 J4 : ℝ) : ℝ :=
  1 - J1 + J2 - J3 + J4

/-- Coarse certified interval bounds on the Round 15 summary constants already imply
`W₄ < 0.38`, hence `W₄/2 < 0.19`. The constants here are intentionally slightly weaker than the
reported numerics so the verification is robust. -/
lemma bonferroni4Const_lt_point38_of_summary_bounds
    {J1 J2 J3 J4 : ℝ}
    (hJ1 : 0.78852 ≤ J1)
    (hJ2 : J2 ≤ 0.18682)
    (hJ3 : 0.02009 ≤ J3)
    (hJ4 : J4 ≤ 0.00123) :
    bonferroni4Const J1 J2 J3 J4 < 19 / 50 := by
  unfold bonferroni4Const
  linarith

/-- The same summary bounds give a small explicit margin below `0.19` after dividing by `2`. -/
lemma bonferroni4Half_add_margin_lt_point19
    {J1 J2 J3 J4 : ℝ}
    (hJ1 : 0.78852 ≤ J1)
    (hJ2 : J2 ≤ 0.18682)
    (hJ3 : 0.02009 ≤ J3)
    (hJ4 : J4 ≤ 0.00123) :
    bonferroni4Const J1 J2 J3 J4 / 2 + (1 / 5000 : ℝ) < 19 / 100 := by
  unfold bonferroni4Const
  linarith

/-- The certified summary bounds still leave room for a much smaller explicit coefficient error. -/
lemma bonferroni4Half_add_small_margin_lt_point19
    {J1 J2 J3 J4 : ℝ}
    (hJ1 : 0.78852 ≤ J1)
    (hJ2 : J2 ≤ 0.18682)
    (hJ3 : 0.02009 ≤ J3)
    (hJ4 : J4 ≤ 0.00123) :
    bonferroni4Const J1 J2 J3 J4 / 2 + (1 / 50000 : ℝ) < 19 / 100 := by
  unfold bonferroni4Const
  linarith

/-- The certified summary bounds already imply the headline strict inequality `W₄/2 < 0.19`. -/
lemma bonferroni4Half_lt_point19_of_summary_bounds
    {J1 J2 J3 J4 : ℝ}
    (hJ1 : 0.78852 ≤ J1)
    (hJ2 : J2 ≤ 0.18682)
    (hJ3 : 0.02009 ≤ J3)
    (hJ4 : J4 ≤ 0.00123) :
    bonferroni4Const J1 J2 J3 J4 / 2 < 19 / 100 := by
  have hW4 : bonferroni4Const J1 J2 J3 J4 < 19 / 50 := by
    exact bonferroni4Const_lt_point38_of_summary_bounds hJ1 hJ2 hJ3 hJ4
  linarith

/-- Abstract endgame: once the Round 15 argument is formalized up to an eventual bound by the
Bonferroni-4 constant plus an error term of size at most `n/5000`, the certified summary bounds
on `J₁,…,J₄` already imply the paper headline `L(n) < 0.19 n` eventually. -/
lemma eventually_strict_lt_point19_of_summary_bounds
    {L err : ℕ → ℝ} {J1 J2 J3 J4 : ℝ}
    (hmain :
      ∀ᶠ n : ℕ in atTop,
        L n ≤ bonferroni4Const J1 J2 J3 J4 / 2 * n + err n)
    (herr :
      ∀ᶠ n : ℕ in atTop,
        |err n| ≤ (1 / 5000 : ℝ) * n)
    (hJ1 : 0.78852 ≤ J1)
    (hJ2 : J2 ≤ 0.18682)
    (hJ3 : 0.02009 ≤ J3)
    (hJ4 : J4 ≤ 0.00123) :
    ∀ᶠ n : ℕ in atTop,
      L n < (19 / 100 : ℝ) * n := by
  filter_upwards [hmain, herr, eventually_gt_atTop 0] with n hnMain hnErr hnPos
  have hErrLe : err n ≤ (1 / 5000 : ℝ) * n := by
    exact le_trans (le_abs_self _) hnErr
  have hMargin :
      bonferroni4Const J1 J2 J3 J4 / 2 + (1 / 5000 : ℝ) < 19 / 100 := by
    exact bonferroni4Half_add_margin_lt_point19 hJ1 hJ2 hJ3 hJ4
  have hnpos : (0 : ℝ) < n := by
    exact_mod_cast hnPos
  calc
    L n ≤ bonferroni4Const J1 J2 J3 J4 / 2 * n + err n := hnMain
    _ ≤ bonferroni4Const J1 J2 J3 J4 / 2 * n + ((1 / 5000 : ℝ) * n) := by
      linarith
    _ = (bonferroni4Const J1 J2 J3 J4 / 2 + (1 / 5000 : ℝ)) * n := by ring
    _ < (19 / 100 : ℝ) * n := by
      nlinarith

/-- A non-strict version of the same abstract endgame wrapper. -/
lemma eventually_le_point19_of_summary_bounds
    {L err : ℕ → ℝ} {J1 J2 J3 J4 : ℝ}
    (hmain :
      ∀ᶠ n : ℕ in atTop,
        L n ≤ bonferroni4Const J1 J2 J3 J4 / 2 * n + err n)
    (herr :
      ∀ᶠ n : ℕ in atTop,
        |err n| ≤ (1 / 5000 : ℝ) * n)
    (hJ1 : 0.78852 ≤ J1)
    (hJ2 : J2 ≤ 0.18682)
    (hJ3 : 0.02009 ≤ J3)
    (hJ4 : J4 ≤ 0.00123) :
    ∀ᶠ n : ℕ in atTop,
      L n ≤ (19 / 100 : ℝ) * n := by
  filter_upwards
    [eventually_strict_lt_point19_of_summary_bounds hmain herr hJ1 hJ2 hJ3 hJ4] with n hn
  exact le_of_lt hn

/-- If the first four Bonferroni moment terms are already componentwise within `10⁻⁵` of their
certified limits, then the final headline bound `L(n) < 0.19 n` follows immediately. This isolates
the remaining Lean gap to proving those moment approximations. -/
lemma eventually_strict_lt_point19_of_componentwise_close
    {L T1 T2 T3 T4 : ℕ → ℝ} {J1 J2 J3 J4 : ℝ}
    (hmain :
      ∀ᶠ n : ℕ in atTop,
        L n ≤ bonferroni4Const (T1 n) (T2 n) (T3 n) (T4 n) / 2 * n)
    (hT1 :
      ∀ᶠ n : ℕ in atTop,
        |T1 n - J1| ≤ (1 / 100000 : ℝ))
    (hT2 :
      ∀ᶠ n : ℕ in atTop,
        |T2 n - J2| ≤ (1 / 100000 : ℝ))
    (hT3 :
      ∀ᶠ n : ℕ in atTop,
        |T3 n - J3| ≤ (1 / 100000 : ℝ))
    (hT4 :
      ∀ᶠ n : ℕ in atTop,
        |T4 n - J4| ≤ (1 / 100000 : ℝ))
    (hJ1 : 0.78852 ≤ J1)
    (hJ2 : J2 ≤ 0.18682)
    (hJ3 : 0.02009 ≤ J3)
    (hJ4 : J4 ≤ 0.00123) :
    ∀ᶠ n : ℕ in atTop,
      L n < (19 / 100 : ℝ) * n := by
  filter_upwards [hmain, hT1, hT2, hT3, hT4, eventually_gt_atTop 0] with
      n hnMain h1 h2 h3 h4 hnPos
  have h1' := abs_le.mp h1
  have h2' := abs_le.mp h2
  have h3' := abs_le.mp h3
  have h4' := abs_le.mp h4
  have hCoeff :
      bonferroni4Const (T1 n) (T2 n) (T3 n) (T4 n) / 2 ≤
        bonferroni4Const J1 J2 J3 J4 / 2 + (1 / 50000 : ℝ) := by
    unfold bonferroni4Const
    nlinarith
  have hMargin :
      bonferroni4Const J1 J2 J3 J4 / 2 + (1 / 50000 : ℝ) < 19 / 100 := by
    exact bonferroni4Half_add_small_margin_lt_point19 hJ1 hJ2 hJ3 hJ4
  have hnpos : (0 : ℝ) < n := by
    exact_mod_cast hnPos
  calc
    L n ≤ bonferroni4Const (T1 n) (T2 n) (T3 n) (T4 n) / 2 * n := hnMain
    _ ≤ (bonferroni4Const J1 J2 J3 J4 / 2 + (1 / 50000 : ℝ)) * n := by
      nlinarith
    _ < (19 / 100 : ℝ) * n := by
      nlinarith

end RequestProject.Round15Bonferroni4

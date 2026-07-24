import Erdos872R177.Asymptotic

open Filter

namespace Erdos872

/-- The manuscript choice `δ = A⁻²`. -/
noncomputable def deltaSchedule (A : ℕ) : ℝ := ((A : ℝ) ^ 2)⁻¹

/-- The integer manuscript choice `K = ⌈exp(A³)⌉`. -/
noncomputable def KSchedule (A : ℕ) : ℕ := ⌈Real.exp ((A : ℝ) ^ 3)⌉₊

/-- The logarithmic error factor in (5.1), without its absolute constant. -/
noncomputable def logScheduleError (A : ℕ) : ℝ :=
  (1 + Real.log (A : ℝ)) / Real.log (KSchedule A : ℝ)

/-- A simpler majorant for `logScheduleError`. -/
noncomputable def logOverA (A : ℕ) : ℝ :=
  (1 + Real.log (A : ℝ)) / (A : ℝ)

lemma exp_cube_le_KSchedule (A : ℕ) :
    Real.exp ((A : ℝ) ^ 3) ≤ (KSchedule A : ℝ) := by
  exact Nat.le_ceil _

lemma sq_lt_KSchedule {A : ℕ} (hA : 1 ≤ A) :
    (A : ℝ) ^ 2 < (KSchedule A : ℝ) := by
  have hx : (1 : ℝ) ≤ A := by exact_mod_cast hA
  have hne : (A : ℝ) ^ 3 ≠ 0 := by positivity
  have hexp := Real.add_one_lt_exp hne
  have hceil := exp_cube_le_KSchedule A
  nlinarith [sq_nonneg ((A : ℝ) ^ 2 - A)]

lemma two_lt_KSchedule {A : ℕ} (hA : 1 ≤ A) :
    (2 : ℝ) < (KSchedule A : ℝ) := by
  have hx : (1 : ℝ) ≤ A := by exact_mod_cast hA
  have hne : (A : ℝ) ^ 3 ≠ 0 := by positivity
  have hexp := Real.add_one_lt_exp hne
  have hceil := exp_cube_le_KSchedule A
  nlinarith [sq_nonneg ((A : ℝ) ^ 2 - A)]

lemma deltaSchedule_pos {A : ℕ} (hA : 1 ≤ A) : 0 < deltaSchedule A := by
  rw [deltaSchedule]
  positivity

lemma deltaSchedule_lt_one {A : ℕ} (hA : 2 ≤ A) : deltaSchedule A < 1 := by
  rw [deltaSchedule, inv_lt_one₀]
  · have : (2 : ℝ) ≤ A := by exact_mod_cast hA
    nlinarith [sq_nonneg ((A : ℝ) - 1)]
  · positivity

/-- The schedule condition `Kδ > 1` holds for every positive integer `A`. -/
lemma one_lt_K_mul_delta {A : ℕ} (hA : 1 ≤ A) :
    1 < (KSchedule A : ℝ) * deltaSchedule A := by
  rw [deltaSchedule, ← div_eq_mul_inv, one_lt_div (by positivity)]
  exact sq_lt_KSchedule hA

lemma tendsto_inv_natCast_zero :
    Tendsto (fun A : ℕ ↦ ((A : ℝ))⁻¹) atTop (nhds 0) :=
  tendsto_inv_atTop_zero.comp tendsto_natCast_atTop_atTop

/-- The first error term `δ = A⁻²` tends to zero. -/
lemma tendsto_deltaSchedule_zero :
    Tendsto deltaSchedule atTop (nhds 0) := by
  simpa [deltaSchedule, inv_pow] using tendsto_inv_natCast_zero.pow 2

lemma tendsto_logOverA_zero :
    Tendsto logOverA atTop (nhds 0) := by
  have hlog : Tendsto (fun A : ℕ ↦ Real.log (A : ℝ) / (A : ℝ)) atTop (nhds 0) := by
    simpa only [Function.comp_apply, id_eq] using
      Real.isLittleO_log_id_atTop.tendsto_div_nhds_zero.comp
        (tendsto_natCast_atTop_atTop (R := ℝ))
  have heq : (fun A : ℕ ↦ ((A : ℝ))⁻¹ + Real.log (A : ℝ) / (A : ℝ))
      =ᶠ[atTop] logOverA := by
    filter_upwards with A
    change ((A : ℝ))⁻¹ + Real.log (A : ℝ) / (A : ℝ) =
      (1 + Real.log (A : ℝ)) / (A : ℝ)
    rw [add_div, one_div]
  have h := (tendsto_inv_natCast_zero.add hlog).congr' heq
  simpa only [zero_add] using h

lemma logScheduleError_nonneg_eventually :
    ∀ᶠ A : ℕ in atTop, 0 ≤ logScheduleError A := by
  filter_upwards [eventually_ge_atTop 2] with A hA
  rw [logScheduleError]
  apply div_nonneg
  · have hlog : 0 ≤ Real.log (A : ℝ) :=
      Real.log_nonneg (by exact_mod_cast (show 1 ≤ A by omega))
    linarith
  · exact Real.log_nonneg (by
      have := two_lt_KSchedule (show 1 ≤ A by omega)
      exact this.le.trans' (by norm_num))

lemma logScheduleError_le_eventually :
    ∀ᶠ A : ℕ in atTop, logScheduleError A ≤ logOverA A := by
  filter_upwards [eventually_ge_atTop 2] with A hA
  have hA1 : 1 ≤ A := by omega
  have hApos : (0 : ℝ) < A := by exact_mod_cast (show 0 < A by omega)
  have hnum : 0 ≤ 1 + Real.log (A : ℝ) := by
    have := Real.log_nonneg (show (1 : ℝ) ≤ A by exact_mod_cast hA1)
    linarith
  have hlogK : (A : ℝ) ^ 3 ≤ Real.log (KSchedule A : ℝ) := by
    calc
      (A : ℝ) ^ 3 = Real.log (Real.exp ((A : ℝ) ^ 3)) := by rw [Real.log_exp]
      _ ≤ Real.log (KSchedule A : ℝ) :=
        Real.log_le_log (Real.exp_pos _) (exp_cube_le_KSchedule A)
  have hdenom : (A : ℝ) ≤ Real.log (KSchedule A : ℝ) := by
    have hAge : (1 : ℝ) ≤ A := by exact_mod_cast hA1
    nlinarith [sq_nonneg ((A : ℝ) ^ 2 - A)]
  rw [logScheduleError, logOverA]
  exact div_le_div_of_nonneg_left hnum hApos hdenom

/-- The logarithmic error term tends to zero along the explicit schedule. -/
lemma tendsto_logScheduleError_zero :
    Tendsto logScheduleError atTop (nhds 0) :=
  squeeze_zero' logScheduleError_nonneg_eventually logScheduleError_le_eventually
    tendsto_logOverA_zero

/-- The full right-hand side of (5.1) after inserting the explicit schedule. -/
noncomputable def parameterRhs (C : ℝ) (M : ℕ → ℝ) (A : ℕ) : ℝ :=
  deltaSchedule A + C * logScheduleError A + ((A : ℝ))⁻¹ +
    (1 / 2 : ℝ) * (1 + ((A : ℝ))⁻¹) * M A

/-- The scheduled right-hand side tends to one half of the tail-density limit. -/
lemma tendsto_parameterRhs
    (C m : ℝ) (M : ℕ → ℝ)
    (hM : Tendsto M atTop (nhds m)) :
    Tendsto (parameterRhs C M) atTop (nhds ((1 / 2 : ℝ) * m)) := by
  have hlogC := tendsto_logScheduleError_zero.const_mul C
  have hone : Tendsto (fun _ : ℕ ↦ (1 : ℝ)) atTop (nhds 1) := tendsto_const_nhds
  have hcoeff :=
    (hone.add tendsto_inv_natCast_zero).const_mul (1 / 2 : ℝ)
  have htail := hcoeff.mul hM
  have htotal :=
    ((tendsto_deltaSchedule_zero.add hlogC).add tendsto_inv_natCast_zero).add htail
  have htotal' : Tendsto
      (fun A ↦ deltaSchedule A + C * logScheduleError A + ((A : ℝ))⁻¹ +
        (1 / 2 : ℝ) * (1 + ((A : ℝ))⁻¹) * M A)
      atTop (nhds ((1 / 2 : ℝ) * m)) := by
    simpa using htotal
  refine htotal'.congr' ?_
  exact Eventually.of_forall fun A ↦ rfl

/--
The elementary parameter passage from (5.1) to the density recursion. The
parameter `gamma` is fixed while `A` tends to infinity. The hypothesis `h51`
is precisely the post-`N → ∞` inequality family, including its admissibility
conditions, and `hM` is convergence of the tail supremum.
-/
theorem parameter_limit_halving
    (c : ℕ → ℝ) (M : ℕ → ℝ) (C gamma : ℝ) (b : ℕ)
    (hgamma₀ : 0 < gamma) (hgamma₁ : gamma < 1)
    (hM : Tendsto M atTop (nhds (c (b + 1))))
    (h51 : 0 < gamma → gamma < 1 →
      ∀ (A : ℕ) (delta K : ℝ),
        2 ≤ A → 0 < delta → delta < 1 → 2 < K → 1 < K * delta →
        c b ≤ delta + C * (1 + Real.log (A : ℝ)) / Real.log K + ((A : ℝ))⁻¹ +
          (1 / 2 : ℝ) * (1 + ((A : ℝ))⁻¹) * M A) :
    c b ≤ (1 / 2 : ℝ) * c (b + 1) := by
  apply ge_of_tendsto (tendsto_parameterRhs C (c (b + 1)) M hM)
  filter_upwards [eventually_ge_atTop 2] with A hA
  have hbound := h51 hgamma₀ hgamma₁ A (deltaSchedule A) (KSchedule A : ℝ)
    hA (deltaSchedule_pos (by omega)) (deltaSchedule_lt_one hA)
    (two_lt_KSchedule (by omega)) (one_lt_K_mul_delta (by omega))
  simpa [parameterRhs, logScheduleError, div_eq_mul_inv, mul_assoc] using hbound

end Erdos872

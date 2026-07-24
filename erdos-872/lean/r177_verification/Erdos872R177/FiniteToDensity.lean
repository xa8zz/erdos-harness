import Erdos872R177.MasterAccounting
import Erdos872R177.AnalyticInputs
import Erdos872R177.ParameterLimit

open Filter Set

namespace Erdos872R177

noncomputable section

/-! # From the finite master inequality to the density recursion -/

/-- For fixed `0 < gamma < 1`, the sublinear root-sweep error vanishes after
division by `N`. -/
theorem tendsto_natCast_rpow_div_self_zero
    {gamma : ℝ} (hgamma : gamma < 1) :
    Tendsto (fun N : ℕ => (N : ℝ) ^ gamma / (N : ℝ)) atTop (nhds 0) := by
  have hpow : Tendsto (fun x : ℝ => x ^ (-(1 - gamma))) atTop (nhds 0) :=
    tendsto_rpow_neg_atTop (sub_pos.mpr hgamma)
  have hcomp := hpow.comp (tendsto_natCast_atTop_atTop (R := ℝ))
  apply hcomp.congr'
  filter_upwards [eventually_ge_atTop 1] with N hN
  have hNpos : (0 : ℝ) < N := by exact_mod_cast (show 0 < N by omega)
  rw [show -(1 - gamma) = gamma - 1 by ring]
  exact Real.rpow_sub_one hNpos.ne' gamma

/-- Fixed-parameter finite master inequalities imply the post-`N → ∞`
estimate (5.1).  The exceptional estimate is supplied in its literal
epsilon-eventual form, and the arbitrary epsilon is removed only after the
limsup bound is taken. -/
theorem upperDensity_le_of_eventually_master
    {b A : ℕ} {K delta gamma Cexc : ℝ}
    (hA : 1 ≤ A) (hdelta : 0 < delta) (hgamma : gamma < 1)
    (hmaster : ∀ᶠ N : ℕ in atTop,
      (V b N : ℝ) ≤
        (Erdos872.exceptionalSet K A delta gamma N).card +
          (N : ℝ) / (A : ℝ) +
          Erdos872.robustTailSup V (b + 1) A / 2 *
            ((N : ℝ) + (N : ℝ) / (A : ℝ) +
              ((b + 1 : ℕ) : ℝ) * ((N : ℝ) ^ gamma / delta)))
    (hexc : ∀ epsilon : ℝ, 0 < epsilon →
      ∃ N₀ : ℕ, ∀ N : ℕ, N₀ ≤ N →
        ((Erdos872.exceptionalSet K A delta gamma N).card : ℝ) ≤
          (delta + Cexc * (1 + Real.log (A : ℝ)) / Real.log K + epsilon) * N) :
    Erdos872.upperDensity V b ≤
      delta + Cexc * (1 + Real.log (A : ℝ)) / Real.log K +
        ((A : ℝ))⁻¹ +
        (1 / 2 : ℝ) * (1 + ((A : ℝ))⁻¹) *
          Erdos872.robustTailSup V (b + 1) A := by
  let M := Erdos872.robustTailSup V (b + 1) A
  let C := delta + Cexc * (1 + Real.log (A : ℝ)) / Real.log K +
    ((A : ℝ))⁻¹ + (1 / 2 : ℝ) * (1 + ((A : ℝ))⁻¹) * M
  have hbddBelow : IsBoundedUnder (· ≥ ·) atTop
      (Erdos872.robustRatio V b) :=
    isBoundedUnder_of_eventually_ge <|
      Eventually.of_forall fun N => (Erdos872.robustRatio_bounds V V_le b N).1
  have herr : Tendsto
      (fun N : ℕ => M / 2 * (((b + 1 : ℕ) : ℝ) / delta) *
        ((N : ℝ) ^ gamma / (N : ℝ))) atTop (nhds 0) := by
    simpa using (tendsto_natCast_rpow_div_self_zero hgamma).const_mul
      (M / 2 * (((b + 1 : ℕ) : ℝ) / delta))
  have hlimsup : ∀ epsilon : ℝ, 0 < epsilon →
      Erdos872.upperDensity V b ≤ C + epsilon := by
    intro epsilon hepsilon
    obtain ⟨N₀, hN₀⟩ := hexc (epsilon / 2) (by positivity)
    have herrEvent : ∀ᶠ N : ℕ in atTop,
        M / 2 * (((b + 1 : ℕ) : ℝ) / delta) *
            ((N : ℝ) ^ gamma / (N : ℝ)) < epsilon / 2 :=
      (tendsto_order.1 herr).2 (epsilon / 2) (by positivity)
    have hratio : ∀ᶠ N : ℕ in atTop,
        Erdos872.robustRatio V b N ≤ C + epsilon := by
      filter_upwards [hmaster, eventually_ge_atTop N₀,
        eventually_ge_atTop 1, herrEvent] with N hfinite hN₀N hNpos herrN
      have hNreal : (0 : ℝ) < N := by exact_mod_cast hNpos
      have hExc := hN₀ N hN₀N
      have hAreal : (0 : ℝ) < A := by exact_mod_cast (lt_of_lt_of_le (by omega) hA)
      have hnormalized := (div_le_div_iff_of_pos_right hNreal).mpr hfinite
      rw [Erdos872.robustRatio]
      rw [add_div, add_div] at hnormalized
      dsimp only [M, C]
      -- Normalize every term in the finite master inequality.  The final
      -- root-sweep term is exactly the quantity controlled by `herrN`.
      have hExcNorm :
          ((Erdos872.exceptionalSet K A delta gamma N).card : ℝ) / (N : ℝ) ≤
            delta + Cexc * (1 + Real.log (A : ℝ)) / Real.log K + epsilon / 2 := by
        exact (div_le_iff₀ hNreal).2 (by simpa [mul_comm] using hExc)
      have hAinv : (N : ℝ) / (A : ℝ) / (N : ℝ) = ((A : ℝ))⁻¹ := by
        field_simp
      have hmainNorm :
          (M / 2 *
              ((N : ℝ) + (N : ℝ) / (A : ℝ) +
                ((b + 1 : ℕ) : ℝ) * ((N : ℝ) ^ gamma / delta))) /
              (N : ℝ) =
            (1 / 2 : ℝ) * (1 + ((A : ℝ))⁻¹) * M +
              M / 2 * (((b + 1 : ℕ) : ℝ) / delta) *
                ((N : ℝ) ^ gamma / (N : ℝ)) := by
        field_simp
      rw [hAinv, hmainNorm] at hnormalized
      nlinarith
    exact limsup_le_of_le hbddBelow.isCoboundedUnder_le hratio
  change Erdos872.upperDensity V b ≤ C
  exact le_of_forall_pos_le_add hlimsup

/-- The exact finite-master family required from the concrete arithmetic
sweep.  All parameters are fixed before `N` tends to infinity. -/
def EventualMasterInequality : Prop :=
  ∀ (b A : ℕ) (K delta gamma : ℝ),
    1 ≤ b → 2 ≤ A → 2 < K →
    0 < delta → delta < 1 →
    0 < gamma → gamma < 1 → 1 < K * delta →
    ∀ᶠ N : ℕ in atTop,
      (V b N : ℝ) ≤
        (Erdos872.exceptionalSet K A delta gamma N).card +
          (N : ℝ) / (A : ℝ) +
          Erdos872.robustTailSup V (b + 1) A / 2 *
            ((N : ℝ) + (N : ℝ) / (A : ℝ) +
              ((b + 1 : ℕ) : ℝ) * ((N : ℝ) ^ gamma / delta))

/-- The exceptional-set analytic input and the finite master family imply
the unconditional density recursion.  The value `gamma = 1/2` is fixed
before both limit passages. -/
theorem density_recursion_of_eventual_master
    (hmaster : EventualMasterInequality) :
    ∀ b : ℕ, 1 ≤ b →
      Erdos872.upperDensity V b ≤
        (1 / 2 : ℝ) * Erdos872.upperDensity V (b + 1) := by
  obtain ⟨Cexc, _hCexcPos, hCexc⟩ := Erdos872.A3_exceptional_set_estimate
  intro b hb
  let gamma : ℝ := 1 / 2
  have hgammaPos : 0 < gamma := by norm_num [gamma]
  have hgammaOne : gamma < 1 := by norm_num [gamma]
  apply Erdos872.parameter_limit_halving
      (c := Erdos872.upperDensity V)
      (M := Erdos872.robustTailSup V (b + 1))
      Cexc gamma b hgammaPos hgammaOne
      (Erdos872.tendsto_robustTailSup V V_le (b + 1))
  intro _hgammaPos _hgammaOne A delta K hA hdeltaPos hdeltaOne hK hKdelta
  apply upperDensity_le_of_eventually_master
      (hA := by omega) hdeltaPos hgammaOne
      (hmaster b A K delta gamma hb hA hK hdeltaPos hdeltaOne
        hgammaPos hgammaOne hKdelta)
  intro epsilon hepsilon
  exact hCexc K hK A hA delta hdeltaPos hdeltaOne gamma
    hgammaPos hgammaOne epsilon hepsilon

end

end Erdos872R177

import Erdos872R177.ConcreteGeometry
import Erdos872R177.FiniteToDensity
import Erdos872R177.Bridge

open Filter

namespace Erdos872R177

noncomputable section

/-! # Concrete sweep output and the eventual master family -/

/-- The concrete roots satisfy exactly the numerical interface consumed by
the three-class accounting theorem. -/
noncomputable def concreteRootNumericalBounds
    {D : Finset Vertex} {K delta gamma : ℝ} {A N : ℕ}
    (hA : 2 ≤ A) (hK : 2 < K) (hD : IsDownset N D)
    (hdelta₀ : 0 < delta) (hdelta₁ : delta < 1)
    (hgamma₀ : 0 < gamma) (hgamma₁ : gamma < 1)
    (hH : 1 < K * delta)
    (hlarge : (N : ℝ) ^ gamma < delta * (N : ℝ)) :
    RootNumericalBounds N A (rootTags D K A delta gamma N)
      ((N : ℝ) ^ gamma / delta) := by
  let G := concreteSweepGeometry hD hA hK hdelta₀ hdelta₁
    hgamma₀ hgamma₁ hH hlarge
  refine
    { roots_pos := rootTags_pos hD hdelta₀ hdelta₁ hgamma₀ hgamma₁ hH
      card_le := ?_
      weight_sum_le := rootWeightSum_le (by omega) hD hdelta₀ hdelta₁
        hgamma₀ hgamma₁ hH G
      max_weight_le := rootNuMax_le hD hdelta₀ hdelta₁
        hgamma₀ hgamma₁ hH }
  calc
    ((rootTags D K A delta gamma N).card : ℝ) ≤
        ((N / A : ℕ) : ℝ) := by
      exact_mod_cast rootTags_card_le_div (by omega) hD hdelta₀ hdelta₁
        hgamma₀ hgamma₁ hH G
    _ ≤ (N : ℝ) / (A : ℝ) := Nat.cast_div_le

/-- The remaining concrete game obligation, isolated without any numerical
conclusion.  For every admissible finite instance and every downset, it asks
for one fixed Shortener strategy and the factual accounting ledger of each
adaptive completed play. -/
def ConcreteSweepFamily : Type :=
  ∀ (b A : ℕ) (K delta gamma : ℝ),
    1 ≤ b → 2 ≤ A → 2 < K →
    0 < delta → delta < 1 →
    0 < gamma → gamma < 1 → 1 < K * delta →
    ∀ N : ℕ, (N : ℝ) ^ gamma < delta * (N : ℝ) →
    ∀ D : Finset Vertex, IsDownset N D →
      Σ sigmaS : Strategy Actor.shortener D (initialPos b),
        ∀ (sigmaP : Strategy Actor.prolonger D (initialPos b))
          (sigmaE : Strategy Actor.eraser D (initialPos b)),
          SweepOutcomeAccounting V b N A
            (Erdos872.exceptionalSet K A delta gamma N)
            ((N : ℝ) ^ gamma / delta)
            (playLength sigmaS sigmaP sigmaE)

/-- For fixed admissible `delta` and `gamma`, the concrete large-`N`
condition required by self-roughness holds eventually. -/
theorem eventually_rpow_lt_delta_mul
    {delta gamma : ℝ} (hdelta : 0 < delta) (hgamma : gamma < 1) :
    ∀ᶠ N : ℕ in atTop, (N : ℝ) ^ gamma < delta * (N : ℝ) := by
  have hratio : ∀ᶠ N : ℕ in atTop,
      (N : ℝ) ^ gamma / (N : ℝ) < delta :=
    (tendsto_order.1 (tendsto_natCast_rpow_div_self_zero hgamma)).2
      delta hdelta
  filter_upwards [hratio, eventually_ge_atTop 1] with N hratioN hN
  have hNpos : (0 : ℝ) < N := by exact_mod_cast (show 0 < N by omega)
  exact (div_lt_iff₀ hNpos).mp hratioN

/-- Concrete sweep ledgers imply the finite master family in precisely the
parameter order needed by the density-limit theorem. -/
theorem eventualMaster_of_concreteSweepFamily
    (hsweep : ConcreteSweepFamily) : EventualMasterInequality := by
  intro b A K delta gamma hb hA hK hdelta₀ hdelta₁
    hgamma₀ hgamma₁ hH
  filter_upwards [eventually_rpow_lt_delta_mul hdelta₀ hgamma₁] with N hlarge
  apply V_cast_le_master_of_sweeps (by omega)
  intro D hD
  exact hsweep b A K delta gamma hb hA hK hdelta₀ hdelta₁
    hgamma₀ hgamma₁ hH N hlarge D hD

/-- The concrete sweep family implies the density recursion with no
additional combinatorial or limiting hypothesis. -/
theorem density_recursion_of_concreteSweepFamily
    (hsweep : ConcreteSweepFamily) :
    ∀ b : ℕ, 1 ≤ b →
      Erdos872.upperDensity V b ≤
        (1 / 2 : ℝ) * Erdos872.upperDensity V (b + 1) :=
  density_recursion_of_eventual_master
    (eventualMaster_of_concreteSweepFamily hsweep)

/-- A concrete sweep family closes the already verified comparison and
asymptotic endpoint for the original divisor-antichain game. -/
theorem main_of_concreteSweepFamily
    (hsweep : ConcreteSweepFamily) :
    Tendsto (Erdos872.originalRatio L) atTop (nhds 0) :=
  conditional_main (density_recursion_of_concreteSweepFamily hsweep)

end

end Erdos872R177

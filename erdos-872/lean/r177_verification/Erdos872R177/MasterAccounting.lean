import Erdos872R177.RootSweepChronology
import Erdos872R177.SweepAccounting
import Erdos872R177.TailSup
import Erdos872R177.GameStrategies

namespace Erdos872R177

open Finset Set
open scoped BigOperators

noncomputable section

/-! # Three-class and finite master accounting

The concrete sweep supplies only its factual ledger: the activated-root
chronology, class counts, local-game bounds, and the elementary root-system
bounds.  This module derives (4.2), the three-class estimate, and (4.7).
-/

/-- The roots activated during the opening or later in the regular game. -/
def DraftingData.activeRoots
    {N b : ℕ} {R : Finset Vertex} (d : DraftingData N b R) :
    Finset Vertex :=
  (d.opening ++ d.post).toFinset

theorem DraftingData.activeRoots_subset
    {N b : ℕ} {R : Finset Vertex} (d : DraftingData N b R) :
    d.activeRoots ⊆ R := by
  intro t ht
  rw [DraftingData.activeRoots, List.mem_toFinset] at ht
  rcases List.mem_append.mp ht with ht | ht
  · exact d.opening_mem t ht
  · exact d.post_mem t ht

/-- Static numerical consequences of the root construction, corresponding to
(3.8), (3.10), and (3.11). -/
structure RootNumericalBounds
    (N A : ℕ) (R : Finset Vertex) (scale : ℝ) where
  roots_pos : ∀ t ∈ R, 0 < t
  card_le : ((R.card : ℕ) : ℝ) ≤ (N : ℝ) / (A : ℝ)
  weight_sum_le :
    rootWeightSum N R ≤ (N : ℝ) + (N : ℝ) / (A : ℝ)
  max_weight_le : nuMax N R ≤ scale

/-- The explicit output required from one completed play of the concrete
root sweep.  `totalSelections` is normally that play's `playLength`.

The field `total_le_classes` is only the factual three-way classification:
active-cone selections, one selection per fired root, and outside selections.
It contains none of the numerical conclusion of (4.7).
-/
structure SweepOutcomeAccounting
    (V : ℕ → ℕ → ℕ) (b N A : ℕ)
    (exceptional : Finset Vertex) (scale : ℝ)
    (totalSelections : ℕ) where
  roots : Finset Vertex
  rootBounds : RootNumericalBounds N A roots scale
  draft : DraftingData N b roots
  active_fired_disjoint : Disjoint draft.activeRoots draft.fired
  coneSelections : Vertex → ℕ
  outsideSelections : ℕ
  total_le_classes :
    totalSelections ≤
      ∑ t ∈ draft.activeRoots, coneSelections t +
        draft.fired.card + outsideSelections
  local_le : ∀ t ∈ draft.activeRoots,
    coneSelections t ≤ V (b + 1) (N / t)
  quotient_ge : ∀ t ∈ draft.activeRoots, A ≤ N / t
  outside_le_exceptional : outsideSelections ≤ exceptional.card

private theorem robustRatio_range_bddAbove
    (V : ℕ → ℕ → ℕ) (hV : ∀ b N, V b N ≤ N) (b : ℕ) :
    BddAbove (Set.range (Erdos872.robustRatio V b)) := by
  refine ⟨1, ?_⟩
  rintro _ ⟨m, rfl⟩
  exact (Erdos872.robustRatio_bounds V hV b m).2

theorem robustTailSup_nonneg
    (V : ℕ → ℕ → ℕ) (hV : ∀ b N, V b N ≤ N)
    (b A : ℕ) :
    0 ≤ Erdos872.robustTailSup V b A := by
  have hterm : 0 ≤ Erdos872.robustRatio V b A :=
    (Erdos872.robustRatio_bounds V hV b A).1
  exact hterm.trans <| Erdos872.le_tailSup
    (robustRatio_range_bddAbove V hV b) (le_refl A)

/-- The integer quotient `⌊N/t⌋` is at most the real weight `N/t`. -/
theorem natDiv_cast_le_rootWeight {N t : ℕ} (ht : 0 < t) :
    ((N / t : ℕ) : ℝ) ≤ rootWeight N t := by
  rw [rootWeight]
  apply (le_div_iff₀ (by exact_mod_cast ht)).2
  exact_mod_cast Nat.div_mul_le_self N t

/-- The tail supremum bounds one local robust value by its root weight. -/
theorem robustValue_le_tail_mul_rootWeight
    (V : ℕ → ℕ → ℕ) (hV : ∀ b N, V b N ≤ N)
    {b N A t : ℕ} (hA : 1 ≤ A) (ht : 0 < t) (hq : A ≤ N / t) :
    (V b (N / t) : ℝ) ≤
      Erdos872.robustTailSup V b A * rootWeight N t := by
  let q := N / t
  let M := Erdos872.robustTailSup V b A
  have hqPos : 0 < q := lt_of_lt_of_le (by omega) hq
  have hratio := Erdos872.le_tailSup
    (robustRatio_range_bddAbove V hV b) hq
  have hqNonneg : (0 : ℝ) ≤ q := by positivity
  have hmul := mul_le_mul_of_nonneg_right hratio hqNonneg
  have hM : 0 ≤ M := robustTailSup_nonneg V hV b A
  have hqWeight : (q : ℝ) ≤ rootWeight N t :=
    natDiv_cast_le_rootWeight ht
  have hright : M * (q : ℝ) ≤ M * rootWeight N t :=
    mul_le_mul_of_nonneg_left hqWeight hM
  calc
    (V b q : ℝ) = Erdos872.robustRatio V b q * (q : ℝ) := by
      rw [Erdos872.robustRatio]
      field_simp
    _ ≤ M * (q : ℝ) := hmul
    _ ≤ M * rootWeight N t := hright

namespace SweepOutcomeAccounting

theorem active_weight_le
    {V : ℕ → ℕ → ℕ} {b N A : ℕ}
    {exceptional : Finset Vertex} {scale : ℝ} {total : ℕ}
    (d : SweepOutcomeAccounting V b N A exceptional scale total) :
    rootWeightSum N d.draft.activeRoots ≤
      ((N : ℝ) + (N : ℝ) / (A : ℝ) +
        ((b + 1 : ℕ) : ℝ) * scale) / 2 := by
  have hdraft := d.draft.active_weight_le
  change rootWeightSum N d.draft.activeRoots ≤
    rootWeightSum N d.draft.fired +
      ((b + 1 : ℕ) : ℝ) * nuMax N d.roots at hdraft
  have hcoeff : (0 : ℝ) ≤ ((b + 1 : ℕ) : ℝ) := by positivity
  have hslack :
      ((b + 1 : ℕ) : ℝ) * nuMax N d.roots ≤
        ((b + 1 : ℕ) : ℝ) * scale :=
    mul_le_mul_of_nonneg_left d.rootBounds.max_weight_le hcoeff
  have hdraft' :
      rootWeightSum N d.draft.activeRoots ≤
        rootWeightSum N d.draft.fired +
          ((b + 1 : ℕ) : ℝ) * scale := by
    linarith
  have hdisjoint := disjoint_rootWeightSum_le_sub (N := N)
    d.draft.activeRoots_subset d.draft.fired_subset
    d.active_fired_disjoint
  have hhalf := Erdos872.drafting_implies_halving hdraft' hdisjoint
  linarith [d.rootBounds.weight_sum_le]

theorem active_selections_le
    {V : ℕ → ℕ → ℕ} (hV : ∀ b N, V b N ≤ N)
    {b N A : ℕ} {exceptional : Finset Vertex} {scale : ℝ}
    {total : ℕ}
    (d : SweepOutcomeAccounting V b N A exceptional scale total)
    (hA : 1 ≤ A) :
    ((∑ t ∈ d.draft.activeRoots, d.coneSelections t : ℕ) : ℝ) ≤
      Erdos872.robustTailSup V (b + 1) A *
        rootWeightSum N d.draft.activeRoots := by
  let M := Erdos872.robustTailSup V (b + 1) A
  calc
    ((∑ t ∈ d.draft.activeRoots, d.coneSelections t : ℕ) : ℝ) =
        ∑ t ∈ d.draft.activeRoots, (d.coneSelections t : ℝ) := by
          push_cast
          rfl
    _ ≤ ∑ t ∈ d.draft.activeRoots, M * rootWeight N t := by
      apply Finset.sum_le_sum
      intro t ht
      have hlocal : (d.coneSelections t : ℝ) ≤
          (V (b + 1) (N / t) : ℝ) := by
        exact_mod_cast d.local_le t ht
      exact hlocal.trans <| robustValue_le_tail_mul_rootWeight V hV hA
        (d.rootBounds.roots_pos t (d.draft.activeRoots_subset ht))
        (d.quotient_ge t ht)
    _ = M * rootWeightSum N d.draft.activeRoots := by
      simp [rootWeightSum, Finset.mul_sum]

/-- The three-class selection estimate before inserting the root-system
cardinality and halving bounds. -/
theorem three_class_bound
    {V : ℕ → ℕ → ℕ} (hV : ∀ b N, V b N ≤ N)
    {b N A : ℕ} {exceptional : Finset Vertex} {scale : ℝ}
    {total : ℕ}
    (d : SweepOutcomeAccounting V b N A exceptional scale total)
    (hA : 1 ≤ A) :
    (total : ℝ) ≤
      Erdos872.robustTailSup V (b + 1) A *
          rootWeightSum N d.draft.activeRoots +
        (d.draft.fired.card : ℝ) + (exceptional.card : ℝ) := by
  have hclasses : (total : ℝ) ≤
      ((∑ t ∈ d.draft.activeRoots, d.coneSelections t : ℕ) : ℝ) +
        (d.draft.fired.card : ℝ) + (d.outsideSelections : ℝ) := by
    exact_mod_cast d.total_le_classes
  have hactive := d.active_selections_le hV hA
  have hout : (d.outsideSelections : ℝ) ≤ exceptional.card := by
    exact_mod_cast d.outside_le_exceptional
  linarith

/-- Manuscript (4.7) for one completed play. -/
theorem finite_master_bound
    {V : ℕ → ℕ → ℕ} (hV : ∀ b N, V b N ≤ N)
    {b N A : ℕ} {exceptional : Finset Vertex} {scale : ℝ}
    {total : ℕ}
    (d : SweepOutcomeAccounting V b N A exceptional scale total)
    (hA : 1 ≤ A) :
    (total : ℝ) ≤
      (exceptional.card : ℝ) + (N : ℝ) / (A : ℝ) +
        Erdos872.robustTailSup V (b + 1) A / 2 *
          ((N : ℝ) + (N : ℝ) / (A : ℝ) +
            ((b + 1 : ℕ) : ℝ) * scale) := by
  let M := Erdos872.robustTailSup V (b + 1) A
  have hthree := d.three_class_bound hV hA
  have hfiredCard : d.draft.fired.card ≤ d.roots.card :=
    Finset.card_le_card d.draft.fired_subset
  have hfired : (d.draft.fired.card : ℝ) ≤
      (N : ℝ) / (A : ℝ) := by
    have hfiredReal : (d.draft.fired.card : ℝ) ≤ d.roots.card := by
      exact_mod_cast hfiredCard
    exact hfiredReal.trans d.rootBounds.card_le
  have hM : 0 ≤ M := robustTailSup_nonneg V hV (b + 1) A
  have hactiveWeight := d.active_weight_le
  have hscaled :
      M * rootWeightSum N d.draft.activeRoots ≤
        M * (((N : ℝ) + (N : ℝ) / (A : ℝ) +
          ((b + 1 : ℕ) : ℝ) * scale) / 2) :=
    mul_le_mul_of_nonneg_left hactiveWeight hM
  dsimp only [M] at hthree hM hscaled ⊢
  nlinarith

end SweepOutcomeAccounting

/-- The exact specialization of (4.7) to the manuscript exceptional set and
scale `N^γ/δ`. -/
theorem manuscript_4_7
    {V : ℕ → ℕ → ℕ} (hV : ∀ b N, V b N ≤ N)
    {b N A : ℕ} {K delta gamma : ℝ} {total : ℕ}
    (d : SweepOutcomeAccounting V b N A
      (Erdos872.exceptionalSet K A delta gamma N)
      ((N : ℝ) ^ gamma / delta) total)
    (hA : 1 ≤ A) :
    (total : ℝ) ≤
      (Erdos872.exceptionalSet K A delta gamma N).card +
        (N : ℝ) / (A : ℝ) +
        Erdos872.robustTailSup V (b + 1) A / 2 *
          ((N : ℝ) + (N : ℝ) / (A : ℝ) +
            ((b + 1 : ℕ) : ℝ) * ((N : ℝ) ^ gamma / delta)) := by
  exact d.finite_master_bound hV hA

/-- A single Shortener strategy whose every completed play supplies the
accounting ledger bounds the backward-induction value on that downset. -/
theorem v_cast_le_master_of_strategy
    {Vfun : ℕ → ℕ → ℕ} (hV : ∀ b N, Vfun b N ≤ N)
    {D : Finset Vertex} {b N A : ℕ}
    {exceptional : Finset Vertex} {scale : ℝ}
    (sigmaS : Strategy Actor.shortener D (initialPos b))
    (hA : 1 ≤ A)
    (haccount : ∀ sigmaP sigmaE,
      SweepOutcomeAccounting Vfun b N A exceptional scale
        (playLength sigmaS sigmaP sigmaE)) :
    (v b D : ℝ) ≤
      (exceptional.card : ℝ) + (N : ℝ) / (A : ℝ) +
        Erdos872.robustTailSup Vfun (b + 1) A / 2 *
          ((N : ℝ) + (N : ℝ) / (A : ℝ) +
            ((b + 1 : ℕ) : ℝ) * scale) := by
  have hv : v b D ≤ playLength sigmaS optimalProlonger optimalEraser := by
    simpa [v, playLength] using
      (gameValue_le_playFrom_optimalMax
        (h := (History.root : History D (initialPos b) (initialPos b))) sigmaS)
  have hvReal : (v b D : ℝ) ≤
      (playLength sigmaS optimalProlonger optimalEraser : ℝ) := by
    exact_mod_cast hv
  exact hvReal.trans <|
    (haccount optimalProlonger optimalEraser).finite_master_bound hV hA

/-- Uniform completed-sweep ledgers for every downset imply the finite-N
master inequality for `V_b(N)`.  This is the direct input to the subsequent
`N → ∞` and parameter-limit argument. -/
theorem V_cast_le_master_of_sweeps
    {b N A : ℕ} {exceptional : Finset Vertex} {scale : ℝ}
    (hA : 1 ≤ A)
    (hsweep : ∀ D, IsDownset N D →
      Σ sigmaS : Strategy Actor.shortener D (initialPos b),
        ∀ (sigmaP : Strategy Actor.prolonger D (initialPos b))
          (sigmaE : Strategy Actor.eraser D (initialPos b)),
          SweepOutcomeAccounting V b N A exceptional scale
            (playLength sigmaS sigmaP sigmaE)) :
    (V b N : ℝ) ≤
      (exceptional.card : ℝ) + (N : ℝ) / (A : ℝ) +
        Erdos872.robustTailSup V (b + 1) A / 2 *
          ((N : ℝ) + (N : ℝ) / (A : ℝ) +
            ((b + 1 : ℕ) : ℝ) * scale) := by
  obtain ⟨D, hDmem, hDV⟩ :=
    (downsets N).exists_mem_eq_sup (by exact ⟨∅, empty_mem_downsets N⟩) (v b)
  have hD : IsDownset N D := mem_downsets_iff.mp hDmem
  obtain ⟨sigmaS, haccount⟩ := hsweep D hD
  have hbound := v_cast_le_master_of_strategy V_le sigmaS hA haccount
  rw [V, hDV]
  exact hbound

end


end Erdos872R177

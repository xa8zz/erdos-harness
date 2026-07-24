import Erdos872R177.RootSweepGeometry
import Erdos872R177.RootSweepChronology
import Erdos872R177.UsefulTags

namespace Erdos872R177

open Finset
open scoped BigOperators

noncomputable section

/-! # Concrete arithmetic data for the root sweep

This file instantiates the policy-free `SweepGeometry` interface with the
useful tags and divisibility-minimal roots of manuscript §3.  It also proves
the finite cone and weight estimates used in (3.8)--(3.11).
-/

/-- The vertices of `D` which are useful for the fixed parameters. -/
noncomputable def usefulVertices
    (D : Finset Vertex) (K : ℝ) (A : ℕ) (delta gamma : ℝ) (N : ℕ) :
    Finset Vertex :=
  D.filter fun x ↦ x ∉ Erdos872.exceptionalSet K A delta gamma N

/-- The complementary factors `t_K(x)` arising from useful vertices. -/
noncomputable def usefulTags
    (D : Finset Vertex) (K : ℝ) (A : ℕ) (delta gamma : ℝ) (N : ℕ) :
    Finset Vertex :=
  (usefulVertices D K A delta gamma N).image (Erdos872.tK K)

/-- The divisibility-minimal useful tags. -/
noncomputable def rootTags
    (D : Finset Vertex) (K : ℝ) (A : ℕ) (delta gamma : ℝ) (N : ℕ) :
    Finset Vertex := by
  classical
  let T := usefulTags D K A delta gamma N
  exact T.filter (Erdos872.IsMinimalRoot T)

@[simp] theorem mem_usefulVertices_iff
    {D : Finset Vertex} {K : ℝ} {A : ℕ} {delta gamma : ℝ} {N x : ℕ} :
    x ∈ usefulVertices D K A delta gamma N ↔
      x ∈ D ∧ x ∉ Erdos872.exceptionalSet K A delta gamma N := by
  simp [usefulVertices]

theorem mem_usefulTags_iff
    {D : Finset Vertex} {K : ℝ} {A : ℕ} {delta gamma : ℝ} {N t : ℕ} :
    t ∈ usefulTags D K A delta gamma N ↔
      ∃ x ∈ D, x ∉ Erdos872.exceptionalSet K A delta gamma N ∧
        Erdos872.tK K x = t := by
  classical
  constructor
  · intro ht
    rcases Finset.mem_image.mp ht with ⟨x, hx, hxt⟩
    exact ⟨x, (mem_usefulVertices_iff.mp hx).1,
      (mem_usefulVertices_iff.mp hx).2, hxt⟩
  · rintro ⟨x, hxD, hxExceptional, hxt⟩
    exact Finset.mem_image.mpr
      ⟨x, mem_usefulVertices_iff.mpr ⟨hxD, hxExceptional⟩, hxt⟩

theorem mem_rootTags_iff
    {D : Finset Vertex} {K : ℝ} {A : ℕ} {delta gamma : ℝ} {N t : ℕ} :
    t ∈ rootTags D K A delta gamma N ↔
      Erdos872.IsMinimalRoot (usefulTags D K A delta gamma N) t := by
  classical
  change t ∈ (usefulTags D K A delta gamma N).filter
      (Erdos872.IsMinimalRoot (usefulTags D K A delta gamma N)) ↔ _
  rw [Finset.mem_filter]
  constructor
  · exact fun h ↦ h.2
  · exact fun h ↦ ⟨h.1, h⟩

theorem rootTags_subset_usefulTags
    (D : Finset Vertex) (K : ℝ) (A : ℕ) (delta gamma : ℝ) (N : ℕ) :
    rootTags D K A delta gamma N ⊆ usefulTags D K A delta gamma N := by
  intro t ht
  exact (mem_rootTags_iff.mp ht).1

theorem exceptionalSet_subset_board
    {K delta gamma : ℝ} {A N : ℕ} (hN : 1 ≤ N) :
    Erdos872.exceptionalSet K A delta gamma N ⊆ board N := by
  intro x hx
  rw [board]
  rcases Finset.mem_insert.mp hx with hx | hx
  · subst x
    exact Finset.mem_Icc.mpr ⟨le_rfl, hN⟩
  · have hrange := (Finset.mem_filter.mp hx).1
    have hxlt : x < N + 1 := Finset.mem_range.mp hrange
    have hxTwo := (Finset.mem_filter.mp hx).2.1
    exact Finset.mem_Icc.mpr ⟨by omega, by omega⟩

/-- Nonexceptionality is exactly the collection of hypotheses needed by the
useful-tag lemmas. -/
theorem usefulVertex_hypotheses
    {D : Finset Vertex} {K delta gamma : ℝ} {A N x : ℕ}
    (hD : IsDownset N D) (hxD : x ∈ D)
    (hxExceptional : x ∉ Erdos872.exceptionalSet K A delta gamma N)
    (hdelta₀ : 0 < delta) (hdelta₁ : delta < 1)
    (hgamma₀ : 0 < gamma) (hgamma₁ : gamma < 1)
    (hH : 1 < K * delta) :
    Erdos872.UsefulTagHypotheses K delta gamma A N x := by
  have hxBoard := hD.1 hxD
  have hxOne : 1 ≤ x := (Finset.mem_Icc.mp hxBoard).1
  have hxN : x ≤ N := (Finset.mem_Icc.mp hxBoard).2
  have hxNeOne : x ≠ 1 := by
    intro hx
    subst x
    exact hxExceptional (by simp [Erdos872.exceptionalSet])
  have hxTwo : 2 ≤ x := by omega
  have hnotBad :
      ¬((x : ℝ) ≤ delta * (N : ℝ) ∨
        Erdos872.aK K x ≤ A ∨
        (N : ℝ) ^ gamma < (Erdos872.aK K x : ℝ)) := by
    intro hbad
    apply hxExceptional
    exact Finset.mem_insert.mpr <| Or.inr <| Finset.mem_filter.mpr
      ⟨Finset.mem_range.mpr (by omega), hxTwo, hbad⟩
  refine ⟨?_, ?_, ?_, hxN, hdelta₀, hdelta₁, hgamma₀, hgamma₁, hH⟩
  · exact lt_of_not_ge fun h ↦ hnotBad (Or.inl h)
  · exact Nat.lt_of_not_ge fun h ↦ hnotBad (Or.inr (Or.inl h))
  · exact le_of_not_gt fun h ↦ hnotBad (Or.inr (Or.inr h))

/-- Every root has a useful vertex witnessing that it is a `t_K` tag. -/
theorem root_has_useful_witness
    {D : Finset Vertex} {K : ℝ} {A : ℕ} {delta gamma : ℝ} {N t : ℕ}
    (ht : t ∈ rootTags D K A delta gamma N) :
    ∃ x ∈ D, x ∉ Erdos872.exceptionalSet K A delta gamma N ∧
      Erdos872.tK K x = t := by
  exact mem_usefulTags_iff.mp ((mem_rootTags_iff.mp ht).1)

theorem usefulTags_pos
    {D : Finset Vertex} {K delta gamma : ℝ} {A N : ℕ}
    (hD : IsDownset N D)
    (hdelta₀ : 0 < delta) (hdelta₁ : delta < 1)
    (hgamma₀ : 0 < gamma) (hgamma₁ : gamma < 1)
    (hH : 1 < K * delta) :
    ∀ t ∈ usefulTags D K A delta gamma N, 0 < t := by
  intro t ht
  rcases mem_usefulTags_iff.mp ht with ⟨x, hxD, hxExceptional, rfl⟩
  exact Erdos872.useful_tK_pos
    (usefulVertex_hypotheses hD hxD hxExceptional
      hdelta₀ hdelta₁ hgamma₀ hgamma₁ hH)

theorem rootTags_pos
    {D : Finset Vertex} {K delta gamma : ℝ} {A N : ℕ}
    (hD : IsDownset N D)
    (hdelta₀ : 0 < delta) (hdelta₁ : delta < 1)
    (hgamma₀ : 0 < gamma) (hgamma₁ : gamma < 1)
    (hH : 1 < K * delta) :
    ∀ t ∈ rootTags D K A delta gamma N, 0 < t := by
  intro t ht
  exact usefulTags_pos hD hdelta₀ hdelta₁ hgamma₀ hgamma₁ hH t
    ((mem_rootTags_iff.mp ht).1)

theorem rootTags_mem_downset
    {D : Finset Vertex} {K delta gamma : ℝ} {A N : ℕ}
    (hD : IsDownset N D)
    (hdelta₀ : 0 < delta) (hdelta₁ : delta < 1)
    (hgamma₀ : 0 < gamma) (hgamma₁ : gamma < 1)
    (hH : 1 < K * delta) :
    rootTags D K A delta gamma N ⊆ D := by
  intro t ht
  rcases root_has_useful_witness ht with ⟨x, hxD, hxExceptional, htx⟩
  have hhyp := usefulVertex_hypotheses hD hxD hxExceptional
    hdelta₀ hdelta₁ hgamma₀ hgamma₁ hH
  have htPos : 0 < Erdos872.tK K x := Erdos872.useful_tK_pos hhyp
  have hxPos : 0 < x := by
    have hxBoard := hD.1 hxD
    exact lt_of_lt_of_le Nat.zero_lt_one (Finset.mem_Icc.mp hxBoard).1
  have hfactor := Erdos872.aK_mul_tK K (Nat.ne_of_gt hxPos)
  have htagDvd : Erdos872.tK K x ∣ x := by
    refine ⟨Erdos872.aK K x, ?_⟩
    simpa [Nat.mul_comm] using hfactor
  have htagLe : Erdos872.tK K x ≤ x := Nat.le_of_dvd hxPos htagDvd
  have htagBoard : Erdos872.tK K x ∈ board N := by
    apply Finset.mem_Icc.mpr
    exact ⟨htPos, htagLe.trans (Finset.mem_Icc.mp (hD.1 hxD)).2⟩
  rw [← htx]
  exact hD.2 x hxD _ htagBoard htagDvd

theorem usefulTags_selfRough
    {D : Finset Vertex} {K delta gamma : ℝ} {A N : ℕ}
    (hD : IsDownset N D)
    (hdelta₀ : 0 < delta) (hdelta₁ : delta < 1)
    (hgamma₀ : 0 < gamma) (hgamma₁ : gamma < 1)
    (hH : 1 < K * delta)
    (hlarge : (N : ℝ) ^ gamma < delta * (N : ℝ)) :
    Erdos872.SelfRoughTags
      (usefulTags D K A delta gamma N) N (K * delta) := by
  intro t ht
  rcases mem_usefulTags_iff.mp ht with ⟨x, hxD, hxExceptional, htx⟩
  have hhyp := usefulVertex_hypotheses hD hxD hxExceptional
    hdelta₀ hdelta₁ hgamma₀ hgamma₁ hH
  subst t
  refine ⟨Erdos872.useful_tK_pos hhyp, ?_⟩
  have hrough := Erdos872.useful_minFac_gt_scale hhyp hlarge
  simpa [div_eq_mul_inv, mul_assoc] using hrough

private theorem N_pos_of_large
    {N : ℕ} {delta gamma : ℝ}
    (hgamma₀ : 0 < gamma)
    (hlarge : (N : ℝ) ^ gamma < delta * (N : ℝ)) : 0 < N := by
  by_contra hN
  have : N = 0 := Nat.eq_zero_of_not_pos hN
  subst N
  rw [Nat.cast_zero, Real.zero_rpow hgamma₀.ne'] at hlarge
  simp at hlarge

/-- The concrete policy-independent geometry associated with the manuscript's
useful tags and minimal roots. -/
noncomputable def concreteSweepGeometry
    {D : Finset Vertex} {K delta gamma : ℝ} {A N : ℕ}
    (hD : IsDownset N D)
    (_hA : 2 ≤ A) (_hK : 2 < K)
    (hdelta₀ : 0 < delta) (hdelta₁ : delta < 1)
    (hgamma₀ : 0 < gamma) (hgamma₁ : gamma < 1)
    (hH : 1 < K * delta)
    (hlarge : (N : ℝ) ^ gamma < delta * (N : ℝ)) :
    SweepGeometry D (rootTags D K A delta gamma N) N := by
  let T := usefulTags D K A delta gamma N
  let R := rootTags D K A delta gamma N
  have hN : 0 < N := N_pos_of_large hgamma₀ hlarge
  have hTpos : ∀ t ∈ T, 0 < t :=
    usefulTags_pos hD hdelta₀ hdelta₁ hgamma₀ hgamma₁ hH
  have hrough : Erdos872.SelfRoughTags T N (K * delta) :=
    usefulTags_selfRough hD hdelta₀ hdelta₁ hgamma₀ hgamma₁ hH hlarge
  refine
    { downset := hD
      roots_pos := rootTags_pos hD hdelta₀ hdelta₁ hgamma₀ hgamma₁ hH
      roots_mem := rootTags_mem_downset hD hdelta₀ hdelta₁ hgamma₀ hgamma₁ hH
      cones_disjoint := ?_
      cones_incomparable := ?_
      exceptional := Erdos872.exceptionalSet K A delta gamma N
      exceptional_subset_board := exceptionalSet_subset_board hN
      coverage := ?_ }
  · intro s t hs ht hst
    rw [Finset.disjoint_left]
    intro x hxs hxt
    exact Erdos872.minimalRoot_cones_disjoint hN hH hrough
      (mem_rootTags_iff.mp hs) (mem_rootTags_iff.mp ht) hst x
      (rootCone_mem_iff.mp hxs) (rootCone_mem_iff.mp hxt)
  · intro s t x y hs ht hst hxs hyt
    have hinc := Erdos872.minimalRoot_cones_divisibility_incomparable
      hN hH hrough (mem_rootTags_iff.mp hs) (mem_rootTags_iff.mp ht) hst
      (rootCone_mem_iff.mp hxs) (rootCone_mem_iff.mp hyt)
    intro hcomp
    exact hcomp.elim hinc.1 hinc.2
  · intro x hxD hxExceptional
    have hhyp := usefulVertex_hypotheses hD hxD hxExceptional
      hdelta₀ hdelta₁ hgamma₀ hgamma₁ hH
    have hxTag : Erdos872.tK K x ∈ T := by
      apply mem_usefulTags_iff.mpr
      exact ⟨x, hxD, hxExceptional, rfl⟩
    rcases Erdos872.exists_minimalRoot_dvd hTpos hxTag with ⟨r, hr, hrt⟩
    have hxPos : 0 < x := by
      have hxBoard := hD.1 hxD
      exact lt_of_lt_of_le Nat.zero_lt_one (Finset.mem_Icc.mp hxBoard).1
    have hfactor := Erdos872.aK_mul_tK K (Nat.ne_of_gt hxPos)
    have htagDvd : Erdos872.tK K x ∣ x := by
      refine ⟨Erdos872.aK K x, ?_⟩
      simpa [Nat.mul_comm] using hfactor
    refine ⟨r, mem_rootTags_iff.mpr hr, rootCone_mem_iff.mpr ?_⟩
    exact ⟨hxPos, hrt.trans htagDvd,
      (Finset.mem_Icc.mp (hD.1 hxD)).2⟩

/-- The exact cardinality `q_t = floor(N/t)` of a full positive root cone. -/
theorem rootCone_card (N t : ℕ) : (rootCone N t).card = N / t := by
  rw [rootCone, board,
    show Finset.Icc 1 N = Finset.Ioc 0 N by
      simpa using (Finset.Icc_succ_left_eq_Ioc 0 N)]
  exact Nat.Ioc_filter_dvd_card_eq_div N t

/-- Every root satisfies the scale window (3.8). -/
theorem root_scale_window
    {D : Finset Vertex} {K delta gamma : ℝ} {A N t : ℕ}
    (hD : IsDownset N D)
    (hdelta₀ : 0 < delta) (hdelta₁ : delta < 1)
    (hgamma₀ : 0 < gamma) (hgamma₁ : gamma < 1)
    (hH : 1 < K * delta)
    (ht : t ∈ rootTags D K A delta gamma N) :
    (A : ℝ) < rootWeight N t ∧
      rootWeight N t ≤ (N : ℝ) ^ gamma / delta := by
  rcases root_has_useful_witness ht with ⟨x, hxD, hxExceptional, htx⟩
  have hhyp := usefulVertex_hypotheses hD hxD hxExceptional
    hdelta₀ hdelta₁ hgamma₀ hgamma₁ hH
  have hwindow := Erdos872.useful_scale_window hhyp
  simpa [rootWeight, htx] using hwindow

/-- Integrality of `A` turns the strict real scale lower bound into
`A ≤ q_t`. -/
theorem root_quotient_ge
    {D : Finset Vertex} {K delta gamma : ℝ} {A N t : ℕ}
    (hD : IsDownset N D)
    (hdelta₀ : 0 < delta) (hdelta₁ : delta < 1)
    (hgamma₀ : 0 < gamma) (hgamma₁ : gamma < 1)
    (hH : 1 < K * delta)
    (ht : t ∈ rootTags D K A delta gamma N) :
    A ≤ N / t := by
  have htPos := rootTags_pos hD hdelta₀ hdelta₁ hgamma₀ hgamma₁ hH t ht
  have hlower := (root_scale_window hD hdelta₀ hdelta₁
    hgamma₀ hgamma₁ hH ht).1
  have hmul : (A : ℝ) * (t : ℝ) < (N : ℝ) := by
    exact (lt_div_iff₀ (by exact_mod_cast htPos)).mp (by
      simpa [rootWeight] using hlower)
  have hmulNat : A * t < N := by exact_mod_cast hmul
  exact (Nat.le_div_iff_mul_le htPos).2 hmulNat.le

theorem rootQuotientSum_le
    {D R : Finset Vertex} {N : ℕ} (G : SweepGeometry D R N) :
    ∑ t ∈ R, N / t ≤ N := by
  have hpair : (R : Set Vertex).PairwiseDisjoint (rootCone N) := by
    intro s hs t ht hst
    exact G.cones_disjoint hs ht hst
  have hcard := Finset.card_biUnion hpair
  have hsubset : R.biUnion (rootCone N) ⊆ board N := by
    intro x hx
    rcases Finset.mem_biUnion.mp hx with ⟨t, ht, hxt⟩
    exact rootCone_subset_board N t hxt
  have hle := Finset.card_le_card hsubset
  rw [hcard] at hle
  simpa [rootCone_card, board] using hle

/-- Manuscript (3.10). -/
theorem rootTags_card_le_div
    {D : Finset Vertex} {K delta gamma : ℝ} {A N : ℕ}
    (hA : 1 ≤ A)
    (hD : IsDownset N D)
    (hdelta₀ : 0 < delta) (hdelta₁ : delta < 1)
    (hgamma₀ : 0 < gamma) (hgamma₁ : gamma < 1)
    (hH : 1 < K * delta)
    (G : SweepGeometry D (rootTags D K A delta gamma N) N) :
    (rootTags D K A delta gamma N).card ≤ N / A := by
  let R := rootTags D K A delta gamma N
  have hlower : ∑ t ∈ R, A ≤ ∑ t ∈ R, N / t := by
    apply Finset.sum_le_sum
    intro t ht
    exact root_quotient_ge hD hdelta₀ hdelta₁ hgamma₀ hgamma₁ hH ht
  have hsum := rootQuotientSum_le G
  have hprod : R.card * A ≤ N := by
    calc
      R.card * A = ∑ _t ∈ R, A := by simp [Nat.mul_comm]
      _ ≤ ∑ t ∈ R, N / t := hlower
      _ ≤ N := hsum
  exact (Nat.le_div_iff_mul_le (by omega : 0 < A)).2 hprod

private theorem rootWeight_le_quotient_add_one {N t : ℕ} :
    rootWeight N t ≤ (N / t : ℕ) + 1 := by
  have hfloor := Nat.lt_floor_add_one ((N : ℝ) / (t : ℝ))
  rw [Nat.floor_div_eq_div] at hfloor
  exact hfloor.le

/-- Manuscript (3.11). -/
theorem rootWeightSum_le
    {D : Finset Vertex} {K delta gamma : ℝ} {A N : ℕ}
    (hA : 1 ≤ A)
    (hD : IsDownset N D)
    (hdelta₀ : 0 < delta) (hdelta₁ : delta < 1)
    (hgamma₀ : 0 < gamma) (hgamma₁ : gamma < 1)
    (hH : 1 < K * delta)
    (G : SweepGeometry D (rootTags D K A delta gamma N) N) :
    rootWeightSum N (rootTags D K A delta gamma N) ≤
      (N : ℝ) + (N : ℝ) / (A : ℝ) := by
  let R := rootTags D K A delta gamma N
  have hweights : rootWeightSum N R ≤
      ∑ t ∈ R, (((N / t : ℕ) : ℝ) + 1) := by
    exact Finset.sum_le_sum fun t ht ↦ rootWeight_le_quotient_add_one
  have hsumNat := rootQuotientSum_le G
  have hsumReal : ((∑ t ∈ R, N / t : ℕ) : ℝ) ≤ (N : ℝ) := by
    exact_mod_cast hsumNat
  have hcardNat := rootTags_card_le_div hA hD hdelta₀ hdelta₁
    hgamma₀ hgamma₁ hH G
  have hcardReal : (R.card : ℝ) ≤ (N : ℝ) / (A : ℝ) := by
    calc
      (R.card : ℝ) ≤ ((N / A : ℕ) : ℝ) := by exact_mod_cast hcardNat
      _ ≤ (N : ℝ) / (A : ℝ) := Nat.cast_div_le
  calc
    rootWeightSum N R ≤ ∑ t ∈ R, (((N / t : ℕ) : ℝ) + 1) := hweights
    _ = ((∑ t ∈ R, N / t : ℕ) : ℝ) + (R.card : ℝ) := by
      rw [Finset.sum_add_distrib]
      simp
    _ ≤ (N : ℝ) + (N : ℝ) / (A : ℝ) := add_le_add hsumReal hcardReal

/-- The maximum root weight satisfies the upper half of (3.8). -/
theorem rootNuMax_le
    {D : Finset Vertex} {K delta gamma : ℝ} {A N : ℕ}
    (hD : IsDownset N D)
    (hdelta₀ : 0 < delta) (hdelta₁ : delta < 1)
    (hgamma₀ : 0 < gamma) (hgamma₁ : gamma < 1)
    (hH : 1 < K * delta) :
    nuMax N (rootTags D K A delta gamma N) ≤
      (N : ℝ) ^ gamma / delta := by
  let R := rootTags D K A delta gamma N
  by_cases hR : R.Nonempty
  · rw [nuMax, dif_pos hR]
    apply Finset.sup'_le hR
    intro t ht
    exact (root_scale_window hD hdelta₀ hdelta₁
      hgamma₀ hgamma₁ hH ht).2
  · rw [nuMax, dif_neg hR]
    exact div_nonneg (Real.rpow_nonneg (Nat.cast_nonneg N) gamma) hdelta₀.le

end

end Erdos872R177

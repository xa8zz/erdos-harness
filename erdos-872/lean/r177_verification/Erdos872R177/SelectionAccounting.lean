import Erdos872R177.LocalTrace
import Erdos872R177.RootSweepGeometry

namespace Erdos872R177

open Finset

noncomputable section

/-! # Selection-list accounting helpers -/

/-- Every vertex selected along a legal history is unavailable at its
endpoint. -/
theorem History.selectedVertices_not_live
    {D : Finset Vertex} {start p : Pos}
    (h : History D start p) :
    ∀ x ∈ selectedVertices h.actions, x ∉ liveLegal D p.state := by
  induction h with
  | root => simp [History.actions, selectedVertices]
  | @snoc q h a ha ih =>
      intro x hx
      rw [History.actions, selectedVertices_append] at hx
      rcases List.mem_append.mp hx with hx | hx
      · intro hxLive
        exact ih x hx (liveLegal_step_subset_geometry D q a hxLive)
      · cases a with
        | erase U => simp [selectedVertices] at hx
        | pass => simp [selectedVertices] at hx
        | endOpening => simp [selectedVertices] at hx
        | select y =>
            simp [selectedVertices] at hx
            subst x
            rw [step_select_state]
            exact selected_not_liveLegal D q.state y

/-- Legal play never selects the same vertex twice. -/
theorem History.selectedVertices_nodup
    {D : Finset Vertex} {start p : Pos}
    (h : History D start p) :
    (selectedVertices h.actions).Nodup := by
  induction h with
  | root => simp [History.actions, selectedVertices]
  | @snoc q h a ha ih =>
      rw [History.actions, selectedVertices_append]
      cases a with
      | erase U => simpa [selectedVertices] using ih
      | pass => simpa [selectedVertices] using ih
      | endOpening => simpa [selectedVertices] using ih
      | select y =>
          change (selectedVertices h.actions ++ [y]).Nodup
          rw [List.nodup_append]
          refine ⟨ih, List.nodup_singleton y, ?_⟩
          intro x hx z hz hxz
          simp only [List.mem_singleton] at hz
          subst z
          subst x
          have hyLive : y ∈ liveLegal D q.state :=
            select_mem_liveLegal_of_legal ha
          exact h.selectedVertices_not_live y hx hyLive

/-- Every selected vertex belongs to the original board `D`. -/
theorem History.selectedVertices_subset_board
    {D : Finset Vertex} {start p : Pos}
    (h : History D start p) :
    ∀ x ∈ selectedVertices h.actions, x ∈ D := by
  induction h with
  | root => simp [History.actions, selectedVertices]
  | @snoc q h a ha ih =>
      intro x hx
      rw [History.actions, selectedVertices_append] at hx
      rcases List.mem_append.mp hx with hx | hx
      · exact ih x hx
      · cases a with
        | erase U => simp [selectedVertices] at hx
        | pass => simp [selectedVertices] at hx
        | endOpening => simp [selectedVertices] at hx
        | select y =>
            simp [selectedVertices] at hx
            subst x
            exact (Finset.mem_filter.mp (select_mem_liveLegal_of_legal ha)).1

/-- Selected vertices outside every root cone, retaining chronological
multiplicity (which is in fact one by `selectedVertices_nodup`). -/
def outsideConeSelections (R : Finset Vertex) (N : ℕ) (as : List Action) :
    List Vertex :=
  (selectedVertices as).filter fun x => ∀ t ∈ R, x ∉ rootCone N t

theorem outsideConeSelections_nodup
    {D R : Finset Vertex} {N : ℕ} {start p : Pos}
    (h : History D start p) :
    (outsideConeSelections R N h.actions).Nodup := by
  exact h.selectedVertices_nodup.filter _

/-- Geometry coverage charges every selected vertex outside all root cones
to the exceptional set, without counting exceptional vertices that lie in an
active cone. -/
theorem outsideConeSelections_length_le_exceptional
    {D R : Finset Vertex} {N : ℕ} {start p : Pos}
    (G : SweepGeometry D R N) (h : History D start p) :
    (outsideConeSelections R N h.actions).length ≤ G.exceptional.card := by
  let xs := outsideConeSelections R N h.actions
  have hnodup : xs.Nodup := outsideConeSelections_nodup h
  have hsubset : xs.toFinset ⊆ G.exceptional := by
    intro x hx
    have hxList : x ∈ xs := by simpa [xs] using hx
    have hxData := List.mem_filter.mp hxList
    exact G.outside_all_cones_mem_exceptional
      (h.selectedVertices_subset_board x hxData.1)
      (of_decide_eq_true hxData.2)
  rw [← List.toFinset_card_of_nodup hnodup]
  exact Finset.card_le_card hsubset

/-- The chronological selections lying in one root cone. -/
def selectedConeVertices (N t : ℕ) (as : List Action) : List Vertex :=
  (selectedVertices as).filter fun x => x ∈ rootCone N t

theorem selectedConeVertices_length_eq_projected
    {N t : ℕ} {as : List Action}
    (hboard : ∀ x ∈ selectedVertices as, x ∈ board N) :
    (selectedConeVertices N t as).length =
      (projectedConeSelections t as).length := by
  induction as with
  | nil => simp [selectedConeVertices, selectedVertices,
      projectedConeSelections]
  | cons a as ih =>
      have htail : ∀ x ∈ selectedVertices as, x ∈ board N := by
        intro x hx
        exact hboard x (by cases a <;> simp [selectedVertices, hx])
      cases a with
      | erase U =>
          simpa [selectedConeVertices, selectedVertices,
            projectedConeSelections] using ih htail
      | pass =>
          simpa [selectedConeVertices, selectedVertices,
            projectedConeSelections] using ih htail
      | endOpening =>
          simpa [selectedConeVertices, selectedVertices,
            projectedConeSelections] using ih htail
      | select x =>
          have hxBoard : x ∈ board N := hboard x (by simp [selectedVertices])
          have hxPos : 0 < x := by
            exact (Finset.mem_Icc.mp hxBoard).1
          have hxLe : x ≤ N := (Finset.mem_Icc.mp hxBoard).2
          have hcone : x ∈ rootCone N t ↔ t ∣ x := by
            constructor
            · exact fun hx => (rootCone_mem_iff.mp hx).2.1
            · exact fun hx => rootCone_mem_iff.mpr ⟨hxPos, hx, hxLe⟩
          by_cases htx : t ∣ x
          · have hxCone : x ∈ rootCone N t := hcone.mpr htx
            simpa [selectedConeVertices, selectedVertices,
              projectedConeSelections, htx, hxCone] using ih htail
          · have hxCone : x ∉ rootCone N t := hcone.not.mpr htx
            simpa [selectedConeVertices, selectedVertices,
              projectedConeSelections, htx, hxCone] using ih htail

theorem selectedConeVertices_nodup
    {D : Finset Vertex} {start p : Pos} {N t : ℕ}
    (h : History D start p) :
    (selectedConeVertices N t h.actions).Nodup := by
  exact h.selectedVertices_nodup.filter _

/-- A pointwise three-class certificate gives the finite selection-count
inequality used by `SweepOutcomeAccounting`.  Disjointness is not needed for
this upper bound; it is supplied separately for the drafting estimate. -/
theorem History.totalScore_le_three_classes
    {D R : Finset Vertex} {N : ℕ} {start p : Pos}
    (G : SweepGeometry D R N) (h : History D start p)
    (active fired : Finset Vertex)
    (hclass : ∀ x ∈ selectedVertices h.actions,
      (∃ t ∈ active, x ∈ rootCone N t) ∨
        x ∈ fired ∨ (∀ t ∈ R, x ∉ rootCone N t)) :
    h.totalScore ≤
      ∑ t ∈ active, (projectedConeSelections t h.actions).length +
        fired.card + (outsideConeSelections R N h.actions).length := by
  let S : Finset Vertex := (selectedVertices h.actions).toFinset
  let C : Vertex → Finset Vertex := fun t =>
    (selectedConeVertices N t h.actions).toFinset
  let O : Finset Vertex := (outsideConeSelections R N h.actions).toFinset
  have hsubset : S ⊆ active.biUnion C ∪ fired ∪ O := by
    intro x hx
    have hxList : x ∈ selectedVertices h.actions := by simpa [S] using hx
    rcases hclass x hxList with hcone | hfired | hout
    · rcases hcone with ⟨t, ht, hxt⟩
      apply Finset.mem_union_left
      apply Finset.mem_union_left
      apply Finset.mem_biUnion.mpr
      refine ⟨t, ht, ?_⟩
      change x ∈ (selectedConeVertices N t h.actions).toFinset
      rw [List.mem_toFinset]
      exact List.mem_filter.mpr ⟨hxList, decide_eq_true hxt⟩
    · exact Finset.mem_union_left O (Finset.mem_union_right _ hfired)
    · apply Finset.mem_union_right
      change x ∈ (outsideConeSelections R N h.actions).toFinset
      rw [List.mem_toFinset]
      exact List.mem_filter.mpr ⟨hxList, decide_eq_true hout⟩
  have hSCard : S.card = (selectedVertices h.actions).length := by
    change (selectedVertices h.actions).toFinset.card = _
    exact List.toFinset_card_of_nodup h.selectedVertices_nodup
  have hOCard : O.card = (outsideConeSelections R N h.actions).length := by
    change (outsideConeSelections R N h.actions).toFinset.card = _
    exact List.toFinset_card_of_nodup (outsideConeSelections_nodup h)
  have hboard : ∀ x ∈ selectedVertices h.actions, x ∈ board N := by
    intro x hx
    exact G.downset.1 (h.selectedVertices_subset_board x hx)
  have hCCard : ∀ t, (C t).card =
      (projectedConeSelections t h.actions).length := by
    intro t
    change (selectedConeVertices N t h.actions).toFinset.card = _
    rw [List.toFinset_card_of_nodup (selectedConeVertices_nodup h)]
    exact selectedConeVertices_length_eq_projected hboard
  have hcover := Finset.card_le_card hsubset
  have hunion₁ := Finset.card_union_le (active.biUnion C) fired
  have hunion₂ := Finset.card_union_le (active.biUnion C ∪ fired) O
  have hcones := Finset.card_biUnion_le (s := active) (t := C)
  rw [History.totalScore_eq_selectedVertices_length, ← hSCard]
  calc
    S.card ≤ (active.biUnion C ∪ fired ∪ O).card := hcover
    _ ≤ (active.biUnion C).card + fired.card + O.card := by omega
    _ ≤ (∑ t ∈ active, (C t).card) + fired.card + O.card := by
      omega
    _ = ∑ t ∈ active, (projectedConeSelections t h.actions).length +
        fired.card + (outsideConeSelections R N h.actions).length := by
      simp_rw [hCCard]
      rw [hOCard]

end

end Erdos872R177

import Erdos872R177.GameStrategies
import Erdos872R177.MinimalRoots

namespace Erdos872R177

open Finset

noncomputable section

/-! # Static geometry for the root-cone sweep

This module isolates the policy-free geometry needed by the global sweep.
It contains no chronology, drafting, or strategy assumptions.
-/

/-- The full root cone `C_t = {x ∈ [N] : t ∣ x}`. -/
def rootCone (N t : ℕ) : Finset Vertex :=
  (board N).filter fun x ↦ t ∣ x

@[simp] theorem rootCone_mem_iff {N t x : ℕ} :
    x ∈ rootCone N t ↔ Erdos872.InCone N t x := by
  simp only [rootCone, mem_filter, board, mem_Icc, Erdos872.InCone]
  constructor
  · rintro ⟨⟨hxOne, hxN⟩, htx⟩
    exact ⟨by omega, htx, hxN⟩
  · rintro ⟨hxPos, htx, hxN⟩
    exact ⟨⟨by omega, hxN⟩, htx⟩

theorem rootCone_subset_board (N t : ℕ) : rootCone N t ⊆ board N := by
  intro x hx
  exact (Finset.mem_filter.mp hx).1

/-- Every nonexceptional vertex of `D` is covered by a root cone.

The exceptional set may overlap root cones; the manuscript only charges
vertices outside all cones to it.
-/
def CoversOutsideExceptional
    (D R exceptional : Finset Vertex) (N : ℕ) : Prop :=
  ∀ ⦃x : Vertex⦄, x ∈ D → x ∉ exceptional →
    ∃ t ∈ R, x ∈ rootCone N t

/-- Static, policy-independent data for a root-cone sweep. -/
structure SweepGeometry
    (D R : Finset Vertex) (N : ℕ) where
  downset : IsDownset N D
  roots_pos : ∀ ⦃t : Vertex⦄, t ∈ R → 0 < t
  roots_mem : R ⊆ D
  cones_disjoint :
    ∀ ⦃s t : Vertex⦄, s ∈ R → t ∈ R → s ≠ t →
      Disjoint (rootCone N s) (rootCone N t)
  cones_incomparable :
    ∀ ⦃s t x y : Vertex⦄, s ∈ R → t ∈ R → s ≠ t →
      x ∈ rootCone N s → y ∈ rootCone N t → ¬Comparable x y
  exceptional : Finset Vertex
  exceptional_subset_board : exceptional ⊆ board N
  coverage : CoversOutsideExceptional D R exceptional N

namespace SweepGeometry

theorem board_containment
    {D R : Finset Vertex} {N : ℕ} (G : SweepGeometry D R N) :
    D ⊆ board N :=
  G.downset.1

theorem root_mem_cone
    {D R : Finset Vertex} {N t : ℕ} (G : SweepGeometry D R N)
    (ht : t ∈ R) : t ∈ rootCone N t := by
  apply rootCone_mem_iff.mpr
  have htD : t ∈ D := G.roots_mem ht
  have htBoard : t ∈ board N := G.downset.1 htD
  exact ⟨G.roots_pos ht, dvd_rfl, (Finset.mem_Icc.mp htBoard).2⟩

theorem root_live_initial
    {D R : Finset Vertex} {N t : ℕ} (G : SweepGeometry D R N)
    (ht : t ∈ R) : t ∈ liveLegal D emptyState := by
  simp [liveLegal, emptyState, G.roots_mem ht]

/-- A vertex belongs to at most one root cone. -/
theorem root_eq_of_mem_cones
    {D R : Finset Vertex} {N s t x : ℕ} (G : SweepGeometry D R N)
    (hs : s ∈ R) (ht : t ∈ R)
    (hxs : x ∈ rootCone N s) (hxt : x ∈ rootCone N t) :
    s = t := by
  by_contra hne
  exact Finset.disjoint_left.mp (G.cones_disjoint hs ht hne) hxs hxt

theorem existsUnique_root_of_mem_cone
    {D R : Finset Vertex} {N t x : ℕ} (G : SweepGeometry D R N)
    (ht : t ∈ R) (hx : x ∈ rootCone N t) :
    ∃! s, s ∈ R ∧ x ∈ rootCone N s := by
  refine ⟨t, ⟨ht, hx⟩, ?_⟩
  intro s hs
  exact G.root_eq_of_mem_cones hs.1 ht hs.2 hx

/-- A live selected vertex divisible by a root has that unique root cone. -/
theorem live_vertex_unique_root_of_dvd
    {D R : Finset Vertex} {N t x : ℕ} {p : Pos}
    (G : SweepGeometry D R N)
    (hxLive : x ∈ liveLegal D p.state)
    (ht : t ∈ R) (htx : t ∣ x) :
    ∃! s, s ∈ R ∧ x ∈ rootCone N s := by
  have hxD : x ∈ D := (Finset.mem_filter.mp hxLive).1
  have hxBoard : x ∈ board N := G.downset.1 hxD
  have hxPos : 0 < x := by
    have hxOne : 1 ≤ x := (Finset.mem_Icc.mp hxBoard).1
    omega
  have hxCone : x ∈ rootCone N t := by
    apply rootCone_mem_iff.mpr
    exact ⟨hxPos, htx, (Finset.mem_Icc.mp hxBoard).2⟩
  exact G.existsUnique_root_of_mem_cone ht hxCone

private lemma select_action_mem_liveLegal
    {D : Finset Vertex} {p : Pos} {x : Vertex}
    (ha : Action.select x ∈ legalActions D p) :
    x ∈ liveLegal D p.state := by
  unfold legalActions at ha
  split at ha
  · simp at ha
  · cases hstage : p.stage with
    | beforeErase =>
        simp only [hstage] at ha
        unfold erasureActions at ha
        simp at ha
    | actorAction =>
        simp only [hstage] at ha
        cases hphase : p.phase with
        | opening r =>
            cases r with
            | zero => simp [hphase] at ha
            | succ r =>
                simp only [hphase, Finset.mem_insert, selectionActions,
                  Finset.mem_image] at ha
                rcases ha with ha | ⟨y, hy, hxy⟩
                · contradiction
                · cases hxy
                  exact hy
        | regular who =>
            cases who with
            | prolonger =>
                simp only [hphase, Finset.mem_insert, selectionActions,
                  Finset.mem_image] at ha
                rcases ha with ha | ⟨y, hy, hxy⟩
                · contradiction
                · cases hxy
                  exact hy
            | shortener =>
                simpa [hphase, selectionActions] using ha

/-- A legal selection divisible by a root identifies its unique root cone. -/
theorem selected_action_unique_root_of_dvd
    {D R : Finset Vertex} {N t x : ℕ} {p : Pos}
    (G : SweepGeometry D R N)
    (ha : Action.select x ∈ legalActions D p)
    (ht : t ∈ R) (htx : t ∣ x) :
    ∃! s, s ∈ R ∧ x ∈ rootCone N s := by
  exact G.live_vertex_unique_root_of_dvd
    (select_action_mem_liveLegal ha) ht htx

theorem outside_all_cones_mem_exceptional
    {D R : Finset Vertex} {N x : ℕ} (G : SweepGeometry D R N)
    (hxD : x ∈ D) (hout : ∀ t ∈ R, x ∉ rootCone N t) :
    x ∈ G.exceptional := by
  by_contra hxExceptional
  rcases G.coverage hxD hxExceptional with ⟨t, ht, hxt⟩
  exact hout t ht hxt

theorem nonexceptional_has_unique_root
    {D R : Finset Vertex} {N x : ℕ} (G : SweepGeometry D R N)
    (hxD : x ∈ D) (hxExceptional : x ∉ G.exceptional) :
    ∃! t, t ∈ R ∧ x ∈ rootCone N t := by
  rcases G.coverage hxD hxExceptional with ⟨t, ht, hxt⟩
  exact G.existsUnique_root_of_mem_cone ht hxt

/-- At a Shortener node, a live root is a legal root-sweep selection. -/
theorem root_select_legal
    {D R : Finset Vertex} {N t : ℕ} {p : Pos}
    (G : SweepGeometry D R N) (ht : t ∈ R)
    (hs : actorAt D p = some Actor.shortener)
    (htLive : t ∈ liveLegal D p.state) :
    Action.select t ∈ legalActions D p := by
  have _ := G.roots_pos ht
  unfold actorAt at hs
  split at hs
  · contradiction
  · rename_i hlive
    cases hstage : p.stage with
    | beforeErase => simp [hstage] at hs
    | actorAction =>
        cases hphase : p.phase with
        | opening r => cases r <;> simp [hstage, hphase] at hs
        | regular who =>
            cases who with
            | prolonger => simp [hstage, hphase] at hs
            | shortener =>
                simp [legalActions, hlive, hstage, hphase,
                  selectionActions, htLive]

end SweepGeometry

/-- Once a root is selected, no member of its cone is live. -/
theorem selected_root_cone_not_live
    {D : Finset Vertex} {N t x : ℕ} {p : Pos}
    (htSelected : t ∈ p.state.selected)
    (hxCone : x ∈ rootCone N t) :
    x ∉ liveLegal D p.state := by
  intro hxLive
  rcases Finset.mem_filter.mp hxLive with
    ⟨_, _, _, hxIncomparable⟩
  apply hxIncomparable t htSelected
  exact Or.inr (rootCone_mem_iff.mp hxCone).2.1

theorem root_selectState_kills_cone
    {D : Finset Vertex} {N t x : ℕ} {s : CoreState}
    (hxCone : x ∈ rootCone N t) :
    x ∉ liveLegal D (selectState s t) := by
  apply selected_root_cone_not_live (p := ⟨Phase.regular Player.prolonger,
    Stage.actorAction, selectState s t⟩) (by simp [selectState]) hxCone

private lemma rootSweep_step_select_state
    (D : Finset Vertex) (p : Pos) (x : Vertex) :
    (step D p (Action.select x)).state = selectState p.state x := by
  rcases p with ⟨phase, stage, state⟩
  cases phase with
  | opening r => cases r <;> rfl
  | regular who => cases who <;> rfl

theorem root_select_kills_cone
    {D : Finset Vertex} {N t x : ℕ} {p : Pos}
    (hxCone : x ∈ rootCone N t) :
    x ∉ liveLegal D (step D p (Action.select t)).state := by
  rw [rootSweep_step_select_state]
  exact root_selectState_kills_cone hxCone

/-- Live legal sets only decrease under any public game action. -/
theorem liveLegal_step_subset_geometry
    (D : Finset Vertex) (p : Pos) (a : Action) :
    liveLegal D (step D p a).state ⊆ liveLegal D p.state := by
  cases a with
  | erase U => exact liveLegal_erase_subset D p.state U
  | select x =>
      rw [rootSweep_step_select_state]
      exact liveLegal_select_subset D p.state x
  | pass => exact fun _ hx ↦ hx
  | endOpening => exact fun _ hx ↦ hx

/-- `HistoryPrefix h k` means that `k` is obtained from `h` by appending
zero or more legal public actions. -/
inductive HistoryPrefix
    {D : Finset Vertex} {start : Pos} :
    {p q : Pos} → History D start p → History D start q → Prop
  | refl {p : Pos} (h : History D start p) : HistoryPrefix h h
  | snoc {p q : Pos} {h : History D start p} {k : History D start q}
      (prior : HistoryPrefix h k) (a : Action)
      (ha : a ∈ legalActions D q) :
      HistoryPrefix h (.snoc k a ha)

theorem HistoryPrefix.liveLegal_subset
    {D : Finset Vertex} {start p q : Pos}
    {h : History D start p} {k : History D start q}
    (hprefix : HistoryPrefix h k) :
    liveLegal D q.state ⊆ liveLegal D p.state := by
  induction hprefix with
  | refl => exact Finset.Subset.rfl
  | snoc prior a ha ih =>
      exact (liveLegal_step_subset_geometry D _ a).trans ih

/-- A root-cone kill at a history prefix remains valid at every extension. -/
theorem selected_root_cone_not_live_of_prefix
    {D : Finset Vertex} {start p q : Pos}
    {h : History D start p} {k : History D start q}
    {N t x : ℕ}
    (hprefix : HistoryPrefix h k)
    (htSelected : t ∈ p.state.selected)
    (hxCone : x ∈ rootCone N t) :
    x ∉ liveLegal D q.state := by
  intro hxLive
  exact selected_root_cone_not_live htSelected hxCone
    (hprefix.liveLegal_subset hxLive)

/-- Selecting a root at a prefix kills its full cone at every later history. -/
theorem root_selection_kills_cone_of_prefix
    {D : Finset Vertex} {start p q : Pos}
    {h : History D start p} {N t x : ℕ}
    (ha : Action.select t ∈ legalActions D p)
    {k : History D start q}
    (hprefix : HistoryPrefix (.snoc h (Action.select t) ha) k)
    (hxCone : x ∈ rootCone N t) :
    x ∉ liveLegal D q.state := by
  intro hxLive
  have hxAtSelection : x ∈
      liveLegal D (step D p (Action.select t)).state :=
    hprefix.liveLegal_subset hxLive
  exact root_select_kills_cone hxCone hxAtSelection

end

end Erdos872R177

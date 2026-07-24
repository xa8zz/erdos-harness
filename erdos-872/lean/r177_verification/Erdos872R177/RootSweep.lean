import Erdos872R177.LocalTrace
import Erdos872R177.RootSweepGeometry
import Erdos872R177.RootSweepChronology

namespace Erdos872R177

open Finset

noncomputable section

/-! # Root-cone sweep and drafting

This file builds the history-dependent runtime and total strategy on the
policy-free `SweepGeometry` and `RootSweepChronology` interfaces.  Every
status below is computed from one concrete global history.
-/

/-! ## History-derived root statuses -/

def RootActivated
    {D : Finset Vertex} {N b : ℕ}
    {p : Pos} (gh : History D (initialPos b) p) (t : Vertex) : Prop :=
  ∃ x, (some Actor.prolonger, x) ∈
      scheduledSelectedVertices gh.scheduledActions ∧
    x ∈ rootCone N t

def RootCleared
    {D : Finset Vertex} {b : ℕ}
    {p : Pos} (gh : History D (initialPos b) p) (t : Vertex) : Prop :=
  (some Actor.shortener, t) ∈
    scheduledSelectedVertices gh.scheduledActions

def RootUnprocessed
    {D : Finset Vertex} {N b : ℕ}
    {p : Pos} (gh : History D (initialPos b) p) (t : Vertex) : Prop :=
  ¬RootActivated (N := N) gh t ∧ ¬RootCleared gh t

inductive RootStatus
  | unprocessed
  | active
  | cleared
deriving DecidableEq, Repr

def rootStatus
    {D : Finset Vertex} {N b : ℕ}
    {p : Pos} (gh : History D (initialPos b) p) (t : Vertex) : RootStatus := by
  classical
  exact if RootCleared gh t then .cleared
    else if RootActivated (N := N) gh t then .active else .unprocessed

theorem rootStatus_eq_unprocessed_iff
    {D : Finset Vertex} {N b : ℕ}
    {p : Pos} (gh : History D (initialPos b) p) (t : Vertex) :
    rootStatus (N := N) gh t = .unprocessed ↔
      RootUnprocessed (N := N) gh t := by
  classical
  by_cases hc : RootCleared gh t
  · simp [rootStatus, RootUnprocessed, hc]
  · by_cases ha : RootActivated (N := N) gh t <;>
      simp [rootStatus, RootUnprocessed, hc, ha]

theorem rootStatus_eq_cleared_iff
    {D : Finset Vertex} {N b : ℕ}
    {p : Pos} (gh : History D (initialPos b) p) (t : Vertex) :
    rootStatus (N := N) gh t = .cleared ↔ RootCleared gh t := by
  classical
  by_cases hc : RootCleared gh t
  · simp [rootStatus, hc]
  · by_cases ha : RootActivated (N := N) gh t <;>
      simp [rootStatus, hc, ha]

theorem rootStatus_eq_active_iff
    {D : Finset Vertex} {N b : ℕ}
    {p : Pos} (gh : History D (initialPos b) p) (t : Vertex) :
    rootStatus (N := N) gh t = .active ↔
      RootActivated (N := N) gh t ∧ ¬RootCleared gh t := by
  classical
  by_cases hc : RootCleared gh t
  · simp [rootStatus, hc]
  · by_cases ha : RootActivated (N := N) gh t <;>
      simp [rootStatus, hc, ha]

@[simp] theorem rootActivated_snoc_erase
    {D : Finset Vertex} {N b : ℕ} {gp : Pos}
    {gh : History D (initialPos b) gp} {U : Finset Vertex}
    (ha : Action.erase U ∈ legalActions D gp) (t : Vertex) :
    RootActivated (N := N) (.snoc gh (Action.erase U) ha) t ↔
      RootActivated (N := N) gh t := by
  simp [RootActivated, History.scheduledActions,
    scheduledSelectedVertices_append, scheduledSelectedVertices]

@[simp] theorem rootActivated_snoc_pass
    {D : Finset Vertex} {N b : ℕ} {gp : Pos}
    {gh : History D (initialPos b) gp}
    (ha : Action.pass ∈ legalActions D gp) (t : Vertex) :
    RootActivated (N := N) (.snoc gh Action.pass ha) t ↔
      RootActivated (N := N) gh t := by
  simp [RootActivated, History.scheduledActions,
    scheduledSelectedVertices_append, scheduledSelectedVertices]

@[simp] theorem rootActivated_snoc_endOpening
    {D : Finset Vertex} {N b : ℕ} {gp : Pos}
    {gh : History D (initialPos b) gp}
    (ha : Action.endOpening ∈ legalActions D gp) (t : Vertex) :
    RootActivated (N := N) (.snoc gh Action.endOpening ha) t ↔
      RootActivated (N := N) gh t := by
  simp [RootActivated, History.scheduledActions,
    scheduledSelectedVertices_append, scheduledSelectedVertices]

@[simp] theorem rootActivated_snoc_select
    {D : Finset Vertex} {N b : ℕ} {gp : Pos}
    {gh : History D (initialPos b) gp} {x t : Vertex}
    (ha : Action.select x ∈ legalActions D gp) :
    RootActivated (N := N) (.snoc gh (Action.select x) ha) t ↔
      RootActivated (N := N) gh t ∨
        (actorAt D gp = some Actor.prolonger ∧ x ∈ rootCone N t) := by
  simp [RootActivated, History.scheduledActions,
    scheduledSelectedVertices_append, scheduledSelectedVertices]
  aesop

@[simp] theorem rootCleared_snoc_erase
    {D : Finset Vertex} {b : ℕ} {gp : Pos}
    {gh : History D (initialPos b) gp} {U : Finset Vertex}
    (ha : Action.erase U ∈ legalActions D gp) (t : Vertex) :
    RootCleared (.snoc gh (Action.erase U) ha) t ↔ RootCleared gh t := by
  simp [RootCleared, History.scheduledActions,
    scheduledSelectedVertices_append, scheduledSelectedVertices]

@[simp] theorem rootCleared_snoc_pass
    {D : Finset Vertex} {b : ℕ} {gp : Pos}
    {gh : History D (initialPos b) gp}
    (ha : Action.pass ∈ legalActions D gp) (t : Vertex) :
    RootCleared (.snoc gh Action.pass ha) t ↔ RootCleared gh t := by
  simp [RootCleared, History.scheduledActions,
    scheduledSelectedVertices_append, scheduledSelectedVertices]

@[simp] theorem rootCleared_snoc_endOpening
    {D : Finset Vertex} {b : ℕ} {gp : Pos}
    {gh : History D (initialPos b) gp}
    (ha : Action.endOpening ∈ legalActions D gp) (t : Vertex) :
    RootCleared (.snoc gh Action.endOpening ha) t ↔ RootCleared gh t := by
  simp [RootCleared, History.scheduledActions,
    scheduledSelectedVertices_append, scheduledSelectedVertices]

@[simp] theorem rootCleared_snoc_select
    {D : Finset Vertex} {b : ℕ} {gp : Pos}
    {gh : History D (initialPos b) gp} {x t : Vertex}
    (ha : Action.select x ∈ legalActions D gp) :
    RootCleared (.snoc gh (Action.select x) ha) t ↔
      RootCleared gh t ∨
        (actorAt D gp = some Actor.shortener ∧ x = t) := by
  simp [RootCleared, History.scheduledActions,
    scheduledSelectedVertices_append, scheduledSelectedVertices]
  aesop

/-! ## Concrete local packages carried simultaneously -/

/-- Existential wrapper around the exact local trace belonging to one root. -/
structure RootLocal
    {D : Finset Vertex} {N b : ℕ} (t : Vertex)
    {gp : Pos} (gh : History D (initialPos b) gp) where
  localEnd : Pos
  localHistory : History (Erdos872.quotientCone D N t)
    (initialPos (b + 1)) localEnd
  erasureBatches : List (List (Finset Vertex))
  pending : List (Finset Vertex)
  mode : LocalMode b
  trace : SweepTrace D N t b gh localHistory erasureBatches pending mode

def RootLocal.effective
    {D : Finset Vertex} {N b : ℕ} {t : Vertex}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (L : RootLocal (N := N) t gh) : Finset Vertex :=
  effectiveLocalLive (Erdos872.quotientCone D N t)
    L.localEnd L.pending

def RootLocal.activated
    {D : Finset Vertex} {N b : ℕ} {t : Vertex}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (L : RootLocal (N := N) t gh) : Prop := L.mode.tally? ≠ none

def RootLocal.responseDue
    {D : Finset Vertex} {N b : ℕ} {t : Vertex}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (L : RootLocal (N := N) t gh) : Prop := L.mode.responseDue

def RootLocal.advanceReady
    {D : Finset Vertex} {N b : ℕ} {t : Vertex}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (L : RootLocal (N := N) t gh) : Prop :=
  (∃ c, L.mode = .waitingFirst c) ∨ (∃ c, L.mode = .running c)

lemma unionAll_append_singleton
    (pieces : List (Finset Vertex)) (U : Finset Vertex) :
    unionAll (pieces ++ [U]) = unionAll pieces ∪ U := by
  induction pieces with
  | nil => simp [unionAll]
  | cons V pieces ih => simp [unionAll, ih, Finset.union_assoc]

lemma comparable_comm {x y : Vertex} : Comparable x y ↔ Comparable y x := by
  unfold Comparable
  tauto

/-- Projecting a global erasure is exactly appending its quotient upset to
the pending local disturbance list. -/
theorem LiveCorresponds.after_global_erase
    {D : Finset Vertex} {N t : ℕ} {gp lp : Pos}
    {pending : List (Finset Vertex)} {U : Finset Vertex}
    (hcorr : LiveCorresponds D N t gp lp pending) :
    LiveCorresponds D N t (step D gp (Action.erase U)) lp
      (pending ++ [Erdos872.quotientCone U N t]) := by
  ext q
  have hq := Finset.ext_iff.mp hcorr q
  unfold quotientLive effectiveLocalLive at hq ⊢
  rw [show (step D gp (Action.erase U)).state =
      eraseState D gp.state U by rfl,
    liveLegal_eraseState_eq_sdiff,
    unionAll_append_singleton]
  simp only [Erdos872.quotientCone, Finset.mem_filter, Finset.mem_sdiff,
    Finset.mem_union] at hq ⊢
  aesop

/-- An outside selection is recorded only as its principal quotient upset. -/
theorem LiveCorresponds.after_external_select
    {D : Finset Vertex} {N t r : ℕ} {gp lp : Pos}
    {pending : List (Finset Vertex)}
    (ht : 0 < t) (hout : ¬t ∣ r)
    (hcorr : LiveCorresponds D N t gp lp pending) :
    LiveCorresponds D N t (step D gp (Action.select r)) lp
      (pending ++ [principalUpset (Erdos872.quotientCone D N t)
        (r / Nat.gcd r t)]) := by
  ext q
  have hq := Finset.ext_iff.mp hcorr q
  have hcomp : Comparable (t * q) r ↔ r / Nat.gcd r t ∣ q := by
    rw [comparable_comm]
    exact external_selection_projection_exact ht hout
  have hglobal :
      q ∈ quotientLive D N t (step D gp (Action.select r)) ↔
        q ∈ quotientLive D N t gp ∧ ¬Comparable (t * q) r := by
    unfold quotientLive Erdos872.quotientCone
    rw [step_select_state]
    simp only [Finset.mem_filter, liveLegal_selectState_iff]
    tauto
  have hlocal :
      q ∈ effectiveLocalLive (Erdos872.quotientCone D N t) lp
          (pending ++ [principalUpset (Erdos872.quotientCone D N t)
            (r / Nat.gcd r t)]) ↔
        q ∈ effectiveLocalLive (Erdos872.quotientCone D N t) lp pending ∧
          ¬r / Nat.gcd r t ∣ q := by
    unfold effectiveLocalLive
    rw [unionAll_append_singleton]
    simp only [Finset.mem_sdiff, Finset.mem_union, principalUpset,
      Finset.mem_filter]
    constructor
    · rintro ⟨hqlive, hqnot⟩
      refine ⟨⟨hqlive, fun hpending => hqnot (Or.inl hpending)⟩, ?_⟩
      intro hdiv
      exact hqnot (Or.inr ⟨(Finset.mem_filter.mp hqlive).1, hdiv⟩)
    · rintro ⟨⟨hqlive, hpending⟩, hdiv⟩
      exact ⟨hqlive, fun hmem => hmem.elim hpending (fun h => hdiv h.2)⟩
  rw [hglobal, hlocal, hq, hcomp]

theorem LiveCorresponds.after_state_preserving
    {D : Finset Vertex} {N t : ℕ} {gp gp' lp : Pos}
    {pending : List (Finset Vertex)}
    (hcorr : LiveCorresponds D N t gp lp pending)
    (hstate : gp'.state = gp.state) :
    LiveCorresponds D N t gp' lp pending := by
  simpa [LiveCorresponds, quotientLive, hstate] using hcorr

lemma effectiveLocalLive_append_subset
    (Q : Finset Vertex) (p : Pos)
    (pending : List (Finset Vertex)) (U : Finset Vertex) :
    effectiveLocalLive Q p (pending ++ [U]) ⊆
      effectiveLocalLive Q p pending := by
  intro x hx
  rcases Finset.mem_sdiff.mp hx with ⟨hxlive, hxnot⟩
  apply Finset.mem_sdiff.mpr
  refine ⟨hxlive, ?_⟩
  intro hpending
  exact hxnot (by
    rw [unionAll_append_singleton]
    exact Finset.mem_union_left U hpending)

set_option maxHeartbeats 800000
/-- A terminal due mode never becomes nonterminal again. -/
theorem SweepTrace.dead_effective_empty
    {D : Finset Vertex} {N t b : ℕ}
    {gp lp : Pos} {gh : History D (initialPos b) gp}
    {lh : History (Erdos872.quotientCone D N t)
      (initialPos (b + 1)) lp}
    {batches pending mode}
    (tr : SweepTrace D N t b gh lh batches pending mode)
    (hdead : (∃ c, mode = .deadFirst c) ∨
      (∃ c, mode = .deadLater c)) :
    effectiveLocalLive (Erdos872.quotientCone D N t) lp pending = ∅ := by
  induction tr with
  | root => rcases hdead with ⟨c, h⟩ | ⟨c, h⟩ <;> contradiction
  | erase prev ha hpreserve ih =>
      have hold := ih hdead
      unfold effectiveLocalLive at hold ⊢
      rw [Finset.sdiff_eq_empty_iff_subset] at hold ⊢
      intro x hx
      rw [unionAll_append_singleton]
      exact Finset.mem_union_left _ (hold hx)
  | externalSelect prev ha hout hnotDue hpreserve ih =>
      have hold := ih hdead
      unfold effectiveLocalLive at hold ⊢
      rw [Finset.sdiff_eq_empty_iff_subset] at hold ⊢
      intro x hx
      rw [unionAll_append_singleton]
      exact Finset.mem_union_left _ (hold hx)
  | externalSelectTerminalFirst prev ha hout hactor hterminal hpreserve ih =>
      change effectiveLocalLive _ _ _ = ∅ at hterminal
      unfold effectiveLocalLive at hterminal ⊢
      rw [Finset.sdiff_eq_empty_iff_subset] at hterminal ⊢
      intro x hx
      rw [unionAll_append_singleton]
      exact Finset.mem_union_left _ (hterminal hx)
  | externalSelectTerminalLater prev ha hout hactor hterminal hpreserve ih =>
      change effectiveLocalLive _ _ _ = ∅ at hterminal
      unfold effectiveLocalLive at hterminal ⊢
      rw [Finset.sdiff_eq_empty_iff_subset] at hterminal ⊢
      intro x hx
      rw [unionAll_append_singleton]
      exact Finset.mem_union_left _ (hterminal hx)
  | pass prev ha hpreserve ih => exact ih hdead
  | endOpeningDormant prev ha hpreserve ih =>
      rcases hdead with ⟨c, h⟩ | ⟨c, h⟩ <;> contradiction
  | endOpeningActive prev ha hpreserve ih =>
      rcases hdead with ⟨c, h⟩ | ⟨c, h⟩ <;> contradiction
  | insideProlongerOpeningFirst prev ha hactor hphase run hstage hfixed hpreserve ih =>
      rcases hdead with ⟨c, h⟩ | ⟨c, h⟩ <;> contradiction
  | insideProlongerOpeningMore prev ha hactor hphase run hstage hfixed hpreserve ih =>
      rcases hdead with ⟨c, h⟩ | ⟨c, h⟩ <;> contradiction
  | insideProlongerAfterFirst prev ha hactor run hstage hfixed hpreserve ih =>
      rcases hdead with ⟨c, h⟩ | ⟨c, h⟩ <;> contradiction
  | insideProlongerReturnOpening prev ha hactor run hstage hfixed hpreserve ih =>
      rcases hdead with ⟨c, h⟩ | ⟨c, h⟩ <;> contradiction
  | insideProlongerReturnLater prev ha hactor run hstage hfixed hpreserve ih =>
      rcases hdead with ⟨c, h⟩ | ⟨c, h⟩ <;> contradiction
  | insideProlongerLater prev ha hactor run hstage hfixed hpreserve ih =>
      rcases hdead with ⟨c, h⟩ | ⟨c, h⟩ <;> contradiction
  | firstInsideShortenerWaiting prev ha hactor run hstage hfixed hpreserve ih =>
      rcases hdead with ⟨c, h⟩ | ⟨c, h⟩ <;> contradiction
  | firstInsideShortenerDue prev ha hactor run hstage hfixed hpreserve ih =>
      rcases hdead with ⟨c, h⟩ | ⟨c, h⟩ <;> contradiction
  | laterInsideShortenerDirect prev ha hactor run hstage hfixed hpreserve ih =>
      rcases hdead with ⟨c, h⟩ | ⟨c, h⟩ <;> contradiction
  | laterInsideShortenerAdvance prev ha hactor run hstage hfixed hpreserve ih =>
      rcases hdead with ⟨c, h⟩ | ⟨c, h⟩ <;> contradiction

set_option maxHeartbeats 200000

/-! ## One simultaneous runtime family -/

/-- A state of the global sweep is indexed by its one concrete global
history.  Every root which has not been fired has a `SweepTrace` starting at
`History.root`; in particular dormant traces are never created retroactively
at activation time. -/
structure SweepState
    {D R : Finset Vertex} {N b : ℕ} (G : SweepGeometry D R N)
    {gp : Pos} (gh : History D (initialPos b) gp) where
  fired : Finset Vertex
  fired_subset : fired ⊆ R
  runtime : ∀ t, t ∈ R → t ∉ fired → RootLocal (N := N) t gh
  due : Option Vertex
  due_exact : ∀ t (ht : t ∈ R) (hnot : t ∉ fired),
    (runtime t ht hnot).responseDue ↔ due = some t
  due_valid : ∀ t, due = some t →
    ∃ ht : t ∈ R, ∃ hnot : t ∉ fired,
      (runtime t ht hnot).responseDue
  activated_exact : ∀ t (ht : t ∈ R) (hnot : t ∉ fired),
    (runtime t ht hnot).activated ↔ RootActivated (N := N) gh t
  fired_not_activated : ∀ t ∈ fired, ¬RootActivated (N := N) gh t
  fired_selected : ∀ t ∈ fired, t ∈ gp.state.selected

noncomputable def uniqueWitnessOption {α : Type} (P : α → Prop) : Option α := by
  classical
  exact if h : ∃ x, P x then some (Classical.choose h) else none

theorem uniqueWitnessOption_eq_some_iff
    {α : Type} {P : α → Prop}
    (hunique : ∀ ⦃x y⦄, P x → P y → x = y) (x : α) :
    uniqueWitnessOption P = some x ↔ P x := by
  classical
  unfold uniqueWitnessOption
  split
  · rename_i hex
    constructor
    · intro h
      have heq : Classical.choose hex = x := Option.some.inj h
      rw [← heq]
      exact Classical.choose_spec hex
    · intro hx
      rw [hunique (Classical.choose_spec hex) hx]
  · rename_i hnone
    constructor
    · simp
    · intro hx
      exact False.elim (hnone ⟨x, hx⟩)

def RuntimeDueAt
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (fired : Finset Vertex)
    (runtime : ∀ t, t ∈ R → t ∉ fired → RootLocal (N := N) t gh)
    (t : Vertex) : Prop :=
  ∃ ht : t ∈ R, ∃ hnot : t ∉ fired,
    (runtime t ht hnot).responseDue

/-- Package a rebuilt runtime family.  The unique optional due root is
computed from the family rather than supplied by a chronological oracle. -/
noncomputable def SweepState.ofRuntime
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (fired : Finset Vertex) (fired_subset : fired ⊆ R)
    (runtime : ∀ t, t ∈ R → t ∉ fired → RootLocal (N := N) t gh)
    (due_unique : ∀ ⦃s t⦄,
      RuntimeDueAt (G := G) fired runtime s →
      RuntimeDueAt (G := G) fired runtime t → s = t)
    (activated_exact : ∀ t (ht : t ∈ R) (hnot : t ∉ fired),
      (runtime t ht hnot).activated ↔ RootActivated (N := N) gh t)
    (fired_not_activated : ∀ t ∈ fired,
      ¬RootActivated (N := N) gh t)
    (fired_selected : ∀ t ∈ fired, t ∈ gp.state.selected) :
    SweepState G gh where
  fired := fired
  fired_subset := fired_subset
  runtime := runtime
  due := uniqueWitnessOption (RuntimeDueAt (G := G) fired runtime)
  due_exact := by
    intro t ht hnot
    rw [uniqueWitnessOption_eq_some_iff due_unique]
    constructor
    · exact fun hdue => ⟨ht, hnot, hdue⟩
    · rintro ⟨ht', hnot', hdue⟩
      simpa only [Subsingleton.elim ht' ht, Subsingleton.elim hnot' hnot] using hdue
  due_valid := by
    intro t ht
    exact (uniqueWitnessOption_eq_some_iff due_unique t).mp ht
  activated_exact := activated_exact
  fired_not_activated := fired_not_activated
  fired_selected := fired_selected

def SweepState.initial
    {D R : Finset Vertex} {N b : ℕ} (G : SweepGeometry D R N) :
    SweepState G (History.root : History D (initialPos b) (initialPos b)) where
  fired := ∅
  fired_subset := by simp
  runtime := fun t _ht _hnot =>
    { localEnd := initialPos (b + 1)
      localHistory := .root
      erasureBatches := []
      pending := []
      mode := .openingDormant
      trace := .root }
  due := none
  due_exact := by simp [RootLocal.responseDue, LocalMode.responseDue]
  due_valid := by simp
  activated_exact := by
    intro t ht hnot
    simp [RootLocal.activated, LocalMode.tally?, RootActivated,
      History.scheduledActions, scheduledSelectedVertices]
  fired_not_activated := by simp
  fired_selected := by simp

def SweepState.isActive
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (S : SweepState G gh) (t : Vertex) : Prop :=
  ∃ ht : t ∈ R, ∃ hnot : t ∉ S.fired,
    (S.runtime t ht hnot).activated

def SweepState.isUnprocessed
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (S : SweepState G gh) (t : Vertex) : Prop :=
  ∃ ht : t ∈ R, ∃ hnot : t ∉ S.fired,
    ¬(S.runtime t ht hnot).activated

theorem SweepState.active_iff_history
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (S : SweepState G gh) {t : Vertex} :
    S.isActive t ↔ t ∈ R ∧ RootActivated (N := N) gh t ∧ t ∉ S.fired := by
  constructor
  · rintro ⟨ht, hnot, hactive⟩
    exact ⟨ht, (S.activated_exact t ht hnot).mp hactive, hnot⟩
  · rintro ⟨ht, hactive, hnot⟩
    exact ⟨ht, hnot, (S.activated_exact t ht hnot).mpr hactive⟩

theorem SweepState.unprocessed_iff_history
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (S : SweepState G gh) {t : Vertex} :
    S.isUnprocessed t ↔
      t ∈ R ∧ ¬RootActivated (N := N) gh t ∧ t ∉ S.fired := by
  constructor
  · rintro ⟨ht, hnot, hinactive⟩
    exact ⟨ht, (S.activated_exact t ht hnot).not.mp hinactive, hnot⟩
  · rintro ⟨ht, hinactive, hnot⟩
    exact ⟨ht, hnot, (S.activated_exact t ht hnot).not.mpr hinactive⟩

/-- The option-valued due field makes the synchronization fact definitional:
there is at most one nonterminal response-due cone. -/
theorem SweepState.at_most_one_due
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (S : SweepState G gh)
    {s t : Vertex} {hs : s ∈ R} {ht : t ∈ R}
    {hsnot : s ∉ S.fired} {htnot : t ∉ S.fired}
    (hsdue : (S.runtime s hs hsnot).responseDue)
    (htdue : (S.runtime t ht htnot).responseDue) : s = t := by
  have hsopt := (S.due_exact s hs hsnot).mp hsdue
  have htopt := (S.due_exact t ht htnot).mp htdue
  exact Option.some.inj (hsopt.symm.trans htopt)

/-- A fired root is permanently selected, so its entire cone is dead. -/
theorem SweepState.fired_cone_dead
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (S : SweepState G gh) {t x : Vertex}
    (ht : t ∈ S.fired) (hx : x ∈ rootCone N t) :
    x ∉ liveLegal D gp.state := by
  exact selected_root_cone_not_live (S.fired_selected t ht) hx

theorem SweepTrace.local_state_eq_empty_of_inactive
    {D : Finset Vertex} {N t b : ℕ}
    {gp lp : Pos} {gh : History D (initialPos b) gp}
    {lh : History (Erdos872.quotientCone D N t)
      (initialPos (b + 1)) lp}
    {batches pending mode}
    (tr : SweepTrace D N t b gh lh batches pending mode)
    (hinactive : mode.tally? = none) : lp.state = emptyState := by
  induction tr with
  | root => rfl
  | erase prev ha hpreserve ih => exact ih hinactive
  | externalSelect prev ha hout hnotDue hpreserve ih => exact ih hinactive
  | externalSelectTerminalFirst prev ha hout hactor hterminal hpreserve ih =>
      simp [LocalMode.tally?] at hinactive
  | externalSelectTerminalLater prev ha hout hactor hterminal hpreserve ih =>
      simp [LocalMode.tally?] at hinactive
  | pass prev ha hpreserve ih => exact ih hinactive
  | endOpeningDormant prev ha hpreserve ih =>
      exact ih (by simp [LocalMode.tally?])
  | endOpeningActive prev ha hpreserve ih =>
      simp [LocalMode.tally?] at hinactive
  | insideProlongerOpeningFirst prev ha hactor hphase run hstage hfixed hpreserve ih =>
      simp [LocalMode.tally?] at hinactive
  | insideProlongerOpeningMore prev ha hactor hphase run hstage hfixed hpreserve ih =>
      simp [LocalMode.tally?] at hinactive
  | insideProlongerAfterFirst prev ha hactor run hstage hfixed hpreserve ih =>
      simp [LocalMode.tally?] at hinactive
  | insideProlongerReturnOpening prev ha hactor run hstage hfixed hpreserve ih =>
      simp [LocalMode.tally?] at hinactive
  | insideProlongerReturnLater prev ha hactor run hstage hfixed hpreserve ih =>
      simp [LocalMode.tally?] at hinactive
  | insideProlongerLater prev ha hactor run hstage hfixed hpreserve ih =>
      simp [LocalMode.tally?] at hinactive
  | firstInsideShortenerWaiting prev ha hactor run hstage hfixed hpreserve ih =>
      simp [LocalMode.tally?] at hinactive
  | firstInsideShortenerDue prev ha hactor run hstage hfixed hpreserve ih =>
      simp [LocalMode.tally?] at hinactive
  | laterInsideShortenerDirect prev ha hactor run hstage hfixed hpreserve ih =>
      simp [LocalMode.tally?] at hinactive
  | laterInsideShortenerAdvance prev ha hactor run hstage hfixed hpreserve ih =>
      simp [LocalMode.tally?] at hinactive

/-- The local quotient root `1` cannot be removed from an inactive cone while
any quotient vertex remains: all pending erasures are upsets.  Transporting
this fact through the exact live correspondence proves that the global root
is live whenever any vertex of its inactive cone is live. -/
theorem SweepState.dormant_root_live_of_cone_live
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (S : SweepState G gh) {t x : Vertex}
    (ht : t ∈ R) (hnot : t ∉ S.fired)
    (hinactive : ¬(S.runtime t ht hnot).activated)
    (hxLive : x ∈ liveLegal D gp.state) (hxCone : x ∈ rootCone N t) :
    t ∈ liveLegal D gp.state := by
  let L := S.runtime t ht hnot
  let Q := Erdos872.quotientCone D N t
  have htpos : 0 < t := G.roots_pos ht
  have hxData := rootCone_mem_iff.mp hxCone
  have htx : t ∣ x := hxData.2.1
  have hxpos : 0 < x := hxData.1
  have hmul : t * (x / t) = x := Nat.mul_div_cancel' htx
  have hqpos : 1 ≤ x / t := by
    have : 0 < x / t := Nat.div_pos (Nat.le_of_dvd hxpos htx) htpos
    exact this
  have hqle : x / t ≤ N / t := Nat.div_le_div_right hxData.2.2
  have hqGlobal : x / t ∈ quotientLive D N t gp := by
    apply Finset.mem_filter.mpr
    exact ⟨Finset.mem_Icc.mpr ⟨hqpos, hqle⟩, by simpa [hmul] using hxLive⟩
  have hqEffective : x / t ∈ L.effective := by
    rw [RootLocal.effective, ← L.trace.live_corresponds]
    exact hqGlobal
  have hqLocal := (Finset.mem_sdiff.mp hqEffective).1
  have hqPending := (Finset.mem_sdiff.mp hqEffective).2
  have hlocalEmpty : L.localEnd.state = emptyState :=
    L.trace.local_state_eq_empty_of_inactive
      (not_ne_iff.mp hinactive)
  have htBoard := G.downset.1 (G.roots_mem ht)
  have htLe : t ≤ N := (Finset.mem_Icc.mp htBoard).2
  have hOneLe : 1 ≤ N / t := by
    exact (Nat.le_div_iff_mul_le htpos).2 (by simpa using htLe)
  have hOneQ : 1 ∈ Q := by
    apply Finset.mem_filter.mpr
    exact ⟨Finset.mem_Icc.mpr ⟨le_rfl, hOneLe⟩, by
      simpa [Q] using G.roots_mem ht⟩
  have hOneLocal : 1 ∈ liveLegal Q L.localEnd.state := by
    rw [hlocalEmpty]
    simpa [liveLegal, emptyState] using hOneQ
  have hPendingUpset : IsUpset Q (unionAll L.pending) :=
    unionAll_isUpset (L.trace.pending_are_upsets htpos)
  have hOnePending : 1 ∉ unionAll L.pending := by
    intro hOne
    have hqQ : x / t ∈ Q := (Finset.mem_filter.mp hqLocal).1
    exact hqPending (hPendingUpset.2 1 hOne (x / t) hqQ (one_dvd _))
  have hOneEffective : 1 ∈ L.effective :=
    Finset.mem_sdiff.mpr ⟨hOneLocal, hOnePending⟩
  have hOneGlobal : 1 ∈ quotientLive D N t gp := by
    rw [L.trace.live_corresponds]
    exact hOneEffective
  have := (Finset.mem_filter.mp hOneGlobal).2
  simpa using this

/-- Section 4.1: if an unprocessed root is unavailable, then its entire cone
has no live vertex. -/
theorem SweepState.unprocessed_unavailable_cone_dead
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (S : SweepState G gh) {t : Vertex}
    (ht : t ∈ R) (hnot : t ∉ S.fired)
    (hinactive : ¬(S.runtime t ht hnot).activated)
    (htUnavailable : t ∉ liveLegal D gp.state) :
    ∀ x ∈ rootCone N t, x ∉ liveLegal D gp.state := by
  intro x hxCone hxLive
  exact htUnavailable
    (S.dormant_root_live_of_cone_live ht hnot hinactive hxLive hxCone)

/-- At global termination every active runtime is already a completed exact
local trace. -/
def SweepState.completed
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (S : SweepState G gh) (hterminal : actorAt D gp = none)
    (t : Vertex) (ht : t ∈ R) (hnot : t ∉ S.fired)
    (hactive : (S.runtime t ht hnot).activated) :
    CompletedSweepTrace D N t b :=
  { globalEnd := gp
    globalHistory := gh
    localEnd := (S.runtime t ht hnot).localEnd
    localHistory := (S.runtime t ht hnot).localHistory
    erasureBatches := (S.runtime t ht hnot).erasureBatches
    pending := (S.runtime t ht hnot).pending
    mode := (S.runtime t ht hnot).mode
    exactProjection := (S.runtime t ht hnot).trace
    activated := hactive
    globalComplete := hterminal }

theorem SweepState.active_cone_count_le_V
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (S : SweepState G gh)
    (hterminal : actorAt D gp = none)
    (t : Vertex) (ht : t ∈ R) (hnot : t ∉ S.fired)
    (hactive : (S.runtime t ht hnot).activated) :
    (projectedConeSelections t gh.actions).length ≤ V (b + 1) (N / t) := by
  exact projected_inside_count_le_V G.downset (G.roots_pos ht)
    (S.completed hterminal t ht hnot hactive)

/-! ## Certified one-root updates -/

def RootLocal.afterErase
    {D : Finset Vertex} {N t b : ℕ}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (L : RootLocal (N := N) t gh) {U : Finset Vertex}
    (ha : Action.erase U ∈ legalActions D gp) :
    RootLocal (N := N) t (.snoc gh _ ha) :=
  { localEnd := L.localEnd
    localHistory := L.localHistory
    erasureBatches := L.erasureBatches
    pending := L.pending ++ [Erdos872.quotientCone U N t]
    mode := L.mode
    trace := SweepTrace.erase (gp := gp) (lp := L.localEnd)
      L.trace ha fun hcorr => hcorr.after_global_erase }

def RootLocal.afterPass
    {D : Finset Vertex} {N t b : ℕ}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (L : RootLocal (N := N) t gh)
    (ha : Action.pass ∈ legalActions D gp) :
    RootLocal (N := N) t (.snoc gh _ ha) :=
  { localEnd := L.localEnd
    localHistory := L.localHistory
    erasureBatches := L.erasureBatches
    pending := L.pending
    mode := L.mode
    trace := SweepTrace.pass (gp := gp) (lp := L.localEnd) L.trace ha fun hcorr =>
      hcorr.after_state_preserving rfl }

def SweepState.afterErase
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (S : SweepState G gh) {U : Finset Vertex}
    (ha : Action.erase U ∈ legalActions D gp) :
    SweepState G (.snoc gh (Action.erase U) ha) where
  fired := S.fired
  fired_subset := S.fired_subset
  runtime := fun t ht hnot => (S.runtime t ht hnot).afterErase ha
  due := S.due
  due_exact := by
    intro t ht hnot
    simpa [RootLocal.afterErase, RootLocal.responseDue] using
      S.due_exact t ht hnot
  due_valid := by
    intro t hdue
    rcases S.due_valid t hdue with ⟨ht, hnot, hlocal⟩
    exact ⟨ht, hnot, by simpa [RootLocal.afterErase,
      RootLocal.responseDue] using hlocal⟩
  activated_exact := by
    intro t ht hnot
    simpa [RootLocal.afterErase, RootLocal.activated] using
      S.activated_exact t ht hnot
  fired_not_activated := by
    intro t ht
    simpa using S.fired_not_activated t ht
  fired_selected := by
    intro t ht
    simpa [step, eraseState] using S.fired_selected t ht

def SweepState.afterPass
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (S : SweepState G gh) (ha : Action.pass ∈ legalActions D gp) :
    SweepState G (.snoc gh Action.pass ha) where
  fired := S.fired
  fired_subset := S.fired_subset
  runtime := fun t ht hnot => (S.runtime t ht hnot).afterPass ha
  due := S.due
  due_exact := by
    intro t ht hnot
    simpa [RootLocal.afterPass, RootLocal.responseDue] using
      S.due_exact t ht hnot
  due_valid := by
    intro t hdue
    rcases S.due_valid t hdue with ⟨ht, hnot, hlocal⟩
    exact ⟨ht, hnot, by simpa [RootLocal.afterPass,
      RootLocal.responseDue] using hlocal⟩
  activated_exact := by
    intro t ht hnot
    simpa [RootLocal.afterPass, RootLocal.activated] using
      S.activated_exact t ht hnot
  fired_not_activated := by
    intro t ht
    simpa using S.fired_not_activated t ht
  fired_selected := by
    intro t ht
    simpa [step] using S.fired_selected t ht

private theorem global_phase_shortener
    {D : Finset Vertex} {p : Pos}
    (hactor : actorAt D p = some Actor.shortener) :
    p.phase = Phase.regular Player.shortener := by
  unfold actorAt at hactor
  split at hactor
  · contradiction
  · cases hstage : p.stage with
    | beforeErase => simp [hstage] at hactor
    | actorAction =>
        cases hphase : p.phase with
        | opening r => simp [hstage, hphase] at hactor
        | regular who =>
            cases who with
            | prolonger => simp [hstage, hphase] at hactor
            | shortener => rfl

private theorem endOpening_legal_phase
    {D : Finset Vertex} {p : Pos}
    (ha : Action.endOpening ∈ legalActions D p) :
    ∃ r, p.phase = Phase.opening r := by
  unfold legalActions at ha
  split at ha
  · simp at ha
  · cases hstage : p.stage with
    | beforeErase => simp [hstage, erasureActions] at ha
    | actorAction =>
        cases hphase : p.phase with
        | opening r => exact ⟨r, rfl⟩
        | regular who => cases who <;> simp [hstage, hphase, selectionActions] at ha

private theorem phase_opening_of_select_step_opening
    {D : Finset Vertex} {p : Pos} {x : Vertex}
    (hopening : ∃ r, (step D p (Action.select x)).phase = Phase.opening r) :
    ∃ r, p.phase = Phase.opening r := by
  rcases hopening with ⟨r, hr⟩
  cases hphase : p.phase with
  | opening s => exact ⟨s, rfl⟩
  | regular who => cases who <;> simp [step, hphase] at hr

set_option maxHeartbeats 800000 in
theorem SweepTrace.opening_mode_of_global_opening
    {D : Finset Vertex} {N t b : ℕ}
    {gp lp : Pos} {gh : History D (initialPos b) gp}
    {lh : History (Erdos872.quotientCone D N t)
      (initialPos (b + 1)) lp}
    {batches pending mode}
    (tr : SweepTrace D N t b gh lh batches pending mode)
    (hopening : ∃ r, gp.phase = Phase.opening r) :
    mode = .openingDormant ∨ ∃ k, mode = .openingActive k := by
  induction tr with
  | root => exact Or.inl rfl
  | erase prev ha hpreserve ih =>
      apply ih
      simpa [step] using hopening
  | externalSelect prev ha hout hnotDue hpreserve ih =>
      exact ih (phase_opening_of_select_step_opening hopening)
  | externalSelectTerminalFirst prev ha hout hactor hterminal hpreserve ih =>
      rcases ih (phase_opening_of_select_step_opening hopening) with h | ⟨k, h⟩ <;>
        contradiction
  | externalSelectTerminalLater prev ha hout hactor hterminal hpreserve ih =>
      rcases ih (phase_opening_of_select_step_opening hopening) with h | ⟨k, h⟩ <;>
        contradiction
  | pass prev ha hpreserve ih =>
      rcases hopening with ⟨r, hr⟩
      simp [step] at hr
  | endOpeningDormant prev ha hpreserve ih =>
      rcases hopening with ⟨r, hr⟩
      simp [step] at hr
  | endOpeningActive prev ha hpreserve ih =>
      rcases hopening with ⟨r, hr⟩
      simp [step] at hr
  | insideProlongerOpeningFirst prev ha hactor hphase run hstage hfixed hpreserve ih =>
      exact Or.inr ⟨1, rfl⟩
  | insideProlongerOpeningMore prev ha hactor hphase run hstage hfixed hpreserve ih =>
      exact Or.inr ⟨_, rfl⟩
  | insideProlongerAfterFirst prev ha hactor run hstage hfixed hpreserve ih =>
      rcases ih (phase_opening_of_select_step_opening hopening) with h | ⟨k, h⟩ <;>
        contradiction
  | insideProlongerReturnOpening prev ha hactor run hstage hfixed hpreserve ih =>
      rcases ih (phase_opening_of_select_step_opening hopening) with h | ⟨k, h⟩ <;>
        contradiction
  | insideProlongerReturnLater prev ha hactor run hstage hfixed hpreserve ih =>
      rcases ih (phase_opening_of_select_step_opening hopening) with h | ⟨k, h⟩ <;>
        contradiction
  | insideProlongerLater prev ha hactor run hstage hfixed hpreserve ih =>
      rcases ih (phase_opening_of_select_step_opening hopening) with h | ⟨k, h⟩ <;>
        contradiction
  | firstInsideShortenerWaiting prev ha hactor run hstage hfixed hpreserve ih =>
      rcases ih (phase_opening_of_select_step_opening hopening) with h | ⟨k, h⟩ <;>
        contradiction
  | firstInsideShortenerDue prev ha hactor run hstage hfixed hpreserve ih =>
      rcases ih (phase_opening_of_select_step_opening hopening) with h | ⟨k, h⟩ <;>
        contradiction
  | laterInsideShortenerDirect prev ha hactor run hstage hfixed hpreserve ih =>
      rcases ih (phase_opening_of_select_step_opening hopening) with h | ⟨k, h⟩ <;>
        contradiction
  | laterInsideShortenerAdvance prev ha hactor run hstage hfixed hpreserve ih =>
      rcases ih (phase_opening_of_select_step_opening hopening) with h | ⟨k, h⟩ <;>
        contradiction

def RootLocal.afterEndOpening
    {D : Finset Vertex} {N t b : ℕ}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (L : RootLocal (N := N) t gh)
    (ha : Action.endOpening ∈ legalActions D gp) :
    RootLocal (N := N) t (.snoc gh Action.endOpening ha) := by
  have hopen := L.trace.opening_mode_of_global_opening
    (endOpening_legal_phase ha)
  cases hmode : L.mode with
  | openingDormant =>
      exact
        { localEnd := L.localEnd
          localHistory := L.localHistory
          erasureBatches := L.erasureBatches
          pending := L.pending
          mode := .postDormant
          trace := SweepTrace.endOpeningDormant
            (gp := gp) (lp := L.localEnd) (hmode ▸ L.trace) ha
            (fun hcorr => hcorr.after_state_preserving rfl) }
  | openingActive k =>
      exact
        { localEnd := L.localEnd
          localHistory := L.localHistory
          erasureBatches := L.erasureBatches
          pending := L.pending
          mode := .waitingFirst (.during0 k)
          trace := SweepTrace.endOpeningActive
            (gp := gp) (lp := L.localEnd) (hmode ▸ L.trace) ha
            (fun hcorr => hcorr.after_state_preserving rfl) }
  | postDormant => exact False.elim (by
      rcases hopen with h | ⟨k, h⟩ <;> rw [hmode] at h <;> contradiction)
  | waitingFirst c => exact False.elim (by
      rcases hopen with h | ⟨k, h⟩ <;> rw [hmode] at h <;> contradiction)
  | responseDueFirst c => exact False.elim (by
      rcases hopen with h | ⟨k, h⟩ <;> rw [hmode] at h <;> contradiction)
  | running c => exact False.elim (by
      rcases hopen with h | ⟨k, h⟩ <;> rw [hmode] at h <;> contradiction)
  | responseDueLater c => exact False.elim (by
      rcases hopen with h | ⟨k, h⟩ <;> rw [hmode] at h <;> contradiction)
  | deadFirst c => exact False.elim (by
      rcases hopen with h | ⟨k, h⟩ <;> rw [hmode] at h <;> contradiction)
  | deadLater c => exact False.elim (by
      rcases hopen with h | ⟨k, h⟩ <;> rw [hmode] at h <;> contradiction)

theorem RootLocal.afterEndOpening_not_responseDue
    {D : Finset Vertex} {N t b : ℕ}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (L : RootLocal (N := N) t gh)
    (ha : Action.endOpening ∈ legalActions D gp) :
    ¬(L.afterEndOpening ha).responseDue := by
  rcases L with ⟨lp, lh, batches, pending, mode, tr⟩
  have hopen := tr.opening_mode_of_global_opening
    (endOpening_legal_phase ha)
  cases mode with
  | openingDormant =>
      simp [RootLocal.afterEndOpening, RootLocal.responseDue,
        LocalMode.responseDue]
  | openingActive k =>
      simp [RootLocal.afterEndOpening, RootLocal.responseDue,
        LocalMode.responseDue]
  | postDormant =>
      rcases hopen with h | ⟨k, h⟩ <;> contradiction
  | waitingFirst c =>
      rcases hopen with h | ⟨k, h⟩ <;> contradiction
  | responseDueFirst c =>
      rcases hopen with h | ⟨k, h⟩ <;> contradiction
  | running c =>
      rcases hopen with h | ⟨k, h⟩ <;> contradiction
  | responseDueLater c =>
      rcases hopen with h | ⟨k, h⟩ <;> contradiction
  | deadFirst c =>
      rcases hopen with h | ⟨k, h⟩ <;> contradiction
  | deadLater c =>
      rcases hopen with h | ⟨k, h⟩ <;> contradiction

theorem RootLocal.afterEndOpening_activated
    {D : Finset Vertex} {N t b : ℕ}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (L : RootLocal (N := N) t gh)
    (ha : Action.endOpening ∈ legalActions D gp) :
    (L.afterEndOpening ha).activated ↔ L.activated := by
  rcases L with ⟨lp, lh, batches, pending, mode, tr⟩
  have hopen := tr.opening_mode_of_global_opening
    (endOpening_legal_phase ha)
  cases mode with
  | openingDormant =>
      simp [RootLocal.afterEndOpening, RootLocal.activated,
        LocalMode.tally?]
  | openingActive k =>
      simp [RootLocal.afterEndOpening, RootLocal.activated,
        LocalMode.tally?]
  | postDormant =>
      rcases hopen with h | ⟨k, h⟩ <;> contradiction
  | waitingFirst c =>
      rcases hopen with h | ⟨k, h⟩ <;> contradiction
  | responseDueFirst c =>
      rcases hopen with h | ⟨k, h⟩ <;> contradiction
  | running c =>
      rcases hopen with h | ⟨k, h⟩ <;> contradiction
  | responseDueLater c =>
      rcases hopen with h | ⟨k, h⟩ <;> contradiction
  | deadFirst c =>
      rcases hopen with h | ⟨k, h⟩ <;> contradiction
  | deadLater c =>
      rcases hopen with h | ⟨k, h⟩ <;> contradiction

/-- Simultaneous transition across Prolonger's explicit end-of-opening
action.  No local response is due immediately: dormant cones become
post-opening dormant, and cones activated during the opening wait for their
first local Shortener move. -/
noncomputable def SweepState.afterEndOpening
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (S : SweepState G gh)
    (ha : Action.endOpening ∈ legalActions D gp) :
    SweepState G (.snoc gh Action.endOpening ha) := by
  classical
  let runtime' := fun t (ht : t ∈ R) (hnot : t ∉ S.fired) =>
    (S.runtime t ht hnot).afterEndOpening ha
  apply SweepState.ofRuntime S.fired S.fired_subset runtime'
  · intro s t hs ht
    rcases hs with ⟨hsR, hsnot, hsdue⟩
    exact False.elim ((S.runtime s hsR hsnot).afterEndOpening_not_responseDue ha hsdue)
  · intro t ht hnot
    rw [rootActivated_snoc_endOpening]
    exact (S.runtime t ht hnot).afterEndOpening_activated ha |>.trans
      (S.activated_exact t ht hnot)
  · intro t ht
    simpa using S.fired_not_activated t ht
  · intro t ht
    simpa [step] using S.fired_selected t ht

def RootLocal.afterExternalNonShortener
    {D : Finset Vertex} {N t b r : ℕ}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (ht : 0 < t) (L : RootLocal (N := N) t gh)
    (ha : Action.select r ∈ legalActions D gp) (hout : ¬t ∣ r)
    (hnotS : actorAt D gp ≠ some Actor.shortener) :
    RootLocal (N := N) t (.snoc gh _ ha) :=
  { localEnd := L.localEnd
    localHistory := L.localHistory
    erasureBatches := L.erasureBatches
    pending := L.pending ++ [principalUpset
      (Erdos872.quotientCone D N t) (r / Nat.gcd r t)]
    mode := L.mode
    trace := SweepTrace.externalSelect (gp := gp) (lp := L.localEnd)
      L.trace ha hout
      (fun hs _ => False.elim (hnotS hs))
      (fun hcorr => hcorr.after_external_select ht hout) }

theorem RootLocal.afterExternalNonShortener_activated
    {D : Finset Vertex} {N t b r : ℕ}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (ht : 0 < t) (L : RootLocal (N := N) t gh)
    (ha : Action.select r ∈ legalActions D gp) (hout : ¬t ∣ r)
    (hnotS : actorAt D gp ≠ some Actor.shortener) :
    (L.afterExternalNonShortener ht ha hout hnotS).activated ↔ L.activated := by
  simp [RootLocal.afterExternalNonShortener, RootLocal.activated]

theorem RootLocal.afterExternalNonShortener_responseDue
    {D : Finset Vertex} {N t b r : ℕ}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (ht : 0 < t) (L : RootLocal (N := N) t gh)
    (ha : Action.select r ∈ legalActions D gp) (hout : ¬t ∣ r)
    (hnotS : actorAt D gp ≠ some Actor.shortener) :
    (L.afterExternalNonShortener ht ha hout hnotS).responseDue ↔
      L.responseDue := by
  simp [RootLocal.afterExternalNonShortener, RootLocal.responseDue]

/-- At a Shortener node an outside move freezes a non-due local game.  A due
game is also allowed to fall through precisely when its effective live set is
empty, in which case the trace records the appropriate terminal mode. -/
def RootLocal.afterExternalShortener
    {D : Finset Vertex} {N t b r : ℕ}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (ht : 0 < t) (L : RootLocal (N := N) t gh)
    (ha : Action.select r ∈ legalActions D gp) (hout : ¬t ∣ r)
    (hactor : actorAt D gp = some Actor.shortener)
    (hterminalDue : L.responseDue → L.effective = ∅) :
    RootLocal (N := N) t (.snoc gh _ ha) := by
  let pending' := L.pending ++ [principalUpset
    (Erdos872.quotientCone D N t) (r / Nat.gcd r t)]
  have hpreserve : LiveCorresponds D N t gp L.localEnd L.pending →
      LiveCorresponds D N t (step D gp (Action.select r)) L.localEnd pending' :=
    fun hcorr => hcorr.after_external_select ht hout
  let normal (hnotdue : ¬L.mode.responseDue) :
      RootLocal (N := N) t (.snoc gh _ ha) :=
    { localEnd := L.localEnd
      localHistory := L.localHistory
      erasureBatches := L.erasureBatches
      pending := pending'
      mode := L.mode
      trace := SweepTrace.externalSelect (gp := gp) (lp := L.localEnd)
        L.trace ha hout (fun _ => hnotdue) hpreserve }
  cases hmode : L.mode with
  | responseDueFirst c =>
      exact
        { localEnd := L.localEnd
          localHistory := L.localHistory
          erasureBatches := L.erasureBatches
          pending := pending'
          mode := .deadFirst c
          trace := SweepTrace.externalSelectTerminalFirst
            (gp := gp) (lp := L.localEnd)
            (hmode ▸ L.trace) ha hout hactor
            (hterminalDue (by
              rw [RootLocal.responseDue, hmode]
              trivial)) hpreserve }
  | responseDueLater c =>
      exact
        { localEnd := L.localEnd
          localHistory := L.localHistory
          erasureBatches := L.erasureBatches
          pending := pending'
          mode := .deadLater c
          trace := SweepTrace.externalSelectTerminalLater
            (gp := gp) (lp := L.localEnd)
            (hmode ▸ L.trace) ha hout hactor
            (hterminalDue (by
              rw [RootLocal.responseDue, hmode]
              trivial)) hpreserve }
  | openingDormant => exact normal (by simp [hmode, LocalMode.responseDue])
  | openingActive k => exact normal (by simp [hmode, LocalMode.responseDue])
  | postDormant => exact normal (by simp [hmode, LocalMode.responseDue])
  | waitingFirst c => exact normal (by simp [hmode, LocalMode.responseDue])
  | running c => exact normal (by simp [hmode, LocalMode.responseDue])
  | deadFirst c => exact normal (by simp [hmode, LocalMode.responseDue])
  | deadLater c => exact normal (by simp [hmode, LocalMode.responseDue])

theorem RootLocal.afterExternalShortener_activated
    {D : Finset Vertex} {N t b r : ℕ}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (ht : 0 < t) (L : RootLocal (N := N) t gh)
    (ha : Action.select r ∈ legalActions D gp) (hout : ¬t ∣ r)
    (hactor : actorAt D gp = some Actor.shortener)
    (hterminalDue : L.responseDue → L.effective = ∅) :
    (L.afterExternalShortener ht ha hout hactor hterminalDue).activated ↔
      L.activated := by
  rcases L with ⟨lp, lh, batches, pending, mode, tr⟩
  cases mode <;>
    simp [RootLocal.afterExternalShortener, RootLocal.activated,
      RootLocal.responseDue, LocalMode.tally?, LocalMode.responseDue]

theorem RootLocal.afterExternalShortener_not_responseDue
    {D : Finset Vertex} {N t b r : ℕ}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (ht : 0 < t) (L : RootLocal (N := N) t gh)
    (ha : Action.select r ∈ legalActions D gp) (hout : ¬t ∣ r)
    (hactor : actorAt D gp = some Actor.shortener)
    (hterminalDue : L.responseDue → L.effective = ∅) :
    ¬(L.afterExternalShortener ht ha hout hactor hterminalDue).responseDue := by
  rcases L with ⟨lp, lh, batches, pending, mode, tr⟩
  cases mode <;>
    simp [RootLocal.afterExternalShortener, RootLocal.responseDue,
      LocalMode.responseDue]

private theorem actor_shortener_of_phase_legal_select
    {D : Finset Vertex} {p : Pos} {x : Vertex}
    (hphase : p.phase = Phase.regular Player.shortener)
    (ha : Action.select x ∈ legalActions D p) :
    actorAt D p = some Actor.shortener := by
  have hlive : liveLegal D p.state ≠ ∅ := by
    intro hempty
    unfold legalActions at ha
    rw [if_pos hempty] at ha
    simp at ha
  unfold legalActions at ha
  rw [if_neg hlive] at ha
  cases hstage : p.stage with
  | beforeErase => simp [hstage, erasureActions] at ha
  | actorAction => simp [actorAt, hlive, hstage, hphase]

private theorem phase_regular_prolonger_of_actor_nonopening
    {D : Finset Vertex} {p : Pos}
    (hactor : actorAt D p = some Actor.prolonger)
    (hnonopening : ¬∃ r, p.phase = Phase.opening r) :
    p.phase = Phase.regular Player.prolonger := by
  cases hphase : p.phase with
  | opening r => exact False.elim (hnonopening ⟨r, hphase⟩)
  | regular who =>
      cases who with
      | prolonger => rfl
      | shortener =>
          unfold actorAt at hactor
          split at hactor
          · contradiction
          · cases hstage : p.stage <;> simp [hstage, hphase] at hactor

set_option maxHeartbeats 800000 in
theorem SweepTrace.responseDue_global_phase
    {D : Finset Vertex} {N t b : ℕ}
    {gp lp : Pos} {gh : History D (initialPos b) gp}
    {lh : History (Erdos872.quotientCone D N t)
      (initialPos (b + 1)) lp}
    {batches pending mode}
    (tr : SweepTrace D N t b gh lh batches pending mode)
    (hdue : mode.responseDue) :
    gp.phase = Phase.regular Player.shortener := by
  induction tr with
  | root => contradiction
  | erase prev ha hpreserve ih => simpa [step] using ih hdue
  | externalSelect prev ha hout hnotDue hpreserve ih =>
      have hp := ih hdue
      exact False.elim (hnotDue
        (actor_shortener_of_phase_legal_select hp ha) hdue)
  | externalSelectTerminalFirst prev ha hout hactor hterminal hpreserve ih =>
      contradiction
  | externalSelectTerminalLater prev ha hout hactor hterminal hpreserve ih =>
      contradiction
  | pass prev ha hpreserve ih => simp [step]
  | endOpeningDormant prev ha hpreserve ih => contradiction
  | endOpeningActive prev ha hpreserve ih => contradiction
  | insideProlongerOpeningFirst prev ha hactor hphase run hstage hfixed hpreserve ih =>
      contradiction
  | insideProlongerOpeningMore prev ha hactor hphase run hstage hfixed hpreserve ih =>
      contradiction
  | insideProlongerAfterFirst prev ha hactor run hstage hfixed hpreserve ih =>
      contradiction
  | insideProlongerReturnOpening prev ha hactor run hstage hfixed hpreserve ih =>
      have hp := phase_regular_prolonger_of_actor_nonopening hactor (by
        intro hopen
        rcases prev.opening_mode_of_global_opening hopen with h | ⟨k, h⟩ <;>
          contradiction)
      simp [step, hp]
  | insideProlongerReturnLater prev ha hactor run hstage hfixed hpreserve ih =>
      have hp := phase_regular_prolonger_of_actor_nonopening hactor (by
        intro hopen
        rcases prev.opening_mode_of_global_opening hopen with h | ⟨k, h⟩ <;>
          contradiction)
      simp [step, hp]
  | insideProlongerLater prev ha hactor run hstage hfixed hpreserve ih =>
      have hp := phase_regular_prolonger_of_actor_nonopening hactor (by
        intro hopen
        rcases prev.opening_mode_of_global_opening hopen with h | ⟨k, h⟩ <;>
          contradiction)
      simp [step, hp]
  | firstInsideShortenerWaiting prev ha hactor run hstage hfixed hpreserve ih =>
      contradiction
  | firstInsideShortenerDue prev ha hactor run hstage hfixed hpreserve ih =>
      contradiction
  | laterInsideShortenerDirect prev ha hactor run hstage hfixed hpreserve ih =>
      contradiction
  | laterInsideShortenerAdvance prev ha hactor run hstage hfixed hpreserve ih =>
      contradiction

def OpeningTally.waitingReady {b : ℕ} : OpeningTally b → Prop
  | .during0 _ | .later1 => True
  | .during1 _ | .later2 => False

theorem SweepTrace.waitingFirst_ready
    {D : Finset Vertex} {N t b : ℕ}
    {gp lp : Pos} {gh : History D (initialPos b) gp}
    {lh : History (Erdos872.quotientCone D N t)
      (initialPos (b + 1)) lp}
    {batches pending mode c}
    (tr : SweepTrace D N t b gh lh batches pending mode)
    (hmode : mode = .waitingFirst c) : c.waitingReady := by
  induction tr <;> simp_all [OpeningTally.waitingReady]
  all_goals cases hmode <;> trivial

/-- Every legal inside Prolonger selection is accepted by the exact local
projector.  Invalid waiting tallies never occur; due modes belong to the
global Shortener phase; and dead modes have empty projected live set. -/
theorem RootLocal.canAcceptProlonger_of_inside
    {D : Finset Vertex} {N t b m : ℕ}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (hD : IsDownset N D) (ht : 0 < t)
    (L : RootLocal (N := N) t gh)
    (ha : Action.select (t * m) ∈ legalActions D gp)
    (hactor : actorAt D gp = some Actor.prolonger) :
    LocalCanAcceptProlonger L.mode := by
  have heff := L.trace.inside_mem_effective hD ht ha
  cases hmode : L.mode with
  | openingDormant | openingActive _ | postDormant | running _ => trivial
  | waitingFirst c =>
      have hready := L.trace.waitingFirst_ready hmode
      cases c <;> simp_all [OpeningTally.waitingReady, LocalCanAcceptProlonger]
  | responseDueFirst c =>
      have hp := L.trace.responseDue_global_phase (by
        simp [hmode, LocalMode.responseDue])
      have hnot := phase_regular_prolonger_of_actor_nonopening hactor (by
        intro hopen
        rcases hopen with ⟨r, hr⟩
        simp [hp] at hr)
      simp [hp] at hnot
  | responseDueLater c =>
      have hp := L.trace.responseDue_global_phase (by
        simp [hmode, LocalMode.responseDue])
      have hnot := phase_regular_prolonger_of_actor_nonopening hactor (by
        intro hopen
        rcases hopen with ⟨r, hr⟩
        simp [hp] at hr)
      simp [hp] at hnot
  | deadFirst c =>
      have hempty := L.trace.dead_effective_empty (Or.inl ⟨c, hmode⟩)
      exact False.elim (by
        rw [hempty] at heff
        simp at heff)
  | deadLater c =>
      have hempty := L.trace.dead_effective_empty (Or.inr ⟨c, hmode⟩)
      exact False.elim (by
        rw [hempty] at heff
        simp at heff)

def RootLocal.afterInsideProlonger
    {D : Finset Vertex} {N t b m : ℕ}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (hD : IsDownset N D) (ht : 0 < t) (hb : 1 ≤ b)
    (L : RootLocal (N := N) t gh)
    (ha : Action.select (t * m) ∈ legalActions D gp)
    (hactor : actorAt D gp = some Actor.prolonger)
    (hready : LocalCanAcceptProlonger L.mode) :
    RootLocal (N := N) t (.snoc gh _ ha) := by
  rcases L with ⟨lp, lh, batches, pending, mode, tr⟩
  change LocalCanAcceptProlonger mode at hready
  let cert := tr.buildInsideProlongerRun hD ht hb ha hready
  cases mode with
  | openingDormant =>
      cases hphase : gp.phase with
      | opening r =>
          cases r with
          | zero => exact False.elim (select_not_legal_at_opening_zero hphase ha)
          | succ r =>
              exact
                { localEnd := cert.localEnd
                  localHistory := cert.run.appendHistory lh
                  erasureBatches := batches ++ [pending]
                  pending := []
                  mode := .openingActive 1
                  trace := SweepTrace.insideProlongerOpeningFirst
                    (gp := gp) (lp := lp) tr
                    ha hactor hphase cert.run cert.endStage
                    cert.preservesFixed cert.preservesLive }
      | regular who =>
          exact False.elim (by
            rcases tr.operationalBudget with ⟨r, hr, _⟩
            simp [hphase] at hr)
  | openingActive k =>
      cases hphase : gp.phase with
      | opening r =>
          cases r with
          | zero => exact False.elim (select_not_legal_at_opening_zero hphase ha)
          | succ r =>
              exact
                { localEnd := cert.localEnd
                  localHistory := cert.run.appendHistory lh
                  erasureBatches := batches ++ [pending]
                  pending := []
                  mode := .openingActive (k + 1)
                  trace := SweepTrace.insideProlongerOpeningMore
                    (gp := gp) (lp := lp) tr
                    ha hactor hphase cert.run cert.endStage
                    cert.preservesFixed cert.preservesLive }
      | regular who =>
          exact False.elim (by
            rcases tr.operationalBudget with ⟨r, hr, _⟩
            simp [hphase] at hr)
  | postDormant =>
      exact
        { localEnd := cert.localEnd
          localHistory := cert.run.appendHistory lh
          erasureBatches := batches ++ [pending]
          pending := []
          mode := .waitingFirst .later1
          trace := SweepTrace.insideProlongerAfterFirst
            (gp := gp) (lp := lp) tr
            ha hactor cert.run cert.endStage
            cert.preservesFixed cert.preservesLive }
  | waitingFirst c =>
      cases c with
      | during0 k =>
          exact
            { localEnd := cert.localEnd
              localHistory := cert.run.appendHistory lh
              erasureBatches := batches ++ [pending]
              pending := []
              mode := .responseDueFirst (.during1 k)
              trace := SweepTrace.insideProlongerReturnOpening
                (gp := gp) (lp := lp) tr
                ha hactor cert.run cert.endStage
                cert.preservesFixed cert.preservesLive }
      | later1 =>
          exact
            { localEnd := cert.localEnd
              localHistory := cert.run.appendHistory lh
              erasureBatches := batches ++ [pending]
              pending := []
              mode := .responseDueFirst .later2
              trace := SweepTrace.insideProlongerReturnLater
                (gp := gp) (lp := lp) tr
                ha hactor cert.run cert.endStage
                cert.preservesFixed cert.preservesLive }
      | during1 k => contradiction
      | later2 => contradiction
  | running c =>
      exact
        { localEnd := cert.localEnd
          localHistory := cert.run.appendHistory lh
          erasureBatches := batches ++ [pending]
          pending := []
          mode := .responseDueLater c
          trace := SweepTrace.insideProlongerLater
            (gp := gp) (lp := lp) tr
            ha hactor cert.run cert.endStage
            cert.preservesFixed cert.preservesLive }
  | responseDueFirst c => contradiction
  | responseDueLater c => contradiction
  | deadFirst c => contradiction
  | deadLater c => contradiction

theorem RootLocal.afterInsideProlonger_activated
    {D : Finset Vertex} {N t b m : ℕ}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (hD : IsDownset N D) (ht : 0 < t) (hb : 1 ≤ b)
    (L : RootLocal (N := N) t gh)
    (ha : Action.select (t * m) ∈ legalActions D gp)
    (hactor : actorAt D gp = some Actor.prolonger)
    (hready : LocalCanAcceptProlonger L.mode) :
    (L.afterInsideProlonger hD ht hb ha hactor hready).activated := by
  rcases gp with ⟨phase, stage, state⟩
  rcases L with ⟨lp, lh, batches, pending, mode, tr⟩
  cases mode with
  | openingDormant =>
      cases phase with
      | opening r =>
          cases r with
          | zero => exact False.elim (select_not_legal_at_opening_zero rfl ha)
          | succ r =>
              simp [RootLocal.afterInsideProlonger, RootLocal.activated,
                LocalMode.tally?]
      | regular who =>
          exact False.elim (by
            rcases tr.operationalBudget with ⟨r, hr, _⟩
            simp at hr)
  | openingActive k =>
      cases phase with
      | opening r =>
          cases r with
          | zero => exact False.elim (select_not_legal_at_opening_zero rfl ha)
          | succ r =>
              simp [RootLocal.afterInsideProlonger, RootLocal.activated,
                LocalMode.tally?]
      | regular who =>
          exact False.elim (by
            rcases tr.operationalBudget with ⟨r, hr, _⟩
            simp at hr)
  | postDormant =>
      simp [RootLocal.afterInsideProlonger, RootLocal.activated,
        LocalMode.tally?]
  | waitingFirst c =>
      cases c with
      | during0 k =>
          simp [RootLocal.afterInsideProlonger, RootLocal.activated,
            LocalMode.tally?, LocalCanAcceptProlonger]
      | later1 =>
          simp [RootLocal.afterInsideProlonger, RootLocal.activated,
            LocalMode.tally?, LocalCanAcceptProlonger]
      | during1 k => contradiction
      | later2 => contradiction
  | running c =>
      simp [RootLocal.afterInsideProlonger, RootLocal.activated,
        LocalMode.tally?]
  | responseDueFirst c => contradiction
  | responseDueLater c => contradiction
  | deadFirst c => contradiction
  | deadLater c => contradiction

/-- The first Prolonger entry into a previously dormant cone creates a
waiting local game, not an immediately due response. -/
theorem RootLocal.afterInsideProlonger_not_responseDue_of_inactive
    {D : Finset Vertex} {N t b m : ℕ}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (hD : IsDownset N D) (ht : 0 < t) (hb : 1 ≤ b)
    (L : RootLocal (N := N) t gh)
    (ha : Action.select (t * m) ∈ legalActions D gp)
    (hactor : actorAt D gp = some Actor.prolonger)
    (hready : LocalCanAcceptProlonger L.mode)
    (hinactive : ¬L.activated) :
    ¬(L.afterInsideProlonger hD ht hb ha hactor hready).responseDue := by
  rcases gp with ⟨phase, stage, state⟩
  rcases L with ⟨lp, lh, batches, pending, mode, tr⟩
  cases mode with
  | openingDormant =>
      cases phase with
      | opening r =>
          cases r with
          | zero => exact False.elim (select_not_legal_at_opening_zero rfl ha)
          | succ r =>
              simp [RootLocal.afterInsideProlonger, RootLocal.responseDue,
                LocalMode.responseDue]
      | regular who =>
          exact False.elim (by
            rcases tr.operationalBudget with ⟨r, hr, _⟩
            simp at hr)
  | postDormant =>
      simp [RootLocal.afterInsideProlonger, RootLocal.responseDue,
        LocalMode.responseDue]
  | openingActive k =>
      exact False.elim (hinactive (by
        simp [RootLocal.activated, LocalMode.tally?]))
  | waitingFirst c =>
      exact False.elim (hinactive (by
        simp [RootLocal.activated, LocalMode.tally?]))
  | responseDueFirst c =>
      exact False.elim (hinactive (by
        simp [RootLocal.activated, LocalMode.tally?]))
  | running c =>
      exact False.elim (hinactive (by
        simp [RootLocal.activated, LocalMode.tally?]))
  | responseDueLater c =>
      exact False.elim (hinactive (by
        simp [RootLocal.activated, LocalMode.tally?]))
  | deadFirst c =>
      exact False.elim (hinactive (by
        simp [RootLocal.activated, LocalMode.tally?]))
  | deadLater c =>
      exact False.elim (hinactive (by
        simp [RootLocal.activated, LocalMode.tally?]))

set_option maxHeartbeats 800000 in
structure FirstShortenerRun
    (D : Finset Vertex) (N t b : ℕ)
    {gp lp : Pos} (gh : History D (initialPos b) gp)
    (lh : History (Erdos872.quotientCone D N t)
      (initialPos (b + 1)) lp)
    (pending : List (Finset Vertex)) where
  m : Vertex
  localEnd : Pos
  run : LegalRun (Erdos872.quotientCone D N t) lp
    [Action.erase (unionAll pending), Action.endOpening,
      Action.erase ∅, Action.select m] localEnd
  globalLegal : Action.select (t * m) ∈ legalActions D gp
  endStage : localEnd.stage = Stage.beforeErase
  preservesFixed : FollowsShortenerStrategy optimalShortener lh →
    FollowsShortenerStrategy optimalShortener (run.appendHistory lh)
  preservesLive : LiveCorresponds D N t gp lp pending →
    LiveCorresponds D N t (step D gp (Action.select (t * m))) localEnd []

set_option maxHeartbeats 800000 in
noncomputable def SweepTrace.buildFirstShortenerRun
    {D : Finset Vertex} {N t b : ℕ}
    {gp lp : Pos} {gh : History D (initialPos b) gp}
    {lh : History (Erdos872.quotientCone D N t)
      (initialPos (b + 1)) lp}
    {batches pending mode r}
    (ht : 0 < t) (tr : SweepTrace D N t b gh lh batches pending mode)
    (hglobalActor : actorAt D gp = some Actor.shortener)
    (hlocalPhase : lp.phase = Phase.opening r)
    {seed : Vertex}
    (hseed : seed ∈ effectiveLocalLive
      (Erdos872.quotientCone D N t) lp pending) :
    FirstShortenerRun D N t b gh lh pending := by
  let Q := Erdos872.quotientCone D N t
  let U := unionAll pending
  have hErase : Action.erase U ∈ legalActions Q lp :=
    tr.flush_legal_of_mem ht hseed
  let p₁ := step Q lp (Action.erase U)
  have hseed₁ : seed ∈ liveLegal Q p₁.state := tr.mem_live_after_flush hseed
  have hEnd : Action.endOpening ∈ legalActions Q p₁ := by
    simpa [p₁, U] using tr.first_endOpening_legal_of_mem hlocalPhase hseed
  let p₂ := step Q p₁ Action.endOpening
  have hseed₂ : seed ∈ liveLegal Q p₂.state := by
    simpa [p₂, step] using hseed₁
  have hEraseEmpty : Action.erase ∅ ∈ legalActions Q p₂ := by
    apply erase_mem_legalActions_of_stage rfl
    · exact Finset.nonempty_iff_ne_empty.mp ⟨seed, hseed₂⟩
    · simp [IsUpset]
  let p₃ := step Q p₂ (Action.erase ∅)
  have hseed₃ : seed ∈ liveLegal Q p₃.state := by
    simpa [p₃, step, eraseState] using hseed₂
  let h₁ : History Q (initialPos (b + 1)) p₁ := .snoc lh _ hErase
  let h₂ : History Q (initialPos (b + 1)) p₂ := .snoc h₁ _ hEnd
  let h₃ : History Q (initialPos (b + 1)) p₃ := .snoc h₂ _ hEraseEmpty
  have hs : actorAt Q p₃ = some Actor.shortener := by
    unfold actorAt
    rw [if_neg (Finset.nonempty_iff_ne_empty.mp ⟨seed, hseed₃⟩)]
    simp [p₃, p₂, p₁, step, hlocalPhase]
  let chosen := optimalShortener h₃ hs
  let m := Classical.choose (legal_action_at_shortener_is_select hs chosen.2)
  have hm : chosen.1 = Action.select m :=
    Classical.choose_spec (legal_action_at_shortener_is_select hs chosen.2)
  have hSelect : Action.select m ∈ legalActions Q p₃ := by
    rw [← hm]
    exact chosen.2
  let p₄ := step Q p₃ (Action.select m)
  let run : LegalRun Q lp
      [Action.erase U, Action.endOpening, Action.erase ∅, Action.select m] p₄ :=
    .cons hErase (.cons hEnd (.cons hEraseEmpty (.cons hSelect (.nil p₄))))
  have hmEffective : m ∈ effectiveLocalLive Q lp pending := by
    rw [effectiveLocalLive, ← liveLegal_eraseState_eq_sdiff]
    simpa [p₃, p₂, p₁, step, eraseState] using
      select_mem_liveLegal_of_legal hSelect
  have hGlobalLegal := tr.global_shortener_select_legal hglobalActor hmEffective
  refine ⟨m, p₄, run, hGlobalLegal, ?_, ?_, ?_⟩
  · simp [p₄, p₃, p₂, p₁, step, hlocalPhase]
  · intro hf
    have hf₁ := hf.snoc_nonshortener hErase
      (erase_legal_actor_ne_shortener hErase)
    have hEndNotS : actorAt Q p₁ ≠ some Actor.shortener := by
      intro hshort
      rcases legal_action_at_shortener_is_select hshort hEnd with ⟨z, hz⟩
      contradiction
    have hf₂ := hf₁.snoc_nonshortener hEnd hEndNotS
    have hf₃ := hf₂.snoc_nonshortener hEraseEmpty
      (erase_legal_actor_ne_shortener hEraseEmpty)
    exact ⟨hf₃, fun hs' => by
      rw [show hs' = hs from Subsingleton.elim _ _]
      exact hm.symm⟩
  · intro hcorr
    have hbase := hcorr.after_inside_select ht (m := m)
    unfold LiveCorresponds quotientLive effectiveLocalLive at hbase ⊢
    rw [step_select_state D gp (t * m),
      step_select_state Q (step Q lp (Action.erase (unionAll pending))) m] at hbase
    change Erdos872.quotientCone
      (liveLegal D (step D gp (Action.select (t * m))).state) N t =
        liveLegal Q p₄.state
    rw [step_select_state D gp (t * m), show p₄.state = selectState p₃.state m by
      exact step_select_state Q p₃ m]
    simpa [p₃, p₂, p₁, step, eraseState, Q, U, unionAll] using hbase

set_option maxHeartbeats 800000 in
structure AdvanceShortenerRun
    (D : Finset Vertex) (N t b : ℕ)
    {gp lp : Pos} (gh : History D (initialPos b) gp)
    (lh : History (Erdos872.quotientCone D N t)
      (initialPos (b + 1)) lp)
    (pending : List (Finset Vertex)) where
  m : Vertex
  localEnd : Pos
  run : LegalRun (Erdos872.quotientCone D N t) lp
    [Action.erase (unionAll pending), Action.pass,
      Action.erase ∅, Action.select m] localEnd
  globalLegal : Action.select (t * m) ∈ legalActions D gp
  endStage : localEnd.stage = Stage.beforeErase
  preservesFixed : FollowsShortenerStrategy optimalShortener lh →
    FollowsShortenerStrategy optimalShortener (run.appendHistory lh)
  preservesLive : LiveCorresponds D N t gp lp pending →
    LiveCorresponds D N t (step D gp (Action.select (t * m))) localEnd []

set_option maxHeartbeats 800000 in
noncomputable def SweepTrace.buildAdvanceShortenerRun
    {D : Finset Vertex} {N t b : ℕ}
    {gp lp : Pos} {gh : History D (initialPos b) gp}
    {lh : History (Erdos872.quotientCone D N t)
      (initialPos (b + 1)) lp}
    {batches pending mode}
    (ht : 0 < t) (tr : SweepTrace D N t b gh lh batches pending mode)
    (hglobalActor : actorAt D gp = some Actor.shortener)
    (hlocalPhase : lp.phase = Phase.regular Player.prolonger)
    {seed : Vertex}
    (hseed : seed ∈ effectiveLocalLive
      (Erdos872.quotientCone D N t) lp pending) :
    AdvanceShortenerRun D N t b gh lh pending := by
  let Q := Erdos872.quotientCone D N t
  let U := unionAll pending
  have hErase : Action.erase U ∈ legalActions Q lp :=
    tr.flush_legal_of_mem ht hseed
  let p₁ := step Q lp (Action.erase U)
  have hseed₁ : seed ∈ liveLegal Q p₁.state := tr.mem_live_after_flush hseed
  have hPass : Action.pass ∈ legalActions Q p₁ := by
    simpa [p₁, U] using tr.advance_pass_legal_of_mem hlocalPhase hseed
  let p₂ := step Q p₁ Action.pass
  have hseed₂ : seed ∈ liveLegal Q p₂.state := by
    simpa [p₂, step] using hseed₁
  have hEraseEmpty : Action.erase ∅ ∈ legalActions Q p₂ := by
    apply erase_mem_legalActions_of_stage rfl
    · exact Finset.nonempty_iff_ne_empty.mp ⟨seed, hseed₂⟩
    · simp [IsUpset]
  let p₃ := step Q p₂ (Action.erase ∅)
  have hseed₃ : seed ∈ liveLegal Q p₃.state := by
    simpa [p₃, step, eraseState] using hseed₂
  let h₁ : History Q (initialPos (b + 1)) p₁ := .snoc lh _ hErase
  let h₂ : History Q (initialPos (b + 1)) p₂ := .snoc h₁ _ hPass
  let h₃ : History Q (initialPos (b + 1)) p₃ := .snoc h₂ _ hEraseEmpty
  have hs : actorAt Q p₃ = some Actor.shortener := by
    unfold actorAt
    rw [if_neg (Finset.nonempty_iff_ne_empty.mp ⟨seed, hseed₃⟩)]
    simp [p₃, p₂, p₁, step, hlocalPhase]
  let chosen := optimalShortener h₃ hs
  let m := Classical.choose (legal_action_at_shortener_is_select hs chosen.2)
  have hm : chosen.1 = Action.select m :=
    Classical.choose_spec (legal_action_at_shortener_is_select hs chosen.2)
  have hSelect : Action.select m ∈ legalActions Q p₃ := by
    rw [← hm]
    exact chosen.2
  let p₄ := step Q p₃ (Action.select m)
  let run : LegalRun Q lp
      [Action.erase U, Action.pass, Action.erase ∅, Action.select m] p₄ :=
    .cons hErase (.cons hPass (.cons hEraseEmpty (.cons hSelect (.nil p₄))))
  have hmEffective : m ∈ effectiveLocalLive Q lp pending := by
    rw [effectiveLocalLive, ← liveLegal_eraseState_eq_sdiff]
    simpa [p₃, p₂, p₁, step, eraseState] using
      select_mem_liveLegal_of_legal hSelect
  have hGlobalLegal := tr.global_shortener_select_legal hglobalActor hmEffective
  refine ⟨m, p₄, run, hGlobalLegal, ?_, ?_, ?_⟩
  · simp [p₄, p₃, p₂, p₁, step, hlocalPhase]
  · intro hf
    have hf₁ := hf.snoc_nonshortener hErase
      (erase_legal_actor_ne_shortener hErase)
    have hPassNotS : actorAt Q p₁ ≠ some Actor.shortener := by
      intro hshort
      rcases legal_action_at_shortener_is_select hshort hPass with ⟨z, hz⟩
      contradiction
    have hf₂ := hf₁.snoc_nonshortener hPass hPassNotS
    have hf₃ := hf₂.snoc_nonshortener hEraseEmpty
      (erase_legal_actor_ne_shortener hEraseEmpty)
    exact ⟨hf₃, fun hs' => by
      rw [show hs' = hs from Subsingleton.elim _ _]
      exact hm.symm⟩
  · intro hcorr
    have hbase := hcorr.after_inside_select ht (m := m)
    unfold LiveCorresponds quotientLive effectiveLocalLive at hbase ⊢
    rw [step_select_state D gp (t * m),
      step_select_state Q (step Q lp (Action.erase (unionAll pending))) m] at hbase
    change Erdos872.quotientCone
      (liveLegal D (step D gp (Action.select (t * m))).state) N t =
        liveLegal Q p₄.state
    rw [step_select_state D gp (t * m), show p₄.state = selectState p₃.state m by
      exact step_select_state Q p₃ m]
    simpa [p₃, p₂, p₁, step, eraseState, Q, U, unionAll] using hbase

def RootLocal.afterFirstDue
    {D : Finset Vertex} {N t b : ℕ}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (L : RootLocal (N := N) t gh) {c : OpeningTally b}
    (hmode : L.mode = .responseDueFirst c)
    (hactor : actorAt D gp = some Actor.shortener)
    (cert : FirstShortenerRun D N t b gh L.localHistory L.pending) :
    RootLocal (N := N) t (.snoc gh _ cert.globalLegal) :=
  { localEnd := cert.localEnd
    localHistory := cert.run.appendHistory L.localHistory
    erasureBatches := L.erasureBatches ++ [L.pending, []]
    pending := []
    mode := .running c
    trace := SweepTrace.firstInsideShortenerDue
      (gp := gp) (lp := L.localEnd) (hmode ▸ L.trace)
      cert.globalLegal hactor
      cert.run cert.endStage cert.preservesFixed cert.preservesLive }

def RootLocal.afterFirstWaiting
    {D : Finset Vertex} {N t b : ℕ}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (L : RootLocal (N := N) t gh) {c : OpeningTally b}
    (hmode : L.mode = .waitingFirst c)
    (hactor : actorAt D gp = some Actor.shortener)
    (cert : FirstShortenerRun D N t b gh L.localHistory L.pending) :
    RootLocal (N := N) t (.snoc gh _ cert.globalLegal) :=
  { localEnd := cert.localEnd
    localHistory := cert.run.appendHistory L.localHistory
    erasureBatches := L.erasureBatches ++ [L.pending, []]
    pending := []
    mode := .running c
    trace := SweepTrace.firstInsideShortenerWaiting
      (gp := gp) (lp := L.localEnd) (hmode ▸ L.trace)
      cert.globalLegal hactor
      cert.run cert.endStage cert.preservesFixed cert.preservesLive }

def RootLocal.afterLaterDirect
    {D : Finset Vertex} {N t b : ℕ}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (L : RootLocal (N := N) t gh) {c : OpeningTally b}
    (hmode : L.mode = .responseDueLater c)
    (hactor : actorAt D gp = some Actor.shortener)
    (cert : DirectShortenerRun D N t b gh L.localHistory L.pending) :
    RootLocal (N := N) t (.snoc gh _ cert.globalLegal) :=
  { localEnd := cert.localEnd
    localHistory := cert.run.appendHistory L.localHistory
    erasureBatches := L.erasureBatches ++ [L.pending]
    pending := []
    mode := .running c
    trace := SweepTrace.laterInsideShortenerDirect
      (gp := gp) (lp := L.localEnd) (hmode ▸ L.trace)
      cert.globalLegal hactor
      cert.run cert.endStage cert.preservesFixed cert.preservesLive }

def RootLocal.afterLaterAdvance
    {D : Finset Vertex} {N t b : ℕ}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (L : RootLocal (N := N) t gh) {c : OpeningTally b}
    (hmode : L.mode = .running c)
    (hactor : actorAt D gp = some Actor.shortener)
    (cert : AdvanceShortenerRun D N t b gh L.localHistory L.pending) :
    RootLocal (N := N) t (.snoc gh _ cert.globalLegal) :=
  { localEnd := cert.localEnd
    localHistory := cert.run.appendHistory L.localHistory
    erasureBatches := L.erasureBatches ++ [L.pending, []]
    pending := []
    mode := .running c
    trace := SweepTrace.laterInsideShortenerAdvance
      (gp := gp) (lp := L.localEnd) (hmode ▸ L.trace)
      cert.globalLegal hactor
      cert.run cert.endStage cert.preservesFixed cert.preservesLive }

/-- The exact one-cone result of a certified Shortener selection.  Carrying
this object in the global decision certificate prevents the selected action
from being separated from the local minimax run which produced it. -/
structure RootLocalShortenerSuccessor
    {D : Finset Vertex} {N t b x : ℕ}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (L : RootLocal (N := N) t gh)
    (ha : Action.select x ∈ legalActions D gp) where
  next : RootLocal (N := N) t (.snoc gh (Action.select x) ha)
  activated_iff : next.activated ↔ L.activated
  not_responseDue : ¬next.responseDue

def RootLocalShortenerSuccessor.ofFirstDue
    {D : Finset Vertex} {N t b : ℕ}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (L : RootLocal (N := N) t gh) {c : OpeningTally b}
    (hmode : L.mode = .responseDueFirst c)
    (hactor : actorAt D gp = some Actor.shortener)
    (cert : FirstShortenerRun D N t b gh L.localHistory L.pending) :
    RootLocalShortenerSuccessor L cert.globalLegal where
  next := L.afterFirstDue hmode hactor cert
  activated_iff := by
    simp [RootLocal.afterFirstDue, RootLocal.activated, hmode,
      LocalMode.tally?]
  not_responseDue := by
    simp [RootLocal.afterFirstDue, RootLocal.responseDue,
      LocalMode.responseDue]

def RootLocalShortenerSuccessor.ofFirstWaiting
    {D : Finset Vertex} {N t b : ℕ}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (L : RootLocal (N := N) t gh) {c : OpeningTally b}
    (hmode : L.mode = .waitingFirst c)
    (hactor : actorAt D gp = some Actor.shortener)
    (cert : FirstShortenerRun D N t b gh L.localHistory L.pending) :
    RootLocalShortenerSuccessor L cert.globalLegal where
  next := L.afterFirstWaiting hmode hactor cert
  activated_iff := by
    simp [RootLocal.afterFirstWaiting, RootLocal.activated, hmode,
      LocalMode.tally?]
  not_responseDue := by
    simp [RootLocal.afterFirstWaiting, RootLocal.responseDue,
      LocalMode.responseDue]

def RootLocalShortenerSuccessor.ofLaterDirect
    {D : Finset Vertex} {N t b : ℕ}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (L : RootLocal (N := N) t gh) {c : OpeningTally b}
    (hmode : L.mode = .responseDueLater c)
    (hactor : actorAt D gp = some Actor.shortener)
    (cert : DirectShortenerRun D N t b gh L.localHistory L.pending) :
    RootLocalShortenerSuccessor L cert.globalLegal where
  next := L.afterLaterDirect hmode hactor cert
  activated_iff := by
    simp [RootLocal.afterLaterDirect, RootLocal.activated, hmode,
      LocalMode.tally?]
  not_responseDue := by
    simp [RootLocal.afterLaterDirect, RootLocal.responseDue,
      LocalMode.responseDue]

def RootLocalShortenerSuccessor.ofLaterAdvance
    {D : Finset Vertex} {N t b : ℕ}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (L : RootLocal (N := N) t gh) {c : OpeningTally b}
    (hmode : L.mode = .running c)
    (hactor : actorAt D gp = some Actor.shortener)
    (cert : AdvanceShortenerRun D N t b gh L.localHistory L.pending) :
    RootLocalShortenerSuccessor L cert.globalLegal where
  next := L.afterLaterAdvance hmode hactor cert
  activated_iff := by
    simp [RootLocal.afterLaterAdvance, RootLocal.activated, hmode,
      LocalMode.tally?]
  not_responseDue := by
    simp [RootLocal.afterLaterAdvance, RootLocal.responseDue,
      LocalMode.responseDue]

/-! ## The total first-applicable Shortener decision -/

structure DueMoveWitness
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (S : SweepState G gh) where
  t : Vertex
  ht : t ∈ R
  hnot : t ∉ S.fired
  due : (S.runtime t ht hnot).responseDue
  nonempty : (S.runtime t ht hnot).effective.Nonempty

/-- A due cone supplies a move exactly when its projected effective live set
is nonempty. -/
def DueMoveAvailable
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (S : SweepState G gh) : Prop := Nonempty (DueMoveWitness S)

/-- Live unprocessed roots.  The strategy applies `nextRoot?` to this finset,
so equal-weight ties are resolved by the fixed numeric order. -/
noncomputable def rootSweepCandidates
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (S : SweepState G gh) : Finset Vertex := by
  classical
  exact R.filter fun t => S.isUnprocessed t ∧ t ∈ liveLegal D gp.state

def RootSweepAvailable
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (S : SweepState G gh) : Prop := (rootSweepCandidates S).Nonempty

def rootSweepRoot?
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (S : SweepState G gh) : Option Vertex :=
  nextRoot? (rootSweepCandidates S)

theorem rootSweepRoot?_weight_ge
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (S : SweepState G gh) {t s : Vertex}
    (hnext : rootSweepRoot? S = some t)
    (hs : s ∈ rootSweepCandidates S) :
    rootWeight N s ≤ rootWeight N t := by
  classical
  apply nextRoot?_weight_ge (N := N) (R := rootSweepCandidates S)
    (Nat.cast_nonneg N)
  · intro r hr
    have hr' := hr
    rw [rootSweepCandidates, Finset.mem_filter] at hr'
    exact G.roots_pos hr'.1
  · exact hnext
  · exact hs

/-- A frozen active cone supplies a move by inserting a local Prolonger pass.
The two displayed modes are precisely the modes in which that advance is
used by the first-applicable strategy. -/
structure AdvanceMoveWitness
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (S : SweepState G gh) where
  t : Vertex
  ht : t ∈ R
  hnot : t ∉ S.fired
  nonempty : (S.runtime t ht hnot).effective.Nonempty
  mode : (∃ c, (S.runtime t ht hnot).mode = .waitingFirst c) ∨
    (∃ c, (S.runtime t ht hnot).mode = .running c)

def AdvanceMoveAvailable
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (S : SweepState G gh) : Prop := Nonempty (AdvanceMoveWitness S)

/-- The three disjoint accounting classes of actual Shortener selections.
The `local` constructor covers both an immediate response and a pass-advance;
an arithmetically exceptional vertex inside that cone remains in this class.
-/
inductive SweepMove
    {D R : Finset Vertex} {N b : ℕ} (G : SweepGeometry D R N)
    {gp : Pos} (gh : History D (initialPos b) gp)
    (S : SweepState G gh) where
  | inside (t x : Vertex) (ht : t ∈ R) (hnot : t ∉ S.fired)
      (hx : x ∈ rootCone N t)
      (legal : Action.select x ∈ legalActions D gp)
      (update : RootLocalShortenerSuccessor
        (S.runtime t ht hnot) legal)
      (terminalOther : ∀ s (hs : s ∈ R) (hsnot : s ∉ S.fired),
        s ≠ t → (S.runtime s hs hsnot).responseDue →
          (S.runtime s hs hsnot).effective = ∅) : SweepMove G gh S
  | fire (t : Vertex) (ht : t ∈ R)
      (hunprocessed : S.isUnprocessed t)
      (legal : Action.select t ∈ legalActions D gp)
      (terminalAll : ∀ s (hs : s ∈ R) (hsnot : s ∉ S.fired),
        (S.runtime s hs hsnot).responseDue →
          (S.runtime s hs hsnot).effective = ∅)
      (dominates : ∀ s ∈ rootSweepCandidates S,
        rootWeight N s ≤ rootWeight N t) : SweepMove G gh S
  | exceptional (x : Vertex) (hx : x ∈ G.exceptional)
      (hout : ∀ t ∈ R, x ∉ rootCone N t)
      (legal : Action.select x ∈ legalActions D gp)
      (terminalAll : ∀ s (hs : s ∈ R) (hsnot : s ∉ S.fired),
        (S.runtime s hs hsnot).responseDue →
          (S.runtime s hs hsnot).effective = ∅) : SweepMove G gh S

def SweepMove.action
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {gp : Pos} {gh : History D (initialPos b) gp}
    {S : SweepState G gh} : SweepMove G gh S → Action
  | .inside _ x _ _ _ _ _ _ => .select x
  | .fire t _ _ _ _ _ => .select t
  | .exceptional x _ _ _ _ => .select x

theorem SweepMove.legal
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {gp : Pos} {gh : History D (initialPos b) gp}
    {S : SweepState G gh}
    (m : SweepMove G gh S) : m.action ∈ legalActions D gp := by
  cases m with
  | inside t x ht hnot hx ha update terminalOther => exact ha
  | fire t ht hunprocessed ha terminalAll dominates => exact ha
  | exceptional x hx hout ha terminalAll => exact ha

private theorem cone_mem_of_legal_multiple
    {D R : Finset Vertex} {N t m : ℕ} {p : Pos}
    (G : SweepGeometry D R N) (ht : t ∈ R)
    (ha : Action.select (t * m) ∈ legalActions D p) :
    t * m ∈ rootCone N t := by
  have hlive := select_mem_liveLegal_of_legal ha
  have hD : t * m ∈ D := (Finset.mem_filter.mp hlive).1
  have hboard := G.downset.1 hD
  exact rootCone_mem_iff.mpr
    ⟨Nat.lt_of_lt_of_le Nat.zero_lt_one (Finset.mem_Icc.mp hboard).1,
      dvd_mul_right t m, (Finset.mem_Icc.mp hboard).2⟩

private theorem rootCone_mem_of_dvd_legal
    {D R : Finset Vertex} {N s x : ℕ} {p : Pos}
    (G : SweepGeometry D R N)
    (ha : Action.select x ∈ legalActions D p) (hsx : s ∣ x) :
    x ∈ rootCone N s := by
  have hlive := select_mem_liveLegal_of_legal ha
  have hxD : x ∈ D := (Finset.mem_filter.mp hlive).1
  have hxBoard := G.downset.1 hxD
  exact rootCone_mem_iff.mpr
    ⟨Nat.lt_of_lt_of_le Nat.zero_lt_one (Finset.mem_Icc.mp hxBoard).1,
      hsx, (Finset.mem_Icc.mp hxBoard).2⟩

private theorem not_dvd_of_other_cone
    {D R : Finset Vertex} {N s t x : ℕ} {p : Pos}
    (G : SweepGeometry D R N) (hs : s ∈ R) (ht : t ∈ R)
    (hne : s ≠ t) (hx : x ∈ rootCone N t)
    (ha : Action.select x ∈ legalActions D p) : ¬s ∣ x := by
  intro hsx
  exact hne (G.root_eq_of_mem_cones hs ht
    (rootCone_mem_of_dvd_legal G ha hsx) hx)

private theorem not_dvd_of_outside_cones
    {D R : Finset Vertex} {N s x : ℕ} {p : Pos}
    (G : SweepGeometry D R N) (hs : s ∈ R)
    (hout : x ∉ rootCone N s)
    (ha : Action.select x ∈ legalActions D p) : ¬s ∣ x := by
  intro hsx
  exact hout (rootCone_mem_of_dvd_legal G ha hsx)

private theorem terminal_due_of_no_available
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (S : SweepState G gh) (hno : ¬DueMoveAvailable S)
    (t : Vertex) (ht : t ∈ R) (hnot : t ∉ S.fired)
    (hdue : (S.runtime t ht hnot).responseDue) :
    (S.runtime t ht hnot).effective = ∅ := by
  apply Finset.not_nonempty_iff_eq_empty.mp
  intro hne
  exact hno ⟨⟨t, ht, hnot, hdue, hne⟩⟩

private theorem terminal_other_of_due
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (S : SweepState G gh)
    (t : Vertex) (ht : t ∈ R) (htnot : t ∉ S.fired)
    (htdue : (S.runtime t ht htnot).responseDue)
    (s : Vertex) (hs : s ∈ R) (hsnot : s ∉ S.fired)
    (hne : s ≠ t) (hsdue : (S.runtime s hs hsnot).responseDue) :
    (S.runtime s hs hsnot).effective = ∅ := by
  exact False.elim (hne (S.at_most_one_due hsdue htdue))

set_option maxHeartbeats 800000 in
noncomputable def dueSweepMove
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (S : SweepState G gh) (hb : 1 ≤ b)
    (hactor : actorAt D gp = some Actor.shortener)
    (havail : DueMoveAvailable S) : SweepMove G gh S := by
  let w := Classical.choice havail
  let t := w.t
  let ht := w.ht
  let hnot := w.hnot
  have hdue := w.due
  have hnonempty := w.nonempty
  let L := S.runtime t ht hnot
  change L.responseDue at hdue
  change L.effective.Nonempty at hnonempty
  let seed := Classical.choose hnonempty
  have hseed := Classical.choose_spec hnonempty
  have htpos := G.roots_pos ht
  cases hmode : L.mode with
  | responseDueFirst c =>
      have hpm := L.trace.local_phase_matches
      rw [hmode] at hpm
      let r := Classical.choose hpm
      have hphase := Classical.choose_spec hpm
      let cert := L.trace.buildFirstShortenerRun htpos hactor hphase hseed
      exact .inside t (t * cert.m) ht hnot
        (cone_mem_of_legal_multiple G ht cert.globalLegal) cert.globalLegal
        (RootLocalShortenerSuccessor.ofFirstDue L hmode hactor cert)
        (terminal_other_of_due S t ht hnot hdue)
  | responseDueLater c =>
      have hpm := L.trace.local_phase_matches
      rw [hmode] at hpm
      have hphase : L.localEnd.phase = Phase.regular Player.shortener :=
        hpm
      let cert := L.trace.buildDirectShortenerRun htpos hactor hphase hseed
      exact .inside t (t * cert.m) ht hnot
        (cone_mem_of_legal_multiple G ht cert.globalLegal) cert.globalLegal
        (RootLocalShortenerSuccessor.ofLaterDirect L hmode hactor cert)
        (terminal_other_of_due S t ht hnot hdue)
  | openingDormant => simp [RootLocal.responseDue, hmode, LocalMode.responseDue] at hdue
  | openingActive k => simp [RootLocal.responseDue, hmode, LocalMode.responseDue] at hdue
  | postDormant => simp [RootLocal.responseDue, hmode, LocalMode.responseDue] at hdue
  | waitingFirst c => simp [RootLocal.responseDue, hmode, LocalMode.responseDue] at hdue
  | running c => simp [RootLocal.responseDue, hmode, LocalMode.responseDue] at hdue
  | deadFirst c => simp [RootLocal.responseDue, hmode, LocalMode.responseDue] at hdue
  | deadLater c => simp [RootLocal.responseDue, hmode, LocalMode.responseDue] at hdue

set_option maxHeartbeats 800000 in
noncomputable def advanceSweepMove
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (S : SweepState G gh) (hb : 1 ≤ b)
    (hactor : actorAt D gp = some Actor.shortener)
    (hnoDue : ¬DueMoveAvailable S)
    (havail : AdvanceMoveAvailable S) : SweepMove G gh S := by
  let w := Classical.choice havail
  let t := w.t
  let ht := w.ht
  let hnot := w.hnot
  have hnonempty := w.nonempty
  have hmode := w.mode
  let L := S.runtime t ht hnot
  change L.effective.Nonempty at hnonempty
  change (∃ c, L.mode = .waitingFirst c) ∨
    (∃ c, L.mode = .running c) at hmode
  let seed := Classical.choose hnonempty
  have hseed := Classical.choose_spec hnonempty
  have htpos := G.roots_pos ht
  cases hc : L.mode with
  | waitingFirst c =>
      have hpm := L.trace.local_phase_matches
      rw [hc] at hpm
      let r := Classical.choose hpm
      have hphase := Classical.choose_spec hpm
      let cert := L.trace.buildFirstShortenerRun htpos hactor hphase hseed
      exact .inside t (t * cert.m) ht hnot
        (cone_mem_of_legal_multiple G ht cert.globalLegal) cert.globalLegal
        (RootLocalShortenerSuccessor.ofFirstWaiting L hc hactor cert)
        (fun s hs hsnot hne hsdue =>
          terminal_due_of_no_available S hnoDue s hs hsnot hsdue)
  | running c =>
      have hpm := L.trace.local_phase_matches
      rw [hc] at hpm
      have hphase : L.localEnd.phase = Phase.regular Player.prolonger :=
        hpm
      let cert := L.trace.buildAdvanceShortenerRun htpos hactor hphase hseed
      exact .inside t (t * cert.m) ht hnot
        (cone_mem_of_legal_multiple G ht cert.globalLegal) cert.globalLegal
        (RootLocalShortenerSuccessor.ofLaterAdvance L hc hactor cert)
        (fun s hs hsnot hne hsdue =>
          terminal_due_of_no_available S hnoDue s hs hsnot hsdue)
  | openingDormant => simp [hc] at hmode
  | openingActive k => simp [hc] at hmode
  | postDormant => simp [hc] at hmode
  | responseDueFirst c => simp [hc] at hmode
  | responseDueLater c => simp [hc] at hmode
  | deadFirst c => simp [hc] at hmode
  | deadLater c => simp [hc] at hmode

noncomputable def rootSweepMove
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (S : SweepState G gh)
    (hactor : actorAt D gp = some Actor.shortener)
    (hnoDue : ¬DueMoveAvailable S)
    (havail : RootSweepAvailable S) : SweepMove G gh S := by
  classical
  have hcand : rootSweepCandidates S ≠ ∅ :=
    Finset.nonempty_iff_ne_empty.mp havail
  have hnextNonempty : rootSweepRoot? S ≠ none := by
    rw [rootSweepRoot?, ne_eq, nextRoot?_eq_none_iff]
    exact hcand
  let hex := Option.ne_none_iff_exists.mp hnextNonempty
  let t := Classical.choose hex
  have hnext : rootSweepRoot? S = some t :=
    (Classical.choose_spec hex).symm
  have htCand : t ∈ rootSweepCandidates S :=
    nextRoot?_mem hnext
  have htCand' := htCand
  rw [rootSweepCandidates, Finset.mem_filter] at htCand'
  have ht : t ∈ R := htCand'.1
  have htLive : t ∈ liveLegal D gp.state :=
    htCand'.2.2
  exact .fire t ht htCand'.2.1 (G.root_select_legal ht hactor htLive)
    (fun s hs hsnot hsdue =>
      terminal_due_of_no_available S hnoDue s hs hsnot hsdue)
    (fun s hs => rootSweepRoot?_weight_ge S hnext hs)

/-- A live vertex in a root cone makes that cone's exact projected live set
nonempty. -/
theorem RootLocal.effective_nonempty_of_cone_live
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (S : SweepState G gh) {t x : Vertex}
    (ht : t ∈ R) (hnot : t ∉ S.fired)
    (hxLive : x ∈ liveLegal D gp.state) (hxCone : x ∈ rootCone N t) :
    (S.runtime t ht hnot).effective.Nonempty := by
  let L := S.runtime t ht hnot
  have htpos := G.roots_pos ht
  have hxData := rootCone_mem_iff.mp hxCone
  have hqpos : 1 ≤ x / t := by
    have : 0 < x / t := Nat.div_pos
      (Nat.le_of_dvd hxData.1 hxData.2.1) htpos
    exact this
  have hqle : x / t ≤ N / t := Nat.div_le_div_right hxData.2.2
  have hmul : t * (x / t) = x := Nat.mul_div_cancel' hxData.2.1
  have hqGlobal : x / t ∈ quotientLive D N t gp := by
    apply Finset.mem_filter.mpr
    exact ⟨Finset.mem_Icc.mpr ⟨hqpos, hqle⟩, by simpa [hmul] using hxLive⟩
  refine ⟨x / t, ?_⟩
  rw [RootLocal.effective, ← L.trace.live_corresponds]
  exact hqGlobal

set_option maxHeartbeats 800000 in
/-- If none of the three cone rules supplies a move, every legal Shortener
selection is outside every root cone and is therefore exceptional.  This is
the formal exceptional-only completeness clause requested by the referee. -/
theorem exceptional_of_no_cone_move
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (S : SweepState G gh) (hb : 1 ≤ b)
    (hactor : actorAt D gp = some Actor.shortener)
    (hnoDue : ¬DueMoveAvailable S)
    (hnoRoot : ¬RootSweepAvailable S)
    (hnoAdvance : ¬AdvanceMoveAvailable S)
    {x : Vertex} (ha : Action.select x ∈ legalActions D gp) :
    (∀ t ∈ R, x ∉ rootCone N t) ∧ x ∈ G.exceptional := by
  classical
  have hxLive := select_mem_liveLegal_of_legal ha
  have hout : ∀ t ∈ R, x ∉ rootCone N t := by
    intro t ht hxCone
    by_cases hfire : t ∈ S.fired
    · exact S.fired_cone_dead hfire hxCone hxLive
    · let L := S.runtime t ht hfire
      have heff : L.effective.Nonempty :=
        RootLocal.effective_nonempty_of_cone_live S ht hfire hxLive hxCone
      by_cases hactive : L.activated
      · cases hmode : L.mode with
        | openingDormant | postDormant =>
            simp [L, RootLocal.activated, hmode, LocalMode.tally?] at hactive
        | openingActive k =>
            have hop := L.trace.operationalBudget
            rw [hmode] at hop
            rcases hop with ⟨r, hphase, hbudget⟩
            exact (by
              have hsphase := global_phase_shortener hactor
              rw [hphase] at hsphase
              contradiction)
        | waitingFirst c =>
            exact hnoAdvance ⟨⟨t, ht, hfire, heff, Or.inl ⟨c, hmode⟩⟩⟩
        | responseDueFirst c =>
            exact hnoDue ⟨⟨t, ht, hfire, by
              simp [L, RootLocal.responseDue, hmode, LocalMode.responseDue], heff⟩⟩
        | running c =>
            exact hnoAdvance ⟨⟨t, ht, hfire, heff, Or.inr ⟨c, hmode⟩⟩⟩
        | responseDueLater c =>
            exact hnoDue ⟨⟨t, ht, hfire, by
              simp [L, RootLocal.responseDue, hmode, LocalMode.responseDue], heff⟩⟩
        | deadFirst c =>
            have hempty := L.trace.dead_effective_empty
              (Or.inl ⟨c, hmode⟩)
            have hLe : L.effective = ∅ := by
              simpa [L, RootLocal.effective] using hempty
            rw [hLe] at heff
            exact Finset.not_nonempty_empty heff
        | deadLater c =>
            have hempty := L.trace.dead_effective_empty
              (Or.inr ⟨c, hmode⟩)
            have hLe : L.effective = ∅ := by
              simpa [L, RootLocal.effective] using hempty
            rw [hLe] at heff
            exact Finset.not_nonempty_empty heff
      · have htLive := S.dormant_root_live_of_cone_live
          ht hfire hactive hxLive hxCone
        apply hnoRoot
        refine ⟨t, ?_⟩
        rw [rootSweepCandidates, Finset.mem_filter]
        exact ⟨ht, ⟨⟨ht, hfire, hactive⟩, htLive⟩⟩
  exact ⟨hout, G.outside_all_cones_mem_exceptional
    (Finset.mem_filter.mp hxLive).1 hout⟩

set_option maxHeartbeats 800000 in
/-- The referee's precedence order, encoded literally: due local response,
then a root sweep, then a pass-advance of a frozen active local game, then an
arbitrary legal exceptional vertex. -/
noncomputable def firstApplicableSweepMove
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (S : SweepState G gh) (hb : 1 ≤ b)
    (hactor : actorAt D gp = some Actor.shortener) : SweepMove G gh S := by
  classical
  by_cases hdue : DueMoveAvailable S
  · exact dueSweepMove S hb hactor hdue
  by_cases hroot : RootSweepAvailable S
  · exact rootSweepMove S hactor hdue hroot
  by_cases hadvance : AdvanceMoveAvailable S
  · exact advanceSweepMove S hb hactor hdue hadvance
  let chosen := optimalShortener gh hactor
  let hex := legal_action_at_shortener_is_select hactor chosen.2
  let x := Classical.choose hex
  have hx := Classical.choose_spec hex
  have hlegal : Action.select x ∈ legalActions D gp := by
    rw [← hx]
    exact chosen.2
  have hfallback :=
    exceptional_of_no_cone_move S hb hactor hdue hroot hadvance hlegal
  exact .exceptional x hfallback.2 hfallback.1 hlegal
    (fun s hs hsnot hsdue =>
      terminal_due_of_no_available S hdue s hs hsnot hsdue)

/-- The public action extracted from the total first-applicable certificate. -/
noncomputable def firstApplicableSweepAction
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (S : SweepState G gh) (hb : 1 ≤ b)
    (hactor : actorAt D gp = some Actor.shortener) :
    {a // a ∈ legalActions D gp} :=
  let m := firstApplicableSweepMove S hb hactor
  ⟨m.action, m.legal⟩

/-- The simultaneous successor computed by a certified Shortener decision.
The target cone uses the exact minimax run stored in `.inside`; every other
cone receives the selected vertex as an external quotient-upset disturbance.
Firing removes exactly its provenance root from the runtime family. -/
noncomputable def SweepMove.nextState
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {gp : Pos} {gh : History D (initialPos b) gp}
    {S : SweepState G gh} (m : SweepMove G gh S)
    (hactor : actorAt D gp = some Actor.shortener) :
    SweepState G (.snoc gh m.action m.legal) := by
  classical
  cases m with
  | inside t x ht htnot hx ha update terminalOther =>
      let runtime' := fun s (hs : s ∈ R) (hsnot : s ∉ S.fired) =>
        if hst : s = t then by
          subst s
          simpa only [Subsingleton.elim hs ht, Subsingleton.elim hsnot htnot]
            using update.next
        else
          (S.runtime s hs hsnot).afterExternalShortener
            (G.roots_pos hs) ha
            (not_dvd_of_other_cone G hs ht hst hx ha) hactor
            (terminalOther s hs hsnot hst)
      have hnone : ∀ s (hs : s ∈ R) (hsnot : s ∉ S.fired),
          ¬(runtime' s hs hsnot).responseDue := by
        intro s hs hsnot
        by_cases hst : s = t
        · subst s
          simpa only [runtime', dif_pos rfl, Subsingleton.elim hs ht,
            Subsingleton.elim hsnot htnot] using update.not_responseDue
        · simpa only [runtime', dif_neg hst] using
            (S.runtime s hs hsnot).afterExternalShortener_not_responseDue
              (G.roots_pos hs) ha
              (not_dvd_of_other_cone G hs ht hst hx ha) hactor
              (terminalOther s hs hsnot hst)
      apply SweepState.ofRuntime S.fired S.fired_subset runtime'
      · intro s u hsDue huDue
        rcases hsDue with ⟨hs, hsnot, hsDue⟩
        exact False.elim (hnone s hs hsnot hsDue)
      · intro s hs hsnot
        rw [rootActivated_snoc_select]
        simp [hactor]
        by_cases hst : s = t
        · subst s
          simpa only [runtime', dif_pos rfl, Subsingleton.elim hs ht,
              Subsingleton.elim hsnot htnot] using
            update.activated_iff.trans (S.activated_exact t ht htnot)
        · exact (by
            simpa only [runtime', dif_neg hst] using
              ((S.runtime s hs hsnot).afterExternalShortener_activated
                (G.roots_pos hs) ha
                (not_dvd_of_other_cone G hs ht hst hx ha) hactor
                (terminalOther s hs hsnot hst) |>.trans
                  (S.activated_exact s hs hsnot)))
      · intro s hs
        rw [rootActivated_snoc_select]
        simpa [hactor] using S.fired_not_activated s hs
      · intro s hs
        have hold := S.fired_selected s hs
        rw [step_select_state]
        simp [selectState, hold]

/- The maximizing transformer is placed after the root lookup definitions
below; this commented copy is retained only while the surrounding dependent
case split is being moved.  -/
/-
private theorem actor_prolonger_of_legal_select_not_shortener
    {D : Finset Vertex} {p : Pos} {x : Vertex}
    (ha : Action.select x ∈ legalActions D p)
    (hnotS : actorAt D p ≠ some Actor.shortener) :
    actorAt D p = some Actor.prolonger := by
  have hlive : liveLegal D p.state ≠ ∅ := by
    intro hempty
    unfold legalActions at ha
    rw [if_pos hempty] at ha
    simp at ha
  unfold legalActions at ha
  rw [if_neg hlive] at ha
  cases hstage : p.stage with
  | beforeErase => simp [hstage, erasureActions] at ha
  | actorAction =>
      cases hphase : p.phase with
      | opening r => simp [actorAt, hlive, hstage, hphase]
      | regular who =>
          cases who with
          | prolonger => simp [actorAt, hlive, hstage, hphase]
          | shortener =>
              exact False.elim (hnotS (by simp [actorAt, hlive, hstage, hphase]))

private theorem RootLocal.not_responseDue_at_prolonger
    {D : Finset Vertex} {N t b : ℕ}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (L : RootLocal (N := N) t gh)
    (hactor : actorAt D gp = some Actor.prolonger) :
    ¬L.responseDue := by
  intro hdue
  have hs := L.trace.responseDue_global_phase hdue
  have hp := phase_regular_prolonger_of_actor_nonopening hactor (by
    intro hopen
    rcases hopen with ⟨r, hr⟩
    simp [hs] at hr)
  simp [hs] at hp

private def RootLocal.castGlobalSelect
    {D : Finset Vertex} {N t b x y : ℕ}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (hxy : x = y)
    (hx : Action.select x ∈ legalActions D gp)
    (hy : Action.select y ∈ legalActions D gp)
    (L : RootLocal (N := N) t (.snoc gh (Action.select x) hx)) :
    RootLocal (N := N) t (.snoc gh (Action.select y) hy) := by
  subst y
  simpa only [Subsingleton.elim hx hy] using L

/-- Total deterministic successor for every legal non-Shortener action.
Erasures, passes, and the explicit opening end use their direct simultaneous
updates.  A Prolonger selection is projected into its unique root cone, if
one exists, and into external quotient-upset disturbances everywhere else. -/
noncomputable def SweepState.afterMaximizing
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (S : SweepState G gh) (hb : 1 ≤ b)
    (a : Action) (ha : a ∈ legalActions D gp)
    (hnotS : actorAt D gp ≠ some Actor.shortener) :
    SweepState G (.snoc gh a ha) := by
  classical
  cases a with
  | erase U => exact S.afterErase ha
  | pass => exact S.afterPass ha
  | endOpening => exact S.afterEndOpening ha
  | select x =>
      have hactor := actor_prolonger_of_legal_select_not_shortener ha hnotS
      exact match hroot : rootOfVertex? R N x with
      | none => by
          have hout : ∀ t ∈ R, x ∉ rootCone N t := by
            intro t ht hx
            have := G.rootOfVertex?_eq ht hx
            rw [hroot] at this
            contradiction
          let runtime' := fun t (ht : t ∈ R) (hnot : t ∉ S.fired) =>
            (S.runtime t ht hnot).afterExternalNonShortener
              (G.roots_pos ht) ha
              (not_dvd_of_outside_cones G ht (hout t ht) ha) hnotS
          have hnone : ∀ t (ht : t ∈ R) (hnot : t ∉ S.fired),
              ¬(runtime' t ht hnot).responseDue := by
            intro t ht hnot hdue
            have hold :=
              (S.runtime t ht hnot).afterExternalNonShortener_responseDue
                (G.roots_pos ht) ha
                (not_dvd_of_outside_cones G ht (hout t ht) ha) hnotS
            exact (S.runtime t ht hnot).not_responseDue_at_prolonger hactor
              (hold.mp hdue)
          apply SweepState.ofRuntime S.fired S.fired_subset runtime'
          · intro s t hs ht
            rcases hs with ⟨hsR, hsnot, hsdue⟩
            exact False.elim (hnone s hsR hsnot hsdue)
          · intro t ht hnot
            rw [rootActivated_snoc_select]
            simp [hactor, hout t ht]
            exact (S.runtime t ht hnot).afterExternalNonShortener_activated
              (G.roots_pos ht) ha
              (not_dvd_of_outside_cones G ht (hout t ht) ha) hnotS |>.trans
                (S.activated_exact t ht hnot)
          · intro t ht
            rw [rootActivated_snoc_select]
            simp [hactor, hout t (S.fired_subset ht), S.fired_not_activated t ht]
          · intro t ht
            have hold := S.fired_selected t ht
            rw [step_select_state]
            simp [selectState, hold]
      | some t => by
          have htData := rootOfVertex?_mem hroot
          have ht : t ∈ R := htData.1
          have hx : x ∈ rootCone N t := htData.2
          have htnot : t ∉ S.fired := by
            intro hfire
            exact S.fired_cone_dead hfire hx (select_mem_liveLegal_of_legal ha)
          let m := x / t
          have hmul : t * m = x := Nat.mul_div_cancel' (rootCone_mem_iff.mp hx).2.1
          subst x
          have ha' : Action.select (t * m) ∈ legalActions D gp := by
            exact ha
          let L := S.runtime t ht htnot
          have hready : LocalCanAcceptProlonger L.mode :=
            L.canAcceptProlonger_of_inside G.downset (G.roots_pos ht) ha' hactor
          let target := L.afterInsideProlonger G.downset (G.roots_pos ht) hb
            ha' hactor hready
          let runtime' := fun s (hs : s ∈ R) (hsnot : s ∉ S.fired) =>
            if hst : s = t then by
              subst s
              simpa only [Subsingleton.elim hs ht, Subsingleton.elim hsnot htnot,
                Subsingleton.elim ha' ha] using target
            else
              (S.runtime s hs hsnot).afterExternalNonShortener
                (G.roots_pos hs) ha
                (not_dvd_of_other_cone G hs ht hst hx ha) hnotS
          apply SweepState.ofRuntime S.fired S.fired_subset runtime'
          · intro s u hsDue huDue
            rcases hsDue with ⟨hs, hsnot, hsdue⟩
            rcases huDue with ⟨hu, hunot, hudue⟩
            by_cases hst : s = t
            · by_cases hut : u = t
              · exact hst.trans hut.symm
              · have hold :=
                  (S.runtime u hu hunot).afterExternalNonShortener_responseDue
                    (G.roots_pos hu) ha
                    (not_dvd_of_other_cone G hu ht hut hx ha) hnotS
                exact False.elim
                  ((S.runtime u hu hunot).not_responseDue_at_prolonger hactor
                    (hold.mp (by simpa [runtime', hut] using hudue)))
            · have hold :=
                (S.runtime s hs hsnot).afterExternalNonShortener_responseDue
                  (G.roots_pos hs) ha
                  (not_dvd_of_other_cone G hs ht hst hx ha) hnotS
              exact False.elim
                ((S.runtime s hs hsnot).not_responseDue_at_prolonger hactor
                  (hold.mp (by simpa [runtime', hst] using hsdue)))
          · intro s hs hsnot
            rw [rootActivated_snoc_select]
            simp only [hactor, true_and]
            by_cases hst : s = t
            · subst s
              have hnew := L.afterInsideProlonger_activated G.downset
                (G.roots_pos ht) hb ha' hactor hready
              simpa [runtime', target, L] using hnew
            · have hxout : t * m ∉ rootCone N s := by
                intro hxs
                exact hst (G.root_eq_of_mem_cones hs ht hxs hx)
              have hact :=
                (S.runtime s hs hsnot).afterExternalNonShortener_activated
                  (G.roots_pos hs) ha
                  (not_dvd_of_other_cone G hs ht hst hx ha) hnotS |>.trans
                    (S.activated_exact s hs hsnot)
              have hact' : (runtime' s hs hsnot).activated ↔
                  RootActivated (N := N) gh s := by
                simpa [runtime', hst] using hact
              simpa [hxout] using hact'
          · intro s hs
            rw [rootActivated_snoc_select]
            have hsR := S.fired_subset hs
            have hxout : t * m ∉ rootCone N s := by
              intro hxs
              exact S.fired_cone_dead hs hxs (select_mem_liveLegal_of_legal ha)
            simp [hactor, hxout, S.fired_not_activated s hs]
          · intro s hs
            have hold := S.fired_selected s hs
            rw [step_select_state]
            simp [selectState, hold]
-/
  | fire t ht hunprocessed ha terminalAll dominates =>
      let fired' := insert t S.fired
      let runtime' := fun s (hs : s ∈ R) (hsnot : s ∉ fired') =>
        let hpair : s ≠ t ∧ s ∉ S.fired := by simpa [fired'] using hsnot
        let hsnotOld : s ∉ S.fired := hpair.2
        let hst : s ≠ t := hpair.1
        (S.runtime s hs hsnotOld).afterExternalShortener
          (G.roots_pos hs) ha
          (not_dvd_of_other_cone G hs ht hst (G.root_mem_cone ht) ha)
          hactor (terminalAll s hs hsnotOld)
      have hnone : ∀ s (hs : s ∈ R) (hsnot : s ∉ fired'),
          ¬(runtime' s hs hsnot).responseDue := by
        intro s hs hsnot
        let hpair : s ≠ t ∧ s ∉ S.fired := by simpa [fired'] using hsnot
        let hsnotOld : s ∉ S.fired := hpair.2
        let hst : s ≠ t := hpair.1
        exact (S.runtime s hs hsnotOld).afterExternalShortener_not_responseDue
          (G.roots_pos hs) ha
          (not_dvd_of_other_cone G hs ht hst (G.root_mem_cone ht) ha)
          hactor (terminalAll s hs hsnotOld)
      have hfiredSubset : fired' ⊆ R := by
        intro s hs
        rcases Finset.mem_insert.mp hs with rfl | hsOld
        · exact ht
        · exact S.fired_subset hsOld
      apply SweepState.ofRuntime fired' hfiredSubset runtime'
      · intro s u hsDue huDue
        rcases hsDue with ⟨hs, hsnot, hsDue⟩
        exact False.elim (hnone s hs hsnot hsDue)
      · intro s hs hsnot
        let hpair : s ≠ t ∧ s ∉ S.fired := by simpa [fired'] using hsnot
        let hsnotOld : s ∉ S.fired := hpair.2
        let hst : s ≠ t := hpair.1
        rw [rootActivated_snoc_select]
        simp [hactor]
        exact (S.runtime s hs hsnotOld).afterExternalShortener_activated
          (G.roots_pos hs) ha
          (not_dvd_of_other_cone G hs ht hst (G.root_mem_cone ht) ha)
          hactor (terminalAll s hs hsnotOld) |>.trans
            (S.activated_exact s hs hsnotOld)
      · intro s hs
        rw [rootActivated_snoc_select]
        simp [hactor]
        rcases Finset.mem_insert.mp hs with rfl | hsOld
        · exact (S.unprocessed_iff_history.mp hunprocessed).2.1
        · exact S.fired_not_activated s hsOld
      · intro s hs
        rcases Finset.mem_insert.mp hs with rfl | hsOld
        · rw [step_select_state]
          simp [selectState]
        · have hold := S.fired_selected s hsOld
          rw [step_select_state]
          simp [selectState, hold]
  | exceptional x hx hout ha terminalAll =>
      let runtime' := fun s (hs : s ∈ R) (hsnot : s ∉ S.fired) =>
        (S.runtime s hs hsnot).afterExternalShortener
          (G.roots_pos hs) ha
          (not_dvd_of_outside_cones G hs (hout s hs) ha) hactor
          (terminalAll s hs hsnot)
      have hnone : ∀ s (hs : s ∈ R) (hsnot : s ∉ S.fired),
          ¬(runtime' s hs hsnot).responseDue := by
        intro s hs hsnot
        exact (S.runtime s hs hsnot).afterExternalShortener_not_responseDue
          (G.roots_pos hs) ha
          (not_dvd_of_outside_cones G hs (hout s hs) ha) hactor
          (terminalAll s hs hsnot)
      apply SweepState.ofRuntime S.fired S.fired_subset runtime'
      · intro s u hsDue huDue
        rcases hsDue with ⟨hs, hsnot, hsDue⟩
        exact False.elim (hnone s hs hsnot hsDue)
      · intro s hs hsnot
        rw [rootActivated_snoc_select]
        simp [hactor]
        exact (S.runtime s hs hsnot).afterExternalShortener_activated
          (G.roots_pos hs) ha
          (not_dvd_of_outside_cones G hs (hout s hs) ha) hactor
          (terminalAll s hs hsnot) |>.trans (S.activated_exact s hs hsnot)
      · intro s hs
        rw [rootActivated_snoc_select]
        simpa [hactor] using S.fired_not_activated s hs
      · intro s hs
        have hold := S.fired_selected s hs
        rw [step_select_state]
        simp [selectState, hold]

/-! ## Chronological activation and firing logs -/

/-- The unique root cone containing a vertex, returned in the same fixed
numeric order used by the sweep. -/
def rootOfVertex? (R : Finset Vertex) (N x : ℕ) : Option Vertex :=
  nextRoot? (R.filter fun t => x ∈ rootCone N t)

theorem rootOfVertex?_mem
    {R : Finset Vertex} {N x t : ℕ}
    (hroot : rootOfVertex? R N x = some t) :
    t ∈ R ∧ x ∈ rootCone N t := by
  have ht := nextRoot?_mem hroot
  exact Finset.mem_filter.mp ht

theorem SweepGeometry.rootOfVertex?_eq
    {D R : Finset Vertex} {N x t : ℕ}
    (G : SweepGeometry D R N) (ht : t ∈ R) (hx : x ∈ rootCone N t) :
    rootOfVertex? R N x = some t := by
  have hnonempty : (R.filter fun s => x ∈ rootCone N s).Nonempty :=
    ⟨t, Finset.mem_filter.mpr ⟨ht, hx⟩⟩
  have hne : nextRoot? (R.filter fun s => x ∈ rootCone N s) ≠ none := by
    rw [ne_eq, nextRoot?_eq_none_iff]
    exact Finset.nonempty_iff_ne_empty.mp hnonempty
  rcases Option.ne_none_iff_exists.mp hne with ⟨s, hs⟩
  have hsData := rootOfVertex?_mem (R := R) (N := N) (x := x) hs.symm
  have hst := G.root_eq_of_mem_cones hsData.1 ht hsData.2 hx
  simpa [rootOfVertex?, hst] using hs.symm

private theorem actor_prolonger_of_legal_select_not_shortener
    {D : Finset Vertex} {p : Pos} {x : Vertex}
    (ha : Action.select x ∈ legalActions D p)
    (hnotS : actorAt D p ≠ some Actor.shortener) :
    actorAt D p = some Actor.prolonger := by
  have hlive : liveLegal D p.state ≠ ∅ := by
    intro hempty
    unfold legalActions at ha
    rw [if_pos hempty] at ha
    simp at ha
  unfold legalActions at ha
  rw [if_neg hlive] at ha
  cases hstage : p.stage with
  | beforeErase => simp [hstage, erasureActions] at ha
  | actorAction =>
      cases hphase : p.phase with
      | opening r => simp [actorAt, hlive, hstage, hphase]
      | regular who =>
          cases who with
          | prolonger => simp [actorAt, hlive, hstage, hphase]
          | shortener =>
              exact False.elim (hnotS (by simp [actorAt, hlive, hstage, hphase]))

private theorem RootLocal.not_responseDue_at_prolonger
    {D : Finset Vertex} {N t b : ℕ}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (L : RootLocal (N := N) t gh)
    (hactor : actorAt D gp = some Actor.prolonger) :
    ¬L.responseDue := by
  intro hdue
  have hs := L.trace.responseDue_global_phase hdue
  have hp := phase_regular_prolonger_of_actor_nonopening hactor (by
    intro hopen
    rcases hopen with ⟨r, hr⟩
    simp [hs] at hr)
  simp [hs] at hp

private def RootLocal.castGlobalSelectActive
    {D : Finset Vertex} {N t b x y : ℕ}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (hxy : x = y)
    (hx : Action.select x ∈ legalActions D gp)
    (hy : Action.select y ∈ legalActions D gp)
    (L : RootLocal (N := N) t (.snoc gh (Action.select x) hx)) :
    RootLocal (N := N) t (.snoc gh (Action.select y) hy) := by
  subst y
  simpa only [Subsingleton.elim hx hy] using L

private theorem RootLocal.castGlobalSelectActive_activated
    {D : Finset Vertex} {N t b x y : ℕ}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (hxy : x = y)
    (hx : Action.select x ∈ legalActions D gp)
    (hy : Action.select y ∈ legalActions D gp)
    (L : RootLocal (N := N) t (.snoc gh (Action.select x) hx)) :
    (RootLocal.castGlobalSelectActive hxy hx hy L).activated ↔ L.activated := by
  subst y
  simp [RootLocal.castGlobalSelectActive]

private theorem RootLocal.castGlobalSelectActive_responseDue
    {D : Finset Vertex} {N t b x y : ℕ}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (hxy : x = y)
    (hx : Action.select x ∈ legalActions D gp)
    (hy : Action.select y ∈ legalActions D gp)
    (L : RootLocal (N := N) t (.snoc gh (Action.select x) hx)) :
    (RootLocal.castGlobalSelectActive hxy hx hy L).responseDue ↔
      L.responseDue := by
  subst y
  simp [RootLocal.castGlobalSelectActive]

/-- The exact simultaneous successor for a Prolonger selection lying in the
unique cone returned by `rootOfVertex?`. -/
noncomputable def SweepState.afterMaximizingInside
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (S : SweepState G gh) (hb : 1 ≤ b) {x t : Vertex}
    (ha : Action.select x ∈ legalActions D gp)
    (hnotS : actorAt D gp ≠ some Actor.shortener)
    (hroot : rootOfVertex? R N x = some t) :
    SweepState G (.snoc gh (Action.select x) ha) := by
  classical
  have hactor := actor_prolonger_of_legal_select_not_shortener ha hnotS
  have htData := rootOfVertex?_mem hroot
  have ht : t ∈ R := htData.1
  have hx : x ∈ rootCone N t := htData.2
  have htnot : t ∉ S.fired := by
    intro hfire
    exact S.fired_cone_dead hfire hx (select_mem_liveLegal_of_legal ha)
  let m := x / t
  have hmul : t * m = x := Nat.mul_div_cancel' (rootCone_mem_iff.mp hx).2.1
  have ha' : Action.select (t * m) ∈ legalActions D gp := by
    simpa [hmul] using ha
  let L := S.runtime t ht htnot
  have hready : LocalCanAcceptProlonger L.mode :=
    L.canAcceptProlonger_of_inside G.downset (G.roots_pos ht) ha' hactor
  let target := L.afterInsideProlonger G.downset (G.roots_pos ht) hb
    ha' hactor hready
  let target' : RootLocal (N := N) t (.snoc gh (Action.select x) ha) :=
    RootLocal.castGlobalSelectActive hmul ha' ha target
  let runtime' := fun s (hs : s ∈ R) (hsnot : s ∉ S.fired) =>
    if hst : s = t then by
      subst s
      simpa only [Subsingleton.elim hs ht, Subsingleton.elim hsnot htnot]
        using target'
    else
      (S.runtime s hs hsnot).afterExternalNonShortener
        (G.roots_pos hs) ha
        (not_dvd_of_other_cone G hs ht hst hx ha) hnotS
  apply SweepState.ofRuntime S.fired S.fired_subset runtime'
  · intro s u hsDue huDue
    rcases hsDue with ⟨hs, hsnot, hsdue⟩
    rcases huDue with ⟨hu, hunot, hudue⟩
    by_cases hst : s = t
    · by_cases hut : u = t
      · exact hst.trans hut.symm
      · have hold :=
          (S.runtime u hu hunot).afterExternalNonShortener_responseDue
            (G.roots_pos hu) ha
            (not_dvd_of_other_cone G hu ht hut hx ha) hnotS
        exact False.elim
          ((S.runtime u hu hunot).not_responseDue_at_prolonger hactor
            (hold.mp (by simpa [runtime', hut] using hudue)))
    · have hold :=
        (S.runtime s hs hsnot).afterExternalNonShortener_responseDue
          (G.roots_pos hs) ha
          (not_dvd_of_other_cone G hs ht hst hx ha) hnotS
      exact False.elim
        ((S.runtime s hs hsnot).not_responseDue_at_prolonger hactor
          (hold.mp (by simpa [runtime', hst] using hsdue)))
  · intro s hs hsnot
    rw [rootActivated_snoc_select]
    simp only [hactor, true_and]
    by_cases hst : s = t
    · subst s
      have hnew := L.afterInsideProlonger_activated G.downset
        (G.roots_pos ht) hb ha' hactor hready
      have hnew' : target'.activated :=
        (RootLocal.castGlobalSelectActive_activated hmul ha' ha target).2 hnew
      have hrun : (runtime' t ht htnot).activated := by
        simpa [runtime'] using hnew'
      constructor
      · intro _
        exact Or.inr hx
      · intro _
        exact hrun
    · have hxout : x ∉ rootCone N s := by
        intro hxs
        exact hst (G.root_eq_of_mem_cones hs ht hxs hx)
      have hact :=
        (S.runtime s hs hsnot).afterExternalNonShortener_activated
          (G.roots_pos hs) ha
          (not_dvd_of_other_cone G hs ht hst hx ha) hnotS |>.trans
            (S.activated_exact s hs hsnot)
      have hact' : (runtime' s hs hsnot).activated ↔
          RootActivated (N := N) gh s := by
        simpa [runtime', hst] using hact
      simpa [hxout] using hact'
  · intro s hs
    rw [rootActivated_snoc_select]
    have hxout : x ∉ rootCone N s := by
      intro hxs
      exact S.fired_cone_dead hs hxs (select_mem_liveLegal_of_legal ha)
    simp [hactor, hxout, S.fired_not_activated s hs]
  · intro s hs
    have hold := S.fired_selected s hs
    rw [step_select_state]
    simp [selectState, hold]

/-- Case analysis which preserves the equation used by the selected branch. -/
private def optionCasesWithEq {α β : Type} (o : Option α)
    (onNone : o = none → β) (onSome : ∀ a, o = some a → β) : β := by
  cases h : o with
  | none => exact onNone h
  | some a => exact onSome a h

private theorem optionCasesWithEq_some {α β : Type} {o : Option α}
    (onNone : o = none → β) (onSome : ∀ a, o = some a → β)
    {a : α} (h : o = some a) :
    optionCasesWithEq o onNone onSome = onSome a h := by
  subst o
  simp [optionCasesWithEq]

/-- Total deterministic successor for every legal non-Shortener action. -/
noncomputable def SweepState.afterMaximizing
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (S : SweepState G gh) (hb : 1 ≤ b)
    (a : Action) (ha : a ∈ legalActions D gp)
    (hnotS : actorAt D gp ≠ some Actor.shortener) :
    SweepState G (.snoc gh a ha) := by
  classical
  cases a with
  | erase U => exact S.afterErase ha
  | pass => exact S.afterPass ha
  | endOpening => exact S.afterEndOpening ha
  | select x =>
      exact optionCasesWithEq (rootOfVertex? R N x)
        (fun hroot => by
          have hactor := actor_prolonger_of_legal_select_not_shortener ha hnotS
          have hout : ∀ t ∈ R, x ∉ rootCone N t := by
            intro t ht hx
            have heq := G.rootOfVertex?_eq ht hx
            rw [hroot] at heq
            contradiction
          let runtime' := fun t (ht : t ∈ R) (hnot : t ∉ S.fired) =>
            (S.runtime t ht hnot).afterExternalNonShortener
              (G.roots_pos ht) ha
              (not_dvd_of_outside_cones G ht (hout t ht) ha) hnotS
          have hnone : ∀ t (ht : t ∈ R) (hnot : t ∉ S.fired),
              ¬(runtime' t ht hnot).responseDue := by
            intro t ht hnot hdue
            have hold :=
              (S.runtime t ht hnot).afterExternalNonShortener_responseDue
                (G.roots_pos ht) ha
                (not_dvd_of_outside_cones G ht (hout t ht) ha) hnotS
            exact (S.runtime t ht hnot).not_responseDue_at_prolonger hactor
              (hold.mp hdue)
          apply SweepState.ofRuntime S.fired S.fired_subset runtime'
          · intro s t hs ht
            rcases hs with ⟨hsR, hsnot, hsdue⟩
            exact False.elim (hnone s hsR hsnot hsdue)
          · intro t ht hnot
            rw [rootActivated_snoc_select]
            simp [hactor, hout t ht]
            exact (S.runtime t ht hnot).afterExternalNonShortener_activated
              (G.roots_pos ht) ha
              (not_dvd_of_outside_cones G ht (hout t ht) ha) hnotS |>.trans
                (S.activated_exact t ht hnot)
          · intro t ht
            rw [rootActivated_snoc_select]
            simp [hactor, hout t (S.fired_subset ht),
              S.fired_not_activated t ht]
          · intro t ht
            have hold := S.fired_selected t ht
            rw [step_select_state]
            simp [selectState, hold]
        )
        (fun t hroot => by
          exact S.afterMaximizingInside hb ha hnotS hroot
          /-
          have htData := rootOfVertex?_mem hroot
          have ht : t ∈ R := htData.1
          have hx : x ∈ rootCone N t := htData.2
          have htnot : t ∉ S.fired := by
            intro hfire
            exact S.fired_cone_dead hfire hx (select_mem_liveLegal_of_legal ha)
          let m := x / t
          have hmul : t * m = x := Nat.mul_div_cancel' (rootCone_mem_iff.mp hx).2.1
          have ha' : Action.select (t * m) ∈ legalActions D gp := by
            simpa [hmul] using ha
          let L := S.runtime t ht htnot
          have hready : LocalCanAcceptProlonger L.mode :=
            L.canAcceptProlonger_of_inside G.downset (G.roots_pos ht) ha' hactor
          let target := L.afterInsideProlonger G.downset (G.roots_pos ht) hb
            ha' hactor hready
          let target' : RootLocal (N := N) t (.snoc gh (Action.select x) ha) :=
            RootLocal.castGlobalSelectActive hmul ha' ha target
          let runtime' := fun s (hs : s ∈ R) (hsnot : s ∉ S.fired) =>
            if hst : s = t then by
              subst s
              simpa only [Subsingleton.elim hs ht, Subsingleton.elim hsnot htnot]
                using target'
            else
              (S.runtime s hs hsnot).afterExternalNonShortener
                (G.roots_pos hs) ha
                (not_dvd_of_other_cone G hs ht hst hx ha) hnotS
          apply SweepState.ofRuntime S.fired S.fired_subset runtime'
          · intro s u hsDue huDue
            rcases hsDue with ⟨hs, hsnot, hsdue⟩
            rcases huDue with ⟨hu, hunot, hudue⟩
            by_cases hst : s = t
            · by_cases hut : u = t
              · exact hst.trans hut.symm
              · have hold :=
                  (S.runtime u hu hunot).afterExternalNonShortener_responseDue
                    (G.roots_pos hu) ha
                    (not_dvd_of_other_cone G hu ht hut hx ha) hnotS
                exact False.elim
                  ((S.runtime u hu hunot).not_responseDue_at_prolonger hactor
                    (hold.mp (by simpa [runtime', hut] using hudue)))
            · have hold :=
                (S.runtime s hs hsnot).afterExternalNonShortener_responseDue
                  (G.roots_pos hs) ha
                  (not_dvd_of_other_cone G hs ht hst hx ha) hnotS
              exact False.elim
                ((S.runtime s hs hsnot).not_responseDue_at_prolonger hactor
                  (hold.mp (by simpa [runtime', hst] using hsdue)))
          · intro s hs hsnot
            rw [rootActivated_snoc_select]
            simp only [hactor, true_and]
            by_cases hst : s = t
            · subst s
              have hnew := L.afterInsideProlonger_activated G.downset
                (G.roots_pos ht) hb ha' hactor hready
              have hnew' : target'.activated :=
                (RootLocal.castGlobalSelectActive_activated hmul ha' ha target).2 hnew
              have hrun : (runtime' t ht htnot).activated := by
                simpa [runtime'] using hnew'
              constructor
              · intro _
                exact Or.inr hx
              · intro _
                exact hrun
            · have hxout : x ∉ rootCone N s := by
                intro hxs
                exact hst (G.root_eq_of_mem_cones hs ht hxs hx)
              have hact :=
                (S.runtime s hs hsnot).afterExternalNonShortener_activated
                  (G.roots_pos hs) ha
                  (not_dvd_of_other_cone G hs ht hst hx ha) hnotS |>.trans
                    (S.activated_exact s hs hsnot)
              have hact' : (runtime' s hs hsnot).activated ↔
                  RootActivated (N := N) gh s := by
                simpa [runtime', hst] using hact
              simpa [hxout] using hact'
          · intro s hs
            rw [rootActivated_snoc_select]
            have hxout : x ∉ rootCone N s := by
              intro hxs
              exact S.fired_cone_dead hs hxs (select_mem_liveLegal_of_legal ha)
            simp [hactor, hxout, S.fired_not_activated s hs]
          · intro s hs
            have hold := S.fired_selected s hs
            rw [step_select_state]
            simp [selectState, hold]
          -/
        )

/-- A Prolonger selection which first activates its root cone creates a
waiting local game.  Consequently the exact simultaneous maximizing
successor has no actionable response-due cone. -/
theorem SweepState.afterMaximizingInside_fresh_activation_noDue
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (S : SweepState G gh) (hb : 1 ≤ b) {x t : Vertex}
    (ha : Action.select x ∈ legalActions D gp)
    (hnotS : actorAt D gp ≠ some Actor.shortener)
    (hroot : rootOfVertex? R N x = some t)
    (hfresh : ¬RootActivated (N := N) gh t) :
    ¬DueMoveAvailable
      (S.afterMaximizingInside hb ha hnotS hroot) := by
  classical
  have hactor := actor_prolonger_of_legal_select_not_shortener ha hnotS
  have htData := rootOfVertex?_mem hroot
  have ht : t ∈ R := htData.1
  have hx : x ∈ rootCone N t := htData.2
  have htnot : t ∉ S.fired := by
    intro hfire
    exact S.fired_cone_dead hfire hx (select_mem_liveLegal_of_legal ha)
  let m := x / t
  have hmul : t * m = x := Nat.mul_div_cancel' (rootCone_mem_iff.mp hx).2.1
  have ha' : Action.select (t * m) ∈ legalActions D gp := by
    simpa [hmul] using ha
  let L := S.runtime t ht htnot
  have hready : LocalCanAcceptProlonger L.mode :=
    L.canAcceptProlonger_of_inside G.downset (G.roots_pos ht) ha' hactor
  let target := L.afterInsideProlonger G.downset (G.roots_pos ht) hb
    ha' hactor hready
  let target' : RootLocal (N := N) t (.snoc gh (Action.select x) ha) :=
    RootLocal.castGlobalSelectActive hmul ha' ha target
  let runtime' := fun s (hs : s ∈ R) (hsnot : s ∉ S.fired) =>
    if hst : s = t then by
      subst s
      simpa only [Subsingleton.elim hs ht, Subsingleton.elim hsnot htnot]
        using target'
    else
      (S.runtime s hs hsnot).afterExternalNonShortener
        (G.roots_pos hs) ha
        (not_dvd_of_other_cone G hs ht hst hx ha) hnotS
  have hLinactive : ¬L.activated :=
    (S.activated_exact t ht htnot).not.mpr hfresh
  have htarget : ¬target.responseDue :=
    L.afterInsideProlonger_not_responseDue_of_inactive G.downset
      (G.roots_pos ht) hb ha' hactor hready hLinactive
  have htarget' : ¬target'.responseDue := by
    intro hdue
    exact htarget
      ((RootLocal.castGlobalSelectActive_responseDue hmul ha' ha target).mp hdue)
  intro havail
  unfold SweepState.afterMaximizingInside at havail
  rcases havail with ⟨w⟩
  rcases w with ⟨s, hs, hsnot, hsdue, hnonempty⟩
  simp only [SweepState.ofRuntime] at hsdue
  by_cases hst : s = t
  · subst s
    have htt : t = t := Eq.refl t
    simp only [dif_pos htt] at hsdue
    change target'.responseDue at hsdue
    exact htarget' hsdue
  · have hxout : x ∉ rootCone N s := by
      intro hxs
      exact hst (G.root_eq_of_mem_cones hs ht hxs hx)
    have hold :=
      (S.runtime s hs hsnot).afterExternalNonShortener_responseDue
        (G.roots_pos hs) ha
        (not_dvd_of_other_cone G hs ht hst hx ha) hnotS
    exact (S.runtime s hs hsnot).not_responseDue_at_prolonger hactor
      (hold.mp (by simpa only [dif_neg hst] using hsdue))

/-- Public formulation for the total maximizing transformer. -/
theorem SweepState.afterMaximizing_fresh_activation_noDue
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (S : SweepState G gh) (hb : 1 ≤ b) {x t : Vertex}
    (ha : Action.select x ∈ legalActions D gp)
    (hnotS : actorAt D gp ≠ some Actor.shortener)
    (hroot : rootOfVertex? R N x = some t)
    (hfresh : ¬RootActivated (N := N) gh t) :
    ¬DueMoveAvailable
      (S.afterMaximizing hb (Action.select x) ha hnotS) := by
  have hstate :
      S.afterMaximizing hb (Action.select x) ha hnotS =
        S.afterMaximizingInside hb ha hnotS hroot := by
    rw [SweepState.afterMaximizing]
    dsimp only [Action.casesOn]
    exact optionCasesWithEq_some _ _ hroot
  rw [hstate]
  exact S.afterMaximizingInside_fresh_activation_noDue hb ha hnotS hroot hfresh

/-- Raw-history chronology.  Activations are recoverable from the public
history alone.  A root-valued Shortener selection is recorded separately,
but is deliberately *not* called a firing: it may have arisen from an inside
local move with quotient `1`.  Actual firings require replay provenance from
the `SweepMove.fire` constructor. -/
structure SweepLogs where
  opening : List Vertex
  post : List Vertex
  shortenerRootSelections : List Vertex
deriving DecidableEq, Repr

def SweepLogs.activated (L : SweepLogs) : List Vertex :=
  L.opening ++ L.post

def SweepLogs.recordActivation (L : SweepLogs) (phase : Phase)
    (t : Vertex) : SweepLogs :=
  if t ∈ L.activated then L else
    match phase with
    | .opening _ => { L with opening := L.opening ++ [t] }
    | .regular _ => { L with post := L.post ++ [t] }

def SweepLogs.recordShortenerRootSelection
    (L : SweepLogs) (t : Vertex) : SweepLogs :=
  if t ∈ L.shortenerRootSelections then L
  else { L with shortenerRootSelections := L.shortenerRootSelections ++ [t] }

/-- Scan the concrete indexed public history.  Actor labels and opening/post
classification are read at the exact pre-action endpoint of each `snoc`.
-/
noncomputable def History.sweepLogs
    {D R : Finset Vertex} {N b : ℕ} (G : SweepGeometry D R N) :
    {p : Pos} → History D (initialPos b) p → SweepLogs
  | _, .root => ⟨[], [], []⟩
  | _, @History.snoc _ _ q h a ha =>
      let L := h.sweepLogs G
      match actorAt D q, a with
      | some Actor.prolonger, Action.select x =>
          match rootOfVertex? R N x with
          | some t => L.recordActivation q.phase t
          | none => L
      | some Actor.shortener, Action.select x =>
          if x ∈ R then L.recordShortenerRootSelection x else L
      | _, _ => L

def History.openingActivationRoots
    {D R : Finset Vertex} {N b : ℕ} (G : SweepGeometry D R N)
    {p : Pos} (gh : History D (initialPos b) p) : List Vertex :=
  (gh.sweepLogs G).opening

def History.postActivationRoots
    {D R : Finset Vertex} {N b : ℕ} (G : SweepGeometry D R N)
    {p : Pos} (gh : History D (initialPos b) p) : List Vertex :=
  (gh.sweepLogs G).post

def History.shortenerRootSelections
    {D R : Finset Vertex} {N b : ℕ} (G : SweepGeometry D R N)
    {p : Pos} (gh : History D (initialPos b) p) : List Vertex :=
  (gh.sweepLogs G).shortenerRootSelections

@[simp] theorem SweepLogs.mem_activated_recordActivation
    (L : SweepLogs) (phase : Phase) (s t : Vertex) :
    s ∈ (L.recordActivation phase t).activated ↔
      s ∈ L.activated ∨ s = t := by
  classical
  by_cases ht : t ∈ L.activated
  · rw [SweepLogs.recordActivation.eq_def, if_pos ht]
    constructor
    · exact Or.inl
    · intro h
      rcases h with hs | rfl
      · exact hs
      · exact ht
  · have ht' : ¬(t ∈ L.opening ∨ t ∈ L.post) := by
      simpa [SweepLogs.activated] using ht
    cases phase <;>
      simp [SweepLogs.recordActivation, SweepLogs.activated, ht, ht',
        List.mem_append, or_assoc, or_left_comm, or_comm]

@[simp] theorem SweepLogs.mem_shortenerRoots_recordShortenerRootSelection
    (L : SweepLogs) (s t : Vertex) :
    s ∈ (L.recordShortenerRootSelection t).shortenerRootSelections ↔
      s ∈ L.shortenerRootSelections ∨ s = t := by
  classical
  by_cases ht : t ∈ L.shortenerRootSelections
  · rw [SweepLogs.recordShortenerRootSelection, if_pos ht]
    constructor
    · exact Or.inl
    · intro h
      rcases h with hs | rfl
      · exact hs
      · exact ht
  · simp [SweepLogs.recordShortenerRootSelection, ht]

theorem SweepLogs.recordActivation_mem_roots
    {R : Finset Vertex} (L : SweepLogs) (phase : Phase) (t : Vertex)
    (hL : (∀ x ∈ L.opening, x ∈ R) ∧
      (∀ x ∈ L.post, x ∈ R) ∧
        (∀ x ∈ L.shortenerRootSelections, x ∈ R))
    (ht : t ∈ R) :
    (∀ x ∈ (L.recordActivation phase t).opening, x ∈ R) ∧
      (∀ x ∈ (L.recordActivation phase t).post, x ∈ R) ∧
      (∀ x ∈ (L.recordActivation phase t).shortenerRootSelections, x ∈ R) := by
  classical
  by_cases hseen : t ∈ L.activated
  · simpa [SweepLogs.recordActivation, hseen] using hL
  · rcases hL with ⟨ho, hp, hf⟩
    cases phase <;>
      simp [SweepLogs.recordActivation, hseen] <;>
      aesop

theorem SweepLogs.recordShortenerRootSelection_mem_roots
    {R : Finset Vertex} (L : SweepLogs) (t : Vertex)
    (hL : (∀ x ∈ L.opening, x ∈ R) ∧
      (∀ x ∈ L.post, x ∈ R) ∧
        (∀ x ∈ L.shortenerRootSelections, x ∈ R))
    (ht : t ∈ R) :
    (∀ x ∈ (L.recordShortenerRootSelection t).opening, x ∈ R) ∧
      (∀ x ∈ (L.recordShortenerRootSelection t).post, x ∈ R) ∧
      (∀ x ∈ (L.recordShortenerRootSelection t).shortenerRootSelections,
        x ∈ R) := by
  classical
  by_cases hseen : t ∈ L.shortenerRootSelections
  · simpa [SweepLogs.recordShortenerRootSelection, hseen] using hL
  · rcases hL with ⟨ho, hp, hf⟩
    simp [SweepLogs.recordShortenerRootSelection, hseen]
    aesop

/-- Every logged root belongs to the fixed root set. -/
theorem History.sweepLogs_mem_roots
    {D R : Finset Vertex} {N b : ℕ} (G : SweepGeometry D R N)
    {p : Pos} (gh : History D (initialPos b) p) :
    (∀ t ∈ (gh.sweepLogs G).opening, t ∈ R) ∧
    (∀ t ∈ (gh.sweepLogs G).post, t ∈ R) ∧
    (∀ t ∈ (gh.sweepLogs G).shortenerRootSelections, t ∈ R) := by
  classical
  induction gh with
  | root => simp [History.sweepLogs]
  | @snoc q h a ha ih =>
      simp only [History.sweepLogs]
      cases hactor : actorAt D q with
      | none => simp [hactor]; exact ih
      | some who =>
          cases who with
          | eraser => simp [hactor]; exact ih
          | prolonger =>
              cases a with
              | erase U => simp [hactor]; exact ih
              | pass => simp [hactor]; exact ih
              | endOpening => simp [hactor]; exact ih
              | select x =>
                  simp only [hactor]
                  cases hroot : rootOfVertex? R N x with
                  | none => simpa [hroot] using ih
                  | some t =>
                      simpa [hroot] using
                        SweepLogs.recordActivation_mem_roots
                          (h.sweepLogs G) q.phase t ih
                          (rootOfVertex?_mem hroot).1
          | shortener =>
              cases a with
              | erase U => simp [hactor]; exact ih
              | pass => simp [hactor]; exact ih
              | endOpening => simp [hactor]; exact ih
              | select x =>
                  simp only [hactor]
                  by_cases hxR : x ∈ R
                  · simpa [hxR] using
                      SweepLogs.recordShortenerRootSelection_mem_roots
                      (h.sweepLogs G) x ih hxR
                  · simpa [hxR] using ih

/-! ## Policy-compatible replay relation -/

/-- Firing provenance contributed by one certified Shortener move.  Numerical
root-valued inside selections contribute nothing here. -/
def SweepMove.firingLog
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {gp : Pos} {gh : History D (initialPos b) gp}
    {S : SweepState G gh} : SweepMove G gh S → List Vertex
  | .fire t _ _ _ _ _ => [t]
  | .inside _ _ _ _ _ _ _ _ => []
  | .exceptional _ _ _ _ _ => []

/-- Provenance eliminator for the first-applicable branch order.  Once there
is no due response, an empty firing log certifies that no live unprocessed
root was available: otherwise the root-sweep branch would have fired one. -/
theorem firstApplicableSweepMove_no_root_of_no_due_of_no_firing
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (S : SweepState G gh) (hb : 1 ≤ b)
    (hs : actorAt D gp = some Actor.shortener)
    (hnoDue : ¬DueMoveAvailable S)
    (hnoFire : (firstApplicableSweepMove S hb hs).firingLog = []) :
    ¬RootSweepAvailable S := by
  classical
  intro hroot
  have hfire :
      (firstApplicableSweepMove S hb hs).firingLog =
        (rootSweepMove S hs hnoDue hroot).firingLog := by
    rw [firstApplicableSweepMove]
    split
    · rename_i hdue
      exact False.elim (hnoDue hdue)
    · congr
  have hnonempty :
      (rootSweepMove S hs hnoDue hroot).firingLog ≠ [] := by
    simp [rootSweepMove, SweepMove.firingLog]
  exact hnonempty (hfire ▸ hnoFire)

/-- A replay certificate retains the exact simultaneous runtime computed at
every prefix.  A maximizing action uses `SweepState.afterMaximizing`.  At a
Shortener prefix, both the next history action and the next state are computed
by the first-applicable certified move.  The separate `firings` index is
extended only by the `.fire` constructor's provenance log. -/
inductive SweepReplay
    {D R : Finset Vertex} {N b : ℕ} (G : SweepGeometry D R N)
    (hb : 1 ≤ b) :
    {gp : Pos} → (gh : History D (initialPos b) gp) →
      SweepState G gh → List Vertex → Type
  | root : SweepReplay G hb History.root (SweepState.initial G) []
  | maximizing {gp : Pos} {gh : History D (initialPos b) gp}
      {S : SweepState G gh} {firings : List Vertex}
      (prev : SweepReplay G hb gh S firings)
      {a : Action} (ha : a ∈ legalActions D gp)
      (hnot : actorAt D gp ≠ some Actor.shortener) :
      SweepReplay G hb (.snoc gh a ha)
        (S.afterMaximizing hb a ha hnot) firings
  | shortener {gp : Pos} {gh : History D (initialPos b) gp}
      {S : SweepState G gh} {firings : List Vertex}
      (prev : SweepReplay G hb gh S firings)
      (hs : actorAt D gp = some Actor.shortener) :
      SweepReplay G hb
        (.snoc gh (firstApplicableSweepMove S hb hs).action
          (firstApplicableSweepMove S hb hs).legal)
        ((firstApplicableSweepMove S hb hs).nextState hs)
        (firings ++ (firstApplicableSweepMove S hb hs).firingLog)

/-- Endpoint package returned by a successful replay implementation. -/
structure SweepReplaySnapshot
    {D R : Finset Vertex} {N b : ℕ} (G : SweepGeometry D R N)
    (hb : 1 ≤ b) {gp : Pos} (gh : History D (initialPos b) gp) where
  state : SweepState G gh
  firings : List Vertex
  replay : SweepReplay G hb gh state firings

def SweepReplaySnapshot.openingActivations
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {hb : 1 ≤ b} {gp : Pos} {gh : History D (initialPos b) gp}
    (_snap : SweepReplaySnapshot G hb gh) : List Vertex :=
  gh.openingActivationRoots G

def SweepReplaySnapshot.postActivations
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {hb : 1 ≤ b} {gp : Pos} {gh : History D (initialPos b) gp}
    (_snap : SweepReplaySnapshot G hb gh) : List Vertex :=
  gh.postActivationRoots G

def SweepReplaySnapshot.firedRoots
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {hb : 1 ≤ b} {gp : Pos} {gh : History D (initialPos b) gp}
    (snap : SweepReplaySnapshot G hb gh) : List Vertex :=
  snap.firings

/-- The public-history predicate used by the total strategy.  It is a
proposition: the runtime and its firing provenance are hidden witnesses. -/
def SweepReplayable
    {D R : Finset Vertex} {N b : ℕ} (G : SweepGeometry D R N)
    (hb : 1 ≤ b) {gp : Pos}
    (gh : History D (initialPos b) gp) : Prop :=
  Nonempty (SweepReplaySnapshot G hb gh)

/-- One Shortener strategy is fixed before the maximizing strategies.  On a
history possessing a replay certificate it uses that certificate's computed
first-applicable action.  The unreachable complement is filled by the
backward-induction strategy, making the function total on *all* legal public
histories rather than only on histories that will arise when it is followed. -/
noncomputable def sweepStrategy
    {D R : Finset Vertex} {N b : ℕ} (G : SweepGeometry D R N)
    (hb : 1 ≤ b) : Strategy Actor.shortener D (initialPos b) := by
  classical
  intro gp gh hs
  exact if hrep : SweepReplayable G hb gh then
    firstApplicableSweepAction (Classical.choice hrep).state hb hs
  else
    optimalShortener gh hs

theorem sweepStrategy_eq_firstApplicable
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {hb : 1 ≤ b} {gp : Pos} {gh : History D (initialPos b) gp}
    (hrep : SweepReplayable G hb gh)
    (hs : actorAt D gp = some Actor.shortener) :
    sweepStrategy G hb gh hs =
      firstApplicableSweepAction (Classical.choice hrep).state hb hs := by
  classical
  simp only [sweepStrategy, dif_pos hrep]

/-- Every public history that follows `sweepStrategy` has an exact replay.
The proof is noncircular: the induction hypothesis supplies replayability at
the prefix, so the strategy's `if` takes its certified branch there. -/
theorem sweepReplayable_of_follows
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {hb : 1 ≤ b} {gp : Pos} (gh : History D (initialPos b) gp)
    (hf : FollowsShortenerStrategy (sweepStrategy G hb) gh) :
    SweepReplayable G hb gh := by
  induction gh with
  | root =>
      exact ⟨
        { state := SweepState.initial G
          firings := []
          replay := SweepReplay.root }
      ⟩
  | @snoc q h a ha ih =>
      rcases hf with ⟨hf, hchosen⟩
      have hrep : SweepReplayable G hb h := ih hf
      let snap := Classical.choice hrep
      by_cases hs : actorAt D q = some Actor.shortener
      · let m := firstApplicableSweepMove snap.state hb hs
        have haction : a = m.action := by
          have hfollow := hchosen hs
          have hstrategy :
              (sweepStrategy G hb :
                Strategy Actor.shortener D (initialPos b)) h hs =
                firstApplicableSweepAction
                  (Classical.choice hrep).state hb hs :=
            sweepStrategy_eq_firstApplicable hrep hs
          rw [hstrategy] at hfollow
          simpa [firstApplicableSweepAction, m, snap] using hfollow
        subst a
        have hlegal : ha = m.legal := Subsingleton.elim _ _
        cases hlegal
        exact ⟨
          { state := m.nextState hs
            firings := snap.firings ++ m.firingLog
            replay := SweepReplay.shortener snap.replay hs }
          ⟩
      · exact ⟨
          { state := snap.state.afterMaximizing hb a ha hs
            firings := snap.firings
            replay := SweepReplay.maximizing snap.replay ha hs }
          ⟩

end

end Erdos872R177

import Mathlib

namespace Erdos872R177

open Finset

noncomputable section

/-!
# Finite robust-game kernel

This file implements only the finite extensive-form protocol from section 1 of
the repaired manuscript.  In particular, erasure and scheduled-player actions
are separate public stages, opening termination is an explicit Prolonger
action, and erasures are intersections with upsets of the original board `D`.
-/

abbrev Vertex := ℕ

/-- Comparability in the divisibility poset. -/
def Comparable (x y : Vertex) : Prop := x ∣ y ∨ y ∣ x

instance comparableDecidable (x y : Vertex) : Decidable (Comparable x y) :=
  by
    unfold Comparable
    infer_instance

/-- The manuscript's interval `[N] = {1, ..., N}`. -/
def board (N : ℕ) : Finset Vertex := Finset.Icc 1 N

/-- A divisibility downset in the induced poset on `[N]`. -/
def IsDownset (N : ℕ) (D : Finset Vertex) : Prop :=
  D ⊆ board N ∧
    ∀ x ∈ D, ∀ y ∈ board N, y ∣ x → y ∈ D

/-- An upset of the original finite board `D`. -/
def IsUpset (D U : Finset Vertex) : Prop :=
  U ⊆ D ∧
    ∀ u ∈ U, ∀ v ∈ D, u ∣ v → v ∈ U

/-- All global upsets from which the erasure actor may choose. -/
noncomputable def globalUpsets (D : Finset Vertex) : Finset (Finset Vertex) := by
  classical
  exact D.powerset.filter (IsUpset D)

lemma empty_mem_globalUpsets (D : Finset Vertex) : ∅ ∈ globalUpsets D := by
  classical
  simp [globalUpsets, IsUpset]

/-- Permanent state.  Erasure and selection are deliberately distinct. -/
structure CoreState where
  selected : Finset Vertex
  erased : Finset Vertex
deriving DecidableEq

/-- Initial state, before any selection or erasure. -/
def emptyState : CoreState := ⟨∅, ∅⟩

/-- Currently live legal vertices. -/
def liveLegal (D : Finset Vertex) (s : CoreState) : Finset Vertex :=
  D.filter fun x =>
    x ∉ s.selected ∧
      x ∉ s.erased ∧
        ∀ y ∈ s.selected, ¬ Comparable x y

/-- A legal selection is permanent.  Its blocking effect is represented by
the `selected` component in `liveLegal`. -/
def selectState (s : CoreState) (x : Vertex) : CoreState :=
  { s with selected := insert x s.selected }

/-- Erasure changes availability only.  Only vertices currently live and in
the chosen global upset are added to `erased`. -/
def eraseState (D : Finset Vertex) (s : CoreState)
    (U : Finset Vertex) : CoreState :=
  { s with erased := s.erased ∪ (liveLegal D s ∩ U) }

lemma liveLegal_erase_subset (D : Finset Vertex) (s : CoreState)
    (U : Finset Vertex) :
    liveLegal D (eraseState D s U) ⊆ liveLegal D s := by
  intro x hx
  simp only [liveLegal, mem_filter] at hx ⊢
  rcases hx with ⟨hxD, hxSelected, hxErased, hxIncomp⟩
  refine ⟨hxD, hxSelected, ?_, hxIncomp⟩
  simp only [eraseState, mem_union, mem_inter, not_or] at hxErased
  exact hxErased.1

lemma liveLegal_select_subset (D : Finset Vertex) (s : CoreState)
    (x : Vertex) :
    liveLegal D (selectState s x) ⊆ liveLegal D s := by
  intro y hy
  simp only [liveLegal, mem_filter] at hy ⊢
  rcases hy with ⟨hyD, hySelected, hyErased, hyIncomp⟩
  refine ⟨hyD, ?_, hyErased, ?_⟩
  · intro hy
    exact hySelected (by simp [selectState, hy])
  · intro z hz
    exact hyIncomp z (by simp [selectState, hz])

lemma selected_not_liveLegal (D : Finset Vertex) (s : CoreState)
    (x : Vertex) :
    x ∉ liveLegal D (selectState s x) := by
  simp [liveLegal, selectState]

lemma liveLegal_select_card_lt (D : Finset Vertex) (s : CoreState)
    (x : Vertex) (hx : x ∈ liveLegal D s) :
    (liveLegal D (selectState s x)).card < (liveLegal D s).card := by
  apply Finset.card_lt_card
  rw [Finset.ssubset_iff_subset_ne]
  refine ⟨liveLegal_select_subset D s x, ?_⟩
  intro heq
  have : x ∈ liveLegal D (selectState s x) := heq.symm ▸ hx
  exact selected_not_liveLegal D s x this

inductive Player
  | prolonger
  | shortener
deriving DecidableEq, Repr

inductive Actor
  | eraser
  | prolonger
  | shortener
deriving DecidableEq, Repr

/-- `opening r` means that Prolonger may make at most `r` further opening
selections.  At `opening 0`, the explicit `endOpening` action remains. -/
inductive Phase
  | opening (remaining : ℕ)
  | regular (toMove : Player)
deriving DecidableEq, Repr

/-- Every scheduled player action is preceded by a separate erasure stage. -/
inductive Stage
  | beforeErase
  | actorAction
deriving DecidableEq, Repr

structure Pos where
  phase : Phase
  stage : Stage
  state : CoreState
deriving DecidableEq

inductive Action
  | erase (U : Finset Vertex)
  | select (x : Vertex)
  | pass
  | endOpening
deriving DecidableEq

/-- The initial robust-game position with opening budget `b`. -/
def initialPos (b : ℕ) : Pos :=
  ⟨Phase.opening b, Stage.beforeErase, emptyState⟩

/-- The actor at a nonterminal public position. -/
def actorAt (D : Finset Vertex) (p : Pos) : Option Actor :=
  if liveLegal D p.state = ∅ then
    none
  else
    match p.stage with
    | Stage.beforeErase => some Actor.eraser
    | Stage.actorAction =>
        match p.phase with
        | Phase.opening _ => some Actor.prolonger
        | Phase.regular Player.prolonger => some Actor.prolonger
        | Phase.regular Player.shortener => some Actor.shortener

def selectionActions (live : Finset Vertex) : Finset Action :=
  live.image Action.select

def erasureActions (D : Finset Vertex) : Finset Action :=
  (globalUpsets D).image Action.erase

/-- Legal actions at a public position.  The outer terminal check ensures
that no erasure or pass is possible after all live legal vertices disappear. -/
def legalActions (D : Finset Vertex) (p : Pos) : Finset Action :=
  if liveLegal D p.state = ∅ then
    ∅
  else
    match p.stage with
    | Stage.beforeErase => erasureActions D
    | Stage.actorAction =>
        match p.phase with
        | Phase.opening 0 => {Action.endOpening}
        | Phase.opening (_ + 1) =>
            insert Action.endOpening (selectionActions (liveLegal D p.state))
        | Phase.regular Player.prolonger =>
            insert Action.pass (selectionActions (liveLegal D p.state))
        | Phase.regular Player.shortener =>
            selectionActions (liveLegal D p.state)

/-- State transition.  Its behavior on illegal action/position pairs is
irrelevant; `gameMeasure_step_lt` below is stated only for legal actions. -/
def step (D : Finset Vertex) (p : Pos) : Action → Pos
  | Action.erase U =>
      ⟨p.phase, Stage.actorAction, eraseState D p.state U⟩
  | Action.select x =>
      let s' := selectState p.state x
      match p.phase with
      | Phase.opening 0 => ⟨p.phase, p.stage, s'⟩
      | Phase.opening (r + 1) =>
          ⟨Phase.opening r, Stage.beforeErase, s'⟩
      | Phase.regular Player.prolonger =>
          ⟨Phase.regular Player.shortener, Stage.beforeErase, s'⟩
      | Phase.regular Player.shortener =>
          ⟨Phase.regular Player.prolonger, Stage.beforeErase, s'⟩
  | Action.pass =>
      ⟨Phase.regular Player.shortener, Stage.beforeErase, p.state⟩
  | Action.endOpening =>
      ⟨Phase.regular Player.shortener, Stage.beforeErase, p.state⟩

/-- Only actual selections count toward game length. -/
def score : Action → ℕ
  | Action.select _ => 1
  | _ => 0

/-- Control-state rank used by the termination measure. -/
def controlRank : Phase → Stage → ℕ
  | Phase.opening r, Stage.beforeErase => 2 * r + 5
  | Phase.opening r, Stage.actorAction => 2 * r + 4
  | Phase.regular Player.prolonger, Stage.beforeErase => 3
  | Phase.regular Player.prolonger, Stage.actorAction => 2
  | Phase.regular Player.shortener, Stage.beforeErase => 1
  | Phase.regular Player.shortener, Stage.actorAction => 0

/-- A measure that decreases across every legal action, including null
erasures, passes, and the explicit opening-end declaration. -/
def gameMeasure (D : Finset Vertex) (p : Pos) : ℕ :=
  4 * (liveLegal D p.state).card + controlRank p.phase p.stage

private lemma erase_measure_lt (D : Finset Vertex) (p : Pos)
    (U : Finset Vertex) (hstage : p.stage = Stage.beforeErase) :
    gameMeasure D (step D p (Action.erase U)) < gameMeasure D p := by
  have hcard :
      (liveLegal D (eraseState D p.state U)).card ≤
        (liveLegal D p.state).card :=
    Finset.card_le_card (liveLegal_erase_subset D p.state U)
  cases p with
  | mk phase stage state =>
      change stage = Stage.beforeErase at hstage
      subst stage
      simp only at hcard
      cases phase with
      | opening r => simp [gameMeasure, step, controlRank]; omega
      | regular who =>
          cases who <;> simp [gameMeasure, step, controlRank] <;> omega

private lemma select_measure_lt (D : Finset Vertex) (p : Pos)
    (x : Vertex) (hx : x ∈ liveLegal D p.state)
    (hstage : p.stage = Stage.actorAction)
    (hlegalPhase :
      match p.phase with
      | Phase.opening 0 => False
      | _ => True) :
    gameMeasure D (step D p (Action.select x)) < gameMeasure D p := by
  have hcard := liveLegal_select_card_lt D p.state x hx
  cases p with
  | mk phase stage state =>
      change stage = Stage.actorAction at hstage
      subst stage
      simp only at hcard
      cases phase with
      | opening r =>
          cases r with
          | zero => simp at hlegalPhase
          | succ r =>
              simp [gameMeasure, step, controlRank]
              omega
      | regular who =>
          cases who <;> simp [gameMeasure, step, controlRank] <;> omega

/-- The finite game tree is well founded: every legal public action strictly
decreases `gameMeasure`. -/
theorem gameMeasure_step_lt (D : Finset Vertex) (p : Pos) (a : Action)
    (ha : a ∈ legalActions D p) :
    gameMeasure D (step D p a) < gameMeasure D p := by
  unfold legalActions at ha
  split at ha
  · simp at ha
  · rename_i hlive
    cases hstage : p.stage with
    | beforeErase =>
        simp only [hstage] at ha
        unfold erasureActions at ha
        simp only [mem_image] at ha
        rcases ha with ⟨U, hU, rfl⟩
        exact erase_measure_lt D p U hstage
    | actorAction =>
        simp only [hstage] at ha
        cases hphase : p.phase with
        | opening r =>
            cases r with
            | zero =>
                simp only [hphase, mem_singleton] at ha
                subst a
                cases p with
                | mk phase stage state =>
                    simp only at hphase hstage
                    subst phase
                    subst stage
                    simp [gameMeasure, step, controlRank]
            | succ r =>
                simp only [hphase, mem_insert,
                  selectionActions, mem_image] at ha
                rcases ha with ha | ⟨x, hx, rfl⟩
                · subst a
                  cases p with
                  | mk phase stage state =>
                      simp only at hphase hstage
                      subst phase
                      subst stage
                      simp [gameMeasure, step, controlRank]
                · exact select_measure_lt D p x hx hstage (by simp [hphase])
        | regular who =>
            cases who with
            | prolonger =>
                simp only [hphase, mem_insert, selectionActions, mem_image] at ha
                rcases ha with ha | ⟨x, hx, rfl⟩
                · subst a
                  cases p with
                  | mk phase stage state =>
                      simp only at hphase hstage
                      subst phase
                      subst stage
                      simp [gameMeasure, step, controlRank]
                · exact select_measure_lt D p x hx hstage (by simp [hphase])
            | shortener =>
                simp only [hphase, selectionActions, mem_image] at ha
                rcases ha with ⟨x, hx, rfl⟩
                exact select_measure_lt D p x hx hstage (by simp [hphase])

end

end Erdos872R177

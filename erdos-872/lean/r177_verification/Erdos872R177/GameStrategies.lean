import Erdos872R177.GameValue
import Mathlib.Data.ENat.Lattice

namespace Erdos872R177

open Finset

noncomputable section

/-!
# Public histories and strategy semantics

Histories are indexed by their current public position.  Thus strategies may
depend on the entire observed action history while returning an action proved
legal at its endpoint.
-/

lemma legalActions_nonempty_of_actorAt
    (D : Finset Vertex) (p : Pos) (who : Actor)
    (hactor : actorAt D p = some who) :
    (legalActions D p).Nonempty := by
  unfold actorAt at hactor
  split at hactor
  · contradiction
  · rename_i hlive
    unfold legalActions
    rw [if_neg hlive]
    cases hstage : p.stage with
    | beforeErase =>
        refine ⟨Action.erase ∅, ?_⟩
        simp [hstage, erasureActions, empty_mem_globalUpsets]
    | actorAction =>
        cases hphase : p.phase with
        | opening r =>
            cases r with
            | zero => exact ⟨Action.endOpening, by simp [hstage, hphase]⟩
            | succ r => exact ⟨Action.endOpening, by simp [hstage, hphase]⟩
        | regular player =>
            cases player with
            | prolonger => exact ⟨Action.pass, by simp [hstage, hphase]⟩
            | shortener =>
                have hnonempty : (liveLegal D p.state).Nonempty :=
                  Finset.nonempty_iff_ne_empty.mpr hlive
                obtain ⟨x, hx⟩ := hnonempty
                refine ⟨Action.select x, ?_⟩
                simp [hstage, hphase, selectionActions, hx]

lemma legalActions_eq_empty_of_actorAt_none
    (D : Finset Vertex) (p : Pos)
    (hactor : actorAt D p = none) :
    legalActions D p = ∅ := by
  unfold actorAt at hactor
  split at hactor
  · rename_i hlive
    simp [legalActions, hlive]
  · cases hstage : p.stage <;> simp [hstage] at hactor
    cases hphase : p.phase <;> simp [hphase] at hactor
    rename_i player
    cases player <;> simp at hactor

inductive History (D : Finset Vertex) (start : Pos) : Pos → Type
  | root : History D start start
  | snoc {p : Pos} (h : History D start p) (a : Action)
      (ha : a ∈ legalActions D p) :
      History D start (step D p a)

/-- A pure history-dependent strategy for one actor. -/
abbrev Strategy (who : Actor) (D : Finset Vertex) (start : Pos) :=
  ∀ {p : Pos}, History D start p → actorAt D p = some who →
    {a // a ∈ legalActions D p}

/-- Length of the unique play induced from a public history by three pure
strategies. -/
noncomputable def playFrom
    {D : Finset Vertex} {start p : Pos}
    (h : History D start p)
    (sigmaS : Strategy Actor.shortener D start)
    (sigmaP : Strategy Actor.prolonger D start)
    (sigmaE : Strategy Actor.eraser D start) : ℕ :=
  match hactor : actorAt D p with
  | none => 0
  | some Actor.shortener =>
      let a := sigmaS h hactor
      score a.1 + playFrom (History.snoc h a.1 a.2) sigmaS sigmaP sigmaE
  | some Actor.prolonger =>
      let a := sigmaP h hactor
      score a.1 + playFrom (History.snoc h a.1 a.2) sigmaS sigmaP sigmaE
  | some Actor.eraser =>
      let a := sigmaE h hactor
      score a.1 + playFrom (History.snoc h a.1 a.2) sigmaS sigmaP sigmaE
termination_by gameMeasure D p
decreasing_by
  all_goals
    apply gameMeasure_step_lt
    exact a.property

def playLength
    {D : Finset Vertex} {start : Pos}
    (sigmaS : Strategy Actor.shortener D start)
    (sigmaP : Strategy Actor.prolonger D start)
    (sigmaE : Strategy Actor.eraser D start) : ℕ :=
  playFrom History.root sigmaS sigmaP sigmaE

private def outcome (D : Finset Vertex) (p : Pos)
    (a : {a // a ∈ legalActions D p}) : ℕ :=
  score a.1 + gameValue D (step D p a.1)

private noncomputable def minimizingAction
    (D : Finset Vertex) (p : Pos)
    (hactor : actorAt D p = some Actor.shortener) :
    {a // a ∈ legalActions D p} := by
  let hActions := legalActions_nonempty_of_actorAt D p Actor.shortener hactor
  let attached := (legalActions D p).attach
  exact Classical.choose
    (Finset.exists_mem_eq_inf' hActions.attach (outcome D p))

private noncomputable def maximizingAction
    (D : Finset Vertex) (p : Pos) (who : Actor)
    (hactor : actorAt D p = some who) :
    {a // a ∈ legalActions D p} := by
  let hActions := legalActions_nonempty_of_actorAt D p who hactor
  exact Classical.choose
    (Finset.exists_mem_eq_sup' hActions.attach (outcome D p))

private lemma minimizingAction_spec
    (D : Finset Vertex) (p : Pos)
    (hactor : actorAt D p = some Actor.shortener) :
    outcome D p (minimizingAction D p hactor) = gameValue D p := by
  let hActions := legalActions_nonempty_of_actorAt D p Actor.shortener hactor
  have hspec := Classical.choose_spec
    (Finset.exists_mem_eq_inf' hActions.attach (outcome D p))
  conv_rhs => rw [gameValue]
  simp only [dif_pos hActions]
  rw [hactor]
  exact hspec.2.symm

private lemma maximizingAction_spec
    (D : Finset Vertex) (p : Pos) (who : Actor)
    (hactor : actorAt D p = some who)
    (hne : who ≠ Actor.shortener) :
    outcome D p (maximizingAction D p who hactor) = gameValue D p := by
  let hActions := legalActions_nonempty_of_actorAt D p who hactor
  have hspec := Classical.choose_spec
    (Finset.exists_mem_eq_sup' hActions.attach (outcome D p))
  conv_rhs => rw [gameValue]
  simp only [dif_pos hActions]
  cases who with
  | eraser => rw [hactor]; exact hspec.2.symm
  | prolonger => rw [hactor]; exact hspec.2.symm
  | shortener => contradiction

private lemma outcome_le_gameValue_of_max
    (D : Finset Vertex) (p : Pos) (who : Actor)
    (hactor : actorAt D p = some who)
    (hne : who ≠ Actor.shortener)
    (a : {a // a ∈ legalActions D p}) :
    outcome D p a ≤ gameValue D p := by
  let hActions := legalActions_nonempty_of_actorAt D p who hactor
  conv_rhs => rw [gameValue]
  simp only [dif_pos hActions]
  cases who with
  | eraser =>
      rw [hactor]
      exact Finset.le_sup' (outcome D p) (by simp)
  | prolonger =>
      rw [hactor]
      exact Finset.le_sup' (outcome D p) (by simp)
  | shortener => contradiction

private lemma gameValue_le_outcome_of_shortener
    (D : Finset Vertex) (p : Pos)
    (hactor : actorAt D p = some Actor.shortener)
    (a : {a // a ∈ legalActions D p}) :
    gameValue D p ≤ outcome D p a := by
  let hActions := legalActions_nonempty_of_actorAt D p Actor.shortener hactor
  conv_lhs => rw [gameValue]
  simp only [dif_pos hActions]
  rw [hactor]
  exact Finset.inf'_le (outcome D p) (by simp)

def optimalShortener {D : Finset Vertex} {start : Pos} :
    Strategy Actor.shortener D start :=
  fun _ hactor => minimizingAction D _ hactor

def optimalProlonger {D : Finset Vertex} {start : Pos} :
    Strategy Actor.prolonger D start :=
  fun _ hactor => maximizingAction D _ Actor.prolonger hactor

def optimalEraser {D : Finset Vertex} {start : Pos} :
    Strategy Actor.eraser D start :=
  fun _ hactor => maximizingAction D _ Actor.eraser hactor

/-- The extracted Shortener strategy bounds every adaptive maximizing pair. -/
theorem playFrom_optimalShortener_le_gameValue
    {D : Finset Vertex} {start p : Pos}
    (h : History D start p)
    (sigmaP : Strategy Actor.prolonger D start)
    (sigmaE : Strategy Actor.eraser D start) :
    playFrom h optimalShortener sigmaP sigmaE ≤ gameValue D p := by
  induction p using (measure (gameMeasure D)).wf.induction with
  | h p ih =>
      rw [playFrom.eq_def]
      split
      · simp
      · rename_i hactor
        let a := optimalShortener h hactor
        have hrec := ih (step D p a.1)
          (gameMeasure_step_lt D p a.1 a.2)
          (History.snoc h a.1 a.2)
        have hspec := minimizingAction_spec D p hactor
        dsimp only [a, optimalShortener] at hrec ⊢
        rw [← hspec]
        exact Nat.add_le_add_left hrec _
      · rename_i hactor
        let a := sigmaP h hactor
        have hrec := ih (step D p a.1)
          (gameMeasure_step_lt D p a.1 a.2)
          (History.snoc h a.1 a.2)
        have hmax := outcome_le_gameValue_of_max D p Actor.prolonger
          hactor (by decide) a
        exact (Nat.add_le_add_left hrec _).trans hmax
      · rename_i hactor
        let a := sigmaE h hactor
        have hrec := ih (step D p a.1)
          (gameMeasure_step_lt D p a.1 a.2)
          (History.snoc h a.1 a.2)
        have hmax := outcome_le_gameValue_of_max D p Actor.eraser
          hactor (by decide) a
        exact (Nat.add_le_add_left hrec _).trans hmax

/-- The extracted maximizing strategies attain at least the backward value
against every adaptive Shortener strategy. -/
theorem gameValue_le_playFrom_optimalMax
    {D : Finset Vertex} {start p : Pos}
    (h : History D start p)
    (sigmaS : Strategy Actor.shortener D start) :
    gameValue D p ≤ playFrom h sigmaS optimalProlonger optimalEraser := by
  induction p using (measure (gameMeasure D)).wf.induction with
  | h p ih =>
      rw [playFrom.eq_def]
      split
      · rename_i hactor
        have hempty := legalActions_eq_empty_of_actorAt_none D p hactor
        conv_lhs => rw [gameValue]
        simp [hempty]
      · rename_i hactor
        let a := sigmaS h hactor
        have hrec := ih (step D p a.1)
          (gameMeasure_step_lt D p a.1 a.2)
          (History.snoc h a.1 a.2)
        have hmin := gameValue_le_outcome_of_shortener D p hactor a
        exact hmin.trans (Nat.add_le_add_left hrec _)
      · rename_i hactor
        let a := optimalProlonger h hactor
        have hrec := ih (step D p a.1)
          (gameMeasure_step_lt D p a.1 a.2)
          (History.snoc h a.1 a.2)
        have hspec := maximizingAction_spec D p Actor.prolonger
          hactor (by decide)
        dsimp only [a, optimalProlonger] at hrec ⊢
        rw [← hspec]
        exact Nat.add_le_add_left hrec _
      · rename_i hactor
        let a := optimalEraser h hactor
        have hrec := ih (step D p a.1)
          (gameMeasure_step_lt D p a.1 a.2)
          (History.snoc h a.1 a.2)
        have hspec := maximizingAction_spec D p Actor.eraser
          hactor (by decide)
        dsimp only [a, optimalEraser] at hrec ⊢
        rw [← hspec]
        exact Nat.add_le_add_left hrec _

/-- The history-dependent normal-form expression from the manuscript. -/
def normalValue (b : ℕ) (D : Finset Vertex) : ℕ∞ :=
  ⨅ sigmaS : Strategy Actor.shortener D (initialPos b),
    ⨆ sigmaP : Strategy Actor.prolonger D (initialPos b),
      ⨆ sigmaE : Strategy Actor.eraser D (initialPos b),
        (playLength sigmaS sigmaP sigmaE : ℕ∞)

/-- Finite backward induction supplies one Shortener strategy against every
adaptive maximizing pair and one maximizing pair against every Shortener
strategy. -/
theorem finite_saddle_policy (b : ℕ) (D : Finset Vertex) :
    (∃ sigmaS : Strategy Actor.shortener D (initialPos b),
      ∀ sigmaP sigmaE, playLength sigmaS sigmaP sigmaE ≤ v b D) ∧
    (∃ sigmaP : Strategy Actor.prolonger D (initialPos b),
      ∃ sigmaE : Strategy Actor.eraser D (initialPos b),
        ∀ sigmaS, v b D ≤ playLength sigmaS sigmaP sigmaE) := by
  constructor
  · refine ⟨optimalShortener, ?_⟩
    intro sigmaP sigmaE
    simpa [playLength, v] using
      playFrom_optimalShortener_le_gameValue
        (D := D) (start := initialPos b) (p := initialPos b)
        History.root sigmaP sigmaE
  · refine ⟨optimalProlonger, optimalEraser, ?_⟩
    intro sigmaS
    simpa [playLength, v] using
      gameValue_le_playFrom_optimalMax
        (D := D) (start := initialPos b) (p := initialPos b)
        History.root sigmaS

end

end Erdos872R177

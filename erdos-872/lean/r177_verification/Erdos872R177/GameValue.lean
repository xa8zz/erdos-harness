import Erdos872R177.GameKernel

namespace Erdos872R177

open Finset

noncomputable section

/-!
# Backward-induction value of the robust game

The value is defined on the explicit public positions from `GameKernel`.
Eraser and Prolonger nodes take finite suprema, while Shortener nodes take a
finite infimum.  The payoff increment is `score`, hence selections by either
player count and erasures, passes, and the opening-end declaration do not.
-/

/-- One legal action consumes at most the number of currently live vertices:
its score plus the number live afterward is at most the number live before. -/
lemma score_add_liveLegal_step_le (D : Finset Vertex) (p : Pos) (a : Action)
    (ha : a ∈ legalActions D p) :
    score a + (liveLegal D (step D p a).state).card ≤
      (liveLegal D p.state).card := by
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
        simpa [score, step] using
          Finset.card_le_card (liveLegal_erase_subset D p.state U)
    | actorAction =>
        simp only [hstage] at ha
        cases hphase : p.phase with
        | opening r =>
            cases r with
            | zero =>
                simp only [hphase, mem_singleton] at ha
                subst a
                simp [score, step]
            | succ r =>
                simp only [hphase, mem_insert, selectionActions, mem_image] at ha
                rcases ha with ha | ⟨x, hx, rfl⟩
                · subst a
                  simp [score, step]
                · have hcard := liveLegal_select_card_lt D p.state x hx
                  simp [score, step, hphase]
                  omega
        | regular who =>
            cases who with
            | prolonger =>
                simp only [hphase, mem_insert, selectionActions, mem_image] at ha
                rcases ha with ha | ⟨x, hx, rfl⟩
                · subst a
                  simp [score, step]
                · have hcard := liveLegal_select_card_lt D p.state x hx
                  simp [score, step, hphase]
                  omega
            | shortener =>
                simp only [hphase, selectionActions, mem_image] at ha
                rcases ha with ⟨x, hx, rfl⟩
                have hcard := liveLegal_select_card_lt D p.state x hx
                simp [score, step, hphase]
                omega

/-- Backward-induction value from a public position. -/
noncomputable def gameValue (D : Finset Vertex) (p : Pos) : ℕ :=
  if h : (legalActions D p).Nonempty then
    let actions := (legalActions D p).attach
    let hActions : actions.Nonempty := h.attach
    let continuation := fun a : {a // a ∈ legalActions D p} =>
      score a.1 + gameValue D (step D p a.1)
    match actorAt D p with
    | some Actor.shortener => actions.inf' hActions continuation
    | some Actor.eraser => actions.sup' hActions continuation
    | some Actor.prolonger => actions.sup' hActions continuation
    | none => 0
  else
    0
termination_by gameMeasure D p
decreasing_by
  exact gameMeasure_step_lt D p _ a.property

/-- No continuation can score more vertices than are currently live. -/
theorem gameValue_le_liveLegal_card (D : Finset Vertex) (p : Pos) :
    gameValue D p ≤ (liveLegal D p.state).card := by
  induction p using (measure (gameMeasure D)).wf.induction with
  | h p ih =>
      rw [gameValue]
      split
      · rename_i hActions
        dsimp only
        let actions := (legalActions D p).attach
        let continuation := fun a : {a // a ∈ legalActions D p} =>
          score a.1 + gameValue D (step D p a.1)
        have hAttached : actions.Nonempty := hActions.attach
        have hContinuation :
            ∀ a ∈ actions,
              continuation a ≤ (liveLegal D p.state).card := by
          intro a ha
          have hrec :
              gameValue D (step D p a.1) ≤
                (liveLegal D (step D p a.1).state).card :=
            ih (step D p a.1) (gameMeasure_step_lt D p a.1 a.2)
          have hbudget := score_add_liveLegal_step_le D p a.1 a.2
          dsimp only [continuation]
          omega
        cases hActor : actorAt D p with
        | none => simp
        | some actor =>
            cases actor with
            | eraser =>
                exact Finset.sup'_le hAttached continuation hContinuation
            | prolonger =>
                exact Finset.sup'_le hAttached continuation hContinuation
            | shortener =>
                obtain ⟨a, ha⟩ := hAttached
                exact (Finset.inf'_le continuation ha).trans
                  (hContinuation a ha)
      · simp

/-- The robust value with `b` opening selections available. -/
def v (b : ℕ) (D : Finset Vertex) : ℕ :=
  gameValue D (initialPos b)

theorem v_le_card (b : ℕ) (D : Finset Vertex) :
    v b D ≤ D.card := by
  simpa [v, initialPos, emptyState, liveLegal] using
    gameValue_le_liveLegal_card D (initialPos b)

/-- All divisibility downsets of `[N]`. -/
noncomputable def downsets (N : ℕ) : Finset (Finset Vertex) := by
  classical
  exact (board N).powerset.filter (IsDownset N)

lemma mem_downsets_iff {N : ℕ} {D : Finset Vertex} :
    D ∈ downsets N ↔ IsDownset N D := by
  classical
  simp [downsets, IsDownset]

lemma empty_mem_downsets (N : ℕ) : ∅ ∈ downsets N := by
  rw [mem_downsets_iff]
  simp [IsDownset]

/-- The maximum robust value over downsets of `[N]`.  `Finset.sup` gives the
empty-board value `0` without a separate nonemptiness argument. -/
def V (b N : ℕ) : ℕ :=
  (downsets N).sup (v b)

theorem V_le (b N : ℕ) : V b N ≤ N := by
  unfold V
  apply Finset.sup_le
  intro D hD
  have hDown : IsDownset N D := mem_downsets_iff.mp hD
  exact (v_le_card b D).trans <| by
    have hcard : D.card ≤ (board N).card :=
      Finset.card_le_card hDown.1
    simpa [board] using hcard

end

end Erdos872R177

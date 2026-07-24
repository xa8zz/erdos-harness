import Erdos872R177.LocalTrace

namespace Erdos872R177

noncomputable section

/-! # Materializing the terminal history of three strategies -/

/-- A terminal extension of one public history, together with the score
identity and preservation of the chosen Shortener strategy. -/
structure CompletedPlayFrom
    {D : Finset Vertex} {start p : Pos}
    (h : History D start p)
    (sigmaS : Strategy Actor.shortener D start)
    (sigmaP : Strategy Actor.prolonger D start)
    (sigmaE : Strategy Actor.eraser D start) where
  terminalPos : Pos
  terminalHistory : History D start terminalPos
  terminal : actorAt D terminalPos = none
  score_balance :
    h.totalScore + playFrom h sigmaS sigmaP sigmaE =
      terminalHistory.totalScore
  follows_shortener :
    FollowsShortenerStrategy sigmaS h →
      FollowsShortenerStrategy sigmaS terminalHistory

private theorem follows_snoc_chosen
    {D : Finset Vertex} {start p : Pos}
    {h : History D start p}
    (sigmaS : Strategy Actor.shortener D start)
    (hs : actorAt D p = some Actor.shortener)
    (hf : FollowsShortenerStrategy sigmaS h) :
    FollowsShortenerStrategy sigmaS
      (.snoc h (sigmaS h hs).1 (sigmaS h hs).2) := by
  refine ⟨hf, ?_⟩
  intro hs'
  have : hs' = hs := Subsingleton.elim _ _
  cases this
  rfl

private theorem follows_snoc_not_shortener
    {D : Finset Vertex} {start p : Pos}
    {h : History D start p} {a : Action}
    (sigmaS : Strategy Actor.shortener D start)
    (hf : FollowsShortenerStrategy sigmaS h)
    (ha : a ∈ legalActions D p)
    (hnot : actorAt D p ≠ some Actor.shortener) :
    FollowsShortenerStrategy sigmaS (.snoc h a ha) := by
  exact ⟨hf, fun hs => False.elim (hnot hs)⟩

private theorem playFrom_eq_none
    {D : Finset Vertex} {start p : Pos}
    (h : History D start p)
    (sigmaS : Strategy Actor.shortener D start)
    (sigmaP : Strategy Actor.prolonger D start)
    (sigmaE : Strategy Actor.eraser D start)
    (hactor : actorAt D p = none) :
    playFrom h sigmaS sigmaP sigmaE = 0 := by
  rw [playFrom.eq_def]
  split
  · rfl
  · simp_all
  · simp_all
  · simp_all

private theorem playFrom_eq_shortener
    {D : Finset Vertex} {start p : Pos}
    (h : History D start p)
    (sigmaS : Strategy Actor.shortener D start)
    (sigmaP : Strategy Actor.prolonger D start)
    (sigmaE : Strategy Actor.eraser D start)
    (hactor : actorAt D p = some Actor.shortener) :
    playFrom h sigmaS sigmaP sigmaE =
      score (sigmaS h hactor).1 +
        playFrom (.snoc h (sigmaS h hactor).1 (sigmaS h hactor).2)
          sigmaS sigmaP sigmaE := by
  rw [playFrom.eq_def]
  split
  · simp_all
  · rename_i hs
    have : hs = hactor := Subsingleton.elim _ _
    cases this
    rfl
  · rename_i hp
    exact False.elim <| (by decide : Actor.shortener ≠ Actor.prolonger) <|
      Option.some.inj (hactor.symm.trans hp)
  · rename_i he
    exact False.elim <| (by decide : Actor.shortener ≠ Actor.eraser) <|
      Option.some.inj (hactor.symm.trans he)

private theorem playFrom_eq_prolonger
    {D : Finset Vertex} {start p : Pos}
    (h : History D start p)
    (sigmaS : Strategy Actor.shortener D start)
    (sigmaP : Strategy Actor.prolonger D start)
    (sigmaE : Strategy Actor.eraser D start)
    (hactor : actorAt D p = some Actor.prolonger) :
    playFrom h sigmaS sigmaP sigmaE =
      score (sigmaP h hactor).1 +
        playFrom (.snoc h (sigmaP h hactor).1 (sigmaP h hactor).2)
          sigmaS sigmaP sigmaE := by
  rw [playFrom.eq_def]
  split
  · rename_i hnone
    have himpossible : some Actor.prolonger = none := hactor.symm.trans hnone
    cases himpossible
  · rename_i hs
    exact False.elim <| (by decide : Actor.prolonger ≠ Actor.shortener) <|
      Option.some.inj (hactor.symm.trans hs)
  · rename_i hp
    have : hp = hactor := Subsingleton.elim _ _
    cases this
    rfl
  · rename_i he
    exact False.elim <| (by decide : Actor.prolonger ≠ Actor.eraser) <|
      Option.some.inj (hactor.symm.trans he)

private theorem playFrom_eq_eraser
    {D : Finset Vertex} {start p : Pos}
    (h : History D start p)
    (sigmaS : Strategy Actor.shortener D start)
    (sigmaP : Strategy Actor.prolonger D start)
    (sigmaE : Strategy Actor.eraser D start)
    (hactor : actorAt D p = some Actor.eraser) :
    playFrom h sigmaS sigmaP sigmaE =
      score (sigmaE h hactor).1 +
        playFrom (.snoc h (sigmaE h hactor).1 (sigmaE h hactor).2)
          sigmaS sigmaP sigmaE := by
  rw [playFrom.eq_def]
  split
  · rename_i hnone
    have himpossible : some Actor.eraser = none := hactor.symm.trans hnone
    cases himpossible
  · rename_i hs
    exact False.elim <| (by decide : Actor.eraser ≠ Actor.shortener) <|
      Option.some.inj (hactor.symm.trans hs)
  · rename_i hp
    exact False.elim <| (by decide : Actor.eraser ≠ Actor.prolonger) <|
      Option.some.inj (hactor.symm.trans hp)
  · rename_i he
    have : he = hactor := Subsingleton.elim _ _
    cases this
    rfl

/-- Follow all three strategies until the finite game terminates. -/
noncomputable def completePlayFrom
    {D : Finset Vertex} {start p : Pos}
    (h : History D start p)
    (sigmaS : Strategy Actor.shortener D start)
    (sigmaP : Strategy Actor.prolonger D start)
    (sigmaE : Strategy Actor.eraser D start) :
    CompletedPlayFrom h sigmaS sigmaP sigmaE := by
  cases hactor : actorAt D p with
  | none =>
      exact
        { terminalPos := p
          terminalHistory := h
          terminal := hactor
          score_balance := by
            rw [playFrom_eq_none h sigmaS sigmaP sigmaE hactor]
            simp
          follows_shortener := fun hf => hf }
  | some who =>
      cases who with
      | shortener =>
          let a := sigmaS h hactor
          let h' := History.snoc h a.1 a.2
          let tail := completePlayFrom h' sigmaS sigmaP sigmaE
          exact
            { terminalPos := tail.terminalPos
              terminalHistory := tail.terminalHistory
              terminal := tail.terminal
              score_balance := by
                rw [playFrom_eq_shortener h sigmaS sigmaP sigmaE hactor]
                simpa [h', History.totalScore, Nat.add_assoc] using
                  tail.score_balance
              follows_shortener := fun hf =>
                tail.follows_shortener
                  (follows_snoc_chosen sigmaS hactor hf) }
      | prolonger =>
          let a := sigmaP h hactor
          let h' := History.snoc h a.1 a.2
          let tail := completePlayFrom h' sigmaS sigmaP sigmaE
          exact
            { terminalPos := tail.terminalPos
              terminalHistory := tail.terminalHistory
              terminal := tail.terminal
              score_balance := by
                rw [playFrom_eq_prolonger h sigmaS sigmaP sigmaE hactor]
                simpa [h', History.totalScore, Nat.add_assoc] using
                  tail.score_balance
              follows_shortener := fun hf =>
                tail.follows_shortener
                  (follows_snoc_not_shortener sigmaS hf a.2 (by
                    intro hs
                    rw [hactor] at hs
                    contradiction)) }
      | eraser =>
          let a := sigmaE h hactor
          let h' := History.snoc h a.1 a.2
          let tail := completePlayFrom h' sigmaS sigmaP sigmaE
          exact
            { terminalPos := tail.terminalPos
              terminalHistory := tail.terminalHistory
              terminal := tail.terminal
              score_balance := by
                rw [playFrom_eq_eraser h sigmaS sigmaP sigmaE hactor]
                simpa [h', History.totalScore, Nat.add_assoc] using
                  tail.score_balance
              follows_shortener := fun hf =>
                tail.follows_shortener
                  (follows_snoc_not_shortener sigmaS hf a.2 (by
                    intro hs
                    rw [hactor] at hs
                    contradiction)) }
termination_by gameMeasure D p
decreasing_by
  all_goals
    apply gameMeasure_step_lt
    exact a.2

/-- The terminal play from the initial position. -/
noncomputable def completePlay
    {D : Finset Vertex} {b : ℕ}
    (sigmaS : Strategy Actor.shortener D (initialPos b))
    (sigmaP : Strategy Actor.prolonger D (initialPos b))
    (sigmaE : Strategy Actor.eraser D (initialPos b)) :
    CompletedPlayFrom
      (History.root : History D (initialPos b) (initialPos b))
      sigmaS sigmaP sigmaE :=
  completePlayFrom History.root sigmaS sigmaP sigmaE

theorem completePlay_length_eq_totalScore
    {D : Finset Vertex} {b : ℕ}
    (sigmaS : Strategy Actor.shortener D (initialPos b))
    (sigmaP : Strategy Actor.prolonger D (initialPos b))
    (sigmaE : Strategy Actor.eraser D (initialPos b)) :
    playLength sigmaS sigmaP sigmaE =
      (completePlay sigmaS sigmaP sigmaE).terminalHistory.totalScore := by
  simpa [playLength, completePlay, History.totalScore] using
    (completePlay sigmaS sigmaP sigmaE).score_balance

theorem completePlay_follows_shortener
    {D : Finset Vertex} {b : ℕ}
    (sigmaS : Strategy Actor.shortener D (initialPos b))
    (sigmaP : Strategy Actor.prolonger D (initialPos b))
    (sigmaE : Strategy Actor.eraser D (initialPos b)) :
    FollowsShortenerStrategy sigmaS
      (completePlay sigmaS sigmaP sigmaE).terminalHistory := by
  apply (completePlay sigmaS sigmaP sigmaE).follows_shortener
  trivial

end

end Erdos872R177

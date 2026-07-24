import Erdos872R177.GameValue
import Erdos872R177.OriginalComparison

namespace Erdos872R177

open Finset

noncomputable section

/-!
# Original game and comparison with the robust envelope

The original game is compressed to its current finite set of legal vertices.
The comparison below follows the literal staged robust protocol, including
null erasures before the first opening move, before the explicit opening-end
declaration, and at Shortener's first regular turn.
-/

lemma afterSelect_subset (live : Finset Vertex) (x : Vertex) :
    afterSelect live x ⊆ live := by
  intro y hy
  exact (Finset.mem_filter.mp hy).1

lemma selected_not_mem_afterSelect (live : Finset Vertex) (x : Vertex) :
    x ∉ afterSelect live x := by
  simp [afterSelect, Comparable]

lemma afterSelect_card_lt (live : Finset Vertex) (x : Vertex)
    (hx : x ∈ live) :
    (afterSelect live x).card < live.card := by
  apply Finset.card_lt_card
  rw [Finset.ssubset_iff_subset_ne]
  refine ⟨afterSelect_subset live x, ?_⟩
  intro heq
  exact selected_not_mem_afterSelect live x (heq.symm ▸ hx)

def originalMeasure (who : Player) (live : Finset Vertex) : ℕ :=
  2 * live.card +
    match who with
    | Player.prolonger => 1
    | Player.shortener => 0

/-- Backward-induction value of the original alternating game. -/
noncomputable def originalValue (who : Player) (live : Finset Vertex) : ℕ :=
  if h : live.Nonempty then
    let actions := live.attach
    let hActions : actions.Nonempty := h.attach
    let continuation := fun x : {x // x ∈ live} =>
      1 + originalValue
        (match who with
         | Player.prolonger => Player.shortener
         | Player.shortener => Player.prolonger)
        (afterSelect live x.1)
    match who with
    | Player.prolonger => actions.sup' hActions continuation
    | Player.shortener => actions.inf' hActions continuation
  else
    0
termination_by originalMeasure who live
decreasing_by
  have hcard := afterSelect_card_lt live x.1 x.2
  cases who <;> simp [originalMeasure] <;> omega

/-- The manuscript's original game value on `{2, ..., n}`. -/
def L (n : ℕ) : ℕ :=
  originalValue Player.prolonger (originalBoard n)

/-- Selecting in a robust state has exactly the compressed live-set effect. -/
lemma liveLegal_selectState_eq_afterSelect (D : Finset Vertex)
    (s : CoreState) (x : Vertex) :
    liveLegal D (selectState s x) = afterSelect (liveLegal D s) x := by
  ext y
  simp only [liveLegal, mem_filter, selectState, mem_insert, not_or,
    afterSelect]
  constructor
  · rintro ⟨hyD, ⟨hyx, hySelected⟩, hyErased, hyIncomp⟩
    refine ⟨⟨hyD, hySelected, hyErased, ?_⟩, ?_⟩
    · intro z hz
      exact hyIncomp z (Or.inr hz)
    · simpa [Comparable, or_comm] using hyIncomp x (Or.inl rfl)
  · rintro ⟨⟨hyD, hySelected, hyErased, hyIncomp⟩, hyxComp⟩
    refine ⟨hyD, ?_, hyErased, ?_⟩
    · refine ⟨?_, hySelected⟩
      intro hyx
      subst y
      exact hyxComp (Or.inl dvd_rfl)
    · intro z hz
      rcases hz with rfl | hz
      · simpa [Comparable, or_comm] using hyxComp
      · exact hyIncomp z hz

lemma eraseState_empty (D : Finset Vertex) (s : CoreState) :
    eraseState D s ∅ = s := by
  cases s
  simp [eraseState]

/-- At a maximizing node, every particular legal continuation is bounded by
the backward-induction value. -/
lemma continuation_le_gameValue_of_max
    (D : Finset Vertex) (p : Pos) (a : Action)
    (ha : a ∈ legalActions D p)
    (hactor : actorAt D p = some Actor.eraser ∨
      actorAt D p = some Actor.prolonger) :
    score a + gameValue D (step D p a) ≤ gameValue D p := by
  have hActions : (legalActions D p).Nonempty := ⟨a, ha⟩
  conv_rhs => rw [gameValue]
  simp only [dif_pos hActions]
  let aa : {a // a ∈ legalActions D p} := ⟨a, ha⟩
  have haa : aa ∈ (legalActions D p).attach := by simp [aa]
  rcases hactor with hactor | hactor
  · rw [hactor]
    exact Finset.le_sup'
      (fun z : {a // a ∈ legalActions D p} =>
        score z.1 + gameValue D (step D p z.1)) haa
  · rw [hactor]
    exact Finset.le_sup'
      (fun z : {a // a ∈ legalActions D p} =>
        score z.1 + gameValue D (step D p z.1)) haa

/-- To bound a Shortener node from below, it suffices to bound every legal
continuation from below. -/
lemma le_gameValue_of_shortener
    (D : Finset Vertex) (p : Pos) (k : ℕ)
    (hactor : actorAt D p = some Actor.shortener)
    (hActions : (legalActions D p).Nonempty)
    (hbound : ∀ a ∈ legalActions D p,
      k ≤ score a + gameValue D (step D p a)) :
    k ≤ gameValue D p := by
  conv_rhs => rw [gameValue]
  simp only [dif_pos hActions]
  rw [hactor]
  apply Finset.le_inf'
  intro a ha
  exact hbound a.1 a.2

/-- Choosing the empty global upset realizes the scheduled actor position. -/
lemma gameValue_after_empty_erasure_le
    (D : Finset Vertex) (s : CoreState) (phase : Phase)
    (hlive : (liveLegal D s).Nonempty) :
    gameValue D ⟨phase, Stage.actorAction, s⟩ ≤
      gameValue D ⟨phase, Stage.beforeErase, s⟩ := by
  let p : Pos := ⟨phase, Stage.beforeErase, s⟩
  have ha : Action.erase ∅ ∈ legalActions D p := by
    simp [p, legalActions, Finset.Nonempty.ne_empty hlive, erasureActions,
      empty_mem_globalUpsets]
  have hmax : actorAt D p = some Actor.eraser := by
    simp [p, actorAt, Finset.Nonempty.ne_empty hlive]
  have h := continuation_le_gameValue_of_max D p (Action.erase ∅) ha (Or.inl hmax)
  simpa [p, score, step, eraseState_empty] using h

/-- From any regular position, the robust game dominates the original
alternating continuation on the same live legal set.  The first robust step in
this proof is explicitly the empty erasure before the scheduled player. -/
theorem originalValue_le_regular_gameValue
    (D : Finset Vertex) (s : CoreState) (who : Player) :
    originalValue who (liveLegal D s) ≤
      gameValue D ⟨Phase.regular who, Stage.beforeErase, s⟩ := by
  generalize hm : originalMeasure who (liveLegal D s) = m
  induction m using Nat.strong_induction_on generalizing who s with
  | h m ih =>
      by_cases hlive : (liveLegal D s).Nonempty
      · apply le_trans ?_ (gameValue_after_empty_erasure_le D s (.regular who) hlive)
        cases who with
        | prolonger =>
            conv_lhs => rw [originalValue]
            simp only [dif_pos hlive]
            apply Finset.sup'_le
            intro x hxAttach
            have hcard := afterSelect_card_lt (liveLegal D s) x.1 x.2
            let s' := selectState s x.1
            have hmeasure :
                originalMeasure Player.shortener (liveLegal D s') < m := by
              rw [liveLegal_selectState_eq_afterSelect]
              rw [← hm]
              simp [originalMeasure]
              omega
            have hIH := ih _ hmeasure s' Player.shortener rfl
            have hselect : Action.select x.1 ∈
                legalActions D
                  ⟨Phase.regular Player.prolonger, Stage.actorAction, s⟩ := by
              simp [legalActions, Finset.Nonempty.ne_empty hlive,
                selectionActions, x.2]
            have hactor :
                actorAt D
                    ⟨Phase.regular Player.prolonger, Stage.actorAction, s⟩ =
                  some Actor.prolonger := by
              simp [actorAt, Finset.Nonempty.ne_empty hlive]
            have hrobust := continuation_le_gameValue_of_max D
              ⟨Phase.regular Player.prolonger, Stage.actorAction, s⟩
              (Action.select x.1) hselect (Or.inr hactor)
            dsimp only [s'] at hIH
            rw [liveLegal_selectState_eq_afterSelect] at hIH
            simp [score, step] at hrobust
            exact (Nat.add_le_add_left hIH 1).trans hrobust
        | shortener =>
            let p : Pos :=
              ⟨Phase.regular Player.shortener, Stage.actorAction, s⟩
            have hactor : actorAt D p = some Actor.shortener := by
              simp [p, actorAt, Finset.Nonempty.ne_empty hlive]
            have hne : liveLegal D s ≠ ∅ := Finset.Nonempty.ne_empty hlive
            have hActions : (legalActions D p).Nonempty := by
              obtain ⟨x, hx⟩ := hlive
              refine ⟨Action.select x, ?_⟩
              simp [p, legalActions, hne, selectionActions, hx]
            apply le_gameValue_of_shortener D p
              (originalValue Player.shortener (liveLegal D s)) hactor hActions
            intro a ha
            have ha' := ha
            simp only [p, legalActions, hne, if_false,
              selectionActions, mem_image] at ha'
            rcases ha' with ⟨x, hx, rfl⟩
            have hOrigAction :
                originalValue Player.shortener (liveLegal D s) ≤
                  1 + originalValue Player.prolonger
                    (afterSelect (liveLegal D s) x) := by
              conv_lhs => rw [originalValue]
              simp only [dif_pos hlive]
              let xx : {x // x ∈ liveLegal D s} := ⟨x, hx⟩
              exact Finset.inf'_le
                (fun z : {x // x ∈ liveLegal D s} =>
                  1 + originalValue Player.prolonger
                    (afterSelect (liveLegal D s) z.1))
                (show xx ∈ (liveLegal D s).attach by simp [xx])
            let s' := selectState s x
            have hcard := afterSelect_card_lt (liveLegal D s) x hx
            have hmeasure :
                originalMeasure Player.prolonger (liveLegal D s') < m := by
              rw [liveLegal_selectState_eq_afterSelect]
              rw [← hm]
              simp [originalMeasure]
              omega
            have hIH := ih _ hmeasure s' Player.prolonger rfl
            dsimp only [s'] at hIH
            rw [liveLegal_selectState_eq_afterSelect] at hIH
            simp [p, score, step]
            exact hOrigAction.trans (Nat.add_le_add_left hIH 1)
      · rw [originalValue.eq_def]
        simp only [dif_neg hlive]
        exact Nat.zero_le _

/-- The full board is one of the downsets over which `V` takes its maximum. -/
lemma v_full_board_le_V (b N : ℕ) : v b (board N) ≤ V b N := by
  unfold V
  apply Finset.le_sup
  exact mem_downsets_iff.mpr (full_board_isDownset N)

/-- The original game is dominated by the one-opening robust game on `[n]`.
The proof follows the public stages literally. -/
theorem L_le_v_one_full (n : ℕ) (hn : 2 ≤ n) :
    L n ≤ v 1 (board n) := by
  have hOriginal : (originalBoard n).Nonempty := by
    refine ⟨2, ?_⟩
    simp [originalBoard, hn]
  unfold L
  rw [originalValue]
  simp only [dif_pos hOriginal]
  apply Finset.sup'_le
  intro x hxAttach
  let sX : CoreState := selectState emptyState x.1
  let p0 : Pos := ⟨Phase.opening 1, Stage.beforeErase, emptyState⟩
  let p1 : Pos := ⟨Phase.opening 1, Stage.actorAction, emptyState⟩
  let p2 : Pos := ⟨Phase.opening 0, Stage.beforeErase, sX⟩
  let p3 : Pos := ⟨Phase.opening 0, Stage.actorAction, sX⟩
  let p4 : Pos :=
    ⟨Phase.regular Player.shortener, Stage.beforeErase, sX⟩
  have hxOriginal : x.1 ∈ originalBoard n := x.2
  have hxFull : x.1 ∈ board n := by
    have hxBounds := Finset.mem_Icc.mp hxOriginal
    exact Finset.mem_Icc.mpr ⟨le_trans (by decide : 1 ≤ 2) hxBounds.1,
      hxBounds.2⟩
  have hFullLive : (liveLegal (board n) emptyState).Nonempty := by
    refine ⟨x.1, ?_⟩
    simpa [liveLegal, emptyState] using hxFull
  have hBoardNonempty : board n ≠ ∅ := by
    simpa [liveLegal, emptyState] using Finset.Nonempty.ne_empty hFullLive
  have hFirstErase : gameValue (board n) p1 ≤ gameValue (board n) p0 := by
    simpa [p0, p1] using
      gameValue_after_empty_erasure_le (board n) emptyState
        (Phase.opening 1) hFullLive
  have hSelectLegal :
      Action.select x.1 ∈ legalActions (board n) p1 := by
    simp [p1, legalActions, hBoardNonempty,
      selectionActions, liveLegal, emptyState, hxFull]
  have hOpeningActor :
      actorAt (board n) p1 = some Actor.prolonger := by
    simp [p1, actorAt, Finset.Nonempty.ne_empty hFullLive]
  have hFirstSelect :
      1 + gameValue (board n) p2 ≤ gameValue (board n) p1 := by
    have h := continuation_le_gameValue_of_max (board n) p1
      (Action.select x.1) hSelectLegal (Or.inr hOpeningActor)
    simpa [p1, p2, sX, score, step] using h
  have hLiveEq :
      liveLegal (board n) sX =
        afterSelect (originalBoard n) x.1 := by
    calc
      liveLegal (board n) sX =
          afterSelect (liveLegal (board n) emptyState) x.1 := by
            simp [sX, liveLegal_selectState_eq_afterSelect]
      _ = afterSelect (board n) x.1 := by
            simp [liveLegal, emptyState]
      _ = afterSelect (originalBoard n) x.1 :=
            after_first_move_boards_agree hxOriginal
  have hChildToP2 :
      originalValue Player.shortener
          (afterSelect (originalBoard n) x.1) ≤
        gameValue (board n) p2 := by
    by_cases hRemaining : (liveLegal (board n) sX).Nonempty
    · have hSecondErase :
          gameValue (board n) p3 ≤ gameValue (board n) p2 := by
        simpa [p2, p3] using
          gameValue_after_empty_erasure_le (board n) sX
            (Phase.opening 0) hRemaining
      have hEndLegal : Action.endOpening ∈ legalActions (board n) p3 := by
        simp [p3, legalActions, Finset.Nonempty.ne_empty hRemaining]
      have hEndActor : actorAt (board n) p3 = some Actor.prolonger := by
        simp [p3, actorAt, Finset.Nonempty.ne_empty hRemaining]
      have hEnd : gameValue (board n) p4 ≤ gameValue (board n) p3 := by
        have h := continuation_le_gameValue_of_max (board n) p3
          Action.endOpening hEndLegal (Or.inr hEndActor)
        simpa [p3, p4, score, step] using h
      have hContinuation :
          originalValue Player.shortener
              (afterSelect (originalBoard n) x.1) ≤
            gameValue (board n) p4 := by
        have h := originalValue_le_regular_gameValue
          (board n) sX Player.shortener
        simpa [p4, hLiveEq] using h
      exact hContinuation.trans (hEnd.trans hSecondErase)
    · have hEmpty : liveLegal (board n) sX = ∅ :=
        Finset.not_nonempty_iff_eq_empty.mp hRemaining
      have hChildZero :
          originalValue Player.shortener
              (afterSelect (originalBoard n) x.1) = 0 := by
        rw [← hLiveEq, hEmpty, originalValue.eq_def]
        simp
      have hP2Zero : gameValue (board n) p2 = 0 := by
        conv_lhs => rw [gameValue]
        simp [p2, legalActions, hEmpty]
      rw [hChildZero, hP2Zero]
  have hScored :
      1 + originalValue Player.shortener
          (afterSelect (originalBoard n) x.1) ≤
        gameValue (board n) p1 :=
    (Nat.add_le_add_left hChildToP2 1).trans hFirstSelect
  have hToInitial := hScored.trans hFirstErase
  simpa [v, initialPos, p0] using hToInitial

/-- Manuscript inequality (1.2). -/
theorem L_le_V_one (n : ℕ) (hn : 2 ≤ n) :
    L n ≤ V 1 n :=
  (L_le_v_one_full n hn).trans (v_full_board_le_V 1 n)

end

end Erdos872R177

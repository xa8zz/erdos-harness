import Erdos872R177.RootSweepLedger
import Erdos872R177.MasterAccounting
import Erdos872R177.StrategyCompletion

namespace Erdos872R177

open Finset

noncomputable section

/-! # Terminal accounting extracted from a certified sweep replay

This file is the interface between the online replay/ledger and the numerical
master estimate.  It contains no drafting argument.  Instead it consumes a
`DraftingData` value together with the exact facts identifying its three
classes with one terminal replay, and constructs `SweepOutcomeAccounting`.
-/

/-- The provenance firing list is exactly the final state's fired-root set. -/
theorem SweepReplay.fired_eq_firings_toFinset
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {hb : 1 ≤ b} {gp : Pos} {gh : History D (initialPos b) gp}
    {S : SweepState G gh} {firings : List Vertex}
    (replay : SweepReplay G hb gh S firings) :
    S.fired = firings.toFinset := by
  classical
  induction replay with
  | root => simp [SweepState.initial]
  | @maximizing gp gh S firings prev a ha hnot ih =>
      rw [← ih]
      exact S.afterMaximizing_fired hb a ha hnot
  | @shortener gp gh S firings prev hs ih =>
      let m := firstApplicableSweepMove S hb hs
      change (m.nextState hs).fired = (firings ++ m.firingLog).toFinset
      rw [List.toFinset_append, ← ih]
      cases hm : m with
      | inside t x ht hnot active hx legal update terminalOther =>
          simp [SweepMove.nextState, SweepMove.firingLog,
            SweepState.ofRuntime, hm]
      | fire t ht hunprocessed legal terminalAll dominates =>
          simp [SweepMove.nextState, SweepMove.firingLog,
            SweepState.ofRuntime, hm]
      | exceptional x hx hout legal terminalAll =>
          simp [SweepMove.nextState, SweepMove.firingLog,
            SweepState.ofRuntime, hm]

/-- Every replay selection is in a cone activated by the final history, is a
provenance firing, or is outside every root cone. -/
theorem SweepReplay.selected_classes_rootActivated
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {hb : 1 ≤ b} {gp : Pos} {gh : History D (initialPos b) gp}
    {S : SweepState G gh} {firings : List Vertex}
    (replay : SweepReplay G hb gh S firings) :
    ∀ x ∈ selectedVertices gh.actions,
      (∃ t ∈ R, RootActivated (N := N) gh t ∧ x ∈ rootCone N t) ∨
        x ∈ firings.toFinset ∨ (∀ t ∈ R, x ∉ rootCone N t) := by
  classical
  induction replay with
  | root => simp [History.actions, selectedVertices]
  | @maximizing gp gh S firings prev a ha hnot ih =>
      intro x hxSelected
      rw [History.actions, selectedVertices_append] at hxSelected
      rcases List.mem_append.mp hxSelected with hxOld | hxNew
      · rcases ih x hxOld with hactive | hfired | hout
        · rcases hactive with ⟨t, htR, htActive, hxCone⟩
          exact Or.inl ⟨t, htR, rootActivated_mono_snoc ha htActive, hxCone⟩
        · exact Or.inr (Or.inl hfired)
        · exact Or.inr (Or.inr hout)
      · cases a with
        | erase U => simp [selectedVertices] at hxNew
        | pass => simp [selectedVertices] at hxNew
        | endOpening => simp [selectedVertices] at hxNew
        | select y =>
            simp [selectedVertices] at hxNew
            subst x
            have hactor := actor_prolonger_of_legal_select_not_shortener ha hnot
            cases hroot : rootOfVertex? R N y with
            | none =>
                exact Or.inr (Or.inr (by
                  intro t htR hyCone
                  have heq := G.rootOfVertex?_eq htR hyCone
                  rw [hroot] at heq
                  contradiction))
            | some t =>
                have htData := rootOfVertex?_mem hroot
                exact Or.inl ⟨t, htData.1,
                  (rootActivated_snoc_select ha).mpr
                    (Or.inr ⟨hactor, htData.2⟩), htData.2⟩
  | @shortener gp gh S firings prev hs ih =>
      let m := firstApplicableSweepMove S hb hs
      intro x hxSelected
      change x ∈ selectedVertices
        (History.snoc gh m.action m.legal).actions at hxSelected
      rw [History.actions, selectedVertices_append] at hxSelected
      rcases List.mem_append.mp hxSelected with hxOld | hxNew
      · rcases ih x hxOld with hactive | hfired | hout
        · rcases hactive with ⟨t, htR, htActive, hxCone⟩
          exact Or.inl ⟨t, htR,
            rootActivated_mono_snoc m.legal htActive, hxCone⟩
        · exact Or.inr (Or.inl (by
            simpa using (List.mem_toFinset.mpr
              (List.mem_append_left m.firingLog
                (List.mem_toFinset.mp hfired)))))
        · exact Or.inr (Or.inr hout)
      · cases hm : m with
        | inside t y htR hnot active hyCone legal update terminalOther =>
            simp [SweepMove.action, hm, selectedVertices] at hxNew
            subst x
            exact Or.inl ⟨t, htR,
              rootActivated_mono_snoc m.legal active, hyCone⟩
        | fire t htR hunprocessed legal terminalAll dominates =>
            simp [SweepMove.action, hm, selectedVertices] at hxNew
            subst x
            have hm' : firstApplicableSweepMove S hb hs =
                SweepMove.fire t htR hunprocessed legal terminalAll dominates := by
              simpa [m] using hm
            have hlog : t ∈
                (firstApplicableSweepMove S hb hs).firingLog := by
              rw [hm']
              simp [SweepMove.firingLog]
            exact Or.inr (Or.inl (by
              exact List.mem_toFinset.mpr
                (List.mem_append_right firings hlog)))
        | exceptional y hy hout legal terminalAll =>
            simp [SweepMove.action, hm, selectedVertices] at hxNew
            subst x
            exact Or.inr (Or.inr hout)

/-- Public-log formulation of the replay classification. -/
theorem SweepReplay.selected_classes
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {hb : 1 ≤ b} {gp : Pos} {gh : History D (initialPos b) gp}
    {S : SweepState G gh} {firings : List Vertex}
    (replay : SweepReplay G hb gh S firings) :
    ∀ x ∈ selectedVertices gh.actions,
      (∃ t ∈ (gh.sweepLogs G).activated, x ∈ rootCone N t) ∨
        x ∈ firings.toFinset ∨ (∀ t ∈ R, x ∉ rootCone N t) := by
  intro x hx
  rcases replay.selected_classes_rootActivated x hx with
      hactive | hfired | hout
  · rcases hactive with ⟨t, htR, htActive, hxCone⟩
    exact Or.inl ⟨t,
      (History.mem_sweepLogs_activated_iff G gh htR).mpr htActive, hxCone⟩
  · exact Or.inr (Or.inl hfired)
  · exact Or.inr (Or.inr hout)

/-- Exact endpoint compatibility between a terminal replay and the drafting
data extracted from it. -/
structure SnapshotDraftingConsistency
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {hb : 1 ≤ b} {gp : Pos} {gh : History D (initialPos b) gp}
    (snap : SweepReplaySnapshot G hb gh)
    (draft : DraftingData N b R) : Prop where
  opening_eq : draft.opening = snap.openingActivations
  post_eq : draft.post = snap.postActivations
  fired_eq : draft.fired = snap.state.fired

namespace SnapshotDraftingConsistency

/-- Membership in the drafting active set is exactly history-level root
activation. -/
theorem rootActivated_of_mem_active
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {hb : 1 ≤ b} {gp : Pos} {gh : History D (initialPos b) gp}
    {snap : SweepReplaySnapshot G hb gh}
    {draft : DraftingData N b R}
    (c : SnapshotDraftingConsistency snap draft)
    {t : Vertex} (ht : t ∈ draft.activeRoots) :
    RootActivated (N := N) gh t := by
  have htR : t ∈ R := draft.activeRoots_subset ht
  apply (History.mem_sweepLogs_activated_iff G gh htR).mp
  have htList : t ∈ draft.opening ++ draft.post := by
    simpa [DraftingData.activeRoots] using ht
  rw [c.opening_eq, c.post_eq] at htList
  simpa [SweepReplaySnapshot.openingActivations,
    SweepReplaySnapshot.postActivations,
    History.openingActivationRoots, History.postActivationRoots,
    SweepLogs.activated] using htList

/-- Every actual selection lies in an active cone, is a fired root, or lies
outside every root cone.  This is derived from the replay, rather than stored
as an assumption in `SnapshotDraftingConsistency`. -/
theorem selected_classes
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {hb : 1 ≤ b} {gp : Pos} {gh : History D (initialPos b) gp}
    {snap : SweepReplaySnapshot G hb gh}
    {draft : DraftingData N b R}
    (c : SnapshotDraftingConsistency snap draft) :
    ∀ x ∈ selectedVertices gh.actions,
      (∃ t ∈ draft.activeRoots, x ∈ rootCone N t) ∨
        x ∈ draft.fired ∨ (∀ t ∈ R, x ∉ rootCone N t) := by
  intro x hx
  rcases snap.replay.selected_classes x hx with hactive | hfired | hout
  · rcases hactive with ⟨t, htActivated, hxCone⟩
    left
    refine ⟨t, ?_, hxCone⟩
    have htList :
        t ∈ snap.openingActivations ++ snap.postActivations := by
      simpa [SweepReplaySnapshot.openingActivations,
        SweepReplaySnapshot.postActivations,
        History.openingActivationRoots, History.postActivationRoots,
        SweepLogs.activated] using htActivated
    have htDraftList : t ∈ draft.opening ++ draft.post := by
      rw [c.opening_eq, c.post_eq]
      exact htList
    simpa [DraftingData.activeRoots] using htDraftList
  · right
    left
    rw [c.fired_eq, snap.replay.fired_eq_firings_toFinset]
    exact hfired
  · exact Or.inr (Or.inr hout)

/-- Activated and provenance-fired roots are disjoint.  This is obtained from
the terminal state's `fired_not_activated` invariant, not from a cardinality
estimate. -/
theorem active_fired_disjoint
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {hb : 1 ≤ b} {gp : Pos} {gh : History D (initialPos b) gp}
    {snap : SweepReplaySnapshot G hb gh}
    {draft : DraftingData N b R}
    (c : SnapshotDraftingConsistency snap draft) :
    Disjoint draft.activeRoots draft.fired := by
  rw [Finset.disjoint_left]
  intro t htActive htFired
  have htState : t ∈ snap.state.fired := by
    simpa [← c.fired_eq] using htFired
  exact snap.state.fired_not_activated t htState
    (c.rootActivated_of_mem_active htActive)

/-- Every active cone receives the robust local-game bound at the terminal
history. -/
theorem local_count_le
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {hb : 1 ≤ b} {gp : Pos} {gh : History D (initialPos b) gp}
    {snap : SweepReplaySnapshot G hb gh}
    {draft : DraftingData N b R}
    (c : SnapshotDraftingConsistency snap draft)
    (hterminal : actorAt D gp = none)
    {t : Vertex} (ht : t ∈ draft.activeRoots) :
    (projectedConeSelections t gh.actions).length ≤ V (b + 1) (N / t) := by
  have hdisjoint := c.active_fired_disjoint
  have htNotDraft : t ∉ draft.fired := by
    intro htFired
    exact Finset.disjoint_left.mp hdisjoint ht htFired
  have htNotState : t ∉ snap.state.fired := by
    simpa [← c.fired_eq] using htNotDraft
  have htR : t ∈ R := draft.activeRoots_subset ht
  have htActivated : (snap.state.runtime t htR htNotState).activated :=
    (snap.state.activated_exact t htR htNotState).mpr
      (c.rootActivated_of_mem_active ht)
  exact snap.state.active_cone_count_le_V hterminal t htR htNotState
    htActivated

end SnapshotDraftingConsistency

/-- Exact consistency certificate for the drafting data computed from a sweep
replay snapshot. -/
noncomputable def SweepReplaySnapshot.draftingConsistency
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {hb : 1 ≤ b} {gp : Pos} {gh : History D (initialPos b) gp}
    (snap : SweepReplaySnapshot G hb gh) :
    SnapshotDraftingConsistency snap snap.draftingData where
  opening_eq := rfl
  post_eq := rfl
  fired_eq := snap.replay.fired_eq_firings_toFinset.symm

/-- Build the factual `SweepOutcomeAccounting` record for one terminal
replay.  The only numerical input not forced by replay is `quotient_ge`, which
belongs to the concrete root construction. -/
noncomputable def terminalSweepOutcomeAccounting
    {D R : Finset Vertex} {N b A : ℕ} {scale : ℝ}
    {G : SweepGeometry D R N} {hb : 1 ≤ b}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (snap : SweepReplaySnapshot G hb gh)
    (hterminal : actorAt D gp = none)
    (rootBounds : RootNumericalBounds N A R scale)
    (draft : DraftingData N b R)
    (consistent : SnapshotDraftingConsistency snap draft)
    (quotient_ge : ∀ t ∈ draft.activeRoots, A ≤ N / t) :
    SweepOutcomeAccounting V b N A G.exceptional scale gh.totalScore where
  roots := R
  rootBounds := rootBounds
  draft := draft
  active_fired_disjoint := consistent.active_fired_disjoint
  coneSelections := fun t => (projectedConeSelections t gh.actions).length
  outsideSelections := (outsideConeSelections R N gh.actions).length
  total_le_classes :=
    gh.totalScore_le_three_classes G draft.activeRoots draft.fired
      consistent.selected_classes
  local_le := fun _ ht => consistent.local_count_le hterminal ht
  quotient_ge := quotient_ge
  outside_le_exceptional := outsideConeSelections_length_le_exceptional G gh

/-- Actual-play specialization.  The completed-play score identity transports
the terminal-history accounting record to the normal-form `playLength` used
by `v` and `V`. -/
noncomputable def completedPlaySweepOutcomeAccounting
    {D R : Finset Vertex} {N b A : ℕ} {scale : ℝ}
    {G : SweepGeometry D R N} (hb : 1 ≤ b)
    (sigmaP : Strategy Actor.prolonger D (initialPos b))
    (sigmaE : Strategy Actor.eraser D (initialPos b))
    (rootBounds : RootNumericalBounds N A R scale)
    (draft : DraftingData N b R)
    (snap : SweepReplaySnapshot G hb
      (completePlay (sweepStrategy G hb) sigmaP sigmaE).terminalHistory)
    (consistent : SnapshotDraftingConsistency snap draft)
    (quotient_ge : ∀ t ∈ draft.activeRoots, A ≤ N / t) :
    SweepOutcomeAccounting V b N A G.exceptional scale
      (playLength (sweepStrategy G hb) sigmaP sigmaE) := by
  rw [completePlay_length_eq_totalScore]
  exact terminalSweepOutcomeAccounting snap
    (completePlay (sweepStrategy G hb) sigmaP sigmaE).terminal
    rootBounds draft consistent quotient_ge

end

end Erdos872R177

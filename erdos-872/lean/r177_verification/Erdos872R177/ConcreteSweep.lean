import Erdos872R177.TerminalSweepAccounting
import Erdos872R177.ConcreteMaster

namespace Erdos872R177

noncomputable section

/-! # The concrete completed-play sweep family

The public Shortener strategy is the computed root-sweep strategy.  Every
completed adaptive play following it has an exact replay, hence exact
drafting data and terminal three-class accounting. -/

/-- The actual root-sweep strategy supplies the full concrete sweep family
required by the finite-to-density endpoint. -/
noncomputable def concreteSweepFamily : ConcreteSweepFamily := by
  intro b A K delta gamma hb hA hK hdelta₀ hdelta₁
    hgamma₀ hgamma₁ hH N hlarge D hD
  let G := concreteSweepGeometry hD hA hK hdelta₀ hdelta₁
    hgamma₀ hgamma₁ hH hlarge
  refine ⟨sweepStrategy G hb, ?_⟩
  intro sigmaP sigmaE
  let completed := completePlay (sweepStrategy G hb) sigmaP sigmaE
  have hfollows : FollowsShortenerStrategy (sweepStrategy G hb)
      completed.terminalHistory := by
    exact completePlay_follows_shortener
      (sweepStrategy G hb) sigmaP sigmaE
  have hreplay : SweepReplayable G hb completed.terminalHistory :=
    sweepReplayable_of_follows completed.terminalHistory hfollows
  let snap : SweepReplaySnapshot G hb completed.terminalHistory :=
    Classical.choice hreplay
  let draft : DraftingData N b (rootTags D K A delta gamma N) :=
    snap.draftingData
  have consistent : SnapshotDraftingConsistency snap draft :=
    snap.draftingConsistency
  exact completedPlaySweepOutcomeAccounting hb sigmaP sigmaE
    (concreteRootNumericalBounds hA hK hD hdelta₀ hdelta₁
      hgamma₀ hgamma₁ hH hlarge)
    draft snap consistent (by
      intro t ht
      exact root_quotient_ge hD hdelta₀ hdelta₁ hgamma₀ hgamma₁ hH
        (draft.activeRoots_subset ht))

end

end Erdos872R177

import Erdos872R177.RootSweep
import Erdos872R177.SelectionAccounting

namespace Erdos872R177

open Finset

noncomputable section

/-! # Online chronology ledger for the root sweep

This file extracts the drafting data from the computed `SweepReplay`.  The
ledger is deliberately online: a firing may only pay for a later, distinct
post-opening activation.
-/

theorem SweepLogs.recordActivation_activated_nodup
    (L : SweepLogs) (phase : Phase) (t : Vertex)
    (hL : L.activated.Nodup) :
    (L.recordActivation phase t).activated.Nodup := by
  classical
  by_cases ht : t ∈ L.activated
  · simpa [SweepLogs.recordActivation, ht] using hL
  · have hto : t ∉ L.opening := by
      intro h
      exact ht (by simp [SweepLogs.activated, h])
    have htp : t ∉ L.post := by
      intro h
      exact ht (by simp [SweepLogs.activated, h])
    have hparts := List.nodup_append.mp hL
    cases phase with
    | opening r =>
        rw [SweepLogs.recordActivation, if_neg ht]
        change ((L.opening ++ [t]) ++ L.post).Nodup
        rw [List.nodup_append]
        refine ⟨List.nodup_append.mpr ⟨hparts.1, List.nodup_singleton t, ?_⟩,
          hparts.2.1, ?_⟩
        · intro a ha z hz haz
          simp only [List.mem_singleton] at hz
          subst z
          subst a
          exact hto ha
        · intro x hx y hy
          rcases List.mem_append.mp hx with hx | hx
          · exact hparts.2.2 x hx y hy
          · simp only [List.mem_singleton] at hx
            subst x
            intro hty
            subst y
            exact htp hy
    | regular who =>
        rw [SweepLogs.recordActivation, if_neg ht]
        change (L.opening ++ (L.post ++ [t])).Nodup
        rw [List.nodup_append]
        refine ⟨hparts.1, List.nodup_append.mpr
          ⟨hparts.2.1, List.nodup_singleton t, ?_⟩, ?_⟩
        · intro a ha z hz haz
          simp only [List.mem_singleton] at hz
          subst z
          subst a
          exact htp ha
        · intro x hx y hy
          rcases List.mem_append.mp hy with hy | hy
          · exact hparts.2.2 x hx y hy
          · simp only [List.mem_singleton] at hy
            subst y
            intro hxt
            subst x
            exact hto hx

theorem History.sweepLogs_activated_nodup
    {D R : Finset Vertex} {N b : ℕ} (G : SweepGeometry D R N)
    {p : Pos} (gh : History D (initialPos b) p) :
    (gh.sweepLogs G).activated.Nodup := by
  classical
  induction gh with
  | root => simp [History.sweepLogs, SweepLogs.activated]
  | @snoc q h a ha ih =>
      simp only [History.sweepLogs]
      cases hactor : actorAt D q with
      | none => simpa [hactor] using ih
      | some who =>
          cases who with
          | eraser => simpa [hactor] using ih
          | shortener =>
              cases a with
              | erase U => simpa [hactor] using ih
              | pass => simpa [hactor] using ih
              | endOpening => simpa [hactor] using ih
              | select x =>
                  simp only [hactor]
                  by_cases hx : x ∈ R
                  · rw [if_pos hx]
                    unfold SweepLogs.recordShortenerRootSelection
                    split <;> simpa [SweepLogs.activated] using ih
                  · rw [if_neg hx]
                    exact ih
          | prolonger =>
              cases a with
              | erase U => simpa [hactor] using ih
              | pass => simpa [hactor] using ih
              | endOpening => simpa [hactor] using ih
              | select x =>
                  simp only [hactor]
                  cases hroot : rootOfVertex? R N x with
                  | none => simpa [hroot] using ih
                  | some t =>
                      simpa [hroot] using
                        SweepLogs.recordActivation_activated_nodup
                          (h.sweepLogs G) q.phase t ih

theorem History.mem_sweepLogs_activated_iff
    {D R : Finset Vertex} {N b : ℕ} (G : SweepGeometry D R N)
    {p : Pos} (gh : History D (initialPos b) p)
    {t : Vertex} (ht : t ∈ R) :
    t ∈ (gh.sweepLogs G).activated ↔ RootActivated (N := N) gh t := by
  classical
  induction gh with
  | root =>
      simp [History.sweepLogs, SweepLogs.activated, RootActivated,
        History.scheduledActions, scheduledSelectedVertices]
  | @snoc q h a ha ih =>
      simp only [History.sweepLogs]
      cases hactor : actorAt D q with
      | none =>
          cases a <;> simp [hactor, ih, rootActivated_snoc_erase,
            rootActivated_snoc_pass, rootActivated_snoc_endOpening,
            rootActivated_snoc_select]
      | some who =>
          cases who with
          | eraser =>
              cases a <;> simp [hactor, ih, rootActivated_snoc_erase,
                rootActivated_snoc_pass, rootActivated_snoc_endOpening,
                rootActivated_snoc_select]
          | shortener =>
              cases a with
              | erase U => simp [hactor, ih]
              | pass => simp [hactor, ih]
              | endOpening => simp [hactor, ih]
              | select x =>
                  simp only [hactor]
                  by_cases hx : x ∈ R
                  · rw [if_pos hx]
                    have hact :
                        RootActivated (N := N)
                            (.snoc h (Action.select x) ha) t ↔
                          RootActivated (N := N) h t := by
                      rw [rootActivated_snoc_select]
                      simp [hactor]
                    unfold SweepLogs.recordShortenerRootSelection
                    split <;> simpa [SweepLogs.activated, hact] using ih
                  · rw [if_neg hx, rootActivated_snoc_select]
                    simpa [hactor] using ih
          | prolonger =>
              cases a with
              | erase U => simp [hactor, ih]
              | pass => simp [hactor, ih]
              | endOpening => simp [hactor, ih]
              | select x =>
                  simp only [hactor]
                  cases hroot : rootOfVertex? R N x with
                  | none =>
                      have hxout : x ∉ rootCone N t := by
                        intro hxt
                        have heq := G.rootOfVertex?_eq ht hxt
                        rw [hroot] at heq
                        contradiction
                      change t ∈ (h.sweepLogs G).activated ↔
                        RootActivated (N := N)
                          (.snoc h (Action.select x) ha) t
                      rw [rootActivated_snoc_select]
                      simpa [hactor, hxout] using ih
                  | some s =>
                      have hs := rootOfVertex?_mem hroot
                      have hcone : x ∈ rootCone N t ↔ t = s := by
                        constructor
                        · intro hxt
                          exact G.root_eq_of_mem_cones ht hs.1 hxt hs.2
                        · rintro rfl
                          exact hs.2
                      change t ∈
                          ((h.sweepLogs G).recordActivation q.phase s).activated ↔
                        RootActivated (N := N)
                          (.snoc h (Action.select x) ha) t
                      rw [SweepLogs.mem_activated_recordActivation,
                        rootActivated_snoc_select]
                      simpa [hactor, hcone] using or_congr ih Iff.rfl

theorem History.openingSelections_le
    {D : Finset Vertex} {b : ℕ} {p : Pos}
    (gh : History D (initialPos b) p) :
    gh.openingSelections ≤ b := by
  induction gh with
  | root => simp [History.openingSelections]
  | @snoc q h a ha ih =>
      cases a with
      | erase U => simpa [History.openingSelections, openingSelectionIncrement] using ih
      | pass => simpa [History.openingSelections, openingSelectionIncrement] using ih
      | endOpening => simpa [History.openingSelections, openingSelectionIncrement] using ih
      | select x =>
          cases hphase : q.phase with
          | regular who =>
              simpa [History.openingSelections, openingSelectionIncrement, hphase] using ih
          | opening r =>
              have hacct := h.opening_accounting hphase
              have hr : 0 < r := by
                cases r with
                | zero => exact False.elim (select_not_legal_at_opening_zero hphase ha)
                | succ r => omega
              simp [History.openingSelections, openingSelectionIncrement, hphase]
              omega

theorem SweepLogs.recordActivation_opening_length_le
    (L : SweepLogs) (phase : Phase) (t : Vertex) :
    (L.recordActivation phase t).opening.length ≤
      L.opening.length +
        match phase with
        | .opening _ => 1
        | .regular _ => 0 := by
  classical
  by_cases ht : t ∈ L.activated
  · simp [SweepLogs.recordActivation, ht]
  · cases phase <;> simp [SweepLogs.recordActivation, ht]

theorem History.sweepLogs_opening_length_le_openingSelections
    {D R : Finset Vertex} {N b : ℕ} (G : SweepGeometry D R N)
    {p : Pos} (gh : History D (initialPos b) p) :
    (gh.sweepLogs G).opening.length ≤ gh.openingSelections := by
  classical
  induction gh with
  | root => simp [History.sweepLogs, History.openingSelections]
  | @snoc q h a ha ih =>
      cases a with
      | erase U =>
          simpa [History.sweepLogs, History.openingSelections,
            openingSelectionIncrement] using ih
      | pass =>
          simpa [History.sweepLogs, History.openingSelections,
            openingSelectionIncrement] using ih
      | endOpening =>
          simpa [History.sweepLogs, History.openingSelections,
            openingSelectionIncrement] using ih
      | select x =>
          cases hphase : q.phase with
          | opening r =>
              have hstep :
                  ((History.snoc h (Action.select x) ha).sweepLogs G).opening.length ≤
                    (h.sweepLogs G).opening.length + 1 := by
                simp only [History.sweepLogs]
                cases hactor : actorAt D q with
                | none => simp [hactor]
                | some who =>
                    cases who with
                    | eraser => simp [hactor]
                    | shortener =>
                        simp only [hactor]
                        by_cases hx : x ∈ R
                        · rw [if_pos hx]
                          unfold SweepLogs.recordShortenerRootSelection
                          split <;> simp
                        · simp [hx]
                    | prolonger =>
                        simp only [hactor]
                        cases hroot : rootOfVertex? R N x with
                        | none => simp [hroot]
                        | some t =>
                            simpa [hroot, hphase] using
                              SweepLogs.recordActivation_opening_length_le
                                (h.sweepLogs G) q.phase t
              simp [History.openingSelections, openingSelectionIncrement, hphase]
              omega
          | regular who =>
              have hstep :
                  ((History.snoc h (Action.select x) ha).sweepLogs G).opening.length =
                    (h.sweepLogs G).opening.length := by
                simp only [History.sweepLogs]
                cases hactor : actorAt D q with
                | none => simp [hactor]
                | some actor =>
                    cases actor with
                    | eraser => simp [hactor]
                    | shortener =>
                        simp only [hactor]
                        by_cases hx : x ∈ R
                        · rw [if_pos hx]
                          unfold SweepLogs.recordShortenerRootSelection
                          split <;> simp
                        · simp [hx]
                    | prolonger =>
                        simp only [hactor]
                        cases hroot : rootOfVertex? R N x with
                        | none => simp [hroot]
                        | some t =>
                            by_cases ht : t ∈ (h.sweepLogs G).activated <;>
                              simp [hroot, SweepLogs.recordActivation, ht,
                                hphase]
              simp [History.openingSelections, openingSelectionIncrement, hphase,
                hstep]
              exact ih

theorem History.sweepLogs_opening_length_le
    {D R : Finset Vertex} {N b : ℕ} (G : SweepGeometry D R N)
    {p : Pos} (gh : History D (initialPos b) p) :
    (gh.sweepLogs G).opening.length ≤ b :=
  (gh.sweepLogs_opening_length_le_openingSelections G).trans
    gh.openingSelections_le

/-! ## History monotonicity and live unactivated cones -/

theorem rootActivated_mono_snoc
    {D : Finset Vertex} {N b : ℕ} {gp : Pos}
    {gh : History D (initialPos b) gp} {a : Action}
    (ha : a ∈ legalActions D gp) {t : Vertex}
    (hactive : RootActivated (N := N) gh t) :
    RootActivated (N := N) (.snoc gh a ha) t := by
  cases a with
  | erase U => exact (rootActivated_snoc_erase ha t).2 hactive
  | pass => exact (rootActivated_snoc_pass ha t).2 hactive
  | endOpening => exact (rootActivated_snoc_endOpening ha t).2 hactive
  | select x => exact (rootActivated_snoc_select ha).2 (Or.inl hactive)

def LiveUnactivatedCone
    {D R : Finset Vertex} {N b : ℕ} (G : SweepGeometry D R N)
    {gp : Pos} (gh : History D (initialPos b) gp) (t : Vertex) : Prop :=
  t ∈ R ∧ ¬RootActivated (N := N) gh t ∧
    ∃ x, x ∈ liveLegal D gp.state ∧ x ∈ rootCone N t

theorem LiveUnactivatedCone.before_snoc
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {gp : Pos} {gh : History D (initialPos b) gp} {a : Action}
    (ha : a ∈ legalActions D gp) {t : Vertex}
    (hnew : LiveUnactivatedCone G (.snoc gh a ha) t) :
    LiveUnactivatedCone G gh t := by
  rcases hnew with ⟨ht, hnot, x, hxLive, hxCone⟩
  refine ⟨ht, ?_, x, liveLegal_step_subset_geometry D gp a hxLive, hxCone⟩
  intro hactive
  exact hnot (rootActivated_mono_snoc ha hactive)

/-! ## Firing provenance -/

theorem SweepReplay.firings_mem_roots
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {hb : 1 ≤ b} {gp : Pos} {gh : History D (initialPos b) gp}
    {S : SweepState G gh} {firings : List Vertex}
    (replay : SweepReplay G hb gh S firings) :
    ∀ t ∈ firings, t ∈ R := by
  induction replay with
  | root => simp
  | maximizing prev ha hnot ih => exact ih
  | @shortener gp gh S firings prev hs ih =>
      let m := firstApplicableSweepMove S hb hs
      change ∀ t ∈ firings ++ m.firingLog, t ∈ R
      intro t ht
      rcases List.mem_append.mp ht with ht | ht
      · exact ih t ht
      · cases hm : m with
        | inside s x hsR hsnot active hx legal update terminalOther =>
            simp [SweepMove.firingLog, hm] at ht
        | exceptional x hx hout legal terminalAll =>
            simp [SweepMove.firingLog, hm] at ht
        | fire s hsR hunprocessed legal terminalAll dominates =>
            simp [SweepMove.firingLog, hm] at ht
            simpa [ht] using hsR

theorem SweepReplay.firings_mem_selected
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {hb : 1 ≤ b} {gp : Pos} {gh : History D (initialPos b) gp}
    {S : SweepState G gh} {firings : List Vertex}
    (replay : SweepReplay G hb gh S firings) :
    ∀ t ∈ firings, t ∈ selectedVertices gh.actions := by
  induction replay with
  | root => simp [History.actions]
  | @maximizing gp gh S firings prev a ha hnot ih =>
      intro t ht
      rw [History.actions, selectedVertices_append]
      exact List.mem_append_left _ (ih t ht)
  | @shortener gp gh S firings prev hs ih =>
      let m := firstApplicableSweepMove S hb hs
      change ∀ t ∈ firings ++ m.firingLog,
        t ∈ selectedVertices
          (History.snoc gh m.action m.legal).actions
      intro t ht
      rw [History.actions, selectedVertices_append]
      rcases List.mem_append.mp ht with ht | ht
      · exact List.mem_append_left _ (ih t ht)
      · cases hm : m with
        | inside s x hsR hsnot active hx legal update terminalOther =>
            simp [SweepMove.firingLog, hm] at ht
        | exceptional x hx hout legal terminalAll =>
            simp [SweepMove.firingLog, hm] at ht
        | fire s hsR hunprocessed legal terminalAll dominates =>
            simp [SweepMove.firingLog, hm] at ht
            subst t
            simp [SweepMove.action, hm, selectedVertices]

theorem SweepReplay.firings_nodup
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {hb : 1 ≤ b} {gp : Pos} {gh : History D (initialPos b) gp}
    {S : SweepState G gh} {firings : List Vertex}
    (replay : SweepReplay G hb gh S firings) : firings.Nodup := by
  induction replay with
  | root => simp
  | maximizing prev ha hnot ih => exact ih
  | @shortener gp gh S firings prev hs ih =>
      let m := firstApplicableSweepMove S hb hs
      change (firings ++ m.firingLog).Nodup
      cases hm : m with
      | inside s x hsR hsnot active hx legal update terminalOther =>
          simpa [SweepMove.firingLog, hm] using ih
      | exceptional x hx hout legal terminalAll =>
          simpa [SweepMove.firingLog, hm] using ih
      | fire s hsR hunprocessed legal terminalAll dominates =>
          have hsLive : s ∈ liveLegal D gp.state :=
            select_mem_liveLegal_of_legal legal
          have hsFresh : s ∉ firings := by
            intro hsOld
            exact gh.selectedVertices_not_live s
              (prev.firings_mem_selected s hsOld) hsLive
          rw [SweepMove.firingLog, List.nodup_append]
          refine ⟨ih, List.nodup_singleton s, ?_⟩
          intro x hx y hy hxy
          simp only [List.mem_singleton] at hy
          subst y
          subst x
          exact hsFresh hx

/-! ## Online extension of the drafting injection -/

def TailPairing.empty (N : ℕ) (fired : Finset Vertex) :
    TailPairing N [] fired where
  pair := fun _ => 0
  pair_mem := by simp
  pair_injective := by simp
  weight_le := by simp

def TailPairing.singleton (N t : ℕ) (fired : Finset Vertex) :
    TailPairing N [t] fired where
  pair := fun _ => 0
  pair_mem := by simp
  pair_injective := by simp
  weight_le := by simp

noncomputable def TailPairing.snoc_of_nonempty
    {N : ℕ} {post : List Vertex} {fired : Finset Vertex}
    (P : TailPairing N post fired) (hpost : post ≠ [])
    {t r : Vertex} (htnew : t ∉ post)
    (hr : r ∈ fired)
    (hrfresh : ∀ {u}, u ∈ post.tail → P.pair u ≠ r)
    (hweight : rootWeight N t ≤ rootWeight N r) :
    TailPairing N (post ++ [t]) fired := by
  have htail : (post ++ [t]).tail = post.tail ++ [t] := by
    cases post with
    | nil => contradiction
    | cons a rest => simp
  let pair' : Vertex → Vertex := fun u => if u = t then r else P.pair u
  refine
    { pair := pair'
      pair_mem := ?_
      pair_injective := ?_
      weight_le := ?_ }
  · intro u hu
    rw [htail] at hu
    rcases List.mem_append.mp hu with hu | hu
    · have hut : u ≠ t := by
        intro hut
        subst u
        exact htnew (List.tail_subset post hu)
      simpa [pair', hut] using P.pair_mem hu
    · simp only [List.mem_singleton] at hu
      subst u
      simpa [pair'] using hr
  · intro u hu v hv heq
    have huList : u ∈ (post ++ [t]).tail :=
      List.mem_toFinset.mp hu
    have hvList : v ∈ (post ++ [t]).tail :=
      List.mem_toFinset.mp hv
    rw [htail] at huList hvList
    rcases List.mem_append.mp huList with huOld | huNew
    · have hut : u ≠ t := by
          intro hut
          subst u
          exact htnew (List.tail_subset post huOld)
      rcases List.mem_append.mp hvList with hvOld | hvNew
      · have hvt : v ≠ t := by
            intro hvt
            subst v
            exact htnew (List.tail_subset post hvOld)
        have heqOld : P.pair u = P.pair v := by
          simpa [pair', hut, hvt] using heq
        exact P.pair_injective (by simpa using huOld)
          (by simpa using hvOld) heqOld
      · simp only [List.mem_singleton] at hvNew
        subst v
        have : P.pair u = r := by simpa [pair', hut] using heq
        exact False.elim (hrfresh huOld this)
    · simp only [List.mem_singleton] at huNew
      subst u
      rcases List.mem_append.mp hvList with hvOld | hvNew
      · have hvt : v ≠ t := by
          intro hvt
          subst v
          exact htnew (List.tail_subset post hvOld)
        have : P.pair v = r := by
          have h := heq.symm
          simpa [pair', hvt] using h
        exact False.elim (hrfresh hvOld this)
      · simp only [List.mem_singleton] at hvNew
        exact hvNew.symm
  · intro u hu
    rw [htail] at hu
    rcases List.mem_append.mp hu with hu | hu
    · have hut : u ≠ t := by
        intro hut
        subst u
        exact htnew (List.tail_subset post hu)
      simpa [pair', hut] using P.weight_le hu
    · simp only [List.mem_singleton] at hu
      subst u
      simpa [pair'] using hweight

def TailPairing.widen
    {N : ℕ} {post : List Vertex} {fired fired' : Finset Vertex}
    (P : TailPairing N post fired) (hsub : fired ⊆ fired') :
    TailPairing N post fired' where
  pair := P.pair
  pair_mem := fun ht => hsub (P.pair_mem ht)
  pair_injective := P.pair_injective
  weight_le := P.weight_le

def TailPairing.castPost
    {N : ℕ} {post post' : List Vertex} {fired : Finset Vertex}
    (P : TailPairing N post fired) (h : post = post') :
    TailPairing N post' fired := h ▸ P

@[simp] theorem TailPairing.castPost_pair
    {N : ℕ} {post post' : List Vertex} {fired : Finset Vertex}
    (P : TailPairing N post fired) (h : post = post') :
    (P.castPost h).pair = P.pair := by
  subst post'
  rfl

/-! ## Credits carried between post-opening activations -/

structure SweepCredit
    {D R : Finset Vertex} {N b : ℕ} (G : SweepGeometry D R N)
    {gp : Pos} (gh : History D (initialPos b) gp)
    (firings : List Vertex)
    (P : TailPairing N (gh.sweepLogs G).post firings.toFinset) where
  root : Vertex
  root_mem : root ∈ firings.toFinset
  root_fresh : ∀ {t}, t ∈ (gh.sweepLogs G).post.tail → P.pair t ≠ root
  dominates : ∀ {t}, LiveUnactivatedCone G gh t →
    rootWeight N t ≤ rootWeight N root

def SweepCredit.after_snoc
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {gp : Pos} {gh : History D (initialPos b) gp}
    {firings : List Vertex}
    {P : TailPairing N (gh.sweepLogs G).post firings.toFinset}
    (C : SweepCredit G gh firings P)
    {a : Action} (ha : a ∈ legalActions D gp)
    (hpost : ((History.snoc gh a ha).sweepLogs G).post =
      (gh.sweepLogs G).post) :
    SweepCredit G (.snoc gh a ha) firings (P.castPost hpost.symm) where
  root := C.root
  root_mem := C.root_mem
  root_fresh := by
    intro t ht
    have htOld : t ∈ (gh.sweepLogs G).post.tail := by
      rwa [← hpost]
    simpa only [TailPairing.castPost_pair] using C.root_fresh htOld
  dominates := by
    intro t ht
    exact C.dominates (ht.before_snoc ha)

@[simp] theorem SweepLogs.recordShortenerRootSelection_post
    (L : SweepLogs) (t : Vertex) :
    (L.recordShortenerRootSelection t).post = L.post := by
  classical
  unfold SweepLogs.recordShortenerRootSelection
  split <;> rfl

noncomputable def SweepCredit.of_fire
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {hb : 1 ≤ b} {gp : Pos} {gh : History D (initialPos b) gp}
    {S : SweepState G gh} {firings : List Vertex}
    (replay : SweepReplay G hb gh S firings)
    (P : TailPairing N (gh.sweepLogs G).post firings.toFinset)
    (r : Vertex) (hr : r ∈ R) (hunprocessed : S.isUnprocessed r)
    (legal : Action.select r ∈ legalActions D gp)
    (hactor : actorAt D gp = some Actor.shortener)
    (dominates : ∀ s ∈ rootSweepCandidates S,
      rootWeight N s ≤ rootWeight N r) :
    Σ P' : TailPairing N
        (((History.snoc gh (Action.select r) legal).sweepLogs G).post)
        (firings ++ [r]).toFinset,
      SweepCredit G (.snoc gh (Action.select r) legal) (firings ++ [r]) P' := by
  classical
  let P' := P.widen (show firings.toFinset ⊆ (firings ++ [r]).toFinset by
    intro s hs
    apply List.mem_toFinset.mpr
    exact List.mem_append_left [r] (List.mem_toFinset.mp hs))
  have hrLive : r ∈ liveLegal D gp.state :=
    select_mem_liveLegal_of_legal legal
  have hrOld : r ∉ firings := by
    intro hrf
    exact gh.selectedVertices_not_live r
      (replay.firings_mem_selected r hrf) hrLive
  have hpost :
      ((History.snoc gh (Action.select r) legal).sweepLogs G).post =
        (gh.sweepLogs G).post := by
    simp only [History.sweepLogs, hactor]
    by_cases hrR : r ∈ R
    · rw [if_pos hrR]
      exact SweepLogs.recordShortenerRootSelection_post _ _
    · rw [if_neg hrR]
  let Pcast := P'.castPost hpost.symm
  refine ⟨Pcast, ?_⟩
  refine
    { root := r
      root_mem := by simp
      root_fresh := ?_
      dominates := ?_ }
  · intro t ht
    have htOld : t ∈ (gh.sweepLogs G).post.tail := by
      rwa [← hpost]
    have hpairOld : P.pair t ∈ firings.toFinset := P.pair_mem htOld
    have hpairNe : P.pair t ≠ r := by
      intro heq
      apply hrOld
      exact List.mem_toFinset.mp (heq ▸ hpairOld)
    simpa [Pcast, P', TailPairing.widen] using hpairNe
  · intro t ht
    have htOld := ht.before_snoc legal
    rcases htOld with ⟨htR, htInactive, x, hxLive, hxCone⟩
    have htNotFired : t ∉ S.fired := by
      intro htf
      exact S.fired_cone_dead htf hxCone hxLive
    have hrunInactive : ¬(S.runtime t htR htNotFired).activated :=
      (S.activated_exact t htR htNotFired).not.mpr htInactive
    have htLive : t ∈ liveLegal D gp.state :=
      S.dormant_root_live_of_cone_live htR htNotFired hrunInactive
        hxLive hxCone
    apply dominates t
    rw [rootSweepCandidates, Finset.mem_filter]
    exact ⟨htR, ⟨⟨htR, htNotFired, hrunInactive⟩, htLive⟩⟩

/-! ## Online ledger modes -/

theorem no_liveUnactivatedCone_of_no_root
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (S : SweepState G gh) (hnoRoot : ¬RootSweepAvailable S) :
    ∀ t, ¬LiveUnactivatedCone G gh t := by
  classical
  intro t ht
  rcases ht with ⟨htR, htInactive, x, hxLive, hxCone⟩
  have htNotFired : t ∉ S.fired := by
    intro htf
    exact S.fired_cone_dead htf hxCone hxLive
  have hrunInactive : ¬(S.runtime t htR htNotFired).activated :=
    (S.activated_exact t htR htNotFired).not.mpr htInactive
  have htLive : t ∈ liveLegal D gp.state :=
    S.dormant_root_live_of_cone_live htR htNotFired hrunInactive
      hxLive hxCone
  apply hnoRoot
  refine ⟨t, ?_⟩
  rw [rootSweepCandidates, Finset.mem_filter]
  exact ⟨htR, ⟨⟨htR, htNotFired, hrunInactive⟩, htLive⟩⟩

inductive LedgerMode
    {D R : Finset Vertex} {N b : ℕ} (G : SweepGeometry D R N)
    {gp : Pos} (gh : History D (initialPos b) gp)
    (S : SweepState G gh) (firings : List Vertex)
    (P : TailPairing N (gh.sweepLogs G).post firings.toFinset) : Type
  | head (hpost : (gh.sweepLogs G).post = []) :
      LedgerMode G gh S firings P
  | awaiting
      (hpost : (gh.sweepLogs G).post ≠ [])
      (hphase : gp.phase = Phase.regular Player.shortener)
      (hnoDue : ¬DueMoveAvailable S) :
      LedgerMode G gh S firings P
  | credit (credit : SweepCredit G gh firings P) :
      LedgerMode G gh S firings P
  | closed (closed : ∀ t, ¬LiveUnactivatedCone G gh t) :
      LedgerMode G gh S firings P

structure ReplayLedger
    {D R : Finset Vertex} {N b : ℕ} (G : SweepGeometry D R N)
    {gp : Pos} (gh : History D (initialPos b) gp)
    (S : SweepState G gh) (firings : List Vertex) where
  pairing : TailPairing N (gh.sweepLogs G).post firings.toFinset
  mode : LedgerMode G gh S firings pairing

def LedgerMode.closed_after_snoc
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (hclosed : ∀ t, ¬LiveUnactivatedCone G gh t)
    {a : Action} (ha : a ∈ legalActions D gp) :
    ∀ t, ¬LiveUnactivatedCone G (.snoc gh a ha) t := by
  intro t ht
  exact hclosed t (ht.before_snoc ha)

theorem DueMoveAvailable.before_erase
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (S : SweepState G gh) {U : Finset Vertex}
    (ha : Action.erase U ∈ legalActions D gp)
    (hdue : DueMoveAvailable (S.afterErase ha)) : DueMoveAvailable S := by
  rcases hdue with ⟨w⟩
  rcases w with ⟨t, ht, hnot, hdue, hnonempty⟩
  refine ⟨⟨t, ht, hnot, ?_, ?_⟩⟩
  · simpa [SweepState.afterErase, RootLocal.afterErase,
      RootLocal.responseDue] using hdue
  · rcases hnonempty with ⟨q, hq⟩
    refine ⟨q, ?_⟩
    let L := S.runtime t ht hnot
    change q ∈ effectiveLocalLive (Erdos872.quotientCone D N t)
      L.localEnd (L.pending ++ [Erdos872.quotientCone U N t]) at hq
    change q ∈ effectiveLocalLive (Erdos872.quotientCone D N t)
      L.localEnd L.pending
    unfold effectiveLocalLive at hq ⊢
    rw [unionAll_append_singleton] at hq
    rcases Finset.mem_sdiff.mp hq with ⟨hqLive, hqNot⟩
    exact Finset.mem_sdiff.mpr ⟨hqLive, fun hqOld =>
      hqNot (Finset.mem_union_left _ hqOld)⟩

theorem legal_action_eq_erase_of_shortener_phase
    {D : Finset Vertex} {gp : Pos} {a : Action}
    (hphase : gp.phase = Phase.regular Player.shortener)
    (ha : a ∈ legalActions D gp)
    (hnotS : actorAt D gp ≠ some Actor.shortener) :
    ∃ U, a = Action.erase U := by
  have hlive : liveLegal D gp.state ≠ ∅ := by
    intro hempty
    unfold legalActions at ha
    rw [if_pos hempty] at ha
    simp at ha
  have hstage : gp.stage = Stage.beforeErase := by
    cases hs : gp.stage with
    | beforeErase => rfl
    | actorAction =>
        exact False.elim (hnotS (by
          simp [actorAt, hlive, hs, hphase]))
  unfold legalActions at ha
  rw [if_neg hlive, hstage] at ha
  rcases Finset.mem_image.mp ha with ⟨U, hU, hUa⟩
  exact ⟨U, hUa.symm⟩

noncomputable def ReplayLedger.afterMaximizing_samePost
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {hb : 1 ≤ b} {gp : Pos} {gh : History D (initialPos b) gp}
    {S : SweepState G gh} {firings : List Vertex}
    (L : ReplayLedger G gh S firings)
    {a : Action} (ha : a ∈ legalActions D gp)
    (hnotS : actorAt D gp ≠ some Actor.shortener)
    (hpost : ((History.snoc gh a ha).sweepLogs G).post =
      (gh.sweepLogs G).post) :
    ReplayLedger G (.snoc gh a ha)
      (S.afterMaximizing hb a ha hnotS) firings := by
  let P' := L.pairing.castPost hpost.symm
  refine ⟨P', ?_⟩
  cases L.mode with
  | head hnil =>
      apply LedgerMode.head
      rw [hpost]
      exact hnil
  | credit C =>
      exact LedgerMode.credit (C.after_snoc ha hpost)
  | closed hclosed =>
      exact LedgerMode.closed (LedgerMode.closed_after_snoc hclosed ha)
  | awaiting hne hphase hnoDue =>
      cases a with
      | erase U =>
          apply LedgerMode.awaiting
          · rwa [hpost]
          · simpa [step] using hphase
          · intro hdue
            apply hnoDue
            apply DueMoveAvailable.before_erase S ha
            simpa [SweepState.afterMaximizing] using hdue
      | select x =>
          let hex := legal_action_eq_erase_of_shortener_phase hphase ha hnotS
          exact False.elim (Action.noConfusion (Classical.choose_spec hex))
      | pass =>
          let hex := legal_action_eq_erase_of_shortener_phase hphase ha hnotS
          exact False.elim (Action.noConfusion (Classical.choose_spec hex))
      | endOpening =>
          let hex := legal_action_eq_erase_of_shortener_phase hphase ha hnotS
          exact False.elim (Action.noConfusion (Classical.choose_spec hex))

noncomputable def ReplayLedger.afterShortener
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {hb : 1 ≤ b} {gp : Pos} {gh : History D (initialPos b) gp}
    {S : SweepState G gh} {firings : List Vertex}
    (replay : SweepReplay G hb gh S firings)
    (L : ReplayLedger G gh S firings)
    (hs : actorAt D gp = some Actor.shortener) :
    ReplayLedger G
      (.snoc gh (firstApplicableSweepMove S hb hs).action
        (firstApplicableSweepMove S hb hs).legal)
      ((firstApplicableSweepMove S hb hs).nextState hs)
      (firings ++ (firstApplicableSweepMove S hb hs).firingLog) := by
  classical
  let m := firstApplicableSweepMove S hb hs
  change ReplayLedger G (.snoc gh m.action m.legal) (m.nextState hs)
    (firings ++ m.firingLog)
  cases hm : m with
  | fire r hr hunprocessed legal terminalAll dominates =>
      let ext := SweepCredit.of_fire replay L.pairing r hr hunprocessed
        legal hs dominates
      exact
        { pairing := ext.1
          mode := LedgerMode.credit ext.2 }
  | inside t x ht hnot active hx legal update terminalOther =>
      simp only [SweepMove.action, SweepMove.legal, SweepMove.firingLog,
        List.append_nil]
      have hpost :
          ((History.snoc gh (Action.select x) legal).sweepLogs G).post =
            (gh.sweepLogs G).post := by
        simp only [History.sweepLogs, hs]
        by_cases hxR : x ∈ R
        · rw [if_pos hxR]
          exact SweepLogs.recordShortenerRootSelection_post _ _
        · rw [if_neg hxR]
      let P' := L.pairing.castPost hpost.symm
      refine ⟨P', ?_⟩
      cases L.mode with
      | head hnil =>
          apply LedgerMode.head
          rwa [hpost]
      | credit C =>
          exact LedgerMode.credit (C.after_snoc legal hpost)
      | closed hclosed =>
          exact LedgerMode.closed (LedgerMode.closed_after_snoc hclosed legal)
      | awaiting hne hphase hnoDue =>
          have hnoFire :
              (firstApplicableSweepMove S hb hs).firingLog = [] := by
            simpa [m, hm, SweepMove.firingLog]
          have hnoRoot :=
            firstApplicableSweepMove_no_root_of_no_due_of_no_firing
              S hb hs hnoDue hnoFire
          exact LedgerMode.closed
            (LedgerMode.closed_after_snoc
              (no_liveUnactivatedCone_of_no_root S hnoRoot) legal)
  | exceptional x hx hout legal terminalAll =>
      simp only [SweepMove.action, SweepMove.legal, SweepMove.firingLog,
        List.append_nil]
      have hpost :
          ((History.snoc gh (Action.select x) legal).sweepLogs G).post =
            (gh.sweepLogs G).post := by
        simp only [History.sweepLogs, hs]
        by_cases hxR : x ∈ R
        · rw [if_pos hxR]
          exact SweepLogs.recordShortenerRootSelection_post _ _
        · rw [if_neg hxR]
      let P' := L.pairing.castPost hpost.symm
      refine ⟨P', ?_⟩
      cases L.mode with
      | head hnil =>
          apply LedgerMode.head
          rwa [hpost]
      | credit C =>
          exact LedgerMode.credit (C.after_snoc legal hpost)
      | closed hclosed =>
          exact LedgerMode.closed (LedgerMode.closed_after_snoc hclosed legal)
      | awaiting hne hphase hnoDue =>
          have hnoFire :
              (firstApplicableSweepMove S hb hs).firingLog = [] := by
            simpa [m, hm, SweepMove.firingLog]
          have hnoRoot :=
            firstApplicableSweepMove_no_root_of_no_due_of_no_firing
              S hb hs hnoDue hnoFire
          exact LedgerMode.closed
            (LedgerMode.closed_after_snoc
              (no_liveUnactivatedCone_of_no_root S hnoRoot) legal)

private theorem actor_prolonger_of_legal_select_not_shortener_ledger
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
              exact False.elim (hnotS (by
                simp [actorAt, hlive, hstage, hphase]))

noncomputable def ReplayLedger.afterFreshPostActivation
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {hb : 1 ≤ b} {gp : Pos} {gh : History D (initialPos b) gp}
    {S : SweepState G gh} {firings : List Vertex}
    (L : ReplayLedger G gh S firings)
    {x t : Vertex} (ha : Action.select x ∈ legalActions D gp)
    (hnotS : actorAt D gp ≠ some Actor.shortener)
    (hroot : rootOfVertex? R N x = some t)
    (hphase : gp.phase = Phase.regular Player.prolonger)
    (hfresh : ¬RootActivated (N := N) gh t)
    (hnoDueNext : ¬DueMoveAvailable
      (S.afterMaximizing hb (Action.select x) ha hnotS)) :
    ReplayLedger G (.snoc gh (Action.select x) ha)
      (S.afterMaximizing hb (Action.select x) ha hnotS) firings := by
  classical
  have hactor : actorAt D gp = some Actor.prolonger :=
    actor_prolonger_of_legal_select_not_shortener_ledger ha hnotS
  have htData := rootOfVertex?_mem hroot
  have htR : t ∈ R := htData.1
  have hxCone : x ∈ rootCone N t := htData.2
  have hxLive : x ∈ liveLegal D gp.state :=
    select_mem_liveLegal_of_legal ha
  have htNotLog : t ∉ (gh.sweepLogs G).activated := by
    intro htLog
    exact hfresh ((gh.mem_sweepLogs_activated_iff G htR).mp htLog)
  have htNewPost : t ∉ (gh.sweepLogs G).post := by
    intro htPost
    exact htNotLog (by simp [SweepLogs.activated, htPost])
  have hpost :
      ((History.snoc gh (Action.select x) ha).sweepLogs G).post =
        (gh.sweepLogs G).post ++ [t] := by
    simp [History.sweepLogs, hactor, hroot, SweepLogs.recordActivation,
      htNotLog, hphase]
  have htLiveUnactivated : LiveUnactivatedCone G gh t :=
    ⟨htR, hfresh, x, hxLive, hxCone⟩
  have hphaseNext :
      (step D gp (Action.select x)).phase =
        Phase.regular Player.shortener := by
    simp [step, hphase]
  cases L.mode with
  | head hnil =>
      let P' := TailPairing.singleton N t firings.toFinset
      have hpostSingleton :
          ((History.snoc gh (Action.select x) ha).sweepLogs G).post = [t] := by
        rw [hpost, hnil]
        simp
      let Pcast := P'.castPost hpostSingleton.symm
      refine ⟨Pcast, LedgerMode.awaiting ?_ hphaseNext hnoDueNext⟩
      rw [hpostSingleton]
      simp
  | awaiting hne hphaseOld hnoDue =>
      exact False.elim (by simpa [hphase] using hphaseOld)
  | closed hclosed =>
      exact False.elim (hclosed t htLiveUnactivated)
  | credit C =>
      by_cases hnil : (gh.sweepLogs G).post = []
      · let P' := TailPairing.singleton N t firings.toFinset
        have hpostSingleton :
            ((History.snoc gh (Action.select x) ha).sweepLogs G).post = [t] := by
          rw [hpost, hnil]
          simp
        let Pcast := P'.castPost hpostSingleton.symm
        let C' : SweepCredit G (.snoc gh (Action.select x) ha) firings Pcast :=
          { root := C.root
            root_mem := C.root_mem
            root_fresh := by
              intro s hs
              rw [hpostSingleton] at hs
              simp at hs
            dominates := by
              intro s hs
              exact C.dominates (hs.before_snoc ha) }
        exact ⟨Pcast, LedgerMode.credit C'⟩
      · have hweight : rootWeight N t ≤ rootWeight N C.root :=
          C.dominates htLiveUnactivated
        let P' := L.pairing.snoc_of_nonempty hnil htNewPost C.root_mem
          C.root_fresh hweight
        let Pcast := P'.castPost hpost.symm
        refine ⟨Pcast, LedgerMode.awaiting ?_ hphaseNext hnoDueNext⟩
        rw [hpost]
        intro hnil'
        have htMem : t ∈ (gh.sweepLogs G).post ++ [t] := by simp
        rw [hnil'] at htMem
        simp at htMem

theorem regular_player_eq_prolonger_of_actor
    {D : Finset Vertex} {p : Pos} {who : Player}
    (hphase : p.phase = Phase.regular who)
    (hactor : actorAt D p = some Actor.prolonger) :
    who = Player.prolonger := by
  unfold actorAt at hactor
  split at hactor
  · contradiction
  · cases hstage : p.stage with
    | beforeErase => simp [hstage] at hactor
    | actorAction =>
        cases who with
        | prolonger => rfl
        | shortener => simp [hstage, hphase] at hactor

noncomputable def ReplayLedger.afterMaximizing
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {hb : 1 ≤ b} {gp : Pos} {gh : History D (initialPos b) gp}
    {S : SweepState G gh} {firings : List Vertex}
    (L : ReplayLedger G gh S firings)
    {a : Action} (ha : a ∈ legalActions D gp)
    (hnotS : actorAt D gp ≠ some Actor.shortener)
    (freshNoDue : ∀ {x t : Vertex}
      (hx : Action.select x ∈ legalActions D gp)
      (hroot : rootOfVertex? R N x = some t),
      ¬RootActivated (N := N) gh t →
        ¬DueMoveAvailable
          (S.afterMaximizing hb (Action.select x) hx hnotS)) :
    ReplayLedger G (.snoc gh a ha)
      (S.afterMaximizing hb a ha hnotS) firings := by
  classical
  cases a with
  | erase U =>
      apply L.afterMaximizing_samePost ha hnotS
      simp [History.sweepLogs]
  | pass =>
      apply L.afterMaximizing_samePost ha hnotS
      simp [History.sweepLogs]
  | endOpening =>
      apply L.afterMaximizing_samePost ha hnotS
      simp [History.sweepLogs]
  | select x =>
      have hactor : actorAt D gp = some Actor.prolonger :=
        actor_prolonger_of_legal_select_not_shortener_ledger ha hnotS
      cases hroot : rootOfVertex? R N x with
      | none =>
          apply L.afterMaximizing_samePost ha hnotS
          simp [History.sweepLogs, hactor, hroot]
      | some t =>
          have htR : t ∈ R := (rootOfVertex?_mem hroot).1
          cases hphase : gp.phase with
          | opening r =>
              apply L.afterMaximizing_samePost ha hnotS
              simp only [History.sweepLogs, hactor, hroot]
              by_cases htSeen : t ∈ (gh.sweepLogs G).activated
              · simp [SweepLogs.recordActivation, htSeen]
              · simp [SweepLogs.recordActivation, htSeen, hphase]
          | regular who =>
              have hwho := regular_player_eq_prolonger_of_actor hphase hactor
              subst who
              by_cases hfresh : RootActivated (N := N) gh t
              · have htSeen : t ∈ (gh.sweepLogs G).activated :=
                  (gh.mem_sweepLogs_activated_iff G htR).mpr hfresh
                apply L.afterMaximizing_samePost ha hnotS
                simp [History.sweepLogs, hactor, hroot,
                  SweepLogs.recordActivation, htSeen]
              · exact L.afterFreshPostActivation ha hnotS hroot hphase hfresh
                  (freshNoDue ha hroot hfresh)

def FreshActivationNoDueProperty
    {D R : Finset Vertex} {N b : ℕ} (G : SweepGeometry D R N)
    (hb : 1 ≤ b) : Prop :=
  ∀ {gp : Pos} (gh : History D (initialPos b) gp)
    (S : SweepState G gh) {x t : Vertex}
    (ha : Action.select x ∈ legalActions D gp)
    (hnotS : actorAt D gp ≠ some Actor.shortener)
    (hroot : rootOfVertex? R N x = some t),
    ¬RootActivated (N := N) gh t →
      ¬DueMoveAvailable
        (S.afterMaximizing hb (Action.select x) ha hnotS)

noncomputable def SweepReplay.toLedgerAssuming
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {hb : 1 ≤ b} (hfreshDue : FreshActivationNoDueProperty G hb)
    {gp : Pos} {gh : History D (initialPos b) gp}
    {S : SweepState G gh} {firings : List Vertex}
    (replay : SweepReplay G hb gh S firings) :
    ReplayLedger G gh S firings := by
  induction replay with
  | root =>
      exact
        { pairing := TailPairing.empty N ∅
          mode := LedgerMode.head (by simp [History.sweepLogs]) }
  | @maximizing gp gh S firings prev a ha hnotS ih =>
      apply ih.afterMaximizing ha hnotS
      intro x t hx hroot hfresh
      exact hfreshDue gh S hx hnotS hroot hfresh
  | @shortener gp gh S firings prev hs ih =>
      exact ih.afterShortener prev hs

noncomputable def SweepReplay.draftingDataAssuming
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {hb : 1 ≤ b} (hfreshDue : FreshActivationNoDueProperty G hb)
    {gp : Pos} {gh : History D (initialPos b) gp}
    {S : SweepState G gh} {firings : List Vertex}
    (replay : SweepReplay G hb gh S firings) : DraftingData N b R := by
  let ledger := replay.toLedgerAssuming hfreshDue
  have hnodup := gh.sweepLogs_activated_nodup G
  have hparts := List.nodup_append.mp hnodup
  have hmem := gh.sweepLogs_mem_roots G
  exact
    { opening := (gh.sweepLogs G).opening
      post := (gh.sweepLogs G).post
      fired := firings.toFinset
      opening_nodup := hparts.1
      post_nodup := hparts.2.1
      opening_post_disjoint := by
        intro t htOpen htPost
        exact hparts.2.2 t htOpen t htPost rfl
      opening_mem := hmem.1
      post_mem := hmem.2.1
      fired_subset := by
        intro t ht
        exact replay.firings_mem_roots t (List.mem_toFinset.mp ht)
      opening_length_le := gh.sweepLogs_opening_length_le G
      pairing := ledger.pairing }

noncomputable def SweepReplaySnapshot.draftingDataAssuming
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {hb : 1 ≤ b} (hfreshDue : FreshActivationNoDueProperty G hb)
    {gp : Pos} {gh : History D (initialPos b) gp}
    (snap : SweepReplaySnapshot G hb gh) : DraftingData N b R :=
  snap.replay.draftingDataAssuming hfreshDue

/-- The computed simultaneous maximizing successor satisfies the sole
fresh-activation chronology condition used by the ledger induction. -/
theorem freshActivationNoDueProperty
    {D R : Finset Vertex} {N b : ℕ} (G : SweepGeometry D R N)
    (hb : 1 ≤ b) : FreshActivationNoDueProperty G hb := by
  intro gp gh S x t ha hnotS hroot hfresh
  exact S.afterMaximizing_fresh_activation_noDue
    hb ha hnotS hroot hfresh

/-- Exact chronology ledger extracted from a computed sweep replay. -/
noncomputable def SweepReplay.toLedger
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {hb : 1 ≤ b}
    {gp : Pos} {gh : History D (initialPos b) gp}
    {S : SweepState G gh} {firings : List Vertex}
    (replay : SweepReplay G hb gh S firings) :
    ReplayLedger G gh S firings :=
  replay.toLedgerAssuming (freshActivationNoDueProperty G hb)

/-- The exact drafting data, including the firing-to-activation injection,
extracted from a computed sweep replay. -/
noncomputable def SweepReplay.draftingData
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {hb : 1 ≤ b}
    {gp : Pos} {gh : History D (initialPos b) gp}
    {S : SweepState G gh} {firings : List Vertex}
    (replay : SweepReplay G hb gh S firings) : DraftingData N b R :=
  replay.draftingDataAssuming (freshActivationNoDueProperty G hb)

/-- Snapshot form of the exact drafting-data extraction. -/
noncomputable def SweepReplaySnapshot.draftingData
    {D R : Finset Vertex} {N b : ℕ} {G : SweepGeometry D R N}
    {hb : 1 ≤ b}
    {gp : Pos} {gh : History D (initialPos b) gp}
    (snap : SweepReplaySnapshot G hb gh) : DraftingData N b R :=
  snap.replay.draftingData

end

end Erdos872R177

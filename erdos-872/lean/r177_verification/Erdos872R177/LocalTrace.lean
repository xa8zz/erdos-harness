import Erdos872R177.GameStrategies
import Erdos872R177.ConeOrder
import Erdos872R177.SweepAccounting

namespace Erdos872R177

open Finset

noncomputable section

/-! # Exact strategy-relative cone traces -/

def History.actions {D : Finset Vertex} {start p : Pos} :
    History D start p → List Action
  | .root => []
  | .snoc h a _ => h.actions ++ [a]

def History.scheduledActions {D : Finset Vertex} {start p : Pos} :
    History D start p → List (Option Actor × Action)
  | .root => []
  | @History.snoc _ _ q h a _ =>
      h.scheduledActions ++ [(actorAt D q, a)]

def History.totalScore {D : Finset Vertex} {start p : Pos} :
    History D start p → ℕ
  | .root => 0
  | .snoc h a _ => h.totalScore + score a

def openingSelectionIncrement (p : Pos) : Action → ℕ
  | .select _ => match p.phase with | .opening _ => 1 | .regular _ => 0
  | _ => 0

def History.openingSelections {D : Finset Vertex} {b : ℕ} {p : Pos} :
    History D (initialPos b) p → ℕ
  | .root => 0
  | @History.snoc _ _ q h a _ =>
      h.openingSelections + openingSelectionIncrement q a

def selectedVertices : List Action → List Vertex
  | [] => []
  | Action.select x :: as => x :: selectedVertices as
  | _ :: as => selectedVertices as

def erasurePayloads : List Action → List (Finset Vertex)
  | [] => []
  | Action.erase U :: as => U :: erasurePayloads as
  | _ :: as => erasurePayloads as

def scheduledSelectedVertices :
    List (Option Actor × Action) → List (Option Actor × Vertex)
  | [] => []
  | (who, Action.select x) :: as =>
      (who, x) :: scheduledSelectedVertices as
  | _ :: as => scheduledSelectedVertices as

def projectedConeSelections (t : ℕ) : List Action → List Vertex
  | [] => []
  | Action.select x :: as =>
      if t ∣ x then x / t :: projectedConeSelections t as
      else projectedConeSelections t as
  | _ :: as => projectedConeSelections t as

def projectedScheduledConeSelections (t : ℕ) :
    List (Option Actor × Action) → List (Option Actor × Vertex)
  | [] => []
  | (who, Action.select x) :: as =>
      if t ∣ x then
        (who, x / t) :: projectedScheduledConeSelections t as
      else projectedScheduledConeSelections t as
  | _ :: as => projectedScheduledConeSelections t as

lemma selectedVertices_append (as bs : List Action) :
    selectedVertices (as ++ bs) =
      selectedVertices as ++ selectedVertices bs := by
  induction as with
  | nil => rfl
  | cons a as ih => cases a <;> simp [selectedVertices, ih]

lemma erasurePayloads_append (as bs : List Action) :
    erasurePayloads (as ++ bs) =
      erasurePayloads as ++ erasurePayloads bs := by
  induction as with
  | nil => rfl
  | cons a as ih => cases a <;> simp [erasurePayloads, ih]

lemma scheduledSelectedVertices_append
    (as bs : List (Option Actor × Action)) :
    scheduledSelectedVertices (as ++ bs) =
      scheduledSelectedVertices as ++ scheduledSelectedVertices bs := by
  induction as with
  | nil => rfl
  | cons e as ih =>
      rcases e with ⟨who, a⟩
      cases a <;> simp [scheduledSelectedVertices, ih]

lemma projectedConeSelections_append (t : ℕ) (as bs : List Action) :
    projectedConeSelections t (as ++ bs) =
      projectedConeSelections t as ++ projectedConeSelections t bs := by
  induction as with
  | nil => rfl
  | cons a as ih =>
      cases a with
      | erase U => simp [projectedConeSelections, ih]
      | select x =>
          by_cases h : t ∣ x <;> simp [projectedConeSelections, ih, h]
      | pass => simp [projectedConeSelections, ih]
      | endOpening => simp [projectedConeSelections, ih]

lemma projectedScheduledConeSelections_append
    (t : ℕ) (as bs : List (Option Actor × Action)) :
    projectedScheduledConeSelections t (as ++ bs) =
      projectedScheduledConeSelections t as ++
        projectedScheduledConeSelections t bs := by
  induction as with
  | nil => rfl
  | cons e as ih =>
      rcases e with ⟨who, a⟩
      cases a with
      | erase U => simp [projectedScheduledConeSelections, ih]
      | select x =>
          by_cases h : t ∣ x <;>
            simp [projectedScheduledConeSelections, ih, h]
      | pass => simp [projectedScheduledConeSelections, ih]
      | endOpening => simp [projectedScheduledConeSelections, ih]

lemma select_not_legal_at_opening_zero
    {D : Finset Vertex} {p : Pos} {x : Vertex}
    (hphase : p.phase = Phase.opening 0) :
    Action.select x ∉ legalActions D p := by
  unfold legalActions
  split
  · simp
  · cases hstage : p.stage with
    | beforeErase =>
        unfold erasureActions
        simp
    | actorAction => simp [hphase]

lemma pass_not_legal_at_opening
    {D : Finset Vertex} {p : Pos} {r : ℕ}
    (hphase : p.phase = Phase.opening r) :
    Action.pass ∉ legalActions D p := by
  unfold legalActions
  split
  · simp
  · cases hstage : p.stage with
    | beforeErase =>
        simp only
        unfold erasureActions
        simp
    | actorAction => cases r <;> simp [hphase, selectionActions]

/-- While the public game remains in its opening phase, the number of opening
selections already made plus the remaining opening budget is exactly the
initial budget. -/
theorem History.opening_accounting
    {D : Finset Vertex} {b : ℕ} {p : Pos}
    (h : History D (initialPos b) p) {r : ℕ}
    (hphase : p.phase = Phase.opening r) :
    h.openingSelections + r = b := by
  induction h generalizing r with
  | root =>
      simp [initialPos] at hphase
      subst r
      simp [History.openingSelections]
  | @snoc q h a ha ih =>
      cases hq : q.phase with
      | opening s =>
          cases a with
          | erase U =>
              have hrs : s = r := by simpa [step, hq] using hphase
              subst r
              simpa [History.openingSelections, openingSelectionIncrement, hq]
                using ih hq
          | select x =>
              cases s with
              | zero => exact False.elim (select_not_legal_at_opening_zero hq ha)
              | succ s =>
                  have hrs : s = r := by simpa [step, hq] using hphase
                  subst r
                  have hprev := ih hq
                  simp [History.openingSelections, openingSelectionIncrement, hq]
                  omega
          | pass => simp [step] at hphase
          | endOpening => simp [step] at hphase
      | regular who =>
          cases who <;> cases a <;> simp [step, hq] at hphase

def unionAll : List (Finset Vertex) → Finset Vertex
  | [] => ∅
  | U :: rest => U ∪ unionAll rest

def principalUpset (Q : Finset Vertex) (q : Vertex) : Finset Vertex :=
  Q.filter fun m => q ∣ m

lemma principalUpset_isUpset (Q : Finset Vertex) (q : Vertex) :
    IsUpset Q (principalUpset Q q) := by
  constructor
  · intro m hm
    exact (Finset.mem_filter.mp hm).1
  · intro x hx y hy hxy
    exact Finset.mem_filter.mpr
      ⟨hy, (Finset.mem_filter.mp hx).2.trans hxy⟩

theorem external_selection_projection_exact
    {r t m : ℕ} (ht : 0 < t) (hout : ¬t ∣ r) :
    Comparable r (t * m) ↔ r / Nat.gcd r t ∣ m := by
  have hgcd : 0 < Nat.gcd r t := Nat.gcd_pos_of_pos_right r ht
  rw [Comparable]
  constructor
  · rintro (hr | hback)
    · exact (Erdos872.coneProjection_external hgcd).mp hr
    · exact False.elim (hout ((dvd_mul_right t m).trans hback))
  · intro h
    exact Or.inl ((Erdos872.coneProjection_external hgcd).mpr h)

theorem projected_global_upset_isUpset
    {D U : Finset Vertex} {N t : ℕ}
    (hU : IsUpset D U) (ht : 0 < t) :
    IsUpset (Erdos872.quotientCone D N t)
      (Erdos872.quotientCone U N t) := by
  have hU' : Erdos872.DivUpsetIn D U := by
    constructor
    · exact hU.1
    · intro x y hx hy hxy
      exact hU.2 x hx y hy hxy
  have hp := Erdos872.quotientCone_projected_upset
    (N := N) (t := t) hU' ht
  exact ⟨hp.1, fun _ hx _ hy hxy => hp.2 hx hy hxy⟩

def actionDisturbances
    (D : Finset Vertex) (N t : ℕ) : Action → List (Finset Vertex)
  | Action.erase U => [Erdos872.quotientCone U N t]
  | Action.select r =>
      if t ∣ r then [] else
        [principalUpset (Erdos872.quotientCone D N t)
          (r / Nat.gcd r t)]
  | _ => []

def projectedDisturbances
    (D : Finset Vertex) (N t : ℕ) (as : List Action) :
    List (Finset Vertex) := as.flatMap (actionDisturbances D N t)

theorem legal_erasure_isUpset
    {D : Finset Vertex} {p : Pos} {U : Finset Vertex}
    (ha : Action.erase U ∈ legalActions D p) : IsUpset D U := by
  unfold legalActions at ha
  split at ha
  · simp at ha
  · cases hstage : p.stage with
    | beforeErase =>
        simp only [hstage] at ha
        unfold erasureActions at ha
        simp only [Finset.mem_image] at ha
        rcases ha with ⟨V, hV, hEq⟩
        cases hEq
        have hV' : U ∈ D.powerset ∧ IsUpset D U := by
          simpa [globalUpsets] using hV
        exact hV'.2
    | actorAction =>
        simp only [hstage] at ha
        cases hphase : p.phase with
        | opening r => cases r <;> simp [hphase, selectionActions] at ha
        | regular who => cases who <;> simp [hphase, selectionActions] at ha

theorem actionDisturbances_are_upsets
    {D : Finset Vertex} {N t : ℕ} (ht : 0 < t)
    {p : Pos} {a : Action} (ha : a ∈ legalActions D p) :
    ∀ U ∈ actionDisturbances D N t a,
      IsUpset (Erdos872.quotientCone D N t) U := by
  intro U hU
  cases a with
  | erase W =>
      simp only [actionDisturbances, List.mem_singleton] at hU
      subst U
      exact projected_global_upset_isUpset (legal_erasure_isUpset ha) ht
  | select r =>
      by_cases hin : t ∣ r
      · simp [actionDisturbances, hin] at hU
      · simp only [actionDisturbances, hin, if_false, List.mem_singleton] at hU
        subst U
        exact principalUpset_isUpset _ _
  | pass => simp [actionDisturbances] at hU
  | endOpening => simp [actionDisturbances] at hU

structure OpeningScan where
  count : ℕ
  closed : Bool
deriving DecidableEq

def openingScanStep (t : ℕ) (s : OpeningScan)
    (e : Option Actor × Action) : OpeningScan :=
  if s.closed then s else
    match e with
    | (some Actor.shortener, Action.select x) =>
        if t ∣ x then ⟨s.count, true⟩ else s
    | (some Actor.prolonger, Action.select x) =>
        if t ∣ x then ⟨s.count + 1, false⟩ else s
    | _ => s

def openingScan (t : ℕ) (as : List (Option Actor × Action)) : OpeningScan :=
  as.foldl (openingScanStep t) ⟨0, false⟩

def projectedOpeningCount (t : ℕ)
    (as : List (Option Actor × Action)) : ℕ :=
  (openingScan t as).count

lemma openingScan_append (t : ℕ) (as bs : List (Option Actor × Action)) :
    openingScan t (as ++ bs) =
      bs.foldl (openingScanStep t) (openingScan t as) := by
  simp [openingScan, List.foldl_append]

inductive OpeningTally (b : ℕ)
  | during0 (k : ℕ)
  | during1 (k : ℕ)
  | later1
  | later2

def OpeningTally.count {b : ℕ} : OpeningTally b → ℕ
  | .during0 k => k
  | .during1 k => k + 1
  | .later1 => 1
  | .later2 => 2

/-- Operational status of one projected cone.  No inequality is stored in a
completed trace: the only possible tallies are produced by these concrete
states and the transition constructors below. -/
inductive LocalMode (b : ℕ)
  | openingDormant
  | openingActive (k : ℕ)
  | postDormant
  | waitingFirst (c : OpeningTally b)
  | responseDueFirst (c : OpeningTally b)
  | running (c : OpeningTally b)
  | responseDueLater (c : OpeningTally b)
  | deadFirst (c : OpeningTally b)
  | deadLater (c : OpeningTally b)

def LocalMode.count {b : ℕ} : LocalMode b → ℕ
  | .openingDormant => 0
  | .openingActive k => k
  | .postDormant => 0
  | .waitingFirst c => c.count
  | .responseDueFirst c => c.count
  | .running c => c.count
  | .responseDueLater c => c.count
  | .deadFirst c => c.count
  | .deadLater c => c.count

def LocalMode.firstResponseSeen {b : ℕ} : LocalMode b → Bool
  | .running _ | .responseDueLater _ | .deadLater _ => true
  | _ => false

def LocalMode.tally? {b : ℕ} : LocalMode b → Option (OpeningTally b)
  | .openingDormant | .postDormant => none
  | .openingActive k => some (.during0 k)
  | .waitingFirst c | .responseDueFirst c | .running c |
      .responseDueLater c | .deadFirst c | .deadLater c => some c

def LocalMode.responseDue {b : ℕ} : LocalMode b → Prop
  | .responseDueFirst _ | .responseDueLater _ => True
  | _ => False

def OpeningTally.baseOpeningCount {b : ℕ} : OpeningTally b → ℕ
  | .during0 k | .during1 k => k
  | .later1 | .later2 => 0

def LocalMode.baseOpeningCount {b : ℕ} : LocalMode b → ℕ
  | .openingDormant | .postDormant => 0
  | .openingActive k => k
  | .waitingFirst c | .responseDueFirst c | .running c |
      .responseDueLater c | .deadFirst c | .deadLater c => c.baseOpeningCount

/-- Strong opening-budget invariant.  While global opening is live it retains
the unused budget explicitly; afterward it retains the number of cone moves
made during that opening. -/
def OperationalBudget {b : ℕ} (gp : Pos) : LocalMode b → Prop
  | .openingDormant =>
      ∃ r, gp.phase = Phase.opening r ∧ r ≤ b
  | .openingActive k =>
      ∃ r, gp.phase = Phase.opening r ∧ k + r ≤ b
  | .postDormant => True
  | .waitingFirst c | .responseDueFirst c | .running c |
      .responseDueLater c | .deadFirst c | .deadLater c =>
      c.baseOpeningCount ≤ b

lemma OperationalBudget.after_erase
    {D : Finset Vertex} {b : ℕ} {gp : Pos} {mode : LocalMode b}
    {U : Finset Vertex} (h : OperationalBudget gp mode) :
    OperationalBudget (step D gp (Action.erase U)) mode := by
  cases mode <;> simp only [OperationalBudget, step] at h ⊢ <;> exact h

lemma OperationalBudget.after_select_same_mode
    {D : Finset Vertex} {b : ℕ} {gp : Pos} {mode : LocalMode b}
    {x : Vertex} (h : OperationalBudget gp mode)
    (ha : Action.select x ∈ legalActions D gp) :
    OperationalBudget (step D gp (Action.select x)) mode := by
  cases mode with
  | openingDormant =>
      rcases h with ⟨r, hphase, hr⟩
      cases r with
      | zero => exact False.elim (select_not_legal_at_opening_zero hphase ha)
      | succ r => exact ⟨r, by simp [step, hphase], by omega⟩
  | openingActive k =>
      rcases h with ⟨r, hphase, hr⟩
      cases r with
      | zero => exact False.elim (select_not_legal_at_opening_zero hphase ha)
      | succ r => exact ⟨r, by simp [step, hphase], by omega⟩
  | postDormant => trivial
  | waitingFirst c => exact h
  | responseDueFirst c => exact h
  | running c => exact h
  | responseDueLater c => exact h
  | deadFirst c => exact h
  | deadLater c => exact h

lemma OperationalBudget.after_pass
    {D : Finset Vertex} {b : ℕ} {gp : Pos} {mode : LocalMode b}
    (h : OperationalBudget gp mode)
    (ha : Action.pass ∈ legalActions D gp) :
    OperationalBudget (step D gp Action.pass) mode := by
  cases mode with
  | openingDormant =>
      rcases h with ⟨r, hphase, hr⟩
      exact False.elim (pass_not_legal_at_opening hphase ha)
  | openingActive k =>
      rcases h with ⟨r, hphase, hr⟩
      exact False.elim (pass_not_legal_at_opening hphase ha)
  | postDormant => trivial
  | waitingFirst c => exact h
  | responseDueFirst c => exact h
  | running c => exact h
  | responseDueLater c => exact h
  | deadFirst c => exact h
  | deadLater c => exact h

def FollowsLocalMinimizer
    {D : Finset Vertex} {start p : Pos} :
    History D start p → Prop
  | .root => True
  | @History.snoc _ _ q h a _ =>
      FollowsLocalMinimizer h ∧
        ∀ _hs : actorAt D q = some Actor.shortener,
          score a + gameValue D (step D q a) = gameValue D q

def FollowsShortenerStrategy
    {D : Finset Vertex} {start p : Pos}
    (sigma : Strategy Actor.shortener D start) :
    History D start p → Prop
  | .root => True
  | @History.snoc _ _ q h a _ =>
      FollowsShortenerStrategy sigma h ∧
        ∀ hs : actorAt D q = some Actor.shortener,
          a = (sigma h hs).1

theorem followsOptimalShortener_implies_minimizer
    {D : Finset Vertex} {start p : Pos}
    (h : History D start p)
    (hf : FollowsShortenerStrategy
      (optimalShortener (D := D) (start := start)) h) :
    FollowsLocalMinimizer h := by
  induction h with
  | root => trivial
  | @snoc q h a ha ih =>
      rcases hf with ⟨hf, haction⟩
      refine ⟨ih hf, ?_⟩
      intro hs
      rw [haction hs]
      exact optimalShortener_bellman h hs

inductive LegalRun (D : Finset Vertex) : Pos → List Action → Pos → Type
  | nil (p : Pos) : LegalRun D p [] p
  | cons {p q : Pos} {a : Action} {as : List Action}
      (ha : a ∈ legalActions D p)
      (tail : LegalRun D (step D p a) as q) :
      LegalRun D p (a :: as) q

def LegalRun.appendHistory
    {D : Finset Vertex} {start p q : Pos} {as : List Action}
    (run : LegalRun D p as q) (h : History D start p) :
    History D start q :=
  match run with
  | .nil _ => h
  | .cons ha tail => tail.appendHistory (.snoc h _ ha)

def LegalRun.scheduledActions
    {D : Finset Vertex} {p q : Pos} {as : List Action} :
    LegalRun D p as q → List (Option Actor × Action)
  | .nil _ => []
  | @LegalRun.cons _ p _ a _ _ tail =>
      (actorAt D p, a) :: tail.scheduledActions

theorem LegalRun.actions_appendHistory
    {D : Finset Vertex} {start p q : Pos} {as : List Action}
    (run : LegalRun D p as q) (h : History D start p) :
    (run.appendHistory h).actions = h.actions ++ as := by
  induction run generalizing start with
  | nil => simp [LegalRun.appendHistory]
  | @cons p q a as ha tail ih =>
      rw [LegalRun.appendHistory, ih]
      simp [History.actions, List.append_assoc]

theorem LegalRun.scheduledActions_appendHistory
    {D : Finset Vertex} {start p q : Pos} {as : List Action}
    (run : LegalRun D p as q) (h : History D start p) :
    (run.appendHistory h).scheduledActions =
      h.scheduledActions ++ run.scheduledActions := by
  induction run generalizing start with
  | nil => simp [LegalRun.appendHistory, LegalRun.scheduledActions]
  | @cons p q a as ha tail ih =>
      rw [LegalRun.appendHistory, ih]
      simp [History.scheduledActions, LegalRun.scheduledActions,
        List.append_assoc]

def quotientLive (D : Finset Vertex) (N t : ℕ) (p : Pos) : Finset Vertex :=
  Erdos872.quotientCone (liveLegal D p.state) N t

def effectiveLocalLive
    (Q : Finset Vertex) (p : Pos) (pending : List (Finset Vertex)) :
    Finset Vertex := liveLegal Q p.state \ unionAll pending

/-- The effective live set at a history endpoint.  Mentioning the history in
the term keeps the endpoint index definitionally tied to that history in
dependent constructors. -/
abbrev HistoryEffectiveLocalLive
    {Q : Finset Vertex} {start p : Pos}
    (_h : History Q start p) (pending : List (Finset Vertex)) :
    Finset Vertex := effectiveLocalLive Q p pending

def LiveCorresponds
    (D : Finset Vertex) (N t : ℕ) (globalPos localPos : Pos)
    (pending : List (Finset Vertex)) : Prop :=
  quotientLive D N t globalPos =
    effectiveLocalLive (Erdos872.quotientCone D N t) localPos pending

/-- History-indexed notation retained for constructor readability.  The
invariant itself depends only on the two history endpoints. -/
abbrev HistoryLiveCorresponds
    {D : Finset Vertex} {N t b : ℕ} {gp lp : Pos}
    (_gh : History D (initialPos b) gp)
    (_lh : History (Erdos872.quotientCone D N t) (initialPos (b + 1)) lp)
    (pending : List (Finset Vertex)) : Prop :=
  LiveCorresponds D N t gp lp pending

lemma select_mem_liveLegal_of_legal
    {D : Finset Vertex} {p : Pos} {x : Vertex}
    (ha : Action.select x ∈ legalActions D p) : x ∈ liveLegal D p.state := by
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

lemma liveLegal_eraseState_eq_sdiff
    (D : Finset Vertex) (s : CoreState) (U : Finset Vertex) :
    liveLegal D (eraseState D s U) = liveLegal D s \ U := by
  ext x
  simp only [liveLegal, eraseState, Finset.mem_filter, Finset.mem_sdiff,
    Finset.mem_union, Finset.mem_inter]
  tauto

lemma liveLegal_selectState_iff
    (D : Finset Vertex) (s : CoreState) (x y : Vertex) :
    y ∈ liveLegal D (selectState s x) ↔
      y ∈ liveLegal D s ∧ ¬Comparable y x := by
  simp only [liveLegal, selectState, Finset.mem_filter, Finset.mem_insert]
  constructor
  · rintro ⟨hyD, hySel, hyErase, hyComp⟩
    refine ⟨⟨hyD, ?_, hyErase, ?_⟩, hyComp x (Or.inl rfl)⟩
    · exact fun hy => hySel (Or.inr hy)
    · exact fun z hz => hyComp z (Or.inr hz)
  · rintro ⟨⟨hyD, hySel, hyErase, hyComp⟩, hyx⟩
    refine ⟨hyD, ?_, hyErase, ?_⟩
    · rintro (rfl | hy)
      · exact hyx (Or.inl dvd_rfl)
      · exact hySel hy
    · intro z hz
      rcases hz with rfl | hz
      · exact hyx
      · exact hyComp z hz

lemma step_select_state (D : Finset Vertex) (p : Pos) (x : Vertex) :
    (step D p (Action.select x)).state = selectState p.state x := by
  rcases p with ⟨phase, stage, state⟩
  cases phase with
  | opening r => cases r <;> rfl
  | regular who => cases who <;> rfl

theorem LiveCorresponds.after_inside_select
    {D : Finset Vertex} {N t : ℕ} {gp lp : Pos}
    {pending : List (Finset Vertex)} {m : Vertex}
    (ht : 0 < t) (hcorr : LiveCorresponds D N t gp lp pending) :
    LiveCorresponds D N t
      (step D gp (Action.select (t * m)))
      (step (Erdos872.quotientCone D N t)
        (step (Erdos872.quotientCone D N t) lp
          (Action.erase (unionAll pending)))
        (Action.select m)) [] := by
  let Q := Erdos872.quotientCone D N t
  ext q
  have hcomp : Comparable (t * q) (t * m) ↔ Comparable q m := by
    simp only [Comparable, Erdos872.quotientCone_internal_dvd ht]
  have hglobal :
      q ∈ quotientLive D N t (step D gp (Action.select (t * m))) ↔
        q ∈ quotientLive D N t gp ∧ ¬Comparable q m := by
    unfold quotientLive Erdos872.quotientCone
    rw [step_select_state]
    simp only [Finset.mem_filter, liveLegal_selectState_iff]
    tauto
  have hlocal :
      q ∈ effectiveLocalLive Q
          (step Q (step Q lp (Action.erase (unionAll pending)))
            (Action.select m)) [] ↔
        q ∈ effectiveLocalLive Q lp pending ∧ ¬Comparable q m := by
    simp only [effectiveLocalLive, unionAll, Finset.sdiff_empty]
    rw [step_select_state]
    change q ∈ liveLegal Q
      (selectState (eraseState Q lp.state (unionAll pending)) m) ↔ _
    rw [liveLegal_selectState_iff, liveLegal_eraseState_eq_sdiff]
  rw [hglobal, hlocal, Finset.ext_iff.mp hcorr q]

theorem initial_live_corresponds (D : Finset Vertex) (N t b : ℕ) :
    LiveCorresponds D N t (initialPos b) (initialPos (b + 1)) [] := by
  ext m
  simp [quotientLive, effectiveLocalLive, unionAll,
    Erdos872.quotientCone, initialPos, emptyState, liveLegal]

/-!
`SweepTrace` is the exact dependent projector.  Its global and local prefixes
are indices.  Event-shaped constructors record each scheduling case, while
the exported builders below certify the corresponding local legal runs,
fixed-strategy actions, endpoint stage, and live-set correspondence.
-/

inductive SweepTrace (D : Finset Vertex) (N t b : ℕ) :
    {gp : Pos} → History D (initialPos b) gp →
    {lp : Pos} → History (Erdos872.quotientCone D N t)
      (initialPos (b + 1)) lp →
    List (List (Finset Vertex)) → List (Finset Vertex) → LocalMode b → Type
  | root : SweepTrace D N t b .root .root [] [] .openingDormant
  | erase {gp lp : Pos} {gh lh batches pending mode U}
      (prev : SweepTrace D N t b gh lh batches pending mode)
      (ha : Action.erase U ∈ legalActions D gp)
      (hpreserve : HistoryLiveCorresponds (N := N) (t := t) (b := b) gh lh pending →
        HistoryLiveCorresponds (N := N) (t := t) (b := b) (.snoc gh _ ha) lh
          (pending ++ [Erdos872.quotientCone U N t])) :
      SweepTrace D N t b (.snoc gh _ ha) lh batches
        (pending ++ [Erdos872.quotientCone U N t]) mode
  | externalSelect {gp lp : Pos} {gh lh batches pending mode r}
      (prev : SweepTrace D N t b gh lh batches pending mode)
      (ha : Action.select r ∈ legalActions D gp) (hout : ¬t ∣ r)
      (hnotDue : actorAt D gp = some Actor.shortener → ¬mode.responseDue)
      (hpreserve : HistoryLiveCorresponds (N := N) (t := t) (b := b) gh lh pending →
        HistoryLiveCorresponds (N := N) (t := t) (b := b) (.snoc gh _ ha) lh
          (pending ++ [principalUpset (Erdos872.quotientCone D N t)
            (r / Nat.gcd r t)])) :
      SweepTrace D N t b (.snoc gh _ ha) lh batches
        (pending ++ [principalUpset (Erdos872.quotientCone D N t)
          (r / Nat.gcd r t)]) mode
  | externalSelectTerminalFirst {gp lp : Pos}
      {gh : History D (initialPos b) gp}
      {lh : History (Erdos872.quotientCone D N t)
        (initialPos (b + 1)) lp}
      {batches pending c r}
      (prev : SweepTrace D N t b gh lh batches pending (.responseDueFirst c))
      (ha : Action.select r ∈ legalActions D gp) (hout : ¬t ∣ r)
      (hactor : actorAt D gp = some Actor.shortener)
      (hterminal :
        HistoryEffectiveLocalLive lh pending = ∅)
      (hpreserve : HistoryLiveCorresponds (N := N) (t := t) (b := b) gh lh pending →
        HistoryLiveCorresponds (N := N) (t := t) (b := b) (.snoc gh _ ha) lh
          (pending ++ [principalUpset (Erdos872.quotientCone D N t)
            (r / Nat.gcd r t)])) :
      SweepTrace D N t b (.snoc gh _ ha) lh batches
        (pending ++ [principalUpset (Erdos872.quotientCone D N t)
          (r / Nat.gcd r t)]) (.deadFirst c)
  | externalSelectTerminalLater {gp lp : Pos}
      {gh : History D (initialPos b) gp}
      {lh : History (Erdos872.quotientCone D N t)
        (initialPos (b + 1)) lp}
      {batches pending c r}
      (prev : SweepTrace D N t b gh lh batches pending (.responseDueLater c))
      (ha : Action.select r ∈ legalActions D gp) (hout : ¬t ∣ r)
      (hactor : actorAt D gp = some Actor.shortener)
      (hterminal :
        HistoryEffectiveLocalLive lh pending = ∅)
      (hpreserve : HistoryLiveCorresponds (N := N) (t := t) (b := b) gh lh pending →
        HistoryLiveCorresponds (N := N) (t := t) (b := b) (.snoc gh _ ha) lh
          (pending ++ [principalUpset (Erdos872.quotientCone D N t)
            (r / Nat.gcd r t)])) :
      SweepTrace D N t b (.snoc gh _ ha) lh batches
        (pending ++ [principalUpset (Erdos872.quotientCone D N t)
          (r / Nat.gcd r t)]) (.deadLater c)
  | pass {gp lp : Pos} {gh lh batches pending mode}
      (prev : SweepTrace D N t b gh lh batches pending mode)
      (ha : Action.pass ∈ legalActions D gp)
      (hpreserve : HistoryLiveCorresponds (N := N) (t := t) (b := b) gh lh pending →
        HistoryLiveCorresponds (N := N) (t := t) (b := b) (.snoc gh _ ha) lh pending) :
      SweepTrace D N t b (.snoc gh _ ha) lh batches pending mode
  | endOpeningDormant {gp lp : Pos} {gh lh batches pending}
      (prev : SweepTrace D N t b gh lh batches pending .openingDormant)
      (ha : Action.endOpening ∈ legalActions D gp)
      (hpreserve : HistoryLiveCorresponds (N := N) (t := t) (b := b) gh lh pending →
        HistoryLiveCorresponds (N := N) (t := t) (b := b) (.snoc gh _ ha) lh pending) :
      SweepTrace D N t b (.snoc gh _ ha) lh batches pending .postDormant
  | endOpeningActive {gp lp : Pos} {gh lh batches pending k}
      (prev : SweepTrace D N t b gh lh batches pending (.openingActive k))
      (ha : Action.endOpening ∈ legalActions D gp)
      (hpreserve : HistoryLiveCorresponds (N := N) (t := t) (b := b) gh lh pending →
        HistoryLiveCorresponds (N := N) (t := t) (b := b) (.snoc gh _ ha) lh pending) :
      SweepTrace D N t b (.snoc gh _ ha) lh batches pending
        (.waitingFirst (.during0 k))
  | insideProlongerOpeningFirst {gp lp lp' : Pos} {gh lh batches pending m r}
      (prev : SweepTrace D N t b gh lh batches pending .openingDormant)
      (ha : Action.select (t * m) ∈ legalActions D gp)
      (hactor : actorAt D gp = some Actor.prolonger)
      (hphase : gp.phase = Phase.opening (r + 1))
      (run : LegalRun (Erdos872.quotientCone D N t) lp
        [Action.erase (unionAll pending), Action.select m] lp')
      (hstage : lp'.stage = Stage.beforeErase)
      (hfixed : FollowsShortenerStrategy optimalShortener lh →
        FollowsShortenerStrategy optimalShortener (run.appendHistory lh))
      (hpreserve : HistoryLiveCorresponds (N := N) (t := t) (b := b) gh lh pending →
        HistoryLiveCorresponds (N := N) (t := t) (b := b)
          (.snoc gh _ ha) (run.appendHistory lh) []) :
      SweepTrace D N t b (.snoc gh _ ha) (run.appendHistory lh)
        (batches ++ [pending]) [] (.openingActive 1)
  | insideProlongerOpeningMore {gp lp lp' : Pos}
      {gh lh batches pending m k r}
      (prev : SweepTrace D N t b gh lh batches pending (.openingActive k))
      (ha : Action.select (t * m) ∈ legalActions D gp)
      (hactor : actorAt D gp = some Actor.prolonger)
      (hphase : gp.phase = Phase.opening (r + 1))
      (run : LegalRun (Erdos872.quotientCone D N t) lp
        [Action.erase (unionAll pending), Action.select m] lp')
      (hstage : lp'.stage = Stage.beforeErase)
      (hfixed : FollowsShortenerStrategy optimalShortener lh →
        FollowsShortenerStrategy optimalShortener (run.appendHistory lh))
      (hpreserve : HistoryLiveCorresponds (N := N) (t := t) (b := b) gh lh pending →
        HistoryLiveCorresponds (N := N) (t := t) (b := b)
          (.snoc gh _ ha) (run.appendHistory lh) []) :
      SweepTrace D N t b (.snoc gh _ ha) (run.appendHistory lh)
        (batches ++ [pending]) [] (.openingActive (k + 1))
  | insideProlongerAfterFirst {gp lp lp' : Pos} {gh lh batches pending m}
      (prev : SweepTrace D N t b gh lh batches pending .postDormant)
      (ha : Action.select (t * m) ∈ legalActions D gp)
      (hactor : actorAt D gp = some Actor.prolonger)
      (run : LegalRun (Erdos872.quotientCone D N t) lp
        [Action.erase (unionAll pending), Action.select m] lp')
      (hstage : lp'.stage = Stage.beforeErase)
      (hfixed : FollowsShortenerStrategy optimalShortener lh →
        FollowsShortenerStrategy optimalShortener (run.appendHistory lh))
      (hpreserve : HistoryLiveCorresponds (N := N) (t := t) (b := b) gh lh pending →
        HistoryLiveCorresponds (N := N) (t := t) (b := b)
          (.snoc gh _ ha) (run.appendHistory lh) []) :
      SweepTrace D N t b (.snoc gh _ ha) (run.appendHistory lh)
        (batches ++ [pending]) [] (.waitingFirst .later1)
  | insideProlongerReturnOpening {gp lp lp' : Pos}
      {gh lh batches pending m k}
      (prev : SweepTrace D N t b gh lh batches pending
        (.waitingFirst (.during0 k)))
      (ha : Action.select (t * m) ∈ legalActions D gp)
      (hactor : actorAt D gp = some Actor.prolonger)
      (run : LegalRun (Erdos872.quotientCone D N t) lp
        [Action.erase (unionAll pending), Action.select m] lp')
      (hstage : lp'.stage = Stage.beforeErase)
      (hfixed : FollowsShortenerStrategy optimalShortener lh →
        FollowsShortenerStrategy optimalShortener (run.appendHistory lh))
      (hpreserve : HistoryLiveCorresponds (N := N) (t := t) (b := b) gh lh pending →
        HistoryLiveCorresponds (N := N) (t := t) (b := b)
          (.snoc gh _ ha) (run.appendHistory lh) []) :
      SweepTrace D N t b (.snoc gh _ ha) (run.appendHistory lh)
        (batches ++ [pending]) [] (.responseDueFirst (.during1 k))
  | insideProlongerReturnLater {gp lp lp' : Pos} {gh lh batches pending m}
      (prev : SweepTrace D N t b gh lh batches pending
        (.waitingFirst .later1))
      (ha : Action.select (t * m) ∈ legalActions D gp)
      (hactor : actorAt D gp = some Actor.prolonger)
      (run : LegalRun (Erdos872.quotientCone D N t) lp
        [Action.erase (unionAll pending), Action.select m] lp')
      (hstage : lp'.stage = Stage.beforeErase)
      (hfixed : FollowsShortenerStrategy optimalShortener lh →
        FollowsShortenerStrategy optimalShortener (run.appendHistory lh))
      (hpreserve : HistoryLiveCorresponds (N := N) (t := t) (b := b) gh lh pending →
        HistoryLiveCorresponds (N := N) (t := t) (b := b)
          (.snoc gh _ ha) (run.appendHistory lh) []) :
      SweepTrace D N t b (.snoc gh _ ha) (run.appendHistory lh)
        (batches ++ [pending]) [] (.responseDueFirst .later2)
  | insideProlongerLater {gp lp lp' : Pos} {gh lh batches pending m c}
      (prev : SweepTrace D N t b gh lh batches pending (.running c))
      (ha : Action.select (t * m) ∈ legalActions D gp)
      (hactor : actorAt D gp = some Actor.prolonger)
      (run : LegalRun (Erdos872.quotientCone D N t) lp
        [Action.erase (unionAll pending), Action.select m] lp')
      (hstage : lp'.stage = Stage.beforeErase)
      (hfixed : FollowsShortenerStrategy optimalShortener lh →
        FollowsShortenerStrategy optimalShortener (run.appendHistory lh))
      (hpreserve : HistoryLiveCorresponds (N := N) (t := t) (b := b) gh lh pending →
        HistoryLiveCorresponds (N := N) (t := t) (b := b)
          (.snoc gh _ ha) (run.appendHistory lh) []) :
      SweepTrace D N t b (.snoc gh _ ha) (run.appendHistory lh)
        (batches ++ [pending]) [] (.responseDueLater c)
  | firstInsideShortenerWaiting {gp lp lp' : Pos}
      {gh lh batches pending m c}
      (prev : SweepTrace D N t b gh lh batches pending (.waitingFirst c))
      (ha : Action.select (t * m) ∈ legalActions D gp)
      (hactor : actorAt D gp = some Actor.shortener)
      (run : LegalRun (Erdos872.quotientCone D N t) lp
        [Action.erase (unionAll pending), Action.endOpening,
          Action.erase ∅, Action.select m] lp')
      (hstage : lp'.stage = Stage.beforeErase)
      (hfixed : FollowsShortenerStrategy optimalShortener lh →
        FollowsShortenerStrategy optimalShortener (run.appendHistory lh))
      (hpreserve : HistoryLiveCorresponds (N := N) (t := t) (b := b) gh lh pending →
        HistoryLiveCorresponds (N := N) (t := t) (b := b)
          (.snoc gh _ ha) (run.appendHistory lh) []) :
      SweepTrace D N t b (.snoc gh _ ha) (run.appendHistory lh)
        (batches ++ [pending, []]) [] (.running c)
  | firstInsideShortenerDue {gp lp lp' : Pos}
      {gh lh batches pending m c}
      (prev : SweepTrace D N t b gh lh batches pending (.responseDueFirst c))
      (ha : Action.select (t * m) ∈ legalActions D gp)
      (hactor : actorAt D gp = some Actor.shortener)
      (run : LegalRun (Erdos872.quotientCone D N t) lp
        [Action.erase (unionAll pending), Action.endOpening,
          Action.erase ∅, Action.select m] lp')
      (hstage : lp'.stage = Stage.beforeErase)
      (hfixed : FollowsShortenerStrategy optimalShortener lh →
        FollowsShortenerStrategy optimalShortener (run.appendHistory lh))
      (hpreserve : HistoryLiveCorresponds (N := N) (t := t) (b := b) gh lh pending →
        HistoryLiveCorresponds (N := N) (t := t) (b := b)
          (.snoc gh _ ha) (run.appendHistory lh) []) :
      SweepTrace D N t b (.snoc gh _ ha) (run.appendHistory lh)
        (batches ++ [pending, []]) [] (.running c)
  | laterInsideShortenerDirect {gp lp lp' : Pos}
      {gh lh batches pending m c}
      (prev : SweepTrace D N t b gh lh batches pending (.responseDueLater c))
      (ha : Action.select (t * m) ∈ legalActions D gp)
      (hactor : actorAt D gp = some Actor.shortener)
      (run : LegalRun (Erdos872.quotientCone D N t) lp
        [Action.erase (unionAll pending), Action.select m] lp')
      (hstage : lp'.stage = Stage.beforeErase)
      (hfixed : FollowsShortenerStrategy optimalShortener lh →
        FollowsShortenerStrategy optimalShortener (run.appendHistory lh))
      (hpreserve : HistoryLiveCorresponds (N := N) (t := t) (b := b) gh lh pending →
        HistoryLiveCorresponds (N := N) (t := t) (b := b)
          (.snoc gh _ ha) (run.appendHistory lh) []) :
      SweepTrace D N t b (.snoc gh _ ha) (run.appendHistory lh)
        (batches ++ [pending]) [] (.running c)
  | laterInsideShortenerAdvance {gp lp lp' : Pos}
      {gh lh batches pending m c}
      (prev : SweepTrace D N t b gh lh batches pending (.running c))
      (ha : Action.select (t * m) ∈ legalActions D gp)
      (hactor : actorAt D gp = some Actor.shortener)
      (run : LegalRun (Erdos872.quotientCone D N t) lp
        [Action.erase (unionAll pending), Action.pass,
          Action.erase ∅, Action.select m] lp')
      (hstage : lp'.stage = Stage.beforeErase)
      (hfixed : FollowsShortenerStrategy optimalShortener lh →
        FollowsShortenerStrategy optimalShortener (run.appendHistory lh))
      (hpreserve : HistoryLiveCorresponds (N := N) (t := t) (b := b) gh lh pending →
        HistoryLiveCorresponds (N := N) (t := t) (b := b)
          (.snoc gh _ ha) (run.appendHistory lh) []) :
      SweepTrace D N t b (.snoc gh _ ha) (run.appendHistory lh)
        (batches ++ [pending, []]) [] (.running c)

theorem SweepTrace.live_corresponds
    {D : Finset Vertex} {N t b : ℕ}
    {gp lp : Pos} {gh : History D (initialPos b) gp}
    {lh : History (Erdos872.quotientCone D N t) (initialPos (b + 1)) lp}
    {batches pending mode}
    (tr : SweepTrace D N t b gh lh batches pending mode) :
    HistoryLiveCorresponds (N := N) (t := t) (b := b) gh lh pending := by
  cases tr with
  | root =>
      simpa [HistoryLiveCorresponds] using initial_live_corresponds D N t b
  | erase prev ha hpreserve =>
      simpa only using hpreserve prev.live_corresponds
  | externalSelect prev ha hout hnotDue hpreserve =>
      simpa only using hpreserve prev.live_corresponds
  | externalSelectTerminalFirst prev ha hout hactor hterminal hpreserve =>
      simpa only using hpreserve prev.live_corresponds
  | externalSelectTerminalLater prev ha hout hactor hterminal hpreserve =>
      simpa only using hpreserve prev.live_corresponds
  | pass prev ha hpreserve =>
      simpa only using hpreserve prev.live_corresponds
  | endOpeningDormant prev ha hpreserve =>
      simpa only using hpreserve prev.live_corresponds
  | endOpeningActive prev ha hpreserve =>
      simpa only using hpreserve prev.live_corresponds
  | insideProlongerOpeningFirst prev ha hactor hphase run hstage hmin hpreserve =>
      exact hpreserve prev.live_corresponds
  | insideProlongerOpeningMore prev ha hactor hphase run hstage hmin hpreserve =>
      exact hpreserve prev.live_corresponds
  | insideProlongerAfterFirst prev ha hactor run hstage hmin hpreserve =>
      exact hpreserve prev.live_corresponds
  | insideProlongerReturnOpening prev ha hactor run hstage hmin hpreserve =>
      exact hpreserve prev.live_corresponds
  | insideProlongerReturnLater prev ha hactor run hstage hmin hpreserve =>
      exact hpreserve prev.live_corresponds
  | insideProlongerLater prev ha hactor run hstage hmin hpreserve =>
      exact hpreserve prev.live_corresponds
  | firstInsideShortenerWaiting prev ha hactor run hstage hmin hpreserve =>
      exact hpreserve prev.live_corresponds
  | firstInsideShortenerDue prev ha hactor run hstage hmin hpreserve =>
      exact hpreserve prev.live_corresponds
  | laterInsideShortenerDirect prev ha hactor run hstage hmin hpreserve =>
      exact hpreserve prev.live_corresponds
  | laterInsideShortenerAdvance prev ha hactor run hstage hmin hpreserve =>
      exact hpreserve prev.live_corresponds

theorem SweepTrace.operationalBudget
    {D : Finset Vertex} {N t b : ℕ}
    {gp lp : Pos} {gh : History D (initialPos b) gp}
    {lh : History (Erdos872.quotientCone D N t) (initialPos (b + 1)) lp}
    {batches pending mode}
    (tr : SweepTrace D N t b gh lh batches pending mode) :
    OperationalBudget gp mode := by
  induction tr with
  | root => exact ⟨b, rfl, le_rfl⟩
  | erase prev ha hpreserve ih => exact ih.after_erase
  | externalSelect prev ha hout hnotDue hpreserve ih =>
      exact ih.after_select_same_mode ha
  | externalSelectTerminalFirst prev ha hout hactor hterminal hpreserve ih =>
      simpa [OperationalBudget] using ih
  | externalSelectTerminalLater prev ha hout hactor hterminal hpreserve ih =>
      simpa [OperationalBudget] using ih
  | pass prev ha hpreserve ih => exact ih.after_pass ha
  | endOpeningDormant prev ha hpreserve ih => trivial
  | endOpeningActive prev ha hpreserve ih =>
      rcases ih with ⟨r, hphase, hbudget⟩
      simp only [OperationalBudget, OpeningTally.baseOpeningCount]
      omega
  | insideProlongerOpeningFirst prev ha hactor hphase run hstage hfixed hpreserve ih =>
      rcases ih with ⟨s, hs, hbudget⟩
      have hsr : s = _ := Phase.opening.inj (hs.symm.trans hphase)
      subst s
      simp [OperationalBudget, step, hphase]
      omega
  | insideProlongerOpeningMore prev ha hactor hphase run hstage hfixed hpreserve ih =>
      rcases ih with ⟨s, hs, hbudget⟩
      have hsr : s = _ := Phase.opening.inj (hs.symm.trans hphase)
      subst s
      simp [OperationalBudget, step, hphase]
      omega
  | insideProlongerAfterFirst prev ha hactor run hstage hfixed hpreserve ih =>
      simp [OperationalBudget, OpeningTally.baseOpeningCount]
  | insideProlongerReturnOpening prev ha hactor run hstage hfixed hpreserve ih =>
      simpa [OperationalBudget, OpeningTally.baseOpeningCount] using ih
  | insideProlongerReturnLater prev ha hactor run hstage hfixed hpreserve ih =>
      simp [OperationalBudget, OpeningTally.baseOpeningCount]
  | insideProlongerLater prev ha hactor run hstage hfixed hpreserve ih =>
      simpa [OperationalBudget] using ih
  | firstInsideShortenerWaiting prev ha hactor run hstage hfixed hpreserve ih =>
      simpa [OperationalBudget] using ih
  | firstInsideShortenerDue prev ha hactor run hstage hfixed hpreserve ih =>
      simpa [OperationalBudget] using ih
  | laterInsideShortenerDirect prev ha hactor run hstage hfixed hpreserve ih =>
      simpa [OperationalBudget] using ih
  | laterInsideShortenerAdvance prev ha hactor run hstage hfixed hpreserve ih =>
      simpa [OperationalBudget] using ih

/-- Task3-facing opening bridge: the next inside opening selection has budget
without accepting `k + 1 ≤ b` as an input. -/
theorem SweepTrace.next_opening_inside_budget
    {D : Finset Vertex} {N t b k r : ℕ}
    {gp lp : Pos} {gh : History D (initialPos b) gp}
    {lh : History (Erdos872.quotientCone D N t) (initialPos (b + 1)) lp}
    {batches pending}
    (tr : SweepTrace D N t b gh lh batches pending (.openingActive k))
    (hphase : gp.phase = Phase.opening (r + 1)) : k + 1 ≤ b := by
  rcases tr.operationalBudget with ⟨s, hs, hbudget⟩
  have hsr : s = r + 1 := Phase.opening.inj (hs.symm.trans hphase)
  omega

theorem SweepTrace.follows_fixed_strategy
    {D : Finset Vertex} {N t b : ℕ}
    {gp lp : Pos} {gh : History D (initialPos b) gp}
    {lh : History (Erdos872.quotientCone D N t) (initialPos (b + 1)) lp}
    {batches pending mode}
    (tr : SweepTrace D N t b gh lh batches pending mode) :
    FollowsShortenerStrategy optimalShortener lh := by
  induction tr with
  | root => trivial
  | erase prev ha hpreserve ih => exact ih
  | externalSelect prev ha hout hnotDue hpreserve ih => exact ih
  | externalSelectTerminalFirst prev ha hout hactor hterminal hpreserve ih => exact ih
  | externalSelectTerminalLater prev ha hout hactor hterminal hpreserve ih => exact ih
  | pass prev ha hpreserve ih => exact ih
  | endOpeningDormant prev ha hpreserve ih => exact ih
  | endOpeningActive prev ha hpreserve ih => exact ih
  | insideProlongerOpeningFirst prev ha hactor hphase run hstage hfixed hpreserve ih =>
      exact hfixed ih
  | insideProlongerOpeningMore prev ha hactor hphase run hstage hfixed hpreserve ih =>
      exact hfixed ih
  | insideProlongerAfterFirst prev ha hactor run hstage hfixed hpreserve ih => exact hfixed ih
  | insideProlongerReturnOpening prev ha hactor run hstage hfixed hpreserve ih => exact hfixed ih
  | insideProlongerReturnLater prev ha hactor run hstage hfixed hpreserve ih => exact hfixed ih
  | insideProlongerLater prev ha hactor run hstage hfixed hpreserve ih => exact hfixed ih
  | firstInsideShortenerWaiting prev ha hactor run hstage hfixed hpreserve ih => exact hfixed ih
  | firstInsideShortenerDue prev ha hactor run hstage hfixed hpreserve ih => exact hfixed ih
  | laterInsideShortenerDirect prev ha hactor run hstage hfixed hpreserve ih => exact hfixed ih
  | laterInsideShortenerAdvance prev ha hactor run hstage hfixed hpreserve ih => exact hfixed ih

theorem SweepTrace.local_stage
    {D : Finset Vertex} {N t b : ℕ}
    {gp lp : Pos} {gh : History D (initialPos b) gp}
    {lh : History (Erdos872.quotientCone D N t) (initialPos (b + 1)) lp}
    {batches pending mode}
    (tr : SweepTrace D N t b gh lh batches pending mode) :
    lp.stage = Stage.beforeErase := by
  induction tr with
  | root => rfl
  | erase prev ha hpreserve ih => exact ih
  | externalSelect prev ha hout hnotDue hpreserve ih => exact ih
  | externalSelectTerminalFirst prev ha hout hactor hterminal hpreserve ih => exact ih
  | externalSelectTerminalLater prev ha hout hactor hterminal hpreserve ih => exact ih
  | pass prev ha hpreserve ih => exact ih
  | endOpeningDormant prev ha hpreserve ih => exact ih
  | endOpeningActive prev ha hpreserve ih => exact ih
  | insideProlongerOpeningFirst prev ha hactor hphase run hstage hmin hpreserve ih => exact hstage
  | insideProlongerOpeningMore prev ha hactor hphase run hstage hmin hpreserve ih => exact hstage
  | insideProlongerAfterFirst prev ha hactor run hstage hmin hpreserve ih => exact hstage
  | insideProlongerReturnOpening prev ha hactor run hstage hmin hpreserve ih => exact hstage
  | insideProlongerReturnLater prev ha hactor run hstage hmin hpreserve ih => exact hstage
  | insideProlongerLater prev ha hactor run hstage hmin hpreserve ih => exact hstage
  | firstInsideShortenerWaiting prev ha hactor run hstage hmin hpreserve ih => exact hstage
  | firstInsideShortenerDue prev ha hactor run hstage hmin hpreserve ih => exact hstage
  | laterInsideShortenerDirect prev ha hactor run hstage hmin hpreserve ih => exact hstage
  | laterInsideShortenerAdvance prev ha hactor run hstage hmin hpreserve ih => exact hstage

/-- The opening tally is computed by scanning the concrete global history.
Each equality step comes from the event-shaped constructor that extended that
history; no chronology inequality is an input to a completed trace. -/
theorem SweepTrace.opening_scan
    {D : Finset Vertex} {N t b : ℕ}
    {gp lp : Pos} {gh : History D (initialPos b) gp}
    {lh : History (Erdos872.quotientCone D N t) (initialPos (b + 1)) lp}
    {batches pending mode}
    (tr : SweepTrace D N t b gh lh batches pending mode) :
    openingScan t gh.scheduledActions = ⟨mode.count, mode.firstResponseSeen⟩ := by
  induction tr with
  | root => rfl
  | erase prev ha hpreserve ih =>
      rw [History.scheduledActions, openingScan_append, ih]
      simp [openingScanStep]
  | externalSelect prev ha hout hnotDue hpreserve ih =>
      rw [History.scheduledActions, openingScan_append, ih]
      cases hact : actorAt D _ with
      | none => simp [openingScanStep]
      | some who => cases who <;> simp [openingScanStep, hout]
  | externalSelectTerminalFirst prev ha hout hactor hterminal hpreserve ih =>
      rw [History.scheduledActions, openingScan_append, ih]
      simp [openingScanStep, hout, hactor, LocalMode.count, LocalMode.firstResponseSeen]
  | externalSelectTerminalLater prev ha hout hactor hterminal hpreserve ih =>
      rw [History.scheduledActions, openingScan_append, ih]
      simp [openingScanStep, hactor, LocalMode.count, LocalMode.firstResponseSeen]
  | pass prev ha hpreserve ih =>
      rw [History.scheduledActions, openingScan_append, ih]
      simp [openingScanStep]
  | endOpeningDormant prev ha hpreserve ih =>
      rw [History.scheduledActions, openingScan_append, ih]
      simp [openingScanStep, LocalMode.count, LocalMode.firstResponseSeen]
  | endOpeningActive prev ha hpreserve ih =>
      rw [History.scheduledActions, openingScan_append, ih]
      simp [openingScanStep, LocalMode.count, LocalMode.firstResponseSeen,
        OpeningTally.count]
  | insideProlongerOpeningFirst prev ha hactor hphase run hstage hfixed hpreserve ih =>
      rw [History.scheduledActions, openingScan_append, ih]
      simp [openingScanStep, hactor, LocalMode.count, LocalMode.firstResponseSeen]
  | insideProlongerOpeningMore prev ha hactor hphase run hstage hfixed hpreserve ih =>
      rw [History.scheduledActions, openingScan_append, ih]
      simp [openingScanStep, hactor, LocalMode.count, LocalMode.firstResponseSeen]
  | insideProlongerAfterFirst prev ha hactor run hstage hfixed hpreserve ih =>
      rw [History.scheduledActions, openingScan_append, ih]
      simp [openingScanStep, hactor, LocalMode.count, LocalMode.firstResponseSeen,
        OpeningTally.count]
  | insideProlongerReturnOpening prev ha hactor run hstage hfixed hpreserve ih =>
      rw [History.scheduledActions, openingScan_append, ih]
      simp [openingScanStep, hactor, LocalMode.count, LocalMode.firstResponseSeen,
        OpeningTally.count]
  | insideProlongerReturnLater prev ha hactor run hstage hfixed hpreserve ih =>
      rw [History.scheduledActions, openingScan_append, ih]
      simp [openingScanStep, hactor, LocalMode.count, LocalMode.firstResponseSeen,
        OpeningTally.count]
  | insideProlongerLater prev ha hactor run hstage hfixed hpreserve ih =>
      rw [History.scheduledActions, openingScan_append, ih]
      simp [openingScanStep, hactor, LocalMode.count, LocalMode.firstResponseSeen]
  | firstInsideShortenerWaiting prev ha hactor run hstage hfixed hpreserve ih =>
      rw [History.scheduledActions, openingScan_append, ih]
      simp [openingScanStep, hactor, LocalMode.count, LocalMode.firstResponseSeen]
  | firstInsideShortenerDue prev ha hactor run hstage hfixed hpreserve ih =>
      rw [History.scheduledActions, openingScan_append, ih]
      simp [openingScanStep, hactor, LocalMode.count, LocalMode.firstResponseSeen]
  | laterInsideShortenerDirect prev ha hactor run hstage hfixed hpreserve ih =>
      rw [History.scheduledActions, openingScan_append, ih]
      simp [openingScanStep, hactor, LocalMode.count, LocalMode.firstResponseSeen]
  | laterInsideShortenerAdvance prev ha hactor run hstage hfixed hpreserve ih =>
      rw [History.scheduledActions, openingScan_append, ih]
      simp [openingScanStep, hactor, LocalMode.count, LocalMode.firstResponseSeen]

theorem SweepTrace.projectedOpeningCount_eq
    {D : Finset Vertex} {N t b : ℕ}
    {gp lp : Pos} {gh : History D (initialPos b) gp}
    {lh : History (Erdos872.quotientCone D N t) (initialPos (b + 1)) lp}
    {batches pending mode}
    (tr : SweepTrace D N t b gh lh batches pending mode) :
    projectedOpeningCount t gh.scheduledActions = mode.count := by
  exact congrArg OpeningScan.count tr.opening_scan

theorem SweepTrace.retains_exactly
    {D : Finset Vertex} {N t b : ℕ} (ht : 0 < t)
    {gp lp : Pos} {gh : History D (initialPos b) gp}
    {lh : History (Erdos872.quotientCone D N t) (initialPos (b + 1)) lp}
    {batches pending mode}
    (tr : SweepTrace D N t b gh lh batches pending mode) :
    selectedVertices lh.actions = projectedConeSelections t gh.actions := by
  induction tr with
  | root => rfl
  | erase prev ha hpreserve ih =>
      rw [History.actions, projectedConeSelections_append]
      simpa [projectedConeSelections] using ih
  | externalSelect prev ha hout hnotDue hpreserve ih =>
      rw [History.actions, projectedConeSelections_append]
      simp [projectedConeSelections, hout, ih]
  | externalSelectTerminalFirst prev ha hout hactor hterminal hpreserve ih =>
      rw [History.actions, projectedConeSelections_append]
      simp [projectedConeSelections, hout, ih]
  | externalSelectTerminalLater prev ha hout hactor hterminal hpreserve ih =>
      rw [History.actions, projectedConeSelections_append]
      simp [projectedConeSelections, hout, ih]
  | pass prev ha hpreserve ih =>
      simpa [History.actions, projectedConeSelections_append,
        projectedConeSelections] using ih
  | endOpeningDormant prev ha hpreserve ih =>
      simpa [History.actions, projectedConeSelections_append,
        projectedConeSelections] using ih
  | endOpeningActive prev ha hpreserve ih =>
      simpa [History.actions, projectedConeSelections_append,
        projectedConeSelections] using ih
  | insideProlongerOpeningFirst prev ha hactor hphase run hstage hmin hpreserve ih =>
      rw [run.actions_appendHistory, selectedVertices_append, ih,
        History.actions, projectedConeSelections_append]
      simp [selectedVertices, projectedConeSelections, ht]
  | insideProlongerOpeningMore prev ha hactor hphase run hstage hmin hpreserve ih =>
      rw [run.actions_appendHistory, selectedVertices_append, ih,
        History.actions, projectedConeSelections_append]
      simp [selectedVertices, projectedConeSelections, ht]
  | insideProlongerAfterFirst prev ha hactor run hstage hmin hpreserve ih =>
      rw [run.actions_appendHistory, selectedVertices_append, ih,
        History.actions, projectedConeSelections_append]
      simp [selectedVertices, projectedConeSelections, ht]
  | insideProlongerReturnOpening prev ha hactor run hstage hmin hpreserve ih =>
      rw [run.actions_appendHistory, selectedVertices_append, ih,
        History.actions, projectedConeSelections_append]
      simp [selectedVertices, projectedConeSelections, ht]
  | insideProlongerReturnLater prev ha hactor run hstage hmin hpreserve ih =>
      rw [run.actions_appendHistory, selectedVertices_append, ih,
        History.actions, projectedConeSelections_append]
      simp [selectedVertices, projectedConeSelections, ht]
  | insideProlongerLater prev ha hactor run hstage hmin hpreserve ih =>
      rw [run.actions_appendHistory, selectedVertices_append, ih,
        History.actions, projectedConeSelections_append]
      simp [selectedVertices, projectedConeSelections, ht]
  | firstInsideShortenerWaiting prev ha hactor run hstage hmin hpreserve ih =>
      rw [run.actions_appendHistory, selectedVertices_append, ih,
        History.actions, projectedConeSelections_append]
      simp [selectedVertices, projectedConeSelections, ht]
  | firstInsideShortenerDue prev ha hactor run hstage hmin hpreserve ih =>
      rw [run.actions_appendHistory, selectedVertices_append, ih,
        History.actions, projectedConeSelections_append]
      simp [selectedVertices, projectedConeSelections, ht]
  | laterInsideShortenerDirect prev ha hactor run hstage hmin hpreserve ih =>
      rw [run.actions_appendHistory, selectedVertices_append, ih,
        History.actions, projectedConeSelections_append]
      simp [selectedVertices, projectedConeSelections, ht]
  | laterInsideShortenerAdvance prev ha hactor run hstage hmin hpreserve ih =>
      rw [run.actions_appendHistory, selectedVertices_append, ih,
        History.actions, projectedConeSelections_append]
      simp [selectedVertices, projectedConeSelections, ht]

/-- Every local erasure is exactly the union of the recorded batch at that
point, including the explicit empty erasures inserted around local passes and
the local end-of-opening action. -/
theorem SweepTrace.erases_exactly
    {D : Finset Vertex} {N t b : ℕ}
    {gp lp : Pos} {gh : History D (initialPos b) gp}
    {lh : History (Erdos872.quotientCone D N t) (initialPos (b + 1)) lp}
    {batches pending mode}
    (tr : SweepTrace D N t b gh lh batches pending mode) :
    erasurePayloads lh.actions = batches.map unionAll := by
  induction tr with
  | root => rfl
  | erase prev ha hpreserve ih => exact ih
  | externalSelect prev ha hout hnotDue hpreserve ih => exact ih
  | externalSelectTerminalFirst prev ha hout hactor hterminal hpreserve ih => exact ih
  | externalSelectTerminalLater prev ha hout hactor hterminal hpreserve ih => exact ih
  | pass prev ha hpreserve ih => exact ih
  | endOpeningDormant prev ha hpreserve ih => exact ih
  | endOpeningActive prev ha hpreserve ih => exact ih
  | insideProlongerOpeningFirst prev ha hactor hphase run hstage hfixed hpreserve ih =>
      rw [run.actions_appendHistory, erasurePayloads_append, ih]
      simp [erasurePayloads]
  | insideProlongerOpeningMore prev ha hactor hphase run hstage hfixed hpreserve ih =>
      rw [run.actions_appendHistory, erasurePayloads_append, ih]
      simp [erasurePayloads]
  | insideProlongerAfterFirst prev ha hactor run hstage hfixed hpreserve ih =>
      rw [run.actions_appendHistory, erasurePayloads_append, ih]
      simp [erasurePayloads]
  | insideProlongerReturnOpening prev ha hactor run hstage hfixed hpreserve ih =>
      rw [run.actions_appendHistory, erasurePayloads_append, ih]
      simp [erasurePayloads]
  | insideProlongerReturnLater prev ha hactor run hstage hfixed hpreserve ih =>
      rw [run.actions_appendHistory, erasurePayloads_append, ih]
      simp [erasurePayloads]
  | insideProlongerLater prev ha hactor run hstage hfixed hpreserve ih =>
      rw [run.actions_appendHistory, erasurePayloads_append, ih]
      simp [erasurePayloads]
  | firstInsideShortenerWaiting prev ha hactor run hstage hfixed hpreserve ih =>
      rw [run.actions_appendHistory, erasurePayloads_append, ih]
      simp [erasurePayloads, unionAll]
  | firstInsideShortenerDue prev ha hactor run hstage hfixed hpreserve ih =>
      rw [run.actions_appendHistory, erasurePayloads_append, ih]
      simp [erasurePayloads, unionAll]
  | laterInsideShortenerDirect prev ha hactor run hstage hfixed hpreserve ih =>
      rw [run.actions_appendHistory, erasurePayloads_append, ih]
      simp [erasurePayloads]
  | laterInsideShortenerAdvance prev ha hactor run hstage hfixed hpreserve ih =>
      rw [run.actions_appendHistory, erasurePayloads_append, ih]
      simp [erasurePayloads, unionAll]

theorem projectedDisturbances_are_upsets
    {D : Finset Vertex} {N t b : ℕ} (ht : 0 < t)
    {p : Pos} (h : History D (initialPos b) p) :
    ∀ U ∈ projectedDisturbances D N t h.actions,
      IsUpset (Erdos872.quotientCone D N t) U := by
  induction h with
  | root => simp [History.actions, projectedDisturbances]
  | @snoc p h a ha ih =>
      intro U hU
      rw [History.actions, projectedDisturbances, List.flatMap_append] at hU
      simp only [List.flatMap_singleton, List.mem_append] at hU
      rcases hU with hU | hU
      · exact ih U hU
      · exact actionDisturbances_are_upsets ht ha U hU

theorem SweepTrace.conserves_disturbances
    {D : Finset Vertex} {N t b : ℕ}
    {gp lp : Pos} {gh : History D (initialPos b) gp}
    {lh : History (Erdos872.quotientCone D N t) (initialPos (b + 1)) lp}
    {batches pending mode}
    (tr : SweepTrace D N t b gh lh batches pending mode) :
    batches.flatten ++ pending =
      projectedDisturbances D N t gh.actions := by
  induction tr with
  | root => rfl
  | erase prev ha hpreserve ih =>
      rw [History.actions, projectedDisturbances, List.flatMap_append]
      simp only [List.flatMap_singleton, actionDisturbances]
      simpa [List.append_assoc] using congrArg (· ++
        [Erdos872.quotientCone _ N t]) ih
  | externalSelect prev ha hout hnotDue hpreserve ih =>
      rw [History.actions, projectedDisturbances, List.flatMap_append]
      simp only [List.flatMap_singleton, actionDisturbances, hout, if_false]
      simpa [List.append_assoc] using congrArg (· ++
        [principalUpset (Erdos872.quotientCone D N t)
          (_ / Nat.gcd _ t)]) ih
  | externalSelectTerminalFirst prev ha hout hactor hterminal hpreserve ih =>
      rw [History.actions, projectedDisturbances, List.flatMap_append]
      simp only [List.flatMap_singleton, actionDisturbances, hout, if_false]
      simpa [List.append_assoc] using congrArg (· ++
        [principalUpset (Erdos872.quotientCone D N t)
          (_ / Nat.gcd _ t)]) ih
  | externalSelectTerminalLater prev ha hout hactor hterminal hpreserve ih =>
      rw [History.actions, projectedDisturbances, List.flatMap_append]
      simp only [List.flatMap_singleton, actionDisturbances, hout, if_false]
      simpa [List.append_assoc] using congrArg (· ++
        [principalUpset (Erdos872.quotientCone D N t)
          (_ / Nat.gcd _ t)]) ih
  | pass prev ha hpreserve ih =>
      simpa [History.actions, projectedDisturbances, List.flatMap_append,
        actionDisturbances] using ih
  | endOpeningDormant prev ha hpreserve ih =>
      simpa [History.actions, projectedDisturbances, List.flatMap_append,
        actionDisturbances] using ih
  | endOpeningActive prev ha hpreserve ih =>
      simpa [History.actions, projectedDisturbances, List.flatMap_append,
        actionDisturbances] using ih
  | insideProlongerOpeningFirst prev ha hactor hphase run hstage hmin hpreserve ih =>
      rw [List.flatten_append]
      simpa [History.actions, projectedDisturbances, List.flatMap_append,
        actionDisturbances] using ih
  | insideProlongerOpeningMore prev ha hactor hphase run hstage hmin hpreserve ih =>
      rw [List.flatten_append]
      simpa [History.actions, projectedDisturbances, List.flatMap_append,
        actionDisturbances] using ih
  | insideProlongerAfterFirst prev ha hactor run hstage hmin hpreserve ih =>
      rw [List.flatten_append]
      simpa [History.actions, projectedDisturbances, List.flatMap_append,
        actionDisturbances] using ih
  | insideProlongerReturnOpening prev ha hactor run hstage hmin hpreserve ih =>
      rw [List.flatten_append]
      simpa [History.actions, projectedDisturbances, List.flatMap_append,
        actionDisturbances] using ih
  | insideProlongerReturnLater prev ha hactor run hstage hmin hpreserve ih =>
      rw [List.flatten_append]
      simpa [History.actions, projectedDisturbances, List.flatMap_append,
        actionDisturbances] using ih
  | insideProlongerLater prev ha hactor run hstage hmin hpreserve ih =>
      rw [List.flatten_append]
      simpa [History.actions, projectedDisturbances, List.flatMap_append,
        actionDisturbances] using ih
  | firstInsideShortenerWaiting prev ha hactor run hstage hmin hpreserve ih =>
      rw [List.flatten_append]
      simpa [History.actions, projectedDisturbances, List.flatMap_append,
        actionDisturbances] using ih
  | firstInsideShortenerDue prev ha hactor run hstage hmin hpreserve ih =>
      rw [List.flatten_append]
      simpa [History.actions, projectedDisturbances, List.flatMap_append,
        actionDisturbances] using ih
  | laterInsideShortenerDirect prev ha hactor run hstage hmin hpreserve ih =>
      rw [List.flatten_append]
      simpa [History.actions, projectedDisturbances, List.flatMap_append,
        actionDisturbances] using ih
  | laterInsideShortenerAdvance prev ha hactor run hstage hmin hpreserve ih =>
      rw [List.flatten_append]
      simpa [History.actions, projectedDisturbances, List.flatMap_append,
        actionDisturbances] using ih

lemma IsUpset.union {D U V : Finset Vertex}
    (hU : IsUpset D U) (hV : IsUpset D V) : IsUpset D (U ∪ V) := by
  constructor
  · exact Finset.union_subset hU.1 hV.1
  · intro x hx y hy hxy
    rcases Finset.mem_union.mp hx with hx | hx
    · exact Finset.mem_union_left _ (hU.2 x hx y hy hxy)
    · exact Finset.mem_union_right _ (hV.2 x hx y hy hxy)

lemma unionAll_isUpset {D : Finset Vertex} {pieces : List (Finset Vertex)}
    (hpieces : ∀ U ∈ pieces, IsUpset D U) :
    IsUpset D (unionAll pieces) := by
  induction pieces with
  | nil => simp [unionAll, IsUpset]
  | cons U rest ih =>
      simp only [unionAll]
      exact (hpieces U (by simp)).union
        (ih (fun V hV => hpieces V (by simp [hV])))

theorem SweepTrace.pending_are_upsets
    {D : Finset Vertex} {N t b : ℕ} (ht : 0 < t)
    {gp lp : Pos} {gh : History D (initialPos b) gp}
    {lh : History (Erdos872.quotientCone D N t) (initialPos (b + 1)) lp}
    {batches pending seen}
    (tr : SweepTrace D N t b gh lh batches pending seen) :
    ∀ U ∈ pending, IsUpset (Erdos872.quotientCone D N t) U := by
  intro U hU
  have hall := projectedDisturbances_are_upsets (N := N) ht gh
  apply hall U
  rw [← tr.conserves_disturbances]
  exact List.mem_append_right _ hU

/-! ## Exported transition builders

These lemmas are the public construction interface for the substantive local
steps.  In particular, users of `SweepTrace` need not reconstruct the local
live-set calculation or the legality of the pending-erasure flush.
-/

theorem SweepTrace.inside_mem_effective
    {D : Finset Vertex} {N t b : ℕ}
    {gp lp : Pos} {gh : History D (initialPos b) gp}
    {lh : History (Erdos872.quotientCone D N t) (initialPos (b + 1)) lp}
    {batches pending mode m}
    (hD : IsDownset N D) (ht : 0 < t)
    (tr : SweepTrace D N t b gh lh batches pending mode)
    (ha : Action.select (t * m) ∈ legalActions D gp) :
    m ∈ effectiveLocalLive (Erdos872.quotientCone D N t) lp pending := by
  have htmLive := select_mem_liveLegal_of_legal ha
  have htmD : t * m ∈ D := (Finset.mem_filter.mp htmLive).1
  have htmBoard := hD.1 htmD
  have htmPos : 1 ≤ t * m := (Finset.mem_Icc.mp htmBoard).1
  have hmPos : 1 ≤ m := by
    exact Nat.one_le_iff_ne_zero.mpr fun hm0 => by simp [hm0] at htmPos
  have hmLe : m ≤ N / t := by
    apply (Nat.le_div_iff_mul_le ht).2
    simpa [Nat.mul_comm] using (Finset.mem_Icc.mp htmBoard).2
  have hmQuot : m ∈ quotientLive D N t gp := by
    exact Finset.mem_filter.mpr
      ⟨Finset.mem_Icc.mpr ⟨hmPos, hmLe⟩, htmLive⟩
  rw [tr.live_corresponds] at hmQuot
  exact hmQuot

lemma erase_mem_legalActions_of_stage
    {D : Finset Vertex} {p : Pos} {U : Finset Vertex}
    (hstage : p.stage = Stage.beforeErase)
    (hlive : liveLegal D p.state ≠ ∅) (hU : IsUpset D U) :
    Action.erase U ∈ legalActions D p := by
  unfold legalActions
  rw [if_neg hlive, hstage]
  unfold erasureActions
  simp only [Finset.mem_image]
  refine ⟨U, ?_, rfl⟩
  simpa [globalUpsets] using ⟨hU.1, hU⟩

lemma select_mem_legalActions_of_opening
    {D : Finset Vertex} {p : Pos} {m r : ℕ}
    (hstage : p.stage = Stage.actorAction)
    (hphase : p.phase = Phase.opening (r + 1))
    (hm : m ∈ liveLegal D p.state) :
    Action.select m ∈ legalActions D p := by
  simp [legalActions, hstage, hphase, selectionActions, hm,
    Finset.nonempty_iff_ne_empty.mp ⟨m, hm⟩]

lemma select_mem_legalActions_of_regular
    {D : Finset Vertex} {p : Pos} {m : ℕ} {who : Player}
    (hstage : p.stage = Stage.actorAction)
    (hphase : p.phase = Phase.regular who)
    (hm : m ∈ liveLegal D p.state) :
    Action.select m ∈ legalActions D p := by
  cases who <;>
    simp [legalActions, hstage, hphase, selectionActions, hm,
      Finset.nonempty_iff_ne_empty.mp ⟨m, hm⟩]

lemma endOpening_mem_legalActions
    {D : Finset Vertex} {p : Pos} {r : ℕ}
    (hstage : p.stage = Stage.actorAction)
    (hphase : p.phase = Phase.opening r)
    (hlive : liveLegal D p.state ≠ ∅) :
    Action.endOpening ∈ legalActions D p := by
  cases r <;> simp [legalActions, hstage, hphase, hlive]

lemma pass_mem_legalActions
    {D : Finset Vertex} {p : Pos}
    (hstage : p.stage = Stage.actorAction)
    (hphase : p.phase = Phase.regular Player.prolonger)
    (hlive : liveLegal D p.state ≠ ∅) :
    Action.pass ∈ legalActions D p := by
  simp [legalActions, hstage, hphase, hlive]

theorem SweepTrace.flush_legal_of_mem
    {D : Finset Vertex} {N t b : ℕ}
    {gp lp : Pos} {gh : History D (initialPos b) gp}
    {lh : History (Erdos872.quotientCone D N t) (initialPos (b + 1)) lp}
    {batches pending mode m}
    (ht : 0 < t) (tr : SweepTrace D N t b gh lh batches pending mode)
    (hm : m ∈ effectiveLocalLive
      (Erdos872.quotientCone D N t) lp pending) :
    Action.erase (unionAll pending) ∈
      legalActions (Erdos872.quotientCone D N t) lp := by
  let Q := Erdos872.quotientCone D N t
  have hmLive : m ∈ liveLegal Q lp.state := (Finset.mem_sdiff.mp hm).1
  exact erase_mem_legalActions_of_stage tr.local_stage
    (Finset.nonempty_iff_ne_empty.mp ⟨m, hmLive⟩)
    (unionAll_isUpset (tr.pending_are_upsets ht))

theorem SweepTrace.mem_live_after_flush
    {D : Finset Vertex} {N t b : ℕ}
    {gp lp : Pos} {gh : History D (initialPos b) gp}
    {lh : History (Erdos872.quotientCone D N t) (initialPos (b + 1)) lp}
    {batches pending mode m}
    (_tr : SweepTrace D N t b gh lh batches pending mode)
    (hm : m ∈ effectiveLocalLive
      (Erdos872.quotientCone D N t) lp pending) :
    m ∈ liveLegal (Erdos872.quotientCone D N t)
      (step (Erdos872.quotientCone D N t) lp
        (Action.erase (unionAll pending))).state := by
  rw [show (step (Erdos872.quotientCone D N t) lp
      (Action.erase (unionAll pending))).state =
      eraseState (Erdos872.quotientCone D N t) lp.state
        (unionAll pending) by rfl]
  rw [liveLegal_eraseState_eq_sdiff]
  exact hm

def LocalPhaseMatches {b : ℕ} (mode : LocalMode b) (phase : Phase) : Prop :=
  match mode with
  | .openingDormant | .openingActive _ | .postDormant |
      .waitingFirst _ | .responseDueFirst _ | .deadFirst _ =>
      ∃ r, phase = Phase.opening r
  | .running _ => phase = Phase.regular Player.prolonger
  | .responseDueLater _ | .deadLater _ =>
      phase = Phase.regular Player.shortener

lemma LegalRun.phase_flush_select_opening
    {D : Finset Vertex} {p q : Pos} {U : Finset Vertex} {m r : ℕ}
    (run : LegalRun D p [Action.erase U, Action.select m] q)
    (hphase : p.phase = Phase.opening (r + 1)) :
    q.phase = Phase.opening r := by
  cases run with
  | cons hErase tail =>
      cases tail with
      | cons hSelect tail =>
          cases tail with
          | nil => simp [step, hphase]

lemma LegalRun.phase_flush_select_of_opening
    {D : Finset Vertex} {p q : Pos} {U : Finset Vertex} {m : ℕ}
    (run : LegalRun D p [Action.erase U, Action.select m] q)
    (hphase : ∃ r, p.phase = Phase.opening r) :
    ∃ r, q.phase = Phase.opening r := by
  rcases hphase with ⟨r, hr⟩
  cases r with
  | zero =>
      cases run with
      | cons hErase tail =>
          cases tail with
          | cons hSelect tail =>
              exact False.elim
                (select_not_legal_at_opening_zero (by simp [step, hr]) hSelect)
  | succ r => exact ⟨r, run.phase_flush_select_opening hr⟩

lemma LegalRun.phase_flush_select_regularProlonger
    {D : Finset Vertex} {p q : Pos} {U : Finset Vertex} {m : ℕ}
    (run : LegalRun D p [Action.erase U, Action.select m] q)
    (hphase : p.phase = Phase.regular Player.prolonger) :
    q.phase = Phase.regular Player.shortener := by
  cases run with
  | cons hErase tail =>
      cases tail with
      | cons hSelect tail =>
          cases tail with
          | nil => simp [step, hphase]

lemma LegalRun.phase_first_response
    {D : Finset Vertex} {p q : Pos} {U : Finset Vertex} {m r : ℕ}
    (run : LegalRun D p
      [Action.erase U, Action.endOpening, Action.erase ∅, Action.select m] q)
    (hphase : p.phase = Phase.opening r) :
    q.phase = Phase.regular Player.prolonger := by
  cases run with
  | cons hErase tail =>
      cases tail with
      | cons hEnd tail =>
          cases tail with
          | cons hEraseEmpty tail =>
              cases tail with
              | cons hSelect tail =>
                  cases tail with
                  | nil => simp [step, hphase]

lemma LegalRun.phase_direct_response
    {D : Finset Vertex} {p q : Pos} {U : Finset Vertex} {m : ℕ}
    (run : LegalRun D p [Action.erase U, Action.select m] q)
    (hphase : p.phase = Phase.regular Player.shortener) :
    q.phase = Phase.regular Player.prolonger := by
  cases run with
  | cons hErase tail =>
      cases tail with
      | cons hSelect tail =>
          cases tail with
          | nil => simp [step, hphase]

lemma LegalRun.phase_advance_response
    {D : Finset Vertex} {p q : Pos} {U : Finset Vertex} {m : ℕ}
    (run : LegalRun D p
      [Action.erase U, Action.pass, Action.erase ∅, Action.select m] q)
    (hphase : p.phase = Phase.regular Player.prolonger) :
    q.phase = Phase.regular Player.prolonger := by
  cases run with
  | cons hErase tail =>
      cases tail with
      | cons hPass tail =>
          cases tail with
          | cons hEraseEmpty tail =>
              cases tail with
              | cons hSelect tail =>
                  cases tail with
                  | nil => simp [step, hphase]

lemma LegalRun.openingSelections_flush_select_of_opening
    {D : Finset Vertex} {b : ℕ} {p q : Pos}
    {h : History D (initialPos b) p}
    {U : Finset Vertex} {m : ℕ}
    (run : LegalRun D p [Action.erase U, Action.select m] q)
    (hphase : p.phase = Phase.opening r) :
    (run.appendHistory h).openingSelections = h.openingSelections + 1 := by
  cases run with
  | cons hErase tail =>
      cases tail with
      | cons hSelect tail =>
          cases tail with
          | nil =>
              simp [LegalRun.appendHistory, History.openingSelections,
                openingSelectionIncrement, step, hphase]

lemma LegalRun.openingSelections_flush_select_of_regular
    {D : Finset Vertex} {b : ℕ} {p q : Pos}
    {h : History D (initialPos b) p}
    {U : Finset Vertex} {m : ℕ} {who : Player}
    (run : LegalRun D p [Action.erase U, Action.select m] q)
    (hphase : p.phase = Phase.regular who) :
    (run.appendHistory h).openingSelections = h.openingSelections := by
  cases run with
  | cons hErase tail =>
      cases tail with
      | cons hSelect tail =>
          cases tail with
          | nil =>
              simp [LegalRun.appendHistory, History.openingSelections,
                openingSelectionIncrement, step, hphase]

lemma LegalRun.openingSelections_first_response
    {D : Finset Vertex} {b : ℕ} {p q : Pos}
    {h : History D (initialPos b) p}
    {U : Finset Vertex} {m : ℕ}
    (run : LegalRun D p
      [Action.erase U, Action.endOpening, Action.erase ∅, Action.select m] q) :
    (run.appendHistory h).openingSelections = h.openingSelections := by
  cases run with
  | cons hErase tail =>
      cases tail with
      | cons hEnd tail =>
          cases tail with
          | cons hEraseEmpty tail =>
              cases tail with
              | cons hSelect tail =>
                  cases tail with
                  | nil =>
                      simp [LegalRun.appendHistory, History.openingSelections,
                        openingSelectionIncrement, step]

lemma LegalRun.openingSelections_direct_response
    {D : Finset Vertex} {b : ℕ} {p q : Pos}
    {h : History D (initialPos b) p}
    {U : Finset Vertex} {m : ℕ}
    (run : LegalRun D p [Action.erase U, Action.select m] q)
    (hphase : p.phase = Phase.regular Player.shortener) :
    (run.appendHistory h).openingSelections = h.openingSelections :=
  run.openingSelections_flush_select_of_regular hphase

lemma LegalRun.openingSelections_advance_response
    {D : Finset Vertex} {b : ℕ} {p q : Pos}
    {h : History D (initialPos b) p}
    {U : Finset Vertex} {m : ℕ}
    (run : LegalRun D p
      [Action.erase U, Action.pass, Action.erase ∅, Action.select m] q) :
    (run.appendHistory h).openingSelections = h.openingSelections := by
  cases run with
  | cons hErase tail =>
      cases tail with
      | cons hPass tail =>
          cases tail with
          | cons hEraseEmpty tail =>
              cases tail with
              | cons hSelect tail =>
                  cases tail with
                  | nil =>
                      simp [LegalRun.appendHistory, History.openingSelections,
                        openingSelectionIncrement, step]

theorem SweepTrace.local_phase_matches
    {D : Finset Vertex} {N t b : ℕ}
    {gp lp : Pos} {gh : History D (initialPos b) gp}
    {lh : History (Erdos872.quotientCone D N t) (initialPos (b + 1)) lp}
    {batches pending mode}
    (tr : SweepTrace D N t b gh lh batches pending mode) :
    LocalPhaseMatches mode lp.phase := by
  induction tr with
  | root => exact ⟨b + 1, rfl⟩
  | erase prev ha hpreserve ih => exact ih
  | externalSelect prev ha hout hnotDue hpreserve ih => exact ih
  | externalSelectTerminalFirst prev ha hout hactor hterminal hpreserve ih => exact ih
  | externalSelectTerminalLater prev ha hout hactor hterminal hpreserve ih => exact ih
  | pass prev ha hpreserve ih => exact ih
  | endOpeningDormant prev ha hpreserve ih => exact ih
  | endOpeningActive prev ha hpreserve ih => exact ih
  | insideProlongerOpeningFirst prev ha hactor hphase run hstage hfixed hpreserve ih =>
      exact run.phase_flush_select_of_opening ih
  | insideProlongerOpeningMore prev ha hactor hphase run hstage hfixed hpreserve ih =>
      exact run.phase_flush_select_of_opening ih
  | insideProlongerAfterFirst prev ha hactor run hstage hfixed hpreserve ih =>
      exact run.phase_flush_select_of_opening ih
  | insideProlongerReturnOpening prev ha hactor run hstage hfixed hpreserve ih =>
      exact run.phase_flush_select_of_opening ih
  | insideProlongerReturnLater prev ha hactor run hstage hfixed hpreserve ih =>
      exact run.phase_flush_select_of_opening ih
  | insideProlongerLater prev ha hactor run hstage hfixed hpreserve ih =>
      exact run.phase_flush_select_regularProlonger ih
  | firstInsideShortenerWaiting prev ha hactor run hstage hfixed hpreserve ih =>
      rcases ih with ⟨s, hs⟩
      exact run.phase_first_response hs
  | firstInsideShortenerDue prev ha hactor run hstage hfixed hpreserve ih =>
      rcases ih with ⟨s, hs⟩
      exact run.phase_first_response hs
  | laterInsideShortenerDirect prev ha hactor run hstage hfixed hpreserve ih =>
      exact run.phase_direct_response ih
  | laterInsideShortenerAdvance prev ha hactor run hstage hfixed hpreserve ih =>
      exact run.phase_advance_response ih

theorem SweepTrace.local_openingSelections_eq_count
    {D : Finset Vertex} {N t b : ℕ}
    {gp lp : Pos} {gh : History D (initialPos b) gp}
    {lh : History (Erdos872.quotientCone D N t) (initialPos (b + 1)) lp}
    {batches pending mode}
    (tr : SweepTrace D N t b gh lh batches pending mode) :
    lh.openingSelections = mode.count := by
  induction tr with
  | root => rfl
  | erase prev ha hpreserve ih => exact ih
  | externalSelect prev ha hout hnotDue hpreserve ih => exact ih
  | externalSelectTerminalFirst prev ha hout hactor hterminal hpreserve ih => exact ih
  | externalSelectTerminalLater prev ha hout hactor hterminal hpreserve ih => exact ih
  | pass prev ha hpreserve ih => exact ih
  | endOpeningDormant prev ha hpreserve ih => exact ih
  | endOpeningActive prev ha hpreserve ih => simpa [LocalMode.count, OpeningTally.count] using ih
  | insideProlongerOpeningFirst prev ha hactor hphase run hstage hfixed hpreserve ih =>
      rcases prev.local_phase_matches with ⟨r, hr⟩
      rw [run.openingSelections_flush_select_of_opening hr, ih]
      rfl
  | insideProlongerOpeningMore prev ha hactor hphase run hstage hfixed hpreserve ih =>
      rcases prev.local_phase_matches with ⟨r, hr⟩
      rw [run.openingSelections_flush_select_of_opening hr, ih]
      simp [LocalMode.count]
  | insideProlongerAfterFirst prev ha hactor run hstage hfixed hpreserve ih =>
      rcases prev.local_phase_matches with ⟨r, hr⟩
      rw [run.openingSelections_flush_select_of_opening hr, ih]
      rfl
  | insideProlongerReturnOpening prev ha hactor run hstage hfixed hpreserve ih =>
      rcases prev.local_phase_matches with ⟨r, hr⟩
      rw [run.openingSelections_flush_select_of_opening hr, ih]
      simp [LocalMode.count, OpeningTally.count]
  | insideProlongerReturnLater prev ha hactor run hstage hfixed hpreserve ih =>
      rcases prev.local_phase_matches with ⟨r, hr⟩
      rw [run.openingSelections_flush_select_of_opening hr, ih]
      rfl
  | insideProlongerLater prev ha hactor run hstage hfixed hpreserve ih =>
      rw [run.openingSelections_flush_select_of_regular prev.local_phase_matches, ih]
      simp [LocalMode.count]
  | firstInsideShortenerWaiting prev ha hactor run hstage hfixed hpreserve ih =>
      rcases prev.local_phase_matches with ⟨r, hr⟩
      rw [run.openingSelections_first_response, ih]
      simp [LocalMode.count]
  | firstInsideShortenerDue prev ha hactor run hstage hfixed hpreserve ih =>
      rcases prev.local_phase_matches with ⟨r, hr⟩
      rw [run.openingSelections_first_response, ih]
      simp [LocalMode.count]
  | laterInsideShortenerDirect prev ha hactor run hstage hfixed hpreserve ih =>
      rw [run.openingSelections_direct_response prev.local_phase_matches, ih]
      simp [LocalMode.count]
  | laterInsideShortenerAdvance prev ha hactor run hstage hfixed hpreserve ih =>
      rw [run.openingSelections_advance_response, ih]

def LocalCanAcceptProlonger {b : ℕ} : LocalMode b → Prop
  | .openingDormant | .openingActive _ | .postDormant |
      .waitingFirst (.during0 _) | .waitingFirst .later1 | .running _ => True
  | _ => False

/-- Every mode in which the projector accepts a local Prolonger move is at a
positive opening remainder, or is at the regular Prolonger node. -/
theorem SweepTrace.prolonger_ready_phase
    {D : Finset Vertex} {N t b : ℕ}
    {gp lp : Pos} {gh : History D (initialPos b) gp}
    {lh : History (Erdos872.quotientCone D N t) (initialPos (b + 1)) lp}
    {batches pending mode}
    (hb : 1 ≤ b) (tr : SweepTrace D N t b gh lh batches pending mode)
    (hready : LocalCanAcceptProlonger mode) :
    (∃ r, lp.phase = Phase.opening (r + 1)) ∨
      lp.phase = Phase.regular Player.prolonger := by
  cases mode with
  | openingDormant | postDormant =>
      rcases tr.local_phase_matches with ⟨r, hr⟩
      have hacct := lh.opening_accounting hr
      rw [tr.local_openingSelections_eq_count] at hacct
      simp [LocalMode.count] at hacct
      left
      obtain ⟨r, rfl⟩ := Nat.exists_eq_succ_of_ne_zero (by omega : r ≠ 0)
      exact ⟨r, hr⟩
  | openingActive k =>
      rcases tr.local_phase_matches with ⟨r, hr⟩
      have hacct := lh.opening_accounting hr
      rw [tr.local_openingSelections_eq_count] at hacct
      simp [LocalMode.count] at hacct
      have hk : k ≤ b := by
        rcases tr.operationalBudget with ⟨s, hs, hks⟩
        omega
      left
      obtain ⟨r, rfl⟩ := Nat.exists_eq_succ_of_ne_zero (by omega : r ≠ 0)
      exact ⟨r, hr⟩
  | waitingFirst c =>
      cases c with
      | during0 k =>
          rcases tr.local_phase_matches with ⟨r, hr⟩
          have hacct := lh.opening_accounting hr
          rw [tr.local_openingSelections_eq_count] at hacct
          simp [LocalMode.count, OpeningTally.count] at hacct
          have hk : k ≤ b := by
            simpa [OperationalBudget, OpeningTally.baseOpeningCount] using
              tr.operationalBudget
          left
          obtain ⟨r, rfl⟩ := Nat.exists_eq_succ_of_ne_zero (by omega : r ≠ 0)
          exact ⟨r, hr⟩
      | later1 =>
          rcases tr.local_phase_matches with ⟨r, hr⟩
          have hacct := lh.opening_accounting hr
          rw [tr.local_openingSelections_eq_count] at hacct
          simp [LocalMode.count, OpeningTally.count] at hacct
          left
          obtain ⟨r, rfl⟩ := Nat.exists_eq_succ_of_ne_zero (by omega : r ≠ 0)
          exact ⟨r, hr⟩
      | during1 k => contradiction
      | later2 => contradiction
  | running c => exact Or.inr tr.local_phase_matches
  | responseDueFirst c => contradiction
  | responseDueLater c => contradiction
  | deadFirst c => contradiction
  | deadLater c => contradiction

structure InsideProlongerRun
    (D : Finset Vertex) (N t b : ℕ)
    {gp lp : Pos} (gh : History D (initialPos b) gp)
    (lh : History (Erdos872.quotientCone D N t) (initialPos (b + 1)) lp)
    (pending : List (Finset Vertex)) (m : Vertex) where
  localEnd : Pos
  run : LegalRun (Erdos872.quotientCone D N t) lp
    [Action.erase (unionAll pending), Action.select m] localEnd
  endStage : localEnd.stage = Stage.beforeErase
  preservesFixed : FollowsShortenerStrategy optimalShortener lh →
    FollowsShortenerStrategy optimalShortener (run.appendHistory lh)
  preservesLive : LiveCorresponds D N t gp lp pending →
    LiveCorresponds D N t (step D gp (Action.select (t * m))) localEnd []

/-- Flush the pending quotient upsets and project one inside Prolonger
selection.  The returned certificate supplies all four proof fields required
by the corresponding `SweepTrace` constructors. -/
def SweepTrace.buildInsideProlongerRun
    {D : Finset Vertex} {N t b : ℕ}
    {gp lp : Pos} {gh : History D (initialPos b) gp}
    {lh : History (Erdos872.quotientCone D N t) (initialPos (b + 1)) lp}
    {batches pending mode m}
    (hD : IsDownset N D) (ht : 0 < t)
    (hb : 1 ≤ b)
    (tr : SweepTrace D N t b gh lh batches pending mode)
    (ha : Action.select (t * m) ∈ legalActions D gp)
    (hready : LocalCanAcceptProlonger mode) :
    InsideProlongerRun D N t b gh lh pending m := by
  let Q := Erdos872.quotientCone D N t
  let U := unionAll pending
  have hm := tr.inside_mem_effective hD ht ha
  have hphase := tr.prolonger_ready_phase hb hready
  have hErase : Action.erase U ∈ legalActions Q lp :=
    tr.flush_legal_of_mem ht hm
  let lp₁ := step Q lp (Action.erase U)
  have hm₁ : m ∈ liveLegal Q lp₁.state := tr.mem_live_after_flush hm
  have hstage₁ : lp₁.stage = Stage.actorAction := rfl
  have hSelect : Action.select m ∈ legalActions Q lp₁ := by
    rcases hphase with ⟨r, hr⟩ | hr
    · exact select_mem_legalActions_of_opening hstage₁ (by simpa [lp₁, step] using hr) hm₁
    · exact select_mem_legalActions_of_regular hstage₁ (by simpa [lp₁, step] using hr) hm₁
  let lp₂ := step Q lp₁ (Action.select m)
  let run : LegalRun Q lp [Action.erase U, Action.select m] lp₂ :=
    .cons hErase (.cons hSelect (.nil lp₂))
  refine ⟨lp₂, run, ?_, ?_, ?_⟩
  · rcases hphase with ⟨r, hr⟩ | hr <;> simp [lp₂, lp₁, step, hr]
  · intro hf
    refine ⟨⟨hf, ?_⟩, ?_⟩
    · intro hs
      simp [actorAt, tr.local_stage] at hs
    · intro hs
      rcases hphase with ⟨r, hr⟩ | hr <;>
        simp [actorAt, step, hr] at hs
  · intro hcorr
    exact hcorr.after_inside_select ht

lemma erase_legal_actor_ne_shortener
    {D : Finset Vertex} {p : Pos} {U : Finset Vertex}
    (ha : Action.erase U ∈ legalActions D p) :
    actorAt D p ≠ some Actor.shortener := by
  intro hs
  unfold actorAt at hs
  split at hs
  · contradiction
  · rename_i hlive
    unfold legalActions at ha
    rw [if_neg hlive] at ha
    cases hstage : p.stage with
    | beforeErase => simp [hstage] at hs
    | actorAction =>
        cases hphase : p.phase with
        | opening r => cases r <;> simp [hstage, hphase, selectionActions] at ha
        | regular who =>
            cases who <;> simp [hstage, hphase, selectionActions] at ha

lemma legal_action_at_shortener_is_select
    {D : Finset Vertex} {p : Pos} {a : Action}
    (hs : actorAt D p = some Actor.shortener)
    (ha : a ∈ legalActions D p) :
    ∃ m, a = Action.select m := by
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
                unfold legalActions at ha
                rw [if_neg hlive] at ha
                simp only [hstage, hphase, selectionActions,
                  Finset.mem_image] at ha
                rcases ha with ⟨m, hm, hma⟩
                exact ⟨m, hma.symm⟩

lemma select_mem_legalActions_of_shortener
    {D : Finset Vertex} {p : Pos} {m : Vertex}
    (hs : actorAt D p = some Actor.shortener)
    (hm : m ∈ liveLegal D p.state) :
    Action.select m ∈ legalActions D p := by
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
                simp [legalActions, hlive, hstage, hphase, selectionActions, hm]

lemma FollowsShortenerStrategy.snoc_nonshortener
    {D : Finset Vertex} {start p : Pos}
    {h : History D start p} {a : Action}
    (hf : FollowsShortenerStrategy optimalShortener h)
    (ha : a ∈ legalActions D p)
    (hnot : actorAt D p ≠ some Actor.shortener) :
    FollowsShortenerStrategy optimalShortener (.snoc h a ha) := by
  exact ⟨hf, fun hs => False.elim (hnot hs)⟩

/-- Reverse synchronization for any local Shortener choice.  This is the
Task3-facing bridge used after either first-response preparation or a local
pass preparation. -/
theorem SweepTrace.global_shortener_select_legal
    {D : Finset Vertex} {N t b : ℕ}
    {gp lp : Pos} {gh : History D (initialPos b) gp}
    {lh : History (Erdos872.quotientCone D N t) (initialPos (b + 1)) lp}
    {batches pending mode m}
    (tr : SweepTrace D N t b gh lh batches pending mode)
    (hglobalActor : actorAt D gp = some Actor.shortener)
    (hm : m ∈ effectiveLocalLive
      (Erdos872.quotientCone D N t) lp pending) :
    Action.select (t * m) ∈ legalActions D gp := by
  have hmQuot : m ∈ quotientLive D N t gp := by
    rw [tr.live_corresponds]
    exact hm
  exact select_mem_legalActions_of_shortener hglobalActor
    (Finset.mem_filter.mp hmQuot).2

/-- Legality of ending the local opening immediately after flushing the
pending quotient upsets. -/
theorem SweepTrace.first_endOpening_legal_of_mem
    {D : Finset Vertex} {N t b : ℕ}
    {gp lp : Pos} {gh : History D (initialPos b) gp}
    {lh : History (Erdos872.quotientCone D N t) (initialPos (b + 1)) lp}
    {batches pending mode m r}
    (tr : SweepTrace D N t b gh lh batches pending mode)
    (hphase : lp.phase = Phase.opening r)
    (hm : m ∈ effectiveLocalLive
      (Erdos872.quotientCone D N t) lp pending) :
    Action.endOpening ∈ legalActions (Erdos872.quotientCone D N t)
      (step (Erdos872.quotientCone D N t) lp
        (Action.erase (unionAll pending))) := by
  have hm' := tr.mem_live_after_flush hm
  apply endOpening_mem_legalActions rfl
    (by simpa [step] using hphase)
  exact Finset.nonempty_iff_ne_empty.mp ⟨m, hm'⟩

set_option maxHeartbeats 200000
structure DirectShortenerRun
    (D : Finset Vertex) (N t b : ℕ)
    {gp lp : Pos} (gh : History D (initialPos b) gp)
    (lh : History (Erdos872.quotientCone D N t) (initialPos (b + 1)) lp)
    (pending : List (Finset Vertex)) where
  m : Vertex
  localEnd : Pos
  run : LegalRun (Erdos872.quotientCone D N t) lp
    [Action.erase (unionAll pending), Action.select m] localEnd
  globalLegal : Action.select (t * m) ∈ legalActions D gp
  endStage : localEnd.stage = Stage.beforeErase
  preservesFixed : FollowsShortenerStrategy optimalShortener lh →
    FollowsShortenerStrategy optimalShortener (run.appendHistory lh)
  preservesLive : LiveCorresponds D N t gp lp pending →
    LiveCorresponds D N t (step D gp (Action.select (t * m))) localEnd []

/-- Flush pending erasures and make the immediate local Shortener response
prescribed by `optimalShortener`. -/
noncomputable def SweepTrace.buildDirectShortenerRun
    {D : Finset Vertex} {N t b : ℕ}
    {gp lp : Pos} {gh : History D (initialPos b) gp}
    {lh : History (Erdos872.quotientCone D N t) (initialPos (b + 1)) lp}
    {batches pending mode}
    (ht : 0 < t)
    (tr : SweepTrace D N t b gh lh batches pending mode)
    (hglobalActor : actorAt D gp = some Actor.shortener)
    (hlocalPhase : lp.phase = Phase.regular Player.shortener)
    {seed : Vertex}
    (hseed : seed ∈ effectiveLocalLive
      (Erdos872.quotientCone D N t) lp pending) :
    DirectShortenerRun D N t b (gp := gp) (lp := lp) gh lh pending := by
  let Q := Erdos872.quotientCone D N t
  let U := unionAll pending
  have hErase : Action.erase U ∈ legalActions Q lp :=
    tr.flush_legal_of_mem ht hseed
  let p₁ := step Q lp (Action.erase U)
  have hseed₁ : seed ∈ liveLegal Q p₁.state := tr.mem_live_after_flush hseed
  have hLive₁ : liveLegal Q p₁.state ≠ ∅ :=
    Finset.nonempty_iff_ne_empty.mp ⟨seed, hseed₁⟩
  let h₁ : History Q (initialPos (b + 1)) p₁ := .snoc lh _ hErase
  have hs : actorAt Q p₁ = some Actor.shortener := by
    unfold actorAt
    rw [if_neg hLive₁]
    simp [p₁, step, hlocalPhase]
  let chosen := optimalShortener h₁ hs
  let m := Classical.choose (legal_action_at_shortener_is_select hs chosen.2)
  have hm : chosen.1 = Action.select m :=
    Classical.choose_spec (legal_action_at_shortener_is_select hs chosen.2)
  have hSelect : Action.select m ∈ legalActions Q p₁ := by
    rw [← hm]
    exact chosen.2
  let p₂ := step Q p₁ (Action.select m)
  let run : LegalRun Q lp [Action.erase U, Action.select m] p₂ :=
    .cons hErase (.cons hSelect (.nil p₂))
  have hmEffective : m ∈ effectiveLocalLive Q lp pending := by
    rw [effectiveLocalLive, ← liveLegal_eraseState_eq_sdiff]
    simpa [p₁, step] using select_mem_liveLegal_of_legal hSelect
  have hmQuot : m ∈ quotientLive D N t gp := by
    rw [tr.live_corresponds]
    exact hmEffective
  have htmLive : t * m ∈ liveLegal D gp.state :=
    (Finset.mem_filter.mp hmQuot).2
  have hGlobalLegal := select_mem_legalActions_of_shortener hglobalActor htmLive
  refine ⟨m, p₂, run, hGlobalLegal, ?_, ?_, ?_⟩
  · simp [p₂, p₁, step, hlocalPhase]
  · intro hf
    have hf₁ := hf.snoc_nonshortener hErase
      (erase_legal_actor_ne_shortener hErase)
    refine ⟨hf₁, ?_⟩
    intro hs'
    rw [show hs' = hs from Subsingleton.elim _ _]
    change Action.select m = chosen.1
    exact hm.symm
  · intro hcorr
    exact hcorr.after_inside_select ht

/-- Legality of the local Prolonger pass used to advance a frozen active cone
when the global move was outside it. -/
theorem SweepTrace.advance_pass_legal_of_mem
    {D : Finset Vertex} {N t b : ℕ}
    {gp lp : Pos} {gh : History D (initialPos b) gp}
    {lh : History (Erdos872.quotientCone D N t) (initialPos (b + 1)) lp}
    {batches pending mode m}
    (tr : SweepTrace D N t b gh lh batches pending mode)
    (hphase : lp.phase = Phase.regular Player.prolonger)
    (hm : m ∈ effectiveLocalLive
      (Erdos872.quotientCone D N t) lp pending) :
    Action.pass ∈ legalActions (Erdos872.quotientCone D N t)
      (step (Erdos872.quotientCone D N t) lp
        (Action.erase (unionAll pending))) := by
  have hm' := tr.mem_live_after_flush hm
  apply pass_mem_legalActions rfl
    (by simpa [step] using hphase)
  exact Finset.nonempty_iff_ne_empty.mp ⟨m, hm'⟩
set_option maxHeartbeats 200000

private lemma maximizing_node_outcome_le
    {D : Finset Vertex} {p : Pos} {a : Action}
    (ha : a ∈ legalActions D p)
    (hnotS : actorAt D p ≠ some Actor.shortener) :
    score a + gameValue D (step D p a) ≤ gameValue D p := by
  have hne : (legalActions D p).Nonempty := ⟨a, ha⟩
  conv_rhs => rw [gameValue]
  simp only [dif_pos hne]
  cases hactor : actorAt D p with
  | none =>
      have hempty := legalActions_eq_empty_of_actorAt_none D p hactor
      simp [hempty] at ha
  | some who =>
      cases who with
      | eraser =>
          simp only
          have hm : (⟨a, ha⟩ : {z // z ∈ legalActions D p}) ∈
              (legalActions D p).attach := by simp
          simpa using Finset.le_sup'
            (fun z : {z // z ∈ legalActions D p} =>
              score z.1 + gameValue D (step D p z.1)) hm
      | prolonger =>
          simp only
          have hm : (⟨a, ha⟩ : {z // z ∈ legalActions D p}) ∈
              (legalActions D p).attach := by simp
          simpa using Finset.le_sup'
            (fun z : {z // z ∈ legalActions D p} =>
              score z.1 + gameValue D (step D p z.1)) hm
      | shortener => exact False.elim (hnotS hactor)

theorem history_totalScore_add_value_le
    {D : Finset Vertex} {start p : Pos}
    (h : History D start p) (hf : FollowsLocalMinimizer h) :
    h.totalScore + gameValue D p ≤ gameValue D start := by
  induction h with
  | root => simp [History.totalScore]
  | @snoc q h a ha ih =>
      rcases hf with ⟨hf, hmin⟩
      have ih' := ih hf
      by_cases hs : actorAt D q = some Actor.shortener
      · have heq := hmin hs
        rw [History.totalScore]
        omega
      · have hmax := maximizing_node_outcome_le ha hs
        rw [History.totalScore]
        omega

lemma History.totalScore_eq_selectedVertices_length
    {D : Finset Vertex} {start p : Pos} (h : History D start p) :
    h.totalScore = (selectedVertices h.actions).length := by
  induction h with
  | root => rfl
  | snoc h a ha ih =>
      cases a <;>
        simp [History.totalScore, History.actions, selectedVertices_append,
          selectedVertices, score, ih]

structure CompletedSweepTrace
    (D : Finset Vertex) (N t b : ℕ) where
  globalEnd : Pos
  globalHistory : History D (initialPos b) globalEnd
  localEnd : Pos
  localHistory : History (Erdos872.quotientCone D N t)
    (initialPos (b + 1)) localEnd
  erasureBatches : List (List (Finset Vertex))
  pending : List (Finset Vertex)
  mode : LocalMode b
  exactProjection : SweepTrace D N t b globalHistory localHistory
    erasureBatches pending mode
  activated : mode.tally? ≠ none
  globalComplete : actorAt D globalEnd = none

theorem OpeningTally.count_le_max_of_baseOpeningCount
    {b : ℕ} (c : OpeningTally b) (hbase : c.baseOpeningCount ≤ b) :
    c.count ≤ max (b + 1) 2 := by
  cases c <;>
    simp [OpeningTally.baseOpeningCount, OpeningTally.count] at hbase ⊢ <;>
    omega

theorem LocalMode.count_le_max_of_operationalBudget
    {b : ℕ} {gp : Pos} (mode : LocalMode b)
    (hbudget : OperationalBudget gp mode)
    (hactive : mode.tally? ≠ none) : mode.count ≤ max (b + 1) 2 := by
  cases mode with
  | openingDormant => simp [LocalMode.tally?] at hactive
  | openingActive k =>
      rcases hbudget with ⟨r, hphase, hkr⟩
      simp [LocalMode.count]
      omega
  | postDormant => simp [LocalMode.tally?] at hactive
  | waitingFirst c => exact c.count_le_max_of_baseOpeningCount hbudget
  | responseDueFirst c => exact c.count_le_max_of_baseOpeningCount hbudget
  | running c => exact c.count_le_max_of_baseOpeningCount hbudget
  | responseDueLater c => exact c.count_le_max_of_baseOpeningCount hbudget
  | deadFirst c => exact c.count_le_max_of_baseOpeningCount hbudget
  | deadLater c => exact c.count_le_max_of_baseOpeningCount hbudget

theorem CompletedSweepTrace.opening_count_le_max
    {D : Finset Vertex} {N t b : ℕ}
    (tr : CompletedSweepTrace D N t b) :
    projectedOpeningCount t tr.globalHistory.scheduledActions ≤
      max (b + 1) 2 := by
  rw [tr.exactProjection.projectedOpeningCount_eq]
  exact tr.mode.count_le_max_of_operationalBudget
    tr.exactProjection.operationalBudget tr.activated

theorem CompletedSweepTrace.opening_count_le
    {D : Finset Vertex} {N t b : ℕ} (hb : 1 ≤ b)
    (tr : CompletedSweepTrace D N t b) :
    projectedOpeningCount t tr.globalHistory.scheduledActions ≤ b + 1 := by
  rw [← Erdos872.local_opening_count b hb]
  exact tr.opening_count_le_max

lemma liveLegal_eq_empty_of_actorAt_none
    {D : Finset Vertex} {p : Pos} (h : actorAt D p = none) :
    liveLegal D p.state = ∅ := by
  unfold actorAt at h
  split at h
  · assumption
  · cases hs : p.stage <;> simp [hs] at h
    cases hp : p.phase <;> simp [hp] at h
    rename_i who
    cases who <;> simp at h

theorem CompletedSweepTrace.effective_local_terminal
    {D : Finset Vertex} {N t b : ℕ}
    (tr : CompletedSweepTrace D N t b) :
    effectiveLocalLive (Erdos872.quotientCone D N t)
      tr.localEnd tr.pending = ∅ := by
  have hcorr := tr.exactProjection.live_corresponds
  have hempty := liveLegal_eq_empty_of_actorAt_none tr.globalComplete
  rw [HistoryLiveCorresponds, LiveCorresponds, quotientLive, hempty] at hcorr
  simpa [Erdos872.quotientCone] using hcorr.symm

/-- The final local object has two genuinely different shapes.  If the local
prefix is already terminal, no erasure action can legally be appended.  In the
other branch the accumulated pending disturbances are flushed by one actual
legal erasure, producing an extended terminal history. -/
inductive FinalizedLocalTrace
    {D : Finset Vertex} {N t b : ℕ} (tr : CompletedSweepTrace D N t b) : Type
  | alreadyTerminal
      (hterminal : actorAt (Erdos872.quotientCone D N t) tr.localEnd = none) :
      FinalizedLocalTrace tr
  | flushed
      (hlegal : Action.erase (unionAll tr.pending) ∈
        legalActions (Erdos872.quotientCone D N t) tr.localEnd)
      (hterminal : actorAt (Erdos872.quotientCone D N t)
        (step (Erdos872.quotientCone D N t) tr.localEnd
          (Action.erase (unionAll tr.pending))) = none) :
      FinalizedLocalTrace tr

def FinalizedLocalTrace.end
    {D : Finset Vertex} {N t b : ℕ} {tr : CompletedSweepTrace D N t b} :
    FinalizedLocalTrace tr → Pos
  | .alreadyTerminal _ => tr.localEnd
  | .flushed _ _ =>
      step (Erdos872.quotientCone D N t) tr.localEnd
        (Action.erase (unionAll tr.pending))

def FinalizedLocalTrace.history
    {D : Finset Vertex} {N t b : ℕ} {tr : CompletedSweepTrace D N t b}
    (fin : FinalizedLocalTrace tr) :
    History (Erdos872.quotientCone D N t) (initialPos (b + 1)) fin.end := by
  cases fin with
  | alreadyTerminal => exact tr.localHistory
  | flushed hlegal hterminal =>
      exact History.snoc tr.localHistory _ hlegal

def FinalizedLocalTrace.batches
    {D : Finset Vertex} {N t b : ℕ} {tr : CompletedSweepTrace D N t b} :
    FinalizedLocalTrace tr → List (List (Finset Vertex))
  | .alreadyTerminal _ => tr.erasureBatches
  | .flushed _ _ => tr.erasureBatches ++ [tr.pending]

def FinalizedLocalTrace.residual
    {D : Finset Vertex} {N t b : ℕ} {tr : CompletedSweepTrace D N t b} :
    FinalizedLocalTrace tr → List (Finset Vertex)
  | .alreadyTerminal _ => tr.pending
  | .flushed _ _ => []

noncomputable def CompletedSweepTrace.finalize
    {D : Finset Vertex} {N t b : ℕ} (ht : 0 < t)
    (tr : CompletedSweepTrace D N t b) : FinalizedLocalTrace tr := by
  let Q := Erdos872.quotientCone D N t
  let U := unionAll tr.pending
  have hU : IsUpset Q U := unionAll_isUpset
    (tr.exactProjection.pending_are_upsets ht)
  have heffective := tr.effective_local_terminal
  change liveLegal Q tr.localEnd.state \ U = ∅ at heffective
  by_cases hlive : liveLegal Q tr.localEnd.state = ∅
  · apply FinalizedLocalTrace.alreadyTerminal
    change actorAt Q tr.localEnd = none
    unfold actorAt
    rw [if_pos hlive]
  · have hstage : tr.localEnd.stage = Stage.beforeErase :=
      tr.exactProjection.local_stage
    have hlegal : Action.erase U ∈ legalActions Q tr.localEnd := by
      unfold legalActions
      rw [if_neg hlive, hstage]
      unfold erasureActions
      apply Finset.mem_image.mpr
      refine ⟨U, ?_, rfl⟩
      simp only [globalUpsets, Finset.mem_filter, Finset.mem_powerset]
      exact ⟨hU.1, hU⟩
    apply FinalizedLocalTrace.flushed hlegal
    have hafter : liveLegal Q
        (step Q tr.localEnd (Action.erase U)).state = ∅ := by
      rw [show (step Q tr.localEnd (Action.erase U)).state =
          eraseState Q tr.localEnd.state U by rfl]
      rw [liveLegal_eraseState_eq_sdiff]
      exact heffective
    change actorAt Q (step Q tr.localEnd (Action.erase U)) = none
    unfold actorAt
    rw [if_pos hafter]

theorem FinalizedLocalTrace.terminal
    {D : Finset Vertex} {N t b : ℕ} {tr : CompletedSweepTrace D N t b}
    (fin : FinalizedLocalTrace tr) :
    actorAt (Erdos872.quotientCone D N t) fin.end = none := by
  cases fin with
  | alreadyTerminal hterminal => exact hterminal
  | flushed hlegal hterminal => exact hterminal

theorem FinalizedLocalTrace.actions_eq
    {D : Finset Vertex} {N t b : ℕ} {tr : CompletedSweepTrace D N t b}
    (fin : FinalizedLocalTrace tr) :
    fin.history.actions =
      match fin with
      | .alreadyTerminal _ => tr.localHistory.actions
      | .flushed _ _ =>
          tr.localHistory.actions ++ [Action.erase (unionAll tr.pending)] := by
  cases fin <;> simp [FinalizedLocalTrace.history, History.actions]

theorem FinalizedLocalTrace.erases_exactly
    {D : Finset Vertex} {N t b : ℕ} {tr : CompletedSweepTrace D N t b}
    (fin : FinalizedLocalTrace tr) :
    erasurePayloads fin.history.actions = fin.batches.map unionAll := by
  cases fin with
  | alreadyTerminal hterminal =>
      exact tr.exactProjection.erases_exactly
  | flushed hlegal hterminal =>
      rw [FinalizedLocalTrace.actions_eq, erasurePayloads_append,
        tr.exactProjection.erases_exactly]
      simp [FinalizedLocalTrace.batches, erasurePayloads]

theorem FinalizedLocalTrace.conserves_disturbances
    {D : Finset Vertex} {N t b : ℕ} {tr : CompletedSweepTrace D N t b}
    (fin : FinalizedLocalTrace tr) :
    fin.batches.flatten ++ fin.residual =
      projectedDisturbances D N t tr.globalHistory.actions := by
  cases fin with
  | alreadyTerminal hterminal =>
      exact tr.exactProjection.conserves_disturbances
  | flushed hlegal hterminal =>
      rw [FinalizedLocalTrace.batches, FinalizedLocalTrace.residual,
        List.append_nil, List.flatten_append]
      simpa using tr.exactProjection.conserves_disturbances

theorem FinalizedLocalTrace.residual_empty_or_terminal
    {D : Finset Vertex} {N t b : ℕ} {tr : CompletedSweepTrace D N t b}
    (fin : FinalizedLocalTrace tr) :
    fin.residual = [] ∨
      actorAt (Erdos872.quotientCone D N t) tr.localEnd = none := by
  cases fin with
  | alreadyTerminal hterminal => exact Or.inr hterminal
  | flushed hlegal hterminal => exact Or.inl rfl

theorem FinalizedLocalTrace.selected_eq
    {D : Finset Vertex} {N t b : ℕ} {tr : CompletedSweepTrace D N t b}
    (fin : FinalizedLocalTrace tr) :
    selectedVertices fin.history.actions =
      selectedVertices tr.localHistory.actions := by
  cases fin with
  | alreadyTerminal hterminal => rfl
  | flushed hlegal hterminal =>
      rw [FinalizedLocalTrace.actions_eq, selectedVertices_append]
      simp [selectedVertices]

theorem FinalizedLocalTrace.follows_fixed_strategy
    {D : Finset Vertex} {N t b : ℕ} {tr : CompletedSweepTrace D N t b}
    (fin : FinalizedLocalTrace tr) :
    FollowsShortenerStrategy optimalShortener fin.history := by
  cases fin with
  | alreadyTerminal hterminal =>
      exact tr.exactProjection.follows_fixed_strategy
  | flushed hlegal hterminal =>
      refine ⟨tr.exactProjection.follows_fixed_strategy, ?_⟩
      intro hs
      exact False.elim (erase_legal_actor_ne_shortener hlegal hs)

lemma gameValue_eq_zero_of_actorAt_none
    {D : Finset Vertex} {p : Pos} (hterminal : actorAt D p = none) :
    gameValue D p = 0 := by
  have hempty := legalActions_eq_empty_of_actorAt_none D p hterminal
  rw [gameValue]
  simp [hempty]

theorem projected_inside_count_le_v
    {D : Finset Vertex} {N t b : ℕ} (ht : 0 < t)
    (tr : CompletedSweepTrace D N t b) :
    (projectedConeSelections t tr.globalHistory.actions).length ≤
      v (b + 1) (Erdos872.quotientCone D N t) := by
  let fin := tr.finalize ht
  have hterminal := fin.terminal
  have hprefix := history_totalScore_add_value_le fin.history
    (followsOptimalShortener_implies_minimizer fin.history
      fin.follows_fixed_strategy)
  have hzero := gameValue_eq_zero_of_actorAt_none hterminal
  rw [hzero, Nat.add_zero] at hprefix
  rw [fin.history.totalScore_eq_selectedVertices_length,
    fin.selected_eq, tr.exactProjection.retains_exactly ht] at hprefix
  simpa [v] using hprefix

theorem CompletedSweepTrace.bounds
    {D : Finset Vertex} {N t b : ℕ} (ht : 0 < t) (hb : 1 ≤ b)
    (tr : CompletedSweepTrace D N t b) :
    projectedOpeningCount t tr.globalHistory.scheduledActions ≤ b + 1 ∧
      (projectedConeSelections t tr.globalHistory.actions).length ≤
        v (b + 1) (Erdos872.quotientCone D N t) :=
  ⟨tr.opening_count_le hb, projected_inside_count_le_v ht tr⟩

theorem quotientCone_isDownset
    {D : Finset Vertex} {N t : ℕ}
    (hD : IsDownset N D) (ht : 0 < t) :
    IsDownset (N / t) (Erdos872.quotientCone D N t) := by
  have hDiv : Erdos872.DivDownset D := by
    intro x y hx hyx
    have hxBoard := hD.1 hx
    have hxPos : 0 < x := (Finset.mem_Icc.mp hxBoard).1
    have hyPos : 0 < y := Nat.pos_of_dvd_of_pos hyx hxPos
    have hyLe : y ≤ x := Nat.le_of_dvd hxPos hyx
    exact hD.2 x hx y
      (Finset.mem_Icc.mpr
        ⟨hyPos, hyLe.trans (Finset.mem_Icc.mp hxBoard).2⟩) hyx
  have hQ := Erdos872.quotientCone_downset (N := N) (t := t) hDiv ht
  exact ⟨fun _ hm => (Finset.mem_filter.mp hm).1,
    fun _ hx _ _ hyx => hQ hx hyx⟩

theorem projected_inside_count_le_V
    {D : Finset Vertex} {N t b : ℕ}
    (hD : IsDownset N D) (ht : 0 < t)
    (tr : CompletedSweepTrace D N t b) :
    (projectedConeSelections t tr.globalHistory.actions).length ≤
      V (b + 1) (N / t) := by
  refine (projected_inside_count_le_v ht tr).trans ?_
  unfold V
  apply Finset.le_sup
  exact mem_downsets_iff.mpr (quotientCone_isDownset hD ht)

end

end Erdos872R177

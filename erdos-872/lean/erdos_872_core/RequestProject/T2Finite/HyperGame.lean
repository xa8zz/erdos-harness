import Mathlib
import RequestProject.T2Finite.HyperDefs

open scoped BigOperators
open Finset

noncomputable section

namespace RequestProject.T2Finite

set_option linter.unusedSectionVars false

variable {V E : Type} [DecidableEq V] [Fintype V] [DecidableEq E] [Fintype E]

lemma hyperCapturedCount_le_three (H : HyperSystem V E) (s : HyperState V E) (e : E) :
    hyperCapturedCount H s e ≤ 3 := by
  unfold hyperCapturedCount
  exact Nat.le_trans (Finset.card_le_card Finset.inter_subset_left) (H.verts_card_three e).le

lemma liveHyperEdge_maker_iff_of_ne
    (H : HyperSystem V E) (s : HyperState V E) {f e : E} (hne : e ≠ f) :
    liveHyperEdge H (makerScoreMove H s f) e ↔ liveHyperEdge H s e := by
  unfold liveHyperEdge makerScoreMove
  simp [hne]

lemma liveHyperEdge_breakerScore_iff_of_ne
    (H : HyperSystem V E) (s : HyperState V E) {g e : E} (hne : e ≠ g) :
    liveHyperEdge H (breakerScoreEdge s g) e ↔ liveHyperEdge H s e := by
  unfold liveHyperEdge breakerScoreEdge
  simp [hne]

lemma hyperCapturedCount_mono_after_maker
    (H : HyperSystem V E) (s : HyperState V E) (f e : E) :
    hyperCapturedCount H s e ≤ hyperCapturedCount H (makerScoreMove H s f) e := by
  unfold hyperCapturedCount makerScoreMove
  exact Finset.card_le_card <| by
    intro v hv
    rcases Finset.mem_inter.mp hv with ⟨hv1, hv2⟩
    exact Finset.mem_inter.mpr ⟨hv1, Finset.mem_union.mpr (Or.inl hv2)⟩

lemma HQ8_empty_eq_totalWeight (H : HyperSystem V E) :
    HQ8 H emptyHyperState = Finset.univ.sum (fun e => (H.weight e : ℤ)) := by
  classical
  simp [HQ8, hyperEdgeContrib, hyperEdgePot, liveHyperEdge, emptyHyperState, hyperCapturedCount]

lemma HQ8_terminal_eq_eight_scoredWeight
    (H : HyperSystem V E) (s : HyperState V E)
    (hdead : ∀ e, e ∉ s.scored → ¬ liveHyperEdge H s e) :
    HQ8 H s = 8 * scoredWeight H s := by
  classical
  calc
    HQ8 H s = Finset.univ.sum (fun e => if e ∈ s.scored then (8 * H.weight e : ℤ) else 0) := by
      unfold HQ8
      refine Finset.sum_congr rfl ?_
      intro e _
      by_cases hscore : e ∈ s.scored
      · simp [hyperEdgeContrib, hscore]
      · have hnotlive : ¬ liveHyperEdge H s e := hdead e hscore
        simp [hyperEdgeContrib, hyperEdgePot, hscore, hnotlive]
    _ = s.scored.sum (fun e => (8 * H.weight e : ℤ)) := by
      simp
    _ = 8 * scoredWeight H s := by
      simp [scoredWeight, Finset.mul_sum]

lemma hyperEdgeContrib_mono_after_maker_of_ne
    (H : HyperSystem V E) (s : HyperState V E) {f e : E}
    (hne : e ≠ f) :
    hyperEdgeContrib H (makerScoreMove H s f) e ≥ hyperEdgeContrib H s e := by
  classical
  by_cases hscore : e ∈ s.scored
  · simp [hyperEdgeContrib, makerScoreMove, hscore, hne]
  · have hscore' : e ∉ (makerScoreMove H s f).scored := by
      simp [makerScoreMove, hscore, hne]
    have hlive : liveHyperEdge H (makerScoreMove H s f) e ↔ liveHyperEdge H s e :=
      liveHyperEdge_maker_iff_of_ne H s hne
    by_cases hLive : liveHyperEdge H s e
    · have hLive' : liveHyperEdge H (makerScoreMove H s f) e := hlive.mpr hLive
      simp [hyperEdgeContrib, hyperEdgePot, hscore, hscore', hLive, hLive']
      have hpow :
          2 ^ hyperCapturedCount H s e ≤ 2 ^ hyperCapturedCount H (makerScoreMove H s f) e :=
        Nat.pow_le_pow_right (by decide) (hyperCapturedCount_mono_after_maker H s f e)
      have hmul :
          2 ^ hyperCapturedCount H s e * H.weight e ≤
            2 ^ hyperCapturedCount H (makerScoreMove H s f) e * H.weight e :=
        Nat.mul_le_mul_right (H.weight e) hpow
      have hz :
          (((2 ^ hyperCapturedCount H s e * H.weight e : ℕ) : ℤ)) ≤
            (((2 ^ hyperCapturedCount H (makerScoreMove H s f) e * H.weight e : ℕ) : ℤ)) := by
        exact_mod_cast hmul
      simpa [ge_iff_le] using hz
    · have hLive' : ¬ liveHyperEdge H (makerScoreMove H s f) e := by
        intro h
        exact hLive (hlive.mp h)
      simp [hyperEdgeContrib, hyperEdgePot, hscore, hscore', hLive, hLive']

lemma selected_hyperedge_contrib_nonneg_gain
    (H : HyperSystem V E) (s : HyperState V E) {f : E}
    (hf : liveHyperEdge H s f) :
    hyperEdgeContrib H (makerScoreMove H s f) f ≥ hyperEdgeContrib H s f := by
  classical
  have hscore : f ∉ s.scored := hf.1
  unfold hyperEdgeContrib hyperEdgePot makerScoreMove
  simp [hf, hscore]
  have hcc := hyperCapturedCount_le_three H s f
  interval_cases hc : hyperCapturedCount H s f <;> simp <;> nlinarith

lemma selected_hyperedge_contrib_gain_ge_self_of_count_le_two
    (H : HyperSystem V E) (s : HyperState V E) {f : E}
    (hf : liveHyperEdge H s f) (hcount : hyperCapturedCount H s f ≤ 2) :
    hyperEdgeContrib H (makerScoreMove H s f) f ≥
      hyperEdgeContrib H s f + hyperEdgePot H s f := by
  classical
  have hscore : f ∉ s.scored := hf.1
  unfold hyperEdgeContrib hyperEdgePot makerScoreMove
  simp [hf, hscore]
  interval_cases hc : hyperCapturedCount H s f <;> simp at hcount ⊢ <;> nlinarith

lemma HQ8_maker_ge
    (H : HyperSystem V E) (s : HyperState V E) {f : E}
    (hf : liveHyperEdge H s f) :
    HQ8 H (makerScoreMove H s f) ≥ HQ8 H s := by
  classical
  unfold HQ8
  calc
    Finset.univ.sum (fun e => hyperEdgeContrib H (makerScoreMove H s f) e)
        ≥ Finset.univ.sum (fun e => hyperEdgeContrib H s e) := by
          refine Finset.sum_le_sum ?_
          intro e he
          by_cases h : e = f
          · subst h
            simpa using selected_hyperedge_contrib_nonneg_gain H s hf
          · have hmono := hyperEdgeContrib_mono_after_maker_of_ne H s h
            simpa using hmono
    _ = HQ8 H s := by rfl

lemma HQ8_maker_ge_add_selfPot_of_count_le_two
    (H : HyperSystem V E) (s : HyperState V E) {f : E}
    (hf : liveHyperEdge H s f) (hcount : hyperCapturedCount H s f ≤ 2) :
    HQ8 H (makerScoreMove H s f) ≥ HQ8 H s + hyperEdgePot H s f := by
  classical
  unfold HQ8
  calc
    Finset.univ.sum (fun e => hyperEdgeContrib H (makerScoreMove H s f) e)
        ≥ Finset.univ.sum (fun e => hyperEdgeContrib H s e + if e = f then hyperEdgePot H s e else 0) := by
          refine Finset.sum_le_sum ?_
          intro e he
          by_cases h : e = f
          · subst h
            simpa using selected_hyperedge_contrib_gain_ge_self_of_count_le_two H s hf hcount
          · have hmono := hyperEdgeContrib_mono_after_maker_of_ne H s h
            simpa [h] using hmono
    _ = Finset.univ.sum (fun e => hyperEdgeContrib H s e) + hyperEdgePot H s f := by
          rw [Finset.sum_add_distrib]
          simp

lemma hyperEdgeContrib_after_breaker_score
    (H : HyperSystem V E) (s : HyperState V E) {g e : E}
    (hg : liveHyperEdge H s g) :
    hyperEdgeContrib H (breakerScoreEdge s g) e ≥ hyperEdgeContrib H s e := by
  classical
  by_cases h : e = g
  · subst h
    have hscore : e ∉ s.scored := hg.1
    have hcc := hyperCapturedCount_le_three H s e
    unfold hyperEdgeContrib hyperEdgePot breakerScoreEdge
    simp [hg, hscore]
    interval_cases hc : hyperCapturedCount H s e <;> simp <;> nlinarith
  · by_cases hscore : e ∈ s.scored
    · simp [hyperEdgeContrib, breakerScoreEdge, hscore, h]
    · have hscore' : e ∉ (breakerScoreEdge s g).scored := by
        simp [breakerScoreEdge, hscore, h]
      have hlive : liveHyperEdge H (breakerScoreEdge s g) e ↔ liveHyperEdge H s e :=
        liveHyperEdge_breakerScore_iff_of_ne H s h
      by_cases hLive : liveHyperEdge H s e
      · have hLive' : liveHyperEdge H (breakerScoreEdge s g) e := hlive.mpr hLive
        have hcount :
            hyperCapturedCount H (breakerScoreEdge s g) e = hyperCapturedCount H s e := by
          simp [hyperCapturedCount, breakerScoreEdge]
        rw [hyperEdgeContrib, if_neg hscore', hyperEdgePot, if_pos hLive', hyperEdgeContrib,
          if_neg hscore, hyperEdgePot, if_pos hLive, hcount]
      · have hLive' : ¬ liveHyperEdge H (breakerScoreEdge s g) e := by
          intro hl
          exact hLive (hlive.mp hl)
        simp [hyperEdgeContrib, hyperEdgePot, hscore, hscore', hLive, hLive']

lemma HQ8_breaker_score_ge
    (H : HyperSystem V E) (s : HyperState V E) {g : E}
    (hg : liveHyperEdge H s g) :
    HQ8 H (breakerScoreEdge s g) ≥ HQ8 H s := by
  classical
  unfold HQ8
  refine Finset.sum_le_sum ?_
  intro e he
  simpa using hyperEdgeContrib_after_breaker_score H s hg

end RequestProject.T2Finite

import Mathlib
import RequestProject.T2Finite.Defs

open scoped BigOperators
open Finset

noncomputable section

namespace RequestProject.T2Finite

set_option linter.unusedSectionVars false

variable {V E : Type} [DecidableEq V] [Fintype V] [DecidableEq E] [Fintype E]

lemma capturedCount_le_two (G : GraphSystem V E) (s : GraphState V E) (e : E) :
    capturedCount G s e ≤ 2 := by
  unfold capturedCount
  exact Nat.le_trans (Finset.card_le_card Finset.inter_subset_left) (G.verts_card_two e).le

lemma liveEdge_maker_iff_of_ne
    (G : GraphSystem V E) (s : GraphState V E) {f e : E} (hne : e ≠ f) :
    liveEdge G (makerMove G s f) e ↔ liveEdge G s e := by
  unfold liveEdge makerMove
  simp [hne]

lemma capturedCount_mono_after_maker
    (G : GraphSystem V E) (s : GraphState V E) (f e : E) :
    capturedCount G s e ≤ capturedCount G (makerMove G s f) e := by
  unfold capturedCount makerMove
  exact Finset.card_le_card <| by
    intro v hv
    rcases Finset.mem_inter.mp hv with ⟨hv1, hv2⟩
    exact Finset.mem_inter.mpr ⟨hv1, Finset.mem_union.mpr (Or.inl hv2)⟩

lemma Q8_empty_eq_totalWeight (G : GraphSystem V E) :
    Q8 G emptyState = Finset.univ.sum (fun e => (G.weight e : ℤ)) := by
  classical
  simp [Q8, edgeContrib, edgePot, liveEdge, emptyState, capturedCount]

lemma Q8_terminal_eq_eight_claimedWeight
    (G : GraphSystem V E) (s : GraphState V E)
    (hdead : ∀ e, e ∉ s.claimed → ¬ liveEdge G s e) :
    Q8 G s = 8 * claimedWeight G s := by
  classical
  calc
    Q8 G s = Finset.univ.sum (fun e => if e ∈ s.claimed then (8 * G.weight e : ℤ) else 0) := by
      unfold Q8
      refine Finset.sum_congr rfl ?_
      intro e _
      by_cases hclaim : e ∈ s.claimed
      · simp [edgeContrib, hclaim]
      · have hnotlive : ¬ liveEdge G s e := hdead e hclaim
        simp [edgeContrib, edgePot, hclaim, hnotlive]
    _ = s.claimed.sum (fun e => (8 * G.weight e : ℤ)) := by
      simp
    _ = 8 * claimedWeight G s := by
      simp [claimedWeight, Finset.mul_sum]

lemma edgeContrib_mono_after_maker_of_ne
    (G : GraphSystem V E) (s : GraphState V E) {f e : E}
    (hne : e ≠ f) :
    edgeContrib G (makerMove G s f) e ≥ edgeContrib G s e := by
  classical
  by_cases hclaim : e ∈ s.claimed
  · simp [edgeContrib, makerMove, hclaim, hne]
  · have hclaim' : e ∉ (makerMove G s f).claimed := by
      simp [makerMove, hclaim, hne]
    have hlive : liveEdge G (makerMove G s f) e ↔ liveEdge G s e :=
      liveEdge_maker_iff_of_ne G s hne
    by_cases hLive : liveEdge G s e
    · have hLive' : liveEdge G (makerMove G s f) e := hlive.mpr hLive
      simp [edgeContrib, edgePot, hclaim, hclaim', hLive, hLive']
      have hpow :
          2 ^ capturedCount G s e ≤ 2 ^ capturedCount G (makerMove G s f) e :=
        Nat.pow_le_pow_right (by decide) (capturedCount_mono_after_maker G s f e)
      have hmul :
          2 ^ capturedCount G s e * G.weight e ≤
            2 ^ capturedCount G (makerMove G s f) e * G.weight e :=
        Nat.mul_le_mul_right (G.weight e) hpow
      have hz :
          (((2 ^ capturedCount G s e * G.weight e : ℕ) : ℤ)) ≤
            (((2 ^ capturedCount G (makerMove G s f) e * G.weight e : ℕ) : ℤ)) := by
        exact_mod_cast hmul
      simpa [ge_iff_le] using hz
    · have hLive' : ¬ liveEdge G (makerMove G s f) e := by
        intro h
        exact hLive (hlive.mp h)
      simp [edgeContrib, edgePot, hclaim, hclaim', hLive, hLive']

lemma selected_edge_contrib_gain_ge_self
    (G : GraphSystem V E) (s : GraphState V E) {f : E}
    (hf : liveEdge G s f) :
    edgeContrib G (makerMove G s f) f ≥ edgeContrib G s f + edgePot G s f := by
  classical
  have hclaim : f ∉ s.claimed := hf.1
  have hcc := capturedCount_le_two G s f
  unfold edgeContrib edgePot makerMove
  simp [hf, hclaim]
  interval_cases hc : capturedCount G s f <;> simp <;> nlinarith

lemma Q8_maker_ge_add_selfPot
    (G : GraphSystem V E) (s : GraphState V E) {f : E}
    (hf : liveEdge G s f) :
    Q8 G (makerMove G s f) ≥ Q8 G s + edgePot G s f := by
  classical
  unfold Q8
  calc
    Finset.univ.sum (fun e => edgeContrib G (makerMove G s f) e)
        ≥ Finset.univ.sum (fun e => edgeContrib G s e + if e = f then edgePot G s e else 0) := by
          refine Finset.sum_le_sum ?_
          intro e he
          by_cases h : e = f
          · subst h
            simpa using selected_edge_contrib_gain_ge_self G s hf
          · have hmono := edgeContrib_mono_after_maker_of_ne G s h
            simpa [h] using hmono
    _ = Finset.univ.sum (fun e => edgeContrib G s e) + edgePot G s f := by
          rw [Finset.sum_add_distrib]
          simp

end RequestProject.T2Finite

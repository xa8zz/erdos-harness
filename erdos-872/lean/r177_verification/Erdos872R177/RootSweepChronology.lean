import Mathlib

namespace Erdos872R177

open Finset
open scoped BigOperators

noncomputable section

/-! # Pure root-sweep chronology helpers -/

/-- The manuscript weight `ν_t = N / t`. -/
def rootWeight (N t : ℕ) : ℝ := (N : ℝ) / (t : ℝ)

/-- Deterministic root order: positive tags occur in ascending numerical order,
equivalently in weakly decreasing `rootWeight` order. -/
def orderedRoots (R : Finset ℕ) : List ℕ := R.sort (· ≤ ·)

/-- The first root in the deterministic order, if one exists. -/
def nextRoot? (R : Finset ℕ) : Option ℕ := (orderedRoots R).head?

@[simp] theorem mem_orderedRoots {R : Finset ℕ} {t : ℕ} :
    t ∈ orderedRoots R ↔ t ∈ R := by
  simp [orderedRoots]

@[simp] theorem nextRoot?_eq_none_iff (R : Finset ℕ) :
    nextRoot? R = none ↔ R = ∅ := by
  constructor
  · intro hnone
    have hnil : orderedRoots R = [] := by
      cases hlist : orderedRoots R with
      | nil => rfl
      | cons a l => simp [nextRoot?, hlist] at hnone
    have hlen : (orderedRoots R).length = 0 := by simp [hnil]
    have hcard : R.card = 0 := by simpa [orderedRoots] using hlen
    exact Finset.card_eq_zero.mp hcard
  · intro hR
    subst R
    simp [nextRoot?, orderedRoots]

theorem nextRoot?_mem {R : Finset ℕ} {t : ℕ}
    (hnext : nextRoot? R = some t) : t ∈ R := by
  cases hlist : orderedRoots R with
  | nil => simp [nextRoot?, hlist] at hnext
  | cons a l =>
      have ha : a ∈ orderedRoots R := by simp [hlist]
      have hat : a = t := by simpa [nextRoot?, hlist] using hnext
      rw [← hat]
      exact mem_orderedRoots.mp ha

theorem nextRoot?_minimal {R : Finset ℕ} {t s : ℕ}
    (hnext : nextRoot? R = some t) (hs : s ∈ R) : t ≤ s := by
  cases hlist : orderedRoots R with
  | nil => simp [nextRoot?, hlist] at hnext
  | cons a l =>
      have hat : a = t := by simpa [nextRoot?, hlist] using hnext
      have hslist : s ∈ orderedRoots R := mem_orderedRoots.mpr hs
      rw [hlist] at hslist
      have hsorted : (orderedRoots R).Pairwise (· ≤ ·) := by
        simp [orderedRoots]
      rw [hlist] at hsorted
      rcases List.pairwise_cons.mp hsorted with ⟨hale, _⟩
      rcases List.mem_cons.mp hslist with rfl | hsl
      · exact hat.ge
      · simpa [hat] using hale s hsl

theorem rootWeight_nonneg (N t : ℕ) : 0 ≤ rootWeight N t := by
  exact div_nonneg (Nat.cast_nonneg N) (Nat.cast_nonneg t)

/-- For a nonnegative numerator and positive tags, increasing the tag weakly
decreases the root weight. -/
theorem rootWeight_antitone {N s t : ℕ}
    (hN : 0 ≤ (N : ℝ)) (hs : 0 < s) (hst : s ≤ t) :
    rootWeight N t ≤ rootWeight N s := by
  apply div_le_div_of_nonneg_left hN
  · exact_mod_cast hs
  · exact_mod_cast hst

theorem nextRoot?_weight_ge {N : ℕ} {R : Finset ℕ} {t s : ℕ}
    (hN : 0 ≤ (N : ℝ)) (hpos : ∀ r ∈ R, 0 < r)
    (hnext : nextRoot? R = some t) (hs : s ∈ R) :
    rootWeight N s ≤ rootWeight N t := by
  exact rootWeight_antitone hN (hpos t (nextRoot?_mem hnext))
    (nextRoot?_minimal hnext hs)

/-- Sum of root weights over a finite set. -/
def rootWeightSum (N : ℕ) (S : Finset ℕ) : ℝ :=
  ∑ t ∈ S, rootWeight N t

/-- Sum of root weights over a chronological list. -/
def rootWeightList (N : ℕ) (xs : List ℕ) : ℝ :=
  (xs.map (rootWeight N)).sum

/-- Maximum root weight, with value zero for the empty root set. -/
noncomputable def nuMax (N : ℕ) (R : Finset ℕ) : ℝ :=
  if h : R.Nonempty then R.sup' h (rootWeight N) else 0

theorem rootWeight_le_nuMax {N t : ℕ} {R : Finset ℕ} (ht : t ∈ R) :
    rootWeight N t ≤ nuMax N R := by
  rw [nuMax, dif_pos ⟨t, ht⟩]
  exact Finset.le_sup' (rootWeight N) ht

theorem nuMax_nonneg (N : ℕ) (R : Finset ℕ) : 0 ≤ nuMax N R := by
  by_cases hR : R.Nonempty
  · rcases hR with ⟨t, ht⟩
    exact (rootWeight_nonneg N t).trans (rootWeight_le_nuMax ht)
  · simp [nuMax, hR]

theorem rootWeightSum_nonneg (N : ℕ) (S : Finset ℕ) :
    0 ≤ rootWeightSum N S := by
  exact Finset.sum_nonneg fun t _ => rootWeight_nonneg N t

theorem rootWeightList_toFinset {N : ℕ} {xs : List ℕ}
    (hxs : xs.Nodup) :
    rootWeightSum N xs.toFinset = rootWeightList N xs := by
  exact List.sum_toFinset (rootWeight N) hxs

theorem rootWeightList_le_length_mul_nuMax
    {N : ℕ} {R : Finset ℕ} {xs : List ℕ}
    (hmem : ∀ t ∈ xs, t ∈ R) :
    rootWeightList N xs ≤ (xs.length : ℝ) * nuMax N R := by
  induction xs with
  | nil => simp [rootWeightList]
  | cons a xs ih =>
      have haR : a ∈ R := hmem a (by simp)
      have hxs : ∀ t ∈ xs, t ∈ R := by
        intro t ht
        exact hmem t (by simp [ht])
      have ha := rootWeight_le_nuMax (N := N) haR
      have htail := ih hxs
      calc
        rootWeightList N (a :: xs) =
            rootWeight N a + rootWeightList N xs := by
              simp [rootWeightList]
        _ ≤ nuMax N R + (xs.length : ℝ) * nuMax N R :=
          add_le_add ha htail
        _ = ((a :: xs).length : ℝ) * nuMax N R := by
          simp only [List.length_cons, Nat.cast_add, Nat.cast_one]
          ring

/-- Data supplied by the concrete sweep chronology: every post-opening
activation after the first is injected into a fired root of at least its
weight. -/
structure TailPairing (N : ℕ) (post : List ℕ) (fired : Finset ℕ) where
  pair : ℕ → ℕ
  pair_mem : ∀ {t}, t ∈ post.tail → pair t ∈ fired
  pair_injective : Set.InjOn pair (post.tail.toFinset : Set ℕ)
  weight_le : ∀ {t}, t ∈ post.tail → rootWeight N t ≤ rootWeight N (pair t)

theorem TailPairing.tail_weight_le
    {N : ℕ} {post : List ℕ} {fired : Finset ℕ}
    (P : TailPairing N post fired) (hpost : post.Nodup) :
    rootWeightList N post.tail ≤ rootWeightSum N fired := by
  have htail : post.tail.Nodup := hpost.tail
  rw [← rootWeightList_toFinset htail]
  calc
    rootWeightSum N post.tail.toFinset ≤
        ∑ t ∈ post.tail.toFinset, rootWeight N (P.pair t) := by
      apply Finset.sum_le_sum
      intro t ht
      exact P.weight_le (by simpa using ht)
    _ = rootWeightSum N (post.tail.toFinset.image P.pair) := by
      symm
      exact Finset.sum_image P.pair_injective
    _ ≤ rootWeightSum N fired := by
      apply Finset.sum_le_sum_of_subset_of_nonneg
      · intro u hu
        rcases Finset.mem_image.mp hu with ⟨t, ht, rfl⟩
        exact P.pair_mem (by simpa using ht)
      · intro u _ _
        exact rootWeight_nonneg N u

/-- Pure finite data extracted from a sweep trace.  It deliberately packages
the actual injection and pointwise dominance, not the drafting inequality. -/
structure DraftingData (N b : ℕ) (R : Finset ℕ) where
  opening : List ℕ
  post : List ℕ
  fired : Finset ℕ
  opening_nodup : opening.Nodup
  post_nodup : post.Nodup
  opening_post_disjoint : List.Disjoint opening post
  opening_mem : ∀ t ∈ opening, t ∈ R
  post_mem : ∀ t ∈ post, t ∈ R
  fired_subset : fired ⊆ R
  opening_length_le : opening.length ≤ b
  pairing : TailPairing N post fired

theorem DraftingData.activation_nodup
    {N b : ℕ} {R : Finset ℕ} (d : DraftingData N b R) :
    (d.opening ++ d.post).Nodup :=
  List.nodup_append.mpr
    ⟨d.opening_nodup, d.post_nodup, by
      intro a ha b hb hab
      subst b
      exact d.opening_post_disjoint ha hb⟩

theorem DraftingData.active_toFinset_eq
    {N b : ℕ} {R : Finset ℕ} (d : DraftingData N b R) :
    (d.opening ++ d.post).toFinset =
      d.opening.toFinset ∪ d.post.toFinset := by
  simp

/-- The finite drafting estimate.  The opening list contributes at most `b`
unpaired roots and the head of the post-opening list contributes at most one;
the tail is controlled by the supplied injection into fired roots. -/
theorem DraftingData.weight_le
    {N b : ℕ} {R : Finset ℕ} (d : DraftingData N b R) :
    rootWeightList N d.opening + rootWeightList N d.post ≤
      rootWeightSum N d.fired + ((b + 1 : ℕ) : ℝ) * nuMax N R := by
  have hopen0 := rootWeightList_le_length_mul_nuMax
    (N := N) d.opening_mem
  have hlen : (d.opening.length : ℝ) ≤ (b : ℝ) := by
    exact_mod_cast d.opening_length_le
  have hmax0 := nuMax_nonneg N R
  have hopen : rootWeightList N d.opening ≤ (b : ℝ) * nuMax N R :=
    hopen0.trans (mul_le_mul_of_nonneg_right hlen hmax0)
  have hfired0 := rootWeightSum_nonneg N d.fired
  cases hpost : d.post with
  | nil =>
      simp [rootWeightList] at hopen ⊢
      nlinarith
  | cons a post =>
      have haR : a ∈ R := d.post_mem a (by simp [hpost])
      have ha := rootWeight_le_nuMax (N := N) haR
      have htail := d.pairing.tail_weight_le d.post_nodup
      rw [hpost] at htail
      simp only [List.tail_cons] at htail
      change rootWeightList N d.opening +
          (rootWeight N a + rootWeightList N post) ≤
        rootWeightSum N d.fired + ((b + 1 : ℕ) : ℝ) * nuMax N R
      push_cast
      linarith

theorem DraftingData.active_weight_le
    {N b : ℕ} {R : Finset ℕ} (d : DraftingData N b R) :
    rootWeightSum N (d.opening ++ d.post).toFinset ≤
      rootWeightSum N d.fired + ((b + 1 : ℕ) : ℝ) * nuMax N R := by
  rw [rootWeightList_toFinset d.activation_nodup]
  simpa [rootWeightList] using d.weight_le

/-- Disjoint activated and fired roots occupy disjoint portions of the total
nonnegative root weight.  This is the subtraction input used by the halving
step after the drafting estimate. -/
theorem disjoint_rootWeightSum_le_sub
    {N : ℕ} {R active fired : Finset ℕ}
    (hactive : active ⊆ R) (hfired : fired ⊆ R)
    (hdisjoint : Disjoint active fired) :
    rootWeightSum N fired ≤
      rootWeightSum N R - rootWeightSum N active := by
  have hunion : active ∪ fired ⊆ R := Finset.union_subset hactive hfired
  have hsum : rootWeightSum N (active ∪ fired) ≤ rootWeightSum N R := by
    unfold rootWeightSum
    apply Finset.sum_le_sum_of_subset_of_nonneg hunion
    intro t _ _
    exact rootWeight_nonneg N t
  rw [rootWeightSum, Finset.sum_union hdisjoint] at hsum
  dsimp [rootWeightSum] at hsum ⊢
  linarith

end

end Erdos872R177

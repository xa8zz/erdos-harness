import Erdos872R177.Asymptotic

open Filter Set

namespace Erdos872

/-- The exact real tail supremum `sup {u m | A ≤ m}`. -/
noncomputable def tailSup (u : ℕ → ℝ) (A : ℕ) : ℝ :=
  sSup (u '' Ici A)

lemma tail_image_nonempty (u : ℕ → ℝ) (A : ℕ) : (u '' Ici A).Nonempty :=
  ⟨u A, A, by simp, rfl⟩

lemma tail_image_bddAbove {u : ℕ → ℝ} (hu : BddAbove (range u)) (A : ℕ) :
    BddAbove (u '' Ici A) :=
  hu.mono (image_subset_range u (Ici A))

/-- Every term in a bounded-above tail lies below that tail's supremum. -/
lemma le_tailSup {u : ℕ → ℝ} (hu : BddAbove (range u))
    {A m : ℕ} (hm : A ≤ m) :
    u m ≤ tailSup u A := by
  rw [tailSup]
  exact le_csSup (tail_image_bddAbove hu A) ⟨m, hm, rfl⟩

/-- Tail suprema decrease when the start of the tail increases. -/
lemma tailSup_antitone {u : ℕ → ℝ} (hu : BddAbove (range u)) :
    Antitone (tailSup u) := by
  intro A B hAB
  rw [tailSup, tailSup]
  apply csSup_le (tail_image_nonempty u B)
  rintro _ ⟨m, hm, rfl⟩
  exact le_csSup (tail_image_bddAbove hu A) ⟨m, hAB.trans hm, rfl⟩

/--
For every bounded real sequence, the exact tail supremum tends to the
filter-theoretic limsup. This is the identity used after manuscript (4.4).
-/
theorem tendsto_tailSup_limsup
    (u : ℕ → ℝ)
    (huAbove : BddAbove (range u))
    (huBelow : BddBelow (range u)) :
    Tendsto (tailSup u) atTop (nhds (Filter.limsup u atTop)) := by
  have hbddAbove : IsBoundedUnder (· ≤ ·) atTop u := by
    rcases huAbove with ⟨C, hC⟩
    exact isBoundedUnder_of_eventually_le
      (Eventually.of_forall fun n ↦ hC ⟨n, rfl⟩)
  have hbddBelow : IsBoundedUnder (· ≥ ·) atTop u := by
    rcases huBelow with ⟨c, hc⟩
    exact isBoundedUnder_of_eventually_ge
      (Eventually.of_forall fun n ↦ hc ⟨n, rfl⟩)
  have hlim_le : ∀ A : ℕ, Filter.limsup u atTop ≤ tailSup u A := by
    intro A
    apply limsup_le_of_le hbddBelow.isCoboundedUnder_le
    filter_upwards [eventually_ge_atTop A] with n hn
    exact le_tailSup huAbove hn
  rw [tendsto_order]
  constructor
  · intro a ha
    exact Eventually.of_forall fun A ↦ ha.trans_le (hlim_le A)
  · intro a ha
    obtain ⟨y, hly, hya⟩ := exists_between ha
    have hu_lt : ∀ᶠ n : ℕ in atTop, u n < y :=
      (limsup_le_iff hbddBelow.isCoboundedUnder_le hbddAbove).mp le_rfl y hly
    rw [eventually_atTop] at hu_lt
    rcases hu_lt with ⟨A, hA⟩
    filter_upwards [eventually_ge_atTop A] with B hAB
    have hs : tailSup u B ≤ y := by
      rw [tailSup]
      apply csSup_le (tail_image_nonempty u B)
      rintro _ ⟨m, hm, rfl⟩
      exact (hA m (hAB.trans hm)).le
    exact hs.trans_lt hya

/--
Manuscript (4.4): `M_b(A) = sup_{m ≥ A} V_b(m)/m`, using the normalized
robust length from `Asymptotic.lean`.
-/
noncomputable def robustTailSup
    (V : ℕ → ℕ → ℕ) (b A : ℕ) : ℝ :=
  tailSup (robustRatio V b) A

/-- Under `V_b(N) ≤ N`, the manuscript tail supremum tends to `c_b`. -/
theorem tendsto_robustTailSup
    (V : ℕ → ℕ → ℕ)
    (hV : ∀ b N : ℕ, V b N ≤ N)
    (b : ℕ) :
    Tendsto (robustTailSup V b) atTop (nhds (upperDensity V b)) := by
  apply tendsto_tailSup_limsup
  · refine ⟨1, ?_⟩
    rintro _ ⟨N, rfl⟩
    exact (robustRatio_bounds V hV b N).2
  · refine ⟨0, ?_⟩
    rintro _ ⟨N, rfl⟩
    exact (robustRatio_bounds V hV b N).1

end Erdos872

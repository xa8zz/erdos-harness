import Erdos872R177.SelfRough

namespace Erdos872

/-- A positive natural number is in the full quotient cone rooted at `t` up to `N`. -/
def InCone (N t x : ℕ) : Prop := 0 < x ∧ t ∣ x ∧ x ≤ N

/--
Two incomparable self-rough tags have no common multiple at most `N`.
This is the exact arithmetic statement used to separate the root cones.
-/
theorem no_common_multiple_of_selfRough_incomparable
    {N s t : ℕ} {H : ℝ}
    (hN : 0 < N) (hs : 0 < s) (ht : 0 < t) (hH : 1 < H)
    (hsRough : H * (N : ℝ) / (s : ℝ) < (s.minFac : ℝ))
    (htRough : H * (N : ℝ) / (t : ℝ) < (t.minFac : ℝ))
    (hincomp : ¬s ∣ t ∧ ¬t ∣ s) :
    ∀ x, 0 < x → x ≤ N → ¬(s ∣ x ∧ t ∣ x) := by
  intro x hxpos hx hcommon
  have hlcm_dvd : Nat.lcm s t ∣ x := Nat.lcm_dvd hcommon.1 hcommon.2
  have hlcm : Nat.lcm s t ≤ N :=
    (Nat.le_of_dvd hxpos hlcm_dvd).trans hx
  rcases selfRough_lcm_nested hN hs ht hH hsRough htRough hlcm with hst | hts
  · exact hincomp.1 hst
  · exact hincomp.2 hts

/-- Distinct incomparable self-rough root cones are disjoint. -/
theorem selfRough_cones_disjoint
    {N s t : ℕ} {H : ℝ}
    (hN : 0 < N) (hs : 0 < s) (ht : 0 < t) (hH : 1 < H)
    (hsRough : H * (N : ℝ) / (s : ℝ) < (s.minFac : ℝ))
    (htRough : H * (N : ℝ) / (t : ℝ) < (t.minFac : ℝ))
    (hincomp : ¬s ∣ t ∧ ¬t ∣ s) :
    ∀ x, InCone N s x → ¬InCone N t x := by
  intro x hxs hxt
  exact no_common_multiple_of_selfRough_incomparable
    hN hs ht hH hsRough htRough hincomp x hxs.1 hxs.2.2 ⟨hxs.2.1, hxt.2.1⟩

/-- No vertex of one incomparable self-rough root cone divides a vertex of another. -/
theorem selfRough_cones_divisibility_incomparable
    {N s t x y : ℕ} {H : ℝ}
    (hN : 0 < N) (hs : 0 < s) (ht : 0 < t) (hH : 1 < H)
    (hsRough : H * (N : ℝ) / (s : ℝ) < (s.minFac : ℝ))
    (htRough : H * (N : ℝ) / (t : ℝ) < (t.minFac : ℝ))
    (hincomp : ¬s ∣ t ∧ ¬t ∣ s)
    (hx : InCone N s x) (hy : InCone N t y) :
    ¬x ∣ y ∧ ¬y ∣ x := by
  constructor
  · intro hxy
    exact no_common_multiple_of_selfRough_incomparable
      hN hs ht hH hsRough htRough hincomp y hy.1 hy.2.2
      ⟨dvd_trans hx.2.1 hxy, hy.2.1⟩
  · intro hyx
    exact no_common_multiple_of_selfRough_incomparable
      hN hs ht hH hsRough htRough hincomp x hx.1 hx.2.2
      ⟨hx.2.1, dvd_trans hy.2.1 hyx⟩

end Erdos872

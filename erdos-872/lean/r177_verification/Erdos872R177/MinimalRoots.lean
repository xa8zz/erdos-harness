import Erdos872R177.RootCones

namespace Erdos872

/-- A divisibility-minimal member of the finite tag set `T`. -/
def IsMinimalRoot (T : Finset ℕ) (r : ℕ) : Prop :=
  r ∈ T ∧ ∀ ⦃s : ℕ⦄, s ∈ T → s ∣ r → r ∣ s

/-- Every positive tag in a finite tag set lies above a minimal root. -/
theorem exists_minimalRoot_dvd
    {T : Finset ℕ} (hTpos : ∀ t ∈ T, 0 < t) {t : ℕ} (ht : t ∈ T) :
    ∃ r, IsMinimalRoot T r ∧ r ∣ t := by
  classical
  induction t using Nat.strong_induction_on with
  | h t ih =>
      by_cases hroot : IsMinimalRoot T t
      · exact ⟨t, hroot, dvd_rfl⟩
      · have hdesc : ∃ s, s ∈ T ∧ s ∣ t ∧ ¬t ∣ s := by
          by_contra hnone
          apply hroot
          refine ⟨ht, ?_⟩
          intro s hsT hst
          by_contra hts
          exact hnone ⟨s, hsT, hst, hts⟩
        rcases hdesc with ⟨s, hsT, hst, hnots⟩
        have htPos : 0 < t := hTpos t ht
        have hstLe : s ≤ t := Nat.le_of_dvd htPos hst
        have hstNe : s ≠ t := by
          intro heq
          subst s
          exact hnots dvd_rfl
        have hstLt : s < t := Nat.lt_of_le_of_ne hstLe hstNe
        rcases ih s hstLt hsT with ⟨r, hr, hrs⟩
        exact ⟨r, hr, hrs.trans hst⟩

/-- Distinct minimal roots are incomparable for divisibility. -/
theorem distinct_minimalRoots_incomparable
    {T : Finset ℕ} {r s : ℕ}
    (hr : IsMinimalRoot T r) (hs : IsMinimalRoot T s) (hne : r ≠ s) :
    ¬r ∣ s ∧ ¬s ∣ r := by
  constructor
  · intro hrs
    exact hne (Nat.dvd_antisymm hrs (hs.2 hr.1 hrs))
  · intro hsr
    exact hne (Nat.dvd_antisymm (hr.2 hs.1 hsr) hsr)

/-- Every tag in `T` obeys the manuscript's positivity and self-roughness conditions. -/
def SelfRoughTags (T : Finset ℕ) (N : ℕ) (H : ℝ) : Prop :=
  ∀ t ∈ T, 0 < t ∧ H * (N : ℝ) / (t : ℝ) < (t.minFac : ℝ)

/-- Distinct minimal roots have disjoint self-rough cones. -/
theorem minimalRoot_cones_disjoint
    {T : Finset ℕ} {N r s : ℕ} {H : ℝ}
    (hN : 0 < N) (hH : 1 < H) (hrough : SelfRoughTags T N H)
    (hr : IsMinimalRoot T r) (hs : IsMinimalRoot T s) (hne : r ≠ s) :
    ∀ x, InCone N r x → ¬InCone N s x := by
  have hrRough := hrough r hr.1
  have hsRough := hrough s hs.1
  exact selfRough_cones_disjoint hN hrRough.1 hsRough.1 hH
    hrRough.2 hsRough.2 (distinct_minimalRoots_incomparable hr hs hne)

/-- Vertices in distinct minimal-root cones are mutually divisibility-incomparable. -/
theorem minimalRoot_cones_divisibility_incomparable
    {T : Finset ℕ} {N r s x y : ℕ} {H : ℝ}
    (hN : 0 < N) (hH : 1 < H) (hrough : SelfRoughTags T N H)
    (hr : IsMinimalRoot T r) (hs : IsMinimalRoot T s) (hne : r ≠ s)
    (hx : InCone N r x) (hy : InCone N s y) :
    ¬x ∣ y ∧ ¬y ∣ x := by
  have hrRough := hrough r hr.1
  have hsRough := hrough s hs.1
  exact selfRough_cones_divisibility_incomparable hN hrRough.1 hsRough.1 hH
    hrRough.2 hsRough.2 (distinct_minimalRoots_incomparable hr hs hne) hx hy

end Erdos872

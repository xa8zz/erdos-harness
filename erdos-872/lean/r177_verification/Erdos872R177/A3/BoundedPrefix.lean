import Erdos872R177.A3.CoprimeDensity

namespace Erdos872.A3

open Filter Finset Real
open scoped Topology

/-- Integers up to `N` whose maximal dense prefix is at most `A`. -/
noncomputable def smallAKSet (K : ℝ) (A N : ℕ) : Finset ℕ := by
  classical
  exact (Finset.Ioc 0 N).filter fun x ↦ aK K x ≤ A

/-- The union of rough complementary-factor fibers used to cover `smallAKSet`. -/
noncomputable def smallAKCover (K : ℝ) (A N : ℕ) : Finset ℕ := by
  classical
  exact (Finset.Icc 1 A).biUnion fun a ↦
    (roughUpToNat (K * (a : ℝ)) (N / a)).image fun t ↦ a * t

theorem smallAKSet_subset_cover {K : ℝ} {A N : ℕ} (hK : 2 < K) :
    smallAKSet K A N ⊆ smallAKCover K A N := by
  classical
  intro x hx
  have hx' : x ∈ Finset.Ioc 0 N ∧ aK K x ≤ A := by
    simpa [smallAKSet] using hx
  have hxIoc := Finset.mem_Ioc.mp hx'.1
  have hx0 : x ≠ 0 := Nat.ne_of_gt hxIoc.1
  let a := aK K x
  let t := tK K x
  have haPos : 0 < a := by simpa [a] using aK_pos_a3 K x
  have hfactor : x = a * t := by simpa [a, t] using aK_mul_tK K hx0
  have htPos : 0 < t := by
    by_contra ht
    have ht0 : t = 0 := Nat.eq_zero_of_not_pos ht
    simp [ht0] at hfactor
    omega
  have htBound : t ≤ N / a := by
    apply (Nat.le_div_iff_mul_le haPos).2
    rw [mul_comm, ← hfactor]
    exact hxIoc.2
  have hrough : Rough (K * (a : ℝ)) t := by
    by_cases ht1 : t = 1
    · exact Or.inl ht1
    · right
      have ht2 : 2 ≤ t := by omega
      have hx2 : 2 ≤ x := by
        rw [hfactor]
        nlinarith
      refine ⟨ht2, ?_⟩
      simpa [a, t] using
        (minFac_tK_gt_of_one_lt (K := K) (x := x) hx2 (by omega : 1 < t))
  have haMem : a ∈ Finset.Icc 1 A := Finset.mem_Icc.mpr ⟨haPos, hx'.2⟩
  have htMem : t ∈ roughUpToNat (K * (a : ℝ)) (N / a) := by
    simp only [roughUpToNat, Finset.mem_filter, Finset.mem_Ioc]
    exact ⟨⟨htPos, htBound⟩, hrough⟩
  simp only [smallAKCover, Finset.mem_biUnion, Finset.mem_image]
  exact ⟨a, haMem, t, htMem, hfactor.symm⟩

/-- The fixed residue-block error after summing over `a ≤ A`. -/
noncomputable def smallAKError (K : ℝ) (A : ℕ) : ℝ :=
  ∑ a ∈ Finset.Icc 1 A, ((Nat.floor (K * (a : ℝ))).factorial.totient : ℝ)

theorem smallAKError_nonneg (K : ℝ) (A : ℕ) : 0 ≤ smallAKError K A := by
  unfold smallAKError
  positivity

/-- Summing the factorial-sieve bound over the possible dense prefixes gives
the harmonic `1 + log A` factor. -/
theorem smallAKSet_card_le {K : ℝ} {A N : ℕ} (hK : 2 < K) (hA : 2 ≤ A) :
    ((smallAKSet K A N).card : ℝ) ≤
      (N : ℝ) * (1 + Real.log (A : ℝ)) / Real.log K + smallAKError K A := by
  classical
  have hlogK : 0 < Real.log K := Real.log_pos (lt_trans one_lt_two hK)
  have hcoverNat : (smallAKSet K A N).card ≤ (smallAKCover K A N).card :=
    Finset.card_le_card (smallAKSet_subset_cover hK)
  have hcoverSum : (smallAKCover K A N).card ≤
      ∑ a ∈ Finset.Icc 1 A, (roughUpToNat (K * (a : ℝ)) (N / a)).card := by
    unfold smallAKCover
    exact Finset.card_biUnion_le.trans <|
      Finset.sum_le_sum fun a ha ↦ Finset.card_image_le
  have hcard : ((smallAKSet K A N).card : ℝ) ≤
      ∑ a ∈ Finset.Icc 1 A,
        ((roughUpToNat (K * (a : ℝ)) (N / a)).card : ℝ) := by
    exact_mod_cast hcoverNat.trans hcoverSum
  have hterm (a : ℕ) (ha : a ∈ Finset.Icc 1 A) :
      ((roughUpToNat (K * (a : ℝ)) (N / a)).card : ℝ) ≤
        (N : ℝ) / ((a : ℝ) * Real.log K) +
          ((Nat.floor (K * (a : ℝ))).factorial.totient : ℝ) := by
    have ha1 : 1 ≤ a := (Finset.mem_Icc.mp ha).1
    have haPosR : (0 : ℝ) < a := by exact_mod_cast (lt_of_lt_of_le Nat.zero_lt_one ha1)
    have hKa : 2 < K * (a : ℝ) := by
      have hKle : K ≤ K * (a : ℝ) := by
        nlinarith [show (1 : ℝ) ≤ a by exact_mod_cast ha1]
      exact hK.trans_le hKle
    have hrough := roughUpToNat_card_le_log hKa (N / a)
    have hlogMono : Real.log K ≤ Real.log (K * (a : ℝ)) := by
      apply Real.log_le_log
      · linarith
      · nlinarith [show (1 : ℝ) ≤ a by exact_mod_cast ha1]
    have hlogKa : 0 < Real.log (K * (a : ℝ)) := hlogK.trans_le hlogMono
    have hquot : ((N / a : ℕ) : ℝ) ≤ (N : ℝ) / a := Nat.cast_div_le
    have hmain : ((N / a : ℕ) : ℝ) / Real.log (K * (a : ℝ)) ≤
        (N : ℝ) / ((a : ℝ) * Real.log K) := by
      calc
        ((N / a : ℕ) : ℝ) / Real.log (K * (a : ℝ)) ≤
            ((N : ℝ) / a) / Real.log (K * (a : ℝ)) :=
          (div_le_div_iff_of_pos_right hlogKa).2 hquot
        _ ≤ ((N : ℝ) / a) / Real.log K := by
          apply div_le_div_of_nonneg_left (by positivity) hlogK hlogMono
        _ = (N : ℝ) / ((a : ℝ) * Real.log K) := by ring
    linarith
  have hsum :
      (∑ a ∈ Finset.Icc 1 A,
        ((roughUpToNat (K * (a : ℝ)) (N / a)).card : ℝ)) ≤
      ∑ a ∈ Finset.Icc 1 A,
        ((N : ℝ) / ((a : ℝ) * Real.log K) +
          ((Nat.floor (K * (a : ℝ))).factorial.totient : ℝ)) := by
    exact Finset.sum_le_sum fun a ha ↦ hterm a ha
  have hharmonic :
      (∑ a ∈ Finset.Icc 1 A, ((a : ℝ)⁻¹)) ≤ 1 + Real.log (A : ℝ) := by
    have hh := harmonic_le_one_add_log A
    rw [harmonic_eq_sum_Icc] at hh
    simpa only [Rat.cast_sum, Rat.cast_inv, Rat.cast_natCast] using hh
  calc
    ((smallAKSet K A N).card : ℝ) ≤
        ∑ a ∈ Finset.Icc 1 A,
          ((roughUpToNat (K * (a : ℝ)) (N / a)).card : ℝ) := hcard
    _ ≤ ∑ a ∈ Finset.Icc 1 A,
        ((N : ℝ) / ((a : ℝ) * Real.log K) +
          ((Nat.floor (K * (a : ℝ))).factorial.totient : ℝ)) := hsum
    _ = (N : ℝ) / Real.log K *
          (∑ a ∈ Finset.Icc 1 A, ((a : ℝ)⁻¹)) + smallAKError K A := by
      rw [Finset.sum_add_distrib]
      unfold smallAKError
      congr 1
      rw [Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro a ha
      ring
    _ ≤ (N : ℝ) / Real.log K * (1 + Real.log (A : ℝ)) +
          smallAKError K A := by
      gcongr
    _ = (N : ℝ) * (1 + Real.log (A : ℝ)) / Real.log K +
          smallAKError K A := by ring

/-- The bounded-prefix contribution satisfies the required density estimate,
since its finite residue-block error is `o(N)`. -/
theorem eventually_smallAKSet_card_le {K : ℝ} {A : ℕ}
    (hK : 2 < K) (hA : 2 ≤ A) {epsilon : ℝ} (hepsilon : 0 < epsilon) :
    ∀ᶠ N : ℕ in atTop,
      ((smallAKSet K A N).card : ℝ) ≤
        ((1 + Real.log (A : ℝ)) / Real.log K + epsilon) * N := by
  have herr : ∀ᶠ N : ℕ in atTop, smallAKError K A ≤ epsilon * N := by
    have hcast : Tendsto (fun N : ℕ ↦ (N : ℝ)) atTop atTop :=
      tendsto_natCast_atTop_atTop
    have hmul : Tendsto (fun N : ℕ ↦ epsilon * (N : ℝ)) atTop atTop :=
      (tendsto_const_mul_atTop_of_pos hepsilon).2 hcast
    exact hmul.eventually (eventually_ge_atTop (smallAKError K A))
  filter_upwards [herr] with N herrN
  have hbase := smallAKSet_card_le (N := N) hK hA
  calc
    ((smallAKSet K A N).card : ℝ) ≤
        (N : ℝ) * (1 + Real.log (A : ℝ)) / Real.log K +
          smallAKError K A := hbase
    _ ≤ (N : ℝ) * (1 + Real.log (A : ℝ)) / Real.log K + epsilon * N := by
      linarith
    _ = ((1 + Real.log (A : ℝ)) / Real.log K + epsilon) * N := by ring

end Erdos872.A3

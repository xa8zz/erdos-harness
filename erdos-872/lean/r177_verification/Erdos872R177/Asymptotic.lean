import Erdos872R177.AnalyticInputs

open Filter

namespace Erdos872

/-- The normalized robust-game length at opening budget `b` and board size `N`. -/
noncomputable def robustRatio (V : ℕ → ℕ → ℕ) (b N : ℕ) : ℝ :=
  (V b N : ℝ) / (N : ℝ)

/-- The manuscript quantity `c_b`. -/
noncomputable def upperDensity (V : ℕ → ℕ → ℕ) (b : ℕ) : ℝ :=
  Filter.limsup (robustRatio V b) atTop

/-- Pointwise bounds inherited from `0 ≤ V_b(N) ≤ N`. -/
theorem robustRatio_bounds
    (V : ℕ → ℕ → ℕ)
    (hV : ∀ b N : ℕ, V b N ≤ N) :
    ∀ b N : ℕ, 0 ≤ robustRatio V b N ∧ robustRatio V b N ≤ 1 := by
  intro b N
  constructor
  · rw [robustRatio]
    exact div_nonneg (Nat.cast_nonneg _) (Nat.cast_nonneg _)
  · by_cases hN : N = 0
    · subst N
      simp [robustRatio]
    · rw [robustRatio, div_le_one (Nat.cast_pos.mpr (Nat.pos_of_ne_zero hN))]
      exact_mod_cast hV b N

/-- The limsup densities are also in the interval `[0,1]`. -/
theorem upperDensity_bounds
    (V : ℕ → ℕ → ℕ)
    (hV : ∀ b N : ℕ, V b N ≤ N) :
    ∀ b : ℕ, 0 ≤ upperDensity V b ∧ upperDensity V b ≤ 1 := by
  intro b
  have h₀ : ∀ N : ℕ, 0 ≤ robustRatio V b N := fun N ↦ (robustRatio_bounds V hV b N).1
  have h₁ : ∀ N : ℕ, robustRatio V b N ≤ 1 := fun N ↦ (robustRatio_bounds V hV b N).2
  have hbddAbove : IsBoundedUnder (· ≤ ·) atTop (robustRatio V b) :=
    isBoundedUnder_of_eventually_le (Eventually.of_forall h₁)
  have hbddBelow : IsBoundedUnder (· ≥ ·) atTop (robustRatio V b) :=
    isBoundedUnder_of_eventually_ge (Eventually.of_forall h₀)
  constructor
  · exact le_limsup_of_frequently_le (Frequently.of_forall h₀) hbddAbove
  · exact limsup_le_of_le hbddBelow.isCoboundedUnder_le (Eventually.of_forall h₁)

/-- The finite iteration of the density recursion. -/
lemma halving_iterate
    (c : ℕ → ℝ)
    (hrec : ∀ b : ℕ, 1 ≤ b → c b ≤ (1 / 2 : ℝ) * c (b + 1)) :
    ∀ (b r : ℕ), 1 ≤ b → c b ≤ (1 / 2 : ℝ) ^ r * c (b + r) := by
  intro b r hb
  induction r with
  | zero => simp
  | succ r ih =>
      calc
        c b ≤ (1 / 2 : ℝ) ^ r * c (b + r) := ih
        _ ≤ (1 / 2 : ℝ) ^ r * ((1 / 2 : ℝ) * c (b + r + 1)) := by
          gcongr
          exact hrec (b + r) (by omega)
        _ = (1 / 2 : ℝ) ^ (r + 1) * c (b + (r + 1)) := by ring_nf

/-- A bounded nonnegative sequence satisfying the halving recursion has `c₁ = 0`. -/
theorem density_zero_of_halving
    (c : ℕ → ℝ)
    (hnonneg : ∀ b : ℕ, 0 ≤ c b)
    (hone : ∀ b : ℕ, c b ≤ 1)
    (hrec : ∀ b : ℕ, 1 ≤ b → c b ≤ (1 / 2 : ℝ) * c (b + 1)) :
    c 1 = 0 := by
  apply le_antisymm ?_ (hnonneg 1)
  apply ge_of_tendsto
    (tendsto_pow_atTop_nhds_zero_of_lt_one (r := (1 / 2 : ℝ)) (by norm_num) (by norm_num))
  filter_upwards with r
  calc
    c 1 ≤ (1 / 2 : ℝ) ^ r * c (1 + r) := halving_iterate c hrec 1 r (by omega)
    _ ≤ (1 / 2 : ℝ) ^ r := by
      nlinarith [hone (1 + r), pow_nonneg (by norm_num : (0 : ℝ) ≤ 1 / 2) r]

/-- A nonnegative bounded real sequence with limsup zero tends to zero. -/
theorem tendsto_zero_of_nonneg_of_limsup_eq_zero
    (u : ℕ → ℝ)
    (hnonneg : ∀ n : ℕ, 0 ≤ u n)
    (hone : ∀ n : ℕ, u n ≤ 1)
    (hsup : Filter.limsup u atTop = 0) :
    Tendsto u atTop (nhds 0) := by
  have hbddAbove : IsBoundedUnder (· ≤ ·) atTop u :=
    isBoundedUnder_of_eventually_le (Eventually.of_forall hone)
  have hbddBelow : IsBoundedUnder (· ≥ ·) atTop u :=
    isBoundedUnder_of_eventually_ge (Eventually.of_forall hnonneg)
  apply tendsto_of_le_liminf_of_limsup_le
      (h := hbddAbove) (h' := hbddBelow) ?_ hsup.le
  exact le_liminf_of_le hbddAbove.isCoboundedUnder_ge (Eventually.of_forall hnonneg)

/-- The density recursion and `V_b(N) ≤ N` force `c₁ = 0`. -/
theorem upperDensity_one_eq_zero
    (V : ℕ → ℕ → ℕ)
    (hV : ∀ b N : ℕ, V b N ≤ N)
    (hrec : ∀ b : ℕ, 1 ≤ b →
      upperDensity V b ≤ (1 / 2 : ℝ) * upperDensity V (b + 1)) :
    upperDensity V 1 = 0 := by
  apply density_zero_of_halving (upperDensity V)
  · exact fun b ↦ (upperDensity_bounds V hV b).1
  · exact fun b ↦ (upperDensity_bounds V hV b).2
  · exact hrec

/-- The robust normalized game length tends to zero. -/
theorem robust_ratio_tendsto_zero
    (V : ℕ → ℕ → ℕ)
    (hV : ∀ b N : ℕ, V b N ≤ N)
    (hrec : ∀ b : ℕ, 1 ≤ b →
      upperDensity V b ≤ (1 / 2 : ℝ) * upperDensity V (b + 1)) :
    Tendsto (robustRatio V 1) atTop (nhds 0) := by
  apply tendsto_zero_of_nonneg_of_limsup_eq_zero
  · exact fun N ↦ (robustRatio_bounds V hV 1 N).1
  · exact fun N ↦ (robustRatio_bounds V hV 1 N).2
  · exact upperDensity_one_eq_zero V hV hrec

/-- The normalized length of the original divisor-antichain game. -/
noncomputable def originalRatio (L : ℕ → ℕ) (N : ℕ) : ℝ :=
  (L N : ℝ) / (N : ℝ)

/-- The comparison `L(N) ≤ V₁(N)` transfers the robust limit to the original game. -/
theorem original_ratio_tendsto_zero
    (L : ℕ → ℕ) (V : ℕ → ℕ → ℕ)
    (hV : ∀ b N : ℕ, V b N ≤ N)
    (hL : ∀ N : ℕ, L N ≤ V 1 N)
    (hrec : ∀ b : ℕ, 1 ≤ b →
      upperDensity V b ≤ (1 / 2 : ℝ) * upperDensity V (b + 1)) :
    Tendsto (originalRatio L) atTop (nhds 0) := by
  apply tendsto_of_tendsto_of_tendsto_of_le_of_le'
    (g := fun _ ↦ (0 : ℝ)) (h := robustRatio V 1) tendsto_const_nhds
    (robust_ratio_tendsto_zero V hV hrec)
  · exact Eventually.of_forall fun N ↦ by
      rw [originalRatio]
      exact div_nonneg (Nat.cast_nonneg _) (Nat.cast_nonneg _)
  · exact Eventually.of_forall fun N ↦ by
      by_cases hN : N = 0
      · subst N
        simp [originalRatio, robustRatio]
      · rw [originalRatio, robustRatio,
          div_le_div_iff_of_pos_right (Nat.cast_pos.mpr (Nat.pos_of_ne_zero hN))]
        exact_mod_cast hL N

end Erdos872

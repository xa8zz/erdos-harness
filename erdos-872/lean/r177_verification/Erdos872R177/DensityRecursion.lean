import Mathlib

namespace Erdos872

/--
The elementary last step of manuscript §5: a uniformly bounded nonnegative
sequence satisfying `c b ≤ c (b+1) / 2` vanishes at every positive index.

This lemma contains no analytic number theory and uses no game-specific axiom.
-/
theorem density_eq_zero_of_halving
    (c : ℕ → ℝ)
    (hc_nonneg : ∀ b, 0 ≤ c b)
    (hc_le_one : ∀ b, c b ≤ 1)
    (hc_half : ∀ b ≥ 1, c b ≤ (1 / 2 : ℝ) * c (b + 1)) :
    ∀ b ≥ 1, c b = 0 := by
  intro b hb
  apply le_antisymm
  · by_contra hnot
    have hpos : 0 < c b := lt_of_not_ge hnot
    obtain ⟨r, hr⟩ : ∃ r : ℕ, (1 / 2 : ℝ) ^ r < c b :=
      exists_pow_lt_of_lt_one hpos (by norm_num)
    have hiter : ∀ r : ℕ, c b ≤ (1 / 2 : ℝ) ^ r * c (b + r) := by
      intro r
      induction r with
      | zero => simp
      | succ r ihr =>
          calc
            c b ≤ (1 / 2 : ℝ) ^ r * c (b + r) := ihr
            _ ≤ (1 / 2 : ℝ) ^ r * ((1 / 2 : ℝ) * c (b + r + 1)) := by
              gcongr
              exact hc_half (b + r) (by omega)
            _ = (1 / 2 : ℝ) ^ (r + 1) * c (b + (r + 1)) := by
              ring_nf
    have hbound : c b ≤ (1 / 2 : ℝ) ^ r := by
      calc
        c b ≤ (1 / 2 : ℝ) ^ r * c (b + r) := hiter r
        _ ≤ (1 / 2 : ℝ) ^ r * 1 :=
          mul_le_mul_of_nonneg_left (hc_le_one (b + r))
            (pow_nonneg (by norm_num) r)
        _ = (1 / 2 : ℝ) ^ r := mul_one _
    exact (not_lt_of_ge hbound) hr
  · exact hc_nonneg b

end Erdos872

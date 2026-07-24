import Mathlib

namespace Erdos872

/--
Manuscript Lemma 3.1: two positive self-rough tags having a common multiple
at most `N` are comparable by divisibility.
-/
theorem selfRough_lcm_nested
    {N s t : ℕ} {H : ℝ}
    (hN : 0 < N) (hs : 0 < s) (ht : 0 < t) (hH : 1 < H)
    (hsRough : H * (N : ℝ) / (s : ℝ) < (s.minFac : ℝ))
    (htRough : H * (N : ℝ) / (t : ℝ) < (t.minFac : ℝ))
    (hlcm : Nat.lcm s t ≤ N) :
    s ∣ t ∨ t ∣ s := by
  have hNreal : (0 : ℝ) < (N : ℝ) := by exact_mod_cast hN
  have hsreal : (0 : ℝ) < (s : ℝ) := by exact_mod_cast hs
  have htreal : (0 : ℝ) < (t : ℝ) := by exact_mod_cast ht
  have hN_lt_HN : (N : ℝ) < H * (N : ℝ) := by
    simpa using mul_lt_mul_of_pos_right hH hNreal
  have hsRoughNat : N < s.minFac * s := by
    have hsMul : H * (N : ℝ) < (s.minFac : ℝ) * (s : ℝ) :=
      (div_lt_iff₀ hsreal).mp hsRough
    exact_mod_cast hN_lt_HN.trans hsMul
  have htRoughNat : N < t.minFac * t := by
    have htMul : H * (N : ℝ) < (t.minFac : ℝ) * (t : ℝ) :=
      (div_lt_iff₀ htreal).mp htRough
    exact_mod_cast hN_lt_HN.trans htMul
  have rough_lcm_gt
      {a b : ℕ} (ha : 0 < a) (hab : a ≤ b) (hab_dvd : ¬a ∣ b)
      (haRough : N < a.minFac * a) :
      N < Nat.lcm a b := by
    have hgcd_pos : 0 < Nat.gcd b a := Nat.gcd_pos_of_pos_right b ha
    have hgcd_ne : Nat.gcd b a ≠ a := by
      intro hgcd
      exact hab_dvd (Nat.gcd_eq_right_iff_dvd.mp hgcd)
    have hgcd_lt : Nat.gcd b a < a := by
      exact Nat.lt_of_le_of_ne (Nat.gcd_le_right b ha) hgcd_ne
    have hquot_one : 1 < a / Nat.gcd b a := by
      apply (Nat.lt_div_iff_mul_lt_of_dvd (Nat.ne_of_gt hgcd_pos)
        (Nat.gcd_dvd_right b a)).2
      simpa using hgcd_lt
    have hquot_two : 2 ≤ a / Nat.gcd b a := by omega
    have hminFac : a.minFac ≤ a / Nat.gcd b a :=
      Nat.minFac_le_of_dvd hquot_two
        (Nat.div_dvd_of_dvd (Nat.gcd_dvd_right b a))
    have hproduct :
        a.minFac * a ≤ (a / Nat.gcd b a) * b :=
      Nat.mul_le_mul hminFac hab
    have hlcm_formula :
        Nat.lcm b a = b * (a / Nat.gcd b a) := by
      rw [Nat.lcm_eq_mul_div, Nat.mul_div_assoc b (Nat.gcd_dvd_right b a)]
    calc
      N < a.minFac * a := haRough
      _ ≤ (a / Nat.gcd b a) * b := hproduct
      _ = b * (a / Nat.gcd b a) := Nat.mul_comm _ _
      _ = Nat.lcm b a := hlcm_formula.symm
      _ = Nat.lcm a b := Nat.lcm_comm b a
  by_cases hst : s ∣ t
  · exact Or.inl hst
  by_cases hts : t ∣ s
  · exact Or.inr hts
  exfalso
  rcases le_total s t with hle | hle
  · exact (Nat.not_lt_of_ge hlcm) (rough_lcm_gt hs hle hst hsRoughNat)
  · have hcontra := rough_lcm_gt ht hle hts htRoughNat
    rw [Nat.lcm_comm t s] at hcontra
    exact (Nat.not_lt_of_ge hlcm) hcontra

end Erdos872

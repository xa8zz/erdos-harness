import Erdos872R177.A3.DensePrefixTail
import Mathlib.NumberTheory.ArithmeticFunction.Misc
import Mathlib.NumberTheory.Harmonic.Bounds
import Mathlib.Data.Nat.Prime.Factorial

namespace Erdos872.A3

open Finset Real
open scoped ArithmeticFunction.sigma

/-- Euler's totient times the divisor sum never exceeds the square. -/
theorem totient_mul_sigma_le_sq (n : ℕ) :
    n.totient * ArithmeticFunction.sigma 1 n ≤ n * n := by
  induction n using Nat.recOnPosPrimePosCoprime with
  | prime_pow p k hp hk =>
      obtain ⟨j, rfl⟩ := Nat.exists_eq_succ_of_ne_zero hk.ne'
      rw [Nat.totient_prime_pow_succ hp j,
        ArithmeticFunction.sigma_apply_prime_pow hp]
      simp only [mul_one]
      have hgeom :=
        geom_sum_mul_of_one_le (show 1 ≤ p by exact hp.one_lt.le) (j + 2)
      calc
        p ^ j * (p - 1) * ∑ i ∈ range (j + 1 + 1), p ^ i =
            p ^ j * (p ^ (j + 2) - 1) := by rw [mul_assoc, mul_comm (p - 1), hgeom]
        _ ≤ p ^ j * p ^ (j + 2) :=
          Nat.mul_le_mul_left _ (Nat.sub_le _ _)
        _ = p ^ (j + 1) * p ^ (j + 1) := by
          simp only [← pow_add]
          congr 1
          omega
  | zero => simp
  | one => simp
  | coprime a b ha hb hab hia hib =>
      rw [Nat.totient_mul hab, ArithmeticFunction.isMultiplicative_sigma.map_mul_of_coprime hab]
      calc
        a.totient * b.totient *
            (ArithmeticFunction.sigma 1 a * ArithmeticFunction.sigma 1 b) =
            (a.totient * ArithmeticFunction.sigma 1 a) *
              (b.totient * ArithmeticFunction.sigma 1 b) := by ring
        _ ≤ (a * a) * (b * b) := Nat.mul_le_mul hia hib
        _ = a * b * (a * b) := by ring

/-- The density of residue classes coprime to `B!` is at most the reciprocal
of the `B`-th harmonic number. -/
theorem totient_factorial_div_le_inv_harmonic (B : ℕ) (hB : 2 ≤ B) :
    (B.factorial.totient : ℝ) / (B.factorial : ℝ) ≤ 1 / (harmonic B : ℝ) := by
  let M := B.factorial
  have hMnat : 0 < M := by simpa [M] using Nat.factorial_pos B
  have hM : (0 : ℝ) < M := by exact_mod_cast hMnat
  have hphiNat : 0 < M.totient := Nat.totient_pos.mpr hMnat
  have hphi : (0 : ℝ) < M.totient := by exact_mod_cast hphiNat
  have hH : (0 : ℝ) < (harmonic B : ℝ) := by
    have hlogpos : 0 < Real.log (B + 1 : ℝ) := Real.log_pos (by norm_num; omega)
    have hbound := log_add_one_le_harmonic B
    norm_num only [Nat.cast_add, Nat.cast_one] at hbound
    exact hlogpos.trans_le hbound
  have hsubset : Finset.Icc 1 B ⊆ M.divisors := by
    intro d hd
    have hd' := Finset.mem_Icc.mp hd
    exact Nat.mem_divisors.mpr
      ⟨Nat.dvd_factorial (by omega) hd'.2, Nat.ne_of_gt hMnat⟩
  have hsum : (harmonic B : ℝ) ≤
      ∑ d ∈ M.divisors, (d : ℝ)⁻¹ := by
    rw [harmonic_eq_sum_Icc]
    simp only [Rat.cast_sum, Rat.cast_inv, Rat.cast_natCast]
    apply Finset.sum_le_sum_of_subset_of_nonneg hsubset
    intro d hdM hdnot
    positivity
  have hrecipSigma :
      (∑ d ∈ M.divisors, (d : ℝ)⁻¹) =
        (ArithmeticFunction.sigma 1 M : ℝ) / (M : ℝ) := by
    rw [ArithmeticFunction.sigma_eq_sum_div]
    simp only [pow_one, Nat.cast_sum]
    rw [Finset.sum_div]
    apply Finset.sum_congr rfl
    intro d hd
    have hdvd : d ∣ M := (Nat.mem_divisors.mp hd).1
    have hdpos : (0 : ℝ) < d := by
      exact_mod_cast Nat.pos_of_dvd_of_pos hdvd hMnat
    have hdne : (d : ℝ) ≠ 0 := ne_of_gt hdpos
    rw [Nat.cast_div hdvd]
    apply (eq_div_iff (ne_of_gt hM)).2
    rw [inv_mul_eq_div]
    exact hdne
  have hsigmaRatio :
      (ArithmeticFunction.sigma 1 M : ℝ) / (M : ℝ) ≤
        (M : ℝ) / (M.totient : ℝ) := by
    rw [div_le_div_iff₀ hM hphi]
    have h := totient_mul_sigma_le_sq M
    exact_mod_cast (show ArithmeticFunction.sigma 1 M * M.totient ≤ M * M by
      simpa [mul_comm] using h)
  have hHphi : (harmonic B : ℝ) * (M.totient : ℝ) ≤ (M : ℝ) := by
    apply (le_div_iff₀ hphi).mp
    exact hsum.trans (hrecipSigma.le.trans hsigmaRatio)
  rw [div_le_div_iff₀ hM hH]
  simpa [M, mul_comm] using hHphi

/-- Positive integers up to `X` that are coprime to a fixed modulus. -/
def coprimeUpTo (M X : ℕ) : Finset ℕ :=
  (Finset.Ioc 0 X).filter fun t ↦ M.Coprime t

/-- Counting complete residue blocks gives the exact-density main term and a
fixed one-block error. -/
theorem coprimeUpTo_card_le (M X : ℕ) (hM : M ≠ 0) :
    ((coprimeUpTo M X).card : ℝ) ≤
      (X : ℝ) * (M.totient : ℝ) / M + M.totient := by
  have hset : coprimeUpTo M X =
      (Finset.Ico 1 (1 + X)).filter fun t ↦ M.Coprime t := by
    ext t
    simp [coprimeUpTo]
    omega
  have hnat : (coprimeUpTo M X).card ≤ M.totient * (X / M + 1) := by
    rw [hset]
    exact Nat.Ico_filter_coprime_le 1 X hM
  have hcast : ((coprimeUpTo M X).card : ℝ) ≤
      (M.totient : ℝ) * ((X / M : ℕ) + 1) := by
    exact_mod_cast hnat
  calc
    ((coprimeUpTo M X).card : ℝ) ≤
        (M.totient : ℝ) * ((X / M : ℕ) + 1) := hcast
    _ ≤ (M.totient : ℝ) * ((X : ℝ) / M + 1) := by
      gcongr
      exact Nat.cast_div_le
    _ = (X : ℝ) * (M.totient : ℝ) / M + M.totient := by ring

/-- A number whose least prime factor exceeds `z` is coprime to
`floor(z)!`. The case `t = 1` is included explicitly. -/
theorem rough_coprime_factorial {z : ℝ} {t : ℕ} (hz : 0 ≤ z)
    (ht : t = 1 ∨ (2 ≤ t ∧ z < (Nat.minFac t : ℝ))) :
    Nat.Coprime (Nat.floor z).factorial t := by
  rcases ht with rfl | ⟨ht2, hmin⟩
  · simp
  · apply Nat.Coprime.symm
    apply (Nat.coprime_factorial_iff (by omega : t ≠ 1)).2
    have hfloor : (Nat.floor z : ℝ) ≤ z := Nat.floor_le hz
    exact_mod_cast hfloor.trans_lt hmin

/-- Positive `z`-rough integers up to a natural cutoff. -/
noncomputable def roughUpToNat (z : ℝ) (X : ℕ) : Finset ℕ := by
  classical
  exact (Finset.Ioc 0 X).filter fun t ↦ Rough z t

/-- A fixed factorial sieve supplies the `1 / log z` rough-number density,
with an additive error depending only on `z`. -/
theorem roughUpToNat_card_le_log {z : ℝ} (hz : 2 < z) (X : ℕ) :
    ((roughUpToNat z X).card : ℝ) ≤
      (X : ℝ) / Real.log z + (Nat.floor z).factorial.totient := by
  classical
  let B := Nat.floor z
  let M := B.factorial
  have hB : 2 ≤ B := by
    exact Nat.le_floor (le_of_lt hz)
  have hM : M ≠ 0 := by simpa [M] using Nat.factorial_ne_zero B
  have hsubset :
      roughUpToNat z X ⊆ coprimeUpTo M X := by
    intro t ht
    have ht' : t ∈ Finset.Ioc 0 X ∧ Rough z t := by
      simpa [roughUpToNat] using ht
    apply Finset.mem_filter.mpr
    refine ⟨ht'.1, ?_⟩
    simpa [M, B] using rough_coprime_factorial (le_trans (by norm_num) hz.le) ht'.2
  have hcardNat :
      (roughUpToNat z X).card ≤ (coprimeUpTo M X).card :=
    Finset.card_le_card hsubset
  have hcard :
      ((roughUpToNat z X).card : ℝ) ≤
        ((coprimeUpTo M X).card : ℝ) := by exact_mod_cast hcardNat
  have hdensity : (M.totient : ℝ) / M ≤ 1 / Real.log z := by
    have hfac := totient_factorial_div_le_inv_harmonic B hB
    have hlogH : Real.log z ≤ (harmonic B : ℝ) := by
      simpa [B] using log_le_harmonic_floor z (le_trans (by norm_num) hz.le)
    have hlog : 0 < Real.log z := Real.log_pos (lt_trans one_lt_two hz)
    have hH : 0 < (harmonic B : ℝ) := hlog.trans_le hlogH
    have hinv : 1 / (harmonic B : ℝ) ≤ 1 / Real.log z := by
      exact one_div_le_one_div_of_le hlog hlogH
    simpa [M, B] using hfac.trans hinv
  calc
    ((roughUpToNat z X).card : ℝ) ≤
        ((coprimeUpTo M X).card : ℝ) := hcard
    _ ≤ (X : ℝ) * (M.totient : ℝ) / M + M.totient :=
      coprimeUpTo_card_le M X hM
    _ ≤ (X : ℝ) * (1 / Real.log z) + M.totient := by
      have hmain : (X : ℝ) * (M.totient : ℝ) / M ≤
          (X : ℝ) * (1 / Real.log z) := by
        calc
        (X : ℝ) * (M.totient : ℝ) / M =
            (X : ℝ) * ((M.totient : ℝ) / M) := by ring
        _ ≤ (X : ℝ) * (1 / Real.log z) :=
          mul_le_mul_of_nonneg_left hdensity (Nat.cast_nonneg X)
      linarith
    _ = (X : ℝ) / Real.log z + (Nat.floor z).factorial.totient := by
      simp only [M, B]
      ring

end Erdos872.A3

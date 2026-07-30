import Mathlib.Analysis.Complex.ExponentialBounds
import Mathlib.NumberTheory.Chebyshev

namespace Erdos872.A3

open Filter Finset MeasureTheory Real
open scoped Nat.Prime Topology

/-- Reciprocal sum over the primes at most `x`. -/
noncomputable def primeReciprocalSum (x : ℝ) : ℝ :=
  ∑ p ∈ Finset.Icc 2 ⌊x⌋₊ with p.Prime, (p : ℝ)⁻¹

private theorem sum_primeIndicator (n : ℕ) :
    ∑ k ∈ Finset.Icc 0 n, (if k.Prime then (1 : ℝ) else 0) = Nat.primeCounting n := by
  rw [← Nat.range_succ_eq_Icc_zero]
  simp [Nat.primeCounting, Nat.primeCounting', Nat.count_eq_card_filter_range]

/-- Abel summation for the reciprocal-prime sum. -/
theorem primeReciprocalSum_eq {x : ℝ} (hx : 2 ≤ x) :
    primeReciprocalSum x =
      (Nat.primeCounting ⌊x⌋₊ : ℝ) / x +
        ∫ t in Set.Ioc 2 x, (Nat.primeCounting ⌊t⌋₊ : ℝ) / t ^ 2 := by
  let c : ℕ → ℝ := fun n ↦ if n.Prime then 1 else 0
  have hdiff : ∀ t ∈ Set.Icc (2 : ℝ) x, DifferentiableAt ℝ (fun y : ℝ ↦ y⁻¹) t := by
    intro t ht
    fun_prop (disch := linarith [ht.1])
  have hint : IntegrableOn (deriv (fun y : ℝ ↦ y⁻¹)) (Set.Icc (2 : ℝ) x) := by
    have hderiv : deriv (fun y : ℝ ↦ y⁻¹) = fun y ↦ -(y ^ 2)⁻¹ := by
      funext y
      exact deriv_inv
    rw [hderiv]
    refine ContinuousOn.integrableOn_Icc fun t ht ↦ ContinuousAt.continuousWithinAt ?_
    have ht0 : t ≠ 0 := by linarith [ht.1]
    exact ((continuousAt_id.pow 2).inv₀ (pow_ne_zero 2 ht0)).neg
  have habel := sum_mul_eq_sub_sub_integral_mul c (a := (2 : ℝ)) (b := x)
    (by norm_num) hx hdiff hint
  rw [show ⌊(2 : ℝ)⌋₊ = 2 by norm_num] at habel
  simp only [c, sum_primeIndicator] at habel
  have hfloor : 2 ≤ ⌊x⌋₊ := Nat.le_floor hx
  rw [primeReciprocalSum, Finset.Icc_eq_cons_Ioc hfloor, Finset.sum_filter,
    Finset.sum_cons]
  simp only [Nat.prime_two, ↓reduceIte, Nat.cast_ofNat]
  have habel' :
      (∑ k ∈ Finset.Ioc 2 ⌊x⌋₊, if k.Prime then (k : ℝ)⁻¹ else 0) =
        x⁻¹ * (Nat.primeCounting ⌊x⌋₊ : ℝ) -
          2⁻¹ * (Nat.primeCounting 2 : ℝ) -
            ∫ t in Set.Ioc 2 x,
              deriv (fun y : ℝ ↦ y⁻¹) t * (Nat.primeCounting ⌊t⌋₊ : ℝ) := by
    simpa [c, mul_ite] using habel
  rw [habel']
  have hintegral :
      (∫ t in Set.Ioc 2 x,
          deriv (fun y : ℝ ↦ y⁻¹) t * (Nat.primeCounting ⌊t⌋₊ : ℝ)) =
        -(∫ t in Set.Ioc 2 x, (Nat.primeCounting ⌊t⌋₊ : ℝ) / t ^ 2) := by
    rw [← MeasureTheory.integral_neg]
    apply MeasureTheory.integral_congr_ae
    filter_upwards with t
    rw [deriv_inv]
    ring
  rw [hintegral]
  have hpi2 : Nat.primeCounting 2 = 1 := by decide
  rw [hpi2]
  norm_num
  ring

private theorem integral_one_div_mul_log {a b : ℝ} (ha : 1 < a) (hb : 1 < b) :
    (∫ t in a..b, 1 / (t * Real.log t)) =
      Real.log (Real.log b) - Real.log (Real.log a) := by
  let f : ℝ → ℝ := fun t ↦ Real.log (Real.log t)
  let f' : ℝ → ℝ := fun t ↦ 1 / (t * Real.log t)
  have hderiv : Set.EqOn (deriv f) f' (Set.uIcc a b) := by
    intro t ht
    have ht1 : 1 < t := by
      rw [Set.mem_uIcc] at ht
      rcases ht with ht | ht <;> linarith
    have ht0 : t ≠ 0 := by linarith
    have hlog0 : Real.log t ≠ 0 :=
      Real.log_ne_zero_of_pos_of_ne_one (by linarith) (by linarith)
    change deriv (fun y : ℝ ↦ Real.log (Real.log y)) t = 1 / (t * Real.log t)
    convert (Real.hasDerivAt_log ht0).log hlog0 |>.deriv using 1 <;> field
  have hdiff : ∀ t ∈ Set.uIcc a b, DifferentiableAt ℝ f t := by
    intro t ht
    have ht1 : 1 < t := by
      rw [Set.mem_uIcc] at ht
      rcases ht with ht | ht <;> linarith
    have ht0 : t ≠ 0 := by linarith
    have hlog0 : Real.log t ≠ 0 := Real.log_ne_zero_of_pos_of_ne_one (by linarith) (by linarith)
    exact ((Real.hasDerivAt_log ht0).log hlog0).differentiableAt
  have hcont : ContinuousOn f' (Set.uIcc a b) := by
    intro t ht
    have ht1 : 1 < t := by
      rw [Set.mem_uIcc] at ht
      rcases ht with ht | ht <;> linarith
    have ht0 : t ≠ 0 := by linarith
    have hlog0 : Real.log t ≠ 0 :=
      Real.log_ne_zero_of_pos_of_ne_one (by linarith) (by linarith)
    exact ContinuousAt.continuousWithinAt <| by
      simp only [f']
      exact continuousAt_const.div (continuousAt_id.mul (Real.continuousAt_log ht0))
        (mul_ne_zero ht0 hlog0)
  have hf'int : IntervalIntegrable f' MeasureTheory.volume a b :=
    ContinuousOn.intervalIntegrable hcont
  have hdint : IntervalIntegrable (deriv f) MeasureTheory.volume a b :=
    hf'int.congr (hderiv.symm.mono Set.uIoc_subset_uIcc)
  calc
    (∫ t in a..b, 1 / (t * Real.log t)) = ∫ t in a..b, f' t := by rfl
    _ = ∫ t in a..b, deriv f t :=
      intervalIntegral.integral_congr hderiv.symm
    _ = f b - f a := intervalIntegral.integral_deriv_eq_sub hdiff hdint
    _ = Real.log (Real.log b) - Real.log (Real.log a) := by rfl

private theorem intervalIntegrable_primeCounting_div_sq {a b : ℝ}
    (ha : 0 < a) (hab : a ≤ b) :
    IntervalIntegrable (fun t : ℝ ↦ (Nat.primeCounting ⌊t⌋₊ : ℝ) / t ^ 2)
      MeasureTheory.volume a b := by
  rw [intervalIntegrable_iff_integrableOn_Icc_of_le hab]
  let c : ℕ → ℝ := fun n ↦ if n.Prime then 1 else 0
  have hg : IntegrableOn (fun t : ℝ ↦ (t ^ 2)⁻¹) (Set.Icc a b) := by
    refine ContinuousOn.integrableOn_Icc fun t ht ↦ ContinuousAt.continuousWithinAt ?_
    have ht0 : t ≠ 0 := by linarith [ht.1]
    exact (continuousAt_id.pow 2).inv₀ (pow_ne_zero 2 ht0)
  have h := integrableOn_mul_sum_Icc (a := a) (b := b) (m := 0) c ha.le hg
  simpa only [c, sum_primeIndicator, div_eq_mul_inv, mul_comm] using h

/-- Chebyshev's explicit constant is retained in the reciprocal-prime sum. -/
theorem eventually_primeReciprocalSum_le {c : ℝ} (hc : Real.log 4 < c) :
    ∀ᶠ x : ℝ in atTop,
      primeReciprocalSum x ≤ c * Real.log (Real.log x) := by
  let d : ℝ := (Real.log 4 + c) / 2
  have h4d : Real.log 4 < d := by dsimp [d]; linarith
  have hdc : d < c := by dsimp [d]; linarith
  have hd0 : 0 < d := (Real.log_pos (by norm_num : (1 : ℝ) < 4)).trans h4d
  have heps : 0 < d - Real.log 4 := sub_pos.mpr h4d
  obtain ⟨T₀, hT₀⟩ := (eventually_atTop.1
    (Chebyshev.eventually_primeCounting_le heps))
  let T : ℝ := max 3 T₀
  have hT3 : 3 ≤ T := le_max_left _ _
  have hT₀T : T₀ ≤ T := le_max_right _ _
  have hpi : ∀ t : ℝ, T ≤ t →
      (Nat.primeCounting ⌊t⌋₊ : ℝ) ≤ d * t / Real.log t := by
    intro t ht
    simpa [d, add_sub_cancel_right] using hT₀ t (hT₀T.trans ht)
  let F : ℝ → ℝ := fun t ↦ (Nat.primeCounting ⌊t⌋₊ : ℝ) / t ^ 2
  let D : ℝ := ∫ t in 2..T, F t
  let B : ℝ := d + |D| + |d * Real.log (Real.log T)|
  have hcd0 : 0 < c - d := sub_pos.mpr hdc
  have hloglog : Tendsto (fun x : ℝ ↦ Real.log (Real.log x)) atTop atTop :=
    Real.tendsto_log_atTop.comp Real.tendsto_log_atTop
  have hlargeLog : ∀ᶠ x : ℝ in atTop,
      B ≤ (c - d) * Real.log (Real.log x) := by
    have hthreshold := (tendsto_atTop.1 hloglog) (B / (c - d))
    filter_upwards [hthreshold] with x hx
    have := mul_le_mul_of_nonneg_left hx hcd0.le
    rwa [mul_div_cancel₀ B hcd0.ne'] at this
  have hlog3 : 1 < Real.log 3 := by
    exact (Real.lt_log_iff_exp_lt (by norm_num)).2 Real.exp_one_lt_three
  filter_upwards [eventually_ge_atTop T, hlargeLog] with x hxT hxlarge
  have hx2 : 2 ≤ x := by linarith [hT3]
  have hTx : T ≤ x := hxT
  have h3x : 3 ≤ x := hT3.trans hTx
  have hlogx1 : 1 < Real.log x := hlog3.trans_le <| by
    gcongr
  rw [primeReciprocalSum_eq hx2, ← intervalIntegral.integral_of_le hx2]
  have hFhead : IntervalIntegrable F MeasureTheory.volume 2 T := by
    simpa only [F] using intervalIntegrable_primeCounting_div_sq (by norm_num) (by linarith [hT3])
  have hFtail : IntervalIntegrable F MeasureTheory.volume T x := by
    simpa only [F] using intervalIntegrable_primeCounting_div_sq (by linarith [hT3]) hTx
  rw [← intervalIntegral.integral_add_adjacent_intervals hFhead hFtail]
  have hFint : IntervalIntegrable F MeasureTheory.volume T x := hFtail
  have hGint : IntervalIntegrable (fun t : ℝ ↦ d * (1 / (t * Real.log t)))
      MeasureTheory.volume T x := by
    refine (ContinuousOn.intervalIntegrable ?_).const_mul d
    intro t ht
    have ht3 : 3 ≤ t := by
      rw [Set.uIcc_of_le hTx] at ht
      exact hT3.trans ht.1
    have ht0 : t ≠ 0 := by linarith
    have hlog0 : Real.log t ≠ 0 :=
      Real.log_ne_zero_of_pos_of_ne_one (by linarith) (by linarith)
    exact ContinuousAt.continuousWithinAt <|
      continuousAt_const.div (continuousAt_id.mul (Real.continuousAt_log ht0))
        (mul_ne_zero ht0 hlog0)
  have htail : (∫ t in T..x, F t) ≤
      d * (Real.log (Real.log x) - Real.log (Real.log T)) := by
    calc
      (∫ t in T..x, F t) ≤ ∫ t in T..x, d * (1 / (t * Real.log t)) := by
        apply intervalIntegral.integral_mono_on hTx hFint hGint
        intro t ht
        have htT : T ≤ t := ht.1
        have ht3 : 3 ≤ t := hT3.trans htT
        have ht0 : 0 < t := by linarith
        have hlog0 : 0 < Real.log t := Real.log_pos (by linarith)
        dsimp only [F]
        calc
          (Nat.primeCounting ⌊t⌋₊ : ℝ) / t ^ 2 ≤
              (d * t / Real.log t) / t ^ 2 := by gcongr; exact hpi t htT
          _ = d * (1 / (t * Real.log t)) := by field
      _ = d * (∫ t in T..x, 1 / (t * Real.log t)) := by
        rw [intervalIntegral.integral_const_mul]
      _ = d * (Real.log (Real.log x) - Real.log (Real.log T)) := by
        rw [integral_one_div_mul_log (by linarith [hT3]) (by linarith [hx2, hlogx1])]
  have hterm : (Nat.primeCounting ⌊x⌋₊ : ℝ) / x ≤ d := by
    calc
      (Nat.primeCounting ⌊x⌋₊ : ℝ) / x ≤ (d * x / Real.log x) / x := by
        gcongr
        exact hpi x hTx
      _ = d / Real.log x := by field_simp
      _ ≤ d := by
        exact (div_le_self hd0.le (le_of_lt hlogx1))
  have hD : D ≤ |D| := le_abs_self D
  have hlogT : -(d * Real.log (Real.log T)) ≤ |d * Real.log (Real.log T)| :=
    neg_le_abs _
  dsimp only [F] at htail
  dsimp only [D, B] at hxlarge hD hlogT
  calc
    (Nat.primeCounting ⌊x⌋₊ : ℝ) / x +
        ((∫ t in 2..T, (Nat.primeCounting ⌊t⌋₊ : ℝ) / t ^ 2) +
          ∫ t in T..x, (Nat.primeCounting ⌊t⌋₊ : ℝ) / t ^ 2) ≤
        d + |∫ t in 2..T, (Nat.primeCounting ⌊t⌋₊ : ℝ) / t ^ 2| +
          d * (Real.log (Real.log x) - Real.log (Real.log T)) := by linarith
    _ ≤ d * Real.log (Real.log x) +
        (d + |∫ t in 2..T, (Nat.primeCounting ⌊t⌋₊ : ℝ) / t ^ 2| +
          |d * Real.log (Real.log T)|) := by linarith
    _ ≤ c * Real.log (Real.log x) := by nlinarith

end Erdos872.A3

import Erdos872R177.A3.FinitePrimeMoment
import Erdos872R177.DenseFactorization

namespace Erdos872.A3

open Filter Finset Real
open scoped Nat.Prime Topology

/-- A fixed Rankin parameter, chosen close enough to one for Chebyshev's constant. -/
noncomputable def rankinQ : ℝ := 1001 / 1000

/-- Primes in `[2, B]`. -/
def primesUpTo (B : ℕ) : Finset ℕ :=
  (Finset.Icc 2 B).filter Nat.Prime

theorem mem_primesUpTo {B p : ℕ} :
    p ∈ primesUpTo B ↔ 2 ≤ p ∧ p ≤ B ∧ p.Prime := by
  simp [primesUpTo, and_assoc]

theorem rankinQ_one_lt : 1 < rankinQ := by
  norm_num [rankinQ]

theorem rankinQ_lt_two : rankinQ < 2 := by
  norm_num [rankinQ]

private theorem shifted_reciprocal_term_le {p : ℕ} (hp : p.Prime) :
    1 / ((p : ℝ) - rankinQ) ≤
      (if p < 1003 then 2 else 0) + rankinQ * (1 / (p : ℝ)) := by
  have hp2 : 2 ≤ p := hp.two_le
  have hden : 0 < (p : ℝ) - rankinQ := by
    have hp2r : (2 : ℝ) ≤ p := by exact_mod_cast hp2
    norm_num [rankinQ]
    linarith
  by_cases hsmall : p < 1003
  · simp only [hsmall, if_true]
    have htwo : 1 / ((p : ℝ) - rankinQ) ≤ 2 := by
      rw [div_le_iff₀ hden]
      have hp2r : (2 : ℝ) ≤ p := by exact_mod_cast hp2
      norm_num [rankinQ]
      linarith
    have hp0 : (0 : ℝ) < p := by exact_mod_cast hp.pos
    have hnonneg : 0 ≤ rankinQ * (1 / (p : ℝ)) :=
      mul_nonneg (by norm_num [rankinQ]) (one_div_nonneg.mpr hp0.le)
    linarith
  · simp only [hsmall, if_false, zero_add]
    have hp1003 : 1003 ≤ p := by omega
    have hp0 : (0 : ℝ) < p := by exact_mod_cast hp.pos
    rw [show rankinQ * (1 / (p : ℝ)) = rankinQ / (p : ℝ) by ring]
    rw [div_le_div_iff₀ hden hp0]
    have hp1003r : (1003 : ℝ) ≤ p := by exact_mod_cast hp1003
    norm_num [rankinQ]
    linarith

/-- The shifted reciprocal sum differs from the ordinary one by a fixed constant. -/
theorem shiftedPrimeReciprocalSum_le (B : ℕ) :
    (∑ p ∈ primesUpTo B, 1 / ((p : ℝ) - rankinQ)) ≤
      2006 + rankinQ * primeReciprocalSum B := by
  have hterms :
      (∑ p ∈ primesUpTo B, 1 / ((p : ℝ) - rankinQ)) ≤
        ∑ p ∈ primesUpTo B,
          ((if p < 1003 then 2 else 0) + rankinQ * (1 / (p : ℝ))) := by
    apply Finset.sum_le_sum
    intro p hp
    exact shifted_reciprocal_term_le (mem_primesUpTo.mp hp).2.2
  have hsmallCard :
      #((primesUpTo B).filter fun p ↦ p < 1003) ≤ 1003 := by
    apply (Finset.card_le_card ?_).trans_eq (Finset.card_range 1003)
    intro p hp
    simp only [Finset.mem_filter] at hp
    exact Finset.mem_range.mpr hp.2
  have hsmallSum :
      (∑ p ∈ primesUpTo B, if p < 1003 then (2 : ℝ) else 0) ≤ 2006 := by
    rw [← Finset.sum_filter]
    simp only [Finset.sum_const, nsmul_eq_mul]
    have hc : (#((primesUpTo B).filter fun p ↦ p < 1003) : ℝ) ≤ 1003 := by
      exact_mod_cast hsmallCard
    nlinarith
  have hprimeSum :
      (∑ p ∈ primesUpTo B, (1 / (p : ℝ))) = primeReciprocalSum B := by
    unfold primesUpTo primeReciprocalSum
    simp
  calc
    (∑ p ∈ primesUpTo B, 1 / ((p : ℝ) - rankinQ)) ≤
        ∑ p ∈ primesUpTo B,
          ((if p < 1003 then 2 else 0) + rankinQ * (1 / (p : ℝ))) := hterms
    _ = (∑ p ∈ primesUpTo B, if p < 1003 then (2 : ℝ) else 0) +
        rankinQ * ∑ p ∈ primesUpTo B, (1 / (p : ℝ)) := by
          rw [Finset.sum_add_distrib, Finset.mul_sum]
    _ ≤ 2006 + rankinQ * primeReciprocalSum B := by
      rw [hprimeSum]
      gcongr

private theorem log_four_lt_rankinC : Real.log 4 < (139 : ℝ) / 100 := by
  rw [show (4 : ℝ) = 2 * 2 by norm_num, Real.log_mul (by norm_num) (by norm_num)]
  have h := Real.log_two_lt_d9
  norm_num at h ⊢
  linarith

/-- The strict numerical margin in the finite-prime Rankin estimate. -/
theorem rankin_rate_pos :
    0 < Real.log rankinQ -
      (rankinQ - 1) * rankinQ * ((139 : ℝ) / 100) * Real.log 2 := by
  have hlog :
      2 * ((1 : ℝ) / 1000) / ((1 : ℝ) / 1000 + 2) < Real.log rankinQ := by
    have hqeq : rankinQ = 1 + (1 : ℝ) / 1000 := by norm_num [rankinQ]
    rw [hqeq]
    exact Real.lt_log_one_add_of_pos (show (0 : ℝ) < 1 / 1000 by norm_num)
  have htwo := Real.log_two_lt_d9
  have hscaled := mul_lt_mul_of_pos_left htwo
    (show (0 : ℝ) < (1 / 1000 : ℝ) * (1001 / 1000) * (139 / 100) by norm_num)
  norm_num [rankinQ] at hscaled hlog ⊢
  linarith

/-- The deterministic factor cutoff forced by `r` dense prime factors. -/
def densePrimeCutoff (L r : ℕ) : ℕ :=
  L ^ (2 ^ r)

theorem tendsto_densePrimeCutoff (L : ℕ) (hL : 2 ≤ L) :
    Tendsto (densePrimeCutoff L) atTop atTop := by
  unfold densePrimeCutoff
  exact (Nat.tendsto_pow_atTop_atTop_of_one_lt (by omega : 1 < L)).comp
    (Nat.tendsto_pow_atTop_atTop_of_one_lt one_lt_two)

theorem log_log_densePrimeCutoff (L r : ℕ) (hL : 2 ≤ L) :
    Real.log (Real.log (densePrimeCutoff L r : ℝ)) =
      (r : ℝ) * Real.log 2 + Real.log (Real.log L) := by
  have hL0 : (0 : ℝ) < L := by exact_mod_cast (lt_of_lt_of_le (by omega : 0 < 2) hL)
  have hlogL0 : Real.log (L : ℝ) ≠ 0 :=
    Real.log_ne_zero_of_pos_of_ne_one hL0 (by exact_mod_cast (show L ≠ 1 by omega))
  have hpow0 : ((2 ^ r : ℕ) : ℝ) ≠ 0 := by positivity
  unfold densePrimeCutoff
  rw [Nat.cast_pow]
  rw [Real.log_pow]
  rw [Real.log_mul hpow0 hlogL0]
  rw [Nat.cast_pow]
  rw [Real.log_pow]
  ring

theorem KDense_take_prod_le {K : ℝ} {a L i : ℕ} (hdense : KDense K a)
    (hKL : K ≤ L) (hL : 1 ≤ L) (hi : i ≤ a.primeFactorsList.length) :
    (a.primeFactorsList.take i).prod ≤ L ^ (2 ^ i - 1) := by
  induction i with
  | zero => simp
  | succ i ih =>
      have hi' : i < a.primeFactorsList.length := by omega
      have hprev := ih (by omega)
      have hfactorR := hdense ⟨i, hi'⟩
      have hfactorR' :
          ((a.primeFactorsList.get ⟨i, hi'⟩ : ℕ) : ℝ) ≤
            (L * (a.primeFactorsList.take i).prod : ℕ) := by
        calc
          ((a.primeFactorsList.get ⟨i, hi'⟩ : ℕ) : ℝ) ≤
              K * ((a.primeFactorsList.take i).prod : ℝ) := hfactorR
          _ ≤ (L : ℝ) * ((a.primeFactorsList.take i).prod : ℝ) := by
            gcongr
          _ = (L * (a.primeFactorsList.take i).prod : ℕ) := by norm_cast
      have hfactor :
          a.primeFactorsList.get ⟨i, hi'⟩ ≤
            L * (a.primeFactorsList.take i).prod := by exact_mod_cast hfactorR'
      rw [← List.take_concat_get hi']
      simp only [List.prod_concat]
      calc
        (a.primeFactorsList.take i).prod * a.primeFactorsList.get ⟨i, hi'⟩ ≤
            (a.primeFactorsList.take i).prod *
              (L * (a.primeFactorsList.take i).prod) :=
          Nat.mul_le_mul_left _ hfactor
        _ ≤ L ^ (2 ^ i - 1) * (L * L ^ (2 ^ i - 1)) := by
          exact Nat.mul_le_mul hprev (Nat.mul_le_mul_left L hprev)
        _ = L ^ (2 ^ (i + 1) - 1) := by
          have hexp :
              (2 ^ i - 1) + (1 + (2 ^ i - 1)) = 2 ^ (i + 1) - 1 := by
            have hpow : 1 ≤ 2 ^ i := Nat.one_le_two_pow
            simp only [pow_succ]
            omega
          rw [← hexp, pow_add, pow_add, pow_one]

theorem KDense_le_densePrimeCutoff {K : ℝ} {a L : ℕ} (hdense : KDense K a)
    (ha : a ≠ 0) (hKL : K ≤ L) (hL : 1 ≤ L) :
    a ≤ densePrimeCutoff L a.primeFactorsList.length := by
  have htake := KDense_take_prod_le hdense hKL hL
    (show a.primeFactorsList.length ≤ a.primeFactorsList.length by rfl)
  rw [List.take_length, Nat.prod_primeFactorsList ha] at htake
  exact htake.trans (pow_le_pow_right₀ (by omega) (Nat.sub_le _ _))

private theorem primeFactorsList_aK_eq_a3 (K : ℝ) (x : ℕ) :
    (aK K x).primeFactorsList = x.primeFactorsList.take (jK K x) := by
  let l := x.primeFactorsList.take (jK K x)
  have hperm : l.Perm l.prod.primeFactorsList := by
    apply Nat.primeFactorsList_unique rfl
    intro p hp
    exact Nat.prime_of_mem_primeFactorsList (List.mem_of_mem_take hp)
  have hsorted_l : l.SortedLE := by
    exact (Nat.primeFactorsList_sorted x).pairwise.take.sortedLE
  have hsorted_prod : l.prod.primeFactorsList.SortedLE :=
    Nat.primeFactorsList_sorted l.prod
  have heq : l = l.prod.primeFactorsList :=
    hperm.eq_of_sortedLE hsorted_l hsorted_prod
  simpa [aK, l] using heq.symm

theorem aK_pos_a3 (K : ℝ) (x : ℕ) : 0 < aK K x := by
  unfold aK
  apply List.prod_pos
  intro p hp
  exact Nat.pos_of_mem_primeFactorsList (List.mem_of_mem_take hp)

private theorem jK_le_length_a3 (K : ℝ) (x : ℕ) :
    jK K x ≤ x.primeFactorsList.length := by
  classical
  unfold jK
  exact Nat.findGreatest_le _

private theorem mem_le_prod_of_pos {l : List ℕ} {p : ℕ}
    (hp : p ∈ l) (hl : ∀ q ∈ l, 0 < q) : p ≤ l.prod := by
  exact Nat.le_of_dvd (List.prod_pos hl) (List.dvd_prod hp)

/-- The first `r` prime factors of a positive `K`-dense number are all below
the deterministic cutoff `L^(2^r)`. -/
theorem dense_prefix_smallOmega {K : ℝ} {a L r : ℕ}
    (hdense : KDense K a) (ha : a ≠ 0) (hKL : K ≤ L) (hL : 1 ≤ L)
    (hr : r ≤ a.primeFactorsList.length) :
    r ≤ ∑ p ∈ primesUpTo (densePrimeCutoff L r), a.factorization p := by
  classical
  let l := a.primeFactorsList.take r
  let P := primesUpTo (densePrimeCutoff L r)
  have hlprod : l.prod ≤ densePrimeCutoff L r := by
    dsimp only [l]
    exact (KDense_take_prod_le hdense hKL hL hr).trans
      (pow_le_pow_right₀ (by omega) (Nat.sub_le _ _))
  have hlP : ∀ p ∈ l, p ∈ P := by
    intro p hp
    have hpprime : p.Prime :=
      Nat.prime_of_mem_primeFactorsList (List.mem_of_mem_take hp)
    have hpprod : p ≤ l.prod := by
      apply mem_le_prod_of_pos hp
      intro q hq
      exact Nat.pos_of_mem_primeFactorsList
        (List.mem_of_mem_take (show q ∈ a.primeFactorsList.take r by simpa [l] using hq))
    exact mem_primesUpTo.mpr ⟨hpprime.two_le, hpprod.trans hlprod, hpprime⟩
  have hsubperm : List.Subperm l a.primeFactorsList :=
    (List.take_sublist r a.primeFactorsList).subperm
  calc
    r = l.length := by simp [l, List.length_take_of_le hr]
    _ = (l : Multiset ℕ).card := rfl
    _ = ∑ p ∈ P, (l : Multiset ℕ).count p := by
      symm
      exact Multiset.sum_count_eq_card (by simpa [P] using hlP)
    _ ≤ ∑ p ∈ P, a.factorization p := by
      apply Finset.sum_le_sum
      intro p hp
      rw [← Nat.primeFactorsList_count_eq]
      rw [Multiset.coe_count]
      exact List.subperm_iff_count.mp hsubperm p

/-- A long dense prefix of `x` supplies `r` small prime factors of `x`. -/
theorem aK_large_implies_smallOmega {K gamma : ℝ} {L r N x : ℕ}
    (hK : 2 < K) (hL : L = ⌈K⌉₊) (hgamma : 0 < gamma)
    (hcut : (densePrimeCutoff L r : ℝ) ≤ (N : ℝ) ^ gamma)
    (hx : 0 < x) (hlarge : (N : ℝ) ^ gamma < (aK K x : ℝ)) :
    r ≤ ∑ p ∈ primesUpTo (densePrimeCutoff L r), x.factorization p := by
  classical
  have hL2 : 2 ≤ L := by
    subst L
    have hceil : K ≤ (⌈K⌉₊ : ℝ) := Nat.le_ceil K
    exact_mod_cast (show (2 : ℝ) ≤ ⌈K⌉₊ by linarith)
  have hKL : K ≤ L := by
    subst L
    exact Nat.le_ceil K
  have ha0 : aK K x ≠ 0 := Nat.ne_of_gt (aK_pos_a3 K x)
  have hlength : r ≤ (aK K x).primeFactorsList.length := by
    by_contra hr
    have hlenlt : (aK K x).primeFactorsList.length < r := Nat.lt_of_not_ge hr
    have hfull := KDense_le_densePrimeCutoff (aK_KDense K x) ha0 hKL
      (show 1 ≤ L by omega)
    have hmono :
        densePrimeCutoff L (aK K x).primeFactorsList.length ≤
          densePrimeCutoff L r := by
      unfold densePrimeCutoff
      exact pow_le_pow_right₀ (show 1 ≤ L by omega)
        (pow_le_pow_right₀ (show 1 ≤ (2 : ℕ) by omega) (Nat.le_of_lt hlenlt))
    have hareal : (aK K x : ℝ) ≤ densePrimeCutoff L r := by
      exact_mod_cast hfull.trans hmono
    linarith
  have hprefix := dense_prefix_smallOmega (aK_KDense K x) ha0 hKL
    (show 1 ≤ L by omega) hlength
  have hlist :
      (aK K x).primeFactorsList = x.primeFactorsList.take (jK K x) :=
    primeFactorsList_aK_eq_a3 K x
  have hj : r ≤ jK K x := by
    rw [hlist, List.length_take_of_le (jK_le_length_a3 K x)] at hlength
    exact hlength
  have hcounts (p : ℕ) :
      (aK K x).factorization p ≤ x.factorization p := by
    rw [← Nat.primeFactorsList_count_eq, ← Nat.primeFactorsList_count_eq, hlist]
    exact List.subperm_iff_count.mp
      ((List.take_sublist (jK K x) x.primeFactorsList).subperm) p
  exact hprefix.trans (Finset.sum_le_sum fun p hp ↦ hcounts p)

/-- Euler-product ratio controlling the density of a long dense prefix. -/
noncomputable def denseEulerRatio (L r : ℕ) : ℝ :=
  (∏ p ∈ primesUpTo (densePrimeCutoff L r),
      finiteEulerFactor rankinQ r p) / rankinQ ^ r

theorem denseEulerRatio_nonneg (L r : ℕ) : 0 ≤ denseEulerRatio L r := by
  unfold denseEulerRatio
  apply div_nonneg
  · exact Finset.prod_nonneg fun p hp ↦
      finiteEulerFactor_nonneg rankinQ_one_lt.le r p
  · exact pow_nonneg (le_of_lt (lt_trans zero_lt_one rankinQ_one_lt)) r

theorem tendsto_denseEulerRatio (L : ℕ) (hL : 2 ≤ L) :
    Tendsto (denseEulerRatio L) atTop (𝓝 0) := by
  let c : ℝ := 139 / 100
  let rate : ℝ := Real.log rankinQ -
    (rankinQ - 1) * rankinQ * c * Real.log 2
  let C : ℝ := (rankinQ - 1) *
    (2006 + rankinQ * c * Real.log (Real.log L))
  have hrate : 0 < rate := by
    simpa only [rate, c] using rankin_rate_pos
  have hBnat : Tendsto (densePrimeCutoff L) atTop atTop :=
    tendsto_densePrimeCutoff L hL
  have hBreal : Tendsto (fun r ↦ (densePrimeCutoff L r : ℝ)) atTop atTop :=
    tendsto_natCast_atTop_atTop.comp hBnat
  have hprime : ∀ᶠ r : ℕ in atTop,
      primeReciprocalSum (densePrimeCutoff L r : ℝ) ≤
        c * Real.log (Real.log (densePrimeCutoff L r : ℝ)) := by
    exact hBreal.eventually (eventually_primeReciprocalSum_le log_four_lt_rankinC)
  have hlinear : Tendsto (fun r : ℕ ↦ C - rate * (r : ℝ)) atTop atBot := by
    have hcast : Tendsto (fun r : ℕ ↦ (r : ℝ)) atTop atTop :=
      tendsto_natCast_atTop_atTop
    have hmul : Tendsto (fun r : ℕ ↦ (-rate) * (r : ℝ)) atTop atBot :=
      (tendsto_const_mul_atBot_of_neg (neg_lt_zero.mpr hrate)).2 hcast
    rw [tendsto_atBot] at hmul ⊢
    intro b
    filter_upwards [hmul (b - C)] with r hr
    linarith
  have hupper : Tendsto (fun r : ℕ ↦ Real.exp (C - rate * (r : ℝ))) atTop (𝓝 0) :=
    Real.tendsto_exp_atBot.comp hlinear
  apply squeeze_zero' (Eventually.of_forall (denseEulerRatio_nonneg L)) ?_ hupper
  filter_upwards [hprime] with r hprime_r
  let P := primesUpTo (densePrimeCutoff L r)
  have hPq : ∀ p ∈ P, rankinQ < p := by
    intro p hp
    have hp2r : (2 : ℝ) ≤ p := by exact_mod_cast (mem_primesUpTo.mp hp).1
    exact rankinQ_lt_two.trans_le hp2r
  have hprod :
      (∏ p ∈ P, finiteEulerFactor rankinQ r p) ≤
        Real.exp ((rankinQ - 1) *
          ∑ p ∈ P, 1 / ((p : ℝ) - rankinQ)) :=
    finiteEulerProduct_le_exp rankinQ_one_lt.le r P hPq
  have hshift :
      (∑ p ∈ P, 1 / ((p : ℝ) - rankinQ)) ≤
        2006 + rankinQ * primeReciprocalSum (densePrimeCutoff L r) := by
    simpa only [P] using shiftedPrimeReciprocalSum_le (densePrimeCutoff L r)
  have hexp1 :
      Real.exp ((rankinQ - 1) *
          ∑ p ∈ P, 1 / ((p : ℝ) - rankinQ)) ≤
        Real.exp ((rankinQ - 1) *
          (2006 + rankinQ * primeReciprocalSum (densePrimeCutoff L r))) := by
    apply Real.exp_le_exp.mpr
    exact mul_le_mul_of_nonneg_left hshift (sub_nonneg.mpr rankinQ_one_lt.le)
  have hexp2 :
      Real.exp ((rankinQ - 1) *
          (2006 + rankinQ * primeReciprocalSum (densePrimeCutoff L r))) ≤
        Real.exp ((rankinQ - 1) *
          (2006 + rankinQ * c *
            Real.log (Real.log (densePrimeCutoff L r : ℝ)))) := by
    apply Real.exp_le_exp.mpr
    have hqnonneg : 0 ≤ rankinQ := le_of_lt (lt_trans zero_lt_one rankinQ_one_lt)
    have hqmul := mul_le_mul_of_nonneg_left hprime_r hqnonneg
    have hadd :
        2006 + rankinQ * primeReciprocalSum (densePrimeCutoff L r) ≤
          2006 + rankinQ * c *
            Real.log (Real.log (densePrimeCutoff L r : ℝ)) := by
      nlinarith
    exact mul_le_mul_of_nonneg_left hadd (sub_nonneg.mpr rankinQ_one_lt.le)
  have hq0 : 0 < rankinQ := lt_trans zero_lt_one rankinQ_one_lt
  have hqpow : rankinQ ^ r = Real.exp ((r : ℝ) * Real.log rankinQ) := by
    calc
      rankinQ ^ r = Real.exp (Real.log rankinQ) ^ r := by rw [Real.exp_log hq0]
      _ = Real.exp ((r : ℝ) * Real.log rankinQ) := (Real.exp_nat_mul _ _).symm
  calc
    denseEulerRatio L r =
        (∏ p ∈ P, finiteEulerFactor rankinQ r p) / rankinQ ^ r := by rfl
    _ ≤ Real.exp ((rankinQ - 1) *
          (2006 + rankinQ * c *
            Real.log (Real.log (densePrimeCutoff L r : ℝ)))) / rankinQ ^ r := by
      gcongr
      exact hprod.trans (hexp1.trans hexp2)
    _ = Real.exp (C - rate * (r : ℝ)) := by
      rw [hqpow, ← Real.exp_sub]
      rw [log_log_densePrimeCutoff L r hL]
      dsimp only [C, rate]
      ring

/-- A sufficiently long dense prefix has arbitrarily small Rankin density. -/
theorem exists_denseEulerRatio_lt (L : ℕ) (hL : 2 ≤ L) {epsilon : ℝ}
    (hepsilon : 0 < epsilon) :
    ∃ r : ℕ, 1 ≤ r ∧ denseEulerRatio L r < epsilon := by
  have hsmall : ∀ᶠ r : ℕ in atTop, denseEulerRatio L r < epsilon :=
    (tendsto_order.1 (tendsto_denseEulerRatio L hL)).2 epsilon hepsilon
  obtain ⟨r, hrsmall, hr1⟩ := (hsmall.and (eventually_ge_atTop 1)).exists
  exact ⟨r, hr1, hrsmall⟩

/-- Integers whose maximal dense prefix is larger than `N^gamma`. -/
noncomputable def largeAKSet (K gamma : ℝ) (N : ℕ) : Finset ℕ :=
  (Finset.Ioc 0 N).filter fun x ↦ (N : ℝ) ^ gamma < (aK K x : ℝ)

/-- The large-prefix tail has density tending to zero. This is the Rankin-moment
half of the exceptional-set estimate in Lemma 2.3. -/
theorem eventually_largeAKSet_card_le {K gamma epsilon : ℝ}
    (hK : 2 < K) (hgamma : 0 < gamma) (hepsilon : 0 < epsilon) :
    ∀ᶠ N : ℕ in atTop,
      ((largeAKSet K gamma N).card : ℝ) ≤ epsilon * N := by
  classical
  let L : ℕ := ⌈K⌉₊
  have hL2 : 2 ≤ L := by
    have hceil : K ≤ (L : ℝ) := by simpa [L] using Nat.le_ceil K
    exact_mod_cast (show (2 : ℝ) ≤ L by linarith)
  obtain ⟨r, hr1, hratio⟩ := exists_denseEulerRatio_lt L hL2 hepsilon
  let B : ℕ := densePrimeCutoff L r
  let P : Finset ℕ := primesUpTo B
  have hpowT : Tendsto (fun N : ℕ ↦ (N : ℝ) ^ gamma) atTop atTop :=
    (tendsto_rpow_atTop hgamma).comp tendsto_natCast_atTop_atTop
  have hcutEventually : ∀ᶠ N : ℕ in atTop, (B : ℝ) ≤ (N : ℝ) ^ gamma :=
    hpowT.eventually (eventually_ge_atTop (B : ℝ))
  filter_upwards [hcutEventually, eventually_ge_atTop 1] with N hcut hN1
  let H := (Finset.Ioc 0 N).filter fun x ↦
    r ≤ ∑ p ∈ P, x.factorization p
  have hPprime : ∀ p ∈ P, p.Prime := by
    intro p hp
    exact (mem_primesUpTo.mp hp).2.2
  have hsubset : largeAKSet K gamma N ⊆ H := by
    intro x hx
    have hx' := Finset.mem_filter.mp hx
    have hxIoc := Finset.mem_Ioc.mp hx'.1
    apply Finset.mem_filter.mpr
    refine ⟨hx'.1, ?_⟩
    have hsmall := aK_large_implies_smallOmega
      (K := K) (gamma := gamma) (L := L) (r := r) (N := N) (x := x)
      hK rfl hgamma (by simpa [B] using hcut) hxIoc.1 hx'.2
    simpa [P, B] using hsmall
  have hcard : (largeAKSet K gamma N).card ≤ H.card :=
    Finset.card_le_card hsubset
  have hmoment : ((H.card : ℝ) * rankinQ ^ r) ≤
      (N : ℝ) * ∏ p ∈ P, finiteEulerFactor rankinQ r p := by
    simpa only [H] using
      highSmallOmega_card_mul_pow_le rankinQ_one_lt.le r N P hPprime
  have hqpow : 0 < rankinQ ^ r := pow_pos (lt_trans zero_lt_one rankinQ_one_lt) r
  have hH : (H.card : ℝ) ≤ (N : ℝ) * denseEulerRatio L r := by
    calc
      (H.card : ℝ) ≤
          ((N : ℝ) * ∏ p ∈ P, finiteEulerFactor rankinQ r p) /
            rankinQ ^ r := (le_div_iff₀ hqpow).2 hmoment
      _ = (N : ℝ) * denseEulerRatio L r := by
        simp only [denseEulerRatio, P, B]
        ring
  have hcardR : ((largeAKSet K gamma N).card : ℝ) ≤ (H.card : ℝ) := by
    exact_mod_cast hcard
  calc
    ((largeAKSet K gamma N).card : ℝ) ≤ (H.card : ℝ) := hcardR
    _ ≤ (N : ℝ) * denseEulerRatio L r := hH
    _ ≤ epsilon * N := by
      calc
        (N : ℝ) * denseEulerRatio L r ≤ (N : ℝ) * epsilon :=
          mul_le_mul_of_nonneg_left hratio.le (Nat.cast_nonneg N)
        _ = epsilon * N := by ring

end Erdos872.A3

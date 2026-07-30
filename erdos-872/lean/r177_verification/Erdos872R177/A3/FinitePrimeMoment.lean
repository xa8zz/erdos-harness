import Erdos872R177.A3.PrimeReciprocal
import Mathlib.Algebra.Order.Field.GeomSum

namespace Erdos872.A3

open Finset Real

/-- The capped local exponential weight at a prime. -/
noncomputable def localWeight (q : ℝ) (r p n : ℕ) : ℝ :=
  1 + (q - 1) * ∑ j ∈ Finset.range r,
    if p ^ (j + 1) ∣ n then q ^ j else 0

/-- Product of the capped local weights over a finite prime set. -/
noncomputable def finitePrimeWeight (q : ℝ) (r : ℕ) (P : Finset ℕ) (n : ℕ) : ℝ :=
  ∏ p ∈ P, localWeight q r p n

/-- The corresponding finite Euler factor. -/
noncomputable def finiteEulerFactor (q : ℝ) (r p : ℕ) : ℝ :=
  1 + (q - 1) * ∑ j ∈ Finset.range r, q ^ j / (p : ℝ) ^ (j + 1)

theorem localWeight_mul_of_coprime (q : ℝ) (r m : ℕ) {p d : ℕ}
    (hpd : p.Coprime d) :
    localWeight q r p (d * m) = localWeight q r p m := by
  unfold localWeight
  apply congrArg (fun z : ℝ ↦ 1 + (q - 1) * z)
  apply Finset.sum_congr rfl
  intro j hj
  have hiff : p ^ (j + 1) ∣ d * m ↔ p ^ (j + 1) ∣ m :=
    hpd.pow_left (j + 1) |>.dvd_mul_left
  simp only [hiff]

theorem finitePrimeWeight_mul_of_coprime (q : ℝ) (r m : ℕ) {P : Finset ℕ} {d : ℕ}
    (hd : ∀ p ∈ P, p.Coprime d) :
    finitePrimeWeight q r P (d * m) = finitePrimeWeight q r P m := by
  unfold finitePrimeWeight
  apply Finset.prod_congr rfl
  intro p hp
  exact localWeight_mul_of_coprime q r m (hd p hp)

private theorem sum_multiples_weight
    (f : ℕ → ℝ) {N d : ℕ} (hd : 0 < d) (hf : ∀ m, f (d * m) = f m) :
    ∑ n ∈ Finset.Ioc 0 N with d ∣ n, f n =
      ∑ m ∈ Finset.Ioc 0 (N / d), f m := by
  classical
  refine Finset.sum_bij' (fun n hn ↦ n / d) (fun m hm ↦ d * m) ?_ ?_ ?_ ?_ ?_
  · intro n hn
    simp only [Finset.mem_filter, Finset.mem_Ioc] at hn ⊢
    exact ⟨Nat.div_pos (Nat.le_of_dvd hn.1.1 hn.2) hd,
      Nat.div_le_div_right hn.1.2⟩
  · intro m hm
    simp only [Finset.mem_filter, Finset.mem_Ioc] at hm ⊢
    refine ⟨⟨Nat.mul_pos hd hm.1, ?_⟩, dvd_mul_right d m⟩
    rw [Nat.mul_comm]
    exact (Nat.le_div_iff_mul_le hd).mp hm.2
  · intro n hn
    exact Nat.mul_div_cancel' (Finset.mem_filter.mp hn).2
  · intro m hm
    change d * m / d = m
    simpa [Nat.mul_comm] using Nat.mul_div_left m hd
  · intro n hn
    rw [← hf (n / d), Nat.mul_div_cancel' (Finset.mem_filter.mp hn).2]

theorem localWeight_nonneg {q : ℝ} (hq : 1 ≤ q) (r p n : ℕ) :
    0 ≤ localWeight q r p n := by
  unfold localWeight
  have hsum : 0 ≤ ∑ j ∈ Finset.range r,
      if p ^ (j + 1) ∣ n then q ^ j else 0 := by
    apply Finset.sum_nonneg
    intro j hj
    split_ifs <;> positivity
  nlinarith

theorem finitePrimeWeight_nonneg {q : ℝ} (hq : 1 ≤ q) (r : ℕ) (P : Finset ℕ) (n : ℕ) :
    0 ≤ finitePrimeWeight q r P n := by
  unfold finitePrimeWeight
  exact Finset.prod_nonneg fun p hp ↦ localWeight_nonneg hq r p n

theorem finiteEulerFactor_nonneg {q : ℝ} (hq : 1 ≤ q) (r p : ℕ) :
    0 ≤ finiteEulerFactor q r p := by
  unfold finiteEulerFactor
  have hsum : 0 ≤ ∑ j ∈ Finset.range r, q ^ j / (p : ℝ) ^ (j + 1) := by
    apply Finset.sum_nonneg
    intro j hj
    positivity
  nlinarith

theorem finitePrimeWeight_insert (q : ℝ) (r n : ℕ) {p : ℕ} {P : Finset ℕ}
    (hp : p ∉ P) :
    finitePrimeWeight q r (insert p P) n =
      localWeight q r p n * finitePrimeWeight q r P n := by
  unfold finitePrimeWeight
  rw [Finset.prod_insert hp]

theorem localWeight_eq_pow_min {q : ℝ} {r p n : ℕ} (hp : p.Prime) (hn : n ≠ 0) :
    localWeight q r p n = q ^ min (n.factorization p) r := by
  unfold localWeight
  simp_rw [hp.pow_dvd_iff_le_factorization hn, ← Nat.lt_iff_add_one_le]
  have hfilter :
      (Finset.range r).filter (fun j ↦ j < n.factorization p) =
        Finset.range (min (n.factorization p) r) := by
    ext j
    simp [and_comm]
  rw [← Finset.sum_filter, hfilter, mul_comm, geom_sum_mul]
  ring

theorem finitePrimeWeight_eq_pow_sum_min {q : ℝ} {r n : ℕ} {P : Finset ℕ}
    (hP : ∀ p ∈ P, p.Prime) (hn : n ≠ 0) :
    finitePrimeWeight q r P n =
      q ^ ∑ p ∈ P, min (n.factorization p) r := by
  unfold finitePrimeWeight
  calc
    (∏ p ∈ P, localWeight q r p n) =
        ∏ p ∈ P, q ^ min (n.factorization p) r := by
          apply Finset.prod_congr rfl
          intro p hp
          exact localWeight_eq_pow_min (hP p hp) hn
    _ = q ^ ∑ p ∈ P, min (n.factorization p) r :=
      Finset.prod_pow_eq_pow_sum P (fun p ↦ min (n.factorization p) r) q

private theorem min_sum_le_sum_min {ι : Type*} (s : Finset ι) (f : ι → ℕ) (r : ℕ) :
    min (∑ i ∈ s, f i) r ≤ ∑ i ∈ s, min (f i) r := by
  classical
  induction s using Finset.induction_on with
  | empty => simp
  | @insert a s ha ih =>
      rw [Finset.sum_insert ha, Finset.sum_insert ha]
      omega

theorem le_sum_min_of_le_sum {ι : Type*} (s : Finset ι) (f : ι → ℕ) {r : ℕ}
    (h : r ≤ ∑ i ∈ s, f i) :
    r ≤ ∑ i ∈ s, min (f i) r := by
  have := min_sum_le_sum_min s f r
  rwa [min_eq_right h] at this

/-- Finite-prime exponential moment, proved by exact counts of multiples. -/
theorem finitePrimeMoment_le {q : ℝ} (hq : 1 ≤ q) (r N : ℕ) (P : Finset ℕ)
    (hP : ∀ p ∈ P, p.Prime) :
    ∑ n ∈ Finset.Ioc 0 N, finitePrimeWeight q r P n ≤
      (N : ℝ) * ∏ p ∈ P, finiteEulerFactor q r p := by
  classical
  induction P using Finset.induction_on generalizing N with
  | empty => simp [finitePrimeWeight]
  | @insert p P hp ih =>
      have hpprime : p.Prime := hP p (Finset.mem_insert_self p P)
      have hPprime : ∀ a ∈ P, a.Prime := by
        intro a ha
        exact hP a (Finset.mem_insert_of_mem ha)
      have hcop : ∀ a ∈ P, a.Coprime p := by
        intro a ha
        exact (Nat.coprime_primes (hPprime a ha) hpprime).2 (ne_of_mem_of_not_mem ha hp)
      let w : ℕ → ℝ := finitePrimeWeight q r P
      let E : ℝ := ∏ a ∈ P, finiteEulerFactor q r a
      have hE0 : 0 ≤ E := by
        dsimp only [E]
        exact Finset.prod_nonneg fun a ha ↦ finiteEulerFactor_nonneg hq r a
      have hdiv (j : ℕ) :
          ∑ n ∈ Finset.Ioc 0 N with p ^ (j + 1) ∣ n, w n =
            ∑ m ∈ Finset.Ioc 0 (N / p ^ (j + 1)), w m := by
        apply sum_multiples_weight w (pow_pos hpprime.pos (j + 1))
        intro m
        apply finitePrimeWeight_mul_of_coprime
        intro a ha
        exact (hcop a ha).pow_right (j + 1)
      have hexpand :
          ∑ n ∈ Finset.Ioc 0 N, finitePrimeWeight q r (insert p P) n =
            (∑ n ∈ Finset.Ioc 0 N, w n) +
              (q - 1) * ∑ j ∈ Finset.range r, q ^ j *
                (∑ n ∈ Finset.Ioc 0 N with p ^ (j + 1) ∣ n, w n) := by
        have hpoint (n : ℕ) :
            finitePrimeWeight q r (insert p P) n =
              w n + (q - 1) * ∑ j ∈ Finset.range r,
                if p ^ (j + 1) ∣ n then q ^ j * w n else 0 := by
          calc
            finitePrimeWeight q r (insert p P) n =
                (1 + (q - 1) * ∑ j ∈ Finset.range r,
                  if p ^ (j + 1) ∣ n then q ^ j else 0) *
                    finitePrimeWeight q r P n := by
                      rw [finitePrimeWeight_insert q r n hp, localWeight]
            _ = finitePrimeWeight q r P n + (q - 1) *
                  ((∑ j ∈ Finset.range r,
                    if p ^ (j + 1) ∣ n then q ^ j else 0) *
                      finitePrimeWeight q r P n) := by ring
            _ = w n + (q - 1) * ∑ j ∈ Finset.range r,
                  if p ^ (j + 1) ∣ n then q ^ j * w n else 0 := by
                    rw [Finset.sum_mul]
                    simp only [ite_mul, zero_mul, w]
        have hswap :
            ∑ n ∈ Finset.Ioc 0 N, ∑ j ∈ Finset.range r,
                (if p ^ (j + 1) ∣ n then q ^ j * w n else 0) =
              ∑ j ∈ Finset.range r, q ^ j *
                (∑ n ∈ Finset.Ioc 0 N with p ^ (j + 1) ∣ n, w n) := by
          rw [Finset.sum_comm]
          apply Finset.sum_congr rfl
          intro j hj
          rw [Finset.mul_sum, Finset.sum_filter]
        rw [Finset.sum_congr rfl (fun n hn ↦ hpoint n), Finset.sum_add_distrib]
        congr 1
        rw [← Finset.mul_sum, hswap]
      rw [hexpand, Finset.prod_insert hp]
      have hbase : (∑ n ∈ Finset.Ioc 0 N, w n) ≤ (N : ℝ) * E := by
        simpa only [w, E] using ih N hPprime
      have htail :
          (q - 1) * ∑ j ∈ Finset.range r, q ^ j *
              (∑ n ∈ Finset.Ioc 0 N with p ^ (j + 1) ∣ n, w n) ≤
            (N : ℝ) * E * ((q - 1) *
              ∑ j ∈ Finset.range r, q ^ j / (p : ℝ) ^ (j + 1)) := by
        have hinner (j : ℕ) :
            (∑ n ∈ Finset.Ioc 0 N with p ^ (j + 1) ∣ n, w n) ≤
              (N : ℝ) * E / (p : ℝ) ^ (j + 1) := by
          rw [hdiv]
          calc
            (∑ m ∈ Finset.Ioc 0 (N / p ^ (j + 1)), w m) ≤
                ((N / p ^ (j + 1) : ℕ) : ℝ) * E := by
                  simpa only [w, E] using ih (N := N / p ^ (j + 1)) hPprime
            _ ≤ ((N : ℝ) / (p ^ (j + 1) : ℕ)) * E := by
                  gcongr
                  exact Nat.cast_div_le
            _ = (N : ℝ) * E / (p : ℝ) ^ (j + 1) := by
                  norm_cast
                  ring
        calc
          (q - 1) * ∑ j ∈ Finset.range r, q ^ j *
              (∑ n ∈ Finset.Ioc 0 N with p ^ (j + 1) ∣ n, w n) ≤
              (q - 1) * ∑ j ∈ Finset.range r,
                q ^ j * ((N : ℝ) * E / (p : ℝ) ^ (j + 1)) := by
                  apply mul_le_mul_of_nonneg_left _ (sub_nonneg.mpr hq)
                  apply Finset.sum_le_sum
                  intro j hj
                  exact mul_le_mul_of_nonneg_left (hinner j) (pow_nonneg (zero_le_one.trans hq) j)
          _ = (N : ℝ) * E * ((q - 1) *
                ∑ j ∈ Finset.range r, q ^ j / (p : ℝ) ^ (j + 1)) := by
                  have hfactor :
                      (∑ j ∈ Finset.range r,
                        q ^ j * ((N : ℝ) * E / (p : ℝ) ^ (j + 1))) =
                        (N : ℝ) * E * ∑ j ∈ Finset.range r,
                          q ^ j / (p : ℝ) ^ (j + 1) := by
                    rw [Finset.mul_sum]
                    apply Finset.sum_congr rfl
                    intro j hj
                    ring
                  rw [hfactor]
                  ring
      calc
        (∑ n ∈ Finset.Ioc 0 N, w n) +
            (q - 1) * ∑ j ∈ Finset.range r, q ^ j *
              (∑ n ∈ Finset.Ioc 0 N with p ^ (j + 1) ∣ n, w n) ≤
            (N : ℝ) * E + (N : ℝ) * E * ((q - 1) *
              ∑ j ∈ Finset.range r, q ^ j / (p : ℝ) ^ (j + 1)) :=
          add_le_add hbase htail
        _ = (N : ℝ) * (finiteEulerFactor q r p * E) := by
          rw [finiteEulerFactor]
          ring
        _ = (N : ℝ) * (finiteEulerFactor q r p *
            ∏ x ∈ P, finiteEulerFactor q r x) := by rfl

/-- Rankin's inequality for integers having at least `r` factors from `P`. -/
theorem highSmallOmega_card_mul_pow_le {q : ℝ} (hq : 1 ≤ q) (r N : ℕ)
    (P : Finset ℕ) (hP : ∀ p ∈ P, p.Prime) :
    (((Finset.Ioc 0 N).filter fun n ↦
        r ≤ ∑ p ∈ P, n.factorization p).card : ℝ) * q ^ r ≤
      (N : ℝ) * ∏ p ∈ P, finiteEulerFactor q r p := by
  classical
  let S := (Finset.Ioc 0 N).filter fun n ↦
    r ≤ ∑ p ∈ P, n.factorization p
  have hpoint : ∀ n ∈ S, q ^ r ≤ finitePrimeWeight q r P n := by
    intro n hn
    have hnmem := Finset.mem_filter.mp hn
    have hnIoc := Finset.mem_Ioc.mp hnmem.1
    have hn0 : n ≠ 0 := Nat.ne_of_gt hnIoc.1
    have hmin : r ≤ ∑ p ∈ P, min (n.factorization p) r :=
      le_sum_min_of_le_sum P (fun p ↦ n.factorization p) hnmem.2
    rw [finitePrimeWeight_eq_pow_sum_min hP hn0]
    gcongr
    exact hq
  calc
    (S.card : ℝ) * q ^ r = ∑ n ∈ S, q ^ r := by simp
    _ ≤ ∑ n ∈ S, finitePrimeWeight q r P n := by
      apply Finset.sum_le_sum
      exact hpoint
    _ ≤ ∑ n ∈ Finset.Ioc 0 N, finitePrimeWeight q r P n := by
      apply Finset.sum_le_sum_of_subset_of_nonneg (Finset.filter_subset _ _)
      intro n hn hnot
      exact finitePrimeWeight_nonneg hq r P n
    _ ≤ (N : ℝ) * ∏ p ∈ P, finiteEulerFactor q r p :=
      finitePrimeMoment_le hq r N P hP

theorem finiteEulerFactor_le {q : ℝ} (hq : 1 ≤ q) (r : ℕ) {p : ℕ}
    (hqp : q < p) :
    finiteEulerFactor q r p ≤ 1 + (q - 1) / ((p : ℝ) - q) := by
  have hp0 : (0 : ℝ) < p := lt_of_le_of_lt (zero_le_one.trans hq) hqp
  have hx0 : 0 ≤ q / (p : ℝ) := div_nonneg (zero_le_one.trans hq) hp0.le
  have hx1 : q / (p : ℝ) < 1 := (div_lt_one hp0).mpr hqp
  have hgeom :
      ∑ j ∈ Finset.range r, (q / (p : ℝ)) ^ j ≤ (1 - q / (p : ℝ))⁻¹ :=
    calc
      (∑ j ∈ Finset.range r, (q / (p : ℝ)) ^ j) =
          ∑ j ∈ Finset.Ico 0 r, (q / (p : ℝ)) ^ j := by
            rw [Finset.range_eq_Ico]
      _ ≤ (q / (p : ℝ)) ^ 0 / (1 - q / (p : ℝ)) :=
        geom_sum_Ico_le_of_lt_one hx0 hx1
      _ = (1 - q / (p : ℝ))⁻¹ := by simp [div_eq_mul_inv]
  have hsum :
      ∑ j ∈ Finset.range r, q ^ j / (p : ℝ) ^ (j + 1) ≤
        1 / ((p : ℝ) - q) := by
    calc
      (∑ j ∈ Finset.range r, q ^ j / (p : ℝ) ^ (j + 1)) =
          (1 / (p : ℝ)) * ∑ j ∈ Finset.range r, (q / (p : ℝ)) ^ j := by
            rw [Finset.mul_sum]
            apply Finset.sum_congr rfl
            intro j hj
            rw [div_pow]
            field_simp
            simp [pow_succ, mul_comm]
      _ ≤ (1 / (p : ℝ)) * (1 - q / (p : ℝ))⁻¹ := by
            gcongr
      _ = 1 / ((p : ℝ) - q) := by field_simp
  unfold finiteEulerFactor
  simpa [add_comm] using
    add_le_add_left (mul_le_mul_of_nonneg_left hsum (sub_nonneg.mpr hq)) 1

theorem finiteEulerProduct_le_exp {q : ℝ} (hq : 1 ≤ q) (r : ℕ) (P : Finset ℕ)
    (hqp : ∀ p ∈ P, q < p) :
    (∏ p ∈ P, finiteEulerFactor q r p) ≤
      Real.exp ((q - 1) * ∑ p ∈ P, 1 / ((p : ℝ) - q)) := by
  calc
    (∏ p ∈ P, finiteEulerFactor q r p) ≤
        ∏ p ∈ P, Real.exp ((q - 1) / ((p : ℝ) - q)) := by
          apply Finset.prod_le_prod
          · intro p hp
            exact finiteEulerFactor_nonneg hq r p
          · intro p hp
            calc
              finiteEulerFactor q r p ≤ 1 + (q - 1) / ((p : ℝ) - q) :=
                finiteEulerFactor_le hq r (hqp p hp)
              _ ≤ Real.exp ((q - 1) / ((p : ℝ) - q)) :=
                by simpa [add_comm] using Real.add_one_le_exp ((q - 1) / ((p : ℝ) - q))
    _ = Real.exp ((q - 1) * ∑ p ∈ P, 1 / ((p : ℝ) - q)) := by
      rw [← Real.exp_sum]
      congr 1
      rw [Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro p hp
      ring

end Erdos872.A3

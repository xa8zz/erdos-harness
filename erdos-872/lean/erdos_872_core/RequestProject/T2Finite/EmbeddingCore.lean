import Mathlib

open Finset

namespace RequestProject.T2Finite

/-- Arithmetic data for one residual T2 target `t = a * c * b`, where `a,c` are small primes and
`b` is the unique large prime above the cutoff `Y`. -/
structure ResidualTarget (Y : ℕ) where
  a : ℕ
  c : ℕ
  b : ℕ
  a_prime : Nat.Prime a
  c_prime : Nat.Prime c
  b_prime : Nat.Prime b
  a_lt_c : a < c
  c_le_Y : c ≤ Y
  Y_lt_b : Y < b

namespace ResidualTarget

variable {Y : ℕ} (t : ResidualTarget Y)

/-- The already-accounted-for small divisors of a residual target. -/
def smallDivisors : Finset ℕ := {1, t.a, t.c, t.a * t.c}

/-- The three blocker slots attached to a residual target. -/
def slots : Finset ℕ := insert t.b (insert (t.a * t.b) ({t.c * t.b} : Finset ℕ))

/-- The target value itself. -/
def value : ℕ := t.a * t.c * t.b

/-- The local harmful-move set for one residual target: the three blocker slots together with the
target itself. -/
def harmfulMoves : Finset ℕ := insert t.value t.slots

lemma value_pos : 0 < t.value := by
  unfold value
  exact Nat.mul_pos (Nat.mul_pos t.a_prime.pos t.c_prime.pos) t.b_prime.pos

lemma a_ne_one : t.a ≠ 1 := t.a_prime.ne_one

lemma c_ne_one : t.c ≠ 1 := t.c_prime.ne_one

lemma b_ne_one : t.b ≠ 1 := t.b_prime.ne_one

lemma a_ne_b : t.a ≠ t.b := by
  exact ne_of_lt <| lt_trans t.a_lt_c (lt_of_le_of_lt t.c_le_Y t.Y_lt_b)

lemma a_ne_c : t.a ≠ t.c := ne_of_lt t.a_lt_c

lemma c_ne_b : t.c ≠ t.b := by
  exact ne_of_lt <| lt_of_le_of_lt t.c_le_Y t.Y_lt_b

lemma b_ne_ac : t.b ≠ t.a * t.c := by
  intro h
  have hdiv : t.b ∣ t.a * t.c := by
    exact h ▸ dvd_rfl
  rcases (t.b_prime.dvd_mul.mp hdiv) with hba | hbc
  · rcases (Nat.dvd_prime t.a_prime).mp hba with h1 | h2
    · exact t.b_ne_one h1
    · exact t.a_ne_b h2.symm
  · rcases (Nat.dvd_prime t.c_prime).mp hbc with h1 | h2
    · exact t.b_ne_one h1
    · exact t.c_ne_b h2.symm

lemma a_ne_ac : t.a ≠ t.a * t.c := by
  intro h
  have hc1 : 1 = t.c := by
    apply Nat.eq_of_mul_eq_mul_left t.a_prime.pos
    simpa [Nat.mul_one] using h
  exact t.c_ne_one hc1.symm

lemma c_ne_ac : t.c ≠ t.a * t.c := by
  intro h
  have ha1 : 1 = t.a := by
    apply Nat.eq_of_mul_eq_mul_right t.c_prime.pos
    simpa [Nat.mul_one, Nat.mul_comm] using h
  exact t.a_ne_one ha1.symm

lemma ab_ne_b : t.a * t.b ≠ t.b := by
  intro h
  have hbpos : 0 < t.b := t.b_prime.pos
  have haeq : t.a = 1 := by
    apply Nat.mul_right_cancel hbpos
    simpa using h
  exact t.a_ne_one haeq

lemma cb_ne_b : t.c * t.b ≠ t.b := by
  intro h
  have hbpos : 0 < t.b := t.b_prime.pos
  have hceq : t.c = 1 := by
    apply Nat.mul_right_cancel hbpos
    simpa using h
  exact t.c_ne_one hceq

lemma ab_ne_cb : t.a * t.b ≠ t.c * t.b := by
  intro h
  have hbpos : 0 < t.b := t.b_prime.pos
  have hac : t.a = t.c := by
    apply Nat.mul_right_cancel hbpos
    simpa using h
  exact (ne_of_lt t.a_lt_c) hac

lemma ab_ne_one : t.a * t.b ≠ 1 := by
  intro h
  have ha1 : t.a = 1 := by
    apply Nat.eq_one_of_dvd_one
    rw [← h]
    exact dvd_mul_right t.a t.b
  exact t.a_ne_one ha1

lemma ab_ne_a : t.a * t.b ≠ t.a := by
  intro h
  have hb1 : t.b = 1 := by
    apply Nat.eq_of_mul_eq_mul_left t.a_prime.pos
    simpa [Nat.mul_one] using h
  exact t.b_ne_one hb1

lemma ab_ne_c : t.a * t.b ≠ t.c := by
  intro h
  have hdiv : t.a ∣ t.c := by
    rw [← h]
    exact dvd_mul_right t.a t.b
  rcases (Nat.dvd_prime t.c_prime).mp hdiv with h1 | h2
  · exact t.a_ne_one h1
  · exact t.a_ne_c h2

lemma ab_ne_ac : t.a * t.b ≠ t.a * t.c := by
  intro h
  have hbc : t.b = t.c := by
    apply Nat.eq_of_mul_eq_mul_left t.a_prime.pos
    simpa [Nat.mul_assoc] using h
  exact t.c_ne_b hbc.symm

lemma cb_ne_one : t.c * t.b ≠ 1 := by
  intro h
  have hc1 : t.c = 1 := by
    apply Nat.eq_one_of_dvd_one
    rw [← h]
    exact dvd_mul_right t.c t.b
  exact t.c_ne_one hc1

lemma cb_ne_a : t.c * t.b ≠ t.a := by
  intro h
  have hdiv : t.c ∣ t.a := by
    rw [← h]
    exact dvd_mul_right t.c t.b
  rcases (Nat.dvd_prime t.a_prime).mp hdiv with h1 | h2
  · exact t.c_ne_one h1
  · exact t.a_ne_c h2.symm

lemma cb_ne_c : t.c * t.b ≠ t.c := by
  intro h
  have hb1 : t.b = 1 := by
    apply Nat.eq_of_mul_eq_mul_left t.c_prime.pos
    simpa [Nat.mul_one] using h
  exact t.b_ne_one hb1

lemma cb_ne_ac : t.c * t.b ≠ t.a * t.c := by
  intro h
  have hba : t.b = t.a := by
    apply Nat.eq_of_mul_eq_mul_right t.c_prime.pos
    simpa [Nat.mul_comm] using h
  exact t.a_ne_b hba.symm

lemma b_mem_slots : t.b ∈ t.slots := by
  simp [slots]

lemma ab_mem_slots : t.a * t.b ∈ t.slots := by
  simp [slots]

lemma cb_mem_slots : t.c * t.b ∈ t.slots := by
  simp [slots]

lemma one_mem_smallDivisors : 1 ∈ t.smallDivisors := by
  simp [smallDivisors]

lemma a_mem_smallDivisors : t.a ∈ t.smallDivisors := by
  simp [smallDivisors]

lemma c_mem_smallDivisors : t.c ∈ t.smallDivisors := by
  simp [smallDivisors]

lemma ac_mem_smallDivisors : t.a * t.c ∈ t.smallDivisors := by
  simp [smallDivisors]

lemma smallDivisors_card_four : t.smallDivisors.card = 4 := by
  rw [Finset.card_eq_four]
  refine ⟨1, t.a, t.c, t.a * t.c, ?_, ?_, ?_, ?_, ?_, ?_, ?_⟩
  · exact t.a_ne_one.symm
  · exact t.c_ne_one.symm
  · intro h
    have ha1 : t.a = 1 := by
      apply Nat.eq_one_of_dvd_one
      rw [h]
      exact dvd_mul_right t.a t.c
    exact t.a_ne_one ha1
  · exact t.a_ne_c
  · exact t.a_ne_ac
  · exact t.c_ne_ac
  · ext x
    simp [smallDivisors]

lemma smallDivisors_subset_divisors_ac : t.smallDivisors ⊆ (t.a * t.c).divisors := by
  intro x hx
  have hac0 : t.a * t.c ≠ 0 := Nat.mul_ne_zero t.a_prime.ne_zero t.c_prime.ne_zero
  simp [smallDivisors] at hx
  rcases hx with rfl | rfl | rfl | rfl
  · exact Nat.mem_divisors.mpr ⟨one_dvd _, hac0⟩
  · exact Nat.mem_divisors.mpr ⟨dvd_mul_of_dvd_left dvd_rfl _, hac0⟩
  · exact Nat.mem_divisors.mpr ⟨dvd_mul_of_dvd_right dvd_rfl _, hac0⟩
  · exact Nat.mem_divisors.mpr ⟨dvd_rfl, hac0⟩

lemma smallDivisors_eq_divisors_ac : t.smallDivisors = (t.a * t.c).divisors := by
  apply Finset.eq_of_subset_of_card_le t.smallDivisors_subset_divisors_ac
  have hcop : t.a.Coprime t.c := (Nat.coprime_primes t.a_prime t.c_prime).2 t.a_ne_c
  have ha_card : t.a.divisors.card = 2 := by
    simpa using congrArg Finset.card (Nat.divisors_prime_pow t.a_prime 1)
  have hc_card : t.c.divisors.card = 2 := by
    simpa using congrArg Finset.card (Nat.divisors_prime_pow t.c_prime 1)
  have hac_card : (t.a * t.c).divisors.card = 4 := by
    simpa [ha_card, hc_card] using Nat.Coprime.card_divisors_mul hcop
  simpa [t.smallDivisors_card_four] using le_of_eq hac_card

lemma slots_card_three : t.slots.card = 3 := by
  classical
  rw [Finset.card_eq_three]
  refine ⟨t.b, t.a * t.b, t.c * t.b, ?_, ?_, ?_, rfl⟩
  · exact ne_comm.mp t.ab_ne_b
  · exact ne_comm.mp t.cb_ne_b
  · exact t.ab_ne_cb

lemma ab_not_prime : ¬ Nat.Prime (t.a * t.b) := by
  exact Nat.not_prime_mul t.a_ne_one t.b_ne_one

lemma cb_not_prime : ¬ Nat.Prime (t.c * t.b) := by
  exact Nat.not_prime_mul t.c_ne_one t.b_ne_one

lemma prime_of_mem_slots {x : ℕ} (hx : x ∈ t.slots) (hprime : Nat.Prime x) : x = t.b := by
  classical
  simp [slots] at hx
  rcases hx with rfl | rfl | rfl
  · rfl
  · exact False.elim (t.ab_not_prime hprime)
  · exact False.elim (t.cb_not_prime hprime)

lemma b_unique_prime_slot {x : ℕ} :
    x ∈ t.slots ∧ Nat.Prime x ↔ x = t.b := by
  constructor
  · rintro ⟨hx, hprime⟩
    exact t.prime_of_mem_slots hx hprime
  · intro hx
    subst hx
    exact ⟨t.b_mem_slots, t.b_prime⟩

lemma b_not_mem_smallDivisors : t.b ∉ t.smallDivisors := by
  intro hb
  unfold smallDivisors at hb
  repeat rw [Finset.mem_insert] at hb
  rw [Finset.mem_singleton] at hb
  rcases hb with h1 | ha | hc | hac
  · exact t.b_ne_one h1
  · exact t.a_ne_b ha.symm
  · exact t.c_ne_b hc.symm
  · exact t.b_ne_ac hac

lemma ab_not_mem_smallDivisors : t.a * t.b ∉ t.smallDivisors := by
  intro hab
  unfold smallDivisors at hab
  repeat rw [Finset.mem_insert] at hab
  rw [Finset.mem_singleton] at hab
  rcases hab with h1 | ha | hc | hac
  · exact t.ab_ne_one h1
  · exact t.ab_ne_a ha
  · exact t.ab_ne_c hc
  · exact t.ab_ne_ac hac

lemma cb_not_mem_smallDivisors : t.c * t.b ∉ t.smallDivisors := by
  intro hcb
  unfold smallDivisors at hcb
  repeat rw [Finset.mem_insert] at hcb
  rw [Finset.mem_singleton] at hcb
  rcases hcb with h1 | ha | hc | hac
  · exact t.cb_ne_one h1
  · exact t.cb_ne_a ha
  · exact t.cb_ne_c hc
  · exact t.cb_ne_ac hac

lemma b_dvd_value : t.b ∣ t.value := by
  refine ⟨t.a * t.c, ?_⟩
  simp [value, Nat.mul_left_comm, Nat.mul_comm]

lemma ab_dvd_value : t.a * t.b ∣ t.value := by
  refine ⟨t.c, ?_⟩
  simp [value, Nat.mul_left_comm, Nat.mul_comm]

lemma cb_dvd_value : t.c * t.b ∣ t.value := by
  refine ⟨t.a, ?_⟩
  simp [value, Nat.mul_left_comm, Nat.mul_comm]

lemma value_ne_one : t.value ≠ 1 := by
  intro h
  have ha1 : t.a = 1 := by
    apply Nat.eq_one_of_dvd_one
    rw [← h]
    exact dvd_mul_of_dvd_left (dvd_mul_right t.a t.c) t.b
  exact t.a_ne_one ha1

lemma value_ne_a : t.value ≠ t.a := by
  intro h
  have hcb1 : t.c * t.b = 1 := by
    apply Nat.eq_of_mul_eq_mul_left t.a_prime.pos
    simpa [value, Nat.mul_assoc, Nat.mul_left_comm, Nat.mul_comm] using h
  have hc1 : t.c = 1 := by
    apply Nat.eq_one_of_dvd_one
    rw [← hcb1]
    exact dvd_mul_right t.c t.b
  exact t.c_ne_one hc1

lemma value_ne_c : t.value ≠ t.c := by
  intro h
  have hab1 : t.a * t.b = 1 := by
    apply Nat.eq_of_mul_eq_mul_left t.c_prime.pos
    simpa [value, Nat.mul_assoc, Nat.mul_left_comm, Nat.mul_comm] using h
  have ha1 : t.a = 1 := by
    apply Nat.eq_one_of_dvd_one
    rw [← hab1]
    exact dvd_mul_right t.a t.b
  exact t.a_ne_one ha1

lemma value_ne_ac : t.value ≠ t.a * t.c := by
  intro h
  have hb1 : t.b = 1 := by
    apply Nat.eq_of_mul_eq_mul_left (Nat.mul_pos t.a_prime.pos t.c_prime.pos)
    simpa [value, Nat.mul_assoc, Nat.mul_left_comm, Nat.mul_comm] using h
  exact t.b_ne_one hb1

lemma value_not_mem_smallDivisors : t.value ∉ t.smallDivisors := by
  intro hv
  simp [smallDivisors] at hv
  rcases hv with h1 | ha | hc | hac
  · exact t.value_ne_one h1
  · exact t.value_ne_a ha
  · exact t.value_ne_c hc
  · exact t.value_ne_ac hac

lemma value_ne_b : t.value ≠ t.b := by
  intro h
  have hac1 : t.a * t.c = 1 := by
    apply Nat.eq_of_mul_eq_mul_right t.b_prime.pos
    simpa [value, Nat.mul_assoc, Nat.mul_left_comm, Nat.mul_comm] using h
  have ha1 : t.a = 1 := by
    apply Nat.eq_one_of_dvd_one
    rw [← hac1]
    exact dvd_mul_right t.a t.c
  exact t.a_ne_one ha1

lemma value_ne_ab : t.value ≠ t.a * t.b := by
  intro h
  have hcb1 : t.c = 1 := by
    apply Nat.eq_of_mul_eq_mul_right (Nat.mul_pos t.a_prime.pos t.b_prime.pos)
    simpa [value, Nat.mul_assoc, Nat.mul_left_comm, Nat.mul_comm] using h
  exact t.c_ne_one hcb1

lemma value_ne_cb : t.value ≠ t.c * t.b := by
  intro h
  have ha1 : t.a = 1 := by
    apply Nat.eq_of_mul_eq_mul_right (Nat.mul_pos t.c_prime.pos t.b_prime.pos)
    simpa [value, Nat.mul_assoc, Nat.mul_left_comm, Nat.mul_comm] using h
  exact t.a_ne_one ha1

lemma value_not_mem_slots : t.value ∉ t.slots := by
  intro hv
  simp [slots] at hv
  rcases hv with hb | hab | hcb
  · exact t.value_ne_b hb
  · exact t.value_ne_ab hab
  · exact t.value_ne_cb hcb

lemma harmfulMoves_card_four : t.harmfulMoves.card = 4 := by
  simp [harmfulMoves, t.value_not_mem_slots, t.slots_card_three]

lemma dvd_value_mem_smallDivisors_or_b_mul_smallDivisor {m : ℕ} (hdiv : m ∣ t.value) :
    m ∈ t.smallDivisors ∨ ∃ d, d ∈ t.smallDivisors ∧ m = t.b * d := by
  by_cases hbd : t.b ∣ m
  · rcases hbd with ⟨d, rfl⟩
    right
    refine ⟨d, ?_, rfl⟩
    have hd_ac : d ∣ t.a * t.c := by
      rcases hdiv with ⟨k, hk⟩
      refine ⟨k, ?_⟩
      have hmul : t.b * (t.a * t.c) = t.b * (d * k) := by
        calc
          t.b * (t.a * t.c) = t.value := by
            simp [value, Nat.mul_left_comm, Nat.mul_comm]
          _ = (t.b * d) * k := hk
          _ = t.b * (d * k) := by ac_rfl
      exact Nat.eq_of_mul_eq_mul_left t.b_prime.pos hmul
    have hd_mem : d ∈ (t.a * t.c).divisors := by
      exact Nat.mem_divisors.mpr ⟨hd_ac, Nat.mul_ne_zero t.a_prime.ne_zero t.c_prime.ne_zero⟩
    simpa [t.smallDivisors_eq_divisors_ac] using hd_mem
  · left
    have hcop : m.Coprime t.b := by
      simpa [Nat.coprime_comm] using (t.b_prime.coprime_iff_not_dvd).2 hbd
    have hm_ac : m ∣ t.a * t.c := by
      have hm_val : m ∣ (t.a * t.c) * t.b := by
        simpa [value, Nat.mul_assoc, Nat.mul_left_comm, Nat.mul_comm] using hdiv
      exact hcop.dvd_of_dvd_mul_right hm_val
    have hm_mem : m ∈ (t.a * t.c).divisors := by
      exact Nat.mem_divisors.mpr ⟨hm_ac, Nat.mul_ne_zero t.a_prime.ne_zero t.c_prime.ne_zero⟩
    simpa [t.smallDivisors_eq_divisors_ac] using hm_mem

lemma mem_slots_or_eq_value_of_dvd_value_not_small
    {m : ℕ} (hdiv : m ∣ t.value)
    (h1 : m ≠ 1) (ha : m ≠ t.a) (hc : m ≠ t.c) (hac : m ≠ t.a * t.c) :
    m ∈ t.slots ∨ m = t.value := by
  rcases t.dvd_value_mem_smallDivisors_or_b_mul_smallDivisor hdiv with hsmall | ⟨d, hdsmall, rfl⟩
  · simp [smallDivisors] at hsmall
    rcases hsmall with rfl | rfl | rfl | rfl
    · exact False.elim (h1 rfl)
    · exact False.elim (ha rfl)
    · exact False.elim (hc rfl)
    · exact False.elim (hac rfl)
  · simp [smallDivisors] at hdsmall
    rcases hdsmall with rfl | rfl | rfl | rfl
    · left
      simp [slots]
    · left
      simp [slots, Nat.mul_comm]
    · left
      simp [slots, Nat.mul_comm]
    · right
      simp [value, Nat.mul_left_comm, Nat.mul_comm]

lemma mem_harmfulMoves_iff {m : ℕ} :
    m ∈ t.harmfulMoves ↔ m ∣ t.value ∧ m ∉ t.smallDivisors := by
  constructor
  · intro hm
    rw [harmfulMoves] at hm
    rcases Finset.mem_insert.mp hm with rfl | hslot
    · exact ⟨dvd_rfl, t.value_not_mem_smallDivisors⟩
    · simp [slots] at hslot
      rcases hslot with rfl | rfl | rfl
      · exact ⟨t.b_dvd_value, t.b_not_mem_smallDivisors⟩
      · exact ⟨t.ab_dvd_value, t.ab_not_mem_smallDivisors⟩
      · exact ⟨t.cb_dvd_value, t.cb_not_mem_smallDivisors⟩
  · rintro ⟨hdiv, hnotsmall⟩
    have h1 : m ≠ 1 := by
      intro hm
      apply hnotsmall
      simp [smallDivisors, hm]
    have ha : m ≠ t.a := by
      intro hm
      apply hnotsmall
      simp [smallDivisors, hm]
    have hc : m ≠ t.c := by
      intro hm
      apply hnotsmall
      simp [smallDivisors, hm]
    have hac : m ≠ t.a * t.c := by
      intro hm
      apply hnotsmall
      simp [smallDivisors, hm]
    rcases mem_slots_or_eq_value_of_dvd_value_not_small (t := t) hdiv h1 ha hc hac with hslot | hval
    · exact Finset.mem_insert.mpr (Or.inr hslot)
    · exact Finset.mem_insert.mpr (Or.inl hval)

lemma a_ne_other_b {u : ResidualTarget Y} : t.a ≠ u.b := by
  exact ne_of_lt <| lt_trans t.a_lt_c (lt_of_le_of_lt t.c_le_Y u.Y_lt_b)

lemma c_ne_other_b {u : ResidualTarget Y} : t.c ≠ u.b := by
  exact ne_of_lt <| lt_of_le_of_lt t.c_le_Y u.Y_lt_b

lemma eq_b_of_b_dvd_value {u : ResidualTarget Y} (hdiv : t.b ∣ u.value) : t.b = u.b := by
  have hdiv' : t.b ∣ (u.a * u.c) * u.b := by
    simpa [ResidualTarget.value, Nat.mul_assoc, Nat.mul_left_comm, Nat.mul_comm] using hdiv
  rcases t.b_prime.dvd_mul.mp hdiv' with hac | hub
  · rcases t.b_prime.dvd_mul.mp hac with hua | huc
    · rcases (Nat.dvd_prime u.a_prime).mp hua with h1 | h2
      · exact False.elim (t.b_ne_one h1)
      · exact False.elim ((ne_of_lt <| lt_trans u.a_lt_c (lt_of_le_of_lt u.c_le_Y t.Y_lt_b)) h2.symm)
    · rcases (Nat.dvd_prime u.c_prime).mp huc with h1 | h2
      · exact False.elim (t.b_ne_one h1)
      · exact False.elim ((ne_of_lt <| lt_of_le_of_lt u.c_le_Y t.Y_lt_b) h2.symm)
  · rcases (Nat.dvd_prime u.b_prime).mp hub with h1 | h2
    · exact False.elim (t.b_ne_one h1)
    · exact h2

lemma eq_b_and_a_eq_or_eq_of_ab_dvd_value {u : ResidualTarget Y}
    (hdiv : t.a * t.b ∣ u.value) : t.b = u.b ∧ (t.a = u.a ∨ t.a = u.c) := by
  have hbdab : t.b ∣ t.a * t.b := by
    refine ⟨t.a, ?_⟩
    ac_rfl
  have hbd : t.b ∣ u.value := dvd_trans hbdab hdiv
  have hbeq : t.b = u.b := t.eq_b_of_b_dvd_value (u := u) hbd
  have hadab : t.a ∣ t.a * t.b := by
    refine ⟨t.b, ?_⟩
    ac_rfl
  have hadiv_val : t.a ∣ u.value := dvd_trans hadab hdiv
  have hcop : t.a.Coprime u.b := (Nat.coprime_primes t.a_prime u.b_prime).2 t.a_ne_other_b
  have hadiv_ac : t.a ∣ u.a * u.c := by
    have : t.a ∣ (u.a * u.c) * u.b := by
      simpa [ResidualTarget.value, Nat.mul_assoc, Nat.mul_left_comm, Nat.mul_comm] using hadiv_val
    exact hcop.dvd_of_dvd_mul_right this
  rcases t.a_prime.dvd_mul.mp hadiv_ac with hua | huc
  · rcases (Nat.dvd_prime u.a_prime).mp hua with h1 | h2
    · exact False.elim (t.a_ne_one h1)
    · exact ⟨hbeq, Or.inl h2⟩
  · rcases (Nat.dvd_prime u.c_prime).mp huc with h1 | h2
    · exact False.elim (t.a_ne_one h1)
    · exact ⟨hbeq, Or.inr h2⟩

lemma eq_b_and_c_eq_or_eq_of_cb_dvd_value {u : ResidualTarget Y}
    (hdiv : t.c * t.b ∣ u.value) : t.b = u.b ∧ (t.c = u.a ∨ t.c = u.c) := by
  have hbdcb : t.b ∣ t.c * t.b := by
    refine ⟨t.c, ?_⟩
    ac_rfl
  have hbd : t.b ∣ u.value := dvd_trans hbdcb hdiv
  have hbeq : t.b = u.b := t.eq_b_of_b_dvd_value (u := u) hbd
  have hcdcb : t.c ∣ t.c * t.b := by
    refine ⟨t.b, ?_⟩
    ac_rfl
  have hcdiv_val : t.c ∣ u.value := dvd_trans hcdcb hdiv
  have hcop : t.c.Coprime u.b := (Nat.coprime_primes t.c_prime u.b_prime).2 t.c_ne_other_b
  have hcdiv_ac : t.c ∣ u.a * u.c := by
    have : t.c ∣ (u.a * u.c) * u.b := by
      simpa [ResidualTarget.value, Nat.mul_assoc, Nat.mul_left_comm, Nat.mul_comm] using hcdiv_val
    exact hcop.dvd_of_dvd_mul_right this
  rcases t.c_prime.dvd_mul.mp hcdiv_ac with hua | huc
  · rcases (Nat.dvd_prime u.a_prime).mp hua with h1 | h2
    · exact False.elim (t.c_ne_one h1)
    · exact ⟨hbeq, Or.inl h2⟩
  · rcases (Nat.dvd_prime u.c_prime).mp huc with h1 | h2
    · exact False.elim (t.c_ne_one h1)
    · exact ⟨hbeq, Or.inr h2⟩

lemma b_dvd_value_iff_mem_slots {u : ResidualTarget Y} :
    t.b ∣ u.value ↔ t.b ∈ u.slots := by
  constructor
  · intro hdiv
    have hbeq : t.b = u.b := t.eq_b_of_b_dvd_value (u := u) hdiv
    simpa [hbeq] using u.b_mem_slots
  · intro hmem
    have hbeq : t.b = u.b := u.prime_of_mem_slots hmem t.b_prime
    simpa [hbeq] using u.b_dvd_value

lemma ab_dvd_value_iff_mem_slots {u : ResidualTarget Y} :
    t.a * t.b ∣ u.value ↔ t.a * t.b ∈ u.slots := by
  constructor
  · intro hdiv
    rcases t.eq_b_and_a_eq_or_eq_of_ab_dvd_value (u := u) hdiv with ⟨hbeq, haeq | haeq⟩
    · simpa [hbeq, haeq, Nat.mul_comm] using u.ab_mem_slots
    · simpa [hbeq, haeq, Nat.mul_comm] using u.cb_mem_slots
  · intro hmem
    simp [ResidualTarget.slots] at hmem
    rcases hmem with hb | hab | hcb
    · have hprime : Nat.Prime (t.a * t.b) := by simpa [hb] using u.b_prime
      exact False.elim (t.ab_not_prime hprime)
    · simpa [hab] using u.ab_dvd_value
    · simpa [hcb] using u.cb_dvd_value

lemma cb_dvd_value_iff_mem_slots {u : ResidualTarget Y} :
    t.c * t.b ∣ u.value ↔ t.c * t.b ∈ u.slots := by
  constructor
  · intro hdiv
    rcases t.eq_b_and_c_eq_or_eq_of_cb_dvd_value (u := u) hdiv with ⟨hbeq, hceq | hceq⟩
    · simpa [hbeq, hceq, Nat.mul_comm] using u.ab_mem_slots
    · simpa [hbeq, hceq, Nat.mul_comm] using u.cb_mem_slots
  · intro hmem
    simp [ResidualTarget.slots] at hmem
    rcases hmem with hb | hab | hcb
    · have hprime : Nat.Prime (t.c * t.b) := by simpa [hb] using u.b_prime
      exact False.elim (t.cb_not_prime hprime)
    · simpa [hab] using u.ab_dvd_value
    · simpa [hcb] using u.cb_dvd_value

lemma eq_of_value_eq {u : ResidualTarget Y} (hval : t.value = u.value) : t = u := by
  have habdiv : t.a * t.b ∣ u.value := by
    simpa [hval] using t.ab_dvd_value
  have hcbdiv : t.c * t.b ∣ u.value := by
    simpa [hval] using t.cb_dvd_value
  rcases t.eq_b_and_a_eq_or_eq_of_ab_dvd_value (u := u) habdiv with ⟨hb, ha | ha⟩
  · rcases t.eq_b_and_c_eq_or_eq_of_cb_dvd_value (u := u) hcbdiv with ⟨_, hc | hc⟩
    · exfalso
      exact t.a_ne_c (ha.trans hc.symm)
    · cases t with
      | mk a c b a_prime c_prime b_prime a_lt_c c_le_Y Y_lt_b =>
        cases u with
        | mk a' c' b' a_prime' c_prime' b_prime' a_lt_c' c_le_Y' Y_lt_b' =>
          simp at ha hc hb ⊢
          subst_vars
          exact ⟨rfl, rfl, rfl⟩
  · rcases t.eq_b_and_c_eq_or_eq_of_cb_dvd_value (u := u) hcbdiv with ⟨_, hc | hc⟩
    · have hcontra : u.c < u.a := by
        simpa [ha, hc] using t.a_lt_c
      exact False.elim (Nat.lt_asymm u.a_lt_c hcontra)
    · exfalso
      exact t.a_ne_c (ha.trans hc.symm)

end ResidualTarget

/-- If `m` divides `n`, is positive, and `n < 2m`, then `m = n`. -/
lemma eq_of_dvd_of_lt_two_mul {m n : ℕ}
    (hm : 0 < m) (hmn : m ≤ n) (hdiv : m ∣ n) (hlt : n < 2 * m) : m = n := by
  rcases hdiv with ⟨k, rfl⟩
  have hkpos : 0 < k := by
    by_contra hk
    have hk0 : k = 0 := Nat.eq_zero_of_not_pos hk
    have hm0 : m ≤ 0 := by simpa [hk0] using hmn
    omega
  have hklt2 : k < 2 := by
    by_contra hk
    have hkge2 : 2 ≤ k := Nat.not_lt.mp hk
    have hmul : 2 * m ≤ k * m := Nat.mul_le_mul_right m hkge2
    exact (not_le_of_gt hlt) (by simpa [Nat.mul_comm] using hmul)
  have hk1 : k = 1 := by omega
  simp [hk1]

/-- Distinct numbers in the upper half `(N/2, N]` cannot divide one another. This is the
arithmetical core behind modeling exact-target plays as score moves rather than new attacks. -/
lemma eq_of_dvd_of_mem_upperHalf {N m n : ℕ}
    (hm : 0 < m) (hmn : m ≤ n) (hnN : n ≤ N) (hhalf : N < 2 * m) (hdiv : m ∣ n) : m = n := by
  apply eq_of_dvd_of_lt_two_mul hm hmn hdiv
  exact lt_of_le_of_lt hnN hhalf

/-- Local legal-live-edge criterion for one residual target: if the already played numbers avoid
the accounted-for small divisors and the harmful-move set of `t`, then `t.value` is incomparable
with every played number. This isolates the exact local arithmetic content of the residual
comparison wrapper. -/
lemma value_legal_against_of_disjoint_smallDivisors_and_harmfulMoves
    {Y N : ℕ} (t : ResidualTarget Y) (A : Finset ℕ)
    (hhalf : N < 2 * t.value)
    (hApos : ∀ m ∈ A, 0 < m) (hAupper : ∀ m ∈ A, m ≤ N)
    (hsmall : Disjoint A t.smallDivisors)
    (hharm : Disjoint A t.harmfulMoves) :
    ∀ m ∈ A, ¬ m ∣ t.value ∧ ¬ t.value ∣ m := by
  classical
  have hsmall' : ∀ {a : ℕ}, a ∈ A → a ∈ t.smallDivisors → False := by
    intro a haA haSmall
    exact (Finset.disjoint_left.mp hsmall haA) haSmall
  have hharm' : ∀ {a : ℕ}, a ∈ A → a ∈ t.harmfulMoves → False := by
    intro a haA haHarm
    exact (Finset.disjoint_left.mp hharm haA) haHarm
  intro m hmA
  constructor
  · intro hdiv
    by_cases hmsmall : m ∈ t.smallDivisors
    · exact hsmall' hmA hmsmall
    · have hmharm : m ∈ t.harmfulMoves := (t.mem_harmfulMoves_iff (m := m)).mpr ⟨hdiv, hmsmall⟩
      exact hharm' hmA hmharm
  · intro hdiv
    have hmN : m ≤ N := hAupper m hmA
    have hmeq : t.value = m := eq_of_dvd_of_mem_upperHalf
      t.value_pos (Nat.le_of_dvd (hApos m hmA) hdiv) hmN hhalf hdiv
    have hvalmem : t.value ∈ t.harmfulMoves := by
      simp [ResidualTarget.harmfulMoves]
    have hmharm : m ∈ t.harmfulMoves := by
      simpa [hmeq] using hvalmem
    exact hharm' hmA hmharm

end RequestProject.T2Finite

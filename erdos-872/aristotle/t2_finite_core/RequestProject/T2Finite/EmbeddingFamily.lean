import RequestProject.T2Finite.EmbeddingCore

open Finset

noncomputable section

namespace RequestProject.T2Finite

namespace ResidualTarget

variable {Y : ℕ} (t u : ResidualTarget Y)

lemma b_mem_harmfulMoves_iff_mem_slots :
    t.b ∈ u.harmfulMoves ↔ t.b ∈ u.slots := by
  constructor
  · intro h
    have hdiv : t.b ∣ u.value := (u.mem_harmfulMoves_iff (m := t.b)).mp h |>.1
    exact (t.b_dvd_value_iff_mem_slots (u := u)).mp hdiv
  · intro h
    have hdiv : t.b ∣ u.value := (t.b_dvd_value_iff_mem_slots (u := u)).mpr h
    have hbeq : t.b = u.b := t.eq_b_of_b_dvd_value (u := u) hdiv
    exact (u.mem_harmfulMoves_iff (m := t.b)).mpr
      ⟨hdiv, by simpa [hbeq] using u.b_not_mem_smallDivisors⟩

lemma ab_mem_harmfulMoves_iff_mem_slots :
    t.a * t.b ∈ u.harmfulMoves ↔ t.a * t.b ∈ u.slots := by
  constructor
  · intro h
    have hdiv : t.a * t.b ∣ u.value := (u.mem_harmfulMoves_iff (m := t.a * t.b)).mp h |>.1
    exact (t.ab_dvd_value_iff_mem_slots (u := u)).mp hdiv
  · intro h
    have hdiv : t.a * t.b ∣ u.value := (t.ab_dvd_value_iff_mem_slots (u := u)).mpr h
    rcases t.eq_b_and_a_eq_or_eq_of_ab_dvd_value (u := u) hdiv with ⟨hbeq, haeq | haeq⟩
    · exact (u.mem_harmfulMoves_iff (m := t.a * t.b)).mpr
        ⟨hdiv, by simpa [haeq, hbeq, Nat.mul_comm] using u.ab_not_mem_smallDivisors⟩
    · exact (u.mem_harmfulMoves_iff (m := t.a * t.b)).mpr
        ⟨hdiv, by simpa [haeq, hbeq, Nat.mul_comm] using u.cb_not_mem_smallDivisors⟩

lemma cb_mem_harmfulMoves_iff_mem_slots :
    t.c * t.b ∈ u.harmfulMoves ↔ t.c * t.b ∈ u.slots := by
  constructor
  · intro h
    have hdiv : t.c * t.b ∣ u.value := (u.mem_harmfulMoves_iff (m := t.c * t.b)).mp h |>.1
    exact (t.cb_dvd_value_iff_mem_slots (u := u)).mp hdiv
  · intro h
    have hdiv : t.c * t.b ∣ u.value := (t.cb_dvd_value_iff_mem_slots (u := u)).mpr h
    rcases t.eq_b_and_c_eq_or_eq_of_cb_dvd_value (u := u) hdiv with ⟨hbeq, hceq | hceq⟩
    · exact (u.mem_harmfulMoves_iff (m := t.c * t.b)).mpr
        ⟨hdiv, by simpa [hceq, hbeq, Nat.mul_comm] using u.ab_not_mem_smallDivisors⟩
    · exact (u.mem_harmfulMoves_iff (m := t.c * t.b)).mpr
        ⟨hdiv, by simpa [hceq, hbeq, Nat.mul_comm] using u.cb_not_mem_smallDivisors⟩

end ResidualTarget

/-- Targets hit by a concrete move in the residual divisibility model. -/
def harmfulTargets {Y : ℕ} (T : Finset (ResidualTarget Y)) (m : ℕ) :
    Finset (ResidualTarget Y) :=
  T.filter fun t => m ∈ t.harmfulMoves

/-- Targets incident to a slot label in the slot-hypergraph model. -/
def slotIncidentTargets {Y : ℕ} (T : Finset (ResidualTarget Y)) (x : ℕ) :
    Finset (ResidualTarget Y) :=
  T.filter fun t => x ∈ t.slots

/-- A residual target family whose values all lie in the same upper half interval `(N/2, N]`. -/
def IsUpperHalfFamily {Y : ℕ} (N : ℕ) (T : Finset (ResidualTarget Y)) : Prop :=
  ∀ t ∈ T, t.value ≤ N ∧ N < 2 * t.value

namespace ResidualTarget

variable {Y : ℕ} (t : ResidualTarget Y) (T : Finset (ResidualTarget Y))

lemma harmfulTargets_eq_slotIncidentTargets_b :
    harmfulTargets T t.b = slotIncidentTargets T t.b := by
  ext u
  simp [harmfulTargets, slotIncidentTargets, b_mem_harmfulMoves_iff_mem_slots (t := t) (u := u)]

lemma harmfulTargets_eq_slotIncidentTargets_ab :
    harmfulTargets T (t.a * t.b) = slotIncidentTargets T (t.a * t.b) := by
  ext u
  simp [harmfulTargets, slotIncidentTargets,
    ab_mem_harmfulMoves_iff_mem_slots (t := t) (u := u)]

lemma harmfulTargets_eq_slotIncidentTargets_cb :
    harmfulTargets T (t.c * t.b) = slotIncidentTargets T (t.c * t.b) := by
  ext u
  simp [harmfulTargets, slotIncidentTargets,
    cb_mem_harmfulMoves_iff_mem_slots (t := t) (u := u)]

lemma mem_harmfulTargets_value_iff_eq_of_upperHalf
    {N : ℕ} {u : ResidualTarget Y}
    (hUpper : IsUpperHalfFamily N T) (ht : t ∈ T) :
    u ∈ harmfulTargets T t.value ↔ u = t := by
  constructor
  · intro hu
    have hu' : u ∈ T ∧ t.value ∈ u.harmfulMoves := by
      simpa [harmfulTargets] using hu
    have huT : u ∈ T := by
      exact hu'.1
    have hdiv : t.value ∣ u.value := by
      exact (u.mem_harmfulMoves_iff (m := t.value)).mp hu'.2 |>.1
    have htu : t.value ≤ u.value := Nat.le_of_dvd u.value_pos hdiv
    have huN : u.value ≤ N := (hUpper u huT).1
    have hthalf : N < 2 * t.value := (hUpper t ht).2
    have hvaleq : t.value = u.value := eq_of_dvd_of_mem_upperHalf
      t.value_pos htu huN hthalf hdiv
    exact (t.eq_of_value_eq (u := u) hvaleq).symm
  · intro hu
    subst hu
    simp [harmfulTargets, ResidualTarget.harmfulMoves, ht]

lemma harmfulTargets_eq_singleton_value_of_upperHalf
    {N : ℕ} (hUpper : IsUpperHalfFamily N T) (ht : t ∈ T) :
    harmfulTargets T t.value = {t} := by
  ext u
  simp [mem_harmfulTargets_value_iff_eq_of_upperHalf (t := t) (T := T) (u := u) hUpper ht]

end ResidualTarget

end RequestProject.T2Finite

import Mathlib

namespace Erdos872

/-- The quotients by the gcd are coprime. -/
theorem coneProjection_quotients_coprime
    {r t : ℕ} (hgcd : 0 < Nat.gcd r t) :
    Nat.Coprime (r / Nat.gcd r t) (t / Nat.gcd r t) := by
  exact Nat.coprime_div_gcd_div_gcd hgcd

/-- Manuscript (3.12): an external divisor projects to its gcd quotient. -/
theorem coneProjection_external
    {r t m : ℕ} (hgcd : 0 < Nat.gcd r t) :
    r ∣ t * m ↔ r / Nat.gcd r t ∣ m := by
  let g := Nat.gcd r t
  let q := r / g
  let s := t / g
  have hg : 0 < g := by simpa [g] using hgcd
  have hcop : Nat.Coprime q s := by
    simpa [q, s, g] using coneProjection_quotients_coprime hgcd
  have hr_eq : r = q * g := by
    simpa [q, g] using (Nat.div_mul_cancel (Nat.gcd_dvd_left r t)).symm
  have ht_eq : t = s * g := by
    simpa [s, g] using (Nat.div_mul_cancel (Nat.gcd_dvd_right r t)).symm
  change r ∣ t * m ↔ q ∣ m
  constructor
  · intro h
    rw [hr_eq, ht_eq] at h
    have hcancel : q ∣ s * m := by
      apply (Nat.mul_dvd_mul_iff_left hg).mp
      simpa [Nat.mul_assoc, Nat.mul_comm, Nat.mul_left_comm] using h
    exact hcop.dvd_of_dvd_mul_left hcancel
  · intro h
    rw [hr_eq, ht_eq]
    have hcancel : q ∣ s * m := dvd_mul_of_dvd_right h s
    have hlift := (Nat.mul_dvd_mul_iff_left hg).mpr hcancel
    simpa [Nat.mul_assoc, Nat.mul_comm, Nat.mul_left_comm] using hlift

/-- Manuscript (3.13): division by a positive cone tag preserves divisibility. -/
theorem coneProjection_internal
    {t m₁ m₂ : ℕ} (ht : 0 < t) :
    t * m₁ ∣ t * m₂ ↔ m₁ ∣ m₂ := by
  exact Nat.mul_dvd_mul_iff_left ht

end Erdos872

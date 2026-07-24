import Mathlib

namespace Erdos872

/-- The corrected local-opening count in manuscript §4.3. -/
theorem local_opening_count (b : ℕ) (hb : 1 ≤ b) :
    max (b + 1) 2 = b + 1 := by
  omega

/-- The opening-activated case of the local trace count. -/
theorem opening_activated_count {b k : ℕ} (hk : k ≤ b) :
    k + 1 ≤ b + 1 := by
  omega

/-- The later-activated case of the local trace count. -/
theorem later_activated_count {b : ℕ} (hb : 1 ≤ b) :
    2 ≤ b + 1 := by
  omega

/--
The algebraic core taking the drafting inequality (4.1) and disjointness of
activated and cleared roots to the halving estimate.
-/
theorem drafting_implies_halving
    {active cleared total slack : ℝ}
    (hdraft : active ≤ cleared + slack)
    (hdisjoint : cleared ≤ total - active) :
    active ≤ (total + slack) / 2 := by
  linarith

/--
The numerical passage from (4.1), (3.8), and (3.11) to manuscript (4.2),
with `(b+1) * scale` representing the unpaired-activation term.
-/
theorem manuscript_4_2
    {active cleared total N invA scale : ℝ} {b : ℕ}
    (hdraft : active ≤ cleared + ((b + 1 : ℕ) : ℝ) * scale)
    (hdisjoint : cleared ≤ total - active)
    (htotal : total ≤ N + N * invA) :
    active ≤
      (N + N * invA + ((b + 1 : ℕ) : ℝ) * scale) / 2 := by
  have hhalf := drafting_implies_halving hdraft hdisjoint
  linarith

end Erdos872

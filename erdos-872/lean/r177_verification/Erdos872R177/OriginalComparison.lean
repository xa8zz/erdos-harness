import Erdos872R177.GameKernel

namespace Erdos872R177

open Finset

/-- The original divisor-antichain board `{2, ..., n}`. -/
def originalBoard (n : ℕ) : Finset Vertex := Finset.Icc 2 n

/-- Remaining legal vertices after selecting `x` from a compressed live board. -/
def afterSelect (live : Finset Vertex) (x : Vertex) : Finset Vertex :=
  live.filter fun y ↦ ¬Comparable x y

/-- The full interval `[n]` is a divisibility downset. -/
theorem full_board_isDownset (n : ℕ) : IsDownset n (board n) := by
  constructor
  · exact fun _ hx ↦ hx
  · intro x hx y hy _
    exact hy

/-- The first legal original move always blocks the auxiliary vertex `1`. -/
theorem one_killed_by_first_move
    {n x : ℕ} (_hx : x ∈ originalBoard n) :
    1 ∉ afterSelect (board n) x := by
  simp only [afterSelect, mem_filter, board, mem_Icc, not_and]
  intro _
  simp [Comparable]

/--
After an original first move `x ≥ 2`, the positions obtained from `[n]` and
from `{2, ..., n}` agree exactly; the only extra point was `1`, now blocked.
-/
theorem after_first_move_boards_agree
    {n x : ℕ} (_hx : x ∈ originalBoard n) :
    afterSelect (board n) x = afterSelect (originalBoard n) x := by
  ext y
  by_cases hcomp : Comparable x y
  · simp [afterSelect, hcomp]
  · have hyne : y ≠ 1 := by
      intro hyeq
      subst y
      exact hcomp (Or.inr (one_dvd x))
    simp only [afterSelect, mem_filter, board, originalBoard, mem_Icc, hcomp,
      not_false_eq_true, and_true]
    constructor
    · rintro ⟨hy1, hyn⟩
      exact ⟨Nat.lt_of_le_of_ne hy1 (Ne.symm hyne), hyn⟩
    · rintro ⟨hy2, hyn⟩
      exact ⟨le_trans (by decide : 1 ≤ 2) hy2, hyn⟩

end Erdos872R177

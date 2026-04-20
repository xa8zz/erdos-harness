import Mathlib

noncomputable section

namespace RequestProject.Round15Bonferroni4

/-- The left cutoff associated to a counting profile `S` on the compact search interval `[a, b]`. -/
def cutoff (S : ℝ → ℕ) (a b : ℝ) (j : ℕ) : ℝ :=
  sInf {x : ℝ | x ∈ Set.Icc a b ∧ j ≤ S x}

/-- Any witness `x` with `j ≤ S x` bounds the cutoff from above. This is the abstract inversion
step behind the Round 15 comparison sequence `(b_j)`. -/
lemma cutoff_le_of_mem
    {S : ℝ → ℕ} {a b x : ℝ} {j : ℕ}
    (hax : a ≤ x)
    (hxb : x ≤ b)
    (hj : j ≤ S x) :
    cutoff S a b j ≤ x := by
  unfold cutoff
  refine csInf_le ?_ ?_
  · refine ⟨a, ?_⟩
    intro y hy
    exact hy.1.1
  · exact ⟨⟨hax, hxb⟩, hj⟩

/-- If a lower profile `C` is pointwise dominated by a counting profile `S`, then any point where
`C` has already reached level `j` is an upper bound for the `j`-cutoff of `S`. This is the exact
formal core of Step 4 in the Round 15 proof. -/
lemma cutoff_le_of_lowerProfile
    {S C : ℝ → ℕ} {a b x : ℝ} {j : ℕ}
    (hSC : ∀ y, C y ≤ S y)
    (hax : a ≤ x)
    (hxb : x ≤ b)
    (hj : j ≤ C x) :
    cutoff S a b j ≤ x := by
  exact cutoff_le_of_mem hax hxb (hj.trans (hSC x))

end RequestProject.Round15Bonferroni4

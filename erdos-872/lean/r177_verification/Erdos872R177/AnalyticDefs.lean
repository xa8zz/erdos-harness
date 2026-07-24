import Mathlib

namespace Erdos872

/-- The appendix convention `P⁻(1) = ∞` is represented by a separate `m = 1` case. -/
def Rough (z : ℝ) (m : ℕ) : Prop :=
  m = 1 ∨ (2 ≤ m ∧ z < (Nat.minFac m : ℝ))

/-- The positive integers at most the real cutoff `X` that are `z`-rough. -/
noncomputable def roughUpTo (X z : ℝ) : Finset ℕ := by
  classical
  exact (Finset.range (⌊X⌋₊ + 1)).filter fun m ↦ 1 ≤ m ∧ Rough z m

/--
`a` is `K`-dense when each prime factor in its increasing factor list is at
most `K` times the product of its predecessors. The condition is vacuous for
`a = 1`, as required by the appendix.
-/
def KDense (K : ℝ) (a : ℕ) : Prop :=
  ∀ i : Fin a.primeFactorsList.length,
    (a.primeFactorsList.get i : ℝ) ≤
      K * ((a.primeFactorsList.take i).prod : ℝ)

/-- The positive `K`-dense integers at most the real cutoff `X`. -/
noncomputable def denseUpTo (K X : ℝ) : Finset ℕ := by
  classical
  exact (Finset.range (⌊X⌋₊ + 1)).filter fun a ↦ 1 ≤ a ∧ KDense K a

/-- The absolute constant `c₀ = 1 / log 2` from Lemma 2.2. -/
noncomputable def c0 : ℝ := 1 / Real.log 2

/-- The absolute exponent `κ = c₀ log c₀ - c₀ + 1` from Lemma 2.2. -/
noncomputable def kappa : ℝ := c0 * Real.log c0 - c0 + 1

/-- The first `j` factors in `xs` satisfy the `K`-dense prefix inequalities. -/
def PrefixGood (K : ℝ) (xs : List ℕ) (j : ℕ) : Prop :=
  ∃ hj : j ≤ xs.length, ∀ i : Fin j,
    (xs.get ⟨i, i.isLt.trans_le hj⟩ : ℝ) ≤
      K * ((xs.take i).prod : ℝ)

/-- The maximal admissible initial-prime-factor block length `j_K(x)`. -/
noncomputable def jK (K : ℝ) (x : ℕ) : ℕ := by
  classical
  exact Nat.findGreatest (PrefixGood K x.primeFactorsList) x.primeFactorsList.length

/-- The initial `K`-dense factor block `a_K(x)`. -/
noncomputable def aK (K : ℝ) (x : ℕ) : ℕ :=
  (x.primeFactorsList.take (jK K x)).prod

/--
The exceptional set in Lemma 2.3. The vertex `1` is inserted explicitly, so
the definition never relies on assigning an appendix meaning to `a_K(1)`.
-/
noncomputable def exceptionalSet
    (K : ℝ) (A : ℕ) (delta gamma : ℝ) (N : ℕ) : Finset ℕ := by
  classical
  exact insert 1 <| (Finset.range (N + 1)).filter fun x ↦
    2 ≤ x ∧
      ((x : ℝ) ≤ delta * (N : ℝ) ∨
       aK K x ≤ A ∨
       (N : ℝ) ^ gamma < (aK K x : ℝ))

end Erdos872

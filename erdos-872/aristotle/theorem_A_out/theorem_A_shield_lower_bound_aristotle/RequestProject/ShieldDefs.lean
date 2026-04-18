import Mathlib

/-!
# Shield Lower Bound — Definitions

Formalization of the combinatorial setup from the paper
"A Polynomial Lower Bound on the Shield Antichain Weight".

Fix an integer `n ≥ 3`. We define:
- `shieldL n` — the lower set `{m : 2 ≤ m ≤ ⌊n/2⌋}`
- `shieldU n` — the upper set `{m : n/2 < m ≤ n}`
- `upperShadow n x` — the upper shadow `M(x) = {u ∈ U : x ∣ u}`
- `shadowWeight n x` — the shadow weight `w_n(x) = |M(x)| - 1`
- `shieldLP n P` — the surviving lower set `L(P) = {x ∈ L : x ∤ u for all u ∈ P}`
- `IsDivAntichain B` — `B` is an antichain under divisibility
- `shieldBeta n P` — the shield antichain weight `β(P)`
- `kStar c n` — the minimum shield size
-/

open scoped BigOperators
open Finset

noncomputable section

/-- The lower set L = {m : 2 ≤ m ≤ ⌊n/2⌋} -/
def shieldL (n : ℕ) : Finset ℕ := Finset.Icc 2 (n / 2)

/-- The upper set U = {m : n/2 < m ≤ n} -/
def shieldU (n : ℕ) : Finset ℕ := Finset.Ioc (n / 2) n

/-- The upper shadow M(x) = {u ∈ U : x ∣ u} -/
def upperShadow (n : ℕ) (x : ℕ) : Finset ℕ :=
  (shieldU n).filter (x ∣ ·)

/-- The shadow weight w_n(x) = |M(x)| - 1 -/
def shadowWeight (n : ℕ) (x : ℕ) : ℤ :=
  (upperShadow n x).card - 1

/-- L(P) = {x ∈ L : x ∤ u for every u ∈ P} -/
def shieldLP (n : ℕ) (P : Finset ℕ) : Finset ℕ :=
  (shieldL n).filter (fun x => ∀ u ∈ P, ¬(x ∣ u))

/-- A set B of natural numbers is an antichain under divisibility:
    no element properly divides another. -/
def IsDivAntichain (B : Finset ℕ) : Prop :=
  ∀ a ∈ B, ∀ b ∈ B, a ∣ b → a = b

instance IsDivAntichain.decidable (B : Finset ℕ) : Decidable (IsDivAntichain B) :=
  inferInstanceAs (Decidable (∀ a ∈ B, ∀ b ∈ B, a ∣ b → a = b))

/-- The divisibility antichains of a finset -/
def divAntichains (S : Finset ℕ) : Finset (Finset ℕ) :=
  S.powerset.filter IsDivAntichain

lemma empty_mem_divAntichains (S : Finset ℕ) : ∅ ∈ divAntichains S := by
  simp [divAntichains, IsDivAntichain]

lemma divAntichains_nonempty (S : Finset ℕ) : (divAntichains S).Nonempty :=
  ⟨∅, empty_mem_divAntichains S⟩

/-- β(P) = max over antichains B ⊆ L(P) of ∑_{x ∈ B} w_n(x).
    This is the shield antichain weight. -/
def shieldBeta (n : ℕ) (P : Finset ℕ) : ℤ :=
  (divAntichains (shieldLP n P)).sup' (divAntichains_nonempty _)
    (fun B => B.sum (shadowWeight n))

/-- k*_c(n) = inf{|P| : P ⊆ U, β(P) ≤ cn}.
    The minimum size of a "shield" set that reduces β below cn.
    Returns 0 if no such P exists. -/
def kStar (c : ℝ) (n : ℕ) : ℕ :=
  sInf {k : ℕ | ∃ P : Finset ℕ, P ⊆ shieldU n ∧ P.card = k ∧
    (shieldBeta n P : ℝ) ≤ c * ↑n}

end

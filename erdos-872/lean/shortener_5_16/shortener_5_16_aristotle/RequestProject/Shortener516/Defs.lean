/-
Copyright (c) 2025. All rights reserved.
Formalization of the divisibility-antichain saturation game from shortener_5_16.tex.
-/
import Mathlib

/-!
# Divisibility-Antichain Saturation Game: Definitions

We formalize a two-player game played on {2, 3, …, n}:
- **Prolonger** (maximizer) and **Shortener** (minimizer) alternate choosing integers
  into a shared set A ⊆ {2, …, n}.
- A must remain an antichain under divisibility (no element divides another).
- The game ends when A is a maximal antichain.
- Prolonger moves first.
- L(n) denotes the game value (final |A|) under optimal play.

## Main definitions

- `DivAntichainGame.IsDivAntichain` : divisibility-antichain predicate
- `DivAntichainGame.legalMoves` : set of legal moves from a given antichain
- `DivAntichainGame.gameValueAux` : fuel-based backward induction for game value
- `DivAntichainGame.L` : the game value L(n)
- `DivAntichainGame.oddPart` : the odd part of a natural number (n / 2^v₂(n))
- `DivAntichainGame.DFree` : predicate for D-free integers
- `DivAntichainGame.countOddDFree` : count of odd D-free integers in [1, n]
-/

open Finset Filter

set_option maxHeartbeats 800000

namespace DivAntichainGame

/-! ### Divisibility antichains -/

/-- A finset of natural numbers is a *divisibility antichain* if no element
    divides a distinct element. -/
def IsDivAntichain (A : Finset ℕ) : Prop :=
  ∀ a ∈ A, ∀ b ∈ A, a ∣ b → a = b

/-- Decidability of `IsDivAntichain`. -/
instance decidableIsDivAntichain (A : Finset ℕ) : Decidable (IsDivAntichain A) := by
  unfold IsDivAntichain; exact inferInstance

/-- The legal moves from antichain `A` in the game on `{2, …, n}`:
    integers `x ∈ {2, …, n} \ A` that are divisibility-incomparable
    with every element of `A`. -/
def legalMoves (n : ℕ) (A : Finset ℕ) : Finset ℕ :=
  (Finset.Icc 2 n \ A).filter fun x =>
    (∀ a ∈ A, ¬(a ∣ x)) ∧ (∀ a ∈ A, ¬(x ∣ a))

/-! ### Game value by backward induction -/

/-- Minimax game value computed by backward induction with fuel.
    `prolongerTurn = true` means it is Prolonger's (maximizer's) turn. -/
def gameValueAux (n : ℕ) (A : Finset ℕ) (prolongerTurn : Bool) : ℕ → ℕ
  | 0 => A.card
  | fuel + 1 =>
    let moves := legalMoves n A
    if h : moves.Nonempty then
      let values := moves.image (fun m => gameValueAux n (insert m A) (!prolongerTurn) fuel)
      if prolongerTurn then values.max' (h.image _)
      else values.min' (h.image _)
    else A.card

/-- `L(n)`: the game value of the divisibility-antichain game on `{2, …, n}`,
    starting from the empty antichain with Prolonger to move.
    We use fuel `n` which is more than enough (the game lasts at most `n - 1` steps). -/
def L (n : ℕ) : ℕ := gameValueAux n ∅ true n

/-! ### Odd part and D-free integers -/

/-- The odd part of `n`: divide out all factors of 2.
    Equals `n / 2^(v₂(n))` where `v₂` is the 2-adic valuation. -/
def oddPart (n : ℕ) : ℕ := n / 2 ^ (n.factorization 2)

/-- An integer `m` is *D-free* (with respect to a set `D` of primes)
    if no element of `D` divides `m`. -/
def DFree (D : Finset ℕ) (m : ℕ) : Prop := ∀ q ∈ D, ¬(q ∣ m)

instance decidableDFree (D : Finset ℕ) (m : ℕ) : Decidable (DFree D m) := by
  unfold DFree; exact inferInstance

/-- `N_D(n)`: the count of odd, D-free integers in `{1, …, n}`. -/
def countOddDFree (D : Finset ℕ) (n : ℕ) : ℕ :=
  ((Finset.Icc 1 n).filter fun m => ¬ Even m ∧ DFree D m).card

/-! ### Upper bound function -/

/-- The upper bound function: `g(A) = (1/2)(1 - 1/A + 1/(2A²))`.
    The main theorem shows `L(n) ≤ g(A) · n + o(n)` for every `A > 2`,
    and `inf_{A ≥ 2} g(A) = g(2) = 5/16`. -/
noncomputable def upperBoundFn (A : ℝ) : ℝ :=
  (1 / 2) * (1 - 1 / A + 1 / (2 * A ^ 2))

end DivAntichainGame

import Mathlib

/-!
# Definitions for the divisibility-antichain saturation game

This file defines the core concepts used in the proof that
`L(n) ≤ 13/36 · n + o(n)` for the divisibility-antichain saturation game.
-/

open Finset Nat BigOperators

noncomputable section

/-! ## Divisibility antichains -/

/-- A finite set `A` of natural numbers is a divisibility antichain if no element
of `A` divides a distinct element of `A`. -/
def IsDivAntichain (A : Finset ℕ) : Prop :=
  ∀ a ∈ A, ∀ b ∈ A, a ∣ b → a = b

/-- `IsDivAntichain` is decidable when `A` is finite (always, for `Finset`). -/
instance (A : Finset ℕ) : Decidable (IsDivAntichain A) :=
  show Decidable (∀ a ∈ A, ∀ b ∈ A, a ∣ b → a = b) from inferInstance

/-- A divisibility antichain that is maximal: no element of `{2, …, n} \ A`
can be added while preserving the antichain property. -/
def IsMaximalDivAntichain (A : Finset ℕ) (n : ℕ) : Prop :=
  A ⊆ Finset.Icc 2 n ∧
  IsDivAntichain A ∧
  ∀ x ∈ Finset.Icc 2 n, x ∉ A → ¬IsDivAntichain (insert x A)

/-! ## D-free integers -/

/-- An integer `x` is D-free if no element of `D` divides `x`. -/
def IsDFree (D : Finset ℕ) (x : ℕ) : Prop :=
  ∀ d ∈ D, ¬(d ∣ x)

instance (D : Finset ℕ) (x : ℕ) : Decidable (IsDFree D x) :=
  show Decidable (∀ d ∈ D, ¬(d ∣ x)) from inferInstance

/-! ## Odd part -/

/-- The odd part of `n`: `n` divided by its largest power-of-2 factor.
For `n = 0`, returns `0`. -/
def oddPart (n : ℕ) : ℕ := n / 2 ^ padicValNat 2 n

/-! ## Counting function N_D(n) -/

/-- The number of odd D-free integers in `[1, n]`. -/
def countOddDFree (D : Finset ℕ) (n : ℕ) : ℕ :=
  ((Finset.Icc 1 n).filter (fun m => Odd m ∧ ∀ q ∈ D, ¬(q ∣ m))).card

/-! ## Game definition -/

/-- The set of legal moves from a position `A` in the game on `{2, …, n}`:
those elements that can be added while preserving the divisibility-antichain property. -/
def legalMoves (A : Finset ℕ) (n : ℕ) : Finset ℕ :=
  (Finset.Icc 2 n \ A).filter (fun x => IsDivAntichain (insert x A))

/-- A play history: a sequence of moves made so far (most recent first). -/
abbrev GameHistory := List ℕ

/-- A strategy for a player: given the current antichain `A`, the game bound `n`,
and the move history, choose a legal move (if any exist). -/
def Strategy := (A : Finset ℕ) → (n : ℕ) → GameHistory → ℕ

/-- Play the game for at most `fuel` more steps.
Returns the final antichain. `turn = true` means it's Prolonger's turn. -/
def playGame (prolonger shortener : Strategy) (n : ℕ) :
    (fuel : ℕ) → (A : Finset ℕ) → (turn : Bool) → (history : GameHistory) → Finset ℕ
  | 0, A, _, _ => A
  | fuel + 1, A, turn, history =>
    let moves := legalMoves A n
    if moves.card = 0 then A
    else
      let strat := if turn then prolonger else shortener
      let move := strat A n history
      if move ∈ moves then
        playGame prolonger shortener n fuel (insert move A) (!turn) (move :: history)
      else
        -- Invalid move: game ends (this shouldn't happen under valid strategies)
        A

/- The game value `L(n)` is the minimax value of the final antichain size:
   min over Shortener strategies, max over Prolonger strategies, of |final A|.
   Formalizing this requires a full game tree construction; we omit it here
   and state the main theorem directly in terms of divisibility antichains. -/

end

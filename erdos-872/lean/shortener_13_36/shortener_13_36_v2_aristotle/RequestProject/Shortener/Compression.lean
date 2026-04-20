import Mathlib
import RequestProject.Shortener.Defs

/-!
# Compression Lemma

The odd-part map `φ(x) = x / 2^v₂(x)` is injective on divisibility antichains
and preserves D-freeness for sets D of odd primes. This gives the key bound
`|A'| ≤ N_D(n)`.

This corresponds to Lemma 2 (Compression into odd D-free integers) in the paper.
-/

open Finset Nat BigOperators

noncomputable section

/-! ## Properties of oddPart -/

lemma oddPart_dvd (n : ℕ) : oddPart n ∣ n :=
  Nat.div_dvd_of_dvd pow_padicValNat_dvd

lemma oddPart_le (n : ℕ) : oddPart n ≤ n :=
  Nat.div_le_self n _

lemma n_eq_two_pow_mul_oddPart (n : ℕ) :
    n = 2 ^ padicValNat 2 n * oddPart n :=
  (Nat.mul_div_cancel' pow_padicValNat_dvd).symm

lemma padicValNat_two_oddPart (n : ℕ) :
    padicValNat 2 (oddPart n) = 0 := by
  obtain rfl | hn := Nat.eq_zero_or_pos n
  · simp [oddPart]
  · rw [oddPart, padicValNat.div_pow pow_padicValNat_dvd]
    omega

lemma oddPart_odd (n : ℕ) (hn : 0 < n) : Odd (oddPart n) := by
  -- By definition of oddPart, we know that 2 does not divide oddPart n.
  have h_not_div : ¬(2 ∣ oddPart n) := by
    rw [ Nat.Prime.dvd_iff_one_le_factorization ] <;> norm_num;
    · convert padicValNat_two_oddPart n using 1;
    · exact Nat.ne_of_gt ( Nat.div_pos ( Nat.le_of_dvd hn ( Nat.ordProj_dvd _ _ ) ) ( pow_pos ( by decide ) _ ) );
  grind

lemma oddPart_pos (n : ℕ) (hn : 0 < n) : 0 < oddPart n := by
  exact Nat.div_pos ( Nat.le_of_dvd hn ( Nat.ordProj_dvd _ _ ) ) ( by positivity )

/-
If `d` is odd and `d ∣ n`, then `d ∣ oddPart n`.
-/
lemma odd_dvd_oddPart {n d : ℕ} (hd_odd : Odd d) (hd_dvd : d ∣ n) (hn : 0 < n) :
    d ∣ oddPart n := by
  -- By definition of oddPart, we have n = 2 ^ padicValNat 2 n * oddPart n.
  have h_eq : n = 2 ^ padicValNat 2 n * oddPart n := by
    exact?;
  exact ( Nat.Coprime.dvd_of_dvd_mul_left ( show Nat.Coprime d ( 2 ^ padicValNat 2 n ) from Nat.Coprime.pow_right _ <| Nat.Coprime.symm <| Nat.prime_two.coprime_iff_not_dvd.mpr <| by simpa [ ← even_iff_two_dvd ] using hd_odd ) ) <| h_eq ▸ hd_dvd

/-
Two elements of a divisibility antichain with the same odd part must be equal.
-/
lemma eq_of_oddPart_eq_of_antichain {A : Finset ℕ} {a b : ℕ}
    (hA : IsDivAntichain A) (ha : a ∈ A) (hb : b ∈ A)
    (hapos : 0 < a) (hbpos : 0 < b)
    (heq : oddPart a = oddPart b) : a = b := by
  -- By definition of oddPart, we have a = 2 ^ padicValNat 2 a * oddPart a and b = 2 ^ padicValNat 2 b * oddPart b.
  have h1 : a = 2 ^ padicValNat 2 a * oddPart a := by
    exact?
  have h2 : b = 2 ^ padicValNat 2 b * oddPart b := by
    exact?;
  -- Since $a$ and $b$ are in the same antichain and have the same odd part, one must divide the other.
  have h_div : a ∣ b ∨ b ∣ a := by
    rw [ h1, h2, heq ];
    rcases le_total ( padicValNat 2 a ) ( padicValNat 2 b ) with h | h <;> [ left; right ] <;> exact mul_dvd_mul ( pow_dvd_pow _ h ) dvd_rfl;
  rcases h_div with ( h | h ) <;> [ exact hA a ha b hb h; exact hA b hb a ha h ▸ rfl ]

/-! ## Compression Lemma -/

/-- The odd-part map is injective on any divisibility antichain of positive integers. -/
theorem oddPart_injOn_antichain (A : Finset ℕ) (hA : IsDivAntichain A)
    (hpos : ∀ a ∈ A, 0 < a) :
    Set.InjOn oddPart (A : Set ℕ) := by
  intro a ha b hb heq
  exact eq_of_oddPart_eq_of_antichain hA ha hb (hpos a ha) (hpos b hb) heq

/-- The image of a D-free element under `oddPart` is D-free,
provided all elements of `D` are odd. -/
lemma oddPart_isDFree {D : Finset ℕ} {x : ℕ} (hx : IsDFree D x)
    (hDodd : ∀ d ∈ D, Odd d) (hxpos : 0 < x) : IsDFree D (oddPart x) := by
  intro d hd hdvd
  exact hx d hd (dvd_trans hdvd (oddPart_dvd x))

/-
**Compression Lemma** (Lemma 2): If `A` is a divisibility antichain contained in
`{1, …, n}`, and every element of `A` is D-free (where `D` consists of odd numbers),
then `|A| ≤ N_D(n)`.
-/
theorem antichain_card_le_countOddDFree (A : Finset ℕ) (D : Finset ℕ) (n : ℕ)
    (hA : IsDivAntichain A)
    (hpos : ∀ a ∈ A, 0 < a)
    (hle : ∀ a ∈ A, a ≤ n)
    (hDfree : ∀ a ∈ A, IsDFree D a)
    (hDodd : ∀ d ∈ D, Odd d) :
    A.card ≤ countOddDFree D n := by
  -- The odd-part map is injective on A, so the cardinality of A is less than or equal to the cardinality of its image under the odd-part map.
  have h_card_le_image : A.card ≤ (Finset.image oddPart A).card := by
    grind +suggestions;
  refine le_trans h_card_le_image <| Finset.card_le_card <| Finset.image_subset_iff.mpr ?_;
  simp +zetaDelta at *;
  exact fun x hx => ⟨ ⟨ oddPart_pos x ( hpos x hx ), le_trans ( oddPart_le x ) ( hle x hx ) ⟩, oddPart_odd x ( hpos x hx ), fun q hq hq' => hDfree x hx q hq ( dvd_trans hq' ( oddPart_dvd x ) ) ⟩

end
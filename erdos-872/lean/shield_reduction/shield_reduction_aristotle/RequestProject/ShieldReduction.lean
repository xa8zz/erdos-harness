import Mathlib

open Finset BigOperators Classical

set_option maxHeartbeats 800000

/-! # Shield Reduction Theorem for the Divisibility Antichain Saturation Game

We formalize the Shield Reduction theorem from `shield_reduction.tex`.
-/

noncomputable section

/-! ## Definitions -/

/-- L = {m ∈ ℕ : 2 ≤ m ≤ ⌊n/2⌋} -/
def setL (n : ℕ) : Finset ℕ := Finset.Icc 2 (n / 2)

/-- U = {m ∈ ℕ : n/2 < m ≤ n} -/
def setU (n : ℕ) : Finset ℕ := Finset.Ioc (n / 2) n

/-- A finset of natural numbers is a divisibility antichain if no element divides
    a distinct element. -/
def DivAntichain (S : Finset ℕ) : Prop :=
  ∀ a ∈ S, ∀ b ∈ S, a ≠ b → ¬(a ∣ b)

/-- Upper shadow of x: multiples of x in U. -/
def upperShadow (n : ℕ) (x : ℕ) : Finset ℕ := (setU n).filter (x ∣ ·)

/-- Shadow weight: w_n(x) = |M(x)| - 1. -/
def shadowWeight (n : ℕ) (x : ℕ) : ℕ := (upperShadow n x).card - 1

/-- L(P) = {x ∈ L : x does not divide any element of P}. -/
def shieldedL (n : ℕ) (P : Finset ℕ) : Finset ℕ :=
  (setL n).filter (fun x => ∀ u ∈ P, ¬(x ∣ u))

/-- β(P) = max over divisibility antichains B ⊆ L(P) of Σ_{x ∈ B} w_n(x). -/
def beta (n : ℕ) (P : Finset ℕ) : ℕ :=
  ((shieldedL n P).powerset.filter DivAntichain).sup
    (fun B => ∑ x ∈ B, shadowWeight n x)

/-! ## Helper lemmas -/

/-
L and U are disjoint.
-/
lemma setL_setU_disjoint (n : ℕ) : Disjoint (setL n) (setU n) := by
  exact Finset.disjoint_left.mpr fun x hx₁ hx₂ => not_lt_of_ge ( Finset.mem_Icc.mp hx₁ |>.2 ) ( Finset.mem_Ioc.mp hx₂ |>.1 )

/-
L ∪ U = {2, ..., n} when n ≥ 2.
-/
lemma icc_eq_setL_union_setU (hn : 2 ≤ n) : Finset.Icc 2 n = setL n ∪ setU n := by
  -- Apply Finset.ext to prove that the two sets are equal.
  ext a
  simp [setL, setU];
  grind

/-
The upper shadow of any x ∈ L is nonempty (the largest multiple of x ≤ n is > n/2).
-/
lemma upperShadow_nonempty (hn : 2 ≤ n) (hx : x ∈ setL n) :
    (upperShadow n x).Nonempty := by
      unfold upperShadow;
      use ( n / x ) * x;
      simp_all +decide [ setL, setU ];
      exact ⟨ Nat.le_of_not_lt fun h => by nlinarith [ Nat.div_mul_le_self n x, Nat.div_mul_le_self n 2, Nat.div_add_mod n x, Nat.mod_lt n ( by linarith : 0 < x ) ], Nat.div_mul_le_self _ _ ⟩

/-- |M(x)| ≥ 1 for x ∈ L. -/
lemma upperShadow_card_pos (hn : 2 ≤ n) (hx : x ∈ setL n) :
    0 < (upperShadow n x).card :=
  Finset.card_pos.mpr (upperShadow_nonempty hn hx)

/-- |M(x)| = w_n(x) + 1 for x ∈ L. -/
lemma shadow_card_eq (hn : 2 ≤ n) (hx : x ∈ setL n) :
    (upperShadow n x).card = shadowWeight n x + 1 := by
  simp [shadowWeight, Nat.sub_add_cancel (upperShadow_card_pos hn hx)]

/-- A subset of a divisibility antichain is a divisibility antichain. -/
lemma DivAntichain.subset {S T : Finset ℕ} (hS : DivAntichain S) (hTS : T ⊆ S) :
    DivAntichain T :=
  fun a ha b hb hab => hS a (hTS ha) b (hTS hb) hab

/-- The biUnion of upper shadows is contained in U. -/
lemma biUnion_upperShadow_subset_setU (B : Finset ℕ) :
    B.biUnion (upperShadow n) ⊆ setU n := by
  intro u hu
  simp only [Finset.mem_biUnion] at hu
  obtain ⟨x, _, hx2⟩ := hu
  exact (Finset.mem_filter.mp hx2).1

/-
**Claim 1**: B = A ∩ L is contained in L(P).
-/
lemma claim1 (P A : Finset ℕ) (hAanti : DivAntichain A) (hPA : P ⊆ A)
    (hPU : P ⊆ setU n)
    (hAsub : A ⊆ Finset.Icc 2 n) :
    A ∩ setL n ⊆ shieldedL n P := by
      grind +locals

/-
**Claim 2 (⊆ direction)**: A ∩ U ⊆ U \ ⋃_{x ∈ B} M(x).
-/
lemma claim2_sub (hn : 2 ≤ n) (P A : Finset ℕ) (hAanti : DivAntichain A)
    (hPA : P ⊆ A) (hAsub : A ⊆ Finset.Icc 2 n) :
    A ∩ setU n ⊆ (setU n) \ (A ∩ setL n).biUnion (upperShadow n) := by
      intro x;
      simp +contextual [ upperShadow ];
      intro hx hx' y hy hy' hxy;
      exact hAanti _ hy _ hx ( by linarith [ Finset.mem_Ioc.mp hx', Finset.mem_Icc.mp hy' ] ) hxy

/-
**Claim 2 (⊇ direction)**: U \ ⋃_{x ∈ B} M(x) ⊆ A.
-/
lemma claim2_sup (hn : 2 ≤ n) (P A : Finset ℕ) (hAanti : DivAntichain A)
    (hPA : P ⊆ A) (hPU : P ⊆ setU n)
    (hAsub : A ⊆ Finset.Icc 2 n)
    (hAmax : ∀ v ∈ Finset.Icc 2 n, v ∉ A → ∃ a ∈ A, a ∣ v ∨ v ∣ a) :
    (setU n) \ (A ∩ setL n).biUnion (upperShadow n) ⊆ A ∩ setU n := by
      intro v hv;
      contrapose! hAmax;
      refine' ⟨ v, _, _, _ ⟩ <;> simp_all +decide [ Finset.subset_iff ];
      · exact ⟨ by linarith [ Finset.mem_Ioc.mp hv.1, Nat.div_add_mod n 2, Nat.mod_lt n two_pos ], by linarith [ Finset.mem_Ioc.mp hv.1, Nat.div_mul_le_self n 2 ] ⟩;
      · intro a ha; constructor <;> intro h <;> have := hAsub ha <;> simp_all +decide [ upperShadow ] ;
        · cases h ; simp_all +decide [ setU ];
          rcases k : ‹ℕ› with ( _ | _ | k ) <;> simp_all +decide [ Nat.pow_succ', Nat.mul_succ ];
          exact hv.2 a ha ( Finset.mem_Icc.mpr ⟨ by linarith [ hAsub ha ], by nlinarith [ Nat.div_add_mod n 2, Nat.mod_lt n two_pos ] ⟩ ) ( by linarith [ hAsub ha ] ) ( by linarith [ hAsub ha ] ) ( by norm_num );
        · obtain ⟨ k, hk ⟩ := h;
          rcases k with ( _ | _ | k ) <;> simp_all +decide [ Nat.mul_succ ];
          · linarith [ hAsub ha ];
          · have := hAsub ha; simp_all +decide [ setU, setL ] ;
            grind

/-- **Claim 2 combined**: A ∩ U = U \ ⋃_{x ∈ B} M(x). -/
lemma claim2 (hn : 2 ≤ n) (P A : Finset ℕ) (hAanti : DivAntichain A)
    (hPA : P ⊆ A) (hPU : P ⊆ setU n)
    (hAsub : A ⊆ Finset.Icc 2 n)
    (hAmax : ∀ v ∈ Finset.Icc 2 n, v ∉ A → ∃ a ∈ A, a ∣ v ∨ v ∣ a) :
    A ∩ setU n = (setU n) \ (A ∩ setL n).biUnion (upperShadow n) :=
  le_antisymm (claim2_sub hn P A hAanti hPA hAsub)
    (claim2_sup hn P A hAanti hPA hPU hAsub hAmax)

/-
Sum of |M(x)| over B equals sum of w_n(x) over B plus |B|, when all shadows are nonempty.
-/
lemma sum_shadow_card_eq (hn : 2 ≤ n) (B : Finset ℕ) (hB : B ⊆ setL n) :
    ∑ x ∈ B, (upperShadow n x).card = ∑ x ∈ B, shadowWeight n x + B.card := by
      rw [ Finset.sum_congr rfl fun x hx => shadow_card_eq hn ( hB hx ) ];
      rw [ Finset.sum_add_distrib, Finset.sum_const, smul_eq_mul, mul_one ]

/-
β(P) ≥ Σ w_n(x) for any antichain B ⊆ L(P).
-/
lemma beta_ge_sum (n : ℕ) (P B : Finset ℕ) (hBsub : B ⊆ shieldedL n P)
    (hBanti : DivAntichain B) :
    ∑ x ∈ B, shadowWeight n x ≤ beta n P := by
      refine' Finset.le_sup ( f := fun B => ∑ x ∈ B, shadowWeight n x ) _;
      aesop

/-
|A| = |A ∩ L| + |A ∩ U| when A ⊆ L ∪ U and L, U are disjoint.
-/
lemma card_inter_add (hn : 2 ≤ n) (A : Finset ℕ) (hAsub : A ⊆ Finset.Icc 2 n) :
    A.card = (A ∩ setL n).card + (A ∩ setU n).card := by
      rw [ ← Finset.card_union_of_disjoint, Finset.inter_comm _ ( setU n ) ];
      · congr with x;
        grind +suggestions;
      · exact Finset.disjoint_left.mpr fun x hx₁ hx₂ => Finset.disjoint_left.mp ( setL_setU_disjoint n ) ( Finset.mem_inter.mp hx₁ |>.2 ) ( Finset.mem_inter.mp hx₂ |>.2 )

/-! ## Main Theorem -/

/-
**Shield Reduction Theorem**: If A is a maximal divisibility antichain in {2,...,n}
containing P ⊆ U, then |A| + β(P) ≥ |U|. Equivalently, |A| ≥ |U| - β(P).
-/
theorem shield_reduction (n : ℕ) (hn : 2 ≤ n) (P : Finset ℕ) (hPU : P ⊆ setU n)
    (A : Finset ℕ) (hAanti : DivAntichain A) (hPA : P ⊆ A)
    (hAsub : A ⊆ Finset.Icc 2 n)
    (hAmax : ∀ v ∈ Finset.Icc 2 n, v ∉ A → ∃ a ∈ A, a ∣ v ∨ v ∣ a) :
    (setU n).card ≤ A.card + beta n P := by
      -- By claim2, A ∩ setU n = setU n \ B.biUnion (upperShadow n).
      set B := A ∩ setL n with hB_def;
      -- From step 1, (setU n).card = (A ∩ setU n).card + (B.biUnion (upperShadow n)).card
      have h_card : (setU n).card = (A ∩ setU n).card + (B.biUnion (upperShadow n)).card := by
        have h_card : A ∩ setU n = setU n \ B.biUnion (upperShadow n) := by
          apply claim2 hn P A hAanti hPA hPU hAsub hAmax;
        rw [ h_card, Finset.card_sdiff_add_card ];
        congr;
        exact Eq.symm ( Finset.union_eq_left.mpr <| biUnion_upperShadow_subset_setU _ );
      -- Since B.biUnion (upperShadow n) ⊆ setU n (by biUnion_upperShadow_subset_setU), we have:
      have h_card_biUnion : (B.biUnion (upperShadow n)).card ≤ (∑ x ∈ B, shadowWeight n x) + B.card := by
        refine' le_trans ( Finset.card_biUnion_le ) _;
        convert sum_shadow_card_eq hn B ( Finset.inter_subset_right ) |> le_of_eq using 1;
      -- By card_inter_add, A.card = B.card + (A ∩ setU n).card
      have h_card_A : A.card = B.card + (A ∩ setU n).card := by
        convert card_inter_add hn A hAsub using 1;
      linarith [ beta_ge_sum n P B ( claim1 P A hAanti hPA hPU hAsub ) ( DivAntichain.subset hAanti ( Finset.inter_subset_left ) ) ]

end
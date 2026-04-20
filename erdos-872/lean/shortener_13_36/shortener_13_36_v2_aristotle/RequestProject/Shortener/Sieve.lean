import Mathlib
import RequestProject.Shortener.Defs

/-!
# Sieve Bound

This file proves the Bonferroni-type bound on the count of odd D-free integers,
corresponding to Lemma 3 (Truncation and sieve bound) in the paper.

## Main results

* `countOddDFree_mono` — Monotonicity: `E ⊆ D → countOddDFree D n ≤ countOddDFree E n`.
* `sieveFun_le_of_ge_third` — The function `f(s) = 1 - s + s²/2 ≤ 13/18` for `s ∈ [1/3, 1]`.
* `countOddDFree_le_thirteen_thirtysixths` — The main sieve estimate.
-/

open Finset Nat BigOperators Filter Asymptotics

noncomputable section

/-! ## Monotonicity -/

/-- Monotonicity: if `E ⊆ D`, then `countOddDFree D n ≤ countOddDFree E n`. -/
lemma countOddDFree_mono {D E : Finset ℕ} (h : E ⊆ D) (n : ℕ) :
    countOddDFree D n ≤ countOddDFree E n := by
  exact Finset.card_mono fun x hx => Finset.mem_filter.mpr
    ⟨(Finset.mem_filter.mp hx).1, (Finset.mem_filter.mp hx).2.1,
     fun q hq => (Finset.mem_filter.mp hx).2.2 q (h hq)⟩

/-! ## Counting odd integers -/

/-- The number of odd integers in `[1, n]` is `(n + 1) / 2`. -/
lemma card_odd_Icc (n : ℕ) :
    ((Finset.Icc 1 n).filter (fun m => Odd m)).card = (n + 1) / 2 := by
  rw [Finset.card_eq_of_bijective]
  use fun i hi => 2 * i + 1
  · simp +zetaDelta at *
    exact fun a ha₁ ha₂ ha₃ => by obtain ⟨k, rfl⟩ := ha₃; exact ⟨k, by omega, rfl⟩
  · exact fun i hi => Finset.mem_filter.mpr
      ⟨Finset.mem_Icc.mpr ⟨by linarith, by linarith [Nat.div_mul_le_self (n + 1) 2]⟩,
       by simp +decide [parity_simps]⟩
  · aesop

/-- Upper bound: the number of odd multiples of an odd `p` in `[1, n]`
is at most `(n/p + 1) / 2`. -/
lemma card_odd_multiples_le (p n : ℕ) (hp : Odd p) (hppos : 0 < p) :
    ((Finset.Icc 1 n).filter (fun m => Odd m ∧ p ∣ m)).card ≤ (n / p + 1) / 2 := by
  have h_multiples : {m ∈ Finset.Icc 1 n | Odd m ∧ p ∣ m} ⊆
      Finset.image (fun k => p * (2 * k + 1)) (Finset.range ((n / p + 1) / 2)) := by
    intro m hm
    obtain ⟨k, rfl⟩ := hp
    obtain ⟨a, rfl⟩ := (Finset.mem_filter.mp hm).2.2
    rcases Nat.even_or_odd' a with ⟨b, rfl | rfl⟩ <;> simp_all +decide [parity_simps]
    · exact absurd hm.2 (by simp +decide [parity_simps])
    · rw [Nat.lt_iff_add_one_le, Nat.le_div_iff_mul_le] <;>
        nlinarith [Nat.div_add_mod n (2 * k + 1),
          Nat.mod_lt n (by linarith : 0 < (2 * k + 1))]
  exact le_trans (Finset.card_le_card h_multiples)
    (Finset.card_image_le.trans (by simpa))

/-- Lower bound: the number of odd multiples of an odd `p` in `[1, n]`
is at least `n / (2 * p)`. -/
lemma card_odd_multiples_ge (p n : ℕ) (hp : Odd p) (hppos : 0 < p) :
    n / (2 * p) ≤ ((Finset.Icc 1 n).filter (fun m => Odd m ∧ p ∣ m)).card := by
  have h_infinite : Finset.image (fun i => (2 * i + 1) * p) (Finset.range (n / (2 * p))) ⊆
      Finset.filter (fun m => Odd m ∧ p ∣ m) (Finset.Icc 1 n) := by
    norm_num [Finset.image_subset_iff]
    exact fun x hx =>
      ⟨⟨by nlinarith, by nlinarith [Nat.div_mul_le_self n (2 * p)]⟩,
       by simp_all +decide [parity_simps]⟩
  exact le_trans (by rw [Finset.card_image_of_injective] <;> aesop_cat)
    (Finset.card_mono h_infinite)

/-! ## The sieve function -/

/-- The function `f(s) = 1 - s + s²/2` that appears in the sieve bound. -/
def sieveFun (s : ℝ) : ℝ := 1 - s + s ^ 2 / 2

/-- `f` is decreasing on `[0, 1]`. -/
lemma sieveFun_antitoneOn : AntitoneOn sieveFun (Set.Icc 0 1) :=
  fun c hc d hd hcd ↦ by unfold sieveFun; nlinarith [hc.1, hc.2, hd.1, hd.2]

/-- `f(1/3) = 13/18`. -/
lemma sieveFun_one_third : sieveFun (1/3) = 13/18 := by
  unfold sieveFun; norm_num

/-- For `s ∈ [1/3, 1]`, `f(s) ≤ 13/18`. -/
lemma sieveFun_le_of_ge_third {s : ℝ} (hs : 1/3 ≤ s) (hs' : s ≤ 1) :
    sieveFun s ≤ 13/18 :=
  le_trans (sieveFun_antitoneOn ⟨by linarith, by linarith⟩ ⟨by linarith, by linarith⟩ hs)
    (by norm_num [sieveFun_one_third])

/-- `sieveFun` is nonneg on `[0, 2]`. -/
lemma sieveFun_nonneg {s : ℝ} (hs : 0 ≤ s) (hs' : s ≤ 2) : 0 ≤ sieveFun s := by
  unfold sieveFun; nlinarith

/-! ## Bonferroni / inclusion-exclusion bound -/

/-- Second-order Bonferroni inequality for Finsets. -/
lemma second_order_bonferroni {α : Type*} [DecidableEq α]
    (S : Finset α) (E : Finset ℕ) (A : ℕ → Finset α) :
    (S \ E.biUnion (fun q => A q ∩ S)).card ≤
      S.card - ∑ q ∈ E, (A q ∩ S).card
      + ∑ q ∈ E, ∑ r ∈ E.filter (· > q), (A q ∩ A r ∩ S).card := by
  have h_incl_excl : # (E.biUnion (fun q => A q ∩ S)) ≥
      ∑ q ∈ E, #(A q ∩ S) -
      ∑ q ∈ E, ∑ r ∈ E with r > q, #(A q ∩ A r ∩ S) := by
    induction' E using Finset.induction with x E hxIh <;>
      simp_all +decide [Finset.sum_filter, Finset.sum_range_succ]
    have h_card_union : #(A x ∩ S ∪ E.biUnion (fun q => A q ∩ S)) ≥
        #(A x ∩ S) + #(E.biUnion (fun q => A q ∩ S)) -
        ∑ q ∈ E, #(A x ∩ (A q ∩ S)) := by
      have h_card_union : #(A x ∩ S ∪ E.biUnion (fun q => A q ∩ S)) ≥
          #(A x ∩ S) + #(E.biUnion (fun q => A q ∩ S)) -
          #(A x ∩ S ∩ E.biUnion (fun q => A q ∩ S)) := by
        grind
      refine' le_trans _ h_card_union
      gcongr
      convert Finset.card_biUnion_le using 2; aesop
    simp_all +decide [Finset.sum_add_distrib, Finset.sum_ite, Finset.filter_lt_eq_Ioi]
    have h_card_union : ∑ q ∈ E, #(A x ∩ (A q ∩ S)) =
        ∑ q ∈ E with x < q, #(A x ∩ (A q ∩ S)) +
        ∑ q ∈ E with q < x, #(A x ∩ (A q ∩ S)) := by
      rw [← Finset.sum_union]
      · rcongr q; aesop
      · exact Finset.disjoint_filter.mpr fun _ _ _ _ => by linarith
    simp_all +decide [Finset.inter_comm, Finset.inter_left_comm, Finset.inter_assoc]
    linarith
  grind

/-- For distinct primes p, q, the odd multiples of p·q in [1,n]
are the intersection of odd multiples of p and odd multiples of q. -/
lemma odd_multiples_inter {p q : ℕ} (hp : Nat.Prime p) (hq : Nat.Prime q)
    (hpq : p ≠ q) (n : ℕ) :
    (Finset.Icc 1 n).filter (fun m => Odd m ∧ p ∣ m) ∩
    (Finset.Icc 1 n).filter (fun m => Odd m ∧ q ∣ m) =
    (Finset.Icc 1 n).filter (fun m => Odd m ∧ (p * q) ∣ m) := by
  ext m; simp [Finset.mem_inter, Finset.mem_filter]
  constructor
  · exact fun h => ⟨h.1.1, h.1.2.1,
      Nat.Coprime.mul_dvd_of_dvd_of_dvd
        (by simpa [*] using Nat.coprime_primes hp hq) h.1.2.2 h.2.2.2⟩
  · exact fun h => ⟨⟨h.1, h.2.1, dvd_of_mul_right_dvd h.2.2⟩,
      h.1, h.2.1, dvd_of_mul_left_dvd h.2.2⟩

/-! ### Step 1: countOddDFree as set difference -/

/-
`countOddDFree E n` equals the cardinality of odd integers in `[1,n]` minus
those divisible by some element of `E`.
-/
lemma countOddDFree_eq_sdiff (E : Finset ℕ) (n : ℕ) :
    countOddDFree E n =
      ((Finset.Icc 1 n).filter Odd \
        E.biUnion (fun q =>
          (Finset.Icc 1 n).filter (fun m => Odd m ∧ q ∣ m) ∩
          (Finset.Icc 1 n).filter Odd)).card := by
  refine' congr_arg Finset.card ( Finset.ext fun x => _ );
  by_cases hx : Odd x <;> aesop

/-! ### Step 2: Bonferroni addition form -/

/-
Bonferroni inequality in addition form (avoids ℕ subtraction):
`N_E(n) + ∑ |A_q| ≤ |S| + ∑_{q<r} |A_q ∩ A_r|`
where `S = odd integers in [1,n]` and `A_q = odd multiples of q in [1,n]`.
-/
lemma countOddDFree_bonferroni_add (E : Finset ℕ) (n : ℕ)
    (hprimes : ∀ p ∈ E, Nat.Prime p)
    (hodd : ∀ p ∈ E, Odd p) :
    countOddDFree E n +
      ∑ q ∈ E, ((Finset.Icc 1 n).filter (fun m => Odd m ∧ q ∣ m)).card ≤
    (n + 1) / 2 +
      ∑ q ∈ E, ∑ r ∈ E.filter (· > q),
        ((Finset.Icc 1 n).filter (fun m => Odd m ∧ (q * r) ∣ m)).card := by
  -- Let $S = (Icc 1 n).filter Odd$ and $A_q = (Icc 1 n).filter (fun m => Odd m ∧ q ∣ m)$.
  set S := (Finset.Icc 1 n).filter Odd
  set A : ℕ → Finset ℕ := fun q => (Finset.Icc 1 n).filter (fun m => Odd m ∧ q ∣ m);
  -- By second_order_bonferroni, we have $|biUnion| \geq \sum_{q \in E} |A_q| - \sum_{q < r \in E} |A_q \cap A_r|$.
  have h_bonferroni : (Finset.biUnion E A).card ≥ ∑ q ∈ E, (A q).card - ∑ q ∈ E, ∑ r ∈ E.filter (· > q), (A q ∩ A r).card := by
    have h_bonferroni : ∀ (E : Finset ℕ) (A : ℕ → Finset ℕ), (Finset.biUnion E A).card ≥ ∑ q ∈ E, (A q).card - ∑ q ∈ E, ∑ r ∈ E.filter (· > q), (A q ∩ A r).card := by
      intros E A;
      induction' E using Finset.induction with q E hq ih;
      · norm_num;
      · simp_all +decide [ Finset.sum_insert hq, Finset.sum_filter ];
        have h_bonferroni : #(A q ∪ E.biUnion A) ≥ #(A q) + #(E.biUnion A) - ∑ x ∈ E, #(A q ∩ A x) := by
          have h_bonferroni : #(A q ∩ E.biUnion A) ≤ ∑ x ∈ E, #(A q ∩ A x) := by
            have h_bonferroni : #(A q ∩ E.biUnion A) ≤ #(Finset.biUnion E (fun x => A q ∩ A x)) := by
              exact Finset.card_le_card fun x hx => by aesop;
            exact h_bonferroni.trans ( Finset.card_biUnion_le );
          grind;
        have h_bonferroni : ∑ x ∈ E, #(A q ∩ A x) ≤ ∑ x ∈ E, (if q < x then #(A q ∩ A x) else 0) + ∑ x ∈ E, (if x < q then #(A x ∩ A q) else 0) := by
          rw [ ← Finset.sum_add_distrib ] ; refine' Finset.sum_le_sum fun x hx => _ ; split_ifs <;> simp_all +decide [ Finset.inter_comm ] ;
          grobner;
        simp_all +decide [ Finset.sum_add_distrib ] ; omega;
    exact h_bonferroni E A;
  -- By definition of $countOddDFree$, we have $countOddDFree E n = |S \ biUnion|$.
  have h_count : countOddDFree E n = S.card - (Finset.biUnion E A).card := by
    convert countOddDFree_eq_sdiff E n using 1;
    grind;
  -- By definition of $A$, we know that $|A_q \cap A_r| = |filter (Odd ∧ qr ∣ m)|$.
  have h_inter : ∀ q r : ℕ, q ∈ E → r ∈ E → q < r → (A q ∩ A r).card = ((Finset.Icc 1 n).filter (fun m => Odd m ∧ (q * r) ∣ m)).card := by
    intros q r hq hr hqr
    have h_inter_eq : A q ∩ A r = (Finset.Icc 1 n).filter (fun m => Odd m ∧ (q * r) ∣ m) := by
      ext m; simp [A];
      exact ⟨ fun h => ⟨ h.1.1, h.1.2.1, Nat.Coprime.mul_dvd_of_dvd_of_dvd ( by have := Nat.coprime_primes ( hprimes q hq ) ( hprimes r hr ) ; aesop ) h.1.2.2 h.2.2.2 ⟩, fun h => ⟨ ⟨ h.1, h.2.1, dvd_of_mul_right_dvd h.2.2 ⟩, h.1, h.2.1, dvd_of_mul_left_dvd h.2.2 ⟩ ⟩;
    rw [h_inter_eq];
  rw [ h_count, tsub_add_eq_add_tsub ];
  · rw [ card_odd_Icc ] at *;
    simp_all +decide [ Finset.sum_filter ];
    grind;
  · exact Finset.card_le_card fun x hx => by aesop;

/-! ### Step 3: Real arithmetic -/

/-
The sum `∑_{q<r∈E} 1/(qr) ≤ (∑_{q∈E} 1/q)² / 2`.
-/
lemma sum_pairs_le_sq_half (E : Finset ℕ) (hpos : ∀ q ∈ E, (0 : ℝ) < q) :
    ∑ q ∈ E, ∑ r ∈ E.filter (· > q), (1 : ℝ) / (q * r) ≤
      (∑ q ∈ E, (1 : ℝ) / q) ^ 2 / 2 := by
  induction' E using Finset.induction with q E hE ih;
  · norm_num;
  · simp_all +decide [ Finset.sum_filter, Finset.sum_insert, Finset.sum_add_distrib, Finset.sum_mul, mul_add, add_mul, sq ];
    simp_all +decide [ Finset.sum_ite, Finset.filter_lt_eq_Ioi ];
    have h_split : ∑ x ∈ E with x < q, (q : ℝ)⁻¹ * (x : ℝ)⁻¹ + ∑ x ∈ E with q < x, (x : ℝ)⁻¹ * (q : ℝ)⁻¹ ≤ ∑ x ∈ E, (x : ℝ)⁻¹ * (q : ℝ)⁻¹ := by
      rw [ ← Finset.sum_subset ( show E.filter ( fun x => x < q ) ∪ E.filter ( fun x => q < x ) ⊆ E from Finset.union_subset ( Finset.filter_subset _ _ ) ( Finset.filter_subset _ _ ) ) ];
      · rw [ Finset.sum_union ( Finset.disjoint_filter.mpr fun _ _ _ => by linarith ) ] ; simp +decide [ mul_comm ];
      · grind;
    norm_num [ ← Finset.mul_sum _ _ _, ← Finset.sum_mul ] at * ; nlinarith [ inv_pos.2 ( show 0 < ( q : ℝ ) by exact Nat.cast_pos.2 hpos.1 ) ]

/-! ### Step 4: Main Bonferroni bound -/

/-
**Bonferroni bound**: For a finite set `E` of distinct odd primes,
`N_E(n) ≤ (n/2) · f(∑ 1/p) + (|E|+1)²`,
where `f(s) = 1 - s + s²/2`.
-/
theorem countOddDFree_bonferroni_real (E : Finset ℕ) (n : ℕ)
    (hprimes : ∀ p ∈ E, Nat.Prime p)
    (hodd : ∀ p ∈ E, Odd p) :
    (countOddDFree E n : ℝ) ≤
      (n : ℝ) / 2 * sieveFun (∑ p ∈ E, (1 : ℝ) / p)
      + ((E.card : ℝ) + 1) ^ 2 := by
  -- Let's simplify the expression using the definitions of `countOddDFree` and `sieveFun`.
  have h_simplify : (countOddDFree E n : ℝ) ≤ (n + 1) / 2 - (n / 2 : ℝ) * (∑ p ∈ E, (1 : ℝ) / p) + (∑ q ∈ E, ∑ r ∈ E.filter (· > q), (n / (q * r) : ℝ) / 2) + E.card + E.card * (E.card - 1) / 2 := by
    have h_simplify : (countOddDFree E n : ℝ) ≤ (n + 1) / 2 - (∑ q ∈ E, (n / (2 * q) : ℕ) : ℝ) + (∑ q ∈ E, ∑ r ∈ E.filter (· > q), ((n / (q * r) + 1) / 2 : ℕ) : ℝ) := by
      have h_bound : (countOddDFree E n : ℝ) ≤ ((n + 1) / 2 : ℝ) - ∑ q ∈ E, ((Finset.Icc 1 n).filter (fun m => Odd m ∧ q ∣ m)).card + ∑ q ∈ E, ∑ r ∈ E.filter (· > q), ((Finset.Icc 1 n).filter (fun m => Odd m ∧ (q * r) ∣ m)).card := by
        have bonferroni_bound_aux : countOddDFree E n + ∑ q ∈ E, ((Finset.Icc 1 n).filter (fun m => Odd m ∧ q ∣ m)).card ≤ (n + 1) / 2 + ∑ q ∈ E, ∑ r ∈ E.filter (· > q), ((Finset.Icc 1 n).filter (fun m => Odd m ∧ (q * r) ∣ m)).card := by
          apply countOddDFree_bonferroni_add E n hprimes hodd;
        rw [ div_sub', div_add', le_div_iff₀ ] <;> norm_cast;
        grind;
      refine le_trans h_bound ?_;
      gcongr;
      · push_cast;
        exact Finset.sum_le_sum fun x hx => mod_cast card_odd_multiples_ge x n ( hodd x hx ) ( Nat.Prime.pos ( hprimes x hx ) );
      · norm_num +zetaDelta at *;
        exact Finset.sum_le_sum fun i hi => Finset.sum_le_sum fun j hj => mod_cast card_odd_multiples_le _ _ ( hodd _ hi |> Odd.mul <| hodd _ <| Finset.mem_filter.mp hj |>.1 ) ( Nat.mul_pos ( Nat.Prime.pos <| hprimes _ hi ) ( Nat.Prime.pos <| hprimes _ <| Finset.mem_filter.mp hj |>.1 ) );
    -- Apply the bounds for `|A_q|` and `|A_{qr}|`.
    have h_bounds : (∑ q ∈ E, (n / (2 * q) : ℕ) : ℝ) ≥ (∑ q ∈ E, (n / (2 * q) : ℝ)) - E.card ∧ (∑ q ∈ E, ∑ r ∈ E.filter (· > q), ((n / (q * r) + 1) / 2 : ℕ) : ℝ) ≤ (∑ q ∈ E, ∑ r ∈ E.filter (· > q), (n / (q * r) : ℝ) / 2) + E.card * (E.card - 1) / 2 := by
      constructor;
      · have h_floor : ∀ q ∈ E, (n / (2 * q) : ℕ) ≥ (n / (2 * q) : ℝ) - 1 := by
          intro q hq; rw [ ge_iff_le ] ; rw [ sub_le_iff_le_add ] ; rw [ div_le_iff₀ ] <;> norm_cast <;> nlinarith [ Nat.div_add_mod n ( 2 * q ), Nat.mod_lt n ( show 2 * q > 0 from mul_pos zero_lt_two ( Nat.Prime.pos ( hprimes q hq ) ) ), Nat.Prime.two_le ( hprimes q hq ) ] ;
        simpa using Finset.sum_le_sum h_floor;
      · have h_bounds : ∀ q ∈ E, ∀ r ∈ E.filter (· > q), ((n / (q * r) + 1) / 2 : ℕ) ≤ (n / (q * r) : ℝ) / 2 + 1 / 2 := by
          intro q hq r hr; rw [ div_div, div_add_div, le_div_iff₀ ] <;> norm_cast <;> norm_num;
          · nlinarith [ Nat.div_mul_le_self n ( q * r ), Nat.div_mul_le_self ( n / ( q * r ) + 1 ) 2, Nat.Prime.two_le ( hprimes q hq ), Nat.Prime.two_le ( hprimes r ( Finset.mem_filter.mp hr |>.1 ) ), mul_pos ( Nat.Prime.pos ( hprimes q hq ) ) ( Nat.Prime.pos ( hprimes r ( Finset.mem_filter.mp hr |>.1 ) ) ) ];
          · exact ⟨ Nat.Prime.pos ( hprimes q hq ), Nat.Prime.pos ( hprimes r ( Finset.mem_filter.mp hr |>.1 ) ) ⟩;
          · exact ⟨ Nat.Prime.ne_zero ( hprimes q hq ), Nat.Prime.ne_zero ( hprimes r ( Finset.mem_filter.mp hr |>.1 ) ) ⟩;
        refine' le_trans ( Finset.sum_le_sum fun q hq => Finset.sum_le_sum fun r hr => h_bounds q hq r hr ) _;
        norm_num [ Finset.sum_add_distrib ];
        rw [ ← Finset.sum_mul _ _ _ ];
        have h_card_filter : ∀ q ∈ E, (Finset.card (Finset.filter (fun x => q < x) E) : ℝ) ≤ (Finset.card E - 1 : ℝ) := by
          exact fun q hq => le_tsub_of_add_le_right <| mod_cast Finset.card_lt_card <| Finset.filter_ssubset.mpr ⟨ q, by aesop ⟩;
        exact le_trans ( mul_le_mul_of_nonneg_right ( Finset.sum_le_sum h_card_filter ) ( by norm_num ) ) ( by norm_num; linarith );
    norm_num [ div_eq_mul_inv, mul_assoc, mul_comm, mul_left_comm, Finset.mul_sum _ _ _ ] at * ; linarith;
  -- Applying the bound from sum_pairs_le_sq_half to the double sum.
  have h_double_sum_bound : ∑ q ∈ E, ∑ r ∈ E.filter (· > q), (n / (q * r) : ℝ) / 2 ≤ (n / 2 : ℝ) * (∑ p ∈ E, (1 : ℝ) / p) ^ 2 / 2 := by
    convert mul_le_mul_of_nonneg_left ( sum_pairs_le_sq_half E fun p hp => Nat.cast_pos.mpr <| Nat.Prime.pos <| hprimes p hp ) <| show ( 0 :ℝ ) ≤ n / 2 by positivity using 1 ; ring;
    · simp +decide only [mul_assoc, Finset.mul_sum _ _ _, sum_mul];
    · ring;
  unfold sieveFun; nlinarith [ sq_nonneg ( ( ∑ p ∈ E, 1 / ( p : ℝ ) ) - 1 ) ] ;

/-! ## Main sieve estimate -/

/-
**Sieve bound** (Lemma 3, part 4):
If `D` is a set of distinct odd primes with `∑_{q∈D} 1/q ≥ 1/3`,
then `N_D(n) ≤ 13/36 · n + (|D|+1)²`.
-/
theorem countOddDFree_le_thirteen_thirtysixths
    (D : Finset ℕ) (n : ℕ)
    (hprimes : ∀ p ∈ D, Nat.Prime p)
    (hodd : ∀ p ∈ D, Odd p)
    (hsum : (1 : ℝ) / 3 ≤ ∑ q ∈ D, (1 : ℝ) / q) :
    (countOddDFree D n : ℝ) ≤ 13 / 36 * n + ((D.card : ℝ) + 1) ^ 2 := by
  -- We need to find a subset E ⊆ D with ∑_{q∈E} 1/q ∈ [1/3, 1].
  obtain ⟨E, hE⟩ : ∃ E ⊆ D, (1 / 3 : ℝ) ≤ ∑ q ∈ E, (1 : ℝ) / q ∧ ∑ q ∈ E, (1 : ℝ) / q ≤ 1 := by
    by_contra! h_contra;
    -- Let $E$ be the smallest subset of $D$ such that $\sum_{q \in E} 1/q > 1$.
    obtain ⟨E, hE_subset, hE_sum⟩ : ∃ E ⊆ D, (∑ q ∈ E, (1 : ℝ) / q) > 1 ∧ ∀ F ⊆ E, F ≠ E → (∑ q ∈ F, (1 : ℝ) / q) ≤ 1 := by
      have h_exists_E : ∃ E ⊆ D, (∑ q ∈ E, (1 : ℝ) / q) > 1 := by
        exact ⟨ D, Finset.Subset.refl _, h_contra D Finset.Subset.rfl hsum ⟩;
      have h_min_E : ∃ E ∈ {E ⊆ D | (∑ q ∈ E, (1 : ℝ) / q) > 1}, ∀ F ∈ {E ⊆ D | (∑ q ∈ E, (1 : ℝ) / q) > 1}, E.card ≤ F.card := by
        apply_rules [ Set.exists_min_image ];
        exact Set.finite_iff_bddAbove.mpr ⟨ D, fun E hE => Finset.le_iff_subset.mpr hE.1 ⟩;
      obtain ⟨ E, hE₁, hE₂ ⟩ := h_min_E; exact ⟨ E, hE₁.1, hE₁.2, fun F hF₁ hF₂ => not_lt.1 fun hF₃ => not_lt_of_ge ( hE₂ F ⟨ Finset.Subset.trans hF₁ hE₁.1, hF₃ ⟩ ) ( Finset.card_lt_card <| Finset.ssubset_iff_subset_ne.mpr ⟨ hF₁, hF₂ ⟩ ) ⟩ ;
    -- Since $E$ is minimal, removing any element $p$ from $E$ results in a subset $F$ such that $\sum_{q \in F} 1/q \leq 1$.
    obtain ⟨p, hpE, hp⟩ : ∃ p ∈ E, (∑ q ∈ E.erase p, (1 : ℝ) / q) ≤ 1 := by
      exact Exists.elim ( Finset.nonempty_of_ne_empty ( by rintro rfl; norm_num at hE_sum ) ) fun p hp => ⟨ p, hp, hE_sum.2 _ ( Finset.erase_subset _ _ ) ( by aesop ) ⟩;
    -- Since $p$ is a prime number, we have $1/p \leq 1/3$.
    have hp_le_third : (1 : ℝ) / p ≤ 1 / 3 := by
      gcongr ; norm_cast ; have := hodd p ( hE_subset hpE ) ; have := Nat.Prime.two_le ( hprimes p ( hE_subset hpE ) ) ; rcases p with ( _ | _ | _ | _ | p ) <;> simp_all +arith +decide;
    exact absurd ( h_contra ( E.erase p ) ( Finset.Subset.trans ( Finset.erase_subset _ _ ) hE_subset ) ( by linarith [ show ( ∑ q ∈ E, ( 1 : ℝ ) / q ) = ( ∑ q ∈ E.erase p, ( 1 : ℝ ) / q ) + ( 1 : ℝ ) / p by rw [ Finset.sum_erase_add _ _ hpE ] ] ) ) ( by linarith );
  have := countOddDFree_bonferroni_real E n ( fun p hp => hprimes p ( hE.1 hp ) ) ( fun p hp => hodd p ( hE.1 hp ) );
  refine le_trans ( Nat.cast_le.mpr <| countOddDFree_mono hE.1 n ) ?_;
  refine le_trans this ?_;
  exact add_le_add ( by nlinarith only [ show ( n : ℝ ) ≥ 0 by positivity, show sieveFun ( ∑ p ∈ E, 1 / ( p : ℝ ) ) ≤ 13 / 18 by exact sieveFun_le_of_ge_third hE.2.1 hE.2.2 ] ) ( pow_le_pow_left₀ ( by positivity ) ( by norm_cast; exact Nat.succ_le_succ <| Finset.card_le_card hE.1 ) 2 )

end
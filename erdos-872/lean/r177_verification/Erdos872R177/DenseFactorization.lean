import Erdos872R177.AnalyticDefs

namespace Erdos872

/-- The complementary factor after removing the maximal `K`-dense prefix. -/
noncomputable def tK (K : ℝ) (x : ℕ) : ℕ :=
  x / aK K x

/-- The dense prefix product divides the original integer. -/
theorem aK_dvd (K : ℝ) {x : ℕ} (hx : x ≠ 0) :
    aK K x ∣ x := by
  unfold aK
  have hd := (List.take_sublist (jK K x) x.primeFactorsList).prod_dvd_prod
  simpa only [Nat.prod_primeFactorsList hx] using hd

/-- Exact factorization into the dense prefix and complementary suffix. -/
theorem aK_mul_tK (K : ℝ) {x : ℕ} (hx : x ≠ 0) :
    x = aK K x * tK K x := by
  exact (Nat.mul_div_cancel' (aK_dvd K hx)).symm

private theorem prefixGood_zero (K : ℝ) (xs : List ℕ) :
    PrefixGood K xs 0 := by
  exact ⟨Nat.zero_le _, fun i ↦ Fin.elim0 i⟩

private theorem jK_le_length (K : ℝ) (x : ℕ) :
    jK K x ≤ x.primeFactorsList.length := by
  classical
  unfold jK
  exact Nat.findGreatest_le _

private theorem prefixGood_jK (K : ℝ) (x : ℕ) :
    PrefixGood K x.primeFactorsList (jK K x) := by
  classical
  unfold jK
  exact Nat.findGreatest_spec (Nat.zero_le _) (prefixGood_zero K _)

private theorem primeFactorsList_aK_eq (K : ℝ) (x : ℕ) :
    (aK K x).primeFactorsList = x.primeFactorsList.take (jK K x) := by
  let l := x.primeFactorsList.take (jK K x)
  have hperm : l.Perm l.prod.primeFactorsList := by
    apply Nat.primeFactorsList_unique rfl
    intro p hp
    exact Nat.prime_of_mem_primeFactorsList (List.mem_of_mem_take hp)
  have hsorted_l : l.SortedLE := by
    exact (Nat.primeFactorsList_sorted x).pairwise.take.sortedLE
  have hsorted_prod : l.prod.primeFactorsList.SortedLE :=
    Nat.primeFactorsList_sorted l.prod
  have heq : l = l.prod.primeFactorsList :=
    hperm.eq_of_sortedLE hsorted_l hsorted_prod
  simpa [aK, l] using heq.symm

private theorem primeFactorsList_sublist_prod_eq
    {x : ℕ} {l : List ℕ} (hl : List.Sublist l x.primeFactorsList) :
    l.prod.primeFactorsList = l := by
  have hperm : l.Perm l.prod.primeFactorsList := by
    apply Nat.primeFactorsList_unique rfl
    intro p hp
    exact Nat.prime_of_mem_primeFactorsList (hl.mem hp)
  have hsorted_l : l.SortedLE :=
    (Nat.primeFactorsList_sorted x).pairwise.sublist hl |>.sortedLE
  have hsorted_prod : l.prod.primeFactorsList.SortedLE :=
    Nat.primeFactorsList_sorted l.prod
  exact (hperm.eq_of_sortedLE hsorted_l hsorted_prod).symm

private theorem aK_pos (K : ℝ) (x : ℕ) : 0 < aK K x := by
  unfold aK
  apply List.prod_pos
  intro p hp
  exact Nat.pos_of_mem_primeFactorsList (List.mem_of_mem_take hp)

private theorem tK_eq_prod_drop (K : ℝ) {x : ℕ} (hx : x ≠ 0) :
    tK K x = (x.primeFactorsList.drop (jK K x)).prod := by
  have hsplit :
      aK K x * (x.primeFactorsList.drop (jK K x)).prod = x := by
    calc
      aK K x * (x.primeFactorsList.drop (jK K x)).prod =
          (x.primeFactorsList.take (jK K x)).prod *
            (x.primeFactorsList.drop (jK K x)).prod := by rfl
      _ = x.primeFactorsList.prod := List.prod_take_mul_prod_drop _ _
      _ = x := Nat.prod_primeFactorsList hx
  unfold tK
  exact Nat.div_eq_of_eq_mul_right (aK_pos K x) hsplit.symm

private theorem primeFactorsList_head?_eq_minFac {n : ℕ} (hn : 2 ≤ n) :
    n.primeFactorsList.head? = some n.minFac := by
  have heq : n = (n - 2) + 2 := by omega
  rw [heq, Nat.primeFactorsList_add_two]
  rfl

/-- The maximal initial factor block is itself `K`-dense. -/
theorem aK_KDense (K : ℝ) (x : ℕ) :
    KDense K (aK K x) := by
  rw [KDense, primeFactorsList_aK_eq]
  rcases prefixGood_jK K x with ⟨hj, hgood⟩
  intro i
  let i' : Fin (jK K x) := ⟨i, by
    simpa [List.length_take_of_le hj] using i.isLt⟩
  have hi := hgood i'
  simpa [i', List.take_take, Nat.min_eq_left (Nat.le_of_lt i'.isLt)] using hi

/-- If a suffix remains, its first prime lies beyond the dense-prefix threshold. -/
theorem minFac_tK_gt_of_one_lt
    {K : ℝ} {x : ℕ} (hx : 2 ≤ x) (ht : 1 < tK K x) :
    K * (aK K x : ℝ) < (Nat.minFac (tK K x) : ℝ) := by
  classical
  let xs := x.primeFactorsList
  let j := jK K x
  have hx0 : x ≠ 0 := Nat.ne_of_gt (by omega)
  have htDrop : tK K x = (xs.drop j).prod := by
    simpa [xs, j] using tK_eq_prod_drop K hx0
  have hjle : j ≤ xs.length := by
    simpa [xs, j] using jK_le_length K x
  have hjlt : j < xs.length := by
    by_contra hnlt
    have hjEq : j = xs.length := by omega
    have hdrop : xs.drop j = [] := by simp [hjEq]
    have : tK K x = 1 := by simp [htDrop, hdrop]
    omega
  have hfac : (tK K x).primeFactorsList = xs.drop j := by
    rw [htDrop]
    exact primeFactorsList_sublist_prod_eq (List.drop_sublist j xs)
  have hhead : (xs.drop j).head? = some (tK K x).minFac := by
    rw [← hfac]
    exact primeFactorsList_head?_eq_minFac (by omega)
  have hopt : xs[j]? = some (tK K x).minFac := by
    simpa using hhead
  have hminFac : xs.get ⟨j, hjlt⟩ = (tK K x).minFac := by
    have hopt' : some (xs.get ⟨j, hjlt⟩) = some (tK K x).minFac := by
      simpa [List.getElem?_eq_getElem, hjlt] using hopt
    exact Option.some.inj hopt'
  rcases prefixGood_jK K x with ⟨_, hgood⟩
  have hnotNext : ¬PrefixGood K xs (j + 1) := by
    simpa [xs, j, jK] using
      (Nat.findGreatest_is_greatest
        (P := PrefixGood K x.primeFactorsList)
        (Nat.lt_succ_self (jK K x)) (Nat.succ_le_of_lt (by simpa [xs, j] using hjlt)))
  have homitNotLe :
      ¬((xs.get ⟨j, hjlt⟩ : ℕ) : ℝ) ≤ K * ((xs.take j).prod : ℝ) := by
    intro homit
    apply hnotNext
    refine ⟨Nat.succ_le_of_lt hjlt, ?_⟩
    intro i
    by_cases hi : i.val < j
    · let i' : Fin j := ⟨i.val, hi⟩
      have hprev := hgood i'
      simpa [xs, j, i', List.take_take,
        Nat.min_eq_left (Nat.le_of_lt hi)] using hprev
    · have hieq : i.val = j := by omega
      have hiFin : i = ⟨j, Nat.lt_succ_self j⟩ := Fin.ext hieq
      subst i
      simpa using homit
  have homitStrict :
      K * ((xs.take j).prod : ℝ) < (xs.get ⟨j, hjlt⟩ : ℕ) :=
    lt_of_not_ge homitNotLe
  rw [← hminFac]
  simpa [aK, xs, j] using homitStrict

end Erdos872

import Erdos872R177.ConeProjection

namespace Erdos872

/-- A finite set closed under taking natural-number divisors. -/
def DivDownset (D : Finset ℕ) : Prop :=
  ∀ ⦃x y : ℕ⦄, x ∈ D → y ∣ x → y ∈ D

/-- A finite subset `U` of `D` closed upward under divisibility inside `D`. -/
def DivUpsetIn (D U : Finset ℕ) : Prop :=
  U ⊆ D ∧ ∀ ⦃x y : ℕ⦄, x ∈ U → y ∈ D → x ∣ y → y ∈ U

/-- The positive quotient board cut out by the cone with tag `t`. -/
def quotientCone (D : Finset ℕ) (N t : ℕ) : Finset ℕ :=
  (Finset.Icc 1 (N / t)).filter fun m ↦ t * m ∈ D

/-- A divisibility downset projects to a divisibility downset in every positive cone. -/
theorem quotientCone_downset
    {D : Finset ℕ} {N t : ℕ} (hD : DivDownset D) (ht : 0 < t) :
    DivDownset (quotientCone D N t) := by
  intro x y hx hyx
  rcases Finset.mem_filter.mp hx with ⟨hxIcc, hxD⟩
  rcases Finset.mem_Icc.mp hxIcc with ⟨hxOne, hxTop⟩
  have hxPos : 0 < x := by omega
  have hyPos : 0 < y := Nat.pos_of_dvd_of_pos hyx hxPos
  have hyxLe : y ≤ x := Nat.le_of_dvd hxPos hyx
  refine Finset.mem_filter.mpr ⟨Finset.mem_Icc.mpr ⟨?_, ?_⟩, ?_⟩
  · omega
  · exact hyxLe.trans hxTop
  · exact hD hxD ((coneProjection_internal ht).2 hyx)

/-- A global upset projects to an upset of the quotient cone. -/
theorem quotientCone_projected_upset
    {D U : Finset ℕ} {N t : ℕ} (hU : DivUpsetIn D U) (ht : 0 < t) :
    DivUpsetIn (quotientCone D N t) (quotientCone U N t) := by
  constructor
  · intro m hm
    rcases Finset.mem_filter.mp hm with ⟨hmIcc, hmU⟩
    exact Finset.mem_filter.mpr ⟨hmIcc, hU.1 hmU⟩
  · intro x y hx hy hxy
    rcases Finset.mem_filter.mp hx with ⟨_, hxU⟩
    rcases Finset.mem_filter.mp hy with ⟨hyIcc, hyD⟩
    refine Finset.mem_filter.mpr ⟨hyIcc, ?_⟩
    exact hU.2 hxU hyD ((coneProjection_internal ht).2 hxy)

/-- Multiplication by a positive cone tag is an order embedding for divisibility. -/
theorem quotientCone_internal_dvd
    {t m₁ m₂ : ℕ} (ht : 0 < t) :
    t * m₁ ∣ t * m₂ ↔ m₁ ∣ m₂ := by
  exact coneProjection_internal ht

end Erdos872

# Summary of changes for run a403f83c-ba7d-4122-81c3-59bd6b267819
I formalized the Shield Reduction Theorem from `shield_reduction.tex` in Lean 4 with Mathlib. The formalization is in `RequestProject/ShieldReduction.lean` and compiles without any `sorry` statements, using only standard axioms (`propext`, `Classical.choice`, `Quot.sound`).

## What was formalized

The file contains:

**Definitions** matching the paper:
- `setL n` — the lower set L = {2, ..., ⌊n/2⌋}
- `setU n` — the upper set U = {⌊n/2⌋+1, ..., n}
- `DivAntichain S` — S is a divisibility antichain (no element divides a distinct element)
- `upperShadow n x` — M(x), multiples of x in U
- `shadowWeight n x` — w_n(x) = |M(x)| - 1
- `shieldedL n P` — L(P), elements of L not dividing any element of P
- `beta n P` — β(P), the maximum weighted sum over divisibility antichains in L(P)

**Helper lemmas** corresponding to the paper's proof structure:
- `setL_setU_disjoint` — L and U are disjoint
- `icc_eq_setL_union_setU` — L ∪ U = {2, ..., n}
- `upperShadow_nonempty` — M(x) is nonempty for x ∈ L
- `claim1` — A ∩ L ⊆ L(P) (Claim 1 from the paper)
- `claim2_sub` / `claim2_sup` / `claim2` — A ∩ U = U \ ⋃_{x ∈ B} M(x) (Claim 2 from the paper)
- Various supporting lemmas for the counting argument

**Main theorem** (`shield_reduction`): If A is a maximal divisibility antichain in {2,...,n} containing P ⊆ U, then |U| ≤ |A| + β(P) (equivalently, |A| ≥ |U| - β(P)).

The theorem statement uses the additive form `(setU n).card ≤ A.card + beta n P` to avoid natural number subtraction truncation issues, which is mathematically equivalent to the paper's `|A| ≥ |U| - β(P)`.
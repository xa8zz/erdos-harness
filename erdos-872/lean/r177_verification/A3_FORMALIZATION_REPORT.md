# A3 formalization report

Date: 2026-07-30

Branch: `codex/lean-a3-formalization`

Verified proof-tree commit: `efc3a74b6001de40c0feede299e4f7789919b723`

## Result

The declaration `Erdos872.A3_exceptional_set_estimate` is now a theorem with
the identical type formerly used by the analytic-input axiom. The proof takes
`Cexc = 1` and does not depend on either remaining analytic axiom.

The frozen game-theoretic and main-theorem modules were not modified.

## Proof structure

1. An explicit Chebyshev bound controls the reciprocal-prime sum by
   `1.39 * log (log x)` eventually.
2. An exact finite-prime exponential moment bounds integers with many prime
   factors in a finite prime set.
3. The `K`-dense prefix inequalities force the first `r` factors below
   `ceil(K)^(2^r)`. Combining this with the moment estimate makes the
   `aK(x) > N^gamma` contribution have density tending to zero.
4. For the bounded-prefix contribution, periodic counting modulo
   `floor(z)!` gives a main density `totient(floor(z)!)/floor(z)!` and one
   fixed residue-block error. The inequality
   `totient(n) * sigma(n) <= n^2`, together with the harmonic-number bound,
   makes this density at most `1 / log z`.
5. Summing the rough complementary-factor fibers over `1 <= a <= A` produces
   the harmonic factor `1 + log A`; all fixed block errors are absorbed into
   the quantified epsilon term.
6. The small-integer, bounded-prefix, and large-prefix sets cover the encoded
   exceptional set, including its explicitly inserted element `1`.

## Lean modules and line counts

| Module | Lines |
| --- | ---: |
| `Erdos872R177/A3/PrimeReciprocal.lean` | 226 |
| `Erdos872R177/A3/FinitePrimeMoment.lean` | 345 |
| `Erdos872R177/A3/DensePrefixTail.lean` | 468 |
| `Erdos872R177/A3/CoprimeDensity.lean` | 195 |
| `Erdos872R177/A3/BoundedPrefix.lean` | 168 |
| `Erdos872R177/A3/ExceptionalSet.lean` | 122 |
| `Erdos872R177/AnalyticInputs.lean` | 34 |

The six new proof modules total 1,524 lines.

## Clean verification

The project build directory was removed before the authoritative build.
Mathlib's official binary cache was restored for the pinned dependency, and
all 42 project targets were then rebuilt from source. The final command
reported:

```text
Build completed successfully (8067 jobs).
```

The tracked project-tree audit for forbidden proof placeholders and trusted
shortcuts returned zero matches.

The verbatim final line produced by `#print axioms Erdos872.main` was:

```text
'Erdos872.main' depends on axioms: [propext, Classical.choice, Quot.sound]
```

## Deviations from manuscript section 2

- The bounded-prefix rough-number estimate uses a finite factorial-period
  sieve rather than expanding the manuscript's Selberg square weights. This
  is a specialization sufficient for A3: the parameters are fixed before
  `N` tends to infinity, so its finite residue-block error is absorbed by the
  quantified epsilon. It gives the same `1 / log z` main density and improves
  the displayed absolute constant to `Cexc = 1` for this encoding.
- The large-prefix tail is proved directly by the finite-prime Rankin moment
  and an explicit reciprocal-prime estimate. It does not invoke the
  manuscript's separate sparse-dense-components lemma or the corresponding
  analytic axiom.

No statement, quantifier, or exceptional-set encoding was changed.

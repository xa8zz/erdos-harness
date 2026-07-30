# A3 formalization plan

## Contract and baseline

The theorem statement is the existing type of
`Erdos872.A3_exceptional_set_estimate` in
`Erdos872R177/AnalyticInputs.lean`.  Its quantifiers and right-hand side are
frozen.

Fresh-worktree baseline from `origin/main` (`ecb0ffbfec31ff4913cf3fc3afde9f21c40cf5df`):

```text
$ lake build
Build completed successfully (8061 jobs).

$ lake env lean Erdos872R177/AxiomReport.lean
info: Erdos872R177/AxiomReport.lean:15:0: 'Erdos872.main' depends on axioms: [propext, Classical.choice, Erdos872.A3_exceptional_set_estimate, Quot.sound]
```

The baseline tree contains no `sorry`, `admit`, `native_decide`, or `unsafe`.

## Mathlib survey

Pinned Mathlib contains `Mathlib.NumberTheory.SelbergSieve`, but that module
currently supplies the abstract upper-sieve interface and the deduction from
upper Moebius weights; it does not supply the Selberg fundamental lemma or the
specific rough-number estimate used in manuscript Lemma 2.1.  Mathlib does
supply the ingredients used below: exact coprime counts over intervals,
factorization and p-adic valuation APIs, Abel summation, Chebyshev's explicit
upper bound, harmonic-number bounds, and real asymptotics.

## Proof decomposition

The exceptional set is split exactly as in manuscript section 2.

1. `x <= delta * N`: count directly, allowing an eventual `epsilon * N`
   boundary error (including the explicitly inserted vertex `1`).
2. `aK K x <= A`: write `x = a * t` using `aK_mul_tK`; the suffix is either
   `1` or has least prime factor greater than `K*a`.  For fixed `a`, count
   such suffixes by exact periodic coprimality modulo a factorial.  The Euler
   product is bounded by the harmonic sum, giving the required
   `1 / log K`; summing `1/a` for `a <= A` gives `1 + log A`.
3. `N^gamma < aK K x`: a `K`-dense prefix with `r` prime factors is at most
   `ceil(K)^(2^r)`.  Thus, for any fixed `r` and all sufficiently large `N`,
   this case forces at least `r` prime factors of `x` below that cutoff.
   A finite-prime exponential-moment estimate bounds the density of this
   event.  Chebyshev plus Abel summation shows that the relevant Euler product
   is exponentially smaller than the moment threshold because
   `log(4) * log(2) < 1`.  Letting `r` grow makes this contribution `o(1)`.

The third step is the same Rankin mechanism as manuscript Lemma 2.2, applied
directly to the dense prefix event.  It avoids introducing A1/A2 as proof
dependencies; using either project axiom would fail the final axiom criterion.

## Planned modules

- `A3/CoprimeSieve.lean`: periodic rough-number count and harmonic/Euler-product bound.
- `A3/PrimeReciprocal.lean`: Chebyshev/Abel upper bound for reciprocal primes.
- `A3/FinitePrimeMoment.lean`: finite-prime exponential moment and tail bound.
- `A3/DensePrefixTail.lean`: dense-prefix growth and the `o(N)` large-prefix count.
- `A3/ExceptionalSet.lean`: set split and exact A3 theorem.
- `AnalyticInputs.lean`: import the proof and replace only the A3 axiom declaration.

Every new lemma is developed by first compiling its exact statement with an
open goal, then closing that goal before proceeding.  No development holes may
remain in the final tree.

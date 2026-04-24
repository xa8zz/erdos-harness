---
id: R04-stability-no-go
type: verification
date: 2026-04-23
intent: >
  Literature audit of R03's codegree-kernel stability proposal against
  published results on K_4^(3)-free hypergraph extremal theory.
predecessors: [R03-codegree-kernel-stability]
action:
  kind: refutes
  target: R03-codegree-kernel-stability
claim: >
  The stability target proposed in R03 — that every K_4^(3)-free 3-graph
  with density >= (5/9 - delta) C(n, 3) is close in edit-distance to the
  cyclic 3-partite template — is ruled out by published results, conditional
  on Turán's conjecture pi(K_4^(3)) = 5/9. Kostochka (1982) and successor
  constructions by Brown, Fon-der-Flaass, and Frohmader produce
  exponentially many non-isomorphic K_4^(3)-free families of density
  approaching 5/9 that differ substantially in edit-distance from each
  other and from the cyclic template. Liu and Mubayi (Combinatorica 42
  (2022), 433-462, arXiv:1911.07969) proved the first hypergraph Turán
  family that provably lacks a classical stability theorem and noted that
  K_4^(3) itself exhibits this phenomenon assuming Turán's conjecture.
  The R03 spectral-clustering step B(x,y) = 2 - 3 d(x,y), B^2 approx B/3
  assumes near-extremal codegree kernels converge to the two-valued
  {1/3, 2/3} pattern of the cyclic construction, which the Kostochka
  family of extremal constructions violates. The codegree-kernel
  machinery does close a variant: Balogh, Clemen, and Lidický
  (J. London Math. Soc. 106 (2022), 60-84, arXiv:2108.10406)
  asymptotically solve the ℓ_2-norm problem max sum_{xy} d(x,y)^2 for
  K_4^(3)-free 3-graphs via flag algebras plus stability for that norm,
  but the classical ℓ_1 density problem is explicitly attributed to the
  "exponentially many conjectured extremal examples" that block classical
  stability.
failure_mechanism: >
  Multi-family near-extremal phenomenon. The Kostochka (1982) iterated-
  blow-up construction, plus subsequent constructions by Brown,
  Fon-der-Flaass, and Frohmader, give K_4^(3)-free 3-graphs of density
  approaching 5/9 that are not close in edit-distance to the cyclic
  3-partite template. Concretely, these alternative extremal families
  do not have codegree structures converging to the two-valued
  {1/3, 2/3} pattern of the cyclic construction. Any spectral-clustering
  argument on B(x,y) = 2 - 3 d(x,y) assuming B^2 approx B/3 will fail
  on near-extremal graphs drawn from these alternative families.
  Liu-Mubayi 2022 formalizes this by exhibiting the first proved
  non-stable hypergraph Turán family and explicitly observes K_4^(3)
  must be non-stable under Turán's conjecture. The R03 stability target
  as stated cannot hold; any proof of pi <= 5/9 via classical
  stability-plus-cleanup must handle all extremal families in the
  Kostochka family simultaneously, not just the cyclic one.
---

# Literature audit: codegree-kernel stability for K_4^(3) is conditionally refuted

## Summary

R03 proposed a codegree-kernel stability program to prove π(K_4^(3)) ≤ 5/9:
every near-extremal K_4^(3)-free graph admits a 3-partition close to the
cyclic template, recovered via the kernel B(x,y) = 2 − 3 d(x,y) with
B² ≈ B/3 → spectral clustering → three classes; then a cleanup argument on
the density polynomial closes the bound.

A short literature audit against published work rules out this approach at
the stability step, conditional on Turán's conjecture π = 5/9.

## Key references

**Liu, X. and Mubayi, D.**, *A hypergraph Turán problem with no stability*,
Combinatorica **42** (2022), 433–462,
[arXiv:1911.07969](https://arxiv.org/abs/1911.07969).

Constructs a finite triple-system family $\mathcal M$ whose extremal
problem has two non-isomorphic near-extremal constructions remaining far
apart in edit-distance — the first proved hypergraph Turán family that
fails classical stability. The abstract states:

> *"The classical constructions due to Kostochka imply that the notorious
> extremal problem for the tetrahedron exhibits this phenomenon assuming
> Turán's conjecture."*

**Kostochka (1982)** and successors **Brown**, **Fon-der-Flaass**, and
**Frohmader**: multiple non-isomorphic conjectured-extremal families of
K_4^(3)-free 3-graphs, all approaching density 5/9, not close in
edit-distance.

**Balogh, J., Clemen, F. C., and Lidický, B.**, *Solving Turán's
Tetrahedron Problem for the ℓ₂-Norm*, J. London Math. Soc. **106**
(2022), 60–84,
[arXiv:2108.10406](https://arxiv.org/abs/2108.10406).

Shows the codegree-kernel machinery does close the ℓ₂-norm variant
$\max \sum_{xy} d(x,y)^2$ over K_4^(3)-free 3-graphs. The technique has
real power, but specifically for the ℓ₂ functional where stability
holds. The classical ℓ₁ (density) problem remains open; the paper
attributes the difficulty to "exponentially many conjectured extremal
examples."

## Failure mechanism for R03 specifically

The spectral-recovery step B² ≈ B/3 assumes the codegree kernel of every
near-extremal K_4^(3)-free 3-graph converges to the two-valued pattern
{1/3, 2/3} characteristic of the cyclic 3-partite construction. The
Kostochka-Brown-Fon-der-Flaass-Frohmader constructions achieve density
approaching 5/9 with codegree structures that do NOT converge to this
pattern — they are not close to any 3-partition in edit-distance.
Spectral clustering would fail for near-extremal graphs drawn from
these families.

Any proof of π ≤ 5/9 via classical stability-plus-cleanup must
simultaneously handle the full Kostochka family, not just the cyclic
template. The R03 proposal as stated targets only the cyclic case and
is therefore structurally incomplete.

## Scope of the refutation

The refutation is **conditional on Turán's conjecture being correct**
(π = 5/9). If the true value is strictly above 5/9, the Kostochka-family
stability analysis is moot — but then the 5/9 upper-bound target R03
aims for is itself wrong. Either way, the R03 approach cannot close
π ≤ 5/9 via the specific stability-then-cleanup chain it proposes.

## Open routes after R03

- **Weak / averaged stability**: near-extremal graphs close to *some*
  member of the Kostochka family (not the cyclic template specifically),
  with a cleanup argument working across the full family.
- **Different functional**: the ℓ₂-norm variant is solved; other norms
  or weighted densities might be tractable and might bound π indirectly.
- **Non-structural routes**: bypass stability entirely via counting,
  supersaturation, or entropy arguments that do not assume a unique
  near-extremal structure.

None of these have been shown to close π ≤ 5/9; they are the remaining
candidates after R03 is ruled out.

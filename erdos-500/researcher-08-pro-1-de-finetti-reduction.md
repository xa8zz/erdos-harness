---
id: R08-pro-1-de-finetti-reduction
type: research
date: 2026-04-23
intent: >
  Prove, refute, or reduce the R07 high-density local non-realizability
  sublemma for K_4^(3)-free 3-graphs.
predecessors: [R07-localized-separator-attempt]
action:
  kind: extends
  target: R07-localized-separator-attempt
claim: >
  Refutes the R07 sublemma as stated and supplies the correct finite
  reformulation. Containment refutation: L_q(c) subset P_q(c) by
  construction, so if any mu in L_q(c) exists, it also lies in P_q(c),
  and the demanded Phi_q(mu) <= 0 AND Phi_q(mu) > 0 is a contradiction
  unless L_q(c) = empty, which is equivalent to π(K_4^(3)) < c. So the
  sublemma as stated is not a weaker target; it is a finite-coordinate
  restatement of the desired Turán bound.
  
  Correct reformulation via de Finetti / finite extendibility. Let
  S = {0,1}^3 \ {(1,1,1)} with |S| = 7. For an actual K_4^(3)-free
  limit rooted at an edge, conditional i.i.d. of column variables
  C_i in S gives that the symmetrized q-profile u_k has the de Finetti
  form u_k = (q choose k) integral prod theta_s^{k_s} d alpha(theta)
  for some probability measure alpha on the 6-simplex Delta(S). This
  is the infinite-exchangeable cone E_q^(infinity), which is the
  degree-q truncated moment cone. For m >= q, define the finite
  m-extendible cone E_q^(m) as the set of q-marginals of exchangeable
  laws on S^m; in occupancy coordinates E_q^(m) is a rational polytope
  with (m + 6 choose 6) extreme points.
  
  Key lemma (proved): E_q^(infinity) = cap_{m >= q} E_q^(m). One
  inclusion is immediate; the reverse uses compactness of Delta(S) +
  uniform convergence of the hypergeometric occupancy kernel to the
  multinomial kernel as m -> infinity with theta = n/m.
  
  Sharp finite reduction: find q, m, rational c in (5/9, 0.5611) such
  that P_q(c) cap E_q^(m) = empty. By compactness and nesting of
  E_q^(m), if P_q(c) cap E_q^(infinity) = empty then
  P_q(c) cap E_q^(m) = empty for some finite m. After clearing the
  edge-density denominator, strict disjointness with positive margin
  gives a rational linear separator (since P_q(c) is a compact convex
  spectrahedral shadow and E_q^(m) is a rational polyhedral cone).
  
  Implication: if for every q, m the high-density pseudo-profiles
  remain inside E_q^(m), then no argument based only on the one-edge
  conditional i.i.d. column process can beat the 0.5611 plateau; any
  successful separator would have to use extra compatibility between
  the column law and other flag coordinates, not just higher-q de
  Finetti moment constraints.
prompt: erdos-500/prompts/researcher-08-high-density-non-realizability-sublemma.md
---

I can refute the literal sublemma as a genuinely weaker target, and then give a clean finite reduction for the de Finetti route.

Let

X
≥c
:={x∈X:d(x)≥c},

where d is edge density, and let ℓ
q
	

 be the rooted-edge q-column profile map. Then

L
q
	

(c)=ℓ
q
	

(X
≥c
).

Because X is compact and d is continuous, X
≥c

=∅ iff max
x∈X
	

d(x)≥c, and that maximum is π(K
4
(3)
	

). So

L
q
	

(c)

=∅⟺π(K
4
(3)
	

)≥c.

Since by construction L
q
	

(c)⊆P
q
	

(c), any Φ
q
	

 with

Φ
q
	

≤0 on L
q
	

(c),Φ
q
	

>0 on P
q
	

(c)

forces L
q
	

(c)=∅, hence π<c. Conversely, if π<c, then L
q
	

(c)=∅ for every q. So, modulo the exact-certificate language, the stated sublemma is not really weaker than proving π<c; it is a finite-coordinate restatement of that conclusion.

The meaningful version is to replace L
q
	

(c) by an explicit outer set coming from the conditional i.i.d. column structure.

Write

S:={0,1}
3
∖{111},

so ∣S∣=7. For a rooted edge abc, each outside vertex contributes a column C
i
	

∈S. After symmetrizing in the q outside vertices, the law is determined by the occupancy probabilities

u
k
	

,k=(k
s
	

)
s∈S
	

∈N
S
,
s∈S
∑
	

k
s
	

=q,

where u
k
	

 is the probability that among C
1
	

,…,C
q
	

, each pattern s appears exactly k
s
	

 times.

For an actual K
4
(3)
	

-free limit, conditional i.i.d. gives

u
k
	

=(
k
q
	

)∫
Δ(S)
	

s∈S
∏
	

θ
s
k
s
	

	

dα(θ),

for some probability measure α on the 6-simplex Δ(S). Call the set of all such u the infinite-exchangeable cone E
q
(∞)
	

. This is exactly the degree-q truncated moment cone of the simplex.

Now define, for m≥q, the finite m-extendible cone E
q
(m)
	

: the set of q-marginals of exchangeable laws on S
m
. In occupancy coordinates,

E
q
(m)
	

=conv{u
(n)
:n∈N
S
, 
s
∑
	

n
s
	

=m},

where

u
k
(n)
	

=
(
q
m
	

)
∏
s∈S
	

(
k
s
	

n
s
	

	

)
	

.

So E
q
(m)
	

 is a rational polytope. The ambient symmetric coordinate count is

(
6
q+6
	

),

and the number of histogram points is

(
6
m+6
	

).

For example, q=8 gives 3003 symmetric coordinates, and m=10 gives 8008 histogram points.

The key lemma is

E
q
(∞)
	

=
m≥q
⋂
	

E
q
(m)
	

.

One inclusion is immediate: if

u
k
	

=(
k
q
	

)∫
s
∏
	

θ
s
k
s
	

	

dα(θ),

then for every m the exchangeable law ∫θ
⊗m
dα(θ) on S
m
 has q-marginal u, so u∈E
q
(m)
	

.

For the reverse inclusion, suppose u∈E
q
(m)
	

 for every m. For each m, pick an exchangeable law on S
m
 with q-marginal u. By exchangeability, it is a mixture over histograms n, hence a mixture of the hypergeometric vertices u
(n)
. Push the mixing measure forward to histogram proportions n/m∈Δ(S). By compactness of Δ(S), a subsequence converges weakly to some α. For fixed q, the hypergeometric occupancy kernel converges uniformly to the multinomial kernel:

(
q
m
	

)
∏
s
	

(
k
s
	

n
s
	

	

)
	

⟶(
k
q
	

)
s
∏
	

θ
s
k
s
	

	

when θ=n/m.

Passing to the limit gives

u
k
	

=(
k
q
	

)∫
s
∏
	

θ
s
k
s
	

	

dα(θ),

so u∈E
q
(∞)
	

.

That yields the crisp finite reduction.

If

P
q
	

(c)∩E
q
(∞)
	

=∅,

then because the E
q
(m)
	

 are nested compact sets,

P
q
	

(c)∩E
q
(m)
	

=∅

for some finite m. Otherwise the nonempty compact sets P
q
	

(c)∩E
q
(m)
	

 would be nested for all m, hence have nonempty intersection, contradicting disjointness from E
q
(∞)
	

.

So the de Finetti/conditional-exchangeability route reduces exactly to:

Does there exist q,m, c∈(5/9,0.5611) such that P
q
	

(c)∩E
q
(m)
	

=∅?
	


Equivalently: does every pseudo-feasible rooted-edge q-column law at density ≥c fail finite m-extendibility as an exchangeable 7-color process?

This is the right finite open sub-sub-lemma. It is stronger than the literal L
q
	

(c)-version and genuinely non-vacuous.

One technical note: because conditioning on a rooted edge divides by the edge density, convexity is cleanest after clearing that denominator, exactly as in your setup. In those homogenized coordinates the pseudo-feasible set is a compact convex spectrahedral shadow, E
q
(m)
	

 becomes a rational polyhedral cone, and strict disjointness gives a strict linear separator. Since the margin is positive and the polytope side is rational, the separator can be taken rational after a small perturbation. So any successful de Finetti obstruction can be made into a rational linear certificate.

So my answer is:

The literal sublemma is not a weaker target; semantically it is just π<c.
The sharp finite reformulation is finite m-extendibility of the 7-state rooted-edge column process.
Therefore the next clean question is whether some pseudo-feasible plateau profile lies outside E
q
(m)
	

 for finite q,m.

If that fails for every q,m, then no argument based only on the one-edge conditional i.i.d. column process can beat the 0.5611 plateau; any successful separator would have to use extra compatibility between the column law and other flag coordinates, not just higher-q de Finetti moment constraints.

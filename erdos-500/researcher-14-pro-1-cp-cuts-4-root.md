---
id: R14-pro-1-cp-cuts-4-root
type: research
date: 2026-04-24
intent: >
  Fresh-thread state-zoom-out dispatch asking the most likely concrete
  object to produce a rigorous upper bound pi(K_4^(3)) < 0.5611.
predecessors: [R12-augmented-sdp-no-improvement, R08-pro-1-de-finetti-reduction]
action:
  kind: extends
  target: R12-augmented-sdp-no-improvement
claim: >
  Recommends a tactical shift: increase root width, not outside depth.
  Concrete proposal: use 4-vertex-rooted, q=2 column complete-positivity
  cuts instead of edge-rooted (3-vertex) larger-q cuts. The two useful
  rooted 4-types are F = B_2 (2-edge book, e.g. edges 123, 124) and
  F = B_3 (3-edge open tetrahedron / K_4^(3) minus one edge, e.g.
  123, 124, 134, missing 234). For an outside vertex x, the column
  relative to the four root vertices is the 6-bit vector
  col_F(x) = (1[12x in E], 1[13x in E], 1[14x in E], 1[23x in E],
  1[24x in E], 1[34x in E]). K_4^(3)-freeness restricts the alphabet
  to A_F = {alpha in {0,1}^6 : alpha_ij alpha_ik alpha_jk = 0 for every
  rooted edge ijk in E(F)}, with |A_{B_2}| = 50 and |A_{B_3}| = 45.
  
  The structural sublemma to exploit: for every actual K_4^(3)-free
  limit and every rooted 4-type F, the two-outside-vertex pair-column
  matrix M_F(alpha, beta) = Pr[col_F(x) = alpha, col_F(y) = beta | F]
  lies in the completely positive cone CP(A_F): there exists a measure
  mu on Delta(A_F) with M_F = E_mu[mu mu^T]. Equivalently, every
  copositive matrix C over A_F gives a valid linear inequality
  sum C_{alpha, beta} M_F(alpha, beta) >= 0 on actual limits. After
  multiplying by p(F), this is a 6-vertex linear inequality in flag
  densities — same flag order as the existing edge-root q=3 setup,
  but the column alphabet jumps from 7 to 45 or 50.
  
  Why this is likely to escape the bounded-order plateau: ordinary
  flag-square SDP only enforces M_F psd plus entrywise nonnegativity
  (the doubly-nonnegative cone). For dimensions 45 and 50,
  CP(A_F) is strictly contained in the doubly-nonnegative cone. So
  the plateau pseudo-moment may be doubly nonnegative but not
  completely positive at 4-vertex roots — exactly the kind of
  obstruction bounded-order flag-square SDP misses. Avoids the
  classical-stability trap because it does not require recovering a
  unique near-extremal structure: Kostochka / Brown / Fon-der-Flaass
  / Frohmader extremal families all satisfy it.
  
  Concrete finite-certificate version. Define E_{2, Q}(A) as the
  set of 2-marginals of exchangeable laws on A^Q, with vertices indexed
  by occupancy vectors N in N^A, sum N_alpha = Q, and 2-marginal
  h_N(alpha, beta) = N_alpha (N_beta - 1[alpha = beta]) / (Q (Q - 1)).
  E_{2, Q}(A) = conv{h_N}. Every actual rooted-column pair profile
  lies in E_{2, Q}(A) for every Q >= 2. Any rational matrix C with
  sum C_{alpha, beta} h_N(alpha, beta) >= 0 for every occupancy N
  gives a valid inequality on actual limits, suitable for the
  augmented-SDP soundness theorem. First parameters to try:
  Q in {4, 5, 6} for both F = B_2 and F = B_3.
  
  Practical shortcut: search over small supports inside A_F (5-state
  or 6-state subsets) and test embedded exceptional copositive forms
  (Horn / odd-cycle-type). Such restricted searches can expose
  violations before solving the full 45/50-state separation LP.
  
  Final certificate target form for proving pi < 0.5611:
  c - d = sum SOS_ell + lambda sum_{alpha, beta} C_{alpha, beta}
  p(F, alpha, beta) + sum R_m, with lambda >= 0, C verified
  rationally by the finite-extendibility inequalities. Target margin
  is small (0.56166560 - 0.5611 = 0.00056560), so one or a small
  number of strong non-SOS actuality cuts could plausibly suffice.
prompt: erdos-500/prompts/researcher-13-state-zoom-out.md
---

The most promising route is not another single-edge q-column separator. I would go after a wide-root, shallow-column de Finetti constraint: root a 4-vertex core, especially a 2-edge book or a 3-edge K
4
(3)
	

-minus-one-edge, and impose complete-positivity / finite-extendibility constraints on the two outside-vertex column profile.

In one line:

Use 4-root, q=2 column complete-positivity cuts, not 3-root, larger-q cuts.
	


This is the most likely object to cut the 0.5611-plateau pseudo-solution while remaining low-order enough to certify exactly.

The structural object

Fix a labeled K
4
(3)
	

-free 4-vertex rooted type F. The useful cases are:

F=B
2
	

: a 2-edge book, e.g. edges 123,124;
F=B
3
	

: a 3-edge open tetrahedron, e.g. edges 123,124,134, missing 234.

For an outside vertex x, record its column relative to the four roots:

col
F
	

(x)=(1
12x
	

,1
13x
	

,1
14x
	

,1
23x
	

,1
24x
	

,1
34x
	

)∈{0,1}
6
.

Not every 6-bit pattern is allowed. If T∈E(F), then x cannot complete a K
4
(3)
	

 with the rooted edge T. Thus for every rooted edge ijk∈E(F),

1
ijx
	

1
ikx
	

1
jkx
	

=0.

So the allowed column alphabet is

A
F
	

={α∈{0,1}
6
:α
ij
	

α
ik
	

α
jk
	

=0 for every ijk∈E(F)}.

For the two relevant 4-root types,

∣A
B
2
	

	

∣=50,∣A
B
3
	

	

∣=45.

That is the key: the alphabet is large enough that the complete-positive cone is much stronger than the PSD cone used by ordinary flag-square arguments.

The sublemma I would try to exploit

Let W be any actual K
4
(3)
	

-free limit. Condition on a random labeled rooted copy of F. For two random outside vertices x,y, define

M
F
	

(α,β)=Pr[col
F
	

(x)=α,col
F
	

(y)=β∣F].

Then

M
F
	

∈CP(A
F
	

)
	


where CP(A
F
	

) is the completely positive cone:

M
F
	

=E
μ
	

[μμ
T
],μ∈Δ(A
F
	

).

Equivalently, for every copositive matrix C on A
F
	

,

α,β∈A
F
	

∑
	

C
αβ
	

M
F
	

(α,β)≥0.

Multiplying by the rooted density p(F), this becomes a linear finite-coordinate inequality in 6-vertex flag densities:

α,β∈A
F
	

∑
	

C
αβ
	

p(F,α,β)≥0.
	


Here p(F,α,β) is the probability that a random labeled 6-tuple has root F, first outside column α, and second outside column β, after summing over the four triples containing both outside vertices.

This is a valid inequality for every actual K
4
(3)
	

-free limit, but it is not generally a flag-square/SOS inequality.

Why this is likely to escape the plateau

Ordinary bounded-order flag algebra sees, for a rooted type F, inequalities of the form

a
T
M
F
	

a≥0,

so it enforces roughly

M
F
	

⪰0.

It also sees entrywise nonnegativity of densities. But actuality gives the stronger condition

M
F
	

∈CP(A
F
	

),

and for dimensions 45 and 50,

CP(A
F
	

)⊊{M⪰0, M
αβ
	

≥0}.

So the plateau pseudo-moment may well be “doubly nonnegative but not completely positive” around 4-vertex roots. That is exactly the kind of obstruction bounded-order flag-square SDP misses.

This also avoids the classical-stability trap. The inequality does not say “the graph must look like the cyclic construction.” It only says: around every rooted 4-core, outside columns must arise from an actual exchangeable vertex process. Kostochka/Brown–Fon-der-Flaass/Frohmader-type extremal families still satisfy it.

Why 4-root q=2 is better than edge-root larger q

The already-tested edge-root profile uses root size 3, column alphabet size 7, and q=3. That lives on 6 vertices.

The proposed object also lives on 6 vertices:

4 roots+2 outside vertices=6,

but the column alphabet jumps from 7 to 45 or 50. So one gets a much richer actuality constraint without increasing the flag order.

This is the important tactical shift:

Increase root width, not outside depth.
	


Single-edge q=4 would require order 7. A 4-root q=2 complete-positivity cut is already order 6, yet probes a much higher-dimensional de Finetti cone.

Concrete finite-certificate version

Instead of trying to certify full copositivity directly, use finite extendibility.

For a fixed alphabet A=A
F
	

, define E
2,Q
	

(A) as the set of pair marginals of exchangeable laws on A
Q
. Its vertices are indexed by occupancy vectors

N=(N
α
	

)
α∈A
	

,N
α
	

∈N,
α∈A
∑
	

N
α
	

=Q.

The corresponding 2-marginal is

h
N
	

(α,β)=
Q(Q−1)
N
α
	

(N
β
	

−1
α=β
	

)
	

.

Thus

E
2,Q
	

(A)=conv{h
N
	

:
α
∑
	

N
α
	

=Q}.

Every actual rooted-column pair profile lies in E
2,Q
	

(A) for every Q≥2. Therefore, any rational matrix C satisfying

α,β
∑
	

C
αβ
	

h
N
	

(α,β)≥0

for every occupancy vector N gives a valid inequality

α,β
∑
	

C
αβ
	

p(F,α,β)≥0.

This is exactly compatible with the augmented-SDP soundness theorem in your setup.

The actual search I would run

Take the order-6 or order-7 plateau pseudo-moment y
∗
. For each rooted 4-type F=B
2
	

,B
3
	

, compute the normalized projected matrix

M
F
∗
	

(α,β)=
p
∗
(F)
p
∗
(F,α,β)
	

.

Then solve a separation problem:

find C

such that

⟨C,h
N
	

⟩≥0for all occupancy vectors N

but

⟨C,M
F
∗
	

⟩<0.

If such a C is found, rationalize it and add the unnormalized inequality

α,β
∑
	

C
αβ
	

p(F,α,β)≥0

to the SDP.

The first values I would try are

Q=4,5,6

for F=B
2
	

 and F=B
3
	

. Even Q=4 has many more potential cuts than the edge-root q=3,Q=4 test because the alphabet has size 45 or 50, not 7.

A practical shortcut is to search over small supports inside A
F
	

, especially 5- or 6-state subsets, and test embedded exceptional copositive matrices, such as Horn/odd-cycle-type copositive forms. That can expose a violation before solving the full 45- or 50-state separation LP.

What the final certificate would look like

A successful certificate would have the form

c−d=
ℓ
∑
	

SOS
ℓ
	

+λ
	

α,β
∑
	

C
αβ
	

p(F,α,β)
	

+
m
∑
	

R
m
	

,

with

λ≥0,

and with C verified rationally by the finite-extendibility inequalities

⟨C,h
N
	

⟩≥0∀N, 
α
∑
	

N
α
	

=Q.

If the resulting SDP gives

c<0.5611,

then this proves

π(K
4
(3)
	

)<0.5611.

The target improvement over 0.56166560 is only about

0.56166560−0.5611=0.00056560,

so one or a small number of strong non-SOS actuality cuts could plausibly be enough.

My strongest recommendation

The concrete sublemma/object to pursue is:

4-rooted column complete-positivity for 2-edge and 3-edge rooted cores.
	


More explicitly:

For every actual K
4
(3)
	

-free limit and every rooted 4-vertex type F, the two-outside-vertex column matrix relative to F lies in the completely positive cone over the allowed column alphabet A
F
	

. Therefore every rational finite-extendibility or copositive separator for A
F
	

 gives a valid 6-vertex linear inequality that can be added to the flag SDP.

This is the most plausible way to beat the bounded-order plateau because it attacks the pseudo-moment’s likely failure of actual conditional exchangeability, rather than trying to recover a false unique extremal structure.

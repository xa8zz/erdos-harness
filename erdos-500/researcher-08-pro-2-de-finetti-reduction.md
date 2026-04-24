---
id: R08-pro-2-de-finetti-reduction
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
  Refutes the R07 sublemma as stated by the same containment argument
  as R08-pro-1: L_q(c) subset P_q(c) forces contradictory sign-
  separation unless L_q(c) = empty, equivalent to π < c, which hides
  the entire difficulty inside proving L_q(c) = empty. With a known
  upper bound c < 0.5611 the formal separator could even be taken as
  the constant function Phi_q == 1, making the problem as written
  vacuous.
  
  Sharper non-vacuous sub-sub-lemma via the de Finetti moment cone.
  State space S = {0,1}^3 \ {(1,1,1)}, |S| = 7. Define
  D_q = conv{nu^{otimes q} : nu in Delta(S)}, the set of symmetric
  q-column profiles realizable as mixtures of i.i.d. products. Every
  actual q-column profile lies in D_q by conditional i.i.d. Meaningful
  linear certificate: find rational a_n, epsilon > 0 such that
  sum_n a_n m_n <= -epsilon for every m in D_q AND
  sum_n a_n m_n >= epsilon for every m in P_q(c), where P_q(c) is the
  pseudo-feasible flag-algebra profile set at density >= c. The first
  condition is a polynomial nonpositivity statement
  f(p) = sum_n a_n (q choose n) prod_s p_s^{n_s} <= -epsilon on
  Delta(S), certifiable by rational SOS / Handelman / Polya / cellwise
  rational certificates. The second is an SDP-dual flag-algebra
  certificate. After clearing the conditioning denominator by
  u_n = d m_n, the second inequality becomes the linear flag inequality
  sum_n a_n u_n - epsilon d >= 0 for d >= c.
  
  Finite version via the Q-extendibility polytope E_{q, Q}: for
  N in N^S with sum N_s = Q, q-profile m lies in E_{q, Q} iff there
  exist weights z_N >= 0, sum z_N = 1, with
  m_n = sum_N z_N (Q choose q)^{-1} prod (N_s choose n_s). Every
  actual profile lies in E_{q, Q} for every Q >= q (sample Q outside
  vertices then marginalize). Hierarchy: E_{q, Q+1} subset E_{q, Q},
  cap_{Q >= q} E_{q, Q} = D_q.
  
  Crisp sub-sub-lemma: find q, Q, c in Q with 5/9 < c < 0.5611 such
  that P_q(c) cap E_{q, Q} = empty with rational separation margin.
  Equivalently, exhibit rational a_n and Q such that
  sum_n a_n (Q choose q)^{-1} prod (N_s choose n_s) <= -epsilon for
  every N with sum N_s = Q, AND the flag-SDP dual proves
  sum_n a_n m_n >= epsilon for every pseudo-feasible profile in
  P_q(c). If proved, π(K_4^(3)) < c follows. This avoids the R07
  circularity and isolates the real computational obstruction:
  whether high-density pseudo-solutions survive all finite
  exchangeability / extendibility constraints on the 7 allowed
  column states.
prompt: erdos-500/prompts/researcher-08-high-density-non-realizability-sublemma.md
---

The stated separator cannot exist in any non-vacuous sense. The obstruction is purely set-theoretic:

L
q
	

(c)⊆P
q
	

(c).

So if there is even one actual K
4
(3)
	

-free limit of density ≥c, with profile μ∈L
q
	

(c), then the requested inequalities force

Φ
q
	

(μ)≤0andΦ
q
	

(μ)>0,

because the same μ also belongs to P
q
	

(c). Contradiction.

Thus the proposed sign-separation is possible only when

L
q
	

(c)=∅.

Since L
q
	

(c) is the projection of the compact set of actual limits with edge density ≥c, this is equivalent to saying that there are no actual K
4
(3)
	

-free limits of density ≥c, i.e.

π(K
4
(3)
	

)<c.

So, set-theoretically, the open question is equivalent to proving some rational upper bound

π(K
4
(3)
	

)<c<0.5611.

If such a c were already known, the formal separator could be taken to be the constant function Φ
q
	

≡1, because the condition on L
q
	

(c) would be vacuous. That shows the problem as written hides the entire difficulty inside the certificate that L
q
	

(c)=∅. It is not really a finite-coordinate separation problem between actual and pseudo profiles; it is a restatement of the desired upper bound.

A crisper non-vacuous sub-sub-lemma is to replace the unknown set L
q
	

(c) by an explicit superset forced by conditional exchangeability.

Let

S={0,1}
3
∖{111},∣S∣=7.

For an actual limit rooted at an edge abc, the column variables

C
i
	

∈S

are conditionally i.i.d. Hence every actual q-column profile lies in the de Finetti moment cone

D
q
	

=conv{ν
⊗q
:ν∈Δ(S)}.

Equivalently, in count coordinates n=(n
s
	

)
s∈S
	

, ∑
s
	

n
s
	

=q, a profile m=(m
n
	

) lies in D
q
	

 iff

m
n
	

=(
n
q
	

)∫
Δ(S)
	

s∈S
∏
	

p
s
n
s
	

	

dα(p)

for some probability measure α on the simplex Δ(S).

So a meaningful sufficient certificate would be:

P
q
	

(c)∩D
q
	

=∅

with positive rational margin.

Because P
q
	

(c) is convex and compact, and D
q
	

 is convex and compact, linear separation is enough. One can ask for rational coefficients a
n
	

 and ϵ>0 such that

n
∑
	

a
n
	

m
n
	

≤−ϵfor every m∈D
q
	

,

but

n
∑
	

a
n
	

m
n
	

≥ϵfor every m∈P
q
	

(c).

The first inequality is an explicit polynomial nonpositivity statement on the 6-simplex:

f(p)=
n
∑
	

a
n
	

(
n
q
	

)
s∈S
∏
	

p
s
n
s
	

	

≤−ϵ∀p∈Δ(S),

which is exactly the sort of thing that could be certified by rational SOS, Handelman, Pólya, or cellwise rational certificates. The second inequality is an SDP-dual flag-algebra certificate over the pseudo-feasible high-density region. After clearing the conditioning denominator by writing u
n
	

=dm
n
	

, it becomes the linear flag inequality

n
∑
	

a
n
	

u
n
	

−ϵd≥0whenever d≥c.

An even more finite version avoids the continuous simplex. For Q≥q, define the finite Q-extendibility polytope E
q,Q
	

 as follows. Let N=(N
s
	

)
s∈S
	

, ∑
s
	

N
s
	

=Q. A q-profile m lies in E
q,Q
	

 if there are weights z
N
	

≥0, ∑
N
	

z
N
	

=1, such that

m
n
	

=
N
∑
	

z
N
	

(
q
Q
	

)
∏
s∈S
	

(
n
s
	

N
s
	

	

)
	

.

Every actual profile lies in E
q,Q
	

 for every Q≥q, because one may sample Q outside vertices around the same rooted edge and then marginalize to q. The hierarchy satisfies

E
q,Q+1
	

⊆E
q,Q
	

,
Q≥q
⋂
	

E
q,Q
	

=D
q
	

.

So the crisp finite certificate becomes:

Find q,Q,c,ϵ and rational a
n
	

 such that

n
∑
	

a
n
	

(
q
Q
	

)
∏
s∈S
	

(
n
s
	

N
s
	

	

)
	

≤−ϵfor every N, 
s
∑
	

N
s
	

=Q,

and a rational flag-SDP dual certificate proves

n
∑
	

a
n
	

m
n
	

≥ϵfor every pseudo-feasible profile in P
q
	

(c).

Then any actual limit of density ≥c would produce a profile lying simultaneously in P
q
	

(c) and E
q,Q
	

, giving both ≥ϵ and ≤−ϵ, a contradiction. Hence

π(K
4
(3)
	

)<c.

That is the cleaner sub-sub-lemma:

Find q,Q,c∈Q, 5/9<c<0.5611, such that P
q
	

(c)∩E
q,Q
	

=∅ with rational separation margin.
	


This avoids the circularity of separating L
q
	

(c) from a set that contains it. It also isolates the real mathematical/computational obstruction: whether high-density pseudo-solutions survive all finite exchangeability/extendibility constraints on the seven allowed column states.

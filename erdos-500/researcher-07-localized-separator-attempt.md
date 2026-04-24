---
id: R07-localized-separator-attempt
type: research
date: 2026-04-23
intent: >
  Verify-and-attempt dispatch on the localized realizability separator
  approach: is the R06 sufficiency claim sound, and can a concrete
  separator be exhibited or ruled out?
predecessors: [R06-paradigm-tractability-assessment]
action:
  kind: extends
  target: R06-paradigm-tractability-assessment
claim: >
  Corrects and refines the localized-realizability-separator program.
  The R06 sufficiency claim — "to beat 0.5611 it suffices to separate the
  SDP pseudo-extremizer rho* from actual K_4^(3)-free limits" — is FALSE
  as stated. Phi(rho*) > 0 proves rho* is non-realizable but does not
  give a Turán upper bound; other pseudo-solutions in the optimal SDP
  face, or actual high-density limits, could still satisfy Phi <= 0.
  Toy model: actual set A = {(0.55, 0), (0.5611, 0)}, pseudo-point
  rho* = (0.5611, 1); Phi(rho*) > 0 and Phi <= 0 on A, but actual max
  is still 0.5611. Correct statement (proved): if one certifies (with
  exact rational/SOS/flag-algebra verification) that
  sup {d(y) : y in P_r, Phi_j(y) <= 0 for all j} <= c with c < 0.5611,
  then pi(K_4^(3)) <= c. Schematic certificate: c - d = sum SOS_ell +
  sum Q_j (-Phi_j) + sum R_m with R_m the known K_4^(3)-free relations.
  Subtlety (a) — Aldous-Hoover: in the full pair-coordinate 3-uniform
  hypergraphon model, "K_4^(3)-free limit" and "limit of K_4^(3)-free
  finite 3-graphs" coincide, so the subtlety is harmless. Subtlety (b)
  — pseudo-extremizer non-uniqueness: is serious; the optimal SDP face
  F_r may contain many points, so a separator must eliminate the WHOLE
  high-density pseudo-face, not one selected vector. Also, different
  higher-order extensions of rho* may give different Phi values unless
  Phi depends only on available coordinates. Subtlety (c) — denominators:
  sound if implemented as a finite cell decomposition on closed cells
  {D_i >= eta_i} vs {D_i <= eta_i} with separate polynomial/SOS
  certificates per cell; the R06 schematic d - c <= sum D_i SOS_i has
  the wrong sign for an upper bound (upper bound wants c - d >= 0).
  Proves a finite-projection no-go / criterion theorem: for a finite
  coordinate map p_r : X -> R^N with image X_r = p_r(X) and pseudo
  projection y* in R^N, (i) if y* in X_r then no r-local separator
  exists because y* is realized by some actual limit in those
  coordinates; (ii) if y* not in X_r then a nonlinear continuous
  separator always exists via the quadratic
  Phi(y) = delta^2/2 - ||y - y*||^2 where delta = dist(y*, X_r) > 0,
  though not necessarily with a useful rational flag-SOS certificate;
  (iii) for LINEAR flag inequalities, a separator exists iff
  y* not in conv(X_r). Core structural implication: the pseudo-moment
  phenomenon may be genuinely projective — every bounded local
  projection could look realizable while no global compatible actual
  limit exists. Notes that the raw link-neighborhood condition
  N(a,b) cap N(a,c) cap N(b,c) = empty for edges is already a 4-vertex
  K_4^(3)-free relation captured by any bounded-order SDP, so a
  separator must use higher-order consistency (e.g. conditional-
  exchangeability / de Finetti inequalities on column variables
  C_i = (1_{abx_i in E}, 1_{acx_i in E}, 1_{bcx_i in E}) for random
  outside vertices x_1, ..., x_q rooted at edge abc) rather than
  single-vertex triple-intersection bounds. Low-order de Finetti
  inequalities are already in standard flag algebra; a new separator
  must exploit higher-order truncated moment/extendibility constraints.
  Reduces the whole program to a single crisply stated open sublemma.
  HIGH-DENSITY LOCAL NON-REALIZABILITY SUBLEMMA: there exist q, a
  rational c < 0.5611, and a finite-coordinate function Phi_q such that
  Phi_q(mu) <= 0 for all mu in L_q (actual q-vertex link-neighborhood
  profiles around a random edge in K_4^(3)-free limits), and
  Phi_q(nu) > 0 for all nu in P_q(c) (pseudo-feasible q-local profiles
  arising from flag-algebra solutions with edge density >= c), with a
  positive separation margin exactly certifiable by rational flag/SOS
  or cellwise rational certificates. Equivalently
  L_q cap P_q(c) = empty with certified margin. If this sublemma is
  proved the augmented relaxation optimum drops below 0.5611 and
  pi(K_4^(3)) < 0.5611 follows. If for every q the high-density
  pseudo-profiles remain inside the closure of L_q then no bounded
  q-local link-neighborhood separator can work, and either q must grow
  unboundedly, a global/projective consistency argument is required,
  or a different kind of inequality is needed. No concrete separator
  can be exhibited without the actual numerical pseudo-moment vector
  for the plateau SDP.
prompt: erdos-500/prompts/researcher-07-localized-separator-attempt.md
---

Verdict

The localized-realizability-separator idea is a legitimate route after one important strengthening. As stated, however, the two properties

Φ(W)≤0for every actual K
4
(3)
	

-free limit W,
Φ(ρ
⋆
)>0

do not by themselves imply

π(K
4
(3)
	

)<0.5611.

They only prove that the particular pseudo-object ρ
⋆
 is not an actual limit, at least in the coordinates on which Φ depends. To get a Turán upper bound, the separator must also eliminate all pseudo-solutions with edge density at least the desired cutoff, or it must enter a direct upper-bound certificate for the edge density.

So the approach is sound as a strategy, but the sufficiency claim in the prompt is too weak.

Part 1 — Correct soundness statement

Let X be the compact space of actual K
4
(3)
	

-free 3-graph limits, using the full 3-uniform hypergraphon/Aldous–Hoover model. Let

d(W)=t(K
3
(3)
	

,W)

denote edge density. Then

π(K
4
(3)
	

)=
W∈X
max
	

d(W).

A finite-coordinate relaxation, such as a bounded-order flag-algebra SDP, gives a compact pseudo-feasible set P
r
	

 containing the r-coordinate projections of all actual limits:

p
r
	

(X)⊆P
r
	

.

Now suppose Φ
1
	

,…,Φ
s
	

 are finite-coordinate inequalities valid for actual limits:

Φ
j
	

(p
r
	

(W))≤0∀W∈X.

Then the following theorem is sound.

Theorem: sound localized separator upper bound

If one can certify, with exact rational/SOS/flag-algebra verification, that

sup{d(y):y∈P
r
	

, Φ
j
	

(y)≤0 ∀j}≤c

for some

c<0.5611,

then

π(K
4
(3)
	

)≤c<0.5611.

The proof is immediate: every actual K
4
(3)
	

-free limit projects into P
r
	

 and satisfies the added inequalities, so its edge density is at most the augmented relaxation optimum.

Equivalently, one may give a direct certificate of the form

c−d=
ℓ
∑
	

SOS
ℓ
	

+
j
∑
	

Q
j
	

⋅(−Φ
j
	

)+
m
∑
	

R
m
	

,

where the SOS
ℓ
	

 are nonnegative flag-SOS terms, the Q
j
	

 are nonnegative multipliers, and the R
m
	

 are known flag-algebra/K
4
(3)
	

-free relations that vanish on actual limits. Since −Φ
j
	

≥0 on actual limits, this proves d≤c.

By contrast, merely proving Φ(ρ
⋆
)>0 for one plateau pseudo-solution only says that ρ
⋆
 is excluded. Another pseudo-solution, or an actual high-density limit, could still satisfy Φ≤0.

A toy model shows the logical gap. Let the actual feasible set be

A={(0.55,0),(0.5611,0)},

where the first coordinate is edge density and the second is Φ. Let the pseudo-relaxation contain an additional point

ρ
⋆
=(0.5611,1).

Then Φ≤0 on all actual points and Φ(ρ
⋆
)>0, but the actual optimum is still 0.5611. The separator proves non-realizability of ρ
⋆
, not a better upper bound.

Subtlety (a): actual limits versus hypergraphons

There is no fundamental problem here if one uses the full dense 3-uniform hypergraph limit theory.

The correct object is not merely a symmetric measurable function W(x,y,z). General 3-graph limits require the full Aldous–Hoover/hypergraphon representation, with vertex and pair coordinates. In that setting,

X={W:t(K
4
(3)
	

,W)=0}/∼

coincides with the closure of finite K
4
(3)
	

-free 3-graphs.

Indeed, if H
n
	

 are K
4
(3)
	

-free and H
n
	

→W, then by continuity

t(K
4
(3)
	

,W)=0.

Conversely, if t(K
4
(3)
	

,W)=0, then a random finite sample from W is K
4
(3)
	

-free almost surely: each fixed 4-set spans a K
4
(3)
	

 with probability zero, and there are only finitely many 4-sets. The usual sampling theorem then gives finite K
4
(3)
	

-free graphs converging to W.

So the Aldous–Hoover issue is only dangerous if one uses an incomplete vertex-only hypergraphon model. With the full pair-coordinate model, “actual K
4
(3)
	

-free limit” and “limit of actual K
4
(3)
	

-free 3-graph sequences” agree.

Subtlety (b): uniqueness of the pseudo-extremizer

This is a serious issue.

Let P
r
	

 be the SDP feasible region and let

U
r
	

=
y∈P
r
	

max
	

d(y).

The plateau object ρ
⋆
 may not be unique. The optimal face

F
r
	

={y∈P
r
	

:d(y)=U
r
	

}

may contain many pseudo-solutions. If Φ(ρ
⋆
)>0 for one chosen point, the augmented SDP can simply move to another point in F
r
	

 with Φ≤0.

A single separator is enough only under a stronger condition, for example:

F
r
	

⊆{Φ>0},

or more quantitatively,

sup{d(y):y∈P
r
	

, Φ(y)≤0}<0.5611.

If F
r
	

={ρ
⋆
} is rigorously unique and Φ(ρ
⋆
)>0, then compactness implies that adding Φ≤0 lowers the SDP optimum strictly below U
r
	

. But to obtain a rigorous numerical bound <0.5611, one still needs an exact certificate for the lowered optimum, not just a floating-point observation.

There is another related issue: if Φ uses higher-order coordinates than the SDP solution provides, then Φ(ρ
⋆
) is not well-defined until one specifies a higher-order pseudo-extension. Different extensions may give different values. A separator must either depend only on available coordinates, or must separate every admissible higher-order extension of the plateau pseudo-solution.

Subtlety (c): denominators and localized rational certificates

The denominator case-split idea is sound, but only if stated as a finite family of polynomial certificates on closed cells.

Suppose D is a nonnegative conditioning density. A conditional expression such as N/D is not defined when D=0. To avoid singular behavior, one should not rely on informal division. Instead, choose a rational threshold η>0 and prove separate statements on the closed regions

D≥η

and

D≤η.

On D≥η, one may clear denominators because D is bounded away from zero. On D≤η, one needs a separate direct flag inequality. Boundaries must be included; using strict > and < is not enough for a limit argument.

For several denominators D
1
	

,…,D
m
	

, this becomes a finite cell decomposition according to which denominators are large or small. Each cell should have a polynomial/SOS certificate using the appropriate constraints, such as

D
i
	

−η
i
	

≥0

or

η
i
	

−D
i
	

≥0.

Entropy or mutual-information expressions require the same care. Quantities like D⋅H(⋅∣D) can often be continuously extended with the 0log0=0 convention, but raw conditional entropies at D=0 are not legitimate finite flag expressions unless the zero-denominator case is handled separately.

Also, with the usual convention that SOS≥0, the schematic inequality

d−c≤
i
∑
	

D
i
	

⋅SOS
i
	

+relations

has the wrong sign for an upper-bound certificate unless additional negative multipliers are present. For an upper bound, one wants something that forces d−c≤0, or equivalently c−d≥0, on actual limits.

Part 2 — What can be proved about concrete separators?

I cannot honestly exhibit a concrete separator from the data in the prompt. The actual numerical pseudo-moment vector ρ
⋆
 is not specified, and any genuine separator must be evaluated against its explicit finite coordinates or against every admissible extension of those coordinates.

But there is a precise no-go/criterion theorem that identifies exactly what must be proved.

Finite-projection no-go theorem

Fix a finite coordinate map

p
r
	

:X→R
N
,

for example all K
4
(3)
	

-free flag densities up to r vertices, or all bounded link-neighborhood profiles up to r sampled vertices. Let

X
r
	

=p
r
	

(X)

be the set of actual r-local profiles.

Let y
⋆
∈R
N
 be the corresponding finite-coordinate projection of a pseudo-solution.

Then:

If y
⋆
∈X
r
	

, no r-local separator exists.
Any expression Φ depending only on those coordinates and satisfying Φ≤0 on all actual limits must satisfy Φ(y
⋆
)≤0, because y
⋆
 is literally realized by some actual limit in those coordinates.

If y
⋆
∈
/
X
r
	

, then a continuous finite-coordinate separator exists. Since X
r
	

 is compact and y
⋆
∈
/
X
r
	

, the distance

δ=dist(y
⋆
,X
r
	

)>0

is positive. Then the quadratic function

Φ(y)=
2
δ
2
	

−∥y−y
⋆
∥
2

satisfies

Φ(y)≤−
2
δ
2
	

<0for y∈X
r
	

,

while

Φ(y
⋆
)=
2
δ
2
	

>0.

This proves existence of a finite-coordinate nonlinear separator, although not necessarily one with a useful rational flag-SOS certificate.

If one restricts to linear flag inequalities, then the criterion is stronger: a linear separator exists iff

y
⋆
∈
/
conv(X
r
	

).

So the obstruction is clear: a bounded local statistic cannot distinguish ρ
⋆
 from actual K
4
(3)
	

-free limits if the pseudo-profile is locally realizable in that projection. The pseudo-moment phenomenon may be genuinely projective: every small projection could look realizable while no global compatible actual limit exists.

Why the raw link-neighborhood condition is not enough

For an edge abc, the condition

N(a,b)∩N(a,c)∩N(b,c)=∅

is exactly the assertion that no vertex x completes abc to a K
4
(3)
	

. In flag language,

P(x∈N(a,b)∩N(a,c)∩N(b,c)∣abc∈E)=0.

This is a 4-vertex K
4
(3)
	

-free relation. Any bounded-order SDP that already enforces K
4
(3)
	

-freeness on 4 vertices will satisfy it. Therefore, a successful localized separator cannot be based only on the one-vertex triple-intersection obstruction. It must use higher consistency among several sampled outside vertices, or consistency among many rooted edges, or a genuine realizability/extendibility condition absent from the truncated SDP.

A natural actual-valid family comes from conditional exchangeability. Given a random rooted edge abc, sample outside vertices x
1
	

,…,x
q
	

, and record the column variables

C
i
	

=(1
abx
i
	

∈E
	

,1
acx
i
	

∈E
	

,1
bcx
i
	

∈E
	

)∈{0,1}
3
∖{111}.

For an actual hypergraphon, conditional on the latent data of the rooted edge, the C
i
	

 are conditionally i.i.d. Hence their joint law has the de Finetti form

μ
q
	

=∫ν
⊗q
dα(ν),ν({111})=0.

This implies inequalities such as

E[f(C
1
	

)f(C
2
	

)∣abc∈E]−E[f(C
1
	

)∣abc∈E]
2
≥0

for every test function f. After clearing the edge-density denominator, these are ordinary rooted flag-SOS inequalities. Low-order versions are already part of the standard flag-algebra machinery. A new separator would have to exploit higher-order truncated moment/extendibility constraints that the plateau SDP does not already enforce.

Crisp open sublemma for the localized approach

Here is the clean reduction.

For each q, let L
q
	

 be the set of actual q-vertex link-neighborhood profiles around a random edge in K
4
(3)
	

-free limits. Let P
q
	

(c) be the corresponding set of q-local profiles arising from pseudo-feasible flag-algebra solutions with edge density at least c.

A localized link-profile separator giving

π(K
4
(3)
	

)<0.5611

would follow from the following sublemma.

Open sublemma: high-density local non-realizability

There exist q, a rational number c<0.5611, and a finite-coordinate function Φ
q
	

 such that

Φ
q
	

(μ)≤0∀μ∈L
q
	

,

but

Φ
q
	

(ν)>0∀ν∈P
q
	

(c).

Equivalently,

L
q
	

∩P
q
	

(c)=∅

with a positive separation margin that can be certified exactly by rational flag/SOS or cellwise rational certificates.

If this sublemma is proved, the augmented relaxation has optimum <0.5611, and the desired Turán upper bound follows.

If, on the other hand, for every fixed q the high-density pseudo-profiles remain inside the closure of the actual q-profile set, then no bounded q-local link-neighborhood separator can work. One would then need either larger and larger q, a genuinely global/projective consistency argument, or a different kind of inequality.

Final answer

The localized-realizability-separator program is conceptually sound, but the claim in the prompt is not sound as written. Separating one SDP pseudo-extremizer from actual K
4
(3)
	

-free limits proves non-realizability of that pseudo-object; it does not by itself prove

π(K
4
(3)
	

)<0.5611.

To make the method rigorous, one must either produce a direct certificate for

d≤c<0.5611

on all actual limits, or prove that after adding the valid separator inequality, the entire pseudo-feasible high-density region above c is eliminated.

The denominator case-split is sound if implemented as exact polynomial/SOS certificates on closed cells D
i
	

≥η
i
	

 and D
i
	

≤η
i
	

. The Aldous–Hoover issue is harmless with the full 3-uniform hypergraphon model. The main hidden danger is non-uniqueness or under-specification of the pseudo-extremizer: one must separate the whole plateau face or all high-density pseudo-extensions, not merely a selected numerical vector.

No concrete separator can be exhibited from the information given. The precise remaining task is the finite-profile non-realizability sublemma above: find a bounded localized profile, preferably from link-neighborhood statistics, whose actual profile set is disjoint from every pseudo-feasible profile of density at least some c<0.5611, and certify that separation exactly.

---
id: R93-trace-rectangle-olcm-reduction
type: research
date: 2026-07-12
intent: >
  Prove or refute the shared ordered-multiplicity statement from its
  temporal-Hall / evolving-blocker formulation, with the block-harvest
  tensor decomposition and coded-repair machinery available.
predecessors:
  - R83-block-harvest-temporal-hall
  - R88-lift-exhaustion-reduction
action:
  kind: extends
  target: R88-lift-exhaustion-reduction
claim: >
  Neither persistence nor the no-direction proved, but two sharp new
  results. (1) Trace normal form: a residual spoiler killing the lift fp
  of a still-legal face f has the unique form a = pd with d | f (the
  trace); one actual move cannot destroy two distinct prime lifts of the
  same legal face (gcd(fp, fq) = f); every collection of traces incident
  to f has lcm dividing f. Hence the reciprocal-weighted low-lcm energy
  lemma: for faces in (Y, 2Y], if E_E is the set of faces with at least
  E atoms of distinct lift primes, then for every s <= E,
  |E_E| binom(E,s) <= 2Y Lambda_s(I), where Lambda_s sums
  1/lcm(traces) over s-subsets with distinct lift primes. (2) Raw
  bounded multiplicity is FALSE: an explicit legal ordered rectangle —
  m = c H/log H spoilers a_t = r_t p_t with p_t in (H, 2H],
  r_t in (H^2, 2H^2], against the face family F = {gRb} with
  R = prod r_t — has every spoiler killing one designated lift of EVERY
  face in F, |F| >> Y/R with Y/R -> infinity, insertions in decreasing
  product order, so any bound of the form "one spoiler hits at most
  H^{O(1)} active faces" fails. The construction does not settle the
  game: lcm of its traces is R, so |F| <= 2Y/R = Y exp(-(2c+o(1))H) —
  maximal raw multiplicity forces exponentially small shell density,
  exactly the trade the energy lemma prices. The single missing
  statement (OLCM): Lambda_s(I_T) = o(binom(E_H, s)) for some s = s(H),
  uniformly over stopping times and shells under the actual
  maximum-degree/coded-repair policy, with hereditary (shell-stable)
  packet assignment — equivalently a bounded-recourse inequality: total
  churn of the coded/common-core repairs is poly(r, log H) times the
  final repair size plus an lcm-area charge. Frozen results control
  each snapshot repair but not the churn; recomputing frozen
  decompositions is invalid because a later minimum-product edge can be
  a previously unused divisor of the current lcm and reuse its shadow.
  (OLCM) proved gives L(n) = o(n) outright; a forceable
  positive-density violation gives L(n) >> n/H against arbitrary
  replies. Neither is closed; the bracket stands.
implications:
  - Independent convergence, from the temporal-Hall side, on the same object as the chronological low-lcm capacity inequality reached from the lift-exhaustion side — reciprocal-weighted rather than counting form; three formulations now name one statement.
  - The rectangle construction refutes any repair of the maximal-divisor-scale persistence claim that bounds raw lifetime face-multiplicity of one spoiler by a function of H alone; only lcm-weighted versions survive.
  - The frozen-vs-evolving gap is now precise: bounded recourse of the repair sequence, not size of any single repair.
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/followup-R93-ordered-multiplicity-final.md
---

# Verdict

I do **not** obtain a proof of either persistence or the maximum-degree no-direction.

I can, however, reduce the shared question to one explicit arithmetic inequality and show that an unweighted bounded-multiplicity statement is false, even for a legal ordered sequence in which every new spoiler has smaller product than the preceding one. The remaining issue is a weighted **low-(\operatorname{lcm}) energy bound**. This is strictly more precise than saying that “the clutter evolves.”

The established bounds therefore remain

[
c_\delta\frac{n(\log\log n)^2}{\log n}
\le L(n)
\le
\bigl(0.1897123371+o(1)\bigr)n.
]



---

## 1. Exact residual normal form

Fix a lift-prime interval

[
\mathcal P_H:={p\in\mathbb P:H<p\le 2H},
\qquad
E_H:=|\mathcal P_H|
\asymp \frac{H}{\log H}.
]

Let (f) be a currently legal face, with (p\nmid f), and suppose an earlier actual move (a) destroys the lift (fp) while leaving (f) legal.

After excluding the already-treated exact and carrier directions, one necessarily has

[
a\mid fp,\qquad a\nmid f.
]

Indeed, if (fp\mid a), then (f\mid a), so (f) itself would cease to be legal. Since (p) is prime and (p\nmid f), the residual spoiler has the unique form

[
a=p,d,
\qquad
d\mid f.
\tag{1}
]

Call (d=a/p) the **trace** of this lost lift.

Two useful facts are immediate.

First, one actual move cannot destroy two distinct prime lifts of the same legal face. If

[
a\mid fp,\qquad a\mid fq,\qquad p\ne q,
]

then

[
a\mid \gcd(fp,fq)=f,
]

contrary to the legality of (f). Thus exhausting all (E_H) lifts of (f) really does require (E_H) distinct earlier moves.

Second, if (a_i=p_i d_i) destroys distinct lifts of (f), then

[
d_i\mid f
]

for every (i). Hence every selected collection of traces has its least common multiple dividing (f).

This gives a useful exact reformulation of the ordered multiplicity problem.

---

# 2. The low-(\operatorname{lcm}) energy lemma

Consider faces in one dyadic interval

[
\mathcal F_Y\subseteq (Y,2Y].
]

Let (\mathcal I) be any collection of residual spoiler atoms

[
\alpha=(a_\alpha,p_\alpha,d_\alpha),
\qquad
a_\alpha=p_\alpha d_\alpha,
]

present before the faces in question are used. Define

[
N(f):=
{\alpha\in\mathcal I:d_\alpha\mid f}.
]

When counting lift exhaustion, only subsets with distinct lift primes should be used. For (s\ge1), put

[
\Lambda_s(\mathcal I):=
\sum_{\substack{
J\subseteq\mathcal I,\ |J|=s\
p_\alpha\ {\rm distinct};(\alpha\in J)
}}
\frac{1}{
\operatorname{lcm}(d_\alpha:\alpha\in J)
}.
\tag{2}
]

## Lemma

Let

[
\mathcal E_E:=
{f\in\mathcal F_Y:
N(f)\text{ contains at least }E
\text{ atoms with distinct lift primes}}.
]

For every (1\le s\le E),

[
\boxed{
|\mathcal E_E|\binom Es
\le
2Y,\Lambda_s(\mathcal I).
}
\tag{3}
]

## Proof

Count pairs ((f,J)) where (f\in\mathcal E_E) and (J) is an (s)-element subset of (N(f)) having distinct lift primes.

Every (f\in\mathcal E_E) contributes at least (\binom Es) pairs. Therefore the number of pairs is at least

[
|\mathcal E_E|\binom Es.
]

Now fix an admissible (J), and let

[
D_J=\operatorname{lcm}(d_\alpha:\alpha\in J).
]

If (J\subseteq N(f)), then (D_J\mid f). The number of multiples of (D_J) in ((Y,2Y]) is at most

[
\left\lfloor\frac{2Y}{D_J}\right\rfloor
---------------------------------------

\left\lfloor\frac{Y}{D_J}\right\rfloor
\le \frac{2Y}{D_J}.
]

Summing over (J) gives (3). ∎

---

# 3. The shared statement in one formula

At horizon (H), complete exhaustion requires

[
E=E_H\asymp \frac{H}{\log H}.
]

Consequently, the desired no-direction would follow from the following statement for some (s=s(H)\le E_H):

[
\boxed{
\Lambda_s(\mathcal I_T)
=======================

o!\left(\binom{E_H}{s}\right)
}
\tag{OLCM}
]

uniformly over every relevant stopping time (T), every dyadic shell, and the actual maximum-degree/coded-repair Shortener history.

Indeed, (3) would then imply that only (o(Y)) faces in the shell can have all their lift primes exhausted. The accepted pointwise interdiction and online-area machinery would clear the remaining faces with the required fresh-area accounting. Summing the dyadic shells would give

[
\boxed{L(n)=o(n).}
]

The shell-stability qualification means that the same spoiler atom cannot be placed into a newly recomputed packet and charged again in every later shell. In other words, (OLCM) has to be proved for persistent atoms, not separately for each frozen snapshot.

Conversely, a persistence proof has to force a family for which the left side of (3) is large enough to support (\gg Y) faces, and then convert those faces into actual moves against **every** reply. Merely producing large (\Lambda_s) in a cooperative or frozen history is not sufficient.

Thus (OLCM), or a forceable quantitative violation of it, is the exact shared subproblem.

---

# 4. Raw multiplicity is genuinely false

The following construction shows why the target cannot simply be a bound on how many active faces one spoiler can hit.

Fix (H\to\infty) and put

[
m=\left\lfloor c\frac{H}{\log H}\right\rfloor
]

for a sufficiently small fixed (c>0). Choose mutually distinct primes

[
p_1,\ldots,p_m\in(H,2H],
]

and mutually distinct primes

[
r_1,\ldots,r_m\in(H^2,2H^2],
]

disjoint from the (p_i). Order both lists decreasingly, so

[
r_1p_1>r_2p_2>\cdots>r_mp_m.
]

Put

[
R=\prod_{t=1}^{m}r_t.
]

Then

[
\log R
======

# \sum_{t=1}^m\log r_t

(2c+o(1))H.
\tag{4}
]

Let (g) be one further prime, and suppose

[
Y/(gR)\longrightarrow\infty.
]

For example, this holds whenever (H=o(\log Y)). Set

[
B=\frac{Y}{gR}
]

and take

[
\mathcal F=
\left{
gRb:
B<b\le2B,\quad
\gcd!\left(
b,gR\prod_{t=1}^m p_t
\right)=1
\right}.
\tag{5}
]

Every (f\in\mathcal F) lies in ((Y,2Y]). Moreover,

[
|\mathcal F|
\gg \frac{Y}{R},
\tag{6}
]

because the sum of the reciprocals of the excluded primes is (O(1/\log H)). Since all members of (\mathcal F) lie in one dyadic interval, they are mutually incomparable.

Now define the ordered spoilers

[
a_t=r_tp_t,
\qquad
1\le t\le m.
\tag{7}
]

These (a_t) are pairwise incomparable actual moves. For every (f\in\mathcal F),

[
a_t\mid fp_t,
\tag{8}
]

because (r_t\mid R). On the other hand,

[
a_t\nmid f
]

because (p_t\nmid f), and

[
f\nmid a_t
]

because (f) contains (g) and many other factors. Hence each (a_t) is a genuine cross-spoiler: it kills the (p_t)-lift of **every** face in (\mathcal F) while leaving all those faces legal.

Also, for (s\ne t),

[
a_s\nmid fp_t,
]

because (p_s) divides neither (f) nor (p_t). Thus the (p_t)-lift stays legal until the intended move (a_t) occurs.

Finally,

[
a_1>a_2>\cdots>a_m,
]

so every insertion can be made a new minimum-product insertion. Harmless incomparable moves can be placed between these spoilers to realize the alternation of the original game.

We have therefore constructed a completely legal ordered incidence rectangle

[
{a_1,\ldots,a_m}\times\mathcal F.
]

Every one of the (m) spoilers hits all (|\mathcal F|) faces, and every face loses all (m\asymp H/\log H) designated lifts.

Thus a bound of the form

[
\text{“one spoiler hits at most }H^{O(1)}
\text{ active faces”}
]

is false: by taking (Y) large, (|\mathcal F|) can be arbitrarily larger than every fixed function of (H).

---

# 5. Why that construction does not settle the game

The traces in the construction are

[
d_t=\frac{a_t}{p_t}=r_t,
]

and hence

[
\operatorname{lcm}(d_1,\ldots,d_m)=R.
]

All affected faces are multiples of (R). Formula (6) is therefore essentially best possible:

[
|\mathcal F|\asymp\frac{Y}{R}
=============================

Y\exp\bigl(-(2c+o(1))H\bigr).
\tag{9}
]

The construction has maximal raw multiplicity but exponentially small shell density. It nearly attains the (s=m) case of the low-(\operatorname{lcm}) lemma:

[
|\mathcal F|
\le
\frac{2Y}{R}.
]

So this does **not** give Prolonger (\gg Y) persistent faces. It proves instead that any valid solution must trade multiplicity against the least-common-multiple area cost. A raw Hall-capacity statement is too strong, while a merely static weighted statement is too weak.

The diagonal coded-repair mechanism deals with repeated or matching-like traces. The common-core splitting theorem deals with a fixed primorial cube. In the example above the area payment is visible through (R). The unresolved configurations are the ones in which new traces continually enter the divisor lattice of an already small (\operatorname{lcm}), forcing repeated recoding without producing comparable growth of (R).

---

# 6. The exact missing sub-step

The single unproved statement is the following.

## Ordered low-(\operatorname{lcm}) decomposition

For the actual evolving residual clutter, after ordinary and pairwise effects have been removed, prove that trace incidences can be assigned permanently to packets such that:

1. every packet that remains inside a fixed low-(\operatorname{lcm}) divisor cube is handled by the common-core/coded frozen repair;
2. if an incidence cannot be placed in an existing packet, the packet’s accumulated (\operatorname{lcm}) grows enough to pay for all faces carrying it through the bound (O(Y/D));
3. assignments are hereditary: a later new minimum-product edge cannot make a previously used coded shadow available for a second charge.

Quantitatively, this is exactly the estimate (OLCM):

[
\Lambda_s(\mathcal I_T)
=======================

o!\left(\binom{E_H}{s}\right)
]

for some (s=s(H)), uniformly over all stopping times and shells.

The existing frozen arguments establish the needed bound for a single fixed packet and for the diagonal matching packet. They do **not** establish a nested family of packets as the minimum-product edge changes. Recomputing the frozen decomposition is invalid because the same low-(\operatorname{lcm}) shadow can be used again in the next decomposition. The new edge need not enlarge the current (\operatorname{lcm}); it may simply be a previously unused divisor of it.

Equivalently, what is missing is a bounded-recourse theorem of the form

[
\sum_t
\bigl|
\mathcal R_t\setminus\mathcal R_{t-1}
\bigr|
\le
\operatorname{poly}(r,\log H),
|\mathcal R_{\mathrm{final}}|
+
\text{an }\operatorname{lcm}\text{-area charge},
\tag{10}
]

where (\mathcal R_t) is the coded/common-core repair at time (t). The frozen results control each (|\mathcal R_t|); they do not control the left side of (10).

That bounded-recourse or low-(\operatorname{lcm})-energy inequality is the one step I cannot prove.

---

# 7. Consequences of closing it

If (OLCM) is proved for maximum-degree Shortener, then (3) makes the fully exhausted faces (o(Y)) in every shell. The accepted pointwise fresh-area estimate then supplies the online-area bound, and therefore

[
\boxed{L(n)=o(n).}
]

If instead Prolonger can force a violation with

[
|\mathcal E_{E_H}|\gg Y
]

throughout (t\asymp X/H) rounds, while ensuring that exact opposing plays are scored rather than treated as free deletions, then

[
\boxed{L(n)\gg \frac nH.}
]

That conclusion would hold against arbitrary opposition only if the large low-(\operatorname{lcm}) family is itself forceable. The construction in Section 4 is merely a legal ordered history and has density (e^{-\Theta(H)}), so it does not supply that arbitrary-reply theorem.

Accordingly, neither direction is closed here. The precise remaining question is whether the evolving trace system satisfies the shell-stable low-(\operatorname{lcm}) energy estimate (OLCM), or whether Prolonger can force a positive-density violation of it.

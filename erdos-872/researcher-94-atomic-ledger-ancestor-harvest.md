---
id: R94-atomic-ledger-ancestor-harvest
type: research
date: 2026-07-12
intent: >
  Repair or refute the historical incidence lemma that the refuted
  arbitrary-reply persistence claim needed: a canonical splitter whose
  lifetime spoiler-to-face multiplicity is H^{o(1)} tau(c), plus a
  weighted packet identity and a complete legal scheduler.
predecessors:
  - R92-persistence-audit-a-temporal-double-count
  - R92-persistence-audit-b-instantaneous-vs-cumulative
action:
  kind: supersedes
  target: R92-arbitrary-reply-persistence-claim
failure_mechanism: >
  The original claim's temporal capacity bound is repaired on one
  channel and irreparable on the other. Repaired: pre-register all
  atomic core-signature faces F = (b, S) as latent objects from the
  start of the shell stage (no creation by splitting, no semantic
  merging, regeneration = activation of an existing latent atom); a
  played move c is inserted into every latent blocker record it blocks,
  so a face born after c reveals a row-column incidence that already
  existed. Lifetime ordered-incidence bound: faces whose blocker record
  ever contains c number at most 2^r tau(c) (tau(c) cores times exactly
  2^r signatures) — the audits' Boolean-stage example 8 x 2^4 = 128
  saturates it, and 2^r = H^{o(1)} at the entry construction's rank, so
  the fixed-delta arithmetic survives. Irreparable channel: DIRECT
  ANCESTORS. The residual channel's orientation is kappa(F) | c, but an
  ancestor move obeys the reverse relation c | a_F, killing every prime
  lift of every atom whose base it divides; multiplicity must count
  multiples of c, not divisors. Concrete asymptotic construction: with
  H = n^{o(1)}, H^2 = o(n), take M = H distinct primes q_j in
  [n/4H, n/3H], face bases a_j = 2 q_j, prime lifts l in [H, 3H/2];
  playing the single move 2 erases the entire lift family of all M = H
  mutually unmergeable faces while tau(2) = 2 stays constant — so no
  bound of the form M_r tau(c) exists for ancestor sacrifices, and the
  claimed policy-robust scheduler dichotomy has a genuine third branch:
  linear reservoir mass destroyed through direct ancestors.
claim: >
  Partial repair plus exact residual statement. Established here: (1)
  lifetime ordered-incidence bound 2^r tau(c) on the residual
  cross-spoiler channel via the atomic ledger; (2) valid exhaustion
  double count — ordered-exhausted atoms number o(t) at
  H = T(n)^{1+delta}, fixed delta only (not every T^{1+o(1)}); (3) an
  exact first-exit packet identity (each target token owned by its
  minimal atomic face, classified once: remains / exact bank / played /
  non-ancestor blocker / direct ancestor — no parent-descendant double
  charge); (4) weighted non-ancestor losses o(X) for t = O(X/H) via an
  O(log H)-per-atom bound; (5) a total legal scheduler (fallback: play a
  live target divisible by a dangerous divisor; completion declared only
  by the explicit check that no legal divisor exceeds the cap), whose
  stopping trichotomy is now explicit. Everything reduces to the
  ancestor-harvest inequality (AH): for the canonical batching
  scheduler, uniformly against arbitrary replies, first-exit
  direct-ancestor mass satisfies |D_t| <= o(X) + C_2 H t until the cap
  is reached (a weaker theta X + C_2 H t + o(X) form suffices). (AH)
  implies L(n) >>_delta n / T(n)^{1+delta} against arbitrary opposition
  via the exact packet identity and the fortress potential; a
  maximum-degree history with |D_t| = Omega(X), t = o(X/H), and o(X)
  exact transfers implies the online-area no-direction and
  L(n) = o(n). The full persistence theorem is not closed.
implications:
  - Fourth independent naming of the same object - the temporal shell-stable Hall-capacity bound now appears as (TL), OLCM, bounded-recourse, and (AH) on the reverse core-divisibility graph; the ancestor channel is where all four localize.
  - The audits' demanded components (historical no-repetition, packet identity, scheduler completeness) are all supplied; only the reverse-divisibility harvest remains.
  - The many-face base-2 construction is the ancestor-channel sibling of the trace rectangle; both show raw multiplicity unbounded and force lcm/Hall-weighted formulations.
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/followup-R94-historical-incidence-lemma.md
---

# Verdict

The audit identifies two different questions that must be separated.

1. **For the residual ordered cross-spoiler channel**, the historical incidence lemma is true with
   [
   M_r=2^r=H^{o(1)}.
   ]
   The repair is to pre-register all atomic core-signature faces and attach blockers to those persistent atoms, rather than to whichever Sperner layer happens to be active.

2. **For direct ancestor sacrifices**, no bound of the form (M_r\tau(c)) is possible. A single legal (c) can divide the bases of (H^{\Omega(1)}) mutually unmergeable faces and erase all their lifts. Direct losses therefore require a separate temporal Hall bound.

I give below:

* an explicit canonical atomic splitter;
* the lifetime (2^r\tau(c)) proof;
* an exact packet identity with no parent–descendant duplication;
* a complete, non-stalling legal scheduler with fallback moves;
* a weighted (o(H))-per-round bound for every **non-ancestor** lift loss;
* a construction showing why direct sacrifices are not covered.

The full arbitrary-reply persistence theorem is still not closed. The single remaining statement is the temporal bound for the direct-ancestor ledger, displayed as (AH) below.

I use the game notation and accepted cube, trapping, exact-bank, and lift-exhaustion reductions from the uploaded manuscript. 

---

# 1. Canonical latent atomic faces

Fix one target shell and a fixed ordered primorial coordinate set

[
\mathcal P={p_1,\ldots,p_r}.
]

Write

[
p_S:=\prod_{i\in S}p_i
\qquad(S\subseteq[r]).
]

The accepted common-core normalization associates to every cube face:

* an arithmetic common core (b);
* a Boolean signature (S\subseteq[r]);
* a canonical non-lift part
  [
  a_{b,S}=b,p_S;
  ]
* a fixed set of admissible prime lifts
  [
  \Lambda(b,S)=
  {a_{b,S}\ell:\ell\in\mathcal L(b,S)}.
  ]

All relevant lower roots represented by this face divide (a_{b,S}). Hence playing any legal member of (\Lambda(b,S)) permanently services every root represented by that atomic face.

The atomic face identity is

[
\boxed{F=(b,S).}
\tag{1}
]

Every possible (F=(b,S)) is declared to exist **latently from the beginning of the shell stage**, whether or not the dynamic scheduler has exposed it yet.

This is the central change. A descendant is not created when it becomes visible. It is a previously existing atom that has just become active.

## Split map

A coarse face is represented only as a view over a set of atomic leaves. One may implement it as a binary decision tree over the coordinates (1,\ldots,r):

[
(b,\sigma_1,\ldots,\sigma_k)
\longmapsto
\begin{cases}
(b,\sigma_1,\ldots,\sigma_k,0),\
(b,\sigma_1,\ldots,\sigma_k,1).
\end{cases}
\tag{2}
]

Splitting continues until the necessary atomic signatures are exposed. Equivalently, one may immediately refine a coarse face to all of its at most (2^r) leaves.

The view overhead is at most (2^{r+1}-1), and the number of terminal atomic identities per core is exactly (2^r).

## Inheritance rule

For an actual historical move (c), define the arithmetic predicate

[
\operatorname{Blk}(c,F)
]

to mean that (c) blocks at least one canonical lift of the atom (F) in the residual ordered cross-spoiler channel.

The blocker record of (F) is

[
\mathcal C(F)
=============

{c\text{ already played}:\operatorname{Blk}(c,F)}.
\tag{3}
]

Conceptually, when (c) is played, it is inserted immediately into every latent atomic record satisfying (\operatorname{Blk}(c,F)). An implementation need not update all latent records eagerly; when (F) is later exposed, it can recover the same set by scanning the finite historical move list.

Thus a face born after (c) does not receive a new copy of (c). It reveals a row-column incidence that already existed.

## Merging rule

There is no semantic merging of atomic records.

If two dynamic parent paths request the same key ((b,S)), they receive pointers to the same persistent object. Coarse views may be unioned for queue management, but their blocker records and target packets remain stored at the atomic leaves.

## Regeneration rule

An exhausted or serviced atom never reopens.

Indeed:

* the set of legal candidate lifts only shrinks;
* a played carrier servicing (F=(b,S)) remains permanently comparable with every root represented by (F);
* a later change in “minimality” or scheduling priority does not create a new legal root or a new lift.

What is often called regeneration is therefore activation of a previously latent atom, not creation of another copy of the same atom.

---

# 2. Historical incidence lemma

We now use the accepted orientation of the residual ordered cross-spoiler relation:

[
\operatorname{Blk}(c,F=(b,S))
\quad\Longrightarrow\quad
b\mid c.
\tag{4}
]

All ordinary failures, direct ancestors, and the already separated pair channel are excluded from this relation.

## Theorem 1: lifetime ordered-incidence bound

For every actual move (c),

[
\boxed{
#{F:c\in\mathcal C(F)}
\le 2^r\tau(c).
}
\tag{5}
]

### Proof

If (c\in\mathcal C(F)) for (F=(b,S)), then (b\mid c) by (4).

There are at most (\tau(c)) possible cores (b), and for each fixed (b) there are exactly (2^r) possible signatures (S\subseteq[r]). Hence

[
#{F:c\in\mathcal C(F)}
\le
\sum_{b\mid c}2^r
=================

2^r\tau(c).
]

Delayed activation has no effect because (F) was a persistent latent object when (c) was played. ∎

This is a genuine lifetime statement, not an instantaneous Sperner statement.

For the audit example,

[
r=4,\qquad c=30,\qquad \tau(30)=8,
]

so the new bound is

[
2^4\tau(30)=16\cdot8=128.
]

The verified history exposes exactly the 128 core-signature pairs. Thus the example that violates

[
\binom42\tau(30)=48
]

exactly saturates the repaired atomic bound.

The Boolean stage-by-stage realization also shows why (\binom r{\lfloor r/2\rfloor}) cannot be a lifetime factor: successive active antichains can reveal every one of the (2^r) signatures.

Because the entry construction uses

[
r\le
\frac{\log H}{(\log\log H)^2},
]

we have

[
2^r
\le
\exp\left(
O\left(\frac{\log H}{(\log\log H)^2}\right)
\right)
=======

H^{o(1)}.
\tag{6}
]

So this repair is fully compatible with the fixed-(\delta) arithmetic.

---

# 3. Valid exhaustion double counting

Let (\mathcal X_t) be the set of atomic faces that have become exhausted specifically through the ordered cross-spoiler channel by time (t).

Suppose the accepted lift-exhaustion lemma supplies

[
|\mathcal C(F)|\ge
q_H,
\qquad
q_H\ge c_0\frac{H}{\log H},
\tag{7}
]

for every (F\in\mathcal X_t).

Double counting the persistent incidences ((c,F)) gives

[
\begin{aligned}
q_H|\mathcal X_t|
&\le
\sum_{F\in\mathcal X_t}|\mathcal C(F)|\
&=
\sum_{c<t}
#{F\in\mathcal X_t:c\in\mathcal C(F)}\
&\le
2^r\sum_{c<t}\tau(c).
\end{aligned}
]

Writing

[
\mathfrak T(n)=\max_{m\le n}\tau(m),
]

we obtain

[
\boxed{
|\mathcal X_t|
\le
\frac{2^r\mathfrak T(n)\log H}{c_0H},t.
}
\tag{8}
]

For the safe choice

[
H=\mathfrak T(n)^{1+\delta},
\qquad \delta>0\text{ fixed},
]

equations (6) and (8) give

[
\frac{2^r\mathfrak T(n)\log H}{H}
=================================

\mathfrak T(n)^{-\delta+o(1)}
\log \mathfrak T(n)
=o(1).
\tag{9}
]

Therefore ordered-exhausted atomic leaves number (o(t)).

This conclusion is valid only for the chosen fixed-(\delta) scale. It does not assert that every expression informally written as (\mathfrak T(n)^{1+o(1)}) works.

---

# 4. Exact target-packet identity

Faces can share candidate targets, so a unique ownership rule is needed.

Let (Q_0) be the non-exact residual target set at the beginning of the shell stage. For each (u\in Q_0), let

[
\mathscr F(u)
=============

{F:u\in\Lambda(F)}.
]

The exceptional targets with (\mathscr F(u)=\varnothing) remain in the previously accepted exceptional budget. Fix a total ordering of atomic faces and define

[
\omega(u)=\min\mathscr F(u).
\tag{10}
]

The initial atomic packet is

[
\Pi_F
=====

{u\in Q_0:\omega(u)=F}.
\tag{11}
]

The packets (\Pi_F) are pairwise disjoint.

For a coarse tree node (V), define

[
\Pi_V
=====

\mathop{\dot\bigcup}_{F\text{ below }V}\Pi_F.
\tag{12}
]

Consequently, every binary split satisfies the exact identity

[
\boxed{
\Pi_V=\Pi_{V0}\mathbin{\dot\cup}\Pi_{V1}.
}
\tag{13}
]

This is true even when (V0) or (V1) is activated much later.

## First-exit ledger

Each target token (u\in Q_0) is classified by the first event that removes it from (Q):

* it remains in (Q_t);
* it transfers to the exact-only bank;
* it is actually played before such a transfer;
* it is removed by a non-ancestor blocker;
* it is removed by a direct ancestor.

For every atom (F),

[
\Pi_F
=====

L_F(t)
\mathbin{\dot\cup}
E_F(t)
\mathbin{\dot\cup}
P_F(t)
\mathbin{\dot\cup}
N_F(t)
\mathbin{\dot\cup}
A_F(t),
\tag{14}
]

where the five sets are the corresponding owner tokens.

Thus, for arbitrary nonnegative token weights (w(u)),

[
\boxed{
w(\Pi_F)
========

w(L_F(t))
+w(E_F(t))
+w(P_F(t))
+w(N_F(t))
+w(A_F(t)).
}
\tag{15}
]

Summing (15) over atomic leaves gives the global identity

[
\boxed{
w(Q_0)
======

w(Q_t)
+w(E_t)
+w(P_t)
+w(N_t)
+w(A_t).
}
\tag{PI}
]

No target can be charged once to a parent and later again to a descendant: all accounting is permanently stored at its atomic owner.

If an exact-only token is later played, it remains classified under (E_t). Its later play redeems the exact-bank credit; it does not move the token into a second packet.

---

# 5. Weighted non-ancestor losses are controlled

The old passage from face count to target weight was unjustified. At the atomic level one can instead bound the number of prime lifts that a single non-ancestor move blocks inside one face.

Let (F) have non-lift part (a=a_F), with candidate lifts

[
u=a\ell,
]

where (\ell) is prime. Suppose the dyadic face scale satisfies

[
\frac{n}{a}\le C_0H.
\tag{16}
]

Fix a played integer (c), and assume

[
c\nmid a.
\tag{17}
]

We count primes (\ell) for which (c) is comparable with (a\ell).

If

[
a\ell\mid c,
]

then (a\mid c) and

[
\ell\mid \frac ca.
]

There are at most

[
\omega(c/a)
\le
\log_2(c/a)
\le
\log_2(C_0H)
]

such primes.

If

[
c\mid a\ell,
]

put (g=(a,c)). Since (c\nmid a),

[
\frac cg>1,
]

and (c/g\mid\ell). Since (\ell) is prime,

[
\ell=\frac cg.
]

There is at most one such lift.

Therefore:

## Lemma 2: local non-ancestor multiplicity

For every atomic face (F) and every blocker (c\nmid a_F),

[
\boxed{
#{\ell:c\text{ is comparable with }a_F\ell}
\le
1+\log_2(C_0H).
}
\tag{18}
]

Combining (18), atomic ownership, and Theorem 1 gives

[
\begin{aligned}
|N_t|
&\le
\bigl(1+\log_2(C_0H)\bigr)
\sum_{i<t}
#{F:c_i\in\mathcal C(F)}\
&\le
\bigl(1+\log_2(C_0H)\bigr)
2^r
\sum_{i<t}\tau(c_i)\
&\le
C_1,2^r\mathfrak T(n)\log H,t.
\end{aligned}
\tag{19}
]

At

[
H=\mathfrak T(n)^{1+\delta},
]

the coefficient satisfies

[
\boxed{
2^r\mathfrak T(n)\log H=o(H).
}
\tag{20}
]

Hence, uniformly for

[
t=O(X/H),
]

we have

[
\boxed{|N_t|=o(X).}
\tag{21}
]

This repairs the weighted passage for the ordered non-ancestor channel. It is stronger than counting only fully exhausted faces: it controls every first-exiting owned lift directly.

---

# 6. A complete legal scheduler

The scheduler can be made total; it need not assume that every popped face has a legal canonical lift.

At the current position define

[
D_H(A)
======

{d\in D(A):\deg_Q(d)>H}.
\tag{22}
]

Maintain a deterministic queue of unresolved atomic faces, ordered first by core and then by signature.

On every Prolonger turn:

1. Discard any queued face that no longer represents a member of (D_H(A)).

2. For the first remaining face (F), scan its fixed lift list (\Lambda(F)).

3. If a legal lift (u\in\Lambda(F)) exists, play the first such (u). This is an actual legal move and services (F).

4. If no legal lift exists, mark (F) exhausted:

   * ordered exhaustion is recorded using (\mathcal C(F));
   * direct-ancestor exhaustion is recorded in the direct ledger;
   * a face born exhausted is handled in exactly the same way.

   Continue scanning the queue without consuming a move.

5. If the queue becomes empty, recompute (D_H(A)).

6. If (D_H(A)=\varnothing), declare the cap stage complete.

7. If (d\in D_H(A)) remains but no canonical atomic lift is available, use the fallback:
   choose any
   [
   u\in Q(A),\qquad d\mid u,
   ]
   and play (u).

The fallback always exists because (\deg_Q(d)>H\ge0). It is legal because (u\in Q(A)).

Playing (u) makes (d) permanently illegal. If many fallback moves are needed, they themselves already give a long game.

## Why the scheduler cannot get stuck

Every zero-time queue operation permanently retires one atomic record, so only finitely many can occur before either a move is produced or the queue empties.

If the queue is empty while a dangerous (d) remains, the fallback produces a legal move immediately.

Therefore every Prolonger turn ends in one of exactly two ways:

* an actual legal move is played;
* the degree cap has been reached.

## Why completion implies the cap

“Queue empty” alone is not used as the completion condition. Completion is declared only after the explicit separation check

[
D_H(A)=\varnothing.
]

Thus the earlier missing implication has been removed by definition, not assumed.

## The correct stopping trichotomy

Starting from a shell residual of size (X), run for at most

[
T=\left\lfloor\alpha\frac XH\right\rfloor
\tag{23}
]

Prolonger turns.

Exactly one of the following occurs:

1. (T) actual carrier or fallback moves are made. Then the game has already lasted (\Omega(X/H)) moves.

2. The scheduler reaches (\Delta_Q\le H) while a linear live-plus-banked reservoir remains. The fortress and exact-bank potentials give an (\Omega(X/H)) tail.

3. Before either event, a linear amount of (Q)-mass is destroyed through direct ancestors.

The third case is no longer omitted. It is the remaining problem.

---

# 7. Why direct ancestors are fundamentally different

The local estimate (18) assumed (c\nmid a_F).

If instead

[
c\mid a_F,
\tag{24}
]

then

[
c\mid a_F\ell
]

for **every** prime lift (\ell) of (F). One move can erase the whole lift family.

This is not controlled by (\tau(c)), because the relevant relation is now

[
c\mid a_F,
]

so one must count multiples of (c), not divisors of (c).

## Concrete board example

Take (n=4000), after the legal upper opening (2003). Let the atomic base be

[
a_F=11.
]

The prime lifts

[
11p,
\qquad
\frac{2000}{11}<p\le\frac{4000}{11},
]

give 30 distinct live upper targets in the single atomic face (F).

The lower move (c=11) is legal and kills all 30 of these prime lifts at once. In fact it kills

[
\left\lfloor\frac{4000}{11}\right\rfloor
----------------------------------------

# \left\lfloor\frac{2000}{11}\right\rfloor

182
]

live upper targets.

Thus one direct incidence with one atom can carry much more than (O(\log H)) target mass.

## An asymptotic many-face construction

Let (H=n^{o(1)}), so eventually (H^2=o(n)). Put (c=2).

Choose (M=\lfloor H\rfloor) distinct primes

[
q_j\in
\left[\frac{n}{4H},\frac{n}{3H}\right]
\qquad(1\le j\le M),
]

and define face bases

[
a_j=2q_j.
]

For primes

[
\ell\in[H,3H/2],
]

the lifts satisfy

[
\frac n2
\le
2q_j\ell
\le n.
]

So each (F_j) has (\gg H/\log H) upper prime lifts, all killed by playing (2).

The faces cannot be merged into one carrier-service class. For (j\ne k),

[
\operatorname{lcm}(a_j,a_k)
===========================

2q_jq_k

>

n
]

for sufficiently large (n), since (H^2=o(n)). No board integer can be a common carrier for both bases.

Therefore any face system compatible with actual carrier service must distinguish at least (M=H) such faces. If direct ancestors were included in the same exhaustion certificates as ordered cross-spoilers, the single move (2) would have lifetime multiplicity

[
H,
]

whereas

[
\tau(2)=2.
]

Hence the all-causes statement

[
#{F:c\text{ appears in }F\text{'s certificate}}
\le H^{o(1)}\tau(c)
]

is false.

This is why direct ancestors must be separated from the ordered certificate ledger.

---

# 8. The single remaining inequality

Let

[
\mathcal D_t
============

\mathop{\dot\bigcup}*{i<t}
\left{
u=a_F\ell\in Q*{i^-}:
c_i\mid a_F
\right}
\tag{25}
]

be the first-exit direct-ancestor mass. The union is disjoint because each target exits (Q) only once.

The exact packet identity and the bounds above give, up to the already accepted exceptional terms,

[
|Q_t|+|E_t|
\ge
X
-

## O(t)

## o(H)t

## |\mathcal D_t|

o(X).
\tag{26}
]

Here:

* (O(t)) accounts for targets actually played;
* (o(H)t) is the non-ancestor loss from (19)–(20);
* (E_t) is banked, not lost;
* all parent–descendant duplication has been removed.

Thus the one missing statement is:

## Ancestor-harvest inequality

For the canonical batching scheduler, uniformly against arbitrary replies,

[
\boxed{
|\mathcal D_t|
\le
o(X)+C_2Ht
\qquad
\text{until }\Delta_Q\le H.
}
\tag{AH}
]

A slightly weaker form would suffice: for some fixed (\theta<1),

[
|\mathcal D_t|
\le
\theta X+C_2Ht+o(X).
\tag{27}
]

This is precisely the temporal, shell-stable Hall-capacity assertion on the reverse core-divisibility graph

[
c\longrightarrow F
\quad\Longleftrightarrow\quad
c\mid a_F.
]

It is also the block-harvest tensor obstruction: one played ancestor can harvest the relevant star in every block whose base is its multiple.

---

# 9. Conditional consequence of (AH)

Assume (AH), and take

[
H=\mathfrak T(n)^{1+\delta}
]

for fixed (\delta>0).

Run the total scheduler for

[
T=\left\lfloor\alpha X/H\right\rfloor
]

turns, with (\alpha>0) sufficiently small.

If (T) moves occur, the game already has length (\Omega(X/H)).

Otherwise the cap is reached before (T). From (26), (AH), and (2^r\mathfrak T(n)\log H=o(H)),

[
|Q_T|+|E_T|
\ge
X-C_2HT-o(X)
\ge
(1-C_2\alpha-o(1))X.
]

Choosing, for example,

[
\alpha<\frac1{4C_2}
]

leaves

[
|Q_T|+|E_T|\ge \frac X2.
]

The exact-bank fortress potential then gives

[
V(A_T)
\ge
|E_T|+\frac{|Q_T|}{H}
\ge
\frac{|E_T|+|Q_T|}{H}
\ge
\frac{X}{2H}.
]

For a linear shell (X\asymp n),

[
\boxed{
L(n)\gg_\delta
\frac{n}{\mathfrak T(n)^{1+\delta}}.
}
\tag{28}
]

Every step would hold against arbitrary opposition; no maximum-degree assumption is used.

Conversely, an actual maximum-degree history satisfying

[
|\mathcal D_t|=\Omega(X),
\qquad
t=o(X/H),
]

with only (o(X)) exact transfers, would provide the no-direction needed by the online-area reduction and hence imply (L(n)=o(n)).

---

# Final status

The historical break itself is repaired:

[
\boxed{
#{F:c\text{ is ever used as an ordered cross-spoiler}}
\le
2^r\tau(c).
}
]

The factor (2^r), rather than the instantaneous Sperner width, is the correct lifetime factor and is (H^{o(1)}) at the intended rank.

The atomic ownership ledger also supplies an exact weighted packet identity, and the scheduler can be made fully legal and non-stalling, with born-exhausted faces, fallback moves, exact transfers, and direct sacrifices all explicitly represented.

But the full persistence theorem does not follow, because direct ancestor moves obey the reverse relation (c\mid a_F). Their multiplicity can be (H^{\Omega(1)}) even when (\tau(c)) is constant.

The single unresolved sub-step is therefore

[
\boxed{
\text{prove or refute the ancestor-harvest inequality (AH)
for the actual canonical ordering.}
}
]

All delayed-descendant, parent–child duplication, and scheduler-completeness issues reduce to this one remaining temporal Hall-capacity question.

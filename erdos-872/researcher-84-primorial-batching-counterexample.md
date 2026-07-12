---
id: R84-primorial-batching-counterexample
type: refutation
date: 2026-07-11
intent: >
  Single-question dispatch: prove or disprove the bounded-multiplicity
  online charging inequality (or an amortized variant sufficient for a
  sublinear game bound), given the divisor-multiplicity, packing-value,
  completion, trapping, and regeneration results.
predecessors:
  - R80-nu-sublinear-sparse-covers-charging-gap
  - R81-static-completion-smooth-rough-sweep
action:
  kind: confirms
  target: R82-charging-inequality-disproved-exact-only-bank
claim: >
  Independent disproof of the same charging inequality by a different
  construction (primorial batching): for every candidate b(n) = o(n) and
  fixed C there is a reachable position A_n with |R(A_n)| = (1/2-o(1))n
  (a LINEAR live reservoir), Delta(A_n) <= H_n for a slowly growing H_n,
  and (|A_n|+b(n))H_n = o(n), so b(n)+C(|A|+b(n))Delta(A) = o(n) while
  |R(A)| ~ n/2. A sublinear family of upper-half primorial-batched
  carriers simultaneously makes every lower integer up to n/H illegal
  without killing any upper-half target other than the carriers
  themselves; every surviving legal lower divisor d exceeds n/H and so
  has degree less than H.
implications:
  - Convergent with the sibling refutation but stronger in reservoir size, the position keeps half the upper half live while capping the maximum divisor degree at an arbitrarily slowly growing threshold.
  - Raises a new linear-side question, whether such low-degree linear-reservoir positions can be dynamically sustained by the maximizing player; sustained maintenance at threshold H would force roughly n/(2H) further moves.
failure_mechanism: >
  Primorial batching compresses the n/H dangerous lower roots into
  o(n/H) upper carrier moves: carriers of the form (product of all
  primes <= w) times a tail make every d <= n/H divide some carrier,
  while carriers sit in the upper half and are incomparable with the
  surviving reservoir; any legal lower d then satisfies d > n/H, giving
  deg_A(d) <= floor(n/d) < H, so Delta(A) <= H while |R(A)| ~ n/2 and
  |A|H = o(n).
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/researcher-R84-online-charging-single-lemma.md
---

# Verdict

The proposed charging inequality is **false**. In fact, for every candidate (b(n)=o(n)) and every fixed constant (C), there is a reachable position (A=A_n) such that

[
|R(A)|=\left(\frac12-o(1)\right)n,
\qquad
\Delta(A)\le H_n\to\infty,
\qquad
\bigl(|A|+b(n)\bigr)H_n=o(n).
]

Consequently,

[
b(n)+C\bigl(|A|+b(n)\bigr)\Delta(A)=o(n),
]

while (|R(A)|\sim n/2), contradicting the displayed inequality.

The construction is a **primorial-batching obstruction**: a sublinear family of upper-half carriers simultaneously makes every lower integer up to (n/H) illegal, without killing any upper-half target other than the carriers themselves. The setup and accepted results are those in the uploaded manuscript. 

---

## 1. The parametric counterexample

We first prove the following stronger statement.

### Theorem

Let (H=H(n)) satisfy

[
H\longrightarrow\infty,
\qquad
H\le n^{1/3}.
]

Then there is a reachable primitive position (A\subseteq U_n) such that

[
\boxed{
|A|
\ll
\frac{n}{H\log\log H}+H^{o(1)}
}
\tag{1}
]

and

[
\boxed{
R(A)=U_n\setminus A,
\qquad
\Delta(A)\le H.
}
\tag{2}
]

In particular,

[
|A|H=o(n)
\tag{3}
]

and

[
|R(A)|=\left(\frac12-o(1)\right)n.
\tag{4}
]

The main point is that (A) contains only (o(n/H)) carriers, even though it makes all (d\le n/H) illegal.

---

## 2. A primorial compression lemma

Put

[
x=\left\lfloor\frac nH\right\rfloor.
]

Choose

[
y=
\left\lfloor
\frac{\log H}{(\log\log H)^2}
\right\rfloor
]

and let

[
Q=\prod_{p\le y}p.
]

For sufficiently large (H),

[
\log Q
\le \pi(y)\log y
\le y\log y
=o(\log H),
]

so

[
Q\le H.
\tag{5}
]

For (d\le x), define its (Q)-stripped core by

[
\gamma(d)=\frac{d}{(d,Q)}.
]

Since (Q) is squarefree, this operation removes exactly one copy of every prime (p\le y) dividing (d).

Let

[
\mathcal G={\gamma(d):1\le d\le x}.
]

We claim

[
|\mathcal G|
\ll
\frac{x}{\log y}+3^{\pi(y)}.
\tag{6}
]

### Counting the stripped cores

For an integer (g), put

[
r=(g,Q).
]

Because (Q) is squarefree,

[
g\in\mathcal G
\quad\Longleftrightarrow\quad
gr\le x.
\tag{7}
]

Indeed, suppose (g=d/(d,Q)). Every prime dividing both (g) and (Q) must occur in (d) one additional time, so

[
g(g,Q)\mid d,
]

and hence (gr\le x).

Conversely, if (gr\le x), take (d=gr). Since (r=(g,Q)) and (Q) is squarefree,

[
(d,Q)=(gr,Q)=r,
]

so (d/(d,Q)=g).

Now partition according to (r=(g,Q)). Writing (g=rh), condition (7) becomes

[
r^2h\le x,
]

and ((g,Q)=r) is equivalent to

[
(h,Q/r)=1.
]

Therefore

[
|\mathcal G|
============

\sum_{r\mid Q}
#\left{
h\le\frac{x}{r^2}:
(h,Q/r)=1
\right}.
\tag{8}
]

By inclusion–exclusion, for squarefree (M),

[
#{h\le X:(h,M)=1}
=================

X\frac{\varphi(M)}M+O(2^{\omega(M)}).
\tag{9}
]

Substituting (9) into (8),

[
|\mathcal G|
\le
x\sum_{r\mid Q}
\frac1{r^2}
\frac{\varphi(Q/r)}{Q/r}
+
O\left(
\sum_{r\mid Q}2^{\omega(Q/r)}
\right).
\tag{10}
]

Let

[
P_y=\frac{\varphi(Q)}Q
=\prod_{p\le y}\left(1-\frac1p\right).
]

The main sum in (10) equals

[
\begin{aligned}
\sum_{r\mid Q}
\frac1{r^2}
\frac{\varphi(Q/r)}{Q/r}
&=
P_y
\sum_{r\mid Q}
\frac1{r^2}
\prod_{p\mid r}\left(1-\frac1p\right)^{-1}
\
&=
P_y
\prod_{p\le y}
\left(
1+\frac{1}{p^2(1-1/p)}
\right)
\
&=
P_y
\prod_{p\le y}
\left(
1+\frac1{p(p-1)}
\right).
\end{aligned}
\tag{11}
]

The last product is bounded by an absolute constant because

[
\sum_{p}\frac1{p(p-1)}<\infty.
]

Mertens’ estimate gives

[
P_y\ll\frac1{\log y}.
\tag{12}
]

For the error term,

[
\sum_{r\mid Q}2^{\omega(Q/r)}
=============================

3^{\pi(y)}.
\tag{13}
]

Equations (10)–(13) prove (6).

Our choice of (y) also gives

[
3^{\pi(y)}
\le 3^y
=======

\exp\left(
O\left(\frac{\log H}{(\log\log H)^2}\right)
\right)
=======

H^{o(1)},
\tag{14}
]

while

[
\log y=(1+o(1))\log\log H.
\tag{15}
]

Thus

[
|\mathcal G|
\ll
\frac{x}{\log\log H}+H^{o(1)}.
\tag{16}
]

---

## 3. Turning each stripped core into one upper carrier

For (m\le n), define its upper lift

[
\lambda(m)=m\left\lfloor\frac nm\right\rfloor.
]

Then

[
\lambda(m)\in U_n.
\tag{17}
]

To see this, let (q=\lfloor n/m\rfloor). If (q=1), then (m>n/2). If (q\ge2), then (n<(q+1)m), so

[
qm>\frac{q}{q+1}n\ge\frac23n>\frac n2.
]

For every (g\in\mathcal G), we have

[
gQ\le xQ\le xH\le n
]

by (5). Define

[
A={\lambda(gQ):g\in\mathcal G}.
\tag{18}
]

Duplicates are discarded, so

[
|A|\le|\mathcal G|.
]

All elements of (A) lie in (U_n). Distinct upper-half integers cannot divide one another, so (A) is primitive. Moreover, its members can be played in any order; hence (A) is a reachable position.

Now take any (2\le d\le x), and put

[
g=\gamma(d)=\frac d{(d,Q)}.
]

Writing (s=(d,Q)), we have (s\mid Q) and

[
d=gs\mid gQ\mid\lambda(gQ).
]

Thus every (d\le x) divides a member of (A), and so

[
\boxed{
[2,x]\cap\mathbb Z
\ \text{contains no legal lower move relative to }A.
}
\tag{19}
]

This is the crucial batching step: all (x-1) lower integers are blocked by only (o(x)) upper carriers.

---

## 4. The upper reservoir remains essentially untouched

Because (A\subseteq U_n), playing a member of (A) makes no other upper-half integer illegal. Distinct integers in (U_n) are incomparable.

Consequently,

[
R(A)=U_n\setminus A
]

and hence

[
|R(A)|
======

\left\lceil\frac n2\right\rceil-|A|.
\tag{20}
]

From (16),

[
|A|
\ll
\frac{n}{H\log\log H}+H^{o(1)}.
]

Since (H\le n^{1/3}),

[
\frac{H^{o(1)}}{n/H}
====================

\frac{H^{1+o(1)}}n
\le
n^{-2/3+o(1)}
=o(1).
]

Thus

[
|A|=o(n/H)=o(n),
]

and (20) gives

[
|R(A)|=\left(\frac12-o(1)\right)n.
\tag{21}
]

---

## 5. Every current legal star is small

By (19), every (d\in D(A)) satisfies

[
d>x=\left\lfloor\frac nH\right\rfloor.
]

Therefore

[
d>\frac nH.
]

The total number of multiples of such a (d) in ([1,n]), and hence certainly in (R(A)), is less than (H). Thus

[
\deg_A(d)\le \left\lfloor\frac nd\right\rfloor<H,
]

and consequently

[
\boxed{\Delta(A)\le H.}
\tag{22}
]

Combining the size estimate for (A) with (22),

[
\begin{aligned}
|A|H
&\ll
\frac n{\log\log H}
+
H^{1+o(1)}
\
&=o(n),
\end{aligned}
\tag{23}
]

again because (H\to\infty) and (H\le n^{1/3}).

This proves the parametric theorem.

---

# 6. Defeating an arbitrary (b(n)=o(n))

Suppose, toward a contradiction, that some nonnegative (b(n)=o(n)) and fixed (C) satisfy

[
|R(A)|
\le
b(n)+C\bigl(|A|+b(n)\bigr)\Delta(A)
\tag{24}
]

for every reachable position.

Choose

[
H=
\left\lfloor
\min\left{
n^{1/3},
\sqrt{\frac{n}{b(n)+1}}
\right}
\right\rfloor.
\tag{25}
]

Then (H\to\infty), (H\le n^{1/3}), and

[
\frac{b(n)H}{n}
\le
\frac{b(n)}n
\sqrt{\frac{n}{b(n)+1}}
\le
\sqrt{\frac{b(n)}n}
\longrightarrow0.
\tag{26}
]

Apply the theorem with this (H). We have

[
|A|H=o(n),
\qquad
b(n)H=o(n),
\qquad
\Delta(A)\le H.
]

Hence the right side of (24) is at most

[
\begin{aligned}
b(n)+C\bigl(|A|+b(n)\bigr)H
&=
o(n).
\end{aligned}
\tag{27}
]

But by (21),

[
|R(A)|=\left(\frac12-o(1)\right)n.
\tag{28}
]

Equations (27) and (28) contradict (24). Therefore:

[
\boxed{
\text{No }b(n)=o(n)\text{ and constant }C
\text{ can satisfy the proposed inequality.}
}
]

---

# 7. Failure of current-star and dyadic-shell certificates

The construction gives more than a numerical counterexample.

Let (k=|A|), and let (K) be any fixed constant. For every family

[
\mathcal F\subseteq D(A),
\qquad
|\mathcal F|\le K(k+b(n)),
]

we have

[
\begin{aligned}
\left|
\bigcup_{d\in\mathcal F}
{u\in R(A):d\mid u}
\right|
&\le
\sum_{d\in\mathcal F}\deg_A(d)
\
&\le
K(k+b(n))H
\
&=o(n).
\end{aligned}
\tag{29}
]

Yet (R(A)) has ((1/2-o(1))n) elements. Therefore no collection of

[
O(|A|+b(n))
]

current legal divisor stars can cover all but (o(n)) targets. This remains true even if the stars are disjoint; allowing bounded overlap only makes them less efficient.

It also rules out the direct dyadic-shell repair. At this position every legal star lies in a shell of size at most (H). Thus any shell certificate system with (O(|A|+b)) total certificates and capacity comparable to the top of its shell has total capacity

[
O((|A|+b)H)=o(n).
]

So the pointwise failure cannot be repaired merely by sorting the same current stars into dyadic degree classes.

---

# 8. The arithmetic mechanism

The construction exposes two related obstructions.

## 8.1 One carrier destroys an entire sparse almost-cover

The core (g=1) belongs to (\mathcal G), and the corresponding carrier

[
a_1=\lambda(Q)
]

is divisible by every prime (p\le y).

If (a_1) is played first, then in that single move all the pairwise-incomparable lower moves

[
{p:p\le y,\ p\text{ prime}}
]

become illegal. Their upper stars cover every (u\in U_n) except the (y)-rough integers. The latter number at most

[
\left(\frac nQ+1\right)\varphi(Q)
\ll
\frac n{\log y}+Q
=o(n).
]

Thus one upper carrier preempts an unbounded-size legal antichain whose stars cover almost all upper targets, while that carrier kills only itself in the upper half.

Any causal historical accounting which assigns each destroyed divisor-star certificate to the move that first made its root illegal must therefore give this single move at least (\pi(y)\to\infty) certificates.

## 8.2 Primorial stripping batches all dangerous roots

More generally, every (d\le x) is written as

[
d=g(d,Q),
\qquad
g=\frac d{(d,Q)}.
]

The carrier for (g) is divisible by (gQ), so it simultaneously blocks all integers having that stripped core.

There are (x-1) blocked roots but only

[
k=o(x)
]

carriers. Consequently, under any assignment of each blocked root to a witnessing carrier, some carrier receives at least

[
\frac{x-1}{k}\gg\log y\asymp\log\log H
]

root certificates. Thus bounded carrier multiplicity fails for the full family of destroyed roots.

This is not quadratic cross-product regeneration. It is a complementary obstruction: **primorial common-multiple batching**. A carrier can erase many high-degree potential moves while remaining incomparable with essentially every target those moves would have covered.

---

# 9. Exact scope of the disproof

The construction disproves:

[
|R(A)|\le b+C(|A|+b)\Delta(A),
]

every current-state reformulation using (O(|A|+b)) legal divisor stars, and every analogous dyadic-shell accounting whose certificate load is controlled by the current star degree.

It does not formally disprove an unrestricted history-dependent potential that awards a move credit proportional to the entire union of all stars it destroyed at the moment it was played. Such a potential would have to permit one carrier to receive unboundedly many divisor certificates and potentially linear target credit. That is precisely the bounded-multiplicity property the proposed charging argument was meant to avoid.

Hence the charging question has a negative answer, while the game itself remains unresolved:

[
\boxed{
\text{Sparse static covers cannot be converted into }
O(|A|+o(n))
\text{ bounded-multiplicity legal-star certificates.}
}
]

The new obstruction is that primorial carriers compress (n/H) dangerous lower roots into (o(n/H)) upper moves while preserving a ((1/2-o(1))n) live upper reservoir.

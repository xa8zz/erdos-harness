---
id: R80-nu-sublinear-sparse-covers-charging-gap
type: research
date: 2026-07-11
intent: >
  Full-solution attempt continuing from the fractional-invariant frontier,
  with reported exact-computation context supplied, free to attack either
  side of the reduction or abandon it.
predecessors:
  - R78-fractional-invariant-interdiction-frontier
action:
  kind: extends
  target: R78-fractional-invariant-interdiction-frontier
claim: >
  No unconditional resolution. Four new unconditional results. (1) After
  any prefix of size k, all but 2kz^2 + C 2^r (n/sqrt(log z) +
  (3/2)^{pi(z)}) live upper-half targets have at least r legal
  prime-removal divisors u/p with p <= z; hence for k = o(n) almost every
  live target has unboundedly many legal codimension-one divisors. (2)
  Uniformly over all primitive positions with |A| = o(n), the fractional
  packing value nu(A) is o(n) (dual witness: y_d = 1/r on legal lower
  moves plus unit slack on the o(n) exceptional targets), so the route to
  L(n) = Theta(n) by forcing nu(A) >= cn at sublinear time is closed:
  T + nu(A) = o(n) whenever T = o(n). (3) At every sublinear prefix there
  is even a static legal antichain of o(n) lower moves whose shadows cover
  all but o(n) live upper targets (random theta = r^{-1/2} selection plus
  divisibility-minimal pruning). (4) Pointwise unbounded interdiction: at
  any sublinear prefix with a linear live reservoir, some legal lower move
  kills at least (2 eta - o(1)) r(n) live targets. The single unresolved
  step for L(n) = o(n) is a bounded-multiplicity online charge: b(n)=o(n)
  and C with |R(A)| <= b(n) + C(|A|+b(n)) Delta(A) for reachable A, or an
  amortized dyadic-shell analogue; pointwise unbounded degree does not
  self-bootstrap since r(n) = O(log log H) kills per turn at horizon
  |A| ~ n/H totals o(n). Also: the alternating Bonferroni series satisfies
  W_infty >= 1 - J_1 > 0 with W_infty/2 ~ 0.18969, so higher-order
  Bonferroni on the same comparison profile cannot yield o(n).
implications:
  - The fractional-invariant route to a linear lower bound is closed; any Theta(n) proof must produce actual moves directly, not LP mass.
  - The sublinear side is reduced to organizing divisor stars into O(|A| + o(n)) online certificates with bounded multiplicity; sparse static covers exist but are preempted by mixed carriers that kill many incomparable cover elements at once.
  - Higher-order Bonferroni refinement of the 0.19n upper bound has a positive floor near 0.1897n; improvement must change the comparison profile.
  - Exact sandbox values L(20)=9, L(25)=11, L(30)=13; nu(empty)/n after one optimal upper carrier decreases 0.30, 0.25, 0.23 at n = 50, 100, 200 with LP optima certified by matching integral packings and covers.
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/followup-R80-full-solution-from-fractional-invariant.md
---

# Result

I did **not** obtain a valid unconditional proof of either

[
L(n)=\Theta(n)
\qquad\text{or}\qquad
L(n)=o(n).
]

I did obtain a new unconditional result that materially sharpens the accepted frontier:

> **At every state reached after (o(n)) moves, almost every live upper-half target has an unbounded number of legal codimension-one divisors. Consequently, uniformly over all such states,**
> [
> \nu(A)=o(n).
> ]
> **In fact, there is already a static legal antichain of (o(n)) lower moves whose upper shadows cover all but (o(n)) live upper targets.**

Thus the fractional-residual route cannot produce a nontrivial linear lower bound: (\nu(A)) cannot become (cn) before a linear number of moves has already been played. What remains is a genuinely online problem: Prolonger may preempt many members of each sparse static cover with one mixed carrier.

The manuscript’s unconditional bounds therefore remain

[
c_\delta\frac{n(\log\log n)^2}{\log n}
\le L(n)
\le
\bigl(0.1897123371+o(1)\bigr)n.
]



---

# 1. Uniformly many legal prime-removal divisors

Let (A) be any current primitive set, and write

[
R(A):={u\in U_n:u\text{ is legal relative to }A},
]

[
D(A):={d\in L_n:d\text{ is legal relative to }A}.
]

For (z<n/2) and (u\in R(A)), define

[
q_z(u;A):=
#\left{
p\le z:
p\text{ prime},\ p\mid u,\ \frac up\in D(A)
\right}.
]

Thus (q_z(u;A)) counts legal codimension-one divisors obtained by deleting a small prime factor.

## Theorem 1

Let (k=|A|). For every integer (r\ge1) and (3\le z<n/2),

[
\boxed{
#{u\in R(A):q_z(u;A)<r}
\le
2kz^2+
C2^r\left(
\frac{n}{\sqrt{\log z}}
+
\left(\frac32\right)^{\pi(z)}
\right)
}
\tag{1}
]

for an absolute constant (C).

### Proof

There are two reasons why (q_z(u;A)) may be small:

1. (u) has few distinct prime factors at most (z);
2. some divisor (u/p) has been made illegal by a played carrier.

We bound these separately.

## Step 1: counting blocked prime-removal directions

Consider a pair ((u,p)) with

[
u\in R(A),\qquad p\le z,\qquad p\mid u,
]

such that

[
d:=\frac up
]

is illegal.

Choose (a\in A) comparable with (d). It is impossible that (a\mid d), because then

[
a\mid d\mid u,
]

contradicting (u\in R(A)). Therefore

[
d\mid a.
]

Write

[
a=de=\frac up,e.
]

Since (a\le n) and (u>n/2),

[
e=\frac{ap}{u}<2p.
\tag{2}
]

For fixed (a) and (p), each integer (e<2p) determines at most one possible target,

[
u=\frac{ap}{e}.
]

Consequently, the total number of blocked pairs ((u,p)) is at most

[
\sum_{a\in A}\sum_{p\le z}(2p-1)
\le
2k\sum_{p\le z}p
\le 2kz^2.
\tag{3}
]

This is a count of blocked **directions**, and therefore also bounds the number of targets having at least one such blocked direction.

## Step 2: integers with few small prime factors

Put

[
\omega_z(m):=#{p\le z:p\mid m}.
]

We claim

[
#{m\le n:\omega_z(m)<r}
\le
C2^r\left(
\frac{n}{\sqrt{\log z}}
+
\left(\frac32\right)^{\pi(z)}
\right).
\tag{4}
]

Indeed,

[
\mathbf 1_{{\omega_z(m)<r}}
\le
2^{r-1}2^{-\omega_z(m)}.
]

Let

[
P(z):=\prod_{p\le z}p.
]

We have the exact expansion

[
2^{-\omega_z(m)}
================

\prod_{p\le z}
\left(1-\frac12\mathbf 1_{p\mid m}\right)
=========================================

\sum_{d\mid P(z)}
\left(-\frac12\right)^{\omega(d)}
\mathbf 1_{d\mid m}.
]

Summing over (m\le n) gives

[
\begin{aligned}
\sum_{m\le n}2^{-\omega_z(m)}
&=
\sum_{d\mid P(z)}
\left(-\frac12\right)^{\omega(d)}
\left\lfloor\frac nd\right\rfloor\
&=
n\prod_{p\le z}\left(1-\frac1{2p}\right)
+
O\left(
\sum_{d\mid P(z)}2^{-\omega(d)}
\right)\
&=
n\prod_{p\le z}\left(1-\frac1{2p}\right)
+
O\left(\left(\frac32\right)^{\pi(z)}\right).
\end{aligned}
]

Mertens’ theorem gives

[
\prod_{p\le z}\left(1-\frac1{2p}\right)
\ll
\frac1{\sqrt{\log z}},
]

because

[
\log\prod_{p\le z}\left(1-\frac1{2p}\right)
===========================================

# -\frac12\sum_{p\le z}\frac1p+O(1)

-\frac12\log\log z+O(1).
]

This proves (4).

## Step 3: combining the counts

If (q_z(u;A)<r) while (\omega_z(u)\ge r), at least one of the prime-removal directions (u/p) must have been blocked. By (3), there are at most (2kz^2) such targets.

The remaining targets satisfy (\omega_z(u)<r), and are bounded by (4). This proves (1). ∎

---

# 2. Consequence for every sublinear prefix

## Corollary 2

Let (k(n)=o(n)). There is a function (r(n)\to\infty) such that, uniformly over every primitive set (A) with

[
|A|\le k(n),
]

all but (o(n)) targets (u\in R(A)) have at least (r(n)) distinct legal codimension-one divisors.

### Proof

Choose

[
z_n:=
\min\left{
\left(\frac{n}{k(n)+1}\right)^{1/4},
(\log n)^{1/3}
\right}.
]

Then (z_n\to\infty), and

[
k(n)z_n^2
\le
k(n)\sqrt{\frac{n}{k(n)+1}}
===========================

# O\bigl(\sqrt{k(n)n}\bigr)

o(n).
]

Moreover,

[
\left(\frac32\right)^{\pi(z_n)}
\le
\exp\bigl(O((\log n)^{1/3})\bigr)
=================================

n^{o(1)}.
]

Now take

[
r(n):=
\left\lfloor
\frac18\log_2\log z_n
\right\rfloor.
]

Then (r(n)\to\infty), while

[
2^{r(n)}\le(\log z_n)^{1/8}.
]

Substituting into (1),

[
2^{r(n)}\frac{n}{\sqrt{\log z_n}}
\le
\frac{n}{(\log z_n)^{3/8}}
==========================

o(n),
]

and the remaining error terms are also (o(n)). ∎

This strictly strengthens the accepted “exact-only targets are (o(n))” result: not only does almost every live target retain one legal proper divisor, it retains an unbounded number of legal divisors of the particularly structured form (u/p).

---

# 3. An unbounded current-degree move exists

For (d\in D(A)), let

[
\deg_A(d):=
|{u\in R(A):d\mid u}|.
]

This is exactly the number of currently live upper targets newly killed by playing (d).

## Corollary 3

Suppose (|A|\le k(n)=o(n)), and for some fixed (\eta>0),

[
|R(A)|\ge \eta n.
]

Then

[
\max_{d\in D(A)}\deg_A(d)\longrightarrow\infty
]

uniformly over all such states.

More precisely, with (r(n)) from Corollary 2,

[
\max_{d\in D(A)}\deg_A(d)
\ge
(2\eta-o(1))r(n).
\tag{5}
]

### Proof

Except for (o(n)) targets, each (u\in R(A)) has at least (r(n)) distinct legal divisors (u/p). Hence the number of target-divisor incidences is at least

[
r(n)(|R(A)|-o(n)).
]

There are at most (n/2) possible lower divisors. Therefore one legal divisor has degree at least

[
\frac{r(n)(|R(A)|-o(n))}{n/2}
\ge
(2\eta-o(1))r(n).
]

∎

Thus the first half of the desired online interdiction statement is true:

> At every genuinely sublinear prefix with a linear live upper reservoir, Shortener has a move killing unbounded newly-live mass.

The failure is not pointwise existence. It is amortization over sufficiently many rounds.

---

# 4. The fractional residual invariant is always sublinear at sublinear time

Recall the dual formulation of the accepted LP invariant:

[
\nu(A)=
\min\left(
\sum_{d\in D(A)}y_d+\sum_{u\in R(A)}s_u
\right),
]

where (y_d,s_u\ge0) and

[
s_u+\sum_{\substack{d\in D(A)\d\mid u}}y_d\ge1
\qquad(u\in R(A)).
\tag{6}
]

## Theorem 4

For every (k(n)=o(n)),

[
\boxed{
\sup_{\substack{A\text{ primitive}\|A|\le k(n)}}
\frac{\nu(A)}n
\longrightarrow0.
}
\tag{7}
]

### Proof

Let (r=r(n)\to\infty) be supplied by Corollary 2, and let (E(A)) be the exceptional set of live upper targets having fewer than (r) legal prime-removal divisors. Uniformly,

[
|E(A)|=o(n).
]

Set

[
y_d:=\frac1r
\qquad(d\in D(A)),
]

and

[
s_u:=
\begin{cases}
1,&u\in E(A),\
0,&u\notin E(A).
\end{cases}
]

Every nonexceptional target has at least (r) distinct legal divisors, so its constraint in (6) receives total (y)-mass at least one. Every exceptional target is covered by (s_u=1). The solution is therefore feasible, with cost

[
\sum_{d\in D(A)}y_d+\sum_{u\in R(A)}s_u
\le
\frac{n}{2r}+o(n)
=================

o(n).
]

By duality, (\nu(A)=o(n)), uniformly. ∎

## Consequence for the proposed linear-lower-bound route

Because (T=o(n)) and (\nu(A)=o(n)) simultaneously imply

[
T+\nu(A)=o(n),
]

the monotone invariant (T+\nu(A)) cannot certify a linear final length after any sublinear setup.

Thus a strategy forcing (\nu(A)\ge cn) can only reach such a state after (\Omega(n)) moves have already occurred. At that point linearity has already been obtained from (T), and the LP contributes no nontrivial lower-bound mechanism.

This does not disprove (L(n)=\Theta(n)), but it closes the stated LP route to proving it.

---

# 5. There is even a sparse static integral cover

The preceding argument is not merely fractional.

## Corollary 5

Uniformly for every primitive (A) with (|A|=o(n)), there exists an antichain

[
B\subseteq D(A)
]

such that

[
|B|=o(n)
]

and

[
\left|
R(A)\setminus\bigcup_{d\in B}M_n(d)
\right|
=o(n).
\tag{8}
]

Thus, if Prolonger made no intervening moves, Shortener could append (o(n)) mutually legal lower moves and cover all but (o(n)) of the live upper half.

### Proof

Let (r=r(n)\to\infty) and let (E(A)) again denote the (o(n)) exceptional targets.

Independently include every (d\in D(A)) in a random set (S) with probability

[
\theta:=r^{-1/2}.
]

Then

[
\mathbb E|S|
\le
\frac{n}{2\sqrt r}
==================

o(n).
]

Every nonexceptional target has at least (r) legal candidate divisors, so

[
\Pr\left(
S\cap{d\in D(A):d\mid u}=\varnothing
\right)
\le
(1-\theta)^r
\le
e^{-\sqrt r}
=o(1).
]

Hence the expected number of uncovered targets is at most

[
|E(A)|+ne^{-\sqrt r}
====================

o(n).
]

Some realization (S) therefore has both size (o(n)) and uncovered set (o(n)).

Now discard every member (d\in S) that is divisible by another member of (S). Let (B) be the remaining divisibility-minimal elements. Then (B) is an antichain. Moreover, deleting such a (d) loses no upper coverage: if (e\mid d), then

[
M_n(d)\subseteq M_n(e).
]

Thus (B) has the same upper-shadow union as (S), proving (8). ∎

This makes the obstruction exceptionally clean:

> The difficulty is no longer finding a sparse cover. Sparse covers exist at every sublinear state. The difficulty is executing one online while Prolonger inserts mixed carriers.

---

# 6. The one step I cannot close

Let

[
\Delta(A):=
\max_{d\in D(A)}|M_n(d)\cap R(A)|.
]

The theorem above gives only

[
|R(A)|
\le
o(n)+\frac{n}{2r(n)},\Delta(A),
\qquad r(n)\to\infty.
\tag{9}
]

A sufficient online charging theorem would have the substantially stronger form

[
\boxed{
|R(A)|
\le
b(n)+C\bigl(|A|+b(n)\bigr)\Delta(A),
\qquad b(n)=o(n),
}
\tag{10}
]

or an amortized dyadic-shell analogue of (10), with targets not accounted for by the displayed star charged with bounded multiplicity to earlier actual moves.

Equation (10) would say that the relevant divisor stars can be organized into only (O(|A|+b(n))) essentially distinct online certificates. A max-degree strategy would then give

[
\Delta(A)
\gg
\frac{|R(A)|}{|A|+b(n)},
]

and the usual multiplicative-decrease calculation would reduce a linear reservoir to (o(n)) in (o(n)) rounds. A shell-uniform form, together with maximal dyadic lifts, would control subsequent lower-level moves.

What I can prove is only that the number of available certificates per target tends to infinity. I cannot prove that those certificates can be charged disjointly, or even with bounded multiplicity, across time.

The failure is concrete. Let (B) be the sparse static antichain from Corollary 5. An intervening Prolonger move (c) can make every (d\in B) with (d\mid c) illegal. Because (B) is an antichain, this does not force (c) to be comparable with the targets in

[
\bigcup_{\substack{d\in B\d\mid c}}M_n(d)\setminus M_n(c).
]

Moreover, antichainness of (B) does not bound

[
#{d\in B:d\mid c};
]

many incomparable divisors may have least common multiple at most (n). Recomputing a new sparse cover after every such carrier gives new static certificates, but does not prevent repeated counting of the same unresolved target mass.

That is precisely the missing online disjointness/injective-charging step.

## Why the unbounded degree alone is quantitatively insufficient

Take a prospective horizon

[
|A|\asymp \frac nH,
\qquad H\to\infty.
]

The elementary parameter choice in Theorem 1 supplies only approximately

[
r(n)=O(\log\log H)
]

legal prime-removal directions per typical target. Even if Shortener obtained that many fresh kills on every one of (n/H) turns, the certified total would be only

[
\frac nH\log\log H=o(n).
]

Thus “the maximum current degree tends to infinity” does not self-bootstrap. What is needed is degree on the scale (H=n/|A|), or a separate charge showing that the deficit has already been paid for by prior moves.

---

# 7. Sandbox diagnostics

The LP calculations on small boards show substantial finite-size jumps after one upper carrier:

| (n) | (\nu(\varnothing)) | (\max_{u\in U_n}\nu({u})) | one maximizing (u) |
| --: | -----------------: | ------------------------: | -----------------: |
|  50 |                  9 |                        15 |                 28 |
| 100 |                 14 |                        25 |                 54 |
| 200 |                 27 |                        46 |                104 |

For these entries, the LP optimum was certified by matching integral primal packings and integral covers of the same cardinality. The ratios after one move decrease from (0.30) to (0.25) to (0.23), and Theorem 4 proves that this ratio must eventually tend to zero for any (o(n))-sized prefix.

Independent exact minimax recursion gave

[
L(20)=9,\qquad L(25)=11,\qquad L(30)=13,
]

consistent with the reported computations but offering no asymptotic separation.

There is also a rigorous obstruction to merely extending the known prime-prefix Bonferroni calculation to higher order. Put

[
I_r:=
\int_{u_1+\cdots+u_r\le1}
\prod_{i=1}^r\rho(u_i),du_1\cdots du_r,
\qquad
J_r=\frac{I_r}{r!}.
]

Because (0\le\rho\le1),

[
I_{r+1}\le I_r,
\qquad
J_{r+1}\le\frac{J_r}{r+1}.
]

Hence the infinite alternating sum satisfies

[
\begin{aligned}
W_\infty
&=
1-J_1+J_2-J_3+\cdots\
&=
1-J_1+(J_2-J_3)+(J_4-J_5)+\cdots\
&\ge 1-J_1>0.
\end{aligned}
]

So even an all-orders version of that same comparison profile retains a positive linear constant. Numerical convolution gave

[
\frac{W_\infty}{2}\approx0.18969,
]

very close to the fourth-order value. Higher Bonferroni order alone therefore cannot yield (o(n)).

---

# Final status

The strongest unconditional conclusion reached here is:

[
\boxed{
|A|=o(n)
\quad\Longrightarrow\quad
\nu(A)=o(n)
}
]

uniformly over all current game states, together with the stronger static fact that all but (o(n)) live upper targets admit an (o(n))-sized legal antichain cover.

This eliminates a nontrivial linear lower bound through the fractional residual invariant and proves pointwise unbounded fresh interdiction. It does **not** settle the game because static sparse covers can be repeatedly preempted by mixed carriers.

The single unresolved step is therefore:

[
\boxed{\text{Convert the sparse static covers into a bounded-multiplicity online charge.}}
]

I do not have a valid proof of that step, nor a construction disproving it.

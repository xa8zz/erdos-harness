---
id: R82-charging-inequality-disproved-exact-only-bank
type: refutation
date: 2026-07-11
intent: >
  Prove or disprove the proposed bounded-multiplicity online charging
  inequality |R(A)| <= b(n) + C(|A|+b(n))Delta(A), or an amortized variant
  sufficient for a sublinear game bound, with the trapping sweep and
  static completion theorem available as tools.
predecessors:
  - R80-nu-sublinear-sparse-covers-charging-gap
  - R81-static-completion-smooth-rough-sweep
action:
  kind: refutes
  target: R80-nu-sublinear-sparse-covers-charging-gap
claim: >
  The candidate state inequality is unconditionally disproved, and more
  strongly no single b(n) = o(n) works even on positions satisfying the
  smooth/rough trapping conclusion. For every b(n) = o(n) and constant C
  there are reachable primitive positions A_n with |A_n| = o(n),
  |R(A_n)| >> b(n), a target set T of z-rough integers with smooth and
  rough parts both nontrivial (|T| >> n/g, g = min{sqrt(H), sqrt(log Y)},
  H = n/(b+1)), whose every proper divisor is blocked by a much smaller
  antichain of divisibility-maximal face carriers marked by the prime 5,
  while exactly one legal lower move d_0 = 7q remains with zero live
  upper multiples. Hence Delta(A_n) = 0 while |R(A_n)| >> b(n). The same
  construction refutes every dyadic-shell analogue with fixed o(n)
  exceptional allowance. The refutation is not game-terminal: exact-only
  targets, when played, are actual moves, so a genuinely amortized proof
  may bank them dynamically (the count of targets ever entering the
  exact-only set along a play with t moves is o(n) + t). The sharply
  remaining sub-step: for trapped positions arising under an actual
  Shortener strategy, prove a bounded-multiplicity shell-stable charge
  for Q(A) = R(A) minus exact-only targets, e.g.
  |Q(A)| <= C(|A|+beta(n))Delta_Q(A) + o(n), with exact-only transfers
  paid from the cumulative exact-move bank. The concrete obstruction is
  quadratic regeneration: t trapped carriers p_i q_i yield t(t-1) minimal
  lower certificates and naive assignment incurs multiplicity Theta(t).
implications:
  - The refuted target is the fixed-exceptional-budget form of the charging inequality proposed as sufficient; the underlying results of the target round (nu sublinear, sparse covers, unbounded interdiction) are unaffected.
  - Any viable sublinear proof must use a history-sensitive exact-only bank plus a bounded-multiplicity charge for the non-exact trapped residual family; three sufficient alternatives are identified (cross-products coalesce into large stars, have total mass o(n), or charge amortizedly to banked exact targets).
failure_mechanism: >
  Diagonalization against any fixed b(n): choose H = n/(b(n)+1),
  g = min{sqrt(H), sqrt(log Y)}, z = e^g. The z-rough targets with
  nontrivial Y-smooth and Y-rough parts number >> n/g >> b(n), their
  codimension-one faces t/p number o(n)/... and are dominated by <= n/z
  divisibility-maximal carriers 5g, so a sublinear antichain blocks every
  proper divisor of every target; adding carriers {2,3,35,5q} traps the
  unique remaining legal lower move d_0 = 7q with degree zero. The
  proposed bound then reads |R(A)| <= b(n), contradicting |R(A)| >> b(n)
  with |T|/(b(n)+1) >= sqrt(H) -> infinity.
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/followup-R82-online-charging-theorem.md
---

# Verdict

[
\boxed{\text{Inequality (10) is false.}}
]

More strongly, there is **no single function (b(n)=o(n))** for which (10) holds uniformly over all reachable sublinear positions, even after imposing the stated smooth/rough trapping conclusion.

For every proposed (b(n)=o(n)) and every constant (C), I construct reachable primitive positions (A_n) such that

[
|A_n|=o(n),\qquad |R(A_n)|\gg b(n),
]

while

[
D(A_n)={d_n},\qquad
|M_n(d_n)\cap R(A_n)|=0.
]

Thus (\Delta(A_n)=0), and (10) would assert

[
|R(A_n)|\le b(n),
]

a contradiction.

The construction uses the accepted static completion theorem. The standard prime estimates used below are also among those used in the supplied manuscript. 

---

# 1. Statement of the counterexample

Fix any nonnegative function (b(n)=o(n)). Put

[
H=H(n):=\frac{n}{b(n)+1},
]

so (H\to\infty). Let

[
Y:=\frac14\log n,
]

the trapping threshold from the new context, and define

[
g:=\min\left{\sqrt H,\sqrt{\log Y}\right},
\qquad
z:=e^g.
\tag{1}
]

Then

[
g\to\infty,\qquad
\frac{g}{H}\to0,\qquad
\frac{g}{\log Y}\to0,
\tag{2}
]

and consequently

[
7<z<Y
]

for all sufficiently large (n).

I will construct (A=A_n) with the following properties:

[
\begin{aligned}
&|A|=o(n),\
&\text{the only legal upper moves are a set }\mathcal T
\text{ with }|\mathcal T|\gg n/g,\
&\text{the only legal lower move is }d_0,\
&d_0\text{ has no live upper multiple},\
&\text{every live move satisfies the }Y\text{-smooth/rough trapping property}.
\end{aligned}
\tag{3}
]

Since

[
\frac{|\mathcal T|}{b(n)+1}
\gg
\frac{n/g}{n/H}
===============

\frac Hg
\longrightarrow\infty,
\tag{4}
]

this will disprove (10).

---

# 2. A large sublinear family of mixed smooth/rough targets

For an integer (m), let

[
s_Y(m):=\prod_{\substack{p^a\parallel m\p\le Y}}p^a,
\qquad
r_Y(m):=\frac{m}{s_Y(m)}.
]

Define

[
\mathcal T:=
\left{
t\in U_n:
P^-(t)>z,\quad
s_Y(t)>1,\quad
r_Y(t)>1
\right}.
\tag{5}
]

Thus every (t\in\mathcal T):

* is (z)-rough;
* has at least one prime factor in ((z,Y]);
* has at least one prime factor greater than (Y).

In particular, both (s_Y(t)) and (r_Y(t)) are nontrivial proper divisors of (t).

## Lemma 1

There is an absolute constant (c>0) such that

[
|\mathcal T|\ge c\frac ng
\tag{6}
]

for all sufficiently large (n).

### Proof

Let

[
Q(w):=\prod_{p\le w}p,
\qquad
V(w):=\prod_{p\le w}\left(1-\frac1p\right).
]

By inclusion-exclusion,

[
#{m\in U_n:(m,Q(z))=1}
======================

\frac n2V(z)+O!\left(2^{\pi(z)}\right).
\tag{7}
]

Mertens’ product theorem gives

[
V(z)\asymp\frac1{\log z}=\frac1g.
\tag{8}
]

Furthermore, because

[
z=e^g\le \exp!\left(\sqrt{\log Y}\right)
=\exp!\left(O(\sqrt{\log\log n})\right),
]

we have

[
2^{\pi(z)}=n^{o(1)}.
]

Therefore the number of (z)-rough integers in (U_n) is

[
\gg \frac ng.
\tag{9}
]

We must discard those with (s_Y(t)=1), namely the (Y)-rough integers. Another inclusion-exclusion estimate gives

[
#{m\in U_n:P^-(m)>Y}
\ll
\frac n{\log Y}+n^{o(1)}
========================

o!\left(\frac ng\right),
\tag{10}
]

because (g=o(\log Y)).

We must also discard the (Y)-smooth integers. Rankin’s elementary estimate with exponent (1/2) gives

[
\begin{aligned}
\Psi(n,Y)
&\le
n^{1/2}
\prod_{p\le Y}\left(1-p^{-1/2}\right)^{-1}\
&\le
n^{1/2}\exp(O(\sqrt Y))
=======================

# n^{1/2+o(1)}

o!\left(\frac ng\right).
\end{aligned}
\tag{11}
]

Subtracting (10) and (11) from (9) proves (6). ∎

By (1),

[
g\le\sqrt H,
]

and hence

[
\frac{|\mathcal T|}{b(n)+1}
\gg
\frac Hg
\ge \sqrt H
\longrightarrow\infty.
\tag{12}
]

So (\mathcal T) is much larger than the proposed exceptional budget (b(n)), although (|\mathcal T|=o(n)).

---

# 3. Sparse carriers blocking every proper divisor of every target

Form the family of codimension-one faces

[
\mathcal F:=
\left{
\frac tp:
t\in\mathcal T,\ p\mid t\text{ prime},\ \frac tp\ge2
\right}.
\tag{13}
]

Since every prime factor of (t) exceeds (z),

[
f\le\frac nz
\qquad(f\in\mathcal F).
\tag{14}
]

Let (\mathcal G) be the set of divisibility-maximal elements of (\mathcal F). Then (\mathcal G) is an antichain and

[
|\mathcal G|\le\frac nz=o(n).
\tag{15}
]

Use (5) as a marker and put

[
P_{\mathrm{face}}:={5g:g\in\mathcal G}.
\tag{16}
]

For large (n),

[
5g\le\frac{5n}{z}<\frac n2,
\tag{17}
]

so these are board elements. Since the elements of (\mathcal G) are pairwise incomparable, the elements of (P_{\mathrm{face}}) are pairwise incomparable.

## Lemma 2

Every (t\in\mathcal T) is a minimal legal element relative to (P_{\mathrm{face}}).

### Proof

First, (t) is legal. It is (z)-rough and therefore not divisible by (5), whereas every carrier (5g) is divisible by (5). Hence no (5g) divides (t). Conversely, by (17),

[
5g<\frac n2<t,
]

so (t) cannot divide (5g).

Now let (d\ge2) be any proper divisor of (t). Choose a prime (p\mid t) such that

[
v_p(d)<v_p(t).
]

Then

[
d\mid\frac tp.
]

The element (t/p) belongs to (\mathcal F), and hence divides some maximal (g\in\mathcal G). Consequently,

[
d\mid g\mid5g.
]

Thus every proper divisor (d) is illegal, while (t) itself is legal. ∎

This is the principal compression mechanism:

[
|P_{\mathrm{face}}|
\le\frac n{e^g},
\qquad
|\mathcal T|\gg\frac ng,
]

so

[
\frac{|\mathcal T|}{|P_{\mathrm{face}}|}
\gg
\frac{e^g}{g}
\longrightarrow\infty.
\tag{18}
]

An arbitrarily large sublinear exact-only reservoir is created from a much smaller antichain of face carriers.

---

# 4. A trapped lower move with upper degree zero

To avoid any convention about the maximum over an empty set (D(A)), I also leave exactly one lower move legal, but arrange that it has no live upper multiple.

By the prime number theorem, choose a prime

[
q\in\left(\frac n{28},\frac n{21}\right].
\tag{19}
]

Put

[
d_0:=7q.
\tag{20}
]

Then

[
\frac n4<d_0\le\frac n3.
\tag{21}
]

Add the four auxiliary carriers

[
2,\qquad 3,\qquad 35,\qquad 5q.
]

Define

[
P_0:=
P_{\mathrm{face}}\cup{2,3,35,5q}.
\tag{22}
]

For sufficiently large (n), this is primitive:

* every (g\in\mathcal G) is (z)-rough, so it is divisible by none of (2,3,5,7);
* (5g<q) because (5n/z<n/28<q);
* (q) is prime and is not (7).

Also,

[
|P_0|\le \frac nz+4=o(n).
\tag{23}
]

The number (d_0) is legal relative to (P_0):

* neither (35=5\cdot7) nor (5q) divides (7q);
* neither (2) nor (3) divides (7q);
* every face carrier (5g) contains the marker (5), while (d_0) does not.

Its only nontrivial proper divisors are (7) and (q), and these are blocked by (35) and (5q), respectively. Therefore

[
d_0\in\mathcal M(P_0).
\tag{24}
]

Furthermore, every proper multiple of (d_0) on the board is blocked. From (21), such a multiple can only be

[
2d_0\quad\text{or}\quad3d_0,
]

and these are blocked by the selected moves (2) and (3).

Finally, no (t\in\mathcal T) is divisible by (d_0), because (7\le z) while every (t\in\mathcal T) is (z)-rough.

---

# 5. The position already satisfies smooth/rough trapping

The trapping threshold is (Y=\frac14\log n).

For every (t\in\mathcal T), both

[
s_Y(t)>1,\qquad r_Y(t)>1
]

are proper divisors of (t). Lemma 2 shows that **every** proper divisor of (t) divides one of the played face carriers. In particular,

[
s_Y(t)\mid c_s,
\qquad
r_Y(t)\mid c_r
]

for some (c_s,c_r\in P_{\mathrm{face}}).

These two carriers must be distinct: if one carrier were divisible by both coprime factors (s_Y(t)) and (r_Y(t)), it would be divisible by

[
s_Y(t)r_Y(t)=t,
]

but every face carrier is less than (n/2<t).

For the lower element (d_0=7q),

[
s_Y(d_0)=7,\qquad r_Y(d_0)=q,
]

and

[
7\mid35,\qquad q\mid5q.
]

Thus every move that will remain legal in the final position satisfies precisely the supplied trapping conclusion.

---

# 6. Isolating the desired legal set using static completion

Apply the accepted static completion theorem to (P_0). Let

[
\mathcal M(P_0)
]

be the set of minimal legal elements. We have proved

[
\mathcal T\cup{d_0}\subseteq\mathcal M(P_0).
\tag{25}
]

The theorem gives

[
|\mathcal M(P_0)|=o(n)
]

and says that

[
B:=P_0\cup\mathcal M(P_0)
]

is a maximal primitive set.

Now remove the elements that we want to leave legal:

[
A:=
B\setminus\bigl(\mathcal T\cup{d_0}\bigr).
\tag{26}
]

Since (B) is primitive, so is (A), and

[
|A|
\le |P_0|+|\mathcal M(P_0)|
=o(n).
\tag{27}
]

## Lemma 3

The complete legal set relative to (A) is exactly

[
\mathcal T\cup{d_0}.
\tag{28}
]

### Proof

All members of (\mathcal T\cup{d_0}) are legal relative to (A), because they and (A) are disjoint subsets of the primitive set (B).

Conversely, suppose (x\notin A) is legal relative to (A). If (x\in B), then by (26),

[
x\in\mathcal T\cup{d_0}.
]

Suppose instead that (x\notin B). Since (B) is maximal, (x) is comparable with some element of (B). Since (x) is legal relative to (A), every such comparable element must lie in (\mathcal T\cup{d_0}).

If (x) is comparable with (t\in\mathcal T), then:

* (t\mid x) forces (x=t), since (t>n/2);
* if (x\mid t) properly, then Lemma 2 gives a carrier in (P_{\mathrm{face}}\subseteq A) divisible by (x), contradicting the legality of (x).

If (x) is comparable with (d_0), then:

* a proper divisor of (d_0) is (7) or (q), blocked by (35) or (5q);
* a proper multiple is (2d_0) or (3d_0), blocked by (2) or (3).

Again (x) cannot be legal. This proves (28). ∎

Consequently,

[
R(A)=\mathcal T,
\qquad
D(A)={d_0}.
\tag{29}
]

Moreover,

[
M_n(d_0)\cap R(A)=\varnothing,
]

so

[
\Delta(A)=0.
\tag{30}
]

The position is reachable: list the elements of the primitive set (A) in any order and let the players cooperatively choose them. Every prefix remains primitive.

---

# 7. Contradiction to (10)

Suppose that for some (b(n)=o(n)) and constant (C), inequality (10) held for every reachable sublinear position:

[
|R(A)|
\le
b(n)+C\bigl(|A|+b(n)\bigr)\Delta(A).
]

For the constructed position, (29)–(30) give

[
|\mathcal T|\le b(n).
\tag{31}
]

But by (12),

[
\frac{|\mathcal T|}{b(n)+1}\longrightarrow\infty.
]

This contradicts (31).

Therefore:

[
\boxed{
\text{No uniform inequality of the form (10) exists, even on trapped positions.}
}
]

The failure is stronger than unbounded multiplicity: at the final state there is **no positive legal divisor shadow at all**. Every one of the (\gg n/g) live upper targets would have to be placed into the exceptional budget, and the construction diagonalizes against every predetermined (b(n)=o(n)).

Because all these targets lie in the upper shell (U_n), the same construction refutes any dyadic-shell analogue whose charged capacity vanishes when the relevant shell has no legal divisor star and whose total exceptional allowance is a fixed (o(n)).

---

# 8. Why this does not prove a linear game lower bound

The reservoir (\mathcal T) is always sublinear:

[
|\mathcal T|\asymp \frac ng=o(n).
]

Thus, although it defeats every predetermined sublinear error function by choosing (g) even more slowly, it does not itself force (\Theta(n)) moves.

There is a useful history-sensitive replacement for a uniform exceptional budget.

Define the exact-only upper set

[
E(A):=
\left{
u\in R(A):
\text{no legal proper divisor of }u\text{ exists}
\right}.
\tag{32}
]

## Lemma 4: cumulative exact-only regeneration is sublinear

Along any history containing (t=o(n)) moves, the number of distinct upper targets that have ever entered (E) is (o(n)).

### Proof

Once an upper target (u) enters (E), all of its proper divisors are illegal forever. Since (u>n/2), it has no proper multiple on the board. Therefore no future move other than (u) itself can remove it from the legal set.

Consequently, every upper target that has ever entered (E) is either:

1. still currently live in (E); or
2. one of the at most (t) targets already played.

At the current state,

[
E(A)\subseteq\mathcal M(A).
]

The static completion theorem gives

[
|\mathcal M(A)|=o(n)
]

because (|A|=t=o(n)). Hence

[
#{\text{targets ever entering }E}
\le |E(A)|+t=o(n).
]

∎

Thus a genuinely amortized proof may bank exact-only targets dynamically rather than trying to dominate them by one universal function (b(n)). The counterexample proves that this history-sensitive bank is necessary.

---

# 9. The precise remaining sub-step

After removing exact-only targets, put

[
Q(A):=R(A)\setminus E(A)
]

and

[
\Delta_Q(A):=
\max_{d\in D(A)}
|{u\in Q(A):d\mid u}|.
]

The unresolved step is now sharply:

[
\boxed{
\begin{minipage}{0.86\linewidth}
For trapped positions arising under an actual Shortener strategy, prove a
bounded-multiplicity, shell-stable charge for (Q(A)), while allowing
targets transferred from (Q(A)) into (E(A)) to be paid from the cumulative
exact-move bank of Lemma 4.
\end{minipage}
}
]

A representative first-shell form would be

[
|Q(A)|
\le
C\bigl(|A|+\beta(n)\bigr)\Delta_Q(A)+o(n),
\tag{33}
]

with parameters that remain self-consistent over an (o(n))-move maximum-degree phase. A dyadic version must additionally control lower-shell moves through maximal lifts.

I cannot prove (33). The concrete obstruction is still quadratic regeneration. From (t) trapped carriers (p_iq_i), the legal cross-products (p_iq_j) form (t(t-1)) distinct minimal lower certificates. Merely assigning each cross-product to either of its two trapping carriers incurs multiplicity (\Theta(t)). What is missing is a proof that, after shell restriction, these cross-products either:

* coalesce into legal stars of correspondingly large degree; or
* have total mass (o(n)); or
* can be charged amortizedly to exact targets already entering the bank.

I do not have a valid argument establishing any of these alternatives in full generality.

So the final status is:

[
\boxed{\text{Inequality (10) is unconditionally disproved.}}
]

A viable (L(n)=o(n)) proof must replace its fixed exceptional term by a dynamic exact-only bank and then solve the still-open bounded-multiplicity problem for the non-exact, trapped residual family.

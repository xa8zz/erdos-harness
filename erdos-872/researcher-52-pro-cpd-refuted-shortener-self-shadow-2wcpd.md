The definitive outcome is a **structural negative theorem**: the one-sided CPD cannot be extended to the fully game-legal dynamic setting. The obstruction is not Prolonger’s shadow; it is **Shortener’s own lower shadow**. Once full antichain legality is enforced, prior Shortener blockers can make every small candidate separator illegal while removing essentially no live packet mass.

The correct replacement is a two-sided weighted covering-profile dichotomy. I prove it below. But that replacement does not close (r_1) by itself: it exposes a missing invariant that is not optional.

[
\boxed{
\text{Missing ingredient: a weighted self-shadow sparsity invariant for Shortener’s own blockers.}
}
]

Without that invariant, CPD-type separator extraction can be completely disabled in a central packet with almost full residual entropy and with no corresponding Prolonger shadow to charge.

---

## 1. Full game-legality changes CPD

Let (P) be a packet with

[
|P|=N=h+\ell,\qquad \ell\sim \frac{h}{\log h}.
]

Rank-(h) Prolonger moves are (h)-sets

[
B=P\setminus C,\qquad C\in \binom P\ell.
]

Let prior Prolonger complements be

[
\mathcal C={C_1,\dots,C_s},
]

and prior Shortener blockers be

[
\mathcal D={D_1,\dots,D_r}.
]

A future Shortener blocker (Q) is game-legal only if it is incomparable with every prior Shortener blocker:

[
Q\nsubseteq D_j
\quad\text{and}\quad
D_j\nsubseteq Q
\qquad\forall j.
]

This is the missing condition in the one-sided WLST/CPD formulation. The condition (D_j\nsubseteq Q) alone is insufficient. The other condition, (Q\nsubseteq D_j), is fatal for CPD.

A legal relative blocker must also hit every Prolonger complement:

[
Q\cap C_i\neq\varnothing
\quad\forall i,
]

equivalently

[
Q\nsubseteq B_i=P\setminus C_i.
]

The capture of (Q), under a packet measure (\pi) on live complements, is

[
\operatorname{cap}(Q)
=====================

\pi{C:C\cap Q=\varnothing}.
]

---

## 2. The correct replacement: Two-Sided Weighted CPD

Fix (q) and a capture threshold (\eta). Define the high-capture candidate family

[
\mathcal Q_{q,\eta}
===================

{Q\subseteq P: |Q|\le q,\ \operatorname{cap}(Q)\ge \eta}.
]

For a Prolonger top set (B_i=P\setminus C_i), define its separator-killing shadow

[
\Gamma_q(B_i)
=============

{Q\in\mathcal Q_{q,\eta}: Q\subseteq B_i}.
]

For a prior Shortener blocker (D_j), define its two-sided illegality shadow

[
\Lambda_q(D_j)
==============

{Q\in\mathcal Q_{q,\eta}: Q\subseteq D_j\text{ or }D_j\subseteq Q}.
]

Then the exact dichotomy is:

[
\boxed{
\text{Either a legal }Q\in\mathcal Q_{q,\eta}\text{ exists,}
}
]

or

[
\boxed{
\mathcal Q_{q,\eta}
\subseteq
\bigcup_i \Gamma_q(B_i)
\ \cup
\bigcup_j \Lambda_q(D_j).
}
]

This is immediate but important. If (Q\in\mathcal Q_{q,\eta}) lies outside every (\Gamma_q(B_i)), then (Q\nsubseteq B_i) for every prior Prolonger move, hence (Q\cap C_i\neq\varnothing). If it also lies outside every (\Lambda_q(D_j)), then it is incomparable with every prior Shortener blocker. Therefore it is a legal relative blocker with capture at least (\eta).

Equivalently, for any probability weight (\nu) on (\mathcal Q_{q,\eta}), failure of separator extraction implies

[
1
\le
\sum_i \nu(\Gamma_q(B_i))
+
\sum_j \nu(\Lambda_q(D_j)).
\tag{2WCPD}
]

This is the sharp replacement for CPD. It handles multi-apex, arbitrary (\mathcal D), nested packet products, and weighted Sathe-Selberg measures. But it also shows why the original CPD cannot close: the obstruction may be entirely on the Shortener side.

---

## 3. Multi-apex stress test

If (\mathcal D) consists of (a) singleton blockers

[
{x_1},\dots,{x_a},
]

then future complements must contain every (x_i). After contracting those apices, the live complement space is

[
\binom{P\setminus X}{\ell-a},
\qquad X={x_1,\dots,x_a}.
]

Legal separators cannot use apex coordinates. The ordinary CPD survives, but only after contraction:

[
\delta^{(a)}_q
==============

\frac{\binom{N-a-q}{\ell-a}}
{\binom{N-a}{\ell-a}}.
]

So multi-singleton apices are harmless.

Arbitrary (\mathcal D) is different. The condition (Q\nsubseteq D_j) introduces Shortener’s own (q)-shadow. The correct statement is not one-sided CPD but 2WCPD.

---

## 4. Arbitrary-(\mathcal D) refutation: Shortener self-shadow poisoning

This is the decisive obstruction.

Let

[
N=h+\ell,\qquad \ell=\left\lfloor\frac{h}{\log h}\right\rfloor,
\qquad q=\left\lfloor\frac h2\right\rfloor.
]

Let (\mathcal D\subseteq\binom Ph) be a family of (h)-sets covering every (q)-set:

[
\forall Q\in\binom Pq,\quad
\exists D\in\mathcal D
\text{ such that } Q\subseteq D.
]

A standard probabilistic covering argument gives such a family with

[
|\mathcal D|
\le
\left\lceil
\frac{\binom Nq}{\binom hq}
\left(\log\binom Nq+1\right)
\right\rceil.
\tag{1}
]

Indeed, a random (h)-set contains a fixed (q)-set with probability

[
p=\frac{\binom hq}{\binom Nq}.
]

Taking (p^{-1}(\log\binom Nq+1)) random (h)-sets leaves expected uncovered (q)-sets (<1).

Now take

[
\mathcal C=\varnothing.
]

So Prolonger has contributed no packet shadow at all.

Every (Q) with (|Q|\le q) is contained in some (D\in\mathcal D), hence (Q) is illegal as a future Shortener claim. Therefore:

[
\boxed{
\text{There is no legal separator of rank }\le q.
}
]

But the live complement space is almost unchanged. A rank-(h) Shortener blocker (D) forbids only the single complement

[
C=P\setminus D.
]

Thus

[
|\Omega(\mathcal D)|
\ge
\binom N\ell-|\mathcal D|.
]

For (q=h/2+O(1)),

[
\log \frac{\binom Nq}{\binom hq}
================================

(\log 2+o(1))\ell,
]

whereas

[
\log\binom N\ell
================

# (1+o(1))\ell\log\frac{eN}{\ell}

(1+o(1))\ell\log(e\log h).
]

Hence

[
\frac{|\mathcal D|}{\binom N\ell}
=================================

\exp!\left(
-\ell(\log(e\log h)-\log 2-o(1))
\right)
=======

o(1).
]

So we have a game-legal packet state with almost full live entropy, zero Prolonger packet shadow, and no legal separator of rank (\le h/2).

This is not a Prolonger lower bound, because a good Shortener strategy would not deliberately poison its own future separator space this way. But it is a rigorous obstruction to any CPD theorem quantified over arbitrary dynamic (\mathcal D). The theorem must control Shortener’s own shadow.

Numerical check, natural logarithms:

[
\begin{array}{c|c|c|c|c}
h & \ell & \log\binom{h+\ell}{\ell}
& \log |\mathcal D|_{\mathrm{cover}}
& \log\binom{h+\ell}{\ell}-\log|\mathcal D| \
\hline
1000 & 144 & 429.63 & 97.33 & 332.30\
3000 & 374 & 1171.29 & 246.16 & 925.13\
10000 & 1085 & 3547.27 & 707.77 & 2839.50\
100000 & 8685 & 30268.70 & 5683.79 & 24584.91
\end{array}
]

The live packet remains exponentially larger than the self-poisoning Shortener shadow.

This is the first terminal obstruction.

---

## 5. Nested and hierarchical covering designs

Nested constructions do not break 2WCPD; they tensorize.

Suppose

[
P=P_1\sqcup\cdots\sqcup P_m,
]

with block parameters

[
|P_a|=N_a,\qquad \ell_a,\qquad h_a=N_a-\ell_a.
]

If the live complement measure is a product measure and

[
Q=Q_1\sqcup\cdots\sqcup Q_m,
]

then capture factors:

[
\operatorname{cap}(Q)
=====================

\prod_{a=1}^m
\operatorname{cap}_a(Q_a).
]

Likewise, the covering profile factors:

[
\nu\bigl(Q\subseteq A_1\sqcup\cdots\sqcup A_m\bigr)
===================================================

\prod_{a=1}^m
\nu_a(Q_a\subseteq A_a).
]

Thus nested covering designs multiply their losses, and logarithms add. There is no hidden cancellation and no supermultiplicative rescue. A scalar (q)-profile is inadequate; the correct object is a vector profile

[
(q_1,\dots,q_m)\mapsto
\prod_a \delta_{q_a}^{(a)}.
]

So nested designs do not refute 2WCPD, but they do refute any scalar CPD that tries to summarize a product obstruction by one global (q).

---

## 6. Weighted Sathe-Selberg stress test

Uniform CPD constants are not stable under Sathe-Selberg-type weights.

In a weighted packet, write the complement weight as

[
w(C)=\prod_{p\in C} a_p,
]

so the normalizing partition function is the elementary symmetric polynomial

[
Z=e_\ell(a_p:p\in P).
]

Then the exact capture of (Q) is

[
\operatorname{cap}_w(Q)
=======================

\frac{e_\ell(a_p:p\in P\setminus Q)}
{e_\ell(a_p:p\in P)}.
\tag{2}
]

The uniform constant

[
\delta_q=\frac{\binom{N-q}{\ell}}{\binom N\ell}
]

is recovered only when all (a_p) are equal.

Take (q=h/2), let (H\subseteq P) have (|H|=q), set

[
a_p=2\quad(p\in H),
\qquad
a_p=1\quad(p\notin H),
]

and take (Q=H). Then

[
\operatorname{cap}_w(H)
=======================

\frac{\binom{N-q}{\ell}}
{\sum_{i=0}^{\ell}
\binom qi2^i\binom{N-q}{\ell-i}}.
]

The degradation from the uniform (\delta_q) is

[
\frac{\delta_q}{\operatorname{cap}_w(H)}
========================================

\mathbb E(2^I),
]

where (I) is hypergeometric: the number of elements of (H) in a uniform (\ell)-subset of (P). For (q\sim h/2),

[
\mathbb E(2^I)
==============

\exp\bigl((\log(3/2)+o(1))\ell\bigr).
]

Numerically:

[
\begin{array}{c|c|c|c|c}
h & \ell & \log \delta_q & \log \operatorname{cap}_w(H)
& \log(\delta_q/\operatorname{cap}_w(H))/\ell\
\hline
1000 & 144 & -90.67 & -141.80 & 0.355\
3000 & 374 & -238.41 & -373.51 & 0.361\
10000 & 1085 & -698.83 & -1096.49 & 0.367
\end{array}
]

Thus the weighted constant degrades by

[
\exp(\Omega(\ell)).
]

The correct weighted replacement is therefore not uniform CPD, but the elementary-symmetric profile given by (2), together with the two-sided shadow cover (2WCPD).

This matters at the target scale: (\ell=h/\log h), so (\exp(\Omega(\ell))) diverges with (n). It is not a harmless constant.

---

## 7. Dynamic CPD: the real obstruction

The dynamic problem is now clear.

At time (t), a correct separator theorem must use the two-sided obstruction

[
\bigcup_i \Gamma_q(B_i)
\ \cup
\bigcup_j \Lambda_q(D_j).
]

The Prolonger part (\bigcup_i\Gamma_q(B_i)) can be charged to Prolonger’s accumulated shadow. The Shortener part

[
\bigcup_j \Lambda_q(D_j)
]

cannot be charged to Prolonger. It is Shortener’s own self-shadow. If Shortener’s self-shadow saturates the candidate separator space before the live packet mass has actually been removed, separator extraction dies.

The self-poisoning construction above shows that this can happen maximally:

[
\mathcal C=\varnothing,
\qquad
\nu_q!\left(\bigcup_{D\in\mathcal D}{Q:Q\subseteq D}\right)=1,
\qquad
|\Omega(\mathcal D)|=(1-o(1))\binom N\ell.
]

So any full proof must establish a new invariant of the following kind.

[
\boxed{
\textbf{Weighted Shortener Self-Shadow Sparsity (WSSS).}
}
]

For every relevant (q,\eta), until the corresponding live packet mass has been removed, the Shortener strategy must maintain

[
\nu_{q,\eta}
\left(
\bigcup_{D\in\mathcal D_t}
{Q:Q\subseteq D\text{ or }D\subseteq Q}
\right)
\le 1-\rho
\tag{WSSS}
]

for some quantitative (\rho>0) strong enough that 2WCPD leaves either a legal separator or a Prolonger-chargeable covering profile.

Without WSSS, 2WCPD gives no upper bound at the (r_1) scale. The one-sided CPD is simply false; the two-sided CPD is true but non-closing.

This is a rigorous structural negative theorem about the covering-profile paradigm:

[
\boxed{
\text{CPD cannot close }L(n)\le O(r_1(n))
\text{ unless it is supplemented by WSSS.}
}
]

The obstruction is not a matter of constants. A prior Shortener covering design of size

[
\exp((\log 2+o(1))\ell)
]

can destroy every separator of rank (\le h/2), while the live packet has entropy

[
(1+o(1))\ell\log(e\log h).
]

The gap

[
\ell(\log(e\log h)-\log 2-o(1))
]

diverges. No entropy compression, Bernoulli rounding, or one-sided covering profile can absorb it.

---

## 8. Final diagnosis

The CPD idea survives only after being replaced by the exact two-sided weighted theorem:

[
\mathcal Q_{q,\eta}
\subseteq
\text{Prolonger top shadows}
\ \cup
\text{Shortener comparability shadows}.
]

But this theorem exposes a new mandatory invariant. A Shortener strategy must avoid saturating its own separator space. The original blocker-duality program controlled Prolonger’s obstruction; it did not control Shortener’s self-obstruction.

So the terminal obstruction is:

[
\boxed{
\textbf{Shortener self-shadow saturation.}
}
]

The missing foundational ingredient is the WSSS inequality above. Until one proves a concrete Shortener strategy satisfying WSSS across central ranks under Sathe-Selberg weights, the covering-profile paradigm cannot yield (L(n)\le O(r_1(n))). Conversely, proving WSSS would be the exact next theorem needed: 2WCPD would then reduce every failed separator extraction to a Prolonger-chargeable profile, and the blocker-duality program would again have a plausible route to closure.

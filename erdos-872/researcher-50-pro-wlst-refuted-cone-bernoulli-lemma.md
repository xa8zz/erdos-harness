---
id: R50-pro-wlst-refuted-cone-bernoulli
type: refutation
date: 2026-04-19
intent: >
  Refute WLST (Weak Local Separator Theorem) in one-outcome form via
  cone-Bernoulli lemma construction.
predecessors: [R49-pro-3-blocker-duality-paradigm]
action:
  kind: standalone
claim: >
  WLST in one-outcome form is false: a single prior Shortener blocker can
  turn the relative blocker into full-rank atoms, making every remaining
  legal separator capture only one residual packet atom. Construction and
  numerical verification provided.
failure_mechanism: >
  Cone-Bernoulli construction: a prior Shortener blocker b_0 in the lower
  shadow of the packet apex creates a forbidden core for all relative
  blockers. The remaining legal relative blockers are all forced to be
  rank-h atoms (since b_0 makes all smaller rank separators illegal). Each
  rank-h atom captures exactly one packet atom, so no separator captures
  a constant fraction of the packet.
---

WLST in the one-outcome form stated is **false**. The obstruction is not a game-legality mistake and not a scalar (F_{\text{useful}}) issue. A single prior Shortener blocker can turn the relative blocker into full-rank atoms, so every remaining legal separator captures only one residual packet atom.

I will give the construction, prove it, verify the scale numerically, and then state the sharper replacement that seems necessary.

Assume throughout that (\pi) is the packet measure on candidate (L)-complements (Y\subseteq P), (|Y|=L). If (\pi) were instead supported only on the already-played Prolonger complement family (\mathcal C), then (\pi{C:C\cap Q=\varnothing}=0) for every transversal (Q), so the theorem would be vacuous.

---

## Refutation: the relative cone obstruction

Let

[
K=h+L,\qquad 2\le L\le h/4,
]

and let the packet be

[
P={a,b}\sqcup R,
\qquad |R|=K-2=h+L-2.
]

Define the Prolonger complement family

[
\mathcal C
==========

\left{
C_T={a}\cup T:
T\in\binom{R}{L-1}
\right}.
]

Thus

[
|\mathcal C|
============

# s

\binom{h+L-2}{L-1}.
]

Let the prior Shortener blocker family be

[
\mathcal D={{a}}.
]

So (r=1).

The corresponding Prolonger moves are

[
B_T=P\setminus C_T
==================

{b}\cup(R\setminus T),
]

and each (B_T) has size

[
1+\bigl(|R|-(L-1)\bigr)
=======================

# 1+(h+L-2-L+1)

h.
]

So these are legitimate rank-(h) packet moves.

This state is game-legal. The prior Shortener move ({a}) does not divide any Prolonger move (B_T), because (a\notin B_T) for every (T). The Prolonger moves are all (h)-sets, hence mutually incomparable. The state can be realized by having Shortener first claim (a), Prolonger then play these (B_T)’s over time, with Shortener’s intervening moves outside the packet.

Now characterize the legal relative blockers.

A legal relative blocker (Q) must satisfy two conditions:

[
Q\cap C_T\neq\varnothing
\quad\forall T\in\binom{R}{L-1},
]

and

[
{a}\not\subseteq Q.
]

The second condition says

[
a\notin Q.
]

Therefore (Q) is a legal relative blocker exactly when

[
Q\cap T\neq\varnothing
\quad\forall T\in\binom{R}{L-1}.
]

That is equivalent to

[
|R\setminus Q|\le L-2.
]

Indeed, if (|R\setminus Q|\ge L-1), then some (T\in\binom{R}{L-1}) lies inside (R\setminus Q), so (Q\cap T=\varnothing). Conversely, if (|R\setminus Q|\le L-2), every ((L-1))-subset (T\subseteq R) meets (Q).

Thus every legal relative blocker satisfies

[
|Q\cap R|
\ge
|R|-(L-2)
=========

# (h+L-2)-(L-2)

h.
]

Since (a\notin Q), every legal (Q) has size at least (h). The minimal legal relative blockers are exactly

[
Q_S=R\setminus S,
\qquad S\in\binom{R}{L-2},
]

and each has size (h).

Equivalently, the blocker clutter is explicit:

[
b(\mathcal C)
=============

{{a}}
\cup
\left{
R\setminus S:S\in\binom{R}{L-2}
\right}.
]

After the prior Shortener claim ({a}), the remaining legal blocker consists only of full rank-(h) atoms.

---

## Separator mass is atomic

Let (Q) be any legal relative blocker.

If (|Q|>h), then no rank-(h) packet element contains (Q), so

[
\pi{Y\in\binom PL:Y\cap Q=\varnothing}=0.
]

If (|Q|=h), then (Q=R\setminus S) for some (S\in\binom{R}{L-2}). In that case

[
P\setminus Q
============

{a,b}\cup S
]

has size (L). Therefore there is exactly one (L)-complement disjoint from (Q), namely

[
Y_Q={a,b}\cup S.
]

Under the uniform packet measure on (\binom PL),

[
\pi_{\mathrm{full}}{Y:Y\cap Q=\varnothing}
\le
\binom{K}{L}^{-1}.
]

Even if (\pi) is normalized only on the still-live residual packet, the obstruction remains.

The prior Shortener singleton ({a}) kills all rank-(h) facets containing (a), equivalently all complements (Y) not containing (a). The Prolonger family (\mathcal C) has already occupied all complements of the form

[
{a}\cup T,\qquad T\in\binom{R}{L-1}.
]

Thus the live residual complements are exactly

[
\mathcal R_{\mathrm{live}}
==========================

\left{
{a,b}\cup S:
S\in\binom{R}{L-2}
\right}.
]

So

[
|\mathcal R_{\mathrm{live}}|
============================

# \binom{K-2}{L-2}

\binom{h+L-2}{L-2}.
]

Each legal relative blocker (Q) captures at most one such live atom. Therefore

[
\pi_{\mathrm{live}}{Y\in\mathcal R_{\mathrm{live}}:Y\cap Q=\varnothing}
\le
\binom{h+L-2}{L-2}^{-1}.
]

For the central packet scale

[
L=\left\lfloor \frac{h}{\log h}\right\rfloor,
]

we have

[
\binom{h+L-2}{L-2}
==================

\exp!\left(
\Theta!\left(
\frac{h}{\log h}\log\log h
\right)
\right).
]

Hence every legal relative blocker satisfies

[
\pi_{\mathrm{live}}{Y:Y\cap Q=\varnothing}
\le
\exp!\left(
-\Theta!\left(
\frac{h\log\log h}{\log h}
\right)
\right).
]

This is (e^{-h^{1-o(1)}}). In particular, it is (\le e^{-h^{0.9}}) for all sufficiently large (h).

So the desired WLST cannot hold with any separator lower bound strong enough to guarantee uniform entropy decrement. In this state, the best legal separator is literally an atom.

---

## Weighted Sathe–Selberg robustness

The example is not an artifact of uniform weights.

Suppose the packet weights have product form

[
w(Y)=\prod_{p\in Y}\omega_p
]

with bounded ratio

[
\frac{\max_{p\in P}\omega_p}{\min_{p\in P}\omega_p}\le \rho,
]

where (\rho=O(1)) inside a dyadic packet. This is the relevant squarefree Sathe–Selberg local model, up to bounded Euler-factor distortion.

Then any single live atom has conditional live mass at most

[
\frac{\rho^L}{\binom{h+L-2}{L-2}}.
]

For fixed (\rho),

[
\frac{\rho^L}{\binom{h+L-2}{L-2}}
=================================

\exp!\left(
-\Theta!\left(
\frac{h\log\log h}{\log h}
\right)
\right).
]

Thus the refutation survives bounded Sathe–Selberg weights.

---

## Sandbox verification

Exact binomial calculations confirm the scale. Here (L=\lfloor h/\log h\rfloor), (s=\binom{h+L-2}{L-1}), and (N_{\mathrm{live}}=\binom{h+L-2}{L-2}).

| (h) | (L) | (\log s) | (\log N_{\mathrm{live}}) |      max live capture |       max full capture |
| --: | --: | -------: | -----------------------: | --------------------: | ---------------------: |
|  50 |  12 |   26.560 |                   25.046 | (1.326\times10^{-11}) |  (4.629\times10^{-13}) |
| 100 |  21 |   51.555 |                   49.946 | (2.037\times10^{-22}) |  (5.891\times10^{-24}) |
| 200 |  37 |   97.998 |                   96.284 | (1.530\times10^{-42}) |  (3.643\times10^{-44}) |
| 500 |  80 |  227.526 |                  225.680 | (9.732\times10^{-99}) | (1.832\times10^{-100}) |

I also brute-forced small cases such as ((h,L)=(5,2),(6,3),(8,3)). The enumeration agrees exactly: every legal relative blocker has size at least (h), and every size-(h) legal blocker captures exactly one packet complement.

---

## What this refutes

This does **not** refute blocker duality. It refutes the single-outcome WLST:

[
\text{“there is always a legal relative blocker with substantial separator mass.”}
]

The full blocker still closes the packet. But after the prior singleton ({a}) is claimed, the remaining relative blocker is

[
\left{
R\setminus S:S\in\binom{R}{L-2}
\right},
]

which has exactly one generator per live residual atom. Claiming the blocker closes the packet only by enumerating the residual.

So the obstruction is:

[
\text{relative blocker duality can lose compression after a forbidden prior blocker.}
]

The prior Shortener family (\mathcal D) is not a technical annoyance. It can change the blocker from a small composite-transversal object into a full-rank atomic object.

---

## The missing ingredient

The correct replacement cannot be a pure separator theorem. It must be an **amortized separator-or-saturation theorem**.

The theorem needed should have the form:

[
\boxed{
\text{Either a large legal separator exists, or the live residual packet is already controlled by the shadow of played Prolonger blockers.}
}
]

In the construction above, there is no large separator, but the residual is already paid for by Prolonger’s saturation.

Indeed,

[
|\mathcal C|
============

\binom{h+L-2}{L-1},
]

while

[
|\mathcal R_{\mathrm{live}}|
============================

\binom{h+L-2}{L-2}.
]

Therefore

[
\frac{|\mathcal C|}{|\mathcal R_{\mathrm{live}}|}
=================================================

\frac{h}{L-1}
\asymp
\log h.
]

Equivalently,

[
|\mathcal R_{\mathrm{live}}|
============================

\frac{L-1}{h},|\mathcal C|.
]

So the packet is hard for separator capture only because Prolonger has already spent a much larger number of moves saturating one codimension layer. The proof must charge this to Prolonger’s actual moves, not to Shortener’s entropy decrement.

The named missing tool is therefore a **weighted relative Kruskal–Katona / local LYM alternative for blocker duals**:

[
\text{large separator}
\quad\vee\quad
\text{relative shadow saturation chargeable to }\mathcal C.
]

In more concrete terms, one needs a theorem controlling the live complement family after deleting prior Shortener blockers (\mathcal D) by a weighted shadow of the already-played Prolonger complement family (\mathcal C), unless the relative blocker has a low-rank generator with large fiber.

That theorem would be structurally different from the exhausted paradigm: it would not price local useful shields, and it would not require the (N_h/\log h) residual. It would say that when legal transversals have become atomic, the packet is already saturated and can be charged to Prolonger.

---

## A positive sub-theorem that handles (\mathcal D)

For completeness, here is the clean separator lemma that does handle forbidden prior Shortener blockers explicitly. The refutation above shows why its hypothesis is necessary.

**Bernoulli legal-separator lemma.**
Let (P) be a packet with (|P|=K=h+L). Let (\mathcal C={C_i}*{i=1}^s) be Prolonger complements and (\mathcal D={D_j}*{j=1}^r) prior Shortener blockers. Choose numbers (x_p\in[0,1]) and set

[
X=\sum_{p\in P}x_p.
]

Assume

[
\sum_{i=1}^s\prod_{p\in C_i}(1-x_p)
+
\sum_{j=1}^r\prod_{p\in D_j}x_p
\le
\frac14
]

and

[
2X\le \frac h2.
]

Then there exists a legal relative blocker (Q) such that

[
|Q|\le 2X
]

and, under the uniform (L)-complement packet measure,

[
\pi{Y\in\binom PL:Y\cap Q=\varnothing}
\ge
\exp!\left(-\frac{4XL}{h}\right).
]

Moreover (Q) may be chosen minimal.

**Proof.**
Choose a random set (Q_0\subseteq P) by including each (p\in P) independently with probability (x_p).

For a Prolonger complement (C_i),

[
\Pr(Q_0\cap C_i=\varnothing)
============================

\prod_{p\in C_i}(1-x_p).
]

For a prior Shortener blocker (D_j),

[
\Pr(D_j\subseteq Q_0)
=====================

\prod_{p\in D_j}x_p.
]

By the assumed union bound, with probability at least (3/4), (Q_0) hits every (C_i) and contains no (D_j).

Also

[
\mathbb E|Q_0|=X,
]

so by Markov,

[
\Pr(|Q_0|>2X)\le \frac12.
]

Therefore with positive probability (Q_0) is a legal relative transversal and (|Q_0|\le 2X). Passing to a minimal subtransversal (Q\subseteq Q_0) preserves (D_j\nsubseteq Q), because if (D_j\subseteq Q), then (D_j\subseteq Q_0). Thus (Q) is a minimal legal relative blocker and (|Q|\le 2X).

Finally, for (q=|Q|\le h/2),

[
\frac{\binom{K-q}{L}}{\binom KL}
================================

\prod_{\ell=0}^{L-1}
\left(1-\frac{q}{K-\ell}\right).
]

Since (K-\ell\ge h) and (q\le h/2),

[
\log\left(
\frac{\binom{K-q}{L}}{\binom KL}
\right)
\ge
-2q\sum_{\ell=0}^{L-1}\frac1{K-\ell}
\ge
-\frac{2qL}{h}
\ge
-\frac{4XL}{h}.
]

This proves the lemma.

The cone obstruction above is exactly a case where no choice of small (X) can satisfy the lemma’s hypothesis. A prior singleton blocker removes the apex (a), and the remaining complete ((L-1))-uniform family on (R) forces every legal transversal to have size (h).

---

## Bottom line

The WLST as stated is false.

The blocker-duality paradigm is still viable only after replacing WLST by a **two-outcome weighted relative isoperimetric theorem**:

[
\text{large legal separator}
\quad\text{or}\quad
\text{packet already saturated by Prolonger’s played complement shadow.}
]

The relative cone construction proves that the forbidden prior Shortener blockers (\mathcal D) cannot be handled by a minor extension of the packet transversal-capture lemma. A single prior singleton can force the remaining legal blocker to consist of full rank-(h) atoms, making every entropy decrement exponentially small.

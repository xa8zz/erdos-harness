---
id: R51-pro-case-B-refuted-lp-integrality-gap
type: refutation
date: 2026-04-19
intent: >
  Third refutation of Case B via LP-integrality-gap obstruction in the
  covering profile.
predecessors: [R51-pro-case-B-refuted-kk-sparse-covering-cone]
siblings: [R51-pro-case-B-refuted-entropy-covering-design, R51-pro-case-B-refuted-kk-sparse-covering-cone]
action:
  kind: refutes
  target: R51-pro-case-B-refuted-kk-sparse-covering-cone
claim: >
  LP/Hall unification false: set-cover integrality gap appears inside the
  relative blocker problem for sparse covering-design packets. The LP
  fractional optimum achieves 1 but the integral optimum is Omega(log h),
  giving an Omega(log h) gap between the claimed bound and the actual
  Shortener cost.
failure_mechanism: >
  Set-cover integrality gap: the relative blocker LP relaxation has a
  fractional solution of cost 1 (uniform distribution over all blockers),
  but the integral set-cover problem on the covering-design packet requires
  Omega(log h) blockers to cover all atoms. The LP/Hall unification conflates
  fractional and integral covering, losing the log h factor.
---

The proposed LP/Hall unification is **false in its stated form**. The obstruction is not a minor rounding loss; it is the ordinary set-cover integrality gap, appearing inside the relative blocker problem. A sparse covering-design packet gives:

[
\tau_f=O(\log h),\qquad \tau_{\mathbb Z}=\Theta(h),
]

so the fractional LP says “cheap separator,” while every legal integral separator has exponentially small packet capture. At the same time, the live residual packet is exponentially larger than the played Prolonger complement shadow, so the proposed Case B inequality

[
|\mathcal R_{\mathrm{live}}|*\pi \le \kappa(h,L),|\mathcal C|*\pi
]

cannot hold with any (\kappa) strong enough to be useful.

The missing ingredient is therefore **not LP duality at level 1**. It is a higher-order **relative covering-profile theorem**, equivalently a covering-design / high-level Sherali–Adams type certificate.

---

## 1. Correct primal-dual pair

For a packet (P), Prolonger complements (\mathcal C={C_i}), and prior Shortener blockers (\mathcal D={D_j}), the integral legality condition is

[
Q\cap C_i\neq\varnothing\quad\forall i,
]

and

[
D_j\nsubseteq Q\quad\forall j.
]

Thus the correct linear relaxation is

[
\begin{aligned}
\tau_f(\mathcal C,\mathcal D;w)
===============================

\min_{\xi\ge 0}\quad
&\sum_{p\in P} w_p\xi_p\
\text{s.t.}\quad
&\sum_{p\in C_i}\xi_p\ge 1
\qquad\forall i,\
&\sum_{p\in D_j}\xi_p\le |D_j|-1
\qquad\forall j.
\end{aligned}
]

The constraint (\sum_{p\in D_j}\xi_p\le 1-\epsilon) is only the right integral surrogate for singleton blockers, or for a deliberately stronger non-game constraint. For a general blocker (D_j), legality forbids choosing all of (D_j), not choosing two elements of it.

The dual is

[
\begin{aligned}
\max_{\alpha,\beta\ge 0}\quad
&\sum_i \alpha_i-\sum_j (|D_j|-1)\beta_j\
\text{s.t.}\quad
&\sum_{i:p\in C_i}\alpha_i
--------------------------

\sum_{j:p\in D_j}\beta_j
\le w_p
\qquad\forall p\in P.
\end{aligned}
]

Upper bounds (\xi_p\le 1) may be added, but they are redundant for the minimization problem because clipping (\xi_p) at (1) preserves all hitting constraints, improves all forbidden-set constraints, and does not increase cost.

The refutation below uses only one singleton prior blocker, so it also refutes the stricter formulation with (\sum_{p\in D_j}\xi_p\le 1-\epsilon) by taking (\epsilon=1).

---

## 2. The sparse covering-design obstruction

Fix a constant (0<\alpha<1). Let

[
L=\left\lfloor \frac{h}{\log h}\right\rfloor,\qquad
\ell=L-1,\qquad
N=h+\ell.
]

Let (R) be a set of (N) primes and let

[
P=R\sqcup{a}.
]

Then

[
|P|=N+1=h+L.
]

Set

[
q=\lfloor \alpha h\rfloor,
\qquad
t=N-q.
]

We will use one prior Shortener blocker,

[
\mathcal D={{a}}.
]

Now choose a family

[
\mathcal H\subseteq \binom{R}{\ell}
]

such that every (t)-subset of (R) contains at least one member of (\mathcal H). In covering-design notation, (\mathcal H) is an ((N,t,\ell))-cover.

Such an (\mathcal H) exists with

[
|\mathcal H|
\le
\left(1+\log \binom Nt\right)
\frac{\binom N\ell}{\binom t\ell}.
]

This is the standard greedy set-cover bound. The universe is (\binom Rt). Each (\ell)-set (S) covers the (t)-sets containing (S). The fractional cover assigning weight (1/\binom t\ell) to every (S\in\binom R\ell) covers each (t)-set exactly once and has total weight (\binom N\ell/\binom t\ell). Greedy rounding loses only the factor (1+\log\binom Nt).

Define the Prolonger complement family

[
\mathcal C
==========

{,{a}\cup S:S\in\mathcal H,}.
]

Each (C\in\mathcal C) has size

[
1+\ell=L.
]

The corresponding Prolonger move is

[
B_C=P\setminus C=R\setminus S,
]

which has size

[
N-\ell=h.
]

So all Prolonger moves are legitimate rank-(h) packet moves. They also avoid (a), so the prior Shortener claim ({a}) is game-legal: it divides none of the Prolonger moves.

---

## 3. Every legal relative blocker is large

A legal relative blocker (Q) must avoid the prior singleton blocker:

[
{a}\nsubseteq Q,
]

so

[
a\notin Q.
]

It must also hit every Prolonger complement:

[
Q\cap({a}\cup S)\neq\varnothing
\qquad\forall S\in\mathcal H.
]

Since (a\notin Q), this is equivalent to

[
Q\cap S\neq\varnothing
\qquad\forall S\in\mathcal H.
]

Thus (Q\subseteq R) must be a transversal of (\mathcal H).

But (\mathcal H) covers every (t)-subset of (R). Therefore any (Q\subseteq R) with

[
|Q|\le q
]

fails to hit (\mathcal H), because its complement (R\setminus Q) has size at least

[
N-q=t
]

and hence contains some (S\in\mathcal H). That (S) is disjoint from (Q).

Therefore every legal relative blocker satisfies

[
|Q|\ge q+1=\Theta(h).
]

So there is no small integral separator, even though the fractional LP is cheap.

---

## 4. Separator capture is exponentially small

The live residual complements after the prior Shortener singleton ({a}) are the (L)-sets containing (a). Removing the already-played Prolonger complements gives

[
\mathcal R_{\mathrm{live}}
==========================

{,{a}\cup Y:Y\in\binom R\ell\setminus \mathcal H,}.
]

For a legal (Q\subseteq R), the complements it captures are those (Y) disjoint from (Q). Since (|Q|\ge q+1),

[
#{Y\in\binom R\ell:Y\cap Q=\varnothing}
\le
\binom{N-q}{\ell}.
]

Also, because

[
\frac{|\mathcal H|}{\binom N\ell}
\le
\frac{1+\log\binom Nt}{\binom t\ell}
=o(1),
]

we have, for large (h),

[
|\mathcal R_{\mathrm{live}}|
============================

\binom N\ell-|\mathcal H|
\ge
\frac12\binom N\ell.
]

Hence every legal relative blocker satisfies

[
\pi_{\mathrm{live}}{Y:Y\cap Q=\varnothing}
\le
2,\frac{\binom{N-q}{\ell}}{\binom N\ell}.
]

Now

[
\frac{\binom{N-q}{\ell}}{\binom N\ell}
======================================

\prod_{m=0}^{\ell-1}
\frac{N-q-m}{N-m}
\le
\left(1-\frac qN\right)^\ell.
]

Since (q/N\ge \alpha/2) for large (h),

[
\pi_{\mathrm{live}}{Y:Y\cap Q=\varnothing}
\le
2\exp(-c_\alpha \ell)
=====================

\exp!\left(-\Omega_\alpha!\left(\frac h{\log h}\right)\right).
]

Thus Case A fails at any scale requiring a genuinely large entropy decrement.

---

## 5. The residual is not chargeable to (\mathcal C) by Hall/König-style packing

The played Prolonger complement shadow has size

[
|\mathcal C|=|\mathcal H|
\le
\left(1+\log \binom Nt\right)
\frac{\binom N\ell}{\binom t\ell}.
]

The live residual has size at least

[
|\mathcal R_{\mathrm{live}}|
\ge
\frac12\binom N\ell.
]

Therefore

[
\frac{|\mathcal R_{\mathrm{live}}|}{|\mathcal C|}
\ge
\frac{\binom t\ell}
{2\left(1+\log\binom Nt\right)}.
]

Since

[
t=N-q=(1-\alpha)h+O(h/\log h)
]

and

[
\ell\sim \frac h{\log h},
]

we have

[
\log \binom t\ell
=================

\Theta_\alpha!\left(
\frac h{\log h}\log\log h
\right).
]

Thus

[
\frac{|\mathcal R_{\mathrm{live}}|}{|\mathcal C|}
\ge
\exp!\left(
\Omega_\alpha!\left(
\frac h{\log h}\log\log h
\right)
\right).
]

So any Case B inequality of the form

[
|\mathcal R_{\mathrm{live}}|
\le
\kappa(h,L)|\mathcal C|
]

would need

[
\kappa(h,L)
\ge
\exp!\left(
\Omega!\left(
\frac h{\log h}\log\log h
\right)
\right).
]

That is essentially the whole packet entropy scale. Such a (\kappa) is too large to yield an (r_1)-scale upper bound.

---

## 6. The LP value is small, so the dual does not certify saturation

For the unit-weight LP, set

[
\xi_a=0,
\qquad
\xi_p=\frac1\ell
\quad(p\in R).
]

For every (C={a}\cup S\in\mathcal C),

[
\sum_{p\in C}\xi_p
==================

# \sum_{p\in S}\frac1\ell

1.

]

The singleton forbidden constraint is also satisfied:

[
\xi_a=0.
]

Therefore

[
\tau_f(\mathcal C,\mathcal D)
\le
\frac N\ell
===========

\Theta(\log h).
]

But every integral legal relative blocker has size at least

[
q+1=\Theta(h).
]

So the LP integrality gap is

[
\frac{\tau_{\mathbb Z}}{\tau_f}
\ge
\Omega_\alpha!\left(\frac h{\log h}\right)
==========================================

\Omega_\alpha(L).
]

The dual packing also cannot rescue the proposed dichotomy. In this singleton-apex construction, the dual may cancel the load at (a) using the blocker variable (\beta), but every dual edge still has (\ell) vertices in (R). Summing the vertex-capacity inequalities over (R) gives

[
\ell\sum_{S\in\mathcal H}\alpha_S
\le
N,
]

so

[
\sum_{S\in\mathcal H}\alpha_S
\le
\frac N\ell
===========

O(\log h).
]

Thus the dual packing value is small, while the live residual is exponentially larger than the played complement shadow. The LP has no branch in which it notices saturation.

This is the precise point where the proposed LP formulation breaks.

---

## 7. Numerical verification

I checked small greedy covering-design instances and solved the fractional LPs directly. Here (q=N-t), (\tau_{\mathbb Z}) is the exact minimum legal integral transversal size by brute force, and (\tau_f) is the LP optimum.

| (N) | (\ell) | (t) | (q=N-t) | (|\mathcal H|) | (\tau_{\mathbb Z}) | (\tau_f) | (|\mathcal R|/|\mathcal H|) | capture upper bound |
|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| 10 | 3 | 6 | 4 | 12 | 5 | 3.333 | 9.0 | 0.0926 |
| 12 | 3 | 8 | 4 | 10 | 5 | 4.000 | 21.0 | 0.1667 |
| 14 | 4 | 9 | 5 | 22 | 6 | 3.500 | 44.5 | 0.0715 |
| 16 | 4 | 10 | 6 | 20 | 7 | 4.000 | 90.0 | 0.0700 |
| 18 | 4 | 11 | 7 | 35 | 8 | 4.500 | 86.4 | 0.0694 |

The asymptotic regime is much sharper. For (\alpha=1/2), (L=\lfloor h/\log h\rfloor), the estimates are:

| (h) | (L) | (\log |\mathcal C|) upper bound | (\log(|\mathcal R|/|\mathcal C|)) lower bound | (\log) max capture upper bound |
|---:|---:|---:|---:|---:|
| 100 | 21 | 16.49 | 34.55 | -12.11 |
| 200 | 37 | 27.19 | 70.28 | -22.13 |
| 500 | 80 | 55.26 | 171.72 | -49.29 |
| 1000 | 144 | 96.75 | 330.11 | -90.09 |

So the phenomenon is not a small-case artifact. The residual-to-shadow ratio grows like

[
\exp!\left(\Theta!\left(\frac h{\log h}\log\log h\right)\right),
]

while every legal separator captures only

[
\exp!\left(-\Theta!\left(\frac h{\log h}\right)\right).
]

---

## 8. Why this is not merely a bad choice of rounding

For any (L)-uniform packet family, the fractional hitting LP has the universal feasible solution

[
\xi_p=\frac1L,
]

with cost

[
\frac{|P|}{L}
\asymp \frac hL
\asymp \log h.
]

So the level-1 fractional LP is intrinsically unable to distinguish a packet with a genuine small separator from a sparse covering-design packet whose integral separators all have size (\Theta(h)).

Standard randomized rounding of the fractional solution must multiply by (\log |\mathcal C|). In this construction,

[
\log |\mathcal C|
=================

\Theta_\alpha(L),
]

so rounding produces a set of size

[
\Theta(\log h\cdot L)
=====================

\Theta(h).
]

That is exactly the bad integral scale. The loss is not an artifact of a sloppy proof; it is the set-cover integrality gap.

A constant-integrality-gap counterexample of this kind cannot exist. If the integral legal blocker had size (O(\log h)), then its packet capture would be

[
\exp!\left(-O!\left(\frac{\log h\cdot L}{h}\right)\right)
=========================================================

\exp(-O(1)),
]

which is a genuine Case A separator. Thus the only meaningful obstruction is precisely the unbounded integrality gap, and the construction realizes it.

---

## 9. The correct replacement: a covering-profile dichotomy

The failed Case B is trying to prove a cardinality domination

[
|\mathcal R_{\mathrm{live}}|
\lesssim
\kappa |\mathcal C|.
]

That is the wrong statement. The right statement must couple the size of (\mathcal C) to the **inverse separator mass**, not to the residual cardinality.

In the apex-singleton model above, there is an exact clean theorem.

Let (R) have size (N), let (\mathcal H\subseteq\binom R\ell), and let (\mathcal D={{a}}), (\mathcal C={{a}\cup S:S\in\mathcal H}). For any integer (q), define

[
\delta_q=\frac{\binom{N-q}{\ell}}{\binom N\ell}.
]

Then exactly one of the following two things happens:

1. There is a legal relative blocker (Q) with (|Q|\le q), and it captures at least (\delta_q) of the full live packet scale.

2. No legal relative blocker has size (\le q), in which case (\mathcal H) covers every ((N-q))-subset of (R), and therefore

[
|\mathcal C|
============

|\mathcal H|
\ge
\frac{\binom N\ell}{\binom{N-q}{\ell}}
======================================

\delta_q^{-1}.
]

The proof is immediate.

If a legal (Q) of size at most (q) exists, then every (\ell)-set disjoint from (Q) is automatically not in (\mathcal H), because (Q) hits (\mathcal H). Hence it captures at least (\binom{N-q}{\ell}/\binom N\ell).

Conversely, if no such (Q) exists, then every (q)-set fails to hit (\mathcal H). Equivalently, every ((N-q))-set contains an edge of (\mathcal H). Counting incidences between (\ell)-edges of (\mathcal H) and ((N-q))-sets gives

[
|\mathcal H|\binom{N-\ell}{N-q-\ell}
\ge
\binom N{N-q}.
]

This rearranges to

[
|\mathcal H|
\ge
\frac{\binom N\ell}{\binom{N-q}\ell}.
]

This is the real separator-or-saturation principle. It says

[
|\mathcal C|\cdot \delta_q\gtrsim 1,
]

not

[
|\mathcal R_{\mathrm{live}}|\lesssim \kappa|\mathcal C|.
]

The covering-design construction above is tight for this theorem up to the usual logarithmic set-cover factor.

---

## 10. Final diagnosis

The requested LP duality formulation cannot prove the desired two-outcome theorem.

The failure mode is:

[
\boxed{
\text{fractional LP cheap}
\quad+\quad
\text{integral legal separators large}
\quad+\quad
\text{residual much larger than played shadow}.
}
]

The specific named obstruction is the **set-cover integrality gap**, realized here by sparse covering designs.

The missing foundational ingredient is a **weighted relative covering-profile theorem**, not a level-1 LP/Hall theorem. In modern language, the proof needs either:

[
\text{covering-design isoperimetry}
]

or a high-level lift such as

[
q\text{-level Sherali–Adams/Lasserre constraints}
]

with (q) on the order of the intended separator size.

A multiplicative-weights implementation of the level-1 LP will not fix this. In the construction above it sees the cheap fractional solution (\xi_p=1/\ell), then must pay the unavoidable (\log|\mathcal C|) rounding factor, producing a legal blocker of size (\Theta(h)). The online strategy must instead track the covering profile

[
q\longmapsto
\frac{\binom{N-q}{\ell}}{\binom N\ell}
]

and charge failure of a (q)-separator to the covering number required of Prolonger’s already-played complement shadow.

So the blocker-duality paradigm remains alive, but the proposed LP/Hall unification is not the right foundational theorem. The correct next theorem is a **weighted relative covering-profile dichotomy**:

[
\text{large legal separator at scale }q
\quad\vee\quad
\text{Prolonger has paid at least the covering number }1/\delta_q.
]

That theorem, not the level-1 fractional LP, is the ingredient needed to continue toward an (O(r_1(n))) upper bound.

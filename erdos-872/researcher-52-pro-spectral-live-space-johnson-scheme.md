The definitive diagnosis is this:

**WLST → AWLST → CPD is real progress as static combinatorics, but it has converged to a set-cover invariant, not to a closing upper-bound method.** The common refutations are not accidental counterexamples to successive formulations. They are witnesses that the blocker-duality paradigm has reached its natural limit: it can identify the exact covering profile of the played complement family, but it cannot by itself supply the dynamic budget needed for an (O(r_1)) upper bound.

The invariant is the **relative disjointness-covering profile**. Once that invariant appears, the problem has left LP duality/Hall/König territory and entered covering-design / Johnson-scheme expansion territory.

I will state the limit theorem, prove the obstruction, and then give a structurally different partial result using the spectral geometry of the antichain hypergraph.

---

## 1. The limit of the blocker-duality refinement trajectory

Work in a packet (P), with possible Prolonger complements

[
\mathcal Y=\binom{P}{L},
\qquad |P|=K=h+L.
]

For a chosen Shortener rank (q), let

[
\mathcal Q_q=\binom{P}{q}
]

be the candidate (q)-composites. A (Q\in\mathcal Q_q) is made illegal by a played Prolonger complement (C\in\mathcal Y) exactly when

[
Q\cap C=\varnothing.
]

Thus each Prolonger complement (C) covers the set

[
N_q(C)={Q\in\mathcal Q_q: Q\cap C=\varnothing}.
]

Given prior Shortener blockers (\mathcal D), restrict (\mathcal Q_q) to the candidates satisfying the Shortener-side antichain legality constraints. Call that restricted candidate space

[
\mathcal Q_q(\mathcal D).
]

Given a capture threshold (\delta), define

[
\mathcal T_{q,\delta}(\mathcal D)
=================================

\left{
Q\in\mathcal Q_q(\mathcal D):
\pi({Y\in\mathcal Y_{\mathrm{live}}:Y\cap Q=\varnothing})\ge \delta
\right}.
]

Then the exact static theorem is the following.

**Exact covering-profile dichotomy.**
For every packet state ((\mathcal C,\mathcal D)), exactly one of the following holds:

1. There exists a legal (Q\in\mathcal T_{q,\delta}(\mathcal D)) surviving all played Prolonger complements, i.e.

   [
   Q\cap C\neq\varnothing
   \quad\forall C\in\mathcal C.
   ]

2. The played complement family (\mathcal C) covers the whole target separator space:

   [
   \mathcal T_{q,\delta}(\mathcal D)
   \subseteq
   \bigcup_{C\in\mathcal C} N_q(C).
   ]

Equivalently, if Case A fails, then (\mathcal C) is a set cover of the target separator space in the disjointness graph.

This is the true endpoint of WLST/AWLST/CPD. It is not an LP theorem; it is an **integral set-cover theorem**. The level-1 LP relaxation misses exactly the obstruction already found: sparse covering designs.

---

## 2. The common obstruction: sparse disjointness covers

The unifying feature of the forbidden-core star, parity-cube, relative cone, and sparse covering-design examples is this:

[
\boxed{
\text{Prolonger’s complements cover the candidate Shortener separator space by disjointness neighborhoods.}
}
]

The relevant invariant is therefore

[
\Theta_q(\mathcal C\mid\mathcal D)
==================================

\nu_q!\left(
\bigcup_{C\in\mathcal C}
N_q(C)
\right),
]

where (\nu_q) is the natural measure on legal (q)-candidate Shortener moves. When

[
\Theta_q(\mathcal C\mid\mathcal D)=1,
]

there is no legal (q)-separator. Sparse covering designs are precisely near-minimal ways of forcing

[
\Theta_q=1
]

while using far fewer played complements than the size of the live residual packet.

This is why the refutations keep recurring. WLST tried to find one surviving separator. AWLST tried to charge residual mass to (|\mathcal C|). CPD correctly realized that the right charge is not (|\mathcal C|), but the covering number of the separator space. That is the convergence point.

---

## 3. Rigorous obstruction theorem

Here is the clean construction showing that no blocker-duality statement stronger than the covering profile can be true.

Let

[
L=\left\lfloor \frac{h}{\log h}\right\rfloor,\qquad
\ell=L-1,
]

and let

[
P=R\sqcup{a},
\qquad |R|=N=h+\ell.
]

Then

[
|P|=h+L.
]

Let Shortener’s prior blocker be the singleton

[
\mathcal D={{a}}.
]

This is game-legal for the Prolonger moves below, because every Prolonger move will avoid (a).

Fix

[
q=\lfloor \alpha h\rfloor
]

for some constant (0<\alpha<1), and put

[
t=N-q.
]

Choose a family

[
\mathcal H\subseteq\binom{R}{\ell}
]

such that every (t)-subset of (R) contains at least one member of (\mathcal H). In covering-design notation, (\mathcal H) is an ((N,t,\ell))-cover.

Define the played Prolonger complements by

[
\mathcal C
==========

{{a}\cup S:S\in\mathcal H}.
]

Each (C={a}\cup S) has size (L), and the corresponding Prolonger move is

[
B=P\setminus C=R\setminus S,
]

which has size

[
|R|-\ell=h.
]

So all Prolonger moves are legitimate rank-(h) packet moves. They all avoid (a), so the prior Shortener claim ({a}) divides none of them. The construction is game-legal.

A legal (q)-separator (Q) cannot contain (a), because ({a}) was already claimed by Shortener. Thus (Q\subseteq R). To hit every played Prolonger complement, (Q) must satisfy

[
Q\cap S\neq\varnothing
\qquad
\forall S\in\mathcal H.
]

But (\mathcal H) covers every (t)-subset of (R). Therefore no (Q\subseteq R) with (|Q|\le q) can hit all of (\mathcal H), because (R\setminus Q) has size at least (t), and hence contains some (S\in\mathcal H) disjoint from (Q).

So every legal relative blocker has size (>q). In particular, for (q=\alpha h), all legal blockers have linear size.

Now define

[
\delta_q
========

\frac{\binom{N-q}{\ell}}{\binom N\ell}.
]

This is the full-packet capture fraction of a (q)-set.

The covering number satisfies the sharp bounds

[
\frac{1}{\delta_q}
==================

\frac{\binom N\ell}{\binom{N-q}{\ell}}
\le
|\mathcal H|
\le
\left(1+\log\binom Nt\right)
\frac{\binom N\ell}{\binom t\ell}
=================================

\left(1+\log\binom Nt\right)\frac{1}{\delta_q}.
]

The lower bound is the incidence-counting bound: each (\ell)-set lies in (\binom{N-\ell}{t-\ell}) many (t)-sets, so covering all (\binom Nt) many (t)-sets requires at least

[
\frac{\binom Nt}{\binom{N-\ell}{t-\ell}}
========================================

\frac{\binom N\ell}{\binom t\ell}
]

edges. The upper bound is the greedy set-cover bound.

Thus CPD is tight up to the usual logarithmic set-cover factor.

But the live residual packet remains enormous. Since

[
|\mathcal R_{\mathrm{live}}|
============================

\binom N\ell-|\mathcal H|,
]

and (|\mathcal H|=o(\binom N\ell)), we have

[
|\mathcal R_{\mathrm{live}}|
\ge
\frac12\binom N\ell
]

for large (h). Therefore

[
\frac{|\mathcal R_{\mathrm{live}}|}{|\mathcal C|}
\ge
\frac{\binom t\ell}
{2(1+\log\binom Nt)}.
]

Since

[
\ell\sim \frac{h}{\log h},
\qquad
t\asymp h,
]

we get

[
\log\binom t\ell
================

\Theta!\left(
\frac{h}{\log h}\log\log h
\right).
]

So

[
\frac{|\mathcal R_{\mathrm{live}}|}{|\mathcal C|}
\ge
\exp!\left(
\Omega!\left(
\frac{h}{\log h}\log\log h
\right)
\right).
]

This proves the structural obstruction:

[
\boxed{
\text{Case B cannot be }|\mathcal R_{\mathrm{live}}|\lesssim \kappa |\mathcal C|
\text{ unless }\kappa
\ge
\exp!\left(\Omega!\left(\frac{h}{\log h}\log\log h\right)\right).
}
]

That loss is essentially the whole packet entropy scale.

The level-1 LP also fails exactly here. The fractional solution

[
\xi_a=0,
\qquad
\xi_p=\frac1\ell
\quad(p\in R)
]

hits every (C={a}\cup S), because

[
\sum_{p\in S}\frac1\ell=1,
]

and satisfies the forbidden singleton constraint. Its cost is

[
\frac{N}{\ell}
==============

\Theta(\log h).
]

But every integral legal blocker has size (>q=\Theta(h)). The integrality gap is therefore

[
\Omega!\left(\frac{h}{\log h}\right)
====================================

\Omega(L).
]

So LP duality does not reveal the saturation. The missing object is the **integral covering profile**, not the fractional cover.

---

## 4. What this says about the trajectory

The refinement sequence is both productive and exhausted, depending on what one expects from it.

It is productive because it converged to the correct static invariant:

[
\operatorname{Cov}_{q,\delta}(\mathcal D)
=========================================

\min
\left{
|\mathcal H|:
\mathcal T_{q,\delta}(\mathcal D)
\subseteq
\bigcup_{C\in\mathcal H}N_q(C)
\right}.
]

That is the exact CPD endpoint.

But it is exhausted as an upper-bound paradigm because this invariant is an **integral set-cover number**. Sparse covering designs show that the obstruction can be created by a legal Prolonger family of size essentially

[
1/\delta_q
]

while leaving a residual packet larger than the played shadow by

[
\exp!\left(
\Theta!\left(
\frac{h}{\log h}\log\log h
\right)
\right).
]

Thus any blocker-duality proof valid for arbitrary legal states must either:

[
\text{pay the full covering profile}
]

or be false.

That is the deep commonality across WLST, AWLST, and CPD refutations. The constructions do not merely hide a clever separator. They saturate the separator space itself.

So the exact answer to the zoom-out question is:

[
\boxed{
\text{CPD is the correct static theorem, but static blocker duality has reached its limit.}
}
]

To continue toward (O(r_1)), one must analyze the **dynamic race** before Prolonger has covered the separator space. That requires a different paradigm.

---

## 5. A structurally different paradigm: spectral live-space control

The alternative should not ask, after the fact,

[
\text{“Does the played complement family have a blocker?”}
]

It should track, during the game,

[
\text{“How much of the separator space is still alive?”}
]

This leads to a spectral method on the bipartite disjointness graph between (q)-sets and (L)-sets.

Let

[
\mathcal Q=\binom{P}{q},
\qquad
\mathcal Y=\binom{P}{L}.
]

Connect (Q\in\mathcal Q) to (Y\in\mathcal Y) if

[
Q\cap Y=\varnothing.
]

Equivalently, (Q\subseteq P\setminus Y), where (P\setminus Y) has size (h). This is the Johnson-scheme inclusion graph between (q)-sets and (h)-sets.

Let

[
d_Q=\binom{K-q}{L},
\qquad
d_Y=\binom{K-L}{q}=\binom hq.
]

The graph is biregular. Define

[
\delta_q=\frac{d_Q}{|\mathcal Y|}
=================================

\frac{\binom{K-q}{L}}{\binom KL}.
]

This is the average fraction of (L)-complements killed by a random (q)-set.

The normalized second singular value of this graph is

[
\eta_q
======

\sqrt{
\frac{qL}{(K-L)(K-q)}
}
=

\sqrt{
\frac{qL}{h(K-q)}
}.
]

This follows from the Johnson-scheme singular values for the inclusion matrix (W_{q,h}). The squared singular ratios are

[
\rho_i^2
========

\frac{(q)_i(L)_i}{(h)_i(K-q)_i},
\qquad 0\le i\le q,
]

so the largest nontrivial one is (i=1).

Now let

[
A\subseteq\mathcal Q
]

be the currently legal (q)-candidate Shortener moves, and let

[
R\subseteq\mathcal Y
]

be the currently live Prolonger complements. Put

[
a=\frac{|A|}{|\mathcal Q|},
\qquad
r=\frac{|R|}{|\mathcal Y|}.
]

The expander-mixing inequality gives

[
\left|
\frac{e(A,R)}{d_Q|\mathcal Q|}
------------------------------

ar
\right|
\le
\eta_q\sqrt{a(1-a)r(1-r)}
\le
\eta_q\sqrt{ar}.
]

Therefore, if

[
ar\ge 4\eta_q^2,
]

then

[
e(A,R)\ge \frac12 d_Q|\mathcal Q|ar.
]

Dividing by (|A|=a|\mathcal Q|), there exists (Q\in A) with

[
|N(Q)\cap R|
\ge
\frac12 d_Q r
=============

\frac12\delta_q |R|.
]

So we have a rigorous alternative theorem.

**Spectral live-space separator theorem.**
If the legal (q)-separator space and the live (L)-complement space satisfy

[
\frac{|A|}{|\mathcal Q|}
\cdot
\frac{|R|}{|\mathcal Y|}
\ge
4\eta_q^2,
]

then Shortener has a legal (q)-composite that removes at least

[
\frac12\delta_q
]

of the current live residual packet.

For the central scale (L=h/\log h) and (q=\alpha h),

[
\delta_q
========

\exp!\left(-\Theta_\alpha!\left(\frac h{\log h}\right)\right),
]

while

[
\eta_q
======

\Theta_\alpha!\left(\frac1{\sqrt{\log h}}\right).
]

This theorem bypasses the covering-design obstruction in the following precise sense: sparse covering designs are dangerous only once the legal (q)-space (A) has already been covered down to tiny density. The spectral method sees that collapse directly. It does not try to infer it from (|\mathcal C|), a fractional LP, or local blockers.

The new Shortener meta-strategy is therefore:

[
\boxed{
\text{At each packet/rank, choose }q\text{ and a legal }Q\in A_q
\text{ maximizing }|N(Q)\cap R|.
}
]

Whenever the spectral condition holds, this gives a certified multiplicative decrement:

[
|R_{t+1}|
\le
\left(1-\frac12\delta_q\right)|R_t|.
]

After

[
O(\delta_q^{-1}\log |\mathcal Y|)
]

successful spectral moves, the packet is cleared at that (q)-scale.

The remaining stopping regime is explicit and named:

[
\boxed{
\forall q,\qquad
a_q r < 4\eta_q^2.
}
]

This is no longer a blocker-duality problem. It is a **multi-level small-set expansion / hypergraph-container problem in the Johnson scheme**. The needed next lemma is a spectral stopping theorem: if the legal (q)-spaces are small for all relevant (q) while the residual (R) remains large, then the state has a structured certificate chargeable to a lower-rank obstruction. That is the correct replacement for CPD.

---

## 6. Numerical verification

I verified both the covering-design obstruction and the Johnson-scheme spectral formula in the Python sandbox.

For small greedy covering designs:

| (N) | (\ell) | (t) | (q=N-t) | greedy (|\mathcal H|) | integral (\tau) | fractional upper (N/\ell) | residual / (|\mathcal H|) |
|---:|---:|---:|---:|---:|---:|---:|---:|
| 10 | 3 | 6 | 4 | 12 | 5 | 3.333 | 9.0 |
| 12 | 3 | 8 | 4 | 10 | 5 | 4.000 | 21.0 |
| 14 | 4 | 9 | 5 | 22 | 6 | 3.500 | 44.5 |
| 16 | 4 | 10 | 6 | 20 | 7 | 4.000 | 90.0 |
| 18 | 4 | 11 | 7 | 35 | 8 | 4.500 | 86.4 |

The fractional LP is cheap, but every integral legal blocker is large.

For the spectral formula, direct SVD agrees with

[
\eta_q=
\sqrt{\frac{qL}{h(K-q)}}.
]

| (K) | (h) | (q) | numerical second singular ratio |   formula |
| --: | --: | --: | ------------------------------: | --------: |
|   8 |   5 |   2 |                       0.4472136 | 0.4472136 |
|   9 |   6 |   3 |                       0.5000000 | 0.5000000 |
|  10 |   7 |   3 |                       0.4285714 | 0.4285714 |
|  10 |   8 |   3 |                       0.3273268 | 0.3273268 |
|  12 |   8 |   3 |                       0.4082483 | 0.4082483 |

For (\alpha=1/2), the asymptotic sparse-covering obstruction grows as follows:

| (h) | (L) | (\log |\mathcal C|) upper | (\log(|\mathcal R|/|\mathcal C|)) lower | (\log) max capture |
|---:|---:|---:|---:|---:|
| 100 | 21 | 16.49 | 34.55 | -11.42 |
| 200 | 37 | 27.19 | 70.28 | -21.43 |
| 500 | 80 | 55.26 | 171.72 | -48.60 |
| 1000 | 144 | 96.75 | 330.11 | -89.40 |

So the residual-to-shadow ratio grows like

[
\exp!\left(
\Theta!\left(
\frac h{\log h}\log\log h
\right)
\right),
]

while the best separator capture is only

[
\exp!\left(
-\Theta!\left(
\frac h{\log h}
\right)
\right).
]

---

## Final verdict

The trajectory is not random flailing. It has converged to the correct static invariant:

[
\textbf{relative disjointness-covering profile.}
]

But that convergence also proves exhaustion of the static blocker-duality approach. Sparse covering designs are not edge cases; they are extremizers of the limiting theorem.

The blocker-duality framework can say:

[
\text{large legal separator}
\quad\vee\quad
\text{the separator space has been integrally covered.}
]

It cannot, by itself, turn that into an (O(r_1)) upper bound, because the integral cover can be sparse while the live packet remains exponentially larger than the played shadow.

The structurally different path is to stop treating (\mathcal C) as the primary object and instead control the live bipartite disjointness graph dynamically. The spectral live-space theorem above is the first concrete result in that direction: whenever legal separator space and live residual space are both moderately large, Shortener has a certified multiplicative packet decrement. The remaining named gap is the **multi-level Johnson-scheme spectral stopping theorem**, not another refinement of WLST/AWLST/CPD.

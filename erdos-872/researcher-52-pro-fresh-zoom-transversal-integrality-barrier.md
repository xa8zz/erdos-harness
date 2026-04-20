---
id: R52-pro-fresh-zoom-transversal
type: research
date: 2026-04-19
intent: >
  Zoom out from R52 CPD refutations; diagnose the unifying obstruction and
  propose the transversal-integrality barrier as a paradigm-level finding.
predecessors: [R52-pro-cpd-refuted-self-shadow]
action:
  kind: standalone
claim: >
  Unifying obstruction identified: the transversal-integrality gap of an
  online blocker clutter, equivalently a sparse covering design whose
  blocker has a large pure-vs-fractional hitting gap. All R50-R52 refutations
  are projections of this single object. No known technique closes the
  integrality gap in the online game-legal setting.
---

My diagnosis is that the recurring obstruction is not “many different bad configurations.” It is one object seen through different projections:

**the transversal-integrality gap of an online blocker clutter**, equivalently a sparse covering design whose blocker has a large pure-vs-fractional hitting gap.

More concretely, in a prime packet (P), Prolonger’s played blockers generate a clutter
[
\mathcal C={C_i\subseteq P},
]
and a legal Shortener relative support (Q) is an integral transversal:
[
Q\cap C_i\neq \varnothing \qquad \forall i.
]
All the failed arguments are trying, in one way or another, to convert local/fractional evidence into such a pure integral transversal. The obstruction is that
[
\tau_f(\mathcal C)\ll \tau_{\mathbb Z}(\mathcal C),
]
with (\tau_f) the fractional transversal number and (\tau_{\mathbb Z}) the true transversal number. Local stars, bursts, matchings, atomized blockers, and sparse covering designs are minors or shadows of this same gap.

The rigorous name I would attach to the phenomenon is:

[
\boxed{\textbf{online transversal-integrality-gap clutter}}
]

or, in the static combinatorial language,

[
\boxed{\textbf{sparse }q\textbf{-avoidance covering design / cover-free blocker clutter}.}
]

Here is the structural theorem that I think captures the obstruction sharply.

---

Let (P) be an (N)-point set, let
[
\ell=\left\lfloor \frac{N}{\log N}\right\rfloor,
\qquad
q=\lfloor \alpha N\rfloor
]
for fixed (0<\alpha<1/2). Then there exists a family
[
\mathcal C\subseteq \binom{P}{\ell}
]
such that:

1. every (Q\subseteq P) with (|Q|\le q) misses some (C\in\mathcal C);
2. therefore
   [
   \tau_{\mathbb Z}(\mathcal C)>q\asymp N;
   ]
3. but
   [
   \tau_f(\mathcal C)\le \frac{N}{\ell}=(1+o(1))\log N;
   ]
4. and
   [
   |\mathcal C|
   \le
   \exp!\left(
   \bigl(\log \tfrac1{1-\alpha}+o(1)\bigr)\frac{N}{\log N}
   \right).
   ]

This is exactly the sparse-covering-design saturation appearing in the blocker-duality failures.

Proof. Choose (s) random (\ell)-subsets of (P). For a fixed (q)-set (Q),
[
\Pr(C\cap Q=\varnothing)
========================

# \delta

\frac{\binom{N-q}{\ell}}{\binom{N}{\ell}}.
]
Since (\ell=o(N)) and (q=\alpha N+O(1)),
[
\log \frac1\delta
=================

\ell \log \frac1{1-\alpha}
+
O!\left(\frac{\ell^2}{N}\right)
===============================

\bigl(\log \tfrac1{1-\alpha}+o(1)\bigr)\frac{N}{\log N}.
]
Take
[
s=\left\lceil \frac{2\log \binom{N}{q}}{\delta}\right\rceil.
]
Then the probability that a fixed (q)-set (Q) is not avoided by any chosen (C) is at most
[
(1-\delta)^s\le e^{-s\delta}\le \binom{N}{q}^{-2}.
]
A union bound over all (q)-sets gives positive probability that every (q)-set is avoided. Any smaller (Q) can be extended to a (q)-set, so it is also avoided. Thus every integral transversal has size (>q).

On the other hand, the uniform fractional vector
[
x_p=\frac1\ell
]
satisfies
[
\sum_{p\in C}x_p=1
\qquad \forall C\in\mathcal C,
]
so
[
\tau_f(\mathcal C)\le \sum_{p\in P}x_p=\frac{N}{\ell}.
]
This proves the gap.

For (\alpha=1/4), the exponent constant is
[
\log(4/3)=0.287682\ldots
]
I checked the finite-parameter arithmetic in Python. For example:

[
\begin{array}{c|c|c|c}
N & \ell=\lfloor N/\log N\rfloor & -\log \delta & \log s \text{ using } s\approx 2\log\binom Nq/\delta\
\hline
1000 & 144 & 45.30 & 52.32\
5000 & 587 & 181.50 & 190.14\
10000 & 1085 & 333.57 & 342.89
\end{array}
]

The growth is genuinely (\exp(\Theta(N/\log N))), not (\exp(\Theta(N))).

---

The same construction also gives a rigorous LP-hierarchy barrier.

Use the standard Sherali–Adams convention in which level (r) allows multiplication of each covering inequality
[
g_C(y)=\sum_{p\in C}y_p-1\ge 0
]
by literal monomials
[
\prod_{i\in I}y_i\prod_{j\in J}(1-y_j),
\qquad |I|+|J|\le r.
]

For every (r<\ell), the level-(r) Sherali–Adams relaxation has a feasible pseudo-solution of objective at most
[
\left\lceil r+\frac{N}{\ell-r}\right\rceil.
]
In particular, for (r\le \ell/2),
[
\operatorname{SA}_r(\mathcal C)
\le
r+2\frac{N}{\ell}+O(1)
======================

r+O(\log N),
]
while the true integral optimum is (\Omega(N)).

Proof. Let
[
M=\left\lceil r+\frac{N}{\ell-r}\right\rceil,
]
and let (Y) be a uniformly random (M)-subset of (P). Define the Sherali–Adams moments by
[
\widetilde{\mathbb E}\prod_{i\in S}y_i
======================================

\Pr(S\subseteq Y).
]
We check every localized covering constraint.

Fix (C\in\mathcal C), disjoint (I,J\subseteq P), (|I|+|J|\le r). We need
[
\widetilde{\mathbb E}\left[
\left(\sum_{p\in C}y_p-1\right)
\prod_{i\in I}y_i
\prod_{j\in J}(1-y_j)
\right]\ge 0.
]
Condition on the event (I\subseteq Y), (J\cap Y=\varnothing). If (I\cap C\neq\varnothing), then already (|Y\cap C|\ge 1), so the inequality is immediate.

Otherwise (I\cap C=\varnothing). Put
[
a=|I|,
\qquad
b=|J|,
\qquad
c=|J\cap C|.
]
Then (c\le b), (a+b\le r), and (c<\ell). Conditional on the event above,
[
\mathbb E(|Y\cap C|)
====================

(\ell-c)\frac{M-a}{N-a-b}.
]
Since (c\le b), (a+b\le r), and (r<\ell), our choice of (M) gives
[
M-a
\ge
\frac{N-a-b}{\ell-b}
\ge
\frac{N-a-b}{\ell-c}.
]
Hence
[
\mathbb E(|Y\cap C|)\ge 1.
]
Therefore every localized Sherali–Adams covering constraint of rank (r<\ell) is satisfied.

So the obstruction survives all monomial-local LP reasoning below rank
[
\ell\asymp \frac{N}{\log N}.
]

This is the formal reason the earlier state-inequality paradigm and the newer blocker-duality paradigm keep failing in the same way. A local star, burst, or matching is what this clutter looks like after conditioning on fewer than (\ell) atoms. Sparse covering design is the global completion of the same object. Below rank (\ell), the structure continues to look fractionally harmless; at rank (\ell), the hidden fact “this whole block can be simultaneously avoided” finally becomes visible.

---

This gives the following diagnosis of the current-method boundary.

A proof of
[
L(n)\le O(r_1(n))
]
cannot come from any method whose integration step is fundamentally one of the following:

[
\text{local incidence accounting}
\quad\Longrightarrow\quad
\text{fractional separator}
\quad\Longrightarrow\quad
\text{rounded legal transversal}.
]

That includes the exhausted (F_{\mathrm{useful}}) state inequalities, level-1 blocker duality, CPD-style separator dichotomies unless strengthened by a genuinely global online cost, low-rank LP/Sherali–Adams reasoning, ordinary entropy or union-bound separator arguments, and spectral methods that only see low-order incidence statistics.

The obstruction is not that those methods were implemented imperfectly. The obstruction is that the divisor packet contains the abstract combinatorial shape on which those methods are provably blind.

This does **not** prove that no conceivable SDP/SOS, isoperimetric, game-semantic, or multiplicative-number-theoretic proof can close (r_1). That would be too strong. But it does prove that the known local/fractional family of techniques cannot close (r_1) without an additional high-order ingredient. In particular, a successful proof would need to see correlations among growing sets of roughly

[
\frac{h}{\log h}
]

prime atoms inside a central rank-(h) packet. Fixed-prime Sathe–Selberg Euler-factor information is structurally insufficient, because the obstruction is deliberately invisible to bounded-dimensional prime marginals.

So my answer to the “edge of current techniques” question is:

[
\boxed{\text{Yes: at the level of known local/fractional methods, this is a genuine boundary.}}
]

The missing ingredient would have to be something like an **online high-rank transversal-cost theorem**:

> If Prolonger maintains a (q)-avoidance covering design inside a central divisor packet, then the act of maintaining that design has a terminal-game cost comparable to the covering-design entropy itself.

Equivalently, one must prove that sparse covering designs are not freely realizable inside the actual divisibility game dynamics.

That is not blocker duality. It is a Prolonger-side realizability theorem.

---

The structurally different approach I would pursue is therefore not another separator theorem. It is the following decision problem.

Define the **Online Design Realizability Problem** at rank (h). Let (P_h) be a legal prime packet, let
[
\ell_h=\left\lfloor \frac{h}{\log h}\right\rfloor,
\qquad
q_h=\lfloor \alpha h\rfloor,
]
and let (\mathcal C_t) be the complement clutter induced by Prolonger’s rank-(h) blockers after (t) moves.

Decide whether Prolonger can, while respecting full divisibility legality including cross-composite legality, maintain a (q_h)-avoidance design
[
\mathcal C_t\subseteq \binom{P_h}{\ell_h}
]
of size
[
\exp!\left(O!\left(\frac{h}{\log h}\right)\right)
]
without paying at least the residual packet cost
[
\Omega!\left(\frac{N_h}{\log h}\right).
]

There are two possible outcomes.

If the answer is **yes**, then the obstruction is not merely a proof artifact; it is a Prolonger strategy template, and one should expect an (r_2)-scale lower bound mechanism.

If the answer is **no**, then the missing theorem is precisely the nonlocal upper-bound ingredient needed for (r_1): sparse covering designs exist abstractly, but cannot be maintained cheaply in the divisibility game.

This approach is not subject to the sparse-covering-design obstruction, because it does not try to find a small transversal inside an existing sparse design. It asks whether the design itself can be generated and sustained at low game cost. In this formulation, sparse covering designs are not counterexamples; they are the object whose realizability must be classified.

---

Here is the partial result beginning that approach, at the exact obstruction scale.

In the abstract central-packet game, Prolonger can realize the full obstruction with only

[
\exp!\left(
\bigl(\log \tfrac1{1-\alpha}+o(1)\bigr)\frac{h}{\log h}
\right)
]

blockers, while every Shortener legal relative separator has size (>\alpha h), and every monomial-local LP/state test below rank (h/\log h) still sees only cost (O(\log h+r)).

Formally, set (N=h), (\ell=\lfloor h/\log h\rfloor), (q=\lfloor \alpha h\rfloor). The theorem above gives a clutter (\mathcal C_h\subseteq \binom{P_h}{\ell}) satisfying

[
|\mathcal C_h|
\le
\exp!\left(
\bigl(\log \tfrac1{1-\alpha}+o(1)\bigr)\frac{h}{\log h}
\right),
]
[
\tau_{\mathbb Z}(\mathcal C_h)>\alpha h,
]
but
[
\tau_f(\mathcal C_h)\le (1+o(1))\log h.
]
Moreover, for every (r\le \ell/2),
[
\operatorname{SA}_r(\mathcal C_h)\le r+O(\log h).
]

Thus the first rank at which local reasoning can even see the obstruction is

[
r\asymp \ell\asymp \frac{h}{\log h}.
]

This is exactly the same scale as the residual term in the strongest state inequality:
[
\frac{N_h}{\log h}.
]
Using the supplied fact that the residual floors over central ranks sum to

[
r_2(n)=\frac{n}{\log\log\log n},
]
the theorem explains why (r_2) is not an accident of the R35 proof. It is the aggregate cost of failing to access rank-(h/\log h) transversal information inside central packets.

So the clean structural conclusion is:

[
\boxed{
\text{The } r_2 \text{ barrier is a genuine high-rank transversal-integrality barrier, not a removable bookkeeping defect.}
}
]

I would therefore not expect another refinement of WLST/AWLST/CPD, nor another (F_{\mathrm{useful}})-style state inequality, to reach (r_1). The decisive next theorem must be one of these two:

[
\boxed{
\text{Online design non-realizability}
}
]
showing that Prolonger cannot cheaply maintain sparse avoidance designs in the actual divisibility game, which would reopen the path to (r_1);

or

[
\boxed{
\text{Online design realizability}
}
]
constructing such designs inside the full game, including cross-composite legality, which would push the lower-bound side toward (r_2).

Absent one of those genuinely global theorems, the mathematically justified working conclusion is that the problem is currently stuck at the (r_2) frontier, and (r_1) is beyond the reach of the known local/fractional paradigms.

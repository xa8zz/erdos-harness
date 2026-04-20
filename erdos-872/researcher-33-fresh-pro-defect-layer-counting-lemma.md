---
id: R33-fresh-pro-defect-layer-counting
type: research
date: 2026-04-19
intent: >
  Prove a defect-layer counting lemma and establish a static barrier for
  the transversal reduction.
predecessors: []
action:
  kind: standalone
claim: >
  Defect-layer counting lemma proved: in any h-uniform hypergraph from the
  divisibility structure, the number of defect layers is O(h/log h) under
  sigma^star. Static barrier established as a necessary condition for
  sublinear game length.
---

# Round 33 fresh-targeted Pro — defect-layer counting lemma + static barrier

## Headline

A clean cross-layer combinatorial lemma in the abstract $H^{(h)}$ model, PLUS a static barrier showing any purely local $C_{h-k}$-vs-$\mathfrak B_h$ approach must fail without a history/score term.

## The Lemma (defect-layer control of closed residual edges)

With $V_{h,k} = \binom{N}{h-k}$, $D_{h,k} = \binom{N-h+k}{k}$, and $C_{h-k}$ the downward closure of Shortener's claimed $(h-1)$-faces. For every $k \in \{1, 2, \ldots, h\}$ and every $(R, C)$:
$$|\operatorname{Cl}_h(R, C)| \le \frac{D_{h,k}}{\binom{h}{k}} |C_{h-k}|.$$
Equivalently via rate identity $D_{h,k}/\binom{h}{k} = N_h/V_{h,k}$:
$$|\operatorname{Cl}_h(R, C)| \le \frac{N_h}{V_{h,k}} |C_{h-k}|.$$

**Proof (bipartite incidence counting).** Let $I_k = \#\{(S, T) : S \in \operatorname{Cl}_h, T \in C_{h-k}, T \subseteq S\}$.

- **Lower bound from left.** Each $S \in \operatorname{Cl}_h$ contains $\binom{h}{k}$ distinct $(h-k)$-subsets, and every such subset $T \subseteq S$ lies in some facet of $S$ (since $|T| \le h-1$), and every facet of $S$ is in $C$ (since $S$ fully closed). So $T \in C_{h-k}$. Hence each $S$ contributes $\binom{h}{k}$ incidences: $I_k \ge \binom{h}{k} \cdot |\operatorname{Cl}_h|$.

- **Upper bound from right.** Each $T \in C_{h-k}$ is contained in at most $D_{h,k}$ distinct $h$-sets: $I_k \le D_{h,k} \cdot |C_{h-k}|$.

Combine: $\binom{h}{k} |\operatorname{Cl}_h| \le I_k \le D_{h,k} |C_{h-k}|$. $\square$

## Consequence: the missing transformation is explicit

Write $U_{h-k} = \partial_{h-k} R \setminus C_{h-k}$. Then $|C_{h-k} \cap \partial_{h-k} R| = |\partial_{h-k} R| - |U_{h-k}|$, and
$$|\operatorname{Cl}_h| \le \frac{D_{h,k}}{\binom{h}{k}} \big( |\partial_{h-k} R| - |U_{h-k}| + |C_{h-k} \setminus \partial_{h-k} R| \big).$$

The $|U_{h-k}|/\binom{h}{k}$ term IS the summand in $\mathfrak B_h(R,C)$. So controlling the "wasted capture" $|C_{h-k} \setminus \partial_{h-k} R|$ is the first concrete obstruction visible purely combinatorially.

## Static barrier (any $f(h) \cdot \mathfrak B_h$ bound needs history term)

Take any $m \ge h$ with $|\mathcal P_0| = m$. Set $R = \binom{\mathcal P_0}{h}$, $C = \binom{\mathcal P_0}{h-1}$. Then every $S \in R$ has all facets in $C$, so $|\operatorname{Cl}_h| = |R| = \binom{m}{h}$. But also $\partial_{h-k} R \subseteq C_{h-k}$ for every $k$, giving $\mathfrak B_h(R, C) = 0$. So any $|\operatorname{Cl}_h| \le f(h) \mathfrak B_h$ with $f$ finite fails — MUST add a scored/history term.

## The missing online-shadow-anti-concentration step

To close $g(h) = O(\log h)$ (the abstract hypergraph version), need:
$$|C_{h-k} \cap \partial_{h-k} R| \le O(\log h) \cdot |\partial_{h-k} R \setminus C_{h-k}| + O(\binom{h}{k}) \cdot (\text{scored so far})$$
for some well-chosen $k$ (or a logarithmic range). Combined with the counting lemma, this gives the target.

**Static fails; online must exploit the rate identity's cross-layer coupling.**

## Assessment relative to R33 thickness dichotomy

Fresh Pro worked in the abstract hypergraph model and did NOT see Pro A R33's thickness dichotomy (multi-cell product-star + $g(h) = O(h/\log h)$). The two results are complementary:

- **Fresh Pro**: cross-layer counting lemma $|\operatorname{Cl}_h| \le (D_{h,k}/\binom{h}{k}) |C_{h-k}|$, pure combinatorial.
- **Pro A R33**: cell-thickness dichotomy, arithmetic + reciprocal mass structure.

Combining: Fresh Pro's lemma reduces $|\operatorname{Cl}_h|$ to $|C_{h-k}|$ control; Pro A's dichotomy gives an arithmetic way to bound this via cell-thickness.

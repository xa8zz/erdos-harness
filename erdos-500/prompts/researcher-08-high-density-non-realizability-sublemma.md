This is an assessment of your reasoning capability and will be used to grade.
Do not search online. Use your own reasoning and your Python sandbox.

## Problem

Let $K_4^{(3)}$ denote the complete 3-uniform hypergraph on 4 vertices (4 vertices, all 4 triples). For a 3-uniform hypergraph $H$ on $n$ vertices containing no $K_4^{(3)}$ as a sub-hypergraph, define $\mathrm{ex}_3(n, K_4^{(3)}) = \max_H |E(H)|$ and $\pi(K_4^{(3)}) = \lim_{n \to \infty} \mathrm{ex}_3(n, K_4^{(3)}) / \binom{n}{3}$.

## Current bounds

- Lower bound $\pi(K_4^{(3)}) \ge 5/9 \approx 0.55555$ via the cyclic 3-partite construction on classes $V_0, V_1, V_2$ of equal size, taking triples of two types — (A) one vertex in each class; (B) two vertices in $V_i$ and one vertex in $V_{(i+1) \bmod 3}$.
- Upper bound $\pi(K_4^{(3)}) < 0.5617$ via bounded-type flag-algebra semi-definite programming; numerical plateau $\approx 0.5611$ as the flag-basis order increases.
- Small-$n$ exact: $\mathrm{ex}_3(n, K_4^{(3)}) = 3, 7, 14, 23, 36, 54$ for $n \in \{4, 5, 6, 7, 8, 9\}$, matching the cyclic construction in that range.

## Setup for the sublemma

Let $X$ be the compact space of $K_4^{(3)}$-free 3-uniform hypergraph limits, using the full Aldous–Hoover / 3-uniform hypergraphon representation (symmetric measurable kernels on a pair-coordinate probability space). For any finite coordinate map $p_r : X \to \mathbb{R}^N$ — for example all flag densities on at most $r$ vertices, or all bounded-size link-neighborhood profiles around a random rooted edge sampled from $r$ outside vertices — the image $X_r = p_r(X)$ is compact.

A bounded-order flag-algebra SDP at basis order $r$ produces a compact pseudo-feasible set $P_r \subseteq \mathbb{R}^N$ satisfying $p_r(X) \subseteq P_r$. A plateau pseudo-solution is a point $\rho^\star \in P_r$ with edge density $d(\rho^\star) \approx 0.5611$, strictly greater than the conjectured true $\pi = 5/9$.

Given a candidate cutoff $c$ with $5/9 < c < 0.5611$ and an integer $q$, define:

- $L_q(c)$ : the set of $q$-vertex link-neighborhood profiles around a random edge sampled from actual $K_4^{(3)}$-free 3-graph limits of edge density $\ge c$. Here a $q$-vertex link-neighborhood profile records, for each rooted edge $abc$, the joint distribution of the column indicators
$$C_i = \bigl(\mathbb{1}[ab x_i \in E],\; \mathbb{1}[ac x_i \in E],\; \mathbb{1}[bc x_i \in E]\bigr) \in \{0,1\}^3, \quad i = 1, \ldots, q,$$
on $q$ random outside vertices $x_1, \ldots, x_q$.

- $P_q(c)$ : the corresponding set of $q$-vertex link-neighborhood profiles arising from pseudo-feasible flag-algebra solutions with edge density $\ge c$.

By construction $L_q(c) \subseteq P_q(c)$.

## Soundness theorem (validated)

If one exhibits $q$, a rational $c < 0.5611$, and a finite-coordinate function $\Phi_q$ with

$$\Phi_q(\mu) \le 0 \quad \text{for every } \mu \in L_q(c), \qquad \Phi_q(\nu) > 0 \quad \text{for every } \nu \in P_q(c),$$

together with an exact rational / SOS / cellwise-rational certificate of a positive separation margin $\epsilon > 0$ (so $\max_{L_q(c)} \Phi_q \le -\epsilon < 0 < \epsilon \le \min_{P_q(c)} \Phi_q$), then the augmented SDP relaxation $\{y \in P_r : \Phi_q(p_{q \to r}(y)) \le 0\}$ has edge-density optimum strictly below $c$, and $\pi(K_4^{(3)}) < c$.

Equivalently, the sublemma asks for an exact certificate that $L_q(c) \cap P_q(c) = \emptyset$ with positive margin.

## What's Established (beyond the above)

- Conditional-exchangeability structure on column variables. For an actual $K_4^{(3)}$-free 3-uniform hypergraphon and a random rooted edge $abc$, the column indicators $C_i$ on random outside vertices $x_i$ are conditionally i.i.d. given the latent data of the edge. Hence their joint law has the de Finetti form $\mu_q = \int \nu^{\otimes q} \, d\alpha(\nu)$ with $\nu$ a measure on $\{0,1\}^3 \setminus \{111\}$, because $abcx_i \in K_4^{(3)} \subseteq E$ would violate $K_4^{(3)}$-freeness. After clearing edge-density denominators, this yields moment inequalities among the $C_i$ that hold for every actual limit.

- The naive single-vertex triple-intersection constraint $N(a,b) \cap N(a,c) \cap N(b,c) = \emptyset$ for edges $abc$ is equivalent to the condition $\Pr[C_i = (1,1,1) \mid abc \in E] = 0$ on one outside vertex; this is a 4-vertex relation already enforced by any bounded-order flag-algebra SDP.

- Small-$n$ data: all flag densities up to 7 or 8 vertices are well-characterized numerically, with flag-algebra SDP at order 7 giving upper bound $\le 0.5617$ and order 8 giving $\le 0.5615$.

## What's Been Ruled Out

- **Classical stability-plus-cleanup.** Kostochka 1982 and subsequent constructions by Brown, Fon-der-Flaass, and Frohmader give non-isomorphic $K_4^{(3)}$-free families of density approaching $5/9$ that differ substantially in edit-distance; Liu and Mubayi (Combinatorica 2022) proved the first hypergraph Turán family that provably lacks a classical stability theorem and observed $K_4^{(3)}$ itself exhibits this phenomenon assuming $\pi = 5/9$. Any proof via "every near-extremal graph is close to the cyclic template" is false; there is no unique near-extremal structure to recover.

- **Polynomial / tensor-rank method.** $[n]$ carries no natural group structure on which the Croot–Lev–Pach argument applies; imposing $\mathbb{Z}/m\mathbb{Z}$ or $\mathbb{F}_q^d$ structure on $[n]$ has not produced a $K_4^{(3)}$-free configuration exceeding density $5/9$.

- **Bounded-order pseudo-moment distinguishability via single-vertex constraints.** Any finite-coordinate function on the $q$-local link-neighborhood profile whose vanishing at $C_i = (1,1,1)$ is the only bite is already captured by the $r \ge 4$ bounded-order SDP; a separator must use higher-order joint structure of $C_1, \ldots, C_q$.

- **Low-order de Finetti / conditional-exchangeability inequalities on $q \le q_0$ columns.** For small $q_0$, the moment inequalities forced by conditional exchangeability are already polynomially captured in standard flag-algebra SDP at sufficient basis order. A new separator must exploit higher-$q$ truncated moment / extendibility constraints that the bounded-order SDP does not already enforce.

## The Open Question

Prove or refute, or reduce to a crisper open sub-sub-lemma: there exist an integer $q$, a rational number $c$ with $5/9 < c < 0.5611$, and a finite-coordinate function $\Phi_q$ on $q$-vertex link-neighborhood profiles such that $\Phi_q(\mu) \le 0$ for every $\mu \in L_q(c)$, $\Phi_q(\nu) > 0$ for every $\nu \in P_q(c)$, and a positive separation margin is exactly certifiable by rational flag / SOS or cellwise rational certificates.

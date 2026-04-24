This is an assessment of your reasoning capability and will be used to grade.
Do not search online. Use your own reasoning and your Python sandbox.

## Problem

Let $K_4^{(3)}$ denote the complete 3-uniform hypergraph on 4 vertices (4 vertices, all 4 triples). For a 3-uniform hypergraph $H$ on $n$ vertices containing no $K_4^{(3)}$ as a sub-hypergraph, define $\mathrm{ex}_3(n, K_4^{(3)}) = \max_H |E(H)|$ and $\pi(K_4^{(3)}) = \lim_{n \to \infty} \mathrm{ex}_3(n, K_4^{(3)}) / \binom{n}{3}$.

Determine $\pi(K_4^{(3)})$.

## What's Established

- **Lower bound $\pi(K_4^{(3)}) \ge 5/9$.** Partition $[n]$ into three classes $V_0, V_1, V_2$ of size $n/3$. Let $E$ consist of all triples of two types: (A) one vertex in each class; (B) two vertices in $V_i$ and one vertex in $V_{(i+1) \bmod 3}$ for some $i \in \{0, 1, 2\}$. The hypergraph $([n], E)$ is $K_4^{(3)}$-free: any 4 vertices distribute across the classes as $(4,0,0)$, $(3,1,0)$, $(2,2,0)$, or $(2,1,1)$ up to class permutation, and in each case at least one of the 4 triples on those vertices is absent from $E$. Counting: $|E| = (n/3)^3 + 3 \binom{n/3}{2} (n/3) \sim n^3/27 + n^3/18 = 5n^3/54 = (5/9) \binom{n}{3}$.

- **Upper bound $\pi(K_4^{(3)}) < 0.5617$.** Semi-definite programming over the flag-algebra basis of 3-uniform hypergraph types of order $\le k$ produces a dual certificate bounding $\pi(K_4^{(3)})$. For $k = 7$ the bound is $\le 0.5617$; for $k = 8$ the bound is $\le 0.5615$; further increases in $k$ have produced $O(10^{-4})$ further tightening, and the known numerical plateau is $\approx 0.5611$.

- **Related complete-hypergraph densities.** $\pi(K_r^{(2)}) = 1 - 1/(r-1)$ for $r \ge 3$. $\pi(K_4^{(3)-}) = 2/9$, where $K_4^{(3)-}$ is $K_4^{(3)}$ minus one triple.

- **Blow-ups.** For any $K_4^{(3)}$-free 3-graph $H_0$ on $m$ vertices, the balanced blow-up on $n$ vertices has density converging to the density of $H_0$. The balanced blow-up of the 3-partite construction attains $5/9$; no $K_4^{(3)}$-free 3-graph of any order is known whose blow-up exceeds $5/9$.

## What's Been Ruled Out

- **Polynomial / tensor-rank method (cap-set-style).** The ground set $[n]$ has no natural group structure on which a Croot–Lev–Pach tensor-rank argument applies. Imposing $\mathbb{Z}/m\mathbb{Z}$ or $\mathbb{F}_q^d$ structure on $[n]$ has not produced a $K_4^{(3)}$-free configuration exceeding density $5/9$.

- **Random / greedy hypergraph constructions.** A uniformly random 3-graph of density $p > 5/9$ contains $K_4^{(3)}$ almost surely for large $n$: expected copies $\binom{n}{4} p^4 \to \infty$. Any construction exceeding density $5/9$ must be highly structured.

- **Bounded-order flag-algebra SDP.** The dual SDP bound as a function of flag-basis order $k$ decreases monotonically but plateaus near $\sim 0.5615$; marginal improvement per added vertex is $O(10^{-4})$, suggesting a structural limit of the paradigm rather than a computational limit.

## The Open Question

Determine $\pi(K_4^{(3)})$.

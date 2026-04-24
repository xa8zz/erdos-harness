This is an assessment of your reasoning capability and will be used to grade.
Do not search online. Use your own reasoning and your Python sandbox.

## Problem

Let $K_4^{(3)}$ denote the complete 3-uniform hypergraph on 4 vertices (4 vertices, all 4 triples). For a 3-uniform hypergraph $H$ on $n$ vertices containing no $K_4^{(3)}$ as a sub-hypergraph, define $\mathrm{ex}_3(n, K_4^{(3)}) = \max_H |E(H)|$ and $\pi(K_4^{(3)}) = \lim_{n \to \infty} \mathrm{ex}_3(n, K_4^{(3)}) / \binom{n}{3}$.

## Current bounds

- Lower bound: $\pi(K_4^{(3)}) \ge 5/9 \approx 0.55555$ (cyclic 3-partite construction).
- Upper bound: $\pi(K_4^{(3)}) < 0.5617$ via bounded-type flag-algebra SDP; numerical plateau $\approx 0.5611$ with marginal improvement $O(10^{-4})$ per added basis vertex.
- Small-$n$ exact: $\mathrm{ex}_3(n, K_4^{(3)}) = 3, 7, 14, 23, 36, 54$ for $n \in \{4, \ldots, 9\}$, matching the cyclic construction.

## Ruled out

- **Classical stability-plus-cleanup.** Kostochka 1982 + Brown + Fon-der-Flaass + Frohmader constructed non-isomorphic $K_4^{(3)}$-free families of density approaching $5/9$ that differ substantially in edit-distance. Liu–Mubayi (Combinatorica 2022, arXiv:1911.07969) proved the first hypergraph Turán family provably lacking a stability theorem and noted $K_4^{(3)}$ exhibits this phenomenon assuming $\pi = 5/9$. Any stability-plus-cleanup proof must handle the full Kostochka family simultaneously.
- **Polynomial / tensor-rank method.** $[n]$ lacks natural group structure for Croot–Lev–Pach arguments.
- **3-partite type constructions.** Among all $2^{10} = 1024$ triple-templates on 3 labeled classes, exactly 45 are $K_4^{(3)}$-free under blow-up; the unique density-maximum is the cyclic template $\{001, 012, 022, 112\}$ with density polynomial $6xyz + 3x^2 y + 3y^2 z + 3z^2 x$ on the simplex $x+y+z=1$, attaining $5/9$ at the balanced partition. No 3-partite type construction beats $5/9$.

## Known features of the bounded-order flag-algebra plateau

The bounded-type flag-algebra SDP optimum at the plateau (at basis order $k \ge 7$) is a fractional pseudo-moment vector that satisfies every local $K_4^{(3)}$-free flag inequality up to the truncation order, yet is not known to be realizable as the limit of any sequence of actual $K_4^{(3)}$-free 3-graphs. This is the Sum-of-Squares pseudo-moment phenomenon: the SDP converges to $\approx 0.5611$ on a fractional object that can only be ruled out by adding information beyond bounded-order subgraph-density statistics.

## The proposed approach: localized realizability separator

**Claim to verify.** To prove $\pi(K_4^{(3)}) < 0.5611$, it suffices to exhibit a finite-codimension inequality $\Phi$ such that:

1. $\Phi(\rho) \le 0$ for every actual $K_4^{(3)}$-free limit $\rho$ (hypergraphon, pair-typed).
2. $\Phi(\rho^\star) > 0$ for the bounded-order flag-algebra SDP pseudo-extremizer $\rho^\star$.

The schematic form of a candidate $\Phi$ is a rational / localized flag certificate

$$\rho - c \;\le\; \sum_i D_i \cdot \mathrm{SOS}_i + \text{known } K_4^{(3)}\text{-free relations},$$

where $D_i$ are positive densities of conditioning events (flag types, local subhypergraphs) and $\mathrm{SOS}_i$ are Sum-of-Squares polynomial certificates in flag densities. The certificate is verified by case-split on denominator magnitude: on $\{D_i \ge \eta\}$ clear denominators and use polynomial SOS; on $\{D_i < \eta\}$ use direct flag inequalities together with the $K_4^{(3)}$-free relations.

One natural source of the conditioning $D_i$ is link-neighborhood statistics. For an edge $abc \in E(H)$ in a $K_4^{(3)}$-free 3-graph, the pair-links $N(a,b), N(a,c), N(b,c)$ satisfy $N(a,b) \cap N(a,c) \cap N(b,c) = \emptyset$. A localized inequality can condition on density or mutual-information profiles of these triple-intersection patterns sampled over random hyperedges.

## The task

**Part 1 — Verify soundness.** Is the proposed approach logically sound? Specifically, does exhibiting $\Phi$ with the two properties above rigorously imply $\pi(K_4^{(3)}) < 0.5611$? Are there hidden subtleties — for example, in (a) whether "actual $K_4^{(3)}$-free limit" coincides with "limit of actual $K_4^{(3)}$-free 3-graph sequence" (the Aldous–Hoover vs. symmetric-measurable subtlety), (b) whether the pseudo-extremizer $\rho^\star$ is genuinely unique or a convex combination of pseudo-solutions, or (c) how the case-split on $D_i \ge \eta$ vs. $D_i < \eta$ avoids singular behavior? If the approach is sound, state it as a precise theorem. If it is flawed, explain precisely where.

**Part 2 — Prove or disprove a concrete separator exists.** Either:

- (i) Exhibit a concrete $\Phi$ (rational / localized flag certificate, entropy inequality on link-neighborhoods, or any other finite-codimension form) and argue it separates actual $K_4^{(3)}$-free limits from the bounded-order SDP pseudo-extremizer. A valid $\Phi$ does not need to close the gap to $5/9$; it only needs to give a strict improvement over $0.5611$.

- (ii) Prove a no-go theorem: show that no $\Phi$ of a specified form (e.g. rational flag expressions of bounded order, or entropy inequalities on link-neighborhood profiles of bounded order) can separate actual $K_4^{(3)}$-free limits from every pseudo-extremizer of the bounded-order SDP. This would identify the structural obstruction to the approach.

- (iii) Reduce either (i) or (ii) to a crisply stated open sub-lemma: if the approach hinges on an unresolved identity or inequality, state that sub-lemma precisely.

## The Open Question

Is the localized-realizability-separator approach logically sound, and if so, can a concrete separator be exhibited that produces a rigorous upper bound $\pi(K_4^{(3)}) < 0.5611$?

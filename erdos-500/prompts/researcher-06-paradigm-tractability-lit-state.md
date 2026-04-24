This is an assessment of your reasoning capability and will be used to grade.
Do not search online. Use your own reasoning and your Python sandbox.

## Problem

Let $K_4^{(3)}$ denote the complete 3-uniform hypergraph on 4 vertices (4 vertices, all 4 triples). For a 3-uniform hypergraph $H$ on $n$ vertices containing no $K_4^{(3)}$ as a sub-hypergraph, define $\mathrm{ex}_3(n, K_4^{(3)}) = \max_H |E(H)|$ and $\pi(K_4^{(3)}) = \lim_{n \to \infty} \mathrm{ex}_3(n, K_4^{(3)}) / \binom{n}{3}$.

Determine $\pi(K_4^{(3)})$.

## Current bounds and status

- **Lower bound.** $\pi(K_4^{(3)}) \ge 5/9 \approx 0.5555$ via the cyclic 3-partite construction: partition $[n]$ into $V_0, V_1, V_2$ of size $n/3$, include triples $\{a, b, c\}$ of two types — (A) one vertex in each class, or (B) two vertices in $V_i$ and one in $V_{(i+1) \bmod 3}$.

- **Upper bound.** $\pi(K_4^{(3)}) < 0.5617$ via bounded-type flag-algebra SDP. The dual bound plateaus near $\approx 0.5611$ as the flag-basis order $k$ increases, with marginal improvement $O(10^{-4})$ per added basis vertex.

- **Small-$n$ exact values.** $\mathrm{ex}_3(n, K_4^{(3)}) = 3, 7, 14, 23, 36, 54$ for $n \in \{4, 5, 6, 7, 8, 9\}$, matching the cyclic construction exactly.

- **Gap.** Absolute $\sim 0.006$, relative $\sim 1\%$.

## What's been ruled out

- **Polynomial / tensor-rank (cap-set-style) method.** $[n]$ lacks a natural group structure for Croot–Lev–Pach tensor arguments.

- **3-partite type constructions.** Among all $2^{10} = 1024$ triple-templates on 3 labeled classes, exactly 45 are $K_4^{(3)}$-free under blow-up; the unique density-maximum is the cyclic template with max density exactly $5/9$ at the balanced partition. No 3-partite construction beats $5/9$.

- **Classical stability-plus-cleanup.** Kostochka (1982), Brown, Fon-der-Flaass, and Frohmader constructed non-isomorphic $K_4^{(3)}$-free families of density approaching $5/9$ that differ substantially in edit-distance from the cyclic template. Liu–Mubayi (Combinatorica 2022, arXiv:1911.07969) proved the first hypergraph Turán family that provably lacks a classical stability theorem and explicitly observed $K_4^{(3)}$ itself exhibits this phenomenon assuming $\pi = 5/9$. So near-extremal $K_4^{(3)}$-free graphs do not converge to a unique template; any stability-plus-cleanup proof must handle the full family of Kostochka-type constructions simultaneously, which is open.

- **Bounded-order flag-algebra SDP.** Sum-of-Squares pseudo-moment barrier: the SDP converges on fractional "pseudo-hypergraphons" that satisfy local $K_4^{(3)}$-free constraints but are not globally realizable as infinite measure spaces. Scaling the flag-basis order has produced only $O(10^{-4})$ tightening for several years.

## Four candidate paradigms under consideration

Each has been proposed as machinery fundamentally different from classical stability and bounded-order flag algebras, designed to enforce infinite-order global realizability:

1. **Continuous variational calculus on hypergraphons.** Transpose the problem into the primal infinite-dimensional space of $K_4^{(3)}$-free 3-graphons $W : [0,1]^3 \to [0,1]$. Use Euler–Lagrange functional derivatives and continuous symmetrization flows (analog of Steiner symmetrization) to analytically deform any $K_4^{(3)}$-free hypergraphon toward the cyclic 3-partite step-function without decreasing its edge density.

2. **Information geometry / entropy polymatroids.** Bound the edge density via entropy vectors of sampled vertex neighborhoods. Use subadditivity, generalizations of Shearer's Lemma, and non-Shannon (Ingleton-style) polymatroid inequalities to enforce global joint-distribution realizability — something local moment matrices cannot.

3. **Topological combinatorics.** $K_4^{(3)}$ is the boundary of a 3-simplex, homeomorphic to $S^2$, so $K_4^{(3)}$-freeness is a condition on the 2-dimensional simplicial complex of the hypergraph. Use Stanley–Reisner rings, Kalai's algebraic shifting, simplicial cohomology and Betti-number constraints to capture the $\mathbb{Z}_3$ cyclic-orientation invariant of the cyclic construction that uncolored subgraph counts project away.

4. **Rational Positivstellensatz.** Extend flag algebras beyond polynomial Sum-of-Squares by introducing denominators — evaluate subgraph distributions conditional on the positive density of other substructures. Rational SOS certificates (Artin's theorem / Hilbert's 17th problem) unfold into infinite-degree Taylor series, granting the flexibility to approximate the sharp discontinuous step-function of the $5/9$ extremal regime without pushing the baseline flag order to infinity.

## The task

For each of the four paradigms, assess:

- **Prior work.** From your knowledge of the extremal combinatorics and hypergraph Turán literature, has this paradigm been applied to $K_4^{(3)}$-free hypergraphs, to adjacent hypergraph Turán problems (e.g. $K_4^{(3)-}$, $F_5$, tight cycles, uniform Turán density problems), or to similar extremal questions in graph theory? Name specific results, authors, or papers if known, at the granularity you can recall. If you don't know of relevant prior work, say so plainly.

- **Tractability.** Is there a concrete path from this paradigm to a rigorous upper bound on $\pi(K_4^{(3)})$ strictly below the bounded-order flag-algebra plateau $\approx 0.5611$? What is the first specific sub-lemma or structural theorem that would need to be proved? Where does the approach most plausibly stall, and what is the obstacle?

- **Relation to the SOS / pseudo-moment barrier.** Does the paradigm genuinely escape bounded-order Sum-of-Squares at the level of global realizability, or is it equivalent to a reformulation of flag algebras that would inherit the same plateau?

After evaluating all four, identify the one or two paradigms most likely to produce a new rigorous upper bound on $\pi(K_4^{(3)})$ within reasonable effort, and explain specifically why.

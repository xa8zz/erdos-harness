This is an assessment of your reasoning capability and will be used to grade.
Do not search online. Use your own reasoning and your Python sandbox.

## Problem

Let $K_4^{(3)}$ denote the complete 3-uniform hypergraph on 4 vertices (4 vertices, all 4 triples). For a 3-uniform hypergraph $H$ on $n$ vertices containing no $K_4^{(3)}$ as a sub-hypergraph, define $\mathrm{ex}_3(n, K_4^{(3)}) = \max_H |E(H)|$ and $\pi(K_4^{(3)}) = \lim_{n \to \infty} \mathrm{ex}_3(n, K_4^{(3)}) / \binom{n}{3}$.

## What's Established

- **Lower bound $\pi \ge 5/9$.** Cyclic 3-partite construction: partition $[n]$ into $V_0, V_1, V_2$ of size $n/3$; include all triples of types (A) one vertex in each class or (B) two in $V_i$, one in $V_{(i+1) \bmod 3}$. Density $(5/9) \binom{n}{3}$.

- **Upper bound $\pi \le 0.5617$ via bounded-order flag-algebra SDP.** Razborov's flag-square method at basis order $r = 7$. The numerical plateau as $r$ increases is $\approx 0.5611$ with marginal improvement $O(10^{-4})$ per added basis vertex.

- **Small-$n$ exact values.** $\mathrm{ex}_3(n, K_4^{(3)}) = 3, 7, 14, 23, 36, 54$ for $n \in \{4, \ldots, 9\}$, matching the cyclic 3-partite construction $T(n) = \max_{a + b + c = n}(abc + \binom{a}{2} b + \binom{b}{2} c + \binom{c}{2} a)$ exactly.

- **Among 3-partite type constructions, the cyclic template is uniquely density-maximal.** Of all $2^{10} = 1024$ triple-templates on three labeled classes, exactly 45 satisfy $K_4^{(3)}$-freeness under blow-up; the cyclic template $\{001, 012, 022, 112\}$ is the unique density-maximum (up to class-relabeling), with density polynomial $6xyz + 3 x^2 y + 3 y^2 z + 3 z^2 x$ on the simplex $x + y + z = 1$, attaining $5/9$ at $x = y = z = 1/3$.

- **Augmented-SDP soundness theorem.** Let $X$ be the compact space of $K_4^{(3)}$-free 3-uniform hypergraph limits in the Aldous–Hoover representation and $P_r$ the bounded-order flag-algebra pseudo-feasible set. If finite-coordinate inequalities $\Phi_1, \ldots, \Phi_s$ are valid on $X$ (i.e., $\Phi_j(p_r(W)) \le 0$ for every $W \in X$) and one certifies $\sup\{d(y) : y \in P_r,\ \Phi_j(y) \le 0\ \forall j\} \le c$ via exact rational/SOS/flag-algebra verification, then $\pi(K_4^{(3)}) \le c$. Schematic certificate: $c - d = \sum \mathrm{SOS}_\ell + \sum Q_j (-\Phi_j) + \sum R_m$ with $R_m$ the $K_4^{(3)}$-free flag relations.

- **De Finetti / finite-extendibility reduction.** Let $S = \{0, 1\}^3 \setminus \{(1, 1, 1)\}$, $|S| = 7$ (the column patterns consistent with $K_4^{(3)}$-freeness for an outside vertex around a rooted edge). For an actual $K_4^{(3)}$-free limit and a random rooted edge, the symmetrized $q$-column profile lies in the de Finetti moment cone $D_q = \mathrm{conv}\{\nu^{\otimes q} : \nu \in \Delta(S)\}$. Define $E_{q, Q}$ as the $q$-marginal polytope of exchangeable laws on $S^Q$. Then $D_q = \bigcap_{Q \ge q} E_{q, Q}$ (proved via hypergeometric-to-multinomial uniform convergence), so a rational separator certifying $P_q(c) \cap E_{q, Q} = \emptyset$ at finite $Q$ for some $c < 0.5611$ proves $\pi < c$. Naive single-vertex constraint $\Pr[(1,1,1) \mid \text{edge}] = 0$ is already enforced by any bounded-order SDP; low-order $D_q$ constraints (small $q$) are similarly captured by bounded flag-algebra.

- **Multi-family near-extremal phenomenon.** Kostochka 1982 plus Brown, Fon-der-Flaass, and Frohmader constructed exponentially many non-isomorphic $K_4^{(3)}$-free 3-graph families with density approaching $5/9$, differing substantially in edit-distance from the cyclic template. Liu–Mubayi (Combinatorica 2022) proved the first hypergraph Turán family that provably lacks a classical stability theorem and explicitly noted $K_4^{(3)}$ exhibits this phenomenon assuming Turán's conjecture. Balogh–Clemen–Lidický (J. London Math. Soc. 2022) solved the codegree-squared $\ell_2$-norm variant via flag algebras + stability for that norm, but the classical $\ell_1$ density problem remains open.

- **Engineered pipeline tested at small scale on real data.** Flagmatic 1.5.1 + CSDP 6.2.0 reproduce the order-6 K_4^(3) bound $0.56166560$ with a 964-coordinate primal pseudo-moment over 6-vertex $K_4^{(3)}$-free type classes. Under sound (label-averaged) projection of unlabeled type densities to the rooted-labeled $q = 3$ column profile, the augmented SDP at $Q = 4$ with the verified rational separator added as a linear constraint returns the unchanged bound $0.56166560$ — no improvement. The pseudo-moment vector survives the $q = 3, Q = 4$ single-separator constraint under sound projection.

## What's Been Ruled Out

- **Polynomial / tensor-rank method (cap-set-style).** $[n]$ has no natural group structure for Croot–Lev–Pach; imposing $\mathbb{Z}/m\mathbb{Z}$ or $\mathbb{F}_q^d$ structure has not produced a $K_4^{(3)}$-free configuration exceeding $5/9$.

- **Random / greedy constructions.** Random 3-graph of density $p > 5/9$ contains $K_4^{(3)}$ a.s. for large $n$ (expected copies $\binom{n}{4} p^4 \to \infty$).

- **3-partite type constructions.** $1024 \to 45 \to 1$ exhaustion (above) caps blow-up density at $5/9$.

- **Bounded-order flag-algebra SDP.** Plateau $\approx 0.5611$ stable for $\sim 15$ years; marginal improvement $O(10^{-4})$ per added basis vertex.

- **Elementary local-counting / 5-vertex codegree-moment LP.** Stalls at $\approx 0.644$, far above plateau and $5/9$.

- **Classical stability-plus-cleanup.** Refuted by Liu–Mubayi 2022 + Kostochka multi-family: there is no unique near-extremal structure to recover; "every near-extremal $K_4^{(3)}$-free graph is close to the cyclic template" is false.

- **Codegree-kernel $B(x, y) = 2 - 3 d(x, y)$ with $B^2 \approx B/3$ spectral clustering.** Special case of classical stability; refuted by the multi-family phenomenon.

- **Bounded-order de Finetti separators alone, at small $q$ and $r$.** At $q = 3, r = 6$, sound-projection $Q = 4$: pseudo-moment is in $E_{3, 4}$. Naive single-vertex link-intersection constraint $N(a, b) \cap N(a, c) \cap N(b, c) = \emptyset$ for edges $abc$: already in bounded-order SDP. Higher-$q$ requires higher-order Flagmatic ($r \ge 7$ for $q = 4$, with reported wall-time 1.5–10 hours per run; $r \ge 8$ for $q = 5$, etc.).

## Numerical / Computational Evidence

- Plateau bound $\le 0.5617$ at $r = 7$, $\le 0.5615$ at $r = 8$, numerical floor $\approx 0.5611$ as $r$ further increases.
- Order-6 K_4^(3) Flagmatic + CSDP run reproduces $0.56166560$ with the 964-coordinate primal probability vector summing to $1.0$.
- Sound-projection $q = 3$ column profile of the order-6 plateau pseudo-moment is in $E_{3, 3}$ and feasible against the augmented-SDP $Q = 4$ separator constraint (LP and CSDP agree to solver tolerance $10^{-7}$).
- Independent partial-flag reproduction with smaller bases reaches $0.57227$ ($k \le 6$, $s \le 3$ types), $0.56881$ (rank-limited $s = 4, m = 5$), $0.5686926$ (lift to 7 vertices with $s = 1, m = 4$). Full $s = 3, m = 5$ flag spaces close to the plateau but do not push below.

## The Open Question

What concrete strategy, sub-lemma, or structural object is most likely to produce a rigorous upper bound $\pi(K_4^{(3)}) < 0.5611$ given the bounded-order flag-algebra plateau, the multi-family near-extremal phenomenon that defeats classical stability, and the saturation of single-$Q$ bounded-order de Finetti separators at small $(q, r)$?

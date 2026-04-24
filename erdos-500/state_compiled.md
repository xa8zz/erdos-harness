# Current state (compiled 2026-04-23)

## Established

- **[R01-3-part-template-exhaustion](erdos-500/researcher-01-3-part-template-exhaustion.md)** (2026-04-23): Exhaustive enumeration over all 1024 triple-templates on three labeled classes shows the cyclic template {001, 012, 022, 112} is (up to relabeling) the unique K_4^(3)-free blow-up with maximum edge density, attaining 5/9 at the balanced partition. Density polynomial f(x,y,z) = 6xyz + 3x^2 y + 3y^2 z + 3z^2 x on the simplex x+y+z=1, max 5/9 at x=y=z=1/3. Exact ex_3(n, K_4^(3)) at small n match the cyclic 3-partite construction: {3, 7, 14, 23, 36, 54} for n in {4..9}. A universal upper bound pi(K_4^(3)) <= 2/3 + o(1) is re-derived via codegree-squared sum and Jensen. 5-vertex codegree-moment LP stalls at ~0.644, well above 5/9. Author concedes pi(K_4^(3)) = 5/9 is not rigorously established at this round; the round's supporting evidence narrows the question rather than closing it.
- **[R02-independent-flag-lift](erdos-500/researcher-02-independent-flag-lift.md)** (2026-04-23): Independent flag-square upper-bound reproduction yields pi(K_4^(3)) <= 0.56869, weaker than the published 0.5617 and much weaker than the 0.5611 plateau. Enumerates non-isomorphic K_4^(3)-free 3-graphs: |F_4| = 4, |F_5| = 23, |F_6| = 964. Extends each 6-vertex representative to 7 vertices, producing 13,051,375 labeled 7-vertex extensions, with high-edge counts e=20 -> 70,827; e=21 -> 13,135; e=22 -> 1,349; e=23 -> 39. Flag certificate chain: 6-vertex flags with types up to s=3 gives U ~ 0.57227; adding rank-limited s=4, m=5 flags yields U ~ 0.56881; lifting to 7 vertices with exact one-labeled-vertex s=1, m=4 flags yields U ~ 0.5686926. Specific obstruction identified: the one-label 7-vertex flag is too weak; closing the gap to 0.5617 requires the full s=3, m=5 flag family (hundreds of flags per 3-label type).
  — prompt: [erdos-500/prompts/researcher-01-3-part-template-exhaustion.md](erdos-500/prompts/researcher-01-3-part-template-exhaustion.md)
- **[R03-codegree-kernel-stability](erdos-500/researcher-03-codegree-kernel-stability.md)** (2026-04-23): Proposes a structurally different proof paradigm: strong stability / inverse theorem for near-extremal K_4^(3)-free 3-graphs via the codegree kernel d(x,y) = |{z : xyz in E(H)}|/n. Stability target: every K_4^(3)-free 3-graph with |E(H)| >= (5/9 - delta)(n choose 3) admits a partition V = V_0 cup V_1 cup V_2 with |V_i| = (1/3 pm eps)n differing from the cyclic construction by o(n^3) triples. Key object: B(x,y) = 2 - 3 d(x,y) is conjecturally an approximate equivalence- relation kernel on 3 classes for near-extremal graphs, satisfying B^2 approx B/3; spectral clustering recovers the three parts, and the final density optimization 6xyz + 3x^2 y + 3y^2 z + 3z^2 x <= 5/9 on the simplex closes the upper bound. Formalization as a hypergraphon-rigidity theorem: for K_4^(3)-free 3-graphon W, int W d mu^3 <= 5/9 with equality only on the cyclic three-part construction up to measure-preserving relabeling. Explains the flag-algebra plateau as a local-vs-global information gap: bounded flags see only bounded-radius local statistics, while the cyclic construction is governed by global glue-consistency of pair- neighborhood labels into a Z/3-partition. This is orthogonal to R01/R02 and does not produce a new rigorous bound at this round.
  — prompt: [erdos-500/prompts/researcher-03-contrarian-beyond-flag-algebra.md](erdos-500/prompts/researcher-03-contrarian-beyond-flag-algebra.md)

## Ruled Out

_none yet_

## Indices

### By type
- research: 3

### By strategy dependence
- —: 3


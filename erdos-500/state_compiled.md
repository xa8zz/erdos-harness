# Current state (compiled 2026-04-23)

## Established

- **[R01-3-part-template-exhaustion](erdos-500/researcher-01-3-part-template-exhaustion.md)** (2026-04-23): Exhaustive enumeration over all 1024 triple-templates on three labeled classes shows the cyclic template {001, 012, 022, 112} is (up to relabeling) the unique K_4^(3)-free blow-up with maximum edge density, attaining 5/9 at the balanced partition. Density polynomial f(x,y,z) = 6xyz + 3x^2 y + 3y^2 z + 3z^2 x on the simplex x+y+z=1, max 5/9 at x=y=z=1/3. Exact ex_3(n, K_4^(3)) at small n match the cyclic 3-partite construction: {3, 7, 14, 23, 36, 54} for n in {4..9}. A universal upper bound pi(K_4^(3)) <= 2/3 + o(1) is re-derived via codegree-squared sum and Jensen. 5-vertex codegree-moment LP stalls at ~0.644, well above 5/9. Author concedes pi(K_4^(3)) = 5/9 is not rigorously established at this round; the round's supporting evidence narrows the question rather than closing it.
- **[R02-independent-flag-lift](erdos-500/researcher-02-independent-flag-lift.md)** (2026-04-23): Independent flag-square upper-bound reproduction yields pi(K_4^(3)) <= 0.56869, weaker than the published 0.5617 and much weaker than the 0.5611 plateau. Enumerates non-isomorphic K_4^(3)-free 3-graphs: |F_4| = 4, |F_5| = 23, |F_6| = 964. Extends each 6-vertex representative to 7 vertices, producing 13,051,375 labeled 7-vertex extensions, with high-edge counts e=20 -> 70,827; e=21 -> 13,135; e=22 -> 1,349; e=23 -> 39. Flag certificate chain: 6-vertex flags with types up to s=3 gives U ~ 0.57227; adding rank-limited s=4, m=5 flags yields U ~ 0.56881; lifting to 7 vertices with exact one-labeled-vertex s=1, m=4 flags yields U ~ 0.5686926. Specific obstruction identified: the one-label 7-vertex flag is too weak; closing the gap to 0.5617 requires the full s=3, m=5 flag family (hundreds of flags per 3-label type).
  — prompt: [erdos-500/prompts/researcher-01-3-part-template-exhaustion.md](erdos-500/prompts/researcher-01-3-part-template-exhaustion.md)

## Ruled Out

_none yet_

## Indices

### By type
- research: 2

### By strategy dependence
- —: 2


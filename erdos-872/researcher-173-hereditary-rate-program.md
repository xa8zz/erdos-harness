---
id: R173-hereditary-rate-program
type: research
date: 2026-07-23
intent: >
  Assemble a proof program for L(n) = O(n (loglog n)^C / log n) from the
  structural economics of R172, reducing the open dichotomy to five explicitly
  labeled holes, two of which rest on already-proven components.
predecessors: [R172-exact-corrections-knife-edge-structure]
action:
  kind: extends
  target: R172-exact-corrections-knife-edge-structure
claim: >
  A five-gear proof architecture for the sublinear side, with hole ledger.
  G1 (bounded-quotient reduction): total length is controlled by mass reaching
  hereditarily thin status (live sets closed under live-comparability with
  degree <= 2) plus an O(n/log n) natural floor plus sub-linear battle
  prefixes. G2 (admission mechanism): fortress admissions occur only through
  divisor-side kills — a move admits new hereditarily-thin mass only via the
  prepared near-thin cones of the weapons it kills as divisors; cone-side kills
  cannot admit (they kill the candidates). G3 (depth privatization): if one
  move advances preparations in two cones with quotients <= H, their gcd g has
  quotient n/g <= H^2, so both preparations cohabit one H^2-bounded quotient;
  hence deep preparation lineages are one-advance-per-move and, GIVEN a
  child-production bound, subcritical by the established private-chain lemma
  (N_{j+1} <= (N_j+1)/2). G4 (arithmetic-privacy cap): admissions whose
  protection derives from pre-existing pairwise-coprime prime support rather
  than assembled preparation are globally capped at O(pi(n) + sqrt(n)) by the
  established pairwise-coprime gadget bound. G5 (rate closure): with a
  policing-capable Shortener (playing inside 2-thin clusters removes >= 3
  protected elements per move versus assembly <= 2 per move), the fixed point
  L = floor + assembled stock + exceptions closes to L = O(n polyloglog/log n).
  One-shot severing is provably the wrong notion: the move 3p for a prime p in
  (n/6, n/3] kills exactly two elements yet severs unboundedly many near-thin
  multiples of 3 — protection must be hereditary, and the supercharge's
  preparation cost recurses (a ripe cone is by definition a high-degree live
  weapon; max-degree play is its detector). Holes: [H2] the child-production
  bound for preparation lineages (hardest; its failure would indicate a
  child-branching preparation architecture and flip the program to
  constructing a linear lower bound); [H4] the policing-margin optimization
  against adversarial trade ratios; [H3] injective, prefix-measurable
  consumption for the privacy cap; [H1] the clean statement of the
  bounded-quotient reduction; [H5] a collapse-witness pass over the assembled
  charge system. Empirical support: peak hereditary thin-live mass scales at
  ~1.7 x n/ln n (flat ratio across 1e5..3e6) under the strongest fielded
  Prolonger; severed-per-kill collateral decays like (log n)^{-1.1}.
implications:
  - The dichotomy is reduced to the child-production structure of deep
    preparation lineages: bounded child production yields o(n) via the
    established private-chain lemma; unbounded child production would pinpoint
    the linear-side construction.
  - Two of five gears rest on already-established results (private-chain
    lemma; pairwise-coprime gadget cap), one on standard sieve theory
    (fundamental lemma), narrowing new-proof surface to G3's lineage
    formalization and G5's optimization.
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/fable/DRAFT-master-theorem.md
---

# The hereditary rate program

Full statement with gear-by-gear proof sketches and the hole ledger:
`fable/DRAFT-master-theorem.md`. Working derivations: `fable-worklog-R172.md`
F9-F13 (the fixed-point architecture, its two self-caught refutations en route,
severing attribution data, and the hereditary fortress probe).

The program's decision structure: prove [H2] (child-production bound) and the
remaining holes close around established components, giving
L(n) = Theta-tilde(n/log n) and resolving the problem on the sublinear side
near-sharply. Refute [H2] — exhibit a preparation architecture in which one
advanced lineage spawns two or more independent children at bounded quotient
scales, robust to policing — and that architecture is the explicit candidate
for a linear lower bound, flipping the program to the disproof side with a
concrete construction target.

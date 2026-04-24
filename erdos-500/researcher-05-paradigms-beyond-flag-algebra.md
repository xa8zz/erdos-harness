---
id: R05-paradigms-beyond-flag-algebra
type: research
date: 2026-04-23
intent: >
  Parallel Channel C contrarian dispatch to a different model family
  than R03. Asks for machinery fundamentally different from bounded-type
  flag-algebra SDP to determine π(K_4^(3)).
predecessors: []
action:
  kind: orthogonal
  target: R03-codegree-kernel-stability
claim: >
  Diagnoses the flag-algebra SDP plateau at ~0.5611 as a Sum-of-Squares
  barrier: the SDP converges on pseudo-hypergraphons that satisfy local
  K_4^(3)-free constraints but cannot be glued into a globally valid
  infinite measure space. Proposes four fundamentally different machineries
  that bypass this SOS barrier by enforcing infinite-order global
  realizability: (1) continuous variational calculus on hypergraphons via
  Euler-Lagrange equations and Steiner-like symmetrization flows toward
  the cyclic 3-partite step-function; (2) information geometry / entropy
  polymatroids using generalizations of Shearer's Lemma and non-Shannon
  (Ingleton) inequalities to police global joint-distribution realizability;
  (3) topological combinatorics via Stanley-Reisner rings, Kalai's
  algebraic shifting, and simplicial-cohomology treatment of K_4^(3) as
  boundary of the 3-simplex (homeomorphic to S^2) capturing the Z_3
  cyclic-orientation invariant that uncolored subgraph counts miss;
  (4) rational Positivstellensatz extending the polynomial-SOS flag
  hierarchy with conditional-density denominators, granting infinite-degree
  Taylor flexibility to approximate sharp discontinuous step-functions.
  Does not produce a new rigorous bound at this round.
prompt: erdos-500/prompts/researcher-03-contrarian-beyond-flag-algebra.md
---

"Determination of $\pi(K_4^{(3)})$$\pi(K_4^{(3)}) = \frac{5}{9}$Reasoning:All established evidence—from the exact integer programming matches for small $n$ (up to $n=9$), to the limiting density of the cyclic 3-partite construction—points decisively to Turán's (3,4)-conjecture being true. Algorithmic elimination of thousands of other combinatorial templates and the failure of tensor-rank/random constructions strongly imply that no denser configuration exists.The fact that bounded-order flag-algebra SDPs plateau at $\approx 0.5611$ is widely understood not as evidence of a denser hypergraph, but as an artifact of the Sum-of-Squares (SOS) barrier. Standard flag algebras operate as a finite-degree polynomial Positivstellensatz hierarchy. When this hierarchy stalls strictly above the conjectured bound, it typically means the SDP has converged on a "pseudo-hypergraphon"—a fractional probabilistic limit that satisfies all $K_4^{(3)}$-free constraints locally, but mathematically cannot be glued together into a globally valid, infinite joint measure space.Fundamentally Different Machineries to Determine $\pi(K_4^{(3)})$If bounded-type-order flag algebras fundamentally stall due to local pseudo-limits, proving the $5/9$ bound requires abandoning finite polynomial subgraph counting and pivoting to frameworks that inherently enforce infinite-order global realizability. Below are fundamentally different structural and analytic machineries capable of bridging the gap:1. Continuous Variational Calculus on HypergraphonsRather than evaluating dual bounds via discrete subgraph polynomials, the problem can be transposed into the primal, infinite-dimensional space of hypergraph limits (hypergraphons / Elek-Szegedy limits). We seek to maximize an integral density over a space of symmetric measurable functions $W: [0,1]^3 \to [0,1]$ subject to the strict zero-integral constraint for $K_4^{(3)}$.The Mechanism: By utilizing functional derivatives (Euler-Lagrange equations) and developing continuous symmetrization flows (analogous to continuous Steiner symmetrization in geometry), one could analytically "smooth" any $K_4^{(3)}$-free hypergraphon toward the cyclic 3-partite step-function without decreasing its edge density. This shifts the proof from discrete algebraic combinatorics to infinite-dimensional real analysis, natively ignoring finite fractional SDP mirages.2. Information Geometry and Entropy PolymatroidsThe core reason local moment matrices fail is their inability to rigorously guarantee that sub-configurations can form a globally valid joint probability distribution. Information theory inherently polices this.The Mechanism: By treating the incidence of hyperedges as discrete random variables, one can bound the overall density using the entropy vectors of sampled vertex neighborhoods. Utilizing subadditivity, generalizations of Shearer’s Lemma, and deeper non-Shannon polymatroid inequalities (such as the Ingleton inequality), we can place strict bounds on hyperedge volume. Entropy metrics track infinite-order dependencies logarithmically rather than relying on finite inclusion-exclusion, mathematically forbidding the pseudo-limits that fool standard SDPs.3. Topological Combinatorics and Simplicial CohomologyGeometrically, a $K_4^{(3)}$ is equivalent to the boundary of a 3-simplex (a hollow tetrahedron, homeomorphic to a 2-sphere $S^2$). Thus, the $K_4^{(3)}$-free condition mandates that the 2-dimensional simplicial complex generated by the hypergraph contains no induced $S^2$ voids.The Mechanism: The optimal $5/9$ construction relies heavily on a global $\mathbb{Z}_3$ cyclic orientation that standard uncolored subgraph counts blindly project away. By evaluating the complex through simplicial cohomology, Stanley-Reisner rings, or Kalai’s Algebraic Shifting, the topological constraint of "no isolated voids" translates into tight algebraic limits on the Betti numbers and face vectors. This topological invariant approach can natively capture the global cyclic structural "twist" that flat moment matrices miss.4. Rational Positivstellensatz (Conditional Limits)Standard flag algebras represent a strictly polynomial Sum-of-Squares hierarchy. However, Emil Artin’s solution to Hilbert’s 17th problem dictates that some strictly positive functions are not SOS of polynomials, but are instead SOS of rational functions.The Mechanism: We can extend the flag algebra system by introducing denominators—evaluating the distribution of subgraphs conditional on the positive density of other specific substructures. This moves the bounding logic to a Rational Positivstellensatz. Because a rational fraction unfolds into an infinite-degree Taylor series, this grants the mathematical flexibility necessary to tightly approximate the sharp, discontinuous step-function of the $5/9$ limit space without needing to push the baseline flag order to infinity."

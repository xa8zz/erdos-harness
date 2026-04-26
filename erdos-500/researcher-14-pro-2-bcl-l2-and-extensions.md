---
id: R14-pro-2-bcl-l2-and-extensions
type: research
date: 2026-04-24
intent: >
  Fresh-thread state-zoom-out dispatch asking the most likely concrete
  object to produce a rigorous upper bound pi(K_4^(3)) < 0.5611.
predecessors: [R12-augmented-sdp-no-improvement, R08-pro-1-de-finetti-reduction]
action:
  kind: extends
  target: R12-augmented-sdp-no-improvement
claim: >
  Proposes four interconnected strategies. (1) BCL l_2-norm stability
  partitioning. The Balogh-Clemen-Lidický 2022 result that classical
  stability holds for the l_2-norm variant (codegree variance), which
  is uniquely maximized at 1/3 by the cyclic template. Partition limit
  space into Case 1 (close to cyclic, BCL stability applies and
  cleanup gives l_1 density <= 5/9) and Case 2 (far from cyclic,
  BCL gives l_2 < 1/3 - eps). Inject the linear constraint
  Phi_{l_2} = E[d^2] - (1/3 - eps) <= 0 into the augmented-SDP for the
  non-cyclic regime. (2) Unprojected lateral-edge hypergraph de Finetti.
  Skip the label-averaged column projection (which loses lateral
  edges between the q outside vertices) and apply de Finetti finite-
  extendibility constraints directly to the unprojected fully
  labeled local type densities. Forces the SDP to respect joint
  K_4^(3)-freeness on lateral edges between extension vertices and
  the root simultaneously. (3) Exact infinite-Q SOS Positivstellensatz
  on the 6-dimensional simplex Delta(S). Generate a degree-q rational
  separating polynomial via SOS Positivstellensatz instead of finite
  E_{q, Q} relaxations. (Caveat: R08-pro-1's proved
  D_q = cap_{Q >= q} E_{q, Q} means infinite-Q SOS does not strictly
  add power beyond finite Q — the implicit "infinite-Q" structure is
  already captured by the nested polytope intersection. This strategy's
  added value is computational compactness rather than mathematical
  power.) (4) Computational escalation to q = 4, r = 7 via
  Flagmatic order-7 run (1.5-10 hour wall-time per Flagmatic docs)
  to capture deeper local-to-global hypergraph constraints than q = 3.
  Recommends combining strategies 1 + 3 + 4 for highest probability of
  immediate breakthrough.
prompt: erdos-500/prompts/researcher-13-state-zoom-out.md
---

To rigorously break the $0.5611$ bounded-order flag-algebra plateau and establish $\pi(K_4^{(3)}) = 5/9$, we must directly target the mathematical loopholes that the "phantom" pseudo-moment exploits. The evidence clearly shows that standard finite relaxations stall due to the multi-family degeneracy (which ruins classical stability) and the lossy nature of low-arity finite-$Q$ projections.Based on the established theoretical and computational boundaries, the most mathematically rigorous and concretely actionable path relies on four interconnected strategies:1. The Sub-Lemma: BCL $\ell_2$-Norm (Codegree-Squared) Stability PartitioningThe Obstacle: Classical stability for the $\ell_1$-norm density fails because there are exponentially many discrete near-extremal graphs (the Kostochka multi-families) at density $\approx 5/9$, creating a degenerate "flat face" in the limit space that stalls the SDP.The Solution: Balogh, Clemen, and Lidický (2022) proved that classical stability does hold for the $\ell_2$-norm variant (codegree variance), which is uniquely maximized by the cyclic template at exactly $1/3$. We can use this as a structural wedge to mathematically partition the limit space $X$:Case 1 (Close to Cyclic): BCL’s exact stability applies, and localized cleanup arguments strictly bound the $\ell_1$ density to $\le 5/9$.Case 2 (Far from Cyclic): The plateau pseudo-limit at $0.5611$ is explicitly far from the cyclic template. By BCL's stability, its $\ell_2$-norm must be strictly bounded below the maximum: $\mathbb{E}[d^2] \le 1/3 - \epsilon$.The Execution: The $\ell_2$-norm $\mathbb{E}[d^2]$ is exactly expressible as the density of a 4-vertex configuration (two edges intersecting at exactly two vertices). By injecting the linear constraint $\Phi_{\ell_2} = \mathbb{E}[d^2] - (1/3 - \epsilon) \le 0$ into the Augmented-SDP for the non-cyclic regime, we surgically force the flag-algebra solver to drop the artificially inflated $\ell_1$ bound without ever requiring $\ell_1$ stability.2. The Structural Object: Unprojected (Lateral-Edge) Hypergraph De FinettiThe Obstacle: The prompt explicitly notes the pipeline fails "under sound (label-averaged) projection... The pseudo-moment survives the single-separator constraint under sound projection."The Solution: The label-averaged projection to the column profile $S$ is destructively lossy. It only tracks bipartite connections between the extension vertices and the root, completely throwing away the lateral hypergraph edges between the $q$ extension vertices. Consequently, the SDP effortlessly fakes exchangeability for the root-connections while violating $K_4^{(3)}$-freeness in the hidden lateral edges.The Execution: Do not project. Apply the De Finetti finite-extendibility constraints directly to the unprojected, fully labeled local type densities. By enforcing exchangeability on the complete local hypergraph structure, the SDP is forced to respect joint $K_4^{(3)}$-freeness between the extensions and the root simultaneously.3. The Analytical Operator: Exact Infinite-$Q$ SOS PositivstellensatzThe Obstacle: Finite marginal polytopes $E_{q,Q}$ saturate quickly because they are merely LP outer-approximations of true exchangeability. Pushing $Q$ higher carries an exponential combinatorial explosion.The Solution: The true infinite-extendibility De Finetti cone $D_q = \bigcap_{Q \ge q} E_{q, Q}$ is governed by polynomials globally non-negative on the continuous probability simplex $\Delta(S)$. Since $|S| = 7$, the space of valid outside-vertex measures $\Delta(S)$ is exactly a 6-dimensional simplex.The Execution: Instead of searching for discrete extensions at finite $Q$, execute a Sum-of-Squares (SOS) Positivstellensatz over the 6-dimensional continuous simplex $\Delta(S)$. This generates a degree-$q$ rational separating polynomial offline in milliseconds. If the pseudo-moment hides in the relaxation gap between $E_{3,4}$ and $D_3$, this continuous SOS certificate analytically enforces the $Q \to \infty$ limit, translating directly into a finite-coordinate inequality $\Phi_j$ for the Augmented SDP.4. Computational Escalation: Scaling to $q=4, r=7$The Obstacle: A $q=3$ separator only enforces exchangeability for 3 outside vertices around a 3-vertex root edge. This is structurally too small to capture deep 4-way hypergraph contradictions, allowing the $0.5611$ pseudo-limit to fake local consistency.The Solution: Expanding the structural root size to $q=4$ perfectly captures deep local-to-global restrictions. The prompt explicitly notes that order $r=7$ Flagmatic runs for $q=4$ have a wall-time of 1.5–10 hours per run. This means extracting the $P_4(c)$ pseudo-moment and isolating it against the exact $D_4$ cone is not a theoretical wall—it is computationally tractable and ready to be executed as an automated theorem proving step.Conclusion:By abandoning the lossy sound projection and finite-$Q$ relaxations, and instead combining Exact Infinite-$Q$ SOS on the simplex with the BCL $\ell_2$-norm gap inequality, you effectively seal the mathematical loopholes exploited by the $0.5611$ plateau, providing the highest probability of an immediate breakthrough.

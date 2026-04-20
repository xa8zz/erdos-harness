Produce a definitive rigorous proof or a rigorous refutation of the specific missing lemma you named in your prior concession. Do not return with another concession that restates the same gap in different notation.

**Correction to the $\sigma^\star$ smallest-legal-prime lemma.** It holds only in states where every legal composite has at least one legal prime factor. In general it is false: explicit sandbox-verified counterexample at $n = 10^6$, $h = 4$ with Prolonger plays $\{30 \cdot 7, 30 \cdot 13, 30 \cdot 19, 30 \cdot 29, 30 \cdot 37, 30 \cdot 43, 30 \cdot 53\}$ and standard Shortener responses $\{11, 17, 23, 31, 41, 47, 59\}$: the composite $91 = 7 \cdot 13$ is legal (since $7 \mid 210$ and $13 \mid 390$ divide different played elements, and $91 \nmid 210$, $91 \nmid 390$, $210 \nmid 91$, $390 \nmid 91$), and $\deg(91) = 0.00130261 > \deg(67) = 0.00123127$ where $67$ is the smallest legal prime. Hence $\sigma^\star$ claims $91$. Any $\sigma^\star$ dynamic argument must handle legal composites of individually-illegal primes, not just primes.

**Convergence observation.** The three concessions (LRQC, Legal Activator-Quotient Incidence Budget, Cross-Activator Composite Quotient Budget) are instances of the same meta-pattern: a Carleson-style incidence inequality between exceptional harmonic mass and legal $\sigma^\star$-claim capacity $\sum \mu(u_t) \le N_h$. Your named lemma is one specific form of this pattern.

**Your task.** Return with one of:

1. **A rigorous proof** of your named lemma. Must handle: (i) burst-star multiplicity — one activator first-hitting many shields sharing a coface; (ii) sparse matching-star residues — clusters with $\sigma_i^3 \gg \theta^{-1} B_i$ and defect-three density $o(\theta)$; (iii) cross-activator legal composites — Shortener's $\sigma^\star$ may claim composites like $91$ above, not just the smallest legal prime.

2. **A rigorous refutation** via explicit game-legal Prolonger play under $\sigma^\star$. Each Shortener move must be verified as legal: no prime divisor of a previously-played element, but legal composites of individually-illegal primes are allowed and must be correctly handled. Verify all mass and degree computations in Python sandbox.

3. **A strictly sharper named inequality** that reduces your stated lemma to a more specific, provably decidable statement. Give it as a concrete inequality (not a research direction), and show why the looser form cannot bypass it.

Do not stop until you have a definitive answer — a proof, a refutation, or a strictly sharper named reduction. A repeated concession pointing to the same ingredient is not useful at this stage.

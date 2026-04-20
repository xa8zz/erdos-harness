**Your prior return established the Spectral Live-Space Separator Theorem via expander-mixing on the Johnson-scheme disjointness graph: when $|A|/|\mathcal Q| \cdot |R|/|\mathcal Y| \ge 4\eta_q^2$ with $\eta_q = \sqrt{qL/(h(K-q))}$, a legal $q$-separator exists removing $\ge (1/2)\delta_q |R|$ of live residual. The remaining gap was named as a multi-level Johnson-scheme spectral stopping theorem — a rigorous handling of the stopping regime $\forall q: a_q r < 4\eta_q^2$ where no single-level spectral separator exists.**

Prove the multi-level Johnson-scheme spectral stopping theorem and use it to close $L(n) \le O(r_1(n))$, or prove that the stopping regime can be entered by a game-legal Prolonger strategy and use that construction to refute the conjectured sharp rate. Do not stop at a partial result.

**Statement of the target stopping theorem.** When the single-level spectral condition fails uniformly — $\forall q: |A_q|/|\mathcal Q_q| \cdot |R|/|\mathcal Y| < 4\eta_q^2$ — show that one of:

(i) The live space $R$ has a structured low-rank certificate in the Johnson scheme (Boolean junta, low-degree polynomial, or small sunflower kernel) whose mass can be charged to Prolonger's accumulated move count.

(ii) The legal $q$-candidate space $A_q$ has been reduced by prior Shortener moves such that total Shortener move count is already $\ge r_1$-scale, matching the target upper bound.

(iii) A higher-degree or higher-level spectral expansion (e.g., level-$k$ Johnson scheme expansion, Kikuchi graph, hypergraph containers, small-set expansion on the down-closure) provides a legal $q'$-separator at a different scale $q'$ with usable capture.

**Tools to use.** Johnson scheme spectral decomposition (harmonic analysis on the Boolean slice), hypergraph containers (Balogh-Morris-Samotij / Saxton-Thomason), expander-mixing inequality at higher levels, small-set expansion in the Grassmann and Johnson graphs, spectral sparsifiers, p-biased slices for Sathe-Selberg weighting. The prior partial result proved the expander-mixing base case; you need to handle the stopping regime using higher-order tools.

**Integration step.** Combine single-level (already proved) + multi-level stopping theorem + game-legal online implementation into an explicit Shortener strategy that runs across central ranks $h \sim \log\log n$ and sums to $O(r_1(n))$ total moves.

Return with one of:

1. **A rigorous proof** closing $L(n) \le O(n(\log\log n)^2/\log n)$. Each step — single-level spectral, multi-level stopping, integration, game-legal Shortener strategy — must be explicit. Sandbox-verify small cases.

2. **A rigorous refutation** of the multi-level spectral stopping theorem via explicit Prolonger strategy that enters the stopping regime and remains there. This must be a game-legal Prolonger construction forcing $L(n) \ge c n/\log\log\log n$, and it would settle the sharp rate downward — refuting the conjectured $r_1$ and establishing $L(n) = \Theta(r_2)$.

3. **A named, strictly sharper sub-theorem** that reduces the stopping theorem to a specific decidable Johnson-scheme question (e.g., "if the Boolean-slice spectral condition fails, the residual has a junta decomposition bounded by..."). Name the sub-theorem precisely, prove it or refute it, continue to closure or refutation.

**Hard constraint.** The prior approach produced a useful base case but the full closure is not proved. Prior dispatches in this research have produced four rounds of refinement-refutation cycles (WLST → AWLST → CPD → trichotomy/2WCPD → spectral). Do not produce another instance of that pattern. If the multi-level stopping theorem is refuted, immediately construct the Prolonger lower bound and settle the rate question downward. The binary close here is:
- $L(n) \le O(r_1(n))$ proved (via spectral framework), or
- $L(n) \ge c n/\log\log\log n$ proved (via game-legal Prolonger construction), or
- A rigorous structural barrier showing Johnson-scheme spectral methods cannot close $r_1$ either, naming the next foundational tool absent from all known methods.

**Game-legality reminders (absolute, non-negotiable):**
- Once Prolonger plays $F$, no prime $p \mid F$ is a legal Shortener claim.
- Legal composites of individually-illegal primes exist and must be handled.
- $\sigma^\star$ smallest-legal-prime lemma requires a correctness hypothesis.
- Two-sided antichain legality: $Q \nsubseteq D$ AND $D \nsubseteq Q$ for all prior $D$.
- Verify constructions in Python sandbox. Spectral claims should be verified against explicit SVD at small $h, q, K$.

**Verification.** The prior spectral partial result was sandbox-verified for the Johnson-scheme singular values. The multi-level extension must similarly have explicit numerical verification at small cases. Any proposed Prolonger lower-bound construction must be sandbox-verified to remain game-legal under $\sigma^\star$ responses including cross-composite claims.

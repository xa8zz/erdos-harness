**Your prior return established the Two-Sided Weighted CPD (2WCPD) as the correct replacement for CPD, and identified Weighted Shortener Self-Shadow Sparsity (WSSS) as the missing additional invariant needed to close $L(n) \le O(r_1(n))$. The previous dispatch asked for a proof or sharper replacement. The chain of refinements WLST → AWLST → CPD → 2WCPD has not yet produced a closing upper bound; each has led to another structural refinement. Your task now is to either close the chain or definitively end it.**

Prove or refute WSSS directly. Specifically: does there exist a concrete Shortener strategy, game-legal throughout, that maintains the WSSS bound
$$\nu_{q,\eta}\!\left(\bigcup_{D \in \mathcal D_t} \{Q : Q \subseteq D \text{ or } D \subseteq Q\}\right) \le 1 - \rho$$
for a quantitative $\rho > 0$, uniformly across central ranks $h \sim \log\log n$ under Sathe-Selberg weighted measure, and with online-amortization summing to $O(r_1(n))$ total Shortener moves?

Return with one of:

1. **A rigorous proof of WSSS** plus the Shortener strategy implementing it, plus the combined proof with 2WCPD that yields $L(n) \le O(r_1(n))$. Handle cross-composite legality explicitly. Handle Sathe-Selberg weighting (prior work proved uniform constants degrade by $\exp(\Omega(\ell))$ under Euler-factor weighting — address this directly).

2. **A rigorous refutation of WSSS.** Construct a game-legal state where any Shortener strategy violates WSSS (accumulates $\nu_{q,\eta}$-mass above $1 - \rho$ for every $\rho > 0$) while the live packet remains above the $r_1$-scale residual threshold. Then name the next strictly sharper theorem needed and begin proving it. Do not stop at the refutation.

3. **A rigorous negative structural theorem** — prove that no Shortener strategy can simultaneously satisfy WSSS and avoid the sparse-covering-design obstruction identified in prior rounds. This would settle that 2WCPD + WSSS is fundamentally insufficient and the paradigm is exhausted.

4. **A rigorous lower-bound construction** — explicit Prolonger strategy that forces $L(n) \ge c n/\log\log\log n$ by game-legal moves that cause unavoidable Shortener self-shadow saturation, refuting the conjectured rate $r_1$ and establishing that the true sharp rate is $r_2$.

**Hard constraint.** Do not return with another "2WCPD doesn't cover $X$, here's sharper $Y$, didn't prove $Y$." Prove $Y$. If $Y$ is refuted, prove $Z$. Recurse until you have either (a) a full closure at $r_1$, (b) a rigorous Prolonger lower bound forcing $r_2$, or (c) a rigorous structural impossibility theorem naming a specific foundational tool absent from current methods. The pattern "refinement refuted, here's next refinement" has run for four rounds without yielding a closing upper bound; do not produce another instance of that pattern. If the chain is genuinely exhausted, say so structurally, with a theorem.

**Game-legality reminders (absolute, non-negotiable):**
- Once Prolonger plays $F$, no prime $p \mid F$ is a legal Shortener claim.
- Legal composites of individually-illegal primes exist (e.g., $91 = 7 \cdot 13$ legal when $7 \mid F_1, 13 \mid F_2$ distinct played) and must be handled.
- $\sigma^\star$ smallest-legal-prime lemma requires "every legal composite has a legal prime factor" hypothesis; it fails in general.
- Two-sided antichain legality: $Q \nsubseteq D$ AND $D \nsubseteq Q$ for all prior $D \in \mathcal D$.
- Verify constructions in Python sandbox.

**Verification requirement.** Any claimed Shortener strategy must be verified to produce legal moves at every turn against arbitrary Prolonger play, via explicit small-case sandbox run. Any claimed Prolonger lower bound must similarly be sandbox-verified with explicit $\sigma^\star$ responses.

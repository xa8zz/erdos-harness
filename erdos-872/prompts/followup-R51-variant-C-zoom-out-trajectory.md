**Angle: zoom out on the refinement trajectory itself.** The sequence of attempted theorems has been WLST → AWLST (Case A + Case B) → CPD, each proposed, refuted in the adversarial setting, and replaced by a sharper statement. Each theorem is strictly sharper than the last, each has been rigorously refuted by the same class of adversarial constructions (sparse covering-design saturation), and each time a cleaner replacement has emerged. Is this convergent research progress or a signature of paradigm exhaustion hiding inside nominally different theorems? Diagnose the trajectory. If the pattern is productive, push CPD to closure. If the pattern indicates exhaustion, propose a structurally different approach and prove something concrete under the new approach.

**Converged state (the trajectory to analyze).**

- **WLST** (original single-outcome separator): refuted by forbidden-core star / parity-cube / relative cone. Atomic-capture obstruction.
- **AWLST** (Case A / Case B, two-outcome): Case A proved (Bernoulli Legal-Separator Lemma). Case B (weighted shadow $|\mathcal R_\text{live}|_\pi \le \kappa |\mathcal C|_\pi$) refuted by sparse covering-design in KK, entropy, and LP methods independently.
- **CPD (Covering-Profile Dichotomy)**: for each $q$, either Case A_q (legal $|Q| \le q$ with capture $\ge \delta_q$) or Case B_q ($|\mathcal C| \ge 1/\delta_q$). Rigorously proved in apex-singleton model.

Each of these three theorems is parameterized differently (single outcome → two-outcome → covering-profile-indexed), but all share the structural form: "express a quantity in terms of Prolonger's played complement family $\mathcal C$, assuming Shortener plays optimally under some legality-respecting rule."

**Zoom-out questions (answer each rigorously):**

1. **Is the refinement trajectory productive or stagnant?** Argue one of: (i) the sequence of theorems is strictly sharpening, converging on a provable statement — characterize the limit theorem and prove it; (ii) the sequence is re-parameterizing the same structural failure — identify the deep unfixable component and name what different paradigm must handle it; (iii) the sequence has converged to CPD as the correct statement, but extending CPD (to general $\mathcal D$, weighted, online) is strictly hard and requires specific named tools beyond the blocker-duality / transversal framework.

2. **Diagnose the commonality across all three refutations.** WLST, AWLST Case B, and even some potential CPD extensions have been refuted by *sparse covering-design* constructions. What is the unifying structural feature of these constructions that makes them systematically evade the blocker-duality paradigm? Is there a single invariant that characterizes covering-design saturation? Name it rigorously.

3. **Is the blocker-duality paradigm fundamentally obstructed by covering-design phenomena?** If yes, prove that no blocker-duality-based upper bound can close $r_1$ in the presence of covering-design obstructions at central rank. If no, show why CPD or a slight extension handles all covering-design obstructions and complete the closure.

4. **What alternative paradigm is structurally different?** Specifically name tools NOT used in blocker duality or state inequalities: candidates include information-theoretic stochastic domination, geometric fractional-rank methods in the divisor lattice, potential games + Nash equilibrium characterization, spectral methods on the antichain hypergraph. Choose one alternative, argue why it bypasses the covering-design obstruction, and prove a rigorous partial result under the new paradigm.

5. **If CPD is the correct converged theorem and just needs straightforward extensions:** push through to closure. Prove general-$\mathcal D$ CPD, Sathe-Selberg weighting, online amortization, integration. Return with $L(n) \le O(r_1)$ or a rigorous Prolonger lower bound.

**Strict non-stopping rule.** Return only with one of:

- A closure: $L(n) \le O(r_1)$ or a rigorous lower-bound improvement that settles the sharp rate downward.
- A rigorous structural theorem: the covering-profile / blocker-duality paradigm is fundamentally obstructed by a specific named invariant (e.g., "the sparse-covering-design transversal number itself must be charged, not $|\mathcal C|$"), and a new paradigm is identified with at least one rigorous partial result.
- Extended CPD with all regimes covered, even if the integration to $r_1$ is conditional on a specific named open sub-lemma.

Do not return with "CPD seems to not cover $X$" as a concession. Name $X$, propose the replacement, prove it or refute it, iterate.

**Game-legality reminders (absolute, non-negotiable):**
- Once Prolonger plays $F$, no prime $p \mid F$ is a legal Shortener claim.
- Legal composites of individually-illegal primes exist and must be handled.
- $\sigma^\star$ claims the smallest legal prime only when every legal composite has a legal prime factor.
- Verify constructions in Python sandbox.

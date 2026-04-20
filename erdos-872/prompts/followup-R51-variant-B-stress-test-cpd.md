**Angle: aggressively stress-test the covering-profile dichotomy (CPD) by trying to break it, then push through to closure.** Your job is to treat CPD adversarially: construct Prolonger strategies and weight configurations that attempt to defeat CPD in multi-apex, nested, weighted, and dynamic regimes. If CPD survives, use that verified strength to push through to an upper bound. If CPD breaks in any regime, immediately name the sharper replacement theorem and continue — do not stop on the refutation. Return only with a closure (positive upper bound at $r_1$), a chain of structural theorems culminating in a lower-bound-matching refutation of the conjectured rate, or a rigorously-named foundational obstruction.

**Converged state.**

- **WLST** (original single-outcome separator theorem) refuted by forbidden-core star / parity-cube / relative cone constructions. Atomic-capture under prior Shortener blocker.
- **AWLST two-outcome** (Case A / Case B) proposed, Case A proved (Bernoulli Legal-Separator Lemma), Case B (weighted shadow $|\mathcal R_\text{live}|_\pi \le \kappa |\mathcal C|_\pi$) refuted via sparse covering-design obstructions across all three methods (KK, entropy, LP).
- **CPD (Covering-Profile Dichotomy)** replaces Case B. For each $q$:
  - *Case A_q:* legal relative blocker $Q$ with $|Q| \le q$ and capture $\ge \delta_q := \binom{N-q}{\ell}/\binom{N}{\ell}$
  - *Case B_q:* $|\mathcal C| \ge 1/\delta_q$
  - Exactly one holds.
  - Rigorously proved in apex-singleton model (Pro #3). Proof: incidence identity $|\mathcal H| \binom{N-\ell}{N-q-\ell} \ge \binom{N}{N-q}$.

**Positive lemmas in hand:** blocker duality $b(b(\mathcal C)) = \mathcal C$; Bernoulli Legal-Separator Lemma; apex-singleton CPD.

**Your stress-test protocol (complete each probe; do not stop on negatives).**

1. **Multi-apex CPD.** Does CPD survive $\mathcal D$ with multiple singletons $\{x_1\}, \{x_2\}, \ldots$? More generally, arbitrary $\mathcal D$ with varying $|D_j|$? Construct adversarial instances that maximize $|\mathcal R_\text{live}| / |\mathcal C|$ under each $\mathcal D$ class. If CPD fails, name the sharper multi-level covering-profile dichotomy needed.

2. **Nested / hierarchical covering-designs.** Can Prolonger amplify the sparse-covering obstruction by playing at multiple scales simultaneously? E.g., an outer covering design in one packet whose elements are themselves covering-design apices inside sub-packets. Does the integrality gap compound? Sandbox-verify.

3. **Weighted stress-test.** Under Sathe-Selberg weighting with biased Euler factors $\Pr(p \mid m) = 1/(p+1)$, does CPD's tight constant $\delta_q$ remain sharp? Exhibit the worst-case $\mathcal C$ achieving the inequality in the weighted setting. If the constant degrades to $\exp(\Omega(L))$, name what replaces it.

4. **Dynamic CPD under online $\mathcal D$.** Current CPD is static; what if $\mathcal D$ evolves as Shortener plays? Can Prolonger exploit the growing $\mathcal D$ to force covering-profile saturation faster? Construct the adversarial dynamics.

5. **If CPD survives all stress tests:** immediately push through to online amortization — design the Shortener strategy implementing CPD, integrate over central ranks, prove $L(n) \le O(r_1)$.

6. **If CPD breaks in any probe:** name the strictly sharper replacement. Examples of what might replace it: Sherali-Adams level-$q$ LP dichotomy, covering-design isoperimetry with multi-level profile $q \mapsto \delta_q^{(k)}$, weighted covering profile with Prolonger budget partitioned by scale. Prove the replacement in the regime where CPD broke. Continue toward closure.

**Strict non-stopping rule.** Return only with one of:

- A full-chain proof closing $L(n) \le O(r_1(n))$, with CPD (or a sharper replacement) extended through all regimes.
- A rigorous Prolonger lower-bound construction forcing $L(n) \ge c n/\log\log\log n$, game-legal, that refutes the conjectured sharp rate.
- A rigorous structural negative theorem: the covering-profile paradigm cannot close $r_1$ because of a specific named unavoidable ingredient (stated as a mathematical inequality, not a direction).

Do not return with "this stress test refutes X, here's sharper theorem Y, I didn't prove Y." Prove Y. If Y gets refuted, name Z and prove Z. Recurse until terminal.

**Game-legality reminders (absolute, non-negotiable):**
- Once Prolonger plays $F$, no prime $p \mid F$ is a legal Shortener claim.
- Legal composites of individually-illegal primes exist and must be handled correctly.
- $\sigma^\star$ claims the smallest legal prime only in states where every legal composite has a legal prime factor; otherwise it may claim cross-activator composites.
- Verify constructions in Python sandbox.

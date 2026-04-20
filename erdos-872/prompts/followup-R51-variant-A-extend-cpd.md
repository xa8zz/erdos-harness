**Angle: push the covering-profile dichotomy (CPD) to a full upper-bound closure.** Prove or rigorously refute each extension below in order. If you refute a step, immediately state the sharper replacement theorem and continue proving — do not stop on a negative. Do not return until you have either (i) a rigorous $L(n) \le O(n(\log\log n)^2/\log n)$ upper bound, (ii) a rigorous refutation that forces a specific strictly sharper dichotomy, and then a proof of that one, or (iii) a rigorous lower bound improvement that settles the sharp rate downward.

**Converged state.**

- **WLST** (original single-outcome separator theorem) refuted by forbidden-core star / parity-cube / relative cone constructions. Atomic-capture under prior Shortener blocker.
- **AWLST two-outcome** (Case A / Case B) proposed, Case A proved (Bernoulli Legal-Separator Lemma), Case B (weighted shadow $|\mathcal R_\text{live}|_\pi \le \kappa |\mathcal C|_\pi$) refuted via sparse covering-design obstructions across all three methods (KK, entropy, LP).
- **CPD (Covering-Profile Dichotomy)** replaces Case B. For each $q$:
  - *Case A_q:* legal relative blocker $Q$ with $|Q| \le q$ and capture $\ge \delta_q := \binom{N-q}{\ell}/\binom{N}{\ell}$
  - *Case B_q:* $|\mathcal C| \ge 1/\delta_q$
  - Exactly one holds.
  - Rigorously proved in apex-singleton model (Pro #3). Proof: incidence identity $|\mathcal H| \binom{N-\ell}{N-q-\ell} \ge \binom{N}{N-q}$, rearranged via $\binom{N}{q}\binom{N-q}{\ell} = \binom{N}{\ell}\binom{N-\ell}{q}$.

**Positive lemmas in hand:** blocker duality $b(b(\mathcal C)) = \mathcal C$; Bernoulli Legal-Separator Lemma (Case A_q Bernoulli regime); Apex-singleton CPD.

**Remaining open steps (prove each in order, continuing past any negative).**

1. **General-$\mathcal D$ CPD.** Extend CPD from $\mathcal D = \{\{x\}\}$ to arbitrary prior Shortener blocker family $\mathcal D = \{D_1, \ldots, D_r\}$. Candidates: iterated deletion, generalized Kruskal-Katona with forbidden down-sets, Sherali-Adams level-$q$ LP.

2. **Sathe-Selberg weighting.** Lift CPD from uniform packet measure to Sathe-Selberg harmonic measure $\Pr(p \mid m) \to 1/(p+1)$ at central rank. Should be largely routine via Euler-factor transference; confirm with explicit constants.

3. **Online amortization.** Design a Shortener strategy implementing CPD dynamically: at each turn, either claim a small-$q$ legal separator (Case A_q entropy decrement) or recognize that Prolonger's accumulated $|\mathcal C|$ already exceeds $1/\delta_q$ (Case B_q, chargeable to Prolonger's global move budget). The strategy must respect game legality at every step (no prime divisor of a played element; legal composites of individually-illegal primes handled correctly per $\sigma^\star$ correctness hypothesis).

4. **Integration.** Sum $1/\delta_q$ costs across central ranks $h \sim \log\log n$ and dyadic packet scales. Show the total Shortener move count is $O(n(\log\log n)^2/\log n) = O(r_1(n))$.

**Strict non-stopping rule.** If any step above refutes as stated:
- Name the precise failure mechanism and the strictly sharper replacement theorem.
- Prove or rigorously refute the replacement.
- If refuted again, iterate.
- Do not return with another "dichotomy needs an extension" concession. Return only when a full-chain proof closes, or when you have established a negative *structural theorem* (not just another refutation) that the current paradigm cannot close the upper bound at $r_1$.

**Game-legality reminders (absolute, non-negotiable in any construction):**
- Once Prolonger plays $F$, no prime $p \mid F$ is a legal Shortener claim.
- Legal composites of individually-illegal primes exist and must be handled correctly.
- $\sigma^\star$ claims the smallest legal prime only in states where every legal composite has a legal prime factor; otherwise it may claim cross-activator composites like $91 = 7 \cdot 13$.
- Verify constructions in Python sandbox.

**Escape hatches accepted:**
- A rigorous refutation of the conjectured rate $r_1$ via Prolonger lower-bound construction forcing $L(n) \ge c n/\log\log\log n$, game-legal throughout.
- A rigorous proof that no state-based paradigm can close $r_1$, with a named missing foundational tool.

Do not stop until you have a definitive positive result or a definitive structural negative result that names the missing foundational tool.

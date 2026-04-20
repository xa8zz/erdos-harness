---
id: R04-verify-gemini
type: verification
date: 2026-04-17
intent: >
  Adversarial Gemini audit of the sigma(D)->1 zero-upper-half-cost construction
  from R04-sigma-one-construction.
predecessors: [R04-sigma-one-construction]
action:
  kind: confirms
  target: R04-sigma-one-construction
claim: >
  Math sound point-by-point. Weakest links: (a) residual-harmonic-mass
  conjecture hand-wavy; (b) concatenated D_n is detached from any feasible
  online Prolonger strategy.
siblings: [R04-verify-claude, R04-verify-gpt-thinking]
---

# Audit — Gemini on Pro's $\sigma(D) \to 1$ zero-upper-half-cost construction (Round 5)

**Source:** Gemini (web, extended-thinking tab).
**Prompt sent:** `prompts/verify-postresp-04-sigma-one.md`.
**Extracted:** 2026-04-17 late night.
**Verdict:** Math sound point-by-point. Weakest links flagged: (a) hand-wavy "residual harmonic mass" conjecture, (b) the concatenated $D_n$ is a "Frankenstein" set detached from any feasible online Prolonger strategy.

---

This is a remarkably elegant, rigorous, and sophisticated response from the AI. It successfully maps a dense combinatorial game theory problem onto a clean probabilistic model (Mertens' theorems and Poisson-Binomial approximations).

I have audited the logic, re-derived the equations, and run the numerical checks from scratch. Here is the adversarial breakdown of the claims, pointing out exactly what holds, what is mathematically watertight, and where the actual "weakest link" lies.

---

### 1. The Mertens Calculation
**Status: Sound.**
The proof relies on $\sum_{p \in (y, y^{B_k}]} 1/p = \log B_k + o(1)$ as $y \to \infty$.
By Mertens' second theorem, $\sum_{p \le x} 1/p = \log \log x + M + o(1)$.
Applying this to the interval:
$$\log \log(y^{B_k}) - \log \log y = \log(B_k \log y) - \log \log y = \log B_k + \log \log y - \log \log y = \log B_k$$
Because the construction explicitly fixes $k$ (and thus $B_k$) *first*, and then takes $y \to \infty$, the asymptotic $o(1)$ error is perfectly valid.

### 2. The Elementary-Symmetric-Sum Approximation
**Status: Sound.**
The assertion is $\left(\sum_{p \in Q_k(y)} 1/p\right)^k = k! \cdot e_k(\{1/p\}) + O_k(\eta(y))$.
If you expand the polynomial on the left, the leading term without repeating indices is exactly $k! \cdot e_k$. The leftover terms all contain at least one repeated prime factor, meaning they are bounded by a sum involving $1/p^2$. Since the total sum $\sum 1/p \sim \lambda_k$ is a constant for fixed $k$, the error term is strictly proportional to $\eta(y) = \sum 1/p^2$. Because $k$ is fixed before $y \to \infty$, $O_k(\eta(y)) \to 0$. There is no hidden blow-up here.

### 3. The Le Cam Bound
**Status: Sound.**
The AI invokes $d_{\mathrm{TV}}(\text{Poisson-Binomial}(\{1/p\}), \text{Poisson}(\lambda(y))) \le \eta(y)$.
This is the textbook Le Cam inequality. For independent Bernoulli variables $X_i \sim \text{Ber}(p_i)$, the total variation distance to a Poisson distribution with mean $\lambda = \sum p_i$ is strictly bounded by $\sum p_i^2$. Here, $p_i = 1/p$, so the bound is exactly $\eta(y)$, which goes to 0.

### 4. The Chernoff Bound & Numerical Checks
**Status: Sound.**
The AI claims $\lambda_k = (k!)^{1/k} \sim k/e$ and $1 - r_k \le e^{-ck}$.
By Stirling's approximation, $(k!)^{1/k} \sim k/e$, so the mean is indeed $\approx k/e$. The probability $1 - r_k = \Pr(\mathrm{Poisson}(\lambda_k) \ge k)$ is the upper tail of a Poisson distribution where the threshold $k$ is roughly $e \approx 2.718$ times the mean. The standard Poisson Chernoff bound yields exactly this exponential decay.
Here is the numerical verification for small $k$:
* **$k=1$:** $\lambda_1 = 1$. $r_1 = \Pr(X=0) = e^{-1} \approx$ **0.368**
* **$k=2$:** $\lambda_2 = \sqrt{2} \approx 1.414$. $r_2 = e^{-\sqrt{2}}(1 + \sqrt{2}) \approx$ **0.587**
* **$k=3$:** $\lambda_3 = 6^{1/3} \approx 1.817$. $r_3 = e^{-1.817}(1 + 1.817 + 1.817^2/2) \approx$ **0.724**
* **$k=4$:** $\lambda_4 = 24^{1/4} \approx 2.213$. $r_4 = e^{-2.213}(1 + 2.213 + \dots) \approx$ **0.819**
The sequence $r_k$ cleanly marches toward 1.

### 5. The Concatenation Argument & Uniformity
**Status: Sound.**
This is often where analytical constructions fail, but the AI avoids the trap. The periodicity modulus $M_k$ is the primorial of all primes in the interval, which is astronomically large. To ensure the periodic density $\rho(D^{(k)})$ matches the actual upper-half density $|U_{D_n}|/|U|$, the error bound is $2M_k/n$.
The AI explicitly forces the block transition thresholds to satisfy $N_k \ge 2^k M_k$. Therefore, for all $n \ge N_k$, the error $2M_k/n \le 2M_k/(2^k M_k) = 2^{1-k}$, which uniformly vanishes as $k \to \infty$. This is a beautifully constructed sequence.

### 6. The Fixed-Prefix Sharpening Claim
**Status: Sound.**
The AI correctly diagnoses its own limitation here. It points out that because $D_n$ is a concatenated sequence of *fixed, finite templates* $D^{(k)}$, within any block $n \in [N_k, N_{k+1})$, the set $D_n$ is literally just the constant finite set $D^{(k)}$. Therefore, the fixed-prefix sharpening from the prompt still bites with full force within each block. The normalized $e^{-1}$ barrier is mathematically unchanged by this construction.

### 7. Does it resolve the question?
**Status: Yes, cleanly.**
The prompt asked if a $\sigma \to 1$ prefix can simultaneously have small upper-half cost. The AI successfully decouples the two variables. It proves that the obstruction $\sigma(D) \to 1$ does *not* necessarily force $|U_{D_n}| \to 0$. By showing that $\sigma \approx 1$ is perfectly compatible with $|U_D|/|U| \approx 1$, it correctly reformulates the real problem: the failure lies in the residual weighted antichain $\beta$, not the upper-half set size.

### 8. The Sharper Conjecture
**Status: WEAKEST LINK (Hand-wavy).**
The AI states: *"The right next invariant is not $\sigma(D)$ but something like the residual harmonic mass of legal primes after the lower prefix."*
While conceptually intuitive, this is mathematically soft. The AI fails to define what "legal primes" means in this context. A rigorous formalization would be the weighted sum $\sum_{x \in L_D(\emptyset)} w_n(x)/x$, or the sum of reciprocals of surviving sieve elements. The AI is gesturing at sieve theory limits, but leaves the exact invariant undefined.

### 9. Independent Numerical Check for $k=2$
I computed the $k=2$ case (products of 2 distinct primes from the first 11 primes) from scratch to verify the AI's table.
* **Primes:** $2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31$.
* **Sum of Reciprocals ($S$):** $\sum 1/p \approx 1.5657$
* **Sum of Squares ($S_2$):** $\sum 1/p^2 \approx 0.4461$
* **Calculation for $\sigma$:** $$\sigma = e_2(\{1/p\}) = \frac{1}{2}(S^2 - S_2) = \frac{1}{2}(1.5657^2 - 0.4461) \approx 1.00267$$
    *Matches AI's $1.0026777$.*
* **Calculation for $\rho$ (Free Density):**
    A number avoids $D_{2,11}$ if it has at most 1 prime factor from this set.
    Let $P_0 = \prod (1 - 1/p) \approx 0.15285$.
    Let $P_1 = P_0 \sum \frac{1}{p-1} \approx 0.15285 \times 2.3326 \approx 0.3565$.
    $$\rho = P_0 + P_1 \approx 0.15285 + 0.3565 = 0.50935$$
    *Matches AI's $0.5093886$ within rounding margins.*

---

### Final Verdict
The AI's response is mathematically spectacular. It identified a loophole (that $\sigma \to 1$ does not strictly necessitate upper-half collapse), formulated a Le Cam / Poisson-Binomial probabilistic model to prove it, and patched the infinite-limit complications with a watertight sequence of periodicity thresholds ($N_k$).

**The Weakest Links:**
1.  **Theoretical:** The "sharper conjecture" at the end is unformalized.
2.  **Game-Theoretic:** The sequence $D_n$ is a piecewise-constant "Frankenstein" set. While it mathematically proves existence for the narrow question, playing a static template of millions of specific integers is completely detached from any feasible online Prolonger strategy. It solves the structural question, but does not advance the actual game.

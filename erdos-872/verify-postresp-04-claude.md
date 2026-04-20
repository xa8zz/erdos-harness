---
id: R04-verify-claude
type: verification
date: 2026-04-17
intent: >
  Adversarial audit of the sigma(D)->1 zero-upper-half-cost construction from
  R04-sigma-one-construction, including numerical reproduction and structural
  assessment of the fixed-prefix sharpening gap.
predecessors: [R04-sigma-one-construction]
action:
  kind: confirms
  target: R04-sigma-one-construction
claim: >
  Math correct, numerics reproduce exactly. Key gap: construction is
  cost-shifting, not cost-reduction — it activates the fixed-prefix
  sharpening (already established), with same effective strength. Optimizing
  m in the carrier-recycling gives n/log log n obstruction.
siblings: [R04-verify-gemini, R04-verify-gpt-thinking]
---

# Audit — Claude on Pro's $\sigma(D) \to 1$ zero-upper-half-cost construction (Round 5)

**Source:** Claude (web, extended-thinking tab with Python sandbox).
**Prompt sent:** `prompts/verify-postresp-04-sigma-one.md`.
**Extracted:** 2026-04-17 late night.
**Verdict:** Math correct, numerics reproduce exactly. Weakest link: the "branch resolution" framing is cost-shifting, not cost-reduction — the construction immediately activates the fixed-prefix sharpening with the same effective strength as the Round 4 obstruction being circumvented. Formalizes the sharper-conjecture invariant concretely.

---

Let me run the computations first, then tie everything together.

All three examples reproduce to 7 decimal places. Now the Chernoff bound.

The Chernoff claim is verified — $1-r_k$ decays exponentially at rate $\ge 0.386$ (approaching $1/e \approx 0.368$). Now the finite-$n$ $|U_D|/|U|$ claims — exact to 5 decimals. One more check — the identity $\sigma \approx \lambda^k/k!$ is what drives the choice $\lambda_k = (k!)^{1/k}$. All numerics reproduce exactly. Now let me work through the structural audit.

---

## Audit

**Short version.** The math is correct, the conclusion is hedged appropriately, and the numerical claims reproduce to full precision. The weakest link is point 7: the framing "the upper-half cost is not the bottleneck" is true as stated, but it papers over the fact that the construction **immediately activates a second obstruction — the fixed-prefix sharpening — which is already in the "Established" block and which has the same effective strength as the one being circumvented.** So the "branch resolution" is mostly a cost-shifting, not a cost-reduction. I'll come back to this.

### Point-by-point

**(1) Mertens on $(y, y^{B_k}]$.** Correct. $\sum_{p \le x} 1/p = \log\log x + M + o(1)$, so the difference is $\log\log(y^{B_k}) - \log\log y = \log B_k$. The $o(1)$ error is $O(1/\log y)$, which is fine for fixed $B_k$ as $y \to \infty$. When $B_k$ grows with $k$: the response fixes $k$, then takes $y \to \infty$, so uniformity issues don't arise within a single stage. Between stages, $y_k$ is chosen after $k$ is fixed, which sidesteps any uniformity. Clean.

**(2) Elementary symmetric approximation.** Technically correct, but the $O_k(\eta(y))$ hides a $k$-dependent constant that's not benign. Expanding $(\sum x_i)^k$ and collecting terms:

- $k = 2$: $\lambda^2/2 - e_2 = \eta/2$ exactly. Verified numerically (diff/eta = 0.500).
- $k = 3$: $\lambda^3/6 - e_3 = \lambda\eta/2 - p_3/3$ where $p_3 = \sum 1/p^3$. Numerically matches.
- $k = 4$: diff/eta $\approx 1.19$ — the constant is growing.

So the true error is $O_k(\eta \cdot \lambda^{k-2}) = O_k(\eta \cdot \lambda_k^{k-2})$, and with $\lambda_k = (k!)^{1/k}$ that multiplier is $(k!)^{(k-2)/k}$, roughly $k!/k$ for large $k$. For fixed $k$ this is absorbed. For the concatenation — where $k \to \infty$ but $y_k$ is chosen stage-by-stage — $\eta(y_k)$ can always be made small enough to dominate any fixed-$k$ multiplier, so the construction is fine. Just worth noting the "$O_k$" is doing real work.

**(3) Le Cam.** Standard form: $d_{TV}(\sum \xi_i, \mathrm{Poisson}(\sum p_i)) \le \sum p_i^2$ for independent Bernoullis. Applies directly here. The $\sum 1/p^2$ version gives $\eta(y)$, and it's finite (even summing over all primes gives $\pi^2/6$ minus squares of composites — but we only need it $\to 0$ as $y \to \infty$, which is trivial). Clean.

**(4) Chernoff / $r_k$.** Verified. The claim $1 - r_k \le e^{-ck}$ holds with $c \ge 0.386$ for all $k \ge 1$, and $-\ln(1-r_k)/k$ converges to $1/e \approx 0.368$ from above. The threshold choice $\lambda_k = (k!)^{1/k}$ makes the Poisson leading term $\lambda^k e^{-\lambda}/k! = e^{-\lambda}$ exactly (since $\lambda^k = k!$), and by Stirling $\lambda_k \sim k/e$, so the decay is $\sim e^{-k/e}$. Matches the numerics. The finite values ($r_1 = 0.368$, $r_2 = 0.587$, $r_3 = 0.726$) confirm there's no small-$k$ pathology.

**(5) Concatenation.** The uniformity at transition points works as stated. Requirement $N_k \ge 2^k M_k$ gives error $|U_{D_n}|/|U| - \rho(D^{(k)})| \le 2 M_k/n \le 2^{1-k}$ at $n = N_k$. The $M_k = \prod_{p \in Q_k(y_k)} p$ is astronomical — for $y_k \sim e^{2^k}$ (needed to get $\sigma$-error $\le 2^{-k}$), $M_k$ is doubly exponential in $k$ — but $N_k$ is chosen after, so this is a stipulation not a contradiction. The construction is existence-only and says nothing computable about $N_k$; that's fine given the theorem is asymptotic. Valid.

**(6) Fixed-prefix sharpening transfer.** Does the Round 4 sharpening (already in "Established") apply to each $D^{(k)}$? Yes, cleanly. The sharpening's only requirement is that $D$ be fixed and finite with periodic density. $D^{(k)}(y_k)$ is a finite set of squarefree integers, each a product of $k$ distinct primes in $Q_k(y_k)$. Its density $\rho(D^{(k)})$ is periodic mod $M_k$ and equals $r_k + o(1)$, which is positive. The "products of $k$ distinct primes" structure doesn't trigger any special pathology — the sharpening argument only uses that $\mathbb{Z}/M_k$ splits into residue classes, which it does. No hidden gap here.

**(7) Does the theorem resolve the claimed question?** This is the weakest link.

The prompt's open question names three simultaneous failure modes: (i) fails at upper-half cost, (ii) reintroduces the obstruction's divergence, (iii) can't be extended to an online strategy. The response addresses (i) and is silent on (iii).

Start with the good: the response correctly shows $\sigma \to 1$ and $|U_D|/|U| \to 1$ are simultaneously achievable. So failure mode (i) is **not** forced. That's a real if narrow result.

Now the problem. The subpolynomial-prefix obstruction (Round 4) has coefficient $(1-\sigma(D_n))/2 \cdot \log(\log n / \log(m_n \log n))$. When $\sigma \to 1$ with rate $|1 - \sigma| \le 2^{-k}$ and $\log\log n$ grows, the coefficient is bounded by $2^{-k-1} \log\log n$. Is this $o(n)$? At $n = N_k$, we need $\log y_k \gtrsim 2^k$ to get $\sigma$-error $\le 2^{-k}$ (from the Mertens $O(1/\log y)$ rate), so $\log\log n \gtrsim \log\log N_k \gtrsim \log\log M_k \gtrsim 2^k$. The product $2^{-k} \cdot 2^k = O(1)$ — not $o(1)$. So the subpolynomial obstruction gives $\beta \ge O(1) \cdot n$, i.e., a *fixed positive constant times $n$*, not $o(n)$.

Actually this is subtle: in the examples, $\sigma$ is slightly *above* 1, making $(1-\sigma)/2 < 0$, so the bound is vacuous. That's the "escape hatch" for the construction. The subpolynomial-prefix obstruction is stated as a lower bound on $\beta$; if the coefficient is negative, it reads "$\beta \ge$ negative number", trivially true. So the subpolynomial obstruction is **evaded in the sense of being made vacuous**.

But now the fixed-prefix sharpening takes over. For each $D^{(k)}$ with $|U_{D^{(k)}}| \approx \rho(D^{(k)}) \cdot n/2$ and $|P| \le n^\alpha$:
$$\beta_{D^{(k)}}(P) \ge (\log(1/\alpha) + o(1)) \cdot \rho(D^{(k)}) \cdot \tfrac{n}{2}.$$

Plug into Vaccinated Shield:
$$|A| \ge |D^{(k)}| + |U_{D^{(k)}}| - \beta_{D^{(k)}}(P) \ge |D^{(k)}| + \rho \cdot \tfrac{n}{2} \cdot (1 - \log(1/\alpha) + o(1)).$$

Useful only if $\log(1/\alpha) < 1$, i.e., $\alpha > 1/e$. Same $e^{-1}$ barrier as before.

So the situation is:
- Before: Round 4 obstruction said $\beta \gtrsim (1-\sigma)/2 \cdot \log\log n \cdot n$. Vacuous unless $\sigma$ far from 1.
- After: construction achieves $\sigma \approx 1$, but fixed-prefix sharpening says $\beta \gtrsim \log(1/\alpha) \cdot |U_D| \approx \log(1/\alpha) \cdot n/2$.

The aggregate obstruction budget against any subpolynomial-$|P|$ shield proof is effectively unchanged. **The response has traded one obstruction for another with the same effective strength.** That's not quite "resolution of a branch"; it's more like a demonstration that the Round 4 obstruction wasn't uniquely responsible for blocking progress.

The response is *honest* about this — it writes "the real obstruction is the residual weighted antichain $\beta_{D_n}(P)$" and "the normalized $e^{-1}$ barrier is essentially unchanged." But the top-line framing ("the upper-half cost is not the bottleneck") invites the reading that a bottleneck has been removed. Substantively, no bottleneck has been removed; a particular diagnostic ($\sigma$) has been shown to be too coarse.

Verdict on point 7: **the result is correct but smaller than the framing suggests.** The response settles what it claims to settle, but that's a narrower statement than "resolves one branch of the open question." A truer framing: *the necessary condition $\sigma(D_n) \to 1$ from Round 4 is shown to be achievable with $|U_{D_n}|/|U| \to 1$, but the fixed-prefix sharpening immediately reimposes the same quantitative obstruction, so nothing has been gained in the Vaccinated Shield ledger.*

**(8) Sharper conjecture — well-posed?** The "residual harmonic mass of legal primes after the lower prefix" can be formalized naturally:
$$\tilde\sigma(D, n, \delta) \;:=\; \sum_{\substack{p\ \text{prime},\ p \le n^\delta \\ p \nmid \mathrm{lcm}(D)}} \frac{1}{p}.$$

For $D = D^{(k)}(y_k)$, a prime $p$ divides $\mathrm{lcm}(D)$ iff $p \in Q_k(y_k) = (y_k, y_k^{B_k}]$. So
$$\tilde\sigma = \sum_{p \le n^\delta,\ p \notin (y_k, y_k^{B_k}]} \frac{1}{p} = \log\log n^\delta - \log B_k + O(1) = \log\log n - \lambda_k + O(1).$$

This still diverges — which is consistent with the fixed-prefix sharpening still biting. So the formalization is well-defined, meaningful, and captures the right phenomenon: $\sigma(D) \to 1$ does not force $\tilde\sigma(D)$ to shrink. The conjecture is that $\tilde\sigma$ is the right invariant to control $\beta_D(P)$. The response's intuition is sound; the formal version would be "any subpolynomial-$|P|$ shield proof of linearity requires $\tilde\sigma(D_n, n, \delta) = O(1)$ for some $\delta > 0$." That's a clean conjectural strengthening of Round 4's $\sigma(D_n) \to 1$ condition.

I'd caution, though: proving this conjecture would require a new argument, because the existing obstruction proof uses $\sigma$ via a union bound on killed multiples, not via a separate bound on residual primes. The conjecture suggests the right invariant but doesn't immediately yield a proof.

**(9) Numerical reproduction.** All three $(\sigma, \rho)$ pairs reproduce exactly to 7 decimals; the $k=2$ finite-$n$ ratios $|U_D|/|U|$ at $n = 10^5$ and $2 \times 10^5$ reproduce to 5 decimals. The computation checks out.

### Secondary observation

The response briefly conflates "asymptotic regime" with "finite witness." The three concrete tables (k=2/m=11, k=3/m=69, k=4/m=1057) are *not* instances of the asymptotic construction — they are independent finite sets where $\sigma$ happens to be slightly above 1 by finite-size effects. The asymptotic construction takes $Q_k(y_k)$ as a prime interval $(y_k, y_k^{B_k}]$ with $y_k \to \infty$; the finite examples take the *first* $m$ primes. These are structurally different families and agree only because both produce $\sigma \approx 1$. The response treats them interchangeably, which is fine for the "readable witness" purpose stated but could mislead a reader into thinking the finite examples instantiate the asymptotic theorem.

### Bottom line

The proof is sound and the numerics reproduce exactly. The theorem is correct as stated.

The interpretive claim — that this "resolves one branch" — is softer than it reads. What's actually shown: *the specific diagnostic "$\sigma(D) \to 1$" from Round 4 does not force upper-half cost.* What's not shown: *that the Vaccinated Shield bound can yield $L(n) \ge \varepsilon n$ under any natural refinement.* The construction immediately hits the fixed-prefix sharpening with its $e^{-1}$ barrier intact, and the aggregate obstruction budget is unchanged.

Where the response is epistemically solid: it explicitly concedes "$\beta_{D_n}(P)$ can still be large", "does not yet help Prolonger", and "any successful shield-based proof, if it exists, must use a genuinely $n$-scale lower prefix." These caveats are accurate and do most of the work of not overclaiming. The sharper conjecture about residual harmonic mass is natural, formalizable, and probably correct as a necessary condition.

The clearest substantive progress: the response demonstrates that $\sigma$ alone is a coarse invariant — the right diagnostic has to be something more like the $\tilde\sigma$ I wrote out above, tracking residual harmonic mass on primes unblocked by $D$. That's a real structural observation, even if it's more refinement than resolution.

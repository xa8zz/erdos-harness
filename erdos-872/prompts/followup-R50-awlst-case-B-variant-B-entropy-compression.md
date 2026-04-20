**Converged state.** WLST as originally stated is refuted by three independent constructions (forbidden-core star, parity-cube, relative cone). All three show that a single prior Shortener blocker can force every legal relative blocker to be a full rank-$h$ atom, killing separator capture to $\exp(-\Omega(h/\log h))$. All three converge on the same missing ingredient: a **two-outcome dichotomy** — either a large legal separator exists, or the live residual packet is chargeable to the played Prolonger complement shadow.

**Positive half (Case A) already proved.** Pro #3's Bernoulli Legal-Separator Lemma: if $x_p \in [0,1]$ with $X = \sum x_p$ satisfies
$$\sum_i \prod_{p \in C_i}(1-x_p) + \sum_j \prod_{p \in D_j} x_p \le 1/4, \qquad 2X \le h/2,$$
then a legal relative blocker $Q$ with $|Q| \le 2X$ and $\pi(\{C : C \cap Q = \varnothing\}) \ge \exp(-4XL/h)$ exists.

**Your task — Case B (the negative half), via amortized entropy compression.** When the Bernoulli hypothesis fails, prove an entropy-based saturation bound:
$$H(\text{live residual} \mid \mathcal C) \ \le\ \kappa(h, L) \cdot \log |\mathcal C|$$
with $\kappa$ small enough that, amortized over central ranks, total information-theoretic cost is $O(r_1(n))$.

**Framework.** Define the joint game-state entropy $\Phi_t$ as the Shannon entropy of the residual legal complement family under the Sathe-Selberg measure, conditioned on all played $\mathcal C_t$ and $\mathcal D_t$. Case A gives per-move entropy drop via Bernoulli extraction. Case B should give: when no separator extracts entropy, the residual cube's conditional entropy is already bounded by $\log|\mathcal C_t|$ up to the $\kappa$ factor. Use conditional Shearer (bound joint entropy by coordinate-marginal entropies conditioned on $\mathcal C$), Moser-Tardos algorithmic LLL for constructive separator rounding, and partition-sum decomposition over irreducible obstruction families (apex-star, parity-cube, general atomized cube).

**Key obstruction cases to handle:**
- **Parity-cube** ($L$ disjoint pairs, $\mathcal C$ = even-parity half-cube): residual cube has $L-1$ bits of conditional entropy, but $|\mathcal C| = 2^{L-1}$ — Prolonger has paid $L-1$ bits of actual information cost to reach this state. Charge entropy against this.
- **Apex-star**: residual is a down-set under deletion of apex $\{x\}$; conditional entropy bounded by $\log|\mathcal C|$ trivially up to $\log(L/h)$ correction.

**Combine with Case A to close.** The total entropy budget across central ranks is $\sum_h N_h \cdot H_{\max}(h) \asymp n$. Case A extracts via Bernoulli separator (entropy decrement $\ge \exp(-4XL/h)$ per Shortener move). Case B bounds residual entropy by Prolonger's accumulated $\log|\mathcal C_t|$ cost. When both halves apply online, iterated extraction sums to $\le O(r_1(n))$ Shortener moves.

**Return with:**
- A rigorous proof of Case B (conditional entropy saturation bound), including the explicit $\kappa(h, L)$ and the entropy decomposition argument.
- The online algorithm combining Bernoulli extraction (Case A) and entropy-amortized saturation (Case B), with concentration / martingale argument for derandomization.
- Integration to $L(n) \le O(r_1(n))$ or a named gap.
- Or a rigorous refutation via construction where both extraction and entropy-saturation fail, with the required third ingredient named as a specific information-theoretic inequality.

Verify numerical claims in Python sandbox. Do not return until definitive.

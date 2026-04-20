**Converged state.** WLST as originally stated is refuted by three independent constructions (forbidden-core star, parity-cube, relative cone). All three show that a single prior Shortener blocker can force every legal relative blocker to be a full rank-$h$ atom, killing separator capture to $\exp(-\Omega(h/\log h))$. All three converge on the same missing ingredient: a **two-outcome dichotomy** — either a large legal separator exists, or the live residual packet is chargeable to the played Prolonger complement shadow.

**Positive half (Case A) already proved.** Pro #3's Bernoulli Legal-Separator Lemma: if $x_p \in [0,1]$ with $X = \sum x_p$ satisfies
$$\sum_i \prod_{p \in C_i}(1-x_p) + \sum_j \prod_{p \in D_j} x_p \le 1/4, \qquad 2X \le h/2,$$
then a legal relative blocker $Q$ with $|Q| \le 2X$ and $\pi(\{C : C \cap Q = \varnothing\}) \ge \exp(-4XL/h)$ exists.

**Your task — Case B (the negative half), via weighted Kruskal-Katona / LYM.** When the Bernoulli hypothesis fails, prove that the live residual packet is dominated by the played Prolonger complement shadow:
$$|\mathcal R_{\text{live}}|_\pi \ \le\ \kappa(h, L) \cdot |\mathcal C|_\pi$$
with $\kappa$ small enough that, summed over central ranks $h \sim \log\log n$ and over the packet shadow ranks, the total saturation-charged mass is $O(r_1(n)) = O(n(\log\log n)^2/\log n)$. Use weighted relative Kruskal-Katona / LYM / Bollobás set-pair inequalities applied to the complement clutter $\mathcal C$ with forbidden down-sets $\mathcal D$.

**Key obstruction cases to handle:**
- **Apex-star / forbidden-core:** $\mathcal C = \{\{x\} \cup A : A \in \binom{Y}{L-1}\}$, $\mathcal D = \{\{x\}\}$. Here $|\mathcal C| = \binom{h+L-2}{L-1}$ and $|\mathcal R_\text{live}| = \binom{h+L-2}{L-2}$, so $|\mathcal C|/|\mathcal R_\text{live}| = h/(L-1) \asymp \log h$. The shadow inequality is expected to give $\kappa \ll (L-1)/h$, chargeable.
- **Parity-cube:** $L$ disjoint pairs, $\mathcal C$ = even-parity half-cube of $(L)$-complements. Here $|\mathcal C| = 2^{L-1}$ and $|\mathcal R_\text{live}| = 2^{L-1}$ (the odd-parity half). Ratio is $1$; the weighted shadow inequality needs to use Prolonger's $2^{L-1}$ spent moves as budget.

**Combine with Case A to close.** Given both halves, construct an online Shortener strategy that at each turn either (A) claims the Bernoulli separator (entropy decrement) or (B) recognizes saturation (charging against Prolonger's already-played moves). Integrate over central ranks to derive $L(n) \le O(n(\log\log n)^2/\log n)$.

**Return with:**
- A rigorous proof of Case B with explicit $\kappa(h, L)$.
- The online strategy combining cases, with correctness argument under $\sigma^\star$-style game legality.
- Integration to $L(n) \le O(r_1(n))$ or a named gap.
- Or a rigorous refutation via a construction where both Case A fails AND the weighted shadow inequality fails, naming the required third outcome.

Verify numerical claims in Python sandbox. Do not return until definitive.

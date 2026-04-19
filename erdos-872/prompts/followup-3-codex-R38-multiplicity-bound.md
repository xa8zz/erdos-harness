Pro R38 result: naive Ford refuted (clustered microcells — $h$ primes in $[P, e^{1/h^2}P]$ give $\binom{h}{k}$ witnesses $A_B$ in the required ratio interval of width $e^{k/h^2} < e^{k/h}$, far exceeding $O(\log\log h)$). Pro also proved rigorous pair-first charging: for every useful shield with no fresh pair witness, each $bpq$ certificate was first-shielded by some Prolonger score, the shield is charged to the latest such $\tau(p,q)$, and $\sigma^\star$ domination + $h(h-1)$ first-covered pairs per score gives
$$\#\{\text{useful shields, no fresh pair witness}\} \le h(h-1)\, N_h.$$
This is a fixed-rank star-breaker ($O_h(N_h)$ for any fixed $h$) but loses $h^3$ at central rank $h\sim\log\log n$.

The remaining question is now sharp and matches your R38 first-appearance reduction: **bound the per-Prolonger-score multiplicity of charged first-covered witnesses (pair-level or lower-defect) outside the R35 clustered-cell entropy tail.** $O(1)$ gives $|F_{\text{useful}}| \ll N_h/h$; $O(h/\operatorname{polylog} h)$ or $O(\log\log h)$ suffices for $L(n) = o(n)$. Pro claims the R35 thickness / high-tail decomposition should absorb the clustered-cell configurations where Pro's counterexample lives, leaving the non-clustered regime with bounded multiplicity — but the quantitative equivalence is not made explicit.

Three sub-tasks, any combination, short report:

1. **Empirical scaling.** Extend `phase4/freshness_toy.py` to measure BOTH per-Prolonger-score first-covered-pair multiplicity (Pro's $h(h-1)$ slot) AND $M_k(h)$ (your first-appearance per-round shield count) at $(h,M) \in \{(4,14), (5,14), (6,12), (4,20), (5,20)\}$. Also run a **clustered-cell variant** — construct microcells with extreme size spread (one dense cell of $\approx h$ primes in ratio $\le e^{O(1)/h}$, others sparse) emulating Pro's counterexample. Report max/mean of each multiplicity; does either stay $O(1)$ or $O(\log\log h)$ **outside** the clustered variant?

2. **Analytical push.** Make the R35 thickness / high-tail decomposition pay for clustered cells explicitly. Specifically: show that the total contribution of useful shields whose first-covered pair witnesses concentrate in a single ratio-$e^{O(1)/h}$ microcell is already bounded by the $N_h/\log h$ entropy term. Combined with a bounded non-clustered multiplicity, this would close the central-rank gap.

3. **Refutation.** If (1) shows per-score multiplicity growing $\gg \log\log h$ even outside clustered cells, construct the explicit arithmetic Prolonger strategy that pre-shields all first-covered pair certificates while producing many useful shields. A concrete counterexample would refute the main-game freshness lemma and give a new asymptotic constraint.

Partial progress on any single sub-task is valuable.

Your R32 simplex-star cascade refutation is clean and sharpens the gap substantially. The refutation pinpoints the obstruction (short-prime-cell stars with reciprocal mass $\alpha_I \asymp 1/(h \log P)$ and exponentially-small cell mass $(\alpha_I/H)^h$), and your proposed corrected form is the natural next target:
$$|\operatorname{Cl}_h(R, C)| \le O(\log h) \mathfrak B_h(R, C) + O(\text{scored}) + \sum_{\mathcal Q} O\!\left(\frac{n}{\log n} \frac{\alpha(\mathcal Q)^h}{h!}\right),$$
with the required global estimate $\sum_{\mathcal Q} (n/\log n) \alpha(\mathcal Q)^h/h! = o((\log h/h) N_h)$ after summing over all product-compatible short prime-scale cells.

The single-cell case (you noted) follows from $\max_{\mathcal Q} \alpha(\mathcal Q) = o(H)$. The open hard case is the **multi-cell product star**: each coordinate of $S$ replaced inside its own short prime-scale cell $\mathcal Q_i$, with product $\prod_i \alpha(\mathcal Q_i)^{h_i}$ summed over partitions of $h$ into cells.

Push on the scale-entropy resilience theorem directly. Specific attacks:

1. **Multi-cell partition entropy bound.** For a fixed partition of the rank-$h$ coordinates into $t$ cells $\mathcal Q_1, \ldots, \mathcal Q_t$ with $\sum h_i = h$, the cascade mass is roughly $\prod_i \alpha(\mathcal Q_i)^{h_i}/h_i! \cdot (n/\log n)$. Sum over partitions and cells. Key question: is the worst partition concentrated at $t = 1$ (single cell, handled) or at $t = h$ (singleton primes, bounded by the static $\log h$ term)? The dangerous intermediate $t \sim \log\log h$ is where a super-constant multiplier could appear; prove its sum is dominated.

2. **Ford / Hooley anatomy of integers applied to the cell structure.** Short prime intervals $I = [P, (1+1/h)P]$ partition $[2, y]$; there are $O(\log y / \log(1+1/h)) = O(h \log y)$ cells. For each cell $\mathcal Q$, target mass $\alpha(\mathcal Q)^h \le (C/h)^h$ for some $C$. Sum over single-cell contributions: $O(h \log y) \cdot (C/h)^h/h! \ll 1/h^h$ — super-small. Multi-cell products also compact. Try to formalize the multi-cell combinatorial identity that forces the full sum to be $o((\log h/h) N_h)$ uniformly.

3. **Entropy-weighted potential on the game dynamics.** Instead of the plain $\mathfrak B_h$, define an entropy-weighted potential $\mathfrak B_h^{\text{ent}}(R, C) = \sum_{\mathcal Q} w(\mathcal Q) |(\partial_{h-1} R \setminus C) \cap \mathcal Q|$ with weights $w(\mathcal Q)$ growing with $\alpha(\mathcal Q)$. The hope: $\mathfrak B_h^{\text{ent}}$ respects Prolonger's cell-local stealing, Maker-first nondecreasing drift holds at all defect layers, and the global target $|\operatorname{Cl}_h|$ is controlled by $\mathfrak B_h^{\text{ent}}$ with an $O(\log h)$ constant.

4. **Cell-local random cover + global aggregation.** Build the static cover cell-by-cell with inclusion probability $\lambda_{\mathcal Q}/h$ tuned per cell. Pro resilience: after a cell-local cascade, replacement primes must come from the same cell (by the arithmetic of top-facet replacement at comparable prime scale). So the repair is cell-local. Aggregate over cells using the partition; total transversal size $\sum_{\mathcal Q} O(\log h \cdot \alpha(\mathcal Q)^h N_h/(h! H))$. Bound this sum.

5. **Refined LP relaxation.** Write the cell-local transversal LP with concentration penalties; bound the integrality gap. If the LP dual shows that multi-cell configurations contribute $o(1/h)$ of the total cover budget, the corrected resilience holds.

6. **Further refutation attempt.** If the corrected form is ALSO false (multi-cell product stars accumulate mass beyond the $o((\log h/h) N_h)$ bound), construct the specific multi-cell obstruction. This would show $L(n) \ne O(n \log\log\log n / \log\log n)$, at which point the dichotomy's sublinear side might fail entirely, and the open question becomes: what IS the sharp asymptotic rate?

## Output expectations

Push on any combination of the above. Partial results, honest concessions with the precise remaining sub-gap, or further refutations of the corrected form are all valuable.

## Empirical note

A parallel Codex dispatch is testing the extracted Shortener strategy $\sigma$ = "claim max-unresolved-degree vertex" against the simplex-star cascade Prolonger. Outcomes feed back into this analysis: if $\sigma$ is $O(1)$-competitive even against the cascade in the abstract hypergraph model, that provides empirical evidence for a stronger form of the resilience theorem. If $\sigma$ degrades against the cascade, it further validates the scale-local corrective term.

## Key reference points

- Static $O(\log h)$ random cover (R29): still correct, at the right scale $N_h/h^2$.
- Online-vs-static lower principle (R29): $T^* \ge \tau/2$, forcing $g(h) \ge \Omega(\log h / \log\log h)$ in the worst case.
- Your R32 refutation: plain state inequality false; corrected form with scale-entropy term is the live target.

Can you close the multi-cell product-star case, or is a further refutation needed?

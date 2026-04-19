Your corrected version of route 3 from R38 was: the game-generated candidate witnesses per fibre form a highly constrained subfamily (not the full $\{d_I : |I|=k\}$ family that your $h$-primes-in-one-microcell construction blows up), and a single played $m$ pre-shields only $O(\log\log h)$ of those. You flagged this as essentially a quantitative form of route 2: chain-generated witness sparsity per fibre under $\sigma^\star$.

**Empirical support, from three parallel Codex agents on `freshness_toy.py`.** Per-Prolonger-score first-covered-pair multiplicity (the slot in the parallel Pro's pair-first charging argument) stays max 4–6 across $(h,M) \in \{(4,14), (5,14), (4,20), (5,20)\}$ — flat, empirically $O(1)$. First-appearance $M_k(h)$ grows to 34 on the same grid, ruling out direct $M_k$ rescue. So the game-generated per-fibre witness family is indeed much smaller than the naive divisor family that the clustered-microcell counterexample exploits.

**Analytical partial.** If all charged witnesses for a useful shield concentrate in a single microcell $\mathcal Q$ of width $e^{O(1)/h}$, contribution is $N_h \cdot (\alpha_{\mathcal Q}/H)^h$ with $H \sim \log\log n$ and $\alpha_{\mathcal Q}$ the reciprocal mass of $\mathcal Q$. Entropy-tail sized — absorbable into the existing $N_h/\log h$ term. Single-cell concentration is paid for analytically.

**Sharpened remaining target.** Prove a chain-generated per-fibre multiplicity bound outside a **dyadic-packet tail**: a single played $m$ pre-shields at most $O(1)$ (or $O(h/\operatorname{polylog} h)$) chain-generated witnesses from any fixed fibre's game-generated family, when that family spans $> O(1)$ nearby microcells. The single-cell regime is already entropy-tail; the live question is the $O(1)$-cell spread.

Concrete paths, either closes:
1. Use the same-prime-prehistory depth structure to partition chain-generated witnesses per fibre by depth, prove bounded multiplicity at each depth, then sum. This applies the chain-generated constraint to the pair-first charging slot directly — and uses dyadic extension of the single-cell absorption to handle packet spread.
2. Refute with an explicit fibre-level counterexample: a Prolonger play sequence where a single fibre's chain-generated witness family spreads across a few nearby distinct microcells, a single played $m$ pre-shields many of them, and $\sigma^\star$'s forced response cannot access a degree-$\ge h$ lower defect.

Partial results — bounded-depth chains, specific fibre structure, specific microcell arrangements — are valuable. Refutation equally so.

Your pair-first charging from R38 gives the fixed-rank star-breaker
$$\#\{\text{useful shields, no fresh pair witness}\} \le h(h-1)\, N_h,$$
where $h(h-1)$ bounds ordered first-covered pair certificates per Prolonger score. At central rank $h \sim \log\log n$ the $h^3$ loss is the whole obstruction.

**Empirical support for pair-first $O(1)$.** Three Codex agents measured per-Prolonger-score first-covered-pair multiplicity in `freshness_toy.py`: max 4 at $(h,M) = (4,14)$, max 3 at $(5,14)$, max 6 at $(4,20)$, max 6 at $(5,20)$. Flat, not growing with $h$ or $M$. By contrast, first-appearance $M_k(h)$ multiplicity grows to 13, 7, 34, 23 on the same grid — that direct route is dead. Pair-first is empirically $O(1)$.

**Analytical partial — single-cell absorption.** If every charged first-covered pair witness for a useful shield lies in a SINGLE microcell $\mathcal Q$ of width $e^{O(1)/h}$, then all primes of the shield lie in $\mathcal Q$, and the whole bad family sits in a single-cell rank-$h$ layer contributing
$$N_h \cdot \left(\frac{\alpha_{\mathcal Q}}{H}\right)^h, \quad H \sim \log\log n, \quad \alpha_{\mathcal Q} = \text{reciprocal mass of } \mathcal Q.$$
Summed over cells, this is entropy-tail sized — absorbable into the existing $N_h/\log h$ term. Single-cell concentration is paid for.

**Sharpened remaining target.** Extend single-cell absorption to a **dyadic-packet** absorption, and prove per-score pair-first multiplicity is $O(1)$ outside that packet tail. "Dyadic packet" $= \bigcup_{i=1}^{O(1)} \mathcal Q_{j_i}$ spanning a ratio interval of width $e^{O(1)/h}$ across a few consecutive microcells — broader than single-cell, still entropy-tail sized under the R35 thickness / high-tail decomposition. Your own Ford counterexample (R38: $h$ primes in one $[P, e^{1/h^2}P]$ cell) is exactly single-cell and already paid for; the live question is whether the same absorption extends when primes split across $O(1)$ cells.

Concrete paths, either closes:
1. Prove inclusion-exclusion over nearby cells: $\sum_{\text{packets of size} \le c} N_h (\alpha_{\text{packet}}/H)^h \ll N_h/\log h$, combined with an argument that pair-first multiplicity $> c$ forces packet concentration at size $> c$ — combinatorially identifying bad multiplicity with combinatorial packet excess.
2. Refute by constructing an explicit arithmetic Prolonger strategy spreading first-covered pair witnesses across a few nearby but distinct microcells, giving linear pair-first multiplicity while $\sigma^\star$ cannot access a degree-$\ge h$ lower defect.

Partial results — specific packet size $c$, specific rank window, bounded-constant multiplicity — are valuable. Refutation equally so.

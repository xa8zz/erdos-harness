Continue pushing toward full closure.

## Current state (R39 returns)

- Pro proved the **dense-packet projection lemma**: for family $\mathcal S$ of later useful targets with chain-generated witnesses first-shielded by Prolonger score $F$, if $|\Gamma_k(S,F)| \ge \theta\binom{|S\cap F|}{k}$ and $|S\cap F| \ge h-r$, then
$$|\mathcal S| \le \theta^{-1}\left(\frac{h}{h-r}\right)^k d_t(x_t).$$
This closes the **dense regime**: $|F_{\text{useful}}| \ll N_h/h$ whenever chain-generated witnesses are densely distributed among $k$-subsets of $S\cap F$ at some depth $k \le C\log h$ with $|S\cap F|\ge h - O(h/k)$.

- **Remaining case:** a Prolonger chain that keeps $\Gamma_k(S,F)$ sparse at every $k \le C\log h$ for many useful targets $S$ — almost all lower-defect witnesses in $S\cap F$ pre-shielded **before** $F$ was played.

- **Codex conditional closure (R39):** $|F_{\text{useful}}| \ll_c (M(h)/h)N_h + N_h/\log h$ outside fixed $c$-packet tail, so any $M(h) = O(h/\operatorname{polylog} h)$ for pair-first multiplicity outside the packet tail suffices.

- **Empirical observation (R38 / R39 toys):** bad useful shields reuse ONE pair, not many distinct pairs. $(4,14)$ max 4 from score $(0,1,2,11)$ uses only pair channels $(1,11), (2,11)$; $(4,20)$ max 6 from $(0,1,2,15)$ uses only $(1,15), (2,15)$; support clouds tiny and structured.

## Three tasks — any combination, partial progress valuable

1. **Empirical probe at scale.** Extend `phase4/freshness_toy.py` to $(5,20), (6,16), (7,14)$. At each bad useful shield, measure the density $|\Gamma_2(S,F)| / \binom{|S\cap F|}{2}$. If the density is $\ge 1/2$ at most bad shields across these scales, Pro's dense-packet lemma empirically applies and the problem is effectively closed. If shields are sparse in $\Gamma_2$ but concentrate on ONE pair (continuing the R38 observation), measure the pair-reuse multiplicity directly: how many useful shields charge to the same $(p, q_0)$ pair at a single Prolonger score, as a function of $(h, M)$?

2. **Recursive charging partial.** Prove: if a sparse-$\Gamma_k$ chain leading to sparse first-shielding by $F$ has depth $d$, some earlier Prolonger score in the chain's past must itself have pre-shielded many lower-defect certificates that were fresh at that earlier time. Formalize the backward amortization. Even a bounded-depth version (sparse chains must terminate within $O(h)$ layers) would close the picture, because the bounded-prehistory freshness lemma handles bounded-depth cases: if $r_p(t^-) \le h-k-1$ at depth $k$, a fresh witness exists.

3. **Refutation attempt.** Construct an explicit arithmetic Prolonger chain in the **main** divisibility game (not the monotone-deletion relaxation) that keeps $\Gamma_k(S, F)$ sparse at every $k \le C\log h$ for linearly many useful targets $S$, while $\sigma^\star$ cannot access a degree-$\ge h$ legal defect in the chain's past. Build on the R38 one-pair-reuse observation: the toy bad shields all reuse one pair — try to scale this to a full arithmetic chain. A concrete refutation would force $L(n) \ne o(n)$ at the $n/\log\log\log n$ rate.

Full proof or refutation preferred. Partial progress — bounded-depth sparse control, specific rank windows, quantitative constants, empirical scaling results — equally valuable.

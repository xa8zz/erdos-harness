Your defect-layer closure budget reduction is the cleanest framework in the program so far. The rate identity $V_{h,k}/\binom{h}{k} = N_h/D_{h,k}$ explains uniformly why every static attempt fails, and $B_h \asymp N_h/H$ has the right target scale.

The open step you isolated — the robust central transversal lemma — is now the load-bearing question. Push on it directly.

Specific attacks worth trying:

1. **Probabilistic transversal + online repair.** Build a random static transversal $T_0$ of expected size $C N_h/H$ by independent inclusion of each top-facet certificate with probability $\lambda/H$ tuned so that all hyperedges are covered with high probability. Then track a budget of "repair" certificates available to add to $T$ after each Prolonger steal. Prolonger's steal of the $h$-vertex boundary of a target $S$ removes those vertices from $T$; the repair step re-covers any hyperedges that were covered only through $S$'s boundary. Expected repair cost per steal is $\Theta(1)$ under a first-moment estimate on the number of "fragile" hyperedges sharing vertices with $S$'s boundary. Total transversal size stays $C N_h/H + O(\text{number of Prolonger moves}) \cdot O(1)$. With the Prolonger move count bounded by the same $O(N_h/H)$, this gives $g(h) = O(1)$ in expectation, which after concentration and derandomization (method of conditional expectations on the repair sequence) would close the lemma with $L(n) = O(n/\log\log n)$.

2. **Cross-layer potential.** The one-layer identity gives zero drift at each $k$, but does a combined potential $\Phi(R, C) = \sum_{k=1}^h w_k \cdot |C_{h-k}|$ with weights $w_k$ chosen to exploit the inductive structure $\partial_{h-k+1} \subseteq \partial_{h-k}$ give positive drift? In particular, a Shortener move at defect-$1$ (top facet) kills $\binom{h}{1} = h$ rank-$h$ targets AND creates closure opportunities at deeper layers. Try weights $w_k = k!/H^k$ matching the layer budget.

3. **Nibble-plus-cleanup.** Run a Rödl-nibble-style random pickup for the bulk of the transversal (handling the typical hyperedges), and a separate structured pass for the high-defect part $\operatorname{Cl}_h(R, C)$. The hope: the fully-closed residual set $\operatorname{Cl}_h$ is a second-moment event — requires $h$ independent lower-divisor captures by Prolonger, each of reciprocal density $\lesssim 1/H$, so $|\operatorname{Cl}_h| \lesssim N_h/H^h$ which is $o(N_h/H)$ for any $h \ge 2$.

4. **Prolonger counter-construction.** If the lemma is false, there's a Prolonger stealing strategy on $H^{(h)}$ that forces any online Shortener transversal to have size $\ge c N_h$ for a constant $c$. Attempt to build such a construction for small $h$ (say $h = 3, 4$) and see if it generalizes.

5. **Weakened target.** If $g(h) = o(h)$ is too strong, attempt $g(h) = O(h^{1-\varepsilon})$ or even $g(h) = O(h/\log h)$. Any sub-$h$ growth gives a sublinear $L(n)$, so partial results are directly useful.

Numerical sanity checks at $h = 3, 4, 5$ (exhaustive search on small instances of $H^{(h)}$) are welcome for confirming or refuting proposed strategies.

Your R33 defect-layer counting lemma — $|\operatorname{Cl}_h(R, C)| \le (D_{h,k}/\binom{h}{k}) |C_{h-k}|$ for every $k$ — is a clean structural result. Two parallel developments that you did not have in your last dispatch:

**(1) Pro A (a different thread) proved a thickness dichotomy in the arithmetic / divisibility setting.** Partition the small primes into short multiplicative cells $\mathcal Q_j = [P_j, e^{1/h} P_j]$ with $\alpha_j = \sum_{p \in \mathcal Q_j} 1/p \asymp 1/(h \log P_j)$ and $M_j = |\mathcal Q_j| \asymp P_j/(h \log P_j)$. For a target $S$, define the cell-thickness $\tau(S) = \sum_{p \in S} 1/M_{\mathcal Q(p)}$. With population threshold $L$:

- **Thick case** ($\tau(S) \ge 1/L$): fractional charging (send weight $1/M_{\mathcal Q(p)}$ from $S$ to a scored star target shielding $S \setminus \{p\}$) gives thick-target mass $\ll L \cdot (\text{scored})$.
- **Thin case** ($\tau(S) < 1/L$): uses only cells with $M_{\mathcal Q} > L$, so total mass $\ll N_h/\log(hL)$.
- **Optimizing $L \asymp h/\log h$:** closed multi-cell product-star mass $\ll N_h/\log h$ — this refutes the $g(h) = O(\log h)$ target (by factor $h/(\log h)^2$) but keeps $g(h) = O(h/\log h)$ alive, giving $L(n) \ll n/\log\log\log n$, still strictly $o(n)$.

This result is in the *arithmetic* model where top-facet certificate "replacement" must happen within a comparable prime scale (the arithmetic constraint $q \asymp p$ for $bA_{S \setminus \{p\}} q$ to be a legal top-facet blocker). In the abstract $H^{(h)}$ model, the cell structure is absent but the thickness dichotomy principle might still apply if you introduce a "cell assignment" as an auxiliary structure.

**(2) Codex empirically tested an extracted Shortener strategy against an explicit Prolonger cascade.** Rule $\sigma$ = "claim max-unresolved-edge-degree vertex" survives the simplex-star cascade from Pro A R32 — worst empirical ratio $\sigma/\tau_{\text{lower}} = 1.133$ on tested grids. The cascade is NOT Prolonger-optimal in online play. This suggests your static barrier (R = $\binom{\mathcal P_0}{h}$, C = $\binom{\mathcal P_0}{h-1}$, $\mathfrak B_h = 0$, $|\operatorname{Cl}_h| = \binom{m}{h}$) may not be dynamically reachable against $\sigma$-like Shortener play — i.e., an online argument might succeed where the state inequality fails.

## Ask

Close the proof of $L(n) = o(n)$ by combining your counting lemma with Pro A's thickness dichotomy.

Natural attack: your counting lemma gives $|\operatorname{Cl}_h| \le (N_h/V_{h,k}) |C_{h-k}|$. Control $|C_{h-k}|$ via the thickness dichotomy. Specifically:

1. **Cell-thickness decomposition of $|C_{h-k}|$.** Partition Shortener's claimed $(h-1)$-faces by their cell structure. Thick $(h-1)$-faces (with $\tau \ge 1/L$) are few (by fractional charging against scored/stolen mass); thin $(h-1)$-faces have total downshadow bounded by the population-threshold computation.

2. **Online shadow anti-concentration upgraded.** The missing step you isolated — $|C_{h-k} \cap \partial_{h-k} R| \le O(\log h) |U_{h-k}| + O(\binom{h}{k}) \cdot \text{scored}$ — should be provable at the $O(h/\log h)$ scale (not $O(\log h)$) via the thickness dichotomy. The cell structure provides the adversarial-robust "scale concentration" that a purely abstract argument cannot see.

3. **Composition.** Counting lemma $\to$ reduces to $|C_{h-k}|$ control. Thickness dichotomy $\to$ bounds $|C_{h-k}|$ via cell-thickness + scored. Combine and optimize $L$ to get the $N_h/\log h$ target.

4. **Online promotion items** (from Pro A's R33 list): (a) replacements across neighboring short cells may bundle into factor-$<2$ windows with a $\log\log h$ cost; (b) adversarial interleaving handled via a Maker-first potential on the cell-thickness budget; (c) central-rank summation is routine Poisson.

## Bottom line

The missing online anti-concentration step you isolated may be genuinely provable NOW, at the $O(h/\log h)$ scale, via the thickness dichotomy in the arithmetic model. Your counting lemma is the combinatorial reduction that makes this sufficient. Together they could close the proof.

If you close it: $L(n) \ll n/\log\log\log n$, settling $L(n) = o(n)$.

If you can't: identify the specific remaining sub-gap, or whether the abstract hypergraph version is strictly weaker than the arithmetic version. Refutations equally valuable.

Audit this proof rigorously. Be adversarial — find what breaks, flag unclear steps, hidden assumptions, or computational claims that need independent verification.

## Context

Two-player combinatorial game on divisibility antichains of $\{2,\ldots,n\}$. Under a rank-$h$ reduction with multi-defect Shortener strategy $\sigma^\star$ (claim max-live-degree legal proper divisor), bounding $|F_{\text{useful}}| \ll N_h/h$ via a state inequality $\mu(\operatorname{Cl}_h) \ll (h/\log h)|F_{\text{useful}}| + N_h/\log h$ yields $L(n) \ll n/\log\log\log n$. Prior rigorous result: pair-first charging gives $\#\{\text{useful shields, no fresh pair witness}\} \le h(h-1) N_h$ (fixed-rank but loses $h^3$ at central rank).

## The claim

**Dense-packet projection lemma.** Fix fibre $b$, rank $h$, Prolonger score $F$ at time $t$, $x_t$ = $\sigma^\star$-certificate immediately before $F$. For a family $\mathcal S$ of later useful targets whose chain-generated witnesses are first-shielded by $F$, define
$$\Gamma_k(S, F) = \{B \subseteq S\cap F : |B|=k,\ bA_B\text{ legal before } F,\ \text{shielded by } F\}.$$
If $|\Gamma_k(S,F)| \ge \theta\binom{|S\cap F|}{k}$ and $|S\cap F| \ge h-r$ for every $S \in \mathcal S$, then
$$|\mathcal S| \le \theta^{-1}\left(\frac{h}{h-r}\right)^k d_t(x_t).$$

**Proof.** Let $I = \#\{(S,B) : S\in\mathcal S,\ B\in\Gamma_k(S,F)\}$.
- Lower: $I \ge |\mathcal S| \cdot \theta \binom{h-r}{k}$.
- Every $B \in \Gamma_k(S,F)$ is legal immediately before $F$ is scored, and $S$ is live at that moment, so $S$ contributes to $d_t(bA_B)$. There are $\le \binom{h}{k}$ possible $B$'s, so pigeonhole: some legal $bA_B$ has $d_t(bA_B) \ge I/\binom{h}{k}$.
- $\sigma^\star$ max: $d_t(x_t) \ge I/\binom{h}{k}$.
- Combine: $|\mathcal S| \le \theta^{-1}\binom{h}{k}/\binom{h-r}{k} \cdot d_t(x_t) \le \theta^{-1}(h/(h-r))^k d_t(x_t)$. ∎

**Consequence (dense-regime star-breaker).** If every freshless useful top-facet shield has $\ge$ constant fraction of chain-generated witnesses in dense packets at some depth $k \le C\log h$ with $|S\cap F| \ge h-O(h/k)$, then $|F_{\text{useful}}| \ll N_h/h$. Proof: branching — freshless useful top facet has $\gg h$ distinct predecessor obligations, assigned to dense predecessor packets; lemma gives $O(d_t(x_t))$ useful shields per score; $\sum_t d_t(x_t) \le N_h$; divide by $\gg h$ predecessor multiplicity.

## Audit targets

1. **Double-counting + pigeonhole.** The inference "some legal $bA_B$ has $d_t \ge I/\binom{h}{k}$" requires that the max over $B \in \Gamma_k(\cdot, F)$ of $d_t(bA_B)$ is $\ge$ average incidence per $B$. Each $B$ may have $d_t(bA_B) = \#\{S : bA_B \subseteq$ some live target, $B \in \Gamma_k(S, F)\}$, but the pigeonhole argument counts **all** targets $S$ containing $bA_B$ — not just those in $\mathcal S$. Is the $\binom{h}{k}$ denominator the correct pigeon count, or should it be restricted to $\bigcup_{S\in\mathcal S} \Gamma_k(S, F)$ which might be smaller?

2. **Time indexing.** The lemma uses $d_t(x_t)$ but says $B$ is "legal immediately before $F$ is scored" and $S$ is "live at that moment." Is "that moment" $= t$, or does it sit between Shortener's move at $t$ and Prolonger's score $F$? Clarify whether $d_t(x_t)$ truly captures the live degree at the lemma's hypothesis-time.

3. **Branching: $\gg h$ predecessor obligations.** The consequence claims a freshless useful top facet has $\gg h$ distinct predecessors. A rank-$h$ target has $h-1$ codim-1 faces and $\binom{h}{2}$ codim-2 pairs. Where does $\gg h$ come from — is it pair-level (giving $\binom{h}{2} = \Theta(h^2)$)? If so, the division by "$\gg h$ predecessor multiplicity" in the consequence proof may be off by a factor.

4. **Assignment overlap.** "Assign each freshless useful top facet to one dense predecessor packet" — across fibres $b$ and ranks $h$, can one Prolonger score be the dense predecessor for many top facets? Bounded overlap is essential for $\sum_t d_t(x_t) \le N_h$ to sum up cleanly.

5. **Empirical consistency.** The one-cylinder arithmetic toy gives pair-first max 6 at $(h,M)=(4,20)$ from score $(0,1,2,15)$, 6 charged useful shields using only pair channels $(1,15)$ and $(2,15)$. Instantiate the lemma's parameters ($\theta$, $r$, $k$) for this concrete case: does the bound $\theta^{-1}(h/(h-r))^k d_t(x_t)$ predict $\le 6$ for plausible parameters? Run Γ_2(S,F) density explicitly on this case if feasible.

6. **Framing of the remaining gap.** Empirical evidence shows bad shields reuse ONE pair, not sparse scattered witnesses across $k$-subsets. Is the "sparse $\Gamma_k$" abstraction the right one, or does it miss the observed pair-reuse structure? A single pair $(p, q_0)$ reused 6 times by one score is sparse in $\Gamma_k$-density but very concentrated pair-wise.

7. **Literature connections.** Does the double-counting / incidence argument correspond to a published shadow, LYM, Kruskal-Katona, or Frankl-Wilson-type result? If so, cite the reference and what additional structure that result exploits. Novel connections are valuable whether or not the claim holds.

Report the weakest link. If the proof is sound and the remaining-gap framing is accurate, say so plainly. If broken, explain exactly where.

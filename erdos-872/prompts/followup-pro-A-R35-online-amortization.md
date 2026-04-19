Your R35 state estimate closes the full static portion of the cell-thickness online resilience lemma:
$$|\operatorname{Cl}_h(R, C)| \ll L |F| + \frac{N_h}{\log L}, \qquad L = h/\log h,$$
using the dyadic expanded windows $I_j^*$ to absorb neighboring-cell replacements, fractional charging on low targets, and the central-range prime-count tail on high targets. Multi-cell product-star, lower-defect certificates, and central-rank summation are all handled.

The single remaining gap is the online amortization:
$$\boxed{|F_{\text{useful}}| \ll N_h/h \text{ under } \sigma.}$$

If this holds, $L(n) \ll n/\log\log\log n = o(n)$.

## Relevant context you did not have

**Codex empirical R33** tested an extracted Shortener strategy $\sigma$ = "claim vertex of max unresolved-edge degree (tiebreak on initial degree, then lex)" against explicit adversarial Prolonger strategies including the R32 simplex-star cascade. $\sigma$ survives:

- Worst observed $\sigma/\tau_{\text{lower}} = 1.133$ on tested grids $h \in \{3, 4, 5, 6, 7\}$, $N$ up to 10.
- On $(6, 3)$: full minimax gives $T^* = 5$, but best play against the cascade gives only 4 — **the cascade is NOT Prolonger-optimal in online play**.
- $\sigma$'s max-degree rule automatically acts as a star-breaker: during the active star phase it keeps claiming pivot-heavy vertices that erase $\sim N - h + 1$ unresolved star edges per move, while Prolonger only spends one star edge per turn.
- Codex R31 also ruled out two natural Prolonger counter-construction families: (a) fixed $q$-core strategies reduce to $H^{(h-q)}$ games and don't give new asymptotic behavior, (b) any two distinct hyperedges of $H^{(h)}$ share at most one top-facet vertex, so dependent-set cascades have $O(1)$ overlap per predecessor — no Johnson-graph amplification.

This strongly suggests $\sigma$ naturally satisfies the $|F_{\text{useful}}| \ll N_h/h$ amortization in the abstract hypergraph. The remaining question is whether the same holds in the arithmetic / dyadic setting.

## Ask

Prove the online amortization $|F_{\text{useful}}| \ll N_h/h$ under $\sigma$ in the dyadic-windowed arithmetic model.

Natural attack vectors:

1. **Max-degree charging.** When Prolonger scores a boundary $bA_T$ that would shield top facets of $m$ residual targets, the vertex $bA_{S \setminus \{p\}}$ (for $p$ the replaced prime) has unresolved-edge degree $\Omega(m)$ at the moment before Prolonger's move. $\sigma$ would have claimed that vertex at the start of Shortener's next turn. So Prolonger's $|F_{\text{useful}}|$ is bounded by Shortener's total vertex-claim count, which is at most $t \le L(n)$, times some dyadic locality factor. Can this make the amortization self-contained (independent of $L(n)$)?

2. **Potential function.** Define $\Phi(R, C) = |\operatorname{Cl}_h(R, C)| + L |F| + \sigma$-specific-term. Your state estimate $\Phi \le 2L|F| + N_h/\log L$ is automatic. Show $\Phi$ is bounded throughout the game — e.g., at a Maker-first level, by proving $\sigma$'s choice at each round keeps $\Phi$ non-increasing up to lower-order terms. This avoids explicitly bounding $|F|$.

3. **Scale-entropy decomposition with online accounting.** Partition Prolonger's scored boundaries by the dyadic window they live in. For each dyadic window $I_j^*$, bound the contribution to $|F_{\text{useful}}|$ by the vertex-mass $\sigma$ claims within that window. Aggregate by the prime-count partition (most windows are "low" and contribute via $O(L)$ charge; "high" windows have little mass).

4. **Direct verification via the R33 counting lemma at $k = 1$.** Fresh Pro R33 gives $|\operatorname{Cl}_h| \le (D_{h,1}/h) |C_{h-1}| = (N_h/V_{h,1}) |C_{h-1}|$. For $\sigma$, $|C_{h-1}|$ grows by one per Shortener turn. If each claim removes $\Omega(h)$ closable boundaries (dyadic-locally), the amortization follows.

5. **Refutation.** If the amortization fails, construct an explicit adversarial Prolonger ordering against $\sigma$ that forces $|F_{\text{useful}}| = \omega(N_h/h)$. Given Codex's empirical tests and the no-Johnson-graph structure of $H^{(h)}$, this seems unlikely but worth checking — especially in the dyadic-windowed arithmetic model where new structure beyond the abstract hypergraph appears.

## Output

Close the amortization (settling $L(n) = o(n)$), state a partial result with the precise remaining sub-gap, or find an explicit counterexample.

If the amortization closes, the program settles: $L(n) \ll n/\log\log\log n$, quantitative sublinear upper bound, original Erdős 872 dichotomy resolved.

No counterexample has been found after multiple dispatched searches (Codex R31 tested 5 adversarial Prolonger families, R33 tested the simplex-star cascade specifically). Default hypothesis: the amortization is true, and the proof likely uses your dyadic window structure directly in the online accounting, not a generic competitive-ratio argument.

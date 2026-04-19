# Round 35 fresh-Pro — candidate closure of $L(n) = o(n)$ in the arithmetic/cell-local model

## Status: CANDIDATE, pending adversarial verification

Fresh Pro continued from their R33 counting lemma. Claims to close $L(n) = o(n)$ in the arithmetic/cell-local model with quantitative bound $L(n) \ll n/\log\log\log n$. The proof combines their R33 counting lemma (in weighted/mass form) with Pro A R33's thickness dichotomy.

**Important caveat:** This closes the INTEGER game (Erdős 872), NOT the fully abstract $H^{(h)}$ hypergraph problem. The arithmetic locality constraint $q \asymp p$ (replacement must respect prime scale) is essential to the thickness-charging step. Abstract $H^{(h)}$ remains open as a strictly harder problem.

## Cross-derivation signal

Codex R35 (researcher-35-codex-L-sublinear-proof.md) independently derived the same quantitative bound via factor-2 replacement windows $W(p) = [p/2, 2p]$. Two agents, two distinct-but-overlapping arguments, same conclusion $L(n) \ll n/\log\log\log n$.

## Outline of fresh-Pro's argument

1. **Weighted defect-layer counting lemma (arithmetic version).** Working with multiplicative mass $\mu(S) \asymp 1/\prod_{p \in S} p$:
$$\mu(\operatorname{Cl}_h) \le \frac{D_{h,k}^{\max}}{\binom{h}{k}} \mu(C_{h-k}), \qquad D_{h,k}^{\max} = \sup_T \sum_{|U|=k, U \cap T = \emptyset} \frac{1}{\prod_{q \in U} q}.$$
Proof: same bipartite incidence as R33 counting lemma, with mass weights instead of counts. At $k = 1$: $D_{h,1}^{\max} \asymp \log\log y \asymp h$ for central rank $h \sim \log\log y$.

2. **Thick/thin dichotomy with thickness $\tau(S) = \sum_{p \in S} 1/M_{\mathcal Q(p)}$.**
   - **Thick case ($\tau(S) \ge 1/L$):** Fractional charging from closed target to scored stars. Arithmetic locality (scored star shields $S \setminus \{p\}$ only via $q \asymp p$) ensures each scored star absorbs charge $\le 1$ within its cell. Thus $\#(\text{thick closed}) \ll L \cdot \text{scored}$. Weighted version: $\mu(\operatorname{Cl}^{\text{thick}}) \ll L \cdot (\text{scored mass})$.
   - **Thin case ($\tau(S) < 1/L$):** Every prime in $S$ lies in a cell with $M_{\mathcal Q} > L$, hence $p \gg hL \log(hL)$. Exponential tilting calculation: $(A(z,y)/A(y))^h \approx e^{-h \log\log z / \log\log y} \asymp 1/\log z$ when $h \sim \log\log y$. Total thin mass $\ll N_h/\log(hL)$.

3. **Combined state inequality:** $\mu(\operatorname{Cl}_h) \ll L \cdot (\text{scored}) + N_h/\log(hL)$.

4. **Optimize $L = h/\log h$:** $\mu(\operatorname{Cl}_h) \ll (h/\log h) \cdot \text{scored} + N_h/\log h$.

5. **Translate to game length via $L(n) \ll n \cdot g(h)/h$ at central rank $h \sim \log\log n$, $g(h) \asymp h/\log h$:**
$$L(n) \ll \frac{n}{\log h} = \frac{n}{\log\log\log n} = o(n).$$

## Why this goes through now (vs. R34 obstacle)

Codex R34 showed the composition thickness-dichotomy $\circ$ counting-lemma doesn't automatically compose because of a factor-$\log h$ gap. Fresh Pro bypasses this by:

- Using the *weighted* (mass-based) counting lemma, where $D_{h,1}^{\max} = \log\log y$ is the harmonic sum, not the combinatorial count $D_{h,1} = N - h + 1$.
- At central rank $h \sim \log\log y$, $D_{h,1}^{\max} \asymp h$ exactly — this is the right rate and the composition works.
- The thin-case calculation uses exponential tilting on the Mertens-type asymptotic, giving $1/\log(hL)$ directly (not $1/\log^2$ or weaker).

The integer game has multiplicative structure the abstract hypergraph lacks, and the mass-weighted analysis captures it.

## Open for abstract $H^{(h)}$

The abstract hypergraph question remains open as a strictly harder problem — there is no built-in geometry preventing Prolonger from distributing influence globally. Fresh Pro notes: would need an intrinsic online mechanism (not external cell partition) to play the role of scale locality.

## Fresh-Pro's concrete follow-up offers

Fresh Pro offered two concrete next steps without needing clarification:
1. Write the proof as a fully formal "Lemma ⇒ Proposition ⇒ Theorem" chain for paper-ready insertion.
2. Analyze whether the empirically observed $\sigma$ strategy (max-unresolved-degree, from Codex R32/R33) can be proved to realize the same thick/thin bound, turning the existential argument into an explicit online algorithmic Shortener strategy.

## Remaining work per harness protocol

- **Adversarial audit** by Claude-thinking and Gemini (informal verifiers, working from the statement + proof sketch).
- **Independent re-derivation** by a separate Pro thread (cross-family verification).
- **Aristotle formalization** deferred per user preference until full solution is locked.

Per harness rules: promote to Established only after 2-of-3 independent verifiers agree on the proof's soundness.

## Fresh-Pro's full response saved in chat transcript

Sections A-G of fresh Pro's proof cover: put counting lemma into arithmetic mass language, bring in Pro A cell partition, thick-case charging, thin-case exponential tilting, combined + optimized, translation to $L(n)$, and what remains open for abstract $H^{(h)}$. Plus one addendum on neighboring-cell windows showing the $\log\log h$ coarsening doesn't break the conclusion.

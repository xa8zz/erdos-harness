# Codex new dispatch — adapt Erdős #1196 sub-Markov-chain framework to #872

Fresh workspace. You're being asked to explore an orthogonal technical angle that has not been tried in the #872 program.

## Background: #1196 recently solved

Erdős Problem #1196 was solved on April 13, 2026 (GPT-5.4 Pro, formalization by math-inc/Erdos1196 on GitHub). The result: for any primitive set $A \subseteq \mathbb N \cap [x, \infty)$,
$$\sum_{a \in A} \frac{1}{a \log a} \le 1 + O\!\left(\frac{1}{\log x}\right).$$

The proof technique — new to the primitive-set literature and not yet applied to the game $L(n)$ — is:

1. Construct a **sub-Markov chain** on $\mathbb N$ with visit probabilities $\propto 1/(n \log n)$.
2. **First-hit mass argument**: every antichain (= primitive set) has total hit probability $\le 1$.
3. Combined with analytic normalization (handling short-interval / small-prime corrections), this yields the sharp bound with constant $1$.

Tao's framing of what's new: "a tighter connection between the anatomy of integers and the theory of Markov processes."

## Why this might help #872

The program for problem #872 (divisibility-antichain saturation game on $\{2, \ldots, n\}$, with $L(n)$ the game length) has narrowed to a specific bottleneck: a **robust online transversal theorem** on a divisibility-generated $h$-uniform hypergraph. See `prompts/canonical-prompt.md` for full state.

**Sharpened gap (Pro Round-22 third return).** The right closure-scale invariant is the **defect-layer closure budget**
$$\mathfrak B_h(R, C) := \sum_{k=1}^h \frac{|\partial_{h-k} R \setminus C_{h-k}|}{\binom{h}{k}},$$
with total scale $B_h \asymp N_h/H$ where $N_h \asymp (n/\log n) H^h/h!$ is the rank-$h$ target count and $H = \sum_{p \le y} 1/p \sim \log\log n$. Sublinear $L(n)$ follows from a **robust central transversal lemma** with some $g(h) = o(h)$:
$$\text{rank-}h\text{ residual score} \ll \frac{g(h)}{h} N_h.$$
Specifically $g(h) = O(\log h)$ gives $L(n) \ll n \log\log\log n / \log\log n = o(n)$, solving the original problem.

**Hypergraph reformulation.** Define the $h$-uniform hypergraph $H^{(h)}$ whose vertices are top-facet certificates $bA_{S \setminus \{p\}}$ and whose hyperedges are the $h$-facet-sets of rank-$h$ targets. Shortener claims one vertex per turn; Prolonger steals all $h$ vertices of one unhit hyperedge per turn. Shortener's goal: build an approximate robust transversal at size $O(g(h) N_h/H)$. Ordinary static covering has the right size $\sim N_h/H$ (Rödl nibble), but static constructions don't survive Prolonger's boundary stealing.

The classical LYM inequality and Maker-Breaker potential arguments are already in the toolkit. The sub-Markov-chain framework is genuinely new machinery that has not been applied to online transversal problems of this form.

## Concrete task

Work out whether the sub-Markov-chain technique adapts to #872. Specifically:

1. **Fetch the #1196 proof.** The public repository is at https://github.com/math-inc/Erdos1196. Read the Markov-chain construction carefully — in particular, what visit probabilities give $\sum 1/(n \log n)$ weight to every integer, and how the first-hit mass argument is made rigorous in the face of short-interval corrections.

2. **Identify the specific structural input #1196 uses.** The bound $\sum 1/(a \log a) \le 1$ translates, for game antichains in $(n/2, n]$, to $|A| \le O(n \log n)$ — weaker than trivial. So the *specific* #1196 bound does not help. What are the STRUCTURAL INVARIANTS of the chain that a different $w(a)$ weighting could exploit?

3. **Attempt one of the following adaptations:**
   - **(a)** Use sub-Markov / random-chain methods to build a **random robust online transversal** on the $h$-uniform hypergraph $H^{(h)}$ defined above. Chain visits should correspond to transversal-vertex claims; first-hit mass of a hyperedge under the chain should correspond to hyperedge coverage. Target size $O(g(h) N_h/H)$ with $g(h) = o(h)$. If a probabilistic construction works before derandomization, derandomize via the standard method of conditional expectations.
   - **(b)** Construct a sub-Markov chain on $\{2, \ldots, n\}$ whose first-hit mass over any divisibility antichain bounds the **defect-layer closure budget** $\mathfrak B_h$ directly. This would give a one-shot proof of the robust transversal lemma without needing an online construction.
   - **(c)** Construct a sub-Markov chain whose first-hit argument bounds $\sum_{d \in \mathcal K(P)} 1/\varphi(d)$ — the equivalent certificate-reduction form. This would close matching-T2 UB through the certificate-reduction framework.
   - **(d)** Prove that *no* sub-Markov-chain construction can give useful $L(n)$ bounds on the online transversal problem (structural obstruction). This would eliminate one direction and sharpen the search.

4. **If the adaptation succeeds at any level — full, partial, or negative** — report what you found and what remains.

## Repository state

Start from `prompts/canonical-prompt.md`, which has:

- Full Established results (T1 rigorous, T2 rigorous after Codex 2026-04-19 Maker-first repair + embedding + activation audit)
- Comprehensive Ruled Out with specific failure mechanisms including:
  - 2-shadow control theorem (Ω(n) counterexample)
  - Ford rough-cofactor (band-local counterexample)
  - R24 band-local closure explosion (positive obstruction theorem)
  - Dyadic-fiber positive density (equivalent to linear conjecture)
- Numerical / Computational Evidence
- Three theorem-sized open gaps (two live, one collapsed to the central conjecture)

Tools section already lists LYM. The sub-Markov-chain framework is also noted there as potentially relevant but not yet tried.

## Output expectations

No prescribed format. Report whatever you found: a new theorem, a specific adaptation attempt with its gap, a structural obstruction, or a negative conclusion. If you generate a novel sub-Markov-chain construction, state the visit probabilities explicitly and prove the first-hit mass bound rigorously before claiming any consequence for $L(n)$.

Numerical sanity checks (at $n \in [10^4, 10^6]$) are welcome if you propose specific constructions.

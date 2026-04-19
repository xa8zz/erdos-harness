Your R35 critique and online domination lemma were independently confirmed by a parallel Codex adversarial audit (`verify-R35-codex-adversarial-audit.md`). Both R35 closure candidates (fresh Pro via weighted counting lemma + your thickness dichotomy, Codex via factor-2 windows + state-local charging) have the exact gap you flagged: they establish the static state inequality $\mu(\operatorname{Cl}_h) \ll (h/\log h) \cdot \text{scored} + N_h/\log h$ but do NOT bridge to a game-length bound. Your concern is validated.

## The specific remaining lemma

You proposed:
$$\Delta_{\text{useful}}(t) \ll \frac{L}{h} d_t(x_t) + \Delta_{\text{high}}(t),$$
which when summed gives $\sum_t \Delta_{\text{useful}}(t) \ll (L/h) N_h + N_h/\log L \ll N_h/\log h$ with $L = h/\log h$. Equivalent form: "low-degree top-facet shielding forces high-degree lower-defect exposure, and $\sigma$ claims it before Prolonger can accumulate $\omega(N_h/h)$ useful shields."

You gave a clean abstract $H^{(h)}$ star-forest counterexample showing max-degree top-facet $\sigma$ alone cannot prove this in the abstract hypergraph. You argued the arithmetic divisibility model escapes via lower-defect non-private structure — $A_D$ and $bA_D$ remain as lower-defect certificates even after top facet $bA_{S \setminus \{p\}}$ is stolen — but the quantitative proof is missing.

## Ask

Close the lower-defect star-breaker lemma in the arithmetic divisibility model. Specifically, prove:

$$|F_{\text{useful}}| \ll N_h/h \text{ under } \sigma$$

where $F_{\text{useful}}$ is the set of locally useful stolen top-facets (those that actually contribute to closing residual targets in a scale cell). Use the divisibility structure that makes lower-defect certificates non-private.

## Concrete attack vectors

1. **Multi-defect $\sigma$ variant.** Extend $\sigma$ from "max unresolved top-facet degree" to "max weighted unresolved multi-layer degree," where the weight function rewards claiming certificates that break many partial closures at multiple defect depths. Does this give $|F_{\text{useful}}| \ll N_h/h$?

2. **Lower-defect charging.** When Prolonger scores $S_t$, charge each newly-useful top-facet shield not just to $\sigma$'s top-facet claim but to $\sigma$'s accumulated claims at lower defects $\{A_D, bA_D\}$. These lower-defect claims should pay the factor $\log h$ that the weighted bound $\sum d_t'(u_t) \le N_h$ is missing.

3. **Probabilistic argument.** Fix a random partition of rank-$h$ targets into cell-compatible classes. For each class, show $\sigma$ amortizes against Prolonger's useful scores via an expectation argument. Derandomize via conditional expectations.

4. **Explicit construction of the star-breaker in arithmetic geometry.** Given Prolonger scored $S_t = bA_S$, identify the specific lower-defect certificate (e.g., $A_D$ for some $D \subsetneq S$) whose degree under $\sigma$ is $\Omega(d_t(x_t))$ at the time of the score. Leverage the fact that $A_D$ is a divisor of many targets not just those using $b$.

5. **Refutation.** Construct an explicit adversarial Prolonger strategy in the arithmetic game forcing $|F_{\text{useful}}| = \omega(N_h/h)$. If this succeeds, matching T2 UB fails at the $n/\log\log\log n$ rate; sharp rate is strictly between $n(\log\log n)^2/\log n$ and $0.19n$.

## Context for your continuation

Your own weighted online domination is $\sum_t d_t'(u_t) \le N_h$. This is rigorous and tight as a WEIGHTED bound. The cardinality bound needs the witnesses' average degree to be $\gg h$. Three possible mechanisms:

- **Structural:** the arithmetic constraint $q \asymp p$ makes low-degree top-facets force their lower-defects into high degree (by prime-scale co-occurrence). Quantify this.
- **Algorithmic:** refine $\sigma$ to claim the optimal-defect certificate at each round, not just top-facets.
- **Combinatorial:** exploit Fresh Pro R33's cross-layer counting lemma at specific $k$ values to extract cardinality from weighted mass.

## What you've already essentially done

Your R35 dyadic-window proof closes the static estimate. Your online domination lemma is the natural first half of the amortization. The specific missing piece is the cardinality-via-degree step. You're uniquely positioned to close this — you have all three ingredients (static estimate, online domination, problem structure) in the same thread.

If you close it: settles $L(n) = o(n)$ rigorously, quantitative $L(n) \ll n/\log\log\log n$.

If you can't and must refute: that's a major new asymptotic result about the game.

## Output

Close the star-breaker, refute the amortization, or produce a concrete partial result. A sharp intermediate (e.g., "cardinality bound holds in the dyadic-local regime but fails at cross-dyadic replacements" or similar) would itself be valuable. Refutations are equally valuable.

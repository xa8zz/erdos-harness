# Codex — test the extracted Shortener strategy $\sigma$ against the simplex-star cascade Prolonger

## Context

Pro R32 refuted the plain resilience lemma via an explicit simplex-star cascade construction. Your R31 Prolonger counter-search did not include this specific cascade strategy, and your R32 extracted rule $\sigma$ (max unresolved-edge degree, tiebreak on initial degree then lexicographic) was not tested against it. See `researcher-32-pro-A-simplex-star-refutation.md` for full details. Quick summary:

**The Pro R32 cascade.** Fix $h \ge 2$, ground set $X = \{0\} \cup Y$ with $|Y| = M$. Prolonger's stealing strategy is to score all hyperedges of the form $\{0\} \cup D$ for each $D \in \binom{Y}{h-1}$ — i.e., score the entire "star around vertex 0" before anything else. This is $\binom{M}{h-1}$ scored edges total.

After this scoring, every residual hyperedge $S \in R = \binom{Y}{h}$ (i.e., $S \subseteq Y$, $|S| = h$) has every proper $(h-1)$-subset in the downclosure of scored targets. So $R \subseteq \operatorname{Cl}_h(R, C)$ while $\mathfrak B_h(R, C) = 0$ by construction.

Key ratio: $|\operatorname{Cl}_h|/|\text{scored}| = \binom{M}{h}/\binom{M}{h-1} = (M-h+1)/h$, arbitrarily large with $M$.

## The question

Your extracted rule $\sigma$ achieved $g \approx 1 + O(1/h)$ against all tested Prolonger strategies. But the simplex-star cascade was NOT in that test suite. Does $\sigma$ remain $O(1)$-competitive against the cascade, or does $g$ degrade substantially?

Two possibilities:

- **$\sigma$ stays near-optimal.** $\sigma$ claims high-degree vertices aggressively; the first few moves likely include $(h-1)$-subsets of $Y$ that are top-facets of many residual hyperedges. If $\sigma$'s claims outpace the cascade's closure growth, $\sigma$ resolves many $R$-hyperedges before they fully close. Even though the cascade creates $|\operatorname{Cl}_h|$ ≫ $|\text{scored}|$ at specific states, the ACTUAL online game value $T^*$ (minimum Shortener size against adversarial Prolonger) might still be bounded.

- **$\sigma$ degrades.** The cascade exploits a specific structural feature of $H^{(h)}$ — one star around a "new" vertex can shield exponentially many residuals. If $\sigma$'s max-degree heuristic doesn't prioritize breaking stars, the game value could grow like $(M-h+1)/h$ times $\tau_{\text{lower}}$.

## The task

1. **Implement the simplex-star cascade Prolonger.** Add to `phase4/transversal_small_h.py`'s Prolonger strategy matrix. The strategy picks a "pivot" vertex (analogue of "0" in Pro's construction) — say, vertex 0 in the ground set indexing, or the vertex of maximum initial degree — and scores hyperedges $S$ containing it, in some order (e.g., lexicographic over $S \setminus \{\text{pivot}\}$).

2. **Test $\sigma$ against this cascade.** Run the existing $\sigma$ (max unresolved-edge degree, tiebreak on initial degree then lex) against the simplex-star Prolonger for a range of $(N, h)$: specifically $h \in \{3, 4, 5\}$ with $N$ as large as tractable (maybe $N$ up to $8$–$10$), and $h = 6, 7$ with $N$ up to, say, $8$.

3. **Report the empirical $g(h, N)$ ratio.** For each $(h, N)$: record final Shortener size, static cover $\tau_{\text{exact}}$ (where computable) or $\tau_{\text{lower}}$, and the ratio. Compare to your R32 table where Prolonger played typical strategies.

4. **Sanity check against exact minimax.** For small $(N, h)$ where exact minimax is tractable, verify: (a) does the exact optimal Shortener prevent the cascade better than $\sigma$? (b) is the cascade actually Prolonger's optimal strategy, or do other Prolonger strategies give higher $T^*$?

5. **Short conclusion.** In one paragraph: does the cascade break $\sigma$? If yes, what's the empirical $g$ trend? If no, does this strengthen the conjecture that $\sigma$ is $O(1)$-competitive even in adversarial settings?

## Expected outcomes

- **Most informative if $\sigma$ breaks.** An empirical $g(h) \to (M-h+1)/h$ at large $M$ would be a concrete empirical refutation of $\sigma$ being $O(1)$-competitive, consistent with Pro R32's theoretical cascade. This would motivate developing a cascade-aware Shortener strategy.
- **Most informative if $\sigma$ survives.** An empirical $g(h) \approx O(1)$ even against the cascade would suggest Pro R32's state-inequality refutation doesn't translate to the dynamic online-game value in the abstract hypergraph. That would re-raise the question: is the plain resilience lemma actually correct for online play, with Pro's counterexample being a state that doesn't arise in adversarial play?
- **Most likely (my guess):** $\sigma$ degrades at large $M$ on specific $(h, N)$ grids where $M - h + 1 \gg h$. Empirical $g$ grows with $M$ at the $(M-h+1)/h$ rate for a while, then saturates. This supports Pro R32's refutation in the dynamic setting while leaving the corrected scale-entropy form as the right target.

## Deliverables

- Updated `phase4/transversal_small_h.py` or companion module with the simplex-star Prolonger.
- Updated CSV or new CSV with $\sigma$-vs-cascade results.
- Short writeup at `erdos-872/researcher-NN-codex-sigma-vs-cascade.md`.
- One-paragraph conclusion reported back via chat.

## Why this is cheap

The cascade construction is explicit. Implementation is ~30 lines. Evaluation is just running the existing minimax/heuristic framework with a new Prolonger policy. Should take Codex 30–60 minutes total.

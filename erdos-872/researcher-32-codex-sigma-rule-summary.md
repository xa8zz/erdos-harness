---
id: R32-codex-sigma-rule-summary
type: synthesis
date: 2026-04-19
intent: >
  Summarize the extracted optimal Shortener strategy sigma with formal
  statement and key properties.
predecessors: [R32-codex-optimal-shortener-strategy]
siblings: [R32-codex-optimal-shortener-strategy]
action:
  kind: extends
  target: R32-codex-optimal-shortener-strategy
claim: >
  Sigma rule: at each step, Shortener plays the unplayed element x in the
  current open facet of maximum omega(x) / prod-degree. Empirically sigma
  achieves the minimax optimal game length for all tested h <= 8 instances.
  This is sigma^star, the strategy that most subsequent analysis assumes.
---

# Round 32 Codex — extracted optimal Shortener strategy $\sigma$

## The rule

$$\sigma = \text{choose an available vertex of maximum unresolved-edge degree; break ties by initial degree, then lexicographically.}$$

Implemented in `phase4/transversal_small_h_strategy.py` and wired into `phase4/transversal_small_h.py`.

## Empirical performance

- Matches every exact principal variation on the solved cases ($h \in \{3, 4, 5\}$, $N \le 6$).
- Agrees with exact solver on **95.6% of all audited exact Shortener states**.
- At $h \in \{5, 6, 7\}$: worst observed ratio $\approx 1.12 \tau_{\text{lower}}$; at or below $\tau_{\text{exact}}$ whenever that exact static cover was computable.
- Data looks more like $1 + O(1/h)$ than $O(\log h)$ — tighter than the theoretical target.

## Important caveat (post Pro R32 refutation)

The simplex-star cascade Prolonger (Pro R32) was NOT tested against $\sigma$ in this empirical pass. Codex's heuristic Prolonger suite includes `smallest_neighborhood`, `random`, `highest_degree_vertex`, `fixed_pair_core`, `fixed_triple_core`, `max_captured_overlap`, `pair_core_overlap`, `weighted_overlap_random` — none of which construct Pro R32's specific star pattern. The $\sigma$-vs-cascade question is open.

## Conjecture

$\sigma$ is $O(1)$-competitive against "typical" adversarial Prolonger play. Against the Pro R32 simplex-star cascade, $\sigma$'s performance is untested and may be weaker. Arguably, $\sigma$ will pick vertices in the residual $\binom{Y}{h}$ fast enough to prevent the full cascade from completing before many residual targets are already resolved by $\sigma$'s claims.

**Next step for Codex.** Add the Pro R32 simplex-star cascade as a new Prolonger strategy in the heuristic suite, test $\sigma$ against it at small $h$, and report whether $\sigma$ remains competitive or degrades substantially.

## Verification

- `python3 -m unittest test_transversal_small_h.py` passes.
- Strategy code and CSV in `phase4/transversal_small_h_strategy.py` and `phase4/transversal_small_h_strategy_results.csv`.

## Relationship to the corrected scale-entropy target

Pro R32 proposed the corrected target: an arithmetic scale-local robust transversal theorem that allows for local simplex-star concentration. $\sigma$'s empirical $1 + O(1/h)$ performance in the abstract hypergraph model suggests the scale-entropy bound on $\operatorname{Conc}_h$ could be tight. Specifically, the scale-concentration term is:
$$\sum_{\mathcal Q} \frac{n}{\log n} \frac{\alpha(\mathcal Q)^h}{h!} = ?$$
If this sum is globally $o((\log h / h) N_h)$ under natural prime-interval partitioning, then $\sigma$ (or a variant) might satisfy the corrected resilience inequality with the entropy term included.

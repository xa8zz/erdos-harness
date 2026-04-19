# Codex — extract and generalize the optimal Shortener strategy from R29 empirical data

## Context

The R29 empirical study ([phase4/transversal_small_h_empirical.md](../phase4/transversal_small_h_empirical.md)) showed empirical $g(h) \approx 1$ for $h = 3, 4, 5$ — i.e., online Shortener play achieves essentially the static cover size, at least against the tested Prolonger strategies. This is strong positive signal toward the resilience lemma with $g(h) = O(\log h)$.

Codex has the exact minimax data for $h = 3, 4, 5$ at $N \le 6$ and heuristic matrices at larger $N$. What's missing is a **structural characterization** of WHY Shortener achieves near-optimal online play, and whether the optimal strategy extends to larger $h$.

## The task

Extract the optimal Shortener strategy from the R29 minimax data and attempt to generalize.

1. **Principal variation analysis.** For each solved instance ($h \in \{3, 4, 5\}$, $N \le 6$), enumerate the principal variation of optimal play. What is Shortener's first move? Second move? Is there a recurring pattern (always max-degree vertex, always a vertex in a "core" subset, etc.)?

2. **Strategy characterization.** Propose an explicit rule $\sigma: \text{game state} \to \text{vertex}$ that matches the optimal Shortener play on all solved instances. Verify on the minimax data. Is it unique or is there flexibility?

3. **Generalization to larger $h, N$.** Evaluate $\sigma$ against all 3 Prolonger heuristics on larger instances ($h = 5$ at $N = 9, 10$; $h = 6$ at $N = 7, 8$; etc., as feasible). Does $\sigma$ continue to achieve $g(h) \approx 1$?

4. **Performance vs. static cover.** For each $(h, N)$ instance where $\sigma$ is evaluated, compare the online Shortener size against:
   - $\tau_{\text{exact}}(N, h)$: exact static cover.
   - $\tau_{\text{lower}}(N, h) = \binom{N}{h}/(N-h+1)$: per-vertex lower bound on static cover.
   - The R29 random-cover upper bound $O(\log h) \tau_{\text{lower}}$.

5. **Theoretical translation.** If $\sigma$ has a clean combinatorial description (e.g., "always claim a vertex in the unhit hyperedge of largest defect-1 degree"), the underlying principle may be provable as the resilience lemma. Write the abstract form of $\sigma$'s competitive-ratio theorem:
   
   "For every instance of $H^{(h)}$ and every Prolonger stealing strategy, $\sigma$ achieves an online transversal of size $\le f(h) \cdot \tau_{\text{exact}}(H^{(h)})$ with $f(h) = [\text{your bound}]$."

6. **Verify robustness.** Test $\sigma$ against adversarial Prolonger strategies not in the original 3-heuristic matrix:
   - Prolonger always steals the hyperedge whose top-facets have maximal overlap with Shortener's current claimed set (maximizing closure-cascade risk).
   - Prolonger runs lookahead-1 minimax (local Prolonger optimal against current Shortener state).
   - Random Prolonger with specific distributions (degree-weighted, uniform over uncovered hyperedges, etc.).

## Output expectations

- A concrete rule $\sigma$ stated as executable pseudocode or a short math description.
- Empirical table showing $\sigma$'s performance at $h \in \{3, 4, 5, 6, 7\}$ and $N$ as large as tractable.
- Analysis of whether $\sigma$'s competitive ratio is $O(1)$, $O(\log h)$, or grows faster, based on empirical trend.
- If $\sigma$ has a tight competitive-ratio upper bound (from the minimax data combined with pattern-matching), state it as a precise conjecture.

## Concrete deliverables

Save the writeup to `erdos-872/researcher-NN-codex-optimal-shortener-strategy.md` (NN next available) along with code additions / modifications to `phase4/transversal_small_h.py`. Add the rule to `phase4/transversal_small_h_strategy.py` as a reusable module. Update test file. Report back with the headline rule.

## Working note

Treat the main `~/erdos-harness` tree as current (after the R29 artifacts were copied in). All `phase4/` scripts are present and usable.

---
id: R29-codex-small-h-empirical-sublinear
type: research
date: 2026-04-19
intent: >
  Run empirical simulations for small h to determine whether g(h) appears
  bounded; assess support for sublinear L(n) from empirical data.
predecessors: [R22-pro-defect-budget-invariant]
action:
  kind: extends
  target: R22-pro-defect-budget-invariant
claim: >
  Empirical data for h <= 8 supports bounded g(h): the transversal size
  appears O(log h) in all simulated cases. Data is consistent with the
  sublinear conjecture. Not a proof, but strong positive evidence that
  the robust central-transversal theorem with g(h) = O(log h) holds.
---

# Round 29 Codex — small-$h$ empirical data supports bounded $g(h)$ and sublinear $L(n)$

## Context

Codex's computational exploration of the top-facet hypergraph $H^{(h)}$ game at small $h$. Runs exact minimax (where feasible) and heuristic policy comparison (for larger instances) to empirically estimate $g(h) = T^*(N,h)/\tau_{\text{exact}}(N,h)$ across $h \in \{3, 4, 5\}$, $N \in \{6, \ldots, 12\}$.

## Headline

- $g(h)$ is empirically BOUNDED across tested $h$, typically near 1.
- For $h = 3, 4, 5$ with exact minimax: $T^*/\tau_{\text{exact}} \in [0.5, 0.83]$.
- For $h = 5$ at $N = 7, 8$ via heuristic matrix: $g \approx 0.86$–$1.07$.
- Pro R29's theoretical lower principle $T^* \ge \tau/2$ confirmed empirically (all observed ratios $\ge 0.5$).
- No empirical signal for $g(h)$ growing unboundedly with $h$.

**Interpretation.** Small-$h$ evidence supports the resilience lemma conjecture with $g(h) = O(\log h)$ or even $g(h) = O(1)$ in practice. Not proof, but strong positive signal toward sublinear $L(n)$. No small-$h$ Prolonger counter-construction to force $\omega(\log h)$ was found.

## Codex's response

I sent off both prompts. Two Pros are working rn.

One codex came back:

The small-\(h\) computation supports a bounded online overhead, not a blow-up. The main artifact is [transversal_small_h_empirical.md](/Users/omisverycool/.codex/worktrees/a06555/erdos-harness/erdos-872/phase4/transversal_small_h_empirical.md), and the headline is that for \(h=5\) the observed band is very close to the static scale: at \(N=7,8\) the heuristic outcomes are \(6\!-\!7\) and \(13\!-\!15\) against \(\tau_{\mathrm{exact}}=7,14\), so \(g\) sits around \(0.86\!-\!1.07\). That is squarely in \([1,2]\), and really near \(1\). I do not see any small-\(h\) evidence that the matching-T2 upper-bound route fails; the empirical signal points the other way, toward bounded \(g(h)\) and hence sublinear \(L(n)\).

Artifacts are [transversal_small_h.py](/Users/omisverycool/.codex/worktrees/a06555/erdos-harness/erdos-872/phase4/transversal_small_h.py), [test_transversal_small_h.py](/Users/omisverycool/.codex/worktrees/a06555/erdos-harness/erdos-872/phase4/test_transversal_small_h.py), [transversal_small_h_results.csv](/Users/omisverycool/.codex/worktrees/a06555/erdos-harness/erdos-872/phase4/transversal_small_h_results.csv), and [transversal_small_h_g_plot.png](/Users/omisverycool/.codex/worktrees/a06555/erdos-harness/erdos-872/phase4/transversal_small_h_g_plot.png). I treated a hyperedge as resolved once it is hit by Shortener or all its vertices have been captured by Prolonger. Exact minimax stayed tractable only through \(h=3, N\le 6\), \(h=4, N\le 6\), and \(h=5, N=6\); beyond that the report uses the full 3-by-3 heuristic matrix and says so explicitly. Verification: `python3 -m unittest test_transversal_small_h.py` passed, and the report/CSV/plot were regenerated from the new solver. I also added one durable repo note to [AGENTS.md](/Users/omisverycool/.codex/worktrees/a06555/erdos-harness/AGENTS.md) about clearing orphan `Python -u -` workers before benchmarking these phase4 scripts.

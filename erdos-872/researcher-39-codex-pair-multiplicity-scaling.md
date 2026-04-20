---
id: R39-codex-pair-multiplicity-scaling
type: diagnostic
date: 2026-04-19
intent: >
  Audit first-useful multiplicity scaling after R38 to sharpen the gap
  between the observed O(1) and the needed O(h) bound.
predecessors: [R38-codex-pair-first-multiplicity, R39-codex-packet-tail-reduction]
action:
  kind: extends
  target: R38-codex-pair-first-multiplicity
claim: >
  First-useful multiplicity stays empirically at O(1) per pair in the
  tested range; the h^2 factor in R38 Pro's star-breaker is not saturated
  in practice. Suggests the analytical bound has slack but does not prove
  the tight O(1) multiplicity analytically.
---

# Round 39 Codex — first-useful multiplicity audit after R38

## Status

This pass does **not** close the main-game gap. It does, however, sharpen the
remaining lemma empirically in the direction Pro R38 suggests:

- the **first-appearance / same-prime** charge \(M_k(h)\) is already large in
  the one-cylinder arithmetic toy, even without an explicitly clustered
  Prolonger policy;
- the **pair-first** per-score multiplicity stays small on every computed case.

So the toy evidence now points much more strongly toward the **pair-level /
lower-defect projection route** than toward my earlier first-appearance route.

## What changed in the toy audit

I upgraded `phase4/freshness_toy.py` so the multiplicity statistics are taken at
the **first round when a useful shield appears**, not just in the terminal
state. This is the sharper R38 quantity.

For each useful shield at first appearance, the code now records:

1. the **latest first-covered pair round** among the pair witnesses
   \(\{p,q\}\subset S\), giving the pair-first charge;
2. the **first same-prime round** containing the missing prime \(p\), giving the
   \(M_k(h)\)-style first-appearance charge.

The clustered stress test is also now genuinely clustered: in the fast
one-cylinder audit, the `clustered` policy prioritizes stars with the most
dense-cell pairs first (rather than using dense-cell concentration only as a
late tie-break).

## Data

Main table: [freshness_toy_multiplicity_results.csv](/Users/omisverycool/erdos-harness/erdos-872/phase4/freshness_toy_multiplicity_results.csv)

Computed one-cylinder baseline:

| \((h,M)\) | useful shields | pair-first max | pair-first mean | \(M_1\) max | \(M_1\) mean |
|---|---:|---:|---:|---:|---:|
| \((4,14)\) | 20 | 4 | 2.222 | 13 | 3.333 |
| \((5,14)\) | 10 | 3 | 2.500 | 7 | 2.500 |
| \((6,12)\) | 0 | 0 | 0.000 | 0 | 0.000 |
| \((4,20)\) | 56 | 6 | 2.800 | 34 | 6.222 |
| \((5,20)\) | 35 | 6 | 2.692 | 23 | 3.889 |

Computed clustered one-cylinder stress test (`dense_size = h`):

| \((h,M)\) | useful shields | pair-first max | pair-first mean | \(M_1\) max | \(M_1\) mean |
|---|---:|---:|---:|---:|---:|
| \((4,14)\) | 20 | 4 | 2.222 | 13 | 3.333 |
| \((5,14)\) | 15 | 3 | 2.500 | 12 | 3.750 |
| \((6,12)\) | 6 | 4 | 3.000 | 5 | 3.000 |
| \((4,20)\) | 56 | 6 | 2.800 | 34 | 6.222 |

The clustered \((5,20)\) run did not finish within the time budget in the
current greedy bitset implementation, so that row remains marked `timeout` in
the CSV rather than being extrapolated. The baseline \((5,20)\) run did finish
and is included above.

## Interpretation

### 1. Naive first-appearance charging still looks wrong

Even in the plain one-cylinder toy, the first-appearance multiplicity is already
large:

\[
M_1^{\max}(4,14)=13,\qquad M_1^{\max}(4,20)=34,\qquad M_1^{\max}(5,20)=23.
\]

So the earlier hope
\[
M_k(h)=O(1)\ \text{or even}\ O(\log\log h)
\]
does **not** look compatible with the toy, even away from any specially tuned
clustered policy. The same phenomenon persists for `defect = 2` in these runs
because the bad shields have no fresh defect-2 witness either.

### 2. Pair-first multiplicity stays modest on the computed grid

By contrast, the pair-first per-score multiplicity remains small in every
computed case:

\[
4,\ 3,\ 0,\ 6,\ 6
\]
for the baseline rows above, and

\[
4,\ 3,\ 4,\ 6
\]
for the clustered stress rows.

This is still only toy evidence, but it is qualitatively different from the
first-appearance data. The pair-first projection is behaving like a plausible
load-bearing invariant; the same-prime first-appearance count is not.

### 3. Cluster bias raises the number of bad useful shields, not the pair slot dramatically

The clustered policy does matter: at \((5,14)\) it raises the bad-useful count
from `10` to `15`, and at \((6,12)\) it creates `6` bad useful shields where
the plain greedy run had none.

But even there, the pair-first per-score maximum stays only `3` or `4`. So on
this grid, clustered concentration is increasing the **mass of bad shields**
without visibly causing a pair-first multiplicity explosion.

That is exactly the pattern one would want if Pro's R35/R38 picture is right:
clustered configurations should be paid for by the static thickness / entropy
term, while the remaining online combinatorics should be controlled by a
low-multiplicity pair-level projection.

## Best current conclusion

This pass does **not** prove the clustered-cell entropy reduction. But it does
change the empirical burden:

1. the first-appearance route should probably be treated as **empirically
   disfavored** in the arithmetic toy;
2. the pair-first route is now the only one with genuinely encouraging
   multiplicity data on the sharpened first-useful statistic;
3. the next useful theorem would be a dyadic-local statement of the form
   “outside the clustered R35 tail, the pair-first charge per score is
   \(O(1)\) or at worst \(O(\log\log h)\).”

That would match Pro R38 much better than trying to rescue \(M_k(h)\) itself.

## Artifacts

- Code: [freshness_toy.py](/Users/omisverycool/erdos-harness/erdos-872/phase4/freshness_toy.py)
- Tests: [test_transversal_small_h.py](/Users/omisverycool/erdos-harness/erdos-872/phase4/test_transversal_small_h.py)
- Data: [freshness_toy_multiplicity_results.csv](/Users/omisverycool/erdos-harness/erdos-872/phase4/freshness_toy_multiplicity_results.csv)

# L(40) Diagnostic

## Bottom line

- Existing Phase 1 implementation (`compute_sublinear.exact_minimax`) gives `L(40) = 17` with first move `30`.
- Fresh independent implementation (`exact_minimax_v2.py`) gives `L(40) = 16` with first move `30`.
- The discrepancy is real. The old exact table is not just wrong at `40`; it first diverges already at `n = 27`, and the frontier `39..48` is systematically overstated.

## What was re-checked

1. A fresh exact solver in `exact_minimax_v2.py`, built from scratch on a played-set bitmask state.
2. Unit tests against naive brute-force minimax for every `n <= 12`.
3. A no-pruning exact DP at the first disagreement point (`n = 27`), which also returns `L(27) = 11`.
4. A corrected-window legal-mask alpha-beta cross-check on the frontier, which returns `L(40) = 16`, `L(47) = 19`, and `L(48) = 19`.

## L(40) principal variations

The old implementation does not expose a principal variation directly, so I wrote a faithful replay of its recurrence, move ordering, and tie-breaking in `LegacyExactReplay` to reconstruct the line it is implicitly certifying.

### Old Phase 1 implementation / faithful replay

- Value: `L(40) = 17`
- First move: `30`
- Principal variation:

```text
30, 7, 8, 11, 26, 17, 12, 19, 18, 20, 23, 25, 27, 29, 31, 37, 39
```

### Fresh independent solver (`ExactSolverV2`)

- Value: `L(40) = 16`
- First move: `30`
- Principal variation:

```text
30, 7, 36, 11, 40, 13, 24, 17, 32, 19, 27, 25, 23, 29, 31, 37
```

## Root cause

The bug is in the old alpha-beta window propagation.

The Phase 1 code evaluates each move as:

```python
value = 1 + solve(child, next_turn, alpha, beta)
```

but the score from `solve(child, ...)` is the remaining move count **after** the current move has already contributed `+1`. That means the admissible child window should be shifted:

```python
value = 1 + solve(child, next_turn, alpha - 1, beta - 1)
```

Without that shift, the old search can prune a child too early. For example, if a maximizing parent already has `alpha = 16`, a minimizing child can prune as soon as it proves `child_value <= 16`; but the parent actually compares `1 + child_value`, so `child_value = 16` would produce parent value `17`, which is still an improvement. That is an unsound cutoff, and it explains the systematic overestimates in the old table.

## What it is *not*

- Not an `L`/`U` boundary bug: the fresh tests explicitly verify that for `n = 40`, `20 in L` and `21 in U`.
- Not a termination bug: both solvers stop exactly when there is no legal move.
- Not a move-count bug: the reported value is total moves `|A|`, not Prolonger-only moves.
- Not a legality bug in the fresh solver: the new implementation checks divisibility comparability explicitly, and brute-force agrees through `n <= 12`.
- Not a transposition-key collision in the fresh solver: the new solver keys on the played-set bitmask, and the brute-force oracle uses `frozenset` states.

## Compare to existing `exact_minimax.csv` through 32

The new solver agrees with the existing CSV for `n = 2..26` and `n = 28..32`.
The first exact-value disagreement is already at `n = 27`.

- Disagreements in `2..32`: `27`
- Disagreements in `2..48`: `27, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48`

## Corrected exact table for `n <= 48`

| n | old `L_n` | corrected `L_n` | delta |
| ---: | ---: | ---: | ---: |
| 2 | 1 | 1 | 0 |
| 3 | 2 | 2 | 0 |
| 4 | 2 | 2 | 0 |
| 5 | 3 | 3 | 0 |
| 6 | 3 | 3 | 0 |
| 7 | 4 | 4 | 0 |
| 8 | 4 | 4 | 0 |
| 9 | 5 | 5 | 0 |
| 10 | 5 | 5 | 0 |
| 11 | 6 | 6 | 0 |
| 12 | 6 | 6 | 0 |
| 13 | 7 | 7 | 0 |
| 14 | 7 | 7 | 0 |
| 15 | 7 | 7 | 0 |
| 16 | 7 | 7 | 0 |
| 17 | 8 | 8 | 0 |
| 18 | 8 | 8 | 0 |
| 19 | 9 | 9 | 0 |
| 20 | 9 | 9 | 0 |
| 21 | 10 | 10 | 0 |
| 22 | 10 | 10 | 0 |
| 23 | 11 | 11 | 0 |
| 24 | 11 | 11 | 0 |
| 25 | 11 | 11 | 0 |
| 26 | 11 | 11 | 0 |
| 27 | 12 | 11 | -1 |
| 28 | 12 | 12 | 0 |
| 29 | 13 | 13 | 0 |
| 30 | 13 | 13 | 0 |
| 31 | 14 | 14 | 0 |
| 32 | 14 | 14 | 0 |
| 33 | 14 | 14 | 0 |
| 34 | 14 | 14 | 0 |
| 35 | 15 | 15 | 0 |
| 36 | 15 | 15 | 0 |
| 37 | 16 | 16 | 0 |
| 38 | 16 | 16 | 0 |
| 39 | 17 | 16 | -1 |
| 40 | 17 | 16 | -1 |
| 41 | 18 | 17 | -1 |
| 42 | 18 | 17 | -1 |
| 43 | 19 | 18 | -1 |
| 44 | 19 | 18 | -1 |
| 45 | 20 | 18 | -2 |
| 46 | 20 | 18 | -2 |
| 47 | 21 | 19 | -2 |
| 48 | 21 | 19 | -2 |

## Notes on first-move claims

The value corrections above are the important part. I would be careful about citing any broad "optimal first move is X" claim from the old Phase 1 table without recomputing the *set* of optimal openers, because the old code only stored one heuristic winner from a pruned search and many early `first_move` entries already differ even when `L_n` agrees.

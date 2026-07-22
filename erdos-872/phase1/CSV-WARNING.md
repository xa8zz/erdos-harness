# WARNING: exact_minimax.csv contains WRONG values (do not use)

Established 2026-07-22 (Fable-5 solo session). `exact_minimax_v2.py` has a bug that
inflates some game values by +1. Verified wrong entries in `exact_minimax.csv`:

| n  | CSV says | ground truth |
|----|----------|--------------|
| 27 | 12       | 11           |
| 39 | 17       | 16           |
| 40 | 17       | 16           |
| 41 | 18       | 17           |
| 42 | 18       | 17           |

(and every value n >= 43 in that CSV is unverified/suspect.)

Ground truth established two independent ways:
1. `../fable/reference.py` — deliberately naive memoized minimax, no pruning, no
   alpha-beta, no shortcuts. Confirms n=24..40 values.
2. `../fable/solver.c` — independent C alpha-beta+TT implementation, agrees with the
   reference on ALL of n=2..40, and is TT-size-independent (2^12 vs 2^26 identical).

Corrected values for n=2..58: `../fable/exact_corrected.csv`.
Correct threshold table (k = L(n) - pi(n) increments): n = 9, 21, 28, 35, 49, 51, 57.

NOTE: the small-n table in prompts/researcher-R171-full-compilation-freeroam.md
("0 for n<=8, 1 for 9<=n<=20, 2 for 21<=n<=27, 3 for 28<=n<=34, 4 for 35<=n<=40")
is CORRECT — it disagrees with the poisoned CSV and agrees with ground truth.

The v2 bug itself has not been localized (not needed; superseded by fable/solver.c).

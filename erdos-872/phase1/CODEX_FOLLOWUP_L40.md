# Phase 1 follow-up — resolve the L(40) discrepancy

## Context

An earlier Phase 1 exact-minimax pass reported `L(40) = 17` with optimal first move `30`. Two independent sources — a second AI audit and the original research Pro — each independently computed `L(40) = 16`. One of the implementations has a bug.

This is load-bearing: every claim we make about "small-$n$ exact behavior" depends on the correct exact table. If Phase 1's implementation is wrong, other exact values in the same table (notably $L(40), L(45), L(48)$) are also suspect.

## Your task

1. **Re-implement exact minimax from scratch** in a separate file `exact_minimax_v2.py`. Don't reuse any code from `compute_sublinear.py`; start fresh. Use:
   - Integer bitmask or `frozenset` for the played-set state.
   - Alpha-beta pruning with transposition tables.
   - Memoize on the normalized played-set (sorted tuple or bitmask).
   - Clearly document the move-ordering and termination rule.

2. **Sanity-check against brute-force** for $n \le 12$. Write unit tests. A naive recursive all-branches minimax should be feasible at that scale.

3. **Compare to existing `exact_minimax.csv`** for $n \le 32$. If the two agree up to $n = 32$, focus debugging effort on the $n = 33$–$40$ range where divergence could appear.

4. **Specifically compute `L(40)` with both implementations.** Dump the optimal principal variation (sequence of moves both players make under optimal play) from both. A diff of the two variations will localize the bug quickly.

5. **Possible bug sources to audit:**
   - Off-by-one on $L = \{2, \ldots, \lfloor n/2 \rfloor\}$ vs $U = (n/2, n]$ (does $n/2$ belong to $L$ or $U$ when $n$ is even?).
   - Game termination: is the game over when *no* move is legal, or when the antichain is maximal-under-divisibility on $\{2, \ldots, n\}$? (These are equivalent, but off-by-one on the termination check is plausible.)
   - Who moves first: Prolonger. Is the "total moves" count $|A|$, or Prolonger-only?
   - Move legality: a move $x$ is legal iff $\{x\} \cup A$ is still an antichain under divisibility. Verify via explicit divisibility check, not subset test.
   - Transposition table: key normalization (sorted vs set vs frozenset vs bitmask). A subtle hash collision between differently-ordered move sequences could silently corrupt.

6. **Report back** in `L40_diagnostic.md`:
   - Both implementations' $L(40)$ value.
   - The optimal principal variation from each.
   - Root cause if found.
   - Corrected exact-minimax table for $n \le 48$ (if Phase 1's table needs amending).

## Constraints

- Write only in `/Users/omisverycool/erdos-harness/erdos-872/phase1/`.
- Don't modify `compute_sublinear.py` or the existing CSV. Add new files.
- Include tests. Don't trust yourself.

## Why this matters

The exact-minimax table is the ground truth for small-$n$ claims. We're about to cite it in a forum post. A bug in $L(40)$ suggests bugs in adjacent values, which would mean retracting small-$n$ structural claims (e.g., "optimal first move is $30$ for $n \in [35, 48]$"). Better to catch it now than in review.

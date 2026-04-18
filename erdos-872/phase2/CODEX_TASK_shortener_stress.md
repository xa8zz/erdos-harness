# Codex Task — Phase 2: Shortener-strategy stress test

## Goal

Empirical signal on which Shortener strategies resist the block-product Prolonger counterstrategy from Round 7, and whether any Shortener candidate produces a decaying $L \log n / n$ trajectory (signal of $L(n) = o(n/\log n)$ for that pair). Output feeds into the next Pro round's validated direction.

## Context

The program just established $L(n) \le (13/36)n + o(n)$ using an odd-prime-prefix Shortener (play smallest legal odd prime for first $\sqrt n / \log n$ turns, then arbitrary). Pro then proved this specific strategy cannot reach $L(n) = O(n/\log n)$ because Prolonger has an explicit counterstrategy — the "block-product" — that forces $\sum_{q \in D} 1/q \le 1/2 + o(1)$ and $N_D \ge n/4$.

To make progress we need a different Shortener design. This task stress-tests candidate designs empirically before investing a Pro round.

See `researcher-06-direct-sieve-refutation.md` for the block-product construction and `researcher-07-13-36-closeout.md` for the current upper-bound proof.

## What to implement

Build on `phase1/exact_minimax_v2.py` infrastructure (divisibility-antichain game on $\{2, \ldots, n\}$, Prolonger-first, maximal-antichain terminal).

### Shortener strategies

Implement these five Shortener strategies. Each takes the current game state (played set, whose turn it is) and returns a legal move.

1. **`S_star`** (baseline — the $13/36$ strategy, for comparison).
   - For the first $k = \lfloor \sqrt n / \log n \rfloor$ Shortener turns: play the smallest legal odd prime.
   - After $k$ turns: play any legal move (pick smallest legal integer for determinism).

2. **`S_adaptive_prime`** (break block-product's predictability via adaptive order).
   - At each turn, if Prolonger's last move $u$ has a legal prime divisor $p$, play the smallest such $p$.
   - Else: play the smallest legal odd prime.

3. **`S_harm`** (harmonic mass maximizer — Shortener-side analog of $P_{\text{harm}}$).
   - At each turn, play the legal element $x \in \{2, \ldots, n\}$ maximizing $h(x) := \sum_{p \mid x,\ p \text{ currently legal}} 1/p$. Tie-break smallest $x$.

4. **`S_carrier_snipe`** (pre-empt block-product carriers).
   - At each turn, compute $B^*$ = the *next* maximal initial block of currently-legal odd primes with $\prod \le n$. If $B^*$ has $m \ge 2$ primes, play the *largest* prime in $B^*$ — this deletes the block's product $P_j$ from legality before Prolonger can use it.
   - Else: fallback to smallest legal odd prime.

5. **`S_topdown`** (largest-prime-first, opposite of bottom-up).
   - At each turn: play the largest legal odd prime $\le n/2$. Ties: largest.

### Prolonger strategies

Implement four Prolongers. Each tested against every Shortener above.

1. **`P_block_product`** (Round 7's counter).
   - Before each Prolonger turn, compute $B_j$ = maximal initial block of currently-legal odd primes with $\prod_{p \in B_j} p \le n$. Play $P_j := \prod_{p \in B_j} p$ (if legal and not already played).
   - If $P_j$ is illegal or $|B_j| < 2$: fallback to $P_{\text{anti-}S^\star}$.

2. **`P_antiStar`** (Phase 1's strongest).
   - At each Prolonger turn, play the legal move $u$ that maximizes the estimated number of remaining-legal moves after Shortener's response under $S^\star$.
   - 1-step lookahead over Shortener = `S_star`.

3. **`P_harm`** (harmonic Prolonger).
   - At each turn, play the legal $u \in U$ maximizing $\sum_{p \mid u,\ p\text{ legal}} 1/p$.
   - Fallback to any legal move if no legal $u \in U$.

4. **`P_random`** (baseline).
   - Uniform random legal move. Seed fixed for reproducibility.

## Grid

- Shortener × Prolonger: $5 \times 4 = 20$ pairs.
- $n \in \{1000, 5000, 20{,}000, 100{,}000\}$.
- For `P_random`: average over 5 seeds.
- Total: 20 pairs × 4 $n$-values ≈ 80 games, most deterministic and fast, ~20 randomized.

## Output

Write results to `phase2/shortener_stress.csv` with columns:
- `n`, `shortener`, `prolonger`, `seed`, `L` (game length), `L_over_n_log_n` = `L * log(n) / n`.

Write a short summary to `phase2/shortener_stress_summary.md`:
- Table of $L \log n / n$ values across pairs and $n$.
- Flag any Shortener strategy where the ratio **decreases** as $n$ grows for ALL four Prolonger strategies (candidate for $o(n/\log n)$ decay).
- Flag any Shortener strategy that beats `S_star` against `P_block_product` at $n = 10^5$ (signal that it's resistant to the counterstrategy).
- Top-line recommendation: which Shortener candidate is most promising for a Pro round, based on the data.

## Sanity checks

- At $n = 40$, the game is small enough to run exact minimax. Verify your implementation gives $L(40) = 16$ under optimal play (see `phase1/exact_minimax_v2.py`).
- `S_star` against `P_block_product` at $n = 10^5$ should give $L \log n / n$ above $13/36 \cdot \log n \approx 4.15$. (Per Audit 2 of Round 7, empirical $2k + N_D \approx 0.39n$ at $n = 10^5$, so $L \log n / n$ should be in that neighborhood.)

## Known pitfalls

- Don't reuse the `exact_minimax.csv` solver; Phase 1 had an alpha-beta window bug (fixed in `exact_minimax_v2.py`).
- `P_block_product` requires computing $B_j$ carefully: the block is the maximal *initial* contiguous block of currently-legal odd primes whose product is $\le n$. "Initial" = in sorted order starting from the smallest legal odd prime.
- For `S_harm` at large $n$: computing $h(x)$ for every legal $x$ is $O(|\text{legal}|)$ per turn; the game has $O(n/\log n)$ turns, total $O(n^2/\log n)$ — keep this tractable. Cache prime-factor-legality lookups.

## Deliverables

1. `phase2/shortener_stress.py` — implementation.
2. `phase2/shortener_stress.csv` — raw results.
3. `phase2/shortener_stress_summary.md` — synthesis + top-line recommendation.
4. `phase2/logs/shortener_stress.log` — run log.

No need to modify any Phase 0 or Phase 1 files.

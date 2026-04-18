# Phase 1 — Stress-test the conjecture L(n) = Θ(n / log n)

You are a coding agent working on an M4 Pro MacBook (14 cores, 48GB RAM). Python 3.14 at `/opt/homebrew/bin/python3` with `scipy`, `numpy`, `networkx` already installed. Write code, run it, tabulate results, write a human report.

All outputs go in `/Users/omisverycool/erdos-harness/erdos-872/phase1/`. Commit nothing; just write files.

## Background

Two-player combinatorial game on $\{2, 3, \ldots, n\}$:
- Players alternate choosing integers into a shared set $A$.
- $A$ must remain an antichain under divisibility.
- Prolonger (moves first) maximizes total moves; Shortener minimizes.
- $L(n)$ is the total moves under optimal play.

**Central conjecture from an earlier research round:** $L(n) = \Theta(n / \log n)$, specifically $L(n) \cdot \log n / n$ converges to a constant around $1.5$.

The conjecture is based on simulations of a specific Shortener strategy against specific Prolonger heuristics. Your job is to stress-test it: does the $n / \log n$ scaling hold across a wider range of strategy pairs, or is it an artifact of the particular heuristics tested?

## Setup

Let $L = \{2, \ldots, \lfloor n/2 \rfloor\}$ and $U = (n/2, n] \cap \mathbb{Z}$.

The game state is a set $A$ of already-played integers (in both $L$ and $U$). A move $x \in \{2, \ldots, n\} \setminus A$ is legal iff $A \cup \{x\}$ is still an antichain under divisibility (no $a \in A$ with $a \mid x$ or $x \mid a$).

Write a clean game-engine module that supports:
- Efficient legality checking (probably via bitmasks over the divisibility graph).
- Exact minimax with alpha-beta pruning and transposition tables.
- Heuristic play with pluggable strategies.

## Strategies to implement

### Shortener strategies

1. **$S^\star$ (prime cascade)** — the current conjecture-candidate:
   1. If any prime $p \le n/2$ is legal, play the smallest such prime.
   2. Otherwise play a legal $x$ maximizing $\kappa_t(x) = \#\{y\ \text{still legal} : x \mid y\ \text{or}\ y \mid x\}$, ties toward smaller $x$.

2. **$S_{\text{shadow}}$ (weighted greedy)** — baseline: at each turn play legal $x \in L$ maximizing the number of currently legal upper multiples of $x$. If no such $x$, play max-$\kappa$ from $U$.

3. **$S_{\text{primorial}}$** — play primes in "primorial order": $2, 3, 5, 7, 11, \ldots$ in order, then fall back to $S_{\text{shadow}}$.

### Prolonger strategies

All of these play an upper move ($u \in U$) by default when possible. If no legal upper move, play the max-$\kappa$ legal element.

1. **$P_{\text{sh}}$ (shield-heavy)**:
   $u_t = \arg\max_{u \in U\ \text{legal}} \sum_{d \mid u,\ d \in L\ \text{legal}} \max(m_t(d) - 1, 0)$, where $m_t(d) = \#\{\text{currently legal upper multiples of}\ d\}$.

2. **$P_{\text{pb}}$ (prime-blocking)**:
   $u_t = \arg\max_{u \in U\ \text{legal}} \#\{p : p\ \text{prime},\ p \le n/2,\ p\ \text{legal},\ p \mid u\}$, ties toward fewer immediate deletions.

3. **$P_{\text{random}}$** — uniform random over legal moves in $U$.

4. **$P_{\text{primorial-template}}$** — enumerate multiples of $\mathrm{lcm}(1, 2, \ldots, y)$ in $U$ for successive small $y$; play them in order while they're legal.

5. **$P_{\text{composite}}$** — at each turn play the legal $u \in U$ with the most distinct prime factors (ties toward smallest $u$).

6. **$P_{\text{pivot}}$** — adaptive: maintain a "target shield set" $P^*$ selected via smart-greedy (similar to Phase 0). When Shortener plays a prime that kills a target, remove all dead targets, refresh $P^*$ from survivors. Keep playing targets.

7. **$P_{\text{maker-breaker}}$** — treat the pairs $\{(x, 2x) : x \in L\ \text{odd},\ 2x \in U\}$ as a hypergraph and play a Maker strategy that tries to capture as many $2x$ elements as possible.

### Additional: "adversarial Prolonger"

Add a strategy **$P_{\text{anti-}S^\star}$** that uses a one-step lookahead specifically against $S^\star$: at each Prolonger turn, try each candidate $u \in U$, simulate $S^\star$'s response, pick the $u$ that maximizes the heuristic "surviving game length" score (Prolonger's remaining high-weight moves). This is the strongest Prolonger we can easily build.

## Experiments to run

### A. Reproduce Pro's fit

Run $S^\star$ against $P_{\text{sh}}$ and $P_{\text{pb}}$ at $n \in \{500, 1000, 2000, 5000, 10000, 20000\}$. Compute $L(n), L(n)/n, L(n) \log n / n$. Compare to the reported values:

| $n$ | reported $L \log n / n$ vs $P_{\text{pb}}$ |
| --: | ---: |
| 500 | 1.49 |
| 1000 | 1.45 |
| 2000 | 1.43 |
| 5000 | 1.55 |
| 10000 | 1.52 |
| 20000 | 1.47 |

Confirm or refute to three decimal places.

### B. Stress-test across strategies

For each (Shortener, Prolonger) pair in $\{S^\star, S_{\text{shadow}}, S_{\text{primorial}}\} \times \{P_{\text{sh}}, P_{\text{pb}}, P_{\text{random}}, P_{\text{primorial-template}}, P_{\text{composite}}, P_{\text{pivot}}, P_{\text{maker-breaker}}, P_{\text{anti-}S^\star}\}$, run at $n \in \{1000, 5000, 20000, 50000\}$. For randomized strategies, take the median over 5 runs.

Report $L(n), L(n) \log n / n$ for each cell.

**Key question:** does ANY (Shortener, Prolonger) pair break the $L \log n / n \to$ const pattern? I.e., is there a pair where $L(n) / (n/\log n)$ visibly grows (suggesting linear $L$) or shrinks (suggesting faster sub-linear decay)?

If $S^\star$ achieves $L \log n / n \approx $ const for *every* Prolonger strategy, that's strong evidence for sublinearity. If any Prolonger strategy against $S^\star$ gives $L \log n / n \to \infty$ (i.e., $L$ grows faster than $n/\log n$), the conjecture is in trouble.

### C. Probe the constant

For the pairs that give stable $L \log n / n$, tabulate the apparent limit. Does it depend on the Prolonger strategy? If the limit is always $\approx 1.5$ regardless of Prolonger, that's a universal constant. If it varies (e.g., $1.5$ for $P_{\text{pb}}$ but $2.1$ for $P_{\text{pivot}}$), that's a looser claim.

### D. Exact minimax beyond $n = 50$

Implement memoized alpha-beta minimax. Push $n$ as far as feasible on the M4 Pro. Target $n = 60$–$80$.

Report exact $L(n)$ values and compare to $n / \log n$.

### E. Scaling at larger $n$

For the strongest Shortener ($S^\star$) vs the strongest-known Prolonger from part B, extend to $n = 50{,}000$ and $n = 100{,}000$. Does $L \log n / n$ remain stable or drift?

## Deliverables

All paths relative to `/Users/omisverycool/erdos-harness/erdos-872/phase1/`.

1. **`compute_sublinear.py`** — main script containing the game engine, all strategies, and the experiment driver. Must be importable so individual strategies can be unit-tested.
2. **`test_engine.py`** — unit tests covering legality checking, small-$n$ exact minimax ($n \le 20$ brute force), and each strategy's correctness.
3. **`stress_grid.csv`** — columns: `n`, `shortener`, `prolonger`, `run_id`, `total_moves`, `L_over_n`, `L_log_n_over_n`, `elapsed_sec`.
4. **`exact_minimax.csv`** — columns: `n`, `L_n`, `first_move`, `elapsed_sec`.
5. **`trajectories/<pair>_<n>.json`** — per-game move sequences for a representative run of each pair, for diagnostic.
6. **`report.md`** — human-readable writeup including:
   - Part A: reproduction table vs. Pro's reported numbers.
   - Part B: full stress-test grid with ASCII plot of $L \log n / n$ vs $n$ per pair.
   - Part C: apparent constants per pair; universal constant or strategy-dependent?
   - Part D: exact minimax table and fit to $n/\log n$.
   - Part E: extension to $n = 50{,}000$ and $100{,}000$.
   - **Verdict:** is the $L(n) = \Theta(n/\log n)$ conjecture supported, refuted, or ambiguous?
   - **The single-most-important finding:** one paragraph, lead with that.
7. **`logs/*.log`** — progress logs as things run. Write incrementally; don't batch at end.

## Guardrails

- Don't modify anything outside `phase1/`.
- Don't install extra packages.
- Parallelize across the 14 cores via `multiprocessing` for independent cell runs.
- Time-box individual runs: if a single game takes > 10 minutes, back off (use smaller $n$ or drop the cell from the grid; note in report).
- Checkpoint: write CSV rows as each cell completes, so an interruption doesn't lose work.
- Honesty: if any experiment doesn't run or gives surprising results, say so in `report.md`.

## Why this matters

A recent research round produced evidence that a specific Shortener strategy $S^\star$ forces $L(n) = \Theta(n/\log n)$, based on tests against 2 Prolonger heuristics across 5 values of $n$. That's suggestive but thin. Before committing weeks of analytic work to prove it, we need much stronger empirical ground:

- If the $n/\log n$ fit holds across 8 Prolonger strategies including specifically adversarial ones, and $S^\star$'s dominance is robust, then the conjecture is worth investing in.
- If even one reasonable Prolonger strategy breaks the fit, we know the conjecture is fragile or wrong and we can pivot.

Your stress-test grid will settle this. The analytic work (proving the packing lemma that would turn the conjecture into a theorem) has to wait for a positive computational signal.

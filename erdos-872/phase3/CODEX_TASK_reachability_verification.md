# Codex Task — Phase 3c: Reachability protocol empirical verification

## Goal

Empirically verify (or refute) a specific Prolonger protocol's claim to force $L(n) = \Theta(n \log\log n / \log n)$ against optimal Shortener play. The protocol is the "Topological Shielding" Maker-Breaker strategy: Prolonger opens with $30$, races to shield vertices $V$ via $6v$ carriers, then installs edge carriers $2qa, 2qb, 2ab$ — claimed to yield $\ge 1/4$ of the triangles surviving as isolated residuals.

The diagnostic signals:
- **Triangle survival rate** $\rho_\triangle := |\{\text{isolated triangles at game end}\}| / |\text{total candidate triangles}|$. Protocol claims $\rho_\triangle \ge 1/4$.
- **Per-face Maker-Breaker rate** $\rho_\text{face} := |\text{faces Maker secured}| / |\text{total faces}|$. Protocol claims $\ge 1/2$ per face.
- **Game length** $L(n)$ and the normalized ratios $L \log n / n$ and $L \log n / (n \log\log n)$.

If $\rho_\triangle$ stabilizes at a positive constant as $n$ grows, the reachability claim survives empirical stress. If $\rho_\triangle \to 0$, the 50% Maker-Breaker independence assumption is wrong and the reachability argument fails at the quantitative step.

## Context

The game: two-player divisibility-antichain game on $\{2, \ldots, n\}$. Prolonger first, Shortener minimizes. See `phase3/deepthink_protocol.py` for the existing game infrastructure (sieve, legality checks, move enumeration).

**Prolonger's protocol (from the reachability claim):**

Fix parameters $\delta = 0.04$, $\beta = 0.40$, $\gamma = 0.49$. Define:
- $A = \{a \text{ prime} : 3 \le a \le n^\delta\}$ (small primes)
- $Q = \{q \text{ prime} : n^\beta \le q \le n^\gamma\}$ (medium primes)  
- For $(q, a) \in Q \times A$: valid $b$-primes lie in $(n/(3qa), n/(qa)]$.
- $V = Q \cup A \cup B_{\text{all}}$ where $B_{\text{all}} = \{b \text{ prime} : b \text{ valid for some } (q, a) \in Q \times A\}$.
- Triangle set $\mathcal{T} := \{(q, a, b) : q \in Q, a \in A, b \in B_\text{all}, n/3 < qab \le n, \text{pairwise distinct}\}$.

**Phase 1 — Anchor.** Turn 1: Prolonger plays $30$.

**Phase 2 — Vertex shielding.** At each Prolonger turn, greedily pick an unshielded vertex $v \in V$ of highest residual-triangle weight (where weight$(v)$ = number of triangles in $\mathcal{T}$ with $v \in \{q, a, b\}$ that are still live). Play the carrier $6v$ if legal (not comparable with any prior move).
- If $6v$ is illegal (e.g., Shortener blocked it), try the next-highest-weight vertex.
- Continue until all $v \in V$ are either shielded (some move containing $v$ in $A$) or dead (Shortener played a divisor of $v$-carriers).

**Phase 3 — Edge shielding.** After Phase 2 completes, iterate over pair-edges $(q, a), (q, b), (a, b)$ for surviving triangles in order of descending residual weight. Play the corresponding carrier $2qa, 2qb, 2ab$ if legal.

**Phase 4 — Finish.** Any remaining legal moves: play any (smallest-legal integer suffices).

## Shortener strategies to test

Implement and test at least these four Shortener strategies:

1. **`S_vertex_race`** — at each Shortener turn, play the smallest legal prime $v \in V$ (killing that vertex before Prolonger can shield it). Matches the "naive 1-to-1 race" Shortener DeepThink's proof assumes.

2. **`S_edge_race`** — at each Shortener turn, if any pair-edge $qa, qb, ab$ from $\mathcal{T}$ is legal, play the smallest such. Else fall back to vertex race.

3. **`S_multiblock_greedy`** — at each Shortener turn, enumerate candidate multi-block moves of the form $M = 2q a_1 \cdots a_k$ for $q \in Q$ and $\{a_1, \ldots, a_k\} \subseteq A$ with $M \le n$. Compute the "effective disruption" = (number of currently-live carriers blocked by playing $M$) — (number of currently-live triangles that $M$ shields for Prolonger, per the multi-block-paradox mechanism). Play the $M$ maximizing this metric. Fall back to single-kill if no positive-disruption $M$ exists.

4. **`S_optimal_local`** — at each Shortener turn, compute the marginal-triangle-destruction $\sigma(x)$ for every legal move $x$ and play the $x$ maximizing $\sigma(x)$. This is the most aggressive plausible Shortener strategy.

## What to measure

For each $(n, \text{Shortener})$ pair, record:

- `L`: total game moves until terminal maximal antichain.
- `triangles_total`: $|\mathcal{T}|$ at start.
- `triangles_isolated`: number of triangles $(q, a, b)$ whose three pair-edges $\{2qa, 2qb, 2ab\}$ are all in $A$ at game end, so residual $m = qab$ was forced.
- `triangle_survival_rate`: `triangles_isolated / triangles_total`.
- `vertex_maker_rate`: fraction of $v \in V$ that were shielded (i.e., Prolonger played a carrier containing $v$, OR a multi-block with $v \in$ its support) before Shortener could destroy them.
- `edge_maker_rate`: fraction of pair-edges $(q, a), (q, b), (a, b)$ over triangles in $\mathcal{T}$ that had their carriers installed by Prolonger.
- `L_log_n_over_n`: $L \cdot \log n / n$.
- `L_log_n_over_n_loglog_n`: $L \cdot \log n / (n \log\log n)$.
- `phase1_moves`, `phase2_moves`, `phase3_moves`, `phase4_moves`: Prolonger's move counts by phase.
- `shortener_vertex_kills`, `shortener_edge_kills`, `shortener_multiblock_plays`, `shortener_other`: breakdown of Shortener's moves.

## Grid

- $n \in \{10^4, 3 \cdot 10^4, 10^5, 3 \cdot 10^5, 10^6\}$. Extending to $10^7$ optional (may be slow).
- Parameters fixed at $(\delta, \beta, \gamma) = (0.04, 0.40, 0.49)$ per the protocol.
- All four Shortener strategies per $n$.
- Deterministic; no seeds needed.

## Output

Write raw results to `phase3/reachability_verification.csv` with columns:
`n`, `shortener`, `L`, `triangles_total`, `triangles_isolated`, `triangle_survival_rate`, `vertex_maker_rate`, `edge_maker_rate`, `L_log_n_over_n`, `L_log_n_over_n_loglog_n`, `phase1_moves`, `phase2_moves`, `phase3_moves`, `phase4_moves`, `shortener_vertex_kills`, `shortener_edge_kills`, `shortener_multiblock_plays`, `shortener_other`.

Write a synthesis to `phase3/reachability_verification_summary.md`:

- For each Shortener, table of `triangle_survival_rate` and `L_log_n_over_n_loglog_n` across $n$.
- Top-line verdict:
  - "Reachability claim VERIFIED": if the best-against-Prolonger Shortener (i.e., the one giving lowest $L$) still leaves $\rho_\triangle$ stabilized at a positive constant, and $L \log n / (n \log\log n)$ flattens, consistent with $L = \Theta(n \log\log n / \log n)$.
  - "Reachability claim REFUTED": if some Shortener drives $\rho_\triangle \to 0$, showing Prolonger cannot force isolation.
  - "Inconclusive at this scale": if signals are mixed or noise-dominated at tested $n$.
- Vertex-maker and edge-maker rates: does the claimed 50% hold empirically? Against which Shorteners?
- Multi-block paradox check: for `S_multiblock_greedy`, does the multi-block indeed fail to destroy residuals (as the protocol argues)? Measure directly.

## Sanity checks

- At $n = 10^4$: $n^{0.04} \approx 1.58$ (no primes in $A$), so the protocol is degenerate. Expected. Log and skip tight conclusions at very small $n$.
- At $n = 10^5$: $n^{0.04} \approx 1.78$, still degenerate. May need to raise $\delta$ or skip.
- At $n = 10^6$: $n^{0.04} \approx 2.51$ — still no primes $\ge 3$ with $a \le 2.51$. 
  **Parameter caveat:** DeepThink's choice $\delta = 0.04$ gives an empty $A$ at all tested $n$. If so, fall back to the previously-established viable parameters $(\delta, \beta, \gamma) = (0.20, 0.40, 0.49)$ used in the sparse-subset run. Log both parameter choices and run the grid with the viable one. Report the parameter choice actually used.
- Verify the terminal $A$ is always a legal antichain (no element divides another).
- Verify the terminal $A$ is maximal (no legal move remains).

## Known pitfalls

- **Runtime at large $n$.** Triangle enumeration and per-turn marginal-destruction computation are the expensive steps. Use a sieve-based prime lookup, cache triangle supports, and avoid $O(n^2)$ inner loops. At $n = 10^6$, $|\mathcal{T}|$ is likely $\sim 10^4$-$10^5$ per the sparse-subset run's measurements — tractable with good bookkeeping.
- **Multi-block enumeration.** For `S_multiblock_greedy`, generating all candidate $M = 2 q a_1 \cdots a_k$ is exponential in $k$. Restrict to $k \le 3$ and precompute for each $q \in Q$ the small-prime subsets that give $M \le n$.
- **Edge-maker rate counting.** An edge $(q, a)$ can be "shielded" by either Prolonger playing $2qa$ directly, OR by Shortener playing a multi-block $M$ containing $q$ and $a$ (the multi-block paradox). Both count toward `edge_maker_rate` because both achieve the same shielding function for triangles.
- **Interaction between phases.** Shortener may destroy vertices during Phase 3 if she saved capacity. The implementation should not artificially stop Phase 2 at a fixed number of turns — it ends when no unshielded vertex has a legal $6v$ carrier Prolonger can still play.
- **DeepThink's parameter sensitivity.** If the protocol's claimed survival is $\ge 1/4$, then at $n = 10^6$ with $|\mathcal{T}| \sim 10^4$, we should see $\ge 2500$ isolated residuals. A measured $\rho_\triangle \ll 0.25$ (e.g., $\rho_\triangle = 0.01$) is strong evidence against the reachability claim. A measured $\rho_\triangle \ge 0.1$ is consistent with the claim but not conclusive; extension to larger $n$ is needed.

## Deliverables

1. `erdos-872/phase3/reachability_verification.py` — simulator extending `phase3/deepthink_protocol.py`.
2. `erdos-872/phase3/reachability_verification.csv` — raw results.
3. `erdos-872/phase3/reachability_verification_summary.md` — synthesis and top-line verdict.
4. `erdos-872/phase3/test_reachability_verification.py` — unit tests covering triangle enumeration, protocol implementation, isolation check, and Shortener strategy correctness.
5. `erdos-872/phase3/logs/reachability_verification.log` — run log.

Do not modify Phase 0, 1, 2, or prior Phase 3 files.

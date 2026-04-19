# Codex Task — Phase 3: DeepThink-protocol empirical falsifier

## Goal

Empirical signal on whether a specific three-phase Prolonger protocol forces $L(n) = \Theta(n \log\log n / \log n)$, as claimed in a recent research response, versus the previously-conjectured $\Theta(n / \log n)$.

The diagnostic statistic is $L \cdot \log n \,/\, (n \log\log n)$. If the protocol's claim is correct, this ratio should **stabilize at a positive constant** as $n$ grows. If the claim has a bug, $L \cdot \log n / n$ stabilizes instead (and the loglog-normalized statistic decays).

Existing simulations (`phase2/shortener_stress.py`) run a "block-product" Prolonger — a simpler universal counter — and do not test this protocol.

## Context

The game: two-player combinatorial game on $\{2, \ldots, n\}$. Players alternate choosing integers into a shared set $A$, which must remain a divisibility antichain (no element divides another). Prolonger moves first and maximizes the move count; Shortener minimizes. The game ends when $A$ is maximal (no legal move). $L(n)$ is the move count under optimal play.

Build on `phase1/exact_minimax_v2.py`'s game infrastructure (legality check, state tracking) and follow the style of `phase2/shortener_stress.py`.

## The Prolonger protocol to test

Fix thresholds $y_s := \lfloor n^{1/6} \rfloor$ (small-prime cutoff), $y_m := \lfloor n^{1/3} \rfloor$ (medium-prime cutoff for padding), $y_L := \lfloor n^{5/6} \rfloor$ (large-prime cutoff).

Let $B := \{\text{primes } p \le y_s\}$.

**Phase 1 — block building.** For each $p_i \in B$ in order (smallest first), at Prolonger's turn:

1. Initialize $\text{block} := p_i$.
2. Let $R_i :=$ primes in $(y_s, y_m]$ not yet used in any prior block and currently legal.
3. Greedily multiply $\text{block}$ by elements of $R_i$ (smallest first) while $\text{block} \cdot r \le \lfloor \sqrt n \rfloor$.
4. If $\text{block}$ is legal and $\text{block} \ne p_i$ (i.e., at least one padding prime was attached), play $\text{block}$. Otherwise skip this $p_i$.

After Phase 1, track $B_{\text{blocked}} := \{p_i \in B : $ the block containing $p_i$ was successfully played and $p_i$ has not been played as a prime by Shortener$\}$.

**Phase 2 — complete graph on blocked small primes.** For each pair $(p_a, p_b)$ with $p_a, p_b \in B_{\text{blocked}}$, $p_a < p_b$, at Prolonger's turn: if $p_a \cdot p_b$ is currently legal, play it. Iterate until all legal pairs are exhausted.

**Phase 3 — block large primes.** Pick $p^* := \min B_{\text{blocked}}$. For each prime $q \in (y_L, n/2]$ in order (smallest first), at Prolonger's turn: if $p^* \cdot q \le n$ is legal, play it.

**Phase 4 — fallback.** After Phase 3, Prolonger plays any legal move (smallest legal integer) until game ends.

## Shortener's counter-strategy

Shortener is trying to minimize $L$. Implement the "optimal-counter" strategy that this protocol is alleged to defeat:

At each Shortener turn, in priority order:
1. If any prime $q \in (y_L, n/2]$ is currently legal and unplayed, play the smallest such $q$. *(Kill the large-prime fiber before Prolonger can block it.)*
2. Else if any prime $p \in B$ is currently legal and unplayed, play the smallest such $p$. *(Kill the small-prime carrier before Prolonger can weaponize it.)*
3. Else if any prime $p \in (y_m, y_L]$ is currently legal, play the smallest. *(Medium primes — still useful to deny padding material.)*
4. Else if any prime $p \in (y_s, y_m]$ is currently legal and not already used as padding, play the smallest. *(Steal padding material if possible.)*
5. Else play the smallest legal integer.

This matches the "1-to-1 racing" analysis in the response under audit.

Implement at least one additional Shortener variant for comparison — the simplest is `S_smallest_legal_prime` (always play smallest legal odd prime), since that's the natural baseline the Resolution Theorem's Phase 1 uses. A third useful variant is `S_smallest_legal` (any legal integer, not just primes) which serves as a sanity check.

## Grid

- $n \in \{1000,\ 3000,\ 10{,}000,\ 30{,}000,\ 100{,}000,\ 300{,}000,\ 1{,}000{,}000\}$.
- Shortener strategies: `S_race`, `S_smallest_legal_prime`, `S_smallest_legal`.
- Prolonger strategy: the three-phase protocol above (single strategy — this task is specifically about testing it).
- All runs deterministic; no random seeds needed.

## Output

Write raw results to `phase3/deepthink_protocol.csv` with columns:

- `n`, `shortener`, `L`, `L_log_n_over_n`, `L_log_n_over_n_loglog_n`, `phase1_moves`, `phase2_moves`, `phase3_moves`, `phase4_moves`, `B_blocked_size`, `Q_blocked_size`, `shortener_large_primes_preempted`, `shortener_small_primes_preempted`.

Write a synthesis to `phase3/deepthink_protocol_summary.md`:

- Table of $L \log n / n$ and $L \log n / (n \log\log n)$ across $n$ for each Shortener.
- For the `S_race` Shortener (the protocol's intended counter): does $L \log n / (n \log\log n)$ stabilize or decay? If it stabilizes, at what constant? If it decays, does $L \log n / n$ stabilize instead?
- Top-line verdict: "Consistent with $\Theta(n \log\log n / \log n)$" if $L \log n / (n \log\log n)$ flattens; "Consistent with $\Theta(n / \log n)$" if $L \log n / n$ flattens; "Inconclusive" if neither does cleanly at this scale.
- Report observed ratios of $|B_{\text{blocked}}| / \pi(y_s)$ and $|Q_{\text{blocked}}| / \pi(n/2) - \pi(y_L))$ — the protocol predicts both should approach $\approx 1/2$ under 1-to-1 racing.

## Sanity checks

- At $n = 1000$: $y_s = 3$, $y_m = 9$, $y_L = 316$. $B = \{2, 3\}$ (or possibly empty depending on $\lfloor \cdot \rfloor$ treatment — document the convention). The protocol degenerates at small $n$; that's expected. Log it and move on.
- At $n = 10{,}000$: $y_s = 4$, $y_m = 21$, $y_L = 1995$. $B = \{2, 3\}$. Still small, still likely degenerate.
- The protocol only becomes interesting when $\pi(y_s)$ is a meaningful number — roughly $n \ge 10^5$ ($y_s \ge 6$, $\pi(y_s) \ge 3$) to $10^6$ ($y_s = 10$, $\pi(y_s) = 4$). For this reason, include larger $n$ in the grid — the trend at $n \ge 10^5$ is what matters.
- Verify the final $A$ is a valid antichain in every run (no element divides another). Assertion error on failure.
- Verify $A$ is maximal (no legal move remains). Assertion error on failure.

## Known pitfalls

- **Phase 1 block feasibility.** At small $n$, the padding regime $(y_s, y_m]$ may contain too few primes to pad every block to $\sqrt n$. If a block can't reach $\sqrt n$, log it and skip — don't play a degenerate block. Track how many of $\pi(y_s)$ small primes got blocks built around them; report this count in the summary.
- **Phase 3 legality.** $p^* \cdot q$ is legal only if no prior move divides it. Phase 1 blocks can contain $p^*$, so some early blocks may have made $p^* \cdot q$ illegal for many $q$. Implement the legality check carefully and log how many Phase 3 moves Prolonger actually gets to play.
- **Phase 4 termination.** After Phases 1–3, the remaining game may be long (every forced atomic repair $p \cdot q$ contributes a move). Don't truncate. Let it run until the antichain is maximal.
- **Turn alternation.** Prolonger moves first. Each phase consumes Prolonger's turns; Shortener's turns interleave 1-to-1 between Prolonger moves. A phase may span many Prolonger turns, with Shortener moves interspersed. Do not batch Phase 1 moves onto consecutive Prolonger turns ignoring Shortener's responses.
- **Large-prime count.** $\pi(n/2) - \pi(n^{5/6})$ grows like $n/(2\log n)$. For $n = 10^6$, that's $\sim 36{,}000$ large primes. Phase 3 and the resulting Phase 4 atomic repairs dominate the game length — plan memory and runtime accordingly.
- **Prime-legality caching.** Maintain a sieve of $\{2, \ldots, n\}$ with a "legal" flag per integer. Update on each move by marking multiples and divisors illegal. $O(n \log\log n)$ per sweep is fine; avoid $O(n^2)$ inner loops.

## Deliverables

1. `erdos-872/phase3/deepthink_protocol.py` — the simulator.
2. `erdos-872/phase3/deepthink_protocol.csv` — raw run data.
3. `erdos-872/phase3/deepthink_protocol_summary.md` — the stabilization-check synthesis and top-line verdict.
4. `erdos-872/phase3/test_deepthink_protocol.py` — unit tests covering Phase-1 block-build correctness at small $n$, legality edge cases, and antichain-maximality assertions.
5. `erdos-872/phase3/logs/deepthink_protocol.log` — run log.

No modifications to Phase 0, 1, or 2 files.

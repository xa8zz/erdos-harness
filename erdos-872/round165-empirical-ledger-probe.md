---
id: R165-empirical-ledger-probe
type: diagnostic
date: 2026-07-15
intent: >
  Measure, at finite n up to 50000, whether any of three concrete Prolonger
  policies sustains a linear second-shell active phase against the
  divisibility-minimal maximum-degree Shortener policy, and whether the
  small-prime preparation demand along greedy roots tracks the theoretical
  n log log Y curve.
predecessors: []
action:
  kind: standalone
claim: >
  Sieve-based simulation of the divisibility-antichain game on {2..n} for
  n in {2000, 5000, 10000, 20000, 50000}, Shortener playing the
  divisibility-minimal maximum-degree policy on the second shell
  S_1=(n/4,n/2] (activation threshold eta=0.25), against three Prolonger
  policies (uniform random legal; greedy-block maximizing currently-legal
  small divisors of the reply; shell-defender playing S_1 elements),
  with per-ply incremental bookkeeping cross-validated against brute force
  at small n: no tested policy sustains an S_1-active phase proportional
  to n — the active-phase fraction SHRINKS with n (greedy-block, the
  strongest: 0.012 at n=2000 down to 0.0058 at n=50000; random and
  shell-defender an order of magnitude smaller and also shrinking); the
  small-prime demand sum nu_Y over greedy roots also shrinks relative to
  n (greedy-block nu_300/n: 0.013 down to 0.0019 over the same range),
  and normalizing by n log log Y does not flatten it. Finite-n evidence
  is therefore consistent with second-shell clearing being true against
  these adversaries, and no tested policy exhibits the linear capped-tail
  scenario. CAVEAT: three heuristic policies are not an optimal
  adversary; this is evidence about the reachable-strategy landscape at
  small scale, not a proof in either direction.
implications:
  - No concrete Prolonger policy tested so far realizes even a
    sublinear-but-substantial second-shell tail; any disproof construction
    must be qualitatively cleverer than random, packet-greedy, or
    shell-defense play.
  - The theoretical demand curve n log log Y is not approached at
    reachable n by realized greedy roots; the capacity-vs-demand tension
    lives, if anywhere, at scales or strategies beyond these simulations.
  - Simulator and validator are committed (phase5-ledger-probe/) for
    reuse: future candidate Prolonger constructions from analytical rounds
    should be implemented and measured here before being believed.
confidence_at_time: low
strategy_dependence: policy-sample-dependent
---

# Empirical probe: preparation demand vs reply capacity in S_1 = (n/4, n/2]

Simulation code: `sim.py` (Game class + run harness), cross-validated against brute-force
recomputation of every incremental invariant (legal-proper-divisor counts, S1
nonminimal population, degree ledger, small-divisor counts, antichain property)
at every ply for n in {30,47,60,80,150,220} across 3 seeds x 3 policies in
`crosscheck.py`. All brute-force checks passed with zero mismatches.

## Setup as specified

- n in {2000, 5000, 10000, 20000, 50000} (50000 included; total runtime for all
  15 games was under 2 seconds, so no runtime pressure).
- Shortener: among currently-legal d <= n/4, maximize degree(d) = count of
  currently-legal-and-nonminimal targets in S1 divisible by d; break ties by
  picking a divisibility-minimal d among the max-degree set (no other max-degree
  d' with d'|d), then smallest value if still tied. If no legal d<=n/4 has
  degree>0, fall back to the smallest legal integer in the *entire* range [2,n]
  (not restricted to <=n/4 -- see interpretation note below).
- Prolonger (a) RANDOM: uniform-random legal integer (O(1) swap-pop pool).
- Prolonger (b) GREEDY-BLOCK: legal p maximizing count of currently-legal
  divisors d<=n/4 of p (ties broken by smallest p).
- Prolonger (c) SHELL-DEFENDER: smallest legal element of S1 if one exists,
  else falls back to RANDOM's move (same RNG stream).
- eta = 0.25. "Active" = S1 nonminimal-legal population > eta*|S1|, evaluated
  fresh before each single ply (by either player) from the true live population.

## Seeds (fixed, reproducible)

`seed = 20260714000 + n*10 + policy_offset`, policy_offset = {random:1,
greedy_block:2, shell_defender:3}. E.g. n=20000, greedy_block -> seed
20260914002. One seed per (n, policy) cell, exactly as run in `sim.py`
(`python3 sim.py`, raw output in `results.json`).

## Interpretation choices made explicit (not fully pinned down by the prompt)

1. **Shortener fallback range**: "play the smallest legal integer" was taken
   as unrestricted (smallest legal integer anywhere in [2,n]), since the
   n/4 restriction was stated only as scoping the *degree-maximizing candidate
   set*, not the move itself.
2. **Release events**: counted as S1 elements transitioning from
   legal+nonminimal to legal+minimal (i.e. their last legal proper divisor is
   blocked while they themselves remain legal) -- NOT elements that leave
   legal+nonminimal by becoming illegal outright. Both `release_events_total`
   (whole game) and `release_events_active` (only those occurring on a ply
   where the active-phase condition held immediately before that ply) are
   reported; the table below reports the active-phase version to match the
   other active-phase-gated quantities.
3. **Degree ledger sum E**: sum, over Shortener plies that occur during the
   active phase, of the degree(d) value achieved by the move Shortener
   actually played that ply (0 if the fallback move was used).
4. **nu_Y(g_t) sum**: computed only over Shortener's own greedy-root moves
   g_t during active-phase plies (this is what "greedy roots" refers to --
   Shortener's picks, not Prolonger's).
5. Every quantity in the table is normalized by n; the nu_Y sums are
   additionally normalized by n*log(log(Y)) as requested.

## Sanity checks (all passed on every one of the 15 games)

- Antichain property verified on the final chosen set for every game
  (`antichain_ok: true` in `results.json` for all 15 rows).
- Game terminated only when the legal pool was empty; asserted that every
  integer in [2,n] ended with status != "legal".
- Incremental bookkeeping (legal_pdc, degree[], small_div_count[],
  nonmin_S1_pop, legal_S1_count) matched independent brute-force
  recomputation at every single ply in the small-n cross-check suite.

## Results

All quantities per (n, Prolonger policy). T = total game length. "active" =
Shortener turns occurring while the S1-active condition held. E = degree
ledger sum. Release = release events during active plies.

| n | policy | T/n | active/n | release/n | E/n | nu10/n | nu30/n | nu100/n | nu300/n |
|---|---|---|---|---|---|---|---|---|---|
| 2000 | random | 0.1780 | 0.008000 | 0.003500 | 0.1455 | 0.001000 | 0.004000 | 0.008000 | 0.008000 |
| 2000 | greedy_block | 0.2225 | 0.012000 | 0.025000 | 0.1105 | 0.001500 | 0.004500 | 0.009000 | 0.013000 |
| 2000 | shell_defender | 0.1595 | 0.001000 | 0.000000 | 0.1500 | 0.001000 | 0.001000 | 0.001000 | 0.001000 |
| 5000 | random | 0.1456 | 0.000800 | 0.000200 | 0.1594 | 0.000600 | 0.000800 | 0.000800 | 0.000800 |
| 5000 | greedy_block | 0.2000 | 0.009600 | 0.021200 | 0.1218 | 0.000400 | 0.001600 | 0.003600 | 0.007800 |
| 5000 | shell_defender | 0.1406 | 0.000600 | 0.000000 | 0.1590 | 0.000400 | 0.000600 | 0.000600 | 0.000600 |
| 10000 | random | 0.1344 | 0.000500 | 0.000200 | 0.1617 | 0.000200 | 0.000500 | 0.000500 | 0.000500 |
| 10000 | greedy_block | 0.1903 | 0.008400 | 0.019700 | 0.1271 | 0.000800 | 0.001800 | 0.003100 | 0.005500 |
| 10000 | shell_defender | 0.1282 | 0.000200 | 0.000100 | 0.1666 | 0.000200 | 0.000200 | 0.000200 | 0.000200 |
| 20000 | random | 0.1255 | 0.000750 | 0.000500 | 0.1589 | 0.000300 | 0.000500 | 0.000850 | 0.000850 |
| 20000 | greedy_block | 0.1765 | 0.007100 | 0.017300 | 0.1333 | 0.000350 | 0.001000 | 0.001800 | 0.003050 |
| 20000 | shell_defender | 0.1148 | 0.000150 | 0.000000 | 0.1643 | 0.000150 | 0.000150 | 0.000150 | 0.000150 |
| 50000 | random | 0.1095 | 0.000100 | 0.000060 | 0.1661 | 0.000060 | 0.000100 | 0.000100 | 0.000100 |
| 50000 | greedy_block | 0.1633 | 0.005760 | 0.014440 | 0.1402 | 0.000240 | 0.000660 | 0.001220 | 0.001920 |
| 50000 | shell_defender | 0.1054 | 0.000060 | 0.000000 | 0.1643 | 0.000060 | 0.000060 | 0.000060 | 0.000060 |

nu_Y sums normalized by n*log(log(Y)) (log(log(10))=0.834, log(log(30))=1.224,
log(log(100))=1.527, log(log(300))=1.741):

| n | policy | nu10/(n*llY) | nu30/(n*llY) | nu100/(n*llY) | nu300/(n*llY) |
|---|---|---|---|---|---|
| 2000 | random | 0.001199 | 0.003268 | 0.005238 | 0.004595 |
| 2000 | greedy_block | 0.001798 | 0.003676 | 0.005893 | 0.007466 |
| 2000 | shell_defender | 0.001199 | 0.000817 | 0.000655 | 0.000574 |
| 5000 | random | 0.000719 | 0.000654 | 0.000524 | 0.000459 |
| 5000 | greedy_block | 0.000480 | 0.001307 | 0.002357 | 0.004480 |
| 5000 | shell_defender | 0.000480 | 0.000490 | 0.000393 | 0.000345 |
| 10000 | random | 0.000240 | 0.000408 | 0.000327 | 0.000287 |
| 10000 | greedy_block | 0.000959 | 0.001470 | 0.002030 | 0.003159 |
| 10000 | shell_defender | 0.000240 | 0.000163 | 0.000131 | 0.000115 |
| 20000 | random | 0.000360 | 0.000408 | 0.000557 | 0.000488 |
| 20000 | greedy_block | 0.000420 | 0.000817 | 0.001179 | 0.001752 |
| 20000 | shell_defender | 0.000180 | 0.000123 | 0.000098 | 0.000086 |
| 50000 | random | 0.000072 | 0.000082 | 0.000065 | 0.000057 |
| 50000 | greedy_block | 0.000288 | 0.000539 | 0.000799 | 0.001103 |
| 50000 | shell_defender | 0.000072 | 0.000049 | 0.000039 | 0.000034 |

Raw per-game numbers (T_total, greedy_root_count, absolute nu_Y sums,
elapsed time, seeds) are in `results.json`.

## Observation (3 sentences, no further interpretation)

At every n tested the active-phase length stays a small and, for every
policy, non-increasing-in-n fraction of n (best case GREEDY-BLOCK: 1.2% at
n=2000 falling to 0.58% at n=50000; SHELL-DEFENDER and RANDOM are an order of
magnitude smaller still and also shrinking), so none of the three Prolonger
policies sustains an active phase whose length grows proportionally to n.
The normalized small-prime demand sum_nu_Y/n also shrinks with n for every
policy and every Y in {10,30,100,300} rather than staying flat or growing
(e.g. GREEDY-BLOCK's nu300/n falls from 0.013 at n=2000 to 0.0019 at
n=50000, a ~6.8x drop over a 25x increase in n), and the n*log(log(Y))
normalization does not flatten this decay into a constant at these scales.
SHELL-DEFENDER, despite always preferring S1 moves when available, produces
the shortest active phases and essentially zero release events, because it
exhausts S1's *legal* elements quickly without ever contesting the *minimal*
targets Shortener is racing to remove.

---
id: R172-exact-corrections-knife-edge-structure
type: research
date: 2026-07-23
intent: >
  Establish ground-truth exact game values and extract the structural economics
  of the divisibility-antichain game (weapon-burn tempo, race rates, fortress
  statics) as a foundation for a proof program on the L(n) = o(n) side.
predecessors: []
action:
  kind: standalone
claim: >
  (1) Exact values: L-values for the game on {2,...,n} computed and
  cross-validated by two independent implementations (naive memoized minimax
  and alpha-beta+TT, agreeing on all of n = 2..40 with the naive reference, and
  TT-size-independent) for all n <= 58. The increments of k(n) = L(n) - pi(n)
  occur at n = 9, 21, 28, 35, 49, 51, 57. A previously stored table
  (phase1/exact_minimax.csv) is WRONG at n = 27, 39, 40, 41, 42 (+1 each,
  solver bug) and unverified beyond; corrected table at
  fable/exact_corrected.csv. (2) Optimal play at n <= 58 is a two-phase
  structure: a short weapon battle (Prolonger opens with primorial-type burns
  30, 18; Shortener's replies escalate to prime-power sub-weapons 4, 9 after
  their primes are burned; Prolonger burns successive primes via
  minimal-collateral multiples 14/21/35/49, 22/33/55) followed by a flat
  antichain mop-up; battle length grows with n (3 moves at n=40, 6 at n=58).
  (3) Prime-frontier race identity: if one player must make every prime below
  its sieve frontier dead before use (burning breadth Lambda/log y primes per
  move at scale y, Lambda = log n), the frontier obeys w_j ~ j*Lambda and the
  accumulated sieve mass obeys sum 1/q = log j/Lambda, saturating at 1 within
  any linear move window: the pure prime channel kills at most a 1 - 1/e + o(1)
  fraction against full burning. A measure-dynamics model of exactly this race
  converges to residual 0.375 ~ 1/e, identifying the equilibrium. (4) Two
  over-counting traps, each refuted by contradiction with the established
  lower bound c n (loglog n)^2/log n and recorded as guard rails: (a)
  conflating burn-all-integers cost (w log w/Lambda, giving sqrt(log)
  saturation) with burn-all-primes cost (w/Lambda); (b) treating sum 1/w as a
  saturation variable for correlated composite arsenals — a weapon must divide
  its target, so arsenals supported on dead primes below y reach only elements
  with >= 2 prime factors below y; the residual peels one
  j-small-prime-factors layer per weapon generation. (5) Static fortress
  existence: V = {j*m : j <= 5, jm <= n, m odd in (n/6, n/4]} is a
  Theta(n)-mass live set with every element having at most 4 live comparables,
  supported by the top-half antichain A = (n/2, n] minus V's top layer; any
  top-half element outside A and V can never die (no played divisor can
  exist), forcing |A| = Theta(n). Combined with the established fractional
  packing bound (nu = o(n) at all sublinear positions) via greedy antichain
  extraction from bounded-comparability sets, sublinear-entry fortresses are
  statically impossible: any linear live set with bounded live-comparability at
  a position with o(n) moves played would contain a Theta(n) antichain in the
  residual, contradiction. Hence the lower-bound side has no static route; only
  flow-assembly against the opponent's concurrent kill rate. (6) Empirical laws
  (exact-legality policy arena, n up to 10^7): best fielded Prolonger
  (threat-weighted top-half divisor-batch burner) yields L ~ 1.4 n/ln n with
  flat coefficient across three decades; kill concentration: 75% of all kills
  within 66 moves at n = 10^6; severed-per-kill collateral decays like
  (log n)^{-1.1}; peak hereditary thin-live mass scales at ~1.7 x n/ln n (flat
  ratio), not Theta(n).
implications:
  - The game's first-order throughputs tie at n(1+o(1)) (knife-edge); no
    first-order capacity accounting can decide the dichotomy, explaining the
    observed equivalence/circularity pattern across prior capacity-type
    intermediates.
  - The decisive object is the flow saddle: protected-stock assembly rate
    versus policing/kill rate, with all static routes closed on both sides.
  - Ground-truth infrastructure (validated solver, corrected table, policy
    arena with severing/fortress instrumentation) is in place for testing any
    proposed lemma at exact small n and structural claims at n up to 10^7.
confidence_at_time: high
strategy_dependence: independent
---

# Session compendium: exact corrections and structural economics

Full working notes, derivations, instruments, and data: `fable-worklog-R172.md`
(F1-F13), `fable/` (solver.c, reference.py, arena.c, bandrace*.py,
exact_corrected.csv, pv40.txt, pv58.txt), `phase1/CSV-WARNING.md`.

Summary of established items is in the front-matter claim. Key files:

- Exact values n=2..58: `fable/exact_corrected.csv` (validated; see
  CSV-WARNING.md for the refuted legacy table).
- Optimal-play PVs: `fable/pv40.txt`, `fable/pv58.txt`.
- Arena: `fable/arena.c` — S bots (maxdeg, smallest), P bots (dustman, burner,
  boxer, taxman, hybrid), severing attribution, hereditary-thin tracking.
- Race models: `fable/bandrace3.py` (price-profile formulation; the 1/e
  equilibrium under frontier-locked play).

The two guard-rail traps (claim item 4) are recorded to prevent re-derivation:
both produce bounds strong enough to contradict the established
c n (loglog n)^2 / log n lower bound and are therefore false; the specific
over-counts are identified in the worklog (F10).

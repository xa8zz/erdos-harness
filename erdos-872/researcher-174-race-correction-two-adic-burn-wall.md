---
id: R174-race-correction-two-adic-burn-wall
type: verification
date: 2026-07-23
intent: >
  Machine-audit the four load-bearing claims underpinning the hereditary rate
  program (live-prime charge, static thin fortress, gcd absorption,
  prime-frontier race cap) by exhaustive finite check and exact-legality
  simulation, replacing an external-referee pass.
predecessors: [R172-exact-corrections-knife-edge-structure, R173-hereditary-rate-program]
action:
  kind: refutes
  target: R172-exact-corrections-knife-edge-structure
failure_mechanism: >
  Scope: refutes exactly item (3) of the target claim bundle (the
  prime-frontier race identity: frontier lock w_j ~ j*log n, saturation
  sum 1/q -> 1, kill cap 1 - 1/e, and the measure-model residual-0.375 = 1/e
  identification). Items (1), (2), (4), (6) are untouched; item (5) (static
  fortress) is CONFIRMED by exhaustive machine check at n = 10^3, 10^4, 10^5
  (antichain, A-V incomparability, full cover, max V-degree 4 attained at
  m-layer elements, |V| ~ 0.183n, |A| ~ 0.400n; zero violations). The race
  error: the model assumed a burning move needs a live PRIME pad above the burn
  front, so the pad zone empties and the burn front locks. In the actual game a
  burned-but-unplayed integer remains a legal factor of new moves: after
  Prolonger's first move kills 2, every window (n/2, n] contains a power-of-2
  multiple 2^a * p of any live prime p <= n/2, so x = 2^a * (greedy live-prime
  core) is always a legal top-half burn. Consequences, verified by
  exact-legality simulation at n = 10^5, 10^6, 10^7: (i) the burn wall is n/2,
  not any sublinear frontier — deepest burned prime 49993 / 499973 / 4999999
  against n/2 = 50000 / 500000 / 5000000; primes in (n/2, n] are unburnable
  (no proper multiple <= n) and form Shortener's reserve, but their cones are
  singletons (1 kill per move). (ii) Shortener's stolen primes below n/2 obey
  sum 1/q = 0.556 / 0.589 / 0.618, monotone in n toward the log-integral
  prediction ln 2 = 0.693 (steal rate 1/(k(y)+1) at front y with batch breadth
  k(y) ~ (log n)/(log y) gives sum 1/q -> integral dy / (y (log n + log y)) =
  ln 2). (iii) The prime-channel kill fraction is 0.539 / 0.553 / 0.565, rising
  slowly and consistent with asymptote 1/2 + o(1) (1 - e^{-ln 2}, plus a
  vanishing reserve-mass and Mertens-correction excess at finite n) — NOT the
  claimed cap 1 - 1/e = 0.632. (iv) The frontier is not locked at j*log n:
  measured q_j / (j log n) traces a hump 1.2 -> 1.7 -> 1.3 across the race
  (two-regime shape: batch-sweep then reserve-linear), so the frontier-lock
  premise of the prior measure-dynamics model is false and its 0.375-residual
  equilibrium was a model artifact, not a game constant.
claim: >
  Corrected race structure, all parts machine-verified under exact legality:
  (1) Against the 2-adic full burner (x = 2^a * greedy-core, always legal up to
  the n/2 wall), the pure smallest-live-prime channel gives Shortener ~pi(n)
  moves whose kill cones cover 1/2 + o(1) of the board; the surviving carcass
  (elements with no Shortener-played prime factor; same-core divisor collateral
  is o(n/log n) since batch breadth k(y) decays and sum of 2^{k} over batches
  is dominated by the earliest ones) has density 1/2 + o(1) and contains no
  live prime: the game recurses on a half-size board whose minimal live
  elements are cross-core composites. (2) This yields an explicit
  level-dynamics candidate for the scale induction: one full race round costs
  O(n / log n) moves for each side and halves the live board while degrading
  weapon structure from primes to two-generated composites; iterating the
  halving gives sum over levels (n / 2^i) / (log n - i) = O(n / log n) total
  IF each carcass level supports the same race shape — making the contraction
  hypothesis of the scale-induction program equivalent to a
  carcass-self-similarity statement with explicit strategies on both sides.
  (3) Confirmations: the static thin fortress (target item 5) passes
  exhaustively at three scales; the live-prime charge lemma (at most
  (D+1) pi(n) live elements with a live prime factor at max-live-degree-D
  positions) and the gcd absorption lemma (two divisors of one x <= n with
  quotients <= H have gcd with quotient <= H^2) are re-derived with full
  hypotheses and stand.
implications:
  - The pure prime channel is a HALF-board mechanism, stronger than the
    refuted 1 - 1/e cap but still bounded away from completion: any full-play
    accounting must route the remaining half through composite weapons, which
    are exactly the correlation-limited (layer-peeling) channel.
  - The five-gear program (target R173) survives with one citation repaired:
    its G1 sieve-phase argument used only the move-count bound (prime-channel
    moves <= pi(n) = O(n / log n)), which the correction strengthens; the
    retired 1/e ornament was not load-bearing there.
  - The halving recursion gives the first explicit two-sided strategy
    instantiation of the contraction step: the open invariant reduces to
    whether carcass boards are race-self-similar (Prolonger's alternative —
    refusing to burn — leaves live primes as Shortener weapons, which is the
    other horn of the count-race reduction).
  - Prime powers 2^a * p as burn vehicles simultaneously pre-kill the 2-power
    sub-weapon ray of p, connecting the asymptotic burner to the prime-power
    escalation seen in exact optimal play at n <= 58.
verifiers_at_time:
  - [exhaustive-fortress-check-n-1e3-1e4-1e5, agrees]
  - [exact-legality-race-sim-n-1e5-1e6-1e7, agrees]
confidence_at_time: high
strategy_dependence: strategy-specific-refutation
prompt: erdos-872/prompts/audit-R172-R173-four-claims.md
---

# Machine audit of the four program claims; race identity corrected

Checker and simulator: `fable/verify_claims.py` (fortress checker: exhaustive
(a)-(e) verification; race simulator: exact-legality bookkeeping, front-aware
and 2-adic Prolonger variants). Run outputs reproduced below.

## Audit verdicts

- Claim 1 (live-prime charge): VALID. Charge each live x with a live prime
  factor to one such p; x = p or x is a live proper multiple of p, and p has at
  most D live comparables, so each of the at most pi(n) live primes receives at
  most D + 1 elements.
- Claim 2 (static thin fortress): VALID — machine-confirmed, zero violations:

  | n      | V (frac)        | A (frac)        | max V-deg | bad pairs | uncovered |
  |--------|-----------------|-----------------|-----------|-----------|-----------|
  | 10^3   | 185 (0.185n)    | 399 (0.399n)    | 4 (at 167)  | 0 | 0 |
  | 10^4   | 1835 (0.183n)   | 3999 (0.400n)   | 4 (at 1667) | 0 | 0 |
  | 10^5   | 18335 (0.183n)  | 39999 (0.400n)  | 4 (at 16667)| 0 | 0 |

- Claim 3 (gcd absorption): VALID. lcm(d1, d2) = d1 d2 / g divides x <= n, so
  g >= d1 d2 / n >= (n/H)^2 / n = n / H^2.
- Claim 4 (race cap): REFUTED as stated; corrected structure in front-matter.
  Both defects the audit prompt flagged as sub-questions materialized:
  (i) the naive greedy batcher goes illegal almost immediately (pad window
  lands inside its own burned zone — first simulation: 89 total burns at
  n = 10^6, then forced passes forever); a front-aware prime-pad variant dies
  at front ~ sqrt(n)/2 (measured 157 / 499 / 863 at n = 10^5 / 10^6 / 3*10^6);
  the 2-adic pad removes the wall entirely (burns to n/2 exactly).
  (iii)/(iv) fail in constant: coverage exceeds 1 - 1/e at every scale.

## Race simulation, 2-adic burner vs smallest-live-prime (exact legality)

| n     | S prime moves | stolen <= n/2 | reserve > n/2 | P burned | deepest burn | sum 1/q stolen | coverage |
|-------|--------------|---------------|---------------|----------|--------------|----------------|----------|
| 10^5  | 7016         | 2557          | 4459          | 2576     | 49993        | 0.5561         | 0.5388   |
| 10^6  | 57705        | 20745         | 36960         | 20793    | 499973       | 0.5893         | 0.5529   |
| 10^7  | 490262       | 174196        | 316066        | 174317   | 4999999      | 0.6180         | 0.5653   |

Frontier shape (q_j / (j log n) at quintiles of the race): 1.47 / 1.63 / 1.49 /
1.32 / 1.24 at n = 10^5; 1.61 / 1.73 / 1.55 / 1.36 / 1.27 at n = 10^7 — a hump,
not a constant: no frontier lock.

## The carcass recursion (level dynamics for the scale induction)

After a full race round: board halves; carcass = integers with all prime
factors in Prolonger's burned set, minus o(n / log n) same-core collateral
(cross-core products survive: distinct batch cores are disjoint prime sets, so
a product of primes from two different cores divides neither played batch).
The carcass has no live primes; its minimal live elements are two-generated
composites. One round costs O(n / log n) moves per side. Iterated halving sums
to O(n / log n) total IF carcass levels are race-self-similar — the explicit
form of the contraction hypothesis. Prolonger's only alternative is to leave
primes unburned, arming Shortener's direct channel: the count-race dichotomy,
now with both horns carrying explicit strategies and measured constants.

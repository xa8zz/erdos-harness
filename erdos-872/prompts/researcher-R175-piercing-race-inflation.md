Don't search the internet. This is a test to see how well you can craft non-trivial, novel and creative proofs given a "combinatorial game theory / analytic number theory" math problem. Provide a full unconditional proof or disproof of the problem.

## Problem

Two players alternately pick integers from {2, 3, ..., n}, never picking an
integer that divides or is divisible by an already-picked integer (the picked
set stays an antichain under divisibility); the game ends when the picked set
is a maximal antichain. Prolonger moves first and wants to maximize the total
number of moves L(n) made by both players; Shortener wants to minimize it.
Both play optimally. Prove or disprove: L(n) = o(n).

## Known progress

- L(n) >= c n (log log n)^2 / log n for an absolute c > 0; and
  L(n) <= 0.1897123371 n. (The upper bound comes from an explicit Shortener
  strategy analyzed via a weight function on prime-power layers.)
- Exact values by alpha-beta search with transposition tables (two
  independent implementations cross-validated): L(n) for n = 58..80 is
  23,24,24,25,25,25,25,26,26,27,27,27,27,28,28,29,29,30,30,30,30,31,31.
  Over 40 <= n <= 80 the quantity L(n) log n/(n log log n) stays in
  [1.13, 1.20] with no trend (empirical observation, not a theorem).
- Move identity: playing x kills exactly the live integers comparable to x
  (its undominated divisors and multiples), so n - 1 = L + (total killed).
- The top half T = (n/2, n] is an antichain: no element of T divides
  another. No play by either player ever kills an element of T except a
  play of an integer w <= n/2 with a multiple in T (playing w kills all
  live multiples of w), or a play of an element of T itself (killing its
  divisors only). Consequently L = n - 1 - IK - TK where IK <= n/2 - 1 is
  the interior (<= n/2) death count and TK is the count of top-half
  elements killed by interior plays; so L >= n/2 - TK, and L(n) = o(n) is
  equivalent to: Shortener can force TK >= n/2 - o(n).
- Piercing identity (proved): call a play of an interior integer w <= n/2 a
  "fire" of w; let F be the set of fired integers over the whole game. A
  top-half element z gets PLAYED (rather than killed) only if no element of
  R(z) := {divisors of z in [2, n/2]} is ever fired while z lives — indeed
  a fire of w with w | z kills z on the spot, and playing z is impossible
  after z is dead. Moreover if w in R(z) is fired at a moment z is already
  dead, z was killed earlier, so for every eventually-played z one has
  R(z) ∩ F = ∅ outright, and every element of R(z) died as collateral of
  plays at integers not comparable to z. In particular, once a prime q is
  fired, no top-half multiple of q is ever played.
- Prime theft-floor theorem (proved; the base case of a potential wave
  induction). Consider the race on odd primes 3 <= q <= n/2: the maximizing
  player, moving first, each move removes from play all primes dividing one
  integer x <= n of his choice; the minimizing player each move fires the
  smallest surviving prime. Then the fired set satisfies
      Sum over fired q of 1/q >= c0 > 0, uniformly in n and in the
      maximizer's strategy.
  Proof: distinct primes dividing x have Sum log p <= log x <= log n, so
  after the minimizer's t-th fire, theta(q_t) <= 2 t log n; Chebyshev's
  theta(x) >= kappa x gives q_t <= 3 t log n / kappa; each move-pair
  removes at most log n/log 3 + 1 primes so the race lasts
  T >= c n/log^2 n fires; hence Sum 1/q_t >= (kappa/3)(log T/log n) ->
  kappa/3. Numerically the floor realizes as 0.49..0.62 for n = 1e4..1e8
  against the minimizing (budget-packing) adversary. Via an upper-bound
  sieve this kills a positive fraction of any prescribed top-half stock
  through wave 1 (prime divisors), against every Prolonger strategy.
- The obstruction to iterating the theft floor at composite "waves"
  (j-fold products of surviving primes as fired weapons): the wave-1 proof
  uses additivity — primes dividing x have total log at most log x. For
  j >= 2, the wave-j items dividing a single x number up to C(omega(x), j),
  so one play can remove wave-j log-mass ~ C(omega(x), j) * (j/omega(x)) *
  log x, combinatorially larger than log n. Whether play-legality (the
  vehicle x and its sub-products must all still be alive at play time, in a
  board being consumed by both players) throttles this inflation to
  O(log n) per move amortized is open, and is precisely what a wave-by-wave
  iteration of the theft floor needs. Measured in adversarial simulation
  with a Prolonger policy built to maximize it: realized wave-2 deletion
  log-mass per Prolonger move rises 0.345, 0.409, 0.426 (in units of log n,
  at n = 1e5, 1e6, 1e7) — saturating, but this is measurement, not proof.
- Kill shares in strong-policy simulated play at n = 1e6..3e7: ~90% of
  top-half kills come from fired primes/prime powers, ~10% from fired
  semiprimes, ~0% deeper; the deeper waves' share grows slowly with n
  (measurement).

## What does not work, and why it fails

- Prolonger burning all small primes and banking the smooth top half:
  killing a prime leaves its powers and all composite products alive as
  one-move weapons (firing 9 kills all live multiples of 9, etc.); full
  protection needs the entire interior divisor lattice of the protected
  stock dead, which is Theta(n) mass, while each interior element is a
  standing one-move weapon during the sweep. Layer-by-layer peeling loses
  a constant fraction of the stock per layer.
- Covering the top half with few tau-rich smooth vehicles ("tiling"):
  vehicles reach only the smooth part of each dyadic band; the non-smooth
  fibers (elements with a large prime factor) each cost dedicated per-fiber
  work to protect while Shortener steals one whole fiber per move by firing
  its prime — element-complete protection costs y^{1-o(1)} per fiber
  against 1-move theft.
- Spending vehicle budget on pre-killing Shortener's best weapon
  ("policing"): a mid-scale weapon at magnitude n^c costs c log n of the
  multiplicative vehicle budget — the same budget defuses many frontier
  targets — and buys almost nothing because the weapon-value distribution
  is flat near its top (the next-best weapon is nearly as good). Measured:
  a policy doing this loses ~8% against the same opponent.
- Naive density/sieve heuristics for the prime race assuming the two sides
  alternate one-prime-at-a-time: the maximizer's move removes all primes
  dividing one x <= n, i.e. up to log n/log y primes near magnitude y in
  one move; the resulting stolen prime mass is Theta(1), not
  (1/2) log log n, and coverage products computed from independence
  heuristics are off by multiplicative constants at all accessible n.

REMEMBER - this unconditional argument may require non-trivial, creative and novel elements.

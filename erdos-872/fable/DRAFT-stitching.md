# DRAFT: The stitching inequality — race coordinates, both directions, deciding constants

Status: WORKING DRAFT (overnight 2026-07-23, session 3). Assembles F23-F26.
This is the successor frame to DRAFT-pursuit-inequality.md P5: same open
core, but now in fire/defusal coordinates where both directions have
explicit mechanisms and the undecided content is pinned to named constants.

## 1. Coordinates (all identities exact)

Board {2..n}. Top half T = (n/2, n] is an antichain; interior W = {2..n/2}.
- Identity: L = n - 1 - IK - TK, where IK = interior elements killed,
  TK = top-half elements killed. IK <= n/2 - 1 always.
- P never profits from killing T (playing interior x kills top cone(x));
  all P plays of interest are top-half "vehicles" x, killing only live
  divisors of x (chain/box kills: the whole surviving divisor lattice of x).
- S kills T only by playing (firing) a live interior w: kills live
  cone(w) ∩ T. So TK = sum over S fires of fresh top coverage.
- Therefore: L >= n/2 - TK - o(n)-slack, and the whole question is whether
  S can push TK to n/2 - o(n) — i.e., cover the top half by fired cones —
  against P's defusals (a fired w must be alive; P's vehicles kill w's
  ahead of S).
- An element z in T is SAFE once its full interior divisor set R(z) is dead
  with no member ever fired while z lived. Safe elements are unkillable
  (comp 0 in T) and each contributes +1 to L in the forced endgame,
  regardless of who plays it. (Exact-PV confirmation: A(n) endgame phase.)

## 2. The race, wave/layer structure

S's fire order is value-descending ~ magnitude-ascending; P's defusal order
is share-descending ~ magnitude-ascending. Both walk the interior upward.
P's per-move defusal capacity at frontier scale y: a packed vehicle
w1*...*wk * 2^a <= n holds k ~ log n / log y targets (p_pack implements
this; pv65's 63 = 3^2*7 is the exact game doing it).

Share integral (F25.2, machine-consistent with R174's measured ln 2): with
capacity k(y) = log n/log y and S firing 1/move, S's stolen interior mass
in 1/w-measure is  integral over exponent t of dt/(1+t) = O(1) — CONSTANT,
not divergent. Consequences:
- The prime layer alone cannot decide the game either way (P keeps a
  positive fraction of prime weapons defused; S steals a positive fraction).
- The game is decided in the composite waves: after wave j sweeps, the
  surviving stock's j+1-fold interior products are the next weapon
  generation ("carcass recursion" of R174, now as waves).

## 3. Direction o(n): what S must prove

Claim shape: exists S-policy with TK >= n/2 - O(n/f(n)), f -> infinity.
Requirement: UNIFORM WAVE COVERAGE — in every wave, S's fires cover a
(1 - delta_j) fraction of the then-surviving protected stock, with
sum_j prod_{i<=j}(1-delta_i) convergent-to-zero fast enough. The candidate
potential for the amortized version:
  Phi = (live protected-stock mass) + lambda * (live armed-weapon value),
with S's greedy-by-tdeg fires giving per-move drops that must beat P's
per-move protections. The pinch: P's protection per move is k(y) targets
but S's fire hits a whole cone — the exchange constant per wave is
    c_j = (S fresh coverage per fire) / (P fresh protection per vehicle),
and o(n) needs liminf over waves of c_j bounded away from 0 UNIFORMLY.
What breaks naive attempts: pack's capacity k(y) -> infinity at small y
(S can't keep up in wave 1 at small scales — measured: stolen prime mass
saturates at a constant).

## 4. Direction Theta(n): what P must prove

Claim shape: exists P-policy and c > 0 with safe mass >= c n vs EVERY S.
Requirement: SHARE COLLAPSE AT ALL LAYER SCALES — P must keep, at every
scale-band and every wave, a positive fraction of stock fully protected,
with the wave-product prod_j (1 - theta_j) bounded below. The pinch:
at scales y = n^t (t bounded below), capacity k = O(1), so per-band S
steals a CONSTANT fraction; the wave telescoping then multiplies constant
losses over the number of effective waves. P survives iff effective waves
= O(1) — i.e. iff protection at wave j makes wave j+1's weapon generation
collapse geometrically. Whether it does is exactly the carcass-recursion
contraction question (F14 scale induction, R174 halving).

## 5. Deciding constants and the measurement program

The first-order ledgers cancel (F25.3: banked ~ interior spend ~ L/2, the
self-funding fixed point). Deciding quantities, each now measurable:
 (K1) capacity profile k(y) realized under best play [arena: pack cores]
 (K2) per-wave theft fraction theta_j vs wave index [arena instrumentation:
      tag each safe/killed top element by its wave = max omega of its
      interior support at death/safety]
 (K3) the doubling ratio r(H) = k(2H)/2k(H) of the exact table [march:
      k = L - pi; k(2H)/2k(H) at (29,58) = 7/6, (32,64) = 7/6, (35,70) ~
      pending; if r(H) falls below 1 the contraction is real at exact level]
 (K4) champion-pair coefficient trend [1.42-flat taxman era -> closure
      1.496/1.532/1.560 rising -> pack 1.548 at 1e5, 1e6/1e7 pending]
 (K5) securing-game exact values at bounded H [clearing.py exact: banked
      2,1,1,2,2,2 at H=16..36 — the abstract bounded-scale margin]

Known-bounds sanity: any conclusion must respect L >= c n (loglog n)^2 /
log n (classical) and L <= 0.1897 n (corpus). The current empirical
posture: pack/closure rising coefficients are consistent with laws between
n/log n and n/(log n)^{1-delta}, delta ~ 0.12; nothing measurable yet
distinguishes such laws from Theta(n/(loglog)^c) or from o(n)-with-slow-f;
the discriminator must be a theorem about (K1)-(K3).

## 6. Bounded-scale anchors (exact, machine-verified tonight)

- Exact table to n=69 (march continuing): L/n oscillates ~0.39-0.41;
  k(n) = L - pi(n): 7 at 57-64, 8 at 65-69.
- Exact-PV anatomy (pvparse.py): contested phase T(n) ~ pi(n/3) + O(1);
  endgame A(n) = L - T; remnant composites = odd products of severed
  primes; two-layer defusal appears at n=65 (P plays 63).
- Optimal small-n play already uses: primorial openers, multi-layer
  vehicles, tower harvests, locked-pair endgames — every mechanism in the
  wave model has an exact-scale counterpart. The stitching inequality, if
  provable, will be provable in these coordinates.

## 7. The piercing formulation (added ~06:50, sharpest S-side statement)

Fact (exact, from the fire mechanics): if S fires w and w | d | z with z
live, then z dies in that same fire. Hence S's fires can never help
liberate a surviving element, and for every SAFE z:
    R(z) ∩ F = ∅,
where F = the set S ever fires. Conversely every element of R(z) must die
as collateral of plays (P's vehicles, or forced endgame chain-kills).

So the o(n) question in final form:

  PIERCING RACE. S builds a fired set F online (one live element per S
  turn; P's plays may kill prospective weapons first). Safe mass = #{z in
  top half: R(z) ∩ F = ∅}. Can S guarantee safe mass = O(n polyloglog/log)
  against every P schedule?

S's baseline: firing any prime factor pierces z, so unpierced stock lives
in the P-protected prime semigroup (the measured race: Θ(1) stolen
1/p-mass each side). S's continuation: fire protected-prime PRODUCTS (the
waves; measured share flat ~10% at w2, arriving slowly at w3+). P's
denial: vehicle chains kill weapons ahead of S's fire cursor at capacity
k(y) = log n/log y per move.

The single lemma that decides o(n) (uniform-in-layer version of the race):
against any adaptive defusal schedule with multiplicative per-move budget,
greedy-value firing pierces all but an e^{-c·(effective waves)} fraction
per wave with constants uniform over waves, waves coupling only through
cone nesting. Measured anchors: wave-1 share 90%, wave-2 ~10% flat,
capacity integral O(1) stolen mass. NOT provable by tonight's tools alone
— this is the formal target for the next session, with Aristotle on the
per-wave pieces.

## 8. THE WAVE-1 THEFT-FLOOR LEMMA (proved, machine-checked ~09:00)

LEMMA (prime theft floor). Consider the wave-1 race: odd primes 3 <= q <=
n/2 listed ascending; players alternate, P first. Each P move deletes the
live primes dividing one integer x <= n of P's choice (so the deleted set
has Sum log q <= log x <= log n — the budget is ADDITIVE: primes have no
common sub-products). Each S move fires (removes and scores) one live
prime. Then S, playing smallest-live-first, guarantees
    Sum over fired q of 1/q  >=  c0 > 0
with c0 absolute (uniform in n and in P's strategy).

PROOF. Let q_t be S's t-th fire. Every prime < q_t is dead: fired ones
have Sum log <= (t-1) log(n/2); P-deleted ones have Sum log <= t log n
(t P moves, additive budget). So theta(q_t) := Sum_{p <= q_t} log p
<= 2t log n. By Chebyshev's theta(x) >= c x (x >= 2):
    q_t <= (2/c) t log n.
The race lasts while live primes remain: per move-pair at most
log n/log 3 + 1 primes die, so T >= c' pi(n/2) log 3/log n >= c'' n/log^2 n.
Hence
    Sum_t 1/q_t >= (c/2 log n) Sum_{t<=T} 1/t = (c/2) (ln T)/(log n)
              = (c/2)(1 - 2 lnln n/ln n + O(1/ln n)) -> c/2 > 0.  QED

Machine check (single-pass adversarial race, budget-packing P — the stolen-
mass minimizer; spite variants worse for P):
    n:        1e4     1e5     1e6     1e7     1e8
    stolen:   0.491   0.537   0.565   0.589   0.616   (floor, slowly rising)
    max q_t/(t ln n): 1.65 .. 1.81                    (Chebyshev constant ~2)
    2x budget: 0.263 .. 0.334  (floor ~ 1/budget-multiple, never 0)

COROLLARY (wave-1 theft). By e^{-x} >= 1-x and the Selberg upper-bound
sieve, the top-half mass with NO fired prime factor is <= C n e^{-c0}: S
unconditionally steals a positive fraction of any P-protected stock at
wave 1. (Trivially known via S playing 2; the content is uniformity over
P's defusal AND that the mechanism is scale-free — it iterates.)

## 9. Where uniformity breaks at wave >= 2 (the precise open gap)

The proof used additivity of the prime budget: primes dividing x have
Sum log q <= log x. For wave-j items (j-fold products of protected primes),
ONE vehicle x deletes ALL j-fold sub-products dividing it: x with omega(x)
= m deletes up to C(m, j) wave-j items of total log-mass ~ (j/m-fraction) *
C(m,j) * log x — COMBINATORIAL INFLATION by ~C(m,j)*j/m, unbounded as m
grows. Wave 1 is the unique wave with no inflation (primes share no
sub-products). So the same Chebyshev argument gives wave-j floors only
with budget B_j(y) ~ (log n)^2/log y-ish, i.e. weakened, possibly
vanishing floors. THE OPEN COMPOSITION QUESTION, now well-posed:

  Can P's vehicle sequence sustain wave-2 deletion log-mass omega(1) *
  log n per move (via high-omega vehicles) UNIFORMLY along the ascending
  race, or does the requirement that vehicles be LIVE top-half integers
  whose sub-products are still live throttle the realized inflation to
  O(log n) per move?

Note both sides have measured anchors: realized wave-2 theft share is FLAT
~10% (not vanishing: some wave-2 floor survives inflation) and the safe
wave-2 mass grows (P's inflation partly works). The next formal step:
bound the realized inflation of LIVE vehicles — a counting problem about
how many live sub-products a live top-half integer can have late in the
race, which the K2/tower instrumentation can measure directly.

If wave-j floors c_j >= c > 0 uniform: safe mass <= n prod (1-delta_j) ->
o(n) once effective waves J(n) -> infinity (they do: loglog-paced arrival,
S has ~L/2 >> J * n/log^2 n moves to run them). If instead inflation kills
the floors at j >= 2: P's protected semigroup survives all composite waves
and the linear question reopens at the wave-2 fixed point. The entire
program now rests on one extremal counting question about live sub-product
inflation.

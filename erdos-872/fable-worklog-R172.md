# Fable-5 solo researcher attempt — working log (R172 track)

Started 2026-07-22. Researcher: Claude Fable 5 acting as primary researcher (user-directed
role change from curator-only; harness verification discipline unchanged — anything
promotion-grade goes to cross-family audit + Aristotle before touching state).

NOT a round doc (no frontmatter; not scanned by compile_rounds.py). Durable working state
for the attempt; survives compaction. Results that mature get proper round docs.

## Problem (exact statement)

For n >= 2, two players alternately choose previously unchosen integers from {2,...,n},
always keeping the chosen set an antichain under divisibility (primitive set). Game ends
when the set is maximal. Prolonger moves first, maximizes total move count; Shortener
minimizes. L(n) = length under optimal play. Prove or disprove: L(n) = o(n).

Bounds: c_delta * n(loglog n)^2/log n <= L(n) <= (0.1897123371 + o(1))n  [W_4/2 Bonferroni].

## Ingest status

- R171 dispatch prompt (43-line verified full map): READ in full.
- R168 (six-route invariant-gap re-synthesis), R169 (prime-band frame), R170 (tensorization
  refutation): READ in full, verbatim.
- state_compiled.md Ruled Out section: READ in full (all failure mechanisms).
- state_compiled.md Established section: indexed (341 entries); pulled on demand via
  `grep -A5 "<id>" state_compiled.md`. Wrapped copy for reading: scratchpad/state_wrapped.md
  (regenerate: `fold -s -w 1600 state_compiled.md`).
- R171 response: NEVER HARVESTED (ChatGPT thread 6a5821f8-663c-83e8-b676-17bfa57bf9d1,
  dispatched 07-16). User decision 2026-07-22: skip; harvest only before any public claim.

## The constraint map (what any new idea must survive)

1. **No certificate-form intermediate exists.** SC*, SC^rel equivalent to second-shell
   clearing (slow-cutoff degree-dilution / TK+CS absorption). Repaired post-peel and
   ancestor-harvest statements equivalent to L(n)=o(n) itself. The ledger program
   terminated: 17 collapse families, "no certificate-form intermediate below
   interval-local halving" (R136); R123's impossibility theorem partially survives audit
   (forward implication only). Any proposed lemma gets checked against all 17 witnesses.
2. **Tensorization false** (R170): for a k-tag move, min_s Sigma_p F_p(s/p) −
   Sigma_p min_{z_p} F_p(z_p) can be ~ n^{3/10}/log n from ONE two-tag episode (a=pqH,
   packets sized M, amplification 3M vs 2M). Band deficit j*log(1+1/j)<1 is static
   projection-multiplicity only. Available from band >= I_3 (needs P < n^{1/3}, i.e.
   H^2 > n/p). Any o(n) route through prime bands needs a genuinely joint asynchronous
   reply-compatibility potential (game on the compatibility hypergraph, R170 §12).
3. **Lower-bound no-gos**: private chains subcritical (N_{j+1} <= (N_j+1)/2); fixed
   finite gadgets walled by pairwise-coprime-core privacy O(pi(N)+sqrt(N)) = o(N);
   rank-k fan constants c_k = 2^{-k-2^{k-1}+1} collapse doubly-exponentially; growing-cap
   fortress gives only n/H; single-policy defeats are not lower bounds; diagonal
   amplification needs the universal-quantifier entry hypothesis (unproved).
4. **Static stock is o(n)** (R80, survives): at every sublinear position, fractional
   packing value nu(A) = o(n); static legal antichain of o(n) lower moves covers all but
   o(n) live targets. The open piece was ALWAYS the flow: bounded-multiplicity ONLINE
   charge (refuted as stated by R82's diagonalization — exact-only bank trap).
5. **Static-vs-dynamic conflation is the house failure mode.** Any stock argument applied
   to a flow quantity dies. Named repeatedly (R168 confirms by 6 routes).
6. **Empirics**: exact f(n) to n=40 (f = pi(n) + k, k=4 by n=35-40); heuristic sims to
   n=5*10^4 show shrinking active-phase fraction against 3 Prolonger policies (weak
   evidence for o(n), not a proof — heuristic adversaries only).

## My first-principles synthesis (validated against corpus)

The game is a birth/service flow. "Protected target" = live element every future legal
move kills at most one of (pairwise: gcd burned-or-1, lcm > n, incomparable). Game length
= moves spent servicing protected stock + everything else. Key structure:

- **Privacy needs prime leaves** (composite leaves are batch-killable through shared
  divisor structure), so protected STOCK at any moment is O(n/log n)-flavored — this is
  exactly R80(2) and the fan-population wall. Reproduced independently; consistent.
- **Linear L(n) therefore requires REGENERATION**: sustained birth rate Omega(1) protected
  targets per move over Theta(n) moves, with primes RECYCLED (a killed/served target's
  prime leaf returns to the pool unless burned). Neither side controls recycling today.
- The upper side must throttle or absorb the birth flow (chronological trichotomy);
  the lower side must sustain it against arbitrary replies (supercritical process,
  R169 §7's six requirements).

## Attack lines

**LINE A (upper): defect-flow accounting.** R170's compatibility defect needs private
packet structure to fire. Formalize: each unit of realized defect consumes an identifiable
resource (burned prime pairs? core divisor real estate? fresh-prime leaf supply), and
bound TOTAL defect over any play by o(n) via resource conservation robust to recycling.
DANGER: this is a flow claim — must price regeneration, not just stock. First step:
write the defect ledger for the R170 episode exactly; identify what is irreversibly
consumed per M of defect; adversarially search for a recycling schedule that regenerates
defect at O(1) amortized consumption (if found, Line A dies and feeds Line B).

**LINE B (lower): recycling supercritical flow.** R170 episode = 3/2 amplification, 2
Prolonger moves, consumes 2 band primes + cores + 4M packet primes per episode; naive
replication walled at ~n^{1/3}/log n by prime supply. Attack: sequential episode chains
REUSING packet primes of served episodes. Quantify per-episode net move gain vs prime
burn. If sustainable birth rate > kill rate against arbitrary Shortener: linear lower
bound. Empirical probe first (cheap): Prolonger episode-bot vs strong Shortener bots at
n ~ 10^4-10^5; measure sustained protected-stock trajectory.

**LINE C (engine): falsification oracle.** Extend phase1 exact minimax past n=40
(bitboards, canonical symmetry, better ordering — target n≈50-55); exact minimax on
restricted/quotient boards to test Line A candidate inequalities; extract optimal-play
structure (is max-degree exactly optimal small-n? where does it first deviate?). Every
candidate lemma from A/B gets a small-board exact check + adversarial search before I
build on it.

## Protocol

- Nothing gets built on without (i) small-n exact check, (ii) pass through the 17
  collapse witnesses, (iii) explicit static-vs-dynamic classification.
- Mature results -> round docs (R172+...) with model provenance fable-5; cross-family
  audit + Aristotle before promotion. Commit per round; never batch.

## Findings

**F1 (2026-07-22): phase1 CSV is poisoned; corrected exact values to n=58.**
`phase1/exact_minimax_v2.py` inflates some values by +1 (verified wrong at n=27,
39-42 by naive-reference ground truth; see phase1/CSV-WARNING.md). New engine
`fable/solver.c` (C, bitboard alpha-beta+TT, ~600x faster than v2) validated against
naive reference on ALL of n=2..40, TT-size-independent. Corrected table:
`fable/exact_corrected.csv` (n=2..58). k = L - pi increments at
n = 9, 21, 28, 35, 49, 51, 57 (gaps 12,7,7,14,2,6 — noisy, no clean trend; n<=58 is
deep pre-asymptopia, do NOT extrapolate). The R171 prompt's small-n table was RIGHT;
the CSV was wrong. My earlier in-session "gaps ~6.5 => linear signal" read was based
on the poisoned CSV and is RETRACTED.

**F2: optimal-play structure = weapon-burn tempo battle, then flat mop-up.**
PVs at n=40, 58 (fable/pv40.txt, pv58.txt): optimal play is a short "battle" phase --
P opens with a primorial-type burn (30 at n=58: burns primes {2,3,5} as future moves),
S replies with the max-degree surviving weapon, and CRUCIALLY when a prime p is burned
S shifts to its prime-power sub-weapon (played 4=2^2, later 9=3^2): burning shifts the
weapon DOWN A LEVEL, it does not defuse the cone. P then burns the next primes via
minimal-collateral multiples (14/21/35/49 for 7; 22/33/55 for 11). Battle length grows
with n (3 moves at n=40, 6 at n=58); afterwards the position goes flat (huge ties, all
degrees <=1, antichain mop-up). L(n) = battle length + residual antichain size. The
asymptotic question = how the battle scales.

**F3: the game renormalizes over the largest-prime-factor fibre tree.**
Clean fibres F_q (q > sqrt n) are independent quotient games ~ the full game at scale
n/q with an extra mega-weapon "q itself" (the fibre root = q*1). S sweeps a fibre in 1
move (play q); P protects it in 1 move (play q*p', p' prime near n/q — near-zero
collateral, burns root q); protected fibres recurse. In band I_j = (n^{1/(j+1)}, n^{1/j}]
P burns j roots per move (multi-tag moves q_1...q_j*b <= n) — this is EXACTLY the
corpus's j*log(1+1/j) < 1 band identity seen from the tempo side. Naive fixed point
c = pf*c + boundary forces c = 0 unless protected mass fraction pf -> 1; pf is set by
the burn-vs-sweep race economics across all bands simultaneously.

## LINE D (new primary): the continuum band-race allocation game

Solve the CONTINUUM LIMIT of the whole allocation game first, then prove in the
direction it indicates. State: mass flowing down the largest-prime-factor band tree.
S spends moves converting weapon-granularity into kills; P spends moves degrading
granularity (burn bandwidth j in band j; multi-tag moves create asynchronous unserved
obligations — R170's compatibility defect is P's asynchrony edge). The game value in
the continuum = lim f(n)/n. Plan: (1) formalize the continuum game + Bellman equation;
(2) solve numerically (value iteration on discretized band tree); (3) consistency-check
against exact data, the 0.1897 upper bound, and known lower bounds; (4) extract the
winning side's strategy shape and prove it discretely. This differs from the corpus:
they built per-band potentials (killed by non-tensorization) and per-shell capacities
(circular); nobody solved the global allocation game as an optimization object.

DANGER LOG for Line D: the continuum game is a MODEL until the discrete extraction is
proven — its value is a conjecture generator, not evidence usable for promotion. Every
modeling choice (state summary, kill rates, burn rates) must be validated against exact
small-n play traces before trusting the fixed point.

## Line D formal development (v2 — the rough tree)

**Model v1 flaw + fix.** v1 (largest-prime fibres) undersells S: S's real weapons are
divisor cones cone(d) = {multiples of d}, which cut across largest-prime fibres. Correct
partition tree = smallest-prime-first (rough) tree: node d has children d*q (q prime,
q >= P^-(quotient)), child d*q owns {d*q*m : P^-(m) >= q} — the q-rough quotients, mass
(n/dq)*rough-density(q) ~ (n/dq)*c/log q. Matches observed PV weapons (S plays 4 = child
of burned 2; 9 = child of burned 3) and the corpus's dyadic-shell frame.

**Move economics on the rough tree.**
- S CASH: play frontier node d (1 move) -> kills its live sub-cone mass.
- P PUSH: burn a set of frontier nodes {d_i} in one move x = prod(d_i)*pad <= n
  (bandwidth constraint sum of scales <= 1; pad = huge prime for near-zero collateral).
  Burning d does NOT save its mass directly — it FRAGMENTS the cone into children
  {d*q}, each requiring a separate future S-move (or further pushes). Mass conserved.
- Every move (cash, push, dust-service) adds +1 to L. Kill accounting: L = n - kills.

**Scale bookkeeping (why the question reduces to mass-at-bounded-quotient).** At chain
scale sigma < 1 the node counts are n^sigma = o(n): the entire polynomial-scale battle
costs o(n) moves — it determines mass ROUTING only. Theta(n) move-cost accrues only
where quotients are O(1) (near-dust). Hence, modulo the continuum idealization:
L = Theta(n) iff P forces Theta(n) mass into bounded-quotient cones against optimal S
interception; L = o(n) iff S can intercept all but o(n) mass at unbounded quotient
scales. The interception economics: the count-tempo race (S 1 cash/move vs P floor(1/s)
pushes/move) at every scale simultaneously — an allocation game whose saddle point is
lim L/n.

**Single-ladder exchange rates (local calculation, needs care).** Fighting one cone of
scale w: P's r-th push forces S's best sub-weapon to w*p_r (p_r ~ r log r), degrading a
single cash from n/w to n/(w*r*log r), at cost r P-moves; but the residual mass is not
saved, it is split across r sibling subtrees each needing its own S-move. Local marginal
comparison at fixed r favors S (1/(r log r) cash per move vs ~1/r^2 marginal save), but
P's shallow-scale bandwidth (primorial burns: unbounded pushes/move as s->0) and the
fragmentation multiplier (each push multiplies S's required move count) act globally —
the saddle cannot be read off locally. Needs the full allocation game.

**Fixed-point structure.** Both players' budgets are L/2 = cn/2 moves — the game value
feeds back into the budgets. Numerical plan: measure-dynamics simulation over
discretized scale space (no integer boards needed): cohorts (scale, mass, count),
alternating parameterized allocation policies, best-response iteration to approximate
the saddle; consistency targets: reproduce ~0.19-type value under Bonferroni-like S
unimpeded, reproduce (loglog)^2 n/log n-type P floor, post-dict n=58 PV micro-structure.

## F4: arena results (exact boards, engineered policies) — 2026-07-22

`fable/arena.c`: exact-legality policy arena, O(n log n) engine (bucket max-degree,
incremental live-divisor counts), n up to 10^7. Matchups vs canonical maxdeg-S:

| n | dustman-P | burner-P | boxer-P |   | burner L*ln n/n |
|------|--------|--------|--------|---|------|
| 10^3 | 0.1680 | 0.1790 | 0.1730 |   | 1.237 |
| 10^4 | 0.1229 | 0.1358 | 0.1271 |   | 1.251 |
| 10^5 | 0.0959 | 0.1102 | 0.0972 |   | 1.269 |
| 10^6 | 0.0785 | 0.0945 |   —    |   | 1.305 |

- burner-P (coprime top-degree bundle * pad prime) is the strongest P fielded; its
  normalized coefficient L*ln n/n GROWS steadily — it escapes fixed-C n/log n but far
  below (loglog)^2-rate at these scales. maxdeg-S beats smallest-S (~4%).
- boxer-P (exponent-greedy divisor-box burns) UNDERPERFORMS burner: breadth (fresh
  prime directions) beats depth (power rungs) at accessible scales; burner's primorial
  bundle already burns the squarefree smooth box.
- Simulation cannot settle the asymptotics (P's box bandwidth grows like
  n^{Theta(1/loglog n)} — invisible at n <= 10^7). Role of arena: mechanism discovery
  + falsification. Done for now.

## F5: the burn-race micro-economics (the decisive constraint pair)

Derived from arena + PV structure; this is the correct asymptotic move-geometry:

1. **S's move**: play weapon w (scale u = log w): captures its ENTIRE live cone
   e^{Lambda-u}-ish mass in ONE move (no recursive defense of a cone's interior is
   possible once the weapon itself is live-and-played). P's only defense is raising
   entry prices (burning cheap weapons) BEFORE S arrives.
2. **P's move (box)**: x = prod p_i^{a_i} * pad, upper-half (zero cone collateral):
   burns div(x). BREADTH: <= Lambda/v distinct scale-v directions per move. DEPTH:
   within an included direction, entire smooth-support sub-ladders free of charge.
3. **Dodge asymmetry**: a single box seals only smooth-support entries of a direction;
   S sidesteps to the next FRESH prime at the same sub-scale for ~zero price raise
   (prime spacing is negligible at every polynomial scale). Hence sealing a direction's
   scale-v' entry BAND requires burning ~ALL band primes in that quotient: cost =
   (band count) * (v+v')/Lambda move-equivalents. Denial is count-based at every level.
4. **Consequence**: the game is a single global count-race over (direction-scale v,
   entry-band v') cells, self-similar in the quotient towers, with budgets L/2 each,
   S rate 1 entry/move capturing the cell's cone mass at its current price, P rate
   Lambda/(v+v') band-seals... per move fraction (v+v')/Lambda per prime sealed.
   Chronology (seals must precede arrivals) is essential — static LP relaxations of
   this were exactly the corpus's circular capacity statements. The correct object is
   the DIFFERENTIAL GAME over game-time t with state = price/coverage profile.
5. Sanity anchors reproduced inside this frame: unimpeded S = prime sieve => Bonferroni
   0.19-type constants; the pairwise-coprime privacy wall = S's fresh-direction supply;
   R170's compatibility defect = S's one-entry-per-move vs parallel opened fronts.

Next: bandrace v3 = numerical differential game on the (v, v') grid with correct
count/bandwidth/dodge microstructure; then closed-form on the observed saddle shape.

## F6: bandrace3 results + the knife-edge theorem candidate (2026-07-22)

`fable/bandrace3.py` (price-profile formulation — overlap-free by construction:
state = live mass indexed by scale of cheapest surviving weapon; reprice = Buchstab
child-split; capture = assigned mass). Results:
- S-unimpeded mode: c(Lambda) ~ 0.28/Lambda — reproduces Theta(n/log n) exactly. ✓
- P-engaged mode: c(Lambda) -> ~0.37 — VIOLATES the proven 0.19 bound. Diagnosis:
  the ascending-sweep implementation locks S to the price frontier, deleting S's
  strike-above-frontier freedom (mid-window prime sweeps = the Bonferroni-S shape).
  Fix: restore best-cell-anywhere S via heap (original semantics) + calibrate by
  imposing the known 0.19-S as exogenous policy (model must reproduce <= 0.19).

**The knife-edge (candidate structural theorem).** In the price-sweep race, P's
level-pi window costs N(pi)*pi/Lambda moves; S's equal-time strikes there capture
e^{Lambda-pi} each; the product is n*d(pi)/Lambda mass per price interval — total
exactly n over the sweep. Both players' leading-order throughputs TIE at n(1+o(1)).
Consequence if made rigorous: no first-order (capacity/rate) accounting can decide
L(n)=o(n) — the value lives entirely in second-order terms (hop teleports for rough
mass, density-decay feedback, strike-order freedom, omega-breadth collapse to 1:1
at deep scales). This EXPLAINS the corpus's central pattern: every capacity-type
intermediate proved equivalent-or-circular because first order cannot separate.

**Great-burn feasibility calculus** (P-side, needs adversarial audit): burning every
integer <= D as weapons costs >= (rough-prime part) ~ D/Lambda + packing losses,
o(n) for D up to n/polylog; but omega-breadth <= Lambda/v means near-top scales P
burns ~1 weapon/move — the deep race is 1:1, and deep burns convert covered mass
into forced dust (1 move/element). P's linear mechanism in-model = winning half the
deep 50/50 races. Whether real-S's mid-window unions beat this is exactly the
second-order fight.

## F7: the landscape dichotomy — four structural results (2026-07-22, needs audit)

Derived in-session; each needs adversarial verification before promotion. Together
they reframe the problem as extremal sieve design and re-derive the corpus's exact
open lemma from an independent route (truth-convergence signal).

**F7.1 (K-thin impossibility, live-weapon caveat).** If EVERY d in [2,n] (dead or
alive) had live-degree <= K, then sum_{x live}(tau(x)-1) <= Kn; by Erdos-Kac, any
positive-density live set has tau(x) >= (log n)^{0.69-o(1)} for all but o(n) of its
elements, forcing live mass O(Kn/(log n)^{0.69}). BUT the game only caps LIVE
weapons' degrees (dead weapons' fat cones don't serve S), so this does NOT directly
bound live mass — the gap between all-d and live-d degree caps is exactly where P
lives. Correct decomposition: live = dust (no live comparable; costs exactly 1
move each) + interactive (covered by the minimal live antichain M).
**L = cumulative dust + cumulative swept minimals (+tempo)** — an independent
re-derivation of the corpus's R148 open object (cumulative minimal-root churn).
Dust production mechanism = P winning deep 50/50 burn races (element's every
minimal cover burned before played).

**F7.2 (great-burn self-defeat / density-1 gift).** P CAN afford to burn every
integer <= Z for ~Z log Z/Lambda moves (lcm-batching; composite coverage costs the
log factor). But total burning below frontier z makes every element's price > z,
so S's frontier-adjacent weapons acquire density-ONE live cones (no rough-thinning):
S's harvest integral becomes int n log z dz/(z Lambda) = n log^2 z/(2 Lambda),
saturating the whole board by z* = e^{sqrt(2 Lambda)} — S clears everything in
o(n) moves. Total burning is self-defeating: it gifts S maximal-efficiency
weapons. P's burning must be SELECTIVE, preserving overlap-thinning structure.

**F7.3 (omega-breadth wall for batch denial).** Effective burn batch on
support-disjoint (rough) frontier weapons at scale z is <= Lambda/log z (lcm room),
NOT tau_max: after the smooth core burns, frontier weapons are support-disjoint, so
P's denial rate collapses toward 1:1 precisely at deep scales. tau_max-sized boxes
exist only against support-SHARING (smooth) targets. Consequence: S-harvest vs
selective-burn is the entire game; both my harvest integrals (S wins vs total burn;
knife-edge tie vs partial burn) are second-order-sensitive to the landscape.

**F7.4 (top-half endgame framing).** L/n = 1/2 - (S's realized top-half harvest
fraction) in the protect-the-top P architecture; S's harvest = sum n/(2 w_j) over
its realized weapon sequence; P throttles w_j growth by burning at effective batch
B(z); B(z) <= Lambda/log z (F7.3) makes the throttle insufficient — this
architecture also dies to the sqrt(Lambda) saturation. Every explicit P
architecture constructed so far fails to o(n); every S architecture fails to
beat the knife-edge against partial-burn landscapes. The decisive object:
bandrace4 = model with BOTH S strike-freedom AND lateral (smooth) repricing
(price of x = min over ALL live divisors, not chain-next: my v3 kernel overpriced
smooth mass — smooth elements have many parallel cheap covers, P must burn all).

Status: leaning o(n) on current evidence (harvest integrals + every P architecture
failing), but the partial-burn landscape saddle is genuinely unresolved — exactly
the corpus's invariant gap, now in sieve-landscape coordinates with sharper tools.

## Log

- 2026-07-22: Ingest complete. Worklog established.
- 2026-07-22: F1 (CSV poison + corrected table to 58), F2 (tempo-battle structure),
  F3 (fibre renormalization). Line D formulated — now primary.
- 2026-07-22: Line D v2 derivation (rough tree, cash/push/fragment economics,
  bounded-quotient reduction, budget fixed point). Building numerical saddle solver.

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

## F8: the tower fortress — static linear bounded-K positions EXIST (NEEDS AUDIT)

Attempting the S-side impossibility ("no reachable position has linear live mass
with bounded max-comparability") I instead CONSTRUCTED a static witness:

  V = { 2^a * m : m odd, m in (n/6, n/4], 2^a * m <= n }   (the "towers")
  A = a top-half antichain covering [2,n] \ V, V-safely.

Properties (checked in-session, unaudited):
- |V| ~ (5/2)*(n/12) = Theta(n); V's internal comparabilities: only within a tower
  (chains of length <= ~2.6 avg): max live-comparability <= 2.
- A subset (n/2, n]: automatically an antichain.
- V-safety of covers, per class: (i) odd x <= n/3: cover by odd top-half multiple
  (odd a: even V-elements can't divide a; a > n/2 > V-elements so a divides
  nothing in V). (ii) odd x in (n/3, n/2]: cover 2x; 2^b m | 2x iff m | x at odd
  ratio in (4/3,3) — only ratio 2, even, impossible: safe. (iii) even non-tower
  2^a m'', m'' odd outside window: cover 2^a m'' * j, j a large prime: m | m'' j
  forces m | m'' (j prime > m), and window-m cannot divide m'' outside the window
  at odd ratio < 3: safe. (iv) tower elements 4m, 8m...: NOT covered — kept in V
  (every multiple of 4m is a multiple of 2m, so they are uncoverable V-safely;
  including whole towers in V is forced and is what caps K at 2).
- CONSEQUENCE if audit passes: the o(n) side CANNOT be proven by static
  impossibility of thin-linear positions. Everything reduces to DYNAMIC ENTRY:
  can P force a fortress-shaped position against S's live resistance? Conversely
  the disproof side needs exactly a robust entry strategy. This sharpens the
  problem to match the corpus's R104 wall (fixed-cap entry refuted — MUST pull
  researcher-104 and check whether tower-fortress shapes are inside its refuted
  family or evade it).

AUDIT NEEDED: (a) completeness of A's coverage (every non-V element gets a V-safe
top-half cover; the shared-cover counting; elements in (n/4, n/2] even, etc.);
(b) edge classes m | k in cover choices; (c) R104/R107 cross-check; (d) exact
small-n instantiation: build (A, V) explicitly at n = 5000 in sandbox and verify
maximality + comparability caps computationally.

**F8-CORRECTED (self-audit, same session).** Hole found: a top-half element
outside A and V can NEVER die (it has no played divisor — A is top-half — and no
multiples <= n), so A must equal (n/2, n] \ V-top EXACTLY, and towers must absorb
the odd multiple layers: corrected fortress
  V = { j*m : j in {1,2,3,4,5}, jm <= n, m odd in (n/6, n/4] },  K <= 4, |V| = Theta(n),
  A = (n/2, n] \ V-top;  comp(V) ∩ top = V-top exactly (window arithmetic).
Verified conflict classes in-head; sandbox instantiation still pending. COST:
|A| ~ 0.4n — LINEAR approach. This is not an accident:

**F8.2 (sublinear-entry fortresses are statically DEAD — new sharpening).** If a
position (played antichain A, |A| = o(n)) had residual containing a linear V with
live-comparability <= K, greedy extraction gives an antichain of size >= |V|/(K+1)
= Theta(n) inside the residual, so the fractional packing value nu(A) = Theta(n) —
contradicting R80(2) (nu(A) = o(n) uniformly over sublinear positions, PROVEN).
Hence: bounded-K linear fortresses require LINEAR played sets; the lower-bound
side has NO static/stock route whatsoever — only live flow-assembly at rate
~1 protected element per own-move against maxdeg-S's concurrent kill rate. The
symmetric statement for the upper side: S's o(n) proof must beat the flow, since
statics cannot decide. The problem IS the flow saddle; F5-F7 give its economics.

## F9: THE SOLUTION CANDIDATE — c*-dichotomy and the 2x-floor fixed point

Empirical anchor (n=10^6, maxdeg vs taxman, L=100231): kills reach 25/50/75% at
moves 2/6/66 (!!), 90% at ~13k, 95% at ~47k — the fat harvest is n^{o(1)}-fast;
GAME LENGTH = SIZE OF THE RESIDUAL TAIL (last ~10% of mass costs ~87% of moves at
kill-rate ~1). So L = |residual|(1+o(1)), residual = natural sieve floor +
P-manufactured protected stock.

**Proposed theorem: L(n) = Theta-tilde(n / log n)** — i.e., o(n) is TRUE and the
lower bound is near-sharp. Proof program, two lemmas:

**(T2) Saturation Lemma.** Against EVERY P strategy, S playing smallest-live-prime
accumulates sum 1/q_j >= K within e^{O(sqrt(K Lambda))} = n^{o(1)} moves. Mechanism:
P's burn breadth at prime scale y is <= Lambda/log y (lcm room), so the frontier
race gives sum 1/q = log^2 W/(2 Lambda); prime arsenals are pairwise coprime so the
union kill is the exact sieve product (1 - prod(1-1/q))n = (1 - e^{-K})n. Kills
(1-eps)n in n^{o(1)} moves for every fixed eps. [Race integral + coprime-union;
main audit risk: legality/availability edge cases of the smallest live prime, and
the density feedback inside cones.]

**(T1) Protection-cost Lemma (the crux).** Amortized over any play, each P move
manufactures at most 2 + o(1) residual-protected elements, APART from a total
O(n/log n) exception budget from prime-leaf packet mechanisms (R170-type episodes,
bounded by the pairwise-coprime supply wall = corpus R169(6)). Evidence: tower
economics (scaffold 3x/2 protects pair {x, x/2}; taller towers cost MORE per
element since deeper levels have more outside-comparables to sever); private-chain
lemma (corpus, proven) is the special case; packet amplifiers are supply-bounded.
S's policing costs O(1) kills/move but a POLICED P is a throttled S is... the
policing tradeoff enters the fixed point benignly (needs the careful two-line
optimization written out).

**Fixed-point closure.** L = stock + floor + n^{o(1)}; stock <= c* x (P's moves)
= c* L/2; c* <= 2+o(1) outside the floor-order exception. Then
L <= (2+o(1)) L/2 --- degenerate at c*=2: the closure needs the SHARP form: stock
<= (2-delta)(L/2) + O(n/log n), giving L <= O(n/log n)/delta. So T1 must be proven
with constant strictly below 2, OR with the S-policing term making the effective
constant < 2 (S spends sigma L moves policing at 1 tower killed/move; optimize
sigma). Arena consistency: flat L ~ 1.4 n/ln n = the fixed point sitting at
~1.4x floor. Corpus consistency: T1 generalizes private-chain + fixed-gadget
walls; T2's integral is the F5 breadth wall; nothing in Ruled Out matches this
formulation (cost-per-protected-element amortization + fixed-point closure is NEW
— it is a STRATEGY-INDEPENDENT stock-flow inequality, not a capacity statement
over intervals and not a trajectory statement with activation clauses; still must
be checked against the 17 collapse witnesses carefully, esp. terminal-delay and
owner-laundering shapes).

NEXT ACTIONS (in order): (1) write T1 formally (define "protected residual
element" with a per-element certificate: an element serviced at kill-rate <= 1 in
the endgame, chargeable to the P-move that severed its last fat comparable);
(2) attack T1's proof: charge each protected element to the P-move that made its
live-comparable set thin; show each P-move absorbs <= 2 such charges outside
packet exceptions (the move x severs comparables through x's own comparability
classes — x has ONE cone and ONE divisor set: the 2 comes from the two sides!);
(3) audit T2's frontier race formally; (4) collapse-witness pass; (5) exact
small-n sanity: predicted L ~ 2x prime-floor at n <= 58? f(58)=23 vs
pi(58)+floor... check; (6) then full write-up -> cross-family audit -> Aristotle.

## F10: T2 corrected — race rates, the 1/e identity, layer-peeling; two guard-rail traps

**Trap A (recorded as guard rail).** "S saturates in e^{O(sqrt(K*Lambda))} moves"
is FALSE — it implied L << n^{0.74}, contradicting the proven (loglog)^2 n/log n
bound. Error: conflated burn-all-INTEGERS cost (w log w/Lambda, giving the sqrt
integral) with burn-all-PRIMES cost (w/Lambda). Against full prime-burning the
frontier is w_j ~ j*Lambda (prime-count exhaustion, airtight), so the pure prime
sieve gets Sigma 1/q = log j/Lambda -> 1 at j = eps*n: kill fraction saturates at
1 - 1/e. **bandrace3's 0.37 = e^{-1}: the model computed exactly this
prime-frontier equilibrium.** P's matching burn cost theta(w)/Lambda = j is
move-for-move balanced — the knife-edge, localized to the prime channel.

**Trap B (guard rail).** "S escapes via cross-composites of burned primes and
re-runs the sqrt integral" is ALSO false as a saturation claim — same
contradiction. Error: Sigma 1/w is not the saturation variable for CORRELATED
arsenals. A weapon must DIVIDE its target: weapons supported on dead primes <= y
reach only {x : >= 2 prime factors <= y} (pairs), >= 3 for triples, etc. The union
saturates at smooth-structure boundaries: residual class {x : <= 1 small prime
factor} ~ n*loglog y/log y survives ALL cheap composite weapons. Killing it needs
rough-scale weapons (price > y) — the residual peels one j-small-primes layer per
generation, each layer a fresh race. This is the corpus's second-shell recursion
derived from the S side; consistent with everything proven.

**What survives:** the F9 FIXED-POINT architecture is untouched by both traps (it
needs no clearing/saturation theorem): L = stock + floor + battle; stock <= c* L/2;
prove c* < 2 - delta outside an O(n/log n) exception => L = O(n/log n)/delta.
T1 (protection-cost lemma) is THE crux. Charging sketch: each endgame-protected
element x is charged to the move that severed x's last fat live comparable; a
single move x_P = one element = one cone + one divisor set — the candidate
"two-sidedness" bound; packet amplifiers (R170) are prime-supply-capped inside the
floor (R169(6)). DANGER: severing can be done by S's moves too (S's own plays
thin the board — do S-severed elements charge S? If S's moves manufacture
protected stock as collateral, c* accounting must charge BOTH sides' moves;
then stock <= c*(L) not c*(L/2) and closure needs c* < 1: HARDER. Resolve whose
moves sever in optimal play — check on exact PVs and arena transcripts: measure
the severing attribution empirically FIRST.)

Session end state: solution NOT closed. Live program: T1 formalization with
empirical severing-attribution -> charging proof -> fixed-point closure -> would
give L(n) = Theta-tilde(n/log n) resolving Erdos 872 (o(n) side, near-sharp).

## F11: severing attribution measured — T1 final form (2026-07-22, session close)

Instrumented arena (n=10^6, sevby tracking: element "severed" when its live
comparable count first drops <= 2 while alive; attribution to the mover):

| P bot   | L      | unsevered (natural floor) | severed by P | severed by S |
|---------|--------|---------------------------|--------------|--------------|
| taxman  | 100231 | 52518                     | 35203        | 12510        |
| dustman | 78498  | 37127                     | 0            | 41371        |

Facts: (i) natural floor ~ 0.5-0.7 x n/ln n; (ii) P-severing rate 0.70 per P-move
(<< 2: comfortable inside the c* budget); (iii) S's own kills manufacture stock as
collateral: 1.05/S-move passive, but only 0.045 severed PER KILL; (iv) active P
suppresses S's collateral 3x (taxman consumes the thinning work).

**T1 final form — two inequalities close the theorem:**
  (T1a) P-severing: each P move severs <= 2 - delta elements amortized, outside a
        total O(n/log n) prime-supply exception.  [measured 0.70]
  (T1b) S-collateral: severed-per-killed -> 0 as n -> infinity (sum over S moves of
        sigma_t = o(sum Delta_t) = o(n)).  [measured 0.045 at 10^6 — FIRST
        NEXT-SESSION MEASUREMENT: trend of this ratio in n at 10^4..10^7; if it
        shrinks like 1/polylog the theorem breathes, if constant the fixed point
        gives L = Theta(n * ratio) and the answer could be LINEAR after all]
  Fixed point: L = floor + (P-sever) + (S-collateral) + n^{o(1)}
             <= floor + (2-delta)L/2 + o(n)  =>  L = O(floor)/delta = o(n).

Session totals: 12 commits, F1-F11. Solution NOT closed; the program stands at:
prove T1a (charging: one move = one cone + one divisor set = the two-sidedness
bound) + T1b (anti-concentration of comparability under fat kills — a sieve
statement, feels tractable!) => L(n) = Theta-tilde(n/log n), resolving #872 on
the o(n) side near-sharply. All guard rails (Traps A, B), race identities
(1/e = bandrace3's 0.37), and instruments are committed. Resume: this file, top
to bottom, then T1b's n-trend measurement, then the T1a charging argument.

## F12: T1a refuted-and-rebuilt — the hereditary rate induction (2026-07-23)

**T1a as stated in F11 is FALSE (self-refutation).** The 3p-supercharge: x = 3p
(p prime in (n/6, n/3]) kills exactly 2 elements (weapons 3, p) yet severs every
near-thin multiple of 3 — one-shot severing is unbounded per move. The 0.70/move
measurement was dynamics-specific, not a law. One-shot threshold-crossing is the
wrong protection notion.

**Correct notion: hereditary (recursive) protection** — an element is protected
iff its entire remaining live comparability structure lies in the thin system
(fortress membership). Correct T1 = rate war + induction:

- **Destruction rate**: S playing inside a 2-thin cluster removes >= 3 protected
  elements per move (the element + its <= 2 comparables). Tower assembly yields
  <= 2/move. Head-to-head, policing beats assembly 3:2.
- **Supercharge recursion**: a ripe cone (high live-degree d with thinned
  interior) IS a high-degree live weapon — maxdeg-S's detector is exactly deg(d).
  To ripen cone(d) without S harvesting it, P must first burn d and then
  fortress-assemble the quotient interior (scale n/d) — the SAME problem one
  scale down. Induction hypothesis: hereditary protected yield <= 2 x (moves
  invested) at every scale. The supercharge conserves, not beats, the rate.
- **Arithmetic-privacy exceptions**: R170-type packets protect at rate ~M per
  move-pair WITHOUT recursive assembly cost (privacy from pairwise-coprime prime
  leaves, pre-existing arithmetic). Globally capped: any privacy source of this
  kind consumes pairwise-coprime support => total exception budget
  O(pi(n) + sqrt(n)) = O(n/log n) (R169(6) generalized).

**MASTER T1 (to prove): hereditary protected yield <= 2*(moves) + O(n/log n),
by induction on scale.** With the fixed point: L <= floor + 2*(L/2)*(net of
policing at 3:2) + O(n/log n) + n^{o(1)} — the policing margin (3 > 2) makes the
closure strict. Then L(n) = Theta-tilde(n/log n).

**T1b trend (measured, passive P, maxdeg S)**: severed-per-kill = .0734/.0641/
.0561/.0502/.0449/.0409 at n = 1e4..3e6 — decays like ~1/(log n)^{1.1};
severed-played/L constant at .527. Coherent Theta-tilde(n/log n) scaling.

NEXT: (1) formal statement of the hereditary induction (define fortress systems,
assembly cost, the exception budget; the induction step = the ripeness-detection
identity deg(d) = interior mass); (2) the policing-margin optimization written
out; (3) collapse-witness pass (esp. owner-time-laundering — the induction's
charge assignment must be prefix-measurable!); (4) then draft round docs
(R172: knife-edge + guard rails; R173: master T1 program) for cross-family audit.

## F13: hereditary fortress probe — peak scales with the floor (2026-07-23)

Peak HEREDITARY thin-live mass (live z, deg+ldc<=2, all live comparables thin),
maxdeg-S vs taxman-P: 0.1505/0.1325/0.1220/0.1174 of n at n=1e5/3e5/1e6/3e6.
Ratio to n/ln n: 1.73/1.67/1.68/1.75 — FLAT. The hereditary fortress peaks at
~1.7x the natural floor and scales with n/log n, NOT with n, under the best P
fielded; the mop-up then consumes it at 2-3/move (policing arithmetic checks:
L ~ peak/2.2 + tail). One-shot thin mass peaks at ~0.12n (constant fraction) —
confirming one-shot severing is transient collateral, hereditary is the real
notion. Both decisive probes (T1b decay, F13 flat ratio) now support the
H2/o(n) world at accessible scales. Remaining gap: architectures beyond my bots
(H2-breaking child-brancher) and true asymptotics — the proof program of
DRAFT-master-theorem.md.

## F14: H2 resolves into a scale induction (2026-07-23)

Formalizing preparation lineages at bounded quotient H:
- cone(d) = {kd : k <= H}: ALL multiples of cone elements stay inside the cone
  (kd*j = (kj)d), so the in-cone comparability is the divisibility poset on
  {1..M}, M = floor(n/d) <= H, plus outside divisor structure.
- Weapon-sharing is scale-split: SMALL weapons (e = a*b, b | d, b small) are
  shared across ~cone(e)/H deep cones — broad amortized layer, part of the
  battle/shared cost. DEEP weapons (e = a*d/c, bounded a, c) are shared by at
  most O_H(1) deep cones (gcd absorption, G3 quantified: bounded sharing, not
  1 — private-chain constants need the margin check).
- In-cone preparation without collateral forces the IN-CONE TAXMAN: play
  top-layer elements k'd (k' in (M/2, M], no multiples in range) whose divisor
  batches kill the small-k weapon layer; naive yield rate ~ 2*tau_typ(H) per
  move — UNBOUNDED in H (the rate-breaking scare).
- BUT the preparation is contested: the in-cone weapons 2d, 3d, ... are
  Shortener weapons one scale down; killing d happens automatically at the
  first in-cone play (d divides everything there); the ripening race inside
  cone(d) is a miniature of the whole game at scale H with boundary
  conditions. The protected yield of a POLICED preparation is governed by the
  game value at scale H, not by tau(H).

**H2 as scale induction (the program's new spine):** Let F(m) bound L(m)
(inductive hypothesis at all scales <= H). Then deep-cone yield at scale n is
<= F(H)-governed per cone; summing over the deep-cone population and adding
the shared layer (breadth-race, o(n)-battle) and the floor gives the
self-consistent recursion F(n) <= C*floor(n) + (deep terms controlled by
F(H)/H) + o(n/log n)-corrections. The child-production scare (rate 2*tau(H))
is exactly what the induction hypothesis throttles: sustaining it would
require the in-cone game itself to be long, i.e., L(H) large — contradiction
with the hypothesis at scale H. This is a renormalization argument the
per-shell frame never had: the dichotomy's two sides become the two fixed
points of the scale recursion, and the empirical flat ratios (F13: 1.7x floor
across scales) are direct measurements of the recursion sitting at its
sublinear fixed point.

REMAINING FOR A PROOF: (a) the boundary bookkeeping between "in-cone contested
preparation yield" and "game value at scale H" (they differ: global move
budgets, outside-weapon boundary conditions, S's attention split across many
cones — the attention-split is where S's policing margin must be shown to
survive: S must police MANY ripening cones; its maxdeg detector auto-selects
the ripest; need: the ripest cone's yield-damage exceeds P's parallel-ripening
gain — a bandwidth comparison, P ripens <= 1 deep cone per move (G3) vs S
harvests the max — looks favorable but write it); (b) the induction's base
case and the scale-doubling error accumulation (log log n doublings from H to
n: per-doubling multiplicative slack must be 1 + O(1/loglog) to keep the
polyloglog result — TIGHT, needs the honest constants); (c) H1/H3/H5 as
before. The program's hard core is now (a)+(b): a self-consistent
renormalization inequality with explicit boundary terms.

## F15: attention-split economics; all routes funnel to one invariant (2026-07-23)

**Near-trap C (dissolved, recorded).** Naive rush-vs-police exchange: P rushes a
deep cone (C(H) ~ H/log H moves), S polices 1:1 (strike the stage-max in-cone
weapon, damage sum ~ M over a full rush): episode = 2C(H) moves added, ~H mass
consumed => L ~ 2n/log H with H a free constant — would violate the proven
0.19n bound at H >= 100. FLAW: S is not obligated to police; S's real policy is
max(harvest degree, policing yield). Policing pays only when global max degree
<= ~log H. Consistency restored; what survives is the QUANTIFICATION:
- policing yield ~ log H kills per S-move inside ripening cones;
- completed-rush exchange rate: 2/log H length-per-mass for P;
- so L ~ 2 x (mass reaching degree-<=D endgames)/log D + higher-degree phases.

**The funnel.** Five independent routes this session-pair (F6 bounded-quotient
reduction; F9 fixed point; F12 hereditary rebuild; F14 scale induction; F15
exchange rates) all reduce the dichotomy to ONE invariant question:

  (INV) Can Prolonger route Theta(n) mass into positions where its live
  comparability degree is bounded (<= D, any constant), against a Shortener
  playing max(harvest, police)?

This is the corpus's invariant gap (R168's chronological trichotomy, R104's
entry question) reached from new directions, now with: exchange rates, the
scale-induction spine (F14), the policing detector identity (ripeness = degree),
the static impossibility at sublinear entry (F8.2), and the measured answer at
accessible scales (F13: no — 1.7x floor, flat ratio). The proof program's
remaining content = prove (INV) negative via the scale induction with the
policing margin; the disproof program = construct (INV) positive. Everything
else in the five-gear draft is scaffolding around this single point.

## F16: supply/completion split; the live-prime charge lemma; 1/e third apparition

**Lemma (live-prime charge, unconditional, trivial-but-load-bearing).** At any
position with global live max-degree <= D, the live mass possessing at least one
LIVE prime factor is <= D * pi(n): charge x to any live prime p | x; cone(p)
holds <= D live elements. Hence (INV) concerns exclusively elements with FULLY
BURNED prime support: the fortress is made of smooth numbers over P's burned
basis, and monotonicity of max-degree gives a clean phase timeline.

**Smooth-basis race (supply side).** P burns primes at log-bandwidth Lambda per
move (front y_t ~ t*Lambda); S pokes holes by playing the smallest unburned
prime (h_t ~ t*Lambda); the smooth-count damage is prod_t (1 - 1/(t*Lambda))
~ exp(-log T/Lambda) ~ 1/e at T = eps*n: S's poking costs P only a constant
factor. CANDIDATE SUPPLY IS Theta(n) — the third independent apparition of the
1/e identity (prime-frontier equilibrium, bandrace3 residual, basis race).

**The final battle line.** (INV) = supply x completion: supply Theta(n) (above);
completion = deep in-cone preparation, governed by the F14 scale induction,
measured floor-order at accessible scales (F13). The induction's base is LARGE
(L(58)/58 = 0.397) and the required statement is a per-scale-doubling
CONTRACTION of the completion rate (0.4 at H=58 -> 0 asymptotically; F13's
1.7x-floor at 3e6 shows massive realized contraction already). The whole
dichotomy now = does the contraction hold at every scale (o(n), Theta-tilde
(n/log n)) or stall at a positive rate (Theta(n))? This is a well-posed
renormalization inequality with explicit boundary terms — the deepest formal
object of the program, needing a dedicated fresh-context session (and the
completion-rate measurement AT MULTIPLE H via restricted-board arena runs:
measure rate(H) = protected yield / moves in contested cone-preparations at
H = 2^k, directly estimating the contraction sequence).

## F17: machine audit; race correction (2-adic wall at n/2); 1/e RETRACTED -> 1/2

Replaced the planned external-referee pass with machine checks
(`fable/verify_claims.py`). Verdicts: live-prime charge VALID; gcd absorption
VALID; static fortress VALID (exhaustive, n = 1e3/1e4/1e5, zero violations);
**race identity REFUTED** — my own Claim 4 died on its flagged sub-question (i).

**The error.** All three 1/e apparitions assumed a frontier lock (w_j ~ j*Lambda)
that presumes burning needs a live PRIME pad above the front. False: a
burned-but-unplayed prime stays legal as a FACTOR. After P's first move kills 2,
x = 2^a * p lands in (n/2, n] for any live prime p <= n/2 (a power-of-2 multiple
exists in any ratio-2 window). So the burn wall is n/2 exactly (sim: deepest burn
49993/499973/4999999 at n = 1e5/1e6/1e7), the frontier accelerates (hump 1.2->
1.7->1.3 in q_j/(j*Lambda), no lock), stolen mass sum 1/q -> ln 2 (log-integral;
measured 0.556/0.589/0.618), and prime-channel coverage -> **1/2** (measured
0.539/0.553/0.565), not 1 - 1/e. bandrace3's 0.375 residual was a lock artifact.
Cascade: F16's smooth-basis race inherits the corrected steal positions ->
damage prod(1 - 1/q_stolen) -> e^{-ln 2} = 1/2. SUPPLY = Theta(n) SURVIVES
(constant 1/2 instead of 1/e; S's poking still costs P only a constant factor).
G1's sieve-phase bound survives (uses only prime-moves <= pi(n)).

**New structure (the gift in the refutation).** After a full race round the
carcass = {no S-played prime factor} has density 1/2 + o(n), holds NO live
prime, minimal live elements are cross-core two-generated composites
(same-core products die as batch collateral, which totals o(n/log n) since
sum 2^{k_t} is dominated by the earliest batches). One round = O(n/log n)
moves/side, board HALVES, weapons degrade. Iterating: sum (n/2^i)/(Lambda - i)
= O(n/Lambda) — the scale induction's contraction hypothesis is now EXACTLY
"carcass boards are race-self-similar," with explicit strategies on both sides
and measured constants. P's refusal to burn = the other count-race horn.
Recorded: researcher-174-race-correction-two-adic-burn-wall.md (refutes
R172 item (3) only; confirms item (5)). Also: 2-adic burns pre-kill the
2-power sub-weapon ray of p — the asymptotic shadow of the 4/9 prime-power
escalation in the exact PVs.

## F18: the mirror-veto reduction (candidate dissolution of H2)

Status: PROOF SKELETON, heuristic until the pursuit inequality is written and
machine-probed. Depends on: gcd absorption (confirmed), G2 admission mechanism,
elementary exchange arithmetic, measured harvest concentration.

**Root-veto.** While a preparation cone(d) is incomplete, its root d is LIVE.
S playing d kills d AND the entire prepared population (they are multiples of
d): one S move annihilates the whole lineage investment, and the kill count
(1 + prepared) is itself a decent harvest. Admission requires the root to die
divisor-side (P plays a top-half multiple of d) BEFORE S vetoes.

**One advance per move.** By gcd absorption, one move cannot advance two
preparations at bounded quotients H without both cohabiting an H^2-bounded
quotient — so deep advances are one-per-move. S also moves once per P move.
Hence S can MIRROR: veto the most-recently-advanced (or ripest) lineage 1:1,
and no lineage ever survives from advance to completion — UNLESS S's move is
worth more spent elsewhere. That is the only escape: P preps while S's harvest
value exceeds veto value.

**Threat-decay accounting (the skeleton).** Veto value ~ 1 + |prepared| ~ H at
quotient scale H. S's best harvest value decays with move count (kill
concentration: 75% of kills in 66 moves at n=1e6); S harvests while
harvest > H, vetoes after. P's uncompleted-lineage stock at crossover is at
most the battle length; each completion is <= 1 per P-move and admits <= H
(cohabitation: a cone at quotient H holds <= H elements). Skeleton bound:
admissions <= H x (moves at harvest-value >= H) ~ H x n/(H Lambda) = n/Lambda,
INDEPENDENT of H. Pipeline subtlety: one P move may complete lineage d1 while
advancing d2 (gcd lemma forbids only double-ADVANCE) — the pursuit inequality
must handle the advance+complete pipeline and S's attention split (harvest vs
veto vs eating completions).

**Consequence if it closes.** H2 (child-production bound) DISSOLVES: no
branching analysis needed — uncompleted advances are vetoable 1:1, so deep
preparation never pays regardless of branching architecture; the game
concentrates at bounded quotients where the G5 exchange optimization (H4) is
the only remaining battle. Holes: (a) dual-purpose P moves (advance +
harvest-denial in one), (b) the attention-split inequality with honest
bookkeeping, (c) interplay with the natural floor (no-prep admissions, already
capped by charge lemma + privacy cap).

## F19: level-2 harmonic supply (loglog-rich) and full-burn's arena verdict

Two-level harmonic calculus (heuristic, to be machine-checked): S's kill
completion needs harmonic mass sum 1/x ~ 1 over played weapons with live
cones. Level 1 (primes vs full burn) delivers ln 2 -> coverage 1/2 in pi(n)
moves (R174, measured). Level 2 weapons are cross-core semiprimes with supply
sum 1/pq ~ (loglog n)^2 / 2 — loglog-RICH vs the needed constant. Against
full burn, S collects the missing 1/2 of harmonic mass from semiprimes below
front y* with log y* ~ Lambda/(2 loglog), costing o(n/Lambda) moves: the
recursion TERMINATES at level 2 and the race pair costs O(n/Lambda) total.
Arena confirmation (exact play, n=1e5): L(smallest vs race-P) = 10473,
L(maxdeg vs race-P) = 10475, vs champion taxman 12345 — full burning is
SELF-DEFEATING (collateral gift), race-front reaches the n/2 wall exactly,
final top-half live = 0. Corollary: P's viable architectures are all
PARTIAL-burn + preparation — exactly the F18 pursuit regime. The enemy is not
denial; it is amplified admission, and F18 bounds it if the pursuit
inequality closes.

## F20: crossing-ledger empirics; the tiling-burner near-trap (guard rail #4);
## the element-complete/harmonic asymmetry — the knife-edge tie-breaker

**Ledger at n=1e5, champion pair (arena2, D=6 crossing attribution).**
born-thin 42389 (0.42n — the top half is born near-thin); crossings during
play: P-div 4521, S-div 22734, mult-side ~4.7k total. PLAYED composition of
L = 12345: born-thin 10476 (85%), S-mult 948, P-div 465 (3.8%), fat 413,
S-div 0 (!). Tower stock (prepared pairs by dyadic quotient band): 17.8k at
move 512, 6.7k at 2048, ZERO by 8192; max single root ever: 8 members.
Readings: (i) at accessible scales L IS the natural floor — surviving
born-thin top mass — plus a short battle; (ii) S's own crossings never get
played (S eats its collateral); (iii) no fielded P sustains deep towers;
(iv) the dichotomy question = can P grow the 3.8% admitted slice to Theta(n),
OR protect a Theta(n) surviving top antichain. Reframe: L ~ battle + admitted
+ SURVIVING TOP ANTICHAIN; the last term is the main term.

**Tiling-burner near-trap (candidate linear-side construction, REFUTED —
guard rail #4).** Idea: max-tau smooth tiles X = 2^a 3^b 5^c... (tau up to
exp((ln2+o(1)) Lambda/loglog)) kill n^{c/loglog} divisors per move, so P
element-complete-clears all scales <= n/e in n^{1-c/loglog} = o(n) moves,
leaving S only O(1)-kill weapons: L = Theta(n). REFUTATION (fiber theft):
tiles are smooth; the mass of [2, n/e] is dominated by prime fibers
m = s*q (large prime q); one tile covers O(1) fibers (q must divide X); P
therefore pays ~(n/q) e^{-c(Lambda-ln q)/loglog} moves per fiber while S
STEALS a whole fiber per single move (play q: kills every live multiple).
S stealing the smallest available fiber primes during P's tiling collects
harmonic mass sum 1/q ~ loglog of the stolen range -> coverage -> 1: S
completes crushingly. The smooth sliver P can actually tile has vanishing
density (Psi over r ~ Lambda/loglog fixed primes). Trap mechanism to record:
tau-rich tiles overcount because tile REACH is smooth-only; fiber mass needs
per-fiber work at 1-move-theft odds.

**The asymmetry (second-order tie-breaker, candidate main-term engine).**
(a) Harmonic denial cap: one P move X destroys weapon-harmonic mass at most
sum_{d | X} 1/d <= sigma(X)/X = O(loglog n) — ABSOLUTE, by Gronwall. (b) But
denying S a SCALE requires element-complete clearing (S steals with any single
live element): band [y, 2y] costs P at least y/max-tau = y^{1-o(1)} moves to
clear, while S extracts the band's harmonic value with ONE move. At every
scale the denial/theft cost ratio is y^{1-o(1)} : 1. This is the precise
sense in which the first-order knife-edge (F6) breaks second-order toward S,
and the quantitative seed for the main-term theorem: against ANY P, S
collects sum 1/x >= 1 - o(1) over played weapons with live top-cones within
o(n) moves. Care needed: cone-liveness discounting (P kills top mass too),
and the orphan structure: X = 2m with m in (n/3, n/2] has its divisor m
killable only through X itself — for PRIME m these pairs force floor-order
moves (known pass-bank flavor); for composite m, shared divisors kill pairs
wholesale. Formalization next: the surviving-top potential and S's
harmonic-completion theorem as the main term of P5.

## F21: the assembly — Landau floor lemma; R80 integration; the one wall

**Landau floor lemma (NEW, solid).** Born-thin mass B_D = #{z : comp_0(z) <=
D} is O_D(n (loglog n)^{c(D)} / log n): comp_0(z) = (n/z - 1) + (tau(z) - 2),
so born-thin forces z > n/(D+2) AND tau(z) <= D+2, hence omega(z) <=
log2(D+2); the Landau count pi_k(n) ~ n (loglog n)^{k-1}/((k-1)! log n) gives
the bound. COROLLARY: the 85%-born-thin dominance measured at n = 1e5 is a
small-n artifact (loglog(1e5) = 2.44); asymptotically the natural floor is
genuinely floor-order, and a linear-length play needs Theta(n) CROSSED plays
(via P1's bounded-degree concentration with D = 2/eps). The (loglog)^C shape
of the known lower bound appears natively here.

**R80 integration (verbatim from the compiled corpus).** R80(1): after k
moves, all but 2kz^2 + C 2^r (n/sqrt(log z) + (3/2)^{pi(z)}) live upper
targets have >= r legal prime-removal killers — for ALL z, r. R80(2): nu
(fractional packing of targets vs lower-move shadows) is o(n) at sublinear
positions. Quantitative rescue of the bootstrap: at |A| = delta*n, choosing
r = R then z = z(R) const, nu <= n(3/(2R) + 2 delta z(R)^2): for every R
there is delta_R with nu <= 3n/(2R) below delta_R n moves — the bound
survives SMALL-LINEAR prefixes. By LP duality (packing = min fractional
cover), the ENTIRE standing thin stock at such positions admits a fractional
kill-cover of weight gamma*n: S is always gamma*n well-chosen moves from
annihilating it — realizing this ONLINE is the corpus's single unresolved
step (R80's bounded-multiplicity online charge), and it is THE SAME OBJECT as
the pursuit inequality P5: R80's "poor" targets (< r live legal killers) ARE
the crossed/thin elements (for upper targets, comp = live-divisor count), so
poor-making rate = crossing rate, and the online charge = the mirror-veto
attention-split ledger.

**Exchange constants now on the table.** (a) P raises nu by killing lower
moves (constraint removal), at bounded rate for z-smooth structure (2z^2 per
move) but adversarially bounded only by the pair ledger sum_d |cone(d)| —
the per-move crossing capacity of P4. (b) S kills packed (unvetoable) stock
at ~1 per move BY DEFINITION of packing; S bulk-kills vetoable stock (cone-
concentrated) at one cone per move (P3). (c) P's amplified crossing needs
prepared cones (P4), which are vetoable while live (P3), advance one per
move (gcd), and stand in o(n)+gamma*n inventory (R80(2) quantitative). The
open inequality: does the flux battle close — can S's split policy (harvest /
veto ripest / eat thin) hold P's realized thin PLAYS to o(n) against the
replenishment? All static and rate ingredients are now proven or measured;
what remains is the amortized potential argument (candidate: Phi = thin-stock
+ lambda * poor-pair-mass + mu * nu-witness-slack, with per-move Lipschitz
bounds from (a)-(c)).

**Honest status.** This is not a proof; it is the corpus gap restated with
(i) a floor that is now provably floor-order (Landau lemma), (ii) a
quantitative packing bootstrap at small-linear times, (iii) veto/advance
exchange rates from confirmed lemmas, (iv) measured empirics all on the
sublinear side. The one wall: the online amortization. Next deep session:
attack Phi directly; the wall is now thin enough to see through.

## F22: the W0-threshold veto policy; cross-feeding webs; concentration at
## bounded scales (flux route re-derives the F14 scale induction)

S's policy family: veto any live root whose standing prepared cone reaches
W0; else eat thin clusters; else harvest. Analysis of P's counterplay:

1. Cross-feeding webs: completing cone(d_B) can cross up to W members of
   cone(d_A) at once when many members lie in cone(lcm(d_A, d_B)) — needs
   n/lcm >= W. So P can amplify W-fold per move through lcm-structured webs.
2. Above threshold (W >= W0): each W-crossing is answered by one veto killing
   >= W — mirror holds move-for-move, S nets W kills per exchange, and the
   phase self-limits (total mass n / W exchanges). Large-scale perpetual
   motion is impossible: P's web consumes ~2W fresh element-mass per move.
3. Therefore P plays UNDER the threshold: many cones of size < W0,
   completion admits < W0 per move, cross-feeds < W0 per move; S eats
   <= D+1 and vetoes < W0 per move. The exchange at W0 ~ D+1 is MARGINAL:
   the entire dichotomy concentrates at bounded quotient scales, where
   cone(d) is isomorphic to the divisor board of a bounded-size quotient —
   the local game is the antichain game on <= H0 elements: EXACT SOLVER
   territory. The renormalization base is the corrected exact table
   (L(58)/58 = 0.397 and the increment structure of k(n) = L(n) - pi(n)).
4. This re-derives the F14 scale induction from the flux side, independently:
   the contraction question = does the bounded-scale exchange margin favor S
   at every scale doubling, with the asymptotic stitching supplied by the
   floors (Landau/charge/privacy), the veto mirror above threshold, and the
   packing bootstrap at small-linear prefixes.

NEXT SESSION OPENING MOVE: the bounded-scale exchange optimization. Set up
the local game: quotient board {2..H}, P admits via completions (rate, per
exact PVs), S eats/vetoes (rate from exact PVs); extract the exchange margin
m(H) from solver data (pv58 shows the battle structure); then write the
stitching inequality. The wall has become a finite computation plus one
asymptotic lemma. Resume doc: this file, F18-F22 + DRAFT-pursuit-inequality.

## Log

- 2026-07-22: Ingest complete. Worklog established.
- 2026-07-22: F1 (CSV poison + corrected table to 58), F2 (tempo-battle structure),
  F3 (fibre renormalization). Line D formulated — now primary.
- 2026-07-22: Line D v2 derivation (rough tree, cash/push/fragment economics,
  bounded-quotient reduction, budget fixed point). Building numerical saddle solver.
- 2026-07-22 (cont): F4 arena + F5 micro-economics + F6 knife-edge + F7 landscape
  dichotomy. Champion arena pair: maxdeg-S vs taxman-P (threat-weighted top-half
  divisor-batch burner, exact ldc bucket queue): L ~ 1.4 n/ln n, coefficient FLAT
  across 10^4..10^6 (1.417/1.421/1.385) — the knife-edge visible empirically: P's
  batch bandwidth and S's weapon replenishment both grow ~ln n, ratio pinned.
  Hybrid(taxman,burner) < taxman (myopic scoring). VERDICT-LEAN: o(n) — every
  explicit P architecture dies to a harvest integral; but the partial-burn
  landscape saddle is unresolved and is exactly the corpus's invariant gap.
  NEXT (priority order):
  (1) bandrace4: Monte-Carlo elements (Poisson du/u prime scales) + lateral
      repricing (price = min over ALL live divisors) + S strike-freedom +
      parameterized P landscape family; best-response saddle search.
  (2) Proof attack on the S side: universalize the harvest integrals — candidate
      potential from F7.1: Phi = sum over live x of f(tau(x)) with Erdos-Kac
      leverage; target: EVERY P strategy admits S response with o(n) total.
  (3) If (2) stalls on a specific P-landscape family: construct it exactly in the
      arena and measure; if it bends the flat coefficient, switch sides.

## F23 (overnight 2026-07-23, session 3): exact-PV anatomy; the clearing game; Hall prefix criterion

Om asleep; solo overnight burst. 128-bit solver validated (matches corrected
table 25-45, 56-58, and u64 59-65 cross-check) and marching n=66..100 in bg
(run128_66up.csv). u64 filled 59-65: L = 24,24,25,25,25,25,26. k(n) = L - pi(n)
holds at 7 through 64, increments to 8 at n=65. L(n)/n oscillates ~0.40 flat.

### F23.1 Exact-PV anatomy (pvparse.py over pv24..pv60)

Optimal lines have a universal two-phase shape: contested phase T(n) moves,
then a forced free endgame A(n) = L - T (all remaining moves d0/locked-pairs;
value fixed regardless of play). Data (n: L = T + A, k(n), remnant comps):

  24: 11=6+5  k2 [21] | 30: 13=6+7 k3 [15,25,27] | 36: 15=7+8 k4 [21,25,33,35]
  40: 16=9+7  k4 [21,27,39] | 42: 17=10+7 k4 | 48: 19=11+8 k4 [27,39]
  54: 22=11+11 k6 [33,35,49,51] | 58: 23=12+11 k7 [33,35,49,55,57] | 60: 24=12+12 k7

- T(n) grows ~ pi(n/3)+O(1) (6,6,7,9,10,11,11,12,12): the contest ends when
  no live element has 2+ live comparables (board = free verts + locked pairs).
- P's contested play: ONE multi-prime defuser opening (30 = 2*3*5 at n>=54;
  18 = 2*3^2 at 40-48 — P *concedes prime 5 to S* there and S harvests via 5!)
  then cheap severs 2p (14->7, 22->11, 38->19, 26->13, 34->17).
- S's contested play: tower harvests in decreasing value (4-tower k13, 9-tower
  k4, then prime doubles 13,17,19,23,29 k2..k1). S does ~2/3 of all kills.
- Remnant comps are ALWAYS odd products of exactly the severed primes (33=3*11,
  35=5*7, 49=7^2, 55=5*11, 57=3*19 at 58). Layer peeling confirmed in exact
  play: S's 9-play kills 45 = 3^2*5 and 27 BEFORE liberation — killing via the
  still-live prime-square layer. Liberation requires the FULL interior divisor
  lattice dead, not just primes.

Ledger (exact, useful): L = (played primes) + (played composites);
k(n) = L - pi(n) = (played composites) - (severed primes). At 58: 10 + 13,
k = 13 - 6 = 7. Top-half primes are born-free (comp 0 forever): the classical
floor. THE asymptotic question == growth of played-composites under optimality.

### F23.2 Service ledger (new formal frame; short proofs)

- Top half (n/2, n] is an antichain: comp(z) = live-divisor-count for z there;
  once 0, z is unkillable — banked. S can never kill comp-0 top-half stock.
- Odd-remnant lemma: for even z in (2n/3, n], divisor z/2 can die ONLY when z
  itself is played (multiples 3z/2 > n; divisors of z/2 divide z). So even
  top-third elements always play at comp >= 1; clean liberation is odd-only.
  Matches PV remnants (all odd, all n tested).
- Moment-of-death identity: if d dies at time t (necessarily as collateral —
  any PLAY of a banked-later multiple would have killed d earlier), then every
  eventually-played z with d | z is live at t. So serv(d) := #{played z: d|z}
  counts elements all simultaneously live-and-vetoable at t^-: S playing d at
  t^- would kill all of them. Every service burst sat exposed for its whole
  preparation window. (This is P3/P4 sharpened to an exact identity.)
- Landau forcing: for any fixed T, all but O_T(n (loglog n)^{T-2}/log n) of
  played composites have tau > T, hence need > T-2-D services each. Linear L
  forces total service flow omega(n) — superlinear flow through vetoable
  bursts. (Quantitative restatement of the corpus invariant (INV).)

### F23.3 THE CLEARING GAME (new abstraction — candidate decisive object)

Abstract the race: W = interior elements (<= n/2), Z = top-half stock; each
z has requirement R(z) = its interior divisor set (|R(z)| = tau(z)-ish >= T
off the floor). Alternating: P DELETES one w per move (defuse — in the real
game, via a top-half vehicle play killing w divisor-side); S FIRES one live w
per move (plays it): firing w kills every z with w in R(z) not yet banked.
z is BANKED (P point, unkillable) when R(z) is fully deleted before any of
its elements is fired.

Greedy-fire heuristic: S fires the live w of max standing frequency, i.e. the
race walks the frequency-sorted list of W; an element of sorted rank r is
fireable by S-move ~r, so P must delete it by global move ~2r.

HALL/EDF PREFIX CRITERION (protectability): P can bank a family Z* iff
(roughly) for every prefix scale m,  |closure(Z*) ∩ W_{top-2r ranks}| <= r —
i.e. the interior closure of the protected stock has density <= 1/2 of the
ambient frequency order at EVERY prefix. Earliest-deadline-first scheduling;
exchange argument should make this a clean theorem inside the abstraction.

Computed consequences (in-head, MUST machine-check — guard-rail flag):
- Frequency order on divisor structure = magnitude order (freq(w) ~ n/2w).
  Prefix density of closure at scale m ~ P[omega(w) <= k-2] for stock of
  uniform omega-level k. Density <= 1/2 at ALL scales pins k to the RUNNING
  MEDIAN of omega at every scale m: k <= loglog m + c*sqrt(loglog m) for all
  m simultaneously — a Brownian-bridge/below-median-at-all-scales constraint.
- Layers reproduce the classics: omega=2 stock (semiprimes, closure = primes,
  density m/log m << m/2) is FULLY protectable: mass ~ n loglog/log — the
  classical lower-bound scale, rederived as the first unconditionally-sparse
  layer. omega=k protectable while (loglog m)^{k-2}/(k-2)! log m stays < 1/2.
- The all-scales median constraint puts the answer in the sqrt(loglog) window:
  protectable stock plausibly Theta(n / (loglog n)^{c'}) — SUBLINEAR (o(n)!)
  but far above n/log n, and empirically indistinguishable from linear at any
  measurable n (loglog(1e7) = 2.8). If instead the constraint admits a
  positive-density bridge family, the answer is LINEAR. The knife-edge of
  R172 is exactly the median window; the constant decides. Either way this
  frame explains why arenas at 1e5..1e7 look flat: (loglog)^c is ~2-3 there.

CAUTION (abstraction gaps, to be audited before believing anything):
(i) real P deletes a full CHAIN per pad-move (2,4,8,.. in one play) — P
stronger than 1/side; (ii) real S-fire has collateral: firing 3 kills interior
9,15,21 too — free deletions for P's ledger, S weaker; (iii) vehicles cost
kills and are plays (count in L, can be stock); (iv) banking still requires
PLAYING each banked z (1/move) while S eats pending; (v) S may prefer harvest
over fire (attention split). Items (i)+(ii) favor P, (iv)+(v) favor S. The
abstraction is a lens, not yet a theorem about L(n).

NEXT (tonight): build clearing.py — exact/greedy clearing game on true divisor
structure, n up to 1e6-ish: (a) measure max protectable mass vs n (scaling in
loglog powers); (b) verify the EDF/Hall criterion against brute-force small n;
(c) test S fire-policies (max-freq vs max-live-damage) and P schedules (EDF on
chosen Z*). Then map gaps (i)-(v) one at a time back into the real game.

## F24 (overnight cont.): securing-game kernel; measured n/loglog window; attention-split dissolution

### F24.1 Clearing-sim verdict (group-aware P vs maxfreq S; clearing.py)

Static-EDF P was a strawman (banked 2/427 at n=1000): once non-family stock
dies, S's maxfreq fire walks the family CLOSURE, not ambient W — the race is
fought on the closure hypergraph. Group-aware P (score w = sum over pending
z ∋ w of 2^{-(need(z)-1)}: complete near-done groups, value shared vertices)
banks 59/427. Scan:

  n=1e3: banked 59   banked/(n/loglog) 0.114  /(n/loglog^2) 0.220
  n=3e3: banked 159  0.110  0.229
  n=1e4: banked 486  0.108  0.240
  n=3e4: banked 1380 0.107  0.250

banked ~ 0.107 * n/loglog n, FLAT in that unit; declining as fraction of n;
RISING vs n/log n. The abstract game's own answer sits in the loglog window —
sublinear but barely, exactly where the F23.3 Hall analysis put the knife-edge.

### F24.2 Fidelity map (why the abstraction is faithful ONLY at bounded scale)

Global-scale corrections are polylog-sized on BOTH sides: real P deletes a
full divisor CHAIN per top-half vehicle play (tau per move) and self-funds
(every vehicle play is +1 L); real S fire kills the fired element's entire
stock-cone plus its interior sub-lattice as collateral. Since the window
between linear and the abstract answer is only loglog-wide, polylog-sized
model error swamps the global conclusion — the abstraction CANNOT decide
L(n) directly. At bounded quotient scale H, though, chains are <= log H and
cones <= H: all corrections are O_H(1) and the model is faithful. So:

  m(H) := value of the securing game at scale H  ==  the bounded-scale
  exchange margin of HANDOFF step 2, now in computable coordinates.

### F24.3 Attention-split dissolution (candidate closure of hole (b))

In the real game, S's move menu each turn is: (i) play an interior element w
— which simultaneously FIRES (kills all pending stock in cone(w)) and
HARVESTS (kills w's chain + cone: the kill-mass S wants) — or (ii) play a
top-half element: +1 L, kills only its divisor chain (helps P's other stock),
zero upside for S outside forced endgames. There is no third option. So S's
"veto duty" and "harvest duty" are THE SAME MOVES: the attention-split ledger
that P5(b) demanded is not a split at all. S's budget is simply 1 interior
play per turn, which is what the securing game models. P's menu likewise maps
fully: top-half plays (chain-delete + self-fund + possibly banked-stock play)
and stock-empty interior super-deletes (= the 2-adic pads of R174).
Remaining honest gaps for a theorem: (g1) S's fire collateral deletes interior
FOR P (S weaker than model); (g2) P's chain deletes several vertices/move
(P stronger than model); (g3) banking requires physically playing each banked
z (1/move) while pending; (g4) cross-scale leakage (deep roots vs H-cones).
(g1)+(g2) favor P, (g3) favors S, (g4) is the renormalization boundary — the
stitching inequality's actual content, now localized.

### F24.4 Fracture inequality (two-sided local accounting; new)

Define fracture time: first moment the live comparability graph is a disjoint
union of components each of bounded size (<= H). Then
  L = (moves before fracture) + sum over components of (component length),
component length in [1, L_loc(component)], every post-fracture move resolves
O_H(1) mass, so L >= #components. S must therefore prevent component
proliferation BEFORE fracture (vetoes / cone-fires), and S's pre-fracture
move count equals P's: the component count at fracture is exactly what the
securing game computes. Exact-PV confirmation at n<=60: fracture ~ move 12 of
23 at n=58; components = 11 free verts + locked pairs; L = 12 + 11.

March status: 128-bit solver VAL128_OK (matches u64 on 59-65); L(66)=26,
L(67)=27 (k=8 both, first move 30 persists). ~7 min/value at lg=29.

NEXT: exact securing-game solver on real closures at scale H (m(H) table);
then the stitching inequality in securing coordinates with (g1)-(g4) as
explicit error terms.

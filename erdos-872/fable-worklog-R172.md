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

## Log

- 2026-07-22: Ingest complete. Worklog established.
- 2026-07-22: F1 (CSV poison + corrected table to 58), F2 (tempo-battle structure),
  F3 (fibre renormalization). Line D formulated — now primary. Next: formalize +
  numerically solve the continuum band-race game.

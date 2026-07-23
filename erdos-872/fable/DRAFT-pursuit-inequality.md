# DRAFT: The pursuit inequality (mirror-veto program)

Status: WORKING DRAFT. Lemmas P1-P3 are proved here (short, self-contained).
Lemma P4 (crossing ledger) is proved modulo one marked comparability check
(done, inline). The PURSUIT INEQUALITY (P5) is the single open core — stated
precisely with its holes. Supersedes the G1-G5 framing of
DRAFT-master-theorem.md where they overlap; H1 is closed here (P1), H2 is
dissolved into P5 (no child-branching analysis needed if P5 closes).

Game: players alternate picking from {2..n}, chosen set stays an antichain
under divisibility, ends at maximal. Prolonger (P) moves first, maximizes
total moves L(n); Shortener (S) minimizes. "comp_t(z)" = number of live
comparables of z at time t (live divisors >= 2 plus live multiples <= n);
playing x kills exactly its live comparables, so

    n - 1  =  L + total kills  =  SUM over played z of (1 + comp_at_play(z)).   (*)

## P1 (bounded-degree concentration — closes H1)

If L >= eps*n then the number of plays with comp_at_play <= 2/eps is at least
eps*n/2.

Proof. By (*), SUM comp_at_play <= n - L. Plays with comp > C number at most
(n-L)/C <= n/C. Hence plays with comp <= C number >= L - n/C >= eps*n - n/C;
take C = 2/eps. QED.

So a linear-length play forces Theta(n) plays at bounded live degree
D := 2/eps. Everything below fixes eps and D.

## P2 (burned support)

Every element played at a time when all its prime factors are dead was
"burned into" that state: a prime factor p of a played z cannot itself have
been played earlier (z would have died as a multiple), so each dead prime
factor died divisor-side (burned). By the live-prime charge lemma, plays with
some LIVE prime factor at bounded degree D number <= (D+1) pi(n) = O_eps(n /
log n). Hence: of the eps*n/2 bounded-degree plays from P1, all but
O_eps(n/log n) have FULLY BURNED prime support at play time.

## P3 (root-veto exchange)

Let d be live and let Prep_t(d) = set of live multiples of d with
comp_t <= D + 1 ("prepared members of cone(d)"). If S plays d, every element
of Prep_t(d) dies (they are multiples of d). One S move therefore annihilates
the entire prepared population of any single live root, and its kill count is
1 + comp_t(d) >= 1 + |Prep_t(d)|. Conversely, the prepared population becomes
playable stock only if d dies WITHOUT killing cone(d), i.e. divisor-side: some
player plays x with d | x, x != d (then multiples of d not comparable to x
survive). This is the admission event for cone(d).

Cohabitation bound: |cone(d)| <= n/d, so a root at quotient scale
h(d) = n/d <= H admits at most H elements.

## P4 (crossing ledger: amplification is divisor-side only)

Define the crossing time tau(z) = first t with comp_t(z) <= D (monotone:
comp only decreases). Each z crosses at most once. Say move m = (play x)
crosses z if tau(z) = m and z survives m. Then z had a comparable c killed
at m. Two cases:

- c is a multiple-side kill (c = k*x, k >= 2). If c | z then x | z and z died
  — excluded. So z | c: z is one of the <= tau(c) divisors of c.
  [Comparability check: z ~ c means z | c or c | z; c | z forces x | z. Done.]
- c is a divisor-side kill (c | x, c killed). If z | c: again z is one of
  tau(c) divisors. Else c | z: z is a surviving member of cone(c).

Hence, per move, crossings <= SUM over divisor-side-killed roots c of
|surviving near-thin cone(c)| + SUM over all killed c of tau(c). The second
term is n^{o(1)} per killed element. AMPLIFIED admission (many crossings per
move) is possible ONLY through divisor-side kills of roots with large
prepared cones — i.e., only through the P3 admission channel. This formalizes
the admission mechanism and makes the preparation/veto race the sole
amplification pathway.

## The pursuit game (abstraction)

From P1-P4, a linear-L play requires Theta(n) crossed-and-survived,
burned-support, bounded-degree elements to be PLAYED. S eats thin stock at
>= 1 per move (playing one thin element kills its <= D cluster). So P must
sustain admissions at Theta(1) per move over Theta(n) moves, through
divisor-side root kills of prepared cones (P4), where:

- (advance) one move advances at most one deep preparation: two same-move
  advances at quotient <= H cohabit a single H^2-quotient (gcd absorption).
- (veto) S may zero any live root's preparation with one move, gaining
  1 + |Prep| kills (P3).
- (complete) P admits <= H per completion at quotient scale H (P3), at most
  one completion move per P move; a completing move may simultaneously
  advance one other lineage (the pipeline).
- (self-supply) S's own harvest moves also cross elements (their kills have
  divisor-side components); S chooses moves, so S plays to keep its own
  crossing collateral at the natural-floor scale. [Hole (d).]

## P5 (THE PURSUIT INEQUALITY — open core)

Claim (target). There are constants c, C such that against the S policy
"harvest by maximum kill value while that value exceeds C*D; afterwards, veto
the ripest live root (largest prepared population) whenever one exceeds
threshold, else eat thin stock," the total number of crossed-and-survived
elements over any play is O(n (loglog n)^C / log n).

Skeleton of the intended proof. (a) While S harvests, its per-move kill value
exceeds any veto's value; the harvest phase is short (kill mass n needs
SUM of kill values = n; value decays below V after at most n/V moves), so
the stock of advanced-uncompleted lineages entering the policing phase is at
most the harvest length n/(C*D). (b) In the policing phase, each P advance is
mirror-vetoed one-for-one before completion unless P completes on the very
next move; the pipeline (complete d1 + advance d2 in one move) sustains at
most one completion per P move whose admitted mass is bounded by the quotient
scale; S's veto/eat alternation must break even against this at exchange
>= (1 + Prep) vs <= H. (c) Deep scales are self-similar: an advance of
cone(d) at scale H is itself a completion at a sub-scale inside cone(d), so
the same inequality applies within cones; the scale recursion telescopes
across at most loglog n effective doublings. HOLES: (b) needs the honest
attention-split ledger (S has ONE move per P move for veto + eat + residual
harvest combined; P chooses which resource to stress); (c) needs the
renormalization bookkeeping (boundary terms when cones overlap across
scales — gcd absorption controls pairwise overlap but the union bound over
scales is unwritten); (d) S's self-crossing collateral needs a bound of
floor order (measured: under a passive P at n = 10^7, all severing is S's
own, total L = 1.07 n/ln n — the empirical floor).

## Why this dissolves H2

The old hole asked for a child-production bound on preparation lineages (to
fit the private-chain lemma). Under P3+P4, no branching analysis is needed:
ANY uncompleted advanced structure, regardless of branching, has a live root
and is one-move annihilable; branching only multiplies what a single veto
destroys. The only quantity that matters is the completion rate under
mirror-pursuit, which is what P5 bounds.

## Integration with the corpus invariant gap (added after F21)

- P0 (Landau floor): born-thin mass B_D = O_D(n (loglog n)^{c(D)}/log n)
  (comp_0 <= D forces z > n/(D+2) and omega(z) <= log2(D+2); Landau's
  pi_k count). So P1's bounded-degree plays are, up to floor order, CROSSED
  plays; the amplification battle is the whole game asymptotically.
- The R80 objects coincide with this draft's: poor targets (< r live legal
  killers) = crossed/thin elements; the bounded-multiplicity online charge =
  P5's attention-split ledger; nu's quantitative smallness at small-linear
  prefixes (via R80(1) with constant z, r) bounds the standing UNVETOABLE
  stock, while P3's veto handles cone-concentrated stock. P5 should therefore
  be attacked as an amortized potential inequality with
  Phi = |thin stock| + lambda * (poor-pair mass) + mu * (nu dual slack),
  using: advance <= 1/move (gcd absorption), veto annihilation (P3),
  nu-growth via constraint removal (Lipschitz in killed lower moves),
  crossing capacity (P4), floor (P0 + charge + privacy caps).

## Measurements wanted (next arena instrumentation)

1. Prepared-stock trajectory: SUM over live d of |Prep_t(d)| at checkpoints,
   split by quotient scale h(d) in dyadic bands — the "tower stock" curve.
2. Veto-value distribution: histogram of 1 + |Prep_t(d)| over live roots —
   what the best veto is worth at each phase.
3. Crossing attribution per move: divisor-side (which root, what cone size)
   vs multiple-side (tau-bounded) vs S-self — the P4 ledger, live.
4. rate(H): completions and admitted mass by quotient band, per move-pair —
   the empirical contraction sequence for (c).

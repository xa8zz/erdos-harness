# DRAFT: Master theorem program for L(n) = o(n)  [Theta-tilde(n/log n) target]

Status: PROOF SKELETON with labeled holes [H1]-[H5]. Not a claimed result.
Fable-5 solo track, 2026-07-23. Corpus dependencies cited by round id.

## Statement targeted

**Theorem (target).** L(n) = O(n * (loglog n)^{C} / log n) for an absolute C.
In particular L(n) = o(n), resolving the dichotomy on the sublinear side, and
matching the known lower bound c_delta n (loglog n)^2 / log n up to loglog powers.

## Architecture (five gears)

**G1 (bounded-quotient reduction — F6, session-derived).** In any play, moves at
positions where every live element's "residual richness" exceeds H contribute
O(n/H + n^{o(1)}) to L... precisely: Theta(n) total length requires Theta(n)
moves each playing an element z whose live comparability class has size O(1);
elements at polynomial quotient scales number o(n) in move-cost. Hence L is
controlled by the mass that reaches *hereditarily thin* status (fortress systems:
live sets closed under live-comparability with degree <= 2) plus the natural
floor (elements thin from the start: O(n/log n) — primes in (n/3, n] etc.) plus
harvest/battle moves (n^{o(1)}-scale prefixes; sieve-limited phases <= O(n/log n)
by the prime-frontier race with the 1/e identity). [H1: state and prove this
reduction cleanly — the session has it only as measured structure (75% of kills
in 66 moves at n=10^6) plus the scale-counting argument.]

**G2 (admission mechanism).** An element enters a fortress system only when its
last fat live comparable leaves the live graph, and (chaining thin-entries) every
fortress admission bottoms out at divisor-side kills: a move x admits new
fortress mass only through the near-thin cones of the weapons d | x it kills.
(Cone-side kills cannot admit: they kill the would-be admittees too.) Yield per
move: sum over killed divisors d of the PREPARED (near-thin) population of
cone(d). Preparation of cone(d) = fortress assembly of the quotient board at
scale n/d. [Session F12; mechanism verified against taxman/3p examples.]

**G3 (depth privatization — the new structural lemma).** If one move advances
preparations in two cones cone(d1), cone(d2) with bounded quotients n/d_i <= H,
then lcm(d1,d2) | x <= n forces gcd g = (d1,d2) with n/g <= H^2: both
preparations cohabit a single H^2-bounded quotient. Hence, at bounded quotient
scales (after absorbing H -> H^2 bookkeeping), each move advances at most ONE
deep preparation lineage: deep preparations form private chains. By the
private-chain lemma (R169(1), PROVEN: N_{j+1} <= (N_j+1)/2 under one-advance,
one-child), deep preparation processes are subcritical: total deep admissions
<= 2 * (moves invested) + O(depth). [H2: formalize "preparation lineage" so that
R169(1)'s hypotheses (each advanced gadget produces at most one child) hold or
generalize the lemma accordingly — the child-production bound is NOT yet
established for fortress preps; this is the hardest hole.]

**G4 (arithmetic-privacy cap).** Amplified admissions that bypass G3's recursion
(protection from pre-existing arithmetic rather than assembled preparation —
R170-type packets with prime leaves, rate ~M per move-pair) require pairwise
coprime support and are globally capped at O(pi(n) + sqrt(n)) = O(n/log n)
admissions total (R169(6), PROVEN, generalized: [H3] state the generalization —
"any admission whose protection certificate uses fresh pairwise-coprime supports
consumes those supports permanently" — and prove the consumption is injective;
watch owner-time-laundering (R136): the assignment must be prefix-measurable).

**G5 (rate closure with policing margin).** S's policy: maxdeg with fortress
policing (play inside 2-thin clusters when the best weapon degree falls below
threshold: removes >= 3 fortress elements/move vs P's <= 2/move assembly). Fixed
point: L <= floor + [2*(L/2) net of 3:2 policing] + O(n/log n) + n^{o(1)}
=> L = O(n/log n * polyloglog). [H4: write the policing allocation optimization
honestly — S's moves split between harvest and policing; the margin must survive
P forcing bad trade ratios. H5: the whole charge system must pass the 17
collapse-witness families, esp. terminal-delay (charges quantified at every
prefix, no activation clauses) and registration starvation.]

## Corpus joints (proven components used)

- R169(1) private-chain lemma [G3 engine]
- R169(6) pairwise-coprime gadget cap [G4 engine]
- Fundamental lemma of sieve theory [G1 harvest phases; standard literature]
- R80(2) fractional packing o(n) at sublinear positions [F8.2: no static stock]
- The session's F5-F7 (breadth wall, knife-edge, layer-peeling guard rails)
  contextualize why no first-order shortcut exists; not load-bearing.

## Session evidence consistent with the target

- Arena champion pair: L ~ 1.4 n/ln n, coefficient flat across 10^4..10^7.
- Severed-per-kill decays ~ 1/(log n)^{1.1} (T1b trend, passive P).
- Exact values to n=58; kill concentration (75% in 66 moves at n=10^6).
- bandrace3's 0.37 = 1/e prime-frontier equilibrium (S must exceed the pure
  prime channel; composite channels are correlation-limited — layer peeling).

## Hole ledger (priority order)

[H2] child-production bound for preparation lineages (G3/R169(1) fit) — HARDEST;
     failure here likely means the answer is genuinely linear via a
     child-branching prep architecture: in that case flip sides and construct.
[H4] policing-margin optimization vs adversarial trade ratios.
[H3] injective consumption for the privacy cap, prefix-measurable.
[H1] clean bounded-quotient reduction statement.
[H5] collapse-witness pass over the assembled charge system.

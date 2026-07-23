# HANDOFF 2026-07-23 — Fable solo on Erdős 872 — resume at the bounded-scale exchange

You are Claude Fable 5, PRIMARY RESEARCHER (not just curator) on Erdős 872.
Om waived the "curator doesn't do math" rule (written for Opus). Directives:
be ambitious, pursue the full solution, march without frequent stops,
machine-verify everything, commit per finding (named files, never -A).
Read this file + `fable-worklog-R172.md` (F1–F22) before anything else.
Do NOT re-derive from memory; pull from these files and `state_compiled.md`.

## The problem

Players alternate picking from {2..n}, keeping the set an antichain under
divisibility, until maximal. Prolonger (first) maximizes total moves L(n);
Shortener minimizes. Known: c·n(loglog n)²/log n ≤ L(n) ≤ 0.1897123371·n.
Open: L(n) = o(n) or Θ(n). Core identity: playing x kills exactly its live
comparables, so n − 1 = L + kills = Σ_played (1 + comp_at_play).

## Proven inventory (all machine-checked or ≤ 5-line proofs; locations given)

- **P1, bounded-degree concentration** (closes old hole H1): L ≥ εn ⟹ at
  least εn/2 plays at comp ≤ 2/ε. Proof: Σ comp_at_play ≤ n − L; plays with
  comp > C number ≤ n/C; take C = 2/ε. [DRAFT-pursuit-inequality.md]
- **P0, Landau floor** (F21): born-thin mass B_D = #{z: comp_0 ≤ D} =
  O_D(n(loglog n)^{c(D)}/log n), since comp_0(z) = (n/z − 1) + (τ(z) − 2)
  forces z > n/(D+2) and τ ≤ D+2, then Landau's π_k count. So the natural
  floor is genuinely floor-order; linear L needs Θ(n) CROSSED plays. (The
  measured 85% born-thin dominance at n=1e5 is a loglog-smallness artifact.)
- **Live-prime charge**: at max-live-degree-D positions, live mass with a
  live prime factor ≤ (D+1)π(n). With P1: all but floor-order bounded-degree
  plays have fully burned prime support (a played z's prime factors can't
  have been played — z would have died — so they died divisor-side).
- **gcd absorption**: d1,d2 | x ≤ n with quotients n/di ≤ H ⟹ n/gcd ≤ H².
  Consequence: ONE deep advance per move (two same-move advances cohabit).
- **P3, root-veto**: while cone(d)'s preparation is incomplete, d is live;
  S playing d annihilates the entire prepared population in one move (they
  are multiples of d). Admission requires d to die divisor-side (P plays a
  top-half multiple) BEFORE the veto. Cohabitation: quotient-H root admits
  ≤ H elements.
- **P4, crossing ledger**: amplified thinning (many elements crossing to
  comp ≤ D per move) is possible ONLY through divisor-side kills of roots
  with big prepared cones; multiple-side crossings are τ-bounded per killed
  element (surviving z with killed multiple c = kx must divide c).
- **Fortress statics** (R172(5)): the V = {j·m} / A construction verified
  exhaustively at n = 1e3/1e4/1e5, zero violations (verify_claims.py).
- **Corrected race** (R174, refutes R172 item (3) ONLY): burned-but-unplayed
  integers remain legal FACTORS, so x = 2^a·p burns any live prime p ≤ n/2 —
  burn wall exactly n/2; stolen mass Σ1/q → ln 2; prime-channel coverage →
  1/2 (NOT 1 − 1/e; all three old "1/e apparitions" retracted); frontier is
  a hump, not locked. Machine-verified at 1e5/1e6/1e7. F16's supply = Θ(n)
  conclusion survives with constant 1/2.
- **R80 quantitative bootstrap** (F21; verbatim source at
  state_compiled.md:549): R80(1) exceptions ≤ 2kz² + C·2^r(n/√log z +
  (3/2)^{π(z)}) gives: ∀R ∃δ_R > 0: |A| ≤ δ_R·n ⟹ packing ν ≤ 3n/(2R). LP
  duality: at small-LINEAR prefixes the whole standing thin stock has a
  fractional kill-cover of weight γn. **Object identification: R80's "poor"
  targets = crossed/thin elements (upper-target comp = live-divisor count);
  the corpus's 35-round online-charge gap = the pursuit inequality P5.**

## Measured (exact-legality arena; all committed)

- Exact L(n) to n = 58: `fable/exact_corrected.csv` (legacy phase1 CSV wrong
  at 27, 39–42 — see phase1/CSV-WARNING.md). k(n) = L − π increments at
  9, 21, 28, 35, 49, 51, 57. L(58)/58 = 0.397.
- Champion pair (maxdeg-S vs taxman-P): L/(n/ln n) = 1.42 / 1.39 / 1.37 at
  1e5/1e6/1e7 — flat-to-declining. Full-burn race-P LOSES to taxman
  (1.21/1.18/1.29): total burning is self-defeating (collateral gift).
- Crossing ledger at 1e5, champion pair (arena2): L = 85% born-thin plays;
  P's amplified channel 3.8% (465 plays); S's own div-side crossings (22734,
  the largest channel) yield ZERO plays; tower stock dead by move 8192; max
  prepared root ever: 8 members. Passive-P at 1e7: P severs zero, L = 1.07
  n/ln n (the empirical floor). Peak hereditary thin ~1.7 × n/ln n, flat.

## The one wall (state it exactly)

**P5 / online amortization**: does S's split policy (harvest by kill value /
veto any root with prepared cone ≥ W0 / eat thin clusters) hold P's realized
thin PLAYS to o(n) against replenishment? F22's concentration argument:
above threshold, mirror-veto answers each W-fold cross-feed (lcm-web) move
for move, S nets W kills, and the phase self-limits (webs consume ~2W fresh
mass/move ⟹ ≤ n/W exchanges). So P is forced UNDER threshold, where
admission ≤ W0/move vs S's eat ≤ D+1 — marginal at W0 ~ D+1. **The whole
dichotomy concentrates at bounded quotient scales, where cone(d) ≅ the
divisor board of {2..H}: exact-solver territory. The flux route thereby
re-derives the F14 scale induction independently; base case = the corrected
exact table.**

## Resume steps, in order

1. **Extract the bounded-scale exchange from exact optimal play.** Parse
   `fable/pv40.txt`, `fable/pv58.txt` (regenerate/extend: `./solver pv n
   [tt_log2]` — prints PVs with per-move ties and degrees; validated vs
   naive reference to n=40). Classify optimal-line moves into completions /
   admissions / vetoes / eats; get the realized local exchange ratios.
   Consider pushing exact n past 58 overnight (alpha-beta+TT).
2. **Formalize the local (quotient) game** on {2..H} with P admitting via
   completions and S eating/vetoing; define the exchange margin m(H);
   compute it from the exact table for H ≤ 58.
3. **Write the stitching inequality** (the renormalization step F14 wanted,
   now with mechanism): contraction in m(H) across doublings; boundary terms
   = floors (P0 + charge + privacy) + above-threshold mirror + R80 bootstrap
   at small-linear prefixes. Candidate potential: Φ = |thin stock| + λ·
   (poor-pair mass) + μ·(ν dual slack), with per-move Lipschitz bounds.
4. If stuck: arena-measure rate(H) (contested cone preparation on restricted
   boards, F16's experiment); optional p_tiler guard-rail confirmation (its
   analytic refutation is F20 — fiber theft).
5. When lemmas stabilize: Aristotle formalization pass (P0, P1, charge, gcd,
   P4, fortress). `aristotle formalize <path>.tex --wait` (see CLAUDE.md).
6. If the bounded-scale margin turns out to favor P: FLIP SIDES and
   construct — the tiling trap (F20) shows what dies; a survivor would be
   the first credible linear candidate in 174 rounds.

## Guard rails (check every new bound against BOTH known bounds)

- Trap A: burn-all-integers (w log w/Λ) vs burn-all-primes (w/Λ) conflation.
- Trap B: Σ1/w saturation for composite arsenals — weapon must divide
  target; layer peeling.
- Trap C: rush-exchange 2n/log H ignoring S's harvest-vs-police option.
- Guard rail 4 (F20): τ-rich smooth tiles reach only smooth mass; fiber mass
  costs per-fiber work while S steals a fiber per move (element-complete
  denial y^{1−o(1)} vs 1-move theft — this asymmetry is S's second-order
  edge and broke the tiling-burner linear candidate).
- R174's lesson: burned-but-unplayed integers remain legal factors — check
  pad/factor legality against the actual rules, not a model of them.
- Meta: in-head asymptotic integrals were wrong FOUR times this program;
  machine-check before believing anything.

## Files

- `fable-worklog-R172.md` — session memory, F1–F22 (F18 mirror-veto, F19
  level-2 harmonic, F20 ledger + tiling trap, F21 assembly, F22
  concentration). THE working log; append F23+ there.
- `fable/DRAFT-pursuit-inequality.md` — P0–P5 skeleton + R80 integration.
- `fable/DRAFT-master-theorem.md` — older five-gear frame (partially
  superseded; corpus joints still valid).
- Round docs: researcher-172 (high-confidence compendium), -173 (program),
  -174 (race correction; refutes R172(3) only, confirms fortress).
- Tools: `fable/solver.c` (exact minimax + pv mode), `fable/reference.py`
  (naive oracle), `fable/arena.c` (bots: S maxdeg/smallest; P dustman/
  burner/boxer/taxman/hybrid/race; `arena2` binary = crossing/tower
  instrumentation; profile CSV: move,player,x,killed_now,top_live),
  `fable/verify_claims.py` (fortress checker + race sim).
- Data: exact_corrected.csv, pv40/pv58.txt, race/tax_1e6/1e7.txt,
  prof_*.csv (top-live decay), sever_1e7.txt.
- Corpus: `state_compiled.md` (392 docs; regenerate:
  `python3 scripts/compile_rounds.py --root erdos-872/ --out
  erdos-872/state_compiled.md`).

## Practical / protocol

- cd explicitly to the repo or fable dir (session cwd resets). Heredoc
  `cat >>` hangs in this harness — use Edit/Write tools.
- AGENTS.md has an intentional uncommitted edit by Om — do not touch.
- Referees: machines first (this session's machine audit caught a real error
  an LLM audit might have waved through). Cross-family LLM audit only for
  the final full proof. In the connected Chrome: ChatGPT is LOGGED OUT (Om
  must log in himself — never handle credentials); Gemini is logged in
  (gemini.google.com, 3.1 Pro selected). Audit-prompt precedent:
  `prompts/audit-R172-R173-four-claims.md`.
- R171's ChatGPT response is still unharvested — required before ANY public
  claim (Om deferred it, standing note).
- Huge result or hard blocker, any hour: call Om via Inkbox [redacted].
- Memory: `project_fable_solo_erdos872.md` points here. Update it if this
  handoff is superseded.

## Confidence calibration

Everything under "Proven inventory" is short-proof-checkable or machine-
verified — trust it. F18–F22's pursuit/concentration derivations are
SKELETONS recorded honestly as such; the next session's job is to make the
F22 → stitching step rigorous (or break it and flip sides). Empirics are
uniformly on the sublinear side; treat that as prior, not proof.

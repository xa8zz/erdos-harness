# Handoff — moonshot session of 2026-07-11/12 → 13 (Fable-5 curator + GPT-5.6 Pro)

Operational handoff, REWRITTEN CLEAN at session end (~15:00 local 07-12).
All math state is in round docs R78–R128 + verify-postresp docs (all
committed and pushed) and `state_compiled.md` (343 round docs). This
file carries session-operational state for the successor curator.

## Program status (end of the marathon)

- Unconditional bracket unchanged and PUBLIC (forum-posted, pinned
  018a346): c_delta n(loglog n)^2/log n <= L(n) <= (0.1897123371+o(1))n.
- TWO major refutations PROMOTED with 2x independent VALID audits each:
  1. Fixed-cap fortress entry impossible at every cap H(n) = o(r(n))
     (researcher-104 + verify-postresp-R107a/b). Theta-side needs caps
     ~ r(n) or a non-reservoir mechanism.
  2. First-sweep ordered-shadow (OS)/(WOS) unconditionally false via
     private-carrier drafting (researcher-105 + verify-postresp-R109a/b).
- Established machinery added (audit-confirmed): one-sweep containment
  theorem (researcher-101, R106-audit VALID); prime-product guard with
  nonempty-S proviso (R98/R106); surviving-shadow theorem WITH the R113
  carrier-legality repair + cone compression (researcher-110/R113);
  deep-layer theorem — only the first C*loglog H peel layers matter
  (researcher-116); root-indexed first-blocker lemma (researcher-102).
- THE FORMULATION WAR (R98→R129, the session's main plotline): every
  attempt to state the decisive o(n)-side intermediate collapsed to a
  degenerate witness — FIFTEEN collapse families now catalogued
  (terminal delay, prelude delay, pre-freeze cap forcing, shell
  deferral, zero weights, first-exit reassignment, cost-only
  equivalence, micro-baseline compression, cap escape, epoch-boundary
  laundering, uncharged scheduling delay, post-hoc cohort selection,
  registration starvation, additive-floor chattering, parameter-level
  vacuity). Two scope-limited no-go theorems survived narrowly:
  per-shell serial-ticket schemes are starvation-or-(OA)
  (researcher-123 + R124a/b), and off-path-quantified statements are
  false via unreachable fortresses (researcher-118 + R119a/b — the
  off-path/on-path quantifier doctrine).
- CURRENT CANONICAL TARGET: (AE†) — aggregate-excess halving
  (researcher-128): with H^6 = o(n) and closed uniform quantifiers,
  a fully specified policy halves R(t) = sum_{X>=H^6}(q_X - 4X/h^2)_+
  within C*M*log(h)/h + O(log n) turns, mandatory succession.
  Constructed BY an adversarial auditor (R124a), parameter-repaired by
  R128, which also PROVED: (AE†) => L(n) = o(n), and (AE†) is NOT a
  rewriting of the full problem (sqrt(n)-decrement separation). This is
  the first intermediate proven non-tautological. R129 is attacking it.
- Lessons codified in skills/write-solution-attempt-prompt.md: no
  hypothetical grants with ambiguous quantifiers; terminal-delay
  degeneracy check (prescribe activation data in advance); NEW —
  parameter ranges are part of the statement (every scale parameter
  carries its implicit constraints explicitly).

## In-flight (ChatGPT Pro, account "[redacted-name]", cap 5)

Tab IDs are EPHEMERAL; THREAD URLS are durable:

| What | Thread URL | Status |
|---|---|---|
CURRENT MOMENT (~08:45 UTC 07-15): ONE thread in flight:
| R164: targeted (SC*) repaired, prove or refute | chatgpt.com/c/6a5735d2-440c-83e8-ba7b-a44afb14d1f0 | RUNNING (sent ~08:40 UTC 07-15, gpt-5-6-pro, server len exact 89411, checksum-verified). Pending save: researcher-164-<slug>.md (predecessors [R163-sc-oversized-y-vacuity], kind extends target R163-...) |
R165 SAVED (round165-empirical-ledger-probe.md, diagnostic, confidence
low): NO tested Prolonger policy (random / greedy-block / shell-defender)
sustains a linear or even stable second-shell phase to n=50k — active
fraction SHRINKS (0.012 -> 0.0058 for the best); nu_Y demand shrinks vs
the n loglog Y curve. Simulator committed at phase5-ledger-probe/ —
IMPLEMENT AND MEASURE any future analytical Prolonger construction there
before believing it. STILL TO DO: R166 free-roam refill (base =
prompts/researcher-R162-solution-attempt-full-compilation.md + R162/R163
blocks + the R165 empirical line); cross-family check (needs Om). Crons:
watcher f168df07 (11,41), heartbeat 87d1c3c1 (:53) — session-only,
RE-ARM ON SESSION RESTART. Chrome: deviceId 715cad76 standing choice;
ChatGPT login [redacted-name]. Protocols: docs/chatgpt-backend-api.md.

R163 LANDED AND SAVED (researcher-163-sc-oversized-y-vacuity.md — 25th
collapse: oversized-Y normalization escape (Y_n=e^{e^{(log n)^2}} makes
the o(n loglog Y_n) remainder swallow everything since nu saturates at
Y=n/4 while omega(g)<=log_2 n). Literal (SC) TRUE-BUT-VACUOUS with
C_alpha=0. Exact repairs: A (Y_n<=n/4 range + frozen-entry Y_n^2 a_n =
o(n loglog Y_n)) and B (Z_n=min(Y_n,n/4) normalization; canonical
prime-harmonic form (SC*) with Lambda_n = sum_{p<=Z_n}1/p) + explicit
sup-remainder quantifier order. (SC*) is the substantive target,
UNATTACKED this round. NEXT DISPATCH MUST state (SC*) verbatim.)

STRATEGIC FLAG (curator zoom-out, 07-15): R157->R163 each added one causal
layer + one collapse family (21st-25th) around the SAME capacity-vs-demand
frame — every theorem is real (audited machinery keeps accumulating), but
the scissors reopen at a finer scale each round. This matches the
sigma*-trap diagnostic: within-family attractor risk (ALL concurrences are
GPT-5.6). RECOMMENDED before more same-frame dispatches: (1) the
never-executed CROSS-FAMILY check (hand the compiled frame + (SC)-repair
statement to Gemini/Claude fresh threads and ask whether the frame itself
is the right decomposition); (2) an empirical sandbox probe of the
preparation-demand vs reply-capacity ledgers at n ~ 10^4-10^5 (measure
actual nu_Y sums along greedy games). Flagged to Om via noti.

R161 LANDED AND SAVED (researcher-161-downward-shadow-laundering.md —
23rd+24th collapses (downward-shadow + face-pressure laundering); FOURTH
causal layer: sigma<beta<gamma<t (shadow < coatom < release < service);
downward-shadow dichotomy THEOREM (gcd of any coatom subfamily: legal =>
|U|<=Delta_j, illegal => earlier Prolonger first-blocker); Prop 1: ALL
multiscale aggregations of fixed-Y bounds provably dead; TK demand side
REAL: linear root family carries (delta/3)n loglog Y obligations; sharp
packet: one reply prepares Theta(Y/log Y) private coatoms BUT with hidden
common face d (the dichotomy catches it). THE program-critical reduction:
named inequality (SC) — shadow-closed uniform preparation capacity,
sum nu_{Y_n} <= C_alpha E + o(n loglog Y_n) — and Prop 4 PROVES
(SC) => FSC(2,eta) for the prescribed policy. Next: attack (SC) directly.
Depth-J iteration needs shadow-blocker uniformity across earlier shells
(unaddressed).)

R159 LANDED AND SAVED (researcher-159-tri-causal-coatom-preparation.md —
22nd collapse: ancestor-preparation laundering; bi-causal system NECESSARY
BUT NOT SUFFICIENT (explicit linear table satisfies ALL prior conditions
yet is a non-trajectory: even coatom 2b_t can never be blocked by odd
replies). PROVEN: prime-quotient lemma (every released root = prime lift
of its last ancestor); off-branch coatoms already illegal at release;
coatom first-blockers are EARLIER Prolonger replies; distinct coatoms need
distinct replies => each released root costs omega(r)-1 distinct earlier
replies; strict tri-causal chronology beta<gamma<t. Proposition 5:
fixed-prime preparation capacity sum nu_Y <= (Y/alpha)E + O(Y^2|A_1|),
unconditional but fixed-Y is not exclusionary. NEXT NAMED TARGET:
MULTISCALE (growing-Y) preparation-capacity theorem. Scope: minimal-max-
degree-policy-specific; no finite-shell induction.)
R162 LANDED AND SAVED (researcher-162-packet-capacity-obstruction.md —
SUMMABLE-WEIGHT BARRIER: every additive coatom ledger with summable
prime weights (any fixed s>2) provably cannot close the upper bound;
unweighted counts fail via interval-blocker (n/log(1/rho) roots per
rho*n blockers); packet three-role simultaneity confirmed; only
nonadditive/chronological/trajectory-restricted capacity arguments
remain viable. No disproof either.)

R160 LANDED AND SAVED (researcher-160-chronology-safe-ls-ledger-bicausal-packet.md
— NEW TOOL: chronology-safe L^s first-death ledger (sum (d/x)^s <= C_s*m
over any m-move interval — the FIRST genuine lifetime bound covering
direct ancestors, closing the gap open since the atomic ledger); rigid
coatom-release lemma (unique prime q, lambda=r/q legal, lambda | p);
bi-causal packet counterexample p=3m serves THREE obligations at once
(kills pointwise capacity even locally); honest insufficiency: ledger
capacity Theta(n) MATCHES demand Theta(n). Open object refined: a
PREPARATION-SENSITIVE joint packet-capacity theorem (amortize over
preparation history, not per-move). Pending refill: R162 free-roam
(R160-prompt base + R159 tri-causal + R160 ledger/packet).)

R157 LANDED AND SAVED (researcher-157-postponed-service-laundering.md —
21st collapse: postponed-service laundering (endpoint release totals can
credit late root-bursts to early turns; repair = PREFIX accounting).
PROVEN: future-target persistence; future-service pressure
Delta_t >= (|X|+T-t+1)/(n/8-t+...); UNIQUE Prolonger release time gamma(t)
per greedy root; EXACT PREFIX HALL EQUALITY s = |I(s)| + sum_{j<s}|C_j(s)|
with |M(A_1)|=o(n) forcing sum_{j<s}|C_j(s)| >= s-o(n) for every linear
prefix. The bi-causal reply system: each reply must jointly satisfy
survivor deadlines + multiscale prefix Hall + joint packet containment
lcm(B_j u {lambda_j(r)}) | p_j <= n. THE named open object: a JOINT
PACKET-CAPACITY THEOREM (bound cumulative mass released by
distinct-last-ancestor packets across replies under sum Delta_t <= E).
Next dispatch should target it directly — prefix Hall, release times,
noncreation, causal orientation are settled inputs.)
R158 LANDED AND SAVED (researcher-158-fsc-dyadic-vs-cj-bifurcation.md,
confidence LOW — purely diagnostic: my prompt bullet "fixed-depth clearing
holds for every fixed J" bifurcated (dyadic-shell reading = FSC(J,eta)
all J, UNPROVEN, would give o(n) via the clean epsilon/J/eta compactness
argument; C_j refinement-layer reading = the actual R156 result, no
length bound). NOT a resolution. PROMPT RULE: never say "fixed-depth
clearing" bare — say "minimal-legal-layer clearing (C_j)" vs
"dyadic-shell clearing FSC(J,eta)".)
Pending refills: R159 targeted = the joint packet-capacity theorem
(R157's named object; attach R157 verbatim + settled inputs);
R160 free-roam (R158 base with the bifurcated bullet FIXED).

INCIDENT (07-13 ~17:00 -> 07-14 ~17:30 UTC): loop stalled ~18h. A second
Chrome registration (deviceId 885e1fe3-...) reconnected mid-dispatch,
triggering the harness's multi-browser gate (AskUserQuestion required);
everything including watcher ticks queued behind the unanswered question.
Om answered 07-14: USE deviceId 715cad76-7c5f-4d4e-b596-3d714274968e
(standing choice — subagents are briefed to select_browser it on any flap).
The 885e1fe3 registration still flaps; ask Om to sign the extension out of
that Chrome/profile to kill the failure mode permanently. Chrome restarted
during the stall: tab groups/ids reset again (currently 831679555 = R157
thread, 831679556 = R158 prep).

R155 LANDED AND SAVED (researcher-155-shortener-cover-causal-repair.md —
20th collapse: post-blocker player laundering ("divides a
Shortener-selected move" has two readings, causal=provably empty via
Lemma 1, noncausal=vacuous via n=30 example). CAUSAL ORIENTATION THEOREM:
survivor-incident divisors are incomparable with every greedy move; first
blockers are ALWAYS Prolonger replies; causal deadline k_X(d)>E/s =>
d | p_j for some j<s (E = targets lost, sharper than |S_1|). Persistent
roots tightened to (eta*c/(1-eta))n. n=96N abstract construction realizes
ALL static requirements at linear scale => no purely arithmetic theorem
settles FSC(2,eta); the greedy DYNAMICS must be used. Open: can genuine
Prolonger replies realize the repaired obligations on-trajectory.)
R156 LANDED AND SAVED (researcher-156-prolonger-common-core-mass-release.md
— Lemma: max-degree play can always use a MINIMAL legal mover; NONCREATION
lemma: minimal Shortener moves never create new minimal legals => under
the minimal-max-degree policy ALL root regeneration is Prolonger-only;
first-death ledger sum tau(a_i); common-core construction: ONE Prolonger
move creates k ~ log n/loglog n new minima (refutes O(1)/move); fixed-depth
clearing proven for every fixed J but diagonalization to growing g(n)
formally impossible (explicit profile). Gap = direct-ancestor lifetime MASS
ownership.)
CONVERGENT PICTURE after R155+R156: both burdens now sit on PROLONGER's
replies (causal orientation + noncreation). The single open object:
bound the lifetime target mass released by one Prolonger reply across all
its later refinements (common-core moves release ~log n/loglog n minima
instantly and can be inherited unboundedly). Next: R157 targeted on the
Prolonger-reply batch-coverage question with both machineries; R158
free-roam.
Pending refills: R157 (prompts/researcher-R157-prolonger-reply-coverage.md
when composed), R158 (prompts/researcher-R158-solution-attempt-full-
compilation.md when composed).

DISPATCH PROTOCOL v3 (2026-07-13, after a subagent declined to send): subagents
now do PREP ONLY — navigate, verify Pro, inject JSON-escaped chunks, verify
composer, STOP UNSENT — and the CURATOR clicks send + backend-verifies, since
the user's standing authorization lives in the curator's session, not the
subagent's. Brief subagents honestly: no "user asleep" framing; explain the
no-base64 rule as byte-fidelity + keeping content human-readable (an opaque
base64 blob in an agent's context got flagged by Anthropic's classifier and
killed the agent — it is NOT about any ChatGPT-side filter). Chrome account
note: ChatGPT login is [redacted-name] / [redacted-email].

R152 LANDED AND SAVED (researcher-152-fsc2-equivalence-persistent-root-deadline-open.md
— PROVEN: repaired capped-tail exclusion IS FSC(2,eta) (Prop 1, both
directions); persistent-incidence bound T*k_X(d)<=|S_1|; LINEAR persistent
root family |R|>=(eta*c-o(1))n already legal at sparse entry; static
completion NOT contradicted (forces only |M(B)|>=~n/H, would need o(n/H));
exact survivor deadline: d legal at B with k_X(d)>|S_1|/s must divide a
selected move within first s turns, for EVERY s. FSC(2,eta) is EXACTLY
equivalent to nonexistence of a time-ordered primitive multiple-cover
schedule meeting all prefix deadlines while staying incomparable to X.
Class-splitting disproof candidate KILLED at sparse positions (would force
Theta(n) minimal legals). Open both ways: persistent-root deadline theorem
(proof) vs postponed-refinement realization (disproof).)
R154 LANDED AND SAVED (researcher-154-shallow-cone-hazard-conditional.md
— NEW: cumulative minimal-root sparsity Lemma (union over whole prefix is
o(n)); root-quotient HAZARD policy (choose d prop. to d^{-s}): any x with
x/m>H for its minimal root m dies next move w.p. >= c_s H^s/n against
adaptive play; Proposition 3 CONDITIONAL THEOREM: if T=o(n), H->inf,
TH^s/n->inf and the shallow quotient cone C_T(H)={mq: m ever-minimal,
q<=H} stays o(n), then L(n)=o(n) (derandomized via backward induction +
continuation lemma). Counter-profile shows fixed-shell sparsity can't
supply the cone hypothesis (roots at scale n/G with Theta(G) quotients;
mass migrates to deeper shells). Missing: chronological theorem — cone
mass Theta(n) forces Theta(n) deletion/play/banking in o(n) moves.)
Pending refills: R155 targeted (fuse R152 multiple-cover schedule +
R154 shallow-cone condition — same chronological object from two sides);
R156 free-roam (R154-prompt base + R152/R154 results).

R151 LANDED AND SAVED (researcher-151-chronology-gap-audit.md — free-roam
negative: factorization entropy dies on shallow star fibers; peel+static
completion needs o(n/H) completion (H/log H divergence); height sweep
fails on width (root d carries antichain {dp}); missing ingredient named
as a chronological TRICHOTOMY equivalent to the (AE-dagger) recurrence).
R153 AUDIT LANDED AND SAVED (verify-postresp-R153-capped-tail-second-shell-mixed-verdict.md
— R1/R4/R5/R6/R7 VALID as stated (deadline formulation + constant-cap
suffix + TK lemma now ESTABLISHED); R2 valid ONLY as deletion-set
equality, NOT substitutable game move (n=48, A={5,7,11,16}: d=6 vs r=3);
R3 repaired to T-o(n); R0 equivalence needs FOUR conditions; R150's R8
deployment had four overreaches — true cap-entry time for a loglog
trajectory is n*exp(-exp(Theta(H))), NOT n/H, and the abstract trajectory
proves only scalar-inequality consistency, not game realizability.
CRITICAL for future prompts: never cite R8's trajectory as evidence a
linear tail is achievable; never treat O(n/H) as the actual cap-entry
time.)
R149 LANDED AND SAVED (researcher-149-capped-tail-vacuous-repair-root-reduction.md
— 19th collapse: my exclusion transcription omitted eta_0>0 (activation
suppression via eta_0=-1); exact repair = FSC(2,eta) itself. SIX new proven
results: legal-divisor upset; minimal-root equivalence (greedy move = minimal
legal root, same deletion set); linear tail => cn distinct NEW minimal-root
events post-entry; (c/2)n of them concentrate in ((c/2)n, n/4]; every linear
tail contains a linear CONSTANT-cap suffix (starts at fixed fraction, evades
fixed-cap no-entry); deadline formulation: d legal through a cn-turn tail =>
final-survivor incidence k_X(d) <= 1/(4c)+o(1). Frontier now: can ONE blocker
meet many deadlines at once (direct-ancestor batch).
Pending saves: R152 -> researcher-152-<slug>.md (predecessors
[R149-capped-tail-vacuous-repair-root-reduction, R150-second-shell-chronology-gap],
kind extends target R149-capped-tail-vacuous-repair-root-reduction,
prompts/researcher-R152-fsc2-repaired-deadline-attack.md). R151 ->
researcher-151-<slug>.md (kind standalone,
prompts/researcher-R151-solution-attempt-full-compilation.md).
R150 LANDED AND SAVED (researcher-150-second-shell-chronology-gap.md — NEW
PROVEN lemma: Delta_Q >>_eta loglog(n/t) on the second shell via
Turan-Kubilius restricted to (n/4,n/2], K=min(n^{1/8},(n/t)^{1/4});
but integral of loglog(1/s) vanishes at 0, so the rate is integrable and
cannot exclude the capped tail; abstract compatible trajectory
Delta_t~loglog(n/t), |M_t|~n/loglog(n/t), |Q_t|~n exhibited; gap = a
NONINTEGRABLE chronology theorem, i.e. (AE-dagger)-strength. Audit
candidate: the Turan-Kubilius lemma, single-source. R149 still running
(sandbox-simulation phase observed on-screen ~04:05 UTC).
HARVEST PROTOCOL UPDATE: phantom window blocks clipboard writeText —
VALIDATED replacement: blob download (URL.createObjectURL + a.download
click on the tab, no focus needed) -> lands in ~/Downloads -> cp to
scratchpad, rm the Downloads copy. Documented in docs/chatgpt-backend-api.md.

Three slots spare (Om is actively using the account himself — leave headroom; next audit candidates: R146's cap-entry theorem + doubling lemma, R148's coatom-ownership/cumulative-sparsity corollary, R138's localization theorem).

ENVIRONMENT RESET (~09:30 UTC 07-13): Om's Chrome was fully reinstalled/fixed
after a multi-hour outage (chat cutoff + extension disconnect). NEW facts:
extension deviceId 715cad76-...; the old phantom-window tab group is GONE —
fresh tab group, tab IDs change every reconnect (get via tabs_context_mcp);
ChatGPT re-logged-in ([redacted-name]). Session crons were re-armed as f168df07
(watcher 11,41) and 87d1c3c1 (heartbeat :53) — the watcher prompt now bakes in
the end_turn check, blob-download harvest, and subagent dispatch. Om asleep
(~09:40 UTC): standing authorization re-confirmed — aggressive autonomous
continuation toward a solution; CALL [redacted] if something breaks hard OR
a full solution survives audits; keep this handoff updated for compaction.

DISPATCH PROTOCOL UPDATE (2026-07-13, post-sleep phantom window): the MCP tab group's Chrome window went 0x0/hidden after a system sleep — OS clipboard paste is impossible into it and osascript keystrokes steal Om's focus (he vetoed). VALIDATED replacement: a Sonnet subagent dispatches ENTIRELY through claude-in-chrome on the hidden tabs — JSON-escaped prompt chunks (python json.dumps, ~8KB parts; base64 trips the usage-policy filter) staged onto window.__pN via javascript_tool, assembled + document.execCommand('insertText') into #prompt-textarea, DOM-click send, backend-API verify (default_model_slug 'gpt-5-6-pro', marker-once check). No focus, no clipboard, no screenshots in curator context. See docs/chatgpt-backend-api.md § Low-context dispatch.

PROMOTED this session: R133 (SM)-refutation — R135a/b both VALID
(verify-postresp-R135a/b saved). The static-modulus route is CLOSED and
established. R136 saved (researcher-136-owner-time-laundering.md): 17th
collapse; certificate route TERMINATES — with interval-local ownership
(GNR') IS aggregate-excess halving; monotone unitization lemma
established as a byproduct. Canonical upper target: (AE†) directly
(R138's prompt is the reference statement of it).

Derived observation (from R104 + R131's coupling analysis, curator-level
arithmetic, not yet round-doc'd): the relative entry statement "for
every OA witness h, entry at cap H_h with H_h log h = o(h)" is FALSE for
slowly growing witnesses h << r(n), since it would force H_h << r(n),
refuted by the fixed-cap theorem. So fortress entry can never refute
(OA) held with a sufficiently slow witness — the lower route genuinely
needs non-reservoir mechanisms or Omega(n) directly.

R137 LANDED AND SAVED (researcher-137-legal-divisor-depth-capture.md —
fixed-depth thinness lemma + randomized d^{-1/2} capture strategy; upper
route reduces to trajectory-restricted thinness at growing depth; both
pieces single-source, AUDIT BEFORE LOAD-BEARING USE).

Pending saves:
R138 LANDED AND SAVED (researcher-138-first-failure-localization.md —
3rd nondegeneracy confirmation; first-failure localization theorem;
4-property disproof checklist).
R139 LANDED AND SAVED (researcher-139-sparse-rank-sweep.md — o(n)
moves force legal-poset height < g(n); single-source, audit candidate).
R144 LANDED AND SAVED (researcher-144-cone-weighted-completion.md).
R148 LANDED AND SAVED (researcher-148-second-shell-cumulative-sparsity-still-open.md
— canonical-lift blocker lemma; coatom ownership => cumulative fixed-shell
minima sparse over o(n) prefixes; gap isolated to divisor-refinement
switching; no resolution either direction).
R140 LANDED AND SAVED (researcher-140-frozen-cone-harmful-mass.md —
frozen-cone accounting; randomization provably insufficient).
R142 LANDED AND SAVED (researcher-142-finite-shell-clearing.md — NEW
weakest sufficient target FSC(J,eta): fixed-shell fixed-density greedy
clearing; deep shells die by size). R143 LANDED AND SAVED
(verify-postresp-R143-thinness-capture-confirmed.md — CONFIRMS R137:
thinness VALID, capture VALID under aggregate reading; R137 machinery
now established with the two stated repairs).
R145 LANDED AND SAVED (researcher-145-fsc-top-shell-proven.md —
THEOREM: FSC(1,eta) proven for all 0<eta<1; 18th collapse eta>=1
vacuous; frontier = J=2 second shell; R147 auditing).
R146 LANDED AND SAVED (researcher-146-fsc2-second-shell-cap-entry-open.md
— monotone-degree lemma + sparse cap-entry theorem: any FSC(2,eta)
counterexample has an exact normal form (reach sparse capped-degree
position in o(n) turns, sustain a linear capped tail); doubling lemma:
cleared top shell forces (eta/8)n second-shell targets with explicit
blockers a_x=2d_x, but one blocker can certify Theta(n/d) targets so no
tau-capacity bound; FSC(2,eta) is EQUIVALENT to the new named statement
"second-shell capped-tail exclusion").
R147 LANDED AND SAVED (verify-postresp-R147-fsc-top-shell-confirmed.md
— FSC(1,eta) CONFIRMED: A VALID, B VALID, C quantifier repair only.
The top-shell theorem is ESTABLISHED machinery; treat as promoted).
R142 -> researcher-142-<slug>.md (kind standalone,
prompts/researcher-R142-solution-attempt-full-compilation.md).
Om's standing preference (2026-07-12 ~18:45): full-compilation
free-roams are historically the breakthrough generator — keep the
majority of slots on them; R140's prompt is the new free-roam base.

QUEUED (proposed to Om, awaiting his reply but authorized as research):
(1) empirical probe — measure the direct-ancestor lifetime-ownership
distribution in simulated games at finite n (does the O(1) bound look
true? the n=4000 example: multiplicity 128 vs instantaneous cap 48);
(2) cross-family check of the (AE†) crux via Gemini/Claude tabs
(within-family attractor risk: all concurrences are GPT-5.6).

## Decision rules in force (user-approved, standing)

- Fully autonomous e2e drive; goal = resolve the dichotomy; cap FIVE
  Pro threads; ALWAYS PushNotification per landed round.
- Om (2026-07-12 ~13:30): keep running, free slots toward FULL SOLUTION
  attempts; keep >= 1 free-roam running at all times; don't
  over-constrain prompts.
- ANY claimed full resolution: save (confidence low), push immediately,
  dispatch TWO fresh adversarial audits before believing.
- Om (2026-07-13 ~00:15): if close to a solution (e.g. FSC induction
  extending, or a claimed resolution entering audits) notify or even
  call; if the FSC route hits another obstruction/wall loop, send a
  notification and tell him. He is around and watching notis.
- LOW-CONTEXT PROTOCOL (curator context is the scarce resource):
  dispatch WITHOUT screenshots (JS-focus composer, osascript paste,
  DOM-verify chip, DOM-click send — see docs/chatgpt-backend-api.md);
  frontmatter drafting delegated to a Sonnet subagent that reads the
  harvest file in its own context; curator reviews the draft only.
- Promotion-grade claims (would shift state or be built upon): audit
  before load-bearing use — the audits keep winning; trust them.
- On refutation: round doc with failure_mechanism, then press the
  surviving repair path. Formulation defects are ROUNDS, not failures —
  save them; the collapse-family catalogue is the program's sharpest
  tool.
- NEVER feed Bloom's forum small-n table (f(11)=5 defect).
- PHONE CHANNEL (tested, Om answered): call [redacted] via Inkbox —
  recipe in memory `project-inkbox-phone-channel` (1Password "Hermes
  Inkbox API Key", X-API-Key, POST /api/v1/phone/place-call,
  origination shared_imessage_number, mode hosted_agent + reason).
  Authorized ANY hour for: full resolution surviving two audits, or a
  hard blocker. Routine landings = push only.

## Operational protocol (hard-won; memory `project-chatgpt-automation-protocol`)

- STATUS/HARVEST via ChatGPT backend-api (docs/chatgpt-backend-api.md):
  one javascript_tool call on any chatgpt.com tab checks ALL threads
  (/backend-api/conversation/<id>, token from /api/auth/session; the
  last assistant text node's `status`); CAVEAT: mid-run narration
  blurbs are also finished_successfully — distinguish by len (<300 =
  narration) and confirm real landings by a # Verdict head. Harvest =
  API text -> strip U+E200..U+E201 filecite spans -> click page once
  (focus) -> navigator.clipboard.writeText -> LANG=en_US.UTF-8 pbpaste
  (LANG on BOTH pbcopy and pbpaste or mojibake). Raw API text beats the
  copy button (which strips \[ \] backslashes).
- DISPATCH via UI paste: new thread chatgpt.com/?model=gpt-5-pro;
  composer at ~(790,363) on the new-chat page (window-size dependent —
  screenshot if unsure); the FIRST paste after navigation is ALWAYS
  swallowed — click composer, type "x", cmd+a, cmd+v, wait 5s, then
  click-composer + cmd+v AGAIN; verify exactly ONE chip; send at
  ~(1140,422). Delete duplicate chips via their X before sending.
- Save: frontmatter per CLAUDE.md (no status field; failure_mechanism
  on refutes/supersedes; no session jargon), body = verbatim harvested
  bytes, assembled via `cat frontmatter.yaml response.md > doc.md`.
  Recompile compile_rounds.py, commit per round (named files), push,
  PushNotification.
- Crons are SESSION-ONLY — the successor must RE-ARM BOTH: watcher
  (:11/:41 — API status check + harvest/save/refill loop) and hourly
  heartbeat (:53 — cron alive? unharvested threads? uncommitted docs?
  escalate per rules).
- Pro runs: 20–130 min typical; long compute runs (2-3h) show
  unchanged narration via API but are alive — verify visually (fresh
  tool-call lines) before worrying.

## Housekeeping

- ` M AGENTS.md` remains uncommitted BY DESIGN — a pre-session edit Om
  hasn't dispositioned (deletes a "Session Learnings" section about
  Codex-attachment extraction). Ask him or leave it.
- Scratchpad (session-specific, will vanish): all response bodies are
  duplicated inside committed round docs; nothing unrecoverable.
- Publication state: rank-three note PUBLIC on erdosproblems forum,
  commit-pinned 018a346. Nothing else published; nothing tonight is
  publication-ready without human review.

## Suggested first hour for the successor

1. Read this file + `git log --oneline -30` + regenerate/skim
   state_compiled.md.
2. Re-arm both crons.
3. One API status call on the four thread URLs above; harvest and save
   whatever landed (R126 and R129 are the likeliest to contain
   something big; apply the resolution protocol if any claims one).
4. Refill slots per decision rules. The live targets, in order of
   sharpness: (AE†); bounded-depth compression (first C*loglog H
   layers); trajectory-restricted online area; Theta-side non-reservoir
   mechanisms (untouched since R104's promotion — consider a dedicated
   dispatch).

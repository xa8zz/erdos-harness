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
| R125: full-solution attempt (sample 1) | chatgpt.com/c/6a53e22e-def4-83e8-9a4b-20b449fa5270 | RUNNING (post-peel process, early-layer gap) |
| R126: full-solution attempt (sample 2) | chatgpt.com/c/6a53e267-d7dc-83e8-8b83-6d1a6aa26eff | RUNNING (chronology-sensitive totient-energy bound — narration says it survives shared-core AND batching counterexamples; watch this one) |
| R127: full-solution attempt (sample 3) | chatgpt.com/c/6a53e2a5-ee24-83e8-a948-f79f1f4b55bd | RUNNING (global trajectory potential, frozen baseline + first surviving-minimum exposures) |
| R129: targeted (AE†) | chatgpt.com/c/6a53eb0d-0390-83e8-9f93-e75b880eabca | RUNNING (dispatched ~14:50) |

One slot spare (reserve for audits of whatever lands).

Pending saves: R125/126/127 -> researcher-125/126/127-<slug>.md (kind
standalone; prompts researcher-R125/126/127-solution-attempt.md — three
identical copies of the R121 post-formulation-war free-roam prompt);
R129 -> researcher-129-<slug>.md (prompts/researcher-R129-ae-dagger.md,
predecessor R128-aggregate-excess-parameter-witness).

## Decision rules in force (user-approved, standing)

- Fully autonomous e2e drive; goal = resolve the dichotomy; cap FIVE
  Pro threads; ALWAYS PushNotification per landed round.
- Om (2026-07-12 ~13:30): keep running, free slots toward FULL SOLUTION
  attempts; keep >= 1 free-roam running at all times; don't
  over-constrain prompts.
- ANY claimed full resolution: save (confidence low), push immediately,
  dispatch TWO fresh adversarial audits before believing.
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

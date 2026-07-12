# Handoff — moonshot session of 2026-07-11/12 (Fable-5 curator + GPT-5.6 Pro)

Operational handoff, REWRITTEN clean at the end of the audit-cascade phase.
All math state is in round docs R78–R97 + verify-postresp docs (committed)
and `state_compiled.md`; this file carries only session-operational state.

## Program status (end of night 2)

The full history R78–R97 is in the compiled state view. Net position:

- Unconditional bracket unchanged and PUBLIC (forum-posted):
  c_delta n(log log n)^2/log n <= L(n) <= (0.1897123371+o(1))n.
- FOUR claimed resolutions were made and refuted tonight, each with
  cross-convergent audits and small concrete counterexamples: R92
  (arbitrary-reply persistence; instantaneous->temporal promotion), raw
  (TL) (redundant re-witnessing), literal (OLCM) (anchor + trace-1,
  R97), R95 (L(n)=o(n) via first-witness; move-index trace collapse +
  player-quantifier reversal; verify-postresp-R95-audit-a/b.md).
- Audit-surviving toolbox: atomic ledger 2^r lifetime bound (residual
  channel only — ancestors escape), trace normal form + low-lcm energy
  lemma, canonical cube partition + first-death lemma, fresh-batch
  persistence (Prolonger-side ONLY), absorbing fortress, layer-peeling
  reduction, anchor construction + batch-blocker neutralization.
- THE SEPARATOR (all five threads converged): one chronology theorem.
  Sufficient for o(n): growing-depth uniformity of minimal layers
  (sum over j < log2 H of |M(A_j)| = o(n) along the sweep), or (OA), or
  a contemporaneous-area repair potential. Required for Theta(n):
  arbitrary-reply entry at FIXED cap H=O(1), or fortress amplification.
  The Shortener policy definition is load-bearing (literal max-degree is
  anchor-exploitable; batch blockers neutralize the exploit).

## In-flight (ChatGPT Pro, account "[redacted-name]"; cap raised to 5 by user)

Tab IDs are EPHEMERAL (the tab group was destroyed and recreated once
tonight — recreate with tabs_context_mcp createIfEmpty and reopen thread
URLs as needed). THREAD URLS are durable:

| What | Thread URL | Status |
|---|---|---|
| R124a: adversarial AUDIT of R123's activation-area impossibility theorem (primary: family-coverage attack — construct a nondegenerate intermediate OUTSIDE features (1)-(4)) | chatgpt.com/c/6a53dd16-33bc-83e8-98eb-793f6957b158 | RUNNING (dispatched ~13:00) |
| R124b: same audit, independent thread | chatgpt.com/c/6a53dd57-86f4-83e8-9b09-36f5ad3e7dba | RUNNING |

Landed+saved since last table: R123 (researcher-123-activation-area-
impossibility: THE FORMULATION LOOP TERMINUS — 14th collapse
(additive-floor chattering, repaired at 4X/h^2) then the
activation-area impossibility theorem: any nondegenerate pipeline-
sufficient serial-ticket statement is either starvation-degenerate or
IS trajectory-restricted online area; no weaker intermediate exists;
confidence LOW pending R124a/b), R121 (researcher-121: minimality does
not supply the n/H factor; 5th separator concurrence; its missing
global-multiplicity statement matches the online-area object — two
independent threads converged on (OA) as the true target the same
hour).

IF R123 SURVIVES both audits: the program's upper route has ONE
canonical target — trajectory-restricted online area (OA) — plus
bounded-depth compression (R116) as its (CL)-side complement; the
14-family collapse catalogue becomes permanent tooling. Next dispatch
then: direct (OA) attack with the full machinery.

NOTE: no free-roam currently running (both slots are the R124 audits;
R121 landed). Restore a free-roam when a slot frees, or Om may
redirect — he is awake.

Pending saves: R124a/b -> verify-postresp-R124a/b-<slug>.md
(prompts/audit-R124-impossibility-theorem.md, target
R123-activation-area-impossibility, confirms or refutes with
failure_mechanism).

STATUS/HARVEST now via ChatGPT backend-api (docs/chatgpt-backend-api.md):
one javascript_tool call checks ALL threads (status field, no
screenshots); harvest = API text -> navigator.clipboard (click page
first for focus) -> LANG=en_US.UTF-8 pbpaste. Raw API text is MORE
faithful than the copy button (which strips \\[ \\] backslashes and can
mojibake em-dashes). Strip U+E200..U+E201 filecite spans mechanically.
Dispatch still via UI paste protocol.

## Decision rules in force (user-approved)

- Fully autonomous e2e drive; goal = resolve the dichotomy; up to FIVE
  concurrent Pro threads; ALWAYS PushNotification per landed round.
- Trust-until-final-verification; audit ONLY promotion-grade claims.
- ANY claimed full resolution: save (confidence low), push immediately,
  dispatch TWO fresh adversarial audits before believing; cross-check
  sibling threads; audits get the claim verbatim + neutral key checks
  drawn from the current obstruction map.
- On refutation: round doc with failure_mechanism (specific
  counterexample boards), then press the surviving repair path.
- NEVER feed Bloom's forum small-n table (f(11)=5 defect).
- Slot allocation (user, 2026-07-12 overnight): allocate the 5 slots
  freely, but keep at least ONE free-roam full-solution thread running
  at all times; don't over-constrain researcher prompts — the models
  are capable, give them room.
- PHONE CHANNEL (tested working): call Om at [redacted] via Inkbox
  hosted-agent call — recipe in memory `project-inkbox-phone-channel`
  (1Password item "Hermes Inkbox API Key", X-API-Key header,
  POST /api/v1/phone/place-call, origination shared_imessage_number,
  mode hosted_agent + reason brief). Authorized ANY hour for: a full
  resolution that survived two adversarial audits, or a hard blocker
  (rate limit, auth wall). Routine landings stay push-only.

## Operational protocol (hard-won; details in memory
`project-chatgpt-automation-protocol`)

- Dispatch: save prompt to prompts/ and COMMIT BEFORE sending. New Pro
  thread: chatgpt.com/?model=gpt-5-pro, verify "Pro" chip. Paste: click
  composer; if paste is swallowed, type "x", cmd+a, cmd+v (forces real
  focus); >~10KB pastes become document chips (fine — delivered intact);
  check for DUPLICATE chips before sending (delete extras via X). If the
  model starts generating an IMAGE, stop it and send a text-only
  correction in-thread.
- Harvest (multi-response threads): NAVIGATE fresh to the thread URL
  (resets virtualization; page loads at last message, only its action
  row mounted), pbcopy sentinel, one neutral click + small scroll, click
  the copy button (coordinates from a screenshot of the visible action
  row), pbpaste and VERIFY head/tail against on-screen text; if sentinel
  unchanged click again. Stale find/read_page refs silently copy the
  WRONG message — never trust a ref across scrolls.
- Save: frontmatter per CLAUDE.md (no status field, failure_mechanism
  on refutes/supersedes), body = verbatim clipboard bytes. Recompile
  compile_rounds.py, commit per round, push notification.
- Crons are SESSION-ONLY; re-arm BOTH on session start: watcher
  (currently f92590d3, :11/:41 — API-based check/harvest loop) and
  hourly heartbeat (currently 5725c4fc, :53 — loop-health check:
  watcher alive? unharvested finished threads? uncommitted round docs?
  slots full? escalate via phone only per the rules above).

## Publication state

- Unconditional rank-three note PUBLIC on the erdosproblems forum,
  commit-pinned at 018a346. Finite-check script:
  codex-scripts/test-harness/erdos-872-safe-edge-potential/.

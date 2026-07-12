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
| R111: free-roam with both promoted refutations | chatgpt.com/c/6a5388d8-1c6c-83e8-9964-cb9b1a3f58d5 | RUNNING (~3h — visually verified ALIVE at 08:50: active tool calls, simulating small-n minimax and local game values on multiplier posets; long run is genuine computation) |
| R115: canonical nondegenerate (AH) — formulation delegated to researcher + resolution; R98/R113/R114 attached | chatgpt.com/c/6a53a4e1-ef84-83e8-93fe-aead2b90a30d | RUNNING (dispatched ~08:25) |
| R116: (CL) round 2 — compression persistence; R110 (with audit repair) + R113 attached | chatgpt.com/c/6a53ab6e-ec38-83e8-9c57-4784cd8af342 | RUNNING (dispatched ~08:55) |

Landed+saved since last table: R113 (verify-postresp-R113: REFUTES
R112's terminal-delay claim — literal (AH) back OPEN, quantifier-domain
failure_mechanism; R110 Thm1 REPAIRABLE with exact legality fix,
compression VALID; frozen-ledger repair list), R114 (researcher-114:
my (AH*) also degenerate — pre-freeze cap-forcing; repair = freeze at
common post-trapping baseline). The ancestor-harvest FORMULATION is
itself adversarial; R115 delegates it to the researcher with all failed
variants + repair list attached, requiring a nondegeneracy proof before
resolution.

Three running, TWO spare. Refill options after R111/R115 land: audits
of whatever they claim; a (CL)-side compression-persistence dispatch
(R110's battleground) once R110's repaired Thm 1 is re-audited if it
becomes load-bearing.

Pending saves: R111 -> researcher-111-<slug>.md
(prompts/researcher-R111-solution-attempt-post-promotions.md, kind
standalone); R115 -> researcher-115-<slug>.md
(prompts/researcher-R115-canonical-ancestor-harvest.md, predecessors
R113-audit-shadow-and-ah-claims + R114-frozen-ledger-preforce-degenerate);
R116 -> researcher-116-<slug>.md
(prompts/researcher-R116-compression-persistence.md, predecessors
R110-surviving-shadow-compression + R113-audit-shadow-and-ah-claims).

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

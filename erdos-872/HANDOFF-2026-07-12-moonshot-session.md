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
| R98: design Shortener policy + prove chronology theorem (o(n) side) | chatgpt.com/c/6a535e78-9ea4-83e8-99f1-c142b3e508a8 | running |
| R99: fixed-cap entry / amplification (Theta side) | chatgpt.com/c/6a535f06-63e8-83e8-99cc-d00a36117fe7 | landed+saved (researcher-99: CONDITIONAL diagonal amplification) |
| R100: zoom-out v2, full post-separator obstruction map | chatgpt.com/c/6a536053-7fd0-83e8-a42a-fb21cb8d2ae3 | landed+saved (researcher-100: continuation lemma \|L(A)\|<=(2H+1)\|C\|; confirms separator; upper route needs \|C\|=o(n/H)) |
| R101: growing-depth uniformity single-lemma (R96 body attached verbatim) | chatgpt.com/c/6a53609c-6210-83e8-824f-a0c4e7b0de17 | running |
| R102: free-roam solution attempt, dossier updated post-R100 | chatgpt.com/c/6a536ab1-b508-83e8-9934-d2a97fd55cdd | running (dispatched ~10:35) |
| R103: targeted (S) — post-peel completion size \|C\|=o(n/H), prove or refute | chatgpt.com/c/6a536bc2-670c-83e8-9db0-a52bc9b8a998 | running (dispatched ~10:42) |
| R104: targeted (F) — fixed-cap fortress entry, prove or refute | chatgpt.com/c/6a536c07-59d0-83e8-9a21-d4693e161fc6 | running (dispatched ~10:45) |

All five slots FULL. When one lands: harvest+save first, then refill —
keep >=1 free-roam running; hold a slot briefly only when a resolution
claim is pending audits.

Pending saves: R98 -> researcher-98-<slug>.md (prompt
prompts/researcher-R98-policy-chronology-theorem.md); R101 ->
researcher-101-<slug>.md (prompts/researcher-R101-growing-depth-uniformity.md,
predecessor R96-layer-peeling-chronological-separator); R102 ->
researcher-102-<slug>.md (prompts/researcher-R102-solution-attempt-post-r100.md,
kind standalone); R103 -> researcher-103-<slug>.md
(prompts/researcher-R103-postpeel-completion-size.md, predecessor
R100-continuation-lemma-gap-confirmation); R104 -> researcher-104-<slug>.md
(prompts/researcher-R104-fixed-cap-fortress-entry.md, predecessors
R97-anchor-trace1-olcm-false + R99-diagonal-amplification-conditional).

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

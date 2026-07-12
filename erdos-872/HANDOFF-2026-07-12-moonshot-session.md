# Handoff — moonshot session of 2026-07-11/12 (Fable-5 curator + GPT-5.6 Pro)

Operational handoff for the next curator agent. All math state is in round
docs R78–R92 (committed) and `state_compiled.md`; this file carries only the
session-operational state that would otherwise die with the session.

## Program status at handoff

The dichotomy (L(n) = Θ(n) vs o(n)) went through a reduction cascade tonight:

1. R78: fractional invariant ν(A); exact-only lemma; rank-r no-go.
2. R80: ν(A) = o(n) uniformly (LP route to Θ(n) closed); sparse covers;
   pointwise unbounded interdiction; boxed charging inequality (10).
3. R81: static sublinear completion; smooth/rough trapping sweep; t(t−1)
   cross-carrier regeneration.
4. R82+R84: (10) disproved twice independently.
5. R86: L(n)=o(n) exactly reduced to the online-area statement (OA) /
   ordered primorial persistence problem. Shell-stable PAIR charge proved.
6. R87: absorbing-fortress theorem (entry ⇒ permanence, V ≥ |E| + |Q|/H).
7. R83: Block Harvest Theorem (Ω(m²) actual moves per cross-product block).
8. R88: entry reduced to lift-exhaustion multiplicity (LE); TWO KEY
   QUALIFICATIONS: entry at growing H gives n^{1−o(1)} but NOT Θ(n)
   (needs H=O(1) or amplification); beating max-degree/minimal-legal play
   is not a bound against arbitrary play.
9. R89: entry race = evolving weighted blocker game; frozen cases all
   solved (product-escalating repair; covering-array coded repairs).
10. R90: refinement-forest necessary condition (any low-area persistence
    history needs ω(t) active minimal-root classes, ancestral sums o(X));
    naive carrier-to-area charge false (Ω(H) loss).
11. **R92 (UNAUDITED CLAIM, confidence low): arbitrary-reply persistence
    theorem at maximal-divisor scale** — temporal face capacity of one
    ordered spoiler ≤ C(r,⌊r/2⌋)·𝔗(n); scheduler robust vs every policy;
    L(n) ≫ n/𝔗(n)^{1+δ}. NOTE: numerically WEAKER than the existing
    rank-three bound (𝔗(n)^{1+δ} beats every power of log n); the value is
    killing the ordered-area o(n) route at divisor-width cap scales.

## In-flight at handoff (ChatGPT threads, user "[redacted-name]" Pro account)

Tab IDs die with the session — the THREAD URLS are durable. Re-open in the
in-Chrome browser (claude-in-chrome MCP), same account.

UPDATE 2026-07-12 (post-compaction session): audits A+B landed — BOTH REFUTE
R92 (same mechanism: instantaneous face bound (7) promoted to temporal (10),
double count (12); descendants inherit old spoilers, 2^r vs B_r; concrete
realizations on n=2310 and n=4000). Saved as verify-postresp-R92-audit-a/b.md.
R91 landed and saved (researcher-91-advance-depletion-low-lcm-reduction.md):
dichotomy reduced to one chronological low-lcm capacity inequality (TL).

UPDATE 2: R93 landed+saved (researcher-93-trace-rectangle-olcm-reduction.md —
low-lcm energy lemma; rectangle refutes raw multiplicity; OLCM). R94
landed+saved (researcher-94-atomic-ledger-ancestor-harvest.md — supersedes
R92: 2^r atomic-ledger repair; residual = ancestor-harvest inequality (AH)).
Four formulations of ONE remaining lemma: (TL) = OLCM = bounded-recourse =
(AH). R97 dispatched fresh on OLCM with the trace normal form.

| What | Thread URL | Status |
|---|---|---|
| R95 ((TL) attack, in R91's thread) | chatgpt.com/c/6a52db0e-b448-83e8-bef8-8bcb9137968b | running |
| R96 (fresh-thread zoom-out solution attempt) | chatgpt.com/c/6a534c6b-d280-83e8-afb5-3649140ac04d | running |
| R97 (OLCM single-lemma, fresh thread) | chatgpt.com/c/6a535093-b21c-83e8-9f8c-718ff4d22ea8 | running |
| R93's thread (idle) | chatgpt.com/c/6a52f794-6da0-83e8-a9bd-f059f252236e | landed+saved |
| R94/R92's thread (idle) | chatgpt.com/c/6a53160a-0630-83e8-b1a8-70de5c4e1d53 | landed+saved |
| Audit A thread (idle) | chatgpt.com/c/6a5341b3-e890-83e8-9912-f7cedf07ae62 | landed+saved |
| Audit B thread (idle) | chatgpt.com/c/6a5341ee-c48c-83e8-8e8b-17f87177681c | landed+saved |
| R90's thread (idle) | chatgpt.com/c/6a531643-f134-83e8-baa5-741d4d5316fa | landed |

Pending saves: R93 -> researcher-93-<slug>.md (prompt
prompts/followup-R93-ordered-multiplicity-final.md, predecessor R83);
R94 -> researcher-94-<slug>.md (prompt
prompts/followup-R94-historical-incidence-lemma.md, predecessor
R92-arbitrary-reply-persistence-claim, likely kind: extends or supersedes);
R95 -> researcher-95-<slug>.md (prompt
prompts/followup-R95-chronological-low-lcm-inequality.md, predecessor
R91-advance-depletion-low-lcm-reduction);
R96 -> researcher-96-<slug>.md (prompt
prompts/researcher-R96-solution-attempt-post-advance-depletion.md,
fresh-thread full-solution zoom-out, kind standalone unless it lands on a
prior round's exact statement). All four Pro slots now in use.

Pending saves when they finish: audits → `verify-postresp-R92-audit-a/b.md`
(type verification, action confirms/refutes R92-arbitrary-reply-persistence-claim,
prompt `prompts/audit-R92-persistence-adversarial.md`); R91 →
`researcher-91-<slug>.md` (prompt `prompts/followup-R91-ordered-multiplicity-final.md`,
predecessor R88); R93 → `researcher-93-<slug>.md` (prompt
`prompts/followup-R93-ordered-multiplicity-final.md`, predecessor R83).

## Decision rules in force (user-approved)

- User delegated e2e autonomous drive; goal = full solution; up to 4
  concurrent GPT-5 Pro threads; ALWAYS PushNotification per landed round.
- Trust-until-final-verification: save rounds unaudited (confidence low/medium);
  audit ONLY promotion-grade claims (see memory `feedback_audit_only_promotion_grade`).
- If both R92 audits agree sound → promote R92; sublinear side must then
  work below the divisor-width threshold; refill slots accordingly.
- If either audit breaks it → new refutation round doc with
  failure_mechanism from the audit; press the break.
- Any claimed full resolution (o(n) proof via (OA), or Θ(n) via H=O(1)
  persistence + amplification) → save, push immediately, 2 fresh
  adversarial audit tabs before believing; cross-check sibling threads.
- NEVER feed Bloom's forum small-n table (f(11)=5 defect); Brenner facts
  only, marked "[reported]".

## Operational protocol (hard-won; also in memory)

- Dispatch: compose prompt per templates, save to `erdos-872/prompts/`,
  commit BEFORE sending. Paste via `LANG=en_US.UTF-8 pbcopy < file`, click
  composer, cmd+v (first paste after page load often fails — click composer
  again and re-paste; verify a chip or text appears), send button.
- New Pro thread: `https://chatgpt.com/?model=gpt-5-pro`, verify "Pro" chip.
- Harvest: scroll thread to END (copy buttons are virtualized), click the
  LAST "Copy response" button TWICE with 1–2s waits, then
  `pbpaste > scratchpad/file` and VERIFY head/tail (stale clipboard is the
  #1 failure). Then round doc per CLAUDE.md, recompile, commit per round.
- File upload into ChatGPT is NOT possible from this harness (extension
  only allows session-attached files). Append context as in-message text.
- The watcher cron is SESSION-ONLY and died with the previous session.
  Re-arm on session start: recurring ~30min, screenshot each active tab,
  finished = no stop button, then the harvest/save/refill/push loop.

## Publication state

- The unconditional rank-three note is PUBLIC (posted to the erdosproblems
  forum by the user) with commit-pinned links at 018a346. Audit-recommended
  editorial fixes are already applied and pushed.
- If forum replies request the finite-check script, it lives under
  `codex-scripts/test-harness/erdos-872-safe-edge-potential/`.

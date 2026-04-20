# Transcript patterns — Erdős 872 research harness

**Source:** 489 short user messages (< 400 chars) extracted across 20 Claude Code sessions, 2026-04-16 through 2026-04-20.
**Raw data:** [`docs/short_user_messages.md`](short_user_messages.md)
**Purpose:** feed (a) the open-source harness skill library, and (b) Paper 2 §4 Techniques + §8 Author-non-expertise case study.

---

## 1. Repeated request patterns (→ candidate skills)

Counted across all sessions. Each is a pattern that recurred > 5 times and is a clear candidate for a reusable skill.

| Pattern | Frequency | Example | Skill name |
|---|---|---|---|
| "Write me a follow-up prompt to [Pro/DeepThink/Codex]" | 40+ | *"Wanna give me an audit prompt?"* | `write-followup-prompt` |
| "Write me an audit prompt for the informal verifiers" | 20+ | *"ya wanna right the informal audit prompt for me to send off"* | `write-audit-prompt` |
| "Update our docs / current_state / canonical prompt" | 30+ | *"update our canonical prompt with new things so far"* | `sync-research-state` |
| "Commit / push what we have" | 15+ | *"Yea can you commit first"* | `commit-round` |
| "Save the response via transcript" | 10+ | *"you should save the diff responses using transcript save as your claude.md says"* | `save-pasted-response` |
| "Help me zoom out / where are we / visualize progress" | 15+ | *"can you help me zoom out for a bit"* | `progress-zoom-out` |
| "Write me a Codex task for [computation / verification]" | 10+ | *"Yeah wanna make a codex task out of the computation stuff?"* | `write-codex-task` |
| "Self-update your CLAUDE.md with learnings before compaction" | 8+ | *"do u want to do a self-update pass to your claude.md"* | `pre-compact-capture` |

These are the right set to ship as initial skills in the `vibe-research` template. Each should be a small markdown file with activation trigger + instructions.

---

## 2. Operating preferences (already partially in CLAUDE.md; missing ones should land)

Surfaced repeatedly, some as corrections:

- **No "round N" / "phase N" / "program" / "we proved" / "Pro" / "Codex" / any session jargon in prompts sent to fresh threads.** They land in cold threads with zero context. *(2026-04-18T03:17)*
- **Grading line goes at the START of the researcher template**, not the end. *(2026-04-18T09:57)*
- **No suggestion area / no "potential directions"** — strict behavior instructions at top, math-only body, open question is one sentence. *("the suggestion area itself should be removed")* *(2026-04-20T07:26)*
- **Canonical prompt is deprecated** as of 2026-04-20T07:16 (*"we dont use canonical prompt anymore ignore it"*). Compose fresh each dispatch.
- **Save pasted content via transcript extraction**, don't retype. *(2026-04-19T01:09)* Already memorialized.
- **Commit every round**, not at milestones. *(inferred from commit frequency + "commit first" pattern)*
- **Use Aristotle for any new concrete private research finding** that could advance the problem. *(2026-04-17T06:40)* Already memorialized.
- **User dispatches prompts to external models**, Claude Code synthesizes only. *(pattern throughout — user never asks Claude to call Pro directly; always "give me the prompt")*
- **Be honest about progress** — user repeatedly rejects optimistic framings: *"you can be honest you don't have to make it sound better htan it is"* *(2026-04-17T20:25)*, *"I feel like you are being nice to me and trying to reframe progress"* *(2026-04-20T05:25)*.

---

## 3. Research-cadence patterns (for Paper 2 §4 Techniques)

Observable in the transcript:

1. **Parallel-dispatch cadence.** User routinely dispatches 3–9 simultaneous external threads (Pros × 2–3, DeepThink × 1–3, Codex × 1–3). Claude synthesizes in between. Peak: *"we have 9 sessions going"* (2026-04-19T02:55).
2. **A/B/C framing as search, not sampling.** User validates the methodology pattern: *"Let's do two prompts, each with just one direction suggestion and the rest what we know so far and context."* (2026-04-17T19:31).
3. **Wait-time utilization.** "Thinking" takes 30–60 min; user uses that window for audits, meta-work, synthesis. *("in the meantime, did u learn anything")*
4. **Converge-then-dispatch.** When multiple verifiers agree on a specific gap, user commits the full parallel dispatch to it.
5. **Codex as workspace-aware computation.** Used for: verification of empirical claims, simpler sub-proofs, stress tests. Distinct from Pro (open-ended reasoning).
6. **Commit-per-round discipline emerges from failure.** User asked multiple times *"have you been saving?"* — the discipline was learned mid-program, not upfront.
7. **Doc-sync cadence.** current_state, canonical prompt, process.md updated after rounds. User explicitly asks for this: *"yeah update our docs"* appears 30+ times.

---

## 4. Curator failure modes (for Paper 2 §5, novel contribution)

Empirical evidence of curator-side failure modes — useful for the paper because most AI-agent literature focuses on agent failures, not curator failures.

- **Transcript branching confusion**: *"it must be a new file path because i branched the ocnvo cuz i did a typo once"* — branched sessions create separate jsonl files; curator lost track.
- **Tab-state tracking**: *"Wait can u open the tab running the one we should close?"* — managing many external threads exceeds human working memory.
- **Memory of which-model-did-what**: *"which tab was running the compute one?"* — after several rounds, model-to-thread mapping is lost.
- **Delayed-save drift**: *"Have u been saving all result outputs?"* repeated in several sessions — the discipline of save-per-round was repeatedly slipped and caught.
- **Over-reliance on Claude's summaries**: user explicitly flags *"I feel like you are being nice to me and trying to reframe progress"* — curator catches the curator-agent's optimism but only after some time.
- **Doc-update slippage**: user corrects *"we're a bit behind i think because we've been getting new reports so quickly"* — sustained round-tempo outpaces sync.

These all belong in Paper 2's failure-mode taxonomy as **curator drift** subtypes, distinct from agent drift.

---

## 5. User voice and collaboration style

Notable for the harness paper's authorial-non-expertise framing:

- **Explicit non-expertise**: *"i know nothing about game theory or comibnatrics"*, *"i understand nothing about math research or how any of that works for context"*, *"explain to be as if im retarded and know nothing"*.
- **Meta-curiosity**: constant zoom-out requests, progress visualizations, 0–100 ratings on novelty + solution-closeness. Curator actively stress-tests claimed progress.
- **Informal voice**: contractions, typos, rapid-fire messages. Fine for an operational log; the paper and blog can match this voice deliberately.
- **Ambitious mode-switches**: occasional high-energy pushes (*"YOU THINK WE HAVE PUT UP ALL OF THIS EFFORT... NO! RAHHHHHHHHHH"*) that reset morale during refutation-heavy rounds.

---

## 6. Proposed skill files for `vibe-research`

Initial skills to ship with the template (files go in `skills/`):

1. `write-followup-prompt.md` — given last response + specific gap, produce a follow-up prompt in the researcher template.
2. `write-audit-prompt.md` — produce an informal-audit prompt given the prior prompt + response pair.
3. `sync-research-state.md` — re-read current_state.md + recent rounds, produce a targeted update diff.
4. `commit-round.md` — commit the current round's returns + prompts + audits with a properly-formatted message.
5. `save-pasted-response.md` — extract a user-pasted block from session jsonl and save it to the right research file.
6. `progress-zoom-out.md` — produce the zoomed-out synthesis (established / open / obstructions) on demand.
7. `write-codex-task.md` — produce a Codex task file with repo-workspace context.
8. `pre-compact-capture.md` — sweep recent session for anything not yet persisted (saves, commits, memory updates, doc syncs) before compaction.

Each skill should include: triggering pattern, input shape, output format, named gotchas from the transcript.

---

## 7. Patterns NOT to propagate into the open-source template

- Delayed commits / "I'll commit at the end" — repeatedly burned; should be a hard pre-compact / per-round rule.
- Ambiguous "round 6" / "Pro #2" references in dispatched prompts — fresh threads won't have context.
- Model-family-unaware parallelism — within-family attractor basins are a real failure mode; the template should encode cross-family verification as default.
- "Just trust Claude's summary" without spot-checks — the Haiku-vs-Sonnet synthesis discrepancy this session is empirical evidence for scepticism.

---

## 8. Medium-message pass (400–1200 chars, 92 messages across 17 sessions)

Medium messages contain substantive research decisions, pasted verifier outputs, and methodology corrections. Raw data at `docs/medium_user_messages.md`.

### 8.1 Methodology principles explicitly surfaced (most load-bearing)

- **Factual-completeness doctrine, stated explicitly by the user** (2026-04-18T10:57, 2026-04-18T21:57, 2026-04-19T01:19, 2026-04-19T02:11): *"fill the prompt with as much factual context as possible (factual, not meaning established)"* / *"no personal opinion in there, literally just what math we have on stuff"* / *"give them lots of data on what's been tried and failed, they might be able to notice some kind of pattern"*. This is the origin of the "canonical prompt methodology" as currently in CLAUDE.md — **it was developed across rounds, not known upfront.**
- **Pattern-across-failures as research signal** (2026-04-19T01:19): *"it prevents researchers from exploring in that direction. The key part is that they can sense patterns between all the reasons it didn't work out and try and synthesize something from it in a way that means you can't"*. Core to Paper 2.
- **"Brief" rejected in favor of factual detail** (2026-04-18T06:48): *"brief is actually the wrong word; I think it should just be canonical prompt, because I would prefer if the reasons why something didn't work didn't need to be brief"*. **Already in CLAUDE.md but this is the origin.**
- **Potential-Directions fully deprecated** (2026-04-19T01:19, reconfirmed 2026-04-20T07:26 short): *"we don't even need the open question or the potential direction section. Just at the very top, it is just telling it to solve whatever the remaining area is"*. **CLAUDE.md still has this section in the template and the "don't strip it" note — contradicts current practice.**
- **Do not frame as frontier research** (2026-04-19T02:35, novel observation): *"our Pro prompts are only reasoning for 10-25m instead of the normal 40m-hour. Is there something in our prompt causing them to not try or get overwhelmed? Any part of our prompt that suggests this is frontier research? LLMs may pattern match to that and then get scared off and not try as hard"*. **Not in CLAUDE.md. Add as explicit rule.**

### 8.2 Curator-to-agent morale management (novel for Paper 2)

The transcript contains multiple curator pep-talks to reluctant agents:
- 2026-04-18T02:11: *"YOU THINK WE HAVE PUT UP ALL OF THIS EFFORT INTO THIS PROGRAM, ADVANCING 33 YEARS OF DORMANT PROBLEM ACTIVITY INTO OUR OWN PRIVATE RESEARCH PUSH AND WE STOP NOW?! NO! RAHHHHHHHHHH. Me and you are GOING to solve this"*
- 2026-04-19T04:22, 04:26, 05:36: sustained "Do you want to try solving it?" dialogue where curator offers the agent Max reasoning, cites another Claude's "grind mode" success, asks whether the agent believes it can do it.
- Observed pattern: agents that hedged ("I'll be wrong about the math, that's structurally true") were re-engaged with specific counter-evidence ("one of the Claudes went into grind mode and their angle led to our most recent breakthrough").

This is an empirically observed collaboration pattern not documented in AI-agent literature. Belongs in Paper 2 §8 author-non-expertise as a new subsection on **agent morale management**.

### 8.3 Cross-agent coordination in the wild

- 2026-04-19T00:57: *"Another agent might've changed our claude.md or research docs and note n stuff. could you double check?"* — user actively manages CLAUDE.md coherence across concurrent Claude sessions working on the same repo.
- 2026-04-20T04:04 (short, 31c57276 session): *"We had 6 Pros just finish with a similar prompt, look at the other most recent transcript for this repo and look at the 6 msgs I just sent there (u dont need to save the docs, the other claude will)"* — inter-session handoff via transcript pointer.

Paper-worthy failure mode: **CLAUDE.md drift across concurrent sessions**. Not currently addressed in CLAUDE.md.

### 8.4 Direct Paper 2 quotes (user voice)

For Paper 2 "author non-expertise" section, load-bearing quotes:
- *"I know nothing about game theory or comibnatrics"* (2026-04-17T20:21, short)
- *"I understand nothing about math research or how any of that works for context"* (2026-04-19T00:09, short)
- *"explain to be as if im retarded and know nothing about math research community"* (2026-04-20T01:28, short)
- *"i literally have no idea what the fuck we proved or what the math even is. like i genuinely read any of the math in our repo and it looks like alien words to me"* (2026-04-20T10:05, medium)
- *"No one else in all of human history has made more progress in this specific problem. That sounds more significant than it is, but it's just that a small amount of people have tried this; we've made more progress than any of them. It's through the use of only AIs."* (2026-04-19T02:02, medium)

These are already public (forum thread + this repo) and usable with permission.

### 8.5 Agent self-reflection (useful for Paper 2 §7 capability assessment)

Pasted verbatim from researcher responses during the program:
- *"One more honest thing: I suspect the real answer — L(n)=o(n) — would come from a probabilistic or entropy-based argument that I'm not naturally reaching for. The Ruled Out list has mostly deterministic constructions."* (Pro self-report, via user paste 2026-04-19T02:45)
- *"if I were going to spend another week on this, that's where I'd point."* — Pro recommending a direction it won't pursue itself.

These are agent-self-reports of bias. Useful empirical evidence of what current reasoning models can and can't do.

### 8.6 Rule gaps in CLAUDE.md (identified from §8.1)

Three concrete updates proposed:

1. **Remove "Potential Directions" section from the researcher prompt template** (currently lines 764–772 of CLAUDE.md). Supersede the "don't strip it" note at line 790 with "default to omitting it."
2. **Clarify canonical-prompt doctrine**: the methodology (factual-completeness first) stays; the file-based `prompts/canonical-prompt.md` is deprecated. Update line 780.
3. **Add anti-frontier-research-framing rule**: in prompts, avoid language like "this is a 30-year-old open problem", "frontier research", "no one has solved this" — empirically LLMs pattern-match and truncate reasoning. Belongs under "Framing rules for the researcher prompt".

Optional 4th: add an "honest progress reporting" norm — don't reframe for morale. User caught this explicitly.

---

## 9. Next steps

1. Propose the three CLAUDE.md edits in §8.6 to the user; make on approval.
2. Feed §8.2, §8.3, §8.4, §8.5 directly into Paper 2 drafting.
3. (Optional) Long-message pass (>1200 chars) to capture user-pasted model outputs that are load-bearing for specific paper claims.

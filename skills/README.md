# Skills — vibe-research harness

Reusable Claude Code skills extracted from a 56-round multi-agent research program (Erdős Problem #872 case study). Each captures a recurring request pattern observed across 489 short user messages, surfaced via transcript mining.

## Skills

| Skill | Trigger pattern | Purpose |
|---|---|---|
| `write-followup-prompt` | "write me a follow-up", "give me the follow-up" | Produce a follow-up prompt to a researcher model |
| `write-audit-prompt` | "write me an audit prompt", "give me the audit" | Produce an informal-audit prompt for verifier tabs |
| `sync-research-state` | "update our docs", "sync current state" | Targeted diff update to the state doc |
| `commit-round` | "commit", "push", "commit first" | Commit a round's artifacts with proper scoping |
| `save-pasted-response` | User pastes content + asks to save | Extract from session jsonl byte-faithfully |
| `progress-zoom-out` | "help me zoom out", "where are we" | Honest synthesis of program status |
| `write-codex-task` | "write me a codex task", "draft a codex prompt" | Produce a Codex workspace task |
| `pre-compact-capture` | "im going to compact", "self-update" | Sweep for unpersisted state before compaction |

## Install

Copy into your project's `.claude/skills/` directory:

```bash
cp -r skills/* .claude/skills/
```

Or symlink the whole folder. Each skill file follows the Agent Skills standard (YAML frontmatter with `name` + `description`, markdown body).

## Provenance

These were extracted from actual long-horizon research-harness usage. Every trigger pattern, gotcha, and failure mode corresponds to an observed transcript event — not hypothetical usage. See `docs/transcript-patterns.md` in the parent repo for the empirical analysis.

## Conventions

- Keep each skill < 100 lines. They're cheat-sheets, not manuals.
- The `description` field in frontmatter drives invocation — be specific about triggers, not generic.
- Gotchas are load-bearing — every one was an observed failure during the source program.

## Customizing for your own domain

These skills are general enough to transfer to other long-horizon AI research loops (theorem discovery, mechanism design, empirical investigation). Expect to:

1. Swap `current_state.md` references for your domain's state file.
2. Replace Codex with whatever workspace-aware tool you use (Claude Code itself, Cursor Composer, etc.).
3. Adjust the "Pro" / "DeepThink" labels to your actual primary research model.
4. Keep the commit discipline + pre-compact sweep exactly as written.

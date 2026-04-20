---
name: onboard-personal
description: Interactive onboarding for a freshly cloned or forked copy of this harness. Introspects the repo, lists existing content, interviews the user on what to keep/remove/change, scaffolds new problem directories, optionally resets curator memory, and personalizes authorship. Run once after cloning or forking.
---

# Onboard personal fork

## When to use

User has just cloned or forked this harness and wants to set it up for their own work. They run `/onboard-personal` once, typically as their first action in a fresh clone.

## Purpose

Take a forked copy of the harness from "someone else's research log" to "your own workspace" without requiring the user to know which files are infrastructure vs which belong to the previous owner's work.

## Instructions

### Step 1 — Introspect

Run at repo root and gather:

```bash
ls -la
git log --oneline -10
git remote -v
```

Then classify what's present:

- **Infrastructure** (keep always): `CLAUDE.md`, `AGENTS.md`, `README.md`, `.mcp.json`, `chat-export/`, `scripts/`, `skills/`, `templates/`, `mcp-servers/`, `safari-llm/`, `docs/round-doc-schema.md`
- **Problem directories**: any top-level directory containing a `current_state.md`, a `prompts/` subdirectory, or matching `researcher-*.md` / `verify-*.md` files at its top level. Walk each, count the round docs, note date of last modification.
- **Non-problem user docs**: `docs/plans/*`, `docs/transcript-patterns.md`, `docs/short_user_messages.md`, `docs/medium_user_messages.md` — these are the previous owner's working docs, not infrastructure
- **Archive** (if it exists): `archive/` — contents are previously-onboarded problems already moved out of the way

### Step 2 — Present the inventory

Tell the user in a concise table:

- "Problem directories I found: `<name>` (N round docs, last touched YYYY-MM-DD), …"
- "Infrastructure: scripts/, skills/ (X skills), templates/, chat-export/, mcp-servers/"
- "Previous-owner docs I found in docs/: …"
- Recent commits: top 5 from git log

### Step 3 — Interview (one question at a time; wait for each answer)

1. **Your name / GitHub handle?** Used in `README.md` authorship block and (optionally) in the `git config user.name` for this repo.
2. **Affiliation?** (optional — university, company, or "independent")
3. **For each problem directory, what do you want to do?** Offer three actions per directory:
   - **Keep** — leave as-is. Good if you want to use it as reference or continue the previous owner's research.
   - **Archive** — `git mv <dir> archive/<dir>`. Keeps it in repo history but out of the main working area.
   - **Delete** — `git rm -r <dir>`. Removes entirely.
4. **Previous-owner docs in `docs/` (plans, transcript analyses)?** Keep / archive to `docs/archive/` / delete.
5. **Starting a new problem?** If yes, what's the slug (e.g., `collatz-experiments`, `erdos-NNN`, `my-problem`)? Creates `<slug>/` with a minimal scaffold.
6. **Reset curator memory?** Recommended for a fresh start. Wipes `~/.claude/projects/<repo-slug>/memory/*.md` so the curator agent doesn't carry context from the previous owner's sessions.
7. **MCP setup walkthrough?** If yes, open `.mcp.json`, explain each configured server, guide through any OAuth dances (alphaxiv) or API keys (Aristotle via `.env`).

### Step 4 — Execute (each destructive step gets a final confirm prompt)

For each question-4 answer:

- **Keep** → no action
- **Archive** → `mkdir -p archive/ && git mv <dir> archive/<dir>`
- **Delete** → confirm one more time, then `git rm -r <dir>`; if the problem directory has an untracked subdirectory (e.g., local worker memos), warn the user to review before deletion

For question-5 (new problem scaffold), create:

```
<slug>/
  current_state.md              # stub, one-line description
  prompts/                      # dispatch prompts go here
  .gitkeep (if empty)
```

With `current_state.md` starting as:

```markdown
# <Problem name>

One-line problem statement.

## What's Established

_none yet_

## What's Been Ruled Out

_none yet_

## Numerical / Computational Evidence

_none yet_

## The Open Question

<what you're trying to answer>
```

For question-6 (memory reset), confirm then:

```bash
# Find the repo's Claude Code memory directory
project_slug=$(echo "$PWD" | sed 's|/|-|g' | sed 's|^-||')
memory_dir="$HOME/.claude/projects/-$project_slug/memory"
ls -la "$memory_dir" 2>/dev/null
# With user confirm, move to backup (don't rm -rf):
mv "$memory_dir" "$memory_dir.backup-$(date +%Y%m%d)"
mkdir -p "$memory_dir"
```

For question-1 (personalization), rewrite the `README.md` author block with the user's name and affiliation. Do not touch the rest of the README.

### Step 5 — Commit the personalization

Stage only the files you changed (by name, never `-A`) and commit as:

```
Personalization: onboard <user-name> for <problem-slug or "general research">

- <action taken on previous-owner problems>
- <new problem scaffolded if any>
- <memory reset if any>
- README author block updated
```

### Step 6 — Next-steps summary

Tell the user:

1. Day-to-day loop: read `CLAUDE.md` for the operating manual, `skills/README.md` for the skill library index.
2. First dispatch: use `templates/` for prompt/round-doc scaffolds. The researcher prompt template is in `CLAUDE.md`'s "Researcher prompt template" section.
3. Saving returns: `scripts/add_round_doc.py` + `skills/add-round-doc.md` show how to extract pasted researcher outputs into round docs with front-matter.
4. Compile the state view: `scripts/compile_rounds.py --root <your-slug>/ --out <your-slug>/state_compiled.md`.

## Output

No output artifact beyond the personalization commit + whatever new problem scaffold was created. The interview + execution happens interactively.

## Gotchas

- **Every destructive action gets a final confirm prompt.** The user can change their mind at any step.
- **Memory reset is per-repo only** — don't wipe the user's other Claude Code project memories.
- **Don't touch the `skills/`, `scripts/`, `templates/`, `chat-export/`, `docs/round-doc-schema.md`** — these are infrastructure. Touching them means they've diverged from upstream; users who want to update the harness later will have merge conflicts.
- **Preserve `archive/`** as a first-class citizen — users may want to reactivate archived problems later.
- **Commit separately from any substantive work.** The personalization commit should be the user's first commit on their fork, making it clean to rebase or squash if they later want to contribute changes back.
- **If the user has multiple problems to process, handle them one at a time.** Don't batch — some may require a confirmation the user wants to reconsider.
- **Do not change `.gitignore` or `.mcp.json`** during onboarding unless the user explicitly asks. These are often customized per-fork in non-trivial ways.

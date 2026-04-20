---
name: commit-round
description: Commit a research round's artifacts (responses, audits, prompts, verification results) with a round-scoped message. Use when the user says "commit", "commit what we have", "push them", "commit first".
---

# Commit round

## When to use

User wants the current round's files committed before moving on. Often requested mid-session to guard against loss.

## Purpose

Git is the durability layer. Saved-but-uncommitted files are just as lost as non-existent ones if the session crashes, the machine reboots, or a filesystem issue hits. Per-round commits are pointers — the full synthesis happens elsewhere.

## Instructions

1. Run `git status` (no `-uall` — can cause memory issues on large repos).
2. Run `git diff --stat` to see scope.
3. Identify this round's files: `researcher-*.md`, `verify-*.md`, `followup-*.md`, prompts under `prompts/`, any tarballs under `aristotle/`, any doc updates to `current_state.md` / canonical prompt / process.md.
4. `git add` each file by name. Never `git add -A` or `git add .` (sweeps credentials, scratch files, unrelated changes).
5. Commit with a descriptive message naming: the round number, the kind of content (return / prompt / audit / sync), and the headline result. Examples:
   - `R53 Pro #1 return: CR-NCAD refuted via cooperative embedding`
   - `R55 prompt: hidden-packet formulation reduction`
   - `R56 sync: current_state.md updated with τ_SF refutation`
6. Use a HEREDOC for the commit message to preserve formatting.
7. Run `git status` after to verify clean.
8. **Do not push to remote unless user explicitly asks.**

## Output

Bash tool calls for `add` + `commit` + post-commit `status` verification.

## Gotchas

- **Never `git add -A` or `git add .`** — risks committing `.env`, `__pycache__`, Codex worktree artifacts, secrets.
- **Never `--amend`** on published commits. Create a new commit instead.
- **Never `--no-verify` / `--no-gpg-sign`** unless explicitly requested.
- **Per-round, not per-milestone.** Multi-round batch commits ("R49-R53 backlog") signal cadence slippage.
- **Pre-commit hook failures** → fix the issue and create a new commit. Don't amend — the prior commit didn't happen.
- **Codex worktree files** (in `.codex/worktrees/<hash>/`) are separate — copy back to main before committing if you want them in the main history.

---
name: save-pasted-response
description: Extract user-pasted content from the current Claude Code session jsonl and save it to a target file byte-faithfully. Use whenever the user pastes multi-paragraph content and asks to save it — any length, no threshold.
---

# Save pasted response

## When to use

User has pasted content (multi-paragraph) and asks to save it to a file. Applies at any length — the rule is not "long pastes only."

## Purpose

Byte-faithful persistence. Retyping via Write risks silent rewording, burns output tokens, and scales badly.

## Instructions

Run a short Python script via `python3 -c` or save to `/tmp/`. The pattern:

```python
import json, re
from pathlib import Path

# 1. Find the current session jsonl — always use mtime since branched
#    conversations create new session files.
project_dir = Path.home() / ".claude/projects/<project-slug>"
session_file = max(project_dir.glob("*.jsonl"), key=lambda p: p.stat().st_mtime)

# 2. Scan for the user-pasted content using a short unique marker phrase
#    that you can see in the paste.
marker = "Here is the construction"

matches = []
for line in session_file.read_text().splitlines():
    try:
        entry = json.loads(line)
    except json.JSONDecodeError:
        continue
    if entry.get("type") != "user":
        continue
    content = entry.get("message", {}).get("content", "")
    if isinstance(content, list):  # some entries wrap content in typed blocks
        content = "".join(
            b.get("text", "") for b in content
            if isinstance(b, dict) and b.get("type") == "text"
        )
    if marker in content:
        matches.append(content)

raw = matches[-1]  # most recent match

# 3. If the user labeled multiple blocks (#1, #2, ...), split on those labels.
blocks = re.split(r"(?m)^#\d+\s*$", raw)

# 4. Before writing, sanity-check the label → block mapping by printing the
#    first ~100 chars of each split.
for i, b in enumerate(blocks):
    print(f"[block {i}]: {b.strip()[:100]}")

Path("path/to/target.md").write_text(blocks[1].strip() + "\n")
```

Replace `<project-slug>` with the current project's slug (Claude Code uses the working-dir-path-with-slashes-replaced-by-hyphens).

## Fallback

If extraction fails outright (wrong slug, content not flushed yet, malformed entries), ask the user to `pbpaste > filename.md` from their clipboard. Zero curator cost, still byte-faithful.

## Gotchas

- **Always `max(..., key=mtime)`** — branched sessions (edit + resend) create new jsonls. Don't cache a session path from earlier in the session.
- **Content may not be flushed** for a few seconds after the paste. If `matches` is empty, wait briefly and re-glob.
- **List-wrapped content** — `message.content` is sometimes a list of `{type, text}` blocks. Handle both shapes.
- **Verify block → filename map** before writing. Print `blocks[i][:100]` and confirm the opening matches the expected label. Wrong filenames are silent.
- **Never retype via Write from your context.** That's what this skill exists to avoid.

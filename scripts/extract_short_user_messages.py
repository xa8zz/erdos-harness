#!/usr/bin/env python3
"""Extract user messages from Claude Code transcripts, filtered by length.

The jsonl files at ~/.claude/projects/-Users-omisverycool-erdos-harness/ contain
full session transcripts. This script filters to *interactive* user messages
(not tool results, not system reminders, not interrupted-by-hook messages) and
keeps only those within a [min, max] character range.

- Short (< 400): terse feedback, corrections, dispatch requests.
- Medium (400-1200): substantive decisions, multi-part questions, pasted thoughts.
- Long (> 1200): usually pasted model responses or deep context dumps.

Usage:
    scripts/extract_short_user_messages.py                    # 0-400 (short)
    scripts/extract_short_user_messages.py 400 1200           # medium band
    scripts/extract_short_user_messages.py 0 99999            # everything
"""
from __future__ import annotations
import json
import sys
from pathlib import Path

PROJECT_DIR = Path.home() / ".claude/projects/-Users-omisverycool-erdos-harness"
DEFAULT_MIN_CHARS = 0
DEFAULT_MAX_CHARS = 400
DOCS_DIR = Path(__file__).parent.parent / "docs"


def content_text(entry: dict) -> str | None:
    msg = entry.get("message", {})
    content = msg.get("content", "")
    if isinstance(content, str):
        return content
    if isinstance(content, list):
        # If any block is a tool_result, treat entry as tool-result, skip.
        for b in content:
            if isinstance(b, dict) and b.get("type") == "tool_result":
                return None
        parts = [
            b.get("text", "")
            for b in content
            if isinstance(b, dict) and b.get("type") == "text"
        ]
        return "\n".join(parts)
    return None


def is_interactive_user_text(entry: dict, text: str) -> bool:
    if entry.get("type") != "user":
        return False
    if entry.get("message", {}).get("role") != "user":
        return False
    if text is None:
        return False
    s = text.strip()
    if not s:
        return False
    # Skip harness-injected wrappers
    if s.startswith("<") and ">" in s[:50]:
        return False
    if "<system-reminder>" in s[:200]:
        return False
    if "<command-name>" in s[:200]:
        return False
    if s.startswith("<local-command-stdout>"):
        return False
    # Skip interrupt notices
    if s.startswith("[Request interrupted"):
        return False
    return True


def _out_path_for(min_chars: int, max_chars: int) -> Path:
    if min_chars == 0 and max_chars <= 500:
        name = "short_user_messages.md"
    elif min_chars >= 400 and max_chars <= 1500:
        name = "medium_user_messages.md"
    elif min_chars >= 1200:
        name = "long_user_messages.md"
    else:
        name = f"user_messages_{min_chars}_{max_chars}.md"
    return DOCS_DIR / name


def run(min_chars: int, max_chars: int) -> None:
    if not PROJECT_DIR.exists():
        print(f"no session dir at {PROJECT_DIR}", file=sys.stderr)
        sys.exit(1)
    sessions = sorted(PROJECT_DIR.glob("*.jsonl"), key=lambda p: p.stat().st_mtime)
    total = 0
    total_sessions_with_content = 0
    out_path = _out_path_for(min_chars, max_chars)
    out_path.parent.mkdir(parents=True, exist_ok=True)
    with out_path.open("w") as out:
        out.write(f"# User messages ({min_chars}\u2013{max_chars} chars)\n\n")
        out.write(
            f"_Extracted from {len(sessions)} sessions at "
            f"`~/.claude/projects/-Users-omisverycool-erdos-harness/`._\n\n"
        )
        for session_path in sessions:
            msgs: list[tuple[str, str]] = []
            try:
                raw = session_path.read_text(errors="ignore")
            except Exception:
                continue
            for line in raw.splitlines():
                try:
                    entry = json.loads(line)
                except json.JSONDecodeError:
                    continue
                text = content_text(entry)
                if text is None:
                    continue
                if not is_interactive_user_text(entry, text):
                    continue
                s = text.strip()
                if not (min_chars <= len(s) <= max_chars):
                    continue
                ts = entry.get("timestamp", "")
                msgs.append((ts, s))
            if not msgs:
                continue
            total_sessions_with_content += 1
            out.write(f"## `{session_path.name}` ({len(msgs)} messages)\n\n")
            for ts, s in msgs:
                # For medium/long bands, preserve newlines via blockquote.
                if max_chars > 500:
                    body = "\n".join(f"  > {line}" for line in s.splitlines())
                    out.write(f"- `{ts}` ({len(s)} chars):\n{body}\n\n")
                else:
                    single = s.replace("\n", " \\ ")
                    out.write(f"- `{ts}` \u2014 {single}\n")
            out.write("\n")
            total += len(msgs)
    print(
        f"Wrote {total} user messages from "
        f"{total_sessions_with_content}/{len(sessions)} sessions \u2192 {out_path}"
    )


if __name__ == "__main__":
    if len(sys.argv) == 1:
        min_chars, max_chars = DEFAULT_MIN_CHARS, DEFAULT_MAX_CHARS
    elif len(sys.argv) == 2:
        min_chars, max_chars = DEFAULT_MIN_CHARS, int(sys.argv[1])
    elif len(sys.argv) >= 3:
        min_chars, max_chars = int(sys.argv[1]), int(sys.argv[2])
    run(min_chars, max_chars)

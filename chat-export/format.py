#!/usr/bin/env python3
"""Turn an extractor's JSON result into a markdown file.

Reads the JSON envelope emitted by `agent-browser eval --json` on stdin
(i.e. `{"success":true,"data":{"origin":..., "result": <extractor output>}}`)
and writes markdown to stdout.
"""
import json
import re
import sys


def format_chat(r: dict) -> str:
    out = []
    title = r.get("title") or "(untitled)"
    out.append(f"# {r['provider']}: {title}")
    out.append("")
    out.append(f"**URL:** {r['url']}")
    out.append(f"**Messages:** {len(r['messages'])}")
    out.append("")
    out.append("---")
    out.append("")
    for i, m in enumerate(r["messages"], 1):
        out.append(f"## [{i}] {m['role'].upper()}")
        out.append("")
        out.append((m["text"] or "").strip())
        out.append("")
        out.append("---")
        out.append("")
    return re.sub(r"\n{3,}", "\n\n", "\n".join(out))


def format_erdosproblems(r: dict) -> str:
    """Parse a scraped erdosproblems forum/problem page into structured markdown."""
    src = r["text"]

    problem_start = src.find("Consider")
    # Fallback: many problem pages start with something else. Look for the
    # "#<num>:" citation marker instead.
    if problem_start == -1:
        m = re.search(r"#\d+:", src)
        problem_start = m.start() if m else 0

    # Find status marker (OPEN / SOLVED / DISPROVED) above the statement.
    status = ""
    head = src[:problem_start]
    m = re.search(r"\b(OPEN|SOLVED|DISPROVED)\b", head)
    if m:
        status = m.group(1)
        # Grab the follow-up sentence if present.
        tail = head[m.end():].strip().splitlines()
        if tail and tail[0].strip():
            status += " — " + tail[0].strip()

    # Split problem block from comments block.
    body = src[problem_start:]
    comments_marker = re.search(r"newest first\.[^\n]*\n", body)
    if comments_marker:
        problem_block = body[: comments_marker.start()]
        comments_block = body[comments_marker.end():]
    else:
        # No comments on this page.
        problem_block = body
        comments_block = ""

    # Trim end-of-page chrome from the problem block.
    for stop in ("External data from the database", "Formalised statement?",
                 re.compile(r"\d+ comments on this problem")):
        if isinstance(stop, str):
            if stop in problem_block:
                problem_block = problem_block[: problem_block.index(stop)]
        else:
            m2 = stop.search(problem_block)
            if m2:
                problem_block = problem_block[: m2.start()]
    problem_block = problem_block.strip()

    # Strip inline reply/edit chrome from comments section.
    comments_block = re.sub(r"\n(Post reply|Cancel|Preview:)\n", "\n", comments_block)
    tail_stop = "All comments are the responsibility of the user"
    if tail_stop in comments_block:
        comments_block = comments_block[: comments_block.index(tail_stop)]

    # Parse individual comments by locating the author/timestamp pattern.
    pattern = re.compile(
        r"([A-Za-z][\w_ ]*?)\s*\n+—\s*([\d:]+\s+on\s+\d{1,2}\s+\w{3}\s+\d{4})"
    )
    chrome_line_patterns = [
        re.compile(r"^\s*\|\s*(Edit|Delete|Reply)?\s*$"),
        re.compile(r"^\s*(Edit|Delete|Reply)\s*$"),
        re.compile(r"^\s*[👍📝🤖]\s*$"),
        re.compile(r"^\s*\d+\s*$"),
        re.compile(r"^\s*(Post reply|Cancel|Preview:)\s*$"),
    ]
    matches = list(pattern.finditer(comments_block))
    comments = []
    prev_end = 0
    for m in matches:
        raw = comments_block[prev_end: m.start()]
        kept = [ln for ln in raw.splitlines()
                if not any(p.match(ln) for p in chrome_line_patterns)]
        text = re.sub(r"\n{3,}", "\n\n", "\n".join(kept).strip())
        comments.append({
            "author": m.group(1).strip(),
            "ts": m.group(2).strip(),
            "text": text,
        })
        prev_end = m.end()

    # Assemble markdown.
    out = []
    out.append(f"# {r.get('title') or 'erdosproblems page'}")
    out.append("")
    out.append(f"**URL:** {r['url']}")
    if status:
        out.append(f"**Status:** {status}")
    out.append("")
    out.append("## Problem Statement & Background")
    out.append("")
    out.append(problem_block)
    out.append("")
    if comments:
        out.append(f"## Comments ({len(comments)})")
        out.append("")
        for c in comments:
            out.append(f"### {c['author']} — {c['ts']}")
            out.append("")
            out.append(c["text"])
            out.append("")
    return re.sub(r"\n{3,}", "\n\n", "\n".join(out))


def main() -> None:
    payload = json.load(sys.stdin)
    if not payload.get("success"):
        sys.stderr.write(f"Extractor failure: {payload}\n")
        sys.exit(1)
    r = payload["data"]["result"]
    if "messages" in r:
        sys.stdout.write(format_chat(r))
    elif "text" in r:
        sys.stdout.write(format_erdosproblems(r))
    else:
        sys.stderr.write(f"Unknown extractor output shape: keys={list(r)}\n")
        sys.exit(2)


if __name__ == "__main__":
    main()

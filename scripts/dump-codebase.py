#!/usr/bin/env python3
"""Dump a curated subset of the repo into a single flat file.

Output format:

    ===CODEBASE_DUMP_FILE:relative/path===
    <contents>
    ===CODEBASE_DUMP_ENDFILE===

The reconstruct script parses this back into a file tree.
"""
from __future__ import annotations

import fnmatch
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent

# Generous includes. We let the model browse what it wants.
INCLUDE_GLOBS = [
    # Top-level repo context
    "AGENTS.md",
    "CLAUDE.md",
    "README.md",
    ".mcp.json",
    # Paper source + all planning / status / review docs in paper/
    "erdos-872/paper/**/*",
    # Top-level research narrative and notes
    "erdos-872/*.md",
    # Lean formalization sources (.lean + lakefile + toolchain; no build outputs)
    "erdos-872/lean/**/*.lean",
    "erdos-872/lean/**/lakefile.toml",
    "erdos-872/lean/**/lean-toolchain",
    # Aristotle-formalized TeX sources (short, cite-able)
    "erdos-872/aristotle/**/*.tex",
    "erdos-872/aristotle/**/ARISTOTLE_SUMMARY.md",
    "erdos-872/aristotle/**/README.md",
    "erdos-872/lean/**/ARISTOTLE_SUMMARY.md",
    "erdos-872/lean/**/README.md",
]

# Everything explicitly out-of-scope for a paper-shape review.
EXCLUDE_GLOBS = [
    # Phase exploratory code / data
    "erdos-872/phase*/**",
    # Raw prompts (we wrote those; not primary content)
    "erdos-872/prompts/**",
    # Deep audit chains — too granular for shape review
    "erdos-872/verify-postresp-**",
    "erdos-872/verify-open-**",
    "erdos-872/verify-aristotle-**",
    "erdos-872/verify-codex-**",
    "erdos-872/verify-strategic-**",
    "erdos-872/verify-researcher-**",
    "erdos-872/verify-R*",
    # Raw chat dumps
    "erdos-872/chat-export/**",
    "erdos-872/chatgpt.md",
    "erdos-872/claude-chat.md",
    "erdos-872/gemini.md",
    "erdos-872/_forum_transcript.md",
    # Harness infra
    "scripts/**",
    "safari-llm/**",
    "mcp-servers/**",
    # Build artifacts / binaries
    "**/*.pdf",
    "**/*.tar.gz",
    "**/*.png",
    "**/*.jpg",
    "**/*.jpeg",
    "**/*.log",
    "**/*.aux",
    "**/*.out",
    "**/*.bbl",
    "**/*.blg",
    "**/*.fdb_latexmk",
    "**/*.fls",
    "**/*.synctex.gz",
    "**/*.pyc",
    "**/*.csv",
    # Lean build outputs
    "**/.lake/**",
    "**/*.olean",
    "**/lake-manifest.json",
    # Git internals
    ".git/**",
    # Review artifacts produced locally
    "erdos-872/paper/main.blg",
]


def collect() -> list[Path]:
    seen: set[Path] = set()
    for pattern in INCLUDE_GLOBS:
        for p in ROOT.glob(pattern):
            if p.is_file():
                seen.add(p)
    result = []
    for p in seen:
        rel = str(p.relative_to(ROOT))
        if any(fnmatch.fnmatch(rel, e) for e in EXCLUDE_GLOBS):
            continue
        result.append(p)
    return sorted(result)


def main() -> None:
    files = collect()
    out_path = ROOT / "codebase-dump.txt"

    total_bytes = 0
    skipped_binary = 0
    with out_path.open("w", encoding="utf-8") as f:
        # Tree index
        f.write("===CODEBASE_DUMP_HEADER===\n")
        f.write(f"repo_root: {ROOT.name}\n")
        f.write(f"file_count: {len(files)}\n")
        f.write("file_list:\n")
        for p in files:
            f.write(f"  - {p.relative_to(ROOT)}\n")
        f.write("===CODEBASE_DUMP_ENDHEADER===\n\n")

        for p in files:
            rel = p.relative_to(ROOT)
            try:
                content = p.read_text(encoding="utf-8")
            except (UnicodeDecodeError, OSError):
                skipped_binary += 1
                continue
            total_bytes += len(content)
            f.write(f"===CODEBASE_DUMP_FILE:{rel}===\n")
            f.write(content)
            if not content.endswith("\n"):
                f.write("\n")
            f.write("===CODEBASE_DUMP_ENDFILE===\n\n")

    print(f"wrote {out_path}")
    print(f"files:  {len(files)}")
    print(f"skipped (binary): {skipped_binary}")
    print(f"bytes:  {total_bytes:,}")
    print(f"size:   {out_path.stat().st_size:,}")


if __name__ == "__main__":
    main()

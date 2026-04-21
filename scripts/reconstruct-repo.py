#!/usr/bin/env python3
"""Reconstruct a repo file tree from a codebase-dump.txt produced by
scripts/dump-codebase.py.

Usage:
    python3 reconstruct-repo.py <dump_file> <output_dir>

The output directory is created if missing. Files are written with their
original relative paths; parent directories are created automatically.
"""
from __future__ import annotations

import sys
from pathlib import Path

FILE_MARK = "===CODEBASE_DUMP_FILE:"
END_MARK = "===CODEBASE_DUMP_ENDFILE==="


def reconstruct(dump_path: Path, out_dir: Path) -> int:
    out_dir.mkdir(parents=True, exist_ok=True)
    text = dump_path.read_text(encoding="utf-8")
    lines = text.splitlines(keepends=True)

    count = 0
    i = 0
    while i < len(lines):
        line = lines[i]
        if line.startswith(FILE_MARK) and line.rstrip().endswith("==="):
            rel = line[len(FILE_MARK):].rstrip("=\n").rstrip("=")
            body: list[str] = []
            i += 1
            while i < len(lines) and lines[i].rstrip() != END_MARK:
                body.append(lines[i])
                i += 1
            target = out_dir / rel
            target.parent.mkdir(parents=True, exist_ok=True)
            target.write_text("".join(body), encoding="utf-8")
            count += 1
        i += 1
    return count


def main() -> None:
    if len(sys.argv) != 3:
        print("usage: reconstruct-repo.py <dump_file> <output_dir>", file=sys.stderr)
        sys.exit(1)
    dump_path = Path(sys.argv[1])
    out_dir = Path(sys.argv[2])
    n = reconstruct(dump_path, out_dir)
    print(f"reconstructed {n} files into {out_dir}")


if __name__ == "__main__":
    main()

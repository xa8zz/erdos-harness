#!/usr/bin/env bash
# Usage: ./export.sh <tab-id> [out.md]
#   <tab-id>: agent-browser tab id like "t9" (run `agent-browser tab list`).
#   [out.md]: optional output path. Defaults to ./<provider>-<timestamp>.md
#
# Auto-detects the site from the tab's URL and runs the matching extractor.
set -euo pipefail

if [ $# -lt 1 ]; then
  echo "usage: $0 <tab-id> [out.md]" >&2
  exit 1
fi

TAB="$1"
OUT="${2:-}"
HERE="$(cd "$(dirname "$0")" && pwd)"

# Switch tab and read URL atomically to avoid drift.
agent-browser tab "$TAB" >/dev/null
URL="$(agent-browser get url 2>/dev/null | tr -d '\n' | tr -d '\r')"

case "$URL" in
  *chatgpt.com*)          PROVIDER=chatgpt ;;
  *claude.ai*)            PROVIDER=claude ;;
  *gemini.google.com*)    PROVIDER=gemini ;;
  *erdosproblems.com*)    PROVIDER=erdosproblems ;;
  *)
    echo "error: unsupported URL: $URL" >&2
    echo "supported: chatgpt.com, claude.ai, gemini.google.com, erdosproblems.com" >&2
    exit 2
    ;;
esac

EXTRACTOR="$HERE/extractors/$PROVIDER.js"
SHARED="$HERE/extractors/_shared.js"
[ -f "$EXTRACTOR" ] || { echo "missing: $EXTRACTOR" >&2; exit 3; }

# Prime window.__chatExport helpers, then run the site extractor.
agent-browser eval "$(cat "$SHARED")" >/dev/null

if [ -z "$OUT" ]; then
  OUT="./${PROVIDER}-$(date +%Y%m%d-%H%M%S).md"
fi

agent-browser eval "$(cat "$EXTRACTOR")" --json \
  | /usr/bin/python3 "$HERE/format.py" \
  > "$OUT"

echo "wrote: $OUT ($(wc -l < "$OUT") lines, $(wc -c < "$OUT") bytes)"

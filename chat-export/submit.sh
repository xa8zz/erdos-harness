#!/usr/bin/env bash
# Usage: ./submit.sh <tab-id> <file.md>
#
# Loads <file.md> into the prompt box of the specified chat tab and clicks Send.
# Works on chatgpt.com, claude.ai, gemini.google.com.
#
# Key insight (learned 2026-04-17): `document.execCommand('insertText', ...)`
# works on ChatGPT's ProseMirror editor but fails on:
#   - Claude's Tiptap (raced / truncated; sometimes only a stray character landed)
#   - Gemini's Quill editor (.ql-editor, truncated at ~343 chars on long input)
# The universal-working approach is to find the textbox by its accessibility
# ref from `agent-browser snapshot -i` and use `agent-browser fill @<ref>`,
# which handles all three editors correctly.

set -euo pipefail

if [ $# -lt 2 ]; then
  echo "usage: $0 <tab-id> <file.md>" >&2
  exit 1
fi

TAB="$1"
FILE="$2"
[ -f "$FILE" ] || { echo "missing file: $FILE" >&2; exit 2; }

# Switch tab and detect provider from URL.
agent-browser tab "$TAB" >/dev/null
URL="$(agent-browser get url 2>/dev/null | tr -d '\n\r')"

# Per-provider: label used to (a) disambiguate the input textbox in the
# snapshot, (b) locate the send button by aria-label after the fill.
case "$URL" in
  *chatgpt.com*)
    INPUT_LABEL_RE='Chat with ChatGPT|Ask'
    SEND_LABEL='Send prompt'
    PROVIDER=chatgpt
    ;;
  *claude.ai*)
    INPUT_LABEL_RE='Write your prompt to Claude'
    SEND_LABEL='Send message'
    PROVIDER=claude
    ;;
  *gemini.google.com*)
    INPUT_LABEL_RE='Enter a prompt for Gemini'
    SEND_LABEL='Send message'
    PROVIDER=gemini
    ;;
  *)
    echo "error: unsupported URL: $URL" >&2
    exit 3
    ;;
esac

# Accessibility snapshot → find the prompt textbox ref.
SNAP=$(agent-browser snapshot -i -c 2>/dev/null)
REF=$(echo "$SNAP" | grep -E "textbox.*($INPUT_LABEL_RE)" | head -1 | grep -oE 'ref=e[0-9]+' | cut -d= -f2)
if [ -z "$REF" ]; then
  echo "error: could not find prompt textbox on $URL (expected label matching: $INPUT_LABEL_RE)" >&2
  exit 4
fi

# Fill input. agent-browser's `fill` handles long content + special chars
# across Tiptap/ProseMirror/Quill uniformly.
agent-browser fill "@$REF" "$(cat "$FILE")" >/dev/null

# UI race: some editors need a tick for the Send button to activate after fill.
sleep 1

# Click send button by aria-label, using exact match to avoid hitting
# "Send voice message" / other unrelated buttons.
RESULT=$(agent-browser eval "
(() => {
  const btn = Array.from(document.querySelectorAll('button[aria-label]'))
    .find(b => b.getAttribute('aria-label') === '$SEND_LABEL');
  if (!btn) return { ok: false, error: 'send button not found (aria-label=$SEND_LABEL)' };
  if (btn.disabled) return { ok: false, error: 'send button disabled' };
  btn.click();
  return { ok: true };
})()
" --json 2>&1)

echo "$RESULT" | /usr/bin/python3 -c "
import json, sys
try:
    d = json.loads(sys.stdin.read())
except Exception as e:
    print(f'parse error: {e}', file=sys.stderr); sys.exit(5)
r = d.get('data', {}).get('result') or {}
if r.get('ok'):
    print(f\"ok: sent to $PROVIDER tab $TAB\")
else:
    print(f'submit error: {r or d.get(\"error\")}', file=sys.stderr); sys.exit(6)
"

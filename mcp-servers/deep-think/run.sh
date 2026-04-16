#!/bin/bash
# Wrapper: fetch GEMINI_API_KEY from 1Password, then exec the MCP server.
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 1Password item UUID for GEMINI_API_KEY (Dev_Secrets vault)
OP_ITEM="wktihungkefinv6kwuup5v5bbq"

if ! command -v op >/dev/null 2>&1; then
  echo "deep-think MCP: 1Password CLI (op) not found on PATH" >&2
  exit 1
fi

GEMINI_API_KEY="$(op item get "$OP_ITEM" --fields credential --reveal 2>/dev/null || true)"

if [[ -z "$GEMINI_API_KEY" ]]; then
  echo "deep-think MCP: failed to fetch GEMINI_API_KEY from 1Password (is op signed in?)" >&2
  exit 1
fi

export GEMINI_API_KEY
exec "$DIR/.venv/bin/python" "$DIR/server.py"

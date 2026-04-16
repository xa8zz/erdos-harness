# deep-think MCP

Chat-only MCP server for **Gemini 3 Deep Think** (`gemini-3-deep-think`). No tools,
no agentic behavior — just a conversation with persistent sessions, reasoning traces,
and telemetry.

## Tools

| Tool | Purpose |
|---|---|
| `chat(prompt, session_id?, system?)` | Send a prompt. Creates a new session if none given. Returns response, thinking preview, tokens, latency. |
| `get_session(session_id, include_thinking?)` | Inspect a session's history. `include_thinking=True` for full reasoning traces. |
| `list_sessions()` | Summary of all sessions, newest first. |
| `delete_session(session_id)` | Delete a session and its on-disk record. |
| `status()` | Global telemetry: active sessions, token totals, avg latency, errors. |

## Files

- `server.py` — the MCP server (FastMCP + google-genai).
- `run.sh` — wrapper that pulls `GEMINI_API_KEY` from 1Password and execs the server.
- `requirements.txt` — Python deps (mcp, google-genai).
- `.venv/` — Python virtualenv (gitignored).
- `sessions/` — on-disk JSON per session (gitignored).

## Setup

```bash
cd ~/erdos-harness/mcp-servers/deep-think
python3 -m venv .venv
.venv/bin/pip install -r requirements.txt
chmod +x run.sh
```

Registration lives in `~/erdos-harness/.mcp.json` — Claude Code picks it up automatically
for sessions opened in this repo.

## Manual smoke test

```bash
GEMINI_API_KEY=$(op item get wktihungkefinv6kwuup5v5bbq --fields credential --reveal) \
  .venv/bin/python -c "
import os
from google import genai
c = genai.Client(api_key=os.environ['GEMINI_API_KEY'])
r = c.models.generate_content(model='gemini-3-deep-think', contents='2+2?')
print(r.text[:200])
"
```

## Notes

- Sessions persist across server restarts (saved to `sessions/*.json`).
- The model is an early-access preview and may change.
- Reasoning traces can be *very* long; `chat` returns only a 500-char preview by default.
  Use `get_session(..., include_thinking=True)` for the full trace.

#!/bin/bash
# End-to-end smoke test: direct API call + MCP pipeline (tools/list + chat).
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export GEMINI_API_KEY="$(op item get wktihungkefinv6kwuup5v5bbq --fields credential --reveal)"

echo "=== Test 1: direct generate_content (ThinkingConfig + part.thought) ==="
"$DIR/.venv/bin/python" <<'PY'
import os
from google import genai
from google.genai import types
c = genai.Client(api_key=os.environ["GEMINI_API_KEY"])
r = c.models.generate_content(
    model="gemini-3-deep-think",
    contents="What is 13 * 17? Give just the number.",
    config=types.GenerateContentConfig(
        thinking_config=types.ThinkingConfig(include_thoughts=True),
    ),
)
response_text = ""
thinking_text = ""
for p in r.candidates[0].content.parts or []:
    if getattr(p, "thought", False):
        thinking_text += p.text or ""
    else:
        response_text += p.text or ""
print(f"response: {response_text.strip()[:100]}")
print(f"thinking chars: {len(thinking_text)}")
um = r.usage_metadata
print(f"tokens: prompt={um.prompt_token_count} output={um.candidates_token_count} thinking={um.thoughts_token_count}")
PY

echo ""
echo "=== Test 2: MCP pipeline (tools/list + call chat) ==="
"$DIR/.venv/bin/python" <<'PY'
import json
import os
import subprocess
import sys
from pathlib import Path

run_sh = Path(__file__).parent if False else Path(os.environ.get("DIR", ".")) / "run.sh"
server_dir = Path(__file__).parent if False else Path(os.environ.get("DIR", "."))

proc = subprocess.Popen(
    [str(server_dir / "run.sh")],
    stdin=subprocess.PIPE,
    stdout=subprocess.PIPE,
    stderr=subprocess.PIPE,
    text=True,
    bufsize=1,
)

def send(req):
    line = json.dumps(req) + "\n"
    proc.stdin.write(line)
    proc.stdin.flush()

def recv():
    line = proc.stdout.readline()
    if not line:
        err = proc.stderr.read()
        raise RuntimeError(f"server closed stdout. stderr:\n{err[:2000]}")
    return json.loads(line)

try:
    # MCP initialize
    send({"jsonrpc": "2.0", "id": 1, "method": "initialize",
          "params": {"protocolVersion": "2024-11-05", "capabilities": {}, "clientInfo": {"name": "smoke", "version": "0"}}})
    init = recv()
    print(f"initialize: ok (server {init['result']['serverInfo']['name']})")
    send({"jsonrpc": "2.0", "method": "notifications/initialized", "params": {}})

    # tools/list
    send({"jsonrpc": "2.0", "id": 2, "method": "tools/list", "params": {}})
    tools_resp = recv()
    tools = [t["name"] for t in tools_resp["result"]["tools"]]
    print(f"tools: {tools}")
    assert {"chat", "get_session", "list_sessions", "delete_session", "status"}.issubset(set(tools)), "missing tools"

    # call status
    send({"jsonrpc": "2.0", "id": 3, "method": "tools/call",
          "params": {"name": "status", "arguments": {}}})
    st = recv()
    print(f"status: {st['result']['content'][0]['text'][:200]}")

    # call chat (short prompt to keep thinking small)
    send({"jsonrpc": "2.0", "id": 4, "method": "tools/call",
          "params": {"name": "chat", "arguments": {"prompt": "Name three Erdős problems. One sentence each."}}})
    chat = recv()
    txt = chat["result"]["content"][0]["text"]
    data = json.loads(txt)
    print(f"chat.session_id: {data['session_id']}  turn: {data['turn']}")
    print(f"chat.tokens: {data['tokens']}  latency: {data['latency_ms']}ms")
    print(f"chat.response[:200]: {data['response'][:200]}")

    # threaded follow-up
    send({"jsonrpc": "2.0", "id": 5, "method": "tools/call",
          "params": {"name": "chat", "arguments": {"prompt": "Which of those is the easiest to state?", "session_id": data["session_id"]}}})
    chat2 = recv()
    data2 = json.loads(chat2["result"]["content"][0]["text"])
    print(f"chat2.turn: {data2['turn']} (should be 2)  session: {data2['session_id']}")
    assert data2["turn"] == 2
    assert data2["session_id"] == data["session_id"]
    print("threading: ok")

finally:
    proc.terminate()
    try:
        proc.wait(timeout=3)
    except subprocess.TimeoutExpired:
        proc.kill()
PY

echo ""
echo "=== All smoke tests passed ==="

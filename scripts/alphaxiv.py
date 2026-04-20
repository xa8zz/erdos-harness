#!/usr/bin/env python3
"""alphaxiv MCP client over HTTP with automatic OAuth refresh.

Reads tokens from ~/.fastmcp/oauth-mcp-client-cache/ and refreshes them
against https://clerk.alphaxiv.org/oauth/token when expired.

Usage:
    scripts/alphaxiv.py <tool_name> '<json_args>'

Examples:
    scripts/alphaxiv.py full_text_papers_search '{"query":"antichain divisibility game"}'
    scripts/alphaxiv.py embedding_similarity_search '{"query":"adversarial antichain game"}'
    scripts/alphaxiv.py tools '{}'   # lists available tools
"""
import json
import os
import sys
import time
import urllib.parse
import urllib.request

TOKEN_CACHE = os.path.expanduser(
    "~/.fastmcp/oauth-mcp-client-cache/https_api_alphaxiv_org_tokens.json"
)
CLIENT_CACHE = os.path.expanduser(
    "~/.fastmcp/oauth-mcp-client-cache/https_api_alphaxiv_org_client_info.json"
)
MCP_URL = "https://api.alphaxiv.org/mcp/v1"
TOKEN_URL = "https://clerk.alphaxiv.org/oauth/token"


def _load(path: str) -> dict:
    with open(path) as f:
        return json.load(f)


def _save_tokens(tokens: dict) -> None:
    with open(TOKEN_CACHE, "w") as f:
        json.dump(tokens, f)


def _refresh_access_token() -> str:
    tokens = _load(TOKEN_CACHE)
    client = _load(CLIENT_CACHE)
    refresh_token = tokens["data"]["token_payload"]["refresh_token"]
    data = urllib.parse.urlencode({
        "grant_type": "refresh_token",
        "refresh_token": refresh_token,
        "client_id": client["data"]["client_id"],
        "client_secret": client["data"]["client_secret"],
    }).encode()
    req = urllib.request.Request(
        TOKEN_URL,
        data=data,
        headers={"Content-Type": "application/x-www-form-urlencoded"},
    )
    with urllib.request.urlopen(req) as resp:
        body = json.loads(resp.read())
    tokens["data"]["token_payload"] = body
    iso = time.strftime(
        "%Y-%m-%dT%H:%M:%S.000000Z",
        time.gmtime(time.time() + body["expires_in"]),
    )
    tokens["data"]["expires_at"] = iso
    tokens["timestamp"] = time.time()
    _save_tokens(tokens)
    return body["access_token"]


def _get_access_token() -> str:
    tokens = _load(TOKEN_CACHE)
    payload = tokens["data"]["token_payload"]
    expires_at_iso = tokens["data"].get("expires_at", "1970-01-01T00:00:00.000000Z")
    t = time.strptime(expires_at_iso[:19], "%Y-%m-%dT%H:%M:%S")
    expires_epoch = time.mktime(t) - time.timezone
    if expires_epoch <= time.time() + 30:
        return _refresh_access_token()
    return payload["access_token"]


def _parse_sse(body: str) -> dict:
    for line in body.splitlines():
        if line.startswith("data: "):
            return json.loads(line[len("data: "):])
    return json.loads(body)


def call(method: str, params: dict | None = None) -> dict:
    token = _get_access_token()
    payload = {"jsonrpc": "2.0", "id": int(time.time() * 1000) % 1_000_000, "method": method}
    if params is not None:
        payload["params"] = params
    req = urllib.request.Request(
        MCP_URL,
        data=json.dumps(payload).encode(),
        headers={
            "Authorization": f"Bearer {token}",
            "Content-Type": "application/json",
            "Accept": "application/json, text/event-stream",
        },
    )
    with urllib.request.urlopen(req) as resp:
        return _parse_sse(resp.read().decode())


def tool_call(tool_name: str, arguments: dict) -> str:
    resp = call("tools/call", {"name": tool_name, "arguments": arguments})
    pieces: list[str] = []
    for item in resp.get("result", {}).get("content", []):
        if item.get("type") == "text":
            pieces.append(item.get("text", ""))
    if not pieces and "error" in resp:
        return f"ERROR: {json.dumps(resp['error'])}"
    return "\n".join(pieces)


def list_tools() -> list[dict]:
    resp = call("tools/list")
    return resp.get("result", {}).get("tools", [])


def main() -> None:
    if len(sys.argv) < 2:
        print(__doc__)
        sys.exit(2)
    tool_name = sys.argv[1]
    if tool_name == "tools":
        for t in list_tools():
            print(f"- {t['name']}: {t.get('description','')[:160]}")
        return
    args = json.loads(sys.argv[2]) if len(sys.argv) > 2 else {}
    print(tool_call(tool_name, args))


if __name__ == "__main__":
    main()

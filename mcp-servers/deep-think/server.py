#!/usr/bin/env python3
"""Gemini 3 Deep Think MCP server.

Chat-only, no tools or agentic behavior. Supports:
  - Persistent multi-turn sessions with on-disk state
  - Reasoning trace capture (thinking tokens)
  - Per-turn + global token/latency telemetry
"""

import json
import os
import time
import traceback
import uuid
from dataclasses import dataclass, field, asdict
from pathlib import Path
from typing import Optional

from google import genai
from google.genai import types
from mcp.server.fastmcp import FastMCP

MODEL = "gemini-3-deep-think"
SESSIONS_DIR = Path(__file__).parent / "sessions"
SESSIONS_DIR.mkdir(exist_ok=True)

if not os.environ.get("GEMINI_API_KEY"):
    raise RuntimeError("GEMINI_API_KEY env var is required (use run.sh wrapper).")

mcp = FastMCP("deep-think")
client = genai.Client(api_key=os.environ["GEMINI_API_KEY"])


# ---------- state ----------
@dataclass
class Turn:
    prompt: str
    response: str
    thinking: str
    tokens_prompt: int
    tokens_output: int
    tokens_thinking: int
    latency_ms: int
    timestamp: float


@dataclass
class Session:
    id: str
    system: str
    created_at: float
    turns: list = field(default_factory=list)

    @property
    def total_tokens(self) -> dict:
        return {
            "prompt": sum(t.tokens_prompt for t in self.turns),
            "output": sum(t.tokens_output for t in self.turns),
            "thinking": sum(t.tokens_thinking for t in self.turns),
        }


sessions: dict[str, Session] = {}
_stats = {"calls": 0, "latency_ms_sum": 0, "errors": 0}


def _session_path(sid: str) -> Path:
    return SESSIONS_DIR / f"{sid}.json"


def _save(sess: Session) -> None:
    _session_path(sess.id).write_text(
        json.dumps(asdict(sess), indent=2, default=str)
    )


def _load_all() -> None:
    for f in SESSIONS_DIR.glob("*.json"):
        try:
            data = json.loads(f.read_text())
            turns = [Turn(**t) for t in data.pop("turns", [])]
            sessions[data["id"]] = Session(**data, turns=turns)
        except Exception:
            pass


_load_all()


# ---------- helpers ----------
def _build_contents(sess: Session, new_prompt: str) -> list:
    contents = []
    for t in sess.turns:
        contents.append(types.Content(role="user", parts=[types.Part(text=t.prompt)]))
        contents.append(types.Content(role="model", parts=[types.Part(text=t.response)]))
    contents.append(types.Content(role="user", parts=[types.Part(text=new_prompt)]))
    return contents


def _extract_parts(resp) -> tuple[str, str]:
    response_text = ""
    thinking_text = ""
    try:
        parts = resp.candidates[0].content.parts or []
    except (AttributeError, IndexError):
        parts = []
    for part in parts:
        text = getattr(part, "text", None) or ""
        if getattr(part, "thought", False):
            thinking_text += text
        else:
            response_text += text
    return response_text, thinking_text


# ---------- tools ----------
@mcp.tool()
def chat(prompt: str, session_id: Optional[str] = None, system: str = "") -> dict:
    """Send a prompt to Gemini 3 Deep Think. No tools, no agentic behavior — just chat.

    If session_id is omitted or unknown, a new session is created. Pass the returned
    session_id back in to continue the thread. `system` is only used when creating
    a new session; it's ignored on subsequent turns.

    Returns: session_id, turn number, response text, thinking preview, token counts, latency.
    """
    if session_id and session_id in sessions:
        sess = sessions[session_id]
    else:
        sess = Session(
            id=uuid.uuid4().hex[:8],
            system=system,
            created_at=time.time(),
        )
        sessions[sess.id] = sess

    config = types.GenerateContentConfig(
        system_instruction=sess.system or None,
        thinking_config=types.ThinkingConfig(include_thoughts=True),
    )

    t0 = time.time()
    try:
        resp = client.models.generate_content(
            model=MODEL,
            contents=_build_contents(sess, prompt),
            config=config,
        )
    except Exception as e:
        _stats["errors"] += 1
        return {
            "error": f"{type(e).__name__}: {e}",
            "session_id": sess.id,
        }
    latency_ms = int((time.time() - t0) * 1000)

    response_text, thinking_text = _extract_parts(resp)
    meta = getattr(resp, "usage_metadata", None)

    turn = Turn(
        prompt=prompt,
        response=response_text,
        thinking=thinking_text,
        tokens_prompt=getattr(meta, "prompt_token_count", 0) or 0,
        tokens_output=getattr(meta, "candidates_token_count", 0) or 0,
        tokens_thinking=getattr(meta, "thoughts_token_count", 0) or 0,
        latency_ms=latency_ms,
        timestamp=time.time(),
    )
    sess.turns.append(turn)
    _save(sess)
    _stats["calls"] += 1
    _stats["latency_ms_sum"] += latency_ms

    preview_len = 500
    return {
        "session_id": sess.id,
        "turn": len(sess.turns),
        "response": response_text,
        "thinking_preview": thinking_text[:preview_len]
        + ("..." if len(thinking_text) > preview_len else ""),
        "thinking_chars": len(thinking_text),
        "tokens": {
            "prompt": turn.tokens_prompt,
            "output": turn.tokens_output,
            "thinking": turn.tokens_thinking,
        },
        "latency_ms": latency_ms,
    }


@mcp.tool()
def get_session(session_id: str, include_thinking: bool = False) -> dict:
    """Inspect a session — all turns, tokens, optionally full thinking traces.

    Pass include_thinking=True to get the full reasoning trace for every turn (can be large).
    """
    if session_id not in sessions:
        return {"error": f"session {session_id} not found"}
    sess = sessions[session_id]
    turns = []
    for i, t in enumerate(sess.turns):
        turn_data = {
            "n": i + 1,
            "prompt": t.prompt,
            "response": t.response,
            "tokens": {
                "prompt": t.tokens_prompt,
                "output": t.tokens_output,
                "thinking": t.tokens_thinking,
            },
            "latency_ms": t.latency_ms,
            "timestamp": t.timestamp,
        }
        if include_thinking:
            turn_data["thinking"] = t.thinking
        turns.append(turn_data)
    return {
        "session_id": sess.id,
        "system": sess.system,
        "created_at": sess.created_at,
        "turn_count": len(sess.turns),
        "total_tokens": sess.total_tokens,
        "turns": turns,
    }


@mcp.tool()
def list_sessions() -> list:
    """List all sessions with summary stats, newest first."""
    return [
        {
            "session_id": s.id,
            "created_at": s.created_at,
            "turn_count": len(s.turns),
            "total_tokens": s.total_tokens,
            "system_preview": (s.system[:80] + ("..." if len(s.system) > 80 else "")),
            "last_prompt_preview": (
                (s.turns[-1].prompt[:120] + ("..." if len(s.turns[-1].prompt) > 120 else ""))
                if s.turns else ""
            ),
        }
        for s in sorted(sessions.values(), key=lambda x: x.created_at, reverse=True)
    ]


@mcp.tool()
def delete_session(session_id: str) -> dict:
    """Delete a session and its on-disk record."""
    if session_id not in sessions:
        return {"error": f"session {session_id} not found"}
    del sessions[session_id]
    f = _session_path(session_id)
    if f.exists():
        f.unlink()
    return {"deleted": session_id}


@mcp.tool()
def status() -> dict:
    """Global telemetry: active sessions, total calls, aggregated token usage, avg latency, errors."""
    all_turns = [t for s in sessions.values() for t in s.turns]
    total = {
        "prompt": sum(t.tokens_prompt for t in all_turns),
        "output": sum(t.tokens_output for t in all_turns),
        "thinking": sum(t.tokens_thinking for t in all_turns),
    }
    calls = _stats["calls"]
    return {
        "model": MODEL,
        "active_sessions": len(sessions),
        "total_turns_all_sessions": len(all_turns),
        "calls_this_process": calls,
        "errors_this_process": _stats["errors"],
        "total_tokens_all_sessions": total,
        "avg_latency_ms_this_process": (
            _stats["latency_ms_sum"] / calls if calls else 0
        ),
    }


if __name__ == "__main__":
    mcp.run()

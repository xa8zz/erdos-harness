# erdos-harness

Working dir for AI-assisted research on open math problems. Currently mostly Erdős #872, with more problems landing here over time.

Looking to set up the agent harness itself? Head to [erdos-co-researcher](https://github.com/xa8zz/erdos-co-researcher) — that's the clean template. Works with Claude Code or Codex; run `/onboard` after cloning.

If you're here for the math, the interesting stuff lives under each problem folder:

- `<problem>/` — round docs (researcher outputs, verifier audits, followups)
- `<problem>/prompts/` — dispatch prompts sent to the research models
- `<problem>/paper/` — the writeup
- `<problem>/lean/` — formal verification via Aristotle → Lean 4
- `<problem>/phase*/` — empirical probes and numerical evidence

`CLAUDE.md` is the orchestrator's operating manual if you're curious how it runs.

License: MIT for code, CC-BY 4.0 for research artifacts.

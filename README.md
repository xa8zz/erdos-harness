Hi, I'm Om Buddhdev. This is where my personal work on research problems lives. If you see issues with the any of the work or claims, please feel free to email sensho@sensho.xyz or DM on X @sensho, I'll try my best to update or fix accordingly.

If you'd like to replicate a similar setup, an agent co-researcher for personal use is at: [erdos-co-researcher](https://github.com/xa8zz/erdos-co-researcher). Feel free to clone it and run the `/onboard` skill with any file tree based agent (Claude Code, Codex, etc.)

Problem relevant content at:
- `<problem>/` — round docs (researcher outputs, verifier audits, followups)
- `<problem>/prompts/` — dispatch prompts sent to the research models
- `<problem>/paper/` — the writeup
- `<problem>/lean/` — formal verification via Aristotle → Lean 4
- `<problem>/phase*/` — empirical probes and numerical evidence

I primarily use this with Claude Code as the main co-researcher with Codex as a secondary co-researcher for more technical work like proving in lean. Claude is better at prompting and has 1M context available on the Claude Code Max to be able to help synthesize over large amounts of compiled frontmatter from rounds and use prompt skills to synthesize/strategize with you.


License: MIT for code, CC-BY 4.0 for research artifacts.

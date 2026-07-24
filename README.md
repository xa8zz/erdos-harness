Hi, I'm Om Buddhdev (https://www.sensho.xyz/). This is where my personal work on research problems lives. If you see issues with any of the work or claims, please feel free to email sensho@sensho.xyz or DM on X @sensho, I'll try my best to update or fix accordingly.

If you'd like to replicate a similar setup, an agent co-researcher for personal use is at: [erdos-co-researcher](https://github.com/xa8zz/erdos-co-researcher). Feel free to clone it and run the `/onboard` skill with any file tree based agent (Claude Code, Codex, etc.)

Problem relevant content at:
- `<problem>/` — round docs (researcher outputs, verifier audits, followups)
- `<problem>/prompts/` — dispatch prompts sent to the research models
- `<problem>/paper/` — the writeup
- `<problem>/lean/` — formal verification via Aristotle → Lean 4
- `<problem>/phase*/` — empirical probes and numerical evidence

I primarily use this with Claude Code as the main co-researcher with Codex as a secondary co-researcher for more technical work like proving in lean. Claude is better at prompting and has 1M context available on Claude Code Max to be able to help synthesize over large amounts of compiled frontmatter from rounds and use prompt skills to synthesize/strategize with you.


How co-researcher works:

![](docs/harness-loop.svg)

License: MIT for code, CC-BY 4.0 for research artifacts.

## Current Erdős #872 result

**Claimed (2026-07-23): L(n) = o(n)** — a full claimed proof that the
divisor-antichain saturation game has sublinear length, answering Erdős
Problem #872 in the affirmative. The manuscript is
[researcher-R177-repaired-manuscript.md](erdos-872/researcher-R177-repaired-manuscript.md)
(robust envelope game with an erasure ally, self-rough quotient cones,
Shortener's root-cone sweep, and the density recursion c_b ≤ c_{b+1}/2
forcing c_1 = 0).

**Verification status — read before citing:**

- Blind adversarial referee (fresh model context, itemized checklist over
  every load-bearing joint): **accept after minor fixes, no fatal flaw** —
  [report](erdos-872/fable/audit-R176-referee-raw.md). All mandated repairs
  are implemented and diff-audited:
  [V177](erdos-872/verify-R177-fable-audit.md).
- Machine checks of the discrete skeleton (cone disjointness/covering, the
  arithmetic decomposition, the packet instance, a real-rules strategy smoke
  test) pass — see the [worklog](erdos-872/fable-worklog-R172.md).
- **Formal Lean 4 verification: tier-1 COMPLETE.** `Erdos872.main` (the
  sublinearity of the original game) compiles with zero `sorry` across
  ~12k lines; the kernel reports exactly one problem-specific axiom —
  `A3_exceptional_set_estimate`, the analytic density input (Lemma 2.3),
  whose paper proof was referee-validated. Every game-theoretic and
  combinatorial step is machine-verified. Independent rebuild + kernel
  query + statement-fidelity audit:
  [V181](erdos-872/verify-lean-R179-fable-kernel-check.md); formalizer's
  report: [V180](erdos-872/verify-lean-R179.md); Lean-final manuscript:
  [R179](erdos-872/researcher-R179-lean-verified-manuscript.md); project:
  `erdos-872/lean/r177_verification/`. Formalizing A3 itself (axiom-free
  tier-3) remains open.
- Cross-model-family audit: pending.

Earlier milestone: the
[unconditional rank-three lower-bound note](erdos-872/RESULT_UNCONDITIONAL_RANK_THREE.md).
The July-10 draft in `erdos-872/paper/` proves the pre-solution bounds
(L(n) < 0.19n) and predates the o(n) manuscript; it is kept as a historical
artifact until the paper is rewritten around the new result.

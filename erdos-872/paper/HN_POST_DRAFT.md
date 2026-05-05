# Hacker News — Post Draft

_Target: news.ycombinator.com. Submit paper URL, post lead comment immediately after._

---

## Title (80 char max — currently 71)

Improved bounds for the primitive-set saturation game (Erdős Problem 872)

## URL
https://www.sensho.xyz/papers/erdos-872.pdf

## Lead comment (post right after submission)

Author here. Short summary:

The problem is a two-player game Erdős posed in 1992 — alternately pick integers from {2,...,n}; the chosen set must stay an antichain under divisibility (no element divides another); game ends when no legal move remains. One player maximizes total moves, the other minimizes. L(n) is the value.

Results in this paper:

- Upper bound: L(n) < 0.19n. Prior public record on the Erdős problems forum was 0.416n, set earlier this month in a chain of posts starting with Liam Price + GPT-5.2 Pro.
- First non-trivial order improvement on the lower bound: L(n) ≥ (1/8 − o(1)) n log log n / log n. Baseline was n/log n.
- Intermediate upper bounds 13/36 ≈ 0.361 and 5/16 = 0.3125 both Lean-verified (zero sorries).
- Exact first-hit cover τ(n) = 5n/24 + O(1), Lean-verified.

Verification status: the <0.19n bound has a Lean endgame reduction and has passed the GPT Pro audits so far, but the envelope-inversion / prime-rounding bridge (Lemmas 7.4–7.17) is still prose — not end-to-end Lean yet.

Doesn't resolve: the central question is whether L(n) is linear or sublinear. Still open — the gap between the sublinear lower bound and linear upper bound is the real problem. The paper records three proof-class obstructions (Section 8) showing why the current toolkit can't close it unconditionally.

Methodology: math produced through a multi-round research harness — GPT-5.4 Pro primary, Claude Opus 4.7 and Gemini 3.1 adversarial auditing, Aristotle/Lean as formal filter. Full AI declaration in the paper.

Artifacts + Lean projects + numerical certification: https://github.com/xa8zz/erdos-harness

Happy to answer questions.

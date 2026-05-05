# Reddit r/math — Post Draft

_Target: reddit.com/r/math. Flair: "Research" (check sub rules). Self-post with PDF link in body._

---

## Title

[Preprint] Improved bounds on Erdős Problem 872 (divisibility antichain saturation game)

## Body

Sharing a preprint on Erdős Problem #872 (divisibility antichain saturation game on {2,...,n}). Erdős posed it in 1992; the central question — whether L(n) is linear or sublinear — is still open.

Disclosure upfront: this used a multi-model research harness (GPT-5.4 Pro primary, Claude Opus 4.7 + Gemini 3.1 adversarial auditing, Aristotle/Lean as formal filter). Full declaration in the paper.

**Results:**

- Upper bound: L(n) < 0.19n. Via a fourth-order Bonferroni on Shortener's odd-prime-prefix strategy; W₄/2 ≤ 0.1897123371, interval-arithmetic certified.
- Lower bound: L(n) ≥ (1/8 − o(1)) n log log n / log n. First order-improvement over the trivial n/log n baseline. Two-phase Prolonger strategy: activate small primes via Mertens, then max-degree right-capture on the resulting bipartite fan graph.
- Intermediate upper bounds 13/36 and 5/16 (both Lean-verified) strictly improve the prior forum record of 419/1008 ≈ 0.416.
- Exact first-hit cover τ(n) = 5n/24 + O(1), Lean-verified.
- Three proof-class obstructions (Section 8): Sherali–Adams transversal-LP integrality, Johnson q-shadow covering dichotomy, separator-only closure limitation.
- Conditional lower bound L(n) ≥ c·n(log log n)²/log n under a restricted safe-edge hypothesis (general form refuted in the paper via a K₄-fiber construction).

**Verification status:** intermediate bounds 13/36 and 5/16 are zero-sorry Lean. The <0.19n has a Lean endgame reduction and has passed all GPT Pro audits so far, but the envelope-inversion / prime-rounding bridge (Lemmas 7.4–7.17) is still prose — not end-to-end Lean yet.

**Credit chain:** prior forum record was 0.416n, a chain starting with Liam Price + GPT-5.2 Pro (first linear bound) and refined by Adenwalla, StijnC, natso26, Xiao_Hu, and Desmond Weisenberg on the erdosproblems.com forum thread.

**Open:** linear vs sublinear dichotomy; closing the conjectured n(log log n)²/log n rate unconditionally; the safe-edge hypothesis.

Paper: https://www.sensho.xyz/papers/erdos-872.pdf  
Artifacts + Lean projects + numerical certification: https://github.com/xa8zz/erdos-harness

Scrutiny welcome — especially on Section 7's prime-rounding bridge.

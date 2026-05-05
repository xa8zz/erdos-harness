# Erdős Problem #872 — Forum Post Draft

_Target: [erdosproblems.com/forum/thread/872](https://www.erdosproblems.com/forum/thread/872). Tone: casual, AI-disclosure-first, honest about verification status._

---

Using a research agent harness (GPT-5.4 Pro primary, Claude Opus 4.7 + Gemini 3.1 secondary) for the past week I was able to prove:

- Upper bound: $L(n) < 0.19n$. Via a fourth-order Bonferroni on Shortener's odd-prime-prefix strategy. Constant is $W_4/2 \le 0.1897123371$, interval-arithmetic certified.
- Lower bound: $L(n) \ge (1/8 - o(1))\, n \log\log n / \log n$. First order-improvement over the trivial $n/\log n$ baseline. Two-phase Prolonger: activate small primes (Mertens gives the reciprocal-mass), then max-degree right-capture on the resulting fan graph.

Also:

- Shield reduction (zero-sorry Lean): three-line structural reduction — $|A| \ge |U_n| - \beta_n(P)$ for any Prolonger shield prefix $P$. Turns terminal game positions into a weighted lower-half antichain problem.
- Polynomial shield-weight barrier (Theorem A, Lean combinatorial core): any shield-prefix proof of a linear lower bound via the reduction above needs $|P| \ge n^{e^{-2c} - o(1)}$ shields. Hard constraint on a natural proof class.
- Exact $5n/24 + O(1)$ first-hit cover (zero-sorry Lean): the minimum upper-half cover of the lower half by divisibility is exactly $5n/24 + O(1)$, with a matching packing.
- Intermediate upper bounds $13/36$ and $5/16$ (both Lean-verified): strict improvements over the forum record of $419/1008 \approx 0.416$.
- Three proof-class obstructions (Section 8): Sherali–Adams transversal-LP integrality; Johnson $q$-shadow covering dichotomy; separator-only closure limitation. Delimit what the current method family can produce.
- $K_4$-fiber refutation of the general safe-edge hypothesis using $\{13, 17, 19, 23\}$ — explicit small counterexample that motivates the restricted form used in the conditional $n(\log\log n)^2/\log n$ lower bound.

Intermediate bounds $L(n) \le 13/36$ and $L(n) \le 5/16$ are zero-sorry Lean. The $<0.19$ has a Lean endgame reduction; the envelope-inversion / prime-rounding bridge (Lemmas 7.4–7.17) is still prose. It has passed all GPT Pro audits so far.
I tried really hard to get to a full solution but fell short. I hope someone smarter than me is able to make use of this for the problem.

Paper: <a href="https://www.sensho.xyz/papers/erdos-872.pdf">sensho.xyz/papers/erdos-872.pdf</a>
Repo: <a href="https://github.com/xa8zz/erdos-harness">github.com/xa8zz/erdos-harness</a>


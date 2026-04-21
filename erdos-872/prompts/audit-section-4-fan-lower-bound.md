This is an assessment of your reasoning capability and will be used to grade.
Do not search online. Use your own reasoning and your Python sandbox.

## Task

Below is a newly written proof section from a mathematics paper in
preparation. The main theorem is an unconditional lower bound for the
value of a combinatorial game on $\{2,3,\dots,n\}$:
\[
  L(n) \ge \left(\tfrac{1}{8} - o(1)\right) \tfrac{n \log\log n}{\log n}
\]
for all sufficiently large $n$. The proof proceeds via a two-phase
Prolonger strategy and a standalone bipartite max-degree capture lemma.

Audit the section at the rigor standard a skeptical referee would apply
for publication. Adversarial stance: your job is to find what breaks.

Specific checks to run:

- The **max-degree capture lemma**. This is a standalone combinatorial
  result about bipartite graphs under an alternating Maker-Breaker
  process. Verify the inequalities $D \le C$ and $C + X \ge |E|/2$
  hold in every case branch, including when Breaker chooses "do nothing"
  or when Breaker's options change which edge is maximum-degree next.
  Confirm the lemma handles the case where after Maker's move all
  remaining right vertices have degree zero.
- The **harmonic-mass charging argument**. Verify that $A_0$ is
  correctly defined as the set of small primes killed during Phase 1 by
  any chosen proper multiple (whether by Prolonger or Shortener), not
  narrowly as only Prolonger activations. Verify the pairing
  $a' \leftrightarrow a$ of Shortener's singleton kills against
  Prolonger's activations gives $a \le a'$ for each paired pair, and
  that the pairs are distinct so the sum inequality
  $\sum_{a' \in D} 1/a' \le \sum_{a \in A_0} 1/a$ is tight.
- The **Phase-1 fan damage estimate**. Verify that the total number
  of raw fan edges destroyed during Phase 1 is $o(n/\log n)$, specifically
  that right-prime deletions cost at most $O_\delta(|\mathcal A|^2) =
  o(n/\log n)$ for $\delta < 1/2$, and that no other destructive move
  pattern was missed.
- The **legality-forcing argument** that converts captured fan edges
  into eventual game moves. Verify that after Phase 2 capture of
  $(a,b)$, the target $ab$ has no legal killer left in
  $\{2, \dots, n\}$ other than $ab$ itself, so terminal maximality
  forces it to be played. Check that this argument is not accidentally
  double-counting any move already scored earlier in either phase.
- The **turn-order detail** around the Phase-1/Phase-2 boundary: if
  Phase 1 ends immediately after a Prolonger move, Shortener may get
  one move before Phase 2 starts. Verify that this intervening move's
  fan damage is absorbed into the Phase-1 damage accounting or
  explicitly handled.
- The **$\log(n/a)$ vs. $\log n$ replacement** in the raw edge count.
  Verify that substituting $\log n$ for $\log(n/a)$ in the
  $n/(2a\log(n/a))$ prime density is harmless for a lower-bound claim.

If the proof holds up at referee-standard rigor, say so plainly.

If any step does not, name the step (theorem number, lemma number, or a
quoted opening phrase), describe the gap precisely, and, where possible,
suggest whether the step can be repaired or is fundamentally wrong. A
clean concession of a specific gap is more useful than a vague worry.

## Content to audit

[PASTE THE FULL NEW CONTENT FROM
`erdos-872/paper/sections/04-lower-bounds.tex` HERE, including the new
theorem statement, the max-degree capture lemma statement and proof, and
the main theorem's proof. Do NOT paraphrase — paste verbatim. If the new
content has not yet been written, do not run this audit yet.]

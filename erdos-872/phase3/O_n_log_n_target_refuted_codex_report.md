# Codex — L(n) = O(n/log n) target REFUTED by T1 lower bound (log log n grows, contradicts fixed C)

**Verdict**

A direct proof of
\[
L(n)=O(n/\log n)
\]
is no longer compatible with the repo’s current established state.

The key blocker is not just that the known routes fail; the target itself is contradicted by the present lower bound. The source of truth now states
\[
(1/8-o(1))\,\frac{n\log\log n}{\log n}\le L(n),
\]
in the T1 verified window at [current_state.md](/Users/omisverycool/erdos-harness/erdos-872/current_state.md:5). Since \(\log\log n\to\infty\), this is eventually larger than \(C\,n/\log n\) for every fixed constant \(C\). So \(L(n)=O(n/\log n)\) cannot be true if that lower bound stands.

That same contradiction is already written explicitly for the `S_y` route in [researcher-16-codex-S_y-dynamic-negative.md](/Users/omisverycool/erdos-harness/erdos-872/researcher-16-codex-S_y-dynamic-negative.md:22): entering an \(O(n/\log n)\)-tail regime in \(O(n/\log n)\) time would force \(L(n)=O(n/\log n)\), contradicting the lower bound.

**Assessment**

The updated docs point to a sharper conclusion:

- The old direct `O(n/log n)` candidates are dead: `S_y` dynamic realization is refuted, and the separate-rank / multi-rank fan linear route is also structurally dead in its current form; see [current_state.md](/Users/omisverycool/erdos-harness/erdos-872/current_state.md:14).
- The surviving Ford route is not “prove \(O(n/\log n)\) from arbitrary Prolonger structure.” It is a dynamic, bandwise residual-counting program for a specific Shortener strategy; see [ford-integration-audit.md](/Users/omisverycool/erdos-harness/erdos-872/ford-integration-audit.md:7) and [ford-integration-audit.md](/Users/omisverycool/erdos-harness/erdos-872/ford-integration-audit.md:140).
- The real missing factor in the current upper bounds is game dynamics, not another constant-shaving sieve pass; see [phase4/analysis.md](/Users/omisverycool/erdos-harness/erdos-872/phase4/analysis.md:22).

**Best Live Target**

Given the refreshed dossier, the right upper-bound target is no longer \(O(n/\log n)\). It is something like
\[
L(n)\le \frac{n(\log\log n)^A}{\log n}
\quad\text{or}\quad
L(n)\le \frac{n}{(\log n)^{1-o(1)}},
\]
via a stronger top-down Shortener plus bandwise Ford counting and a genuine game-dynamics theorem.

So the honest outcome of the direct attempt is a definitive negative result: with the current established lower bound, \(L(n)=O(n/\log n)\) is not a viable theorem target. The best likely path now is a matching slower sublinear upper bound, not a pure \(n/\log n\) bound.

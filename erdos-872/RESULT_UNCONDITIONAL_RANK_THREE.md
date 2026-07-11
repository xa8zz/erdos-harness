# Erdős #872: unconditional rank-three lower-bound update

**Status (July 2026): proof draft with extensive internal checking; not yet
independently peer-reviewed or fully formalized in Lean.**

This note records a new unconditional lower bound for the divisibility
antichain game in [Erdős Problem #872](https://www.erdosproblems.com/872). It
replaces the conditional rank-three statement in the earlier manuscript.

## Result

For every fixed \(0<\delta<1/4\), there is a constant \(c_\delta>0\) such
that, for all sufficiently large \(n\),

\[
L(n)\ge c_\delta\frac{n(\log\log n)^2}{\log n}.
\]

Taking \(\delta=1/8\) gives an absolute constant \(c>0\). This improves the
previous unconditional lower bound by one factor of \(\log\log n\).

This does **not** solve the original problem: it does not determine whether
\(L(n)\) is linear or sublinear.

## What changed

Edwin Rosero's finite \(K_5\)-fiber computations showed that the previous
"safe-edge" auxiliary game could lose potential no matter which first edge
was selected. That obstruction is valid for an auxiliary rule that permits an
exact target to be deleted without being scored.

In the original game, however, an exact target chosen by either player is an
actual move and contributes one unit to the game length. The repaired
potential counts that move. Thus the obstruction remains a useful refutation
of the stronger auxiliary game, but it does not refute the actual-game bank.

## Proof outline

Use targets \(acb\), where \(a,c\le n^\delta\) are small primes and \(b\) is
a suitable large prime. Their initial mass satisfies

\[
W_0\gg_\delta \frac{n(\log\log n)^2}{\log n}.
\]

### 1. Weighted activation selector

Give each live small-prime pair \(e=(a,c)\), with remaining target weight
\(w_e\), coefficient

\[
\phi(e)=2^{|e\cap C|-3}w_e,
\]

where \(C\) is the set of endpoints already captured by Prolonger. Let \(H\)
be the largest weighted star at an uncaptured vertex and \(K\) the largest
individual live-edge coefficient.

- If \(H\ge K\), choose a maximum-coefficient edge incident to a vertex whose
  star has weight \(H\).
- If \(H<K\), choose an edge attaining \(K\).

A three-case calculation shows that the bank gain from this move dominates
both possible modeled replies: deleting an uncaptured vertex or deleting a
live pair edge.

The activation bank counts actual moves by both players, secured target mass,
and the remaining fractional coefficients. If \(M\) is the mass surviving on
secured pairs and \(E\) counts target tokens lost to off-model replies, then

\[
T_{\rm act}+M\ge W_0/8-E.
\]

The arithmetic estimates give \(T_{\rm act}=o(W_0)\) and \(E=o(W_0)\), hence

\[
M\gg_\delta \frac{n(\log\log n)^2}{\log n}.
\]

### 2. Exact-move residual selector

Group surviving targets by their large prime \(q\). Each \(q\)-fiber becomes
a simple side graph. At the phase boundary, reset every surviving fiber to an
unactivated shadow state and define

\[
\Psi_{\rm res}
=T_{\rm res}
+\frac18\sum_{q\text{ unactivated}}|E_q|
+\sum_{\substack{q\text{ activated}\\e\in E_q}}2^{c_q(e)-2}.
\]

Here \(T_{\rm res}\) counts exact targets played by **either** player. On each
turn, Prolonger selects a target meeting the largest common-slot or side-star
threat. The resulting gain covers every direct slot reply.

If Shortener instead plays an exact target, its coefficient is at most one,
while \(T_{\rm res}\) increases by one. Such a reply therefore cannot decrease
the bank. When no residual target remains live, all fractional terms vanish,
so

\[
T_{\rm res}\ge M/8.
\]

Combining the two phases proves the stated lower bound.

## Evidence and verification boundary

Completed checks:

- the full proof is integrated into the revised 52-page manuscript;
- three independent symbolic audits and an integrated-manuscript audit found
  no blocking issue;
- an exact-rational harness checked 350,992 activation states and 134,898
  residual states;
- the manuscript compiles without unresolved references or missing citations;
- legacy graph, hypergraph, arithmetic-embedding, and legality components have
  Lean artifacts.

Still needed for the strongest verification claim:

- independent line-by-line human review;
- Lean formalization of the two new maximum-threat selectors;
- an end-to-end Lean game-strategy wrapper;
- Lean closure of the prime-counting, Mertens, mass, and deletion-budget
  estimates used by the asymptotic wrapper.

The finite selector layer is substantially closer to Lean than the complete
asymptotic theorem: all coefficients can be scaled by eight, and the existing
finite graph/hypergraph and arithmetic embedding files already supply much of
the required vocabulary.

## Artifacts

- [Revised manuscript (PDF)](paper/main.pdf)
- [Proof source: Appendix A](paper/sections/appendix-A-deferred-proofs.tex)
- [Detailed integration and audit note](researcher-75-unconditional-rank-three-paper-integration.md)
- [Exact-rational verification harness](../codex-scripts/test-harness/erdos-872-safe-edge-potential/)
- [Lean artifact index](lean/README.md)
- [Vendored snapshot of Edwin Rosero's investigation](external/edwin-872/)

## Suggested short forum summary

> Prompted by Edwin Rosero's \(K_5\) computation, I believe I can now remove
> the conditional safe-edge hypothesis from my rank-three construction. The
> revised argument gives, for every fixed \(0<\delta<1/4\),
> \(L(n)\ge c_\delta n(\log\log n)^2/\log n\). The correction is to credit an
> exact target played by Shortener as an actual game move; the earlier
> obstruction applies to a stronger auxiliary game in which that target could
> be deleted without being scored. The full proof outline, manuscript,
> verification harness, and precise verification boundary are collected here:
> **[link to this note]**. This improves the unconditional lower bound but does
> not resolve whether \(L(n)\) is linear or sublinear.

## Disclosure and acknowledgment

AI research agents were used extensively for proof search, finite-state
testing, drafting, and adversarial audits. Edwin Rosero's correspondence and
computational obstruction were instrumental in identifying the accounting
issue repaired here.

---
id: R75-unconditional-rank-three-paper-integration
type: verification
date: 2026-07-10
intent: >
  Integrate the exact-move replacement for the restricted safe-edge
  hypothesis into the manuscript and audit the resulting end-to-end proof,
  including phase-boundary and turn-order details.
predecessors:
  - R71-edwin-k5-safe-edge-email
  - R73-unconditional-T2-exact-move-potential
  - R74-online-interdiction-frontier
action:
  kind: confirms
  target: R73-unconditional-T2-exact-move-potential
claim: >
  The rank-three construction gives unconditionally
  L(n) >= c_delta n(log log n)^2/log n for every fixed
  0<delta<1/4. The manuscript now contains explicit weighted-activation and
  residual-fiber selectors and no longer assumes a restricted safe-edge
  hypothesis.
implications:
  - The strongest unconditional lower bound in the manuscript gains one factor of log log n over the fan bound.
  - The K4/K5 obstruction is retained only as a refutation of the artificial auxiliary game with unscored exact-edge deletion.
  - The original linear-versus-sublinear dichotomy remains open.
verifiers_at_time:
  - three independent symbolic audits of the activation, residual, and arithmetic assembly
  - exact-rational harness passed 350992 activation states and 134898 residual states
  - integrated-manuscript audit found no remaining blocking mathematical issue
  - Tectonic build completed with no unresolved references or missing citations
confidence_at_time: high
strategy_dependence: independent
prompt: erdos-872/prompts/researcher-R72-solution-attempt-verified-core.md
---

# Verified manuscript integration of the unconditional rank-three bound

The paper now states and proves, for every fixed \(0<\delta<1/4\), that

\[
  L(n)\ge
  c_\delta\frac{n(\log\log n)^2}{\log n}
\]

for all sufficiently large \(n\), without a safe-edge hypothesis.  Fixing
\(\delta=1/8\) gives the absolute-constant form used in the abstract and
introduction.

## Proof architecture now in the manuscript

1. **Activation selector.**  Live small-prime pair edges have coefficient
   \(\phi(e)=2^{|e\cap C|-3}w_e\).  Comparing the largest uncaptured vertex
   star \(H\) with the largest edge coefficient \(K\) produces an explicit
   claiming edge whose gain dominates every post-move vertex-star or
   pair-edge deletion.  The shadow capture set records only Prolonger's
   securing moves; Shortener-created endpoint unavailability is ignored
   conservatively.

2. **Activation bank.**  The bank counts all actual activation moves, the
   remaining weight on secured pairs, and the live fractional coefficients.
   The target used to secure an edge changes the chosen contribution from
   \(\phi(e)\) to \(1+(w_e-1)=w_e\).  Off-model target losses are charged to
   the existing deletion budget \(E\).  Shortener's response to the last
   activation move is included before the residual family is frozen, giving
   \[
     T_{\rm act}+M\ge W_0/8-E.
   \]
   Since \(T_{\rm act}\le2R=o(W_0)\) and \(E=o(W_0)\), the residual mass
   satisfies \(M\gg_\delta n(\log\log n)^2/\log n\).

3. **Residual reset and exact-move bank.**  At the phase boundary every
   surviving large-prime fiber is pessimistically reset to an unactivated
   state with empty side-capture set.  Earlier beneficial slot
   unavailability is ignored.  Distinct fibers have disjoint side slots by
   unique factorization.

4. **Residual selector.**  The potential assigns coefficient \(1/8\) to an
   edge in an unactivated fiber and
   \(2^{c_q(e)-2}\in\{1/4,1/2,1\}\) after activation, and counts every exact
   target played by either player.  A global maximum over unactivated
   common-slot threats and activated side-star threats yields a move whose
   gain dominates every direct slot reply.  An exact-target reply removes
   coefficient at most one and simultaneously adds one actual move, so it
   cannot lower the bank.  Terminally,
   \[
     T_{\rm res}\ge M/8.
   \]

5. **Arithmetic assembly.**  The existing residual embedding proves that the
   only harmful future moves for a surviving target \(acq\) are
   \(q,aq,cq,acq\).  Thus all replies used by the finite selector correspond
   to genuine divisibility-game moves, and every live modeled edge is a legal
   target.

## Audit corrections made during integration

The manuscript audit required four explicit boundary conventions:

- the activation shadow records only Prolonger securing plays;
- the final Shortener activation reply occurs before \(M\) is frozen;
- the residual shadow is reset at the phase boundary;
- \(E_q\) denotes the current live edge set, and the maximum threat is defined
  to be zero when its indexing collection is empty.

It also reclassified the old \(K_4\) fiber example correctly.  Its final
negative reply uses artificial unscored exact-edge deletion.  In the actual
game that same exact target adds one to the game length and balances the lost
unit coefficient.

## Verification

The exact-rational harness at
`codex-scripts/test-harness/erdos-872-safe-edge-potential/` passed:

- 350,992 weighted activation states;
- 134,898 residual states, including exhaustive simple fibers through five
  vertices and seeded random multi-fiber states.

The 52-page manuscript compiles with Tectonic.  Its final log has no unresolved
references, missing citations, or overfull boxes; the only layout warnings are
two pre-existing underfull boxes in the URL-heavy bibliography entry.

This verification upgrades the lower bound, not the original problem.  No
proof of \(L(n)=o(n)\) or \(L(n)\ge\varepsilon n\) is claimed.

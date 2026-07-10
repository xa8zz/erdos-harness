---
id: R73-unconditional-T2-exact-move-potential
type: research
date: 2026-07-10
intent: >
  Determine whether the restricted safe-edge hypothesis in the rank-three
  lower-bound construction can be removed by using the actual game-length
  objective rather than the stronger auxiliary unscored-deletion game.
predecessors:
  - R21-codex-T2-maker-first-repair
  - R22-codex-T2-activation-audit
  - R57-codex-T2-graph-reachable
  - R71-edwin-k5-safe-edge-email
action:
  kind: extends
  target: R71-edwin-k5-safe-edge-email
claim: >
  The restricted safe-edge hypothesis is unnecessary in both the weighted
  activation graph and the actual residual arithmetic game. Explicit
  max-threat selectors make the appropriate game-length potentials
  nondecreasing, giving unconditionally L(n) >=
  c_delta n(log log n)^2/log n for every fixed delta<1/4.
implications:
  - The conditional T2 theorem in the paper can be upgraded to an unconditional theorem after proof integration and paper audit.
  - The isolated K4/K5 residual trap remains a counterexample only to the stronger auxiliary game with an artificial unscored exact-edge deletion.
  - This does not decide whether L(n) is linear or sublinear.
verifiers_at_time:
  - independent activation algebra audit, agrees
  - independent residual arithmetic audit, agrees
  - independent full proof audit, agrees
  - finite exact-rational harness, 350992 activation states and 100000 residual multifiber states, no counterexample
confidence_at_time: high
strategy_dependence: independent
prompt: erdos-872/prompts/researcher-R72-solution-attempt-verified-core.md
---

# Unconditional rank-three lower bound by crediting actual game moves

The conditional hypothesis can be removed because the auxiliary game used in
the paper is strictly more hostile than the arithmetic game. In particular,
an exact target chosen by Shortener is an actual move and contributes one to
the game length. Treating that move as an unscored edge deletion discards the
very quantity that the lower bound is trying to force.

The proof has two finite-game lemmas, followed by the existing arithmetic
wrapper.

## 1. Weighted activation graph

At an activation state, let \(C\) be the captured small-prime vertices. A
live unclaimed pair edge \(e\) has current token weight \(w_e>0\) and

\[
  \phi(e)=2^{|e\cap C|-3}w_e
  \in\left\{\frac18w_e,\frac14w_e,\frac12w_e\right\}.
\]

A secured edge contributes its full remaining token weight. Let \(T\) count
actual activation moves already played, by either player, and define the bank

\[
  \Psi_{\rm act}
  :=T+\sum_{e\ {\rm secured}}w_e+\sum_{e\ {\rm live}}\phi(e).
\]

When Prolonger claims a live edge of current weight \(w\), one token becomes
the played target and the other \(w-1\) tokens become secured. Thus the
chosen edge contributes exactly \(w\) after the move.

For each uncaptured vertex \(v\), put

\[
  h(v):=\sum_{e\ni v}\phi(e),
  \qquad H:=\max_{v\notin C}h(v),
  \qquad K:=\max_{e\ {\rm live}}\phi(e).
\]

If \(H\ge K\), choose an uncaptured vertex \(v\) with \(h(v)=H\), and then
choose an incident live edge \(f=uv\) with maximal \(\phi(f)\) among the
edges incident to \(v\).

If \(u\) is uncaptured, then \(f\) is type zero and the exact gain is

\[
  G=H+h(u)+\frac58w_f.
\]

For any other uncaptured vertex \(z\), its post-move star is at most

\[
  h(z)+\phi(zv)+\phi(zu).
\]

Here \(h(z)\le H\), maximality of \(f\) at \(v\) gives
\(\phi(zv)\le\phi(f)\), and \(\phi(zu)\le h(u)\). Hence \(G\) dominates
every post-move vertex-deletion loss. It also dominates every post-move edge
potential: unrelated edges were at most \(K\le H\), while an edge incident
to a newly captured endpoint can only double and its old contribution is
already contained in \(H\) or \(h(u)\).

If \(u\) is already captured, then \(f\) is type one and the gain is

\[
  G=H+\frac12w_f.
\]

Only edges incident to the newly captured vertex \(v\) can double. Their old
potential is at most \(\phi(f)=w_f/4\), again by the choice of \(f\). Thus all
post-move vertex and edge threats are at most \(G\).

If \(H<K\), an edge attaining \(K\) has both endpoints captured; otherwise
one of its uncaptured endpoints would have star at least \(K\). Claiming this
edge changes no other coefficient and gains

\[
  w-\frac12w=K.
\]

This also dominates every modeled vertex or pair-edge deletion. Therefore a
safe activation edge exists in every finite weighted graph state. Actual
Shortener replies add one to \(T\) and can only improve the inequality.
When an actual Shortener pair move captures endpoints, the model
conservatively records only its edge deletion; this gives Shortener more
future replies and cannot strengthen Prolonger's position.

The appendix's off-model moves may delete several target tokens at once. As
before, charge these individually to \(E\); each deleted token lowers the bank
by at most one. The existing deletion estimate is unchanged, so

\[
  T_{\rm act}+M\ge \frac{W_0}{8}-E,
\]

where \(M\) is the residual live target mass on secured pairs. There are at
most \(R\le\binom{\pi(Y)}2\) activation rounds, hence
\(T_{\rm act}\le2R+O(1)=o(W_0)\). For fixed \(\delta<1/4\), the existing
bound \(E\ll Y^4/\log^4Y=o(W_0)\) gives

\[
  M\ge \frac{W_0}{8}-o(W_0).
\]

## 2. Actual residual arithmetic game

For each large prime \(q\), the remaining targets \(acq\) form a simple side
graph \(G_q\): its side vertices are the slots \(aq\), and edge \(ac\)
represents the exact target \(acq\). Distinct \(q\)-fibers have disjoint slots
by unique factorization.

Use a conservative shadow capture set that records only Prolonger target
plays. Before the first such target in a fiber, call it unactivated and give
each live edge coefficient \(1/8\). After activation, \(q\) is shadow-captured
and a live edge has coefficient

\[
  2^{c_q(e)-2}\in\left\{\frac14,\frac12,1\right\},
\]

where \(c_q(e)\) is the number of shadow-captured side endpoints. Actual
Shortener moves may make additional slots unavailable, but ignoring those
beneficial captures only gives the modeled Shortener more replies.

Let \(T_{\rm res}\) count every exact residual target played by either player,
and put

\[
  \Psi_{\rm res}
  :=T_{\rm res}
   +\frac18\sum_{q\ {\rm unactivated}}|E_q|
   +\sum_{\substack{q\ {\rm activated}\\e\ {\rm live}}}
      2^{c_q(e)-2}.
\]

The initial value is \(M/8\).

In an activated fiber, an uncaptured side vertex has threat

\[
  g(v)=\frac14d_0(v)+\frac12d_1(v),
\]

where \(d_i(v)\) counts incident live edges with \(i\) captured side
endpoints other than \(v\). Compare all such threats with the unactivated
fiber threats \(|E_q|/8\), and act on a global maximum.

If the maximum is an activated side vertex \(v\) with an uncaptured neighbor
\(u\), play \(uv\). The exact gain is

\[
  g(v)+g(u)+\frac14\ge H+\frac12,
\]

because the chosen type-zero edge contributes \(1/4\) to both stars. Any
other side threat rises through at most its two edges to \(u,v\), for a total
increase at most \(1/2\). If \(v\) has no uncaptured neighbor, play a
type-one edge incident to it. The gain is exactly \(g(v)=H\), and no other
uncaptured side threat rises.

If the maximum is an unactivated fiber with \(m\) edges, choose an edge
\(uv\) incident to a maximum-degree vertex \(u\). Writing the two degrees as
\(d_u,d_v\), the activation gain is

\[
  \frac m8+\frac{d_u+d_v}{4}+\frac14.
\]

Every new side threat is at most \(d_u/4+1/2\), while threats in all other
fibers were at most \(m/8\). The displayed gain dominates both. Finally, if
all vertex threats vanish, every remaining edge has both side endpoints
captured; playing it replaces coefficient one by one exact game move and
leaves the bank unchanged.

An exact-target Shortener reply removes an edge of coefficient at most one but
increments \(T_{\rm res}\) by one. It therefore never lowers the bank. Slot
replies are precisely the vertex deletions already dominated by the selector.
Thus \(\Psi_{\rm res}\) is nondecreasing after every full round. At residual
exhaustion no live edge remains, so

\[
  T_{\rm res}\ge\frac M8.
\]

This is the point at which the isolated K4/K5 trap disappears. Its final
reply is an exact target. It decreases the live-edge term by one and
simultaneously increases the real move count by one. The net change is zero,
not negative.

## 3. Arithmetic conclusion

The residual divisibility embedding already proves that, after a pair has a
securing target, the only harmful future moves for \(acq\) are

\[
  q,\qquad aq,\qquad cq,\qquad acq.
\]

The first three are the modeled slots and the fourth is the scored exact
target. Earlier harmful moves merely remove their affected targets from the
residual family. Resetting every surviving fiber to the unactivated state is
pessimistic and therefore valid even if earlier moves captured some slots.

Combining the two stages gives

\[
  L(n)\ge T_{\rm res}
  \ge \frac{M}{8}
  \ge \frac{W_0}{64}-o(W_0)
  \gg_\delta \frac{n(\log\log n)^2}{\log n}.
\]

Consequently, for every fixed \(0<\delta<1/4\), there is \(c_\delta>0\) such
that

\[
  L(n)\ge c_\delta\frac{n(\log\log n)^2}{\log n}
\]

for all sufficiently large \(n\), without a safe-edge hypothesis.

## 4. Verification and scope

Three independent symbolic audits found no missing finite-game or arithmetic
case. The reusable exact-rational harness is at
codex-scripts/test-harness/erdos-872-safe-edge-potential/. Its first run
checked 350,992 weighted activation states and 100,000 seeded random
multi-fiber residual states without a negative transition.

This result upgrades the rank-three lower bound, but it does not decide the
original linear-versus-sublinear problem. The proof uses the special
common-\(q\), simple-side-graph geometry. At growing rank, simplex fibers
still force a loss of order \(1/h\), and the missing issue remains global
online compensation across ranks.

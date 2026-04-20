---
id: R37-codex-freshness-toy-counterexample
type: refutation
date: 2026-04-19
intent: >
  Test whether immediate freshness holds in the one-cylinder arithmetic toy;
  construct a counterexample if not.
predecessors: [R36-pro-A-freshness-lemma-partial, R37-codex-freshness-bounded-depth]
action:
  kind: standalone
claim: >
  Immediate freshness fails in the one-cylinder arithmetic toy: Prolonger can
  force a useful top facet whose every degree->>h lower-defect witness was
  shielded one step earlier. Full freshness must rely on bounded-depth
  backward-charging, not immediate availability.
failure_mechanism: >
  One-cylinder Prolonger constructs a recursive pre-shielding chain of length
  2: score an edge that pre-shields the natural lower-defect witness for the
  next useful top facet, then score that top facet. Immediate freshness
  requires depth 0 but the construction needs depth >= 1.
---

# Round 37 Codex — immediate freshness fails in the one-cylinder arithmetic toy

## Outcome

I did **not** close the full arithmetic freshness lemma. What I did find is a
clean partial refutation:

> The strongest local formulation
> 
> "every useful top-facet shield has an **immediate fresh** legal lower-defect
> witness \(c \subsetneq S\) with \(d_t(c) \ge h\)"
> 
> already fails in the minimal one-cylinder arithmetic toy.

This does **not** refute the full dyadic-arithmetic program, because Pro A's
backward-charging version was already weaker: pre-shielded chains might still
terminate after bounded depth with bounded branching loss. But it does kill the
most optimistic local statement.

## The toy model

This is exactly the lower-defect star-cylinder from
`verify-R35-codex-star-cylinder-lower-defect-probe.md`, now with legality
implemented as the actual inclusion-antichain rule:

- scored star targets: \(\{0\}\cup D\), \(D \in \binom{Y}{h-1}\),
- residual targets: \(\binom{Y}{h}\),
- certificates: all nonempty proper subsets of star or residual targets,
- Prolonger may score only a **legal** star target,
- Shortener plays multi-defect \(\sigma^\star\): claim a legal certificate of
  maximum live-target degree, with tie-breaks favoring smaller certificates,
  then lexicographically.

Here "legal" means incomparable with all previously claimed certificates and not
already contained in a scored target, exactly mirroring the divisor-antichain
rules.

## Explicit counterexample state at \((h,M) = (3,7)\)

Using the greedy closure-seeking Prolonger in
`phase4/freshness_toy.py`, the legal scored sequence is
\[
(0,1,2),\ (0,1,4),\ (0,2,4),\ (0,1,7),\ (0,4,7),
\]
and \(\sigma^\star\) replies with claims
\[
(3),\ (5),\ (6),\ (2,7).
\]

At the terminal state:

- useful residual targets are
  \[
  (1,2,4),\ (1,4,7),
  \]
- and for **every** useful top-facet shield, there is **no** fresh proper
  subset witness of degree \(\ge h = 3\).

For example, take the useful shield
\[
S=(1,2,4), \qquad p=1, \qquad T=(0,2,4).
\]
The candidate immediate witnesses are simply the nonempty proper subsets of
\(S\):
\[
\{1\},\ \{2\},\ \{4\},\ \{1,2\},\ \{1,4\},\ \{2,4\}.
\]
All are already stale. For instance:

- \(\{1\}\) is contained in scored stars \((0,1,2)\), \((0,1,4)\), \((0,1,7)\),
- \(\{2\}\) is contained in scored stars \((0,1,2)\), \((0,2,4)\), and lies
  below the later claim \((2,7)\),
- \(\{4\}\) is contained in scored stars \((0,1,4)\), \((0,2,4)\), \((0,4,7)\),
- \(\{1,2\}\), \(\{1,4\}\), \(\{2,4\}\) are each contained in one of the scored
  stars \((0,1,2)\), \((0,1,4)\), \((0,2,4)\).

So this useful shield has **no immediate fresh witness at all**, let alone one
with degree \(\ge 3\).

The same happens for all six useful shields in this state.

Moreover, this is already true at the **first** moment the residual
\((1,2,4)\) becomes useful (after the third scored star), so the failure is not
an artefact of waiting until the terminal state.
At that first-useful state, the same-prime prehistory counts are exactly
\[
r_1 = r_2 = r_4 = 2 = h-1,
\]
so the toy failure begins precisely at the linear-in-\(h\) threshold suggested
by the bounded-depth corollary.

## Second counterexample state at \((h,M) = (4,8)\)

The same phenomenon persists one rank higher. The greedy legal sequence is
\[
(0,1,2,3),\ (0,1,2,5),\ (0,1,2,7),\ (0,1,3,5),\ (0,2,3,5),
\]
with \(\sigma^\star\) claims
\[
(4),\ (6),\ (8),\ (3,7),\ (5,7).
\]

At the terminal state the useful residual family is
\[
(1,2,3,5),
\]
and again **every** useful shield has zero fresh witnesses of degree
\(\ge h = 4\).

Here the first useful residual \((1,2,3,5)\) appears with same-prime
prehistory counts
\[
r_1 = r_2 = 4,\qquad r_3 = r_5 = 3,
\]
so again the obstruction lives at prehistory scale comparable to \(h\), not in
the bounded-depth regime.

So the failure is not a rank-3 artifact.

## What this refutes and what it does not

### Refuted

It refutes the strongest local freshness lemma:

\[
\boxed{
\text{every useful top-facet shield has an immediate fresh degree-}\ge h
\text{ lower witness.}
}
\]

That statement is already false in the simplest arithmetic toy that preserves
lower-defect certificates.

### Not refuted

It does **not** refute Pro A's weaker recursive version:

\[
\boxed{
\text{every useful shield admits a bounded-branching backward chain terminating
at a fresh high-degree witness.}
}
\]

The explicit toy states here are compatible with such a recursive theorem:
every stale candidate witness is stale for a very structured reason, namely it
lies inside one of a bounded number of previously scored star facets (or, in one
case, the late pair claim \((2,7)\)). So the right remaining question is indeed
the backward charging / bounded-depth recursion, not the naive immediate
freshness.

## Empirical hint toward the recursive version

Although immediate freshness fails, the toy still shows a small-multiplicity
pattern that may be relevant for a true backward-charging lemma.

On the greedy toy runs I checked up to
\[
(h,M) \in \{(3,9),(4,9),(5,9)\},
\]
if each useful shield is charged to its own witnessing scored star, then the
number of useful shields per scored star never exceeded \(2\). For example:

- at \((3,9)\), the final useful residuals are
  \[
  (1,2,4),\ (1,2,7),\ (1,4,7),\ (2,4,7),
  \]
  and every scored witness star supports exactly two useful shields;
- at \((4,9)\), the final useful residuals are
  \[
  (1,2,3,7),\ (1,2,5,7),
  \]
  and the largest witness-star multiplicity is again \(2\).

I do **not** have a proof of this multiplicity-2 phenomenon, so it remains only
an empirical hint. But it suggests the recursive stale-chain lemma may still be
true even though immediate freshness is false.

## Best current interpretation

This sharpens the program in a useful way:

1. The abstract \(H^{(h)}\) countermodels already killed top-facet max-degree
   alone.
2. The one-cylinder arithmetic toy still behaves far better dynamically than
   the abstract star forest.
3. But the rescue is **not** as simple as an immediate fresh lower-defect
   witness.

So the live target is now:

> prove a **recursive freshness / bounded-depth stale-chain lemma**, or find a
> true arithmetic obstruction to that recursive version.

That is strictly narrower than before.

## Artifacts

- Code: `phase4/freshness_toy.py`
- Tests: `phase4/test_transversal_small_h.py`

The tests verify both explicit toy counterexample states and the legality fix
that forbids Prolonger from scoring a star containing an already-claimed
certificate.

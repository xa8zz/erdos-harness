---
id: R42-codex-gamma2-scale
type: research
date: 2026-04-19
intent: >
  Empirically probe Gamma_2 scaling and prove a one-step backward-averaging
  lemma as a partial structural result.
predecessors: [R42-attack-A-refutation, R42-attack-B-refutation, R42-attack-C-refutation]
action:
  kind: extends
  target: R41-three-pros-refute-collision-forcing
claim: >
  Gamma_2 (second-order gamma parameter) stays at O(1) empirically for the
  tested range under sigma^star. One-step backward-averaging lemma proved:
  the expected Gamma_2 over one Prolonger move is at most C * Gamma_1^2 / h.
  This is a useful structural partial but does not close the main gap.
---

# Round 42 Codex — `\Gamma_2` scaling probe and a one-step backward-averaging lemma

## Status

No full closure yet. This pass does two useful things:

1. it extends the toy probe to the larger one-cylinder cases
   `\((h,M)\in\{(5,20),(6,16),(7,14)\}\)` using the actual `\Gamma_2(S,F)`
   statistic from Pro's dense-packet lemma;
2. it isolates a clean recursive-charging partial:

\[
\boxed{
\text{large reuse of one pair channel forces reuse of some earlier pair channel unless the support cloud grows.}
}
\]

So the sparse regime has sharpened again. The remaining issue is no longer
"sparse `\Gamma_2` by itself"; it is sparse `\Gamma_2` **together with**
growth of the auxiliary support cloud.

## 1. Instrumentation added

`phase4/freshness_toy.py` now computes, at the first-useful event level:

- `\Gamma_2(S,F)` for the charged score `F`, defined exactly as in Pro R39:
  legal pairs inside `S \cap F` immediately before `F`, hence first-shielded by
  `F`;
- per-event density
  `|\Gamma_2(S,F)| / \binom{|S \cap F|}{2}`;
- oriented pair-channel counts keyed by
  `(latest_pair_round, missing_prime, latest_pair)`;
- for each pair channel, the size of the auxiliary support cloud and the largest
  reuse of an earlier predecessor pair.

Regression coverage was extended in
[test_transversal_small_h.py](/Users/omisverycool/erdos-harness/erdos-872/phase4/test_transversal_small_h.py).
The file now passes with `17` tests.

## 2. Empirical results on the requested larger grid

Baseline one-cylinder greedy runs:

| case | scored | bad useful shields | pair-first max | `\Gamma_2` dense at threshold `1/2` | mean `\Gamma_2` density | max pair-channel reuse | max support-cloud size | max predecessor-pair reuse |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| `(5,20)` | 42 | 35 | 6 | `20/35` | `0.367` | `2` | `5` | `2` |
| `(6,16)` | 23 | 6 | 4 | `0/6` | `0.300` | `1` | `4` | `1` |
| `(7,14)` | 14 | 0 | 0 | `0/0` | `0.000` | `0` | `0` | `0` |

Equivalent aggregate `\Gamma_2` counts:

- `(5,20)`: `73 / 204`, with density range `[1/6, 2/3]`;
- `(6,16)`: `18 / 60`, with density range `[1/10, 2/5]`;
- `(7,14)`: no bad shields.

## 3. Interpretation of the probe

### `(5,20)` is mixed, not decisively dense

At `(5,20)`, a strict majority of bad shields satisfy the
`|\Gamma_2(S,F)| \ge \frac12 \binom{|S\cap F|}{2}` threshold:

\[
20/35 \approx 57\%.
\]

So Pro's dense-packet lemma empirically applies to a substantial fraction of the
bad family there.

But it is not universal: the mean density is only about `0.367`, and the
remaining `15` bad shields are genuinely sparse in `\Gamma_2`.

### `(6,16)` is sparse in `\Gamma_2` but not dangerous

This is the sharper new point.

At `(6,16)`, none of the `6` bad shields crosses the `1/2`-density threshold,
so the dense-packet lemma does **not** directly explain them.

However, these sparse shields do **not** exhibit pair-channel concentration:

- pair-first per-score multiplicity is only `4`,
- oriented pair-channel reuse is only `1`.

So the sparse `\Gamma_2` regime is present, but on this computed case it is
almost completely dispersed at the pair-channel level.

### `(7,14)` has no bad shields at all

So on the current greedy one-cylinder grid, the bad family is already thinning
out by rank `7`.

## 4. One-step backward-averaging lemma

Fix a Prolonger score `F_t` and an oriented pair channel

\[
c = (t, p, (p,q_0)),
\]

meaning later useful shields are charged at round `t` through the latest pair
`(p,q_0)` with missing prime `p`.

Let `\mathcal S_c` be the family of bad useful shields charged through `c`, and
write each

\[
S = \{p, q_0\} \cup U(S), \qquad |U(S)| = h-2.
\]

Because `S` is charged through `(p,q_0)`, every pair `(p,r)` with `r \in U(S)`
was first-shielded **before** time `t`.

Define the support cloud

\[
W_c := \bigcup_{S \in \mathcal S_c} U(S).
\]

Then there are `|\mathcal S_c|(h-2)` earlier pair obligations of the form
`(p,r)` with `r \in W_c`.

Therefore:

\[
\textbf{Lemma.}\qquad
\max_{r \in W_c}
\#\{S \in \mathcal S_c : r \in U(S)\}
\ge
\frac{(h-2)|\mathcal S_c|}{|W_c|}.
\]

Equivalently, some earlier pair channel `(p,r)` is a predecessor obligation for
at least

\[
\frac{(h-2)|\mathcal S_c|}{|W_c|}
\]

of the shields in `\mathcal S_c`.

### Proof

Double-count incidences `(S,r)` with `S \in \mathcal S_c`, `r \in U(S)`.
There are exactly `|\mathcal S_c|(h-2)` of them, distributed among the
`|W_c|` possible values of `r`. Pigeonhole gives the claim. ∎

## 5. Why this is the right recursive partial

This lemma shows that large reuse of a **current** pair channel cannot just
disappear into thin air. It must come from one of two mechanisms:

1. the auxiliary support cloud `W_c` is large;
2. some **earlier** pair channel `(p,r)` is already being reused many times.

So the sparse recursive obstruction has now reduced to controlling cloud growth.

If one could prove that outside the moving dyadic-packet tail the cloud size
satisfies

\[
|W_c| \ll \operatorname{polylog}(h)
\]

for every heavily used pair channel, then repeated application of the lemma
would force a backwards chain of reused pair channels. That is exactly the kind
of bounded-depth amplification that the existing bounded-prehistory freshness
lemma is designed to kill.

## 6. What the toy says about the cloud-growth branch

The new probe shows:

- `(5,20)`: `max_channel_support_cloud = 5`, `max_predecessor_pair_reuse = 2`;
- `(6,16)`: `max_channel_support_cloud = 4`, `max_predecessor_pair_reuse = 1`.

So on the completed grid, the sparse cases do **not** produce either:

- a large support cloud, or
- a large pair-channel reuse explosion.

This is consistent with the heuristic that the recursive sparse case is
possible only if the cloud grows substantially from layer to layer.

## 7. Best current conclusion

This pass does not prove `L(n) \ll n/\log\log\log n`.

But it does sharpen the remaining gap in a way that looks genuinely useful:

1. the dense `\Gamma_2` regime is already a major part of `(5,20)`;
2. the sparse `\Gamma_2` regime survives at `(6,16)`, but with **no** pair
   reuse concentration;
3. recursive charging now reduces to a concrete dichotomy:

\[
\boxed{
\text{either pair reuse propagates backward, or the support cloud must grow.}
}
\]

So the next theorem to try is no longer a vague recursive freshness statement.
It is a **cloud-growth bound outside the moving packet tail**.

# T2 core note (paper-grade consolidation)

This note consolidates the current repaired T2 lower-bound core into one place.

The point is not to re-run every numerical or Lean detail from scratch. The point is to state the exact finite game lemmas, the residual divisibility-to-hypergraph comparison theorem, and the activation bookkeeping inequality in a form that is clean enough to cite in a paper draft.

The supporting Lean artifacts are now in `lean/erdos_872_core/`. In particular:

- `GraphGame.lean` formalizes the scaled graph-potential core and the Maker gain lemmas for pair capture,
- `HyperGame.lean` formalizes the scaled scored 3-uniform potential core, the Maker gain lemmas, and the Breaker scored-edge monotonicity,
- `EmbeddingCore.lean` formalizes the local divisor classification for one residual target,
- `EmbeddingFamily.lean` formalizes the family-level slot-deletion and exact-target singleton statements,
- `ResidualComparison.lean` formalizes the residual comparison wrapper that packages the family-level slot identities, the exact-target singleton fact, and the actual legality criterion for a live residual target.
- `EmbeddingCore.lean` now also formalizes the exact local legal-live-edge criterion:
  if the played set avoids the accounted-for small divisors and harmful moves of a residual target
  `t`, then `t.value` is incomparable with every played number.

What remains outside Lean is now the activation/token bookkeeping together with a fully packaged one-step max-gain strategy theorem for the abstract Maker-first graph/hypergraph games. The residual comparison wrapper itself is now Lean-banked.

## 1. The two abstract Maker-first lemmas

We use two finite weighted game lemmas.

### Lemma 1 (weighted Maker-first pair capture)

Consider a finite weighted graph. A state records:

- captured vertices,
- claimed edges,
- deleted vertices and deleted edges.

Maker chooses an undeleted unclaimed edge `f = uv`, claims it, and captures `u` and `v`. Breaker then deletes one uncaptured vertex or one undeleted unclaimed edge.

For an unclaimed undeleted edge `e`, define
\[
\phi(e)=
\begin{cases}
\frac18 w(e),&0\text{ endpoints captured},\\[2mm]
\frac14 w(e),&1\text{ endpoint captured},\\[2mm]
\frac12 w(e),&2\text{ endpoints captured},
\end{cases}
\]
and for a claimed edge set `\phi(e)=w(e)`.

Let
\[
Q_{\mathrm{graph}}:=\sum_e \phi(e).
\]

Then Maker has a move each round that keeps `Q_{\mathrm{graph}}` nondecreasing against every single legal Breaker reply. Consequently Maker secures at least `1/8` of the initial total edge-weight.

### Proof sketch

For a Maker move on `f`, let `\Delta(f)` be the increase in `Q_{\mathrm{graph}}`.

If `x` is an uncaptured vertex and
\[
P(x):=\sum_{e\ni x}\phi(e)
\]
over currently unclaimed undeleted edges, then every legal edge `f\ni x` satisfies
\[
\Delta(f)\ge P(x),
\]
because after Maker captures `x`, each other edge through `x` doubles its coefficient and gains exactly its current potential contribution. The chosen edge contributes extra positive gain on top of that.

Likewise every legal edge `g` satisfies
\[
\Delta(g)\ge \phi(g),
\]
because claiming `g` replaces its current contribution by `w(g)`.

So if Maker chooses a max-gain edge `f_*`, then the edge-deletion part is immediate:

- deletion of an edge `g` loses exactly `\phi(g)\le \Delta(f_*)`.

For vertex deletions, one still needs the local one-step domination wrapper saying that the post-Maker loss from any legal Breaker vertex deletion is bounded by the gain of a suitable max-gain Maker move. The shorthand sentence "deletion of a vertex `x` loses exactly `P(x)`" is too compressed as written and should not be read as a standalone formal statement.

With that additional one-step wrapper in hand, Maker's move dominates every single Breaker reply and `Q_{\mathrm{graph}}` is Maker-first nondecreasing. Initially `Q_{\mathrm{graph}} = W/8`; at the end it is the total claimed weight.

This is formalized in `GraphGame.lean`; the main banked statements are `Q8_empty_eq_totalWeight`, `Q8_terminal_eq_eight_claimedWeight`, and `Q8_maker_ge_add_selfPot`.

### Lemma 2 (weighted Maker-first scored 3-uniform capture)

Consider a finite weighted 3-uniform hypergraph. A state records:

- captured vertices,
- deleted vertices,
- scored hyperedges.

A hyperedge is live if it is not yet scored and is not incident to a deleted vertex.

Maker chooses a live hyperedge `e`, scores it, and captures all three vertices of `e`.

Breaker then either:

- deletes one uncaptured vertex, or
- scores one live hyperedge.

Let `S` be the total weight of scored hyperedges, regardless of which player scored them.

For a live hyperedge `e`, define
\[
\phi(e)=
\begin{cases}
\frac18 w(e),&0\text{ captured vertices},\\[2mm]
\frac14 w(e),&1\text{ captured vertex},\\[2mm]
\frac12 w(e),&2\text{ captured vertices},\\[2mm]
w(e),&3\text{ captured vertices}.
\end{cases}
\]

Set
\[
Q_{\mathrm{hyp}}:=S+\sum_{e\text{ live}}\phi(e).
\]

Then Maker has a move each round that keeps `Q_{\mathrm{hyp}}` nondecreasing against every single legal Breaker reply. Consequently the final scored mass is at least `1/8` of the initial total hyperedge-weight.

### Proof sketch

Exactly the same domination principle works. If `v` is an uncaptured vertex and
\[
P(v):=\sum_{e\ni v}\phi(e)
\]
over live hyperedges incident to `v`, then every live hyperedge `f\ni v` satisfies
\[
\Delta(f)\ge P(v),
\]
where `\Delta(f)` is the increase in `Q_{\mathrm{hyp}}`. Capturing `v` doubles the coefficient of every other live hyperedge through `v`, while the chosen edge `f` contributes positive scored gain.

If Breaker scores a live edge `g`, then
  \[
  Q_{\mathrm{hyp}} \mapsto Q_{\mathrm{hyp}} + w(g)-\phi(g)\ge Q_{\mathrm{hyp}}.
  \]
For vertex deletions, as in Lemma 1, the remaining finite-game wrapper is the one-step statement that a suitable max-gain Maker move dominates the post-Maker loss from deleting any legal uncaptured vertex. That local strategy packaging is not yet a separately banked Lean theorem.

This is formalized in `HyperGame.lean`; the main banked statements are `HQ8_empty_eq_totalWeight`, `HQ8_terminal_eq_eight_scoredWeight`, `HQ8_maker_ge`, `HQ8_maker_ge_add_selfPot_of_count_le_two`, and `HQ8_breaker_score_ge`.

## 2. Residual target families

Fix a cutoff `Y = n^\delta` with `\delta < 1/4`. The residual T2 family is a finite set
\[
\mathcal T_* \subseteq \{acb : a<c\le Y \text{ small primes},\ b>Y \text{ prime}\}
\]
with the following properties:

1. every target `t=acb` lies in `(n/2,n]`,
2. for every target `t=acb`, the small divisors `a`, `c`, and `ac` are already unavailable from the activation stage,
3. the family is considered only at a residual moment when the relevant secured pairs have already been chosen.

For each target `t=acb`, define its three slot labels
\[
\{b,\ ab,\ cb\}.
\]
Write `e_t` for the corresponding 3-element hyperedge.

## 3. Residual comparison theorem

### Theorem 3.1 (residual divisibility game is Maker-friendlier than the scored hypergraph game)

Let `\mathcal T_*` be a residual target family as above, and let `H_*` be the 3-uniform hypergraph with one hyperedge
\[
e_t=\{b,ab,cb\}
\]
for each target `t=acb\in\mathcal T_*`.

Then the actual divisibility game on `\mathcal T_*` is Maker-friendlier than the scored hypergraph game on `H_*` in the following precise sense.

1. For each live target `t=acb`, the only harmful future moves are exactly
   \[
   b,\quad ab,\quad cb,\quad t.
   \]

2. Playing `b`, `ab`, or `cb` kills exactly the targets whose hyperedges are incident to the corresponding slot. Equivalently, these moves are exactly vertex deletions in `H_*`.

3. Playing an exact target `t` kills only that target inside the family `\mathcal T_*`. Equivalently, an exact target play is a scored-edge move, not a multi-target attack.

4. Conversely, if a hyperedge `e_t` is live in the abstract hypergraph model, then the corresponding actual target `t` is still a legal Prolonger move in the divisibility game.

Hence any lower bound proved in the scored hypergraph game applies a fortiori to the actual residual divisibility game.

### Proof

#### Step 1: local harmful set

Fix `t=acb\in\mathcal T_*`. Since `t>n/2`, there is no proper multiple of `t` inside `\{2,\dots,n\}`. So any future move that can make `t` illegal must be either `t` itself or a proper divisor of `t`.

The positive divisors of `t` are
\[
1,\ a,\ c,\ ac,\ b,\ ab,\ cb,\ t.
\]
The divisor `1` is not a game move, and by assumption `a`, `c`, `ac` are already unavailable. Therefore the only harmful future moves are exactly
\[
\{b,ab,cb,t\}.
\]

This classification is formalized in `EmbeddingCore.lean`. The key lemmas are:

- `smallDivisors_eq_divisors_ac`,
- `dvd_value_mem_smallDivisors_or_b_mul_smallDivisor`,
- `mem_slots_or_eq_value_of_dvd_value_not_small`,
- `mem_harmfulMoves_iff`.

#### Step 2: slot moves are exactly incident deletions

If Shortener plays `b`, then a target `a'c'b'` dies exactly when `b\mid a'c'b'`. Because `b>Y\ge a',c'`, the prime `b` cannot divide `a'c'`, so this happens iff `b=b'`. Thus `b` kills exactly the `b`-fiber, i.e. exactly the targets whose hyperedges contain the slot `b`.

If Shortener plays `ab`, and `ab\mid a'c'b'`, then the large prime factor again forces `b=b'`. After removing `b`, the remaining small prime `a` must be one of `a'` or `c'`. So the killed targets are exactly those using the slot `ab`. The argument for `cb` is identical.

This is formalized pointwise in `EmbeddingCore.lean` via:

- `b_dvd_value_iff_mem_slots`,
- `ab_dvd_value_iff_mem_slots`,
- `cb_dvd_value_iff_mem_slots`,

and at the finite-family level in `EmbeddingFamily.lean` via:

- `harmfulTargets_eq_slotIncidentTargets_b`,
- `harmfulTargets_eq_slotIncidentTargets_ab`,
- `harmfulTargets_eq_slotIncidentTargets_cb`.

#### Step 3: exact targets are singleton score moves

Now suppose `t,u\in\mathcal T_*` and `t\mid u`. Since both lie in `(n/2,n]`, we have `u<n+n=2t`, so the only multiple of `t` below `2t` divisible by `t` is `t` itself. Hence `u=t`.

Therefore distinct residual targets are pairwise incomparable. So if either player plays the exact target `t`, no other target in `\mathcal T_*` is killed by that move.

At the family level this is now Lean-banked in `EmbeddingFamily.lean`: under the upper-half hypothesis, `mem_harmfulTargets_value_iff_eq_of_upperHalf` and `harmfulTargets_eq_singleton_value_of_upperHalf` show that the move `t` hits exactly the singleton `{t}`.

So exact-target plays are naturally modeled as scored-edge moves.

#### Step 4: live hyperedges correspond to legal actual moves

Suppose `e_t` is live in the abstract hypergraph model. By definition, none of the slot moves `b`, `ab`, `cb` has yet been played, and the exact target `t` itself has not been played either. By the residual-family hypotheses, `a`, `c`, and `ac` were already unavailable from activation.

To show that `t` is a legal actual move, we must rule out any previously played number comparable with `t`.

- No previously played number can be a proper multiple of `t`, because `t>n/2`.
- Any previously played proper divisor of `t` must belong to
  \[
  \{1,a,c,ac,b,ab,cb\}.
  \]
  Here `1` is not a game move, `a,c,ac` are already accounted for as unavailable, and `b,ab,cb` have not been played because the hyperedge is live.

So no previously played element is comparable with `t`, and `t` is legal.

The local arithmetic content of this step is now isolated in Lean by
`value_legal_against_of_disjoint_smallDivisors_and_harmfulMoves` in
`EmbeddingCore.lean`. What remains outside Lean is the global wrapper that connects those local
disjointness hypotheses to the actual activation-stage played set.

#### Conclusion

Every actual Shortener attack is represented in the abstract hypergraph game by either:

- deletion of one slot vertex, or
- scoring of one exact hyperedge.

Conversely, every abstract live hyperedge remains a legal actual Prolonger move.

The abstract scored hypergraph game therefore underestimates Prolonger's options. It is Maker-friendlier than the actual divisibility game, so any Maker lower bound in the hypergraph model transfers to the residual divisibility game.

## 4. Activation bookkeeping theorem

We now state the bookkeeping theorem that feeds the residual game.

For each small-prime pair `e=(a,c)` with `a<c\le Y`, let
\[
B_e:=J_{a,c}\cap \mathbb P
\]
be the set of admissible large primes `b`, and let `w_t(e)` be the number of still-live tokens in `B_e` at activation time `t`.

Let:

- `S_t` be the number of activation moves already scored by Prolonger,
- `C_t` be the set of claimed pair-edges,
- `Q_t` be the weighted graph quantity defined below.

For an unclaimed undeleted pair-edge `e`, define
\[
\phi_t(e)=
\begin{cases}
\frac18 w_t(e),&0\text{ endpoints captured},\\[2mm]
\frac14 w_t(e),&1\text{ endpoint captured},\\[2mm]
\frac12 w_t(e),&2\text{ endpoints captured},
\end{cases}
\]
and for a claimed edge set `\phi_t(e)=w_t(e)`.

Set
\[
Q_t := S_t + \sum_e \phi_t(e).
\]

Let
\[
W_0:=\sum_{a<c\le Y} |J_{a,c}\cap\mathbb P|
\]
be the initial total token weight, and let `E` be the total number of tokens deleted by off-model Shortener moves during the activation stage.

### Theorem 4.1 (activation-stage inequality)

At the end of the activation phase,
\[
Q_{\mathrm{end}}\ge \frac{W_0}{8}-E.
\]
Equivalently,
\[
\text{activation score}
\;+\;
\text{residual live target weight on secured pairs}
\;\ge\;
\frac{W_0}{8}-E.
\]

### Proof

If we temporarily ignore off-model token deletions, the activation game is exactly the weighted Maker-first graph game from Lemma 1, except that when Prolonger claims an edge `e` he consumes one token from `e` and that token is added into the score `S_t`.

For the chosen edge `e`, the contribution changes from `c\cdot w_t(e)` with `c\in\{1/8,1/4,1/2\}` to
\[
1+(w_t(e)-1)=w_t(e),
\]
so the selected edge still receives the same favorable Maker gain as in Lemma 1. All other incident edges behave exactly as before. Hence the Maker-first domination proof survives unchanged for the graph-model deletions `(a)`, `(c)`, `(ac)`.

So without off-model deletions we would have
\[
Q_{\mathrm{end}}\ge \frac{W_0}{8}.
\]

Now restore off-model Shortener moves. Such a move can only delete live tokens. Every token appears in `Q_t` with coefficient at most `1`, so deleting one live token can lower `Q_t` by at most `1`. If the total number of deleted tokens is `E`, then
\[
Q_{\mathrm{end}}\ge \frac{W_0}{8}-E.
\]

This is exactly the desired inequality.

The detailed writeup is in `researcher-22-codex-T2-activation-audit.md`.

### Theorem 4.2 (size of the external deletion budget)

For every fixed `\delta<1/4`,
\[
E=o\!\left(\frac{n(\log\log n)^2}{\log n}\right).
\]

### Proof

If `R` is the number of activation rounds, then
\[
R\le \binom{\pi(Y)}{2}=O\!\left(\frac{Y^2}{\log^2 Y}\right).
\]

Now bound the damage per Shortener move.

1. A large prime `b` kills only tokens with that exact right-prime label, so it kills at most one token per pair `(a,c)`. Thus one such move kills at most
   \[
   O\!\left(\frac{Y^2}{\log^2 Y}\right)
   \]
   tokens.

2. A lateral move `pb` with `p\le Y` kills only targets of the form `pcb` with the third small prime varying, hence at most
   \[
   O\!\left(\frac{Y}{\log Y}\right)
   \]
   tokens.

3. An exact target `acb` kills exactly one token.

Therefore the worst-case total is
\[
E\ll R\cdot \frac{Y^2}{\log^2 Y}
\ll \frac{Y^4}{\log^4 Y}.
\]
With `Y=n^\delta` and `\delta<1/4`, this is
\[
o\!\left(\frac{n(\log\log n)^2}{\log n}\right).
\]

## 5. T2 corollary

Combine the activation theorem with the residual comparison theorem and the abstract scored hypergraph lemma.

Let
\[
M := \sum_{e\in C_{\mathrm{end}}} w_{\mathrm{end}}(e)
\]
be the residual live target weight on secured pairs.

From Theorem 4.1 and the fact that the number of activation moves is only
\[
S_{\mathrm{end}}=O\!\left(\frac{Y^2}{\log^2 Y}\right)
=o\!\left(\frac{n(\log\log n)^2}{\log n}\right),
\]
we obtain
\[
M \ge \frac{W_0}{8} - E - S_{\mathrm{end}}.
\]

The number-theoretic input of the T2 construction gives
\[
W_0\gg_\delta \frac{n(\log\log n)^2}{\log n}.
\]
Together with Theorem 4.2 this yields
\[
M\gg_\delta \frac{n(\log\log n)^2}{\log n}.
\]

Apply Theorem 3.1 to identify the residual game with a Maker-friendlier version of the scored 3-uniform hypergraph game, then apply Lemma 2 to that residual family. The final scored mass is at least `M/8`, so
\[
L(n)\gg_\delta \frac{n(\log\log n)^2}{\log n}.
\]

This is the repaired T2 lower bound.

## 6. Honest status

This note is meant to capture the present honest status of T2.

- The scaled finite graph/hypergraph potential cores are Lean-formalized.
- The local arithmetic, the family-level slot/exact-target comparison statements, and the residual comparison wrapper are Lean-formalized.
- The activation/token bookkeeping is not yet Lean-formalized, and the max-gain one-step strategy wrapper for the abstract Maker-first graph/hypergraph lemmas is still prose rather than a separately packaged Lean theorem.

So the right current claim is:

> T2 has a coherent paper-grade proof architecture with formal verification of its residual comparison layer and the underlying finite potential cores. The remaining formal gap is concentrated in the activation/token bookkeeping and the final strategy wrapper for the abstract Maker-first lemmas, not in the local divisibility embedding.

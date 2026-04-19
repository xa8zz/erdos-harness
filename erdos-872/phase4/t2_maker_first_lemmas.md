# T2 Maker-first lemma repair attempt

This note isolates the online-order gap in the current T2 writeup and gives a clean candidate repair.

The issue in the existing proof is that both capture lemmas are phrased as if Prolonger can respond *after* seeing Shortener's deletion in that round. In the actual game Prolonger moves first, so we need a Maker-first invariant.

## 1. Lemma 1 can be repaired as stated

Recall the weighted graph game:

- a state consists of a finite weighted graph, some captured vertices, and some claimed edges;
- Maker chooses an unclaimed edge `e = uv`, claims it, and captures `u,v`;
- Breaker then deletes one uncaptured vertex or one unclaimed edge.

Define the potential of an unclaimed edge by
\[
\phi(e)=
\begin{cases}
\frac18 w(e),&0\text{ endpoints captured},\\[2mm]
\frac14 w(e),&1\text{ endpoint captured},\\[2mm]
\frac12 w(e),&2\text{ endpoints captured},
\end{cases}
\]
and a claimed edge has potential `w(e)`.

For a Maker move on an unclaimed edge `f`, let `Δ(f)` be the total increase in potential.

### Key domination facts

Let `x` be an uncaptured vertex, and let
\[
P(x):=\sum_{e\ni x}\phi(e)
\]
over currently unclaimed edges incident to `x`.

Then for **every** unclaimed edge `f` incident to `x`,
\[
\Delta(f)\ge P(x).
\]

Reason: once Maker claims `f`, the vertex `x` becomes captured, so every other unclaimed edge incident to `x` doubles its coefficient and gains exactly its current potential. The selected edge itself contributes additional positive gain.

Also, for every unclaimed edge `g`,
\[
\Delta(g)\ge \phi(g).
\]

Reason: claiming `g` alone replaces its current potential by `w(g)`, so the gain on `g` is already at least `\phi(g)`, even before counting gains on neighboring edges.

### Maker-first consequence

Let `f_*` maximize `Δ(f)` among legal Maker moves.

- If Breaker deletes an uncaptured vertex `x`, the potential loss is exactly `P(x)`, which is at most `Δ(f_*)`.
- If Breaker deletes an unclaimed edge `g`, the potential loss is `\phi(g)`, which is at most `Δ(f_*)`.

So after Maker plays a max-gain edge, **every** legal Breaker reply loses at most Maker's already-secured gain. Hence the total potential never decreases.

Initially the potential is `W/8`, where `W` is the total initial edge-weight. At the end all surviving potential is claimed weight. Therefore Maker secures at least `W/8`.

This is the missing Maker-first proof of Lemma 1.

## 2. Lemma 2 is better viewed as a scored 3-uniform capture game

For the surviving target family, each target `t = acb` has three blocker-slots:

- the hub `b`,
- the left lateral `ab`,
- the right lateral `cb`.

If Maker plays the target `acb`, then all three slots become captured and the target itself is scored.

If Breaker plays:

- `b`, or
- `ab`, or
- `cb`,

then Breaker deletes one uncaptured slot.

If Breaker plays the exact target `acb`, that target should be counted toward the final game length, so this is naturally a **scored edge deletion**.

This suggests the following abstract lemma.

## 3. Weighted scored hypergraph capture lemma

Let `H` be a weighted 3-uniform hypergraph. A state consists of:

- captured vertices,
- deleted vertices,
- scored hyperedges.

Live hyperedges are those not yet scored and not incident to a deleted vertex.

Maker move:

- choose a live hyperedge `e`,
- score `e`,
- capture all three vertices of `e`.

Breaker move:

- either delete one uncaptured vertex,
- or score one live hyperedge.

Let the score `S` be the total weight of scored hyperedges, whether scored by Maker or by Breaker.

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
Q:=S+\sum_{e\text{ live}}\phi(e).
\]

### Maker-first proof

For a Maker move on a live hyperedge `f`, let `Δ(f)` be the increase in `Q`.

If `v` is an uncaptured vertex and
\[
P(v):=\sum_{e\ni v}\phi(e)
\]
over live hyperedges incident to `v`, then for every live hyperedge `f` containing `v`,
\[
\Delta(f)\ge P(v).
\]

Reason: capturing `v` doubles the coefficient of every other incident live hyperedge, so they gain exactly their current potential contribution from `v`; the selected hyperedge contributes additional positive gain because it is scored.

Now let `f_*` maximize `Δ(f)`.

- If Breaker deletes an uncaptured vertex `v`, the drop in `Q` is exactly `P(v)`, hence at most `Δ(f_*)`.
- If Breaker scores a live hyperedge `g`, then
  \[
  Q \mapsto Q + w(g)-\phi(g)\ge Q,
  \]
  so `Q` does not decrease at all.

Therefore, after Maker plays a max-gain hyperedge every legal Breaker reply leaves `Q` nondecreasing.

Initially `Q = W/8`, where `W` is the total initial hyperedge-weight. At the end there are no live hyperedges, so `Q = S`. Hence
\[
S\ge \frac{W}{8}.
\]

## 4. Consequence for T2

Lemma 2 should be rewritten as an application of the scored 3-uniform capture lemma to the target hypergraph whose hyperedges are the surviving targets `acb` with slots `(b,ab,cb)`.

This fixes the online-order issue for the exact-target part of T2.

## 5. Divisibility-to-hypergraph translation

This part can also be checked cleanly.

Fix a surviving target family of the form
\[
\mathcal T_* \subseteq \{acb : a<c\le Y \text{ small primes},\ b\in J_{a,c}\cap\mathbb P\},
\]
where every target lies in `(n/2,n]`, and for every target `t = acb` the small divisors `a,c,ac` have already been made unavailable.

Build a 3-uniform hypergraph `H_*` as follows.

- Vertices are the integers that occur as one of the slots `b`, `ab`, `cb` for some target in `\mathcal T_*`.
- The hyperedge corresponding to `t = acb` is
  \[
  e_t := \{\, b,\ ab,\ cb \,\}.
  \]

### 5.1. Hyperedges are well-defined and distinct

Because `b>Y\ge a,c`, the three slot labels `b,ab,cb` are distinct integers.

Moreover `e_t` determines `t` uniquely:

- `b` is the unique prime among the three labels larger than `Y`,
- from `ab` and `b` one recovers `a=(ab)/b`,
- from `cb` and `b` one recovers `c=(cb)/b`.

So distinct targets yield distinct hyperedges.

### 5.2. Exact kill set of a live target

Let `t = acb \in \mathcal T_*` be live.

Since `t>n/2`, it has no proper multiple `\le n`. Therefore a future move `m\le n` can make `t` illegal only if `m` is a divisor of `t` or `m=t`.

The divisors of `t` are
\[
1,\ a,\ c,\ ac,\ b,\ ab,\ cb.
\]

The divisor `1` is not in the game, and by construction `a,c,ac` are already unavailable. Hence the only harmful future moves are exactly
\[
b,\quad ab,\quad cb,\quad t.
\]

So the actual kill set of a live target agrees with the slot picture.

### 5.3. Slot moves delete exactly the incident hyperedges

If Shortener plays `b`, then exactly the targets in the `b`-fiber die, because `b` divides `a'c'b'` iff `b=b'`.

If Shortener plays `ab`, then exactly the targets incident to the slot `ab` die. Indeed, if `ab \mid a'c'b'`, then the large prime factor forces `b=b'`, and the small prime `a` must be one of `a',c'`. So the killed targets are precisely those using the pair `(a,b)` with the third small prime varying.

Likewise `cb` deletes exactly the hyperedges incident to the slot `cb`.

Therefore plays of `b`, `ab`, or `cb` are exactly vertex deletions in `H_*`.

### 5.4. Target plays are score moves, not new attacks

If either player plays the exact target `t=acb`, that contributes one genuine game move and should be counted in the final lower bound.

Also, because every target lies in `(n/2,n]`, distinct targets are pairwise incomparable. So playing `t` does **not** kill any other target in `\mathcal T_*`.

It may make some slots such as `b,ab,cb` unavailable for future play, because they divide `t`. But this only removes future Shortener attack options. Hence, for lower-bound purposes, it is conservative to model an exact-target play as merely **scoring** the hyperedge `e_t`, without deleting any additional vertices.

### 5.5. Legal hypergraph edges are legal actual moves

Conversely, if a target `t=acb` is still live in the hypergraph model, then none of `b,ab,cb,t` has yet been played, and `a,c,ac` were already unavailable from the activation stage.

No other previously played number can block `t`:

- no proper multiple of `t` exists inside `\{2,\dots,n\}` because `t>n/2`,
- any proper divisor of `t` is one of `a,c,ac,b,ab,cb`, all already accounted for.

Therefore every live hyperedge corresponds to a genuinely legal Prolonger move in the original divisibility game.

### 5.6. Conclusion

The residual divisibility game on the surviving targets is Maker-friendlier than the scored 3-uniform hypergraph game:

- every actual harmful Shortener move is represented by either a slot deletion or an exact-target score;
- extra divisibility side-effects of actual plays only remove future Breaker options and never create new attacks;
- every live hypergraph edge remains a legal actual target move.

So the scored hypergraph lemma is a valid lower-bound model for Lemma 2.

## 6. What still needs checking

At this point the main remaining items are outside the online-order issue itself:

1. The activation-stage bookkeeping in the T2 writeup should be re-read carefully with the corrected Maker-first lemma substituted in.
2. The fresh-prime supply estimate for the activation stage should be kept explicit, so there is no hidden dependence on a reactive ordering.
3. If desired, the whole T2 argument could now be rewritten in one clean pass using the graph lemma for activation and the scored-hypergraph lemma for the residual target game.

## 7. Sanity checks

Two exact finite-state checks support the local domination principle:

- For the graph lemma, exhaustive search over all graph states on up to 5 vertices found no counterexample to the claim that some max-gain Maker move dominates every single Breaker reply.
- For the scored 3-uniform lemma, exhaustive search over all 3-uniform hypergraphs on 4 vertices likewise found no counterexample to the analogous local claim.

These are sanity checks only, not part of the proof.

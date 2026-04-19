# Codex activation-stage audit for T2 (2026-04-19)

This closes the last bookkeeping gap in the repaired T2 program.

## Claim

The activation stage in [researcher-13-pro-fresh-second-order-lower-bound.md](/Users/omisverycool/erdos-harness/erdos-872/researcher-13-pro-fresh-second-order-lower-bound.md:1) is sound after replacing the old reactive wording by the following token-weight formulation:

\[
\text{activation score} + \text{residual live target weight on secured pairs}
\;\ge\;
\frac{W_0}{8} - E,
\]

where

- `W_0 = \sum_{a<c\le Y} |J_{a,c}\cap\mathbb P| \gg_\delta n(\log\log n)^2/\log n` is the initial total target weight,
- `E` is the total number of target tokens deleted by off-model Shortener moves during activation,
- and `E = o(n(\log\log n)^2/\log n)` for every fixed `\delta < 1/4`.

Since the number of activation moves is `O(Y^2/\log^2 Y) = o(n(\log\log n)^2/\log n)`, this implies that the total residual target weight on the secured pairs is still
\[
\gg_\delta \frac{n(\log\log n)^2}{\log n},
\]
which is exactly what Lemma 2 needs.

## 1. Tokenized activation game

For each pair `e=(a,c)` with `a<c\le Y` small primes, let
\[
B_e := J_{a,c}\cap\mathbb P
\]
be the set of candidate large primes `b`, and write `w_t(e)` for the number of still-live tokens in `B_e` at time `t`.

Each token corresponds to one upper-half target `acb`.

During activation:

- Prolonger claims an unclaimed pair-edge `e=(a,c)` by playing one live target `acb` with `b\in B_e`;
- this contributes one actual game move immediately;
- afterwards the pair `(a,c)` is secured for the residual phase.

So the correct quantity to preserve is not just "claimed edge-weight," but

\[
\text{(activation moves already scored)}
\;+\;
\text{(live residual target weight on secured pairs)}.
\]

## 2. Correct activation potential

Let

- `S_t` = number of Prolonger activation moves made so far,
- `C_t` = set of claimed pair-edges,
- `D_t` = deleted vertices/edges of the abstract pair game,
- `w_t(e)` = current live token count on edge `e`.

For an unclaimed undeleted edge `e`, define
\[
\phi_t(e)=
\begin{cases}
\frac18 w_t(e),&0\text{ endpoints captured},\\[2mm]
\frac14 w_t(e),&1\text{ endpoint captured},\\[2mm]
\frac12 w_t(e),&2\text{ endpoints captured},
\end{cases}
\]
and for a claimed edge set
\[
\phi_t(e)=w_t(e).
\]
Deleted edges contribute `0`.

Now define the global quantity
\[
Q_t := S_t + \sum_e \phi_t(e).
\]

Initially,
\[
Q_0 = \frac{W_0}{8}.
\]

At the end of the activation phase, every surviving positive-weight edge is either claimed or deleted, so
\[
Q_{\mathrm{end}}
=
S_{\mathrm{end}} + \sum_{e\in C_{\mathrm{end}}} w_{\mathrm{end}}(e),
\]
which is exactly

- the number of activation moves already scored, plus
- the residual live target weight on the secured pairs.

## 3. Maker-first graph step still works

Ignore off-model token deletions for the moment.

If Prolonger claims an unclaimed edge `f=(u,v)` with current live weight `w_t(f)\ge 1`, then:

- one live token on `f` is consumed and counted into `S_t`,
- the edge becomes claimed,
- and both endpoints become captured.

The contribution of `f` to `Q_t` changes from `c\cdot w_t(f)` with `c\in\{1/8,1/4,1/2\}` to
\[
1 + (w_t(f)-1)=w_t(f),
\]
so the chosen edge gains exactly `(1-c)w_t(f)`.

All other incident unclaimed edges double their coefficients just as in the repaired Maker-first Lemma 1. Therefore the same domination proof goes through:

- for every uncaptured vertex `x`, if
  \[
  P_t(x):=\sum_{e\ni x}\phi_t(e),
  \]
  then every live edge `f\ni x` has `\Delta_t(f)\ge P_t(x)`;
- every live edge `g` has `\Delta_t(g)\ge \phi_t(g)`.

Hence a max-gain Maker move dominates any single graph-deletion move `(a)`, `(c)`, or `(ac)`.

So if Shortener only played graph deletions, `Q_t` would be Maker-first nondecreasing and we would get
\[
Q_{\mathrm{end}}\ge \frac{W_0}{8}.
\]

## 4. Off-model moves contribute only a subtractive error

Now allow Shortener's other divisibility moves during activation.

A live target `acb` lies in `(n/2,n]`, so it has no proper multiple in `\{2,\dots,n\}`. Therefore any harmful move must be a divisor or the target itself. Its proper divisors are exactly
\[
1,\ a,\ c,\ ac,\ b,\ ab,\ cb.
\]

Here `(a),(c),(ac)` are the graph deletions already modeled. So every off-model harmful move is of one of the following types:

1. a large prime `b`,
2. a lateral semiprime `pb` with `p\le Y` small prime,
3. an exact target `acb`.

Such a move only deletes target tokens from the current edge-sets `B_e`. If a move deletes `k` live tokens total, then `Q_t` decreases by at most `k`, because every coefficient in `Q_t` is at most `1`.

Therefore if `E` denotes the total number of token deletions coming from off-model Shortener moves across the whole activation stage, then
\[
Q_{\mathrm{end}}\ge \frac{W_0}{8} - E.
\]

This is the correct activation-stage inequality.

## 5. Bounding the external-deletion budget E

Let
\[
R := \#\{\text{activation rounds}\}.
\]
Since Prolonger claims one new pair-edge per activation round,
\[
R\le \binom{\pi(Y)}{2} = O\!\left(\frac{Y^2}{\log^2 Y}\right).
\]

Now bound the token deletions per Shortener move.

### 5.1. Large prime b

A move equal to a large prime `b` kills only targets with that exact right prime. For each pair `(a,c)`, there is at most one target token `acb` with that `b`. Hence one large-prime move kills at most
\[
O\!\left(\frac{Y^2}{\log^2 Y}\right)
\]
tokens.

### 5.2. Lateral move pb

A move equal to `pb` with `p\le Y` kills only targets `pcb` with the third small prime varying. There are at most
\[
O\!\left(\frac{Y}{\log Y}\right)
\]
choices for that third prime, so one lateral move kills at most `O(Y/\log Y)` tokens.

### 5.3. Exact target

A move equal to an exact target kills exactly one token.

### 5.4. Total

The worst case is the large-prime bound each round, so
\[
E
\ll
R \cdot \frac{Y^2}{\log^2 Y}
\ll
\frac{Y^4}{\log^4 Y}.
\]

With `Y = n^\delta` and `\delta < 1/4`,
\[
\frac{Y^4/\log^4 Y}{\,n(\log\log n)^2/\log n\,}

=
O\!\left(
\frac{n^{4\delta-1}}{(\log n)^3(\log\log n)^2}
\right)
\to 0.
\]
So indeed
\[
E=o\!\left(\frac{n(\log\log n)^2}{\log n}\right).
\]

## 6. Fresh-prime supply has no reactive-ordering issue

There is no need to assume Prolonger can "reactively" find a fresh prime after seeing Shortener's move.

At each activation step Prolonger chooses an edge of **positive current live weight**. By definition, such an edge still has at least one live token `b\in J_{a,c}\cap\mathbb P`, so a legal upper-half move exists on that pair.

Thus fresh-prime supply is built into the tokenized graph state: if an edge's supply is exhausted, its current weight is zero and it simply ceases to matter in the max-gain rule.

## 7. Consequence for T2

Let
\[
M := S_{\mathrm{end}} + \sum_{e\in C_{\mathrm{end}}} w_{\mathrm{end}}(e).
\]
Then
\[
M \ge \frac{W_0}{8} - E.
\]

Since

- `W_0 \gg_\delta n(\log\log n)^2/\log n`,
- `E = o(n(\log\log n)^2/\log n)`,
- `S_{\mathrm{end}} = O(Y^2/\log^2Y)=o(n(\log\log n)^2/\log n)`,

we get
\[
\sum_{e\in C_{\mathrm{end}}} w_{\mathrm{end}}(e)
\gg_\delta
\frac{n(\log\log n)^2}{\log n}.
\]

This is exactly the residual target mass needed for Lemma 2.

Applying the scored hypergraph capture lemma to that residual family yields
\[
L(n)\gg_\delta \frac{n(\log\log n)^2}{\log n}.
\]

## Bottom line

The last pending T2 item was genuine bookkeeping, not a hidden logical gap. The repaired Maker-first lemmas plus the tokenized activation estimate close the proof.

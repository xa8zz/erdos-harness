# Round 26 Codex — online rank-3 race formulated as a concrete game

This note packages the Round-24 / Round-25 obstruction into an explicit one-band online game.

The conclusion is twofold:

1. the **pure core race** is already lost for Shortener in a systematic way;
2. therefore any successful directed rank-3 upper-bound theorem must use more than "play the triples `b=pqr` in a good order."

## 1. One-band closure data

Fix constants `\lambda>1`, `0<\gamma<1`, and a high prime band
\[
\mathcal P_{\mathrm{hi}}=\{p\text{ prime}: X\le p\le X^\lambda\}.
\]
Let
\[
\mathcal B_X:=\{b=pqr:\ p<q<r,\ p,q,r\in\mathcal P_{\mathrm{hi}}\},
\qquad
\mathcal C_X:=\{c\le X^\gamma:\ \mu^2(c)=1\}.
\]

Round 24 shows that there exists a dyadic band `(Y,2Y]` and a set
\[
\mathcal A_Y=\{a=bc\in(Y,2Y]:\ b\in\mathcal B_X,\ c\in\mathcal C_X\}
\]
with
\[
\sum_{a\in\mathcal A_Y}\frac1a\gg_{\lambda,\gamma}1.
\]

For a core `b\in\mathcal B_X`, define its one-band fiber
\[
\mathcal C_Y(b):=\{c\in\mathcal C_X:\ bc\in\mathcal A_Y\},
\]
and its reciprocal core-weight
\[
\omega_Y(b):=\sum_{c\in\mathcal C_Y(b)}\frac1{bc}
=
\frac1b\sum_{c\in\mathcal C_Y(b)}\frac1c.
\]

Then
\[
\sum_{b\in\mathcal B_X}\omega_Y(b)

=
\sum_{a\in\mathcal A_Y}\frac1a
\gg_{\lambda,\gamma}1.
\]

So the Round-24 obstruction may be rephrased as: **a single high-band core system carries constant total reciprocal mass**.

## 2. The pure core race

Ignore all collateral effects for the moment and isolate only the race for the blockers `b`.

### Game `\mathcal G_Y`

- Vertex set: the cores `b\in\mathcal B_X` with `\omega_Y(b)>0`.
- Weight of core `b`: `\omega_Y(b)`.
- Prolonger moves first.
- On a Prolonger move, he chooses an unclaimed core `b` and **activates** it.
  Interpretation in the divisibility game: he plays some legal upper-half move `bc\ell`, thereby making `b` forever illegal for Shortener.
- On a Shortener move, she chooses an unclaimed core `b` and **covers** it.
  Interpretation: she plays the blocker `b` itself and kills that whole fiber.
- Once a core is activated or covered, it is removed from the race.

Let `R` be the set of activated cores and `S` the set of covered cores.

The natural one-band question is:

> **Question Q(core).** Can Shortener, playing second, force
> \[
> \sum_{b\in R}\omega_Y(b)=o(1)
> \]
> by choosing the order of the blocker plays cleverly?

If yes, then the Round-24 obstruction would collapse already at the core level. If no, then any viable higher-rank theorem must rely on additional post-activation cleanup.

## 3. Negative answer in the pure race

The answer to `Q(core)` is **no** in the pure core race.

### Proposition 1 (greedy first-player half-mass obstruction)

In `\mathcal G_Y`, Prolonger has a strategy guaranteeing
\[
\sum_{b\in R}\omega_Y(b)\ge \frac12\sum_b \omega_Y(b).
\]

In particular, since the total core mass is `\gg_{\lambda,\gamma}1`, Prolonger can always keep
\[
\sum_{b\in R}\omega_Y(b)\gg_{\lambda,\gamma}1.
\]

### Proof

At each turn, Prolonger activates a remaining core of maximum weight.

Pair his move in round `t` with Shortener's response in the same round. Since Prolonger's chosen core has maximum remaining weight, its weight is at least the weight of Shortener's covered core in that round.

Summing over rounds gives
\[
\sum_{b\in R}\omega_Y(b)\ge \sum_{b\in S}\omega_Y(b).
\]
Since `R\cup S` is the full core set and the two sets are disjoint,
\[
\sum_{b\in R}\omega_Y(b)\ge \frac12\sum_b \omega_Y(b).
\]

This proves the proposition.

### Corollary 2 (fixed-order strategies fail systematically)

Against any predetermined Shortener order `b_1,b_2,\dots`, Prolonger can simply follow the same order one step ahead:

- play `b_1`,
- after Shortener plays the earliest remaining core, play the next earliest remaining core,
- etc.

Then Prolonger gets the odd-indexed cores in that order and Shortener gets the even-indexed ones.

If Shortener chooses the order by decreasing weight, then
\[
\omega_Y(b_1)\ge \omega_Y(b_2)\ge \omega_Y(b_3)\ge \cdots,
\]
so Prolonger again gets at least half the total core mass.

Therefore the obstruction is **not** just an artifact of a bad order such as smallest-first. It is a systematic first-player advantage in the pure blocker race.

## 4. This is not just a one-move tie

One might worry that the half-mass lower bound is caused by one anomalously heavy first core. It is not.

For every core `b\in\mathcal B_X`,
\[
\omega_Y(b)\le \frac1b\sum_{c\le X^\gamma}\frac{\mu^2(c)}c
\ll_\gamma \frac{\log X}{b}
\le \frac{\log X}{X^3}.
\]
Hence
\[
\max_b \omega_Y(b)\ll \frac{\log X}{X^3}=o(1).
\]

So the total core mass `\gg 1` is spread over many cores; Prolonger's half-mass win is a genuine extensive obstruction, not a first-turn anomaly.

## 5. Translation back to the divisibility game

The pure race `\mathcal G_Y` is weaker than the actual divisibility game in one direction and stronger in another:

- **weaker for Shortener:** once Prolonger activates a core `b`, the pure race treats the whole core mass `\omega_Y(b)` as lost to Shortener;
- **stronger for Prolonger:** in the actual game, after activating `b` he still has to realize moves from that fiber, and later Shortener moves might kill parts of it.

Therefore Proposition 1 does **not** yet prove a real lower bound from one band by itself.

What it *does* prove is a structural no-go:

> A directed rank-3 strategy that only tries to "beat Prolonger to the blockers `b=pqr`" cannot work, even in the most optimistic one-band abstraction.

The odd-prime-prefix style hope — "Shortener just plays the right blockers in the right order and gets there first" — already fails at the core-race level.

## 6. The right concrete online question

The correct rank-3 analogue of the T2 slot game is therefore not `Q(core)`, which is false, but the following strengthened question.

> **Question Q(fiber-collapse).**  
> Suppose Prolonger activates a set `R` of cores with
> \[
> \sum_{b\in R}\omega_Y(b)\gg 1.
> \]
> Can Shortener, by later non-core moves, force the *realizable* residual fiber mass over `R` to become `o(1)` anyway?

Equivalently:

> After losing the race to many cores `b`, can Shortener still collapse the activated fibers by playing moves other than `b` itself?

This is the real online rank-3 race.

## 7. Candidate secondary moves

If the one-band obstruction is to be beaten, it must be by collateral damage after activation. The plausible mechanisms are:

1. **pairwise laterals inside a core**  
   moves using one or two of the primes from `b=pqr` that wipe out many `c`-extensions at once;
2. **mixed skeletons `bc`**  
   if legal often enough, these collapse whole low-pool branches after `b` is already lost;
3. **cross-core overlap**  
   a single Shortener move might simultaneously damage many activated cores that share primes or low-pool structure.

So the next theorem should not ask whether Shortener beats Prolonger to each `b`. That race is already lost.

It should ask whether activated core mass can still be turned into **non-realizable** mass before Prolonger harvests it.

## 8. Bottom line

The online rank-3 race can be cleanly split into two layers:

- **Core race:** Prolonger vs. Shortener for ownership of the blockers `b=pqr`.
  This layer alone is lost for Shortener; Prolonger keeps at least half the core mass.
- **Fiber collapse:** after cores are lost, can Shortener still destroy the corresponding `c`-fibers fast enough?

Thus the matching-T2 upper-bound target has sharpened again:

> the required theorem is a **post-activation fiber-collapse theorem**, not a pure blocker-ordering theorem.

That is the precise higher-rank analogue of the T2 online game.

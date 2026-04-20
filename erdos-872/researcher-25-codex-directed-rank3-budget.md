---
id: R25-codex-directed-rank3-budget
type: research
date: 2026-04-19
intent: >
  Audit the counting budget for a directed higher-rank Shortener strategy
  on fixed prime-power bands; determine if rank-3 blocking is feasible.
predecessors: [R24-codex-band-local-closure-explosion]
action:
  kind: extends
  target: R24-codex-band-local-closure-explosion
claim: >
  Directed rank-3 blocker budget is insufficient: the band partition
  generates Theta(1/log x) rank-3 targets per band, while Shortener has
  only O(1/log x) moves per band. Budget is tight, not sublinear; rank-3
  blocking alone cannot give o(n) game length.
---

# Round 25 Codex — directed rank-3 blocker budget audit

This note isolates the **counting budget** for the natural directed higher-rank Shortener idea suggested by Round 24:

- partition the small-prime range into fixed-power bands,
- in each active high band, play the rank-3 closure skeletons `pqr`,
- hope this removes the triple reciprocal mass before Prolonger can exploit the attached low squarefree pool.

The main conclusion is:

> **There is no counting obstruction.**
> The raw move budget for playing all same-band rank-3 skeletons is
> \[
> O_{\alpha,\lambda}\!\left(\frac{n\log\log n}{\log n}\right),
> \]
> hence comfortably below the T2 scale
> \[
> O\!\left(\frac{n(\log\log n)^2}{\log n}\right).
> \]

So if this directed rank-3 strategy fails, the failure is **not** because the relevant `pqr` skeletons are too numerous. The remaining issue is genuinely **online/dynamic**.

## Setup

Fix
\[
\alpha\in(1/3,1/2),\qquad y=n^\alpha,\qquad \lambda>1.
\]

Cover `[2,y]` by standard fixed-power bands
\[
I_j := (X_j, X_{j+1}],\qquad X_{j+1}=X_j^\lambda,
\]
starting from some absolute `X_0>2` and stopping at `X_J\asymp y`.

Then
\[
J=O_\lambda(\log\log y)=O_{\alpha,\lambda}(\log\log n).
\]

For a band `I=(X,X^\lambda]`, define the rank-3 blocker count
\[
T_I(n):=\#\{p<q<r:\ p,q,r\in I,\ pqr\le n/2\}.
\]

This is exactly the number of squarefree same-band triples that Shortener would need to play if she tried to install all rank-3 closure skeletons for that band.

## Proposition 1 (per-band budget)

For every fixed-power band `I=(X,X^\lambda]\subseteq[2,y]`,
\[
T_I(n)\ll_{\alpha,\lambda}\frac{n}{\log n}.
\]

### Proof

Write
\[
T_I(n)
\le
\sum_{\substack{p<q\\ p,q\in I}}
\#\{r\in I:\ q<r\le n/(2pq)\}.
\]

For any contributing pair `(p,q)`, we have `p,q\le y=n^\alpha`, so
\[
\frac{n}{2pq}\ge \frac12 n^{1-2\alpha}.
\]
Since `\alpha<1/2`, this lower bound is a fixed positive power of `n`. Hence by the standard prime upper bound,
\[
\#\{r\le n/(2pq): r\text{ prime}\}
\ll_\alpha \frac{n}{pq\log n}.
\]
Therefore
\[
T_I(n)
\ll_\alpha
\frac{n}{\log n}
\sum_{\substack{p<q\\ p,q\in I}}\frac1{pq}.
\]

Now Mertens on a fixed-power interval gives
\[
\sum_{p\in I}\frac1p

=
\log\log(X^\lambda)-\log\log X+o(1)
=
\log\lambda+o(1),
\]
so
\[
\sum_{\substack{p<q\\ p,q\in I}}\frac1{pq}
\le
\frac12\Big(\big(\sum_{p\in I}1/p\big)^2-\sum_{p\in I}1/p^2\Big)
\ll_\lambda 1.
\]
Combining the last two displays,
\[
T_I(n)\ll_{\alpha,\lambda}\frac{n}{\log n}.
\]

This proves the proposition.

## Corollary 2 (total same-band rank-3 budget)

Summing over the fixed-power cover of `[2,y]`,
\[
\sum_{j\le J} T_{I_j}(n)
\ll_{\alpha,\lambda}
\frac{n\log\log n}{\log n}.
\]

### Proof

There are `J=O_{\alpha,\lambda}(\log\log n)` bands, and Proposition 1 gives `T_{I_j}(n)\ll_{\alpha,\lambda} n/\log n` for each.

## Interpretation

This directly answers the budget question raised by Round 24:

- a same-band high-prime triple family can indeed have **constant triple reciprocal mass**
  \[
  E_3(X)=\sum_{p<q<r\in[X,X^\lambda]}\frac1{pqr}\gg_\lambda 1,
  \]
  as proved in Round 24;
- but the **number** of corresponding rank-3 closure skeletons `pqr` that Shortener would need to play is only `O(n/\log n)` per band;
- across all fixed-power bands up to `y=n^\alpha`, the total move budget is only
  \[
  O_{\alpha,\lambda}\!\left(\frac{n\log\log n}{\log n}\right),
  \]
  which is strictly smaller than the T2 scale.

So the directed rank-3 cleanup idea is **budget-compatible** with a matching T2 upper bound.

## What this does **not** solve

The surviving obstruction is the same kind of online problem that killed the naive semiprime installation route one rank lower.

If Prolonger plays one upper-half move
\[
w=b\,c\,\ell,\qquad b=pqr\ \text{with }p,q,r\in I,
\]
before Shortener has installed `b`, then the blocker `b` becomes illegal for Shortener.

But unlike an installed blocker, a **preempted** triple `b` is not in Shortener's antichain, so it does **not** itself block later moves with the same high-band core `b` and different lower squarefree factor `c`.

Thus the gap is not:

- "Are there too many `pqr` to play?"  

The answer to that is now **no**.

The real gap is:

- "Can Shortener remove enough triple reciprocal mass online, before Prolonger preempts the relevant triples and opens persistent fibers over them?"

That is a genuinely dynamic theorem, not a counting theorem.

## Consequence for the main problem

This audit does **not** prove the directed rank-3 strategy works.

It only proves that:

1. the raw move budget is T2-safe, so counting does not kill the idea;
2. if the strategy fails, the failure must be due to online preemption / fiber persistence, not excessive blocker cost.

It also does **not** imply that failure of this one strategy would force
\[
L(n)\neq O\!\left(\frac{n(\log\log n)^2}{\log n}\right).
\]

To obtain such a negative consequence one would need a much stronger no-go statement: namely, an argument that **any** T2-scale higher-rank cleanup fails because Prolonger can preserve enough triple reciprocal mass and enough low-pool squarefree mass simultaneously.

That has not been shown here.

## Bottom line

The Round 24 obstruction survives as a real online challenge, but **not** as a budget challenge.

The next theorem to target is therefore something like:

> **online triple-mass depletion / fiber-collapse theorem:**  
> under an explicit directed Shortener policy, Prolonger cannot maintain both
> - constant surviving triple reciprocal mass in a high band, and
> - enough unblocked lower squarefree mass over those triples
> to realize the closure explosion.

That is now the load-bearing version of the higher-rank closure-control problem.

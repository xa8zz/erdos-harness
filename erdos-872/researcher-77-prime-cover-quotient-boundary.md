---
id: R77-prime-cover-quotient-boundary
type: synthesis
date: 2026-07-10
intent: >
  Resolve the weighted quotient cover-or-snipe game under prime-only covers
  and determine the first composite obstruction to lifting that strategy to
  the full divisibility game.
predecessors:
  - R74-online-interdiction-frontier
  - R76-fixed-rank-raw-closure-obstructions
action:
  kind: extends
  target: R74-online-interdiction-frontier
claim: >
  Prolonger preserves a positive fraction of harmonic quotient mass when
  Shortener covers only by primes, but cross-batch semiprime covers reduce the
  same batching strategy's surviving mass to O((log log t)^2)=o(log t).
  The unresolved frontier is the online mixed-carrier versus composite-cover
  preemption race.
implications:
  - Prime covers alone cannot defeat the unique-marker lower-bound route.
  - Rank-two composite covers are the first load-bearing obstruction.
  - A static semiprime obstruction is insufficient because Prolonger may preempt many cross-pairs with one mixed carrier.
verifiers_at_time:
  - symbolic harmonic-mass audit, agrees
  - exact minimax exploration through t=18 found no small counterexample to the stronger quotient game
confidence_at_time: high
strategy_dependence: prime-batching
prompt: erdos-872/prompts/researcher-R72-solution-attempt-verified-core.md
---

# Prime-cover quotient theorem and the first composite obstruction

## 1. Restricted quotient game

Fix \(t\ge2\).  The targets are mutually incomparable lifted objects \(X_d\),
\(2\le d\le t\), with weight \(w(d)=1/d\).  Prolonger moves first.  A carrier
at index \(d\) is legal if no prior Shortener cover divides \(d\); it secures
\(X_d\) and makes every divisor of \(d\) unavailable as a later cover.

In the prime-cover restriction, each Shortener move is a previously unblocked
prime \(p\le t\), and it deletes every unsecured target with \(p\mid d\).
This model omits composite covers and marker-containing snipes.

## 2. Greedy prime batching

Maintain the unprocessed primes \(R\), consisting of primes neither used in
an earlier carrier nor selected by Shortener.  On each Prolonger turn, list
\(R\) increasingly and let \(A\) be the largest nonempty initial segment with

\[
  D_A:=\prod_{q\in A}q\le t.
\]

Play the carrier \(D_A\).  It is legal because every previous Shortener prime
lies outside \(R\), while every prime factor of \(D_A\) lies in \(R\).
Remove \(A\); Shortener may take any remaining legal prime.  Repeat until no
unprocessed prime remains.

Associate every Shortener prime \(p\) with the immediately preceding batch
\(A\).  Let \(r\) be the least prime left after that batch.  Then \(r\le p\),
and maximality gives

\[
  D_A r>t,
  \qquad
  \sum_{q\in A}\log q
  >
  \log t-\log r
  \ge
  \log t-\log p.
\]

If \(p\le\sqrt t\), this is greater than \((\log t)/2\).  Since every
\(q\in A\) satisfies \(q\le r\le p\),

\[
  \sum_{q\in A}\frac{\log q}{q}
  \ge
  \frac1p\sum_{q\in A}\log q
  >
  \frac{\log t}{2p}.
\]

The associated batches are disjoint, and Mertens' estimate gives

\[
  \sum_{q\le t}\frac{\log q}{q}=\log t+O(1).
\]

Therefore, if \(B\) is the final set of Shortener primes,

\[
  \sum_{\substack{p\in B\\p\le\sqrt t}}\frac1p
  \le2+o(1).
\]

The remaining primes contribute at most

\[
  \sum_{\sqrt t<p\le t}\frac1p
  =
  \log2+o(1),
\]

so

\[
  \sum_{p\in B}\frac1p
  \le2+\log2+o(1).
\]

## 3. Positive harmonic survivor mass

Order \(B=\{p_1,\ldots,p_m\}\), and define

\[
  S_j(x):=
  \sum_{\substack{d\le x\\(d,p_1\cdots p_j)=1}}\frac1d.
\]

Exactly,

\[
  S_j(t)
  =
  S_{j-1}(t)-\frac1{p_j}S_{j-1}(t/p_j)
  \ge
  \left(1-\frac1{p_j}\right)S_{j-1}(t).
\]

Hence

\[
  S_m(t)
  \ge
  H_t\prod_{p\in B}\left(1-\frac1p\right).
\]

Since \(-\log(1-1/p)\le2/p\) for every prime,

\[
  \prod_{p\in B}\left(1-\frac1p\right)
  \ge
  \exp\left(-2\sum_{p\in B}\frac1p\right)
  \ge c>0.
\]

Thus the quotient indices avoiding all Shortener primes have harmonic mass at
least \(c\log t\).  Prime covers alone cannot destroy the harmonic reservoir.

## 4. Cross-batch semiprimes destroy this strategy

Let the disjoint batches be \(A_i\), with carriers

\[
  D_i=\prod_{p\in A_i}p\le t.
\]

For every \(i\ne j\), consider every semiprime \(pq\le t\) with
\(p\in A_i\) and \(q\in A_j\).  Such a semiprime divides no \(D_k\), so it is
legal against all batching carriers.  Distinct semiprimes all have
\(\Omega=2\), hence are mutually incomparable.

If all these cross-batch semiprimes are installed as covers, every surviving
\(d\le t\) has all of its distinct prime factors in one batch.  Put

\[
  F_i:=\prod_{p\in A_i}\left(1-\frac1p\right)^{-1},
  \qquad
  s_i:=\sum_{p\in A_i}\frac1p.
\]

The surviving harmonic mass is at most

\[
  1+\sum_i(F_i-1).
\]

Since \(D_i\le t\), the standard maximal-order bound gives
\(F_i=D_i/\varphi(D_i)=O(\log\log t)\) uniformly.  Also
\(\log F_i\ll s_i\), whence

\[
  F_i-1
  \le
  F_i\log F_i
  \ll
  (\log\log t)s_i.
\]

Finally,

\[
  \sum_i s_i
  =
  \sum_{p\le t}\frac1p
  =
  \log\log t+O(1).
\]

Therefore

\[
  1+\sum_i(F_i-1)
  =
  O((\log\log t)^2)
  =
  o(\log t).
\]

This is a sharp failure of the disjoint prime-batching proof once composite
covers are admitted.

## 5. Exact remaining frontier

This result is not yet a lower bound for the actual Erdős game.  In the
unique-marker construction of R74, prime covers and carrier divisibility map
correctly inside one large-prime fiber, but the restricted theorem omits
composite quotient covers, marker-containing snipes, tagged residual attacks,
cross-fiber attacks, and the conversion of packet weight into counted moves.

The semiprime family above is only a static obstruction.  Prolonger may use a
mixed carrier to preempt many cross-batch semiprimes at once, and Prolonger
accumulates actual moves while Shortener tries to enumerate them.  The
unresolved core is therefore an online weighted clique/cover game:

> Can mixed carriers preserve a positive harmonic fraction against composite
> covers of every rank, or can Shortener interdict those carriers while the
> cross-batch cover hierarchy is being built?

That question is the first point at which neither the lower nor upper route
currently has a proof.

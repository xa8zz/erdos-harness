---
id: R76-fixed-rank-raw-closure-obstructions
type: refutation
date: 2026-07-10
intent: >
  Test whether the fixed-rank sweep reduction can be completed by bounding
  the raw reachable closure R_q(P), either for arbitrary central-rank sweep
  orderings or for an optimized prime-sweep policy.
predecessors:
  - R74-online-interdiction-frontier
action:
  kind: extends
  target: R74-online-interdiction-frontier
claim: >
  Raw fixed-rank closure is not a sufficient policy-free target. At the
  central rank there is a fully legal sweep history with linear raw closure,
  and at rank one Prolonger defeats every prime-sweep policy while leaving a
  linear live upper-half antichain in R_1(P).
failure_mechanism: >
  A consecutive block of T upper-half Prolonger moves covers every divisor
  d<=T and is compatible with T harmless upper-half rank-q Shortener moves.
  At q=1, Prolonger batches many unclassified small primes into one carrier;
  the Shortener primes have reciprocal sum at most
  log(3 sqrt(3)/2)+o(1)<1, so a positive fraction of the upper half avoids
  them.
implications:
  - A central-rank upper strategy must specify an actively interdicting ordering; choosing any legal rank-q element is insufficient.
  - The correct object is the live closure R_q(P) intersected with the incomparability set of the actual prefix, not raw R_q(P).
  - No prime-only sweep can prove sublinearity, even with an adaptive choice policy.
verifiers_at_time:
  - independent asymptotic and legality audit, agrees
confidence_at_time: high
strategy_dependence: fixed-rank-sweep
prompt: erdos-872/prompts/researcher-R72-solution-attempt-verified-core.md
---

# Reachable obstructions to raw fixed-rank closure

## 1. A central-rank linear closure is genuinely reachable

Put

\[
  H=\log\log n,\qquad q=\lfloor H/2\rfloor,\qquad
  h=\lceil H\rceil,\qquad
  T=\left\lceil\frac{n}{2^{h-q}}\right\rceil .
\]

There is a legal implementation of the rank-\(q\) sweep whose terminal
Prolonger prefix \(P\) satisfies

\[
  \operatorname{width}(R_q(P))\ge(1/4-o(1))n.
\]

Indeed, Sathe--Selberg gives

\[
  |\{d\in U_n:\Omega(d)=q\}|
  =
  \frac{n}{(\log n)^{I(1/2)+o(1)}}
  \gg T,
\]

because

\[
  \frac{\log2}{2}-I(1/2)=\log2-\frac12>0.
\]

Fix a block \(B\subset U_n\) of \(T\) consecutive integers.  For the first
\(T\) rounds, Prolonger enumerates \(B\), while Shortener chooses distinct
rank-\(q\) elements of \(U_n\setminus B\).  Every move is legal because all
chosen integers lie in the upper half.  Continue the rank-\(q\) sweep
arbitrarily; the final Prolonger set still contains \(B\).

If \(x\in U_n\) and \(\Omega(x)\ge h\), every rank-\(q\) divisor \(d\mid x\)
obeys

\[
  d\le \frac{x}{2^{h-q}}\le T.
\]

Every \(d\le T\) divides a member of the \(T\)-consecutive block \(B\).
Hence \(x\in R_q(P)\).  Erdős--Kac gives \((1/4+o(1))n\) such upper-half
integers, and \(U_n\) is an antichain.

This refutes an all-order interpretation of the instruction to choose any
legal rank-\(q\) member.  It does not refute the existence of a specially
designed central-rank policy.

## 2. Every prime-sweep policy is defeated

For \(q=1\), there is a stronger policy-independent statement.  Against every
Shortener policy that repeatedly chooses a legal prime, Prolonger can force

\[
  \operatorname{width}(R_1(P))
  \ge
  \left(
    \frac{1-\log(3\sqrt3/2)}2-o(1)
  \right)n,
\]

where the displayed constant is approximately \(0.0226144\).

Let \(z=n^{1/3}\).  While unclassified primes at most \(z\) remain, Prolonger
takes the smallest such primes in order, forms a maximal squarefree product
\(B_i\le n\), and plays \(2^{a_i}B_i\in U_n\), with \(a_i\) maximal.  The
first batch contains \(2\), so the later scaling remains compatible with
earlier moves.  Once all primes at most \(z\) are classified, Prolonger
captures the least remaining prime \(r\) individually by playing
\(2^a r\in U_n\).  Every carrier lies in \(U_n\), uses no Shortener prime,
and contains a fresh prime factor, so the moves are legal and distinct.

Let \(D\) be the set of Shortener primes.  If \(d\le z\) is selected after
batch \(B_i\), maximality gives

\[
  \log B_i>\log(n/d).
\]

The function \(g(t)=1/(t\log(n/t))\) decreases below \(n/e\), so

\[
  \frac1d
  \le
  \sum_{p\mid B_i}\frac{\log p}{p\log(n/p)}.
\]

The batches are disjoint, and the prime number theorem gives

\[
  \sum_{\substack{d\in D\\d\le z}}\frac1d
  \le
  \sum_{p\le z}\frac{\log p}{p\log(n/p)}
  =
  \log\frac32+o(1).
\]

Only \(O(\pi(z))\) primes above \(z\) can be selected during batching, with
total reciprocal contribution \(o(1)\).  In the second phase, each Shortener
prime is paired with the smaller prime that Prolonger captured immediately
before it.  Thus Shortener receives at most half of the remaining
prime-harmonic mass:

\[
  \sum_{\substack{d\in D\\d>z}}\frac1d
  \le
  \frac12\sum_{z<p\le n}\frac1p+o(1)
  =
  \frac12\log3+o(1).
\]

Consequently

\[
  \sum_{d\in D}\frac1d
  \le
  \log\frac32+\frac12\log3+o(1)
  =
  \log\frac{3\sqrt3}{2}+o(1)
  <1.
\]

A union bound in \(U_n\) leaves at least

\[
  \frac n2
  \left(1-\log\frac{3\sqrt3}{2}-o(1)\right)
\]

integers divisible by no prime in \(D\).  When the prime sweep stops, every
prime outside \(D\) divides a Prolonger carrier.  Hence these surviving
upper-half integers belong to \(R_1(P)\).  Removing the \(o(n)\) carriers
already played still leaves the claimed linear live antichain.

## 3. Corrected upper target

The surviving central-rank question is

\[
  \exists\ \text{an active rank-}q\text{ policy }\sigma
  \quad
  \forall\ \text{Prolonger strategies},\qquad
  \operatorname{width}
  \left(
    R_q(P)\cap\operatorname{Inc}(P\cup S)
  \right)
  =o(n)?
\]

The prime batching proof does not extend mechanically to \(q\ge2\): a
previously selected rank-\(q\) divisor can be assembled from prime factors
spread across a proposed carrier, making that carrier illegal.  This
cross-batch composite phenomenon is precisely where an online interdiction
argument is required.

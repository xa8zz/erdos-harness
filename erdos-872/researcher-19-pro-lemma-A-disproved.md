# Round 19 Pro — Lemma A disproved; harmonic sum ~Θ(log n), not (log log n)^2

One pro came back. 

Route A cannot be proved as stated, because **Lemma A is false**. The flaw is exactly in the attempted inference

[
d=p_1\cdots p_k\le n,\qquad p_i\le y=n^\alpha
]

implying (k\le 1/\alpha). That implication would require the primes (p_i) to be near (y). But they can be very small. The inequality (d\le y^k=n^{k\alpha}) is only an upper bound on the largest possible product of (k) small primes; it does not force every such product to be large.

For example, for (\alpha=0.4), (n=10^6), (y\approx 251), the squarefree three-prime core

[
2\cdot 3\cdot 5=30\le n
]

certainly exists. The example (251^3>10^6) only shows that three primes all near (y) cannot appear together, not that three small primes cannot appear.

Here is a rigorous disproof of Lemma A.

Let

[
S_y(n)=\sum_{d\in \mathcal D_y(n)}\frac1d.
]

Since (\alpha>1/3), we have (n^{1/3}\le y). Therefore every product

[
d=pqr
]

of three distinct primes (p<q<r\le n^{1/3}) satisfies

[
d=pqr\le n,\qquad P^+(d)\le n^{1/3}\le y,\qquad \omega(d)=3.
]

So all such (d) lie in (\mathcal D_y(n)). Hence

[
S_y(n)\ge \sum_{\substack{p<q<r\le n^{1/3}}}\frac1{pqr}.
]

Let

[
A(X)=\sum_{p\le X}\frac1p,\qquad
B(X)=\sum_{p\le X}\frac1{p^2},\qquad
C(X)=\sum_{p\le X}\frac1{p^3}.
]

Then

[
\sum_{p<q<r\le X}\frac1{pqr}
============================

\frac{A(X)^3-3A(X)B(X)+2C(X)}6.
]

By Mertens’ theorem,

[
A(X)=\log\log X+O(1),
]

while (B(X)) and (C(X)) remain bounded as (X\to\infty). Taking (X=n^{1/3}), we get

[
\sum_{p<q<r\le n^{1/3}}\frac1{pqr}
==================================

\frac{1+o(1)}6(\log\log n)^3.
]

Therefore

[
S_y(n)\ge c(\log\log n)^3
]

for some absolute (c>0) and all sufficiently large (n). This already contradicts Lemma A’s claimed bound

[
S_y(n)\ll_\alpha (\log\log n)^2.
]

In fact, the failure is much larger than a cubic-log issue. Since (y=n^\alpha), every squarefree composite (d\le y) automatically belongs to (\mathcal D_y(n)). Thus

[
S_y(n)
\ge
\sum_{\substack{d\le y\ \mu^2(d)=1\ \omega(d)\ge 2}}\frac1d.
]

Using the standard estimate

[
\sum_{d\le Y}\frac{\mu^2(d)}d
=============================

\frac6{\pi^2}\log Y+O(1),
]

and subtracting (d=1) and the primes, whose reciprocal sum is only (O(\log\log Y)), gives

[
S_y(n)
\ge
\frac6{\pi^2}\log y-O(\log\log y)
=================================

\left(\frac{6\alpha}{\pi^2}+o(1)\right)\log n.
]

So the harmonic mass in Lemma A is actually at least of order (\log n), not ((\log\log n)^2). Since trivially

[
S_y(n)\le \sum_{\substack{d\le n\ \mu^2(d)=1}}\frac1d
=====================================================

\frac6{\pi^2}\log n+O(1),
]

the static sum is (\Theta_\alpha(\log n)) up to constants, not (O_\alpha((\log\log n)^2)).

So Route A, as stated, cannot close the reduction.

The squarefree/repetition issue is not the problem: the counterexamples above use distinct primes. The problem is that “all prime factors are (\le y)” gives no lower bound on those prime factors. There are many squarefree (y)-smooth integers far below (y), and their reciprocal mass is already linear in (\log n).

For Route B, the budget observation also has a real dynamic gap. If Shortener successfully plays a semiprime (pq), then every later multiple of (pq) is indeed forbidden. But if Prolonger first plays (pqr), then (pq) becomes illegal for Shortener because (pq\mid pqr); nevertheless that earlier move does **not** block a later move (pqs) with (s\neq r), since

[
pqr\nmid pqs,\qquad pqs\nmid pqr.
]

Thus a preempted semiprime is not equivalent to an installed semiprime blocker. Any proof of Route B would need a separate argument controlling the future families left open by such preemptions. The static Lemma A cannot provide that control, because the relevant harmonic mass is too large.

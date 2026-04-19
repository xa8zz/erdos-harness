# Round 14 Pro #2 — L(n) ≤ 0.22002n via probabilistic sieve + refined Chebyshev

The tightest upper bound I can make rigorous from the prefix/probabilistic-sieve line is

[
\boxed{L(n)\le (\kappa+o(1))n}
]

where

[
\kappa=\frac12,\mathcal V
]

and

[
\mathcal V
==========

\sum_{r=0}^{\infty}(-1)^r I_r,
\qquad
I_0=1,
]

[
I_r
===

\frac1{r!}
\int_{\substack{u_1,\ldots,u_r\ge 0\ u_1+\cdots+u_r\le 1}}
\prod_{i=1}^r \frac{du_i}{1+u_i}
\qquad (r\ge 1).
]

Numerically,

[
\mathcal V\approx 0.44003,
\qquad
\boxed{\kappa\approx 0.22002.}
]

So the proved bound is

[
\boxed{L(n)\le (0.22002\ldots+o(1))n.}
]

This improves the (5n/16=0.3125n) Bonferroni bound, and also improves the heuristic (e^{-1/2}n/2\approx 0.3033n). The key point is that the crude (s=1/2) prefix analysis loses information: one should keep track of the logarithmic mass already consumed by Shortener’s previously played primes. That improves the guaranteed reciprocal profile from constant density (1/2) to density (1/(1+u)) on the logarithmic scale (p\approx n^u).

Here is the proof.

Let Shortener use the following deterministic strategy for a prefix of the game: whenever possible, play the smallest legal odd prime. Randomization is not needed for the strategy itself; the probabilistic part enters in the sieve analysis of the surviving odd parts.

Fix parameters (\lambda>1) and (\eta>0), and let

[
K=\left\lfloor \frac{n}{(2\lambda+\eta)\log n}\right\rfloor .
]

Shortener follows the smallest-legal-odd-prime rule for (K) of her own turns. Let those odd primes be

[
q_1<q_2<\cdots<q_K.
]

The first lemma is the refined replacement for the crude estimate (q_j\le A j\log n).

**Lemma 1: refined prefix bound.** For every fixed (\varepsilon>0), uniformly for (1\le j\le K),

[
q_j
\le
(1+\varepsilon)j(\log n+\log j+O(\log\log n)).
]

In particular, for (j=n^{u+o(1)}) with (0\le u\le 1),

[
q_j\le (1+\varepsilon+o(1))(1+u)j\log n.
]

Proof. Suppose Shortener is about to play her (j)-th odd prime. Prolonger has made (j) moves and Shortener has already played (q_1,\ldots,q_{j-1}). If every odd prime (p\le Q) is illegal, then each such (p) either is one of the previous (q_i), or divides one of Prolonger’s (j) moves. Hence

[
\prod_{\substack{3\le p\le Q\ p\text{ prime}}}p
\le
n^j\prod_{i<j}q_i.
]

Taking logs gives

[
\vartheta(Q)+O(1)
\le
j\log n+\sum_{i<j}\log q_i.
]

Inductively assume

[
q_i\le (1+\varepsilon)i(\log n+\log i+C\log\log n)
]

for (i<j), with (C) large. Then

[
\sum_{i<j}\log q_i
\le
\sum_{i<j}\bigl(\log i+O(\log\log n)\bigr)
==========================================

j\log j+O(j\log\log n).
]

So

[
j\log n+\sum_{i<j}\log q_i
\le
j(\log n+\log j)+O(j\log\log n).
]

Taking

[
Q=(1+\varepsilon)j(\log n+\log j+C\log\log n)
]

and using (\vartheta(Q)\sim Q), the left side is eventually larger than the right side. Thus not all odd primes (\le Q) can be illegal, and the smallest legal odd prime satisfies (q_j\le Q). ∎

This already shows the improvement over the (1/2)-mass proof. Summing reciprocals from the lemma gives

[
\sum_{j\le K}\frac1{q_j}
\ge
(1-o(1))
\sum_{j\le K}\frac1{j(\log n+\log j)}
=====================================

(1-o(1))\log 2.
]

So the true guaranteed prefix reciprocal mass from this accounting is (\log 2), not merely (1/2). But the final antichain count is not governed just by (e^{-\log 2}=1/2), because primes near (n^u) have product constraints. One needs the actual logarithmic sieve profile.

Now use the odd-part injection. For any integer (x), define

[
\phi(x)=\frac{x}{2^{v_2(x)}}.
]

If (A) is an antichain, then (\phi) is injective on (A): two numbers with the same odd part lie on the same chain (m,2m,4m,\ldots), so one divides the other.

Since (q_1,\ldots,q_K\in A), no other final element of (A) may be divisible by any (q_j). Therefore, for the final antichain,

[
|A|
\le
K+
N(q_1,\ldots,q_K),
]

where

[
N(q_1,\ldots,q_K)
=================

#{m\le n:\ m\text{ odd and }q_j\nmid m\text{ for every }j\le K}.
]

Since (K=o(n)), it remains to bound (N).

The next ingredient is a monotonicity/compression observation.

**Lemma 2: replacing selected primes by larger primes can only increase the survivor count.** Let (R) be a set of odd primes, and let (p<q) be odd primes not in (R). Then

[
#{m\le n:\ m\text{ odd},\ (m,R\cup{p})=1}
\le
#{m\le n:\ m\text{ odd},\ (m,R\cup{q})=1}.
]

Indeed, among the (R)-free odd integers, multiples of (q) inject into multiples of (p) by (qa\mapsto pa). So adding the smaller prime removes at least as many survivors. Replacing primes one at a time from largest to smallest gives the coordinatewise version: if (p_j\le b_j) for two increasing prime sequences, then avoiding the (p_j)’s leaves no more odd survivors than avoiding the (b_j)’s. ∎

Fix a small (\delta>0). Ignore the first (J=\lceil n^\delta\rceil) Shortener primes; ignoring them can only weaken the bound. For (J<j\le K), compare (q_j) to a model sequence of larger primes (b_j) with

[
b_j=(\lambda+o(1))j(\log n+\log j).
]

Such a sequence exists by the prime number theorem, for (j\ge n^\delta). Choosing (\lambda>1) and then (n) large ensures

[
q_j\le b_j
]

for all (J<j\le K). Hence Lemma 2 gives

[
N(q_1,\ldots,q_K)
\le
N(B_{\lambda,\delta}),
]

where (B_{\lambda,\delta}={b_j:J<j\le K}).

Now estimate (N(B_{\lambda,\delta})) probabilistically. Let (M) be a uniformly random odd integer (1\le M\le n), and let

[
X=#{p\in B_{\lambda,\delta}:p\mid M}.
]

Then

[
\frac{N(B_{\lambda,\delta})}{n/2}
=================================

\mathbb P(X=0)+o(1).
]

For (p=b_j), write

[
u=\frac{\log j}{\log n}.
]

Then (p=n^{u+o(1)}), and

[
\frac1p
=======

(1+o(1))\frac1{\lambda(1+u)j\log n}.
]

Thus, on the logarithmic scale (u\in[\delta,1]), the reciprocal prime measure converges to

[
\frac{du}{\lambda(1+u)}.
]

For fixed (r), the (r)-th factorial moment of (X) is

[
\mathbb E\binom Xr
==================

\sum_{\substack{p_1<\cdots<p_r\in B_{\lambda,\delta}\p_1\cdots p_r\le n}}
\frac1{p_1\cdots p_r}
+o(1).
]

The condition (p_1\cdots p_r\le n) becomes

[
u_1+\cdots+u_r\le 1.
]

Therefore

[
\mathbb E\binom Xr
\to
\frac1{r!}
\int_{\substack{u_1,\ldots,u_r\in[\delta,1]\ u_1+\cdots+u_r\le 1}}
\prod_{i=1}^r \frac{du_i}{\lambda(1+u_i)}.
]

Because every (p\in B_{\lambda,\delta}) is at least (n^\delta), an integer (M\le n) has at most (\lfloor1/\delta\rfloor) prime factors from (B_{\lambda,\delta}). Hence inclusion-exclusion is finite and exact:

[
\mathbb P(X=0)
==============

\sum_{r=0}^{\lfloor1/\delta\rfloor}
(-1)^r\mathbb E\binom Xr.
]

So

[
\limsup_{n\to\infty}\frac{N(B_{\lambda,\delta})}{n/2}
\le
\mathcal V_{\lambda,\delta},
]

where

[
\mathcal V_{\lambda,\delta}
===========================

\sum_{r=0}^{\lfloor1/\delta\rfloor}
(-1)^r
\frac1{r!}
\int_{\substack{u_1,\ldots,u_r\in[\delta,1]\u_1+\cdots+u_r\le 1}}
\prod_{i=1}^r\frac{du_i}{\lambda(1+u_i)}.
]

Letting first (\delta\downarrow 0) and then (\lambda\downarrow 1), this tends to

[
\mathcal V
==========

\sum_{r=0}^{\infty}(-1)^r
\frac1{r!}
\int_{\substack{u_1,\ldots,u_r\ge0\u_1+\cdots+u_r\le1}}
\prod_{i=1}^r\frac{du_i}{1+u_i}.
]

Therefore

[
|A|
\le
K+N(q_1,\ldots,q_K)
\le
o(n)+\frac n2(\mathcal V+o(1)).
]

Thus

[
L(n)\le \left(\frac{\mathcal V}{2}+o(1)\right)n.
]

Numerically, the first few terms of (\mathcal V) are

[
\mathcal V
==========

1-\log2+0.1472206769\ldots
-0.0148863467\ldots
+0.00087448\ldots
-\cdots,
]

giving

[
\mathcal V\approx 0.44003,
\qquad
\frac{\mathcal V}{2}\approx 0.22002.
]

So the final bound is

[
\boxed{L(n)\le (0.22002\ldots+o(1))n.}
]

I do not see a sound route from the randomized-prefix idea alone to (o(n)). Randomizing the future order of primes does not remove the basic online product-budget obstruction: after (j) Prolonger moves and (j-1) Shortener prime moves, the primes made illegal have total logarithmic budget at most roughly

[
j\log n+\sum_{i<j}\log q_i.
]

The proof above uses that budget essentially sharply. To go below the (0.22002n) constant, I would expect one needs a genuinely different ingredient, probably involving composites or a structural domination argument rather than only prime-prefix sieving.

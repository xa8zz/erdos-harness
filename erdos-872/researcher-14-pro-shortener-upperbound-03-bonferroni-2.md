---
id: R14-pro-3-bonferroni-2
type: research
date: 2026-04-18
intent: >
  Prove a simpler (slightly weaker) upper bound on L(n) using second-order
  Bonferroni with the tighter constraint that prime products qr <= n.
predecessors: []
siblings: [R14-pro-1-log-density, R14-pro-2-probabilistic-sieve, R14-pro-4-infinity-bonferroni-flawed, R14-pro-5-randomized-martingale, R14-pro-6-mwu-revisits]
action:
  kind: standalone
claim: >
  L(n) <= (C + o(1))n where C = 0.2270367... via second-order Bonferroni
  with the sharper prime-bound q_j <= (1+o(1)) j(log n + log j) and the
  constraint q_r <= n imposed on paired terms.
---

# Round 14 Pro #3 — L(n) ≤ 0.22704n via second-order Bonferroni + qr ≤ n constraint (simpler, slightly weaker)

I can establish the following stronger linear upper bound:

[
\boxed{
L(n)\le \left(C+o(1)\right)n
}
]

where

[
C=\frac12\left(1-\log 2+\frac12\int_0^1\frac{\log(2-u)}{1+u},du\right)
=0.2270367481996479\ldots .
]

This improves the (5/16=0.3125) bound from the supplied notes. The improvement comes from two refinements: first, the (j)-th legal odd prime available to Shortener is bounded by roughly (j(\log n+\log j)), not merely (2j\log n); second, in the second-order Bonferroni term one only counts prime pairs whose product is at most (n).

Here is the proof.

Let Shortener use the following prefix strategy. For the first

[
k=\left\lfloor (1-\varepsilon)\frac{n}{2\log n}\right\rfloor
]

Shortener turns, he plays the smallest legal odd prime. If the game ends before then, the total number of moves is (O(n/\log n)=o(n)), so there is nothing to prove. Let the primes Shortener obtains be

[
D={q_1<q_2<\cdots<q_k}.
]

Before Shortener’s (j)-th move, Prolonger has moved (j) times and Shortener has already played (q_1,\dots,q_{j-1}). If an odd prime (p<q_j) is illegal, then (p) divides some previously played number. Hence

[
\vartheta(q_j)
\le j\log n+\sum_{i<j}\log q_i+O(1),
]

where (\vartheta(x)=\sum_{p\le x}\log p). A crude first pass gives (q_i\ll i\log n), and therefore

[
\sum_{i<j}\log q_i
\le \sum_{i<j}\left(\log i+O(\log\log n)\right)
= j\log j+O(j\log\log n).
]

Using (\vartheta(x)\sim x), uniformly for (j\le k),

[
q_j\le (1+o(1)),j(\log n+\log j).
]

More precisely, for every fixed (\eta>0),

[
q_j\le (1+\eta)j(\log n+\log j)
]

for all relevant (j), once (n) is large. In particular, the prefix strategy is feasible up to (k=(1-\varepsilon)n/(2\log n)), because then (q_k<n).

Now fix a small (\alpha>0). For (a\in[\alpha,1]), at most (\pi(n^a)) primes of (D) can be (\le n^a). Therefore the reciprocal mass of primes of (D) above (n^a) satisfies

[
\sum_{\substack{q_j\in D\ q_j>n^a}}\frac1{q_j}
\ge
\sum_{j>\pi(n^a)}\frac{1+o(1)}{j(\log n+\log j)}
================================================

\int_a^1\frac{du}{1+u}+o(1).
]

This is the key refinement. The old (2j\log n) estimate only gives density (du/2); the sharper estimate gives density (du/(1+u)).

Let

[
W_\alpha(a)=\int_\alpha^a\frac{du}{1+u}
=\log\frac{1+a}{1+\alpha}.
]

Choose (E\subseteq D\cap(n^\alpha,n]) to be the largest primes of (D) until

[
\sum_{q\in E}\frac1q
====================

# W_\alpha(1)+o(1)

\log\frac2{1+\alpha}+o(1).
]

This is possible because the reciprocal mass of (D\cap(n^\alpha,n]) is at least (W_\alpha(1)+o(1)), and every selected prime is (>n^\alpha), so the overshoot is (o(1)).

Because (E) is chosen as a largest-prime suffix, for every (a\in[\alpha,1]),

[
\sum_{\substack{q\in E\ q\le n^a}}\frac1q
\le
W_\alpha(a)+o(1).
]

Let

[
P(E)=
\sum_{\substack{q<r\ q,r\in E\ qr\le n}}\frac1{qr}.
]

For a prime (q\in E), write (u_q=\log q/\log n). Then the reciprocal mass of primes (r\in E) with (r\le n/q) is at most

[
W_\alpha(1-u_q)+o(1).
]

Thus

[
2P(E)
\le
\sum_{q\in E}\frac1q,W_\alpha(1-u_q)+o(1).
]

Since the distribution function of (E) is dominated by (W_\alpha), and (u\mapsto W_\alpha(1-u)) is decreasing, the last sum is maximized when the mass saturates the bound (dW_\alpha(u)=du/(1+u)). Hence

[
2P(E)
\le
\int_\alpha^{1-\alpha}
\frac{1}{1+u}
\log\frac{2-u}{1+\alpha},du
+o(1).
]

Now consider the final antichain (A). The odd-part map

[
\phi(x)=\frac{x}{2^{v_2(x)}}
]

is injective on antichains: if two different elements have the same odd part, then they differ by a power of (2), so one divides the other.

Also, if (q\in E), then no element of (A\setminus E) is divisible by (q), because (q) itself was played by Shortener. Therefore

[
\phi(A\setminus E)
\subseteq
{m\le n:\ m\text{ odd and }q\nmid m\ \forall q\in E}.
]

The exceptional set (E) has size (O(n/\log n)=o(n)), so it is negligible.

By second-order Bonferroni,

[
#{m\le n:\ m\text{ odd},\ q\nmid m\ \forall q\in E}
\le
\frac n2
\left(
1-\sum_{q\in E}\frac1q
+
\sum_{\substack{q<r\q,r\in E\qr\le n}}\frac1{qr}
\right)
+o(n).
]

The (o(n)) error is harmless: the singleton floor errors contribute (O(|E|)=o(n)), and the number of semiprime products (qr\le n) is (o(n)).

Substituting the bounds above gives

[
|A|
\le
\frac n2
\left[
1-W_\alpha(1)
+\frac12
\int_\alpha^{1-\alpha}
\frac{1}{1+u}
\log\frac{2-u}{1+\alpha},du
\right]
+o(n).
]

Finally let (\alpha\downarrow0). Since

[
W_\alpha(1)\to \log2
]

and

[
\int_\alpha^{1-\alpha}
\frac{1}{1+u}
\log\frac{2-u}{1+\alpha},du
\to
\int_0^1\frac{\log(2-u)}{1+u},du,
]

we obtain

[
L(n)
\le
\frac n2
\left(
1-\log2
+\frac12\int_0^1\frac{\log(2-u)}{1+u},du
\right)
+o(n).
]

Numerically,

[
\frac12
\left(
1-\log2
+\frac12\int_0^1\frac{\log(2-u)}{1+u},du
\right)
=======

0.2270367481996479\ldots .
]

So the tightest upper bound I can establish from this line of reasoning is

[
\boxed{
L(n)\le (0.2270367482\ldots+o(1)),n.
}
]

This proof does not rely on the speculative infinite-order Bonferroni step. In fact, it improves the constant already at second order by using the sharper legal-prime estimate and by not charging pair intersections (qr>n), which cannot occur among integers (\le n).

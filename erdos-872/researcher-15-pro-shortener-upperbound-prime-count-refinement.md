# Round 15 Pro — L(n) ≤ 0.18969n via prime-count-per-range refinement

I found a strict constant improvement. It does **not** give sublinearity, but it pushes the current upper bound from

[
0.22002,n
]

down to about

[
0.18969,n.
]

The missing structural point is that the refined Chebyshev argument uses only Prolonger’s **total logarithmic budget**. It ignores the stronger fact that one Prolonger move cannot contain two primes (>n^{1/2}), cannot contain three primes (>n^{1/3}), cannot contain four primes (>n^{1/4}), and so on.

That gives a better captured-prime log-density than

[
\frac{du}{1+u}.
]

The improved density is

[
\rho(u),du
\qquad\text{where}\qquad
\rho(u)=\frac{1}{(\lfloor 1/u\rfloor+1)u},\quad 0<u\le 1.
]

Equivalently, for

[
\frac1{h+1}<u\le \frac1h,
]

we have

[
\rho(u)=\frac1{(h+1)u}.
]

This strictly dominates the old density on every interval away from the endpoints:

[
\frac1{(h+1)u} \ge \frac1{1+u},
]

because (hu\le 1), with strict inequality unless (u=1/h).

The resulting bound is

[
L(n)\le \left(\frac{\mathcal W}{2}+o(1)\right)n,
]

where

[
\mathcal W
==========

\sum_{r=0}^\infty (-1)^r J_r,
]

and

[
J_r
===

\frac1{r!}
\int_{\substack{u_1,\dots,u_r>0\ u_1+\cdots+u_r\le 1}}
\prod_{i=1}^r \rho(u_i),du_i.
]

Numerically,

[
\mathcal W \approx 0.37937,
]

so

[
\boxed{
L(n)\le (0.18969+o(1))n.
}
]

A conservative Bonferroni truncation already gives

[
\mathcal W <0.3795,
]

hence the clean stated bound

[
\boxed{
L(n)\le (0.190+o(1))n.
}
]

Here is the core lemma.

Let Shortener use the same opening strategy as before: on each of his first

[
K=\left\lfloor (1-\varepsilon)\frac{n}{2\log n}\right\rfloor
]

turns, play the smallest legal odd prime.

Fix

[
\frac1{h+1}<u\le \frac1h,
]

and put (X=n^u). Choose a small (\eta>0) with (u-\eta>1/(h+1)), and set (Y=n^{u-\eta}).

Before Shortener first plays a prime (>X), every odd prime in ((Y,X]) is either already selected by Shortener or divides one of Prolonger’s previous moves. But every Prolonger move is at most (n), so it can contain at most (h) distinct primes (>Y), since

[
Y^{h+1}=n^{(u-\eta)(h+1)}>n.
]

If (S(X)) is the number of Shortener-selected primes (\le X), then by that time Prolonger has made at most (S(X)+1) moves. Therefore

[
\pi(X)-\pi(Y)
\le
S(X)+h(S(X)+1).
]

Thus

[
S(X)
\ge
\frac{\pi(X)-\pi(Y)}{h+1}-O(1).
]

By the prime number theorem,

[
S(n^u)
\ge
(1-o(1))\frac{n^u}{(h+1)u\log n}.
]

This is exactly the model count corresponding to log-density

[
\rho(u),du=\frac{du}{(h+1)u}.
]

The old argument corresponds to the weaker total-log-budget condition

[
S(n^u)\gtrsim \frac{n^u}{(1+u)\log n}.
]

The new count is always at least as strong and is strictly stronger except at the breakpoints (u=1/h).

Now apply the same monotone-replacement and finite (\delta)-cutoff inclusion-exclusion machinery from the supplied proof. The only change is replacing

[
\frac{du}{1+u}
]

by

[
\rho(u),du
==========

\frac{du}{(\lfloor 1/u\rfloor+1)u}.
]

The total mass is finite:

[
\int_0^1 \rho(u),du
===================

# \sum_{m=2}^\infty \frac1m\log\frac{m}{m-1}

0.788529\ldots,
]

so the dominated-convergence step is still harmless.

The first few inclusion-exclusion terms are approximately

[
\begin{aligned}
J_0&=1,\
J_1&=0.7885296,\
J_2&=0.1868163,\
J_3&=0.0200915,\
J_4&=0.0012226.
\end{aligned}
]

Therefore the even Bonferroni partial sum gives the rigorous upper-side estimate

[
\mathcal W
\le
1-J_1+J_2-J_3+J_4
<
0.3795.
]

The full convolution evaluation gives

[
\mathcal W=0.37937\ldots,
]

and hence

[
\frac{\mathcal W}{2}=0.18968\ldots.
]

So the sharpened upper bound is

[
\boxed{
L(n)\le (0.18969+o(1))n,
}
]

or, with a comfortable numerical margin,

[
\boxed{
L(n)\le (0.190+o(1))n.
}
]

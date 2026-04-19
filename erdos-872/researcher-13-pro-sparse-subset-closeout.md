# Sparse-subset closeout — rigorous proof (2026-04-18, fresh Pro dispatch from canonical-prompt.md)

**Result.** Sub-question (c) resolved affirmatively: there exists $S \subseteq \mathcal{E}$ with $|S| = O_{\beta,\gamma}(n/\log n)$ that isolates $\gg_{\beta,\gamma} n \log\log n / \log n$ distinct residual moves. Construction: three-family union $S_{QA} \cup S_{AB} \cup S_{QB}$ over $A = \{$odd primes $\le n^\delta\}$ with $\delta < \min(\beta, (1-\gamma)/2)$. Size bounds: $|S_{QA}|, |S_{AB}| = o(n/\log n)$; $|S_{QB}| = O(n/\log n)$ is the dominant term. Residual count by Mertens on $H_Q \cdot \log\log n$. Isolation via Circuit Lemma.

Converts the post-hoc obstruction from "partial (empirically confirmed, sparse-subset gap open)" to **rigorous under the $O(n/\log n)$ hypothesis**. The only remaining question is online reachability: can Prolonger force $S$ to be installed against optimal Shortener.

---

I can close the analytic sparse-subset gap **affirmatively**. This does **not** by itself settle the online reachability half of the game, but it removes the main “maybe the obstruction is too large to matter” escape route.

Here is the precise statement.

**Theorem — sparse post-hoc obstruction.**
Fix (0<\beta<\gamma<1/2), and let (Q) be any set of primes in ([n^\beta,n^\gamma]) with

[
H_Q:=\sum_{q\in Q}\frac1q \gg_{\beta,\gamma} 1 .
]

Then there is a subset

[
S\subseteq \mathcal E={2uv:u,v\text{ odd distinct primes},\ 2uv\le n}
]

with

[
|S|=O_{\beta,\gamma}!\left(\frac n{\log n}\right)
]

such that, after (S) is installed, it isolates

[
\gg_{\beta,\gamma} \frac{n\log\log n}{\log n}
]

distinct moves of the form

[
m=qab,\qquad q\in Q,\quad a,b\text{ odd distinct primes},\quad n/3<m\le n .
]

So sub-question **(c)** has answer **yes**. The empirical sparse-cover phenomenon is not a finite-size illusion.

Choose

[
0<\delta<\min{\beta,(1-\gamma)/2},
]

and let

[
A:={a\le n^\delta:a\text{ odd prime}}.
]

For (q\in Q), (a\in A), define the prime interval

[
I(q,a):=\left(\frac{n}{3qa},\frac{n}{qa}\right].
]

Now define three carrier families:

[
S_{QA}:={2qa:q\in Q,\ a\in A},
]

[
S_{AB}:={2ab:a\in A,\ b\text{ prime},\ b\in I(q,a)\text{ for some }q\in Q},
]

[
S_{QB}:={2qb:q\in Q,\ b\text{ prime},\ b\in I(q,a)\text{ for some }a\in A,\ b\ne q}.
]

Let

[
S:=S_{QA}\cup S_{AB}\cup S_{QB}.
]

All elements of (S) lie in (\mathcal E). Indeed, (2qa\le 2n^{\gamma+\delta}<n), since (\delta<1-\gamma). If (b\in I(q,a)), then (qab\le n), so (2ab\le 2n/q\le 2n^{1-\beta}<n), and also (2qb\le 2n/a\le 2n/3<n).

Now estimate the three sizes.

First,

[
|S_{QA}|\le \pi(n^\gamma)\pi(n^\delta)
=O!\left(\frac{n^{\gamma+\delta}}{(\log n)^2}\right)
=o!\left(\frac n{\log n}\right).
]

Second, for fixed (a\in A), if (b) appears in (S_{AB}), then (b\le n/(a n^\beta)). Hence

[
|S_{AB}|
\ll \sum_{a\in A}\frac{n^{1-\beta}}{a\log n}
\ll \frac{n^{1-\beta}\log\log n}{\log n}
=o!\left(\frac n{\log n}\right).
]

Third, for fixed (q\in Q), if (b) appears in (S_{QB}), then (b\le n/(3q)). Thus

[
|S_{QB}|
\ll \sum_{q\in Q}\frac{n}{q\log(n/q)}
\ll_{\gamma}\frac n{\log n}\sum_{q\in Q}\frac1q
=O_{\beta,\gamma}!\left(\frac n{\log n}\right).
]

Therefore

[
|S|=O_{\beta,\gamma}!\left(\frac n{\log n}\right).
]

Now count the residual moves produced by this sparse carrier family.

For every triple

[
(q,a,b),\qquad q\in Q,\quad a\in A,\quad b\in I(q,a)\text{ prime},\quad b\ne q,
]

we have

[
n/3<qab\le n.
]

Also, because (b\in I(q,a)), the three carriers

[
2qa,\qquad 2ab,\qquad 2qb
]

all belong to (S).

For each fixed (q,a), put (X=n/(qa)). Since (q\le n^\gamma) and (a\le n^\delta),

[
X\ge n^{1-\gamma-\delta}\to\infty .
]

By the prime number theorem on the fixed-ratio interval ((X/3,X]),

[
#{b\text{ prime}:b\in I(q,a)}
\gg_{\beta,\gamma,\delta}\frac{X}{\log n}
=\frac{n}{qa\log n}.
]

Summing over (q\in Q) and (a\in A),

[
#{(q,a,b)}
\gg
\frac n{\log n}
\left(\sum_{q\in Q}\frac1q\right)
\left(\sum_{a\in A}\frac1a\right).
]

By Mertens,

[
\sum_{a\in A}\frac1a
====================

(1+o(1))\log\log n,
]

and by assumption (H_Q=\sum_{q\in Q}1/q\gg 1). Hence

[
#{(q,a,b)}
\gg_{\beta,\gamma}
\frac{n\log\log n}{\log n}.
]

The same integer (m=qab) can arise from at most (6) ordered assignments of its three prime factors to the labels (q,a,b). The exceptional cases (b=q) contribute only

[
O(|Q||A|)
=O!\left(\frac{n^{\gamma+\delta}}{(\log n)^2}\right)
=o!\left(\frac{n\log\log n}{\log n}\right),
]

so the number of distinct residual integers (m=qab) is still

[
\gg_{\beta,\gamma}
\frac{n\log\log n}{\log n}.
]

It remains to verify isolation.

Fix one such

[
m=qab,\qquad T={q,a,b}.
]

The three pair-carriers

[
2qa,\quad 2qb,\quad 2ab
]

are in (S). Every carrier in (S) contains the prime (2), while (T) does not. Therefore (T) is incomparable with every carrier support in (S). Every proper subset of (T) is contained in one of the three supports

[
{2,q,a},\qquad {2,q,b},\qquad {2,a,b}.
]

So (T) is a legal circuit in the sense of the Circuit Lemma. Hence (m=qab) is legal after (S) is installed, and every legal move comparable with (m) must be a multiple of (m).

But (m>n/3). Therefore the only possible proper multiple of (m) below (n) is (2m). That move is illegal, since

[
2qa\mid 2qab=2m.
]

Thus (m) is an isolated maximal legal move.

So the sparse-subset obstruction is now rigorous: only (O(n/\log n)) carriers are needed to force (\gg n\log\log n/\log n) isolated residual moves, provided those carriers can be installed.

What this changes:

The analytic gap in the post-hoc obstruction is gone. Any proof of

[
L(n)=O(n/\log n)
]

cannot dismiss the obstruction by saying that (\mathcal E) is too large. A sparse (\mathcal E)-subfamily already suffices.

The remaining issue is purely online and strategic: can Shortener prevent Prolonger from installing enough of this sparse triangle-carrier graph? In graph language, the carriers (2uv) are edges (uv) on odd primes, and each completed triangle ((q,a,b)) creates the isolated move (qab). Shortener’s disruption moves act like vertex deletions, edge deletions, and some product-constrained multi-edge deletions. The central dichotomy is therefore sharpened to this online triangle-prevention problem.

So the current rigorous advance is:

[
\boxed{\text{sub-question (c) is yes.}}
]

Consequently, the only remaining obstruction to proving the lower rate

[
L(n)\ge c,\frac{n\log\log n}{\log n}
]

is reachability of such sparse carrier graphs under optimal Shortener play.

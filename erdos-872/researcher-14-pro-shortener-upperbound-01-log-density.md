# Round 14 Pro #1 — L(n) ≤ 0.2200145n via log-scale reciprocal density du/(1+u)

I can prove the following upper bound by sharpening the prime-prefix counting argument:

[
\boxed{,L(n)\le (\rho+o(1))n,}
]

where

[
\rho=\frac12 F
]

and

[
F=\sum_{k=0}^{\infty}\frac{(-1)^k}{k!}
\int_{\substack{u_1,\ldots,u_k\ge 0\ u_1+\cdots+u_k\le 1}}
\prod_{j=1}^k \frac{du_j}{1+u_j}.
]

Numerically,

[
F=0.440029\ldots,\qquad
\boxed{\rho=0.2200145\ldots}
]

So the bound is

[
\boxed{L(n)\le (0.220015+o(1))n.}
]

This improves the (5n/16=0.3125n) Bonferroni-2 bound and also improves the coarser (e^{-1/2}n/2\approx 0.303265n) bound. The improvement comes from not charging every captured Shortener prime as if it had size (n). The actual information cost of a captured prime (q) is (\log q), giving a log-scale density (du/(1+u)), not the cruder uniform density (du/2).

Here is the proof.

Let (\ell=\log n). Shortener uses the following strategy for her first

[
T=\left\lfloor \frac{(1-\varepsilon)n}{2\ell}\right\rfloor
]

moves, where (\varepsilon>0) is fixed and later tends to (0): she plays the smallest legal odd prime.

Write these primes as

[
q_1<q_2<\cdots<q_T.
]

If the game ends before Shortener has made these (T) moves, then the total number of moves is (O(n/\log n)=o(n)), which is already stronger than the desired bound. So assume the prime phase is completed.

First, the legal-prime phase really can be completed. Before Shortener’s (i)-th move, Prolonger has made (i) moves. If there were no legal odd prime, then every odd prime (p\le n) would either already have been played by Shortener or would divide one of Prolonger’s (i) moves. Hence

[
\sum_{\substack{3\le p\le n\ p\ \mathrm{prime}}}\log p
\le i\ell+\sum_{j<i}\log q_j
\le 2i\ell
\le (1-\varepsilon)n,
]

contradicting (\sum_{p\le n}\log p=(1+o(1))n). Thus Shortener can indeed keep playing legal odd primes for (T) turns.

Now fix (i\le T). Since (q_i) is the smallest legal odd prime at Shortener’s (i)-th move, every odd prime (p<q_i) is either one of (q_1,\ldots,q_{i-1}), or divides one of Prolonger’s first (i) moves. Including (q_i) itself gives

[
\sum_{p\le q_i}\log p
\le i\ell+\sum_{j\le i}\log q_j.
]

Since (q_j\le q_i) for (j\le i),

[
\sum_{p\le q_i}\log p
\le i(\ell+\log q_i).
]

Using the prime number theorem in the form (\sum_{p\le x}\log p=(1+o(1))x), we obtain

[
q_i\le (1+o(1)),i(\ell+\log q_i).
]

Equivalently, for every fixed (\lambda>1) and all sufficiently large (n),

[
\frac{q_i}{\ell+\log q_i}\le \lambda i.
\tag{1}
]

Let (y_i) be defined by

[
\frac{y_i}{\ell+\log y_i}=\lambda i.
]

Then (1) implies (q_i\le y_i). By the prime number theorem, we may choose distinct odd primes (r_i\ge y_i) with

[
r_i=(1+o(1))y_i
]

uniformly for (1\le i\le T), provided (\lambda(1-\varepsilon)<1). This is why we keep (\varepsilon) slightly larger than (\lambda-1), and later send both to (0).

Now use a monotonicity fact.

For a finite set (P) of odd primes, let

[
S_P(x)=#{m\le x:m\ \text{odd and }p\nmid m\text{ for every }p\in P}.
]

If (p<q) are odd primes not in (P), then

[
S_{P\cup{p}}(n)
=S_P(n)-S_P(n/p)
\le S_P(n)-S_P(n/q)
=S_{P\cup{q}}(n),
]

because (S_P(x)) is nondecreasing in (x). Thus replacing a sieving prime by a larger prime can only increase the number of surviving odd integers. Replacing (q_T,q_{T-1},\ldots,q_1) successively by (r_T,r_{T-1},\ldots,r_1), we get

[
S_{{q_1,\ldots,q_T}}(n)
\le
S_{{r_1,\ldots,r_T}}(n).
\tag{2}
]

So it remains to count the odd integers surviving the comparison primes (r_i).

The defining relation

[
\frac{r_i}{\ell+\log r_i}\sim \lambda i
]

means that the reciprocal mass of the (r_i)’s has the following log-scale limit. If

[
u_i=\frac{\log r_i}{\ell},
]

then

[
\sum_i \frac1{r_i},\delta_{u_i}
\Longrightarrow
\frac{du}{\lambda(1+u)}
\qquad (0\le u\le 1).
]

Indeed, differentiating (i\sim r/(\lambda(\ell+\log r))) gives

[
\frac{di}{r}
\sim \frac{dr}{\lambda r(\ell+\log r)}
=\frac{du}{\lambda(1+u)}.
]

Now apply inclusion-exclusion. For fixed (k),

[
\sum_{\substack{i_1<\cdots<i_k\ r_{i_1}\cdots r_{i_k}\le n}}
\frac1{r_{i_1}\cdots r_{i_k}}
\to
\frac1{k!\lambda^k}
\int_{\substack{u_1,\ldots,u_k\ge 0\ u_1+\cdots+u_k\le 1}}
\prod_{j=1}^k \frac{du_j}{1+u_j}.
\tag{3}
]

The condition (r_{i_1}\cdots r_{i_k}\le n) becomes

[
u_1+\cdots+u_k\le 1.
]

The factor (1/k!) appears because the sum is over unordered (k)-subsets.

The floor errors in inclusion-exclusion are (o(n)) for each fixed (k): the number of squarefree (d\le n) with exactly (k) prime factors is (O_k(n(\log\log n)^{k-1}/\log n)=o(n)).

Thus, by the even Bonferroni inequality, for each fixed (K),

[
\frac{S_{{r_i}}(n)}{n/2}
\le
\sum_{k=0}^{2K}
\frac{(-1)^k}{k!\lambda^k}
\int_{\substack{u_1,\ldots,u_k\ge 0\ u_1+\cdots+u_k\le 1}}
\prod_{j=1}^k \frac{du_j}{1+u_j}
+o(1).
]

Letting (n\to\infty), then (K\to\infty), gives

[
S_{{r_i}}(n)
\le
\frac n2 F_\lambda+o(n),
]

where

[
F_\lambda=
\sum_{k=0}^{\infty}
\frac{(-1)^k}{k!\lambda^k}
\int_{\substack{u_1,\ldots,u_k\ge 0\ u_1+\cdots+u_k\le 1}}
\prod_{j=1}^k \frac{du_j}{1+u_j}.
]

Now let (\lambda\downarrow 1). We obtain

[
S_{{q_i}}(n)\le \frac n2 F+o(n),
]

where

[
F=F_1
=====

\sum_{k=0}^{\infty}
\frac{(-1)^k}{k!}
\int_{\substack{u_1,\ldots,u_k\ge 0\ u_1+\cdots+u_k\le 1}}
\prod_{j=1}^k \frac{du_j}{1+u_j}.
]

Finally, use the odd-part compression. Let

[
\phi(x)=\frac{x}{2^{v_2(x)}}.
]

This map is injective on every divisibility antichain: two different integers with the same odd part differ by a power of (2), hence are comparable.

In the final antichain (A), every element outside ({q_1,\ldots,q_T}) has odd part coprime to every (q_i). Therefore

[
|A|
\le
T+
S_{{q_1,\ldots,q_T}}(n).
]

Since (T=O(n/\log n)=o(n)),

[
|A|
\le
\frac n2F+o(n).
]

This holds under Shortener’s explicit strategy, so under optimal play,

[
L(n)\le \frac F2,n+o(n).
]

Numerically,

[
F=0.440029\ldots,
]

so

[
\boxed{L(n)\le (0.2200145\ldots+o(1))n.}
]

This is the strongest upper bound I can establish from the prime-prefix, entropy/log-budget, and inclusion-exclusion counting framework. I would not claim it is the true asymptotic order of (L(n)); the known lower bound remains far smaller.

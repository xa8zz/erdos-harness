# Audit of Pro #2 probabilistic-sieve proof — ChatGPT (corrected paste)

## assistant

My read: the proof is **promising but not publication-rigorous as written**. I do **not** see a fatal break in Lemma 2, the finite inclusion-exclusion identity, or the order-of-limits step once one writes the domination carefully. The weakest link is the passage

discrete model primes (\to) factorial moments (\to) limiting alternating simplex series (\to) the decimal (0.44003\ldots),

because that part is compressed too much and several uniformity/error claims are only implicit.

Here is the pressure test.

1. Lemma 1: refined prefix bound

This is **not obviously false**, but the proof as written is too hand-wavy.

The key inequality
[
\prod_{3\le p\le Q} p \le n^j\prod_{i<j} q_i
]
is legitimate: before Shortener’s (j)-th odd-prime move, each odd prime (p\le Q) is illegal only if either (p=q_i) for some prior Shortener prime, or (p\mid x) for some Prolonger move (x\le n). Since prior Shortener moves in the prefix are themselves odd primes, there is no missing “composite Shortener divisor” case.

The real issue is the induction closure. The proof writes
[
\sum_{i<j}\log q_i\le \sum_{i<j}(\log i+O(\log\log n))
= j\log j+O(j\log\log n),
]
but this suppresses several things that need to be explicit:

* the constant in the (O(\log\log n)) term must be **uniform** in (i\le K),
* it must depend only on (\varepsilon), not on (n) or (j),
* and one needs a uniform lower bound for (\vartheta(Q)), not just a vague use of (\vartheta(Q)\sim Q).

That said, after expansion,
[
\log q_i \le \log i + \log(\log n+\log i + C\log\log n) + O_\varepsilon(1),
]
and for (i\le K\ll n/\log n), the second term is (\le \log\log n + O(1)). So
[
\sum_{i<j}\log q_i \le \log((j-1)!)+j\log\log n+O_\varepsilon(j)
= j\log j + j\log\log n + O_\varepsilon(j).
]
Then choosing
[
Q=(1+\varepsilon')j(\log n+\log j + C_\varepsilon\log\log n)
]
with (\varepsilon'>\varepsilon) and (C_\varepsilon) large, the main term (\varepsilon'j(\log n+\log j)) swamps the (O(j\log\log n)) error. So the lemma looks **repairable**, but the proof needs to say this, not merely hint at it.

Verdict on (1): **probably salvageable, but not rigorous as written**.

2. Lemma 2: monotone replacement

This one is basically fine.

Let
[
S_R={m\le n:\ m\text{ odd},\ (m,R)=1}.
]
Among (S_R), the deleted set from adding (q) is
[
D_q={qa\le n:\ qa\in S_R}.
]
If (qa\in S_R), then (a) is odd and ((a,R)=1). Since (p,q\notin R) and (p<q),
[
pa \le qa \le n,
]
and (pa) is still odd and coprime to (R). So (qa\mapsto pa) sends (D_q) injectively into (D_p). Therefore adding (p) deletes at least as many (R)-free odd integers as adding (q).

There is no hidden coprimality bug: if (qa) is coprime to every (r\in R), then so is (a), hence so is (pa).

Verdict on (2): **sound**.

3. Log-scale reciprocal measure and endpoint limits

For fixed (\lambda>1), fixed (\delta>0), and fixed (r), the passage to
[
\frac{du}{\lambda(1+u)}
]
is credible.

If (j=n^{u+o(1)}), then by construction
[
b_j=(\lambda+o(1))j(\log n+\log j)
=(\lambda+o(1))(1+u)j\log n,
]
hence
[
\frac1{b_j}
=(1+o(1))\frac1{\lambda(1+u)j\log n}.
]
With (dj/j \sim (\log n),du), the sums over (j) become Riemann sums in (u).

The part that needed checking is whether (\delta\downarrow0) and (\lambda\downarrow1) can be moved past the alternating inclusion-exclusion series. They can, provided you write down a summable majorant:
[
0\le I_{r,\lambda,\delta}
\le \frac1{r!}\left(\int_\delta^1 \frac{du}{\lambda(1+u)}\right)^r
\le \frac{(\log 2)^r}{r!}.
]
Since (\sum_r (\log 2)^r/r! = e^{\log 2}=2), dominated convergence applies termwise.

Verdict on (3): **okay once domination is written explicitly**.

4. Exact finite inclusion-exclusion for (p\ge n^\delta)

This is correct.

If every selected prime satisfies (p\ge n^\delta), then any (M\le n) has at most (\lfloor 1/\delta\rfloor) **distinct** prime divisors from that set, because
[
(n^\delta)^{\omega_B(M)} \le M \le n.
]
So (X\le \lfloor1/\delta\rfloor) almost surely, and
[
1_{{X=0}}=(1-1)^X=\sum_{r=0}^{\lfloor1/\delta\rfloor}(-1)^r\binom{X}{r}
]
pointwise. Taking expectations gives exact inclusion-exclusion, not just Bonferroni.

Verdict on (4): **sound**.

5. Factorial moment limit

This is where the proof is right in spirit but too terse.

For fixed (r),
[
\mathbb E\binom{X}{r}
=====================

\sum_{p_1<\cdots<p_r\in B_{\lambda,\delta}}
\mathbb P(p_1\cdots p_r\mid M).
]
Since (M) is uniform on odd integers (\le n), for odd squarefree (d\le n),
[
\mathbb P(d\mid M)=\frac1d+O!\left(\frac1n\right).
]
So
[
\mathbb E\binom{X}{r}
=====================

\sum_{\substack{p_1<\cdots<p_r\in B_{\lambda,\delta}\ p_1\cdots p_r\le n}}
\frac1{p_1\cdots p_r}

* O!\left(\frac{#\mathcal T_r}{n}\right),
  ]
  where (\mathcal T_r) is the set of admissible (r)-tuples. For fixed (r), (#\mathcal T_r=o(n)), so the total (O(1/n)) error is (o(1)).

The product constraint also needs a sentence:
[
p_i=(\lambda+o(1))(1+u_i)n^{u_i}\log n
\quad\Longrightarrow\quad
\log p_i = u_i\log n + O(\log\log n).
]
Hence, for fixed (r),
[
p_1\cdots p_r\le n
\iff
u_1+\cdots+u_r \le 1 + O!\left(\frac{r\log\log n}{\log n}\right),
]
so the simplex (\sum u_i\le1) is indeed the right limit region.

The proof should say explicitly that the error is only required **uniformly for (r\le 1/\delta)**, and that is harmless because (\delta) is fixed first.

Verdict on (5): **plausible and probably fixable, but this is one of the places where the proof still needs real work**.

6. Order of limits (n\to\infty), then (\delta\downarrow0), then (\lambda\downarrow1)

This part is fine once you add the domination above.

For each fixed ((\lambda,\delta)), inclusion-exclusion is finite, so there is no infinite-order issue at the (n\to\infty) stage. After that, the terms are absolutely dominated by ((\log2)^r/r!), so the (\delta\downarrow0) and (\lambda\downarrow1) limits can be exchanged with the series. In particular, the value
[
\mathcal V=\sum_{r\ge0}(-1)^r I_r
]
is well defined.

Verdict on (6): **sound after adding the missing dominated-convergence argument**.

7. Numerical series and tail bound

Two separate issues.

First, the **tail bound** is fine, and stronger than stated. Let
[
I_r(t):=\frac1{r!}\int_{\substack{u_1,\dots,u_r\ge0\u_1+\cdots+u_r\le t}}
\prod_{i=1}^r \frac{du_i}{1+u_i}.
]
Then (I_r=I_r(1)), and the convolution identity gives
[
I_r(1)=\frac1r\int_0^1 \frac{I_{r-1}(1-u)}{1+u},du
\le \frac{\log2}{r},I_{r-1}(1).
]
Since (\log2<1), the (I_r) are strictly decreasing for (r\ge1). So the alternating-series remainder is bounded by the first omitted term.

Second, the quoted decimals
[
I_1=\log2,\quad
I_2\approx 0.1472206769,\quad
I_3\approx 0.0148863467,\quad
I_4\approx 0.00087448,\dots
]
are **computational claims** and should be independently reproduced. I can verify analytically that
[
I_1=\log2,
]
and
[
I_2=\frac12\int_0^1 \frac{\log(2-u)}{1+u},du
= \frac12\Bigl(\log2,\log3+\operatorname{Li}_2(1/3)-\operatorname{Li}_2(2/3)\Bigr),
]
so the second term is at least reducible to a standard special-function evaluation. But the proof, as written, gives no reproducible computation for the later digits. Those need an external CAS or interval-arithmetic check.

Verdict on (7): **the Leibniz-style tail control is good; the decimal values still need independent verification**.

Bottom line

I do **not** think the proof collapses outright. The strongest criticism is:

* **Lemma 1 is underspecified but likely repairable.**
* **Lemma 2 and exact finite inclusion-exclusion are fine.**
* **The weakest link is the discrete-to-continuum factorial-moment passage plus the numerical evaluation.**

So I would not accept “(0.22002\ldots)” as rigorous yet. I would say the argument plausibly supports a constant around (0.22), but the proof still needs a careful writeup before that constant should be trusted.

On the literature side, this argument clearly sits near several known frameworks, but it is not a standard plug-in application of any one of them.

Granville and Soundararajan explicitly frame moment computations for prime divisors as a sieve-compatible method, starting from Erdős–Kac and extending to “more general sequences assuming sieve type hypotheses.” That is very close in spirit to the proof’s factorial-moment step. ([Math & Stats Département][1])

Ford’s 2022 paper is even closer methodologically: for disjoint prime sets (T_1,\dots,T_m) of “not too large” primes, he proves that the vector counting prime divisors from those sets converges to independent Poisson variables, using the Kubilius model. Your proof is not a direct application of Ford’s theorem, because the selected set (B_{\lambda,\delta}) reaches much larger primes and uses the extra product constraint (p_1\cdots p_r\le n), but it is plainly in the same probabilistic-number-theory family. ([Cambridge University Press & Assessment][2])

The proof also has a strong Buchstab/rough-numbers flavor. For rough numbers, (\Phi(x,y)) counts integers (\le x) with no prime factor (\le y), and Buchstab’s theorem gives (\Phi(x,y)\sim \omega(u)x/\log y) with (u=\log x/\log y). The appearance of log-scale variables and the simplex condition (\sum u_i\le1) is very much in that orbit. But your kernel (du/(1+u)) comes from a sparse, (n)-dependent subsequence of primes, so the resulting constant is not the classical Buchstab constant or a direct reproof of Buchstab’s theorem. 

By contrast, the Fundamental Lemma of sieve theory is usually stated for a sifted set (S(\mathcal A,z)) with multiplicative local density (g(d)) and type-I control on the remainders, leading to
[
S(\mathcal A,z)\approx #\mathcal A\prod_{p\le z}(1-g(p)).
]
That is not quite what is happening here. Your proof does not set up a standard Brun–Selberg sieve with a uniform (g(p)) over all primes up to (z); instead it uses a particular sparse prime set (B_{\lambda,\delta}), exact finite inclusion-exclusion, and then a continuum limit of the corresponding factorial moments. So it **connects to** the Fundamental Lemma tradition, but it is not a direct instance of it. ([Leiden Math Publications][3])

So the clean literature verdict is:

* **Connects to** probabilistic sieve theory, Kubilius-model heuristics, and factorial-moments methods. ([Math & Stats Département][1])
* **Adjacent to** Buchstab/rough-number asymptotics via the (\sum u_i\le1) geometry. 
* **Not a direct application** of the Fundamental Lemma or a standard Brun–Selberg upper-bound sieve. ([Leiden Math Publications][3])
* **No obvious contradiction** with existing literature. If valid, it would be a bespoke game-theoretic upper bound built from familiar sieve ingredients, not a contradiction to known sieve theory. ([Leiden Math Publications][3])

For the “independent derivation” note: if that derivation also goes through model primes and infinite-order inclusion-exclusion, then it shares the same two vulnerable spots: the discrete-to-continuum factorial-moment justification and the numerical constant extraction. It may avoid Lemma 2 if it never uses monotone replacement, but it does not escape the need for those limit and computation checks.

[1]: https://www.dms.umontreal.ca/~andrew/PDF/ErdosKac.pdf "https://www.dms.umontreal.ca/~andrew/PDF/ErdosKac.pdf"
[2]: https://www.cambridge.org/core/journals/mathematical-proceedings-of-the-cambridge-philosophical-society/article/joint-poisson-distribution-of-prime-factors-in-sets/524B1FAD27E09853C4A4444E8AEC0ED1 "Joint Poisson distribution of prime factors in sets | Mathematical Proceedings of the Cambridge Philosophical Society | Cambridge Core"
[3]: https://pub.math.leidenuniv.nl/~evertsejh/Fundamental%20Lemma.pdf "https://pub.math.leidenuniv.nl/~evertsejh/Fundamental%20Lemma.pdf"

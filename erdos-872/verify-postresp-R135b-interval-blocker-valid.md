---
id: R135b-interval-blocker-valid
type: verification
date: 2026-07-12
intent: >
  Second independent adversarial referee audit (same brief, separate
  thread) of the interval-blocker disproof of the static
  completion-modulus statement.
predecessors: [R133-static-modulus-refuted]
action:
  kind: confirms
  target: R133-static-modulus-refuted
claim: >
  Verdicts A VALID, B VALID, C VALID. The interval-blocker construction
  is correct (primitivity, the m < a < 2m legality sandwich, the
  every-proper-divisor-blocked argument, and the block-contains-a-
  multiple-of-every-d<k step all check including boundary cases); the
  count and the k = floor(3 alpha_n n) application are correct; the
  prime-anchor regime argument and the two-case subsequence split cover
  every eventually positive alpha_n -> 0 with no quantifier failure.
  The document gives a complete disproof of the static-modulus
  statement and a valid subsequential strengthening.
confidence_at_time: high
strategy_dependence: independent
prompt: erdos-872/prompts/audit-R135-interval-blocker-refutation.md
---

# Overall verdict

\[
\boxed{\textbf{A: VALID}\qquad \textbf{B: VALID}\qquad \textbf{C: VALID}}
\]

The interval-blocker construction is correct, the counting argument has sufficient error control, and the regime split is complete. Consequently,

\[
\boxed{\text{(SM) is false.}}
\]

No mathematical repair is required. 

## A. The blocker lemma

### Verdict A: **VALID**

Let \(N=\lfloor n/2\rfloor\) and

\[
P_{n,k}=\{N+1,\ldots,N+k\},\qquad k\le \frac n{10}.
\]

### Primitivity of the block

Every \(a\in P_{n,k}\) satisfies \(a>N\ge n/2-1\), and in fact \(a\ge N+1>n/2\). Also,

\[
N+k\le \frac n2+\frac n{10}=\frac{3n}{5}<n,
\]

so the block lies in \(\{2,\ldots,n\}\).

For \(a<b\) in the block,

\[
2a>n\ge b.
\]

Thus \(a\nmid b\); and \(b\nmid a\) is automatic from \(b>a>0\). Hence the block is primitive.

### Legality of \(m\in R_{n,k}\)

For every \(a\in P_{n,k}\),

\[
m\le \frac{2n}{5}<\frac n2<a.
\]

Meanwhile,

\[
a\le N+k\le\frac{3n}{5},
\]

and \(m>n/3\) gives

\[
2m>\frac{2n}{3}>\frac{3n}{5}\ge a.
\]

Therefore the strict sandwich is indeed

\[
m<a<2m.
\]

The left inequality rules out \(a\mid m\), and the right inequality rules out \(m\mid a\), because any multiple of \(m\) strictly larger than \(m\) is at least \(2m\). Thus \(m\) is legal.

There is no parity or floor problem here: \(N+1>n/2\) for both even and odd \(n\), and all other endpoint inequalities are strict in the required direction.

### Every proper divisor is below \(k\)

Let \(d\ge2\) be a proper divisor of \(m\), and put \(r=m/d>1\). Choose a prime \(q\mid r\). Then \(q\mid m\). Since \(m\) is coprime to

\[
W=\prod_{p\le Y}p,
\]

one has the strict inequality \(q>Y\). Also \(r\ge q\), so

\[
d=\frac mr\le\frac mq.
\]

Because \(q>Y>0\),

\[
\frac mq<\frac mY.
\]

Finally,

\[
\frac mY
\le
\frac{2n/5}{2n/(5k)}
=k.
\]

Combining these gives exactly

\[
d\le\frac mq<\frac mY\le k,
\]

and hence

\[
d<k.
\]

The strictness comes from \(q>Y\); it survives even in the endpoint case \(m=2n/5\), where \(m/Y=k\).

If \(m\) is prime, there are no proper divisors \(d\ge2\), so this part is vacuous and \(m\) is already minimal among legal integers.

### The block contains a multiple of every required \(d\)

Define

\[
a_d=d\left\lceil\frac{N+1}{d}\right\rceil.
\]

The ceiling inequalities give

\[
N+1\le a_d<N+1+d.
\]

Since \(d<k\) and both are integers, \(d\le k-1\), so

\[
N+1+d\le N+k.
\]

Thus

\[
N+1\le a_d<N+1+d\le N+k,
\]

and \(a_d\in P_{n,k}\).

The requested boundary cases are harmless:

- If \(d\mid N+1\), then \(a_d=N+1\), the first element of the block.
- If \(d=k-1\), then \(a_d<N+k\), so \(a_d\le N+k-1\).
- The broader statement that a block of \(k\) consecutive integers contains a multiple of \(d=k\) is also true: \(a_k<N+k+1\), and integrality gives \(a_k\le N+k\). The proof only needs \(d<k\).

Since \(d\mid a_d\in P_{n,k}\), the integer \(d\) is illegal relative to \(P_{n,k}\). Thus every proper divisor \(d\ge2\) of \(m\) is illegal, while \(m\) itself is legal. Therefore

\[
\boxed{R_{n,k}\subseteq M(P_{n,k}).}
\]

---

## B. Counting and application

### Verdict B: **VALID**

### Periodic counting

Write \(L=|I_n|\). In any interval of \(L\) consecutive integers, each fixed residue class modulo \(W\) occurs at least

\[
\frac LW-1
\]

times. Summing over the \(\varphi(W)\) reduced residue classes gives

\[
|R_{n,k}|
\ge
\varphi(W)\left(\frac LW-1\right)
=
L\frac{\varphi(W)}W-\varphi(W).
\]

Since \(\varphi(W)\le W\),

\[
\boxed{|R_{n,k}|\ge |I_n|\frac{\varphi(W)}W-W.}
\]

So the error \(-W\) is fully justified; it is not an unjustified accumulation of \(O(1)\) terms.

### The telescoping lower bound

Because \(k\le n/10\),

\[
Y=\frac{2n}{5k}\ge4,
\]

so \(t=\lfloor Y\rfloor\ge4\). The primes \(q\le Y\) are precisely primes \(q\le t\). Every factor \(1-1/j\) lies in \((0,1)\), so adding the composite-indexed factors can only decrease the product:

\[
\prod_{q\le Y}\left(1-\frac1q\right)
\ge
\prod_{j=2}^{t}\left(1-\frac1j\right).
\]

The latter telescopes:

\[
\prod_{j=2}^{t}\frac{j-1}{j}=\frac1t.
\]

Since \(t\le Y\),

\[
\frac1t\ge\frac1Y.
\]

Therefore

\[
\boxed{\frac{\varphi(W)}W\ge\frac1Y.}
\]

Using \(|I_n|=n/15+O(1)\),

\[
|R_{n,k}|
\ge
\frac{n/15+O(1)}Y-W
=
\frac{k}{6}+O\!\left(\frac{k}{n}\right)-W.
\]

For a literal lower-bound display it would be slightly cleaner to write

\[
|R_{n,k}|\ge \frac{k}{6}-O\!\left(\frac{k}{n}\right)-W,
\]

but this is only notation: the stated \(+O(k/n)\) denotes a signed error and causes no gap.

### Controlling \(W\)

The Chebyshev estimate gives

\[
\log W=\vartheta(Y)=O(Y),
\qquad
W=\exp(O(Y)).
\]

Under (15),

\[
Y=\frac{2n}{5k}=o(\log n),
\]

so

\[
\log W=o(\log n),
\qquad
W=n^{o(1)}.
\]

To see explicitly why this is \(o(k)\), write

\[
k=\frac{n}{\log n}g_n,
\qquad g_n\to\infty,
\]

which follows from \(k\gg n/\log n\) in the intended asymptotic sense, and in any event follows from \(n/k=o(\log n)\). If \(W=n^{\varepsilon_n}\) with \(\varepsilon_n\to0\), then

\[
\frac Wk
=
\frac{n^{\varepsilon_n}\log n}{ng_n}
=
\frac{\log n}{g_n n^{1-\varepsilon_n}}
\longrightarrow0.
\]

Thus \(W=o(k)\), and also \(O(k/n)=o(k)\). Consequently,

\[
|R_{n,k}|\ge\left(\frac16-o(1)\right)k.
\]

By Part A,

\[
|M(P_{n,k})|
\ge
\left(\frac16-o(1)\right)k.
\]

### Substitution \(k_n=\lfloor3\alpha_n n\rfloor\)

Assume

\[
\alpha_n\to0,
\qquad
\alpha_n\log n\to\infty.
\]

First,

\[
\alpha_n n
=
(\alpha_n\log n)\frac{n}{\log n}
\longrightarrow\infty.
\]

Hence the floor is negligible:

\[
k_n=(3+o(1))\alpha_n n.
\]

The required conditions are then:

\[
\frac{k_n}{n}\sim3\alpha_n\to0,
\]

\[
\frac n{k_n}\sim\frac1{3\alpha_n}=o(\log n),
\]

and

\[
\frac{k_n}{n/\log n}
\sim3\alpha_n\log n\to\infty.
\]

The lemma’s additional hypothesis \(k_n\le n/10\) also holds eventually because \(k_n/n\to0\). Positivity of \(k_n\) follows from \(\alpha_n n\to\infty\).

Moreover,

\[
|P_{n,k_n}|=k_n\le3\alpha_n n,
\]

so the block is admissible for \(\mu_n(3\alpha_n)\). Therefore

\[
\begin{aligned}
\mu_n(3\alpha_n)
&\ge\frac{|M(P_{n,k_n})|}{n}\\
&\ge
\left(\frac16-o(1)\right)\frac{k_n}{n}\\
&=
\left(\frac16-o(1)\right)(3+o(1))\alpha_n\\
&=
\boxed{\left(\frac12-o(1)\right)\alpha_n}.
\end{aligned}
\]

The coefficient arithmetic is correct.

The optional Mertens sharpening in Section 6 also survives: here

\[
Y\sim\frac{2}{15\alpha_n},
\]

and the periodic main term becomes

\[
\frac{e^{-\gamma}+o(1)}{15\log Y}
=
\left(\frac{e^{-\gamma}}{15}+o(1)\right)
\frac1{\log(1/\alpha_n)}.
\]

The \(W\)-error remains negligible because \(W=n^{o(1)}\), whereas the main count is of order \(n/\log Y\).

---

## C. Regime completeness and scope

### Verdict C: **VALID**

### Prime anchor

At \(\alpha=0\), the only admissible primitive set is \(P=\varnothing\). Every integer \(2,\ldots,n\) is legal. The divisibility-minimal legal integers are precisely the primes, since every composite has a prime divisor in the legal set. Thus

\[
\mu_n(0)=\frac{\pi(n)}n\sim\frac1{\log n}.
\]

Also, if \(0\le\alpha\le\beta\), the family of sets used for \(\mu_n(\alpha)\) is contained in that used for \(\mu_n(\beta)\). Hence \(\mu_n\) is nondecreasing.

Suppose an eventually positive sequence witnessed (SM):

\[
\frac{\mu_n(3\alpha_n)}{\alpha_n}\to0.
\]

Then

\[
\frac{1+o(1)}{\alpha_n\log n}
=
\frac{\mu_n(0)}{\alpha_n}
\le
\frac{\mu_n(3\alpha_n)}{\alpha_n}
\to0.
\]

Therefore

\[
\boxed{\alpha_n\log n\to\infty.}
\]

This is stronger than merely \(\alpha_n\gg1/\log n\): the product must diverge, not merely stay bounded away from zero.

Part B then applies and gives

\[
\frac{\mu_n(3\alpha_n)}{\alpha_n}
\ge\frac12-o(1),
\]

contradicting (SM).

### The subsequence dichotomy

For an eventually positive sequence, put

\[
b_n=\alpha_n\log n\ge0.
\]

If \(b_n\) is unbounded, one can choose \(n_j\) recursively with \(b_{n_j}\ge j\). Hence \(b_{n_j}\to\infty\), and Part B gives

\[
\mu_{n_j}(3\alpha_{n_j})
\ge
\left(\frac12-o(1)\right)\alpha_{n_j}.
\]

If \(b_n\) is not unbounded, it is bounded, and therefore certainly bounded along an infinite subsequence. More generally, any infinite subsequence on which \(b_n\le B<\infty\) satisfies

\[
\frac{\mu_n(3\alpha_n)}{\alpha_n}
\ge
\frac{1+o(1)}{b_n}
\ge
\frac{1+o(1)}B.
\]

Taking, for example, \(B\ge1\), this is at least \(1/(2B)\) eventually along that subsequence.

The two alternatives are exhaustive. They need not be mutually exclusive—an unbounded sequence may also have a bounded subsequence—but only one successful subsequence is needed.

If \(\alpha_n=0\) infinitely often, then \(\mu_n(3\alpha_n)=\mu_n(0)>0\) on those indices. Thus the little-\(o(\alpha_n)\) relation is either undefined under the quotient convention or false under the usual \(\varepsilon|\alpha_n|\) convention. The document handles this correctly.

### The attached implication

The proposition \((\mathrm{SM})\Rightarrow L(n)=o(n)\) also survives. The cone identity

\[
\mathcal L(A)=\bigcup_{m\in M(A)}
\{x\in\mathcal L(A):m\mid x\}
\]

follows from the maximality of \(A\cup M(A)\) and minimality of the elements of \(M(A)\). Choosing a largest cone deletes at least \(Q_t/(\mu n)\) live legal integers, while the intervening Prolonger move cannot restore legality. This gives the claimed multiplicative contraction. 

The floor conditions are indeed automatic for a hypothetical witness. With \(x_n=\alpha_n n\to\infty\),

\[
T=\lfloor x_n\rfloor\sim x_n,
\]

and eventually

\[
2T+1\le2x_n+1\le3x_n.
\]

Likewise \(T\ge x_n/2\) eventually, which justifies the exponent \(-\alpha_n/(2\mu)\).

### Exact scope of the disproof

What is rigorously ruled out is:

\[
\exists\alpha_n\to0:
\quad
\mu_n(3\alpha_n)=o(\alpha_n).
\]

Equivalently, after renaming \(\beta_n=3\alpha_n\), there is no positive sequence \(\beta_n\to0\) for which

\[
\mu_n(\beta_n)=o(\beta_n).
\]

The construction therefore kills any argument that requires a **uniform worst-case** estimate saying that every primitive position of size at most \(\beta n\) has \(o(\beta n)\) minimal legal elements. It also kills the specific \(T\)-round greedy maximum-cone proof when its only quantitative input is such a uniform modulus.

It does **not** rule out:

- \(L(n)=o(n)\) itself;
- trajectory-restricted estimates applying only to positions generated by a particular Shortener strategy;
- a maximum-cone strategy proved by a different, nonuniform analysis;
- static estimates involving weights, geometry, structure, several scales, or more information than \(|P|\) and \(|M(P)|\);
- hybrid static/chronological arguments;
- all conceivable “purely static” arguments, absent a formal definition and a reduction of that whole class to (SM).

In particular, the blocker positions are legitimate primitive positions and therefore destroy a maximum over **all** \(P\), but they are not shown to be positions that Prolonger can force against every Shortener policy. Thus they do not refute trajectory-sensitive versions of the idea.

Section 7’s final limitation is therefore correct. Its phrase “the associated greedy-cone strategy” should be read narrowly as the specific uniform-\(\mu_n\) implementation, not as every possible greedy-cone analysis.

# Final referee finding

\[
\boxed{\textbf{A VALID,\quad B VALID,\quad C VALID.}}
\]

There is no numeric, endpoint, floor, asymptotic, or quantifier failure. The document gives a complete disproof of (SM) and a valid subsequential strengthening for every eventually positive \(\alpha_n\to0\).
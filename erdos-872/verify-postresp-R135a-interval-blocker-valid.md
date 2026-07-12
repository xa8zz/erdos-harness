---
id: R135a-interval-blocker-valid
type: verification
date: 2026-07-12
intent: >
  Adversarial referee audit of the interval-blocker disproof of the
  static completion-modulus statement (no alpha_n -> 0 has
  mu_n(3 alpha_n) = o(alpha_n)), with the counting and regime analysis
  as primary attack surface.
predecessors: [R133-static-modulus-refuted]
action:
  kind: confirms
  target: R133-static-modulus-refuted
claim: >
  OVERALL VALID. The interval-blocker construction works: the strict
  rough-prime inequality q > Y yields d < k with the right strictness,
  the ceiling multiple stays inside the block, the periodic count has
  sufficient uniform error control (the -W correction absorbs the
  boundary classes), Chebyshev gives W = n^{o(1)} = o(k) in the stated
  regime, and the prime-anchor/blocker dichotomy covers every possible
  asymptotic regime of alpha_n log n. No numerical, endpoint, counting,
  or regime error found; the disproof of the static-modulus statement
  is complete.
confidence_at_time: high
strategy_dependence: independent
prompt: erdos-872/prompts/audit-R135-interval-blocker-refutation.md
---

# Referee verdict

\[
\boxed{\textbf{OVERALL: VALID}}
\]

The interval-blocker construction works. I find no numerical, endpoint, counting, or regime-completeness failure. The document proves that no sequence \(\alpha_n\to0\) can satisfy

\[
\mu_n(3\alpha_n)=o(\alpha_n).
\]

The only qualifications concern how broadly the conclusion should be described, not the proof itself. 

## A. Lemma \(R_{n,k}\subseteq M(P_{n,k})\)

\[
\boxed{\textbf{A. VALID}}
\]

### 1. The consecutive block is primitive

Since

\[
P_{n,k}=\{N+1,\ldots,N+k\},\qquad N=\left\lfloor\frac n2\right\rfloor,
\]

every \(a\in P_{n,k}\) satisfies \(a>n/2\). Also,

\[
N+k\le \frac n2+\frac n{10}=\frac{3n}{5}<n,
\]

so the block lies in \(\{2,\ldots,n\}\).

For \(a<b\) in the block,

\[
2a>n\ge b.
\]

If \(a\mid b\) and \(a<b\), one would have \(b\ge2a\), contradicting \(b<2a\). Thus no two block elements divide one another.

### 2. Every \(m\in R_{n,k}\) is legal

For \(m\in R_{n,k}\),

\[
\frac n3<m\le\frac{2n}{5}.
\]

For every \(a\in P_{n,k}\),

\[
m\le\frac{2n}{5}<\frac n2<a.
\]

At the other endpoint,

\[
a\le N+k\le\frac{3n}{5},
\]

whereas

\[
2m>\frac{2n}{3}>\frac{3n}{5}.
\]

Therefore

\[
m<a<2m.
\]

This gives both incomparabilities:

- \(a\nmid m\), because \(a>m\);
- \(m\nmid a\), because any multiple of \(m\) strictly larger than \(m\) is at least \(2m>a\).

All inequalities are strict where needed. The use of \(k\le n/10\) is sufficient, with considerable room: \(3/5<2/3\).

### 3. Every proper divisor \(d\ge2\) of \(m\) is strictly below \(k\)

Let \(d\mid m\) be proper and write

\[
r=\frac md>1.
\]

Choose a prime \(q\mid r\). Then \(r\ge q\) and, since \(m=dr\), also \(q\mid m\). Because \(\gcd(m,W)=1\) and \(W\) contains every prime at most \(Y\),

\[
q>Y.
\]

Consequently,

\[
d=\frac mr\le\frac mq<\frac mY
   \le\frac{2n/5}{2n/(5k)}
   =k.
\]

Each step is justified:

- \(d\le m/q\) comes from \(r\ge q\);
- the strict inequality \(m/q<m/Y\) comes from \(q>Y\);
- \(m/Y\le k\) comes from \(m\le2n/5\).

Even when \(m=2n/5\), so that the final inequality is equality, the preceding inequality remains strict. Hence \(d<k\), not merely \(d\le k\).

### 4. The block contains a multiple of every needed divisor

For \(2\le d<k\), define

\[
a_d=d\left\lceil\frac{N+1}{d}\right\rceil.
\]

The standard ceiling inequality gives

\[
N+1\le a_d<N+1+d.
\]

Because \(d<k\) and \(d,k\) are integers, \(d\le k-1\), so

\[
N+1+d\le N+k.
\]

Thus

\[
N+1\le a_d<N+1+d\le N+k,
\]

and therefore \(a_d\in P_{n,k}\).

The boundary cases are sound:

- If \(d\mid N+1\), then \(a_d=N+1\), the first block element.
- If \(d=k-1\), then \(a_d<N+k\), so \(a_d\le N+k-1\).
- The broader sentence that a block of \(k\) consecutive integers contains a multiple of every \(d\le k\) is also true. For \(d=k\), one uses
  \[
  a_k<N+k+1
  \]
  and integrality to obtain \(a_k\le N+k\). But the proof only needs \(d<k\).

Since \(d\mid a_d\) with \(a_d\in P_{n,k}\), adjoining \(d\) would violate primitivity. Hence every proper divisor \(d\ge2\) of \(m\) is illegal.

Therefore \(m\) is legal and has no smaller legal divisor in the universe \(\{2,\ldots,n\}\), proving

\[
m\in M(P_{n,k}).
\]

No repair is needed.

---

## B. Counting \(R_{n,k}\) and applying \(k=\lfloor3\alpha_n n\rfloor\)

\[
\boxed{\textbf{B. VALID}}
\]

### 1. The periodic lower bound is correct

Let \(L=|I_n|\). Since \(I_n\) is an interval of \(L\) consecutive integers, each fixed residue class modulo \(W\) occurs either \(\lfloor L/W\rfloor\) or \(\lceil L/W\rceil\) times. In particular, it occurs at least

\[
\frac LW-1
\]

times.

There are \(\varphi(W)\) coprime residue classes, so

\[
|R_{n,k}|
\ge
\varphi(W)\left(\frac LW-1\right)
=
L\frac{\varphi(W)}W-\varphi(W).
\]

Since \(\varphi(W)\le W\),

\[
|R_{n,k}|
\ge
|I_n|\frac{\varphi(W)}W-W.
\]

Thus the error term \(-W\) is crude but completely valid, including when \(W>|I_n|\).

### 2. The telescoping product has the correct direction

Let \(t=\lfloor Y\rfloor\). Under \(k\le n/10\),

\[
Y=\frac{2n}{5k}\ge4,
\]

so there is no small-\(Y\) endpoint issue.

The set of primes at most \(Y\) is a subset of \(\{2,\ldots,t\}\). Because every factor \(1-1/j\) lies in \((0,1)\), adding the extra composite-indexed factors can only decrease the product. Hence

\[
\prod_{q\le Y}\left(1-\frac1q\right)
\ge
\prod_{j=2}^{t}\left(1-\frac1j\right).
\]

The latter telescopes:

\[
\prod_{j=2}^{t}\frac{j-1}{j}=\frac1t.
\]

Finally \(t\le Y\), so

\[
\frac1t\ge\frac1Y.
\]

Therefore

\[
\frac{\varphi(W)}W\ge\frac1Y
\]

is correct.

Since

\[
|I_n|=\frac n{15}+O(1),
\qquad
\frac1Y=\frac{5k}{2n},
\]

one obtains

\[
\frac{|I_n|}{Y}
=
\left(\frac n{15}+O(1)\right)\frac{5k}{2n}
=
\frac k6+O\!\left(\frac{k}{n}\right).
\]

Thus

\[
|R_{n,k}|
\ge
\frac k6+O\!\left(\frac{k}{n}\right)-W.
\]

The coefficient \(1/6\) is numerically correct.

### 3. The Chebyshev estimate gives \(W=o(k)\)

By definition,

\[
\log W=\vartheta(Y).
\]

The standard elementary Chebyshev estimate gives

\[
\vartheta(Y)=O(Y),
\]

hence

\[
W=\exp(O(Y)).
\]

Under condition (15),

\[
\frac nk=o(\log n),
\]

so

\[
Y=\frac25\frac nk=o(\log n).
\]

Therefore

\[
\log W=o(\log n),
\qquad
W=n^{o(1)}.
\]

To make the last comparison fully explicit, \(W=n^{o(1)}\) implies, for example, that eventually \(W\le n^{1/2}\). Even interpreting

\[
k\gg\frac n{\log n}
\]

in the weaker Vinogradov sense \(k\ge c n/\log n\), one gets

\[
\frac Wk
\le
\frac{n^{1/2}}{c n/\log n}
=
\frac{\log n}{c\sqrt n}
\longrightarrow0.
\]

Hence \(W=o(k)\). The stronger condition \(n/k=o(\log n)\) already implies that \(k/(n/\log n)\to\infty\), so the third condition in (15) is partly redundant, but certainly not erroneous.

Also,

\[
O(k/n)=o(k),
\]

since dividing this error by \(k\) gives \(O(1/n)\). Thus

\[
|R_{n,k}|
\ge
\left(\frac16-o(1)\right)k.
\]

### 4. The floor and all hypotheses work for \(k_n=\lfloor3\alpha_n n\rfloor\)

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
(\alpha_n\log n)\frac n{\log n}
\longrightarrow\infty.
\]

Therefore the floor is negligible relative to \(\alpha_n n\):

\[
k_n=\lfloor3\alpha_n n\rfloor
=(3+o(1))\alpha_n n.
\]

In particular, \(k_n\ge1\) eventually.

The required conditions follow:

\[
\frac{k_n}{n}
=
(3+o(1))\alpha_n
\longrightarrow0;
\]

\[
\frac{n}{k_n}
\sim
\frac1{3\alpha_n},
\qquad
\frac{n/k_n}{\log n}
\sim
\frac1{3\alpha_n\log n}
\longrightarrow0;
\]

and

\[
\frac{k_n}{n/\log n}
\sim
3\alpha_n\log n
\longrightarrow\infty.
\]

The lemma’s additional condition \(k_n\le n/10\), although not repeated explicitly in Section 4, also follows from \(k_n/n\to0\). Thus it holds eventually.

Finally,

\[
|P_{n,k_n}|=k_n\le3\alpha_n n,
\]

so the blocker is admissible for \(\mu_n(3\alpha_n)\). Consequently,

\[
\begin{aligned}
\mu_n(3\alpha_n)
&\ge \frac{|M(P_{n,k_n})|}{n}\\
&\ge
\left(\frac16-o(1)\right)\frac{k_n}{n}\\
&=
\left(\frac16-o(1)\right)(3+o(1))\alpha_n\\
&=
\left(\frac12-o(1)\right)\alpha_n.
\end{aligned}
\]

The factor \(1/2\) is correct.

### Section 6 also survives

The Mertens sharpening does not introduce a hidden periodic-error problem. Here

\[
Y\sim\frac{2}{15\alpha_n}=o(\log n),
\]

so \(W=n^{o(1)}\), while the proposed main term has size \(n/\log Y\). Hence

\[
\frac{W}{n}=o\!\left(\frac1{\log Y}\right),
\]

and the \(-W\) error is negligible after division by \(n\). Since

\[
\log Y=\log(1/\alpha_n)+O(1),
\]

the stated bound

\[
\mu_n(3\alpha_n)
\ge
\left(\frac{e^{-\gamma}}{15}+o(1)\right)
\frac1{\log(1/\alpha_n)}
\]

is also correct.

---

## C. Prime-anchor regime, subsequences, and scope

\[
\boxed{\textbf{C. VALID}}
\]

### 1. The prime anchor is exact

For \(P=\varnothing\), every integer in \(\{2,\ldots,n\}\) is legal. Its divisibility-minimal elements are exactly the primes:

- a prime has no divisor in \(\{2,\ldots,n\}\) other than itself;
- every composite has a prime divisor at least \(2\), which is also legal.

Thus

\[
M(\varnothing)=\{p\le n:p\text{ prime}\},
\qquad
\mu_n(0)=\frac{\pi(n)}n.
\]

Monotonicity is immediate from the maximization domain: when \(\alpha\le\beta\), every \(P\) admissible for \(\mu_n(\alpha)\) is admissible for \(\mu_n(\beta)\). Therefore

\[
\mu_n(3\alpha_n)\ge\mu_n(0)
=\frac{\pi(n)}n
\sim\frac1{\log n}.
\]

If a hypothetical witness satisfied

\[
\mu_n(3\alpha_n)=o(\alpha_n),
\]

then \(\alpha_n\) must be positive eventually, and

\[
\frac{1+o(1)}{\alpha_n\log n}
=
\frac{\mu_n(0)}{\alpha_n}
\le
\frac{\mu_n(3\alpha_n)}{\alpha_n}
\longrightarrow0.
\]

Hence necessarily

\[
\alpha_n\log n\longrightarrow\infty.
\]

There is no missing alternative regime.

### 2. The subsequence split is exhaustive

Set

\[
b_n=\alpha_n\log n>0
\]

eventually.

If \(b_n\) is unbounded, there exists a subsequence \(n_j\) with

\[
b_{n_j}\to\infty.
\]

Applying the blocker argument along that subsequence gives

\[
\frac{\mu_{n_j}(3\alpha_{n_j})}{\alpha_{n_j}}
\ge\frac12-o(1).
\]

If \(b_n\) is not unbounded, it is bounded, and hence certainly bounded along an infinite subsequence. More generally, whenever an infinite subsequence satisfies \(b_n\le B\) for some finite \(B>0\), the prime anchor gives

\[
\frac{\mu_n(3\alpha_n)}{\alpha_n}
\ge
\frac{1+o(1)}{b_n}
\ge
\frac{1+o(1)}B.
\]

Eventually the right side is at least \(1/(2B)\), producing the required fixed positive constant.

The two descriptions are not mutually exclusive: an unbounded sequence may also have a bounded infinite subsequence. But they cover all sequences, which is all the proof requires. A cleaner partition would be “\(b_n\) is unbounded; otherwise \(b_n\) is bounded,” but no repair is mathematically necessary.

If \(\alpha_n=0\) infinitely often, then under the usual \(\varepsilon\)-definition of little-\(o\),

\[
\mu_n(3\alpha_n)\le\varepsilon\alpha_n
\]

would force \(\mu_n(0)=0\) on those indices, which is false. Under the ratio definition, the quotient is simply undefined on those indices, so such a sequence is not a witness either. The claimed \(\Omega(\alpha_n)\) inequality on a zero subsequence is technically true but vacuous; the substantive strong statement concerns eventually positive sequences.

### 3. The Section 7 floor calculation is sound

Let

\[
T=\lfloor\alpha_n n\rfloor.
\]

Because a hypothetical witness must have \(\alpha_n\log n\to\infty\),

\[
\alpha_n n\to\infty.
\]

Therefore

\[
T\sim\alpha_n n.
\]

Also, writing \(x=\alpha_n n\),

\[
2T+1\le2x+1\le3x
\]

once \(x\ge1\). Thus

\[
2T+1\le3\alpha_n n
\]

eventually. The cited floor issue is genuinely harmless.

### 4. Exact scope of the disproof

What is established is:

\[
\boxed{
\text{There is no }\alpha_n\to0
\text{ such that }
\mu_n(3\alpha_n)=o(\alpha_n).
}
\]

Accordingly, any proof route whose indispensable input is that exact worst-case, uniform completion-modulus estimate over **all** primitive \(P\) of size at most \(3\alpha_n n\) is closed.

In fact, the same blocker argument is not special to the multiplier \(3\). For every fixed \(C>0\), taking

\[
k=\lfloor C\alpha_n n\rfloor
\]

in the large-\(\alpha_n\log n\) regime gives

\[
\mu_n(C\alpha_n)
\ge
\left(\frac C6-o(1)\right)\alpha_n,
\]

while the prime anchor handles the complementary regime. Thus no fixed positive budget multiplier \(C\) makes the analogous uniform \(o(\alpha_n)\) condition true.

What is **not** ruled out includes:

- \(L(n)=o(n)\) itself;
- the validity of the implication \((\mathrm{SM})\Rightarrow L(n)=o(n)\);
- estimates restricted to states actually reachable under a particular strategy;
- trajectory-restricted or shell-restricted completion bounds;
- amortized estimates that allow some states to have large \(M(P)\);
- weighted, multiscale, or potential-function cone arguments;
- static arguments based on a different invariant than this worst-case modulus;
- dynamic strategies exploiting correlations between successive positions.

Therefore Section 7’s caveat is correct. “This particular uniform modulus route fails” is proved. “No static method can prove \(L(n)=o(n)\)” is not proved.

## Final disposition

\[
\boxed{
\textbf{A: VALID,\qquad B: VALID,\qquad C: VALID.}
}
\]

The proposed disproof of (SM) should be accepted. The interval-blocker construction supplies a genuine worst-case obstruction, the periodic count has sufficient uniform error control, and the prime-anchor/blocker dichotomy covers every possible asymptotic regime.
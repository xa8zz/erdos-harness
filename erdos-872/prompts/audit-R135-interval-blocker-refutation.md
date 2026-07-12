Don't search the internet. You are an adversarial referee. The document below claims a complete disproof of a statement (SM) about primitive sets: with mu_n(alpha) the uniform completion modulus (the maximum, over primitive P in {2..n} with |P| <= alpha*n, of |M(P)|/n, where M(P) is the set of divisibility-minimal elements among the integers legal relative to P), it claims that NO sequence alpha_n -> 0 satisfies mu_n(3 alpha_n) = o(alpha_n) — via an interval-blocker construction. This refutation is about to close an entire route in a research program, so your job is to break it. Give THREE verdicts (VALID / REPAIRABLE with gap+repair / REFUTED with exact failure):

A. The Lemma (its Section 2): is R_{n,k} genuinely contained in M(P_{n,k})? Check primitivity of the consecutive block, the legality of each rough m (the m < a < 2m sandwich — verify the endpoint arithmetic with the stated k <= n/10), the claim that every proper divisor d >= 2 of m satisfies d < k (the rough-part argument d = m/r <= m/q < m/Y <= k — check each inequality including strictness where needed), and the claim that the block contains a multiple of every d < k (the ceiling construction a_d — check the boundary cases d dividing N+1 and d close to k).
B. The count (Section 3) and the application (Section 4): the periodic counting |R| >= |I|*phi(W)/W - W, the telescoping bound phi(W)/W >= 1/Y, the Chebyshev bound W = exp(O(Y)) and its use to get W = o(k) in the regime (15), the verification that k = floor(3 alpha_n n) satisfies all conditions of (15) when alpha_n -> 0 and alpha_n log n -> infinity, and the final arithmetic giving mu_n(3 alpha_n) >= (1/2 - o(1)) alpha_n. This is your primary task.
C. Regime completeness (Sections 1 and 5): does the prime-anchor argument really force alpha_n log n -> infinity for any hypothetical (SM) witness (check mu_n(0) = pi(n)/n and monotonicity of mu_n), and does the two-case subsequence split in Section 5 cover every eventually-positive alpha_n -> 0? Also assess the scope claims in Section 7 (what exactly is and is not ruled out).

If every step survives, say VALID plainly — do not manufacture objections. If anything fails, give the exact numeric or logical failure and whether it is repairable.

## Definitions

Primitive = no member divides another. For primitive P in {2..n}: x is legal if x is not in P and P union {x} is primitive; L(P) = the legal set; M(P) = divisibility-minimal elements of L(P). mu_n(alpha) = max{|M(P)|/n : P primitive, |P| <= alpha n}. The qualitative theorem (given): |M(P)| = o(n) uniformly over |P| = o(n). Known anchor: M of the empty set = the primes up to n.

## The document (verbatim)

# Verdict

\[
\boxed{\text{(SM) is false.}}
\]

In fact, the stronger converse requested in the problem holds: for **every** sequence \(\alpha_n\to0\), there is a subsequence along which

\[
\mu_n(3\alpha_n)=\Omega(\alpha_n).
\]

The key construction is a consecutive block of integers immediately above \(n/2\). Such a block is automatically primitive, while a block of length \(k\) contains a multiple of every integer \(d\le k\). This makes many integers with no small prime factor divisibility-minimal legal elements.

I use the notation and the attached proposition from the uploaded statement. 

## 1. Monotonicity forces any hypothetical witness into a specific regime

If \(0\le \alpha\le\beta\), then every primitive \(P\) admissible in the definition of \(\mu_n(\alpha)\) is also admissible for \(\mu_n(\beta)\). Hence

\[
\mu_n(\alpha)\le\mu_n(\beta).
\tag{1}
\]

In particular,

\[
\mu_n(3\alpha)\ge \mu_n(0)=\frac{\pi(n)}n
  \sim \frac1{\log n}.
\tag{2}
\]

Suppose temporarily that a sequence \(\alpha_n\to0\) satisfied (SM). Then, necessarily, \(\alpha_n>0\) eventually and

\[
\frac{1}{\alpha_n\log n}
\sim
\frac{\mu_n(0)}{\alpha_n}
\le
\frac{\mu_n(3\alpha_n)}{\alpha_n}
\longrightarrow0.
\]

Thus any hypothetical witness must satisfy

\[
\alpha_n\log n\longrightarrow\infty.
\tag{3}
\]

We now prove that precisely in this regime, \(\mu_n(3\alpha_n)\) is bounded **below** by a positive multiple of \(\alpha_n\).

## 2. The upper-half interval blocker

Let \(k\) be a positive integer with \(k\le n/10\), put

\[
N=\left\lfloor\frac n2\right\rfloor,
\]

and define

\[
P_{n,k}=\{N+1,N+2,\ldots,N+k\}.
\tag{4}
\]

Every element of \(P_{n,k}\) exceeds \(n/2\). Therefore, if \(a<b\) are in \(P_{n,k}\), then \(2a>n\ge b\), so \(a\nmid b\). Hence \(P_{n,k}\) is primitive.

Set

\[
Y=\frac{2n}{5k},
\qquad
W=\prod_{\substack{q\le Y\\q\ {\rm prime}}}q,
\tag{5}
\]

and consider

\[
R_{n,k}
=
\left\{
m\in\mathbb Z:
\frac n3<m\le\frac{2n}{5},
\quad
\gcd(m,W)=1
\right\}.
\tag{6}
\]

Thus every prime factor of an integer in \(R_{n,k}\) is greater than \(Y\).

### Lemma

\[
R_{n,k}\subseteq M(P_{n,k}).
\tag{7}
\]

### Proof

Fix \(m\in R_{n,k}\).

First, \(m\) is legal relative to \(P_{n,k}\). Indeed, for every \(a\in P_{n,k}\),

\[
m\le\frac{2n}{5}<\frac n2<a,
\]

while, because \(k\le n/10\),

\[
a\le N+k\le \frac n2+\frac n{10}=\frac{3n}{5}.
\]

On the other hand \(m>n/3\), so

\[
2m>\frac{2n}{3}>\frac{3n}{5}\ge a.
\]

Consequently,

\[
m<a<2m.
\]

Thus \(a\nmid m\) because \(a>m\), and \(m\nmid a\) because the first multiple of \(m\) larger than \(m\) is \(2m>a\). Hence \(m\) is incomparable with every member of \(P_{n,k}\).

It remains to show that every proper divisor \(d\ge2\) of \(m\) is illegal.

Write \(r=m/d>1\), and let \(q\) be any prime divisor of \(r\). Then \(q\mid m\). Since \(\gcd(m,W)=1\), we have \(q>Y\). Therefore

\[
d=\frac mr\le\frac mq
<
\frac{m}{Y}
\le
\frac{2n/5}{2n/(5k)}
=k.
\tag{8}
\]

So every proper divisor \(d\ge2\) of \(m\) is strictly less than \(k\).

But any block of \(k\) consecutive integers contains a multiple of every \(d\le k\). Explicitly, set

\[
a_d
=
d\left\lceil\frac{N+1}{d}\right\rceil.
\]

Then

\[
N+1\le a_d<N+1+d\le N+k,
\]

where the last inequality follows from \(d<k\). Hence \(a_d\in P_{n,k}\), and \(d\mid a_d\). Thus \(d\) is illegal relative to \(P_{n,k}\).

We have shown that \(m\) is legal but that none of its proper divisors in \(\{2,\ldots,n\}\) is legal. Therefore \(m\in M(P_{n,k})\). ∎

The important feature is that the same \(k\)-element primitive block simultaneously blocks **every** divisor up to \(k\).

## 3. There are linearly many suitable rough integers

We next count \(R_{n,k}\). Let

\[
I_n=\left(\frac n3,\frac{2n}{5}\right]\cap\mathbb Z.
\]

Its length is

\[
|I_n|=\frac n{15}+O(1).
\tag{9}
\]

The integers relatively prime to \(W\) occupy \(\varphi(W)\) residue classes modulo \(W\). Each residue class occurs \(|I_n|/W+O(1)\) times in \(I_n\). Consequently,

\[
|R_{n,k}|
\ge
|I_n|\frac{\varphi(W)}W-W.
\tag{10}
\]

Let \(t=\lfloor Y\rfloor\). Since the primes up to \(Y\) form a subset of the integers \(2,\ldots,t\),

\[
\begin{aligned}
\frac{\varphi(W)}W
&=
\prod_{q\le Y}\left(1-\frac1q\right)\\
&\ge
\prod_{j=2}^{t}\left(1-\frac1j\right)
=
\prod_{j=2}^{t}\frac{j-1}{j}
=
\frac1t
\ge
\frac1Y.
\end{aligned}
\tag{11}
\]

This deliberately crude telescoping bound is already enough. Combining (9)–(11),

\[
|R_{n,k}|
\ge
\frac{n/15+O(1)}Y-W
=
\frac{k}{6}+O\!\left(\frac{k}{n}\right)-W.
\tag{12}
\]

We only need to control the modulus \(W\). The elementary Chebyshev estimate

\[
\vartheta(x):=\sum_{q\le x}\log q=O(x)
\tag{13}
\]

gives

\[
W=\exp(\vartheta(Y))=\exp(O(Y)).
\tag{14}
\]

For completeness, (13) follows from

\[
\prod_{m<q\le2m}q\mid {2m\choose m}
\]

and therefore

\[
\vartheta(2m)-\vartheta(m)
\le
\log {2m\choose m}
\le
2m\log2;
\]

summing over dyadic intervals proves \(\vartheta(x)=O(x)\).

Now suppose that \(k=k_n\) satisfies

\[
\frac{k}{n}\longrightarrow0,
\qquad
\frac{n}{k}=o(\log n),
\qquad
k\gg\frac n{\log n}.
\tag{15}
\]

Then \(Y=2n/(5k)=o(\log n)\), and hence

\[
W=\exp(o(\log n))=n^{o(1)}.
\]

Since \(k\gg n/\log n\), it follows that \(W=o(k)\). Equation (12) therefore yields

\[
|R_{n,k}|
\ge
\left(\frac16-o(1)\right)k.
\tag{16}
\]

Together with the lemma,

\[
|M(P_{n,k})|
\ge
\left(\frac16-o(1)\right)k.
\tag{17}
\]

## 4. Applying the construction at \(k=\lfloor3\alpha_n n\rfloor\)

Let \(\alpha_n\to0\) satisfy

\[
\alpha_n\log n\to\infty.
\tag{18}
\]

Set

\[
k_n=\lfloor3\alpha_n n\rfloor.
\tag{19}
\]

Then

\[
k_n=(3+o(1))\alpha_n n,
\tag{20}
\]

and all the conditions in (15) hold:

\[
\frac{k_n}{n}\to0,
\qquad
\frac{n}{k_n}
\sim\frac1{3\alpha_n}
=o(\log n),
\qquad
k_n\gg\frac n{\log n}.
\]

Moreover, \(|P_{n,k_n}|=k_n\le3\alpha_n n\), so \(P_{n,k_n}\) is admissible in the definition of \(\mu_n(3\alpha_n)\). From (17),

\[
\begin{aligned}
\mu_n(3\alpha_n)
&\ge
\frac{|M(P_{n,k_n})|}{n}\\
&\ge
\left(\frac16-o(1)\right)\frac{k_n}{n}\\
&=
\left(\frac12-o(1)\right)\alpha_n.
\end{aligned}
\tag{21}
\]

Thus we have proved the following quantitative obstruction:

\[
\boxed{
\alpha_n\to0,\quad
\alpha_n\log n\to\infty
\quad\Longrightarrow\quad
\mu_n(3\alpha_n)
\ge
\left(\frac12-o(1)\right)\alpha_n.
}
\tag{22}
\]

But in Section 1 we showed that every hypothetical witness to (SM) must satisfy \(\alpha_n\log n\to\infty\). Equation (22) then contradicts

\[
\mu_n(3\alpha_n)=o(\alpha_n).
\]

Therefore

\[
\boxed{\text{No sequence witnessing (SM) exists.}}
\]

## 5. The full “every sequence” disproof

Let \(\alpha_n\to0\) be any eventually positive sequence, and write

\[
b_n=\alpha_n\log n.
\]

There are two possibilities.

If \(b_n\) is unbounded, choose a subsequence on which \(b_n\to\infty\). Equation (22) gives, on that subsequence,

\[
\mu_n(3\alpha_n)
\ge
\left(\frac12-o(1)\right)\alpha_n.
\tag{23}
\]

If \(b_n\) is bounded along an infinite subsequence, say \(b_n\le B\), then the prime anchor gives

\[
\frac{\mu_n(3\alpha_n)}{\alpha_n}
\ge
\frac{\pi(n)/n}{\alpha_n}
=
\frac{1+o(1)}{\alpha_n\log n}
\ge
\frac{1+o(1)}B.
\tag{24}
\]

Thus, in all cases, there is an infinite subsequence and a constant \(c>0\) such that

\[
\boxed{
\mu_n(3\alpha_n)\ge c\alpha_n.
}
\tag{25}
\]

If \(\alpha_n=0\) infinitely often, the proposed \(o(\alpha_n)\) relation is already impossible because \(\mu_n(0)=\pi(n)/n>0\); the lower inequality in (25) is then vacuous on those terms.

Hence the requested strong disproof is established.

## 6. Quantitative sharpening

The elementary telescoping estimate (11) was intentionally weak. Using the classical Mertens product formula,

\[
\prod_{q\le Y}\left(1-\frac1q\right)
\sim
\frac{e^{-\gamma}}{\log Y},
\]

the same periodic counting argument gives, whenever \(\alpha_n\log n\to\infty\),

\[
\mu_n(3\alpha_n)
\ge
\left(\frac{e^{-\gamma}}{15}+o(1)\right)
\frac1{\log(1/\alpha_n)}.
\tag{26}
\]

Since

\[
\alpha\log(1/\alpha)\longrightarrow0,
\]

this sharper bound actually implies

\[
\frac{\mu_n(3\alpha_n)}{\alpha_n}\longrightarrow\infty
\]

in the only regime in which (SM) could conceivably hold. The elementary constant-factor bound (22), however, already proves the disproof unconditionally.

## 7. Status of the attached proposition

The attached implication

\[
\text{(SM)}\Longrightarrow L(n)=o(n)
\]

has no substantive gap. Its cone covering is correct, selecting a minimal legal element deletes its entire live upper cone, and legality is monotone.

The only tacit floor issue is that, with \(T=\lfloor\alpha_n n\rfloor\), one needs \(T\asymp\alpha_n n\) and \(2T+1\le3\alpha_n n\). But a hypothetical (SM) sequence would satisfy \(\alpha_n\log n\to\infty\), hence \(\alpha_n n\to\infty\), so these inequalities hold eventually. The proposition is therefore a valid implication whose antecedent is false.

What is rigorously ruled out is this particular uniform completion-modulus criterion and the associated greedy-cone strategy. The broader phrase “no purely static estimate can ever prove \(L(n)=o(n)\)” would require a formal definition of the entire class of static arguments; it does not follow from the disproof of one sufficient condition alone.
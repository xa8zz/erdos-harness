---
id: R19-codex-matching-T2-closeout
type: research
date: 2026-04-19
intent: >
  Attempt to close the matching-T2 upper bound L(n) = O_alpha(n(log log n)^2/log n)
  by controlling the non-residual mixed stage via the harmonic-sum lemma.
predecessors: []
prompt: erdos-872/prompts/round19-matching-T2-upper-bound.md
action:
  kind: standalone
claim: >
  Matching-T2 upper bound does not follow from the harmonic-sum lemma route.
  Two negative findings: (1) the harmonic sum over D_y(n) is Theta(log n)
  not O((log log n)^2), so the non-residual mixed stage cannot be controlled
  this way; (2) the k <= 2 constraint (since alpha > 1/3) is false --
  k_max = (1 + o(1)) log n / log log n.
---

# Researcher 19 Codex — matching-T2 closeout

## Executive verdict

The matching-T2 upper bound
\[
L(n)=O_\alpha\!\left(\frac{n(\log\log n)^2}{\log n}\right)
\]
does **not** follow from my current framework.

Two things are now clear.

1. The hope that the non-residual mixed stage can be controlled by the harmonic-sum lemma
   \[
   \sum_{d\in\mathcal D_y(n)}\frac1d
   \ll_\alpha
   (\log\log n)^2,
   \qquad
   \mathcal D_y(n)=\{d\le n:\ d\text{ squarefree},\ P^+(d)\le y,\ \omega(d)\ge 2\},
   \]
   is **false**. In fact
   \[
   \sum_{d\in\mathcal D_y(n)}\frac1d
   \asymp_\alpha \log n
   \qquad
   (y=n^\alpha,\ \alpha\in(1/3,1/2)).
   \]

2. The alternative Route B, "Shortener dynamically installs all small semiprimes \(ab\le n/2\) with \(a,b\le y\)," does **not** currently close the gap either. Its counting budget is fine, but its online stability against high-support Prolonger moves is exactly the unresolved obstruction.

So the matching-T2 problem remains open inside this framework.

## 1. The \(k\le 2\) heuristic is false

The informal thought

> "\(\alpha>1/3\) should force every Prolonger move to contain at most two primes \(\le y=n^\alpha\)"

is wrong.

### Correct constraint

Let
\[
k_{\max}(n,y)
:=
\max\{\omega(d): d\le n,\ d\text{ squarefree},\ P^+(d)\le y\}.
\]

Then \(k_{\max}(n,y)\) is the largest \(k\) such that
\[
p_k^\#:=\prod_{j\le k} p_j \le n
\quad\text{and}\quad
p_k\le y,
\]
because among squarefree integers with \(k\) prime factors, the smallest is the primorial \(p_k^\#\).

Now for fixed \(\alpha>0\), \(y=n^\alpha\), we have
\[
\log p_k^\#
=(1+o(1))\,k\log k
\]
and therefore
\[
k_{\max}(n,y)
=(1+o(1))\frac{\log n}{\log\log n}.
\]

Moreover
\[
p_{k_{\max}}
=(1+o(1))\log n
\ll
n^\alpha=y,
\]
so the cutoff \(P^+(d)\le y\) is asymptotically **irrelevant**. The real constraint is just \(p_k^\#\le n\).

So for every fixed \(\alpha\in(1/3,1/2)\), Prolonger can still play squarefree moves with
\[
\omega(d)\asymp \frac{\log n}{\log\log n}
\]
all of whose prime factors are \(\le y\).

That is the precise correction.

## 2. The harmonic-sum lemma is false

Let
\[
S_y(n)
:=
\sum_{d\in\mathcal D_y(n)} \frac1d
=
\sum_{\substack{d\le n\\ d\text{ squarefree}\\ P^+(d)\le y\\ \omega(d)\ge 2}}\frac1d,
\qquad
y=n^\alpha,\ \alpha\in(1/3,1/2).
\]

I claim
\[
S_y(n)\asymp_\alpha \log n.
\]

This is far larger than \((\log\log n)^2\), so the lemma from my prior memo is false in a strong way.

### Upper bound

Ignoring the constraint \(d\le n\),
\[
\sum_{\substack{d\text{ squarefree}\\ P^+(d)\le y}}\frac1d
=
\prod_{p\le y}\left(1+\frac1p\right).
\]

By Mertens,
\[
\prod_{p\le y}\left(1+\frac1p\right)
=
\prod_{p\le y}\frac{1-p^{-2}}{1-p^{-1}}
\sim
\frac{6e^\gamma}{\pi^2}\log y
\asymp_\alpha \log n.
\]

Therefore
\[
S_y(n)\le \prod_{p\le y}\left(1+\frac1p\right)-1-\sum_{p\le y}\frac1p
\ll_\alpha \log n.
\]

### Lower bound via the reciprocal-weight model

Set
\[
E_y:=\prod_{p\le y}\left(1+\frac1p\right).
\]

Define a probability measure on squarefree \(y\)-smooth integers by
\[
\mathbb P_y(d)=\frac{1/d}{E_y}
\qquad
(d\text{ squarefree},\ P^+(d)\le y).
\]

Under this measure, the prime divisibility indicators
\[
X_p:=\mathbf 1_{p\mid d}
\]
are independent, with
\[
\mathbb P_y(X_p=1)=\frac{1/p}{1+1/p}=\frac1{p+1}.
\]

Hence
\[
\log d=\sum_{p\le y} X_p \log p
\]
is a sum of independent bounded variables.

Its mean satisfies
\[
\mu_y:=\mathbb E_y[\log d]
=
\sum_{p\le y}\frac{\log p}{p+1}
=(1+o(1))\sum_{p\le y}\frac{\log p}{p}
=(1+o(1))\log y.
\]

Its variance satisfies
\[
\sigma_y^2
=
\sum_{p\le y}\frac1{p+1}\left(1-\frac1{p+1}\right)(\log p)^2
\le
\sum_{p\le y}\frac{(\log p)^2}{p}
=
\left(\frac12+o(1)\right)(\log y)^2.
\]

Now
\[
\log n = \frac1\alpha \log y =: u \log y,
\qquad
u=\frac1\alpha\in(2,3).
\]

Since \(u>2\), the threshold \(\log n\) is a fixed positive multiple above the mean \(\mu_y\). For large \(y\),
\[
a_y:=\log n-\mu_y \ge c_\alpha \log y
\]
for some \(c_\alpha>0\).

By Cantelli’s inequality,
\[
\mathbb P_y(\log d>\log n)
=
\mathbb P_y(\log d-\mu_y\ge a_y)
\le
\frac{\sigma_y^2}{\sigma_y^2+a_y^2}
\le
\theta_\alpha
<1
\]
for some constant \(\theta_\alpha<1\).

Therefore
\[
\mathbb P_y(d\le n)\ge 1-\theta_\alpha=:c_\alpha'>0.
\]

Returning to reciprocal sums,
\[
\sum_{\substack{d\le n\\ d\text{ squarefree}\\ P^+(d)\le y}}\frac1d
=
E_y\cdot \mathbb P_y(d\le n)
\gg_\alpha
E_y
\asymp_\alpha \log y
\asymp_\alpha \log n.
\]

Subtracting the contributions of \(d=1\) and the primes,
\[
S_y(n)
\ge
c_\alpha \log n - O(\log\log n)
\gg_\alpha \log n.
\]

Combining upper and lower bounds:
\[
\boxed{
S_y(n)\asymp_\alpha \log n.
}
\]

So the harmonic-sum lemma is false.

## 3. Numerical sanity check

For \(\alpha=0.45\), I computed
\[
S_y(n)
=
\sum_{\substack{d\le n\\ d\text{ squarefree}\\ P^+(d)\le y\\ \omega(d)\ge 2}}\frac1d
\]
exactly for moderate \(n\):

| \(n\) | \(y=n^{0.45}\) | \(S_y(n)\) | \(S_y(n)/\log n\) |
|---:|---:|---:|---:|
| \(10^4\) | \(63\) | \(1.8415\) | \(0.200\) |
| \(10^5\) | \(177\) | \(2.6268\) | \(0.228\) |
| \(10^6\) | \(501\) | \(3.4932\) | \(0.253\) |

These values are much closer to a \(\log n\) law than to \((\log\log n)^2\), exactly as the argument above predicts.

## 4. Route B: dynamically install all small semiprimes?

This is the natural alternative after the harmonic-sum route fails.

Let
\[
\mathcal P_2(y)
:=
\{ab\le n/2:\ a,b\le y,\ a,b\text{ prime}\}.
\]

Its size is harmless:
\[
|\mathcal P_2(y)|
\ll
\frac{y^2}{\log^2 y}
=
o\!\left(\frac{n(\log\log n)^2}{\log n}\right)
\qquad
(\alpha<1/2).
\]

So **counting budget is not the problem**.

### Why the dynamic installation argument still fails

The issue is online stability.

One Prolonger move with many small primes can kill many target semiprimes at once.

Example:
\[
x=\prod_{i=1}^k p_i \le n,
\qquad
k\asymp \frac{\log n}{\log\log n},
\]
using the first \(k\) primes. Since \(p_k\sim \log n \ll y\), all of these are \(\le y\).

Then every pair \(p_i p_j\) divides \(x\), so all those semiprimes become illegal as Shortener moves immediately. That is
\[
\binom{k}{2}
\asymp
\left(\frac{\log n}{\log\log n}\right)^2
\]
small semiprimes preempted in one turn.

But this does **not** mean the corresponding future mixed moves are dead.

If a semiprime \(ab\) is merely killed because \(ab\mid x\), it is not in \(A\). A later move \(abu\) need not be comparable with \(x\); it may still be legal.

Concrete toy example:

- Prolonger plays \(x=2\cdot 3\cdot 5\cdot 7=210\).
- Then \(6\) is no longer a legal Shortener move, because \(6\mid 210\).
- But a later number like \(66=2\cdot 3\cdot 11\) is neither a divisor nor a multiple of \(210\), so the disappearance of \(6\) has not by itself killed the whole \(6\)-fiber.

So "play all small semiprimes" is not dynamically robust under arbitrary high-support Prolonger moves.

### Honest status of Route B

Route B is **not disproved**, but it is not closed either.

To make it work, one would need a new theorem of the form:

> If Prolonger uses a high-support small-prime move to preempt many semiprimes at once, then the total future badness of the corresponding pair-fibers is already self-throttled at T2 scale.

That theorem is exactly what I do not have.

## 5. What remains open

The framework now has a precise failure mode.

### What failed

- The naive "all bad mixed moves are charged to squarefree \(y\)-smooth cores \(d\)" idea fails because
  \[
  \sum_{d\in\mathcal D_y(n)}\frac1d
  \asymp_\alpha \log n,
  \]
  which only supports a linear \(O(n)\)-scale charge.

- The naive "Shortener just installs all small semiprimes" idea fails because semiprime targets are not dynamically stable under high-support preemption.

### What would still close the gap

A genuinely online theorem controlling the **2-shadow** of high-support Prolonger moves.

One possible form:

> For every Prolonger prefix \(P\), if \(S(x)\) is the set of small primes \(\le y\) dividing \(x\in P\), then the total future mixed-fiber contribution generated by the pair-shadows
> \[
> \binom{S(x)}{2}
> \]
> is globally bounded by \(O((\log\log n)^2)\), not by the crude reciprocal mass \(O(\log n)\).

If something like that were proved, the matching-T2 upper bound would come back into reach.

## Final conclusion

\[
\boxed{
\text{Lemma A is false, Route B is still open, and the matching-T2 gap remains.}
}
\]

More precisely:

- the "\(k\le 2\)" heuristic is false;
- the harmonic-sum strengthening is false in the strongest relevant sense,
  \[
  \sum_{d\in\mathcal D_y(n)}\frac1d \asymp_\alpha \log n;
  \]
- the remaining obstruction is online control of high-support small-prime moves and their semiprime shadows.

So the matching-T2 upper bound does **not** currently follow from my framework, but the missing theorem is now much clearer than before.

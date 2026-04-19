# Matching-T2 self-attempt (Codex exploratory memo, not promoted)

## Scope

This is my own attempt at the attack plan.

I am **not** claiming a full proof of
\[
L(n)=O\!\left(\frac{n(\log\log n)^2}{\log n}\right).
\]

What I do think I have is:

1. a clean conditional partial theorem at the right scale under a natural mixed-fiber restriction, and
2. a sharper diagnosis of the exact remaining barrier to the full result.

## Setup

Fix
\[
y=n^\alpha,\qquad \alpha\in(1/3,1/2),
\qquad
z=\left\lfloor \frac{n}{2y}\right\rfloor.
\]

Recall the static certificate
\[
S_y
=
\{p\le y\}
\cup
\{z<p\le n/2\}
\cup
\{ab\le n/2:\ a,b>y\text{ prime}\}.
\]

If the game enters the \(S_y\)-residual regime, the remaining upper legal moves are only:

- upper primes, and
- medium semiprimes \(qr\) with \(y<q\le r\le z\),

so the tail is \(O_\alpha(n/\log n)\).

Thus the real problem is the time needed to eliminate the non-residual mixed stage.

## Conditional partial theorem

### Statement

Assume:

1. every Prolonger move contains **at most two prime factors \(\le y\)**, and
2. the large-prime / large-semiprime part of the \(S_y\) program is dynamically stable in the sense suggested in [researcher-15-codex-S_y-static-certificate.md](/Users/omisverycool/erdos-harness/erdos-872/researcher-15-codex-S_y-static-certificate.md:66): once Shortener prioritizes
   \[
   \{z<p\le n/2\}
   \cup
   \{qr\le n/2:\ y<q\le r\},
   \]
   their contribution is \(O_\alpha(n/\log n)\) and does not create a new larger obstruction.

Then Shortener can force
\[
L(n)=O_\alpha\!\left(\frac{n(\log\log n)^2}{\log n}\right).
\]

Equivalently: the matching-T2 upper bound is true in the regime where the only unresolved small-prime cores have size \(1\) or \(2\).

I believe this statement is essentially correct; the proof below is the cleanest version I can currently justify.

## Proof sketch of the partial theorem

### 1. Shortener’s target families

Shortener tries to play, whenever legal:

1. every small prime \(p\le y\),
2. every small semiprime \(ab\le n/2\) with \(a,b\le y\),
3. every large prime \(z<p\le n/2\),
4. every large semiprime \(qr\le n/2\) with \(y<q\le r\).

The static \(S_y\) theorem says that if these divisors are truly present as divisors in the antichain, the game is already in the \(S_y\)-residual regime.

The only issue is dynamic preemption: Prolonger can make some of these divisors illegal before Shortener plays them.

### 2. Activated small cores

Call a small prime \(p\le y\) **activated** if it becomes illegal before Shortener plays it, necessarily because some earlier Prolonger move is divisible by \(p\).

Call a small pair \(ab\le n/2\), \(a,b\le y\), **activated** if it becomes illegal before Shortener plays it, necessarily because some earlier Prolonger move is divisible by \(ab\).

Under the hypothesis "at most two small primes per Prolonger move," every Prolonger move has a canonical small core
\[
d\in \{p\}\cup\{ab\},
\]
namely:

- \(d=p\) if the move contains exactly one prime \(\le y\),
- \(d=ab\) if it contains exactly two primes \(\le y\).

### 3. Residual bad moves are charged to activated cores

Take any move \(x\) that survives outside the \(S_y\)-residual class.

Because it is outside the \(S_y\)-residual class, it has at least one small prime factor \(\le y\).

Under the two-small-prime hypothesis, \(x\) has canonical small core \(d=p\) or \(d=ab\).

If that core \(d\) had been played by Shortener, then \(d\mid x\), so \(x\) would be illegal. Therefore \(d\) must have been activated by an earlier Prolonger move.

So every non-residual move is charged to an activated core \(d\) of size \(1\) or \(2\).

### 4. Count the moves charged to a fixed core

#### Core \(d=p\)

If \(x\) is charged to a small prime \(p\le y\), then
\[
x=p\,m
\]
where every prime factor of \(m\) is \(>y\). Otherwise \(x\) would have had at least two small primes and its canonical core would be a pair.

So \(m\) is \(y\)-rough. Standard rough-number bounds (Brun/Buchstab) give
\[
\#\{m\le n/p:\ P^-(m)>y\}

\ll_\alpha
\frac{n/p}{\log y}
\asymp
\frac{n}{p\log n}.
\]

Hence the total number of moves charged to a prime core \(p\) is
\[
O_\alpha\!\left(\frac{n}{p\log n}\right).
\]

Summing over \(p\le y\),
\[
\sum_{p\le y}\frac{n}{p\log n}
\ll
\frac{n}{\log n}\sum_{p\le y}\frac1p
\ll
\frac{n\log\log n}{\log n}.
\]

#### Core \(d=ab\)

If \(x\) is charged to a small pair \(ab\), then
\[
x=ab\,m
\]
and every prime factor of \(m\) is \(>y\), again by canonicity of the small core.

So \(m\) is \(y\)-rough, and
\[
\#\{m\le n/(ab):\ P^-(m)>y\}
\ll_\alpha
\frac{n}{ab\log n}.
\]

Summing over all small pairs \(ab\le n/2\) with \(a,b\le y\),
\[
\sum_{a<b\le y}\frac{n}{ab\log n}
\ll
\frac{n}{\log n}
\sum_{a<b\le y}\frac1{ab}
\ll
\frac{n(\log\log n)^2}{\log n}.
\]

This is the T2 scale.

### 5. Shortener’s own move budget

The Shortener families listed above have size:

- \(\pi(y)=o(n(\log\log n)^2/\log n)\),
- \(\#\{ab\le n/2:\ a,b\le y\}=O(y^2/\log^2 y)=o(n(\log\log n)^2/\log n)\),
- \(\pi(n/2)-\pi(z)=O(n/\log n)\),
- \(\#\{qr\le n/2:\ y<q\le r\}=O_\alpha(n/\log n)\).

So Shortener’s own budget is also within T2 scale.

Combining with the core-charge bounds yields
\[
L(n)=O_\alpha\!\left(\frac{n(\log\log n)^2}{\log n}\right).
\]

Modulo the stability assumption on the large-prime / large-semiprime part, this proves the conditional partial theorem.

## Why I think this is the right structure

The proof above is exactly the \(S_y\) attack plan, but with the dynamic difficulty isolated into one chargeable object:

- activated small prime cores \(p\),
- activated small pair cores \(ab\).

The T2 scale appears naturally because
\[
\sum_{p\le y}\frac1p
\sim
\log\log n,
\qquad
\sum_{a<b\le y}\frac1{ab}
\asymp
(\log\log n)^2.
\]

So if the mixed stage can really be reduced to at most two small-prime cores, the matching upper bound is basically forced.

## What breaks in the full problem

The missing step is exactly this:

> Why can the full game be reduced to activated cores of size at most \(2\)?

That is not proved.

If Prolonger can keep alive moves with three or more small primes \(\le y\), then the above core-charging argument does not close automatically.

The lower-bound side’s T2 mechanism itself lives on three-prime targets \(acb\), so this is not cosmetic.

## One encouraging numerical sign

I checked the harmonic sums of small cores at \(\alpha=0.45\):

- pair sum
  \[
  H_2(n):=\sum_{p<q\le y,\ pq\le n}\frac1{pq},
  \]
- triple sum
  \[
  H_3(n):=\sum_{p<q<r\le y,\ pqr\le n}\frac1{pqr},
  \]
- quadruple sum
  \[
  H_4(n):=\sum_{p<q<r<s\le y,\ pqrs\le n}\frac1{pqrs}.
  \]

At \(n=10^5,10^6,10^7\), the numerics came out roughly:

- \(H_2 \approx 1.61, 1.97, 2.29\),
- \(H_3 \approx 0.78, 1.10, 1.41\),
- \(H_4 \approx 0.21, 0.36\) (for \(10^5,10^6\)).

Normalized by \((\log\log n)^2\), these are all stable and small.

So at least numerically, even higher small-core harmonic sums still look compatible with the **same T2 scale** rather than forcing higher powers of \(\log\log n\).

That is not a proof, but it is exactly the kind of signal one would want if the full matching-T2 statement were true.

## My current best conjectural next lemma

The right missing lemma may be something like:

> Let
> \[
> \mathcal D_y(n)
> =
> \{d\le n:\ d\text{ squarefree},\ P^+(d)\le y,\ \omega(d)\ge 2\}.
> \]
> Then
> \[
> \sum_{d\in \mathcal D_y(n)}\frac1d
> \ll_\alpha
> (\log\log n)^2
> \qquad
> \text{for }y=n^\alpha,\ \alpha\in(1/3,1/2).
> \]
> 
> If true, then charging residual mixed moves to their canonical small core \(d\) would put the whole non-residual stage at T2 scale.

I have not proved this. But the numerics above say it is at least plausible.

## Honest status

So my own attempt gets to:

1. a plausible conditional partial theorem at exactly the desired scale under the "at most two small primes" hypothesis plus stability of the easy \(S_y\) layers;
2. a plausible conjectural strengthening that would close the full problem if proved.

I do **not** yet have the general matching-T2 upper bound.

But this is the first version of the attack plan that feels mathematically shaped correctly to me.

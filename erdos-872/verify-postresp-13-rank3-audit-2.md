---
id: R13-rank3-audit-2
type: verification
date: 2026-04-18
intent: >
  First of three adversarial audits of Pro Channel A/B rank-3 extension
  theorem (Theorem 5 overlap extension to rank-<=3 carriers).
predecessors: [R13-pro-rank3-extension]
action:
  kind: confirms
  target: R13-pro-rank3-extension
claim: >
  Phase-2 legality (p^2 legal for p in B): airtight given squarefree carriers
  and alpha < 1/2. Phase-4 counting lemma T_alpha(n) = O_alpha(n/log n):
  technically correct for fixed alpha, degenerates as alpha -> 1/2. "No legal
  move survives" induction: basically sound.
siblings: [R13-rank3-audit-4, R13-rank3-audit-6]
---
# Audit of Package A — rank-3 vs loglog (first of three)

Here is the adversarial audit.

1. A’s phase-2 legality claim

Locally, this part is fine once stated correctly.

For a fixed (p\in B), if the prime (p) has not already been chosen by either player, then (p^2) is legal.

Why:

* Size is fine: (p\le y=n^\alpha) with (\alpha<1/2), so (p^2\le n^{2\alpha}<n).
* Against any earlier phase-1 prime (r), comparability with (p^2) happens only if (r=p).
* Against any composite Prolonger carrier (C), since carriers are squarefree:

  * if (p\nmid C), then (C) and (p^2) are incomparable;
  * if (p\mid C), then (p^2\nmid C) because (C) is squarefree, and (C\nmid p^2) because (C) has at least one prime factor besides (p).
* Against an earlier square (q^2) with (q\neq p), there is no divisibility either way.

So the right statement is not “for every (p\in B)” but rather “for each (p\in B) whose prime (p) has not already been played, (p^2) is legal.” On that reading, I do not see a local bug.

2. A’s phase-4 counting lemma

This also checks out, but only as a fixed-(\alpha) bound.

Let
[
T_\alpha(n)=#{p<q<r\le y:\ pqr\le n},\qquad y=n^\alpha,\quad \tfrac13<\alpha<\tfrac12.
]

Split at (pq=n^{1-\alpha}).

For (pq\le n^{1-\alpha}), the number of (r)-choices is at most (\pi(y)), so
[
T_1 \le \pi(y)\cdot #{p<q:\ pq\le n^{1-\alpha}}.
]
The semiprime-count bound gives
[
#{p<q:\ pq\le X}=O!\left(\frac{X\log\log X}{\log X}\right),
]
hence
[
T_1 \ll \frac{n^\alpha}{\log n}\cdot \frac{n^{1-\alpha}\log\log n}{\log n}
= O!\left(\frac{n\log\log n}{\log^2 n}\right)
= o!\left(\frac{n}{\log n}\right).
]

For (pq>n^{1-\alpha}), since (q\le y=n^\alpha), we get
[
p>n^{1-2\alpha},
]
because otherwise (pq\le n^{1-2\alpha}n^\alpha=n^{1-\alpha}).

So
[
T_2 \le \sum_{\substack{n^{1-2\alpha}<p<q\le n^\alpha}} \pi!\left(\frac{n}{pq}\right).
]
And for those terms,
[
\log!\left(\frac{n}{pq}\right)\ge (1-2\alpha)\log n,
]
so
[
\pi!\left(\frac{n}{pq}\right)\ll_\alpha \frac{n}{pq\log n}.
]
Therefore
[
T_2 \ll_\alpha \frac{n}{\log n}\sum_{\substack{n^{1-2\alpha}<p<q\le n^\alpha}}\frac1{pq}.
]
Now
[
\sum_{n^{1-2\alpha}<p\le n^\alpha}\frac1p
= \log\log(n^\alpha)-\log\log(n^{1-2\alpha})+O(1)
= \log\frac{\alpha}{1-2\alpha}+O(1),
]
so the double sum is (O_\alpha(1)). Hence
[
T_2=O_\alpha!\left(\frac{n}{\log n}\right).
]

So (T_\alpha(n)=O_\alpha(n/\log n)) is correct.

But there is a real caveat: the constant blows up as (\alpha\to \tfrac12^{-}), because (\log\frac{\alpha}{1-2\alpha}\to\infty). So this is not uniform near (1/2). That matches the brief’s warning that the slack vanishes as (\alpha\to 1/2).

3. A’s “no legal move survives” induction

On the specific step you flagged, it is airtight.

Take a legal (x) surviving after phase 4 with (|\mathrm{supp}(x)|\ge 4), and choose three prime factors (p,q,r\mid x). Then (pqr\mid x).

If (pqr) was legal after phase 3, phase 4 played it, so (x) is divisible by a chosen move and is illegal.

If (pqr) was not legal after phase 3, some earlier move was comparable with (pqr). Because (pqr) is squarefree of support size 3, that earlier move cannot be a square from phase 2. So the only possibilities are:

* a phase-1 prime among ({p,q,r}),
* a phase-3 semiprime among ({pq,pr,qr}),
* or a Prolonger squarefree carrier with support contained in ({p,q,r}).

In each case the earlier move divides (x). So (x) was already illegal.

So this local induction step is sound.

The only real caveat with A is the same one already noted for the earlier theorem: as written it is an offline “play all legal ( \cdots )” argument, and an online priority-invariant patch is still needed. But on your listed local checks, I do not see a break.

4. Does B sit inside A’s theorem class?

No.

The decisive reason is not even the phase-1 blocks. It is B’s phase 3.

B explicitly plays moves of the form
[
p^*q,\qquad q\in(n^{5/6},,n/2].
]
Those composite Prolonger moves contain a prime factor (q>n^{5/6}), which is far larger than (y=n^\alpha) for every (\alpha<1/2). So B is outside A’s “all prime factors (\le y)” hypothesis immediately.

That is exactly the mixed small/large-fiber case (b) in the brief.

There is also a secondary issue: B’s phase-1 block description does not guarantee rank (\le 3). The blocks are squarefree and use primes (\le n^{1/3}), but “pad until the product is (\approx \sqrt n)” can require three padding primes for very small designated primes if one follows the description literally, which gives rank 4. So even phase 1 is not cleanly inside A as written.

So there is no contradiction between A and B. B escapes A primarily through the large prime (q), and that escape is genuine.

5. Standalone pressure on B

The integral is fine.

With the stated phase-3 interval (q\in(n^{5/6},n/2]), the relevant sum is of the shape
[
\sum_{q}\frac{n/q}{\log(n/q)\log q},
]
and the integral
[
\int_{n^{5/6}}^{n/2}\frac{n/q}{\log(n/q)\log q},dq
]
is indeed (\Theta!\bigl(n\log\log n/\log n\bigr)).

A clean change of variables (u=n/q) gives
[
n\int_{2}^{n^{1/6}}\frac{du}{u\log u,(\log n-\log u)}
\asymp
\frac{n}{\log n}\int_{2}^{n^{1/6}}\frac{du}{u\log u}
====================================================

\Theta!\left(\frac{n\log\log n}{\log n}\right).
]

So that analytic tail is correct.

The 1-to-1 race on the large primes is also broadly plausible: each prime (q\in(n^{5/6},n/2]) can be preempted one-for-one by Shortener playing (q), and Prolonger can likewise claim one fresh (q) per turn by playing (p^*q). So “Prolonger gets a positive constant fraction of those (q)” is believable.

But that is not enough to prove B.

The weak link is the jump from those two facts to the claimed lower bound
[
\sum_{q\in Q} |{p\in B:\ p\le n/q}|
\asymp
\frac{n\log\log n}{\log n}.
]

That requires a much stronger property of the blocked small-prime set (B) than B proves. It is not enough that (|B|) is a constant fraction of (\pi(n^{1/6})). To justify the integral, one needs something like a prefix-density statement:
[
|B\cap[2,x]|\ge c,\pi(x)-O(1)\qquad\text{for all }x\le n^{1/6},
]
or at least the corresponding harmonic-mass lower bound on every scale.

Response B never proves that. It only argues by crude 1-to-1 counting.

There is a second unproved jump too. Even if the complete graph on (B) kills every batch (qM) with (\Omega(M)\ge 2) inside (B), B still has not fully shown that each surviving atom (pq) contributes a distinct unavoidable future move in optimal play. The response asserts that conclusion, but does not rule out all alternate routes to maximality or give an online forcing argument.

So my verdict is:

* **A** survives the local attacks you listed. Its real remaining issue is the standard online-ordering patch, not these internal combinatorial steps.
* **B** is **not** refuted by A, because it lies outside A’s class through the large prime (q).
* **B** also does **not** prove (\Theta(n\log\log n/\log n)). The integral is correct, and the constant-fraction race on the large (q)’s is plausible, but the key scale-distribution lemma on the blocked small-prime set (B) is missing, and the final “therefore all those atoms force distinct moves” step is not established.

The shortest summary is: **A is locally sound on the points you asked about; B is outside A’s scope and remains an unproved mixed-fiber lower-bound sketch, not a theorem.**

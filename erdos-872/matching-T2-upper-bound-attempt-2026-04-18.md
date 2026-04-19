# Matching-T2 upper-bound attempt (April 18 update pass)

## Goal

Attempt a route to
\[
L(n)=O\!\left(\frac{n(\log\log n)^2}{\log n}\right),
\]
which would match the current T2 lower bound and give the sharp rate
\[
L(n)=\Theta\!\left(\frac{n(\log\log n)^2}{\log n}\right).
\]

I do **not** have a proof. What I do have is a much sharper reduction than the existing broad "find any sublinear upper bound" framing.

## Main conclusion

The strongest plausible T2-matching route in the current dossier is:

1. Keep the existing static \(S_y\) certificate.
2. Stop trying to realize it in \(O(n/\log n)\) time.
3. Instead prove that Shortener reaches the \(S_y\)-residual regime in
   \[
   O\!\left(\frac{n(\log\log n)^2}{\log n}\right)
   \]
   moves.
4. Then append the already-known \(O(n/\log n)\) terminal tail.

So the upper-bound problem is no longer "compress the whole game directly." It is:

> Show that the unresolved small-prime stage of the \(S_y\) program has cost at most T2 scale.

## Why this route is plausible

### 1. The static tail is already strong enough

By [researcher-15-codex-S_y-static-certificate.md](/Users/omisverycool/erdos-harness/erdos-872/researcher-15-codex-S_y-static-certificate.md:1), for \(y=n^\alpha\) with \(1/3<\alpha<1/2\),
\[
S_y
=
\{p\le y\}
\cup
\{z<p\le n/2\}
\cup
\{ab\le n/2:\ a,b>y\},
\qquad z=\left\lfloor \frac{n}{2y}\right\rfloor,
\]
has the property that once the game enters the \(S_y\)-residual regime, the remaining upper legal moves are only:

- upper primes, and
- medium semiprimes \(qr\) with \(y<q\le r\le z\).

That tail is \(O_\alpha(n/\log n)\).

### 2. The \(O(n/\log n)\) dream failed for exactly one reason

The Round 16 negative result
[researcher-16-codex-S_y-dynamic-negative.md](/Users/omisverycool/erdos-harness/erdos-872/researcher-16-codex-S_y-dynamic-negative.md:1)
does **not** refute the \(S_y\) route itself. It only refutes the hope that one reaches the \(S_y\)-residual regime in \(O(n/\log n)\) time.

Because T2 says
\[
L(n)\ge c\,\frac{n(\log\log n)^2}{\log n},
\]
the entrance time \(T_y(n)\) to the \(S_y\)-regime must satisfy
\[
T_y(n)\ge \Omega\!\left(\frac{n(\log\log n)^2}{\log n}\right).
\]

That means the \(S_y\) program is already sitting at the **right scale** for a T2-matching upper bound.

## The refined reduction

Fix \(1/3<\alpha<1/2\), set \(y=n^\alpha\), and let \(T_y(n)\) be the first time at which the game has entered the \(S_y\)-residual regime.

From the static theorem,
\[
L(n)\le T_y(n)+O_\alpha(n/\log n).
\]

Therefore, to prove the matching upper bound, it is enough to show
\[
T_y(n)=O\!\left(\frac{n(\log\log n)^2}{\log n}\right).
\]

This is the cleanest currently-known reduction of the matching-T2 problem.

## What the unresolved stage actually is

The semiprime and large-prime pieces of \(S_y\) are not the real issue:

- \(\{z<p\le n/2\}\) has size \(O(n/\log n)\),
- \(\{ab\le n/2:\ a,b>y\}\) also has size \(O(n/\log n)\) for \(y=n^\alpha\), \(\alpha>1/3\).

So the only genuinely load-bearing part is the small-prime layer
\[
\{p\le y\}.
\]

But the real cost is **not** that Shortener must literally play all such primes. There are only \(\pi(y)=o(n(\log\log n)^2/\log n)\) of them anyway.

The real cost is that while those primes remain unresolved, Prolonger can use them to keep upper-half fan structures alive.

So the matching-T2 problem is best read as:

> How fast can Shortener collapse the small-prime support that feeds the T2 upper-half fan?

## The right dynamic object: pair-mass, not just prime-mass

T1 was controlled by one small prime \(a\) paired with one large prime \(b\). T2 is controlled by **pairs** \((a,c)\) of small primes together with a large prime \(b\).

That means a T2-matching upper bound should probably not be formulated in terms of:

- captured prime reciprocal mass \(\sum 1/p\),
- or raw residual counts alone.

It should probably be formulated in terms of **pair mass**
\[
\sum_{a<c\le y}\frac{1}{ac},
\]
or an online surrogate for that quantity.

This is the main conceptual shift.

## Best candidate theorem shape

The most plausible load-bearing theorem now looks like this.

### Candidate theorem

For some fixed \(\alpha\in(1/3,1/2)\), Shortener has a strategy such that by time
\[
O\!\left(\frac{n(\log\log n)^2}{\log n}\right),
\]
every live upper-half target with at least two small prime factors \(\le y\) has been neutralized; equivalently, the game has entered the \(S_y\)-residual regime.

Then the static \(S_y\) theorem finishes the game with only \(O(n/\log n)\) more moves.

## Two equivalent formulations

### Formulation A: dynamic \(S_y\)

Upgrade the static theorem into:

> Shortener can dynamically install the \(S_y\) certificate in T2 time.

This is the most direct formulation.

### Formulation B: product-graph suppression

For each large prime \(b\), define a graph \(G_b\) on small primes \(a\le y\), with edge \(ac\) when the upper-half target \(acb\) is live.

Then the T2 upper bound becomes:

> Shortener can force the total live edge-mass across the \(b\)-fibers to collapse fast enough that only \(O(n(\log\log n)^2/\log n)\) moves occur before all such fibers are dead.

This is closer to the T2 lower-bound mechanism and may be the more natural object.

## How this connects to the existing theorems

### 1. Theorem 6 already handles the all-small-prime part

[researcher-13-pro-rank3-extension.md](/Users/omisverycool/erdos-harness/erdos-872/researcher-13-pro-rank3-extension.md:1)
proves \(O_\alpha(n/\log n)\) against squarefree rank-\(\le 3\) overlapping carriers when **all prime factors are \(\le y\)**.

So the genuinely new difficulty is not rank-3 overlap by itself.

It is:

- rank-3 overlap with **one blocked large prime** \(b\), and
- doing the suppression **online**, not post hoc.

### 2. The blocked-large-prime obstruction explains exactly where to work

[researcher-13-pro2-continuation-response.md](/Users/omisverycool/erdos-harness/erdos-872/researcher-13-pro2-continuation-response.md:1)
shows that once the mixed carrier infrastructure is already installed, post-hoc \(O(n/\log n)\) repair fails.

For T2, that translates into:

> The proof must be online and must suppress the pair/fiber structures before they finish installing.

So the reduction is sharp both positively and negatively:

- static tail: already available,
- post-hoc cleanup: impossible in the hard regime,
- online pair suppression: the real frontier.

## The most credible proof program

### Program 1: dynamic \(S_y\) at T2 scale

1. Fix \(y=n^\alpha\), \(1/3<\alpha<1/2\).
2. Shortener greedily removes small primes \(p\le y\) whenever legal.
3. When Prolonger attempts to build a \(b\)-fiber over two small primes \(a,c\), Shortener prioritizes killing one of:
   - the pair \(ac\),
   - a lateral divisor \(ab\) or \(cb\),
   - or the large prime \(b\) before capture.
4. Prove that the total weighted number of pair-fiber activations before all \(p\le y\) are dead is
   \[
   O\!\left(\frac{n(\log\log n)^2}{\log n}\right).
   \]
5. Invoke the static \(S_y\) certificate.

### Program 2: within-fiber Shortener theorem

The lower-bound side has a Prolonger max-degree-capture theorem. The matching upper probably needs a **Shortener-side dual theorem**:

> In the actual product-interval fiber graphs \(G_b\), Breaker can delete enough vertices/edges online that the total number of eventually forced targets is only \(O(\sum w_b)\), where \(\sum w_b\) is at most T2 scale.

This looks like the sharp missing lemma.

## What I do not think works

### 1. More refined residual counting alone

The existing linear upper bounds already show the ceiling of "count odd residuals after a sieve." That line keeps improving constants, not order.

### 2. Re-trying \(O(n/\log n)\) from inside T2

T2 does not suggest the game is secretly \(n/\log n\) once one zooms in. It suggests exactly the opposite: the only unresolved part of the \(S_y\) program already has the right size to account for the extra \((\log\log n)^2\).

### 3. Post-hoc repair

The continuation theorem and related obstruction notes have already killed that route in the mixed large-prime regime.

## Best current verdict

Matching T2 is still plausible.

In fact it is **more plausible than \(O(n/\log n)\)** after the latest documentation pass, because:

- the lower-bound side already says the small-prime stage must cost at least T2,
- the static \(S_y\) theorem says everything after that stage costs only \(O(n/\log n)\),
- and those two statements fit together naturally.

So the best current synthesis is:

> The matching-T2 upper bound should be attacked as a dynamic \(S_y\) theorem, with the whole burden concentrated on the small-prime / pair-fiber stage.

## Recommended next researcher prompt

The primary model should be asked **not** for "any sublinear upper bound" and **not** for "try Ford somehow."

It should be asked to do one precise thing:

> Prove that for some \(y=n^\alpha\), \(1/3<\alpha<1/2\), Shortener reaches the \(S_y\)-residual regime in \(O(n(\log\log n)^2/\log n)\) moves.

That is the cleanest current path to a matching T2 upper bound.

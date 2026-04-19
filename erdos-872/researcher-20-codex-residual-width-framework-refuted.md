# Residual-width framework closeout: the domination-only lemma is false

## Executive summary

I tried to push Pro's residual-width framework directly. The outcome is definitive and negative:

> The residual-width lemma from Round 18 / Round 19 is false as stated.

In fact, there is a much stronger obstruction:

> For **any** certificate family \(C \subseteq \{2,\dots,n\}\), there is an antichain
> \(A \subseteq (n/2,n]\) with \(|A| \le |C|\) such that \(C \subseteq \mathrm{Comp}(A)\),
> while the residual width satisfies
> \[
> w(R(A)) \ge \frac n2 - |C| - O(1).
> \]

So any static reduction that keeps only the information

1. \(C \subseteq \mathrm{Comp}(A)\), and
2. \(|A| = O(|C|)\),

is far too weak: it still allows residual width to remain essentially linear.

Applied to
\[
C_{n,h} = \{m \le n : \Omega(m) \le h\},
\]
this shows that for every \(h\) with \(|C_{n,h}| = o(n)\) (in particular for the slow-growth choice \(h = \lfloor \log_2 \log\log\log n \rfloor\)), the proposed residual-width conclusion
\[
w(R(A)) \le \frac{n}{(\log n)^{1-o(1)}}
\]
is impossible.

## The upper-half lift obstruction

Let
\[
U_n := \{u \in \mathbb{Z} : n/2 < u \le n\}.
\]
Every subset of \(U_n\) is an antichain under divisibility.

For any \(c \in \{2,\dots,n\}\), define
\[
\lambda_n(c) := c \Big\lceil \frac{\lfloor n/2 \rfloor + 1}{c} \Big\rceil.
\]

### Lemma 1

For every \(c \in \{2,\dots,n\}\),
\[
\lambda_n(c) \in U_n
\qquad\text{and}\qquad
c \mid \lambda_n(c).
\]

#### Proof

Let \(s := \lfloor n/2 \rfloor + 1\). By definition,
\[
\lambda_n(c) = c \Big\lceil \frac{s}{c} \Big\rceil \ge s > \frac n2.
\]
Also
\[
\lambda_n(c) < s + c \le \lfloor n/2 \rfloor + 1 + c \le n + 1.
\]
Since \(\lambda_n(c)\) is an integer, this gives \(\lambda_n(c) \le n\). Thus
\(\lambda_n(c) \in U_n\). Divisibility \(c \mid \lambda_n(c)\) is immediate. \(\square\)

### Theorem 2 (Upper-half lift obstruction)

Let \(C \subseteq \{2,\dots,n\}\) be arbitrary. Then there exists an antichain
\[
A \subseteq U_n
\]
such that

1. \(|A| \le |C|\),
2. \(C \subseteq \mathrm{Comp}(A)\),
3. \(w(R(A)) \ge |U_n| - |C|\).

#### Proof

Take
\[
A := \{\lambda_n(c) : c \in C\}.
\]
By Lemma 1, \(A \subseteq U_n\), hence \(A\) is an antichain. Also \(|A| \le |C|\).

For each \(c \in C\), we have \(c \mid \lambda_n(c)\), so \(c\) is comparable with some element
of \(A\). Therefore
\[
C \subseteq \mathrm{Comp}(A).
\]

Now every element of \(U_n \setminus A\) is incomparable with every element of \(A\), because
distinct elements of \(U_n\) are pairwise incomparable. Hence
\[
U_n \setminus A \subseteq R(A).
\]
Since \(U_n \setminus A\) is itself an antichain,
\[
w(R(A)) \ge |U_n \setminus A| = |U_n| - |A| \ge |U_n| - |C|.
\]
This proves the theorem. \(\square\)

## Consequence for the proposed residual-width lemma

The proposed lemma asked for some \(h = h(n) \to \infty\) such that for every antichain
\(A\) satisfying
\[
C_{n,h} \subseteq \mathrm{Comp}(A)
\qquad\text{and}\qquad
|A| \le 2|C_{n,h}| + 1,
\]
one has
\[
w(R(A)) \le \frac{n}{(\log n)^{1-o(1)}}.
\]

Take \(C = C_{n,h}\) in Theorem 2. Then there exists an antichain \(A\) with
\[
|A| \le |C_{n,h}| \le 2|C_{n,h}| + 1,
\qquad
C_{n,h} \subseteq \mathrm{Comp}(A),
\]
but
\[
w(R(A)) \ge |U_n| - |C_{n,h}|
= \frac n2 - |C_{n,h}| + O(1).
\]

If \(|C_{n,h}| = o(n)\), this gives
\[
w(R(A)) = \left(\frac12 + o(1)\right)n,
\]
which is enormously larger than \(n/(\log n)^{1-o(1)}\).

So the residual-width lemma is false for every sublinear certificate family \(C_{n,h}\), not just
for the specific slow-growth choice.

## What this means for the framework

The failure is not a delicate analytic gap. It is a structural failure of the abstraction.

The current reduction forgets too much. Once one replaces the actual game state by the two facts

- \(C \subseteq \mathrm{Comp}(A)\),
- \(|A| = O(|C|)\),

one can always realize those facts using an antichain parked almost entirely in the top half
\((n/2,n]\), and then the untouched remainder of the top half is still a giant residual antichain.

So any salvage of the residual-width program must use **additional dynamical structure** of the
actual antichain \(A_0\) produced by certificate play. At minimum, it would need hypotheses such as:

- many elements of \(A_0\) are themselves in \(C\), not merely upper-half multiples of \(C\);
- a substantial portion of \(A_0\) lies below \(n/2\);
- the covering of \(C\) is realized through divisors/multiples with controlled scale or controlled
  prime-factor profile;
- or a game-dynamics potential that prevents the "lift everything into \(U_n\)" degeneration.

Without such extra structure, the domination-only residual-width route is dead.

## Bottom line

I did not get a proof from this framework. I got a clean refutation of its current load-bearing
lemma.

The right definitive statement is:

> **Residual-width lemma (Round 19 form): false.**
>
> More strongly, for any sublinear certificate family \(C\), there exist antichains \(A\) of size
> \(\le |C|\) with \(C \subseteq \mathrm{Comp}(A)\) and residual width
> \(\ge n/2 - |C| - O(1)\).

So Pro's residual-width route remains viable only after a major reformulation that incorporates
real game-dynamical constraints, not just static domination of the certificate family.

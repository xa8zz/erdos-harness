Don't search the internet. This is a test to see how well you can craft non-trivial, novel and creative proofs given a "primitive sets and divisibility games" math problem. Provide a full unconditional proof or disproof of the problem.

## Problem

Let $n \geq 2$. Two players alternately pick integers from $\{2, 3, \ldots, n\}$ to add to a common set $A$, subject to the constraint that $A$ remain primitive: no element of $A$ divides another. The game ends when no legal move is possible. One player ("Prolonger") wants the game to last as long as possible; the other ("Shortener") wants it to end as quickly as possible. Let $L(n)$ be the guaranteed game length under optimal play, with Prolonger moving first.

Determine $L(n)$ asymptotically. In particular, decide whether $L(n) = \Theta(n)$ or $L(n) = o(n)$, and if sublinear, give the sharp rate.

## Known progress

### Upper bound

$L(n) \leq (0.18969 + o(1)) n$, with constant $W_4/2 \leq 0.1897123371$. Method: Shortener plays the prefix $\sigma_{15}$ of smallest legal odd primes; the count $K$ of played odd primes is bounded above by a fourth-order Bonferroni inclusion-exclusion. The proof uses (a) odd-part injection of antichains into antichains of odd integers, (b) monotone replacement comparing the played-prime sequence $p_1 < p_2 < \cdots$ to a model bin sequence with $\sup p_j/b_j = 1 + o(1)$, (c) factorial-moment transfer to the simplex integrals $J_r = (1/r!) \int_{\Delta_r} \prod du_i / (1 + u_i)$, and (d) the fourth-order Bonferroni inequality $\#\{\text{survivors}\} \geq \sum_{r=0}^{4} (-1)^r T_r$. Optimising in $r = 4$ gives $W_4/2$.

### Lower bound (best constant)

$L(n) \geq (1/2 - o(1)) \cdot n \log\log n / \log n$. Method (dyadic refinement of fan-capture): Prolonger first runs an activation phase that $H$-secures the small odd primes — every $2^b p$ with $0 \leq b \leq H$ becomes illegal — then applies a right-star capture argument to each dyadic chain $C_{pq} = \{pq, 2pq, 4pq, \ldots\}$ for $n/2^{H+1} < pq \leq n$. This yields $L(n) \geq ((1/2)(1 - 2^{-H-1}) - o_H(1)) n \log\log n / \log n$ for every fixed $H$; let $H \to \infty$ slowly.

### Lower bound (best rate)

$L(n) \geq n / (\log n)^{1 - o(1)}$. Method (divisor-shadow hierarchy): for every fixed $h \geq 1$, $L(n) \geq c_h \cdot n (\log\log n)^h / \log n$ via the upper-half rank-$h$ fan with two-layer fiber capture. Constants $c_h \sim 2^{-(2^h)} / h! \to 0$ prevent reaching $\Theta(n)$ by letting $h$ grow with $n$, but taking $h = \log_2(\log\log\log n)$ slowly gives $n / (\log n)^{1 - o(1)}$.

### Numerical evidence

The ratio $L(n) \log n / n$ stays bounded in $[1.15, 1.50]$ across $n = 10$ to $10^6$ with slow decline, across three independent Shortener heuristics. This is inconsistent with $L(n) = \Theta(n \log\log n / \log n)$ (which would force the ratio to grow as $\log\log n$) and consistent with $L(n) = \Theta(n / \log n)$ up to slowly varying factors.

Optimal-play game lengths $f(n)$ for $n = 2, \ldots, 40$ are
$$1, 2, 2, 3, 3, 4, 4, 5, 5, 5, 5, 6, 6, 7, 7, 7, 7, 8, 8, 9, 9, 10, 10, 11, 11, 11, 11, 11, 12, 13, 13, 14, 14, 14, 14, 15, 15, 16, 16, 16, 16,$$
with offsets $f(n) - \pi(n) = 0, 1, 2, 3, 4$ on the intervals $n \leq 8$, $9 \leq n \leq 20$, $21 \leq n \leq 27$, $28 \leq n \leq 34$, $35 \leq n \leq 40$ respectively.

REMEMBER - this unconditional argument may require non-trivial, creative and novel elements.

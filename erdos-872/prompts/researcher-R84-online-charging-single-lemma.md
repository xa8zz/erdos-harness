Don't search the internet. This is a test to see how well you can craft non-trivial, novel and creative proofs given a "primitive sets and divisibility games" math problem. Provide a full proof or disproof of the charging question stated at the end.

## Setup

For \(n\ge2\), two players alternately choose previously unchosen integers from \(\{2,\ldots,n\}\), always keeping the chosen set an antichain under divisibility (a primitive set). The game ends when the set is maximal. Prolonger moves first and maximizes the number of moves; Shortener minimizes it; \(L(n)\) is the optimal length.

For a position \(A\), write \(U_n=(n/2,n]\cap\mathbb Z\), \(L_n=[2,n/2]\cap\mathbb Z\); \(R(A)\subseteq U_n\) and \(D(A)\subseteq L_n\) are the integers still legal relative to \(A\) (incomparable with every element of \(A\)). For \(d\in D(A)\) let \(\deg_A(d)=\#\{u\in R(A):d\mid u\}\), and \(\Delta(A)=\max_{d\in D(A)}\deg_A(d)\).

## Established facts (complete elementary proofs appended after the prompt; take them as given)

1. For any position of size \(k\) and \(3\le z<n/2\), all but \(2kz^2+C\,2^r\big(n/\sqrt{\log z}+(3/2)^{\pi(z)}\big)\) targets \(u\in R(A)\) have at least \(r\) legal prime-removal divisors \(u/p\) with \(p\le z\). Hence for \(k=o(n)\), almost every live upper target has unboundedly many legal codimension-one divisors, and if additionally \(|R(A)|\ge\eta n\), some legal lower move kills at least \((2\eta-o(1))r(n)\) live targets with \(r(n)\to\infty\).
2. The fractional packing value \(\nu(A)\) (maximize mass on \(R(A)\), every \(d\in D(A)\) seeing mass at most one) is \(o(n)\) uniformly over \(|A|=o(n)\), and there is a static legal antichain \(B\subseteq D(A)\) with \(|B|=o(n)\) covering all but \(o(n)\) of \(R(A)\).
3. Static sublinear completion: for \(|P|=o(n)\), the minimal legal elements \(\mathcal M(P)\) number \(o(n)\) and \(P\cup\mathcal M(P)\) is a maximal primitive set.
4. Smooth/rough trapping: with \(y=\tfrac14\log n\), the minimizing player can in \(o(n)\) actual moves reach a position where every live \(m\) has its \(y\)-smooth part dividing one played carrier and its \(y\)-rough part dividing another.
5. Quadratic regeneration: \(t\) pairwise-incomparable semiprime carriers \(p_iq_i\) leave at least \(t(t-1)\) minimal legal cross-products \(p_iq_j\); one carrier move can make many incomparable members of a sparse cover illegal at once without being comparable with the targets they covered.
6. Insufficiency of pointwise degree: \(r(n)=O(\log\log H)\) fresh kills per turn at horizon \(|A|\asymp n/H\) totals \(o(n)\); the maximum current degree tending to infinity does not by itself self-bootstrap into a sublinear game bound.

## Question

Prove or disprove: there exist \(b(n)=o(n)\) and a constant \(C\) such that for every position \(A\) reachable in the game,
\[
|R(A)|\le b(n)+C\big(|A|+b(n)\big)\Delta(A),
\]
or any amortized variant (for example over dyadic shells, or with targets charged to earlier actual moves with bounded multiplicity) still strong enough that a maximum-degree Shortener strategy and multiplicative decrease force \(L(n)=o(n)\).

A proof resolves the game with \(L(n)=o(n)\). A disproof does not by itself decide the game, but must exhibit the obstruction concretely: a family of reachable positions where the divisor stars cannot be organized into \(O(|A|+o(n))\) bounded-multiplicity certificates, with the arithmetic mechanism identified. Either outcome is valuable; do not force one. If neither is reached, state precisely the single sub-step that cannot be closed.

REMEMBER - this argument may require non-trivial, creative and novel elements.

<!-- Dispatched 2026-07-11 with the R80 and R81 response bodies appended verbatim as "Appended proofs A/B" (see researcher-80-*.md and researcher-81-*.md). -->

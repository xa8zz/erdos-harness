---
id: R13-pro-matching-obstruction-dense-pair
type: research
date: 2026-04-18
intent: >
  Attempt to prove L(n) = O(n log log n / log n) matching upper bound; if
  impossible, identify the structural obstruction at that scale.
predecessors: [R13-pro-upper-half-fan-lower-bound]
siblings: [R13-pro-matching-obstruction-triple-fan]
prompt: erdos-872/prompts/round13-matching-upper-bound-followup.md
action:
  kind: standalone
claim: >
  No matching upper bound visible. Dense pair-carrier graph E_2 = {2pq : p<q
  odd primes, 2pq<=n} is the next structural obstruction: residual |M_Q|
  after E_2 installation is >> n log log n / log n, blocking the O(n log log n
  / log n) upper bound.
---
# Round 13 matching-upper-bound follow-up — response #1

I do **not** see a rigorous matching upper bound from the material in the brief. More importantly, trying to prove one exposes a new structural obstruction at exactly the proposed upper-bound scale.

The obstruction is this: once the lower bound has reached

[
\frac{n\log\log n}{\log n},
]

the next natural Prolonger object is no longer the upper-half fan (ab\in(n/2,n]). It is the dense pair-carrier graph

[
\mathcal E_2:={2pq:p<q\text{ odd primes},\ 2pq\le n}.
]

This family itself has size only

[
|\mathcal E_2|
\sim \frac n2\frac{\log\log n}{\log n},
]

so it lies inside the candidate (O(n\log\log n/\log n)) budget. But if a triangle-rich portion of it is installed, it creates many more forced residual moves.

Here is the clean static obstruction.

Let

[
R_3:={pqr:p<q<r\text{ odd primes},\ n/2<pqr\le n}.
]

If (\mathcal E_2) is installed, then every (m=pqr\in R_3) is an isolated maximal legal move.

Indeed, take (T={p,q,r}). Every carrier (2uv\in\mathcal E_2) contains the prime (2), while (T) does not, so (T) is incomparable with every carrier support. Every proper subset of (T) is contained in one of

[
{2,p,q},\qquad {2,p,r},\qquad {2,q,r},
]

and the corresponding carriers (2pq,2pr,2qr) all lie in (\mathcal E_2), since for example

[
2pq\le \frac{2pqr}{r}\le \frac{2n}{3}<n.
]

So (T) is a legal circuit. Since (m>n/2), it has no proper multiple (\le n). Thus (m) is isolated.

By Landau’s estimate for integers with three prime factors,

[
|R_3|
=====

\left(\frac14+o(1)\right)\frac{n(\log\log n)^2}{\log n}.
]

So a carrier family of size

[
\asymp \frac{n\log\log n}{\log n}
]

can post-hoc force

[
\asymp \frac{n(\log\log n)^2}{\log n}
]

residual moves.

That does **not** prove the larger lower bound, because reachability is the issue. But it shows that a matching upper bound

[
L(n)=O!\left(\frac{n\log\log n}{\log n}\right)
]

would need to prove a strong online prevention theorem: Shortener must prevent Prolonger from installing a triangle-rich subgraph of (\mathcal E_2), not merely prevent the earlier sparse (O(n/\log n)) triangle construction.

The exact online barrier can be stated as a graph game.

Let (H_n) be the graph whose vertices are odd primes and whose edges are

[
pq\in E(H_n)\quad\Longleftrightarrow\quad 2pq\le n.
]

A Prolonger carrier (2pq) corresponds to claiming the edge (pq). A Shortener move (p) deletes all incident edges unless (p) has already been protected by a previous Prolonger edge. A Shortener move (pq) deletes the single edge (pq). Once both endpoint primes are protected, Shortener has no vertex deletion left against that edge; she is reduced to one-for-one edge deletion.

The upper-bound problem therefore contains the following core subproblem:

**Online product-triangle suppression problem.** Can Shortener, in the edge game on (H_n), force the final Prolonger-claimed graph (G\subseteq H_n) to satisfy

[
#{p<q<r:\ n/2<pqr\le n,\ pq,pr,qr\in E(G)}
==========================================

O!\left(\frac{n\log\log n}{\log n}\right)?
]

If yes, this removes the dense-shadow obstruction and supports the conjectural upper bound. If no, then the true game value is at least

[
\Omega!\left(\frac{n(\log\log n)^2}{\log n}\right),
]

so the proposed (\Theta(n\log\log n/\log n)) rate is false.

This is not the same as the earlier sparse-subset obstruction. The sparse construction used only (O(n/\log n)) carriers and forced (n\log\log n/\log n) residual moves. The dense-shadow obstruction uses (O(n\log\log n/\log n)) carriers and would force (n(\log\log n)^2/\log n) residual moves. Once the fan lower bound is accepted, this denser obstruction becomes the relevant one.

The usual “rank-four collapse” does not neutralize this rank-three obstruction. For targets such as (2a_1a_2b), Shortener may have lateral divisors (a_1b) that kill many targets at once. But for the rank-three residual (pqr) produced by carriers (2pq,2pr,2qr), the necessary blockers are exactly the pair carriers. After the endpoint primes are protected, Shortener’s move (pq) kills only the one carrier (2pq). There is no obvious lateral move that kills many pair carriers simultaneously.

So the situation is sharper than “the upper bound is hard.” A matching upper bound must prove an online triangle-removal theorem for the product graph (H_n). Static counting alone goes the other way: (\mathcal E_2) is small enough to fit inside the proposed upper-bound budget but rich enough to generate a full extra (\log\log n) factor.

My current assessment is therefore:

[
\boxed{\text{The matching upper bound is not established by the known tools.}}
]

The structural obstruction suggests that a third rate,

[
L(n)\asymp \frac{n(\log\log n)^2}{\log n}
]

or even an iterated higher-shadow rate, is a genuine possibility unless Shortener has a strong online product-triangle suppression strategy. The next decisive theorem is not a semiprime fan estimate; it is the product-graph triangle game above.

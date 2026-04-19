# Round 13 matching-upper-bound follow-up — response #2

I do **not** see a rigorous matching upper bound from the supplied facts. More importantly, I think the current “rank-(\ge4) collapse” heuristic is not strong enough to justify (O(n\log\log n/\log n)). There is a concrete second-order obstruction that any matching upper proof must defeat.

The rigorous state remains

[
\boxed{
\frac18,\frac{n\log\log n}{\log n}(1-o(1))
\le L(n)
\le \frac{5}{16}n+o(n).
}
]

The upper-half semiprime fan kills (O(n/\log n)), but it does **not** yet settle the sharp rate. The next obstruction is an upper-half **triple fan**, and it is not neutralized merely by the lateral moves (a_1b).

Here is the clean reduction I would put on the board.

Take a fixed (\eta<1/4), let

[
Y=n^\eta,\qquad P={p\text{ prime}:5\le p\le Y}.
]

First run the established upper-half semiprime activation only as a protection phase. Prolonger activates small primes (p\in P) by playing upper-half targets (pb\in(n/2,n]). The usual smallest-first pairing gives a protected set (P_0\subseteq P) with

[
\sum_{p\in P_0}\frac1p
\ge
\left(\frac12+o(1)\right)\log\log n.
]

Once (p\in P_0) is activated, Shortener can no longer play (p).

Now consider pairs

[
D={{p,q}:p<q,\ p,q\in P_0}.
]

Their reciprocal mass is

[
W(D):=\sum_{{p,q}\in D}\frac1{pq}
=================================

\frac12\left(\left(\sum_{p\in P_0}\frac1p\right)^2
-\sum_{p\in P_0}\frac1{p^2}\right)
\gg (\log\log n)^2.
]

Prolonger can then try to activate pair-divisors (pq) by playing upper-half triples

[
pqb,\qquad b\in\left(\frac{n}{2pq},\frac npq\right]\cap\mathbb P.
]

For (pq\le Y^2=n^{2\eta}), this interval contains

[
\gg \frac{n}{pq\log n}
\ge
\gg \frac{n^{1-2\eta}}{\log n}
]

primes. Since (\eta<1/4), this is much larger than the number of pair-activation turns,

[
|D|\ll \frac{n^{2\eta}}{(\log n)^2}.
]

So prior play cannot exhaust the available (b)’s for a live pair.

If Shortener kills a pair (pq) directly by playing (pq), Prolonger’s smallest-product activation rule pairs that kill with a prior activated pair (p'q'\le pq), hence

[
\frac1{p'q'}\ge \frac1{pq}.
]

Thus the activated pair set (D_0) can be forced to satisfy

[
W(D_0)\ge \frac12 W(D)
\gg (\log\log n)^2.
]

After discarding the high primes (b) touched during activation, the remaining triple reservoir has size

[
|E|
\gg
\frac n{\log n}
\sum_{{p,q}\in D_0}\frac1{pq}
\gg
\frac{n(\log\log n)^2}{\log n}.
]

This part is not yet a lower bound, because Shortener still has lateral moves. But it is a serious obstruction to a matching upper.

For a target

[
pqb\in(n/2,n],
]

the relevant proper divisors are

[
p,\quad q,\quad b,\quad pq,\quad pb,\quad qb.
]

After the first two activation phases, (p,q,pq) are illegal for activated (p,q,pq). The remaining destructive options are therefore:

[
b,\qquad pb,\qquad qb,
]

plus playing the target itself.

For each high prime (b), define a graph (G_b) on vertex set (P_0), with edge (pq) present if

[
{p,q}\in D_0
\quad\text{and}\quad
n/2<pqb\le n.
]

Inside this (b)-fiber, Shortener’s move (pb) deletes the vertex (p), unless (pb) has already been made illegal by a prior target containing (p) and (b). Prolonger’s move (pqb) protects both vertices (p) and (q) in that fiber, because (pb\mid pqb) and (qb\mid pqb).

So the capture phase becomes a graph game:

Prolonger chooses an edge and protects its two endpoints. Shortener deletes one still-unprotected vertex by playing (pb), or deletes the whole fiber by playing (b) before it is captured. Edges whose two endpoints are protected are then forced one-by-one, because their divisors (p,q,pq,pb,qb,b) are all illegal and the target is in the upper half.

This is the exact place where the matching upper bound must win.

The often-cited lateral move (pb) does **not** automatically collapse the triple fan. It only deletes an unprotected vertex in the (b)-fiber. Once Prolonger has played one target (pqb), the move (pb) is illegal forever.

A simple star example shows the issue. Suppose for a fixed (b), the activated pair graph is a star

[
{pq_i:1\le i\le t}.
]

Prolonger first plays (pq_1b). Then (pb) is illegal. If Shortener plays (q_2b), Prolonger plays (pq_3b), and so on. Shortener deletes at most one leaf per move, while Prolonger protects one new leaf per move. Prolonger forces (\gg t) targets from the star, not (O(1)).

So the rank-(4) “lateral collapse” heuristic is incomplete. The lateral move (pb) is powerful only before (p) is protected in that (b)-fiber. Prolonger protects two fiber vertices per target; Shortener deletes one. That local (2)-versus-(1) protection economy is exactly what has to be analyzed.

This creates a precise unresolved subproblem.

Let (G) be an arbitrary graph. Consider the local protection game:

* Prolonger chooses an edge (uv), thereby protecting (u) and (v).
* Shortener deletes one unprotected vertex.
* Protected vertices cannot later be deleted.
* At the end, every edge with both endpoints protected is forced.

If Prolonger can force (c|E(G)|) protected edges in this game for some absolute (c>0), then the second-order fan above gives

[
L(n)
\ge
c'\frac{n(\log\log n)^2}{\log n},
]

so the proposed upper bound (O(n\log\log n/\log n)) is false.

Conversely, to prove

[
L(n)=O(n\log\log n/\log n),
]

Shortener needs a much stronger statement: in the actual product-interval graphs (G_b), the lateral moves (pb) must destroy a (1-o(1)) fraction of the reservoir, saving an entire factor of (\log\log n). The simple star and complete-bipartite fiber examples show that this cannot follow merely from “one lateral move kills many edges.” Prolonger can often protect the batching center before Shortener uses it.

My conclusion is therefore:

[
\boxed{
\text{No matching upper bound is currently justified by the supplied tools.}
}
]

And more sharply:

[
\boxed{
\text{The real next obstruction is the activated-pair / fiber-graph protection game.}
}
]

This obstruction suggests that (L(n)) may genuinely be

[
\omega!\left(\frac{n\log\log n}{\log n}\right),
]

possibly beginning with a second-order lower bound of order

[
\frac{n(\log\log n)^2}{\log n}.
]

But I would not claim that as a theorem without proving the local fiber-graph protection lemma and the global scheduling across (b)-fibers. Those are exactly the missing pieces.

So the central question has shifted again. The current tight rigorous bounds are still

[
\boxed{
\Omega!\left(\frac{n\log\log n}{\log n}\right)
\le L(n)
\le \frac{5}{16}n+o(n).
}
]

The next decisive problem is no longer the original semiprime fan. It is whether Shortener can suppress the second-order activated-pair fan by a full factor of (\log\log n). If he can, (O(n\log\log n/\log n)) remains plausible. If he cannot, the true rate is already larger than the current candidate.

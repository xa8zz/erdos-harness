---
id: R78-fractional-invariant-interdiction-frontier
type: research
date: 2026-07-11
intent: >
  Full unconditional resolution attempt for the divisibility antichain game
  starting from the unconditional rank-three lower bound and the
  fixed-rank/prime-cover no-go map, with the complete lower-bound proofs
  supplied.
predecessors:
  - R75-unconditional-rank-three-paper-integration
  - R76-fixed-rank-raw-closure-obstructions
  - R77-prime-cover-quotient-boundary
action:
  kind: extends
  target: R74-online-interdiction-frontier
claim: >
  No unconditional resolution of the linear-versus-sublinear dichotomy.
  Three new unconditional pieces: (1) a fractional residual invariant: with
  nu(A) the LP value of fractionally packing live upper-half targets so
  every legal lower move sees mass at most one, T + nu(A) is nondecreasing
  under every legal move, so any reachable state with nu(A) >= cn forces
  L(n) >= cn; (2) after k = o(n) moves, only o(n) live upper-half targets
  can have every proper divisor illegal (quantitatively
  O(n/log z + k z^2 + e^{O(z)})), via a witness-pair count and Mertens;
  (3) a generic scored rank-r residual system with r+1 edges (the r-subsets
  of an (r+1)-set) lets the maximizer force only one scored edge, so no
  rank-independent constant-fraction residual capture theorem exists
  without arithmetic structure, and at central rank r ~ log log n the
  generic bound leaves only an O(1/log log n) fraction. The dichotomy
  reduces to: force nu(A) >= cn against arbitrary mixed composite
  separators (linear side), or prove an online interdiction theorem in
  which some legal divisor kills unbounded new target mass except for a
  sublinear injectively-chargeable family (sublinear side).
implications:
  - The fractional invariant nu(A) is a new potential-function route to a linear lower bound, replacing shield-prefix reductions; the missing step is a Prolonger strategy forcing nu(A) >= cn.
  - The exact-only-target lemma supplies divisor abundance after any sublinear prefix but not shared kills or injective charging, localizing the sublinear side to exactly the online interdiction frontier.
  - Raising the construction rank toward log log n cannot yield linearity through any generic residual capture theorem; additional arithmetic structure is unavoidable.
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/researcher-R78-solution-attempt-rank-three-base.md
---

## Verdict

I do **not** have a valid unconditional proof of either (L(n)=\Theta(n)) or (L(n)=o(n)). The supplied manuscript establishes only

[
L(n)\gg_\delta \frac{n(\log\log n)^2}{\log n}
]

and

[
L(n)\le \bigl(0.1897123371+o(1)\bigr)n,
]

together with several barriers that rule out natural ways of closing the gap. Those statements are compatible with both alternatives. 

Claiming a resolution would therefore require a genuinely new step. I found two unconditional structural lemmas, given below, but neither supplies that missing step. In particular, they expose precisely where a plausible-looking “proof” would become invalid.

---

# 1. A fractional residual invariant

Let (A) be the antichain already played. Write

[
U(A):={u\in U_n:u\text{ is legal relative to }A},
]

and

[
D(A):={d\in L_n:d\text{ is legal relative to }A}.
]

Define the linear program

[
\nu(A):=
\max \sum_{u\in U(A)}z_u
]

subject to

[
0\le z_u\le 1
\qquad(u\in U(A))
]

and

[
\sum_{\substack{u\in U(A)\d\mid u}}z_u\le 1
\qquad(d\in D(A)).
\tag{1}
]

Thus (\nu(A)) is a fractional packing of the live upper-half targets in which every currently legal lower move sees total mass at most one.

## Lemma 1

For every legal move (m) from (A),

[
\nu(A\cup{m})\ge \nu(A)-1.
\tag{2}
]

Consequently, if (T) is the number of moves already made, then

[
T+\nu(A)
]

is nondecreasing throughout the game. In particular, from any state (A), every continuation to a terminal position has at least (\nu(A)) further moves.

### Proof

Take an optimal solution (z) for (\nu(A)).

First suppose (m\in U_n). Distinct upper-half integers are incomparable, so the only upper variable removed is (z_m). Restrict (z) to (U(A)\setminus{m}). Legality can only decrease after a move, so every lower constraint surviving in (D(A\cup{m})) was already present in (D(A)). The restricted vector is therefore feasible, and its objective is at least

[
\nu(A)-z_m\ge \nu(A)-1.
]

Now suppose (m\in L_n). The upper variables removed are precisely those indexed by live upper multiples of (m). Since (m) was legal, constraint (1) for (d=m) gives

[
\sum_{\substack{u\in U(A)\m\mid u}}z_u\le 1.
]

After deleting those variables, every surviving lower constraint remains satisfied. Hence again

[
\nu(A\cup{m})\ge \nu(A)-1.
]

Each actual move increases (T) by one, proving monotonicity of (T+\nu(A)).

At a terminal position there is no legal upper-half integer, so (\nu=0). Telescoping (2) proves the continuation bound. ∎

The dual program is

[
\nu(A)=
\min\left(
\sum_{d\in D(A)}y_d+\sum_{u\in U(A)}s_u
\right)
]

over (y_d,s_u\ge0), subject to

[
s_u+\sum_{\substack{d\in D(A)\d\mid u}}y_d\ge1
\qquad(u\in U(A)).
\tag{3}
]

Thus (\nu(A)) is also the minimum fractional cost of covering the live upper half by legal lower shadows and singleton upper moves.

For example, initially one may put unit mass on every prime in ((n/2,n]), so

[
\nu(\varnothing)\ge
\pi(n)-\pi(n/2)
===============

\left(\frac12+o(1)\right)\frac n{\log n}.
]

The importance of Lemma 1 is that a proof of (\Theta(n)) could be obtained by forcing a state (A) with

[
\nu(A)\ge c n.
\tag{4}
]

No currently supplied construction establishes (4). Conversely, the dual formulation (3) does not prove an upper bound because it is static: a cover element can later be preempted by a carrier, and recomputing fractional covers does not produce an injective accounting of actual moves.

---

# 2. Few upper targets can become “exact-only” after (o(n)) moves

For (P\subseteq V_n), define

[
\mathcal F_U(P):=
\left{
m\in U_n:
\begin{array}{l}
m\text{ is incomparable with every }c\in P,[2mm]
\text{and for every }d\mid m,\ 2\le d<m,\
d\mid c\text{ for at least one }c\in P
\end{array}
\right}.
]

These are upper-half targets that remain live even though every proper divisor has been preempted by a carrier in (P).

## Lemma 2

Uniformly for every (P\subseteq V_n) with (|P|=k=o(n)),

[
|\mathcal F_U(P)|=o(n).
\tag{5}
]

More quantitatively, for every (z\to\infty) sufficiently slowly,

[
|\mathcal F_U(P)|
\ll
\frac n{\log z}
+
kz^2
+
e^{O(z)}.
\tag{6}
]

### Proof

Fix a prime (p\le z), and consider (m\in\mathcal F_U(P)) divisible by (p). Since (m>n/2) and (p\le z=o(n)), the integer

[
d:=\frac mp
]

is a proper divisor of (m). By the definition of (\mathcal F_U(P)), choose (c\in P) such that (d\mid c), and write

[
c=de.
]

Because (c\le n) and (m>n/2),

[
e=\frac cd
\le
\frac n{m/p}
============

\frac{np}{m}
<2p.
\tag{7}
]

For fixed (c) and (p), the pair ((c,e)) determines (m), since

[
m=\frac{pc}{e}.
]

There are fewer than (2p) possible values of (e). After choosing one witness (c) for every (m), this gives

[
#{m\in\mathcal F_U(P):p\mid m}
\le (2p-1)k.
\tag{8}
]

Consequently,

[
#{m\in\mathcal F_U(P):P^-(m)\le z}
\le
\sum_{p\le z}(2p-1)k
\ll kz^2.
\tag{9}
]

It remains to count the integers with no prime factor at most (z). Put

[
Q_z:=\prod_{p\le z}p.
]

The number of integers at most (n) coprime to (Q_z) is at most

[
\left(\frac n{Q_z}+1\right)\varphi(Q_z)
\le
n\prod_{p\le z}\left(1-\frac1p\right)+Q_z.
]

Mertens’ theorem and (\vartheta(z)\sim z) give

[
\prod_{p\le z}\left(1-\frac1p\right)\ll\frac1{\log z},
\qquad
Q_z=e^{O(z)}.
]

Combining this with (9) proves (6).

Since (k=o(n)), choose (z=z(n)\to\infty) so slowly that

[
kz^2=o(n)
\quad\text{and}\quad
e^{O(z)}=o(n).
]

Then (6) gives (5). ∎

## Game-theoretic corollary

After (t=o(n)) actual moves, only (o(n)) live upper-half targets can have every proper divisor already illegal.

Indeed, let (P) be the set of all moves made so far. If a live (m\in U_n) has every proper divisor (d) illegal, then the played number witnessing illegality cannot divide (d), because it would then divide (m), contradicting the legality of (m). Hence (d) must divide a played carrier, so (m\in\mathcal F_U(P)).

This is a genuine structural restriction: until a linear number of moves has occurred, almost every live upper target still possesses a legal proper divisor.

It nevertheless does **not** prove (L(n)=o(n)). It says that legal divisors exist, but not that one legal divisor is shared by many as-yet-unresolved upper targets. Shortener might have to spend nearly one move per target. Turning (5) into a sublinear game bound requires exactly the missing online, disjoint charging theorem highlighted in the manuscript.

---

# 3. Why increasing the rank of the lower construction cannot automatically prove linearity

A tempting route to (\Theta(n)) is to extend the rank-three construction to targets having about (\log\log n) small prime factors, where the target population becomes linear. A generic residual capture theorem cannot retain a constant fraction at such rank.

## Proposition 3

For every (r\ge1), there is a scored rank-(r) residual hypergraph with (r+1) edges in which the maximizing player can force only one scored edge.

### Proof

Take vertex set

[
V={1,\ldots,r+1}
]

and edges

[
E_i=V\setminus{i},
\qquad 1\le i\le r+1.
]

These are the (r)-subsets of an ((r+1))-set.

The maximizing player first scores some edge (E_j), thereby capturing all vertices except (j). The minimizing player deletes the still-uncaptured vertex (j). Every other edge (E_i), (i\ne j), contains (j), so all (r) remaining edges are deleted. Exactly one of the (r+1) edges has been scored. ∎

Thus no theorem valid for arbitrary scored rank-(r) residual systems can guarantee more than a (1/(r+1)) fraction. The exponential (1/8) loss in the supplied rank-three proof might be improvable at fixed rank, but a rank-independent positive fraction is impossible without exploiting additional arithmetic structure. At central rank (r\asymp\log\log n), the generic obstruction alone leaves an (O(1/\log\log n)) fraction, not a linear lower bound.

---

# What remains missing

The two alternatives require fundamentally different new theorems.

To prove (L(n)=\Theta(n)), one needs a Prolonger strategy forcing a linear residual bank—for example, a state satisfying (4)—while surviving arbitrary mixed composite separators. Prime packets and fixed-rank target systems do not do this.

To prove (L(n)=o(n)), one needs an online interdiction theorem of roughly the following form:

> Whenever a linear family of upper targets remains, Shortener can choose one legal divisor whose **newly killed** target mass is unbounded, except for a sublinear family chargeable injectively to earlier moves.

Lemma 2 supplies the abundance of legal divisors after a sublinear prefix, but not the required sharing or injective charging. Static shadow sums, fixed-rank closure, generic set-cover relaxations, and repeated certificate counting all fail precisely at this point, as documented in the supplied manuscript. 

Accordingly, the only mathematically defensible conclusion is

[
\boxed{
\frac{n(\log\log n)^2}{\log n}
\ll L(n)
\le
(0.1897123371+o(1))n,
}
]

with the dichotomy (L(n)=\Theta(n)) versus (L(n)=o(n)) **not resolved by a valid unconditional argument here**.

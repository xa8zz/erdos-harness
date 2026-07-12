---
id: R83-block-harvest-temporal-hall
type: research
date: 2026-07-12
intent: >
  Convert cross-product regeneration into an actual-move Prolonger
  strategy on the linear side, given the sublinear packing value and
  pointwise-interdiction results.
predecessors:
  - R81-static-completion-smooth-rough-sweep
  - R80-nu-sublinear-sparse-covers-charging-gap
action:
  kind: extends
  target: R81-static-completion-smooth-rough-sweep
claim: >
  No resolution. Block Harvest Theorem: within a cross-product block on
  primes p_1..p_m with core b (n/2 < b p_i p_j <= n), Prolonger has an
  actual strategy forcing Omega(m^2) actual moves against arbitrary play
  with every proper divisor accounted — a genuine linear-side mechanism
  stronger than a static reservoir, and small fractional packing is not
  an online obstruction. The obstruction is arithmetic density: one block
  occupies o(n) board elements; scaling requires many blocks sharing
  arithmetic coordinates, and shared cores make one Shortener move kill
  the i-star in every block whose core is divisible by the chosen c (the
  cross-core problem is the tensor product of the graph-index ownership
  game with the divisibility game on the core family). The semiprime
  block exhibits a severe Hall failure absorbed only by its own o(n)
  size. The single unresolved sub-step is a temporal, shell-stable
  Hall-capacity bound for carrier-loss incidences: a linear Prolonger
  strategy must concatenate Hall failures into a linear conveyor while
  preventing cross-core mixed divisors, and an o(n) proof must show such
  failures cannot form a linear conveyor.
implications:
  - Cross-product regeneration is now a proven harvestable mechanism at block scale; only coordinate-sharing (the same object as the entry race) blocks linear scaling.
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/followup-R83-linear-side-regeneration-strategy.md
---

# Verdict

I do **not** obtain an unconditional proof of either (L(n)=\Theta(n)) or (L(n)=o(n)).

I do obtain a genuine linear-side mechanism that is stronger than a static reservoir: a cross-product block in which Prolonger forces (\Omega(m^2)) **actual moves** against arbitrary Shortener play, with every proper divisor accounted for. The obstruction is arithmetic density: every isolated implementation of this mechanism occupies only (o(n)) board elements. Making many blocks share arithmetic coordinates introduces mixed divisors that couple the blocks, and controlling those mixed divisors is equivalent to the unresolved online amortization problem.

The exact remaining sub-step is a temporal, shell-stable Hall-capacity bound for carrier-loss incidences. I state it precisely below.

---

# 1. A cross-product block that really can be harvested

The following is an actual Prolonger strategy, not merely a construction of a large live set.

## Block Harvest Theorem

Let (b\ge 1), and let

[
p_1,\ldots,p_m
]

be distinct primes not dividing (b), such that

[
\frac n2 < b p_i p_j\le n
\qquad
(1\le i<j\le m).
\tag{1}
]

Define

[
u_{ij}=b p_i p_j,
\qquad
\mathcal F={u_{ij}:1\le i<j\le m}.
]

Then Prolonger has a strategy that selects at least

[
\frac{m^2}{9}-O(m^{3/2})
\tag{2}
]

members of (\mathcal F), regardless of Shortener’s moves elsewhere on the board.

## Divisor classification

Because every (u_{ij}>n/2), a board element comparable with (u_{ij}) is either (u_{ij}) itself or a divisor of it.

Every divisor of (u_{ij}) has one of the forms

[
c,\qquad c p_i,\qquad c p_j,\qquad c p_i p_j,
\qquad c\mid b.
\tag{3}
]

Its shadow on (\mathcal F) is therefore exactly one of the following:

[
\begin{aligned}
c&:\quad &&\text{all of }\mathcal F,\
c p_i&:\quad &&{u_{ik}:k\ne i},\
c p_i p_j&:\quad &&{u_{ij}}.
\end{aligned}
\tag{4}
]

Thus every Shortener move affecting (\mathcal F) is one of:

1. a global move killing the whole block;
2. an index-star move killing every edge incident with one index;
3. an exact move killing one target.

There are no unclassified mixed divisors.

## Phase I: acquire indices

Prolonger first selects any (u_{ij}). This immediately makes every global divisor (c\mid b), (c\ge2), illegal. It also makes every star divisor (c p_i) and (c p_j) illegal.

Call an index **owned** once it has appeared in a Prolonger-selected member of (\mathcal F). Call an index **spoiled** if, before it was owned, Shortener selected some (c p_i) and thereby killed its whole star.

During the acquisition phase, Prolonger repeatedly selects a live edge whose two endpoints are neither owned nor spoiled.

Suppose Prolonger has made (t) acquisition moves. Then:

* exactly (2t) indices are owned, since acquisition edges have disjoint endpoints;
* Shortener has had at most (t) intervening moves;
* at most (t) indices are spoiled;
* at most (t) individual edges among the remaining indices have been killed exactly.

Let (f) be the number of indices that are still neither owned nor spoiled. If acquisition stops because no live edge remains between them, then every one of their (\binom f2) pairs must have been killed exactly. Hence

[
\binom f2\le t,
]

so

[
f\le \sqrt{2t}+1.
\tag{5}
]

Since every index is owned, spoiled, or still free,

[
m\le 2t+t+\sqrt{2t}+1.
]

Consequently,

[
t\ge \frac m3-O(\sqrt m),
\tag{6}
]

and the number (s=2t) of owned indices satisfies

[
s\ge \frac{2m}{3}-O(\sqrt m).
\tag{7}
]

Notice that a completely irrelevant Shortener move only helps this argument: it consumes a turn without spoiling an index or killing an edge.

## Phase II: harvest the owned clique

Consider the (\binom s2) targets whose two indices are owned.

For each owned index (i), some previously selected Prolonger target contains (b p_i). Therefore every divisor (c p_i), (c\mid b), is now illegal. Every global divisor (c\mid b) has also been illegal since Prolonger’s first move.

It follows from (4) that any subsequently legal Shortener move can remove at most **one** remaining target inside the owned clique.

Before harvesting starts, at most (t) internal edges were used in the acquisition phase and at most (t) were killed exactly by Shortener. Hence at least

[
\binom{2t}{2}-2t
================

2t^2-3t
\tag{8}
]

internal targets remain.

Shortener moves first after the last acquisition move. Thereafter Shortener can delete at most one such target per turn and Prolonger can select one per turn. Prolonger therefore obtains at least half of (8):

[
t^2-O(t).
]

Using (6),

[
t^2-O(t)
\ge
\frac{m^2}{9}-O(m^{3/2}).
]

This proves the theorem. ∎

---

# 2. This genuinely defeats static fractional interdiction

Take (b=1). Then the relevant lower moves are the primes (p_i), each representing a vertex of (K_m), while the targets (p_ip_j) represent its edges.

The initial fractional packing value of this block is only

[
\nu(\mathcal F)=\frac m2.
\tag{9}
]

Indeed, the prime constraints are exactly the vertex-capacity constraints for a fractional matching in (K_m). Yet Prolonger forces

[
\Omega(m^2)
]

actual targets.

Thus

[
\frac{\text{forced actual moves}}{\nu(\mathcal F)}
\asymp m\longrightarrow\infty.
\tag{10}
]

So the given theorem (\nu(A)=o(n)) does not, by itself, control the game length. Prolonger can preempt a small cover, turn the cover vertices into owned coordinates, and harvest the closure among them.

This is the precise dynamic phenomenon that any proof of (L(n)=o(n)) has to defeat.

---

# 3. Why this block does not give a linear lower bound

Choose constants

[
\frac1{\sqrt2}<\alpha<\beta<1
]

and take all primes in

[
[\alpha\sqrt n,\beta\sqrt n].
]

All pairwise products lie in ((n/2,n]). By the prime number theorem,

[
m\asymp \frac{\sqrt n}{\log n}.
]

The theorem therefore gives

[
\Omega!\left(\frac{n}{(\log n)^2}\right)
\tag{11}
]

actual Prolonger moves. This is numerically weaker than the accepted lower bound, but it establishes something the static reservoir constructions do not: the cross-products are harvestable against arbitrary play.

The reason it remains sublinear is not the game argument. It is the scarcity of independent prime coordinates.

## Disjoint copies remain sublinear

Consider many blocks whose prime-coordinate sets are disjoint and each lie in a bounded-ratio interval around some scale (X). In a multiplicative interval of this type, there are

[
O!\left(\frac X{\log X}\right)
]

available primes. If the blocks at that scale have coordinate counts (m_1,m_2,\ldots), disjointness gives

[
\sum_j m_j=O!\left(\frac X{\log X}\right),
]

and hence

[
\sum_j m_j^2
\le
\left(\sum_jm_j\right)^2
========================

O!\left(\frac{X^2}{(\log X)^2}\right).
\tag{12}
]

Summing over geometric scales (X\le\sqrt n) gives

[
\sum_{\text{disjoint blocks}}m_j^2=o(n).
\tag{13}
]

Therefore a linear construction must reuse coordinates across many cores or use a genuinely high-rank hierarchy.

---

# 4. Reusing coordinates produces the exact mixed-divisor obstruction

Suppose one tries to use a family of cores (B) and shared prime coordinates:

[
\mathcal F(B,P)
===============

{b p_i p_j:b\in B,\ i<j}.
\tag{14}
]

A divisor of a target now has the form

[
c,\qquad c p_i,\qquad c p_i p_j,
\qquad c\mid b.
]

Its shadow factors as

[
\begin{aligned}
c &: \quad
{b\in B:c\mid b}\times \binom{P}{2},[2mm]
c p_i &: \quad
{b\in B:c\mid b}\times \operatorname{Star}(i),[2mm]
c p_i p_j &: \quad
{b\in B:c\mid b}\times{{i,j}}.
\end{aligned}
\tag{15}
]

The single-block strategy owns an index (i) by making every (c p_i), (c\mid b), illegal for one fixed core (b).

With shared cores, however, a move (c p_i) can simultaneously kill the (i)-star in every block whose core is a multiple of (c). Owning (p_i) in one block only blocks (c p_i) when the selected core also contains (c).

Thus the cross-core problem is not another copy of the graph argument. It is the tensor product of:

* the graph-index ownership game; and
* the original divisibility game on the core family (B).

Blocking many (c)’s by choosing one core rich in divisors is primorial batching. The unblocked mixed products across different cores are precisely cross-carrier regeneration. No one-level ownership argument controls them.

This is where every attempted scaling of the block theorem stops.

---

# 5. The strongest codimension-one reduction

Let

[
U=(n/2,n].
]

For a live (u\in U), define its legal small-prime-removal divisors by

[
D_{z,A}(u)
==========

\left{
\frac up:
p\le z,\ p\mid u,\ \frac up\text{ is legal relative to }A
\right}.
\tag{16}
]

Call a Prolonger selection of (u) **good** if

[
|D_{z,A}(u)|\ge r.
]

## Good selections are already amortized

When Prolonger selects a good (u), every element of (D_{z,A}(u)) becomes illegal. These divisors were legal immediately before the move, and legality is monotone decreasing. Hence the charged divisors from distinct good selections are disjoint.

Therefore

[
#{\text{good upper Prolonger moves}}
\le
\frac n r.
\tag{17}
]

For (r\to\infty), this is (o(n)).

So a hypothetical linear Prolonger strategy must obtain almost all its moves from targets that are currently (r)-bad.

---

# 6. Every bad target has many distinct earlier blockers

Discard the (o(n)) intrinsic arithmetic exceptions supplied by Fact 1 with (k=0), and suppose (u) initially has at least (2r) relevant prime-removal divisors.

If (u) is later selected when fewer than (r) remain legal, at least (r) of them were made illegal earlier.

Let

[
d=\frac up
]

be one such divisor, and let (a) be the first actual move that made (d) illegal while (u) remained live.

The relation (a\mid d) is impossible, since then (a\mid u), which would have killed (u). Thus

[
d\mid a.
]

Writing (a=de),

[
a=\frac up,e.
\tag{18}
]

For a top-shell target (u>n/2), since (a\le n),

[
e<2p.
\tag{19}
]

Moreover, one actual move cannot block two distinct codimension-one divisors (u/p) and (u/q) of the same surviving target. Indeed,

[
\operatorname{lcm}\left(\frac up,\frac uq\right)=u
\qquad (p\ne q),
]

so a common multiple (a) would satisfy (u\mid a). As (u>n/2) and (a\le n), this would force (a=u), removing (u) rather than leaving it live.

Consequently, every nonexceptional bad target selected by Prolonger has at least (r) **distinct earlier blocking moves**.

This is the strongest useful consequence of codimension-one linearity.

---

# 7. Why the resulting charge still does not close

Construct a bipartite temporal graph:

* left vertices: bad upper targets actually selected by Prolonger;
* right vertices: earlier actual moves;
* join (u) to the first move that blocked each selected divisor (u/p).

Every nonexceptional left vertex has degree at least (r).

For one fixed blocker (a), equation (18) shows that every incidence is determined by a pair ((p,e)) with

[
p\le z,\qquad 2\le e<2p.
]

Hence the crude load bound is

[
\deg(a)
\le
\sum_{p\le z}2p
===============

O(z^2).
\tag{20}
]

This is the source of the (2kz^2) term in the given interdiction theorem.

If (B) bad targets are selected during (T) moves, this only yields

[
rB
\ll
Tz^2+o(nr),
\tag{21}
]

which is useless because the available parameter range has

[
r=O(\log\log H)
]

at horizon (T\asymp n/H), whereas any (z\to\infty) has

[
\frac{z^2}{r}\longrightarrow\infty.
]

There is no parameter optimization that turns (21) into an absorbing inequality.

---

# 8. Codimension-one certificates are already maximal

One might try to use exponentially many lower-codimension divisors of (u), rather than only (u/p), thereby making (r) much larger.

That forfeits the one-loss-per-carrier property.

For squarefree

[
u=\prod_{i=1}^s p_i,
]

represent a divisor (d\mid u) by the nonempty set (M(d)) of primes omitted from (d). Then

[
\operatorname{lcm}(d_1,d_2)=u
\quad\Longleftrightarrow\quad
M(d_1)\cap M(d_2)=\varnothing.
\tag{22}
]

Thus a divisor family in which every two members have lcm (u) corresponds to a collection of pairwise disjoint nonempty missing sets. Such a family has size at most (s).

The (s) codimension-one divisors (u/p_i) attain this maximum.

Therefore:

* codimension-one divisors give at most (\omega(u)) independent lives;
* any attempt to use more certificates necessarily introduces two whose lcm is a proper divisor of (u);
* a suitable lower-codimension carrier may then block several certificates in one move without selecting (u).

So the linear codimension-one system cannot simply be enlarged to an exponential certificate bank. Lower-codimension divisors are exactly where the simplex/cross-carrier obstruction reappears.

---

# 9. The precise missing sub-step

What is needed is not another pointwise star estimate. It is the following temporal capacity statement.

## Required temporal Hall bound

There should exist a Shortener strategy, parameters (r=r(n)\to\infty), and capacities

[
\mu(n)=o(r(n))
]

such that, after discarding (o(n)) arithmetic exceptions, the (r) first-blocker incidences of every bad target actually selected by Prolonger can be assigned to their blocking moves so that:

1. every bad target receives (r) distinct assigned blockers;
2. every actual move is assigned to at most (\mu(n)) later bad targets;
3. this capacity is shared across all later dyadic shells, rather than being reset separately in each shell.

Equivalently, for every stopping time (T),

[
r,B(T)
\le
\mu(n),T+o(nr),
\qquad
\mu(n)=o(r),
\tag{23}
]

where (B(T)) is the number of bad target selections up to time (T).

If (23) held, then since (T\le n),

[
B(T)=o(n).
]

Together with (17), all large-scale Prolonger moves would be (o(n)). A shell-stable version lets one discard a final (o(n))-sized lower tail and sum over scales, giving

[
L(n)=o(n).
]

The semiprime block shows exactly why (23) is nontrivial. After (O(m)) acquisition moves it produces (\Theta(m^2)) later targets whose two prime-removal blockers are concentrated on those (O(m)) acquisition moves. The average blocker load is (\Theta(m)). This is a severe Hall failure—but the whole block has only (o(n)) targets, so it can be absorbed into the allowed exceptional term.

A linear Prolonger strategy would have to concatenate or overlap enough such Hall failures to obtain (\Theta(n)) bad target moves, while preventing Shortener from using the cross-core mixed divisors (c p_i) in (15). Conversely, an (o(n)) proof must show that such failures cannot form a linear conveyor.

---

# Final concession

The robust block theorem proves that cross-product regeneration can be converted into many actual moves while controlling every proper divisor. It also proves that small fractional packing is not an online obstruction.

What I cannot close is the transition from an (o(n))-sized harvestable block to a linear sequence of harvestable blocks. Reusing arithmetic coordinates creates mixed divisors that couple the blocks; keeping the blocks independent gives only (o(n)) total density.

Precisely, I cannot prove the temporal Hall bound (23), and I also cannot construct a Prolonger strategy that forces a linear violation of it while surviving the mixed shadows

[
{b:c\mid b}\times\operatorname{Star}(i).
]

That temporal, cross-shell bounded-capacity statement—not the existence of large reservoirs, pointwise high-degree moves, fractional packing, or codimension-one linearity—is the single unresolved sub-step in this attack.

---
id: R70-forum-discourse-update-may-2026
type: research
date: 2026-05-05
intent: >
  Capture the May-2026 wave of forum activity on the divisor game: Brenner's
  exact L(n) values up to n = 86 (with separate Long-starts / Short-starts
  / cooperative-low / cooperative-high columns), the L(n) ≈ ⌈(low+upp)/2⌉
  conjecture and its refutation at n = 85, 86, jonaslsa's dyadic refinement
  pushing the fan-capture constant from 1/8 to 1/2, and Bloom's bipartite-
  graph-game potential-function explanation of the n loglog n / log n lower
  bound (with hypergraph generalisation to n (loglog n)^{k-1} / log n).
predecessors: []
action:
  kind: standalone
claim: >
  External evidence package. (a) Brenner's solver has computed exact L(n)
  for n up to 86, separating Prolonger-starts, Shortener-starts, and the
  two cooperative variants (low(n) = π(n), upp(n) = ⌈n/2⌉). (b) For
  Prolonger-starts and 28 ≤ n ≤ 84, L(n) = ⌈(π(n)+⌈n/2⌉)/2⌉ except at
  n = 27; at n = 85, 86 Prolonger-starts gives L = 32, while the single-
  player columns give 23 and 43, so the conjectured arithmetic-mean
  formula fails — L(n) = n/4 + o(n) is no longer realistic. (c) jonaslsa
  posts a dyadic refinement of the fan-capture lower bound: by first
  H-securing the small odd primes (rendering 2^b p illegal for 0 ≤ b ≤ H)
  and then running right-star capture on chains C_{pq} for n/2^{H+1} <
  pq ≤ n, one gets L(n) ≥ ((1/2)(1 - 2^{-H-1}) - o_H(1)) n loglog n /
  log n, hence L(n) ≥ (1/2 - o(1)) n loglog n / log n. natso26 reports a
  standard-check pass. (d) Bloom gives a clean potential-function proof
  of L(n) ≫ n loglog n / log n via a bipartite-graph game on prime
  vertices, with weights F(x) = Σ_{x ∈ e available} 2^{w(e)} where w(e)
  counts protected endpoints; conjectures k-uniform hypergraph
  generalisation to L(n) ≫_k n (loglog n)^{k-1} / log n for any k ≥ 2,
  with conjectured ceiling n / (log n)^{1 - o(1)}. Bloom flags
  formalisation as highly desired.
verifiers_at_time:
  - [forum-natso26-standard-check, agrees-on-jonaslsa-dyadic-bound]
confidence_at_time: high
strategy_dependence: independent
---

hey theres some updated discourse on erdos forum 872:

With the help of ChatGPT I generated some code to work out the game length for each N
 assuming both players are playing optimally, and the 'Long' player goes first. This sequence goes (from N=2
 up to N=40
).

1,2,2,3,3,4,4,5,5,5,5,6,6,7,7,7,7,8,8,9,9,10,10,
11,11,11,11,11,12,13,13,14,14,14,14,15,15,16,16,16,16

The corresponding sequence of f(n)−π(n)
, if f(n)
 is the length of the game, is 0
 for 2≤N≤8
, 1
 for 9≤N≤20
, 2
 for 21≤N≤27
, 3
 for 28≤N≤34
, and 4
 for 35≤N≤40
.

As an instructive example, when N=9
 (the first time this game goes on longer than the number of primes) one optimal (for both players) game goes
6 - 4 - 5 - 7 - 9

As another example, when N=21
,
6 - 4 - 9 - 5 - 14 - 11 - 13 - 17 - 19 - 21
Or when N=35
,
30-4-14-9-22-13-17-19-21-23-25-29-31-33-35

This (very limited) amount of computational evidence does seem to suggest that f(n)−π(n)→∞
 at least.

It's a curious game - one might naively think that the Long player should focus on choosing large primes and the Short player should focus on choosing small primes, and indeed there is a 'prime bias' in the transcripts above (to be expected, e.g. certainly all primes in (N/2,N]
 must appear at some point) but it seems like both players are better off choosing numbers with many factors for the first couple of turns at least.

Thomas Bloom
—
16:25 on 15 Oct 2025

👍
2

📝
0

🤖
0
It seems like the long player should start with choosing the largest primorial (say pk
#) less than N
, as this stops the short player from choosing any of the primes up to pk
. The short player then plays 22
. The long player then plays pn
#/pk
# for the largest n
 such that this is less than N
, and the short player plays 32
. Essentially the long player plays the product of the most consecutive primes that haven't appeared in prior turns that they can and the short player plays the smallest number that can be played. When the long player cannot do that any more, they take min{2p}
 for primes p<N/2
 such that 2p
 can be played. I would imagine that when N
 is large enough, the long player would perhaps move on to choosing the smallest possible 3p
 etc. Ultimately there remains a set of terms that must be chosen, such as the primes in [N/2,N]
 or pq>N/2
 when 2p
 and 2q
 have already been chosen.

The aim for the long player is to 'defend' as many small primes as possible, and the way to cover as many as possible at once is to choose the product of as many as you can. The aim for the short player is roughly to choose the smallest terms possible as these have the most multiples less than N
, though there may be a preference towards small primes or squares of primes when possible.

Adenwalla
—
20:38 on 11 Jan 2026

👍
0

📝
0

🤖
0
Two friends from the German "Computer Chess scene" have written programs
which solve the game for some more values of N.

First Thomas Zipproth until N=47.
And today Frank Brenner until N=65.

Moreover they computed the values for "Long player"
to start, for "Short player to start", and the simple
cooperative versions, where in one case both players
want to end soon, and in the other case both want to
delay the end as much as possible.

Here is a link to Brenner's result.
In the same thread also the earlier results of Zipproth can be found.
Game lengths

The table is to be read as follows:
Each N has one line. For example, the line for N=65 reads

65 | 20 | 26 | 18 | 33 | 259.495s | 78918730
N=65;
Short player starts (gives length 20),
Long Player starts (gives length 26),
length 18 for always Short (= number of primes until N),
length 33 (=upfloor) for always Long.

259 sec = computing times for N=65 with 10 threads,
78918730 number of nodes (in the alpha-beta tree).

old-bielefelder
—
18:07 on 01 May 2026

👍
1

📝
0

🤖
0
With only one exception at N=27, Brenner's data until N=65
show the following structure for the game with player Long to start:

Let low(N) be the number of moves when both players
cooperate in finishing as soon as possible.
Let upp(N) be the number of moves when both players
cooperate in finishing as late as possible.
low(N) = number of primes till N,
upp(N) = upper floor of N/2.

L(N) = upper floor of [low(N) + upp(N)]/2.
Open question: Does this hold for all N > 27?

For large N this would mean L(N) = N/4 + o(N).

***************************

If player Short starts, the optimal game length
seems to be much nearer to the lower bound low(N) = pi(N).

old-bielefelder
—
20:49 on 01 May 2026

👍
1

📝
0

🤖
0
The lower bound I sketch in another comment works just as well if Short starts, so (asymptotically at least) the game always lasts much longer than π(n)
. I'd expect that the game length shouldn't change much, whoever goes first. The conjecture that n/4
 is optimal is an interesting one.

Thomas Bloom
—
20:58 on 01 May 2026

👍
1

📝
0

🤖
0
On the open question of game length with player LONG to start:
It is NOT always the arithmetic mean of the two single-player lengths:
Frank Brenner was able to compute some more optimal lengths.

For N=85 and 86 he got 32 for optimal length with LONG to start,
but 23 and 43 for the single player situations.

In this light I think something like L(N)=N/4 + ... is no longer realistic.

The next days will show if for some more N > 86 computation
of optimal LONG-lengths is possible.

********************

I also have a sketchy name for the game now:
** Beat the Delers **,
a mixture of English and Dutch. In Holland, "delers" has the
two meanings of divisors (in math) and dealers (in the casino).

Of course, the word joke with respect to Ed Thorpe's
classic book "Beat the Dealer" is intended.

old-bielefelder
—
07:30 on 05 May 2026

👍
2

📝
0

🤖
0
I have a short note giving a dyadic refinement of the fan-capture lower bound. The idea is that the existing semiprime fan strategy only counts the top layer pq∈(n/2,n]
. If Prolonger first runs an activation phase that H
-secures the small odd primes, rendering every 2bp
 with 0≤b≤H
 illegal, the same right-star capture argument applies to the whole dyadic chain Cpq={pq,2pq,4pq,…}
 whenever n/2H+1<pq≤n
.

This gives, for every fixed H≥0
,
L(n)≥(12(1−2−H−1)−oH(1))nloglognlogn,
and hence
L(n)≥(12−o(1))nloglognlogn.
It does not settle the linear question, but appears to improve the visible lower-bound constant in the current fan-capture method from 1/8
 to 1/2
.

note pdf: https://github.com/jonaslsaa/maths/blob/main/872.pdf

jonaslsa
—
10:06 on 29 Apr 2026

👍
2

📝
0

🤖
0
Thanks! Standard check found no issues. Here L(n)
 is how long the game is guaranteed to last when Prolonger goes first.

natso26
—
13:13 on 29 Apr 2026

👍
0

📝
0

🤖
0
Thanks! I had a look at your note, and the earlier note of Om_Buddhdev_sensho, to try and understand this lower bound; here is a shorter explanation of the strategy (in particular stripping out a fair amount of additional pre-strategies in both notes, which perhaps are required for getting good constants, but unnecessary for the cruder order of magnitude bound).

Consider the bipartite graph, with both parts the set of primes, with an edge p∼q
 whenever pq∈(n/2,n]
. The number of edges in this graph is ≫nloglognlogn
 by classical estimates on the number of semiprimes in an interval.

Prolonger's strategy is to choose pq
 corresponding to edges in this graph. These never have any multiple in A
 (the set chosen thus far) since they are in (n/2,n]
. The only thing that can stop Prolonger choosing this integer/corresponding edge is if one of the vertices p
 or q
 was claimed already by Shortener. (Shortener might be claiming other integers of course, but since these don't restrict Prolonger's moves in this strategy, Prolonger doesn't care what else Shortener is doing. Shortener can also choose an 'edge' instead, but this is clearly less efficient than eliminating a vertex (which can be justified e.g. by a strategy stealing argument).)

So this is now basically a question about a game on played on a bipartite graph on m
 : Prolonger is colouring edges red, and Shortener is colouring vertices blue, with the restrictions that a red edge can't contain a blue vertex. I claim that, in this graph game, Prolonger can guarantee at least ≫m
 turns, which gives an ≫nloglognlogn
 bound for the primitive set game.

The trick is to use the method of potentials (a common technique in this sort of combinatorial game analysis; see for example the Erdős-Selfridge bound on maker-breaker games). Call a vertex 'protected' if it is on a red edge. The weight of an edge e
 is the number of protected vertices on it. The weight of a vertex x
 is
F(x)=∑x∈e available2w(e).
Prolonger's strategy is to choose an edge adjacent to a vertex which maximises F(x)
. (Intuitively, Prolonger's goal is to try and protect the best vertices, so that there will be lots of edges available later; here the 'best' vertices are those with a lot of edges, where we value edges whose other endpoint is already protected more highly, since these are safe from Shortener forever).

More precisely, consider the potential function
∑e available2w(e),
which starts at m
. When Prolonger claims an edge adjacent to an unprotected vertex x
, they double the weight of all edges incident to x
, since now x
 is protected, and removes one edge from being available, so the potential has gone up by at least F(x)−O(1)
. If Shortener then colours the vertex y
, then this decreases the potential by at most F(y)+O(1)
. Since F(x)≥F(y)
, overall the potential changes by O(1)
 each turn, so must last for ≫m
 many turns.

This is similar enough to arguments in the literature I've seen that I expect this kind of result is already folklore/known to experts/in the literature somewhere, although just in the 'bipartite graph' game language, rather than in terms of this primitive set game.

It seems likely that by playing on a k
-uniform hypergraph instead, with Prolonger choosing the products of k
 primes in (n/2,n]
, a generalisation of this potential-type argument should allow one to prove that ≫kn(loglogn)klogn
 is always possible for any k≥2
. The limit of this kind of strategy still seems to be n/(logn)1−o(1)
 however; the next significant step would be an alternative argument that shows L(n)≫n/(logn)c
 for some constant c<1
.

EDIT: Since this sort of game can be surprisingly subtle to analyse, it would be good if someone could try to formalise these sort of lower bounds - this kind of argument, which is locally very elementary and classical but requires a bit of tricky logic, is an ideal place to use formalisation to check we're not missing anything.

Thomas Bloom
—
15:41 on 29 Apr 2026

👍
1

📝
0

🤖
0
thanks! this is a helpful way to view the coarse lower bound. I agree that the top-layer semiprime strategy can be abstracted as a graph game on edges pq∈(n/2,n]
, and that this gives a clean route to
L(n)≫nloglognlogn.
The dyadic note is trying to keep track of the leading constant within this fan-capture method.. The extra step is that it does not only use the top layer pq>n/2
, but first H
-secures p,2p,…,2Hp
 and then counts chains Cpq
 for
n/2H+1<pq≤n.
This is what gives the factor
12(1−2−H−1)
and hence the 1/2
 constant after taking H
 large.

Agree that the graph-game abstraction is probably the cleanest way to explain the order-of-magnitude lower bound. The hypergraph direction sounds interesting too, though I think the expected count for products of k
 primes should be of order
n(loglogn)k−1/logn
for fixed k
, and the potential argument may need extra care because hypergraph codegrees can be large.

jonaslsa
—
21:21 on 04 May 2026

👍
0

📝
0

🤖
0
Yes, the exponent k
 rather than k−1
 is definitely just a typo. And I agree that the potential argument is definitely not obvious! It would definitely be a situation where formalisation is highly desired, because of the elementary yet quantitatively subtle nature of things.

Thomas Bloom
—
05:49 on 05 May 2026

👍
0

📝
0

🤖
0
Is there a popular name for this game?

I asked Gemini about its history, and it came up with a reference to Dutch mathematician Frederik Schuh (1952). In tournament play "komi bidding" in the beginning should be included. Assume two players A
 and B
. N
 is fixed. Each player - in secret - names a number k
. Then the numbers (k1
 and k2
) are disclosed. The player with the larger number becomes LONG, the other player SHORT. Threshold for determining the winner is the arithmetic mean k=(k1+k2)/2
. If the game ends in exactly this number of moves, the result is a draw.

I want to propose this game for the next "Computer (Games) Olympiad", which likely will take place in November or December 2026. There it might be played with N=200
 or some other value in that range. It would be nice to have a sketchy name. Something with Sperner and/or Schuh comes to my mind. Other ideas?

Some information on the "International Computer Games Association": ICGA

*******************************

EDIT (from the invitation for the 2025 Olympiad):
Recent Olympiads have had competitions for following games:
Amazons, Arimaa, Ataxx, Brazilian Draughts, Breakthrough,
Canadian Draughts, Chinese Checkers, Chinese Chess, Chinese
Dark Chess, Clobber, Connect6, Dice Shogi, Dots and Boxes,
EinStein Würfelt Nicht, Go (9×9), Havannah (8×8), Havannah (10×10),
Hex (11×11), Hex (13×13), Hex (19×19), HoneyMoon Bridge,
International Draughts, Kyoto Shogi, Lines of Action, Mahjong, Mini
Shogi, Nonogram, Othello (8×8), Othello (10×10), Othello (16×16),
Outer-Open Gomoku, Santorini, Shobu, Surakarta, Sylver Coinage,
Kriegspiel, Quoridor, Backgammon, Azul and Kingdomino (with
advances rules: The middle Kingdom, Harmony, and The Mighty Duel).

If your favorite game is not on this list and you know that there are at
least two potential entrants, please contact us and we can add a new
game to the Olympiad.

********************

Reference:
Schuh, F. "Spel van delers" (Game of Divisors), Nieuw Tijdschrift
voor Wiskunde 39 (1952), pp. 299–304.

old-bielefelder
—
06:44 on 02 May 2026

👍
2

📝
0

🤖
0
Using a research agent harness (GPT-5.4 Pro primary, Claude Opus 4.7 + Gemini 3.1 DeepThink secondary) for the past week I was able to prove:

- Upper bound: L(n)<0.19n
. Via a fourth-order Bonferroni on Shortener's odd-prime-prefix strategy. Constant is W4/2≤0.1897123371
, interval-arithmetic certified.
- Lower bound: L(n)≥(1/8−o(1))nloglogn/logn
. First order-improvement over the trivial n/logn
 baseline. Two-phase Prolonger: activate small primes (Mertens gives the reciprocal-mass), then max-degree right-capture on the resulting fan graph.

Also:

- Shield reduction: three-line structural reduction — |A|≥|Un|−βn(P)
 for any Prolonger shield prefix P
. Turns terminal game positions into a weighted lower-half antichain problem.
- Polynomial shield-weight barrier (Theorem A, Lean combinatorial core): any shield-prefix proof of a linear lower bound via the reduction above needs |P|≥ne−2c−o(1)
 shields. Hard constraint on a natural proof class.
- Exact 5n/24+O(1)
 first-hit cover (zero-sorry Lean): the minimum upper-half cover of the lower half by divisibility is exactly 5n/24+O(1)
, with a matching packing.
- Intermediate upper bounds 13/36
 and 5/16
 (both Lean-verified): improvements from the current 419/1008≈0.416
.
- Three proof-class obstructions (Section 8): Sherali–Adams transversal-LP integrality; Johnson q
-shadow covering dichotomy; separator-only closure limitation. Delimit what the current method family can produce.
- K4
-fiber refutation of the general safe-edge hypothesis using {13,17,19,23}
 — explicit small counterexample that motivates the restricted form used in the conditional n(loglogn)2/logn
 lower bound.

Intermediate bounds L(n)≤13/36
 and L(n)≤5/16
 are zero-sorry Lean. The <0.19
 has a Lean endgame reduction; the envelope-inversion / prime-rounding bridge (Lemmas 7.4–7.17) is still prose. It has passed all GPT Pro audits so far.

I tried hard to get to a full solution but fell short. I hope someone smarter than me is able to make use of this for advancing this problem further.

Paper: sensho.xyz/papers/erdos-872.pdf
Repo: github.com/xa8zz/erdos-harness

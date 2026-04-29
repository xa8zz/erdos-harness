---
id: R62-external-bloom-bipartite-potential-method
type: research
date: 2026-04-29
intent: >
  External forum contribution by Thomas Bloom (29 Apr 2026, post on
  erdosproblems.com forum/thread/872). Provides a cleaner, stripped-down
  proof of the lower bound L(n) >> n loglog n / log n via a bipartite
  graph game and a potential-method argument (Erdos-Selfridge style).
  The argument abstracts away the pre-strategies needed for sharp
  constants and re-derives the order of magnitude using only the
  semiprime edge-count m >> n loglog n / log n. Also conjectures (not
  proven) that a k-uniform hypergraph generalisation gives
  L(n) >>_k n (loglog n)^k / log n for any k >= 2, with the natural
  ceiling of this method family at n / (log n)^{1 - o(1)}. Calls for
  Lean/Aristotle formalisation of these lower-bound arguments.
predecessors: [R13-pro-fresh-second-order-lower-bound, R13-pro2-odd-fan-strengthened, R61-external-jonaslsa-dyadic-fan-half-constant]
action:
  kind: confirms
  target: R13-pro2-odd-fan-strengthened
claim: >
  Independent re-derivation of L(n) >> n loglog n / log n via the
  bipartite-graph reformulation: vertices = primes, edges =
  semiprimes pq in (n/2, n]; m = #edges >> n loglog n / log n by
  classical estimates. Prolonger colours edges red, Shortener colours
  vertices blue, with the constraint that a red edge cannot contain
  a blue vertex. Using the potential function Phi = sum_{e available}
  2^{w(e)}, where w(e) = #{protected endpoints of e} and "protected"
  means "incident to a red edge", Prolonger plays edges adjacent to
  the F-maximal vertex (F(x) = sum_{x in e available} 2^{w(e)}). Each
  full turn changes Phi by O(1), so the game lasts >> m turns. This
  re-derives the >> n loglog n / log n lower bound with no constants
  but a much shorter proof. Conjectured (NOT proven) k-uniform
  extension yields >>_k n (loglog n)^k / log n.
strategy_dependence: independent
verifiers_at_time: []
confidence_at_time: high
source: https://www.erdosproblems.com/forum/thread/872
formalisation_call: >
  Bloom explicitly suggests Lean / Aristotle formalisation of these
  bipartite/k-hypergraph-game lower-bound arguments, noting that they
  are locally elementary but globally tricky.
---

# Verbatim forum post (byte-faithful from session paste)

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

# Curator note (forum-rendering caveat + glossary)

Forum LaTeX-rendering collapses fractions/exponents in the paste above.
Cleaned-up reading:

- Edge count m: m = #{(p,q) primes : pq in (n/2, n]} >> n * (loglog n) / (log n).
- Edge weight: w(e) = #{protected endpoints of e}, in {0, 1, 2}.
- Vertex weight: F(x) = sum over edges e incident to x and still available of 2^{w(e)}.
- Potential: Phi = sum over available edges e of 2^{w(e)}; starts at Phi_0 = m.
- Prolonger's move: claim an available edge incident to an F-maximal vertex.
- One-turn delta-bound: each Prolonger turn raises Phi by at least F(x) - O(1);
  Shortener reply lowers Phi by at most F(y) + O(1). Since x maximises F,
  net change per round is O(1), so the game lasts >> Phi_0 = m turns.
- k-hypergraph conjecture (not proven): playing the analogous game on
  k-uniform hypergraphs of products of k primes in (n/2, n] should give
  L(n) >>_k n * (loglog n)^k / (log n) for any k >= 2.
- Stated ceiling of this method family: n / (log n)^{1 - o(1)}; closing the
  linear gap requires "an alternative argument that shows
  L(n) >> n/(log n)^c for some constant c < 1" (Bloom).

Comparison to harness's existing lower-bound rounds:

- R13-pro-fresh-second-order-lower-bound already established
  L(n) = Omega(n (loglog n)^2 / log n) via a three-prime upper-half fan acb
  with weighted pair-graph capture. That is the k=2 case of Bloom's
  k-hypergraph conjecture (actually somewhat stronger: it's a verified
  proof of the (loglog n)^2 second-order term, not just the first-order
  loglog n).
- R13-pro2-odd-fan-strengthened established the first-order constant
  liminf L(n) log n / (n loglog n) >= 1/8, which Jonas (R61) lifts to 1/2
  via dyadic activation.
- Bloom's argument here re-derives the >> n loglog n / log n baseline
  cleanly via potentials, but does not push the constant past 1/8
  (he explicitly strips out the "additional pre-strategies ... required
  for getting good constants" to keep the proof short).
- Formalisation call (Bloom EDIT): aligns with the harness's
  ongoing Aristotle / Lean track on Theorem A and the 13/36, 5/16
  upper bounds.

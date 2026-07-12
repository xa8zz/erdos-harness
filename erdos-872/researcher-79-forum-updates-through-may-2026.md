---
id: R79-forum-updates-through-may-2026
type: research
date: 2026-07-11
intent: >
  Verbatim capture of public discussion of the divisor game spanning
  October 2025 through late May 2026, to close the gap between the
  early-May external-evidence capture and the present.
predecessors: [R70-forum-discourse-update-may-2026]
action:
  kind: extends
  target: R70-forum-discourse-update-may-2026
claim: >
  External evidence beyond the early-May capture. (a) A Lean 4
  formalization of the 23/48 upper bound exists restricted to
  C-respecting play, where the minimizing player strictly targets the odd
  centers C: any maximal C-respecting play terminates within
  ceil(n/2) - |C|/2 moves. The core argument is formalized; the full
  unrestricted result is not. (b) Exact game values are now computed for
  all n <= 120 by alpha-beta search; optimal lengths grow weakly
  monotonically. For 105 <= n <= 164 the minimizing player's optimal
  first move is 2 or 3, equi-optimally, and every other first move is
  strictly worse; below 105 move 3 is at most one worse than move 2.
  Further progress is memory-bound (32 GB hash tables). (c) An elementary
  argument shows every complete game has length at least pi(n): the
  maximal prime powers q_i <= n over distinct primes are pairwise
  distinct, and any played integer covers at most one q_i. Items already
  recorded elsewhere and repeated in this capture: exact values to n=86
  with the arithmetic-mean formula refuted at n=85,86; the dyadic
  refinement raising the fan-capture constant from 1/8 to 1/2; the
  bipartite potential-function method with its k-uniform hypergraph
  generalization to n(loglog n)^{k-1}/log n and an explicit call for
  formalization of such potential arguments.
implications:
  - The exact-value table through n=120 is available for sandbox cross-checks of any small-n claim.
  - The equi-optimal first-move pattern (2 or 3) for the minimizing player is an unexplained empirical regularity.
  - A partial external Lean formalization of the upper bound exists; the C-respecting restriction is the known gap.
confidence_at_time: high
strategy_dependence: independent
---

# Forum discussion, October 2025 - May 2026 (verbatim capture)

Following the recent discussions on formalisation, Aristotle wrotes a Lean 4 proof for the 23/48 upper bound in a single afternoon today (May 8). To avoid the complexity of full game trees, the code uses an IsCRespecting property. This restricts the space of valid plays to those where Shortener strictly targets the "odd centers" (𝐶). It proves that any maximal C-respecting play terminates in at most ⌈𝑛/2⌉ −|𝐶|/2 moves. The lean code was refined with Aristotle and Claude-Opus-4.7. You can run it here: lean proof. I hope this can be a useful.

Pommeret
—
20:13 on 08 May 2026
|Reply

👍
1

📝
0

🤖
0
Thanks. It would appear this is a bit different from the 23/48 bound, because as you noted the space of valid plays has been restricted. By discussion with GPT, this formalizes perhaps the core argument but it does not formalize the whole result.

Nat Sothanaphan
—
16:44 on 09 May 2026
|Reply

👍
0

📝
0

🤖
0
The proof is fine because only the actions of player SHORT are limited.

old-bielefelder
—
04:22 on 21 May 2026
|Reply

👍
0

📝
0

🤖
0
This result has already been accepted as correct, but the *formalization* is not complete.

Nat Sothanaphan
—
16:33 on 21 May 2026
|Reply

👍
0

📝
0

🤖
0
With the help of ChatGPT I generated some code to work out the game length for each 𝑁 assuming both players are playing optimally, and the 'Long' player goes first. This sequence goes (from 𝑁 =2 up to 𝑁 =40).

1,2,2,3,3,4,4,5,5,5,5,6,6,7,7,7,7,8,8,9,9,10,10,
11,11,11,11,11,12,13,13,14,14,14,14,15,15,16,16,16,16

The corresponding sequence of 𝑓⁡(𝑛) −𝜋⁡(𝑛), if 𝑓⁡(𝑛) is the length of the game, is 0 for 2 ≤𝑁 ≤8, 1 for 9 ≤𝑁 ≤20, 2 for 21 ≤𝑁 ≤27, 3 for 28 ≤𝑁 ≤34, and 4 for 35 ≤𝑁 ≤40.

As an instructive example, when 𝑁 =9 (the first time this game goes on longer than the number of primes) one optimal (for both players) game goes
6 - 4 - 5 - 7 - 9

As another example, when 𝑁 =21,
6 - 4 - 9 - 5 - 14 - 11 - 13 - 17 - 19 - 21
Or when 𝑁 =35,
30-4-14-9-22-13-17-19-21-23-25-29-31-33-35

This (very limited) amount of computational evidence does seem to suggest that 𝑓⁡(𝑛) −𝜋⁡(𝑛) →∞ at least.

It's a curious game - one might naively think that the Long player should focus on choosing large primes and the Short player should focus on choosing small primes, and indeed there is a 'prime bias' in the transcripts above (to be expected, e.g. certainly all primes in (𝑁/2,𝑁] must appear at some point) but it seems like both players are better off choosing numbers with many factors for the first couple of turns at least.

Thomas Bloom
—
16:25 on 15 Oct 2025
|Reply

👍
2

📝
0

🤖
0
It seems like the long player should start with choosing the largest primorial (say 𝑝𝑘#) less than 𝑁, as this stops the short player from choosing any of the primes up to 𝑝𝑘. The short player then plays 22. The long player then plays 𝑝𝑛#/𝑝𝑘# for the largest 𝑛 such that this is less than 𝑁, and the short player plays 32. Essentially the long player plays the product of the most consecutive primes that haven't appeared in prior turns that they can and the short player plays the smallest number that can be played. When the long player cannot do that any more, they take min⁡{2⁢𝑝} for primes 𝑝 <𝑁/2 such that 2⁢𝑝 can be played. I would imagine that when 𝑁 is large enough, the long player would perhaps move on to choosing the smallest possible 3⁢𝑝 etc. Ultimately there remains a set of terms that must be chosen, such as the primes in [𝑁/2,𝑁] or 𝑝⁢𝑞 >𝑁/2 when 2⁢𝑝 and 2⁢𝑞 have already been chosen.

The aim for the long player is to 'defend' as many small primes as possible, and the way to cover as many as possible at once is to choose the product of as many as you can. The aim for the short player is roughly to choose the smallest terms possible as these have the most multiples less than 𝑁, though there may be a preference towards small primes or squares of primes when possible.

Adenwalla
—
20:38 on 11 Jan 2026
|Reply

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
|Reply

👍
2

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
|Reply

👍
1

📝
0

🤖
0
The lower bound I sketch in another comment works just as well if Short starts, so (asymptotically at least) the game always lasts much longer than 𝜋⁡(𝑛). I'd expect that the game length shouldn't change much, whoever goes first. The conjecture that 𝑛/4 is optimal is an interesting one.

Thomas Bloom
—
20:58 on 01 May 2026
|Reply

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
|Reply

👍
2

📝
0

🤖
0
Frank Brenner made further progress with speeding up
his code for the game. One rather unexpected side result is:

Looking at the game setting SHORT vs LONG with N between
105 and 164, there seem to be two equi-optimal first moves
for SHORT: 2 and 3!

And also for 𝑁 <105 move 3 is at most worse by length 1
in comparison with move 2. Does someone have a heuristic
explanation for this?

Currently memory is the bottleneck for further progress.
Frank's machine has only 32 GB for the hash tables.

old-bielefelder
—
03:37 on 21 May 2026
|Reply

👍
0

📝
0

🤖
0
The last sentence in the introduction can be made stronger by using the following argument:
Fix 𝑛 and let 𝑝1,𝑝2,...,𝑝𝑘 be all primes in 2,3,...,𝑛. For each 𝑖 from 1 to 𝑘 look at the largest power 𝑞𝑖 of 𝑝𝑖 that is still in 2,3,...𝑛. All these 𝑞𝑖 are distinct. If 𝑆 is the set of all moves in a complete game on 2,3,...,𝑛, then each of its elements covers at most one of the 𝑞𝑖. Hence |𝑆| has to be at least 𝑝⁢𝑖⁡(𝑛) =𝑘.

*************************************************
A few more comments on the game: In the meantime Frank Brenner has computed game-theoretic values for alll 𝑁 ≤120. Optimal game lengths grow weakly monotonous with 𝑁. One special observation: If player SHORT starts, she should for optimality mark 2 or 3 in her first move. All other first moves are seriously weaker.

old-bielefelder
—
11:52 on 20 May 2026
|Reply

👍
1

📝
0

🤖
0
I have a short note giving a dyadic refinement of the fan-capture lower bound. The idea is that the existing semiprime fan strategy only counts the top layer 𝑝⁢𝑞 ∈(𝑛/2,𝑛]. If Prolonger first runs an activation phase that 𝐻-secures the small odd primes, rendering every 2𝑏⁢𝑝 with 0 ≤𝑏 ≤𝐻 illegal, the same right-star capture argument applies to the whole dyadic chain 𝐶𝑝⁢𝑞 ={𝑝⁢𝑞,2⁢𝑝⁢𝑞,4⁢𝑝⁢𝑞,…} whenever 𝑛/2𝐻+1 <𝑝⁢𝑞 ≤𝑛.

This gives, for every fixed 𝐻 ≥0,
𝐿⁡(𝑛)≥(
1
2
 
⁢(1−2−𝐻−1)−𝑜𝐻⁡(1))⁢
𝑛⁢log⁡log⁡𝑛
log⁡𝑛
 
,
and hence
𝐿⁡(𝑛)≥(
1
2
 
−𝑜⁡(1))⁢
𝑛⁢log⁡log⁡𝑛
log⁡𝑛
 
.
It does not settle the linear question, but appears to improve the visible lower-bound constant in the current fan-capture method from 1/8 to 1/2.

note pdf: https://github.com/jonaslsaa/maths/blob/main/872.pdf

jonaslsa
—
10:06 on 29 Apr 2026
|Reply

👍
2

📝
0

🤖
0
Thanks! Standard check found no issues. Here 𝐿⁡(𝑛) is how long the game is guaranteed to last when Prolonger goes first.

Nat Sothanaphan
—
13:13 on 29 Apr 2026
|Reply

👍
0

📝
0

🤖
0
Thanks! I had a look at your note, and the earlier note of Om_Buddhdev_sensho, to try and understand this lower bound; here is a shorter explanation of the strategy (in particular stripping out a fair amount of additional pre-strategies in both notes, which perhaps are required for getting good constants, but unnecessary for the cruder order of magnitude bound).

Consider the bipartite graph, with both parts the set of primes, with an edge 𝑝 ∼𝑞 whenever 𝑝⁢𝑞 ∈(𝑛/2,𝑛]. The number of edges in this graph is  ≫
𝑛⁢log⁡log⁡𝑛
log⁡𝑛
 
 by classical estimates on the number of semiprimes in an interval.

Prolonger's strategy is to choose 𝑝⁢𝑞 corresponding to edges in this graph. These never have any multiple in 𝐴 (the set chosen thus far) since they are in (𝑛/2,𝑛]. The only thing that can stop Prolonger choosing this integer/corresponding edge is if one of the vertices 𝑝 or 𝑞 was claimed already by Shortener. (Shortener might be claiming other integers of course, but since these don't restrict Prolonger's moves in this strategy, Prolonger doesn't care what else Shortener is doing. Shortener can also choose an 'edge' instead, but this is clearly less efficient than eliminating a vertex (which can be justified e.g. by a strategy stealing argument).)

So this is now basically a question about a game on played on a bipartite graph on 𝑚 : Prolonger is colouring edges red, and Shortener is colouring vertices blue, with the restrictions that a red edge can't contain a blue vertex. I claim that, in this graph game, Prolonger can guarantee at least  ≫𝑚 turns, which gives an  ≫
𝑛⁢log⁡log⁡𝑛
log⁡𝑛
 
 bound for the primitive set game.

The trick is to use the method of potentials (a common technique in this sort of combinatorial game analysis; see for example the Erdős-Selfridge bound on maker-breaker games). Call a vertex 'protected' if it is on a red edge. The weight of an edge 𝑒 is the number of protected vertices on it. The weight of a vertex 𝑥 is
𝐹⁡(𝑥)= 
∑
𝑥∈𝑒 available
 
 2𝑤⁡(𝑒).
Prolonger's strategy is to choose an edge adjacent to a vertex which maximises 𝐹⁡(𝑥). (Intuitively, Prolonger's goal is to try and protect the best vertices, so that there will be lots of edges available later; here the 'best' vertices are those with a lot of edges, where we value edges whose other endpoint is already protected more highly, since these are safe from Shortener forever).

More precisely, consider the potential function
∑
𝑒 available
 2𝑤⁡(𝑒),
which starts at 𝑚. When Prolonger claims an edge adjacent to an unprotected vertex 𝑥, they double the weight of all edges incident to 𝑥, since now 𝑥 is protected, and removes one edge from being available, so the potential has gone up by at least 𝐹⁡(𝑥) −𝑂⁡(1). If Shortener then colours the vertex 𝑦, then this decreases the potential by at most 𝐹⁡(𝑦) +𝑂⁡(1). Since 𝐹⁡(𝑥) ≥𝐹⁡(𝑦), overall the potential changes by 𝑂⁡(1) each turn, so must last for  ≫𝑚 many turns.

This is similar enough to arguments in the literature I've seen that I expect this kind of result is already folklore/known to experts/in the literature somewhere, although just in the 'bipartite graph' game language, rather than in terms of this primitive set game.

It seems likely that by playing on a 𝑘-uniform hypergraph instead, with Prolonger choosing the products of 𝑘 primes in (𝑛/2,𝑛], a generalisation of this potential-type argument should allow one to prove that  ≫𝑘
𝑛⁢(log⁡log⁡𝑛)𝑘
log⁡𝑛
 
 is always possible for any 𝑘 ≥2. The limit of this kind of strategy still seems to be 𝑛/(log⁡𝑛)1−𝑜⁡(1) however; the next significant step would be an alternative argument that shows 𝐿⁡(𝑛) ≫𝑛/(log⁡𝑛)𝑐 for some constant 𝑐 <1.

EDIT: Since this sort of game can be surprisingly subtle to analyse, it would be good if someone could try to formalise these sort of lower bounds - this kind of argument, which is locally very elementary and classical but requires a bit of tricky logic, is an ideal place to use formalisation to check we're not missing anything.

Thomas Bloom
—
15:41 on 29 Apr 2026
|Reply

👍
1

📝
0

🤖
0
thanks! this is a helpful way to view the coarse lower bound. I agree that the top-layer semiprime strategy can be abstracted as a graph game on edges 𝑝⁢𝑞 ∈(𝑛/2,𝑛], and that this gives a clean route to
𝐿⁡(𝑛)≫
𝑛⁢log⁡log⁡𝑛
log⁡𝑛
 
.
The dyadic note is trying to keep track of the leading constant within this fan-capture method.. The extra step is that it does not only use the top layer 𝑝⁢𝑞 >𝑛/2, but first 𝐻-secures 𝑝,2⁢𝑝,…,2𝐻⁢𝑝 and then counts chains 𝐶𝑝⁢𝑞 for
𝑛/2𝐻+1<𝑝⁢𝑞≤𝑛.
This is what gives the factor
1
2
 
⁢(1−2−𝐻−1)
and hence the 1/2 constant after taking 𝐻 large.

Agree that the graph-game abstraction is probably the cleanest way to explain the order-of-magnitude lower bound. The hypergraph direction sounds interesting too, though I think the expected count for products of 𝑘 primes should be of order
𝑛⁢(log⁡log⁡𝑛)𝑘−1/log⁡𝑛
for fixed 𝑘, and the potential argument may need extra care because hypergraph codegrees can be large.

jonaslsa
—
21:21 on 04 May 2026
|Reply

👍
0

📝
0

🤖
0
Yes, the exponent 𝑘 rather than 𝑘 −1 is definitely just a typo. And I agree that the potential argument is definitely not obvious! It would definitely be a situation where formalisation is highly desired, because of the elementary yet quantitatively subtle nature of things.

Thomas Bloom
—
05:49 on 05 May 2026
|Reply

👍
0

📝
0

🤖
0
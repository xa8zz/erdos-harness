Hey on problem 872 the forum is updated now, could you update it?

"I have a short note giving a dyadic refinement of the fan-capture lower bound. The idea is that the existing semiprime fan strategy only counts the top layer pq∈(n/2,n]
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
1

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

Om_Buddhdev_sensho
—
11:00 on 23 Apr 2026

👍
1

📝
0

🤖
0
With GPT 5.4 Pro assistance, building on the 8/105
 construction, I wanted to flag a refinement that uses vp
-adic parity conditions rather than simple coprimality. For k≥4
, let Ik(n)=(n/k,n/3]∩(2ℤ+1)
 and k
 be the reduced ratios a/b>1
 with a,b
 odd, a,b≤k
, and a/b<k/3
. Call B⊆Ik(n)
 ratio-independent if no two elements have ratio in k
. At k=8
, 8={5/3,7/5,7/3}
, and defining

B8(n):={b∈I8(n):v5(b)≡0(mod2) and (3∣b⇒b>n/7)}


gives a ratio-independent set of density 85/1008≈0.0843
, improving on 8/105≈0.0762
. The v5
-parity condition kills the 5/3
 and 7/5
 edges automatically (the valuation flips parity), while the geometric cut on multiples of 3
 handles 7/3
 (where v5
 is preserved). At k=7
 the same parity idea alone gives 5/63≈0.0794
.

This is just a static claim about the ratio-graph model. Converting to a Prolonger strategy requires verifying B8
 survives adversarial Shortener play, which I haven't checked carefully. Even if it converts, it doesn't address whether L(n)≥ϵnL(n) \geq \epsilon n
L(n)≥ϵn is achievable in general; it's a constant improvement within the interval+sieve class. The more interesting question is whether the vp
-parity family has a nontrivial limiting density as k→∞
, or whether it's also capped below 1/2
. I haven't computed k≥9
 yet. Posting in case others want to poke at either the conversion step or the asymptotic behavior. I'm going to attempt further solutions with AI."

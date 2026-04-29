# Erdős Problem #872 - Discussion thread

**URL:** https://www.erdosproblems.com/forum/thread/872#post-5480
**Status:** OPEN — This is open, and cannot be resolved with a finite computation.

## Problem Statement & Background

Consider the two-player game in which players alternately choose integers from $\{2,3,\ldots,n\}$ to be included in some set $A$ (the same set for both players) such that no $a\mid b$ for $a\neq b\in A$.

The game ends when no legal move is possible. One player wants the game to last as long as possible, the other wants the game to end quickly. How long can the game be guaranteed to last for?

At least $\epsilon n$ moves? (For $\epsilon>0$ and $n$ sufficiently large.) At least $(1-\epsilon)\frac{n}{2}$ moves?

#872: [Er92c,p.47]

number theory |

primitive sets

Disclaimer: The open status of this problem reflects the current belief of the owner of this website. There may be literature on this problem that I am unaware of, which may partially or completely solve the stated problem. Please do your own literature search before expending significant effort on solving this problem. If you find any relevant literature not mentioned here, please add this in a comment.

A number theoretic variant of a combinatorial game of Hajnal, in which players alternately add edges to a graph while keeping it triangle-free. This graph theoretic game must trivially end in at most $n^2/4$ moves, and Füredi and Seress [FuSe91] proved that it can be guaranteed to last for $\gg n\log n$ moves. Biró, Horn, and Wildstrom [BPW16] proved that it must end in at most $(\frac{26}{121}+o(1))n^2<0.215n^2$ moves.

This type of game is known as a saturation game.

Erdős does not specify which player goes first, which may result in different answers.

GPT-5.2 Pro, prompted by Price, has shown that the final question has a negative answer: assuming the 'Prolonger' goes first, the 'Shortener' can guarantee that it ends in at most $(\frac{23}{48}+o(1))n$ moves. This has been refined in the comments; the current record is at most
$$\left(\frac{419}{1008}+o(1)\right)n\leq 0.416 n$$
moves.

View the LaTeX source

This page was last edited 16 April 2026. View history (most-recent comments captured up to 29 April 2026)

## Comments (20)

### Thomas Bloom — 15:41 on 29 Apr 2026

Thanks! I had a look at your note, and the earlier note of Om_Buddhdev_sensho, to try and understand this lower bound; here is a shorter explanation of the strategy (in particular stripping out a fair amount of additional pre-strategies in both notes, which perhaps are required for getting good constants, but unnecessary for the cruder order of magnitude bound).

Consider the bipartite graph, with both parts the set of primes, with an edge $p \sim q$ whenever $pq \in (n/2, n]$. The number of edges in this graph is $\gg \frac{n \log\log n}{\log n}$ by classical estimates on the number of semiprimes in an interval.

Prolonger's strategy is to choose $pq$ corresponding to edges in this graph. These never have any multiple in $A$ (the set chosen thus far) since they are in $(n/2, n]$. The only thing that can stop Prolonger choosing this integer/corresponding edge is if one of the vertices $p$ or $q$ was claimed already by Shortener. (Shortener might be claiming other integers of course, but since these don't restrict Prolonger's moves in this strategy, Prolonger doesn't care what else Shortener is doing. Shortener can also choose an 'edge' instead, but this is clearly less efficient than eliminating a vertex (which can be justified e.g. by a strategy stealing argument).)

So this is now basically a question about a game on played on a bipartite graph on $m$: Prolonger is colouring edges red, and Shortener is colouring vertices blue, with the restrictions that a red edge can't contain a blue vertex. I claim that, in this graph game, Prolonger can guarantee at least $\gg m$ turns, which gives an $\gg \frac{n \log\log n}{\log n}$ bound for the primitive set game.

The trick is to use the method of potentials (a common technique in this sort of combinatorial game analysis; see for example the Erdős–Selfridge bound on maker–breaker games). Call a vertex 'protected' if it is on a red edge. The weight of an edge $e$ is the number of protected vertices on it. The weight of a vertex $x$ is

$$F(x) = \sum_{x \in e \text{ available}} 2^{w(e)}.$$

Prolonger's strategy is to choose an edge adjacent to a vertex which maximises $F(x)$. (Intuitively, Prolonger's goal is to try and protect the best vertices, so that there will be lots of edges available later; here the 'best' vertices are those with a lot of edges, where we value edges whose other endpoint is already protected more highly, since these are safe from Shortener forever).

More precisely, consider the potential function

$$\Phi = \sum_{e \text{ available}} 2^{w(e)},$$

which starts at $m$. When Prolonger claims an edge adjacent to an unprotected vertex $x$, they double the weight of all edges incident to $x$, since now $x$ is protected, and removes one edge from being available, so the potential has gone up by at least $F(x) - O(1)$. If Shortener then colours the vertex $y$, then this decreases the potential by at most $F(y) + O(1)$. Since $F(x) \geq F(y)$, overall the potential changes by $O(1)$ each turn, so must last for $\gg m$ many turns.

This is similar enough to arguments in the literature I've seen that I expect this kind of result is already folklore / known to experts / in the literature somewhere, although just in the 'bipartite graph' game language, rather than in terms of this primitive set game.

It seems likely that by playing on a $k$-uniform hypergraph instead, with Prolonger choosing the products of $k$ primes in $(n/2, n]$, a generalisation of this potential-type argument should allow one to prove that $\gg_k \frac{n (\log\log n)^k}{\log n}$ is always possible for any $k \geq 2$. The limit of this kind of strategy still seems to be $n / (\log n)^{1 - o(1)}$ however; the next significant step would be an alternative argument that shows $L(n) \gg n / (\log n)^c$ for some constant $c < 1$.

EDIT: Since this sort of game can be surprisingly subtle to analyse, it would be good if someone could try to formalise these sort of lower bounds — this kind of argument, which is locally very elementary and classical but requires a bit of tricky logic, is an ideal place to use formalisation to check we're not missing anything.

### natso26 — 13:13 on 29 Apr 2026

Thanks! Standard check found no issues. Here $L(n)$ is how long the game is guaranteed to last when Prolonger goes first.

### jonaslsa — 10:06 on 29 Apr 2026

I have a short note giving a dyadic refinement of the fan-capture lower bound. The idea is that the existing semiprime fan strategy only counts the top layer $pq \in (n/2, n]$. If Prolonger first runs an activation phase that $H$-secures the small odd primes, rendering every $2^b p$ with $0 \leq b \leq H$ illegal, the same right-star capture argument applies to the whole dyadic chain $C_{pq} = \{pq, 2pq, 4pq, \ldots\}$ whenever $n/2^{H+1} < pq \leq n$.

This gives, for every fixed $H \geq 0$,

$$L(n) \geq \left( \tfrac{1}{2}(1 - 2^{-H-1}) - o_H(1) \right) \frac{n \log\log n}{\log n},$$

and hence

$$L(n) \geq \left( \tfrac{1}{2} - o(1) \right) \frac{n \log\log n}{\log n}.$$

It does not settle the linear question, but appears to improve the visible lower-bound constant in the current fan-capture method from $1/8$ to $1/2$.

note pdf: https://github.com/jonaslsaa/maths/blob/main/872.pdf

### Om_Buddhdev_sensho — 11:00 on 23 Apr 2026

Using a research agent harness (GPT-5.4 Pro primary, Claude Opus 4.7 + Gemini 3.1 DeepThink secondary) for the past week I was able to prove:

- Upper bound: $L(n) < 0.19 n$. Via a fourth-order Bonferroni on Shortener's odd-prime-prefix strategy. Constant is $W_4/2 \leq 0.1897123371$, interval-arithmetic certified.
- Lower bound: $L(n) \geq (1/8 - o(1)) \frac{n \log\log n}{\log n}$. First order-improvement over the trivial $n/\log n$ baseline. Two-phase Prolonger: activate small primes (Mertens gives the reciprocal-mass), then max-degree right-capture on the resulting fan graph.

Also:

- Shield reduction: three-line structural reduction — $|A| \geq |U_n| - \beta_n(P)$ for any Prolonger shield prefix $P$. Turns terminal game positions into a weighted lower-half antichain problem.
- Polynomial shield-weight barrier (Theorem A, Lean combinatorial core): any shield-prefix proof of a linear lower bound via the reduction above needs $|P| \geq n e^{-2c - o(1)}$ shields. Hard constraint on a natural proof class.
- Exact $5n/24 + O(1)$ first-hit cover (zero-sorry Lean): the minimum upper-half cover of the lower half by divisibility is exactly $5n/24 + O(1)$, with a matching packing.
- Intermediate upper bounds $13/36$ and $5/16$ (both Lean-verified): improvements from the current $419/1008 \approx 0.416$.
- Three proof-class obstructions (Section 8): Sherali–Adams transversal-LP integrality; Johnson $q$-shadow covering dichotomy; separator-only closure limitation. Delimit what the current method family can produce.
- $K_4$-fiber refutation of the general safe-edge hypothesis using $\{13, 17, 19, 23\}$ — explicit small counterexample that motivates the restricted form used in the conditional $n (\log\log n)^2 / \log n$ lower bound.

Intermediate bounds $L(n) \leq 13/36$ and $L(n) \leq 5/16$ are zero-sorry Lean. The $< 0.19$ has a Lean endgame reduction; the envelope-inversion / prime-rounding bridge (Lemmas 7.4–7.17) is still prose. It has passed all GPT Pro audits so far.

I tried hard to get to a full solution but fell short. I hope someone smarter than me is able to make use of this for advancing this problem further.

Paper: sensho.xyz/papers/erdos-872.pdf
Repo: github.com/xa8zz/erdos-harness

### Om_Buddhdev_sensho — 03:50 on 16 Apr 2026

With GPT 5.4 Pro assistance, building on the $8/105$ construction, I wanted to flag a refinement that uses $v_p$-adic parity conditions rather than simple coprimality. For $k \geq 4$, let $I_k(n) = (n/k, n/3] \cap (2\mathbb{Z}+1)$ and $\mathcal{R}_k$ be the reduced ratios $a/b > 1$ with $a, b$ odd, $a, b \leq k$, and $a/b < k/3$. Call $B \subseteq I_k(n)$ ratio-independent if no two elements have ratio in $\mathcal{R}_k$. At $k = 8$, $\mathcal{R}_8 = \{5/3, 7/5, 7/3\}$, and defining

$$B_8(n) := \{b \in I_8(n) : v_5(b) \equiv 0 \pmod{2} \text{ and } (3 \mid b \Rightarrow b > n/7)\}$$

gives a ratio-independent set of density $85/1008 \approx 0.0843$, improving on $8/105 \approx 0.0762$. The $v_5$-parity condition kills the $5/3$ and $7/5$ edges automatically (the valuation flips parity), while the geometric cut on multiples of $3$ handles $7/3$ (where $v_5$ is preserved). At $k = 7$ the same parity idea alone gives $5/63 \approx 0.0794$.

This is just a static claim about the ratio-graph model. Converting to a Prolonger strategy requires verifying $B_8$ survives adversarial Shortener play, which I haven't checked carefully. Even if it converts, it doesn't address whether L(n)≥ϵnL(n) \geq \epsilon n

L(n)≥ϵn is achievable in general; it's a constant improvement within the interval+sieve class. The more interesting question is whether the $v_p$-parity family has a nontrivial limiting density as $k \to \infty$, or whether it's also capped below $1/2$. I haven't computed $k \geq 9$ yet. Posting in case others want to poke at either the conversion step or the asymptotic behavior. I'm going to attempt further solutions with AI.

### natso26 — 12:13 on 16 Apr 2026

Congrats.

I ran standard check which assessed this comment as correct. However, GPT-5.4 Thinking also believed that the improved constant from this comment should be $1/2 - 1/2 \cdot 85/1008 = 923/2016 = 0.457\dots$ rather than $1/2- 85/1008 = 419/1008 = 0.415\dots$, which still improves on the earlier $23/48 = 0.479\dots$. I am not sure whether this is correct but it seems important to note it here.

### Liam Price — 22:12 on 14 Feb 2026

GPT-5.2 Pro appears to have determined a strategy that disproves the last $(1-\varepsilon)\frac{n}{2}$ question on the assumption the Prolonger starts first, and can be viewed here. After a quick literature review, ChatGPT Deep Research did not appear to locate anything directly resolving aspects of this problem, but does appear to locate literature on related things. I have attempted formalising the result but have ran into some issues; will keep trying.

### StijnC — 08:40 on 15 Feb 2026

The GPT chat says it was unable to load?

(Or for aome reason I cannot see your chat?)

For the paper; there is a more efficient way than sharing Overleaf?

(Some people tend to have too many Overleaf folders, and likely we only need to see the PDF once)

### Liam Price — 14:22 on 15 Feb 2026

Here's the pdf version, not sure why chatgpt isn't loading, works fine for me.

### Adenwalla — 18:28 on 15 Feb 2026

As far as I can tell, the argument is correct but I think Lemma 4.5 is misstated. It is possible to choose a single $t$ that bottom kills multiple $s\in S$. This isn't an issue in your Shortener strategy as the Shortener is just picking the $s$ themselves, and so the conclusion of Lemma 4.5 holds.

EDIT: My mistake, I see that the Lemma holds as stated.

### Liam Price — 19:13 on 16 Feb 2026

Appreciate the input!

### natso26 — 15:24 on 17 Feb 2026

Quick check by GPT sees no major gaps.

In general I really appreciate you+Kevin continuing to try AI on these problems. The hype phase has passed, so they probably won't make major news now. Moreover for partial solutions it's even less of a news (but partial solutions could be more common from now on). But from a mathematical perspective, these are all very valuable. Especially since it means AI continues to work consistently and diversely on problems.

### Xiao_Hu — 18:37 on 17 Feb 2026

One can slightly improve the GPT bound ϵ > 1/24 to ϵ > 1/15, by modifying C to include all odd numbers in between (n/5, n/3]. Now the possible multiples of s in C in the upper half interval [n/2, n] are 2s, 3s and 4s. By oddness one cannot have 2s=3s', 2s=4s' or 3s=4s' with s, s' in C. Thus these multiples are distinct and lemma 4.1 extends to this scenario. Everything else remains the same and you get ϵ > 1/15.

Edit: Further improvement to ϵ can be made by choosing C to be the set of all odd numbers in (n/7, n/3] that are not multiples of 5. Then you'll have ϵ>(1/3-1/7)*1/2*4/5=8/105

### Thomas Bloom — 16:25 on 15 Oct 2025

With the help of ChatGPT I generated some code to work out the game length for each $N$ assuming both players are playing optimally, and the 'Long' player goes first. This sequence goes (from $N=2$ up to $N=40$).

1,2,2,3,3,4,4,5,5,5,5,6,6,7,7,7,7,8,8,9,9,10,10,

11,11,11,11,11,12,13,13,14,14,14,14,15,15,16,16,16,16

The corresponding sequence of $f(n)-\pi(n)$, if $f(n)$ is the length of the game, is $0$ for $2\leq N\leq 8$, $1$ for $9\leq N\leq 20$, $2$ for $21\leq N\leq 27$, $3$ for $28\leq N\leq 34$, and $4$ for $35\leq N\leq 40$.

As an instructive example, when $N=9$ (the first time this game goes on longer than the number of primes) one optimal (for both players) game goes

6 - 4 - 5 - 7 - 9

As another example, when $N=21$,

6 - 4 - 9 - 5 - 14 - 11 - 13 - 17 - 19 - 21

Or when $N=35$,

30-4-14-9-22-13-17-19-21-23-25-29-31-33-35

This (very limited) amount of computational evidence does seem to suggest that $f(n)-\pi(n)\to \infty$ at least.

It's a curious game - one might naively think that the Long player should focus on choosing large primes and the Short player should focus on choosing small primes, and indeed there is a 'prime bias' in the transcripts above (to be expected, e.g. certainly all primes in $(N/2,N]$ must appear at some point) but it seems like both players are better off choosing numbers with many factors for the first couple of turns at least.

### Adenwalla — 20:38 on 11 Jan 2026

It seems like the long player should start with choosing the largest primorial (say $p_k$#) less than $N$, as this stops the short player from choosing any of the primes up to $p_k$. The short player then plays $2^2$. The long player then plays $p_n$#$/p_k$# for the largest $n$ such that this is less than $N$, and the short player plays $3^2$. Essentially the long player plays the product of the most consecutive primes that haven't appeared in prior turns that they can and the short player plays the smallest number that can be played. When the long player cannot do that any more, they take $\min\{2p\}$ for primes $p<N/2$ such that $2p$ can be played. I would imagine that when $N$ is large enough, the long player would perhaps move on to choosing the smallest possible $3p$ etc. Ultimately there remains a set of terms that must be chosen, such as the primes in $[N/2,N]$ or $pq>N/2$ when $2p$ and $2q$ have already been chosen.

The aim for the long player is to 'defend' as many small primes as possible, and the way to cover as many as possible at once is to choose the product of as many as you can. The aim for the short player is roughly to choose the smallest terms possible as these have the most multiples less than $N$, though there may be a preference towards small primes or squares of primes when possible.

### Adenwalla — 15:15 on 15 Oct 2025

Given that the player who wants the game to end quickly can just choose the primes, the game can always be ended in $\frac{n}{\log(n)}$ or $\frac{2n}{\log(n)}$ moves (depending how moves are counted).

### Thomas Bloom — 15:35 on 15 Oct 2025

I don't think this is true - the other player might choose numbers with lots of prime divisors, so that after a certain point the other player has no primes left that are valid choices to play - but there still might be lots of other non-primes that are valid, so the game continues, and they have to abandon their primes-only strategy.

For example, when $N=9$, if the first player wants to end it quickly and the second wants to prolong it, and the first player tries to use only primes, then the game might go:

7 - 8 - 5 - 6 - 9

(This example still doesn't last long, but note that the first player still had the valid choice of 9 available even though all the primes were used up.)

It would be interesting to actually give an explicit strategy of the prolonger that shows they can also force it to last at least $100\frac{n}{\log n}$ (say) moves - given that Erdős was asking if the threshold was linear, presumably he believed this to be possible.

### DesmondWeisenberg — 20:45 on 11 Aug 2025

This raises an interesting related question, which I hope can shed some light on the game: how small can a maximal primitive subset of $\{2,...,n\}$ be? The set of primes shows that it can be $\pi(n)$. Is this the smallest possible for all $n \geq 2$? If so, then the game must always last at least $\pi(n)$ moves no matter what the players do.

I'm not sure if Erdős ever asked this question. He and Cameron asked in [CaEr90] how many primitive subsets there are of $\{2,...,n\}$, and this was solved by Angelo here. (I don't think that problem appears on this website yet.) See, e.g., McNew's paper here for results on counting maximal primitive subsets of $\{2,...,n\}$, though more of the literature seems to focus on counting maximum-size primitive sets. However, I'm not sure if the question of how small a maximal primitive subset can be has ever appeared in the literature. There's a related paper here, but a quick skim didn't reveal any results that are applicable to this problem specifically.

### Thomas Bloom — 21:15 on 11 Aug 2025

Every maximal primitive subset must contain all primes in $(n/2,n]$, so $\gg \frac{n}{\log n}$ is a lower bound.

### DesmondWeisenberg — 23:00 on 11 Aug 2025

Nice observation! That shows that if $A \subseteq \{2,...,N\}$ is a maximal primitive set, then $|A| \geq (\frac{1}{2} + o(1))\frac{n}{\log n}$. In fact, it's actually not a lot harder to show that $|A| \geq (1 + o(1))\frac{n}{\log n}$. This is because every prime number at least $\sqrt{n}$ must have a multiple in $A$, and no two of these primes can have a multiple in common. This shows that $|A|$ is at least the number of primes in $[\sqrt{n}, n]$, which is asymptotically $\frac{n}{\log n}$.

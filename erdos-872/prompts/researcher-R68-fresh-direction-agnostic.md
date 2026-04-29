Don't search the internet. This is a test to see how well you can craft non-trivial, novel and creative proofs given a "primitive sets and divisibility games" math problem. Provide a full unconditional proof or disproof of the problem.

## Problem

Let $n \geq 2$. Two players alternately pick integers from $\{2, 3, \ldots, n\}$ to add to a common set $A$, subject to the constraint that $A$ remain primitive: no element of $A$ divides another. The game ends when no legal move is possible. One player ("Prolonger") wants the game to last as long as possible; the other ("Shortener") wants it to end as quickly as possible. Let $L(n)$ be the guaranteed game length under optimal play, with Prolonger moving first.

Determine $L(n)$ asymptotically.

## Structural facts

### Equivalence to an antichain game

A primitive subset of $\{2, \ldots, n\}$ is exactly an antichain in the divisibility poset on $\{2, \ldots, n\}$. The game is therefore an alternating-claim game on this poset whose terminal states are the maximal antichains. Game length equals $|A|$ at termination, so

$$\pi(n/2 < p \leq n) \leq L(n) \leq w(\{2, \ldots, n\}),$$

where $w$ is the antichain width and the lower bound comes from the fact that every prime in $(n/2, n]$ is incomparable with every element of $\{2, \ldots, n\}$ and so must appear in any maximal antichain.

### Bipartite-graph reformulation

Define a graph $G_n$ on the primes by

$$p \sim q \quad \iff \quad pq \in (n/2, n].$$

Restrict Prolonger to edges of $G_n$ (i.e. semiprimes in $(n/2, n]$) and Shortener to vertices (single primes). A red edge cannot contain a blue vertex (otherwise the blue prime divides the played semiprime). Up to a strategy-stealing argument that lets Shortener play vertices without loss, the original game restricted to this move-set is equivalent to a coloured-edge / coloured-vertex game on $G_n$ with $|E(G_n)|$ initial available edges.

### Shield-reduction identity

For Prolonger's upper prefix $P \subseteq A \cap (n/2, n]$, let $L(P) = \{x \leq n/2 : x \mid p \text{ for some } p \in P\}$ and define

$$\beta_n(P) = \max\{|B| : B \subseteq L(P), B \text{ antichain}\}.$$

Then every eventual maximal $A$ satisfies

$$|A| \geq |(n/2, n]| - \beta_n(P).$$

Proof: $B := A \cap [2, n/2]$ is an antichain in $L(P)$; by maximality $A \cap (n/2, n] = (n/2, n] \setminus \bigcup_{x \in B} M(x)$ where $M(x) = \{kx \leq n : k \geq 1\}$; union-bound. The vaccinated extension: for any primitive lower prefix $D$ and upper prefix $P \subseteq U_D$,

$$|A| \geq |D| + |U_D| - \beta_D(P).$$

### Labelled odd-part comparison

For $x \in \{2, \ldots, n\}$, write $x = 2^{\nu_2(x)} \omega(x)$ with $\omega(x)$ odd. If $A$ is primitive then the map $x \mapsto (\omega(x), \nu_2(x))$ is injective on $A$, and if $x, y \in A$ with $\omega(x) \mid \omega(y)$ then $\nu_2(x) > \nu_2(y)$. Equivalently, $A$ embeds as an antichain in the labelled odd-part poset

$$(u, a) \preceq (v, b) \iff u \mid v \text{ and } a \leq b.$$

For example, $\{12, 30\}$ is primitive: odd parts $3, 15$ satisfy $3 \mid 15$, but $\nu_2(12) = 2 > 1 = \nu_2(30)$.

### Exact first-hit cover

The minimum upper-half divisibility-cover of the lower half is exactly $5n/24 + O(1)$:

$$\min \{|C| : C \subseteq (n/2, n], \forall x \in [2, n/2]\ \exists c \in C \text{ with } x \mid c\} = 5n/24 + O(1).$$

A matching packing realises this constant.

### Reachable harmonic mass

For every Shortener strategy $\sigma$ and every $n$ large enough, there is a Prolonger strategy $\pi$ such that the set $B(P) = \{p \text{ prime} : p \mid x \text{ for some } x \in A_\pi\}$ produced under $(\pi, \sigma)$ satisfies

$$\sum_{p \in B(P)} \frac{1}{p} \geq \tfrac{1}{2} \log\log n.$$

In particular, the harmonic sum of primes blocked by Prolonger's plays is unbounded against any Shortener.

### Antichain construction with sublinear residual

Fix $\alpha \in (1/3, 1/2)$ and $y = n^\alpha$. The set

$$F_\alpha = \{p \leq y : p \text{ prime}\} \cup \{d \leq n/2 : \Omega(d) = 2, \min(\text{prime factors of } d) > y\}$$

is an antichain in $\{2, \ldots, n/2\}$, and every $d \in \{2, \ldots, n/2\}$ has a multiple in the upper-half shadow of $F_\alpha$. The residual count of $\{2, \ldots, n/2\}$ uncovered by $F_\alpha$'s shadow is $O(n / \log n)$.

## Numerical evidence

### Exact small-$n$ minimax

Computed by the residual legal-mask recurrence

$$V_{\mathrm{Long}}(S) = 1 + \max_{x \in S} V_{\mathrm{Short}}(S \setminus N[x]), \qquad V_{\mathrm{Short}}(S) = 1 + \min_{x \in S} V_{\mathrm{Long}}(S \setminus N[x]),$$

with $N[x] = \{y : x \mid y \text{ or } y \mid x\}$, terminating with $V(\emptyset) = 0$. The values $f(n) = V_{\mathrm{Long}}(\{2, \ldots, n\})$ for $n = 2, \ldots, 40$ are

$$1,2,2,3,3,4,4,5,5,6,6,7,7,7,7,8,8,9,9,10,10,11,11,11,11,11,12,13,13,14,14,14,14,15,15,16,16,16,16.$$

The offsets $f(n) - \pi(n)$ are
$0$ for $2 \leq n \leq 8$;
$1$ for $9 \leq n \leq 20$;
$2$ for $21 \leq n \leq 27$;
$3$ for $28 \leq n \leq 34$;
$4$ for $35 \leq n \leq 40$.

### Heuristic large-$n$ minimax

Approximate minimax via three independent Shortener heuristics (smallest legal odd prime; greedy coverage; pair-response) on $n$ up to $10^6$ produces

$$1.15 \leq \frac{f(n) \log n}{n} \leq 1.50$$

across the range, with slow decline as $n$ grows.

REMEMBER - this unconditional argument may require non-trivial, creative and novel elements.

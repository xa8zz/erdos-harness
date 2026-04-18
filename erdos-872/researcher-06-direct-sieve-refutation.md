# Researcher output — refutation of direct-sieve route to $L(n) = O(n/\log n)$ via odd-prime-prefix Shortener

**Source:** ChatGPT Pro (continuation of the 6B thread). Prompt: `prompts/researcher-06-shortener-direct.md`.
**Extracted:** 2026-04-18.
**Status:** proof of refutation claim is rigorous; not yet audited.

---

The proposed one-sided sieve reduction does **not** prove $L(n) = O(n/\log n)$. In fact, there is a concrete Prolonger counterstrategy showing that the set
$$D = \{q_1, \ldots, q_k\}$$
produced by the odd-prime-prefix Shortener strategy can be so sparse that
$$N_D(n) \gg n,$$
so no direct bound of the form $N_D(n) = O(n/\log n)$ can hold for that $D$.

Here is the clean statement.

Let Shortener use the odd-prime-prefix rule for
$$k = \left\lfloor \frac{\sqrt n}{\log n}\right\rfloor$$
moves: on her $j$-th move she chooses the smallest legal odd prime $q_j$.

I will describe an explicit Prolonger strategy against this, and then prove
$$\sum_{j \le k}\frac{1}{q_j} \le \frac{1}{2}+o(1), \qquad N_D(n) \ge \left(\frac{1}{4}-o(1)\right)n.$$
That already kills the hoped sieve step.

---

Prolonger's counterstrategy is this.

Before Shortener's $j$-th move, look at the legal odd primes that remain. Let $B_j$ be the **maximal initial block** of those legal odd primes whose product is at most $n$. Prolonger plays
$$P_j := \prod_{p \in B_j} p.$$

This move is legal: the primes in $B_j$ were all legal individually, none of them appeared in earlier $P_i$ or among earlier $q_i$, and the blocks are disjoint, so no earlier chosen number divides $P_j$ and $P_j$ divides none of them.

Because $B_j$ is the initial block of currently legal odd primes, Shortener's prescribed move $q_j$ is exactly the next odd prime after $B_j$.

Now let
$$b_j := \sum_{p \in B_j}\log p.$$
By maximality of $B_j$,
$$b_j + \log q_j > \log n.$$

Also, by construction, the odd primes up to $q_j$ are partitioned as
$$B_1, \{q_1\}, B_2, \{q_2\}, \ldots, B_j, \{q_j\}.$$
So for the odd-prime Chebyshev function
$$\vartheta_{\mathrm{odd}}(x) := \sum_{\substack{p \le x \\ p \text{ odd prime}}}\log p$$
we get the exact identity
$$\vartheta_{\mathrm{odd}}(q_j) = \sum_{t=1}^j b_t + \sum_{t=1}^j \log q_t.$$
Using $b_t + \log q_t > \log n$ termwise,
$$\vartheta_{\mathrm{odd}}(q_j) > j \log n.$$

Since $\vartheta_{\mathrm{odd}}(x) = x + o(x)$, this implies
$$q_j \ge (1 - o(1))\, j \log n \qquad (1 \le j \le k).$$

So the selected primes are not "all odd primes up to $\sqrt n$"; they are only on the $j \log n$ scale.

From this,
$$\sum_{j \le k} \frac{1}{q_j} \le \frac{1+o(1)}{\log n} \sum_{j \le k}\frac{1}{j} = \frac{\log k + O(1)}{\log n}(1 + o(1)) = \frac{1}{2}+o(1),$$
because $k = \sqrt n / \log n$ gives $\log k = \tfrac{1}{2}\log n - \log\log n + O(1)$.

So
$$S := \sum_{j \le k}\frac{1}{q_j} \le \frac{1}{2}+o(1).$$

That already shows the Mertens-product heuristic in the prompt is not the right one. Indeed,
$$\log \prod_{j \le k}\left(1 - \frac{1}{q_j}\right) = -\sum_{j \le k}\frac{1}{q_j} + O\!\left(\sum_{j \le k}\frac{1}{q_j^2}\right) \ge -\frac{1}{2} - o(1),$$
since $\sum 1/q_j^2 = O(1/\log^2 n)$. Hence
$$\prod_{j \le k}\left(1 - \frac{1}{q_j}\right) \ge e^{-1/2 - o(1)},$$
a positive constant, not $\asymp 1/\log n$.

Now count $D$-free odd integers. Let
$$N_D(n) = \#\{m \le n :\ m \text{ odd},\ q_j \nmid m\ \forall j \le k\}.$$
Among odd integers up to $n$, the number divisible by $q_j$ is
$$\frac{n}{2q_j} + O(1).$$
So by the union bound,
$$N_D(n) \ge \frac{n}{2} - \sum_{j \le k}\left(\frac{n}{2q_j} + O(1)\right) = \frac{n}{2}\bigl(1 - S\bigr) - O(k).$$
Using $S \le \tfrac{1}{2} + o(1)$ and $k = o(n)$,
$$N_D(n) \ge \left(\frac{1}{4} - o(1)\right)n.$$

So the hoped statement
$$N_D(n) = O(n/\log n)$$
is simply false for the $D$ generated online by this Shortener strategy.

That is the main conclusion.

A quick Python sanity check matches this picture: under the block strategy above, I got
$$\sum_{j \le k}\frac{1}{q_j} \approx 0.264,\ 0.301,\ 0.317,\ 0.334$$
for $n = 10^6, 10^8, 10^{10}, 10^{12}$, and $q_k/(k \log n) \approx 1.28$ throughout.

So the right takeaway is:

The odd-prime-prefix reduction to the one-sided sifted set $N_D(n)$ does not settle the game. Prolonger can force $D$ to be harmonically sparse, leaving a linear-sized $D$-free odd set. Any proof of $L(n) = O(n/\log n)$ has to use more than $D$ alone; it must also exploit the additional structure of Prolonger's blocking moves, or use a different Shortener strategy entirely.

That is the strongest rigorous result I can justify from the stated setup: not a proof of $O(n/\log n)$, but a proof that the proposed direct-sieve route on $N_D$ alone cannot work.

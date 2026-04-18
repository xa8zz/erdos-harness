# Researcher output — new upper bound $L(n) \le \frac{13}{36}n + o(n)$ via odd-prime-prefix Shortener

**Source:** ChatGPT Pro (separate thread). Prompt: `prompts/researcher-05-shortener-ceiling.md`.
**Extracted:** 2026-04-18.
**Status:** not yet informally audited; not yet Aristotle-verified. **If audit confirms, this is the first front-line-bound advance in the program — $0.3612n$ vs. public record $0.416n$.**

---

I found a concrete Shortener strategy with a rigorous asymptotic bound below $0.416n$.

Take
$$k := \left\lfloor \frac{\sqrt n}{\log n} \right\rfloor.$$
For her first $k$ turns, Shortener plays the **smallest legal odd prime**. After that, she can play arbitrarily.

Let those first-phase primes be
$$q_1 < q_2 < \cdots < q_k.$$

The payoff from this prefix is:

$$L(n) \le \frac{13}{36} n + o(n).$$

So this gives a new explicit upper bound
$$L(n) \le 0.3612\, n + o(n),$$
which materially beats $0.416n$.

Here is the argument.

---

Write every integer $x$ uniquely as
$$x = 2^a 3^b m, \qquad m \text{ odd},\ (m, 3) = 1.$$

Fix the set
$$D := \{q_1, \ldots, q_k\}.$$

After Shortener has chosen $D$, every later legal move must be **$D$-free**, meaning not divisible by any $q_i$.

The proof has three pieces.

### 1. The chosen odd primes are still fairly small

Claim: for every fixed $\varepsilon > 0$, for all large $n$,
$$q_j \le \left(\frac{3}{2} + \varepsilon\right) j \log n \qquad (1 \le j \le k).$$

Reason. Suppose $q_j$ were larger. Then every odd prime
$$p \le \left(\frac{3}{2} + \varepsilon\right) j \log n$$
would already be blocked before Shortener's $j$-th move. A blocked odd prime is either one of $q_1, \ldots, q_{j-1}$, or it divides one of Prolonger's first $j$ moves. Therefore
$$\vartheta_{\text{odd}}\!\left(\Bigl(\frac{3}{2} + \varepsilon\Bigr) j \log n\right) \le j \log n + \sum_{i < j} \log q_i.$$
Inductively $q_i \le (\frac{3}{2} + \varepsilon) i \log n$, so because
$$j \le \frac{\sqrt n}{\log n},$$
we get
$$\sum_{i < j} \log q_i \le j \log\!\Bigl(\Bigl(\frac{3}{2} + \varepsilon\Bigr) j \log n\Bigr) = \left(\frac{1}{2} + o(1)\right) j \log n.$$
Thus the right-hand side is
$$\left(\frac{3}{2} + o(1)\right) j \log n,$$
while the left-hand side is
$$\left(\frac{3}{2} + \varepsilon + o(1)\right) j \log n$$
by Chebyshev. Contradiction.

So
$$\sum_{j \le k} \frac{1}{q_j} \ge \frac{1 + o(1)}{\left(\frac{3}{2} + \varepsilon\right) \log n} \sum_{j \le k} \frac{1}{j} = \frac{1 + o(1)}{\left(\frac{3}{2} + \varepsilon\right) \log n} (\log k + O(1)).$$
Since $\log k = \frac{1}{2} \log n - \log\log n + O(1)$,
$$\sum_{j \le k} \frac{1}{q_j} \ge \frac{1}{3 + 2\varepsilon} + o(1).$$
Letting $\varepsilon \downarrow 0$,
$$\sum_{j \le k} \frac{1}{q_j} \ge \frac{1}{3} - o(1).$$
Call this sum $S$. So
$$S \ge \frac{1}{3} - o(1).$$

---

### 2. After the prefix, every future antichain injects into odd $D$-free integers

Let $A'$ be the set of moves made **after** the first $2k$ moves. Every $x \in A'$ is $D$-free, so write
$$x = 2^a 3^b m, \qquad m \text{ odd},\ (m, 3 \prod_{q \in D} q) = 1.$$

Define
$$\phi(x) := 3^b m.$$

Then $\phi(x)$ is odd, $D$-free, and $\phi(x) \le x \le n$.

Now if $\phi(x) = \phi(y)$, then $b$ and $m$ are equal for both, so $x$ and $y$ differ only by a power of $2$. Hence one divides the other. Since $A'$ is an antichain, that forces $x = y$.

So $\phi$ is injective on $A'$. Therefore
$$|A'| \le N_D(n),$$
where $N_D(n)$ is the number of odd integers $\le n$ divisible by none of the $q_j$.

This is the key compression: the whole tail of the game is controlled by a sifted odd set.

---

### 3. A second-order sieve bound on $N_D(n)$

Let $\mathcal O$ be the odd integers in $[1, n]$, and for each $q \in D$, let $U_q \subset \mathcal O$ be the odd multiples of $q$.

Then
$$N_D(n) = \left| \mathcal O \setminus \bigcup_{q \in D} U_q \right|.$$

By the second Bonferroni inequality,
$$N_D(n) \le |\mathcal O| - \sum_{q \in D} |U_q| + \sum_{q < r \in D} |U_q \cap U_r|.$$

Now, since $q, r$ are odd,
$$|U_q| = \frac{n}{2q} + O(1), \qquad |U_q \cap U_r| = \frac{n}{2qr} + O(1).$$
Hence
$$N_D(n) \le \frac{n}{2} \left(1 - \sum_{q \in D} \frac{1}{q} + \sum_{q < r \in D} \frac{1}{qr}\right) + O(k^2).$$
Because $k = \sqrt n / \log n$, we have $k^2 = o(n)$. Also
$$\sum_{q < r} \frac{1}{qr} \le \frac{1}{2} \left(\sum_q \frac{1}{q}\right)^2 = \frac{S^2}{2}.$$
So
$$N_D(n) \le \frac{n}{2} \left(1 - S + \frac{S^2}{2}\right) + o(n).$$
Using $S \ge \frac{1}{3} - o(1)$,
$$N_D(n) \le \frac{n}{2} \left(1 - \frac{1}{3} + \frac{1}{18}\right) + o(n) = \frac{13}{36} n + o(n).$$

Finally,
$$L(n) \le 2k + |A'| \le 2k + N_D(n) = \frac{13}{36} n + o(n),$$
since $k = o(n)$.

That proves the bound.

---

So the explicit strategy is:

Choose the smallest legal odd prime for the first $\lfloor \sqrt n / \log n \rfloor$ Shortener turns.

and it yields
$$\boxed{L(n) \le \frac{13}{36} n + o(n)}.$$

A few remarks.

The critical correction, which killed several tempting "upper-cover response" ideas, is that Shortener cannot answer a lower move by choosing a comparable upper multiple. The right online certificate is different: after the odd-prime prefix, every remaining antichain injects into the sifted odd numbers. That is why the proof becomes one-dimensional and survives the online setting.

This also suggests a sharpening path. The same prefix gives
$$S = \sum_{q \in D} \frac{1}{q} \approx \frac{1}{3}.$$
I only used second-order Bonferroni. To go below $13/36$, one would need either a stronger lower bound on $S$, or a finer odd-sift estimate than
$$1 - S + \frac{S^2}{2}.$$
That is exactly where an LP-dual or rounded dual could matter: it should replace this crude global sieve by a more local certificate on the surviving odd core structure.

If you want, I can push this argument one step further and try to optimize the prefix length and the truncation order systematically.

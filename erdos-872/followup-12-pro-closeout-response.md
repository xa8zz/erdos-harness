# Pro follow-up response — Theorem 5 (resolution against disjoint small-prime carriers)

**Source:** GPT Pro, continuation of Round 12 thread, responding to `prompts/followup-12-pro-closeout.md`.
**Status:** **Genuine new rigorous theorem.** Proves the resolution lemma for the Prolonger class that includes the universal block-product counter. Identifies the remaining gap as "overlapping carriers" + "blocked large primes" — narrower and more concrete than before.

---

## Clean note

Fix a game position $A \subseteq \{2, \ldots, n\}$.

**Definition.** A prime $p$ is **resolved** at $A$ if there is no legal move $x$ with $p \mid x$. This is monotone: once resolved, always resolved.

### Theorem 1 (conditional implication, rigorous)

Let $y = n^\alpha$ with $1/3 < \alpha < 1/2$. If at some position every prime $p \le y$ is resolved, then every future legal move lies in
$$\mathcal{S}_y := \{x \le n : P^-(x) > y,\ \Omega(x) \le 2\}.$$
Hence the remaining number of moves is $O_\alpha(n/\log n)$.

**Proof.** If a legal $x$ had a prime divisor $p \le y$, then $p$ would not be resolved. So every prime factor of $x$ is $> y$. Since $y^3 = n^{3\alpha} > n$, such an $x$ cannot have $\Omega(x) \ge 3$. Thus $\Omega(x) \le 2$, proving $x \in \mathcal{S}_y$.

Count $\mathcal{S}_y$:
- Prime part: $\pi(n) - \pi(y) = O(n/\log n)$.
- Semiprime part: $\sum_{y < p \le \sqrt n} (\pi(n/p) - \pi(p-1)) \ll \frac{n}{\log n} \sum_{y < p \le \sqrt n} \frac{1}{p} = O_\alpha(n/\log n)$, because $\sum_{y < p \le \sqrt n} 1/p = \log(\log\sqrt n / \log y) + O(1) = O_\alpha(1)$. ∎

### Corollary 2 (the conditional is rigorous)

If Shortener can force all primes $\le n^{1/3+\varepsilon}$ to be resolved in $O(n/\log n)$ turns, then $L(n) = O(n/\log n)$.

### Lemma 3 (omitted-vertex shadowing)

Let $u \le n$ be divisible by distinct primes $p_0, \ldots, p_t$. Suppose for each $i$ there is a chosen number $x_i$ with $u/p_i \mid x_i$. Then every divisor $d \mid u$ containing any $t$ of the marked primes divides one of the $x_i$.

**Proof.** If $d$ contains $t$ of the $t+1$ marked primes, choose $i$ so that $p_i \nmid d$. Then $d \mid u/p_i \mid x_i$. ∎

For $t = 2$ this is the semiprime shadow: if $u$ has marked primes $p, q, r$, and chosen multiples of $u/p, u/q, u/r$, then the semiprime divisors $pq, pr, qr$ are all shadowed.

### Lemma 4 (large-semiprime-layer antichain + batch resistance)

If $y > n^{1/3}$, then the family
$$Q_y := \{uv \le n/2 : u, v \text{ primes} > y\}$$
is an antichain, and any composite $x \le n$ is comparable with at most one member of $Q_y$.

**Proof.** Distinct semiprimes in $Q_y$ are incomparable. If composite $x$ were comparable with two, either both divide $x$ (forcing $\ge 3$ primes $> y$, impossible since $y^3 > n$), or $x$ divides one of them (composite divisor of a semiprime must equal it — at most one). ∎

---

## Theorem 5 (NEW — resolution against disjoint small-prime carriers)

**Statement.** Fix $y = n^\alpha$ with $1/3 < \alpha < 1/2$. Assume every composite Prolonger move has all prime factors $\le y$, and the prime supports of distinct composite Prolonger moves are pairwise disjoint.

Then Shortener can force all primes $\le y$ to be resolved in $O(n/\log n)$ of her own turns. In particular, the total game length is $O(n/\log n)$.

**This includes the universal block-product Prolonger construction.**

**Proof.** Let $B$ be the set of primes $p \le y$ occurring in some composite Prolonger move. By disjoint-support, each $p \in B$ belongs to a unique composite carrier $C(p)$; write $e(p) = v_p(C(p))$.

Shortener plays in three phases:
1. Every legal prime.
2. For each $p \in B$ with $C(p)$ having $\ge 2$ distinct prime factors and $p^{e(p)+1} \le n$: play $p^{e(p)+1}$.
3. For each pair $p, q \in B$ with $C(p) \ne C(q)$: play $pq$.

**Legality.** Phase-2 $p^{e(p)+1}$ is incomparable with all chosen primes (since $p$ was not phase-1 legal), with $C(p)$ (since $C(p)$ has another prime), with other carriers (disjoint supports), and with phase-3 products. Phase-3 $pq$ is incomparable with primes (p, q not phase-1 legal), with carriers (no carrier contains both p and q), and with phase-2 powers.

**Resolution.** For any legal $x$ with $p \mid x$:
- All primes of $x$ in $B$ (else some prime outside $B$ appears, but phase 1 played it, contradiction).
- All primes of $x$ in a single carrier $C(p)$ (else $pq$ from phase 3 divides $x$, contradiction).
- If $C(p)$ is a pure prime power $r^a$: any $x$ divisible by $r$ is comparable with $r^a$, contradiction.
- If $C(p)$ has $\ge 2$ distinct primes: either $x \mid C(p)$ (comparable, contradiction) or some prime $r \mid x$ has exponent $> e(r)$, so $r^{e(r)+1} \mid x$ — phase 2 played this (or $r^{e(r)+1} > n$ so $x > n$, contradiction).

So no legal multiple of $p$ remains.

**Count.** Phase 1 ≤ $\pi(n)$. Phase 2 ≤ $|B| \le \pi(y)$. Phase 3 ≤ $\binom{|B|}{2} \le \pi(y)^2$. With $y = n^\alpha$, $\alpha < 1/2$: $\pi(y)^2 = o(n/\log n)$. Total $O(n/\log n)$. ∎

---

## Why the full case is still not proved

Two concrete remaining obstructions:

### Overlapping carriers

Pair-repair breaks when small primes sit in multiple Prolonger composites. Concrete:
$$30 = 2 \cdot 3 \cdot 5, \quad 42 = 2 \cdot 3 \cdot 7, \quad 70 = 2 \cdot 5 \cdot 7.$$
Every pair of primes from $\{3, 5, 7\}$ already divides some carrier: $3\cdot 5 \mid 30$, $3\cdot 7 \mid 42$, $5\cdot 7 \mid 70$. So phase-3's pair-repair chooses none of $\{15, 21, 35\}$. Squares $\{9, 25, 49\}$ don't hit $105 = 3\cdot 5\cdot 7$, and $105$ is incomparable with $\{30, 42, 70\}$. So $105$ remains legal.

This is omitted-vertex shadowing in concrete form: pair-level repair is insufficient once carriers overlap.

### Blocked large primes

Naive pair repair for mixed pairs $pq$ with $p \le y < q$ costs:
$$N_{\text{pair}}(y) := \sum_{p \le y}(\pi(n/p) - \pi(y)) \asymp \frac{n}{\log n} \sum_{p \le y} \frac{1}{p} \asymp \frac{n \log\log y}{\log n}.$$

For $y = n^{1/3+\varepsilon}$: $\asymp \frac{n \log\log n}{\log n}$, missing the target by $\log\log n$.

This does not refute the resolution lemma — one might still batch mixed pairs efficiently by choosing numbers of the form $qM$. Pro tried that; the counting is encouraging but legality against overlapping-carrier Prolonger moves blocks the argument.

## Bottom line (Pro's own framing)

1. **Conditional (resolve all primes $\le n^{1/3+\varepsilon}$ in $O(n/\log n)$) $\Longrightarrow L(n) = O(n/\log n)$ is RIGOROUS.**
2. **The resolution program is RIGOROUS for the whole disjoint small-prime-carrier class, including the universal block-product counter.**
3. **The remaining gap is concentrated in overlapping carriers + blocked large primes.**

**The block-product obstruction is not the real barrier.** The unresolved core is an overlapping-carrier / blocked-large-prime batching problem.

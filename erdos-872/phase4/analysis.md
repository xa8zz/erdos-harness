# Analytical gap: why the $(\mathcal{V}/2)n$ bound is loose

## The mismatch

The current Shortener upper bound proof gives
$$L(n) \le K + \#\{m \le n \text{ odd}: (m, D) = 1\} = K + (n/2)\,\mathcal{V}\,(1+o(1)) = (0.22002 + o(1))\,n.$$

Empirical measurement (see [findings.md](findings.md)) gives $L \sim 1.6\,n/\log n$ against the strongest Prolongers at $n \le 3\cdot 10^6$. Asymptotic ratio $L / (\mathcal{V}/2\,n) \to 0$.

**The bound is loose by a factor of $\log n$.** What's missing?

## Step-by-step audit of the proof

The proof uses:
1. $|A| \le K + |A \setminus D|$ with $K \le (1-\varepsilon)n/(2\log n)$ by refined Chebyshev.
2. Odd-part compression: $\phi: A \to \text{odd integers} \le n$ is injective on antichains.
3. $\phi(A \setminus D) \subseteq \{m \le n: m \text{ odd}, (m, D) = 1\}$.
4. $|\phi(A \setminus D)| \le \#\{\ldots\} = (n/2)\mathcal{V}(1+o(1))$ via refined Chebyshev + finite inclusion-exclusion.

Step 3 is the **only** use of divisibility: $\phi(r) = $ odd part of $r$ is not divisible by any $q \in D$ because $r$ is not divisible by any $q \in D$ (since $D$ primes don't share factors with 2, and $q | r$ iff $q | \phi(r)$).

**What's missing in step 3**: $A \setminus D$ is an **antichain**. So $\phi(A \setminus D)$ has structure beyond "avoiding $D$":
- If $m_1 | m_2$ with $m_1, m_2 \in \phi(A \setminus D)$, the corresponding $r_1 = 2^{a_1} m_1, r_2 = 2^{a_2} m_2 \in A$ must be antichain. This forces $a_1 > a_2$ strictly.
- Equivalently: along any chain $m_1 | m_2 | \ldots | m_k$ in $\phi(A)$, the exponents $a_i$ are strictly decreasing, so $a_1 \ge k - 1$, so $r_1 \ge 2^{k-1} m_1$.

This means chains in $\phi(A)$ are limited in the product sense.

Also missing: $A \setminus D$ is **incomparable with every Prolonger move** $x \in P$.

## Why max antichain in residual doesn't help alone

Computing max antichain in the sieve residual (instead of just counting it) shrinks the bound by a factor $\approx 0.64$ numerically (at $n \le 2000$ where we can compute exactly). This gives $L \le K + 0.64 \cdot (n/2)\mathcal{V} \approx 0.14\,n$ — tightened but **still linear**. Not sublinear.

Empirical $L$ is ~$0.12\,n$ at $n = 10^6$ and decreasing as $n$ grows. So the **game-dynamics** (Prolonger can't achieve full max antichain because each move changes the residual) must contribute another factor of $\log n$.

## Where the $\log n$ factor must come from

Several candidates. The proof probably needs exactly one of these.

### (A) $B$-smoothness constrains composite residual

Prolonger's blocked primes $B \subseteq [3, n^{1/3}]$. By block-product counter, $|B|$ can be up to $O(n^{1/3}/\log n)$, but for "optimal" Prolongers that achieve the lower bound $\sum 1/p \ge (1/2)\log\log n$ with smallest primes, $|B| = \Theta(\log\log n)$.

Residual composites have **all prime factors in $B$** (since mixed composites $p \cdot q$ with $p \in B, q > q_K \sim n/2$ exceed $n$).

For $|B| = O(\log\log n)$: $B$-smooth integers $\le n$ number $\le (\log n)^{O(\log\log n)} = n^{o(1)}$. Max antichain among them: also $n^{o(1)}$.

So **if** Prolonger's $|B| = O(\log\log n)$, residual composite max antichain is $n^{o(1)}$, and $L \le K + n/(2\log n) + n^{o(1)} = O(n/\log n)$.

**Gap**: why can Prolonger only use $|B| = O(\log\log n)$ primes? The block-product constraint gives a LOWER bound on $|B|$, not an upper bound. An optimal Prolonger might use many more primes (as smooth-dense numerics suggest).

### (B) Prolonger's antichain must respect $B$-smoothness

If Prolonger plays moves with primes all in some set $B$, the set of moves is an antichain in $B$-smooth integers $\le n$. Max antichain in $B$-smooth $\le n$ is bounded.

By de Bruijn-Tengbergen-Kruyswijk, max antichain in $\{m \le n: \text{supp}(m) \subseteq B\}$ is the largest "rank layer" by $\Omega$, which for $|B| = m$ primes equals $\Theta(\Psi_B(n)/\sqrt{m})$ where $\Psi_B(n)$ is the count.

If $|B| = m$ primes with sum-of-reciprocals $\sum 1/p \asymp C$: rough bound $\Psi_B(n) \asymp n \cdot \prod_{p \in B}(1 - 1/p)^{-1} / n$... actually more like $n$ times a Mertens product factor. Needs care.

**Conjecture**: max antichain in ($B$-smooth integers $\le n$) is $O(n/\log n)$ uniformly over $B \subseteq [3, n^{1/3}]$ with $\sum 1/p \le \log\log n + O(1)$.

If true, composite residual max antichain = $O(n/\log n)$, so $L = O(n/\log n)$.

### (C) Shortener's interleaved moves bound Prolonger's "ambition"

A potential function $\Phi_t$ on game state, decreasing with each Prolonger move, starting at $\Phi_0 = O(n/\log n)$. Then $|P| \le \Phi_0 = O(n/\log n)$.

Candidate potential: $\Phi_t = \sum_{p \text{ prime}, p \le n, p \text{ legal at } t} 1/p$. Prolonger move $x$ decreases $\Phi$ by $\sum_{p | x, p \text{ legal}} 1/p$. If each such sum is $\ge c/\log n$, then $|P| \le \Phi_0 / (c/\log n) = O(\log\log n \cdot \log n) \ne O(n/\log n)$. Doesn't work directly.

Alternative: Shortener's prime-captures "bill" to Prolonger's moves. Each Prolonger move $x$ "pays" for a certain number of Shortener prime captures. Accounting could yield $|P| \le K = O(n/\log n)$.

## Conjecture for Round 15

$$L(n) = \Theta\!\left(\frac{n}{\log n}\right)\quad\text{or}\quad \Theta\!\left(\frac{n\,f(n)}{\log n}\right)$$
with $f(n)$ growing slowly (at most $(\log\log n)^{O(1)}$).

## Specific research leads

1. **Prove $B$-smoothness forces $|P| = O(n/\log n)$** via DTK-type max antichain bound in smooth numbers. (Approach B above.)

2. **Show that `smallest_legal` Shortener (plays smallest legal integer, not just smallest odd prime) gives improved bound.** Numerics: `smallest_legal` beats SLOP by 3-5%. This breaks the "refined Chebyshev on primes only" frame. Maybe allowing prime powers in $D$ improves the refined density to $du/u$ (log density), which diverges — giving sublinear directly. This is the "log-density sharpening" lead from the Round 15 prompt, rigorized.

3. **Shield-reduction dualization**: for Prolonger-prefix $P$, the shield reduction gives $|A| \ge |U| - \beta(P)$. Dualized Shortener-prefix argument: $|A| \le |P| + |\text{sieve residual of } P|$. Formalize and use.

## Numerics to report

Against smooth-dense Prolonger, SLOP Shortener (all values for $L\log n/n$):
$$1.69,\ 1.72,\ 1.65,\ 1.66,\ 1.63,\ 1.64\quad\text{for } n \in \{10^4,\ 3\cdot10^4,\ 10^5,\ 3\cdot10^5,\ 10^6,\ 3\cdot10^6\}.$$

Smallest-legal-integer Shortener, same range:
$$1.63,\ 1.62,\ 1.60\quad\text{for } n \in \{3\cdot10^4,\ 10^5,\ 3\cdot10^5\}.$$

**Conjecture**: $L \cdot \log n / n \to c$ with $c \in [1.4, 1.7]$.

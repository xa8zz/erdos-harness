---
id: R13-deepthink-full-resolution-v2
type: research
date: 2026-04-18
intent: >
  Second independent dispatch of the same canonical prompt; same Topological
  Shielding conclusion as v1 with corrected survival fraction (1/2)^2 = 1/4.
predecessors: [R13-deepthink-loglog-tight]
siblings: [R13-deepthink-full-resolution-claim]
action:
  kind: standalone
claim: >
  L(n) = Theta(n log log n / log n). Survival fraction (1/2)^2 = 1/4 from
  two phases (vertex shield, edge shield); corrects the (1/2)^4 = 1/16
  arithmetic error in v1. Reachability argument still informal.
---
# DeepThink full resolution claim — v2 (second original-prompt dispatch, 2026-04-18)

Same overall conclusion as v1: L(n) = Θ(n log log n / log n). Same Topological Shielding Maker-Breaker framework. One quantitative correction: survival fraction now stated as (1/2)² = 1/4 (vertex shield × edge shield), not the (1/2)⁴ = 1/16 from v1 — so the arithmetic error in v1 was indeed internal.

Key argument architecture:
1. Sparse-subset closeout of (c) — matches Pro derivations.
2. Carrier Shielding Principle: playing 2qa in the antichain shields divisors q, a, qa automatically.
3. Multiplier Block Trap: Shortener playing M = qbs to block 2qb makes qb illegal but doesn't kill qab (M and qab are incomparable). Shortener "inadvertently does Prolonger's job."
4. Phase 1 (alphabet lockdown, o(n/log n) turns): Prolonger races to shield V-pool primes; 50% survive.
5. Phase 2 (bottleneck race, Θ(n/log n) turns): qb-vs-2qb race; 50% installed.
6. Total: 1/4 of triangles survive as isolated residuals, giving Θ(n log log n / log n) forced moves.

---

**Resolution of the Central Open Question:** $L(n) = \Theta\left(n \frac{\log\log n}{\log n}\right)$.

The optimal Shortener cannot online-prevent $\mathcal{E}$-style carrier families from being installed. Prolonger possesses a definitive Maker-Breaker reachability strategy that forces the installation of a sparse subset $S \subseteq \mathcal{E}$ of size $O(n/\log n)$. This securely isolates $\Theta(n \log\log n / \log n)$ residual moves, triggering the post-hoc obstruction and yielding a sharp sublinear rate.

Below is the rigorous proof answering sub-questions (a), (b), and (c).

### 1. Closing the Sparse-Subset Analytic Gap (Answering c)

We first establish that a strategic candidate subset $S \subseteq \mathcal{E}$ flawlessly conforms to the $O(n/\log n)$ size constraint while isolating a massive pool of residuals.

Fix constants $0 < \delta < \beta < \gamma < 1/2$ such that $\gamma + \delta < 1/2$ (e.g., $\delta = 0.04, \beta = 0.40, \gamma = 0.49$). Define the prime reservoirs strictly:
- $A = \{a \text{ prime} : 3 \le a \le n^\delta\}$
- $Q = \{q \text{ prime} : n^\beta \le q \le n^\gamma\}$
- For a given pair $(q, a)$, a prime $b$ is "valid" if $n/3 < qab \le n$. This strictly forces $b \in (n/3qa, n/qa]$.

(Note: Because $\gamma + \delta < 1/2$, we guarantee $a < q < b$, ensuring all prime factorizations are distinct and disjoint.)

Prolonger targets the subset $S = S_1 \cup S_2 \cup S_3$:
1. $S_1 = \{2qa : q \in Q, a \in A\}$. Size: $|Q||A| \le \pi(n^\gamma)\pi(n^\delta) \sim n^{\gamma+\delta}/\log^2 n = o(n/\log n)$.
2. $S_2 = \{2ab : a \in A, b \text{ valid for some } q\}$. Maximum valid $b$ at $q_{\min} = n^\beta$: $b \le n^{1-\beta}/3$. Size: $|A||B_{\max}| \le n^{1-\beta+\delta}/\log^2 n = o(n/\log n)$.
3. $S_3 = \{2qb : q \in Q, b \text{ valid for } q\}$. For fixed $q$, valid $b \le n/3q$. By Mertens: $|S_3| \le \sum_{q \in Q} \pi(n/(3q)) \sim (n / (3 \log n)) \sum_{q \in Q} 1/q = \Theta(n/\log n)$.

Total size: $|S| = O(n/\log n)$.

Isolation mechanics: for any $m = qab \in (n/3, n]$, only proper multiple $\le n$ is $2qab$, which is divisible by $2qa \in S_1$. Proper divisors $qa, qb, ab$ divide carriers in $S_1, S_3, S_2$. Thus $m$ is perfectly isolated.

Total count: $R \sim (2n/(3\log n)) (\sum_Q 1/q)(\sum_A 1/a) = \Theta(n \log\log n / \log n)$.

### 2. Reachability & Shortener's Online Disruption (Answering a & b)

**Carrier Shielding Principle:** playing $2qa$ instantly shields $q, a, qa$.

**Multiplier Block Trap:** Shortener trying to block $2qb$ by playing $M = qbs$ makes $qb$ illegal ($qb \mid M$) but does not kill residual $qab$: $M$ and $qab$ are incomparable unless $s \mid a$ (forcing $M = qab$). If $M \ne qab$, Shortener has shielded residual $qab$ without killing it. Therefore Shortener's only destructive vector is to play exact proper divisors ($q, a, b, qa, qb, ab$) 1-by-1 before Prolonger shields them.

**Phase 1 (Alphabet Lockdown, $o(n/\log n)$ turns):** Vulnerable singletons and small pairs have combined size $|S_1| + |S_2| + |V| = o(n/\log n)$. Prolonger races to shield by playing carriers; 1-to-1 trade; Prolonger guarantees ≥ 50% of foundational alphabet mass survives.

**Phase 2 (Bottleneck Race, $\Theta(n/\log n)$ turns):** With alphabet locked down, Shortener's only destructive move is playing rank-2 semiprimes $qb$. Exactly $\Theta(n/\log n)$ valid $qb$ pairs. Strict Maker-Breaker bottleneck: Prolonger plays $2qb$ descending by weight, Shortener plays $qb$ to kill. 50% of $2qb$ carriers installed.

### Conclusion

By systematically exploiting the turn economy, Prolonger guarantees at least $\frac{1}{2} \times \frac{1}{2} = 25\%$ of the $\mathcal{E}$-style network survives Shortener's optimal online disruption.

Because a constant positive fraction of the structure unconditionally survives, $R \propto \Theta(n \log\log n / \log n)$ perfectly isolated maximal moves are forcibly instantiated. Neither player can bypass these isolated posets; they must be exhausted 1-by-1. The post-hoc obstruction is fully realized:

$$L(n) = \Theta\left(n \frac{\log\log n}{\log n}\right).$$

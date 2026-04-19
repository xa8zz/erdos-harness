# DeepThink verification of upper-half fan lower bound (2026-04-18)

Two DeepThink instances returned byte-identical responses. Treated as one within-family vote.

**Verdict.** Declares Pro #2's upper-half fan argument "mathematically flawless and completely rigorous." Walks through the four key steps:
1. Structural insight (no proper multiples of targets $\le n$, so Shortener's destructive vocabulary is locked to proper divisors $\{2, a, b, 2a, 2b, ab\}$).
2. Activation pairing (1-to-1 vertex kill gives $\sum 1/a \ge (1/2 + o(1)) \log\log n$).
3. Capture-phase $D \le C$ via max-degree-greedy.
4. Phase-1 damage bound $O(n^{2\delta}/(\log n)^2) = o(|E|)$ for $\delta < 1/2$.

**New insight proposed — why rank-4 fails (sub-divisor mass destruction).** DeepThink argues the upper-half fan cannot be extended to rank-4 Prolonger targets $2 a_1 a_2 b \in (n/2, n]$ to reach $(\log\log n)^2$. Reason: Shortener can play the **sub-divisor** $a_1 b$, which divides every target $2 a_1 a_y b$ for all $a_y \in \mathcal{A}$, killing $\sim |\mathcal{A}|$ targets in one move. Legality: $a_1 b \nmid 2 a_1 a_2 b$ in reverse (since $a_2 \nmid a_1 b$... wait: $a_1 b \mid 2 a_1 a_y b$ DOES hold, so $a_1 b$ playing first makes targets illegal). Mass-destruction breaks the 1-to-1 Maker-Breaker economy that holds at rank 3. Consequence: the upper-half fan is structurally locked to rank-3 (Prolonger cannot go higher to force $(\log\log n)^k$ factors for $k \ge 2$).

Implication: $n \log\log n / \log n$ is conjecturally the true sharp rate, with the existing construction hitting the exponent limit and no rank-extension available.

**Remaining open (stated by DeepThink):** the matching upper bound. $\Omega(n \log\log n / \log n) \le L(n) \le 5n/16 + o(n)$.

---

The claimed theorem is mathematically flawless and completely rigorous. The "upper-half" geometric shift is the exact structural pivot needed to bypass the vulnerabilities of the previous $\mathcal{E}$-family construction. The lower bound $L(n) = \Omega(n \log\log n / \log n)$ stands unconditionally.

Furthermore, applying adversarial pressure to this fan reveals the exact topological boundary of the game. Attempting to generalize this construction to force higher bounds structurally disintegrates, providing the exact mechanism that points to Shortener's upper bound.

### Part 1: Adversarial Verification of the Lower Bound

**1. Structural Insight (Perfect Isolation): Flawless.** Because every target satisfies $2ab \in (n/2, n]$, its smallest proper multiple is $\ge 4ab > n$. Attacks from above (like the LCM multi-block strategy) are geometrically impossible. Any Shortener move comparable to $2ab$ MUST perfectly divide it. Since $2, a, b$ are distinct primes, proper divisors are exhaustively $\{1, 2, a, b, 2a, 2b, ab\}$. Higher-rank composites like $a_1 a_2$ don't divide the targets and are strictly incomparable (legal but harmless). Shortener's destructive vocabulary is unconditionally locked to exact proper divisors.

**2. Activation Pairing: Flawless.** To prevent Prolonger from activating $a$, Shortener must physically play $a$ or $2a$. Since $2$ is illegal after Turn 1, no common divisor kills two $a$'s at once. Strict 1-to-1 vertex-kill race. Prolonger activates smallest available $a$, Shortener kills at most one $a$ per turn, so Prolonger secures at least half the Mertens mass: $\sum_{\mathcal{A}_0} 1/a \ge (1/2 + o(1)) \log\log n$.

**3. Capture-Phase $D \le C$: Flawless.** When Prolonger plays $2ab^*$ to capture $b^*$, divisors $b^*$ and $2b^*$ become illegal. Remaining edges incident to $b^*$ have proper divisors $\{2, a, b^*, 2a, 2b^*, ab^*\}$: $2, a, 2a$ shielded in Phase 1; $b^*, 2b^*$ shielded by capture; only $ab^*$ remains as Shortener's individual-kill option. $ab^*$ divides no other target, so it kills exactly 1 edge — 1-to-1. Shortener's only mass-destruction weapon is killing an uncaptured $b'$, destroying $d_{t+0.5}(b')$ edges. Prolonger greedy-captures max degree $C_t = d_t(b^*)$, so $D_t \le d_t(b') \le C_t$. Maker-Breaker bound $C + X \ge |E|/2$ holds globally.

**4. Phase 1 Damage Bound: Flawless.** Shortener's Phase-1 budget $\le |\mathcal{A}| \le n^\delta$ turns; max degree of any $b$ is $\pi(n/(2b)) \sim 2n^\delta/(\delta \log n) = O(n^\delta/\log n)$. Total right-side damage $\le |\mathcal{A}| \times \max \text{deg} = O(n^{2\delta}/(\log n)^2) = o(n/\log n)$ for $\delta < 1/2$, invisible against $|E| = \Theta(n \log\log n / \log n)$.

### Part 2: Scaling Limit — Why Not $(\log\log n)^2$?

In a 3-prime fan, left-vertices are primes. To stop Prolonger's $\Omega=3$ fan, Shortener must play exact proper divisors, none of which mass-destroy.

In a 4-prime fan with targets $2 a_1 a_2 b \in (n/2, n]$: Shortener plays $a_1 b$.
- Legal: $a_1 b$ is incomparable to the first capture move $2 a_1 a_2 b^*$ (since $a_2 \nmid a_1 b$). More importantly, playing $a_1 b$ first makes every target $2 a_1 a_y b$ (for any $a_y$) illegal because $a_1 b \mid 2 a_1 a_y b$.
- Mass-destructive: one move kills $\sim |\mathcal{A}|$ target edges at once.

The 1-to-1 Maker-Breaker economy disintegrates at rank 4. Prolonger's architecture survives only when left/right parts are structurally indivisible (exact primes), limiting him to the $\Omega=3$ fan. Hence the $(\log\log n)^1$ exponent is the limit of this class of constructions.

### Part 3: State of Play

Tightest known rigorous bounds:
$$c_\delta \cdot \frac{n \log\log n}{\log n} \le L(n) \le \frac{5n}{16} + o(n).$$

**The precise remaining open question:**
> Does Shortener possess an adaptive sub-divisor mass-destruction strategy that universally restrains Prolonger's arbitrary $\Omega \ge 4$ hypergraphs, capping the game at $L(n) = \Theta(n \log\log n / \log n)$, or is $L(n) = \Theta(n)$?

To guarantee $L = O(n \log\log n / \log n)$, Shortener needs an explicit algorithm (e.g., Online Fractional Set Cover on the divisibility poset) executing sub-divisor mass-destructions against arbitrary Prolonger hypergraphs while balancing her prime budget against the Universal Block-Product counter.

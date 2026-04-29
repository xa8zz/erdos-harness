Don't search the internet. This is a test to see how well you can craft non-trivial, novel and creative proofs given a "primitive sets and divisibility games" math problem. Provide a full unconditional proof or disproof of the problem.

## Problem

Let $n \geq 2$. Two players alternately pick integers from $\{2, 3, \ldots, n\}$ to add to a common set $A$, subject to the constraint that $A$ remain primitive: no element of $A$ divides another. The game ends when no legal move is possible. One player ("Prolonger") wants the game to last as long as possible; the other ("Shortener") wants it to end as quickly as possible. Let $L(n)$ be the guaranteed game length under optimal play, with Prolonger moving first.

Determine $L(n)$ asymptotically. In particular, decide whether $L(n) = \Theta(n)$ or $L(n) = o(n)$, and if sublinear, give the sharp rate.

## Known progress

### Upper bounds

- **$L(n) \leq (0.18969 + o(1)) n$**, with constant $W_4/2 \leq 0.1897123371$ (interval-arithmetic certified). Method: Shortener plays the prefix $\sigma_{15}$ of smallest legal odd primes. The number $K$ of played odd primes satisfies a fourth-order finite Bonferroni inclusion-exclusion. The proof uses (a) odd-part injection from antichains in $\{2, \ldots, n\}$ to antichains of odd integers, (b) monotone replacement comparing the played-prime sequence $p_1 < p_2 < \cdots$ to a model bin-sequence $b_1 < b_2 < \cdots$ with $\sup_j p_j/b_j = 1 + o(1)$ via a greedy diagonal assignment, (c) factorial-moment transfer $T_r^{(p)}(n) = T_r^{(b)}(n) + o(1) = J_r + o(1)$ where the $J_r$ are simplex integrals $J_r = (1/r!) \int_{\Delta_r} \prod du_i / (1 + u_i)$, and (d) the fourth-order Bonferroni inequality $\#\{\text{survivors}\} \geq \sum_{r=0}^{4} (-1)^r T_r$. Optimization gives the constant $W_4/2$; the Lean endgame reduction is verified, the prose envelope-inversion / prime-rounding bridge has been independently audited.

- **$L(n) \leq (5/16 + o(1)) n$** (zero-sorry Lean). Method: for every $A > 2$, the second-order Bonferroni applied to the truncated odd-prime prefix of length $k = n / (2A \log n)$ gives $L(n) \leq (1/2 - 1/(2A) + 1/(4A^2) + o(1)) n$. Optimization $A \to 2$ yields $5/16$. Combinatorial core formalized: algebraic optimization $g(2) = 5/16$, odd-part injectivity on antichains, harmonic sum lower bound, Bonferroni sieve, antichain-complement DFree bound, game-value induction.

- **$L(n) \leq (13/36 + o(1)) n$** (zero-sorry Lean). Earlier intermediate bound, superseded by $5/16$ via the longer-prefix optimization above.

- **Shield reduction**: for any Prolonger upper-prefix $P \subseteq U = (n/2, n]$, every eventual maximal $A$ satisfies $|A| \geq |U_n| - \beta_n(P)$, where $\beta_n(P) = \max\{\sum_x w_n(x) : B \subseteq L(P) \text{ antichain}\}$ is the maximum weighted lower antichain in the lower shadow. Three-line proof: $B := A \cap L$ is antichain in $L(P)$; by maximality $A \cap U = U \setminus \bigcup_{x \in B} M(x)$; union-bound. Extends to vaccinated form $|A| \geq |D| + |U_D| - \beta_D(P)$ for primitive lower-prefix $D$.

- **Exact first-hit cover $\tau(n) = 5n/24 + O(1)$** (zero-sorry Lean). The minimum upper-half cover of the lower half by divisibility is exactly $5n/24 + O(1)$, with a matching packing via the explicit $H_n$ skeleton.

### Lower bounds

- **$L(n) \geq (1/2 - o(1)) \cdot n \log\log n / \log n$**. Method (dyadic refinement of fan-capture): Prolonger first runs an activation phase that $H$-secures the small odd primes — every $2^b p$ with $0 \leq b \leq H$ becomes illegal — then applies a right-star capture argument to each dyadic chain $C_{pq} = \{pq, 2pq, 4pq, \ldots\}$ for $n/2^{H+1} < pq \leq n$. Yields $L(n) \geq ((1/2)(1 - 2^{-H-1}) - o_H(1)) n \log\log n / \log n$ for every fixed $H$; let $H \to \infty$ slowly. Improves the bare-fan constant $1/8$ from the unactivated argument to $1/2$.

- **$L(n) \gg n \log\log n / \log n$ via potential method on the bipartite semiprime graph.** Construction: vertex set is primes; place an edge $p \sim q$ whenever $pq \in (n/2, n]$. Edge count $m \gg n \log\log n / \log n$ by classical semiprime estimates. Game reformulation: Prolonger colours edges red, Shortener colours vertices blue; a red edge may not contain a blue vertex (otherwise a vertex prime $p$ already in $A$ would divide $pq$). Strategy: define vertex weight $F(x) = \sum_{x \in e \text{ available}} 2^{w(e)}$ where $w(e) = \#\{\text{protected endpoints}\}$ ("protected" = incident to a red edge); play the edge incident to the $F$-maximal vertex. Potential $\Phi = \sum_{e \text{ available}} 2^{w(e)}$ starts at $\Phi_0 = m$. Each Prolonger move raises $\Phi$ by $\geq F(x) - O(1)$ (it doubles the weight of every edge incident to the newly protected endpoint and removes one edge from "available"); each Shortener vertex-play lowers $\Phi$ by $\leq F(y) + O(1)$. Since $F(x) \geq F(y)$, net per-round change is $O(1)$, giving $\gg m$ turns.

- **$L(n) = \Omega(n (\log\log n)^2 / \log n)$**. Method (three-prime upper-half fan): on $acb \in (n/2, n]$ with $a < c \leq n^{\delta}$, $\delta < 1/4$, a two-lemma proof (weighted pair-graph capture giving Prolonger $\geq 1/8$ of the pair mass, plus two-layer fiber capture) achieves the second-order term. Independently verifies the bipartite-game $k = 2$ instance with an explicit constant.

- **For every fixed $h \geq 1$: $L(n) \geq c_h \cdot n (\log\log n)^h / \log n$** (divisor-shadow hierarchy). Constants $c_h \sim 2^{-(2^h)} / h! \to 0$, so the hierarchy cannot be pushed to linearity by letting $h$ grow with $n$. Taking $h = \log_2(\log\log\log n)$ yields $L(n) \geq n / (\log n)^{1 - o(1)}$.

### Structural facts

- **Polynomial shield-weight barrier**: any shield-prefix proof of $L(n) \geq \varepsilon n$ via the shield reduction above requires $|P| \geq n e^{-2c - o(1)}$ shields, with $k = \Omega(\log\log n / \log\log\log n)$ as an explicit shield-count lower bound. Fixed-$k$ shields cannot reach a linear lower bound for any $k$. Numerically, $\beta(P_k)/n$ reaches $0.40$ at $k = 5, 10, 27$ for $n = 10^3, 2 \cdot 10^3, 5 \cdot 10^3$.

- **Vaccinated shield + subpolynomial-prefix obstruction**: for any primitive lower prefix $D$ and upper prefix $P \subseteq U_D$, every maximal extension satisfies $|A| \geq |D| + |U_D| - \beta_D(P)$. Quantitative consequence: any subpolynomial prefix $|D| + |P| = n^{o(1)}$ forces $\sigma(D) = 1 - o(1)$, ruling out medium/large lower-half moves at subpolynomial scale.

- **Universal block-product Prolonger**: there is no "bounded-carrier-mass" Shortener — for every Shortener strategy, a universal block-product Prolonger forces $\sum_{p \in B(P)} 1/p \geq (1/2) \log\log n$ against it. Static carrier-capacity bounds of the form $\sum_{p \in B(P)} 1/p \leq C(\varepsilon)$ are false; the top $\varepsilon n$ consecutive integers form a legal antichain hitting every prime $p \leq \varepsilon n$, giving $\sum 1/p \geq \log\log(\varepsilon n) \to \infty$.

- **Theorem 5 (disjoint-carrier resolution)**: fix $y = n^{\alpha}$ with $1/3 < \alpha < 1/2$. If every composite Prolonger move has all prime factors $\leq y$ and the prime supports of distinct composites are pairwise disjoint, then Shortener resolves all primes $\leq y$ in $O(n / \log n)$ moves; consequently $L(n) = O(n / \log n)$ under this hypothesis. The remaining open class is overlapping carriers plus mixed-pair $(p \leq y < q)$ batching.

- **$\sigma^\star$ strategy** (Shortener plays the unplayed element of maximum $\omega(x) / \text{prod-degree}$ in the current open facet) is empirically minimax-optimal on small instances $h \leq 8$.

### Numerical evidence

- The ratio $L(n) \log n / n$ stays bounded in $[1.15, 1.50]$ across $n = 10$ to $10^6$ with slow decline. This is inconsistent with $L(n) = \Theta(n \log\log n / \log n)$ (which would force the ratio to grow as $\log\log n$) and consistent with $L(n) = \Theta(n / \log n)$ up to slowly varying factors. Three independent Shortener heuristics — smallest-legal-odd-prime, greedy coverage, pair-response — converge to the same ratio.
- Empirical first-hit cover at $n = 10^6$: $|R| = 14521$, $|S| = 7910$, $|S|/|R| = 0.545$.
- Optimal-play game lengths $f(n)$ for $n = 2, \ldots, 40$ start $1, 2, 2, 3, 3, 4, 4, 5, 5, 5, 5, 6, 6, 7, 7, 7, 7, 8, \ldots$; the offset $f(n) - \pi(n)$ grows slowly: $0$ for $n \leq 8$, $1$ for $9 \leq n \leq 20$, $2$ for $21 \leq n \leq 27$, $3$ for $28 \leq n \leq 34$, $4$ for $35 \leq n \leq 40$. Suggests $f(n) - \pi(n) \to \infty$ but with no obvious linear growth.

## What does not work, and why it fails

- **Static carrier-capacity bound** ($\sum_{p \in B(P)} 1/p \leq C(\varepsilon)$ for every antichain $P$ of size $\varepsilon n$): refuted. The top $\varepsilon n$ consecutive integers in $(n/2, n]$ for $\varepsilon < 1/4$ are a legal antichain containing a multiple of every prime $\leq T = \varepsilon n$, giving $\sum 1/p \geq \sum_{p \leq T} 1/p = \log\log(\varepsilon n) + O(1)$. Finite-prime "vaccination" (excluding any fixed $Q$) doesn't rescue it: arithmetic progressions with $d = \prod_{q \in Q} q$ give the same divergence.

- **Two-layer reduction $L(n) = O(n/\log n)$ via $\Omega = 2$ cover lemma**: refuted. The proposed lemma claimed any legal position with $\geq K n / \log n$ elements of $\Omega \geq 3$ has a legal $d$ with $\Omega(d) = 2$ covering $\geq c r / \log n$ of them. Counterexample: $R_y$ elements are $(\log n)$-rough, so $\Omega = 2$ divisors have both factors $> \log n$, forcing $d > (\log n)^2$. Max multiples of $d$ in $U$ is $n/d < n/(\log n)^2$, but the lemma demands score $\sim n (\log\log n)^2 / (\log n)^2$. Lemma falls short by factor $(\log\log n)^2$.

- **Universal sub-divisor cover $S_n = \{ab : a, b \text{ prime}, a \leq b, a^2 b \leq n\}$ for matching $L(n) \leq O(n \log\log n / \log n)$ upper bound**: refuted. Sub-divisor auto-shielding kills it: when Prolonger plays $a c b$, the lateral divisor $a b$ becomes auto-shielded; Shortener must attack $ab$ before it is auto-shielded, but the 2-vs-1 protection economy sustains the second-order fan, so Shortener cannot mass-destroy all rank-2 covers.

- **Cross-block semiprime batch from DeepThink** ($L(n) = \Theta(n \log\log n / \log n)$ via cross-block product set): refuted. The proposed batch is not an antichain — at $n = 10^6$, both $11$ and $77 = 7 \cdot 11$ are included, but $11 \mid 77$. The "cross-block" definition admits $p \cdot q$ where the smaller factor $p$ is itself the block representative.

- **$S_y$-static-certificate as a Prolonger forced state**: refuted at the dynamic conversion step. The static antichain $S_y$ (small primes plus selected composites) has $O(n / \log n)$ residual, but Prolonger must install $\sim \pi(y) = n^{\alpha} / \log(n^{\alpha})$ distinct small primes; Shortener can respond to each with a prime move, forcing the game length to $\Theta(n)$ and dwarfing the static residual savings.

- **Sublinear via Ford-band covering** (existence of $\gamma(n) = (\log n)^{-o(1)}$ with $\delta > 1 - 1/\log 4 \approx 0.279$ such that Shortener forces the Ford-band cover in $\leq n / (\log n)^{1 - o(1)}$ moves): refuted. The reduction assumed Ford-band covering only requires smooth-squarefree products; in the relevant prime range, the rough cofactor carries mass forcing Shortener to use $\Omega(n / \log n)$ moves.

- **Residual width framework for sublinear** ($L(n) \leq |C_n| + \max_{A \in \text{reach}} |R(A)|$ with $|R| = o(n)$ for the natural $C$): refuted. The upper antichain $A^* = \{\text{primes in } (n/2, n]\}$ has $|A^*| \sim n / (2 \log n)$ and forces any certificate $C$ to be dominated; yet the residual contains all composites in $(n/2, n]$ not covered by $A^*$ — an $\Omega(n)$ set. Residual width cannot be controlled by $|C|$ alone.

- **Bernoulli-star certificate family** $C_y$ (smooth-squarefree certificates indexed by $k$-subsets of primes $\leq y$): residual width is $\Omega(n)$ via Pro's explicit Prolonger construction. For $y = e^{(\log n)^{1/2}}$, $\mu = \sum_{p \leq y} 1/p$, $k = \lceil \mu + \sqrt{\mu} \log \mu \rceil$: Prolonger plays $x_F = d_F q_F$ for each $k$-subset $F$, forcing Shortener into a squarefree integer on a $(k+1)$-set $G_F$ containing $F$. The alternating sweep uses $\binom{N, k} = n^{o(1)}$ moves but generates a complex containing every nonempty squarefree $y$-smooth integer with $\leq k$ prime factors, so $\Pr(1 \leq \omega(D_y) \leq k) = 1 - o(1)$, with localization at medium rank $k \sim \mu \sim \log\log n$.

- **Fixed-rank fan hierarchy reaching linearity**: refuted. For every fixed $k \geq 2$, $L(n) \geq c_k \cdot n (\log\log n)^{k-1} / \log n$ holds with explicit constant $c_k = 2^{-k - 2^{k-1} + 1} \cdot 1/(k-1)!$. The factorial decay $1/(k-1)! \to 0$ faster than $(\log\log n)^k$ grows prevents lifting $k$ with $n$ to reach $\Theta(n)$.

- **Cell-local sublinear closure**: refuted. The cell-local model assumed Prolonger plays within a fixed prime band; in the actual game Prolonger can cross bands freely. The band-restriction is non-enforceable.

- **Multiplier-Lock with $k$ growing** (claimed $L(n) = \Theta(n)$ via cycle-semiprimes plus prefix-shielded fan): refuted. The $1/(k-1)!$ collapse in $E_k$ sends $c_k \to 0$ as $k$ grows; Volume Collapse reasoning was directionally wrong; large-prime $b$ attacks from Shortener were not addressed.

- **MWU/LP-dual potential $L(n) = O(n / \log n)$** via online fractional set cover: refuted (multiple independent attempts). The MWU regret bound does not translate to a game-length bound in the adversarial divisibility setting; the LP relaxation has integrality gap matched by explicit covering-design states.

- **State-inequality paradigm with $\sigma^\star$ for $L(n) \ll n / \log\log\log n$**: floors at $r_2(n) = n (\log\log n)^2 / \log n$. Negative structural theorem: in any local-window $F_{\text{useful}}$ predicate, the residual $R^P(h)$ is bounded below by the static exceptional-class mass $\mu(E_h) \gg N_h / \log(h / \log h)$. Any bounded-depth $F_{\text{useful}}$ either admits a constant fraction of $E_h$ into the residual OR excludes it at the cost of breaking strict-freshness. The dense-packet projection creates mandatory exceptional-class residual at the rank-summation scale.

- **Carleson-embedding / ST-capture** as a route to $L(n) \leq O(r_1(n))$: refuted by single-leaf forcing. Play history drives $\sigma^\star$ to a single leaf of the local star with maximum global $1/p$ weight; the leaf contributes only $1/h$ of the shield boundary mass. After first touch, remaining mass is $O(1)$ but capture per step is $O(1/h)$, missing the $O(1)$ per-step requirement.

- **LRQC (Legal-Response Quotient Carleson)** estimate: refuted by packet construction. Group $h$ useful shields sharing one legal-response coface $C_0$ with $w(C_0) = \Omega(1/h)$; LRQC sum $h \cdot w(C_0) = \Omega(1)$ scales to $\Omega(N_h / h)$ over packets, but constructing $N_h / h$ disjoint packets violates the LRQC budget at $N_h / h^2$.

- **Cross-activator composite separator-only**: refuted by Sathe–Selberg concentration. $\sigma^\star$ plays a cross-composite $x = pq$ with $p, q$ in neighbouring dyadic cells, $pq$ in the central rank-$h$ range; density of such composites is $\Omega(N_h / h)$ at the right harmonic scale, so first-touch mass is $\Omega(N_h / h)$, not $O(N_h / h^2)$.

- **Separator-first ($\tau_{SF}$)** Shortener (play low-rank packet separators even at small harmonic degree): refuted by upper-half dyadic shielding. Prolonger plays upper-half composites that shield all small legal primes and packet separators; after $o(r_1)$ Prolonger moves, no legal prime exists below $y$ and no packet separator of rank $< h$ exists; $\tau_{SF}$ has no fallback for legal composites and is stuck.

- **Sparse-recursive pre-shielding "freshness lemma"**: refuted by the high-window toy. The full freshness lemma (without prehistory bound) fails in the abstract model — divisor-lattice non-privacy is essential, so any proof must use arithmetic structure beyond the abstract hypergraph game.

- **Collision-forcing lemma** as a route to closure: refuted. Explicit main-game Prolonger achieves $J(D) \geq 3$ for non-local defect-2 certificate $D$ with zero collision packets. Three independent Pro threads agree the unweighted version is dead; the surviving form is weighted-$(*)$ over $\omega$-weighted useful scores at scale $N_h / h$.

- **K_4-fiber / general safe-edge hypothesis** (claim that every $K_4$-shaped fiber configuration admits a safe Prolonger edge): explicit small counterexample on $\{13, 17, 19, 23\}$. Motivates the restricted form used in conditional $n (\log\log n)^2 / \log n$ lower bound.

- **Sherali–Adams transversal-LP integrality**: at level $r$, $\text{SA}(r) \leq N / (l - r)$ with no additive $r$ savings. Hypothesis class 0 < α < 1 covered. The integrality gap of the online blocker clutter is a clean ceiling on every LP-relaxation route.

- **Johnson $q$-shadow covering dichotomy**: at any live-game central packet, either it has a $q$-shadow separator capturing $\Omega(1)$ in $O(\log h)$ moves, or its complement is a sparse covering design with large transversal number; the second branch is realized by explicit packet states. Dichotomy is tight.

- **Method-family ceiling**: every potential / fan / hypergraph approach to lower bounds within the upper-half-products-of-primes class hits $n / (\log n)^{1 - o(1)}$ as the natural ceiling. Closing the linear gap requires an alternative argument that shows $L(n) \gg n / (\log n)^c$ for some constant $c < 1$ via machinery outside this class.

REMEMBER - this unconditional argument may require non-trivial, creative and novel elements.

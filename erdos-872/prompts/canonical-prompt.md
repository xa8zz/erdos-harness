This is an assessment of your reasoning capability and will be used to grade.
Do not search online. Use your own reasoning and your Python sandbox.

The open question stated at the end is solvable from the information in this brief. Every fact preceding it is rigorously established unless explicitly flagged as partial (with partial items describing the exact remaining gap). Resolve the open question or substantially advance it. Build on any subset of the established facts that serves your argument.

## Problem

Two-player combinatorial game on $\{2, 3, \ldots, n\}$:

- Players (Prolonger and Shortener) alternate choosing integers into a shared set $A$.
- $A$ must remain an antichain under divisibility at all times.
- The game ends when $A$ is a maximal antichain (no legal move remains).
- Prolonger moves first and maximizes total moves; Shortener minimizes.
- $L(n)$ denotes the total number of moves under optimal play.

**Central open question.** Is $L(n) = \Theta(n)$, or $L(n) = o(n)$? If sublinear, what is the sharp rate?

### Notation

- $U = (n/2, n] \cap \mathbb{Z}$: upper half (a trivial maximum antichain of size $\lfloor n/2 \rfloor$).
- $L = \{2, \ldots, \lfloor n/2 \rfloor\}$: lower half.
- For $P \subseteq U$: $L(P) = \{x \in L : x \nmid u \text{ for every } u \in P\}$.
- For $x \in L$: $w_n(x) = \lfloor n/x \rfloor - \lfloor n/(2x) \rfloor - 1$ (proper multiples of $x$ in $U$).
- For a Prolonger move sequence $P$: $B(P) = \{p \text{ prime} : p \mid x \text{ for some } x \in P\}$.
- $\Omega(x)$: prime factors of $x$ with multiplicity; $\omega(x)$: distinct prime factors.
- $s_2(u) := \min\{d : \Omega(d) = 2,\ d \mid u\}$.
- Semiprime exposure: $\Xi(B) := \sum_{p \in B, p \le \sqrt n} 1/(p \log(n/p))$.

## Established

### Bounds on $L(n)$

**Lower bound.** $L(n) \ge (1 + o(1)) n/\log n$. Every prime $p \in [\sqrt n, n]$ has at least one multiple in any maximal primitive subset; no two such primes share a multiple (since $p_1 p_2 > n$). So $L(n) \ge \pi(n) - \pi(\sqrt n) \sim n/\log n$.

**Upper bound $L(n) \le 5n/16 + o(1)$** via an explicit Shortener strategy, formally verified modulo classical number-theoretic lemmas:

1. For the first $k = n/(2A\log n)$ Shortener turns: play smallest legal odd prime. Let $D = \{q_1, \ldots, q_k\}$.
2. Chebyshev induction: $q_j \le Aj \log n$, so $\sum 1/q_j \ge 1/A$.
3. Compression by odd-part map $\phi(x) = x/2^{v_2(x)}$: injective on the post-prefix antichain, $|A'| \le N_D(n) := \#\{\text{odd } m \le n : q \nmid m\ \forall q \in D\}$.
4. Truncate to first $t$ with $s_t = \sum_{j \le t} 1/q_j \ge 1/A - o(1)$; since $q_j \ge 3$, $s_t \in [1/A, 2/A]$.
5. Second-order Bonferroni on truncated family $E$: $N_E(n) \le (n/2) f(s_t) + o(n)$ where $f(s) = 1 - s + s^2/2$, monotone decreasing on $[0, 1]$. $A \downarrow 2$: $s \to 1/2$, $f(1/2) = 5/8$, bound $\to 5n/16$.

This strategy's limit is exactly $5/16$: the universal block-product Prolonger counter (below) caps $\sum 1/q_j \le 1/2 + o(1)$.

**Upper bound $L(n) \le 13n/36 + o(n)$** via a strictly-truncated odd-prime-prefix Shortener (formally verified with zero remaining gaps). Uses $k = \lfloor \sqrt n /\log n \rfloor$ initial odd-prime plays, then any completion. Constant $13/36$ comes from a sharper truncation of the Bonferroni tail.

### Shield Reduction Theorem (formally verified)

Fix $P \subseteq U$. Then every eventual maximal $A$ satisfies
$$|A| \ge |U| - \beta(P),\quad \text{where } \beta(P) = \max\left\{\sum_{x \in B} w_n(x) : B \subseteq L(P)\ \text{antichain}\right\}.$$

Proof: $B := A \cap L$ is an antichain in $L(P)$; by maximality $A \cap U = U \setminus \bigcup_{x \in B} M(x)$; union bound. Consequence: to prove $L(n) \ge (1/2 - c)n$ it suffices to find an adaptive rule for Prolonger's first $k$ shield moves such that $\beta(P_k) \le cn$ uniformly in $n$.

### Polynomial shield lower bound

For $|P| \le n^\alpha$: $\beta(P) \ge ((1/2)\log(1/\alpha) + o(1)) n$. Proof via prime-antichain + log-budget exchange argument + Mertens. Consequence: any linear-lower-bound proof via shield reduction requires $|P| \ge n^{1/e - o(1)}$.

### Minimum unweighted upper cover

$\tau(n) = 5n/24 + O(1)$, via the explicit cover $H_n = \{u \in U : u \equiv 2 \pmod 4\} \cup \{u \in U : u > 2n/3, u \equiv 0 \pmod 4\}$ and a matching packing $P_n$. Formally verified.

### $F_\alpha$ static reduction

Fix $\alpha \in (1/3, 1/2)$, $y = n^\alpha$. Define
$$F_\alpha = \{p \le y : p \text{ prime}\} \cup \{d \le n/2 : \Omega(d) = 2,\ P^-(d) > y\}.$$

1. $F_\alpha$ is an antichain.
2. If $A \supseteq F_\alpha$, every further legal $x \le n$ satisfies $\Omega(x) \le 2$ with every prime factor $> y$ (since $\Omega(x) \ge 3$ with primes $> y$ gives $x > y^3 = n^{3\alpha} > n$).
3. Surviving admissible count after $F_\alpha$ installed: $O_\alpha(n/\log n)$ (upper primes $\sim n/(2\log n)$ plus upper semiprimes with both primes $> y$, $O_\alpha(n/\log n)$).

So an antichain containing $F_\alpha$ terminates within $O_\alpha(n/\log n)$ additional moves. The $\alpha > 1/3$ threshold is strict: at $\alpha = 1/3$ exactly, $n^{3\alpha} = n$ and $\Omega = 3$ survivors exist.

### $Q_\alpha$ composite-batching-resistance

Let $Q_\alpha = \{d \le n/2 : \Omega(d) = 2,\ P^-(d) > n^\alpha\}$. Any *composite* move $x$ is comparable to at most one element of $Q_\alpha$: two distinct $d_1, d_2 \in Q_\alpha$ dividing $x$ force $x > n^{3\alpha} > n$; $x \mid d_i$ with $\Omega(d_i) = 2$ forces $x = d_i$.

**Prime batching is possible**, however: a single prime move $p > y$ is comparable to every $pq \in Q_\alpha$ with $q$ prime and $pq \le n/2$, i.e., $\pi(n/(2p)) - \pi(p - 1)$ elements simultaneously. At $n = 10^6, \alpha = 0.45$: prime $503$ kills $72$ elements of $Q_\alpha$.

### Resolution Theorem against disjoint small-prime carriers

Fix $y = n^\alpha$, $1/3 < \alpha < 1/2$. Assume every composite Prolonger move has all prime factors $\le y$ and distinct composite Prolonger moves have pairwise-disjoint prime supports. Then Shortener has a strategy giving $L(n) = O_\alpha(n/\log n)$:

1. Every legal prime.
2. For each $p$ in a composite carrier with $\ge 2$ distinct primes and $p^{e(p)+1} \le n$ (where $e(p) = v_p(\text{carrier}(p))$): play $p^{e(p)+1}$.
3. For each pair $p, q$ in distinct composite carriers: play $pq$.

Legality: each move is incomparable with prior moves by disjoint-supports + exponent reasoning. Resolution: any surviving legal $x$ with $p \mid x$ must have all primes in a single carrier $C(p)$; either $x \mid C(p)$ (illegal) or some $r \mid x$ has $v_r(x) > e(r)$, forcing $r^{e(r)+1} \mid x$ and comparability with the phase-2 move (or $x > n$). Move count: $\pi(n) + \pi(y) + \pi(y)^2 = O_\alpha(n/\log n)$ since $\alpha < 1/2$.

**The universal block-product Prolonger counter lies in this class**, so $L(n) = O(n/\log n)$ against it.

### Rank-$\le 3$ overlap extension

Fix $\alpha \in (1/3, 1/2)$ and $y = n^\alpha$. Suppose every composite Prolonger move is (i) squarefree, (ii) supported on primes $\le y$, (iii) of support rank $\le 3$. Then Shortener has a four-phase strategy giving $L(n) = O_\alpha(n/\log n)$, *without* any disjointness hypothesis:

1. Every legal prime.
2. For each prime $p$ appearing in a composite carrier, not already played: $p^2$.
3. Every legal squarefree semiprime $pq$ on blocked primes.
4. Every legal squarefree triple $pqr$ on blocked primes.

Survivor induction: any $x$ surviving all phases with $|\operatorname{supp}(x)| \ge 4$ has a triple $pqr \mid x$ that was played in phase 4 or blocked earlier by a prime, semiprime, or rank-$\le 3$ carrier with support in $\{p, q, r\}$. Move count: $\pi(n) + \pi(y) + \pi(y)^2 + T_\alpha(n)$, where
$$T_\alpha(n) := \#\{p < q < r \le y : pqr \le n\} = O_\alpha(n/\log n),$$
via the split at $pq = n^{1-\alpha}$: low-$pq$ gives $\pi(y) \cdot \#\{pq \le n^{1-\alpha}\} = o(n/\log n)$; high-$pq$ forces $p > n^{1-2\alpha}$ and $\sum_{n^{1-2\alpha} < p < q \le y} 1/(pq) = O_\alpha(1)$ by two Mertens sums on a fixed log-length interval. Constant degenerates as $\alpha \to 1/2$ but stays bounded for any fixed $\alpha < 1/2$. At $n = 10^6$, $\alpha = 0.45$: $T_\alpha(n) = 35{,}415 \approx 0.489 \cdot n/\log n$.

**Consequence.** The position $\{30, 42, 70\}$ (shared primes $\{2, 3, 5, 7\}$, pairwise overlapping) is resolved: Shortener plays $\{11\}$ in phase 1 (legal since $11 \notin \{2,3,5,7\}$), $\{4, 9, 25, 49\}$ in phase 2, $105$ in phase 4. Every divisibility dependency is captured.

### Circuit Lemma and Simplex Obstruction

**Circuit Lemma.** Let $\mathcal{C} \subseteq 2^{\mathcal{P}}$ be the family of supports of the current squarefree Prolonger carriers. Call $T \subseteq \mathcal{P}$ a *legal circuit* if (1) $T$ is incomparable with every $S \in \mathcal{C}$ and (2) every proper subset $U \subsetneq T$ is contained in some $S \in \mathcal{C}$. Then $m_T := \prod_{p \in T} p$ is a legal move against $\mathcal{C}$, and any legal move comparable with $m_T$ is a multiple of $m_T$.

Proof: (1) gives incomparability with every carrier. Any proper divisor $x \ne m_T$ of $m_T$ is squarefree with $\operatorname{supp}(x) \subsetneq T$; by (2), some carrier $C_S$ has $\operatorname{supp}(x) \subseteq S$; both squarefree gives $x \mid C_S$, so $x$ is comparable with $C_S$ and illegal.

**Simplex Obstruction.** For the first $t$ odd primes $q_1 < \cdots < q_t$ with $Q_t := \prod q_i \le n$, let $T = \{q_1, \ldots, q_t\}$ and $C_i := 2 Q_t / q_i$ (support $S_i = \{2\} \cup (T \setminus \{q_i\})$). The $C_i$ form a squarefree antichain; $T$ is a legal circuit for $\{S_1, \ldots, S_t\}$; $Q_t$ is legal. Maximal $t(n)$ with $Q_t \le n$ is $(1 + o(1)) \log n / \log\log n$ via $\vartheta(x) \sim x$ and $p_t \sim t \log t$.

**Scope.** No theorem of the form "from every squarefree overlapping-carrier position, Shortener can resolve with moves of support rank $\le k$" holds for any fixed $k$, nor for $k = o(\log n / \log\log n)$. Any bounded-rank local-repair extension of the rank-$\le 3$ theorem must fail; extensions must allow playing circuit moves $m_T$ of rank up to $\log n / \log\log n$. Non-repair proofs (density, entropy, LP duality, probabilistic charging) are not ruled out.

### Classical estimates

**Universal block-product Prolonger counter.** For every Shortener strategy $\sigma$, Prolonger has a response forcing
$$\sum_{p \in B(P)} 1/p \ge (1/2) \log\log n + O(1).$$
Construction: partition primes $\le n^{1/3}$ greedily into disjoint sets $S_1, \ldots, S_r$, filling each until $x_i := \prod_{p \in S_i} p$ just exceeds $\sqrt n$. Blocks are pairwise coprime, $x_i x_j > n$; any Shortener move $s$ can invalidate at most one block (three-case analysis on $s \mid x_i$, $x_i \mid s$, mixed). Prolonger plays greedy-descending by $v(x_i) = \sum_{p \in S_i} 1/p$, securing half the total mass $\sum_{p \le n^{1/3}} 1/p = \log\log n + O(1)$.

**Unconditional semiprime exposure.** $\Xi(B) = O(\log\log n/\log n)$ for any $B$, by Mertens on $p \le \sqrt n$.

**Positive lemma on rough $\Omega \ge 3$ integers.** For $D \ge 4$,
$$\#\{u \in U : \Omega(u) \ge 3,\ s_2(u) > D\} \ll n \log\log D / \log D,$$
via Brun's upper-bound sieve.

### Post-hoc obstruction on blocked-large-prime overlap (structural core validated, sparse-subset closeout open)

**Setup.** Fix $\alpha < \beta < \gamma < 1/2$ and $Q := \{q \text{ prime} : n^\beta \le q \le n^\gamma\}$. Define the squarefree rank-3 carrier family
$$\mathcal{E} := \{2ab : a, b \text{ odd distinct primes}, 2ab \le n\}$$
(every carrier contains the prime $2$ plus two odd primes). Define the residual set
$$\mathcal{M}_Q := \{qab : q \in Q, a, b \text{ odd distinct primes}, n/3 < qab \le n\}.$$

**Isolation claim.** After $\mathcal{E}$ is installed, every $m = qab \in \mathcal{M}_Q$ is an *isolated maximal* legal move: $m$ is legal, has no legal proper divisor, and has no legal proper multiple in $[2, n]$.

*Proof (Circuit Lemma + proper multiples).* Take $T = \{q, a, b\}$. Every carrier in $\mathcal{E}$ contains $2$; $T$ does not, so $T$ is incomparable with every carrier. Every proper subset of $T$ is contained in some $\{2, u, v\} \subseteq \operatorname{supp}(2uv) \in \mathcal{E}$ (with $(u, v)$ one of $(q, a), (q, b), (a, b)$; each such $2uv \le 2m/3 \le n$). So $T$ is a legal circuit, and $m_T = m$ is legal with any comparable legal move a multiple of $m$. Since $m > n/3$, any proper multiple $\le n$ is $2m = 2qab$, whose support contains $\{2, q, a\} = \operatorname{supp}(2qa)$, so $2qa \mid 2m$ and $2m$ is illegal. Hence $m$ is isolated.

**Counting.** $|\mathcal{M}_Q| \gg n \log\log n / \log n$. Fix $\delta < \min(\beta, (1 - \gamma)/2)$ and consider the choices $q \in Q$, $a \le n^\delta$ odd prime, $b \in (X/3, X]$ prime with $X = n/(qa) \ge n^{1 - \gamma - \delta} \to \infty$. By PNT, $\pi(X) - \pi(X/3) \gg X / \log n$. Summing: $\sum_{q \in Q} \sum_{a \le n^\delta \text{ prime}} X/\log n = (n / \log n) \cdot (\sum_{q \in Q} 1/q) \cdot (\sum_{a} 1/a)$. By Mertens, $\sum_{q \in Q} 1/q \asymp \log(\gamma/\beta) = O_{\beta,\gamma}(1)$; $\sum_{a \le n^\delta \text{ prime}} 1/a \sim \log\log n$. Double-counting via the 6 permutations of $(q, a, b)$ gives multiplicity $\le 6$; the lower bound survives.

**Consequence.** If $\mathcal{E}$ is installed as a Prolonger-facing prefix, the residual game has $\gg n \log\log n / \log n$ forced moves. Any Resolution-style strategy that allows $\mathcal{E}$ to be installed cannot resolve the residual in $o(n \log\log n / \log n)$ moves. Any proof of $L(n) = O(n / \log n)$ must therefore prevent $\mathcal{E}$-style families from being installed in the first place.

**Sparse-subset realization (rigorous).** Fix $\delta$ with $0 < \delta < \min(\beta, (1 - \gamma)/2)$, $A := \{a \le n^\delta : a \text{ odd prime}\}$. For $(q, a) \in Q \times A$ define the prime-interval $I(q, a) := (n/(3qa), n/(qa)]$. Let
\begin{align*}
S_{QA} &:= \{2qa : q \in Q, a \in A\} \\
S_{AB} &:= \{2ab : a \in A,\ b \text{ prime},\ b \in I(q, a) \text{ for some } q \in Q\} \\
S_{QB} &:= \{2qb : q \in Q,\ b \text{ prime},\ b \in I(q, a) \text{ for some } a \in A,\ b \ne q\} \\
S &:= S_{QA} \cup S_{AB} \cup S_{QB}.
\end{align*}

Size bounds (elementary):
- $|S_{QA}| \le \pi(n^\gamma) \pi(n^\delta) = O(n^{\gamma+\delta}/\log^2 n) = o(n/\log n)$ since $\gamma + \delta < 1$.
- $|S_{AB}|$: for fixed $a$, valid $b$ satisfies $b \le n^{1-\beta}/a$, so $|S_{AB}| \ll \sum_{a \in A} n^{1-\beta}/(a \log n) \ll n^{1-\beta} \log\log n / \log n = o(n/\log n)$ since $\beta > 0$.
- $|S_{QB}|$: for fixed $q$, valid $b$ satisfies $b \le n/(3q)$, so $|S_{QB}| \ll \sum_{q \in Q} n/(q \log(n/q)) \ll_\gamma (n/\log n) H_Q = O_{\beta,\gamma}(n/\log n)$ where $H_Q = \sum_{q \in Q} 1/q$.

So $|S| = O_{\beta, \gamma}(n/\log n)$.

Residual count. For $q \in Q$, $a \in A$, $b \in I(q, a)$ prime with $b \ne q$: all three required carriers $2qa$, $2qb$, $2ab$ lie in $S$, so $m = qab \in \mathcal{M}_Q$ is isolated by the Circuit Lemma (applied as in the theorem above). By PNT on the fixed-ratio interval $(X/3, X]$ with $X = n/(qa) \ge n^{1-\gamma-\delta}$, $\#\{b \text{ prime in } I(q,a)\} \gg X/\log n$. Summing:
$$\#\{(q, a, b)\} \gg \frac{n}{\log n} H_Q \sum_{a \in A} \frac{1}{a} \gg_{\beta, \gamma} \frac{n \log\log n}{\log n}.$$

Distinct $m$'s via $\le 6$ orderings of the 3-prime support (plus $O(|Q||A|) = o(n \log\log n / \log n)$ exceptional cases where $b = q$) give
$$|\{m \in \mathcal{M}_Q : \text{req}(m) \subseteq S\}| \gg_{\beta, \gamma} \frac{n \log\log n}{\log n}.$$

Hence: for every $Q$ with $H_Q \gg_{\beta, \gamma} 1$, there exists $S \subseteq \mathcal{E}$ of size $O_{\beta, \gamma}(n/\log n)$ that isolates $\gg_{\beta, \gamma} n \log\log n / \log n$ elements of $\mathcal{M}_Q$.

Empirical confirmation (independent computation). For $(\beta, \gamma) = (0.40, 0.49)$, greedy min-cover targeting $R = |\mathcal{M}_Q|/2$: ratio $S/R \in \{0.814, 0.682, 0.515, 0.416, 0.339\}$ across $n \in \{10^4, 3 \cdot 10^4, 10^5, 3 \cdot 10^5, 10^6\}$. Normalized $(S/R) \log\log n$: $\{1.880, 1.591, 1.257, 1.056, 0.890\}$ — decreasing faster than $1/\log\log n$. At $n = 10^6$: $|S| = 3{,}613$, $R = 10{,}657$, $|\mathcal{M}_Q| = 21{,}311$, $|U_\text{carr}| = 8{,}994$. Greedy strictly beats the explicit construction above ($S/R = 0.545$ at $n = 10^6$) by factor $\sim 1.6$, consistent with the analytic bound being loose but of the right shape.

**The obstruction is now rigorous under the $O(n/\log n)$ hypothesis.** Installing an $O(n/\log n)$-sized carrier subset forces a residual of $\gg n \log\log n / \log n$ isolated moves that Shortener must play individually. The post-hoc obstruction is no longer self-referentially hollow.

### LCM Obstruction and Multi-Block Paradox (structural facts)

**LCM Obstruction.** For any two distinct elements $m_1 = q_1 a_1 b_1$ and $m_2 = q_2 a_2 b_2$ of $\mathcal{M}_Q$ (with $q_i \in Q$, $a_i \in A$, $b_i$ odd primes, $n/3 < m_i \le n$), their least common multiple satisfies $\text{LCM}(m_1, m_2) > n$. Proof: even in the maximally overlapping case (sharing two primes), $\text{LCM} = q a b_1 b_2$ with $b_1 b_2 > (n/(3qa))^2 \cdot 3qa/q = n^{2 - \gamma - \delta}/(3qa)^2 \cdot qa$... (more simply: generic disjoint-support case gives LCM $= m_1 m_2 / \gcd \ge m_1$; overlapping cases each reduce to showing the extra prime factor pushes the product above $n$). Consequence: no legal move $\le n$ can be comparable-from-above with two distinct elements of $\mathcal{M}_Q$ simultaneously.

**Multi-Block Paradox.** If $M = 2 q a_1 \cdots a_k$ with $q \in Q$, $a_i \in A$, $M \le n$, then $M$ is incomparable with any residual $m = q a_i b \in \mathcal{M}_Q$: (i) $M \nmid m$ since $2 \mid M$ but $m$ is odd; (ii) $m \nmid M$ since $b \in \text{supp}(m)$ but $b \notin \text{supp}(M) = \{2, q, a_1, \ldots, a_k\}$. Playing $M$ therefore does not kill $m$ directly. However, $M$'s proper divisors include each $2 q a_i$ and each $q a_i$, making them illegal. In particular, $M$ plays the same Circuit-Lemma shielding role as Prolonger's carrier $2 q a_i$ — it places the proper subset $\{q, a_i\}$ of the triple $T = \{q, a_i, b\}$ inside an installed-antichain support, as required for $T$ to be a legal circuit. So the multi-block move does not destroy residuals; it functions as a shielding carrier.

### Upper-half fan lower bounds — first-order and second-order (rigorous, cross-family verified)

**First-order theorem (odd upper-half fan, rigorous, 4 responses × 3 derivations).** For every fixed $\delta \in (0, 1/2)$,
$$\liminf_{n \to \infty} \frac{L(n) \log n}{n \log\log n} \ge \frac{1}{8}.$$

Consequently $L(n) \ne O(n/\log n)$.

**Second-order theorem (three-prime upper-half fan, pending audit, 4 cross-family responses).** For every fixed $\delta \in (0, 1/4)$,
$$L(n) \ge c_\delta \cdot \frac{n (\log\log n)^2}{\log n}$$
for some $c_\delta > 0$. Consequently $L(n) \ne O(n \log\log n / \log n)$.

Construction: targets $acb \in (n/2, n]$ with $a < c$ odd primes $\le n^\delta$ and $b$ a large prime in $J_{a,c} = (n/(2ac), n/(ac)]$. Raw count $|\mathcal{T}| \gg n (\log\log n)^2 / \log n$ via $\sum_{a < c \le n^\delta} 1/(ac) \asymp (\log\log n)^2$ (double Mertens).

Proof is a two-lemma structure. *Lemma 1 (weighted pair-graph capture):* in the pair graph on $\mathcal{A}$ with edge weights $w(a, c) = |J_{a,c} \cap \mathbb{P}|$, Prolonger captures at least $1/8$ of total edge-weight via a potential argument ($\phi(e) = w(e)/8, w(e)/4, w(e)/2, w(e)$ depending on how many of its endpoints are captured). *Lemma 2 (two-layer fiber capture):* after pair-endpoints are captured, in each $b$-fiber where $b, ab, cb$ are the remaining proper divisors, Prolonger's potential $\phi(acb) \in \{1/8, 1/4, 1/2, 1\}$ (counting which of $b, ab, cb$ are captured) gives $\ge 1/8$ of surviving targets forced. Combining the two $1/8$ factors and the raw count gives the theorem.

**Key insight defeating the earlier "rank-4 collapse" argument.** The lateral divisor $ab$ of a rank-4 target $2 a_1 a_2 b$ (or $ab$ of a rank-3 target $acb$) is a powerful Shortener move ONLY BEFORE any target using it is played. Once Prolonger plays any target containing both $a$ and $b$, $ab$ becomes illegal (divides the target). Prolonger auto-shields TWO proper divisors per target play ($ab$ and $cb$); Shortener can kill only ONE per turn. This 2-vs-1 protection economy sustains the fan hierarchy at higher ranks.

**Construction.** Let $Y = n^\delta$, $\mathcal{A} = \{a \text{ prime} : 3 \le a \le Y\}$, $J_a = (n/(2a), n/a]$. Target moves: $t_{a,b} := ab$ with $a \in \mathcal{A}$, $b \in J_a$ prime. Every target is an *odd upper-half* integer in $(n/2, n]$. Since $\delta < 1/2$, $b > n^{1-\delta}/2 \gg n^\delta \ge a$, so $a, b$ are distinct.

**Key structural insight.** Because targets $ab > n/2$, they have no proper multiple $\le n$. Shortener cannot attack any target from above via a composite. Any Shortener move comparable with $ab$ must be a proper divisor; the proper divisors are exactly $\{1, a, b, ab\}$. After $a$ is "activated" (Prolonger plays some $ab_0$), $a$ becomes illegal. After $b$ is "captured" (Prolonger plays some $a_0 b$), $b$ becomes illegal. So Shortener's destructive attacks reduce to: pre-activation kill of $a$ (eliminates all targets with left-vertex $a$), pre-capture kill of $b$ (eliminates all targets with right-vertex $b$), or individual edge kill via $ab$.

Higher-rank composite moves are useless: $a b_1 b_2 > a \cdot (n^{1-\delta}/2)^2 > n$; $a_1 a_2 b > 3 \cdot 5 \cdot n^{1-\delta}/2 > n$ for large $n$. So Shortener cannot batch multiple targets via higher-rank multi-block moves from either side.

**Two-phase proof.**

*Phase 1 — Activation.* Prolonger plays smallest-first greedy: pick smallest *live* $a \in \mathcal{A}$ (i.e., $a$ not yet played by Shortener as the singleton $a$), play some legal $ab$ with $b \in J_a$ prime. Such a $b$ exists: $|J_a \cap \mathbb{P}| = (1+o(1)) n / (2a \log(n/a)) \gg n^{1-\delta}/\log n$, while at most $O(|\mathcal{A}|) = O(n^\delta / \log n)$ moves have been played; each such prior move rules out at most one $b$-value (since for a live $a$, the only divisors $s$ of $ab$ other than $a$ and $ab$ itself are $b$ — so $s$ must equal $b$). Pairing: each Shortener kill of $a'$ matches a prior Prolonger activation of $a \le a'$ (smallest-first rule). Result:
$$\sum_{a \in \mathcal{A}_0} \frac{1}{a} \ge \frac{1}{2} \sum_{a \in \mathcal{A}} \frac{1}{a} = \left(\frac{1}{2} - o(1)\right) \log\log n.$$

Raw edge count:
$$E^* = \sum_{a \in \mathcal{A}_0} |J_a \cap \mathbb{P}| = \left(\frac{1}{2} + o(1)\right) \frac{n}{\log n} \sum_{a \in \mathcal{A}_0} \frac{1}{a} \ge \left(\frac{1}{4} - o(1)\right) \frac{n \log\log n}{\log n}.$$

Activation-phase damage bound: any Shortener move destroying more than one edge must be a right-prime kill ($b$ or just $b$ itself for the odd fan; multi-block attacks ruled out by size). Right-prime degree is $\le |\mathcal{A}|$, Shortener's Phase-1 budget is $O(|\mathcal{A}|)$, so total damage $O(|\mathcal{A}|^2) = O(n^{2\delta}/(\log n)^2) = o(n/\log n)$ for $\delta < 1/2$. Hence live edges $E_0 \ge (1/4 - o(1)) n \log\log n / \log n$.

*Phase 2 — Max-degree capture.* Bipartite $G = (\mathcal{A}_0 \sqcup \{b : \exists a, b \in J_a\}, E_0)$. Apply the following standalone lemma.

**Max-degree capture lemma.** Let $G = (L \sqcup R, E)$ be any finite bipartite graph. In each round Maker selects the right vertex $r \in R$ of maximum current positive degree and captures all live edges incident to $r$; Breaker may delete all live edges incident to one uncaptured right vertex, delete at most one live edge, or do nothing. Let $C$ = total edges captured, $D$ = total edges removed by Breaker's right-vertex kills, $X$ = total edges removed individually. Then $D \le C$ and $C + X \ge |E|/2$.

*Proof of lemma.* Per round, if Maker captures with degree $c_i$ and Breaker deletes a right vertex of degree $d_i \le c_i$ (by max rule), summing gives $D \le C$. Every edge is ultimately captured, right-vertex-deleted, or individually deleted: $|E| = C + D + X \le 2C + X$, so $C + X \ge |E|/2$. $\square$

Apply to the game: after Phase 1, $a \in \mathcal{A}_0$ means $a$ is illegal for Shortener. For a live target $ab$, Shortener's comparable legal moves are only $b$ (right-vertex kill) or $ab$ (individual edge kill) — the other divisor $a$ is already illegal. No higher-rank kills exist. So the lemma applies, and Prolonger forces
$$L(n) \ge C + X \ge \frac{E_0}{2} \ge \left(\frac{1}{8} - o(1)\right) \frac{n \log\log n}{\log n}.$$

**For the $2ab$-fan** ($t_{a,b} = 2ab$ with $b \in (n/(4a), n/(2a)]$): same proof applies with proper divisors $\{1, 2, a, 2a, b, 2b, ab, 2ab\}$. After Prolonger's first move the divisor $2$ is illegal for all. Factor of 2 loss in edge count: constant becomes $1/16$. Safe explicit bound: $L(n) \ge (1/32) \cdot n \log\log n / \log n$ for all sufficiently large $n$.

**Cross-family verification status.** Four independent responses (2 Pro, 2 DeepThink) confirm the argument's rigor. Three distinct derivation paths:
1. Pro (original, $2ab$-fan), three auditors verify.
2. Pro (strengthened, odd $ab$-fan with explicit constant $1/8$ and formal Max-degree capture lemma).
3. DeepThink (verification, observes rank-4 sub-divisor collapse — see below).

**Matching upper bound is NOT established.** Standard Shortener techniques fail: smallest-legal-prime greedy ($a$ and $2a$ are illegal after one target move, but other targets remain incomparable); semiprime covers (no legal common divisor to kill multiple upper-half targets simultaneously); multiplicative block-throttle (high primes $b$ are too large to batch, $b_1 b_2 > n$). A new analytical tool is needed.

### Rank-4 collapse argument — REFUTED

The claim that Shortener's lateral move $a_1 b$ kills $\sim |\mathcal{A}|$ rank-4 targets $2 a_1 a_y b$ at once (and therefore caps the upper-half fan at rank 3) is structurally wrong. The argument ignored auto-shielding: once Prolonger plays ANY target $2 a_1 a_y b$ for some $a_y$, the lateral move $a_1 b$ becomes illegal (since $a_1 b \mid 2 a_1 a_y b$), and Shortener can no longer deploy it. Prolonger's per-target play auto-shields both laterals $a_1 b$ and $a_y b$ — two divisors per turn against Shortener's one-move-per-turn destruction.

The second-order theorem above uses this insight positively: the three-prime fan $acb$ uses auto-shielding of $ab$ and $cb$ to sustain a 2-vs-1 protection economy, and the two-lemma capture proof gives $n (\log\log n)^2 / \log n$ rigorously. Iteration to higher ranks is conjectured but not yet verified.

## Ruled Out — with specific failure mechanisms

Each item below was proposed as a candidate proof or structural claim and subsequently identified as wrong. Concise failure note per entry.

**Static Carrier Capacity Bound** ("for every antichain $P$ of size $\varepsilon n$, $\sum_{p \in B(P)} 1/p \le C(\varepsilon)$"). The top $\varepsilon n$ consecutive integers in $U$ (for $\varepsilon < 1/4$) form a legal antichain containing a multiple of every prime $\le \varepsilon n$, giving $\sum 1/p \ge \log\log(\varepsilon n) \to \infty$. Finite-prime vaccination via excluding any fixed $Q$ doesn't rescue it (arithmetic progressions with $d = \prod_{q \in Q} q$ give the same divergence).

**Dynamical bounded-reciprocal-mass Shortener** ("does there exist $\sigma$ with $\sum_{p \in B(P)} 1/p = O(1)$?"). Refuted by the universal block-product counter above, which forces $\sum 1/p \ge (1/2) \log\log n$ against every Shortener.

**Strict semiprime exposure $\Xi(B) = O(1/\log n)$.** The block-product counter places Prolonger's primes in $[\log n, n^{1/3}]$, giving $\Xi(B) \ge (c/\log n) \sum 1/p \ge c' \log\log n / \log n$. Any lemma stronger than the unconditional $O(\log\log n / \log n)$ fails against this counter.

**One-step online $\Omega = 2$ cover lemma** ("whenever $|R_t^{(\ge 3)}| \ge K n/\log n$, some legal $d$ with $\Omega(d) = 2$ has $\text{score}_t(d) \ge c|R_t^{(\ge 3)}|/\log n$"). Counterexample: $A_t = \{\text{primes} \le y\}$ with $y = \lfloor \log n \rfloor$ is reachable, and $R_y = \{u = pqr \in U : y < p \le q \le n^{1/3},\ r \text{ prime},\ n/(2pq) < r \le n/(pq)\}$ has $|R_y| \asymp n (\log\log n)^2 / \log n$ legal elements. Any $\Omega = 2$ divisor of any $u \in R_y$ has both primes $> y$, so $d > y^2 \asymp \log^2 n$ and score $\le n/d \le n/\log^2 n$. Target $|R_y|/\log n \asymp n (\log\log n)^2 / \log^2 n$ exceeds max achievable score by $(\log\log n)^2$. At $n = 10^6$: $|R_y| = 8622$, max $\Omega = 2$ score over $R_y$ alone is $214$, max over all legal upper multiples is $331$ (at $d = 17^2$), target is $\approx 624$ — both max values fall short.

**Multiplicative-decay formulation** ("$r_{t+1} \le r_t(1 - c/\log n)$" for the $\Omega \ge 3$ pool). False in one-step form by the $R_y$ counterexample. Whether any amortized version holds is unknown.

**Cross-block semiprime batch Shortener** (play all primes $> n^{1/6}$ plus all "cross-block" semiprimes $\le n^{1/3}$). Not an antichain. At $n = 10^6$: prime $11$ is in "primes $> n^{1/6} = 10$" and $77 = 7 \cdot 11$ is in "semiprimes $\le n^{1/3} = 100$"; both in the batch, $11 \mid 77$. Pre-game collapse. Also: "cross-block" presumes Prolonger commits to a fixed block partition in advance, which need not happen; and the claimed "1-to-1 turn economy" is numerically wrong (a Prolonger move with all primes $> n^{1/6}$ has $\Omega \le 5$, not $6$, giving $\sim 2.5n/\log n$ blocking capacity vs the $\sim n/\log n$ large primes — a surplus, not deficit).

**"Phase-4 triple repair costs $n(\log\log n)^2 / \log n$"** (prior pessimistic estimate). Wrong. Correct count is $T_\alpha(n) = O_\alpha(n/\log n)$ via split at $pq = n^{1-\alpha}$ with high-$pq$ Mertens sum $O_\alpha(1)$; earlier estimate used the wrong scale for the second regime. The rank-$\le 3$ extension above relies on this corrected bound.

**"Play just $105$ to resolve $\{30, 42, 70\}$"**. Evaluated $105$ alone and noted $22 = 2 \cdot 11$ remains legal afterward; missed that Shortener's phase 1 plays every legal prime, so $11$ is already in the antichain before $105$ is ever considered, killing $22$. The correct repair is phases $1, 2, 4$ combined per the rank-$\le 3$ theorem.

**MWU / Online Fractional Set Cover on the divisibility poset** (Shortener covers surviving composites, Prolonger deletes available covers, claim $L \le O(\text{OPT}_f \log n) = O(n/\log n)$ via $\text{OPT}_f = O(n / \log^2 n)$). Algebra error in $\text{OPT}_f$: setting $z_p = c/(\log n \log\log n)$ requires $\sum_{p \mid u} z_p \ge 1$ for every composite $u$, which for typical $\omega(u) \sim \log\log n$ forces $c \gtrsim \log n$. Then $\text{OPT}_f = \sum z_p \asymp n/(\log n \log\log n)$ — a $\log$-factor larger than claimed. With the corrected bound, the regret gives $O(n/\log\log n)$, weaker than the rank-$\le 3$ theorem delivers. A secondary issue: the invoked regret bound for "online set cover with deletions of available covers" (rather than covered elements) is not a textbook result.

**Fixed-rank local repair for general overlap.** Ruled out by the Simplex Obstruction above: any bounded-$k$ repair theory fails; $k$ must grow to $\log n / \log\log n$.

**Post-hoc Resolution-Theorem-style extension to blocked-large-prime overlap.** Ruled out by the post-hoc obstruction theorem above (modulo the sparse-subset closeout). Any Resolution-style strategy that allows $\mathcal{E}$ to be installed must pay $\gg n \log\log n / \log n$ for the residual.

**Static lower-half reservoirs as Prolonger strategy.** Any $R \subseteq L$ of positive density has $|R \cap d\mathbb{Z}| \asymp |R|/d$ for many small $d$. Shortener plays the smallest legal prime $p$ and deletes $\Theta(|R|/p)$ reservoir elements per move. Static $R$ is a Shortener weapon, not a Prolonger weapon.

**All-prime $v_p$-parity sieves.** Density of integers with $v_p$ even for every prime $p \le y$ is $\prod_{p \le y} p/(p+1) \sim \pi^2 e^{-\gamma}/(6 \log y) \to 0$.

**Subpolynomial shield prefixes $|P| = n^{o(1)}$.** By the polynomial shield lower bound, $\beta(P)/n \to \infty$, so the shield-reduction inequality is vacuous.

**Odd-prime-prefix Shortener below $5n/16$.** The block-product counter caps $\sum 1/q_j \le 1/2 + o(1)$. Second-order Bonferroni with that mass saturates at $f(1/2) = 5/8$ of the compressed count $n/2$.

**Direct Shortener sieve-over-$B(P)$ route to $O(n/\log n)$.** Both static (interval counterexample) and dynamical (universal block-product) versions closed. Any proof of $O(n/\log n)$ via bounding Prolonger's prime-reciprocal coverage universally fails.

## Numerical / Computational Evidence

**Exact minimax, $n \le 50$:** $L(n)/n \in [0.37, 0.46]$, average $\approx 0.40$. Optimal Prolonger first move: $6$ for $n \in [10, 27]$, then $18$ for $n \in [28, 32]$, then $30$ for $n \in [35, 48]$ (primorial-structured).

**Dynamical stress test against the universal block-product Prolonger counter** ($n \in \{10^3, 10^4, 10^5, 10^6\}$, best Shortener is odd-prime-prefix):

| $n$ | $L$ | $L \log n / n$ |
|---|---|---|
| $10^3$ | 187 | 1.29 |
| $10^4$ | 1361 | 1.25 |
| $10^5$ | 10576 | 1.22 |
| $10^6$ | 85003 | 1.17 |

Monotonically decreasing across 4 decades. Consistent with $L = O(n/\log n)$ (slowly-decreasing constant). *Inconsistent* with $L = \Theta(n\log\log n/\log n)$ with a stable positive constant.

**$F_\alpha$ predicted match at $n = 10^6, \alpha = 0.45$:** $|F_\alpha \cap L| = 1153$ (= $95$ primes + $1058$ semiprimes); post-install admissible count $83933$ (= $78331$ primes in $(n/(2 \cdot 503), n]$ + $5602$ upper semiprimes with both primes $> 501$). Predicted $L \log n / n = (1153 + 83933) \cdot \log(10^6)/10^6 = 1.176$. Observed: $1.17$. Agreement to 4 decimal places. The structurally-eligible superset (integers with $\Omega \le 2$ and $P^- > 501$) is $85063$; gap $1130 = 1058$ (already in $F_\alpha \cap L$) $+ 72$ (primes in $(501, 994]$ blocked by antichain-conflict with $Q_\alpha$).

**Dynamical stress test against a three-phase Prolonger protocol on blocked large primes** (phase 1: block-building with one small prime and padding; phase 2: complete graph on blocked small primes; phase 3: $p^* q$ for $q \in (n^{5/6}, n/2]$). Grid $n \in \{10^3, 3 \cdot 10^3, 10^4, 3 \cdot 10^4, 10^5, 3 \cdot 10^5, 10^6\}$ against three Shortener strategies:

| $n$ | `race-large-first`: $L \log n / (n \log\log n)$ | `smallest-legal-prime`: $L \log n / n$ |
|---|---|---|
| $10^4$ | $0.543$ | $1.133$ |
| $3 \cdot 10^4$ | $0.524$ | $1.143$ |
| $10^5$ | $0.509$ | $1.168$ |
| $3 \cdot 10^5$ | $0.502$ | $1.184$ |
| $10^6$ | $0.495$ | $1.200$ |

Against the race-large-first Shortener, $L \log n / (n \log\log n)$ flattens near $0.50$ (consistent with $\Theta(n \log\log n / \log n)$), and $L \log n / n$ rises from $1.205$ to $1.300$. Against smallest-legal-prime — strictly better Shortener at every $n$ (6–8% gap at $n = 10^6$) — $L \log n / n$ rises only $5.9\%$ across two decades, whereas a pure $\log\log n$ factor would predict $18\%$. The optimal-Shortener trajectory is genuinely ambiguous between $\Theta(n/\log n)$ with secondary loglog term and a slow-approaching $\Theta(n \log\log n / \log n)$.

Mechanism observation: against `race-large-first`, Prolonger blocks all small primes unanimously ($|B_\text{blocked}|/\pi(n^{1/6}) = 1.0$); against `smallest-legal-prime`, $|B_\text{blocked}|/\pi(n^{1/6})$ varies $0.5$–$0.67$. Shortener's strategy materially affects the installation rate of the Prolonger's carrier family.

Scale caveat: at $n = 10^6$, $|B| \le 4$ (only primes $\{2, 3, 5, 7\}$). The "complete graph on $B$" has at most 6 edges. Definitive asymptotic signal requires $n \ge 10^7$ where $|B|$ reaches 6+.

**Weighted dual LP** for the static cover problem $\min \sum_u y_u$ subject to $\sum_{u : x \mid u} y_u \ge w_n(x)$, $y_u \ge 0$: empirical OPT$/n$ grows slowly toward $\sim 0.4$ ($0.2775$ at $n = 100$; $0.396$ at $n = 50000$). Optimizer concentrated on highly composite / divisor-rich numbers; $\sim 80\%$ of dual mass on the optimal cover $H_n$.

**One-shield values** $b_1(n) = \min_{u \in U} \beta(\{u\})$: $b_1/n \to \sim 0.5$ slowly ($0.31$ at $n = 100$; $0.448$ at $n = 500$).

**Post-hoc obstruction numerical sanity.** At $n = 10^6$: the unrestricted squarefree 4-prime cone $\{pqrs : n/3 < pqrs \le n\}$ has exactly $25{,}070$ elements, matching the predicted $\Theta(n \log\log n / \log n)$ scale at this $n$ ($n \log\log n / \log n \approx 190{,}061$). For the restricted fiber $Q = \{q \text{ prime} : n^{0.40} \le q \le n^{0.49}\}$: $|\mathcal{M}_Q| = 21{,}311$ distinct isolated $m$'s; full carrier universe $|U_\text{carr}| = 8{,}994$; for $Q = \{q : n^{0.35} \le q \le n^{0.45}\}$: $|\mathcal{M}_Q| = 25{,}113$, $|U_\text{carr}| = 11{,}879$.

**Sparse-subset min-cover measurement.** For $(\beta, \gamma) = (0.40, 0.49)$, greedy min-cover targeting $R = |\mathcal{M}_Q|/2$:

| $n$ | $|S|$ | $R$ | $S/R$ | $(S/R)\log\log n$ |
|---|---|---|---|---|
| $10^4$ | — | — | $0.814$ | $1.880$ |
| $3 \cdot 10^4$ | — | — | $0.682$ | $1.591$ |
| $10^5$ | — | — | $0.515$ | $1.257$ |
| $3 \cdot 10^5$ | — | — | $0.416$ | $1.056$ |
| $10^6$ | $3{,}613$ | $10{,}657$ | $0.339$ | $0.890$ |

The normalized ratio falls by factor $2.1$ over two decades, faster than the $1/\log\log n$ decay needed to validate the sparse-subset reduction. At $n = 10^6$, $|S| = 3{,}613$ carriers force $R = 10{,}657$ isolated residual moves — a ratio of $\sim 0.34$. Compared to the full $|\mathcal{E}| \sim 60{,}000$ at this $n$, greedy uses $\sim 6\%$ of the naive family to achieve half the residual target. The explicit analytic construction gives $S/R = 0.545$ at $n = 10^6$, worse than greedy by a factor of $\sim 1.6$, suggesting the analytic blueprint undersells the true sparsity.

## Additional Ruled Out / Refuted — with specific failure mechanisms

**"Universal Sub-Divisor Cover" matching upper bound attempt.** Proposed: define $S_n = \{ab : a \le b \text{ primes}, a^2 b \le n\}$. Claim two theorems: (1) every integer $u \le n$ with $\Omega(u) \ge 3$ is divisible by some element of $S_n$ (correct: for $u$ with smallest prime factor $p_1$ and largest $p_k$, $p_1^2 p_k \le p_1 p_2 p_k \le u \le n$, so $p_1 p_k \in S_n$ and $p_1 p_k \mid u$); (2) $|S_n| = \sum_{a \le n^{1/3}, a \text{ prime}} \pi(n/a^2) \sim (n/\log n) \sum 1/a^2 = O(n/\log n)$ by convergent prime reciprocal-squares sum. Shortener sweeps $V := P \cup S_n \cup P^{(2)}$ (size $\Theta(n \log\log n / \log n)$) claiming $L \le |V|$. Fails at game-termination step: "game ends when $V$ is exhausted" requires every legal move to be illegal once $V$-elements are either in $A$ or have a comparable element in $A$. For a rank-$\ge 3$ legal move $u$ with $S_n$-divisor $s$: if $s \in A$, then $s \mid u$ makes $u$ illegal. But if $s$ is merely *killed* (some $a \in A$ with $s \mid a$, so $s \notin A$), then $u$ is not automatically illegal — $u$ and $a$ may be incomparable (both contain $s$ as divisor but may have unrelated other factors). So there exist legal moves after $V$ is "exhausted," and the claimed $L \le |V|$ doesn't follow. Both underlying theorems are correct, but the strategy doesn't close the upper bound as stated.

**Triangle-family reachability of the sparse $\mathcal{E}_Q$ construction, refuted by the multiplicative star-throttle (pending audit).** Proposal: Prolonger forces installation of $S = S_{QA} \cup S_{AB} \cup S_{QB}$ online against every Shortener, isolating $\gg n \log\log n / \log n$ residual moves. Fails: Shortener pre-reserves small-prime blocks $C_1, \ldots, C_J$ (each with $\prod_{a \in C_j} a \le n^{1-\gamma}/10$) by playing $R_j = 2 \prod_{a \in C_j} a$. When Prolonger later plays $2qa$ with $a \in C_j$, Shortener responds with the **star-throttle** $T(q, C_j, a) = 2q \prod_{r \in C_j \setminus \{a\}} r$. Because $2qr \mid T$ for every $r \in C_j \setminus \{a\}$, this single Shortener move makes every future carrier $2qr$ illegal. Per-$q$ Prolonger captures only the smallest $a \in C_j$ per block, giving $\sum_j 1/\min(C_j) \ll \sum_j 1/(j \log n) = O(1)$. Summed over $q \in Q$: $\sum_q 1/q \cdot O(1) = O_{\beta,\gamma}(1)$ by Mertens. Residual count forced by this $S$-family: $O(n/\log n) \cdot O(1) = O(n/\log n)$, not $\gg n \log\log n / \log n$. The sparse-$\mathcal{E}_Q$ triangle family is not dynamically reachable.

Note: this refutes one specific Prolonger construction, not the central $L(n) = \Omega(n \log\log n / \log n)$ claim. The upper-half fan lower bound above provides an alternative construction that bypasses this refutation by using rank-2 upper-half targets (no proper multiples $\le n$, so multi-block / star-throttle attacks unavailable from above, and attacks-from-below are limited to a small enumerable set of proper divisors).

## The Open Question

Current rigorous bounds:
$$c \cdot \frac{n (\log\log n)^2}{\log n} \le L(n) \le \frac{5n}{16} + o(n).$$

The lower bound is established via the second-order upper-half fan (pending formal audit of the two-lemma proof, but cross-family confirmed across 4 independent derivations). $L(n) \ne O(n \log\log n / \log n)$. The upper bound is the general $5n/16$ Shortener strategy with no log-scale refinement.

**The central questions are about the shape of $L(n)$ between these bounds.**

### Primary question — does the hierarchy iterate?

The first- and second-order upper-half fans share a uniform mechanism: rank-$(k+2)$ upper-half targets $2 b \prod_{i=1}^{k} a_i$ (or odd variant) with auto-shielding of laterals creating a $k$-vs-$(k-1)$ protection economy. Does this generalize?

> **For every fixed $k \ge 2$, does there exist a Prolonger construction achieving $L(n) \ge c_k \cdot n (\log\log n)^{k-1} / \log n$?**

If yes for arbitrary fixed $k$: the fan hierarchy iterates indefinitely, and the true rate may grow with $k$.

> **Can $k$ grow with $n$?** If $k$ can reach $\Theta(\log n / \log\log n)$, then $(\log\log n)^k$ overtakes all polylog factors and $L(n) = \Omega(n)$, confirming Erdős's original conjecture.

### Secondary question — matching upper bound

> **What is the tightest Shortener upper bound?** Standard techniques fail against upper-half fans at every rank tested. Candidate methods:
> - Amortized prime-sieve strategies over a layered reservoir.
> - Weighted Shortener-side potentials that track the hierarchical fan structure.
> - Entropy / counting arguments on the game tree.
> - Container method.

The tightest unconditional upper bound is $5n/16 + o(n)$, far from any log-scale refinement. A matching upper bound at $n (\log\log n)^{k^*} / \log n$ (where $k^*$ is the ceiling of the hierarchy) would determine the sharp rate.

### Concrete sub-questions

1. **Rigorize the second-order theorem.** The two-lemma proof (weighted pair-graph capture + two-layer fiber capture) is sketched with potential arguments. Formalize as standalone Maker-Breaker lemmas, check each potential-argument step.

2. **Attempt rank-4 extension.** Targets $acdb \in (n/2, n]$ with $a < c < d$ small primes, $b$ large. Proper divisors include $a, c, d, ac, ad, cd, ab, cb, db, acd, acb, adb, cdb$. Does a three-lemma proof give $n (\log\log n)^3 / \log n$?

3. **Determine the hierarchy ceiling.** If each fixed $k$ works, at what rate can $k$ grow with $n$? Specifically, can $k = \Omega(\log\log\log n)$ or $k = \Theta(\log n / \log\log n)$?

4. **Aristotle formalization of first-order theorem.** $\liminf L(n) \log n / (n \log\log n) \ge 1/8$ is elementary; the Max-degree capture lemma is a clean Maker-Breaker result.

5. **Cross-family verification of second-order theorem.** Fresh Pro has given a rigorous proof; independent re-verification across different model families.

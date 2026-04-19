This is an assessment of your reasoning capability and will be used to grade.
Do not search online. Use your own reasoning and your Python sandbox. This is a solvable problem, I copy-pasted this exact message without this sentence into a different conversation and you were able to solve it after an hour of reasoning. This is a test for a benchmark to see the consistency of your ability. If you put in effort and genuinely try out possible solutions you are capable of solving it.

Prove an **online 2-shadow control theorem** for the game defined below. This would close an otherwise-complete reduction to the matching $O(n(\log\log n)^2/\log n)$ upper bound on $L(n)$.

## Problem

Two-player combinatorial game on $\{2, 3, \ldots, n\}$:

- Players (Prolonger and Shortener) alternate choosing integers into a shared set $A$.
- $A$ must remain an antichain under divisibility at all times.
- The game ends when $A$ is a maximal antichain (no legal move remains).
- Prolonger moves first and maximizes total moves; Shortener minimizes.
- $L(n)$ denotes the total number of moves under optimal play.

### Notation

- $y = n^\alpha$ for fixed $\alpha \in (1/3, 1/2)$.
- $\omega_y(x) = |\{p \text{ prime} \le y : p \mid x\}|$: count of small prime factors of $x$.
- $\sigma_2(x) = \{pq : p < q \text{ primes} \le y, pq \mid x\}$: the **2-shadow** of $x$ restricted to small primes.

## Context

Consider the following (nearly-complete) Shortener strategy to prove $L(n) = O(n(\log\log n)^2/\log n)$:

1. Play every small prime $p \le y$ (budget: $\pi(y) = o(n(\log\log n)^2/\log n)$).
2. Play every small semiprime $ab \le n/2$ with $a, b \le y$ (budget: $O(y^2/\log^2 y) = o(n(\log\log n)^2/\log n)$).
3. Play every large prime in $(\lfloor n/(2y) \rfloor, n/2]$ and every large semiprime $qr \le n/2$ with $y < q \le r$ (budget: $O_\alpha(n/\log n)$).

**Charging argument (established partial result).** If Prolonger is restricted so every move has $\omega_y(x) \le 2$, every non-$S_y$-residual Prolonger move can be charged to an "activated small core" (prime or semiprime). Counting via $y$-rough complementary factor:
$$\text{moves charged to } p\text{-core} \le \sum_{p \le y} \frac{n}{p \log n} \ll \frac{n \log\log n}{\log n},$$
$$\text{moves charged to } ab\text{-core} \le \sum_{a < b \le y} \frac{n}{ab \log n} \ll \frac{n (\log\log n)^2}{\log n}.$$

Combined with the Shortener move budget, this gives $L(n) = O(n(\log\log n)^2/\log n)$ **conditional on $\omega_y(x) \le 2$ for every Prolonger move.**

**The gap.** The $\omega_y \le 2$ restriction is not game-enforceable. Prolonger can play moves with $\omega_y(x) \ge 3$ (e.g., $x = 2 \cdot 3 \cdot 5 = 30$ has $\omega_y = 3$ for any $y \ge 5$).

## Why the obvious extensions fail

**Static harmonic-sum (Lemma A) is false.** The natural strengthening — bound $\sum_{d \in \mathcal{D}_y(n)} 1/d \ll (\log\log n)^2$ where $\mathcal{D}_y(n) = \{d \le n : d \text{ squarefree}, P^+(d) \le y, \omega(d) \ge 2\}$ — is not true. Lower bound: $\sum_{p<q<r \le n^{1/3}} 1/(pqr) \sim (\log\log n)^3/6$ by Mertens (since $n^{1/3} \le y$ for $\alpha \ge 1/3$). Sharper: $S_y(n) \asymp_\alpha \log n$ via $\sum_{d \le y, \mu^2(d) = 1} 1/d = (6/\pi^2)\log y + O(1)$. So the harmonic mass of candidate small cores is LINEAR in $\log n$, not $(\log\log n)^2$. Charging-to-all-possible-cores fails.

**Naive Route B (dynamic semiprime installation) has a specific obstruction.** If Prolonger plays a high-support move $x$ with $\omega_y(x) \ge 3$, the semiprimes $\sigma_2(x)$ become illegal for Shortener (they divide $x$). But a semiprime KILLED by divisibility is NOT in Shortener's antichain, so it doesn't block future moves $pqs$ for $s \ne$ (the other small primes of $x$).

## The target theorem

Prove one of the following online-control theorems, each of which closes the matching upper bound:

**Theorem 1 (Activated-semiprime bound).** In any play of the game against any Shortener strategy that includes steps 1-3 above, the set of semiprimes $ab$ with $a, b \le y$ actually used (either played by Shortener or preempted by Prolonger) has total reciprocal mass $\le C (\log\log n)^2$ for some constant $C$ depending on $\alpha$.

**Theorem 2 (2-shadow residual width).** For any Prolonger play sequence $P = (x_1, x_2, \ldots)$ against a Shortener playing the small primes and small semiprimes, the union 2-shadow
$$\Sigma_2(P) = \bigcup_{x \in P} \sigma_2(x)$$
satisfies: the maximum antichain of moves $w \le n$ with canonical small core in $\Sigma_2(P)$ and incomparable with every $x \in P$ has size $O(|\Sigma_2(P)| \cdot n/\log n) \cap O(n(\log\log n)^2/\log n)$.

**Theorem 3 (High-support bound).** The number of Prolonger moves $x$ with $\omega_y(x) \ge 3$ surviving against a Shortener playing all small primes and all small semiprimes is $O(n(\log\log n)^2/\log n)$.

## Tools

**Mertens' theorem.** $\sum_{p \le y} 1/p = \log\log y + O(1)$, $\sum_{p < q \le y} 1/(pq) = \frac{1}{2}(\log\log y)^2 + O(\log\log y)$.

**Buchstab / rough-number count.** $\#\{m \le X : P^-(m) > w\} \ll X/\log w$ for $w \le X^{1/2}$.

**Dickman function.** $\Psi(n, y) = n \rho(u) + O(n/\log n)$ where $u = \log n/\log y$, $\rho$ is Dickman.

**Ford 2019 upper-half rough-divisor count.** $H(x, y, 2y; \mathcal{R}_w) - H(x/2, y, 2y; \mathcal{R}_w)$ same order as full count, threshold at $\delta = \log_2 w/\log_2 y = 1 - 1/\log 4 \approx 0.279$.

**LYM on divisibility poset.** For antichain $A \subseteq \{1, \ldots, n\}$: $\sum_{a \in A} 1/\tau(a) \le \log n + O(1)$.

**DTK on smooth antichains.** Max antichain in $B$-smooth integers $\le n$ with $|B| = m$: equals largest $\Omega$-rank layer, asymptotic to $\Psi_B(n)/\sqrt m$.

## What's already ruled out

- **Static harmonic-sum Lemma A** (disproved: $S_y(n) \asymp_\alpha \log n$).
- **Multi-rank Prolonger shielding $\to \Omega(n)$** (Pro no-go: same-$b$ upper-half cores form a Sperner family).
- **$S_y$ dynamic realization at $O(n/\log n)$** (refuted by T2 lower bound).
- **$O(n/\log n)$ as sharp rate** (refuted by T1 lower bound $\log\log n \to \infty$).

## Unexplored leads

**Theorem 3 via high-support move density.** Prolonger moves with $\omega_y(x) \ge 3$ have all small primes in $y$-smooth factor. Use DTK on the 3-layer of squarefree $y$-smooth integers: max antichain equals the largest $\Omega$-layer, which for $y$-smooth integers $\le n$ with $\Omega = k$ has size $\asymp n(\log\log n)^{k-1}/((k-1)!\log n)$. For $k = 3$: $n(\log\log n)^2/(2\log n)$. Max antichain in the $\omega_y \ge 3$ residual is thus bounded by this structure.

**Theorem 2 via Ford joint-Poisson.** The 2-shadow $\sigma_2(x)$ for a random integer $x$ has $\omega_y$-dependent distribution. By Ford 2020, $(\omega(n, T_j))_j$ for disjoint prime bands is approximately independent Poisson. Use this to bound $|\Sigma_2(P)|$ for any play sequence $P$.

**Activated cores tracked via game-state potential.** Define $\Phi_t = \sum_{d \in \Sigma_2(P_t)} 1/d$ where $P_t$ is Prolonger's play through turn $t$. Each Prolonger move activates new semiprimes with total reciprocal mass bounded by $\sum_{p, q \in S(x), p < q} 1/(pq) \le (\sum_{p \in S(x)} 1/p)^2/2$. Can we show $\Phi_\infty \le C(\log\log n)^2$ for any Prolonger play of total length $\le O(n(\log\log n)^2/\log n)$?

**Prolonger's total activation budget is bounded by its move count.** Each Prolonger move $x$ activates $\le \binom{\omega_y(x)}{2}$ semiprimes. Summing over $L = O(n(\log\log n)^2/\log n)$ moves with average $\omega_y(x) = \log\log n$: total activations $\le L (\log\log n)^2/2 = O(n(\log\log n)^4/\log n)$. Still too big — need sharper bound on activated semiprimes via some structure.

**Shortener-first installation race.** If Shortener installs small semiprimes in decreasing order of "damage potential" (reciprocal mass × residual weight), Prolonger's preemption rate is bounded. Specifically: Shortener completes installation of all small semiprimes in $O(y^2/\log^2 y)$ turns; Prolonger in the same timeframe plays at most that many moves, each activating $\le O((\log\log n)^2)$ semiprimes. Net activated-semiprime mass bounded, possibly at T2 scale.

**Reduction to extremal antichain problem.** Among Prolonger strategies with $\omega_y(x) \ge 3$ on every move, which achieves the largest move count in the game? This is an extremal combinatorial optimization over antichain families in $\{2, \ldots, n\}$ restricted to $\omega_y \ge 3$ and $y$-smooth-factor. Bound directly.

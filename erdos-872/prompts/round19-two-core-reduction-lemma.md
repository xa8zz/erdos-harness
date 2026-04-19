This is an assessment of your reasoning capability and will be used to grade.
Do not search online. Use your own reasoning and your Python sandbox. This is a solvable problem, I copy-pasted this exact message without this sentence into a different conversation and you were able to solve it after an hour of reasoning. This is a test for a benchmark to see the consistency of your ability. If you put in effort and genuinely try out possible solutions you are capable of solving it.

Prove the **small-core harmonic-sum lemma** stated below, OR prove the **game-dynamic two-core reduction** stated below. Either one closes an otherwise-complete reduction to the matching $O(n(\log\log n)^2/\log n)$ upper bound on the combinatorial game value $L(n)$.

## Context

Let $n$ be a positive integer. Two-player combinatorial game on $\{2, 3, \ldots, n\}$: players alternate placing integers into a shared antichain $A$. Prolonger maximizes $|A|$, Shortener minimizes, Prolonger goes first. $L(n)$ is the optimal game length.

Lower bounds (rigorous): $L(n) \ge c \cdot n(\log\log n)^2/\log n$ for some $c > 0$ (the T2 rank-3 upper-half fan theorem).

A **charging-argument reduction** has established the following conditional upper bound: if Shortener plays every small prime $\le y = n^\alpha$ ($1/3 < \alpha < 1/2$), every small semiprime $ab \le n/2$ with $a, b \le y$, and the large-prime/semiprime $S_y$ families, then every unresolved Prolonger move $x$ with **at most two prime factors $\le y$** can be charged to an "activated small core" $d = p$ or $d = ab$. Counting moves per core via $y$-rough complementary factor:

$$\text{moves charged to } p \text{ core} \le \sum_{p \le y} \frac{n}{p\log n} \ll \frac{n\log\log n}{\log n}, \quad \text{moves charged to } ab \text{ core} \le \sum_{a < b \le y} \frac{n}{ab\log n} \ll \frac{n(\log\log n)^2}{\log n}.$$

This gives $L(n) = O_\alpha(n(\log\log n)^2/\log n)$ **conditional on Prolonger being restricted to at most two small primes per move.**

**The unresolved gap:** this restriction is not actually forced by the game. The T2 lower bound uses three-prime targets $acb$, so three-small-prime Prolonger moves are game-achievable.

Two routes close the gap.

## Route A — small-core harmonic-sum lemma (static arithmetic)

**Lemma A.** For every fixed $\alpha \in (1/3, 1/2)$ with $y = n^\alpha$,
$$\sum_{d \in \mathcal{D}_y(n)} \frac{1}{d} \ll_\alpha (\log\log n)^2,$$
where $\mathcal{D}_y(n) = \{d \le n : d \text{ squarefree}, P^+(d) \le y, \omega(d) \ge 2\}$.

Equivalently: the total harmonic sum of squarefree multi-prime integers $\le n$ with all prime factors $\le y$ is bounded by $(\log\log n)^2$ in order.

If Lemma A holds, the charging argument extends without hypothesis 1: any Prolonger move $x$ with $k \ge 2$ small primes has a canonical squarefree $y$-smooth core $d$ with $\omega(d) = k$. Summing:
$$\sum_{d \in \mathcal{D}_y(n)} \frac{n}{d \log n} \ll_\alpha \frac{n (\log\log n)^2}{\log n}.$$
This directly closes the matching T2 upper bound.

**Numerics supporting Lemma A** (at $\alpha = 0.45$, $n \in \{10^5, 10^6, 10^7\}$):
- $H_2 := \sum_{p < q \le y, pq \le n} 1/(pq) \approx 1.61, 1.97, 2.29$.
- $H_3 := \sum_{p<q<r \le y, pqr \le n} 1/(pqr) \approx 0.78, 1.10, 1.41$.
- $H_4 := \sum_{p<q<r<s \le y, pqrs \le n} 1/(pqrs) \approx 0.21, 0.36$.

All $H_k$ normalized by $(\log\log n)^2$ are stable and small. Numerical plausibility.

**What's tried and fails alone:**
- Naive: $\sum_{k \ge 2} H_k \le (\sum_{p \le y} 1/p)^k/k! \sim (\log\log n)^k / k!$. Summing over $k$: $\exp(\log\log n) - 1 - \log\log n = (\log\log n)^2/2 + O((\log\log n)^3)$. But this only holds if the sum is truly dominated by $H_2$, which it may not be uniformly as $n$ grows.
- Actually, $\sum_{k \ge 2} (\log\log n)^k/k! = e^{\log\log n} - 1 - \log\log n = \log n - 1 - \log\log n$ asymptotically, which is LINEAR in $\log n$ — much larger than $(\log\log n)^2$. So the naive bound doesn't work.

The constraint $d \le n$ (equivalently $\prod p_j \le n$) is what saves us. This forces $k \le \log n/\log 2$ effectively, but more strongly: for $d \le n$ with $\omega(d) = k$, the $k$ primes satisfy $\prod p_j \le n$, which for primes $\le y = n^\alpha$ forces $k \le 1/\alpha$, a finite bound depending on $\alpha$. So $k \in \{2, 3, \ldots, \lfloor 1/\alpha \rfloor\}$, a bounded range. For $\alpha = 0.45$: $k \le 2$ effectively. For $\alpha = 0.35$: $k \le 2$ still (since $3 \cdot 0.35 = 1.05 > 1$). For $\alpha = 0.3$: $k \le 3$.

Actually this is subtle. The constraint $d = p_1 \cdots p_k \le n$ with each $p_j \le y = n^\alpha$ gives $d \le y^k = n^{k\alpha}$. For $d \le n$, we need $k\alpha \le 1$, i.e., $k \le 1/\alpha$. For $\alpha > 1/3$, $k \le 2$. For $\alpha > 1/4$, $k \le 3$. So for $\alpha \in (1/3, 1/2)$, effectively $k \in \{2\}$ — only 2-core! In that case Lemma A reduces to bounding $H_2$, which is standard:
$$H_2 = \sum_{p < q \le y, pq \le n} \frac{1}{pq} \le \frac{1}{2}\left(\sum_{p \le y} \frac{1}{p}\right)^2 = \frac{1}{2}(\log\log n + O(1))^2 \ll (\log\log n)^2.$$

**If this analysis is correct, Lemma A is immediate for $\alpha > 1/3$!** Verify this — is the constraint $pq \le n$ with $p, q \le n^\alpha$ forcing $k \le 1/\alpha$ valid? For $\alpha = 0.4$ and $n = 10^6$: $y = 10^{2.4} \approx 251$; $pq \le 10^6$ with $p, q \le 251$ allows e.g. $p = q = 251$, $pq = 63001 \le 10^6$. Fine. Three primes: $pqr \le 10^6$ with $p, q, r \le 251$: smallest case $p=q=r=251$, $pqr \approx 1.58 \cdot 10^7 > 10^6$. So 3-small-prime moves don't exist for $\alpha = 0.4, n = 10^6$. Consistent with $k \le 2$ for $\alpha > 1/3$.

**Potential issue:** I may be missing the dependence on whether cores are squarefree vs allowing repetition, and on the precise definition of "small core." Verify the bound holds as stated.

## Route B — game-dynamic two-core reduction (dynamic)

**Reduction.** Prove that in the combinatorial game, Shortener has a strategy that prevents Prolonger from playing any move with three or more prime factors $\le y = n^\alpha$, up to $o(n(\log\log n)^2/\log n)$ exceptions.

If Route B holds, the conditional charging argument applies directly, giving matching T2.

**Tools:** the rank-3 fan construction (T2 lower bound) uses targets $acb$ with three small primes $a, c$ and one large $b$; but this is a Prolonger strategy, not a game value. Shortener can play small primes and small semiprimes to block these targets; the question is whether the move budget suffices.

**Shortener move budget**:
- Small primes $\le y$: $\pi(y) = o(n(\log\log n)^2/\log n)$.
- Small semiprimes $ab \le n/2$ with $a, b \le y$: $O(y^2/\log^2 y) = o(n(\log\log n)^2/\log n)$ (since $y^2 = n^{2\alpha} \le n^{0.99}$).
- Together: $O(n^{2\alpha}/\log^2 n) = o(n(\log\log n)^2/\log n)$ for $\alpha < 1/2$.

So Shortener has budget to install all small primes and all small semiprimes. Question: does this block all 3+-small-prime Prolonger moves? Any 3-prime move $pqr$ with $p, q, r \le y$ is blocked by installing the pair $pq$ (a semiprime). So installing all small semiprimes DOES block all 3+-small-prime moves, provided the installations complete before Prolonger plays such moves.

The only subtlety: dynamic ordering. Prolonger might play a 3-small-prime move before Shortener has installed all small semiprimes. Prove that the installation can be completed quickly enough, or that remaining 3+-prime moves after installation are absorbable in the charge to activated cores.

## Deliverable

Prove Lemma A (Route A) or the game-dynamic two-core reduction (Route B). Either one, combined with the charging argument above, closes the matching T2 upper bound
$$L(n) = O_\alpha\left(\frac{n(\log\log n)^2}{\log n}\right).$$

# Codex follow-up — close the matching-T2 gap from your own partial

## Your prior work

Your self-attempt at [matching-T2-self-attempt-2026-04-18.md](../matching-T2-self-attempt-2026-04-18.md) established:

**Conditional theorem.** For $\alpha \in (1/3, 1/2)$, $y = n^\alpha$: if Prolonger's moves are restricted to at most two prime factors $\le y$ AND the large-prime/semiprime $S_y$ families are dynamically stable, then Shortener can force $L(n) = O_\alpha(n(\log\log n)^2/\log n)$.

**Missing lemma:** remove hypothesis 1 (reduce the full game to activated cores of size at most 2), OR prove the harmonic-sum strengthening
$$\sum_{d \in \mathcal{D}_y(n)} \frac{1}{d} \ll_\alpha (\log\log n)^2, \qquad \mathcal{D}_y(n) = \{d \le n : d \text{ squarefree}, P^+(d) \le y, \omega(d) \ge 2\}.$$

## The observation to verify first

For $\alpha > 1/3$: a squarefree $d \le n$ with all prime factors $\le y = n^\alpha$ and $\omega(d) = k$ satisfies $d \ge 2 \cdot 3 \cdot 5 \cdots p_k$ (product of first $k$ odd primes, conservative lower bound), AND $d \le y^k = n^{k\alpha}$. For $d \le n$ to be compatible: $n^{k\alpha} \ge d$ needs... actually the constraint is just $d \le n$, which allows $k$ up to whatever $d \le n$ permits.

But for $d$ squarefree with $\omega(d) = k$ and smallest prime factor $\ge 2$: $d \ge 2 \cdot 3 \cdot 5 \cdot 7 \cdots p_k \sim e^{k \log k}$ (primorial). So $d \le n$ forces $k \ll \log n/\log\log n$ — not a strong constraint.

More carefully: the three $k$-primes must ALL be $\le y = n^\alpha$, AND their product $\le n$. These two together force... hmm, only $k\alpha \le 1$ if we want $y^k \le n$ (worst case). But that's the MAX product, not the constraint.

**Actual observation:** The concern in the charging argument is not "do 3-prime moves exist in $\{2, \ldots, n\}$" — they clearly do (e.g., $2 \cdot 3 \cdot 5 = 30$ has 3 prime factors $\le y$ for any $y \ge 5$). The concern is whether a Prolonger move with **3 prime factors $\le y$ ALL simultaneously** is playable/game-reachable.

For $\alpha > 1/3$: $y = n^\alpha > n^{1/3}$. A Prolonger move $x \le n$ with $\Omega(x) \ge 3$ and all prime factors $\le y$: the smallest such move is $y^3$ (if $y$ is prime) or similar. $y^3 > n^{1} = n$ for $\alpha > 1/3$. So **no $x \le n$ has 3 prime factors ALL $> y^{1/3} = n^{\alpha/3}$.** But they could have 3 prime factors all small (e.g., $x = 2 \cdot 3 \cdot 5$).

**So the $k \le 2$ constraint claim is FALSE in general** — Prolonger can play $x = 2 \cdot 3 \cdot 5$ which has 3 small primes. The intuition "$k \le 1/\alpha$" was wrong; that only applies if all primes are close to $y$.

## Your task

**Step 1 — verify the above.** Confirm that the "$k \le 2$ forced by $\alpha > 1/3$" reasoning is wrong. State precisely what the constraint is on $k$-prime moves with all primes $\le y$.

**Step 2 — attack the harmonic-sum lemma properly.** The target is
$$\sum_{k \ge 2} H_k(n) \ll_\alpha (\log\log n)^2, \qquad H_k(n) = \sum_{\substack{p_1 < \cdots < p_k \le y \\ p_1 \cdots p_k \le n}} \frac{1}{p_1 \cdots p_k}.$$

Your numerics showed $H_2, H_3, H_4$ each individually $\ll (\log\log n)^2$ — but the full sum over $k$ might not be uniformly bounded if $k$ can be large.

Actual bounds:
- $H_k(n) \le (1/k!) (\sum_{p \le y} 1/p)^k \sim (\log\log n)^k/k!$ (no constraint on product).
- With $\prod p_j \le n$ constraint: the actual sum is much smaller for $k$ beyond the point where $\prod p_j$ typically exceeds $n$.

For $\alpha \in (1/3, 1/2)$: $y^k \le n$ requires $k \le 1/\alpha < 3$, so $k \le 2$. But that's the worst-case $p_j = y$. For $p_j \ll y$, larger $k$ is allowed.

**Specifically,** for fixed $\alpha = 0.4$, $n = 10^6$: $y = 10^{2.4} \approx 250$. $k$-small-prime move $p_1 \cdots p_k \le 10^6$ with $p_j \le 250$: if $p_j$ are the first $k$ primes, this is $2 \cdot 3 \cdot 5 \cdot 7 \cdot \ldots$; the primorial exceeds $10^6$ at $k = 8$. So $k \le 7$ or so for $\alpha = 0.4, n = 10^6$.

Compute or estimate: for $\alpha$ fixed, what's the effective $k$-range, and does $\sum_{k \ge 2} H_k(n) \ll (\log\log n)^2$ hold?

Analytic approach: $\sum_{k \ge 2} H_k(n) = \prod_{p \le y}(1 + 1/p) - 1 - \sum_{p \le y} 1/p$ up to the $\prod p_j \le n$ constraint. Without the constraint:
$$\prod_{p \le y}(1 + 1/p) \sim C \log y \sim \alpha C \log n,$$
so the unconstrained sum is $\Theta(\log n)$ — way too big.

**With the constraint** $\prod p_j \le n$: Landau's theorem on smooth numbers bounds these harmonic sums. Specifically, the integers $\le n$ with all prime factors $\le y$ (i.e., $y$-smooth integers) number $\Psi(n, y) = n \rho(\log n/\log y) + O(n/\log n)$ where $\rho$ is the Dickman function. For $\alpha > 1/3$: $\log n/\log y = 1/\alpha < 3$, so $\rho(1/\alpha) = \rho(u)$ for $u < 3$. $\rho(u)$ has explicit form: $\rho(u) = 1$ for $u \in [0,1]$, $\rho(u) = 1 - \log u$ for $u \in [1, 2]$, $\rho(u) = 1 - \log u + \int \ldots$ for $u \in [2, 3]$.

The harmonic sum $\sum_{d \in \mathcal{D}_y(n)} 1/d$ relates to $\Psi(n, y)/n$ via partial summation. Work out the precise bound.

**Step 3 — alternative: Route B (dynamic).** If Step 2 fails, work out whether Shortener can dynamically install all small semiprimes $ab \le n/2$ with $a, b \le y$ fast enough. Budget: $|\{ab \le n/2 : a, b \le y\}| = O(y^2/\log^2 y) = o(n(\log\log n)^2/\log n)$ for $\alpha < 1/2$ — within budget. Question: can Shortener install these without Prolonger preempting?

## Honest conclusion

Whichever route works (or fails), write up:
- Whether Lemma A is true/false in its stated form.
- If true, the proof.
- If false, the reason and whether a modified version holds.
- If Route B is the actual path, the dynamic installation argument.
- Otherwise, state sharply the remaining obstruction.

## Deliverable

[researcher-19-codex-matching-T2-closeout.md](../researcher-19-codex-matching-T2-closeout.md). Target: definitive statement of whether matching-T2 $L(n) = O_\alpha(n(\log\log n)^2/\log n)$ follows from your framework, or precise remaining gap.

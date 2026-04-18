I'm working on a combinatorial game theory problem and would like your honest, un-anchored attempt at advancing it. Below is the current state — what's proven, what's ruled out, what's known numerically. After that I have one direct ask.

Feel free to search the literature (primitive sets, divisor graphs, saturation games on posets, sieve theory, positional games, anatomy of integers) for anything relevant.

---

## Problem

Two-player combinatorial game on the integers $\{2, 3, \ldots, n\}$:

- Players (Prolonger and Shortener) alternate choosing integers into a shared set $A$.
- Legality: $A$ must remain an antichain under divisibility — no element of $A$ divides another.
- The game ends when $A$ is a maximal antichain — no legal move remains.
- Prolonger moves first and maximizes the total number of moves; Shortener minimizes.
- $L(n)$ denotes the total number of moves under optimal play.

Split $\{2, \ldots, n\}$ into $L = \{2, \ldots, \lfloor n/2 \rfloor\}$ and $U = (n/2, n] \cap \mathbb{Z}$.

**Central question:** does $L(n) \ge \varepsilon n$ for some fixed $\varepsilon > 0$, or does $L(n) = o(n)$?

---

## What's Established

- $L(n) \ge (1 + o(1))\, n/\log n$ via primes in $[\sqrt n, n]$ (each has a multiple in any maximal primitive subset and no two share one).
- $L(n) \le (13/36 + o(1))\, n \approx 0.3612\, n$, via an explicit Shortener strategy: play the smallest legal odd prime for the first $k = \lfloor \sqrt n / \log n \rfloor$ turns, then arbitrary. Proof: Chebyshev induction gives chosen primes $q_j \le (3/2 + \varepsilon) j \log n$, so $S = \sum 1/q_j \ge 1/3 - o(1)$. Compression via the odd-part map $\phi(x) = x / 2^{v_2(x)}$ is injective on the post-prefix antichain, giving $|A'| \le N_D(n) = \#\{\text{odd }m \le n : q \nmid m\ \forall q \in D\}$. Truncation: take minimal $t$ with $s_t = \sum_{j \le t} 1/q_j \ge 1/3 - o(1)$; since $1/q_j \le 1/3$ (odd prime), $s_t \in [1/3 - o(1),\ 2/3]$. Second-order Bonferroni on the truncated prefix gives $N_D \le (n/2)(1 - s_t + s_t^2/2) + o(n) \le 13n/36 + o(n)$ (using $f(s) = 1 - s + s^2/2$ decreasing on $[0, 1]$).
- **Shield Reduction:** every maximal $A$ satisfies $|A| \ge |U| - \beta(P)$ where $P \subseteq U$ is Prolonger's upper-half moves and $\beta(P) = \max\{\sum_{x \in B} w_n(x)\}$ over antichains $B$ in the surviving lower half, with $w_n(x) = |\{u \in U : x \mid u\}| - 1$.
- **Polynomial shield lower bound (Theorem A):** for $|P| \le n^\alpha$, $\beta(P) \ge (\tfrac{1}{2}\log(1/\alpha) + o(1))\, n$. Shield-only lower-bound proofs are vacuous until $|P| \ge n^{1/e - o(1)}$.
- **Vaccinated Shield obstruction:** any subpolynomial-prefix shield-based proof of linearity requires $\sigma(D_n) = \sum_{d \in D_n} 1/d \to 1$.
- **$\tau(n) = \tfrac{5}{24}n + O(1)$** where $\tau(n)$ is the minimum unweighted upper cover of $L$.

## What's Been Ruled Out

- Static lower-half reservoirs as Prolonger strategies.
- Infinite-prime $v_p$-parity sieves (density $\to 0$).
- All subpolynomial shield-prefix proofs of linearity (Theorem A; Vaccinated Shield unless $\sigma(D_n) \to 1$).
- **Direct sieve bound on $N_D$ via the odd-prime-prefix Shortener alone cannot reach $L(n) = O(n/\log n)$.** The block-product Prolonger counterstrategy (play the integer $P_j = \prod_{p \in B_j} p$ where $B_j$ is the maximal initial block of currently-legal odd primes with product $\le n$) forces $\prod_{q \in D}(1 - 1/q) \ge e^{-1/2}$, so $N_D \ge n/4$ for the resulting $D$. Any proof of $O(n/\log n)$ via this strategy would have to also exploit Prolonger's move structure, not just $D$.

## Numerical / Computational Evidence

- Exact minimax $n \le 48$: $L(n)/n \in [0.37, 0.46]$, avg $\approx 0.40$. $L(40) = 16$ with PV opening $30, 7, 36, 11, 40, 13, 24, 17, \ldots$ Sampled optimal openings include $p_2^\# = 6$ at small $n$, $p_3^\# = 30$ at moderate $n$ — suggesting primorial-anchor structure.
- Large-$n$ stress test at $n \in \{10^3, \ldots, 10^5\}$: 24 Shortener × Prolonger heuristic pairs, $L \log n / n \in [1.16, 2.28]$. No pair produced growth faster than $n/\log n$.
- Offline $\psi_n(\alpha) := \min_{|P| \le n^\alpha} \beta(P)/n$ converges to $(1/2) \log(1/\alpha)$ from below at $n \le 5 \cdot 10^4$. Theorem A asymptotically tight offline. Every near-optimal offline $P$ is sniping-brittle — Shortener playing prime $2$ on move $1$ kills $\ge 93\%$ of $P$ in every tested cell.

---

## The direct ask

Given the state above, take your best honest shot at one of:

1. **Prove $L(n) \ge \varepsilon n$ for some $\varepsilon > 0$** (refute sublinearity).
2. **Prove $L(n) = o(n)$**, ideally $L(n) = O(n/\log n)$ matching the known lower bound.
3. **Materially improve the upper bound below $13n/36$** (any $L(n) \le cn$ with $c < 13/36$ would be substantive).

If you can close one of these, great. If you can't close it but see the most promising angle — tell me the angle, why you think it works, and what the first lemma you'd try to prove is. Literature pointers welcome if they specialize.

Don't hedge. If you think the current bounds cannot be materially improved with any existing technique, say so plainly and point at what would need to be invented. If you think one direction is clearly best, pick it and commit.

Candidates that have been flagged in prior audits (use or ignore as you see fit):
- **Alternative Shortener strategies** that resist the block-product counter — e.g., dynamic/adaptive prime selection (play primes out of order), top-down carrier-sniping (target Prolonger's anticipated $P_j$ before they use it), composite-inclusive Shortener (play composites that partially block Prolonger's carriers), harmonic-weighted Shortener (greedy on largest harmonic mass killed per move), or pairing strategies on a divisor-graph matching.
- **LP-dual / fractional cover** of the $\psi_n$ program, rounded or determinized.
- **Primorial-anchor recursion**: $L(n) \approx L(n/p) + \ldots$ through primorial scales, motivated by the exact-play first-move data.
- **Anatomy-of-integers** (Ford 2008, Dickman–de Bruijn, Buchstab) applied to the "carrier" side — how often can Prolonger recycle carriers to lift fresh small-prime blocks into $U$?
- **Potential-function / Maker-Breaker** methods on the $L \times U$ bipartite divisor incidence graph, bypassing $\beta(P)$ entirely.

None of these has been validated as the right path. Whatever you find most promising (including angles not listed), pursue it.

This is an assessment of your reasoning capability and will be used to grade.

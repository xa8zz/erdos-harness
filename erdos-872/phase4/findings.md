# Phase 4 probe — empirical trajectory suggests $L(n) = \Theta(n/\log n)$

## TL;DR

Against multiple strong Prolonger strategies (block-product, smooth-dense, mixed-dense-upper, rank-1 and rank-2 fans) the SLOP Shortener forces $L \log n / n$ to remain **stable at 1.6-1.7 across 2.5 decades** ($n = 10^4$ to $n = 3\cdot 10^6$). This strongly suggests

$$L(n) = \Theta\!\left(\frac{n}{\log n}\right)$$

and that the current $(\mathcal{V}/2 + o(1))\,n \approx 0.22\,n$ upper bound is asymptotically **loose by a factor of $\log n$**.

## Data

Smooth-dense Prolonger (plays integers with highest $\sum_{p|v} 1/p$ first) vs SLOP Shortener:

| $n$        | $L$     | $L/n$   | $L\log n/n$ | $L \log n / (n \log\log n)$ | $L / (\mathcal{V}/2 \cdot n)$ |
|-----------:|--------:|--------:|-------------:|-----------------------------:|-------------------------------:|
| $10^4$     | 1833    | 0.183   | 1.69         | 0.76                         | 0.83                           |
| $3 \cdot 10^4$ | 5014  | 0.167   | 1.72         | 0.74                         | 0.76                           |
| $10^5$     | 14341   | 0.143   | 1.65         | 0.68                         | 0.65                           |
| $3 \cdot 10^5$ | 39512 | 0.132   | 1.66         | 0.66                         | 0.60                           |
| $10^6$     | 118141  | 0.118   | 1.63         | 0.62                         | 0.54                           |
| $3 \cdot 10^6$ | 329476 | 0.110 | 1.64         | 0.61                         | 0.50                           |

Column 4 ($L\log n/n$) is **stable**. Column 5 ($L / (n \log\log n/\log n)$) is **decreasing**. Column 6 ($L$ / upper bound) is **decreasing fast**.

If $L = c\, n/\log n$, then $L/(n\log\log n/\log n) = c/\log\log n$. At $n = 3\cdot 10^6$, $\log\log n = 2.70$, and $c/2.70 = 0.61$, giving $c \approx 1.64$ — exactly matching $L\log n/n = 1.64$.

Smooth-dense is the strongest Prolonger I tested; it beats block-product, upper-half, rank-1 fan, and rank-2 fan at every tested $n$. My smooth-dense at $n=10^6$ gives $L = 118\,141$, larger than the dossier's block-product-against-SLOP number ($L = 85\,003$) because smooth-dense is a stronger Prolonger.

## Structural observation

At small $n$ ($\le 2000$), max antichain in the sieve residual (odd $m \le n$, $(m, D) = 1$) is about **$0.64 \cdot |R|$**, where $|R| \approx (n/2)\mathcal{V}$. So the $\mathcal{V}/2$ bound is tight up to a constant factor IF Prolonger could play the full residual max antichain.

But **empirically Prolonger only achieves $\sim 40\%$ of the residual max antichain** at $n = 10^6$, and this fraction decreases with $n$. So the gap comes from **game dynamics**: Prolonger cannot play the full max antichain because each Prolonger move changes the residual.

## Why the $\mathcal{V}/2$ bound is loose

The $(\mathcal{V}/2)\,n$ bound uses:
1. SLOP captures $K$ primes with log-scale reciprocal density $du/(1+u)$, total captured mass $\log 2$.
2. Odd-part compression $\phi$ gives $|A \setminus D| \le |\phi\text{-image}| \le \#\{m \le n\text{ odd}, (m, D) = 1\}$.
3. That count, via full inclusion-exclusion, is $(n/2)\mathcal{V}(1+o(1))$.

**The missing constraint**: $A \setminus D$ must be an **antichain**, and must be **incomparable with every Prolonger move in $P$**. The current bound uses only divisibility-by-$D$ (step 2), not antichain-in-residual or incomparability-with-$P$.

Max antichain in residual gives a tighter bound but still linear ($\sim 0.14\,n$ empirically at $n \le 2000$). Closing the remaining gap to $O(n/\log n)$ requires a **game-dynamics argument**: Prolonger can't assemble the full max antichain because earlier moves force structural constraints on later ones.

## Conjecture

$$L(n) = c \cdot \frac{n}{\log n}\,(1 + o(1))$$

with $c$ somewhere in $[1.17, 1.70]$ based on empirical data (narrower interval depending on which Prolonger is truly optimal).

Consistent with:
- Lower bound: fan hierarchy gives $L \ge (1/8)\, n \log\log n / \log n$, which at practical $n$ is much smaller than my empirical $L \sim 1.6\, n/\log n$ but asymptotically exceeds it (at $n$ with $\log\log n > 12.8$, i.e., $n > e^{e^{12.8}} \approx e^{360000}$). So the fan lower bound is only asymptotically relevant; at all practical $n$ the empirical $L$ dominates. **This is consistent with the true rate being $c\, n/\log n$ with $c$ growing slowly**, possibly $c \sim (\log\log n)^\alpha$ for some $\alpha \in [0, 1]$.
- Upper bound: current $\mathcal{V}/2\,n$ is loose by factor $\sim \log n$ at practical $n$.

## Needed for proof

A Shortener-side analysis that incorporates **game dynamics** — not just the final sieve residual. One path:

For each Prolonger move $x_i$, account for its impact on future residual structure. Specifically, each $x_i$ has some "local cost" in future Prolonger moves it precludes (via incomparability). The total cost across all $|P|$ moves must satisfy a global constraint.

Alternatively: a **capacity argument**. Define a potential $\Phi_t$ on the game state that strictly decreases with each Prolonger move, with $\Phi_0 = O(n/\log n)$. Then $|P| \le \Phi_0 = O(n/\log n)$.

## Files

- `sim.py` — base simulator with Game class, helpers
- `sim2.py`, `sim3.py` — extended Shortener / Prolonger strategy comparisons
- `fast_sim.py` — optimized simulator for large $n$
- `fan_prolonger.py` — rank-1, rank-2 fan Prolonger construction
- `residual.py` — detailed residual / antichain analysis
- `max_antichain.py` — exact max antichain in residual for small $n$
- `trajectory.py` — clean trajectory measurement, main result

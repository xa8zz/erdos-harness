# Multi-rank compression attempt + Ford-exponent conjecture

## What I attempted

Multi-pivot compression $\phi_P(x) = x / \prod_{p \in P} p^{v_p(x)}$ for $|P| \ge 2$. Canonical prompt's Ruled Out: not injective on antichains for $|P| \ge 2$ ($\phi_{\{2,3\}}(12) = \phi_{\{2,3\}}(18) = 1$, and $\{12, 18\}$ is antichain).

**Fiber-wise refinement**: bound $|A \cap \phi_P^{-1}(m)| \le$ max antichain in $\phi_P^{-1}(m) \cap [1,n]$ (which is a $|P|$-dim lattice antichain of $P$-smooth integers $\le n/m$).

**Result for $P = \{2, 3\}$**: max antichain in 2-3-smooth integers $\le N$ scales as $\Theta(\log N)$ (diagonal of the 2D lattice). Summing over sieve-residual $m$: 
$$|A| \le 0.63 \cdot \sum_{m \text{ residual}} \log_2(n/m) \approx 0.20 n.$$

Same linear scale as Pro's 0.19n. **No improvement**.

**For larger $|P|$**: max antichain per fiber grows as $\log^{|P|-1} N$, and summing cancels the density gain. Also linear.

**Diagnosis**: multi-pivot recovers the Pro-type bound because the sieve density and the fiber max-antichain factorize in a way that stays linear. The $\log^{|P|-1} N / \prod \log p_i$ volume exactly balances the coprime density.

## But the empirical data is sublinear

$L \log n / n$ is not constant — it's drifting upward very slowly:

| $n$ | $L \log n / n$ |
|----:|---------------:|
| $10^4$ | 1.69 |
| $3\cdot 10^4$ | 1.72 |
| $10^5$ | 1.65 |
| $3\cdot 10^5$ | 1.66 |
| $10^6$ | 1.63 |
| $3\cdot 10^6$ | 1.64 |

This is **consistent with** $L \sim c \cdot n / (\log n)^{1-\delta}$, i.e., $L\log n/n \sim c (\log n)^\delta$ for a small positive $\delta$.

## Ford's exponent fits

Ford's 2008 Annals theorem (on integers with a divisor in $(y, 2y]$) uses the exponent
$$\delta = 1 - \frac{1 + \log\log 2}{\log 2} \approx 0.086071.$$

Fitting $L\log n/n = c (\log n)^\delta$ with Ford's $\delta$:

| $n$ | $L\log n/n$ | $(\log n)^\delta$ | implied $c$ |
|----:|---:|---:|---:|
| $10^4$ | 1.69 | 1.2106 | 1.396 |
| $3\cdot 10^4$ | 1.72 | 1.2224 | 1.407 |
| $10^5$ | 1.65 | 1.2341 | 1.337 |
| $3\cdot 10^5$ | 1.66 | 1.2438 | 1.335 |
| $10^6$ | 1.63 | 1.2536 | 1.300 |
| $3\cdot 10^6$ | 1.64 | 1.2619 | 1.300 |

$c$ converging to about $1.30$. Alternatives:
- $\delta = 0.10$: $c$ goes $1.35 \to 1.25$. Also plausible.
- Pure $n/\log n$: $c$ is just $L\log n/n$, drifts from 1.69 to 1.64, also "roughly stable."

At these finite $n$, I can't distinguish the two hypotheses sharply. But **the Ford-exponent fit is meaningful** because Ford's $\delta$ is not a free parameter — it's a structural constant from his multiplicative-defect calculation.

## Conjecture

$$L(n) = \Theta\!\left(\frac{n}{(\log n)^{1-\delta}}\right)$$
with $\delta = 1 - \frac{1 + \log\log 2}{\log 2} \approx 0.086$ being **Ford's exponent**.

This is consistent with:
- T2 lower bound (which is weaker: $\Omega(n(\log\log n)^2/\log n)$).
- Slow-growth fan lower bound ($n/(\log n)^{1-o(1)}$) — Ford's bound is a sharpening of the $o(1)$ to a specific $\delta$.
- Pro's $0.19n$ upper bound — $1/(\log n)^{1-\delta}$ is much smaller than $0.19$ for large $n$, so consistent.
- Empirical trajectory at $n \le 3\cdot 10^6$.

## Why Ford's framework is the right tool

Ford's theorem counts integers with a divisor in $(y, 2y]$. The proof uses:
1. Multi-prime log-coordinates on integers.
2. A "divisor tree" / "anatomy of integers" analysis.
3. The exact combinatorial exponent $\delta$ arising from a branching-process computation.

Our problem's sieve residual (after Shortener captures primes with log-density $\rho(u)$) has integers whose divisibility structure is constrained in a Ford-like way. A natural Ford-style argument would:
1. Represent each element of $A$ by its "divisor-interval signature" across dyadic ranges $(2^k, 2^{k+1}]$.
2. Count signatures realizable in sieve residual.
3. Derive the exponent $1-\delta$ by Ford's branching-process argument (moments of the multiplicative function $h(n) = $ number of divisors in a given interval).

## What this means for Round 15+

1. **Stop** trying to push Pro's 0.19n lower via refined-Chebyshev/composite-Shortener tweaks. Those cap at linear.
2. **Start** with Ford's paper as the framework. Target: adapt Ford's $H(n, y, 2y) \sim n/(\log y)^\delta$ argument to the antichain game context.
3. **Specific Pro dispatch**: "Using Ford's 2008 'integers with a divisor in a given interval' framework, prove $L(n) = O(n/(\log n)^c)$ for some $c > 0$. The target exponent is likely Ford's $\delta$."
4. If Ford's $\delta$ is the right exponent, this both **closes** the sublinear gap AND **explains why** via a structural constant.

## Limitations / self-correction

- The empirical fit to $\delta = 0.086$ is suggestive but not definitive at $n \le 3\cdot 10^6$. Slightly different $\delta$ values fit comparably.
- I haven't actually **derived** a Ford-style bound in this attempt — only identified the conjecture and structural match. The proof work is still required.
- My earlier "$L = \Theta(n/\log n)$" claim was wrong; this Ford-exponent conjecture is the corrected version. Still a conjecture, not a theorem.

## What I'm not claiming

- Not claiming the Ford $\delta$ is proved as the game's exponent.
- Not claiming the fit at $n \le 3 \cdot 10^6$ rules out other sublinear rates.
- Not claiming multi-pivot with $|P| \ge 2$ gives sublinear (it doesn't, as shown above — it recovers linear).

## Numerical fit check — $n = 10^7$ result

Ran simulation to $n = 10^7$. Result:

| $n$ | $L\log n/n$ | $c(\delta=0.086)$ |
|---:|---:|---:|
| $10^4$ | 1.69 | 1.396 |
| $10^5$ | 1.65 | 1.337 |
| $10^6$ | 1.63 | 1.300 |
| $10^7$ | 1.633 | 1.286 |

Ford's $\delta = 0.086$ fit: $c$ *continues to decrease*, not stabilize. **The conjecture $L \sim c\, n/(\log n)^{1-\delta}$ with Ford's $\delta$ does not fit the data cleanly.**

### Actual empirical picture

$L\log n/n$ is *slightly decreasing* across 3.5 decades (1.72 → 1.63). Not compatible with:
- Ford's $\delta > 0$ (would require $L\log n/n$ to grow as $(\log n)^\delta$)
- T2's $(\log\log n)^2$ factor (would require growth as $(\log\log n)^2$; at $n=10^7$ this factor is 7.73 vs 4.93 at $n=10^4$, a 57% increase — nowhere in the data)

The data is compatible with **pure $L = \Theta(n/\log n)$ with constant around 1.55-1.65**.

### Implication

One of these three holds:
1. The simulation range is too small; $(\log\log n)^2$-type growth kicks in for $n > 10^9$.
2. T2's lower bound proof has a bug (it's labeled "pending formal audit").
3. The true rate is $\Theta(n/\log n)$, contradicting T2 asymptotically.

Round 17 Codex already showed the fan program gives AT MOST $n/(\log n)^{1-o(1)}$ when summed properly — consistent with option (3). The T2 proof should be re-audited; at the empirical scale where its $(\log\log n)^2$ factor should be visible, nothing drives $L$ above pure $n/\log n$.

### Recommended next dispatches

- **Audit T2's rank-2 fan proof** for an error in the $(\log\log n)^2$ multiplicative factor or its constant.
- **Attempt $L(n) \le c n/\log n$** as a direct target. Empirical data supports it with $c \approx 1.55-1.65$.
- If T2 is correct and $(\log\log n)^2$ is real: my simulation range is misleading; run at $n = 10^{12}$ or find a proof that exhibits the factor structurally.

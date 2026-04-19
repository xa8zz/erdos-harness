# Fresh session #1 — computational analysis + predicted lean L(n) = o(n) super-polylog

Looking at this problem, I need to carefully weigh the established rigorous results against the unresolved gap. Let me first do some computational verification.Now I have enough computational and theoretical grounding. Let me write up my analysis.

---

# Analysis of $L(n)$: Status of $\Theta(n)$ vs $o(n)$

## Short answer

**The sharp asymptotic rate of $L(n)$ is not determined by the established rigorous work above, and no reasoning available in my sandbox closes the gap.** Honest bounds:

$$
\boxed{\;c_h\cdot\dfrac{n(\log\log n)^h}{\log n}\;\le\;L(n)\;\le\;\left(\tfrac{5}{16}+o(1)\right)n\;}
$$

for every fixed $h\ge 1$, with $c_h\asymp 2^{-(2^{h+1}-2)}/h!$.

Between these, neither $L(n)=\Theta(n)$ nor $L(n)=o(n)$ is forced by anything in the dossier, and I cannot prove either here. Forced to guess from the weight of evidence I lay out below, I lean **$L(n)=o(n)$ — but growing faster than every $n(\log\log n)^C/\log n$** — i.e. the true rate sits strictly between the hierarchy's reach and any linear bound.

## The upper bound (rigorous)

The verified Shortener strategy — play the smallest legal odd prime for roughly $k=n/(2A\log n)$ turns, then follow any completion — yields $L(n)\le(5/16+o(1))n$. The proof uses:

- Chebyshev's bound to control the reciprocal sum $\sum 1/q_j \ge 1/A$ of those primes,
- the odd-part map $\phi(x)=x/2^{v_2(x)}$ to inject the post-prefix antichain into sieved odd integers,
- second-order Bonferroni with monotone $f(s)=1-s+s^2/2$ evaluated at $s\to 1/2$ (which is the tightest Prolonger can push via the universal block-product counter) giving $f(1/2)=5/8$ and the $5n/16$ constant.

This is the tightest explicit upper bound in the dossier; it is not known to be tight. In particular, the strategy's limit is exactly $5/16$ — going below it requires *breaking the odd-prime-prefix template*, which hasn't been done.

## The lower bound (rigorous up through the fixed-rank hierarchy)

The rigorous first-order theorem (four verified derivations) gives

$$L(n) \ge \left(\tfrac{1}{8}-o(1)\right)\frac{n\log\log n}{\log n}$$

via the odd upper-half fan $\mathcal{T}_1=\{ab : a\in\mathcal{A}, b\in J_a\cap\mathbb{P}\}$ and the max-degree capture lemma. This already refutes $L(n)=O(n/\log n)$.

The fixed-rank fan hierarchy extends this to

$$L(n) \ge c_h\,\frac{n(\log\log n)^h}{\log n}\quad\text{for every fixed }h\ge 1,$$

using the divisor-shadow lemma on the rank-$h$ target family $\mathcal{T}_h=\{A_S\cdot b : |S|=h,\ b\in J_S\cap\mathbb{P}\}\subseteq(n/2,n]$. The key structural mechanism is **upper-half auto-shielding**: since $A_S b>n/2$ has no proper multiple $\le n$, playing it globally kills all $2^{h+1}-2$ of its proper divisors in one move, and Shortener can destroy at most one proper divisor per turn. This ratifies the 2-vs-1, then $(2^{h+1}-2)$-vs-$1$ economy at rank $h+1$. The resulting constant $c_h\asymp 2^{-(2^{h+1}-2)}/h!$ is tight for the per-rank game-theoretic loss.

Consequence: **$L(n) \ne O\bigl(n(\log\log n)^C/\log n\bigr)$ for any fixed $C\ge 0$.**

## Why $\Omega(n)$ is not available from this machinery

The iterated per-rank bound gives

$$L(n) \ge \max_h\, c_h\,\frac{n(\log\log n)^h}{\log n} \ge \frac{n}{\log n}\cdot\exp\bigl(\Theta(\log\log\log n\cdot\log\log\log\log n)\bigr),$$

which is **strictly sub-linear**. The double-exponential game-theoretic cost $2^{-2^{h+1}}$ per rank catches up with $(\log\log n)^h/h!$ near $h\approx\log_2\log_2\log\log n$, capping the envelope.

A *uniform multi-rank shielding theorem* — single potential function coupling ranks in the window $h=\log\log n\pm O(\sqrt{\log\log n})$ with $O(1)$ total game-theoretic loss — would give $\Omega(n)$ by harvesting Stirling's peak $\max_h H^h/h!\sim\log n/\sqrt{\log\log n}$. Such a theorem would exploit that a single Prolonger play $A_S b$ shields divisors of targets at *every* rank whose small-core is a subset of $S$, i.e., exponentially many cross-rank divisor-stars. **This theorem is open.**

## Why the $5n/16$ upper bound cannot descend to $o(n)$ via current tools

Symmetrically, all Shortener strategies analyzed above are $\sigma(n)$-strategies whose output is forced below $\Theta(n)$ only against *specific* Prolonger behaviors. The universal block-product counter forces $\sum_{p\in B(P)}1/p \ge (1/2)\log\log n+O(1)$, capping the odd-prime-prefix approach at $5n/16$; no Shortener strategy in the dossier achieves asymptotic constant below $5/16$ against every Prolonger. The strict-truncation $13n/36$ and the $5n/16$ are the two tight points of the Bonferroni-sieve family.

## Numerical evidence and my assessment

I verified the minimax exactly via an alpha-beta solver up to $n=31$:

| $n$ | $L(n)$ | $L(n)/n$ |
|---|---|---|
| 15 | 7 | 0.467 |
| 20 | 9 | 0.450 |
| 25 | 11 | 0.440 |
| 27 | 11 | 0.407 |
| 30 | 13 | 0.433 |
| 31 | 14 | 0.452 |

The exact ratio *oscillates* in the range $[0.41,0.48]$ at these scales, consistent with the dossier's $[0.37,0.46]$ claim over $n\le 50$. The ratio does not monotonically decrease on small $n$; parity effects dominate.

The dossier's dynamical stress test at $n=10^6$ gives $L\log n/n\approx 1.17$ against best-known Prolonger strategies (not optimal). Critically, this quantity *decreases monotonically* from $1.29$ at $n=10^3$ to $1.17$ at $n=10^6$ — inconsistent with $L(n)=\Theta(n)$ against the tested Prolonger (which would require $L\log n/n$ growing linearly in $\log n$), and consistent with $L(n)=O(n/\log n)$ against that Prolonger. But this is not the minimax trajectory.

**Tension:** The exact small-$n$ data (ratios $\sim 0.4$, bounded away from $0$ through $n=50$) is consistent with $\Theta(n)$; the dynamical large-$n$ data (ratios $\sim 0.085$, best-known Prolonger failing linearity) is consistent with $o(n)$.

Both data types are partial evidence: small-$n$ effects can persist implausibly long under strong upper-half fan constructions; dynamical tests rely on suboptimal Prolonger. **Neither is conclusive.**

My lean, stated as a prediction rather than a theorem: the *true* rate is $L(n)=o(n)$ but *super-polylogarithmic* over $n/\log n$ — plausibly something like $n/(\log n)^{1-o(1)}$ or $n\cdot\exp(-c\sqrt{\log\log n})$ — with the sub-linearity being too slow for dynamical tests at $n=10^6$ to have settled. Equivalently: I expect a uniform multi-rank theorem pushing the lower bound past every fixed polylog-over-log, but falling short of linear, with a matching tightening of the Shortener strategy below $5/16$ eventually.

## Summary of what is rigorous

- **Upper bound:** $L(n)\le(5/16+o(1))n$, hence $L(n)=O(n)$.
- **Lower bound:** $L(n)\ge c_h\cdot n(\log\log n)^h/\log n$ for every fixed $h$, hence $L(n)\ne O(n(\log\log n)^C/\log n)$ for every fixed $C$.
- **Gap:** Whether $L(n)=\Theta(n)$ or $L(n)=o(n)$ is not decidable from the dossier. Closing it in either direction requires a genuinely new tool (uniform multi-rank shielding for linear lower bound; sub-$5/16$ Shortener breaking the odd-prime-prefix template for strict $o(n)$ upper bound).

I can't honestly claim the binary resolution this question requests — the mathematics as presented doesn't yet support it.

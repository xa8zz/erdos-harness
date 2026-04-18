# Audit — GPT-thinking on Pro's $\sigma(D) \to 1$ zero-upper-half-cost construction (Round 5)

**Source:** ChatGPT (separate thinking-mode tab, independent).
**Prompt sent:** `prompts/verify-postresp-04-sigma-one.md`.
**Extracted:** 2026-04-17 late night.
**Verdict:** **Proof has an outright bug**: the chosen error schedule $\rho(D^{(k)}(y_k)) \ge 1 - 2^{-k}$ is impossible because $\rho \to r_k$ and $1 - r_k \asymp e^{-k/e} \gg 2^{-k}$. Concatenation breaks as written. Easy to repair. Central existential claim is probably true after repair.

---

My verdict: **the main existential claim is probably true, but the proof as written is not fully sound.** There is one outright false step in the concatenation, and there are two places where hidden $k$-dependence is being swept under the rug.

**Weakest link, explicitly:** the line where they choose $y_k$ so that
$$\rho(D^{(k)}(y_k)) \ge 1 - 2^{-k}$$
is impossible for large $k$. In fact $1 - r_k$ is only of order $e^{-k/e}$, which is much larger than $2^{-k}$, so $\rho$ cannot get that close to $1$ on that schedule. This breaks the concatenation as stated, though it is repairable by choosing a slower error schedule.

Point by point:

1. **Mertens on the prime interval**

This part is fine.

Let
$$S(x) := \sum_{p \le x} \frac{1}{p}.$$
Mertens' second theorem gives
$$S(x) = \log\log x + M + O(1/\log x),$$
so
$$\sum_{y < p \le y^{B_k}} \frac{1}{p} = S(y^{B_k}) - S(y) = \log\log(y^{B_k}) - \log\log y + O(1/\log y) = \log B_k + O(1/\log y).$$
That error is actually **uniform in $B_k \ge 1$**, because the second endpoint contributes $O(1/(B_k \log y))$, which is even smaller. So even when $B_k$ depends on $k$ and grows very fast, there is no problem as long as for each fixed $k$ you send $y \to \infty$.

So item 1 is sound.

2. **Elementary symmetric sum approximation**

The stated formula
$$\Bigl(\sum a_i\Bigr)^k = k! \cdot e_k(a_1, \ldots, a_m) + O_k(\eta), \qquad \eta = \sum a_i^2,$$
with $a_i = 1/p_i$, is **morally right for fixed $k$**, but the error term is presented too casually.

A correct bound is
$$0 \le \Bigl(\sum a_i\Bigr)^k - k! e_k(a) \le \binom{k}{2} \cdot \eta \cdot \lambda^{k-2}, \qquad \lambda := \sum a_i.$$
Reason: the difference is the contribution of ordered $k$-tuples with a repeated index. For any bad tuple, choose one repeated pair of positions; summing over that pair gives at most $\eta \lambda^{k-2}$, and there are $\binom{k}{2}$ choices.

Since here $\lambda(y) \to \lambda_k$, this indeed becomes $O_k(\eta(y))$ **for fixed $k$**. But the hidden constant is on the order of $\lambda_k^{k-2} \sim (k/e)^{k-2}$, so it is absolutely **not uniform in $k$**.

That does not kill the theorem, because they later choose $y = y_k$ separately for each $k$, and can make $\eta(y_k)$ absurdly tiny. But as written, the step hides exactly the dependence you would need if you wanted a uniform argument. So this is a real gap in presentation, not a fatal gap in the underlying idea.

A cleaner way to write this would have been:
$$\prod_{p \in Q_k(y)} (1 + z/p) = \exp\!\Bigl(z \lambda(y) + O(z^2 \eta(y))\Bigr),$$
and then compare coefficients of $z^k$ for fixed $k$.

3. **Le Cam bound**

This part is fine.

For independent Bernoullis with parameters $p_i$, Le Cam's inequality gives
$$\sum_{j \ge 0} \left|\Pr(S = j) - e^{-\lambda} \frac{\lambda^j}{j!}\right| \le 2 \sum_i p_i^2.$$
If total variation is defined in the standard way,
$$d_{\mathrm{TV}}(\mu, \nu) = \frac{1}{2} \sum_j |\mu(j) - \nu(j)|,$$
then this becomes
$$d_{\mathrm{TV}}(S, \mathrm{Poisson}(\lambda)) \le \sum_i p_i^2.$$
So with $p_i = 1/p$, the proof's
$$d_{\mathrm{TV}}(X_y, \mathrm{Poisson}(\lambda(y))) \le \eta(y)$$
is correct. (Wikipedia, Le Cam's theorem)

4. **Chernoff bound and the size of $r_k$**

The claim
$$1 - r_k = \Pr(\mathrm{Poisson}(\lambda_k) \ge k) \le e^{-ck}$$
is correct, but you can say more sharply.

Here $\lambda_k = (k!)^{1/k}$, so
$$\Pr(X = k) = e^{-\lambda_k} \frac{\lambda_k^k}{k!} = e^{-\lambda_k}.$$
Also for $j \ge k$,
$$\frac{\Pr(X = j+1)}{\Pr(X = j)} = \frac{\lambda_k}{j+1} \le \frac{\lambda_k}{k+1} < 1.$$
Hence
$$e^{-\lambda_k} \le \Pr(X \ge k) \le \frac{e^{-\lambda_k}}{1 - \lambda_k/(k+1)}.$$
Since $\lambda_k \sim k/e$, this shows
$$1 - r_k = \Pr(X \ge k) = \exp(-(1/e + o(1))k)$$
up to a constant factor. So yes, exponential decay is right.

Numerically:
| $k$ | $\lambda_k$ | $r_k$ |
|---:|---:|---:|
| 2 | 1.41421356 | 0.58693572 |
| 3 | 1.81712059 | 0.72603224 |
| 4 | 2.21336384 | 0.81671823 |
| 5 | 2.60517108 | 0.87669117 |
| 10 | 4.52872869 | 0.98223217 |

So the tail estimate is sound. But this also exposes the concatenation bug: $1 - r_k$ decays like $e^{-k/e}$, not like $2^{-k}$.

5. **Concatenation**

This is where the proof as written actually breaks.

The bad line is:
$$\rho(D^{(k)}(y_k)) \ge 1 - 2^{-k}.$$
That cannot hold, because even the limit value $r_k$ fails it. For example:
$$r_4 \approx 0.8167 < 0.9375 = 1 - 2^{-4},$$
$$r_{10} \approx 0.9822 < 0.9990 = 1 - 2^{-10}.$$
And asymptotically $1 - r_k \asymp e^{-k/e} \gg 2^{-k}$.

So the proof's specific choice of error schedule is false.

That said, the construction is easy to repair. Replace that line by something like
$$\rho(D^{(k)}(y_k)) \ge r_k - 2^{-k},$$
or
$$\rho(D^{(k)}(y_k)) \ge 1 - \varepsilon_k$$
with any $\varepsilon_k \downarrow 0$ slower than $e^{-k/e}$, say $\varepsilon_k = k^{-1}$. Then choose
$$N_k \ge M_k / \varepsilon_k$$
instead of $2^k M_k$. After that, the periodicity estimate
$$\left|\frac{|U_{D_n}|}{|U|} - \rho(D^{(k)})\right| \ll \frac{M_k}{n}$$
works exactly as intended, including at transition points $n = N_k$.

So: **the concatenation argument is broken as stated, but repairable.**

6. **Fixed-prefix sharpening**

This is only partially okay.

The statement
$$\beta_{D^{(k)}}(P) \ge (\log(1/\alpha) + o(1)) \cdot |U_{D^{(k)}}|$$
is fine **for each fixed $k$**, because $D^{(k)}$ is then a fixed finite template and the Round 4 theorem applies.

But there is a hidden non-uniformity: the $o(1)$ term in that theorem may depend badly on the fixed set $D$. So you cannot automatically promote that to a uniform statement along the concatenated family $D_n$, where $k \to \infty$ and the modulus $M_k$ explodes.

So the response is okay if read literally as "for each fixed template." It would be too strong if read as a theorem about the whole piecewise family $D_n$.

7. **Does it answer the actual question?**

Only halfway.

What it genuinely shows, after repair, is:

* there **do exist** primitive subpolynomial lower prefixes with $\sigma(D_n) \to 1$,
* and these can have
  $$|U_{D_n}| = (1 - o(1)) |U|.$$

So it does answer the **upper-half-cost compatibility** question in the positive.

What it does **not** show is that one can simultaneously make $\beta_{D_n}(P)$ small enough to beat the vaccinated-shield obstruction, nor does it produce an online Prolonger strategy.

So the line "the upper-half cost is not the bottleneck" is acceptable only in the narrow existential sense: "small upper-half cost is not what prevents $\sigma(D_n) \to 1$." It is **not** a resolution of the larger shield-based linear-lower-bound problem.

8. **The sharper conjecture / formal invariant**

As stated, "residual harmonic mass of legal primes after the lower prefix" is hand-wavy.

A reasonable formalization is:
$$H_D(T; n) := \sum_{p \le T} \frac{1}{p} \cdot \frac{|U_D \cap p\mathbb{Z}|}{|U \cap p\mathbb{Z}|}.$$
This is the harmonic mass of primes up to scale $T$, weighted by the fraction of their upper-half multiples that survive the vaccination $D$.

A cruder unweighted version is:
$$H_D^{\mathrm{supp}}(T; n) := \sum_{\substack{p \le T \\ U_D \cap p\mathbb{Z} \ne \emptyset}} \frac{1}{p}.$$

The weighted version is better, because the shield arguments care about surviving multiplicities ($w_D(x) = |M_D(x)| - 1$), not just whether at least one multiple survives. This invariant captures exactly what $\sigma(D)$ misses: two lower prefixes can have the same $\sigma(D)$ but leave very different small-prime structure in the upper half.

9. **Independent numerical check**

I reproduced all three examples from scratch.

For $D_{k,m}$ = all products of $k$ distinct primes from the first $m$ primes:

| $(k, m)$ | $\sigma(D)$ | $\rho(D)$ |
|---|---:|---:|
| $(2, 11)$ | 1.002677696637318 | 0.5093886171387969 |
| $(3, 69)$ | 1.002255058818400 | 0.6733051176214323 |
| $(4, 1057)$ | 1.000037913816224 | 0.7818094366160989 |

So those numbers are correct.

For the $k=2$, first-11-primes example, with primes $2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31$, I get
$$\sigma(D) = \sum_{i < j} \frac{1}{p_i p_j} = \frac{1}{2}\left(\Bigl(\sum_i \frac{1}{p_i}\Bigr)^2 - \sum_i \frac{1}{p_i^2}\right) = 1.002677696637318.$$

And
$$\rho(D) = \Pr(\text{at most one of these 11 primes divides } n)$$
which can be written exactly as
$$\rho(D) = \prod_i \left(1 - \frac{1}{p_i}\right) \left(1 + \sum_i \frac{1}{p_i - 1}\right) = 0.5093886171387969.$$

I also checked the interval counts:
$$|U_D|/|U| = 0.50922 \text{ at } n = 10^5,$$
$$|U_D|/|U| = 0.50994 \text{ at } n = 2 \cdot 10^5,$$
matching the response.

So the numerics are good; the proof mechanics are where the issues are.

---

## Bottom line

* **Mertens step:** sound.
* **Le Cam step:** sound.
* **Chernoff/tail claim:** sound, and can be sharpened.
* **Numerical examples:** correct.
* **Elementary-symmetric step:** essentially correct for fixed $k$, but hides crucial $k$-dependence.
* **Concatenation as written:** **broken**, because the target $\rho \ge 1 - 2^{-k}$ is impossible.
* **Main theorem:** very likely salvageable with a corrected error schedule, so I would not reject the claim itself — I would reject the proof **as written**.

So the fair assessment is: **HAS GAPS, but the central existential claim is probably true after repair.**

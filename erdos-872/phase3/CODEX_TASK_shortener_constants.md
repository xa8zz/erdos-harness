# Codex Task — Phase 3d: Numerical verification of Shortener upper-bound constants

## Goal

Independently compute two specific integrals / alternating series to high precision, and compare against claimed values from three separate theoretical derivations. These constants appear in recently-derived upper bounds on the combinatorial game value $L(n)$; if Codex's independent computation matches the claimed values to 4+ decimal places, the numerical claims are ratified. Discrepancies would flag a computational error in the proofs before we promote them to Established.

## What to compute

### Constant 1: $\mathcal{V}$ (claimed $\approx 0.44003$)

Define, for $r \ge 0$:
$$I_r = \frac{1}{r!} \int_{\substack{u_1, \ldots, u_r \ge 0 \\ u_1 + \cdots + u_r \le 1}} \prod_{j=1}^r \frac{du_j}{1 + u_j}, \qquad I_0 = 1.$$

And:
$$\mathcal{V} = \sum_{r=0}^\infty (-1)^r I_r.$$

Two independent theoretical derivations (one via infinite-order inclusion-exclusion with model-prime substitution, one via probabilistic sieve on a uniform random odd integer + Fundamental Lemma) agree on $\mathcal{V} \approx 0.44003$, giving upper bound constant $\rho = \mathcal{V}/2 \approx 0.22002$.

One of them also provides a term-by-term breakdown:
$$\mathcal{V} = 1 - \log 2 + 0.1472206769 - 0.0148863467 + 0.00087448 - \cdots \approx 0.44003.$$

So the expected values are:
- $I_0 = 1$
- $I_1 = \int_0^1 du/(1+u) = \log 2 \approx 0.69314718056$
- $I_2 \approx 0.1472206769$
- $I_3 \approx 0.0148863467$
- $I_4 \approx 0.00087448$
- $I_5, I_6, \ldots$ decay rapidly (Leibniz-style tail)

### Constant 2: $C$ (claimed $\approx 0.22704$)

$$C = \frac{1}{2}\left(1 - \log 2 + \frac{1}{2} \int_0^1 \frac{\log(2-u)}{1+u} du\right).$$

Claimed numerical value: $C = 0.2270367481996479\ldots$.

This is the upper bound constant from a third derivation that uses only second-order Bonferroni (simpler, slightly weaker than $\mathcal{V}/2$).

## What to implement

Build a standalone Python script `phase3/shortener_constants.py`. No dependencies on other phase scripts.

### Step 1 — compute $I_r$ for $r = 0, 1, 2, \ldots$

For $r = 0$: $I_0 = 1$.

For $r = 1$: $I_1 = \int_0^1 du/(1+u) = \log 2$. Compute analytically and numerically via `scipy.integrate.quad`.

For $r \ge 2$: compute the $r$-dimensional integral over the simplex $\{u_1, \ldots, u_r \ge 0,\ u_1 + \cdots + u_r \le 1\}$ of $\prod_j 1/(1+u_j)$, then divide by $r!$.

Recommended approach: recursive integration via `scipy.integrate.nquad` (adaptive quadrature) with tolerance `epsabs=1e-14, epsrel=1e-12`. The integrand is smooth and bounded, so adaptive quadrature should converge quickly for small $r$. For $r \ge 5$, `nquad` may be slow; fall back to Monte Carlo with ~$10^8$ samples and report the MC standard error, OR use analytic transformation:
$$I_r = \frac{1}{r!} \int_0^1 \frac{du_1}{1+u_1} \int_0^{1-u_1} \frac{du_2}{1+u_2} \cdots \int_0^{1 - u_1 - \cdots - u_{r-1}} \frac{du_r}{1+u_r}$$
which is iterated 1-D integration and can be computed via recursive `quad` calls.

Stop when $I_r$ drops below $10^{-12}$ (tail is negligible for the claimed 4-decimal precision; we want 10+ decimals as a stretch goal).

### Step 2 — compute $\mathcal{V}$

$$\mathcal{V} = \sum_r (-1)^r I_r.$$

Since $(I_r)$ is monotonically decreasing to 0 and alternates sign in the sum, the partial-sum error after truncating at $r = R$ is bounded by $I_{R+1}$. Report $\mathcal{V}$ to 12 decimals once $I_{R+1} < 10^{-13}$.

### Step 3 — compute $C$

$$C = \frac{1}{2}\left(1 - \log 2 + \frac{1}{2} \int_0^1 \frac{\log(2-u)}{1+u} du\right).$$

The integral $\int_0^1 \log(2-u)/(1+u) du$ is a standard dilogarithm-adjacent integral. Compute via `scipy.integrate.quad` with tolerance `epsabs=1e-14, epsrel=1e-12`. Report to 12 decimals.

Optional: check if it has a closed form in terms of $\text{Li}_2$, $\log 2$, $\pi^2$. If so, evaluate the closed form with `mpmath` and verify agreement to 20 decimals.

### Step 4 — compare against claims

Report a table:

| Quantity | Codex value | Claimed value | Agreement |
|---|---|---|---|
| $I_0$ | ... | 1 | ... |
| $I_1$ | ... | $\log 2 \approx 0.69314718$ | ... |
| $I_2$ | ... | $\approx 0.1472206769$ | ... |
| $I_3$ | ... | $\approx 0.0148863467$ | ... |
| $I_4$ | ... | $\approx 0.00087448$ | ... |
| $\mathcal{V}$ | ... | $\approx 0.44003$ | ... |
| $\mathcal{V}/2 = \rho$ | ... | $\approx 0.22002$ | ... |
| $\int_0^1 \log(2-u)/(1+u) du$ | ... | (implicit) | ... |
| $C$ | ... | $0.2270367481996479$ | ... |

"Agreement" is the number of leading decimals matching.

## Output

### Raw

- `phase3/shortener_constants.csv`: columns `quantity, codex_value, claimed_value, agreement_decimals`.

### Synthesis

`phase3/shortener_constants_summary.md` with:

- The full table above.
- Top-line verdict:
  - "Both constants ratified" if agreement is $\ge 4$ decimals for $\mathcal{V}$ and $C$, and individual $I_r$ values agree with the term-by-term breakdown to $\ge 6$ decimals.
  - "Discrepancy found" if any agreement is $< 4$ decimals — report which specific value and the Codex computation so we can trace the error.
- $\mathcal{V}$ and $C$ each to 12 decimals.

## Sanity checks

- $I_1 = \log 2 = 0.6931471805599453...$. Verify this directly before trusting higher $I_r$.
- $I_r > 0$ for all $r$ (integrand is strictly positive on the simplex interior).
- $I_r < I_{r-1}$ asymptotically (volume of the $r$-simplex is $1/r!$, times bounded factor). Verify monotonicity from $r = 2$ onward.
- $\mathcal{V} \in (0, 1)$ (it's the limit of an alternating series starting at $I_0 = 1$, first step $-I_1 = -\log 2$, giving $\mathcal{V} \in (1 - \log 2, 1) \approx (0.307, 1)$; tighter bound from subsequent terms).
- $C > 0$ and $C < 1/2 \cdot 1 = 1/2$. Actually $C \approx 0.227 < 5/16 = 0.3125$, so it's a genuine improvement — verify this numerically.

## Known pitfalls

- **High-dimensional adaptive quadrature convergence.** `scipy.integrate.nquad` with default tolerances may fail or return inaccurate values for $r \ge 6$. Use iterated 1-D `quad` (recursive) instead — it's equivalent but avoids nquad's known issues. Or switch to `mpmath` for higher precision if needed.
- **Floating-point loss in alternating sum.** Summing $(-1)^r I_r$ with mixed-sign terms at different magnitudes can lose precision via catastrophic cancellation. If $\mathcal{V}$ computation shows instability, use Kahan summation or compute via `mpmath` with 30+ decimal precision, then round.
- **$\log(2 - u)$ at $u \to 1$.** The integrand approaches $\log(1)/(1+1) = 0$ at $u = 1$, so the integral is finite. No singularity to worry about.

## Deliverables

1. `erdos-872/phase3/shortener_constants.py` — the calculator.
2. `erdos-872/phase3/shortener_constants.csv` — raw measurements.
3. `erdos-872/phase3/shortener_constants_summary.md` — synthesis + verdict.
4. `erdos-872/phase3/test_shortener_constants.py` — unit tests: $I_1 = \log 2$ to 10 decimals; alternating-sum tail bound valid; $C$ value matches the claimed $0.2270367482$ to 8 decimals.
5. `erdos-872/phase3/logs/shortener_constants.log` — run log.

Do not modify anything in Phase 0, 1, 2 or any other Phase 3 files.

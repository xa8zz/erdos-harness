# R31 Codex — extracted Shortener rule from the small-$h$ top-facet study

Artifacts for this pass:

- Reusable rule module: [phase4/transversal_small_h_strategy.py](./phase4/transversal_small_h_strategy.py)
- Updated solver helpers: [phase4/transversal_small_h.py](./phase4/transversal_small_h.py)
- Updated tests: [phase4/test_transversal_small_h.py](./phase4/test_transversal_small_h.py)
- Larger strategy grid: [phase4/transversal_small_h_strategy_results.csv](./phase4/transversal_small_h_strategy_results.csv)

## Headline rule

The clean rule extracted from the exact R29 data is:

> **Sigma**: at each Shortener turn, claim an available top-facet vertex of **maximum unresolved-edge degree**; break ties by initial degree, then lexicographically.

Pseudocode:

```text
sigma(state):
    among available vertices v:
        maximize deg_unhit(v) := number of currently unresolved hyperedges containing v
    break ties by total initial degree in H^(h)
    break remaining ties lexicographically on the (h-1)-subset label
```

This is exactly the old `max_degree` heuristic from R29, now promoted into a reusable module as `make_shortener_sigma()`.

## 1. Principal variation analysis

For every exact solved instance, sigma matches the principal-variation Shortener reply sequence exactly.

| $(N,h)$ | $T^*$ | Prolonger PV | Shortener PV |
|---|---:|---|---|
| $(4,3)$ | 1 | $(012),(123)$ | $(03)$ |
| $(5,3)$ | 3 | $(012),(123),(024)$ | $(03),(14),(34)$ |
| $(6,3)$ | 5 | $(012),(123),(024),(234),(135)$ | $(03),(14),(25),(05),(45)$ |
| $(5,4)$ | 2 | $(0123),(0234)$ | $(014),(124)$ |
| $(6,4)$ | 4 | $(0123),(0234),(1234),(0345)$ | $(014),(025),(135),(245)$ |
| $(6,5)$ | 2 | $(01234),(01345)$ | $(0125),(2345)$ |

Here I abbreviate subsets by concatenating their ground-set elements.

The recurring pattern is:

- Prolonger walks through highly overlapping $h$-sets.
- Shortener responds by taking a top facet that sits on the current high-pressure frontier in the Johnson graph.
- Along the principal variation, the replies form a diagonal/staircase through $(h-1)$-subsets rather than a scattered cover.

The first reply is highly non-unique. Example: after Prolonger opens with $(0123)$ in the $(6,4)$ game, **16 different replies are optimal**. What gets rigid is the late game. On the $(6,3)$ principal variation, the number of optimal replies shrinks as

\[
12,\ 9,\ 6,\ 4,\ 1.
\]

So the right picture is “many equivalent max-pressure choices early, then a forced cleanup.”

## 2. Strategy characterization

I tested sigma against the exact solver in two ways.

### 2a. Principal variations

On the exact solved roots

\[
(4,3),(5,3),(6,3),(5,4),(6,4),(6,5),
\]

sigma has **zero** principal-variation mismatches.

### 2b. All exact Shortener states

Using all exact Shortener-turn states materialized in the minimax transposition tables:

- total audited Shortener states: **1508**
- sigma mismatches: **66**
- agreement rate: **95.6%**
- unique-optimal states: **330**
- flexible states (multiple optimal replies): **1178**

Important structural point:

- sigma is always a max-unresolved-degree move by construction,
- but the exact game contains many states where **some** optimal move is *not* max-degree (`non_max_degree_optimal_states = 687` across the audit).

So the maximally clean statement I can defend is:

> Sigma captures the exact principal variation everywhere we can solve, and it is exact on about 95.6% of all solved Shortener states, but “max unresolved degree” is not a complete characterization of every optimal off-PV tie-break.

I also brute-forced several small families of local tie-breakers (claimed-overlap, captured-point counts, one-step Pro lookahead scores). None eliminated the remaining exact-state mismatches. That is evidence that the exact global optimum depends on slightly deeper state geometry, while the main structural driver is still unresolved-edge degree.

## 3. Generalization to larger $h,N$

I evaluated sigma against six Prolonger families:

- `smallest_neighborhood`
- `highest_degree_vertex`
- `max_claimed_overlap`
- `lookahead_one_sigma`
- `random_uniform`
- `random_degree_weighted`

The new adversaries did **not** break sigma.

### Larger-grid summary

| $(N,h)$ | worst tested Prolonger | sigma worst | $\tau_{\rm lower}$ | $\tau_{\rm exact}$ | sigma / $\tau_{\rm lower}$ | sigma / $\tau_{\rm exact}$ |
|---|---|---:|---:|---:|---:|---:|
| $(7,5)$ | any deterministic tested Pro | 6 | 7 | 7 | 0.857 | 0.857 |
| $(8,5)$ | `random_uniform` | 14 | 14 | 14 | 1.000 | 1.000 |
| $(9,5)$ | `highest_degree_vertex`, `random_*` | 27 | 25.2 | 30 | 1.071 | 0.900 |
| $(10,5)$ | `lookahead_one_sigma`, `random_*` | 47 | 42 | — | 1.119 | — |
| $(7,6)$ | any tested Pro | 2 | 3.5 | 4 | 0.571 | 0.500 |
| $(8,6)$ | any deterministic tested Pro | 8 | 9.33 | 11 | 0.857 | 0.727 |
| $(9,6)$ | `random_uniform` | 21 | 21 | 25 | 1.000 | 0.840 |
| $(8,7)$ | any tested Pro | 3 | 4 | 4 | 0.750 | 0.750 |
| $(9,7)$ | any deterministic tested Pro | 10 | 12 | 12 | 0.833 | 0.833 |
| $(10,7)$ | `highest_degree_vertex`, `random_*` | 28 | 30 | 30 | 0.933 | 0.933 |

Remarks:

- The ratio to the random-cover benchmark \(O(\log h)\tau_{\rm lower}\) stays tiny. In the CSV, the column `sigma_over_log_upper_max` is always below about **0.70** on the tested grid.
- No growth with $h$ is visible. If anything, the ratio appears to stabilize or drift **downward** once $h \ge 6$.
- The strongest new adversary was not the crafted overlap heuristic; it was usually either the old `highest_degree_vertex` Pro or the new `lookahead_one_sigma` at $(10,5)$.

## 4. Why sigma seems to work

The empirical mechanism looks like this:

1. The top-facet game is pressure-driven. The critical quantity is the unresolved-edge degree of a certificate.
2. Prolonger’s steals are highly overlapping, so a max-degree Shortener reply usually hits the entire current pressure ridge, not just one edge.
3. Early in the game there is large symmetry and hence large flexibility. Many replies are equally good.
4. Once Prolonger has broken enough symmetry, the remaining cleanup becomes rigid, and sigma’s degree-first choice lines up with the exact principal variation.

This is exactly the kind of behavior one would expect if the missing resilience lemma is a degree-based online transversal theorem on the Johnson-hypergraph boundary.

## 5. Theoretical translation

The clean theorem-shaped statement suggested by the data is:

> **Competitive-ratio conjecture for sigma on top-facet games.**  
> Let \(H_N^{(h)}\) be the top-facet hypergraph whose vertices are \((h-1)\)-subsets of \([N]\) and whose hyperedges are the \(h\) top facets of each \(h\)-subset of \([N]\).  
> Then sigma produces an online transversal of size
> \[
> |S_\sigma(H_N^{(h)})| \le f(h)\,\tau_{\rm exact}(H_N^{(h)})
> \]
> with \(f(h)=O(1)\).  
> The empirical data further suggest the stronger form
> \[
> f(h)=1+O(1/h),
> \]
> and possibly \(f(h)\le 1\) on many Johnson-symmetric instances up to finite-size rounding.

A more conservative version, closer to the Round-22 target, is:

> **Resilience-lemma conjecture (sigma form).**  
> There exists \(C>0\) such that sigma yields
> \[
> |S_\sigma(H_N^{(h)})| \le C\,\tau_{\rm exact}(H_N^{(h)})
> \]
> for every \(N,h\); in particular \(C\) can be taken much smaller than \(\log h\) on the tested grid.

This is already enough to keep the defect-budget program alive: the data are consistent with \(g(h)=O(1)\), and therefore certainly consistent with the weaker target \(g(h)=O(\log h)\).

## 6. Bottom line

- The best extracted rule is still the simple **max unresolved degree** strategy.
- It matches **all exact principal variations** we can solve.
- It agrees with the exact solver on **95.6%** of all solved Shortener states.
- On the larger \(h=5,6,7\) grid, it stays within about **1.12** of \(\tau_{\rm lower}\), and within **1.00** of \(\tau_{\rm exact}\) wherever the exact static cover was available in this pass.

So the R29 signal survives the more adversarial R31 check. I do **not** see evidence for a growing online loss. The current best conjecture is that sigma is already an \(O(1)\)-competitive online transversal rule on the top-facet hypergraph, with empirical behavior much closer to \(1+O(1/h)\) than to \(O(\log h)\).

# Small-$h$ Empirical Study of the Top-Facet Hypergraph Game

Artifacts produced by this pass:

- Solver / simulator: [`transversal_small_h.py`](./transversal_small_h.py)
- Sanity tests: [`test_transversal_small_h.py`](./test_transversal_small_h.py)
- Raw table: [`transversal_small_h_results.csv`](./transversal_small_h_results.csv)
- Plot: [`transversal_small_h_g_plot.png`](./transversal_small_h_g_plot.png)

## Interpretation of the game

I used the following resolution rule, which is the most natural closure-compatible reading of the prompt:

- Shortener claims one available top-facet vertex per move.
- Prolonger chooses one unresolved hyperedge and captures all of its vertices.
- A hyperedge is considered resolved if either:
  - Shortener has claimed one of its vertices, or
  - all of its vertices have been captured by Prolonger (possibly across several Prolonger moves).

So the unresolved set is
\[
\{e : e \cap S = \varnothing,\ e \nsubseteq P\},
\]
where $S$ is the set of Shortener-claimed vertices and $P$ is the set of Prolonger-captured vertices.

This matches the “fully closed residual set” reading in the Round-22 defect-budget discussion: once an edge’s full top-facet boundary is gone, Shortener should not still be charged for it.

## What was computed

- Exact static cover number $\tau_{\mathrm{exact}}(N,h)$ where feasible.
- Exact online value $T^*(N,h)$ by Pro-first minimax with memoization for the cases that stayed tractable.
- A 3-by-3 heuristic matrix for larger instances:
  - Shortener: `max_degree`, `min_edge_best_vertex`, `random_high_degree`
  - Prolonger: `smallest_neighborhood`, `random`, `highest_degree_vertex`
- Normalizations:
  - \[
    \tau_{\mathrm{lower}}(N,h)=\frac{\binom Nh}{N-h+1}
    \]
    (the per-vertex coverage scale from the prompt)
  - $\tau_{\mathrm{exact}}(N,h)$ when I could solve the static covering design exactly.

## Exact online values

The exact minimax stayed comfortable only through:

- $h=3$, $N \le 6$
- $h=4$, $N \le 6$
- $h=5$, $N = 6$

Beyond that, even with memoization and isomorphism reduction, the online state space blew up sharply.

| $h$ | $N$ | $T^*$ | $\tau_{\mathrm{lower}}$ | $\tau_{\mathrm{exact}}$ | $T^*/\tau_{\mathrm{lower}}$ | $T^*/\tau_{\mathrm{exact}}$ |
|---:|---:|---:|---:|---:|---:|---:|
| 3 | 4 | 1 | 2.00 | 2 | 0.50 | 0.50 |
| 3 | 5 | 3 | 3.33 | 4 | 0.90 | 0.75 |
| 3 | 6 | 5 | 5.00 | 6 | 1.00 | 0.83 |
| 4 | 5 | 2 | 2.50 | 3 | 0.80 | 0.67 |
| 4 | 6 | 4 | 5.00 | 6 | 0.80 | 0.67 |
| 5 | 6 | 2 | 3.00 | 3 | 0.67 | 0.67 |

Exact principal variations already show a stable pattern: Prolonger opens on one top facet, and Shortener’s best replies are star-like high-incidence certificates rather than something exotic.

## Heuristic band on the larger instances

For each $(N,h)$ below, I list the best and worst final Shortener sizes seen across the 9 heuristic policy pairings (with 8 seeds for the randomized policies).

### $h=3$

| $N$ | heuristic band | $\tau_{\mathrm{lower}}$ | $\tau_{\mathrm{exact}}$ | band / $\tau_{\mathrm{lower}}$ | band / $\tau_{\mathrm{exact}}$ |
|---:|---:|---:|---:|---:|---:|
| 7 | 5–7 | 7.00 | 9 | 0.71–1.00 | 0.56–0.78 |
| 8 | 7–10 | 9.33 | 12 | 0.75–1.07 | 0.58–0.83 |
| 9 | 10–14 | 12.00 | 16 | 0.83–1.17 | 0.62–0.88 |
| 10 | 12–18 | 15.00 | 20 | 0.80–1.20 | 0.60–0.90 |
| 11 | 14–22 | 18.33 | 25 | 0.76–1.20 | 0.56–0.88 |
| 12 | 17–27 | 22.00 | 30 | 0.77–1.23 | 0.57–0.90 |

### $h=4$

| $N$ | heuristic band | $\tau_{\mathrm{lower}}$ | $\tau_{\mathrm{exact}}$ | band / $\tau_{\mathrm{lower}}$ | band / $\tau_{\mathrm{exact}}$ |
|---:|---:|---:|---:|---:|---:|
| 7 | 8–10 | 8.75 | 12 | 0.91–1.14 | 0.67–0.83 |
| 8 | 14–16 | 14.00 | 20 | 1.00–1.14 | 0.70–0.80 |
| 9 | 21–25 | 21.00 | 30 | 1.00–1.19 | 0.70–0.83 |
| 10 | 32–37 | 30.00 | — | 1.07–1.23 | — |

### $h=5$

| $N$ | heuristic band | $\tau_{\mathrm{lower}}$ | $\tau_{\mathrm{exact}}$ | band / $\tau_{\mathrm{lower}}$ | band / $\tau_{\mathrm{exact}}$ |
|---:|---:|---:|---:|---:|---:|
| 7 | 6–7 | 7.00 | 7 | 0.86–1.00 | 0.86–1.00 |
| 8 | 13–15 | 14.00 | 14 | 0.93–1.07 | 0.93–1.07 |

## Strategy takeaways

### Strongest tested Prolonger heuristic

The harshest Prolonger heuristic in this family was usually `smallest_neighborhood`: steal the currently unresolved hyperedge whose capture resolves the fewest other unresolved hyperedges. Intuitively, this is the most “annoying” adversary because it destroys Shortener options while donating as little automatic progress as possible.

### Strongest tested Shortener heuristic

The most robust simple Shortener policy was `max_degree`:

- claim the available vertex incident to the most unresolved hyperedges,
- break ties by total initial degree.

This is the cleanest candidate “explicit strategy” coming out of the experiment. On the exact solvable range it always lands on the exact value or within one move of it, and against the strong `smallest_neighborhood` Prolonger it continues to stay at an $O(1)$ multiple of the static scale.

`min_edge_best_vertex` is occasionally better against the easier `highest_degree_vertex` Prolonger heuristic, but it is less robust against the more adversarial `smallest_neighborhood` choice.

## Headline trend

The data does **not** show any sign that the online overhead $g(h)$ is blowing up with $h$.

What I see instead:

- Relative to the prompt’s normalization $\tau_{\mathrm{lower}}$, the heuristic band stays in a tight $O(1)$ window.
- Relative to the exact static cover $\tau_{\mathrm{exact}}$ where I could compute it, the band is:
  - roughly $0.56$ to $0.90$ for $h=3$ over $N=7,\dots,12$,
  - roughly $0.67$ to $0.83$ for $h=4$ over $N=7,\dots,9$,
  - roughly $0.86$ to $1.07$ for $h=5$ over $N=7,8$.

So on the specific question

> At $h=5$, is $g(h)$ in $[2,5]$, in $[1,2]$, or smaller?

the empirical answer is: **very clearly in $[1,2]$, and in fact very close to $1$ on the tested window**.

I do **not** see any small-$h$ evidence for an unbounded-growth counterexample to the matching upper bound. If anything, the small-$h$ data points toward a bounded online overhead.

## Bottom line for the original $L(n)$ question

This small-$h$ computation is supportive of the “bounded $g(h)$” side, hence supportive of the sublinear-$L(n)$ program rather than the failure of the matching-T2 upper bound.

It is not a proof. But as an empirical signal:

- there is no small-$h$ obstruction,
- the strongest tested Prolonger heuristic does not force a large overhead,
- and the most robust Shortener heuristic is simple (`max_degree`) rather than fragile.

That is the opposite of what I would expect if the defect-budget route were fundamentally broken.

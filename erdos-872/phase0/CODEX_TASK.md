# Phase 0 — Map the Offline Extremal Function ψ(α) for a Divisibility-Antichain Game

You are a coding agent working on an M4 Pro MacBook (14 cores, 48GB RAM). Python 3.14 at `/opt/homebrew/bin/python3` with `scipy`, `numpy`, and `networkx` already installed. Write code, run it, tabulate results, and write a human-readable report.

All your outputs go in `/Users/omisverycool/erdos-harness/erdos-872/phase0/` on this machine. Commit nothing; just write files.

## Problem setup

Let $n$ be a positive integer. Define
- $L = \{2, 3, \ldots, \lfloor n/2 \rfloor\}$
- $U = (n/2, n] \cap \mathbb{Z}$

For $x \in L$, let $M(x) = \{u \in U : x \mid u\}$ (the upper shadow) and $w_n(x) = |M(x)| - 1 = \lfloor n/x \rfloor - \lfloor n/(2x) \rfloor - 1$ (the shadow weight).

For a set $P \subseteq U$ (call these "shields"), let
- $L(P) = \{x \in L : x \nmid u \text{ for every } u \in P\}$ — the "surviving" lower set.
- $\beta(P) = \max\left\{\sum_{x \in B} w_n(x) \ :\ B \subseteq L(P),\ B \text{ antichain under divisibility}\right\}$

**Key fact (makes this tractable).** The divisibility relation on $L(P)$ is a partial order. Comparability graphs of partial orders are perfect. So $\beta(P)$ is the weight of a max weighted antichain in a weighted poset — equal (by weighted Dilworth / König-type duality) to a min-cost flow / LP on the comparability graph, and solvable exactly in polynomial time.

**Prior theorem** (to sanity-check against): If $|P| \le n^\alpha$ for fixed $0 < \alpha < 1$, then
$$\beta(P) \ge \left(\tfrac{1}{2}\log\tfrac{1}{\alpha} + o(1)\right) n \quad (\text{as } n \to \infty).$$

## Your task

Define the offline extremal function
$$\psi_n(\alpha) := \min_{P \subseteq U,\ |P| \le \lfloor n^\alpha \rfloor} \frac{\beta(P)}{n}.$$

We want to know whether $\psi_n(\alpha) \to (1/2)\log(1/\alpha)$ (i.e., the prior theorem is tight) or strictly exceeds it.

## Outputs (files to write)

All paths relative to `/Users/omisverycool/erdos-harness/erdos-872/phase0/`.

1. **`compute_psi.py`** — main script. Computes $\psi_n(\alpha)$ empirically on a grid, writes the CSV.
2. **`psi_grid.csv`** — columns: `n`, `alpha`, `k`, `beta_min`, `beta_min_over_n`, `mertens_pred`, `gap`, `elapsed_sec`. One row per $(n, \alpha)$ cell attempted.
3. **`structural/<n>_<alpha>.json`** — for each cell, the near-optimal $P$: the set of shields with their prime factorizations and basic stats.
4. **`report.md`** — human-readable writeup with:
   - The empirical ψ grid as a table.
   - Plot (ASCII or saved `.png`) of $\psi_n(\alpha)$ vs. $(1/2)\log(1/\alpha)$ for each $n$.
   - Structural characterization of near-optimal $P$: highly composite? primorial-scaled? squarefree? residue-class-concentrated? how much on $H_n = \{u \in U : u \equiv 2 \pmod 4\} \cup \{u > 2n/3, u \equiv 0 \pmod 4\}$?
   - Sniping-susceptibility audit: per cell, (a) distribution of number of distinct prime factors per $u \in P$, (b) prime dependency width (total distinct primes across $P$), (c) what fraction of $P$ is killed if Shortener plays the $k^*$ best primes for $k^* \in \{1, 5, 10, 50\}$. Robust vs brittle?
   - Honest assessment: is $\psi$ tight, strictly larger, or inconclusive at this scale?
5. **`logs/*.log`** — whatever you want for debugging.

## Suggested grid

Primary target:
- $n \in \{5000, 10000, 20000\}$
- $\alpha \in \{0.30, 0.40, 0.50, 0.60, 0.70\}$

If those come back fast, extend to $n = 50000$ and a finer $\alpha$ grid. If they're slow, back off to $n \in \{2000, 5000, 10000\}$. You decide based on measured runtime.

## Algorithm sketch

### Computing β(P) exactly

Max weight antichain in a perfect comparability graph = min weight chain cover (weighted Dilworth). Formulate:

```
# Given: L(P), weights w[x] for x in L(P), divisibility order.
# Build bipartite graph G with "source copies" L-  and "sink copies" L+ of L(P).
# Edge x- -> y+ when x | y and x != y.
# Source s -> x- with capacity w[x].
# x+ -> sink t with capacity w[x].
# Max flow f from s to t.
# Then β(P) = sum(w[x] for x in L(P)) - f.
```

Use `scipy.sparse.csgraph.maximum_flow` or `networkx.algorithms.flow.maximum_flow` (networkx has max weight antichain directly on DAG: look at `networkx.dag_longest_path` family or write the flow formulation manually). Test the implementation against small-n brute force first.

For $n = 10^4$: $|L(P)| \sim 5000$, divisibility edges $\sim 50{,}000$; max flow is fast (seconds).

### Smart greedy to minimize β(P) over |P| = k

```
P = empty
for step in 1..k:
    candidates = small candidate pool from U (e.g., H_n ∩ remaining U, plus top-degree composites, plus primorial multiples)
    best_u = argmin over u in candidates of β(P ∪ {u})
    P.add(best_u)
```

Cost: one β solve per candidate per step. With ~30 candidates per step and $k$ up to $n^{0.7} \sim 500$ at $n=10^4$, that's ~15k β solves per $(n, \alpha)$ cell — hours of compute per cell. Parallelize across the 14 cores via `multiprocessing`.

For larger $n$, reduce candidate pool or switch to LP-relaxation rounding.

### Sanity checks

- At $k = 0$ (empty $P$): $\beta(\emptyset)$ should equal the max weighted antichain in all of $L$. By Theorem B's $W_n$: this should be $\sim (n/2) \log \log n$.
- At $k = n^\alpha$ for small $\alpha$ (say 0.1): expect β/n to be large (above $n/2$).
- Check smooth behavior across $\alpha$ for fixed $n$.

## Notes and guardrails

- **Don't modify anything outside `/Users/omisverycool/erdos-harness/erdos-872/phase0/`.**
- **Don't install extra packages** unless absolutely necessary. scipy + numpy + networkx should suffice.
- **Time-box**: if a single β solve takes > 60 seconds, back off to smaller $n$ rather than hanging.
- **Parallelize**: 14 cores should be used. `multiprocessing.Pool(12)` with cell-level or candidate-level parallelism.
- **Logging**: write progress to `logs/main.log` as you go so I can tail it. Don't just dump everything at the end.
- **Checkpoint**: write CSV rows as each cell completes, so an interruption doesn't lose work.
- **Honesty**: if you can't get the full grid to work, say so plainly in `report.md` and show what you got.

## Why this matters

The math question is whether the game value $L(n)$ grows linearly in $n$ or is strictly sublinear. The answer depends on whether $\psi(\alpha)$ matches its known lower bound $(1/2)\log(1/\alpha)$:

- **ψ tight** → offline feasibility for the Prolonger side is confirmed → the remaining question is online realizability against an adversary → linear game length is plausible.
- **ψ strictly larger** → even without adversary, Prolonger can't drive $\beta(P)$ low enough → strong evidence the game length is sublinear → pivot to a direct construction on the Shortener side.

You won't solve the research problem. But your grid will tell us which branch of the program to pursue.

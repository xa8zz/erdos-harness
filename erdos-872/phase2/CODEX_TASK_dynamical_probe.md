# Codex Task — Dynamical Carrier Probe

**Goal.** Empirically test whether any candidate Shortener strategy $\sigma$ can force Prolonger's set $P$ to have bounded prime-reciprocal mass $\sum_{p \in B(P)} 1/p$, in the regime where $n \to \infty$. This is the empirical half of the "dynamical Carrier Capacity Bound" question. A negative result (every strategy shows $\sum 1/p \to \infty$ matching $\log\log n$) closes the dynamical hope numerically. A positive result (some $\sigma$ shows bounded or sub-$\log\log$ growth) identifies the target theorem.

**Context.** The *static* Carrier Capacity Lemma — "for any antichain $P \subset \{2, \ldots, n\}$ of size $\varepsilon n$, $\sum_{p \in B(P)} 1/p = O(1)$" — was refuted (see `researcher-09-carrier-capacity-refutation.md` and `verify-researcher-09-gemini-refutation.md`). The counterexample is $P =$ top $\varepsilon n$ consecutive integers in $U = (n/2, n]$, which diverges like $\log\log n$. But that counterexample requires Prolonger to play freely in the top half against a passive Shortener. Against an *active* Shortener, Prolonger's plays are constrained. The dynamical version asks whether any concrete Shortener can choke off $\sum 1/p$.

**Constraint set.**
- Game is on $\{2, \ldots, n\}$. $A$ must remain an antichain under divisibility at all times.
- Prolonger moves first. Players alternate until $A$ is maximal.
- We're measuring Prolonger's $P :=$ multiset of Prolonger moves, and its $B(P) :=$ primes dividing $\ge 1$ element of $P$.

## Deliverables

Save all output to `erdos-872/phase2/dynamical_probe/`. Don't overwrite existing Phase 2 files.

### 1. Simulator

`phase2/dynamical_probe/simulator.py` — a simulator supporting:
- Antichain-legal move generation on $\{2, \ldots, n\}$.
- Plug-in Shortener strategies (see list below).
- Plug-in Prolonger strategies (see list below).
- Efficient enough for $n \in \{10^3, 10^4, 10^5, 10^6\}$. Memory-conscious: don't materialize full divisor graphs at $n = 10^6$; compute lazily.

### 2. Strategies to implement

**Shortener strategies** (pick the legal move minimizing or maximizing the given objective, break ties by smallest index):
- `S_slp_odd` — smallest legal odd prime; falls back to smallest legal integer if no prime available.
- `S_adaptive_prime` — smallest legal prime weighted by current $w_n(x)$ coverage (already implemented in `shortener_stress.py`; port over).
- `S_carrier_snipe` — choose the legal move that kills the prime $p$ with largest $1/p$ among primes currently in $B(P)$.
- `S_primorial_anchor` — play the smallest legal integer of form $p_1 p_2 \cdots p_k$ (primorial product) that fits in $(n/(k+1), n/k]$ for the current step.
- `S_pair_response` — if Prolonger's last move $x$ has a dominant prime factor $p$ (largest), respond with the smallest legal prime $\le p$ that doesn't already divide some element of $A$. Effectively "kill one fresh prime per Prolonger move."
- `S_harmonic` — maximize $\sum_{p | m, p \notin B(A)} 1/p$ over legal $m$.

**Prolonger strategies** (choose legal move maximizing the given objective, break ties by smallest index):
- `P_block_product` — play $m = \prod_{p \in B_j} p$ for the next block $B_j$ of primes not yet in $B(P)$, with $|B_j|$ chosen so $m \le n$. Already implemented in `shortener_stress.py`; port over.
- `P_interval_top` — play $m = \lfloor n/2 \rfloor + t$ at step $t$ (just raises $P$ into $U$ linearly). Fallback if illegal: smallest legal element of $U$.
- `P_heuristic_maxdeg` — at each step, play the legal $m$ that maximizes $|\{u \in U : m \mid u\}| \cdot \mathbf{1}[m \in L]$ or simply the $m$ with most legal-neighbor divisors.
- `P_random` — uniform random legal move (set seed; average over 10 seeds).
- (Optional if feasible) `P_optimal_small` — for $n \le 50$, actual minimax Prolonger.

### 3. Measurements

For each **(Shortener, Prolonger, $n$)** triple with $n \in \{10^3, 10^4, 10^5, 10^6\}$:

Record to `phase2/dynamical_probe/results.csv`:

| Column | Description |
|---|---|
| `shortener` | strategy name |
| `prolonger` | strategy name |
| `n` | problem size |
| `seed` | RNG seed (0 for deterministic strategies) |
| `L` | total moves |
| `abs_L_over_n` | $L/n$ |
| `L_times_logn_over_n` | $L \log n / n$ |
| `P_size` | Prolonger moves count |
| `sum_inv_p` | $\sum_{p \in B(P)} 1/p$ |
| `max_p_in_B` | largest prime in $B(P)$ |
| `num_primes_in_B` | $|B(P)|$ |
| `sum_omega` | $\sum_{x \in P} \omega(x)$ (sanity check for Erdős–Kac comparison) |
| `log_log_n` | $\log\log n$ |
| `ratio_to_loglog` | `sum_inv_p / log_log_n` |
| `wall_seconds` | timing |

Deterministic strategies: one run per $(\sigma, \pi, n)$. Random Prolonger: 10 seeds, average and report stdev separately in `results_summary.csv`.

### 4. Analysis

`phase2/dynamical_probe/ANALYSIS.md` — short plain-text writeup. Answer:

1. **For each Shortener $\sigma$:** does $\sum 1/p$ under the *worst* Prolonger strategy scale like $\log\log n$ (ratio stabilizes), slower (ratio $\to 0$), or faster (ratio $\to \infty$)?
2. **Which Shortener minimizes $\sup_\pi \sum 1/p$ at each $n$?** Which Prolonger maximizes it against each Shortener?
3. **Does the Prolonger's realized $B(P)$ concentrate on small primes** (weighted histogram) for the best Shortener, or spread Mertens-style?
4. **Correlation between $L \log n / n$ and $\sum 1/p$** — is a small reciprocal-mass set correlated with short games?
5. **Does any $\sigma$ show decay of the ratio `sum_inv_p / log_log_n`** with $n$, beyond what's explained by lower-order terms?

No plots needed — CSV + text summary. If you have matplotlib handy and it's cheap, one plot per question in `figures/` is welcome but not required.

### 5. Optional: small-$n$ ground truth

If you have time and the exact minimax solver from `phase2/` is intact, for $n \in \{20, 30, 40, 50\}$ compute optimal Shortener play and extract its realized moves. Compare to the candidate strategies above — which candidate matches optimal most closely? Save to `phase2/dynamical_probe/ground_truth.md`.

## Constraints & conventions

- Python 3, numpy only. No third-party combinatorial game libraries.
- Reproducible: every script takes `--n`, `--shortener`, `--prolonger`, `--seed` CLI args. A top-level `run_all.sh` or `run_all.py` reproduces `results.csv` from scratch.
- Budget: this is a multi-hour run. Target the full sweep fits overnight on a laptop. If $n = 10^6$ with exact minimax is infeasible, drop to $n = 10^5$ max for minimax; keep $n = 10^6$ for deterministic strategies only.
- **Do not "optimize" the simulator by skipping the antichain-legality check.** Every move must be verified legal or the data is worthless. Maintain an explicit multiplier-lookup structure for $O(\log n)$ legality tests.
- Log files go to `phase2/dynamical_probe/logs/` (gitignored pattern already in repo).

## Priority ordering

If the whole task is too large:

1. (Highest) `S_slp_odd`, `S_adaptive_prime` × `P_block_product`, `P_interval_top` × $n \in \{10^3, 10^4, 10^5\}$. This alone answers the main question.
2. Add `S_primorial_anchor`, `S_pair_response`.
3. Add $n = 10^6$ for the top performers.
4. Full grid.

## Non-goals

- Not a proof — we're gathering evidence for / against a dynamical bound. A negative empirical result doesn't kill the hypothesis rigorously, but it is a strong signal to stop chasing.
- Don't try to prove $L(n) = o(n)$ or $\ge \varepsilon n$ in code. We just want the reciprocal-mass trajectory.
- Don't modify existing Phase 2 files. Additive only.

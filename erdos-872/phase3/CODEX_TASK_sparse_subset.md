# Codex Task — Phase 3b: Sparse-subset closeout measurement

## Goal

Empirically adjudicate whether a specific obstruction theorem, as stated, suffers from a self-referential budget constraint, or whether a sparse subset of the theorem's carrier family can realize the obstruction within an $O(n/\log n)$ budget.

Specifically: given a carrier family $\mathcal{E}_Q$ on $\{2, \ldots, n\}$ and a target "forced residual" set $\mathcal{M}_Q$, what is the minimum number of carriers from $\mathcal{E}_Q$ that Prolonger must install to make at least $R$ elements of $\mathcal{M}_Q$ into "isolated maximal" legal moves? And how does the ratio $|\text{carriers needed}| / R$ scale with $n$?

If the ratio decays like $1/\log\log n$, the theorem's obstruction is realizable within $O(n/\log n)$ carriers forcing $\gg n \log\log n / \log n$ isolated residual moves. If the ratio is constant or grows, the theorem is partially tautological — you need $\Theta(n \log\log n / \log n)$ carriers to force $\Theta(n \log\log n / \log n)$ residual, which is a trivial reformulation, not an obstruction.

## Background

The game lives on $\{2, \ldots, n\}$: antichain-legality under divisibility, Prolonger first, Shortener minimizes moves.

Define:
- $Q := \{q \text{ prime} : n^\beta \le q \le n^\gamma\}$ for fixed $0 < \beta < \gamma < 1/2$.
- $\mathcal{E}_Q := \{2ab : a, b \text{ odd distinct primes}, 2ab \le n\}$. (The "2qa" sub-family from the original theorem is redundant — every $2qa$ is already of the form $2ab$ with two odd primes. So $\mathcal{E}_Q$ is independent of $Q$.)
- $\mathcal{M}_Q := \{qab : q \in Q, a, b \text{ odd distinct primes}, n/3 < qab \le n\}$.

For $m = qab \in \mathcal{M}_Q$, three specific carriers are "required" to make $m$ isolated:
$$\text{req}(m) := \{2qa, 2qb, 2ab\} \subset \mathcal{E}_Q.$$

**Claim (theorem-as-stated):** if the full $\mathcal{E}_Q$ is installed, every $m \in \mathcal{M}_Q$ is isolated-maximal. Counting: $|\mathcal{M}_Q| \gg n \log\log n / \log n$ for fixed $\beta, \gamma$.

**Budget objection:** $|\mathcal{E}_Q| \gg n \log\log n / \log n$ itself, which exceeds Prolonger's move budget under the $L(n) = O(n/\log n)$ hypothesis.

**Sparse-subset rescue (claimed, not yet verified):** a strategic subset $S \subseteq \mathcal{E}_Q$ of size $O(n/\log n)$ suffices to isolate $R = \gg n \log\log n / \log n$ elements of $\mathcal{M}_Q$, i.e., one carrier isolates $\sim \log\log n$ elements on average.

This task measures the ratio $|S| / R$ directly.

## What to implement

Build a standalone Python script `phase3/sparse_subset.py`. No dependencies on `phase3/deepthink_protocol.py`.

### Step 1 — enumerate $\mathcal{M}_Q$ and the full required-carrier map

For each $n$ and $(\beta, \gamma)$:

1. Sieve primes $\le n$.
2. Compute $Q = $ primes in $[\lceil n^\beta \rceil, \lfloor n^\gamma \rfloor]$.
3. Enumerate $\mathcal{M}_Q$ by iterating $q \in Q$, $a < b$ odd primes distinct from $q$, such that $n/3 < qab \le n$. Use the direct approach: for each $q \in Q$, for each odd prime $a$ with $2 \le a \le \min(\lfloor \sqrt{n/q} \rfloor, \text{cutoff})$, iterate primes $b$ in the valid range. (Pick a sensible cutoff — $a \le n^{1/4}$ or $a \le \sqrt{n^{1-\gamma}}$.)
4. For each $m$, record $\text{req}(m) = \{2qa, 2qb, 2ab\}$.
5. Compute the full carrier universe $U_{\text{carr}} := \bigcup_{m \in \mathcal{M}_Q} \text{req}(m)$.

Report $|\mathcal{M}_Q|$ and $|U_{\text{carr}}|$ as baseline numbers.

### Step 2 — min-cover via greedy and via explicit "Audit 3" construction

**Greedy min-cover.** For each target $R_\text{target} \in \{|\mathcal{M}_Q| / 10, |\mathcal{M}_Q| / 5, |\mathcal{M}_Q| / 2, |\mathcal{M}_Q|\}$:
1. Maintain coverage count $c(m) \in \{0, 1, 2, 3\}$ for each $m \in \mathcal{M}_Q$, initialized to 0.
2. Maintain $S = \emptyset$.
3. **Marginal-gain step.** At each iteration, for each candidate carrier $x \in U_{\text{carr}} \setminus S$, compute $\text{gain}(x) := |\{m : x \in \text{req}(m), c(m) = 2, \text{and } x \text{ is the missing third carrier}\}|$. Pick $x$ maximizing gain; add to $S$; update coverage counts.
4. **Bootstrap problem.** Early greedy has zero marginal gain (no $m$ has coverage 2 yet). Bootstrap: initialize $S$ with the most-shared carriers first — the carriers $x \in U_{\text{carr}}$ that appear in the largest number of $\text{req}(m)$'s (call this the "degree" of $x$). Seed $S$ with the top-$k$ highest-degree carriers for $k$ small (say $k = 10$), then switch to marginal-gain greedy.
5. Track $|S|$ vs. number of fully-covered $m$'s. Stop when $\ge R_\text{target}$ are fully covered.

**Explicit construction (Audit 3's blueprint).** For each $n$:
1. Pick $\delta < \min(\beta, (1-\gamma)/2)$, e.g., $\delta = \beta/2$.
2. Let $A := \{$odd primes $a \le n^\delta\}$.
3. Build $S_\text{explicit}$:
   - Include $\{2qa : q \in Q, a \in A, 2qa \le n\}$.
   - For each $a \in A$, for each $q \in Q$, for each prime $b$ with $n/(3qa) < b \le n/(qa)$ (the valid $b$ range making $qab \in \mathcal{M}_Q$): include $2ab$ and $2qb$.
4. Compute the $m$'s in $\mathcal{M}_Q$ that become isolated (i.e., $\text{req}(m) \subseteq S_\text{explicit}$).

### Step 3 — report the ratios

For each $n$ and each approach (greedy at various targets, explicit construction):
- $|S|$ = carriers installed.
- $R$ = isolated $m$'s.
- Ratio $|S| / R$.
- Normalized ratio $(|S| / R) \cdot \log\log n$ — this is the key signal. If this tends to a positive constant, $|S| / R \sim 1/\log\log n$ and the sparse-subset rescue works. If it grows with $n$, the rescue fails.

## Grid

- $n \in \{10^4, 3 \cdot 10^4, 10^5, 3 \cdot 10^5, 10^6\}$.
  - Extending to $10^7$ is optional and only if feasible within a reasonable runtime. $|\mathcal{M}_Q|$ at $n = 10^6$ is O(10^4), at $n = 10^7$ is O(10^5) — greedy scales as $|U_{\text{carr}}| \cdot |\mathcal{M}_Q|$ per iteration, so $10^7$ could be slow. If so, skip.
- $(\beta, \gamma) \in \{(0.35, 0.45), (0.40, 0.49)\}$. Two choices to test uniformity.
- For the explicit construction, $\delta = \beta/2$.

## Output

Write raw results to `phase3/sparse_subset.csv` with columns:
- `n`, `beta`, `gamma`, `method` (`greedy_R=...`, `explicit`), `S_size`, `R_covered`, `ratio`, `ratio_times_loglog_n`, `|M_Q|`, `|U_carr|`.

Write a synthesis to `phase3/sparse_subset_summary.md`:
- Table of the normalized ratio $(|S| / R) \log\log n$ across $n$ and methods.
- Top-line verdict:
  - "Sparse-subset rescue empirically works" if the normalized ratio flattens or shrinks as $n$ grows (ratio decays like $1/\log\log n$ or better).
  - "Sparse-subset rescue does NOT work" if the normalized ratio grows (ratio is $\Omega(1)$ or larger).
  - "Inconclusive at this scale" if the signal is too noisy.
- Identify the best explicit construction found (smallest $|S|/R$ at $n = 10^6$).
- Report $|\mathcal{E}_Q|$ full count at each $n$ for context — this is the tautological-reading upper bound.

## Sanity checks

- At $n = 10^6$, $(\beta, \gamma) = (0.35, 0.45)$: $|\mathcal{M}_Q|$ should be on the order of $10^4$–$10^5$. Report the exact number.
- Verify $|\mathcal{M}_Q|$ via the independent computation: $|\mathcal{M}_Q| = \#\{(q, \{a, b\}) : q \in Q, a < b \text{ odd primes distinct from } q, n/3 < qab \le n\}$. Note that $m = qab$ may have multiple representations if $a$ or $b$ also lies in $Q$ — deduplicate on the integer $m$, not on the triple.
- Verify explicit construction correctness: for every $m$ flagged as "isolated," check $\text{req}(m) \subseteq S$ via set membership.
- At the beginning of each run, log the parameters and the sizes $|Q|$, $|A|$, $|\mathcal{M}_Q|$, $|U_{\text{carr}}|$ — helps with debugging.

## Known pitfalls

- **Runtime for greedy at $n = 10^6$.** $|\mathcal{M}_Q| \cdot |U_{\text{carr}}|$ can reach $10^{10}$. Use bit-vector representations of coverage (e.g., `numpy.uint8` arrays) and avoid per-iteration re-scanning of all carriers. Maintain, for each carrier $x$, a list of $m$'s containing it; maintain a priority queue on marginal gain; update lazily.
- **Double-counting in $\mathcal{M}_Q$.** If a prime $a$ or $b$ also lies in $Q$, the integer $m$ has multiple $(q, \{a, b\})$ representations. Always deduplicate on $m$ as the integer, not on the triple.
- **The "isolated" condition.** $m$ is isolated iff ALL THREE of its required carriers are in $S$ — not any one, not a majority. Implement this as the exact AND condition.
- **$|A|$ size.** For $n = 10^6$, $\delta = 0.2$: $A$ has $\pi(10^{1.2}) \approx \pi(16) = 6$ primes. That's too few to generate much structure. Consider $\delta$ up to $\min(\beta, (1-\gamma)/2)$; log what you picked and why.
- **Prolonger-legality caveat.** This task measures the PURE set-cover question: what's the minimum $|S|$ to isolate $R$ $m$'s? It does NOT check whether $S$ is itself an antichain. An additional sanity check: verify $S$ is an antichain (no element of $S$ divides another). It should be, since all elements of $\mathcal{E}_Q$ have exactly 3 distinct primes and distinct supports.

## Deliverables

1. `erdos-872/phase3/sparse_subset.py` — the simulator.
2. `erdos-872/phase3/sparse_subset.csv` — raw measurements.
3. `erdos-872/phase3/sparse_subset_summary.md` — synthesis and top-line verdict.
4. `erdos-872/phase3/test_sparse_subset.py` — unit tests covering $\mathcal{M}_Q$ enumeration correctness, deduplication, isolation-check correctness, and antichain verification on $S$.
5. `erdos-872/phase3/logs/sparse_subset.log` — run log.

Do not modify anything in Phase 0, 1, 2 or any other Phase 3 files.

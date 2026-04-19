# Codex Task — Phase 3c: Fan hierarchy empirical audit

## Goal

Empirically pressure-test the rank-$h$ upper-half fan theorem and the per-rank shielding bound in two directions:

1. **Is the $2^{-2^{h+1}}$ per-rank shielding loss tight or loose?** If empirical yield is substantially better than the theoretical $c_h \asymp 2^{-(2^{h+1}-2)}/h!$ bound, the proof is conservative and a sharper theorem likely exists.

2. **Does one Prolonger fan move shield divisors of targets at OTHER ranks?** The current per-rank analysis treats each rank independently, paying $2^{-2^h}$ per rank. But a single upper-half play $A_S \cdot b$ at rank $h$ makes every proper divisor of $A_S \cdot b$ globally illegal — including laterals that are proper divisors of higher-rank targets containing $S$. Measure how much cross-rank shielding actually happens. If substantial, the per-rank bound is overcounting and a uniform multi-rank lemma is plausible.

3. **Window-sum target mass.** Compute $\sum_{h \in W} |\mathcal{T}_h|$ across windows $W$ around $h = \log\log n$. The linear-scale mass should live in $W = \log\log n \pm O(\sqrt{\log\log n})$; quantify.

## Background

The game lives on $\{2, \ldots, n\}$: divisibility antichain, Prolonger first, Shortener minimizes moves. $L(n)$ = moves under optimal play.

**Rank-$h$ upper-half fan.** Fix $\delta \in (0, 1/(2h))$. Let $\mathcal{A} = \{\text{odd primes } a \le n^\delta\}$. For an $h$-set $S \subseteq \mathcal{A}$, put $A_S = \prod_{a \in S} a$ and $J_S = (n/(2A_S), n/A_S]$. Targets:
$$\mathcal{T}_h = \{A_S \cdot b : |S| = h,\ b \in J_S \cap \mathbb{P}\} \subseteq (n/2, n].$$

**Key properties.**
- Every $t \in \mathcal{T}_h$ satisfies $t > n/2$, so $t$ has no proper multiple $\le n$. Shortener attacks are via proper divisors only.
- $t = A_S \cdot b$ has $2^{h+1} - 2$ nontrivial proper divisors: one per nonempty proper subset of $S \cup \{b\}$.
- Playing $t$ makes all these divisors globally illegal — not just for $t$, for every future target sharing them.

**Theoretical yield (pending audit).** The divisor-shadow lemma gives $L(n) \ge c_h \cdot n(\log\log n)^h / \log n$ with $c_h \asymp 2^{-(2^{h+1}-2)}/h!$.

## What to implement

Build a standalone Python script `phase3/fan_hierarchy.py`. Reuse prime-sieving and antichain-legality primitives from the existing phase simulators where convenient, but keep this file self-contained (single-file, documented).

### Probe A — realized $c_h$ for fixed-rank fan

For each $(n, h)$ on the grid:

1. Sieve primes up to $n$. Build $\mathcal{A} = \{a \text{ odd prime} : a \le n^\delta\}$ with $\delta = 0.45 / h$ (safely inside $1/(2h)$).
2. Enumerate all targets $\mathcal{T}_h$: for each $h$-subset $S \subseteq \mathcal{A}$, for each prime $b \in J_S$, record $t = A_S \cdot b$. Deduplicate on the integer $t$ (different subsets cannot produce the same $t$ if all primes are distinct and $b > \max(\mathcal{A})$, but assert this).
3. Simulate the game with a fixed-rank fan Prolonger and a simple Shortener:
   - **Prolonger policy (smallest-core-first):** among live targets (not yet played, no proper divisor in $A$, no proper divisor matches current Shortener move), pick the target $A_S \cdot b$ with lexicographically smallest $S$ (sorted by $A_S$ ascending), breaking ties by smallest $b$. Play it. (Simpler variants are fine — the goal is to get a floor on Prolonger yield, not to optimize Prolonger play.)
   - **Shortener policies to compare:**
     - **smallest-legal-prime**: play the smallest prime not yet illegal.
     - **max-degree-divisor**: among all legal proper divisors of some live target, play the divisor $d$ that divides the largest number of live targets.
     - **max-degree-any**: among all legal integers $\le n$, play the one that kills the most live targets (more expensive; only run for small $n$).
4. Run the game to termination on the restricted move space (only moves from $\mathcal{T}_h \cup \{\text{proper divisors of anything in } \mathcal{T}_h\} \cup \{\text{small primes}\}$ — Shortener never needs to play outside this).
5. Record:
   - `L_realized` = total moves played.
   - `P_targets` = Prolonger target plays.
   - `S_kills` = Shortener moves that killed at least one live target.
   - `c_h_empirical` = `P_targets / (n (log log n)^h / log n)`.
   - `c_h_theoretical` = $2^{-(2^{h+1}-2)} / h!$.
   - Ratio `c_h_empirical / c_h_theoretical` — the looseness factor.

### Probe B — cross-rank auto-shielding census

This is a **pure combinatorial count**, no game play. For each $(n, h)$ with $h \in \{2, 3, 4\}$:

1. Enumerate $\mathcal{T}_h$ as above.
2. Also enumerate $\mathcal{T}_{h'}$ for $h' \in \{h+1, h+2, h+3\}$ (or as many as fit). Use the same $\mathcal{A}$ restricted to $a \le n^{0.45/h'}$ for the higher-rank enumerations, which is a subset of $\mathcal{A}$ for rank $h$, so cores are comparable.
3. For a **sample** of 100 random targets $t \in \mathcal{T}_h$ (fewer if $|\mathcal{T}_h| < 100$):
   - Enumerate all $2^{h+1} - 2$ proper divisors of $t$.
   - For each divisor $d$ and each $h' > h$, count `cross_kill(d, h') = #{t' \in T_{h'} : d | t'}`.
   - Aggregate: `cross_rank_shield(t) = sum over all proper divisors d of t of sum over h' in {h+1, h+2, h+3} of cross_kill(d, h')`.
   - Also compute `same_rank_shield(t) = sum over d of #{t' in T_h : d | t', t' != t}`.
4. Report per $(n, h)$:
   - Mean and median `same_rank_shield`, `cross_rank_shield`.
   - Ratio `cross_rank_shield / same_rank_shield` — how much extra shielding a rank-$h$ play provides to higher ranks.
   - Cross-rank coverage ratio: `cross_rank_shield(t) / |T_{h'}|` for each $h'$ — what fraction of each higher rank one rank-$h$ play covers.

### Probe C — window-sum target mass

For each $n$ in the grid:

1. Compute `H = sum(1/p for p in primes if p <= n^0.45)`.
2. For each $h \in \{1, 2, 3, \ldots, 2H\}$ (or until $|T_h|$ drops below 10):
   - Exactly count $|\mathcal{T}_h|$ using the same construction as Probe A, with $\delta$ chosen per rank so cores fit: $\delta_h = 0.45 / \max(h, 1)$.
   - Also compute the Mertens estimate `|T_h|_est = (n / (2 log n)) * H^h / h!`.
3. For windows $W_c = \{h : |h - H| \le c \sqrt{H}\}$ with $c \in \{0, 1, 2, 3\}$:
   - Compute `window_mass(c) = sum_{h in W_c} |T_h|`.
   - Compute `window_mass_est(c) = (n / (2 log n)) * sum_{h in W_c} H^h / h!`.
   - Ratio `window_mass(c) / (n / 2)` — what fraction of $n/2$ does the window capture.

## Grid

- Probe A: $n \in \{10^4, 10^5, 10^6\}$, $h \in \{1, 2, 3\}$. Rank 4 only at $n = 10^4, 10^5$ (may be slow).
- Probe B: $n \in \{10^5, 10^6\}$, $h \in \{1, 2, 3\}$, sampled.
- Probe C: $n \in \{10^5, 10^6, 10^7\}$. Pure counting, fast.

At $n = 10^6$, $H \approx 2.96$; at $n = 10^7$, $H \approx 3.11$. Values are small, so the "window" interpretation is delicate at these scales — report absolute $h$-histograms as the primary output, with Stirling-peak flags.

## Output

### Raw

- `phase3/fan_hierarchy_probeA.csv`: columns `n, h, shortener_strategy, L_realized, P_targets, S_kills, c_h_empirical, c_h_theoretical, looseness_ratio, |T_h|`.
- `phase3/fan_hierarchy_probeB.csv`: columns `n, h, sample_size, mean_same_rank, median_same_rank, mean_cross_rank_total, cross_rank_by_h', cross_coverage_ratio_by_h'`.
- `phase3/fan_hierarchy_probeC.csv`: columns `n, h, |T_h|, |T_h|_Mertens_estimate, H, h_star (=round(H)), window_mass_c0, window_mass_c1, window_mass_c2, window_mass_c3`.

### Synthesis

`phase3/fan_hierarchy_summary.md` with:

**Verdict per probe.**

- **Probe A — is the per-rank bound loose?** Report the looseness ratio $c_h^{\text{empirical}} / c_h^{\text{theoretical}}$ at each $(n, h)$. If this is $\gtrsim 10$ uniformly, the theoretical bound is order-of-magnitude loose and there is real room for a sharper proof. If it's near 1, the bound is tight and the per-rank obstruction is fundamental.
- **Probe B — does cross-rank auto-shielding happen?** Report mean `cross_rank_shield / same_rank_shield`. If this is $\Omega(1)$, a rank-$h$ Prolonger move meaningfully shields higher-rank targets as a side effect, and a uniform multi-rank lemma is plausible. If it's $o(1)$, cross-rank shielding is negligible at tested scales.
- **Probe C — does the window capture $\Theta(n)$ mass?** Report `window_mass(c=2) / (n/2)` — the fraction of $n/2$ captured by a 2-$\sigma$ window around $h = H$. If this is $\Omega(1)$, the factorial-peak structure is favorable for joint-rank harvesting. If it's $o(1)$ even asymptotically, even a perfect multi-rank theorem cannot reach $\Theta(n)$.

**Top-line headline.** One sentence summarizing which of the three signals (loose per-rank bound / real cross-rank shielding / favorable window mass) come in. The ideal result for $L(n) = \Theta(n)$ is all three positive.

## Sanity checks

- `|T_h|` matches the Mertens estimate to within factor 2 for $h \le 3$ at $n \ge 10^5$. Log both.
- `c_h_empirical` $\ge$ `c_h_theoretical` at every $(n, h)$. If this fails, the game simulator has a bug — the theoretical bound is a lower bound on what Prolonger can force, so empirical Prolonger play (even with a suboptimal policy) should match or exceed it.
- For `h = 1`: verify `c_1_empirical` $\in [0.1, 0.3]$, consistent with the $1/8$ rigorous constant for the odd upper-half fan.
- For `h = 2`: verify `c_2_empirical` $\in [0.01, 0.1]$, consistent with the $1/64$ rigorous constant.
- Antichain legality: at every step, assert that the move being played is not divisible by (or a divisor of) any element of the current $A$. Fail loudly if violated.
- Target enumeration: assert that each $t \in \mathcal{T}_h$ has $n/2 < t \le n$ and exactly $h+1$ prime factors.

## Known pitfalls

- **Shortener optimality.** The realized $c_h$ depends on which Shortener strategy is simulated. Report all three strategies separately; the true $c_h$ is bounded above by the minimum over strategies. If `smallest-legal-prime` is strictly best at all tested $(n, h)$, note this — it suggests the "correct" Shortener for the upper-half fan is elementary.
- **Rank-4 runtime.** $|\mathcal{T}_4|$ at $n = 10^5$ with $\delta = 0.11$ may be small; at $n = 10^6$ it may be substantial. Bound runtime: skip rank 4 at $n = 10^6$ if enumeration exceeds 10 minutes.
- **$\mathcal{A}$ sizing for rank $h$.** $\delta = 0.45/h$ keeps $A_S \le n^{0.45}$ regardless of $h$, so $b \ge n^{0.55}/2 \to \infty$. But for small $n$ and large $h$, $|\mathcal{A}|$ might be tiny. At $n = 10^5, h = 4$: $\delta = 0.1125$, $n^\delta \approx 3.6$, only primes $\{3\}$ fit. Log $|\mathcal{A}|$ and skip if $|\mathcal{A}| < h$.
- **Core-$S$ enumeration.** Use `itertools.combinations` but beware memory — at $n = 10^6, h = 3, |\mathcal{A}| \approx 60$, $\binom{60}{3} = 34{,}220$, manageable. At $h = 4$, $\binom{60}{4} \approx 4.9 \times 10^5$, also fine.
- **Shortener's attack set.** For `max-degree-divisor`, maintain an inverse index `divisor -> list of live targets it divides`. Update lazily as targets get killed or played. Naively recomputing per turn is $O(|T_h| \cdot |\text{divisors per target}|)$ per step.
- **Cross-rank divisor matching (Probe B).** For each divisor $d$ of a rank-$h$ target, find all rank-$h'$ targets containing $d$. Build a global `divisor -> targets` index over all ranks $\{h, h+1, h+2, h+3\}$ once, then query. Memory: at $n = 10^6$ across $h=2,3,4,5$, the total target set is $O(10^6)$, and each target has up to $2^{h+1}$ divisors — $O(10^7)$ total (divisor, target) pairs. Feasible.
- **$n = 10^7$ in Probe C.** Only the counting; no game play. Should be fast (minutes). If it crawls, reduce to enumerating $|\mathcal{T}_h|$ for $h \le 4$ exactly and estimating higher $h$ via Mertens.

## Deliverables

1. `erdos-872/phase3/fan_hierarchy.py` — simulator + counting.
2. `erdos-872/phase3/fan_hierarchy_probeA.csv`, `fan_hierarchy_probeB.csv`, `fan_hierarchy_probeC.csv` — raw measurements.
3. `erdos-872/phase3/fan_hierarchy_summary.md` — synthesis + three verdicts + top-line.
4. `erdos-872/phase3/test_fan_hierarchy.py` — unit tests: target enumeration at small $n$ (hand-verified), divisor count per target, antichain legality in Probe A, sanity checks from above.
5. `erdos-872/phase3/logs/fan_hierarchy.log` — run log.

Do not modify anything in Phase 0, 1, 2 or any other Phase 3 files.

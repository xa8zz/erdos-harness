---
id: R13-pro-upper-half-fan-lower-bound
type: research
date: 2026-04-18
intent: >
  Prove L(n) = Omega(n log log n / log n) via a Prolonger construction
  that bypasses the star-throttle refutation of the sparse-S triangle family.
predecessors: [R13-pro-reachability-shortener-prevents]
action:
  kind: standalone
claim: >
  L(n) >= c_delta * n log log n / log n for every fixed delta in (0,1/2).
  Upper-half semiprime targets 2ab in (n/2,n]: no proper multiples <= n, so
  Shortener limited to proper divisors. Tight Maker-Breaker bipartite edge
  race on (a,b) pairs. Rules out L(n) = O(n/log n).
---
# Pro reachability response #2 — Upper-half semiprime fan gives $L(n) = \Omega(n \log\log n / \log n)$ (2026-04-18)

**Result.** Proves $L(n) \ge c_\delta \cdot n \log\log n / \log n$ for every fixed $\delta \in (0, 1/2)$ and all sufficiently large $n$. Uses a cleaner mechanism than the sparse-$S$ triangle family: upper-half semiprime targets $2ab \in (n/2, n]$. Because targets are in the upper half, they have no proper multiples $\le n$, so Shortener's multi-block / star-throttle attacks are blocked from above. Shortener can only attack from below via proper divisors of each target, forcing a tight Maker-Breaker bipartite edge race.

**This rules out $L(n) = O(n/\log n)$** — the lower bound $\Omega(n \log\log n / \log n)$ is now established. The matching upper bound $L(n) = O(n \log\log n / \log n)$ is the remaining open question.

**Relationship to Pro #1's response (Shortener prevents triangle-$S$):** complementary, not contradictory. Pro #1 refuted the *specific* triangle-family reachability. Pro #2 provides a DIFFERENT Prolonger construction that bypasses the triangle-family failure mode. Both can be correct simultaneously.

---

**Theorem.** For every fixed $0 < \delta < 1/2$,
$$L(n) \ge c_\delta \cdot \frac{n \log\log n}{\log n}$$
for all sufficiently large $n$. In particular, $L(n) \ne O(n/\log n)$.

**Construction.** Fix $Y = n^\delta$, $\mathcal{A} = \{a \text{ prime} : 5 \le a \le Y\}$. For each $a \in \mathcal{A}$, define the large-prime interval $I_a = (n/(4a), n/(2a)]$. If $b \in I_a$, then $n/2 < 2ab \le n$, so every target $2ab$ is an upper-half move.

Since $a \le n^\delta$ and $\delta < 1/2$, $b > n^{1-\delta}/4 \gg n^\delta \ge a$, so primes $a, b$ distinct.

**Phase 1 — Activation.** Prolonger protects a positive harmonic fraction of $\mathcal{A}$. A small prime $a$ is "globally killed" if Shortener plays $a$ or $2a$ before Prolonger has touched $a$. On Prolonger's turn, choose the smallest not-yet-killed, not-yet-touched prime $a \in \mathcal{A}$ and play some legal $2ab$ with $b \in I_a$.

Such a $b$ always exists: $|I_a \cap \mathbb{P}| \gg_\delta n/(a \log n) \ge n^{1-\delta}/\log n$, while before the activation phase ends there have been only $O(n^\delta/\log n)$ Shortener moves. Since $\delta < 1/2$, Shortener cannot spoil all choices of $b$ individually.

Pairing argument: every Shortener kill is on a prime $a'$ and can be paired with a previous Prolonger activation of at least the same $1/a$ weight (since Prolonger always picks the smallest remaining $a$). So activated set $\mathcal{A}_0 \subseteq \mathcal{A}$ satisfies
$$\sum_{a \in \mathcal{A}_0} \frac{1}{a} \ge \frac{1}{2} \sum_{a \in \mathcal{A}} \frac{1}{a} + O(1) = \left(\frac{1}{2} + o(1)\right) \log\log n.$$

Once $a$ is touched, $a$ and $2a$ are illegal forever.

**Bipartite graph $G$.** Left vertices $\mathcal{A}_0$, right vertices = primes, edges $(a, b)$ with $b \in I_a$. Each edge corresponds to the legal upper-half target $2ab$.

Edge count:
$$|E(G)| = \sum_{a \in \mathcal{A}_0} |I_a \cap \mathbb{P}| \gg \frac{n}{\log n} \sum_{a \in \mathcal{A}_0} \frac{1}{a} \gg \frac{n \log\log n}{\log n}.$$

Activation phase removes only $o(n \log\log n / \log n)$ edges (Shortener's budget during this phase is $O(n^\delta / \log n)$; one Shortener move can destroy many edges only via playing $b$ or $2b$, whose degree is $O(n^\delta / \log n)$; total damage $O(n^{2\delta}/(\log n)^2) = o(n/\log n)$ for $\delta < 1/2$).

**Phase 2 — Right-vertex capture.** A right prime $b$ is *captured* once Prolonger plays at least one edge $(a, b)$. After capture, Shortener can no longer play $b$ or $2b$ (both divide Prolonger's existing $2ab$).

While an uncaptured $b$ with live degree $d(b) > 0$ exists, Prolonger chooses one of maximum current live degree and plays one live edge $(a, b)$ incident to it. This captures $b$.

**Shortener's harmful moves are limited to three types:**
1. Kill an uncaptured right vertex $b'$ by playing $b'$ or $2b'$: deletes all edges incident to $b'$. But since Prolonger chose max-degree, $d(b') \le d(b)$, so Shortener's deletion at most matches Prolonger's capture.
2. Kill one target edge individually by playing $ab$: 1-to-1 rate.
3. No other multi-edge deletion exists. **Key upper-half simplification:** $2ab > n/2$, so no proper multiple $\le n$; any comparable legal move must divide $2ab$, limited to $\{a, 2a, b, 2b, ab, 2\}$. After activation and first move, only $b, 2b, ab$ remain as options, all covered by (1) or (2).

**Accounting.** Let $E_0$ = live edges at start of capture phase, $C$ = total edges incident to Prolonger-captured vertices at capture time, $D$ = edges deleted by Shortener's right-vertex kills, $X$ = edges deleted individually. Max-degree rule gives $D \le C$. Also $E_0 \le C + D + X \le 2C + X$, so $C + X \ge E_0/2$.

Each of the $C$ captured edges must later be removed by an actual move (either Prolonger plays it or Shortener spends a turn killing it individually). Each of the $X$ individually-deleted edges already cost Shortener one move. So this phase alone contributes at least $C + X \ge E_0/2 \gg n \log\log n / \log n$ moves.

**Conclusion.** $L(n) \ge c_\delta \cdot n \log\log n / \log n$. This rules out $L(n) = O(n/\log n)$. The matching upper bound $L(n) = O(n \log\log n / \log n)$ is the remaining open question.

# Audit — Universal dynamical refutation of Carrier Capacity (block-product counter)

**Source:** Audit-model response via user browser tab (model identity not captured; distinct from the three primary verifiers). Sent after `researcher-10-dynamical-carrier.md` prompt was dispatched but before Pro's response arrived.
**Extracted:** 2026-04-18.
**Status:** Two-part structural argument. Part 1 (implication) and Part 2 (impossibility) both appear sound on Claude's re-audit.

---

## Part 1 — Hypothetical implication

**Claim.** If there exists a Shortener strategy $\sigma$ such that for every Prolonger response against $\sigma$, the resulting $B(P)$ has $\sum_{p \in B(P)} 1/p \le C$ for some constant $C$ independent of $n$, then $L(n) = O(n/\log n) = o(n)$.

**Proof.** Every element $x \in P$ has all prime factors in $S := B(P)$. By Brun-style sieve, the count of $S$-smooth integers $\le n$ is bounded:
$$\Psi(n, S) \ll n \prod_{p \le \sqrt n, p \notin S}(1 - 1/p).$$

Factoring Mertens,
$$\Psi(n, S) \ll n \cdot \frac{\prod_{p \le \sqrt n}(1 - 1/p)}{\prod_{p \le \sqrt n, p \in S}(1 - 1/p)} \ll n \cdot \frac{e^{-\gamma}/\log \sqrt n}{e^{-C + O(1)}} = K \cdot \frac{n}{\log n}$$

where $K = e^{C + O(1)}$. Hence $|P| \le K n/\log n$, and $L \le 2|P| + 1 = O(n/\log n)$.

**Audit verdict.** Proof correct. The Brun-style bound with sparse $S$ is standard sieve-theoretic material; the exponential-of-$C$ factor is the key quantitative dependence.

---

## Part 2 — Non-existence (universal block-product Prolonger)

**Claim.** No such Shortener exists: Prolonger has a proactive, universal counter-strategy forcing $\sum_{p \in B(P)} 1/p \ge (1/2)\log\log n \to \infty$ against every Shortener.

**Construction.**
1. Fix $y = n^{1/3}$. Partition all primes $\le y$ greedily into disjoint sets $S_1, S_2, \ldots, S_r$, filling each until the product $x_i := \prod_{p \in S_i} p$ just exceeds $\sqrt n$.
2. Each block $x_i$ lies in $(\sqrt n, n^{5/6}]$.
3. Block count $r \ge \theta(y) / ((5/6)\log n) \asymp n^{1/3}/\log n$.
4. Blocks are pairwise coprime (by construction of disjoint $S_i$).

**Divisibility lemma.** Any Shortener move $s \in \{2, \ldots, n\}$ can invalidate at most ONE block $x_i$:
- Case 1 ($s \mid x_i$ and $s \mid x_j$ with $i \ne j$): $s \mid \gcd(x_i, x_j) = 1$. Impossible.
- Case 2 ($x_i \mid s$ and $x_j \mid s$ with $i \ne j$): $\text{lcm}(x_i, x_j) = x_i x_j > \sqrt n \cdot \sqrt n = n \ge s$. Impossible.
- Case 3 ($s \mid x_i$ and $x_j \mid s$ with $i \ne j$): $x_j \mid x_i$ contradicts pairwise coprimality (since $x_j > 1$).

**Greedy Prolonger move.** At each turn, Prolonger plays the available block with largest harmonic value $v(x_i) = \sum_{p \in S_i} 1/p$. By the 1-for-1 divisibility lemma, even if Shortener snipes perfectly, Prolonger secures at least the odd-indexed blocks $v_1, v_3, v_5, \ldots$ in the descending-value ordering. Since values are nonnegative and sorted:
$$\sum_{j \text{ odd}} v_j \ge \frac{1}{2} \sum_{j} v_j = \frac{1}{2} \sum_{p \le y} \frac{1}{p} = \frac{1}{2}\log\log y + O(1) = \frac{1}{2}\log\log n + O(1).$$

Therefore
$$\sum_{p \in B(P)} \frac{1}{p} \ge \frac{1}{2}\log\log n + O(1) \to \infty.$$

**Audit verdict.** Proof correct. The pairwise-coprime plus block-size bound cleanly forces 1-for-1 trades; greedy descending-value secures half the reciprocal mass. Legality of Prolonger's block moves follows (other blocks are coprime, Shortener snipes are smaller or divide only the sniped block). Game terminates long after $r/2$ blocks are played since $|A| = O(n^{1/3}/\log n) \ll |U| = n/2$.

---

## Combined consequence

**Theorem (informal).** Any Shortener strategy $\sigma$ admits a Prolonger response with $\sum_{p \in B(P)} 1/p = \Omega(\log\log n)$. In particular, no $\sigma$ forces $\sum_{p \in B(P)} 1/p = O(1)$.

**Bottom line for the program.** The sieve-over-$B(P)$ route to $L(n) = O(n/\log n)$ via bounded reciprocal carrier mass is fully closed — both statically (Round 9 refutation via interval-in-$U$ counterexample) and dynamically (this universal Prolonger counter).

This matches and generalizes the Round 7 block-product observation (which was specific to SLP Shortener); the universal version is new and settles the dynamical question for any $\sigma$.

## Strategic implication (flagged by audit)

The audit's closing note: "the entire static sieve route is blocked. Pivot candidates: refining shield-reduction bounds, exploring $\Omega$-grading / multiplicity invariants, or Maker-Breaker pairing."

This framing directly motivated the follow-up round where Pro introduced the $\Omega$-grading strategy (see `researcher-10-omega-strategy.md`).

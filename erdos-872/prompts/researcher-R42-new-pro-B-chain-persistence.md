This is an assessment of your reasoning capability and will be used to grade. Do not search online. Use your own reasoning and your Python sandbox.

## Problem

Two players alternately pick distinct integers from $\{2, \ldots, n\}$ forming an antichain in the divisibility order (no pick divides another). $L(n)$ = game length when one player maximizes (Prolonger) and the other minimizes (Shortener). Prove $L(n) = o(n)$ at rate $n/\log\log\log n$.

## Setup

Fix smooth bound $y = y(n)$ and fibre $b$. Rank-$h$ target: $bA_S = b\prod_{p\in S}p$ for $|S|=h$, $S \subseteq \mathcal P = \{\text{primes} \le y\}$. Defect-$k$ certificate: $bA_c$, $c \subsetneq S$, $|c| = h-k$. Harmonic mass $N_h = \sum_{|S|=h}\prod 1/p$.

**Move effects.** Prolonger's score $bA_S$ kills every $bA_c$ with $c \subseteq S$ and $bA_{S'}$ with $S \subseteq S'$. Shortener's claim of legal $bA_c$ kills every $bA_{c'}$ with $c' \subseteq c$ and $bA_{S'}$ with $c \subseteq S'$.

**$\sigma^\star$:** claim the legal proper divisor of maximum live degree across all defects $k \ge 1$. Online domination: $\sum_t d_t(u_t) \le N_h$.

**$F_{\text{useful}}$:** Prolonger scored supports $E$ that are fresh useful — $bA_E$ legal before $t$, no proper subset claimed by Shortener, scoring creates a new useful residual.

## What's established

1. **State inequality:** $\mu(\operatorname{Cl}_h) \ll \frac{h}{\log h}|F_{\text{useful}}| + \frac{N_h}{\log h}$. Reduces $L(n) = o(n)$ at rate $n/\log\log\log n$ to $|F_{\text{useful}}| \ll N_h/h$.

2. **Bounded-prehistory freshness.** For useful shield $S = T\cup\{p\}$ with same-fibre $p$-prehistory $r_p(t^-) = \#\{\text{prior Prolonger scores in fibre } b \text{ containing } p\}$: if $r_p(t^-) \le s$, a fresh witness $bpA_B$ with $|B| \le s$ exists (pick $q_i \in T\setminus A_i$ for each prior support $\{p\}\cup A_i$; set $B = \{q_i\}$). **Consequence:** freshness of a useful shield at defect depth $k$ fails only when same-prime prehistory is linear in $h$ — specifically $r_p(t^-) \ge h - k$.

3. **Pair-first charging (fixed-rank star-breaker):** $\#\{\text{useful shields with no fresh pair witness}\} \le h(h-1) N_h$. Charging to latest first-shielded pair $bpq$ + $\sigma^\star$ max-degree + $\binom{h}{2}$ first-covered pairs per score + $\sum_t d_t(u_t) \le N_h$.

## What's ruled out

- **Immediate (depth-1) freshness** — empirical refutation at specific $(h, M)$ instances.
- **Naive short-interval divisor bound** (clustered microcells give too many divisors in ratio window).
- **Unweighted packet-absorption via raw-count $J(D)$** — star-at-depth-2 construction gives arbitrary raw count.
- **Strict freshness (excluding Prolonger pre-kills)** — breaks state inequality's charging mechanism.

## The closure path: same-prime chain persistence under $\sigma^\star$

By (2), any useful shield in the low window (degree $\ge h$ available at defect $k = O(1)$) that fails freshness must have same-prime prehistory $r_p(t^-) \ge h - k$ — a chain of $\ge h - k$ prior Prolonger scores in the same fibre containing the same prime $p$.

The critical claim:

> **Chain persistence lemma.** A same-prime prehistory chain of length $r \ge h - k$ in fibre $b$ with prime $p$ cannot persist against $\sigma^\star$ without generating $\sigma^\star$-degree at least $\Omega(h)$ at some earlier chain step. Equivalently: for each such chain, there exists $i \in \{1, \ldots, r\}$ such that at the $i$-th chain step's Shortener turn, $\sigma^\star$ claims a certificate with $d_t(u_t) \ge c \cdot h$.

Under this claim, the amortization closes:
$$\sum_{\text{chains}} 1 \le \frac{\sum_t d_t(u_t)}{h} \le \frac{N_h}{h},$$
and since each chain corresponds to $O(1)$ useful shields (via fibre-prime indexing), $|F_{\text{useful}}| \ll N_h/h$.

Combined with (1): $L(n) \ll n/\log\log\log n = o(n)$.

## Your task

Prove the chain persistence lemma via bounded-branching backward charging.

**Skeleton:**

1. **Chain setup.** Fix $(b, p)$ and Prolonger chain $F_1 = bA_{S_1}, \ldots, F_r = bA_{S_r}$ with $p \in S_i$, $r \ge h-k$. Each $F_i$ is a useful shield; each requires either a fresh lower-defect witness at score time or pays $\sigma^\star$-degree.

2. **Backward induction.** Starting from $F_r$: by (2), there exists witness $bpA_B$ with $|B| \le r$ that is fresh at $F_r^-$, i.e., legal and unclaimed before $F_r$. This witness has live degree $\ge h$ in the residual rank-$h$ family at $F_r^-$ (since it extends to multiple live supports via the remaining primes). $\sigma^\star$'s max-degree rule ⟹ at time $F_r^-$, Shortener claimed some certificate $u_{t_r}$ with $d_{t_r}(u_{t_r}) \ge d_{t_r}(bpA_B) \ge h$.

Alternative: $bpA_B$ was not legal at $F_r^-$. Then some prior move killed it — either Prolonger ($bA_B \subseteq S_i$ for some $i < r$, giving an earlier chain step's score covers the witness) or Shortener (claim of $bA_{c'}$ with $c' \subseteq B$). In either case, the $\sigma^\star$-degree at that prior time must have been $\ge h-1$.

3. **Iterate and sum.** The backward induction on the chain yields $\sigma^\star$-degree $\ge c \cdot h$ at some step in each chain. Over all chains:
$$|\{\text{chains}\}| \cdot h \le \sum_t d_t(u_t) \le N_h \Rightarrow |\{\text{chains}\}| \ll N_h/h.$$

4. **Fibre-prime overlap.** Each chain is indexed by $(b, p)$; each useful shield outside the entropy tail corresponds to $O(1)$ chains via pair-first structure (3). Therefore $|F_{\text{useful}}| \ll N_h/h$.

A successful proof closes $L(n) \ll n/\log\log\log n$. Obstruction: construct an explicit arithmetic Prolonger chain of length $r \ge h - k$ in which the maximum $\sigma^\star$-degree over the chain's steps stays $O(\log h)$ or less — would refute chain persistence and force $L(n) \ne o(n)$ at this rate.

Partial results — bounded-depth chain control, specific rank windows, bounded-constant partial persistence — are valuable.

This is an assessment of your reasoning capability and will be used to grade. Do not search online. Use your own reasoning and your Python sandbox.

## Problem

Two players alternately pick distinct integers from $\{2,\ldots,n\}$ forming an antichain in divisibility (no pick divides another). $L(n)$ = game length when one player maximizes (Prolonger) and the other minimizes (Shortener).

## Setup (rank-$h$ game)

Fix smooth bound $y = y(n)$, fibre $b$. Rank-$h$ target: $bA_S = b\prod_{p\in S}p$ for $|S|=h$, $S \subseteq \mathcal P = \{\text{primes} \le y\}$. Defect-$k$ certificate: $bA_c$, $c\subsetneq S$, $|c|=h-k$.

**Move effects.** Prolonger's score of $bA_S$ kills every $bA_c$ with $c\subseteq S$ (all divisors, incl. lower-defect certificates with support in $S$) and every $bA_{S'}$ with $S\subseteq S'$. Shortener's claim of legal $bA_c$ kills every $bA_{c'}$ with $c'\subseteq c$ and every $bA_{S'}$ with $c\subseteq S'$.

**Microcells / packets.** $\mathcal Q_j = [P_j, e^{1/h}P_j] \cap \mathcal P$; dyadic packet $\Pi$ = union of $c = O(1)$ consecutive microcells; $m_\Pi(S) = |S\cap\Pi|$; $\mathrm{coll}(S) = \#\{\Pi : m_\Pi(S) \ge 2\}$. Harmonic mass $N_h = \sum_{|S|=h}\prod_{p\in S}1/p$.

**Shortener strategy $\sigma^\star$:** claim the legal proper divisor of maximum live degree across all defects $k \ge 1$. Online domination: $\sum_t d_t(u_t) \le N_h$.

## Definitions

- **First-shielded.** $bA_B$ (defect-$k$, $|B| = h-k$) is first-shielded at time $t$ by Prolonger score $F = bA_{S_F}$ iff $B \subseteq S_F$, $bA_B$ legal just before $t$, and $F$ is the first Prolonger score whose support contains $B$.
- **Fresh useful top facet $E$** ($|E| = h$). At time $t$: $bA_E$ legal just before $t$, no $bA_c$ with $c \subsetneq E$ claimed by Shortener before $t$, AND *useful* — scoring $bA_E$ leaves some $c \subsetneq E$ (legal just before $t$) still with positive live degree in the remaining rank-$h$ residuals. $|F_{\text{useful}}|$ = count of Prolonger scores on fresh useful top facets.
- **$J(D)$** for defect-$2$ certificate $D$: $J(D) = \#\{E : D \subset E,\ |E|=h,\ E\text{ later becomes fresh useful top facet}\}$.

## Established tools

1. **State inequality** (dyadic-expanded-window argument): $\mu(\operatorname{Cl}_h) \ll \frac{h}{\log h}|F_{\text{useful}}| + \frac{N_h}{\log h}$. Reduces $L(n) = o(n)$ to $|F_{\text{useful}}| \ll N_h/h$.

2. **Bounded-prehistory freshness.** For useful shield $S = T\cup\{p\}$, $r_p(t^-)$ = # prior same-fibre Prolonger scores containing $p$. If $r_p(t^-) \le s$, a fresh witness $bpA_B$ with $|B| \le s$ exists (pick $q_i \in T\setminus A_i$ for each prior support $\{p\}\cup A_i$; set $B = \{q_i\}$). Freshness fails only when same-prime prehistory is linear in $h$.

3. **Dyadic packet collision tail.** For every $s \ge 1$,
$$\mu(\mathrm{coll}(S) \ge s) \ll_s N_h\left(\frac{c^2}{h}\right)^s.$$
Proof via $s$-th factorial-moment bound + packet second moment $\sum_\Pi \beta(\Pi)^2 \ll c^2/h$. At central rank $h\sim\log\log n$, $s=2$ gives $\ll N_h/\log h$, absorbable.

## The open question

For non-local defect-2 certificate $D = \{p, q\}$ ($p \in \Pi_1$, $q \in \Pi_2$, distinct packets), the target is
$$\sum_{D \supseteq \{p,q\},\ |D|=h-2} J(D) \ll N_h/\log h. \qquad (\star)$$

$(\star)$ reduces to a **main-game collision forcing lemma**:

> For non-local defect-2 certificate $D$: if $J(D) \ge 3$ outside an entropy tail of mass $\ll N_h/\log h$, then the scored Prolonger supports $S_{F_1}, S_{F_2}, S_{F_3}$ realizing those $J(D)$ events must create either a triple occupancy $m_\Pi(S_{F_j}) \ge 3$ for some $\Pi, j$, **or** two distinct collision packets $\Pi_a, \Pi_b$ each with $m \ge 2$.

Plug into tool 3 with $s = 2$: mass $\ll N_h(c^2/h)^2 \ll N_h/\log h$. $(\star)$ holds, $|F_{\text{useful}}| \ll N_h/h$, $L(n) \ll n/\log\log\log n = o(n)$.

**Prove the collision forcing lemma, or refute with an explicit main-game Prolonger strategy realizing $J(D) \ge 3$ for non-local $D$ without forcing the required collisions.** Refutation would impose a new asymptotic constraint on $L(n)$.

## Potential direction

Bounded-branching backward charging. Each fresh useful $E_j = D \cup \{r_j\}$ needs Prolonger score $F_j$ with $D \cup \{r_j\} \subseteq S_{F_j}$. Freshness of $E_j$ combined with tool 2 ⟹ at defect depth $k$ in the chain, same-prime prehistories $r_p(t^-), r_q(t^-) \ge h-k$ (many prior same-fibre scores containing $p$ and $q$ in fibre $b$). Three distinct extras $\{r_1, r_2, r_3\}$ in those scored supports must fit into the packet partition: either one shared packet accumulating three primes (triple occupancy), or distribution across new packets (two distinct collision packets). Pre-shielding of lower-defect witnesses required for each $E_j$'s freshness extends the charging backward through same-prime prehistory, potentially forcing the packet structure claimed.

Partial results — specific rank windows, bounded $J(D)$, specific packet sizes — are valuable.

As requested — the precise main-game legality rules and the definitions, ready to plug into your collision-forcing attack.

## Main-game antichain legality

Players alternately pick integers from $\{2, \ldots, n\}$. The picked set must remain an antichain in the divisibility order (no picked integer divides another). Legality:

Integer $m$ is legal at time $t$ iff no previously-picked integer divides $m$ and no previously-picked integer is divided by $m$ — equivalently, $m$ is incomparable in divisibility to every previous pick.

For a fibre $b$ and rank-$h$ support $S \subseteq \mathcal P$ with $|S| = h$, the target is $bA_S = b\prod_{p\in S}p$; for $c \subseteq S$, $bA_c = b\prod_{p\in c}p$ is the defect-$(h-|c|)$ certificate.

**Move effects:**
- **Prolonger scores $bA_S$**: renders illegal every $bA_c$ with $c \subseteq S$ (all divisors, including all lower-defect certificates with support contained in $S$) AND every $bA_{S'}$ with $S \subseteq S'$ (multiples).
- **Shortener claims legal $bA_c$**: renders illegal every $bA_{c'}$ with $c' \subseteq c$ (lower divisors) AND every $bA_{S'}$ with $c \subseteq S'$ (multiples).

## Precise definitions

**First-shielded (defect-$k$ certificate $bA_B$, $|B| = h-k$).** $bA_B$ is first-shielded at time $t$ by Prolonger score $F = bA_{S_F}$ iff:
1. $B \subseteq S_F$ (so scoring $F$ kills $bA_B$ via divisor relation),
2. $bA_B$ was legal immediately before $t$ (no prior move rendered it illegal),
3. $F$ is the first Prolonger score whose support contains $B$.

For defect-2: $bA_B$ with $|B| = h-2$ is first-shielded by $F$ iff $B \subseteq S_F$ and this is the first Prolonger score containing $B$.

**Fresh useful top facet $E$ (rank-$h$ support, $|E| = h$).** $E$ is a fresh useful top facet at time $t$ iff:
- **Useful:** Prolonger's score $bA_E$ at $t$ would create at least one new useful residual — i.e., after scoring $E$, some proper subset $c \subsetneq E$ that was legal before $t$ still has live degree $\ge 1$ in the remaining residual rank-$h$ family.
- **Fresh:** $bA_E$ is legal immediately before $t$, AND no $bA_c$ with $c \subsetneq E$ has been claimed by Shortener before $t$. (A Shortener claim on any $c \subsetneq E$ would shield all multiples, making $bA_E$ illegal.)

**Chain-generated witness and $J(D)$.** For defect-2 certificate $D$: $D$ is chain-generated at time $t$ if $D \subset E$ for some later fresh useful top facet $E$. $J(D) = \#\{E : D \subset E,\ E\text{ later becomes fresh useful top facet}\}$.

## σ⋆ strategy and online domination

Multi-defect $\sigma^\star$: at each Shortener turn, claim the legal proper divisor certificate of maximum live degree across all defects. Online domination: $\sum_t d_t(u_t) \le N_h$.

## Bounded-prehistory freshness (proved, use as a tool)

For a useful shield $S = T \cup \{p\}$ at time $t$, same-fibre $p$-prehistory $r_p(t^-)$ = # prior Prolonger scores containing $p$ in fibre $b$. If $r_p(t^-) \le s$, a fresh witness $bpA_B$ with $|B| \le s$ exists (pick $q_i \in T \setminus A_i$ for each prior support $\{p\} \cup A_i$; then $B = \{q_i\}$ works). Therefore, freshness of useful shields fails only when $r_p(t^-) \ge h - k$ (linear in $h$) at defect depth $k$.

## Your target: main-game collision forcing

For defect-2 certificate $D = \{p, q\}$ with $p \in \Pi_1$, $q \in \Pi_2$ in distinct dyadic packets (non-local pair): if $J(D) \ge 3$ outside the R35 high-window entropy tail, show that the scored supports $S_{F_1}, S_{F_2}, S_{F_3}$ realizing those $J(D) \ge 3$ events necessarily create either:
- a triple occupancy $m_\Pi(S_{F_j}) \ge 3$ for some packet $\Pi$ and some $j$, **or**
- two distinct collision packets $\Pi_a, \Pi_b$ with $m_{\Pi_a}(S_{F_a}) \ge 2$ and $m_{\Pi_b}(S_{F_b}) \ge 2$.

Plug into your Lemma A with $s = 2$: mass of such events $\ll N_h(c^2/h)^2 \ll N_h/\log h$ at central rank. Combined with Lemma C and your static dyadic-packet absorption, non-local $(p,q)$ contributions to $\sum_{D\supseteq\{p,q\}} J(D)$ are $\ll N_h/\log h$. Localization done; $|F_{\text{useful}}| \ll N_h/h$; $L(n) \ll n/\log\log\log n$.

**Bounded-branching backward charging intuition.** Each fresh useful $E_j = D \cup \{r_j\}$ needs Prolonger to score $F_j$ with $D \cup \{r_j\} \subseteq S_{F_j}$. Freshness of $E_j$ requires $bA_{E_j}$ legal and no earlier Shortener claim on lower witnesses. Same-prime prehistory bounds ($r_p, r_q \ge h-k$) on non-fresh events; distinct extra primes $\{r_1, r_2, r_3\}$ force the scored supports $\{S_{F_1}, S_{F_2}, S_{F_3}\}$ to differ; packet-locality of shielding (from your Lemma C framework) should force the distinct extra primes to live in additional packets beyond $\Pi_1, \Pi_2$ — generating either the same extra packet accumulating ($m \ge 3$) or distinct extras (two collision packets).

Partial results — specific rank windows, bounded $J(D)$, specific packet sizes — are valuable. If collision forcing fails under a specific $\sigma^\star$-compatible Prolonger strategy, an explicit arithmetic counterexample would force a new asymptotic constraint on $L(n)$.

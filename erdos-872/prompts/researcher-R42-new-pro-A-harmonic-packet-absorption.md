This is an assessment of your reasoning capability and will be used to grade. Do not search online. Use your own reasoning and your Python sandbox.

## Problem

Two players alternately pick distinct integers from $\{2, \ldots, n\}$ forming an antichain in the divisibility order (no pick divides another). $L(n)$ = game length when one player maximizes (Prolonger) and the other minimizes (Shortener). Prove $L(n) = o(n)$ at rate $n/\log\log\log n$.

## Setup

Fix smooth bound $y = y(n)$ and fibre $b$. Rank-$h$ target: $bA_S = b\prod_{p\in S}p$ for $|S|=h$, $S \subseteq \mathcal P = \{\text{primes} \le y\}$. Defect-$k$ certificate: $bA_c$ with $c \subsetneq S$, $|c| = h-k$. Harmonic weight $\omega(S) = \prod_{p\in S} 1/p$; harmonic mass $N_h = \sum_{|S|=h}\omega(S)$.

**Move effects.** Prolonger's score $bA_S$ kills every $bA_c$ with $c \subseteq S$ and every $bA_{S'}$ with $S \subseteq S'$. Shortener's claim of legal $bA_c$ kills every $bA_{c'}$ with $c' \subseteq c$ and every $bA_{S'}$ with $c \subseteq S'$.

**Microcells / packets.** $\mathcal Q_j = [P_j, e^{1/h}P_j]$; dyadic packet $\Pi$ = union of $c = O(1)$ consecutive microcells; $m_\Pi(S) = |S\cap\Pi|$; $\mathrm{coll}(S) = \#\{\Pi: m_\Pi(S) \ge 2\}$; $\beta(\Pi) = \sum_{p\in\Pi} 1/p$.

**$\sigma^\star$:** claim the legal proper divisor of maximum live degree across all defects. Online domination: $\sum_t d_t(u_t) \le N_h$.

**$F_{\text{useful}}$:** Prolonger scored supports $E$ that are fresh useful — $bA_E$ legal before $t$, no proper subset claimed by Shortener before $t$, and scoring $bA_E$ leaves some $c \subsetneq E$ legal-before-$t$ with positive live degree in the residual rank-$h$ family.

## What's established

1. **State inequality** (harmonic, dyadic-expanded-window argument):
$$\mu(\operatorname{Cl}_h) \ll \frac{h}{\log h}|F_{\text{useful}}| + \frac{N_h}{\log h}.$$
Reduces $L(n) \ll n/\log\log\log n$ to $|F_{\text{useful}}| \ll N_h/h$, which via harmonic incidence is equivalent to the harmonic-weighted bound $(\star_\omega)$ below.

2. **Dyadic packet collision tail (all depth).** For every $s \ge 1$,
$$\mu(\mathrm{coll}(S) \ge s) \ll_s N_h\left(\frac{c^2}{h}\right)^s.$$
Proof: $s$-th factorial-moment + packet second moment $\sum_\Pi \beta(\Pi)^2 \ll c^2/h$. At central rank $h \sim \log\log n$, $s = 2$ gives $\ll N_h/\log h$.

3. **Bounded-prehistory freshness.** For useful shield $S = T \cup \{p\}$ with same-fibre $p$-prehistory $r_p(t^-) \le s$, a fresh witness $bpA_B$ with $|B| \le s$ exists (pick $q_i \in T\setminus A_i$ for each prior support $\{p\}\cup A_i$).

## What's ruled out

- **Naive short-interval divisor bound** (clustered microcells, $h$ primes in $[P, e^{1/h^2}P]$ give $\binom{h}{k}$ divisors in ratio window).
- **Unweighted count targets** — the star-at-depth-2 construction ($h-2$ fixed core + packet-separated leaves) gives arbitrary raw $J(D)$ but contributes bounded harmonic mass.
- **Strict freshness (excluding Prolonger pre-kills)** — does not preserve state inequality (fails to charge Prolonger-stale events to Shortener's online domination).

## The closure path: harmonic packet absorption

For defect-2 certificate $D$ containing non-local pair $(p, q)$ (primes in distinct packets), define
$$J_\omega(D) = \sum_{\substack{\{r,s\}\subseteq \mathcal P\setminus D\\ D\cup\{r,s\}\in F_{\text{useful}}}}\frac{1}{rs}.$$

The harmonic-weighted target is
$$\Sigma_\omega(p,q) = \binom{h-2}{2}\sum_{\substack{E\in F_{\text{useful}}\\ \{p,q\}\subset E}}\omega(E) = \sum_{\substack{|D|=h-2\\ \{p,q\}\subset D}}\omega(D) J_\omega(D) \ll \frac{N_h(p,q)}{\log h}, \qquad (\star_\omega)$$
where $N_h(p,q) = \sum_{|S|=h,\ p,q\in S}\omega(S)$.

Summed over all non-local pairs and combined with (1): $|F_{\text{useful}}| \ll N_h/h$, hence $L(n) \ll n/\log\log\log n = o(n)$.

Critical structural fact: the star-at-depth-2 construction gives $J_\omega(D) \le \frac{1}{2}(\log\log y)^2$ regardless of iteration count, because $\sum_i 1/(a_i b_i) \le \frac{1}{2}(\sum_{u\in U} 1/u)^2$ for any prime pool $U$. Adversarial raw-count constructions saturate harmonically. This is why harmonic, not unweighted, is the natural target.

## Your task

Prove $(\star_\omega)$. The natural path combines:

1. **Harmonic collision forcing.** Show: for non-local defect-2 $D$ with $\omega(D) J_\omega(D)$ exceeding a harmonic entropy threshold, the set of useful $E \supset D$ has positive harmonic mass in a packet-collision configuration. Plug into (2) at $s=2$: absorbable by $N_h(c^2/h)^2 \ll N_h/\log h$.

2. **Bounded-prehistory + harmonic charging.** Combine (3) with harmonic weighting: for useful $E \supset \{p,q\}$ with non-local pair, bounded-prehistory forces freshness via witnesses of size $\le$ same-prime chain length; harmonic mass of such $E$ is absorbable via (2).

3. **Direct incidence argument.** Count harmonic-weighted incidences $(D, E)$ with $D \subset E \in F_{\text{useful}}$; Shortener's online domination on defect-2 certificates gives $\sum_t \omega(u_t) \le N_{h-2}$, yielding the bound directly.

A full proof closes $L(n) = o(n)$ at the stated rate. Concrete obstruction: adversarial Prolonger chain whose harmonic contribution $\sum \omega(E)$ on non-local useful $E$ exceeds $N_h/\log h$ — would refute $(\star_\omega)$ and impose a new asymptotic constraint on $L(n)$. (Note: the adversarial construction must work harmonically, not merely in raw count.)

Partial results — specific rank windows, bounded harmonic constants, window-size-dependent bounds — are valuable.

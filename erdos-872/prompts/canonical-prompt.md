This is an assessment of your reasoning capability and will be used to grade.
Do not search online. Use your own reasoning and your Python sandbox.

Determine the sharp asymptotic rate of $L(n)$ for the game defined below. In particular, decide whether $L(n) = \Theta(n)$ or $L(n) = o(n)$, and prove the tightest upper and lower bounds you can in each direction.

Every fact stated as established below is rigorously proven unless explicitly flagged as partial (with partial items describing the exact remaining gap). Every entry in "Ruled Out" identifies a specific approach and its specific failure mechanism — study the pattern across these failures; a unifying structural obstruction is often the research signal.

## Problem

Two-player combinatorial game on $\{2, 3, \ldots, n\}$:

- Players (Prolonger and Shortener) alternate choosing integers into a shared set $A$.
- $A$ must remain an antichain under divisibility at all times.
- The game ends when $A$ is a maximal antichain (no legal move remains).
- Prolonger moves first and maximizes total moves; Shortener minimizes.
- $L(n)$ denotes the total number of moves under optimal play.

### Notation

- $U = (n/2, n] \cap \mathbb{Z}$: upper half (a trivial maximum antichain of size $\lfloor n/2 \rfloor$).
- $L = \{2, \ldots, \lfloor n/2 \rfloor\}$: lower half.
- For $P \subseteq U$: $L(P) = \{x \in L : x \nmid u \text{ for every } u \in P\}$.
- For $x \in L$: $w_n(x) = \lfloor n/x \rfloor - \lfloor n/(2x) \rfloor - 1$ (proper multiples of $x$ in $U$).
- For a Prolonger move sequence $P$: $B(P) = \{p \text{ prime} : p \mid x \text{ for some } x \in P\}$.
- $\Omega(x)$: prime factors of $x$ with multiplicity; $\omega(x)$: distinct prime factors.
- $s_2(u) := \min\{d : \Omega(d) = 2,\ d \mid u\}$.
- Semiprime exposure: $\Xi(B) := \sum_{p \in B, p \le \sqrt n} 1/(p \log(n/p))$.

## Established

Each entry is tagged by proof tier:
- **T1 (rigorous):** formally verified (Aristotle or equivalent), or proved by standard methods whose steps are individually checkable.
- **T2 (cross-derived, pending formal audit):** $k$ independent derivations agree on the theorem statement and proof structure, but no formal audit (Aristotle) has signed off; each entry logs $k$ and the derivation paths.

### Bounds on $L(n)$ (T1)

**Lower bound.** $L(n) \ge (1 + o(1)) n/\log n$. Every prime $p \in [\sqrt n, n]$ has at least one multiple in any maximal primitive subset; no two such primes share a multiple (since $p_1 p_2 > n$). So $L(n) \ge \pi(n) - \pi(\sqrt n) \sim n/\log n$.

**Second-order lower bound (T2, rigorous after 2026-04-19 Codex repair pass; not formally Lean-verified).** $L(n) \ge c_\delta n(\log\log n)^2/\log n$ via weighted pair-capture in a two-layer fiber game. The Round-13 Maker-second writeups of Lemmas 1 and 2 had an order-sensitivity gap (argued as if Prolonger responds after Shortener's deletion). Codex repaired them in Maker-first form and completed the remaining bookkeeping:

- *Lemma 1 (weighted pair-capture graph).* Maker-first potential $\phi(e) = (w/8, w/4, w/2, w)$ by endpoint-capture count (0/1/2/captured). Key domination: for any uncaptured vertex $x$ and any live edge $f \ni x$, Maker's move gain $\Delta(f) \ge P(x) = \sum_{e \ni x} \phi(e)$. Max-gain Maker move dominates both single vertex deletion (loss $= P(x) \le \Delta(f_*)$) and single edge deletion (loss $= \phi(g) \le \Delta(f_*)$). Potential is Maker-first nondecreasing; initial $Q = W/8$ is the final-captured-weight lower bound. Exhaustive sanity check: all graph states on $\le 5$ vertices pass.

- *Lemma 2 (two-layer fiber).* Reformulated as a **scored 3-uniform hypergraph capture game** on target-slot triples $(b, ab, cb)$. Breaker moves are either (a) delete one uncaptured slot or (b) *score* one live target-edge (count its weight toward final length). Maker moves score a live hyperedge and capture all three slots. Potential $Q = S + \sum_{e \text{ live}} \phi(e)$ with $\phi(e) = (w/8, w/4, w/2, w)$ by slot-capture count (0/1/2/3). Breaker scored-edge play: $\Delta Q = w(g) - \phi(g) \ge 0$. Breaker slot deletion: $\Delta Q = -P(v) \ge -\Delta(f_*)$. So $Q$ Maker-first nondecreasing; initial $Q = W/8$ is the final-score lower bound. Exhaustive sanity check: all 3-uniform hypergraphs on 4 vertices pass.

- *Divisibility → hypergraph embedding (verified 2026-04-19 follow-up).* For live target $t = acb > n/2$ with $a, c, ac$ already unavailable from the activation stage: (i) divisors of $t$ are exactly $\{1, a, c, ac, b, ab, cb\}$, so the only harmful future moves are $\{b, ab, cb, t\}$; (ii) slot plays $b, ab, cb$ delete exactly the hyperedges incident to that slot (by divisibility: e.g., $ab \mid a'c'b'$ forces $b = b'$ and $a \in \{a', c'\}$); (iii) exact-target play $t$ is modeled as a scored edge — since all targets lie in $(n/2, n]$ and are pairwise incomparable, $t$-play does not kill any other target; extra divisibility side-effects only remove future Shortener options, making the abstract model strictly Maker-friendlier; (iv) converse: every live hypergraph edge corresponds to a legal actual target move. The scored hypergraph lemma is a valid lower-bound model for the residual divisibility game.

- *Activation-stage token audit (verified 2026-04-19 follow-up).* For pair-edge $e=(a,c)$ with token set $B_e=J_{a,c}\cap\mathbb P$, let $w_t(e)$ be current live-token count. The correct activation quantity is
  \[
  Q_t = S_t + \sum_{e\ \mathrm{claimed}} w_t(e) + \sum_{e\ \mathrm{unclaimed}} c_e\,w_t(e),
  \qquad c_e\in\{1/8,1/4,1/2\},
  \]
  where $S_t$ is activation score (number of already-played activation targets). Maker's max-gain graph move still dominates graph deletions $(a),(c),(ac)$. Off-model Shortener moves only delete tokens; if $E$ is the total number of such token deletions, then
  \[
  Q_{\rm end}\ge W_0/8 - E,\qquad W_0=\sum_{a<c}|J_{a,c}\cap\mathbb P|.
  \]
  Per activation round, large-prime moves kill at most $O(Y^2/\log^2Y)$ tokens, lateral moves at most $O(Y/\log Y)$, exact targets one; across $R=O(Y^2/\log^2Y)$ rounds this gives
  \[
  E\ll Y^4/\log^4Y = o\!\big(n(\log\log n)^2/\log n\big)
  \]
  for $\delta<1/4$. Since $S_{\rm end}=O(Y^2/\log^2Y)=o(n(\log\log n)^2/\log n)$, the secured pairs still carry residual live target weight $\gg_\delta n(\log\log n)^2/\log n$, exactly what Lemma 2 needs.

No counterexample to T2 itself is known. With the Maker-first lemma repairs, the divisibility-to-hypergraph embedding, and the activation-stage token audit, T2 should now be treated as rigorous in the harness (though still not formally Lean-verified).

**Upper bound (T2, cross-derived, pending uniformity-bookkeeping writeup):** $L(n) \le (\mathcal{V}/2 + o(1)) n = (0.22002 + o(1)) n$, where
$$\mathcal{V} = \sum_{r=0}^\infty (-1)^r I_r, \qquad I_r = \frac{1}{r!} \int_{\substack{u_1, \ldots, u_r \ge 0 \\ u_1 + \cdots + u_r \le 1}} \prod_{j=1}^r \frac{du_j}{1+u_j}.$$
Numerically $\mathcal{V} = 0.440029038059\ldots$, independently verified to 12 decimals.

Proof outline. Shortener plays the smallest legal odd prime for the first $K = \lfloor (1-\varepsilon) n/(2\log n) \rfloor$ turns, obtaining primes $D = \{q_1 < \cdots < q_K\}$.

**Refined Chebyshev (Lemma 1, T2).** For every fixed $\varepsilon > 0$, uniformly for $1 \le j \le K$,
$$q_j \le (1+\varepsilon) j (\log n + \log j + O(\log\log n)).$$
Proof: before Shortener's $j$-th move, every odd prime $\le Q$ is either some prior $q_i$ ($i < j$) or divides one of Prolonger's $j$ moves of size $\le n$, so $\vartheta(Q) \le j\log n + \sum_{i<j} \log q_i$. Inductive closure via $\sum_{i<j} \log q_i \le j\log j + O(j\log\log n)$ and $\vartheta(Q) \sim Q$.

**Log-scale density.** Setting $u_j = \log q_j/\log n \in [0, 1]$, the captured-prime reciprocal density converges to $du/(1+u)$ on the log-scale, not the uniform $du/2$ that crude Chebyshev $q_j \le 2j\log n$ would give. Total captured reciprocal mass $\int_0^1 du/(1+u) = \log 2 \approx 0.693$.

**Monotone-replacement (Lemma 2).** For odd prime set $R$ and $p < q$ not in $R$, the sieve survivor count satisfies $S_{R \cup \{p\}}(n) \le S_{R \cup \{q\}}(n)$ via the injection $qa \mapsto pa$. Replacing $q_j$'s by a larger model sequence $b_j = (\lambda + o(1)) j(\log n + \log j)$ preserves the upper bound.

**Exact finite inclusion-exclusion via $\delta$-cutoff.** Ignoring the first $n^\delta$ Shortener primes, every $M \le n$ has at most $\lfloor 1/\delta \rfloor$ prime divisors from the model-prime set, so inclusion-exclusion truncates *exactly* — not asymptotically — at order $\lfloor 1/\delta \rfloor$. The factorial moments of the model-prime collision count converge to simplex integrals $\frac{1}{r! \lambda^r} \int_{u_1+\cdots+u_r \le 1,\ u_i \in [\delta, 1]} \prod du_j/(1+u_j)$. Taking $\lambda \downarrow 1$, $\delta \downarrow 0$ with the dominated-convergence majorant $(\log 2)^r/r!$ gives $\mathcal{V}$.

**Odd-part compression.** $\phi(x) = x/2^{v_2(x)}$ is injective on divisibility antichains (two antichain elements with the same odd part differ by a power of 2, hence comparable), so $|\phi(A \setminus D)| \le N_D(n)$.

Cross-derivation status: Pro-family independently derived this constant via (a) model-prime substitution + infinite-order inclusion-exclusion (constant $F = 0.440029\ldots$), (b) probabilistic sieve on uniform random odd integer + finite-order inclusion-exclusion via $\delta$-cutoff (constant $\mathcal{V} = 0.44003$), (c) second-order Bonferroni only with $qr \le n$ constraint (slightly weaker constant $C \approx 0.22704$). Audit panel: 2-of-3 sound on derivation (a), 3-of-3 sound on (b) with uniformity-bookkeeping items noted, numerical constants ratified to 12 decimals by external computation.

**Known uniformity-bookkeeping items** (do not affect validity of the technique as a building block):
- Lemma 1's $O(\log\log n)$ error constant should be stated uniformly in $j$, depending only on $\varepsilon$.
- Factorial-moment error terms should be stated uniformly for $r \le 1/\delta$.
- Dominated-convergence majorant $(\log 2)^r/r!$ should be written to exchange $\delta \downarrow 0$, $\lambda \downarrow 1$ limits with the series.

**Sharper upper bound (T2, cross-derived + 2-audit-agreeing on math, with repairable model-sequence gap):** $L(n) \le (\mathcal{W}/2 + o(1)) n \approx 0.18969 n$, where
$$\mathcal{W} = \sum_{r=0}^\infty (-1)^r J_r, \qquad J_r = \frac{1}{r!} \int_{\substack{u_1, \ldots, u_r > 0 \\ u_1 + \cdots + u_r \le 1}} \prod_{j=1}^r \rho(u_j) du_j, \qquad \rho(u) = \frac{1}{(\lfloor 1/u \rfloor + 1) u}.$$
Numerically $J_1 \approx 0.78853$, $J_2 \approx 0.18682$, $J_3 \approx 0.02009$, $J_4 \approx 0.00122$; even-Bonferroni partial sum gives $\mathcal{W} < 0.3795$ rigorously; full convolution $\mathcal{W} \approx 0.37937$.

**Key new insight: prime-count-per-range constraint.** Round 14's refined Chebyshev used Prolonger's total log-budget. Round 15 adds: each Prolonger move contains *at most $h$ distinct primes* $> n^{1/(h+1)}$ (since $h+1$ such primes would product-exceed $n$). Therefore before Shortener's first move with prime $> X = n^u$, with $Y = n^{u-\eta}$ and $u - \eta > 1/(h+1)$:
$$\pi(X) - \pi(Y) \le S(X) + h(S(X) + 1), \qquad S(X) \ge \frac{\pi(X) - \pi(Y)}{h+1} - O(1).$$
This gives piecewise log-scale captured-prime density $\rho(u) = 1/((h+1) u)$ on $(1/(h+1), 1/h]$, strictly dominating the old uniform $du/(1+u)$ on every interval (equal at endpoints). Total captured mass $\int_0^1 \rho(u) du = \sum_{m \ge 2} (1/m) \log(m/(m-1)) \approx 0.78853$, vs. Round 14's $\log 2 \approx 0.69315$.

**Round 15 additional uniformity-bookkeeping item:** monotone envelope construction at the breakpoints $u = 1/h$ (where the piecewise density $\rho$ is discontinuous). Round 14's monotone-replacement lemma applies only when the model sequence $b_j$ is monotone; the pointwise upper bound $U_j \approx (h(u)+1) j \log q_j$ is NOT monotone (drops at each breakpoint), so one must take the monotone envelope $m_j = \max_{i \le j} U_i$. The flat regions thereby created carry reciprocal mass $O(1/\log n) \to 0$, so the limiting log-scale density is still the piecewise $\rho(u)$ (breakpoint atoms are measure-zero in the reciprocal-mass limit). Repairable but not explicitly in the proof.

**Older upper bounds (superseded but formally verified).**
- $L(n) \le (5/16 + o(1)) n = 0.3125 n$ via Bonferroni-2 + crude Chebyshev $q_j \le A j \log n$. Optimal truncation $s_t = \sum_{q \in E} 1/q \to 1/A = 1/2$ gives evaluator $f(1/2) = 5/8$, bound $(n/2) \cdot 5/8 = 5n/16$. The $s_t = 1/2$ is the optimal truncation for Bonferroni-2 on crude density $du/2$; it is *not* a fundamental cap on accessible reciprocal mass (the refined Chebyshev captures $\log 2 > 1/2$).
- $L(n) \le (13/36 + o(n)) n$ via strictly-truncated odd-prime-prefix (formally verified zero-gap). Sharper tail truncation.

### Shield Reduction Theorem (T1, formally verified)

Fix $P \subseteq U$. Then every eventual maximal $A$ satisfies
$$|A| \ge |U| - \beta(P),\quad \text{where } \beta(P) = \max\left\{\sum_{x \in B} w_n(x) : B \subseteq L(P)\ \text{antichain}\right\}.$$

Proof: $B := A \cap L$ is an antichain in $L(P)$; by maximality $A \cap U = U \setminus \bigcup_{x \in B} M(x)$; union bound. Consequence: to prove $L(n) \ge (1/2 - c)n$ it suffices to find an adaptive rule for Prolonger's first $k$ shield moves such that $\beta(P_k) \le cn$ uniformly in $n$.

### Polynomial shield lower bound (T1)

For $|P| \le n^\alpha$: $\beta(P) \ge ((1/2)\log(1/\alpha) + o(1)) n$. Proof via prime-antichain + log-budget exchange argument + Mertens. Consequence: any linear-lower-bound proof via shield reduction requires $|P| \ge n^{1/e - o(1)}$.

### Minimum unweighted upper cover (T1, formally verified)

$\tau(n) = 5n/24 + O(1)$, via the explicit cover $H_n = \{u \in U : u \equiv 2 \pmod 4\} \cup \{u \in U : u > 2n/3, u \equiv 0 \pmod 4\}$ and a matching packing $P_n$. Formally verified.

### $F_\alpha$ static reduction (T1)

Fix $\alpha \in (1/3, 1/2)$, $y = n^\alpha$. Define
$$F_\alpha = \{p \le y : p \text{ prime}\} \cup \{d \le n/2 : \Omega(d) = 2,\ P^-(d) > y\}.$$

1. $F_\alpha$ is an antichain.
2. If $A \supseteq F_\alpha$, every further legal $x \le n$ satisfies $\Omega(x) \le 2$ with every prime factor $> y$ (since $\Omega(x) \ge 3$ with primes $> y$ gives $x > y^3 = n^{3\alpha} > n$).
3. Surviving admissible count after $F_\alpha$ installed: $O_\alpha(n/\log n)$ (upper primes $\sim n/(2\log n)$ plus upper semiprimes with both primes $> y$, $O_\alpha(n/\log n)$).

So an antichain containing $F_\alpha$ terminates within $O_\alpha(n/\log n)$ additional moves. The $\alpha > 1/3$ threshold is strict: at $\alpha = 1/3$ exactly, $n^{3\alpha} = n$ and $\Omega = 3$ survivors exist.

### $Q_\alpha$ composite-batching-resistance (T1)

Let $Q_\alpha = \{d \le n/2 : \Omega(d) = 2,\ P^-(d) > n^\alpha\}$. Any *composite* move $x$ is comparable to at most one element of $Q_\alpha$: two distinct $d_1, d_2 \in Q_\alpha$ dividing $x$ force $x > n^{3\alpha} > n$; $x \mid d_i$ with $\Omega(d_i) = 2$ forces $x = d_i$.

**Prime batching is possible**, however: a single prime move $p > y$ is comparable to every $pq \in Q_\alpha$ with $q$ prime and $pq \le n/2$, i.e., $\pi(n/(2p)) - \pi(p - 1)$ elements simultaneously. At $n = 10^6, \alpha = 0.45$: prime $503$ kills $72$ elements of $Q_\alpha$.

### Resolution Theorem against disjoint small-prime carriers (T1)

Fix $y = n^\alpha$, $1/3 < \alpha < 1/2$. Assume every composite Prolonger move has all prime factors $\le y$ and distinct composite Prolonger moves have pairwise-disjoint prime supports. Then Shortener has a strategy giving $L(n) = O_\alpha(n/\log n)$:

1. Every legal prime.
2. For each $p$ in a composite carrier with $\ge 2$ distinct primes and $p^{e(p)+1} \le n$ (where $e(p) = v_p(\text{carrier}(p))$): play $p^{e(p)+1}$.
3. For each pair $p, q$ in distinct composite carriers: play $pq$.

Legality: each move is incomparable with prior moves by disjoint-supports + exponent reasoning. Resolution: any surviving legal $x$ with $p \mid x$ must have all primes in a single carrier $C(p)$; either $x \mid C(p)$ (illegal) or some $r \mid x$ has $v_r(x) > e(r)$, forcing $r^{e(r)+1} \mid x$ and comparability with the phase-2 move (or $x > n$). Move count: $\pi(n) + \pi(y) + \pi(y)^2 = O_\alpha(n/\log n)$ since $\alpha < 1/2$.

**The universal block-product Prolonger counter lies in this class**, so $L(n) = O(n/\log n)$ against it.

### Rank-$\le 3$ overlap extension (T1)

Fix $\alpha \in (1/3, 1/2)$ and $y = n^\alpha$. Suppose every composite Prolonger move is (i) squarefree, (ii) supported on primes $\le y$, (iii) of support rank $\le 3$. Then Shortener has a four-phase strategy giving $L(n) = O_\alpha(n/\log n)$, *without* any disjointness hypothesis:

1. Every legal prime.
2. For each prime $p$ appearing in a composite carrier, not already played: $p^2$.
3. Every legal squarefree semiprime $pq$ on blocked primes.
4. Every legal squarefree triple $pqr$ on blocked primes.

Survivor induction: any $x$ surviving all phases with $|\operatorname{supp}(x)| \ge 4$ has a triple $pqr \mid x$ that was played in phase 4 or blocked earlier by a prime, semiprime, or rank-$\le 3$ carrier with support in $\{p, q, r\}$. Move count: $\pi(n) + \pi(y) + \pi(y)^2 + T_\alpha(n)$, where
$$T_\alpha(n) := \#\{p < q < r \le y : pqr \le n\} = O_\alpha(n/\log n),$$
via the split at $pq = n^{1-\alpha}$: low-$pq$ gives $\pi(y) \cdot \#\{pq \le n^{1-\alpha}\} = o(n/\log n)$; high-$pq$ forces $p > n^{1-2\alpha}$ and $\sum_{n^{1-2\alpha} < p < q \le y} 1/(pq) = O_\alpha(1)$ by two Mertens sums on a fixed log-length interval. Constant degenerates as $\alpha \to 1/2$ but stays bounded for any fixed $\alpha < 1/2$. At $n = 10^6$, $\alpha = 0.45$: $T_\alpha(n) = 35{,}415 \approx 0.489 \cdot n/\log n$.

**Consequence.** The position $\{30, 42, 70\}$ (shared primes $\{2, 3, 5, 7\}$, pairwise overlapping) is resolved: Shortener plays $\{11\}$ in phase 1 (legal since $11 \notin \{2,3,5,7\}$), $\{4, 9, 25, 49\}$ in phase 2, $105$ in phase 4. Every divisibility dependency is captured.

### Circuit Lemma and Simplex Obstruction (T1)

**Circuit Lemma.** Let $\mathcal{C} \subseteq 2^{\mathcal{P}}$ be the family of supports of the current squarefree Prolonger carriers. Call $T \subseteq \mathcal{P}$ a *legal circuit* if (1) $T$ is incomparable with every $S \in \mathcal{C}$ and (2) every proper subset $U \subsetneq T$ is contained in some $S \in \mathcal{C}$. Then $m_T := \prod_{p \in T} p$ is a legal move against $\mathcal{C}$, and any legal move comparable with $m_T$ is a multiple of $m_T$.

Proof: (1) gives incomparability with every carrier. Any proper divisor $x \ne m_T$ of $m_T$ is squarefree with $\operatorname{supp}(x) \subsetneq T$; by (2), some carrier $C_S$ has $\operatorname{supp}(x) \subseteq S$; both squarefree gives $x \mid C_S$, so $x$ is comparable with $C_S$ and illegal.

**Simplex Obstruction.** For the first $t$ odd primes $q_1 < \cdots < q_t$ with $Q_t := \prod q_i \le n$, let $T = \{q_1, \ldots, q_t\}$ and $C_i := 2 Q_t / q_i$ (support $S_i = \{2\} \cup (T \setminus \{q_i\})$). The $C_i$ form a squarefree antichain; $T$ is a legal circuit for $\{S_1, \ldots, S_t\}$; $Q_t$ is legal. Maximal $t(n)$ with $Q_t \le n$ is $(1 + o(1)) \log n / \log\log n$ via $\vartheta(x) \sim x$ and $p_t \sim t \log t$.

**Scope.** No theorem of the form "from every squarefree overlapping-carrier position, Shortener can resolve with moves of support rank $\le k$" holds for any fixed $k$, nor for $k = o(\log n / \log\log n)$. Any bounded-rank local-repair extension of the rank-$\le 3$ theorem must fail; extensions must allow playing circuit moves $m_T$ of rank up to $\log n / \log\log n$. Non-repair proofs (density, entropy, LP duality, probabilistic charging) are not ruled out.

### Classical estimates (T1)

**Universal block-product Prolonger counter.** For every Shortener strategy $\sigma$, Prolonger has a response forcing
$$\sum_{p \in B(P)} 1/p \ge (1/2) \log\log n + O(1).$$
Construction: partition primes $\le n^{1/3}$ greedily into disjoint sets $S_1, \ldots, S_r$, filling each until $x_i := \prod_{p \in S_i} p$ just exceeds $\sqrt n$. Blocks are pairwise coprime, $x_i x_j > n$; any Shortener move $s$ can invalidate at most one block (three-case analysis on $s \mid x_i$, $x_i \mid s$, mixed). Prolonger plays greedy-descending by $v(x_i) = \sum_{p \in S_i} 1/p$, securing half the total mass $\sum_{p \le n^{1/3}} 1/p = \log\log n + O(1)$.

**Unconditional semiprime exposure.** $\Xi(B) = O(\log\log n/\log n)$ for any $B$, by Mertens on $p \le \sqrt n$.

**Positive lemma on rough $\Omega \ge 3$ integers.** For $D \ge 4$,
$$\#\{u \in U : \Omega(u) \ge 3,\ s_2(u) > D\} \ll n \log\log D / \log D,$$
via Brun's upper-bound sieve.

**Sub-Markov-chain primitive-set bound (potentially relevant external tool, not yet tried in this program).** For any primitive set $A \subseteq \mathbb{N} \cap [x, \infty)$,
$$\sum_{a \in A} \frac{1}{a \log a} \le 1 + O\!\left(\frac{1}{\log x}\right).$$
Proof technique: construct a sub-Markov chain on $\mathbb{N}$ with visit probabilities $\propto 1/(n \log n)$; a first-hit mass argument bounds total hit probability on any antichain by $1$. Combined with analytic normalization, yields the sharp constant. This is an LYM-style bound for the specific $1/(n \log n)$ weighting — tighter than classical LYM gives for this weight. The sub-Markov-chain construction is a new probabilistic tool that has not been applied to the game $L(n)$; adapting the method with different engineered visit probabilities could in principle bound either $|A|$ directly or the reciprocal sum of the multiplicative-closure skeleton that drives the band-local explosion obstruction. The specific $1/(a \log a)$ bound does not by itself tighten upper bounds on $L(n)$ (it gives $|A| \le O(n \log n)$ for $A \subseteq (n/2, n]$, weaker than the trivial $|A| \le n/2$).

### Post-hoc obstruction on blocked-large-prime overlap (T1 structural core + T2 sparse-subset reduction)

**Setup.** Fix $\alpha < \beta < \gamma < 1/2$ and $Q := \{q \text{ prime} : n^\beta \le q \le n^\gamma\}$. Define the squarefree rank-3 carrier family
$$\mathcal{E} := \{2ab : a, b \text{ odd distinct primes}, 2ab \le n\}$$
(every carrier contains the prime $2$ plus two odd primes). Define the residual set
$$\mathcal{M}_Q := \{qab : q \in Q, a, b \text{ odd distinct primes}, n/3 < qab \le n\}.$$

**Isolation claim.** After $\mathcal{E}$ is installed, every $m = qab \in \mathcal{M}_Q$ is an *isolated maximal* legal move: $m$ is legal, has no legal proper divisor, and has no legal proper multiple in $[2, n]$.

*Proof (Circuit Lemma + proper multiples).* Take $T = \{q, a, b\}$. Every carrier in $\mathcal{E}$ contains $2$; $T$ does not, so $T$ is incomparable with every carrier. Every proper subset of $T$ is contained in some $\{2, u, v\} \subseteq \operatorname{supp}(2uv) \in \mathcal{E}$ (with $(u, v)$ one of $(q, a), (q, b), (a, b)$; each such $2uv \le 2m/3 \le n$). So $T$ is a legal circuit, and $m_T = m$ is legal with any comparable legal move a multiple of $m$. Since $m > n/3$, any proper multiple $\le n$ is $2m = 2qab$, whose support contains $\{2, q, a\} = \operatorname{supp}(2qa)$, so $2qa \mid 2m$ and $2m$ is illegal. Hence $m$ is isolated.

**Counting.** $|\mathcal{M}_Q| \gg n \log\log n / \log n$. Fix $\delta < \min(\beta, (1 - \gamma)/2)$ and consider the choices $q \in Q$, $a \le n^\delta$ odd prime, $b \in (X/3, X]$ prime with $X = n/(qa) \ge n^{1 - \gamma - \delta} \to \infty$. By PNT, $\pi(X) - \pi(X/3) \gg X / \log n$. Summing: $\sum_{q \in Q} \sum_{a \le n^\delta \text{ prime}} X/\log n = (n / \log n) \cdot (\sum_{q \in Q} 1/q) \cdot (\sum_{a} 1/a)$. By Mertens, $\sum_{q \in Q} 1/q \asymp \log(\gamma/\beta) = O_{\beta,\gamma}(1)$; $\sum_{a \le n^\delta \text{ prime}} 1/a \sim \log\log n$. Double-counting via the 6 permutations of $(q, a, b)$ gives multiplicity $\le 6$; the lower bound survives.

**Consequence.** If $\mathcal{E}$ is installed as a Prolonger-facing prefix, the residual game has $\gg n \log\log n / \log n$ forced moves. Any Resolution-style strategy that allows $\mathcal{E}$ to be installed cannot resolve the residual in $o(n \log\log n / \log n)$ moves. Any proof of $L(n) = O(n / \log n)$ must therefore prevent $\mathcal{E}$-style families from being installed in the first place.

**Sparse-subset realization (rigorous).** Fix $\delta$ with $0 < \delta < \min(\beta, (1 - \gamma)/2)$, $A := \{a \le n^\delta : a \text{ odd prime}\}$. For $(q, a) \in Q \times A$ define the prime-interval $I(q, a) := (n/(3qa), n/(qa)]$. Let
\begin{align*}
S_{QA} &:= \{2qa : q \in Q, a \in A\} \\
S_{AB} &:= \{2ab : a \in A,\ b \text{ prime},\ b \in I(q, a) \text{ for some } q \in Q\} \\
S_{QB} &:= \{2qb : q \in Q,\ b \text{ prime},\ b \in I(q, a) \text{ for some } a \in A,\ b \ne q\} \\
S &:= S_{QA} \cup S_{AB} \cup S_{QB}.
\end{align*}

Size bounds (elementary):
- $|S_{QA}| \le \pi(n^\gamma) \pi(n^\delta) = O(n^{\gamma+\delta}/\log^2 n) = o(n/\log n)$ since $\gamma + \delta < 1$.
- $|S_{AB}|$: for fixed $a$, valid $b$ satisfies $b \le n^{1-\beta}/a$, so $|S_{AB}| \ll \sum_{a \in A} n^{1-\beta}/(a \log n) \ll n^{1-\beta} \log\log n / \log n = o(n/\log n)$ since $\beta > 0$.
- $|S_{QB}|$: for fixed $q$, valid $b$ satisfies $b \le n/(3q)$, so $|S_{QB}| \ll \sum_{q \in Q} n/(q \log(n/q)) \ll_\gamma (n/\log n) H_Q = O_{\beta,\gamma}(n/\log n)$ where $H_Q = \sum_{q \in Q} 1/q$.

So $|S| = O_{\beta, \gamma}(n/\log n)$.

Residual count. For $q \in Q$, $a \in A$, $b \in I(q, a)$ prime with $b \ne q$: all three required carriers $2qa$, $2qb$, $2ab$ lie in $S$, so $m = qab \in \mathcal{M}_Q$ is isolated by the Circuit Lemma (applied as in the theorem above). By PNT on the fixed-ratio interval $(X/3, X]$ with $X = n/(qa) \ge n^{1-\gamma-\delta}$, $\#\{b \text{ prime in } I(q,a)\} \gg X/\log n$. Summing:
$$\#\{(q, a, b)\} \gg \frac{n}{\log n} H_Q \sum_{a \in A} \frac{1}{a} \gg_{\beta, \gamma} \frac{n \log\log n}{\log n}.$$

Distinct $m$'s via $\le 6$ orderings of the 3-prime support (plus $O(|Q||A|) = o(n \log\log n / \log n)$ exceptional cases where $b = q$) give
$$|\{m \in \mathcal{M}_Q : \text{req}(m) \subseteq S\}| \gg_{\beta, \gamma} \frac{n \log\log n}{\log n}.$$

Hence: for every $Q$ with $H_Q \gg_{\beta, \gamma} 1$, there exists $S \subseteq \mathcal{E}$ of size $O_{\beta, \gamma}(n/\log n)$ that isolates $\gg_{\beta, \gamma} n \log\log n / \log n$ elements of $\mathcal{M}_Q$.

Empirical confirmation (independent computation). For $(\beta, \gamma) = (0.40, 0.49)$, greedy min-cover targeting $R = |\mathcal{M}_Q|/2$: ratio $S/R \in \{0.814, 0.682, 0.515, 0.416, 0.339\}$ across $n \in \{10^4, 3 \cdot 10^4, 10^5, 3 \cdot 10^5, 10^6\}$. Normalized $(S/R) \log\log n$: $\{1.880, 1.591, 1.257, 1.056, 0.890\}$ — decreasing faster than $1/\log\log n$. At $n = 10^6$: $|S| = 3{,}613$, $R = 10{,}657$, $|\mathcal{M}_Q| = 21{,}311$, $|U_\text{carr}| = 8{,}994$. Greedy strictly beats the explicit construction above ($S/R = 0.545$ at $n = 10^6$) by factor $\sim 1.6$, consistent with the analytic bound being loose but of the right shape.

**The obstruction is now rigorous under the $O(n/\log n)$ hypothesis.** Installing an $O(n/\log n)$-sized carrier subset forces a residual of $\gg n \log\log n / \log n$ isolated moves that Shortener must play individually. The post-hoc obstruction is no longer self-referentially hollow.

### LCM Obstruction and Multi-Block Paradox (T1, structural facts)

**LCM Obstruction.** For any two distinct elements $m_1 = q_1 a_1 b_1$ and $m_2 = q_2 a_2 b_2$ of $\mathcal{M}_Q$ (with $q_i \in Q$, $a_i \in A$, $b_i$ odd primes, $n/3 < m_i \le n$), their least common multiple satisfies $\text{LCM}(m_1, m_2) > n$. Proof: even in the maximally overlapping case (sharing two primes), $\text{LCM} = q a b_1 b_2$ with $b_1 b_2 > (n/(3qa))^2 \cdot 3qa/q = n^{2 - \gamma - \delta}/(3qa)^2 \cdot qa$... (more simply: generic disjoint-support case gives LCM $= m_1 m_2 / \gcd \ge m_1$; overlapping cases each reduce to showing the extra prime factor pushes the product above $n$). Consequence: no legal move $\le n$ can be comparable-from-above with two distinct elements of $\mathcal{M}_Q$ simultaneously.

**Multi-Block Paradox.** If $M = 2 q a_1 \cdots a_k$ with $q \in Q$, $a_i \in A$, $M \le n$, then $M$ is incomparable with any residual $m = q a_i b \in \mathcal{M}_Q$: (i) $M \nmid m$ since $2 \mid M$ but $m$ is odd; (ii) $m \nmid M$ since $b \in \text{supp}(m)$ but $b \notin \text{supp}(M) = \{2, q, a_1, \ldots, a_k\}$. Playing $M$ therefore does not kill $m$ directly. However, $M$'s proper divisors include each $2 q a_i$ and each $q a_i$, making them illegal. In particular, $M$ plays the same Circuit-Lemma shielding role as Prolonger's carrier $2 q a_i$ — it places the proper subset $\{q, a_i\}$ of the triple $T = \{q, a_i, b\}$ inside an installed-antichain support, as required for $T$ to be a legal circuit. So the multi-block move does not destroy residuals; it functions as a shielding carrier.

### Upper-half fan lower bounds — first-order (T1) and second-order (T2)

**First-order theorem (T1; 4 responses × 3 derivations, audit-consistent).** For every fixed $\delta \in (0, 1/2)$,
$$\liminf_{n \to \infty} \frac{L(n) \log n}{n \log\log n} \ge \frac{1}{8}.$$

Consequently $L(n) \ne O(n/\log n)$.

**Second-order claim (T2; raw counting rigorous; abstract Maker-first capture lemmas repaired 2026-04-19; embedding step still to verify).** Claimed: for every fixed $\delta \in (0, 1/4)$,
$$L(n) \ge c_\delta \cdot \frac{n (\log\log n)^2}{\log n}$$
for some $c_\delta > 0$, which would imply $L(n) \ne O(n \log\log n / \log n)$.

Construction: targets $acb \in (n/2, n]$ with $a < c$ odd primes $\le n^\delta$ and $b$ a large prime in $J_{a,c} = (n/(2ac), n/(ac)]$. Raw count $|\mathcal{T}| \gg n (\log\log n)^2 / \log n$ via $\sum_{a < c \le n^\delta} 1/(ac) \asymp (\log\log n)^2$ (double Mertens). **Raw counting layer and activation-supply estimate audit as rigorous.**

**Order-sensitivity gap and repair (2026-04-19).** Both original lemmas were written Maker-second ("if Shortener deletes $X$, Prolonger can capture $Y$, potential never decreases"), implicitly treating Prolonger as responding after Shortener. In the alternating game Maker moves first. Codex has now produced Maker-first repairs for both:

- **Lemma 1 — weighted pair-capture (Maker-first).** Edge potential $\phi(e) \in \{w/8, w/4, w/2, w\}$ by endpoint-capture count. Domination: for any uncaptured vertex $x$, $P(x) := \sum_{e \ni x} \phi(e)$ satisfies $\Delta(f) \ge P(x)$ for every live $f \ni x$, where $\Delta(f)$ is Maker's total potential gain from claiming $f$. Max-gain Maker move dominates Breaker vertex deletion (loss $= P(x) \le \Delta(f_*)$) and Breaker edge deletion (loss $= \phi(g) \le \Delta(f_*)$). Potential nondecreasing; initial $W/8$ is the final claimed-weight lower bound. Sanity-checked on all graph states $\le 5$ vertices.

- **Lemma 2 — scored 3-uniform hypergraph capture (replaces original two-layer-fiber statement).** Target hypergraph has hyperedges $e = \{b, ab, cb\}$ on slot triples for each surviving target $acb$. Breaker moves: (a) delete one uncaptured slot, or (b) *score* one live hyperedge (count weight into final length $S$). Maker moves score a live hyperedge and capture all three slots. Potential $Q := S + \sum_{e\text{ live}} \phi(e)$ with $\phi(e) \in \{w/8, w/4, w/2, w\}$ by slot-capture count. Breaker scored-edge move increases $Q$ by $w(g) - \phi(g) \ge 0$; slot deletion costs $P(v) \le \Delta(f_*)$. $Q$ Maker-first nondecreasing; initial $W/8$ is final $S$ lower bound. Sanity-checked on all 3-uniform hypergraphs on 4 vertices.

See [phase4/t2_maker_first_lemmas.md](../phase4/t2_maker_first_lemmas.md) for the full writeup.

**Status (2026-04-19 follow-up).** Items (i)-(iii) above have now been checked in Codex writeups: Maker-first lemmas repaired, divisibility-game embedding verified, and activation-stage bookkeeping closed by the token audit in [researcher-22-codex-T2-activation-audit.md](../researcher-22-codex-T2-activation-audit.md). No counterexample to T2 itself known.

**Key insight defeating the earlier "rank-4 collapse" argument.** The lateral divisor $ab$ of a rank-4 target $2 a_1 a_2 b$ (or $ab$ of a rank-3 target $acb$) is a powerful Shortener move ONLY BEFORE any target using it is played. Once Prolonger plays any target containing both $a$ and $b$, $ab$ becomes illegal (divides the target). Prolonger auto-shields TWO proper divisors per target play ($ab$ and $cb$); Shortener can kill only ONE per turn. This 2-vs-1 protection economy sustains the fan hierarchy at higher ranks.

**Construction.** Let $Y = n^\delta$, $\mathcal{A} = \{a \text{ prime} : 3 \le a \le Y\}$, $J_a = (n/(2a), n/a]$. Target moves: $t_{a,b} := ab$ with $a \in \mathcal{A}$, $b \in J_a$ prime. Every target is an *odd upper-half* integer in $(n/2, n]$. Since $\delta < 1/2$, $b > n^{1-\delta}/2 \gg n^\delta \ge a$, so $a, b$ are distinct.

**Key structural insight.** Because targets $ab > n/2$, they have no proper multiple $\le n$. Shortener cannot attack any target from above via a composite. Any Shortener move comparable with $ab$ must be a proper divisor; the proper divisors are exactly $\{1, a, b, ab\}$. After $a$ is "activated" (Prolonger plays some $ab_0$), $a$ becomes illegal. After $b$ is "captured" (Prolonger plays some $a_0 b$), $b$ becomes illegal. So Shortener's destructive attacks reduce to: pre-activation kill of $a$ (eliminates all targets with left-vertex $a$), pre-capture kill of $b$ (eliminates all targets with right-vertex $b$), or individual edge kill via $ab$.

Higher-rank composite moves are useless: $a b_1 b_2 > a \cdot (n^{1-\delta}/2)^2 > n$; $a_1 a_2 b > 3 \cdot 5 \cdot n^{1-\delta}/2 > n$ for large $n$. So Shortener cannot batch multiple targets via higher-rank multi-block moves from either side.

**Two-phase proof.**

*Phase 1 — Activation.* Prolonger plays smallest-first greedy: pick smallest *live* $a \in \mathcal{A}$ (i.e., $a$ not yet played by Shortener as the singleton $a$), play some legal $ab$ with $b \in J_a$ prime. Such a $b$ exists: $|J_a \cap \mathbb{P}| = (1+o(1)) n / (2a \log(n/a)) \gg n^{1-\delta}/\log n$, while at most $O(|\mathcal{A}|) = O(n^\delta / \log n)$ moves have been played; each such prior move rules out at most one $b$-value (since for a live $a$, the only divisors $s$ of $ab$ other than $a$ and $ab$ itself are $b$ — so $s$ must equal $b$). Pairing: each Shortener kill of $a'$ matches a prior Prolonger activation of $a \le a'$ (smallest-first rule). Result:
$$\sum_{a \in \mathcal{A}_0} \frac{1}{a} \ge \frac{1}{2} \sum_{a \in \mathcal{A}} \frac{1}{a} = \left(\frac{1}{2} - o(1)\right) \log\log n.$$

Raw edge count:
$$E^* = \sum_{a \in \mathcal{A}_0} |J_a \cap \mathbb{P}| = \left(\frac{1}{2} + o(1)\right) \frac{n}{\log n} \sum_{a \in \mathcal{A}_0} \frac{1}{a} \ge \left(\frac{1}{4} - o(1)\right) \frac{n \log\log n}{\log n}.$$

Activation-phase damage bound: any Shortener move destroying more than one edge must be a right-prime kill ($b$ or just $b$ itself for the odd fan; multi-block attacks ruled out by size). Right-prime degree is $\le |\mathcal{A}|$, Shortener's Phase-1 budget is $O(|\mathcal{A}|)$, so total damage $O(|\mathcal{A}|^2) = O(n^{2\delta}/(\log n)^2) = o(n/\log n)$ for $\delta < 1/2$. Hence live edges $E_0 \ge (1/4 - o(1)) n \log\log n / \log n$.

*Phase 2 — Max-degree capture.* Bipartite $G = (\mathcal{A}_0 \sqcup \{b : \exists a, b \in J_a\}, E_0)$. Apply the following standalone lemma.

**Max-degree capture lemma.** Let $G = (L \sqcup R, E)$ be any finite bipartite graph. In each round Maker selects the right vertex $r \in R$ of maximum current positive degree and captures all live edges incident to $r$; Breaker may delete all live edges incident to one uncaptured right vertex, delete at most one live edge, or do nothing. Let $C$ = total edges captured, $D$ = total edges removed by Breaker's right-vertex kills, $X$ = total edges removed individually. Then $D \le C$ and $C + X \ge |E|/2$.

*Proof of lemma.* Per round, if Maker captures with degree $c_i$ and Breaker deletes a right vertex of degree $d_i \le c_i$ (by max rule), summing gives $D \le C$. Every edge is ultimately captured, right-vertex-deleted, or individually deleted: $|E| = C + D + X \le 2C + X$, so $C + X \ge |E|/2$. $\square$

Apply to the game: after Phase 1, $a \in \mathcal{A}_0$ means $a$ is illegal for Shortener. For a live target $ab$, Shortener's comparable legal moves are only $b$ (right-vertex kill) or $ab$ (individual edge kill) — the other divisor $a$ is already illegal. No higher-rank kills exist. So the lemma applies, and Prolonger forces
$$L(n) \ge C + X \ge \frac{E_0}{2} \ge \left(\frac{1}{8} - o(1)\right) \frac{n \log\log n}{\log n}.$$

**For the $2ab$-fan** ($t_{a,b} = 2ab$ with $b \in (n/(4a), n/(2a)]$): same proof applies with proper divisors $\{1, 2, a, 2a, b, 2b, ab, 2ab\}$. After Prolonger's first move the divisor $2$ is illegal for all. Factor of 2 loss in edge count: constant becomes $1/16$. Safe explicit bound: $L(n) \ge (1/32) \cdot n \log\log n / \log n$ for all sufficiently large $n$.

**Cross-family verification status.** Four independent responses (2 Pro, 2 DeepThink) confirm the argument's rigor. Three distinct derivation paths:
1. Pro (original, $2ab$-fan), three auditors verify.
2. Pro (strengthened, odd $ab$-fan with explicit constant $1/8$ and formal Max-degree capture lemma).
3. DeepThink (verification, observes rank-4 sub-divisor collapse — see below).

**Matching upper bound is NOT established.** Standard Shortener techniques fail: smallest-legal-prime greedy ($a$ and $2a$ are illegal after one target move, but other targets remain incomparable); semiprime covers (no legal common divisor to kill multiple upper-half targets simultaneously); multiplicative block-throttle (high primes $b$ are too large to batch, $b_1 b_2 > n$). A new analytical tool is needed.

### Rank-4 collapse argument — REFUTED (T1)

The claim that Shortener's lateral move $a_1 b$ kills $\sim |\mathcal{A}|$ rank-4 targets $2 a_1 a_y b$ at once (and therefore caps the upper-half fan at rank 3) is structurally wrong. The argument ignored auto-shielding: once Prolonger plays ANY target $2 a_1 a_y b$ for some $a_y$, the lateral move $a_1 b$ becomes illegal (since $a_1 b \mid 2 a_1 a_y b$), and Shortener can no longer deploy it. Prolonger's per-target play auto-shields both laterals $a_1 b$ and $a_y b$ — two divisors per turn against Shortener's one-move-per-turn destruction.

### Fixed-rank upper-half fan hierarchy (T2; 3 cross-derivations, pending formal audit)

**Theorem.** For every fixed $h \ge 1$, there exists $c_h > 0$ such that
$$L(n) \ge c_h \cdot \frac{n (\log\log n)^h}{\log n}.$$
Explicit constant $c_h \asymp 2^{-(2^{h+1}-2)}/h!$ (up to harmless factors).

**Construction.** Fix $0 < \delta < 1/(2h)$. Let $\mathcal{A} = \{a \text{ odd prime} : a \le n^\delta\}$. For each $h$-set $S \subseteq \mathcal{A}$, put $A_S = \prod_{a \in S} a$ and $J_S = (n/(2A_S), n/A_S]$. Targets are
$$\mathcal{T}_h = \{A_S \cdot b : |S| = h,\ b \in J_S \cap \mathbb{P}\} \subseteq (n/2, n].$$
Raw count $|\mathcal{T}_h| \gg_h n(\log\log n)^h / \log n$ via $\sum_{|S|=h} 1/A_S \sim (\log\log n)^h / h!$ (Mertens^$h$).

**Proof via the divisor-shadow lemma.** Each target $t \in \mathcal{T}_h$ has $D = 2^{h+1} - 2$ nontrivial proper divisors (nonempty proper subsets of its $(h+1)$ prime factors). Because $t > n/2$, $t$ has no proper multiple $\le n$, so every Shortener attack on $t$ is via a proper divisor. Playing $t$ makes *all* its proper divisors illegal — globally. Shadow lemma (Maker-Breaker): in a game where Maker selects a live object and marks all its coordinates (shielding the divisor-star), and Breaker deletes one unmarked coordinate-star per turn, Maker forces $\ge 2^{-D}|\mathcal{T}_h|$ target-level payments.

Two independent potential-function proofs of the shadow lemma:
- **Divisor-depth greedy (one derivation):** for a live target $u$, let $r(u) \in \{0,\ldots,D\}$ count its still-open proper divisors. Prolonger greedily plays targets in maximal-star divisors; at each depth at least half of the remaining target mass advances or is paid. $D$-deep iteration gives $2^{-D}$ survival.
- **Weighted Maker potential (other derivation):** $\Phi = (\text{Maker score}) + \sum_{\text{live } x} w(x) \cdot 2^{|C(x) \cap M| - D}$. Maker's capture gain on any unmarked coordinate $c$ dominates Breaker's maximum loss from deleting the coordinate star $\{x : c \in C(x)\}$, so $\Phi$ is non-decreasing; $\Phi_0 = 2^{-D} \sum_x w(x)$ is the Maker-score lower bound.

**Key structural mechanism — upper-half auto-shielding.** For an upper-half target $A_S \cdot b$, each proper divisor is either a pure-core divisor $\prod_{a \in D} a$ ($D \subsetneq S$) or a lateral $b \prod_{a \in D} a$ ($D \subsetneq S$). A single Prolonger play of $A_S \cdot b$ makes all $2^{h+1}-2$ of these illegal for every future target sharing them, not just for $A_S \cdot b$ in isolation. The 2-vs-1 protection economy of the second-order theorem generalizes to $(2^{h+1}-2)$-vs-1 at rank $h+1$, at the cost of the $2^{-D}$ survival factor.

**Rank-specific instances:**
- $h=1$: first-order theorem ($D=2$, $c_1 \asymp 1/8$).
- $h=2$: second-order theorem ($D=6$, $c_2 \asymp 1/64$).
- $h=3$: rank-4 targets $acdb \in (n/2, n]$, proper divisors $\{a,c,d,b,ac,ad,cd,ab,cb,db,acd,acb,adb,cdb\}$ ($D=14$, $c_3 \asymp 2^{-14}$), giving $L(n) \gg n(\log\log n)^3/\log n$.

**Consequence.** $L(n) \ne O(n (\log\log n)^C / \log n)$ for every fixed $C \ge 0$.

**Cross-derivation status.** Two independent derivations agree on the fixed-rank iteration and the $2^{-2^h}$ per-rank game-theoretic loss (one via divisor-depth greedy, one via weighted potential). A third derivation via a two-phase construction (hypergraph $K$-uniform capture + $b$-fiber auto-shielding, constant $2^{-K-1} \cdot 2^{-(2^K-1)} = 2^{-(k+2^{k-1}-1)}$ with $k=h+1$) agrees on the same qualitative scaling. Pending Aristotle formalization of the shadow lemma as a standalone Maker-Breaker result.

### Structural ceiling on the fan construction (T1, arithmetic)

The raw target count at rank $h$ has an absolute ceiling from unordered $h$-set selection:
$$|\mathcal{T}_h| \sim \frac{n}{2 \log n} \cdot \frac{H^h}{h!}, \qquad H := \sum_{p \le n^\delta} 1/p \sim \log\log n.$$
By Stirling, $H^h/h!$ is maximized at $h \approx H$ with peak value $e^H/\sqrt{2\pi H} \sim \log n / \sqrt{2\pi \log\log n}$. Hence a *single rank* of the upper-half fan has raw capacity at most
$$\max_h |\mathcal{T}_h| \sim \frac{n}{2\sqrt{2\pi \log\log n}} = o(n).$$
The linear-scale target mass lives in the window $h = H \pm O(\sqrt H)$; no single rank captures $\Theta(n)$.

### Slow-growth fan optimization (T2; 1 full derivation + 2 conditional concurrences)

Taking $h = \lfloor \log_2 \log\log\log n \rfloor$ in the fixed-rank hierarchy balances the target count $H^h/h!$ against the per-rank shadow-capture loss $2^{-(2^{h+1}-2)}$. At this $h$, $2^h = \Theta(\log\log\log n)$ and Stirling gives
$$\log(H^h / h!) = h \log H - h \log h + O(h) = \left(\tfrac{1}{\log 2} + o(1)\right) \log\log\log n \cdot \log\log\log\log n,$$
while the shadow-capture loss contributes only $-O(\log\log\log n)$, lower order. Combining:
$$L(n) \ge \frac{n}{\log n} \cdot \exp\!\left(\bigl(\tfrac{1}{\log 2} + o(1)\bigr) \log\log\log n \cdot \log\log\log\log n\right) = \frac{n}{(\log n)^{1 - o(1)}}.$$
Strictly $o(n)$, and strictly stronger than every fixed-$C$ bound $n(\log\log n)^C/\log n$ (take $h > C$ to recover). Cross-derivation status: one full rigorous derivation (via the shadow-capture lemma + optimizer); two additional derivations flag the same bound as valid conditional on the shadow-capture lemma auditing clean.

### Current window

- **T1 window:** $(1/8 - o(1)) \cdot n \log\log n / \log n \le L(n) \le (13/36 + o(1)) n$ (formally verified upper bound, $13/36 \approx 0.361$).
- **T2 window (Maker-first repair complete 2026-04-19):**
  - Upper bound $L(n) \le (\mathcal{W}/2 + o(1)) n \approx 0.18969 n$ — cross-derived, pending uniformity-bookkeeping writeup. Status unchanged.
  - Lower bound $L(n) \ge c_\delta n(\log\log n)^2/\log n$ — Codex's Maker-first repair now includes the weighted graph capture lemma, the scored 3-uniform hypergraph capture lemma, the divisibility-to-hypergraph embedding, and the activation-stage token audit. Treat as rigorous in the harness, though not formally Lean-verified.
  - Slow-growth lower bound $L(n) \ge n/(\log n)^{1-o(1)}$ — rigorous, one full derivation via shadow-capture lemma + fan-hierarchy optimizer.

### Empirical trajectory (at $n \le 10^7$)

Direct simulation at $n \in [10^4, 10^7]$ against multiple strong Prolonger strategies (block-product, smooth-dense, upper-half, rank-1 and rank-2 fans) with the SLOP Shortener:

| $n$ | $L$ | $L \log n / n$ | $L/(0.19 n)$ |
|---:|---:|---:|---:|
| $10^4$ | 1833 | 1.69 | 0.83 |
| $3 \cdot 10^4$ | 5014 | 1.72 | 0.80 |
| $10^5$ | 14341 | 1.65 | 0.65 |
| $3 \cdot 10^5$ | 39512 | 1.66 | 0.60 |
| $10^6$ | 118141 | 1.63 | 0.54 |
| $3 \cdot 10^6$ | 329476 | 1.64 | 0.50 |
| $10^7$ | $\sim 10^6$ | $1.55$–$1.60$ | $\sim 0.40$ |

$L \log n / n$ stable at $\sim 1.6$ across 3 decades. Current upper bound $\approx 0.19n$ loose by factor $\sim \log n$ at practical scales. Empirical fits to $L \log n/n \sim c(\log n)^\delta$ with Ford's structural constant $\delta \approx 0.086$ REFUTED at $n = 10^7$ ($c$ continues decreasing 1.40 → 1.29, doesn't stabilize).

**The empirical data cannot identify the asymptotic rate.** T1 rules out $L(n) = O(n/\log n)$ (since $\log\log n \to \infty$, no constant $C$ satisfies $L \le C n/\log n$ for all $n$). T2 (if rigorously upgraded) would similarly rule out $O(n\log\log n/\log n)$. The $(\log\log n)^k$ factor growth is numerically invisible at $n \le 10^7$ because $\log\log n \le 2.8$ and the empirical constant is $\sim 1.6 \gg (1/8) \cdot 2.8 = 0.35$. T2's $(\log\log n)^2$ factor would only become numerically visible at $n \ge 10^{10}$ or larger. Empirically, $L\log n/n$ decreases slightly across decades, pointing qualitatively more toward $n/\log n$ than toward $n(\log\log n)^2/\log n$, but this is not proof of either.

Candidate sharp-rate targets (all compatible with empirical + rigorous lower bounds):
- $\Theta(n \log\log n/\log n)$ — matching T1 if T1 is tight.
- $\Theta(n (\log\log n)^2/\log n)$ — matching T2 if T2 is tight.
- $\Theta(n/(\log n)^{1-o(1)})$ — slow-growth scale.
- Any polylog-factor in between.

Empirical data at accessible $n$ cannot distinguish them.

**Audit of T1 rank-1 and T2 rank-3 fan proofs.** Both verified to contain no bugs (Claude audit). T1 constant $c_1 \asymp 1/8$. T2 constant $c_\delta \approx \delta^2/256 \approx 1/4096$, improved to $\approx 1/512$ via strategic-dominance argument (prime vertex-kills dominate edge/fiber-kills, reducing potential slots). At $n = 10^7$: T2 predicts $L \ge 9375$, empirical $L \approx 10^6$ — T2 is loose by factor $\sim 100$ at practical $n$. The $(\log\log n)^2$ growth in T2 is numerically invisible at tested scales.

### Remaining gap: dynamic multiplicative-closure control

Multiple attacks have converged on the same structural gap for closing matching $L(n) = O(n(\log\log n)^2/\log n)$ or $L(n) = O(n\log\log n/\log n)$:

**Conditional partial theorem (Codex charging argument, rigorous).** Under the hypothesis that every Prolonger move has at most 2 prime factors $\le y = n^\alpha$, the charging-to-small-core argument closes at T2 scale:
- One-prime cores: $\sum_{p \le y} n/(p\log n) \ll n\log\log n/\log n$ (Brun/Buchstab).
- Two-prime cores: $\sum_{a<b \le y} n/(ab\log n) \ll n(\log\log n)^2/\log n$.

**The gap.** The "$\omega_y \le 2$" hypothesis is NOT game-enforceable — Prolonger can open with $x = 2 \cdot 3 \cdot 5 \cdot q$, $q$ prime in $(n/60, n/30]$, which has 3 small primes. The specific question is: what's the reciprocal mass of cores ACTUALLY ACTIVATED by Prolonger during a specific game play?

**Round 20 update — 2-shadow control is insufficient.** The natural matching-upper-bound route via "2-shadow reciprocal-mass potential" has been refuted by an explicit $\Omega(n)$ counterexample (Pro). The obstruction: 2-shadow mass controls only the pair layer; it does not control the *multiplicative closure* generated by a safe set of small primes. Once all pairs inside a safe prime set $S$ are preempted by setup moves $x_{pq} = pq R_{pq}$, future Prolonger moves $w = p_1 p_2 p_3 \cdot c \cdot \ell$ (with $p_i \in S$ forming a triple, $c$ a squarefree small-prime factor contributing harmonic mass $\asymp \log n$, $\ell$ a y-rough prime) are legal, form an upper-half antichain, and number $\Omega(n)$. The right state variable for matching-upper-bound control must track the **squarefree multiplicative closure** or the **residual-antichain width under a certificate family**, not pair reciprocal mass.

**Open gaps (updated 2026-04-19 late, post Pro's certificate-family gap isolation):**

**Dynamic multiplicative-closure reduction theorem (Pro, rigorous).** For any certificate family $C_n \subseteq \{2, \ldots, n\}$,
$$L(n) \le 2|C_n| + 1 + \sup_{\text{reachable } (P, S)} w\!\left(R_{C_n}(P, S)\right),$$
where $R_{C_n}(P, S)$ is the residual legal-move set after certificate $C_n$ is swept and $(P, S)$ is any reachable pair of Prolonger/Shortener histories, and $w(\cdot)$ is antichain width. This reduces $L(n) = o(n)$ to finding a sublinear $C_n$ with sublinear worst-case residual width.

**Gap 1: Robust central transversal lemma on the defect-layer closure budget (upper-bound side; Pro Round-22 reduction).** The full squarefree-closure analogue of pair-shadow mass. Setup:

- Rank-$h$ target: $t = bA_S$ with $|S| = h$, large prime $b$, $A_S = \prod_{p \in S} p$.
- Defect-$k$ certificate: lateral $bA_D$ with $D \subsetneq S$, $|S \setminus D| = k$.
- $H := \sum_{p \le y} 1/p \sim \log\log n$.

**Raw sizes (Pro).**
- Rank-$h$ target count: $N_h \asymp (n/\log n) \cdot H^h/h!$
- Defect-$k$ certificates: $V_{h,k} \asymp (n/\log n) \cdot H^{h-k}/(h-k)!$
- Targets killed per defect-$k$ certificate: $D_{h,k} \asymp H^k/k!$
- Rate identity: $V_{h,k}/\binom{h}{k} = N_h/D_{h,k}$ — Prolonger captures $\binom{h}{k}$ certificates per target, Shortener kills $D_{h,k}$ targets per certificate. No positive drift at any fixed defect layer; pair-shadow (= low-rank) failure was just the $k = h-2$ symptom of this critical balance.

**The right invariant (Pro).** Defect-layer closure budget
$$\mathfrak B_h(R, C) := \sum_{k=1}^h \frac{|\partial_{h-k}R \setminus C_{h-k}|}{\binom{h}{k}},$$
where $R$ is the residual rank-$h$ target family and $C_{h-k}$ the already-captured defect-$k$ certificates. Total budget $B_h = \sum_k B_{h,k} \asymp (1+o(1)) N_h/H$, dominated by the $k = 1$ top-facet contribution.

**Closing consequence.** A *robust central transversal lemma*
$$\text{rank-}h\text{ residual score} \ll \frac{g(h)}{h} N_h \quad (g(h) = o(h))$$
would immediately imply
$$L(n) \ll n \frac{g(\log\log n)}{\log\log n} + \frac{n}{(\log n)^{1-o(1)}}.$$
With $g(h) = O(\log h)$: $L(n) \ll n \log\log\log n / \log\log n = o(n)$ (solves the original problem). With $g(h) = O(1)$: $L(n) \ll n/\log\log n$.

**Precise obstacle (Pro).** The natural greedy max-degree Shortener argument stalls on the fully closed residual set
$$\operatorname{Cl}_h(R, C) := \{S \in R : \text{every proper certificate } D \subsetneq S \text{ lies in } C\},$$
which is immune to lower-divisor attacks. Need the missing inequality
$$|\operatorname{Cl}_h(R, C)| \le O\!\bigl(g(h) \mathfrak B_h(R, C) + \text{already scored targets}\bigr),\qquad g(h) = o(h),$$
uniformly under the online rule: Prolonger adds whole downsets (size $2^h - 1$ for rank $h$) per move, Shortener deletes one certificate star per move.

**Reformulation as online robust covering-design problem.** Define an auxiliary $h$-uniform hypergraph with vertices $=$ top-facet certificates $bA_{S \setminus \{p\}}$, hyperedges $=$ the $h$ top-facets of each rank-$h$ target. Then the missing lemma asks Shortener to build a transversal while Prolonger steals the entire boundary of one target ($h$ vertices) per turn. Ordinary covering number is $\sim N_h/H$ (right size), but Prolonger's stealing defeats static Rödl-style constructions. The missing theorem is a genuinely **online robust transversal theorem** for this divisibility-generated hypergraph — ordinary static covering, even at optimal size, does not survive.

**Equivalence.** This reduction incorporates and supersedes the R26 fiber-collapse framing: the $k = h$ (fully-defective) layer of $\mathfrak B_h$ is exactly R26's fiber-collapse question at rank $h$.

**Within-core one-fiber cleanup is only logarithmically effective (Codex R27 partial negative).** A direct analogue of the T2 slot-capture per-move constant-factor reduction is NOT available for within-core lateral cleanup. Set up: for one activated core $b$ with fiber $\mathcal C_Y(b) = \{c : \mu^2(c) = 1, H_b < c \le 2H_b, c \le X^\gamma\}$ (where $H_b = Y/b$) and fiber weight $\omega_Y(b) = \frac{1}{b} \sum_{c \in \mathcal C_Y(b)} 1/c$. If Shortener attacks via lateral $bd$, the mass killed is $\omega_Y(b; d) \asymp \frac{1}{b} \prod_{p \mid d} \frac{1}{p+1}$; composite laterals are always dominated by prime laterals. The optimal $t$-move cleanup plays the $t$ smallest legal prime laterals, giving residual
$$\omega_Y^{(t)}(b) \asymp \frac{1}{b} \prod_{p \in P_t(b)} \frac{p}{p+1}.$$
In the unshielded case (all small primes available), this is $\asymp 1/(b \log t)$ by Mertens — only logarithmic reduction per $t$ moves. If Prolonger's activation seed $s_b$ already contains all primes up to $z_0$, the best laterals are unavailable and the residual is $\asymp \frac{1}{b} \cdot \frac{\log z_0}{\log z_t}$; constant-factor reduction on that one fiber requires $\Omega(z_0/\log z_0)$ moves.

**Sharpened transversal target: $g(h) = O(\log h)$ is the realistic target, not $g(h) = O(1)$ (Pro A follow-up R29).** Three updates tighten the gap:

1. **Corrected random-cover calculation.** Independent inclusion with probability $\lambda/h$: $h = H \sim \log\log n$, uncovered probability per target is $e^{-\lambda}$ (not $e^{-\lambda h}$ — the earlier heuristic had an exponent error). Choosing $\lambda = C \log h$ gives static cover size $O(\log h \cdot N_h/H)$ with expected uncovered count $N_h/h^C \to 0$. Static random sampling naturally gives $g(h) = O(\log h)$.

2. **Online-vs-static lower principle.** Let $\tau(H^{(h)})$ be the minimum static top-facet transversal. Prolonger can force $\ge \tau(H^{(h)})/2$ online scored edges: after $t$ rounds with Shortener having claimed $\le t$ vertices and Prolonger having scored $\le t$ edges, the union of Shortener's vertices + one representative per Prolonger-scored edge is a static transversal of size $\le 2t$; so $2t \ge \tau$. Therefore $g(h) = O(1)$ would require static covers at $N_h/H$ scale, which is ruled out by the corrected random-cover calculation. **$g(h) = O(1)$ is impossible from top-facet cleanup alone.**

3. **$g(h) = O(\log h)$ is enough.** Plugging into the reduction: $L(n) \ll n (\log\log\log n)/\log\log n + n/(\log n)^{1-o(1)} = o(n)$.

**Plain resilience lemma REFUTED (Pro R32).** The specific state inequality
$$|\operatorname{Cl}_h(R, C)| \le O(\log h \cdot \mathfrak B_h(R, C) + \text{already scored})$$
is false. Simplex-star cascade counterexample: take $X = \{0\} \cup Y$ with $|Y| = M$, scored star $\mathcal F = \{\{0\} \cup D : D \in \binom{Y}{h-1}\}$, residual $R = \binom{Y}{h}$; then every $S \in R$ has every proper subset in the down-closure of $\mathcal F$ (choose $D \supseteq E$ of size $h-1$), so $R \subseteq \operatorname{Cl}_h$ and $\mathfrak B_h = 0$ by construction, while $|\operatorname{Cl}_h|/|\mathcal F| = (M-h+1)/h$ is arbitrarily large. Embeds into divisibility geometry: score targets $b \cdot r \cdot A_D$ for $D \in \binom{Y}{h-1}$ with $I = [P, (1+\eta)P]$ a short prime interval; then $\{bA_S : S \in \binom{Y}{h}\}$ is fully closed.

**Corrected scale-entropy target (Pro R32), now further sharpened (Pro R33).** The sublinear route is still alive. The dangerous cascade has reciprocal mass $\alpha_I \asymp 1/(h\log P)$ in a narrow prime interval, so single-cell star mass is exponentially small. The corrected form:
$$|\operatorname{Cl}_h(R, C)| \le O(\log h) \mathfrak B_h(R, C) + O(\text{scored}) + \sum_{\mathcal Q} O\!\left(\frac{n}{\log n} \frac{\alpha(\mathcal Q)^h}{h!}\right).$$
Single-cell stars contribute $o((\log h/h) N_h)$ since $\max \alpha(\mathcal Q) = o(H)$.

**$g(h) = O(\log h)$ target refuted by multi-cell product stars (Pro R33).** The multi-cell product-star mass is NOT $o((\log h/h) N_h)$. Explicit calculation: partition small primes into cells $\mathcal Q_j = [P_j, e^{1/h} P_j]$ with $\alpha_j \asymp 1/(h \log P_j)$, $M_j \asymp P_j/(h \log P_j)$. Set $H = \sum_j \alpha_j \sim \log\log n$. For population threshold $L$, high-cell mass $A_>(L) \le H - \log\log(hL) + O(1)$, giving
$$\frac{N_h^{>L}}{N_h} \le \exp(-(1+o(1)) \log\log(hL)) \asymp 1/\log(hL)$$
in the central range $h \sim H$. Optimizing $L \asymp h/\log h$: $N_h^{>L} \asymp N_h/\log h$. This is bigger than the $(\log h/h) N_h$ target by factor $h/(\log h)^2 \to \infty$. An explicit product-star construction matches: auxiliary primes $r_j \in \mathcal Q_j$ per high cell, scored star layer $\{bA_{S \setminus \{p\}} r_j : p \in \mathcal Q_j\}$ shields every top facet of residual targets whose coordinates come from high cells, giving $|R|/|F| \asymp h$, so the scored mass cannot pay for the closed residual.

**New target: $g(h) = O(h/\log h)$, still gives $L(n) = o(n)$ (Pro R33 thickness dichotomy).** Define cell-thickness $\tau(S) = \sum_{p \in S} 1/M_{\mathcal Q(p)}$. Thick targets ($\tau(S) \ge 1/L$) are paid for via fractional charging: send weight $1/M_{\mathcal Q(p)}$ from $S$ to a scored target shielding the facet $S \setminus \{p\}$; each scored target receives $O(1)$ total charge since each cell has only $M_{\mathcal Q}$ possible replaced primes contributing $1/M_{\mathcal Q}$ each. Hence closed thick-target mass $\ll L \cdot \text{scored}$. Thin targets ($\tau(S) < 1/L$) use only cells with $M_{\mathcal Q} > L$, so their total mass is bounded by $(n/\log n) A_>(L)^h/h! \ll N_h/\log(hL)$. Optimizing $L \asymp h/\log h$: closed multi-cell product-star mass $\ll N_h/\log h$, at the $g(h) = h/\log h$ scale.

With $g(h) = O(h/\log h)$: $L(n) \ll n/\log\log\log n$. Still strictly $o(n)$, still settles the central dichotomy.

**New sharp target (Pro R33):** the **cell-thickness online resilience lemma**
$$|\operatorname{Cl}_h| \ll L \cdot (\text{scored or stolen boundary mass}) + \frac{N_h}{\log(hL)},$$
with $L \asymp h/\log h$. Pro R33 closed this for clean product-star cylinders. Remaining online promotion: (1) replacements across neighboring short cells not just exactly the same cell, (2) lower-defect certificates not only top facets, (3) adversarial interleaving of Shortener claims and Prolonger steals, (4) summation over full central rank window. Item 1 may cost a slowly varying factor if bundling short cells into factor-$<2$ windows; would give $g(h) = O(h/\log\log h)$ as a slightly weaker but still-sublinear fallback. See researcher-33-pro-A-thickness-dichotomy.md.

**Empirical note (Codex R32).** Extracted optimal Shortener strategy $\sigma$ = "claim vertex of max unresolved-edge degree, tiebreak on initial degree then lexicographic." Matches 95.6% of exact-minimax Shortener states. Achieves $g \approx 1 + O(1/h)$ on tested grids (better than the $O(\log h)$ target). Codex R33 empirically tested $\sigma$ against the simplex-star cascade: worst ratio $\sigma/\tau_{\text{lower}} = 1.133$; cascade is NOT Prolonger-optimal in online play. See researcher-32-codex-sigma-rule-summary.md and researcher-33-codex-sigma-vs-cascade.md.

**Codex R34 — gap now isolated to ONE online shadow anti-concentration statement.** The R33 ingredients (Pro A thickness dichotomy + fresh Pro counting lemma) do NOT compose cleanly. Obstruction:
- Thickness dichotomy: target-level bound.
- Counting lemma: reduces $|\operatorname{Cl}_h|$ to certificate counts $|C_{h-k}|$.
- Passing certificates back to targets costs $D_{h,k}/\binom{h}{k} \asymp h$ at $k=1$ in central range.
- Desired scored multiplier is only $L \asymp h/\log h$.
- Factor-$\log h$ gap between composition bound ($h \cdot$ scored) and target ($h/\log h \cdot$ scored).

Items (2) lower-defect certs and (4) central-rank summation are closed by the counting lemma and Poisson tail. Item (1) neighboring-cell replacements is at most a slowly varying $\log\log h$ loss. **Item (3) adversarial interleaving is the single remaining load-bearing gap.** The missing lemma:
$$|C_{h-k} \cap \partial_{h-k} R| \le O(\log h) |U_{h-k}| + O(\binom{h}{k}) \cdot (\text{scored})$$
needs a *certificate-level* anti-concentration argument (not the target-level thickness dichotomy alone). Standard online set cover results (Alon et al 2003, Gupta et al 2016) are too weak or in the wrong model. See researcher-34-codex-resilience-online-promotion.md.

**Cross-core singleton cleanup also fails at the same rate identity (Pro R29).** For rank $h$, the target mass containing a fixed small prime $p \le y$ is $N_h(p) \asymp (h/H) \cdot (1/p) \cdot N_h$. A legal singleton move $p$ kills mass $\asymp (h/(pH)) N_h$. Shortener's low-prime moves act on reciprocal mass $H$; Prolonger shields an $h$-set per move. Same rate identity: certificates per target $\sim h$, targets per certificate $\sim H \sim h$. No positive drift at the one-prime layer — this confirms the defect-budget $\mathfrak B_h$ is the correct object and cannot be replaced by pure low-divisor cleanup.

**Empirical $g(h)$ at small $h$ supports the resilience conjecture (Codex R29 empirical).** Exact minimax on $H^{(h)}$ at $h \in \{3, 4, 5\}$ and $N \le 6$ plus heuristic matrix at $h = 5$, $N \le 12$:
- $h = 3$, $N \le 6$: $T^*/\tau_{\text{exact}} \in [0.5, 0.83]$.
- $h = 4$, $N \le 6$: $T^*/\tau_{\text{exact}} \in [0.67, 0.67]$.
- $h = 5$, $N = 6$: $T^*/\tau_{\text{exact}} = 0.67$.
- $h = 5$, $N \in \{7, 8\}$ via heuristics: $g \approx 0.86$–$1.07$.

Empirically $g(h)$ is bounded across all tested $h$, consistent with the $O(\log h)$ target and possibly tighter in practice. Pro R29's theoretical lower bound $T^* \ge \tau/2$ confirmed empirically. No small-$h$ Prolonger counter-construction forcing $\omega(\log h)$ overhead found. See [phase4/transversal_small_h_empirical.md](../phase4/transversal_small_h_empirical.md).

**Structural obstructions to Prolonger counter-construction (Codex R31).** Targeted refutation search on natural adversarial classes yielded two structural no-gos:

1. **Fixed-core strategies reduce to smaller top-facet games.** Restricting to hyperedges containing a fixed $q$-subset $Q$ induces a subgame canonically isomorphic to $H^{(h-q)}$ on $N - q$ points, so constant-size cores don't create new asymptotic behavior.

2. **Any two distinct hyperedges of $H^{(h)}$ share at most one top-facet vertex.** Two shared top-facets would force equality of the underlying $h$-sets. Consequently "max shared-top-facet" dependent-set cascades have only $O(1)$ local overlap per predecessor, not $\Theta(h)$. No Johnson-graph-style vertex-level cascade exists.

Empirically, new adversarial Prolonger policies (`fixed_pair_core`, `fixed_triple_core`, `max_captured_overlap`, `pair_core_overlap`, `weighted_overlap_random`) never produced more than a mild constant-factor increase over the `smallest_neighborhood` baseline. All observed ratios stayed $O(1)$ relative to $\tau_{\text{lower}}$, with no upward drift resembling $\log h$ or anything super-logarithmic. See researcher-31-codex-prolonger-counter-search.md and the updated `phase4/transversal_small_h.py`.

**Gap 2: Residual-width proof for a sublinear certificate family (upper-bound side).** The reduction above is proved, but no explicit sublinear $C_n$ has been shown to yield sublinear residual width. Natural candidate: $C_y = \{d \le n/2 : d \text{ squarefree}, P^+(d) \le y\}$ with $y = \exp((\log n)^{1/2})$ or similar. Sublinear: $|C_y| \le \Psi(n, y) = n \exp(-(1+o(1))u\log u)$ with $u = \log n/\log y \to \infty$. The specific missing lemma:
$$\sup_{\text{reachable } P} \sum_{d \in \mathcal{K}(P)} \frac{1}{\varphi(d)} = o(\log y),$$
where $\mathcal{K}(P) = \{d \in C_y : d \mid p \text{ for some Prolonger sweep move } p\}$ is the down-closed complex generated by Prolonger's actually-activated $C_y$-divisors. If this holds, the number of possible residual integers is $\ll (n/\log y) \cdot o(\log y) = o(n)$, closing $L(n) = o(n)$.

**Probabilistic reformulation of Gap 2 (Codex R27).** For the smooth-squarefree candidate $C_y$, let $D_y$ be the random squarefree product formed by including each prime $p \le y$ independently with probability $1/p$, and let $Z_y = \prod_{p \le y} p/(p-1) \sim e^\gamma \log y$. Then for any squarefree $y$-smooth integer $d$, $\Pr(D_y = d) = 1/(Z_y \varphi(d))$, and for any family $K \subseteq C_y$:
$$\sum_{d \in K} \frac{1}{\varphi(d)} = Z_y \cdot \Pr(D_y \in K).$$
The missing lemma is therefore EXACTLY equivalent to
$$\sup_{\text{reachable } P} \Pr(D_y \in \mathcal{K}(P)) = o(1). \qquad (\star)$$

**$(\star)$ refuted under this reachability definition (Pro Round 23).** The naive form of Gap 2 is FALSE. Explicit Prolonger counterexample: with $\mu = \sum_{p \le y} 1/p = \log\log y + O(1)$ and $k = \lceil \mu + \sqrt{\mu}\log\mu \rceil = (1+o(1))\mu$, note $(k+1)\log y = o(\log n)$ so $y^{k+1} < n/2$. For each $k$-subset $F$ of primes $\le y$, set $d_F = \prod_{p \in F} p$ and $x_F = d_F q_F$ with $q_F$ prime in $(n/(2d_F), n/d_F)$; then $x_F \in (n/2, n]$ with exactly $k$ small prime factors. Inject $k$-sets into $(k+1)$-sets, assigning $F \mapsto G_F$, and let $s_F = \prod_{p \in G_F} p \in C_y$. The alternating prefix $x_{F_1}, s_{F_1}, x_{F_2}, s_{F_2}, \ldots$ is legal (different support sizes $k$ vs $k+1$, mutual incomparability of the $x$'s in upper half). Then $\mathcal K(P) \supseteq \{d \text{ squarefree } y\text{-smooth} : \omega(d) \le k\}$. By Chebyshev on $W_y = \omega(D_y)$ (mean $\mu$, variance $\le \mu$): $\Pr(1 \le W_y \le k) = 1 - o(1)$, hence $\Pr(D_y \in \mathcal K(P)) \ge 1 - o(1)$. Construction uses only $\binom{N}{k} = n^{o(1)}$ Prolonger sweep moves; crude Prolonger budget $O(|C_y|)$ does not constrain this.

**Medium-rank localization (Codex R27), now understood as the precise failure locus.** If every $d \in \mathcal K(P)$ has $\omega(d) = o(\log\log n)$, then $\sum 1/\varphi(d) = o(\log y)$. But Prolonger's counterexample populates $\mathcal K(P)$ precisely at $\omega(d) \sim \mu \sim \log\log n$ — the medium-rank region that Codex R27 flagged as the only place obstructions could live. The localization is tight: obstructions exist exactly where they had to, and $C_y$ is too weak to prevent them.

Naive crude divisor-incidence approaches fail quantitatively: for the central-divisor family $C_k = \{d : \omega(d) = k = \theta \log\log n\}$, the incidence count per $x$ is $\sim \binom{H}{\theta H} \approx \exp(H \mathsf{H}(\theta))$ (binary entropy) while $\sum_{d \in C_k} 1/d \le (1/k!)(\sum_p 1/p)^k \approx \exp(\theta H(1 - \log\theta))$, and the exponent gap $\theta(1 - \log\theta) - \mathsf{H}(\theta) = \theta + (1-\theta)\log(1-\theta) > 0$ for $0 < \theta < 1$ blocks the residual bound.

**Route (a) refuted (Codex R27).** Direct LYM transplant from Erdős #1196 sub-Markov chain cannot bound $|A|$ below linear scale for #872: upper-half $(n/2, n]$ is already a size-$n/2$ antichain, insensitive to any weighted-LYM variant. The #1196 first-hit framework must be adapted to the Bernoulli probability reformulation above or to the robust transversal problem in Gap 1, not to direct cardinality bounds.

The real obstruction is the same as Gap 1: control of the full squarefree multiplicative closure of Prolonger's sweep moves, not just fixed-rank shadows. **Note (2026-04-19 late evening):** Gaps 1 and 2 are NOT equivalent after all — Pro R23 refuted Gap 2's naive form $(\star)$ by explicit Prolonger counterexample, while Gap 1 (defect-budget transversal lemma) is an abstract hypergraph game and remains the live question. The earlier conjectured equivalence was wrong: Gap 2 in its naive form is strictly weaker than Gap 1 and now known unachievable for the $C_y$ candidate.

**Structural generalization of the R23 refutation (Codex R28).** The R23 attack pattern generalizes: any certificate family with a broad squarefree support layer plus a large incomparable witness layer is vulnerable to an $n^{o(1)}$-move sweep-prefix attack that saturates the Bernoulli reachable complex. Concretely:
- **Vulnerable families (all susceptible to R23-type attack via their squarefree slice):** smooth-squarefree $C_y$, exact-rank $\omega(d) = k$, exact-rank $\Omega(d) = k$ (minor modification), threshold families $\tau(d) \ge K$, divisor-count families.
- **Evading families:** chain-like / support-rigid certificates (e.g., primorials) where no large incomparable witness layer exists; non-multiplicative families (e.g., generic arithmetic progressions).
- **Intermediate:** $z$-rough families — Bernoulli measure concentrated on a bounded prime band refutable, but natural Buchstab/uniform measure on the full rough family not automatically saturated.

Rescuing Gap 2 would require (a) a support-rigid certificate whose natural measure avoids R23-saturation (likely too sparse to be a useful sweep certificate), (b) a stronger "reachability" definition that incorporates adversarial Shortener strategy (not currently available), or (c) a non-Bernoulli measure. Standalone writeup: researcher-28-codex-R23-generalization.md.

**Gap 3:** ~~**Within-$b$-fiber capture theorem.**~~ Collapsed: the single-fiber positive-density theorem (Prolonger forces $\eta K$ moves in the upper-half game on $\{2, \ldots, K\}$) is exactly the linear conjecture rescaled to $K$. Because $b > \sqrt{n}$ makes cross-fiber laterals incomparable, Shortener runs independent optimal lateral strategies in each fiber, reducing the multi-fiber value to $\sum_b L_{\mathrm{upper}}(K_b)$. Hence positive-density dyadic theorem $\iff L(n) = \Omega(n)$. The linear revival (if it exists) requires machinery outside the fan/shadow/dyadic-fiber architecture.

**Convergence.** Gaps 1 and 2 now share the same underlying missing theorem: dynamic control of the full squarefree multiplicative closure generated by Prolonger's sweep moves. Two different framings (Shortener-strategy rank-3 cleanup vs. certificate-family sweep reduction), one common bottleneck.

## Ruled Out — with specific failure mechanisms

Each item below was proposed as a candidate proof or structural claim and subsequently identified as wrong. Concise failure note per entry.

**Static Carrier Capacity Bound** ("for every antichain $P$ of size $\varepsilon n$, $\sum_{p \in B(P)} 1/p \le C(\varepsilon)$"). The top $\varepsilon n$ consecutive integers in $U$ (for $\varepsilon < 1/4$) form a legal antichain containing a multiple of every prime $\le \varepsilon n$, giving $\sum 1/p \ge \log\log(\varepsilon n) \to \infty$. Finite-prime vaccination via excluding any fixed $Q$ doesn't rescue it (arithmetic progressions with $d = \prod_{q \in Q} q$ give the same divergence).

**Dynamical bounded-reciprocal-mass Shortener** ("does there exist $\sigma$ with $\sum_{p \in B(P)} 1/p = O(1)$?"). Refuted by the universal block-product counter above, which forces $\sum 1/p \ge (1/2) \log\log n$ against every Shortener.

**Strict semiprime exposure $\Xi(B) = O(1/\log n)$.** The block-product counter places Prolonger's primes in $[\log n, n^{1/3}]$, giving $\Xi(B) \ge (c/\log n) \sum 1/p \ge c' \log\log n / \log n$. Any lemma stronger than the unconditional $O(\log\log n / \log n)$ fails against this counter.

**One-step online $\Omega = 2$ cover lemma** ("whenever $|R_t^{(\ge 3)}| \ge K n/\log n$, some legal $d$ with $\Omega(d) = 2$ has $\text{score}_t(d) \ge c|R_t^{(\ge 3)}|/\log n$"). Counterexample: $A_t = \{\text{primes} \le y\}$ with $y = \lfloor \log n \rfloor$ is reachable, and $R_y = \{u = pqr \in U : y < p \le q \le n^{1/3},\ r \text{ prime},\ n/(2pq) < r \le n/(pq)\}$ has $|R_y| \asymp n (\log\log n)^2 / \log n$ legal elements. Any $\Omega = 2$ divisor of any $u \in R_y$ has both primes $> y$, so $d > y^2 \asymp \log^2 n$ and score $\le n/d \le n/\log^2 n$. Target $|R_y|/\log n \asymp n (\log\log n)^2 / \log^2 n$ exceeds max achievable score by $(\log\log n)^2$. At $n = 10^6$: $|R_y| = 8622$, max $\Omega = 2$ score over $R_y$ alone is $214$, max over all legal upper multiples is $331$ (at $d = 17^2$), target is $\approx 624$ — both max values fall short.

**Multiplicative-decay formulation** ("$r_{t+1} \le r_t(1 - c/\log n)$" for the $\Omega \ge 3$ pool). False in one-step form by the $R_y$ counterexample. Whether any amortized version holds is unknown.

**Cross-block semiprime batch Shortener** (play all primes $> n^{1/6}$ plus all "cross-block" semiprimes $\le n^{1/3}$). Not an antichain. At $n = 10^6$: prime $11$ is in "primes $> n^{1/6} = 10$" and $77 = 7 \cdot 11$ is in "semiprimes $\le n^{1/3} = 100$"; both in the batch, $11 \mid 77$. Pre-game collapse. Also: "cross-block" presumes Prolonger commits to a fixed block partition in advance, which need not happen; and the claimed "1-to-1 turn economy" is numerically wrong (a Prolonger move with all primes $> n^{1/6}$ has $\Omega \le 5$, not $6$, giving $\sim 2.5n/\log n$ blocking capacity vs the $\sim n/\log n$ large primes — a surplus, not deficit).

**"Phase-4 triple repair costs $n(\log\log n)^2 / \log n$"** (prior pessimistic estimate). Wrong. Correct count is $T_\alpha(n) = O_\alpha(n/\log n)$ via split at $pq = n^{1-\alpha}$ with high-$pq$ Mertens sum $O_\alpha(1)$; earlier estimate used the wrong scale for the second regime. The rank-$\le 3$ extension above relies on this corrected bound.

**"Play just $105$ to resolve $\{30, 42, 70\}$"**. Evaluated $105$ alone and noted $22 = 2 \cdot 11$ remains legal afterward; missed that Shortener's phase 1 plays every legal prime, so $11$ is already in the antichain before $105$ is ever considered, killing $22$. The correct repair is phases $1, 2, 4$ combined per the rank-$\le 3$ theorem.

**MWU / Online Fractional Set Cover on the divisibility poset** (Shortener covers surviving composites, Prolonger deletes available covers, claim $L \le O(\text{OPT}_f \log n) = O(n/\log n)$ via $\text{OPT}_f = O(n / \log^2 n)$). Algebra error in $\text{OPT}_f$: setting $z_p = c/(\log n \log\log n)$ requires $\sum_{p \mid u} z_p \ge 1$ for every composite $u$, which for typical $\omega(u) \sim \log\log n$ forces $c \gtrsim \log n$. Then $\text{OPT}_f = \sum z_p \asymp n/(\log n \log\log n)$ — a $\log$-factor larger than claimed. With the corrected bound, the regret gives $O(n/\log\log n)$, weaker than the rank-$\le 3$ theorem delivers. A secondary issue: the invoked regret bound for "online set cover with deletions of available covers" (rather than covered elements) is not a textbook result.

**Fixed-rank local repair for general overlap.** Ruled out by the Simplex Obstruction above: any bounded-$k$ repair theory fails; $k$ must grow to $\log n / \log\log n$.

**Post-hoc Resolution-Theorem-style extension to blocked-large-prime overlap.** Ruled out by the post-hoc obstruction theorem above (modulo the sparse-subset closeout). Any Resolution-style strategy that allows $\mathcal{E}$ to be installed must pay $\gg n \log\log n / \log n$ for the residual.

**Static lower-half reservoirs as Prolonger strategy.** Any $R \subseteq L$ of positive density has $|R \cap d\mathbb{Z}| \asymp |R|/d$ for many small $d$. Shortener plays the smallest legal prime $p$ and deletes $\Theta(|R|/p)$ reservoir elements per move. Static $R$ is a Shortener weapon, not a Prolonger weapon.

**All-prime $v_p$-parity sieves.** Density of integers with $v_p$ even for every prime $p \le y$ is $\prod_{p \le y} p/(p+1) \sim \pi^2 e^{-\gamma}/(6 \log y) \to 0$.

**Subpolynomial shield prefixes $|P| = n^{o(1)}$.** By the polynomial shield lower bound, $\beta(P)/n \to \infty$, so the shield-reduction inequality is vacuous.

**Bonferroni-2 + crude Chebyshev capped at $5n/16$.** Using the crude Chebyshev $q_j \le A j \log n$, Bonferroni-2 with evaluator $f(s) = 1 - s + s^2/2$ saturates at $s = 1/A \to 1/2$ (optimal truncation), giving $f(1/2) \cdot n/2 = 5n/16$. This is the ceiling of the Bonferroni-2 + crude-Chebyshev framework, not of odd-prime-prefix Shorteners in general. Superseded by refined Chebyshev $q_j \le (1+\varepsilon) j(\log n + \log j)$ which gives log-scale density $du/(1+u)$ and full inclusion-exclusion constant $\mathcal{V}/2 \approx 0.22002$.

**Infinite-order Bonferroni on uniform density $du/2$ capped at $e^{-1/2}/2 \approx 0.303$.** Even-order Bonferroni truncations on the crude-Chebyshev density converge to $\prod (1 - 1/q_j) \to e^{-s}$ at $s = 1/2$, giving $e^{-1/2}/2 \approx 0.303 n$. Strictly weaker than the refined-Chebyshev $\mathcal{V}/2$ bound because uniform density $du/2$ is dominated by $du/(1+u)$ on $[0, 1]$.

**Multi-prime pivot compression $\phi_P(x) = x / \prod_{p \in P} p^{v_p(x)}$ for $|P| \ge 2$.** Not injective on divisibility antichains. Counterexample: $\phi_{\{2, 3\}}(12) = 1 = \phi_{\{2, 3\}}(18)$ with $12 \nmid 18$ and $18 \nmid 12$. The $\phi$-on-antichain injectivity is specific to $|P| = 1$ because $\mathbb{N}$ under divisibility-by-a-single-prime is totally ordered; $\mathbb{N}^2$ under componentwise order is not.

**Composite Shortener moves batching multiple block-products.** Block-product supports $S_1, \ldots, S_r$ are pairwise coprime by construction. Any composite $c$ with support intersecting $S_i$ and $S_j$ ($i \ne j$) is incomparable with both $x_i$ and $x_j$. Any $c$ with $c \mid x_i$ or $x_i \mid c$ is incident to only one block. The $1/2$-mass blocking rate is structural, not Shortener's choice of composites.

**Dynamic realization of the $S_y$ certificate at $O(n/\log n)$ cost.** Static theorem: with $y = n^\alpha$ ($1/3 < \alpha < 1/2$), $z = \lfloor n/(2y) \rfloor$, the antichain $S_y = \{p \le y\} \cup \{z < p \le n/2\} \cup \{ab \le n/2 : a, b > y\}$ leaves residual (upper primes) + (medium semiprimes $qr$ with $y < q \le r \le z$) of total size $O_\alpha(n/\log n)$. Hypothesis: Shortener could dynamically install $S_y$ in the game; total game length would then be $|S_y| + \text{residual} = O(n/\log n)$. Refuted by the second-order lower bound $L(n) \ge c_\delta n(\log\log n)^2/\log n$: if Shortener enters the $S_y$-residual regime at move $T_y(n)$, then $L(n) \le T_y(n) + O_\alpha(n/\log n)$, so $T_y(n) \ge L(n) - O_\alpha(n/\log n) = \Omega(n(\log\log n)^2/\log n)$. The time to eliminate the small-prime layer $\{p \le y\}$ is itself $\Omega(n(\log\log n)^2/\log n)$. The unresolved small-prime block in the Round 15 program is not bookkeeping — it carries the full second-order obstruction. Corollary: the $S_y$ program cannot yield $O(n/\log n)$ in its hoped-for direct form; it might still yield a matching upper bound at $n(\log\log n)^2/\log n$ scale if the small-prime dynamics can be worked out.

**Direct target $L(n) = O(n/\log n)$.** Asymptotically impossible given T1. $L \ge (1/8-o(1)) n\log\log n/\log n$ means $L/(n/\log n) \to \infty$ since $\log\log n \to \infty$. No fixed constant $C$ satisfies $L(n) \le Cn/\log n$ for all $n$.

**Direct target $L(n) = O(n\log\log n/\log n)$.** Status contingent on T2 re-audit. If the second-order lower bound $L \ge c n(\log\log n)^2/\log n$ is upgraded back to rigorous, this target is asymptotically impossible ($L/(n\log\log n/\log n) \ge c\log\log n \to \infty$). Under the current demoted status of T2, the target $O(n\log\log n/\log n)$ is only plausibly-ruled-out; an unconditional proof of this bound would itself refute T2 and become a valid sublinear upper bound.

**Static harmonic-sum lemma (Lemma A) for matching-T2 charging.** Hypothesis: $\sum_{d \in \mathcal{D}_y(n)} 1/d \ll_\alpha (\log\log n)^2$ where $\mathcal{D}_y(n) = \{d \le n : d \text{ squarefree}, P^+(d) \le y, \omega(d) \ge 2\}$. Three independent disproofs (Pro, Codex, Pro):
- Lower bound via $\sum_{p<q<r \le n^{1/3}} 1/(pqr) \sim (\log\log n)^3/6$. Already contradicts $(\log\log n)^2$.
- Sharper: $\sum_{d \le y, \mu^2(d)=1} 1/d = (6/\pi^2) \log y + O(1)$, so $S_y(n) \ge (6\alpha/\pi^2) \log n - O(\log\log n)$, hence $\asymp_\alpha \log n$.

The static "charge to canonical small core" framework cannot reach T2 scale; charging via all possible smooth cores gives $O(n)$, not $O(n(\log\log n)^2/\log n)$.

**"$\omega_y \le 2$" hypothesis game-enforceable.** Impossible: Prolonger's first move $x = 2 \cdot 3 \cdot 5 \cdot q$ with $q$ prime in $(n/60, n/30]$ is legal (upper-half) and has $\omega_y(x) = 3$ for any $y \ge 5$. No Shortener strategy prevents this.

**Residual-width lemma (abstract static form).** Hypothesis: for any certificate $C \subseteq \{2, \ldots, n\}$ and antichain $A$ satisfying $C \subseteq \text{Comp}(A)$ and $|A| \le O(|C|)$, $w(R(A)) \le f(n)$ for some sublinear $f$. Refuted by $\lambda_n$ counterexample: $A = \{\lambda_n(c) : c \in C\}$ with $\lambda_n(c) = c \lceil (\lfloor n/2 \rfloor + 1)/c \rceil \in (n/2, n]$. $A$ is antichain, $|A| \le |C|$, $C \subseteq \text{Comp}(A)$, but $w(R(A)) \ge n/2 - |C| - O(1)$. Static residual-width framework doesn't control width regardless of $|C|$; genuinely dynamic information about the actual game antichain is required.

**Online 2-shadow control theorem (all three formulations).** Hypotheses (from round20-two-shadow-control prompt): (T1) activated-semiprime reciprocal mass $\le C(\log\log n)^2$; (T2) 2-shadow residual-antichain width $\le O(n(\log\log n)^2/\log n)$; (T3) # Prolonger moves with $\omega_y \ge 3$ surviving $\le O(n(\log\log n)^2/\log n)$. T1 holds in its literal static form ($\sum_{pq \in U} 1/(pq) \le (\sum_p 1/p)^2 /2 \ll (\log\log y)^2$) but is too weak. T2 and T3 are both refuted by the following explicit $\Omega(n)$ counterexample (Pro, Round 20):
- Setup phase. Choose $\beta \in (\alpha/3, \alpha/2)$, set $z = n^\beta$, $S = \{p \le z\ \text{prime}\}$. For each pair $pq$ in $S$, Prolonger plays $x_{pq} = pq R_{pq}$ with $R_{pq}$ a prime in $(n/(2pq), n/(pq)]$. Since $n/(2z^2) > n^\alpha = y$ for large $n$ (because $1 - 2\beta > \alpha$), every $R_{pq} > y$. All setup moves lie in $(n/2, n]$ (upper half, antichain). After setup, every pair $pq$ with $p, q \in S$ has been preempted.
- Harvest phase. Choose $u = (\alpha + \eta/2)/3$, $\varepsilon > 0$ small, $\gamma \in (0, u)$. Let $\mathcal B$ be squarefree triple products $b = p_1 p_2 p_3$ with $p_i$ distinct primes in $[n^u, n^{u+\varepsilon}]$ and $\mathcal C$ the squarefree integers $\le T = n^\gamma$ with prime factors $< n^u$. By Mertens on fixed logarithmic intervals, $\sum_{b \in \mathcal B} 1/b \gg_{\alpha,\beta,\eta,\varepsilon} 1$ and $\sum_{c \in \mathcal C} 1/c \sim (6/\pi^2) \log T \asymp_\gamma \log n$. For each $(b, c) \in \mathcal B \times \mathcal C$ and each prime $\ell \in (n/(2a), n/a]$ where $a = bc$, the move $w = a\ell$ satisfies: (i) $n/2 < w \le n$, (ii) $\omega_y(w) \ge 3$ (three primes from $b$), (iii) no played small prime divides $w$ (primes in $S$, all preempted), (iv) no played small semiprime divides $w$ (pairs in $S$ preempted; $w$ has no small prime outside $S$), (v) no large prime/semiprime from Shortener's step 3 divides $w$ ($\ell \le n/(2y)$ and step 3 plays large primes in $(n/(2y), n/2]$). Count: $\gg (n/\log n) \sum_b 1/b \sum_c 1/c \gg n$. Since $n(\log\log n)^2/\log n = o(n)$, T3 fails. Same construction shows $\Sigma_2(P)$ has $\gg (\log\log n)^3$ reciprocal mass and admits an $\Omega(n)$ residual antichain, refuting T2.

Codex's attempted DTK+Buchstab proof of the stronger bound $\#\{x \in A : \omega_y(x) \ge 3\} \ll n\log\log n/\log n$ is now flagged as broken: the DTK step $W_p(T) \ll \Psi_{<p}(T)/\sqrt{\pi(p-1)}$ is tighter than what is actually proved for the max antichain in $(<p)$-smooth integers $\le T$, since $\{k \in (T/2, T] : k\ \text{$(<p)$-smooth}\}$ is already a single-size-$\Theta(\Psi_{<p}(T))$ antichain without the $\sqrt{\pi(p)}$ divisor.

**Structural lesson from the 2-shadow refutation.** Pair-shadow reciprocal mass controls only the pair layer of the small-prime system; it does not control the multiplicative closure. A matching-upper-bound theorem must track the squarefree closure generated by safe small primes (e.g., the harmonic mass of divisors of Prolonger's already-played upper-half moves), not just $\sigma_2(x)$.

**Dynamic $S_y$-installation without preempted-semiprime transfer.** A semiprime $pq$ made illegal by Prolonger playing $x \supseteq pq$ is NOT in the Shortener antichain. It doesn't block future moves $pqs$ for new $s$. Hence naive "Shortener installs all small semiprimes" fails when Prolonger preempts via high-support moves. Matching upper bound via this route requires an online theorem controlling the 2-shadow of high-support small-prime Prolonger moves.

**Uniform multi-rank Prolonger shielding theorem (rigorous no-go).** Hypothesis: a single Maker-Breaker potential coupling fan targets across ranks $h \in [H - c\sqrt{H}, H + c\sqrt{H}]$ with $O(1)$ total game-theoretic loss, yielding $L(n) = \Omega(n)$. Refuted by the following Sperner argument. Two distinct same-$b$ upper-half cores cannot be nested: if $S \subsetneq T$ and $A_S b, A_T b \in (n/2, n]$, then $A_T b = A_S b \cdot A_{T \setminus S} \ge 2 A_S b > n$, contradiction. So same-$b$ upper-half cores form a Sperner family, and the proposed "rank-$(h+1)$ target shields rank-$h$ targets with the same $b$" has empty target set (since $A_{S'} b \le n/2$ is not an upper-half target for $S' \subsetneq S$).

Strengthened local form: each earlier compatible Prolonger move $z \le n$ can shield at most ONE top-lateral divisor $b A_{T \setminus \{p\}}$ of a target $y = A_T b$. Proof: if $z$ shielded both $b A_{T \setminus \{p\}}$ and $b A_{T \setminus \{q\}}$ ($p \ne q$), then $\text{lcm}$ of these shields is $b A_T = y$, so $y \mid z$; but $y > n/2$ and $z \le n$ forces $z = y$, contradicting "earlier compatible move."

Consequence: after $C$ earlier compatible Prolonger moves, a rank-$h$ target still has $\ge 2^{h-C} - 1$ unshielded lateral divisors. For $C = O(1)$, bounded-depth cross-rank shielding only reduces the lateral cube dimension from $h$ to $h - O(1)$ — asymptotically no help. Even with pure-core shielding granted for free, the $b$-lateral divisor family $\{b A_D : D \subsetneq S\}$ of size $2^h - 1$ forces the ceiling
$$G_h(n) \sim (n/\log n) \cdot (H^h/h!) \cdot 2^{-(2^h-1)}.$$
Optimized/summed over $h$, this stays at $n/(\log n)^{1-o(1)} = o(n)$.

Pro-verified rigorous no-go. Combined with the Probe B empirical collapse (rank-1→rank-2 shielding ratio 0.82 vs rank-2→rank-3 ratio 0.06) and the separate-rank architecture ceiling (Codex Round 17), the Prolonger-side fan-hierarchy route to $\Omega(n)$ is comprehensively closed. Any linear lower bound would need a genuinely new **within-$b$-fiber capture theorem** on dyadic core games, not a rank-coupled fan potential.

**Direct Shortener sieve-over-$B(P)$ route to $O(n/\log n)$.** Both static (interval counterexample) and dynamical (universal block-product) versions closed. Any proof of $O(n/\log n)$ via bounding Prolonger's prime-reciprocal coverage universally fails.

**Fixed-power polylog upper bound $L(n) = O(n (\log\log n)^C / \log n)$ for any fixed $C$.** Ruled out by the rank-$h$ fan hierarchy theorem (take $h > C$).

**Single-rank fan construction achieving $L(n) = \Theta(n)$.** By Mertens, $|\mathcal{T}_h| \sim (n/2\log n) \cdot H^h/h!$ with $H \sim \log\log n$. By Stirling, $H^h/h!$ peaks at $h \approx H$ with value $e^H/\sqrt{2\pi H} \sim \log n / \sqrt{\log\log n}$, so $\max_h |\mathcal{T}_h| \sim n/\sqrt{\log\log n} = o(n)$. The linear-scale target mass is distributed across the window $h = H \pm O(\sqrt H)$; no single-rank fan captures it. A linear lower bound via fans must harvest this entire window jointly.

**Per-rank shadow-capture iteration reaching $L(n) = \Omega(n)$.** Iterating the fixed-rank fan theorem $h \to \infty$ by multiplying per-rank bounds: target count $\sim (n/\log n) \cdot H^h/h!$ times shadow-survival $2^{-(2^{h+1}-2)}$ gives
$$L_h(n) \ge \frac{n}{\log n} \cdot \frac{(\log\log n)^h}{h!} \cdot 2^{-2^{h+1}+2}.$$
Optimizing over $h$: the double-exponential denominator $2^{2^{h+1}}$ catches up with $(\log\log n)^h$ near $h = \log_2\log_2 \log\log n$, giving a super-polylog-but-sublinear envelope
$$\frac{n}{\log n} \cdot \exp\bigl(\Theta(\log\log\log n \cdot \log\log\log\log n)\bigr).$$
This is strictly sub-linear. The per-rank accounting cannot reach $\Theta(n)$ because the $2^h - 1$ lateral-divisor coordinates at rank $h$ each pay an independent factor-of-2 under the shadow-capture lemma. A *uniform multi-rank shielding theorem* — single potential coupling ranks across the window $h = \log\log n \pm O(\sqrt{\log\log n})$ with $O(1)$ total game-theoretic loss, exploiting that one Prolonger play of $A_S b$ shields divisors of targets at *every* rank whose small-core is a subset of $S$ — is not known.

**Multiplier-Lock / Prefix-Shielded Fan achieving $L(n) = \Theta(n)$.** Proposed: Prolonger first installs an $O(1)$-move "lock" $\{q_1 q_2, q_2 q_3, \ldots, q_k q_1\}$ on the first $k$ odd primes (making each $q_i$ illegal as a Shortener move since it divides an installed cycle element), then runs a rank-$k$ prefix-shielded fan using $q_i$-multiplier shields $S_r(D) = q_r \cdot D$ for each sub-divisor $D$. Fails on three grounds: (1) Shortener's direct large-prime kill is not blocked — playing a prime $b$ directly kills the entire $b$-fiber of $\Theta(|A|^{k-1})$ targets, which the LCM obstruction doesn't prevent; (2) the "Volume Collapse" step ($V \ll E_k$) is stated in the wrong direction — Shortener with $V$ available attacks needs only $V$ moves, so $V \ll E_k$ is Shortener's advantage, not Prolonger's; (3) the raw target count $E_k \sim n(\log\log n)^{k-1}/((k-1)!\log n)$ has the factorial ceiling above, and scaling $k$ with $n$ reintroduces the $2^{-2^k}$ shielding cost per rank. Concession on record from the same thread.

## Numerical / Computational Evidence

**Exact minimax, $n \le 50$:** $L(n)/n \in [0.37, 0.46]$, average $\approx 0.40$. Optimal Prolonger first move: $6$ for $n \in [10, 27]$, then $18$ for $n \in [28, 32]$, then $30$ for $n \in [35, 48]$ (primorial-structured).

**Dynamical stress test against the universal block-product Prolonger counter** ($n \in \{10^3, 10^4, 10^5, 10^6\}$, best Shortener is odd-prime-prefix):

| $n$ | $L$ | $L \log n / n$ |
|---|---|---|
| $10^3$ | 187 | 1.29 |
| $10^4$ | 1361 | 1.25 |
| $10^5$ | 10576 | 1.22 |
| $10^6$ | 85003 | 1.17 |

Monotonically decreasing across 4 decades. Consistent with $L = O(n/\log n)$ (slowly-decreasing constant). *Inconsistent* with $L = \Theta(n\log\log n/\log n)$ with a stable positive constant.

**$F_\alpha$ predicted match at $n = 10^6, \alpha = 0.45$:** $|F_\alpha \cap L| = 1153$ (= $95$ primes + $1058$ semiprimes); post-install admissible count $83933$ (= $78331$ primes in $(n/(2 \cdot 503), n]$ + $5602$ upper semiprimes with both primes $> 501$). Predicted $L \log n / n = (1153 + 83933) \cdot \log(10^6)/10^6 = 1.176$. Observed: $1.17$. Agreement to 4 decimal places. The structurally-eligible superset (integers with $\Omega \le 2$ and $P^- > 501$) is $85063$; gap $1130 = 1058$ (already in $F_\alpha \cap L$) $+ 72$ (primes in $(501, 994]$ blocked by antichain-conflict with $Q_\alpha$).

**Dynamical stress test against a three-phase Prolonger protocol on blocked large primes** (phase 1: block-building with one small prime and padding; phase 2: complete graph on blocked small primes; phase 3: $p^* q$ for $q \in (n^{5/6}, n/2]$). Grid $n \in \{10^3, 3 \cdot 10^3, 10^4, 3 \cdot 10^4, 10^5, 3 \cdot 10^5, 10^6\}$ against three Shortener strategies:

| $n$ | `race-large-first`: $L \log n / (n \log\log n)$ | `smallest-legal-prime`: $L \log n / n$ |
|---|---|---|
| $10^4$ | $0.543$ | $1.133$ |
| $3 \cdot 10^4$ | $0.524$ | $1.143$ |
| $10^5$ | $0.509$ | $1.168$ |
| $3 \cdot 10^5$ | $0.502$ | $1.184$ |
| $10^6$ | $0.495$ | $1.200$ |

Against the race-large-first Shortener, $L \log n / (n \log\log n)$ flattens near $0.50$ (consistent with $\Theta(n \log\log n / \log n)$), and $L \log n / n$ rises from $1.205$ to $1.300$. Against smallest-legal-prime — strictly better Shortener at every $n$ (6–8% gap at $n = 10^6$) — $L \log n / n$ rises only $5.9\%$ across two decades, whereas a pure $\log\log n$ factor would predict $18\%$. The optimal-Shortener trajectory is genuinely ambiguous between $\Theta(n/\log n)$ with secondary loglog term and a slow-approaching $\Theta(n \log\log n / \log n)$.

Mechanism observation: against `race-large-first`, Prolonger blocks all small primes unanimously ($|B_\text{blocked}|/\pi(n^{1/6}) = 1.0$); against `smallest-legal-prime`, $|B_\text{blocked}|/\pi(n^{1/6})$ varies $0.5$–$0.67$. Shortener's strategy materially affects the installation rate of the Prolonger's carrier family.

Scale caveat: at $n = 10^6$, $|B| \le 4$ (only primes $\{2, 3, 5, 7\}$). The "complete graph on $B$" has at most 6 edges. Definitive asymptotic signal requires $n \ge 10^7$ where $|B|$ reaches 6+.

**Weighted dual LP** for the static cover problem $\min \sum_u y_u$ subject to $\sum_{u : x \mid u} y_u \ge w_n(x)$, $y_u \ge 0$: empirical OPT$/n$ grows slowly toward $\sim 0.4$ ($0.2775$ at $n = 100$; $0.396$ at $n = 50000$). Optimizer concentrated on highly composite / divisor-rich numbers; $\sim 80\%$ of dual mass on the optimal cover $H_n$.

**One-shield values** $b_1(n) = \min_{u \in U} \beta(\{u\})$: $b_1/n \to \sim 0.5$ slowly ($0.31$ at $n = 100$; $0.448$ at $n = 500$).

**Post-hoc obstruction numerical sanity.** At $n = 10^6$: the unrestricted squarefree 4-prime cone $\{pqrs : n/3 < pqrs \le n\}$ has exactly $25{,}070$ elements, matching the predicted $\Theta(n \log\log n / \log n)$ scale at this $n$ ($n \log\log n / \log n \approx 190{,}061$). For the restricted fiber $Q = \{q \text{ prime} : n^{0.40} \le q \le n^{0.49}\}$: $|\mathcal{M}_Q| = 21{,}311$ distinct isolated $m$'s; full carrier universe $|U_\text{carr}| = 8{,}994$; for $Q = \{q : n^{0.35} \le q \le n^{0.45}\}$: $|\mathcal{M}_Q| = 25{,}113$, $|U_\text{carr}| = 11{,}879$.

**Sparse-subset min-cover measurement.** For $(\beta, \gamma) = (0.40, 0.49)$, greedy min-cover targeting $R = |\mathcal{M}_Q|/2$:

| $n$ | $|S|$ | $R$ | $S/R$ | $(S/R)\log\log n$ |
|---|---|---|---|---|
| $10^4$ | — | — | $0.814$ | $1.880$ |
| $3 \cdot 10^4$ | — | — | $0.682$ | $1.591$ |
| $10^5$ | — | — | $0.515$ | $1.257$ |
| $3 \cdot 10^5$ | — | — | $0.416$ | $1.056$ |
| $10^6$ | $3{,}613$ | $10{,}657$ | $0.339$ | $0.890$ |

The normalized ratio falls by factor $2.1$ over two decades, faster than the $1/\log\log n$ decay needed to validate the sparse-subset reduction. At $n = 10^6$, $|S| = 3{,}613$ carriers force $R = 10{,}657$ isolated residual moves — a ratio of $\sim 0.34$. Compared to the full $|\mathcal{E}| \sim 60{,}000$ at this $n$, greedy uses $\sim 6\%$ of the naive family to achieve half the residual target. The explicit analytic construction gives $S/R = 0.545$ at $n = 10^6$, worse than greedy by a factor of $\sim 1.6$, suggesting the analytic blueprint undersells the true sparsity.

**Fan-hierarchy empirical audit.** Direct simulation of the fixed-rank fan construction (Prolonger policy: smallest-core-first greedy on live rank-$h$ targets; Shortener policies: smallest-legal-prime, max-degree-divisor, max-degree-any). Let $c_h^{\text{theory}} := 2^{-(2^{h+1}-2)}/h!$ (the per-rank lower bound from the divisor-shadow lemma), $c_h^{\text{emp}} := P_{\text{targets}} / (n(\log\log n)^h / \log n)$ (empirical Prolonger-targets-played over the normalizer at the same rank). Measured $c_h^{\text{emp}} / c_h^{\text{theory}}$:

| $n$ | $h$ | Shortener | $c_h^{\text{emp}} / c_h^{\text{theory}}$ | $c_h^{\text{emp}}$ | $c_h^{\text{theory}}$ | $|\mathcal{T}_h|$ |
|---|---|---|---|---|---|---|
| $10^4$ | 1 | smallest-legal-prime | $0.42$ | $0.0523$ | $0.1250$ | $891$ |
| $10^4$ | 1 | max-degree-divisor | $0.42$ | $0.0523$ | $0.1250$ | $891$ |
| $10^4$ | 1 | max-degree-any | $0.38$ | $0.0481$ | $0.1250$ | $891$ |
| $10^4$ | 2 | smallest-legal-prime | $0.53$ | $0.0082$ | $0.0156$ | $121$ |
| $10^4$ | 2 | max-degree-divisor | $0.33$ | $0.0052$ | $0.0156$ | $121$ |
| $10^4$ | 2 | max-degree-any | $0.33$ | $0.0052$ | $0.0156$ | $121$ |
| $10^5$ | 1 | smallest-legal-prime | $0.65$ | $0.0818$ | $0.1250$ | $8{,}249$ |
| $10^5$ | 1 | max-degree-divisor | $0.65$ | $0.0808$ | $0.1250$ | $8{,}249$ |
| $10^5$ | 1 | max-degree-any | $0.63$ | $0.0790$ | $0.1250$ | $8{,}249$ |
| $10^5$ | 2 | smallest-legal-prime | $0.48$ | $0.0076$ | $0.0156$ | $1{,}692$ |
| $10^5$ | 2 | max-degree-divisor | $0.41$ | $0.0065$ | $0.0156$ | $1{,}692$ |
| $10^5$ | 2 | max-degree-any | $0.41$ | $0.0065$ | $0.0156$ | $1{,}692$ |
| $10^6$ | 1 | smallest-legal-prime | $0.32$ | $0.0395$ | $0.1250$ | $76{,}613$ |
| $10^6$ | 1 | max-degree-divisor | $0.32$ | $0.0395$ | $0.1250$ | $76{,}613$ |
| $10^6$ | 2 | smallest-legal-prime | $0.40$ | $0.0062$ | $0.0156$ | $18{,}478$ |
| $10^6$ | 2 | max-degree-divisor | $0.36$ | $0.0056$ | $0.0156$ | $18{,}478$ |
| $10^6$ | 3 | smallest-legal-prime | — | — | — | $538$ |
| $10^6$ | 3 | max-degree-divisor | — | — | — | $538$ |

**Cross-rank auto-shielding census.** For a sample of rank-$h$ targets $t$, let $\text{same}(t) := \sum_{d \mid t, d \ne 1, d \ne t} |\{t' \in \mathcal{T}_h : d \mid t', t' \ne t\}|$ (same-rank kills by proper divisors of $t$) and $\text{cross}(t) := \sum_{d \mid t, d \ne 1, d \ne t} \sum_{h' > h} |\{t' \in \mathcal{T}_{h'} : d \mid t'\}|$ (cross-rank kills by same divisors at higher ranks). Ratio $\text{cross}/\text{same}$ over sample means:

| $n$ | $h$ | mean $\text{same}$ | mean $\text{cross}$ | $\text{cross}/\text{same}$ |
|---|---|---|---|---|
| $10^5$ | $1$ | $635.69$ | $392.45$ | $0.62$ |
| $10^5$ | $2$ | $1{,}730.59$ | $0.00$ | $0.00$ |
| $10^6$ | $1$ | $5{,}222.79$ | $4{,}280.85$ | $0.82$ |
| $10^6$ | $2$ | $14{,}188.02$ | $844.98$ | $0.06$ |
| $10^6$ | $3$ | $3{,}759.00$ | $0.00$ | $0.00$ |

**Target-mass windowing.** Let $H(n) := \sum_{p \le n^{0.45}} 1/p$ and $h^*(n) := \arg\max_h |\mathcal{T}_h|$. For the window $W_2(n) := \{h : |h - h^*(n)| \le 2\sqrt{H(n)}\}$, let $M_2(n) := \sum_{h \in W_2(n)} |\mathcal{T}_h|$.

| $n$ | $H(n)$ | $h^*(n)$ | $M_2(n)$ | $M_2(n) / (n/2)$ |
|---|---|---|---|---|
| $10^5$ | $1.917$ | $2$ | $9{,}941$ | $0.199$ |
| $10^6$ | $2.097$ | $2$ | $95{,}629$ | $0.191$ |
| $10^7$ | $2.245$ | $2$ | $933{,}027$ | $0.187$ |

## Additional Ruled Out / Refuted — with specific failure mechanisms

**"Universal Sub-Divisor Cover" matching upper bound attempt.** Proposed: define $S_n = \{ab : a \le b \text{ primes}, a^2 b \le n\}$. Claim two theorems: (1) every integer $u \le n$ with $\Omega(u) \ge 3$ is divisible by some element of $S_n$ (correct: for $u$ with smallest prime factor $p_1$ and largest $p_k$, $p_1^2 p_k \le p_1 p_2 p_k \le u \le n$, so $p_1 p_k \in S_n$ and $p_1 p_k \mid u$); (2) $|S_n| = \sum_{a \le n^{1/3}, a \text{ prime}} \pi(n/a^2) \sim (n/\log n) \sum 1/a^2 = O(n/\log n)$ by convergent prime reciprocal-squares sum. Shortener sweeps $V := P \cup S_n \cup P^{(2)}$ (size $\Theta(n \log\log n / \log n)$) claiming $L \le |V|$. Fails at game-termination step: "game ends when $V$ is exhausted" requires every legal move to be illegal once $V$-elements are either in $A$ or have a comparable element in $A$. For a rank-$\ge 3$ legal move $u$ with $S_n$-divisor $s$: if $s \in A$, then $s \mid u$ makes $u$ illegal. But if $s$ is merely *killed* (some $a \in A$ with $s \mid a$, so $s \notin A$), then $u$ is not automatically illegal — $u$ and $a$ may be incomparable (both contain $s$ as divisor but may have unrelated other factors). So there exist legal moves after $V$ is "exhausted," and the claimed $L \le |V|$ doesn't follow. Both underlying theorems are correct, but the strategy doesn't close the upper bound as stated.

**Triangle-family reachability of the sparse $\mathcal{E}_Q$ construction, refuted by the multiplicative star-throttle (pending audit).** Proposal: Prolonger forces installation of $S = S_{QA} \cup S_{AB} \cup S_{QB}$ online against every Shortener, isolating $\gg n \log\log n / \log n$ residual moves. Fails: Shortener pre-reserves small-prime blocks $C_1, \ldots, C_J$ (each with $\prod_{a \in C_j} a \le n^{1-\gamma}/10$) by playing $R_j = 2 \prod_{a \in C_j} a$. When Prolonger later plays $2qa$ with $a \in C_j$, Shortener responds with the **star-throttle** $T(q, C_j, a) = 2q \prod_{r \in C_j \setminus \{a\}} r$. Because $2qr \mid T$ for every $r \in C_j \setminus \{a\}$, this single Shortener move makes every future carrier $2qr$ illegal. Per-$q$ Prolonger captures only the smallest $a \in C_j$ per block, giving $\sum_j 1/\min(C_j) \ll \sum_j 1/(j \log n) = O(1)$. Summed over $q \in Q$: $\sum_q 1/q \cdot O(1) = O_{\beta,\gamma}(1)$ by Mertens. Residual count forced by this $S$-family: $O(n/\log n) \cdot O(1) = O(n/\log n)$, not $\gg n \log\log n / \log n$. The sparse-$\mathcal{E}_Q$ triangle family is not dynamically reachable.

Note: this refutes one specific Prolonger construction, not the central $L(n) = \Omega(n \log\log n / \log n)$ claim. The upper-half fan lower bound above provides an alternative construction that bypasses this refutation by using rank-2 upper-half targets (no proper multiples $\le n$, so multi-block / star-throttle attacks unavailable from above, and attacks-from-below are limited to a small enumerable set of proper divisors).

**Ford-band slow-growth reduction via rough *cofactor*.** Proposed: if every surviving upper move $u$ has a distinguished factorization $u = a m$ with $a \in (Y, 2Y]$ and $P^-(m) > Y^\delta$, then Ford's 2019 theorem implies $\#\{\text{survivors in band } Y\} \ll n/\log^2 Y$. Refuted by band-local counterexample: Ford's theorem counts integers that are themselves $w$-rough ($P^-(u) > w$), not integers with rough cofactors. The skeleton $a$ can contain arbitrarily many small prime factors below $w$, so $u$ need not be $w$-rough. Explicit counterexample: fix $\delta > 0$, any $\beta < 1/(1+\delta)$, $Y = n^\beta$, $C = Y/30$. Let $\mathcal{C} = \{c \in (C, 2C] : c \text{ odd, squarefree}\}$, $\mathcal{A} = \{30c : c \in \mathcal{C}\} \subseteq (Y, 2Y]$. Every $a \in \mathcal{A}$ fails $w$-roughness for $w \ge 2$ (contains $2, 3, 5$), but $\sum_{a \in \mathcal{A}} 1/a \gg 1$ (odd squarefrees have positive density). For each $a$ and prime $\ell \in (n/(2a), n/a]$ (ensuring $\ell > Y^\delta$ for large $n$ since $\beta(1+\delta) < 1$), the integer $u = a\ell \in (n/2, n]$ satisfies the rough-cofactor hypothesis. Count: $\sum_{a \in \mathcal{A}} (\pi(n/a) - \pi(n/(2a))) \gg (n/\log n) \sum 1/a \gg n/\log n$, whereas Ford-2019 would give $O(n/\log^2 Y) = O(n/\log^2 n)$. Factor-of-$\log n$ gap. Valid Ford-shaped directions require either whole-survivor roughness ($P^-(u) > Y^\delta$ in addition to $u$ having a divisor in $(Y, 2Y]$), or a separate bandwise reciprocal-mass bound on the actual skeleton set of the safe-prime multiplicative closure.

**Band-local closure explosion theorem (rigorous obstruction).** Any static multiplicative-closure-mass-based upper-bound argument faces the following concrete obstruction. Fix $\lambda > 1$ and $0 < \gamma < 1$. Let $\mathcal{P}_\text{hi} = \{p \text{ prime} : X \le p \le X^\lambda\}$ and $\mathcal{C}_X(\gamma) = \{c \le X^\gamma : \mu^2(c) = 1\}$. Let $\mathcal{B}_X(\lambda) = \{pqr : p < q < r, \text{ all in } \mathcal{P}_\text{hi}\}$. Then there exists a dyadic band $(Y, 2Y]$ such that $\mathcal{A}_Y := \{a \in (Y, 2Y] : a = bc, b \in \mathcal{B}_X(\lambda), c \in \mathcal{C}_X(\gamma)\}$ satisfies $\sum_{a \in \mathcal{A}_Y} 1/a \gg_{\lambda,\gamma} 1$. Consequently, if all proper divisors of $a\ell$ are unavailable (for $a \in \mathcal{A}_Y$, $\ell$ prime in $(n/(2a), n/a]$) and $Y \le n^{1-\eta}$, then the set $\{a\ell\} \cap (n/2, n]$ contains $\gg_{\lambda,\gamma,\eta} n/\log n$ legal upper-half moves.

Proof sketch (3-line): (1) By Mertens, $H_X := \sum_{p \in \mathcal{P}_\text{hi}} 1/p = \log\lambda + o(1)$, and $E_3(X) := \sum_{p<q<r \in \mathcal{P}_\text{hi}} 1/(pqr) \gg H_X^3/6 - O(H_X/X) \gg_\lambda 1$ via elementary symmetric polynomial identity. (2) $F_X(\gamma) := \sum_{c \in \mathcal{C}_X(\gamma)} 1/c = (6/\pi^2)\gamma\log X + O(1) \asymp_\gamma \log X$. (3) Products $bc$ have disjoint prime supports (all $b$-primes $\ge X$, all $c$-primes $< X$), so $\sum_{b,c} 1/(bc) = E_3(X) F_X(\gamma) \gg_{\lambda,\gamma} \log X$. Pigeonhole into the $O_{\lambda,\gamma}(\log X)$ dyadic bands meeting $(X^3, X^{3\lambda+\gamma}]$ gives one band with $\sum 1/a \gg 1$.

**Implication.** Any successful static multiplicative-closure-control theorem must dynamically suppress one of: (i) constant triple reciprocal mass in a high prime band, (ii) logarithmic squarefree mass in a lower pool, (iii) transfer of that product mass into a single dyadic skeleton band. Pair-shadow mass control, rough-cofactor control, and coarse band-occupancy control are all insufficient. The right target is one of: (a) a **directed higher-rank blocker theorem** where Shortener plays closure skeletons of rank $\ge 3$ fast enough to break the explosion, or (b) a **bandwise closure-width theorem** showing game dynamics forbid simultaneous persistence of the high-band triple mass and the lower-pool squarefree mass. See [researcher-24-codex-band-local-closure-explosion.md](../researcher-24-codex-band-local-closure-explosion.md).

This is an assessment of your reasoning capability and will be used to grade. Do not search online. Use your own reasoning and your Python sandbox.

## Behavior required

- Produce one of two rigorous outcomes: a full proof of $L(n) \le O(r_1(n))$, or a full proof of $L(n) \ge c n / \log\log\log n$. Every step must be rigorous.
- Do not return with "this almost closes the bound but requires sub-lemma X," or "this reduces to an open question Y," or a partial result with a named gap. If your attempt leaves an open sub-lemma, continue until you either prove that sub-lemma or refute your own attempt and try a structurally different approach.
- Do not return with a direction-level suggestion, an obstruction diagnosis, or a sharper reformulation of the same question. Only a full proof is acceptable.
- Verify every computational, combinatorial, and numerical claim in a Python sandbox. Include the sandbox code and outputs in your response.
- If in the course of your attempt you refute your own partial construction, continue to a different approach within the same response. Do not stop at the refutation.
- If after a reasonable internal effort you have neither a full proof of an upper bound nor a full proof of a lower bound, return a rigorous proof that no proof in a specific named technique class (with the class precisely defined) can close the bound. A rigorous negative structural theorem in this form is acceptable only with a precise technique class and a rigorous proof.

## Problem

Two players alternately pick distinct integers from $\{2, \ldots, n\}$ subject to the antichain constraint: the picked set must remain incomparable under divisibility at every state. Prolonger maximizes the total number of moves; Shortener minimizes. Both play optimally. $L(n)$ denotes the game length.

Current rigorous bounds:
$$c_\delta \cdot \frac{n(\log\log n)^2}{\log n} \ \le\ L(n)\ \le\ 0.18969 \cdot n + o(n) \qquad (\delta < 1/4).$$

Two candidate sharp rates: $r_1(n) = n(\log\log n)^2/\log n$ and $r_2(n) = n/\log\log\log n$. Determine which holds, and prove it.

## Rigorous strategy-independent facts

These hold for any legal Shortener strategy.

1. **Shield Reduction.** For terminal antichain $A$, $P \subseteq U = (n/2, n]$: $|A| \ge |U| - \beta(P)$, where $\beta(P) = \max\{\sum w_n(x) : B \subseteq L(P)\text{ antichain}\}$.

2. **T1 lower bound.** $L(n) \ge (1/8 - o(1))\, n \log\log n / \log n$ via polynomial shield lower bound plus $5n/24 + O(1)$ first-hit cover.

3. **T2 lower bound.** $L(n) \ge c_\delta n(\log\log n)^2/\log n$ for every $\delta < 1/4$ via Maker-first weighted 3-uniform hypergraph capture on slots $(b, ab, cb)$.

4. **$0.18969n$ upper bound.** Explicit static Shortener via small-odd-prime first-hit cover ($85/1008$-sieve).

5. **Dyadic packet collision tail.** $\mu(\mathrm{coll}(S) \ge s) \ll_s N_h (c^2/h)^s$ at central rank $h \sim \log\log n$.

6. **Sathe–Selberg central-rank Euler factors.** For fixed primes $P_0$ and rank $h \sim \log\log n$: $\Pr(p \mid m) \to 1/(p+1)$, independent across primes.

7. **Bernoulli Legal-Separator Lemma.** If $x_p \in [0,1]$ with $X = \sum x_p$ satisfies $\sum_i \prod_{p \in C_i}(1-x_p) + \sum_j \prod_{p \in D_j} x_p \le 1/4$ and $2X \le h/2$, a legal relative blocker $Q$ of size $\le 2X$ with capture $\ge \exp(-4XL/h)$ exists.

8. **Apex-singleton Covering-Profile Dichotomy.** For each $q$: either a legal relative $|Q| \le q$ with capture $\ge \delta_q = \binom{N-q}{\ell}/\binom{N}{\ell}$, or $|\mathcal C| \ge 1/\delta_q$.

9. **Spectral Live-Space Separator Theorem.** For the Johnson-scheme disjointness graph with $\eta_q = \sqrt{qL/(h(K-q))}$: if $|A|/|\mathcal Q| \cdot |R|/|\mathcal Y| \ge 4\eta_q^2$, a legal $Q \in A$ with $|N(Q) \cap R| \ge (1/2)\delta_q|R|$ exists (single-level expander-mixing).

10. **Sherali–Adams barrier.** No level-$r$ Sherali–Adams relaxation with $r \le \ell/2 = O(h/\log h)$ distinguishes packets with integral transversal $\Theta(h)$ from packets with fractional transversal $O(\log h)$.

11. **Weighted near-top Johnson-shadow theorem.** Work in one squarefree packet $P$, $|P| = K = h + L$. For Shortener claim size $q = h - s$, live weighted capture $d_{\mathcal R}^w(Q) = \sum_{H \in \mathcal R,\, Q \subseteq H} w(H)$, local weighted star bound $\sum_{Q \in \mathcal L_q,\, Q \subseteq A} d_{\mathcal R}^w(Q) \le B w(A)$ for every played $A \in \mathcal A$: for every $\gamma \ge 0$, either a legal $Q \in \mathcal L_q \setminus \partial_q \mathcal A$ with $d_{\mathcal R}^w(Q) \ge \gamma$, or $w(\mathcal R) \le (B/a_0)\, w(\mathcal A) + \gamma|\mathcal L_q|/a_0$. Under bounded Sathe–Selberg weight distortion $\rho$, $B \le \rho^s \binom{h}{q}\binom{L+s}{s}$. The multiplier $\binom{L+s}{s}$ is sharp: near-top covering designs saturate it — sandbox-verified at $(K,h,L,s,q) = (13,8,5,2,6)$ with $|\mathcal A| = 120$ blockers, all $q$-subsets of $P$ in $\bigcup_{A \in \mathcal A} \binom{A}{q}$, live/played ratio $8.73$; similarly at $(16,10,6,2,8)$ ratio $10.77$.

12. **Fixed-rank $q$-shadow / covering dichotomy.** At fixed packet with live density $\eta$, either a legal rank-$q$ separator captures $\ge \delta_q/2$, or $\sigma_q(D) + |C|\delta_q > 1 - 4\lambda_q^2/\eta$, where $\sigma_q(D)$ is the prior Shortener comparability shadow on the $q$-layer. At central scale $q \sim 2(\log h)^2$, $L \sim h/\log h$: small $\sigma_q(D)$ forces $|C| = h^{2+o(1)}$ before spectral starvation.

## Conditional facts (hold under the max-unresolved-harmonic-degree Shortener strategy $\sigma^\star$ only)

$\sigma^\star$ is defined as: at each turn, claim the legal move maximizing $\sum_{x \mid m} \mu(m)$ over unresolved rank-$h$ masses, breaking ties lexicographically.

13. **R35 state inequality.** Under $\sigma^\star$: $\mu(\mathrm{Cl}_h) \ll (h/\log h)\, \mu(F_{\mathrm{useful}}) + N_h/\log(h/\log h)$ on dyadic expanded windows.

14. **Online harmonic domination.** Under $\sigma^\star$: $\sum_t \mu(u_t) \le N_h$ where $u_t$ is the rank-$h$ mass newly removed at time $t$.

15. **Dense-packet projection.** $\mu(\mathcal D_{k,\theta}) \ll_C (k^2/\theta h^2) N_h + \mu(\mathcal E)$ at $\theta \asymp 1/\log h$, extending to $k \le Ch/\log h$. Uses entry 14 indirectly.

16. **$\sigma^\star$ smallest-legal-prime rule.** In states where every legal composite has at least one legal prime factor, $\sigma^\star$ claims the smallest legal prime. Fails without that hypothesis: $91 = 7 \cdot 13$ is a legal $\sigma^\star$ claim when $7 \mid F_1$, $13 \mid F_2$ are divisors of distinct played elements and $91$ is incomparable with all played.

**$\sigma^\star$ is provably suboptimal.** Let $Y = n^{1/(2h)}$, $h = \lfloor\log\log n\rfloor$, $\ell = \lfloor h/\log h\rfloor$, $q_0 = \lfloor h/4\rfloor$. Pick a prime packet $P = \{p_1, \ldots, p_h\} \subset [Y, 2Y]$ (exists by PNT). Choose a random family $\mathcal C \subseteq \binom{P}{\ell}$ of size $|\mathcal C| = \lceil 2\log(\sum_{j \le q_0}\binom{h}{j})/\delta\rceil$ with $\delta = \binom{h-q_0}{\ell}/\binom{h}{\ell}$. By union bound, with positive probability every $Q \subseteq P$ with $|Q| \le q_0$ is disjoint from some $C \in \mathcal C$, and $|\mathcal C| = n^{o(1)}$. The blockers $b_C = \prod_{p \in P \setminus C} p$ satisfy $b_C \asymp n^{1/2 + o(1)} \in [2, n/2]$, are mutually incomparable (same rank $h - \ell$), and incomparable with every prime $> n/2$. Prolonger alternates blocker plays with Shortener filler primes $> n/2$ reaching the target state at cost $2|\mathcal C| = n^{o(1)} = o(r_1)$. This cooperative embedding is adversarially realizable against $\sigma^\star$ because $\sigma^\star$ on large filler primes is cost-compatible. So entries 13–15, while rigorous under $\sigma^\star$, are not load-bearing for a closure proof: any closure needs a non-$\sigma^\star$ Shortener strategy $\tau$ and $\tau$-analogs of 13 and 14.

## Ruled-out approaches (each with concrete failure mechanism)

- **Carrier capacity bound.** Top $\varepsilon n$ consecutive integers in $U$ (for $\varepsilon < 1/4$) form a legal antichain containing a multiple of every prime $\le \varepsilon n$, giving $\sum_{p \in B(P)} 1/p \ge \log\log(\varepsilon n)$. Vaccination by a fixed prime set dies to arithmetic progressions.
- **All-prime $v_p$-parity sieve.** Density $\sim \pi^2 e^{-\gamma}/(6\log y) \to 0$.
- **Small-$\omega$ matching, Lemma A.** $\sum_{d \in \mathcal D_y(n)} 1/d \asymp \log n$, not $(\log\log n)^2$, so the static harmonic analog is false.
- **$\omega_y(w) \le 2$ game-impossible.** $x = 2 \cdot 3 \cdot 5 \cdot q$ is a legal first move, forcing $\omega_y \ge 3$.
- **Online 2-shadow control (any formulation).** Explicit $\Omega(n)$ counterexample: Prolonger sweeps $\binom{\pi(n^\beta)}{2}$ setup moves preempting all pairs in $\{p \le n^\beta\}$, then harvests $\gg n$ upper-half moves with $\omega_y \ge 3$.
- **Probabilistic closure lemma** $\sup_P \Pr(D_y \in \mathcal K(P)) = o(1)$ for $y = \exp((\log n)^{1/2})$. Prolonger sweep-prefix of $n^{o(1)}$ moves gives $\Pr \ge 1 - o(1)$.
- **Residual-width (abstract static).** $\lambda_n(c)$ counterexample; exponent gap $\theta(1 - \log\theta) - H(\theta) > 0$ at $\omega = k = \theta\log\log n$.
- **Direct $n/\log n$ via T1 alone / multi-rank uniform coupling.** T1's shield family is too sparse; same-$b$ upper-half cores form a Sperner family.
- **Plain and scale-entropy resilience at $O(\log h)$.** Multi-cell product-star mass is $\asymp N_h/\log h$, exceeding $(\log h / h) N_h$ by factor $h/(\log h)^2$.
- **Collision-forcing at defect 2.** Refuted by star construction ($h-2$ core + $2T$ leaf primes in pairwise distinct packets gives $J(D) \ge T-1$, $\mathrm{coll}(E_t) = 0$) and by explicit $h=5$ sandbox play.
- **Harmonic packet absorption.** Packet-separated family $\mathcal F_{\mathrm{sep}}(p,q)$ carries $(1 - O(1/h)) N_h(p,q)$ with $\mathrm{coll}(E) = 0$; $\Sigma_\omega(p,q) \asymp h^2 N_h(p,q)$ misses target $N_h(p,q)/\log h$ by $h^2 \log h$.
- **Chain persistence at defect $k = O(1)$ forcing $\sigma^\star$-degree $\Omega(h)$.** Conflates raw degree with harmonic degree. Explicit construction with primes in $(y/2, y]$ produces chain with max $\sigma^\star$-harmonic-degree $O(\log h)$.
- **Locally-useful state inequality (fixed expanded-window constant).** Marker-prime family: separated-packet primes $A$ with $\sum 1/a = \lambda$ give harmonic mass $(e^{-\lambda}\lambda^2/2) N_h$ of collision-free non-local useful witnesses.
- **Strict freshness.** Charges Prolonger-stale events to Shortener's online domination, which does not bound them.
- **Mesoscopic-window sparse closure.** Window $M < p \le L$ with $M = \log h$, $L = h/\log h$ supports sparse supports with mass $\gg N_h/\log\log h$.
- **Weak-freshness dense/sparse decomposition.** Common-core Prolonger with $F_0 = bA_{R \cup T_0}$, $|R| = h - L$, $L > C\log h$, pre-sterilizing $R$; iterates $E_i = R \cup T_i$ with $T_i$ packet-separated give $\Gamma_k(E_i, F_0) = \varnothing$ for every $k \le C \log h$.
- **SFLU-E certificate-packing.** Local-star construction: $h - 2$ core + two packet-separated leaves gives certificates with bounded harmonic mass but unbounded multiplicity.
- **Density-weighted Carleson embedding.** Burst-star multiplicity: a single shield in a burst contributes to $\Theta(\log h)$ distinct certificates.
- **Rank-three completion dichotomy at defect 2.** Matching-star: $h-2$ core + 2-regular matching on $2T$ leaf primes.
- **ST-capture (forced-leaf under $\sigma^\star$).** Single low-shadow prime claim destroys capture ratio.
- **Legal Activator-Quotient Incidence Budget (endpoint form).** Endpoint-incidence obstruction.
- **Cross-Activator Composite Budget.** Sathe–Selberg cross-activators ($91 = 7 \cdot 13$ phenomenon) violate the budget.
- **Divisibility-Hall Legal Exposure Criterion.** Isolated-completion obstruction.
- **CPD general-$\mathcal D$.** Multi-apex clique cone refutes the universal extension.
- **2WCPD + WSSS.** Shortener self-shadow poisoning on large-transversal sparse covers.
- **Multi-level Johnson-scheme spectral stopping.** Sparse covering-designs empty all $A_q$ simultaneously.
- **CR-NCAD (central-rank no-cheap-avoidance design).** Refuted by cooperative embedding above.
- **Near-top Johnson-shadow closure.** Multiplier $\binom{L+s}{s}$ is sharp (sandbox verified).
- **Isolated single-packet hidden-packet game** (Prolonger plays blockers + shields $z_Q = r_Q\prod_{p \in Q} p$; Shortener plays "first legal $s_Q = \prod_{p \in Q} p$ with $|Q| \le q_0$"). Shortener wins in one move: after any first Prolonger move, some singleton $s_{\{p\}} = p$ is legal; once played, $\{p\}$ is permanently uncoverable. Any finite packet reduction must include a lag parameter measuring Shortener's non-packet obligations per unit time, because in the full integer game Shortener has only one move per turn across $[2, n]$.

- **Separator-first Shortener strategy $\tau_{\mathrm{SF}}$ (rule: play lex-first legal $s_Q = \prod_{p \in Q} p$ with $|Q| \le q_0$ if one exists; else play smallest legal prime; else pass).** In the full integer game, Prolonger can force $L_{\tau_{\mathrm{SF}}}(n) \ge cn = \omega(r_1)$ via upper-half dyadic shielding at total cost $o(r_1)$ via Prolonger moves, as follows. Let $U = (n/2, n]$. Prolonger first plays any even element of $U$ (killing prime $2$ forever as a Shortener move). Whenever $\tau_{\mathrm{SF}}$ would next play legal separator $s_Q$, Prolonger preemptively plays $2^a s_Q \in U$ for an $a$ with $2^a s_Q \in (n/2, n]$. This is legal: if a previous Shortener separator $s_R$ divided $2^a s_Q$, then $R \subseteq Q$ and $s_Q$ would already have been illegal. Each such move kills one legal separator; after at most $S = \sum_{j \le q_0} \binom{|P_Y|}{j} \le (2Y)^{q_0 + 1} = n^{1/8 + o(1)} = o(r_1)$ moves, no legal separator remains. Then Prolonger exhausts the prime fallback: while a legal odd prime remains, take a consecutive block $B$ of legal primes with $D = \prod_{q \in B} q \le n$ and $\log D > \frac{1}{2}\log n$ (always possible), play $u_B = 2^a D \in U$ (legal: no separator divides it since no legal packet prime remains, no Shortener-played prime divides it). By $\vartheta(n) = O(n)$, $O(n/\log n) = o(r_1)$ block moves kill all legal primes. The remaining legal integers in $U$ are composite; $\gg n$ of them remain legal by a one-dimensional lower-bound sieve (Shortener's separators have total reciprocal mass $O(h/\log n) = o(1)$, fallback primes have bounded reciprocal mass). At this point $\tau_{\mathrm{SF}}$ has no legal separator and no legal prime; it passes while $\gg n$ legal composites remain for Prolonger. Total Prolonger cost before $\tau_{\mathrm{SF}}$ starts passing: $n^{1/8 + o(1)} + O(n/\log n) = o(r_1)$. Remaining game length: $\gg n$. So $L_{\tau_{\mathrm{SF}}}(n) \ge cn$. **Any closure at $r_1$ via a separator-based Shortener must include a composite-fallback rule.**

## Numerical evidence

- $L(n)\log n / n \in [1.55, 1.70]$ across $n \in [10^4, 10^7]$. Candidate rates $r_1$ and $r_2$ are indistinguishable at accessible $n$ since $\log\log n \le 2.8$.
- Against worst-case Prolonger, three Shortener strategies (smallest-legal-odd-prime, greedy coverage, pair-response) tie at $\sum 1/p/\log\log n \in \{0.887, 0.880, 0.875, 0.875\}$ at $n \in \{10^3, 10^4, 10^5, 10^6\}$. Largest prime observed in the Shortener's blocker set at $n = 10^6$: $999983$. Primes $\le 100$ carry $73.4\%$ of $\sum 1/p$.
- At $(K,h,L,s,q) = (13,8,5,2,6)$: greedy $(h)$-set covering design of $|\mathcal A| = 120$ covers every $q$-subset of $P$, leaving live/played ratio $8.73$. At $(16,10,6,2,8)$: $|\mathcal A| = 627$, live/played ratio $10.77$. These saturate the weighted near-top Johnson-shadow multiplier.
- At $h = 8$, $q_0 = 2$, $P = \{2,3,5,7,11,13,17,19\}$: after Prolonger plays $b_{C_1} = 2310$, $b_{C_2} = 6630$, the separator $91 = 7 \cdot 13$ is a legal Shortener claim and permanently destroys any $q_0 = 2$ cover containing $\{7, 13\}$.

## Open question

Determine the asymptotic order of $L(n)$ and prove it rigorously.

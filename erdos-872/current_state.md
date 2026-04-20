# Current State

> **TRUE 30-second orientation (updated 2026-04-19 post-R46 synthesis):**
>
> **R46 outcome — Angle 2 (ST-capture / Carleson packing) rigorously refuted; Angle 1 (activator-quotient) survived attempted refutations.** Three independent Pros converged on the same game-legal construction: prime packet $I = [P, 2P]$ with core $C$ and leaves $W$, burn-in forcing $\sigma^\star$ to claim all primes below the packet, then Prolonger activator $F_0 = w_1 \cdot \prod C$, after which $\sigma^\star$ is forced to claim the smallest remaining legal prime — a single leaf, touching only $O(1/h)$ of the shield's local shadow. Capture ratio $\to 0$. Two Pros attempted to refute Angle 1 via "global burst-star" and "disjoint matching-star" constructions; both failed on the same game-legality error (claiming $\sigma^\star$ plays a prime that divides Prolonger's activator, which is illegal in the antichain game).
>
> **New established lemma (R46, proved by $\sigma^\star$ replacement inequality).** Among legal primes $p < q$, $\deg_t(p) > \deg_t(q)$: replacing $q$ by $p$ in any rank-$h$ squarefree facet gives an unresolved facet of no larger product and strictly larger harmonic weight. Composites have degree $\le$ their min prime factor. Therefore $\sigma^\star$ *always* claims the smallest remaining legal prime. This is a genuine dynamic property of $\sigma^\star$ and constrains what any Carleson-type embedding can achieve.
>
> **New Ruled Out (R46).** (i) ST-capture lemma $\mu_h(S(D) \cap U_{\tau(D)}) \ge c \nu(C(D))$ — refuted by burn-in + forced-leaf construction. (ii) "$\sigma^\star$ can claim prime divisors of Prolonger's played elements" — game-legality attractor; once $F$ is played, its prime factors are illegal Shortener claims by the antichain rule. Any refutation argument that relies on $\sigma^\star$ claiming such primes is invalid.
>
> **Current live angles** (post-R46): **Angle 1** (activator-quotient state inequality, Pro #1 R45): replace R35 with $\mu(\operatorname{Cl}_h) \ll (h/\log h) Q_h + N_h H^2/\log n$ where $Q_h$ counts each activator facet once; **Angle 3** (sparse matching-residue packing trichotomy, Pro #3 R45); **Angle 4** (rigorous refutation of the conjectured sharp rate via Prolonger lower-bound construction against $\sigma^\star$, noting game-legality must be respected).
>
> Angles 1 and 4 are logically opposing — Angle 1 closes the sharp conjectured rate, Angle 4 refutes it. A definitive answer on either resolves the program.
>

>
> **Rigorous bounds (unchanged):**
> - **T1** (formally verified): $(1/8 - o(1)) n\log\log n/\log n \le L(n) \le (13/36 + o(1)) n$.
> - **T2** (rigorous via Codex R21 Maker-first repair + activation audit, not Lean): $L(n) \ge c_\delta n(\log\log n)^2/\log n$.
> - **R35 static estimate** (rigorous in arithmetic cell-local model): $\mu(\operatorname{Cl}_h) \ll (h/\log h) \mu(F_{\text{useful}}) + N_h/\log(h/\log h)$ via dyadic expanded windows. Note: residual floor is $\asymp N_h/\log h$.
> - **Upper bound**: $L(n) \le 0.18969 n$ (linear).
>
> **Linear route to $\Theta(n)$ comprehensively closed.**
>
> **R44 round outcome — the picture is now clean.** An "open full-solution" dispatch to five Pro threads returned:
> - 1 honest concession (no proof claimed) → produced the genuine new candidate **SFLU-E (lifted harmonic measure + strong freshness + local usefulness)** → then independently self-refuted at the critical steps on formal follow-up.
> - 3 attractor hallucinations converging on $\Theta(n(\log\log n)^2/\log n)$ via the same invalid hand-wave: "$\sigma^\star$ + online harmonic domination trivially bound $\mu(F_{\text{useful}})$." Online domination is on Shortener's claims $u_t$, not on Prolonger's useful shields. This attractor is now Ruled Out.
> - External adversarial audit of SFLU-E independently converged with Pro #1's self-refutation on every point.
>
> **What SFLU-E formalized as conditional theorem.** The lifted harmonic measure $\nu_{h,k}(D) = \mu_h(\operatorname{Sh}^{\text{loc}}_h(D))/\binom{h}{k}$ combined with strong freshness (no prior Shortener OR Prolonger sterilization) and local usefulness (replacement window $q/p \in (1/2, 2)$) yields
> $$\nu_{h,k}^\Sigma(\mathcal E_{k,\theta}^{\text{sf,loc}}) \ll_C \theta^{-1}(Ck/h)^{s(k)} N_h \quad \text{(SFLU-E)}$$
> with $s(k) = \min\{k-1, \lfloor h/\log h \rfloor\}$, **CONDITIONAL on a certificate-packing estimate** $\sum_D \nu(C(D)) \ll N_h$.
>
> **Why packing is not a consequence of strong freshness.** Explicit local star obstruction: fix $C = \{c_1, \ldots, c_{h-1}\}$, $W = \{w_1, \ldots, w_M\}$ with $M = \lfloor \log h \rfloor$. Defect-two shields $D_i = C \setminus \{c_i\}$ all share the *same* defect-1 coface $C$, all satisfy the density condition (1) at $\theta \asymp 1/\log h$, all are strongly fresh before Prolonger activates. Family-level union lift $\nu_{h,2}^\cup(\{D_i\}) \asymp M^2/h$; single-coface lift $\nu_{h,1}(C) \asymp M/h$. The ratio gap is a factor of $h$. This is the local version of the star-at-depth-2 phenomenon — strong freshness plus locality alone does not imply charged-shadow disjointness.
>
> **R35 residual floor — new structural obstruction to the sharp rate.** Even in the idealized case $\mu(F_{\text{useful}}) = 0$, the R35 error term $N_h/\log(h/\log h) \asymp N_h/\log h$ sums over central ranks $h \sim \log\log n$ to give only $L(n) \ll n/\log\log\log n$. The conjectured sharp rate $n(\log\log n)^2/\log n$ is **strictly smaller** than this floor (by factor $\log n / ((\log\log n)^2 \log\log\log n) \to \infty$). So R35 alone, even idealized, cannot reach the conjectured sharp rate. Closing the sharp rate requires a new state inequality with residual floor $\ll N_h \cdot (\log\log n)^2/\log n$ at central rank.
>
> **Three precisely stated open lemmas (R44 closing summary).**
> - **(A) Certificate-packing theorem.** Under strong freshness + local usefulness: $\sum_{D \in \mathcal E_{k,\theta}^{\text{sf,loc}}} \nu(C(D)) \ll N_h$. Must handle simultaneous activation and shared cofaces.
> - **(B) Sharper defect-two estimate.** $\mu(\mathcal E_{2, 1/\log h}^{\text{sf,loc}}) \ll N_h/h$. (SFLU-E gives $(\log h/h) N_h$ — off by factor $\log h$ against the $L = h/\log h$ multiplier in R35.)
> - **(C) Replacement state inequality** with residual $\ll N_h \cdot (\log\log n)^2/\log n$ at central rank.
>
> **What (A)+(B)+(C) give.**
> - (A) + (B) ⟹ $\mu(F_{\text{useful}}) \ll N_h/h$ ⟹ $\mu(\text{Cl}_h) \ll N_h/\log h$ (via R35) ⟹ $L(n) \ll n/\log\log\log n$ ⟹ closes $L(n) = o(n)$ rigorously.
> - (A) + (B) + (C) ⟹ $L(n) \ll n(\log\log n)^2/\log n$ ⟹ closes the conjectured sharp rate.
>
> **Status of the $\Theta(n(\log\log n)^2/\log n)$ conjecture.** Attractor evidence from independent Pro threads is strong — the number-theoretic scale matches $\#\{m \le n : \Omega(m) = 3\}$ (Sathe-Selberg). But there is now a specific structural obstruction to closing it from existing rigorous ingredients, namely the R35 residual floor. Live possibility: the true sharp rate may be $n/\log\log\log n$, not $n(\log\log n)^2/\log n$.
>
> **Empirical (Phase 4):** $L\log n/n \in [1.55, 1.70]$ across $n \in [10^4, 10^7]$. Cannot distinguish candidate rates at accessible $n$ since $\log\log n \le 2.8$. Observed ratio is flatter than the Sathe-Selberg prediction $(\log\log n)^2/4 \in \{1.23, 1.49, 1.72, 1.93\}$, consistent with either rate at this range.
>
> **Current dispatch priorities** (R45 plan):
> 1. **(A) certificate packing** — most tractable; Carleson-style bound in lifted harmonic measure. Cross-family dispatch (Pro + Codex + Gemini).
> 2. **(B) sharper defect-two** — requires a sharper dense-packet projection at $k=2$ beyond the naive $k^2/\theta$ bound. Pro continuation with explicit $k=2$ focus.
> 3. **(C) replacement state inequality** — hardest and most speculative. Contrarian framing: "either prove (C) or prove $L(n) \not\asymp n(\log\log n)^2/\log n$."
>
> For technical detail see `prompts/canonical-prompt.md` (Established + Ruled Out), `researcher-3*-*.md` and `researcher-4*-*.md` for round-by-round, `process.md` for methodology.

---

## Extended state (pre-R36 detail, kept for reference)

> **Current windows.**
> - **T1 (rigorous, formally verified):** $(1/8 - o(1)) \cdot n\log\log n/\log n \le L(n) \le (13/36 + o(1)) n$.
> - **T2 (rigorous after Codex 2026-04-19 repair pass; not formally Lean-verified).** Lower bound $L(n) \ge c_\delta n(\log\log n)^2/\log n$ program:
>   - **Lemma 1 (Maker-first weighted pair-capture).** Potential $\phi(e) \in \{w/8, w/4, w/2, w\}$ by endpoint-capture count. Max-gain Maker move dominates every single Breaker reply. Exhaustive sanity check passes on all graph states $\le 5$ vertices. ✓
>   - **Lemma 2 (Maker-first scored 3-uniform hypergraph capture).** Reformulated game on slots $(b, ab, cb)$ with Breaker scored-edge plays counting into the final length. Potential $Q = S + \sum \phi(e)$ Maker-first nondecreasing. Exhaustive check passes on all 3-uniform hypergraphs on 4 vertices. ✓
>   - **Divisibility → hypergraph embedding (done, 2026-04-19 follow-up).** For live target $t = acb > n/2$ with $a, c, ac$ already unavailable: only harmful future moves are $\{b, ab, cb, t\}$. Slot plays $b, ab, cb$ are exactly vertex deletions in the slot hypergraph. Exact-target play $t$ is modeled as a scored edge (targets in $(n/2, n]$ are pairwise incomparable, so $t$-play doesn't kill other targets; extra divisibility side-effects only remove future Breaker options). Converse: live hypergraph edges remain legal actual moves. **Residual divisibility game is strictly Maker-friendlier than the scored hypergraph game**, so the abstract hypergraph lemma is a valid lower-bound model for Lemma 2. ✓
>   - **Activation-stage bookkeeping / fresh-prime supply (done, 2026-04-19 follow-up).** Tokenize each pair-edge $(a,c)$ by its live large-prime set $B_{a,c}=J_{a,c}\cap\mathbb P$. With activation score $S_t$ and current live token counts $w_t(e)$, the correct graph quantity is
>     \[
>     Q_t = S_t + \sum_{e\ \mathrm{claimed}} w_t(e) + \sum_{e\ \mathrm{unclaimed}} c_e\, w_t(e),\qquad c_e\in\{1/8,1/4,1/2\}.
>     \]
>     Maker's max-gain graph move still dominates graph deletions. Off-model Shortener moves only delete target tokens, so they contribute a subtractive error term $E$ equal to the total number of killed tokens. Each such deletion lowers $Q_t$ by at most $1$, hence
>     \[
>     Q_{\rm end}\ge W_0/8 - E,
>     \]
>     where $W_0=\sum_{a<c}|J_{a,c}\cap\mathbb P|$. Large-prime moves kill at most $O(Y^2/\log^2Y)$ tokens per round, lateral moves at most $O(Y/\log Y)$, exact targets one, across $R=O(Y^2/\log^2Y)$ activation rounds, so
>     \[
>     E\ll Y^4/\log^4Y=o\!\big(n(\log\log n)^2/\log n\big)
>     \]
>     for $\delta<1/4$. Since $Q_{\rm end}$ equals activation moves plus residual live target weight on secured pairs, and the activation score itself is $o(n(\log\log n)^2/\log n)$, the secured pairs still carry residual weight $\gg_\delta n(\log\log n)^2/\log n$. This closes the last bookkeeping gap. ✓
>   - See [phase4/t2_maker_first_lemmas.md](phase4/t2_maker_first_lemmas.md), [researcher-22-codex-T2-activation-audit.md](researcher-22-codex-T2-activation-audit.md).
> - **Upper bound (T2-side, cross-derived):** $L(n) \le (\mathcal{W}/2 + o(1)) n \approx 0.18969 n$. Linear.
>
> **Linear route to $\Theta(n)$ is comprehensively closed** (Rounds 13, 17, 18):
> - Probe B empirical: cross-rank Prolonger shielding collapses at $h = 2$.
> - Separate-rank fan harvesting provably sublinear: $\max_h W_h \sim n/\sqrt{\log\log n}$; $\sum_h F_h \le n/(\log n)^{1-o(1)}$.
> - Uniform multi-rank Prolonger coupling rigorously refuted: same-$b$ upper-half cores form a Sperner family, each earlier move shields at most one top-lateral divisor.
>
> **Matching-upper-bound programs refuted convergently (Rounds 19-20):**
> - Static harmonic-sum Lemma A is false ($\sum_{d \in \mathcal{D}_y(n)} 1/d \asymp_\alpha \log n$, not $(\log\log n)^2$). Triple-confirmed.
> - "$\omega_y \le 2$" hypothesis is game-impossible ($x = 2 \cdot 3 \cdot 5 \cdot q$ is a legal first move).
> - Residual-width lemma (abstract static form) refuted by $\lambda_n(c)$ counterexample.
> - **Online 2-shadow control theorem (all three formulations) refuted** by Pro's explicit $\Omega(n)$ counterexample: after a setup phase of $\binom{\pi(n^\beta)}{2}$ Prolonger moves $x_{pq} = pq R_{pq}$ preempting all pairs in $\{p\le n^\beta\}$, Prolonger can harvest $\gg n$ upper-half moves $w = p_1 p_2 p_3 \cdot c \cdot \ell$ with $\omega_y(w) \ge 3$ and $c$ a squarefree smooth factor contributing harmonic mass $\asymp \log n$. Codex's attempted DTK+Buchstab proof of a stronger bound (Round-20 high-support proof) is flagged as broken (DTK's $\sqrt{\pi(p-1)}$ divisor does not apply to the full $(<p)$-smooth antichain ≤ T; max antichain is $\Theta(\Psi_{<p}(T))$, not $\Psi/\sqrt{\pi(p)}$).
> - Structural lesson: 2-shadow reciprocal mass controls only the pair layer, not the multiplicative closure generated by a safe small-prime set. Future matching-upper-bound programs must track squarefree closure.
>
> **Conditional partial theorem (Codex, rigorous).** Under "$\omega_y \le 2$" + large-prime stability, $L(n) = O_\alpha(n(\log\log n)^2/\log n)$. Hypothesis non-enforceable but framework sound.
>
> **Open gaps (updated 2026-04-19 late evening, post Pro's certificate-family gap isolation):**
>
> **New rigorous reduction (Pro).** $L(n) \le 2|C_n| + 1 + \sup_{\text{reachable}} w(R_{C_n}(P, S))$ for any certificate family $C_n$. Reduces the problem of proving $L(n) = o(n)$ to finding a sublinear $C_n$ with sublinear residual width.
>
> 1. **Directed higher-rank multiplicative-closure control (upper-bound side; Shortener-strategy framing).** Shortener plays rank-3 closure skeletons $pqr$ in each high prime band. Round 25 cleared the move-count budget at $O(n\log\log n/\log n)$, below T2. Load-bearing gap: the online race between Shortener's installations and Prolonger's high-support preemptions $bc\ell$.
> 2. **Residual-width proof for a sublinear certificate family (upper-bound side; certificate-reduction framing).** Reduction above isolates the exact missing lemma: for $C_y = \{d \le n/2 : d \text{ squarefree}, P^+(d) \le y\}$ with $y = \exp((\log n)^{1/2})$ (sublinear since $|C_y| \le \Psi(n, y) = o(n)$), prove $\sup_P \sum_{d \in \mathcal{K}(P)} 1/\varphi(d) = o(\log y)$, where $\mathcal{K}(P)$ is the down-closed complex generated by Prolonger's actually-activated $C_y$-divisors. Naive crude-divisor-incidence fails quantitatively (entropy calculation: for $C_k$ with $\omega = k = \theta \log\log n$, exponent gap $\theta(1-\log\theta) - \mathsf{H}(\theta) > 0$). See researcher-22-pro-certificate-family-gap-isolated.md.
> 3. ~~**Within-$b$-fiber capture theorem.**~~ **Collapsed by Round 22 Pro:** the single-fiber positive-density theorem is exactly the original linear conjecture rescaled. Because $b > \sqrt{n}$ makes cross-fiber laterals incomparable, multi-fiber value $\le \sum_b L_{\mathrm{upper}}(K_b)$. Positive-density dyadic theorem $\iff L(n) = \Omega(n)$. See researcher-22-pro-dyadic-fiber-collapse.md.
>
> **Gap convergence.** Gaps 1 and 2 reduce to the same underlying missing theorem: **dynamic control of the full squarefree multiplicative closure generated by Prolonger's sweep moves.** Two different framings (Shortener-strategy vs. certificate-reduction), one common bottleneck.
>
> **Sharpened reduction (Pro Round-22 third return, 2026-04-19 late evening).** The right invariant is the **defect-layer closure budget** $\mathfrak B_h(R, C) = \sum_{k=1}^h |\partial_{h-k} R \setminus C_{h-k}|/\binom{h}{k}$ (full squarefree-closure analogue of pair-shadow mass), with total scale $B_h \asymp (1+o(1)) N_h/H$ dominated by the top-facet layer. The identity $V_{h,k}/\binom{h}{k} = N_h/D_{h,k}$ shows no positive drift at any fixed defect layer, explaining uniformly why pair-shadow, rough-cofactor, and static rank-$k$ approaches all fail. **Sublinear $L(n)$ follows from a robust central transversal lemma** with $g(h) = o(h)$; specifically $g(h) = O(\log h)$ gives $L(n) \ll n \log\log\log n / \log\log n$. The precise missing statement: for the online $h$-uniform hypergraph where Shortener claims one certificate per turn and Prolonger steals the $h$-vertex boundary of one target per turn, Shortener can build an approximate robust transversal at size $O(g(h) N_h/H)$. Ordinary covering number is the right size but static Rödl-style constructions do not survive Prolonger's downset stealing. See researcher-22-pro-defect-budget-invariant.md.
>
> **Probabilistic reformulation of Gap 2 (Codex R27) — and its refutation (Pro R23, generalized by Codex R28).** For $y = \exp((\log n)^{1/2})$, let $D_y$ be the random squarefree product with each prime $p \le y$ included with probability $1/p$, and $Z_y \sim e^\gamma \log y$. Then $\sum_{d \in K} 1/\varphi(d) = Z_y \cdot \Pr(D_y \in K)$, so the missing certificate lemma is equivalent to $\sup_P \Pr(D_y \in \mathcal K(P)) = o(1)$ (call this $(\star)$). **$(\star)$ is REFUTED** (Pro R23): Prolonger has a legal sweep-prefix construction with $k \sim \log\log n$ such that $\mathcal K(P) \supseteq \{d \text{ squarefree } y\text{-smooth} : \omega(d) \le k\}$, giving $\Pr(D_y \in \mathcal K(P)) \ge 1 - o(1)$ via Chebyshev. Uses only $n^{o(1)}$ sweep moves.
>
> **R23 generalized (Codex R28).** The attack pattern works for any certificate family with a broad squarefree support layer plus a large incomparable witness layer. **Susceptible (all natural candidates):** smooth-squarefree $C_y$, exact-rank $\omega = k$ or $\Omega = k$, divisor-threshold $\tau \ge K$. **Evade only:** chain-like / primorial / non-multiplicative families — unlikely to be useful sweep certificates. **Intermediate:** $z$-rough families (band-limited measure saturated, not full Buchstab measure). Conclusion: Gap 2's naive form is broadly dead; Gap 1 (defect-budget transversal lemma) remains live. See researcher-23-pro-bernoulli-star-refuted.md, researcher-27-codex-submarkov-1196-adaptation.md, researcher-28-codex-R23-generalization.md.
>
> **Pro A follow-up R29 — resilience lemma is the exact missing step.** Corrected random-cover calculation gives static cover $O(\log h \cdot N_h/H)$ (not $O(N_h/H)$ — heuristic exponent error). Online-vs-static lower principle: Prolonger forces $\ge \tau(H^{(h)})/2$ online scored, so $g(h) = O(1)$ is IMPOSSIBLE from top-facet cleanup unless static scale is already $\Theta(N_h/h^2)$ (ruled out). **$g(h) = O(\log h)$ is the realistic target and suffices for $L(n) \ll n \log\log\log n / \log\log n = o(n)$.** The remaining lemma: $|\operatorname{Cl}_h(R, C)| \le O(\log h \cdot \mathfrak B_h(R, C) + \text{already scored})$ — online resilience upgrade of the static $O(\log h)$ cover. See researcher-29-pro-A-followup-transversal-static-cover-sharpened.md.
>
> **Small-$h$ empirical $g(h)$ supports the resilience conjecture (Codex R29 empirical).** Exact minimax on $H^{(h)}$ for $h \in \{3, 4, 5\}$, $N \le 6$: $T^*/\tau_{\text{exact}} \in [0.5, 0.83]$. Heuristic matrix at $h = 5$, $N \in \{7, 8\}$: $g \approx 0.86$–$1.07$. Empirical $g(h)$ bounded across all tested $h$, consistent with $O(\log h)$ or even $O(1)$ in practice. See [phase4/transversal_small_h_empirical.md](phase4/transversal_small_h_empirical.md) and researcher-29-codex-small-h-empirical-supports-sublinear.md.
>
> **Structural obstructions to Prolonger counter-construction (Codex R31).** The two most natural adversarial classes are structurally blocked: (1) fixed-core strategies reduce to smaller top-facet games $H^{(h-q)}$, no new asymptotic behavior; (2) any two distinct hyperedges in $H^{(h)}$ share at most one top-facet vertex (two shared facets would force the $h$-sets equal), so max-shared-top-facet dependent-set cascades have $O(1)$ local overlap per predecessor, not $\Theta(h)$. Empirically, new adversarial Prolonger strategies never produced more than constant-factor increase over baseline. See researcher-31-codex-prolonger-counter-search.md.
>
> **Plain resilience lemma REFUTED; scale-entropy form also refuted at $O(\log h)$ (Pro R32, R33).** The naive state inequality is FALSE by simplex-star cascade. The scale-entropy corrected form at $O(\log h)$ is also FALSE: multi-cell product-star mass is $\asymp N_h/\log h$, larger than $(\log h/h) N_h$ by factor $h/(\log h)^2 \to \infty$ (Pro R33 calculation with cell partition + thickness dichotomy + explicit construction). **But $L(n) = o(n)$ is still alive at a weaker rate**: Pro R33's thickness dichotomy (thick $\tau(S) \ge 1/L$ charged to scored mass, thin $\tau(S) < 1/L$ bounded by $N_h/\log(hL)$) optimizes at $L \asymp h/\log h$, giving closed multi-cell mass $\ll N_h/\log h$. With $g(h) = O(h/\log h)$: $L(n) \ll n/\log\log\log n$. The new sharp target: **cell-thickness online resilience lemma** $|\operatorname{Cl}_h| \ll L \cdot \text{scored} + N_h/\log(hL)$ with $L \asymp h/\log h$, which would close $L(n) = o(n)$. Remaining online promotion: neighboring-cell replacements, lower-defect certificates, adversarial interleaving, central-rank-window summation. See researcher-32-pro-A-simplex-star-refutation.md and researcher-33-pro-A-thickness-dichotomy.md.
>
> **Empirical Shortener strategy extracted (Codex R32).** Rule $\sigma$: "claim vertex of max unresolved-edge degree; tiebreak on initial degree then lexicographic." Matches 95.6% of exact-minimax Shortener states; empirical $g \approx 1 + O(1/h)$ on tested grids. See researcher-32-codex-sigma-rule-summary.md.
>
> **$\sigma$ survives simplex-star cascade online (Codex R33).** Worst observed ratio $\sigma/\tau_{\text{lower}} = 1.133$ at $(10, 3)$ and $(10, 4)$. On $(6, 3)$, full minimax gives $T^* = 5$ but best play against the cascade only gives $4$ — cascade is NOT Prolonger-optimal. $\sigma$'s max-degree rule automatically acts as a star-breaker (claims pivot-heavy vertices, erasing $\sim N-h+1$ unresolved star edges per move). So Pro R32's state-inequality refutation does NOT translate to a dynamic online refutation in the abstract hypergraph. See researcher-33-codex-sigma-vs-cascade.md.
>
> **Fresh Pro R33 — defect-layer counting lemma (abstract hypergraph).** $|\operatorname{Cl}_h(R, C)| \le (D_{h,k}/\binom{h}{k}) |C_{h-k}|$ for every $k$, via bipartite incidence counting. Rigorously proven, works for all $(R, C)$. Also provides a static barrier example showing any $|\operatorname{Cl}_h| \le f(h) \mathfrak B_h$ bound WITHOUT a scored/history term is impossible. The missing online shadow anti-concentration step: $|C_{h-k} \cap \partial_{h-k} R| \le O(\log h) |U_{h-k}| + O(\binom{h}{k}) \cdot \text{scored}$. Complements Pro A R33's thickness dichotomy. See researcher-33-fresh-pro-defect-layer-counting-lemma.md.
>
> **Codex R34 — composition of R33 ingredients does NOT automatically close; gap isolated to one lemma.** Items (2) lower-defect certificates and (4) central-rank summation from the R33 four-item list are resolved by the counting lemma and Poisson tail respectively. Item (1) neighboring-cell replacements looks like at most a slowly varying loss ($\log\log h$). The real load-bearing gap is item (3) **online shadow anti-concentration**. The specific obstacle: Pro A's thickness dichotomy is a *target-level* bound, fresh Pro's counting lemma reduces $|\operatorname{Cl}_h|$ to *certificate counts* $|C_{h-k}|$, and passing back from certificates to targets costs $D_{h,k}/\binom{h}{k} \asymp H^k/k!$ which is $\asymp h$ at $k=1$, already bigger than the desired scored multiplier $L \asymp h/\log h$ by factor $\log h$. Online set cover literature (Alon et al 2003, Gupta et al 2016) is too weak or wrong-model for this step. See researcher-34-codex-resilience-online-promotion.md.
>
> **R35 closure claim REFUTED at the bridging step; static estimate stands. R36 round narrows the remaining gap further.** Adversarial verification confirmed both R35 candidates break at the same step (bridge from state inequality to game-length bound). Four R36 agent returns converge on the same narrowing:
>
> - **Fresh Pro R36 retracts** the closure claim. States correct refined theorem: static estimate proved; $L(n) = o(n)$ conditional on missing online amortization. Proposes "degree amplification" form: useful shields must have average live degree $\gg h$, so $|F_{\text{useful}}| \ll (1/h) \sum d_t'(u_t) \ll N_h/h$. Cannot close. See researcher-36-fresh-pro-closure-retraction.md.
> - **Pro A R36 isolates a FRESHNESS lemma.** Proves multi-defect $\sigma^\star$ (claim max degree over ALL legal proper divisors, not just top facets) gives $\sum d_t(x_t) \le N_h$. If every useful shield has a fresh legal lower-defect witness of degree $\ge h$ with $O(1)$ assignment multiplicity, amortization closes. In dyadic arithmetic, candidate witnesses exist: for top facet $bA_{S \setminus \{p\}}$ and block $B \ni p$, the lower lateral $c = bA_{S \setminus B}$ has replacement degree $\prod_{q \in B} M_{\mathcal Q(q)}$. Unresolved: FRESHNESS — $c$ may be pre-shielded by an earlier Prolonger score. Backward recursive charging needed. See researcher-36-pro-A-freshness-lemma-partial.md.
> - **Codex R36 empirically refutes naive amortization in abstract $H^{(h)}$.** New `shadow_pressure` Prolonger against $\sigma$: peak useful-top-facet proxy ratios at $(11,4), (10,5), (9,6)$ are $1.50, 3.17, 6.71$ — above the $N_h/h$ scale. So the missing theorem CANNOT use max-degree alone in the abstract model; must exploit weighted or lower-defect structure. Matches Pro A's critique. See researcher-36-codex-r35-online-amortization-followup.md.
> - **Codex R36 followup (star-cylinder probe).** In a minimal "one-cylinder" arithmetic model preserving lower-defect certificates, max-degree $\sigma$ takes singleton/pair/triple certificates and keeps useful closed residual family TINY ($\le 2$ at $h = 3, M = 7$; exactly $0$ at $h = 4, M = 8$ and $h = 5, M = 8$). Arithmetic model may genuinely escape the abstract star-forest counterexample through lower-defect structure. See verify-R35-codex-star-cylinder-lower-defect-probe.md and verify-R35-codex-followup-dynamic-gap.md.
> - **Codex R37 partial refutation — immediate freshness already fails in the one-cylinder arithmetic toy.** With legality corrected to the actual inclusion-antichain rule, the toy still stays dynamically small, but the strongest local version of Pro A's freshness lemma is false: at $(h,M)=(3,7)$ and $(4,8)$ there are useful residual targets whose every useful top-facet shield has **no immediate fresh proper-subset witness of degree $\ge h$**. Explicit example for $(3,7)$: scored stars $(0,1,2),(0,1,4),(0,2,4),(0,1,7),(0,4,7)$, $\sigma^\star$ claims $(3),(5),(6),(2,7)$, final useful residuals $(1,2,4),(1,4,7)$, and for shield $(S,p,T)=((1,2,4),1,(0,2,4))$ every nonempty proper subset of $S$ is already stale (e.g. $\{1\}$ is killed by stars through 1, $\{2\}$ by stars through 2 and the later claim $(2,7)$, $\{2,4\}$ by the scored star $(0,2,4)$). The same failure already occurs at the **first** moment $(1,2,4)$ becomes useful, so it is not a terminal-state artefact. The viable remaining target is the **recursive** bounded-depth stale-chain / backward-charging lemma, not immediate freshness. See researcher-37-codex-freshness-toy-counterexample.md.
>
> **What's confirmed sound.** The static state estimate $\mu(\operatorname{Cl}_h) \ll (h/\log h) \cdot (\text{useful boundary mass}) + N_h/\log h$ appears correct — thick-case charging, thin-case exponential tilting, dyadic window locality all look sound under adversarial scrutiny. This IS a genuine advance.
>
> **What's NOT proved.** The translation $L(n) \ll n \cdot g(h)/h$ requires the CARDINALITY bound $|F_{\text{useful}}| \ll N_h/h$ under $\sigma$. Both R35 candidates assert this or skip past it. Pro A proved the WEIGHTED online domination $\sum_t d_t'(u_t) \le N_h$ but this doesn't give cardinality. The remaining gap is genuinely dynamic, specifically "low-degree top-facet shielding forces high-degree lower-defect exposure so that $\sigma$ claims it before Prolonger accumulates $\omega(N_h/h)$ useful shields."
>
> **Verification also confirms**: the two R35 candidates are not independent closures — they present essentially the same static dyadic/window argument with different framings. Cross-derivation of the static estimate, not cross-derivation of the closure.
>
> See researcher-35-fresh-pro-arithmetic-closure-candidate.md, researcher-35-codex-L-sublinear-proof.md, researcher-35-pro-A-online-domination-partial-with-critique.md, and verify-R35-codex-adversarial-audit.md.
>
> **Pro R35 — static state estimate CLOSED via dyadic expanded windows.** Pro A continued and proved the rigorous state estimate
> $$|\operatorname{Cl}_h(R, C)| \ll L |F| + \frac{N_h}{\log L}$$
> with $L = h/\log h$, where $F$ is the family of Prolonger-scored or -stolen rank-$h$ boundaries. Key technical innovation: use **dyadic expanded windows** $I_j^* = I_{j-1} \cup I_j \cup I_{j+1}$ instead of Pro A R33's short multiplicative cells. The locality is $q/p \in (1/2, 2)$ (forced by $bA_S, bA_T \in (n/2, n]$), so top-facet replacement lives in neighboring dyadic windows. Proof is two-piece: low targets (meeting $\Lambda_L$) pay by fractional charging, $|\operatorname{Cl}_h^{\text{low}}| \le O(L) |F|$; high targets (disjoint from $\Lambda_L$) counted via prime-count identity $H_{>L} \sim H - \log\log L$, $(H_{>L}/H)^h \ll 1/\log L$ in central range.
>
> **What's now closed:** multi-cell product-star entropy, neighboring-cell replacements (via dyadic windows), lower-defect certificates (via R33 counting lemma), central-rank summation (routine Poisson).
>
> **Single remaining gap: dynamic online amortization under $\sigma$.** The state estimate needs $|F_{\text{useful}}| \ll N_h/h$ under max-unresolved-degree Shortener $\sigma$. If this amortization holds: $L(n) \ll n/\log\log\log n$, closes $L(n) = o(n)$. No counterexample seen — simplex-star and multi-cell product-star cascades absorbed by the dyadic-local entropy estimate. The only surviving obstruction is dynamic ordering, not static mass. See researcher-35-pro-A-dyadic-state-estimate-closed.md.
>
> **Four live angles ranked (updated after Codex 2026-04-19 T2 repair, Ford-route correction, and Round 24 closure theorem):**
> 1. Reformulate the dead 2-shadow route around **directed higher-rank closure control** on the safe small-prime set $S_t$.
> 2. Push the certificate-family route (Pro Round-18 matching-sublinear reduction lemma).
> 3. If Ford is used, use the **corrected** version only: either force whole-number roughness plus a divisor band, or prove a separate bandwise reciprocal-mass bound on the closure skeletons. The old "rough complementary factor" reduction is invalid.
> 4. Only then revisit linear lower bounds — they need qualitatively new ideas.
>
> **Newest narrowing (Codex 2026-04-19 late, Round 25 budget audit).** The natural directed rank-3 cleanup is **not** blocked by raw move count. For a fixed-power band `I=(X,X^\lambda]\subseteq[2,y]`, the number of same-band triple blockers
> \[
> T_I(n)=\#\{p<q<r\in I:\ pqr\le n/2\}
> \]
> satisfies `T_I(n)\ll_{\alpha,\lambda} n/\log n`, and summing over the standard fixed-power cover of `[2,y]` gives total blocker budget
> \[
> O_{\alpha,\lambda}\!\left(\frac{n\log\log n}{\log n}\right),
> \]
> safely below T2 scale. So the remaining obstacle is genuinely **online fiber persistence**: once Prolonger preempts one triple `b=pqr` via an upper-half move `bc\ell`, Shortener loses the blocker `b`, and that preempted triple does not itself block later moves on the same `b`-fiber. Standalone writeup: [researcher-25-codex-directed-rank3-budget.md](researcher-25-codex-directed-rank3-budget.md).
>
> **Newest sharpening (Codex 2026-04-19 late, Round 26 race formulation).** The pure "beat Prolonger to the triple blockers `b=pqr`" game is itself unwinnable for Shortener. On a one-band core system with weights
> \[
> \omega_Y(b)=\sum_{c:\ bc\in\mathcal A_Y}\frac1{bc},
> \qquad
> \sum_b\omega_Y(b)\gg 1,
> \]
> Prolonger, moving first and greedily taking the heaviest remaining core each turn, guarantees at least half the total core mass. In particular no fixed ordering such as smallest-first or weight-first can make Shortener "beat Prolonger to each `b`"; Pro simply stays one step ahead and captures the odd-indexed cores. So the right higher-rank theorem is no longer a blocker-ordering theorem but a **post-activation fiber-collapse theorem**: after losing many cores `b`, can Shortener still destroy the corresponding `c`-fibers before Prolonger harvests them? Standalone writeup: [researcher-26-codex-online-rank3-race-formulation.md](researcher-26-codex-online-rank3-race-formulation.md).
>
> **Newest bottleneck (Codex 2026-04-19 late, Round 27 one-fiber cleanup law).** Within a single activated fiber, lateral cleanup is much weaker than the T2 slot-capture heuristic suggests. If `H_b=Y/b` and all small prime laterals are available, then after the optimal `t` lateral attacks on core `b`, the residual reciprocal fiber mass is still of order `1/(b\log t)`. If the activation seed already contains all primes up to `z_0`, then the best `t`-move cleanup only reduces the fiber by a factor of order `\log z_0/\log z_t`, and constant-factor reduction needs `\Omega(z_0/\log z_0)` attacks on that single core. This isolates a new bottleneck sublemma: can Prolonger realize a positive-total-mass family of activated fibers with large built-in prime shields? Scope caveat: this is a **within-core lateral** result; stronger cross-core cleanup via pure low divisors is not yet ruled out. Standalone writeup: [researcher-27-codex-fiber-collapse-partial.md](researcher-27-codex-fiber-collapse-partial.md).
>
> **Empirical (Phase 4):** $L\log n/n$ stable at 1.55-1.70 across $n \in [10^4, 10^7]$. Ford-$\delta \approx 0.086$ fit refuted at $n = 10^7$. Data leans sublinear and closer to $n/\log n$ than $n(\log\log n)^2/\log n$, but cannot distinguish asymptotic rate at accessible $n$ because $\log\log n \le 2.8$.
>
> **Upper-bound chain so far:** $5n/16 \to 0.22002n \to 0.18969n$, all linear. Upper bound loose by factor $\sim \log n$ at practical scales.
>
> **Currently dispatched:** with Codex's 2026-04-19 activation audit, T2 should now be treated as rigorous in the harness (still worthwhile to get fresh cross-family audit / Aristotle when convenient). Primary open effort should shift back to the upper-bound side: multiplicative-closure control, certificate-family residual width, and especially a **directed higher-rank closure theorem** after the new band-local closure explosion result.
>
> For technical detail see `prompts/canonical-prompt.md` (Established theorems + Ruled Out with specific failure mechanisms).

## Problem

Two-player combinatorial game on the integers $\{2, 3, \ldots, n\}$:

- Players (Prolonger and Shortener) alternate choosing integers into a shared set $A$.
- Move legality: $A$ must remain an antichain under divisibility (no element of $A$ divides another).
- The game ends when $A$ is a maximal antichain — no legal move remains.
- Prolonger moves first and maximizes the total number of moves; Shortener minimizes.
- $L(n)$ denotes the total number of moves under optimal play.

**Central open question:** does $L(n)$ grow linearly in $n$? I.e., is there $\varepsilon > 0$ with $L(n) \ge \varepsilon n$ for all sufficiently large $n$?

### Notation

Split $\{2, \ldots, n\}$ into
- $L = \{2, \ldots, \lfloor n/2 \rfloor\}$ (lower half)
- $U = (n/2, n] \cap \mathbb{Z}$ (upper half — the canonical maximum antichain, $|U| = \lfloor n/2 \rfloor$)

For $x \in L$, define the upper shadow and shadow weight:
- $M(x) = \{u \in U : x \mid u\}$
- $w_n(x) = |M(x)| - 1 = \lfloor n/x \rfloor - \lfloor n/(2x) \rfloor - 1$

## What's Established

### Shield Reduction Theorem (rigorous — Lean/Aristotle verified 2026-04-17)

Fix $P \subseteq U$ (Prolonger's played shields). Define
- $L(P) = \{x \in L : x \nmid u$ for every $u \in P\}$
- $\beta(P) = \max\left\{ \sum_{x \in B} w_n(x) \ :\ B \subseteq L(P)\ \text{antichain} \right\}$

Then every eventual maximal position $A$ satisfies
$$|A| \ge |U| - \beta(P).$$

**Proof (three lines).** $B := A \cap L$ is an antichain in $L(P)$. By maximality, $A \cap U = U \setminus \bigcup_{x \in B} M(x)$. Union bound gives $|A| \ge |U| - \sum_{x \in B} w_n(x) \ge |U| - \beta(P)$.

**Formal verification.** Aristotle job `a403f83c-ba7d-4122-81c3-59bd6b267819` produced a Lean 4 formalization compiling under Mathlib with zero `sorry` and only standard axioms (`propext`, `Classical.choice`, `Quot.sound`). Output at `aristotle/shield_reduction_out/`.

**Consequence.** To prove $L(n) \ge (1/2 - c)n$ it suffices to find an adaptive rule for Prolonger's first $k$ shield moves such that $\beta(P_k) \le cn$ for some $c < 1/2$, uniformly in $n$.

### Polynomial shield lower bound — "Theorem A" (rigorous, pending Aristotle)

For fixed $0 < \alpha < 1$ and every $P \subseteq U$ with $|P| \le n^\alpha$:
$$\beta(P) \ge \left(\frac{1}{2} \log \frac{1}{\alpha} + o(1)\right) n.$$

Equivalently, defining $k_c^\star(n) = \min\{|P| : \beta(P) \le cn\}$:
$$\liminf_{n \to \infty} \frac{\log k_c^\star(n)}{\log n} \ge e^{-2c}.$$

**Proof sketch.** Fix $\alpha < \delta < 1$. Small primes $Q_\delta(P) = \{p \le n^\delta : p$ prime, $p \nmid u\ \forall u \in P\}$ form an antichain in $L(P)$ with $w_n(p) = n/(2p) + O(1)$. Covered primes $C_\delta(P)$ satisfy $\sum_{p \in C_\delta} \log p \le |P| \log n \le n^\alpha \log n$ (via an exchange-style assignment of each covered prime to a dividing $u \in P$). Among prime sets with given log-budget, $\sum 1/p$ is maximized by taking the smallest first (fractional knapsack). Two Mertens applications give $\sum_{p \in Q_\delta(P)} 1/p \ge \log(\delta/\alpha) + o(1)$. Taking $\delta \uparrow 1$.

Status: **audited by Claude, Gemini, and GPT-thinking — all three agree the proof is sound**; **formally verified modulo classical NT prerequisites** via Aristotle job `c53ccd8d-708a-4f00-8997-6da709121665` (completed 2026-04-17 late night). The entire novel combinatorial content of the theorem — greedy-exchange argument, prime-antichain construction, log-budget bound — is sorry-free in Lean 4 with standard axioms only. 5 remaining sorrys are all Mathlib coverage limits (Mertens' second theorem, Chebyshev's $\pi(x) \le 3x/\log x$, PNT in Chebyshev form) plus the two assembly lines that invoke those classical NT foundations. Per the promotion rule in `CLAUDE.md`, none of the 5 sorrys is a logical gap. Full audit record in `verify-aristotle-01-theorem-A.md`; artifact at `aristotle/theorem_A_result.tar.gz` / `aristotle/theorem_A_out/`. Minor writeup fixes flagged by GPT-thinking (explicit `$\delta > \alpha$` quantifier, "corollary" not "equivalently") incorporated in `aristotle/theorem_A_shield_lower_bound.tex`.

**Consequences (corrected 2026-04-17 after Claude-thinking audit).**

The Shield Reduction bound $|A| \ge |U| - \beta(P)$ is *vacuous* (non-positive) whenever $\beta(P) \ge |U| = n/2$. Since $\beta(\emptyset) \sim (n/2)\log\log n$ grows without bound in $n$, Prolonger needs enough shields to push $\beta$ below $n/2$ before the reduction says *anything* useful. By Theorem A:

| $L(n) \ge$ target | Requires $\beta(P) \le$ | Hence $|P| \ge n^\alpha$ with $\alpha \ge$ |
|---|---|---|
| $\varepsilon n$ for some $\varepsilon > 0$ (any linear bound) | $(1/2 - \varepsilon)n$ | $e^{-1 + 2\varepsilon} \to 1/e \approx 0.368$ |
| $0.3 n$ | $0.2 n$ | $e^{-0.4} \approx 0.670$ |
| $0.416 n$ (match forum record) | $0.084 n$ | $e^{-0.168} \approx 0.845$ |
| $0.4578 n$ (match 923/2016) | $0.0422 n$ | $e^{-0.0844} \approx 0.919$ |

So "just" getting any linear lower bound via this method needs polynomial shields at exponent $1/e$; matching the Shortener upper bound needs nearly all of $U$.

**Potential strengthening flagged by GPT-thinking.** The same proof with budget $k \log n$ instead of $n^\alpha \log n$ yields
$$\beta(P) \gtrsim \frac{n}{2}\bigl(\log\log n - \log\log(k\log n)\bigr)$$
throughout the subpolynomial regime. Nearly subsumes the weaker "Theorem B" form (below). Not yet written up rigorously.

### Theorem B — subsumed by Theorem A

For $|P| = k$:
$$\beta(P) \ge \frac{n}{2}(\log\log n - k \log\log\log n) - O((k+1)n),$$
giving $k = \Omega(\log\log n / \log\log\log n)$. Same proof idea as A but with per-$u$ double-counting in the exchange step, which loses the global log-budget structure. **Strictly dominated by Theorem A.** Kept here for provenance but not tracked as an independent claim.

### The 5/24 first-hit cover (rigorous — Lean/Aristotle verified 2026-04-17)

Let
$$H_n = \{u \in U : u \equiv 2 \pmod{4}\} \cup \{u \in U : u > 2n/3,\ u \equiv 0 \pmod{4}\}.$$

Then $|H_n| = \frac{5}{24}n + O(1)$ and every $x \in L$ has a multiple in $H_n$ (case analysis on strips $x \in (n/(j+1), n/j]$, for $n \ge 12$).

A matching dual packing
$$P_n = \big((n/3, n/2] \cap \mathbb{Z}\big) \cup \{x \in (n/4, n/3] \cap \mathbb{Z} : x\ \text{odd}\}$$

has $|P_n| = \frac{5}{24}n + O(1)$ and every $u \in U$ is divisible by at most one element of $P_n$.

Hence $\tau(n) = \frac{5}{24}n + O(1)$ where $\tau(n)$ is the min unweighted upper cover of $L$.

**Formal verification.** Aristotle job `4a17294d-cd68-4a54-97cc-25500c01cac7` produced a 4-file Lean 4 project (Defs/Cover/Packing/Tau) under Mathlib with zero `sorry` and only standard axioms. Cover property and packing property (including the key `u/x ∈ {2, 3}` lemma) are both formally verified. Output at `aristotle/tau_5_24_out/`.

**Caveat on verified content.** Lean proves the *structural* identities — $H_n$ covers $L$, $P_n$ packs — giving $\tau(n) = |H_n|$ and $\tau(n) \ge |P_n|$ exactly. The *cardinality* identity $|H_n| = |P_n| = 5n/24 + O(1)$ is a separate finite floor-sum calculation not included in the Aristotle output; the $5/24$ number follows from a trivial count but is not itself machine-checked here.

### All-prime $v_p$-parity sieve has density $\to 0$

The density of integers with $v_p(\cdot)$ even for every prime $p \le y$ is
$$\prod_{p \le y} \frac{p}{p+1} \sim \frac{\pi^2 e^{-\gamma}}{6 \log y} \to 0.$$

Static sieve programs using all small primes cannot achieve positive density.

### Universal Prolonger counter on carrier mass (Round 9b)

For every Shortener strategy $\sigma$, Prolonger has a response against $\sigma$ such that
$$\sum_{p \in B(P)} \frac{1}{p} \ge \frac{1}{2}\log\log n + O(1).$$

Construction: block-product Prolonger (partition primes $\le n^{1/3}$ into disjoint sets $S_i$, play $x_i = \prod_{p \in S_i} p \in (\sqrt n, n^{5/6}]$ greedy-descending by $\sum 1/p$). Pairwise coprimality and $x_i x_j > n$ force 1-for-1 Shortener snipes; Prolonger secures $\ge$ half the total harmonic mass. Full proof in `verify-postresp-10-audit-universal-block-product.md`. Empirically corroborated at coefficient ~0.875 across 4 decades (Codex dynamical probe).

### Conditional: bounded carrier implies sublinear

If a Shortener $\sigma$ admitted $\sum_{p \in B(P)} 1/p \le C$ against every response, then every Prolonger element would be $B(P)$-smooth, and Brun-style sieve gives $|P| \le e^{C+O(1)} n/\log n$, hence $L \le O(n/\log n)$. Rigorous implication; hypothesis is empty by the universal counter above.

### $85/1008$ sieve (rigorous static claim)

For $I_8(n) = (n/8, n/3] \cap (2\mathbb{Z}+1)$, the set
$$B_8(n) = \{b \in I_8(n) : v_5(b) \equiv 0 \pmod 2\ \text{and}\ (3 \mid b \Rightarrow b > n/7)\}$$

is ratio-independent with respect to $\mathcal{R}_8 = \{5/3, 7/5, 7/3\}$ and has density $85/1008 \approx 0.0843$.

### Upper bound on $L(n)$

**Latest bound (Round 8, 2026-04-18 — Aristotle-verified modulo Chebyshev):** $L(n) \le (5/16 + o(1))\, n = 0.3125\, n$, via an explicit odd-prime-prefix Shortener strategy with a *longer* prefix than Round 7 and a sharper Bonferroni error analysis. Full proof in `researcher-08-5-16-improvement.md`. Supersedes the Round 7 $13n/36$ bound.

**Formal verification.** Aristotle job `4c1f85cd-54f5-42ec-b797-529d5b9ac6ee` (COMPLETE_WITH_ERRORS) produced a 2-file Lean 4 project (`Defs / Theorems`) under `aristotle/shortener_5_16_out/` with **15 theorems fully proved, zero sorry** covering: algebraic optimization $g(A) = (1/2)(1 - 1/A + 1/(2A^2))$ with $g(2) = 5/16$; odd-part compression injection; harmonic sum lower bound from Chebyshev hypothesis; second-order Bonferroni sieve; structural antichain bound; game-value induction when $D \subseteq A$; final $\varepsilon$-limit assembly by continuity of $g$.

**One remaining sorry** in `game_value_per_parameter`, requiring (a) Chebyshev's theorem $\vartheta(x) \ge cx$ — not in Mathlib in the needed form — and (b) a routine game-tree induction showing Shortener always has a legal odd prime during her first $k$ turns (log-mass argument). Classified per CLAUDE.md promotion rule as **Mathlib-coverage limit**, not a logical gap: same pattern as Theorem A's Aristotle result. Details in `verify-aristotle-03-5-16.md`.

**Promotion path.** Strong-Established. Either (i) re-submit with explicit $D = \{3, 5\}$ substitution (would likely clear zero sorry by bypassing Chebyshev, same trick the $13/36$ Aristotle used), or (ii) wait for Mathlib's Chebyshev. Held pending Round 11 outcome.

**What changed (Round 8 insight).** The Round 7 proof used prefix length $k = \sqrt n / \log n$ because it treated the second-order Bonferroni pairwise-intersection error as $O(t^2)$. But the *actual* error is only from prime pairs with product $q_i q_j \le n$, and that count is $o(n)$ regardless of $t$:
$$R_2(n) = \#\{(i, j) : i < j,\ q_i q_j \le n\} \le \sum_{p \le \sqrt n} \pi(n/p) \ll \frac{n}{\log n}\sum_{p \le \sqrt n} \frac{1}{p} = o(n).$$

This unlocks a much longer prefix $k = n/(2A \log n)$ for any $A > 2$. The Chebyshev induction then gives $q_j \le A j \log n$ (tighter than $3/2 \cdot j \log n$ — prior Shortener primes $q_i$ now also contribute log-mass $\approx \log n$ each, not just $\log j$). So $\sum 1/q_j \ge 1/A + o(1)$, and letting $A \downarrow 2$ gives $\sum 1/q_j \ge 1/2 - o(1)$.

The same truncation + second-order Bonferroni + monotonicity of $f(s) = 1 - s + s^2/2$ on $[0, 1]$ then gives $N_D \le (n/2) \cdot f(1/2) + o(n) = (n/2)(5/8) = 5n/16 + o(n)$.

**Cross-validation note.** Open-exploration Audit #1 (pre-Round 8) explicitly flagged that "if one could push $s$ to $1/2$, the same style of argument would improve to $5n/16 = 0.3125n$" — Pro then did exactly that via the longer-prefix + sharper-error argument. Independent pre-validation.

**Pro's closing observation (validated direction forward).** The block-product counter caps $\sum 1/q_j \le 1/2 + o(1)$, so **$5/16$ is the tight limit of the odd-prime-prefix Shortener family**. Any further improvement requires a different Shortener strategy, or an argument using the structure of Prolonger's composite moves (not just the divisor set $D$). This directly motivates the Carrier Capacity Bound direction (open Audit #2).

### $L(n) \le 13n/36 + o(n)$ — Aristotle-verified (2026-04-18 late night)

**Formal verification complete.** Aristotle job `4abf7b27-fc08-4611-9411-90e78ddfb136` produced a 4-file Lean 4 project (`Defs / Compression / Sieve / MainTheorem`) under Mathlib with **zero sorry** and only standard axioms (`propext`, `Classical.choice`, `Quot.sound`). Output at `aristotle/shortener_13_36_v2_out/`. Paper at `aristotle/shortener_13_36_v2.tex`.

The entire combinatorial content is sorry-free:
- `oddPart_injOn_antichain`: odd-part map injective on divisibility antichains.
- `second_order_bonferroni`: Bonferroni inequality for finsets.
- `sieveFun_le_of_ge_third`: $f(s) = 1 - s + s^2/2 \le 13/18$ for $s \in [1/3, 1]$.
- `countOddDFree_bonferroni_real`: $N_E(n) \le (n/2) f(s_t) + (|E|+1)^2$.
- `countOddDFree_le_thirteen_thirtysixths`: $N_D(n) \le 13n/36 + O(|D|^2)$.
- `main_upper_bound`: for every $\varepsilon > 0$ and all sufficiently large $n$, there exists $D$ of odd primes such that every $D$-free antichain $A$ satisfies $|A| \le (13/36 + \varepsilon) n$.

**Nuance on the Chebyshev step.** Mathlib does not currently have Chebyshev's theorem $\vartheta(x) \sim x$ in the form needed for the paper's induction $q_j \le Aj\log n$. Aristotle sidestepped this by substituting the explicit $D = \{3\}$ (one prime, $\sum 1/q = 1/3 \ge 1/3$), which suffices to trigger the Bonferroni-valid regime and deliver the $13/36$ coefficient via the same sieve argument. Strategically: Shortener plays $3$ first; Prolonger's post-move antichain is $3$-free; the sieve + compression argument then gives $|A_{\text{rest}}| \le 13n/36 + O(1)$. The $13/36$ coefficient is preserved; the strategy is *simpler* than the paper's prefix-of-$\sqrt n/\log n$-primes, but the coefficient is the same. Stronger-hypothesis version of the paper's theorem.

**Status relative to $5/16$.** The $5/16$ bound uses a longer prefix with $\sum 1/q_j \ge 1/2$, not achievable by $D = \{3\}$ alone (would need at least $D = \{3, 5\}$ giving $\sum = 8/15 > 1/2$, or genuine Chebyshev). Aristotle job `4c1f85cd-...` on the $5/16$ paper is still running at 23% as of this update. Whether it substitutes $D = \{3, 5\}$ or formalizes Chebyshev directly is the open question for that job.

**Prior informal audit** (Round 7, 3/3 SOUND): `verify-postresp-07-audit{1,2,3}.md`. Matches the formal verification.

### The odd-prime-prefix proof structure (for reference)

The paper's full strategy: Shortener plays the smallest legal odd prime for the first $k = \lfloor \sqrt n / \log n \rfloor$ turns, then plays arbitrarily. Let $D = \{q_1, \ldots, q_k\}$ be the primes played and $S = \sum_j 1/q_j$.

**Proof structure (four steps):**

1. **Chebyshev induction.** $q_j \le (\tfrac{3}{2} + \varepsilon) j \log n$, hence $S \ge \tfrac{1}{3} - \eta_n$ for some $\eta_n \to 0$.
2. **Compression.** The odd-part map $\phi(x) = x/2^{v_2(x)}$ is injective on the post-prefix antichain $A'$, giving $|A'| \le N_D(n) := \#\{\text{odd }m \le n : q \nmid m\ \forall q \in D\}$.
3. **Truncation.** Take the minimal $t$ with $s_t := \sum_{j \le t} 1/q_j \ge \tfrac{1}{3} - \eta_n$. Since every $q_j$ is odd ($q_j \ge 3$), $1/q_j \le 1/3$, so by minimality $s_t \in [\tfrac{1}{3} - \eta_n, \tfrac{2}{3}]$. Let $E = \{q_1, \ldots, q_t\}$.
4. **Sieve on $E$ and monotonicity.** Second-order Bonferroni on the smaller set $E$ gives $N_E(n) \le (n/2)(1 - s_t + s_t^2/2) + o(n)$. Since $s_t \le 2/3 \le 1$ and $f(s) := 1 - s + s^2/2$ has $f'(s) = s - 1 \le 0$ on $[0, 1]$, $f$ is monotonically decreasing there. So $f(s_t) \le f(\tfrac{1}{3} - \eta_n) = 13/18 + o(1)$. Finally $N_D(n) \le N_E(n) \le (13/36) n + o(n)$.

The Round 8 proof strictly dominates it (same strategy, longer prefix, sharper error), so $13/36$ is now a weaker consequence. The truncation technique is reused in the $5/16$ proof.

**Strategy.** Shortener plays the smallest legal odd prime for the first $k = \lfloor \sqrt n / \log n \rfloor$ turns, then plays arbitrarily. Let $D = \{q_1, \ldots, q_k\}$ be the primes played and $S = \sum_j 1/q_j$.

**Proof structure (four steps):**

1. **Chebyshev induction.** $q_j \le (\tfrac{3}{2} + \varepsilon) j \log n$, hence $S \ge \tfrac{1}{3} - \eta_n$ for some $\eta_n \to 0$.
2. **Compression.** The odd-part map $\phi(x) = x/2^{v_2(x)}$ is injective on the post-prefix antichain $A'$, giving $|A'| \le N_D(n) := \#\{\text{odd }m \le n : q \nmid m\ \forall q \in D\}$.
3. **Truncation (the fix).** Take the minimal $t$ with $s_t := \sum_{j \le t} 1/q_j \ge \tfrac{1}{3} - \eta_n$. Since every $q_j$ is odd ($q_j \ge 3$), $1/q_j \le 1/3$, so by minimality $s_t \in [\tfrac{1}{3} - \eta_n, \tfrac{2}{3}]$. Let $E = \{q_1, \ldots, q_t\}$.
4. **Sieve on $E$ and monotonicity.** Second-order Bonferroni on the smaller set $E$ gives $N_E(n) \le (n/2)(1 - s_t + s_t^2/2) + o(n)$. Since $s_t \le 2/3 \le 1$ and $f(s) := 1 - s + s^2/2$ has $f'(s) = s - 1 \le 0$ on $[0, 1]$, $f$ is monotonically decreasing there. So $f(s_t) \le f(\tfrac{1}{3} - \eta_n) = 13/18 + o(1)$. Finally $N_D(n) \le N_E(n) \le (13/36) n + o(n)$ (since $E \subseteq D$, so sifting by $E$ leaves more survivors).

The truncation step is the elegant move: the nonmonotonicity of $f$ on $[0, \infty)$ only obstructs using the *full* reciprocal mass of $D$. Truncating to the first subfamily whose mass just reaches $1/3 - o(1)$ keeps us inside the monotone regime $[0, 2/3]$ automatically. The "odd" in "smallest legal odd prime" is load-bearing: it forces $1/q_j \le 1/3$, so partial sums can't overshoot $[1/3, 2/3]$ in a single step.

**Prior attempt (refuted and superseded).** The original Round 6 proof in `researcher-05-shortener-13-36.md` attempted to bound $f(S)$ directly using only $S \ge 1/3$, which fails because $f$ is non-monotone on $[0, \infty)$ (vertex at $S = 1$, symmetric around it). Three-way informal audit (2/3 verifiers caught the issue — Gemini + Claude; ChatGPT missed it; see `verify-postresp-06-13-36-{gemini, claude, chatgpt}.md`). The truncation fix avoids the issue entirely.

**Prior records dominated by $5/16$:**

- **Forum-listed prior record:** $L(n) \le (419/1008 + o(1))n \approx 0.416\, n$. Dominated by $5/16 = 0.3125 < 0.416$.
- **Private research derivation:** $L(n) \le (923/2016 + o(1))n \approx 0.4578\, n$ via Maker-Breaker "secure half" applied to the $85/1008$ savings pool. Dominated by $5/16 < 0.458$.

Once Aristotle v3 (job `4c1f85cd-...`) clears, $5/16$ becomes both the record and formally verified.

### Lower bound on $L(n)$ (rigorous)

$L(n) \ge (1 + o(1)) n / \log n$.

**Proof** (Desmond Weisenberg, forum). Every prime $p \in [\sqrt{n}, n]$ has at least one multiple in any maximal primitive subset $A \subseteq \{2, \ldots, n\}$, and no two such primes share a multiple (since $p_1 p_2 > n$ when $p_1, p_2 \ge \sqrt{n}$). So $|A| \ge \pi(n) - \pi(\sqrt{n}) = (1 + o(1)) n/\log n$.

**Note on an earlier mis-citation.** Primes strictly in $(n/2, n]$ give only $\pi(n) - \pi(n/2) \sim n/(2 \log n)$. The $n/\log n$ baseline uses primes in $[\sqrt{n}, n]$ via the multiple-uniqueness argument above, not just the upper-half primes. Earlier versions of this document and several research prompts conflated the two; Audit #1 (Apr 2026) caught it.

## What's Been Ruled Out

- **Static lower-half reservoirs as Prolonger strategies.** Any static $R \subseteq L$ of positive density has $|R \cap d\mathbb{Z}| \asymp |R|/d$ for many small $d$, so Shortener plays the smallest legal prime and deletes $\Theta(|R|/d)$ reservoir elements per move. Static $R$ is a Shortener weapon, not a Prolonger tool.
- **Infinite-prime $v_p$-parity sieves.** Density $\to 0$ by Mertens-type loss.
- **All subpolynomial shield-prefix strategies.** By Theorem A, any $|P| = n^{o(1)}$ (including constant $k$, $\log k$, $\log\log n$, $n^{1/(\log\log n)}$, etc.) gives $\beta(P)/n \to \infty$. The shield-prefix approach requires $|P| \ge n^{1/e - o(1)}$ even to have a chance of forcing $\beta(P) < n/2$, and $|P| \ge n^{e^{-2c} - o(1)}$ to force $\beta(P) \le cn$.
- **$L(n)/n \to 0$ as a conclusion from Theorem B.** Explicitly rejected by all three informal verifiers: these theorems obstruct one *proof technique* (short shield prefix via Mertens), not the game value. Shortener-side upper bounds still constrain $L(n) \le 0.416n$ or $0.458n$ (contested). No evidence that $L(n) = o(n)$.
- **Carrier Capacity Bound (static, universal-over-antichains).** Pro + Gemini DeepThink independently refuted Lemma 1: "for every Prolonger sequence of size $\varepsilon n$, $\sum_{p \in B(P)} 1/p \le C$" is false. The top $\varepsilon n$ consecutive integers in $U = (n/2, n]$ form a legal game-achievable Prolonger sequence with $\sum 1/p \ge \log\log(\varepsilon n) \to \infty$. Any proof of $L(n) = O(n/\log n)$ that bounds Prolonger's prime-reciprocal coverage universally fails. Audit #2 (strategic round)'s super-carrier exhaustion direction is dead in the static form. Finite-prime vaccination does not rescue it.

- **Dynamical bounded-reciprocal-mass Shortener.** By the universal block-product counter (Round 9b, Established), no $\sigma$ forces $\sum_{p \in B(P)} 1/p = O(1)$. Both the static and dynamical "bounded carrier" routes to $O(n/\log n)$ are closed.

- **Dynamic realization of the static \(S_y\) certificate at \(O(n/\log n)\) cost.** Round 15's static theorem says that if Shortener could install
  $$
  S_y=\{p\le y\} \cup \{z<p\le n/2\} \cup \{ab\le n/2:\ a,b>y\},\qquad y=n^\alpha,\ 1/3<\alpha<1/2,\ z=\lfloor n/(2y)\rfloor,
  $$
  or equivalently reach any state after which every future legal move has no prime factor \(\le y\), then only \(O_\alpha(n/\log n)\) moves would remain (upper primes + medium semiprimes). This program is now impossible in the hoped-for form: combined with the current rigorous lower bound
  $$
  L(n)\ge c_\delta\,\frac{n(\log\log n)^2}{\log n},
  $$
  it follows that the game cannot enter the \(S_y\)-residual regime after only \(O(n/\log n)\) moves. More generally, the time needed to eliminate the small-prime layer \(\{p\le y\}\) is itself \(\Omega\!\bigl(n(\log\log n)^2/\log n\bigr)\) (up to the \(O_\alpha(n/\log n)\) terminal tail). So the unresolved small-prime block in Round 15 is not bookkeeping; it carries the full second-order obstruction.

- **Strict semiprime exposure $\Xi(B) = O(1/\log n)$** (Pro's original Round 10 target). The universal counter places Prolonger's primes in $[\log n, n^{1/3}]$ so $\log(n/p) \asymp \log n$, giving $\Xi(B) \ge (c/\log n) \sum 1/p = \Omega(\log\log n/\log n)$. Gemini 3.1 Pro algebra correction (`verify-postresp-10-gemini-omega.md`) + Codex empirical confirmation. The *softened* target $\Xi(B) = O(\log\log n/\log n)$ survives and is nearly trivial via Mertens.

## Numerical / Computational Evidence

### Phase 2.5 dynamical carrier probe (2026-04-18)

Codex simulation at $n \in \{10^3, 10^4, 10^5, 10^6\}$, six Shortener strategies × four Prolonger strategies. Full sim in `phase2/dynamical_probe/`.

**Worst-case $\sum 1/p$ scaling is universally $\Theta(\log\log n)$** (matching the Round 9b structural theorem):

| Shortener | Worst Prolonger | $\sum 1/p / \log\log n$ at $n = 10^3, 10^4, 10^5, 10^6$ |
|---|---|---|
| `S_slp_odd` | `P_block_product` | 0.887, 0.880, 0.875, 0.875 |
| `S_adaptive_prime` | `P_block_product` | 0.887, 0.880, 0.875, 0.875 |
| `S_pair_response` | `P_block_product` | 0.887, 0.880, 0.875, 0.875 |
| `S_primorial_anchor` | `P_block_product` | 1.070, 1.070, 1.064, 1.060 |
| `S_harmonic` | `P_block_product` | 1.049, 1.068, 1.072, 1.074 |
| `S_carrier_snipe` | `P_interval_top` | 1.094, 1.086, 1.081, 1.078 |

Three-way tie at coefficient ~0.875, dead stable across 4 decades. No decay — block-product saturates within a factor of 2 of the universal lower bound $1/2$.

**Realized game length trajectory** (best-tier Shortener vs. block-product Prolonger):

| $n$ | $L$ | $L \log n / n$ |
|---|---|---|
| $10^3$ | 187 | 1.29 |
| $10^4$ | 1361 | 1.25 |
| $10^5$ | 10576 | 1.22 |
| $10^6$ | 85003 | 1.17 |

$L \log n / n$ **monotonically decreasing across 4 decades** — consistent with $L = O(n/\log n)$ and possibly sub-$n/\log n$ growth. Strongest direct empirical signal for $L = o(n)$.

**Prime-mass concentration** at $n = 10^6$ against best tier: primes $\le 100$ contribute 73.4% of $\sum 1/p$; primes $\le 1000$ contribute 85.0%. Largest prime in $B(P)$: 999983.

**Pair-response secondary finding.** Beats other Shorteners against softer Prolongers: against `P_interval_top`, $\sum 1/p / \log\log n$ drops from 0.336 to 0.274 across $n = 10^3$ to $10^6$; against `P_random`, 0.414 → 0.295. Block-product is the binding adversary; non-block Prolongers can be suppressed substantially.

Pearson correlation of $L \log n / n$ vs. $\sum 1/p$ across all runs: 0.778. Longer games go with larger reciprocal mass.

### Exact minimax (Prolonger moves first), $n \le 50$

- $L(n)/n \in [0.371, 0.458]$, average $\approx 0.40$
- Optimal first move: $6$ for $n \in [10, 27]$, then $18$ for $n \in [28, 32]$ (divisor-rich)
- $H_n$-restricted weighted shield-greedy matches unrestricted weighted greedy through $n = 50$

### Weighted dual LP

$\min \sum_u y_u$ subject to $\sum_{u : x \mid u} y_u \ge w_n(x)$, $y_u \ge 0$:

| $n$     | OPT/$n$ |
|---------|---------|
| 100     | 0.2775  |
| 200     | 0.2858  |
| 500     | 0.320   |
| 50,000  | ≈ 0.396 |

The optimizer $y^*$ is concentrated on highly composite / divisor-rich numbers. About 80% of total dual mass lies on $H_n$.

### $\beta(P)$ exact via max-flow on weighted divisibility poset

**One shield** $b_1(n) = \min_{u \in U} \beta(\{u\})$:

| $n$     | 100  | 200  | 300    | 400    | 500    |
|---------|------|------|--------|--------|--------|
| $b_1/n$ | 0.31 | 0.35 | 0.4033 | 0.4200 | 0.4480 |

Greedy first shield only: $\approx 0.499n$ at $n = 800$, $\approx 0.52n$ at $n = 1000$.

**Two shields** $c_2^H(n)$ ($H_n$-greedy first two Prolonger moves vs. exact minimax Shortener replies):

| $n$        | 100  | 200   | 300  | 400   | 500   | 800     |
|------------|------|-------|------|-------|-------|---------|
| $c_2^H/n$  | 0.24 | 0.295 | 0.35 | 0.375 | 0.394 | 0.44375 |

## Candidate Prolonger Strategy (not proved linear)

**$H_n$-restricted weighted shield-greedy.** At each Prolonger turn, play
$$u_t = \arg\max_{u \in H_n \cap S_t} \deg_t(u), \qquad \deg_t(u) = \sum_{\substack{x \in D_t \\ x \mid u}} r_t(x)$$

falling back to $\arg\max$ over all of $S_t$ only if $H_n \cap S_t = \emptyset$. Here $S_t, D_t$ are the surviving legal upper / lower vertices at time $t$, and $r_t(x) = |S_t \cap M(x)| - 1$.

**Threat potential.** $T_t = Q_t + R_t$ where $Q_t$ = cashed-out lower savings, $R_t = \sum_{x \in D_t} r_t(x)$. Shortener never increases $T$; a Prolonger shield $u$ decreases $T$ by $\deg_t(u)$.

**Averaging identity.**
$$\frac{1}{|S_t|} \sum_{u \in S_t} \deg_t(u) = \frac{1}{|S_t|} \sum_{x \in D_t} r_t(x)(r_t(x) + 1).$$

**Static capacity profile.** $\#\{x \in L : w_n(x) \ge j\} \asymp n / (2j)$.

## Phase 0 Results — offline extremal function $\psi(\alpha)$ (2026-04-17, Codex/MacBook)

Codex computed empirical upper bounds on $\psi_n(\alpha) = \min_{|P| \le n^\alpha} \beta(P)/n$ via exact max-flow β-solves inside smart greedy searches, across $n \in \{5000, 10000, 20000, 50000\}$ × $\alpha \in \{0.30, 0.35, \ldots, 0.70\}$. Full grid, structural characterization, and sniping audit in `phase0/`.

### Finding 1 — Theorem A appears asymptotically tight

Heuristic upper bound on $\psi_n(\alpha)$ relative to Mertens lower bound $(1/2)\log(1/\alpha)$:

| $\alpha$ | $n=5000$ gap | $n=10000$ | $n=20000$ | $n=50000$ |
|---|---|---|---|---|
| 0.30 | −0.131 | −0.076 | −0.029 | +0.045 |
| 0.40 | −0.094 | −0.045 | −0.004 | +0.060 |
| 0.50 | −0.079 | −0.042 | −0.004 | +0.046 |
| 0.60 | −0.099 | −0.061 | −0.024 | +0.022 |

Monotone shrinking gap as $n \to \infty$; sign flip between $n = 20000$ and $n = 50000$ attributable to the finite-$n$ $o(1)$ correction in Mertens flipping from negative to positive. Consistent with $\psi(\alpha) = (1/2)\log(1/\alpha)$ asymptotically. **Offline feasibility of the shield program is confirmed.**

### Finding 2 — Near-optimal offline $P$ are catastrophically sniping-brittle

Structural characterization of Codex's near-optimal $P$ across all 36 cells:
- **≥85% inside $H_n$** in 32 of 36 cells
- **Mean ω ≈ 4** (average of ~4 distinct prime factors per $u \in P$)
- **Near-exclusively even**, heavily 6-divisible
- **Prime dependency width**: 13 (at $\alpha = 0.30$) to 732 (at $\alpha = 0.70$) distinct primes — but mostly concentrated via small primes

Sniping audit (fraction of $P$ killed if Shortener plays $k^*$ optimal primes):

| $k^*$ | Fraction of cells killed 100% |
|---|---|
| 1 (prime = 2) | 28/36 (the remaining 8 cells lose 93–99% to prime 2) |
| 5 | 36/36 |

**Prime 2 alone kills ≥93% of the offline-optimal $P$ in every cell.** This means a Shortener who plays `2` on their first move destroys almost all of Prolonger's shield structure regardless of which offline-optimal $P$ Prolonger had targeted.

### What this closes and what remains open

**Closed:** the shield-prefix Prolonger program is *online-unviable* as currently formulated. The offline-optimal structures found by smart greedy (across three strategies: H_n-biased, diverse, squarefree) are all ≥93% killed by a single Shortener prime play.

**Still open:**
1. **Robust offline feasibility.** Define $\psi_{\text{robust}}(\alpha) = \min\{\beta(P)/n : |P| \le n^\alpha,\ P\ \text{has bounded concentration on any single prime}\}$. If robust-feasible $P$ with $\beta/n < 1/2$ exists at reasonable $\alpha$, the shield program might still be rescued via a different offline template.
2. **Non-shield Prolonger strategies.** Can Prolonger win linearly without the shield-prefix paradigm — e.g., by interleaving $U$- and $L$-plays, or by using a randomized/adaptive rule that doesn't rely on a static target structure?
3. **Direct Shortener construction forcing $L(n) = o(n)$.** Formally open. Currently being explored in a separate Pro thread (t9). Codex's brittleness data would strongly support such a construction if one is found.

## Round 3 results (2026-04-17 evening)

### Pro output: candidate Shortener strategy $S^\star$ + negative proposition

Sent Direction-3 Shortener-construction prompt to t9. Pro returned:

**$S^\star$ prime cascade:** on each Shortener turn, play smallest legal prime $p \le n/2$; fallback to max-deletion over remaining legal moves.

**Negative proposition (claimed by Pro, downgraded by audit).** Any proof that $S^\star$ forces $o(n)$ cannot rely *only* on the crude blocked-prime log-budget $\sum_{p \in B} \log p \le |P| \log n$ — $B$ could be any initial prime segment up to $y \asymp |P| \log n$. Audit #1 downgraded this from "Proposition" to "methodological warning": true as a barrier heuristic, not a rigorous impossibility theorem.

**Pro's empirical claim (refuted in part):** $L(n) \log n / n \approx 1.5$ stable across $n \in \{500, \ldots, 20000\}$, therefore $L(n) = \Theta(n / \log n)$ likely.

### Audit outcomes

**Audit #1 (ChatGPT-thinking or equivalent):** thorough adversarial, caught multiple substantive issues:
- **$\pi(n)$ baseline error** we were carrying (fixed above).
- **$1.5$ constant not robust.** Independent reproduction gave constants from $1.3$ (log-weighted prime-blocker) to $2.0+$ (shield-heavy), depending on Prolonger tie-breaking.
- **"Within 1 move of optimal everywhere" is false** — Audit #1 reproduced exact minimax and found the gap between $S^\star$ and optimal is **2 moves** at $n = 33, 34$.
- **Structural find:** Prolonger's exact-optimal first move against $S^\star$ is **30** (the primorial $p_3^\# = 2 \cdot 3 \cdot 5$) for $n \in [35, 55]$, and transitions to **210** ($p_4^\#$) at larger $n$. Strong hint that a primorial-anchor Prolonger template is structurally the right response.
- **Assessment over-update:** Pro jumped from "uncertain" to "probably $\Theta(n/\log n)$" on one narrow-range heuristic. Evidence supports "interesting heuristic evidence," not the asymptotic verdict.

**Audit #2 (Claude, re-run complete 2026-04-17 late).** Cross-compared Round 3 ($S^\star$) and Round 4 (Vaccinated Shield Reduction) responses together. Findings:

- **Math of Vaccinated Shield Reduction + obstruction is correct.** Union bound, Mertens manipulation, log-mass-to-harmonic optimization all verified independently.
- **"Forces many small-$d$ plays" framing is weakened.** Sylvester–Fibonacci primes $\{2, 3, 7, 43, 1807, \ldots\}$ give $\sigma_k = 1 - 1/(a_1 \cdots a_k)$ — within $10^{-6}$ of $1$ at $k = 5$. So $\sigma \to 1$ is achievable with **5 fixed elements**, not "many." The obstruction's qualitative rhetoric oversells the difficulty; the quantitative conclusion $\sigma(D_n) = 1 - o(1)$ is necessary but not "hard to achieve."
- **Proof-strategy vs game-strategy distinction.** The obstruction rules out a *proof technique*, not a *game-play strategy*. Prolonger playing subpolynomial medium lowers could still force linear $L$ — we just can't prove it via shield reduction. Important nuance Pro's interpretation glossed over.
- **$P_{\text{harm}}$ confirmation.** Independently constructed a harmonic-weighted prime-blocker ($u_t$ maximizes $\sum_{p \mid u,\ p\ \text{legal}} 1/p$). Beats $P_{\text{pb}}$ by 14-21%, stable constant $\approx 1.87$ vs $S^\star$. Matches Audit #1's "harmonic-weighted" numbers. **Two independent reconstructions converge on $P_{\text{harm}}$ as a stronger Prolonger than $P_{\text{pb}}$** — worth coding into Phase 1's stress harness.
- **Central quantity cross-check.** Both the Shortener-side $P_{\text{harm}}$ result and the Prolonger-side Vaccinated Shield obstruction hinge on $\sum 1/p$ and $\sum 1/d$ — harmonic mass. Not coincidence: Mertens density is the combinatorially correct weighting on both sides. Independent converging evidence that harmonic-weight is the right structural quantity.
- **Net update.** "Sublinearity is slightly more plausible, but evidence is still weak." Pro's epistemic shift holds direction but not confidence.

### Phase 1 Codex stress-test results

Full $\{S^\star, S_{\text{shadow}}, S_{\text{primorial}}\} \times$ 8 Prolonger strategies grid at $n \in \{1000, 5000, 20000, 50000\}$, plus $n = 100{,}000$ for the strongest pair. Exact minimax extended to $n = 48$.

**Headline finding:**
- **$n/\log n$ scaling survived**: across all 24+ tested strategy pairs, $L \log n / n$ stayed bounded; no pair produced linear growth.
- **Constant is strategy-dependent:** observed range $[1.162, 2.295]$. The "$1.5$" was $P_{\text{pb}}$-specific. Universal constant hypothesis refuted.
- **Strongest Prolonger:** $P_{\text{anti-}S^\star}$ (1-step lookahead) achieves $L \log n / n = 2.28$ at $n = 100{,}000$. That's the current tightest-known bound on $c$ in "$L(n) \le c \cdot n/\log n$," and it's $1.5\times$ higher than Pro claimed.

### Phase 2 Codex Shortener stress-test (2026-04-18)

Grid: 5 Shortener × 4 Prolonger × 4 $n$-values. Raw at `phase2/shortener_stress.csv`, summary at `phase2/shortener_stress_summary.md`.

**Worst-case $L \log n / n$ at $n = 10^5$, across the four tested Prolongers:**
- `S_adaptive_prime` (play smallest legal prime dividing Prolonger's last move; else smallest legal odd prime): **2.000** (best).
- `S_carrier_snipe`: 2.025.
- `S_star` (the $13/36$ baseline): 2.112.
- `S_topdown` (largest legal odd prime first): 2.975.
- `S_harm` (harmonic-mass maximizer): 4.550 (worst — refutes the prior strategic-audit suggestion that harmonic-weighted Shortener would be strong).

**Against `P_block_product` specifically at $n = 10^5$:** `S_adaptive_prime` gives 1.378, `S_carrier_snipe` 1.383, `S_star` 1.962.

**Key caveat on the $13/36$ bound's tightness.** The $13n/36$ proof bound implies worst-case $L \log n / n \approx 4.15$ at $n = 10^5$, but the empirical `S_star` vs `P_block_product` game length is ~$0.17n$ — less than half of the proved $0.36n$. Gap is because the proof's $N_D$ sieve surrogate over-counts: after the prefix, Shortener can play low composites like $2$ (excluded from the prefix to keep $1/q_j \le 1/3$), which collapses the remaining game far faster than odd-only sifting predicts. Consistent with the hypothesis that the true asymptotic is $O(n/\log n)$ and the $13n/36$ bound is loose by a constant factor plus an $o(n)$ gap.

**No Shortener shows monotone $L \log n / n$ decay** across all four Prolongers at $n \le 10^5$ — consistent with the prediction that the asymptotic separation (normal $\omega(x) \sim \log\log n$ vs. the $\log n / \log\log n$ blocking efficiency Prolonger needs) doesn't kick in until larger $n$.

**Exact minimax frontier** (Prolonger-first-move transitions — *value-only; first-move list below is provisional*):
- $n \in [2, 8]$: play $2$
- $n \in [9, 26]$: play $6 = p_2^\#$
- $n \in [27, 34]$: play $12$ *(provisional — see caveat)*
- $n \in [35, 48]$: play $30 = p_3^\#$ *(provisional — see caveat)*

The transition $12 \to 30$ at $n = 35$ was cited as validation of Audit #1's primorial-anchor finding, but the underlying Phase 1 implementation stored only one heuristic winner from a pruned search, so the set of optimal openers at each $n$ is not trustworthy without recomputation. Value-wise the corrected table (below) still shows $L(40) = 16$ with principal-variation first move $30$, consistent with a primorial-anchor opener at that specific $n$; the broader transition pattern needs to be re-derived before load-bearing citations.

### ✅ $L(40)$ discrepancy resolved — Phase 1 exact solver had an alpha-beta bug (2026-04-17 evening, Codex)

Fresh independent solver `phase1/exact_minimax_v2.py` (built from scratch, unit-tested against brute-force for $n \le 12$, cross-checked with no-pruning DP and a corrected-window legal-mask search) gives $L(40) = 16$, matching Pro and Audit #1.

**Root cause.** The old Phase 1 `compute_sublinear.exact_minimax` evaluated each move as `1 + solve(child, next_turn, alpha, beta)` without shifting the alpha-beta window. Since the child returns the remaining-move count after the current move has already contributed $+1$, the child window should be `(alpha - 1, beta - 1)`. Without the shift the search can prune a child too early, producing systematic *over*-estimates.

**Scope of the bug.** Old Phase 1 table agrees with the fresh solver for $n \in [2, 26] \cup [28, 38]$. Disagreements (all old value too high by $1$ or $2$):

| $n$ | old | corrected | $\Delta$ |
|---:|---:|---:|---:|
| 27 | 12 | 11 | −1 |
| 39, 40 | 17 | 16 | −1 |
| 41, 42 | 18 | 17 | −1 |
| 43, 44 | 19 | 18 | −1 |
| 45, 46 | 20 | 18 | −2 |
| 47, 48 | 21 | 19 | −2 |

**Principal variations at $n = 40$.**
- Old (buggy, $L = 17$): `30, 7, 8, 11, 26, 17, 12, 19, 18, 20, 23, 25, 27, 29, 31, 37, 39`.
- Corrected ($L = 16$): `30, 7, 36, 11, 40, 13, 24, 17, 32, 19, 27, 25, 23, 29, 31, 37`.

**Artifacts.** `phase1/exact_minimax_v2.py`, `phase1/test_exact_minimax_v2.py`, `phase1/L40_diagnostic.md`, `phase1/logs/l40_diagnostic.log`. Old `exact_minimax.csv` and `compute_sublinear.py` not modified — preserved for audit.

**Implications.**
- All exact-play claims in $n \in [27, 48]$ should be re-derived from the corrected solver before further citation.
- The $P_{\text{pb}}$-vs-$S^\star$ "within 1 move of optimal" audit comparison used the corrected exact values (both Pro and Audit #1 had $L(40) = 16$), so that analysis is unaffected.
- Phase 1's *heuristic-vs-heuristic* large-$n$ stress-test (the $[1.16, 2.28]$ constant range) does not depend on the exact-minimax solver and is unaffected.
- The primorial-anchor *first-move* claim at $n \in [35, 48]$ remains consistent with the corrected $L(40)$ principal variation starting at $30$, but the full first-move frontier needs re-derivation on the corrected solver.

## Round 5 results (2026-04-17 late night)

### Pro: $\sigma(D) \to 1$ is compatible with zero upper-half cost

Pro constructed an explicit family of primitive lower prefixes $D_n \subseteq [2, n/2]$ with:

- $|D_n| = n^{o(1)}$,
- $\sigma(D_n) = 1 + o(1)$,
- $|U_{D_n}| = (1 - o(1)) |U|$.

**Construction.** Fix $k \ge 1$. For a pairwise coprime set $Q$, let $D_k(Q) = \{\prod_{i \in S} q_i : S \subseteq [m], |S| = k\}$ — all $k$-fold products. Each element has exactly $k$ atoms, so $D_k(Q)$ is primitive. Choose $Q = Q_k(y) := \{p \text{ prime} : y < p \le y^{B_k}\}$ with $B_k = e^{\lambda_k}$, $\lambda_k = (k!)^{1/k}$.

**Key calculations:**
- $\sigma(D_k(Q)) = e_k(\{1/q_i\})$ (elementary symmetric sum), and $e_k(\{1/p\}_{p \in Q_k(y)}) = \lambda(y)^k / k! + o(1) \to \lambda_k^k / k! = 1$ by Mertens' sum $\lambda(y) \to \lambda_k$.
- Free density $\rho(D_k(Q)) = \Pr(\text{Poisson-Binomial} \le k - 1) \to r_k := \Pr(\text{Poisson}(\lambda_k) \le k - 1)$ via Le Cam's theorem (total variation $\le \eta(y) = \sum 1/p^2 \to 0$).
- Since $\lambda_k \sim k/e$, threshold $k$ is $e \times$ the mean, so Chernoff gives $1 - r_k \le e^{-ck}$ and $r_k \to 1$.

**Concatenation to index by $n$:** choose $y_k$ so $|\sigma(D^{(k)}(y_k)) - 1| \le 2^{-k}$, $\rho \ge 1 - 2^{-k}$; pick $N_k$ growing fast enough; for $N_k \le n < N_{k+1}$, set $D_n := D^{(k)}(y_k)$. Periodicity gives $|U_{D_n}|/|U| \to 1$, $\sigma(D_n) \to 1$, $|D_n| = n^{o(1)}$.

**Numerical witnesses** (finite, not asymptotic):

| family | $\sigma(D)$ | $\rho(D)$ | $\|U_D\|/\|U\|$ empirical |
|---|---:|---:|---|
| $k = 2$, first 11 primes | $1.0026777$ | $0.5093886$ | $0.50922$ at $n = 10^5$, $0.50994$ at $n = 2 \cdot 10^5$ |
| $k = 3$, first 69 primes | $1.0022551$ | $0.6733051$ | $0.67021$ at $n = 8 \cdot 10^7$, $0.67131$ at $n = 3.2 \cdot 10^8$ |
| $k = 4$, first 1057 primes | $1.0000379$ | $0.7818094$ | — |

**Status (post three-way audit 2026-04-17 late night):** central existential claim very likely true; proof as written has a bug in the error schedule (fixable); interpretive framing oversells. Not yet Aristotle-verified. Full audit synthesis below. Verbatim in `researcher-04-sigma-one-construction.md`; audits in `verify-postresp-04-{gemini, claude, gpt-thinking}.md`.

### Audit synthesis

Three informal verifiers, three substantive catches — textbook example of why the harness runs three in parallel.

**GPT-thinking caught an outright bug in the concatenation.** Pro chose the error schedule
$$\rho(D^{(k)}(y_k)) \ge 1 - 2^{-k}.$$
This is *impossible*, because $\rho(D^{(k)}(y)) \to r_k := \Pr(\mathrm{Poisson}(\lambda_k) \le k - 1)$ as $y \to \infty$, and $1 - r_k \asymp e^{-k/e} \gg 2^{-k}$. Numerically $r_4 \approx 0.8167 < 0.9375 = 1 - 2^{-4}$. Construction breaks as written. **Easy repair:** replace with $\rho(D^{(k)}(y_k)) \ge 1 - \varepsilon_k$ for any $\varepsilon_k \downarrow 0$ slower than $e^{-k/e}$ (e.g. $\varepsilon_k = 1/k$), then set $N_k \ge M_k / \varepsilon_k$ instead of $2^k M_k$. Rest of the argument carries through.

**Claude caught a cost-shifting framing.** The result is correctly stated but the top-line framing "the upper-half cost is not the bottleneck" invites the reading that *a bottleneck has been removed*. Substantively, no bottleneck has been removed. When $\sigma(D) \to 1$, the Round 4 subpolynomial-prefix obstruction becomes vacuous (coefficient $(1 - \sigma)/2$ approaches or goes below zero) — but the **fixed-prefix sharpening** immediately reimposes $\beta_{D^{(k)}}(P) \ge (\log(1/\alpha) + o(1)) |U_{D^{(k)}}| \approx (\log(1/\alpha)) \cdot n/2$, i.e., the same normalized $e^{-1}$ barrier. The aggregate obstruction budget against any subpolynomial-$|P|$ shield proof is effectively unchanged. A truer framing: *the necessary condition $\sigma(D_n) \to 1$ from Round 4 is achievable with $|U_{D_n}|/|U| \to 1$, but the fixed-prefix sharpening immediately reimposes the same quantitative obstruction, so nothing has been gained in the Vaccinated Shield ledger.*

**Gemini flagged the Frankenstein / online-strategy disconnect.** The $D_n$ is a piecewise-constant concatenation of fixed finite templates $D^{(k)}(y_k)$ across doubly-exponential block boundaries $N_k$. Mathematically valid as a proof of existence; *completely detached* from any feasible online Prolonger strategy. Solves the structural question, does not advance the actual game.

**Sharper-conjecture formalization — converged from two independent verifiers.** Pro's closing "residual harmonic mass of legal primes after the lower prefix" is hand-wavy as written. Both Claude and GPT independently gave formal candidates:

- **Claude's version:** $\tilde\sigma(D, n, \delta) := \sum_{p \le n^\delta,\ p \nmid \mathrm{lcm}(D)} 1/p$. Conjectural strengthening: any subpolynomial-$|P|$ shield proof of linearity requires $\tilde\sigma(D_n, n, \delta) = O(1)$ for some $\delta > 0$. Claude computed $\tilde\sigma$ for Pro's $D^{(k)}(y_k)$ construction: $\tilde\sigma = \log\log n - \lambda_k + O(1)$, which diverges — consistent with the fixed-prefix sharpening still biting.
- **GPT's version:** $H_D(T; n) := \sum_{p \le T} \tfrac{1}{p} \cdot \tfrac{|U_D \cap p\mathbb{Z}|}{|U \cap p\mathbb{Z}|}$. Harmonic mass weighted by fraction of upper-half multiples that survive vaccination. Argues this is the right refinement because shield arguments care about surviving multiplicities, not just whether any multiple survives.

Both are well-defined, capture the right phenomenon ($\sigma$ coarse → $\tilde\sigma$ / $H_D$ refined), and converge with the harmonic-weight ground-truth story that's been running through the whole program.

**Numerical reproduction.** All three verifiers independently reproduced the three $(\sigma, \rho)$ pairs — 7 decimals — and the finite-$n$ $|U_D|/|U|$ ratios — 5 decimals. Numerics are airtight.

**Secondary observation (Claude):** the three concrete finite tables ($k=2, m=11$; $k=3, m=69$; $k=4, m=1057$) use the *first $m$ primes*, which is a structurally different family from the asymptotic construction's prime-interval $(y_k, y_k^{B_k}]$. Both achieve $\sigma \approx 1$ but they are not instances of each other. Pro's response treats them interchangeably, which is fine as "readable witnesses" but could mislead.

### Current status of the Round 5 theorem

Per the promotion rule (`CLAUDE.md`: "Split (1 flags, 2 sound) → re-read the flagger's argument carefully. If the concern is substantive, treat as broken pending re-derivation"):

- GPT-thinking's bug is **substantive and correct** — the specific schedule $2^{-k}$ is provably unachievable.
- Therefore the proof as written is **broken pending re-derivation**.
- The central existential claim is **very likely true after repair** (all three verifiers agree on this); waiting for Pro to either send a repaired proof or explicitly confirm the replacement schedule.
- Even after repair, **the theorem is narrower than Pro's framing suggests**: it shows $\sigma(D) \to 1$ is compatible with $|U_D|/|U| \to 1$, but does not reduce the aggregate obstruction budget in the Vaccinated Shield ledger.

### What this changes in the overall picture

1. **One narrow sub-question is resolved** (pending repair): yes, $\sigma \to 1$ is compatible with zero upper-half cost.
2. **No bottleneck has been removed.** The fixed-prefix sharpening still imposes the $e^{-1}$ barrier on any subpolynomial-$|P|$ shield proof of linearity, now at $\rho \cdot n/2 \approx n/2$ instead of at $n/2$. Aggregate budget unchanged.
3. **The right next invariant is not $\sigma(D)$** — all three audits + Pro converge on this, and Claude/GPT both gave concrete formalizations ($\tilde\sigma$ or $H_D$). This is a real structural refinement.
4. **Shield reduction's prospects for proving $L(n) \ge \varepsilon n$ remain essentially unchanged** after Round 5.

**Proof prerequisites touched.** Mertens' second theorem on a prime interval, Le Cam's inequality, Chernoff for Poisson, Stirling's approximation, elementary symmetric polynomials. All classical and independently checkable; Mertens is the same NT prerequisite that currently sorrys Theorem A in the Aristotle output.

## Strategic audit (2026-04-18) — program pivot

After five rounds centered on the Shield Reduction framework (Theorem A, Vaccinated Shield, Round 5 $\sigma \to 1$ construction), a direct question was sent to four informal verifiers with the current state: *are we actually advancing $L(n)$, or just refining obstruction theorems about proof techniques?* (Full prompt: `prompts/verify-strategic-01-directions.md`. Verbatim audits: `verify-strategic-01-{deepthink, audit2, gpt-thinking, audit4}.md`.)

### Unanimous convergence (4/4 audits)

1. **Yes, the drift read is correct — with one productive reframe from Audit #4.** The program has been proving meta-theorems about obstructions to proof techniques, not advancing either bound on $L(n)$. The public frontier $(1 + o(1))\, n/\log n \le L(n) \le 0.416\, n$ has not moved. Deep Think called this "Obstruction Drift": "Lean-verifying the topology of a ghost." GPT-thinking: "strategic progress, not front-line progress." Audit #2: "proving the impossibility of simple proofs." Audit #4 added a sharper lens: *the same $\log(1/\alpha)$ constant recurring across Theorem A, Vaccinated Shield fixed-prefix sharpening, and Round 5's cost-shifting is not three framework failures — it's the framework correctly computing its own ceiling.* Theorem A and the Vaccinated Shield theorem are genuine contributions that redirect future effort; the Round 5 + sharper-invariants work is the specific misallocation — an attempt to escape a ceiling three earlier proofs had already characterized. Also per Audit #4: the obstructions bound *what shield-style arguments can prove*, not $L(n)$ itself. "Shield-only can't prove linearity" is not the same as "$L(n)$ is sublinear." The sublinearity hypothesis is supported by obstructions + Phase 1 data + offline $\psi_n(\alpha)$ convergence jointly, not by obstructions alone.

2. **The Packing Lemma is the #1 direction for actually advancing the question.** All three audits rank it first for moving bounds on $L(n)$. It is the only item in the current research program that attacks the gap between offline shield optimization and online play directly. GPT-thinking's specific reformulation: not another $\beta(P)$-style theorem, but a **realizability / online set-cover theorem on the bipartite divisor incidence graph $H_n$ between $L$ and $U$**, of the form *"any size-$t$ family of upper elements $P \subseteq U$ can neutralize only $X(t, n)$ effective prime-blocking budget,"* where effective = tuned to the actual Shortener strategy, not to offline shield score. If $X(t, n) \lesssim t \log\log n$, this yields $L(n) = O(n/\log n)$.

3. **Shift from Prolonger side to Shortener side.** All three audits recommend pivoting toward proving $L(n) = O(n/\log n)$ via a Shortener potential-function strategy. Concrete candidate potentials suggested:
   - Deep Think: $P_{\text{harm}}$ repurposed as Shortener's monotone potential $\Phi$; prove Shortener forces $\Phi \to 0$ in $O(n/\log n)$ steps.
   - Audit #2: monotone invariant $W(A) = \sum_a f(a)$ with $f(a) \in \{1/\Omega(a),\ \rho(\log a / \log n)\}$ — notably $f(a) = 1/a$ is blocked because antichain reciprocal sums are bounded by Erdős's theorem.
   - Audit #2: **pairing strategy** — if the divisor graph $G_n$ contains a large matching on $L$, Shortener plays each Prolonger move's matched partner; game ends in $O(\text{matching size})$ steps.

4. **Round 5 / Vaccinated refinements are dead directions.** All three explicitly rank these as "discard" or "abandon" — pure meta-refinement that moves the barrier without reducing it.

5. **Shield Reduction is dead as an architecture for proving the linear lower bound.** Deep Think: "the offline-optima-sniping-brittle finding is the smoking gun that Shield Reduction is dead." Audit #2: "the static approach is likely fundamentally misaligned with the game's dynamic nature." The rigorous obstructions (Theorem A, Vaccinated Shield) remain valid — they just rule out the proof route, they don't help advance the question.

### Convergent literature pointers (2+/4 audits)

- **Ford 2008** — "The distribution of integers with a divisor in a given interval," *Annals of Mathematics*. Flagged by Audit #4 as "the single biggest literature gap"; the correct level of generality for the packing lemma's question. Dickman–de Bruijn and Buchstab are one-parameter specializations. Explicit top-of-list recommendation.
- **Lichtman (c. 2022–2023)** — proof of Erdős's primitive set conjecture $\sum_{a \in A} 1/(a \log a) \le \sum_p 1/(p \log p)$ for primitive $A$. Uses Dickman–de Bruijn rough/smooth decomposition and local-to-global sieve on primitive sets. The weight $1/(a \log a)$ is precisely what $P_{\text{harm}}$ implicitly optimizes. Flagged by Deep Think, GPT-thinking, and Audit #4 (3/4) as high-payoff literature. arXiv search: "Lichtman primitive set Erdős proof." arXiv:2202.02384 is the leading candidate per GPT-thinking's citation.
- **Hefetz–Krivelevich–Stojaković–Szabó — *Positional Games* (Oberwolfach Seminars 2014)** — the Maker–Breaker handbook. Directly relevant for Beck-style pairing strategies and potential-function methods on game hypergraphs. Flagged by Audit #4.
- **McNew — divisor graph combinatorics.** Path-cover number $C(n) \sim cn$; telescoping/local-component structure of divisor graphs. Flagged by GPT-thinking as the closest existing static geometry.
- **Melotti–Saias (2018)** — path partitions of the divisor graph. Longest paths $\asymp N/\log N$; minimal path partitions can contain $N^{1 - o(1)}$-length paths. arXiv:1807.07783.
- **Saturation-game methodology** (Füredi–Reimer–Seress, Patkós, Biró–Horn–Wildstrom) — not for direct transfer, but to see what successful game-specific upper bounds look like: forcing rigid local substructure + carefully chosen potentials, not static extremal counting. Flagged by GPT-thinking and Audit #4.
- **Erdős–Sárközy–Szemerédi on primitive sets (1960s)** — classical extremal-density results; directly relevant background. Flagged by Audit #4.
- **Buchstab function** — when Shortener plays primes, survivors are $y$-rough; Buchstab governs their density. Flagged by Deep Think, implicit in GPT-thinking.

### High-value single-source contributions (worth flagging as candidate directions)

- **Realize the $\log(1/\alpha)$ ceiling as an explicit Shortener strategy** (Audit #4 only — flagged as "the most underweighted direction in the current program"): every shield-style lower bound hits the $\log(1/\alpha)$ ceiling; empirically $\psi_n(\alpha) \to (1/2)\log(1/\alpha)$. These are dual facts — the obstruction is telling us a Shortener strategy exists that realizes the ceiling. The program has proved the ceiling exists from the lower side three times; it has not once tried to realize it from the upper side. Constructing such a strategy explicitly would plausibly beat $0.416n$ materially and, jointly with the packing lemma, likely settle the asymptotic.
- **Ford 2008 anatomy-of-integers as packing-lemma machinery** (Audit #4 only — flagged as "the single biggest literature gap in the program"): Kevin Ford, "The distribution of integers with a divisor in a given interval," *Annals of Mathematics* (2008). Ford's theorem is the correct general sieve-theoretic technology for the question "given a set $P$ of upper-half integers, how constrained is its prime-divisor structure?" — which is exactly the packing lemma's question. Dickman–de Bruijn and Buchstab are one-parameter specializations. The program has consulted those once but not deeply; Ford itself is the right level of generality.
- **Zero-sum LP duality upper bound** (Audit #4 only): the offline $\psi_n(\alpha)$ maps are one-sided LP values. The corresponding zero-sum LP (Prolonger distributes over antichains, Shortener distributes over kills) has a value that upper-bounds $L(n)/n$. Not yet computed.
- **Packing lemma ≡ potential-function argument in different clothes** (Audit #4 intuition): the packing lemma and an amortized potential argument may be the same proof written two ways. Writing both out could reveal the common structure.
- **Self-similarity / renormalization** (Audit #2 + GPT-thinking + Audit #4 all rank 2nd or 3rd): the primorial-anchor optimal first-move structure at small $n$ may encode a recursive game structure $L(n) \approx L(n/p) + \ldots$. Three audits independently flagged this.
- **ω(x) / Hardy-Ramanujan bandwidth limit** (Deep Think only): Prolonger's per-move prime-blocking bandwidth is bounded by $\omega(x) \sim \log\log n$. Highly composite numbers are rare; bandwidth collapses after exhausting them.
- **Avoider-Enforcer on hypergraph of maximal antichains** (Audit #2 only): Beck-Chen self-correction phenomenon in positional games.
- **Explicit "separate prime blocking from integer blocking"** (GPT-thinking only): an upper element $u$ is not a bag of primes — its divisor set has overlap geometry. The sharper question is "how much new *cover* can $P$ create in the witness family Shortener exploits?" not "how many primes can $P$ touch?"

### Explicitly deprioritized by Audit #4

- Container method: "wrong combinatorial shape — antichains don't form hypergraph-independent sets cleanly enough."
- Probabilistic random primitive subsets: "the game is adversarial, randomization won't be tight."
- General combinatorial game theory on posets: "mostly Nim-value / Sprague-Grundy flavor, doesn't address $L(n)$ asymptotics."

### What the pivot looks like concretely

GPT-thinking's 3-task plan (the most concrete proposal across the three audits):

1. **Define the weighted witness family** Shortener is really trying to hit — probably not all of $L$, but stratified by least prime factor or prime intervals.
2. **Prove a realizability bound**: any $t$ actual upper elements can neutralize only so much of that witness family.
3. **Wrap in a Shortener strategy** (likely smallest-legal-prime or weighted-prime variant) and show surviving witness mass falls to zero after $O(n/\log n)$ moves.

### Explicit deprioritizations

- Linear-lower-bound work: **deprioritized**. The program's own rigorous results now argue against many of those routes, and the heuristic evidence is not pulling that way.
- More shield obstructions / more offline $\psi_n(\alpha)$ maps: **low priority** unless they mutate into packing lemma contributions.
- $P_{\text{harm}}$ as a *Prolonger* strategy: **low priority** per Deep Think ("hand the weight to Shortener as a Breaker potential instead"). Retested: it's a Shortener potential candidate, not a Prolonger heuristic worth optimizing.

### Pivot status

4/4 audits have landed. The convergence is unambiguous. Program pivots to:

**Primary target (4/4 top pick):** prove $L(n) = O(n/\log n)$ via **the packing lemma, reframed as a Ford-style divisor-interval realizability theorem on the bipartite divisor incidence graph**. The specific form (GPT-thinking + Audit #4): any size-$t$ family of upper elements $P \subseteq U$ can realize only $X(t, n) \lesssim t \log\log n$ effective prime-blocking budget, where "effective" is tuned to the actual Shortener strategy. Attack via Kevin Ford's anatomy-of-integers machinery.

**Secondary target (Audit #4's second pick, strongest unique new angle):** realize the $\log(1/\alpha)$ ceiling as an **explicit Shortener strategy**. The obstruction theorems + empirical $\psi_n(\alpha)$ convergence are dual facts saying such a strategy exists; nobody has tried to construct it.

**Tertiary target (3/4 audits):** formalize the primorial-anchor recursion from the exact-play PV data as a framework for generating the conjectural leading constant.

**Explicit deprioritizations:**
- Round 5 concatenation schedule repair: very low priority. Fixing the $2^{-k}$ bug doesn't change the aggregate obstruction budget.
- Sharper invariants ($\tilde\sigma$, $H_D$): do not pursue. Fifth iteration in obstruction-space.
- More shield obstructions / $\psi_n(\alpha)$ maps: do not pursue. The $\log(1/\alpha)$ ceiling is understood; stop extending the framework.
- Linear-lower-bound work: deprioritized (own rigorous results argue against those routes, heuristic evidence doesn't pull that way).
- Container method, random primitive subsets, general combinatorial poset games: ruled out as wrong combinatorial shape.

Ready to draft the next researcher prompt around the packing lemma + Ford framing.

## Round 6 results (2026-04-18) — program hits front-line progress

Following the strategic audit pivot, two researcher prompts were sent in parallel (single cross-validated direction each, no output format, under the revised CLAUDE.md discipline):

### Prompt 6A (packing lemma via Ford): carrier-recycling obstruction

Prompt: `prompts/researcher-05-packing-lemma.md`. Output: `researcher-05-carrier-recycling.md`.

Pro did **not** produce the packing lemma. Instead, Pro produced another obstruction theorem: against the "smallest legal prime" Shortener strategy (SLP), Prolonger has an explicit response (carrier recycling) that forces Shortener to capture at most one prime per block of $m+1$, for any fixed $m$, up to scale $n^{1/(m+1)}$. Consequence:
$$\sum_{p \in S_n} \frac{1}{p} \le \frac{1}{m+1} \log\log n + O_m(1) \quad \text{for all fixed } m,$$
where $S_n$ is Shortener's claimed prime set. So **no proof that routes through "Shortener plays primes systematically + Mertens sieve" can reach $O(n/\log n)$** — at best $n/(\log n)^{1/(m+1)}$.

**Construction.** If Shortener has just played prime $a \le c_m n^{1/(m+1)}$ with $c_m = 2^{-m/2 - 2/(m+1)}$, Prolonger plays
$$u = q \cdot r_1 \cdots r_m,$$
where $r_1 < \cdots < r_m$ are the next $m$ primes after $a$ (Bertrand: $r_i < 2^i a$, so $R := \prod r_i < 2^{m(m+1)/2} a^m \le n/(4a)$) and $q$ is a prime in $(n/(2R), n/R]$ (Bertrand again). Then $u \in U$, $u$ is legal, and its divisors include $r_1, \ldots, r_m$ — so Prolonger kills $m$ primes in one move.

**Status:** this is another obstruction theorem, not the packing lemma we asked for. The "drift" critique partially applies. But Pro's closing insight is real: the right target is **not** "how many fresh primes can $P$ contain" but "how often can Prolonger recycle carriers to lift fresh small-prime blocks into $U$?" The Ford framework is still the right tool — but for the carrier-side, not the fresh-prime side. **Pending audit + Aristotle.** Numerical spot-check: Pro's prime-harmonic mass simulations at $n = 10^4, 10^5, 10^6$ give captured $\approx 1.39, 1.41, 1.44$ vs. total $\approx 2.40, 2.64, 2.84$, consistent with fractional capture.

### Prompt 6B (explicit Shortener strategy): **new upper bound $L(n) \le 13n/36 + o(n)$**

Prompt: `prompts/researcher-05-shortener-ceiling.md`. Output: `researcher-05-shortener-13-36.md`.

Pro produced a concrete Shortener strategy with a rigorous new asymptotic upper bound:
$$L(n) \le \frac{13}{36}\, n + o(n) \approx 0.3612\, n.$$

**Strategy.** For the first $k = \lfloor \sqrt n / \log n \rfloor$ Shortener turns, play the smallest legal odd prime. Call those primes $D = \{q_1 < \cdots < q_k\}$. Afterwards, play arbitrarily.

**Proof, three steps:**

1. *Chosen primes stay small.* By induction + Chebyshev: if all odd primes up to $(3/2 + \varepsilon) j \log n$ were blocked before Shortener's $j$-th move, the blocked log-mass $\le j \log n + \sum_{i<j} \log q_i \le (3/2 + o(1)) j \log n$ — but $\vartheta_{\text{odd}}((3/2+\varepsilon) j \log n) = (3/2 + \varepsilon + o(1)) j \log n$, contradicting. So $q_j \le (3/2 + \varepsilon) j \log n$, hence $S := \sum_j 1/q_j \ge \log k / ((3/2 + \varepsilon) \log n) + o(1) = 1/3 - o(1)$.

2. *Compression into odd $D$-free integers.* For $x$ in post-prefix antichain $A'$, write $x = 2^a 3^b m$. Then $\phi(x) := 3^b m = x / 2^a$ (odd part of $x$) is odd, $D$-free, and $\le n$. If $\phi(x) = \phi(y)$, then $x, y$ differ only by a power of $2$, so one divides the other — antichain forces $x = y$. So $\phi$ is injective on $A'$, giving $|A'| \le N_D(n) :=$ # odd $D$-free integers $\le n$.

3. *Sieve bound.* By second-order Bonferroni on the odd multiples of $q_i$:
$$N_D(n) \le \frac{n}{2}\Bigl(1 - S + \frac{S^2}{2}\Bigr) + o(n) \le \frac{n}{2} \cdot \frac{13}{18} + o(n) = \frac{13 n}{36} + o(n).$$

Total: $L(n) \le 2k + |A'| = 13n/36 + o(n)$ since $k = o(n)$.

**Significance:**
- **First front-line bound advance in the program.** Previous best upper bound was $0.416n$ (forum) / $0.458n$ (private). New bound $0.3612n$ materially improves both.
- Moves the research status from "five rounds of meta-theorems, no bound movement" to "new explicit upper bound on $L(n)$."
- Still does not settle the main asymptotic question ($\varepsilon n$ vs $o(n)$). But it's a substantive step in the sublinear direction.
- The constant $13/36$ is likely not tight. Pro itself flags optimization paths: stronger $S$ lower bound, or finer odd-sift estimate than second-order Bonferroni. An LP-dual / rounded-dual approach could sharpen.

**Status (post three-way informal audit, 2026-04-18):** Gemini, ChatGPT-thinking, and Claude all audited the proof. **2/3 converge on the same fatal hole at the Bonferroni step; ChatGPT is the outlier.** Per CLAUDE.md's promotion rule, we treat the proof as broken pending re-derivation, but the bound itself is likely true.

**Gemini + Claude (PROOF BROKEN, independently):** The second-order Bonferroni bound is $N_D(n) \le (n/2) f(S) + o(n)$ with $f(S) := 1 - S + S^2/2$. Pro substitutes $S = 1/3$ to get $f(1/3) = 13/18$, hence $N_D \le 13n/36$. But $f(S)$ is an upward parabola with vertex at $S = 1$ and $f(1/3) = f(5/3) = 13/18$. For $f(S) \le 13/18$ we need $S \in [1/3, 5/3]$. Pro proves $S \ge 1/3$ but NOT $S \le 5/3$. If Prolonger plays passively, Shortener plays the first $k$ odd primes, giving $S \sim \log\log k \sim \log\log n \to \infty$ — which makes the Bonferroni polynomial bound blow up to $+\infty$, not converge to $13/18$.

**ChatGPT-thinking ("not fatally broken"):** Missed the parabola-direction issue. Verified the arithmetic $f(1/3) = 13/18$ but didn't check that substituting the lower bound $S = 1/3$ gives an upper bound on $f(S)$. Identified a different (smaller) gap: Pro never explicitly shows the "smallest legal odd prime" exists for each of the first $k$ Shortener turns (log-mass argument makes this repairable).

**All three agree:** Step 1 (Chebyshev induction $\Rightarrow q_j \le (3/2+\varepsilon) j \log n \Rightarrow S \ge 1/3 - o(1)$) is sound. Step 2 (compression via odd-part map $\phi$) is sound. Step 3 sieve *formulation* is sound; the *substitution* is the contested step.

**Silver lining (Gemini + Claude):** when $S \sim \log\log n$, the *true* $N_D$ is $\sim n/\log n$ via Mertens' third theorem. So the strategy likely does force $L(n) = O(n/\log n)$ (stronger than $13n/36$), but the specific proof via second-order Bonferroni doesn't capture this. The certificate needs Brun's sieve, the Mertens product, or an LP-dual fractional cover — replacing the blown-up polynomial with an $\exp(-S)$-type bound.

**Claude's nice framing — the $13/36$ is a worst-case saddle:**
- *Prolonger blocks aggressively:* forces $S \approx 1/3$ (worst-case for Shortener). Parabola gives $\le 13/18$, so game is $\le 0.36n$.
- *Prolonger blocks weakly:* $S \to \log\log n$. True $N_D \approx (n/2) e^{-S} \sim n/\log n$, so game is $O(n/\log n)$, much shorter than $13/36$.
- The worst case for Shortener (longest game) is $S \approx 1/3$, which is exactly where Pro's analysis applies. So **$13/36$ is plausibly the correct worst-case constant**, and the strategy itself is likely sharp. The proof just needs a case-split (or uniform sieve) to cover both regimes.

**Numerical sanity (ChatGPT spot-check):** simulations at $n \in \{100, 1000, 10000\}$ give $L$ values well below $13n/36$, so empirically the bound holds.

### Reconciliation

**Gemini's and Claude's critiques are mathematically correct** — evaluating a parabola at $S = 1/3$ assuming $S \ge 1/3$ doesn't upper-bound $f(S)$ unless we also know $S \le 5/3$. **ChatGPT missed the monotonicity direction.** (Textbook example of why the harness runs three verifiers: each catches different things, and convergence across two is high-signal.)

**Current verdict:**
- **The bound $L(n) \le 13n/36 + o(n)$ is likely true, possibly strengthenable to $L(n) = O(n/\log n)$.**
- **Proof as written is broken** at the Bonferroni step in the regime $S > 5/3$ — the actual regime at large $n$.
- **Repair paths:** (a) case-split — second-order Bonferroni for $S \in [1/3, 5/3]$, Brun / Mertens product for $S > 5/3$; (b) use a higher-order sieve uniformly; (c) reformulate via LP-dual fractional cover.
- **Do not promote to Established.** The $13n/36$ figure should not be cited as a theorem until the repair is executed.
- **Aristotle formalization** (job `dc17c89c-2b8b-4837-81bb-13e6a6e7702e`, submitted 2026-04-18) — will likely surface the same gap when trying to formally verify the Bonferroni substitution. A sorry there would independently confirm the 2/3 informal convergence.

### Audit synthesis for Prompt 6A (carrier-recycling obstruction)

**All 3 verifiers concur: construction sound, Pro's framing / conclusion overstated.**

- **Gemini unique catch — "Carrier Recycling Fallacy":** Prolonger's construction requires only $O(n^{1/(m+1)})$ total moves, and carriers $q$ are abundant (the interval $(n/(2R), n/R]$ is massive). Ford-type *density* theorems cannot prevent a *sparse* Prolonger strike. Pro's stated direction ("Ford 2008 is the right technology for the carrier side") is logically incoherent with the proof's own structure.
- **ChatGPT unique catch — legality invariant repair:** Pro's "$u$ is legal" step assumes (i) Shortener has played only primes so far and (ii) Prolonger has played only distinct upper-half numbers. Both true under SLP but need to be stated. Also notes $U = (n/2, n]$ is a trivial antichain, so Prolonger's upper moves don't conflict with each other.
- **Claude unique catches:**
  - *Theorem undersells itself.* Optimizing $m$ over its feasible range (up to $\sim \sqrt{\log n}$) gives $\sum_{p \in S_n} 1/p \le 1 + \log\log\log n + O(1)$, hence # uncovered $\gtrsim n/\log\log n$ — much stronger than Pro's stated $n/(\log n)^{1/(m+1)}$.
  - *Mertens-density step is heuristic, not theorem.* Writing "$n \exp(-\sum 1/p)$" assumes a sieve for a set $S_n$ with ~40k primes near $n/2$, far outside the fundamental-lemma regime. Fine as heuristic (route is blocked), not fine as rigorous quantitative count.
  - *Obstruction invisible below $n \approx 10^{19}$.* Pro's bound $n/(\log n)^{1/(m+1)}$ only beats $n/\log n$ when $\log n > (1/c_m)^{(m+1)/m}$. This is a genuinely asymptotic result, not visible at reasonable $n$.
  - *Numerical reproduction:* matched captured harmonic mass via simulation; could not reproduce Pro's specific "$1.385, 1.414, 1.441$" numbers — the underlying "relaxed chunk model" is underspecified.
- **Convergent:** obstruction is a *partial-range result* (below $c_m n^{1/(m+1)}$ threshold only), barrier rhetoric about "ruling out SLP + Mertens proofs of $O(n/\log n)$" is stronger than the proved theorem. Carrier-recycling reframing is conceptually useful (Ford-type anatomy-of-integers *is* the right regime for the re-question), even if the Ford-as-next-step claim is logically incoherent with the sparse-strike nature of the obstruction.
- **Bottom line:** the theorem survives with minor repairs ($u$-distinctness, Prolonger-first move). Claude's numerical verification confirms zero duplicate $u$'s in simulation. Ford-as-next-step framing is wrong; real lesson is that **SLP is fundamentally exploitable** and Shortener needs a dynamic / top-down / carrier-sniping strategy.

### Joint interpretation

- Prompt 6A's obstruction + Prompt 6B's new bound are consistent: the naive "Shortener plays primes only" route can't reach $O(n/\log n)$ (6A), but a mixed strategy (Shortener plays primes for a sublinear prefix, then anything-goes) can reach $0.3612n$ (6B). The gap between $0.3612n$ and $O(n/\log n)$ is where the "carrier-recycling" structure matters.
- The $13/36$ bound does **not** rely on shield reduction, Vaccinated Shield, or any of the program's obstruction-theorem framework. It's a direct Shortener-strategy argument. This validates the strategic-audit pivot: stepping outside the shield framework produced the first actual bound advance.
- Pro's Prompt 6B closing flags a natural extension: optimize the prefix length and sieve order. Plausibly pushes below $13/36$.

## Round 7 results (2026-04-18) — $13/36$ bound closed via truncation

Prompt: `prompts/researcher-07-shortener-13-36-closeout.md`. Output: `researcher-07-13-36-closeout.md`.

Sent back to the same Pro tab after the Round 6 audit flagged the non-monotone Bonferroni issue. Pro initially refuted the hoped $L(n) = O(n/\log n)$ direct-sieve route (see `researcher-06-direct-sieve-refutation.md`) — the block-product Prolonger counterstrategy forces $S \le 1/2$ and $\prod(1 - 1/q) \ge e^{-1/2}$, so no Mertens-product bound on $N_D$ alone can give $O(n/\log n)$.

But the refutation also handed us the information needed to close out the $13/36$ bound: Pro showed $S \le 1/2$ in the adversarial regime, which combined with $S \ge 1/3$ gives $S \in [1/3, 1/2]$ — comfortably inside the Bonferroni-valid range.

Pro then closed the argument with a **truncation fix** — elegantly avoiding the case-split we suggested as a potential direction:

Take $t$ minimal with $s_t := \sum_{j \le t} 1/q_j \ge 1/3 - \eta_n$. Since each $q_j \ge 3$ (odd prime), $1/q_j \le 1/3$, so by minimality $s_t < 1/3 - \eta_n + 1/3 \le 2/3$. Let $E = \{q_1, \ldots, q_t\}$. Then $N_D(n) \le N_E(n)$ (smaller sifting set ⇒ more survivors). Second-order Bonferroni on $E$ gives $N_E \le (n/2)(1 - s_t + s_t^2/2) + o(n)$. Since $s_t \in [0, 1]$ and $f(s) = 1 - s + s^2/2$ has $f'(s) = s - 1 \le 0$ there, $f$ is decreasing on $[0, 1]$, so $f(s_t) \le f(1/3 - \eta_n) = 13/18 + o(1)$. Therefore $N_D(n) \le 13n/36 + o(n)$, hence $L(n) \le 13n/36 + o(n)$.

**Why this works without a case-split:** the nonmonotonicity of $f$ only obstructs using the *full* reciprocal mass of $D$. Truncating to the first subfamily whose mass reaches $1/3 - o(1)$ keeps us in the monotone regime automatically. The "odd" in "smallest legal odd prime" is load-bearing — it caps $1/q_j \le 1/3$ per step, preventing partial sums from jumping past $[1/3, 2/3]$.

**Status:** **PROOF AUDIT COMPLETE (3/3 sound).** Aristotle formalization in progress.

### Round 7 audit synthesis (2026-04-18, 3-way)

All three verifiers returned `SOUND`. Verbatim in `verify-postresp-07-audit{1,2,3}.md`.

**Convergent findings:**
- Every step of the truncation proof is valid. Minimality + $q_j \ge 3$ forces $s_t \in [1/3 - \eta_n, 2/3 - \eta_n]$. On $[0, 1]$, $f(s) = 1 - s + s^2/2$ is monotonically decreasing, so $f(s_t) \le f(1/3 - \eta_n) = 13/18 + O(\eta_n)$. $N_D \le N_E$ is trivially correct ($E \subseteq D$). Second-order Bonferroni on $E$ has correct direction. Final arithmetic $f(1/3) = 13/18 \Rightarrow 13n/36$ verified.
- Truncation is **genuinely different from a case-split** — it never lets $s_t$ leave the monotone regime, rather than handling two regimes separately. Audit 3: "mathematically superior to case-split." Audit 1: "Clean conceptual improvement."
- Strategy executability confirmed via log-mass argument (blocked log-mass $\le (3/2 + o(1))\sqrt n \ll n$, so plenty of legal odd primes remain through turn $k$).

**Weakest link identified (all 3 concur):** not internal to the proof. The entire argument rides on fact (A) — the Chebyshev bound $q_j \le (3/2 + \varepsilon) j \log n$ holding uniformly over all Prolonger strategies — which is imported as established from Round 6. (A) is itself audit-validated (Round 6 all three verifiers concurred Step 1 is sound), so this is a structural observation about where the argument's weight lies, not a gap.

**Unique catches:**
- **Audit 2 (empirical caveat):** simulation at $n \in \{10^3, 10^4, 10^5\}$ gives $2k + N_D \approx 0.415n, 0.402n, 0.390n$ — all *above* $13/36 \approx 0.3611n$. Does NOT refute the asymptotic ($o(1)$ correction is "painfully slow"), but small-$n$ tests are **not** valid confirmations of the theorem. Corrects the Pro prompt's hint that $t$ would be "a few": in the adversarial regime $t \sim n^{1/3}$, not bounded.
- **Audit 3 (convergence rate):** the dropped term $-\tfrac{1}{2}\sum 1/p^2$ in the Bonferroni pairwise bound is asymptotically necessary for uniformity but loose at finite $n$ — sacrifices $\sim 0.05n$ against passive Prolonger. Combined with $O(t^2) = O(n/\log^2 n)$ error, the empirical $L(n)/n$ approaches $13/36$ very slowly from above.

**Promotion.** Per the CLAUDE.md rule ("promote to Established when at least two informal verifiers agree it's sound"), with 3/3 convergent, $L(n) \le 13n/36 + o(n)$ is now **Established** (Aristotle verification pending for strongest possible signal).

**Prior candidates superseded.**

**Program significance.** **First confirmed front-line bound advance of the program:**
- Previous record (forum): $L(n) \le 0.416n$.
- New: $L(n) \le 0.3612n + o(n)$.
- The $0.416$ vs $0.458$ dispute is now moot — both dominated.
- Contribution moves the program from "interesting focused paper" to "solid new result on a 33-year-old open Erdős problem."
- Central asymptotic question ($L(n) \ge \varepsilon n$ vs $L(n) = o(n)$) still open: $13/36$ does not prove sublinearity.

**Established consequence.** To go below $13/36$, Pro itself flagged two paths: (i) strengthen the uniform lower bound $S \ge 1/3$; (ii) use structure beyond second-order Bonferroni (higher-order, Brun's sieve, or Prolonger move structure). The direct $O(n/\log n)$ via this strategy is refuted — the block-product counterstrategy forces $\prod(1 - 1/q) \ge e^{-1/2}$.

## Round 9 results (2026-04-18) — Carrier Capacity Bound REFUTED

Prompt: `prompts/researcher-09-carrier-capacity.md`. Output: `researcher-09-carrier-capacity-refutation.md` (Pro) + `verify-researcher-09-gemini-refutation.md` (Gemini DeepThink, independent).

Following Round 8's $5n/16$ result and Pro's closing guidance ("to reach $O(n/\log n)$, need an argument using Prolonger's composite moves, not just $D$"), we lifted Audit #2's **Carrier Capacity Bound** as a validated direction for a targeted Pro round. The proposed Lemma: for every Prolonger move sequence $P$ of size $T = \varepsilon n$, $\sum_{p \in B(P)} 1/p \le C(\varepsilon)$ (constant independent of $n$).

**The Lemma is false.** Independently refuted by Gemini DeepThink and Pro, within hours of each other.

### The refutation (both verifiers convergent)

**Pro's counterexample (cleaner):** Take $0 < \varepsilon < 1/4$, $T = \lfloor \varepsilon n \rfloor$, $m = \lfloor n/2 \rfloor$. The following is a **legal alternating game play**:
- Prolonger plays $x_i = m + i$ for $i = 1, \ldots, T$.
- Shortener plays $y_i = m + T + i$ for $i = 1, \ldots, T - 1$.

For $\varepsilon < 1/4$, all moves are in $U = (n/2, n]$, and since any two distinct elements of $U$ are incomparable under divisibility, every move is legal. So $P = \{m+1, \ldots, m+T\} \subset U$ is a genuine game-achievable Prolonger sequence of size $T = \varepsilon n$.

For every prime $p \le T$, the $p$ consecutive integers $m+1, \ldots, m+p \subseteq P$ contain a multiple of $p$, so $p \in B(P)$. Therefore
$$\sum_{p \in B(P)} \frac{1}{p} \ge \sum_{p \le T} \frac{1}{p} = \log\log(\varepsilon n) + O(1) = \log\log n + O(1) \to \infty.$$

**No constant $C(\varepsilon)$ bounds this.**

**Stronger obstruction (Pro).** Finite "vaccination" by excluding any fixed prime set $Q$ with $d = \prod_{q \in Q} q$ doesn't save it either: take an arithmetic progression $\{a, a+d, \ldots, a+(T-1)d\} \subset U$ with $(a, d) = 1$; the same argument over $p \le T$, $p \notin Q$ gives divergent reciprocal sum.

**Gemini's diagnosis of the Erdős–Kac fallacy.** Average $\omega(x)$ bounds $\sum_{x \in P} \omega(x)$, not $\sum_{p \in B(P)} 1/p$. A block of consecutive integers has ordinary $\omega$-statistics but hits every prime $\le T$ automatically. The reciprocal sum can diverge even with low $\omega$.

**Numerical verification (both):** Pro computed $\sum 1/p \approx 2.316, 2.574, 2.780$ at $n = 10^4, 10^5, 10^6$ with $\varepsilon = 0.1$ — rising like $\log\log n$, matching the theoretical $\log\log n + O(1)$.

### What this kills

- **The Carrier Capacity Bound (static, universal-over-antichains version) is dead.** No proof of $L(n) = O(n/\log n)$ can use this specific Lemma.
- **The entire static sieve route is dead for reaching $O(n/\log n)$.** Any argument bounding $\sum_{p \in B(P)} 1/p$ over all game-achievable Prolonger sequences hits the interval-counterexample barrier. This matches Pro's Round 7 refutation (block-product counter) and is now confirmed independently.
- **Audit #4's (strategic-round) Ford-2008 / anatomy-of-integers direction is substantially narrowed.** Ford's machinery bounds the *distribution* of $\omega(x)$, which doesn't control the reciprocal sum for targeted subsets like intervals. Erdős–Kac average-$\omega$ reasoning is not the right tool.

### What this does NOT kill

Pro's closing opens the dynamical version:

> *"This does not rule out a much more dynamical statement tied to a specific Shortener strategy, but the lemma in the form you stated cannot be used to get $L(n) = O(n/\log n)$."*

The static Lemma quantifies over all possible Prolonger antichains. A dynamical version would restrict to Prolonger plays *achievable in the game against a specific Shortener strategy*. Pro's interval counterexample uses a Shortener that plays *within $U$* — making very weak moves. Against a Shortener that plays small primes (the $5/16$ strategy), Prolonger cannot play many multiples of small primes, so the counterexample's interval structure would be disrupted.

However — Pro's Round 7 block-product counterstrategy IS game-achievable against the $5/16$ Shortener, and it ALSO produces divergent $\sum 1/p$ (as established in Round 7). So even the 5/16-restricted dynamical Lemma is false.

**Open question (the surviving dynamical version):** is there a Shortener strategy $\sigma$ such that for every Prolonger response against $\sigma$, the resulting $B(P)$ has $\sum_{p \in B(P)} 1/p = O(1)$? Empirical signals:
- `S_adaptive_prime` (Codex Phase 2): slightly beats $S^\star$ against `P_block_product` (1.378 vs 1.962 at $n = 10^5$).
- `S_carrier_snipe`: similar (1.383 at $n = 10^5$).

Neither has been proved to bound $\sum 1/p$; the empirical differences are small and don't show asymptotic decay.

### Net program status (post Round 9)

The **$5n/16$ bound from Round 8 stands as the program's secured contribution.** The path toward $O(n/\log n)$ through sieve-over-$B(P)$ arguments in the static form is closed.

## Round 9b (2026-04-18) — Universal Prolonger Counter (dynamical refutation)

Independent audit argument by a fourth verifier (not Pro, Gemini DeepThink, Claude, or GPT-thinking — an open-exploration model via the user's tabs) generalized Round 9's static refutation to a fully dynamical one. Full argument in `verify-postresp-10-audit-universal-block-product.md`.

**Theorem (informal, audit-confirmed structural proof).** For every Shortener strategy $\sigma$, Prolonger has a response against $\sigma$ with
$$\sum_{p \in B(P)} \frac{1}{p} \ge \frac{1}{2}\log\log n + O(1).$$

**Construction.** Block-product Prolonger: partition all primes $\le n^{1/3}$ greedily into disjoint sets $S_1, \ldots, S_r$, filling each until $x_i := \prod_{p \in S_i} p$ just exceeds $\sqrt n$ (so $x_i \in (\sqrt n, n^{5/6}]$). Blocks are pairwise coprime and satisfy $x_i x_j > n$, hence any Shortener move $s$ can invalidate at most one block. Prolonger greedy-descends by $v(x_i) = \sum_{p \in S_i} 1/p$, securing at least half the total harmonic mass $\sum_{p \le n^{1/3}} 1/p = \log\log n + O(1)$.

**Consequence.** No Shortener $\sigma$ forces $\sum_{p \in B(P)} 1/p = O(1)$, even dynamically. The $\Theta(\log\log n)$ reciprocal mass is a structural invariant of the game, not just of the static setup.

**Conditional upper bound (rigorous).** If some $\sigma$ admitted bounded reciprocal mass, Brun-style sieve would give $|P| \le e^{C+O(1)} n/\log n$, hence $L(n) = O(n/\log n)$. (The implication is rigorous; the hypothesis is empty by the theorem above.)

## Round 10 (2026-04-18) — $\Omega$-grading Shortener strategy (live research direction)

**Input:** `prompts/researcher-10-dynamical-carrier.md` (first attempt, then refined to `researcher-11-omega-strategy-prove.md`). Response saved as `researcher-10-omega-strategy.md`.

**Proposed Shortener strategy.** Play a legal lower $d$ maximizing $\text{score}_t(d) = \#\{u \in U_t^{\text{leg}} : d \mid u\}$, tie-break by smaller $\Omega(d)$, then smaller $d$. If no lower move is legal, play any legal upper.

**Why $\Omega$-grading (not $\omega$).** Fixed-$\Omega$ layers are primitive under divisibility: $d \mid e, d < e \Rightarrow \Omega(d) < \Omega(e)$. Fixed-$\omega$ layers are not ($6 \mid 12$, $\omega(6) = \omega(12) = 2$).

**Upper composites split cleanly.**
- $\Omega(u) = 2 \Rightarrow u = pq$ or $p^2$, killable only by its prime divisors (irreducible).
- $\Omega(u) \ge 3 \Rightarrow u$ has a proper divisor $d \le n/2$ with $\Omega(d) = 2$.

**Two-layer proof architecture.**

**Layer 1 — Softened Semiprime Exposure.** $\Xi(B) := \sum_{p \in B, p \le \sqrt n} 1/(p \log(n/p)) = O(\log\log n / \log n)$ for any game run against the $\Omega$-grading Shortener. *Status: almost-trivially proved* via Mertens + the universal counter observation that Prolonger's primes concentrate in $[\log n, n^{1/3}]$, giving $1/\log(n/p) \asymp 1/\log n$ uniformly and hence $\Xi(B) \asymp (1/\log n) \sum 1/p \le (1/\log n)(\log\log n + O(1))$. This bounds the count of surviving upper semiprimes with small factor in $B$ by $n \cdot \Xi(B) = O(n \log\log n / \log n)$.

**Layer 2 — Online $\Omega=2$ cover lemma.** *Status: UNPROVED.* Proposed statement: there is $c > 0$ such that $|R_t^{(\ge 3)}| \ge K n/\log n \Rightarrow$ exists legal $d \le n/2$ with $\Omega(d) = 2$ and $\text{score}_t(d) \ge c|R_t^{(\ge 3)}|/\log n$. Gemini 3.1 Pro sketched a pigeonhole proof that fails (off by a factor of $\log\log n$ — average coverage $3R \log n/(n \log\log n)$, not $\ge cR/\log n$; also misapplied Hardy-Ramanujan to adversarial Prolonger). Needs a genuine combinatorial argument, possibly via entropy, random-model concentration, or LP duality. Awaiting Pro + DeepThink (fresh threads dispatched 2026-04-18 via `researcher-11-omega-strategy-prove.md`).

**Layer 3 — Assembly.** *Status: UNPROVED.* Given Layers 1 & 2, the legal-upper-pool argument gives
$$|U_t^{\text{leg}}| \le \underbrace{(1+o(1)) \frac{n}{2\log n}}_{\text{upper primes}} + \underbrace{O(n \, \Xi(B))}_{\text{upper semiprimes}} + \underbrace{O(n/\log n)}_{\Omega \ge 3 \text{ residual}} + \underbrace{O(\sqrt n)}_{\text{prime squares}}.$$
With Layer 1 this is $O(n(\log\log n)/\log n)$, bounding $|A \cap U|$. **Closing $|A \cap L|$ is a separate open sub-question** — Shortener's lower moves are bounded by strategy structure, but Prolonger's lower moves need Theorem A or a direct incidence count. No current attack.

**Target bound if all three layers close.** $L(n) = O(n(\log\log n)/\log n)$, which is $o(n)$ — would **resolve Erdős's question negatively**. Strict form $O(n/\log n)$ is consistent with empirical $L \log n/n$ trajectory but not proved; requires Layer 1 to be bounded by $O(1/\log n)$ rather than $O(\log\log n/\log n)$, which is impossible by the universal counter.

### Refinements and audit history

- **Gemini 3.1 Pro audit of Pro's original Round 10.** Caught that Pro's strict $\Xi(B) = O(1/\log n)$ is algebraically equivalent to the false $\sum 1/p = O(1)$ and fails. The softening to $O(\log\log n / \log n)$ preserves $L = o(n)$. Correct on Layer 1 algebra; wrong in concluding "knife's edge between $o(n)$ and $\Theta(n)$" (the softened bound is still $o(n)$). See `verify-postresp-10-gemini-omega.md`.

- **Gemini 3.1 Pro second-pass "resolution" (2026-04-18).** Claimed $L(n) = O(n (\log\log n)/\log n)$ resolves the problem. Verdict: Layer 1 correct; Layer 2 pigeonhole broken (off by $\log\log n$); Assembly hand-waved. Sketch, not theorem.

- **Codex Phase 2.5 dynamical probe** (`phase2/dynamical_probe/`). Six Shortener strategies × four Prolonger strategies at $n \in \{10^3, 10^4, 10^5, 10^6\}$. Key findings:
  - Against worst-case Prolonger (`P_block_product`), three Shorteners tie: smallest-legal-odd-prime, greedy-coverage-among-legal-primes, pair-response. All give $\sum 1/p / \log\log n \in \{0.887, 0.880, 0.875, 0.875\}$ across 4 decades. Stable ~0.875 coefficient.
  - Realized game length for best tier: $L \log n / n \in \{1.29, 1.25, 1.22, 1.17\}$ at $n = 10^3, 10^4, 10^5, 10^6$. **Monotone decreasing** — consistent with $L = O(n/\log n)$, possibly sub-$n/\log n$.
  - Pair-response beats SLP on softer Prolongers but loses to block-product. Block-product is the binding adversary.
  - Small-prime concentration at $n = 10^6$: primes $\le 100$ contribute 73% of reciprocal mass; primes $\le 1000$ contribute 85%.

## The Open Question (current, post Round 10)

**Leading hypothesis (strong support):** $L(n) = \Theta(n/\log n)$. Supports: (a) universal lower bound $\sum 1/p = \Theta(\log\log n)$ structurally established, (b) Codex $L \log n / n$ trajectory decreasing, (c) $5/16$ upper bound indicates Shortener can achieve substantial suppression, (d) the $\Omega$-grading Layer 1 softening gives $O(n \log\log n/\log n)$ as the cleanest provable target.

**Primary research target — $\Omega$-grading Shortener bound.** Prove $L(n) = O(n/\log n)$ (or the softer $O(n(\log\log n)/\log n)$) via:
1. **Layer 1 (Softened Semiprime Exposure).** Almost-trivial via Mertens — effectively a corollary of the universal counter. Done up to coefficient.
2. **Layer 2 (Online $\Omega=2$ cover lemma).** Open. Gemini 3.1 Pro's pigeonhole doesn't work (off by $\log\log n$); Hardy-Ramanujan doesn't apply to adversarial Prolonger. Needs genuine combinatorial argument — entropy, concentration, or LP duality.
3. **Layer 3 (Assembly, $|A \cap L|$ bound).** Open. Shortener's lower moves controlled by strategy; Prolonger's lower moves need Theorem A or direct incidence.

Round 11 targeted researcher prompt dispatched 2026-04-18 to fresh Pro + DeepThink threads (`prompts/researcher-11-omega-strategy-prove.md`).

### Round 11 partial — Gemini 3.1 Pro triple convergence (2026-04-18)

User dispatched the Round 11 prompt to three separate Gemini 3.1 Pro instances in parallel (not independent model families, three copies of the same model — same prior, potentially shared blind spots). All three converged on $L(n) = O(n(\log\log n)/\log n) = o(n)$. Full write-up in `verify-postresp-11-gemini-triple.md`.

**What all three got right.**
- **Layer 1 is unconditionally rigorous:** $\Xi(B) \le O(\log\log n / \log n)$ for any $B$ via Mertens, since $p \le \sqrt n \Rightarrow \log(n/p) \ge (1/2)\log n$ and $\sum_{p \le \sqrt n} 1/p \le \log\log n + O(1)$. Verified. Layer 1 promotes from "almost trivial" to "proved, unconditional."
- **Cross-semiprime observation (Pro #1 unique):** under block-product Prolonger, cross-semiprimes $p_a p_b$ with $p_a \in S_i, p_b \in S_j$ for $i \ne j$ remain legal — Shortener has $\sim n^{2/3}/\log^2 n$ fresh semiprime shields regardless of Prolonger's blocking. Structural insight, not load-bearing for Layer 2.

**What all three got wrong (or hand-waved).**
- **Layer 2 pigeonhole is off by a growing factor.** Each Gemini uses max-shield-coverage $\ge 3|R|/|D|$ with $|D| \sim n\log\log n/\log n$, giving $C \ge 3K/\log\log n$ under precondition $|R| \ge Kn/\log n$. Target is $cKn/\log^2 n$, which exceeds the pigeonhole bound by $n\log\log n/\log^2 n \to \infty$. **Direct pigeonhole fails.** All three instances inherit the same algebraic misstep.
- **Assembly untouched.** None address the $|A \cap L|$ bound.

**Net status from Gemini triple.** Layer 1 upgraded to unconditional rigor (pure Mertens). Layer 2 still needs entropy / concentration / LP-duality / structural argument beyond pigeonhole. Assembly still open. The target $L(n) = O(n\log\log n/\log n)$ is *well-motivated, matches the empirical trajectory, and is the conjecturally right answer*, but not proved.

GPT Pro and DeepThink threads (different model families) remain the genuine independent votes. Pending as of this update.

### Round 11 — GPT Pro response (2026-04-18)

Fresh-thread response at `researcher-11-pro-response.md`. **Partial refutation plus constructive replacement direction.**

**Result 1: Layer 1 is trivially true.** $\Xi(B) = O(\log\log n/\log n)$ for any $B$ via $\log(n/p) \ge (1/2)\log n$ for $p \le \sqrt n$ and Mertens. Agrees with Gemini triple; unconditional.

**Result 2: Layer 2 (online $\Omega = 2$ cover lemma) is FALSE.** Concrete counterexample. Let $y = \lfloor \log n \rfloor$, $A_t = \{$primes $\le y\}$ (legal, reachable via Shortener-playing-small-primes + Prolonger-distinct-upper-primes). Define
$$R_y = \{u = pqr \in U : y < p \le q \le n^{1/3},\ r \text{ prime},\ n/(2pq) < r \le n/pq\}.$$
Every $u \in R_y$ has $\Omega(u) = 3$ and all prime factors $> y$, so it's legal against $A_t$. Size: $|R_y| \asymp n(\log\log n)^2/\log n$. Any $\Omega = 2$ divisor of any $u \in R_y$ has both primes $> y$, so $d > y^2 \asymp \log^2 n$. Hence max score $\le n/d \le n/\log^2 n$. But target $|R_y|/\log n \asymp n(\log\log n)^2/\log^2 n$ is $(\log\log n)^2$ times larger. **Pigeonhole conclusion false.** Numerically verified at $n = 10^6$: $|R_y| = 9098$, max score = 214, target ≈ 659.

**Result 3: A useful positive lemma.** For any $D \ge 4$:
$$\#\{u \in U : \Omega(u) \ge 3,\ s_2(u) > D\} \ll \frac{n \log\log D}{\log D},$$
where $s_2(u) = \min\{d : \Omega(d) = 2, d \mid u\}$. Proof via Brun's upper-bound sieve on rough integers. If Shortener could force surviving $\Omega \ge 3$ uppers to have $s_2(u) > n^\varepsilon$, arithmetic tail would already be $O(n\log\log n/\log n)$.

**Result 4: Proposed replacement direction.** Multiscale batch-cover statement, not single-best-divisor:
1. Partition hard $\Omega \ge 3$ uppers by dyadic scale of smallest *legal* $\Omega = 2$ divisor.
2. Each scale has many legal semiprime shields with substantial total score.
3. Single Prolonger move invalidates few shields in that family.

Hypergraph / batch-cover, blocker-resilient. Plus separate $|A \cap L|$ bound needed.

**Minor strategy fix (Pro's note).** The $\Omega$-grading rule should play a legal lower only when max score > 0, else legal upper. Otherwise score-zero lower moves hurt Shortener.

### Round 11 — DeepThink response (2026-04-18)

Fresh-thread response at `researcher-11-deepthink-response.md`. **Partially correct, partially repeats the Gemini-family Layer 2 error, introduces a new lower-bound argument.**

- **Agrees with Pro on Layer 1** (unconditional Mertens) and conclusion $L = o(n)$.
- **Asserts Layer 2 holds via the same pigeonhole Pro refuted.** Same "Prolonger blocks $O(\log^2 n)$ shields, pigeonhole delivers high-score shield" argument. **This is wrong** — matches the three Gemini 3.1 Pros' shared blind spot. Does not address Pro's $R_y$ counterexample.
- **New: Part 3 cover-shattering endgame lower bound.** Upper semiprimes grouped by larger-factor covers $q$ ($Q \sim n/\log n$ total). Shortener can clear cover $q$ by playing $q$ (one move per cover). Prolonger counter: play $p_1 q$ (upper semiprime) instead, making $q$ illegal, forcing the remaining $k_q - 1$ semiprimes in the cover to become poset-isolated and eventually play individually into $A$. Alternating 1-for-1 with Shortener: Prolonger shatters $Q/2$ covers, each forcing $k_q - 1 \sim \log\log n - 1$ isolates → $|A| \ge c n\log\log n/\log n$. This is *new content* that Pro didn't provide.

**Audit needed on Part 3.** Specific gaps: (i) legality of $p_1 q$ against realized $A$, (ii) exact forced-isolation argument for remaining $p_i q$'s, (iii) timing (when does the endgame start without a valid Layer 2?), (iv) rigorous 1-for-1 alternating.

### Round 11 — combined synthesis

**Conjectural answer:** $L(n) = \Theta\left(n \frac{\log\log n}{\log n}\right) = o(n)$. Would resolve Erdős's question negatively.

**Status by component:**

| Component | Status |
|---|---|
| Layer 1 ($\Xi = O(\log\log n/\log n)$) | Rigorously proved (pure Mertens, unconditional) |
| Layer 2 (one-step $\Omega=2$ cover) | **FALSE** (Pro's $R_y$ counterexample + numerical verification) |
| Batch-cover replacement for upper bound | Direction identified by Pro; not proved |
| Lower bound $L \ge c n\log\log n/\log n$ | DeepThink's endgame, plausible, not fully rigorous |
| $|A \cap L|$ assembly | Open |

**Cross-family convergence check:** Pro (GPT-family) and DeepThink (Gemini-family) agree on Layer 1 and on the conclusion but diverge on Layer 2 rigor. DeepThink + all three Gemini 3.1 Pros (4 instances total) converge on the same wrong pigeonhole → same-family blind spot. Pro is the only model to identify the counterexample. CLAUDE.md lesson validated.

**Next step:** informal audits on both responses. Specifically: verify Pro's $R_y$ counterexample (quick), audit DeepThink's Part 3 endgame rigor (the real new content). Audit prompt saved as `prompts/verify-postresp-11-combined.md`.

### Round 11 — three-way informal audit synthesis (2026-04-18)

Three audits returned on `prompts/verify-postresp-11-combined.md`. Full text at `verify-postresp-11-{deepthink,gpt-thinking,claude}.md`.

**Three-way convergences (all 3 agree):**

1. **Pro's $R_y$ counterexample to Layer 2 is correct.** All three verified the arithmetic: $|R_y| \asymp n(\log\log n)^2/\log n$ (confirmed independently via dyadic/PNT summation), max $\Omega = 2$ shield score $\le n/\log^2 n$, target exceeds max by $(\log\log n)^2$. No dissent. Layer 2 as stated is unequivocally dead.

2. **DeepThink's Part 3 endgame has genuine content but is NOT fully rigorous.** All three identify the timing issue (endgame depends on a greedy phase that used the failed Layer 2). The local forcing mechanism — once a cover $q$ is shattered, remaining $p_i q$'s become poset-isolated — is sound. The global "$L \ge cn\log\log n/\log n$" conclusion is not rigorously proved as stated.

3. **Pro's batch-cover replacement is a direction, not a proof.** No completed proof; the question is viability.

**Key divergence — what is the true final bound?**

| Audit | Claim |
|---|---|
| #1 Gemini DeepThink | $L = \Omega(n(\log\log n)^2/\log n)$. **Conjecture $\Theta(n\log\log n/\log n)$ is FALSE.** Pro's batch-cover is fatally obstructed by a novel AoE-blocking argument (Prolonger plays $v = p_1\cdots p_k$ to invalidate $\binom{k}{2}$ shields per move; integrating degraded clearing rate gives $X = e^{\Omega(\log^2 n)}$ turns needed). |
| #2 GPT-thinking | $L = \Theta(n\log\log n/\log n)$ **highly defensible**. Timing flaw in DeepThink's endgame is a proof-strengthener (Shortener's score-greedy chases $\Omega = 2$ shields first, leaving covers unmolested; Prolonger shatters covers in free turns). Pro's batch-cover viable but treacherous. |
| #3 Claude | **Only rigorously proved:** $n/\log n \le L \le 5n/16$. Nothing tighter is a theorem. Conjecture is a working heuristic for the $\Omega$-grading family, not a result for $L(n)$. Strongest-of-three critical read. |

**Audit #1's novel AoE obstruction — critical new claim.** Prolonger plays $v = p_1 p_2 \cdots p_k$ with $k \approx \log n/\log\log n$ primes from the appropriate range, invalidating $\binom{k}{2} \asymp \log^2 n/(2(\log\log n)^2)$ semiprime shields per move. Shortener's greedy picks smallest-shield-first for max score, but AoE depletion forces Shortener to progressively larger shields. After $X$ turns, smallest surviving shield is $D_X \asymp X\log^2 n$. Clearing rate integrates to $n\log X/\log^3 n$, so clearing $R_y$ pool requires $X = e^{\Omega(\log^2 n)}$ moves. Conclusion: Shortener cannot clear $\Omega \ge 3$ efficiently; must play $R_y$ manually; $L \ge |R_y| \asymp n(\log\log n)^2/\log n$.

**Audits #2 and #3 do NOT validate the AoE obstruction.** Audit #2 says Pro's batch-cover is "treacherous" but theoretically viable. Audit #3 says it's "plausible direction" with no obvious killer obstruction. So the AoE argument is a single-source claim from the same model family (Gemini) that has repeatedly shown blind spots in this problem.

**Subtleties in the AoE argument that need checking:**
- **Which shields does AoE actually invalidate?** Prolonger's $v$ uses primes from some range $R$; it invalidates Ω=2 shields $pq$ with $p, q \in R$. If $R$ doesn't cover the shields Shortener prefers, the obstruction fails to bite.
- **Legality of iterated AoE moves.** Prolonger needs many disjoint-prime $v$'s; limited by available primes in the target range.
- **Does Shortener have to use AoE-invalidated shields?** If shields outside the AoE range suffice for $R_y$-type pools, the obstruction shrinks.

Audit #1's conclusion $L = \Omega(n(\log\log n)^2/\log n)$ hinges on AoE being a real game-theoretic obstruction. I don't have a rigorous independent confirmation of this. Pro's audit (pending) is the cross-family decisive voice.

**Net status from three-way audits:**
- Layer 2 definitively dead (cross-validated).
- DeepThink Part 3: partial content (local mechanism sound, global theorem unproven).
- Pro's batch-cover: no proof, no verified obstruction.
- Final bound: either $\Theta(n\log\log n/\log n)$ (Audits #2, #3-heuristic), $\Omega(n(\log\log n)^2/\log n)$ (Audit #1), or nothing-better-than-$5n/16$ (Audit #3 rigorous).

**Next step:** await GPT Pro's audit. Pro's response will be decisive on (a) whether Audit #1's AoE obstruction is real, and (b) whether Pro sees its own batch-cover direction as salvageable post-AoE. Until then, honest program state is still "$5n/16$ rigorously, $\Theta(n\log\log n/\log n)$ conjectural." Held on Aristotle resubmissions and Codex empirical probes until the bound stabilizes.

### Round 11 — two additional audits: Claude-thinking and Pro-auditor (2026-04-18)

Two more audits returned, both substantially sharper than the first three: Claude with extended thinking (`verify-postresp-11-claude-thinking.md`) and a separate GPT Pro tab acting as auditor (`verify-postresp-11-pro-audit.md`). These identify **four critical findings that the first three audits all missed**, substantially changing the program's read.

#### Critical finding #1 — $L(n)$ is a min-max, not strategy-specific

Both audits flag that $L(n) = \min_\sigma \max_P L(\sigma, P)$ — the optimal Shortener. Even if DeepThink's Part 3 were fully rigorous, it only gives $L_{\Omega\text{-grading}}(n) \ge c n\log\log n/\log n$, which does NOT lower-bound $L(n)$. Some other Shortener could do better. **The true rigorous lower bound on $L(n)$ remains the classical $(1+o(1))n/\log n$ via primes in $[\sqrt n, n]$.** Part 3's contribution, if repaired, is "$\Omega$-grading is not optimal," not "$L(n)$ is at least this big."

This is a fundamental point that reshapes the program's framing: any strategy-specific lower bound is evidence against that strategy being optimal, but not a lower bound on $L(n)$ itself.

#### Critical finding #2 — $k_q$ should be $b_q$ (DeepThink's Part 3 mis-counted)

Claude-thinking: "after Prolonger plays one $p_1 q$, the only remaining semiprimes $pq$ that become individually forced are those with $p$ *already blocked*. If $p$ is still legal, Shortener can later play $p$ and wipe out $pq$." So the correct count of shattered semiprimes per cover is
$$b_q = \#\{p \in B : n/(2q) < p \le n/q\},$$
where $B$ is the blocked-prime set — NOT $k_q$ = total semiprimes on cover $q$.

Aggregate: $\sum_q b_q = \sum_{p \in B}(\pi(n/p) - \pi(n/(2p))) \asymp n \Xi(B)$. So the shattering-based lower bound is tied to $\Xi(B)$, which Layer 1 caps at $O(\log\log n/\log n)$ unconditionally. **Parts 1 and 3 are connected in a way neither DeepThink nor the first three audits noticed.** The repaired lower bound from shattering is at most $O(n\log\log n/\log n)$ asymptotically — matching the upper bound target, or weaker.

#### Critical finding #3 — the numerics argue AGAINST $\Theta(n\log\log n/\log n)$

Claude-thinking: if $L \sim c n\log\log n/\log n$, then $L \log n/n = c \log\log n$ should **grow** with $n$. Codex data shows it **decreasing** (1.29 → 1.17 across 4 decades). So the numerics empirically favor $L \sim c' n/\log n$ with a slowly-decreasing $c'$, NOT the $\Theta(n\log\log n/\log n)$ shape. Pro-audit concurs: "Neither fit is asymptotically flat, so the numerics don't distinguish over 4 decades." Combined: the numerics don't decisively pick, but they're inconsistent with a *constant-coefficient* $\Theta(n\log\log n/\log n)$.

This is a real empirical caution against prematurely endorsing $\Theta(n\log\log n/\log n)$. $\Theta(n/\log n)$ is still on the table and not ruled out.

#### Critical finding #4 — Pro's numerical certificate was sloppy

Claude-thinking independently verified Pro's $R_y$ counterexample numerically:
- "9098" includes multiplicity; true distinct $|R_y| = 8622$ at $n = 10^6$.
- "Max score 214" is the max over $R_y$ only; full legal-upper max is 331 (attained at $d = 17^2$).

The asymptotic obstruction still stands, but Pro's numerical certificate mixed boundary-convention issues and a multiplicity miscount. Worth repairing for any formal writeup.

#### Additional concrete obstructions to Pro's batch-cover (from Pro-audit)

- **Obstruction A: block-product hits multiple scales.** A Prolonger block $x_i = \prod_{p \in S_i} p$ has $\Omega(x_i) \asymp \log n/\log\log n$, so $\binom{\Omega}{2} \asymp (\log n/\log\log n)^2$ semiprime divisors spread across $O(\log n)$ scales. Per-scale hit is $O(\log n/\log\log n)$, not $O(1)$ as Pro's sketch suggests.
- **Obstruction B: dynamic legality / scale migration.** Scale partition is by smallest *legal* semiprime divisor, which migrates as shields are played. Prolonger blocks also push $u$'s up scales. The "one Prolonger move invalidates few shields per family" bound needs to hold *amortized across scale migration*. This requires an inductive potential function argument that's not in the sketch.

Both audits agree batch-cover is a viable *direction* but "a Master's thesis worth of work, not a weekend."

#### Updated three-way synthesis (now five-way)

| Claim | Verdict across 5 audits |
|---|---|
| Pro's $R_y$ counterexample to Layer 2 | All 5: correct asymptotically; Pro's specific numerics (9098, 214 vs 659) had minor issues |
| DeepThink's Part 3 endgame (as stated) | All 5: NOT rigorous |
| DeepThink's Part 3 core insight | 4/5: useful local mechanism; needs $k_q \to b_q$ fix |
| Pro's batch-cover | All 5: viable direction, no proof, concrete obstructions identified |
| $L(n) = \Theta(n\log\log n/\log n)$ as established | 4/5: NO. 1/5 (audit #2, GPT-thinking): highly defensible |
| $L(n) = o(n)$ | Plausible, not rigorously proved |
| Rigorous bounds on $L(n)$ | $(1+o(1))n/\log n \le L(n) \le 5n/16 + o(n)$ |

#### Net program state (post 5-audit)

**Rigorously proved:** $n/\log n \le L(n) \le 5n/16 + o(n)$ (both formally verified modulo classical NT sorrys).

**Plausible conjecture:** $L(n) = o(n)$, with specific rate uncertain between $\Theta(n/\log n)$ (favored by numerical trajectory) and $\Theta(n\log\log n/\log n)$ (favored by some structural arguments, but numerics cut against constant-coefficient form).

**Dead:** Strict $O(n/\log n)$ via one-step $\Omega=2$ cover lemma. Static carrier capacity. Dynamical bounded-reciprocal-mass.

**Live research programs:**
1. Pro's multiscale batch-cover (upper-bound proof attempt). Obstructions A (block-product multi-scale hits) and B (scale migration) identified; dynamic-legality potential-function argument needed.
2. DeepThink's cover-shattering — **repaired with $k_q \to b_q$**. If tied to $\Xi(B)$ via the aggregate identity, might give a strategy-specific lower bound matching the upper target. Still only for $\Omega$-grading, not $L(n)$.
3. **NEW direction implicit in the audits:** find a non-$\Omega$-grading Shortener that beats $n\log\log n/\log n$. If $L(n) = \Theta(n/\log n)$ is the truth, a better Shortener exists. Nobody has constructed one; even knowing where to look would be progress.

**Held indefinitely:** $5/16$ Aristotle rerun ($D = \{3, 5\}$), Codex Lemma-2 empirical test. Pending any clean formulation emerging from the research programs.

## Round 12 (2026-04-18) — $F_\alpha$ framework + omitted-vertex shadowing

Prompt: `prompts/researcher-12-synthesis-open.md` (new format: factual-dump research brief with no "Potential Directions" section, letting the primary models synthesize patterns across the complete failure atlas). Dispatched to fresh GPT Pro, Claude, and DeepThink threads.

**Pro response** (`researcher-12-pro-response.md`) is the single biggest conceptual advance of the program. Cross-family corroboration from Claude (`researcher-12-claude-response.md`).

### Pro's $F_\alpha$ static reduction

Fix $\alpha \in (1/3, 1/2)$, $y = n^\alpha$. Define
$$F_\alpha = \{p \le y : p \text{ prime}\} \cup \{d \le n/2 : \Omega(d) = 2,\ P^-(d) > y\}.$$

**Three facts (all elementary, Pro-verified):**

1. $F_\alpha$ is an antichain in $\{2, \ldots, n\}$.
2. If $A \supseteq F_\alpha$, then every further legal $x \le n$ has $\Omega(x) \le 2$ AND every prime factor $> y$. Proof: primes $\le y$ in $A$ block $x$ divisible by them; $\Omega(x) \ge 3$ with all primes $> y$ forces $x > y^3 = n^{3\alpha} > n$.
3. The surviving legal set after $F_\alpha$ installed has size $O_\alpha(n/\log n)$: upper primes ($\sim n/(2\log n)$) plus upper semiprimes with both primes $> y$ ($O_\alpha(n/\log n)$ by PNT). Lower-half large-prime semiprimes already in $F_\alpha \cap L$.

**Consequence.** If Shortener can force $A \supseteq F_\alpha$ during the game (up to $O(n/\log n)$ losses), then $L(n) = O(n/\log n)$.

### Q_α dynamic fact (block-product can't touch large semiprimes)

Let $Q_\alpha = \{d \le n/2 : \Omega(d) = 2, P^-(d) > n^\alpha\}$. Pro proves: any composite Prolonger move $x$ is comparable to at most one element of $Q_\alpha$. Two distinct $d_1, d_2 \in Q_\alpha$ dividing $x$ would force $x > n^{3\alpha} > n$ (contradiction). And $x \mid d_i$ forces $x = d_i$ (since $\Omega(d_i) = 2$, the only composite sub-divisor is $d_i$ itself).

So **the block-product batching attack does not hit the large-semiprime layer.** The only layer where real batching survives is the small-prime layer $\{p \le n^\alpha\}$.

### Omitted-vertex shadowing — the unifying obstruction

Pro proposes this is the common mechanism behind ALL prior failures (block-product, $R_y$ counterexample, carrier recycling, etc.).

**Mechanism.** If $u = p_1 p_2 p_3 m$ is upper, then the three numbers $x_i = (u/p_i) \cdot r_i$ with suitable small outsider primes $r_i$ can "shadow" all semiprime divisors of $u$: every pair $p_a p_b$ divides some $x_i$ with $i \ne a, b$. Toy example: $105 = 3 \cdot 5 \cdot 7$; the multiples $\{30, 42, 70\} \subset U$ shadow the semiprime divisors $\{15, 21, 35\}$.

**Generalization.** A fixed-$\Omega = k$ witness family is vulnerable to a $(k+1)$-move omitted-vertex shadow. Prolonger doesn't kill the witness $d$ itself; it replaces it by a larger multiple $dr$ using a cheap outsider prime.

**Why $\alpha > 1/3$ breaks the attack.** Once small primes up to $n^\alpha$ are resolved (either played or blocked), outsider primes $r_i \le n^\alpha$ become unavailable. The omitted-vertex shadow on large-prime semiprimes would need $r_i > n^\alpha$, but then $x_i = p_j p_k r_i > n^{3\alpha} > n$. So shadowing dies.

### The missing lemma

Pro states it concretely: *"If Shortener can force effective resolution of all primes $\le n^{1/3+\varepsilon}$ in $O(n/\log n)$ turns, then $L(n) = O(n/\log n)$."*

"Effective resolution" = either the prime is chosen by Shortener, or every future legal multiple of it is already killed by the semiprime layer. **This is the one remaining unproved piece.**

### Numerical match

Pro's static check at $n = 10^6, \alpha = 0.45$:
- $|F_\alpha \cap L| = 1153$.
- 85063 upper numbers admissible post-install (all $\Omega \le 2$).
- Predicted $L \log n / n \approx (1153 + 85063) \log(10^6) / 10^6 \approx 1.19$.
- Observed (Codex dynamical probe): $1.17$.

**~2% agreement.** No prior structural argument has matched the empirical trajectory this tightly.

### Claude's independent corroboration

Claude (fresh thread, same brief) independently concludes $L(n) = \Theta(n/\log n)$, with coefficient $c \in [1, 1.3]$, possibly $c = 1$ exactly. Three arguments:
1. $L \log n / n \in [1.15, 1.50]$ across 6 decades — stably bounded.
2. Three structurally different heuristic Shorteners agree to 3 sig figs. Rarely happens at local min.
3. $L \log n / n$ decreasing from 1.29 to 1.17 rules out $\Theta(n \log\log n/\log n)$ with stable constant.

Claude proposes a concrete attack: **two-phase Shortener** — phase 1 adaptive small-prime sieve tracking $B(P)$ + phase 2 $\Omega = 2$ moves drawn from the positive rough-$\Omega \ge 3$ lemma. Amortized-over-many-moves version of the $\Omega = 2$ cover lemma. Aligned with Pro's missing-lemma direction, phrased differently.

### Status and net program state (post Round 12)

**New conjectural tight answer:** $L(n) = \Theta(n/\log n)$. Cross-family consensus (Pro + Claude). Numerical match at 2%. Structural reduction via $F_\alpha$ makes the problem concrete.

**Rigorous bounds unchanged:** $(1 + o(1)) n/\log n \le L(n) \le 5n/16 + o(n)$.

**The single remaining open piece:** small-prime resolution lemma above $n^{1/3}$. This is *not* "Master's thesis open research" anymore — it's a specific lemma with a clear game-theoretic shape.

**Next moves:**
1. Three-way audit of Pro's $F_\alpha$ reduction (non-trivial checks: $F_\alpha$ antichain under all game states, dynamic vs static installation, interaction with existing established results).
2. Round 13 targeted on the small-prime resolution lemma.
3. Follow-up to Pro's Round 12 thread with specific questions (same conversation, builds on existing context).
4. Optional Codex: empirically test whether $\Omega$-grading Shortener's realized $A$ contains an $F_\alpha$-like structure at $n = 10^6$.

**Methodology lesson (recorded in CLAUDE.md):** Round 12's success came from the "factual dump" prompt format — complete failure atlas with specific failure mechanisms, no "Potential Directions" section, let the primary models synthesize patterns across failures. Standing canonical prompt now lives at `prompts/canonical-prompt.md`, updated as new facts arrive.

### Round 12 — four-audit synthesis (2026-04-18)

Four unique audits on Round 12 responses (user pasted one of them three times, giving six pastes but only four distinct audits). Saved at `verify-postresp-12-pro-on-{Falpha-A, Falpha-B, deepthink-A, deepthink-B}.md`.

**On DeepThink's cross-block semiprime batch: 2/2 say BROKEN.** Drop this direction.

Key findings:
- **Antichain violation.** At $n = 10^6$: prime 11 is in the "primes $> n^{1/6}$" batch; $77 = 7 \cdot 11$ is in the "semiprimes $\le n^{1/3}$" batch. $11 \mid 77$, so they're comparable. Pre-game collapse.
- "Cross-block" presumes Prolonger committed to partition.
- 1-to-1 turn economy argument is numerically wrong (2.5× surplus for Prolonger, not deficit).
- Even if patched, ceiling is $O(n\log\log n/\log n)$, not the claimed $\Theta(n/\log n)$.

**On Pro's $F_\alpha$ framework: 2/2 agree structure is sound, specific claims overstated.** Both audits independently re-verified with Python computation.

Structural claims verified:
- $F_\alpha$ is genuinely an antichain. ✓
- Post-install $\Omega(x) \le 2$ and $P^-(x) > y$ follows from $\alpha > 1/3$. ✓
- $\alpha > 1/3$ threshold is strict (not graceful at the boundary).

Numerical corrections found (both audits independently):
- **Post-install admissible count: 83933, not 85063.** Pro conflated "structurally eligible" ($\Omega \le 2$, primes $> y$) with "post-install admissible" (same condition minus $F_\alpha$ itself minus primes killed by multiplication with $Q_\alpha$). Difference: 1058 (elements of $F_\alpha \cap L$) + 72 (primes in $(501, 994]$ killed by multiplication with $Q_\alpha$).
- **Corrected $L \log n/n$ prediction: 1.176 vs observed 1.17 — agreement to 4 decimals.** Pro's stated 1.19 was off due to the overcount; the corrected framework matches simulation essentially exactly.
- $|R_y|$ is 8622 (distinct count), not 9098. The 9098 figure includes multiplicity in the parametrization.
- Max $\Omega = 2$ shield score over ALL legal uppers at $n = 10^6$ is 331 (at $d = 17^2$), not 214 (which was max over $R_y$ alone).

Structural refinements (one or both audits):
- **$Q_\alpha$ batching-resistance is COMPOSITE-only.** A prime move $p > y$ can simultaneously kill $\pi(n/(2p)) - \pi(p-1)$ elements of $Q_\alpha$. At $n=10^6, \alpha=0.45$, prime 503 kills 72 elements. Pro's framing "the semiprime half is not the hard part" is too strong.
- **Omitted-vertex shadowing is rhetorical unification, not structural.** Block-product counter is coprime-block design (different mechanism). $R_y$ is arithmetic sparsity (different mechanism). Shadowing explains fixed-$\Omega$ reservoir failures only.
- **The "missing lemma" is a reformulation, not progress.** If "effective resolution" is strongly formalized, the lemma is nearly tautological — the antecedent is the original open problem. If weakly formalized, it's not provable. Pro's reduction sharpens the location of the difficulty but doesn't shrink it.

Net: the $F_\alpha$ framework is a genuine structural reduction with tighter-than-claimed empirical match, but the path to a proof remains open. "We are close" is not justified by the audits; "we have a sharper restatement of the open problem" is.

### Additional audits (Round 12, continued — user supplied 3 more, bringing unique total to 6 with 1 duplicate)

Three more audits returned after initial synthesis. New unique content:

**On DeepThink (`on-deepthink-C`): third convergent "broken" verdict.** Frames the failure as "static cover vs dynamic game" — emphasizes that while the batch is a mathematically valid static cover of $U$, it collapses when translated to Maker-Breaker dynamics because Shortener secures the TOP layer (semiprimes, composite, blockable by their prime divisors) rather than the BOTTOM (primes, irreducible, unblockable). Structural opposite of $F_\alpha$; that's the core game-theoretic reason. Same antichain violation at 11/77 independently flagged.

**On $F_\alpha$ (`on-Falpha-friendly`): dissent on the numerical claim.** This audit stamped Pro's 85063 as "astonishingly exact" and endorsed omitted-vertex shadowing as the unifying obstruction. However, its Claim 3 arithmetic addressed the wrong quantity — it verified the structurally-eligible superset, not the post-install admissible set. Independent resolution: 85063 − 1058 (already in $F_\alpha \cap L$) − 72 (primes in $(501, 994]$ with antichain conflicts) = 83933. The 83933 number (confirmed by 2/3 $F_\alpha$ audits) is the correct admissible count. Corrected $L\log n/n \approx 1.176$ matches empirical 1.17 better than Pro's stated 1.19.

**Third audit** (duplicate of `on-deepthink-B`): same antichain-violation example, no new content.

### Final cross-audit tally

| Question | Vote |
|---|---|
| Pro's $F_\alpha$ static construction is sound | 3/3 |
| DeepThink's cross-block batch is broken | 3/3 |
| Post-install admissible count = 83933 (not 85063) | 2/3 (1 "validation" audit missed the subtlety) |
| Omitted-vertex shadowing is THE unifying obstruction | 1/3 endorsed, 2/3 called rhetorical |
| Missing lemma is a sharpening/restatement, not progress | 3/3 |
| Conjecture $L(n) = \Theta(n/\log n)$ | 3/3 plausible, 0/3 proved |

**Strategic: the program is sharper but not closer than before.** We've localized the hard part (small-prime dynamic resolution above $n^{1/3}$), got the framework numerically tight to 2 decimals, and ruled out one alternative direction (cross-block). The missing lemma is the actual open problem restated. Still awaiting Pro's follow-up on whether that lemma can be proved or refuted.

### Round 12 follow-up — Theorem 5 (2026-04-18)

Pro's follow-up response (in same thread, in reply to `prompts/followup-12-pro-closeout.md`) saved at `followup-12-pro-closeout-response.md`. Contains:
- Clean formal statement of the $F_\alpha$ reduction as Theorem 1.
- Formal statement of omitted-vertex shadowing as Lemma 3.
- Formal statement of $Q_y$ antichain + composite-batch-resistance as Lemma 4.
- **New rigorous Theorem 5: Resolution against disjoint small-prime carriers.**

**Theorem 5.** Fix $y = n^\alpha$ with $1/3 < \alpha < 1/2$. Assume every composite Prolonger move has all prime factors $\le y$ and pairwise-disjoint supports. Then Shortener can force all primes $\le y$ to be resolved in $O(n/\log n)$ of her own turns; total $L(n) = O(n/\log n)$.

Proof is explicit 3-phase Shortener (primes / higher prime powers / cross-carrier pair semiprimes) with legality and resolution arguments. Move count: $\pi(n) + \pi(y) + \pi(y)^2 = O(n/\log n)$ since $\alpha < 1/2$.

**The universal block-product Prolonger counter is in this class.** So this is the first rigorous proof that $L(n) = O(n/\log n)$ against the specific strongest-known Prolonger adversary.

### Three-way audit of Theorem 5 (2026-04-18)

Three audits ran on `followup-12-pro-closeout-response.md`. Saved at `verify-postresp-followup12-{online-patch-needed, overlap-fatal, essentially-sound}.md`.

**3/3 agree the local proof is sound.** No fatal errors in legality, resolution dichotomy, class-match with block-product, or the move count $\pi(y)^2 = o(n/\log n)$.

**Minor issues flagged:**
- *Wording bug in pure-prime-power case* (audit 1). "Any $x$ divisible by $r$ is comparable with $r^a$" is false in general; becomes true after the single-carrier reduction ($x = r^b$). Cosmetic, not structural.
- *Online execution needs explicit statement* (audits 1 and 3). Proof reads as offline — Shortener "knows" final carrier family $B$. Game is alternating, so phase-2/phase-3 queued moves must stay legal as Prolonger reveals new carriers. All auditors say this patch is routine.
- *Prolonger's prime moves never directly addressed* (audit 3). Any prime Prolonger plays cannot also be in a carrier by antichain; phase 1 handles post-carrier primes. Worth one sentence but doesn't break the result.

**Divergence on overlapping-carriers obstruction** ($\{30, 42, 70\}$ with surviving $105$):
- Audit 1: "Not decisive — Shortener plays $105$." **Incomplete:** playing $105$ resolves $3, 5, 7$ but not $2$ (which divides all three carriers). Prime $2$ would need separate handling, and no simple repair works.
- Audit 2: "Devastating, genuine obstruction. Triples $pqr \le n$ with all primes $\le y$ scale as $n^{3\alpha}$, which exceeds $n$ for $\alpha > 1/3$."
- Audit 3: "Genuine. Naive phase-4 (triple-repair) scales as $n(\log\log n)^2/\log n$, off target by $(\log\log n)^2$."

2/3 audits say overlap is real. Audit 1's rescue is incomplete as demonstrated above. Overlapping carriers remain a genuine open obstruction.

### Promotion — Theorem 5 to Established

Per CLAUDE.md promotion rule ("≥ 2 informal verifiers agree it's sound"):
- **Promoted:** Theorem 5 (Resolution against disjoint small-prime carriers) and its corollary $L(n) = O(n/\log n)$ against the universal block-product Prolonger.
- **Status:** Established, audit-converged (3/3), Aristotle not yet submitted.
- **Caveats noted:** wording polish in pure-prime-power case; explicit online-execution statement needed for a fully polished writeup.
- **Not promoted:** full $L(n) = O(n/\log n)$ for all Prolonger strategies — overlapping-carriers + blocked-large-primes cases remain open.

### Refined open question (post Theorem 5)

The central open question now sharpens specifically to:

> **Does Theorem 5 extend to overlapping-carrier Prolonger strategies?**

And the secondary case:

> **Blocked-large-primes repair:** can Shortener efficiently resolve mixed pairs $pq$ with $p \le y < q$ within $O(n/\log n)$ moves, beyond the naive pair-count which overshoots by $\log\log n$?

If both extend, $L(n) = O(n/\log n)$ is proved in full generality — resolving Erdős's question with the sharpest possible asymptotic. If either fails, we learn something structural about why.

### Net program state (post-Theorem 5)

- **Rigorously proved:** $(1 + o(1))n/\log n \le L(n) \le 5n/16 + o(n)$ (general). $L(n) = O(n/\log n)$ against the disjoint small-prime carrier class (includes universal block-product).
- **Conjectural:** $L(n) = \Theta(n/\log n)$ for all Prolonger strategies. Cross-family consensus.
- **Specific open question:** extend Theorem 5 to overlapping carriers and/or handle blocked large primes.
- **Structural insight:** the block-product counter is NOT the hard case. Overlapping carriers and mixed-prime-size combinations are the real residual difficulty.
- **Methodology:** canonical-prompt + factual-dump approach has produced the single biggest advance of the program; keep using it.

**Status update to canonical-prompt.md:** all numerical corrections, $Q_\alpha$ caveat, antichain-violation concrete counterexample for DeepThink's approach, and the $\alpha > 1/3$ strictness have been folded into the canonical prompt as factual entries in Established / Ruled Out / Numerical Evidence. Future researcher rounds will see these without having to re-verify.

### Round 12 audit synthesis (2026-04-18)

Two audits each of Pro's $F_\alpha$ response and DeepThink's cross-block response. Full text at `verify-postresp-12-pro-on-Falpha-{A,B}.md` and `verify-postresp-12-deepthink-audit{1,2}.md`. Claude's response was not audited separately (subsumed by the $F_\alpha$ / DeepThink audits per curator decision).

**On Pro's $F_\alpha$ framework — survives with corrections:**

Both audits agree:
- $F_\alpha$ is genuinely an antichain. ✓
- Post-$F_\alpha$ "$\Omega \le 2$ and all primes $> y$" is a correct *necessary* condition. ✓
- $Q_\alpha$ composite-batching resistance holds via the three-case proof. ✓
- The missing lemma is a valid reduction (conditional). ✓

Both audits identify four genuine issues:

1. **Numerical slip.** Pro wrote "85063 post-install admissible count" — this is the *structurally eligible* count (integers with $\Omega \in \{1,2\}$ and primes $> y$), not the *actually admissible* count. Correcting: 85063 − 1058 (elements already in $F_\alpha \cap L$) − 72 (primes $p > y$ that divide some $pq \in F_\alpha \cap L$) = **83933**. Predicted $L \log n/n = (1153 + 83933) \log(10^6)/10^6 ≈ 1.1755$. Observed 1.174. **Match to 0.1%**, not 2%. The corrected numerics are tighter than Pro's stated version.

2. **Prime moves batch-kill $Q_\alpha$.** Pro claimed "the only place where real batching survives is the small-prime layer." But a single prime move $p > y$ kills every semiprime $pq \in Q_\alpha$ with $q$ prime and $pq \le n/2$ simultaneously. Count: $\sim n^{1-\alpha}/\log n$ elements per prime move. At $n = 10^6, \alpha = 0.45$: prime 503 alone kills 72 members of $Q_\alpha$. So $Q_\alpha$ is composite-batching-resistant but prime-batching-*cooperative*. This is consistent with Shortener's strategy (Shortener plays small primes) but weakens the "semiprime half is easy" framing.

3. **Omitted-vertex shadowing is overstated as universal unifier.** The block-product counter is pigeonhole over pairwise-coprime blocks (not shadowing). $R_y$ is arithmetic sparsity (not shadowing). Static carrier capacity is density/pigeonhole (not shadowing). Only carrier recycling is genuinely shadowing-style. The real cross-failure pattern is weaker and more accurate: **"every failed approach has a specific prime range where Prolonger has free play."**

4. **Missing lemma is close to tautological.** Under strong formalization ("for every prime $p \le y$, no future legal move contains $p$") the lemma is trivially true but "effective resolution" is doing almost all the work and equals the original problem. Under weaker formalization, the lemma isn't proved. *The reduction is a reformulation, not progress.*

**On DeepThink's cross-block semiprime batch — fatally broken:**

Both audits identify the critical bug:

**The batch is not an antichain.** Shortener plays "all primes $q > n^{1/6}$" AND "all cross-block semiprimes $\le n^{1/3}$." Concrete counterexample at $n = 10^6$ ($n^{1/6} = 10, n^{1/3} = 100$): batch contains 11 (prime > 10) AND 77 = 7·11 (semiprime ≤ 100). Since $11 | 77$, the two are comparable. Not a legal antichain. **The proposal doesn't even define a valid Shortener strategy.**

Other breaks (any would be sufficient):
- "Cross-block" presumes Prolonger committed a block partition.
- 1-to-1 turn economy is numerically wrong ($k \le 5$, not 6; and even with $k \le 5$, Prolonger has factor-2.5 surplus blocking capacity).
- Even if patched, the rough-$\Omega \ge 3$ lemma gives $O(n \log\log n/\log n)$, not $O(n/\log n)$. Off by $\log\log n$.
- Coverage of $R_y$-type elements not demonstrated.

DeepThink's response is dead; not salvageable. The one piece worth remembering: **Prolonger's block-product $x_i$ is coprime to cross-block semiprimes by construction** — a genuine structural fact that might play a role in future arguments.

### Net Round 12 status (post-audit)

**Cross-family consensus on the answer** remains strong: $L(n) = \Theta(n/\log n)$, supported by Pro, Claude, DeepThink independently (conclusion), by numerical trajectory, and by the (corrected) $F_\alpha$ numerical match at 0.1%.

**Structural advance is real but limited.** $F_\alpha$ is a genuinely new antichain family; the composite-batching resistance of $Q_\alpha$ is a new combinatorial fact; the α > 1/3 threshold is a clean phase transition. These are publishable on their own.

**The proof gap has not shrunk.** The "missing lemma" audits describe as "essentially a reformulation, not progress." To prove $L(n) = O(n/\log n)$ via this framework we still need to show Shortener can dynamically install $F_\alpha$ against adversarial Prolonger — this *is* the original problem in disguise.

**Rigorous bounds unchanged:** $(1 + o(1)) n/\log n \le L(n) \le 5n/16 + o(n)$. Everything tighter is conjectural.

**Pending:** Pro's follow-up on the missing lemma (close-out attempt via theorem-proof note). Whether Pro produces a concrete proof attempt or returns "I cannot close this" decides the next step.

**Secondary targets (if the $\Omega$-grading fails):**
- **Different invariant replacing $\sum 1/p$** — e.g., weighted-by-surviving-multiplicity $H_D$, fractional LP-dual potentials.
- **Pairing / Maker-Breaker strategies** — completely untried; the $5/24$ cover structure suggests a clean pairing may exist.
- **Primorial-anchor Shortener** — untested as Shortener (only as Prolonger). Highly composite lower elements may beat small-prime prefixes.

**Subsidiary sub-questions (inherited from prior rounds, lower priority):**
- Repair of the Round 5 concatenation schedule ($\varepsilon_k$ slower than $e^{-k/e}$). Minor; not load-bearing after Round 9/10 pivot.
- Sharper invariants $\tilde\sigma(D, n, \delta)$ and $H_D(T; n)$ as obstruction-space refinements.
- Primorial-anchor Prolonger at $n = 10^5$.
- Full optimal-first-move frontier via the corrected exact-minimax solver.

**Still formally open but increasingly implausible per the data:**
- $L(n) = \Theta(n)$ with a positive constant.
- $L(n) = o(n/\log n)$.

## Round 13 (2026-04-18) — rank-3 extension established; central conjecture reopens

Variance-framed dispatch: four researcher prompts across Pro (extend Theorem 5, same thread), a second Pro thread (fresh open attempt), DeepThink (fresh open), and DeepThink (contrarian/LP-dual). Two substantive outputs and one lower-bound proposal survived informal audit.

### Theorem 6 — rank-$\le 3$ extension of Theorem 5 (Established)

**Statement.** Fix $\alpha \in (1/3, 1/2)$ and $y = n^\alpha$. Suppose every composite Prolonger move is (i) squarefree, (ii) supported on primes $\le y$, (iii) of rank $\le 3$ (i.e., at most three distinct prime factors). Then Shortener has a strategy achieving $L(n) = O_\alpha(n / \log n)$.

**Proof (four phases).** Let $B$ be the set of primes appearing in composite Prolonger moves. Shortener plays (1) every legal prime; (2) $p^2$ for every $p \in B$ whose prime was not already played; (3) every legal squarefree semiprime on $B$; (4) every legal squarefree triple on $B$. Survivor induction on $|\operatorname{supp}(x)|$ closes the argument — any surviving $x$ with $|\operatorname{supp}(x)| \ge 4$ contains a triple $pqr \mid x$ which was either played in phase 4 or blocked earlier.

**Phase-4 count (load-bearing).** $T_\alpha(n) := \#\{p < q < r \le y : pqr \le n\} = O_\alpha(n / \log n)$, via the split $pq \le n^{1-\alpha}$ (trivial) vs. $pq > n^{1-\alpha}$ (forces $p > n^{1-2\alpha}$, and the Mertens sum $\sum_{n^{1-2\alpha} < p < q \le y} 1/(pq) = O_\alpha(1)$). Numerical check at $n = 10^6$, $\alpha = 0.45$: 35,415 triples $\approx 0.489 \cdot n/\log n$. Constant blows up as $\alpha \to 1/2$ but stays bounded for any fixed $\alpha < 1/2$.

**Audit status.** 3/3 audits agree on local soundness of phases 2, 4, and the survivor induction. Full text at `verify-postresp-13-rank3-audit-{2,4,6}.md`. Aristotle not yet submitted.

**Resolution of the $\{30, 42, 70\}$ obstruction.** The prior "pair-repair fails" framing was not a genuine rank-3 obstruction. Shortener plays 11 in phase 1, the four squares in phase 2, and 105 in phase 4 — every dependency is captured without any cross-rank gap.

### Circuit Lemma + Simplex Obstruction (Established, with fixes)

**Circuit Lemma.** Let $\mathcal{C} \subseteq 2^{\mathcal{P}}$ be the family of supports of squarefree Prolonger carriers. Call $T \subseteq \mathcal{P}$ a *legal circuit* if (1) $T$ is incomparable with every $S \in \mathcal{C}$, and (2) every proper subset $U \subsetneq T$ is contained in some $S \in \mathcal{C}$. Then $m_T := \prod_{p \in T} p$ is a legal move, and any *legal* move comparable with $m_T$ must be a multiple of $m_T$.

*Proof-text fix from audits (3/3).* The original exposition wrote "carrier divides $x$"; the correct direction is "$x$ divides carrier" (since both are squarefree and $\operatorname{supp}(x) \subseteq \operatorname{supp}(C_S)$). Conclusion ($x$ illegal because it divides a played carrier) is unchanged.

**Simplex Obstruction.** For the first $t$ odd primes $q_1 < \cdots < q_t$ with $Q_t := \prod q_i \le n$, define $C_i := 2 Q_t / q_i$ (support $S_i = \{2\} \cup (T \setminus \{q_i\})$ with $T = \{q_1,\ldots,q_t\}$). The $C_i$ form a squarefree antichain, $T$ is a legal circuit for $\{S_1,\ldots,S_t\}$, and $Q_t$ is legal against $\mathcal{C}$. Maximal $t(n)$ with $Q_t \le n$ is $t(n) = (1 + o(1)) \log n / \log\log n$.

**Scope claim (narrowed from "any extension" to bounded-rank local repair, 2/3 audits).** The right reading is: no theorem of the form "from any overlapping-carrier position, Shortener can resolve with moves of rank $\le k$" holds for any fixed $k$, nor for $k = o(\log n / \log\log n)$. Non-repair proofs (density, entropy, LP duality, probabilistic) are not ruled out.

**Hidden hypothesis (Audit 5).** The simplex is legal only if none of the $q_i \in T$ were played earlier as primes by Shortener. Reachability check: against eager phase-1 play, Prolonger can always pivot to fresh prime pools, so the simplex IS reachable online, and the obstruction bites against natural Resolution-Theorem-style extensions.

**Compatibility with $O(n/\log n)$.** "Playing $Q_t$ clears the circuit" means it eliminates the circuit witness (by the Circuit Lemma, any future legal move comparable with $Q_t$ must be a multiple of $Q_t$, and there are typically none in $(Q_t, n]$), not that it dominates the $C_i$. Audit 1 flagged this phrasing as misleading; the underlying budget argument is fine — disjoint simplex families accumulate to at most $n^\alpha \log\log n / \log^2 n = o(n/\log n)$ circuit-capture moves.

**Audit status.** 3/3 audits sound after the directional-error fix. Full text at `verify-postresp-13-simplex-audit-{1,3,5}.md`.

### DeepThink-1 loglog-tight construction — candidate lower bound, under empirical test

**The claim.** A three-phase Prolonger protocol (block-build, complete-graph on $B$, block large primes $q \in (n^{5/6}, n/2]$ via $p^* q$) forces $L(n) = \Theta(n \log\log n / \log n)$. Full text at `researcher-13-deepthink-loglog-tight.md`.

**Status.** Not refuted. 3/3 Package-A audits agree the construction lives *outside* Theorem 6's class (Phase 3 plays $p^* q$ with $q > n^{5/6} \gg y$), so there is no direct contradiction. Audit 6 (user-flagged as most trustworthy, longest numerical analysis) verified:
- The Mertens integral $\int_{n^{5/6}}^{n/2} (n/q) / (\log(n/q) \log q) \, dq = \Theta(n \log\log n / \log n)$.
- The 1-to-1 racing argument — optimal Shortener plays large primes $q$ directly, giving $|Q_{\text{blocked}}| = \Theta(n / \log n)$.
- The $qM$-batching lockout, exhaustively across six cases ($M = 1$, single $p \in B$, pair in $B$, $p^2$, padding prime, medium prime).
- The construction appears internally consistent modulo one likely typo ("$k = \pi(n^{1/3})$ blocks" should read $\pi(n^{1/6})$ — one block per small prime).

**Audit 2 caveat.** The jump from "constant fraction of $q$'s blocked" to "prefix-density lower bound on $B$" is not proved — DeepThink's argument needs the blocked small primes to have positive harmonic mass on every scale $\le n^{1/6}$, not just a constant density in aggregate. That gap is the main analytic weakness.

**Empirical falsifier dispatched.** Codex task at `phase3/CODEX_TASK_deepthink_protocol.md` simulates the full protocol at $n \in \{10^3, \ldots, 10^6\}$ and measures whether $L \log n / (n \log\log n)$ stabilizes (DeepThink-1 correct) or decays (DeepThink-1 wrong, $\Theta(n/\log n)$ holds).

### Codex empirical run on DeepThink-1 protocol (phase3, 2026-04-18)

Ran DeepThink-1's 3-phase Prolonger protocol at $n \in \{10^3, 3 \cdot 10^3, 10^4, 3 \cdot 10^4, 10^5, 3 \cdot 10^5, 10^6\}$ against three Shortener strategies. Implementation at `phase3/deepthink_protocol.py` (unit-tested, antichain + maximality assertions on every run). Raw data at `phase3/deepthink_protocol.csv`.

**Key trajectories at the two n-extremes of interest ($10^4$ → $10^6$):**

| Shortener | $L \log n / n$ | $L \log n / (n \log\log n)$ |
|---|---|---|
| `S_race` (race large primes first) | 1.205 → 1.300 (+7.9%) | 0.543 → 0.495 (−8.8%) |
| `S_smallest_legal_prime` (baseline) | 1.133 → 1.200 (+5.9%) | 0.510 → 0.457 (−10.4%) |

If true scaling is $\Theta(n \log\log n / \log n)$, $L \log n / n$ should grow like $\log\log n$ over two decades — an 18% rise. Observed: 5.9% for the better Shortener. **That's 3× slower than the loglog prediction.**

**Critical nuance: `S_race` is not optimal.** At every $n$, `S_smallest_legal_prime` achieves a strictly lower $L$ (by 6–8%). Since $L(n) = \min$ over Shortener, the relevant trajectory is the *best* Shortener's. Codex's own top-line verdict ("consistent with $\Theta(n \log\log n / \log n)$") reflects `S_race`'s trajectory specifically; the better Shortener's trajectory is ambiguous between $\Theta(n/\log n)$ with a secondary loglog term and a slow-approaching $\Theta(n \log\log n / \log n)$.

**Mechanism mismatch.** DeepThink-1's 1-to-1 racing argument predicts both $|B_{\text{blocked}}|/\pi(y_s) \to 1/2$ and $|Q_{\text{blocked}}|/(\pi(n/2) - \pi(y_L)) \to 1/2$. Observed (`S_race`): $|B_{\text{blocked}}|/\pi(y_s) = 1.0$ everywhere (Prolonger wins the small-prime race unanimously), $|Q_{\text{blocked}}| \to 0.5$ as predicted. For `S_smallest_legal_prime`, $|B_{\text{blocked}}|/\pi(y_s)$ varies 0.5–0.67 and $|Q_{\text{blocked}}|$ drops to 0.65. So Shortener strategy materially shifts installation rates, consistent with the interpretation that *online* Shortener can disrupt installation even though DeepThink-1's static analysis assumed they can't.

**Scale caveat.** At $n = 10^6$, $y_s = \lfloor n^{1/6} \rfloor = 10$, so $|B| \le 4$ (only primes $\{2, 3, 5, 7\}$). The "complete graph on $B$" has 6 edges. Any definitive asymptotic signature requires $n \ge 10^7$–$10^8$ where $|B|$ reaches 7–10.

**Interim read.** Codex data does not cleanly falsify DeepThink-1, nor cleanly confirm it. The data is consistent with: $L(n) = \Theta(n/\log n)$ if the optimal Shortener prevents installation online; $L(n) = \Theta(n \log\log n / \log n)$ if installation is unavoidable. Decision hinges on the online question, not on the small-$n$ trajectory.

### Pro #2 continuation response — static post-hoc obstruction on case (b) (2026-04-18, pending audit)

Pro #2 (same thread as Theorem 6) responded to the continuation prompt with a rigorous **static post-hoc obstruction theorem** on case (b). Full text at `researcher-13-pro2-continuation-response.md`.

**Theorem (Pro #2, pending 3-way audit).** Fix $\alpha < \beta < \gamma < 1/2$ and let $Q = \{q \text{ prime} : n^\beta \le q \le n^\gamma\}$. Define the carrier family
$$\mathcal{E}_Q = \{2ab : a, b \text{ odd distinct primes}, 2ab \le n\} \cup \{2qa : q \in Q, a \text{ odd prime}, a \ne q, 2qa \le n\}.$$
Each carrier is squarefree with rank exactly 3, so $\mathcal{E}_Q$ is an antichain. Define
$$\mathcal{M}_Q = \{qab : q \in Q, a, b \text{ odd distinct primes}, n/3 < qab \le n\}.$$
Then $|\mathcal{M}_Q| \gg_{\beta, \gamma} n \log\log n / \log n$, and after $\mathcal{E}_Q$ is installed as a prefix, every $m \in \mathcal{M}_Q$ is an *isolated maximal* legal move — legal, with no legal proper divisor or proper multiple. Hence the residual game requires at least $|\mathcal{M}_Q|$ further moves.

**Proof mechanism.** For $m = qab$, $T = \{q, a, b\}$ is a legal circuit with respect to $\mathcal{E}_Q$'s support family (each carrier contains 2, but $T$ doesn't; each proper subset of $T$ is contained in one of the three carriers $2qa, 2qb, 2ab$). The Circuit Lemma (Round 13) then gives $m = m_T$ legal. Proper divisors of $m$ have supports $\subsetneq T$ and are comparable with a carrier. Proper multiples of $m$ in $[2, n]$: the only candidate is $2m = 2qab$ (larger multiples exceed $n$ since $m > n/3$), which contains $2qa \in \mathcal{E}_Q$ and is illegal. Count: $|\mathcal{M}_Q| \gg (n/\log n) \cdot (\sum_{q \in Q} 1/q) \cdot (\sum_{a \le n^\delta} 1/a) \asymp (n/\log n) \cdot O(1) \cdot \log\log n$.

**Numerical checks (Python, per Pro).** At $n = 10^6$: the unrestricted $2pqr$ cone yields 25,070 isolated maximal odd-4-prime moves in $(n/3, n]$; the fiber construction with $q \in [200, 500]$ yields 7,209 isolated $qab$-moves.

**What this proves (pending audit).** A Resolution-Theorem-style *post-hoc* extension to case (b) is ruled out rigorously. Any proof of $L(n) = O(n/\log n)$ covering case (b) must be genuinely **online** — Shortener must prevent $\mathcal{E}_Q$-style infrastructure from being installed in the first place.

**What this does NOT prove.** A lower bound on $L(n)$. The theorem assumes $\mathcal{E}_Q$ is installed as a prefix. Whether Prolonger can force this installation online against optimal Shortener is a separate reachability question. The $|\mathcal{E}_Q|$ itself scales as $\sim n \log\log n / \log n$ for the $\{2ab\}$ family alone, so the budget-to-install constraint is self-referential: the theorem bites only if $L(n)$ is already large enough to support installing $\mathcal{E}_Q$.

**Consistency with Codex.** Direct alignment: the isolated $m = qab$ moves Pro's theorem identifies are exactly the "forced atomic repairs" DeepThink-1 counted in the $qM$-batching-lockout argument. The `S_race` trajectory (which permits installation) matches Pro's residual count; `S_smallest_legal_prime` (which preempts small primes and disrupts the $\mathcal{E}_Q$ family by playing primes that block its carriers) matches a reduced residual. Pro's theorem is the rigorous post-hoc version of DeepThink-1's informal argument.

### Open Question (post Round 13, post-continuation)

**Case (a) — squarefree rank-$\ge 4$ overlap.** Still open. Extend Theorem 6 to carriers of support rank $\ge 4$, up to the Simplex-Obstruction ceiling $\log n / \log\log n$. Bounded-rank local repair is insufficient per the Simplex Obstruction; circuit-capture techniques are candidate.

**Case (b) — blocked large primes.** Post-hoc resolution is ruled out (pending audit of Pro's continuation theorem). **The only remaining route to $L(n) = O(n/\log n)$ in case (b) is online: Shortener must prevent $\mathcal{E}_Q$ from being installed.** Whether this is possible is the new central question.

### Central conjecture — the online question

The question is no longer "post-hoc $O(n/\log n)$ vs post-hoc lower bound." It's:

**Can Shortener online-prevent $\mathcal{E}_Q$-style installation?**

- **If yes** (optimal Shortener disrupts installation): $L(n) = \Theta(n/\log n)$. Codex's `S_smallest_legal_prime` trajectory is suggestive but not conclusive.
- **If no** (Prolonger forces installation against any Shortener): $L(n) = \Theta(n \log\log n / \log n)$. Pro's post-hoc residual is the rigorous content, and $\mathcal{E}_Q$ is witness to reachability.

This is a cleanly posed game-theoretic question. Rigorous bounds unchanged: $(1 + o(1)) n/\log n \le L(n) \le 5n/16 + o(n)$.

### Sparse-subset closeout — cross-family established (2026-04-18)

Three independent derivations from the same canonical prompt (two original-prompt Pro dispatches + one DeepThink, all triggered by the four-way variance-framed send) reach the identical theorem:

**Theorem (sparse-subset realization, 3/3 independent proofs).** Fix $0 < \beta < \gamma < 1/2$, $Q = \{q \text{ prime} : n^\beta \le q \le n^\gamma\}$, $0 < \delta < \min(\beta, (1-\gamma)/2)$, $A = \{a \text{ odd prime} : a \le n^\delta\}$. Then $S = S_{QA} \cup S_{AB} \cup S_{QB}$ defined by
- $S_{QA} = \{2qa : q \in Q, a \in A\}$
- $S_{AB} = \{2ab : a \in A, b \text{ prime}, \exists q \in Q \text{ with } n/3 < qab \le n\}$
- $S_{QB} = \{2qb : q \in Q, b \text{ prime}, b \ne q, \exists a \in A \text{ with } n/3 < qab \le n\}$

has $|S| = O_{\beta,\gamma,\delta}(n/\log n)$ and isolates $\gg_{\beta,\gamma,\delta} n \log\log n / \log n$ distinct $m = qab$ as isolated maximal legal moves.

Size decomposition: $|S_{QA}| = o(n/\log n)$ since $\gamma + \delta < 1$; $|S_{AB}| = O(n^{1-\beta} \log\log n / \log n) = o(n/\log n)$ since $\beta > 0$; $|S_{QB}| = O_{\beta,\gamma}(n/\log n)$ via Mertens on $\sum_{q \in Q} 1/q \asymp 1$.

Isolation via Circuit Lemma on $T = \{q, a, b\}$ with three required carriers $\{2qa, 2qb, 2ab\} \subseteq S$. Proper multiple $2m = 2qab$ is blocked by $2qa \in S_{QA}$.

Cross-family numerical agreement: at $n = 10^6, (\beta, \gamma, \delta) = (0.40, 0.49, 0.20)$, $|R| = 14{,}521$, $|S| = 7{,}910$, $|S|/|R| = 0.545$ — both independently-computing derivations match. Greedy min-cover (from prior empirical run) beats analytic construction by factor $\sim 1.6$, giving $|S|/|R| = 0.339$ at $n = 10^6$.

Sub-question (c) fully resolved.

### Triangle-family reachability (a) — refuted online via multiplicative star-throttle (2026-04-18, pending audit)

**Result (Pro-family, one response).** The sparse-$S$ triangle family above is NOT dynamically forceable. Shortener has an online strategy that caps per-$q$ captured reciprocal mass at $O(1)$, not $\log\log n$, killing the critical Mertens factor.

**Mechanism.** Pre-reserve small-prime blocks $C_1, \ldots, C_J$ with $\prod_{a \in C_j} a \le n^{1-\gamma}/10$ per block (so $2 \prod C_j \le n/5$) via the moves $R_j := 2 \prod_{a \in C_j} a$. Then when Prolonger plays a carrier $2qa$ with $a \in C_j$, Shortener responds with the multiplicative *star-throttle* move
$$T(q, C_j, a) := 2q \prod_{r \in C_j \setminus \{a\}} r.$$

Because $2qr \mid T$ for every $r \in C_j \setminus \{a\}$, this single Shortener move makes every future carrier $2qr$ with $r \in C_j$ permanently illegal. So for each $q$ and each block $C_j$, Prolonger captures at most one $(q, a)$ carrier — the first $a \in C_j$ he plays.

Per-$q$ reciprocal mass captured: $\sum_{j} 1/\min(C_j) \ll \sum_j 1/(j \log n) = O(1)$ (blocks $C_j$ start at size $\gg j \log n$). Sum over $Q$: $\sum_{q \in Q} 1/q \cdot O(1) = O_{\beta,\gamma}(1)$ by Mertens.

**Consequence.** Residuals forced by this $S$-family: $\sum_{q, a \text{ captured}} n/(qa \log n) = O(n/\log n) \cdot O(1) = O_{\beta,\gamma,\delta}(n/\log n)$, not $\gg n \log\log n / \log n$. Sub-question (a) is **false for the triangle-$S$ family specifically**. Sub-question (b) is **true** for this regime.

**Caveat (stated by the Pro).** This does not rule out *different* lower-bound mechanisms using high-rank circuit carriers or alternative constructions.

### Upper-half fan lower bound — claimed, pending audit (2026-04-18)

**Result (different Pro, pending audit).** An alternative Prolonger construction bypasses the triangle-family refutation and appears to give $L(n) \ge c_\delta \cdot n \log\log n / \log n$ for every fixed $\delta \in (0, 1/2)$, ruling out $L(n) = O(n/\log n)$.

**Construction.** Targets are upper-half rank-2 moves: $2ab \in (n/2, n]$ with $a \in \mathcal{A} = \{$primes $\le n^\delta\}$, $b \in I_a = (n/(4a), n/(2a)]$ prime.

**Key structural insight.** Because targets $2ab > n/2$, they have no proper multiples $\le n$. So Shortener cannot attack from above via any composite move. Any Shortener move comparable with a target must divide it; proper divisors of $2ab$ are $\{1, 2, a, b, 2a, 2b, ab\}$. After activation ($a, 2a$ illegal) and first move ($2$ illegal), only $b, 2b, ab$ remain as destructive options. This blocks the multi-block / star-throttle attack that refuted the triangle family.

**Proof sketch.** Two phases:

*Phase 1 (Activation).* Prolonger plays smallest-first greedy: pick smallest not-yet-touched not-yet-killed $a \in \mathcal{A}$, play any legal $2ab$ with $b \in I_a$. Such a $b$ always exists ($|I_a \cap \mathbb{P}| \gg n^{1-\delta}/\log n$ vs Shortener's activation-phase budget $O(n^\delta/\log n)$ with per-move damage $O(n^\delta/\log n)$). Pairing argument: each Shortener kill of $a'$ matches a prior Prolonger activation of $a \le a'$. Result: $\sum_{a \in \mathcal{A}_0} 1/a \ge (1/2 + o(1)) \log\log n$.

*Phase 2 (Capture).* Bipartite graph $G$: left $\mathcal{A}_0$, right primes, edges $(a, b)$ with $b \in I_a$. $|E(G)| \gg n \log\log n / \log n$. Activation damage $O(n^{2\delta}/(\log n)^2) = o(|E|)$ for $\delta < 1/2$. Capture phase: max-degree-greedy Prolonger picks highest-live-degree uncaptured $b^*$, plays $(a, b^*)$. Shortener's harm: right-vertex kill of uncaptured $b'$ (degrees $d(b') \le d(b^*)$ by max-rule, giving $D \le C$), or individual edge kill $ab$ (1-to-1). Accounting: $C + X \ge |E|/2 \gg n \log\log n / \log n$.

**Pending rigorization.** Formalize $D \le C$ cumulatively; verify exhaustiveness of Shortener moves (check rank-$\ge 3$ legal moves containing targets' primes); tight activation-damage bound; explicit $c_\delta$.

**If rigorous:** rules out $L(n) = O(n/\log n)$ unconditionally, leaving the matching upper bound $L(n) = O(n \log\log n / \log n)$ as the remaining central question. The existing $5n/16$ upper bound is too weak.

### DeepThink full-resolution claims (2026-04-18, non-rigorous quantitatively)

Two DeepThink responses claim resolution $L(n) = \Theta(n \log\log n / \log n)$ via a Maker-Breaker "Topological Shielding" argument on the triangle family: Prolonger plays $30$ on turn 1 (outlawing $\{2, 3, 5, 6, 10, 15\}$), then shields vertices $v \in V$ via $6v$ carriers, then installs edges via $2qa / 2ab / 2qb$. Claims $(1/2)^2 = 1/4$ (v2) or $(1/2)^6 = 1/64$ (critique response) fraction of triangles survives isolated.

Quantitative steps are heuristic, not rigorous: the 50%-per-layer Maker rate is not tied to a specific Maker-Breaker theorem; the $(1/2)^k$ independence assumes faces are independent when they are correlated (a Shortener kill on $q$ destroys three faces of the triangle $(q, a, b)$ simultaneously); the turn-economy argument has subtle circularity.

Two genuine new insights emerged and are now established:
- **LCM Obstruction.** For distinct residuals $m_1, m_2$ in $(n/3, n]$ with supports in $Q \cup A \cup B$, $\text{LCM}(m_1, m_2) > n$. So Shortener cannot attack two distinct residuals via a common multiple from above.
- **Multi-Block Paradox.** Shortener playing $M = 2q a_1 \cdots a_k$ does not kill target residual $q a_i b$: $M$ and $q a_i b$ are incomparable (since $b \notin \text{supp}(M)$ prevents $M \mid q a_i b$ from above, and $q a_i b$ contains $b \notin M$ preventing $q a_i b \mid M$ from below). $M$ serves instead as a shielding carrier with the same Circuit-Lemma role as Prolonger's $2qa_i$ would.

Both insights are directly used by the upper-half fan argument above (the upper-half targets are specifically chosen to inherit the LCM-obstruction-style immunity).

### Central conjecture — the matching upper bound

If the upper-half fan argument rigorizes, the lower bound $L(n) \ge c_\delta \cdot n \log\log n / \log n$ is established and $L(n) = O(n/\log n)$ is ruled out. The central question becomes:

**Does $L(n) = O(n \log\log n / \log n)$ hold?** I.e., does Shortener have a strategy achieving the matching upper bound?

If yes, $L(n) = \Theta(n \log\log n / \log n)$ — the sharp rate.

If not (i.e., $L(n) = \omega(n \log\log n / \log n)$ but still $o(n)$), there is an intermediate rate between $n \log\log n / \log n$ and $n$ that we have not yet characterized.

Existing upper bound $5n/16 + o(n)$ is $\Theta(n)$, matching the general case but giving no insight into the log-scale rate. No Shortener strategy currently achieves better than this unconditionally.

**Pending:**
- Pro #2 thread follow-up (rigorize the upper-half fan argument; attempt matching upper bound optionally).
- Cross-family verification prompt (sent to the other Pro thread and both DeepThink threads): verify the upper-half fan, identify gaps, attempt matching upper bound if verified.
- No further Codex runs or audit dispatches pending these responses.

## Round 13 closeout (2026-04-18, post-Phase 3c)

### Fixed-rank hierarchy established (T2)

Three independent fresh derivations (2 Pro-style shadow-capture / divisor-shadow lemma, 1 DeepThink-style two-phase hypergraph+fiber capture) agree on:

**Theorem (rank-$h$ upper-half fan).** For every fixed $h \ge 1$,
$$L(n) \ge c_h \cdot \frac{n(\log\log n)^h}{\log n}, \qquad c_h \asymp \frac{2^{-(2^{h+1}-2)}}{h!}.$$

Construction: targets $\{A_S \cdot b : |S| = h, b \in J_S \cap \mathbb{P}\} \subseteq (n/2, n]$ with $A_S = \prod_{a \in S} a$ and $J_S = (n/(2A_S), n/A_S]$. Proof via divisor-shadow lemma (Maker-Breaker potential tracking $D = 2^{h+1} - 2$ divisor coordinates).

**Consequence.** $L(n) \ne O(n(\log\log n)^C/\log n)$ for every fixed $C$.

**Rank-4 collapse argument — REFUTED.** The claim that Shortener's lateral $a_1 b$ kills many rank-4 targets ignored auto-shielding: once Prolonger plays any $2 a_1 a_y b$, $a_1 b$ becomes illegal (divides the target). 2-vs-1 protection economy generalizes.

**Multiplier Lock $\Theta(n)$ claim (DeepThink) — REFUTED.** Three failure modes: (1) direct large-prime kill not blocked, (2) volume-collapse reasoning inverted, (3) factorial ceiling in raw count reintroduces $2^{-2^k}$ shielding cost when scaling $k$.

### Slow-growth optimization (T2, 1 full derivation + 2 conditional)

Taking $h = \lfloor \log_2 \log\log\log n \rfloor$ balances $H^h/h!$ against $2^{-(2^{h+1}-2)}$ shielding loss:
$$L(n) \ge \frac{n}{\log n} \exp\!\left(\bigl(\tfrac{1}{\log 2} + o(1)\bigr) \log\log\log n \cdot \log\log\log\log n\right) = \frac{n}{(\log n)^{1-o(1)}}.$$

Strictly $o(n)$. Strictly stronger than fixed-$C$ bounds.

### Structural ceiling (T1, arithmetic)

Raw target count at rank $h$ peaks at $h \approx H = \log\log n$ with $|\mathcal{T}_h|_{\max} \sim n/\sqrt{2\pi \log\log n} = o(n)$. Linear-scale mass distributed over the window $h = H \pm O(\sqrt{H})$; no single rank captures $\Theta(n)$.

### Cross-family convergence — dichotomy undecidable from established machinery

Three independent fresh dispatches (Pro conservative, Pro sharpened, Claude-style with exact-minimax up to $n=31$) converge on: the established facts do **not** imply $L(n) = \Theta(n)$ or $L(n) = o(n)$. Decisive missing lemmas:

- **Uniform multi-rank Prolonger shielding theorem.** Single potential coupling fan ranks across window $h = \log\log n \pm O(\sqrt{\log\log n})$ with $O(1)$ total game-theoretic loss. Would yield $L(n) = \Omega(n)$.
- **Multi-rank Shortener compression theorem.** Shortener strategy beating $5/16$ by exploiting fan-target structure across all ranks simultaneously. Would yield $L(n) = o(n)$.

### Phase 3c empirical audit (Codex, 2026-04-18)

Three probes of the fan hierarchy at $n \in [10^4, 10^7]$:

**Probe A (inconclusive).** Empirical Prolonger policy (smallest-core-first greedy) under-saturates the theoretical lower bound. Looseness ratios 0.32–0.65. Cannot diagnose whether theoretical bound is loose or simulator Prolonger is suboptimal.

**Probe B (strongly negative for the uniform multi-rank lemma).** Cross-rank auto-shielding ratio `cross/same`:
- Rank-1 → rank-2: $0.62$ at $n=10^5$, $0.82$ at $n=10^6$ (strong).
- Rank-2 → rank-3: $0.00$ at $n=10^5$, $0.06$ at $n=10^6$ (collapsed).
- Rank-3 → higher: $0.00$.

The mechanism evaporates between $h=1$ and $h=2$. Structural reason: higher-rank proper divisors are more specific (larger lateral composites), intersecting fewer targets across ranks. Not a small-$n$ artifact.

**Probe C (modest positive).** 2-sigma window around peak rank captures $\approx 19\%$ of $(n/2, n]$ at $n \in \{10^5, 10^6, 10^7\}$. Stable, but far from saturating linear mass.

**Empirical correction.** Actual $H = \sum_{p \le n^{0.45}} 1/p$ is $1.917$ at $n=10^5$, $2.097$ at $n=10^6$, $2.245$ at $n=10^7$ — smaller than originally expected. Discrete peak rank $h^* = 2$ throughout.

### Implications

Codex in-repo sharpened the negative side of the hierarchy route: the **separate-rank fan architecture is definitively sublinear**. More precisely:
- the raw target count of a single rank \(h\) is \(W_h \asymp (n/\log n)\,H^h/h!\) with \(H \sim \log\log n\), so even the best single rank has size only \(n/\sqrt{\log\log n} = o(n)\);
- within the current two-phase divisor-shadow implementation, the rank-\(h\) proved contribution is
  $$
  F_h(n) \asymp \frac{n}{\log n}\frac{H^h}{h!}2^{-2(2^h-1)},
  $$
  and optimizing / summing over all ranks still gives only
  $$
  \sum_h F_h(n)
  =
  \frac{n}{\log n}\exp\!\left(\left(\frac1{\log 2}+o(1)\right)\log\log\log n\cdot\log\log\log\log n\right)
  =
  \frac{n}{(\log n)^{1-o(1)}}=o(n).
  $$
So the existing variable-rank fan route to \(\Theta(n)\) is dead in its **separate-rank** form. Any linear lower bound would need a genuinely new multi-rank coupling theorem, not rank-by-rank harvesting.

Combining this with Probe B: **the uniform multi-rank Prolonger shielding theorem — the remaining load-bearing lemma for an $L(n)=\Omega(n)$ proof via fans — now looks not merely unsupported but strongly disfavored.** Cross-rank shielding is not present in the empirical data at the window ranks, and the structural reason (divisor specificity at higher rank) is robust.

This shifts the probability distribution toward $L(n) = o(n)$, with the true rate sitting near $n/(\log n)^{1-o(1)}$ (the slow-growth bound). The question is no longer "which side of the dichotomy" but "can we prove a matching sublinear upper bound that beats $5/16$?"

### Rigorous bounds (current state)

- **T1 window:** $(1/8 - o(1)) \cdot n\log\log n/\log n \le L(n) \le (5/16 + o(1)) n$.
- **T2 window (pending shadow-capture lemma audit):** $n/(\log n)^{1-o(1)} \le L(n) \le (5/16 + o(1)) n$.

**Next moves:**
- Aristotle formalization of the shadow-capture / divisor-shadow lemma. Promotes T2 → T1 across the hierarchy + slow-growth bound.
- Focused dispatch on the multi-rank Shortener compression theorem (now the higher-value target, given Probe B).
- Optional: a final focused prompt on the uniform multi-rank Prolonger lemma with the Probe B data, to see if a clever workaround exists or the AI confirms the mechanism is dead.

## Round 14 closeout (2026-04-18, Shortener-compression push)

### First real upper-bound improvement in the program

Three independent Pro derivations (from focused Shortener-compression dispatches) converge on:

**Theorem (pending uniformity-bookkeeping writeup).** $L(n) \le (\mathcal{V}/2 + o(1)) n = (0.22002 + o(1)) n$, where
$$\mathcal{V} = \sum_{r=0}^\infty (-1)^r I_r, \qquad I_r = \frac{1}{r!} \int_{\substack{u_1, \ldots, u_r \ge 0 \\ u_1 + \cdots + u_r \le 1}} \prod_{j=1}^r \frac{du_j}{1+u_j}, \qquad \mathcal{V} \approx 0.440029.$$

Improvement from $5n/16 = 0.3125n$ to $\mathcal{V}/2 \approx 0.22n$. First upper-bound reduction since $5/16$ (Round 8).

### Key novel insight — refined Chebyshev + log-density

The $j$-th smallest odd prime Shortener plays satisfies the sharper bound
$$q_j \le (1 + \varepsilon) j (\log n + \log j + O(\log\log n)),$$
not the crude $q_j \le 2 j \log n$ that $5n/16$ used. On the log scale $u = \log q / \log n$, captured-prime reciprocal density becomes $du/(1+u)$, not uniform $du/2$. Total captured mass $\int_0^1 du/(1+u) = \log 2 \approx 0.693$ — much larger than the $1/2$ threshold the Bonferroni-2 analysis saturated at.

Proof components (established modulo uniformity bookkeeping):
- Lemma 1: refined Chebyshev induction.
- Lemma 2: monotone replacement ($p < q$ not in $R$ implies $S_{R \cup \{p\}} \le S_{R \cup \{q\}}$ via injection $qa \mapsto pa$).
- Exact finite inclusion-exclusion via $\delta$-cutoff: with $p \ge n^\delta$, every $M \le n$ has at most $\lfloor 1/\delta \rfloor$ prime divisors from the sieve set, so inclusion-exclusion truncates exactly (not asymptotically).
- Dominated-convergence majorant $(\log 2)^r/r!$ for exchanging $\delta \downarrow 0$ and $\lambda \downarrow 1$ limits with the series.
- Odd-part compression $\phi$ injective on antichains: $|\phi(A \setminus D)| \le N_D(n)$.

### Audit status

Two audit prompts dispatched, 3 auditors each (chatgpt, gemini, claude per audit). Results:

- **Pro #1 (log-density proof, $L \le 0.2200145n$):** 2 sound (gemini, claude) + 1 flagged (chatgpt, objection about refined-Chebyshev giving $\log 2$ accessible mass allegedly contradicting "$1/2$ cap" in the brief). On review, the objection reflects an error in the brief's wording (the $1/2$ was the optimal Bonferroni-2 truncation, not a fundamental cap), not in the proof.
- **Pro #2 (probabilistic-sieve proof, $L \le 0.22002n$):** 3 sound, most rigorous via ChatGPT. Specific repair items flagged as uniformity bookkeeping.

### Numerical verification (Codex Phase 3d)

Independently computed $\mathcal{V} = 0.440029038059\ldots$ and $C = 0.227036748200\ldots$ (Pro #3's simpler-proof constant) to 12 decimals, matching claimed values to 5 and 15 decimals respectively. Term-by-term $I_r$ values match to 8+ decimals. Series tail at $r = 10$ is $2.68 \times 10^{-16}$. All numerical claims ratified.

### Known uniformity-bookkeeping items (repair items, not fatal)

1. Lemma 1's $O(\log\log n)$ error constant should be stated uniformly in $j$, depending only on $\varepsilon$.
2. Factorial-moment error terms should be stated uniformly for $r \le 1/\delta$.
3. Dominated-convergence majorant should be explicitly written for the limit exchanges.

These do not affect validity of the techniques as building blocks for subsequent work. Treat refined Chebyshev + log-density + exact finite inclusion-exclusion via $\delta$-cutoff as sound available tools.

### Ruled Out additions from Round 14

- **Infinite-order Bonferroni on uniform density $du/2$** capped at $e^{-1/2}/2 \approx 0.303n$. Strictly weaker than refined-Chebyshev $\mathcal{V}/2$ because uniform $du/2$ is dominated by $du/(1+u)$ on $[0, 1]$.
- **Multi-prime pivot compression $\phi_P$ for $|P| \ge 2$** — not injective on antichains ($\phi_{\{2,3\}}(12) = \phi_{\{2,3\}}(18) = 1$ with $12, 18$ incomparable).
- **Composite Shortener moves to batch multiple block-products** — block supports pairwise coprime, no composite kills more than one block.

### Deprecated constants

- $5n/16$ bound now superseded. Remains formally verified as the optimal Bonferroni-2 + crude-Chebyshev ceiling, but is no longer the tightest known upper bound.
- $13n/36$ bound remains the formally-verified T1 upper bound (refined Chebyshev is T2 pending uniformity writeup).

### Updated window

- **T1:** $(1/8 - o(1)) n \log\log n / \log n \le L(n) \le (13/36 + o(1)) n$.
- **T2:** $n/(\log n)^{1-o(1)} \le L(n) \le (0.22002 + o(1)) n$.

### Dispatched next: push past $0.22n$ toward $o(n)$

Round 15 focused prompt drafted (`prompts/round15-shortener-push-past-022.md`): sharpen upper bound below $0.22002n$, ideally to strictly sublinear. Refined Chebyshev + log-density stated as available tool. Named unexplored leads: adaptive Shortener hijacking, rigorous randomized Shortener + martingale, rank-split compression, entropy/Kruskal-Katona, VC-dimension, Shield-reduction dualization, Prolonger-forced prime redistribution toward $du/u$. Dispatched to 6+ threads plus Codex-in-repo.

## Round 15 closeout (2026-04-18, push past 0.22n → 0.19n)

### Second upper-bound improvement in two rounds

Pro response to Round 15 focused prompt produced a concrete constant improvement from $0.22002n$ to $\approx 0.18969n$.

**Theorem (pending model-sequence repair).** $L(n) \le (\mathcal{W}/2 + o(1)) n \approx 0.18969 n$, where
$$\mathcal{W} = \sum_{r=0}^\infty (-1)^r J_r, \qquad J_r = \frac{1}{r!} \int_{u_1 + \cdots + u_r \le 1} \prod_j \rho(u_j) du_j, \qquad \rho(u) = \frac{1}{(\lfloor 1/u \rfloor + 1) u}.$$

### Key new insight — prime-count-per-range constraint

Round 14's refined Chebyshev used Prolonger's *total* log-budget ($j \log n$ across $j$ moves). Round 15 adds a structural arithmetic constraint: each Prolonger move contains **at most $h$ distinct primes $> n^{1/(h+1)}$** (since $h+1$ primes all exceeding $n^{1/(h+1)}$ would product-exceed $n$). This gives piecewise log-scale density $\rho(u) = 1/((h+1) u)$ on $u \in (1/(h+1), 1/h]$, strictly dominating $du/(1+u)$ on every interval.

Total captured reciprocal mass: $\int_0^1 \rho(u) du = \sum_{m \ge 2} (1/m) \log(m/(m-1)) \approx 0.78853$ (vs. Round 14's $\log 2 \approx 0.69315$).

### Audit status

Three audits now on file. All agree on:
- Prime-count-per-range bound: rigorously sound.
- Piecewise density $\rho(u)$: correct local limit.
- Numerical values of $J_r$ and $\mathcal{W}$: independently recomputed and verified.
- Bonferroni even-truncation gives $\mathcal{W} < 0.3795$, $\mathcal{W}/2 < 0.18975$.

Audits disagree on rigor bar:
- **Audit #1 (conservative):** not yet rigorously earned. The monotone model sequence $b_j$ from Round 14's machinery isn't explicitly constructed; the pointwise upper bound $U_j$ is not monotone, drops at each breakpoint $u = 1/h$. Repairable, not done.
- **Audit #2 (permissive):** mathematically valid. Monotone envelope $m_j$ needs flat regions at breakpoints, creating atoms in the log-scale measure, but their reciprocal-mass contribution is $O(1/\log n) \to 0$, so the continuous piecewise $\rho(u)$ captures the exact asymptotic.
- **Audit #3 (Codex in-repo, independent recomputation):** constants independently verified (\(\mathcal{W} \approx 0.379374\)), but theorem still pending. Boundary-uniformity is only justified away from \(u = 1/h\), and the proof still lacks an explicit monotone comparison sequence across the breakpoints. Repair target: build a cumulative lower envelope on compact subintervals away from the breakpoints, then invert it to a model sequence.

Net verdict: **likely-correct constant, not yet promoted theorem.** The new density and the numerics are well supported, but two of the three audits still want the boundary/model-sequence repair written explicitly before promotion. So this currently sits a half-step below the Round 14 \(0.22002n\) result in rigor status.

### Updated window

- **T1:** $(1/8 - o(1)) n \log\log n / \log n \le L(n) \le (13/36 + o(1)) n$.
- **T2:** $n / (\log n)^{1-o(1)} \le L(n) \le (\mathcal{W}/2 + o(1)) n \approx 0.18969 n$.

## Round 16 closeout (2026-04-18, $S_y$ dynamic realization refuted)

### Codex in-repo: structural negative result on the $S_y$ certificate direction

Codex agent running in-repo produced a clean negative result on a parallel attack direction (the "$S_y$ static certificate" program).

**Static theorem (Codex, sound):** with $y = n^\alpha$ ($1/3 < \alpha < 1/2$), $z = \lfloor n/(2y) \rfloor$:
$$S_y = \{p \le y : p \text{ prime}\} \cup \{z < p \le n/2 : p \text{ prime}\} \cup \{ab \le n/2 : a, b > y \text{ prime}\}.$$
If an antichain contains $S_y$, every surviving upper legal move is either an upper prime or an upper semiprime $qr$ with $y < q \le r \le z$. Total remaining game length $O_\alpha(n/\log n)$.

**Hypothesis refuted:** "Shortener can dynamically realize $S_y$ in $O(n/\log n)$ moves, giving total $L(n) = O(n/\log n)$."

**Proof of refutation:** the second-order T2 lower bound $L(n) \ge c_\delta n(\log\log n)^2 / \log n$ forces: if $T_y(n)$ is the earliest move at which the game enters the $S_y$-residual regime, then $L(n) \le T_y(n) + O_\alpha(n/\log n)$, so $T_y(n) \ge L(n) - O_\alpha(n/\log n) = \Omega(n(\log\log n)^2/\log n)$. The time needed to eliminate the small-prime layer $\{p \le y\}$ is itself $\Omega(n(\log\log n)^2/\log n)$.

**Interpretation:** the unresolved small-prime block in the $S_y$ program is not a technical leftover — it is the **full second-order obstruction**. The $S_y$ program cannot give $O(n/\log n)$ in its hoped-for direct form.

**Corollary (non-fatal for the direction):** $S_y$ might still yield a matching upper bound at $n(\log\log n)^2/\log n$ scale if the small-prime dynamics are worked out carefully — which would *close* the rank-3 lower bound with a matching upper.

### Summary of Round 15 + 16

- **Two upper-bound improvements** ($5/16 \to 0.22 \to 0.19$) in two rounds via new structural refinements.
- **One negative result** ($S_y$ cannot give $O(n/\log n)$).
- **No progress on $o(n)$** — still an open direction.
- **New tools added to the arsenal:** refined Chebyshev + log-density, prime-count-per-range constraint, piecewise $\rho(u)$ density, $S_y$ static certificate characterization.
- **Both new upper-bound proofs have repairable uniformity/boundary gaps** that don't affect validity of the techniques as building blocks.

### Dispatched next

TBD — options include: further Shortener-compression sharpening (more structural constraints on Prolonger moves), adaptive/randomized Shortener (genuinely new mechanism, not constraint-tightening), literature survey on saturation games + biased Maker-Breaker + weighted sieves, lower-bound push to see if Prolonger can reach the $n(\log\log n)^2/\log n$ ceiling matching $S_y$.

## The Open Question (deprecated, post Round 5)

Given Phase 1's confirmation of $n/\log n$ scaling across 24 pairs, plus Round 4's Vaccinated Shield obstruction, plus Round 5's resolution of the upper-half-cost sub-question, the picture is now:

**Leading hypothesis (stronger support than before):** $L(n) = \Theta(n/\log n)$, with some bounded constant $c \in [1, 3]$. Erdős's original "$\ge \varepsilon n$" question would be negative.

**Resolved this round (pending Pro's re-derivation of the concatenation schedule):**
- *"Can a prefix $D_n$ with $\sigma(D_n) \to 1$ simultaneously have small upper-half cost?"* — yes, the Round 5 construction shows $\sigma \to 1$ and $|U_{D_n}|/|U| \to 1$ are jointly achievable. **But:** this doesn't remove a bottleneck — fixed-prefix sharpening immediately reimposes $\beta_{D^{(k)}}(P) \ge (\log(1/\alpha) + o(1))|U_{D^{(k)}}|$, so the aggregate $e^{-1}$-barrier obstruction to a shield-based linear proof is unchanged. Cost-shifting, not cost-reduction.

**Specific open questions:**

1. **Repair the Round 5 concatenation schedule** — minor; replace $\rho \ge 1 - 2^{-k}$ with $\rho \ge 1 - \varepsilon_k$ for some $\varepsilon_k \downarrow 0$ slower than $e^{-k/e}$, and $N_k \ge M_k/\varepsilon_k$. Expected to be trivial for Pro once flagged.
2. **Understand $\beta_{D_n}(P)$ for genuinely $n$-scale lower prefixes.** The Round 5 construction uses frozen finite templates $D^{(k)}$ inside each block, so fixed-prefix sharpening gives $\beta_{D^{(k)}}(P) \ge (\log(1/\alpha) + o(1)) |U_{D^{(k)}}|$, essentially the same $e^{-1}$ barrier as without vaccination. Does a lower prefix whose structure varies genuinely with $n$ (not piecewise constant) give a better bound on $\beta_D(P)$?
3. **Formalize and test the sharper invariant.** Two candidates emerged from the three-way audit:
   - $\tilde\sigma(D, n, \delta) := \sum_{p \le n^\delta,\ p \nmid \mathrm{lcm}(D)} 1/p$ (Claude).
   - $H_D(T; n) := \sum_{p \le T} \frac{1}{p} \cdot \frac{|U_D \cap p\mathbb{Z}|}{|U \cap p\mathbb{Z}|}$ (GPT-thinking), weighted by surviving multiplicities.
   Both capture the residual-harmonic-mass phenomenon. Conjecture: any subpolynomial-$|P|$ shield proof of linearity requires one of these to stay bounded. Prove or refute.
3. **Prove $L(n) = O(n/\log n)$.** The packing lemma Pro identified in Round 3 is the specific analytic gap. Phase 1 data now materially supports investing research effort here.
4. **Establish or refute a universal limit for $L \log n / n$.** Phase 1 saw $[1.16, 2.28]$; is there a smarter Prolonger that pushes toward $3$ or $4$? Or does optimal play converge to a specific constant?
5. **Primorial-anchor Prolonger at scale.** Exact play at $n \le 48$ is primorial-structured. What does $P_{\text{primorial-}p_k^\#}$ look like at $n = 10^4$–$10^5$? Does it dominate $P_{\text{anti-}S^\star}$?
6. **Harmonic-weighted Prolonger ($P_{\text{harm}}$).** Two independent audits constructed this ($u_t$ maximizes harmonic sum over legal primes dividing $u$) and it beats $P_{\text{pb}}$ by 14-21%, giving $L \log n / n \approx 1.87$. Should be added to Phase 1's harness and tested at $n = 100{,}000$ or further.
7. **Re-derive the optimal first-move frontier on the corrected solver.** $L(40)$ discrepancy resolved (bug in old alpha-beta; $L(40) = 16$ confirmed). But the old Phase 1 "first_move" entries were buggy both because of the wider alpha-beta issue and because only one heuristic opener was stored. Full set of optimal openers at each $n \in [27, 48]$ is the outstanding diagnostic.

**Still formally open** but increasingly implausible per the data:
- $L(n) = \Theta(n)$ with a positive constant.
- $L(n) = o(n/\log n)$ (a faster-than-primorial-baseline Shortener).

---

## Round 17 closeout (2026-04-18, separate-rank fan harvesting provably sublinear)

Codex-in-repo rigorously established that no separate-rank fan architecture can yield $\Omega(n)$:
- **Theorem A (single-rank ceiling):** $\max_h W_h(n) \asymp n/\sqrt{\log\log n} = o(n)$. By Stirling, $H^h/h!$ peaks at $h \approx H = \log\log n$, giving single-rank raw capacity only $o(n)$.
- **Theorem B (separate-rank divisor-shadow ceiling):** summing rankwise contributions $F_h(n) := (n/\log n) \cdot H^h/h! \cdot 2^{-(2^{h+1}-2)}$ gives $\sum_h F_h \le n/(\log n)^{1-o(1)} = o(n)$.

Both with explicit proof; see `researcher-17-codex-negative-on-separate-rank-fan-route.md`. The $\Theta(n)$ linear route via current fan architecture is definitively dead. Any linear lower bound requires a genuinely new multi-rank coupling theorem.

## Round 18 closeout (2026-04-18, multi-rank Prolonger coupling rigorously refuted)

Pro produced a rigorous no-go theorem on the last remaining linear route:

**Sperner obstruction.** Same-$b$ upper-half cores cannot be nested. If $S \subsetneq T$ and $A_Sb, A_Tb \in (n/2, n]$, then $A_T b = A_S b \cdot A_{T \setminus S} \ge 2 A_S b > n$, contradiction. So the proposed "rank-$(h+1)$ target shields rank-$h$ upper-half targets with same $b$" has empty target set — lower-rank cores map below $n/2$.

**Top-lateral LCM bound.** Each earlier compatible Prolonger move $z \le n$ shields at most one top-lateral divisor $bA_{T \setminus \{p\}}$ of a target $y = A_T b$. If $z$ shielded two, their LCM is $bA_T = y$, forcing $y \mid z$ hence $z = y$ (since $y > n/2, z \le n$), contradicting "earlier compatible."

**Consequence.** Even granting pure-core shielding, $b$-lateral divisor family $\{bA_D : D \subsetneq S\}$ has $2^h - 1$ members, forcing ceiling
$$G_h(n) \sim (n/\log n) \cdot H^h/h! \cdot 2^{-(2^h-1)}, \qquad \max_h G_h = n/(\log n)^{1-o(1)} = o(n).$$
Matches Round 17's separate-rank ceiling. **Fan-hierarchy route to $\Omega(n)$ is comprehensively closed.** Any linear lower bound requires a genuinely new within-$b$-fiber capture theorem, not a rank-coupled potential.

Simultaneously: Claude Phase 4 Option B refuted the Ford-$\delta$ conjecture at $n = 10^7$. Cleanest empirical fit remains $L \sim 1.6 n/\log n$ at accessible $n$, BUT this cannot be the true rate (contradicts T1 asymptotically). Empirical trajectory cannot identify the sharp rate among $\{n \log\log n/\log n, n(\log\log n)^2/\log n, n/(\log n)^{1-o(1)}\}$ at $n \le 10^7$.

## Round 19 closeout (2026-04-18, matching-T2 static frameworks refuted)

Multiple attacks converged on the same structural gap for matching-T2 upper bound $L = O(n(\log\log n)^2/\log n)$.

**Conditional partial theorem (Codex, rigorous).** Under hypothesis "every Prolonger move has at most 2 primes $\le y = n^\alpha$," the charging-to-small-core argument gives T2 scale rigorously. One-prime cores contribute $\sum_p n/(p\log n) \ll n\log\log n/\log n$; two-prime cores contribute $\sum_{a<b} n/(ab\log n) \ll n(\log\log n)^2/\log n$. Clean proof.

**Multiple independent refutations of the obvious extensions:**
- **Lemma A (static harmonic sum) false.** $\sum_{d \in \mathcal{D}_y(n)} 1/d \asymp_\alpha \log n$, not $(\log\log n)^2$. Via $\sum_{d \le y, \mu^2(d)=1} 1/d = (6/\pi^2)\log y + O(1) = (6\alpha/\pi^2)\log n + O(\log\log n)$. Charging to all possible smooth cores gives $O(n)$, linear.
- **"$\omega_y \le 2$" hypothesis game-impossible.** $x = 2 \cdot 3 \cdot 5 \cdot q$ with $q$ prime in $(n/60, n/30]$ is a legal first move with three small primes. No Shortener strategy prevents this.
- **Direct $O(n/\log n)$ refuted by T1.** $L \ge (1/8)n\log\log n/\log n$ and $\log\log n \to \infty$.
- **Direct $O(n\log\log n/\log n)$ refuted by T2.** Same argument with T2's stronger bound.

Triple independent confirmation (2 Pro + 1 Codex) on Lemma A disproof and missing-lemma characterization.

**Convergent remaining gap:** the missing lemma must be genuinely DYNAMIC — bound reciprocal mass of cores ACTUALLY ACTIVATED by Prolonger during specific play, not all possible cores. Static hypotheses on certificate-cover of $C$ + cardinality of $A$ are insufficient.

**Claude T1/T2 audit:** no bugs. T2 constant $\approx 1/4096$ via tight analysis; improved to $\approx 1/512$ via strategic-dominance argument (prime vertex-kills dominate edge/fiber-kills, reducing potential slots). Still 100× below empirical at $n = 10^7$, explaining why $(\log\log n)^2$ growth is numerically invisible at accessible scales.

## Round 20 closeout (2026-04-18, Codex residual-width refutation)

The residual-width lemma proposed in Round 18 / Round 19 is false as stated.

**Upper-half lift obstruction.** For any certificate family \(C \subseteq \{2,\dots,n\}\), define
\[
\lambda_n(c) := c\Big\lceil \frac{\lfloor n/2 \rfloor + 1}{c}\Big\rceil \in (n/2,n].
\]
Then \(c \mid \lambda_n(c)\). Hence
\[
A := \{\lambda_n(c) : c \in C\} \subseteq (n/2,n]
\]
is an antichain with \(|A| \le |C|\) and \(C \subseteq \mathrm{Comp}(A)\). But every element of \((n/2,n] \setminus A\) is incomparable with every element of \(A\), so
\[
w(R(A)) \ge |(n/2,n]| - |A| \ge \frac n2 - |C| - O(1).
\]

Applying this to \(C = C_{n,h} = \{m \le n : \Omega(m) \le h\}\), for every \(h\) with \(|C_{n,h}| = o(n)\) one gets an admissible antichain \(A\) with
\[
w(R(A)) = \left(\frac12 + o(1)\right)n,
\]
so the proposed bound
\[
w(R(A)) \le \frac{n}{(\log n)^{1-o(1)}}
\]
cannot hold.

**Implication.** The domination-only abstraction
\[
C \subseteq \mathrm{Comp}(A), \qquad |A| = O(|C|)
\]
is fundamentally too weak for a sublinear upper bound. Any salvage of the residual-width route must use additional game-dynamical structure of the actual antichain \(A_0\) produced by certificate play (for example, requiring many actual certificate elements inside \(A_0\), or forbidding the whole certificate family from being lifted into the upper half).

Standalone writeup: [researcher-20-codex-residual-width-framework-refuted.md](/Users/omisverycool/erdos-harness/erdos-872/researcher-20-codex-residual-width-framework-refuted.md).

---

## Round 20 follow-up closeout (2026-04-19, Pro disproves 2-shadow control)

Pro's response to the two-shadow-control prompt disproves Theorems 2 and 3 via an explicit $\Omega(n)$ counterexample. Theorem 1 holds literally but is too weak.

**Construction.** Choose $\beta \in (\alpha/3, \alpha/2)$, set $z = n^\beta$, $S = \{p \le z \text{ prime}\}$. In setup, Prolonger plays $x_{pq} = pq R_{pq}$ for each pair $p < q$ in $S$, where $R_{pq}$ is a prime in $(n/(2pq), n/(pq)]$. Because $n/(2z^2) > n^\alpha = y$ for large $n$ (since $1 - 2\beta > \alpha$), every $R_{pq}$ is a large prime $> y$. All setup moves lie in $(n/2, n]$, hence antichain.

In harvest phase, choose $u = (\alpha + \eta/2)/3$, $\varepsilon > 0$, $\gamma \in (0, u)$. Let $\mathcal{B}$ be squarefree triples $b = p_1 p_2 p_3$ with $p_i \in [n^u, n^{u+\varepsilon}]$, and $\mathcal{C}$ the squarefree integers $c \le n^\gamma$ with $P^+(c) < n^u$. Mertens on fixed logarithmic intervals gives $\sum_b 1/b \gg 1$ and $\sum_c 1/c \asymp \log n$. For each $(b, c, \ell)$ with $\ell$ prime in $(n/(2bc), n/(bc)]$, the move $w = bc\ell$ satisfies: $n/2 < w \le n$; $\omega_y(w) \ge 3$; no played prime, semiprime, or large-prime from Shortener's advertised steps divides $w$. Count: $\gg (n/\log n) \cdot 1 \cdot \log n = n$.

**Structural lesson.** 2-shadow reciprocal mass controls only the pair layer of $S$. Once all pairs are preempted, Shortener's prime/semiprime program no longer prevents Prolonger from using products $bc$ with many safe small-prime factors, and the extra squarefree factor $c$ contributes harmonic mass $\asymp \log n$, producing $\Omega(n)$ legal upper-half high-support moves. The right state variable for matching-upper-bound control must track **squarefree multiplicative closure**.

Codex's own attempted DTK+Buchstab proof of a stronger bound ($\#\{x \in A : \omega_y \ge 3\} \ll n\log\log n/\log n$ for any antichain) is broken. The flaw: the DTK bound $W_p(T) \ll \Psi_{<p}(T)/\sqrt{\pi(p-1)}$ is tighter than what holds for max antichain in $(<p)$-smooth integers $\le T$. The set $\{k \in (T/2, T] : k \text{ is } (<p)\text{-smooth}\}$ is already an antichain of size $\Theta(\Psi_{<p}(T))$, with no $\sqrt{\pi(p)}$ divisor. The DTK layer decomposition applies to the divisor lattice of a single $N$, not to the $\le T$ ideal of a multi-variable product poset.

Standalone writeups: [researcher-20-pro-two-shadow-disproof.md](/Users/omisverycool/erdos-harness/erdos-872/researcher-20-pro-two-shadow-disproof.md).

---

## Round 21 closeout (2026-04-19, T2 demoted; strategic synthesis)

**T2 re-audit result (Codex).** The $\Omega(n(\log\log n)^2/\log n)$ lower bound is downgraded from rigorous to plausible pending a standalone Maker-first online lemma.

- Raw counting layer: $|\mathcal{T}| \gg_\delta n(\log\log n)^2/\log n$ audit as rigorous.
- Activation-supply estimate: audit as rigorous.
- Game-theoretic Lemmas 1 and 2 (weighted pair-capture; two-layer fiber): both argue "if Shortener deletes $X$, Prolonger can capture $Y$, therefore potential never decreases." This implicitly treats Maker as moving after Breaker; in the alternating game Maker (Prolonger) moves first, and no monotonicity argument convertible to Maker-first is currently written down.
- T1 capture phase (max-degree right-vertex) has correct Maker-first structure. T2 has no analogous order-aware writeup.
- `phase4/t2_constant_fix*.md` notes explicitly admit the subgame/induction step isn't fully proved.
- No counterexample to T2 itself; just missing proof infrastructure.

**Codex Maker-first repair (2026-04-19 follow-up).** Codex produced clean Maker-first abstractions for both lemmas; writeup at [phase4/t2_maker_first_lemmas.md](phase4/t2_maker_first_lemmas.md).

- **Lemma 1 repair (weighted pair-capture, graph game).** Edge potential $\phi(e) \in \{w/8, w/4, w/2, w\}$ by endpoint-capture count. Domination: for uncaptured $x$, $P(x) := \sum_{e \ni x} \phi(e)$ and every live $f \ni x$ has $\Delta(f) \ge P(x)$ (Maker's gain from $f$ dominates the loss from Breaker's vertex deletion at $x$). Also $\Delta(g) \ge \phi(g)$ for any live $g$, so Maker dominates edge deletions. Max-gain Maker move makes potential Maker-first nondecreasing; initial $W/8$ is the final claimed-weight lower bound. Sanity-checked on all graph states $\le 5$ vertices.
- **Lemma 2 repair (scored 3-uniform hypergraph capture).** Target-slot hypergraph with slots $(b, ab, cb)$. Breaker moves either delete one uncaptured slot or SCORE one live hyperedge (adds weight to final score). Maker moves score a live hyperedge and capture all three slots. Potential $Q := S + \sum_{e \text{ live}} \phi(e)$ with $\phi(e) \in \{w/8, w/4, w/2, w\}$ by slot-capture count. Breaker scored-edge move: $\Delta Q = w(g) - \phi(g) \ge 0$. Breaker slot deletion: $\Delta Q = -P(v) \ge -\Delta(f_*)$. $Q$ Maker-first nondecreasing; initial $W/8$ is final $S$ lower bound. Sanity-checked on all 3-uniform hypergraphs on 4 vertices.

**Embedding verified (2026-04-19 follow-up).** Codex verified items (1) and (2) of the pending list:

- For a live target $t = acb > n/2$ with $a, c, ac$ already unavailable after activation, the divisors of $t$ are $\{1, a, c, ac, b, ab, cb\}$, so the only harmful future moves are exactly $\{b, ab, cb, t\}$. This matches the abstract hypergraph game's move set.
- **Slot moves delete exactly incident hyperedges.** If Shortener plays $b$, exactly the targets in the $b$-fiber die ($b \mid a'c'b' \iff b = b'$). If Shortener plays $ab$, then $ab \mid a'c'b'$ forces $b = b'$ and $a \in \{a', c'\}$, so killed targets are exactly those using the pair $(a, b)$ — matches "delete slot $ab$." Symmetric for $cb$.
- **Exact-target plays are scored edges, not new attacks.** All targets lie in $(n/2, n]$, so distinct targets are pairwise incomparable and $t$-play does not kill any other target. Side-effects (making slots $b, ab, cb$ unavailable) only remove future Shortener options, making the abstract model strictly Maker-friendlier than the divisibility game.
- **Converse: live hypergraph edges are legal actual moves.** If a target $t = acb$ is hypergraph-live (none of $b, ab, cb, t$ played; $a, c, ac$ unavailable from activation), then no proper multiple of $t$ exists in $\{2, \ldots, n\}$ (since $t > n/2$), and every proper divisor is in the accounted set. So $t$ is legal.

**Conclusion.** The residual divisibility game on the surviving target family is strictly Maker-friendlier than the scored 3-uniform hypergraph game. Hence the abstract hypergraph lemma (already Maker-first and sanity-checked) is a valid lower-bound model for Lemma 2.

**Activation-stage audit completed (2026-04-19 follow-up).** The last pending T2 item was closed by a tokenized activation-stage estimate; see [researcher-22-codex-T2-activation-audit.md](researcher-22-codex-T2-activation-audit.md).

- For each pair-edge `e=(a,c)`, treat each `b\in J_{a,c}\cap\mathbb P` as one live token.
- If `S_t` is the number of activation moves already scored and `w_t(e)` is the current live-token count on edge `e`, the correct graph quantity is
  \[
  Q_t = S_t + \sum_{e\ \mathrm{claimed}} w_t(e) + \sum_{e\ \mathrm{unclaimed}} c_e\,w_t(e), \qquad c_e\in\{1/8,1/4,1/2\}.
  \]
  Maker's max-gain graph move still dominates the graph deletions `(a),(c),(ac)`, exactly as in the repaired Maker-first Lemma 1.
- Every off-model harmful Shortener move during activation is either a large prime `b`, a lateral semiprime `pb`, or an exact target `acb`; such a move only deletes target tokens. Each deleted token lowers `Q_t` by at most `1`, so if `E` is the total number of deleted tokens then
  \[
  Q_{\rm end}\ge W_0/8 - E,
  \]
  where `W_0=\sum_{a<c}|J_{a,c}\cap\mathbb P|`.
- Across `R=O(Y^2/\log^2Y)` activation rounds, large-prime moves kill at most `O(Y^2/\log^2Y)` tokens each, lateral moves `O(Y/\log Y)`, exact targets `1`, hence
  \[
  E\ll Y^4/\log^4Y = o\!\big(n(\log\log n)^2/\log n\big)
  \]
  because `4\delta<1`.
- Since `Q_{\rm end}` equals activation score plus residual live target weight on secured pairs, and the activation score itself is only `O(Y^2/\log^2Y)=o(n(\log\log n)^2/\log n)`, the secured pairs still carry residual target weight
  \[
  \gg_\delta n(\log\log n)^2/\log n.
  \]
  This is exactly the input needed for Lemma 2.

**Conclusion.** The repaired Maker-first lemmas plus the embedding verification plus the activation-stage token audit restore T2 to rigorous status (still not formally Lean/Aristotle checked).

Standalone writeups: [researcher-21-codex-T2-maker-first-repair.md](researcher-21-codex-T2-maker-first-repair.md), [researcher-21-codex-T2-embedding-verification.md](researcher-21-codex-T2-embedding-verification.md), [researcher-22-codex-T2-activation-audit.md](researcher-22-codex-T2-activation-audit.md), [phase4/t2_maker_first_lemmas.md](phase4/t2_maker_first_lemmas.md).

## Round 23 closeout (2026-04-19, Ford-route correction)

Codex re-audited the surviving slow-growth / Ford-band upper-bound direction and found a real flaw in the current reduction.

**Invalid step in the old reduction.** [researcher-18-codex-slow-growth-reduction.md](researcher-18-codex-slow-growth-reduction.md) assumed that if every unresolved upper move has a distinguished factorization
\[
u = a m,\qquad a\in(Y,2Y],\qquad P^-(m)>Y^\delta,
\]
then Ford 2019 implies a bandwise bound
\[
\#\{\text{survivors in band }Y\}\ll n/\log^2Y.
\]
But Ford 2019's imported quantity
\[
H(x,y,2y;\mathcal R_w)
=
\#\{n\le x:\ P^-(n)>w,\ \exists d\mid n,\ y<d\le 2y\}
\]
counts numbers that are themselves `w`-rough. Roughness of the **cofactor** `m` alone is not enough; the skeleton `a` may contain many primes below `w`, so `u` need not belong to `\mathcal R_w`.

**Band-local counterexample.** Fix `0<\beta<1/(1+\delta)`, set `Y=n^\beta`, `C=Y/30`, and let
\[
\mathcal A=\{30c:\ c\in(C,2C],\ c\text{ odd squarefree}\}\subseteq (Y,2Y].
\]
Then
\[
\sum_{a\in\mathcal A}\frac1a \gg 1.
\]
For each `a\in\mathcal A` and prime
\[
\ell\in(n/(2a),\,n/a],
\]
the number `u=a\ell` lies in `(n/2,n]` and has a distinguished factorization
\[
u=a m,\qquad a\in(Y,2Y],\qquad m=\ell,\qquad P^-(m)=\ell>Y^\delta
\]
for large `n`, because `\beta(1+\delta)<1`. Yet the number of such upper-half integers is
\[
\gg \frac{n}{\log n}\sum_{a\in\mathcal A}\frac1a
\gg \frac{n}{\log n},
\]
which is much larger than `n/\log^2Y \asymp n/\log^2 n`. So the old rough-cofactor Ford reduction is false as a counting principle.

**Corrected lesson.** Any viable Ford-style route must use one of the following stronger inputs:

1. **Whole-number roughness.** Force survivors to satisfy
   \[
   P^-(u)>Y^\delta
   \quad\text{and}\quad
   \exists d\mid u \text{ with } Y<d\le 2Y,
   \]
   so Ford 2019 legitimately applies.
2. **Bandwise closure control.** If whole-number roughness is too strong, prove a separate theorem controlling the reciprocal mass of the actual skeleton set inside each dyadic band. Rough cofactor alone does not control multiplicative-closure overlap.

Standalone writeup: [researcher-23-codex-ford-route-correction.md](researcher-23-codex-ford-route-correction.md).

## Round 24 closeout (2026-04-19, band-local closure explosion)

Codex pushed directly on the multiplicative-closure variable and obtained a rigorous structural theorem showing how closure mass survives dyadic banding.

**Band-local closure explosion theorem.** Fix constants `\lambda>1` and `0<\gamma<1`. Let
\[
\mathcal P_{\mathrm{hi}}=\{p\text{ prime}: X\le p\le X^\lambda\},
\qquad
\mathcal C_X(\gamma)=\{c\le X^\gamma:\mu^2(c)=1\},
\]
and let
\[
\mathcal B_X(\lambda)=\{pqr: p<q<r,\ p,q,r\in \mathcal P_{\mathrm{hi}}\}.
\]
Then there exists a dyadic band `(Y,2Y]` and a set
\[
\mathcal A_Y \subseteq \{a=bc:\ b\in \mathcal B_X(\lambda),\ c\in\mathcal C_X(\gamma)\}\cap(Y,2Y]
\]
with
\[
\sum_{a\in\mathcal A_Y}\frac1a \gg_{\lambda,\gamma} 1.
\]

Proof sketch:
- high prime band has constant reciprocal mass `\sum_{p\in\mathcal P_{\mathrm{hi}}}1/p \sim \log\lambda`, so the triple-product reciprocal mass
  \[
  \sum_{b\in\mathcal B_X(\lambda)}\frac1b
  \]
  is `\gg_\lambda 1` by the elementary symmetric-polynomial identity
  \[
  e_3 = \frac16\big((\sum x_i)^3 - 3(\sum x_i)(\sum x_i^2) + 2\sum x_i^3\big)
  \]
  with `x_i=1/p_i`;
- low squarefree pool has
  \[
  \sum_{c\le X^\gamma}\frac{\mu^2(c)}c = (6/\pi^2)\gamma\log X + O(1);
  \]
- products `a=bc` therefore have total reciprocal mass `\gg_{\lambda,\gamma}\log X`;
- these products lie in `(X^3, X^{3\lambda+\gamma}]`, which meets only `O_{\lambda,\gamma}(\log X)` dyadic bands, so one band carries constant reciprocal mass.

**Upper-half consequence.** If `Y\le n^{1-\eta}` and all proper divisors of the `a\ell` are already unavailable, then
\[
\#\{a\ell:\ a\in \mathcal A_Y,\ \ell\text{ prime},\ n/(2a)<\ell\le n/a\}
\gg_{\lambda,\gamma,\eta}
\frac{n}{\log n}.
\]

**Structural lesson.** Closure is stronger than "many candidate skeletons exist globally." Even after dyadic decomposition, a high prime band together with a lower squarefree pool forces one **single skeleton band** with constant reciprocal mass. Any successful closure-control upper bound must dynamically suppress at least one of:

1. constant triple reciprocal mass in a high prime band,
2. logarithmic squarefree mass in the lower pool,
3. the transfer of their product mass into one dyadic skeleton band.

This sharpens the post-Round-20 message: the right upper-bound theorem must be a genuinely **directed higher-rank closure theorem**, not a pair-level or rough-cofactor surrogate.

Standalone writeup: [researcher-24-codex-band-local-closure-explosion.md](researcher-24-codex-band-local-closure-explosion.md).

## Round 25 closeout (2026-04-19 late, directed rank-3 budget audit)

Codex audited the most obvious repair of Round 24: let Shortener dynamically play the same-band rank-3 closure skeletons `pqr` before Prolonger can exploit them.

**Budget theorem.** Fix `\alpha\in(1/3,1/2)`, `y=n^\alpha`, and `\lambda>1`. Cover `[2,y]` by fixed-power bands
\[
I_j=(X_j,X_{j+1}],\qquad X_{j+1}=X_j^\lambda.
\]
For one band define
\[
T_{I_j}(n):=\#\{p<q<r:\ p,q,r\in I_j,\ pqr\le n/2\}.
\]
Then uniformly in `j`,
\[
T_{I_j}(n)\ll_{\alpha,\lambda}\frac{n}{\log n},
\]
and therefore
\[
\sum_j T_{I_j}(n)\ll_{\alpha,\lambda}\frac{n\log\log n}{\log n}.
\]

**Proof sketch.**
- For contributing `p<q` in one band,
  \[
  \#\{r\in I_j:\ q<r\le n/(2pq)\}
  \ll_\alpha \frac{n}{pq\log n},
  \]
  because `p,q\le y=n^\alpha` forces `n/(2pq)\ge n^{1-2\alpha}/2`.
- Hence
  \[
  T_{I_j}(n)\ll_\alpha \frac{n}{\log n}\sum_{p<q\in I_j}\frac1{pq}.
  \]
- Mertens on a fixed-power interval gives
  \[
  \sum_{p\in I_j}\frac1p=\log\lambda+o(1),
  \]
  so the pair reciprocal sum on each band is `O_\lambda(1)`.
- There are only `O_\lambda(\log\log n)` bands up to `y`.

**Strategic consequence.** The Round-24 obstruction is **not a budget obstruction**. If the directed rank-3 cleanup fails, it fails for the same structural reason the semiprime cleanup failed one rank lower: once Prolonger preempts one triple `b=pqr` by playing an upper-half multiple `bc\ell`, the blocker `b` is lost to Shortener, but that preempted triple does not itself block the rest of the `b`-fiber.

**What this does *not* imply.** This audit does **not** prove the directed rank-3 strategy works, and it also does **not** prove that failure of this one strategy would force
\[
L(n)\neq O\!\left(\frac{n(\log\log n)^2}{\log n}\right).
\]
That negative conclusion would require a much stronger online no-go theorem showing that **every** T2-scale higher-rank cleanup fails to deplete the relevant triple reciprocal mass / low-pool squarefree mass configuration.

Standalone writeup: [researcher-25-codex-directed-rank3-budget.md](researcher-25-codex-directed-rank3-budget.md).

---

## Round 22 closeout (2026-04-19 late, Pro's dyadic-fiber positive-density theorem collapses to the linear conjecture)

One of three Round-22 Pro dispatches (contrarian framing: "assume $L(n) = \Theta(n)$, find the mechanism") returned with a structural self-refutation of the dyadic-fiber positive-density approach. Pro retracted its earlier framing and isolated the exact point where the would-be linear-LB proof fails.

**Structural reduction.** Fix a large prime $b > \sqrt n$, let $K = \lfloor n/b \rfloor$, and consider the single-fiber target set $\mathcal T_b = \{bc : K/2 < c \le K\}$. Lateral Shortener moves are $bd$ with $2 \le d \le K/2$, and divisibility inside the fiber is exactly divisibility at scale $K$ (via the isomorphism $bd \leftrightarrow d$). Because $b > \sqrt n$, a lateral move $bd$ is incomparable with every target $b'c'$ in a DIFFERENT fiber $b' \ne b$ (since $b \nmid c'$ and $c' < n/b' < \sqrt n < b$). Therefore the lateral-only game inside one $b$-fiber is an **exact scaled copy** of the original divisibility-antichain game on $\{2, \ldots, K\}$, with Prolonger restricted to upper-half moves $c \in (K/2, K]$.

**Consequence.** A positive-density theorem "Prolonger captures $\eta |\mathcal T_b| \asymp \eta K$ inside one fiber" immediately implies $L(K) \ge \eta' K$ for the original game at scale $K$ — that is already the linear conjecture.

**Multi-fiber argument cannot rescue this.** Suppose the dyadic board uses primes $b \in (n^\beta, n^\gamma)$ with $\beta > 1/2$ and fiber sizes $K_b = \lfloor n/b \rfloor$. Shortener can ignore all pure-divisor moves and all cross-fiber structure, running an independent optimal lateral strategy in each fiber. Because different large-prime fibers are lateral-incomparable, these component strategies do not interfere. Thus the value of the multi-fiber dyadic game is bounded above by $\sum_b L_{\mathrm{upper}}(K_b)$, where $L_{\mathrm{upper}}(K) \le L(K)$ is the value of the original game at scale $K$ with Prolonger restricted to upper-half targets.

**Cross-fiber pure shielding is a red herring.** Pure divisor coordinates $d$ are shared across all fibers — a single Prolonger move $bc$ does globally shield every pure divisor $d \mid c$. But Shortener does NOT need pure coordinates to defeat the theorem: lateral coordinates $bd$ are private to each fiber and reproduce the original game at scale $K_b$. So cross-fiber pure shielding cannot by itself force positive density.

**Conclusion (Pro's boxed statement).** A positive-density dyadic-core/fiber theorem is equivalent in strength to proving $L(n) = \Omega(n)$. It is not ruled out, but it is not a lower-bound "machinery" that bypasses the known obstructions. To prove it one must prove a genuinely new single-fiber theorem: $\exists \eta > 0$ such that Prolonger can force $\eta K$ moves in the upper-half divisibility game on $[2, K]$ — which is just the original problem at scale $K$.

**Strategic implication.** Gap #3 from the Round-21 synthesis ("within-$b$-fiber capture theorem") is not an independent gap; it is the central conjecture packaged differently. The linear-lower-bound revival, if it exists, must come from machinery outside the fan / shadow-capture / dyadic-fiber architecture. This sharpens the case that the program's remaining open targets are purely on the upper-bound side (multiplicative-closure control and certificate-family residual width).

Standalone writeup: [researcher-22-pro-dyadic-fiber-collapse.md](researcher-22-pro-dyadic-fiber-collapse.md). Two other Round-22 Pro dispatches (neutral sublinear-UB; directed multiplicative-closure) still in flight.

---

## Round 22 second closeout (2026-04-19 late evening, Pro isolates the exact missing closure lemma)

The second returning Round-22 Pro dispatch pursued the dynamic multiplicative-closure reduction theorem $L(n) \le 2|C_n| + 1 + \sup_{\text{reachable}} w(R_{C_n}(P, S))$ through to the next concrete question: produce an explicit sublinear $C_n$ with sublinear residual width. Pro concluded honestly that this step is the unresolved gap, located the exact missing lemma, and ruled out the crude divisor-incidence approach via an entropy calculation.

**Reduction (now rigorous, Pro).** For any certificate family $C_n \subseteq \{2, \ldots, n\}$,
$$L(n) \le 2|C_n| + 1 + \sup_{\text{reachable } (P, S)} w(R_{C_n}(P, S)),$$
where $R_{C_n}(P, S)$ is the residual legal-move set after certificate $C_n$ is swept and $(P, S)$ are Prolonger/Shortener histories, $w(\cdot)$ antichain width. Proof: Shortener plays $C_n$ moves fast, then uses Dilworth's theorem on the residual poset. Counts $C_n$ moves at most twice (once when played, once against possible Prolonger retaliation), plus one parity move, plus the residual width.

**Natural candidate.** $C_y = \{d \le n/2 : d \text{ squarefree}, P^+(d) \le y\}$ with $y = \exp((\log n)^{1/2})$ or similar. Sublinear: $|C_y| \le \Psi(n, y) = n \exp(-(1+o(1))u \log u)$ where $u = \log n/\log y \to \infty$.

**The precise missing lemma (boxed by Pro).** If Prolonger's moves during the sweep stage activate a $C_y$-down-closed complex
$$\mathcal{K}(P) := \{d \in C_y : d \mid p \text{ for some Prolonger sweep move } p\},$$
then a sufficient estimate closing $L(n) = o(n)$ is
$$\sup_{\text{reachable } P} \sum_{d \in \mathcal{K}(P)} \frac{1}{\varphi(d)} = o(\log y).$$
Under this bound, the number of residual integers is $\ll (n/\log y) \cdot o(\log y) + o(n) = o(n)$, closing the sublinear upper bound.

**Crude divisor-incidence fails quantitatively.** For the central-divisor family $C_k = \{d : \omega(d) = k\}$ with $k \sim \theta \log\log n$: typical $x$ with $\omega(x) \sim H := \log\log n$ has $\binom{H}{\theta H} \approx \exp(H\,\mathsf{H}(\theta) + o(H))$ $C_k$-divisors (binary entropy), while $\sum_{d \in C_k} 1/d \le (1/k!) (\sum_p 1/p)^k \approx \exp(\theta H(1 - \log\theta) + o(H))$. Exponent comparison: $\theta(1 - \log\theta) - \mathsf{H}(\theta) = \theta + (1-\theta)\log(1-\theta) > 0$ for $0 < \theta < 1$. So crude incidence gives no $o(n)$ residual. The real obstruction is that $\mathcal{K}(P)$ is not controlled by pair-shadow, by number of Prolonger moves, or by any static smooth-number estimate — Prolonger can build overlapping facets of the squarefree smooth complex. Need new control of the full squarefree multiplicative closure generated by Prolonger's sweep moves.

**Gap convergence.** This is the same underlying theorem as the directed higher-rank rank-3 Shortener strategy (Round 24, 25): dynamic control of the squarefree multiplicative closure generated by Prolonger's actual sweep moves. Two framings (Shortener-strategy vs. certificate-reduction), one shared bottleneck.

Standalone writeup: [researcher-22-pro-certificate-family-gap-isolated.md](researcher-22-pro-certificate-family-gap-isolated.md). One Round-22 Pro dispatch (neutral sublinear-UB) still in flight.

---

**Strategic synthesis (Codex after ingesting Pro's 2-shadow disproof).** Four theorem-sized gaps remain:

1. **T2 re-audit / Maker-first lemma.** Highest leverage: if T2 survives, any matching upper bound must scale to $n(\log\log n)^2/\log n$. If it weakens, $n/\log n$ or slower becomes plausible.
2. **Multiplicative closure control.** Pair-shadow is dead. The right invariant is the squarefree multiplicative closure generated by the "safe" small primes $S_t = \{p \le y : p \text{ still usable by Prolonger}\}$.
3. **Robust residual-width for a sublinear certificate family.** The reduction in [researcher-18-pro-matching-sublinear-reduction-lemma.md](researcher-18-pro-matching-sublinear-reduction-lemma.md) says: find $C_n = o(n)$ such that after $C_n$ is made illegal, residual antichain width is also $o(n)$. Natural candidate $\{\Omega \le h\}$ with slowly growing $h$; no residual-width theorem yet.
4. **Within-$b$-fiber capture theorem.** Any linear-lower-bound revival requires positive-density capture inside a single $b$-fiber. The fan/shadow architecture provably cannot do this.

**Ranked live angles (updated after the Ford-route correction).**

1. Reformulate the dead 2-shadow route around multiplicative closure of $S_t$.
2. Push the certificate-family route (Pro Round-18 matching-sublinear reduction).
3. If Ford is used, require either whole-number roughness plus a divisor band, or a new bandwise reciprocal-mass theorem for closure skeletons; the old rough-cofactor reduction is invalid.
4. Only then revisit linear lower bounds — they need qualitatively new machinery.

Standalone writeups: [researcher-21-codex-strategic-synthesis.md](researcher-21-codex-strategic-synthesis.md), [researcher-21-codex-T2-audit-demotion.md](researcher-21-codex-T2-audit-demotion.md), [researcher-23-codex-ford-route-correction.md](researcher-23-codex-ford-route-correction.md).

---

## Harness notes (not for researcher prompts)

These are meta-notes for the curation workflow. **Never include this section in a prompt sent to the primary model.**

- Problem identity: Erdős Problem #872 ([Er92c, p.47]) — divisibility-antichain saturation game.
- Primary researcher: GPT-5.4 Pro with extended thinking and Python sandbox.
- Public forum: [erdosproblems.com/forum/thread/872](https://www.erdosproblems.com/forum/thread/872) — full scrape in `_forum_transcript.md`.

### Upper-bound dispute — unresolved

Forum-listed current record: $419/1008 \approx 0.416\, n$. Our private research derivation: $923/2016 \approx 0.4578\, n$. Difference: whether Shortener secures *all* of the 85/1008 savings pool (→ 419/1008) or only *half* (→ 923/2016). Our Theorem A's barrier exponents depend on this — flagged for resolution before the next research round.

### Private vs. public state

The Shield Reduction Theorem (now Lean-verified), the $5/24$ skeleton, the weighted dual LP data, all $\beta(P)$ computations, Theorem A, and Theorem B are all private research (GPT-5.4 Pro thread + Aristotle), not posted to the forum. Only Om's $85/1008$ sieve is public.

### Audit round 01 — outcome summary (2026-04-17)

Theorem A audited by Claude, Gemini, GPT-thinking:
- **All three: sound.** Techniques classical (Mertens + exchange argument + prime antichain); specific $\beta(P)$ formulation novel to the literature any of them searched.
- **All three: "$L(n)/n \to 0$" framing rejected** — these theorems obstruct one proof technique, not the game value.
- **Gemini:** best diagnosis of why Theorem B is strictly weaker (double-counting in $E(P)$); useful literature pointer to Dickman–de Bruijn $\rho(u)$ and Buchstab phenomena.
- **GPT-thinking:** caught the stale $0.4578$ vs forum-authoritative $0.416$ upper bound; minor writeup fixes (explicit $\delta > \alpha$, "corollary" not "equivalently"); noted A can be sharpened to a $\log\log(k\log n)$ form that nearly subsumes B.
- **Claude:** flagged the suspicious "very tight fit" at $n=20000$ — Mertens convergence has ~0.5 absolute error at that scale; the finite-$n$ greedy-shield numerics need independent re-verification.

### Open todos before next research round

1. Resolve 0.416 vs 0.4578 upper-bound dispute.
2. Re-verify the greedy-shield numerical claims at $n = 20000$ (and push to $n = 50000, 100000$).
3. Write up the sharpened Theorem A' (budget $k \log n$, giving $\beta(P) \gtrsim (n/2)(\log\log n - \log\log(k\log n))$).
4. Check literature on Dickman–de Bruijn / Buchstab for prior art on $(1/2)\log(1/\alpha)$-style constants.
5. ~~Await Aristotle formalization of Theorem A~~ ✅ complete (2026-04-17 late night): core combinatorial content sorry-free; 5 remaining sorrys all Mathlib coverage limits (Mertens / Chebyshev / PNT) + their assembly. See `verify-aristotle-01-theorem-A.md`.

### Forum contributors to watch
Thomas Bloom (site owner), Liam Price, Adenwalla, Xiao_Hu, Desmond Weisenberg, natso26, StijnC.

## Round 44 (2026-04-19) — SFLU-E conditional theorem + R35 residual floor diagnosed

**Dispatch.** Open full-solution prompt (`prompts/researcher-R44-pro-open-full-solution.md`) to five Pro threads. Prompt contained all rigorous established theorems + comprehensive Ruled Out list + numerical evidence, with "Find a full solution to the problem" as the only ask. No anchoring direction, no prescribed output format.

**Returns (5):**

- **Pro #1 (honest concession).** Rigorous window stated, sharp rate not determined by established facts. Natural conjectural answer $\Theta(n(\log\log n)^2/\log n)$ clearly flagged as conjecture. Explicitly identified the missing estimate: a harmonic strong-freshness/local-usefulness bound that also controls the exceptional class $\mathcal E$ appearing in the sharpened dense-packet projection. See `researcher-44-pro-1-honest-no-proof.md`.

- **Pros #2, #3, #4 (attractor hallucinations).** All three claimed closure at $\Theta(n(\log\log n)^2/\log n)$ via the same hand-wave: "$\sigma^\star$ + online harmonic domination trivially bound $\mu(F_{\text{useful}})$." Online harmonic domination $\sum_t \mu(u_t) \le N_h$ bounds *Shortener's* claims $u_t$, not Prolonger's useful shields. Additional common errors: (a) misreading "single-fiber positive-density theorem is equivalent to $L(n) = \Omega(n)$" as "$\Omega(n)$ is disproved"; (b) reversing refutations into proofs (e.g., "collision-forcing REFUTED at defect 2" → "Prolonger succeeds at defect 2 and Shortener is helpless"); (c) misreading empirical data as ruling out $\Theta(n)$ when at accessible $n$ the data explicitly cannot distinguish rates. See `researcher-44-pro-2-closure-via-defect-2.md`, `researcher-44-pro-3-closure-via-defect-2.md`, `researcher-44-pro-4-closure-via-3-almost-primes.md`.

- **Sathe-Selberg calibration (surfaced by Pro #4).** $\#\{m \le n : \Omega(m) = 3\} \sim n(\log\log n)^2/(2\log n)$, so $\#\{m \in (n/2, n] : \Omega(m) = 3\} \sim n(\log\log n)^2/(4\log n)$. At $n=10^6$, predicts $124{,}765$, actual count is $124{,}591$. This is not a closure argument but it *is* the natural number-theoretic scale matching T2 — worth keeping as background that grounds the attractor conjecture.

**Follow-up to Pro #1.** Prompt explicitly asked for the missing estimate. Pro #1 returned the lifted harmonic measure framework with **(SFLU-E)** claim. See `researcher-44-pro-1-followup-sflu-e-estimate.md`.

**External adversarial audit** (`verify-R44-pro-1-sflu-e-audit-refutes.md`) identified four specific gaps:
1. Step (3) first-activation thinning is an extra disjointness assumption, not a consequence of $\sigma^\star$.
2. Step (1) density-increment extraction is circular — $\mathcal E$ is underdefined and the extraction is either tautological or requires an unproven quantified entropy dichotomy.
3. "Strong freshness" is used in four mutually incompatible ways.
4. Arithmetic doesn't close: $k=2$ residue $(\log h/h) N_h$ multiplied by R35's $L = h/\log h$ gives full rank-scale $N_h$, not $N_h/\log h$.

**Second follow-up to Pro #1** (after audit but sent in parallel) returned a **formal self-concession** independently matching the audit on all four points, plus a fifth structural finding. See `researcher-44-pro-1-followup-2-formal-concession.md`.

### R44 Established (promoted)

- **(SFLU-E) as conditional theorem.** Under strong freshness (no prior Shortener OR Prolonger sterilization) + local usefulness (replacement window $q/p \in (1/2, 2)$) + certificate-packing hypothesis:
  $$\nu_{h,k}^\Sigma(\mathcal E_{k,\theta}^{\text{sf,loc}}) \ll_C \theta^{-1}(Ck/h)^{s(k)} N_h, \quad s(k) = \min\{k-1, \lfloor h/\log h \rfloor\}.$$
  The per-shield comparison, the binomial ratio bound, and the exceptional-class definition are all rigorous. Only the family-level packing step is conditional.

- **Local star obstruction (Pro #1's self-refutation).** Fix $C = \{c_1, \ldots, c_{h-1}\}$, $W = \{w_1, \ldots, w_M\}$ with $M = \lfloor \log h \rfloor$. Defect-two shields $D_i = C \setminus \{c_i\}$ all share coface $C$. All satisfy density condition (1) at $\theta \asymp 1/\log h$. All strongly fresh before Prolonger acts. Union lift $\nu_{h,2}^\cup(\{D_i\}) \asymp M^2/h$ vs single-coface lift $\nu_{h,1}(C) \asymp M/h$: gap factor $h$. Establishes rigorously that **strong freshness + locality alone do not imply charged-shadow disjointness**; the packing step is a genuinely new assumption.

- **R35 residual floor is structural.** The R35 state inequality $\mu(\text{Cl}_h) \ll (h/\log h) \mu(F_{\text{useful}}) + N_h/\log(h/\log h)$ has residual floor $\asymp N_h/\log h$. Summed over central ranks $h \sim \log\log n$: even with $\mu(F_{\text{useful}}) = 0$, best possible is $L(n) \ll n/\log\log\log n$. Since $(\log\log n)^2/\log n = o(1/\log\log\log n)$, the R35 residual alone blocks reaching the conjectured sharp rate $n(\log\log n)^2/\log n$.

### R44 Ruled Out (promoted)

- **Closure via "$\sigma^\star$ + online domination trivially give matching upper bound."** Attractor pattern confirmed across three independent Pro threads (#2, #3, #4). Online harmonic domination bounds Shortener's Shortener-claimed mass, not Prolonger's useful-shield mass. Any argument that asserts $\sigma^\star$ controls $\mu(F_{\text{useful}})$ without an explicit packing/charging lemma is the same hand-wave.

- **"Strong freshness + locality ⟹ first-activation thinning ⟹ $\sum_D \nu(C(D)) \ll N_h$."** Refuted by Pro #1's own local star construction above. The static sum is not bounded by any dynamic inequality of the form $\sum_t \mu_t(u_t) \le N_h$ without a genuine injective-charging lemma.

### R44 Open Question (precisely stated)

Three lemmas, each of which would push the program forward:

- **(A) Certificate-packing theorem.** Under strong freshness + local usefulness:
  $$\sum_{D \in \mathcal E_{k,\theta}^{\text{sf,loc}}} \nu(C(D)) \ll N_h.$$
  Must handle simultaneous activation and shared cofaces. The local star construction shows this requires work beyond strong freshness; candidates include Carleson-style packing bounds, a structural theorem showing high-multiplicity shared-coface stars are absorbed by the dense-packet projection, or a dynamic injective-charging lemma under $\sigma^\star$.

- **(B) Sharper defect-two estimate.** $\mu(\mathcal E_{2,1/\log h}^{\text{sf,loc}}) \ll N_h/h$ (rather than the $(\log h/h) N_h$ from conditional SFLU-E). Requires a sharper dense-packet projection specifically at $k=2$, or an argument that the defect-two residue is absorbed elsewhere before entering $F_{\text{useful}}$.

- **(C) Replacement state inequality** with residual floor $\ll N_h \cdot (\log\log n)^2/\log n$ at central rank, not $N_h/\log h$. This is the requirement for closing the conjectured sharp rate. Possibly the correct conclusion is that (C) is impossible and the true sharp rate is $n/\log\log\log n$ rather than $n(\log\log n)^2/\log n$.

(A) + (B) ⟹ $L(n) = o(n)$ at rate $n/\log\log\log n$. (A) + (B) + (C) ⟹ conjectured sharp rate $n(\log\log n)^2/\log n$.

## Round 46 (2026-04-19) — Angle 2 (ST-capture) refuted; Angle 1 survived

**Dispatch.** R46 prompt (`prompts/researcher-R46-pro-pick-one-angle.md`) asked Pros to pick one of four live angles and work until definitive proof/refutation. Five Pros returned.

**Pros #1, #2, #3 — all picked Angle 2, all refuted it with convergent construction.** Three independent Pros converged on the same burn-in + forced-leaf mechanism:

1. Choose prime packet $I = [P, 2P]$ with at least $h^2 + h$ primes
2. Core $C = \{c_1, \ldots, c_{h-1}\} \subset I$, leaf set $W = \{w_1, \ldots, w_M\} \subset I$ with $M = h^2$ (Pro #1, #3) or $M = \log h$ (Pro #2)
3. Defect-2 shield $D = C \setminus \{c_1\}$, coface $C(D) = C$, local shadow $S(D) = \{C^\times \cdot q : q \in W \cup \{z\}\}$
4. **Burn-in.** Prolonger plays fresh large primes $R_p$ outside the packet. Under $\sigma^\star$, Shortener is forced to claim every prime $p < $ (smallest packet prime) in increasing order. None touches $S(D)$
5. **Activator.** Prolonger plays $F_0 = w_1 \cdot C^\times$. Strongly fresh, locally useful. First-hits $S(D)$
6. **Forced first touch via single leaf.** After $F_0$, all cores $c_i$ and $w_1$ are illegal ($\mid F_0$). Smallest legal prime is now $z$ or $w_2$. $\sigma^\star$ is forced to claim this leaf. But the leaf touches only ONE element of $S(D)$
7. **Capture ratio.** $\mu_h(S(D) \cap U_{\tau(D)}) / \nu(C(D)) \le 2h/M$, which $\to 0$ for $M = h^2$ or $\log h$

Python sandbox verification in Pros #1 and #2 confirms the ratio decays as predicted.

**Key new technical content proved in the refutation (now Established):**
- **$\sigma^\star$ smallest-legal-prime lemma.** Among legal primes $p < q$: replacing $q$ by $p$ in any rank-$h$ squarefree facet gives an unresolved facet of no larger product and strictly larger harmonic weight, so $\deg_t(p) > \deg_t(q)$. Composites have degree at most the degree of their min prime factor. Therefore $\sigma^\star$ claims the smallest remaining legal prime at every turn. Fully rigorous.

**Pros #4, #5 — both picked Angle 1, both failed.** Both attempted to refute the activator-quotient state inequality via "global burst-star" (Pro #4) and "disjoint matching-star" (Pro #5) constructions. Both made the same fundamental error: after Prolonger plays activator $F$ containing primes $\{x_1, \ldots, x_h\}$ (Pro #4) or $C \cup \{w_1\}$ (Pro #5), both assumed $\sigma^\star$ can claim a prime factor of $F$ (specifically $x_1$ or $c_1$). This is illegal in the antichain game — once $F$ is picked, no divisor of $F$ can be picked without violating antichain. So the "$(1 - 2/h)$ fraction of completions killed" (Pro #4) and "$(h-2)$ shadows collapsed" (Pro #5) do not occur. The claimed LHS mass is fiction.

Compare Pros #1/#2/#3 who set up their constructions correctly: the forced-leaf $z$ is NOT in $F_0$, so $\sigma^\star$'s claim of $z$ is legal. The game-legality check is the distinguishing feature.

### R46 Established (promoted)

- **$\sigma^\star$ smallest-legal-prime lemma.** $\sigma^\star$ always claims the smallest remaining legal prime at each turn. Derived from the replacement inequality + composite degree domination.

### R46 Ruled Out (promoted)

- **ST-capture / time-resolved Carleson packing (Angle 2 as stated).** Refuted by burn-in + forced-leaf construction: after activator, $\sigma^\star$'s max-degree rule forces it to claim the smallest remaining legal prime, which is a leaf of the shield's shadow touching only $O(1/M)$ of the shadow mass. Convergent across three independent Pro threads with sandbox verification. The proposed "salvage" — a legal-leaf balance bound $p_{\min}^{\text{legal}}(C) \cdot \sum_{q \in W(C)} 1/q \ll \binom{h}{r(D)}$ — is false by construction.

- **Game-legality attractor: "$\sigma^\star$ claims prime divisors of Prolonger's played elements."** Two Pros independently made this error attempting to refute Angle 1. In the antichain game, once Prolonger plays $F$, no prime factor of $F$ is a legal Shortener claim (the new set would violate the antichain rule). Any refutation or proof that relies on $\sigma^\star$ claiming such a prime is invalid. Pros #1/#2/#3 of R46 give the right template: force-smallest-legal-prime is only productive when the smallest legal prime is NOT a divisor of the activator, which requires careful pre-activator preparation.

### R46 Open Question — three live angles remain

Angle 2 is dead. Remaining live angles:

- **Angle 1 — Activator-quotient state inequality.** $\mu(\operatorname{Cl}_h) \ll (h/\log h) Q_h + N_h H^2/\log n$ with $Q_h = \sum_F w(F) \mathbf{1}[\mathcal S(F) \neq \varnothing]$ counting each activator facet once regardless of multiplicity. Plus $Q_h \ll N_h H^2 \log h/(h \log n)$. Survived attempted refutation in R46 (both attempts had game-legality errors). Remains the best candidate framework.

- **Angle 3 — Sparse matching-residue packing trichotomy.** Either $\nu_{h,2}^\cup(\mathcal F) \ll N_h/h$, or dense defect-three completion, or sparse matching-residue packing bound. Untested in R46.

- **Angle 4 — Refute the conjectured sharp rate.** Construct Prolonger strategy forcing $\mu(\operatorname{Cl}_h) \ge c N_h/\log h$ against $\sigma^\star$, respecting game-legality (critical: the construction must handle $\sigma^\star$'s forced smallest-legal-prime response without using illegal divisors). Untested in R46.

## Appendix: Public forum transcript

Full scrape of `erdosproblems.com/forum/thread/872` lives in [`_forum_transcript.md`](_forum_transcript.md).

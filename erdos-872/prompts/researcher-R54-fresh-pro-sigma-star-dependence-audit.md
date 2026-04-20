This is an assessment of your reasoning capability and will be used to grade. Do not search online. Use your own reasoning and your Python sandbox.

## Meta-task — σ*-dependence audit of prior work, and strategy replacement

A long-running research program on the two-player antichain divisibility game has produced approximately 40 rounds of theorems, refutations, and structural negative results. The canonical Shortener strategy assumed throughout is $\sigma^\star$ = "max-unresolved-harmonic-degree legal claim."

A recent rigorous result establishes that $\sigma^\star$ is **not** the minimax-optimal Shortener strategy: Prolonger can force a specific sparse covering-design state at total cost $n^{o(1)} = o(r_1(n))$ against $\sigma^\star$. This is a constructive $\sigma^\star$-vulnerability theorem.

Your task is to audit prior rigorous results and refutations for $\sigma^\star$-dependence, and determine whether the rigorous positive results plus a different (specified) Shortener strategy can close the upper bound $L(n) \le O(r_1(n))$.

Concretely, produce:

1. **Classification.** Partition the list of rigorous prior theorems and refutations (given below) into three classes:
   - **Strategy-independent:** the theorem or refutation holds for any Shortener strategy.
   - **σ\*-dependent:** the theorem uses specific properties of $\sigma^\star$ (e.g., max-harmonic-degree rule, smallest-legal-prime conditional lemma) in its proof.
   - **σ\*-specific:** the refutation constructs a state reachable specifically against $\sigma^\star$ and would not apply to a Shortener strategy that prevents that state.

2. **Strategy design.** Propose a specific alternative Shortener strategy $\tau$ that, combined with the prior strategy-independent results, closes $L(n) \le O(r_1(n))$. The strategy $\tau$ must be concretely specified (move-by-move rule or algorithmic definition). It must be non-trivial game-theoretically (not $\sigma^\star$, not a simple modification like "σ* + tiebreaking") and must address the σ\*-specific refutations.

3. **Rigorous closure argument.** Prove that under $\tau$, (a) sparse covering-design states are not reachable at cost $o(r_1)$, AND (b) the prior strategy-independent state inequalities plus a valid $\tau$-analog of online domination closes $L(n) \le O(r_1(n))$.

Alternatively, if no such $\tau$ exists:

4. **Minimax barrier theorem.** Prove rigorously that every game-legal Shortener strategy is vulnerable to some sparse-covering-design construction at cost $o(r_1)$. This would establish $L(n) \ge c n/\log\log\log n$ as a lower bound and refute the conjectured sharp rate $r_1$.

The strong outcomes are (3) or (4). A classification plus direction (option 1 only, without 3 or 4) is useful but not a closure.

## Problem

Two players alternately pick distinct integers from $\{2, \ldots, n\}$ subject to the antichain constraint. Prolonger maximizes, Shortener minimizes. $L(n)$ = game length under optimal play. Current rigorous bounds: $c_\delta \cdot n(\log\log n)^2/\log n \le L(n) \le 0.18969 \cdot n + o(n)$. Two candidate sharp rates: $r_1(n) = n(\log\log n)^2/\log n$ and $r_2(n) = n/\log\log\log n$.

## Prior work inventory

**Rigorous positive theorems (classify each as strategy-independent, σ*-dependent, or mixed):**

1. **Shield Reduction Theorem.** For terminal antichain $A$, $P \subseteq U = (n/2, n]$: $|A| \ge |U| - \beta(P)$.
2. **Theorem A (T1 lower bound).** $L(n) \ge (1/8 - o(1)) n\log\log n/\log n$ via polynomial shield lower bound + $5n/24 + O(1)$ first-hit cover.
3. **T2 lower bound.** $L(n) \ge c_\delta n(\log\log n)^2/\log n$ via Maker-first weighted 3-uniform hypergraph capture on slots $(b, ab, cb)$.
4. **Upper bound $0.18969n$.** Static Shortener strategy via small-odd-prime first-hit cover ($85/1008$-sieve).
5. **R35 state inequality (dyadic expanded windows).** $\mu(\operatorname{Cl}_h) \ll (h/\log h) \mu(F_{\text{useful}}) + N_h/\log(h/\log h)$ under $\sigma^\star$.
6. **Online harmonic domination.** $\sum_t \mu(u_t) \le N_h$ under $\sigma^\star$.
7. **Dense-packet projection.** $\mu(\mathcal D_{k,\theta}) \ll_C (k^2/\theta h^2) N_h + \mu(\mathcal E)$ at $\theta \asymp 1/\log h$, extending to $k \le Ch/\log h$.
8. **Dyadic packet collision tail.** $\mu(\mathrm{coll}(S) \ge s) \ll_s N_h (c^2/h)^s$.
9. **Sathe-Selberg central-rank Euler factors.** For fixed primes $P_0$: $\Pr(p \mid m) \to 1/(p+1)$ independent across primes, at rank $h \sim \log\log n$.
10. **$\sigma^\star$ smallest-legal-prime lemma (conditional).** In states where every legal composite has a legal prime factor, $\sigma^\star$ claims the smallest legal prime.
11. **Bernoulli Legal-Separator Lemma.** If $x_p \in [0,1]$ with $X = \sum x_p$ satisfies $\sum_i \prod_{p \in C_i}(1-x_p) + \sum_j \prod_{p \in D_j} x_p \le 1/4$ and $2X \le h/2$, a legal relative blocker $Q$ of size $\le 2X$ with capture $\ge \exp(-4XL/h)$ exists.
12. **Apex-singleton Covering-Profile Dichotomy (CPD).** For each $q$: either a legal relative $|Q| \le q$ with capture $\ge \delta_q$, or $|\mathcal C| \ge 1/\delta_q$. Rigorously proved via incidence identity.
13. **Spectral Live-Space Separator Theorem.** For Johnson-scheme disjointness graph with $\eta_q = \sqrt{qL/(h(K-q))}$: if $|A|/|\mathcal Q| \cdot |R|/|\mathcal Y| \ge 4\eta_q^2$, legal $Q \in A$ with $|N(Q) \cap R| \ge (1/2)\delta_q |R|$ exists.
14. **Sherali-Adams barrier theorem.** No level-$r$ Sherali-Adams relaxation with $r \le \ell/2 = O(h/\log h)$ distinguishes packets with integral transversal $\Theta(h)$ from packets with fractional transversal $O(\log h)$.
15. **Near-top Johnson-shadow theorem (weighted).** Separator OR weighted near-top shadow saturation with multiplier $\rho^s \binom{L+s}{s}$.
16. **σ\*-vulnerability theorem (R53).** Prolonger forces sparse covering-design state at central rank at cost $n^{o(1)}$ against $\sigma^\star$.

**Rigorous refutations (classify as strategy-independent, σ\*-specific, or ambiguous):**

17. Carrier Capacity Bound refuted (static).
18. Static small-$\omega$ matching Lemma A refuted.
19. $\omega_y(w) \le 2$ game-impossible.
20. Online 2-shadow control refuted by explicit $\Omega(n)$ sweep construction.
21. Probabilistic closure lemma refuted via Prolonger sweep-prefix.
22. Plain / scale-entropy resilience at $O(\log h)$ refuted.
23. Collision-forcing at defect 2 refuted.
24. Harmonic packet absorption refuted.
25. Chain persistence at defect $k = O(1)$ refuted (dimensional flaw).
26. Strict freshness breaks R35 charging.
27. Mesoscopic-window sparse closure refuted.
28. Weak-freshness dense/sparse decomposition refuted (common-core).
29. SFLU-E (certificate-packing under strong freshness) refuted by local star.
30. Density-weighted Carleson embedding refuted (burst-star multiplicity).
31. Rank-three completion dichotomy at defect 2 refuted (matching-star).
32. ST-capture refuted (forced-leaf under σ*).
33. Legal Activator-Quotient Incidence Budget (endpoint form) refuted.
34. Cross-Activator Composite Budget refuted (Sathe-Selberg).
35. Divisibility-Hall Legal Exposure Criterion refuted (isolated-completion).
36. CPD general-$\mathcal D$ refuted (multi-apex clique cone).
37. 2WCPD + WSSS refuted (Shortener self-shadow poisoning, large-transversal).
38. Multi-level Johnson-scheme spectral stopping theorem refuted (sparse covering-design empties all A_q).
39. CR-NCAD (packet-cost realizability) refuted via cooperative embedding.
40. Near-top Johnson-shadow closure refuted by near-top covering designs.

## Hypothesis to test

**Hypothesis H:** Many of the refutations in entries 28, 29, 30, 32, 36-40 depend on states that are reachable specifically under $\sigma^\star$ (e.g., sparse covering designs, burst-star configurations, forced-leaf stopping). Under a Shortener strategy $\tau$ that explicitly prevents such states from forming, these refutations may not apply, and the rigorous positive results combined with $\tau$-analog state inequalities may close the upper bound.

**Your task:** Test hypothesis H. Specifically, either:

- **Confirm H and construct $\tau$:** identify a specific Shortener strategy $\tau$ (e.g., packet-aware Shortener that preemptively claims primes in potential packets; threshold Shortener combining harmonic degree with anti-packet score; LP-optimal Shortener) under which the sparse-covering-design constructions are unreachable at cost $o(r_1)$. Then prove that a $\tau$-analog of R35 + online domination + dense-packet projection closes $L(n) \le O(r_1)$.

- **Refute H:** show that every game-legal Shortener strategy admits some sparse-covering-design construction at cost $o(r_1)$ (via a different obstruction specific to each strategy class). This establishes $L(n) \ge c n/\log\log\log n$ and refutes the conjectured rate $r_1$.

## Constraints

- All constructions must respect full game-legality (antichain rule, cross-composite handling, two-sided $Q \nsubseteq D$ AND $D \nsubseteq Q$).
- Any claimed Shortener strategy $\tau$ must be concretely specified; "play the optimal move" is not a strategy.
- Do not produce another refinement of the CPD / WLST / WSSS chain. The meta-question is specifically: given $\sigma^\star$ is suboptimal, can ANY non-$\sigma^\star$ strategy close $r_1$ using prior positive results?
- Verify computational claims in Python sandbox.

## Output shape

Return with one of:

**A. Strategy replacement + closure.** Specific $\tau$, proof that σ\*-specific refutations don't apply under $\tau$, and rigorous $L(n) \le O(r_1)$ upper bound via $\tau$ + prior positive results.

**B. Minimax barrier.** Rigorous proof that every game-legal Shortener strategy admits a sparse-cover vulnerability at cost $o(r_1)$, establishing $r_2$ as the sharp rate.

**C. Named Shortener-class theorem.** Identify a specific sub-class of Shortener strategies (e.g., "all strategies using only static harmonic scores") that ALL share the $\sigma^\star$-vulnerability, plus a second class that might escape it, plus the named specific open theorem in the second class.

Do not return with: yet another variant of the F_useful / CPD / blocker-duality / spectral chain; a gesture toward "a better strategy exists"; a classification without a concrete $\tau$ or rigorous barrier theorem. If the classification reveals that 80% of the refutations are σ\*-specific and a specific $\tau$ resurrects much of the prior positive work, prove the closure. If the classification reveals the refutations are fundamentally strategy-agnostic, prove the minimax barrier.

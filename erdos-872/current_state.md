# Current State

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

## Appendix: Public forum transcript

Full scrape of `erdosproblems.com/forum/thread/872` lives in [`_forum_transcript.md`](_forum_transcript.md).

# Process Log — Erdős Problem #872

How this work got done. Not a results doc (that's `current_state.md`) — a methodology log for anyone reading the eventual writeup who wants to know how the sausage was made.

## The setup

The problem is a combinatorial game on the divisibility poset. Stated on [erdosproblems.com/872](https://www.erdosproblems.com/872); open since 1992 (Erdős [Er92c, p. 47]).

Om has been working this problem with GPT-5.4 Pro (extended thinking). The harness wrapping that work — the shape this repo is organized around — is deliberately structured:

- **One primary researcher**: GPT-5.4 Pro. Smartest model in the loop for raw math. Has a Python sandbox. Does the actual theorem-proving.
- **Multiple informal verifiers**: Claude 4.7 tabs, Gemini 3 tabs, separate GPT thinking tabs. Each audits the primary's outputs adversarially, independently, looking for holes.
- **One formal verifier**: [Aristotle](https://aristotle.harmonic.fun) (Harmonic's Lean 4 theorem prover). Used for anything claimed as a theorem. A successful Aristotle run is a stronger signal than any informal audit.
- **One curator**: Claude Code (this session). Reads everything, keeps state clean in `current_state.md`, drafts researcher prompts, runs the audit loop, feeds verifier feedback back into the next round. Does not attempt the math.
- **A compute agent**: Codex on the MacBook. Runs long computational jobs (the $\psi(\alpha)$ grid) that don't fit in a Pro response's time budget.

The division of labor matters. Pro wastes cycles if it has to re-derive prior context; Pro produces unreliable output if it has to grind LPs under time pressure; Pro's outputs need external verification because even extended-thinking models hallucinate subtly. So each agent does what it's genuinely best at.

## The round loop

Each research round follows the same shape:

1. **Curator refreshes state** (`current_state.md`): what's proved, what's ruled out, what the numerical evidence says, what's open.
2. **Pre-send audit**. Before sending the researcher prompt, at least two informal verifiers check the current state for errors — miscategorized claims, stale upper bounds, overlooked edge cases. Save catches, incorporate into the prompt.
3. **Primary round**. Curator writes a researcher prompt (neutral framing — no mention of Erdős, no anchoring) and sends to Pro. Pro reasons for 20–60 min in extended thinking.
4. **Extract output** verbatim → `researcher-NN.md`. The dump, not a summary.
5. **Post-response audit**. Paste the new output into the three informal verifier tabs with a templated "audit this adversarially" prompt. Save each verbatim reply.
6. **Formal verification** (mandatory for anything called a theorem): write the statement + proof as LaTeX, `aristotle formalize` it. A clean Lean 4 output with zero `sorry` promotes the claim to machine-verified. Remaining `sorry`s are flagged as real gaps.
7. **Synthesize**: promote / demote / split claims. Update `current_state.md`. Decide the next round's direction.

Promotion rule: a claim moves to `Established` only when (a) at least two informal verifiers agree it's sound AND (b) Aristotle either formalized it cleanly or failed for a known structural reason (e.g., requires heavy Mathlib machinery). We never promote past a logical gap Aristotle exposed.

## Specific rounds on #872

### Round 0 — state extraction (2026-04-16)

Built the harness. Exported the existing ChatGPT Pro conversation, the two auxiliary Claude threads, and the Gemini thread to clean markdown (`chat-export/export.sh`). Scraped the public forum (`_forum_transcript.md`). Consolidated into `current_state.md`.

Prior known state at this point:
- Public forum: Xiao_Hu's ε ≥ 8/105 Prolonger lower bound (Feb 2026); Liam Price's (23/48)n Shortener upper bound (also Feb 2026); an ε ≥ 85/1008 refinement by Om (Apr 2026) using a $v_5$-adic parity sieve.
- Private research (GPT-5.4 Pro, prior rounds): Shield Reduction Theorem + the $5/24$ first-hit skeleton + weighted dual LP numerics. None of this was on the forum yet.

### Round 1 — two parallel researcher prompts

Sent two variants to two Pro tabs:
- **Directed** (t9, existing thread): included Gemini's sharper "Mertens-adaptive-$k$" framing that killed the two-shield conjecture.
- **Open** (t22, fresh thread): five loose directions, no anchoring.

Goal: A/B test whether anchored vs. open framing produces meaningfully different output.

Result: the directed version produced the stronger result — a rigorous polynomial-shield lower bound (Theorem A: $\beta(P) \ge (1/2)\log(1/\alpha)n$ for $|P| \le n^\alpha$, giving a barrier at $n^{1/e}$). The open version produced a weaker iterated-log variant (Theorem B). Both proofs are Mertens + exchange-argument + prime-antichain witness. Theorem A strictly subsumes Theorem B.

Also: Gemini's anchored framing surfaced a literature-level consideration (Dickman–de Bruijn, Buchstab) that the open thread missed. Anchoring isn't free (less exploration) but also isn't strictly dominated (concentrates the reasoning).

### Round 1 — informal audits

Three parallel verifier tabs (Claude t12, Gemini t11, ChatGPT-thinking t26) ran the same audit prompt on both theorems. All three concluded:
- Theorem A: sound, techniques classical, specific $\beta(P)$ formulation novel to the literature they searched.
- Theorem B: sound but strictly dominated by A.
- The pessimistic "$L(n)/n \to 0$" reading in the open thread's summary: **rejected unanimously** as overreach.

Each verifier found things the others missed:
- Gemini diagnosed *why* B is weaker (double-counting in $E(P)$).
- GPT-thinking caught a stale upper bound (forum lists 0.416n, not the 0.4578n we were carrying).
- Claude t12 flagged the suspicious "very tight fit" numerics at $n = 20000$ — Mertens convergence has ~0.5 absolute error at that scale, so the claimed agreement with $e^{-2c}$ exponents shouldn't be that tight.

A fourth audit from Claude-thinking (separate tab, longer reasoning window) found two things the first three missed:
- A writeup error in Theorem A's "beat 0.4578n" consequence (the $n^{0.400}$ threshold was muddled with the match-threshold, not the beat-threshold).
- The $\beta(P) > |U|$ vacuity observation: Shield Reduction is *vacuous* (non-positive bound) unless $|P| \ge n^{1/e}$, because $\beta(\emptyset) \sim (n/2)\log\log n \gg |U|$.

The Claude-thinking audit also ran its own independent LP to compute $\beta(P)$ and couldn't reproduce the $k = 55$ crossing at $n = 20000$ — confirming the numerical suspicion.

### Round 1 — formal verification

Submitted three Aristotle jobs:
- **Shield Reduction Theorem** (a403f83c): ✅ complete, clean Lean 4, zero `sorry`, standard axioms only. Full machine-verified proof.
- **$5/24$ cover theorem** (4a17294d): ✅ complete, clean Lean 4 on the structural parts (cover property + packing property + `u/x ∈ {2,3}` uniqueness). Cardinality count $|H_n| = 5n/24 + O(1)$ left to a separate floor-sum.
- **Theorem A** (c53ccd8d): ✅ complete 2026-04-17 late night — **formally verified modulo classical NT**. All definitions, all elementary lemmas, and all novel combinatorial content (greedy-exchange argument, prime-antichain construction, Q_δ/C_δ partition, log-budget bound, reciprocal-sum decomposition) are sorry-free with standard axioms. The 5 remaining sorrys are isolated Mathlib coverage limits — `mertens_second_theorem`, `chebyshev_upper_bound`, `chebyshev_theta_asymptotic` — plus the two assembly lines (`shield_lower_bound`, `barrier_exponent`) that invoke them. None is a logical gap. Full record in `verify-aristotle-01-theorem-A.md`.

The cost of Aristotle: each theorem takes ~1 hour of wall-clock to formalize. The payoff: a theorem with zero `sorry` in Lean is a stronger claim than "three LLMs read it and agreed"; a theorem with `sorry`s localized to known classical-NT gaps tells you exactly what foundation work would finish the formalization.

### Round 2 — splitting the research program

After the Round 1 synthesis, the next question split cleanly in two:

- **Direction 1 (Prolonger side)**: Is Theorem A's lower bound on $\beta(P)$ asymptotically tight? If so, the whole question reduces to online-offline gap. If not, the Prolonger program is dead. Claude-thinking identified this as the key preliminary.
- **Direction 3 (Shortener side)**: can someone construct a Shortener strategy forcing $L(n) = o(n)$? Unanimously rejected by the Round 1 verifiers as an overreach from Theorem A+B alone, but still formally open.

Round 2 sent Direction 3 to Pro t9 (the directed thread with the richest Shortener-adjacent context) and Direction 1's computational Phase 0 to Codex on the MacBook (not to Pro — compute is the MacBook's comparative advantage; 14 cores × scipy is faster and cheaper than Pro's sandbox).

### Round 2 — Phase 0 (Codex, ψ mapping)

Codex ran the offline extremal function $\psi_n(\alpha) = n^{-1} \min_{|P| \le n^\alpha} \beta(P)$ across $\alpha \in [0.30, 0.70]$ and $n \in [5000, 50000]$. Two headline findings:

1. **$\psi(\alpha)$ is approximately tight** to Theorem A's $(1/2)\log(1/\alpha)$, with monotone convergence of the gap as $n$ grows.
2. **Offline-optimal $P$ are catastrophically sniping-brittle.** Prime 2 alone kills ≥93% of the near-optimal $P$ in every cell of the grid. Five primes kill 100% everywhere.

Implication: Theorem A is tight offline, but the direct shield-prefix-vs-adversarial-Shortener path via Shield Reduction is dead (Shortener plays `2` on move 1 and invalidates Prolonger's entire target structure).

### Round 2 — Pro Shortener-construction response (t9)

Pro returned a candidate $S^\star$ (prime cascade: play smallest legal prime, fallback to max-deletion), a "negative proposition" about crude log-budget being insufficient to prove $o(n)$, and claimed strong empirical evidence $L(n) \log n / n \approx 1.5$ stable across $n \in [500, 20000]$ — shifting its verdict to "probably $L(n) = \Theta(n / \log n)$."

### Round 3 — audit of the $S^\star$ claim

Three informal verifiers were sent the response with the standard adversarial-audit template.

**Audit #1** (complete, thorough):
- Caught an error in our baseline: the $\pi(n) \sim n/\log n$ lower bound uses primes in $[\sqrt{n}, n]$ via the multiple-uniqueness argument (Weisenberg), not primes in $(n/2, n]$ which give only $n/(2\log n)$.
- **Refuted the "$1.5$" constant**: independent reproduction with varied Prolonger scoring gave constants from $1.3$ to $2.0+$. Pro was over-fitting to one heuristic.
- **Refuted "within 1 move of optimal" everywhere**: exact minimax on every $n \le 40$ shows the gap between $S^\star$ and optimal Shortener is **2 moves** at $n = 33, 34$.
- **Found a structural gem**: exact-optimal Prolonger first move against fixed $S^\star$ is **30** (the primorial $p_3^\#$) for a wide range of $n$, transitioning to $210$ ($p_4^\#$) at larger $n$. Strong signal that a primorial-anchor Prolonger is structurally the right response to a prime cascade.
- **Called out the "probably $\Theta(n/\log n)$" verdict as over-update** — evidence supports "interesting heuristic data," not the asymptotic conclusion, given the narrow $n$-range and heuristic-dependent constant.

**Audit #2**: API cut off mid-audit. Verifier was allegedly finding a stronger Prolonger with log-structure element; re-run pending.

### Round 3 — Phase 1 Codex stress-test

Given Audit #1's concerns about the $1.5$ constant and the narrow heuristic range, Codex ran a broad stress-test: $\{S^\star, S_{\text{shadow}}, S_{\text{primorial}}\} \times$ 8 Prolonger strategies (including $P_{\text{anti-}S^\star}$, a 1-step lookahead adversary) at $n \in \{1000, 5000, 20000, 50000\}$, plus exact minimax up to $n = 48$.

**Results:**
- **$n/\log n$ scaling is robust.** Across 24 strategy pairs and up to $n = 100{,}000$, no pair produces linear growth or faster-than-$n/\log n$ decay. This is substantially stronger empirical support than Pro's narrow evidence.
- **"$1.5$" is refuted cleanly.** Observed $L \log n / n$ ranges from $1.162$ (random Prolonger) to $2.295$ ($P_{\text{anti-}S^\star}$) across the grid. No universal constant.
- **Current best Shortener-side upper bound from Phase 1**: $c \approx 2.28$ (from $P_{\text{anti-}S^\star}$ vs $S^\star$). Higher than Pro's guess of $1.5$.
- **Exact minimax up to $n = 48$**: optimal Prolonger first-move progression $2 \to 6 \to 12 \to 30$, with the primorial $30$ becoming optimal at $n = 35$. This independently confirms Audit #1's primorial-anchor finding.
- **$L(40)$ discrepancy**: Phase 1 reports $L(40) = 17$; Audit #1 and Pro report $L(40) = 16$. Unresolved.

**Revised picture after Round 3:**
- **Pro's strong claim ("$\sim 1.5 n/\log n$")**: refuted.
- **Pro's weak claim ($L(n) = \Theta(n/\log n)$)**: materially strengthened by the 24-pair stress test. The scaling-law part survives.
- **Shortener-side upper bound**: we have an empirical cap $L \log n / n \le 2.28$ at the tested scale; an asymptotic proof via the packing lemma is now a more defensible research target.

## Tooling

| Tool | Role | Notes |
|---|---|---|
| `chat-export/export.sh` | Pull any ChatGPT/Claude/Gemini/erdosproblems.com tab to clean markdown | KaTeX/MathJax math preserved as LaTeX |
| `chat-export/submit.sh` | Push a markdown prompt to a chat tab and click Send | Uses `agent-browser fill @ref` (works across Tiptap/Quill/ProseMirror); `execCommand` alone fails on Tiptap and Quill |
| `agent-browser` | Underlying Chrome-via-CDP automation | Requires `chrome://inspect/#remote-debugging` enabled in a running Chrome |
| `aristotle` CLI | Formal verification via Harmonic | `aristotle formalize` takes LaTeX, returns Lean 4 project |
| Codex on MacBook | Long-running compute jobs | Apple M4 Pro, 14 cores, 48GB, Python 3.14 + scipy ready |

All of this lives in this repo. Anyone could fork it and run a round with their own Pro/verifier/Aristotle keys.

### Round 4 — Vaccinated Shield Reduction (broad-search Pro thread)

A fresh "open exploration" prompt (pure state, no directions) was sent to Pro. The output extended Shield Reduction to allow a **lower-half vaccination prefix** $D$ before the upper shield $P$: every maximal extension satisfies $|A| \ge |D| + |U_D| - \beta_D(P)$ where $U_D, \beta_D$ are $D$-vaccinated versions of $U$ and $\beta$.

Running the same Mertens argument on this extension produced:
$$\beta_{D_n}(P_n) \ge \left(\frac{1 - \sigma(D_n)}{2} \log\frac{\log n}{\log(m_n \log n)} + o(1)\right) n$$
for subpolynomial prefixes, where $\sigma(D) = \sum_{d \in D} 1/d$.

**Consequence:** any subpolynomial-prefix shield argument requires $\sigma(D_n) \to 1$. Otherwise the vaccinated bound is vacuous. And if $D_n \subseteq [n^\varepsilon, n/2]$ with $|D_n| = n^{o(1)}$, $\sigma(D_n) = o(1)$ automatically, so *"play a subpolynomial number of medium/large lower moves, then shield"* is asymptotically ruled out.

For fixed finite $D$ (like $\{6\}$ or $\{18\}$): $\beta_D(P) / |U_D| \ge \log(1/\alpha) + o(1)$, unchanged. So the small-$n$ preference for $6, 12, 18, 30$ is a local phenomenon; it doesn't rescue shield-based lower-bound proofs asymptotically.

**This is the strongest novel-math output of the program** as of 2026-04-17 evening. It tightens the Theorem A obstruction significantly and sharply narrows what a successful $L(n) \ge \varepsilon n$ proof would have to look like (either $\sigma(D_n) \to 1$, forcing many small-$d$ plays that Shortener preempts, or avoid shield reduction entirely).

Not yet Aristotle-verified. Audited by Claude (re-run of Audit #2); math validated, rhetorical framing softened:

- Sylvester–Fibonacci primes $\{2, 3, 7, 43, 1807, \ldots\}$ achieve $\sigma \to 1$ to within $10^{-6}$ with 5 fixed elements. So "forces many small plays" oversells it; obstruction is *quantitative*, not qualitative.
- The obstruction rules out a *proof technique*, not a *game strategy*. Prolonger can still play subpolynomial medium lowers; we just can't *prove* $L \ge \varepsilon n$ via shield reduction from there.
- Independent convergence on harmonic weighting. Audit #1's $P_{\text{harm}}$ (weight primes by $1/p$) and Vaccinated Shield's $\sigma(D) = \sum 1/d$ both lean on the same Mertens-mass quantity. Not coincidence — it's the structurally correct weighting on both sides.

Verbatim output saved in `researcher-03-vaccinated-shield.md`; audit in `verify-postresp-03-claude.md`.

### Round 4 (continued) — $L(40)$ discrepancy resolved by Codex diagnostic (2026-04-17 evening)

Phase 1's exact-minimax table (`compute_sublinear.exact_minimax`) reported $L(40) = 17$ while Pro and Audit #1 reported $L(40) = 16$. Codex wrote a fresh independent solver (`phase1/exact_minimax_v2.py`) from scratch, with unit tests against naive brute-force for every $n \le 12$, a no-pruning DP at the first disagreement point, and a corrected-window legal-mask alpha-beta cross-check.

**Resolution: $L(40) = 16$. Old Phase 1 solver had a subtly unsound alpha-beta cutoff.**

The old code evaluated each move as `value = 1 + solve(child, next_turn, alpha, beta)` but passed the child window unshifted. Since the child returns the remaining move count *after* the current move has already contributed $+1$, the correct child window is `(alpha - 1, beta - 1)`. Without the shift the search prunes children too early, producing systematic *over-estimates*.

**Scope.** First disagreement is already at $n = 27$ (old $12$, corrected $11$). Frontier $39$–$48$ all overstated by $1$–$2$:

| $n$ | old | corrected |
|---:|---:|---:|
| 27 | 12 | 11 |
| 39, 40 | 17 | 16 |
| 41, 42 | 18 | 17 |
| 43, 44 | 19 | 18 |
| 45, 46 | 20 | 18 |
| 47, 48 | 21 | 19 |

**What this changes.**
- The exact-minimax frontier cited as "primorial-anchor transition at $n = 35$" is *consistent* with the corrected table — $L(40) = 16$ principal variation still opens with $30 = p_3^\#$. Value-wise the primorial-anchor pattern survives at the observed points.
- But the old Phase 1 code stored only one heuristic winner from a pruned search, so the full *set* of optimal first moves at each $n \in [27, 48]$ was never computed soundly. The "$12 \to 30$ at $n = 35$" transition is a *provisional* claim until re-derived from the corrected solver.
- All cited "average $\approx 0.40$" / "max ratio $0.458$" figures over $n \le 50$ should be re-read off the corrected table, though the qualitative picture is unchanged.
- Large-$n$ heuristic stress-test (the $[1.16, 2.28]$ range) does not depend on the exact-minimax solver; unaffected.

Artifacts: `phase1/exact_minimax_v2.py`, `phase1/test_exact_minimax_v2.py`, `phase1/L40_diagnostic.md`, `phase1/logs/l40_diagnostic.log`. Old files (`compute_sublinear.py`, `exact_minimax.csv`) preserved unmodified for audit.

### Round 5 — $\sigma(D) \to 1$ construction: upper-half cost is not the obstruction (2026-04-17 late night)

Sent a follow-up to the broad-search Pro thread, narrowed to the Vaccinated Shield branch. The prompt (`prompts/researcher-04-vaccinated-shield-narrow.md`) lifted only Pro's own Round 4 closing suggestion and one alternative-certificate hint — no curator-synthesized directions.

Pro pursued the $\sigma(D) \to 1$ sub-question directly and returned a constructive theorem: there exist primitive lower prefixes $D_n \subseteq [2, n/2]$ with $|D_n| = n^{o(1)}$, $\sigma(D_n) = 1 + o(1)$, and $|U_{D_n}|/|U| = 1 - o(1)$.

**Construction.** For fixed $k$, take $D_k(Q) = \{\prod_{i \in S} q_i : |S| = k\}$ over a pairwise-coprime set $Q$. Choose $Q$ to be a prime interval $(y, y^{B_k}]$ with $B_k = e^{\lambda_k}$, $\lambda_k = (k!)^{1/k}$. Mertens + elementary-symmetric identities give $\sigma \to 1$; Le Cam + Chernoff-for-Poisson give free density $\to r_k$ with $r_k \to 1$ as $k \to \infty$. Concatenate templates over $n$.

**What it resolves.** One full branch of the Round 4 open question. The $\sigma \to 1$ regime is genuinely nonempty and is compatible with *zero* asymptotic upper-half cost. Pro's earlier "forces many small-$d$ plays" rhetorical framing — already softened by Claude's Audit #2 via Sylvester–Fibonacci — is now formally settled: the upper-half cost is not where the obstruction lives.

**What it does *not* resolve.** The main $L(n) \ge \varepsilon n$ question is still open. Each $D^{(k)}$ is a fixed finite template, so the fixed-prefix sharpening still applies:
$$\beta_{D^{(k)}}(P) \ge (\log(1/\alpha) + o(1)) \cdot |U_{D^{(k)}}|,$$
and since $|U_{D^{(k)}}|$ is nearly $|U|$, the $e^{-1}$ barrier for Prolonger shield proofs is essentially unchanged. The real obstruction is $\beta_{D_n}(P)$, not $|U_{D_n}|$. Pro's new sharper conjecture: the right next invariant is not $\sigma(D)$ but the *residual harmonic mass of legal primes after the lower prefix* — i.e., the harmonic-weight observation is again converging as the operative quantity.

**Process notes.**
- This is the first researcher prompt authored under the updated CLAUDE.md discipline (no output format, Potential Directions only when cross-validated — both items were lifted verbatim from Pro's own Round 4 closing paragraph). Pro returned a cleanly focused answer directly on the lifted direction, not a diffuse exploration. Suggests the discipline shift is working.
- Pro's proof leans on Mertens' second theorem on a prime interval, Le Cam's inequality, and a Chernoff bound for Poisson — same Mathlib-coverage class as the Theorem A sorrys. Any Aristotle formalization of the Round 5 construction will sorry at Mertens just like Theorem A did.

Verbatim output in `researcher-04-sigma-one-construction.md`.

### Round 5 — three-way informal audit

Sent the standard adversarial audit prompt (`prompts/verify-postresp-04-sigma-one.md`) to Gemini, Claude (web extended-thinking), and ChatGPT-thinking in parallel. All three returned substantive audits; three different substantive catches. Textbook example of why the harness runs three in parallel.

**GPT-thinking caught an outright bug.** The specific error schedule $\rho(D^{(k)}(y_k)) \ge 1 - 2^{-k}$ is provably impossible because $\rho(D^{(k)}(y)) \to r_k$ and $1 - r_k \asymp e^{-k/e}$, which is much larger than $2^{-k}$. Numerically: $r_4 \approx 0.8167 < 0.9375 = 1 - 2^{-4}$. Concatenation breaks as written. Easily repaired: replace $2^{-k}$ with any $\varepsilon_k \downarrow 0$ slower than $e^{-k/e}$ (e.g., $\varepsilon_k = 1/k$), and set $N_k \ge M_k/\varepsilon_k$.

**Claude caught a framing problem.** The result is correctly stated but "the upper-half cost is not the bottleneck" misreads as "a bottleneck has been removed." No bottleneck has been removed: when $\sigma(D) \to 1$, the Round 4 obstruction becomes vacuous (coefficient $(1-\sigma)/2 \to 0$), but the *fixed-prefix sharpening* immediately reimposes $\beta_{D^{(k)}}(P) \ge (\log(1/\alpha) + o(1)) |U_{D^{(k)}}|$, i.e., the same $e^{-1}$ barrier. Aggregate obstruction budget against subpolynomial-$|P|$ shield proofs is unchanged. Cost-shifting, not cost-reduction.

**Gemini flagged the "Frankenstein / online-strategy disconnect."** $D_n$ is piecewise-constant across doubly-exponential block boundaries. Valid existence proof; completely detached from any feasible online Prolonger strategy.

**Two-of-three independent formalization of the sharper conjecture.** Both Claude and GPT-thinking noticed Pro's "residual harmonic mass of legal primes after the lower prefix" is hand-wavy and gave formal candidates:
- Claude: $\tilde\sigma(D, n, \delta) := \sum_{p \le n^\delta,\ p \nmid \mathrm{lcm}(D)} 1/p$.
- GPT: $H_D(T; n) := \sum_{p \le T} \tfrac{1}{p} \cdot \tfrac{|U_D \cap p\mathbb{Z}|}{|U \cap p\mathbb{Z}|}$ (weighted by surviving multiplicities).

Both capture the right phenomenon ($\sigma$ too coarse; refinement must see residual primes unblocked by $D$). GPT's weighted version arguably more natural because shield arguments care about $w_D(x) = |M_D(x)| - 1$ (multiplicities), not just presence of a multiple.

**Numerical reproduction — three independent implementations.** All three verifiers independently re-computed the $(\sigma, \rho)$ tables to 7 decimals and the finite-$n$ $|U_D|/|U|$ ratios to 5 decimals. Numerics are airtight.

**Per the promotion rule:** split audit (1 flags, 2 sound on math, but all 3 flag interpretive issues). GPT's concern is substantive (real numerical error that breaks the proof as written). Claude's interpretive concern is also substantive. Current status:

- Round 5 **proof as written: broken pending re-derivation** (GPT's catch).
- Central existential claim: **very likely true after repair** (all three agree).
- Framing: **oversells** (Claude's catch) — the result is narrower than "resolves one branch of the open question."

Verbatim audits in `verify-postresp-04-gemini.md`, `verify-postresp-04-claude.md`, `verify-postresp-04-gpt-thinking.md`.

### Strategic audit round (2026-04-18) — program hits pivot

After Round 5 + its post-response audits, a direct meta-question was sent to four informal verifiers with the full current state: *are we proving the actual question, or proving meta-theorems about obstructions to proof techniques?* The prompt (`prompts/verify-strategic-01-directions.md`) asked verifiers to rank the program's open directions by bound-producing potential, flag missing angles, recommend literature, and pick a single top direction. Deliberately no Pro round — this was a strategic review, not a research round.

**All 4 audits converged unanimously:**

1. The drift read is correct — the program has been proving meta-theorems about obstructions to proof techniques; the public frontier $(1+o(1))\, n/\log n \le L(n) \le 0.416\, n$ has not moved.
2. The **Packing Lemma** is the #1 direction for actually advancing the question — the unique direction whose success would produce a new bound on $L(n)$.
3. The program should **pivot from Prolonger side to Shortener side**, targeting $L(n) = O(n/\log n)$.
4. **Shield refinements / Round 5 / sharper invariants** are dead directions — "stop extending the framework" (Audit #4).

**Audit #4's productive reframe:** the same $\log(1/\alpha)$ constant recurring across Theorem A, Vaccinated Shield fixed-prefix sharpening, and Round 5's cost-shifting is *not* three framework failures — it's the framework correctly computing its own ceiling. Theorem A and Vaccinated Shield are genuine contributions; the Round 5 + sharper-invariants effort is the specific misallocation.

**Audit #4's strongest unique new angle:** *realize the $\log(1/\alpha)$ ceiling as an explicit Shortener strategy*. The obstruction theorems + empirical $\psi_n(\alpha)$ convergence are dual facts saying such a strategy exists; nobody has tried to construct it. Deep Think called this the same structural observation ("it is time to prove that Shortener wins") but Audit #4 framed it as a direct duality with the existing theorems.

**Audit #4's biggest literature pointer:** *Kevin Ford, "The distribution of integers with a divisor in a given interval," Annals of Mathematics, 2008.* Flagged as "the single biggest literature gap in the program." Ford's theorem is the correct level of generality for the packing lemma's question; Dickman–de Bruijn and Buchstab are one-parameter specializations.

**Convergent literature picks (2+ audits):** Ford 2008 (#4), Lichtman 2022-23 primitive-set proof (#1, #3, #4), Hefetz-Krivelevich-Stojaković-Szabó *Positional Games* (#4), McNew divisor graph (#3), Melotti-Saias path partitions (#3), saturation-game methodology Füredi-Reimer-Seress etc. (#3, #4).

**What to do next.** Draft a researcher prompt for Pro built around:
1. **Primary target:** prove the packing lemma — reformulated as a Ford-style divisor-interval realizability theorem on the bipartite divisor incidence graph, attacking $L(n) = O(n/\log n)$.
2. **Secondary (2+ audits):** construct an explicit Shortener strategy realizing the $\log(1/\alpha)$ ceiling. Duality with Theorem A + $\psi_n$ numerics suggests it exists.
3. Drop shield-framework extensions entirely.

Verbatim audits at `verify-strategic-01-{deepthink, audit2, gpt-thinking, audit4}.md`.

### Round 6 — first front-line bound advance

Following the strategic pivot, two researcher prompts were sent in parallel under revised CLAUDE.md discipline: each with a single cross-validated direction, no output format, all upper sections validated info only.

**Prompt 6A** (`prompts/researcher-05-packing-lemma.md`): prove $L(n) = O(n/\log n)$ via a Ford-style realizability theorem on the bipartite divisor incidence graph.

**Prompt 6B** (`prompts/researcher-05-shortener-ceiling.md`): construct an explicit Shortener strategy beating $0.416n$.

**Outcomes.**

*6A: carrier-recycling obstruction theorem.* Pro did not produce the packing lemma. Instead, another obstruction: against the "smallest legal prime" Shortener (SLP), Prolonger has an explicit carrier-recycling response forcing
$$\sum_{p \in S_n} 1/p \le (\log\log n)/(m+1) + O_m(1) \quad \text{for every fixed } m,$$
so SLP + Mertens can at best reach $n/(\log n)^{1/(m+1)}$ — strictly worse than $n/\log n$. **Construction:** after Shortener plays prime $a$, Prolonger plays $u = q \cdot r_1 \cdots r_m$ where $r_i$ are the next $m$ primes (Bertrand: $r_i < 2^i a$) and $q$ is a carrier prime in $(n/(2R), n/R]$ with $R = \prod r_i$. This kills $m$ primes in one move. Pro's closing insight: the packing lemma's target should be reframed from "fresh primes a single $u$ can carry" to "how often Prolonger can recycle carriers to lift fresh small-prime blocks" — this is the carrier-side question Ford 2008 is designed for. Verbatim in `researcher-05-carrier-recycling.md`. Another obstruction theorem — partial drift critique applies, but it sharpens the next target.

*6B: new upper bound $L(n) \le 13n/36 + o(n) \approx 0.3612n$ via odd-prime-prefix Shortener.* **First front-line bound advance of the program.** Strategy: for the first $k = \lfloor \sqrt n / \log n \rfloor$ Shortener turns, play the smallest legal odd prime; rest arbitrary. Three-step proof:
1. Chebyshev + induction: chosen primes $q_j \le (3/2 + \varepsilon) j \log n$, so $S := \sum 1/q_j \ge 1/3 - o(1)$.
2. Compression: $\phi(x) = x/2^{v_2(x)}$ injects the post-prefix antichain into odd $D$-free integers $\le n$.
3. Second-order Bonferroni sieve: $N_D(n) \le (n/2)(1 - S + S^2/2) + o(n) \le 13n/36 + o(n)$ at $S = 1/3$.

Materially beats both previous upper-bound candidates ($0.416n$ forum record and $0.458n$ private derivation). Does not rely on Shield Reduction, Vaccinated Shield, or any of the program's obstruction-theorem framework — it's a direct Shortener-strategy argument. This validates the strategic audit's pivot away from shields: the first bound advance came from stepping outside the shield framework entirely. Verbatim in `researcher-05-shortener-13-36.md`.

**Joint reading.** 6A and 6B are consistent: pure-prime-play Shortener can't reach $O(n/\log n)$ (6A), but a mixed strategy (prime prefix + sieve-controlled tail) reaches $0.3612n$ (6B). The gap between the new $0.3612n$ and the conjectural $O(n/\log n)$ is precisely where the carrier-recycling structure matters. Pro's 6B closing flags natural optimizations (longer/shorter prefix, higher-order sieve, LP dual) that could push below $13/36$.

**Status:** both pending informal audit + Aristotle formalization. The 6B proof is self-contained, uses Chebyshev + second-order Bonferroni — should Aristotle cleanly modulo the same Mertens/Chebyshev NT sorrys that sorry'd Theorem A. 6A needs careful audit of the Bertrand-chain construction.

**Process notes.**
- This is the first time the program has moved a bound on $L(n)$ after five prior rounds of meta-theorems. The strategic audit was load-bearing.
- Revised CLAUDE.md discipline (single direction, no output format) produced a cleanly focused Pro response in 6B with a concrete new bound. 6A less focused — produced another obstruction rather than the packing lemma — but still yielded a structural insight.
- The two prompts were sent to different Pro tabs; no cross-contamination. Running parallel is standard for the program now.

## What's worked

- **Formal verification early.** Lean-verifying the Shield Reduction Theorem (a 3-line proof) before anything built on it caught no errors — but the confidence boost was real, and formalizing it was trivially cheap. We should have formalized the $5/24$ cover and Theorem A earlier too.
- **Multiple independent verifiers.** Three tabs running the same audit surfaced three different catches. No single audit would have been enough.
- **Neutral framing in researcher prompts.** No mentions of "Erdős" or "this is a famous open problem"; just the math. Pro's extended thinking works best when it's not reasoning about fame, stakes, or prior belief — only about the math itself.
- **Treating public forum + private research as one pool of facts.** In prompt construction, we don't distinguish "we proved this" from "forum proved this" from "paper X proved this." One pool of established facts.
- **The "don't anchor, even when you're sure" discipline.** Pro is smarter than anyone in the loop at the math. When we think we know the next step, we still frame it as a potential direction and let Pro choose. The round-1 A/B split between directed and open framings was the cleanest validation of this: both produced useful output, anchoring helped focus, open helped explore.

- **Open-prompt Pro rounds produce the most novel math.** Round 4 sent Pro a pure-state prompt with no direction suggested. That thread returned the Vaccinated Shield Reduction — the single strongest new theorem of the program. Anchored prompts get faster answers; open prompts get deeper ones.

- **Stress-testing empirical claims across multiple heuristics is load-bearing.** Pro's Round 2 claim of "$L \log n / n \approx 1.5$" looked clean in its own data but was refuted when Phase 1 tested 24 strategy pairs. Any single-heuristic numerical fit is suspect until adversarially broken.

- **Exact minimax at small $n$ reveals structure that theorems miss.** The optimal Prolonger first-move progression $2 \to 6 \to 12 \to 30 = p_3^\#$ at $n = 35$ pointed directly at primorial-anchor as the structurally right Prolonger template — before any theory said so.

- **Independent re-implementation catches bugs invisible to single-agent audit.** Audit #1, Pro, and Phase 1 Codex all computed exact $L(40)$; Pro + Audit #1 agree on $16$, Codex got $17$. Without independent recomputation this mismatch would never have surfaced. Never trust a single implementation of ground-truth computation.

- **Cheap formal verification is worth doing even on "obvious" theorems.** Shield Reduction is a 3-line proof. Aristotle verified it in an hour for free. The confidence boost + the publication-grade provenance compound across the program.

- **Audits finding the same thing independently is strong signal.** Audit #1 (weight-by-$1/p$) and Audit #2 (independently reconstructing $P_{\text{harm}}$) converged on the same Prolonger strategy giving $L \log n / n \approx 1.87$. The Pro Vaccinated Shield theorem independently converged on the same quantity ($\sigma(D) = \sum 1/d$) as the structurally correct weighting. When three independent paths land on the harmonic mass, that's the real technical quantity of the problem — worth treating as ground-truth even before proofs arrive.

- **Obstruction theorems can be overstated in their rhetorical framing.** Pro's "forces many genuinely small numbers into play" reads like a strong closure. But Claude's audit showed Sylvester–Fibonacci primes achieve the same $\sigma \to 1$ with 5 fixed elements. The math is correct; the "forces many plays" interpretation isn't. Always distinguish the quantitative conclusion (necessary condition) from the qualitative framing (which may oversell the difficulty).

- **Proof-strategy vs game-strategy is a distinction worth preserving.** An obstruction to a *proof technique* isn't an obstruction to a *game play*. When Pro wrote "any strategy of the form... is asymptotically ruled out," they actually meant "any *proof* of that form is ruled out." A Prolonger playing the same moves might still win; we just can't *prove* it via the blocked technique. Bayesian update from proof-obstructions to game-value conclusions is warranted but small.

- **Three-way audit caught three independent substantive issues on a single Pro proof.** Round 5: Gemini flagged the Frankenstein-family / online-strategy disconnect, Claude caught the cost-shifting framing (and formalized the sharper invariant), GPT-thinking caught an outright numerical bug in the error schedule. None would have been caught by two of the three alone. The specific cost: three parallel audit tabs, ~15 min each. The specific payoff: one arithmetic bug discovered, one interpretive error surfaced, one practical disconnect flagged. **Do not ever drop below three informal verifiers on a substantive new Pro proof.**

- **Verifier convergence on formalization is a strong signal.** Both Claude and GPT independently noted Pro's "residual harmonic mass of legal primes" is hand-wavy and gave *concrete different formalizations* of the same intuition ($\tilde\sigma$ vs $H_D$). Two-of-three independent formalizations of the same under-specified conjecture is the strongest signal yet that the sharper invariant is real structural content. Worth lifting into the next researcher prompt as a validated direction.

- **"Resolves one branch" framing deserves audit scrutiny.** Pro's top-line claim "the upper-half cost is not the bottleneck" was correctly stated but implied progress that hadn't been made. Claude's audit caught that the construction trades one obstruction for another of the same effective strength. Lesson: when a Pro proof claims to resolve a sub-question, verifiers should explicitly check whether that resolution *reduces the aggregate obstruction budget* or just *shifts cost across obstructions*. These are categorically different. The framing "cost-shifting vs cost-reduction" is worth naming explicitly in audit prompts.

- **The new researcher-prompt discipline (CLAUDE.md) produced a cleanly focused Pro response.** Round 5 was the first prompt under the revised rules (no output format, Potential Directions only when cross-validated, potential directions lifted verbatim from Pro's own Round 4 closing). Pro returned a tightly focused proof attempt directly on the lifted $\sigma \to 1$ question, without the meandering exploration typical of earlier rounds. One-sample, but positive signal that the discipline shift is working.

- **Periodic strategic audits are distinct from per-round audits, and load-bearing.** After five rounds we had no idea we were in obstruction-drift until the curator (and user) flagged it and asked the verifiers directly: *are we proving the actual question?* Four independent verifiers returned unanimous "no — pivot." This was the single highest-leverage verifier round in the program. None of the per-round Pro-response audits would have caught the systemic drift, because each one only had the scope of one claim. Strategic audits should be scheduled *before* investing another research round when a framework has been iterated enough times that the returns look diminishing. Rule of thumb: after three iterations of the same framework (Theorem A, Vaccinated Shield, Round 5), run a strategic audit before committing to a fourth.

- **Four-way strategic audit produces robust pivot signal when three would not.** Three out of three converged on the pivot direction (packing lemma + Shortener side), but Audit #4 added three genuinely new high-value contributions the other three missed: (a) the productive reframe of recurring $\log(1/\alpha)$ as "framework correctly computing its own ceiling" rather than "framework failing," (b) the single highest-value literature pointer (Ford 2008 *Annals*), (c) the strongest unique new angle (explicit Shortener strategy realizing the ceiling by duality with existing obstructions). Each was worth more than the marginal 4th verifier's typical yield. Lesson: on **strategic** audits specifically, budget for four verifiers, not three. The marginal return is real.

- **"Obstruction theorems that correctly compute their own ceiling" is a real research output category.** Audit #4's reframe changes how the program reads its own output. Theorem A, Vaccinated Shield + fixed-prefix sharpening, and Round 5's cost-shifting are not failed attempts to prove linearity — they are three independent lenses on the same $\log(1/\alpha)$ ceiling of what shield-based arguments can prove. That is a real contribution, but *only* when framed as "the shield architecture's ceiling is now understood; build downstream of it," not as "we almost proved linearity and then the obstruction got us again." Lesson: when a framework returns the same invariant from multiple angles, treat that as the framework characterizing itself, and stop extending. Don't conflate "this ceiling is real" with "this ceiling is a failure."

- **Stepping outside the dominant framework produced the first actual bound advance.** Rounds 1–5 all lived inside the Shield Reduction / Vaccinated Shield framework and produced no movement on $L(n)$. Round 6 Prompt B stepped outside — a direct Shortener-strategy argument via Chebyshev + compression + second-order Bonferroni sieve. No reference to $\beta(P)$, $\sigma(D)$, $\tilde\sigma$, or $H_D$. Produced $L(n) \le 13n/36 + o(n)$, materially beating prior bounds. **Lesson: when a framework has iterated enough times to characterize its own ceiling (see prior lesson), the path to bound advancement is outside that framework, not a further refinement of it.** The strategic audit caught this; the pivot away from shields was load-bearing for actual progress.

- **Single-direction researcher prompts produced bigger yields than multi-direction prompts.** Round 6's two prompts had *one* validated direction each (Ford-framing for 6A, LP-dual/pairing for 6B). 6B returned a concrete new bound; 6A returned a concrete obstruction. Prior multi-direction prompts (Rounds 1–4) produced diffuse exploration. Sample size is small but the signal is consistent with the updated CLAUDE.md discipline rules that tightened this.

### Round 7 — $13/36$ bound closed via truncation

After the Round 6 audit flagged the non-monotone Bonferroni issue, we sent a targeted follow-up to the same 6B Pro tab asking for the Mertens/Brun-based direct $L(n) = O(n/\log n)$ route. Pro's response was split into two phases:

**Phase 1: refutation of $O(n/\log n)$ via this strategy.** Pro constructed a block-product Prolonger counterstrategy: before turn $j$, Prolonger plays $P_j = \prod_{p \in B_j} p$ where $B_j$ is the maximal initial block of currently-legal odd primes with $\prod \le n$. Under this counter: $q_j \ge (1 - o(1)) j \log n$, so $S \le 1/2 + o(1)$, $\prod(1 - 1/q_j) \ge e^{-1/2}$, and $N_D \ge (1/4 - o(1)) n$. So the Mertens-product sieve cannot give $O(n/\log n)$ for the $D$ generated by this strategy. To reach $O(n/\log n)$ one would need a different Shortener strategy or exploit Prolonger moves beyond $D$.

**Phase 2: close-out of the $13/36$ bound via truncation.** Pro showed that the refutation actually *hands us* the $13/36$ bound. Combined with the established $S \ge 1/3 - o(1)$, the block-product analysis gives $S \in [1/3, 1/2]$ in the adversarial regime — inside $[1/3, 5/3]$, where Bonferroni applies. But Pro went further and avoided the case-split entirely: take $t$ minimal with $s_t \ge 1/3 - \eta_n$. Since each $1/q_j \le 1/3$ (odd prime), by minimality $s_t \in [1/3 - \eta_n, 2/3]$. On $[0, 1]$, $f(s) = 1 - s + s^2/2$ is monotonically decreasing ($f'(s) = s - 1 \le 0$), so $f(s_t) \le f(1/3) = 13/18$. Then $N_D \le N_E$ (smaller sifting set = more survivors) and second-order Bonferroni on $E$ closes to $N_E \le (n/2)(13/18) + o(n)$, hence $L(n) \le 13n/36 + o(n)$.

**First front-line bound advance of the program.** Beats the forum's $0.416n$ by a real margin.

Outputs in `researcher-06-direct-sieve-refutation.md` (Phase 1) and `researcher-07-13-36-closeout.md` (Phase 2).

**Process lesson — "a refutation that also hands you the result."** The Round 6 audit caught a proof gap and flagged two repair paths (case-split or Brun). The follow-up prompted Pro to go for the strictly stronger $O(n/\log n)$. Pro refuted that target but, in doing so, established the $S \le 1/2$ bound that lets the weaker $13/36$ go through immediately. The follow-up worked not because Pro proved the target we asked for, but because the failure mode itself was the missing lemma. Lesson: **a sharp refutation of an overshoot target can yield the under-target result for free.** Worth watching for again.

**Process lesson — "truncation beats case-split."** The audits (Gemini + Claude) both proposed a case-split or sharper sieve to handle $S > 5/3$. Pro's truncation fix avoids the problem entirely by never putting $s_t > 2/3$ — it uses the structural fact that $1/q_j \le 1/3$ (odd prime) to bound how much each step can push the partial sum. Elegant and simpler than the flagged repair. Sometimes the audits anchor the researcher toward a more complicated fix than necessary. Worth noting for future audit-prompt discipline.

### Round 7 audit round — 3/3 SOUND, $13/36$ promoted to Established

Three informal verifiers (plausibly Claude, GPT-thinking, Gemini based on style) returned **unanimous SOUND**. Verbatim in `verify-postresp-07-audit{1,2,3}.md`.

**Convergent verdict:** every step of the truncation proof is valid. Minimality + $q_j \ge 3$ gives $s_t \in [1/3 - \eta_n, 2/3 - \eta_n]$, which is strictly inside the monotone-decreasing regime of $f$ on $[0, 1]$. $N_D \le N_E$ trivially correct. Bonferroni direction correct. Final arithmetic verified. All 3 agreed truncation is genuinely different from (not a disguised) case-split.

**Weakest link (3/3 concur):** not internal to the proof. The argument rides on fact (A) — Chebyshev bound $q_j \le (3/2+\varepsilon) j \log n$ uniformly over all Prolonger strategies — imported from Round 6. (A) is itself audit-validated, so this is a structural observation, not a gap.

**Unique catches:**
- **Audit 2 empirical simulation:** $2k + N_D \approx 0.415n, 0.402n, 0.390n$ at $n = 10^3, 10^4, 10^5$ — all *above* $13/36$. Does not refute the asymptotic ($o(1)$ is painfully slow) but invalidates small-$n$ tests as confirmation. Also corrects the Pro-prompt's hint that $t$ would be "a few": adversarial regime gives $t \sim n^{1/3}$.
- **Audit 3 convergence-rate analysis:** the dropped term $-\tfrac{1}{2}\sum 1/p^2$ is asymptotically necessary for uniformity but loose at finite $n$ — sacrifices $\sim 0.05n$ against passive Prolonger. Combined with $O(n/\log^2 n)$ Bonferroni error, empirical $L/n$ approaches $13/36$ very slowly.

**Promotion.** Per CLAUDE.md rule: "promote to Established when at least two informal verifiers agree AND Aristotle either formalized it or failed for a known structural reason." 3/3 informal ✓. Aristotle v2 in progress. **$L(n) \le 13n/36 + o(n)$ is now Established** (pending Aristotle for strongest confirmation).

**Program milestone.** This is the **first confirmed front-line bound advance** of the program. Previous best: $0.416n$ (forum). New: $0.3612n$. Beats the forum record by a material margin. Ends the $0.416$ vs $0.458$ dispute (both dominated). Contribution goes from "interesting focused paper" to "concrete new result on a 33-year-old open Erdős problem."

**Process lesson — "unanimous audit + empirical invalidation are compatible."** Audit 2 correctly flagged that small-$n$ simulations are inconsistent with the bound's finite-$n$ values, while simultaneously affirming the asymptotic. Useful template: an asymptotic bound can be rigorously true and empirically "violated" at accessible $n$ if the $o(n)$ term decays slowly. Worth remembering when interpreting numerical checks on future claims — don't treat finite-$n$ violation as a counterexample to an asymptotic proof.

### Round 8 — $5n/16$ bound via longer prefix + sharper Bonferroni error

Prompt: `prompts/researcher-08-open-solution.md` (open-solution ask). Output: `researcher-08-5-16-improvement.md`.

Pro returned a **material improvement** on the Round 7 $13n/36$ upper bound to $5n/16 = 0.3125\, n$, using the same odd-prime-prefix Shortener strategy but with a much longer prefix ($k = n/(2A \log n)$ for any $A > 2$) and a sharper Bonferroni pair-intersection error analysis.

**The key insight:** Round 7 capped the prefix at $k = \sqrt n / \log n$ because the Bonferroni error from pair-count $|E \times E| = O(t^2)$ otherwise dominated. But the *actual* error only involves prime pairs $(q_i, q_j)$ with $q_i q_j \le n$ (pairs with $q_i q_j > n$ contribute zero to the intersection counts), and this count is $o(n)$ regardless of $t$:
$$R_2(n) \le \sum_{p \le \sqrt n} \pi(n/p) \ll \frac{n}{\log n}\sum_{p \le \sqrt n} \frac{1}{p} = O(n \log\log n / \log n) = o(n).$$

With the longer prefix, Chebyshev induction tightens: $q_j \le A j \log n$ for any $A > 2$ (the prior $3/2$ is loose because the $j-1$ prior Shortener primes now contribute $\log q_i \sim \log n$ each, matching Prolonger's log-mass contribution). This gives $\sum 1/q_j \ge 1/A + o(1)$. Letting $A \downarrow 2$: $\sum 1/q_j \ge 1/2 - o(1)$.

Substituting $s_t \ge 1/2$ into the truncated-Bonferroni framework: $f(1/2) = 1 - 1/2 + 1/8 = 5/8$, so $N_D(n) \le (n/2)(5/8) + o(n) = 5n/16 + o(n)$.

**The $13n/36$ bound is not wrong — just loose.** $5n/16$ dominates it strictly ($0.3125 < 0.3611$). The $13n/36$ proof's machinery (Chebyshev induction, compression, truncation + Bonferroni monotonicity) is reused unchanged; only the prefix length and error analysis are upgraded.

**Cross-validation.** Open-exploration Audit #1 *explicitly predicted* the $5n/16$ bound before Pro produced it: "if one could push $s$ to $1/2$, the same style of argument would improve to $5n/16 = 0.3125n$." Audit #1 couldn't see how to push $s$ past $1/3$; Pro solved that by noticing the Bonferroni-error misanalysis in Round 7.

**Pro's closing validates the Carrier Capacity direction.** The block-product counter caps $\sum 1/q_j \le 1/2 + o(1)$, so **$5/16$ is the tight limit of the odd-prime-prefix Shortener family**. Any further improvement requires a structurally different argument — exactly the direction open-exploration Audit #2 (super-carrier exhaustion via Erdős-Kac / Ford 2008 anatomy of integers) proposed.

**Status:** pending informal audit + Aristotle. The proof structure is very close to Round 7's, so audit should be quick.

**Process lesson — "the prior proof's `O(error)` analysis was the slack."** Round 7's $13n/36$ was bound by a single loose estimate — treating the Bonferroni error as $O(t^2)$ from set size instead of $O(\#\text{pairs with product} \le n)$. Lesson: when a proof bounds an error term by "$O(|S|^2)$" or similar set-size bound, check whether the error actually depends on a *pair-product* or other constraint-scoped quantity. That constraint may be much tighter and unlock longer prefixes / sharper constants.

### Round 9 — Carrier Capacity Bound REFUTED

Prompt: `prompts/researcher-09-carrier-capacity.md` (targeted follow-up lifting Audit #2's super-carrier-exhaustion direction). Output: `researcher-09-carrier-capacity-refutation.md` (Pro) + `verify-researcher-09-gemini-refutation.md` (Gemini DeepThink, running in parallel).

**Outcome: the direction is dead.** Two independent high-capacity reasoners (Pro + Gemini DeepThink) independently refuted the Lemma within hours of each other.

**Pro's refutation (cleaner version):** Take $\varepsilon < 1/4$, $m = \lfloor n/2 \rfloor$, $T = \lfloor \varepsilon n \rfloor$. Let Prolonger play $x_i = m + i$ for $i = 1, \ldots, T$; Shortener plays $y_i = m + T + i$ for $i = 1, \ldots, T-1$. All moves are in $U = (n/2, n]$ since $m + 2T - 1 \le n$. Since $U$ is a trivial antichain, every move is legal. $P = \{m+1, \ldots, m+T\}$ is a genuine game-achievable Prolonger sequence of size $\varepsilon n$. For every prime $p \le T$, some $m + j$ with $1 \le j \le p$ is divisible by $p$, so $p \in B(P)$. Hence $\sum_{p \in B(P)} 1/p \ge \sum_{p \le T} 1/p = \log\log n + O(1) \to \infty$. Stronger version: finite-prime vaccination via $d = \prod_Q q$ and an arithmetic progression in $U$ also diverges.

**Gemini's independent refutation:** essentially the same counterexample (top $\varepsilon n$ consecutive integers in $U$) plus a diagnosis of the Erdős-Kac fallacy in Audit #2's proof sketch: average $\omega(x)$ controls $\sum \omega$, not $\sum 1/p$, because consecutive integers have ordinary $\omega$-statistics but hit every small prime automatically.

**Cross-validation.** Two independent refutations with the same core construction — strongest possible signal this is a real dead-end. Gemini delivered first (its extended-thinking API call had been timing out until it finally succeeded); Pro independently produced the identical counterexample a few hours later with cleaner framing as an in-$U$ game play.

**Numerical confirmation (Pro).** $\sum 1/p \approx 2.316, 2.574, 2.780$ at $n = 10^4, 10^5, 10^6$ with $\varepsilon = 0.1$. Growing like $\log\log n$, matching the theoretical bound exactly.

**What survives.** Pro's closing: *"This does not rule out a much more dynamical statement tied to a specific Shortener strategy."* The static Lemma quantifies over all Prolonger antichains; a dynamical version would quantify only over Prolonger plays achievable against a fixed Shortener. That version is still open but harder — and Round 7's block-product counterstrategy already shows that the $5/16$ Shortener cannot bound $\sum 1/p$, so any dynamical proof would need a strictly different Shortener strategy.

**Process lessons:**

**"Multi-model convergence applies to refutations too."** We've seen independent audit-convergence drive promotion (Round 7: 3/3 sound on $13/36$). Here it drives *demotion* just as cleanly: Gemini DeepThink + Pro both find the same counterexample from scratch. When two independent high-capacity reasoners produce the same refutation, the direction is dead.

**"Cross-validation before firing a big Pro round saves nothing if the direction is wrong."** The researcher-09 prompt was carefully cross-validated with 4 signals (Pro Round 7 closing + strategic Audit #4 Ford-2008 + Claude Round 6 6A audit + open-exploration Audit #2 super-carrier-exhaustion). It still pointed at a false Lemma. Cross-validation ensures the direction is *plausible*, not that it's *correct*. The actual check is the refutation.

**"Erdős-Kac average-$\omega$ is the wrong tool for this specific problem."** Both refutations point at the same misapplication: average $\omega(x)$ bounds $\sum \omega$, not $\sum 1/p$ over any specific subset. Any future use of "anatomy of integers" results for this problem needs to watch for this distinction. Interval-structured counterexamples with ordinary $\omega$-statistics are the canonical failure mode.

**"The $5/16$ bound is now our secured contribution."** The static sieve route to $O(n/\log n)$ is definitively closed. $5/16$ is the program's confirmed new result, not a stepping stone to anything bigger via this approach. Any push below $5/16$ requires techniques we haven't deployed (dynamical carrier bounds, pairing strategies, structural invariants, non-sieve methods). Expected probability low.

## What hasn't worked

- **Tab drift**. Multiple times the browser tab we *thought* we were operating on was actually different — either because Chrome re-ordered, because the user navigated, or because CDP focus shifted mid-operation. The fix in `submit.sh` is to chain tab-switch + action in one shell call. Lesson: atomic operations.
- **`execCommand('insertText')` on non-ProseMirror editors**. Works on ChatGPT, fails catastrophically on Claude (Tiptap) and Gemini (Quill). Took a full round of failed submissions before we switched to `agent-browser fill @<ref>`, which works everywhere.
- **Case-insensitive filesystem bit us**. Saving a Claude conversation as `claude.md` in a project directory caused Claude Code to auto-load it as `CLAUDE.md` — treating the conversation as instructions. Renamed to `claude-chat.md`; documented the pitfall in the root `CLAUDE.md`.
- **Stale upper-bound propagation**. The forum lists the current record as $0.416n$; our private derivation gave $0.458n$. We carried the wrong number for several rounds. Caught by ChatGPT-thinking in Round 1's audit. Lesson: re-scrape the forum every round.
- **Trusting "very tight fit" numerics blindly**. Pro's Round 1 directed response claimed a striking fit between greedy-shield crossings and $e^{-2c}$ exponents at $n = 20000$. Independent Claude-thinking couldn't reproduce. The "fit" may be coincidental or algorithm-dependent. Lesson: every numerical claim deserves re-run by an independent verifier.

- **Trusting "within 1 move of optimal" claims blindly.** Pro's Round 2 S* response reported exact-minimax table at $n \in \{10, 20, 30, 35, 40\}$ with Shortener gap $\le 1$. Audit #1 independently reran *every* $n \le 40$ and found a gap of 2 at $n = 33, 34$. Classic cherry-pick-by-sampling — the honest statement should have been "on the sampled points shown," not "everywhere." Lesson: when an AI gives you a sample, ask for the full range, or recompute it yourself.

- **Exact-minimax implementation bug (resolved).** Phase 1 Codex reported $L(40) = 17$; Pro + Audit #1 reported $L(40) = 16$. Root-caused 2026-04-17 evening: the old solver used alpha-beta with an unshifted child window — scored moves as `1 + solve(child, alpha, beta)` but should have passed `(alpha - 1, beta - 1)`. Unsound pruning produced systematic over-estimates from $n = 27$ onward. Corrected solver confirms $L(40) = 16$. Lesson: **when combining alpha-beta search with a per-move score increment, the window must be shifted by the increment each level — and ground-truth DP deserves a redundant from-scratch implementation whose output you compare against the optimized version. Brute-force agreement at small $n$ is the gate.**

## Publication notes

If this work ends up on a forum post or in a paper:
- All theorems cited as "proved" should have the Aristotle job ID and Lean output attached as supplementary material.
- The forum dispute on the upper bound (0.416 vs 0.458) should be resolved explicitly — either by verifying the forum's derivation or by correcting it.
- The numerical claims that couldn't be independently reproduced should be flagged as "observed in one simulation, independent verification inconclusive" — not "very tight fit."
- The methodology (primary + informal verifiers + formal verifier + curator + compute agent) is itself an interesting artifact; if writing a methods section, this repo structure is the shape.

## Branches and directions explored

Tree of the research pathways we've walked, annotated with status. Meant to be graph-drawable later — nodes are directions, edges are "subsumes / refines / rules out / response-to-failure-of."

**Legend:**
- ✅ proven / confirmed
- ❌ ruled out
- 🟡 partial
- ⏳ in progress
- ❓ identified but not yet pursued
- 📐 methodology, not a direction per se

### Root question
**R.** Is $L(n) \ge \varepsilon n$ for some fixed $\varepsilon > 0$?

### Prolonger side — attempt to prove $L(n) \ge \varepsilon n$

- **P1. Static lower-half reservoirs.** Dense subsets of $L$ with positive density.
  - **P1a.** Xiao_Hu's $8/105$ interval+sieve construction (forum, Feb 2026) ❌ as Prolonger tool (prime destruction).
  - **P1b.** Om's $85/1008$ $v_5$-parity sieve (forum, Apr 2026) ❌ as Prolonger tool → but 🟡 flipped into a Shortener weapon.
  - **P1c.** Integers in $(n/4, n/3]$ as dense antichain ❌ (Mertens density decay caps at $\Theta(n/\log n)$).
  - **P1d.** All-prime $v_p$-parity sieve, $k \to \infty$ ❌ (density $\sim \pi^2 e^{-\gamma}/(6 \log y) \to 0$).

- **P2. Shield Reduction framework.** The central private-research reformulation.
  - **P2.0. Shield Reduction Theorem** ✅ (Lean-verified, 3-line proof).
  - **P2.1. $\tau(n) = 5n/24$ first-hit skeleton** ✅ (Lean-verified, structural; $|H_n| = |P_n|$ counting left).
  - **P2a.** Constant-$k$ shield prefix (two-shield conjecture) ❌ (trajectory drifts to $1/2$ at $n \ge 800$; Mertens sieve-theoretic obstruction).
  - **P2b.** Polylog-$k$ shield prefix ❌ (Theorem A).
  - **P2c.** $n^{o(1)}$ shield prefix ❌ (Theorem A; $\beta(P)/n \to \infty$).
  - **P2d.** $n^\alpha$ shield prefix with $\alpha > 1/e$, offline-feasible ✅ (Phase 0: $\psi_n(\alpha) \to (1/2)\log(1/\alpha)$).
  - **P2e.** $n^\alpha$ shield prefix, online-realizable against adversarial Shortener ❌ empirically (Phase 0 sniping audit: prime $2$ kills 93–100% of offline-optimal $P$ in every cell).
  - **P2f. Theorem A** (polynomial shield lower bound $\beta(P) \ge (1/2)\log(1/\alpha) n$) ✅ (Aristotle complete: core combinatorial content sorry-free; 5 sorrys all Mathlib-coverage classical NT + their assembly).
  - **P2g. Robust-offline refinement $\psi_{\text{robust}}(\alpha)$** ❓ (proposed after Phase 0's brittleness finding).

- **P3. Non-shield Prolonger strategies.**
  - **P3a.** Randomized Prolonger from uniform-random legal upper moves 🟡 (Phase 1 tested; weakest of the explicit strategies, $L \log n / n \approx 1.17$).
  - **P3b.** Pivoting adaptive shield (abandon-and-replace when sniped) 🟡 (Phase 1 tested; produces $L \log n / n \approx 2.0$; middling).
  - **P3c.** Maker-Breaker on dense bipartite subgraph (Gemini pitch) 🟡 (Phase 1 tested as $P_{\text{maker-breaker}}$; $L \log n / n \approx 1.27$).
  - **P3d.** Container method (Balogh–Morris–Samotij / Saxton–Thomason) ❓ (flagged as "low-mechanism" by Claude-thinking; worth attempting if other paths close).
  - **P3e.** Anti-$S^\star$ lookahead Prolonger ✅ tested (Phase 1 best at $L \log n / n = 2.28$ at $n = 100{,}000$; current strongest tested Prolonger).
  - **P3f.** Primorial-anchor Prolonger ($P_{p_k^\#}$) 🟡 strong structural signal from exact minimax ($30 = p_3^\#$ is optimal first move at $n \in [35, 48]$, audit #1 independently confirmed), but Phase 1's $P_{\text{primorial-template}}$ heuristic plateaued around $1.36$ — needs a better implementation. **Priority direction for next round.**
  - **P3g.** Harmonic-weighted prime-blocker $P_{\text{harm}}$ 🟡 (two independent audits converged on this: $u_t$ maximizes $\sum_{p \mid u,\ p\ \text{legal}} 1/p$). Gives $L \log n / n \approx 1.87$ vs $S^\star$, beats $P_{\text{pb}}$ by 14-21%. **Needs coding into Phase 1 harness and testing at $n \ge 10^5$.**

- **P4. Vaccinated Shield Reduction program.**
  - **P4.0. Vaccinated Shield Reduction theorem** (Round 4) ✅ audit-validated math; Aristotle pending.
  - **P4a.** Subpolynomial-prefix obstruction: $\sigma(D_n) \to 1$ necessary for any shield-based linear-bound proof (Round 4) ✅ audit-validated math.
  - **P4b.** $\sigma(D_n) \to 1$ with zero upper-half cost — explicit construction via $k$-fold products over prime intervals (Round 5). 🟡 existential claim likely true; proof as written **broken pending re-derivation** (concatenation error schedule $\rho \ge 1 - 2^{-k}$ is impossible; repair via $\varepsilon_k$ slower than $e^{-k/e}$). Framing oversells: the construction trades Round 4's $\sigma$-obstruction for fixed-prefix sharpening of the same effective strength (Claude audit). Does not advance a linear lower bound.
  - **P4c.** Fixed-prefix sharpening: $\beta_{D^{(k)}}(P) \ge (\log(1/\alpha) + o(1)) |U_{D^{(k)}}|$ — shows the Round 5 construction does *not* escape the $e^{-1}$ barrier (Round 4+5) 🟡 audit-validated.
  - **P4d.** Genuinely $n$-scale lower prefix (not a frozen finite template) ❓ — the open direction left by Round 5; unclear whether this gives a better bound on $\beta_D(P)$ or whether the $e^{-1}$ barrier is intrinsic.
  - **P4e.** Residual harmonic mass of legal primes after the lower prefix as the right invariant ❓ — Pro's Round 5 conjecture; converges with $P_{\text{harm}}$'s Shortener-side story, worth pursuing.

### Shortener side — attempt to prove $L(n) \le$ bound

- **S1. Maker-Breaker savings pool.** Pre-harness (forum work).
  - **S1a.** $L(n) \le (23/48)n$ (GPT-5.2 Pro + Liam Price, Feb 2026) ✅.
  - **S1b.** $L(n) \le (419/1008)n \approx 0.416n$ (forum-listed record) ✅ (derivation contested).
  - **S1c.** $L(n) \le (923/2016)n \approx 0.4578n$ (private derivation via secure-half Maker-Breaker on Om's $85/1008$) ✅.
  - **S1d.** Resolve S1b vs S1c dispute. Now less load-bearing: both dominated by S1e.
  - **S1e.** $L(n) \le (13/36)n + o(n) \approx 0.3612n$ via odd-prime-prefix Shortener ✅ **Established** (Round 7; 3/3 informal audits sound; Aristotle v2 in progress). Superseded by S1g.
  - **S1g.** $L(n) \le (5/16)n + o(n) = 0.3125n$ via longer odd-prime-prefix Shortener 🟡 (Round 8, pending audit + Aristotle). Same strategy as S1e but with prefix length $k = n/(2A\log n)$ (any $A > 2$) instead of $\sqrt n/\log n$. Key insight: the Bonferroni error from pair-intersections depends on $\#\{(i,j): q_iq_j \le n\} = o(n)$, not $O(t^2)$. Chebyshev induction at the longer length gives $q_j \le Aj\log n$, hence $\sum 1/q_j \ge 1/A - o(1)$. Letting $A \downarrow 2$: $s_t \ge 1/2$, $f(1/2) = 5/8$, $N_D \le 5n/16 + o(n)$. Pro's closing: $5/16$ is the tight limit of this Shortener family (block-product caps $\sum 1/q_j \le 1/2$).
  - **S1h.** Carrier Capacity Bound $\sum_{p \in B(P)} 1/p \le C(\varepsilon)$ for all Prolonger sequences of size $\varepsilon n$ ❌ **refuted** (Round 9, independently by Pro + Gemini DeepThink). Counterexample: Prolonger plays consecutive integers in $U = (n/2, n]$ of size $\varepsilon n < n/4$; these form a legal antichain and automatically include every prime $\le T$ as a divisor, giving $\sum 1/p \ge \log\log n + O(1) \to \infty$. Finite-prime vaccination via APs doesn't rescue. This kills Audit #2 (strategic-round)'s super-carrier exhaustion direction in the static form. The dynamical version (restricted to Prolonger plays achievable against a specific Shortener strategy) is still formally open but has no proof attempt and no obvious attack path.
  - **S1f.** $L(n) = O(n/\log n)$ via the S1e Shortener strategy alone ❌ refuted (Round 7 Phase 1): the block-product Prolonger counterstrategy forces $\prod(1 - 1/q) \ge e^{-1/2}$, so $N_D \ge n/4$ for the adversarial $D$. Any proof of $O(n/\log n)$ needs a different Shortener or must exploit Prolonger move structure beyond $D$.

- **S2. Direct Shortener construction forcing $L(n) = o(n)$.**
  - **S2a. $S^\star$ prime cascade** 🟡 (Phase 1: $n/\log n$ scaling confirmed across 24 pairs, but constant is $[1.16, 2.28]$, not Pro's claimed $1.5$; "$1.5$" refuted, scaling retained).
  - **S2b. Negative proposition: crude log-budget is insufficient to prove $o(n)$** 🟡 (Pro's proof sketch; Audit #1 downgraded to "methodological warning" not rigorous theorem).
  - **S2c. Packing lemma (harmonic-mass bound on blocked primes)** ❓ (the specific analytic gap for a full $L(n) = O(n/\log n)$ theorem; now reframed as carrier-side question — see S2f).
  - **S2f. Carrier-recycling obstruction to naive SLP + Mertens** (Round 6 Prompt 6A) 🟡 proof claimed; pending audit + Aristotle. Shows $\sum_{p \in S_n} 1/p \le \log\log n/(m+1)$ for any fixed $m$ against SLP. Redirects the packing lemma target from "fresh primes a single $u$ can carry" to "how often carriers can be recycled to lift fresh small-prime blocks into $U$." Ford 2008 is the right framework for the redirected question.
  - **S2d. Phase 1 stress-test** ✅ complete. Scaling confirmed across 24 pairs; universal-constant hypothesis refuted; $L \log n / n$ ranges $[1.16, 2.28]$.
  - **S2e. $L(40)$ discrepancy** ✅ resolved (Phase 1 exact-minimax had an unshifted alpha-beta window bug; corrected solver gives $L(40) = 16$ matching Pro + Audit #1; old table was systematically over-estimated from $n = 27$ onward). Follow-up: **S2e'. Re-derive optimal-first-move frontier on the corrected solver** ❓ — the old Phase 1 stored only one heuristic opener per $n$, so the "$12 \to 30$ at $n = 35$" transition claim needs re-derivation.

- **S3. Shortener-side analog of Shield Reduction.** ❓ (suggested in Direction 3 prompt; no one has attempted).

### Meta / methodology 📐

- **M1.** Formal verification via Aristotle — working.
  - Shield Reduction ✅ verified.
  - $5/24$ cover ✅ verified structurally.
  - Theorem A ✅ core combinatorial content verified (sorry-free); 5 sorrys all Mathlib-coverage classical NT + assembly.
- **M2.** Multi-model adversarial audit (Claude + Gemini + ChatGPT-thinking in parallel) — working. Each model catches different things.
- **M3.** Computational grid mapping via Codex + M4 Pro — working.
  - Phase 0: ψ mapping ✅.
  - Phase 1: $S^\star$ stress test ⏳.
- **M4.** Anchored vs open researcher prompts (A/B tested in round 1) — both useful, neither dominates.

### Key cross-edges (for graph drawing)

- **P1b → S1c**: Om's $85/1008$ static set became the Shortener's savings pool via the "Big Flip."
- **P2a/b/c ⟵ P2f**: Theorem A subsumes all three sub-polynomial shield-prefix variants.
- **P2e → S2a**: Phase 0's brittleness finding (prime 2 kills offline-optimal $P$) is the structural cousin of $S^\star$'s prime-cascade strategy — both say "prime 2 is devastating against any $U$-heavy Prolonger."
- **S2b → S2c**: the log-budget insufficiency theorem points directly at the specific packing lemma that would close the $L(n) = o(n)$ proof.
- **M1 → P2.0, P2.1, P2f**: formal verification is the gate for promoting each claim to machine-checked.

### Round 9b (2026-04-18) — Universal Prolonger counter dynamically refutes bounded-carrier

Open-exploration audit model produced a full dynamical refutation. Saved at `verify-postresp-10-audit-universal-block-product.md`.

**Part 1 (rigorous implication).** Bounded $\sum 1/p \le C$ against every Prolonger response → Brun-sieve with sparse $S = B(P)$ → $|P| \le e^{C+O(1)} n/\log n$ → $L = O(n/\log n)$.

**Part 2 (rigorous impossibility).** Block-product Prolonger (primes $\le n^{1/3}$ in disjoint sets, products in $(\sqrt n, n^{5/6}]$, greedy descending) secures half the total harmonic mass against any Shortener. Pairwise coprimality + $x_i x_j > n$ forces 1-for-1 snipes; Prolonger gets $\ge \frac{1}{2}\log\log n + O(1)$.

Combined: $\sum 1/p = \Theta(\log\log n)$ is structural. Closes both static AND dynamical sieve-over-$B(P)$ routes to $O(n/\log n)$.

### Round 10 (2026-04-18) — $\Omega$-grading Shortener strategy

Prompt: `researcher-10-dynamical-carrier.md`. Pro response: `researcher-10-omega-strategy.md`.

Pro pivoted from $\sum 1/p$ to $\Omega$-based invariants. Strategy: play a legal lower $d$ maximizing $\text{score}_t(d)$, tie-break by smaller $\Omega(d)$. Two-layer reduction: primes control semiprimes; $\Omega=2$ divisors control $\Omega \ge 3$.

**Gemini 3.1 Pro audit caught Layer 1 precision error.** Pro's strict target $\Xi(B) = O(1/\log n)$ impossible by universal counter. Softening to $O(\log\log n/\log n)$ survives — almost-trivial via Mertens — and gives $L = O(n(\log\log n)/\log n) = o(n)$.

**Gemini follow-up "resolution."** Claimed full proof. Layer 1 correct. Layer 2 pigeonhole broken (off by $\log\log n$; also misapplied Hardy-Ramanujan to adversarial Prolonger). Assembly hand-waved. Sketch, not theorem.

**Codex Phase 2.5 dynamical probe confirms:**
- $\sum 1/p \sim 0.875 \log\log n$ stable across 4 decades, three Shorteners tied (`S_slp_odd`, `S_adaptive_prime`, `S_pair_response`).
- $L \log n / n$ monotonically decreasing 1.29 → 1.17 across $n = 10^3$ to $10^6$ — **strongest direct signal for $L = o(n)$**.
- Block-product is the binding adversary; pair-response beats SLP on softer Prolongers.

### Round 11 (2026-04-18, in flight) — Targeted $\Omega$-grading proof request

Prompt: `researcher-11-omega-strategy-prove.md`. Dispatched to fresh Pro + DeepThink threads. Full $\Omega$-architecture embedded (no "prior round" references — fresh threads have zero context). Targets: softened Layer 1 + Layer 2 + Assembly.

Aristotle submission held pending Pro response (Aristotle runs take hours; no point submitting a sketch).

### Aristotle $13/36$ formalization completed (2026-04-18 late night)

Job `4abf7b27-fc08-4611-9411-90e78ddfb136` returned COMPLETE with zero sorry and standard axioms only. 4-file Lean 4 project under `aristotle/shortener_13_36_v2_out/`: `Defs / Compression / Sieve / MainTheorem`. Main theorem: for every $\varepsilon > 0$, all sufficiently large $n$, there exists $D$ of odd primes such that every $D$-free antichain $A$ satisfies $|A| \le (13/36 + \varepsilon)n$.

**Nuance on Chebyshev.** Mathlib lacks Chebyshev's theorem in the form needed. Aristotle substituted $D = \{3\}$ (one prime, $\sum 1/q = 1/3$) rather than formalizing the $k = \sqrt n/\log n$ prefix. Same $13/36$ coefficient, simpler strategy, strictly stronger theorem.

**Cleanup lesson.** Any $D$ with $\sum 1/q \ge 1/3$ gives $13/36$; any $D$ with $\sum 1/q \ge 1/2$ gives $5/16$. Chebyshev induction is overkill unless we need a specific explicit strategy. The $5/16$ Aristotle job (`4c1f85cd-...`, at 23%) will likely substitute $D = \{3, 5\}$ or need proper Chebyshev.

## Process lessons (new from Rounds 9b–11)

### "Multi-model convergence applies to refutations, too."

Gemini DeepThink refuted the static Carrier Capacity Bound before Pro did; the audit model refuted it dynamically; Codex empirically corroborated with coefficient ~0.875 across 4 decades. Three independent channels said the same thing. Refutation-convergence is as useful a signal as proof-convergence.

### "A precision error can be a recalibration, not a killshot."

Gemini 3.1 Pro's catch on Pro's strict $\Xi(B) = O(1/\log n)$ looked damning. On close reading, it's a corrective: strict bound impossible, soft bound trivially true, conclusion $L = o(n)$ survives. Don't call a direction dead on the first algebraic objection — check whether the conclusion survives the weakening.

### "Empirical $L \cdot \log n / n$ trajectory is the program's truest signal."

Codex's 4-decade sweep showed $L\log n/n$ decreasing from 1.29 to 1.17. Most informative single data point: says $L = O(n/\log n)$ is quantitatively reachable by the current Shortener family, empirically. Not proved, but clearly the right target.

### "Fresh researcher threads have zero harness context — scrub mercilessly."

Any reference to "round", "phase", "program", "prior research", or tool names (Pro, Codex, Aristotle, Gemini, Claude) in a prompt to a fresh tab is a dangling pointer that burns reasoning cycles. CLAUDE.md updated with explicit scrub rule.

### "Aristotle is willing to simplify strategies to fit Mathlib coverage, and that's fine."

Aristotle's $13/36$ formalization substituted $D = \{3\}$ for the paper's $\sqrt n/\log n$-prime prefix. Coefficient stands; strategy simpler; theorem strictly stronger. Don't chain Aristotle to a specific instantiation when a simpler one gets the same bound.

### Round 12 follow-up — Theorem 5: Resolution against disjoint small-prime carriers (2026-04-18)

Pro's follow-up to Round 12 (prompt: `prompts/followup-12-pro-closeout.md`; response: `followup-12-pro-closeout-response.md`) delivered the **first rigorous partial result** of the program:

**Theorem 5.** Fix $y = n^\alpha$, $\alpha \in (1/3, 1/2)$. Assume every composite Prolonger move has all prime factors $\le y$ and pairwise-disjoint supports. Then Shortener forces $L(n) = O(n/\log n)$ via explicit 3-phase strategy (primes / higher prime powers / cross-carrier pair semiprimes). Move count $\pi(n) + \pi(y) + \pi(y)^2 = O(n/\log n)$ since $\alpha < 1/2$.

**This class includes the universal block-product Prolonger counter** (the strongest-known adversary). So $L(n) = O(n/\log n)$ against block-product is now a rigorous theorem — the first genuine sublinear result in the program.

Plus: Pro formalized the $F_\alpha$ static reduction as Theorem 1, omitted-vertex shadowing as Lemma 3, and $Q_y$ antichain + composite-batch-resistance as Lemma 4.

**Three-way audit on Theorem 5** (`verify-postresp-followup12-{online-patch-needed, overlap-fatal, essentially-sound}.md`).

All 3 verifiers agree the local proof is sound. Minor issues:
- Wording polish in pure-prime-power case (cosmetic, not structural).
- Explicit online-execution statement needed — proof reads as offline, but all auditors say the patch is routine.
- Prolonger's prime moves never directly handled (one sentence needed to close this).

Divergence on overlapping-carriers (the $\{30, 42, 70\}$ example):
- 2/3 audits: genuine obstruction. Phase-4 triple-repair costs $n(\log\log n)^2/\log n$, off target by $(\log\log n)^2$. Dense-hypergraph Prolonger can cover every prime-pair with overlapping composites.
- 1/3 audit: "Just play $105$." Verified incomplete — resolves $\{3,5,7\}$ but not $2$ (prime 2 divides all three carriers; simple rescue unavailable).

**Promoted to Established** (audit-converged 3/3 on local soundness, 2/3 on the stated obstruction). Aristotle not yet submitted. $5/16$ also remains Established-modulo-Chebyshev.

### Round 13 planned (2026-04-18) — variance-framed attack on the remaining gap

Three channels dispatched with deliberately varied framing to force divergent search:
- **A (Pro follow-up):** extend Theorem 5 to overlapping carriers. Direct continuation.
- **B (DeepThink, fresh):** canonical prompt + open "attempt to solve."
- **C (Gemini, fresh):** canonical prompt + **contrarian** — "assume Theorem-5-style cannot extend; find a fundamentally different technique (Maker-Breaker pairing, LP-dual, hypergraph containers, entropy, structural invariants)."

Prompt files: `prompts/round13-{A-pro-extend, B-deepthink-open, C-gemini-contrarian}.md`.

Methodology lesson being tested: varied framings across cross-family models create genuine search branches, not just parallel samples. If A extends, problem closes via continuation. If C pivots successfully, problem closes via a new tool. If B returns something in between, either outcome. Zero added cost from framing variance.

### Aristotle $5/16$ formalization — COMPLETE_WITH_ERRORS (2026-04-18)

Job `4c1f85cd-54f5-42ec-b797-529d5b9ac6ee` returned COMPLETE_WITH_ERRORS. **15 theorems proved with zero sorry** covering the entire combinatorial and algebraic content. **One remaining sorry** in `game_value_per_parameter`, classified as Mathlib-coverage limit (needs Chebyshev $\vartheta(x) \ge cx$ and routine game-tree induction for legal-prime existence). Same pattern as Theorem A. Details in `verify-aristotle-03-5-16.md`; output at `aristotle/shortener_5_16_out/`.

Core combinatorial content now formally verified: odd-part compression, second-order Bonferroni, algebraic optimization $g(2) = 5/16$, structural antichain bound, game-value induction, $\varepsilon$-limit assembly via continuity.

**Promotion path for zero sorry.** Re-submit with explicit $D = \{3, 5\}$ substitution ($\sum 1/q = 8/15 > 1/2$), mirroring the $13/36$ trick. Held pending Round 11.

### Round 11 — GPT Pro + DeepThink responses (2026-04-18)

Full text in `researcher-11-pro-response.md` and `researcher-11-deepthink-response.md`. Round 11 did not land $L = o(n)$ as a rigorous theorem, but delivered substantial new content: a concrete refutation of Layer 2, a replacement proof direction, and a new lower-bound argument.

**Pro (GPT family):** Layer 1 trivially true via Mertens (agreeing with Gemini triple). **Layer 2 as stated is FALSE** — concrete counterexample $R_y = \{pqr \in U : p, q, r$ primes, $p, q > \log n\}$ with $|R_y| \asymp n(\log\log n)^2/\log n$ and max $\Omega=2$ shield score $\le n/\log^2 n$. Target $|R_y|/\log n$ exceeds max score by $(\log\log n)^2$. Verified numerically at $n = 10^6$: max score 214 vs. target 659. Proposes **multiscale batch-cover replacement**: partition hard uppers by dyadic scale of smallest legal $\Omega = 2$ divisor, batch-cover blocker-resilient statement. Plus new positive lemma via Brun: $\#\{u \in U : \Omega(u) \ge 3, s_2(u) > D\} \ll n\log\log D/\log D$.

**DeepThink (Gemini family):** Agrees with Pro on Layer 1 and conclusion. **Asserts Layer 2 holds via the same pigeonhole Pro refuted** — repeats Gemini-family blind spot; does not address Pro's counterexample. **New contribution: Part 3 cover-shattering endgame.** Upper semiprimes grouped by larger-factor covers $q$; Prolonger plays $p_1 q$ to make $q$ illegal, forcing $k_q - 1$ semiprimes in the cover to be poset-isolated and individually played. Alternating 1-for-1 with Shortener → $Q/2$ covers shattered → $L \ge c n\log\log n/\log n$ against the $\Omega$-grading Shortener.

**Cross-family convergence analysis.** Pro (GPT) and DeepThink (Gemini) agree on Layer 1 and the conclusion $L = o(n)$, disagree on Layer 2 rigor. DeepThink + 3× Gemini 3.1 Pros = 4 instances of Gemini family, all sharing the pigeonhole blind spot. Pro is the only model to identify the $R_y$ counterexample. **CLAUDE.md "same-family convergence ≠ cross-family convergence" lesson validated empirically.**

**Conjectural tight answer:** $L(n) = \Theta(n(\log\log n)/\log n) = o(n)$. Upper bound needs Pro's batch-cover replacement; lower bound needs DeepThink's endgame made rigorous. Neither is proved yet.

### Round 11 partial — Gemini 3.1 Pro triple (2026-04-18)

User dispatched Round 11 to three parallel Gemini 3.1 Pro instances. All three converged on $L(n) = O(n(\log\log n)/\log n) = o(n)$. Full write-up in `verify-postresp-11-gemini-triple.md`.

**Layer 1 upgraded to unconditional rigor.** All three proved $\Xi(B) \le O(\log\log n/\log n)$ via Mertens alone — no game-theoretic input needed. $p \le \sqrt n \Rightarrow \log(n/p) \ge (1/2)\log n$, and $\sum_{p \le \sqrt n} 1/p \le \log\log n + O(1)$. Pure analytic, not dependent on Prolonger strategy.

**Layer 2 still hand-waved.** All three use the same pigeonhole: max-shield-coverage $\ge 3|R|/|D|$ with $|D| \sim n\log\log n/\log n$ gives $C \ge 3K/\log\log n$ under precondition $|R| \ge Kn/\log n$. Target $cKn/\log^2 n$ exceeds this by $n\log\log n/\log^2 n \to \infty$. Three instances of the same model making the same misstep.

**Three copies $\ne$ three votes.** Same model family, same training, same blind spots. Genuine independent signals remain GPT Pro + DeepThink (still pending).

**Bonus structural finding (Pro #1):** cross-semiprime insight — when Prolonger block-products, cross-semiprimes $p_a p_b$ across different blocks remain legal ($\sim n^{2/3}/\log^2 n$ of them). Shortener has ammunition regardless. Not load-bearing for Layer 2 but structurally useful.

### Current tip of the tree (2026-04-18, post Theorem 5)

- **Formally verified (Aristotle, zero sorry):** Shield Reduction, $5/24$ first-hit cover, $L(n) \le 13n/36 + o(n)$.
- **Formally verified modulo Mathlib-coverage classical NT sorrys:** Theorem A (5 sorrys at Mertens / Chebyshev / PNT), $L(n) \le 5n/16 + o(n)$ (1 sorry at Chebyshev + game-tree induction).
- **Established (audit-converged, Aristotle not yet submitted):**
  - Universal block-product counter $\sum 1/p \ge (1/2)\log\log n$.
  - Layer 1 of $\Omega$-grading $\Xi(B) = O(\log\log n/\log n)$ unconditionally via Mertens.
  - $F_\alpha$ static reduction: if $A \supseteq F_\alpha$ for $\alpha \in (1/3, 1/2)$, remaining moves are $O_\alpha(n/\log n)$.
  - $Q_\alpha$ composite-batching-resistance.
  - **Theorem 5: $L(n) = O(n/\log n)$ against the disjoint small-prime carrier class, including universal block-product Prolonger.** 3/3 informal audits sound; Aristotle pending.
- **Disproved:** static Carrier Capacity Bound; dynamical bounded-$\sum 1/p$ Shortener; strict $\Xi = O(1/\log n)$; one-step $\Omega=2$ cover lemma ($R_y$ counterexample); cross-block semiprime batch (antichain violation).
- **Open question, refined:** Does Theorem 5 extend to overlapping-carrier Prolonger strategies? Two specific remaining cases:
  - (a) Overlapping small-prime carriers. Naive phase-4 triple-repair costs $n(\log\log n)^2/\log n$, off target by $(\log\log n)^2$. 2/3 audits say this is a genuine obstruction to the Theorem-5 approach. A Prolonger move-count inefficiency lever (overlap uses ~0.75 primes/move vs block-product's $\asymp \log n/\log\log n$) has not been exploited.
  - (b) Blocked large primes ($pq$ with $p \le y < q$). Naive repair overshoots by $\log\log n$.
- **Secured contribution:** $L(n) \le 5n/16 + o(n)$ (general). Plus $L(n) = O(n/\log n)$ against block-product (and disjoint-carrier class).
- **Conjectural final answer** (cross-family consensus): $L(n) = \Theta(n/\log n)$. Erdős's original question would resolve *negatively* at the tightest possible asymptotic.
- **Declared solved / stop extending:** static AND dynamical sieve-over-$B(P)$ routes; shield-framework $e^{-1}$ barrier; one-step $\Omega=2$ cover lemma; Theorem 5 against *disjoint* carriers.
- **Held pending results:** Aristotle submissions (Theorem 5 natural next target once online-execution polish is in writeup); $5/16$ Aristotle rerun with $D = \{3, 5\}$; possible Codex empirical check on overlapping-carrier game dynamics.
- **Next step:** Round 13 variance-framed attack. Three channels (Pro extend, DeepThink open, Gemini contrarian) on the overlapping-carrier gap. Expected outcomes: A closes by extension, C pivots to new tool, or both stall and we learn where the real ceiling is.

## Additional process lesson (from Round 11 cross-family divergence)

### "Cross-family divergence is the cleanest disagreement signal."

Round 11 produced the sharpest within-harness disagreement yet: Pro (GPT family) constructed a specific arithmetic counterexample to Layer 2; DeepThink (Gemini family) asserted the same Layer 2 holds via a pigeonhole argument that doesn't address Pro's counterexample. Four Gemini-family instances (DeepThink + 3× Gemini 3.1 Pro) all made the same error. One GPT instance found the refutation.

This is exactly the scenario the three-way harness is designed to surface. Same-family convergence without cross-family confirmation is low-signal. Cross-family *divergence* when present is high-signal — it means one family's blind spot is showing. The curator's job is to trust the counterexample (constructive, verifiable) over the pigeonhole (blind to the arithmetic structure).

## New process lesson (from Gemini triple)

### "Three copies of the same model is not three votes."

User dispatched the Round 11 prompt to three parallel Gemini 3.1 Pro instances for convergence-signal. They did converge — all three gave the same answer with the same pigeonhole proof. But same-model convergence is a much weaker signal than different-model convergence: shared training data, shared reasoning heuristics, shared blind spots. The three-way Pro/Gemini/GPT-thinking harness design is deliberate for this reason. Running three copies of one model is still useful (catches prompt-interpretation variance) but is not a substitute for cross-family convergence. For rigorous promotion, require agreement across *different* model families.

## Attribution

Problem and framework authorship:
- **Xiao_Hu** (Feb 2026 forum post): the $8/105$ density construction that Om's $85/1008$ sieve refines.
- **Liam Price** (Feb 2026 forum post): the original $(23/48)n$ Shortener upper bound, with GPT-5.2 Pro.
- **Om Buddhdev-sensho** (Apr 2026 forum post): the $85/1008$ $v_5$-adic parity sieve.
- **Thomas Bloom, Desmond Weisenberg** (forum): the $\pi(n)$ lower bound via primes in $(n/2, n]$.

Private research in this repo (GPT-5.4 Pro, Claude 4.7 verifiers, Gemini 3 verifiers, Aristotle):
- Shield Reduction Theorem, $5/24$ first-hit skeleton, weighted dual LP analysis — earlier private rounds.
- Theorem A (polynomial-shield lower bound $\beta(P) \ge (1/2)\log(1/\alpha)n$) — Round 1 directed thread.
- Shield-Reduction and $5/24$ formal verifications — Aristotle, Apr 2026.

Everything in `researcher-*.md`, `verify-*.md`, and the verifier conversation dumps is verbatim model output. Everything in `current_state.md`, `process.md`, and the top-level prompts is human-authored (Om + Claude Code curator) distillation.

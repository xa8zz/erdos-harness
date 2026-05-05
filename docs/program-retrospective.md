# Program Retrospective — What the Erdős-872 Campaign Reveals About This Harness

*Drafted 2026-04-23, covering R01–R60 (2026-04-17 → 2026-04-20).*

## 1. Context

Erdős Problem 872 is a two-player game on $\{2, \ldots, n\}$: players alternate claiming integers into a shared divisibility-antichain; Prolonger maximizes game length, Shortener minimizes. $L(n)$ is the value under optimal play, and the central open question is whether $L(n) = \Theta(n)$ or sublinear.

The harness has run ~60 rounds over six days, with three primary reasoning models (Pro, DeepThink, Codex), a verifier ensemble (Claude, Gemini, Aristotle/Lean 4), and the curator-synthesis discipline documented in `CLAUDE.md`. As of R60 the upper bound stands at $L(n) \le (W_4/2 + o(1))n < 0.19n$, the lower bound at $L(n) \ge \Omega(n (\log\log n)^2 / \log n)$ (T2), and the linear-vs-sublinear dichotomy is unresolved.

This document is not about the math. It is about the program: **when** new ground was actually gained, **what types of work** gained it, **where** effort repeatedly stalled, and **what that pattern says** about the kinds of research this particular harness-plus-model setup is built to advance.

## 2. When progress was made

Progress was not uniform. It arrived in five clusters, each durable (producing at least one result that survived all subsequent auditing).

1. **R01–R08 — structural scaffolding.** The Shield Reduction Theorem, the exact cover $\tau(n) = 5n/24 + O(1)$, the polynomial shield barrier (Theorem A), the Vaccinated Shield (R03), the repaired $13/36$ upper bound (R07), and the $5/16$ upper bound (R08). Five Established results in seven rounds. Lean formalization ran in parallel via Aristotle — most of this cluster is zero-sorry in `lean/erdos_872_core/`.

2. **R13-pro cluster — T1 breakthrough.** Rank-3 upper-half fans give $L(n) \ge (1/8 - o(1)) n \log\log n / \log n$ (R13-pro-upper-half-fan). Two independent cross-verifications (R13-pro1-upper-half-audit, R13-pro2-odd-fan) confirmed the constant $1/8$. The sparse-subset closeout (R13-pro-sparse-subset-closeout) landed in the same burst. This was the first sub-problem where the harness demonstrated it could *produce* a non-trivial new theorem rather than just refactor existing ones.

3. **R21–R22 — T2 repair and Lean formalization.** R21-codex-T2-audit-demotion caught a Maker-first / Breaker-first quantifier-order flaw in the T2 writeup that had been sitting in "plausible" state. R21-codex-T2-maker-first-repair reformulated it as a scored 3-uniform hypergraph game; R21-codex-T2-embedding verified the divisibility-to-hypergraph embedding; R22-codex-T2-activation closed the bookkeeping. Four consecutive productive verification rounds, ending with the $n(\log\log n)^2 / \log n$ lower bound substantively Lean-formalized.

4. **R33–R35 — closest approach to sublinear.** R33-pro-A-thickness proved the thickness dichotomy $g(h) = O(h/\log h)$. R35-pro-dyadic-state closed the static state estimate. Together they give a *conditional* $L(n) \ll n \log\log\log n / \log\log n$ — a genuine sub-linear sub-result that survived audit but left the online-amortization step open.

5. **R57–R60 — upper-bound consolidation.** Finite Bonferroni-4 proved rigorous (R57-pro), GraphReachable formalized zero-sorry (R57-codex), R52 integrality barrier sharpened (R58-pro), R53 Q-shadow dichotomy sharpened (R59-pro), and — critically — R60 caught and fixed a flaw in the R57 bridge step (a "by PNT" claim that needed the R57 local-density envelope to actually work). Clean consolidation burst locking in the $<0.19n$ number.

Stepping back from the clusters, these categories of work consistently landed:

- **Structural reductions** — turning the target problem into a named sub-lemma *without trying to prove the sub-lemma in the same round* (R01-directed, R03, R04, R12-pro, R18-codex, R22-pro-certificate-gap, R36-pro-freshness-partial, R37-pro-A-per-score). Almost every such round produced durable scaffolding.
- **Arithmetic refutations with one-line mechanisms** (R06 direct-sieve, R09 carrier-capacity, R11-pro Layer-2, R18-pro O(n/log n), R19-pro Lemma A, R38-pro Ford). Crisp harmonic-sum or counting arguments, one session each, never revisited.
- **Explicit lower-bound constructions via bipartite Maker-Breaker** (T1 at R13-pro-upper-half-fan; T2 at R13 / R22). The rank-$k$ fan idiom translated cleanly into the game — the only lower-bound technique that gained new ground in the entire program.
- **Paradigm-diagnostic syntheses** (R21-codex-synthesis, R41-three-pros-consolidated, R49-pro-1-meta, R52-pro-fresh-zoom). Genuine progress when they named an obstruction *class* rather than a specific lemma. R52-zoom identified the transversal-integrality gap as the single object unifying all of R50–R52's refutations.
- **Lean formalization after a paradigm shift** (R01-aristotle, R21–R22 Lean sprint, R57-codex). Twice caught holes the prose missed: the R21 Maker-first order flaw, and the R60 PNT-alone bridge. Formalization served to *lock in* wins rather than to discover them, but its orthogonality to LLM-family agreement was load-bearing.
- **Three-independent-source convergent refutations** (R41-three-pros: unweighted $(\star)$ dead via three independent constructions; R46-pro-1/2/3: ST-capture dead via burn-in, prelude-illegality, single-leaf). Produced permanent closure every time.

## 3. When we failed or hit issues

Progress was bracketed by two conspicuously stagnant stretches. In each, effort stayed high and the action-graph produced almost no new Established results.

- **R22–R32 — the state-inequality grind.** Eleven rounds circling the same gap. R22 named the certificate-family gap; R23 killed the smooth-squarefree candidate; R24–R28 explored band-local closure variants; R29–R30 provided only empirical support; R31–R32 extracted $\sigma^\star$ empirically. No analytical ground was gained on the actual game across those rounds.
- **R39–R48 — the weighted-$(\star)$ / LRQC loop.** Ten rounds of proposals refuted within one or two rounds of their own birth. R40 proposed collision-forcing; R41 refuted it. R42 proposed a three-regime attack; R42 refuted it. R43 refuted dense and sparse closures. R45 proposed Carleson/ST-capture; R46 refuted it with three independent constructions. R47 named LRQC, endpoint-incidence, and cross-composite budget; R48 refuted all three. Zero new Established theorems across R40–R48.

Categorically, the program has repeatedly failed on these types of work:

- **Online amortization — the single most persistent wall.** Every attempt at sublinear Shortener broke at the step from static state inequality to a game-length bound on $L(n)$: R05, R10, R13-deepthink-mwu, R14-pro-5, R35, R35-fresh, R44-pro-2. The program is now reflexive about naming this step, but it has never closed it.
- **Fresh / neutral / "canonical" dispatches.** R13-fresh × 3, R22-pro-fresh-canonical, R30-pro-canonical, R14-claude-cot — every open-ended dispatch without a specific lemma target reported "no new result." The durable advances uniformly came from continuation dispatches aimed at concrete sub-lemmas.
- **Attractor hallucinations.** Multi-Pro open-ended prompts routinely produce correlated wrong answers. R13 DeepThink claimed $L(n) = \Theta(n)$ via growing-rank fan across multiple threads; R44 Pro produced a harmonic-domination handwave that three of five parallel threads converged on. Within-family verification does not catch these; only cross-family dispatch or Aristotle/Lean does.
- **Variant N+1 of the same framing.** R14-pro-4/5/6, R44-pro-2/3/4 after the honest-no-proof — repeated attempts at the same structural hope, each variant failing the same way. This pattern has been named in `CLAUDE.md`: "if the same prompt's third attempt produces the same failure mode, the problem is not the agent."
- **Upper-bound Shortener constructions with Bonferroni on a variable-length prime prefix.** R06 non-monotonicity bug, R07 truncation fix, R14 six variants, R15 piecewise-density candidate, R57 finally rigorous, R60 bridge flaw. Productive in the long run, but the path from R15's conjectured $0.18969n$ to a rigorous theorem took 45 rounds and three bug-finds. The failure mechanism was always a subtle step (sieve non-monotonicity, PNT-alone insufficient) buried inside an otherwise-clean argument.

## 4. What we're good at

The strengths are a property of the harness-plus-model combination, not either alone.

**Infrastructure strengths.**
- *Long-horizon state management across agent compactions.* Immutable frontmatter, an action-graph instead of mutable status fields, a compile script that regenerates the state view from the graph, per-round commits — sixty rounds remain queryable and no prior round is silently lost between sessions.
- *Refutation-by-specific-mechanism as the durability substrate.* Every Ruled Out entry names primes, shield sets, constants, or strategies. The `failure_mechanism` YAML field is structurally required when `action.kind ∈ {refutes, supersedes}`, so future agents cannot re-derive dead ends in the way the program would otherwise pattern-match toward.
- *Cross-family convergence as truth filter.* Pro + Gemini + Claude agreement caught R06's non-monotonicity bug; ChatGPT missed it; 2-of-3 was decisive. Within-family agreement is low signal (R44 attractor is the canonical counterexample).
- *Empirical + analytical complementarity.* Codex empirical probes (phase0–4) plus Pro analytical dispatches localize gaps that neither lens surfaces alone. R33's diagnosis that $\sigma$-vs-shadow_pressure fails in the abstract model but holds in the one-cylinder arithmetic model required both.
- *Formal-verifier routing as an orthogonal check.* Aristotle/Lean agreement is independent of LLM family agreement; twice it caught holes prose missed.

**Primary-model strengths that emerged from observed outputs.**
- *Extracting structural reductions* — turning a target into a named sub-lemma without trying to prove it. Highest hit rate of any prompt framing.
- *Generating explicit combinatorial counterexamples* with specific parameter values (R41 collision-forcing kills, R46 ST-capture burn-in, R50–R52 WLST refutations). The refutation idiom is where the primary models are consistently sharpest.
- *Zooming out to name paradigm exhaustion* — the program's highest-value outputs (R41, R49-meta, R52-zoom) all came from this mode, and only after the curator explicitly asked for meta-diagnosis rather than another variant.

**Weaknesses worth naming.**
- Cannot reliably close the static-to-dynamic translation without an exogenous idea.
- Fresh / open dispatches do not break new ground on their own — the continuation dispatches with concrete lemma targets are where breakthroughs happen.
- Susceptible to attractor hallucinations on open-ended prompts; cross-family dispatch is the only known mitigation.

## 5. What other problem domains would this apply to?

The harness's strengths track to problems where (a) failure mechanisms are crisp and checkable, (b) refutation by explicit construction is central, (c) paradigm-level exhaustion is meaningful, and (d) multi-round accumulation on a single question pays for the curation overhead.

**Strong fits.**
- *Combinatorial game theory more broadly* — Maker-Breaker positional games, saturation games, graph pursuit (cops and robbers), online scheduling games. Same rank-based fan and state-inequality structure the 872 program lived in.
- *Additive combinatorics and Erdős-type density questions* — sum-free sets, $B_h$ sets, Roth / Szemerédi-adjacent problems. Refutations are explicit set constructions with specific arithmetic signatures.
- *Hardness of approximation, PCP-style reductions, circuit lower bounds.* Reductions and gadgets *are* counterexamples-as-constructions. Paradigm-exhaustion arguments (why natural proofs can't beat P vs. NP, why SOS degree-$d$ can't separate particular CSPs) are exactly the kind of negative structural theorem the harness produced at R52/R56.
- *Cryptographic security proofs and concrete attacks.* Specific attacks serve as refutations with crisp mechanisms; cross-family verification is a natural fit for catching proof-of-security mistakes that one model family might overlook.
- *Distributed-algorithm impossibility results.* Adversarial schedules play the role of adversarial strategies; FLP-style arguments have exactly the shape the harness is optimized for.
- *Formal methods and proof assistants.* The Lean / Aristotle pipeline is already wired in.

**Moderate fits.**
- *Analysis and PDE regularity.* Counterexample construction works (Nash–Moser, blow-up solutions), but much of the work is derivation of inequalities rather than discrete paradigm exhaustion. Roughly half the harness applies.
- *Statistical learning theory and concentration.* Sample-complexity lower bounds have the right flavor (Fano-style, minimax constructions), but most rounds would look like derivation, not refutation.
- *Algorithmic game theory and mechanism design.* The $\sigma^\star$-trap pattern — auditing whether a fixed adversary strategy is actually optimal — transfers directly. The refutation idiom is less central.

**Weak fits.**
- Open-ended qualitative design, architecture decisions, product strategy — no crisp refutation signature.
- Computational/empirical science where outputs are measurements rather than proof structures — the curation overhead is not paid for.
- Domains with large non-verbal artifacts (images, genomic data) where transcript-extraction discipline does not capture the state.
- Short-horizon problems that close in five rounds — the compile-script and immutable-frontmatter infrastructure is not worth the cost.

## 6. Transferable lessons

Three patterns the harness has named along the way, each of which generalizes to any long-horizon adversarial-analysis research:

- *σ\*-trap / strategy-assumption audit.* Fix-and-forget an adversary strategy, then audit whether it is actually optimal. Every game-theoretic or worst-case-construction setting eventually needs this.
- *Within-family attractor states + cross-family dispatch.* Same-family retry is low signal; cross-family dispatch is the primary truth filter on open-ended prompts.
- *State inequality ≠ dynamic bound.* Every static bound in an adversarial setting needs the online-amortization step named explicitly before the bound is trusted. The 872 program spent roughly a third of its rounds relearning this lesson.

The single largest meta-finding: **the harness's highest-value outputs are paradigm-level diagnoses, not individual theorems.** R52-zoom naming the transversal-integrality gap did more to constrain future dispatches than any of the specific refutations it unified. Future programs should dispatch for this mode explicitly, not wait for it to emerge after ten rounds of variant-N attempts.

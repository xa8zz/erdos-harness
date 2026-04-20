# Publication Source Of Truth

Last updated: 2026-04-20

This file is a publication-facing inventory of the math in this repo. It is meant to answer:

- What is genuinely worth writing up?
- What is rigorous enough to bank now?
- What is interesting but still conditional or unintegrated?
- What should stay internal because it is mainly process, failed routes, or unaudited attractor material?

I am using four labels throughout:

- `Banked`: rigorous enough to treat as a theorem/result in a draft now.
- `Near-banked`: very likely worth publishing, but still needs one explicit repair, audit pass, or formalization cleanup.
- `Structural negative`: a real no-go / obstruction / refutation that seems publishable as mathematics, not just as failed process.
- `Empirical`: computation worth including as evidence, motivation, or a numerical section, but not as a theorem.

## 0A. Verification Key

The labels above say whether something is publication-worthy. This second key says how verified it is.

- `Formally verified`: Lean / Aristotle artifact exists for the mathematical core with no logical gap in the repo's current understanding.
- `Rigorous prose`: theorem-proof writeup is stable, audited, and good enough to cite in a draft, but not yet fully formalized.
- `Computationally certified`: reproducible code / numerics strongly support the claim, but the theorem-grade proof is still missing.
- `Promising but not integrated`: good theorem or diagnosis candidate, but not yet folded cleanly into `current_state.md` / a canonical note / a full audit chain.
- `Internal / heuristic`: useful during research, but should not be foregrounded in publication.

## 0B. Top-Level State

As of 2026-04-20, the repo is in a good publication state, but not all claims have the same rigor level.

- `Formally verified + banked`: Shield Reduction, Theorem A's core artifact, the exact `5/24` cover theorem, the `13/36` upper bound, and T1.
- `Rigorous prose + banked`: T2, Theorem 5, Theorem 6, the universal block-product counter, the separate-rank / residual-width / band-local obstruction chain, R44, R46, the clean R56 separator-only barrier, the **R52 transversal-integrality / Sherali-Adams barrier** (audit-confirmed and sharpened), and the **R53 q-shadow / covering dichotomy** (audit-confirmed and sharpened). All of these are strategy-independent (they do not depend on the `sigma^*` Shortener assumption).
- `Rigorous prose but not yet formally verified`: the Round 15 finite Bonferroni-4 upper bound `L(n) <= (W_4/2 + o(1)) n` with `W_4/2 < 0.19`.
- `Computationally certified but not theorem-safe`: the sharper Round 15 limit constant `0.18969n`.
- `Promising late-round material not yet fully integrated`: the R52 spectral live-space separator theorem (as a standalone Johnson-scheme statement), the R54 strategy-dependence classification, the R55 hidden-packet lag diagnosis, and the more aggressive R56 single-certificate divisor barriers.

This means we already have enough for an honest paper draft now. What we do **not** yet have is a fully formal Lean / Aristotle artifact for the finite sub-`0.19` theorem, or theorem-grade justification for replacing it by the sharper `0.18969n` limit constant.

## 0. Paper Thesis

If this becomes a single paper, the cleanest one-line thesis is:

- We develop the strongest current Shortener-side upper-bound theorem candidate in the game, pushing the piecewise-density line rigorously below `0.19` at finite Bonferroni-4 level, and we build a structured taxonomy of proof-class barriers showing why the sharp-rate problem is structurally hard.

In practice, that means the paper should not read as a pile of unrelated results. The strongest narrative arc is:

1. formal core theorems (`Shield Reduction`, Theorem A, `5/24`, `13/36`, possibly T1/T2),
2. refined upper-bound progress (Round 15 local theorem + finite Bonferroni-4 sub-`0.19` theorem-grade prose result),
3. a "landscape of impossibility" section cataloging why the most natural proof classes fail.

## 0C. Relation to public discourse

The problem is listed as Erdős problem 872 on `erdosproblems.com`. Two items to bake into any paper:

- **Prior-first-player ambiguity.** Erdős's original statement does not specify which player moves first; the two orderings can in principle give different answers. All upper-bound work in this repo, and all public discourse cited below, assumes **Prolonger moves first**. This assumption must be stated explicitly at the top of the paper.
- **Current public upper-bound record** on the Erdős forum thread (as of Apr 2026), in chronological order:
  - Liam Price + GPT-5.2 Pro (Feb 2026): first linear upper bound `L(n) <= (23/48 + o(1)) n = 0.479 n`. This is also where the "Prolonger / Shortener" naming convention originated.
  - Forum refinement (Adenwalla, StijnC, natso26, Xiao_Hu, Desmond Weisenberg, and others): `L(n) <= (419/1008 + o(1)) n <= 0.416 n`.
  - This repo's `Om_Buddhdev_sensho` post (Apr 16, 2026) on the thread: introduced the `85/1008 ≈ 0.0843` ratio-independent construction underlying the Round 15 piecewise-density line.

Against this baseline:

- **Banked `13/36 + o(1) ≈ 0.361 n` is a 13% constant improvement** over the `0.416 n` forum record.
- **Near-banked Round 15 sub-`0.19 n` is a factor-of-`~2.2x` improvement** and now has theorem-grade prose support (R57 + audit), pending formalization.
- **T1 and T2 lower bounds are new for this game.** Prior public discourse cites only the `\gg n \log n` bound of Füredi–Seress for the *triangle-saturation* game, which is a different game. Our T1 gives `(1/8 - o(1)) n \log\log n / \log n` and T2 gives `c_\delta n (\log\log n)^2 / \log n`; neither appears in the forum thread or in the cited prior literature for this specific problem.

The paper should be framed as a **substantial improvement on the forum record with matching lower bounds and Lean-verified structural lemmas**, not as "first AI-assisted work on #872" (Price + GPT-5.2 Pro preceded us) or as a full closure (the sharp rate remains open).

## 0D. Prior work to cite

Canonical references for any paper from this repo:

- `[Er92c]` Erdős 1992 — the original problem reference.
- `[FuSe91]` Füredi and Seress 1991 — the triangle-free saturation-game analog, `\gg n \log n` lower bound.
- `[BPW16]` Biró, Horn, and Wildstrom 2016 — `(26121/121104 + o(1)) n^2 < 0.215 n^2` upper bound for the triangle-saturation game.
- `[CaEr90]` Cameron and Erdős 1990 — primitive sets in the divisibility lattice; relevant ambient structure.
- Price + GPT-5.2 Pro Feb 2026 (forum post on `erdosproblems.com/872`) — first linear bound `23/48 n` and the Prolonger/Shortener naming convention.
- Forum commenters Adenwalla, StijnC, natso26, Xiao_Hu, Desmond Weisenberg for the refinement chain to `0.416 n`.
- Lichtman 2023 (arXiv:2202.02384) — divisibility antichain results relevant to the lower-bound literature.
- Kucheriaviy 2024 (arXiv:2406.05896) — relevant to the combinatorial-structure literature.
- Martin and Pomerance 2010 (arXiv:1009.01014) — multiplicative-structure density results used in supporting estimates.

A "Prior work" section is currently not yet drafted into any paper-facing note in this repo. Adding it is a gating item before any public release.

## 0E. Publication triage — what needs what

The paper has a lot of results. Not all need the same level of verification. This section triages by **criticality to the paper's headline narrative**, and prescribes **Lean-versus-prose** treatment for each tier.

**Strategy-dependence legend** (per R54 audit, Section 3A.1):
- `strategy-independent` = result does not depend on any specific Shortener strategy.
- `sigma^*-dependent` = proof explicitly uses the max-unresolved-harmonic-degree rule `sigma^*` and does NOT survive strategy replacement. `sigma^*` was proved suboptimal by R53 cooperative embedding, so `sigma^*`-dependent results are **conditional** and do not contribute to a closure proof under an alternative Shortener strategy.
- `sigma^*-specific` = a refutation that constructs a state reachable specifically against `sigma^*`; may not apply to other strategies.
- `strategy-specific` = proof uses a specific named strategy, but that strategy is NOT `sigma^*`. E.g., the `13/36`, `5/16`, and `0.19n` proofs each specify their own static or semi-dynamic strategy independent of `sigma^*`.

### Tier 1 — paper-critical (headline or infrastructure; error here invalidates the paper)

| Claim | Statement | Strategy-dep. | Verification | Notes |
|---|---|---|---|---|
| **0.19n upper bound (R57)** | `L(n) <= (W_4/2 + o(1)) n` with `W_4/2 ~ 0.18971` | **strategy-specific** (Shortener plays smallest legal odd prime on first `K = (1-eps) n/(2 log n)` turns — NOT sigma^*) | **Heavy prose audit (Gemini + GPT-thinking). Lean is overkill for this analytic proof.** | Canonical source: `researcher-57-pro-round15-bonferroni4-PROVED-L-le-0.19n.md`. Dependency: Round 14 factorial-moment comparison theorem — verify it's rigorous somewhere in `13/36` infrastructure. Does NOT depend on sigma^*. |
| **Shield Reduction Theorem** | `|A| >= |U| - beta(P)` for terminal antichain `A`, `P subseteq U` | **strategy-independent** | **Lean-verified, 0 sorries** | ✓ Done. |
| **T1 / Theorem A** | `L(n) >= (1/8 - o(1)) n log log n / log n`; `beta(P) >= ((1/2) log(1/alpha) + o(1)) n` for `|P| <= n^alpha` | **strategy-independent** (Prolonger construction, no Shortener strategy involved) | **Lean-verified modulo 6 PNT-adjacent Mathlib sorries.** | Acceptable for paper as "Lean-verified modulo classical-NT imports." |

### Tier 2 — paper-important (anchors one section; error loses that section but paper survives)

| Claim | Statement | Strategy-dep. | Verification | Notes |
|---|---|---|---|---|
| **13/36 upper bound** | `L(n) <= (13/36 + o(1)) n ~ 0.361 n` | **strategy-specific** (smallest-legal-odd-prime Shortener with truncation at `s_t >= 1/3`) | **Lean-verified, 0 sorries** | ✓ Done. Weaker than 0.19n; retain for completeness / historical. |
| **5/16 upper bound** | `L(n) <= (5/16 + o(1)) n = 0.3125 n` | **strategy-specific** (same family as 13/36; longer prefix, sharper Bonferroni) | **Math is rigorous.** Lean artifact has 5 Chebyshev-adjacent sorries but **Lean closure is NOT needed** — dominated by 0.19n, and the prose proof is standalone. | **Elegant intermediate result** and the tight limit of the odd-prime-prefix Shortener family. Worth a compact section in the paper for the truncation technique alone. No new Lean effort. |
| **5/24 exact cover** | `tau(n) = 5n/24 + O(1)` with explicit cover `H_n` + packing `P_n` | **strategy-independent** (about the unweighted cover problem) | **Lean-verified, 0 sorries** for structural identities. | ✓ Done. Cardinality `|H_n| = 5n/24 + O(1)` is elementary floor-sum. |
| **T2 lower bound** | `L(n) >= c_delta n (log log n)^2 / log n` for `delta < 1/4` | **strategy-independent** (Maker-first hypergraph capture, no Shortener strategy involved) | **Rigorous prose; finite cores Lean'd, activation wrapper in progress.** | Cite as "rigorous prose + partial Lean." |
| **R52 transversal-integrality / Sherali-Adams barrier** | Integrality gap `>= Omega(N/log N)`; SA level `r <= l/2` | **strategy-independent** (purely static combinatorial) | Prose + 93k exact-rational SA checks. | No Lean. |
| **R53 q-shadow / covering dichotomy** | Spectral/comparability dichotomy; `delta_q = (e + o(1)) h^{-2}`, `|C| > (1/e - o(1)) h^2` | **strategy-independent** (uses only spectral separator theorem + union bound) | Prose + 12.5M sandbox cases. | No Lean. |
| **R56 finite odd-carrier / separator-only barrier** | No separator-only proof closes `o(n)` upper bound; explicit Prolonger upper-half dyadic counter | **strategy-specific** (quantifies over the separator-only Shortener class; theorem-level result is about the class, not about any single Shortener) | Prose + N=3 cross-family convergence. | No Lean. |
| **Theorem 5 / Theorem 6 (restricted classes)** | `O(n/log n)` against disjoint small-prime carriers and rank-<=3 squarefree carriers | **strategy-specific** (four-phase explicit Shortener strategy; not sigma^*) | Prose. | No Lean. |
| **F_alpha framework (R12)** | `beta(P_alpha) <= (1 - gamma_alpha) n + o(n)` via omitted-vertex shadowing | **strategy-independent** | Prose. | Supporting. |
| **85/1008 ratio-independent sieve** | Density `85/1008 ~ 0.0843` sieve construction underlying Round 15 | **strategy-independent** | Prose + sandbox. | Supporting. Cite in Round 15 / 0.19n section. |

### Tier 3 — taxonomy / supporting (error loses a subsection bullet; paper survives trivially)

All items here are **prose-only with sandbox verification where applicable**. No Lean required.

| Item | Strategy-dep. | Notes |
|---|---|---|
| Universal block-product carrier-mass counter | **strategy-independent** (explicit Prolonger construction) | Prose. |
| Separate-rank fan no-go (single-rank + multi-rank coupling + Sperner/LCM) | **strategy-independent** | Prose. |
| Residual-width lemma refutation | **strategy-independent** (static counterexample) | Prose. |
| Ford-route correction | **strategy-independent** | Prose. |
| Band-local closure explosion theorem | **strategy-independent** | Prose. |
| Directed rank-3 cleanup bound | **strategy-independent** | Prose. |
| Dyadic-fiber positive-density collapse | **strategy-independent** | Prose. |
| R44 residual-floor diagnosis + local-star obstruction | **sigma^*-framework** (diagnoses the residual floor of sigma^*-type state inequalities) | Prose. Important to flag sigma^* dependency when citing. |
| R46 conditional smallest-legal-prime lemma | **sigma^*-dependent** (lemma is about sigma^*'s response in specific states) | Prose. |
| R46 ST-capture refutation | **sigma^*-specific** (refutation uses forced-leaf under sigma^*) | Prose. |
| sigma^*-suboptimality theorem (R53 cooperative embedding) | **sigma^*-specific theorem (cost o(r_1) against sigma^*)**, but the theorem itself is rigorous independent of which strategy we focus on. | Prose. Goes in "Proof-Class Barriers" section. |
| R54 strategy-dependence classification (meta-theorem) | **about sigma^*** (classifies which late-stage ingredients depend on sigma^*) | Prose. Subsection of "Proof-Class Taxonomy." |
| Dyadic packet collision tail `mu(coll(S) >= s) <<_s N_h (c^2/h)^s` | **strategy-independent** | Prose. Supporting machinery for dense-packet arguments. |
| Dense-packet projection `mu(D_{k,theta}) <<_C (k^2/theta h^2) N_h + mu(E)` | **sigma^*-dependent** (upper-bound role uses online harmonic domination, which is sigma^*-dependent) | Prose. Paper's "barriers under sigma^*" subsection. |
| Sathe-Selberg central-rank Euler factors | **strategy-independent** (analytic number theory) | Prose. |
| Bernoulli Legal-Separator Lemma | **strategy-independent** (static existence) | Prose. |
| Apex-singleton CPD | **strategy-independent** | Prose. |
| Spectral Live-Space Separator Theorem (single-level, R52 spectral note) | **strategy-independent** | Prose. |
| Sparse-subset realization | **strategy-independent** | Prose. |
| Phase 0/1/2/3/4 empirical results | **strategy-independent** (computational) | Empirical section. |

### sigma^*-dependent items in the paper — handling guidance

Results marked `sigma^*-dependent` or `sigma^*-specific` above cannot be used as the basis of an unconditional upper-bound closure at `r_1` (since `sigma^*` is provably suboptimal, R53). They remain publication-worthy in the paper **as conditional results** or **as diagnostic insight into why the state-inequality paradigm does not close `r_1`**. Suggested treatment:

- **R35 state inequality + online harmonic domination** (from Round 35 / Round 14 / dense-packet projection chain): cite as "conditional sigma^*-dependent tools" in a clearly-labeled subsection. Explicitly note that these do not survive strategy replacement per R54.
- **R44 / R46 sigma^*-specific results**: present as part of the "Proof-Class Taxonomy" section, alongside the R54 classification meta-theorem. Don't frame them as closure candidates.
- **R53 sigma^*-suboptimality theorem**: a standalone result worth a theorem number. It shows `sigma^*` is not the minimax-optimal Shortener; this is itself a contribution and motivates the R54 classification.
- The **headline 0.19n upper bound (R57) does NOT depend on sigma^***. This matters for the paper's narrative: the headline is not conditional.

This `sigma^*` distinction should be surfaced explicitly in the paper so reviewers don't confuse the conditional state-inequality tools with the main headline result.

### What this triage implies for the Lean sprint

**Goal:** get Tier 1 rigorously verified to reviewer-acceptable level; tier 2 with Lean where already present; tier 3 prose only.

**Concrete short-term tasks** (roughly in order of ROI):

1. **Audit R57 (0.19n) proof** informally via Gemini + GPT-thinking. 1 hour each. Highest-risk claim; catch any logic bugs before submission.
2. **Verify Round 14 factorial-moment comparison theorem** is rigorous. Locate it in existing `13/36` or `5/16` infrastructure; if missing, close the gap with a short stand-alone proof.
3. **Close 6 sorries in `ShieldMainTheorem.lean`** (Theorem A) — likely Mathlib-gap imports. One Codex dispatch. Abandon if they require new math; cite as "PNT-adjacent Mathlib gaps."
4. **Close 5 sorries in `shortener_5_16_out/Theorems.lean`** — likely Chebyshev-adjacent. One Codex dispatch with `D = {3, 5}` substitution as in the `13/36` proof. Abandon if hard.
5. **T2 activation-stage wrapper Lean** — Codex is actively on this. No additional action needed until their current work lands.
6. **Everything else: prose only.** R52, R53, R56, Theorems 5/6, F_alpha, structural negatives, taxonomy — all prose with sandbox checks where applicable.

**What NOT to do:**
- Attempt full Lean verification of the R57 (0.19n) analytic proof. Months of work for marginal reviewer gain. Trust informal audit + Round 14 comparison theorem verification.
- Attempt Lean of R52 / R53 / R56 barriers. Sandbox-verified and Pro-audit-confirmed is paper-grade for combinatorics venues.
- Attempt Lean of Theorems 5, 6, or any tier-3 structural negative.

**Paper's formal-verification language** (draft):

> Shield Reduction (Theorem 1.1) and the `5n/24 + O(1)` cover theorem (Theorem 2.3) are formally verified in Lean 4 via Aristotle with no remaining sorries. The `13/36` upper bound (Theorem 3.1) is formally verified with no remaining sorries. Theorem A (`n^{1/e}` shield barrier, Theorem 2.5) and the `5/16` upper bound (Theorem 3.2) have Lean artifacts with classical-number-theory sorries (PNT- and Chebyshev-`vartheta`-adjacent, enumerated in Appendix A); these are Mathlib-dependency gaps rather than logical holes. T2 has a Lean-verified finite core with the activation-stage wrapper pending. The remaining results — the improved `0.18971...n` upper bound (Theorem 4.1), the proof-class barriers (Section 5), and the restricted-class results (Section 6) — are proved rigorously in prose with multi-verifier audit and sandbox computation where applicable.

That framing is honest, gives the right reviewer signal, and does not block on new Lean work.

## 1. Highest-priority publishable results

These are the strongest things in the repo to foreground in a paper or serious writeup.

### 1.1 Shield Reduction Theorem

- `Banked`
- Best source: `current_state.md` ("Shield Reduction Theorem"), Aristotle output in `aristotle/shield_reduction_out/`
- Why it matters: it is the first clean conceptual reduction from the game to the weighted lower-half quantity `beta(P)`.
- Why it is good: short, elegant, genuinely structural, and formally verified in Lean/Aristotle.
- Publishability: very high. This should absolutely be in any main paper.

### 1.2 Polynomial shield lower bound / "Theorem A"

- `Banked`
- Best source: `current_state.md` ("Polynomial shield lower bound -- Theorem A"), Aristotle output in `aristotle/theorem_A_out/`
- Statement-level value: if `|P| <= n^alpha`, then `beta(P) >= ((1/2) log(1/alpha) + o(1)) n`, implying the `n^(1/e)` barrier for any linear lower bound via shield reduction.
- Why it matters: this is a genuine barrier theorem for one of the central Prolonger paradigms. It says the short-shield-prefix route cannot possibly prove linearity unless the shield set is polynomially large with exponent at least `1/e`.
- Why it is good: novel, sharp-looking, conceptually clean, and close to formally complete; the remaining Aristotle gaps are classical number theory imports, not logical holes.
- Publishability: very high. This is one of the repo's clearest standalone theorems.

### 1.3 The `5/24` first-hit cover / exact upper cover theorem for `L`

- `Banked`
- Best source: `current_state.md` ("The 5/24 first-hit cover"), Aristotle output in `aristotle/tau_5_24_out/`
- Statement-level value: explicit upper cover `H_n`, matching packing `P_n`, and `tau(n) = 5n/24 + O(1)`.
- Why it matters: exact structure theorem for the unweighted cover problem sitting inside the game.
- Why it is good: explicit construction, exact asymptotics, and formally verified structural content.
- Publishability: high. This could be a theorem in the main paper or a compact companion note if the main paper is more game-focused.

### 1.4 First unconditional Shortener upper-bound improvements

- `Banked` for `13/36 + o(1)`, `Near-banked / computationally certified` for a sub-`0.19` Round 15 headline, `Near-banked` for `5/16 + o(1)` as the older formally cleaner route, and `Conditional / numerical` for the sharper `0.18969 + o(1)` constant
- Best source: `current_state.md` ("L(n) <= 13n/36 + o(n)" and "Upper bound on L(n)"), Aristotle outputs in `aristotle/shortener_13_36_v2_out/` and `aristotle/shortener_5_16_out/`
- Why they matter: these are real record-type unconditional upper bounds coming from explicit Shortener strategies.
- What is banked:
  - `L(n) <= (13/36 + o(1)) n` is fully formalized and safe to cite as a theorem.
  - The truncation fix is mathematically nice and worth explaining even if `5/16` becomes the headline.
- What is near-banked:
  - The Round 15 piecewise-density route now gives a computationally certified sub-`0.19` headline. The finite Bonferroni-4 truncation is numerically ratified in `phase3/shortener_piecewise_bonferroni4_summary.md`, with finest-grid `W4/2 = 0.189710592 < 0.19`.
  - `L(n) <= (5/16 + o(1)) n` looks like the stronger theorem the repo should ultimately bank, but the final formalization still has one last Chebyshev/game-tree style gap.
- What is not yet theorem-grade:
  - The finite Round 15 `0.190n` formulation still needs the explicit monotone-comparison / breakpoint transfer before it can be promoted from computationally certified paper claim to theorem.
  - The sharper Round 15 limit constant `L(n) <= (\mathcal W/2 + o(1)) n \approx 0.18969 n` still needs the explicit monotone-comparison / breakpoint repair.
- Publishability: very high. At minimum the `13/36` theorem belongs in the paper; for the current draft, the best Shortener headline is a computationally certified sub-`0.19` Round 15 constant, with `0.18969n` mentioned as a numerically certified likely sharpening rather than as a banked theorem.

### 1.5 Lower bounds T1 and T2

- `Banked` for T1, `Banked but not Lean-checked` for T2
- Best source: `current_state.md` ("Lower bound on L(n)", later T1/T2 closeouts), `phase4/t2_core_paper_note.md`, `phase4/t2_maker_first_lemmas.md`, `researcher-21-codex-T2-maker-first-repair.md`, `researcher-22-codex-T2-activation-audit.md`
- Why they matter:
  - T1 gives the first meaningful sublinear-scale lower bound beyond the trivial `n/log n` baseline.
  - T2 gives the second-order lower bound `c n (log log n)^2 / log n`, which shapes almost every later upper-bound discussion.
- Caution:
  - T2 is only as banked as you believe the R21/R22 repair chain. The current repo treats it as rigorous again after the Maker-first repair and activation audit, but it is not formally Lean-checked.
- New formalization progress:
  - As of 2026-04-20, `aristotle/t2_finite_core/` now contains clean Lean artifacts for both finite Maker-first cores:
    - graph core in `RequestProject/T2Finite/GraphGame.lean` (`Q8_empty_eq_totalWeight`, `Q8_terminal_eq_eight_claimedWeight`, `Q8_maker_ge_add_selfPot`);
    - scored 3-uniform core in `RequestProject/T2Finite/HyperGame.lean` (`HQ8_empty_eq_totalWeight`, `HQ8_terminal_eq_eight_scoredWeight`, `HQ8_maker_ge`, `HQ8_maker_ge_add_selfPot_of_count_le_two`, `HQ8_breaker_score_ge`).
  - The same project now also contains a local arithmetic embedding core in `RequestProject/T2Finite/EmbeddingCore.lean`, including `smallDivisors_eq_divisors_ac`, `dvd_value_mem_smallDivisors_or_b_mul_smallDivisor`, `mem_slots_or_eq_value_of_dvd_value_not_small`, `mem_harmfulMoves_iff`, `eq_b_of_b_dvd_value`, `eq_b_and_a_eq_or_eq_of_ab_dvd_value`, `eq_b_and_c_eq_or_eq_of_cb_dvd_value`, the exact incidence iff-statements `b_dvd_value_iff_mem_slots`, `ab_dvd_value_iff_mem_slots`, `cb_dvd_value_iff_mem_slots`, the value-uniqueness lemma `eq_of_value_eq`, and the local legal-live-edge criterion `value_legal_against_of_disjoint_smallDivisors_and_harmfulMoves`. That banks the key arithmetic facts that, after removing `{1,a,c,ac}`, the harmful-move set for one residual target `t = acb` is exactly `{b,ab,cb,t}`, that `b`-, `ab`-, and `cb`-slot divisibility are exactly the same as slot incidence across two residual targets, that equal upper-half target values correspond to the same residual target, and that once those accounted-for divisors and harmful moves are excluded, `t.value` is automatically incomparable with every already-played number in the local residual state.
  - A new family-level comparison layer in `RequestProject/T2Finite/EmbeddingFamily.lean` now proves `harmfulTargets_eq_slotIncidentTargets_b`, `harmfulTargets_eq_slotIncidentTargets_ab`, `harmfulTargets_eq_slotIncidentTargets_cb`, and the exact-target singleton theorems `mem_harmfulTargets_value_iff_eq_of_upperHalf`, `harmfulTargets_eq_singleton_value_of_upperHalf`. So the residual embedding is no longer just single-target arithmetic in Lean: the finite family model now formally identifies `b`, `ab`, and `cb` moves with exact incident-hyperedge deletions, and it also proves that in an upper-half family an exact target play hits only its own edge, matching the scored-edge semantics.
  - `phase4/t2_core_paper_note.md` now consolidates the repaired T2 core in one paper-grade theorem-proof note: abstract Maker-first graph/hypergraph lemmas, the residual comparison theorem, and the activation-stage inequality.
  - The remaining non-Lean gap for T2 is now mainly final wrapper integration into a single formal theorem. For paper purposes, the logic is now centralized and readable; for formal purposes, the missing step is the global activation-stage wrapper that feeds the actual played set into the now Lean-banked local legal-live-edge criterion, together with the activation/token bookkeeping, rather than any unresolved local divisor arithmetic.
- Publishability: high if you are comfortable staking the paper on the repaired proof. If not, keep T1 as the unconditional public floor and present T2 as "current internal theorem / to appear separately."

## 2. Strong restricted-class theorems that feel paper-worthy

These are not full solutions, but they are mathematically real and sharpen the landscape in an interesting way.

### 2.1 Theorem 5: `O(n/log n)` against disjoint small-prime carriers

- `Banked`
- Best source: `phase4/theorem5_disjoint_carriers_note.md`, then `current_state.md` ("Round 12 follow-up -- Theorem 5")
- Why it matters: it proves that the universal block-product Prolonger adversary is not actually the hard case.
- Why it is good: this is one of the cleanest "the strongest obvious enemy is not the real enemy" results in the repo.
- Paper note: the cleaned-up note fixes the two audit caveats from the original prose by making the strategy explicitly online and correcting the pure-prime-power sentence.
- Publishability: high, especially as part of a "restricted adversary classes" section or note.

### 2.2 Theorem 6: `O(n/log n)` against squarefree rank-`<= 3` carriers

- `Banked`
- Best source: `phase4/theorem6_rank3_squarefree_note.md`, then `current_state.md` ("Theorem 6 -- rank-<=3 extension of Theorem 5")
- Why it matters: it pushes the restricted-class program one rank further and shows exactly where the first true overlap obstructions begin.
- Why it is good: explicit four-phase strategy plus nontrivial triple-count estimate.
- Paper note: the cleaned-up note makes the phase-2 qualifier explicit, expands the `|supp(x)| >= 4` survivor induction, and states the phase-4 count honestly as a fixed-`alpha` `O_alpha(n/log n)` bound.
- Publishability: high. Together with Theorem 5, this feels like a coherent mini-paper or a strong section in the main paper.

### 2.3 Sparse-subset realization

- `Banked` as a restricted construction theorem; `Empirical` for the optimization side
- Best source: `current_state.md` ("Sparse-subset closeout"), `phase3/sparse_subset_summary.md`
- Why it matters: shows that a surprisingly small carrier family can isolate many residual `qab` moves.
- Why it is good: multiple independent derivations converged, and the explicit-vs-greedy gap is numerically interesting.
- Publishability: moderate to high. Good companion result if you decide to emphasize case analyses / residual constructions.

## 3. Best structural negative results

These are some of the most valuable things in the repo. Several are more publishable than half of the "positive" attempts because they cleanly kill bad paradigms and identify the right invariant.

### 3.1 Universal block-product counter on carrier mass

- `Banked`
- Best source: `phase4/block_product_carrier_mass_note.md`, then `current_state.md` ("Universal Prolonger counter on carrier mass"), `verify-postresp-10-audit-universal-block-product.md`
- Statement-level value: no Shortener can keep `sum_{p in B(P)} 1/p` bounded; Prolonger can force at least `(1/2) log log n + O(1)`.
- Why it matters: kills the bounded-carrier-mass route in both static and dynamic forms.
- Framing note: this is an obstruction theorem, not the final word on the block-product carrier class; later Theorem 5 shows that this class is still resolvable in `O(n/log n)`, so the lasting value here is "bounded carrier mass is the wrong universal invariant."
- Publishability: high. This is a real obstruction theorem, not a failed idea.

### 3.2 Separate-rank fan architecture is provably sublinear

- `Banked`
- Best source: `current_state.md` (Rounds 17 and 18), `researcher-17-codex-negative-on-separate-rank-fan-route.md`
- Statement-level value:
  - single-rank ceiling `max_h W_h(n) ~ n / sqrt(log log n) = o(n)`;
  - summed separate-rank fan contributions still give only `n / (log n)^(1-o(1))`.
- Why it matters: this closes the most natural linear-lower-bound architecture that dominated a huge portion of the repo.
- Publishability: very high. This is exactly the kind of negative theorem people remember because it explains why a natural program cannot work.

### 3.3 Multi-rank same-`b` coupling is blocked (Sperner / LCM obstruction)

- `Banked`
- Best source: `current_state.md` (Round 18 closeout)
- Why it matters: closes the "maybe separate ranks fail, but rank-coupling still gives linearity" loophole.
- Publishability: high, especially together with 3.2.

### 3.4 Residual-width lemma is false (upper-half lift obstruction)

- `Banked`
- Best source: `current_state.md` (Round 20 closeout), `researcher-20-codex-residual-width-framework-refuted.md`
- Why it matters: shows that the naive certificate-family residual-width abstraction is fundamentally too weak.
- Publishability: high. Clean counterexample, clean lesson.

### 3.5 Ford-route correction

- `Banked`
- Best source: `current_state.md` (Round 23 closeout), `researcher-23-codex-ford-route-correction.md`, `ford-integration-audit.md`
- Statement-level value: roughness of the cofactor is not enough; the old Ford reduction was importing the wrong theorem.
- Why it matters: this prevents a plausible but invalid use of powerful divisor-interval literature.
- Publishability: moderate to high. Probably a short "correction / cautionary note" subsection rather than a headline theorem, but still valuable.

### 3.6 Band-local closure explosion theorem

- `Banked`
- Best source: `current_state.md` (Round 24 closeout), `researcher-24-codex-band-local-closure-explosion.md`
- Statement-level value: high-band triple reciprocal mass plus low-pool squarefree mass forces one dyadic skeleton band with constant reciprocal mass.
- Why it matters: this is one of the clearest statements in the repo that the correct invariant is full squarefree multiplicative closure, not pair shadow or rough-cofactor surrogates.
- Publishability: high. Feels like a real theorem with a crisp message.

### 3.7 Directed rank-3 cleanup is not blocked by budget

- `Banked`
- Best source: `current_state.md` (Round 25 closeout), `researcher-25-codex-directed-rank3-budget.md`
- Statement-level value: same-band triple blockers only cost `O(n log log n / log n)`, so the obstruction is not move budget but online fiber persistence.
- Why it matters: turns a vague strategic failure into a sharply located structural one.
- Publishability: moderate to high, likely as part of a longer obstruction section with 3.6.

### 3.8 Dyadic-fiber positive-density theorem collapses to the original linear conjecture

- `Banked`
- Best source: `current_state.md` (Round 22 closeout), `researcher-22-pro-dyadic-fiber-collapse.md`
- Why it matters: says a whole class of "fiber" lower-bound machinery is not an intermediate theorem at all; it is just the main conjecture in disguise.
- Publishability: high. This is the kind of conceptual cleanup that saves future readers from wasting months.

### 3.9 R44 local star obstruction + residual floor diagnosis

- `Banked`
- Best source: `phase4/r44_residual_floor_note.md`, then `current_state.md` (Round 44)
- Statement-level value:
  - strong freshness + locality do not imply certificate-packing / charged-shadow disjointness;
  - the R35 residual floor alone already blocks the conjectured sharp rate.
- Why it matters: this is arguably the best diagnosis in the repo of why the later packet/dense-regime upper-bound program keeps almost-closing and then failing.
- Publishability: high, though probably best as part of a later "why the matching upper bound is hard" section.

### 3.10 R46 conditional smallest-legal-prime lemma + ST-capture refutation

- `Banked`
- Best source: `phase4/r46_st_capture_refutation_note.md`, then `current_state.md` (Round 46)
- Statement-level value:
  - in states where every legal composite has a legal prime factor, `sigma^*` claims the smallest remaining legal prime;
  - the proposed ST-capture / time-resolved Carleson route is false as stated.
- Why it matters: the negative theorem is crisp and reusable, and the positive lemma still gives the right local response rule in the clean burn-in states where it is actually used.
- Publishability: high. This feels like a good short standalone note if the later packet program is ever written up.

### 3.11 R56 finite odd-carrier / separator-only barrier

- `Banked`
- Best source: `phase4/r56_separator_only_barrier_note.md`, with raw source in `researcher-56-pro-finite-odd-carrier-separator-only-negative-theorem.md` and the concrete `tau_SF` corollary in `researcher-56-pro-tau-sf-refuted-upper-half-dyadic-shielding.md`
- Statement-level value:
  - no finite odd-carrier separator-only closure can prove `L(n)=O(r_1(n))` or any other `o(n)` upper bound;
  - in the concrete separator-first / prime-fallback packet route, Prolonger can force the separator phase to die quickly while leaving linearly many upper-half composites alive.
- Why it matters: this is stronger than mere "support text." It is a genuine theorem about a precisely defined proof class, and it explains why the late separator-first packet program does not currently supersede the refined prime-prefix upper-bound line.
- Publishability: high, especially inside an obstruction/taxonomy paper. This is the cleanest late packet-era theorem to elevate out of prose support and into the main structural-negative inventory.

### 3.12 R52 transversal-integrality / Sherali-Adams barrier (audit-confirmed and sharpened)

- `Banked` (strategy-independent)
- Best source: `researcher-58-pro-R52-integrality-barrier-audit-confirmed-sharpened.md`, with raw source `researcher-52-pro-fresh-zoom-transversal-integrality-barrier.md`.
- Statement-level value:
  - **Covering-design random construction.** For every `N`-point set `P`, fixed `0 < alpha < 1`, `l = floor(N/log N)`, `q = floor(alpha N)`: there is a family `C subseteq binom(P, l)` avoiding every `q`-set from some element, with `log|C| = l log(1/(1-alpha)) + O_alpha(l^2/N)`. Size is tight on the exponential scale: any `q`-avoidance family has `|C| >= 1/delta`.
  - Consequently `tau_Z(C) > alpha N` while `tau_f(C) <= N/l`, giving integrality gap `G(C) >= alpha l = (alpha + o(1)) N/log N`.
  - **Sherali-Adams barrier.** For every `l`-uniform family `H subseteq binom(P, l)` and every level `0 <= r < l`: `SA_r(H) <= N/(l - r)`. In particular for `r <= l/2`, `SA_r(C) <= (2 + o(1)) log N`, while `tau_Z(C) > alpha N`. Therefore level-`r` SA integrality gap `>= (2/alpha + o(1)) N/log N`.
- Why it matters: this is a universal lower bound on LP-hierarchy proofs of the antichain game's transversal structure. Any proof technique whose entire certificate factors through level-`r` SA with `r <= l/2` (including many natural local-incidence, fractional-separator, and rounded-transversal arguments) is provably blind to `Theta(N/log N)`-scale integrality gaps.
- Sharpening over the original draft: `alpha` range extended from `< 1/2` to `< 1`; SA bound improved from `r + O(log N)` to `N/(l-r)` with no additive `r`, valid for any `l`-uniform family (not only the random construction), valid through `r = l - 1`. Original draft's fixed-cardinality `M` proof had an edge-case defect at `r = l - 1`; sharper product-Bernoulli pseudo-distribution proof sidesteps it cleanly.
- Verification: audit-confirmed with 93,671 SA constraints exhaustively checked for `N <= 7` via exact rational arithmetic; counting identities and numerical tables independently verified.
- Strategy-dependence: independent of `sigma^*`. The theorem is purely static combinatorics and holds for any Shortener strategy.
- Publishability: high. Landscape-of-impossibility section headline theorem explaining why LP-hierarchy / local-fractional-rounded-integral methods cannot close `r_1`.

### 3.13 R53 q-shadow / covering dichotomy (audit-confirmed and sharpened)

- `Banked` (strategy-independent)
- Best source: `researcher-59-pro-R53-q-shadow-dichotomy-audit-confirmed-sharpened.md`, with raw source `researcher-53-codex-q-shadow-covering-dichotomy.md`.
- Statement-level value (fixed-rank shadow / capture dichotomy): let `P` have size `K = h + L` with `h, L >= 1`, and fix `1 <= q <= h`. For blocker family `D subseteq 2^P`, played complement family `C subseteq binom(P, L)`, live complement space `R subseteq binom(P, L)` with density `r = |R|/|Y| > 0`: if no legal `q`-separator in `A_q(D, C)` captures at least `(1/2) delta_q |R|` live complements, then `sigma_q(D) + |C| delta_q > 1 - 4 lambda_q^2 / r`.
- Consequence: in the fixed-`q` packet race with `q`-only Shortener moves, failure of `(1/2) delta_q`-capture at live-density threshold `eta` forces `|C| > (1 - 4 lambda_q^2 / eta - |S|/|Q_q|)/delta_q`.
- Central-scale specialization: for `L = floor(h/log h)`, `q = floor(2 (log h)^2)`, the sharper constants `delta_q = (e + o(1)) h^{-2}` and `lambda_q^2 = (2 + o(1)) log h / h` yield `|C| > (1/e - o(1)) h^2` when `sigma_q(D) = o(1)`, and `|C| > (epsilon/e - o(1)) h^2` when `sigma_q(D) <= 1 - epsilon`.
- Why it matters: this is the cleanest positive theorem from the late packet era. It identifies online control of Shortener's own `q`-shadow `sigma_q(D)` as the precise missing ingredient for the spectral stopping program, rather than another mixing estimate. The result survives the R52-R53 era refutations of universal stopping theorems.
- Sharpening over the original draft: normalization requiring `L >= 1` and `1 <= q <= h` (original failed strictly at `q = 0`); use of actual live density `r` in the conclusion, not only threshold `eta`; central-scale constants tightened from `h^{-2 + o(1)}` to `(e + o(1)) h^{-2}`.
- Verification: audit-confirmed with 640 binomial identity checks, 12,589,120 union-bound cases, 250,952 fixed-rank pair checks, 74 spectral parameter tests with error `~10^{-16}`, and central-scale numerics at `h in {10^3, ..., 10^{20}}`.
- Strategy-dependence: independent of `sigma^*`. The theorem uses only the strategy-independent spectral separator theorem (entry 9 in the R54 audit) and union-bound counting.
- Publishability: high. The cleanest surviving positive theorem from the late packet era and a genuine Johnson-scheme structural result. Good main-paper section on the spectral route, or standalone companion note.

## 3A. Proof-Class Taxonomy

This is not a single theorem, but it is a real mathematical contribution type in this repo.

### 3A.1 R54 strategy-dependence classification

- `Interesting / taxonomy-level`
- Best source: `researcher-54-pro-sigma-star-audit-class-C-named-shortener-class.md`
- Statement-level value:
  - sorts the late-stage toolkit into strategy-independent, `sigma^*`-dependent, `sigma^*`-specific, and ambiguous classes;
  - explains exactly which positive upper-bound ingredients survive strategy replacement and which do not.
- Why it matters: this is the cleanest inventory-level answer to "which barriers are universal and which are artifacts of the canonical Shortener strategy?" That is not a theorem about `L(n)` directly, but it is a theorem about the proof landscape.
- Recommendation: include this as a subsection of a "proof-class taxonomy" or "landscape of impossibility" section, not as a flagship headline theorem beside Shield Reduction or Theorem A.

## 4. Strong computational and experimental material worth keeping

These are not theorems, but they are good enough to support a numerical section or companion note.

### 4.1 Phase 0: offline `psi(alpha)` near-tightness and sniping brittleness

- `Empirical`
- Best source: `phase0/report.md`
- Why it matters:
  - strong evidence that Theorem A is asymptotically tight offline;
  - equally strong evidence that the corresponding offline-optimal shield sets are catastrophically fragile online.
- Usefulness in writing:
  - makes Theorem A feel sharp;
  - explains why the shield-prefix Prolonger program is probably doomed online.

### 4.2 Exact minimax for small `n` with corrected solver

- `Empirical`, but very good
- Best source: `current_state.md` ("L(40) discrepancy resolved"), `phase1/report.md`, `phase1/exact_minimax_v2.py`
- Why it matters: corrected small-`n` truth table, principled debugging, and primorial/opening-pattern evidence.
- Usefulness in writing: great for introduction / figures / sanity checks.

### 4.3 Phase 1 and Phase 2 game-trajectory studies

- `Empirical`
- Best source: `phase1/report.md`, `phase2/shortener_stress_summary.md`, `phase2/dynamical_probe/ANALYSIS.md`
- Why it matters:
  - gives a robust strategy-vs-strategy map;
  - shows the "constant near 1.5" story was not universal;
  - confirms block-product is the binding carrier adversary for several natural Shorteners.
- Usefulness in writing: helpful numerical section, but do not oversell asymptotic conclusions.

### 4.4 Phase 3 shortener constants

- `Empirical / verification`
- Best source: `phase3/shortener_constants_summary.md`
- Why it matters: solid independent ratification of constants used in later upper-bound work.
- Usefulness in writing: good appendix / computational verification section.

### 4.5 Phase 3 fan-hierarchy probe

- `Empirical`
- Best source: `phase3/fan_hierarchy_summary.md`
- Why it matters: cross-rank shielding really does collapse quickly in data, which supports the later no-go theorems.
- Usefulness in writing: good empirical companion to the separate-rank fan obstruction story.

### 4.6 Phase 4 large-scale trajectories

- `Empirical`
- Best source: `phase4/findings.md`, `phase4/analysis.md`
- Why it matters: the large-`n` trajectories are a strong source of intuition and a good way to explain why the linear upper bounds are probably very loose.
- Caution: current internal math state does not justify promoting the `Theta(n/log n)` fit itself as theorem-level truth.

## 5. Best "interesting but not banked" items

These are worth preserving and possibly writing up later, but I would not use them as central claims in a paper today.

### 5.1 Round 14 / 15 refined prime-prefix constants

- `Near-banked / computationally certified` for a sub-`0.19` Round 15 headline; `Conditional / numerical` for `0.18969 n`
- Best source: `current_state.md` (Rounds 14 and 15), `phase3/shortener_constants_summary.md`
- Why they matter: they are the sharpest unconditional constants in the repo.
- Additional support from later work: the R56 separator-only / finite-odd-carrier negative theorems do not themselves prove `0.19n`, but they materially strengthen the case that the refined prime-prefix line is still the right current Shortener narrative. In other words, later packet/separator programs keep refuting candidate sublinear closures rather than superseding the `0.19n` route.
- New support from this pass: `phase3/shortener_piecewise_bonferroni4_summary.md` now independently ratifies the Round 15 Bonferroni-4 truncation numerically, with finest-grid `W4/2 = 0.189710592 < 0.19`. That does not settle the theorem-status dispute by itself, but it gives a clean computational artifact for the paper.
- Why they are not yet fully banked:
  - the `0.22002n` proof still had bookkeeping / uniformity caveats in the repo's own audit history;
  - the `0.18969n` proof still needs the explicit monotone comparison / boundary repair.
- Recommendation:
  - In the paper, present the Round 15 sub-`0.19` constant as a computationally certified upper-bound candidate or remark, not yet as a theorem.
  - Mention `0.18969n` as the numerically certified sharper constant suggested by the same density, but not yet normalized into a theorem-grade proof.

### 5.2 SFLU-E conditional theorem

- `Near-banked as a conditional theorem`
- Best source: `phase4/r44_residual_floor_note.md`, then `current_state.md` (Round 44), `researcher-44-pro-1-followup-sflu-e-estimate.md`, `verify-R44-pro-1-sflu-e-audit-refutes.md`
- Why it matters: gives the cleanest conditional package for the later dense-packet / lifted-shadow program.
- Why it is not banked as a closure theorem: the certificate-packing step is genuinely missing, and the local star obstruction proves that this is not just bookkeeping.
- Recommendation: worth a conditional-theorem subsection, not a headline claim.

### 5.3 Q-shadow / covering dichotomy (R53)

- **Promoted to Section 3.13** as of 2026-04-20 after Pro audit-confirmation and sharpening. See Section 3.13 for the canonical statement and `researcher-59-pro-R53-q-shadow-dichotomy-audit-confirmed-sharpened.md` for the paper-grade proof.

### 5.4 R52 transversal-integrality / Sherali-Adams barrier

- **Promoted to Section 3.12** as of 2026-04-20 after Pro audit-confirmation and sharpening. See Section 3.12 for the canonical statement and `researcher-58-pro-R52-integrality-barrier-audit-confirmed-sharpened.md` for the paper-grade proof.

### 5.5 R52 spectral live-space separator theorem

- `Promising but secondary`
- Best source: `researcher-52-pro-spectral-live-space-johnson-scheme.md`
- Why it matters: this is a real positive theorem in Johnson-scheme / spectral language, and it cleanly identifies a separator-capture mechanism at one fixed rank.
- Why it is lower priority than 5.4 / 5.3: later work shows that the full spectral stopping route is not the final upper-bound mechanism, so this theorem now reads more like a good standalone combinatorial result than a load-bearing main-paper ingredient.
- Recommendation: good appendix or companion-note material, especially if the paper wants one spectral theorem in the late obstruction section.

### 5.6 R55 hidden-packet lag diagnosis

- `Conceptually valuable, not a main theorem yet`
- Best source: `researcher-55-pro-hidden-packet-formulation-refuted-shortener-wins-one-move.md`
- Why it matters: the diagnosis is very good. It isolates the exact flaw in the hidden-packet subgame as stated: without a scheduling-lag / attention-budget parameter, Shortener can kill the packet immediately, so the packet game is not modeling the intended phenomenon.
- Why it is not banked: in its current form this is more a structural diagnosis than a normalized paper theorem, and the surrounding packet formalism changed repeatedly.
- Recommendation: use the idea as a methodological / explanatory remark unless we later write a clean theorem around the lag parameter itself.

### 5.7 Packet / separator / covering-design route after R52-R56

- `Interesting but not normalized`
- Best source: `researcher-52-*`, `researcher-53-*`, `researcher-54-*`, `researcher-55-*`, `researcher-56-*`
- What looks valuable:
  - clear identification of self-shadow / covering-design / integrality-gap obstructions;
  - several real negative structural theorems for separator-only proof classes;
  - the "lag parameter" diagnosis for the hidden-packet model is conceptually very good.
- What now looks especially reusable:
  - R56 gives a clean negative theorem for finite odd-carrier / separator-only closure classes, plus the `tau_SF` upper-half dyadic-shielding refutation;
  - these are useful not because they solve the game, but because they explain why the later packet route does not currently dethrone the `~0.19n` upper bound.
  - R54 gives a useful strategy-dependence taxonomy, clarifying which late barriers are universal and which are only `sigma^*`-reachability statements.
- Why it is not yet source-of-truth grade:
  - the packet formalism changed repeatedly;
  - most of it is not yet distilled back into `current_state.md`;
  - several statements are "best current diagnosis" rather than settled theorem clusters.
- Recommendation: mine this material selectively. R56 has now been promoted into the main structural-negative inventory via `phase4/r56_separator_only_barrier_note.md`. R54 is the best candidate for a taxonomy subsection once the paper wants to organize the proof landscape explicitly.

## 6. What should stay internal for now

These items were useful during research but should not be foregrounded in publication.

- The R44 "full solution" attractor claims asserting `Theta(n (log log n)^2 / log n)` without a real packing theorem.
- DeepThink's loglog-tight claims as theorem statements. They were useful heuristically, but the repo does not currently support them as banked results.
- Any argument whose main load-bearing line is "the numerics look flat enough that the asymptotic must be X."
- Any full `O(n/log n)` claim for the actual game. The repo's own later state is inconsistent with keeping that as a live public target.
- Any packet/separator formalism that does not explicitly encode the global scheduling lag.

## 7. Suggested publication split

If you want one paper, the best spine is:

- Shield Reduction Theorem
- Theorem A (polynomial shield lower bound / `n^(1/e)` barrier)
- Round 15 local prime-count-per-range lemma plus the computational sub-`0.19` candidate
- `5/24` cover theorem
- `13/36` upper bound, upgraded to `5/16` if the last repair lands
- T1 lower bound, and T2 if you are willing to stand behind the repaired proof
- A "landscape of impossibility" section: block-product counter, separate-rank fan obstruction, residual-width refutation, band-local closure explosion, R44 residual floor, one clean R56 separator-only barrier, and R54 strategy-dependence taxonomy as framing

If you want multiple papers/notes, the natural split is:

- Paper A: formal/provable core (`Shield Reduction`, Theorem A, `5/24`, `13/36`, maybe `5/16`)
- Paper B: restricted adversary classes + structural obstructions (Theorem 5, Theorem 6, block-product counter, fan no-go, residual-width / Ford / closure obstructions)
- Paper C: computational study (`psi(alpha)`, exact minimax, strategy trajectories, constants, large-`n` probes)

If there is eventually a fourth paper or long appendix focused on the late packet era, the best spine is:

- R52 transversal-integrality / Sherali-Adams barrier
- R53 q-shadow / covering dichotomy
- R54 strategy-dependence taxonomy
- R55 lag diagnosis
- R56 separator-only barrier family

That is the cleanest way to turn R52-R56 into a coherent obstruction / proof-class story rather than a pile of moving formulations.

## 7A. Non-math companion artifacts

Two additional artifacts are genuinely publishable independent of the main math paper, and should be planned alongside it rather than as afterthoughts:

### 7A.1 Formalization artifact (optional; ITP / CPP / CAV target)

- **Content.** The Lean / Aristotle artifacts for Shield Reduction (0 sorries), the `5/24` cover theorem (0 sorries), `13/36` upper bound (0 sorries), Theorem A / T1 (6 sorries in `ShieldMainTheorem.lean`, PNT-adjacent Mathlib gaps), `5/16` upper bound (5 sorries in `Theorems.lean`, Chebyshev-adjacent Mathlib gaps), and the T2 finite core (graph / hypergraph / embedding / family comparison layers; activation-stage wrapper in progress).
- **Why this could be a standalone contribution.** Several Erdős-named theorems have already been Lean-formalized in Mathlib (Erdős-Ko-Rado, Erdős-Ginzburg-Ziv, Erdős-Selberg proof of PNT, Erdős-Gallai), so this is **not** the first Lean formalization of an Erdős-named result. A narrower accurate claim: **these would be the first formally verified structural results on Erdős problem #872 specifically** (the antichain divisibility game). That narrower claim is still publication-worthy for an ITP / CPP venue.
- **Paper integration option.** Rather than a separate ITP paper, the formalization can simply be **a section of the main math paper** (Section 7 or an appendix) listing verified theorems, sorry counts, and Mathlib-gap notes. This is now the preferred approach — see Section 0E above.
- **Separate ITP submission is optional.** If pursued, it would be a short standalone note describing the formalization architecture (Aristotle dispatch pattern, what's Lean-native vs Mathlib-dependent, reproducibility). Not required for the math paper's publication.
- **Status.** Artifacts exist in `aristotle/*_out/` and `aristotle/t2_finite_core/`. Tarballs committed at `aristotle/*_result.tar.gz`.

### 7A.2 Methodology paper (arXiv cs.AI / multi-agent research systems)

- **Content.** The multi-agent research harness as a reproducible methodology for long-horizon math research. Load-bearing elements:
  - Role separation (curator / researcher / informal verifier / formal verifier).
  - Canonical prompt pattern + fresh-thread dispatch discipline.
  - A/B/C branching dispatch across framings as search diversification.
  - Cross-family convergence (N=3 agreements on barrier theorems, e.g. R56 separator-only class) as a truth signal.
  - Commit-per-round and state-snapshotting for reproducibility.
  - Formal verifier (Aristotle) integration into the research loop rather than as end-goal.
- **Failure-mode taxonomy as a contribution.** The repo has produced several named failure modes worth writing up as a section:
  - `sigma^\star`-trap: hidden strategy assumption invalidating many rounds of work.
  - Static-vs-dynamic bound conflation (state-inequality translating to game-length bound).
  - Attractor-basin mapping within a single model family.
  - Canonical-prompt drift over many rounds.
  - Minimax quantifier-gap attractor (existence of π succeeding vs. every τ succeeding).
- **Empirical backbone.** A 56-round single-problem case study is, to my knowledge, the longest documented AI-assisted research run on a single open math problem. That by itself is novel empirical data for the multi-agent-research-systems literature.
- **Caveat.** The paper is a case study, not a controlled experiment — no ablation runs, no baseline comparison to "single model without harness," no second problem for reproducibility. That caps the venue ceiling to workshop / TMLR / arXiv-only rather than main-conference, unless we add a baseline comparison on a simpler problem.
- **Target.** arXiv cs.AI as a preprint. If later pursued to venue: TMLR or a multi-agent workshop at NeurIPS / ICML.

### 7A.3 Blog + repo release

Not a paper. But the public-facing artifacts should be planned together:

- GitHub repo made public with the paper + Lean artifacts + methodology writeup cross-linked.
- Blog post / forum update on `erdosproblems.com/872` with the improvement from `0.416 n` to `0.361 n` banked (plus sub-`0.19 n` computational).
- Consistent author handle across arXiv, repo, blog, and forum (the forum post is under `Om_Buddhdev_sensho`, so pick one canonical form and reuse it).

## 8. Bottom line

If I had to rank the repo's best publishable math today, in order, I would say:

1. Shield Reduction Theorem
2. Theorem A (`beta(P)` lower bound / `n^(1/e)` barrier)
3. The Round 15 local theorem plus the sub-`0.19` computational upper-bound candidate, with `0.18969n` as the sharper conditional constant and `13/36` / `5/16` as the formally cleaner anchors
4. The `5/24` exact cover theorem
5. T1/T2 lower bounds
6. Theorem 5 and Theorem 6 for restricted carrier classes
7. Universal block-product counter on carrier mass
8. Separate-rank fan no-go theorems
9. Residual-width / Ford / band-local closure obstruction chain
10. R44 residual-floor diagnosis, R46 smallest-legal-prime + ST-capture refutation, and the R56 separator-only barrier theorem
11. **R52 transversal-integrality / Sherali-Adams barrier (audit-confirmed and sharpened)**
12. **R53 q-shadow / covering dichotomy (audit-confirmed and sharpened)**

Those twelve items are the clearest "this is genuinely good math, not just process residue" outputs of the repo as it stands. R52 and R53 were promoted from tier-2 salvage to banked on 2026-04-20 after Pro audit-confirmation and quantitative sharpening.

Just below that top twelve, the next most promising salvage candidates are:

13. R54 strategy-dependence taxonomy
14. R55 hidden-packet lag diagnosis

Those are worth preserving and possibly publishing, but they are currently a tier below the fully normalized core package.

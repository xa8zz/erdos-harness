# Paper Template — Math Paper (Paper A)

**Status:** Structural template only. Does not include content. Use this as the skeleton for the actual LaTeX / arXiv draft.

**Working title (placeholder):** "Improved bounds and proof-class barriers for the antichain divisibility saturation game."

**Target venue:** arXiv `math.CO` + submission to Combinatorica / J. Combinatorial Theory / Discrete Analysis.

**Companion paper:** methodology paper (Paper B) at arXiv `cs.AI`. Cross-reference but do not duplicate.

---

## Front matter

- **Title.**
- **Author(s).**
- **Affiliation.**
- **Keywords:** saturation games, antichain divisibility, Erdős problem 872, Sherali-Adams barrier, formal verification, Lean 4.
- **MSC classification.** (Likely 05C57 combinatorial games, 11N25 distribution of prime factors, 05D05 extremal set theory.)

## Abstract

One paragraph. Roughly:
> "We study the two-player antichain divisibility saturation game of Erdős (problem 872). We prove $L(n) \le (\mathcal{W}_4/2 + o(1))n$ with $\mathcal{W}_4/2 \approx 0.18971$, improving the current public record $\approx 0.416n$. We complement this with a matching lower bound $L(n) \ge c_\delta n(\log\log n)^2/\log n$ and a structured taxonomy of proof-class barriers — including transversal-integrality / Sherali-Adams barriers, separator-only barriers, and a classification of results by dependence on specific Shortener strategies — that explain why closing the remaining $(\log\log n)^2/\log n$ gap is structurally hard. Several core theorems are formally verified in Lean 4."

## 1. Introduction

### 1.1 The game

Two-line definition of the antichain divisibility game. State explicitly: **we assume Prolonger moves first** (Erdős's original statement is ambiguous about first player; both orderings have received public attention).

### 1.2 History and prior work

- `[Er92c]` original.
- Saturation-game analog for triangle-free graphs: `[FuSe91]` ($\gg n \log n$), `[BPW16]` ($<0.215n^2$).
- Recent public discourse on Erdős 872:
  - Price + GPT-5.2 Pro (Feb 2026): first linear bound $L(n) \le (23/48 + o(1))n$; also introduced the Prolonger / Shortener naming convention.
  - Forum refinements by Adenwalla, StijnC, natso26, Xiao_Hu, Desmond Weisenberg: $L(n) \le (419/1008 + o(1))n \le 0.416n$.
- Cameron-Erdős `[CaEr90]` primitive sets (ambient structure).
- Lichtman 2023, Kucheriaviy 2024, Martin-Pomerance 2010 (divisibility-antichain / multiplicative-structure literature used in supporting estimates).

### 1.3 Main results

Bullet list. Each item one line. Pointer to the theorem number and section.

1. **Shield Reduction Theorem** (Section 2). Formally verified (Lean).
2. **Theorem A / T1 lower bound:** $L(n) \ge (1/8 - o(1)) n \log\log n/\log n$; $\beta(P) \ge ((1/2)\log(1/\alpha) + o(1))n$ for $|P| \le n^\alpha$ (Section 3). Partial Lean.
3. **T2 lower bound:** $L(n) \ge c_\delta n(\log\log n)^2/\log n$, $\delta < 1/4$ (Section 3). Rigorous prose; partial Lean.
4. **$5n/24$ exact cover:** $\tau(n) = 5n/24 + O(1)$ (Section 4). Formally verified.
5. **$13/36$ upper bound:** $L(n) \le (13/36 + o(1))n$ (Section 5.1). Formally verified.
6. **$5/16$ upper bound** (Section 5.2).
7. **Main upper-bound theorem:** $L(n) \le (\mathcal{W}_4/2 + o(1))n$ with $\mathcal{W}_4/2 \approx 0.18971$ (Section 6). **Headline result.**
8. **Restricted-class results:** $O(n/\log n)$ against disjoint small-prime carriers (Theorem 5) and rank-$\le 3$ squarefree carriers (Theorem 6) (Section 7).
9. **Proof-class barrier taxonomy** (Section 8):
   - Transversal-integrality / Sherali-Adams barrier (Section 8.1).
   - Fixed-rank $q$-shadow / covering dichotomy (Section 8.2).
   - Separator-only barrier (Section 8.3).
   - Strategy-dependence classification (Section 8.4).
10. **Structural negatives:** block-product carrier-mass counter, separate-rank fan no-go, residual-width refutation, Ford-route correction, band-local closure explosion, dyadic-fiber collapse (Section 9).
11. **Formal verification summary** (Section 10).

### 1.4 Paper organization

One paragraph describing section-by-section flow.

## 2. The Shield Reduction Theorem

**Status:** banked, strategy-independent, Lean-verified (0 sorries).

### 2.1 Statement

`|A| \ge |U| - \beta(P)` for terminal antichain $A$, $P \subseteq U = (n/2, n]$.

### 2.2 Proof

Three-line argument: $B := A \cap L$ is antichain; by maximality, $A \cap U = U \setminus \bigcup_{x \in B} M(x)$; union bound.

### 2.3 Formal verification note

Point to `aristotle/shield_reduction_out/RequestProject/ShieldReduction.lean`. 0 sorries.

## 3. Lower Bounds

### 3.1 Theorem A (T1) — the polynomial shield lower bound

**Status:** banked, strategy-independent, Lean-verified modulo PNT-adjacent Mathlib gaps.

Statement, proof outline. Include the $n^{1/e}$ barrier consequence: the short-shield-prefix route cannot prove linearity unless $|P| \ge n^{1/e}$.

### 3.2 T2 — the Maker-first hypergraph capture lower bound

**Status:** banked, strategy-independent, rigorous prose + partial Lean.

Statement, proof sketch. Canonical references: `phase4/t2_core_paper_note.md` and `researcher-21-codex-T2-maker-first-repair.md`.

### 3.3 Consequences — the sharp rate gap

Remark that T1 and T2 both sit at the $n(\log\log n)^2/\log n$ scale; the upper bound sits at $\Theta(n)$ even at headline level. Sharp-rate open question stated explicitly.

## 4. The $5n/24$ Exact Cover

**Status:** banked, strategy-independent, Lean-verified.

Explicit cover $H_n$, matching packing $P_n$, $\tau(n) = 5n/24 + O(1)$. Used downstream in the Shortener constructions.

## 5. Intermediate Upper Bounds

### 5.1 The $13/36$ upper bound

**Status:** banked, strategy-specific (smallest-legal-odd-prime with truncation), Lean-verified.

Statement, proof outline (truncation at $s_t \ge 1/3$, second-order Bonferroni, monotonicity of $f(s) = 1 - s + s^2/2$ on $[0, 2/3]$).

### 5.2 The $5/16$ upper bound

**Status:** strategy-specific (longer prefix + sharper Bonferroni), rigorous prose, Lean modulo Chebyshev-adjacent sorries.

The elegant intermediate step: longer prefix gives $\sum 1/q_j \ge 1/2$, same sieve gives $5/16$. Remark: $5/16$ is the tight limit of the odd-prime-prefix Shortener family (per block-product counter; see Section 9).

## 6. Main Upper Bound: $L(n) \le (\mathcal{W}_4/2 + o(1))n \approx 0.18971n$

**Status:** headline result, strategy-specific (Shortener $\sigma_{15}$ = smallest legal odd prime on first $K$ turns), rigorous prose.

### 6.1 The Shortener strategy $\sigma_{15}$

Precise definition of $\sigma_{15}$: smallest legal odd prime on each of the first $K = \lfloor (1-\varepsilon) n / (2\log n) \rfloor$ turns. Note explicitly: $\sigma_{15}$ is NOT the max-unresolved-harmonic-degree strategy $\sigma^*$ that appears elsewhere in the program; this distinction matters for the barrier section.

### 6.2 The local prime-count-per-range lemma

Statement and proof. Uses PNT + the $h$-prime-factor counting. Rigorous, key structural input.

### 6.3 The piecewise density

Derive $\rho(u) = 1/((\lfloor 1/u\rfloor + 1) u)$ from the local lemma.

### 6.4 The alternating Bonferroni convolution

Define $J_r$, $\mathcal{W}_4 = 1 - J_1 + J_2 - J_3 + J_4$, and $\mathcal{W} = \sum_{r \ge 0}(-1)^r J_r$. Numerical values: $J_1 \approx 0.7885$, $J_2 \approx 0.1868$, $J_3 \approx 0.02009$, $J_4 \approx 0.001223$, $\mathcal{W}_4/2 \approx 0.189710592 < 0.19$.

### 6.5 The Round 14 factorial-moment comparison theorem (cited)

State as a cited lemma. Proof reference to whichever existing infrastructure contains it (13/36 Aristotle artifact or stand-alone earlier work). If missing, include short stand-alone proof here.

### 6.6 Proof of the main upper bound

Pro's Steps 3–5: monotone envelope construction, inversion to $b_j$ with $q_j \le b_j$, flat-block-mass bound $O_H(1/\log n)$, weak convergence $\nu_{H,n} \to \rho \mathbf{1}_{G_H}(u)du$ via integration by parts, factorial-moment convergence $T_r^{(H)}(n) \to J_r^{(H)}$, excision removal $H \to \infty$. Apply Round 14 comparison theorem. Conclude $L(n) \le (\mathcal{W}_4/2 + o(1))n$.

### 6.7 Sandbox verification

Numerical certificate via FFT + Richardson extrapolation. Cross-reference `phase3/shortener_piecewise_bonferroni4_summary.md`.

### 6.8 Remarks

- Comparison with public record $0.416n$: factor $\sim 2.2 \times$ improvement.
- The full series $\mathcal{W}/2 \approx 0.18969$ is a sharper numerical target; Bonferroni-4 suffices for the theorem statement below $0.19$.
- $\sigma_{15}$ is strategy-specific but NOT $\sigma^*$; this matters for the proof-class barrier narrative of Section 8.

## 7. Restricted-Class Results

### 7.1 Theorem 5 — $O(n/\log n)$ against disjoint small-prime carriers

**Status:** banked, strategy-specific four-phase Shortener strategy.

Statement, proof sketch. Reference `phase4/theorem5_disjoint_carriers_note.md`.

### 7.2 Theorem 6 — $O(n/\log n)$ against squarefree rank-$\le 3$ carriers

**Status:** banked, extends Theorem 5. Reference `phase4/theorem6_rank3_squarefree_note.md`.

### 7.3 Remark on the restricted-class program

What does "restricted-class" rule out, and what does it leave open? The fact that $O(n/\log n)$ holds against these classes informs the sharp-rate intuition.

## 8. Proof-Class Barrier Taxonomy

This section catalogs rigorous results on what proof techniques **cannot** close the sharp-rate gap. Each subsection states a precisely-named technique class and proves that class is insufficient.

### 8.1 Transversal-integrality / Sherali-Adams barrier

**Status:** banked, strategy-independent.

Random covering-design construction: $\tau_{\mathbb{Z}}(\mathcal{C}) > \alpha N$ while $\tau_f(\mathcal{C}) \le N/\ell$, so integrality gap $\Omega(N/\log N)$ at $\alpha \in (0, 1)$.

Sherali-Adams barrier: $\mathrm{SA}_r(\mathcal{C}) \le N/(\ell-r)$ for every $\ell$-uniform family and every level $r < \ell$. In particular at $r \le \ell/2$: gap $\ge (2/\alpha + o(1)) N/\log N$.

Canonical source: Pro audit-confirmed statement and proof at `researcher-58-pro-R52-integrality-barrier-audit-confirmed-sharpened.md`.

### 8.2 Fixed-rank $q$-shadow / covering dichotomy

**Status:** banked, strategy-independent.

Statement: at fixed packet with live density $r$, either a legal $q$-separator in $A_q$ captures $\ge (1/2)\delta_q |R|$ live complements, or $\sigma_q(\mathcal{D}) + |\mathcal{C}|\delta_q > 1 - 4\lambda_q^2/r$. Central-scale constants $\delta_q = (e + o(1))h^{-2}$, $\lambda_q^2 = (2+o(1))\log h/h$; consequence $|\mathcal{C}| > (1/e - o(1))h^2$ when $\sigma_q = o(1)$.

Canonical source: Pro audit-confirmed statement at `researcher-59-pro-R53-q-shadow-dichotomy-audit-confirmed-sharpened.md`.

### 8.3 Separator-only barrier

**Status:** banked, strategy-specific class-level statement.

No "finite odd-carrier separator-only closure" can prove any $o(n)$ upper bound. Explicit Prolonger attack: upper-half dyadic shield $2^a s \in (n/2, n]$ preempts every legal separator at $O(|S|)$ total cost.

Corollary: the specific strategy $\tau_{\mathrm{SF}}$ (separator-first + smallest-legal-prime fallback + pass) forces $L_{\tau_{\mathrm{SF}}}(n) \ge cn = \omega(r_1)$.

Consequence: any sublinear upper-bound proof must include a genuine composite fallback.

Canonical sources: `phase4/r56_separator_only_barrier_note.md`, `researcher-56-pro-tau-sf-refuted-upper-half-dyadic-shielding.md`.

### 8.4 Strategy-dependence classification (meta-theorem)

**Status:** meta-result.

State the R54 classification: every rigorous positive theorem and refutation in the program partitions into `strategy-independent`, `sigma^*-dependent`, and `sigma^*-specific`. Name the specific items: R35 state inequality, online harmonic domination, and the $\sigma^*$ smallest-legal-prime lemma are $\sigma^*$-dependent and hence not useful for any closure under an alternative Shortener strategy.

Cite the R53 cooperative-embedding theorem showing $\sigma^*$ is suboptimal (Prolonger forces the sparse-covering-design state at cost $n^{o(1)} = o(r_1)$ against $\sigma^*$).

Consequence: load-bearing upper-bound tools that are $\sigma^*$-dependent (R35, online harmonic domination, dense-packet projection through them) do not contribute to unconditional upper-bound proofs.

Canonical source: `researcher-54-pro-sigma-star-audit-class-C-named-shortener-class.md`.

### 8.5 Conditional $\sigma^*$-dependent results (subsection; clearly labeled)

State the relevant conditional results for completeness, clearly labeled as $\sigma^*$-dependent and hence conditional:

- R35 state inequality.
- Online harmonic domination.
- $\sigma^*$ smallest-legal-prime lemma.
- R46 ST-capture refutation ($\sigma^*$-specific).
- R44 residual floor (as diagnosed within the $\sigma^*$ framework).

Reviewer-facing note: these are not used in the headline upper bound (Section 6) which is $\sigma_{15}$-specific, not $\sigma^*$-specific.

## 9. Structural Negatives (abbreviated)

One theorem per subsection, proof sketch only. All strategy-independent except where noted.

### 9.1 Universal block-product carrier-mass counter

$\sum_{p \in B(P)} 1/p \ge (1/2)\log\log n + O(1)$ forced. Kills bounded-carrier-mass routes.

### 9.2 Separate-rank fan no-go

Single-rank $\max_h W_h(n) \sim n/\sqrt{\log\log n}$; summed separate-rank fan contributions $\le n/(\log n)^{1-o(1)}$. Closes the most natural linear-lower-bound architecture.

### 9.3 Multi-rank same-$b$ coupling obstruction (Sperner / LCM)

Statement + proof sketch.

### 9.4 Residual-width lemma refutation

$\lambda_n(c)$ counterexample.

### 9.5 Ford-route correction

Prevents invalid use of divisor-interval literature.

### 9.6 Band-local closure explosion theorem

Statement + proof sketch.

### 9.7 Directed rank-3 cleanup is not blocked by budget

Same-band triple blockers cost $O(n \log\log n / \log n)$; obstruction is online fiber persistence.

### 9.8 Dyadic-fiber positive-density collapse

The fiber route is equivalent to the main conjecture.

## 10. Formal Verification Summary

One paragraph:

> "Shield Reduction (Theorem X.1), the $5n/24$ cover (Theorem X.4), and the $13/36$ upper bound (Theorem X.5.1) are formally verified in Lean 4 via Aristotle with no remaining sorries. Theorem A (Theorem X.3.1) and the $5/16$ upper bound (Theorem X.5.2) have Lean artifacts with classical-number-theory sorries (PNT- and Chebyshev-$\vartheta$-adjacent), enumerated in Appendix A; these are Mathlib-dependency gaps, not logical holes. T2 has a Lean-verified finite core (`aristotle/t2_finite_core/`) with the activation-stage wrapper in progress. The remaining results — the main upper bound $L(n) \le (\mathcal{W}_4/2 + o(1))n$ (Theorem X.6), the proof-class barriers (Section 8), and the restricted-class results (Section 7) — are proved rigorously in prose with multi-verifier audit and sandbox computation where applicable."

Table: theorem | file | sorries | Mathlib-gap notes.

## 11. Conclusion

- Sharp-rate gap: $n(\log\log n)^2/\log n \le L(n) \le 0.18971n$, so $\Theta(r_1)$ vs $\Theta(r_2)$ remains open.
- Open questions:
  - Close the sharp-rate gap (upper bound $o(n)$ and lower bound $\omega(r_1)$).
  - Extend the barrier taxonomy.
  - First-player ambiguity: what if Shortener moves first? (Different answer possible.)
- Methodology note: single paragraph mentioning this paper is accompanied by a methodology paper (Paper B) describing the multi-agent research harness used in producing these results. No content duplication; cross-reference.

## Appendix A — Formal-verification details

Per-theorem Lean artifact reference, sorry count, explicit enumeration of each sorry with Mathlib-dependency category.

## Appendix B — Numerical computations

Reference to `phase3/` scripts, `phase4/` sandbox verifications, FFT / Richardson parameters for the $\mathcal{W}_4/2$ computation, exact minimax tables for small $n$.

## Appendix C — Glossary / notation

$n, L, U, A, P, B, \beta, \pi, \vartheta, \rho, J_r, \mathcal{W}, \mathcal{W}_4, \sigma^*, \sigma_{15}, \tau_{\mathrm{SF}}, h, \ell, q, \delta_q, \lambda_q$, etc.

## Acknowledgments

- Forum contributors (Price, Adenwalla, StijnC, natso26, Xiao_Hu, Desmond Weisenberg) for prior bounds and the Prolonger/Shortener naming.
- Thomas Bloom for maintaining `erdosproblems.com`.
- AI research tools: single-paragraph acknowledgment at the end. Cross-reference Paper B for methodology details.

## References

- `[Er92c]`, `[FuSe91]`, `[BPW16]`, `[CaEr90]`.
- Lichtman 2023, Kucheriaviy 2024, Martin-Pomerance 2010.
- Price + GPT-5.2 Pro forum post (Feb 2026).
- Forum commenters (attribution).
- Mathlib / Aristotle.
- Prior work we cite for standard tools: PNT (Erdős-Selberg Mathlib formalization), Sherali-Adams hierarchy, Johnson-scheme spectral bounds, expander-mixing inequality.

---

## Drafting notes (non-paper, internal)

- Target length: 40–60 pages including appendices.
- Figures: maybe 2–3 (upper/lower-bound graph over time, numerical $L(n)\log n/n$ trajectory, covering-design illustration).
- Tables: formalization summary, numerical values table, Shortener-strategy-family comparison.
- LaTeX package: standard `amsart` + `tikz` + `hyperref` + `cleveref`. Lean code blocks via `listings`.
- Before submission:
  - Informal audit of R57 (0.19n) by Gemini + GPT-thinking.
  - Verify Round 14 factorial-moment comparison theorem is rigorous.
  - Close 6 Theorem A sorries + 5 of the $5/16$ sorries if tractable in one Codex dispatch each; abandon otherwise.
  - Pre-email Thomas Bloom before arXiv posting (he maintains the Erdős problems site and is active on the thread).
  - Decide author handle (consistent across arXiv, GitHub, blog, forum).
  - Add a "Prior Work" section with the full citation list (Section 1.2 above is a stub; expand).

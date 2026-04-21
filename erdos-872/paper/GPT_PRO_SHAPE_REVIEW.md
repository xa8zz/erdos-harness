# Shape verdict

**Verdict: endorse `PAPER_SHAPE_PROPOSAL.md` with mandatory amendments.** The proposed spine is the right one: a self-contained arXiv paper centered on the sub-`0.19n` Shortener upper bound, with Shield Reduction, lower bounds, the exact `5/24` cover, intermediate upper bounds, and a compact obstruction section. The proposal's governing principle is exactly right: the PDF must contain the proofs, while the repository is only an artifact and reproducibility record (`paper/PAPER_SHAPE_PROPOSAL.md:L12-L16`).

The proposal is **not** safe as-is. Three amendments are required before I would approve the manuscript for arXiv.

1. **Remove the current shield-derived T1 corollary.** No complete calibrated shield construction is present in the dump. The current draft's T1 proof uses a lower bound on `beta(P)` and then asserts a conversion through Shield Reduction (`paper/sections/03-lower-bounds.tex:L90-L112`), but Shield Reduction gives useful game-length lower bounds only from an upper bound on `beta(P)` (`paper/sections/02-shield-reduction.tex:L97-L110`; `current_state.md:L255-L266`). If T1 is included at all, it should be included as an independent upper-half fan lower bound, not as a corollary of Theorem A.

2. **Use Version B-lite for the sub-`0.19n` upper bound, but only after Section 7 is rewritten at theorem-proof level.** The local density law is not merely numerical: the current draft contains a proof of the local density proposition (`paper/sections/06-main-upper-bound.tex:L50-L152`), and the later analytic repair chain gives theorem-level prose for the Bonferroni comparison and prime-rounding bridge (`r57_bonferroni4_audit_and_repair.md:L91-L119`, `r57_bonferroni4_audit_and_repair.md:L421-L437`, `researcher-60-pro-R57-repair-PROVED-theorems-2-1-and-4-1.md:L1352-L1461`). However, the full theorem is **not** end-to-end Lean-formalized: the Lean artifact proves the conditional endgame from moment closeness, while moment convergence remains analytic prose (`lean/README.md:L33-L46`; `publication_source_of_truth.md:L35-L39`). State the theorem with `W_4/2 = 0.1897112 < 0.19`; mention the sharper `0.18969` only as numerical evidence, not as a theorem (`publication_source_of_truth.md:L35-L39`).

3. **Keep T2 only if Appendix A contains a full proof.** The repo has enough material to assemble an appendix-length proof, but the current paper still compresses the residual comparison and activation wrapper too aggressively (`paper/REPO_VS_PAPER_MATRIX.md:L91-L93`). The Lean work supports the finite graph/hypergraph/embedding core, not the complete asymptotic theorem (`lean/README.md:L22-L31`). The appendix must explicitly write the abstract potential game, the residual divisibility embedding, the activation-token inequality, the error bound, the initial mass lower bound, and the final conversion to game length.

With these amendments, the strongest defensible paper is **Version B-lite**: a theorem-level sub-`0.19n` upper bound, a theorem-level T2 lower bound with appendix proof, no shield-derived T1 theorem, exact formalization claims, and a short obstruction section limited to the three best-defined proof-class barriers.

# Per-theorem dispositions

| Item | Recommendation |
|---|---|
| Shield Reduction | **Keep as a main-body theorem.** It is clean, self-contained, and zero-sorry formalized; the theorem statement and proof direction are already paper-grade (`paper/sections/02-shield-reduction.tex:L48-L95`; `lean/README.md:L9-L12`). |
| Theorem A (`beta(P)` lower bound) | **Keep as a main-body theorem, but as a shield-method obstruction, not as a game lower bound.** The static theorem is supported; its consequence is that short shield prefixes cannot force linear lower bounds through Shield Reduction (`current_state.md:L243-L266`; `paper/REPO_VS_PAPER_MATRIX.md:L89-L90`). |
| T1 (`L(n) >= Omega(n log log n / log n)`) | **Cut as currently proved; optionally replace by an independent appendix proposition.** The Shield Reduction/Theorem A route is directionally wrong. The separate upper-half fan proof appears rigorous and gives the stated order with constant `1/8`, but it is a different proof and T2 dominates it (`researcher-13-pro2-odd-fan-strengthened.md:L21-L47`, `researcher-13-pro2-odd-fan-strengthened.md:L243-L304`). |
| T2 (`L(n) >= Omega(n (log log n)^2 / log n)`) | **Keep as a main lower-bound theorem, with full Appendix A proof.** The repo contains the finite potential core, arithmetic embedding, and activation audit, but the current draft must stop presenting the proof as an imported sketch (`worker_t2_finite_core_memo.md:L5-L59`, `worker_t2_finite_core_memo.md:L108-L159`; `researcher-22-codex-T2-activation-audit.md:L20-L36`). |
| Exact `5/24` cover | **Keep as a main-body theorem.** It is a clean auxiliary extremal result with zero-sorry structural formalization (`aristotle/tau_5_24.tex:L1-L110`; `lean/README.md:L13-L13`). |
| `13/36` upper bound | **Keep as a compact intermediate theorem.** It is banked and zero-sorry formalized, but it should not distract from the main sub-`0.19n` theorem (`paper/REPO_VS_PAPER_MATRIX.md:L95-L95`; `lean/README.md:L14-L14`). |
| `5/16` upper bound | **Keep as a proposition or short intermediate theorem.** It is a useful bridge and dominates `13/36`, but its Lean artifact still has Chebyshev-adjacent sorries and the result is dominated by the sub-`0.19n` theorem (`paper/REPO_VS_PAPER_MATRIX.md:L96-L96`; `lean/README.md:L15-L15`). |
| `0.19n` upper bound | **Keep as the headline main theorem, not conditional, if Section 7 is rewritten self-contained.** The finite Bonferroni-4 theorem is supported by theorem-level prose and a conditional Lean endgame reduction; the sharper `0.18969` limit constant should remain numerical only (`publication_source_of_truth.md:L31-L39`; `paper/sections/06-main-upper-bound.tex:L8-L31`). |
| Theorems 5 and 6 restricted carrier classes | **Move to Appendix A and demote to propositions.** They are useful but not part of the paper's main novelty spine, and the matrix already flags that the current paper sketches need more legality/range detail (`paper/PAPER_SHAPE_PROPOSAL.md:L70-L71`; `paper/REPO_VS_PAPER_MATRIX.md:L103-L108`). |
| R52 Sherali--Adams barrier | **Keep in a compressed obstruction section, with definitions.** Treat as a rigorous static meta-theorem after the sharpened audit, not as a heuristic (`researcher-58-pro-R52-integrality-barrier-audit-confirmed-sharpened.md:L13-L19`; `paper/sections/08-proof-class-barriers.tex:L12-L72`). |
| R53 `q`-shadow dichotomy | **Keep in a compressed obstruction section, with the normalized nondegenerate hypotheses.** It is a rigorous fixed-rank dichotomy, not a heuristic, but the paper must define the objects and state the `q >= 1` restriction (`researcher-59-pro-R53-q-shadow-dichotomy-audit-confirmed-sharpened.md:L19-L39`; `researcher-59-pro-R53-q-shadow-dichotomy-audit-confirmed-sharpened.md:L188-L338`). |
| R56 separator-only barrier | **Keep in a compressed obstruction section as a class-level no-go theorem.** It is rigorous for the defined finite odd-carrier separator-only proof class; do not present it as a theorem about all separator methods (`researcher-56-pro-finite-odd-carrier-separator-only-negative-theorem.md:L42-L137`; `researcher-56-pro-finite-odd-carrier-separator-only-negative-theorem.md:L217-L333`). |
| All other structural negatives | **Cut from the main paper or reduce to unnumbered remarks / appendix bullets.** The matrix correctly says the structural-negative section should be absorbed, cut, or split into a companion note (`paper/PAPER_SHAPE_PROPOSAL.md:L71-L73`; `paper/REPO_VS_PAPER_MATRIX.md:L119-L121`). |

# Q1/Q2 answers

## Q1. Does a complete calibrated shield construction exist in the repo?

**No.** I found no complete proof of the “calibrated shield construction” needed to turn Theorem A into the current draft's T1 lower bound. The proposal itself marks this as unknown (`paper/PAPER_SHAPE_PROPOSAL.md:L95-L96`), the repo-vs-paper matrix says the T1 proof is not supported unless that construction is inlined or the theorem is demoted (`paper/REPO_VS_PAPER_MATRIX.md:L89-L90`), and the current draft only asserts the conversion in one sentence (`paper/sections/03-lower-bounds.tex:L101-L110`).

The direction problem is substantive. Shield Reduction states `|A| >= |U| - beta(P)` (`paper/sections/02-shield-reduction.tex:L48-L95`), so to prove a positive game-length lower bound by this route one needs to make `beta(P)` small. Theorem A proves `beta(P)` is large for short shield prefixes (`paper/sections/03-lower-bounds.tex:L15-L88`), and the source-of-truth note explicitly says that large `beta(P)` makes the reduction vacuous rather than useful (`current_state.md:L255-L266`).

The repository does contain an independent T1-scale proof: the upper-half fan construction proves `L(n) >= (1/8-o(1)) n log log n / log n` through a max-degree capture argument (`researcher-13-pro2-odd-fan-strengthened.md:L21-L47`, `researcher-13-pro2-odd-fan-strengthened.md:L243-L304`). That proof can be used if the paper wants to retain a T1 statement, but it is not the missing calibrated shield construction.

## Q2. Is the Round 15 local density law rigorously proved?

**Yes, to publishable prose standard; no, not to the same formal-verification standard as Shield Reduction.** The local density law has an explicit proof in the current manuscript: for compact subintervals away from the breakpoints, the proof derives

`S_K(n^u) >= (1-o(1)) n^u / ((h+1)u log n)`

by comparing the played primes with the number of odd primes in a short range and then applying uniform PNT on fixed compact intervals (`paper/sections/06-main-upper-bound.tex:L50-L152`). The same local lemma is also isolated as the safest theorem-level content in the upper-bound status note (`round15_upper_bound_status.md:L18-L79`).

The larger sub-`0.19n` theorem also has a later repair package beyond the old “breakpoint gap” status: the audit-and-repair note supplies the correct prime-sequence Bonferroni comparison theorem and bridge repairs (`r57_bonferroni4_audit_and_repair.md:L91-L119`, `r57_bonferroni4_audit_and_repair.md:L198-L229`, `r57_bonferroni4_audit_and_repair.md:L421-L437`), and the later theorem note gives the full chain to `W_4/2 = 0.1897112 < 0.19` (`researcher-60-pro-R57-repair-PROVED-theorems-2-1-and-4-1.md:L41-L53`, `researcher-60-pro-R57-repair-PROVED-theorems-2-1-and-4-1.md:L1352-L1461`).

The honest scope is: **state the finite Bonferroni-4 sub-`0.19n` bound as a theorem in Version B-lite, but describe formalization as partial.** The Lean file proves the conditional endgame from componentwise moment closeness; it does not formalize the full local density law, prime-rounding bridge, game tree, or moment convergence (`lean/README.md:L33-L46`; `publication_source_of_truth.md:L35-L39`).

# T2 appendix feasibility

**Can T2 be written out from existing repo material? Yes, but only as a real appendix proof, not by reference.** The current draft's T2 section has the right architecture but is too compressed: the matrix specifically says the residual comparison, activation-stage inequality, and final lower-bound assembly are not yet supported by the paper text as written (`paper/REPO_VS_PAPER_MATRIX.md:L91-L93`).

The appendix should be assembled from four ingredients already present in the dump.

1. **Abstract finite potential game.** State the scaled `Q8` invariant for finite weighted rank-at-most-three incidence games and prove that Maker's max-gain move keeps `Q8` nondecreasing after each full round. The formalization scout gives a clean theorem statement and explains why it packages the graph and scored 3-uniform hypergraph cores (`worker_t2_finite_core_memo.md:L5-L59`).

2. **Residual divisibility embedding.** Prove that a residual target `t=acb` has harmful future moves exactly in the slot set `{b,ab,cb}` plus the exact target, that target plays score one edge because targets lie in the upper half, and that live hyperedges give legal actual moves (`worker_t2_finite_core_memo.md:L108-L132`). The Lean index lists these as already formalized at the finite-core level (`lean/README.md:L22-L31`).

3. **Activation-stage token bookkeeping.** Use the activation score plus residual live-token potential, not just claimed edge weight. The activation audit gives the needed inequality `Q_end >= W_0/8 - E` and identifies off-model moves as deletions contributing to the subtractive error term (`researcher-22-codex-T2-activation-audit.md:L20-L36`, `researcher-22-codex-T2-activation-audit.md:L44-L167`).

4. **Asymptotic wrapper.** Prove the initial target mass lower bound, the error estimate `E << Y^4/log^4 Y = o(n (log log n)^2/log n)`, and the final conversion from residual secured-pair weight to game length. The formalization scout explicitly identifies these as the asymptotic wrapper pieces to postpone from the finite core into the paper proof (`worker_t2_finite_core_memo.md:L155-L161`), and the activation audit supplies the required error and residual-weight estimates (`researcher-22-codex-T2-activation-audit.md:L169-L258`).

**What is missing from the current draft:** not a proof idea, but integration. The appendix must define the target family, slot hypergraph, weights, activation rounds, token deletions, exact-target scoring, and all constants in one continuous proof. Without that, T2 should be described as a rigorous-prose theorem with detailed proof deferred in an attached note; with it, T2 can be a main theorem.

# Barrier-theorem audit

**R52 / Sherali--Adams barrier.** This is a rigorous static combinatorial meta-theorem after the sharpened audit. The random construction and the weaker-but-correct Sherali--Adams value bound are explicitly confirmed (`researcher-58-pro-R52-integrality-barrier-audit-confirmed-sharpened.md:L13-L19`). The paper can keep it, but it must define the proof system and avoid implying it blocks all linear-programming or all local methods.

**R53 / fixed-rank `q`-shadow dichotomy.** This is rigorous in the nondegenerate range. The audit gives the needed normalization `L >= 1` and `1 <= q <= h`, then supplies the paper-facing theorem and conclusion (`researcher-59-pro-R53-q-shadow-dichotomy-audit-confirmed-sharpened.md:L19-L39`, `researcher-59-pro-R53-q-shadow-dichotomy-audit-confirmed-sharpened.md:L188-L338`). Keep it as a theorem or proposition if the paper defines the Johnson-layer notation carefully.

**R56 / separator-only barrier.** This is rigorous for a precisely defined proof class. The theorem assumes a finite odd-carrier separator-only closure with small carrier set and small prime-reciprocal mass, then gives a Prolonger prefix that kills all separators while leaving `n/2-o(n)` upper-half elements legal (`researcher-56-pro-finite-odd-carrier-separator-only-negative-theorem.md:L42-L137`, `researcher-56-pro-finite-odd-carrier-separator-only-negative-theorem.md:L217-L333`). Keep it, but state the quantifiers narrowly.

**Other negatives.** Treat them as background diagnosis. A paper with the sub-`0.19n` theorem, T2, 5/24, and the three proof-class barriers is already full. Additional structural negatives should be unnumbered remarks or omitted.

# Amended paper shape

This is not a wholly different paper from `PAPER_SHAPE_PROPOSAL.md`; it is the same nine-section / three-appendix design, with the T1 and formalization posture corrected.

## Section 1. Introduction

Include five headline results:

1. **Upper bound below `0.19n`.** State `L(n) <= (W_4/2+o(1))n`, with `W_4/2 = 0.1897112 < 0.19`.
2. **Second-order lower bound.** State `L(n) >= c n (log log n)^2/log n` for an explicit admissible constant/range as proved in the appendix.
3. **Shield Reduction and shield-prefix obstruction.** State the structural reduction and Theorem A as a theorem about limitations of short shield prefixes.
4. **Exact first-hit cover.** State `tau(n)=5n/24+O(1)` with explicit cover and packing.
5. **Intermediate Shortener bounds.** State `13/36` and `5/16` as earlier constants and proof templates leading into the main upper bound.

Do **not** list T1 separately. If desired, one sentence can say that an independent fan construction gives a weaker lower bound of order `n log log n/log n`, but it is subsumed by the second-order theorem.

Add one precise formalization paragraph: some finite combinatorial cores and exact structural theorems are Lean-checked; the main sub-`0.19n` theorem has a formalized conditional endgame plus analytic prose for moment convergence; the T2 lower bound has Lean-checked finite cores but a prose asymptotic wrapper.

## Section 2. Game, notation, and elementary facts

Absorb the glossary. Define the game, move order, `L(n)`, lower/upper halves, upper shadow, shadow weight, `beta(P)`, and `tau(n)`. Include a short note that distinct upper-half integers are incomparable. Keep this section purely mathematical and free of artifact references.

## Section 3. Shield Reduction

Prove Shield Reduction in full. Then state Theorem A as the main shield-prefix obstruction: for `|P| <= n^alpha`, `beta(P) >= ((1/2) log(1/alpha)+o(1))n`. End the section by explaining the consequence correctly: this shows that any shield-reduction proof of a linear lower bound needs a sufficiently long or structurally rich shield prefix. Do not claim it proves T1.


## Section 4. Lower bounds

Main theorem: the second-order lower bound. The body should give the strategy and theorem statement, followed by a roadmap of the proof. The detailed proof goes to Appendix A.

Recommended structure:

- Abstract Maker-first capture lemma.
- Scored three-slot hypergraph lemma.
- Divisibility embedding for residual targets `t=acb`.
- Activation-token inequality and error term.
- Number-theoretic count giving the target mass.
- Final conversion to a lower bound for `L(n)`.

The independent fan lower bound can be included as a short proposition only if space permits. It is not a headline result and should not be tied to Shield Reduction.


## Section 5. The exact `5/24` cover theorem

Keep essentially as written: explicit cover, matching packing, cardinality. This is a polished auxiliary theorem and gives the paper a clean finite extremal result.


## Section 6. Intermediate Shortener upper bounds

State and prove `13/36` and `5/16` compactly. Emphasize the shared odd-prime-prefix, odd-part injection, truncation, and second-order Bonferroni mechanism. These results prepare the reader for the higher-order Bonferroni section without making the paper depend on them as the headline.


## Section 7. Main upper bound below `0.19n`

This is the centerpiece. It must be self-contained and theorem-proof level.

Recommended theorem sequence:

1. **Long odd-prime-prefix strategy.** Define `K=floor((1-eps)n/(2 log n))` and the played primes `q_j`.
2. **Local density law.** Prove the compact-away-from-breakpoints bound for `S_K(n^u)`.
3. **Monotone envelope and inversion.** Build the comparison sequence `b_j >= q_j` and prove moment convergence over the truncated grid.
4. **Prime-sequence Bonferroni comparison.** Prove that replacing the actual played primes by an increasing comparison prime sequence bounds the post-prefix survivor count by the four-term Bonferroni expression.
5. **Prime-rounding bridge.** Replace the real comparison sequence by actual odd primes with asymptotically identical moments.
6. **Numerical coefficient.** Define `J_1,...,J_4`, `W_4=1-J_1+J_2-J_3+J_4`, quote reproducible numerical evaluation, and conclude `W_4/2=0.1897112<0.19`.

Do not use round numbers or artifact names in this section. Name the mathematical ingredients by what they do: local density theorem, envelope theorem, Bonferroni comparison theorem, prime-rounding bridge.


## Section 8. Obstructions to further improvement

Limit this section to three normal mathematical subsections:

1. **Transversal-integrality barriers.** State the static covering/integrality theorem and the Sherali--Adams consequence.
2. **Fixed-rank shadow/capture dichotomy.** State the Johnson-layer dichotomy with the correct nondegenerate hypotheses.
3. **Separator-only closure barriers.** State the finite odd-carrier separator-only no-go theorem.

No conditional strategy-specific taxonomy, no long catalogue of failed attempts, and no numbered theorems whose proof systems are not defined. This section should be about why natural proof classes fail, not about the research process.


## Section 9. Conclusion and open problems

Keep to one page. State what is proved, what remains open, and what the current bounds leave unresolved. Avoid claims of closure. The sharp asymptotic order remains open.

## Appendix A. Deferred technical proofs

Include:

- full T2 proof,
- restricted carrier propositions,
- any long Section 7 estimates that would otherwise interrupt the main exposition.

Do not put a missing proof here by reference to the repository. If a proof is not in the PDF, the corresponding theorem should not be in the theorem list.

## Appendix B. Numerical verification

Include numerical evaluation of `W_4/2`, integration method, convergence checks, and enough code-path description for reproducibility. This appendix supports the coefficient, not the theorem's logical steps.

## Appendix C. Formal verification artifact map

Use a table with columns: theorem, mathematical content formalized, Lean path, sorries/status, and what is not formalized. The table must distinguish:

- Shield Reduction: zero-sorry theorem.
- `5/24`: zero-sorry structural cover/packing, cardinality floor sums in prose.
- `13/36`: zero-sorry theorem artifact.
- `5/16`: partial artifact with Chebyshev-adjacent gaps.
- Theorem A: finite combinatorial core formalized, classical analytic number theory imports not fully internalized.
- T2: finite graph/hypergraph/embedding core formalized; activation/asymptotic wrapper in prose.
- Sub-`0.19n`: conditional endgame formalized; density, moment convergence, and prime bridge in prose.

# Repo source map for implementing the shape

This map is for the repository rewrite only; these internal paths should not appear in the running text of the arXiv paper.

| Paper location | Content to include | Primary repo evidence |
|---|---|---|
| Section 3 | Shield Reduction proof and Theorem A as a shield-prefix obstruction. | `paper/sections/02-shield-reduction.tex:L48-L95`; `aristotle/theorem_A_shield_lower_bound.tex:L1-L190`; `current_state.md:L243-L266`. |
| Section 4 / Appendix A | T2 lower bound: abstract potential game, residual slot embedding, activation-token inequality, asymptotic wrapper. | `worker_t2_finite_core_memo.md:L5-L59`; `worker_t2_finite_core_memo.md:L108-L159`; `researcher-22-codex-T2-activation-audit.md:L20-L36`; `researcher-22-codex-T2-activation-audit.md:L169-L258`; `lean/README.md:L22-L31`. |
| Optional Appendix A proposition | Independent T1-scale upper-half fan lower bound, if retained. | `researcher-13-pro2-odd-fan-strengthened.md:L21-L47`; `researcher-13-pro2-odd-fan-strengthened.md:L243-L304`. |
| Section 5 | Exact `5/24` cover and packing theorem. | `paper/sections/04-5-24-cover.tex`; `aristotle/tau_5_24.tex`; `lean/README.md:L13-L13`. |
| Section 6 | `13/36` and `5/16` intermediate upper bounds. | `aristotle/shortener_13_36_v2.tex`; `aristotle/shortener_5_16.tex`; `lean/README.md:L14-L15`. |
| Section 7 | Sub-`0.19n` theorem: local density, envelope/inversion, Bonferroni comparison, prime-rounding bridge, numerical coefficient. | `paper/sections/06-main-upper-bound.tex:L50-L229`; `r57_bonferroni4_audit_and_repair.md:L91-L119`; `r57_bonferroni4_audit_and_repair.md:L198-L229`; `r57_bonferroni4_audit_and_repair.md:L421-L437`; `researcher-60-pro-R57-repair-PROVED-theorems-2-1-and-4-1.md:L94-L702`; `researcher-60-pro-R57-repair-PROVED-theorems-2-1-and-4-1.md:L704-L1461`. |
| Appendix B | Reproducible numerical evaluation of `W_4/2=0.1897112`. | `paper/sections/06-main-upper-bound.tex:L154-L173`; `publication_source_of_truth.md:L35-L39`. |
| Section 8 | Three rigorous proof-class barriers. | `researcher-58-pro-R52-integrality-barrier-audit-confirmed-sharpened.md:L13-L19`; `researcher-59-pro-R53-q-shadow-dichotomy-audit-confirmed-sharpened.md:L19-L39`; `researcher-56-pro-finite-odd-carrier-separator-only-negative-theorem.md:L42-L137`. |
| Appendix C | Exact formalization status table. | `lean/README.md:L9-L46`; `paper/REPO_VS_PAPER_MATRIX.md:L123-L133`. |

# Final approval checklist

- [ ] Delete or replace the shield-derived T1 corollary.
- [ ] Rewrite the lower-bound section so Theorem A is an obstruction theorem, not a source of T1.
- [ ] Add a full Appendix A proof of T2.
- [ ] Rewrite the sub-`0.19n` section at theorem-proof level and remove all internal research-process labels from the body.
- [ ] State `0.1897112 < 0.19` as the theorem coefficient; keep `0.18969` as a numerical remark only.
- [ ] Compress the obstruction section to the three rigorous proof-class barriers.
- [ ] Move restricted carrier results to Appendix A.
- [ ] Replace the body formalization section with one intro paragraph plus Appendix C.
- [ ] Make every claim in the theorem list provable from the PDF alone.

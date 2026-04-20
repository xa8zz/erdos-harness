You are drafting **Paper A** — the math paper — for Erdős problem 872. Target: arXiv `math.CO` + submission to Combinatorica / J. Combinatorial Theory / Discrete Analysis. Target length 40-60 pages including appendices. Output: LaTeX using `amsart`.

## Before you start

Read these in order:

1. [paper_template.md](/Users/omisverycool/erdos-harness/erdos-872/paper_template.md) — the section structure you will follow 1:1.
2. [publication_source_of_truth.md](/Users/omisverycool/erdos-harness/erdos-872/publication_source_of_truth.md) — especially Section 0E (tier triage + strategy-dependence tags) and Section 10 paragraph draft.
3. [lean/README.md](/Users/omisverycool/erdos-harness/erdos-872/lean/README.md) — formal verification index for Section 10 + Appendix A.
4. Scan [current_state.md](/Users/omisverycool/erdos-harness/erdos-872/current_state.md) and [phase4/](/Users/omisverycool/erdos-harness/erdos-872/phase4/) for theorem statements and proof outlines.
5. [r57_bonferroni4_audit_and_repair.md](/Users/omisverycool/erdos-harness/erdos-872/r57_bonferroni4_audit_and_repair.md) — headline R57 theorem with Codex's audit-repair of the comparison-theorem provenance gap.

## Output structure

Create `erdos-872/paper/` with:

```
paper/
├── main.tex                       # \input every section
├── preamble.tex                   # packages, theorem envs, notation macros
├── references.bib                 # bibliography (Er92c, FuSe91, BPW16, CaEr90, Lichtman 2023, etc.)
├── DRAFT_STATUS.md                # per-section status, open \todo{} list, page count
└── sections/
    ├── 01-introduction.tex        # game + prior work + Prolonger-first + main results list
    ├── 02-shield-reduction.tex    # Lean-verified (0 sorries)
    ├── 03-lower-bounds.tex        # T1 / T2
    ├── 04-5-24-cover.tex          # Lean-verified exact cover
    ├── 05-intermediate-upper-bounds.tex  # 13/36 + 5/16
    ├── 06-main-upper-bound.tex    # 0.19n headline (R57)
    ├── 07-restricted-class.tex    # Theorem 5 + Theorem 6
    ├── 08-proof-class-barriers.tex # R52 + R53 + R56 + R54 taxonomy + σ*-conditional subsection
    ├── 09-structural-negatives.tex # abbreviated
    ├── 10-formal-verification.tex # summary + theorem/sorry table
    ├── 11-conclusion.tex
    ├── appendix-A-formalization.tex
    ├── appendix-B-numerical.tex
    └── appendix-C-glossary.tex
```

## Rules

1. **Do not invent math.** Every theorem, lemma, constant, and proof step must trace to a specific source file in the repo. If the source is missing, incomplete, or contradictory, insert `\todo{<specific question>}` and move on. Do not fill in with plausible-sounding content.

2. **Strategy-dependence discipline.** Every theorem statement that is `strategy-specific` or `sigma^*-dependent` must say so in the statement (e.g., "Under the Shortener strategy $\sigma_{15}$ defined below, ...") per `publication_source_of_truth.md` Section 0E tags. Section 8.5 is the dedicated subsection for clearly-labeled conditional `sigma^*`-dependent results; do not mix those in with the headline.

3. **Tier-based detail level** (per Section 0E):
   - **Tier 1** (0.19n headline, Shield Reduction, T1, T2): full detail, rigorous proofs, every step explicit.
   - **Tier 2** (5/24, 13/36, 5/16, R52, R53, R56, Theorems 5/6, F_alpha, 85/1008): full statements + clean proof sketches with key steps; routine details referenced.
   - **Tier 3** (structural negatives in Section 9): 1-2 paragraphs per item — statement + failure mechanism + reference to source note.

4. **Prolonger-moves-first assumption.** State explicitly in Section 1.1 that Erdős's original formulation is ambiguous about first-player and we assume Prolonger moves first, matching all cited forum and prior work.

5. **Prior work** (Section 1.2): use the full citation list from `publication_source_of_truth.md` Section 0D. Credit Price + GPT-5.2 Pro for the first linear bound `(23/48)n` and the Prolonger/Shortener naming convention; credit forum commenters (Adenwalla, StijnC, natso26, Xiao_Hu, Desmond Weisenberg) for the refinement chain to `(419/1008)n <= 0.416n`.

6. **No AI narrative in the body.** One single-paragraph acknowledgment at the end cross-references the companion methodology paper (Paper B). Do not interleave AI narrative with the math.

7. **LaTeX style.**
   - `amsart` class, 11pt.
   - Packages: `hyperref`, `cleveref`, `amsmath`, `amsthm`, `mathtools`, `amssymb`, `tikz`, `listings`.
   - Theorem environments: `theorem`, `lemma`, `proposition`, `corollary`, `definition`, `remark`.
   - `\Cref` for cross-references.
   - Notation macros in `preamble.tex` (`\L` for `L(n)`, `\U` for `(n/2, n]`, `\betaP` for `beta(P)`, `\rhoU` for the Round 15 density, `\Wfour` for `\mathcal{W}_4`, etc.).

8. **Commit per section.** After each section file is drafted and compiles as a standalone `\input`, commit with message `Paper draft: section NN - <title>`. Do not bundle multiple sections into a single commit.

9. **Formalization language.** Use the exact paragraph drafted in `publication_source_of_truth.md` Section 0E ("Paper's formal-verification language") for Section 10's opening. The accompanying table of theorems / file paths / sorry counts / Mathlib-gap notes comes from `lean/README.md`.

10. **Numerical values.** For `\mathcal{W}_4/2`, cite the reproducible sandbox in `phase3/shortener_piecewise_bonferroni4_summary.md` and the Richardson-reconciled value in `r57_bonferroni4_audit_and_repair.md` — both `< 0.19`. Do not conflate them (the 7th-decimal discrepancy has a known explanation; see the audit note).

## What to avoid

- Do not introduce new theorems or constants.
- Do not reformulate proven statements — preserve their original form.
- Do not mention AI tools anywhere in the body. Acknowledgment paragraph only.
- Do not mix `sigma^*`-dependent results into the headline narrative. They live in the clearly-labeled Section 8.5.
- Do not attempt to close any `\todo{}` marker by making up content. Flag and move on.
- Do not write the methodology paper (Paper B) or modify `paper_template.md`.

## After all sections are drafted

Produce `paper/DRAFT_STATUS.md`:

- Per-section status: complete / partial / blocked.
- Full list of `\todo{}` markers with source-file pointers.
- Estimated page count.
- What human authorship remains (abstract polish, conclusion judgment calls, acknowledgment wording, any gaps where the repo content is insufficient).

Then run `pdflatex main.tex` (twice, then `bibtex`, then `pdflatex` twice more) to produce a PDF. Commit the PDF.

## Style references

- Match the tone of Combinatorica / J. Combinatorial Theory papers: formal, concise, theorem-proof structure, minimal exposition between theorems.
- Proof sketches where the repo has full prose; full proofs where feasible. Avoid hand-waving.
- Use LaTeX comments (`% source: researcher-NN-*.md`) at the start of each theorem block pointing to the canonical source file.

## Stop conditions

- Stop after all 14 files are drafted and committed and `DRAFT_STATUS.md` is written.
- If you encounter more than ~5 `\todo{}` gaps in a single section, stop that section and flag the whole section as "blocked: needs source-material clarification" in the status doc. Do not guess through missing material.

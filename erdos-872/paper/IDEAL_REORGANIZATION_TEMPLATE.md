# Ideal Reorganization Template for Paper A

Internal planning note for rewriting the current draft into a normal
math-paper form that a skeptical reviewer could read without needing the repo in
order to understand the proof chain.

This template assumes:

- the repo remains a **public artifact repository**;
- GitHub / Lean / numerical scripts are cited where useful;
- the paper itself carries the **mathematical burden of proof**;
- the repo is used for **formalization support, reproducibility, and long artifact
  tables**, not as the place where essential missing proof steps live.

## Governing Principle

The rewritten paper should satisfy the following standard:

> A reader who never opens the repo should still be able to understand exactly
> what is proved, what is conditional, what is formally verified, and why the
> main theorem is believed from the argument in the PDF itself.

Corollaries:

1. No theorem in the abstract or main-results section should depend on
   `current_state.md`, `R57`, `R60`, or any similar internal note label.
2. Every main theorem must have either:
   - a full proof in the body;
   - a full proof in an appendix;
   - or a precise statement that it is conditional on named inputs proved
     elsewhere in the paper.
3. GitHub / Lean references are allowed, but only as:
   - formal-verification support,
   - reproducibility support,
   - or extended artifact documentation.

## Recommended Paper Shape

The cleanest public-facing version of the paper is:

1. **Introduction**
2. **Notation and Setup**
3. **Shield Reduction**
4. **Lower Bounds**
5. **Exact `5/24` Cover Theorem**
6. **Intermediate Upper Bounds**
7. **Main Upper Bound Below `0.19n`**
8. **Restricted Carrier Classes**
9. **Barrier Theorems and Diagnostics**
10. **Formal Verification and Reproducibility**
11. **Conclusion**
12. **Appendix A: Full Technical Proofs**
13. **Appendix B: Numerical Verification**
14. **Appendix C: Artifact Map**

This is not shorter by force. It is cleaner by function.

## Section-by-Section Template

## 1. Introduction

### Purpose

- Define the game.
- State the Prolonger-first convention.
- Give prior work and the public record.
- State only the results the paper is genuinely willing to stand behind.

### What should appear

- One-paragraph problem statement.
- One-paragraph history / prior work.
- One theorem list with very short summaries.
- One paragraph of organization.

### What should not appear

- repo-round language;
- AI workflow language in the mathematical narrative;
- detailed Lean bookkeeping;
- barrier taxonomy details.

## 2. Notation and Setup

### Purpose

Collect all definitions needed later:

- primitive / antichain;
- legal move;
- terminal state;
- `L = [2,n/2]`, `U = (n/2,n]`;
- game value `\L(n)`;
- any auxiliary counting functions used later.

### Comment

This section reduces clutter in later proofs and makes the paper read more like
a conventional math article.

## 3. Shield Reduction

### Status target

Fully theorem-proof style. This should be one of the cleanest sections.

### What belongs here

- precise definition of `beta(P)`;
- statement of Shield Reduction;
- short direct proof;
- perhaps one short remark on its role in later sections.

### Repo / Lean use

- a brief sentence at the end or in Section 10:
  "This theorem is formally verified in Lean; see Appendix C."
- no file paths in the body proof.

## 4. Lower Bounds

This section should be split sharply into what is genuinely paper-ready and what
is not.

### 4.1 Theorem A

- Keep if the static theorem itself is in solid theorem-proof form.
- The proof should be written as a normal proof, not as "see note / artifact."
- Formalization claims should be deferred to Section 10.

### 4.2 T1

Current recommendation:

- **Do not keep T1 as a theorem unless the calibrated shield construction is
  written inside the paper or Appendix A.**

Possible treatments:

1. **Best case**: repair and include full proof.
2. **Conservative case**: remove T1 from the main theorem list and replace it
   with a remark:
   "Theorem A shows a strong obstruction to shield-based lower-bound routes."
3. **Intermediate case**: state T1 as a proposition with explicit dependence on
   a later appendix construction.

### 4.3 T2

Current recommendation:

- If keeping T2 as a theorem, move substantial material to Appendix A and refer
  to that appendix explicitly.
- Do not leave T2 as "proof sketch + imported note chain."

Suggested posture:

- Main text: theorem statement + roadmap of proof.
- Appendix A: Maker-first lemmas, residual comparison theorem, activation-stage
  wrapper, token bookkeeping.

## 5. Exact `5/24` Cover Theorem

### Status target

Fully self-contained theorem section.

This should be a showcase result:

- explicit cover;
- explicit packing;
- exact count;
- short proof.

### Repo / Lean use

- cite artifact support only in Section 10 / Appendix C.
- do not make the Lean artifact part of the main proof exposition.

## 6. Intermediate Upper Bounds

This section should be cleaned into standard theorem-proof progression:

### 6.1 `13/36`

- theorem;
- concise but complete proof;
- mention formal verification later, not in the middle of proof exposition.

### 6.2 `5/16`

- theorem;
- concise but complete proof;
- explanation of why this exhausts the basic odd-prime-prefix / second-order
  Bonferroni family.

### Design goal

A reader should come out of this section thinking:

- "I understand the older strategy family;"
- "I see why it naturally stops at `5/16`;"
- "I am ready for the sharper `0.19` argument."

## 7. Main Upper Bound Below `0.19n`

This is the load-bearing section and must be written at the highest standard.

### Required theorem chain

The paper should present the argument as a sequence of named results, not as
repo repairs:

1. local density theorem;
2. monotone envelope / inversion theorem;
3. prime-sequence Bonferroni comparison theorem;
4. prime-rounding bridge theorem;
5. main upper-bound theorem.

### Required discipline

- If these are real theorems, write them as real theorems.
- If some are not yet ready, state the main result conditionally.

### Current recommendation

If the paper is not yet ready to fully write the density/envelope/bridge chain
at theorem-proof level, then use one of these two public postures:

1. **Theorem posture**:
   the section is expanded until it truly reads like a theorem-proof section.
2. **Conditional posture**:
   the main theorem is stated as:
   "Assuming Theorems 7.x and 7.y, one obtains..."

Do **not** use:

- "R57 repaired by R60";
- "current note";
- "audit-verified bridge";
- or similar internal language in the main proof chain.

## 8. Restricted Carrier Classes

These are reasonable to keep if written as honest, self-contained theorems.

### Theorem 5

- Must include legality and range details.
- The phase-2 move issue must be addressed explicitly.

### Theorem 6

- Needs more casework and bookkeeping than the current sketch provides.

### Best structure

- keep both if Appendix A is available for full details;
- otherwise keep only the cleaner one and move the other to a remark/open
  question.

## 9. Barrier Theorems and Diagnostics

This section should be much more selective than the current draft.

### Recommended split

#### 9.1 Keep as theorem-level content

- R52 transversal-integrality / Sherali--Adams barrier;
- R53 q-shadow / covering dichotomy;
- R56 separator-only barrier.

These are the most natural candidates for serious barrier theorems.

#### 9.2 Keep only as diagnostic/conditional content

- R44 residual-floor diagnosis;
- R46 sigma-star-dependent tools/refutations;
- R54 strategy-dependence classification.

These should be visibly labeled as:

- framework-specific;
- conditional;
- or diagnostic.

#### 9.3 Move out of the main body unless sharpened

- miscellaneous structural negatives;
- multi-round no-go narratives;
- anything that still reads like program diagnosis rather than theorem-proof
  mathematics.

## 10. Formal Verification and Reproducibility

This section can remain a standalone section. It just needs to be modest and
exact.

### What it should do

- explain what is formally verified;
- explain what is only partially formalized;
- explain what remains prose;
- cite the public artifact repository.

### What it should not do

- imply that a nearby Lean theorem proves a stronger paper theorem;
- blur "endgame reduction formalized" into "full theorem formalized";
- use phrases that sound stronger than the artifacts justify.

### Recommended content

1. short opening paragraph;
2. one table:
   - paper theorem;
   - artifact location;
   - exact status;
   - whether the theorem in Lean exactly matches the theorem in paper.
3. one short remark explaining the difference between:
   - full formal proof,
   - partial formal support,
   - and theorem-adjacent formal artifacts.

## 11. Conclusion

Keep this short and mathematical:

- what is proved;
- what remains open;
- what the main structural obstacle appears to be.

Avoid turning the conclusion into a repo / workflow report.

## Appendix A: Full Technical Proofs

This is the main release valve.

Candidate content:

- repaired T1 construction, if retained;
- full T2 activation wrapper;
- long Section 7 quantifier-heavy details;
- restricted-class casework;
- longer barrier proofs.

## Appendix B: Numerical Verification

Good place for:

- Bonferroni coefficient computation details;
- finite checks and convergence tables;
- exact statement of what numerics are used for.

This appendix can cite scripts and artifact files directly.

## Appendix C: Artifact Map

This is where repo-specific detail belongs.

Suggested table:

- result;
- GitHub path;
- Lean file(s), if any;
- script(s), if any;
- exact support status.

This keeps file-path references out of the main body while still giving a
reviewer everything needed to inspect the artifacts.

## GitHub / Lean Citation Policy

## Core Rule

GitHub may be cited as a **public artifact repository**, but not as the place
where the reader is expected to recover essential missing proof logic.

## What is acceptable in the paper

Examples of acceptable statements:

- "A Lean formalization of Theorem 3.1 is available in the public artifact repository [Artifact]."
- "Appendix C lists the corresponding Lean files and current proof status."
- "The numerical evaluation of `\mathcal{W}_4` is reproducible from the scripts in [Artifact]."

## What is not acceptable in the main body

Examples to avoid:

- "This follows from R60."
- "See the current-state note."
- "The proof is in the GitHub repository."
- "The Lean file verifies the remaining gap," unless the exact theorem is
  explicitly stated and matched.

## Citation format recommendation

Use one bibliography entry for the public artifact repository, ideally a stable
release/DOI later. For now:

- cite the GitHub repo in the bibliography;
- point theorem-specific artifact detail to Appendix C;
- keep exact file paths mostly out of the main mathematical narrative.

### Suggested body wording

- "Formal verification details are recorded in Appendix C and in the public artifact repository [Artifact]."
- "A Lean formalization of the endgame reduction is available in [Artifact, Appendix C]."

### Suggested appendix wording

- "The Lean artifact corresponding to the endgame reduction is
  `erdos-872/lean/erdos_872_core/RequestProject/Round15Bonferroni4/Target.lean`
  in [Artifact]."

This is the right place for exact GitHub paths.

## Concrete Rewrite Strategy

## Version A: Conservative journal-facing version

Keep as central results:

- Shield Reduction;
- Theorem A;
- exact `5/24`;
- `13/36`;
- `5/16`;
- selected barrier theorems;
- possibly a conditional or appendix-backed `0.19n` theorem.

Downgrade or move:

- T1 unless repaired;
- T2 unless fully appendix-backed;
- weaker/diagnostic structural negatives;
- heavy sigma-star-dependent material.

## Version B: Ambitious full package

Keep all of:

- Shield Reduction;
- Theorem A;
- T1;
- T2;
- `5/24`;
- `13/36`;
- `5/16`;
- `<0.19n`;
- Theorems 5/6;
- selected barrier theorems.

Requirements:

- Appendix A must become substantial.
- Section 7 must be upgraded from proof-sketch quality to theorem quality.
- Section 10 must become strictly artifact-exact.

## Immediate Next Decisions

Before editing the paper, decide:

1. Is T1 being repaired, downgraded, or removed?
2. Is T2 a theorem in Paper A or an appendix/separate-note result?
3. Is `<0.19n` being written as a full theorem in-paper or as a conditional theorem pending the final prose upgrade?
4. Which barrier results are truly central enough for the main body?
5. Will the public artifact citation remain GitHub-only for now, or be upgraded to a stable release later?

Once those are fixed, the rewrite becomes mostly editorial rather than conceptual.

# Paper A Draft Status

## Per-section status

- `main.tex`: complete
- `preamble.tex`: complete
- `references.bib`: partial
- `sections/01-introduction.tex`: complete
- `sections/02-shield-reduction.tex`: complete
- `sections/03-lower-bounds.tex`: complete
- `sections/04-5-24-cover.tex`: complete
- `sections/05-intermediate-upper-bounds.tex`: complete
- `sections/06-main-upper-bound.tex`: complete
- `sections/07-restricted-class.tex`: complete
- `sections/08-proof-class-barriers.tex`: complete
- `sections/09-structural-negatives.tex`: complete
- `sections/10-formal-verification.tex`: complete
- `sections/11-conclusion.tex`: complete
- `sections/appendix-A-formalization.tex`: complete
- `sections/appendix-B-numerical.tex`: complete
- `sections/appendix-C-glossary.tex`: complete

## `\\todo{}` inventory

No `\todo{}` markers are currently present in the draft sources under `erdos-872/paper/`.

## Estimated page count

- Current compiled draft: **35 pages** including appendices.
- Source of count: `main.aux` label `lastpage` after the final full build.

## Build status

- Compiled successfully to `erdos-872/paper/main.pdf`.
- Working TeX engine used in this environment: `tectonic`.
- Note: the original instruction requested a `pdflatex` / `bibtex` cycle, but `pdflatex` was not installed locally; `tectonic` was installed and used instead, with successful bibliography resolution and PDF output.
- Current build still emits non-fatal layout warnings (`Overfull \\hbox` / `Underfull \\hbox`), mostly from long path-heavy appendix content and the Section 10 verification table.

## Human authorship remaining

- Polish the abstract and introduction for venue-specific tone and length.
- Decide whether to keep, shorten, or visually rework the long path-heavy material in Section 10 and Appendix A.
- Tighten bibliography metadata, especially the placeholder-style `Er92c` entry and any forum / web attribution details that should be normalized before submission.
- Make final judgment calls on how much of Sections 8 and 9 should stay in the main paper versus move to a companion paper or appendix for the target venue.
- Final copy-edit pass for line breaking, theorem numbering aesthetics, and house style.
- Final acknowledgment wording check.

## Notes

- Section 6 reflects the **R60** promotion of the finite Bonferroni-4 theorem to theorem-grade status.
- Section 10 and Appendix A were aligned to the **current explicit `sorry` sites in the checked-in Lean files**, which are slightly stronger than the older aggregate counts recorded in `erdos-872/lean/README.md`.

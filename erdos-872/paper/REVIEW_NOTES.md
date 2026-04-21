# arXiv Pre-Submission Review — Erdős 872 Paper
**Reviewed:** 2026-04-20  
**Scope:** Writing, LaTeX hygiene, notation consistency, front-matter, bibliography. NOT a math review.  
**Method:** Full read of all .tex and .bib source files; targeted grep passes for each focus area.

---

## 1. Notation Consistency

### 1.1 `L(n)` vs `\L(n)` — HIGH PRIORITY

The preamble defines `\renewcommand{\L}{L}`, so `\L(n)` renders identically to `L(n)` in the PDF. However the source is inconsistent, which is a maintenance hazard and a possible compile-time risk if `\L` is ever changed.

Occurrences of raw `L(n)` (not `\L(n)`) that should use the macro:

- `sections/08-proof-class-barriers.tex:154` — `$L(n)=O(r_1(n))$`
- `sections/09-structural-negatives.tex:17` — `$L(n)=O(n/\log n)$`
- `sections/09-structural-negatives.tex:215` — `$L(K)\gg_\eta K$` (uses `L` for the same game-value function at scale `K`; this is a different argument but still the same notation)
- `sections/10-formal-verification.tex:16` — `$L(n)<0.19n$ eventually`
- `sections/11-conclusion.tex:7` — `L(n)` in the display (entire conclusion uses raw `L(n)` rather than `\L(n)`)
- `sections/appendix-C-glossary.tex:6` — the glossary entry `$L(n)$` defines the notation without using the macro

**Recommended fix:** Replace every bare `L(n)` (and `L(K)` when it denotes the game value) in math mode with `\L(n)` (or `\L(K)`) to match the rest of the paper.

**Note on `\renewcommand{\L}{L}`:** The preamble overrides the standard AMS `\L` (Polish barred-L, Ł). If any Unicode character Ł is needed elsewhere in author names or references, this will break. Currently no such use exists, but it is worth a comment in the preamble.

### 1.2 `\sigma^*` vs `\sigma^\star` — consistent, no action needed

All uses of the max-unresolved-harmonic-degree strategy are written `\sigma^*` throughout sections 06, 08, appendix-C, and the glossary. This is consistent. (The glossary entry at `appendix-C-glossary.tex:55` also uses `\sigma^*`.) No drift found.

### 1.3 `\eps` vs `\varepsilon` — minor inconsistency

The preamble defines `\eps` as `\varepsilon` (line 41). The macro is used in one place:

- `sections/06-main-upper-bound.tex:15` — `\eps` in the definition of `K`

But the glossary uses the raw form:

- `sections/appendix-C-glossary.tex:36` — `$(1-\varepsilon)n/(2\log n)$` (defines the same `K`)

**Recommended fix:** Replace `\varepsilon` at `appendix-C-glossary.tex:36` with `\eps` to match.

### 1.4 Player-name capitalization — consistent, no action needed

`Prolonger` and `Shortener` are capitalized consistently throughout all sections. No lowercase occurrences found in running text.

### 1.5 `Bonferroni-4` vs `Bonferroni--4` — inconsistency

The en-dash form `Bonferroni--4` is used in the appendices and section 10 (5 occurrences). The hyphen form `Bonferroni-4` is used in section 06 (2 occurrences):

- `sections/06-main-upper-bound.tex:160` — theorem name `[Prime-sequence Bonferroni-4 comparison]`
- `sections/06-main-upper-bound.tex:354` — subsection title `\subsection{The finite Bonferroni-4 theorem}`

**Recommended fix:** Pick one form. Given that "Bonferroni-4" is a compound descriptor (like "degree-3"), a hyphen is arguably more standard for such phrases. But the en-dash form is already used in the `\keywords` field and all appendix/section 10 uses. Unify to `Bonferroni--4` (en-dash) throughout, updating the two occurrences in `06-main-upper-bound.tex`.

### 1.6 `\mathbb{Z}` vs `\Z` — inconsistency

The preamble defines `\Z` as `\mathbb{Z}`. In-document usage:
- `\Z` is used correctly in `sections/01-introduction.tex:23,25` and `sections/04-5-24-cover.tex:31,33`.
- But `\mathbb Z` (raw, without braces) appears in `sections/08-proof-class-barriers.tex:26,31,44,57` (the transversal-integrality theorem uses `$\tau_{\mathbb Z}(\mathcal C)$`) and in `sections/appendix-C-glossary.tex:8,59`.

The `\tau_{\mathbb Z}` usage is intentional: `\mathbb Z` is a subscript label for "integer transversal number," not a standalone set, so the macro `\Z` would read oddly inside a subscript. No action needed for the `\tau_{\mathbb Z}` notation. However `appendix-C-glossary.tex:8` uses `\mathbb Z` bare in `$(n/2,n]\cap \mathbb Z$` — this should be `\Z` to match `01-introduction.tex:25` which writes `$(n/2,n]\cap\Z$`.

**Recommended fix:** Change `\mathbb Z` to `\Z` at `appendix-C-glossary.tex:8` only.

### 1.7 "Round N" reference style — minor inconsistency

In-prose references to rounds use `Round~15`, `Round~57`, etc. (protected space) throughout sections 05, 06, 08, appendix-A, appendix-C. But two exceptions exist:

- `sections/06-main-upper-bound.tex:32` — subsection heading `\subsection{The Round 15 density}` (unprotected space; fine in a heading, but inconsistent with the tilde convention used everywhere else in prose)
- `sections/appendix-B-numerical.tex:53` — `\subsection{Round 60 Sandbox Checks}` (same issue)

**Recommended fix:** Change these two subsection headings to `Round~15` and `Round~60` for consistency. In section headings the tilde is harmless and keeps the source uniform.

### 1.8 Internal shorthand `R35`, `R54`, `R57`, `R60` used in prose — minor

Section 08 uses "R35 state inequality", "R54 audit", "R57 note" as if these are self-explanatory shorthands. Section 06 uses "the R60 repair" and "the key half-density slack from R60." These are internal harness vocabulary that may confuse arXiv readers.

- `sections/06-main-upper-bound.tex:29` — "using the key half-density slack from R60"
- `sections/06-main-upper-bound.tex:90` — "The R60 evaluation gives"
- `sections/06-main-upper-bound.tex:156` — "The audit of R57 identified..."
- `sections/06-main-upper-bound.tex:243` — "The correct repair is the R60 half-density bridge"
- `sections/06-main-upper-bound.tex:384` — "The R60 evaluation yields"
- `sections/08-proof-class-barriers.tex:207,243,255` — "the R35 state inequality", "The R54 audit"
- `sections/01-introduction.tex:170` — "incorporating the R60 repair of the prime-rounding bridge"

**Recommended fix:** The `R60` references in section 06 (which is a main-content section, not an appendix) should be replaced with "Theorem~\ref{thm:prime-bridge}" or expanded to "the prime-rounding repair" on first mention, with the Lean artifact detail moved to section 10 or appendix B. The `R35`/`R54` mentions in section 08 are in a discussion/classification proof and are tolerable if left as-is, but adding a parenthetical "(see Appendix~B)" would help.

---

## 2. LaTeX Hygiene

### 2.1 Missing `\label` on Section 8 — HIGH PRIORITY / COMPILE BUG

`sections/08-proof-class-barriers.tex` opens with:
```
\section{Proof-Class Barrier Taxonomy}
```
with **no `\label{sec:proof-class-barriers}`**. This label is referenced in three places:

- `sections/09-structural-negatives.tex:4` — `\Cref{sec:proof-class-barriers}`
- `sections/appendix-B-numerical.tex:4` — `\Cref{sec:main-upper,sec:proof-class-barriers}`
- `sections/01-introduction.tex:172` — `\Cref{sec:proof-class-barriers,sec:structural-negatives}`

These will produce `??` in the PDF and a "Reference ... undefined" LaTeX warning.

**Recommended fix:** Add `\label{sec:proof-class-barriers}` immediately after the `\section{...}` line in `08-proof-class-barriers.tex:1`.

### 2.2 Mixed `\ref` / `\Cref` for section cross-references — inconsistency

The organization paragraph in `sections/01-introduction.tex:165--174` mixes styles: some section pointers use `\Cref{...}` and some use bare `\ref{...}`:

- `\Cref{sec:shield-reduction}` (line 165) — OK
- `\ref{sec:lower-bounds}` (line 166) — bare `\ref`
- `\Cref{sec:524-cover,sec:intermediate-upper}` (line 167) — OK
- `\ref{sec:main-upper}` (line 169) — bare `\ref`
- `\ref{sec:restricted-class}` (line 171) — bare `\ref`
- `\Cref{sec:proof-class-barriers,sec:structural-negatives}` (line 172) — OK
- `\ref{sec:formal-verification}` (line 174) — bare `\ref`

When used without a preceding "Section", bare `\ref` produces just a number; `\Cref` produces "Section N". Since `cleveref` is loaded with `noabbrev`, `\Cref` is the correct form throughout.

**Recommended fix:** Replace every bare `\ref{sec:...}` in the Organization paragraph with `\Cref{sec:...}`. Also check `sections/03-lower-bounds.tex:103,115` which use `Theorem~\ref{thm:theorem-a}` — this is fine (explicit "Theorem~" prefix makes it unambiguous), but unifying to `\Cref` everywhere would be cleaner.

### 2.3 Em-dash spacing — inconsistent

The paper uses `---` (em-dash) in `sections/01-introduction.tex:147--148`:
```
There are explicit classes of Prolonger play---including the disjoint small
prime carrier class and the squarefree rank-$\le 3$ carrier class---for which
```
This is correct standard TeX em-dash usage (no spaces). All other em-dash uses in the file follow the same convention. No issue.

### 2.4 The `\betaP` macro is defined but never used

`preamble.tex:35` defines `\newcommand{\betaP}{\beta(P)}` but every occurrence in the paper uses the raw `\beta(P)` form. The macro is dead.

**Recommended fix:** Either delete `\betaP` from the preamble, or do a search-and-replace to use it consistently. Deleting is simpler.

### 2.5 The `\satg` operator is defined but never used

`preamble.tex:52` defines `\DeclareMathOperator{\satg}{sat_g}`. No occurrence of `\satg` was found in any section file.

**Recommended fix:** Delete `\satg` from the preamble.

### 2.6 The `\Half` macro is defined but never used

`preamble.tex:34` defines `\newcommand{\Half}{\left(\frac{n}{2},n\right]}`. Not used in any section.

**Recommended fix:** Delete `\Half` from the preamble.

### 2.7 Definitions have no `\label`

Both `\begin{definition}` environments (in `sections/02-shield-reduction.tex:30` and `sections/04-5-24-cover.tex:11`) have no `\label`. They are numbered by the shared theorem counter, so they get numbers (e.g., Definition 2.1), but cannot be cross-referenced with `\Cref`. Since these definitions are referred back to informally in prose ("defined in \Cref{sec:shield-reduction}"), this is borderline acceptable, but adding labels (e.g., `\label{def:beta}`, `\label{def:tau-cov}`) would allow precise cross-references and is standard practice.

### 2.8 `\todo` macro left in preamble

`preamble.tex:46` defines `\newcommand{\todo}[1]{\textcolor{red!70!black}{\textbf{TODO:} #1}}`. No actual `\todo{...}` calls appear in any section file, so this is just a cleanup issue: the macro should be removed before submission to avoid any risk of an accidental todo appearing in the final PDF if a source file is edited.

### 2.9 Minor: `\rhoU` macro name is opaque

`preamble.tex:36` defines `\newcommand{\rhoU}{\rho}` — this renders as just `\rho`. The name `\rhoU` suggests "rho for the upper half" but the macro is a thin alias. It is used correctly throughout section 06 and the glossary. Not a bug, but the macro name could confuse a collaborator reading the source. Consider renaming to `\rho` directly or adding a comment.

---

## 3. Title Page and Front Matter

### 3.1 `\author` / `\thanks` — clean

`main.tex:6--7` follows standard `amsart` convention: author name on line 6, affiliation and email in `\thanks`. The `\href` wrapping the email address is correct. No issues.

### 3.2 `\subjclass[2020]` — sanity check

The codes are: Primary 91A46, Secondary 05D05, 11N25.

- **91A46** is "Combinatorial games" in MSC 2020. Appropriate.
- **05D05** is "Extremal set theory" in MSC 2020. Appropriate — the paper contains antichain and primitive-set extremal results.
- **11N25** is "Distribution of integers with specified multiplicative constraints" in MSC 2020. Appropriate given the prime-structure arguments throughout.

These codes are correct and well-matched to the paper's content.

### 3.3 `\keywords` — one potential addition

Current keywords: `Saturation game, antichain, divisibility, Erdős problem 872, Sherali--Adams barrier, formal verification, Lean 4`.

The paper contains substantial content on Bonferroni inequalities and piecewise prime density. Consider adding `primitive set` (matches the Cameron–Erdős connection cited in the text) and `Bonferroni inequalities` or `inclusion-exclusion` as keywords.

### 3.4 Abstract length — fine

The abstract is approximately 750 plain-text characters, well within the arXiv 1920-character limit. No action needed.

### 3.5 `\label{lastpage}` in body — unusual placement

`main.tex:85` places `\label{lastpage}` at the end of the AI-disclosure paragraph. This is likely a vestige of a `lastpage` package attempt. It does not cause a bug but looks odd. Can be removed unless a `\pageref{lastpage}` is used somewhere (none was found).

---

## 4. Sectional Transitions and Overlap

### 4.1 Introduction vs abstract — no verbatim repetition

The abstract introduces the game, the main bounds, and the structural results at high level. Section 1 expands each of these into theorem statements with precise formulations. There is no paragraph that is copy-pasted between the two. The overlap is appropriate and standard.

### 4.2 Theorem restatement pattern — consistent and intentional

Every main theorem appears twice: once in Section 1's "Main results" subsection (labeled `thm:intro-*`) and once in the body section with a fuller proof sketch (labeled `thm:*`). This double-statement pattern is consistent and clearly intentional. Cross-references in the organization paragraph correctly point to the body labels, not the intro labels.

### 4.3 Section 8 lacks a `\label` — already noted in §2.1

The missing `\label` causes three `??` cross-references. This is the single most important compile fix.

### 4.4 Section transitions — adequate but section 9 is abrupt

Section 9 (`structural-negatives.tex`) opens immediately with a subsection heading and proposition, without any connecting sentence from section 8. The opening line "We collect here a second family of rigorous no-go results" adequately orients the reader, but it would benefit from one sentence tying back to the section 8 taxonomy (e.g., "Unlike the proof-class barriers of the previous section, which address entire argument families, the results here are best read as structural diagnoses of specific candidate mechanisms."). This is a style note, not a bug.

### 4.5 Redundant definition of $\beta(P)$

The quantity $\beta(P)$ is defined formally in `sections/02-shield-reduction.tex:33--39` (Definition 2.1) and informally described in `sections/01-introduction.tex:68` ("let $\beta(P)$ be the weighted lower-half antichain parameter defined in \Cref{sec:shield-reduction}"). The glossary entry at `appendix-C-glossary.tex:16` gives a slightly different informal description: "The minimum total lower-half shadow weight needed to cover $P$" — but $\beta(P)$ is actually a maximum, not a minimum. The glossary description is wrong and could mislead a reader.

**Recommended fix:** Change `appendix-C-glossary.tex:16--17` to: "The maximum total weight $\sum_{x\in B}w_n(x)$ over antichains $B\subseteq L(P)$; equivalently, the largest weighted lower-half antichain that survives after Prolonger plays $P$."

### 4.6 Section pointers in conclusion are alive

`sections/11-conclusion.tex` references `\Cref{sec:intermediate-upper,sec:main-upper}`, `\Cref{sec:structural-negatives}`, and `\Cref{thm:theorem5,...}`. All target labels exist and are correctly defined.

---

## 5. Bibliography

### 5.1 Incomplete entry: `Er92c` — HIGH PRIORITY

`references.bib:1--5`: The Erdős source entry `@misc{Er92c}` has a placeholder note: "exact publication metadata should be filled from the original source before submission." This will produce a usable citation in the PDF but with missing journal/book/year data. The paper cites this on line 19 and 34 of section 01, and it appears in `\subjclass` context.

**Recommended fix:** Resolve the actual publication before arXiv submission. Based on the cite key `Er92c` (Erdős, 1992, likely "c" for a conference proceedings or collection), the source is presumably the 1992 Banff proceedings or a similar collection. Fill in the actual `booktitle`, `year`, `pages`, and `publisher` fields.

### 5.2 `PriceGPTPro26` author field — unusual

`references.bib:65--71`: The author field is `Price, Liam and {GPT-5.2 Pro}`. An AI system as a co-author in a BibTeX entry is unusual. The braces around `{GPT-5.2 Pro}` prevent name-parsing, which is correct. However arXiv readers may find this surprising. This is ultimately an editorial judgment call, not a technical error. Consider whether the forum attribution should instead be handled via a note/footnote rather than a proper author credit, particularly since the acknowledgments already credit AI systems appropriately.

### 5.3 Missing DOIs — minor

- `FuSe91` (`@article`): no DOI. The DOI for Graphs and Combinatorics 8 (1992) 75--79 is `10.1007/BF02350624`. Adding it is optional for arXiv but improves link-out for readers.
- `CaEr90` (`@incollection`): no DOI. Book chapters often lack DOIs; acceptable.
- `MartinPomerance10`, `Kucheriaviy24`, `PriceGPTPro26`, `Forum872`, `Bloom872`, `ErdosHarness26`: all `@misc` with URLs; no DOI expected.

### 5.4 Author-name format — consistent

All `@article` and `@incollection` entries use `Last, First` format. The `@misc` entries are correctly formatted. The `{Erd{\H{o}}s Problems Forum contributors}` collective author at `Forum872` is correctly braced. No inconsistencies.

### 5.5 No duplicate entries found

All 9 entries have distinct keys and distinct content. No duplicates.

### 5.6 All cited keys resolve to entries

Every `\cite{...}` key in the `.tex` files (`Er92c`, `Bloom872`, `FuSe91`, `BPW16`, `CaEr90`, `Lichtman23`, `Kucheriaviy24`, `MartinPomerance10`, `PriceGPTPro26`, `Forum872`, `ErdosHarness26`) has a corresponding `references.bib` entry. No missing or extra entries.

---

## 6. Compile Cleanliness

### 6.1 Undefined references — `sec:proof-class-barriers` (HIGH PRIORITY)

As noted in §2.1, the missing `\label` on Section 8 will produce three undefined-reference warnings and three `??` in the compiled PDF. This is the most urgent fix.

### 6.2 Potential overfull hboxes

The table in `sections/10-formal-verification.tex:33--74` uses `|p{...}|` column specs summing to approximately `0.20+0.33+0.09+0.27 = 0.89\textwidth`, plus 5 column separators and vertical rules. This is tight but likely fits in `[11pt]` amsart with 1in margins. The long `\path{...}` strings in the Lean artifact column (e.g., `erdos_872_core/RequestProject/Round15Bonferroni4/\{Envelope,FlatMass,...\}.lean`) may overflow the column. Recommend checking the compiled PDF carefully for overfull hboxes in this table; if found, reduce the font size in that column or split the `\path` across lines.

### 6.3 `\allowbreak` usage

`sections/01-introduction.tex:152` uses `\allowbreak` inside a compound word: `transversal\allowbreak-integrality`. This is intentional line-breaking assistance and is fine.

### 6.4 `\path` in math mode — `\path` not in sections that use `equation` environments

`\path{...}` (from the `listings` or `url` package, available via `hyperref`) is used in verbatim file-path contexts in sections 10 and appendix-A. It is not used inside math mode. No issue.

---

## 7. Voice, Tone, and Hedging

### 7.1 "We" vs passive — consistent and fine

The paper uses first-person plural ("we prove", "we have", "we record") consistently in the main content sections. The structural-negative and barrier sections use more passive constructions in proof sketches ("the proof packages", "one checks", "it suffices"). This mix is entirely standard for math papers and is not a problem.

### 7.2 "clearly" and "it is easy to see" — clean

No occurrences of "clearly", "obviously", "trivially", or "it is easy to see" were found in any section. The paper is careful to say "one checks" or "an elementary calculation" where warranted.

### 7.3 Internal vocabulary leaking into running text — moderate concern

Several subsection titles and proof paragraphs use vocabulary that is internal to the research harness rather than standard mathematical terminology:

- "Round~15 strategy", "Round~57 envelope", "Round~60 repair" — these appear repeatedly in section 06's main arguments (not just in appendices). An arXiv reader has no access to the harness and will not know what "Round 57" means. The term is used as if it were a named construction.
- "the R60 half-density bridge" (`06-main-upper-bound.tex:243`) — same issue; "R60" is a harness round number, not a standard math label.

The appendices (A and B) appropriately use round numbers to cite specific artifacts, and this is fine in an appendix. The problem is section 06, which uses round numbers in the body of main proofs.

**Recommended fix:** In section 06, replace every occurrence of "Round~57" and "Round~60" with the name of the specific mathematical construction: e.g., "the envelope construction of Proposition~\ref{prop:envelope-inversion}" and "the half-density bridge of Theorem~\ref{thm:prime-bridge}". The parenthetical "(proved in the R57/R60 notes, detailed in Appendix~B)" can remain if desired, but should not be the primary reference.

### 7.4 Hedging in section 03 proof sketch of T1 corollary — minor

`sections/03-lower-bounds.tex:107--110` says "The calibrated shield construction from the current-state note converts this weighted lower-half mass into a game-length lower bound of size $(1/8-o(1))n\log\log n/\log n$ via \Cref{thm:shield-reduction}. The substantive point is that..." This is under-specified for a proof sketch. "The current-state note" is internal vocabulary, and the conversion step is asserted without any indication of what "calibrated" means. A one-sentence description of the construction (e.g., "Choosing a shield family $P$ consisting of the $\lfloor \log n \rfloor$ smallest primes") would make the sketch self-contained.

### 7.5 Section 08 subsection "Clearly Labeled Conditional $\sigma^*$ Results" — title phrasing

`sections/08-proof-class-barriers.tex:230` — the subsection title "Clearly Labeled Conditional $\sigma^*$ Results" uses "Clearly" as an adjective modifying "Labeled," which is an unusual phrasing for a section title. It reads slightly defensively ("we are explicitly labeling these as conditional"). A cleaner title would be "Conditional $\sigma^*$ Results" or "$\sigma^*$-Dependent Results (Conditional)".

---

## Summary Table of Priority Fixes

| Priority | Location | Issue |
|----------|----------|-------|
| HIGH | `08-proof-class-barriers.tex:1` | Missing `\label{sec:proof-class-barriers}` — causes 3 `??` in PDF |
| HIGH | `references.bib:1--5` | Incomplete `Er92c` entry — placeholder note must be resolved before submission |
| HIGH | `sections/11-conclusion.tex:7` and `10-formal-verification.tex:16`, `09-structural-negatives.tex:17`, `08-proof-class-barriers.tex:154`, `appendix-C-glossary.tex:6` | Raw `L(n)` instead of `\L(n)` |
| MEDIUM | `sections/01-introduction.tex:166,169,171,174` | Bare `\ref{sec:...}` mixed with `\Cref{sec:...}` in organization paragraph |
| MEDIUM | `sections/appendix-C-glossary.tex:16--17` | `\beta(P)` glossary description says "minimum" but it is a maximum |
| MEDIUM | `sections/06-main-upper-bound.tex:29,90,156,243,384` | "R60 repair", "R57 note" — internal vocabulary in main proof section |
| MEDIUM | `sections/06-main-upper-bound.tex:160,354` | `Bonferroni-4` (hyphen) vs `Bonferroni--4` (en-dash) used elsewhere |
| MEDIUM | `sections/appendix-C-glossary.tex:36` | `\varepsilon` should be `\eps` to match preamble macro |
| LOW | `preamble.tex:35,34,46,52` | Dead macros: `\betaP`, `\Half`, `\todo`, `\satg` |
| LOW | `sections/appendix-C-glossary.tex:8` | `\mathbb Z` should be `\Z` |
| LOW | `sections/06-main-upper-bound.tex:32`, `appendix-B-numerical.tex:53` | `Round 15`/`Round 60` in subsection titles (missing tilde) |
| LOW | `sections/08-proof-class-barriers.tex:230` | Subsection title "Clearly Labeled..." — phrasing |
| LOW | `main.tex:85` | Stray `\label{lastpage}` with no matching `\pageref` |

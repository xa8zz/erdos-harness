# Writeup template — for Substack + Zenodo

This is a skeleton showing the shape of the writeup. Each section gives the intent + a 1–2 sentence guide to what goes there + key citations / equations to anchor the prose. Actual content to be drafted from the R02-R07 round docs and `references.md`.

Suggested final length:
- **Zenodo PDF version**: 4,000–6,000 words (~8–12 pages). Standard technical-Comment length.
- **Substack post**: 2,500–4,000 words. Trim, add narrative paragraphs at transitions, keep section structure.

Both versions share the same skeleton. Adaptations noted in each section.

---

## Title options

Pick one. Direct technical framing for Zenodo; more accessible framing for Substack works too.

- *Four obstructions to one-loop renormalizability of unified gravity*
- *On the renormalizability claim of unified gravity: a structural analysis*
- *Comment on Partanen-Tulkki unified gravity: structural obstructions and coherent descendants*
- *(Substack)* Why the 2025 "unified gravity" paper probably can't deliver what it promises

Author byline + ORCID + date + DOI placeholder.

---

## 1. Abstract / TL;DR

**Intent:** One paragraph (Zenodo abstract) or one bold-text TL;DR block (Substack opener). State the conclusion up front: the strict one-loop renormalizability claim of Partanen-Tulkki unified gravity is not defensible within the original strict family; four specific independent structural obstructions rule it out; the 2025 author follow-ups expose a branch fork between the gauge-invariant Minkowski formulation and the TEGR-reduced version; four coherent descendants exist but each abandons at least one stated goal.

**Citations to anchor:** arXiv:2310.01460 (the paper); journal-ref Rep. Prog. Phys. 88, 057802 (2025); two corrigenda 88, 069501 and 88, 079501.

---

## 2. Introduction — the claim being examined

**Intent:** Set up the paper, its scope, and its headline claim. Make it readable for a physicist who doesn't already know the paper. Note that the paper has been peer-reviewed in *Reports on Progress in Physics*, received substantial popular-press attention, and has been iterating through 11 arxiv versions + 2 corrigenda.

**Subsections:**

- **2.1 The construction** — U(1)^4 abelian gauge structure on a space-time dimension field; eight-spinor matter coupling; teleparallel-superpotential kinetic term L_{g,kin} = (1/4κ) H_{ρμν} S^{ρμν} √(-g); claimed TEGR reduction in Weitzenböck gauge; three stated goals (perturbative renormalizability on SM footing, classical GR limit, equivalence principle via equal renormalized masses).
- **2.2 Why it matters** — the paper claims to solve one of the central open problems in theoretical physics (renormalizable quantum gravity unified with the Standard Model). If correct, it would be a major result. If incorrect, the way it fails is informative about the broader QG landscape.
- **2.3 Scope of this writeup** — what we are and aren't analyzing. Focus on the strict claim, with paper-internal-equation backing. We do *not* dispute the construction's mathematical existence as a classical theory; we dispute the renormalizability claim and structural coherence.

**Length guide:** ~600–800 words.

---

## 3. Four structural obstructions

**Intent:** The technical core of the writeup. Each obstruction gets its own subsection with: (a) clear statement, (b) paper-equation citation OR independent-literature anchor, (c) brief argument why the obstruction is real, (d) why standard escapes don't apply.

### 3.1 Obstruction A — matter-loop higher-derivative + axial-current quartic counterterms

State the result: spinor matter loops generate a Weyl-squared counterterm with Duff coefficient b = 1/20 per Dirac fermion (Duff 1994), equivalent to a four-derivative (∂F)^2 operator of mass dimension 6 in U(1)^4 gauge variables. The Einstein-Dirac one-loop sector additionally generates the irreducible axial-current quartic (ψ̄ γ^a γ_5 ψ)^4 — a dimension-12 eight-spinor operator (Deser & van Nieuwenhuizen 1974). Both are BRST-closed in ghost-number-0 cohomology (Barnich-Brandt-Henneaux 2000); both are absent from the bare Lagrangian.

Explain why BRST doesn't forbid them. Note that this obstruction is independent of UG specifically — it applies to *any* two-derivative gravity theory coupled to fermionic matter in 4D.

### 3.2 Obstruction B — paper-internal counterterm-basis mismatch

The decisive paper-internal critique. Show that the paper's *own* one-loop graviton self-energy 1PI two-point tensor (eqs. 187–188) has overall scaling κ p^4 / ε_UV, with the electron-loop divergence decomposing into three independent tensor projectors P̂_{3,2,1}, P̂_{1,2,1}, P_{1,0,1}. Show that the bare-action counterterm structure (eqs. 157, 161, 162, 189) is restricted to (Z_H − 1) p^2 P̂_{1,2,1} with constant Z_H — *one* projector, p^2 only. Show that the paper's resolution is a momentum-dependent δZ_H^{(1)}(p^2) of explicit nonpolynomial form (eqs. 203–205) depending on p^2, m_e^2/p^2, m_e^4/p^4, and logarithms, satisfying subtraction conditions Ξ_{1L}|_{p^2 = 0} = 0 and (Ξ_{1L}/p^4)|_{p^2 → ∞} = 0.

The interpretive claim: in standard BPHZ / algebraic renormalization, this corresponds either to enlargement of the local counterterm basis with new higher-derivative gauge-invariant operators (exiting power-counting renormalizability) or to nonlocal propagator-level subtraction outside the BPHZ class. The paper does neither in its bare action; it uses momentum-dependent propagator-level subtraction. This is *not* Standard-Model-style renormalization of a finite local parameter set.

**Important:** flag the notational caveat — the symbol Ξ_{1L} is reused in the paper for two different objects (the 1PI tensor in eqs. 187–188 vs the scalar propagator correction factor in eqs. 196–199); the paper's own δZ_H^{(1)} formulas don't literally contain log(p^2), that log is in the renormalized remainder (eq. 207). Neither correction affects the substantive structural conclusion.

### 3.3 Obstruction C — teleparallel matter-loop divergences outside the TEGR one-parameter family

Per Casadio, Kuntz, Paci (Eur. Phys. J. C 82, 186, 2022; arXiv:2110.04325), quantum matter loops on a teleparallel background generate one-loop divergences with structure depending on coupling prescription: full equivalence-principle coupling → quartic in torsion (the teleparallel image of curvature-squared); gauge-only translation coupling → quadratic in torsion in the Yang-Mills contraction T^{ρμν} T_{ρμν} alone, *not* in the TEGR linear combination. Bare TEGR has only one gravitational coupling (Newton's constant). Absorption requires enlargement to a three-parameter "New GR" teleparallel action with independent coefficients for the three torsion-quadratic invariants. This is incompatible with the η = η(A) reduction being closed under renormalization.

### 3.4 Obstruction D — Barker's ghost spectrum

Per Will Barker (arXiv:2311.11790, November 2023), in the weak-field zero-coupling limit of unified gravity viewed as a free QFT, the spectrum has a ghostly teleparallel vacuum. **Body-content detail:** in the symmetric interpretation, the two graviton polarizations require one sign of κ while five additional massless polarizations require the *opposite* sign of κ, making ghosts unavoidable. In the asymmetric / teleparallel interpretation, six ghost polarizations. In a bimetric reading, the spectrum is still not unitary. This is a free-theory pathology — even before renormalization, the construction does not contain only healthy helicity-2 gravity + gauge redundancy.

Note: not a strict no-go for every finite-coupling completion, but a sharp particle-spectrum red flag for the version published.

**Length guide for the four-obstruction section:** ~1,500–2,000 words combined. Each obstruction ~400–500 words.

---

## 4. The structural impossibility argument

**Intent:** Tie the four obstructions together. Show that they are not four independent annoyances but the same closure failure expressed in four languages (per R06-pro-3's framing). Argue that no local-BPHZ-renormalizable descendant within the strict original family — local algebraic-renormalization framework, U(1)^4 abelian gauge structure, exact TEGR closure under renormalization, finite bare coupling set, healthy spectrum — can absorb A/B/C/D simultaneously while preserving all three stated goals. At least one of (exact TEGR closure, two-derivative gravitational dynamics, finite-coupling renormalizability, healthy free spectrum, U(1)^4 field-space organization) must be abandoned.

**Optional:** brief reframing of the underlying tension — diffeomorphism + Lorentz + locality + unitarity + perturbative renormalizability + matter coupling cannot all coexist in a Standard-Model-like framework in 4D. UG's claimed escape via U(1)^4 abelian gauge structure + TEGR equivalence does not actually work.

**Length guide:** ~600–800 words.

---

## 5. The branch fork — new tension exposed by the 2025 follow-ups

**Intent:** Highlight the most significant new structural finding from the 2025 author follow-ups — the program has split into two structurally distinct branches that the original paper blurred.

**Subsections:**

- **5.1 What arXiv:2507.07790 explicitly states** — quote verbatim the three key passages: (i) there is no equivalence transformation from UG to TEGR; (ii) the substitutions that recover TEGR break the gauge symmetry of UG; (iii) the new gauge-invariant graviton-graviton self-interaction term does not contribute to the TEGR-reduced Lagrangian.
- **5.2 The two branches** — table or descriptive comparison: Minkowski-UG branch (preserves 4×U(1), contains triple-graviton vertex, predicts 23.3%/26.7% 2PN polarization-dependent deviations from GR per arXiv:2505.14446) vs TEGR-reduced branch (recovered only by symmetry-breaking substitutions, classical GR agreement, does not contain new self-interaction).
- **5.3 The implications** — the original slogan "UG reproduces GR and predicts new nonlinear effects" is incoherent as a unified statement; the 23.3%/26.7% prediction belongs to the Minkowski-UG branch specifically, not "unified gravity" generally; the program now requires explicit branch-selection.
- **5.4 Authors' own renormalization concession** — quote verbatim from arXiv:2507.07790: *"Regarding the Feynman diagrams of UG, our extension introduces the triple-graviton vertex, whose implications to the renormalization of UG are left as a topic of further work."*

**Length guide:** ~700–900 words.

---

## 6. Four coherent descendants

**Intent:** The constructive part. Map where the program *can* go, with explicit trade-offs.

For each descendant: bare-action structure, what's preserved, what's abandoned, key references.

### 6.1 Teleparallel/tetrad effective field theory

Full local operator basis (higher-derivative + torsion-quadratic + torsion-quartic + axial-current-quartic). Preserves classical GR limit. Abandons strict perturbative renormalizability. References: Donoghue 1994 (arXiv:gr-qc/9405057); Burgess 2004 EFT review (Living Rev. Rel. 7, 5; arXiv:gr-qc/0311082).

### 6.2 New-GR teleparallel renormalization

Three independent torsion-squared coefficients (c_1, c_2, c_3) per Casadio-Kuntz-Paci 2022. Abandons exact TEGR but keeps teleparallel structure. Needs separate spectrum/stability check — Beltrán Jiménez, Heisenberg, Koivisto 2020 cautions about generic teleparallel quadratic theories having ghost / strong-coupling issues at the nonlinear level.

### 6.3 Higher-derivative curvature gravity + fakeons

Stelle 1977 (Phys. Rev. D 16, 953) + Fradkin-Tseytlin 1982 (Nucl. Phys. B 201, 469) for renormalizability + asymptotic freedom; Anselmi-Piva 2018 (arXiv:1803.07777) for fakeon prescription preserving unitarity at the cost of modified microcausality above the fakeon scale. Preserves perturbative renormalizability strongly. Abandons exact TEGR closure and standard microcausality.

### 6.4 Genuinely new Minkowski gauge theory of gravity

The gauge-invariant Minkowski-UG branch evaluated on its own merits as a distinct theory — not as a GR equivalent. Right benchmarks: healthy particle spectrum, local counterterm basis for the triple-graviton theory, viable Ward-Slavnov identities, consistent EFT expansion, experimentally viable 2PN polarization predictions. This is an open research program, not a completed quantum-gravity solution.

**Length guide:** ~1,000–1,200 words total; ~250–300 words per descendant.

---

## 7. The discourse landscape

**Intent:** Position the writeup within the existing community discussion. Show what's been said, by whom, and what remains open.

**Subsections:**

- **7.1 Author trajectory** — 5 tree-level follow-ups (arXiv:2310.02285, 2505.14446, 2506.14447, 2506.22057, 2507.07790) + 2 corrigenda. Authors iterating but not addressing the loop critique. Their July 2025 paper explicitly defers renormalization analysis.
- **7.2 Independent professional critiques**
  - **Will Barker** (Cambridge → Czech Academy), arXiv:2311.11790 — ghostly teleparallel vacuum (covered in Obstruction D).
  - **Farrukh A. Chishtie** — Chinese J. Phys. paper (DOI 10.1016/j.cjph.2026.05.001, paywalled — describes "nine interconnected structural limitations" of UGM; specific content not publicly accessible); USMEG-EFT framework paper (arXiv:2503.09796) — independent EFT-based unification reaching structurally similar conclusion via Lagrange-multiplier restriction + Appelquist-Carazzone decoupling. The framework alignment with descendant 6.1 (teleparallel/tetrad EFT) is direct corroboration.
- **7.3 Supportive tree-level check**
  - **Bouali Bensouilah**, *Canadian Journal of Physics* 2026 (DOI 10.1139/cjp-2025-0362) — tree-level photon-photon scattering in UGM reproduces the Tolman-Ehrenfest-Podolsky description. Supportive consistency check; does not touch the loop critique.
- **7.4 Popular press vs technical record** — extensive uniformly-positive popular coverage (zmescience, sciencealert, Aalto press releases, etc.) is not supported by the technical record. Worth noting honestly without snark.

**Length guide:** ~700–900 words.

---

## 8. Conclusions

**Intent:** Honest framing of what's established vs what remains open. Avoid overclaiming.

**Key statements to include (in your own framing):**

- The strict one-loop renormalizability claim of UG is not defensible within the original strict family.
- The four obstructions identified are not novel in their building blocks (Duff, Deser-vN, Casadio-Kuntz-Paci, Barnich-Brandt-Henneaux, Barker) but their combination as applied to UG is, as far as we can find, a fresh observation.
- The structural impossibility within the strict family does not mean the program is empty — four coherent descendants exist, each with explicit trade-offs.
- The 2025 author follow-ups expose a branch fork that the original paper blurred; this is a new finding worth highlighting.
- The author iteration trajectory (tree-level extensions + explicit deferral of renormalization analysis) suggests they may be moving toward descendant 6.4 (Minkowski-UG as distinct theory) without yet making the framing explicit.
- The program's experimental signature (23.3%/26.7% 2PN polarization-dependent light-deflection deviation, testable via LATOR-class missions) is a real falsifiable prediction of the Minkowski-UG branch — not of "unified gravity" as a whole.
- What's still genuinely open: the body of Chishtie 2026's specific nine structural limitations, cross-family verification of these conclusions, and the future-experimental status of the 2PN prediction.

**Length guide:** ~400–600 words.

---

## 9. References

All citations from `references.md`. Group by:
- The Partanen-Tulkki series (main + corrigenda + tree-level follow-ups)
- Classical literature anchors (Duff, Deser-vN, 't Hooft-Veltman, Stelle, Fradkin-Tseytlin, etc.)
- BRST cohomology + algebraic renormalization (Barnich-Brandt-Henneaux, Piguet-Sorella)
- Teleparallel literature (Aldrovandi-Pereira, Maluf, Casadio-Kuntz-Paci, Krššák et al., Beltrán Jiménez et al.)
- Modern QG approaches (Donoghue, Burgess, Anselmi-Piva)
- Third-party critiques (Barker, Chishtie, Bensouilah)

Standard format: author(s), year, title, journal/arxiv, DOI.

---

## Format-specific adaptations

### For Substack

- Add a hook paragraph before section 1: brief framing of why this matters, why a 2025 paper claiming "unified gravity" caught your attention, why you decided to dig in.
- Replace heavy LaTeX with simpler text or screenshots of equations.
- Add narrative transitions between sections.
- Add a "How I got here" footer or methodology section briefly explaining the AI-assisted analysis process.
- Use H2/H3 markdown headers; Substack renders these well.
- Embed key arxiv URLs as inline hyperlinks rather than footnote citations.
- Consider breaking into two parts if length exceeds ~5,000 words.

### For Zenodo PDF

- LaTeX template (standard physics article format).
- Keep equations in math mode.
- Footnote-style citations or numbered references.
- Add abstract block formally.
- Metadata: keywords, MSC/PACS codes if applicable.
- Use a license declaration (CC-BY 4.0 recommended).
- ORCID identifiers if available.

---

## Drafting workflow

Suggested order:
1. Section 2 (Introduction) — establishes scope
2. Section 3 (Four obstructions) — the technical core; drafts from R02-R03 round-doc content + references.md
3. Section 5 (Branch fork) — anchors the new structural finding
4. Section 6 (Four descendants) — drafts from R04 + R07 round-doc content
5. Section 4 (Structural impossibility) — written *after* sections 3 and 6 since it links them
6. Section 7 (Discourse landscape) — drafts from R05 round-doc + references.md
7. Section 8 (Conclusions) — written last, after the body is stable
8. Section 1 (Abstract / TL;DR) — written last, summarizes the final form
9. Section 9 (References) — assemble from `references.md`

Each section can be drafted from existing round docs without new research dispatches. The structural arguments, paper citations, and external corroborations are all already in the program's commits.

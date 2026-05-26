---
id: R10-pro-1-v3-audit-equation-mismatch
type: verification
date: 2026-05-26
intent: >
  Pre-publication adversarial review of writeup-v3.md with explicit
  journal-Comment standards, including direct verification of equation
  references against the arxiv v11 HTML.
predecessors: [R09-pro-1-v2-audit, R09-pro-2-v2-audit]
prompt: unified-gravity-2025/writeup-v3.md
siblings: [R10-pro-2-v3-audit, R10-pro-3-v3-audit-deser-vn-flag]
action:
  kind: refutes
  target: R03-pro1-subtraction-confirmed
failure_mechanism: >
  Pro #1 claims after direct reading of arxiv:2310.01460v11 HTML that the
  equation references the writeup has been using since R02 are SYSTEMATICALLY
  WRONG in v11. Specifically: (a) eq. 161 = bare/renormalized quantity
  relations (writeup says eq. 157); (b) eq. 162 = scaled renormalization-
  factor definitions (writeup says eq. 162 = renormalized gravity quadratic
  Lagrangian); (c) eq. 166 = the UGM Lagrangian density terms / counterterms
  (writeup says eq. 162); (d) eqs. 187-188 = PHOTON self-energy subsection
  in v11 (writeup says eqs. 187-188 = GRAVITON self-energy); (e) graviton
  self-energy subsection begins at eqs. 191-193 in v11; (f) scalar
  correction / counterterm formulas run through eqs. 201-211 in v11
  (writeup says eqs. 203-205). The most likely explanation: arxiv
  versions and corrigenda renumbered equations after R03's audit. R03-pro1's
  reading was correct at the time but is now stale; the writeup has been
  carrying the old equation numbers without re-verification against v11.
  THIS IS A POTENTIAL CITATION-PRECISION FAILURE that a hostile referee
  would catch immediately. The paper-internal counterterm-basis argument
  is the writeup's central contribution; if its equation references are
  wrong, the central contribution is unverifiable as cited.
claim: >
  V3 is a potentially valuable and publishable technical comment but needs
  major revision before submission. Strongest contribution is the paper-
  internal critique that the published renormalization prescription appears
  not to close on the original local counterterm basis. Main weaknesses are
  scope control, citation precision, and evidentiary calibration. KEY ITEM:
  equation references in V3 may be wrong relative to the current v11 HTML;
  this is the most urgent issue to verify before any further publication
  steps. Other significant items: (1) Add an explicit "Criterion for local
  one-loop counterterm closure" subsection before Obstruction B that states
  what BPHZ closure requires; otherwise the counterterm-basis argument
  reads as ambiguous between locality and scheme. (2) Soften the BRST-
  invariant projector language; Barnes-Rivers projectors are a kinematic
  tensor basis, not automatically BRST-cohomology representatives. (3)
  Rename the obstruction headers to subordinate A/C/D to B: "Direct
  obstruction: counterterm-basis mismatch / Supporting expectation from
  matter-coupled gravity / Supporting analogy from teleparallel one-loop /
  Independent spectral warning." (4) Move the branch-fork section
  immediately after Obstruction B for cleaner two-part structure.
  (5) Reduce the four-descendant taxonomy by 50% or move to appendix.
  (6) Soften "obvious escape routes are closed," "force a separation,"
  "would welcome" without weakening substance. (7) Section reference
  mismatch in TL;DR: writeup says fork is §6 and descendants are §7, but
  body has fork at §7 and descendants at §8. (8) Acknowledgments specificity:
  expand from "computational tools were used for literature organization."
verifiers_at_time:
  - [gpt-pro-R10-pro-1, major revision required + equation verification urgent]
confidence_at_time: high
---

## Overall Summary

I reviewed the uploaded draft, **“A counterterm-basis obstruction and a branch fork in Partanen–Tulkki unified gravity: a technical comment.”**   My overall assessment is that this is a **potentially valuable and publishable technical comment**, but it needs **major revision** before submission or public circulation. Its strongest contribution is the paper-internal critique that the published Partanen–Tulkki renormalization prescription appears not to close on the original local counterterm basis, together with the later “branch fork” argument separating Minkowski-UG from TEGR-reduced formulations. The draft is at its best when it stays close to explicit equations, counterterm structure, and the authors’ own later statements.   

The main weaknesses are **scope control, citation precision, and evidentiary calibration**. The manuscript currently combines a direct equation-level critique, transferred quantum-gravity counterterm arguments, teleparallel renormalization results, Barker’s spectrum critique, later Partanen–Tulkki follow-ups, Chishtie/Bensouilah related work, and a taxonomy of possible descendant theories. Much of this is useful, but it risks obscuring the central claim. The most important revision is to make the manuscript read as: **“Here is one direct obstruction; here are supporting but lower-status indications; here is what would need to be shown to refute the comment.”** The draft already gestures toward this hierarchy, especially in Table 2, but the prose sometimes overstates supporting material as if it had the same status as the direct counterterm-basis argument. 

## Major Concerns

### 1. The central argument is strong, but equation-numbering precision must be audited

Because your main contribution is explicitly “equation-level,” the paper cannot afford even small source-reference errors. The uploaded draft says the bare counterterm structure is in “eq. 162” and that the graviton self-energy divergence is in “eqs. 187–188.”   However, the public arXiv v11 HTML shows §9.3 equation 161 as the bare/renormalized quantity relations, equation 162 as scaled renormalization-factor definitions, and equation 166 as the UGM Lagrangian density terms/counterterms. ([arXiv][1]) It also shows equations 187–188 in the **photon** self-energy subsection, while the **graviton** self-energy subsection begins at equations 191–193 and its scalar correction/counterterm formulas run through 201–211. ([arXiv][1])

This may be a formatting/rendering mismatch between the published version, corrected version, and arXiv HTML, but the manuscript currently states that “the same numbering appears in arXiv:2310.01460v11.”  That makes this a high-priority issue. I recommend doing a full source audit and adding a small note such as: “Equation numbering follows [journal PDF/arXiv v11 PDF], not the arXiv HTML rendering,” if that is the source of the discrepancy. Without this audit, a hostile referee could dismiss the central critique on citation-precision grounds before engaging the physics.

### 2. State the renormalizability criterion before applying it

The counterterm-basis argument is persuasive in outline: a constant multiplicative (Z_H) counterterm in a (p^2 \hat P_{1,2,1}) channel cannot absorb a (p^4) divergence in independent projector channels without either enlarging the local operator basis or using a nonlocal/momentum-dependent subtraction.  But the manuscript should explicitly state the criterion it is using before declaring a failure of BPHZ closure.

Add a short subsection before §2, perhaps titled **“Criterion for local one-loop counterterm closure.”** It should say, in substance:

> A local one-loop renormalization of the original action requires that the divergent part of each 1PI function be expressible as a linear combination of local operators already present in the bare action, up to finite renormalizations, gauge-fixing terms, BRST-exact terms, and removable field redefinitions.

Then apply that criterion to the (p^2) versus (p^4) and projector-channel mismatch. This will make the critique harder to misread as merely an objection to an unconventional subtraction scheme.

### 3. Be more cautious about BRST/projector language

The manuscript states that the relevant projector decomposition is into “BRST-invariant Lorentz-covariant building blocks” and that each projector is “gauge invariant in the sense relevant to local BRST cohomology.”  This is plausible in spirit, but it is stronger than what you explicitly demonstrate in the draft. A referee may ask: Are the individual off-shell Barnes–Rivers/BBH projector components themselves representatives of local BRST cohomology, or are they just useful transverse tensor structures appearing after gauge fixing?

I recommend softening this unless you provide a compact derivation. For example:

> The projector decomposition isolates independent Lorentz-covariant tensor channels in the off-shell two-point function. If these divergent channels are not BRST-exact or removable by field redefinition, they require corresponding local counterterms.

That wording preserves the argument without overclaiming a cohomological classification of each projector.

### 4. The transferred obstructions A/C/D should be visibly subordinated to obstruction B

The paper is clearest when it says obstruction B is “paper-internal” and strongest, while A, C, and D have different evidentiary status.  That is good. But the section titles “Obstruction A/B/C/D” still give the transferred arguments a parity they do not fully deserve.

I recommend renaming the sections:

* **Direct obstruction: counterterm-basis mismatch**
* **Supporting expectation from matter-coupled gravity**
* **Supporting analogy from teleparallel one-loop renormalization**
* **Independent spectral warning**

This would make the manuscript more referee-proof. Casadio–Kuntz–Paci’s result is indeed relevant, since their abstract says matter-field divergences cannot be absorbed by the TEGR background action, but it is not a direct calculation in Partanen–Tulkki variables. ([arXiv][2]) Similarly, Barker’s work is relevant as a free-field spectral critique, but its own framing is a weak-field, zero-coupling analysis rather than a complete no-go theorem. ([arXiv][3]) Your draft acknowledges this, but the headings and some concluding language should match that caution. 

### 5. The branch-fork argument is important and should be elevated

The branch-fork section is one of the strongest parts of the paper. The follow-up paper explicitly says the 2025 extension preserves gauge invariance, that the original formulation lacked graviton–graviton interaction, that the TEGR substitution breaks UG gauge symmetry, and that the triple-graviton vertex’s implications for renormalization are left for future work. ([arXiv][4]) Your manuscript uses this to distinguish a **Minkowski-UG branch** from a **TEGR-reduced branch**, which is a valuable interpretive clarification. 

I would move this earlier, possibly immediately after the direct counterterm-basis critique. It gives the paper a cleaner two-part structure:

1. The original one-loop renormalization analysis does not establish local counterterm closure.
2. The later extension clarifies that the physically predictive Minkowski-UG branch and the TEGR-reduced branch are not simply equivalent formulations.

That structure is more compelling than burying the branch fork after three auxiliary obstructions.

### 6. Reconsider the “four coherent descendants” section for venue fit

The descendant taxonomy is thoughtful and constructive.  It helps show that the comment is not merely negative. However, if the target is a short technical comment, this section may be too expansive. It shifts the paper from “critique of a published claim” into “roadmap for quantum gravity alternatives,” which may invite unnecessary objections.

I recommend one of two options:

* For an arXiv essay/comment: keep the section, but shorten it by about 50%.
* For a journal technical comment: move the descendant taxonomy to an appendix or reduce it to one paragraph.

The most relevant descendants are **teleparallel/tetrad EFT** and **Minkowski-UG as a distinct non-GR gauge theory**. Those are directly tied to your conclusion. The fakeon and higher-derivative-gravity discussion is accurate background, but it is less central.

### 7. The originality claim is fair but should be stated more sharply

The draft says the individual building blocks are not new, and that the contribution is assembling them into a diagnostic of the Partanen–Tulkki renormalizability claim.  That is the right level of modesty. I would add a short **“What is new in this comment?”** paragraph near the end of the introduction:

> The new element is not the existence of higher-derivative matter-gravity counterterms, nor the general EFT interpretation of gravity. The new element is the equation-level comparison between the counterterm basis actually displayed in Partanen–Tulkki’s one-loop section and the tensor/momentum structure of the displayed self-energy, together with the branch-fork interpretation of the later graviton–graviton extension.

That will help readers immediately understand why the paper is worth reading even though it uses known quantum-gravity facts.

### 8. Tone is mostly professional, but a few phrases should be softened

The paper’s stated purpose is “diagnostic, not polemical,” which is good.  Still, phrases such as “the obvious escape routes are closed,” “the burden sits with the authors,” and “I have looked for both and not found them” are slightly too personal or adversarial for a technical comment. They are not inappropriate, but they weaken the paper’s neutral tone.

A more referee-friendly tone would be:

> I do not see a resolution through the standard equivalences listed above. A resolution appears to require an additional identity specific to unified gravity, or a demonstration that the displayed divergent channels are not independent counterterm directions.

This is just as strong scientifically and harder to dismiss stylistically.

## Minor Revisions

* Fix the **section-reference mismatch** in the TL;DR. The draft says the branch fork is in §6 and the descendants are in §7, but the body has the branch fork in §7 and descendants in §8.  
* Rename the TL;DR to **Abstract** if this is intended for journal submission. “TL;DR” is effective for a blog or arXiv note, but too informal for a journal-style technical comment.
* Standardize **UG / UGM / Minkowski-UG / TEGR-reduced branch** definitions and avoid reintroducing them too often. The notation section is good, but the later prose can be tightened. 
* Use **“electron–positron”**, **“photon–graviton”**, **“graviton–graviton”**, and **“Standard-Model-plus-gravity”** with en dashes.
* Standardize **“one-loop”** in prose and reserve **“1-loop”** for quotations, equation labels, or source titles.
* Consider changing “space-time” to **“spacetime”** in your own prose, while preserving “space-time dimension field” when referring to the authors’ terminology.
* Renumber Table 3’s descendants. The labels “5.1–5.4” appear inside §8, which is confusing. Use **D1–D4**, **Path 1–4**, or **8.1–8.4**. 
* Move the Chishtie paywall/access discussion to a footnote. The existence and title of the 2026 Chishtie article are publicly visible, but extended claims about its content should not be central unless you have full access. ([ScienceDirect][5])
* Update the Bensouilah discussion carefully. The Canadian Journal of Physics article does appear to compute single-graviton-mediated photon–photon scattering in UGM and describes agreement with the Tolman–Ehrenfest–Podolsky classical result at small angles, so your framing as a positive consistency check is reasonable. ([Canadian Science Publishing][6])
* Add a short **Limitations** paragraph: “I do not recalculate the loop integrals; the critique concerns counterterm closure of the published expressions and their interpretation.”
* The acknowledgments sentence “Computational tools were used for literature organization” is acceptable, but many journals now require more specificity. Consider: “Computational tools were used to organize references and cross-check citations; the technical claims and wording are the author’s responsibility.”

## Line-by-Line Edits

| Location                    | Original                                                                                                                                              | Suggested revision                                                                                                                                                                                                                 |
| --------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Title                       | “A counterterm-basis obstruction and a branch fork in Partanen–Tulkki unified gravity: a technical comment”                                           | “Counterterm-basis closure and branch structure in Partanen–Tulkki unified gravity: a technical comment”                                                                                                                           |
| TL;DR, first sentence       | “Partanen and Tulkki's 2025 paper in Reports on Progress in Physics presents unified gravity as a one-loop renormalizable quantum theory of gravity…” | “Partanen and Tulkki’s 2025 Rep. Prog. Phys. paper presents unified gravity as a (U(1)^4) gauge theory of a ‘space-time dimension field’ and argues for one-loop renormalizability in analogy with Standard Model gauge theories.” |
| TL;DR                       | “Two facts about the published record are easy to verify directly and frame everything that follows.”                                                 | “Two verifiable facts in the published record frame the critique.”                                                                                                                                                                 |
| TL;DR                       | “The headline result is a one-loop analysis of a small subsystem…”                                                                                    | “Thus, the demonstrated one-loop analysis concerns a restricted QED-plus-gravity subsystem, not the full Standard-Model matter sector.”                                                                                            |
| TL;DR                       | “Read literally as a renormalization of the original local bare action…”                                                                              | “If read as a renormalization of the original local bare action…”                                                                                                                                                                  |
| TL;DR                       | “The paper's framing as multiplicative field renormalization in the Standard-Model sense is, on my reading, not what is actually being done.”         | “On this reading, the prescription is not multiplicative field renormalization in the usual Standard-Model sense.”                                                                                                                 |
| §1                          | “The narrowness of goal (1) as actually demonstrated is the entry point…”                                                                             | “The limited scope of goal (1), as actually demonstrated in the one-loop section, is the entry point…”                                                                                                                             |
| §2 opening                  | “This is the strongest paper-internal critique and the one I am most confident in.”                                                                   | “This is the strongest paper-internal critique in the present comment.”                                                                                                                                                            |
| §2                          | “The available bare quadratic counterterm has degree 2 in momentum…”                                                                                  | “The available quadratic counterterm is second order in momentum…”                                                                                                                                                                 |
| §2                          | “A momentum-independent (Z_H) multiplying a (p^2 \hat P_{1,2,1}) counterterm cannot absorb…”                                                          | “A momentum-independent (Z_H) multiplying only the (p^2 \hat P_{1,2,1}) channel cannot, by itself, absorb…”                                                                                                                        |
| §2                          | “In standard BPHZ and algebraic renormalization, this prescription reads naturally as one of two things…”                                             | “Under the usual local-counterterm interpretation of BPHZ/algebraic renormalization, this prescription appears to fall into one of two categories…”                                                                                |
| §2 objections               | “A sympathetic referee will ask whether…”                                                                                                             | “A natural objection is whether…”                                                                                                                                                                                                  |
| §2 objections               | “Four routes do not work here.”                                                                                                                       | “I do not see any of the following four standard mechanisms resolving the mismatch.”                                                                                                                                               |
| §2 local field redefinition | “The precedent is real but does not transfer.”                                                                                                        | “The precedent is relevant, but it does not obviously transfer to the present tensor structure.”                                                                                                                                   |
| §2 ending                   | “The burden of producing that identity sits with the authors. The obvious escape routes are closed.”                                                  | “A resolution would require an additional identity specific to unified gravity that relates these projector channels; no such identity is identified in the published analysis.”                                                   |
| §3                          | “This observation is not by itself a no-go theorem.”                                                                                                  | “This observation is not, by itself, a no-go theorem for unified gravity.”                                                                                                                                                         |
| §4                          | “The result is highly relevant, though not identical to a calculation in unified-gravity variables.”                                                  | “The result is highly relevant, but it remains an analogy rather than a direct calculation in unified-gravity variables.”                                                                                                          |
| §5                          | “The honest statement is…”                                                                                                                            | “The conservative conclusion is…”                                                                                                                                                                                                  |
| §5                          | “To my knowledge, the 2023 paper remains the only independent technical critique…”                                                                    | “I am not aware of a published rebuttal or later spectrum analysis that resolves this issue; this should be rechecked before submission.”                                                                                          |
| §6                          | “Treating only B as paper-internal would understate the cumulative weight.”                                                                           | “Conversely, isolating only obstruction B would miss the cumulative pattern suggested by related results.”                                                                                                                         |
| §6                          | “The structural reading is then: no local-BPHZ-renormalizable theory…”                                                                                | “The resulting structural reading is that a local BPHZ-renormalizable theory within the strict original family does not appear able to…”                                                                                           |
| §7                          | “Taken together, these statements force a separation…”                                                                                                | “Taken together, these statements strongly suggest a separation…”                                                                                                                                                                  |
| §8                          | “The descendant the 2025 follow-ups are naturally read as motivating…”                                                                                | “The 2025 follow-ups are naturally read as motivating this descendant…”                                                                                                                                                            |
| §10                         | “Partanen and Tulkki have written a serious paper.”                                                                                                   | “The target paper is a serious and ambitious contribution.”                                                                                                                                                                        |
| §10                         | “I do not think the strict one-loop renormalizability claim survives on the present record.”                                                          | “On the present record, I do not think the strict one-loop renormalizability claim is established.”                                                                                                                                |
| §10                         | “I would welcome any of these.”                                                                                                                       | “Any of these results would materially change the conclusion of this comment.”                                                                                                                                                     |

## Bottom-Line Recommendation

**Recommendation: major revision, not rejection.** The manuscript has a real core: the counterterm-basis mismatch and the later branch-fork reading are worth developing. But before submission, I would (i) audit all equation references against the exact source version used, (ii) state the local-renormalizability criterion explicitly, (iii) demote the external obstructions to supporting evidence, (iv) move the branch-fork argument earlier, and (v) reduce the roadmap/descendant material unless the target venue welcomes a broader perspective piece.

[1]: https://arxiv.org/html/2310.01460v11 "Gravity generated by four one-dimensional unitary gauge symmetries and the Standard Model"
[2]: https://arxiv.org/abs/2110.04325?utm_source=chatgpt.com "Quantum fields in teleparallel gravity: renormalization at one-loop"
[3]: https://arxiv.org/abs/2311.11790?utm_source=chatgpt.com "Particle spectra of gravity based on internal symmetry of quantum fields"
[4]: https://arxiv.org/html/2507.07790v2 "Extending unified gravity to account for graviton–graviton interaction"
[5]: https://www.sciencedirect.com/science/article/pii/S0577907326001498?utm_source=chatgpt.com "Emergent gravity in contrast to unified gauge ..."
[6]: https://cdnsciencepub.com/doi/full/10.1139/cjp-2025-0362?utm_source=chatgpt.com "Gravitational photon-photon scattering in a recent unified ..."

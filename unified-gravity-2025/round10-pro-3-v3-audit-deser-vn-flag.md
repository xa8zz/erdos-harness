---
id: R10-pro-3-v3-audit-deser-vn-flag
type: verification
date: 2026-05-26
intent: >
  Pre-publication adversarial review of writeup-v3.md including direct check
  of the Deser-van Nieuwenhuizen counterterm dimension and the BRST-projector
  language.
predecessors: [R09-pro-1-v2-audit, R09-pro-2-v2-audit]
prompt: unified-gravity-2025/writeup-v3.md
siblings: [R10-pro-1-v3-audit-equation-mismatch, R10-pro-2-v3-audit]
action:
  kind: refutes
  target: R02-pro-1-weyl-sq-counterterm
failure_mechanism: >
  Pro #3 flags a likely physics-level misstatement in Obstruction A that
  has propagated through the writeup since R02. The writeup claims the
  Einstein-Dirac one-loop divergence is an "axial-current quartic"
  (psibar gamma^a gamma_5 psi)^4 -- described as an "eight-spinor"
  dimension-12 operator. Pro #3 argues the well-known one-loop Einstein-
  Dirac divergence is a FOUR-fermion divergence of the schematic form
  (psibar gamma^mu gamma_5 psi)(psibar gamma_mu gamma_5 psi), i.e. (J_5)^2,
  which is dimension 6 (quartic in fermions), not an eight-fermion
  dimension-12 operator. The phrase "fourth power of the axial-vector
  current" in the Deser-vN 1974 abstract is ambiguous between (a) literal
  fourth power of the current operator J_5^mu = psibar gamma^mu gamma_5 psi
  (which gives 8 spinors / dim 12) and (b) "quartic in fermion fields"
  (which gives 4 spinors / dim 6 if the operator is (J_5)*(J_5) = J^mu J_mu).
  The (J_5)^2 reading is the standard modern interpretation in QFT
  literature, but the original Deser-vN paper's abstract is ambiguous.
  WHICHEVER reading is correct, the writeup must be either (a) verified
  against the original paper and made precise, or (b) acknowledged as
  ambiguous. Currently the writeup overclaims a specific dimension-12
  operator without verification.
claim: >
  V3 is well-motivated, unusually concrete for a comment, and anchors its
  main critique in the target paper's internal equation set. Main areas
  needing improvement: (1) tighten and clarify the renormalization-theory
  "rules of the game" -- state explicitly what BPHZ closure requires (local
  polynomials in momenta, no p-dependent Z) before applying it; preempt the
  rebuttal "they're just using a momentum subtraction scheme" by noting
  that MOM scheme still yields constants at a renormalization point, not
  Z(p^2). (2) Fix likely serious physics-level misstatement in Obstruction
  A: the Deser-van Nieuwenhuizen counterterm is likely (J_5)^2 dim-6, not
  (J_5)^4 dim-12. (3) BRST-invariant projector language too strong --
  Barnes-Rivers projectors are kinematic tensor basis, not automatically
  BRST cohomology representatives; soften to "linearly independent
  Lorentz-covariant tensor channels in the off-shell two-point function."
  (4) Obstruction A needs more careful transfer statement (metric divergence
  C^2 -> (partial F)^2 in U(1)^4 variables); currently treated as automatic.
  (5) Obstruction C should be more conditional. (6) Branch fork compelling
  but needs section / paragraph context for 2507.07790 quotes; "force a
  separation" -> "strongly suggest a separation." (7) Section 8 subsections
  labeled 5.1-5.4 should be 8.1-8.4 (formatting error). (8) Tone: "obvious
  escape routes are closed," "I do not think the strict claim survives,"
  "I would welcome any of these" need softening. PROVIDED 20-item table of
  original-vs-suggested wording for title, TL;DR bullets, Obstruction B
  opening, mismatch sentence, BPHZ dichotomy, escape-routes paragraph,
  Weyl-squared transfer, Deser-vN fix (MOST IMPORTANT), BRST projector
  language, gauge-artifact paragraph, descendants numbering renumber to
  D1-D4 or 8.1-8.4.
verifiers_at_time:
  - [gpt-pro-R10-pro-3, major revision required + physics correction needed]
confidence_at_time: high
---

According to a document from **2026-05-26**, your manuscript is a **technical comment** arguing that (i) Partanen–Tulkki’s published “one-loop renormalizability” demonstration is limited to an electron–photon–gravity subsystem and (ii) even within that subsystem, the paper’s own formulas exhibit a **counterterm-basis mismatch** that is resolved only by allowing a momentum-dependent “renormalization constant,” which (as you emphasize) is not standard local BPHZ closure of the original action.  

Below is a referee-style review focused on clarity/flow, methodology, results/interpretation, tone/formatting, and originality/impact.

---

## Overall Summary

The manuscript is well-motivated and, in its strongest sections, unusually concrete for a “comment”: it anchors its main critique in the **target paper’s internal equation set** (your Obstruction B, with Table 1), rather than relying solely on general lore about gravity + matter loops.  The core claim—that a **constant** multiplicative wavefunction renormalization cannot absorb a **(p^4)** divergence appearing in independent Barnes–Rivers projector channels—is, in spirit, aligned with standard renormalization logic and is presented in a way that a technical reader can audit.

The main areas needing improvement are (1) **tightening and clarifying the renormalization-theory “rules of the game”** (what exactly you mean by “BPHZ closure” in this context, and what you are assuming about locality/polynomiality of counterterms), (2) **fixing at least one likely serious physics-level misstatement** in Obstruction A (see below on the Deser–van Nieuwenhuizen “axial-current quartic”), and (3) strengthening the imported/analogical obstructions (A/C/D) with sharper caveats and/or a more explicit mapping into the Partanen–Tulkki variable set. 

---

## Major Concerns

### 1) Obstruction B is strong, but you should formalize the “allowed counterterms” criterion (and separate scheme from locality)

Your Obstruction B argues: bare action offers only a (p^2 \hat P_{1,2,1}) counterterm via constant (Z_H), but the computed one-loop self-energy carries (\sim p^4) divergences in multiple independent projector channels; therefore a constant (Z_H) cannot cancel; then the target paper effectively introduces (p)-dependent (\delta Z_H^{(1)}), which you interpret as either (i) enlarging the local operator basis (EFT) or (ii) nonlocal subtraction outside BPHZ. 

This is plausible and likely correct *as a diagnostic*. But to make it referee-proof, I recommend adding a short “renormalization criterion” box:

* **State explicitly**: in local renormalization (BPHZ/algebraic), counterterms are **local polynomials** in momenta (or derivatives) compatible with symmetries; thus renormalization constants depend on (\mu), couplings, masses, gauge parameters, but **not** on the external momentum (p) as a variable.
* Then argue: the target paper’s subtraction conditions (at (p^2=0) and (p^2\to\infty)) and the resulting (p)-dependent (\delta Z_H^{(1)}) are not merely a choice of renormalization scheme; they encode **nonlocal dependence** (or equivalently an infinite tower of higher-derivative operators).

Right now, the logic is mostly there, but you should preempt a common rebuttal: “they’re just using a momentum subtraction scheme.” A MOM scheme still yields **constants** defined at a renormalization point; it does *not* treat (Z) as a function (Z(p^2)) unless one is defining a running form factor / resummation outside standard local counterterms.

### 2) Possible correctness issue: the Deser–van Nieuwenhuizen counterterm is likely ((J_5^\mu J_{5\mu})), not ((J_5)^4)

In Obstruction A you write that Einstein–Dirac at one loop produces an “axial-current quartic” ((\bar\psi \gamma^a\gamma_5\psi)^4), which you describe as an “eight-spinor” dimension-12 operator, and you cite Deser–van Nieuwenhuizen (1974). 

This is a major red flag: the well-known one-loop issue in Einstein–Dirac is a **four-fermion** divergence, typically of the schematic form
[
(\bar\psi \gamma^\mu \gamma_5 \psi)(\bar\psi \gamma_\mu \gamma_5 \psi),
]
i.e. ((J_5)^2), which is **dimension 6** (quartic in fermions), not an eight-fermion dimension-12 operator. It’s very plausible you intended “quartic in fermions” but wrote “quartic in the axial current.”

Why this matters: if the operator is actually ((J_5)^2), your argument becomes *stronger and cleaner* (it is a minimal-dimension counterterm consistent with symmetries), but your current text may be criticized as simply mistaken or careless with operator dimension counting.

Recommendation: re-check the Deser–van Nieuwenhuizen result and fix the expression and discussion. If you *do* mean an eight-fermion operator specific to the Partanen–Tulkki eight-spinor formalism, you must justify why the mapping produces eight fermions rather than four.

### 3) The “BRST-invariant projector” language is too strong without support

You write that the projector decomposition is into “BRST-invariant Lorentz-covariant building blocks,” and that “each projector is gauge invariant in the sense relevant to local BRST cohomology.” 

This is likely to attract pushback because:

* Barnes–Rivers projectors are a **kinematic tensor basis** for symmetric tensors at fixed momentum; they are not automatically representatives of BRST cohomology classes.
* In gauge-fixed gravity, the 1PI two-point function generally contains gauge-parameter-dependent pieces; BRST invariance constrains the *structure* but one must be careful in claiming any given tensor basis element is “BRST invariant.”

Suggestion: soften and clarify. For example:

* Replace “BRST-invariant projectors” with “standard transverse/longitudinal tensor projectors” and say explicitly what you need: **linear independence** of the tensor structures off-shell, and incompatibility with a single (p^2) counterterm.
* If you truly want the BRST/cohomology claim, add a short justification or citation to algebraic renormalization texts (and be explicit about what symmetry is being BRST-quantized in the Partanen–Tulkki setup).

### 4) Obstruction A needs a more careful “transfer” statement (metric divergences → U(1)(^4) variables)

You assert that the Weyl-squared divergence in a gravity background “pulls back to a four-derivative ((\partial F)^2) operator of mass dimension 6 in the (U(1)^4) gauge variables” under the weak-field map (g_{\mu\nu}=\eta_{\mu\nu}+\sqrt{\kappa}h_{\mu\nu}[A]). 

This may be correct, but you currently treat it as almost automatic. Since this is a comment aimed at diagnosing a *specific* construction, I recommend adding:

* A brief schematic derivation: “Since (C^2\sim (\partial\partial h)^2 +\cdots), and if (h) depends linearly on (A) without inverse derivatives, then (C^2) induces ((\partial\partial A)^2\sim (\partial F)^2).”
* Or, if (h[A]) involves derivatives/inverses, say so and adjust the counting.

This would also help align Obstruction A with Obstruction B: right now B already demonstrates a (p^4) divergence internally; A then feels slightly redundant unless you explain what additional content A contributes (i.e., the *full* SM sector and cohomological admissibility).

### 5) Obstruction C (teleparallel non-closure) is relevant but should be framed more conditionally

You are careful to label it “strong by analogy,” but the text still reads somewhat like a direct obstruction. 

The key risk is mismatch of assumptions:

* Casadio–Kuntz–Paci analyze specific couplings/teleparallel setups; Partanen–Tulkki may differ in how local Lorentz symmetry is handled, what is treated as fundamental, and what is gauge-fixed.

Suggestion: explicitly state what would make C decisive:

* “If the TEGR-reduced branch is treated as an off-shell identification at the quantum level with standard minimal matter coupling, then known one-loop results indicate radiative instability of the TEGR ratio…”
  This keeps the critique tight and fair.

### 6) Branch fork argument is compelling but needs tighter sourcing/context and slightly more cautious inference

You quote four sentences from arXiv:2507.07790 and infer a forced separation into “Minkowski-UG branch” vs “TEGR-reduced branch,” with implications for both phenomenology and renormalization. 

Two suggestions:

1. Add *where* in 2507.07790 those statements occur (section number, or paragraph context). Otherwise a skeptical reader may suspect cherry-picking.
2. Be careful about the inference “connected to GR only through a substitution that breaks gauge symmetry.” That may still allow physical equivalence in a broader sense (field redefinition + gauge-fixing + constraint elimination). You likely think it does *not*, but you should phrase it as an interpretive conclusion and indicate what would falsify it.

### 7) Internal consistency/numbering: “§8 Four coherent descendants” labels them “5.1–5.4”

This is a straightforward but important presentation flaw: Table 3 and the subsequent subsections are numbered 5.1–5.4 even though they occur after §7 in this manuscript. 

Fixing this will reduce friction and make the paper feel more polished (and less “preprint-y”).

### 8) Tone: a few sentences are rhetorically punchy in ways referees may flag as overconfident

Examples include “The obvious escape routes are closed” and “I do not think the strict claim survives…”  

Your overall tone is quite measured (“diagnostic, not polemical”), but you can retain force while sounding more academically neutral by switching to:

* “The standard escape routes appear not to resolve the mismatch under the assumptions stated…”
* “The present record does not, in my view, establish…”

This matters if you want the comment to be hard to dismiss on tone grounds.

---

## Minor Revisions

* **Define your “Obstruction labels” once, early.** You use A/B/C/D, then “Goal (1) narrowness,” plus “fork.” Consider a small “roadmap table” right after TL;DR.
* **Notation consistency:** You alternate between (H_{a\mu}), (H_{\rho\mu\nu}), and (H^{\mu\nu}) as “the field” in the same paragraph. Consider adding a one-line clarification: “I denote the gauge potential by (H_{a\mu}) and the graviton fluctuation by (h_{\mu\nu})…”
* **Acronyms:** You define BPHZ/BRST/TEGR/1PI/2PN—good. Add “MOM” if you discuss momentum subtraction explicitly (recommended).
* **Table formatting:** Table 1 is effective. Consider adding one extra row: “Corresponding local operator” (e.g., curvature-squared) to help readers connect to standard EFT language. 
* **References:** If possible, standardize arXiv references with version or year/month. Some recent items (2026 DOIs) may change; consider adding “(in press)”/“accepted” consistently.
* **Paywalled-source discussion:** The Chishtie paragraph is honest, but the “ScienceDirect blocks full access” remark might be read as editorializing. You could compress to: “Full text not consulted; only metadata/snippets; not relied upon.” 
* **Claim scoping:** When you say “none has been published” about spectrum demonstration, consider “to my knowledge” and define what counts as “published” (peer-reviewed vs arXiv).

---

## Line-by-Line Edits

Below are exact rewrites for sentences that are either (i) ambiguous, (ii) overly assertive, or (iii) likely to trigger referee objections. I quote your sentence and give a proposed replacement.

1. **Title**

* Original: “A counterterm-basis obstruction and a branch fork in Partanen–Tulkki unified gravity: a technical comment”
* Suggest: “A counterterm-basis mismatch and a branch fork in Partanen–Tulkki unified gravity: a technical comment”
  (Reason: “mismatch” is slightly more standard/neutral than “obstruction,” while still strong.)

2. **TL;DR, first bullet**

* Original: “First, the paper's own §9.2 restricts its one-loop renormalization analysis to the Dirac electron-positron field, the electromagnetic field, and the gravitational field.”
* Suggest: “First, §9.2 of the target paper explicitly limits the one-loop renormalization analysis to the electron–positron (Dirac), electromagnetic, and gravitational sectors.” 

3. **TL;DR, second bullet (BPHZ framing)**

* Original: “Second, the paper's published renormalization prescription is not standard BPHZ closure of the original local action.”
* Suggest: “Second, the published subtraction prescription does not appear to implement local BPHZ (or algebraic) renormalization *within the original two-derivative local operator basis*.” 

4. **TL;DR, “read literally” sentence**

* Original: “Read literally as a renormalization of the original local bare action, this is either local enlargement of the operator basis … or nonlocal propagator-level subtraction…”
* Suggest: “Interpreted as a renormalization of a fixed local bare action with finitely many couplings, the prescription amounts either to (i) adding higher-derivative local operators (EFT-style enlargement), or (ii) performing a momentum-dependent propagator-level subtraction that is nonlocal in position space.” 

5. **Section 1, notation**

* Original: “I use UG for the construction in general; UGM for the Minkowski-metric formulation specifically…”
* Suggest: “I use UG for the overall construction; UGM for the Minkowski-metric formulation used in the one-loop section of the target paper; ‘Minkowski-UG branch’ for the gauge-invariant branch emphasized in later work; and ‘TEGR-reduced branch’ for the symmetry-breaking TEGR substitution.” 

6. **Obstruction B opening**

* Original: “This is the strongest paper-internal critique and the one I am most confident in.”
* Suggest: “This is the most direct paper-internal critique, since it depends only on the target paper’s displayed counterterms and one-loop two-point function.” 

7. **Key mismatch sentence**

* Original: “A momentum-independent (Z_H) multiplying a (p^2 \hat P_{1,2,1}) counterterm cannot absorb a (p^4 \hat P_{3,2,1}) divergence.”
* Suggest: “A momentum-independent wavefunction renormalization (Z_H) produces only a (p^2) counterterm in the (\hat P_{1,2,1}) channel; it cannot cancel a (p^4) divergence appearing in an independent projector channel such as (\hat P_{3,2,1}).” 

8. **After Table 1 (“lets δZ_H become momentum dependent”)**

* Original: “and let (\delta Z_H^{(1)}) become explicitly momentum dependent…”
* Suggest: “and thereby defines an effective (\delta Z_H^{(1)}) that depends on the external momentum invariant (p^2) (not only on (\mu), couplings, and masses).” 

9. **BPHZ dichotomy**

* Original: “In standard BPHZ and algebraic renormalization, this prescription reads naturally as one of two things…”
* Suggest: “In standard local renormalization (BPHZ/algebraic), counterterms are local polynomials in derivatives; under that criterion, the prescription is naturally interpreted as either… [your (i)/(ii)].” 

10. **Gauge artifact paragraph**

* Original: “Each projector is gauge invariant in the sense relevant to local BRST cohomology.”
* Suggest: “The decomposition uses the standard off-shell Barnes–Rivers tensor basis; the key point for the present argument is the linear independence of the projector channels off-shell, not a claim that each basis element is separately BRST-closed.” 

11. **“Obvious escape routes are closed”**

* Original: “The obvious escape routes are closed.”
* Suggest: “Under the assumptions made here, these standard escape routes do not seem to resolve the mismatch.” 

12. **Obstruction A: Weyl-squared mapping**

* Original: “Under the paper's weak-field map … this pulls back to a four-derivative ((\partial F)^2) operator…”
* Suggest: “Under the weak-field map (g=\eta+\sqrt\kappa,h[A]), a curvature-squared counterterm such as (C^2\sim(\partial\partial h)^2+\cdots) generically induces four-derivative operators in the underlying gauge variables (schematically ((\partial F)^2) if (h) depends locally on (A)).” 

13. **Obstruction A: Deser–van Nieuwenhuizen sentence (must fix)**

* Original: “produces an irreducible axial-current quartic, ((\bar\psi\gamma^a\gamma_5\psi)^4)…”
* Suggest (pending your check): “produces an irreducible four-fermion counterterm proportional to ((\bar\psi\gamma^a\gamma_5\psi)(\bar\psi\gamma_a\gamma_5\psi))… [cite].” 
  *Note: this is not merely style; it is likely a substantive correction.*

14. **BRST “does not forbid them; it allows them.”**

* Original: “BRST does not forbid them; it allows them.”
* Suggest: “These operators are compatible with the symmetries and appear as admissible ghost-number-zero counterterms in the local BRST cohomology classification.” 

15. **Obstruction C: off-shell stability**

* Original: “requires the reduction to hold off-shell at the quantum level, or it is not a stable identification.”
* Suggest: “If the TEGR identification is intended as an off-shell equivalence of quantum theories (not merely a classical gauge choice), radiative corrections must preserve the TEGR parameter relations; otherwise the identification is not stable under renormalization.” 

16. **Obstruction D: “Ghosts are unavoidable”**

* Original: “Ghosts are unavoidable; no consistent choice of (\kappa) makes all seven polarizations healthy simultaneously.”
* Suggest: “Within Barker’s weak-field, zero-coupling spectrum analysis, no single sign choice of (\kappa) yields healthy kinetic terms for all propagating modes; this should be read as a warning conditional on the assumptions of that limit.” 

17. **Evidence-status table commentary**

* Original: “Strong by analogy.”
* Suggest: “Suggestive by analogy (not a direct calculation in the Partanen–Tulkki variables).” 
  (Reason: reduces potential reviewer friction.)

18. **Branch fork: “force a separation”**

* Original: “Taken together, these statements force a separation…”
* Suggest: “Taken together, these statements strongly suggest a separation…” 
  (Reason: “force” invites semantic counterarguments.)

19. **Branch fork: “connected to GR only through a substitution”**

* Original: “They are predictions of a theory connected to GR only through a substitution that breaks the gauge symmetry.”
* Suggest: “They are predictions of the gauge-invariant Minkowski-UG branch; the relation to GR proceeds via substitutions that the follow-up describes as gauge-symmetry-breaking.” 

20. **Descendants numbering**

* Original: “5.1 Teleparallel / tetrad effective field theory” (in §8)
* Suggest: “D1 Teleparallel/tetrad effective field theory” (and similarly D2–D4) 

---

If you want, I can also propose a **one-page “Referee-proof restructuring”** (reordering sections, trimming redundancy, and adding two short “boxed definitions” on locality/BPHZ and on what would count as a rebuttal) that would likely improve acceptance odds for a short “Comment” format, while keeping your central technical point intact.

---
id: R07-pro-3-barker-ghost-detail
type: research
date: 2026-05-25
intent: >
  Open assessment of the unified gravity program in light of the full
  established state (R02-R06) and the discourse-landscape findings,
  with Pro free to fetch and reach own conclusions.
predecessors: [R01-paper-intake, R02-pro-1-weyl-sq-counterterm, R02-pro-2-paper-subtraction-defect, R02-pro-3-teleparallel-matter-loop, R03-pro1-subtraction-confirmed, R03-pro2-action-dynamical, R04-pro-1-eft-or-quadratic, R04-pro-2-eft-or-quadratic, R05-discourse-landscape, R06-pro-1-branch-fork, R06-pro-2-chishtie-bensouilah, R06-pro-3-three-languages]
prompt: unified-gravity-2025/prompts/researcher-R07-zoom-out-with-chishtie.md
siblings: [R07-pro-1-narrowness-of-original-claim, R07-pro-2-yang-mills-analogy]
action:
  kind: extends
  target: R06-pro-1-branch-fork
claim: >
  The strict UG-is-finite-parameter-local-BPHZ-one-loop-renormalizable-QG-on-
  Standard-Model-footing claim is NOT presently defensible. The strongest
  reason is structural and paper-internal: the original paper's graviton
  self-energy produces higher-derivative tensor structures not absorbable
  by the displayed local field-strength renormalization counterterm; the
  paper's remedy is a momentum-dependent "renormalization factor" which
  is not a local BPHZ counterterm. The 2025 graviton-graviton extension
  strengthens the negative assessment by admitting the original Minkowski
  formulation omitted a needed triple-graviton interaction and explicitly
  leaving its renormalization implications for future work. CENTRAL NEW
  TECHNICAL CONTENT: read the body of Barker arXiv:2311.11790. The
  abstract's "ghostly teleparallel vacuum" claim is sharpened by the
  body into specific spin-mode structure -- in the symmetric
  interpretation of the unified-gravity weak-field zero-coupling limit,
  the two graviton polarizations require one sign of kappa while five
  additional massless polarizations require the OPPOSITE sign of kappa,
  making ghosts unavoidable in that interpretation; in the asymmetric
  teleparallel interpretation, Barker reports six ghost polarizations;
  in a bimetric reading the spectrum is still not unitary. This is not
  a rigorous no-go theorem for every possible finite-coupling
  completion, but it is a serious particle-spectrum red flag --
  even before renormalization, the free-field limit does not obviously
  contain only healthy helicity-2 gravity plus gauge redundancy.
  REFINEMENT OF R04 TWO-DESCENDANT TAXONOMY: there are actually FOUR
  coherent descendants worth distinguishing, not two. (1) Teleparallel
  / tetrad effective field theory in the Donoghue-Burgess spirit, with
  full local operator basis including higher-derivative + torsion +
  fermion-current operators; preserves GR limit, abandons strict
  renormalizability. (2) New-GR teleparallel renormalization with
  three independent torsion-squared coefficients (c_1, c_2, c_3) per
  Casadio-Kuntz-Paci; abandons exact TEGR but keeps teleparallel
  structure; needs separate spectrum/stability check. (3) Higher-
  derivative curvature gravity / Stelle + Fradkin-Tseytlin asymptotic
  freedom, with Anselmi-Piva fakeon prescription to handle the massive
  spin-2 mode; preserves renormalizability, modifies microcausality
  above the fakeon scale. (4) A genuinely new Minkowski gauge theory of
  gravity pursued as a distinct theory, with the gauge-invariant UG
  branch evaluated on its own merits -- right benchmark is not "it
  reproduces GR" but: healthy particle spectrum, local counterterm
  basis for triple-graviton theory, viable Ward / Slavnov identities,
  consistent EFT expansion, experimentally viable 2PN polarization
  predictions. This is an OPEN research program, not a completed
  quantum-gravity solution. Final standing: not a viable established
  renormalizable QG; alive as speculative U(1)^4 gravity model with
  unusual tree-level predictions; possible source of teleparallel-EFT
  variables; requires full restart of renormalization analysis after
  triple-graviton extension.
verifiers_at_time:
  - [gpt-pro-R07-pro-3, agrees]
confidence_at_time: high
---

## Bottom-line assessment

The **strict “unified gravity is a finite-parameter, local-BPHZ, one-loop-renormalizable quantum gravity on the same footing as Standard Model gauge theory” claim is not presently defensible**. The strongest reason is not sociological; it is structural. The original paper’s own graviton self-energy calculation produces higher-derivative tensor structures that are not absorbable by the displayed local field-strength renormalization counterterm, and the paper’s remedy is a momentum-dependent “renormalization factor,” which is not a local BPHZ counterterm. This already breaks the strict claim before bringing in the broader teleparallel and Einstein-Dirac literature. The later 2025 follow-up strengthens the negative assessment because it admits that the original Minkowski unified-gravity formulation omitted a needed triple-graviton interaction and explicitly leaves its renormalization implications for future work. 

What remains scientifically interesting is a **testable, non-GR, flat-Minkowski gauge model** with unusual classical predictions, plus a possible **teleparallel/EFT reinterpretation**. But those are different standings from “renormalizable quantum gravity equivalent to GR.” The program has forked: the gauge-invariant Minkowski branch is not TEGR/GR, while the TEGR-reduced branch is obtained only after substitutions that the authors now say break the gauge symmetry of unified gravity. ([arXiv][1])

## 1. The original claim and what it would have to mean

Partanen and Tulkki’s original work, *Gravity generated by four one-dimensional unitary gauge symmetries and the Standard Model*, arXiv:2310.01460, Rep. Prog. Phys. 88, 057802 (2025), DOI 10.1088/1361-6633/adc82e, defines a four-(U(1)) gauge theory tied to an eight-spinor “space-time dimension field,” claims a TEGR reduction in the Weitzenböck gauge, and claims that loop infinities can be absorbed into a small parameter set analogously to Standard Model gauge theories. The arXiv v11 record also incorporates the two 2025 corrigenda. ([arXiv][2])

For that to count as ordinary BPHZ/algebraic-renormalization renormalizability, the divergent 1PI amplitudes must be removable by **local polynomial counterterms** belonging to the same finite bare action, up to field/coupling/gauge-parameter redefinitions. BPHZ subtraction is based on Taylor/local counterterms; in the standard theorem language, divergences of local polynomial QFTs are absorbed into local monomials in the action, not into arbitrary nonlocal momentum-dependent form factors. ([arXiv][3])

That is where the original claim fails.

## 2. The decisive internal mismatch: the graviton self-energy counterterm is not local enough

The original paper states that, unlike conventional gravity, its unified-gravity gravitons do not directly self-interact in the original vertex rules, and that the “consistent renormalization” of the electron-loop graviton self-energy is a substantial breakthrough. ([arXiv][4]) But the displayed one-loop self-energy is not of the same tensor/momentum form as the displayed counterterm. In the PDF equations around 187–189, the electron and photon loop self-energies contain (p^4)-scale structures and several independent tensor projectors, while the counterterm in eq. 189 is of the restricted form ((Z_H-1)p^2\widehat P_{1,2,1}). 

The paper then introduces (\delta Z_H^{(1)}(p^2))-type expressions with explicit dependence on (p^2), (m^2/p^2), (m^4/p^4), and logarithms, together with subtraction conditions imposed at (p^2=0) and (p^2\to\infty). That object is not a constant local wave-function renormalization; it is a momentum-dependent propagator-level subtraction/form factor. In local BPHZ language, there are only two honest interpretations: either one adds new local higher-derivative operators whose momentum-space vertices carry the needed (p^4) projectors, or one has left the local finite-parameter BPHZ framework. 

This is enough to refute the strict claim. It is not a small calculational oversight: the mismatch occurs in the exact sector the paper presents as the breakthrough.

## 3. The external QFT literature points to the same obstruction

The internal mismatch is not surprising from the older gravitational counterterm literature. Duff’s review *Twenty Years of the Weyl Anomaly*, Class. Quantum Grav. 11, 1387–1404 (1994), arXiv:hep-th/9308075, DOI 10.1088/0264-9381/11/6/004, reviews the standard curvature-squared/Weyl-anomaly structure generated by quantum matter in a gravitational background. For a Dirac fermion, the familiar (C_{\mu\nu\rho\sigma}C^{\mu\nu\rho\sigma})-type coefficient appears in the standard anomaly/counterterm normalization. ([arXiv][5]) In gauge-field variables linearized around flat space, this is exactly the kind of four-derivative (p^4) structure seen in Partanen–Tulkki’s own two-point function.

The spinor sector is also not innocuous. Deser and van Nieuwenhuizen, *Nonrenormalizability of the quantized Dirac-Einstein system*, Phys. Rev. D 10, 411 (1974), DOI 10.1103/PhysRevD.10.411, showed that the one-loop Dirac-Einstein system has diagrams with eight external fermions whose divergence is proportional to the fourth power of the fermion axial-vector current. ([APS Link][6]) That is precisely the kind of local, Lorentz-invariant, matter-sector counterterm absent from a minimal finite-coupling gauge-gravity Lagrangian.

Casadio, Kuntz, and Paci, *Quantum fields in teleparallel gravity: renormalization at one-loop*, Eur. Phys. J. C 82, 186 (2022), arXiv:2110.04325, DOI 10.1140/epjc/s10052-022-10157-8, give a teleparallel version of the same message. Their abstract states that quantum matter produces divergences not absorbable by TEGR; their detailed conclusion is sharper: with full coupling one gets torsion-quartic divergences, while with gauge-only translation coupling the quadratic divergence is the Yang-Mills-type (T^{\rho\mu\nu}T_{\rho\mu\nu}) contraction rather than the TEGR combination. Absorption requires the broader three-coefficient “New GR” teleparallel action, not the one-parameter TEGR point. ([arXiv][7])

So obstruction C is not merely “TEGR is known to be hard to quantize.” It is a direct closure failure: quantum matter does not keep the TEGR torsion combination invariant under renormalization.

## 4. BRST invariance and “dimensionless coupling” do not rescue the claim

The original paper leans heavily on analogy with the Standard Model: compact unitary gauge groups, BRST invariance, and a dimensionless scaled gravitational coupling. It explicitly argues that the scaled representation removes Einstein’s constant from the gauge-field kinetic prefactor, defines a gravitational fine-structure constant, and suggests renormalizability from the resulting dimensionless coupling. But the same passage also says the gravitational fine-structure constant depends on energy scale, and the scaling is a field redefinition of a theory whose vertices still contain stress-energy/momentum factors. ([arXiv][4])

The correct algebraic-renormalization statement is weaker: BRST invariance constrains counterterms to the local BRST cohomology, especially ghost-number-zero classes. Barnich, Brandt, and Henneaux’s review *Local BRST cohomology in gauge theories*, Phys. Rep. 338, 439–569 (2000), arXiv:hep-th/0002245, explains that ghost-number-zero cohomology is exactly the stability/counterterm problem, and that effective Yang-Mills theories may contain all gauge-invariant higher-derivative terms. ([arXiv][8])

Thus BRST symmetry does not say “only the original TEGR-like kinetic term appears.” It says: include every nontrivial local invariant allowed by the symmetry unless a stronger principle excludes it. The offending terms here are not gauge-variant anomalies; they are gauge-invariant, Lorentz-invariant local counterterms. That makes BRST a reason to enlarge the action, not a reason to discard the divergences.

## 5. The 2025 follow-up makes the branch fork explicit

The July 2025 paper by Partanen and Tulkki, *Extending unified gravity to account for graviton–graviton interaction*, arXiv:2507.07790, is highly clarifying. It says the original Minkowski unified gravity was incomplete for gravitational self-interaction and adds a gauge-invariant self-interaction term. It also says there is **no equivalence transformation** from unified gravity to TEGR, because unified gravity is formulated in global Minkowski spacetime and its gauge field has no relation to the metric or tetrad before extra substitutions are made. The same section says the new graviton-graviton extension term does not contribute to the TEGR-reduced Lagrangian, and that the substitutions used to recover TEGR break the gauge symmetry of unified gravity. ([arXiv][1])

That is not a cosmetic clarification. It means there are two physically different theories:

**Minkowski-UG branch:** gauge-invariant, contains the new triple-graviton vertex, has non-GR classical predictions, and lacks a completed loop renormalization analysis.

**TEGR-reduced branch:** recovers TEGR/GR only after gauge-symmetry-breaking substitutions, and does not include the new self-interaction term in the same way.

The July paper also states that the triple-graviton vertex is introduced and that its implications for renormalization are left for future work. ([arXiv][1]) Therefore the original one-loop claim cannot be read as a completed renormalization proof of the theory that now contains the required gravitational self-interaction.

## 6. The light-deflection follow-up is a real non-GR prediction, not a GR recovery

The May/September 2025 light-deflection paper, *Light deflection in unified gravity and measurable deviation from general relativity in the second post-Newtonian order*, arXiv:2505.14446, says it uses the Minkowski-metric unified-gravity formulation, accounts for nonlinear graviton-graviton interaction at lowest order, agrees with GR at first PN order, and predicts polarization-dependent second-PN deviations. The PDF abstract gives the specific relative differences (7/30\approx23.3%) and (4/15\approx26.7%) for out-of-plane and in-plane polarizations compared with polarization-independent GR. ([arXiv][9])

That is scientifically useful because it makes the Minkowski branch falsifiable. But it also undermines any reading that unified gravity is simply GR/TEGR in a new gauge notation. Classical metric GR coupled to Maxwell theory has polarization-independent geometric-optics light propagation; polarization-dependent propagation in curved backgrounds is known in QED as a loop vacuum-polarization effect, as in Drummond and Hathrell, *QED vacuum polarization in a background gravitational field and its effect on the velocity of photons*, Phys. Rev. D 22, 343 (1980), DOI 10.1103/PhysRevD.22.343. ([APS Link][10])

So the light-deflection result should be treated as a prediction of a **new classical theory**, not as evidence that the gauge-invariant UG branch is classically equivalent to GR.

## 7. Third-party record

Will Barker’s *Particle spectra of gravity based on internal symmetry of quantum fields*, arXiv:2311.11790, examines the weak-field, zero-coupling limit and finds a “ghostly teleparallel vacuum.” The body of the paper sharpens the abstract: in the symmetric interpretation, the two graviton polarizations require one sign of (\kappa), while five additional massless polarizations require the opposite sign, making ghosts unavoidable; in the asymmetric/teleparallel interpretation, Barker reports six ghost polarizations; and in a bimetric reading the spectrum is still not unitary. ([arXiv][11])

This is not a rigorous no-go theorem for every possible finite-coupling completion, but it is a serious particle-spectrum red flag. It says that even before renormalization, the free-field limit does not obviously contain only healthy helicity-2 gravity plus gauge redundancy.

Farrukh A. Chishtie’s 2026 article, *Emergent gravity in contrast to unified gauge gravity: Nine interconnected structural limitations of the UGM model and their resolution in USMEG-EFT*, Chinese Journal of Physics, DOI 10.1016/j.cjph.2026.05.001, is verifiable as a peer-reviewed bibliographic item, but I could not access an open full text. ResearchGate metadata states “No full-text available,” while ScienceDirect returned access restrictions. I would therefore count it as a public negative signal, not as detailed evidence for the nine specific limitations. ([ScienceDirect][12]) Chishtie’s related arXiv:2503.09796 argues instead for a GR-as-EFT/one-loop-truncated framework, but that is a separate proposal and should not be used as a proof of or against UG without its own audit. ([arXiv][13])

Abdelwahab Bensouilah’s 2026 *Gravitational photon–photon scattering in a recent unified gravity model*, Canadian Journal of Physics 104, 1–11, DOI 10.1139/cjp-2025-0362, is supportive but limited. The available publisher/ResearchGate preview says it computes tree-level photon-photon scattering mediated by single-graviton exchange in UGM and finds the small-angle result reproduces the Tolman–Ehrenfest–Podolsky classical light-source gravity description. That is a nontrivial tree-level consistency check, but it does not address loops, counterterm closure, the triple-graviton extension, or the ghost-spectrum issue. ([ResearchGate][14])

## 8. Assessment against the three stated goals

**Goal (i): perturbative quantum gravity on the same footing as Standard Model gauge interactions.**
Not established, and the strict claim is contradicted by the counterterm structure. The theory may be quantizable as an EFT or as a nonlocal/form-factor model, but that is not Standard-Model-style finite-parameter BPHZ renormalizability. Stelle’s higher-derivative gravity, *Renormalization of Higher-Derivative Quantum Gravity*, Phys. Rev. D 16, 953 (1977), DOI 10.1103/PhysRevD.16.953, is the classic route that actually gains perturbative renormalizability by adding curvature-squared terms; Fradkin and Tseytlin later showed higher-derivative gravity can be asymptotically free in essential couplings. But that route has the well-known massive spin-2 ghost problem under standard quantization. ([APS Link][15])

**Goal (ii): classical reduction to GR through TEGR equivalence.**
Only conditionally, and not in the gauge-invariant branch. The 2025 self-interaction paper says there is no equivalence transformation from UG to TEGR and that the TEGR-producing substitutions break the gauge symmetry. Therefore the program cannot simultaneously claim exact gauge-invariant Minkowski UG, exact TEGR equivalence, and the new triple-graviton self-interaction as one unchanged theory. ([arXiv][1])

**Goal (iii): compatibility with the equivalence principle through equality of renormalized inertial and gravitational masses.**
This is at best a renormalization condition, not a closure theorem. The original paper says the equivalence principle is formulated by requiring equality of renormalized inertial and gravitational masses and related scale/coupling constants. ([arXiv][4]) But once the local counterterm basis includes curvature-squared/torsion-quadratic/torsion-quartic/fermion-current operators, equality of two mass parameters does not eliminate all independent equivalence-principle-relevant Wilson coefficients. It may be imposed in a restricted sector; it is not enough to prove universality of the full quantum effective action.

## 9. The coherent descendants

The current evidence points to four coherent descendants, none identical to the original strict claim.

**1. Teleparallel/tetrad effective field theory.**
This preserves the low-energy GR/TEGR limit and handles the actual counterterm situation by including every local operator allowed by symmetries: torsion-quadratic deviations, torsion-quartic terms, curvature-equivalent four-derivative terms, and fermion-current operators. This is closest to the Donoghue/Burgess EFT philosophy: gravity is a well-behaved low-energy QFT with predictive nonanalytic long-distance corrections, while UV-sensitive local coefficients are Wilson parameters. Donoghue’s *General relativity as an effective field theory: the leading quantum corrections*, Phys. Rev. D 50, 3874 (1994), arXiv:gr-qc/9405057, DOI 10.1103/PhysRevD.50.3874, is the standard reference. ([arXiv][16])

**2. New-GR teleparallel renormalization.**
One can abandon exact TEGR closure and allow the three independent torsion-squared coefficients (c_1,c_2,c_3), plus higher operators as needed. Casadio–Kuntz–Paci show this is the natural one-loop matter-background repair. But then the theory is no longer the TEGR point, and its particle spectrum/stability must be separately checked. ([Springer Link][17])

**3. Higher-derivative curvature gravity / fakeon gravity.**
If the overriding goal is perturbative renormalizability, the known path is curvature-squared gravity. Standard quantization gives a ghost; Anselmi and Piva’s fakeon approach instead treats the massive spin-2 mode as a fake degree of freedom, preserving unitarity at the cost of microcausality violations above the fakeon scale. This is a coherent but non-TEGR, non-standard-causality descendant. ([arXiv][18])

**4. A genuinely new Minkowski gauge theory of gravity.**
The gauge-invariant UG branch can be pursued as a distinct, testable classical and quantum theory. Then the right benchmark is not “it reproduces GR,” but: Does it have a healthy particle spectrum? Does the triple-graviton theory renormalize with a local counterterm basis? Are the 2PN polarization predictions experimentally viable? Do Ward/Slavnov identities close? Does it have a consistent EFT expansion? This is an open research program, not a completed quantum-gravity solution.

## Final standing

The unified-gravity program is scientifically interesting but presently **not established as a viable renormalizable quantum theory of gravity**. Its strongest live status is:

1. a speculative flat-space (U(1)^4)-based gravity model with unusual tree-level predictions;
2. a possible source of useful variables for teleparallel EFT;
3. a program requiring a full restart of its renormalization analysis after the triple-graviton extension;
4. not a demonstrated Standard-Model-like finite-parameter quantum gravity.

The strict RPP headline claim should be narrowed substantially. A defensible revised claim would be something like: “We have proposed a gauge-invariant Minkowski formulation with partial one-loop calculations and testable classical deviations; its full local counterterm closure, particle spectrum, and renormalization after gravitational self-interactions remain open.” That statement fits the current record. The stronger statement—that all infinities of quantum gravity are absorbed into a small original parameter set while preserving exact TEGR closure—is contradicted by the counterterm evidence.

[1]: https://arxiv.org/html/2507.07790v2 "Extending unified gravity to account for graviton–graviton interaction"
[2]: https://arxiv.org/abs/2310.01460 "[2310.01460] Gravity generated by four one-dimensional unitary gauge symmetries and the Standard Model"
[3]: https://arxiv.org/pdf/1307.4650?utm_source=chatgpt.com "BPHZ renormalization and its application to non- ..."
[4]: https://arxiv.org/html/2310.01460v11 "Gravity generated by four one-dimensional unitary gauge symmetries and the Standard Model"
[5]: https://arxiv.org/abs/hep-th/9308075 "[hep-th/9308075] Twenty Years of the Weyl Anomaly"
[6]: https://link.aps.org/pdf/10.1103/PhysRevD.10.411?utm_source=chatgpt.com "Nonrenormalizability of the quantized Dirac-Einstein system"
[7]: https://arxiv.org/abs/2110.04325 "[2110.04325] Quantum fields in teleparallel gravity: renormalization at one-loop"
[8]: https://arxiv.org/pdf/hep-th/0002245 "arXiv:hep-th/0002245v3  13 Nov 2000"
[9]: https://arxiv.org/pdf/2505.14446?utm_source=chatgpt.com "Light deflection in unified gravity and measurable deviation ..."
[10]: https://link.aps.org/doi/10.1103/PhysRevD.22.343?utm_source=chatgpt.com "Phys. Rev. D 22, 343 (1980) - QED vacuum polarization in a ..."
[11]: https://arxiv.org/abs/2311.11790 "[2311.11790] Particle spectra of gravity based on internal symmetry of quantum fields"
[12]: https://www.sciencedirect.com/science/article/pii/S0577907326001498?utm_source=chatgpt.com "Emergent gravity in contrast to unified gauge ..."
[13]: https://arxiv.org/abs/2503.09796?utm_source=chatgpt.com "Restricting One-Loop radiative effects in quantum gravity: Demonstrating 4D GR as an EFT and its consistent unification with the Standard Model"
[14]: https://www.researchgate.net/publication/402135665_Gravitational_photon-photon_scattering_in_a_recent_unified_gravity_model?utm_source=chatgpt.com "Gravitational photon–photon scattering in a recent unified ..."
[15]: https://link.aps.org/doi/10.1103/PhysRevD.16.953?utm_source=chatgpt.com "Renormalization of higher-derivative quantum gravity"
[16]: https://arxiv.org/abs/gr-qc/9405057?utm_source=chatgpt.com "General relativity as an effective field theory: The leading quantum corrections"
[17]: https://link.springer.com/article/10.1140/epjc/s10052-022-10157-8 "Quantum fields in teleparallel gravity: renormalization at one-loop | The European Physical Journal C | Springer Nature Link"
[18]: https://arxiv.org/abs/1806.03605?utm_source=chatgpt.com "Quantum Gravity, Fakeons And Microcausality"

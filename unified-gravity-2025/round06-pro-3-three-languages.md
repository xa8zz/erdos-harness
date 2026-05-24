---
id: R06-pro-3-three-languages
type: research
date: 2026-05-24
intent: >
  Open assessment of the unified-gravity program given the established R02-R04
  obstructions and new context from the 2025 author follow-ups and the Barker
  third-party critique.
predecessors: [R01-paper-intake, R02-pro-1-weyl-sq-counterterm, R02-pro-2-paper-subtraction-defect, R02-pro-3-teleparallel-matter-loop, R03-pro1-subtraction-confirmed, R03-pro2-action-dynamical, R04-pro-1-eft-or-quadratic, R04-pro-2-eft-or-quadratic, R05-discourse-landscape]
prompt: unified-gravity-2025/prompts/researcher-R06-open-assessment.md
siblings: [R06-pro-1-branch-fork, R06-pro-2-chishtie-bensouilah]
action:
  kind: extends
  target: R04-pro-1-eft-or-quadratic
claim: >
  The unified-gravity program has three separable statuses: not viable as
  strict perturbatively renormalizable QG on Standard-Model footing; alive
  but unsettled as a classical / tree-level alternative gravity model;
  potentially useful as a seed for a modified EFT or higher-derivative
  framework. CENTRAL REFRAMING: obstructions A, B, C are not three
  independent annoyances but the same counterterm-basis-closure failure
  expressed in three languages -- (A) matter loops generate spin-2
  stress-tensor curvature-squared / axial-current-quartic counterterms not
  in the bare action; (B) the paper-internal p^4 vs p^2 self-energy
  mismatch is a locality / counterterm-basis mismatch; (C) TEGR is not
  radiatively closed under matter. All three reduce to the same statement:
  the bare action's parameter set is too small. TERMINOLOGY REFINEMENT:
  the Deser-van Nieuwenhuizen 1974 one-loop divergence is more precisely
  an axial-current quartic (psibar gamma^a gamma_5 psi)^4, i.e. a
  dimension-12 eight-spinor operator, not generically "four-fermion".
  ARTICLE-NUMBER CORRECTION: Casadio-Kuntz-Paci is Eur. Phys. J. C 82,
  186 (2022); the article number 82, 262 sometimes appearing in citation
  records is incorrect. SUPPORTIVE EXTERNAL: Bensouilah 2026, "Gravitational
  photon-photon scattering in a recent unified gravity model," Canadian
  Journal of Physics, computes single-graviton-exchange photon-photon
  scattering in UGM and reports small-angle differential cross section
  reproducing classical Tolman-Ehrenfest-Podolsky description -- positive
  tree-level consistency check but does not touch the one-loop counterterm
  mismatch or the spectrum issue. CRITICAL EXTERNAL: Chishtie 2026,
  "Emergent gravity in contrast to unified gauge gravity: Nine
  interconnected structural limitations of the UGM model and their
  resolution in USMEG-EFT," Chinese Journal of Physics, DOI
  10.1016/j.cjph.2026.05.001 -- bibliographic metadata verified but full
  text not accessible; second credentialed critique beyond Barker. CONTEXT
  ON THE 2PN DEFLECTION CLAIM: in conventional metric electrodynamics
  coupled to GR, classical geometric-optics light propagation is not
  polarization-split; known polarization-dependent gravitational
  propagation (Drummond-Hathrell effect, Phys. Rev. D 22, 343, 1980) comes
  from QED loop vacuum-polarization in a curved background, not from
  classical 2PN gravitational deflection. So UG's polarization-dependent
  2PN deflection is genuinely a non-GR classical signature, scientifically
  meaningful as a distinguishing experimental prediction (Minkowski-UG
  branch). FINAL FRAME: the program-level fork that requires resolution is
  "is UG meant to be exact GR in teleparallel dress, a predictive non-GR
  Minkowski gauge theory, or a field-variable scaffold for an EFT /
  higher-derivative completion?" Current papers slide between the three
  framings; a coherent future version must choose one and redo
  renormalization, spectrum, and phenomenology on that footing.
verifiers_at_time:
  - [gpt-pro-R06-pro-3, agrees]
confidence_at_time: high
---

## Verdict

The current public record makes **Partanen–Tulkki unified gravity scientifically interesting but not scientifically standing as an established renormalizable quantum theory of gravity**. In its strict original form, the program is overconstrained: it tries to keep a finite Standard-Model-like counterterm set, exact TEGR/GR closure, U(1)(^4) abelian gauge invariance, and an equivalence-principle interpretation at once. The known one-loop counterterm obstructions, the paper-internal momentum-dependent subtraction, the teleparallel matter-loop non-closure, and the Barker spectrum critique are not minor gaps; they strike different parts of the same claim.

The new author follow-ups do **not** rescue the original renormalizability claim. The graviton–graviton paper adds a tree-level self-interaction and explicitly leaves its renormalization consequences for future work. The light-deflection paper makes the program more falsifiable as a classical alternative to GR, but it also sharpens the tension between “classical reduction to GR/TEGR” and “measurable 2PN deviations from GR.” The Barker paper adds an independent free-spectrum/ghost issue that is orthogonal to, and not cured by, counterterm bookkeeping. The coherent descendants are still the two you identified: a teleparallel/tetrad **effective field theory**, or a higher-derivative/fakeon/quadratic-gravity-like UV theory. Neither is the strict original UG claim.

Partanen and Tulkki’s current arXiv version of the main paper states the core proposal: four U(1)-type symmetries of the “space-time dimension field,” TEGR recovered by a gauge-field-dependent geometric condition, one-loop radiative corrections, and the claim that loop infinities can be absorbed into a small parameter set “in the same way” as Standard Model gauge theories; the arXiv page also notes that the corrigenda have been folded into the current version. ([arXiv][1]) That claim is the part that fails under the established obstructions.

## The clean way to state the failure

For a local BPHZ/algebraic-renormalization claim, the test is not “is the divergence gauge invariant?” The test is:

[
\Gamma_{\rm div}^{(1)} \in
\text{span}{\text{allowed parameter renormalizations, field redefinitions, BRST-exact/EOM terms}}.
]

Gauge invariance is only a filter. Barnich–Brandt–Henneaux’s local BRST cohomology framework is precisely the technology for classifying which local ghost-number-zero counterterms are allowed by gauge symmetry; it does not say that every gauge-invariant local term is already present in a given finite bare action. ([arXiv][2]) BPHZ locality likewise means local polynomial counterterms generated by Taylor subtractions, not arbitrary momentum-dependent functions attached to a propagator; Zimmermann’s momentum-space BPHZ proof is built around power-counting/local subtraction structure. ([Springer Link][3])

On that standard, A, B, and C are not independent annoyances. They say the same thing in three languages:

1. **Matter loops know about the spin-2 stress-tensor coupling**, so they generate curvature/torsion-sector structures with four derivatives or higher fermion powers, not merely the original two-derivative TEGR kinetic term. Duff’s Weyl-anomaly review is the standard reference for the spin-dependent Weyl-squared coefficient structure, and Deser–van Nieuwenhuizen explicitly found the Einstein–Dirac one-loop divergence proportional to the fourth power of the axial-vector fermion current. ([arXiv][4])

2. **The paper-internal one-loop self-energy mismatch is a locality/counterterm-basis mismatch.** A constant (Z_H) multiplying a (p^2)-type kinetic projector cannot absorb a (p^4)-projector divergence unless the bare action already contains the corresponding local four-derivative operator. A momentum-dependent (\delta Z_H(p^2)) with logarithms and inverse powers of (p^2) is not a Standard-Model-like renormalization constant; it is either a shorthand for adding new local higher-derivative operators or a nonlocal subtraction outside ordinary BPHZ counterterm renormalization.

3. **TEGR is not radiatively closed under matter.** Casadio–Kuntz–Paci found that quantum matter in teleparallel backgrounds generates divergences not absorbable by the TEGR action alone; with full equivalence-principle coupling, the divergences include higher torsion structures, while under a gauge-only translation coupling the quadratic divergence lands in one torsion contraction rather than the TEGR linear combination. They explicitly identify the lack of free teleparallel parameters as the obstruction and note that a generalized teleparallel action with independent torsion-quadratic coefficients can absorb the relevant one-loop divergences, at least at that level. ([arXiv][5]) Minor bibliographic note: the Casadio–Kuntz–Paci paper is *Eur. Phys. J. C* **82**, 186 (2022), arXiv:2110.04325, DOI 10.1140/epjc/s10052-022-10157-8; it is sometimes miscited with a different article number. ([arXiv][5])

A terminology correction is useful here: the Deser–van Nieuwenhuizen obstruction is often loosely called “four-fermion,” but the specific counterterm is better described as an **axial-current quartic**, schematically ((\bar\psi\gamma^a\gamma_5\psi)^4), i.e. an eight-spinor/dimension-12 operator. The imprecision does not weaken the obstruction; it strengthens the point that the term is far outside a finite two-derivative gravity–Dirac bare action. ([APS Link][6])

## What the 2025 graviton–graviton extension changes

The July 2025 Partanen–Tulkki follow-up adds a graviton–graviton interaction by constructing a gravitational stress-energy tensor and coupling it as a source, thereby introducing a triple-graviton vertex while preserving the stated 4×U(1) gauge invariance. ([arXiv][7]) That is an important classical/tree-level modification, because a gravity theory without gravitational self-sourcing is not going to reproduce nonlinear gravity.

But it does **not** address the loop problem. The authors themselves say the triple-graviton vertex’s implications for renormalization are left for future work. ([arXiv][8]) The extension also does not add the missing counterterm classes: no (H\Box H)-type four-derivative kinetic sector, no independent New-GR torsion-quadratic coefficients, no torsion-quartic basis, no curvature-squared basis, and no axial-current quartic/eight-fermion operators.

The extension therefore changes the status in a slightly unfavorable way for the original claim. The original one-loop renormalization analysis was not a one-loop analysis of the later self-interacting theory, and the later self-interacting theory has not been renormalized. A new triple-graviton vertex creates new loop diagrams; it cannot be assumed to cancel matter-loop (p^4) divergences unless a symmetry or explicit calculation proves that. No such proof is in the follow-up.

There is a further structural tension in the extension: the authors state that the relations used to obtain TEGR break the gauge symmetry and that the extended interaction term does not contribute to TEGR. ([arXiv][8]) That makes the “UG as U(1)(^4) Minkowski gauge theory” and “UG as exact TEGR/GR” stories less like one seamless formulation and more like two branches connected by a special geometric condition. That may be a legitimate research direction, but it must be made explicit.

## What the 2025 light-deflection paper changes

The May 2025 light-deflection paper is valuable because it makes UG more empirically concrete. It claims agreement with GR at first post-Newtonian order but measurable second-post-Newtonian differences, including relative differences (7/30) and (4/15) for two photon polarizations. ([arXiv][9]) The paper also emphasizes that the UG refractive-index profiles cannot be described by conventional constant PPN parameters and treats the effect as a signature of the gauge formulation rather than a weak-field expansion of GR. ([arXiv][10])

That is a scientific strength only if the program is now being presented as a **classical alternative to GR**, not as an exact classical reduction to GR. It also creates a tension with the equivalence-principle rhetoric. In standard metric electrodynamics coupled to GR, classical geometric-optics light propagation is not polarization-split in this way; known polarization-dependent propagation in gravitational backgrounds, such as the Drummond–Hathrell effect, comes from QED loop vacuum-polarization terms in a curved background, not from a classical 2PN gravitational deflection law. ([APS Link][11])

So the light-deflection result is not a renormalization rescue. It is a branch choice. Either:

* UG is forced to the TEGR/GR geometric condition, in which case the 2PN deviations should disappear or be explained as a different physical prescription; or
* UG-Minkowski is the physical theory, in which case it is a testable non-GR theory and cannot lean on exact TEGR equivalence as its classical safety net.

The LATOR-type experimental route is conceptually appropriate for this sort of claim, since LATOR was designed to test high-precision PPN light deflection and next-post-Newtonian gravitational nonlinearity. ([ScienceDirect][12]) But experimental falsifiability at 2PN does not establish loop renormalizability.

## What Barker’s critique adds

Barker’s arXiv:2311.11790 critique is important because it attacks a different layer: the weak-field, zero-coupling particle spectrum. The abstract states that, in that approximation, the theory has a “ghostly teleparallel vacuum” and suggests bimetric, vacuum-expectation-value, or finite-coupling extensions. ([arXiv][13])

This is not the same as the counterterm problem. A theory can be power-counting renormalizable and nonunitary; a theory can be unitary as an EFT and nonrenormalizable. Barker’s point is that even before loop closure, the free particle content may not be healthy. That means a successful UG descendant needs both:

[
\text{counterterm closure} \quad+\quad \text{healthy spectrum/positive physical Hilbert space}.
]

The author follow-up with a triple-graviton vertex does not automatically solve a free-spectrum ghost. A finite-coupling vacuum, bimetric completion, or VEV mechanism might change the spectrum, but those are modifications of the original strict theory and would need a fresh BRST/Hamiltonian/spectral analysis.

## The broader 2026 public record

There are now at least two additional third-party items worth separating from the main verdict.

First, Bensouilah (2026), *Canadian Journal of Physics*, “Gravitational photon–photon scattering in a recent unified gravity model,” computes single-graviton-exchange photon–photon scattering in UGM and reports that the small-angle differential cross section reproduces the classical Tolman–Ehrenfest–Podolsky description of the gravitational field produced by light. ([CDN Science Publishing][14]) That is a positive tree-level consistency check. It does not touch the one-loop (p^4) counterterm mismatch, the teleparallel radiative non-closure, or the ghost-spectrum issue.

Second, Chishtie (2026), *Chinese Journal of Physics*, “Emergent gravity in contrast to unified gauge gravity: Nine interconnected structural limitations of the UGM model and their resolution in USMEG-EFT,” is now in the public record. I could verify the bibliographic metadata, DOI 10.1016/j.cjph.2026.05.001, and abstract-level description, but not enough full text to rely on its detailed arguments here. ([ScienceDirect][15]) At minimum, it shows that external technical criticism has broadened beyond Barker. It does not alter the core assessment unless its full argument supplies either a new no-go theorem or a concrete alternative EFT, and either way that would again be a descendant rather than the strict original UG claim.

## What remains genuinely open

Several questions remain open in a legitimate sense.

A full one-loop computation of the **extended** theory with the triple-graviton vertex has not been published. The result could contain cancellations or additional structures. But to rescue the strict original claim, it would need more than accidental cancellation in one two-point function. It would need a symmetry or identity forcing all forbidden counterterm coefficients to vanish in every relevant sector, including matter loops and mixed graviton–matter graphs.

A full finite-coupling spectrum analysis has not been completed publicly. Barker’s critique is explicitly weak-field/zero-coupling. A nontrivial vacuum, VEV, or bimetric completion might change the propagating modes. But again, that is a modified theory; it must show its physical spin-2, spin-1, spin-0 content, residues, constraints, and ghost/tachyon absence.

The 2PN light-deflection prediction needs independent reproduction and observational confrontation. If correct, it is a crisp phenomenological signature. If false, it weakens the Minkowski-UG branch. Either outcome is scientifically informative but orthogonal to BPHZ renormalizability.

A complete BV/BRST analysis of the exact UG geometric condition is also open. If the geometric condition is imposed before quantization, after quantization, or only on observables, the cohomology and counterterm classification may differ. The 2025 extension’s statement that the TEGR-extracting relations break gauge symmetry makes this point unavoidable. ([arXiv][8])

## What would need to be true for the program to succeed

For the **strict original program** to succeed, the following would have to be demonstrated, not asserted.

First, the authors would need a local symmetry or structural identity that forbids the full set of offending counterterms. Ordinary U(1)(^4) BRST invariance cannot do this, because gauge-invariant field-strength/torsion/curvature/matter-current operators are precisely BRST-closed ghost-number-zero candidates. ([arXiv][2]) A new symmetry would need to forbid, at minimum, the Weyl-squared/four-derivative stress-tensor divergence, the axial-current quartic/eight-fermion divergence, the non-TEGR torsion-quadratic terms, and the torsion-quartic terms.

Second, the theory would need a **local finite counterterm basis**. Replacing a constant renormalization factor by (\delta Z_H(p^2)) with logarithmic and inverse-momentum dependence is not a finite local BPHZ renormalization. If it is expanded into local terms, it is an enlarged higher-derivative operator basis. If it is not expanded, it is a nonlocal prescription.

Third, the physical spectrum must be made healthy. Barker’s ghostly-vacuum result cannot be answered by saying the interacting theory is gauge invariant; ghosts are exactly what gauge fixing and constraints are supposed to remove, and one has to show that they are removed from the physical state space. ([arXiv][13])

Fourth, the program must pick a clear classical branch. “Exact TEGR/GR recovery” and “measurable 2PN deviations from GR, including polarization dependence” can coexist only if the theory has two different regimes or prescriptions and states which one is physical. The current literature reads as if both are being used for different purposes.

Fifth, the equivalence-principle claim needs to be widened beyond equality of renormalized inertial and gravitational masses. In a quantum field theory with photons, spinors, and gravity, universality of coupling, local Lorentz structure, polarization-independent classical light propagation, and radiative stability of the matter–gravity coupling are all part of the issue. Casadio–Kuntz–Paci’s distinction between full equivalence-principle coupling and gauge-only teleparallel coupling is directly relevant here. ([ar5iv][16])

## The viable descendants

The first viable descendant is a **teleparallel/tetrad effective field theory**. This would keep the low-energy GR/TEGR limit but include every local operator allowed by the symmetries: independent torsion-quadratic terms, curvature/torsion higher-derivative terms, torsion-quartic terms, matter-current operators, and so on. This is scientifically orthodox. Donoghue’s EFT treatment of GR explains why gravity can be a well-behaved low-energy quantum field theory with parameter-free long-distance quantum predictions even though the UV completion is unknown. ([arXiv][17]) In this descendant, UG could be a useful field-variable/gauge-organizing language, but the headline “renormalizable like the Standard Model” is abandoned.

The second viable descendant is **higher-derivative gravity**, in the Stelle/Fradkin–Tseytlin class or a modern fakeon variant. Stelle showed that curvature-squared gravitational actions are perturbatively renormalizable, with Slavnov/BRS identities controlling the gauge structure; Fradkin and Tseytlin showed asymptotic freedom properties for higher-derivative quantum gravity. ([ADS][18]) The standard price is the massive spin-2 ghost. The Anselmi–Piva fakeon program tries to keep the UV benefits while quantizing the massive spin-2 excitation as a fakeon rather than a physical ghost, accepting nonstandard microcausal behavior above the fakeon scale. ([Springer Link][19]) This could be a coherent quantum-gravity program, but it is not exact TEGR closure and not the original U(1)(^4) finite-parameter UG.

A third possible descendant is a nonperturbative/asymptotic-safety-style completion, but that would no longer be the original BPHZ claim. It would need a finite critical surface, regulator-independent evidence, and compatibility with the UG field content and symmetries. Nothing in the current UG record establishes that.

## Final standing

The unified gravity program now has three separable statuses.

As a **strict perturbatively renormalizable quantum gravity on Standard-Model footing**, it is not viable on the present record. The counterterm basis is too small, the momentum-dependent subtraction is not a local finite-parameter BPHZ renormalization, TEGR is not radiatively closed under matter, and the free-spectrum critique remains unanswered.

As a **classical or tree-level alternative gravity model**, it is alive but unsettled. The graviton–graviton extension supplies a missing nonlinear ingredient, the light-deflection paper gives falsifiable 2PN predictions, and Bensouilah’s photon–photon scattering calculation provides a narrow tree-level consistency check. None of these establishes quantum renormalizability.

As a **seed for a modified EFT or higher-derivative quantum-gravity framework**, it could still be useful. But the price is explicit: give up at least one of the original pillars. Preserve GR/TEGR and accept EFT nonrenormalizability; preserve perturbative renormalizability and accept higher derivatives/fakeons/non-TEGR structure; preserve U(1)(^4) as an organizing symmetry and accept that it does not by itself protect the finite counterterm set.

The central tension requiring resolution is therefore not a missing calculation detail. It is a program-level fork: **is UG meant to be exact GR in teleparallel dress, a predictive non-GR Minkowski gauge theory, or a field-variable scaffold for an EFT/higher-derivative completion?** The current papers use language and evidence from all three. A coherent future version must choose one and redo the renormalization, spectrum, and phenomenology on that chosen footing.

[1]: https://arxiv.org/abs/2310.01460 "[2310.01460] Gravity generated by four one-dimensional unitary gauge symmetries and the Standard Model"
[2]: https://arxiv.org/abs/hep-th/0002245 "[hep-th/0002245] Local BRST cohomology in gauge theories"
[3]: https://link.springer.com/article/10.1007/BF01645676?utm_source=chatgpt.com "Convergence of Bogoliubov's method of renormalization in ..."
[4]: https://arxiv.org/abs/hep-th/9308075?utm_source=chatgpt.com "[hep-th/9308075] Twenty Years of the Weyl Anomaly"
[5]: https://arxiv.org/abs/2110.04325 "[2110.04325] Quantum fields in teleparallel gravity: renormalization at one-loop"
[6]: https://link.aps.org/pdf/10.1103/PhysRevD.10.411 "Nonrenormalizability of the quantized Dirac-Einstein system  |  Phys. Rev. D"
[7]: https://arxiv.org/abs/2507.07790 "[2507.07790] Extending unified gravity to account for graviton-graviton interaction"
[8]: https://arxiv.org/html/2507.07790v2 "Extending unified gravity to account for graviton–graviton interaction"
[9]: https://arxiv.org/abs/2505.14446 "[2505.14446] Light deflection in unified gravity and measurable deviation from general relativity in the second post-Newtonian order"
[10]: https://arxiv.org/html/2505.14446v6 "Light deflection in unified gravity and measurable deviation from general relativity in the second post-Newtonian order"
[11]: https://link.aps.org/doi/10.1103/PhysRevD.22.343?utm_source=chatgpt.com "Phys. Rev. D 22, 343 (1980) - QED vacuum polarization in a ..."
[12]: https://www.sciencedirect.com/science/article/abs/pii/S0273117705009117?utm_source=chatgpt.com "Mission design for the laser astrometric test of relativity"
[13]: https://arxiv.org/abs/2311.11790 "[2311.11790] Particle spectra of gravity based on internal symmetry of quantum fields"
[14]: https://cdnsciencepub.com/doi/full/10.1139/cjp-2025-0362?utm_source=chatgpt.com "Gravitational photon-photon scattering in a recent unified ..."
[15]: https://www.sciencedirect.com/science/article/pii/S0577907326001498?utm_source=chatgpt.com "Emergent gravity in contrast to unified gauge ..."
[16]: https://ar5iv.org/pdf/2110.04325 "[2110.04325] Quantum fields in teleparallel gravity: renormalization at one-loop"
[17]: https://arxiv.org/abs/gr-qc/9405057?utm_source=chatgpt.com "General relativity as an effective field theory: The leading quantum corrections"
[18]: https://ui.adsabs.harvard.edu/abs/1977PhRvD..16..953S?utm_source=chatgpt.com "Renormalization of higher-derivative quantum gravity - ADS"
[19]: https://link.springer.com/article/10.1007/JHEP11%282018%29021?utm_source=chatgpt.com "Quantum gravity, fakeons and microcausality - Springer Nature"

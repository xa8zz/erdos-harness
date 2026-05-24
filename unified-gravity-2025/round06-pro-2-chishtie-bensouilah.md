---
id: R06-pro-2-chishtie-bensouilah
type: research
date: 2026-05-24
intent: >
  Open assessment of the unified-gravity program given the established R02-R04
  obstructions and new context from the 2025 author follow-ups and the Barker
  third-party critique.
predecessors: [R01-paper-intake, R02-pro-1-weyl-sq-counterterm, R02-pro-2-paper-subtraction-defect, R02-pro-3-teleparallel-matter-loop, R03-pro1-subtraction-confirmed, R03-pro2-action-dynamical, R04-pro-1-eft-or-quadratic, R04-pro-2-eft-or-quadratic, R05-discourse-landscape]
prompt: unified-gravity-2025/prompts/researcher-R06-open-assessment.md
siblings: [R06-pro-1-branch-fork, R06-pro-3-three-languages]
action:
  kind: extends
  target: R04-pro-1-eft-or-quadratic
claim: >
  Unified gravity is a serious research proposal but not an established
  renormalizable quantum theory of gravity as of May 2026. The flagship
  paper deserves technical engagement (peer-reviewed, two corrigenda
  incorporated in arxiv v11) but the central claim of one-loop perturbative
  renormalizability in the strict minimal 4xU(1) TEGR-linked model is not
  presently credible. The paper-internal counterterm mismatch persists in
  v11 despite the corrigenda: the one-loop graviton self-energy has overall
  kappa p^4 scaling with projectors P-hat_B and P-hat_{3,2,1} while the
  displayed bare counterterm is only i (Z_H - 1) p^2 P-hat_{1,2,1}; the
  momentum-dependent delta Z_H^(1)(p^2) in eqs. 204-205 (depending on p^2,
  m_e^2/p^2, m_e^4/p^4, logs) is not finite local BPHZ renormalization but
  either enlargement of the operator basis or nonlocal propagator-level
  subtraction. NEW EXTERNAL CRITIQUE: Chishtie 2026, "Emergent gravity in
  contrast to unified gauge gravity: Nine interconnected structural
  limitations of the UGM model and their resolution in USMEG-EFT," Chinese
  Journal of Physics, DOI 10.1016/j.cjph.2026.05.001 -- not fully fetched
  but exists as a second credentialed critique beyond Barker. The 2PN
  deviation value claimed in arXiv:2505.14446 has evolved across preprint
  versions, indicating phenomenology not yet stabilized. The 2025
  graviton-graviton extension explicitly defers renormalization analysis
  to future work and adds no higher-derivative, torsion-quartic, or new
  fermionic operators that would close R02-R04 obstructions. The branch
  fork between symmetry-preserving Minkowski-UG (carrying 2PN deviations
  from GR) and TEGR-reduced (recovered only by symmetry-breaking
  substitutions) is now explicit in the 2025 record; this is a coherence
  problem requiring branch-selection. Precedent: Ebert-Plefka-Rodigast
  2007, arXiv:0710.1002, found a removable dimension-six counterterm in
  Einstein-Yang-Mills via field redefinition; this escape route exists in
  principle but looks narrow for UG given the paper-internal self-energy
  mismatch and the teleparallel three-coupling result. The two coherent
  descendants are again the teleparallel/tetrad EFT and curvature-squared
  Stelle/Fradkin-Tseytlin gravity with Anselmi-Piva fakeon prescription,
  both abandoning some original promise. Scientifically coherent future
  is either as an EFT family or as a low-energy sector of a different UV
  completion.
verifiers_at_time:
  - [gpt-pro-R06-pro-2, agrees]
confidence_at_time: high
---

## Verdict

As of May 2026, unified gravity is a serious **research proposal** but not an established **renormalizable quantum theory of gravity**. The flagship paper is peer-reviewed in *Reports on Progress in Physics* and its current arXiv v11 explicitly incorporates two 2025 corrigenda, so it deserves technical engagement rather than dismissal. But the central claim that the strict minimal 4×U(1), TEGR-linked model is perturbatively renormalizable “like the gauge theories of the Standard Model” is not presently credible. The best current classification is: an interesting gauge/teleparallel gravity program with explicit classical predictions, but with unresolved quantum consistency problems large enough that it should not be treated as a demonstrated UV-complete theory. ([arXiv][1])

The sharpest reason is still the paper-internal counterterm mismatch. In corrected v11, the one-loop graviton self-energy from electron and photon loops carries overall ( \kappa p^4 ) scaling and lands in projector structures such as (\hat P_B) and (\hat P_{3,2,1}), while the displayed bare counterterm is only (i(Z_H-1)p^2 \hat P_{1,2,1}). The subsequent “renormalization factors” (\delta Z_H^{(1)}) in eqs. (204)–(205) are explicitly momentum dependent, with (p^2), (m_e^2/p^2), (m_e^4/p^4), and logarithms. Read literally, that is not closure of the original finite local basis; it means either higher-derivative local operators have effectively been introduced, or the subtraction is being carried out at the propagator level in a way that no longer matches the stated bare-action ansatz. The fact that this structure persists in v11 means the corrigenda did not remove the basic renormalization problem. ([arXiv][2])

An independent line reaches the same conclusion from teleparallel renormalization. Casadio, Kuntz, and Paci (2022, *Quantum fields in teleparallel gravity: renormalization at one-loop*, Eur. Phys. J. C 82, 262, arXiv:2110.04325) found that one-loop matter divergences do **not** close on TEGR. With full equivalence-principle coupling they become quartic in torsion; with gauge-only coupling they pick out only the Yang–Mills-type torsion contraction, not the TEGR combination; and their conclusion is that one-loop renormalizability requires moving to a three-parameter teleparallel action with free coefficients (c_1,c_2,c_3). Since the Partanen–Tulkki program wants to keep a much smaller gravity-sector parameter set while retaining a TEGR/GR relation, this is not peripheral criticism; it is a direct closure failure of the classical sector the proposal wants to preserve. ([arXiv][3])

Your “Obstruction A” is best viewed as reinforcement, with one nuance. Duff’s review (*Twenty years of the Weyl anomaly*, 1994, hep-th/9308075) summarizes the standard four-derivative curvature counterterms generated by matter, and Deser–van Nieuwenhuizen (1974, *Nonrenormalizability of the quantized Dirac-Einstein system*, Phys. Rev. D 10, 411, DOI 10.1103/PhysRevD.10.411) showed one-loop nonrenormalizability of Einstein–Dirac through an eight-fermion divergence proportional to the fourth power of the axial current. The exact one-to-one translation of those classic results into the authors’ eight-spinor conventions would deserve a dedicated derivation. But UG’s own corrected graviton self-energy already exhibits the (p^4) problem internally, so the classic literature should be read as corroboration, not as the sole basis of the negative verdict. ([BPB][4])

BRST does not rescue the claim. The 2025 graviton-interaction extension says BRST symmetry “strongly indicates” renormalizability and cites the original one-loop treatment. But Barnich, Brandt, and Henneaux’s review (*Local BRST cohomology in gauge theories*, 2000, hep-th/0002245) explains that ghost-number-zero local BRST cohomology classifies admissible local counterterms and deformations; it does **not** prove that a minimal bare Lagrangian is closed under renormalization. On the contrary, strictly gauge-invariant local (n)-forms are standard representatives in (H^{0,n}(s|d)). So if higher-derivative, torsion-quadratic/quartic, or fermionic operators are compatible with the symmetry, BRST allows them; it does not ban them merely because the gauge algebra is abelian and the generators are constant. ([arXiv][5])

A deeper weakness in the original renormalizability narrative is the reliance on a scaled “dimensionless coupling.” In the flagship paper the gravity field is rescaled (H_{a\nu}\to \sqrt{\kappa},H'_{a\nu}), after which (E'_g=E_g\sqrt{\kappa/(\hbar c)}) and (\alpha_g = Gp^2/(\hbar c^3)). But that (\alpha_g) is explicitly energy dependent. That is exactly the sort of expansion parameter that appears in Donoghue’s effective-field-theory treatment of gravity (*General relativity as an effective field theory: The leading quantum corrections*, 1994, gr-qc/9405057). So the scaled representation may be a useful bookkeeping device, but it is not evidence that the original finite operator basis is UV-closed. ([arXiv][2])

What the 2025 follow-ups changed is important, but they did not fix that quantum problem. The July 2025 paper (*Extending unified gravity to account for graviton-graviton interaction*, arXiv:2507.07790) adds a new gauge-invariant term (L_{gg,\mathrm{int}}=-i\sum_a T_g^{a\nu}I_g^{a*}\mathcal D_\nu I_g^a), with (T_g^{\mu\nu}) quadratic in derivatives of (H), and makes the source (T^{\mu\nu}=T_m^{\mu\nu}+T_g^{\mu\nu}). That introduces the advertised triple-graviton vertex. But the paper also says, in so many words, that the renormalization implications of this new vertex are left for later. That matters because the original one-loop paper explicitly emphasized that, unlike conventional gravity, its gravitons had no direct self-interaction vertices. So the phenomenologically necessary **extended** theory is not the same theory whose one-loop renormalization was claimed. ([arXiv][5])

The May/September 2025 light-deflection paper is positive in a different sense: it makes the program falsifiable. It works in the **Minkowski-metric formulation**, says that this branch preserves the four U(1)s and “slightly deviates from GR already in the classical physics regime,” and further says UG is “not a weak-field approximation of GR.” Its current v6 predicts GR agreement at 1PN but polarization-dependent 2PN shifts of (7/30) and (4/15), with tiny relative effects for Jupiter and the Sun and much larger values in its neutron-star table; it points to the proposed LATOR mission concept as a possible test arena. The same pattern appears in the authors’ 2025 perihelion-precession and atomic-redshift preprints: more phenomenology, not more loop control. One extra standing point: the reported 2PN deviation evolved across preprint versions, which suggests the phenomenology is still being stabilized rather than settled. ([arXiv][6])

Those 2025 papers also expose the program’s main coherence tension. The graviton-interaction paper states that there is **no equivalence transformation** from UG to TEGR, because UG is formulated on global Minkowski spacetime and its gravity gauge field is not a metric/tetrad; TEGR is recovered only after substitutions that break the 4×U(1) symmetry. Meanwhile the light-deflection paper deliberately uses the symmetry-preserving Minkowski branch because that branch yields classical deviations from GR. So the program now has two distinct branches: a TEGR/GR-related branch reached by symmetry-breaking substitutions, and a symmetry-preserving branch with explicitly non-GR 2PN phenomenology. That is not automatically inconsistent, but it means the old slogan “UG reduces to GR via TEGR” can no longer function as a simple equivalence theorem. A branch-selection principle is now needed. ([arXiv][5])

There is a second underappreciated shift: symmetry no longer uniquely fixes the theory. The original paper already says the gravity gauge-field Lagrangian is not determined by gauge invariance alone, and the 2025 extension explicitly uses the “freedom to introduce an additional gauge-invariant Lagrangian density term.” Once that is admitted, the natural modern interpretation is effective-field-theoretic: include the full local operator basis allowed by the symmetries and organize it by mass dimension. On that reading, the new cubic graviton term, the higher-derivative operators suggested by the self-energy, and the extra torsion invariants singled out by teleparallel one-loop renormalization all belong to the same enlarged theory space. That makes the program more coherent as an EFT, but less coherent as a minimal Standard-Model-like renormalizable completion. ([arXiv][2])

Barker’s 2023 note remains a real red flag, though not a definitive refutation. Barker (*Particle spectra of gravity based on internal symmetry of quantum fields*, arXiv:2311.11790) studies the weak-field, zero-coupling limit and finds a “ghostly teleparallel vacuum,” suggesting bimetric, VEV, or finite-coupling extensions. Because that is a restricted free-limit analysis, it does not settle the full interacting Minkowski theory. But combined with the 2025 admission that TEGR is not actually equivalent to UG, it means the program still lacks a clean, independently accepted free-theory spectral foundation. The burden of proof is now on the authors to show that the physically relevant branch has a healthy perturbative spectrum. ([arXiv][7])

One update to the public record: Barker is no longer the only visible outside critique. In May 2026, Farrukh A. Chishtie published a Chinese Journal of Physics article/proof titled *Emergent gravity in contrast to unified gauge gravity: Nine interconnected structural limitations of the UGM model and their resolution in USMEG-EFT* (DOI 10.1016/j.cjph.2026.05.001). I was not able to inspect the full text from accessible sources here, so I am **not** leaning on its substantive arguments. But its existence does mean the external critical record is now broader than the 2023 Barker note alone. ([ScienceDirect][8])

What would have to be true for the original program to recover serious viability is therefore quite demanding. At minimum, one would need: a local algebraic/BPHZ renormalization proof for the **extended** theory with the triple-graviton vertex included; explicit closure of divergences on a finite set of constant renormalization parameters; a demonstration that the (p^4) structures and teleparallel extra invariants are absent, redundant, or removable by legitimate field redefinitions without changing observables; a clear statement of which branch is fundamental; and a healthy perturbative spectrum. There are precedents for escaping naive higher-dimension worries by field redefinitions—for example, Ebert, Plefka, and Rodigast (2007, *Absence of gravitational contributions to the running Yang-Mills coupling*, arXiv:0710.1002) found a removable dimension-six counterterm in Einstein–Yang–Mills—but UG’s graviton self-energy mismatch and the teleparallel three-coupling result make that escape route look quite narrow here. ([arXiv][9])

What could still succeed in modified form is narrower and more conventional. A teleparallel/tetrad EFT descendant with higher-derivative, torsion-quadratic, torsion-quartic, and fermionic operators is perfectly plausible in principle and could preserve a low-energy GR limit; that is the Donoghue EFT path, not a Standard-Model-like renormalizable completion. A different renormalizable descendant also exists in known physics: curvature-squared gravity in the sense of Stelle (1977, *Renormalization of Higher Derivative Quantum Gravity*, DOI 10.1103/PhysRevD.16.953) and Fradkin–Tseytlin (1982, *Renormalizable Asymptotically Free Quantum Theory of Gravity*, DOI 10.1016/0550-3213(82)90444-8), with the Anselmi–Piva fakeon program providing one modern route to reconcile renormalizability with a controlled treatment of the massive spin-2 sector. But either path abandons the strict original promise that the minimal 4×U(1), TEGR-linked action itself is perturbatively renormalizable on the same footing as the Standard Model. ([arXiv][10])

So my bottom line is: unified gravity is **not** presently a viable established candidate for a perturbatively renormalizable quantum theory of gravity. It **is** an interesting and unusually explicit alternative-formulation program that has generated concrete, in-principle-testable classical predictions and has forced some useful discussion about teleparallel renormalization and gauge-theoretic formulations of gravity. Its scientifically coherent future is either as an EFT family, or as a low-energy sector of some different UV completion. Without such a reframing, the current record contains unresolved tensions between the renormalizability rhetoric, the TEGR/GR relation, and the symmetry-preserving non-GR phenomenology. ([arXiv][1])

[1]: https://arxiv.org/abs/2310.01460 "https://arxiv.org/abs/2310.01460"
[2]: https://arxiv.org/pdf/2310.01460 "https://arxiv.org/pdf/2310.01460"
[3]: https://arxiv.org/pdf/2110.04325 "https://arxiv.org/pdf/2110.04325"
[4]: https://bpb-us-e2.wpmucdn.com/websites.umass.edu/dist/e/23826/files/2014/11/Duff-anomaly-reminisces.pdf "https://bpb-us-e2.wpmucdn.com/websites.umass.edu/dist/e/23826/files/2014/11/Duff-anomaly-reminisces.pdf"
[5]: https://arxiv.org/pdf/2507.07790 "https://arxiv.org/pdf/2507.07790"
[6]: https://arxiv.org/pdf/2505.14446 "https://arxiv.org/pdf/2505.14446"
[7]: https://arxiv.org/abs/2311.11790 "https://arxiv.org/abs/2311.11790"
[8]: https://www.sciencedirect.com/science/article/pii/S0577907326001498 "https://www.sciencedirect.com/science/article/pii/S0577907326001498"
[9]: https://arxiv.org/abs/0710.1002 "https://arxiv.org/abs/0710.1002"
[10]: https://arxiv.org/abs/gr-qc/9405057 "https://arxiv.org/abs/gr-qc/9405057"

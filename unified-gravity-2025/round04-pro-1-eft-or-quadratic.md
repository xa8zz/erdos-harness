---
id: R04-pro-1-eft-or-quadratic
type: research
date: 2026-05-24
intent: >
  Given the established disproof of one-loop renormalizability, determine
  whether any modification of the construction yields a coherent quantum
  theory of gravity addressing the three obstructions while preserving
  the stated goals, or prove that no such modification exists.
predecessors: [R01-paper-intake, R02-pro-1-weyl-sq-counterterm, R02-pro-2-paper-subtraction-defect, R02-pro-3-teleparallel-matter-loop, R03-pro1-subtraction-confirmed, R03-pro2-action-dynamical]
prompt: unified-gravity-2025/prompts/researcher-R04-zoom-out-alternative-search.md
siblings: [R04-pro-2-eft-or-quadratic]
action:
  kind: extends
  target: R03-pro1-subtraction-confirmed
claim: >
  Within the strict original family -- local U(1)^4 gauge theory with standard
  local BPHZ / algebraic renormalization, a finite bare coupling set, and exact
  quantum closure of the TEGR one-parameter reduction -- there is no
  modification that removes obstructions A, B, C while preserving all three
  stated goals (i)-(iii) at their original strength. The reason is structural:
  the divergent local ghost-number-0 BRST cocycles that actually occur are not
  spanned by the original bare action, and TEGR itself is not closed under
  matter renormalization. At least one of (exact TEGR closure, two-derivative
  gravitational dynamics, finite-coupling renormalizability, original U(1)^4
  field-space organization) must be abandoned. Two coherent descendants exist
  inside known physics: (1) a teleparallel-matched effective field theory in
  the metric/tetrad variables with bare action containing torsion-quadratic
  (TEGR + New-GR coefficients c_i = b_i + O(l_P^2 d_i)), curvature-squared
  (alpha_C C^2, alpha_R R^2, alpha_G G), and the full local higher-dimension
  tower including (J_5^mu J_{5 mu})^2 type 8-fermion operators -- preserves
  classical GR/TEGR limit (goal ii) and low-energy equivalence-principle
  universality (weakened goal iii), abandons strong goal (i) of Yang-Mills-
  style renormalizability; (2) quadratic gravity in Stelle / Fradkin-Tseytlin
  form with curvature-squared kinetic terms (alpha (R_{mu nu} R^{mu nu} -
  (1/3) R^2) and -(xi/6) R^2), ideally with the Anselmi-Piva fakeon
  prescription quantizing the massive spin-2 mode as a fakeon rather than a
  ghost -- preserves perturbative renormalizability (goal i), weakens (ii)
  and (iii) to IR limits and abandons exact TEGR closure plus standard
  microcausality above the fakeon scale. No way to preserve all three goals
  simultaneously exists within the structural family of the construction.
verifiers_at_time:
  - [gpt-pro-R04-pro-1, agrees]
confidence_at_time: high
---

**Verdict**

Inside the **strict** original family—local (U(1)^4) gauge theory, standard local BPHZ/algebraic renormalization, a **finite** bare coupling set, and an exact quantum closure of the TEGR one-parameter reduction—there is **no** modification that removes A, B, and C while preserving goals (i), (ii), (iii) in their original strength. The reason is not just “some bad diagrams exist.” It is a **stability failure** in the BRST/algebraic-renormalization sense: the divergent local ghost-number-0 BRST cocycles that actually occur are not spanned by the original bare action, and TEGR itself is not closed under matter renormalization. Barnich–Brandt–Henneaux review exactly this cohomological criterion, and Barnich et al. make explicit that divergences/counterterms are **local integrated** BRST-invariant functionals and that stability requires an independent coupling for each relevant class in (H^0(s)). Casadio–Kuntz–Paci then show that TEGR is not one-loop closed even before quantizing the gravitational field itself. ([CERN Document Server][1])

So there is an unavoidable tradeoff. The **closest coherent repair** is to reinterpret the theory as a **low-energy effective field theory** built around a teleparallel/New-GR leading sector but enlarged to the full local counterterm basis. That preserves the classical GR limit and a low-energy equivalence principle, but **abandons** the strong version of goal (i) (renormalizability “on the same footing” as Yang–Mills). If one insists on a genuinely perturbatively renormalizable local QFT, the nearest known class is **quadratic gravity**; with ordinary Feynman quantization it has a spin-2 ghost, and with the **fakeon** prescription it becomes a concrete renormalizable/unitary candidate at the price of abandoning exact TEGR closure and standard microcausality above the fakeon scale. ([arXiv][2])

## 1. Why the strict (U(1)^4)/TEGR family is impossible

Take as hypotheses: local fields, local BRST/Faddeev–Popov quantization, local BPHZ/algebraic renormalization, finitely many couplings, and a gravitational bare action confined to the original TEGR one-parameter sector (or any finite torsion-quadratic deformation still intended to remain exactly closed under renormalization). Under those hypotheses, A, B, C are fatal.

First, BRST does **not** rescue the theory. In the algebraic-renormalization framework, the allowed divergent counterterms are local ghost-number-0 BRST cocycles, and gauge-fixed and gauge-invariant BRST cohomologies are isomorphic for this purpose. Stability then says: if a cocycle can appear, the bare action must already contain an independent coupling for it. BRST forbids gauge-violating terms; it does **not** remove local gauge-invariant terms like (C_{\mu\nu\rho\sigma}^2), (R^2), torsion invariants, or higher-fermion operators. ([CERN Document Server][1])

Second, A alone already breaks the original family. Duff’s four-dimensional trace-anomaly formula gives
[
b=\frac{N_s+6N_F+12N_V}{120(4\pi)^2},
]
so one Dirac fermion contributes (b=1/[20(4\pi)^2]) to the Weyl-squared counterterm. That is a genuine local (C^2) divergence. Pulled back through any weak-field map (g_{\mu\nu}(A)), it becomes a local **four-derivative** quadratic operator in the gravitational variables, not something removable by a multiplicative field renormalization of a two-derivative kinetic term. Separately, Deser and van Nieuwenhuizen showed that the quantized Einstein–Dirac system is one-loop nonrenormalizable and generates an eight-fermion divergence proportional to the fourth power of the axial current. Those are different BRST-allowed local classes, and the original bare action has neither. ([BPB][3])

Third, B shows that the paper’s own subtraction strategy is not a BPHZ closure. Partanen and Tulkki explicitly organize counterterms through renormalization factors in the renormalized Lagrangian and impose an extra on-shell condition on the graviton self-energy so that loop corrections to the Newtonian potential are “integrable.” That is not how a missing local counterterm basis is repaired. On-shell renormalization conditions fix finite parts **after** the admissible local counterterms are present; they do not manufacture absent (p^4) structures or missing tensor sectors. So the momentum-dependent graviton renormalization they use is, in algebraic-renormalization terms, either shorthand for adding the missing local higher-derivative/cosmological operators or else a nonlocal propagator-level subtraction outside the BPHZ class. ([arXiv][4])

Fourth, C kills exact TEGR closure even before full quantum gravity is attempted. Casadio, Kuntz, and Paci show that matter on a TEGR background is **not** one-loop renormalizable “in any circumstance” if the background action is fixed to TEGR. With full equivalence-principle coupling the divergence is quartic in torsion; with gauge-only coupling it is quadratic in torsion but only in the Yang–Mills-like contraction, not in the TEGR combination
[
\frac14 T_1+\frac12 T_2-T_3.
]
Their explicit fix is to replace the TEGR coefficients by independent parameters (c_i), with (c_i=b_i+\ell_P^2 d_i), so that GR is recovered only **classically**. They also stress that they did **not** quantize the gravitational field and did **not** prove all-loop renormalizability. ([Cris Unibo][5])

So the strict-family no-go is:

[
\boxed{\text{No local finite-coupling BPHZ completion can keep exact TEGR closure and absorb A,B,C.}}
]

At least one of the following must be abandoned: exact TEGR closure, two-derivative gravitational dynamics, finite-coupling renormalizability, or the original narrow (U(1)^4) field-space organization. ([CERN Document Server][1])

## 2. Conservative repair: a teleparallel-matched **effective field theory**

This is the repair I would recommend if the priority is “preserve as much of the original spirit as is honestly possible” while staying on completely standard ground.

Use the tetrad/metric as the renormalized geometric fields, keep the original (A^a{}_\mu) only as an optional low-energy parametrization, and take the bare EFT Lagrangian to be

[
\mathcal L_{\text{EFT}}
=======================

-h\Lambda
-\frac{h}{16\pi G_N}\big(c_1 T_1+c_2 T_2+c_3 T_3\big)
+h\Big(\alpha_C, C_{\mu\nu\rho\sigma}C^{\mu\nu\rho\sigma}
+\alpha_R, R^2
+\alpha_G, G\Big)
+h\sum_n \beta_n,\mathcal Q_n(T^4)
+h,\frac{\lambda_{8\psi}}{M_*^8}(J_{5\mu}J_5^{\mu})^2
+\cdots
]

with
[
T_1=T^{\rho\mu\nu}T_{\rho\mu\nu},\qquad
T_2=T^{\rho\mu\nu}T_{\nu\mu\rho},\qquad
T_3=T_\rho T^\rho,\qquad
J_5^\mu=\bar\psi\gamma^\mu\gamma_5\psi,
]
(h=\det e^a{}_\mu), (G) the four-dimensional Gauss–Bonnet density, and
[
c_i=b_i+\mathcal O(\ell_P^2),\qquad (b_1,b_2,b_3)=\left(\frac14,\frac12,-1\right).
]
The ellipsis means the full local BRST-allowed higher-dimension tower. The leading torsion-quadratic sector is exactly the Casadio–Kuntz–Paci “easy fix” / New-GR sector, while the rest is the standard Donoghue–Burgess EFT completion needed to absorb all local divergences order by order. ([Cris Unibo][5])

Why this handles A, B, C is straightforward.

For **A**, the (C^2) counterterm is explicitly present, so the fermion-induced Weyl-squared divergence is absorbed by (\alpha_C). The Deser–van Nieuwenhuizen eight-fermion divergence is absorbed by the ((J_5^2)^2) operator, or more generally by the higher-dimension fermionic sector of the EFT. In the original (A)-variable parametrization these appear as the expected higher-derivative/higher-field local operators. ([BPB][3])

For **B**, the missing (p^4) local structures come from the (C^2) and (R^2) terms; the (p^2) sector is renormalized by the leading Einstein/teleparallel couplings (G_N,c_i); and the (p^0) sector is handled by (\Lambda) together with renormalization around a solution of the quantum-corrected background equations. The crucial point is that the subtraction is now **local** and organized by the action itself, not by a momentum-dependent propagator renormalization factor. ([CERN Document Server][1])

For **C**, the gauge-only torsion-quadratic divergence is absorbed by the independent (c_i), exactly as Casadio et al. propose, while the full-coupling torsion-quartic divergences are absorbed by the torsion-quartic invariants (\mathcal Q_n(T^4)). TEGR is no longer demanded to be renormalization-closed; instead it is the **classical/leading** point (c_i\to b_i) in the EFT parameter space. ([Cris Unibo][5])

This repair is internally consistent in the standard EFT sense. BRST closure is automatic because the operator basis is the full local BRST-allowed basis. RG running is just Wilson-coefficient running. Pole content is also clean **within the EFT regime**: one keeps the ordinary massless graviton propagator from the leading two-derivative sector and treats higher-derivative terms perturbatively rather than resumming them into new poles. That is exactly how the modern EFT of gravity avoids spurious ghost claims below its cutoff. ([CERN Document Server][1])

There is also a good reason **not** to oversell the Casadio/New-GR sector into a UV completion. Casadio et al. themselves stop at one-loop quantized matter on a classical background and leave full renormalizability and gravity quantization open. Independently, Beltrán Jiménez et al. show that general quadratic teleparallel theories around Minkowski typically contain extra symmetric rank-2 fields plus a 2-form, and they warn that the linear symmetries needed for viability can fail nonlinearly, producing strong-coupling/pathology issues. So New GR is a good **leading EFT basis**, not an established UV completion. ([Cris Unibo][5])

With this proposal, goal (ii) is preserved best: GR/TEGR is recovered in the classical low-energy limit (c_i\to(1/4,1/2,-1)) and higher-dimension operators decouple. Goal (iii) survives only in the standard low-energy sense of universal coupling; the original mechanism “equate renormalized inertial and gravitational masses” is no longer fundamental. Goal (i) is the one that must be weakened: gravity is now treated as a perfectly coherent **effective** QFT, not as a perturbatively renormalizable Yang–Mills-like theory. That is exactly the lesson Donoghue and Burgess draw for gravity. ([Cris Unibo][5])

## 3. If goal (i) is non-negotiable: leave the family and use quadratic gravity

If you insist on a local perturbatively renormalizable quantum gravity, the nearest known class is curvature-squared gravity. A standard bare action is

[
\mathcal L_{\text{QG}}
======================

\sqrt{-g}\left(
-\Lambda
-\frac{\bar M_P^2}{2}R
-\frac{1}{2f_2^2} C_{\mu\nu\rho\sigma}C^{\mu\nu\rho\sigma}
+\frac{1}{6f_0^2}R^2
-\epsilon, G
+\mathcal L_{\rm matter}^{\rm ren}
\right),
]
with the usual addition of nonminimal (\xi\phi^2R) couplings if scalars are present. Salvio writes this in exactly this form and reviews the generic renormalizable matter sector. ([arXiv][6])

This class does what the original (U(1)^4) construction could not. Stelle proved renormalizability of curvature-squared gravity and derived the needed BRS/Slavnov identities; Fradkin and Tseytlin showed asymptotic freedom in the essential gravitational couplings; Salvio emphasizes that the renormalizability persists in the presence of the most general renormalizable matter couplings of a generic QFT. Here the truly marginal gravitational couplings are (f_0) and (f_2), unlike the original rescaled-(\sqrt{\kappa}) argument, which only hides the fact that ordinary low-energy gravity expands in (Gp^2). ([APS Link][7])

A, B, and C are then handled as follows. For **A**, the (C^2) counterterm is already part of the bare action, so the fermion-induced Weyl-squared divergence is absorbed directly. More generally, the whole theory is in the renormalizable quadratic-gravity class, so the Einstein–Dirac one-loop obstructions are artifacts of the **two-derivative** Einstein theory, not of the four-derivative completion. ([BPB][3])

For **B**, the high-momentum graviton propagator behaves as (1/p^4), and the local action already contains the (p^4), (p^2), and (p^0) sectors: (C^2,R^2) for the four-derivative part, (\bar M_P^2R) for the two-derivative part, and (\Lambda) for the zero-derivative/background sector. Salvio’s review makes the pole structure explicit: the spectrum contains the ordinary massless graviton plus a massive spin-2 mode and a massive scalar, and the (1/p^4) behavior is exactly what changes the power counting. ([arXiv][6])

For **C**, the resolution is a structural reformulation rather than a TEGR-internal absorption. TEGR is no longer required to be the exact renormalization-closed UV theory. At most, the Einstein–Hilbert term can still be rewritten in TEGR form in the classical low-energy regime; the full UV theory is **not** TEGR, and that is precisely why the teleparallel matter-loop mismatch stops being an inconsistency. Salvio notes that below the extra-mode mass (M_2) the theory resembles Einstein gravity plus small corrections, which is the right sense in which GR survives. ([Cris Unibo][5])

The real issue here is pole content. Ordinary quadratic gravity, with standard Feynman quantization, contains a massive spin-2 **ghost**. Salvio is explicit about that. If “coherent quantum theory” means “perturbatively renormalizable and with a unitary S-matrix candidate,” the explicit proposal in this class is the **fakeon** prescription of Anselmi and Piva: keep the same higher-derivative action, but quantize the massive spin-2 pole as a fakeon rather than a physical state. They compute the one-loop renormalization in that framework and argue that renormalizability can be made compatible with unitarity, at the price of microcausality violation above the fakeon mass; their absorptive-unitarity discussion is stated for vanishing cosmological constant. ([arXiv][6])

In this route, goal (i) is preserved in the **strongest** available form: local perturbative renormalizability. Goal (ii) is weakened: GR survives only as an **IR/classical limit**, not as an exact quantum TEGR reduction. Goal (iii) is also weakened: the original “equal renormalized inertial and gravitational masses” mechanism is abandoned and replaced by the standard diffeomorphism-invariant notion of universal coupling. ([arXiv][6])

## Bottom line

The correct impossibility statement is:

[
\boxed{\text{No strict }U(1)^4\text{/TEGR, finite-coupling, local-BPHZ completion can absorb A,B,C.}
}
]

The conservative, fully established fix is the **teleparallel-matched EFT** above. It preserves the classical GR limit and a low-energy equivalence principle, but it **abandons** the hope that gravity is renormalizable in the same sense as Yang–Mills. The strongest perturbatively renormalizable fix is **quadratic gravity**; if you want a unitary candidate within that class, the explicit proposal is the **fakeon** version, but then exact TEGR closure, the original (U(1)^4) picture, and standard microcausality must all be sacrificed to some degree. ([arXiv][2])

So there is no way to keep **all** of (i), (ii), (iii). The least painful sacrifice is:

* keep (ii) and a low-energy form of (iii), abandon strong (i) → **EFT repair**;
* keep strong (i), accept only weakened (ii) and (iii) → **quadratic gravity/fakeons**.

[1]: https://cds.cern.ch/record/621859/files/0306127.pdf "https://cds.cern.ch/record/621859/files/0306127.pdf"
[2]: https://arxiv.org/abs/gr-qc/9405057 "https://arxiv.org/abs/gr-qc/9405057"
[3]: https://bpb-us-e2.wpmucdn.com/websites.umass.edu/dist/e/23826/files/2014/11/Duff-anomaly-reminisces.pdf "https://bpb-us-e2.wpmucdn.com/websites.umass.edu/dist/e/23826/files/2014/11/Duff-anomaly-reminisces.pdf"
[4]: https://arxiv.org/html/2310.01460v11 "https://arxiv.org/html/2310.01460v11"
[5]: https://cris.unibo.it/retrieve/e1dcb339-96d7-7715-e053-1705fe0a6cc9/EPJC_82%282022%29186.pdf "https://cris.unibo.it/retrieve/e1dcb339-96d7-7715-e053-1705fe0a6cc9/EPJC_82%282022%29186.pdf"
[6]: https://arxiv.org/pdf/1804.09944 "https://arxiv.org/pdf/1804.09944"
[7]: https://link.aps.org/doi/10.1103/PhysRevD.16.953 "https://link.aps.org/doi/10.1103/PhysRevD.16.953"

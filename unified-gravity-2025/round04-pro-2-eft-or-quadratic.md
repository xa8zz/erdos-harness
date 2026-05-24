---
id: R04-pro-2-eft-or-quadratic
type: research
date: 2026-05-24
intent: >
  Given the established disproof of one-loop renormalizability, determine
  whether any modification of the construction yields a coherent quantum
  theory of gravity addressing the three obstructions while preserving
  the stated goals, or prove that no such modification exists.
predecessors: [R01-paper-intake, R02-pro-1-weyl-sq-counterterm, R02-pro-2-paper-subtraction-defect, R02-pro-3-teleparallel-matter-loop, R03-pro1-subtraction-confirmed, R03-pro2-action-dynamical]
prompt: unified-gravity-2025/prompts/researcher-R04-zoom-out-alternative-search.md
siblings: [R04-pro-1-eft-or-quadratic]
action:
  kind: extends
  target: R03-pro1-subtraction-confirmed
claim: >
  Within the local perturbative BPHZ / algebraic-renormalization setting, no
  modification of the original construction cures obstructions A, B, C while
  preserving all three original goals simultaneously. The exact U(1)^4 + TEGR
  one-parameter sector is not radiatively closed: once loops generate
  BRST-nontrivial ghost-number-0 invariants outside that sector, no change of
  subtraction scheme or multiplicative Z-factor keeps the theory inside it.
  Sharp corollary: TEGR-only fails immediately by C and additionally by A, B;
  New-GR-only addresses the one-loop torsion-quadratic mismatch of C but lacks
  the C^2 / R^2 four-derivative basis needed for A and the higher-dimensional
  matter counterterms needed for the Einstein-Dirac axial-current quartic
  divergence. Two coherent descendants: (Proposal A) teleparallel/tetrad EFT
  with bare action containing -Lambda + (1/16 pi G_N)(c_1 T_1 + c_2 T_2 + c_3
  T_3) + alpha_C C^2 + alpha_R R^2 + alpha_E E + sum_I (d_I / Lambda_*^{Delta_I
  - 4}) O_I, matched at low energy to c_i(mu_0) = (1/4, 1/2, -1); preserves
  classical GR/TEGR limit (ii) and universal low-energy matter coupling form
  of (iii), abandons strict perturbative renormalizability (i); (Proposal B)
  curvature-squared quadratic gravity with bare action containing -Lambda_C +
  (-zeta/2 kappa^2) R + alpha (R_{mu nu} R^{mu nu} - (1/3) R^2) - (xi/6) R^2,
  quantized with Anselmi-Piva fakeon prescription rather than standard
  Feynman; preserves perturbative renormalizability (i) most strongly,
  exhibits massless graviton + massive spin-2 fakeon + massive scalar in
  spectrum, abandons exact TEGR closure (ii) and renormalization-prescription
  EP (iii). No fix simultaneously preserves all three goals exists within the
  structural family.
verifiers_at_time:
  - [gpt-pro-R04-pro-2, agrees]
confidence_at_time: high
---

**Verdict**

Within the **local perturbative BPHZ/algebraic-renormalization setting** that the original program claims, there is **no modification that cures A, B, and C while preserving all three original goals simultaneously**. The obstruction is structural: the exact (U(1)^4)+TEGR one-parameter sector is **not radiatively closed**. Once loops generate BRST-nontrivial ghost-number-zero invariants outside that sector, no change of subtraction scheme or multiplicative (Z)-factor can keep the theory inside it. The best possible answer is therefore a tradeoff:

1. **Keep the teleparallel/GR classical limit:** reinterpret the construction as a **teleparallel/tetrad EFT** (or New-GR EFT) with the full local counterterm tower. This cleanly absorbs A, B, C, but abandons goal (i) as a finite-coupling perturbatively renormalizable theory.

2. **Keep perturbative renormalizability:** replace the microscopic theory by **four-derivative quadratic gravity**, ideally with the **fakeon** prescription. This cleanly absorbs A, B, C in a local renormalizable QFT, but abandons the exact microscopic (U(1)^4)/TEGR picture and weakens goals (ii) and (iii) to low-energy statements. ([Deferential Geometry][1])

The clean impossibility statement is therefore:

> **No local BPHZ-renormalizable descendant of the original construction can preserve both exact TEGR closure and the original “same footing as SM gauge theory” goal.**
> To cure C you must at least leave the one-parameter TEGR family; to cure A and B you must add four-derivative gravitational operators; once you do that, exact TEGR reduction is no longer the renormalization-closed microscopic theory. ([Cris Unibo][2])

## Why the exact-family rescue is impossible

Partanen and Tulkki’s 2025 construction is explicitly **abelian**: their eq. (57) defines (H^a_{\mu\nu}=\partial_\mu H^a_\nu-\partial_\nu H^a_\mu), with no commutator terms, and the text immediately explains that the four factors commute. Their gravitational kinetic term is the TEGR-form torsion/superpotential term, eq. (61), (L_{g,\mathrm{kin}}=\frac{1}{4\kappa}H_{a\mu\nu}S^{a\mu\nu}\sqrt{-g}), and the full gauge-invariant action is their eq. (63). Their rescaling (H\to \sqrt{\kappa},H') in eqs. (67)–(74) removes (\kappa) from the quadratic prefactor only by moving the coupling into the covariant derivative, so it does not by itself create a UV-complete renormalizable coupling in the Yang–Mills sense. ([Acris][3])

Barnich, Brandt, and Henneaux (2000, *Local BRST cohomology in gauge theories*, arXiv:hep-th/0002245) give the right general criterion: local counterterms are controlled by ghost-number-zero BRST cohomology (H^{0,n}(s|d)). Their review states that (H^{0,n}(s|d)) controls counterterms, that nontrivial counterterms must satisfy (S S_k=0), and that BRST-exact pieces are removable by field redefinitions or gauge-fixing changes. They also state that gauge-invariant local operators furnish the basis of the ghost-number-zero cohomology class relevant for physical counterterms. So if loops generate a local gauge-invariant functional that is not already in the bare basis, the theory is not stable under renormalization. ([Deferential Geometry][1])

That is exactly what obstruction **A** says. Duff (1994, *Twenty years of the Weyl anomaly*, arXiv:hep-th/9308075) writes the one-loop 4D counterterm as (\Delta L \propto b,C_{\mu\nu\rho\sigma}^2+b'G+cH), and gives (b=[N_s+6N_F+12N_V]/[120(4\pi)^2]), so one Dirac fermion contributes (b=1/[20(4\pi)^2]\neq 0). He also notes that the two-point function already fixes that (C^2) coefficient. Deser and van Nieuwenhuizen (1974, *Nonrenormalizability of the quantized Dirac-Einstein system*, DOI 10.1103/PhysRevD.10.411) summarize their result by saying the one-loop divergence is proportional to the **fourth power of the fermion axial-vector current**. Those are class-I BRST cocycles, not removable BRST-exact artifacts. So a TEGR-only gravitational basis plus a renormalizable Dirac matter sector is not radiatively closed. ([BPB][4])

Obstruction **B** is the same instability seen concretely in the paper’s own one-loop formulas. Partanen and Tulkki’s graviton self-energy section (their eqs. (187)–(205)) introduces divergent projector structures (\hat P_B) and (\hat P_{3,2,1}) proportional to (p^4), while the bare counterterm basis in eq. (189) is only (i(Z_H-1)p^2\hat P_{1,2,1}). Their eq. (194) decomposes (\hat P_B) as
[
\hat P_B=\hat P_{3,2,1}-10m_e^2c^2,p^{-2}\hat P_{1,2,1}-30m_e^4c^4,p^{-4}P_{1,0,1},
]
and their renormalization conditions eq. (203) are imposed to make Newtonian-potential corrections integrable. Most importantly, eq. (204) gives a momentum-dependent
[
\delta Z_H^{(1)}\propto \kappa c,p^2!\left[\frac{37}{15}-\frac{4m_e^2c^2}{p^2}-\frac{24m_e^4c^4}{p^4}+\cdots\right],
]
so when that multiplies the tree (p^2\hat P_{1,2,1}) counterterm it contains an (m_e^4/p^2) piece. That is not a local polynomial counterterm in the BPHZ sense. Read cohomologically, B is not a renormalization-scheme issue at all: it says the local quadratic operator basis is too small and must be enlarged by (p^4) operators (and, if desired, a cosmological term). ([Acris][3])

Obstruction **C** kills exact TEGR closure even before full quantum gravity is turned on. Casadio, Kuntz, and Paci (2022, *Quantum fields in teleparallel gravity: renormalization at one-loop*, arXiv:2110.04325) write the TEGR torsion scalar as the special coefficient choice
[
\frac14,T^\rho{}*{\mu\nu}T*\rho{}^{\mu\nu}
+\frac12,T^\rho{}*{\mu\nu}T^{\nu\mu}{}*\rho
-T^\rho{}*{\mu\rho}T^{\nu\mu}{}*\nu,
]
their eq. (2.24). In section 4 they show that with full equivalence-principle coupling the heat-kernel coefficient (a_2) becomes **quartic in torsion**, while with gauge-only coupling it yields only the Yang–Mills-type contraction (T^\rho{}*{\mu\nu}T*\rho{}^{\mu\nu}), not the TEGR combination. They then say explicitly that Newton’s constant alone cannot absorb the divergence unless it appears in exactly the TEGR combination, and propose instead the three-parameter “New GR” action, their eq. (4.8), with independent coefficients (c_1,c_2,c_3). They also emphasize that this is only a one-loop matter-on-background result and that an all-loop renormalizability proof would still be needed. ([Cris Unibo][2])

So the sharp corollary is:

* **TEGR only** fails by C immediately, and by A/B as soon as dynamical loops are considered.
* **New GR only** can address the specific one-loop torsion-quadratic mismatch of C, but it does **not** address A or B, because it still lacks the (C^2/R^2)-type four-derivative basis and the higher-dimensional matter counterterms. ([Cris Unibo][2])

That is the impossibility result in the sense relevant here: **no all-goals-preserving local perturbative fix exists inside the original family.**

## Proposal A: a coherent teleparallel/tetrad EFT completion

The minimal rescue that preserves the most of the classical picture is to demote the construction from “fundamental renormalizable gauge theory” to a **covariant teleparallel/tetrad EFT**. A suitable bare action is
[
S_{\text{tele-EFT}}
===================

\int d^4x,h\Bigg[
-\Lambda(\mu)
-\frac{1}{16\pi G_N(\mu)}
\big(c_1(\mu)T_1+c_2(\mu)T_2+c_3(\mu)T_3\big)
+\alpha_C(\mu),C_{\mu\nu\rho\sigma}^2
+\alpha_R(\mu),R^2
+\alpha_E(\mu),E
+\sum_I \frac{d_I(\mu)}{\Lambda_*^{\Delta_I-4}},
\mathcal O_I(T,\nabla T,\psi)
\Bigg]
+S_{\rm mat}[e,\omega,\psi].
]
Here
[
T_1=T^\rho{}*{\mu\nu}T*\rho{}^{\mu\nu},\quad
T_2=T^\rho{}*{\mu\nu}T^{\nu\mu}{}*\rho,\quad
T_3=T^\rho{}*{\mu\rho}T^{\nu\mu}{}*\nu,
]
and one matches
[
c_i(\mu_0)=\left(\frac14,\frac12,-1\right)+O(\mu_0^2/\Lambda_*^2),
]
which is exactly the Casadio–Kuntz–Paci “easy fix” promoted to a full EFT. The TEGR combination is recovered only as a low-energy matching condition, not as an RG-invariant microscopic identity. Krššák et al. (2019, *Teleparallel theories of gravity: illuminating a fully invariant approach*) review the same New-GR three-parameter structure. ([Cris Unibo][2])

How it handles the obstructions:

1. **A:** (\alpha_C C^2) absorbs the Weyl-squared divergence, and the EFT tower (\mathcal O_I) includes the higher-dimensional fermionic operators needed to absorb the Einstein–Dirac axial-current quartic divergence. This is exactly what EFT is for: once the BRST-allowed operator basis is complete, algebraic renormalization works order by order. ([BPB][4])

2. **B:** the local quadratic basis now includes the missing (p^4) spin-2 and spin-0 structures, so the graviton 1PI two-point function can be renormalized by **local couplings** (\alpha_C,\alpha_R,\Lambda,G_N,\dots), not by a nonlocal (\delta Z_H(p^2)). ([Acris][3])

3. **C:** the three coefficients (c_i) absorb the torsion-quadratic mismatch highlighted by Casadio et al.; if you keep full covariant matter coupling to preserve the equivalence-principle spirit, the EFT tower must also include the torsion-quartic structures generated in their section 4.1. If instead you use gauge-only coupling, the one-loop divergence simplifies, but goal (iii) is weakened. ([Cris Unibo][2])

Internal consistency for proposal A:

* **BRST/locality:** complete local operator basis, so the counterterms are exactly the ghost-number-zero cocycles allowed by symmetry. ([Deferential Geometry][1])
* **Propagator:** keep the (p^2) TEGR/New-GR propagator as the EFT leading term and treat higher-derivative terms as perturbative insertions, not as an exact resummed propagator. If you promote the quadratic extensions to an exact microscopic action, the spectrum generally changes; Jiménez et al. (2020, *General teleparallel quadratic gravity*) find that the linearized theory generically contains extra symmetric rank-2 fields and a 2-form. ([SCOAP3][5])
* **RG flow:** Wilsonian running of (c_i,\alpha_C,\alpha_R,d_I,\dots).
* **Classical limit:** (c_i\to(1/4,1/2,-1)) and higher-dimension operators decouple as (E/\Lambda_*\to 0), recovering GR/TEGR phenomenology. ([Cris Unibo][2])

**Goal status for proposal A.**
Goal **(ii)** is preserved best: GR/TEGR survives as the classical low-energy limit. Goal **(iii)** is preserved only in the usual modern form—universal low-energy matter coupling—not via the original “set renormalized inertial mass equal to renormalized gravitational mass” mechanism. Goal **(i)** is abandoned in its strong form: this is a predictive EFT, not a finite-coupling perturbatively renormalizable UV completion. ([Deferential Geometry][1])

## Proposal B: a fundamental local renormalizable completion = quadratic gravity, preferably with fakeons

If the priority is to restore goal **(i)** as strongly as possible, the cleanest known local perturbative route is **quadratic gravity**:
[
S_{\rm QG}
==========

-\frac{\mu^{-\epsilon}}{2\kappa^2}
\int d^Dx,\sqrt{-g},
\left[
2\Lambda_C
+\zeta R
+\alpha!\left(R_{\mu\nu}R^{\mu\nu}-\frac13 R^2\right)
-\frac{\xi}{6}R^2
\right]
+S_{\rm matt}[e,\omega,\psi]
+S_{\rm gf}
+S_{\rm gh}.
]
This is the standard Stelle/Fradkin–Tseytlin/Anselmi–Piva class: Stelle (1977, DOI 10.1103/PhysRevD.16.953) proved renormalizability of curvature-squared gravity; Fradkin and Tseytlin (1982, *Renormalizable asymptotically free quantum theory of gravity*) proved asymptotic freedom of the essential couplings; Anselmi and Piva’s fakeon formulation gives the most developed perturbatively unitary version. Salvio’s 2018 review (*Quadratic Gravity*, arXiv:1804.09944) summarizes the matter-coupled renormalizability results. ([Frontiers][6])

How it handles the obstructions:

1. **A:** the (C^2)/(R^2) sector is already in the bare action, so the matter-induced Weyl-squared divergence is absorbed by (\delta\alpha,\delta\xi). And because the UV propagator now falls as (1/p^4), the theory is power-counting renormalizable with a generic renormalizable matter sector; Salvio’s review states explicitly that renormalizability is preserved in the presence of the most general renormalizable QFT, so the Einstein–Dirac eight-fermion divergence is not part of the renormalized operator basis of quadratic gravity. ([BPB][4])

2. **B:** the free quadratic operator already contains the missing (p^4) structures. In Anselmi and Piva’s notation, the graviton propagator is
   [
   \langle h_{\mu\nu}h_{\rho\sigma}\rangle_0
   =
   \frac{i,I_{\mu\nu\rho\sigma}}{2p^2(\zeta-\alpha p^2)}

*

\frac{i(\alpha-\xi),\varpi_{\mu\nu}\varpi_{\rho\sigma}}
{6(p^2)^2(\zeta-\alpha p^2)(\zeta-\xi p^2)},
]
so local renormalization of (\alpha,\xi,\zeta,\Lambda_C) is exactly the right response to the (p^4) projector structures that Partanen and Tulkki found but had no local home for. Anselmi and Piva also give explicit one-loop counterterms and beta functions, including (\Delta\alpha=-133/10) and the corresponding (\beta)-functions in their eqs. (3.12)–(3.13). ([arXiv][7])

3. **C:** this proposal handles C by **abandoning exact TEGR closure at the microscopic level**. GR is recovered only in the infrared, not as an exact renormalization-closed teleparallel identity. That is the unavoidable trade: once matter loops generate independent torsion-quadratic and higher-derivative structures, insisting on exact TEGR reduction is what fails. ([Cris Unibo][2])

Internal consistency for proposal B:

* **BRST/BV:** Anselmi and Piva formulate the theory in the Batalin–Vilkovisky language and the effective action satisfies the master equation ((\Gamma,\Gamma)=0). They also state that the fakeon prescription does **not** affect the renormalization, which coincides with the Euclidean/local counterterm analysis. ([arXiv][7])
* **Propagator and pole content:** the propagator has the massless graviton pole plus extra massive poles at (p^2=\zeta/\alpha) and (p^2=\zeta/\xi). With the ordinary Feynman prescription, the massive spin-2 pole is a ghost; Anselmi and Piva explicitly say that with the Feynman prescription the absorptive part gets ghost contributions, whereas with the **fakeon prescription** the cut spectrum contains only the graviton and matter. ([arXiv][7])
* **RG flow:** one-loop beta functions are explicit, and Fradkin–Tseytlin proved asymptotic freedom of the essential couplings. ([arXiv][7])
* **Dimensional analysis:** unlike the original rescaling trick in Partanen’s eq. (74), this is a genuine four-derivative UV theory: the graviton propagator behaves as (1/p^4) at large momentum and the essential couplings are dimensionless in the UV power counting. ([Acris][3])
* **Classical limit:** for (p^2\ll \zeta/\alpha,\zeta/\xi), integrating out the heavy modes gives Einstein gravity plus suppressed higher-curvature corrections. Setting (\Lambda_C=0) matches the flat-background setup used in the original construction and in Anselmi–Piva’s unitarity analysis. ([arXiv][7])

**Goal status for proposal B.**
Goal **(i)** is preserved most strongly: this is the closest known way to put gravity on the same perturbative local-QFT footing as renormalizable matter sectors. Goal **(ii)** survives only as an **IR Einstein limit**, not as exact TEGR closure or an exact (\eta=\eta(A)) reduction. Goal **(iii)** survives only as universal low-energy coupling; the original mass-equality renormalization prescription should be dropped. ([Frontiers][6])

## Bottom line

So the sharp answer is:

* **No exact-family fix exists.** There is no local BPHZ-renormalizable modification that keeps the original abelian (U(1)^4) microscopic picture, keeps exact TEGR closure under renormalization, and still removes A, B, and C. ([Deferential Geometry][1])
* **The minimal coherent descendant** is a **teleparallel/tetrad EFT/New-GR completion** with the full local counterterm tower. This preserves the GR/TEGR classical limit best, but abandons strict perturbative renormalizability.
* **The fundamental renormalizable descendant** is **quadratic gravity**, preferably in the **fakeon** formulation. This preserves perturbative renormalizability best, but abandons the microscopic (U(1)^4)+TEGR identity and keeps GR only as an infrared limit. ([Cris Unibo][2])

If the standard you care about most is “same footing as the SM” in the BPHZ sense, the answer is **quadratic/fakeon gravity**. If the standard you care about most is “stay as close as possible to TEGR and classical GR,” the answer is **teleparallel EFT/New GR**, not a finite-coupling UV completion.

[1]: https://deferentialgeometry.org/papers/0002245.pdf "https://deferentialgeometry.org/papers/0002245.pdf"
[2]: https://cris.unibo.it/retrieve/e1dcb339-96d7-7715-e053-1705fe0a6cc9/EPJC_82%282022%29186.pdf "https://cris.unibo.it/retrieve/e1dcb339-96d7-7715-e053-1705fe0a6cc9/EPJC_82%282022%29186.pdf"
[3]: https://acris.aalto.fi/ws/portalfiles/portal/180668527/Partanen_2025_Rep._Prog._Phys._88_057802.pdf "https://acris.aalto.fi/ws/portalfiles/portal/180668527/Partanen_2025_Rep._Prog._Phys._88_057802.pdf"
[4]: https://bpb-us-e2.wpmucdn.com/websites.umass.edu/dist/e/23826/files/2014/11/Duff-anomaly-reminisces.pdf "https://bpb-us-e2.wpmucdn.com/websites.umass.edu/dist/e/23826/files/2014/11/Duff-anomaly-reminisces.pdf"
[5]: https://scoap3-prod-backend.s3.cern.ch/media/files/53819/10.1016/j.physletb.2020.135422_a.pdf "https://scoap3-prod-backend.s3.cern.ch/media/files/53819/10.1016/j.physletb.2020.135422_a.pdf"
[6]: https://www.frontiersin.org/journals/physics/articles/10.3389/fphy.2018.00077/full "https://www.frontiersin.org/journals/physics/articles/10.3389/fphy.2018.00077/full"
[7]: https://arxiv.org/pdf/1803.07777 "https://arxiv.org/pdf/1803.07777"

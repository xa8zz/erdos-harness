---
id: R03-pro2-action-dynamical
type: verification
date: 2026-05-24
intent: >
  Verify against the primary source whether the candidate theory's gravitational
  kinetic term is a dynamical Yang-Mills-style F^2 (E^2 - B^2) action or a
  topological Pontryagin-density / instanton-like action (E . B) that would be
  a total divergence for an abelian gauge field and therefore non-dynamical.
predecessors: []
prompt: unified-gravity-2025/prompts/researcher-R03-verify-action-density-claim.md
action:
  kind: standalone
claim: >
  Direct paper-citation verification (arXiv:2310.01460v11) establishes that the
  gravitational kinetic term L_{g,kin} = (1/8 kappa) H_{a mu nu} H-tilde^a_{sigma
  lambda} epsilon^{mu nu sigma lambda} sqrt(-g) = (1/4 kappa) H_{a mu nu}
  S^{a mu nu} sqrt(-g) at eq. 61 is a standard teleparallel superpotential
  contraction (the "torsion scalar" combination of TEGR), NOT an abelian
  Pontryagin density. The decisive distinction is the definition of the dual
  object H-tilde at eqs. 59-60: H-tilde^a_{sigma lambda} = (1/2) epsilon_{sigma
  lambda mu nu} S^{a mu nu} where S^{a mu nu} = e^a_rho [(1/2)(H^{nu mu rho}
  + H^{mu rho nu} - H^{rho nu mu}) + g^{rho mu} H^{sigma nu}_sigma - g^{rho nu}
  H^{sigma mu}_sigma] is the soldered superpotential, NOT the Hodge dual of H.
  The paper explicitly warns that in soldered gauge theories the superpotential
  is not the field strength. The gauge structure is genuinely abelian U(1)^4
  (eqs. 39, 55-57): the field strength contains no commutator terms and the
  paper states "our gauge theory of unified gravity is Abelian." The graviton
  propagator at eq. 138, i P^{(D)} / (p^2 + i epsilon), is the standard
  harmonic-gauge linearized-GR propagator, consistent with a dynamical
  TEGR-style kinetic term plus ordinary Faddeev-Popov gauge fixing. The
  "gravitational action is a total divergence / Pontryagin density" objection
  (Pitkänen TGD-diary blog, May 2025) is refuted: the action is dynamical, not
  topological, and the topological-density misreading arises only by silently
  substituting S^{a mu nu} for H^{a mu nu}, which the paper explicitly forbids.
verifiers_at_time:
  - [gpt-pro-R03-verify-2, agrees]
confidence_at_time: high
---

I checked the primary paper directly. The specific claim you asked me to test is **refuted**: the gravity kinetic term in Partanen–Tulkki is **not** an Abelian Pontryagin density ( \varepsilon^{\mu\nu\rho\sigma}F_{\mu\nu}F_{\rho\sigma} ). The misleading part is that their first presentation uses an epsilon tensor, but the “dual” object is **not** the Hodge dual of the field strength itself; it is built from a distinct superpotential (S^{a\mu\nu}). Once you follow their own definitions, the term is the standard **teleparallel torsion-scalar / superpotential contraction** (H\cdot S), i.e. a dynamical TEGR-type kinetic term, not a topological theta-term. ([arXiv][1])

**1. Exact kinetic term in the paper.**
Section 6 opens by saying it will write “the kinetic Lagrangian density term, which depends on the gravity gauge field only, and is necessary for the description of the dynamics of gravity.” Then, in section 6.1, eq. **(61)** (PDF p. 19), the paper gives
[
L_{g,\mathrm{kin}}
==================

# \frac{1}{8\kappa},H_{a\mu\nu},\widetilde H^{a}{}_{\sigma\lambda},\varepsilon^{\mu\nu\sigma\lambda}\sqrt{-g}

\frac{1}{4\kappa},H_{a\mu\nu}S^{a\mu\nu}\sqrt{-g}.
]
Later, in the reduced/geometric UGM Lagrangian, eqs. **(108)–(109)** (PDF p. 26), the pure gravity term reappears explicitly as
[
L_{g,\mathrm{kin}}=\frac{1}{4\kappa}H_{\rho\mu\nu}S^{\rho\mu\nu},
]
while the electromagnetic kinetic term on the same page is the usual
[
L_{\mathrm{em,kin}}=-\frac{1}{4\mu_0}F_{\mu\nu}F^{\mu\nu}.
]
So the paper itself distinguishes the gravity term from an ordinary Yang–Mills/QED (F^2) term. ([Acris][2])

**2. What tensor structure is it?**
It is **not** (a) the Yang–Mills scalar (H_{a\mu\nu}H^{a\mu\nu}), and it is **not** (b) the Pontryagin density ( \varepsilon^{\mu\nu\rho\sigma}H_{a\mu\nu}H^a_{\rho\sigma}). It is **(c) another structure**: a teleparallel/soldered-gauge invariant (H_{a\mu\nu}S^{a\mu\nu}). The decisive definitions are eqs. **(59)–(60)** (PDF p. 19):
[
\widetilde H^{a}{}*{\sigma\lambda}=\frac12 \varepsilon*{\sigma\lambda\mu\nu}S^{a\mu\nu},
]
with
[
S^{a\mu\nu}
===========

e^{a}{}*{\rho}!\left[
\frac12!\left(H^{\nu\mu\rho}+H^{\mu\rho\nu}-H^{\rho\nu\mu}\right)
+g^{\rho\mu}H^{\sigma\nu}{}*{\sigma}
-g^{\rho\nu}H^{\sigma\mu}{}*{\sigma}
\right].
]
The paper explicitly warns that in ordinary vector gauge theories the superpotential is just the field strength, but “**this is not the case in soldered gauge theories**.” Then eq. **(62)** shows that the epsilon form collapses to (2H*{a\mu\nu}S^{a\mu\nu}), not to ( \varepsilon H H). ([Acris][2])

This matches standard teleparallel gravity, not a theta-term. In the teleparallel literature, the corresponding invariant is the torsion-squared combination
[
L \propto \frac14,T^\rho{}*{\mu\nu}T*\rho{}^{\mu\nu}
+\frac12,T^\rho{}*{\mu\nu}T^{\nu\mu}{}*{\rho}
-T^\rho{}*{\mu\rho}T^{\nu\mu}{}*{\nu},
]
and it is equivalent **up to a separate divergence** to Einstein–Hilbert, not itself a pure divergence. See Maluf, *The teleparallel equivalent of general relativity* (2013, Ann. Phys. 525, 339–357, arXiv:1303.3897, DOI 10.1002/andp.201200272), eqs. (23)–(27), and Krššák et al., *Teleparallel theories of gravity: illuminating a fully invariant approach* (2019, Class. Quantum Grav. 36, 183001, arXiv:1810.12932, DOI 10.1088/1361-6382/ab2e1f), eqs. (77)–(78). Partanen–Tulkki themselves say their eq. (61) has “the same mathematical form” as TEGR. ([arXiv][3])

**3. On the Pontryagin-density / total-divergence argument.**
Your general Abelian statement is correct: for a 4D Abelian gauge field, the Pontryagin density is
[
\frac14 \varepsilon^{\mu\nu\alpha\beta}F_{\mu\nu}F_{\alpha\beta}
================================================================

# \frac12,{}^{!*}!F_{\mu\nu}F^{\mu\nu}

\partial_\mu C_4^\mu,
\qquad
C_4^\mu=\varepsilon^{\mu\alpha\beta\gamma}A_\alpha\partial_\beta A_\gamma.
]
A clean source is Jackiw, *S. S. Chern and Chern-Simons Terms* (2004, arXiv:math-ph/0408051), eqs. (1a) and (5a). ([arXiv][4])

But that argument does **not** hit this paper’s gravity kinetic term, because the paper does **not** use ( \varepsilon H H) as the stand-alone gravity action. Its term is (H\cdot S). The relevant sections do not treat it as a topological density; instead they use it as the free gravity kinetic term, add the usual gauge-fixing term (L_{g,\mathrm{gf}}), derive the gravity field equation, and then derive the graviton propagator. The matter coupling (L_{g,\mathrm{int}}=-(g'*g/g_g)T_m^{\mu\nu}H*{\mu\nu}) is present, but it is not “saving” an otherwise topological action; the free gravity term is already of the TEGR-type dynamical form. ([Acris][2])

**4. Is the gauge structure really Abelian (U(1)^4)?**
Yes, as presented in this paper it is genuinely Abelian. In section 4.1, eq. **(39)** (PDF p. 14), they write
[
U=\bigotimes_a U_a,\qquad U_a=e^{i\phi_{(a)}t^{(a)}},
]
and then explicitly say that although the matrices (U_a) are noncommuting as matrices, the operations act on different components and therefore “**trivially commute**,” so “**our gauge theory of unified gravity is Abelian**.” ([Acris][2])

The local gauge sector is also Abelian in the usual field-theory sense. In eqs. **(55)–(57)** (PDF p. 18), the covariant derivative and transformation law are
[
D_\nu=\partial_\nu-i g'*g H*{a\nu}t^a,\qquad
H_{a\nu}\to H_{a\nu}+\frac{1}{g'*g}\partial*\nu\phi_a,
]
and the field strength is
[
H_{a\mu\nu}=\partial_\mu H_{a\nu}-\partial_\nu H_{a\mu}.
]
The paper immediately comments that this equation “**does not contain commutator terms**.” So there is no Yang–Mills-style (f^{abc}H_\mu^bH_\nu^c) hidden in the gauge algebra. What changes the gravity kinetic term is not non-Abelian structure; it is the **soldered** tensor structure, e.g. (H_{\rho\mu\nu}=e^a{}*\rho H*{a\mu\nu}), which allows additional contractions and introduces the superpotential (S^{a\mu\nu}). ([Acris][2])

**5. Final verdict on dynamics.**
The gravitational sector in this paper does have a **dynamical** kinetic term. The correct reading is: the **bare** pure-gravity piece is a teleparallel (H\cdot S) term with ordinary gauge redundancy, not a pure topological density; then the paper adds a standard gauge-fixing term, after which the quadratic operator is invertible in the usual way. So the right verdict is: **not Pontryagin/topological; yes, dynamical after ordinary gauge fixing.** ([Acris][2])

**6. Propagator cross-check.**
The paper’s propagator is consistent with that reading. In section 8.3 (PDF pp. 30–31), eq. **(135)** rewrites the harmonic-gauge-fixed gravity action as a quadratic form
[
S'_{g,\mathrm{kin}}[H]
======================

\frac{1}{\kappa\hbar^2}\int H^{\mu\nu}(-P_{\mu\nu,\alpha\beta}\hbar^2\partial^2)H^{\alpha\beta},d^4x,
]
eq. **(136)** defines the Green’s function of that operator, and eq. **(138)** gives
[
\widetilde D^{(g,\xi_g=1)}_{\alpha\beta,\rho\sigma}(p)
======================================================

\frac{i,P^{(D)}_{\alpha\beta,\rho\sigma}}{p^2+i\epsilon}.
]
The paper then says this is the well-known harmonic-gauge graviton propagator of linearized GR. That is exactly what you would expect from a teleparallel/linearized-gravity kinetic term plus gauge fixing, and **not** what you would expect from trying to invert a pure Abelian theta-term. ([Acris][2])

So the bottom line is: **the “instanton-density kinetic term” reading is a misreading of eq. (61).** It becomes tempting only if one silently replaces the paper’s superpotential (S^{a\mu\nu}) by the field strength (H^{a\mu\nu}), but the paper explicitly tells you not to do that in this soldered gauge theory. ([Acris][2])

[1]: https://arxiv.org/abs/2310.01460 "https://arxiv.org/abs/2310.01460"
[2]: https://acris.aalto.fi/ws/portalfiles/portal/180668527/Partanen_2025_Rep._Prog._Phys._88_057802.pdf "https://acris.aalto.fi/ws/portalfiles/portal/180668527/Partanen_2025_Rep._Prog._Phys._88_057802.pdf"
[3]: https://arxiv.org/pdf/1303.3897 "https://arxiv.org/pdf/1303.3897"
[4]: https://arxiv.org/pdf/math-ph/0408051 "https://arxiv.org/pdf/math-ph/0408051"

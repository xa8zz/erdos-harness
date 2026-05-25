---
id: R07-pro-2-yang-mills-analogy
type: research
date: 2026-05-25
intent: >
  Open assessment of the unified gravity program in light of the full
  established state (R02-R06) and the discourse-landscape findings,
  with Pro free to fetch and reach own conclusions.
predecessors: [R01-paper-intake, R02-pro-1-weyl-sq-counterterm, R02-pro-2-paper-subtraction-defect, R02-pro-3-teleparallel-matter-loop, R03-pro1-subtraction-confirmed, R03-pro2-action-dynamical, R04-pro-1-eft-or-quadratic, R04-pro-2-eft-or-quadratic, R05-discourse-landscape, R06-pro-1-branch-fork, R06-pro-2-chishtie-bensouilah, R06-pro-3-three-languages]
prompt: unified-gravity-2025/prompts/researcher-R07-zoom-out-with-chishtie.md
siblings: [R07-pro-1-narrowness-of-original-claim, R07-pro-3-barker-ghost-detail]
action:
  kind: extends
  target: R06-pro-1-branch-fork
claim: >
  Unified gravity is NOT an established renormalizable quantum theory of
  gravity and the original flagship claim should presently be treated as
  unsuccessful in its strict form. What survives is a speculative
  fixed-background U(1)^4 tensor-gauge program with some nontrivial
  tree-level phenomenology, but loop-level renormalization, spectrum,
  and branch-equivalence issues remain open. KEY NEW FRAMING: the
  Yang-Mills analogy underpinning the original claim is weaker than
  advertised in two specific ways. (1) In ordinary non-abelian gauge
  theory, gauge self-interactions are already fixed by the gauge
  principle through the field strength F = dA + A wedge A; in UG, the
  underlying U(1)^4 structure is abelian (commuting generators), the
  original formulation lacked graviton self-interaction, and the
  needed nonlinearity was added later through an extra stress-energy
  coupling. The symmetry principle is currently less constraining
  than the Standard Model analogy suggests. (2) Casadio-Kuntz-Paci
  explicitly contrast soldered teleparallel contractions (which mix
  internal and spacetime indices) with ordinary Yang-Mills theories
  where gauge and spacetime indices are unrelated. UG was trying to
  get both a Yang-Mills-like fixed-background gauge theory AND a
  teleparallel/GR recovery story out of the same construction; the
  July 2025 follow-up is effectively an admission that one cannot
  get both at once -- the Yang-Mills-like Minkowski branch is one
  object, and TEGR appears only after extra substitutions changing
  the symmetry content. The paper's "dimensionless coupling" rhetoric
  is also weaker than advertised: after the rescaling H -> sqrt(kappa)
  H', the paper itself defines the effective fine-structure constant
  as alpha_g = G p^2 / (hbar c^3), explicitly energy-dependent. The
  equivalence principle is imposed as a renormalization prescription
  (different bare-level renormalization relations for inertial vs
  gravitational mass, then equality required for renormalized values),
  not derived from a Ward or Slavnov-Taylor identity. NUANCE ON 2PN
  LIGHT-DEFLECTION CLAIM: GR ray optics is polarization-blind because
  it follows null geodesics of the metric; beyond geometric optics
  GR has small polarization-dependent corrections; QED vacuum
  polarization on curved backgrounds is the Drummond-Hathrell 1980
  effect. UG is advertising a CLASSICAL 2PN ray-optics signature, not
  a tiny beyond-ray-optics correction, so the nuance does not save UG --
  the 2PN polarization splitting is genuinely non-GR. To reverse the
  negative verdict the program would need: a genuinely local
  counterterm proof for the full nonlinear theory including the
  triple-graviton vertex, a fresh spectrum / unitarity analysis of
  the current U(1)^4 model, and a clean account of the relation
  between Minkowski and TEGR branches that does not rely on
  symmetry-breaking substitutions.
verifiers_at_time:
  - [gpt-pro-R07-pro-2, agrees]
confidence_at_time: high
---

## Assessment

My current assessment is that Partanen–Tulkki unified gravity is **not** an established renormalizable quantum theory of gravity, and the program’s original flagship claim should presently be treated as unsuccessful in its strict form. What survives is a speculative fixed-background (4\times U(1)) tensor-gauge program with some nontrivial tree-level phenomenology, but with the loop-level renormalization, spectrum, and branch-equivalence issues still open. That conclusion follows not just from outside criticism, but from the main paper’s own renormalization formulas, from later author follow-ups, and from the relevant gravity/teleparallel renormalization literature. ([arXiv][1])

The sharpest problem is the **paper-internal BPHZ mismatch**. In ordinary BPHZ/algebraic renormalization, ultraviolet subtractions must correspond to **local counterterms of the same form as the original Lagrangian**. The UG paper sets up bare renormalization with ordinary multiplicative (Z)-factors, including (H_{\mu\nu,\text{bare}}=\sqrt{Z_H},H_{\mu\nu}), and its geometric counterterm is just ((Z_H-1)H_{\rho\mu\nu}S^{\rho\mu\nu}/(4\kappa)), i.e. a constant (Z_H) multiplying the original kinetic structure. But the graviton self-energy formulas have overall (\kappa p^4) behavior with several projector structures, and the paper then chooses a **momentum-dependent** (\delta Z_H^{(1)}(p^2)) containing (m_e^2/p^2), (m_e^4/p^4), and logarithms, fixed by renormalization conditions chosen so the Newtonian-potential correction stays integrable. Read as BPHZ, that is not a finite-parameter local closure of the original action; it is either an implicit enlargement of the operator basis or an observable-level subtraction prescription for a particular propagator correction. 

That internal issue is also exactly where the broader gravity literature pushes. ’t Hooft and Veltman showed that pure gravity is special at one loop, but matter-coupled gravity already produces physical divergences that cannot all be removed by simple field renormalization. Deser and van Nieuwenhuizen then showed the quantized Dirac–Einstein system is one-loop nonrenormalizable, with an eight-fermion divergence. On the teleparallel side, Casadio, Kuntz, and Paci found that quantum matter loops do **not** close on the TEGR one-parameter torsion combination: with full teleparallel coupling the divergences become quartic in torsion, and with gauge-coupling-only they pick out only the Yang–Mills-like torsion contraction, which forces a more general multi-parameter teleparallel action if one wants one-loop closure. So the main paper’s failure is not an isolated technicality; it lands in exactly the direction standard results would have predicted. ([ADS][2])

BRST does not rescue this. The Barnich–Brandt–Henneaux local-BRST program is important precisely because it classifies the allowed local counterterms and anomalies in gauge theories, including cases with non-power-counting-renormalizable couplings. That means BRST can rule out symmetry-violating subtractions, but it does **not** imply that the original finite set of couplings is closed under renormalization. If gauge-invariant higher-derivative, torsion, or multi-fermion operators are not forbidden by additional structure, BRST typically classifies them as admissible rather than eliminating them. ([arXiv][3])

The paper’s “dimensionless coupling” rhetoric is also weaker than advertised. After the field rescaling (H\to \sqrt{\kappa},H'), the paper itself defines the effective gravity fine-structure constant as (\alpha_g = Gp^2/(\hbar c^3)), i.e. explicitly energy dependent. That is the familiar EFT-looking loop parameter, not a fixed Yang–Mills-style dimensionless coupling. Likewise, on the equivalence-principle front, the main paper says the inertial and gravitational electron masses obey **different renormalization relations** and then **assumes** that the renormalized values are equal. That is not the same thing as deriving equality from a Ward or Slavnov–Taylor identity. ([arXiv][1])

The 2025 follow-ups changed the program’s meaning in an important way. The July 2025 graviton-self-interaction paper says there is **no equivalence transformation** from UG to TEGR, that the substitutions used to obtain TEGR **break UG gauge symmetry**, and that the new graviton–graviton interaction term **does not contribute** to the TEGR Lagrangian. The same paper also says the newly introduced triple-graviton vertex leaves renormalization “for further work.” After that paper, it is no longer accurate to describe UG as a single theory with two equivalent presentations. The public record now contains, at minimum, a gauge-invariant Minkowski-UG branch and a symmetry-breaking TEGR-reduced branch. ([arXiv][4])

That branch split is not cosmetic; it exposes the deepest conceptual tension in the program. Teleparallel GR owes its special structure to “soldered” contractions between internal and spacetime indices, which Casadio–Kuntz–Paci explicitly contrast with ordinary Yang–Mills theories, where gauge and spacetime indices are unrelated. The Partanen–Tulkki program was always trying to get both a Yang–Mills-like fixed-background gauge theory and a teleparallel/GR recovery story out of the same construction. The July 2025 follow-up is effectively an admission that you do not get both at once: the Yang–Mills-like Minkowski branch is one object, and the TEGR branch appears only after extra substitutions that change the symmetry content. ([Cris Unibo][5])

At the same time, the program is **not empty**. The authors have produced concrete tree-level or semiclassical calculations: light deflection, perihelion precession, and atomic redshift, and Bensouilah’s 2026 paper gives a supportive small-angle photon–photon-scattering check in the Minkowski-UG framework. Those results mean UG is at least a worked-out alternative-gravity proposal, not pure handwaving. But they do not answer the loop-level questions, and the light-deflection paper explicitly treats the Minkowski formulation as a theory that already deviates from GR classically: it agrees with GR at 1PN, predicts polarization-dependent 2PN differences, and says UG is **not** a weak-field approximation of GR. ([arXiv][6])

One nuance is worth adding to your framing. It is too strong to say that GR never has polarization-dependent gravitational light propagation in any sense. In standard **ray optics** on a classical metric, the GR refractive indices for the two polarizations are equal, and the UG paper is right to contrast itself with that. But beyond geometric optics there are known polarization-dependent GR corrections, and in QED on curved backgrounds the classic Drummond–Hathrell effect gives polarization-dependent photon propagation from vacuum polarization. The important point is that this nuance does **not** save UG: the authors are advertising a 2PN ray-optics signature of the Minkowski-UG branch, not a tiny beyond-geometric-optics or QED-in-curved-space correction. ([arXiv][7])

The independent third-party record is mixed in tone but mostly negative on the flagship claim. Barker’s short paper found a ghostly teleparallel vacuum in the weak-field, zero-coupling limit of the earlier formulation; because that analysis targets an earlier presentation, it is not by itself the last word on v11, but it leaves a live spectrum problem. I did not find a later author paper that closes either the spectrum issue or the renormalization issue; the later author corpus I found is the original paper, the eight-spinor QED companion, the light-deflection paper, the perihelion paper, the atomic-redshift paper, and the July graviton-interaction paper. Chishtie’s 2026 Chinese Journal of Physics critique clearly exists and is explicitly framed as “nine interconnected structural limitations,” but I could verify only metadata/abstract-level information in this session, not independently audit all nine claims. Bensouilah is supportive, but only at tree level. 

So the best current scientific framing is this: **UG is alive as a speculative alternative-gravity research program, but not alive as its original strict renormalizable-quantum-gravity claim**. If one wants to preserve the classical GR/teleparallel connection, the natural descendant is an effective field theory with the full higher-derivative and torsion operator basis, in the standard Donoghue–Burgess spirit. If one instead prioritizes perturbative renormalizability, the natural descendant is higher-derivative quadratic gravity of the Stelle/Fradkin–Tseytlin type, with fakeon quantization in the Anselmi–Piva sense as one way to address the massive spin-2 problem at the price of modified microcausality above the fakeon scale. ([arXiv][8])

My bottom line is therefore fairly hard-edged: **it is not scientifically defensible today to present unified gravity as a solved, BPHZ-renormalizable quantum completion of gravity on the same footing as the Standard Model.** It is scientifically defensible to present it as an unconventional, partially developed alternative-gravity framework with some interesting tree-level calculations and a clear non-GR phenomenology, but with its core quantum claim still unproven and, in the strict original formulation, substantially undermined by both the paper’s own formulas and the surrounding literature. To reverse that verdict, the program would need a genuinely local counterterm proof for the full nonlinear theory including the triple-graviton vertex, a fresh spectrum/unitarity analysis of the current (4\times U(1)) model, and a clean account of the relation between the Minkowski and TEGR branches that does not rely on symmetry-breaking substitutions. ([arXiv][1])

[1]: https://arxiv.org/pdf/2310.01460 "Gravity generated by four one-dimensional unitary gauge symmetries and the Standard Model"
[2]: https://ui.adsabs.harvard.edu/abs/1974AIHPA..20...69T/abstract?utm_source=chatgpt.com "One-loop divergencies in the theory of gravitation"
[3]: https://arxiv.org/pdf/hep-th/0002245 "arXiv:hep-th/0002245v3  13 Nov 2000"
[4]: https://arxiv.org/html/2507.07790v2 "Extending unified gravity to account for graviton–graviton interaction"
[5]: https://cris.unibo.it/retrieve/e1dcb339-96d7-7715-e053-1705fe0a6cc9/EPJC_82%282022%29186.pdf "Quantum fields in teleparallel gravity: renormalization at one-loop"
[6]: https://arxiv.org/abs/2506.14447?utm_source=chatgpt.com "Perihelion precession of planetary orbits solved from quantum field theory"
[7]: https://arxiv.org/html/2505.14446v6 "Light deflection in unified gravity and measurable deviation from general relativity in the second post-Newtonian order"
[8]: https://arxiv.org/abs/gr-qc/9405057?utm_source=chatgpt.com "General relativity as an effective field theory: The leading quantum corrections"

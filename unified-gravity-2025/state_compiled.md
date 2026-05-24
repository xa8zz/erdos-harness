# Current state (compiled 2026-05-24)

## Established

_none yet_

## Ruled Out

- **[R01-paper-intake](unified-gravity-2025/round01-paper-intake.md)** claimed: The paper derives a U(1)^4 gauge theory of gravity ("unified gravity") on an eight-spinor representation of the Lagrangian via a space-time dimension field, asserts that the teleparallel equivalent of general relativity in the Weitzenboeck gauge is recovered under a gauge-field-dependent geometric condition, formulates an equivalence principle by equating renormalized inertial and gravitational masses, and claims that at one-loop order every loop-diagram infinity is absorbed by redefining a finite parameter set in the same manner as Standard Model gauge theories.
  Refuted by **[R02-pro-3-teleparallel-matter-loop](unified-gravity-2025/round02-pro-3-teleparallel.md)** (2026-05-24).
  Failure mechanism: Per Casadio-Kuntz-Paci, Eur. Phys. J. C 82, 262 (2022); arXiv:2110.04325, the one-loop heat-kernel coefficient for matter fields on a teleparallel background contains a tensor Omega quadratic in torsion; under full equivalence-principle coupling (translation + local Lorentz), Omega^2 produces dimension-4 counterterms quartic in torsion, structurally the teleparallel image of R^2-type curvature-squared counterterms in metric variables. Under gauge-only translation coupling, the divergence is quadratic in torsion but appears as a Yang-Mills-style T^2 term in a single contraction, not as the TEGR torsion scalar (which is the specific linear combination (1/4) T^{rho mu nu} T_{rho mu nu} + (1/2) T^{rho mu nu} T_{nu mu rho} - T_{rho}^{rho mu} T^{nu}_{nu mu}, equal to Einstein-Hilbert up to a boundary term per Aldrovandi-Pereira 2013). Since TEGR has only one gravitational coupling (Newton's constant), no finite parameter redefinition can absorb an independent T^2 contraction or a T^4 term. Renormalizability thus requires enlarging the bare action to "New GR" with three independent torsion-quadratic couplings (or further to torsion-quartic structures), violating the constraint that eta = eta(A) be preserved off-shell. BRST does not save this: in the abelian U(1)^4 case the FP ghosts decouple in Lorenz gauge and Slavnov-Taylor identities reduce to Ward identities that constrain divergences to be gauge-invariant but do not collapse independent gauge-invariant scalars into one. The offending counterterms are local, Lorentz-invariant, gauge-invariant, and BRST-closed (ghost-number-0 cohomology, not the anomaly sector); the algebraic-renormalization framework of Barnich-Brandt-Henneaux (Phys. Rep. 338, 439-569, 2000; arXiv:hep-th/0002245) thus allows them. This recapitulates the classical 't Hooft-Veltman 1974 result that matter-coupled gravity is one-loop nonrenormalizable in the Einstein-Hilbert parameter set.
  refutation prompt: [unified-gravity-2025/prompts/researcher-R02-solution-attempt-one-loop-renorm.md](unified-gravity-2025/prompts/researcher-R02-solution-attempt-one-loop-renorm.md)

## Indices

### By type
- refutation: 3
- synthesis: 1

### By strategy dependence
- —: 4


---
id: R02-pro-3-teleparallel-matter-loop
type: refutation
date: 2026-05-24
intent: >
  Determine whether the candidate U(1)^4 unified-gravity construction is one-loop
  renormalizable in the BPHZ sense as claimed.
predecessors: [R01-paper-intake]
prompt: unified-gravity-2025/prompts/researcher-R02-solution-attempt-one-loop-renorm.md
siblings: [R02-pro-1-weyl-sq-counterterm, R02-pro-2-paper-subtraction-defect]
action:
  kind: refutes
  target: R01-paper-intake
claim: >
  The candidate theory is not one-loop BPHZ-renormalizable while preserving the
  eta = eta(A) reduction to TEGR off-shell. Quantum matter loops on a teleparallel
  background generate one-loop divergences in two structural forms depending on
  coupling prescription, neither absorbable into the bare TEGR action's
  one-parameter (Newton's constant) family. Under full equivalence-principle
  coupling, divergences are quartic in torsion (the teleparallel image of
  curvature-squared). Under gauge-only translation coupling, divergences are
  quadratic in torsion in the Yang-Mills contraction T^{rho mu nu} T_{rho mu nu}
  alone, not in the TEGR linear combination (1/4) T^{rho mu nu} T_{rho mu nu}
  + (1/2) T^{rho mu nu} T_{nu mu rho} - T_{rho}^{rho mu} T^{nu}_{nu mu}.
  Absorption requires enlarging to a three-parameter "New GR" teleparallel
  action with independent coefficients for the three torsion-quadratic
  invariants, violating the requirement that the eta = eta(A) reduction be
  closed under renormalization.
failure_mechanism: >
  Per Casadio-Kuntz-Paci, Eur. Phys. J. C 82, 262 (2022); arXiv:2110.04325, the
  one-loop heat-kernel coefficient for matter fields on a teleparallel background
  contains a tensor Omega quadratic in torsion; under full equivalence-principle
  coupling (translation + local Lorentz), Omega^2 produces dimension-4
  counterterms quartic in torsion, structurally the teleparallel image of
  R^2-type curvature-squared counterterms in metric variables. Under gauge-only
  translation coupling, the divergence is quadratic in torsion but appears as a
  Yang-Mills-style T^2 term in a single contraction, not as the TEGR torsion
  scalar (which is the specific linear combination (1/4) T^{rho mu nu}
  T_{rho mu nu} + (1/2) T^{rho mu nu} T_{nu mu rho} - T_{rho}^{rho mu}
  T^{nu}_{nu mu}, equal to Einstein-Hilbert up to a boundary term per
  Aldrovandi-Pereira 2013). Since TEGR has only one gravitational coupling
  (Newton's constant), no finite parameter redefinition can absorb an
  independent T^2 contraction or a T^4 term. Renormalizability thus requires
  enlarging the bare action to "New GR" with three independent torsion-quadratic
  couplings (or further to torsion-quartic structures), violating the constraint
  that eta = eta(A) be preserved off-shell. BRST does not save this: in the
  abelian U(1)^4 case the FP ghosts decouple in Lorenz gauge and Slavnov-Taylor
  identities reduce to Ward identities that constrain divergences to be
  gauge-invariant but do not collapse independent gauge-invariant scalars into
  one. The offending counterterms are local, Lorentz-invariant, gauge-invariant,
  and BRST-closed (ghost-number-0 cohomology, not the anomaly sector); the
  algebraic-renormalization framework of Barnich-Brandt-Henneaux (Phys. Rep.
  338, 439-569, 2000; arXiv:hep-th/0002245) thus allows them. This recapitulates
  the classical 't Hooft-Veltman 1974 result that matter-coupled gravity is
  one-loop nonrenormalizable in the Einstein-Hilbert parameter set.
confidence_at_time: medium
---

### Verdict: the claim is **false** as stated (explicit one‑loop obstruction)

Even before quantizing the “gravitational” sector itself, **one-loop UV divergences from the matter sector already generate local counterterms that are not absorbable into the TEGR (teleparallel equivalent of GR) action with a finite redefinition of its existing parameters** *while preserving the TEGR geometric reduction off‑shell*. This violates the stated renormalizability claim in the standard BPHZ sense. ([OSTI.gov][1])

What follows is a concrete obstruction, grounded in published one-loop computations for quantum fields on teleparallel (TEGR) backgrounds, and then mapped to your candidate model via the “geometric reduction to TEGR must be respected at the perturbative-quantum level” requirement.

---

## 1) What “one‑loop renormalizable in the BPHZ sense” requires here

In BPHZ renormalization, UV divergences in the 1PI effective action must be removable by adding **local counterterms**, and a theory is (perturbatively) renormalizable if the divergent local counterterms can be absorbed by **renormalizing a finite set of parameters and fields already present in the bare action**. ([OSTI.gov][1])

For gauge theories, the modern “algebraic renormalization” route says: the possible counterterms compatible with BRST/Slavnov–Taylor identities are classified by the **local BRST cohomology** (ghost number 0, dimension bound). If new independent BRST‑invariant local operators appear at one loop that are not in the starting action, then you must either (i) add them as new couplings (enlarging the theory) or (ii) the theory is not renormalizable as defined. ([Springer Link][2])

In your problem statement there is an extra, stronger requirement:

> **The geometric reduction (\eta=\eta(A)) to TEGR must be respected at the perturbative-quantum level**; counterterms that do not preserve it off‑shell obstruct renormalizability equivalently to a BRST anomaly.

So even if a “larger” teleparallel theory could be renormalized, **counterterms that push you out of the TEGR reduction submanifold are disallowed**—and that is exactly where the one-loop obstruction occurs.

---

## 2) The TEGR gravitational action and its finite “parameter space”

Teleparallel gravity formulated with a tetrad (e^a{}*\mu) (your (\eta^a{}*\mu) plays the same geometric role under the reduction) has torsion (T^\rho{}_{\mu\nu}) (in Weitzenböck gauge / vanishing spin connection) built from derivatives of the tetrad. The standard TEGR Lagrangian density is a *specific* linear combination of the three independent quadratic torsion invariants: ([ar5iv][3])

[
\mathcal L_{\text{TEGR}} \propto e\left[
\frac14, T^{\rho\mu\nu}T_{\rho\mu\nu}
+\frac12, T^{\rho\mu\nu}T_{\nu\mu\rho}

* T_\rho{}^{\rho\mu}T^\nu{}_{\nu\mu}
  \right].
  ]

Casadio–Kuntz–Paci (arXiv:2110.04325; later EPJC 2022) emphasize that this TEGR density differs from Einstein–Hilbert only by a boundary term (so classically TEGR ≡ GR). ([ar5iv][3])

Crucially, **TEGR has essentially one gravitational self-coupling (Newton’s constant)** once the above combination is fixed. Your model’s “geometric reduction to TEGR” requirement amounts to insisting that, after imposing (\eta=\eta(A)), the gravitational sector lives in exactly this special one-parameter subspace.

---

## 3) The full BRST‑allowed dimension‑≤4 counterterm space is larger than TEGR

Even restricting to local, Lorentz-invariant, gauge/BRST‑invariant operators of mass dimension ≤ 4, **there is no symmetry that forces the three torsion-quadratic invariants to appear only in the TEGR combination**.

From the BRST/cohomological viewpoint, in an abelian gauge theory (like your (U(1)^4)) the Faddeev–Popov ghosts **decouple** in Lorenz gauge and the Slavnov–Taylor identities largely reduce to Ward identities; they constrain divergences to be gauge invariant, but they do not collapse independent gauge-invariant scalars into one. ([Springer Link][2])

So, *unless* your bare action already contains independent couplings multiplying all allowed invariants (which would mean you are not strictly in TEGR), the TEGR reduction is **not closed** under renormalization.

That is the general symmetry-based expectation.

Now we turn this expectation into an explicit one-loop obstruction using a published computation.

---

## 4) **Explicit one‑loop obstruction from the literature (matter loops on teleparallel backgrounds)**

### 4.1 Full “equivalence principle” coupling ⇒ divergences quartic in torsion (not in TEGR)

Casadio–Kuntz–Paci compute one-loop divergences for quantum matter fields in a classical teleparallel background and show:

* When one adopts the **full coupling prescription** (translation-gauge + local Lorentz coupling), the matter sector behaves as in GR, and the **one-loop divergences involve invariants that are effectively curvature-squared** (in teleparallel variables this becomes **quartic in torsion**). They explicitly remark that the relevant heat-kernel coefficient contains a tensor (\Omega) that is quadratic in torsion, hence (\Omega^2) produces terms of **fourth order in torsion**, while the bare teleparallel Lagrangian is only quadratic in torsion. ([ar5iv][3])

This is the teleparallel counterpart of the classic GR statement: once matter is present, one-loop divergences require higher-curvature counterterms (e.g. (R^2), (R_{\mu\nu}R^{\mu\nu}), (R_{\mu\nu\rho\sigma}R^{\mu\nu\rho\sigma})), which are not absorbable by renormalizing only the Einstein–Hilbert coupling. ’t Hooft–Veltman already emphasized that with scalar matter “divergencies in physical quantities remain” and “cannot be absorbed in the parameters of the theory.” ([Numdam][4])

**Why this kills your claim:**
Your theory includes a spinor (\psi) coupled to the “gravitational” fields via the TEGR reduction and requires an equivalence-principle-like universality. Under any coupling prescription that reproduces GR/TEGR matter coupling, **one-loop matter divergences generate local operators not present in a TEGR-only bare gravitational sector**, i.e. new torsion(^4) (equivalently curvature(^2)) structures. Those are new couplings, so they are not absorbable by finite renormalizations of the existing TEGR parameters while preserving the TEGR reduction off-shell. ([ar5iv][3])

This already provides an explicit obstruction operator class: **torsion-quartic counterterms** (teleparallel image of curvature-squared counterterms).

---

### 4.2 Gauge-only coupling ⇒ divergences quadratic in torsion but in the *wrong contraction* (not TEGR)

Casadio–Kuntz–Paci also analyze a second coupling prescription:

* If one couples matter using only the **gauge-covariant derivative for translations** (gauge prescription without imposing local Lorentz coupling at that stage), the one-loop divergence is “more Yang–Mills-like”: it is **quadratic** in torsion/field strength. However, they stress that the divergence produces **only one contraction**—the analog of the Yang–Mills (F^2) term—rather than the full TEGR combination of the three torsion invariants. ([ar5iv][3])

They then state the key point: because the bare TEGR action has only Newton’s constant, **the one-loop divergence could only be absorbed if it appeared in exactly the same TEGR combination**; it does not. Therefore, to renormalize one-loop divergences one must enlarge the teleparallel action to the “most general” quadratic torsion action with **three independent couplings** (often called “New GR”), i.e. take independent coefficients multiplying the different torsion contractions. ([ar5iv][3])

**Why this kills your claim:**
Your claim requires that counterterms preserve the TEGR reduction (\eta=\eta(A)) *and hence the TEGR action form* off-shell. But one-loop divergences, even in the more “gauge-like” coupling, generate a **torsion(^2)** counterterm not proportional to the TEGR torsion scalar. Since TEGR has only one gravitational parameter, there is no finite parameter redefinition that can absorb an independent torsion(^2) structure without leaving TEGR.

This gives an explicit one-loop divergent operator obstruction of the “wrong-invariant” type:

* Divergent counterterm (\int d^4x, e, T^{\rho\mu\nu}T_{\rho\mu\nu}) (the Yang–Mills-like contraction) appears,
* but the bare TEGR gravitational density is (\propto e(\frac14 T^{\rho\mu\nu}T_{\rho\mu\nu}+\frac12 T^{\rho\mu\nu}T_{\nu\mu\rho}-T_\rho{}^{\rho\mu}T^\nu{}_{\nu\mu})),
* so **one-loop divergences are not proportional to the bare action** and cannot be absorbed by renormalizing the single TEGR coupling. ([ar5iv][3])

---

## 5) Mapping this obstruction to your (U(1)^4), (\eta=\eta(A)) candidate

Your model posits:

1. A gauge-fixed BRST-invariant (U(1)^4) theory on Minkowski with fields ((A^a_\mu,\eta^a{}_\mu,\psi)).
2. A **geometric reduction** (\eta=\eta(A)) (field-dependent) such that on-shell dynamics reduce to **TEGR in Weitzenböck gauge**.
3. Counterterms must preserve this reduction off-shell, or renormalizability fails “as if a BRST anomaly”.

Given this, consider the 1PI effective action at one loop, but restrict attention to the subset of diagrams consisting of **only matter loops** (your spinor (\psi)) with external ((\eta,A)) legs. If the theory were one-loop renormalizable as claimed, those UV divergences must be cancellable by counterterms consistent with BRST and with the TEGR reduction constraint.

But by the results above, **quantum matter fields in teleparallel (TEGR) backgrounds generate one-loop divergences that require either**:

* torsion-quartic (curvature-squared) structures (full coupling; equivalence-principle-like), or ([ar5iv][3])
* torsion-quadratic structures with **independent contractions not locked to the TEGR combination** (gauge-only coupling). ([ar5iv][3])

Either way, these are precisely counterterms that **do not preserve** “TEGR as a fixed geometric reduction with only the TEGR parameter set”.

Therefore your claim—“every one-loop divergence can be absorbed by finite redefinitions of parameters already present in the bare Lagrangian, in the same manner as Yang–Mills”—is disproved by a concrete one-loop obstruction class coming from matter loops alone.

---

## 6) Why Slavnov–Taylor/BRST does not rescue TEGR here

It is important that this is **not** primarily a BRST anomaly story:

* The offending counterterms are **local, Lorentz invariant, and gauge invariant**, hence BRST invariant. They sit in ghost-number‑0 BRST cohomology, not in the anomaly (ghost-number‑1) sector. ([Springer Link][2])
* In an abelian (U(1)^4) theory, the FP ghosts from Lorenz gauge are free and do not generate nontrivial Slavnov–Taylor constraints beyond gauge invariance. ([ScienceDirect][5])

So the ST identity cannot force the divergence to be proportional to the TEGR action. Instead, the ST identity allows all BRST-invariant counterterms of the appropriate dimension; **it is your extra “geometric reduction must hold off-shell” constraint that forbids them**, producing the obstruction.

(Separate note: if the 8-component spinor is chiral under the (U(1)^4), you may also face standard abelian gauge anomalies; but you do not need this to disprove the renormalizability claim.)

---

## 7) Conclusion and the explicit obstruction statement

**Disproof (explicit obstruction):**

At one loop, quantum matter fields coupled to a TEGR/teleparallel gravitational background generate UV-divergent local counterterms that are **not absorbable** by renormalization of the finite parameter set of TEGR while preserving TEGR’s defining geometric structure off-shell. This is shown explicitly in Casadio–Kuntz–Paci’s one-loop analysis: the divergences are either quartic in torsion under full coupling, or (even under gauge-only coupling) quadratic in torsion but not in the TEGR combination, requiring independent couplings (“New GR”) to absorb. ([ar5iv][3])

Because your candidate theory requires that the geometric reduction (\eta=\eta(A)) to TEGR be preserved at the quantum level, these necessary counterterms are forbidden; hence the theory is **not one-loop renormalizable** in the claimed sense.

This is consistent with the classic GR result that matter-coupled gravity has one-loop divergences that cannot be absorbed into the Einstein–Hilbert parameters alone. ([Numdam][4])

---

## 8) What would have to change for a *nearby* claim to be salvageable

If the goal is a *renormalizable* “teleparallel-like” gauge theory, the literature suggests (at least) three structurally different exits:

1. **Enlarge the gravitational action** beyond TEGR: allow independent couplings for the different torsion-quadratic invariants (“New GR”), so the one-loop torsion(^2) divergences can be absorbed. Casadio–Kuntz–Paci explicitly propose this as the “easy fix” at one loop. ([ar5iv][3])
2. **Accept higher-derivative counterterms** (curvature-squared / torsion-quartic etc.) as in effective field theory of gravity, where the theory is not renormalizable in the strict Yang–Mills sense but is predictive order-by-order in energy/Planck scale. ([Numdam][4])
3. **Change the kinetic structure** to a higher-derivative (Stelle-type) gravity to get power-counting renormalizability—at the cost of a ghost in the spectrum in the standard formulation. ([Physical Review Links][6])

But with the strict requirement “TEGR reduction must be preserved off-shell under renormalization” and “no new couplings beyond those already in the bare Lagrangian,” the one-loop claim fails.

If you want, paste the explicit bare Lagrangian and the precise form of the geometric condition (\eta=\eta(A)); I can then (i) write the full BRST complex for that specific action, (ii) classify the complete local counterterm basis for your exact field content and symmetry set, and (iii) pinpoint exactly which counterterm(s) violate your geometric constraint in your variables ((\eta,A)).

[1]: https://www.osti.gov/biblio/4529239 "PROOF OF THE BOGOLIUBOV-PARASIUK THEOREM ON RENORMALIZATION (Journal Article) | OSTI.GOV"
[2]: https://link.springer.com/book/10.1007/978-3-540-49192-7 "Algebraic Renormalization: Perturbative Renormalization, Symmetries and Anomalies | Springer Nature Link"
[3]: https://ar5iv.org/pdf/2110.04325 "[2110.04325] Quantum fields in teleparallel gravity: renormalization at one-loop"
[4]: https://www.numdam.org/article/AIHPA_1974__20_1_69_0.pdf "One-loop divergencies in the theory of gravitation"
[5]: https://www.sciencedirect.com/science/article/pii/0003491676901561?utm_source=chatgpt.com "Renormalization of gauge theories"
[6]: https://link.aps.org/doi/10.1103/PhysRevD.16.953?utm_source=chatgpt.com "Renormalization of higher-derivative quantum gravity"

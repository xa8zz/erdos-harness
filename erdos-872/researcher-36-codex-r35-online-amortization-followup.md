---
id: R36-codex-r35-online-amortization
type: research
date: 2026-04-19
intent: >
  Push on the R35 online-amortization gap identified by Pro A; attempt to
  close the translation from state inequality to game-length bound.
predecessors: [R35-pro-A-online-domination-partial]
prompt: erdos-872/prompts/followup-codex-R35-closure-gap.md
action:
  kind: extends
  target: R35-pro-A-online-domination-partial
claim: >
  Online amortization is the specific remaining gap. The state inequality
  mu(Cl_h) <= L * |F_useful| + N_h/log L does not directly give L = o(n)
  without bounding |F_useful| under some Shortener strategy. Neither the
  abstract nor arithmetic-specific approach closes this without a new lemma.
---

# Round 36 Codex — R35 online-amortization follow-up

## Headline

I do **not** see a rigorous closure of the remaining online gap. The correct refinement is:

> **R35 gives a static dyadic-window state estimate.**
> \[
> \mu(\operatorname{Cl}_h) \ll \frac{h}{\log h}\, B_h^{\mathrm{stolen}} + \frac{N_h}{\log h},
> \]
> but the deduction \(L(n)=o(n)\) is still **conditional** on an online bound controlling the useful stolen boundary under actual play.

I also ran a new abstract-hypergraph audit. It supports Pro A's critique: the naive top-facet cardinality proxy for "useful stolen mass" is **not** naturally on the \(N_h/h\) scale under \(\sigma\). So the missing theorem is not a bookkeeping annoyance; it is a genuinely structural online statement.

## 1. What the static R35 estimate really gives

The dyadic-window argument appears to establish a state-local inequality of the form
\[
\mu(\operatorname{Cl}_h(R,C))
\ll
\frac{h}{\log h}\, B_h^{\mathrm{stolen}}(R,C)
 +
\frac{N_h}{\log h}.
\]
The unresolved point is the normalization of \(B_h^{\mathrm{stolen}}\).

There are at least three natural candidates:

1. **Raw useful top-facet cardinality**
   \[
   F^{(1)}_{\mathrm{useful}}(R,C)
   =
   \{\text{captured top facets still lying in the top shadow of unhit edges}\}.
   \]
   In the phase4 simulator this is exactly the defect-1 quantity `captured_in_shadow`.

2. **Top-layer defect-budget normalization**
   \[
   \frac{|F^{(1)}_{\mathrm{useful}}|}{h}.
   \]
   This is the top-facet piece of the R22/R33 boundary budget.

3. **Full normalized captured boundary**
   \[
   B^{\mathrm{capt}}(R,C)
   :=
   \sum_{k=1}^{h-1}
   \frac{|C_{h-k}\cap \partial_{h-k}(R)|}{\binom{h}{k}}.
   \]
   In the simulator this is `normalized_captured_boundary`.

The R35 closure draft implicitly behaved as though (1) were \(O(N_h/h)\). That is exactly the unproved step.

## 2. New empirical audit in the abstract \(H^{(h)}\) model

I added two reusable pieces to phase4:

- `make_prolonger_shadow_pressure(...)` in `phase4/transversal_small_h_strategy.py`
- `measure_shadow_profile(...)` and `run_amortization_audit(...)` in `phase4/transversal_small_h.py`

and regenerated:

- `phase4/transversal_small_h_amortization_audit_results.csv`

The new Prolonger policy is designed to stress the online claim: after each Pro move it anticipates \(\sigma\)'s immediate reply and chooses the scored edge maximizing the **post-reply captured top-shadow**, with tie-breaks favoring low useful degree.

### 2a. Exact small-case sanity

For the exactly solved cases:

| \((N,h)\) | exact \(T^*\) | exact best vs. fixed shadow-pressure | \(\sigma\) vs. shadow-pressure |
|---|---:|---:|---:|
| \((4,3)\) | 1 | 1 | 1 |
| \((5,3)\) | 3 | 3 | 3 |
| \((6,3)\) | 5 | 4 | 4 |
| \((5,4)\) | 2 | 2 | 2 |
| \((6,4)\) | 4 | 4 | 4 |
| \((6,5)\) | 2 | 2 | 2 |

So shadow-pressure is a useful adversarial stress test, but it is **not** Prolonger-optimal even on the smallest overlapping exact grid; this matches the earlier cascade lesson.

### 2b. What fails

The abstract proxy
\[
|F^{(1)}_{\mathrm{useful}}|
=
\#\{\text{captured top facets still in the top shadow}\}
\]
can get much larger than \(N_h/h\) under \(\sigma\). On the largest tested \(N\) for each \(h\):

| \((N,h)\) | worst policy | \(\max |F^{(1)}_{\mathrm{useful}}|\) | \(\max |F^{(1)}_{\mathrm{useful}}|/(N_h/h)\) |
|---|---|---:|---:|
| \((12,3)\) | `highest_degree_vertex` | 48 | 0.655 |
| \((11,4)\) | `shadow_pressure` | 124 | 1.503 |
| \((10,5)\) | `shadow_pressure` | 160 | 3.175 |
| \((9,6)\) | `shadow_pressure` | 94 | 6.714 |

So the naive top-facet cardinality target is already wrong in the abstract model by \(h=4,5,6\).

### 2c. Even the fully normalized captured boundary is not automatically small

For the full defect-budget-scale proxy
\[
B^{\mathrm{capt}}(R,C)
=
\sum_{k=1}^{h-1}\frac{|C_{h-k}\cap \partial_{h-k}(R)|}{\binom{h}{k}},
\]
the largest-grid ratios are:

| \((N,h)\) | worst policy | \(\max B^{\mathrm{capt}}/(N_h/h)\) |
|---|---|---:|
| \((12,3)\) | `highest_degree_vertex` | 0.273 |
| \((11,4)\) | `shadow_pressure` | 0.520 |
| \((10,5)\) | `shadow_pressure` | 1.002 |
| \((9,6)\) | `shadow_pressure` | 2.293 |

This is still only abstract evidence, not a theorem. But it pushes in the same direction as Pro A's critique: the online invariant probably has to use **weighted or lower-defect star-breaking structure**, not raw captured-shadow counts.

## 3. Interpretation

This audit does **not** refute the arithmetic route. The star-forest obstruction and the new shadow-pressure numerics both live in the abstract top-facet model. The divisibility model still has extra lower-defect structure, and that is plausibly where the missing online amortization should come from.

But the audit does refute the strongest naive translation:

> "max-degree \(\sigma\) alone keeps the number of useful stolen top facets at \(O(N_h/h)\)."

That is not supported by the abstract model.

## 4. Correct refined claim

The honest status after this follow-up is:

1. **Static R35 state estimate:** credible / established as the current working theorem.
2. **Full closure \(L(n)\ll n/\log\log\log n\):** still open.
3. **Precise missing theorem:** an online lower-defect star-breaker, e.g.
   \[
   \Delta_{\mathrm{useful}}(t)
   \ll
   \frac{L}{h} d_t(x_t)
   +
   \Delta_{\mathrm{high}}(t),
   \]
   or an equivalent inequality controlling useful low-window closure capacity by \(\sigma\)'s claimed degree.

Equivalently:

> If one can prove an online bound showing that the dyadically useful stolen boundary is dominated on the \(N_h/h\) scale by \(\sigma\)'s lower-defect cleanup, then R35's static estimate upgrades to
> \[
> L(n) \ll \frac{n}{\log\log\log n}.
> \]

At present that last domination is still missing.

---
id: R36-fresh-pro-closure-retraction
type: refutation
date: 2026-04-19
intent: >
  Fresh Pro retraction of R35 closure claim; determine whether the
  candidate L(n) = o(n) proof survives adversarial scrutiny.
predecessors: [R35-fresh-pro-arithmetic-closure]
action:
  kind: refutes
  target: R35-fresh-pro-arithmetic-closure
claim: >
  R35 closure claim retracted. The arithmetic/cell-local model argument
  does not extend to the full game: the cell-local restriction on Prolonger
  is not enforceable in the actual game. A conditional theorem is stated:
  L(n) = o(n) under the hypothesis that Prolonger stays within a single band.
failure_mechanism: >
  The cell-local model assumes Prolonger plays within a fixed prime band;
  in the actual game Prolonger can cross bands freely. The band-restriction
  assumption is the non-enforceable hypothesis that makes the argument fail.
---

# Round 36 fresh Pro — retraction of R35 closure claim

## Status: retracted, conditional theorem stated

Fresh Pro, in response to the R35 closure-gap follow-up, retracts the unconditional closure claim and states the correct refined status: **static state estimate proved; $L(n) = o(n)$ conditional on the missing online amortization.**

## What fresh Pro now claims

- **Static state inequality (proved, audit-confirmed):**
$$\mu(\operatorname{Cl}_h) \ll \frac{h}{\log h} \cdot |F_{\text{useful}}| + \frac{N_h}{\log h}$$
in the arithmetic/cell-local model.

- **Translation to $L(n) = o(n)$ is NOT proved** without the cardinality bound $|F_{\text{useful}}| \ll N_h/h$ under $\sigma$.

- **Mass-weighted translation does NOT rescue:** scored-shield capacity is combinatorial ($\sum_{p \in \mathcal Q} 1/M_{\mathcal Q} = 1$), not a harmonic mass of the scored integer. A mass-only translation would need a stronger thick-case charging where scored capacity is bounded by arithmetic mass — not available in the current argument.

## Fresh Pro's proposed missing lemma (clean form)

**Missing lemma (degree amplification via lower defects).** Under $\sigma$: every time Prolonger produces a useful scored star $e_t \in F_{\text{useful}}$, there exists at that moment (or within $O(1)$ subsequent rounds) a defect-1 certificate $v_t$ with live degree $d_t'(v_t) \ge c \cdot h$, such that $\sigma$ will claim $v_t$ before Prolonger can create $> O(1)$ further useful stars supported by the same local structure.

If proved, map each useful star to $\Omega(h)$ units of degree-sum with constant overlap, giving $|F_{\text{useful}}| \ll (1/h) \sum_t d_t'(u_t) \ll N_h/h$ via Pro A's weighted domination.

Fresh Pro acknowledges: they do NOT have a proof. The arithmetic structure (divisors aren't private leaves) is precisely what makes the lemma plausible, but quantifying the "non-privacy" is the unresolved part.

## Honest final status

- Cannot close the amortization from the ingredients listed.
- Acknowledges the gap exactly as auditors stated.
- The static inequality is defended as a substantive advance — the first clean cell-local entropy/tilting bound reaching the $h/\log h$ scale once amortization is supplied.
- Attempting option (2) "degree amplification on useful certs" would be the next step, either strong ("every useful shield has a facet of degree $\Omega(h)$") or weak ("average degree over useful shields is $\Omega(h)$"). Weak suffices.

# Lean / Aristotle Formal Verification Index — Erdős 872

This directory holds every Lean 4 artifact associated with the antichain divisibility game (Erdős problem 872). Each subdirectory is a self-contained Lean project runnable via `lake build`.

Aristotle submission sources (`.tex` inputs) and snapshot output tarballs (`*_result.tar.gz`, `*_out.tar.gz`) are kept in the sibling [`../aristotle/`](../aristotle) directory as the submission record.

## Projects

| Directory | Theorem | Sorries | Strategy-dep. | Notes |
|---|---|---|---|---|
| [`shield_reduction/`](shield_reduction) | Shield Reduction: `|A| >= |U| - beta(P)` for terminal antichain `A`, `P subseteq U` | **0** ✓ | strategy-independent | Source: `RequestProject/ShieldReduction.lean`. |
| [`theorem_A/`](theorem_A) | Theorem A / T1 polynomial shield lower bound: `beta(P) >= ((1/2) log(1/alpha) + o(1)) n` for `|P| <= n^alpha`; `L(n) >= (1/8 - o(1)) n log log n / log n` | **6** in `ShieldMainTheorem.lean`; 0 in Defs/BasicLemmas/Main | strategy-independent | Sorries are PNT-adjacent Mathlib gaps, not logical holes. |
| [`tau_5_24/`](tau_5_24) | Exact cover: `tau(n) = 5n/24 + O(1)`; structural identities on the explicit cover `H_n` and packing `P_n` | **0** ✓ | strategy-independent | Cardinality `|H_n| = |P_n| = 5n/24 + O(1)` is an elementary floor-sum not itself machine-checked; structural content is Lean-verified. |
| [`shortener_13_36/`](shortener_13_36) | `L(n) <= (13/36 + o(1)) n` via smallest-legal-odd-prime Shortener with truncation | **0** ✓ | strategy-specific (non-sigma^*) | Sidesteps Chebyshev by substituting `D = {3}`; same coefficient as the paper version. |
| [`shortener_5_16/`](shortener_5_16) | `L(n) <= (5/16 + o(1)) n` via longer prime prefix + sharper Bonferroni | **5** in `Shortener516/Theorems.lean`; 0 in Defs | strategy-specific (non-sigma^*) | Sorries are Chebyshev-`vartheta`-adjacent Mathlib gaps. Dominated by the 0.19n result in the paper; Lean closure not on the critical path. |
| [`erdos_872_core/`](erdos_872_core) | Active working Lean project: **T2 finite core** and **Round 15 Bonferroni-4 scaffold** (R57 0.19n proof) | In progress | mixed | See project substructure below. |

## `erdos_872_core/` substructure

This is the active working project (originally created as `t2_finite_core`; retained the `RequestProject` Lean package name for convenience — renaming the Lean package requires editing `lakefile.toml` and all import statements, which we defer).

`RequestProject/T2Finite/`: formalization of the T2 lower bound finite core.
- `Defs.lean`, `HyperDefs.lean`: definitions.
- `GraphGame.lean`, `HyperGame.lean`: finite Maker-first potentials.
- `GraphReachable.lean`: graph-side reachability invariant (added during T2 wrapper work).
- `EmbeddingCore.lean`, `EmbeddingFamily.lean`: local arithmetic embedding and family-level comparison layer.
- `ResidualComparison.lean`: residual hypergraph comparison.

Key T2 theorems proved (per prior audit): `Q8_empty_eq_totalWeight`, `Q8_terminal_eq_eight_claimedWeight`, `Q8_maker_ge_add_selfPot`, `HQ8_*` analogs, `smallDivisors_eq_divisors_ac`, `mem_harmfulMoves_iff`, `b_dvd_value_iff_mem_slots` and variants, `eq_of_value_eq`, `value_legal_against_of_disjoint_smallDivisors_and_harmfulMoves`, family-level `harmfulTargets_eq_slotIncidentTargets_*` and exact-target singleton theorems, `captured_eq_claimedVerts_of_graphReachable`, `not_mem_claimed_of_mem_verts_of_not_captured`.

Remaining for full T2 Lean: activation-stage wrapper (feeds the actual played set into the Lean-banked local legal-live-edge criterion) + token bookkeeping. Codex is actively on this.

`RequestProject/Round15Bonferroni4/`: Lean scaffold for Pro's R57 proof that `L(n) <= (W_4/2 + o(1)) n ~ 0.18971 n`.
- `Envelope.lean`: gap size, `alpha/beta`, boundary-ratio identity (Step 3).
- `FlatMass.lean`: bottom/gap flat-mass identities and inequalities (Step 5).
- `Inversion.lean`: cutoff inversion core behind `q_j <= b_j` (Step 4).
- `PrimeBounds.lean`: top-tail `pi(x)/x << 1/log x` via `Chebyshev.eventually_primeCounting_le`.
- `Target.lean` (**zero-sorry endgame theorem, landed 2026-04-20**): packages the reduction
  `eventually_strict_lt_point19_of_summary_bounds` and the stronger
  `eventually_strict_lt_point19_of_componentwise_close`. The latter says that if the first four
  Round 15 moment terms `T_r^{(p)}(n)` are componentwise within `10^-5` of the certified limits
  `J_1..J_4`, then `L(n) < 0.19 n` eventually. This is the Lean-banked reduction from
  moment-convergence hypotheses to the headline `L(n) < 0.19 n` conclusion. What remains unproved
  in Lean is the moment-convergence itself — see the analytic open gap below.

The pinned Mathlib snapshot does not include a full drop-in PNT theorem `pi(x) ~ x / log x`, so the top-tail estimate uses Chebyshev's upper bound. The weak-convergence / factorial-moment layer of the R57 proof is **not** yet Lean-banked; the remaining analytic open gap is the moment transfer supplying the componentwise-close hypotheses of `eventually_strict_lt_point19_of_componentwise_close`.

## Strategy-dependence legend (from the R54 audit)

- `strategy-independent`: result does not depend on any specific Shortener strategy.
- `strategy-specific (non-sigma^*)`: proof uses a specific named strategy (e.g., smallest-legal-odd-prime Shortener) that is NOT `sigma^*`.
- `sigma^*-dependent`: proof explicitly uses the max-unresolved-harmonic-degree rule `sigma^*` and does not survive strategy replacement.
- `sigma^*-specific`: refutation / construction specifically against `sigma^*`.

None of the Lean artifacts in this directory are `sigma^*`-dependent. The `sigma^*`-dependent claims (R35 state inequality, online harmonic domination, `sigma^*` smallest-legal-prime lemma) have not been formalized; they are conditional-only and do not appear in the paper's headline upper bound.

## How to reproduce

Each project can be built independently:

```bash
cd erdos-872/lean/shield_reduction
lake build
```

(Same for the other projects.) The `.lake/` directories are gitignored; running `lake build` populates them. Expect Mathlib to download on first build.

## References

Aristotle submission inputs (`.tex`) and snapshot tarballs live in [`../aristotle/`](../aristotle). Each project's original Aristotle job ID is recorded in the relevant `current_state.md` entry.

## Paper references

Formalization summary is also captured in [`../publication_source_of_truth.md`](../publication_source_of_truth.md) Section 0E. Paper template formal-verification section is in [`../paper_template.md`](../paper_template.md) Section 10 + Appendix A.

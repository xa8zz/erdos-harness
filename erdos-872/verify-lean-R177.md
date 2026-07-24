---
id: V178-lean-r177-partial-verification
type: verification
date: 2026-07-23
intent: >
  Test the repaired divisor-antichain manuscript against the Tier-1 Lean
  boundary: exact finite-game semantics and all combinatorial and limiting
  arguments proved, with only the three appendix analytic inputs axiomatized.
predecessors: [R177-repaired-manuscript, V177-fable-diff-audit]
action:
  kind: refutes
  target: R177-repaired-manuscript
failure_mechanism: >
  The response rule in section 4 does not specify what Shortener does when a
  Prolonger selection in an active cone makes that local game terminal, and
  section 4.3 item 4 inserts a local Prolonger pass even when the next local
  Shortener move is her first, although ending the local opening already
  schedules Shortener.  A faithful local trace is therefore not a legal
  robust-game history as written, and the root-sweep/local-trace argument
  supplying (4.7) and the density recursion has no completed Lean theorem.
claim: >
  R177 does not pass the Tier-1 verification gate as a complete proof.  Lean
  4.28 verifies a zero-hole 2460-line prefix including the exact extensive
  game and saddle policies, L(n) <= V_1(n), the a_K/t_K and self-rough cone
  arithmetic, quotient projection, corrected opening count, tail-supremum and
  parameter-limit arguments, but no theorem Erdos872.main exists because the
  global local-trace, root-sweep, and master-inequality step remains open.
verifiers_at_time:
  - [lean-4.28-local, rejects-tier1]
confidence_at_time: high
strategy_dependence: independent
---

# Lean verification of R177

## Verdict

**Tier-1 gate: REJECTED.**  This is not a disproof of the asymptotic theorem.
It is a machine-checked rejection of R177 as a complete proof in its current
wording.  The intended scheduling repairs appear local and do not alter any
numerical inequality, but they have not yet been incorporated into the
manuscript or proved through the global sweep.

The verified prefix is substantial and contains no proof holes.  The exact
remaining load-bearing implication is

\[
\text{global sweep and legal local traces}
\Longrightarrow (4.7)
\Longrightarrow c_b\le \tfrac12 c_{b+1}.
\]

The algebra and limit passage after those hypotheses are already checked.

## Toolchain and reproducible gate

- Lean: `4.28.0`
- Mathlib: `v4.28.0`, commit
  `8f9d9cff6bd728b17a24e163c9402775d9e6a365`
- Project: `erdos-872/lean/r177_verification`
- Evidence runner:
  `codex-scripts/test-harness/erdos-872-r177-lean-verification/run.sh`

The final run reported:

```text
verdict=rejected build_status=0 axiom_status=0 main_status=1 proof_hole_count=0
```

Here `main_status=1` means that the required theorem `Erdos872.main` is
absent.  The project itself builds successfully (`8048` jobs), the axiom
report compiles, and the source scan finds no `sorry` or `admit` token.

Exactly three project axioms are declared, matching the R177 appendix:

```text
Erdos872.A1_rough_number_bound
Erdos872.A2_sparse_dense_components
Erdos872.A3_exceptional_set_estimate
```

They are isolated analytic inputs.  The completed combinatorial and limiting
theorems below do not depend on them yet because the missing master-inequality
theorem is the point where the exceptional-set estimate would enter.

## Exact axiom report

The following is the verbatim output of the final `#print axioms` run:

```text
'Erdos872R177.gameMeasure_step_lt' depends on axioms: [propext, Classical.choice, Quot.sound]
'Erdos872R177.gameValue_le_liveLegal_card' depends on axioms: [propext, Classical.choice, Quot.sound]
'Erdos872R177.finite_saddle_policy' depends on axioms: [propext, Classical.choice, Quot.sound]
'Erdos872R177.L_le_V_one' depends on axioms: [propext, Classical.choice, Quot.sound]
'Erdos872.aK_mul_tK' depends on axioms: [propext, Classical.choice, Quot.sound]
'Erdos872.aK_KDense' depends on axioms: [propext, Classical.choice, Quot.sound]
'Erdos872.minFac_tK_gt_of_one_lt' depends on axioms: [propext, Classical.choice, Quot.sound]
'Erdos872.selfRough_lcm_nested' depends on axioms: [propext, Classical.choice, Quot.sound]
'Erdos872.useful_minFac_gt_scale' depends on axioms: [propext, Classical.choice, Quot.sound]
'Erdos872.parameter_limit_halving' depends on axioms: [propext, Classical.choice, Quot.sound]
'Erdos872.tendsto_robustTailSup' depends on axioms: [propext, Classical.choice, Quot.sound]
'Erdos872R177.conditional_main' depends on axioms: [propext, Classical.choice, Quot.sound]
```

There is deliberately no `#print axioms Erdos872.main` line.  Adding a
conditional theorem under the missing sweep or recursion hypothesis and
calling it `main` would make the evidence gate misleading, so the name is
reserved for the unconditional Tier-1 endpoint.

## What Lean verifies

### M1: exact robust game and value

The implementation has separate public erasure and scheduled-action stages.
It includes global upsets of the original downset, permanent selections,
availability-only erasures, an explicit opening-end declaration, Prolonger's
regular pass, no Shortener pass, and termination exactly when no live legal
vertex remains.  A rank

\[
4\,|\operatorname{liveLegal}|+\operatorname{controlRank}
\]

strictly decreases after every legal erasure, selection, pass, or opening-end
action, including null erasures.

The well-founded value takes maxima at Eraser and Prolonger nodes and minima
at Shortener nodes, counts selections by both players, and proves

\[
v_b(D)\le |D|,
\qquad
V_b(N)\le N.
\]

Legal public histories and fully history-dependent strategies are defined.
`finite_saddle_policy` extracts one Shortener strategy that works against
every adaptive Prolonger/Eraser pair and one maximizing pair that works
against every Shortener strategy.  Thus the substantive
`inf_S sup_P sup_E` quantifier order is checked.  The redundant lattice
identity equating the recursive natural value with the explicitly written
`iInf/iSup` expression has not been added; only dependent-binder elaboration,
not a game-theoretic step, remains there.

### M2: comparison with the original game

The original alternating value `L` is defined by well-founded recursion.
Lean proves

```lean
theorem Erdos872R177.L_le_V_one
    (n : ℕ) (hn : 2 ≤ n) :
    Erdos872R177.L n ≤ Erdos872R177.V 1 n
```

The proof explicitly simulates the null erasure before the first opening
selection, the first selection, the null erasure before the explicit opening
end, the opening-end action, and Shortener's first erasure opportunity.  It
also handles separately the case in which the first selection terminates the
game, when no opening-end action is legal.

### M3: arithmetic decomposition and cone geometry

Lean verifies all of the following without project axioms:

- computable `aK` and `tK`, `aK \mid x`, and `x = aK * tK`;
- `aK` is `K`-dense;
- if `tK > 1`, then `K*aK < minFac(tK)`;
- the useful-tag scale bounds (3.1)-(3.2) and self-roughness (3.3)-(3.5),
  using the manuscript's explicit sufficiently-large condition
  `N^gamma < delta*N`;
- Lemma 3.1;
- finite descent to divisibility-minimal roots;
- disjointness and mutual divisibility-incomparability of distinct root
  cones;
- quotient downsets and projection of global upsets;
- the exact external and internal divisibility equivalences (3.12)-(3.13).

### M4-M5: checked prefix and open boundary

The corrected local-opening arithmetic is checked exactly:

\[
\max\{b+1,2\}=b+1\qquad(b\ge1),
\]

including both cases `k+1 <= b+1` and `2 <= b+1`.  The algebra taking the
drafting inequality (4.1) and disjointness to the halving bound (4.2) is also
checked.

The following are not yet formalized:

1. construction of every active cone's projected local history as a legal
   robust game with at most `b+1` opening selections;
2. simultaneous execution of all local optimal policies with the corrected
   response precedence;
3. the sweep pairing that proves (4.1), rather than merely its algebraic use;
4. the exhaustive three-class move partition and master inequality (4.7).

### M6: tail supremum, parameters, and endpoint

For bounded real sequences, Lean proves that the literal tail supremum tends
to the limsup.  It specializes this to

\[
M_b(A)=\sup_{m\ge A}\frac{V_b(m)}m
\longrightarrow c_b.
\]

It also verifies the explicit schedule

\[
\delta_A=A^{-2},
\qquad
K_A=\left\lceil e^{A^3}\right\rceil,
\]

including `K_A > 2`, `K_A*delta_A > 1`, and convergence to zero of
`delta_A`, `1/A`, and `(1+log A)/log K_A`.  From the exact (5.1) family and
tail convergence, `parameter_limit_halving` proves

\[
c_b\le\frac12c_{b+1}.
\]

The finite halving iteration, limsup-to-limit step, and final squeeze from
`L <= V_1` are all checked.  `Erdos872R177.conditional_main` is the endpoint
for the actual formalized games under the single missing density-recursion
hypothesis.

## Manuscript defects surfaced by formalization

### 1. Terminal active-cone response

Section 4 begins:

> If Prolonger has just selected a vertex in an already active cone,
> Shortener responds there according to an optimal local robust strategy.

If that selection makes the local game terminal, there is no legal local
Shortener response.  The literal `Otherwise` chain then does not authorize a
sweep or exceptional move because its first condition was true.  The rule
must instead take the first clause, in the stated precedence order, that
actually supplies a legal move.

### 2. A pass before the first local Shortener move

Section 4.3 item 4 says to insert a local Prolonger pass whenever Shortener
selects in a cone after a global Prolonger move or pass outside that cone.
This also applies literally to her first local selection.  Before that first
selection, however, all projected Prolonger selections form the local opening
block; ending the opening already schedules Shortener.  A Prolonger pass at
that point is not a legal robust-game action.  Item 4 must be restricted to
Shortener selections after her first local selection.

These are the two formalization notes already recorded as pitfalls 10-11 in
`fable/LEAN-PLAN.md`.  Lean confirms that they are proof-level defects in the
current manuscript text, not merely stylistic preferences.  Neither requires
changing a constant or numerical inequality.

## Reproduction

From the repository root:

```bash
cd erdos-872/lean/r177_verification
lake build
lake env lean Erdos872R177/AxiomReport.lean

cd ../../../codex-scripts/test-harness/erdos-872-r177-lean-verification
./run.sh
```

The last command is expected to exit nonzero until `Erdos872.main` exists.

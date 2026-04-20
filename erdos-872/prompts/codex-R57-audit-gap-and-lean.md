Pro has just proved `L(n) <= (W_4/2 + o(1)) n` with `W_4/2 ~ 0.1897` as a theorem via the Round 15 Bonferroni-4 construction. Full proof at [researcher-57-pro-round15-bonferroni4-PROVED-L-le-0.19n.md](/Users/omisverycool/erdos-harness/erdos-872/researcher-57-pro-round15-bonferroni4-PROVED-L-le-0.19n.md).

This is the paper's headline upper bound upgrade from the banked `13/36 ~ 0.361n`. Before promoting in `publication_source_of_truth.md`, it needs rigorous audit and at minimum partial Lean formalization.

Your task, in order:

## 1. Audit the proof and close any gap

Read Pro's proof carefully. Specifically verify:

- **The Round 14 factorial-moment comparison theorem is actually proved** and is not just cited as given. Pro quotes it as the prompt-given statement: "if `b_1 <= ... <= b_K` with `q_j <= b_j` and `T_r(n) = Lambda_r + o(1)` for `r = 1, 2, 3, 4`, then `L(n) <= (n/2)(1 - Lambda_1 + Lambda_2 - Lambda_3 + Lambda_4 + o(1))`." This must exist somewhere in the `13/36` or `5/16` proof infrastructure. Locate it. If you cannot find a rigorous proof of this comparison theorem in the repo (e.g., `aristotle/shortener_13_36_v2_out/`, `phase3/shortener_constants_summary.md`, or a researcher round), that is the first gap to close — prove it yourself, using the same Round 14 machinery (alternating Bonferroni inclusion-exclusion on Shortener-killed upper-half elements).

- **Pro's Steps 3, 4, 5 are bookkeeping-correct.** Specifically:
  - The envelope `C_{H,n}` monotonicity across blocks via `R_h <= L_{h-1}` (Pro uses `n^{2 tau_H}` growth between adjacent `I_h`).
  - The flat-block mass bound `|lambda_{H,n}| = O_H(1/log n)` via the three explicit estimates (bottom, gap, top tail).
  - The weak convergence `nu_{H,n} -> rho(u) 1_{G_H}(u) du` via integration by parts. The error term `E_{n,h}(f)` bound relies on `n^{-alpha_h} log n -> 0`, which requires `alpha_h > 1/log n`, i.e., fixed `alpha_h > 1/H`. Verify this uniformity holds.
  - The removal of excisions `|(0,1] setminus G_H| <= 5/(4H)` and the bound `J_r - J_r^{(H)} <= 5r/(4H)`.

- **Sandbox-check the numerical sanity.** Pro's FFT gives `W_4/2 ~ 0.18971`; the prior Bonferroni-4 computation from `phase3/shortener_piecewise_bonferroni4_summary.md` gives `W_4/2 = 0.189710592`. The 7th-decimal discrepancy may be discretization error in Pro's FFT. Verify both independently and reconcile.

If you identify any real gap, close it rigorously before proceeding to Lean.

## 2. Begin Lean formalization (incremental)

Priority order — commit each piece as it lands:

- **(a) Local prime-count-per-range lemma.** Uses PNT (Mathlib has the Selberg-Erdős formalization). Short self-contained Lean statement. Start here.

- **(b) Envelope construction monotonicity (Step 3).** Floor functions and the ratio `A_{n,h-1}(alpha_{h-1}) / A_{n,h}(beta_h) -> infty` with `n^{2 tau_H}` growth. Arithmetic and real-analysis, no measure theory yet.

- **(c) Inversion step (Step 4).** `b_j = inf {X : C_{H,n}(X) >= j}` monotone with `q_j <= b_j`. Short.

- **(d) Flat-block mass bound (Step 5 partial).** Three explicit `O_H(1/log n)` estimates. Arithmetic.

Defer the weak-convergence / factorial-moment convergence parts — those require Mathlib measure-theory wiring (weak convergence of measures, product measures on simplices, Fubini) that may take significant scaffolding. Handle them later if (a)-(d) land cleanly.

The `aristotle/t2_finite_core/` project structure is a good template for setting up the Lean project. A new `aristotle/round15_bonferroni4/` directory is fine, or extend the existing `aristotle/shortener_13_36_v2_out/` if the comparison theorem lives there.

## 3. Rules

- Commit each substep as it lands. Do not bundle multiple Lean files into a single end-of-task commit.
- If you refute any step of Pro's proof while auditing, stop Lean work immediately, report the refutation with explicit counterexample in a markdown note, and try to fix it.
- Sandbox-verify all numerical computations. Match the existing `phase3/shortener_piecewise_bonferroni4.py` methodology for FFT / Richardson extrapolation.
- Update `publication_source_of_truth.md` Section 3 / Section 8 ranking to reflect the new headline `W_4/2 ~ 0.19n` upper bound once audit confirms.
- Continue `T2 GraphReachable` work in parallel if capacity allows, but R57 is now higher paper priority.

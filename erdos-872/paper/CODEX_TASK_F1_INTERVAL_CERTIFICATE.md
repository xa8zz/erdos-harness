# Codex Task F1: Full Interval-Convolution W_4 Certificate

## Context

Review finding F1 (see `REVIEW_FINDINGS_2026-04-21.md`) flagged a P1
ship-blocker: the current `scripts/wfour_certification.py` is a transcript
checker that takes the four `J_r` intervals as hardcoded input (see
`CERTIFIED_J` dict) and only recomputes the sign-sensitive final inequality
`W_4/2 < 0.19`. But `erdos-872/paper/sections/appendix-B-numerical.tex` lines
72–76 claims the script *"reproduces the certified intervals displayed above"*
— an overstatement that must be fixed before arXiv submission because the
headline theorem depends on the numerical certificate.

**Task:** implement the full outward-rounded interval convolution so the
script genuinely reproduces the `J_r` intervals from first principles. Then
verify the paper's Appendix B wording matches what the script does.

Working directory: `/Users/omisverycool/erdos-harness`.
Script path:       `scripts/wfour_certification.py`.
Paper appendix:    `erdos-872/paper/sections/appendix-B-numerical.tex`.

## Mathematical specification

All formulas are already stated rigorously in Appendix B. Implement them.

### Setup

The Bonferroni-4 moment constants are

```
J_r = (1/r!) * integral_{simplex} prod_{j=1..r} rho(u_j) du_1 ... du_r
```

where `rho(u) = 1 / ((floor(1/u) + 1) * u)` for `0 < u <= 1`, and the simplex
is `{(u_1,...,u_r) : u_j > 0, sum u_j <= 1}`.

### Discretization

Partition `(0, 1]` into `N` equal cells `I_i = ((i-1)/N, i/N]` for
`1 <= i <= N`. Default in the paper: `N = 10^5`.

Cell mass:

```
m_i = F(i/N) - F((i-1)/N)
```

where the antiderivative is piecewise, with `x in (1/(h+1), 1/h]`:

```
F(x) = T_{h+1} + (1/(h+1)) * log((h+1) * x)
```

and

```
T_k = sum_{ell >= k} log(1 + 1/ell) / (ell + 1).
```

The tail is truncated at `H^* = 10^6`. The truncation error is bounded by

```
sum_{ell > H^*} log(1+1/ell)/(ell+1) <= sum_{ell > H^*} 1/(ell(ell+1))
                                       = 1/(H^* + 1).
```

### Convolution

The `r`-fold convolution coefficients are

```
c_s^(r) = sum_{i_1 + ... + i_r = s} m_{i_1} * ... * m_{i_r}.
```

The interval bounds for `J_r` are

```
(1/r!) * sum_{s <= N}     c_s^(r)  <=  J_r  <=  (1/r!) * sum_{s <= N+r} c_s^(r).
```

### Final inequality

Using lower endpoints for `J_1, J_3` and upper endpoints for `J_2, J_4`:

```
W_4 / 2 = (1 - J_1 + J_2 - J_3 + J_4) / 2 <= 0.1897123371 < 0.19.
```

## Requirements

### Mandatory

1. **Outward-rounded interval arithmetic throughout.** Use `mpmath.iv` or an
   equivalent library where `log`, `+`, `-`, `*`, `/` return intervals with
   the true value strictly contained. Do not at any point pass through
   binary floats without interval bracketing.

2. **No unbounded FFT floating-point error.** Appendix B explicitly rules
   out unbounded FFT error. If you use FFT-based convolution, prove
   (in a docstring and as a unit test) that its floating-point round-off is
   itself bounded outward and added to the final intervals. Otherwise use
   direct interval convolution.

3. **Compute `J_r` intervals from first principles.** Remove the hardcoded
   `CERTIFIED_J` dict. Replace it with a function that computes `m_i`
   intervals, then computes `c_s^(r)` via interval convolution, then outputs
   `J_r` bounds. The final `W_4/2 < 0.19` check remains, but now operates on
   the script's own computed intervals, not a transcript.

4. **Match or tighten the current certificate.** The currently hardcoded
   intervals are:
   - `J_1 in [0.7885305658, 0.7885305661]` (width ~3e-10)
   - `J_2 in [0.18681848, 0.18682451]` (width ~6e-6)
   - `J_3 in [0.02009209, 0.02009370]` (width ~1.6e-6)
   - `J_4 in [0.00122263, 0.00122282]` (width ~1.9e-7)

   The script's output must be no wider than these intervals (otherwise we
   can no longer certify `W_4/2 < 0.19` with the claimed margin
   `eta = 2.87e-4`). If your algorithm cannot match the precision at the
   default `N = 10^5`, either increase `N` or switch to a sharper algorithm.

5. **Print the computed intervals** and compare against the paper's
   displayed intervals. If the computed intervals fall strictly inside the
   displayed ones, the script prints "OK: computed intervals match paper
   within declared widths." If they fall outside, raise `SystemExit` with
   a diagnostic.

### Algorithmic freedom

The paper specifies `N = 10^5` and `H^* = 10^6`, but these are not
mandatory for the script — what matters is that the output intervals are
at least as tight as the paper's. You may choose:

- **Direct interval convolution** at a smaller `N` with tighter per-cell
  bounds if it fits in memory and runs in reasonable time.
- **Piecewise analytic integration** over the dyadic cells `(1/(h+1), 1/h]`
  where `rho` has closed form. This is likely the most efficient path: for
  each `h` up to some `H_max`, compute exact interval bounds on the
  contribution of that dyadic cell to each `J_r`, sum, and add a rigorous
  tail bound for `h > H_max`.
- **Interval-aware polynomial multiplication** (Karatsuba with interval
  outward rounding).

Pick whichever is fastest while satisfying Requirements 1-4. Document
the choice in the script's docstring.

### Runtime budget

The script should finish in **under 10 minutes** on a standard laptop at
its default parameters. If the chosen algorithm is slower, add a
`--fast` flag with a documented weaker precision for CI and keep the
slow default for the certificate.

## Appendix B wording

After the script is implemented, review
`erdos-872/paper/sections/appendix-B-numerical.tex` lines 70–76 and
adjust as needed so the wording matches what the script actually does.
Specifically:

- If the script reproduces the `J_r` intervals via direct interval
  convolution at `N = 10^5`, keep the current wording ("reproduces the
  certified intervals displayed above").
- If the script uses a different algorithm (e.g., piecewise analytic
  integration) that still produces intervals at least as tight as
  displayed, update the wording to describe that algorithm accurately
  (e.g., "A reference Python implementation using `mpmath` with
  outward-rounded interval arithmetic is available at
  `scripts/wfour_certification.py`; running it with the default parameters
  computes interval bounds on each `J_r` from closed-form piecewise
  integration of `rho`, matching or tightening the intervals displayed
  above").

Also update the "Directed-rounding implementation details" subsection
(lines 110–137) if your algorithm deviates from the cell-mass convolution
picture described there.

## Testing

Add a test file `scripts/test_wfour_certification.py` (or extend an
existing test scaffold) with:

1. **Determinism test.** Running the script twice with the same seed
   parameters produces identical intervals.

2. **Monotonicity test.** Running at precision `dps=40` produces intervals
   at least as wide as at `dps=80` (or specify another precision pair).

3. **Containment test.** The script's computed `J_r` intervals fall
   strictly inside (or equal) the paper's displayed intervals for each
   `r = 1, 2, 3, 4`.

4. **Margin test.** The computed `W_4 / 2` upper endpoint is strictly less
   than `0.19`, with margin at least `2.87e-4`.

## Compile / workflow rules

- After script changes and Appendix B updates, rebuild with
  `tectonic -X compile main.tex` from `erdos-872/paper/`.
- Zero undefined references, zero missing citations, no new overfulls
  beyond the pre-existing bibliography underfull warnings.
- **Two commits:**
  - Commit 1: script implementation + tests. Commit message:
    `Scripts: implement full outward-rounded interval convolution for W_4/2 certificate (F1)`.
  - Commit 2: Appendix B wording update + paper recompile. Commit message:
    `Paper: align Appendix B wording with the reproducing certificate script (F1)`.
- No amend, no force-push, no `--no-verify`.
- Do not push to remote until the user reviews.

## Final self-audit

After both commits, write a short self-audit (under 400 words) covering:

1. **Algorithm choice.** Which approach you picked (direct convolution,
   piecewise analytic, polynomial FFT) and why.

2. **Interval width comparison.** Side-by-side table of paper-displayed
   intervals vs script-computed intervals for `J_1, J_2, J_3, J_4`. Flag
   any interval where your computed width is wider than the paper's.

3. **Runtime.** Wall-clock time at the default parameters on the machine
   used.

4. **Tail bound audit.** Confirm the `T_k` truncation at `H^* = 10^6` (or
   whatever you use) gives error below `1e-8` or the width of `J_4`,
   whichever is smaller.

5. **FFT audit (if applicable).** If you used FFT, confirm the
   floating-point round-off bound you added to the output intervals and
   explain its derivation.

6. **Remaining gaps.** Any place where the script cannot reach paper
   precision without a manual override — flag explicitly.

Push only after all tests pass, the self-audit is written, and the user
has had a chance to review.

# Shortener Constants Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Add a standalone Phase 3d calculator that independently evaluates the Shortener upper-bound constants `V` and `C`, writes raw CSV output, and produces a short ratification summary.

**Architecture:** Keep the implementation in one self-contained Python module under `erdos-872/phase3/`. Use recursive 1-D quadrature as the primary numerical method for the simplex integrals `I_r`, with `scipy.integrate.quad` for the explicit 1-D checks and optional `mpmath` as an internal precision cross-check for the alternating series. Mirror the recent Phase 3 pattern: one script, one `unittest` module, one CSV, one markdown summary, one log.

**Tech Stack:** Python 3, `scipy.integrate`, `mpmath`, `csv`, `unittest`

---

### Task 1: Add the failing test module

**Files:**
- Create: `/Users/omisverycool/erdos-harness/erdos-872/phase3/test_shortener_constants.py`
- Test: `/Users/omisverycool/erdos-harness/erdos-872/phase3/test_shortener_constants.py`

**Step 1: Write the failing tests**

Add tests for:
- `I_1 = log(2)` to 10 decimals.
- A computed truncation where the next term bounds the alternating-series tail.
- `C` matching `0.2270367482` to 8 decimals.

**Step 2: Run the test to verify it fails**

Run:
```bash
python3 -m unittest /Users/omisverycool/erdos-harness/erdos-872/phase3/test_shortener_constants.py
```

Expected: `ModuleNotFoundError` for `shortener_constants`.

### Task 2: Implement the standalone calculator

**Files:**
- Create: `/Users/omisverycool/erdos-harness/erdos-872/phase3/shortener_constants.py`

**Step 1: Add the shared numerical helpers**

Implement:
- absolute output paths (`CSV_PATH`, `SUMMARY_PATH`, `LOG_PATH`)
- `log_line`
- recursive simplex integral evaluation for `I_r`
- explicit `quad` checks for `I_1` and the `C` integral
- a helper that counts matching leading decimals against claimed values

**Step 2: Add the constant evaluators**

Implement:
- `compute_i_r(r)`
- `compute_v_series(stop_tol=1e-13)`
- `compute_c_constant()`
- monotonicity / positivity sanity assertions

**Step 3: Add artifact writers**

Write:
- `shortener_constants.csv`
- `shortener_constants_summary.md`
- `shortener_constants.log`

### Task 3: Generate the artifacts

**Files:**
- Modify: `/Users/omisverycool/erdos-harness/erdos-872/phase3/shortener_constants.py`
- Create: `/Users/omisverycool/erdos-harness/erdos-872/phase3/shortener_constants.csv`
- Create: `/Users/omisverycool/erdos-harness/erdos-872/phase3/shortener_constants_summary.md`
- Create: `/Users/omisverycool/erdos-harness/erdos-872/phase3/logs/shortener_constants.log`

**Step 1: Run the calculator**

Run:
```bash
python3 /Users/omisverycool/erdos-harness/erdos-872/phase3/shortener_constants.py
```

Expected:
- all artifacts created
- `V` and `C` reported to 12 decimals
- agreement table filled in

**Step 2: Inspect the outputs**

Check:
- `I_1` agrees with `log 2`
- `I_r > 0` and decreases from `r = 2` onward
- `V in (0, 1)`
- `C in (0, 1/2)`

### Task 4: Verify and close out

**Files:**
- Test: `/Users/omisverycool/erdos-harness/erdos-872/phase3/test_shortener_constants.py`
- Review: `/Users/omisverycool/erdos-harness/erdos-872/phase3/shortener_constants_summary.md`

**Step 1: Run the unit tests**

Run:
```bash
python3 -m unittest /Users/omisverycool/erdos-harness/erdos-872/phase3/test_shortener_constants.py
```

Expected: PASS.

**Step 2: Verify the artifact set**

Confirm:
- all requested Phase 3d files exist
- CSV row count matches the reported quantities
- summary verdict matches the computed agreements


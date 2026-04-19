# DeepThink Protocol Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Add a Phase 3 simulator that tests the DeepThink three-phase Prolonger protocol against three deterministic Shortener variants and writes the requested CSV, summary, tests, and run log.

**Architecture:** Reuse the Phase 2 lazy antichain simulator pattern: one context object for sieves/prime lists/divisor data and one game object with swap-delete legal-state updates. Layer the protocol on top as a Prolonger state machine with explicit phase counters and Shortener-specific preemption accounting, then drive a deterministic grid runner that writes CSV and Markdown outputs.

**Tech Stack:** Python 3 standard library, existing `phase1/exact_minimax_v2.py` conventions, unittest.

---

### Task 1: Add the failing tests

**Files:**
- Create: `/Users/omisverycool/erdos-harness/erdos-872/phase3/test_deepthink_protocol.py`
- Create: `/Users/omisverycool/erdos-harness/erdos-872/phase3/deepthink_protocol.py`

**Step 1: Write the failing tests**

- Test threshold conventions and block-building degeneration at `n = 1000`.
- Test a legal/illegal Phase 3 edge case where a prior move containing `p*` blocks `p* q`.
- Test a small complete run returns an antichain and maximal end state.

**Step 2: Run test to verify it fails**

Run: `python3 -m unittest /Users/omisverycool/erdos-harness/erdos-872/phase3/test_deepthink_protocol.py`

Expected: fail because `deepthink_protocol.py` does not exist yet or required classes/functions are missing.

### Task 2: Implement the simulator minimally to satisfy the tests

**Files:**
- Modify: `/Users/omisverycool/erdos-harness/erdos-872/phase3/deepthink_protocol.py`

**Step 1: Add context/game primitives**

- SPF sieve, prime lists, lazy divisor cache, swap-delete legal set.
- Explicit `verify_move_is_legal`, `assert_antichain`, and `assert_maximal`.

**Step 2: Add protocol/strategy logic**

- `S_race`, `S_smallest_legal_prime`, `S_smallest_legal`.
- Prolonger phase state for block-building, blocked-pair completion, large-prime blocking, and fallback.

**Step 3: Run the tests until green**

Run: `python3 -m unittest /Users/omisverycool/erdos-harness/erdos-872/phase3/test_deepthink_protocol.py`

### Task 3: Add the deterministic runner and summary generation

**Files:**
- Modify: `/Users/omisverycool/erdos-harness/erdos-872/phase3/deepthink_protocol.py`
- Create: `/Users/omisverycool/erdos-harness/erdos-872/phase3/logs/deepthink_protocol.log`

**Step 1: Add grid runner + CSV writer**

- Run `n in {1000, 3000, 10000, 30000, 100000, 300000, 1000000}` against the three Shorteners.
- Write `deepthink_protocol.csv` with the exact requested columns.

**Step 2: Add Markdown synthesis**

- Compute both normalized statistics and the blocked-ratio diagnostics.
- Emit a clear verdict for `S_race`.

### Task 4: Verification

**Files:**
- Update only generated Phase 3 outputs above.

**Step 1: Run tests**

Run: `python3 -m unittest /Users/omisverycool/erdos-harness/erdos-872/phase3/test_deepthink_protocol.py`

**Step 2: Run the simulator sweep**

Run: `python3 /Users/omisverycool/erdos-harness/erdos-872/phase3/deepthink_protocol.py`

**Step 3: Spot-check artifacts**

- Confirm CSV row count equals `7 * 3 = 21`.
- Confirm summary and log files exist.
- Confirm end-state assertions stayed green throughout the run.

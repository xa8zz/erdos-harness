# Sparse Subset Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Add a standalone Phase 3b sparse-subset measurement that enumerates `M_Q`, builds the carrier universe, measures greedy and explicit carrier subsets, and writes the requested CSV, summary, tests, and log.

**Architecture:** Use a standalone Python module under `erdos-872/phase3/` with its own sieve, enumeration, carrier-incidence graph, and deterministic greedy trajectory. Keep the implementation independent of `deepthink_protocol.py`, and derive all greedy targets from one trajectory per `(n, beta, gamma)` instance instead of rerunning the cover loop four times.

**Tech Stack:** Python 3 standard library, `fractions.Fraction` for stable threshold arithmetic, `heapq`, unittest.

---

### Task 1: Add the failing tests

**Files:**
- Create: `/Users/omisverycool/erdos-harness/erdos-872/phase3/test_sparse_subset.py`
- Create: `/Users/omisverycool/erdos-harness/erdos-872/phase3/sparse_subset.py`

**Step 1: Write the failing tests**

- Independent brute-force cross-check of `M_Q` enumeration on a small `n`.
- Deduplication test on a known `m` with two admissible `q` representations.
- Isolation test that requires all three carriers.
- Antichain verification on a carrier set.

**Step 2: Run test to verify it fails**

Run: `python3 -m unittest /Users/omisverycool/erdos-harness/erdos-872/phase3/test_sparse_subset.py`

Expected: fail because `sparse_subset.py` does not exist yet or required symbols are missing.

### Task 2: Implement the standalone enumerator and cover routines

**Files:**
- Modify: `/Users/omisverycool/erdos-harness/erdos-872/phase3/sparse_subset.py`

**Step 1: Add context + enumeration**

- Prime sieve and odd-prime lists.
- Exact-power threshold helpers.
- `M_Q` enumeration deduped by integer `m`.
- Carrier universe and incidence lists.

**Step 2: Add sparse-subset measurements**

- One greedy trajectory with bootstrap and lazy gain updates.
- Explicit `delta = beta / 2` construction.
- Antichain verification on every reported `S`.

**Step 3: Run the tests until green**

Run: `python3 -m unittest /Users/omisverycool/erdos-harness/erdos-872/phase3/test_sparse_subset.py`

### Task 3: Add the grid runner and synthesis

**Files:**
- Modify: `/Users/omisverycool/erdos-harness/erdos-872/phase3/sparse_subset.py`
- Create: `/Users/omisverycool/erdos-harness/erdos-872/phase3/logs/sparse_subset.log`

**Step 1: Add CSV/log writing**

- Grid over `n in {1e4, 3e4, 1e5, 3e5, 1e6}` and `(beta, gamma) in {(0.35, 0.45), (0.40, 0.49)}`.
- Methods: four greedy targets plus one explicit construction.

**Step 2: Add summary generation**

- Table of `(S/R) log log n`.
- Best explicit construction at `n = 1e6`.
- `|E_Q|` full counts per `n`.
- Top-line rescue verdict.

### Task 4: Verification

**Step 1: Run tests**

Run: `python3 -m unittest /Users/omisverycool/erdos-harness/erdos-872/phase3/test_sparse_subset.py`

**Step 2: Run the full sparse-subset sweep**

Run: `python3 /Users/omisverycool/erdos-harness/erdos-872/phase3/sparse_subset.py`

**Step 3: Spot-check artifacts**

- Confirm CSV row count equals `5 * 2 * 5 = 50`.
- Confirm summary and log files exist.
- Confirm every reported `S` passed the antichain check.

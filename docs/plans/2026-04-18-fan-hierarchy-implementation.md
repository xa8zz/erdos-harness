# Fan Hierarchy Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Add a standalone Phase 3c audit that measures fixed-rank fan yield, cross-rank auto-shielding, and window-sum target mass, then writes the requested three CSVs, summary, tests, and log.

**Architecture:** Use one self-contained Python module under `erdos-872/phase3/` with a shared prime sieve, exact-power helper, target enumerator, and divisor-subset utilities. Build Probe A on top of an allowed-universe antichain simulator, Probe B on divisor-count indices across ranks, and Probe C on exact counting by core subsets plus prime-count range queries.

**Tech Stack:** Python 3 standard library, `fractions.Fraction`, `itertools`, `heapq`, `statistics`, unittest.

---

### Task 1: Add the failing tests

**Files:**
- Create: `/Users/omisverycool/erdos-harness/erdos-872/phase3/test_fan_hierarchy.py`
- Create: `/Users/omisverycool/erdos-harness/erdos-872/phase3/fan_hierarchy.py`

**Step 1: Write the failing tests**

- Small-`n` target enumeration cross-check against a direct brute-force constructor.
- Divisor-count test: each rank-`h` target has exactly `2^(h+1)-2` nontrivial proper divisors.
- Probe A legality/replay test on a small instance.

**Step 2: Run test to verify it fails**

Run: `python3 -m unittest /Users/omisverycool/erdos-harness/erdos-872/phase3/test_fan_hierarchy.py`

Expected: fail because `fan_hierarchy.py` does not exist yet or required symbols are missing.

### Task 2: Implement the shared enumerator and Probe A

**Files:**
- Modify: `/Users/omisverycool/erdos-harness/erdos-872/phase3/fan_hierarchy.py`

**Step 1: Add core helpers**

- Exact threshold arithmetic with fractions.
- Prime sieve and fast prime-range count helpers.
- Target enumeration for rank `h`.

**Step 2: Add Probe A simulator**

- Restricted allowed universe from targets plus proper divisors.
- Prolonger target-first policy.
- Three Shortener strategies with legality assertions and replay verification.

**Step 3: Run tests until green**

Run: `python3 -m unittest /Users/omisverycool/erdos-harness/erdos-872/phase3/test_fan_hierarchy.py`

### Task 3: Implement Probe B and Probe C

**Files:**
- Modify: `/Users/omisverycool/erdos-harness/erdos-872/phase3/fan_hierarchy.py`

**Step 1: Add Probe B**

- Rank-indexed divisor-count maps.
- Deterministic sampled cross-rank shielding summaries.

**Step 2: Add Probe C**

- Exact `|T_h|` counting by core subsets.
- Mertens estimate and window-mass summaries.

### Task 4: Add CSV/log/summary writers and run the full audit

**Files:**
- Modify: `/Users/omisverycool/erdos-harness/erdos-872/phase3/fan_hierarchy.py`
- Create: `/Users/omisverycool/erdos-harness/erdos-872/phase3/logs/fan_hierarchy.log`

**Step 1: Write the three CSVs**

- `fan_hierarchy_probeA.csv`
- `fan_hierarchy_probeB.csv`
- `fan_hierarchy_probeC.csv`

**Step 2: Write the synthesis**

- Per-probe verdicts.
- Top-line headline.

### Task 5: Verification

**Step 1: Run tests**

Run: `python3 -m unittest /Users/omisverycool/erdos-harness/erdos-872/phase3/test_fan_hierarchy.py`

**Step 2: Run the full audit**

Run: `python3 /Users/omisverycool/erdos-harness/erdos-872/phase3/fan_hierarchy.py`

**Step 3: Spot-check artifacts**

- Confirm Probe A/B/C CSVs exist and are nonempty.
- Confirm summary and log exist.
- Confirm Probe A replay/antichain assertions stayed green.

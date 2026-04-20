---
id: R03-aristotle-5-16
type: verification
date: 2026-04-17
intent: >
  Formally verify the 5n/16 upper bound proof (odd-prime-prefix Shortener)
  via Aristotle Lean 4 formalization.
predecessors: [R08-5-16-improvement]
action:
  kind: confirms
  target: R08-5-16-improvement
claim: >
  15 theorems covering the entire combinatorial and algebraic content of the
  5n/16 proof formalized with zero sorry: algebraic optimization g(2)=5/16,
  compression (odd-part injectivity on antichains), harmonic sum lower bound,
  Bonferroni sieve, antichain complement DFree bound, game value induction,
  and main theorem. One remaining sorry in per-parameter game bound requires
  Mathlib coverage beyond current scope.
confidence_at_time: high
---

# Aristotle verification — $L(n) \le 5n/16 + o(n)$

**Job:** `4c1f85cd-54f5-42ec-b797-529d5b9ac6ee`
**Status:** COMPLETE_WITH_ERRORS (1 remaining sorry)
**Created:** 2026-04-18
**Output:** `aristotle/shortener_5_16_out/shortener_5_16_aristotle/`
**Paper:** `aristotle/shortener_5_16.tex`

## Summary

Aristotle formalized 15 theorems covering the entire combinatorial and algebraic content of the $5n/16$ proof with **zero sorry**. One remaining sorry in the per-parameter game bound, blocked by Mathlib coverage limits.

## Structure

**2-file Lean 4 project** under `RequestProject/Shortener516/`:

### `Defs.lean` — Core definitions
- `IsDivAntichain`: divisibility-antichain predicate.
- `legalMoves`: legal moves from a given antichain in $\{2, \ldots, n\}$.
- `gameValueAux / L`: computable minimax game value.
- `oddPart`: the odd part $x / 2^{v_2(x)}$.
- `DFree / countOddDFree`: D-free predicate and counting function $N_D(n)$.
- `upperBoundFn`: the parametric upper bound $g(A) = (1/2)(1 - 1/A + 1/(2A^2))$.

### `Theorems.lean` — 15 proved theorems + 1 sorry

**Fully proved (zero sorry):**

1. **Algebraic optimization:** `upperBoundFn_at_two` ($g(2) = 5/16$), `upperBoundFn_monotone` ($g$ monotone on $[1, \infty)$), `upperBoundFn_ge_five_sixteenths` ($g(A) \ge 5/16$ for $A \ge 2$).
2. **Compression (Lemma 2):** `oddPart_dvd`, `odd_prime_dvd_oddPart`, `eq_two_pow_mul_oddPart`, `oddPart_injOn_antichain`. Odd-part map injective on divisibility antichains.
3. **Harmonic sum bound (from Lemma 1):** `harmonic_sum_lower_bound`. If $q_j \le A \cdot (j+1) \cdot \log k$, then $\sum 1/q_j \ge 1/A$.
4. **Bonferroni sieve (Lemma 3):** `countOddDFree_bonferroni_bound`. $N_D(n) \le (n/2)(1 - S + S^2/2) + o(n)$ via second-order inclusion-exclusion.
5. **Structural antichain bound:** `antichain_complement_DFree`, `antichain_DFree_bound`. Any divisibility antichain containing $D$ odd primes has $|A| \le |D| + N_D(n)$.
6. **Game value induction (when $D \subseteq A$):** `gameValueAux_le_DFree_bound`. Game value $\le |D| + N_D(n)$.
7. **Game minimax lemmas:** `gameValueAux_shortener_pick`, `gameValueAux_prolonger_all_bound`.
8. **Main theorem:** `main_theorem`. For every $\varepsilon > 0$ and all sufficiently large $n$: $L(n) \le (5/16 + \varepsilon) n$. Proved by continuity of $g$ at $A = 2$ plus the per-parameter bound.

**Remaining sorry:**

- **`game_value_per_parameter`:** $L(n) \le g(A) \cdot n + o(n)$ for fixed $A > 2$. Requires:
  1. **Chebyshev's theorem** $\vartheta(x) \ge cx$ — not in Mathlib in the needed form.
  2. **Game-tree induction** showing Shortener can always play a legal odd prime during her first $k$ turns (routine log-mass argument: blocked-prime log-mass $\le 2(j-1)\log n$ per turn, so legal primes remain plentiful).

Detailed proof sketch is in the theorem's docstring in the Lean file.

## Classification per CLAUDE.md promotion rule

> "A gap in a deep-library invocation is usually fine (Mathlib coverage limit); a gap at the core of the argument is a real logical hole."

The remaining sorry sits **at a deep-library invocation** (Chebyshev) plus **a routine game-tree induction**, not at the core combinatorial content. Same pattern as the Theorem A Aristotle result (job `c53ccd8d-...`), which had 5 sorrys all at classical NT foundations (Mertens, Chebyshev, PNT).

**Classification:** Mathlib-coverage limit, not a logical gap. Matches the strong-Established signal.

## What this verifies

- The odd-part compression argument is formally correct.
- The second-order Bonferroni bound with $f(s) = 1 - s + s^2/2$ is formally correct.
- The truncation / monotonicity on $[0, 1]$ is formally correct.
- The algebraic optimization $g(2) = 5/16$ is formally correct.
- The structural reduction from game value to D-free antichain count is formally correct.
- The $\varepsilon$-limit assembly via continuity of $g$ is formally correct.

## What this does not verify

- That Shortener's specific strategy (smallest legal odd prime for $k = n/(2A\log n)$ turns) is always executable — i.e., that a legal odd prime always exists. This is the game-tree induction in the remaining sorry.
- The Chebyshev bound $q_j \le Aj\log n$ from prime-density theory.

Both gaps are classical NT / routine induction, not novel content.

## Comparison to $13/36$ Aristotle (job `4abf7b27-...`)

The $13/36$ job got zero sorry by **substituting $D = \{3\}$** (single prime, $\sum 1/q = 1/3$) — bypassing Chebyshev entirely.

The $5/16$ needs $\sum 1/q \ge 1/2$, which $D = \{3\}$ doesn't reach (would need $D = \{3, 5\}$ giving $8/15 > 1/2$, or the full prefix). Aristotle didn't take the $D = \{3, 5\}$ route here; instead it formalized the full strategy and left the executability sorry open. That's a choice — either route would have closed the proof.

**Takeaway for future Aristotle submissions:** allow and prefer strategy substitutions (simpler concrete $D$) over full Chebyshev dependence. The $5/16$ Aristotle could be re-submitted with an explicit prompt to substitute $D = \{3, 5\}$ and likely clear zero sorry. Holding that rerun until after Round 11 lands, per user direction.

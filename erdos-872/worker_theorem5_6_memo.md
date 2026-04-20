# Theorem 5 / Theorem 6 Lean memo

## Bottom line

- Formalize **Theorem 5 before Theorem 6**. This matches the repo's own priority note: Theorem 5 is the cleaner first Lean win because it builds the reusable `resolved prime / carrier / legality` infrastructure and avoids the rank-3 triple layer. See `erdos-872/codex_backlog.md:203-205`.
- The fastest likely **zero-sorry** artifact is **not** the full asymptotic theorem first. It is a **static resolution theorem at a fixed antichain position**: after adding the phase-2/phase-3 repair moves for a disjoint small-prime carrier family, every carrier prime is resolved.
- After that static core lands, add two thin wrappers:
  1. phase 1 resolves the primes `p <= y` that are not in any composite carrier;
  2. resolved small primes imply every remaining legal move lies in `S_y = {x <= n : P^-(x) > y, Omega(x) <= 2}`.
- Only then decide whether to formalize the `O(n / log n)` counting shell. That shell is paper-important, but it is not the best first zero-sorry target.

Useful anchors:

- Theorem 5 statement and caveats: `erdos-872/current_state.md:1338-1368`, `erdos-872/followup-12-pro-closeout-response.md:48-73`
- Theorem 6 statement and audit summary: `erdos-872/current_state.md:1459-1485`, `erdos-872/researcher-13-pro-rank3-extension.md:19-95`
- Existing Lean game definitions already available:
  - `erdos-872/lean/shortener_5_16/shortener_5_16_aristotle/RequestProject/Shortener516/Defs.lean:37-52`
  - `erdos-872/lean/shortener_13_36/shortener_13_36_v2_aristotle/RequestProject/Shortener/Defs.lean:16-30,55-58`
- Existing finite-set / prime-cover bookkeeping pattern worth copying:
  - `erdos-872/lean/theorem_A/theorem_A_shield_lower_bound_aristotle/RequestProject/ShieldMainTheorem.lean:88-113,145-170`

## 1. Clean paper statement for Theorem 5

Recommended paper-facing statement:

> **Theorem 5 (disjoint small-prime carriers).** Fix `alpha in (1/3, 1/2)` and set `y = n^alpha`. Suppose every composite Prolonger move is supported on primes at most `y`, and the prime supports of distinct composite Prolonger moves are pairwise disjoint. Then Shortener has an online priority strategy such that after `O(n / log n)` of her own moves, every prime `p <= y` is resolved, meaning that no legal move remains divisible by `p`. Consequently every remaining legal move lies in
> `S_y = {x <= n : P^-(x) > y, Omega(x) <= 2}`,
> and hence the total game length is `O(n / log n)`.

Why this wording is the right paper statement:

- It keeps the strong public conclusion from `erdos-872/current_state.md:1338-1342`.
- It bakes in the **online** wording that the audits said is missing from the current proof prose (`erdos-872/current_state.md:1350-1353`; `erdos-872/verify-postresp-followup12-essentially-sound.md:159-167`).
- It makes "resolved" part of the theorem statement, which is exactly the load-bearing structural claim from `erdos-872/followup-12-pro-closeout-response.md:12-29,48-73`.

For formalization, I would split this paper theorem into:

1. a static resolution proposition (first Lean target);
2. a reduction "`resolved <= y` implies survivors lie in `S_y`";
3. a counting corollary.

That decomposition is much better for a fast, sorry-free artifact than trying to formalize the full statement in one shot.

## 2. Minimal static/combinatorial core to formalize first

### First zero-sorry target

The first artifact should be a **static theorem about carrier primes `B`**, not yet the full `p <= y` statement:

```lean
/-- Static core of Theorem 5: after the repair moves for a disjoint carrier family
    are inserted, every carrier prime is resolved. -/
theorem disjoint_carrier_repairs_resolve
  (n : ℕ) (A carriers : Finset ℕ) :
  ...
  ∀ p ∈ carrierPrimes carriers, ResolvedAt n (A ∪ phase2Powers ∪ phase3Pairs) p
```

What this should encode:

- `A` is an antichain position.
- `carriers ⊆ A` are the composite Prolonger moves.
- every carrier prime is `<= y`;
- distinct carriers have disjoint **prime supports**;
- `phase2Powers` contains `p^(e(p)+1)` for the primes in non-pure-power carriers, when `<= n`;
- `phase3Pairs` contains the cross-carrier semiprimes `pq`.

Why this is the right first theorem:

- It isolates the genuinely combinatorial content of `erdos-872/followup-12-pro-closeout-response.md:56-73`.
- It avoids the online scheduling patch on the first pass.
- It avoids prime counting, Mertens, and `O(n / log n)` asymptotics.
- It is exactly the infrastructure Theorem 6 reuses.

### What to formalize immediately after

Once the static theorem exists, the next two wrappers are lightweight:

1. **Phase-1 wrapper for noncarrier primes.**
   If `p <= y` does not occur in any composite carrier, then either Prolonger already played `p` as a prime or `p` is legal for Shortener's phase 1. This is the missing sentence flagged in the audits: `erdos-872/current_state.md:1352-1353`, `erdos-872/verify-postresp-followup12-essentially-sound.md:169-175`.

2. **Resolved-small-primes reduction.**
   Formalize only the structural part of Theorem 1 first:
   if every prime `p <= y` is resolved, then every legal `x` has `P^-(x) > y` and `Omega(x) <= 2`.
   This is just `erdos-872/followup-12-pro-closeout-response.md:16-24` without the analytic counting tail.

I would **not** make the `O(n / log n)` count the first Lean milestone.

## 3. Exact legality / resolved-prime / carrier lemmas needed

Below is the smallest lemma inventory that seems both sufficient and reusable.

### A. Base definitions

Reuse, do not reinvent:

- `IsDivAntichain`
- `legalMoves`

These already exist in the prior Aristotle projects:

- `erdos-872/lean/shortener_5_16/shortener_5_16_aristotle/RequestProject/Shortener516/Defs.lean:37-52`
- `erdos-872/lean/shortener_13_36/shortener_13_36_v2_aristotle/RequestProject/Shortener/Defs.lean:16-30,55-58`

Add only:

- `primeSupport : ℕ → Finset ℕ`
- `ResolvedAt (n : ℕ) (A : Finset ℕ) (p : ℕ) : Prop := Nat.Prime p ∧ ∀ x ∈ legalMoves A n, ¬ p ∣ x`

### B. Legality lemmas

These are the exact "repair move is legal" facts Theorem 5 needs.

1. `carrier_prime_not_played_by_prime`

- If `p` divides a composite carrier already in `A`, then `p` itself is not in `A`.
- This is the audit patch behind the missing phase-1 sentence.
- Source pressure: `erdos-872/current_state.md:1352-1353`, `erdos-872/verify-postresp-followup12-essentially-sound.md:169-175`.

2. `phase2_power_legal`

- If `p` belongs to a carrier `C(p)` with at least two distinct prime factors, and `p^(e(p)+1) <= n`, then `p^(e(p)+1)` is legal against:
  - earlier played primes,
  - its own carrier,
  - all other carriers,
  - all phase-3 pair repairs.
- This is the real content of `erdos-872/followup-12-pro-closeout-response.md:60-64`.

3. `phase3_pair_legal`

- If `p` and `q` belong to distinct carriers, then `pq` is legal against:
  - primes,
  - carriers,
  - phase-2 powers.
- This is the other half of `erdos-872/followup-12-pro-closeout-response.md:61-64`.

4. `resolved_monotone`

- If `ResolvedAt n A p` and `A ⊆ A'`, then `ResolvedAt n A' p`.
- This is implicit in the definition of resolvedness in `erdos-872/followup-12-pro-closeout-response.md:12`.
- Very useful for the later online-priority wrapper.

### C. Carrier-structure lemmas

These are the load-bearing reductions in the proof.

5. `carrier_unique_of_disjoint_support`

- A carrier prime belongs to a unique carrier.
- This is the formal version of `C(p)` in `erdos-872/followup-12-pro-closeout-response.md:56`.

6. `outside_B_impossible_after_phase1`

- If `x` is legal after phase 1, every prime factor of `x` lies in `B`.
- This is the sentence at `erdos-872/followup-12-pro-closeout-response.md:66`.
- It should be split off because it also gets reused in Theorem 6 (`erdos-872/researcher-13-pro-rank3-extension.md:37-39,47`).

7. `two_carriers_force_pair_hit`

- If legal `x` contains primes from two distinct carriers, then one of the phase-3 pairs divides `x`.
- This is the reason "all primes of `x` lie in a single carrier" in `erdos-872/followup-12-pro-closeout-response.md:67`.

8. `single_carrier_reduction`

- If all prime factors of legal `x` lie in the support of one carrier `C`, then either `x ∣ C` or some prime exponent in `x` is strictly larger than its exponent in `C`.
- This is the coordinatewise exponent-vector dichotomy used at `erdos-872/followup-12-pro-closeout-response.md:68-69`.

### D. Resolved-prime finishers

These close the proof once the support has been reduced to one carrier.

9. `pure_prime_power_case`

- If the unique carrier containing `p` is `r^a`, and `x` is legal with `r ∣ x`, then after `single_carrier_reduction` one gets `x = r^b`, hence `x` is comparable with `r^a`.
- This needs to be separate because the current prose contains a false sentence here. See `erdos-872/followup-12-pro-closeout-response.md:68` and the audit fix at `erdos-872/verify-postresp-followup12-online-patch-needed.md:109-131`.

10. `exponent_overflow_hit_by_phase2`

- If `x` uses only primes from a non-pure-power carrier and `x ∤ C`, then for some carrier prime `r`,
  `r^(e(r)+1) ∣ x`.
- If that repair move was skipped because it exceeded `n`, then `x > n`, contradiction.
- This is the final move in `erdos-872/followup-12-pro-closeout-response.md:69`.

11. `carrier_prime_resolved_after_repairs`

- Assemble 6-10 to show every `p ∈ B` is resolved after the repair family is installed.

That is the exact theorem Theorem 6 wants to inherit.

## 4. Why Theorem 6 should wait until after Theorem 5

Yes: **Theorem 6 should wait**.

The repo already says this explicitly: `erdos-872/codex_backlog.md:203-205`.

I agree for three reasons:

1. **Theorem 6 reuses most of Theorem 5's infrastructure.**

- same antichain / legality / resolved-prime definitions;
- same phase-1 wrapper;
- same "`outside B` impossible after phase 1" lemma;
- same monotonicity / online-order patch.

2. **The genuinely new T6 content is narrow.**

Once T5 exists, T6 only adds:

- squarefree-carrier-specific phase-2 legality for `p^2`;
- survivor squarefreeness after phase 2;
- phase-4 triple cleanup;
- the "`|supp(x)| >= 4` implies a blocked triple divides `x`" induction step;
- the fixed-`alpha` triple-count estimate.

These are exactly the local points singled out by the audits:

- `erdos-872/verify-postresp-13-rank3-audit-2.md:5-22,86-104`
- `erdos-872/verify-postresp-13-rank3-audit-4.md:5-17`
- `erdos-872/verify-postresp-13-rank3-audit-6.md:5-27`

3. **Theorem 6's arithmetic tail is more annoying than T5's.**

The new load-bearing count is the triple layer
`T_alpha(n) = #{p < q < r <= y : p q r <= n}`,
and every audit says it is fine only as a **fixed-`alpha`** bound, with constants blowing up near `1/2`:

- `erdos-872/current_state.md:1465`
- `erdos-872/verify-postresp-13-rank3-audit-2.md:23-84`
- `erdos-872/verify-postresp-13-rank3-audit-4.md:12-17`
- `erdos-872/verify-postresp-13-rank3-audit-6.md:14-20`

So T6 is exactly the wrong first target if the goal is "fastest zero-sorry theorem artifact."

## 5. Wording instabilities / false sentences in the current prose

These are the places I would not reuse verbatim in a paper or Lean-facing note.

### Theorem 5

1. **False sentence in the pure-prime-power case.**

- Current prose: `erdos-872/followup-12-pro-closeout-response.md:68`
- Problem: "any `x` divisible by `r` is comparable with `r^a`" is false in general; e.g. `6` is divisible by `2` but not comparable with `8`.
- Audit fix: `erdos-872/verify-postresp-followup12-online-patch-needed.md:109-131`
- Paper fix: say "after the single-carrier reduction, `x = r^b`, hence `x` is comparable with `r^a`."

2. **The proof is written offline; the theorem should be stated online.**

- Current theorem proof is three batched phases: `erdos-872/followup-12-pro-closeout-response.md:58-64`
- Audit note: `erdos-872/current_state.md:1352-1353`, `erdos-872/verify-postresp-followup12-essentially-sound.md:159-167`
- Paper fix: explicitly say Shortener follows a priority queue online, not an offline post-processing sweep.

3. **Missing sentence about Prolonger's prime moves.**

- Gap source: `erdos-872/current_state.md:1353`
- Audit explanation: `erdos-872/verify-postresp-followup12-essentially-sound.md:169-175`
- Paper fix: add one sentence saying a prime cannot be both a Prolonger prime move and a prime factor of a composite Prolonger carrier, by antichain legality.

4. **The total-length corollary is currently too compressed.**

- Structural reduction is at `erdos-872/followup-12-pro-closeout-response.md:16-29`
- The theorem proof ends at `erdos-872/followup-12-pro-closeout-response.md:71-73`
- Audit note: `erdos-872/verify-postresp-followup12-essentially-sound.md:177-183`
- Paper fix: spell out the alternation step and the handoff from "all `p <= y` resolved" to "all survivors lie in `S_y`."

### Theorem 6

5. **Phase 2 should not say "for every `p in B`" without the unplayed-prime qualifier.**

- Original prose: `erdos-872/researcher-13-pro-rank3-extension.md:39`
- Audit correction: `erdos-872/verify-postresp-13-rank3-audit-2.md:5-22`
- Paper fix: "for each `p in B` whose prime has not already been played, `p^2` is legal and is played."

6. **The triple-count is fixed-`alpha`, not uniform near `1/2`.**

- Current summary already partially notes this: `erdos-872/current_state.md:1465`
- Detailed audit warning: `erdos-872/verify-postresp-13-rank3-audit-2.md:82-84`, `erdos-872/verify-postresp-13-rank3-audit-4.md:12-17`
- Paper fix: always write `O_alpha(n / log n)` and avoid any wording suggesting a uniform constant as `alpha -> 1/2`.

7. **The survivor induction is correct but too compressed for formalization.**

- Compressed prose: `erdos-872/researcher-13-pro-rank3-extension.md:55-56`
- Audit expansion: `erdos-872/verify-postresp-13-rank3-audit-2.md:90-104`
- Paper fix: explicitly say a phase-2 square cannot be comparable with a squarefree triple, so the earlier blocker of `pqr` must be a prime, a phase-3 semiprime, or a carrier supported in `{p,q,r}`.

### Cross-round wording drift

8. **Do not reuse the Round-12 line "overlapping carriers remain a genuine open obstruction" as a paper-facing sentence.**

- Chronological statement: `erdos-872/current_state.md:1360`
- Superseded by Theorem 6: `erdos-872/current_state.md:1459-1485,1544-1546`
- Better current wording: the remaining overlap obstruction starts at **rank >= 4**, while the mixed small/large-prime case is separately open.

## 6. Recommended formalization order

If the goal is speed, I would do the following exact order:

1. Reuse `IsDivAntichain` and `legalMoves`; add `primeSupport` and `ResolvedAt`.
2. Prove the static T5 core `disjoint_carrier_repairs_resolve` for carrier primes `B`.
3. Add the phase-1 wrapper for primes `p <= y` not in `B`.
4. Add the structural reduction "resolved small primes => survivors lie in `S_y`."
5. Stop and record the zero-sorry theorem artifact.
6. Only then extend to T6 by adding:
   - `p^2` legality under squarefree carriers,
   - squarefree survivor lemma,
   - semiprime/triple cleanup,
   - the `|supp(x)| >= 4` blocked-triple divisor lemma.
7. Leave the `O(n / log n)` counting shells for last.

That is the fastest route that is both mathematically faithful to the prose and realistically likely to finish without sorries.

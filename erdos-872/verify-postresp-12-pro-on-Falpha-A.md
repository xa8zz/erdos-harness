---
id: R12-verify-Falpha-A
type: verification
date: 2026-04-18
intent: >
  Adversarial audit of Pro's F_alpha framework from R12, with independent
  Python verification of the 85063 count.
predecessors: [R12-pro-response]
action:
  kind: confirms
  target: R12-pro-response
claim: >
  F_alpha is a valid antichain (verified). Static bound correct. Numerical
  correction: post-install admissible count is 83933, not 85063 — Pro
  conflates "structurally eligible" with "post-install admissible."
  Q_alpha-batchable-by-primes caveat needs explicit statement.
siblings: [R12-verify-Falpha-B, R12-verify-Falpha-friendly]
---

# Round 12 audit — pro-on-Falpha-A

**User-assigned auditor label:** Pro:
**Note:** Audits Pro's F_α framework. Independent Python verification; finds 85063 → 83933 numerical correction; flags 'omitted-vertex shadowing as unifier' as overstated.
**Source:** informal audit via user's tabs. Extracted verbatim from session transcript.

---

I'll audit each claim in order. For claim 3, let me first verify the numerics computationally, then work through the structural claims.Interesting — let me investigate the 85063 number more carefully. There might be a definition discrepancy.Found the numerical discrepancy. Let me drill down on the definition Pro is implicitly using:Here's my adversarial audit. I'll take the claims in the order you listed.

## 1. Is F_α genuinely an antichain?

**Holds.** The three sub-cases:
- Primes among themselves: distinct primes are pairwise incomparable (neither divides the other).
- Semiprimes among themselves: if d₁ | d₂ and both have Ω=2, then d₁ ∈ {1, prime factor of d₂, d₂}; since Ω(d₁)=2, d₁ = d₂.
- Prime p ≤ y vs semiprime d = qr with q, r > y: p | d would require p ∈ {q, r}, impossible since p ≤ y < q, r. And d ∤ p (Ω mismatch).

Pro asserts this; I can't find any gap.

## 2. Post-F_α structure (Ω ≤ 2, primes > y)

**Holds, with one subtlety worth stating.** The argument:
- For legal x: x incomparable to every p ∈ F_α with p prime ≤ y forces p ∤ x (since x ∤ p would require x ∈ {1, p} and either is excluded).
- So every prime factor of x is > y.
- If Ω(x) ≥ 3 with all factors > y = n^α, then x > n^{3α} > n because α > 1/3 (**strict**).

The strictness of α > 1/3 is load-bearing. At α = 1/3 exactly, n^{3α} = n, and Ω=3 survivors exist (e.g., x = pqr with p, q, r just above n^{1/3}). The argument doesn't degrade gracefully; it cleaves at α = 1/3. Pro's reduction critically depends on being able to push α to at least 1/3 + ε, which is also where the "missing lemma" lives. No flaw, but the whole framework sits on a knife-edge.

Also watch: the argument assumes there exist semiprime witnesses d ∈ Q_α available to include in F_α. For small n this is vacuous (Q_α = ∅ when y² > n/2, i.e., n^{2α} > n/2, i.e., α > 1/2 − log 2/(2 log n), which doesn't bite asymptotically but makes the construction non-trivial for small n). Not an error, but the construction is really only interesting in the narrow window (1/3, 1/2).

## 3. Numerical claim — **partially wrong**

`|F_α ∩ L| = 1153` ✓ verified exactly (95 primes ≤ 501, plus 1058 semiprimes ≤ 500,000 with both factors > 501).

`post-install admissible = 85063` ✗ **This is not the post-install admissible count.** It is the arithmetic count of *all* integers in [2, n] with Ω ∈ {1, 2} and every prime factor > y, decomposed as 78,403 primes in (y, n] plus 6,660 semiprimes pq ≤ n with both primes > y.

The actual post-install admissible count is **83,933**:
- 78,331 primes (primes > y that are **not** divisors of any semiprime in Q_α — concretely, primes > n/(2·503) ≈ 994)
- 5,602 upper semiprimes (pq with both primes > y and pq > n/2; those with pq ≤ n/2 are in Q_α, hence in A)

The 1,130 overcount is exactly 1,058 (Q_α elements already in A) + 72 (primes in (501, 994] that are killed by multiplication partners in Q_α, hence not incomparable to A).

Pro conflated "structural form" (integer has the right Ω and smoothness signature) with "admissible move" (incomparable to existing A). The conflation doesn't break the asymptotic O(n/log n) bound — both 83,933 and 85,063 are O_α(n/log n). But the predicted ratio `L log n / n` becomes 1.176 (with the corrected 85,086 = 1153 + 83933), which actually **matches the simulation 1.174 more closely than Pro's stated 1.19 does**. The corrected match is better than advertised; the stated match is based on a compensating error.

This is a surface slip, not a structural issue, but it's the kind of slip that suggests a bit more care is needed on "admissible" vs "structurally eligible" elsewhere — particularly in any dynamic version of the argument where the distinction is more delicate.

## 4. Q_α batching-resistance

**Holds for composite moves, but the phrasing "no composite-move batching can simultaneously kill multiple elements of Q_α" needs a small caveat.**

The three cases check out:
- d₁, d₂ both divide composite x: lcm ≥ n^{3α} > n if they share a prime, > n^{4α} > n if coprime. ✓
- x | d_i with Ω(d_i) = 2 and x composite: divisors of d_i are {1, prime factor, d_i}, so x = d_i. ✓
- Mixed (d₁ | x | d₂): forces d₁ | d₂, impossible for distinct semiprimes. ✓

**Caveat:** primes moves are *not* batching-resistant against Q_α. A prime p with y < p ≤ n/(2·503) is a factor of multiple elements of Q_α (all d = pq for primes q > y with pq ≤ n/2). Playing p eliminates all of them from the later legal set simultaneously. This isn't a violation of Pro's claim (which is specifically about composite moves), but it's relevant to the overall strategic picture: **Shortener can batch-kill Q_α elements with primes**, which is consistent with the proposed strategy ("install F_α via small prime moves plus semiprime completion").

## 5. Omitted-vertex shadowing as unifier — **overstated**

The three prior failures do share a family resemblance, but not the specific mechanism Pro names. Going through them:

- **Block-product counter** (universal Prolonger against carrier mass): the obstruction is anti-batching via pairwise-coprime blocks with products exceeding n. Prolonger packs primes into S_i so that ∏ S_i·∏ S_j > n — this is a *pigeon* construction (can't cover both blocks with one move) not a shadowing one.

- **R_y counterexample** (one-step Ω=2 cover fails): the obstruction is that Ω=2 divisors of Ω=3 elements with all primes > log n are intrinsically of size > log² n, so a single Ω=2 Shortener move scores at most n/log² n. This is arithmetic sparsity, not a constructed shadow.

- **Static carrier capacity** (top interval contains a multiple of every prime ≤ εn): pure pigeonhole / density, no shadowing involved.

The "3·5·7 → {30, 42, 70} shadows {15, 21, 35}" example is a genuinely different mechanism (omitting one of k prime factors from a k-tuple to construct k+1 shadowing multipliers). It explains one specific kind of failure — namely, pure fixed-Ω reservoir strategies — but it doesn't explain the block-product counter (blocks don't omit vertices of a fixed witness; they *replace* the witness set with a coprime family) or the R_y obstruction (which is about the geometry of prime factorizations, not a shadow construction).

What *is* genuinely unifying is a weaker observation: **every failed approach has a specific prime range where Prolonger has free play**. Whether that's primes in [log n, n^{1/3}] (block-product), primes > y (R_y), or all primes ≤ εn (static carrier), Prolonger's winning response in each case exploits primes in a range the Shortener strategy hasn't dynamically closed. That's a real structural observation and it *does* motivate the F_α program. But it's a weaker and more accurate claim than "the unifying obstruction is omitted-vertex shadowing". The unification is more rhetorical than structural — specifically, it over-claims one particular construction as the underlying mechanism of phenomena that have distinct combinatorial sources.

## 6. The missing lemma — reduction holds; substance is entirely in the antecedent

Claim: *If Shortener can force effective resolution of all primes ≤ n^{1/3+ε} in O(n/log n) turns, then L(n) = O(n/log n).*

**Reduction direction (provable as stated):** Let T be the number of turns to achieve effective resolution, T = O(n/log n) by hypothesis. After turn T, any legal move x satisfies (by the definition of effective resolution) P⁻(x) > y = n^{1/3+ε}, so x ≤ n and all primes > y force Ω(x) ≤ 2 (since 3(1/3+ε) = 1+3ε > 1). The set of such x has size O_α(n/log n) by PNT for primes and standard semiprime counts. So post-resolution moves ≤ O(n/log n). Total L(n) ≤ T + O(n/log n) = O(n/log n). **This conditional is valid.**

**Hidden assumptions in "effective resolution":**

Pro's definition: "either the prime itself is chosen, or every future legal number divisible by it is already killed by the semiprime layer."

Unpacked: for each prime p ≤ y, either (a) p ∈ A, or (b) for every x ≤ n with p | x that would be incomparable to A, there exists d ∈ A with d | x.

Load-bearing assumptions:
1. **"Every future legal number"** is interpreted statically (over all potential x), not dynamically (over Prolonger's actual plays). The static reading is the strong one and is what makes the reduction go through. The weaker dynamic reading wouldn't give the static count bound.
2. **"The semiprime layer"** is doing implicit work: the killers d ∈ A must themselves form part of an antichain, which constrains which semiprime patterns Shortener can realize. In particular, if Shortener wants to cover all multiples of p via semiprimes {p·q : q ∈ S_p}, these pq's must be pairwise incomparable (automatic — they share p), but they also must be incomparable to whatever Prolonger has already placed. If Prolonger placed some m containing p as a factor, then pq | m for q | m/p, so Shortener can't play pq. This is a genuine constraint the reduction glosses.
3. The count of Shortener moves to cover all multiples of p is not O(1) per prime — to cover {pm : m ≤ n/p, m legal} via {pq ∈ A}, you need roughly π(n/p)/(average factor density) semiprimes. Summing over primes p ≤ n^{1/3+ε}, the total work could easily be Θ(n/log n) from Shortener alone, which already saturates the budget. Whether Prolonger's interleaved moves let Shortener achieve this under alternating-move constraint is wide open.

**Can I prove or refute the antecedent?** No — the antecedent is essentially equivalent to the original problem. Against a block-product Prolonger, small primes are *played by Prolonger* as factors of composite moves without being individually installed in A, and the composite moves are pairwise-coprime blocks that resist semiprime cover. Whether Shortener can neutralize all primes ≤ n^{1/3+ε} dynamically is a strong statement I don't see how to attack with the current tools. The universal block-product lower bound forces the small-prime reciprocal mass to grow like log log n regardless of Shortener's strategy — this doesn't immediately refute effective resolution, but it does mean Shortener can't have a uniformly-cheap per-prime strategy.

So: the reduction is a genuine reformulation, not a proof. It moves the hard part to a sharper location but doesn't shrink it.

## Overall assessment

What Pro has done well: F_α is a clean, correct static structure. The Q_α batching-resistance for composite moves is a real and new observation that constrains the geometry of any Prolonger counter-strategy to the small-prime layer. The α > 1/3 phase transition is a genuine and useful insight.

Where it overreaches:
- The numerical claim has a definitional slip (85063 is structural eligibility, not post-install admissibility). The asymptotic story survives; the precision doesn't.
- "Omitted-vertex shadowing as unifier" is rhetoric. The prior failures share a theme but not a mechanism.
- The conjecture L(n) = Θ(n/log n) is not supported by the computational evidence beyond "consistent with." L log n / n decreasing from 1.29 to 1.17 over four decades is also consistent with L = o(n/log n). Four data points from *heuristic* play (not minimax, which is intractable at these sizes) can't distinguish a slowly-converging constant from a slow decay to 0.
- The "missing lemma" as stated is a valid reduction. Its antecedent is essentially the original problem, so the reduction is a reformulation, not progress toward a proof.

Net: this is a genuine structural reframing that tightens where the difficulty sits. It's not a proof of L(n) = O(n/log n), and the claim that it nearly is should be discounted. The real value is in the F_α/Q_α construction and the observation that the hard part localizes to small-prime dynamic resolution. The surrounding claims (unification, near-proof status, numerical precision) are oversold.

# Direct \(L(n)=O(n/\log n)\) attempt after the April 18 documentation updates

## Bottom line

After re-reading the updated dossier, I do **not** think an honest direct proof of
\[
L(n)=O(n/\log n)
\]
survives the current state of the project.

The reason is not the speculative second-order material. The obstruction already appears at the **first upper-half fan level**:

- the upper-half semiprime fan now has multiple independent rigorous writeups,
- its core Maker-Breaker accounting looks sound on re-audit,
- and it gives
  \[
  L(n)\ge c\,\frac{n\log\log n}{\log n}.
  \]

If that theorem stands, then a direct \(O(n/\log n)\) upper bound is impossible.

So the direct attempt below is useful mainly as a **failure analysis**: it identifies the strongest current Shortener-side route, and shows exactly where the upper-half fan kills it.

## Assessment of the updated documentation

### 1. What now looks genuinely strong

These items now look materially stronger than they did before the last pass.

1. **First-order upper-half fan lower bound.**
   The chain
   - [researcher-13-pro-upper-half-fan-lower-bound.md](/Users/omisverycool/erdos-harness/erdos-872/researcher-13-pro-upper-half-fan-lower-bound.md:1),
   - [researcher-13-pro1-upper-half-audit.md](/Users/omisverycool/erdos-harness/erdos-872/researcher-13-pro1-upper-half-audit.md:1),
   - [researcher-13-pro2-odd-fan-strengthened.md](/Users/omisverycool/erdos-harness/erdos-872/researcher-13-pro2-odd-fan-strengthened.md:1),
   - [researcher-13-deepthink-upper-half-verification.md](/Users/omisverycool/erdos-harness/erdos-872/researcher-13-deepthink-upper-half-verification.md:1),
   - [researcher-13-deepthink-upper-half-verification-2.md](/Users/omisverycool/erdos-harness/erdos-872/researcher-13-deepthink-upper-half-verification-2.md:1)
   is enough that I no longer see a credible path to a direct \(O(n/\log n)\) theorem **unless** this lower bound is reopened.

2. **Shortener-side linear-constant compression improved a lot.**
   Round 14/15 work and the later Codex notes really did move the unconditional upper bound machinery:
   - refined Chebyshev / log-density,
   - prime-count-per-range refinement,
   - the static \(S_y\) certificate,
   - composite-help numerics (`smallest_legal_integer` outperforming SLOP).

3. **The old linear-via-fans route is now structurally disfavored.**
   The two most important new negatives are:
   - [researcher-17-codex-negative-on-separate-rank-fan-route.md](/Users/omisverycool/erdos-harness/erdos-872/researcher-17-codex-negative-on-separate-rank-fan-route.md:1),
   - [researcher-18-pro-multi-rank-coupling-refuted.md](/Users/omisverycool/erdos-harness/erdos-872/researcher-18-pro-multi-rank-coupling-refuted.md:1).

   Together they say: even if the fan hierarchy gives sublinear lower bounds rank by rank, the current architecture does **not** turn that into linear growth.

### 2. What is still provisional or internally tense

1. **Second-order lower bound.**
   The file
   [researcher-13-pro-fresh-second-order-lower-bound.md](/Users/omisverycool/erdos-harness/erdos-872/researcher-13-pro-fresh-second-order-lower-bound.md:1)
   is serious, but it is not yet supported by the same level of cross-family adversarial audit as the first-order upper-half fan.

2. **Empirics vs. T2.**
   The phase-4 documents
   - [phase4/findings.md](/Users/omisverycool/erdos-harness/erdos-872/phase4/findings.md:1),
   - [phase4/analysis.md](/Users/omisverycool/erdos-harness/erdos-872/phase4/analysis.md:1),
   - [phase4/multirank_ford_conjecture.md](/Users/omisverycool/erdos-harness/erdos-872/phase4/multirank_ford_conjecture.md:1)
   keep pointing numerically toward something very close to \(n/\log n\), while the T2 documents point toward \((\log\log n)^2\).

   That is a real tension, but it does **not** rescue \(O(n/\log n)\), because the first-order upper-half fan already rules that out if it is sound.

3. **`current_state.md` now mixes superseded and newer viewpoints.**
   Some older sections still treat the fixed-rank fan hierarchy as the live road to stronger lower bounds, while the Round 17/18 notes now explain why the current separate-rank / prefix-shielding architecture stalls at
   \[
   \frac{n}{(\log n)^{1-o(1)}}.
   \]

## The strongest direct \(O(n/\log n)\) attempt I can write down

The most plausible direct Shortener program, after the new docs, is:

1. Use a dynamic divisor sieve \(D\) built not just from small primes, but from a prime-power / composite-aware Shortener.
2. Force the game into a residual class \(R(D)\) whose upper-half members are only:
   - upper primes, and
   - a narrow family of semiprimes or rough composites.
3. Show
   \[
   |D|+|R(D)|=O(n/\log n).
   \]

This is the conceptual descendant of the \(S_y\) certificate, but made more dynamic and more composite-aware.

### Why this is the right direct shape

The updated upper-bound work strongly suggests the missing factor is **not** a better constant in a linear sieve count. The missing factor has to come from extra structure:

- antichain structure inside the residual,
- incomparability with previously played Prolonger moves,
- or a true game-dynamics potential that says Prolonger cannot realize a large residual antichain online.

The phase-4 notes isolate this very clearly: final residual counting by itself stays linear-scale, and the extra \(\log n\) has to come from dynamics.

### The direct target one would need

A direct \(O(n/\log n)\) theorem would need a statement of the following form.

> There exists a Shortener strategy producing, after \(O(n/\log n)\) moves, a divisor set \(D\) such that every surviving upper legal move lies in an \(O(n/\log n)\)-sized exceptional family.

This is stronger than the current static \(S_y\) certificate, but it is the natural direct endgame if one still wants the \(n/\log n\) rate.

## Where the direct attempt breaks

It breaks against the upper-half semiprime fan.

### The obstruction

Take upper-half targets
\[
u=2ab\in(n/2,n]
\]
with \(a\) a small prime and \(b\) a large prime in the appropriate interval.

The now-standard facts are:

1. Since \(u>n/2\), there is **no attack from above** by a proper multiple \(\le n\).
2. Once Prolonger has touched \(a\), the divisors \(a\) and \(2a\) are gone for Shortener.
3. After Prolonger captures a right prime \(b\), the only remaining individual kill on an unplayed edge in that \(b\)-fiber is \(ab\), which is one-for-one.
4. Max-degree-greedy on the \(b\)-side gives the accounting \(D\le C\), hence \(C+X\ge |E|/2\).

That is exactly the mechanism yielding
\[
L(n)\ge c\,\frac{n\log\log n}{\log n}.
\]

### Why this kills the direct \(O(n/\log n)\) route

Any global \(O(n/\log n)\) theorem has to explain why Shortener can extinguish this family faster than the fan proof says she can.

But the whole point of the upper-half fan is that the obvious mass-kill tools are gone:

- no multiplier attack from above,
- no star-throttle analogue,
- no cheap way to delete many live \(b\)-fibers after capture,
- and no way to prevent activation of a positive harmonic mass of small \(a\)'s with one-for-one play.

So the direct Shortener sieve program fails before it ever reaches its intended residual state: Prolonger can already force
\[
\Omega\!\left(\frac{n\log\log n}{\log n}\right)
\]
many moves inside the fan.

## What about the newer composite / prime-power hints?

They still matter, but not for \(O(n/\log n)\) if the first-order fan theorem is right.

The phase-4 empirical signal and the `smallest_legal_integer` improvement suggest that:

- the current linear upper bounds are very loose,
- composite Shortener moves are doing something real,
- and a better density model than the current odd-part / residual count may exist.

What that can still plausibly prove is a **matching or near-matching upper bound above \(n/\log n\)**, for example at
\[
O\!\left(\frac{n\log\log n}{\log n}\right)
\]
or, if T2 is real, perhaps
\[
O\!\left(\frac{n(\log\log n)^2}{\log n}\right).
\]

It does not currently look like a path to \(O(n/\log n)\).

## My actual conclusion

### Direct verdict

I do **not** think a direct \(L(n)=O(n/\log n)\) solution survives the updated documentation.

The first-order upper-half fan is already too strong. A direct \(O(n/\log n)\) attempt now has to do one of two things:

1. **Find a real gap** in the upper-half semiprime fan theorem, or
2. **Show that the actual game dynamics invalidate the Maker-Breaker abstraction used there.**

At the moment I do not see either gap.

### Best current synthesis

1. Treat the first-order upper-half fan lower bound as the load-bearing obstruction.
2. Treat the second-order triple-fan as promising but still provisional.
3. Treat the direct \(O(n/\log n)\) program as presently blocked.
4. Shift the serious Shortener-side target to a matching upper bound at the strongest lower-bound scale one is willing to bank.

### If we want the next mathematically honest push

The cleanest next two options are:

1. **Audit T2 hard.**
   Decide whether the \((\log\log n)^2\) lower bound really survives adversarial scrutiny.

2. **Abandon \(O(n/\log n)\) as the target and aim for the matching upper bound to T1.**
   That means an explicit Shortener theorem at
   \[
   O\!\left(\frac{n\log\log n}{\log n}\right).
   \]

Given the updated dossier, that now looks like the right frontier.

---
id: R09-verify-gemini-refutation
type: verification
date: 2026-04-17
intent: >
  Independent Gemini DeepThink refutation of the Static Carrier Capacity Bound,
  submitted concurrently with the Pro researcher prompt for R09.
predecessors: []
action:
  kind: refutes
  target: R05-carrier-recycling
claim: >
  Carrier Capacity Bound is false. Argument 1 (interval counterexample):
  top eps*n consecutive integers form an antichain hitting every prime p <= eps*n,
  so sum 1/p >= log log(eps*n) -> infinity. Arguments 2 and 3 have flaws but
  Argument 1 is sufficient. Confirms R09-carrier-capacity-refutation independently.
failure_mechanism: >
  Consecutive integers in U = (n/2, n] hit every prime p <= |P|: for each
  prime p, some element of any p consecutive integers is divisible by p.
  Therefore B(P) contains all primes up to |P|, and sum 1/p diverges.
---

# Refutation of the Carrier Capacity Bound — Gemini DeepThink (pre-Pro, same direction)

**Source:** Gemini DeepThink (Pro-tier model, API-level), via user's browser tab. A prior API call timed out; this one succeeded while the matching Pro researcher prompt was still running.
**Prompt sent:** `prompts/researcher-09-carrier-capacity.md` (the Pro researcher prompt, sent to Gemini as-is).
**Extracted:** 2026-04-18.
**Verdict:** **The Carrier Capacity Bound Lemma is false.** Independently refuted by Gemini's interval counterexample. Independently confirmed by Pro shortly after (see `researcher-09-carrier-capacity-refutation.md`). Three separate proofs offered; Argument 1 (interval counterexample) is the decisive one. Arguments 2 and 3 have flaws (see audit notes) but don't affect the main refutation.

---

The Carrier Capacity Bound Lemma is false.

Three independent proofs:

**Explicit counterexample:** Take $P$ = the top $\varepsilon n$ consecutive integers near $n$. They form a valid antichain (ratio $< 2$). But consecutive integers hit every prime $\le \varepsilon n$, so $\sum 1/p \ge \log\log(\varepsilon n) \to \infty$. The lemma's "bounded by constant $C(\varepsilon)$" claim dies immediately.

**Universal divergence (no escape):** Via Hardy-Ramanujan, any set $P$ of size $\varepsilon n$ must have $\sum_{x \in P} \omega(x) \ge (\varepsilon/4) \cdot n \cdot \log \log n$. Double-counting against multiples forces $\sum 1/p \ge (\varepsilon/4) \cdot \log \log n \to \infty$. Prolonger can't avoid consuming diverging prime mass no matter what they play.

**The algebraic fallacy identified:** The "Potential Direction" correctly computes total prime capacity as $O(\varepsilon n \cdot \log\log n)$, then incorrectly concludes the reciprocal sum is $O(1)$. But plugging into the double-counting identity: $\varepsilon n \cdot \sum 1/p \approx \varepsilon n \cdot \log\log n$, which gives $\sum 1/p \approx \log\log n$. The capacity bound *requires* divergence, not prevents it.

**Bottom line for the game:** Since Prolonger always consumes diverging prime mass, Shortener's post-prefix sieve product stays bounded away from 0, leaving $\Omega(n)$ surviving moves. The Mertens-sieve route to $O(n/\log n)$ upper bound is dead via this approach.

---

## Audit note on Gemini's arguments

**Argument 1 (interval counterexample) is decisive.** Top $\varepsilon n$ consecutive integers near $n$ with $\varepsilon < 1/2$ have ratio $< 2$ so form an antichain; the interval length $\ge p$ for all primes $p \le \varepsilon n$, so every such prime divides at least one element. Hence $\sum_{p \in B(P)} 1/p \ge \sum_{p \le \varepsilon n} 1/p = \log\log(\varepsilon n) + O(1) \to \infty$. Clean and rigorous.

**Argument 2 has a flaw.** The claim "any set $P$ of size $\varepsilon n$ must have $\sum_{x \in P} \omega(x) \ge (\varepsilon/4) n \log\log n$" is false — Prolonger could pick $\varepsilon n$ primes, each with $\omega = 1$, giving $\sum \omega = \varepsilon n$, not $(\varepsilon/4) n \log\log n$. Hardy-Ramanujan is about the *average* over typical integers, not adversarial subsets. Doesn't matter — Argument 1 is enough.

**Argument 3 is a diagnostic, not a proof.** Identifies the algebraic misstep in Audit #2's proof-sketch (conflating "total capacity" with "reciprocal sum"). Correct diagnosis.

**Cross-validation.** Pro independently produced a cleaner version of Argument 1 shortly after — the interval-in-$U$ construction, which also makes the counterexample a legal alternating game play, not just an abstract antichain. See `researcher-09-carrier-capacity-refutation.md`.

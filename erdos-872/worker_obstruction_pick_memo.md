# Obstruction Pick Memo

## Bottom line

The cleanest next obstruction to elevate is the **universal block-product carrier-mass counter**.

That is the strongest choice if the goal is a paper-facing theorem rather than an internal diagnosis. It is already treated in the repo as a banked structural negative, it has a single crisp statement, it directly explains the limit of the odd-prime-prefix / bounded-carrier-mass Shortener program, and it is also the candidate the backlog already identifies as the next obstruction theorem to formalize after the core upper/lower-bound work.

## Candidate comparison

### 1. Universal block-product carrier-mass counter

**Cleanest paper-facing statement**

For every Shortener strategy `σ`, Prolonger has a response such that
`sum_{p in B(P)} 1/p >= (1/2) log log n + O(1)`.

This is the cleanest of the three by a wide margin. It is one theorem, with one obstruction mechanism, and the proof architecture is compact:

- partition primes `<= n^(1/3)` into disjoint blocks;
- form block-products in `(sqrt(n), n^(5/6)]`;
- prove any Shortener move can invalidate at most one block;
- greedy-by-value gives Prolonger at least half the total reciprocal mass.

**Why it strengthens the paper materially**

It gives the paper a rigorous “why the obvious Shortener road fails” theorem, not just a narrative warning. In paper terms, it does three jobs at once:

- explains why the odd-prime-prefix line tops out at `5/16`;
- kills both static and dynamic bounded-carrier-mass routes to `O(n/log n)`;
- pairs naturally with Theorem 5, because Theorem 5 says the block-product adversary is not the true hard case, while this theorem says it is still the right universal obstruction to carrier-mass arguments.

So it strengthens the paper by clarifying the logic of the restricted-class section: first show block-product is a real universal obstruction to one method, then show Theorem 5 defeats that adversary class anyway. That is a strong story.

**How hard it looks to normalize or formalize**

This looks like the easiest of the three.

- `publication_source_of_truth.md` already marks it `Banked` and “high” publishability.
- `codex_backlog.md` makes it Item 7 and explicitly calls it the “flagship negative theorem” to formalize after the core pieces.
- The proof is mostly combinatorial plus standard prime-harmonic asymptotics; it does not depend on the packet machinery or on unstable dynamic notions like strong freshness.

Relative difficulty: **low**.

**Which one should come next after T2 / Theorem 5**

This should come next.

If the paper sequence is:

1. main reductions / bounds,
2. T2,
3. restricted-class wins such as Theorem 5 (and Theorem 6 if included),

then the next obstruction theorem should be the universal block-product counter. It is the cleanest bridge from the restricted-class section into the “why the remaining gap is real” section.

**Best current source version**

Best proof source:

- `erdos-872/verify-postresp-10-audit-universal-block-product.md`

Best integrated repo summary:

- `erdos-872/current_state.md` under “Universal Prolonger counter on carrier mass (Round 9b)”
- `erdos-872/publication_source_of_truth.md` §3.1
- `erdos-872/codex_backlog.md` Item 7

### 2. R44 residual-floor diagnosis / local-star obstruction

**Cleanest paper-facing statement**

There are really two paper-worthy statements here, not one:

- strong freshness + locality do not imply certificate-packing / charged-shadow disjointness (local-star obstruction);
- the R35 residual floor alone blocks the conjectured sharp rate `n (log log n)^2 / log n`.

Both are important, but as a single “theorem to elevate,” this package is less clean than the block-product counter. It reads more like a diagnosis section than a standalone headline theorem.

**Why it strengthens the paper materially**

Materially, R44 is excellent. It is probably the best diagnosis in the repo of why the later packet program almost closes and then fails. It tells the reader exactly where the proof barrier lives:

- packing is not automatic;
- the defect-2 local-star configuration is a real obstruction;
- even perfect control of `mu(F_useful)` would not beat the R35 residual floor.

That is very valuable mathematically. But it is more valuable as a later “barrier / diagnosis” section than as the next theorem to elevate.

**How hard it looks to normalize or formalize**

Hardest of the three.

Reasons:

- it is not a single stable statement yet; it is a bundle of a conditional theorem, a counterexample, and a proof-ceiling diagnosis;
- the best underlying source is still a concession / audit chain, not a compact theorem note;
- formalization would likely be artificial, because part of the value is “this proof architecture cannot get the conjectured rate,” not just one clean combinatorial inequality.

Relative difficulty: **high**.

**Which one should come next after T2 / Theorem 5**

This should come **after** the universal block-product counter, as the next major barrier theorem/diagnosis once the paper has already established the main positive results and the first obstruction theorem.

**Best current source version**

Best integrated synthesis:

- `erdos-872/current_state.md` Round 44 section

Best underlying source for the local-star failure / conditional SFLU-E cleanup:

- `erdos-872/researcher-44-pro-1-followup-2-formal-concession.md`

Best adversarial audit:

- `erdos-872/verify-R44-pro-1-sflu-e-audit-refutes.md`

### 3. R46 smallest-legal-prime lemma + ST-capture refutation

**Cleanest paper-facing statement**

The ST-capture refutation itself is sharp and attractive:

- burn-in + activator + forced first touch through a single leaf;
- capture ratio tends to `0`;
- therefore the proposed ST-capture / time-resolved Carleson inequality is false as stated.

That part is paper-worthy.

The problem is the package as named in the candidate list. The “smallest-legal-prime lemma + ST-capture refutation” is no longer fully stable as one combined theorem package.

**Why it strengthens the paper materially**

It would strengthen the paper by killing a specific late-stage Carleson-style salvage route. That matters. But the gain is narrower than the block-product counter:

- it obstructs one sophisticated late framework;
- it does not organize the earlier Shortener-side storyline as well as the block-product theorem does.

So it is good, but less globally useful to the paper’s architecture.

**How hard it looks to normalize or formalize**

Medium to high, mainly because of statement instability.

The repo inventory (`current_state.md`, `publication_source_of_truth.md`) still presents the smallest-legal-prime lemma as established, but later material already weakens it:

- `prompts/researcher-R49-fresh-pro-assess-sharp-rate.md` explicitly records the lemma only as **conditional**;
- `researcher-49-pro-2-sq-r-local-obstruction.md` gives a legal state where a composite beats the smallest legal prime in limiting harmonic degree.

So before elevating R46, the paper would need to split the package:

- keep the ST-capture refutation if it can be restated with only the hypotheses actually used in the burn-in regime;
- downgrade or condition the smallest-legal-prime lemma.

Relative difficulty: **medium-high**.

**Which one should come next after T2 / Theorem 5**

Not next. It should come only after the unconditional/conditional status of the smallest-legal-prime rule is cleaned up.

**Best current source version**

For the original R46 burn-in refutation:

- `erdos-872/researcher-46-pro-1-angle2-st-capture-refuted-burn-in.md`
- `erdos-872/current_state.md` Round 46 section

For the corrected status of the smallest-legal-prime lemma:

- `erdos-872/prompts/researcher-R49-fresh-pro-assess-sharp-rate.md`
- `erdos-872/researcher-49-pro-2-sq-r-local-obstruction.md`

## Recommendation

If the paper wants the **next obstruction theorem** rather than the **next obstruction discussion section**, the choice should be the **universal block-product carrier-mass counter**.

Why this is the best pick:

- it has the cleanest theorem statement;
- it materially sharpens the paper’s explanation of why the first Shortener paradigm fails;
- it is the easiest of the three to normalize and formalize;
- it already matches the repo’s own backlog ordering;
- unlike R46, it does not currently sit on top of a later correction to one of its headline components;
- unlike R44, it is already a single theorem rather than a bundled diagnosis.

**Next obstruction should be universal block-product carrier-mass counter.**

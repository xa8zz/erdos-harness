---
id: R21-codex-T2-maker-first-repair
type: research
date: 2026-04-19
intent: >
  Extract the standalone Maker-first lemma statement that would restore T2
  to rigorous status; check whether the online-order gap is repairable.
predecessors: [R21-codex-T2-audit-demotion]
action:
  kind: extends
  target: R21-codex-T2-audit-demotion
claim: >
  Online-order gap probably repairable. Lemma 1 (weighted pair-capture) can
  be proven Maker-first as stated. Lemma 2 (two-layer fiber capture) requires
  replacement by a scored 3-uniform hypergraph capture game on slots (b,ab,cb).
  Both abstract lemmas pass exhaustive small-graph sanity checks.
---

# Round 21 Codex — T2 Maker-first lemma repair attempt

## Context

After the T2 audit demoted the second-order lower bound to "plausible pending Maker-first online lemma," Codex was tasked with extracting the standalone lemma statement that would restore T2 to rigorous. Codex's finding: the online-order gap is probably repairable. Lemma 1 (weighted pair-capture) can be proven Maker-first as stated. Lemma 2 (two-layer fiber capture) should be replaced by a scored 3-uniform hypergraph capture game on slots $(b, ab, cb)$ where exact-target plays count into the final score. Both abstract lemmas pass exhaustive sanity checks on small graphs/hypergraphs.

Detailed writeup saved to [phase4/t2_maker_first_lemmas.md](phase4/t2_maker_first_lemmas.md). Codex also added a durable note to AGENTS.md.

## Codex's response

I did, and I think the online-order gap is probably repairable.

The main outcome is in [t2_maker_first_lemmas.md](/Users/omisverycool/erdos-harness/erdos-872/phase4/t2_maker_first_lemmas.md:1). I would summarize it like this:

**What I think is fixed**

For **Lemma 1**, the Maker-first repair is clean. If we keep the old edge potentials
\[
\phi(e)\in \left\{\frac18 w(e),\frac14 w(e),\frac12 w(e),w(e)\right\},
\]
and let \(\Delta(f)\) be the total potential gain from Maker claiming an edge \(f\), then for any uncaptured vertex \(x\),
\[
P(x):=\sum_{e\ni x}\phi(e)
\]
satisfies: every unclaimed edge \(f\ni x\) has \(\Delta(f)\ge P(x)\). Also every unclaimed edge \(g\) has \(\Delta(g)\ge \phi(g)\). So if Maker chooses a max-gain edge, that one move already dominates any single Breaker vertex deletion or edge deletion. That gives a genuine Maker-first proof of the `1/8` capture bound.

For **Lemma 2**, the right abstraction is not the old informal “same layered idea” sentence. It is a **scored 3-uniform hypergraph game** on slots \((b,ab,cb)\), where an exact target play `acb` counts into the final score. Then with
\[
Q=S+\sum_{e\text{ live}}\phi(e),\qquad
\phi(e)\in\left\{\frac18,\frac14,\frac12,1\right\}
\]
according to how many of the three slots are already captured, a max-gain Maker move again dominates any single Breaker slot deletion, while a Breaker exact-target play changes \(Q\) by \(1-\phi(e)\ge 0\). So \(Q\) is Maker-first nondecreasing, and the final scored mass is at least `1/8` of the initial target mass.

I also ran exact sanity checks: all graph states up to 5 vertices passed for Lemma 1, and all 3-uniform hypergraphs on 4 vertices passed for the Lemma 2 local domination claim.

**What is still not fully settled**

This does **not** yet resurrect T2 completely. The remaining checks are:

- the exact embedding of the surviving target family into the 3-uniform hypergraph model,
- that every actual Shortener move really becomes “delete one slot `(b,ab,cb)` or score one exact target,”
- that the activation-stage bookkeeping and fresh-`b` supply estimates still go through unchanged.

So my current stance is: the specific **online-order objection** to T2 looks substantially repaired, but I would still stop short of calling T2 rigorous until that divisibility-to-hypergraph translation is written carefully.

I saved the attempt in [t2_maker_first_lemmas.md](/Users/omisverycool/erdos-harness/erdos-872/phase4/t2_maker_first_lemmas.md:1) and added a durable repo note in [AGENTS.md](/Users/omisverycool/erdos-harness/AGENTS.md:1).

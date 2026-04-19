# Round 21 Codex — T2 divisibility-to-hypergraph embedding verification

## Context

Follow-up to the Maker-first repair. Codex verified items (1) and (2) of the T2-rigorous pending list — the divisibility-target family embeds into the 3-uniform hypergraph formalism, and every Shortener move in the divisibility game maps to either a slot deletion or a scored-edge play in the hypergraph model. Crucially: the residual divisibility game is strictly *Maker-friendlier* than the scored hypergraph game, so the abstract hypergraph lemma is a valid lower-bound model. Detailed verification written into [phase4/t2_maker_first_lemmas.md](phase4/t2_maker_first_lemmas.md).

Only item (3) of the rigorous-promotion checklist remains: activation-stage bookkeeping and fresh-prime supply estimates around the secured-pair stage.

## Codex's response

Yes. I checked it, and I think the **divisibility-to-hypergraph translation is sound**.

I wrote the verification into [t2_maker_first_lemmas.md](/Users/omisverycool/erdos-harness/erdos-872/phase4/t2_maker_first_lemmas.md:1). The key points are:

- For a live target `t = acb` in the residual game, with `t > n/2` and `a,c,ac` already unavailable, the only harmful future moves are exactly `b`, `ab`, `cb`, or `t` itself.
- Playing `b`, `ab`, or `cb` kills exactly the hyperedges incident to that slot, so those are genuine vertex deletions in the 3-uniform model.
- Playing the exact target `t` should be modeled as a scored edge, not a new attack. Since all targets lie in `(n/2,n]`, distinct targets are incomparable, so an exact-target play does not kill other targets. Its extra divisibility side-effects only remove future Shortener options, which helps Prolonger.
- Conversely, if an edge is still live in the hypergraph model, the corresponding target is still a legal actual move in the divisibility game.

So the residual divisibility game is actually **Maker-friendlier** than the scored hypergraph game, which means the hypergraph lemma is a valid lower-bound model for Lemma 2.

At this point, the main thing still worth auditing is not the slot translation anymore. It’s the **activation-stage bookkeeping / fresh-prime supply** around the secured-pair stage. I also persisted that status in [AGENTS.md](/Users/omisverycool/erdos-harness/AGENTS.md:1).

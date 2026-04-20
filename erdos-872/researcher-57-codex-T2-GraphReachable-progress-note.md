Yes. I continued, and the Lean project is green again.

I added [GraphReachable.lean](/Users/omisverycool/erdos-harness/erdos-872/lean/erdos_872_core/RequestProject/T2Finite/GraphReachable.lean:10), which now gives the graph-side state invariant we were missing:
- `claimedVerts` at [line 10](/Users/omisverycool/erdos-harness/erdos-872/lean/erdos_872_core/RequestProject/T2Finite/GraphReachable.lean:10)
- `GraphReachable` at [line 33](/Users/omisverycool/erdos-harness/erdos-872/lean/erdos_872_core/RequestProject/T2Finite/GraphReachable.lean:33)
- `captured_eq_claimedVerts_of_graphReachable` at [line 48](/Users/omisverycool/erdos-harness/erdos-872/lean/erdos_872_core/RequestProject/T2Finite/GraphReachable.lean:48)
- `not_mem_claimed_of_mem_verts_of_not_captured` at [line 61](/Users/omisverycool/erdos-harness/erdos-872/lean/erdos_872_core/RequestProject/T2Finite/GraphReachable.lean:61)

I also wired it into [Main.lean](/Users/omisverycool/erdos-harness/erdos-872/lean/erdos_872_core/RequestProject/Main.lean:1), and `lake build` succeeds.

The main thing I learned is that the wrapper theorem really does need this reachability layer. The naive “max-gain” proof sketch is false on arbitrary record states, but the bad examples I found were unreachable. I also checked the reachable story computationally: no reachable graph counterexample up to 5 vertices, and no random weighted reachable counterexample in 50k samples. On the hypergraph side, I tried the analogous invariant and had to back it out, because `scored` includes Breaker-scored edges while `captured` only tracks Maker captures, so the graph-style invariant is wrong there.

So the next best step is now pretty clear:
1. prove exact graph Breaker-loss formulas from `GraphReachable`,
2. package the graph max-gain wrapper on reachable states,
3. model the hyper state with a Maker-capture layer separate from total scored edges,
4. only then return to the activation/token bookkeeping theorem.

I didn’t commit yet, since this is still a shared dirty checkout on `main`, but the current checkpoint is stable.

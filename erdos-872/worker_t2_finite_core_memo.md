# T2 Finite Core Formalization Scout

Scope: this memo only scouts the finite formal core behind T2, not the asymptotic theorem. The key inputs I used are [phase4/t2_maker_first_lemmas.md](/Users/omisverycool/erdos-harness/erdos-872/phase4/t2_maker_first_lemmas.md:7), [researcher-21-codex-T2-maker-first-repair.md](/Users/omisverycool/erdos-harness/erdos-872/researcher-21-codex-T2-maker-first-repair.md:17), [researcher-22-codex-T2-activation-audit.md](/Users/omisverycool/erdos-harness/erdos-872/researcher-22-codex-T2-activation-audit.md:27), [researcher-21-codex-T2-embedding-verification.md](/Users/omisverycool/erdos-harness/erdos-872/researcher-21-codex-T2-embedding-verification.md:15), and the T2 status block in [current_state.md](/Users/omisverycool/erdos-harness/erdos-872/current_state.md:64).

## 1. Cleanest finite theorem statement

The cleanest statement is a single scaled-potential theorem for a finite weighted incidence game of rank at most 3, with the graph and hypergraph lemmas as specializations.

Suggested theorem statement:

Let `V` and `E` be finite types, let each `e : E` carry:

- a finite incidence set `verts(e) ⊆ V` with `1 <= card(verts(e)) <= 3`,
- a weight `w(e) : Nat`.

Let a state consist of:

- `captured : Finset V`,
- `deletedVerts : Finset V`,
- `claimed : Finset E`,
- `deletedEdges : Finset E`,
- `score : Nat`.

An edge is `live` if it is not in `claimed ∪ deletedEdges` and is disjoint from `deletedVerts`.

Maker move:

- choose a live edge `f`,
- add `w(f)` to `score`,
- mark `f` claimed,
- capture every vertex in `verts(f)`.

Breaker move:

- either delete one uncaptured vertex,
- or choose one live edge and either delete it or score it.

Define the scaled edge potential

`pot8_s(e) := 2^(capturedCount_s(e)) * w(e)` for live edges,

where `capturedCount_s(e) = card (verts(e) ∩ captured_s)`, and define

`Q8(s) := 8 * score_s + sum_{e live in s} pot8_s(e)`.

Then there exists a Maker strategy, namely "choose a live edge maximizing `DeltaQ8`", such that after each full Maker+Breaker round, `Q8` does not decrease. Consequently, if play ends with no live edges, then

`8 * score_final >= sum_e w(e)`.

Why I think this is the right finite core:

- It packages the graph Maker-first repair from [phase4/t2_maker_first_lemmas.md](/Users/omisverycool/erdos-harness/erdos-872/phase4/t2_maker_first_lemmas.md:7) and the scored 3-uniform repair from [phase4/t2_maker_first_lemmas.md](/Users/omisverycool/erdos-harness/erdos-872/phase4/t2_maker_first_lemmas.md:85) into one finite invariant.
- Using `Q8` avoids rationals entirely. This is the highest-value Lean simplification: the original `1/8,1/4,1/2,1` coefficients become integer weights `1,2,4,8`.
- The graph activation game in [researcher-22-codex-T2-activation-audit.md](/Users/omisverycool/erdos-harness/erdos-872/researcher-22-codex-T2-activation-audit.md:51) is just the rank-2 specialization with Breaker edge deletion. The residual target game is the rank-3 specialization with Breaker scored-edge moves [phase4/t2_maker_first_lemmas.md](/Users/omisverycool/erdos-harness/erdos-872/phase4/t2_maker_first_lemmas.md:95).

Practical recommendation:

- State the theorem in this unified scaled form in the memo/spec.
- Formalize the rank-2 graph case first in Lean, then the scored rank-3 case as a second module. That is lower-risk than proving the fully generic theorem first.

## 2. Exact core lemmas needed

I would break the finite core into the following lemmas.

### Abstract potential lemmas

1. `captured_count_le_three`
For every live edge, `capturedCount e <= 3`.
Reason: needed only to keep `pot8` in the intended coefficient set `{1,2,4,8}`.

2. `delta_on_incident_edge_ge_self_potential`
If Maker plays a live edge `f`, then the gain on `f` itself is at least its current live potential.
This is the abstract version of `Delta(g) >= phi(g)` from [phase4/t2_maker_first_lemmas.md](/Users/omisverycool/erdos-harness/erdos-872/phase4/t2_maker_first_lemmas.md:43).

3. `delta_on_edge_containing_v_ge_incident_potential`
If `v` is uncaptured and `f` is a live edge containing `v`, then

`DeltaQ8(f) >= incidentPot8(v) := sum_{e live, v in verts(e)} pot8(e)`.

This is the load-bearing Maker-first domination lemma in both the graph proof [phase4/t2_maker_first_lemmas.md](/Users/omisverycool/erdos-harness/erdos-872/phase4/t2_maker_first_lemmas.md:28) and the hypergraph proof [phase4/t2_maker_first_lemmas.md](/Users/omisverycool/erdos-harness/erdos-872/phase4/t2_maker_first_lemmas.md:124).

4. `delete_vertex_changes_Q8_by_incident_potential`
Deleting an uncaptured vertex `v` decreases `Q8` by exactly `incidentPot8(v)`.

5. `delete_edge_changes_Q8_by_edge_potential`
Deleting a live edge `g` decreases `Q8` by exactly `pot8(g)`.

6. `score_edge_is_nonnegative_for_Q8`
Scoring a live edge `g` changes `Q8` by `8 * w(g) - pot8(g) >= 0`.
This is the scored-edge half of the hypergraph lemma from [phase4/t2_maker_first_lemmas.md](/Users/omisverycool/erdos-harness/erdos-872/phase4/t2_maker_first_lemmas.md:141).

7. `exists_argmax_live_edge`
On any nonempty finite live-edge set, a `DeltaQ8`-maximizer exists.
This lets Lean work with a pure existence theorem instead of encoding a deterministic tie-break.

8. `maker_round_monotone`
If Maker picks an argmax live edge, then every legal Breaker reply leaves `Q8` nondecreasing.

9. `initial_Q8`
At the initial state, `Q8 = sum_e w(e)`.

10. `terminal_Q8`
At a terminal state with no live edges, `Q8 = 8 * score`.

11. `final_score_lower_bound`
By induction over rounds, `8 * score_final >= sum_e w(e)`.

### Residual divisibility embedding lemmas

These are still finite, but they are arithmetic wrapper lemmas rather than abstract game theory.

12. `slots_are_distinct`
For `t = acb` with `b > Y >= a,c`, the three labels `b`, `ab`, `cb` are distinct, and the slot set determines `(a,c,b)` uniquely. This is exactly [phase4/t2_maker_first_lemmas.md](/Users/omisverycool/erdos-harness/erdos-872/phase4/t2_maker_first_lemmas.md:179).

13. `harmful_moves_exactly_slots_or_target`
For a live target `t = acb > n/2` with `a,c,ac` already unavailable, the only harmful moves are `{b, ab, cb, t}` [phase4/t2_maker_first_lemmas.md](/Users/omisverycool/erdos-harness/erdos-872/phase4/t2_maker_first_lemmas.md:191).

14. `slot_move_eq_incident_edge_deletion`
Playing `b`, `ab`, or `cb` kills exactly the incident slot-hyperedges [phase4/t2_maker_first_lemmas.md](/Users/omisverycool/erdos-harness/erdos-872/phase4/t2_maker_first_lemmas.md:209).

15. `target_play_eq_scored_edge`
If all targets lie in `(n/2,n]`, then distinct targets are pairwise incomparable, so exact-target play scores one hyperedge and kills no others [phase4/t2_maker_first_lemmas.md](/Users/omisverycool/erdos-harness/erdos-872/phase4/t2_maker_first_lemmas.md:219).

16. `live_hyperedge_gives_legal_actual_move`
If the slot-hyperedge is live, then the target `t` is still legal in the divisibility game [phase4/t2_maker_first_lemmas.md](/Users/omisverycool/erdos-harness/erdos-872/phase4/t2_maker_first_lemmas.md:227).

That lemma stack is enough to formalize the finite residual-core claim:

- abstract scored rank-3 theorem,
- concrete embedding,
- Maker-friendlier comparison,
- therefore final score in the residual target family is at least one eighth of its initial weight.

## 3. Pure finite combinatorics vs wrapper

This split is the main thing to preserve.

### Pure finite combinatorics

- The Maker-first graph lemma itself [phase4/t2_maker_first_lemmas.md](/Users/omisverycool/erdos-harness/erdos-872/phase4/t2_maker_first_lemmas.md:7).
- The Maker-first scored 3-uniform hypergraph lemma [phase4/t2_maker_first_lemmas.md](/Users/omisverycool/erdos-harness/erdos-872/phase4/t2_maker_first_lemmas.md:85).
- The tokenized activation potential identity
  `Q_t = S_t + sum phi_t(e)` and its finite monotonicity argument under graph deletions [researcher-22-codex-T2-activation-audit.md](/Users/omisverycool/erdos-harness/erdos-872/researcher-22-codex-T2-activation-audit.md:51).

These do not need prime counting, interval estimates, or asymptotics.

### Finite arithmetic wrapper

- The slot encoding `t = acb -> {b,ab,cb}` and its injectivity [phase4/t2_maker_first_lemmas.md](/Users/omisverycool/erdos-harness/erdos-872/phase4/t2_maker_first_lemmas.md:171).
- The exact harmful-move classification `{b,ab,cb,t}` [phase4/t2_maker_first_lemmas.md](/Users/omisverycool/erdos-harness/erdos-872/phase4/t2_maker_first_lemmas.md:191).
- The fact that targets in `(n/2,n]` are pairwise incomparable, so target plays are scored edges, not extra attacks [phase4/t2_maker_first_lemmas.md](/Users/omisverycool/erdos-harness/erdos-872/phase4/t2_maker_first_lemmas.md:219).

This is still finite, but it is no longer purely abstract combinatorics.

### Asymptotic number-theory wrapper

- The lower bound on the initial target mass `W_0` [researcher-22-codex-T2-activation-audit.md](/Users/omisverycool/erdos-harness/erdos-872/researcher-22-codex-T2-activation-audit.md:15).
- The budget bound `E << Y^4 / log^4 Y = o(n (log log n)^2 / log n)` [researcher-22-codex-T2-activation-audit.md](/Users/omisverycool/erdos-harness/erdos-872/researcher-22-codex-T2-activation-audit.md:152).
- The translation from residual secured-pair weight to the stated T2 asymptotic lower bound [researcher-22-codex-T2-activation-audit.md](/Users/omisverycool/erdos-harness/erdos-872/researcher-22-codex-T2-activation-audit.md:219).

This is the part to postpone. The harness itself now records the same split: abstract graph/hypergraph lemmas, then embedding, then activation audit [current_state.md](/Users/omisverycool/erdos-harness/erdos-872/current_state.md:64).

## 4. Best first Lean file and definitions

The existing Aristotle outputs in this repo already separate definitions from lemma files, for example [ShieldDefs.lean](/Users/omisverycool/erdos-harness/erdos-872/lean/theorem_A/theorem_A_shield_lower_bound_aristotle/RequestProject/ShieldDefs.lean:1), [ShieldBasicLemmas.lean](/Users/omisverycool/erdos-harness/erdos-872/lean/theorem_A/theorem_A_shield_lower_bound_aristotle/RequestProject/ShieldBasicLemmas.lean:1), and [ShieldReduction.lean](/Users/omisverycool/erdos-harness/erdos-872/lean/shield_reduction/shield_reduction_aristotle/RequestProject/ShieldReduction.lean:14). I would follow that shape.

Recommended first project layout:

- `erdos-872/lean/erdos_872_core/RequestProject/T2Finite/Defs.lean`
- `erdos-872/lean/erdos_872_core/RequestProject/T2Finite/GraphGame.lean`
- `erdos-872/lean/erdos_872_core/RequestProject/T2Finite/Rank3ScoreGame.lean`
- `erdos-872/lean/erdos_872_core/RequestProject/T2Finite/DivisibilityEmbedding.lean`
- `erdos-872/lean/erdos_872_core/RequestProject/Main.lean`

Best first file to create:

- `T2Finite/Defs.lean`

What should go in it:

```lean
structure CaptureSystem (V E : Type) [DecidableEq V] [Fintype V] [DecidableEq E] [Fintype E] where
  verts : E -> Finset V
  verts_card_le_three : forall e, (verts e).card <= 3
  weight : E -> Nat

structure State (V E : Type) [DecidableEq V] [DecidableEq E] where
  captured : Finset V
  deletedVerts : Finset V
  claimed : Finset E
  deletedEdges : Finset E
  score : Nat
```

Then define:

- `liveEdge : CaptureSystem V E -> State V E -> E -> Prop`
- `capturedCount : CaptureSystem V E -> State V E -> E -> Nat`
- `pot8 : CaptureSystem V E -> State V E -> E -> Nat`
- `incidentPot8 : CaptureSystem V E -> State V E -> V -> Nat`
- `Q8 : CaptureSystem V E -> State V E -> Nat`

Why this is the right first file:

- It bakes in the `8`-scaled invariant from the start, so all later proofs stay in `Nat`.
- It keeps graph and hypergraph proofs on the same definitions, even if the actual theorems are first proved in separate files.
- It avoids committing early to `SimpleGraph`, which is not a good fit for the rank-3 slot hypergraph.

Best first theorem file after that:

- `T2Finite/GraphGame.lean`

Reason: it is the smallest real Maker-first test case and already covers the activation-game core from [researcher-22-codex-T2-activation-audit.md](/Users/omisverycool/erdos-harness/erdos-872/researcher-22-codex-T2-activation-audit.md:96). Once that theorem is solid, `Rank3ScoreGame.lean` should be a controlled generalization rather than a fresh proof from scratch.

## 5. Likely structural blockers

These are the blockers I would expect before any asymptotic issue appears.

1. Fractions will be a trap if copied literally.
The source notes write potentials as `1/8, 1/4, 1/2, 1` [phase4/t2_maker_first_lemmas.md](/Users/omisverycool/erdos-harness/erdos-872/phase4/t2_maker_first_lemmas.md:15). In Lean, the right move is to scale by `8` immediately and stay in `Nat`.

2. Over-abstracting too early is likely to slow the proof.
There probably is a one-shot generic theorem for rank-`<= 3` systems, but the fastest path is still graph first, then scored rank-3. The graph proof is exactly the finite heart of the activation audit [researcher-22-codex-T2-activation-audit.md](/Users/omisverycool/erdos-harness/erdos-872/researcher-22-codex-T2-activation-audit.md:96).

3. The proof wants pointwise edge contributions, not a global delta calculation.
The easiest Lean proof of `DeltaQ8(f) >= incidentPot8(v)` is to decompose the change edge-by-edge and use `Finset.sum_le_sum`. If written globally, the case split over selected edge, incident edges, dead edges, and already-captured vertices will get messy fast.

4. State invariants need to be kept minimal.
Do not encode every legality condition in the state. It is enough to define `liveEdge` semantically and prove simple lemmas about how one move changes it. Heavy invariant bundles will make transition lemmas much harder.

5. The embedding file can easily become the bottleneck if tackled too early.
The arithmetic facts are elementary, but they are the first place where uniqueness of the slot encoding matters [phase4/t2_maker_first_lemmas.md](/Users/omisverycool/erdos-harness/erdos-872/phase4/t2_maker_first_lemmas.md:183). I would delay them until both abstract game theorems compile.

6. The activation asymptotics are not a good first formal target.
The moment the proof touches `W_0 >> ...`, `E << ...`, or prime counts in `J_{a,c}`, the formalization stops being about the Maker-first repair and starts being about analytic number theory [researcher-22-codex-T2-activation-audit.md](/Users/omisverycool/erdos-harness/erdos-872/researcher-22-codex-T2-activation-audit.md:152). That is exactly what this scout should avoid.

## Bottom line

If the goal is the highest-value feasible formal core, I would formalize exactly this sequence:

1. `GraphGame.lean`: the scaled Maker-first weighted graph capture theorem.
2. `Rank3ScoreGame.lean`: the scaled Maker-first scored 3-uniform theorem.
3. `DivisibilityEmbedding.lean`: the finite `t = acb -> {b,ab,cb}` comparison lemmas.

I would not start with the full T2 asymptotic statement. The core formal win is to bank the finite Maker-first engine that the harness now treats as the repaired heart of T2 [current_state.md](/Users/omisverycool/erdos-harness/erdos-872/current_state.md:64) [current_state.md](/Users/omisverycool/erdos-harness/erdos-872/current_state.md:1990).

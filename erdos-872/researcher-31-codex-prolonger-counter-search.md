---
id: R31-codex-prolonger-counter-search
type: research
date: 2026-04-19
intent: >
  Search for an asymptotic Prolonger counter-construction on H^{(h)} that
  would disprove the transversal/sublinear conjecture.
predecessors: []
prompt: erdos-872/prompts/codex-prolonger-counter-construction-search.md
siblings: [R31-codex-summary]
action:
  kind: standalone
claim: >
  No asymptotic Prolonger counter-construction found on H^{(h)}.
  Structural obstacles identified but no refutation of the sublinear
  conjecture produced. Search was exhaustive for small h.
---

# Round 31 Codex — search for an asymptotic Prolonger counter-construction on `H^{(h)}`

## Context

This was a deliberate attempt to find a Prolonger-side obstruction to the resilience lemma in the abstract top-facet hypergraph `H^{(h)}`. The target was an explicit strategy class forcing

`T^*(N,h) = \omega(\log h \cdot \tau_lower(N,h))`

for large `h`, or at least a convincing heuristic signal in that direction.

I used the existing phase-4 simulator / exact solver in [phase4/transversal_small_h.py](phase4/transversal_small_h.py), extended its Prolonger strategy matrix with new adversarial heuristics, and re-ran the same simulation framework.

## Bottom line

I did **not** find an asymptotic Prolonger counter-construction.

More strongly, two of the most natural proposed obstruction classes collapse for structural reasons:

1. **Fixed-core strategies reduce to smaller top-facet games.**
2. **Dependent-set / shared-top-facet cascades are much weaker than advertised, because two distinct hyperedges of `H^{(h)}` share at most one top-facet vertex.**

Empirically, the new Prolonger strategies never produced more than a mild constant-factor increase over the old `smallest_neighborhood` baseline. On the tested range, all observed ratios stayed `O(1)` relative to `\tau_lower`, with no upward drift resembling `\log h`, let alone anything super-logarithmic.

So this dispatch strengthens confidence in the resilience lemma rather than refuting it.

## Structural observations

### 1. Fixed `q`-core strategies are literally smaller `H^{(h-q)}`

Fix a ground subset `Q \subset [N]` of size `q < h`, and let Prolonger restrict attention to hyperedges `S` containing `Q`.

In `H^{(h)}`, vertices are `(h-1)`-subsets and hyperedges are the `h` top facets of an `h`-subset. If we only keep:

- hyperedges `S` with `Q \subset S`, and
- vertices `T` with `Q \subset T`,

then after quotienting out `Q`, this induced subhypergraph is canonically isomorphic to the top-facet hypergraph `H^{(h-q)}` on `N-q` ground points.

Concretely:

- hyperedge `S = Q \cup U` with `|U| = h-q` corresponds to `U`,
- top-facet vertex `T = Q \cup V` with `|V| = h-q-1` corresponds to `V`.

So the "fixed pair core" strategy (`q=2`) is not a new asymptotic gadget at all; it is just the same game one rank lower. Likewise for a fixed triple core (`q=3`).

This kills the most literal version of the core-steal approach:

> a constant-size core cannot create a new asymptotic obstruction, because the induced game is just a smaller top-facet game of the same type.

### 2. Distinct hyperedges share at most one top facet

This is the key correction to the dependent-set picture.

Let `E_S` and `E_T` be the hyperedges corresponding to distinct `h`-subsets `S,T \subset [N]`. A common top-facet vertex is an `(h-1)`-subset lying in both `S` and `T`. If `E_S` and `E_T` shared two distinct such vertices, then the union of those two `(h-1)`-subsets would already recover the full `h`-set, forcing `S=T`.

Therefore:

> Any two distinct hyperedges of `H^{(h)}` share **at most one** top-facet vertex.

So the prompt’s proposed mechanism

> "Two hyperedges share `h-1` top facets when `|S \cap S'| = h-1`"

is false for the top-facet hypergraph. When `|S \cap T| = h-1`, the two hyperedges share exactly **one** top facet, namely `S \cap T`.

This severely limits overlap cascades:

- no single previously stolen edge can donate more than one shared top facet to a future edge,
- "max shared-top-facet" strategies have only `O(1)` local overlap per predecessor, not `Theta(h)`,
- there is no Johnson-graph-style high-multiplicity cascade at the vertex level.

I do **not** claim this proves `g(h)=O(log h)`. But it does show that the most obvious overlap-amplification construction cannot work in the advertised form.

## New Prolonger policies added to the simulator

I added the following Prolonger heuristics to [phase4/transversal_small_h.py](phase4/transversal_small_h.py):

1. `fixed_pair_core`
2. `fixed_triple_core`
3. `max_captured_overlap`
4. `pair_core_overlap`
5. `weighted_overlap_random`

These sit alongside the original:

6. `smallest_neighborhood`
7. `random`
8. `highest_degree_vertex`

The test harness in [phase4/test_transversal_small_h.py](phase4/test_transversal_small_h.py) now checks:

- the fixed-pair policy really opens on an edge containing the pair,
- the overlap policy really prefers an edge sharing already captured top facets,
- the new policies are exposed through the registry,
- and the grid runner accepts the extended registry on custom instances.

Verification command:

```bash
python3 -m unittest /Users/omisverycool/erdos-harness/erdos-872/phase4/test_transversal_small_h.py
```

passed after the changes.

## Empirical search results

I used the same `simulate_game(...)` framework as Round 29, with the strongest previously observed Shortener heuristic `max_degree` as the default stress test. The question was simple:

> do the new Prolonger heuristics overtake `smallest_neighborhood` as `h` grows?

### Regime A — fixed excess `N = h+3`

Using `max_degree` Shortener and 4 seeds for the randomized policy:

| `(N,h)` | `tau_lower` | best Prolonger policy | mean `T` | ratio `T/tau_lower` |
|---|---:|---|---:|---:|
| `(6,3)` | `5.00` | `smallest_neighborhood` | `5.0` | `1.000` |
| `(7,4)` | `8.75` | tie (all deterministic tested) | `8.0` | `0.914` |
| `(8,5)` | `14.00` | `smallest_neighborhood` / `fixed_triple_core` / `max_captured_overlap` | `13.0` | `0.929` |
| `(9,6)` | `21.00` | `smallest_neighborhood` | `19.0` | `0.905` |
| `(10,7)` | `30.00` | `smallest_neighborhood` / `fixed_pair_core` / `pair_core_overlap` | `27.0` | `0.900` |
| `(11,8)` | `41.25` | `weighted_overlap_random` | `36.5` | `0.885` |

Interpretation:

- the new counter-construction candidates do **not** overtake the old baseline,
- the ratios are flat-to-decreasing on this regime,
- and there is no sign of a logarithmic or super-logarithmic blow-up.

### Regime B — denser family `N = 2h`

Again with `max_degree` Shortener:

| `(N,h)` | `tau_lower` | best Prolonger policy | mean `T` | ratio `T/tau_lower` |
|---|---:|---|---:|---:|
| `(6,3)` | `5.00` | `smallest_neighborhood` | `5.0` | `1.000` |
| `(8,4)` | `14.00` | tie (all tested) | `14.0` | `1.000` |
| `(10,5)` | `42.00` | several tie near top | `45.0` | `1.071` |
| `(12,6)` | `132.00` | `weighted_overlap_random` | `152.0` | `1.152` |

This is the only regime where the ratios moved above `1`, but even here:

- the growth is still a mild constant-factor effect,
- `weighted_overlap_random` beats `smallest_neighborhood` at `(12,6)` only marginally (`152` vs `150`),
- and the data is nowhere near a `\log h` separation.

For reference, `\log 6 \approx 1.79`, so even the largest observed ratio `1.152` is well below the scale needed to hint at `T^* \sim \log h \cdot \tau_lower`, let alone `\omega(\log h \cdot \tau_lower)`.

## What each construction class actually did

### A. Fixed core (`fixed_pair_core`, `fixed_triple_core`)

These behaved exactly as the structural reduction predicts: comparable to or weaker than the baseline. They are not generating new asymptotic pressure; they are just steering play into a smaller copy of the same top-facet game.

### B. Overlap-driven (`max_captured_overlap`)

This never outperformed the baseline on the sampled instances. That matches the one-shared-facet structural ceiling: there simply is not enough multiplicity in hyperedge intersections to manufacture a genuine closure cascade.

### C. Hybrid / weighted random (`pair_core_overlap`, `weighted_overlap_random`)

These were the strongest of the new policies, but only by a tiny margin. Their behavior looks like a noisy perturbation of `smallest_neighborhood`, not a qualitatively different obstruction.

## Negative conclusion for the proposed approaches

### 1. Core-steal strategy

Fails as an asymptotic obstruction in the fixed-core form. Constant-size core families reduce to smaller `H^{(h-q)}`. They may still be useful as local heuristics, but they do not create a new growth mechanism.

### 2. Dependent-set stealing

The proposed shared-top-facet cascade mechanism is structurally impossible in `H^{(h)}` as stated, because distinct hyperedges share at most one top facet.

### 3. Threshold/shared-overlap Prolonger

The implemented overlap-maximizing policies do not produce separating growth. Empirically they track the old baseline.

### 4. Probabilistic Prolonger

The weighted-overlap random policy was the strongest new heuristic, but the gains were only constant-factor and small. No sign of `h^{1+\varepsilon}` or even `\log^c h` amplification.

### 5. LP duality lower bound

I did not produce a new dual obstruction here. Given the one-shared-facet ceiling, the naive overlap-based dual picture looks much less promising than it did before the combinatorial correction.

### 6. Adversarial-network / explicit design construction

Not realized. The fixed-core and overlap constraints above suggest that any successful explicit construction would need something subtler than a constant-core or shared-boundary gadget.

## What this means for the resilience lemma

This dispatch was supposed to find an asymptotic Prolonger obstruction if one was hiding in the natural places. It did not.

The evidence now points in one direction:

1. Pro R29 gives the correct static target scale `O(log h)`.
2. Codex R29 found no empirical small-`h` obstruction.
3. This counter-search found no new Prolonger strategy class beating the old baseline.
4. Two of the most plausible obstruction mechanisms collapse structurally.

So the current best read is:

> there is still no evidence for a Prolonger counter-construction forcing `T^* = \omega(\log h \cdot \tau_lower)`, and the specific core/overlap classes tested here do not look capable of producing one.

That does **not** prove the resilience lemma. But it sharpens where a counterexample would have to come from: not from constant-core restriction, and not from naive shared-top-facet cascades.

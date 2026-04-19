# Round 31 Codex — Prolonger counter-construction search: structural obstacles, no refutation found

## Headline summary

The proposed adversarial Prolonger strategy classes either (1) reduce to smaller top-facet games or (2) hit a structural no-overlap barrier.

1. **Fixed $q$-core strategies** (restrict to hyperedges containing a fixed $q$-subset): the induced subgame on hyperedges containing $Q$ is canonically isomorphic to $H^{(h-q)}$ on $N-q$ ground points. Not a new asymptotic gadget.

2. **Dependent-set cascades:** any two distinct hyperedges of $H^{(h)}$ share AT MOST one top-facet vertex (two shared top-facets would force the underlying $h$-sets to be equal). So 'max shared-top-facet' strategies have only $O(1)$ local overlap per predecessor, not $\Theta(h)$. No Johnson-graph-style cascade exists.

3. **Empirical signal** from new strategies: best observed $g$ ratios on $N = h+3$ stayed around $0.885$–$1.000$ through $h = 8$; on $N = 2h$ stayed $1.000$–$1.152$ for $h = 3, 4, 5, 6$. No upward drift resembling $\log h$ or anything super-logarithmic.

**Strategic conclusion.** Strengthens confidence in the resilience lemma. The natural Prolonger refutation paths are structurally blocked. Not a proof of the lemma, but the obvious counter-construction classes are ruled out. See researcher-31-codex-prolonger-counter-search.md for full details.

## Codex's response

Saved the writeup to [researcher-31-codex-prolonger-counter-search.md](/Users/omisverycool/erdos-harness/erdos-872/researcher-31-codex-prolonger-counter-search.md) and extended [transversal_small_h.py](/Users/omisverycool/erdos-harness/erdos-872/phase4/transversal_small_h.py) plus [test_transversal_small_h.py](/Users/omisverycool/erdos-harness/erdos-872/phase4/test_transversal_small_h.py) with new Prolonger strategies: `fixed_pair_core`, `fixed_triple_core`, `max_captured_overlap`, `pair_core_overlap`, and `weighted_overlap_random`. I also added a durable phase-4 note to [AGENTS.md](/Users/omisverycool/erdos-harness/AGENTS.md).

The search did not find a counter-construction. The strongest negative signals are structural, not just empirical: fixed-size core strategies are literally smaller top-facet games `H^(h-|Q|)` on `N-|Q|`, and two distinct hyperedges in `H^(h)` share at most one top-facet vertex, so the proposed high-overlap dependent-set cascade cannot occur in the stated form. Empirically, the new strategies never separated from the old `smallest_neighborhood` baseline by more than a small constant factor: on the fixed-excess regime `N=h+3`, the best observed ratios stayed around `0.885` to `1.000` through `h=8`; on the denser regime `N=2h`, the best ratios were `1.000`, `1.000`, `1.071`, `1.152` for `h=3,4,5,6`, with only a tiny edge for `weighted_overlap_random` at `(12,6)`.

Verification: `python3 -m unittest /Users/omisverycool/erdos-harness/erdos-872/phase4/test_transversal_small_h.py` passed, `python3 /Users/omisverycool/erdos-harness/erdos-872/phase4/transversal_small_h.py --instance 4:3 --heuristic-trials 1 --csv /tmp/transversal_counter_search_smoke.csv` passed, and `git diff --check` was clean. I also ran the light self-update audit; `rg`, `railway`, and `op` are available, and both `railway whoami` and `op whoami` succeeded, so no persistent env/auth change was needed.

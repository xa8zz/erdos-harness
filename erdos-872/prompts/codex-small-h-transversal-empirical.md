# Codex — small-$h$ computational exploration of the top-facet hypergraph $H^{(h)}$

## Context

The matching-upper-bound question has been reduced (Pro R22 third return) to a specific online transversal theorem on the top-facet hypergraph $H^{(h)}$. Full state in `prompts/canonical-prompt.md`; detail in `researcher-22-pro-defect-budget-invariant.md`.

**Setup.** For rank $h$ and prime base $y$:
- Vertices of $H^{(h)}$: top-facet certificates, labeled by $(S \setminus \{p\})$ for each rank-$h$ target $bA_S$, where $S \subseteq \mathcal{P}_y$ with $|S| = h$, and $p \in S$. In the combinatorial abstraction, each vertex is identified with an $(h-1)$-subset of $\mathcal{P}_y$.
- Hyperedges: for each $h$-subset $S \subseteq \mathcal{P}_y$, one hyperedge consisting of the $h$ top-facet vertices $\{S \setminus \{p\} : p \in S\}$.
- Hyperedge count: $N_h^{\text{abstract}} = \binom{|\mathcal{P}_y|}{h}$.
- Each top-facet vertex $(S \setminus \{p\}) = T$ (an $(h-1)$-subset) is incident to exactly the hyperedges $\{T \cup \{p'\} : p' \in \mathcal{P}_y \setminus T\}$ — i.e., incident to exactly $|\mathcal{P}_y| - (h-1)$ hyperedges.

**Game on $H^{(h)}$:**
- Shortener claims one vertex per turn.
- Prolonger steals all $h$ vertices of one unhit hyperedge per turn.
- Shortener wants to hit every hyperedge not stolen.

**Target.** A sublinear $L(n)$ follows if Shortener can build an online transversal of size $O(g(h) N_h/H)$ for some $g(h) = o(h)$, where $H \sim \log\log n$ is the Mertens sum.

In the abstract ($\mathcal{P}_y$ of size $N$, $h$ fixed), the static covering number of $H^{(h)}$ is $\approx N_h/(N - h + 1)$ per vertex coverage — the right scale for a matching upper bound. The question is the *online* version under Prolonger's boundary-stealing.

## The task

Compute, for $h = 3, 4, 5$ and various small values of $|\mathcal{P}_y| = N$, the empirical online transversal size achievable by Shortener against adversarial Prolonger stealing. Track:

- $T^*(N, h)$: the minimum final transversal size Shortener can guarantee against any Prolonger stealing strategy, when playing optimal online response.
- Compare $T^*(N, h)$ to the static covering number $\tau_s(N, h) \approx N_h/(N - h + 1)$.
- Empirical $g(h) := T^*(N, h) / \tau_s(N, h)$ as $N$ grows. Observe $g(h)$'s scaling.

Feasible compute range: $h = 3$ with $N \le 12$; $h = 4$ with $N \le 10$; $h = 5$ with $N \le 8$. (State space grows like $\binom{N}{h}$ hyperedges, exponential game tree — pruning / memoization essential.)

Implementation suggestions:

1. **Exact optimal play via minimax with memoization.** For small instances, represent states as (uncovered hyperedges, captured vertices), compute $T^*$ via minimax backtracking. Cache state values.
2. **Approximate empirical upper bounds** via specific heuristics:
   - Shortener plays max-degree vertex in remaining uncovered hyperedges.
   - Shortener plays min-degree uncovered hyperedge's best vertex.
   - Shortener plays random high-degree vertex.
3. **Approximate empirical lower bounds** via specific Prolonger stealing strategies:
   - Prolonger steals the hyperedge with smallest neighborhood (most isolated).
   - Prolonger steals randomly.
   - Prolonger steals hyperedge containing the highest-degree uncaptured vertex.

Report $g(h)$ trends. Specifically:

- Does $g(h)$ grow with $h$, stay bounded, or shrink?
- At $h = 5$, is $g(h) > 5$, in $[2, 5]$, in $[1, 2]$, or $< 1$ relative to the appropriate normalization?
- Do the strategies converge to the same $T^*$ or does optimal play differ from heuristic?

## Concrete output targets

- Table of $(N, h, T^*, \tau_s, g(h))$ across the feasible range.
- Plot or asymptotic fit of $g(h)$ as $h$ grows.
- Explicit Prolonger counter-construction at small $h$ if $g(h)$ appears to grow unboundedly — concrete evidence the matching-T2 UB fails.
- Explicit Shortener strategy that achieves near-optimal $g(h)$ if the empirical trend is bounded — concrete evidence the matching-T2 UB holds.

## Output expectations

No prescribed format. A short report with tables and trends is fine. If the computation hits exponential blow-up before getting useful data, report that too.

Save to `erdos-872/phase4/transversal_small_h_empirical.md` with accompanying scripts in `erdos-872/phase4/`. Report back via chat with the headline trend — does empirical $g(h)$ support sublinear $L(n)$ or not?

## Working note

Treat the `~/.codex/worktrees/...` repo state as current. Use Python / sympy for the compute. Do not touch `prompts/canonical-prompt.md` unless the outcome is a definitive no-go / closure. Add a durable note to `AGENTS.md` only if the result is definitive.

Two quick tasks. Reports can be short.

## Task 1 — subgame correspondence for the R37 fresh-Pro closure

R37 fresh Pro proved the freshness lemma in a modified game where (a) Shortener's claim of a certificate $c \subsetneq S$ kills all targets containing $c$, and (b) Prolonger's score of a star target $bA_{S'}$ kills only the specific top facet $S'$, NOT arbitrary lower divisors $bA_D$ with $D \subsetneq S'$. Under this rule, $c\subseteq S$ alive immediately implies $c$ is legal (if $c$ had been claimed earlier, $S$ would be dead). Microcell product then gives $d_t(c) \ge 2^{\lceil\log_2 h\rceil} \ge h$, tail $\ll N_h/\log h$, and combined with the R35 state estimate yields $L(n) \ll n/\log\log\log n$ in that subgame.

In the full Erdős 872 divisibility game, Prolonger's play of $bA_{S'}$ kills every $bA_D$ with $D\subseteq S'$, so the monotone-deletion rule is strictly weaker than the true game.

**Question:** does fresh Pro's modified game correspond to any natural restriction of the full game — e.g. plays restricted to a single multiplicative cell, a monotone subfamily of admissible targets, or a subgame where Prolonger is constrained to only one layer of divisor kills per move? If yes, the R37 closure is a legitimate partial theorem for that restricted setting (and a real landmark). If no, it's instructive but does not constitute a subgame-theoretic partial. Full context in `researcher-37-fresh-pro-one-cylinder-closure.md` and `current_state.md`. Short report.

## Task 2 — empirical scaling on `phase4/freshness_toy.py`

Two probes on the existing toy infrastructure.

**2a. Multiplicity scaling.** Codex's greedy runs at $(h,M) \in \{(3,9), (4,9), (5,9)\}$ found each scored witness star used by at most 2 useful shields in the final configuration. Extend to $(h,M) \in \{(6,9), (5,12), (4,14)\}$. Report observed max and mean witness-star multiplicities over useful shields. If $O(1)$ multiplicity persists, it's strong empirical evidence for the recursive/backward-charging freshness lemma. If it degrades, the Ford-type route becomes the only viable closure path.

**2b. Tail-only check.** Codex's $(h,M) = (4,5)$ sharpness counterexample (see `researcher-37-codex-freshness-bounded-depth-partial.md` and `verify-R37-codex-freshness-sharpness-and-high-window-counterexample.md`) exhibits a useful shield with no fresh degree-$\ge h$ witness. This is described as "explicitly high-window" — tail-only, not a counterexample to the claimed R36 lemma as stated. Verify by rerunning at matched *low-window* parameters: adjust microcell populations so that degree $\ge h$ is static-accessible at defect $k = O(1)$, and check whether the same same-prime prehistory obstruction still bites. Expected: obstruction disappears in the low window. If it persists, that's a serious signal the recursive lemma is false in the full game too.

Short report on both.

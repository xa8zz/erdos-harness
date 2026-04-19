# External analyst synthesis — R37 status and three convergent gap reformulations

External synthesis received mid-R37 (post all four agent returns). Preserved verbatim as the cleanest map of the remaining gap.

## Bottom line

R36 "freshness lemma" unconditional form is **dead** (Codex #3's corrected toy gives $(3,7)$ and $(4,8)$ counterexamples). But it survives in two weaker forms, and the remaining gap now has three convergent reformulations pointing at the same missing input.

## Cross-response map

**Monotone one-cylinder model (Pro #2) — CLOSED.** Under the rule "Shortener's claim $c$ kills all completions; Prolonger's score kills only the specific top facet, not arbitrary lower divisors of $S'$": $c \subseteq S$ alive ⟹ $c$ legal (else $S$ would have been killed). Microcell product gives $d_t(c) \ge 2^{k_0} \ge h$ for $k_0 = \lceil \log_2 h \rceil$; entropy tail $\ll N_h/\log h$. Yields $|F_{\text{useful}}| \ll N_h/h$, hence $L(n) \ll n/\log\log\log n$ **in this subgame**.

**Bounded-depth partial (Codex #4).** In the richer model, if same-prime prehistory $r_p(t^-) < h-k$ at time of useful shield for $S = T \cup \{p\}$, fresh degree-$\ge h$ witness at defect $k$ exists. Low-window with $k = O(1)$: freshness fails only if same-prime prehistory has **linear length in $h$**.

## The #2 / #3 tension is modeling, not mathematics

Pro #2's "Prolonger doesn't kill lower divisors" rule is NOT the full Erdős 872 game — in the actual divisibility game, Prolonger's play of $bA_{S'}$ kills every $bA_D$ with $D \subseteq S'$. Pro #2 explicitly acknowledges this: the true remaining gap for the full game is "at least one $c \subseteq S$ with $d_t(c) \ge h$ is not already killed by previously played multiples." So Pro #2 has closed a substantive *subproblem*, not the original.

## Three convergent reformulations of the remaining gap

- **Pro #1:** per-score codim-2 projection $\sum_{D \subset F_t} J(D) \ll d_t(x_t)$ — dyadic-local hypergraph supersaturation.
- **Codex #4:** "same-prime prehistory of linear length in $h$ cannot persist against $\sigma^\star$."
- **Pro #2:** "few divisors in very short multiplicative intervals" — Ford/Buchstab-style; candidate witnesses sit in ratio intervals of size $e^{k_0/h}$, so divisor-function bounds apply.

Pro #2's Ford direction is the most analytically concrete and ties to classical literature (Ford 2008 on divisors in short intervals, Hooley/Tenenbaum $\Delta(n)$). Cleanest dispatch target.

## Two empirical signals worth preserving

- Codex #3's "each scored witness star used by $\le 2$ useful shields" at $(h,M) \in \{(3,9), (4,9), (5,9)\}$. If $O(1)$ multiplicity persists at larger scales, strong evidence for the recursive lemma.
- Codex #4's $(h,M)=(4,5)$ sharpness example is *explicitly high-window*. Worth rerunning freshness_toy.py at matched *low-window* parameters: does same-prime prehistory bite there, or is it tail-only?

## Suggested next dispatches

1. **Pro A on the Ford ingredient.** "Prove a quantitative 'few divisors in $[x, x(1+\varepsilon)]$' bound for sieve-cylinder integers. Candidate witnesses $bpA_B$ sit in ratio $\le e^{|B|/h}$; we need any single previously-played $m$ to contain at most $O(\log\log h)$ such witnesses as divisors." Clean analytic NT statement, likely tractable via Rankin + smooth-part decomposition.
2. **Codex scaling on freshness_toy.** Extend the "$\le 2$ shields per star" probe to $(6,9), (5,12), (4,14)$. Separately run the $(4,5)$ negative at matched low-window parameters to verify tail-only status.
3. **Cross-family on the Ford ingredient.** DeepThink or Gemini, independent derivation.

## Aristotle candidate

Pro #2's monotone-subgame proof. First fully-proven sublinear bound for a cleanly-specified divisibility-game-like subproblem. Worth formalizing with the legality rule made explicit — does Pro #2's model correspond exactly to any restriction of the full game? If yes, it's a legitimate partial theorem and a "sublinear is achievable under monotone-deletion" landmark even while the full game stays open.

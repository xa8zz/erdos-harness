---
id: R39-verify-codex-dense-packet-audit
type: verification
date: 2026-04-19
intent: >
  Adversarially audit the R39 Pro dense-packet projection lemma; determine
  if the dense-regime consequence follows.
predecessors: [R39-pro-dense-packet-projection]
action:
  kind: standalone
claim: >
  Lemma salvageable (repairably sound after notation cleanup) but dense-regime
  consequence NOT proved: three high-severity gaps identified in the jump
  from dense-packet projection lemma to |F_useful| << N_h/h for the dense
  regime. Closure jump is not established by Pro's R39 argument.
---

# Round 39 Codex adversarial audit of Pro's dense-packet projection lemma

## Status: lemma salvageable, dense-regime consequence NOT proved

Codex audit identifies three high-severity gaps in the jump from Pro's dense-packet projection lemma to the dense-regime star-breaker $|F_{\text{useful}}| \ll N_h/h$. The lemma itself is repairably sound after notation cleanup, but the closure jump is not established.

## High-severity findings

### 1. Target vs. shield confusion

Lemma bounds $|\mathcal S|$ where $\mathcal S$ is a family of later useful **targets**. Consequence at line 42 uses it to bound useful **top-facet shields**. One target can yield several bad shields — $d_t(bA_B)$ counts the live target once, not per shield.

**Concrete toy evidence:** at $(h,M) = (4,20)$, single target $(1,2,3,15)$ contributes two charged shields. Factor up to $h$ is hidden in this gap.

### 2. Predecessor multiplicity division is incoherent

Proof says: "assign each freshless useful top facet to one dense predecessor packet, apply lemma score-by-score, sum $\sum_t d_t(x_t) \le N_h$, divide by $\gg h$ predecessor multiplicity." Once each object is assigned to ONE packet, the multiplicity to divide by has been removed. Counting all predecessor obligations requires a rigorous overlap theorem across scores, packets, and depths — none shown.

### 3. Hidden $O(\log h)$ partition loss

Hypothesis: each bad shield is dense at **some** depth $k \le C\log h$. Lemma only applies for **fixed** $k$ (with fixed $r, \theta$). Using score-by-score requires grouping by $k$ and packet type. Summing over $k = 1, \ldots, C\log h$ costs extra $O(\log h)$ unless sharper monotonic or weighted selection argument. At R35 scale, this loss is not harmless.

## Medium-severity findings

### 4. Lemma itself is repairably sound

Incidence step (lines 24–34) is a standard bipartite averaging argument. Denominator $\binom{h}{k}$ is conservative not wrong — the relevant count is $\sum_B \#\{S \in \mathcal S: B \in \Gamma_k(S,F)\} \le \sum_B d_t(bA_B)$ with at most $\binom{|F|}{k} \le \binom{h}{k}$ relevant $B$. Restricting to $\bigcup_{S\in\mathcal S} \Gamma_k(S,F)$ would strengthen.

**Time indexing clarification:** $t$ must mean the state **after** $\sigma^\star$ claims $x_t$ and **before** Prolonger scores $F$. With that interpretation, degree comparison works.

The lemma is a clean abstract incidence lemma with dynamic legality — not specifically arithmetic as advertised.

### 5. Toy sanity check: not contradicted but not load-bearing

For worst toy round $(h,M) = (4,20)$ with score $F = (0,1,2,15)$, charged bad shields have $\Gamma_2$ densities $\{2/3, 2/3, 1, 1\}$ — dense hypothesis IS present. $x_t = (15,)$ has live degree 364 just before $F$, so lemma gives a huge upper bound, numerically consistent.

Issue: toy pair-first max 6 is a **shield** count, while distinct later useful **targets** are only 4. Toy supports "lemma is not false" but also shows "lemma does not settle shield-level amortization."

### 6. Remaining-gap framing misaligned with observed obstruction

Worst pair-first rounds in toy are NOT sparse across many $k$-subsets — they reuse one or two actual latest pairs many times. Real bottleneck:
$$\text{outside moving local packets, one fixed latest pair cannot be reused many times}$$
NOT
$$\text{sparse } \Gamma_k \text{ across all depths.}$$
Does not refute the lemma, but refutes the claim that it isolates the final gap correctly.

## Low-severity

### 7. "$\theta \gg 1$" is sloppy

$\theta$ is a density $\le 1$. Should say "bounded below by a positive constant."

## Weakest link

Not the double-counting lemma itself. The jump from lemma to dense-regime bound $|F_{\text{useful}}| \ll N_h/h$ at lines 42–45 mixes targets and shields, assumes unjustified predecessor-multiplicity division, and suppresses possible $O(\log h)$ loss from varying depth.

## Literature

Not a direct use of LYM, Kruskal-Katona, or Frankl-Wilson. Much simpler: bipartite incidence average between targets $S$ and legal witnesses $B$.

Closest comparisons:
- LYM/local LYM: layer densities and shadows of antichains (Mathlib LYM)
- Kruskal-Katona: minimal shadows of uniform families
- Frankl-Wilson: linear-algebraic bounds for restricted intersections

Those results exploit shadow/compression structure on Boolean layers (LYM/KK), modular intersection conditions (FW). Pro's lemma uses none of that — incidence counting plus max-degree domination.

## Verdict

- **Lemma itself:** repairably sound after notation cleanup
- **Dense-regime consequence:** NOT proved
- **"Sole remaining obstruction" framing:** too optimistic

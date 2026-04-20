---
id: R35-pro-A-online-domination-partial
type: research
date: 2026-04-19
intent: >
  Attempt to prove an online domination lemma and critique the R35 closure
  candidates to determine whether any rigorously closes L(n) = o(n).
predecessors: [R35-codex-L-sublinear-proof, R35-fresh-pro-arithmetic-closure]
action:
  kind: standalone
claim: >
  Online domination lemma proved as a partial result; R35 closure candidates
  both have the same static/dynamic gap: the state inequality is sound but
  the translation to L(n) introduces an unbounded scored quantity. Neither
  R35 candidate rigorously closes the sublinear bound without the online
  amortization step.
---

# Round 35 Pro A — online domination lemma + critique of R35 closure candidates

## Headline

Pro A (continuing from their own R35 dyadic-window state estimate) did not close the online amortization $|F_{\text{useful}}| \ll N_h/h$. They proved a useful WEIGHTED online domination lemma for $\sigma$ and identified a specific gap in translating R35's static state inequality into a game-length bound. This functions as an adversarial audit of the fresh Pro + Codex R35 closure candidates.

## What Pro A proved (online domination lemma)

Let $R_t$ be the live rank-$h$ target family before Shortener's $t$-th move. For legal certificate $u$, $d_t(u) = \#\{S \in R_t : u \subseteq S\}$. Let $\sigma$ claim the maximum-degree legal certificate $x_t$. Then:

**Weighted online budget (Pro A R35-b).** At defect layer $k$:
$$\sum_t \sum_{\substack{u \subsetneq S_t \\ |S_t \setminus u| = k}} d_t'(u) \le \binom{h}{k} N_h,$$
where $d_t'$ is degree after Shortener's deletion. This is rigorous max-degree domination plus monotonicity under deletion.

**Critical observation.** This bounds *degree-weighted* stolen certificates, NOT the *number* of useful stolen certificates. To recover $|F_{\text{useful}}| \ll N_h/h$, one would need an anti-concentration lower bound: useful stolen certs have average live degree $\gg h$.

## The identified gap (audit of R35 candidates)

Pro A's specific critique of the fresh Pro + Codex R35 arguments:

> **R35's static thickness argument handles the resulting mass, but only after the set of useful witnesses is known; it does not by itself bound how many such witnesses Prolonger can create online.**

The R35 state inequality $\mu(\operatorname{Cl}_h) \ll L \cdot \text{scored} + N_h/\log L$ holds at any state. Translating to a game-length bound requires controlling Prolonger's cumulative "useful score mass" — the part actually relevant to closing new targets. Pro A's online domination gives a weighted bound on this, not a cardinality bound.

## Pro A's abstract countermodel

In the abstract $H^{(h)}$ setting: consider $r$ disjoint stars, each with a center vertex of degree $d$ and $d$ edges whose remaining vertices are private. Linear hypergraph (two edges share at most one vertex). If Prolonger moves first in a star, he scores one edge and steals the center before $\sigma$ can claim it. Then $\sigma$ and Prolonger split the remaining $d-1$ edges one-for-one. By alternating across stars, Prolonger forces $\Omega(rd)$ scores even though the static center cover has size $r$.

In the abstract model, max-degree $\sigma$ alone cannot prove the amortization. A "star-breaker" at lower defect is needed.

## Why the arithmetic model might still close

The star-forest counterexample does NOT directly embed into the divisibility model: a target $bA_S$ also has lower divisors $A_D$ and $bA_D$. If top facet $bA_{S \setminus \{p\}}$ is stolen, the singleton $p$, pairs containing $p$, and other lower-defect certificates remain available unless separately shielded. **Those lower certificates are exactly where $\sigma$ should break the star.** But proving the break quantitatively is the unresolved part.

## Specific form of the missing step

Pro A proposes the precise form:
$$\Delta_{\text{useful}}(t) \ll \frac{L}{h} d_t(x_t) + \Delta_{\text{high}}(t),$$
where $\Delta_{\text{useful}}(t)$ is the new low-window closure capacity created by Prolonger's $t$-th score, $x_t$ is $\sigma$'s max-degree claim, and $\Delta_{\text{high}}(t)$ is the high-window entropy tail part.

Summing: $\sum_t \Delta_{\text{useful}}(t) \ll (L/h) N_h + N_h/\log L \ll N_h/\log h$ with $L = h/\log h$.

## Implication for the R35 closure candidates

Pro A's audit sharpens what the R35 verification round must check:

1. Do fresh Pro and Codex implicitly assume $|F_{\text{useful}}| \ll N_h/h$ when translating their static state inequality to game length?
2. Does their arithmetic mass-weighted calculation implicitly provide this cardinality bound through a different mechanism, or is there a hidden gap?
3. Is Pro A's "lower-defect star-breaker" principle necessary for the full closure, and does the R35 arguments implicitly prove it?

If R35 handles this differently (e.g., via the mass-weighted translation $L(n) \ll n \cdot g(h)/h$ being itself a valid reduction that only needs mass control, not cardinality), then Pro A's concern might be tangential. If R35 needs cardinality control and doesn't have it, the closures have a gap.

## Pro A's final status

$$\boxed{\begin{aligned}
&\text{Static scale-entropy: closed (R35 dyadic windows).} \\
&\text{Neighboring replacement: closed.} \\
&\text{Multi-cell product-star: closed.} \\
&\text{Fresh Pro cross-layer counting: rigorous, useful.} \\
&\text{Online max-degree amortization: open.}
\end{aligned}}$$

Specific missing: "low-degree top-facet shielding forces high-degree lower-defect exposure, and σ claims it before Prolonger can accumulate $\omega(N_h/h)$ useful shields." No counterexample in the arithmetic dyadic model; abstract $H^{(h)}$ star-forest shows top-facet max-degree alone isn't enough, but full divisor lattice may still make amortization true.

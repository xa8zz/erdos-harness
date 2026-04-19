# Codex — search for an asymptotic Prolonger counter-construction on $H^{(h)}$

## Context

Two sources of evidence currently suggest the resilience lemma holds:

- Pro R29 (analytical): static random cover gives $O(\log h)$ overhead; online-vs-static lower principle $T^* \ge \tau/2$.
- Codex R29 (empirical): $T^*/\tau_{\text{exact}} \approx 0.5$–$1$ across $h \in \{3, 4, 5\}$.

**But no one has explicitly looked for an asymptotic Prolonger counter-construction.** If Prolonger has a stealing strategy that forces $T^*(N, h) = \omega(\log h \cdot \tau_{\text{lower}})$ at large $h$, that would:

- Refute the resilience lemma.
- Prove matching T2 upper bound fails.
- Establish that the sharp rate of $L(n)$ is strictly between $n(\log\log n)^2/\log n$ and $0.19n$ — itself a new asymptotic result.

The small-$h$ empirical absence of such a construction is suggestive but not conclusive — asymptotic behavior can differ from small-instance behavior.

## The task

Attempt to construct a Prolonger counter-strategy forcing $T^* = \omega(\log h \cdot \tau_{\text{lower}})$ at large $h$, or give evidence it doesn't exist.

Concrete approaches:

1. **Core-steal strategy.** Prolonger commits to a small "core" subset $C \subseteq V(H^{(h)})$ of vertices, chosen so every hyperedge contains many core vertices. Prolonger's stealing concentrates on hyperedges with maximal core-overlap. Shortener is forced to either (a) claim core vertices (hurting future stealing efficiency) or (b) let the core grow and cascade-close many targets. Explicit small-$h$ example: $C = $ all $(h-1)$-subsets containing a fixed pair of primes. Check whether this forces $T^* = \Omega(h \cdot \tau_{\text{lower}})$.

2. **Dependent-set stealing.** Exploit structural correlations. In $H^{(h)}$ (an abstract simplex), every $(h-1)$-subset is in exactly $N-h+1$ hyperedges. Two hyperedges $S, S'$ share $h-1$ top-facets iff $|S \cap S'| = h-1$. Prolonger builds up overlap by stealing edges that share many top-facets with already-stolen ones, creating closure cascades. Compute the maximum cascade depth achievable.

3. **Threshold Prolonger strategy.** Parameterize: Prolonger steals the hyperedge with maximum $|\{T \subset S : |T| = h-1, T \in C\}|$ (most shared with Shortener's claims). Test at larger $h$ via heuristics. Does this force $T^* > \log h \cdot \tau_{\text{lower}}$?

4. **Probabilistic Prolonger.** Random stealing with specific distributions — uniform over unhit-unstolen hyperedges, or weighted by shared-top-facet count. Compute expected online transversal size against best Shortener response. If expected $T^*$ grows like $h^{1+\varepsilon} \tau_{\text{lower}}$, we have an obstruction.

5. **LP duality lower bound.** The resilience lemma is a covering-design integrality-gap statement. Write the dual LP for the online game and compute its value. If the dual LP value grows like $h/\log h$ at large $h$, there's a structural barrier to $g(h) = O(\log h)$.

6. **Adversarial-network construction.** In the number-theoretic translation, Prolonger "boundary-stealing" corresponds to playing rank-$h$ targets $bA_S$ that cascade-close the residual downset. Are there specific $S$-families (e.g., steiner triple systems, difference sets, explicit group-theoretic constructions) where cascading closures force $g(h) \gg \log h$?

## Expected outcome spectrum

**Most likely (given empirical data):** No construction works. Each approach either converges to $T^* = O(\log h \cdot \tau_{\text{lower}})$ empirically or hits a structural reason the stealing can't cascade efficiently.

**Possible but less likely:** A construction gives $T^* = \Omega(\log^c h \cdot \tau_{\text{lower}})$ for some $c > 1$. This would be a refutation at a weaker scale than $\Omega(h)$.

**Significant result:** A construction gives $T^* = \Omega(h^{1-\varepsilon} \cdot \tau_{\text{lower}})$. Refutes matching T2 UB.

**Refutation signal:** A proof that Prolonger cannot force more than $O(\log h \cdot \tau_{\text{lower}})$ via any construction of a specific class (e.g., any "shift-invariant" stealing strategy). This strengthens the proof side.

## Output expectations

- Save writeup to `erdos-872/researcher-NN-codex-prolonger-counter-search.md` (NN next available).
- Include any constructions tested and their empirical $T^*$ values.
- If any construction gives $g(h) \gg \log h$, state the explicit Prolonger strategy and the exact lower bound.
- If no construction succeeds, give a structural argument for why the class of tested constructions can't beat $O(\log h)$.
- Update `phase4/transversal_small_h.py` (or a companion module) to include the tested Prolonger strategies.

## Complementarity with Pros

Two Pros are currently attacking the resilience lemma directly. If they succeed, the problem closes. If they return without closure, this Codex dispatch provides complementary information — either it strengthens confidence in the lemma by failing to find a refutation, or it surfaces a specific obstruction.

## Working note

Use the main `~/erdos-harness` tree. The R29 empirical code in `phase4/transversal_small_h.py` is the starting point. Extend the Prolonger-strategy matrix with new adversarial options and re-run the same minimax / heuristic framework.

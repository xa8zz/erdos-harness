---
id: R39-pro-dense-packet-projection
type: research
date: 2026-04-19
intent: >
  Prove the dense-packet projection lemma separating divisor-lattice
  behavior from abstract hypergraph in the dense regime.
predecessors: [R38-pro-pair-first-charging, R39-codex-packet-tail-reduction]
action:
  kind: extends
  target: R38-pro-pair-first-charging
claim: >
  Dense-packet projection lemma proved: in the dense regime (gamma_k >= theta
  for some fixed theta), the divisor lattice non-privacy forces sigma^star
  to claim a degree-Omega(h) certificate before Prolonger accumulates more
  than N_h/h useful top scores. Sole remaining gap is the sparse recursive
  pre-shielding regime (gamma_k < theta for all k).
---

# Round 39 Pro — dense-packet projection lemma PROVED; remaining gap is sparse recursive pre-shielding

## Status: genuine arithmetic partial theorem + sharp final gap

First theorem in the program with genuine arithmetic content separating divisor-lattice behavior from abstract private-leaf hypergraphs. Closes the dense regime cleanly; leaves the sparse recursive chain case as the sole remaining obstruction.

## Dense-packet projection lemma (PROVED)

**Setup.** Fix fibre $b$, rank $h$, Prolonger score $F$ at time $t$. Let $x_t$ be the certificate claimed by multi-defect $\sigma^\star$ immediately before $F$:
$$d_t(x_t) = \max\{d_t(c) : c \text{ legal proper divisor}\}.$$

For depth $k$, define the *first-shielded witness set*
$$\Gamma_k(S, F) = \{B \subseteq S\cap F : |B|=k,\ bA_B \text{ legal just before } F \text{ and becomes shielded by } F\}.$$

Let $\mathcal S$ be a family of later useful targets whose relevant chain-generated witnesses are first shielded by $F$.

**Lemma.** If for every $S \in \mathcal S$,
$$|\Gamma_k(S, F)| \ge \theta \binom{|S\cap F|}{k} \quad \text{and} \quad |S\cap F| \ge h - r,$$
then
$$|\mathcal S| \le \theta^{-1} \left(\frac{h}{h-r}\right)^k d_t(x_t).$$

In particular: $k \le c\log h$, $r \le c'h/k$, $\theta \gg 1$ gives $|\mathcal S| \ll d_t(x_t)$.

**Proof.** Count incidences $I = \#\{(S, B) : S\in\mathcal S, B\in\Gamma_k(S, F)\}$.

Lower bound: $I \ge |\mathcal S| \cdot \theta \binom{h-r}{k}$.

Every $B\in\Gamma_k(S,F)$ is legal before $F$ scored; $S$ is live at that moment, so contributes to live degree of $bA_B$. There are at most $\binom{h}{k}$ such $B$'s, so pigeonhole gives some legal $bA_B$ with
$$d_t(bA_B) \ge \frac{I}{\binom{h}{k}}.$$

Since $\sigma^\star$ claims the max,
$$d_t(x_t) \ge \frac{I}{\binom{h}{k}} \ge \frac{|\mathcal S| \theta \binom{h-r}{k}}{\binom{h}{k}}.$$

So $|\mathcal S| \le \theta^{-1} \frac{\binom{h}{k}}{\binom{h-r}{k}} d_t(x_t) \le \theta^{-1} (h/(h-r))^k d_t(x_t)$. ∎

## Why this is the arithmetic gain

In an abstract private-leaf hypergraph, a Prolonger score can create many essentially disjoint witnesses. In the divisibility lattice, if many later useful targets are generated through the same local packet, their lower divisors overlap inside the Boolean lattice — a single lower-defect certificate carries large live degree, and $\sigma^\star$ sees it. This is exactly what the private model lacks.

## Consequence: clean partial star-breaker for the dense regime

If every freshless useful top-facet shield has at least a constant fraction of chain-generated witnesses in such dense packets at some depth $k \le C\log h$ with $|S\cap F| \ge h - O(h/k)$, then
$$|F_{\text{useful}}| \ll \frac{N_h}{h}.$$

Proof: branching argument. Freshless useful top facet has $\gg h$ distinct predecessor obligations. Assign each to one dense predecessor packet. Lemma gives $O(d_t(x_t))$ useful shields per Prolonger score. $\sum_t d_t(x_t) \le N_h$. Divide by $\gg h$ predecessor multiplicity: $|F_{\text{useful}}| \ll N_h/h$.

Combined with R35 state estimate: $\mu(\text{Cl}_h) \ll N_h/\log h$, and summing central ranks gives $L(n) \ll n/\log\log\log n$ contribution **in the dense regime**.

## The remaining sparse recursive case

The dense-packet lemma fails only when $\Gamma_k(S, F)$ is a tiny subset of available $k$-subsets of $S\cap F$ at every depth $k \le C\log h$. Equivalently: almost all potential lower-defect witnesses inside $S\cap F$ were pre-shielded before $F$ was played.

**Unresolved question:**
$$\boxed{\text{Can a Prolonger chain keep } \Gamma_k(S,F) \text{ sparse at every } k\le C\log h \text{ without already paying comparable } \sigma^\star\text{-degree earlier?}}$$

This is a sharper form of the same-prime prehistory problem:
- Bounded depth chain: earlier bounded-prehistory lemma supplies fresh witness ✓
- Depth $\gg h$: many lower faces pre-shielded earlier — remaining missing proof is a recursive charging statement showing this cannot happen with low $\sigma^\star$-cost.

## Why clustered-microcell counterexamples DO NOT refute

The Ford counterexample ($h$ primes in one microcell) creates many raw divisors, but:
- Either they are absorbed by R35 packet entropy term, OR
- Lower-defect degrees are large enough for $\sigma^\star$ to charge them directly.

The dangerous case is subtler: a **sparse** chain-generated family spread across several cells, where each individual Prolonger score first-shields only a small carefully selected subfamily.

## Sharpened current state

- **Dense chain-generated packets:** controlled ✓
- **Single-cell concentration:** absorbed by entropy tail ✓
- **Bounded same-prime prehistory:** controlled ✓
- **Remaining gap:** sparse recursive pre-shielding chains across several cells

## The final sufficient lemma

A concrete closure sufficient:
$$\boxed{\sum_{\text{sparse predecessor scores } F} |\mathcal S(F)| \ll \sum_t d_t(x_t) \le N_h}$$
where $\mathcal S(F)$ is later useful targets whose first available $k\le C\log h$ witnesses are sparsely first-shielded by $F$. Proving this would close the final amortization and give $L(n) \ll n/\log\log\log n = o(n)$.

No counterexample in arithmetic model. Proof complete for dense-packet regime; only surviving obstruction is sparse, recursively pre-shielded witness selection.

---
id: R13-pro-reachability-shortener-prevents
type: research
date: 2026-04-18
intent: >
  Answer sub-question (a): can Prolonger force the sparse-S triangle family
  online? Provide explicit Shortener counter-strategy if answer is no.
predecessors: [R13-pro-sparse-subset-closeout]
siblings: [R13-pro-upper-half-fan-lower-bound]
prompt: erdos-872/prompts/researcher-13-pro-reachability-followup.md
action:
  kind: standalone
claim: >
  Sub-question (a) is FALSE for the sparse-S triangle construction: Shortener
  plays multiplicative star-throttle T(q, C_j, a) = 2q * prod(C_j \ {a}) to
  cap Prolonger's per-q captured reciprocal mass at O(1). Sub-question (b)
  TRUE for this E-style regime. Does not rule out alternative Prolonger
  mechanisms.
---
# Pro reachability response #1 — Shortener online-prevents the sparse-$S$ triangle family (2026-04-18)

**Result.** The specific sparse-$S$ triangle construction from sub-question (c) is **NOT** dynamically forceable. Shortener has a "multiplicative star-throttle" online strategy that caps Prolonger's per-$q$ captured reciprocal mass at $O(1)$, not $\log\log n$. Therefore sub-question (a) is **false** for the established sparse construction; sub-question (b) is **true** for this $\mathcal{E}$-style regime.

**Caveat stated by Pro:** this does NOT rule out a different lower-bound mechanism using high-rank circuit carriers or another construction. It specifically refutes the triangle-family reachability; the central question hinges on whether an alternative mechanism exists.

**Key mechanism.** When Prolonger plays $2qa$, Shortener responds with the multiplicative-block move $T(q, C_j, a) = 2q \prod_{r \in C_j \setminus \{a\}} r$ where $C_j$ is a pre-reserved block of small primes containing $a$. This makes every future $2qr$ for $r \in C_j \setminus \{a\}$ illegal (since $2qr \mid T$). Result: per-$q$ Prolonger captures at most one $a$ per reserved block.

---

The sparse obstruction from (c) is not dynamically forceable in its stated form. Shortener has a direct online disruption strategy that kills the $\log\log n$ gain before the $S_{QA} \cup S_{AB} \cup S_{QB}$ triangle family can become effective.

The key move is not "play primes from $Q$" or "play the small primes $a$." Those are too crude. The useful Shortener move is a **multiplicative star-throttle**:

$$2q \prod_{r \in R} r.$$

If Prolonger has just played a carrier $2qa$, Shortener can play $2q \prod R$, where $R$ is a whole block of still-unused small $a$-primes. This single move makes every future carrier $2qr$, $r \in R$, illegal, because

$$2qr \mid 2q \prod_{r \in R} r.$$

Thus Shortener does not need to spend one move per small prime. He spends one move per **multiplicative block**.

This destroys precisely the factor that made the sparse obstruction work: the factor

$$\sum_{a \in A} \frac{1}{a} \sim \log\log n.$$

After throttling, for each fixed $q \in Q$, Prolonger can capture only $O(1)$ reciprocal $a$-mass, not $\sim \log\log n$.

[Full theorem statement and proof as presented; see original response for the block-reservation construction, product-bound choice, and the per-$q$ $O(1)$ mass cap derived via $\sum_j 1/\min(C_j) \ll \sum_j 1/(j \log n) = O(1)$.]

**Conclusion.** Shortener online-prevents the sparse $S$-family.

- Sub-question (a) is false for the established sparse construction.
- Sub-question (b) is true for this $\mathcal{E}$-style regime.

Conditional on the reduction that the only route to the $n \log\log n / \log n$ lower bound is to force such an $\mathcal{E}$-style sparse carrier family, this selects $L(n) = \Theta(n / \log n)$.

Remaining caveat: this does not rule out a different lower-bound mechanism using genuinely high-rank circuit carriers rather than rank-3 $\mathcal{E}$-style carriers. But the specific post-hoc obstruction from (c), even after the sparse closeout, cannot be converted into a dynamic lower bound.

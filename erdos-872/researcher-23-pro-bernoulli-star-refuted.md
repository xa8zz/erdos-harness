---
id: R23-pro-bernoulli-star-refuted
type: refutation
date: 2026-04-19
intent: >
  Determine whether the missing certificate lemma (star) —
  sup_{reachable P} Pr(D_y in K(P)) = o(1) — holds for the smooth-squarefree
  candidate C_y with y = exp((log n)^{1/2}), which would close the sublinear
  L(n) program via the dynamic multiplicative-closure reduction.
predecessors: [R22-pro-certificate-family-gap-isolated]
prompt: erdos-872/prompts/round23-pro-bernoulli-closure-attack.md
action:
  kind: refutes
  target: R22-pro-certificate-family-gap-isolated
claim: >
  Under the reachability definition given, (star) is false: the supremum is
  asymptotically 1, not o(1). Hence the smooth-squarefree candidate C_y does
  not yield sublinear L(n) via the R22 reduction, though the reduction
  framework itself (L(n) <= 2|C_n| + 1 + sup w(R_{C_n})) still holds.
failure_mechanism: >
  Explicit Prolonger construction. For y = exp((log n)^{1/2}), N = pi(y),
  mu = sum_{p<=y} 1/p, k = ceil(mu + sqrt(mu) log mu). For each k-subset F
  of primes <= y, Prolonger plays x_F = d_F q_F in (n/2, n] (with d_F the
  product of F and q_F a prime in (n/(2 d_F), n/d_F)). Shortener plays
  s_F <= y^{k+1} < n/2, a squarefree integer on a (k+1)-set G_F containing
  F. The alternating sweep uses only binom(N, k) = n^{o(1)} moves. The
  generated complex contains every nonempty squarefree y-smooth integer with
  <= k prime factors, so Pr(1 <= omega(D_y) <= k) = 1 - o(1). Crude
  Prolonger budget O(|C_y|) is far too weak to force small Bernoulli mass.
  Failure localized to medium rank k ~ mu ~ log log n.
implications:
  - R22 reduction framework survives; only the specific C_y candidate is refuted.
  - Does not refute Gap 1 (abstract h-uniform hypergraph closure budget) — naive Gap 1 <=> Gap 2 equivalence was wrong.
  - Any salvaged (star) requires a stronger Shortener-strategy-constrained reachability notion, not mere existence of a sweep completion.
confidence_at_time: high
---

# Round 23 Pro — Bernoulli form of certificate lemma $(\star)$ REFUTED

## Context

The Bernoulli-focused Pro dispatch (round23-pro-bernoulli-closure-attack.md) returned with a clean explicit Prolonger counterexample refuting $(\star)$: under the reachability definition in the prompt, $\sup_{\text{reachable } P} \Pr(D_y \in \mathcal K(P)) = 1 - o(1)$, not $o(1)$. The specific candidate $C_y$ (smooth squarefree with $y = \exp((\log n)^{1/2})$) does NOT give a useful bound via the Pro R22(2nd) reduction.

## Implication summary

- The specific candidate $C_y$ with Pro R22(2nd)'s reduction does NOT yield sublinear $L(n)$ — the missing lemma $(\star)$ is literally false under the stated reachability definition.
- Construction uses only $\binom{N}{k} = n^{o(1)}$ Prolonger sweep moves. The crude Prolonger budget $O(|C_y|)$ is far too weak to force small Bernoulli mass.
- The failure occurs at the medium-rank region $k \sim \mu \sim \log\log n$ — exactly where Codex R27's medium-rank localization flagged the obstruction would have to live.
- **Does NOT refute the Pro R22 reduction framework itself** — the inequality $L(n) \le 2|C_n| + 1 + \sup w(R_{C_n})$ still holds for every $C_n$. The specific candidate $C_y$ just doesn't give a useful sup.
- **Does NOT refute Gap 1** (defect-layer closure budget / robust central transversal lemma) — that formulation is about an abstract $h$-uniform hypergraph game, not about reachable Bernoulli mass on a smooth-squarefree complex. The earlier claimed equivalence Gap 1 $\iff$ Gap 2 was WRONG — Gap 2 in its naive Bernoulli form is strictly weaker and, as now shown, unachievable for $C_y$.

Pro's closing remark: "To make a true statement of this type, 'reachable' would need to encode a much stronger Shortener strategy constraint, not merely existence of some sweep completion."

## Pro's response

Under the reachability definition in the prompt, $(\star)$ is false. In fact the supremum is asymptotically $1$, not $o(1)$.

The obstruction is simple: Prolonger can, during a legal sweep prefix, realize the whole downset of all $y$-prime supports of rank up to essentially the mean rank of $D_y$. That downset has Bernoulli mass $1 - o(1)$.

Let
$$\mathcal P_y = \{p : p \le y\}, \quad N = \pi(y), \quad \mu = \sum_{p \le y} \frac{1}{p}.$$
For $y = \exp((\log n)^{1/2})$, Mertens gives $\mu = \log\log y + O(1) = O(\log\log n)$. Choose $k = \lceil \mu + \sqrt{\mu} \log \mu \rceil$. Then $k = (1+o(1))\mu$ and $(k+1)\log y = O((\log\log n)(\log n)^{1/2}) = o(\log n)$, so for large $n$, $y^{k+1} < n/2$.

### Legal sweep prefix construction

For every $k$-element set $F \subseteq \mathcal P_y$, put $d_F = \prod_{p \in F} p$. Since $d_F \le y^k < n/(2y)$, the interval $(n/(2d_F), n/d_F)$ starts above $y$. By Bertrand's postulate, choose a prime $q_F \in (n/(2d_F), n/d_F)$. Then $x_F = d_F q_F \in (n/2, n]$, and the only prime factors of $x_F$ that are $\le y$ are exactly the primes in $F$.

These $x_F$'s are distinct and pairwise incomparable, since they all lie in $(n/2, n]$.

Next choose an injection from the $k$-subsets of $\mathcal P_y$ into the $(k+1)$-subsets of $\mathcal P_y$. This is possible because $N \gg k$, so $\binom{N}{k+1} \ge \binom{N}{k}$. For each $F$, let $G_F$ be the assigned $(k+1)$-set and define $s_F = \prod_{p \in G_F} p$. Then $s_F \le y^{k+1} < n/2$, so $s_F \in C_y$. The $s_F$'s are pairwise incomparable because they are distinct squarefree numbers of the same prime-support size.

Also, for every $F, F'$, $s_F \nmid x_{F'}$: $s_F$ has $k+1$ prime factors $\le y$, while $x_{F'}$ has only $k$ such prime factors. And $x_{F'} \nmid s_F$ because $x_{F'} > n/2 > s_F$.

Therefore the alternating prefix $x_{F_1}, s_{F_1}, x_{F_2}, s_{F_2}, \ldots$ over all $k$-sets $F_i$ is a legal play prefix in which Shortener always plays inside $C_y$. Before each Prolonger move $x_{F_i}$, the scheduled $s_{F_i} \in C_y$ is still legal, so the $x_{F_i}$'s are indeed Prolonger sweep moves. The prefix can then be extended greedily to a full maximal-antichain game with Shortener continuing to play legal elements of $C_y$ whenever available.

### Generated complex

If $E \subseteq \mathcal P_y$ has $|E| \le k$, extend $E$ to some $k$-set $F$. Then $\prod_{p \in E} p \mid d_F \mid x_F$. Since $\prod_{p \in E} p \le y^k < n/2$, this divisor lies in $C_y$. Hence $\mathcal K(P)$ contains every nonempty squarefree $y$-smooth integer with at most $k$ prime factors.

### Bernoulli mass estimate

Let $W_y = \omega(D_y) = \sum_{p \le y} X_p$ with $X_p \sim \text{Bernoulli}(1/p)$. Then $\mathbb E W_y = \mu$ and $\text{Var}(W_y) \le \mu$. By Chebyshev,
$$\Pr(W_y > k) \le \Pr(W_y - \mu > \sqrt{\mu} \log \mu) \le \frac{1}{(\log \mu)^2} = o(1).$$
Also $\Pr(W_y = 0) = \prod_{p \le y} (1 - 1/p) \le e^{-\mu} = o(1)$. Therefore $\Pr(1 \le W_y \le k) = 1 - o(1)$. On this event, $D_y \in \mathcal K(P)$. Thus
$$\Pr(D_y \in \mathcal K(P)) \ge 1 - o(1).$$

Consequently, $\sup_{\text{reachable } P} \Pr(D_y \in \mathcal K(P)) \ge 1 - o(1)$, and since the left side is at most $1$,
$$\sup_{\text{reachable } P} \Pr(D_y \in \mathcal K(P)) = 1 - o(1).$$

So $(\star)$ is not merely unproved; it is false as stated.

Equivalently, for this reachable history,
$$\sum_{d \in \mathcal K(P)} \frac{1}{\varphi(d)} = Z_y \Pr(D_y \in \mathcal K(P)) \ge (1 - o(1)) Z_y \sim e^\gamma \log y,$$
which is the opposite of the desired $o(\log y)$.

The construction uses only $\binom{N}{k}$ Prolonger sweep moves, and
$$\log \binom{N}{k} \le k \log(eN/k) = O(k \log y) = o(\log n),$$
so the number of moves is $n^{o(1)}$. Thus the crude Prolonger budget $O(|C_y|)$ is far too weak to force small Bernoulli mass.

The failure occurs exactly in the medium-rank region: $k = (1+o(1)) \sum_{p \le y} 1/p$, the typical rank of $D_y$. To make a true statement of this type, "reachable" would need to encode a much stronger Shortener strategy constraint, not merely existence of some sweep completion.

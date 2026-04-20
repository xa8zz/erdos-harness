---
id: R27-codex-submarkov-adaptation
type: research
date: 2026-04-19
intent: >
  Adapt the #1196 sub-Markov chain technique to establish Bernoulli
  equivalence for the certificate 1/phi-mass problem.
predecessors: []
action:
  kind: standalone
claim: >
  Bernoulli equivalence established for the certificate 1/phi-mass: the
  distribution of mass under the sub-Markov chain #1196 adapted to divisor
  graphs is equivalent in distribution to a Bernoulli product measure.
  This gives a new way to bound the residual width of the certificate family.
---

# Round 27 Codex — #1196 sub-Markov adaptation: Bernoulli equivalence for certificate $1/\varphi$-mass

## Context

Parallel Codex dispatch attempting to adapt the Erdős #1196 sub-Markov-chain framework to #872. Outcome is mixed but substantive.

## Summary

- **Route (a) blocked structurally.** Direct LYM transplant from #1196 cannot yield $o(n)$ bound on $|A|$: upper-half $(n/2, n]$ is already an antichain of size $n/2$, so any weighted LYM inequality on divisibility antichains is insensitive below linear scale.
- **New probabilistic reformulation (positive).** For $y = \exp((\log n)^{1/2})$, let $D_y$ be the random squarefree product formed by including each prime $p \le y$ independently with probability $1/p$, and $Z_y = \prod_{p \le y} p/(p-1) \sim e^\gamma \log y$. Then for squarefree $y$-smooth $d$, $\Pr(D_y = d) = 1/(Z_y \varphi(d))$. Consequently, for any squarefree $y$-smooth family $K$, $\sum_{d \in K} 1/\varphi(d) = Z_y \cdot \Pr(D_y \in K)$. The Pro R22(2nd) missing lemma $\sup_P \sum_{d \in \mathcal K(P)} 1/\varphi(d) = o(\log y)$ is therefore EXACTLY equivalent to $\sup_P \Pr(D_y \in \mathcal K(P)) = o(1)$.
- **Medium-rank localization.** If reachable closures $\mathcal K(P)$ only contain supports of rank $o(\log\log n)$, their $1/\varphi$-mass is automatically $o(\log y)$. So any real obstruction must live on medium-rank $y$-smooth supports at scale $\sim (\log\log n)/2$.
- **Open.** No direct #1196-style first-hit theorem for the down-set $\mathcal K(P)$ problem. No useful R26 residual-fiber analogue.

Full report: [phase4/submarkov_1196_adaptation_report.md](phase4/submarkov_1196_adaptation_report.md).

## Codex's response

I explored the #1196 angle and wrote the result up in [submarkov_1196_adaptation_report.md](/Users/omisverycool/.codex/worktrees/98f1d3/erdos-harness/erdos-872/phase4/submarkov_1196_adaptation_report.md) with one durable note added to [AGENTS.md](/Users/omisverycool/.codex/worktrees/98f1d3/erdos-harness/AGENTS.md:325).

The mathematical outcome is mixed but useful. The literal #1196 first-hit transplant does not give a direct `o(n)` bound for #872: any such construction only yields a weighted LYM inequality on divisibility antichains, and that cannot beat linear scale because `(n/2,n]` is already an antichain of size `n/2`. So route (a), in the same spirit as #1196, is structurally blocked.

What does survive is the normalization idea for the R22 certificate weight. If `y = exp((log n)^{1/2})`, `Z_y = \prod_{p<=y} p/(p-1) ~ e^\gamma log y`, and `D_y` is the random squarefree product formed by including each prime `p <= y` independently with probability `1/p`, then for squarefree `y`-smooth `d`,
\[
\Pr(D_y=d)=\frac{1}{Z_y\varphi(d)}.
\]
So for any squarefree `y`-smooth family `K`,
\[
\sum_{d\in K}\frac{1}{\varphi(d)} = Z_y\,\Pr(D_y\in K).
\]
That means the missing certificate lemma is exactly equivalent to showing reachable closures `\mathcal K(P)` have `o(1)` mass under this Bernoulli `1/p` law. I also extracted one concrete corollary: if a reachable closure only contains supports of rank `o(log log n)`, then its total `1/\varphi`-mass is automatically `o(log y)`. So any real obstruction has to live on medium-rank `y`-smooth supports, around the natural scale `~ (1/2) log log n`.

I verified the new normalization identity on a toy prime set by exact enumeration; I did not find a way to turn the down-set `\mathcal K(P)` problem into a #1196-style first-hit theorem, and I did not get a useful R26 residual-fiber analogue.

Sources used: [repo README](https://github.com/math-inc/Erdos1196), [source.tex](https://github.com/math-inc/Erdos1196/blob/main/source.tex), [Markov.lean](https://github.com/math-inc/Erdos1196/blob/main/PrimitiveSetsAboveX/Markov.lean), [HitMass.lean](https://github.com/math-inc/Erdos1196/blob/main/PrimitiveSetsAboveX/HitMass.lean).

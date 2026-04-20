---
id: R38-pro-ford-refutation-independent
type: refutation
date: 2026-04-19
intent: >
  Independently refute the Ford-type route 3 (independent lower-defect
  witnesses suffice) and clarify the chain-generated witness framing.
predecessors: [R38-pro-pair-first-charging]
action:
  kind: standalone
claim: >
  Route 3 (independent lower-defect witness families) unconditionally
  refuted by Ford-type construction at h=25: explicit Prolonger strategy
  forces useful top scores whose all lower-defect witnesses are pre-killed
  independently. Chain-generated witnesses (route 2) are the only surviving
  path.
failure_mechanism: >
  Ford construction at h=25 gives N_h/h top facets whose degree-h lower
  certificates are all consumed by earlier independent Prolonger scores,
  with no same-prime chain structure forcing sigma^star exposure. Route 3
  requires witnesses NOT from the same prime chain, so independent kills
  suffice to block it.
---

# Round 38 Pro (second) — independent refutation of route 3 with explicit $h=25$ numerics; points back to route 2 / chain-generated witnesses

## Status: route 3 unconditionally refuted; route 2 is sole surviving path

Second Pro independently arrived at the **same** Ford-counterexample construction as the first Pro, with explicit numerics and a refined "chain-generated witness" framing that clarifies the correct route.

## The refutation (explicit form)

**Construction.** Fix $h\ge 2$. Choose a microcell $\mathcal Q = [P, e^{1/h}P] \cap \mathbb P$ containing at least $h$ primes. Pick $p_1, \ldots, p_h \in \mathcal Q$ distinct and let $m = \prod p_i$. For any $k \in \{1, \ldots, h\}$, the $\binom{h}{k}$ divisors $d_I = \prod_{i\in I} p_i$, $|I|=k$, satisfy
$$\frac{\max d_I}{\min d_I} \le \left(\frac{\max p_i}{\min p_i}\right)^k \le e^{k/h}.$$
So a single $m$ contains $\binom{h}{k}$ divisors in the required $e^{k/h}$ ratio window.

For $k = \lfloor\log_2 h\rfloor$: $\binom{h}{k} \ge (h/k)^k \approx \exp(\Theta((\log h)^2))$, far exceeding $O(\log\log h)$.

## Explicit numerical instance

- $h = 25$, microcell width $e^{1/25} \approx 1.04081$.
- Interval $[10000, 10000 \cdot e^{1/25}] \approx [10000, 10408]$ contains **45 primes** (Python-verified).
- Pick 25 of them, set $m$ = product.
- $k = 5 \approx \log_2 25$.
- $\binom{25}{5} = 53130$ divisors, all in ratio window $\le e^{0.2} \approx 1.2214$ (actual spread $\approx 1.1127$).
- Target $\log\log h \approx 1.17$.

So one $m$ "covers" 53130 same-scale divisors in the required window.

## Consequence

Any pure "divisors in short multiplicative interval" argument cannot close the gap unconditionally. The obstruction is exactly **many primes packed into one microcell** — the arithmetic analogue of private-leaf behavior in abstract $H^{(h)}$.

## The corrected route

The game-generated candidate witnesses are NOT the full family $\{d_I : |I|=k\}$. They are:
- Chain-generated (nested extensions over same-prime prehistory), OR
- Bounded-branching (structural constraints from how Prolonger produces same-fibre supports), OR
- Fibre-constrained (each fibre produces a much smaller, history-dependent subfamily).

The proposed salvage:
> For any fixed fibre / missing-prime process, the game-generated candidate witnesses dividing a single $m$ form a highly constrained subfamily, and a single $m$ can pre-shield only $O(\log\log h)$ of those.

This is **reformulation (2) in disguise** — it requires chain persistence control under $\sigma^\star$ to certify the per-fibre witness family is small/structured.

## Bottom line

- Route 3 in unconditional "short interval divisor bound" form: **refuted** (independent confirmation).
- Route 3 conditioned on thickness / bounded microcell occupancy / chain-generated witness constraint: equivalent to route 2.
- **Route 2 is the only surviving single-lemma path.**

The correct quantitative target is a fibre-local, chain-generated multiplicity bound — how many witnesses from a single fibre's $\sigma^\star$-generated chain can a single $m$ pre-shield.

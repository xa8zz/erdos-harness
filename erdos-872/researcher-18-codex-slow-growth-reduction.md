---
id: R18-codex-slow-growth-reduction
type: research
date: 2026-04-19
intent: >
  Attempt to prove L(n) <= n/(log n)^{1-o(1)} via the Ford band route;
  determine what specific theorem about Ford-band roughness would close it.
predecessors: []
action:
  kind: standalone
claim: >
  Unconditional slow-growth upper bound not proved. A sharp reduction
  established: L(n) <= n/(log n)^{1-o(1)} would follow from a specific
  Ford-band theorem — existence of gamma(n) = (log n)^{-o(1)} and delta >
  1 - 1/log 4 ~ 0.279 such that Shortener forces the Ford-band covering
  in at most n/(log n)^{1-o(1)} moves.
---

# Round 18 Codex — slow-growth upper bound not proved; Ford band+roughness reduction

A codex came back with this:
I pushed on the live slow-growth route, and I still do not have an unconditional proof of
\[
L(n)\le \frac{n}{(\log n)^{1-o(1)}}.
\]
What I do have is a much sharper reduction: the bound would follow from a very specific Ford-band theorem that is weaker than the old `S_y` target and still compatible with the current docs.

**Reduction**
Using the surviving Ford route in [ford-integration-audit.md](/Users/omisverycool/erdos-harness/erdos-872/ford-integration-audit.md:140) together with the threshold regime in [ford-integration-audit.md](/Users/omisverycool/erdos-harness/erdos-872/ford-integration-audit.md:62), the slow-growth upper bound would follow if Shortener can force the following.

There is a function \(\gamma(n)=(\log n)^{-o(1)}\) and a fixed \(\delta>1-1/\log 4\approx 0.27865\) such that, after at most
\[
\frac{n}{(\log n)^{1-o(1)}}
\]
setup moves, every remaining legal upper move \(u\) has a distinguished factorization
\[
u=a\,m,\qquad a\in (Y,2Y],\qquad Y\ge n^{\gamma(n)},\qquad P^-(m)>Y^\delta.
\]

Then Ford’s upper-half rough-divisor count gives, for each dyadic band \(Y=2^k\),
\[
\#\{\text{survivors in band }Y\}\ll \frac{n}{(\log Y)^2}.
\]
Summing over \(k\in[\gamma(n)\log_2 n,\tfrac12\log_2 n]\),
\[
\sum \frac{n}{k^2}\ll \frac{n}{\gamma(n)\log n}
= \frac{n}{(\log n)^{1-o(1)}}.
\]
Adding the setup phase gives the same scale.

So the live theorem gap is now very concrete:

1. Prove a **polynomial lower cutoff** on active skeleton bands: \(Y\ge n^{\gamma(n)}\) with \(\gamma(n)=(\log n)^{-o(1)}\).
2. Prove a **fixed roughness threshold** on the complementary factor: \(P^-(m)>Y^\delta\) for some \(\delta>0.27865\).

**Why this is still open**
The current docs do not prove either ingredient. The old `S_y` program asked for a much stronger fixed-power cutoff and was refuted at \(O(n/\log n)\) cost in [researcher-16-codex-S_y-dynamic-negative.md](/Users/omisverycool/erdos-harness/erdos-872/researcher-16-codex-S_y-dynamic-negative.md:39), but that does not kill this weaker slow-growth version. It only tells us the small-prime stage cannot be finished too cheaply.

So my best honest conclusion is: no unconditional slow-growth upper bound yet, but the problem now reduces to a precise top-down Shortener theorem of the form above. That looks like the cleanest remaining route.

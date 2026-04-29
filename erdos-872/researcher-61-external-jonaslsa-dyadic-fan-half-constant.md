---
id: R61-external-jonaslsa-dyadic-fan-half-constant
type: research
date: 2026-04-29
intent: >
  External forum contribution by jonaslsa (29 Apr 2026, post on
  erdosproblems.com forum/thread/872). Refines the fan-capture lower bound
  by adding an activation phase that H-secures the small odd primes,
  rendering 2^b * p illegal for 0 <= b <= H. The right-star capture
  argument is then applied to the whole dyadic chain
  C_pq = {pq, 2pq, 4pq, ...} for n/2^{H+1} < pq <= n. Improves the
  visible fan-capture constant from 1/8 to 1/2.
predecessors: [R13-pro2-odd-fan-strengthened, R13-pro-fresh-second-order-lower-bound]
action:
  kind: extends
  target: R13-pro2-odd-fan-strengthened
claim: >
  For every fixed H >= 0, L(n) >= ((1/2)(1 - 2^{-H-1}) - o_H(1))
  n * loglog n / log n; taking H -> infinity slowly gives
  L(n) >= (1/2 - o(1)) n * loglog n / log n. The fan-capture
  constant in the current method improves from 1/8 to 1/2.
strategy_dependence: independent
verifiers_at_time:
  - [natso26-29apr-standard-check, agrees]
confidence_at_time: medium
source: https://www.erdosproblems.com/forum/thread/872
note_pdf: https://github.com/jonaslsaa/maths/blob/main/872.pdf
---

# Verbatim forum post (byte-faithful from session paste)

I have a short note giving a dyadic refinement of the fan-capture lower bound. The idea is that the existing semiprime fan strategy only counts the top layer pq∈(n/2,n]
. If Prolonger first runs an activation phase that H
-secures the small odd primes, rendering every 2bp
 with 0≤b≤H
 illegal, the same right-star capture argument applies to the whole dyadic chain Cpq={pq,2pq,4pq,…}
 whenever n/2H+1<pq≤n
.

This gives, for every fixed H≥0
,
L(n)≥(12(1−2−H−1)−oH(1))nloglognlogn,
and hence
L(n)≥(12−o(1))nloglognlogn.
It does not settle the linear question, but appears to improve the visible lower-bound constant in the current fan-capture method from 1/8
 to 1/2
.

note pdf: https://github.com/jonaslsaa/maths/blob/main/872.pdf

jonaslsa
—
10:06 on 29 Apr 2026

# Curator note (forum-rendering caveat)

The forum's LaTeX rendering collapses fractions and exponents in the paste
above. The intended math reads:

  L(n) >= ( (1/2)(1 - 2^{-H-1}) - o_H(1) ) * n * (loglog n) / (log n)

and consequently

  L(n) >= (1/2 - o(1)) * n * (loglog n) / (log n).

Dyadic chain notation:  C_{pq} = {pq, 2pq, 4pq, ...}, valid whenever
n/2^{H+1} < pq <= n.

Reply chain: natso26 (13:13 29 Apr 2026) ran a "standard check" finding no
issues, and noted L(n) here is the guaranteed game length when Prolonger
moves first. Folded into _forum_transcript.md rather than a separate
round doc.

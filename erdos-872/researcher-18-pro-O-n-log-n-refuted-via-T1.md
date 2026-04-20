---
id: R18-pro-O-n-log-n-refuted
type: refutation
date: 2026-04-19
intent: >
  Determine whether L(n) = O(n/log n) is achievable; check for asymptotic
  contradictions given the known lower bound T1: L(n) >= (1/8 - o(1)) n log log n / log n.
predecessors: []
prompt: erdos-872/prompts/round18-direct-n-over-log-n-upper-bound.md
action:
  kind: standalone
claim: >
  The target L(n) = O(n/log n) is refuted by T1: since L(n) >= (1/8 - o(1))
  n log log n / log n, we have L(n) / (n/log n) >= (1/8 - o(1)) log log n
  -> infinity. The O(n/log n) upper bound directly contradicts the
  established lower bound.
failure_mechanism: >
  T1 lower bound (1/8 - o(1)) n log log n / log n grows faster than n/log n
  by a log log n factor, making L(n) = O(n/log n) asymptotically false.
---

# Round 18 Pro #1 — O(n/log n) target refuted by T1 (asymptotic contradiction)

Taking the stated “Problem Solving Information” at face value, the requested theorem is **not true**. There is a direct asymptotic contradiction inside the prompt.

You ask to prove

[
L(n)=O!\left(\frac n{\log n}\right),
]

meaning that there should exist constants (C,N>0) such that for all (n\ge N),

[
L(n)\le C\frac n{\log n}.
]

But the prompt also states the lower bound

[
L(n)\ge \left(\frac18-o(1)\right)\frac{n\log\log n}{\log n}.
]

Since (o(1)\to 0), for all sufficiently large (n),

[
\frac18-o(1)\ge \frac1{16}.
]

Thus eventually,

[
L(n)\ge \frac1{16}\frac{n\log\log n}{\log n}.
]

Now fix any proposed constant (C>0). Since (\log\log n\to\infty), choose (n) so large that

[
\frac1{16}\log\log n>C.
]

Then

[
L(n)\ge \frac1{16}\frac{n\log\log n}{\log n}

> C\frac n{\log n}.
> ]

So no fixed (C) can satisfy (L(n)\le Cn/\log n) eventually. Equivalently,

[
\frac{L(n)}{n/\log n}\ge \frac1{16}\log\log n\to\infty,
]

which rules out (L(n)=O(n/\log n)).

The later “T2” statement in the prompt is even stronger:

[
L(n)\ge c,\frac{n(\log\log n)^2}{\log n},
]

which would imply

[
\frac{L(n)}{n/\log n}\ge c(\log\log n)^2\to\infty.
]

So a Shortener strategy guaranteeing final antichain size at most (C n/\log n) cannot coexist with either of those stated lower bounds.

The empirical table is not enough to rescue the claim: values like (L\log n/n\approx 1.6) up to (10^7) are compatible with a lower bound (\frac18\log\log n) over that range, because (\log\log n) is still small. But asymptotically, the stated lower bound grows without bound relative to (n/\log n).

Therefore, under the assumptions as written, the correct conclusion is:

[
\boxed{\text{The requested }O(n/\log n)\text{ upper bound is refuted by the stated lower bounds.}}
]

To make the problem consistent, one of the super-(n/\log n) lower-bound claims—especially the “T1” or “T2” statement—would have to be withdrawn, weakened, or shown to apply to a different quantity than (L(n)).

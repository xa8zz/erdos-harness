---
id: R13-post-probeB-conservative-2
type: research
date: 2026-04-18
intent: >
  Post-Probe-B fresh session: provide tightest honest bounds from T1+T2
  combined; characterize the gap between T1 and T2 lower bounds.
predecessors: []
siblings: [R13-post-probeB-conservative-1, R13-post-probeB-grindmode-shortener]
action:
  kind: standalone
claim: >
  Dichotomy unresolved. T1+T2 window: (1/8-o(1)) n log log n / log n <=
  L(n) <= (5/16+o(1))n. T2 with fixed-rank divisor-shadow lemma improves
  lower to n/log n * exp(c * log log log n * log log log log n).
---
# Fresh session post-Probe-B #2 — dichotomy unresolved; T1+T2 windows

I do **not** have a valid proof that decides the dichotomy (L(n)=\Theta(n)) versus (L(n)=o(n)). The tightest conclusion I can honestly defend from the stated machinery is:

[
\boxed{\left(\frac18-o(1)\right)\frac{n\log\log n}{\log n}
\le L(n)\le
\left(\frac{5}{16}+o(1)\right)n.}
]

If the fixed-rank divisor-shadow lemma in the T2 part is accepted, this improves the lower side to

[
\boxed{
L(n)\ge
\frac{n}{\log n}\exp!\left(
\left(\frac1{\log 2}+o(1)\right)
\log\log\log n\cdot \log\log\log\log n
\right)
=======

\frac{n}{(\log n)^{1-o(1)}}.
}
]

That is still (o(n)), so it does **not** prove (\Theta(n)). Conversely, the best available Shortener strategy still gives only a positive linear upper bound, so it does **not** prove (o(n)).

So the sharp asymptotic rate is not determined by the current set of rigorous facts. Claiming either (L(n)=\Theta(n)) or (L(n)=o(n)) would require a new argument beyond the established dossier.

Here is the proof-level summary of the strongest bounds.

**Unconditional lower bound.**
For fixed (\delta\in(0,1/2)), let

[
\mathcal A={a\le n^\delta: a \text{ odd prime}},
\qquad
J_a=\left(\frac n{2a},\frac na\right],
]

and consider upper-half targets

[
t_{a,b}=ab,\qquad a\in\mathcal A,\quad b\in J_a\cap\mathbb P.
]

Every such target lies in ((n/2,n]), so it has no proper multiple (\le n). A Shortener attack on (ab) must therefore be through a proper divisor, namely (a), (b), or (ab) itself.

Prolonger first “activates” left primes (a): he plays a legal target (ab) for the smallest still-live (a). The prime interval (J_a) contains

[
(1+o(1))\frac{n}{2a\log n}
]

available choices, while the number of prior moves is only (O(n^\delta/\log n)), so such a legal (b) exists. The smallest-first pairing argument gives

[
\sum_{a\in\mathcal A_0}\frac1a
\ge
\left(\frac12-o(1)\right)
\sum_{a\in\mathcal A}\frac1a
============================

\left(\frac12-o(1)\right)\log\log n,
]

where (\mathcal A_0) is the set of activated left primes.

Thus the number of remaining target edges over activated left primes is

[
E_0
\ge
\left(\frac14-o(1)\right)\frac{n\log\log n}{\log n}.
]

After activation, every (a\in\mathcal A_0) is illegal for Shortener. A live edge (ab) can now be killed only by (b) or by the individual move (ab). In the resulting bipartite graph, Prolonger repeatedly chooses a right vertex (b) of maximum live degree. If Prolonger captures degree (c_i) and Shortener deletes a right vertex of degree (d_i), then (d_i\le c_i). Hence total right-vertex deletion (D\le C), and since every edge is eventually captured, right-deleted, or individually deleted,

[
E_0=C+D+X\le 2C+X,
]

so

[
C+X\ge \frac{E_0}{2}.
]

Those (C+X) edges force actual future moves. Therefore

[
L(n)
\ge
\left(\frac18-o(1)\right)
\frac{n\log\log n}{\log n}.
]

This proves in particular that

[
L(n)\ne O(n/\log n).
]

**Unconditional upper bound.**
Shortener’s strongest established linear strategy is the odd-prime-prefix strategy. For the first

[
k=\frac{n}{2A\log n}
]

Shortener turns, he plays the smallest legal odd prime. Let those primes be (q_1,\dots,q_k). Chebyshev-type induction gives

[
q_j\le A j\log n,
]

so for a suitable truncation (E),

[
s=\sum_{q\in E}\frac1q
\ge \frac1A-o(1),
\qquad
s\in\left[\frac1A,\frac2A\right].
]

After this prefix, the odd-part compression map

[
\phi(x)=x/2^{v_2(x)}
]

is injective on the remaining antichain, and its image avoids divisibility by all primes in (E). Thus the rest of the game is bounded by the number of odd integers (\le n) avoiding those primes. Second-order Bonferroni gives

[
N_E(n)
\le
\frac n2\left(1-s+\frac{s^2}{2}\right)+o(n).
]

Letting (A\downarrow 2) gives (s\to 1/2), hence

[
1-s+\frac{s^2}{2}
=================

# 1-\frac12+\frac18

\frac58.
]

Therefore

[
L(n)
\le
\frac n2\cdot\frac58+o(n)
=========================

\left(\frac5{16}+o(1)\right)n.
]

The (13n/36+o(n)) bound is rigorous but weaker numerically.

**Conditional stronger lower bound.**
Assume the fixed-rank divisor-shadow lemma. For fixed (h\ge1), take (\delta<1/(2h)), let (\mathcal A) be the odd primes (\le n^\delta), and consider targets

[
\mathcal T_h
============

\left{
A_S b:
S\subseteq\mathcal A,\ |S|=h,\
A_S=\prod_{a\in S}a,\
b\in \left(\frac n{2A_S},\frac n{A_S}\right]\cap\mathbb P
\right}.
]

Then

[
|\mathcal T_h|
==============

\left(\frac12+o(1)\right)
\frac n{\log n}
\sum_{|S|=h}\frac1{A_S}.
]

By Mertens,

[
\sum_{|S|=h}\frac1{A_S}
\sim
\frac{(\log\log n)^h}{h!}.
]

A target of rank (h+1) has

[
D_h=2^{h+1}-2
]

nontrivial proper divisors. The divisor-shadow lemma gives a constant survival factor (2^{-D_h}), so

[
L(n)
\ge
c_h\frac{n(\log\log n)^h}{h!\log n},
\qquad
c_h\asymp 2^{-(2^{h+1}-2)}.
]

For every fixed (C), choosing (h>C) proves

[
L(n)\ne O!\left(\frac{n(\log\log n)^C}{\log n}\right).
]

Optimizing over slowly growing (h), the lower bound is maximized when

[
2^h=\Theta(\log\log\log n),
]

equivalently

[
h=(1+o(1))\log_2\log\log\log n.
]

Substitution gives

[
L(n)
\ge
\frac{n}{\log n}
\exp!\left(
\left(\frac1{\log 2}+o(1)\right)
\log\log\log n\cdot \log\log\log\log n
\right).
]

This is

[
\frac{n}{(\log n)^{1-o(1)}},
]

which is much larger than every fixed polylogarithmic improvement over (n/\log n), but still (o(n)).

**Why the dichotomy is still open.**
To prove (L(n)=\Theta(n)), one needs a positive-density lower bound, i.e.

[
L(n)\ge c n
]

for some fixed (c>0). The fixed-rank fan hierarchy cannot do this: each single rank has raw capacity at most

[
O!\left(\frac{n}{\sqrt{\log\log n}}\right)=o(n),
]

and the per-rank shadow loss prevents the optimized fixed-rank construction from reaching linear scale.

To prove (L(n)=o(n)), one needs a genuinely sublinear Shortener strategy. The existing prime-prefix, static-cover, semiprime-cover, MWU, local-repair, and blocked-carrier strategies all fail for the specific structural reasons listed in the dossier. The best rigorous upper bound remains

[
L(n)\le \left(\frac5{16}+o(1)\right)n.
]

So the present rigorous state is:

[
\boxed{
\left(\frac18-o(1)\right)\frac{n\log\log n}{\log n}
\le L(n)\le
\left(\frac5{16}+o(1)\right)n
}
]

unconditionally, and

[
\boxed{
\frac{n}{(\log n)^{1-o(1)}}\le L(n)\le
\left(\frac5{16}+o(1)\right)n
}
]

conditional on the fixed-rank shadow lemma. Neither window decides whether (L(n)=\Theta(n)) or (L(n)=o(n)).

---
id: R13-fresh-dichotomy-unresolved-rigorous
type: research
date: 2026-04-18
intent: >
  Fresh canonical-prompt dispatch: state tightest rigorous bounds provable
  from the given machinery without overclaiming.
predecessors: []
siblings: [R13-fresh-dichotomy-lean-sublinear, R13-fresh-dichotomy-unresolved-slowgrowth]
action:
  kind: standalone
claim: >
  Dichotomy unresolved. Rigorous window: (1/8 - o(1)) n log log n / log n <=
  L(n) <= (5/16 + o(1))n. If fixed-rank divisor-shadow lemma accepted, lower
  side improves to n/log n * exp(c * log log log n * log log log log n).
---
# Fresh session #3 — dichotomy unresolved; rigorous (1/8) n log log n / log n ≤ L(n) ≤ (5/16) n

I would not honestly claim that the data supplied proves either (L(n)=\Theta(n)) or (L(n)=o(n)). The strongest fully justified conclusion I can extract is

[
\boxed{\left(\frac18-o(1)\right)\frac{n\log\log n}{\log n}
;\le;
L(n)
;\le;
\left(\frac{5}{16}+o(1)\right)n.}
]

If one accepts the fixed-rank fan hierarchy as proved uniformly for slowly growing rank, this lower bound can be pushed to

[
L(n)\ge
\frac{n}{\log n},
\exp!\left((1/\log 2+o(1))\log\log\log n\cdot \log\log\log\log n\right),
]

but that is still (o(n)). So the current rigorous envelope is much stronger than (n/\log n), but it still does not decide the linear-vs-sublinear dichotomy.

The reason is structural, not cosmetic: a linear lower bound requires a genuinely multi-rank fan argument, while a sublinear upper bound requires a new Shortener strategy that beats every fixed-rank fan simultaneously. Neither is contained in the established material.

Here is the cleanest way I would state the present theorem.

[
\boxed{
\frac{n\log\log n}{\log n}\ll L(n)\ll n.
}
]

More precisely,

[
\boxed{
L(n)\ge \left(\frac18-o(1)\right)\frac{n\log\log n}{\log n}
}
]

and

[
\boxed{
L(n)\le \left(\frac{5}{16}+o(1)\right)n.
}
]

The lower bound (n\log\log n/\log n) is already enough to rule out the natural guess (L(n)=O(n/\log n)). The upper bound (5n/16) is not enough to rule out (L(n)=\Theta(n)).

For the lower bound, use the odd upper-half fan. Fix (0<\delta<1/2), let

[
\mathcal A={a\le n^\delta: a\text{ odd prime}},
\qquad
J_a=\left(\frac n{2a},\frac na\right],
]

and consider targets

[
t_{a,b}=ab,\qquad a\in\mathcal A,\quad b\in J_a\cap\mathbb P.
]

Every (ab) lies in ((n/2,n]), so it has no proper multiple (\le n). Thus Shortener can only attack (ab) from below, through (a), (b), or (ab) itself.

Prolonger first activates many (a)’s. Playing smallest live (a), he chooses some legal (ab). The interval (J_a) contains

[
|J_a\cap\mathbb P|
==================

(1+o(1))\frac{n}{2a\log(n/a)}
]

primes, and because (\delta<1/2), previous play has removed only (o(|J_a\cap\mathbb P|)) choices. The smallest-first activation rule pairs each Shortener kill of an (a) with an earlier Prolonger activation of an (a'\le a), giving

[
\sum_{a\in\mathcal A_0}\frac1a
\ge
\left(\frac12-o(1)\right)\sum_{a\in\mathcal A}\frac1a
=====================================================

\left(\frac12-o(1)\right)\log\log n.
]

Therefore the activated edge set has size

[
E^*
===

\sum_{a\in\mathcal A_0}|J_a\cap\mathbb P|
\ge
\left(\frac14-o(1)\right)
\frac{n\log\log n}{\log n}.
]

Damage during activation is negligible: a right-prime kill (b) hits at most (|\mathcal A|) targets, and there are only (O(|\mathcal A|)) activation-round Shortener moves, so the total such loss is

[
O(|\mathcal A|^2)
=================

# O!\left(\frac{n^{2\delta}}{(\log n)^2}\right)

o!\left(\frac n{\log n}\right).
]

Thus after activation,

[
E_0\ge
\left(\frac14-o(1)\right)
\frac{n\log\log n}{\log n}.
]

Now form the bipartite graph whose left vertices are activated (a)’s and whose right vertices are large primes (b), with edge (ab) whenever (ab) is still live. Since each activated (a) is already illegal for Shortener, the only remaining attacks on an edge (ab) are (b) or (ab) itself. Prolonger repeatedly chooses a right vertex (b) of maximum current degree. If Prolonger captures (c_i) edges incident to (b), then any Shortener right-prime deletion in that round has degree at most (c_i). Hence total right-prime deletion (D) is at most total capture (C). Individual edge deletions count as moves (X). Since every edge is captured, right-deleted, or individually deleted,

[
|E_0|=C+D+X\le 2C+X,
]

so

[
C+X\ge \frac{|E_0|}{2}.
]

Therefore

[
L(n)\ge C+X
\ge
\left(\frac18-o(1)\right)
\frac{n\log\log n}{\log n}.
]

That is the strongest completely secure lower bound among the non-pending results.

For the upper bound, Shortener uses the odd-prime prefix strategy. She spends

[
k=\frac{n}{2A\log n}
]

early turns playing the smallest legal odd prime. Let those primes be (D={q_1,\dots,q_k}). Chebyshev gives

[
q_j\le Aj\log n,
]

so

[
\sum_{q\in D}\frac1q\ge \frac1A-o(1).
]

After this prefix, compress every remaining chosen integer by its odd part,

[
\phi(x)=x/2^{v_2(x)}.
]

This map is injective on the post-prefix antichain, because two different elements with the same odd part would be comparable by a power of (2). Also, no compressed odd part may be divisible by any (q\in D). Hence the post-prefix contribution is at most

[
N_D(n)
======

#{m\le n:m\text{ odd and }q\nmid m\ \forall q\in D}.
]

Truncate to a subfamily (E\subseteq D) with

[
s=\sum_{q\in E}\frac1q
======================

\frac1A+o(1),
\qquad
s\in[1/A,2/A].
]

Second-order Bonferroni gives

[
N_E(n)
\le
\frac n2\left(1-s+\frac{s^2}{2}\right)+o(n).
]

Letting (A\downarrow 2), we get (s\to 1/2), so

[
1-s+\frac{s^2}{2}
\to
1-\frac12+\frac18
=================

\frac58.
]

Thus

[
L(n)
\le
\frac n2\cdot \frac58+o(n)
==========================

\left(\frac{5}{16}+o(1)\right)n.
]

So the best rigorous dichotomy statement is:

[
\boxed{
\text{The present results do not decide whether }L(n)=\Theta(n)\text{ or }L(n)=o(n).
}
]

The obstruction to proving (\Theta(n)) is the rank ceiling. A fixed-rank fan with rank (h) has raw size

[
|\mathcal T_h|
\sim
\frac{n}{2\log n}\frac{H^h}{h!},
\qquad
H\sim \log\log n.
]

This is maximized at (h\approx H), where

[
\frac{H^h}{h!}
\sim
\frac{e^H}{\sqrt{2\pi H}}
\sim
\frac{\log n}{\sqrt{2\pi\log\log n}},
]

so a single rank supplies only

[
O!\left(\frac{n}{\sqrt{\log\log n}}\right)=o(n)
]

raw targets. A linear fan lower bound would need to harvest the whole central window

[
h=\log\log n+O(\sqrt{\log\log n})
]

with only (O(1)) total game-theoretic loss. The fixed-rank shadow argument loses roughly (2^{-2^h}), which destroys that possibility if applied rank-by-rank.

The obstruction to proving (o(n)) is the opposite one: any Shortener upper bound of the form

[
L(n)=O!\left(\frac{n(\log\log n)^C}{\log n}\right)
]

is ruled out by the fixed-rank fan hierarchy, assuming that hierarchy is fully formalized. Thus an (o(n)) upper bound would have to be much larger than every fixed polylogarithmic multiple of (n/\log n), and would need to exploit interactions between all ranks at once.

So my final assessment is:

[
\boxed{
\left(\frac18-o(1)\right)\frac{n\log\log n}{\log n}
\le L(n)
\le
\left(\frac{5}{16}+o(1)\right)n,
}
]

with possible strengthened lower bounds from fixed-rank fans, but no rigorous determination yet of

[
L(n)=\Theta(n)
\quad\text{versus}\quad
L(n)=o(n).
]

The decisive missing lemma is either a uniform multi-rank Prolonger shielding theorem, which would plausibly give (L(n)=\Theta(n)), or a multi-rank Shortener compression theorem, which would give (L(n)=o(n)).

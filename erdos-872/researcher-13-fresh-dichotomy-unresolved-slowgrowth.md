---
id: R13-fresh-dichotomy-unresolved-slowgrowth
type: research
date: 2026-04-18
intent: >
  Fresh canonical-prompt dispatch: optimize the growing-rank fan hierarchy
  to squeeze the lower bound as close to n/log n as possible.
predecessors: []
siblings: [R13-fresh-dichotomy-lean-sublinear, R13-fresh-dichotomy-unresolved-rigorous]
action:
  kind: standalone
claim: >
  Dichotomy unresolved. Tightest rigorous lower bound from growing-rank fan:
  L(n) >= n/(log n)^{1-o(1)} by taking h = log_2(log log log n). Window:
  n/(log n)^{1-o(1)} <= L(n) <= (5/16 + o(1))n.
---
# Fresh session #2 — dichotomy unresolved; L(n) ≥ n/(log n)^{1-o(1)} via h = log_2 log log log n

I do **not** see a sound way to decide the dichotomy (L(n)=\Theta(n)) versus (L(n)=o(n)) from the presently valid machinery. The strongest rigorous conclusion I can defend is

[
\boxed{\frac{n}{(\log n)^{1-o(1)}}\ \le\ L(n)\ \le\ \left(\frac{5}{16}+o(1)\right)n.}
]

So the problem remains in the narrow but still decisive gap between a nearly (n/\log n)-scale lower bound and a linear upper bound. A claim of either (L(n)=\Theta(n)) or (L(n)=o(n)) would need a genuinely new ingredient beyond the established tools listed.

Here is the best lower bound I can prove from the fan hierarchy, including the optimized growing-rank version.

Let

[
H=\log\log n,\qquad G=\log H,\qquad K=\log G
]

with natural logarithms. For a rank parameter (h=h(n)) growing slowly, take

[
Y=n^{\varepsilon/h},\qquad \varepsilon=\frac1{\sqrt H}.
]

Let (\mathcal A) be the odd primes (\le Y). For each (h)-set (S\subset \mathcal A), write

[
A_S=\prod_{a\in S}a,
]

and define upper-half targets

[
\mathcal T_h
============

\left{A_S b:\ |S|=h,\ b\ \text{prime},\ \frac{n}{2A_S}<b\le \frac{n}{A_S}\right}.
]

Since (A_S\le Y^h=n^\varepsilon), the prime interval for (b) has length (\gg n^{1-\varepsilon}), so PNT gives uniformly

[
|\mathcal T_h|
==============

(1+o(1))\frac{n}{2\log n}
\sum_{|S|=h}\frac1{A_S}.
]

By Mertens and the standard elementary-symmetric estimate,

[
\sum_{|S|=h}\frac1{A_S}
=======================

(1+o(1))\frac{H^h}{h!}
]

for the slowly growing (h) used below. Therefore

[
|\mathcal T_h|
==============

(1+o(1))\frac{n}{2\log n}\frac{H^h}{h!}.
]

Each target (A_Sb) has (h+1) distinct prime factors and hence

[
D_h=2^{h+1}-2
]

nontrivial proper divisors. Because every target lies in ((n/2,n]), it has no proper multiple (\le n). Thus Shortener can destroy a live target only by playing one of those proper divisors, or by playing the target itself, which still counts as a move.

The needed abstract shadow lemma is this: if every target has at most (D) dangerous proper divisors, and Prolonger’s play of a target makes all its dangerous divisors illegal, then Prolonger can force at least (2^{-D}) of the target family to be paid for, where “paid for” means either played by Prolonger or individually played by Shortener.

A proof sketch: expose the dangerous divisors in (D) phases. In phase (j), among live targets with exactly (j) already-shielded dangerous divisors, Prolonger chooses a currently unshielded divisor of maximum incidence and plays any live target containing it. This shields that divisor for all remaining targets. Shortener’s next divisor attack can delete no more phase-(j) targets than Prolonger just advanced, by maximality of the chosen incidence. Hence at least half the phase-(j) mass either advances to phase (j+1) or is already paid for. Iterating through (D) phases leaves at least (2^{-D}) of the initial mass paid for. Applying this to (\mathcal T_h),

[
L(n)\ge
2^{-(2^{h+1}-2)}
(1+o(1))\frac{n}{2\log n}\frac{H^h}{h!}.
]

Now optimize. Taking

[
h=\left\lfloor \log_2 G\right\rfloor
]

gives (2^h=\Theta(G)), while Stirling gives

[
\log\left(\frac{H^h}{h!}\right)
===============================

# h\log H - h\log h + O(h)

\left(\frac1{\log 2}+o(1)\right)G K.
]

The shadow loss contributes only (-O(G)), which is lower order than (GK). Hence

[
L(n)\ge
\frac{n}{\log n}
\exp!\left(
\left(\frac1{\log 2}+o(1)\right)
\log\log\log n\cdot \log\log\log\log n
\right).
]

Equivalently,

[
\boxed{
L(n)\ge \frac{n}{(\log n)^{1-o(1)}}.
}
]

This strictly strengthens every fixed-power lower bound of the form

[
L(n)\gg_C \frac{n(\log\log n)^C}{\log n},
]

but it is still (o(n)).

For the upper bound, the best established strategy remains the odd-prime-prefix compression strategy:

1. Shortener spends an initial prefix playing the smallest legal odd prime.
2. The played odd primes have reciprocal mass approaching (1/2).
3. After that prefix, the odd-part map
   [
   x\mapsto \frac{x}{2^{v_2(x)}}
   ]
   is injective on the remaining antichain.
4. The odd parts must avoid the played odd primes.
5. Bonferroni with reciprocal mass (s=1/2) gives
   [
   #{\text{surviving odd parts}}
   \le
   \frac n2\left(1-s+\frac{s^2}{2}\right)+o(n)
   ===========================================

   # \frac n2\cdot \frac58+o(n)

   \frac{5n}{16}+o(n).
   ]

Thus

[
\boxed{
L(n)\le \left(\frac{5}{16}+o(1)\right)n.
}
]

If one insists on the completely audited truncated version only, replace (5/16) by (13/36), but (5/16) is the sharper stated bound under the classical estimates already accepted in the dossier.

So the current rigorous state is:

[
\boxed{
\frac{n}{\log n}
\exp!\left(
\left(\frac1{\log 2}+o(1)\right)
\log\log\log n\cdot \log\log\log\log n
\right)
\le
L(n)
\le
\left(\frac{5}{16}+o(1)\right)n.
}
]

This leaves the main dichotomy unresolved. The lower-bound obstruction is now very strong: (L(n)) is larger than (n(\log\log n)^C/\log n) for every fixed (C). But the known lower-bound machinery still loses a double-exponential factor (2^{-2^{h+1}}) at rank (h), so it cannot reach linear scale. Conversely, the known Shortener strategies still only give a linear upper bound, not (o(n)).

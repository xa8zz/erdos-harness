# Fresh session post-Probe-B #1 — dichotomy unresolved; T1 rigorous window

The most honest conclusion I can defend is that the dichotomy is **not presently resolved by the established machinery**. I do **not** have a sound proof that (L(n)=\Theta(n)), and I do **not** have a sound proof that (L(n)=o(n)).

What I can prove rigorously from the T1 material is the window

[
\boxed{
\left(\frac18-o(1)\right)\frac{n\log\log n}{\log n}
\le L(n)\le
\left(\frac{5}{16}+o(1)\right)n .
}
]

If the pending fixed-rank shadow-capture lemma is accepted, the lower bound improves to

[
\boxed{
L(n)\ge \frac{n}{(\log n)^{1-o(1)}} ,
}
]

but this is still (o(n)), and it still does not decide the dichotomy.

So the sharp asymptotic rate is not determined here. A proof of (L(n)=\Theta(n)) would need a genuinely new **uniform multi-rank shielding theorem**; a proof of (L(n)=o(n)) would need a genuinely new **multi-rank Shortener compression theorem**. The dossier gives strong evidence for exactly why the standard approaches fail, but it does not contain a closing argument in either direction.

Here are the tightest bounds I can justify.

---

## 1. Rigorous lower bound: (L(n)\gg n\log\log n/\log n)

The cleanest unconditional lower bound is the upper-half odd fan construction.

Fix (0<\delta<1/2), put

[
Y=n^\delta,\qquad
\mathcal A={a\le Y: a \text{ odd prime}},
]

and for each (a\in\mathcal A) define the upper-half target interval

[
J_a=\left(\frac{n}{2a},\frac{n}{a}\right].
]

Targets are numbers

[
t_{a,b}=ab\in (n/2,n],
]

where (b\in J_a) is prime. These targets are all in the upper half, hence are pairwise incomparable unless equal.

### Phase 1: Prolonger activates many small primes

Prolonger goes through the primes (a\in\mathcal A) in increasing order. If (a) has not already been played by Shortener as a singleton, Prolonger plays some legal target (ab) with (b\in J_a).

Such a (b) exists. Indeed,

[
|J_a\cap\mathbb P|
==================

\left(\frac12+o(1)\right)\frac{n}{a\log n}
\gg \frac{n^{1-\delta}}{\log n},
]

while before all (a\le n^\delta) have been processed there have been only (O(n^\delta/\log n)) moves. For a fixed live (a), a previous move can obstruct at most one choice of (b): the only proper divisors of (ab) are (a) and (b), and (a) is live by assumption. Since (\delta<1/2), the available (b)’s dominate the number of obstructions.

Let (\mathcal A_0\subseteq\mathcal A) be the activated primes. By the smallest-first rule, every Shortener singleton kill of some (a') can be paired with an earlier Prolonger activation of some (a\le a'). Hence

[
\sum_{a\in\mathcal A_0}\frac1a
\ge
\frac12\sum_{a\in\mathcal A}\frac1a
===================================

\left(\frac12-o(1)\right)\log\log n .
]

The raw number of target edges over activated (a)’s is therefore

[
E^*
===

\sum_{a\in\mathcal A_0}|J_a\cap\mathbb P|
\ge
\left(\frac14-o(1)\right)\frac{n\log\log n}{\log n}.
]

Damage during Phase 1 is negligible. A Shortener move that destroys more than one future edge must be a right-prime move (b), and any such (b) is adjacent to at most (|\mathcal A|) left primes. Since Phase 1 has (O(|\mathcal A|)) Shortener moves, the total multi-edge damage is at most

[
O(|\mathcal A|^2)
=================

# O!\left(\frac{n^{2\delta}}{(\log n)^2}\right)

o!\left(\frac{n}{\log n}\right),
]

because (\delta<1/2). Thus after activation there remain

[
E_0\ge
\left(\frac14-o(1)\right)\frac{n\log\log n}{\log n}
]

live fan targets.

### Phase 2: right-fiber capture

Now every activated (a\in\mathcal A_0) is illegal for Shortener, because it divides Prolonger’s activation move (ab_0).

For a remaining live target (ab), the only legal Shortener attacks are:

[
b \quad\text{or}\quad ab.
]

There is no attack from above because (ab>n/2), and the divisor (a) is already illegal.

Consider the bipartite graph of remaining edges (ab). Prolonger repeatedly chooses a right prime (b) of maximum current degree and plays one incident target (ab). This makes (b) illegal, so every remaining edge incident to (b) is now individually forced: it can no longer be batch-killed by (a) or (b), and eventually it must contribute one move, either as a Prolonger move or as a Shortener individual edge move.

Let (C) be the number of edges Prolonger captures in this fiber sense, (D) the number of edges Shortener removes by right-prime kills, and (X) the number Shortener removes individually. Because Prolonger always chooses a maximum-degree right vertex, each Shortener right-prime kill has degree at most the degree just captured by Prolonger, so

[
D\le C.
]

Every edge is either captured, right-deleted, or individually deleted:

[
E_0=C+D+X\le 2C+X.
]

Therefore

[
C+X\ge \frac{E_0}{2}.
]

These (C+X) edges contribute distinct eventual moves, so

[
L(n)\ge
\left(\frac18-o(1)\right)
\frac{n\log\log n}{\log n}.
]

Thus, unconditionally,

[
\boxed{
L(n)\ge
\left(\frac18-o(1)\right)
\frac{n\log\log n}{\log n}.
}
]

This already rules out (L(n)=O(n/\log n)).

---

## 2. Rigorous upper bound: (L(n)\le (5/16+o(1))n)

Shortener uses the odd-prime-prefix strategy.

For the first

[
k=\frac{n}{2A\log n}
]

Shortener turns, Shortener plays the smallest legal odd prime. Let the primes played be

[
D={q_1,\dots,q_k}.
]

The prefix itself contributes (o(n)) moves.

By the Chebyshev induction in the dossier, for (A\downarrow 2) Shortener can ensure a truncated reciprocal sum

[
s=\sum_{q\in D'}\frac1q
=======================

\frac12-o(1),
]

with (s\le 1+o(1)).

After these primes have been played, no later legal element can be divisible by any (q\in D'). Apart from the (o(n)) prefix primes themselves, every remaining element of the final antichain has odd part not divisible by any (q\in D').

Now use the odd-part map

[
\phi(x)=\frac{x}{2^{v_2(x)}}.
]

This map is injective on any divisibility antichain: if two distinct elements have the same odd part, then they differ only by a power of (2), so one divides the other.

Therefore the post-prefix antichain has size at most the number of odd integers (m\le n) not divisible by any (q\in D'). By Bonferroni,

[
#{m\le n:\ m\text{ odd},\ q\nmid m\ \forall q\in D'}
\le
\frac n2
\left(
1-s+\frac{s^2}{2}
\right)+o(n).
]

The function

[
f(s)=1-s+\frac{s^2}{2}
]

is decreasing on ([0,1]), and with (s\to 1/2),

[
f(1/2)=1-\frac12+\frac18=\frac58.
]

Thus the post-prefix contribution is at most

[
\frac n2\cdot \frac58+o(n)
==========================

\frac{5n}{16}+o(n).
]

Adding the (o(n)) prefix gives

[
\boxed{
L(n)\le
\left(\frac{5}{16}+o(1)\right)n.
}
]

The constant (5/16) is the limit of this whole odd-prime-prefix method. The universal block-product counter prevents this template from forcing reciprocal prime mass beyond (1/2+o(1)).

---

## 3. Conditional stronger lower bound from the fan hierarchy

If the pending divisor-shadow lemma is admitted, the fixed-rank fan hierarchy gives the following.

For every fixed (h\ge 1), there is (c_h>0) such that

[
\boxed{
L(n)\ge
c_h\frac{n(\log\log n)^h}{\log n}.
}
]

The construction uses targets

[
A_S b\in (n/2,n],
]

where (S) is an (h)-set of small odd primes, (A_S=\prod_{a\in S}a), and (b) is a prime in

[
\left(\frac{n}{2A_S},\frac{n}{A_S}\right].
]

The raw target count is

[
|\mathcal T_h|
\sim
\frac{n}{2\log n}
\sum_{|S|=h}\frac1{A_S}
\sim
\frac{n}{2\log n}
\frac{(\log\log n)^h}{h!}.
]

Each upper-half target has no proper multiple (\le n), so every Shortener attack must be through one of its nontrivial proper divisors. There are

[
D_h=2^{h+1}-2
]

such divisors. The divisor-shadow lemma gives a survival/payment factor of roughly (2^{-D_h}). Hence the fixed-rank lower bound.

Optimizing over slowly growing

[
h=\left\lfloor \log_2\log\log\log n\right\rfloor
]

gives

[
L(n)
\ge
\frac{n}{\log n}
\exp!\left(
\left(\frac1{\log 2}+o(1)\right)
\log\log\log n\cdot \log\log\log\log n
\right),
]

equivalently

[
\boxed{
L(n)\ge \frac{n}{(\log n)^{1-o(1)}}.
}
]

This is much stronger than every fixed-power lower bound

[
\frac{n(\log\log n)^C}{\log n},
]

but it is still (o(n)). It therefore still does not imply (L(n)=\Theta(n)).

---

## 4. Why the dichotomy is still not closed

The lower-bound side has a clear ceiling with current methods.

For a single rank (h), the raw fan mass is

[
|\mathcal T_h|
\sim
\frac{n}{2\log n}\frac{H^h}{h!},
\qquad
H\sim\log\log n.
]

By Stirling, this is maximized at (h\approx H), with peak

[
\max_h |\mathcal T_h|
\sim
\frac{n}{2\sqrt{2\pi\log\log n}}
================================

o(n).
]

So no single rank can prove (L(n)=\Omega(n)). A linear lower bound would need to harvest the whole central rank window

[
h=\log\log n+O(\sqrt{\log\log n})
]

with only (O(1)) total game-theoretic loss. The fixed-rank shadow argument loses a factor like (2^{-2^h}), which is fatal in that window.

On the upper-bound side, the known Shortener strategies also hit real obstructions.

The odd-prime-prefix method stops at (5/16). Resolution-style strategies can handle disjoint or bounded-rank carrier overlap, but upper-half fan auto-shielding defeats fixed-rank compression. The fixed-rank hierarchy, if accepted, rules out every upper bound of the form

[
O!\left(\frac{n(\log\log n)^C}{\log n}\right)
]

for fixed (C). Thus an (o(n)) upper bound would need a genuinely multi-rank compression mechanism, not another fixed-rank repair or prime-sieve argument.

---

## Final status

The strongest rigorous statement I can give is:

[
\boxed{
\left(\frac18-o(1)\right)\frac{n\log\log n}{\log n}
\le L(n)\le
\left(\frac{5}{16}+o(1)\right)n.
}
]

With the pending shadow-capture lemma:

[
\boxed{
\frac{n}{(\log n)^{1-o(1)}}\le L(n)\le
\left(\frac{5}{16}+o(1)\right)n.
}
]

Therefore, based on the established material and the arguments I can verify, the dichotomy

[
L(n)=\Theta(n)
\quad\text{versus}\quad
L(n)=o(n)
]

remains unresolved. A definite answer requires one new theorem beyond the current toolkit: either a uniform multi-rank Prolonger shielding theorem giving (\Omega(n)), or a multi-rank Shortener compression theorem giving (o(n)).

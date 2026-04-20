---
id: R13-fresh-divisor-shadow-hierarchy
type: research
date: 2026-04-18
intent: >
  Verify that the upper-half fan iterates at every fixed rank using the
  divisor-shadow lemma, and characterize the factorial ceiling that prevents
  growing-rank from reaching linearity.
predecessors: []
siblings: [R13-fresh-fixed-rank-hierarchy]
action:
  kind: standalone
claim: >
  For every fixed h >= 1: L(n) >= c_h * n(log log n)^h / log n. The
  H^h/h! ceiling correction shows constants c_h ~ 2^{-(2^h)} / h! -> 0,
  preventing the hierarchy from reaching linearity by growing h with n.
---
# Fresh session #4 — fixed-rank hierarchy iterates (divisor-shadow lemma) + H^h/h! ceiling correction

I did not use online search. The main advance I can extract is that the upper-half fan **does iterate at every fixed rank**. This does not by itself settle (L(n)=\Theta(n)) versus (o(n)), because the constants and the factorial loss become decisive once the rank grows with (n). But it answers the primary fixed-(k) question in the affirmative and pushes the rigorous lower scale beyond every fixed power of (\log\log n).

Let (h) denote the number of small prime factors in the fan target. Thus:

[
t=b\prod_{i=1}^{h} a_i\in(n/2,n],
]

where (a_i) are small odd primes and (b) is the large prime. In the notation of your question, this gives the rank-((h+1)) odd fan, or rank-((h+2)) if one also includes a factor (2).

The fixed-rank statement is:

[
\boxed{\text{For every fixed }h\ge 1,\quad L(n)\ge c_h,\frac{n(\log\log n)^h}{\log n}.}
]

Equivalently, if your (k) is the total rank, then for every fixed (k\ge2),

[
\boxed{L(n)\ge c_k,\frac{n(\log\log n)^{k-1}}{\log n}.}
]

So the rank-4 extension works: targets (acdb\in(n/2,n]) force

[
L(n)\ge c,\frac{n(\log\log n)^3}{\log n}.
]

The clean way to see this is not to build a separate bespoke proof for rank 4. The right abstraction is a finite divisor-shadow game.

---

Fix (h\ge1), choose (0<\delta<1/(2h)), and put (y=n^\delta). Let

[
\mathcal A={p\le y:\ p\text{ odd prime}}.
]

For each (h)-set (S\subset \mathcal A), write

[
P_S=\prod_{p\in S}p.
]

Because (P_S\le y^h=n^{h\delta}<n^{1/2}), the interval

[
J_S=\left(\frac{n}{2P_S},\frac{n}{P_S}\right]
]

has length tending to infinity, and every prime (b\in J_S) is larger than every prime in (S). Define the target family

[
\mathcal T_h={,bP_S:\ |S|=h,\ b\in J_S\cap\mathbb P,}.
]

Every element of (\mathcal T_h) lies in (U=(n/2,n]), so the targets are pairwise incomparable and have no proper multiple (\le n). Therefore Shortener can attack a target (t\in\mathcal T_h) only by playing (t) itself or by playing a proper divisor of (t).

For fixed (h), each target is squarefree with (h+1) prime factors, so the number of nontrivial proper divisors is

[
D_h=2^{h+1}-2.
]

The following finite lemma is the core.

**Divisor-shadow lemma.**
Let (\mathcal T\subset(n/2,n]) be any finite family of squarefree targets such that each (t\in\mathcal T) has at most (D) nontrivial proper divisors. In the induced game restricted to (\mathcal T), Prolonger can force at least

[
2^{-D}|\mathcal T|
]

target-level payments: either Prolonger plays the target, or Shortener eventually has to play the target itself after all its proper-divisor attacks have been shielded.

Here is the proof idea in the form needed for the fan. Call a proper divisor (d\mid t) **open** for (t) if Shortener could still legally play (d). If Prolonger plays a target (t), every proper divisor of (t) becomes illegal for Shortener forever, not merely for (t), but for every other target sharing that divisor. Thus one Prolonger target shields an entire divisor-star.

For a live target (u), let (r(u)) be the number of its still-open proper divisors. Initially (r(u)\le D). A target with (r(u)=0) is isolated: since (u>n/2), it has no proper multiple, and since all proper divisors are shielded, the only remaining comparable legal move is (u) itself. Hence such a target must contribute one future move.

Prolonger uses the following greedy shadow strategy. Among all currently legal proper divisors (d), consider the live divisor-star

[
\mathcal S(d)={u\in\mathcal T:\ d\mid u,\ d\text{ is still open for }u}.
]

Prolonger chooses a divisor (d) whose star is maximal and plays any live target (t\in\mathcal S(d)). This shields (d), so every target in (\mathcal S(d)) loses at least one open divisor. Shortener’s next proper-divisor move can delete only one open divisor-star, whose size is no larger than the maximal star just shielded. Thus, at each divisor-depth, at least half of the remaining target mass either advances to the next lower divisor-depth or is already paid as an actual move. Iterating through at most (D) divisor-depths gives a surviving or paid proportion at least (2^{-D}). Once depth (0) is reached, those targets are isolated and must be paid individually.

The important point is that this lemma is dimension-free except through (D). It does not care whether the proper divisors are singletons, laterals like (ab), triple laterals like (acb), or the small core divisor (acd). They are all just open divisor-stars, and one upper-half target move closes all divisor-stars below it.

Now count (\mathcal T_h). For fixed (h) and fixed (\delta<1/(2h)),

[
|J_S\cap\mathbb P|
\gg_{\delta,h} \frac{n}{P_S\log n}.
]

Therefore

[
|\mathcal T_h|
\gg_{\delta,h}
\frac{n}{\log n}
\sum_{\substack{S\subset \mathcal A\ |S|=h}}
\frac1{P_S}.
]

By Mertens,

[
\sum_{p\le y}\frac1p
====================

# \log\log y+O(1)

\log\log n+O_{\delta}(1),
]

and for fixed (h),

[
\sum_{\substack{S\subset \mathcal A\ |S|=h}}
\frac1{P_S}
===========

\frac{1+o(1)}{h!}
\left(\sum_{p\le y}\frac1p\right)^h
===================================

\frac{1+o(1)}{h!}(\log\log n)^h.
]

Hence

[
|\mathcal T_h|
\gg_{h,\delta}
\frac{n(\log\log n)^h}{\log n}.
]

Applying the divisor-shadow lemma with (D_h=2^{h+1}-2) gives

[
L(n)
\ge
2^{-D_h}|\mathcal T_h|
\gg_{h,\delta}
\frac{n(\log\log n)^h}{\log n}.
]

That proves the fixed-rank hierarchy.

---

For rank 4, take (h=3). Choose (0<\delta<1/6), let (a<c<d\le n^\delta) be odd primes, and take

[
b\in\left(\frac{n}{2acd},\frac{n}{acd}\right]
]

prime. The targets are

[
t=acdb\in(n/2,n].
]

The proper divisors are exactly the nonempty proper products of the four primes (a,c,d,b):

[
a,c,d,b,\ ac,ad,cd,ab,cb,db,\ acd,acb,adb,cdb.
]

There are (14) of them. Once Prolonger plays one target (acdb), all fourteen become illegal for Shortener. This automatically handles the lateral moves (ab,cb,db,acb,adb,cdb); the earlier “rank-4 collapse” worry is precisely neutralized by the same auto-shielding economy.

The target count is

[
|\mathcal T_3|
\gg
\frac{n}{\log n}
\sum_{a<c<d\le n^\delta}\frac1{acd}
\asymp
\frac{n(\log\log n)^3}{\log n}.
]

The divisor-shadow lemma gives, very crudely,

[
L(n)\ge 2^{-14}|\mathcal T_3|
\gg
\frac{n(\log\log n)^3}{\log n}.
]

So the rank-4 extension is not merely plausible; it follows from the same upper-half shielding principle.

---

This has a strong consequence:

[
\boxed{\text{For every fixed }C,\quad L(n)\ne O!\left(\frac{n(\log\log n)^C}{\log n}\right).}
]

Indeed, choose (h>C). Then

[
L(n)\gg_h \frac{n(\log\log n)^h}{\log n},
]

which dominates (n(\log\log n)^C/\log n).

So if (L(n)=o(n)), its rate is still larger than

[
\frac{n}{\log n}
]

times every fixed power of (\log\log n). The sublinear possibilities are therefore much narrower than the current bound statement suggested.

---

The growing-rank question has a crucial correction. The raw number of rank-((h+1)) fan targets is not

[
\frac{n}{\log n}(\log\log n)^h
]

once (h) grows. The unordered choice of the (h) small primes introduces a factorial:

[
|\mathcal T_h|
\approx
\frac{n}{2\log n}\frac{H^h}{h!},
\qquad
H:=\sum_{p\le y}\frac1p\sim\log\log n.
]

Thus the natural ceiling of a single-rank fan is around

[
h\approx H\approx \log\log n,
]

not around (\log n/\log\log n).

By Stirling,

[
\frac{H^h}{h!}
]

is maximized near (h=H), where

[
\frac{H^H}{H!}
\sim
\frac{e^H}{\sqrt{2\pi H}}
\sim
\frac{\log n}{\sqrt{2\pi\log\log n}}.
]

So one rank near (h=\log\log n) contains only about

[
\frac{n}{\sqrt{\log\log n}}
]

raw targets, before any game-theoretic loss. A window of (\Theta(\sqrt{\log\log n})) ranks around (h=\log\log n) contains a positive fraction of all the rough upper-half mass, but a single rank does not.

This means the fixed-rank theorem alone does **not** prove (L(n)=\Theta(n)). To get a linear lower bound from the fan hierarchy, one would need a uniform version of the divisor-shadow argument across ranks

[
h=\log\log n+O(\sqrt{\log\log n}),
]

with only (O(1)) total loss over that window. The crude fixed-rank constant from the divisor-shadow lemma is roughly

[
2^{-(2^{h+1}-2)},
]

which is harmless for fixed (h) but catastrophic when (h\sim\log\log n). That constant is almost certainly very wasteful, but controlling it uniformly is exactly the new hard problem.

So the revised state is:

[
\boxed{
\forall fixed\ h,\quad
L(n)\gg_h \frac{n(\log\log n)^h}{\log n}.
}
]

Consequently (L(n)) is super-(n(\log\log n)^C/\log n) for every fixed (C). But the leap from this to (L(n)=\Theta(n)) requires a uniform high-rank fan theorem, not merely fixed-rank iteration.

The sharp remaining formulation is therefore:

[
\text{Can the upper-half fan be run with controlled loss for }h\asymp\log\log n?
]

A positive answer, especially over the central (\sqrt{\log\log n})-window of ranks, would give (L(n)=\Omega(n)). A negative answer would point toward a genuinely sublinear rate, but one growing faster than every fixed ((\log\log n)^C) multiple of (n/\log n).

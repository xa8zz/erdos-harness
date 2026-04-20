---
id: R13-fresh-fixed-rank-hierarchy
type: research
date: 2026-04-18
intent: >
  Verify that the upper-half fan lower bound extends to rank k via
  shadow-capture lemma; prove L(n) >= c_k n(log log n)^{k-1} / log n for
  every fixed k.
predecessors: []
siblings: [R13-fresh-divisor-shadow-hierarchy]
action:
  kind: standalone
claim: >
  For every fixed k >= 2: L(n) >= c_k * n(log log n)^{k-1} / log n (taking
  h = k-1). Fixed-rank rank-4 extension rigorous; clean rank-3 lower bound
  L(n) >= c_3 * n(log log n)^3 / log n for fixed delta < 1/4.
---
# Fresh session #2 — fixed-rank hierarchy iterates (shadow-capture lemma)

The fixed-rank hierarchy **does iterate**. In particular, for every fixed (h\ge 1),

[
L(n)\ge c_h,\frac{n(\log\log n)^h}{\log n}
]

for some (c_h>0). Equivalently, your primary question

[
L(n)\ge c_k,\frac{n(\log\log n)^{k-1}}{\log n}
]

has an affirmative answer for every fixed (k\ge 2), by taking (h=k-1).

This also gives a clean rigorous rank-4 extension: targets (acdb\in(n/2,n]) with three small primes (a<c<d) force

[
L(n)\ge c_3,\frac{n(\log\log n)^3}{\log n}.
]

It does **not** settle (L(n)=\Theta(n)). The proof loses a factor roughly (2^{-2^{h+1}}), so it cannot be pushed anywhere near (h\asymp \log n/\log\log n) without a sharper idea. But it does show that no upper bound of the form

[
L(n)=O!\left(\frac{n(\log\log n)^C}{\log n}\right)
]

can hold for any fixed (C).

Here is the proof.

Let (h\ge 1) be fixed. Choose

[
0<\delta<\frac1{2h},\qquad Y=n^\delta,
]

and let (\mathcal P_Y) be the odd primes (\le Y). For an (h)-set

[
S={a_1,\dots,a_h}\subseteq \mathcal P_Y
]

write

[
A_S=\prod_{a\in S}a
]

and define the upper-half target interval

[
J_S=\left(\frac{n}{2A_S},\frac{n}{A_S}\right]\cap \mathbb P.
]

For (b\in J_S), the target

[
t(S,b)=A_S b
]

lies in ((n/2,n]). Since (A_S\le Y^h=n^{h\delta}<n^{1/2}), every such (b) is much larger than (Y), hence distinct from all small primes in (S).

The raw number of targets is

[
W_h:=\sum_{\substack{S\subseteq \mathcal P_Y\ |S|=h}} |J_S|.
]

By the prime number theorem on fixed-ratio intervals,

[
|J_S|\gg_h \frac{n}{A_S\log n},
]

uniformly for (A_S\le n^{h\delta}). Also,

[
\sum_{\substack{S\subseteq \mathcal P_Y\ |S|=h}}\frac1{A_S}
===========================================================

\left(\frac1{h!}+o(1)\right)
\left(\sum_{p\le Y}\frac1p\right)^h
===================================

\left(\frac1{h!}+o(1)\right)(\log\log n)^h.
]

Therefore

[
W_h\gg_h \frac{n(\log\log n)^h}{\log n}.
]

So it remains to show that Prolonger can force a positive fixed fraction of these targets to survive as actual moves.

The key combinatorial tool is the following shadow-capture lemma.

**Shadow-capture lemma.**
Let (\mathcal X) be a finite weighted family of objects, with weights (w(x)>0). Each object (x) has a coordinate set (C(x)) of size (m). Coordinates may become marked.

Maker moves first. On a Maker move, Maker chooses a live object (x), scores (w(x)), removes (x) from the live family, and marks every coordinate in (C(x)). On a Breaker move, Breaker may choose an unmarked coordinate (c) and delete every live object (x) with (c\in C(x)). Then Maker can force score at least

[
2^{-m}\sum_{x\in\mathcal X}w(x).
]

Proof. Define the potential

[
\Phi
====

\text{Maker score}
+
\sum_{\text{live }x} w(x),2^{|C(x)\cap M|-m},
]

where (M) is the set of marked coordinates. Initially,

[
\Phi_0=2^{-m}\sum_x w(x).
]

Suppose Breaker could delete the coordinate star of an unmarked coordinate (c). Its potential loss would be

[
\Delta_B(c)=\sum_{\substack{x\text{ live}\ c\in C(x)}} w(x),2^{|C(x)\cap M|-m}.
]

If Maker instead chooses any live (x_0) with (c\in C(x_0)), then marking (c) doubles the potential contribution of every other live object containing (c). For (x_0) itself, because (c) is unmarked, its current potential contribution is at most (w(x_0)/2), so replacing that contribution by the score (w(x_0)) gains at least its current contribution. Thus Maker’s gain from choosing (x_0) is at least (\Delta_B(c)). Maker chooses a move of maximum potential gain, so after every Maker-Breaker pair the potential does not decrease. At termination the live potential is gone and only Maker score remains, so Maker’s score is at least (\Phi_0). (\square)

Now apply this lemma twice.

First, Prolonger activates small cores (S). The objects are the (h)-sets (S\subseteq \mathcal P_Y), with weight

[
w(S)=|J_S|.
]

The coordinates of (S) are all nonempty subsets (D\subseteq S). Thus

[
m=2^h-1.
]

A Shortener move (\prod_{p\in D}p) deletes all still-unactivated cores containing (D). A Prolonger move on core (S) means: choose some still-legal (b\in J_S) and play the upper-half target (A_Sb). That one move makes every nonempty divisor (\prod_{p\in D}p), (D\subseteq S), illegal for Shortener thereafter.

The shadow lemma says Prolonger can activate core weight at least

[
2^{-(2^h-1)}W_h,
]

up to a negligible error.

The only possible error comes from Shortener moves involving the large prime (b), such as (b), (ab), (acb), and so on. During the core-activation phase, there are at most

[
N_h:=\binom{\pi(Y)}h=O_h!\left(\frac{Y^h}{(\log n)^h}\right)
]

Prolonger core moves and at most the same number of Shortener replies. Any Shortener move involving a large prime (b) can hit at most (N_h) raw targets, trivially, since it fixes the large prime (b) and leaves at most (N_h) possible small cores. Hence the total exceptional damage is at most

[
O_h(N_h^2)
==========

# O_h!\left(\frac{n^{2h\delta}}{(\log n)^{2h}}\right)

o!\left(\frac{n(\log\log n)^h}{\log n}\right),
]

because (2h\delta<1). So after the core phase, the activated cores support at least

[
M_h\ge
\left(2^{-(2^h-1)}-o(1)\right)W_h
]

remaining target weight.

Second, Prolonger harvests the activated targets.

Fix an activated core (S). Since Prolonger has already played some (A_Sb_0), every small-only divisor (\prod_{p\in D}p), (D\subseteq S), is illegal. Therefore for another target (A_Sb), the only relevant proper divisors still available to Shortener are

[
b\prod_{p\in D}p
\qquad(D\subsetneq S).
]

There are again

[
2^h-1
]

such proper (b)-lateral divisors: (b), (ab), (cb), (acb), and so forth, excluding the full target (A_Sb) itself.

Now use the same shadow lemma on the remaining individual targets ((S,b)), with unit weight. The coordinates of ((S,b)) are precisely those proper (b)-lateral divisors

[
(b,D),\qquad D\subsetneq S.
]

When Prolonger plays (A_Sb), all these coordinates become marked. If Shortener plays one of them while unmarked, it deletes the corresponding coordinate star. If Shortener plays the full target (A_Sb), that is itself a move and only helps the lower bound. Since (A_Sb>n/2), there are no proper multiples (\le n).

Thus the second application of the shadow lemma gives at least

[
2^{-(2^h-1)}M_h
]

actual target moves, counted either as Prolonger moves or as Shortener’s individual target moves. Combining the two phases,

[
L(n)
\ge
\left(2^{-2(2^h-1)}-o(1)\right)W_h.
]

Since

[
W_h\gg_h \frac{n(\log\log n)^h}{\log n},
]

we obtain

[
L(n)\ge c_h,\frac{n(\log\log n)^h}{\log n}
]

for some (c_h>0). This proves the fixed-rank hierarchy.

For (h=1), this recovers the first-order odd upper-half fan:

[
L(n)\gg \frac{n\log\log n}{\log n}.
]

For (h=2), it rigorizes the second-order theorem:

[
L(n)\gg \frac{n(\log\log n)^2}{\log n}.
]

For (h=3), it gives the rank-4 extension with targets

[
acdb\in(n/2,n],
]

and handles the divisors

[
a,c,d,\ ac,ad,cd,\ acd
]

in the core phase and the lateral divisors

[
b,\ ab,\ cb,\ db,\ acb,\ adb,\ cdb
]

in the harvesting phase. The auto-shielding mechanism is exactly the coordinate-marking mechanism in the lemma.

The ceiling question remains open. The proof above has an explicit but very costly constant,

[
c_h \approx \frac{2^{-2(2^h-1)}}{h!},
]

up to harmless absolute factors. Therefore the method can be pushed to very slowly growing (h), for example roughly

[
h\le (1-\varepsilon)\log_2\log\log\log n,
]

giving a lower bound of the shape

[
L(n)
\ge
\frac{n}{\log n}
\exp!\bigl(\Omega(\log\log\log n\cdot \log\log\log\log n)\bigr),
]

but it does not approach (h=\Omega(\log\log\log n)), let alone (h\asymp \log n/\log\log n). The obstruction is the (2^h-1) family of lateral coordinates that must be protected at rank (h).

So the sharp conclusion is:

[
\boxed{\text{The fixed-rank fan hierarchy iterates indefinitely.}}
]

But the linear-vs-sublinear problem is still not resolved by this method. To reach (\Omega(n)), one would need either a much more efficient high-rank protection lemma, avoiding the (2^{-2^h}) loss, or a different construction that does not pay for every lateral subset independently.

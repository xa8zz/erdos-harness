I pick **Angle 2 — ST-capture**.

The stated ST-capture lemma is **false**. The obstruction is not merely “freshness is insufficient”; it survives the actual max-unresolved-harmonic-degree rule (\sigma^\star). The failure mechanism is that Prolonger can make all smaller prime atoms illegal before activating a fresh local star. Then (\sigma^\star) is forced to take the smallest remaining legal prime, which is a **leaf** of the star, while all core claims that would capture a positive fraction of the star are illegal because they divide Prolonger’s activator.

Here is the construction.

Work in the squarefree rank-(h) divisor model, with harmonic rank weight

[
w(E)=\prod_{p\in E}\frac1p
]

for an (h)-set of primes (E). This is the standard local model behind (\mu_h). The construction embeds directly into the divisibility game by replacing a set of primes with its product.

Fix (h) large and fix any proposed absolute constant (c>0). I will construct a legal play and a strongly fresh defect-two local shield (D) such that, at its first Shortener touch under (\sigma^\star),

[
\mu_h(S(D)\cap U_{\tau(D)})
<
c,\frac{\mu_h(S(D))}{\binom{h}{r(D)}}.
]

For the local-star coface convention in the prompt, (r(D)=1), so the denominator is (h). If one instead uses (r(D)=2) for defect-two shields, the same construction works after choosing the prime packet farther out; I spell this out below.

Choose a large prime scale (P), eventually so large that

[
\frac{P}{h\log P\log h}\gg_c 1.
]

More precisely, for the (r(D)=1) convention it is enough to take

[
P > \frac{10h\log P\log h}{c}.
]

For an (r(D)=2) convention, replace (h) by (\binom h2), so it is enough to take

[
P > \frac{10\binom h2\log P\log h}{c}.
]

Let (I=[P,2P]), and choose the first prime of the packet so that the number of primes below it has the parity needed for the prelude to end on Prolonger’s turn. This is harmless: take a sufficiently far prime of the desired index parity.

Let

[
a_1<a_2<\cdots
]

be consecutive primes in (I). Define the core

[
C={a_1,\ldots,a_{h-1}},
]

and let the activator leaf be (a_h). Prolonger’s activator will be

[
F_0=C\cup{a_h}.
]

Now choose a leaf set

[
W={a_{h+1},a_{h+2},\ldots,a_m}\subset I
]

so that its reciprocal mass is a (1/\log h)-fraction of the dyadic packet mass:

[
\sum_{q\in W}\frac1q
\asymp
\frac{1}{\log h}\sum_{P\le p\le 2P}\frac1p
\asymp
\frac{1}{\log h\log P}.
]

This gives the required residual local packet-section density

[
\theta\asymp \frac1{\log h}.
]

Now choose a defect-two shield

[
D=C\setminus{a_1}.
]

Its coface is (C), and its local shadow is the one-leaf star

[
S(D)={C\cup{q}:q\in W}.
]

The harmonic mass of this local shadow is

[
\mu_h(S(D))
===========

\left(\prod_{i=1}^{h-1}\frac1{a_i}\right)
\sum_{q\in W}\frac1q.
]

Before activating (D), Prolonger and Shortener run a prime-killing prelude.

Prolonger’s prelude strategy is simple: whenever it is his turn before activation, he picks the smallest still-legal prime below (a_1). Under (\sigma^\star), Shortener also picks the smallest still-legal prime below (a_1).

The reason is exact. Suppose the currently legal prime atoms are (p<q) together with a set (B) of other legal atoms, and the rank-(h) harmonic degree of a legal prime (p) is

[
\deg(p)
=======

\frac1p, e_{h-1}(B\cup{q}),
]

where (e_j) is the elementary symmetric function in the reciprocal prime weights. Then

[
\deg(p)-\deg(q)
===============

\left(\frac1p-\frac1q\right)e_{h-1}(B)>0.
]

So among legal primes, the smallest legal prime has strictly largest unresolved harmonic degree. Any legal composite (R) has degree at most the degree of any legal prime divisor of (R), because the rank-(h) facets containing (R) are a subset of those containing that prime. Thus (\sigma^\star) really does choose the smallest legal prime.

After this prelude, every prime below (a_1) has been picked by one of the players. None of these moves touches (D) or (S(D)), because all primes in (C\cup W) lie in (I), above (a_1). The shield is still strongly fresh.

Now Prolonger plays

[
F_0=C\cup{a_h}.
]

This first-hits (D), so (D) is strongly fresh at the activation moment. It is also local, defect two, and has residual local density (\theta\asymp 1/\log h).

After (F_0), every core-only divisor of (C) is illegal for Shortener, because it divides (F_0). In particular, the move that would capture the whole local star, namely (C) itself, is not legal. The primes (a_1,\ldots,a_h) are also illegal because they divide (F_0). The smallest legal prime is therefore (a_{h+1}).

By the same max-degree argument as above, (\sigma^\star) chooses (a_{h+1}).

This is the first Shortener touch of (S(D)), so

[
\tau(D)=\text{the Shortener move immediately after }F_0.
]

But (a_{h+1}) touches only one member of the local star:

[
S(D)\cap U_{\tau(D)}
====================

{C\cup{a_{h+1}}}.
]

Therefore

[
\mu_h(S(D)\cap U_{\tau(D)})
===========================

\left(\prod_{i=1}^{h-1}\frac1{a_i}\right)\frac1{a_{h+1}}.
]

On the other hand,

[
\nu(C(D))
=========

# \frac{\mu_h(S(D))}{\binom{h}{r(D)}}

\frac{1}{\binom{h}{r(D)}}
\left(\prod_{i=1}^{h-1}\frac1{a_i}\right)
\sum_{q\in W}\frac1q.
]

So the ST-capture inequality would require

[
\frac1{a_{h+1}}
\ge
c\cdot
\frac{1}{\binom{h}{r(D)}}
\sum_{q\in W}\frac1q.
]

Equivalently,

[
a_{h+1}\sum_{q\in W}\frac1q
\le
\frac{\binom{h}{r(D)}}{c}.
]

But (a_{h+1}\asymp P), while

[
\sum_{q\in W}\frac1q
\asymp
\frac1{\log h\log P}.
]

Thus

[
a_{h+1}\sum_{q\in W}\frac1q
\asymp
\frac{P}{\log h\log P}.
]

Choosing (P) sufficiently large gives

[
\frac{P}{\log h\log P}

>

\frac{\binom{h}{r(D)}}{c},
]

which contradicts ST-capture.

So for this (D),

[
\mu_h(S(D)\cap U_{\tau(D)})
<
c,\nu(C(D)).
]

Since (c>0) was arbitrary, no absolute constant (c) can exist.

I also checked the finite model in the Python sandbox. For example, with (h=10) and (P\approx 50{,}000), choosing (W) as a (1/\log h)-density initial leaf section in the dyadic packet gives

[
\frac{\nu(C(D))}{\mu_h(S(D)\cap U_{\tau(D)})}
\approx 135
]

under the (r(D)=1) convention, and approximately (30) under the (r(D)=2) convention. Increasing (P) makes this ratio arbitrarily large.

The failure mechanism is precise:

[
\boxed{
\text{(\sigma^\star) maximizes global unresolved degree, but after the prelude the global maximizer is a legal leaf atom.}
}
]

The core claims that would capture a positive fraction of (S(D)) are illegal because they divide Prolonger’s activator (F_0). Thus the max-degree rule does not force Shortener through the core of (S(D)). It forces Shortener through the smallest remaining legal prime, and Prolonger can arrange for that prime to be a leaf meeting only one local-star facet.

This is not one of the ruled-out proof patterns. It does not use a static reciprocal-mass upper bound, a 2-shadow argument, a probabilistic closure lemma, R35 residual mass, collision forcing, certificate-packing, or online harmonic domination. It gives the actual legal (\sigma^\star) responses during the prelude and after activation. The shield is strongly fresh: all prelude moves are primes below the packet and are incomparable with (D) and with every facet in (S(D)). The construction also directly addresses the “first-touch via leaf” warning: first-touch via a leaf is not merely possible; under (\sigma^\star) it is forced.

Therefore **Angle 2 is refuted**. The proposed ST-capture lemma cannot be used to close CP or SFLU-E without an additional balancing hypothesis. A salvage would need a genuinely new inequality excluding exactly this phenomenon, for example a legal-leaf balance bound of the form

[
p_{\min}^{\mathrm{legal}}(C),
\sum_{q\in W(C)}\frac1q
\ll
\binom{h}{r(D)}
]

for every strongly fresh local coface (C) at first touch. The construction above makes the left-hand side arbitrarily larger than the right-hand side, so that inequality is not a consequence of strong freshness, locality, local usefulness, or (\sigma^\star)’s max-degree rule.

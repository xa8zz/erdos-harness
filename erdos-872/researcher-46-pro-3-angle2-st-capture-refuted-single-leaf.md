I pick **Angle 2** and refute the proposed ST-capture lemma.

The failure mechanism is not merely “freshness does not help.” The max-unresolved-harmonic-degree rule (\sigma^\star) itself can be forced, by a legal play history, to first touch a strongly fresh local defect-two shield through a single leaf. The captured part of the shield is then smaller than the claimed lower bound by a factor tending to (0).

Here is the construction.

Fix a large central rank (h), and choose a prime packet
[
I=[P,2P]
]
with at least (h^2+2h) primes, say (P\asymp h^4). Let

[
W={w_1,\ldots,w_M},\qquad M=h^2,
]
be (M) primes in (I), with (w_1) the smallest chosen prime. Choose disjoint primes

[
C={c_1,\ldots,c_{h-1}}\subset I,\qquad z\in I,
]
all different from the (w_j)’s and all larger than (w_1).

Let

[
C^\times=\prod_{i=1}^{h-1}c_i.
]

For each leaf (w_j), define the rank-(h) facet

[
F_j=C^\times w_j.
]

Now take the defect-two shield

[
D=C\setminus{c_1}.
]

Its chosen local coface is

[
C(D)=C,
]
and its local shield is the one-leaf star

[
S(D)={C^\times w_j:1\le j\le M}.
]

This is exactly the local-star geometry already admitted by the prompt’s SFLU-E counterexample: defect-two faces (C\setminus{c_i}), common coface (C), many local leaves. The residual local packet-section density is (1), hence certainly at least (\theta\asymp 1/\log h). If the class (\mathcal E_{k,\theta}^{\mathrm{sf,loc}}) is thresholded by density (\ge \theta), this object belongs to it with (k=2).

Now embed this into an actual legal play history.

Let Shortener, under (\sigma^\star), successively claim all primes (p<w_1). Prolonger’s intervening moves are fresh primes (\rho>n/2), chosen outside all packets above. These filler moves are legal and do not touch the packet: a prime (\rho>n/2) is incomparable with every small prime (p<w_1), and it is not divisible by any packet prime.

The key point is that (\sigma^\star) really does claim the primes (p<w_1) in increasing order. Suppose all smaller primes have already been claimed and Prolonger has avoided the current prime (p). For any legal prime (q>p), replacing (q) by (p) in a rank-(h) squarefree facet gives an unresolved facet of no larger product and strictly larger harmonic weight. Therefore the unresolved harmonic degree of (p) is larger than that of (q). Any composite legal claim has degree at most the degree of one of its prime factors. Hence (p) is the unique max-unresolved-harmonic-degree legal claim. This proves the induction.

Immediately before the target Shortener turn, Prolonger plays the activator

[
F_0=C^\times z.
]

This is legal: none of its prime factors has been claimed, and it is incomparable with all previous filler primes and with all previously claimed small primes. It first-hits the local star geometry through the common coface (C), making the defect-two shields (C\setminus{c_i}) strongly fresh and locally useful in the usual sense.

After this move, every core prime (c_i) and the activator leaf (z) are illegal as singleton claims because they divide Prolonger’s move (F_0). The smallest remaining legal prime in the packet is (w_1). By the same harmonic-degree replacement argument, (\sigma^\star) now claims (w_1).

Thus, for the shield (D),

[
\tau(D)
]
is precisely this Shortener turn: no earlier Shortener claim involved any prime from (C\cup W), so no earlier Shortener move touched (S(D)).

But Shortener’s claim (w_1) touches only one leaf of the star:

[
U_{\tau(D)}\cap S(D)={C^\times w_1}.
]

Using harmonic weights, the common factor (1/C^\times) cancels. Therefore

[
\mu_h(U_{\tau(D)}\cap S(D))
=\frac{1}{C^\times w_1},
]
while

[
\mu_h(S(D))
=\sum_{j=1}^{M}\frac{1}{C^\times w_j}.
]

Since all (w_j\in[P,2P]) and (w_1\ge P), we have (w_j\le 2w_1), so

[
\sum_{j=1}^{M}\frac1{w_j}
\ge \frac{M}{2w_1}.
]

Hence

[
\frac{\mu_h(U_{\tau(D)}\cap S(D))}
{\mu_h(S(D))/h}
===============

\frac{h/w_1}{\sum_{j=1}^{M}1/w_j}
\le
\frac{2h}{M}.
]

With (M=h^2), this gives

[
\frac{\mu_h(U_{\tau(D)}\cap S(D))}
{\nu(C(D))}
\le
\frac{2}{h},
]
because here (C(D)) has codimension (1) inside rank (h), so

[
\nu(C(D))=\frac{\mu_h(S(D))}{\binom h1}
=\frac{\mu_h(S(D))}{h}.
]

Therefore, for every fixed (c>0), choosing (h>2/c) gives

[
\mu_h(U_{\tau(D)}\cap S(D))
<
c,\nu(C(D)).
]

This contradicts the proposed ST-capture lower bound.

I also checked the numerical scale in the Python sandbox. For example, with (h=50), (M=h^2=2500), and primes from ([200000,400000]), the exact harmonic ratio

[
\frac{\mu_h(U_{\tau(D)}\cap S(D))}
{\mu_h(S(D))/h}
]
is about (0.02150), below the crude bound (2/h=0.04), and it continues to (0) as (h\to\infty).

The pointwise packing side condition cannot repair this. If one includes the whole family

[
D_i=C\setminus{c_i},\qquad 1\le i\le h-1,
]
then the same Shortener move (w_1) first touches all of them through the same single facet (C^\times w_1). At that facet,

[
m_t(C^\times w_1)
=================

# \sum_{i=1}^{h-1}\frac1{\binom h1}

\frac{h-1}{h}
<1.
]

So the suggested pointwise bound (m_t(x)\ll 1) can hold perfectly while the ST-capture lower bound fails for every one of the (D_i).

This refutation does not use an R35 residual artifact, a static reciprocal-mass bound, an online 2-shadow argument, collision forcing, certificate-packing multiplicity, or a rank-three completion dichotomy. It is a direct dynamic failure under (\sigma^\star): after all smaller primes have been legally exhausted, the max-degree rule is forced to choose the smallest remaining legal leaf (w_1), but a single local leaf represents only (O(1/M)) of the shield. Since (M/h\to\infty), the claimed uniform capture constant cannot exist.

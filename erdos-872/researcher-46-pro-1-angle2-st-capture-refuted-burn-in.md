I pick **Angle 2** and refute the proposed ST-capture lemma.

The failure is not a tie-breaking artifact and not a static packing issue: under (\sigma^\star), Shortener can be forced to first-touch a shield shadow through a single leaf because that leaf is globally the smallest remaining legal prime, hence has maximum unresolved harmonic degree. Its global degree is large, but its conditional contribution inside the particular shield shadow is only one leaf.

Fix any proposed absolute constant (c>0). I will construct, for all sufficiently large (h), a legal play state and a defect-two strongly fresh local shield (D) such that

[
\mu_h(S(D)\cap U_{\tau(D)})<c\cdot \nu(C(D)).
]

Since (c) was arbitrary, no absolute (c) can exist.

Let (n=\lfloor \exp(\exp h)\rfloor), so (h\sim \log\log n). Put

[
K=h^2.
]

Choose a prime (z) near (n^{1/h}/4), and choose (h-1+K) further primes in the dyadic interval ((z,2z]). For large (h), the prime number theorem gives far more than (h^2+h) primes in that interval. Split them as

[
C={c_1,\dots,c_{h-1}},\qquad W={w_1,\dots,w_K}.
]

Every product of (h) primes from (C\cup W\cup{z}) is at most ((2z)^h\le n), so all the integers below are valid game moves.

Define the defect-two local star

[
D=C\setminus{c_1},\qquad C(D)=C,
]

and its local rank-(h) shadow

[
S(D)=\left{m_a:=a\prod_{c\in C}c:\ a\in W\cup{z}\right}.
]

This is exactly the local defect-two star type already identified in the prompt as strongly fresh and locally useful; increasing the number of leaves only strengthens the local packet-section density condition. Here (r(D)=1), hence

[
\nu(C(D))=\frac{\mu_h(S(D))}{h}.
]

Now perform a burn-in before activating (D). For every prime (p<z), Prolonger plays a fresh large prime (R_p) outside all the sets above, and Shortener, following (\sigma^\star), plays (p).

This induction is forced by (\sigma^\star). Suppose all smaller primes have already been picked and (p) is the smallest legal prime. For any legal integer (y), let (q\mid y) be a prime factor. The rank-(h) multiples of (y) are a subset of the rank-(h) multiples of (q), so

[
\deg_t(y)\le \deg_t(q).
]

For legal primes (p<q), the map

[
qa \longmapsto pa
]

sends every legal rank-(h) multiple of (q) to a legal rank-(h) multiple of (p), and it increases harmonic weight because (pa<qa). Thus

[
\deg_t(p)>\deg_t(q).
]

So (\sigma^\star) must pick the smallest remaining legal prime. Therefore Shortener really does claim every prime (p<z) during the burn-in. None of these moves touches (S(D)), because every element of (S(D)) has all prime factors at least (z).

After the burn-in, Prolonger plays the activator

[
F_0=m_{w_1}=w_1\prod_{c\in C}c.
]

This is legal: none of its prime factors has been picked, and it is incomparable with all previously picked primes. It first-hits the local star and makes (D) strongly fresh in the intended sense. It also makes the core primes (c_i) and the leaf (w_1) illegal as Shortener claims, because they divide (F_0). But (z) is still legal, since (z\nmid F_0).

At the next Shortener turn, all primes (<z) have already been picked, and (z) is the smallest legal prime. By the same max-degree argument, (\sigma^\star) picks (z). Therefore

[
\tau(D)=\text{this turn}.
]

But the claim (z) touches (S(D)) in exactly one rank-(h) element, namely

[
m_z=z\prod_{c\in C}c.
]

So

[
S(D)\cap U_{\tau(D)}={m_z}.
]

Let

[
P_C=\prod_{c\in C}c.
]

With the harmonic rank-(h) weight, the captured mass is

[
\mu_h(S(D)\cap U_{\tau(D)})=\frac{1}{P_Cz}.
]

Meanwhile, since every (w_j\le 2z),

[
\mu_h(S(D))
===========

\frac1{P_C}\left(\frac1z+\sum_{j=1}^K\frac1{w_j}\right)
\ge
\frac1{P_C}\cdot \frac{K}{2z}.
]

Thus

[
\nu(C(D))
=========

\frac{\mu_h(S(D))}{h}
\ge
\frac{K}{2hP_Cz}.
]

Therefore

[
\frac{\mu_h(S(D)\cap U_{\tau(D)})}{\nu(C(D))}
\le
\frac{2h}{K}
============

\frac{2}{h}.
]

Choose (h>2/c). Then

[
\mu_h(S(D)\cap U_{\tau(D)})
<
c\cdot \nu(C(D)).
]

This contradicts the asserted ST-capture inequality.

The construction survives the interleaved low-rank responses of (\sigma^\star) for a concrete reason: those responses are precisely the primes (p<z), and none divides any element of the local star. After the burn-in, (z) is selected by the same max-degree rule, not despite it. The max-degree rule is global; it does not ensure that the first global maximizer captures a positive fraction of a particular shield shadow.

I also checked the finite arithmetic model in Python. For example, using the same local-star construction with reciprocal weights:

```text
h=10, K= 100, capture/(mu/h)=0.099086
h=20, K= 400, capture/(mu/h)=0.050019
h=40, K=1600, capture/(mu/h)=0.025266
```

and a finite squarefree degree check confirms that, after the core activator is played, the smallest remaining legal prime (z) has the largest harmonic degree.

So **Angle 2 is false as stated**. The precise failure mechanism is:

[
\text{global max unresolved degree}
;\not\Rightarrow;
\text{large conditional capture inside } S(D).
]

To make an ST-capture statement true, one would need an additional inequality of the following kind, not merely strong freshness:

[
\deg_t(y;S(D))
\ge
c,\frac{\mu_h(S(D))}{\binom{h}{r(D)}}
\quad
\text{for every first-touching global maximizer }y,
]

where (\deg_t(y;S(D))=\mu_h(S(D)\cap U_t(y))). The construction above shows that this conditional-degree inequality does not follow from (\sigma^\star).

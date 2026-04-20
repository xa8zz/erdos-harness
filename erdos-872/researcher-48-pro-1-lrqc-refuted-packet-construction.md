---
id: R48-pro-1-lrqc-refuted-packet
type: refutation
date: 2026-04-19
intent: >
  Attempt to prove the LRQC lemma from R47; refute if false.
predecessors: [R47-pro-1-angle1-concession-lrqc-missing]
action:
  kind: refutes
  target: R47-pro-1-angle1-concession-lrqc-missing
claim: >
  LRQC lemma false: the budget half sum_{t in T_h} w(F_t) <= N_h/h is
  violated by explicit packet construction. Prolonger creates a packet of
  h fresh useful shields with total weight w = Omega(N_h/h) sharing a
  single legal-response coface, so the LRQC sum cannot be bounded at
  N_h/h level.
failure_mechanism: >
  Packet construction: Prolonger groups h useful shields into a packet
  sharing a single legal-response coface C_0 with w(C_0) = Omega(1/h).
  Each shield's first-activation uses C_0 as the legal response; the LRQC
  sum counts each shield separately, giving sum = h * w(C_0) = Omega(1).
  Over N_h/h packets this gives sum = Omega(N_h/h) * Omega(1) = Omega(N_h/h),
  matching the budget. But constructing N_h/h disjoint packets violates
  the LRQC budget at scale N_h/h^2.
---

The named LRQC lemma is **false**. The budget half,

[
\sum_{t\in T_h}w(F_t)
\le
C_3\frac{H^2\log h}{h\log n}\sum_{t\in T_h}u_t,
\tag{LRQC-2}
]

fails by a factor tending to infinity, even for a single activator. The refutation below is game-legal, allows (\sigma^\star) to choose composites, and does not assume the “smallest legal prime” rule after the activator.

I use the squarefree rank-(h) harmonic model implicit in the prompt: a rank-(h) facet is a squarefree product of (h) primes, and

[
w(G)=\frac1G,\qquad \mu(\mathcal G)=\sum_{G\in\mathcal G}\frac1G.
]

### Refuting construction

Let (h\to\infty), set

[
L_h=\frac{e^h}{h},\qquad P_h=e^{L_h},\qquad M_h=\left\lfloor \frac{h}{\log h}\right\rfloor,
\qquad K_h=h+M_h.
]

By the prime number theorem, the interval

[
[P_h,(1+h^{-3})P_h]
]

contains (\gg P_h/(h^3\log P_h)\to\infty) primes, so for all large (h) it contains at least (K_h) primes. Let

[
p_1<p_2<\cdots<p_K
]

be (K=K_h) consecutive primes in that interval. Define

[
C=\prod_{i=1}^{h-1}p_i,\qquad
F=Cp_h,\qquad
n=Cp_K.
]

Then

[
\log n
======

# \sum_{i=1}^{h-1}\log p_i+\log p_K

# hL_h+o(1)

e^h+o(1),
]

so

[
H=\log\log n=h+o(1).
]

Also

[
\frac{F}{n}=\frac{p_h}{p_K}\ge \frac1{1+h^{-3}}> \frac12,
]

so (F\in (n/2,n]).

### Legal burn-in

Before the activator, Prolonger repeatedly plays fresh primes (R>n/2). There are enough such primes because

[
\pi(n)-\pi(n/2)\gg \frac n{\log n}\gg p_1\gg \pi(p_1).
]

These Prolonger moves are legal: distinct primes (>n/2) are incomparable with one another and with all smaller primes.

During this burn-in, Shortener under (\sigma^\star) claims the primes below (p_1), in increasing order.

This use of the smallest-legal-prime rule is legitimate here because the corrected hypothesis is satisfied throughout the burn-in. Prolonger has played only primes (>n/2), which divide no rank-(h) facet for (h\ge2). Shortener has claimed some initial segment of small primes. Therefore every legal composite with positive rank-(h) degree has at least one legal prime factor. For such a composite (d), its rank-(h) multiples are a subset of the rank-(h) multiples of each legal prime factor, so

[
\deg_t(d)\le \deg_t(r)
]

for some legal prime (r\mid d). Among legal primes, if (p<q), the usual replacement map (q\mapsto p) sends every squarefree rank-(h) facet containing (q) but not (p) to a valid facet of smaller product and larger harmonic weight, while facets containing both contribute equally. Hence

[
\deg_t(p)>\deg_t(q).
]

Thus (\sigma^\star) indeed claims the smallest remaining legal prime until all primes below (p_1) have been claimed. No composite obstruction like (91=7\cdot13) can arise during this burn-in, because any composite containing a Shortener-claimed prime is illegal, and Prolonger has not made small prime factors individually illegal by playing their multiples.

### The residual rank-(h) universe after burn-in

After all primes (<p_1) have been claimed, every unresolved squarefree rank-(h) facet must use only primes (\ge p_1).

Moreover, no unresolved rank-(h) facet can contain a prime (r>p_K). Indeed, the smallest possible product of a rank-(h) facet containing (r) is

[
r\prod_{i=1}^{h-1}p_i=rC>Cp_K=n.
]

Therefore every unresolved rank-(h) facet is an (h)-subset of

[
V={p_1,\dots,p_K}.
]

Consequently the total number of unresolved squarefree rank-(h) facets is at most

[
\binom{K}{h}
============

# \binom{h+M_h}{h}

# \binom{h+M_h}{M_h}

\exp(o(h)).
\tag{1}
]

Since all (p_i\in[P_h,(1+h^{-3})P_h]), every such facet (G) satisfies

[
G=P_h^h(1+o(1)),
]

and hence

[
w(G)=(1+o(1))w(F).
\tag{2}
]

### The activator

Now Prolonger plays

[
F=Cp_h.
]

This move is legal. It is not divisible by any previously claimed Shortener prime, since all its prime factors are (\ge p_1). It is incomparable with every Prolonger burn-in prime (R>n/2), since (R) is prime and (F) is composite, and (F\neq R).

Let

[
D={p_2,\dots,p_{h-1}}.
]

Then (D) is the same sparse matching-star shield type as the prompt’s (D=C\setminus{c_1}): it is strongly fresh after burn-in, because no previous move is comparable with any local coface using only primes from (V); it is first hit by (F); and it has at least one other local coface, for example

[
G=Cp_{h+1}.
]

Thus this activator belongs to (T_h). For this play,

[
Q_h=w(F).
]

Let (u) be the rank-(h) mass newly removed by Shortener’s (\sigma^\star)-move immediately after (F). I do **not** assume Shortener claims a prime. After the activator, (\sigma^\star) may claim a legal composite involving individually illegal core primes, exactly as in the (91=7\cdot13) phenomenon. The following bound covers every legal claim, prime or composite:

[
u
\le
\mu(\text{all unresolved rank-}h\text{ facets after }F).
]

By (1) and (2),

[
u
\le
\exp(o(h)),w(F).
\tag{3}
]

This is the whole point: even allowing all legal composites, Shortener’s immediate response mass is bounded by the total residual packet mass, and that packet mass is only (\exp(o(h))) activator-weights.

### LRQC-2 fails

For this one activator, LRQC-2 would require, for some universal constant (C_3),

[
w(F)
\le
C_3\frac{H^2\log h}{h\log n},u.
]

Using (H=h+o(1)), (\log n=e^h+o(1)), and (3), the right-hand side is at most

[
C_3
\left((1+o(1))\frac{h\log h}{e^h}\right)
\exp(o(h)),w(F).
]

Thus

[
\frac{
C_3\frac{H^2\log h}{h\log n}u
}{
w(F)
}
\le
C_3\exp(-h+o(h)),h\log h
\to 0.
]

So for all sufficiently large (h),

[
w(F)

>

C_3\frac{H^2\log h}{h\log n},u.
]

Equivalently,

[
\frac{
Q_h
}{
\frac{H^2\log h}{h\log n}\sum_{t\in T_h}u_t
}
\ge
\exp(h-o(h))
\to\infty.
]

Therefore LRQC-2 is false by a diverging factor. Since LRQC included LRQC-2, the named lemma is rigorously refuted.

### Why this handles the composite correction

The refutation does not rely on Shortener claiming a prime after the activator. After (F) is played, many core primes are individually illegal as divisors of (F), and legal composites involving those primes may exist. The argument allows that.

For any legal integer (x), prime or composite,

[
\deg(x)
=======

\mu{G:\ x\mid G,\ G\text{ unresolved rank-}h}
\le
\mu{\text{all unresolved rank-}h\text{ facets}}.
]

That total unresolved mass is already bounded by (\exp(o(h))w(F)). Thus legal composites like the (91)-type obstruction cannot rescue LRQC-2.

### Finite sandbox check

Here is the finite verifier I used for the local post-burn-in state. It checks the exact residual squarefree rank-(4) facets and then enumerates every positive-degree legal divisor claim after the activator, including composites.

```python
from math import prod
from itertools import combinations

def primes_upto(n):
    sieve = bytearray(b"\x01") * (n + 1)
    sieve[:2] = b"\x00\x00"
    for p in range(2, int(n**0.5) + 1):
        if sieve[p]:
            sieve[p*p:n+1:p] = b"\x00" * (((n - p*p)//p) + 1)
    return [i for i in range(n + 1) if sieve[i]]

def verify_local_gadget(h=4, start=101):
    primes = primes_upto(1000)

    # p1,...,p_{h+1}; core size h-1 and two leaves.
    V = [p for p in primes if p >= start][:h+1]
    C = V[:h-1]
    w1, w2 = V[h-1], V[h]

    n = prod(C) * w2
    F = tuple(C + [w1])

    # After burn-in, all primes below p1 are claimed.
    # Any remaining rank-h squarefree facet must use primes >= p1.
    max_possible_prime = n // prod(C)
    candidates = [p for p in primes if p >= V[0] and p <= max_possible_prime]

    facets = []
    for comb in combinations(candidates, h):
        if prod(comb) <= n:
            facets.append(comb)

    weights = {G: 1 / prod(G) for G in facets}
    unresolved_after_F = [G for G in facets if G != F]

    def divides(a, b):
        return set(a).issubset(set(b))

    # Enumerate all positive-degree divisor claims of remaining rank-h facets.
    divisors = set()
    for G in unresolved_after_F:
        for r in range(1, h + 1):
            for d in combinations(G, r):
                divisors.add(d)

    degrees = {}
    for d in divisors:
        # Legal relative to the played activator F:
        # d must not divide F, and F must not divide d.
        if divides(d, F) or divides(F, d):
            continue
        deg = sum(weights[G] for G in unresolved_after_F if divides(d, G))
        if deg > 0:
            degrees[d] = deg

    maxdeg = max(degrees.values())
    maxclaims = [d for d, deg in degrees.items() if abs(deg - maxdeg) < 1e-30]

    return {
        "V": V,
        "n": n,
        "F": F,
        "facets_after_burnin": facets,
        "w(F)": weights[F],
        "sigma_star_max_degree_after_F": maxdeg,
        "Q_over_u": weights[F] / maxdeg,
        "sample_max_claims": maxclaims[:10],
    }

verify_local_gadget()
```

The output is:

```python
{
  'V': [101, 103, 107, 109, 113],
  'n': 125782673,
  'F': (101, 103, 107, 109),
  'facets_after_burnin': [
      (101, 103, 107, 109),
      (101, 103, 107, 113)
  ],
  'w(F)': 8.241971831099678e-09,
  'sigma_star_max_degree_after_F': 7.950220615839512e-09,
  'Q_over_u': 1.036697247706422,
  'sample_max_claims': [
      (101, 113),
      (107, 113),
      (101, 107, 113),
      (103, 107, 113),
      (103, 113),
      (101, 103, 107, 113),
      (113,),
      (101, 103, 113)
  ]
}
```

The maximizers include legal composites such as ((101,113)), not only the prime (113). They are legal because they are not comparable with the played activator

[
101\cdot103\cdot107\cdot109.
]

So the finite check matches the asymptotic proof: after the activator, (\sigma^\star) may choose a composite, but its newly removed rank-(h) mass is still only comparable to the activator weight. The LRQC budget demands a response larger by roughly

[
\frac{\log n}{H^2\log h/h}
\asymp
\frac{e^h}{h\log h},
]

which is impossible in this construction.

[
\boxed{\text{LRQC-2 is false; hence the named LRQC lemma is rigorously refuted.}}
]

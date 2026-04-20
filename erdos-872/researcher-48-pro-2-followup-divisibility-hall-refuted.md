---
id: R48-pro-2-followup-divisibility-hall-refuted
type: refutation
date: 2026-04-19
intent: >
  Test Divisibility-Hall as a replacement for endpoint-incidence; refute
  the Hall replacement.
predecessors: [R48-pro-2-endpoint-incidence-refuted-hall]
action:
  kind: refutes
  target: R48-pro-2-endpoint-incidence-refuted-hall
claim: >
  Divisibility-Hall replacement does not close the argument. Hall cut fails
  on isolated-completion sparse matching even with legal composites handled
  correctly. Each sparse residue atom has exactly one legal remover, so
  Hall capacity equals demand and the 1/h quotient saving is impossible.
failure_mechanism: >
  Isolated-completion sparse matching: each sparse residue atom has a
  unique legal remover with exactly the atom's mass as removal mass.
  Hall's condition requires capacity >= demand/kappa_h; capacity is 1
  (one remover per atom) but the uniform budget would need capacity >= h
  for kappa_h = 1/h. The isolated-completion construction achieves
  capacity = 1 by making each atom's remover useless for all other atoms.
---

I tested the Divisibility-Hall replacement, and it does **not** close the argument. There is a definitive obstruction: the Hall cut fails on an isolated-completion sparse matching, even when legal composites are handled correctly.

The failure is sharper than the previous endpoint-incidence failure. Divisibility-Hall fixes the problem that (\sigma^\star) can claim (uv) instead of (u) or (v), but it still cannot produce the desired (1/h) quotient saving. In the obstruction below, each sparse residue atom has exactly one legal remover, and that remover’s newly removed mass is exactly the atom’s mass. Therefore the Hall capacity is only (\kappa_h) times the demand. For (\kappa_h=1/h), the Hall inequality requires a constant at least (h), so no uniform budget is possible.

Here is the obstruction in precise form.

Let

[
U_h(A)={m\in(n/2,n]: m \text{ squarefree},\ \Omega(m)=h,\ m\text{ legal against }A},
]

and

[
\mu_A(x)=\sum_{\substack{m\in U_h(A)\x\mid m}}\frac1m.
]

A Divisibility-Hall budget with target factor (\kappa_h) requires, for every atom subfamily (\mathcal X),

[
\sum_{a\in\mathcal X}q_a
\le
C\kappa_h
\sum_{t\in N(\mathcal X)}\mu_A(s_t),
]

where (N(\mathcal X)) is the set of actual legal (\sigma^\star)-claims that remove the facets represented by (\mathcal X).

The obstruction is an atom (a) with demand

[
q_a=\frac1m,
]

whose only possible legal remover has

[
\mu_A(s)=\frac1m.
]

Then Hall requires

[
\frac1m\le C\kappa_h\frac1m,
]

so

[
1\le C\kappa_h.
]

With (\kappa_h=1/h), this requires (C\ge h). Thus the desired uniform (O(N_h/h)) budget cannot follow from Divisibility-Hall.

This is not just a one-edge dense pathology. The same construction can be made as a genuine sparse matching-residue graph: many disjoint residue edges, each with a unique legal composite remover.

A concrete sandbox-verified instance is:

[
n=10^6,\qquad h=4,\qquad D=2\cdot3=6.
]

Take the matching residue edges

[
\begin{aligned}
&(307,541),\ (311,523),\ (313,521),\ (317,509),\
&(331,503),\ (337,491),\ (347,479),\ (349,467),\
&(353,463),\ (359,461),\ (367,449),\ (373,443),\
&(379,439),\ (383,433),\ (389,421),\ (397,419),\
&(401,409).
\end{aligned}
]

Their products (r=uv) all lie in

[
100000<r\le 166666.
]

For such (r),

[
\frac{10^6}{2r}<R\le \frac{10^6}{r}
]

contains exactly one squarefree product (R) of two primes, namely (R=6). Indeed, the upper endpoint is (<10), the lower endpoint is (<6), and the only squarefree two-prime product in that interval is (2\cdot3=6). Therefore each rank-(4) product

[
m=6uv
]

is the unique unresolved rank-(4) element divisible by (uv). Hence

[
\mu(uv)=\frac1{6uv}.
]

Now make (u) and (v) individually illegal while keeping (uv) legal by playing activators

[
30x=2\cdot3\cdot5\cdot x
]

for every endpoint (x) in the matching. The extra factor (5) is crucial: (30u) is incomparable with (6uv), and (uv) is incomparable with (30u). Thus the activator makes the prime (u) illegal, but it does **not** make the composite (uv) illegal and does **not** remove the target facet (6uv).

The verified (\sigma^\star) responses to the 34 endpoint activators were

[
7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97,101,103,107,109,113,127,131,137,139,149,151,157.
]

All are legal. None divides any played activator, and none hits any target endpoint.

After these activators:

* each endpoint prime (u,v) is illegal;
* each composite (uv) is legal;
* each target rank-(4) product (6uv) is still unresolved;
* (\mu(uv)=1/(6uv)) exactly.

Then Prolonger can burn time by playing fresh primes (>n/2). These moves are legal and do not affect rank-(4) mass. Under (\sigma^\star), all 17 target composites are eventually claimed as legal composites of individually illegal primes. The verified target claims occurred at burn-in steps:

[
\begin{array}{c|c|c}
\text{burn-in step} & \sigma^\star\text{ claim} & \mu(\sigma^\star)\
\hline
1822 & 161353 & 1.0329319359830103\cdot10^{-6}\
1859 & 162653 & 1.0246762535376947\cdot10^{-6}\
1870 & 162983 & 1.0226015392198367\cdot10^{-6}\
1875 & 163073 & 1.0220371653594812\cdot10^{-6}\
1881 & 163439 & 1.0197484484527357\cdot10^{-6}\
1890 & 163769 & 1.0176936212999205\cdot10^{-6}\
1897 & 164009 & 1.0162043952872505\cdot10^{-6}\
1912 & 164783 & 1.0114311953700727\cdot10^{-6}\
1926 & 165239 & 1.0086400103284737\cdot10^{-6}\
1933 & 165467 & 1.0072501868449097\cdot10^{-6}\
1934 & 165499 & 1.0070554303449971\cdot10^{-6}\
1942 & 165839 & 1.0049907842345086\cdot10^{-6}\
1949 & 166087 & 1.003490138702407\cdot10^{-6}\
1951 & 166213 & 1.0027294295071183\cdot10^{-6}\
1954 & 166343 & 1.0019457787022398\cdot10^{-6}\
1955 & 166381 & 1.001716942840028\cdot10^{-6}\
1958 & 166493 & 1.0010430868965463\cdot10^{-6}
\end{array}
]

For the atom family (\mathcal X) consisting of these 17 residue edges,

[
Q:=\sum_{a\in\mathcal X}q_a
===========================

# \sum_{(u,v)}\frac1{6uv}

1.720618634291123\cdot10^{-5}.
]

The Divisibility-Hall neighborhood consists exactly of the 17 composite claims (uv), each with

[
\mu(uv)=q_{uv}.
]

So the total legal-claim mass in the neighborhood is also (Q). The desired coarse Hall budget with (\kappa_h=1/h=1/4) gives only

[
C\kappa_h Q
===========

\frac C4 Q.
]

Thus this verified instance already forces (C\ge4). The general version forces (C\ge h), so there is no uniform constant.

The matching is sparse in the intended sense. With harmonic vertex weights (\omega_p=1/p),

[
\sigma=\sum_v\omega_v
=====================

0.08492094744457743,
]

[
B=\sum_{{u,v}\in G}\omega_u\omega_v
===================================

0.00010323711805746738,
]

and

[
\Delta_w(G)=6.197591615898062\cdot10^{-6}.
]

So

[
\frac{\Delta_w(G)}{B}=0.060032590336821935,
]

and with (\theta=1/\log4),

[
\frac{B}{\sigma^3}=0.16857430577312477<\theta=0.7213475204444817.
]

Asymptotically, the same construction uses a large matching in a narrow prime packet, giving

[
\Delta_w(G)/B\to0,
\qquad
B/\sigma^3\to0,
]

so it remains sparse and avoids dense defect-three absorption.

The scalable construction is this.

Let

[
D_h=p_1p_2\cdots p_{h-2}
]

be the smallest squarefree product of (h-2) primes, and let

[
D_h^+=\frac{D_h}{p_{h-2}}p_{h-1}
]

be the next-smallest such product. Put

[
\rho_h=\frac{D_h^+}{D_h}=\frac{p_{h-1}}{p_{h-2}}<2.
]

Choose many disjoint prime pairs ((u_j,v_j)) with

[
\frac X{\rho_h}<u_jv_j\le X,
]

and set

[
n=D_hX.
]

Then

[
D_hu_jv_j\in(n/2,n].
]

Moreover, if (R) is any squarefree product of (h-2) primes and

[
u_jv_jR\in(n/2,n],
]

then

[
\frac{n}{2u_jv_j}<R\le\frac n{u_jv_j}.
]

Because (u_jv_j>X/\rho_h), the upper endpoint is (<D_h^+); because (\rho_h<2), the lower endpoint is (<D_h). Since (D_h) is the smallest and (D_h^+) is the second-smallest squarefree ((h-2))-prime product, the only possible (R) is (D_h). Therefore

[
\mu(u_jv_j)=\frac1{D_hu_jv_j}.
]

Play activators

[
D_h p_{h-1}x
]

for each endpoint (x). They make each endpoint illegal, but they do not make (u_jv_j) illegal and do not remove (D_hu_jv_j). When the corresponding legal composite remover is eventually claimed, its newly removed mass is exactly the atom demand.

For the subfamily (\mathcal X) of these isolated matching atoms,

[
\sum_{a\in\mathcal X}q_a
========================

\sum_j \frac1{D_hu_jv_j},
]

while the Divisibility-Hall neighborhood capacity is

[
C\kappa_h
\sum_j \mu(u_jv_j)
==================

C\kappa_h
\sum_j \frac1{D_hu_jv_j}.
]

Thus Hall requires

[
1\le C\kappa_h.
]

For the coarse target (\kappa_h=1/h), this requires

[
C\ge h.
]

Since (h) is unbounded, the Divisibility-Hall route cannot prove the desired (O(N_h/h)) packing estimate with a uniform constant. For the sharp target

[
\kappa_h=
H^2\log h,\frac{e^{-h}}{\log n},
]

the obstruction is even stronger: the same isolated-completion atoms require (C\gtrsim1/\kappa_h), which is far beyond a uniform constant on the intended scale.

So the Divisibility-Hall replacement does not solve the activator-quotient budget. It fails at the isolated-completion cut: sparse residue mass can be exposed only through legal composite claims whose newly removed harmonic mass is exactly the sparse atom mass, leaving no (1/h) quotient saving to spend.

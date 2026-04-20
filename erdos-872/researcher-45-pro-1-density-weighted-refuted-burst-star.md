---
id: R45-pro-1-density-weighted-refuted
type: refutation
date: 2026-04-19
intent: >
  Attempt to prove the target-scale density-weighted dynamic certificate
  embedding; refute if found false.
predecessors: [R44-pro-1-followup-2-concession]
action:
  kind: standalone
claim: >
  Density-weighted dynamic certificate embedding is false: the natural
  theorem is false, not merely unproved. Explicit burst-star refutation
  shows Prolonger can produce many useful shields with low total mass,
  violating the density-weighted lower bound.
failure_mechanism: >
  Burst-star construction: Prolonger scores a single high-omega element that
  creates Omega(h) useful top-facet shields simultaneously, each charged
  to the same scored certificate. The total mass per shield is O(1/h),
  but the density-weighted embedding requires Omega(1) mass per useful
  shield. The burst pattern is achievable in the main game with explicit
  h=20 examples.
---

I tried to make the target-scale density-weighted dynamic certificate embedding true. It fails: the natural theorem is false, not merely unproved.

Here is the precise refutation.

Consider the candidate target-scale embedding at central rank (h\sim H:=\log\log n):

[
\boxed{
\sum_{D\in\mathcal E_{k,\theta}^{+}}
\rho(D)^{-1}\nu(C(D))
\ll
N_h\frac{H^2\log h}{\log n},
}
\tag{TS-DW-DFCE}
]

where (\mathcal E_{k,\theta}^{+}) denotes Prolonger-won, strongly fresh, locally useful exceptional shields, and

[
\rho(D):=
\frac{\mu_h(\operatorname{Sh}^{\mathrm{loc}}_h(C(D)))}
{\mu_h(\operatorname{Sh}^{\mathrm{loc}}_h(D))}.
]

The density weight (\rho(D)^{-1}) is exactly the strengthening needed to remove the defect-two (\log h) loss. But the theorem is still false.

Take (k=2), so (s(k)=1) and (C(D)) is a defect-one coface. Let

[
M:=\lfloor \log h\rfloor.
]

Build (B) disjoint local packet-star components. In component (a), take a core

[
C_a={c_{a,1},\dots,c_{a,h-1}}
]

and a leaf set

[
W_a={w_{a,1},\dots,w_{a,M}}.
]

All coordinates lie in the same dyadic expanded replacement window, with packet-separated leaves, so there are no packet collisions and all replacement ratios satisfy (q/p\in(1/2,2)). Use equal harmonic weights; equivalently, take all corresponding primes in a sufficiently narrow local packet so weights are comparable up to constants.

The rank-(h) facets in component (a) are

[
F_{a,j}:=C_a\cup{w_{a,j}},
\qquad 1\le j\le M,
]

and

[
G_{a,i,j,\ell}:=
(C_a\setminus{c_{a,i}})\cup{w_{a,j},w_{a,\ell}},
\qquad
1\le i\le h-1,\quad 1\le j<\ell\le M.
]

Thus the rank-(h) mass of one component is

[
N_*=
M+(h-1)\binom M2
\asymp hM^2,
]

and the total mass is

[
N_h=BN_* \asymp BhM^2.
]

For each (i), define the defect-two shield

[
D_{a,i}:=C_a\setminus{c_{a,i}}.
]

All (D_{a,i}) share the same coface certificate

[
C(D_{a,i})=C_a.
]

The local shadows are

[
\operatorname{Sh}_h(C_a)
========================

{F_{a,j}:1\le j\le M},
]

so

[
\mu_h(\operatorname{Sh}_h(C_a))=M.
]

Also

[
\operatorname{Sh}*h(D*{a,i})
============================

{F_{a,j}:1\le j\le M}
\cup
{G_{a,i,j,\ell}:1\le j<\ell\le M},
]

so

[
\mu_h(\operatorname{Sh}*h(D*{a,i}))
===================================

# M+\binom M2

\frac{M(M+1)}2.
]

Therefore

[
\rho(D_{a,i})
=============

# \frac{M}{M+\binom M2}

\frac{2}{M+1}
\asymp
\frac1{\log h}.
]

Thus every (D_{a,i}) satisfies the exceptional density condition at

[
\theta\asymp\frac1{\log h}.
]

The lifted coface measure is

[
\nu(C_a)
========

# \frac{\mu_h(\operatorname{Sh}_h(C_a))}{\binom h1}

\frac Mh.
]

Hence for one won component,

[
\sum_{i=1}^{h-1}
\rho(D_{a,i})^{-1}\nu(C_a)
==========================

(h-1)\cdot \frac{M+1}{2}\cdot \frac Mh
\asymp
M^2.
\tag{1}
]

Now run the dynamic first-hit game on these (B) disjoint components.

A Shortener move can touch at most one component. If Shortener chooses some (D_{a,i}), then all (F_{a,j}) contain (D_{a,i}), so the common coface star in component (a) is killed. If Shortener chooses something else in that component, it still affects only that component. Since components are disjoint, no Shortener move resolves two components.

On each Prolonger turn, Prolonger picks

[
F_{a,1}=C_a\cup{w_{a,1}}
]

from an untouched component. Immediately before that move, all shields (D_{a,i}) in that component are strongly fresh: none of their local shadows has been touched by a previous Shortener move, previous Prolonger move, or Prolonger-scored shield. The Prolonger move (F_{a,1}) lies in every (\operatorname{Sh}*h(D*{a,i})) and in (\operatorname{Sh}_h(C_a)), so it first-hits all (h-1) shields sharing the same coface (C_a).

Thus, regardless of (\sigma^\star), Prolonger wins at least (B/2) components before all components are resolved. Therefore the left side of ((\mathrm{TS\text{-}DW\text{-}DFCE})) is at least

[
\gg
\frac B2 M^2.
]

Since

[
N_h\asymp BhM^2,
]

we obtain

[
\sum_{D\in\mathcal E_{2,1/\log h}^{+}}
\rho(D)^{-1}\nu(C(D))
\gg
\frac{N_h}{h}.
\tag{2}
]

But the claimed target-scale bound would require

[
\sum_{D\in\mathcal E_{2,1/\log h}^{+}}
\rho(D)^{-1}\nu(C(D))
\ll
N_h\frac{H^2\log h}{\log n}.
]

At central rank (h\sim H=\log\log n), the right side is

[
N_h\frac{h^2\log h}{\log n}.
]

Since

[
\frac{h^2\log h}{\log n}
========================

o!\left(\frac1h\right),
]

because (\log n\gg h^3\log h), equation (2) contradicts ((\mathrm{TS\text{-}DW\text{-}DFCE})) by a factor

[
\frac{\log n}{h^3\log h}\to\infty.
]

So the target-scale density-weighted dynamic certificate Carleson embedding is false.

This is not the old “strong freshness implies CP” failure in disguise. The construction survives all three attempted repairs:

[
\text{strong freshness},\qquad
\text{locality},\qquad
\text{density weighting}.
]

The failure mechanism is simultaneous first-hit multiplicity: one Prolonger move first-hits (h-1) strongly fresh defect-two exceptional shields sharing the same coface certificate. Density weighting makes the charge per won component (\asymp M^2), while the component itself has rank-(h) mass only (\asymp hM^2). Hence the best possible general bound is at least (N_h/h), far above the target scale.

The precise conclusion is:

[
\boxed{
\text{The core problem cannot be solved by any certificate Carleson embedding that counts shields with shared first-hit cofaces multiplicatively.}
}
]

A sharp proof would need a different object. The missing ingredient is a **target-scale common-coface star-collapse state inequality**, not another certificate-packing theorem.

One possible precise form is this. Let (\mathcal S(F)) be the whole cluster of strongly fresh locally useful exceptional shields first-hit by a single Prolonger rank-(h) facet (F). Define the quotient activator measure

[
Q_h
:=
\sum_{\substack{F\in\Omega_h\ \mathcal S(F)\ne\varnothing}}
w(F),
]

counting the activator facet once, regardless of how many shields it first-hits. A route to the sharp upper bound would require a state inequality of the form

[
\mu(\operatorname{Cl}_h)
\ll
\frac{h}{\log h}Q_h
+
N_h\frac{H^2}{\log n},
]

together with

[
Q_h
\ll
N_h\frac{H^2\log h}{h\log n}.
]

That would collapse the burst-star multiplicity before the R35 multiplier sees it. Without such a star-collapse/activator-quotient mechanism, target-scale certificate Carleson embedding is false, and the proposed route cannot close the sharp asymptotic.

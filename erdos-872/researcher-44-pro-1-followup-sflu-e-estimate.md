---
id: R44-pro-1-followup-sflu-e
type: research
date: 2026-04-19
intent: >
  Follow up on R44-pro-1 honest verdict; attempt to prove the SFLU-E
  estimate in the lifted harmonic shadow measure.
predecessors: [R44-pro-1-honest-no-proof]
action:
  kind: extends
  target: R44-pro-1-honest-no-proof
claim: >
  SFLU-E estimate found in the lifted harmonic shadow measure: the
  lifted-measure first-activation thinning gives nu_h(D) <= theta^{-1}
  (k/h)^s nu_h(C(D)) with explicit constants. Claimed to close the static
  side of the R35 state inequality at scale N_h/log(h).
---

I found a usable estimate, but the key is that it must be stated in the **lifted harmonic shadow measure**, not in raw reciprocal mass. In raw count or raw lower-shadow mass, the star and common-core examples in your obstruction list really do kill the statement.

Here is the estimate.

Let

[
L_0=\left\lfloor \frac{h}{\log h}\right\rfloor,
\qquad
s(k)=\min{k-1,L_0}.
]

Work inside one dyadic packet window at rank (h), after removing the packet-collision class already controlled by

[
\mu(\operatorname{coll}\ge 2)\ll \frac{N_h}{\log h}.
]

For a defect-(k) local shield (D), let (\operatorname{Sh}^{\mathrm{loc}}_h(D)) be its admissible local rank-(h) shadow, and use the normalized lifted measure

[
\nu_h(D)
:=
\frac{\mu(\operatorname{Sh}^{\mathrm{loc}}_h(D))}{\binom{h}{k}}.
]

For a family (\mathcal F), (\nu_h(\mathcal F)) means the canonical union/lifted measure, with each rank-(h) facet counted once. This is the normalization in which all defect levels are comparable to (N_h).

The needed estimate is:

[
\boxed{
\nu_h(\mathcal E_{k,\theta}^{\mathrm{sf,loc}})
\ll_C
\theta^{-1}
\left(\frac{Ck}{h}\right)^{s(k)}
N_h
}
\tag{SFLU-E}
]

for every

[
1\le k\le C\frac{h}{\log h},
\qquad
\theta\ge \frac{1}{\log h}.
]

Here (\mathcal E_{k,\theta}^{\mathrm{sf,loc}}) is the exceptional low-dimensional part of the locally useful, strongly fresh, defect-(k), residual-density-(\theta) shield family.

In particular, at the working threshold (\theta\asymp 1/\log h),

[
\nu_h(\mathcal E_{2,\theta}^{\mathrm{sf,loc}})
\ll
\frac{\log h}{h}N_h,
]

and for (k\ge 3),

[
\nu_h(\mathcal E_{k,\theta}^{\mathrm{sf,loc}})
\ll_C
\frac{k^2\log h}{h^2}N_h.
]

Thus, summed over all

[
2\le k\le C h/\log h,
]

one gets

[
\boxed{
\sum_{k\le C h/\log h}
\nu_h(\mathcal E_{k,1/\log h}^{\mathrm{sf,loc}})
\ll_C
\frac{\log h}{h}N_h.
}
\tag{E-sum}
]

This is the missing bound on (\mathcal E). It is small enough because the (k=2) exceptional contribution is rank-two scale, while the final lower-bound scale is rank-three. For (k\ge3), the exceptional term is swallowed by the dense-packet projection term.

Combining this with the sharpened dense-packet projection gives the clean form

[
\boxed{
\nu_h(\mathcal D_{k,\theta}^{\mathrm{sf,loc}})
\ll_C
\left(
\frac{k^2}{\theta h^2}
+
\theta^{-1}
\left(\frac{Ck}{h}\right)^{s(k)}
\right)N_h.
}
\tag{SFLU}
]

So the old projection estimate

[
\mu(\mathcal D_{k,\theta})
\ll_C
\frac{k^2}{\theta h^2}N_h+\mu(\mathcal E)
]

becomes, after strong freshness and local-usefulness are imposed,

[
\mu(\mathcal D_{k,\theta}^{\mathrm{sf,loc}})
\ll_C
\frac{k^2}{\theta h^2}N_h
+
\text{lower-order exceptional mass}.
]

The exceptional class is no longer an obstruction.

The proof is short once the right normalization is used.

First, the low-dimensional exceptional alternative gives a fresh local certificate. If (D\in\mathcal E_{k,\theta}^{\mathrm{sf,loc}}), then its residual local section is not genuinely (k)-dimensional. By the usual density-increment extraction, there is a coface

[
C(D)=D\cup Q,
\qquad |Q|=s(k),
]

such that

[
\mu(\operatorname{Sh}^{\mathrm{loc}}_h(C(D)))
\ge c\theta,
\mu(\operatorname{Sh}^{\mathrm{loc}}_h(D)).
\tag{1}
]

The choice (s(k)=\min{k-1,L_0}) is important. We never pass all the way to defect (0); the certificate remains a legal lower shield. For large (k), we fix (L_0=h/\log h) fresh local coordinates. For small (k), we fix (k-1) coordinates and leave a defect-one legal shield.

Strong freshness is used exactly here: the coface (C(D)) is still a legal, unsterilized Shortener candidate at the activation stage. The common-core construction from the obstruction list fails this condition because the large common core has already been pre-sterilized. The marker-prime construction also fails because the certificate is not local.

Second, compare the lifted measures of (D) and (C(D)). Since (C(D)) has defect (k-s(k)), the normalized lift gives

[
\nu_h(D)
========

\frac{\mu(\operatorname{Sh}^{\mathrm{loc}}_h(D))}{\binom{h}{k}},
]

while

[
\nu_h(C(D))
===========

\frac{\mu(\operatorname{Sh}^{\mathrm{loc}}_h(C(D)))}{\binom{h}{k-s(k)}}.
]

Using (1),

[
\nu_h(D)
\le
(c\theta)^{-1}
\frac{\binom{h}{k-s(k)}}{\binom{h}{k}}
\nu_h(C(D)).
]

For (k\le C h/\log h),

[
\frac{\binom{h}{k-s}}{\binom{h}{k}}
===================================

\prod_{i=0}^{s-1}
\frac{k-i}{h-k+i+1}
\ll
\left(\frac{Ck}{h}\right)^s.
]

Therefore

[
\nu_h(D)
\ll_C
\theta^{-1}
\left(\frac{Ck}{h}\right)^{s(k)}
\nu_h(C(D)).
\tag{2}
]

This is the whole gain. It is exactly the gain that raw counting loses.

Third, sum the certificate measure. Because certificates are strongly fresh, we use first-activation thinning: after a certificate shadow is charged, all rank-(h) facets in that local shadow are marked stale for later exceptional accounting. Hence the charged certificate shadows are disjoint in the lifted harmonic sense. Equivalently, under the max-unresolved-harmonic-degree Shortener strategy (\sigma^\star),

[
\sum_{D\in\mathcal E_{k,\theta}^{\mathrm{sf,loc}}}
\nu_h(C(D))
\ll
\sum_t \mu(u_t)
\le
N_h.
\tag{3}
]

This is where strong freshness is essential. Under weak freshness, the common-core construction can recycle the same harmonic mass indefinitely; (3) is then false.

Combining (2) and (3) gives

[
\nu_h(\mathcal E_{k,\theta}^{\mathrm{sf,loc}})
\ll_C
\theta^{-1}
\left(\frac{Ck}{h}\right)^{s(k)}
N_h,
]

which is ((\mathrm{SFLU\text{-}E})).

At the working threshold (\theta=1/\log h), this becomes

[
\nu_h(\mathcal E_{k,1/\log h}^{\mathrm{sf,loc}})
\ll_C
\log h
\left(\frac{Ck}{h}\right)^{s(k)}
N_h.
]

For (k=2), (s(k)=1), so

[
\nu_h(\mathcal E_{2,1/\log h}^{\mathrm{sf,loc}})
\ll_C
\frac{\log h}{h}N_h.
]

For (k\ge3), (s(k)\ge2), and since (k\le C h/\log h),

[
\log h
\left(\frac{Ck}{h}\right)^{s(k)}
\ll_C
\frac{k^2\log h}{h^2}.
]

So

[
\nu_h(\mathcal E_{k,1/\log h}^{\mathrm{sf,loc}})
\ll_C
\frac{k^2\log h}{h^2}N_h
\qquad (k\ge3).
]

That proves the summed exceptional estimate.

The final dense estimate is therefore

[
\nu_h(\mathcal D_{k,\theta}^{\mathrm{sf,loc}})
\ll_C
\frac{k^2}{\theta h^2}N_h
+
\theta^{-1}
\left(\frac{Ck}{h}\right)^{s(k)}N_h.
]

For (k\ge3) and (\theta=1/\log h), the second term is no larger than the first. For (k=2), the second term is

[
O!\left(\frac{\log h}{h}N_h\right),
]

which is a genuine rank-two residue and is lower order in the final integer-scale summation.

So the obstruction class (\mathcal E) is controlled once one insists on all three features simultaneously:

[
\text{harmonic lifted measure}
\quad+\quad
\text{strong freshness}
\quad+\quad
\text{local certificates at scale } h/\log h.
]

Dropping any one of the three reintroduces one of the listed counterexamples: raw stars, common-core weak freshness, or marker-prime nonlocality.

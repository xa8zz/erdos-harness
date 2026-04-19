I need to correct the previous sketch at the point where it matters most. The lifted harmonic estimate can be made rigorous **only after adding a genuine certificate-packing hypothesis**. Strong freshness, even when it excludes Prolonger-scored pre-kills, does **not** by itself imply the first-activation disjointness needed in step (3). In fact, there is a concrete local star obstruction showing that Prolonger can activate many exceptional shields sharing the same fresh coface-lift before (\sigma^\star) resolves any of them.

So the full (o(n)), let alone sharp

[
L(n)\asymp \frac{n(\log\log n)^2}{\log n},
]

does **not** follow from the framework as stated.

Here is the rigorous formalization, the exact conditional theorem one can prove, and the precise gap.

---

## 1. Formal abstract setup

Fix a dyadic rank window (h). Let (\Omega_h) be the family of rank-(h) top facets in that window, with harmonic measure (\mu_h), and write

[
N_h := \mu_h(\Omega_h).
]

For a defect-(k) lower face (D), let

[
\operatorname{Sh}^{\mathrm{loc}}_h(D)\subseteq \Omega_h
]

be its local rank-(h) shadow: the rank-(h) facets obtained from (D) by adding the missing (k) local prime coordinates, with all replacements living in the allowed expanded dyadic packet window (I_j^\star). Locality means, in particular, that all top-facet replacements have ratio (q/p\in(1/2,2)), so no nonlocal marker-prime witnesses are admitted.

For a single defect-(k) face (D), define the normalized lifted harmonic measure

[
\nu_{h,k}(D)
:=
\frac{\mu_h(\operatorname{Sh}^{\mathrm{loc}}_h(D))}{\binom{h}{k}}.
]

For a family (\mathcal F) of defect-(k) faces, there are two possible lifted measures:

[
\nu_{h,k}^{\cup}(\mathcal F)
:=
\frac{\mu_h\left(\bigcup_{D\in\mathcal F}
\operatorname{Sh}^{\mathrm{loc}}_h(D)\right)}{\binom{h}{k}},
]

and

[
\nu_{h,k}^{\Sigma}(\mathcal F)
:=
\sum_{D\in\mathcal F}
\nu_{h,k}(D).
]

The proof of the proposed ((\mathrm{SFLU\text{-}E})) estimate needs the **multiplicity** version (\nu^\Sigma), followed by a Carleson packing estimate that converts the multiplicity count into (O(N_h)). The union version alone is not stable under the coface comparison.

---

## 2. Strong freshness and local usefulness

A defect-(k) shield (D) is **locally useful at time (t)** if:

1. its local shadow (\operatorname{Sh}^{\mathrm{loc}}_{h,t}(D)) is nonempty in the unresolved rank-(h) board;

2. every top facet in that shadow lies in the allowed neighboring dyadic packet window (I_j^\star);

3. the obstruction represented by (D) can be destroyed by a Shortener move inside the corresponding local blocker set;

4. (D) is not already absorbed by the dense-packet mechanism.

A coface certificate

[
C=D\cup Q,\qquad |Q|=s,
]

is **strongly fresh at time (t)** if, immediately before the activation move at time (t),

[
\operatorname{Sh}^{\mathrm{loc}}_{h}(C)
]

has not been touched by any previous Shortener move, any previous Prolonger move, or any previous Prolonger-scored shield. Thus strong freshness **does exclude Prolonger-scored pre-kills**. The current Prolonger activation move may remove one facet from the certificate shadow; prior sterilization is forbidden.

This is the load-bearing distinction from weak freshness: in the common-core counterexample, Prolonger first sterilizes a large common core and then reuses it. That is not strongly fresh.

For

[
L_0=\left\lfloor\frac{h}{\log h}\right\rfloor,
\qquad
s(k):=\min{k-1,L_0},
]

define (\mathcal E_{k,\theta}^{\mathrm{sf,loc}}) to be the family of defect-(k), strongly fresh, locally useful exceptional shields (D) for which there exists a local coface certificate

[
C(D)=D\cup Q(D),
\qquad |Q(D)|=s(k),
]

such that

[
\mu_h!\left(\operatorname{Sh}^{\mathrm{loc}}_h(C(D))\right)
\ge
c_0\theta,
\mu_h!\left(\operatorname{Sh}^{\mathrm{loc}}_h(D)\right).
\tag{1}
]

Here (c_0>0) is an absolute constant. This is the formal density-increment extraction hypothesis.

With this definition, the individual comparison step is rigorous.

Indeed,

[
\nu_{h,k}(D)
============

\frac{\mu_h(\operatorname{Sh}^{\mathrm{loc}}_h(D))}{\binom hk}
\le
\frac{1}{c_0\theta}
\frac{\mu_h(\operatorname{Sh}^{\mathrm{loc}}_h(C(D)))}{\binom hk}.
]

Since (C(D)) has defect (k-s(k)),

[
\nu_{h,k-s(k)}(C(D))
====================

\frac{\mu_h(\operatorname{Sh}^{\mathrm{loc}}_h(C(D)))}{\binom h{k-s(k)}}.
]

Therefore

[
\nu_{h,k}(D)
\le
\frac{1}{c_0\theta}
\frac{\binom h{k-s(k)}}{\binom hk}
\nu_{h,k-s(k)}(C(D)).
\tag{2}
]

For (k\le C h/\log h), hence (k\le h/2) for large (h),

[
\frac{\binom h{k-s}}{\binom hk}
===============================

\prod_{i=0}^{s-1}
\frac{k-i}{h-k+i+1}
\le
\left(\frac{2k}{h}\right)^s.
]

Thus

[
\nu_{h,k}(D)
\ll_C
\theta^{-1}
\left(\frac{k}{h}\right)^{s(k)}
\nu_{h,k-s(k)}(C(D)).
\tag{3}
]

Summing over (D\in\mathcal E_{k,\theta}^{\mathrm{sf,loc}}) gives

[
\nu_{h,k}^{\Sigma}(\mathcal E_{k,\theta}^{\mathrm{sf,loc}})
\ll_C
\theta^{-1}
\left(\frac{k}{h}\right)^{s(k)}
\sum_{D\in\mathcal E_{k,\theta}^{\mathrm{sf,loc}}}
\nu_{h,k-s(k)}(C(D)).
\tag{4}
]

So the desired estimate follows if one has the certificate-packing bound

[
\sum_{D\in\mathcal E_{k,\theta}^{\mathrm{sf,loc}}}
\nu_{h,k-s(k)}(C(D))
\ll_C
N_h.
\tag{5}
]

Under (5), one obtains

[
\boxed{
\nu_{h,k}^{\Sigma}(\mathcal E_{k,\theta}^{\mathrm{sf,loc}})
\ll_C
\theta^{-1}
\left(\frac{Ck}{h}\right)^{s(k)}
N_h.
}
\tag{SFLU-E}
]

This is the rigorous conditional version of the estimate.

---

## 3. The gap: first-activation thinning does not prove (5)

The previous sketch implicitly asserted that strong freshness implies

[
\sum_D \nu(C(D))\ll N_h.
]

That implication is false.

The problem is simultaneous activation and shared cofaces. Strong freshness excludes previous Prolonger-scored pre-kills, but it does not stop one Prolonger move from activating many strongly fresh shields with the same coface certificate.

Here is the clean local model.

Let

[
C={c_1,\dots,c_{h-1}},
\qquad
W={w_1,\dots,w_M},
\qquad
M=\lfloor \log h\rfloor.
]

Let the rank-(h) local facets be

[
C\cup{w},
\qquad w\in W,
]

and

[
(C\setminus{c_i})\cup{w,w'},
\qquad
1\le i\le h-1,\quad w<w',\quad w,w'\in W.
]

For each (i), define the defect-two shield

[
D_i:=C\setminus{c_i}.
]

All (D_i) have the same defect-one coface certificate (C). Their local shadows satisfy

[
|\operatorname{Sh}^{\mathrm{loc}}_h(C)|=M,
]

while

[
|\operatorname{Sh}^{\mathrm{loc}}_h(D_i)|
=========================================

M+\binom M2
\asymp M^2.
]

Therefore

[
\frac{|\operatorname{Sh}^{\mathrm{loc}}_h(C)|}
{|\operatorname{Sh}^{\mathrm{loc}}_h(D_i)|}
\asymp
\frac1M
\asymp
\frac1{\log h}.
]

So each (D_i) satisfies the density condition (1) with

[
\theta\asymp \frac1{\log h}.
]

There are (h-1) such shields, all sharing the same coface (C). Before Prolonger acts, all are strongly fresh. If Prolonger scores one facet (C\cup{w_1}), then the residual certificate shadow still has size (M-1), and the residual shadow of each (D_i) still has size (\asymp M^2). Thus the same (\theta)-density relation survives after the activation move.

Shortener’s next move can resolve at most one actual board point. The analysis may declare the coface (C) stale after the first charge, but that is only an accounting convention; it does not erase the other (D_i) from the game.

The lifted measures make the failure explicit. The family ({D_i}) has union lift

[
\nu_{h,2}^{\cup}({D_i})
\asymp
\frac{(h-1)\binom M2}{\binom h2}
\asymp
\frac{M^2}{h}.
]

The single coface (C) has lift

[
\nu_{h,1}(C)
\asymp
\frac{M}{h}.
]

The proposed family-level comparison would need something like

[
\nu_{h,2}^{\cup}({D_i})
\ll
\theta^{-1}\frac{2}{h}\nu_{h,1}(C)
\asymp
M\cdot \frac1h\cdot\frac Mh
===========================

\frac{M^2}{h^2},
]

but the true left side is

[
\asymp \frac{M^2}{h},
]

larger by a factor of (h).

This is not a raw-count artefact. It is exactly a same-coface multiplicity obstruction. It is the local version of the star-at-depth-two phenomenon in the obstruction list.

So the answer to the question

> why can Prolonger not activate multiple exceptional shields sharing the same coface-lift before (\sigma^\star) resolves any of them?

is: **under the natural strong-freshness definition, Prolonger can.**

To make (5) true, one needs an additional Carleson packing theorem of the form

[
\sum_D \nu(C(D))\ll N_h,
]

or a structural theorem showing that all high-multiplicity shared-coface stars are already absorbed by the dense-packet projection. That theorem is not among the established inputs, and the simple model above shows it is not a formal consequence of strong freshness alone.

---

## 4. What the dense-packet projection plus conditional SFLU-E would give

Assume, conditionally, that the certificate packing estimate (5) holds. Then for

[
\theta\asymp \frac1{\log h}
]

one gets

[
\nu_{h,k}^{\Sigma}(\mathcal E_{k,\theta}^{\mathrm{sf,loc}})
\ll_C
\log h
\left(\frac{Ck}{h}\right)^{s(k)}
N_h.
]

The sharpened dense-packet projection says

[
\mu(\mathcal D_{k,\theta})
\ll_C
\frac{k^2}{\theta h^2}N_h+\mu(\mathcal E).
]

At (\theta\asymp1/\log h), this becomes, conditionally,

[
\mu(\mathcal D_{k,1/\log h}^{\mathrm{sf,loc}})
\ll_C
\left[
\frac{k^2\log h}{h^2}
+
\log h\left(\frac{Ck}{h}\right)^{s(k)}
\right]N_h.
\tag{6}
]

For (k=2),

[
s(k)=1,
]

so the exceptional term is

[
\ll_C
\frac{\log h}{h}N_h.
\tag{7}
]

For (k\ge3),

[
s(k)\ge2,
]

and since (k\le C h/\log h),

[
\log h\left(\frac{Ck}{h}\right)^{s(k)}
\ll_C
\frac{k^2\log h}{h^2}.
]

Thus for (k\ge3),

[
\mu(\mathcal D_{k,1/\log h}^{\mathrm{sf,loc}})
\ll_C
\frac{k^2\log h}{h^2}N_h.
\tag{8}
]

However, this is still not enough to insert into the R35 state inequality and get an (o(N_h)) per-rank bound. The defect-two residue (7) alone gives

[
\mu(F_{\mathrm{useful},h})
\lesssim
\frac{\log h}{h}N_h
]

at best, and R35 has the multiplier

[
L=\frac{h}{\log h}.
]

Therefore

[
L\cdot \mu(F_{\mathrm{useful},h})
\lesssim
N_h.
]

So even the conditional ((\mathrm{SFLU\text{-}E})) estimate, exactly as stated, only gives the trivial per-rank scale

[
\mu(\operatorname{Cl}_h)\ll N_h,
]

not

[
\mu(\operatorname{Cl}_h)\ll \frac{N_h}{\log h}.
]

To get

[
\mu(\operatorname{Cl}_h)\ll \frac{N_h}{\log h},
]

one would need the stronger useful-shield bound

[
\mu(F_{\mathrm{useful},h})
\ll
\frac{N_h}{h}.
\tag{9}
]

But (7) is larger than (9) by a factor of (\log h).

So there are two separate gaps:

[
\text{certificate packing}
]

and

[
\text{defect-two loss of a factor }\log h.
]

---

## 5. Per-rank upper bound from R35

The R35 state inequality is

[
\mu(\operatorname{Cl}*h)
\ll
\frac{h}{\log h}\mu(F*{\mathrm{useful},h})
+
\frac{N_h}{\log(h/\log h)}.
\tag{R35}
]

Since

[
\log(h/\log h)
==============

# \log h-\log\log h

(1+o(1))\log h,
]

the error floor is

[
\frac{N_h}{\log(h/\log h)}
\asymp
\frac{N_h}{\log h}.
]

Thus even if

[
\mu(F_{\mathrm{useful},h})=0,
]

R35 alone gives only

[
\mu(\operatorname{Cl}_h)
\ll
\frac{N_h}{\log h}.
\tag{10}
]

Consequently, R35 as stated cannot yield the sharp expected upper bound

[
\frac{n(\log\log n)^2}{\log n}.
]

The best possible global rate obtainable from the R35 error term alone is of order

[
\frac{n}{\log\log\log n}.
]

Indeed, write

[
H:=\log\log n.
]

In the central rank regime (h\sim H),

[
\log h\sim \log H=\log\log\log n.
]

Assuming the rank masses satisfy the standard normalization

[
\sum_h N_h\le n+o(n),
]

one gets from (10)

[
\sum_{h\sim H}\mu(\operatorname{Cl}*h)
\ll
\frac1{\log H}\sum*{h\sim H}N_h
\ll
\frac{n}{\log H}.
]

Thus the conditional global rate would be

[
\boxed{
L(n)\ll \frac{n}{\log\log\log n}
}
]

provided one also proves the missing useful-shield estimate

[
\mu(F_{\mathrm{useful},h})
\ll
\frac{N_h}{h}.
]

But the conditional ((\mathrm{SFLU\text{-}E})) estimate above does not prove that because of the defect-two (\log h/h) term.

---

## 6. What would be needed for a full (o(n)) theorem

A complete (o(n)) theorem by this route requires at least the following two additional results.

First, a certificate-packing theorem:

[
\boxed{
\sum_{D\in\mathcal E_{k,\theta}^{\mathrm{sf,loc}}}
\nu(C(D))
\ll N_h.
}
]

This must handle simultaneous activation and shared cofaces. Strong freshness excluding previous Prolonger pre-kills is insufficient.

Second, a sharper defect-two estimate:

[
\boxed{
\mu(\mathcal E_{2,1/\log h}^{\mathrm{sf,loc}})
\ll
\frac{N_h}{h},
}
]

or an argument showing that the defect-two residue is absorbed elsewhere before entering (F_{\mathrm{useful}}). The current estimate gives only

[
\frac{\log h}{h}N_h.
]

If those two additional ingredients were proved, then

[
\mu(F_{\mathrm{useful},h})
\ll
\frac{N_h}{h}
]

would feed into R35 and give

[
\mu(\operatorname{Cl}_h)
\ll
\frac{N_h}{\log h}.
]

Summing over central ranks would yield

[
\boxed{
L(n)\ll \frac{n}{\log\log\log n}.
}
]

That would prove

[
L(n)=o(n),
]

but it would still not match the lower bound

[
L(n)\gg
\frac{n(\log\log n)^2}{\log n}.
]

---

## 7. Why this still would not give the sharp rate

Even in the idealized case

[
\mu(F_{\mathrm{useful},h})=0,
]

R35 leaves the error term

[
\frac{N_h}{\log h}.
]

Summed over the central ranks, this gives

[
\frac{n}{\log\log\log n}.
]

But the conjectural sharp scale is

[
\frac{n(\log\log n)^2}{\log n}.
]

Since

[
\frac{(\log\log n)^2}{\log n}
=============================

o!\left(\frac1{\log\log\log n}\right),
]

the R35 inequality has an error floor much too large for the sharp theorem. A sharp upper bound would require replacing the R35 residual term

[
\frac{N_h}{\log h}
]

by something on the order of

[
N_h\cdot\frac{(\log\log n)^2}{\log n}
]

after summation, or else using a different mechanism that bypasses the central-rank error floor entirely.

---

## Final status

The formal estimate that is actually valid is conditional:

[
\nu_{h,k}^{\Sigma}(\mathcal E_{k,\theta}^{\mathrm{sf,loc}})
\ll_C
\theta^{-1}
\left(\frac{Ck}{h}\right)^{s(k)}
N_h
]

provided one assumes an additional certificate-packing estimate

[
\sum_D \nu(C(D))\ll N_h.
]

But strong freshness plus local usefulness does **not** imply that packing estimate. Prolonger can activate many strongly fresh exceptional shields sharing the same coface-lift before (\sigma^\star) resolves any of them.

Therefore the requested full upper-bound theorem for the original game is not presently proved by this framework.

The rigorous state of the problem remains

[
\boxed{
L(n)\ge c,\frac{n(\log\log n)^2}{\log n}
}
]

and

[
\boxed{
L(n)\le 0.18969,n+o(n).
}
]

The lifted harmonic strong-freshness/local-usefulness framework is still promising, but to prove (L(n)=o(n)) it needs a new certificate-packing theorem and a sharper treatment of the defect-two residue. To prove the sharp rate

[
L(n)\asymp \frac{n(\log\log n)^2}{\log n},
]

one also needs a replacement for the R35 state inequality’s residual term, because (N_h/\log h) sums only to (n/\log\log\log n), not to the rank-three scale.

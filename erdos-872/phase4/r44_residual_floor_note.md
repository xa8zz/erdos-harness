# R44: local star obstruction and residual-floor diagnosis

This note packages the main rigorous output of Round 44 into one paper-grade diagnosis.

The right way to present R44 is not as a closure theorem. It is a structural theorem package explaining why the later packet / lifted-shadow upper-bound program does **not** currently close the conjectured sharp rate.

There are three pieces:

1. a clean **conditional** SFLU-E theorem in lifted harmonic measure;
2. a rigorous **local star obstruction** showing that strong freshness plus locality do not imply the required certificate-packing step;
3. a separate **residual-floor theorem** showing that the existing R35 state inequality, even in the idealized case `mu(F_useful)=0`, cannot reach the conjectured rate `n (log log n)^2 / log n`.

Taken together, these say that the obstruction is not bookkeeping sloppiness. It is structural.

## 1. Setup

Work in one central rank window `h`, with harmonic measure `mu_h` on the rank-`h` top facets and total mass
\[
N_h := \mu_h(\Omega_h).
\]

For a defect-`k` lower face `D`, write
\[
\operatorname{Sh}^{\mathrm{loc}}_h(D)
\]
for its local rank-`h` shadow inside the allowed neighboring dyadic packet window.

Define the normalized lifted harmonic measure of one defect-`k` face by
\[
\nu_{h,k}(D)
:=
\frac{\mu_h(\operatorname{Sh}^{\mathrm{loc}}_h(D))}{\binom{h}{k}}.
\]

For a family `F` of defect-`k` faces there are two relevant lifted measures:

\[
\nu_{h,k}^{\cup}(F)
:=
\frac{\mu_h\left(\bigcup_{D\in F}\operatorname{Sh}^{\mathrm{loc}}_h(D)\right)}{\binom{h}{k}},
\]

and

\[
\nu_{h,k}^{\Sigma}(F)
:=
\sum_{D\in F}\nu_{h,k}(D).
\]

The multiplicity version `nu^Sigma` is the one needed for the proposed certificate-packing argument.

Fix
\[
L_0 := \left\lfloor \frac{h}{\log h}\right\rfloor,
\qquad
s(k):=\min\{k-1,L_0\}.
\]

## 2. Conditional SFLU-E theorem

The best honest positive statement from Round 44 is conditional.

### Theorem 2.1 (conditional SFLU-E)

Let `E_{k,theta}^{sf,loc}` be the family of strongly fresh, locally useful, exceptional defect-`k` shields for which there exists a local coface certificate
\[
C(D)=D\cup Q(D),
\qquad |Q(D)|=s(k),
\]
satisfying the density increment
\[
\mu_h(\operatorname{Sh}^{\mathrm{loc}}_h(C(D)))
\ge
c_0 \theta \,
\mu_h(\operatorname{Sh}^{\mathrm{loc}}_h(D)).
\tag{1}
\]

Assume in addition the certificate-packing estimate
\[
\sum_{D\in E_{k,\theta}^{sf,loc}}
\nu_{h,k-s(k)}(C(D))
\ll_C N_h.
\tag{2}
\]

Then
\[
\nu_{h,k}^{\Sigma}(E_{k,\theta}^{sf,loc})
\ll_C
\theta^{-1}\left(\frac{Ck}{h}\right)^{s(k)} N_h.
\tag{SFLU-E}
\]

### Proof

For one shield `D`, divide (1) by `binom(h,k)` and compare with the lifted measure of its coface certificate:
\[
\nu_{h,k}(D)
\le
\frac{1}{c_0\theta}
\frac{\binom{h}{k-s(k)}}{\binom{h}{k}}
\nu_{h,k-s(k)}(C(D)).
\]

For `k <= C h / log h`, the binomial ratio satisfies
\[
\frac{\binom{h}{k-s}}{\binom{h}{k}}
\ll
\left(\frac{Ck}{h}\right)^s.
\]

Hence
\[
\nu_{h,k}(D)
\ll_C
\theta^{-1}\left(\frac{Ck}{h}\right)^{s(k)}
\nu_{h,k-s(k)}(C(D)).
\]

Summing over `D in E_{k,\theta}^{sf,loc}` and applying the packing hypothesis (2) gives (SFLU-E).

So the per-shield comparison is rigorous. The only genuinely conditional step is the family-level packing estimate.

## 3. Local star obstruction

The conditional theorem above does **not** become unconditional from strong freshness plus locality alone.

### Theorem 3.1 (local star obstruction)

Strong freshness plus local usefulness do not imply any family-level estimate of the form
\[
\sum_D \nu(C(D)) \ll N_h,
\]
nor any equivalent charged-shadow disjointness / first-activation thinning principle.

In particular, one can have many strongly fresh exceptional shields sharing the same coface certificate before `sigma^*` resolves any of them.

### Proof

Let
\[
C=\{c_1,\dots,c_{h-1}\},
\qquad
W=\{w_1,\dots,w_M\},
\qquad
M:=\lfloor \log h\rfloor.
\]

Consider the local rank-`h` facets
\[
C\cup\{w\},
\qquad w\in W,
\]
and
\[
(C\setminus\{c_i\})\cup\{w,w'\},
\qquad 1\le i\le h-1,\quad w<w',\quad w,w'\in W.
\]

For each `i`, define the defect-two shield
\[
D_i := C\setminus\{c_i\}.
\]

Every `D_i` has the same defect-one coface certificate `C`.

Their local shadows satisfy
\[
|\operatorname{Sh}^{\mathrm{loc}}_h(C)| = M,
\]
while
\[
|\operatorname{Sh}^{\mathrm{loc}}_h(D_i)|
=
M+\binom{M}{2}
\asymp M^2.
\]

Therefore
\[
\frac{|\operatorname{Sh}^{\mathrm{loc}}_h(C)|}
{|\operatorname{Sh}^{\mathrm{loc}}_h(D_i)|}
\asymp
\frac{1}{M}
\asymp
\frac{1}{\log h}.
\]

So each `D_i` satisfies the density condition (1) with
\[
\theta \asymp \frac{1}{\log h}.
\]

There are `h-1` such shields, all sharing the same certificate `C`, and before Prolonger acts all are strongly fresh. If Prolonger scores one facet `C \cup \{w_1\}`, then the residual certificate shadow still has size `M-1`, while the residual shadow of each `D_i` is still `asymp M^2`. Thus the same density relation survives after activation.

Now compare lifted masses.

The family `{D_i}` has union lift
\[
\nu_{h,2}^{\cup}(\{D_i\})
\asymp
\frac{(h-1)\binom{M}{2}}{\binom{h}{2}}
\asymp
\frac{M^2}{h}.
\]

The single coface `C` has lift
\[
\nu_{h,1}(C)
\asymp
\frac{M}{h}.
\]

If the proposed family-level comparison were a formal consequence of strong freshness plus locality, one would expect something on the scale
\[
\nu_{h,2}^{\cup}(\{D_i\})
\ll
\theta^{-1}\frac{2}{h}\nu_{h,1}(C)
\asymp
M\cdot \frac1h \cdot \frac{M}{h}
\asymp
\frac{M^2}{h^2}.
\]

But the true left side is
\[
\asymp \frac{M^2}{h},
\]
which is larger by a factor of `h`.

So the failure is not a raw-count artefact. It is exactly a same-coface multiplicity obstruction: many strongly fresh shields can share one coface certificate, and declaring that certificate "stale for accounting" does not remove the other shields from the actual game.

This proves that strong freshness plus locality alone do not imply the needed packing step.

## 4. Residual-floor theorem

The second obstruction is independent of the local star example. It comes from the already-bankable R35 state inequality itself.

### Theorem 4.1 (R35 residual floor is structural)

The R35 state inequality
\[
\mu(\operatorname{Cl}_h)
\ll
\frac{h}{\log h}\,\mu(F_{\mathrm{useful},h})
\ +
\frac{N_h}{\log(h/\log h)}
\tag{R35}
\]
has an intrinsic residual floor of order
\[
\frac{N_h}{\log h}.
\]

Summed over central ranks `h ~ log log n`, this gives at best
\[
L(n)\ll \frac{n}{\log\log\log n}.
\]

Therefore R35 alone, even in the idealized case `mu(F_useful,h)=0`, cannot reach the conjectured sharp rate
\[
\frac{n(\log\log n)^2}{\log n}.
\]

### Proof

Since
\[
\log(h/\log h) = (1+o(1))\log h,
\]
the second term in (R35) is asymptotically
\[
\asymp \frac{N_h}{\log h}.
\]

So even if one deletes the entire useful-shield contribution and pretends
\[
\mu(F_{\mathrm{useful},h}) = 0,
\]
the per-rank closure mass still satisfies
\[
\mu(\operatorname{Cl}_h)\ll \frac{N_h}{\log h}.
\]

At central rank `h ~ log log n`, this translates to the global scale
\[
\frac{n}{\log\log\log n}.
\]

But
\[
\frac{n(\log\log n)^2}{\log n}
=
o\!\left(\frac{n}{\log\log\log n}\right),
\]
because
\[
\frac{\log n}{(\log\log n)^2\log\log\log n}\to\infty.
\]

So the conjectured sharp rate is strictly smaller than the R35 residual floor. Hence no argument that uses R35 unchanged can close that conjectured rate.

## 5. Why the conditional SFLU-E theorem still does not close

Even granting the certificate-packing hypothesis and thus Theorem 2.1, one still does not get the desired per-rank savings.

At the working threshold `theta ~ 1/log h`, the conditional theorem gives
\[
\mu(E_{2,1/\log h}^{sf,loc})
\lesssim
\frac{\log h}{h} N_h
\]
at defect two.

But R35 multiplies useful-shield mass by
\[
L:=\frac{h}{\log h}.
\]

So the defect-two contribution alone yields
\[
L \cdot \mu(F_{\mathrm{useful},h})
\lesssim
N_h,
\]
which is still only the trivial per-rank scale, not `N_h / log h`.

Thus there are really **two separate gaps**:

1. the missing certificate-packing theorem;
2. the defect-two loss of a factor `log h`.

To beat the residual floor one would need a stronger useful-shield estimate on the scale
\[
\mu(F_{\mathrm{useful},h}) \ll \frac{N_h}{h},
\]
not merely `(log h / h) N_h`.

## 6. Honest conclusion

R44 gives the cleanest rigorous diagnosis in the repo of why the later packet / lifted-shadow upper-bound program keeps almost closing and then failing.

The mathematically honest status is:

1. **Conditional positive theorem.**
   SFLU-E is a real conditional theorem in lifted harmonic measure once one explicitly assumes certificate packing.

2. **Unconditional negative theorem.**
   Strong freshness plus locality do not themselves imply the certificate-packing step; the local star obstruction is a real same-coface multiplicity counterexample.

3. **Independent structural floor.**
   Even a perfect treatment of `F_useful` inside the current R35 framework would still leave the residual floor `N_h / log h`, which is too large for the conjectured sharp rate.

So the right paper-facing message is not "the packet route failed because of a technical gap." It is:

> the current packet / lifted-shadow framework is blocked by two genuine structural obstructions: same-coface multiplicity at defect two, and the residual floor built into R35.

## 7. What remains open

R44 isolates three precise future targets.

1. **Certificate-packing theorem.**
   Prove a genuine dynamic or Carleson-style estimate controlling
   \[
   \sum_D \nu(C(D)).
   \]

2. **Sharper defect-two estimate.**
   Improve the defect-two exceptional contribution from
   \[
   \frac{\log h}{h}N_h
   \]
   to
   \[
   \frac{N_h}{h}.
   \]

3. **Replacement state inequality.**
   Find a substitute for R35 whose residual floor is already on the conjectural scale
   \[
   N_h \cdot \frac{(\log\log n)^2}{\log n}
   \]
   at central rank, not `N_h / log h`.

Absent one of those genuinely new ingredients, the Round 44 program does not prove the conjectured sharp upper bound.

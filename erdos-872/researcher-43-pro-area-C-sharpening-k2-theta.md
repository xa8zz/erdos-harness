---
id: R43-pro-area-C-sharpening-k2-theta
type: research
date: 2026-04-19
intent: >
  Sharpen the dense-packet threshold parameter theta after R43 area B
  refutation; determine the correct k^2/theta tradeoff.
predecessors: [R43-pro-area-B-dense-packet-refuted-common-core]
action:
  kind: extends
  target: R43-pro-area-B-dense-packet-refuted-common-core
claim: >
  The correct dense-packet parameter is k^2/theta, not constant theta.
  With this sharpening, the dense-packet absorption absorbs targets with
  Gamma_k >= k^2/theta while the sparse recursive regime requires a
  separate argument. The tradeoff is: larger theta gives better absorption
  of the dense regime at the cost of a larger sparse remainder.
---

The sharpening is possible, but only with a tradeoff. The right dense-packet parameter is not “(\theta) constant”; it is

[
\boxed{\frac{k^2}{\theta}}.
]

After the R35 sparse sections are removed, Pro A’s dense-packet projection lemma should be replaceable by the following form:

[
\boxed{
\mu(\mathcal D_{k,\theta})
\ \ll_C
\frac{k^2}{\theta},\mu(\mathrm{Coll}_{2}^{C})
\ +\ \mu(\mathrm{R35})
}
\tag{DP}
]

where (\mathcal D_{k,\theta}) denotes locally useful defect-(k) shields whose local packet section has residual density at least (\theta), and (\mathrm{Coll}_{2}^{C}) is the two-packet-collision, or bounded expanded-window collision, family. Using the established collision tail

[
\mu(\mathrm{Coll}_2^C)\ll_C \frac{N_h}{h^2},
]

this gives

[
\mu(\mathcal D_{k,\theta})
\ll_C
\frac{k^2}{\theta h^2}N_h
+\mu(\mathrm{R35}).
\tag{1}
]

Thus dense absorption into an (N_h/\log h) entropy tail is available exactly when

[
\frac{k^2}{\theta h^2}\ \lesssim\ \frac1{\log h},
]

or equivalently

[
\boxed{
k\ \lesssim\ h\sqrt{\frac{\theta}{\log h}}.
}
\tag{2}
]

This answers both proposed sharpenings.

For (\theta\asymp 1/\log h),

[
k\lesssim \frac{h}{\log h}.
]

So (\theta=\Theta(1/\log h)) is strong enough not only for (k\le C\sqrt h), but also for

[
k\le C\frac{h}{\log h}.
]

For (\theta\asymp 1/h),

[
k\lesssim \sqrt{\frac{h}{\log h}}.
]

So (\theta=\Theta(1/h)) can replace constant density only in the shallow window, certainly including the old (k\le C\log h) range, but it does **not** support (k\le C\sqrt h) or (k\le C h/\log h) using only the two-collision tail. It misses (k\sim\sqrt h) by a factor of (\sqrt{\log h}).

The clean threshold summary is:

[
\begin{array}{c|c}
\text{density } \theta & \text{dense range absorbable by } N_h/\log h \ \hline
1 & k\lesssim h/\sqrt{\log h} \
1/\log h & k\lesssim h/\log h \
1/h & k\lesssim \sqrt{h/\log h}
\end{array}
]

So the best useful sharpening is:

[
\boxed{
\theta\asymp \frac1{\log h},\qquad
k\le C\frac{h}{\log h}.
}
]

That is the natural expanded dense regime. The (\theta\asymp 1/h) regime should remain classified as sparse once (k) is larger than (\sqrt{h/\log h}), unless R35 has an additional logarithmic saving or the projection can force three packet collisions instead of two.

Here is the proof of the sharpened dense-packet estimate.

Let

[
\omega(X):=\sum_{p\in X}\frac1p.
]

For a locally useful shield (E=c\cup K), with

[
|c|=h-k,\qquad K={p_1,\dots,p_k},
]

define the bounded expanded packet window

[
W_i=W_C(p_i)
:=
\bigcup_{\Pi:\ \Pi\cap [p_i e^{-C/h},p_i e^{C/h}]\ne\varnothing}\Pi .
]

Outside the ordinary collision entropy tail, the windows (W_i) may be treated as essentially disjoint. If two of them overlap, then (K) already has a bounded packet collision and is absorbed directly by (\mathrm{Coll}_1^C), hence a fortiori by the entropy tail.

For fixed (c) and (\mathbf W=(W_1,\dots,W_k)), define the residual local section

[
\mathcal R(c;\mathbf W)
=======================

\left{
(q_1,\dots,q_k):
q_i\in W_i,\
c\cup{q_1,\dots,q_k}\in \mathcal R
\right}.
]

Its product harmonic density is

[
\delta(c;\mathbf W)
===================

\frac{
\sum_{Q\in \mathcal R(c;\mathbf W)} \prod_{q\in Q}1/q
}{
\prod_{i=1}^k \omega(W_i)
}.
]

Call the section (\theta)-dense when

[
\delta(c;\mathbf W)\ge \theta.
]

The R35 sparse exceptional class should be defined so that, outside it, dense sections are two-coordinate spread. Concretely, if (\nu) is the product probability measure on (\prod_i W_i), then outside R35 we require

[
(\nu\times \nu)
\left(
{Q,Q'\in \mathcal R(c;\mathbf W):
|{i:q_i\ne q_i'}|\ge 2}
\right)
\gg
\delta(c;\mathbf W)^2.
\tag{3}
]

This is the only real place where sparse sections enter. If (3) fails, the section is essentially supported on a union of one-coordinate slabs or heavy atoms, and that is precisely the kind of low-dimensional entropy object R35 is meant to absorb.

Assume now that (3) holds and (\delta\ge\theta). Then

[
\delta
\le
\frac{1}{\theta}\delta^2
\ll
\frac{1}{\theta}
(\nu\times \nu)
\left(
{Q,Q'\in \mathcal R(c;\mathbf W):
|\Delta(Q,Q')|\ge 2}
\right).
\tag{4}
]

For each pair (Q,Q') with at least two differing coordinates, choose the first two differing coordinates (i,j). Locality gives

[
q_i,q_i'\in W_i,\qquad q_j,q_j'\in W_j.
]

Thus the augmented support

[
c\cup Q\cup{q_i',q_j'}
]

has two bounded packet collisions: one in (W_i), one in (W_j). This object has rank (h+2), but (N_{h+2}\asymp N_h) at the central rank, and the packet-collision tail is stable under bounded rank shifts. If one insists on returning to rank (h), the standard fixed-rank projection does it; the important point is to keep the exact rooted count rather than replacing ((h)_k) by (h^k). That avoids an artificial (e^{O(k^2/h)}) loss.

The pair ((i,j)) has at most (O(k^2)) choices. Therefore the weighted switching from dense useful sections to two-collision objects gives

[
\mu(\mathcal D_{k,\theta})
\ll_C
\frac{k^2}{\theta}
\mu(\mathrm{Coll}_2^C)
+
\mu(\mathrm{R35}).
]

This proves (DP). Applying

[
\mu(\mathrm{Coll}_2^C)\ll_C \frac{N_h}{h^2}
]

gives (1).

The (k)-range extension is legitimate up to (k\le C h/\log h). The old (k\le C\log h) restriction is an artefact of using rough rank approximations such as

[
(h)_k\sim h^k,
]

which are only harmless for (k^2/h=o(1)). For (k\sim h/\log h), that approximation loses

[
\exp!\left(O(k^2/h)\right)
==========================

\exp!\left(O(h/\log^2 h)\right),
]

which is catastrophic. But the rooted switching identity itself is exact; if the proof keeps ((h)_k), (\binom hk), and the elementary-symmetric ratios in exact form, the only genuine arithmetic distortion from locality is

[
\prod_{\ell\le k} e^{O(1/h)}
============================

e^{O(k/h)}.
]

For

[
k\le C\frac{h}{\log h},
]

this is

[
e^{O(1/\log h)}=1+o(1).
]

So (k\le C h/\log h) is safe in the dense projection lemma.

There is also a sharpness reason not to push (\theta=1/h) into the larger (k)-windows. In a genuinely dense random local section of density (\theta), the section mass is proportional to (\theta), while the useful pair energy is proportional to (\theta^2). Hence the switching proof must pay a factor (1/\theta). The first-pair projection also has (\binom{k}{2}) possible coordinate pairs, giving the (k^2) factor. Thus the loss (k^2/\theta) is not a proof artefact; it is the natural scale of the dense projection mechanism.

Consequently, with only the two-collision tail,

[
\theta=\frac1h,\qquad k\sim \sqrt h
]

gives

[
\frac{k^2}{\theta h^2}
\asymp
\frac{h}{(1/h)h^2}
\asymp 1,
]

so the dense contribution is only bounded by (O(N_h)), not (O(N_h/\log h)). To make (k\sim\sqrt h) work, one would need at least

[
\theta\gtrsim \frac{\log h}{h}.
]

To make

[
k\sim \frac{h}{\log h}
]

work, one needs

[
\theta\gtrsim \frac1{\log h}.
]

So the strongest clean upgrade is:

[
\boxed{
\text{Replace constant density by } \theta\asymp 1/\log h,
\quad
\text{and extend the dense window to } k\le C h/\log h.
}
]

The (\theta\asymp 1/h) regime is usable only for shallow (k), and the remaining part really should be left to the R35 entropy tail unless one can force an additional packet collision or obtain an extra logarithmic saving from the sparse analysis.

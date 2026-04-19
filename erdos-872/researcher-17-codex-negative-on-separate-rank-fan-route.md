# Round 17 Codex — definitive negative result on the separate-rank fan route to linearity

## Statement

Let
\[
H = H(n) := \sum_{p \le n^\delta} \frac1p \sim \log\log n
\]
for any fixed \(\delta \in (0,1)\).

For the fixed-rank upper-half fan architecture, the rank-\(h\) target count is
\[
W_h(n) \asymp \frac{n}{\log n}\frac{H^h}{h!}.
\]
In the two-phase divisor-shadow implementation from the current dossier, the proved retained fraction at rank \(h\) is
\[
\asymp 2^{-2(2^h-1)}.
\]
So the rank-\(h\) proven contribution is of size
\[
F_h(n)
:=
\frac{n}{\log n}\frac{H^h}{h!}\,2^{-2(2^h-1)}.
\]

Then:

## Theorem A (single-rank ceiling)

For every choice of \(h=h(n)\),
\[
W_h(n)=o(n).
\]
Hence no lower bound argument based on harvesting a **single rank**
\[
h=h(n)
\]
of upper-half fan targets can prove \(L(n)=\Omega(n)\).

## Theorem B (separate-rank divisor-shadow ceiling)

The whole separate-rank divisor-shadow route is still sublinear:
\[
\sum_{h\ge 1} F_h(n)
\le
\frac{n}{\log n}
\exp\!\left(
\left(\frac1{\log 2}+o(1)\right)\log\log\log n\cdot\log\log\log\log n
\right)
=
\frac{n}{(\log n)^{1-o(1)}}
=
o(n).
\]

Therefore the current hierarchical fan architecture, even optimized over rank and even summed across ranks **without any extra cross-rank gain**, cannot prove linear growth.

This is a definitive negative result on the main variable-rank route as presently formulated.

## Proof

### 1. Single-rank ceiling

For fixed \(n\), the quantity
\[
\frac{H^h}{h!}
\]
is maximized at \(h \asymp H\). By Stirling,
\[
\frac{H^H}{H!}
\sim
\frac{e^H}{\sqrt{2\pi H}}
\sim
\frac{\log n}{\sqrt{2\pi\log\log n}}.
\]
Therefore
\[
\max_h W_h(n)
\asymp
\frac{n}{\log n}\cdot \frac{\log n}{\sqrt{\log\log n}}
=
\frac{n}{\sqrt{\log\log n}}
=
o(n).
\]
So even the raw target count of the best single rank is sublinear.

### 2. Optimize the proved divisor-shadow contribution

Write
\[
\log \frac{F_h(n)\log n}{n}

=
h\log H - \log(h!) - (2^{h+1}-2)\log 2.
\]
Using Stirling,
\[
\log(h!) = h\log h - h + O(\log h).
\]
So
\[
\log \frac{F_h(n)\log n}{n}
=
h\log H - h\log h + h - 2^{h+1}\log 2 + O(\log h).
\]

Let
\[
u := \log H = \log\log\log n.
\]
Choose
\[
h = \left\lfloor \log_2 u \right\rfloor.
\]
Then
\[
2^h \asymp u,
\qquad
h \asymp \frac{\log u}{\log 2}.
\]
Hence
\[
h\log H
=
\left(\frac1{\log 2}+o(1)\right)u\log u,
\]
while
\[
h\log h = O(\log u\cdot \log\log u)=o(u\log u),
\]
and
\[
2^{h+1}\log 2 = O(u)=o(u\log u).
\]
Therefore
\[
\max_h \log \frac{F_h(n)\log n}{n}
=
\left(\frac1{\log 2}+o(1)\right)u\log u.
\]
Exponentiating gives
\[
\max_h F_h(n)
=
\frac{n}{\log n}
\exp\!\left(
\left(\frac1{\log 2}+o(1)\right)\log\log\log n\cdot\log\log\log\log n
\right).
\]

Since the number of relevant ranks is at most \(O(H)=e^{O(u)}\), summing over all \(h\) changes only the \(o(1)\) term in the exponent. So
\[
\sum_{h\ge 1} F_h(n)
=
\frac{n}{\log n}
\exp\!\left(
\left(\frac1{\log 2}+o(1)\right)\log\log\log n\cdot\log\log\log\log n
\right).
\]

Finally,
\[
\exp\!\left(
\left(\frac1{\log 2}+o(1)\right)\log\log\log n\cdot\log\log\log\log n
\right)
=
(\log n)^{o(1)},
\]
so the whole expression is
\[
\frac{n}{(\log n)^{1-o(1)}}=o(n).
\]

This proves Theorem B.

## Interpretation

This does **not** rule out a future linear lower bound by some genuinely new multi-rank coupling theorem. But it does rule out the current route:

- choose a rank \(h\),
- prove a rank-\(h\) fan lower bound of size \(F_h(n)\),
- optimize over \(h\),
- or sum those rankwise contributions independently.

That entire architecture stays sublinear.

So the present “main route” to \(\Theta(n)\) is dead in its current separate-rank form. Any proof of linearity would need a genuinely new ingredient that couples the central rank window with only \(O(1)\) total loss, rather than harvesting ranks one at a time.

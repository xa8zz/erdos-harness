I refute the sparse closure as stated. The high-window entropy tail closes only the **pure high-window** family. It does not close the natural complement of Pro A’s dense regime.

One preliminary dimensional point: with the original definition

[
\omega(E)=\prod_{p\in E}\frac1p,
]

no rank-(h) support has (\omega(E)=\Omega(1)) as (h\to\infty), since (\omega(E)\le 2^{-h}). So “dense” cannot literally mean product-weight (\Omega(1)); it has to mean some normalized low-window cost or entropy concentration condition. Under that charitable interpretation, the gap is still present.

Let

[
\Lambda=\Lambda_L,\qquad \Lambda^c=\mathcal P\setminus \Lambda,
]

and write

[
H_0=\sum_{p\in \Lambda}\frac1p,\qquad
H_1=\sum_{p\notin \Lambda}\frac1p,\qquad
H=H_0+H_1.
]

For rank (h), decompose harmonic mass according to the number of low-window primes:

[
M_j
===

\sum_{\substack{|E|=h\ |E\cap \Lambda|=j}}
\omega(E)
=========

e_j(\Lambda),e_{h-j}(\Lambda^c).
]

The pure high-window tail is only

[
M_0=e_h(\Lambda^c).
]

The estimate

[
M_0\ll N_h\left(\frac{H_1}{H}\right)^h
]

controls supports with **zero** primes in (\Lambda). But a sparse support in the natural sense “mostly outside (\Lambda)” may have (1,2,\ldots,o(h)) low-window primes. Those layers contribute

[
\sum_{1\le j\le r} M_j,
]

and this is not controlled by (M_0).

The correct entropy expression is not

[
N_h\left(\frac{H_1}{H}\right)^h,
]

but rather

[
N_h
\sum_{j\le r}
\binom hj
\left(\frac{H_0}{H}\right)^j
\left(\frac{H_1}{H}\right)^{h-j},
]

up to the usual elementary-symmetric normalization errors. The missing binomial layers are exactly the gap.

Already the (j=1) layer shows the problem. We have

[
M_1=H_0,e_{h-1}(\Lambda^c).
]

Also,

[
h,e_h(\Lambda^c)
================

\sum_{p\notin\Lambda}
\frac1p,e_{h-1}(\Lambda^c\setminus{p})
\le
H_1,e_{h-1}(\Lambda^c),
]

so

[
M_1
\ge
\frac{hH_0}{H_1}M_0.
]

Thus the one-low-prime layer is larger than the pure high layer by the factor

[
\lambda:=\frac{hH_0}{H_1}.
]

At the proposed R35 choice (L=h/\log h), the displayed target

[
\left(\frac{H_1}{H}\right)^h\ll \frac1{\log L}
]

corresponds to a low-window expected count of order

[
\lambda \asymp \log\log L
]

in the sharp regime. Then the (j=1) layer has size roughly

[
M_1
\asymp
N_h,\frac{\log\log L}{\log L},
]

not

[
O!\left(\frac{N_h}{\log L}\right).
]

Since (L=h/\log h), this is a loss of order (\log\log h).

More seriously, the typical number of low-window primes under the harmonic rank-(h) measure is about

[
\lambda=h\frac{H_0}{H}.
]

If (\lambda\asymp \log\log L), then the layer (j\approx \lambda) has much larger mass than (N_h/\log h), and the cumulative mass of supports with

[
j\le \frac{h}{\log h}
]

is essentially a positive fraction of (N_h), because (h/\log h\gg \lambda). Those supports are “primarily outside” (\Lambda), hence sparse in the natural sense, but they are not entropy-rare.

They also evade Pro A’s dense-packet projection lemma. If a support has only (j=o(h)) low-window primes, then for any fixed or logarithmic (k),

[
\frac{|\Gamma_k(S,F)|}{\binom{h-r}{k}}
\lesssim
\frac{\binom{j}{k}}{\binom{h-r}{k}}
\approx
\left(\frac{j}{h}\right)^k
=o(1),
]

and if (j<k), the numerator is zero. So these mixed supports do not have the constant-density (k)-projection required by the dense lemma.

Therefore the decomposition

[
\text{dense} \sqcup \text{sparse}
]

leaves a real gap unless “sparse” is defined in the extremely strong sense

[
E\cap \Lambda_L=\varnothing.
]

For that narrow definition, the R35 estimate gives

[
\mu(\operatorname{Cl}*h^{\mathrm{pure\ high}})
\ll
N_h\left(\frac{H*{>L}}{H}\right)^h
\ll
\frac{N_h}{\log L}.
]

But that is not the complement of the dense regime handled by Pro A.

The missing regime is:

[
1\le |E\cap \Lambda_L|\le o(h),
]

especially the layers

[
|E\cap \Lambda_L|\approx h\frac{H_{\le L}}{H}.
]

These shields are sparse by product weight and mostly high-window, but they are not pure high-window, and they do not satisfy the dense-packet projection hypothesis. The proposed entropy bound omits precisely their binomial contribution.

So the sparse closure proof does not go through as stated. To close the argument, one needs an additional lemma controlling the mixed low/high layers, or a stronger R35 tail of the form

[
\sum_{j\le r}
e_j(\Lambda_L)e_{h-j}(\Lambda_L^c)
\ll
\frac{N_h}{\log h}
]

for the actual sparse cutoff (r). The pure factor

[
\left(\frac{H_{>L}}{H}\right)^h
]

alone is insufficient.

# Round 24 Codex — band-local closure explosion

This is a rigorous structural theorem about the multiplicative-closure obstruction.

It does **not** solve the upper bound, but it identifies a concrete mechanism that any successful closure-control theorem must suppress.

## Theorem (band-local closure explosion)

Fix constants `\lambda>1` and `0<\gamma<1`. Let `X\to\infty`, and define:

- the high prime band
  \[
  \mathcal P_{\mathrm{hi}} := \{p \text{ prime} : X \le p \le X^\lambda\},
  \]
- the low squarefree pool
  \[
  \mathcal C_X(\gamma) := \{c \le X^\gamma : \mu^2(c)=1\}.
  \]

Let
\[
\mathcal B_X(\lambda)
:=
\{pqr : p<q<r,\ p,q,r\in \mathcal P_{\mathrm{hi}}\}.
\]

Then there exists a dyadic band `(Y,2Y]` and a set
\[
\mathcal A_Y \subseteq \{a \in (Y,2Y] : a = bc,\ b\in \mathcal B_X(\lambda),\ c\in \mathcal C_X(\gamma)\}
\]
such that
\[
\sum_{a\in \mathcal A_Y}\frac1a \gg_{\lambda,\gamma} 1.
\]

Consequently, if in the divisibility game all proper divisors of the integers in `\mathcal A_Y` are already unavailable and `Y \le n^{1-\eta}` for some fixed `\eta>0`, then the upper-half family
\[
\{a\ell : a\in \mathcal A_Y,\ \ell \text{ prime},\ n/(2a)<\ell\le n/a\}
\]
contains
\[
\gg_{\lambda,\gamma,\eta} \frac{n}{\log n}
\]
legal moves.

## Proof

### 1. Triple-band reciprocal mass is constant

Let
\[
H_X := \sum_{p\in \mathcal P_{\mathrm{hi}}}\frac1p.
\]
By Mertens,
\[
H_X
=
\log\log(X^\lambda)-\log\log X+o(1)
=
\log \lambda + o(1).
\]
So `H_X \asymp_\lambda 1`.

Write
\[
E_3(X):=\sum_{p<q<r\in\mathcal P_{\mathrm{hi}}}\frac1{pqr}.
\]
Using
\[
e_3(x_1,\dots,x_m)
=
\frac16\Big((\sum x_i)^3 - 3(\sum x_i)(\sum x_i^2) + 2\sum x_i^3\Big),
\]
with `x_i = 1/p_i`, we obtain
\[
E_3(X)
\ge
\frac{H_X^3}{6} - \frac{H_X}{2}\sum_{p\in\mathcal P_{\mathrm{hi}}}\frac1{p^2}.
\]
But
\[
\sum_{p\in\mathcal P_{\mathrm{hi}}}\frac1{p^2}\le \sum_{m\ge X}\frac1{m^2}=O(1/X),
\]
so for large `X`,
\[
E_3(X)\gg_\lambda 1.
\]

### 2. Low squarefree reciprocal mass is logarithmic

Let
\[
F_X(\gamma):=\sum_{c\in\mathcal C_X(\gamma)}\frac1c.
\]
The standard squarefree harmonic sum gives
\[
F_X(\gamma)
=
\sum_{c\le X^\gamma}\frac{\mu^2(c)}c
=
\frac{6}{\pi^2}\log(X^\gamma)+O(1)
\asymp_\gamma \log X.
\]

### 3. Total reciprocal mass of products bc

Because every prime factor of `b\in\mathcal B_X(\lambda)` is `\ge X`, while every `c\in\mathcal C_X(\gamma)` satisfies `c\le X^\gamma < X`, the prime supports of `b` and `c` are disjoint. Hence the factorization `a=bc` is unique and
\[
\sum_{b\in\mathcal B_X(\lambda)}\sum_{c\in\mathcal C_X(\gamma)}\frac1{bc}
=
E_3(X)\,F_X(\gamma)
\gg_{\lambda,\gamma} \log X.
\]

Every such product lies in
\[
X^3 < a = bc \le X^{3\lambda+\gamma}.
\]

### 4. Pigeonhole into one dyadic band

The interval `(X^3, X^{3\lambda+\gamma}]` meets at most
\[
O_{\lambda,\gamma}(\log X)
\]
dyadic bands.

Therefore, by pigeonhole, there exists a dyadic band `(Y,2Y]` for which the reciprocal mass of products in that band satisfies
\[
\sum_{\substack{a\in(Y,2Y]\\ a=bc,\ b\in\mathcal B_X(\lambda),\ c\in\mathcal C_X(\gamma)}}\frac1a
\gg_{\lambda,\gamma} \frac{\log X}{\log X}
\gg_{\lambda,\gamma} 1.
\]
This is exactly the claimed set `\mathcal A_Y`.

### 5. Upper-half lift

Assume now `Y\le n^{1-\eta}` with fixed `\eta>0`. Then for every `a\in\mathcal A_Y`,
\[
\frac{n}{2a}\ge \frac12 n^\eta \to \infty.
\]
By the prime number theorem, uniformly for such `a`,
\[
\pi(n/a)-\pi(n/(2a))
\gg_\eta \frac{n}{a\log n}.
\]

Hence
\[
\#\{\ell\text{ prime}: n/(2a)<\ell\le n/a\}
\gg_\eta \frac{n}{a\log n}.
\]
Summing over `a\in\mathcal A_Y`,
\[
\sum_{a\in\mathcal A_Y}\#\{\ell\text{ prime}: n/(2a)<\ell\le n/a\}
\gg_{\lambda,\gamma,\eta}
\frac{n}{\log n}\sum_{a\in\mathcal A_Y}\frac1a
\gg_{\lambda,\gamma,\eta}
\frac{n}{\log n}.
\]

If, in the game, all proper divisors of the `a\ell` are already unavailable, these give that many legal upper-half moves.

This proves the theorem.

## Interpretation

This gives a precise multiplicative-closure obstruction:

- a fixed-power high prime band contributes **constant triple reciprocal mass**;
- a lower squarefree pool contributes **logarithmic reciprocal mass**;
- after dyadic decomposition, one skeleton band still retains **constant reciprocal mass**;
- that single band already supports `\Omega(n/\log n)` upper-half moves.

So any successful upper-bound theorem based on multiplicative closure must prevent this configuration dynamically. In particular, it is **not enough** to control pair-shadow mass, rough cofactor, or even coarse band occupancy.

One must suppress at least one of:

1. the constant triple reciprocal mass in a high prime band,
2. the logarithmic squarefree mass in the lower pool,
3. the transfer of that product mass into a single dyadic skeleton band.

## Consequence for future directions

This pushes the upper-bound program toward one of two genuinely stronger targets:

1. a **directed higher-rank blocker theorem** that lets Shortener play closure skeletons of rank `\ge 3` fast enough to break the band-local explosion; or
2. a **bandwise closure-width theorem** showing that the actual game dynamics forbid simultaneous persistence of both the high-band triple mass and the lower-pool squarefree mass.

Either would be a real multiplicative-closure theorem. Pair-level information alone cannot suffice.

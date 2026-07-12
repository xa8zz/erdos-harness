---
id: R116-deep-layer-theorem
type: research
date: 2026-07-12
intent: >
  Prove or disprove the cumulative minimal-layer statement (CL) via
  compression persistence, with the repaired surviving-shadow theorem
  and its audit available as established inputs.
predecessors: [R110-surviving-shadow-compression, R113-audit-shadow-and-ah-claims]
action:
  kind: extends
  target: R110-surviving-shadow-compression
claim: >
  Policy-independent deep-layer theorem: all peeling layers beyond
  depth C*loglog(H) contribute o(n) total minimal-layer mass, by a
  divisor-chain / Rankin-type bound — every element of layer j has a
  chain of j proper divisors above n/H, and integers with that many
  large divisors are rare. Hence (CL) is exactly equivalent to its
  bounded-depth truncation: control the first C*loglog(H) layers.
  Fixed-depth iteration of static completion still fails (the
  completion modulus is not uniform under the growing prefix), and the
  known private-carrier construction does not refute the truncated
  statement (its exposed layers thin too fast). Neither a proof nor a
  disproof of (CL); the residual gap is a chronology-sensitive
  compression or regeneration theorem for boundedly many (loglog H)
  layers.
implications:
  - (CL) is reduced from log_2(H) layers to C*loglog(H) layers —
    a doubly exponential depth reduction of the battleground.
  - The deep-layer theorem is policy-independent and can be treated as
    established machinery once informally re-verified.
verifiers_at_time: []
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/researcher-R116-compression-persistence.md
---

# Verdict

I do **not** have a valid unconditional proof or disproof of \((\mathrm{CL})\). A claim in either direction would still require a new chronological argument not supplied by the established facts.

There is, however, a further unconditional reduction that substantially narrows the problem: **the last \(\log_2 H-O(\log\log H)\) sweeps always contribute only \(o(n)\), independently of Shortener’s ordering and independently of Prolonger’s strategy.** Thus \((\mathrm{CL})\) is equivalent to controlling only the first \(O(\log\log H)\) minimal layers, not all \(\lceil\log_2H\rceil\) layers.

I use the repaired sweep framework and the established facts in the attachment. 

---

## 1. A policy-independent deep-layer theorem

Write

\[
J=\left\lceil\log_2H\right\rceil
\]

and suppose Phase \(0\) has ended, so every legal lower integer is greater than \(n/H\).

For an integer \(q\), let \(\Omega(q)\) denote the number of prime factors of \(q\), counted with multiplicity.

### Theorem

Uniformly over every post-peel position, every choice of sweep orders, and every legal Prolonger continuation,

\[
\boxed{
\sum_{\ell=R_H}^{J-1}|M_\ell|=o(n),
\qquad
R_H:=\left\lceil4\log\log H\right\rceil .
}
\tag{1}
\]

Here and below logarithms without a subscript are natural logarithms.

### Proof

Take \(x\in M_\ell\). The multiplicative-chain lemma gives a strict chain

\[
d_0\mid d_1\mid\cdots\mid d_\ell=x,
\qquad d_i\in M_i
\]

at the relevant ancestral stages. In particular,

\[
d_0>\frac nH.
\tag{2}
\]

Put

\[
q=\frac{x}{d_0}.
\]

Every quotient \(d_{i+1}/d_i\) is an integer at least \(2\), so

\[
\Omega(q)
=
\sum_{i=0}^{\ell-1}
\Omega\!\left(\frac{d_{i+1}}{d_i}\right)
\ge \ell.
\tag{3}
\]

Since \(x\le n/2\) and \(d_0>n/H\),

\[
q=\frac{x}{d_0}<\frac H2.
\tag{4}
\]

For every \(x\in M_\ell\), fix one such pair \((d_0,q)\). Once \((d_0,q)\) is fixed, \(x=d_0q\) is fixed. For a fixed \(q\), the number of possible \(d_0\) is at most

\[
\left\lfloor\frac{n}{2q}\right\rfloor.
\]

The layers are pairwise disjoint. Therefore, for every integer \(r\ge1\),

\[
\begin{aligned}
\sum_{\ell=r}^{J-1}|M_\ell|
&=
\left|\bigcup_{\ell=r}^{J-1}M_\ell\right|\\
&\le
\sum_{\substack{q\le H/2\\ \Omega(q)\ge r}}
\left\lfloor\frac{n}{2q}\right\rfloor\\
&\le
\frac n2
\sum_{\substack{q\le H\\ \Omega(q)\ge r}}\frac1q.
\end{aligned}
\tag{5}
\]

It remains to estimate the harmonic tail on the right.

Fix \(z=3/2\). Rankin’s inequality gives

\[
\sum_{\substack{q\le H\\\Omega(q)\ge r}}\frac1q
\le
z^{-r}\sum_{q\le H}\frac{z^{\Omega(q)}}q.
\tag{6}
\]

Because \(z<2\), the relevant Euler product converges locally at every prime, including \(2\):

\[
\begin{aligned}
\sum_{q\le H}\frac{z^{\Omega(q)}}q
&\le
\prod_{p\le H}
\left(1+\frac zp+\frac{z^2}{p^2}+\cdots\right)\\
&=
\prod_{p\le H}\left(1-\frac zp\right)^{-1}.
\end{aligned}
\tag{7}
\]

Taking logarithms and using

\[
-\log(1-z/p)=\frac zp+O_z(p^{-2}),
\]

we obtain

\[
\log
\prod_{p\le H}\left(1-\frac zp\right)^{-1}
=
z\sum_{p\le H}\frac1p+O_z(1)
=
z\log\log H+O_z(1).
\]

Consequently,

\[
\sum_{q\le H}\frac{z^{\Omega(q)}}q
\ll_z(\log H)^z.
\tag{8}
\]

Combining (5), (6), and (8),

\[
\sum_{\ell=r}^{J-1}|M_\ell|
\ll
n\,z^{-r}(\log H)^z.
\tag{9}
\]

Now take

\[
r=R_H=\left\lceil4\log\log H\right\rceil.
\]

Since \(z=3/2\),

\[
z-r\frac{\log z}{\log\log H}
\le
\frac32-4\log\frac32+o(1)
<0.
\]

More explicitly,

\[
\frac32-4\log\frac32
\approx-0.12186.
\]

Thus

\[
z^{-R_H}(\log H)^z
\ll
(\log H)^{-0.1218\ldots}=o(1).
\]

Substitution into (9) proves (1). ∎

---

## 2. Exact reformulation of \((\mathrm{CL})\)

The theorem immediately gives the following equivalence.

### Corollary

The cumulative minimal-layer statement \((\mathrm{CL})\) is equivalent to the existence of \(H(n)\to\infty\) and a Shortener sweep policy such that, against every Prolonger strategy,

\[
\boxed{
\sum_{\ell<\lceil4\log\log H\rceil}|M_\ell|=o(n).
}
\tag{10}
\]

Indeed, the forward implication is immediate by discarding layers. Conversely, (10), together with (1), gives

\[
\sum_{\ell<J}|M_\ell|
=
\sum_{\ell<R_H}|M_\ell|
+
\sum_{R_H\le\ell<J}|M_\ell|
=o(n).
\]

So the genuine separator is not growing depth \(\log H\). It is the much shorter but still growing **central regeneration window**

\[
0\le \ell\lesssim\log\log H.
\]

This is also the natural range in which quotient integers can carry a typical number of prime factors; after a sufficiently large multiple of \(\log\log H\) successive strict refinements, the harmonic population of possible quotients is already negligible.

---

## 3. Why fixed-depth static completion still does not finish the proof

The reduction from \(\log H\) layers to \(O(\log\log H)\) layers does not make the qualitative static-completion theorem iterable.

To see this sharply, suppose merely as an abstract modulus that a sublinear position of normalized size \(u\) could have a minimal layer of normalized size at most

\[
F(u)=\sqrt u.
\tag{11}
\]

This is fully compatible with the qualitative implication

\[
u=o(1)\quad\Longrightarrow\quad F(u)=o(1).
\]

Starting after the peel with \(u_0=1/H\), iteration gives

\[
u_r=H^{-1/2^r}.
\tag{12}
\]

At the depth supplied by the theorem,

\[
r=4\log\log H,
\]

we have

\[
2^r
=
\exp\!\left(4\log2\,\log\log H\right)
=
(\log H)^{4\log2}.
\]

Since \(4\log2>1\),

\[
\frac{\log H}{2^r}\longrightarrow0,
\]

and hence

\[
H^{-1/2^r}
=
\exp\!\left(-\frac{\log H}{2^r}\right)
\longrightarrow1.
\tag{13}
\]

Thus even \(O(\log\log H)\) successive applications can turn a vanishing quantity into a macroscopic one under a modulus fully consistent with static completion. Choosing \(H\) “sufficiently slowly” does not repair this without an additional quantitative, chronology-stable estimate.

---

## 4. Why the existing construction still does not refute (10)

The repaired survivor construction proves that Prolonger can force

\[
\left|
D(A_1)\cap\operatorname{Sh}^{-}(K_0)
\right|
\ge \varepsilon n
\tag{14}
\]

at the end of the first sweep, against every first-layer ordering, at suitable obtainable positions.

But in its disjoint rough cones, the quotient structure is

\[
mk\mid mk'
\quad\Longleftrightarrow\quad
k\mid k'.
\]

After the base root \(m\) is killed, the new minima are only its prime multiples. Consequently that construction gives

\[
\left|
M_1\cap\bigcup_m\Gamma_m
\right|
\ll
n\frac{\log\log H}{\log H}
=o(n).
\tag{15}
\]

The deep-layer theorem shows exactly what an upgrade would need to accomplish: regenerate a linear cumulative family within only \(O(\log\log H)\) successive quotient ranks. The simple complement cascade cannot do this at positive density because the private-coordinate lemma forces primorial-sized carriers. No supplied argument rules out more complicated coded and overlapping cascades, but no such cascade has been made:

1. legal throughout the chronological history;
2. robust against the chosen sweep orders;
3. forceable against Shortener’s actual Phase \(0\) policy; and
4. dense enough to contribute \(\Omega(n)\) distinct minimal elements.

The distinction between an obtainable adverse position and a position forceable against the existentially chosen Shortener policy remains decisive.

---

## 5. The remaining statement

After the reduction above, a proof of \((\mathrm{CL})\) needs precisely a policy satisfying

\[
\sup_{\text{Prolonger}}
\sum_{\ell<4\log\log H}|M_\ell|=o(n).
\tag{16}
\]

A disproof needs a universal response to every proposed policy producing

\[
\sum_{\ell<4\log\log H}|M_\ell|\ge\varepsilon n
\tag{17}
\]

for some fixed \(\varepsilon>0\), while respecting the actual Phase \(0\) history.

None of the accepted results implies (16) or (17). In particular:

\[
\boxed{
\text{linear surviving legal mass}
\not\Rightarrow
\text{linear cumulative mass in the first }O(\log\log H)\text{ minima}.
}
\]

Therefore the strongest conclusion I can justify is

\[
\boxed{
(\mathrm{CL})\text{ remains unresolved, but it is equivalent to its }
O(\log\log H)\text{-depth restriction.}
}
\]

Claiming either a full proof or a full counterexample beyond this point would require exactly the chronology-sensitive compression or regeneration theorem that is still missing.
# Round 20 Pro — independent third confirmation: Lemma A false, hypothesis unenforceable, dynamic activated-core bound is the gap

I did not search online. I worked from the game definition and the material in your prompt.

I cannot honestly give an unconditional proof of

[
L(n)=O!\left(\frac{n(\log\log n)^2}{\log n}\right)
]

from the stated ingredients, because the load-bearing route described in the prompt has a concrete mathematical failure. More strongly, one of the proposed “plausible” strengthenings is false by an elementary estimate. What I can give rigorously is:

1. the conditional (T2)-scale upper bound, with the charging argument cleaned up;
2. a proof that the “force at most two small primes” lemma is impossible as stated;
3. a proof that the proposed arbitrary-small-core harmonic-sum conjecture is false;
4. the precise form of the missing lemma that would actually be sufficient.

That is the honest state of the reasoning.

---

### 1. The conditional theorem is valid

Fix

[
y=n^\alpha,\qquad \alpha\in(1/3,1/2),
]

and suppose Shortener can maintain the following condition:

> Every Prolonger move has at most two prime factors (\le y).

Also assume the large-prime and large-semiprime parts of the (S_y)-program are dynamically stable, as in your prompt.

Then Shortener can force

[
L(n)=O_\alpha!\left(\frac{n(\log\log n)^2}{\log n}\right).
]

Here is the clean proof.

For every Prolonger move (x), define its small core (d(x)) as follows:

[
d(x)=
\begin{cases}
p, & \text{if }x\text{ has exactly one prime factor }p\le y,[2mm]
ab, & \text{if }x\text{ has exactly two prime factors }a,b\le y.
\end{cases}
]

If (x) has no prime factor (\le y), then (x) belongs to the large-prime/large-semiprime regime and is handled by the assumed dynamic stability of the (S_y)-program.

Now suppose (x) is a residual Prolonger move with small core (d). If Shortener had already played (d), then (x) would be illegal, since (d\mid x). Therefore, if (x) survives, the core (d) must have been made unavailable earlier by some Prolonger move divisible by (d). Charge (x) to that activated core (d).

For a one-prime core (d=p\le y), the surviving moves charged to (p) have the shape

[
x=p m,
]

where (m\le n/p) is (y)-rough; otherwise a smaller prime factor of (m) would create another small prime in the core. Standard Brun/Buchstab estimates give

[
#{m\le n/p:P^-(m)>y}
\ll_\alpha \frac{n}{p\log n}.
]

Therefore

[
\sum_{p\le y}\frac{n}{p\log n}
\ll_\alpha
\frac{n\log\log y}{\log n}
==========================

O_\alpha!\left(\frac{n\log\log n}{\log n}\right).
]

For a two-prime core (d=ab), with (a,b\le y), the same rough-number estimate gives

[
#{m\le n/(ab):P^-(m)>y}
\ll_\alpha
\frac{n}{ab\log n}.
]

Summing over pairs,

[
\sum_{a<b\le y}\frac{n}{ab\log n}
\ll_\alpha
\frac{n}{\log n}
\left(\sum_{p\le y}\frac1p\right)^2
\ll_\alpha
\frac{n(\log\log n)^2}{\log n}.
]

Thus the total contribution from all one-prime and two-prime activated cores is

[
O_\alpha!\left(\frac{n(\log\log n)^2}{\log n}\right).
]

The large-prime/large-semiprime residual is, by hypothesis, only

[
O_\alpha!\left(\frac{n}{\log n}\right),
]

and the Shortener move budget for the prescribed families is smaller than the (T2) scale. Hence the conditional theorem follows.

So the conditional proof mechanism is sound.

---

### 2. Shortener cannot force the “at most two small primes” regime as stated

The first proposed missing lemma says:

> Shortener can force the game to stay within the two-small-prime regime.

That cannot literally be true, because Prolonger moves first.

For every fixed (y\ge 5), and for all sufficiently large (n), choose a prime (q) with

[
\frac{n}{60}<q\le \frac{n}{30}.
]

Then

[
x=2\cdot 3\cdot 5\cdot q
]

lies in ((n/2,n]), hence is a legal first move. It contains three prime factors (\le y), namely (2,3,5). Therefore no Shortener strategy can prevent Prolonger from making a three-small-prime move.

This does not by itself disprove the desired upper bound, because a bounded number of such violations is harmless. But it does disprove the literal version of the missing lemma. Any valid proof must either tolerate three-or-more-small-prime moves or show that their total contribution is still (T2)-scale.

---

### 3. The proposed arbitrary-core harmonic-sum conjecture is false

The conjectural strengthening in the prompt was:

[
\sum_{d\in\mathcal D_y(n)}\frac1d
\ll_\alpha
(\log\log n)^2,
]

where

[
\mathcal D_y(n)
===============

{d\le n:\ d\text{ squarefree},\ P^+(d)\le y,\ \omega(d)\ge 2}.
]

For (y=n^\alpha), this is false. In fact,

[
\sum_{d\in\mathcal D_y(n)}\frac1d
\gg_\alpha \log n.
]

Here is a short proof.

Since every squarefree (d\le y) automatically satisfies (P^+(d)\le y), we have

[
\sum_{d\in\mathcal D_y(n)}\frac1d
\ge
\sum_{\substack{d\le y\ d\ \mathrm{squarefree}\ \omega(d)\ge 2}}
\frac1d.
]

Now

[
\sum_{\substack{d\le y\ d\ \mathrm{squarefree}}}\frac1d
=======================================================

\frac{6}{\pi^2}\log y+O(1),
]

while the contribution from (d=1) and from primes (p\le y) is

[
1+\sum_{p\le y}\frac1p
======================

O(\log\log y).
]

Therefore

[
\sum_{\substack{d\le y\ d\ \mathrm{squarefree}\ \omega(d)\ge 2}}
\frac1d
=======

## \frac{6}{\pi^2}\log y

# O(\log\log y)

\left(\frac{6\alpha}{\pi^2}+o(1)\right)\log n.
]

Hence

[
\sum_{d\in\mathcal D_y(n)}\frac1d
\ge
\left(\frac{6\alpha}{\pi^2}+o(1)\right)\log n,
]

which is much larger than ((\log\log n)^2).

So the proposed arbitrary-core harmonic charging cannot give the desired upper bound. If one charged all possible smooth squarefree cores (d) by (n/(d\log n)), the resulting bound would be

[
\frac{n}{\log n}
\sum_{d\in\mathcal D_y(n)}\frac1d
\gg_\alpha n,
]

which returns only a linear-scale estimate.

---

### 4. Why this matters for the target theorem

The conditional proof works because the allowed cores are only

[
d=p
\quad\text{or}\quad
d=ab,
]

and their reciprocal sums are

[
\sum_{p\le y}\frac1p
\asymp \log\log y
]

and

[
\sum_{a<b\le y}\frac1{ab}
\asymp (\log\log y)^2.
]

But once arbitrary smooth cores are allowed, the reciprocal mass is no longer (T2)-scale. The full squarefree smooth-core mass up to (y) alone is already (\asymp\log n).

Therefore a valid unconditional proof cannot simply say:

> Charge every residual move to its full small core (d), then sum (n/(d\log n)).

That would give

[
O(n),
]

not

[
O!\left(\frac{n(\log\log n)^2}{\log n}\right).
]

The missing statement would have to be much subtler. It would need to say something like:

[
\sum_{d\in \mathcal A_{\mathrm{act}}}\frac1d
\ll
(\log\log n)^2,
]

where (\mathcal A_{\mathrm{act}}) is not the set of all possible smooth cores, but the set of cores that are actually activated by Prolonger under a specific Shortener strategy. That is a dynamic statement about the game, not a static divisor-sum estimate.

The static version is false.

---

### 5. Bottom line

The conditional (T2)-scale upper bound is rigorous under the two-small-prime hypothesis, but the two natural ways to remove that hypothesis both fail as stated:

[
\text{“Shortener forces at most two small primes”}
]

is impossible literally, because Prolonger can open with (2\cdot3\cdot5\cdot q).

And

[
\sum_{d\in\mathcal D_y(n)}\frac1d
\ll_\alpha
(\log\log n)^2
]

is false, since the left side is already (\gg_\alpha\log n).

So I cannot honestly present an unconditional proof of the claimed sharp upper bound from these ingredients. The exact gap is now quite narrow: one needs a genuinely dynamic lemma bounding the reciprocal mass of activated higher-order cores, not the reciprocal mass of all possible higher-order cores.

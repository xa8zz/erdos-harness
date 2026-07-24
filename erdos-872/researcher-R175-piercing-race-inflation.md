---
id: R175-piercing-race-inflation
type: research
date: 2026-07-23
intent: >
  Full solution attempt dispatched with the piercing-race state: the top-half
  kill identity, the prime theft-floor lemma, and the open question whether
  play-legality bounds composite-wave deletion mass per move.
predecessors: [R174-race-correction-two-adic-burn-wall]
action:
  kind: standalone
claim: >
  In the divisibility-antichain game on {2..n}: (1) L = i + |T_n| - TK exactly
  (i = interior plays, TK = top-half kills), so forcing TK = |T_n| - o(n) is
  equivalent to top-half PLAYS being o(n) and does not alone give L = o(n);
  interior plays must separately be o(n). (2) For every eventually-played
  top-half z, no proper divisor of z is ever fired (R(z) cap F empty), but a
  divisor still live when z is played dies via z itself - the correct
  trichotomy replaces the incomparable-collateral-only claim. (3) Multipartite
  packet theorem: for every j >= 2, on a legal trajectory of O_j(1) moves
  (facet blockers a_h = r_h X/P_h from a cyclic j-partition of the primes in
  (q0, (1/20)log n]), every proper face of every transversal w = p_1...p_j is
  dead while all m^j transversals and X = prod P_h remain live, and the single
  move X deletes them all: sum log w ~ (log n)^j/(loglog n)^{j-1} and
  sum 1/w -> infinity in one move. Hence no O(log n)-per-move amortization of
  rank-j deletion follows from legality, lower-face preparation, additive log
  budgets, or ambient sieve mass. (4) Fired-prime reciprocal mass c > 0 gives
  positive-density deletion from the ambient top interval but NOT relative
  deletion from adversarial survivor stocks; iteration on waves requires a
  survivor-stock regularity theorem. No proof or disproof of L(n) = o(n) is
  claimed.
implications:
  - The wave-by-wave theft-floor iteration toward L = o(n) is dead beyond wave 1 (two independent obstructions - packets and survivor-stock non-genericity).
  - An upper-bound proof must attack packet formation before all facets install (strategy-specific, not ledger-based).
  - A linear lower bound would need positive-density global packet packing against out-of-rank-order attack; the construction does not achieve it.
verifiers_at_time:
  - [fable-machine-check-j2-packet-n20000, agrees]
confidence_at_time: high
strategy_dependence: independent
prompt: erdos-872/prompts/researcher-R175-piercing-race-inflation.md
---

## Verdict

I do not have a valid unconditional proof or disproof of  
\[
L(n)=o(n).
\]
Asserting one from the supplied framework would be incorrect.

There is, however, a rigorous resolution of the proposed composite-wave mechanism: **the legality-based \(O(\log n)\)-per-move amortization is false**, even after every lower-rank face of every surviving wave item has already died. A constant-size legal packet can preserve a constant fraction of the full rank-\(j\) tensor family and then delete it in one move.

There are also two logical corrections needed in the stated “known progress.”

---

## 1. The top-half condition is necessary, not sufficient

Write
\[
I_n=\{2,\ldots,\lfloor n/2\rfloor\},
\qquad
T_n=(n/2,n],
\]
and let

\[
i=\#\{\text{played elements of }I_n\},\qquad
p=\#\{\text{played elements of }T_n\}.
\]

Since every top-half element is either played or killed by an interior play,
\[
TK=|T_n|-p.
\]
Also
\[
L=i+p.
\]
Consequently,
\[
\boxed{L=i+|T_n|-TK.}
\]

Thus
\[
TK=|T_n|-o(n)
\]
is equivalent only to
\[
p=o(n),
\]
meaning that only \(o(n)\) top-half elements are played. It does **not** imply \(L=o(n)\) unless one separately proves
\[
i=o(n).
\]

The inequality
\[
L\ge |T_n|-TK
\]
is a lower bound for \(L\), not an upper bound. Therefore the claimed equivalence

\[
L(n)=o(n)
\quad\Longleftrightarrow\quad
\text{Shortener can force }TK\ge |T_n|-o(n)
\]

does not follow from the bookkeeping identity. The reverse implication is missing control of the number of interior fires.

The correct target is the conjunction
\[
TK=|T_n|-o(n)
\qquad\text{and}\qquad
i=o(n).
\]

---

## 2. The piercing statement needs one correction

It is true that if a top element \(z\) is eventually played, then no proper divisor of \(z\) is ever fired:

- firing it before \(z\) would kill \(z\);
- after \(z\) is played, the divisor is illegal.

Hence
\[
R(z)\cap F=\varnothing.
\]

But it is not true that every divisor of \(z\) dies through a play incomparable with \(z\). Any divisor still alive when \(z\) is played is killed by \(z\) itself.

For example, if \(6\) is played while \(2\) and \(3\) are live, then \(2\) and \(3\) die through the comparable play \(6\).

The correct trichotomy is:

1. no proper divisor of an eventually played \(z\) is itself played;
2. a divisor that dies before \(z\) must be killed by an incomparable multiple;
3. every divisor still live at the time of \(z\)'s move is killed by \(z\).

This distinction is exactly what permits the tensor packet below: a legal integer may have essentially all its lower faces dead, because those faces were killed by incomparable multiples.

---

# 3. A multipartite packet defeating composite-wave amortization

Here is the main unconditional result.

## Multipartite packet theorem

Fix an integer \(j\ge2\). For all sufficiently large \(n\), there exists

- a legal position reached after \(O_j(1)\) moves;
- a family \(\mathcal W\) of live squarefree integers having exactly \(j\) prime factors;
- a legal integer \(X\le n\);

such that:

1. every nontrivial proper divisor of every \(w\in\mathcal W\) is already dead;
2. \(X\) kills every \(w\in\mathcal W\);
3. nevertheless
   \[
   \sum_{w\in\mathcal W}\log w
   \gg_j
   \frac{(\log n)^j}{(\log\log n)^{j-1}};
   \]
4. one can simultaneously arrange
   \[
   \sum_{w\in\mathcal W}\frac1w
   \longrightarrow\infty.
   \]

Thus neither current-move legality nor all-lower-wave preparation bounds the unnormalized rank-\(j\) deletion mass by \(O_j(\log n)\), even amortized over the constant number of moves used to prepare the packet.

---

## Construction

Put
\[
y=\frac1{20}\log n.
\]
Take all primes in a range
\[
q_0<p\le y,
\]
where \(q_0\) is any fixed constant large enough to exclude a finite collection of sacrificial primes.

Discard at most \(j-1\) primes and partition the remaining primes cyclically into \(j\) equal-sized sets
\[
G_1,\ldots,G_j,
\qquad |G_h|=m.
\]

Let
\[
P_h=\prod_{p\in G_h}p,
\qquad
X=\prod_{h=1}^jP_h.
\]

By the prime number theorem,
\[
m=(1+o(1))\frac{y}{j\log y}
   \asymp_j\frac{\log n}{\log\log n},
\]
and
\[
\log X
 =\sum_{\substack{q_0<p\le y}}\log p
 =(1+o(1))y.
\]
In particular,
\[
X=n^{1/20+o(1)},
\]
so \(4X^2<n\) for sufficiently large \(n\).

Choose distinct fresh primes
\[
r_1,\ldots,r_j\in(2X,4X)
\]
and define
\[
a_h=r_h\,\frac{X}{P_h}.
\]

All the \(a_h\) lie below \(n\).

Finally, define the transversal family
\[
\mathcal W
 =
 \left\{
 p_1p_2\cdots p_j:
 p_h\in G_h\text{ for every }h
 \right\}.
\]

---

## Legality of the blockers

The integers \(a_1,\ldots,a_j\) are pairwise incomparable.

Indeed, \(r_h\mid a_h\), but \(r_h\) divides none of the other \(a_k\). Hence \(a_h\nmid a_k\) for \(h\ne k\).

Also \(a_h\) and \(X\) are incomparable:

- \(r_h\mid a_h\) but \(r_h\nmid X\), so \(a_h\nmid X\);
- every prime in \(G_h\) divides \(X\) but none divides \(a_h\), so \(X\nmid a_h\).

Choose distinct filler primes
\[
b_1,\ldots,b_j\in(n/2,n].
\]
Then
\[
a_1,b_1,a_2,b_2,\ldots,a_j,b_j,X
\]
is a legal alternating sequence: the filler primes are incomparable with all the composite packet elements and with each other.

Thus the position containing the \(a_h\)'s is reached on an actual legal trajectory, not merely in an offline set-system relaxation.

---

## Every proper face is dead

Take
\[
w=p_1\cdots p_j\in\mathcal W,
\qquad p_h\in G_h.
\]

Let \(e>1\) be a proper divisor of \(w\). Since \(e\ne w\), it omits \(p_h\) for at least one index \(h\). Therefore all prime factors of \(e\) lie in groups other than \(G_h\), and consequently
\[
e\mid \frac{X}{P_h}\mid a_h.
\]

When \(a_h\) is played, \(e\) is killed if it is still live. Hence, after all \(a_h\)'s have been played,

\[
\boxed{\text{every nontrivial proper divisor of every }w\in\mathcal W
       \text{ is dead}.}
\]

This includes every lower-rank squarefree face.

More generally, every squarefree product of fewer than \(j\) primes from
\[
G_1\cup\cdots\cup G_j
\]
misses at least one group and hence divides one of the \(a_h\).

---

## The full transversals remain live

For every \(h\), the transversal \(w\) contains a prime \(p_h\in G_h\), while \(a_h\) contains no prime from \(G_h\). Hence
\[
w\nmid a_h.
\]

Conversely, \(a_h\) contains the fresh prime \(r_h\), which does not divide \(w\), so
\[
a_h\nmid w.
\]

Thus every \(w\in\mathcal W\) is incomparable with every blocker \(a_h\). The filler primes are also incomparable with \(w\). Therefore every \(w\) is live immediately before \(X\) is played.

But
\[
w\mid X
\]
for all \(w\in\mathcal W\). Hence the single legal move \(X\) kills the entire family \(\mathcal W\).

The crucial point is:

\[
\boxed{\text{all proper faces of }w\text{ may be dead while both }w
\text{ and }X\text{ remain legal}.}
\]

Dead vertices impose no legality condition. Only previously **selected** comparable vertices do.

---

## Size of the deletion packet

Each prime \(p\in G_h\) occurs in exactly \(m^{j-1}\) transversals. Therefore
\[
\begin{aligned}
\sum_{w\in\mathcal W}\log w
&=
\sum_{h=1}^j
\sum_{p\in G_h}
m^{j-1}\log p\\
&=
m^{j-1}\log X.
\end{aligned}
\]

Since
\[
m\asymp_j\frac{\log n}{\log\log n},
\qquad
\log X\asymp\log n,
\]
we obtain
\[
\boxed{
\sum_{w\in\mathcal W}\log w
\asymp_j
\frac{(\log n)^j}{(\log\log n)^{j-1}}.
}
\]

For \(j=2\), this is
\[
\asymp\frac{(\log n)^2}{\log\log n},
\]
although only the two facet blockers \(a_1,a_2\) and the final move \(X\) are involved.

This family is not an insignificant corner of the divisor tensor. Since
\[
|\mathcal W|=m^j
\]
while
\[
\binom{jm}{j}
\sim \frac{j^j}{j!}m^j,
\]
the transversals form the positive proportion
\[
\frac{j!}{j^j}+o(1)
\]
of all squarefree \(j\)-subsets of the \(jm\) packet primes.

Thus legality preserves a constant-order fraction of the full combinatorial inflation.

---

## Reciprocal, or sieve, mass

Because the groups were formed cyclically from the ordered prime list, their reciprocal sums differ by only \(O(1)\). Mertens' theorem gives
\[
\sum_{\substack{q_0<p\le y}}\frac1p
=
\log\log y+O(1)
=
\log\log\log n+O(1).
\]

Hence
\[
\sum_{p\in G_h}\frac1p
=
\left(\frac1j+o(1)\right)\log\log\log n.
\]

By the product structure,
\[
\begin{aligned}
\sum_{w\in\mathcal W}\frac1w
&=
\prod_{h=1}^j
\left(\sum_{p\in G_h}\frac1p\right)\\
&=
\left(
\left(\frac1j+o(1)\right)
\log\log\log n
\right)^j.
\end{aligned}
\]

Therefore
\[
\boxed{
\sum_{w\in\mathcal W}\frac1w\longrightarrow\infty.
}
\]

So the obstruction is not merely an artifact of using \(\log d\) as the wave mass. One legal move can also delete a family with diverging formal sieve mass.

---

## 4. Why this directly defeats the chronological wave argument

Consider a policy that processes squarefree products by increasing rank:

\[
\text{primes},\quad
\text{semiprimes},\quad
\ldots,\quad
j\text{-fold products}.
\]

The packet can be embedded into such a trajectory.

Choose every packet prime larger than the first \(j\) sacrificial primes. On Prolonger's first \(j\) turns, play the facet blockers \(a_1,\ldots,a_j\). If Shortener's prime-wave policy fires the smallest surviving prime, its first \(j\) fires are the excluded sacrificial primes, not packet primes. After the facets are installed, all packet primes are blocked.

For every rank \(r<j\), every rank-\(r\) product of packet primes misses some group and therefore divides the corresponding facet blocker. Hence no lower-wave play involving packet primes can kill \(X\).

At the beginning of the rank-\(j\) wave, Prolonger plays \(X\) and deletes every transversal.

Thus the desired assertion

> lower-wave legality and preparation force rank-\(j\) deletion mass to be \(O(\log n)\) amortized per Prolonger move

is false. It fails on an actual legal, rank-ordered trajectory.

The obstruction is a complete multipartite packet:

- the \(a_h\)'s are its facets;
- lower-dimensional faces lie in facets and die;
- full transversals lie in no facet;
- \(X\) contains all transversals simultaneously.

This is precisely the kind of nonadditive compatibility phenomenon that a wave-by-wave ledger cannot see.

---

## 5. What remains universally true

For an integer \(x\) with \(k\) distinct prime factors, there is the exact identity
\[
\sum_{\substack{d\mid \operatorname{rad}(x)\\ \omega(d)=j}}
\log d
=
\binom{k-1}{j-1}\log\operatorname{rad}(x).
\]

Indeed, every prime factor of \(x\) appears in exactly
\[
\binom{k-1}{j-1}
\]
of the \(j\)-fold products.

Consequently the normalized statement
\[
\frac{1}{\binom{k-1}{j-1}}
\sum_{\substack{d\mid\operatorname{rad}(x)\\ \omega(d)=j}}
\log d
\le \log n
\]
is valid.

But the binomial normalization is essential. The multipartite packet shows that legality cannot remove it, even when every lower face has already been consumed. After this normalization, however, the target side loses the same combinatorial factor, so the normalized identity does not supply an accumulating wave contraction.

---

## 6. The sieve statement also cannot simply be iterated on survivor stocks

A set of fired primes \(Q\) satisfying
\[
\sum_{q\in Q}\frac1q\ge c
\]
does give a positive-density deletion from the ambient top interval, modulo standard sieve estimates.

It does not give the same relative deletion from an arbitrary adversarial stock \(S\subseteq T_n\). For example, the stock
\[
S=\{z\in T_n:q\nmid z\text{ for all }q\in Q\}
\]
has zero intersection with the multiples killed by \(Q\).

Thus, after wave 1, one needs a theorem about the structure or relative sieve regularity of the **realized survivor stock**. Ambient reciprocal mass alone cannot be multiplied wave after wave.

The multipartite packet shows exactly how an adversarial trajectory can create an extremely non-generic survivor stock.

---

# Final conclusion

The material supplied does not yield a full proof or disproof of
\[
L(n)=o(n).
\]

What can be concluded unconditionally is:

\[
\boxed{
\begin{gathered}
\text{Near-total top-half killing is necessary but not sufficient;}\\
\text{interior plays must also be shown to be }o(n).\\[2mm]
\text{The literal composite-wave }O(\log n)\text{ amortization is false.}\\
\text{It fails through constant-size multipartite packets.}
\end{gathered}
}
\]

Accordingly, a successful upper-bound proof must use a genuinely strategy-specific mechanism that attacks packet formation before all facets are installed; it cannot follow merely from lower-face death, play-legality, additive log budgets, or ambient sieve mass. Conversely, a linear lower-bound strategy would have to realize positive-density many such packets against Shortener’s freedom to attack them out of rank order. The construction above does not yet accomplish that global packing, so it does not disprove \(L(n)=o(n)\).
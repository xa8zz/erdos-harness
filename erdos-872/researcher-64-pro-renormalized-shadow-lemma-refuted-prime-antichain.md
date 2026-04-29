---
id: R64-pro-renormalized-shadow-lemma-refuted-prime-antichain
type: refutation
date: 2026-04-29
intent: >
  Follow-up dispatch on the same Pro thread asking for a binary close
  on the renormalized shadow lemma proposed in R63 — either a proof
  of sup_x B(x) <= (log n)^{o(1)} (closing L(n) = n / (log n)^{1-o(1)}
  unconditionally) or an explicit Prolonger construction refuting it.
  Response delivers an explicit refutation on the rank-one prime
  divisor layer of the smooth cofactor; also corrects the parameter
  range used in R63.
predecessors: [R63-pro-largest-prime-renormalization-conditional]
action:
  kind: refutes
  target: R63-pro-largest-prime-renormalization-conditional
claim: >
  The renormalized shadow lemma in its uniform per-move form is
  false. Explicit Prolonger construction: x = p * prod_{i=1}^k r_i
  where r_1 < ... < r_k are the first k primes with primorial
  s = prod r_i <= n^c (c = 1/4), giving k = (c + o(1)) log n /
  loglog n, and p is a prime in (n/(2s), n/s]. Then x lies in
  (n/2, n] with p > y large and s y-smooth — exactly the move shape
  the lemma was supposed to handle. For each prime divisor r_i | s,
  the packet Z_i = { p * r_i * q : q prime in (2N/(3 r_i), 3N/(4 r_i)] }
  with N = floor(n/p) lies in (n/2, n], is pairwise incomparable, and
  is incomparable with x; before x is played, Shortener kills the
  whole packet by playing r_i (a one-move separator since r_i | every
  z_{i,q}). After x = ps is played, r_i, p, and pr_i all divide x and
  are illegal; gcd_{q in Q_i} z_{i,q} = pr_i, so any d <= n
  comparable with every element of Z_i divides pr_i, but all three
  nontrivial divisors of pr_i are illegal, so no replacement single-
  move separator exists. The packet's separator is privatized.
  Independence: for j != i the prime r_j does not divide any z_{i,q}
  (since q is a large prime not in {r_1, ..., r_k}), so the r_i
  obstructions are mutually private. Hence one move x exports
  B(x) >= k = omega(s) asymp log n / loglog n = (log n)^{1-o(1)},
  far above (log n)^{o(1)}.
failure_mechanism: >
  Rank-one prime-antichain explosion in the smooth cofactor: a single
  upper-half move x = p * prod r_i privatizes the separator r_i for
  each of the asymp log n / loglog n packets Z_i = {p r_i q : q prime
  near N/r_i}. The packet gcd is pr_i; the three nontrivial divisors
  p, r_i, pr_i all divide x and are illegal post-move, so no single-
  move replacement separator survives. Dickman absorption does not
  save it: every witness z_{i,q} contains the large prime p > y so is
  not y-smooth at top level, and the in-fiber witness r_i * q has
  q asymp N/r_i with q > N^{1/u(N)} so is not quotient-smooth either.
  The packets live outside the Dickman exceptional mass at both top
  and recursive quotient level. Failure is on the rank-one divisor
  layer {r_1, ..., r_k} subset Div(s), not on high-rank smooth
  divisor clouds — any successor route cannot just compress
  high-rank divisors; it must also handle the rank-one smooth-prime
  layer whose size is omega(s) asymp log n / loglog n.

  Separately, the parameter u ~ loglog log n / loglog n used in R63
  is corrected: that gives u < 1 and y = n^{1/u} > n, so there are
  no primes p > y in [2, n] and the Dickman estimate
  Psi(n, y) = n / (log n)^{1 - o(1)} is vacuous. The meaningful
  regime is the reciprocal u ~ loglog n / loglog log n, under which
  the refutation is stated. The conditional theorem from R63
  remains valid as a recurrence solution, but its hypothesis is
  refuted at any granularity that is uniform per-move.
implications:
  - The largest-prime renormalization route cannot close
    L(n) = n / (log n)^{1 - o(1)} via a uniform per-move shadow-
    compression lemma. Any viable repair must charge at a coarser
    granularity — packet mass, amortized fiber entropy, or a non-
    largest-prime peel that prevents one upper-half smooth-cofactor
    move from privatizing asymp log n / loglog n quotient
    separators.
  - The candidate sharp rate L(n) = n / (log n)^{1 - o(1)} from R63
    is NOT refuted; only this specific route to the matching upper
    bound is. The lower bound n / (log n)^{1-o(1)} from
    R13-fresh-dichotomy-unresolved-slowgrowth still stands.
  - Any future "shield-compression" lemma must explicitly handle
    the rank-one prime divisor layer of any smooth cofactor; this
    is the new minimum bar for any successor.
verifiers_at_time: []
confidence_at_time: high
prompt: erdos-872/prompts/researcher-R64-followup-renormalized-shadow-lemma.md
---

came back with a refutation:

"You’re right to force the binary close. The renormalized shadow lemma, in the stated **uniform per-move** form, is false.

There is a simple obstruction, and it breaks the lemma before one even reaches high divisor layers. The explosion already occurs on the **rank-one divisor layer** of the smooth cofactor.

I will use the corrected parameter

[
u\sim \frac{\log\log n}{\log\log\log n},\qquad y=n^{1/u}.
]

With the displayed inverse (u\sim \log\log\log n/\log\log n), one has (u<1) and (y>n), so there are no primes (p>y\le n), and the Dickman assertion (\Psi(n,y)=n/(\log n)^{1-o(1)}) is false. The meaningful largest-prime regime is the reciprocal one.

## Refutation

Let

[
L=\log n.
]

Choose a constant (0<c<1/2), say (c=1/4). Let

[
s=\prod_{i=1}^{k} r_i
]

be the product of the first (k) primes, with (k) maximal subject to

[
s\le n^c.
]

By the usual primorial asymptotic,

[
\log s=(1+o(1))k\log k,
]

so

[
k=(c+o(1))\frac{\log n}{\log\log n}.
]

In particular,

[
k=(\log n)^{1-o(1)},
]

which is much larger than ((\log n)^{o(1)}).

Now choose a prime (p) with

[
\frac{n}{2s}<p\le \frac ns.
]

Such a prime exists for all sufficiently large (n) by Bertrand’s postulate, or by the prime number theorem. Define

[
x=ps.
]

Then

[
\frac n2 < x\le n.
]

Also,

[
p\ge \frac{n}{2s}\ge \frac12 n^{1-c},
]

whereas

[
y=n^{1/u}=n^{o(1)}.
]

Thus (p>y). Meanwhile every prime factor (r_i) of (s) is tiny, indeed (r_k=O(\log n)), while (y) grows faster than every fixed power of (\log n). Hence (s) is (y)-smooth.

So (x=ps) is exactly the kind of move the renormalized shadow lemma is supposed to handle: one large prime (p>y), multiplied by a (y)-smooth cofactor (s).

## The exported obstructions

Let

[
N=\left\lfloor \frac np\right\rfloor.
]

Since (p\le n/s) and (p>n/(2s)), we have

[
s\le N<2s.
]

For each prime divisor (r_i\mid s), consider primes (q) in a fixed-ratio interval

[
\frac{2N}{3r_i}<q\le \frac{3N}{4r_i}.
]

For every (i), this interval contains many primes for large (n), because

[
\frac{N}{r_i}\ge \frac{s}{r_k}
=\exp\bigl((c+o(1))\log n\bigr)
]

is enormous. Choose two or more such primes and call the chosen set (Q_i).

For (q\in Q_i), define

[
z_{i,q}=p r_i q.
]

Then

[
z_{i,q}\le p r_i\cdot \frac{3N}{4r_i}
=\frac{3pN}{4}
\le n,
]

and also

[
z_{i,q}>
p r_i\cdot \frac{2N}{3r_i}
=\frac{2pN}{3}

> \frac n2
> ]

for large (n), because (pN=n-O(p)=n(1-o(1))).

Thus all (z_{i,q}) lie in the upper half ((n/2,n]). They are therefore pairwise incomparable unless equal, and we choose them distinct.

Also (z_{i,q}) is not comparable with (x=ps). Indeed, (q\nmid s), so (z_{i,q}\nmid x), and (s\nmid r_iq), so (x\nmid z_{i,q}). Hence after Prolonger plays (x), all these (z_{i,q}) remain legal unless Shortener separately blocks them.

Now fix (i). The family

[
\mathcal Z_i={z_{i,q}:q\in Q_i}
]

has a common quotient divisor (r_i). If (x) had not been played, Shortener could kill the whole packet (\mathcal Z_i) by playing (r_i), since

[
r_i\mid z_{i,q}
]

for every (q\in Q_i).

But after (x=ps) has been played, (r_i) is illegal, because

[
r_i\mid x.
]

The same is true of (p) and (pr_i). In fact, since (\mathcal Z_i\subset(n/2,n]) and contains at least two distinct elements, any single number (d\le n) comparable with every element of (\mathcal Z_i) must divide their gcd. That gcd is

[
\gcd_{q\in Q_i} z_{i,q}=pr_i.
]

The nontrivial divisors of (pr_i) are (p), (r_i), and (pr_i), and all three divide (x), hence are illegal.

Therefore the move (x) destroys the one-move separator (r_i) for the packet (\mathcal Z_i), and there is no legal replacement separator that kills the whole packet at once.

This makes (r_i) a genuinely strategically relevant exported shield.

The relevance is private: for (j\ne i), the prime (r_j) does not divide any (z_{i,q}), because (q>r_k) and (q\notin{r_1,\dots,r_k}). So the obstruction attached to (r_i) is not covered by the obstruction attached to (r_j).

Thus the single Prolonger move

[
x=p\prod_{i=1}^k r_i
]

exports at least the (k) distinct strategically relevant lower-fiber shields

[
r_1,r_2,\dots,r_k.
]

Consequently

[
B(x)\ge k
=(c+o(1))\frac{\log n}{\log\log n}.
]

In particular, for example,

[
B(x)>(\log n)^{1/2}
]

for all sufficiently large (n). Hence

[
\sup_{x\le n}B(x)\not\le (\log n)^{o(1)}.
]

The renormalized shadow lemma is false.

## Why Dickman absorption does not save it

The obstruction is not absorbed by the global smooth exceptional set (\Psi(n,y)), because every witness

[
z_{i,q}=p r_i q
]

contains the large prime (p>y). Hence (z_{i,q}) is not (y)-smooth.

It is not absorbed inside the quotient (p)-fiber either. In that quotient, the relevant witness is

[
r_i q\le N.
]

But (q\asymp N/r_i), while the recursive smooth threshold in the quotient is

[
N^{1/u(N)}=\exp(o(\log N)).
]

Since (q=\exp((1-o(1))\log N)), we have

[
q>N^{1/u(N)}
]

for large (n). Therefore (r_iq) is not quotient-smooth. The packets (\mathcal Z_i) live outside the Dickman exceptional mass at both the top level and the recursive quotient level.

## Smallest breaking subfamily

The full divisor set of (s) has size

[
\tau(s)=2^k,
]

which is enormous. But the lemma already fails on the much smaller subfamily

[
{r_1,\dots,r_k}\subset \operatorname{Div}(s).
]

So the failure is not caused by complicated high-rank smooth divisor clouds. It is caused by the antichain of prime divisors of the smooth cofactor.

This is important: any successful replacement for largest-prime renormalization cannot merely compress high-rank divisors. It must also handle the rank-one smooth-prime layer, whose size can be

[
\omega(s)\asymp \frac{\log n}{\log\log n}.
]

That is already far above ((\log n)^{o(1)}).

## Conclusion

Option **(B)** holds.

The uniform per-move shadow bound

[
\sup_{x\le n}B(x)\le (\log n)^{o(1)}
]

is false. A single upper-half move

[
x=p\prod_{i=1}^{k}r_i
]

with (p>y) and (s=\prod r_i) (y)-smooth exports

[
B(x)\ge \omega(s)
\asymp \frac{\log n}{\log\log n}
=(\log n)^{1-o(1)}
]

strategically relevant lower-fiber obstructions.

The largest-prime route therefore cannot close through a **uniform per-move** shadow-compression lemma. Any viable version has to charge at a coarser granularity, probably by packet mass, amortized fiber entropy, or a non-largest-prime peel that prevents one upper-half smooth-cofactor move from privatizing (\asymp\log n/\log\log n) quotient separators.
"

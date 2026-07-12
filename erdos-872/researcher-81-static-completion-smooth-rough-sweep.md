---
id: R81-static-completion-smooth-rough-sweep
type: research
date: 2026-07-11
intent: >
  Full unconditional resolution attempt from the fractional-invariant base
  with manuscript excerpts and the invariant proofs supplied, free to choose
  any route.
predecessors:
  - R78-fractional-invariant-interdiction-frontier
action:
  kind: extends
  target: R78-fractional-invariant-interdiction-frontier
claim: >
  No unconditional resolution of the dichotomy. Three new unconditional
  pieces. (1) Static sublinear-completion theorem: for any primitive
  position P with |P| = k, the set M(P) of minimal legal elements (legal,
  with every proper divisor illegal) satisfies |M(P)| << eta n + n/log z +
  k z^2/eta + e^{O(z)}; for k = o(n) this is o(n), and P union M(P) is a
  maximal primitive set, so every sublinear primitive prefix has a
  sublinear maximal completion. Strengthens the exact-only-target bound
  from upper-half targets to the whole board and adds maximality. (2)
  Smooth/rough trapping sweep: with y = (1/4) log n, the minimizing player
  can in o(n) actual moves (Rankin bound Psi(n,y) = o(n) for the smooth
  sweep, Mertens/primorial count for the rough sweep) reach a position
  where every live m has its y-smooth part dividing one played carrier and
  its y-rough part dividing another. (3) Exact obstruction to finishing:
  cross-carrier products survive — t incomparable semiprime carriers
  p_i q_i regenerate at least t(t-1) new minimal legal cross-products
  p_i q_j, so one carrier move can refresh many future minimal moves and
  the static completion cannot be iterated move-by-move. Resolution
  requires either an online amortized theorem controlling NEW
  cross-products (for o(n)) or converting cross-product regeneration into
  a Prolonger strategy controlling all mixed proper divisors (for
  Theta(n)).
implications:
  - The sublinear side is reduced to bounding total NEW cross-product regeneration across the game, not component certificates; the smooth/rough sweep supplies the o(n) two-carrier trapping prefix unconditionally.
  - The quadratic regeneration example is the two-dimensional case of the cross-batch semiprime obstruction and explains why recomputing static completions after each move fails.
  - The linear side would need cross-product regeneration weaponized as a Prolonger strategy; the generic simplex loss blocks automatic passage to central rank.
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/researcher-R81-solution-attempt-fractional-invariant-base.md
---

## Verdict

I do not have a valid unconditional resolution of the dichotomy. After trying to close both directions, I found a stronger static completion theorem and an (o(n))-length two-stage separator sweep, but neither gives the missing online amortization. In particular, the second construction ends in a genuine cross-carrier residual system where linearly many later moves are not ruled out.

Consequently, I cannot truthfully claim either (L(n)=\Theta(n)) or (L(n)=o(n)). The strongest established conclusion in the supplied manuscript remains

[
c_\delta \frac{n(\log\log n)^2}{\log n}
\le L(n)
\le \bigl(0.1897123371+o(1)\bigr)n
]

for each fixed (0<\delta<1/4). 

What follows is the strongest new unconditional progress I can justify.

---

# 1. Every sublinear position has a sublinear cooperative completion

Let (P\subseteq V_n) be any primitive position. Call (m) **minimal legal relative to (P)** if

1. (m) is incomparable with every element of (P); and
2. every proper divisor (d\mid m), (2\le d<m), is illegal relative to (P).

Write (\mathcal M(P)) for the set of such (m).

## Theorem 1: Static sublinear-completion theorem

Let (k=|P|). For every (0<\eta<1) and every (z\ge 2) with (z<\eta n),

[
|\mathcal M(P)|
\ll
\eta n
+\frac{n}{\log z}
+\frac{kz^2}{\eta}
+e^{O(z)}.
\tag{1}
]

In particular, uniformly over all primitive (P) with (|P|=o(n)),

[
|\mathcal M(P)|=o(n).
\tag{2}
]

Moreover, (P\cup\mathcal M(P)) is a maximal primitive set. Thus every primitive prefix of size (o(n)) admits a maximal extension of size (o(n)).

## Proof

The members (m\le \eta n) contribute at most (\eta n), so consider (m>\eta n).

Suppose first that (m) has a prime divisor (p\le z). Since (m>\eta n>z), we have (m\ne p), and therefore

[
d:=\frac mp
]

is a proper divisor of (m).

Because (m\in\mathcal M(P)), (d) is illegal. Hence some (c\in P) is comparable with (d). The possibility (c\mid d) is excluded, since then (c\mid m), contradicting the legality of (m). Therefore

[
d\mid c.
]

Write (c=de). Since (c\le n) and (m>\eta n),

[
e=\frac{c}{d}
=\frac{cp}{m}
<\frac p\eta.
\tag{3}
]

For fixed (c,p,e), the value of (m) is uniquely determined:

[
m=\frac{pc}{e}.
]

Thus the number of possible (m>\eta n) having some prime factor (p\le z) is at most

[
\sum_{c\in P}\sum_{p\le z}\frac p\eta
\ll \frac{kz^2}{\eta}.
\tag{4}
]

It remains to count (m\le n) having no prime factor at most (z). Let

[
Q_z=\prod_{p\le z}p.
]

In each complete residue block modulo (Q_z), precisely (\varphi(Q_z)) residues are coprime to (Q_z). Therefore

[
#{m\le n:(m,Q_z)=1}
\le
\left(\frac n{Q_z}+1\right)\varphi(Q_z).
]

Using Mertens’ estimate and (\log Q_z=O(z)),

[
\frac{\varphi(Q_z)}{Q_z}
========================

\prod_{p\le z}\left(1-\frac1p\right)
\ll \frac1{\log z},
\qquad
\varphi(Q_z)\le Q_z=e^{O(z)}.
]

Consequently,

[
#{m\le n:P^-(m)>z}
\ll
\frac n{\log z}+e^{O(z)}.
\tag{5}
]

Combining the small-(m) contribution with (4) and (5) proves (1).

Now suppose (k=o(n)), and put

[
h=\frac{n}{\max{k,1}}\longrightarrow\infty.
]

For example, choose

[
\eta=h^{-1/4},
\qquad
z=\min\bigl{h^{1/10},\sqrt{\log n}\bigr}.
]

Then (\eta\to0), (z\to\infty),

[
\frac{kz^2}{\eta n}
===================

\frac{z^2}{\eta h}
=o(1),
]

and (e^{O(z)}=n^{o(1)}=o(n)). Every term on the right of (1) is therefore (o(n)), proving (2).

Finally, (\mathcal M(P)) is primitive: if distinct (a,b\in\mathcal M(P)) satisfy (a\mid b), then (a) is a legal proper divisor of (b), contradicting the minimality of (b).

Every legal (x) has a minimal legal divisor. Indeed, repeatedly pass to a legal proper divisor whenever one exists; this descending process terminates. Hence every legal (x\notin\mathcal M(P)) is a multiple of an element of (\mathcal M(P)). Thus no additional board element can be added to (P\cup\mathcal M(P)), proving maximality. ∎

### Significance

This strengthens the supplied “few exact-only upper targets” lemma in two ways:

* it applies to minimal legal elements throughout the entire board, not only to upper-half targets;
* it produces an explicit (o(n))-size maximal extension of every (o(n))-size position.

It is nevertheless a **static** theorem. It does not say Shortener can realize that completion while Prolonger continuously changes the position.

---

# 2. An (o(n))-move sweep that traps every live integer between two carriers

There is another strong but still insufficient structural reduction.

For (y\ge2), write an integer uniquely as

[
m=s_y(m)r_y(m),
]

where every prime factor of (s_y(m)) is at most (y), while every prime factor of (r_y(m)) is greater than (y). Thus (s_y(m)) is the full (y)-smooth part and (r_y(m)) is (y)-rough.

Choose

[
y=\frac14\log n.
]

## Lemma 2: Smooth/rough trapping sweep

Shortener can use (o(n)) actual moves to reach a position in which every still-legal (m) has

[
s_y(m)\mid c_1,
\qquad
r_y(m)\mid c_2
\tag{6}
]

for two previously played carriers (c_1,c_2).

## Proof

First Shortener considers every (y)-smooth integer (d\in[2,n]), in increasing order, playing it whenever it is legal.

The number of (y)-smooth integers is (o(n)). Here is an elementary Rankin bound. Put

[
\sigma=1-\frac1{2\log y}.
]

Then

[
\Psi(n,y)
\le
n^\sigma\prod_{p\le y}(1-p^{-\sigma})^{-1}.
]

Since (p^{1-\sigma}\le e^{1/2}) for (p\le y),

[
\log\prod_{p\le y}(1-p^{-\sigma})^{-1}
=O\left(\sum_{p\le y}\frac1p\right)
=O(\log\log y).
]

Therefore

[
\Psi(n,y)
\le
n\exp\left(-\frac{\log n}{2\log y}\right)
(\log y)^{O(1)}
=o(n).
\tag{7}
]

Let (m) be legal after this first sweep and put (s=s_y(m)>1). The integer (s) was considered but not played, so it was already illegal. If a played (c) divided (s), then (c\mid m), contradicting the legality of (m). Thus illegality of (s) must be witnessed in the other direction:

[
s\mid c_1
]

for some played carrier (c_1).

Shortener next considers every (y)-rough integer (r\in[2,n]), again playing it whenever legal.

The number of such integers is (o(n)). Indeed, with (Q_y=\prod_{p\le y}p),

[
#{r\le n:(r,Q_y)=1}
\ll
\frac n{\log y}+Q_y.
]

Here (Q_y=e^{(1+o(1))y}=n^{1/4+o(1)}), so

[
#{r\le n:P^-(r)>y}
\ll
\frac n{\log\log n}+n^{1/4+o(1)}
=o(n).
\tag{8}
]

If (m) remains legal after this second sweep and (r=r_y(m)>1), exactly the same comparison argument gives a played carrier (c_2) with (r\mid c_2).

The cases (s=1) or (r=1) cannot remain legal: then (m) itself belongs respectively to the rough or smooth sweep and would have been played when considered. Hence every live (m) satisfies (6). ∎

This comes close to an (o(n)) proof: after an (o(n)) prefix, every live integer is a cross-product of a smooth component captured by one carrier and a rough component captured by another.

But “captured separately” is not the same as “killed.”

---

# 3. The exact obstruction: cross-carrier products survive

Take four distinct primes (p,q,r,s) such that all relevant products are at most (n), and suppose the played carriers are

[
c_1=pr,\qquad c_2=qs.
]

Then

[
p\mid c_1,\qquad q\mid c_2,
]

but the cross-product

[
m=pq
]

is incomparable with both (c_1) and (c_2). Its only nontrivial proper divisors are (p) and (q), both of which are illegal. Thus (m) is legal and exact-only.

The phenomenon can be quadratic. Let

[
p_1,\ldots,p_t,q_1,\ldots,q_t
]

be distinct primes in an interval ([X,2X]), with (4X^2\le n), and play the primitive carrier family

[
P={p_iq_i:1\le i\le t}.
]

All carriers have (\Omega=2), so they are pairwise incomparable. For every (i\ne j),

[
m_{ij}=p_iq_j
]

is legal relative to (P), while both of its proper divisors are illegal:

[
p_i\mid p_iq_i,\qquad q_j\mid p_jq_j.
]

Hence

[
|\mathcal M(P)|\ge t(t-1).
\tag{9}
]

Thus (t) carrier moves can regenerate (\Theta(t^2)) new minimal legal elements. This is exactly why Theorem 1 cannot be iterated by simply recomputing a small maximal extension after every Prolonger move.

The same construction is the two-dimensional version of the manuscript’s cross-batch semiprime obstruction. Higher-dimensional versions are covering-design systems, and the rank-(r) simplex shows that merely increasing the number of factor classes does not supply a rank-independent capture fraction.

---

# 4. Where a genuine resolution must enter

The new results above narrow the missing step:

* A sublinear prefix always has a sublinear static maximal completion.
* Shortener can, in (o(n)) moves, force every live integer to be assembled from components separately contained in earlier carriers.
* Nevertheless, components contained in different carriers can recombine into large cross-product families, and one carrier move can refresh many future minimal moves.

To prove (L(n)=o(n)), one still needs an amortized theorem showing that these successive cross-products cannot regenerate a total of (\Theta(n)) distinct legal moves. The theorem must control **new** cross-products, not the sum of their repeatedly reused component certificates.

To prove (L(n)=\Theta(n)), one must turn such cross-product regeneration into a Prolonger strategy while controlling all mixed proper divisors. The rank-three construction does this at fixed rank, but its target population is only

[
\asymp \frac{n(\log\log n)^2}{\log n},
]

and the generic simplex loss prevents an automatic passage to central rank.

Accordingly, the requested unconditional determination is not established here. A boxed claim of either asymptotic alternative would require precisely the online cross-carrier amortization or arithmetic high-rank capture theorem that is still absent.

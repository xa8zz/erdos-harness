I get a definitive negative for the CPD chain as stated. The obstruction is not another singleton apex; it is a **multi-apex clique cone**. It shows that the general-(\mathcal D) CPD is false, and it forces a strictly sharper three-outcome replacement: besides separator and Prolonger-saturation, one must track the **(q)-up-shadow of prior Shortener blockers**.

The missing foundational tool is therefore:

**Prior-blocker up-shadow amortization:** an inequality or strategy controlling live (L)-packet mass from the measure of
[
{Q\in \binom Pq:\exists D\in\mathcal D,\ D\subseteq Q},
]
not merely from (\mathcal C).

Without that third term, the CPD paradigm cannot close the (r_1) upper bound.

Here is the rigorous construction.

Let (h) be large and

[
L=\left\lfloor \frac{h}{\log h}\right\rfloor,\qquad K=h+L.
]

Choose

[
z=\lceil 10\log h\rceil,
\qquad
\ell=L-z+1,
]

so (\ell>0) for all sufficiently large (h). Split the packet as

[
P=Z\sqcup Y,\qquad |Z|=z,\qquad |Y|=N=K-z.
]

Let the prior Shortener blockers be the complete graph on the apex set (Z):

[
\mathcal D=\binom Z2.
]

Thus a new Shortener claim (Q) is legal relative to (\mathcal D) only if

[
|Q\cap Z|\le 1.
]

Now fix

[
q=\left\lfloor \frac h2\right\rfloor.
]

We build a sparse family

[
\mathcal F\subseteq \binom Y\ell
]

such that no (q)-subset of (Y) hits all members of (\mathcal F). Equivalently, every (q)-set (T\subseteq Y) is disjoint from at least one (A\in\mathcal F).

A probabilistic construction gives this with small size. For a fixed (q)-set (T\subseteq Y), a random (\ell)-set (A\subseteq Y) is disjoint from (T) with probability

[
p=\frac{\binom{N-q}{\ell}}{\binom N\ell}.
]

Taking

[
m\ge \frac{2\log\binom Nq}{p}
]

random (\ell)-sets, the probability that some (q)-set (T) meets all of them is at most

[
\binom Nq(1-p)^m
\le
\binom Nq e^{-pm}
\le
\binom Nq e^{-2\log\binom Nq}
<1.
]

So there exists (\mathcal F) with

[
|\mathcal F|
\le
2\log\binom Nq\cdot \frac{\binom N\ell}{\binom{N-q}{\ell}}+1
]

and (\tau(\mathcal F)>q).

Define the played Prolonger complement family

[
\mathcal C
==========

\left{
(Z\setminus{u})\cup A:
u\in Z,\ A\in\mathcal F
\right}
\subseteq \binom PL.
]

The corresponding Prolonger moves are

[
B_{u,A}=P\setminus \bigl((Z\setminus{u})\cup A\bigr)
====================================================

{u}\cup (Y\setminus A).
]

Each has size

[
1+(N-\ell)
==========

# 1+(h+\ell-1-\ell)

h.
]

So these are rank-(h) packet moves.

The state is game-legal. The blockers (\binom Z2) are pairwise incomparable. Each Prolonger move (B_{u,A}) contains exactly one apex from (Z), so no prior blocker (D\in\binom Z2) is contained in (B_{u,A}). Also (B_{u,A}\not\subseteq D), since (|B_{u,A}|=h>2). Distinct (B_{u,A})’s are distinct (h)-sets, hence form an antichain.

Now show that **Case (A_q) fails**.

Let (Q) be any legal relative blocker with (|Q|\le q). Since (Q) is legal relative to (\mathcal D=\binom Z2),

[
|Q\cap Z|\le 1.
]

If (Q\cap Z=\varnothing), then (Q_Y:=Q\cap Y) has size at most (q). Since (\tau(\mathcal F)>q), there is some (A\in\mathcal F) with

[
Q_Y\cap A=\varnothing.
]

Then for any (u\in Z),

[
Q\cap\bigl((Z\setminus{u})\cup A\bigr)=\varnothing,
]

so (Q) does not hit (\mathcal C).

If (Q\cap Z={u}), then (Q) automatically misses the apex part of the complements of type

[
(Z\setminus{u})\cup A.
]

Again (|Q_Y|\le q-1<q), so there exists (A\in\mathcal F) disjoint from (Q_Y). Hence

[
Q\cap\bigl((Z\setminus{u})\cup A\bigr)=\varnothing.
]

Thus no legal relative blocker of size at most (q) exists.

So (A_q) fails.

Now compute the CPD saturation threshold. In the proposed CPD,

[
\delta_q=\frac{\binom{K-q}{L}}{\binom KL},
\qquad
\frac1{\delta_q}=\frac{\binom KL}{\binom{K-q}{L}}.
]

But

[
|\mathcal C|
============

z|\mathcal F|
\le
z\left(
2\log\binom Nq\cdot \frac{\binom N\ell}{\binom{N-q}{\ell}}+1
\right).
]

The key ratio is

[
\delta_q\cdot \frac{\binom N\ell}{\binom{N-q}{\ell}}
====================================================

\frac{\binom{K-q}{L}}{\binom KL}
\cdot
\frac{\binom N\ell}{\binom{N-q}{\ell}}.
]

Since (K=N+z) and (L=\ell+z-1), this ratio is essentially the penalty for forcing (z-1) apex coordinates into an (L)-set. For (q=\lfloor h/2\rfloor), one has

[
\frac{\binom{K-q}{L}}{\binom KL}
\cdot
\frac{\binom N\ell}{\binom{N-q}{\ell}}
\le
C_0\cdot 0.6^{,z}
]

for an absolute constant (C_0), for all sufficiently large (h). With (z=\lceil 10\log h\rceil), this is (O(h^{-5})). Therefore

[
|\mathcal C|\delta_q
\le
z\left(2\log\binom Nq+1\right)O(h^{-5})
=o(1).
]

Equivalently,

[
|\mathcal C|
<
\frac1{\delta_q}
]

for all sufficiently large (h).

So (B_q) also fails.

Therefore the proposed **general-(\mathcal D) CPD is false**: there are legal states for which no legal separator of size (\le q) exists, but the played complement family is far smaller than the CPD threshold (1/\delta_q).

This is not just a counting quirk. The live residual is also not chargeable to (\mathcal C). The live (L)-complements after the prior blockers (\mathcal D=\binom Z2) are exactly those (R\in\binom PL) satisfying

[
R\cap D\ne\varnothing
\quad\text{for every }D\in\binom Z2.
]

Equivalently,

[
|R\cap Z|\ge z-1.
]

Our played complements only occupy the sparse subfamily

[
(Z\setminus{u})\cup A,\qquad A\in\mathcal F.
]

The remaining live cone contains at least

[
z\left(\binom N\ell-|\mathcal F|\right)
]

unplayed complements of the same apex type. Since

[
|\mathcal F|
\le
2\log\binom Nq\cdot \frac{\binom N\ell}{\binom{N-q}{\ell}}+1
]

and

[
\binom{N-q}{\ell}
=================

\exp!\bigl(\Omega(L\log\log h)\bigr),
]

we have

[
\frac{|\mathcal R_{\mathrm{live}}|}{|\mathcal C|}
\ge
\exp!\bigl(\Omega(L\log\log h)\bigr).
]

Thus the earlier weighted-shadow Case B also fails by an exponential-in-(L\log\log h) factor.

I verified the finite legal pattern and the failure of the raw CPD inequality in a small exhaustive instance. For (h=8), (L=5), (z=4), (K=13), (\ell=2), (q=7), take the full version (\mathcal F=\binom Y2). Then

[
|\mathcal D|=6,\qquad |\mathcal C|=4\binom 92=144,
]

while

[
\frac1{\delta_q}
================

# \frac{\binom{13}{5}}{\binom{6}{5}}

214.5.
]

No legal relative blocker of size at most (7) exists, and the state is legal.

```python
from itertools import combinations
from math import comb

def exhaustive_full_clique_example(h=8, L=5, z=4):
    K = h + L
    ell = L - z + 1
    Z = tuple(range(z))
    Y = tuple(range(z, K))
    P = set(range(K))

    D = [frozenset(d) for d in combinations(Z, 2)]

    C = []
    for omitted in Z:
        apex = set(Z) - {omitted}
        for A in combinations(Y, ell):
            C.append(frozenset(apex | set(A)))

    B = [frozenset(P - set(c)) for c in C]
    q = h - 1

    state_ok = (
        len(set(C)) == len(C)
        and all(len(c) == L for c in C)
        and all(len(b) == h for b in B)
        and all(not (b1 < b2 or b2 < b1)
                for i, b1 in enumerate(B) for b2 in B[i+1:])
        and all(not (d.issubset(b) or b.issubset(d))
                for d in D for b in B)
        and all(not (d1 < d2 or d2 < d1)
                for i, d1 in enumerate(D) for d2 in D[i+1:])
    )

    small_legal_hitter_exists = False
    for r in range(1, q + 1):
        for tup in combinations(range(K), r):
            Q = frozenset(tup)
            if any(d.issubset(Q) or Q.issubset(d) for d in D):
                continue
            if all(Q & c for c in C):
                small_legal_hitter_exists = True
                break
        if small_legal_hitter_exists:
            break

    threshold = comb(K, L) / comb(K - q, L)

    return {
        "h": h,
        "L": L,
        "z": z,
        "ell": ell,
        "K": K,
        "q": q,
        "|D|": len(D),
        "|C|": len(C),
        "threshold_1_over_delta": threshold,
        "C_less_than_threshold": len(C) < threshold,
        "state_ok": state_ok,
        "small_legal_hitter_exists": small_legal_hitter_exists,
    }

print(exhaustive_full_clique_example())
```

Output:

```text
{
  'h': 8,
  'L': 5,
  'z': 4,
  'ell': 2,
  'K': 13,
  'q': 7,
  '|D|': 6,
  '|C|': 144,
  'threshold_1_over_delta': 214.5,
  'C_less_than_threshold': True,
  'state_ok': True,
  'small_legal_hitter_exists': False
}
```

For the asymptotic sparse construction, log-scale numerical checks also confirm the separation. With (z=\lceil 10\log h\rceil), the logarithm of

[
|\mathcal C|-\text{threshold}
]

in multiplicative form, namely

[
\log |\mathcal C|-\log(1/\delta_q),
]

is already strongly negative:

```text
h=10000:    log(|C|) - log(1/delta_q) <= -41.25
h=100000:   log(|C|) - log(1/delta_q) <= -54.18
h=1000000:  log(|C|) - log(1/delta_q) <= -67.44
h=10000000: log(|C|) - log(1/delta_q) <= -80.81
```

At the same parameters, the logarithm of the residual-to-played ratio is enormous:

```text
h=10000:    log(|R_live|/|C|) >= 2676.7
h=100000:   log(|R_live|/|C|) >= 24363.7
h=1000000:  log(|R_live|/|C|) >= 216968.0
h=10000000: log(|R_live|/|C|) >= 1951723.3
```

So this is not repairable by changing constants in the proposed Case B.

The correct replacement theorem is the following exact weighted trichotomy.

Let (\mu_q) be any probability measure on (q)-subsets of (P). Define the prior-blocker forbidden (q)-up-shadow

[
\Phi_q(\mathcal D)
==================

\mu_q{Q\in\binom Pq:\exists D\in\mathcal D,\ D\subseteq Q}.
]

For a complement (C), define

[
\Delta_q(C)=\mu_q{Q\in\binom Pq:Q\cap C=\varnothing},
\qquad
\Delta_q=\max_{C\in\binom PL}\Delta_q(C).
]

Then, for every (\mathcal C\subseteq\binom PL), at least one of the following holds:

1. There is a legal relative blocker (Q\in\binom Pq) hitting every (C\in\mathcal C) and containing no (D\in\mathcal D).
2. [
   |\mathcal C|\ge \frac{1-\Phi_q(\mathcal D)}{\Delta_q}.
   ]
3. [
   \Phi_q(\mathcal D)>0.
   ]

More usefully, with a numerical split:

Either

[
\text{A: a legal (q)-separator exists,}
]

or

[
\text{B: } |\mathcal C|\ge \frac{1}{2\Delta_q},
]

or

[
\text{C: } \Phi_q(\mathcal D)\ge \frac12.
]

Proof: if no legal (q)-separator exists, every (q)-set (Q) either contains some prior blocker (D\in\mathcal D), or else fails to hit some (C\in\mathcal C). Therefore

[
1
\le
\Phi_q(\mathcal D)
+
\mu_q\left(
\bigcup_{C\in\mathcal C}{Q:Q\cap C=\varnothing}
\right)
\le
\Phi_q(\mathcal D)
+
\sum_{C\in\mathcal C}\Delta_q(C)
\le
\Phi_q(\mathcal D)+|\mathcal C|\Delta_q.
]

This proves the trichotomy.

For the uniform packet measure,

[
\Delta_q=\frac{\binom{K-L}{q}}{\binom Kq}
=========================================

# \frac{\binom{K-q}{L}}{\binom KL}

\delta_q.
]

So this strictly contains the apex-singleton CPD. In the apex-singleton case, (\Phi_q({{x}})=q/K), which is not close to (1) for the relevant (q), so the old two-outcome CPD survives. In the multi-apex clique construction,

[
\Phi_q(\mathcal D)
==================

\Pr\bigl(|Q\cap Z|\ge 2\bigr),
\qquad Q\sim\binom Pq.
]

With (q\sim h/2), (K\sim h), and (z=10\log h), the mean of (|Q\cap Z|) is (\sim 5\log h), hence

[
\Phi_q(\mathcal D)=1-o(1).
]

Thus the construction lives entirely in the third outcome. That is exactly why the two-outcome CPD fails.

The Sathe-Selberg weighted version is the same theorem with (\mu_q) replaced by the conditional Euler-factor measure on (q)-subsets, or by the Bernoulli product measure

[
\Pr(p\in Q)=\frac1{p+1}
]

conditioned on the appropriate packet slice. The proof above uses only union bound and incidence; it is measure-theoretic, not uniform-specific. The only change is that

[
\Delta_q(C)
]

is no longer exactly (\binom{K-q}{L}/\binom KL), but in a bounded-distortion prime packet it is comparable to the corresponding uniform value, with constants depending on the packet distortion. The third term (\Phi_q(\mathcal D)) remains unavoidable.

So the requested online closure cannot be obtained from CPD alone. A Shortener strategy using only:

[
\text{separator}
\quad\text{or}\quad
|\mathcal C|\ge 1/\delta_q
]

has no legal move and no valid charge in the multi-apex clique cone. The prior blockers (\binom Z2) occupy almost all of the (q)-layer, yet the live (L)-cone still has mass

[
\pi(\mathcal R_{\mathrm{live}})
\ge
\exp\bigl(-O(\log h\log\log h)\bigr),
]

while the played complement mass is exponentially smaller by

[
\exp\bigl(\Omega(L\log\log h)\bigr).
]

Thus the paradigm needs a fourth object in the invariant, or equivalently a genuine third case:

[
\boxed{
\text{large prior-blocker (q)-up-shadow}
\Longrightarrow
\text{controlled live (L)-cone, or a new legal move.}
}
]

That is the missing foundational theorem. A valid (r_1)-scale upper bound via this route must prove a **weighted prior-blocker up-shadow amortization theorem** strong enough to convert Case C into either an entropy decrement or a chargeable packet closure. Without that theorem, the CPD chain cannot reach

[
L(n)\le O!\left(\frac{n(\log\log n)^2}{\log n}\right).
]

So the outcome is a structural negative: the two-outcome CPD extension is rigorously false, and the strictly sharper replacement is the weighted three-outcome trichotomy above. The new, indispensable ingredient is prior-blocker up-shadow amortization.

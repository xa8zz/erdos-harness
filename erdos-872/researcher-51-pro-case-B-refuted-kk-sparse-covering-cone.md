I found a definitive refutation of the proposed Case B. The obstruction is a sparse version of the forbidden-core cone: a single prior Shortener blocker forbids the apex, while a very small Prolonger complement family has large transversal number. Case A fails, but the live residual is almost the entire apex cone, far too large to charge to (|\mathcal C|_\pi).

Call this the **sparse forbidden-core covering obstruction**.

Let (h) be large, let

[
L=\left\lfloor \frac{h}{\log h}\right\rfloor,\qquad K=h+L,
]

and let the packet be

[
P={x}\sqcup Y,\qquad |Y|=N=h+L-1.
]

Set

[
k=L-1,\qquad t=\left\lfloor \frac h2\right\rfloor.
]

We first build a sparse family

[
\mathcal F\subseteq \binom{Y}{k}
]

with two properties:

[
\tau(\mathcal F)>t,
]

meaning no (t)-set hits every member of (\mathcal F), but

[
|\mathcal F|\le \exp(O(L)).
]

Here is the standard probabilistic construction. Choose (m) random (k)-subsets of (Y). For a fixed (t)-set (T\subseteq Y), the probability that one sampled (k)-set is disjoint from (T) is

[
p=\frac{\binom{N-t}{k}}{\binom Nk}.
]

If

[
m\ge \frac{2\log \binom Nt}{p},
]

then the probability that some (t)-set (T) meets every sampled (k)-set is at most

[
\binom Nt (1-p)^m
\le
\binom Nt e^{-pm}
\le
\binom Nt e^{-2\log\binom Nt}
<1.
]

So there exists (\mathcal F) such that every (t)-set misses at least one (A\in\mathcal F). Equivalently,

[
\tau(\mathcal F)>t.
]

Now estimate (m). Since (L\le h/4) for large (h), and (k=L-1), we have

[
p
=

\prod_{a=0}^{k-1}\frac{N-t-a}{N-a}
\ge
\left(\frac25\right)^k.
]

Also (\log\binom Nt\le N\le 2h). Hence

[
|\mathcal F|
\le
2\log\binom Nt \left(\frac52\right)^k+1
\le
\exp(2L)
]

for all sufficiently large (h).

Now define the Prolonger complement clutter

[
\mathcal C
==========

\bigl{C_A:={x}\cup A:\ A\in\mathcal F\bigr}
\subseteq \binom PL,
]

and let the already claimed Shortener blocker family be

[
\mathcal D=\bigl{{x}\bigr}.
]

The corresponding played Prolonger packet moves are

[
B_A=P\setminus C_A=Y\setminus A.
]

Each (B_A) has size

[
|Y|-|A|=(h+L-1)-(L-1)=h.
]

Thus all (B_A)’s are rank-(h) packet moves. They are distinct (h)-sets, hence form an antichain. The prior Shortener blocker ({x}) is legal against every (B_A), because (x\notin B_A). So this is a game-legal packet state. It is also locally reachable: Prolonger can first play one (B_A), Shortener can claim (x), and later Prolonger moves of this form remain legal with respect to (x).

Now consider legal relative blockers (Q). Since (D={x}) has already been claimed, any new legal relative blocker must satisfy

[
{x}\not\subseteq Q,
]

so (x\notin Q). Therefore (Q\subseteq Y). To hit every member of (\mathcal C), (Q) must hit every (A\in\mathcal F). But (\tau(\mathcal F)>t), so

[
|Q|>t=\left\lfloor \frac h2\right\rfloor.
]

Therefore there is no legal relative blocker of size at most (h/2).

By the already-proved Bernoulli Legal-Separator Lemma, if the Bernoulli hypothesis held, it would produce a legal relative blocker (Q) with

[
|Q|\le 2X\le h/2.
]

No such (Q) exists. Hence the Bernoulli hypothesis fails in this state. So this is genuinely in Case B.

Now compute the live residual. A future Prolonger complement (R\in\binom PL) is live with respect to (D={x}) precisely when

[
R\cap {x}\neq \varnothing,
]

that is, when (x\in R). Excluding the already played complements (\mathcal C), the live residual is

[
\mathcal R_{\mathrm{live}}
==========================

\bigl{{x}\cup A:\ A\in\binom{Y}{L-1}\setminus\mathcal F\bigr}.
]

Thus

[
|\mathcal C|=|\mathcal F|=m,
]

while

[
|\mathcal R_{\mathrm{live}}|
============================

\binom{N}{L-1}-m.
]

Under the uniform packet slice measure

[
\pi(\mathcal A)=\frac{|\mathcal A|}{\binom KL},
]

the ratio is exactly

[
\frac{|\mathcal R_{\mathrm{live}}|*\pi}{|\mathcal C|*\pi}
=========================================================

\frac{\binom{N}{L-1}-m}{m}.
]

But

[
\binom{N}{L-1}
\ge
\left(\frac{N}{L-1}\right)^{L-1}
\ge
(\log h)^{L-1},
]

while (m\le \exp(2L)). Therefore

[
\frac{|\mathcal R_{\mathrm{live}}|*\pi}{|\mathcal C|*\pi}
\ge
\exp!\left(\Omega(L\log\log h)\right).
]

In particular, any Case B inequality of the form

[
|\mathcal R_{\mathrm{live}}|*\pi
\le
\kappa(h,L),|\mathcal C|*\pi
]

must have

[
\kappa(h,L)
\ge
\exp!\left(\Omega(L\log\log h)\right).
]

For (L\sim h/\log h), this is

[
\kappa(h,L)
\ge
\exp!\left(\Omega!\left(\frac{h\log\log h}{\log h}\right)\right).
]

That is not a usable saturation factor for an (r_1)-scale upper bound. Indeed the live residual has packet mass

[
|\mathcal R_{\mathrm{live}}|_\pi
================================

# \frac{\binom{K-1}{L-1}-m}{\binom KL}

\frac{L}{K}-o(1)
\asymp \frac1{\log h},
]

whereas

[
|\mathcal C|_\pi
\le
\frac{\exp(2L)}{\binom KL}
\le
\exp!\left(-\Omega(L\log\log h)\right).
]

So the played Prolonger complement mass is exponentially too small, in the packet parameter, to pay for the live residual.

I also sandbox-verified a finite instance. For (h=12), (L=4), so (K=16), (N=15), (k=3), (t=6), a greedy construction gives (|\mathcal F|=16), while the live (x)-cone has (455-16=439) residual complements.

```python
from itertools import combinations
from math import comb

h, L = 12, 4
N = h + L - 1
K = h + L
x = N
P = set(range(K))
Y = set(range(N))
k = L - 1
t = h // 2

# Greedy family F: every t-set misses some A in F.
T_masks = [sum(1 << i for i in T) for T in combinations(range(N), t)]
uncovered = set(range(len(T_masks)))

A_data = []
for A in combinations(range(N), k):
    amask = sum(1 << i for i in A)
    covers = [idx for idx, Tm in enumerate(T_masks) if (Tm & amask) == 0]
    A_data.append((amask, covers, A))

F = []
while uncovered:
    best = max(A_data, key=lambda item: sum(idx in uncovered for idx in item[1]))
    F.append(best[2])
    for idx in best[1]:
        uncovered.discard(idx)

C = [frozenset((x, *A)) for A in F]
B = [frozenset(P - set(c)) for c in C]
D = frozenset({x})

state_ok = (
    all(len(c) == L for c in C)
    and all(len(b) == h for b in B)
    and all(not (b1 < b2 or b2 < b1)
            for i, b1 in enumerate(B) for b2 in B[i+1:])
    and all(not D.issubset(b) and not b.issubset(D) for b in B)
)

small_Q_exists = False
for qsize in range(1, t + 1):
    for Qtuple in combinations(range(K), qsize):
        Q = frozenset(Qtuple)
        if D.issubset(Q):
            continue
        if all(Q & c for c in C):
            small_Q_exists = True
            break
    if small_Q_exists:
        break

R_live = [
    frozenset((x, *A))
    for A in combinations(range(N), L - 1)
    if frozenset((x, *A)) not in set(C)
]

print({
    "state_ok": state_ok,
    "small_legal_relative_blocker_exists_up_to_h/2": small_Q_exists,
    "|C|": len(C),
    "|R_live|": len(R_live),
    "|R_live|/|C|": len(R_live) / len(C),
    "packet_denominator": comb(K, L),
    "|C|_pi": f"{len(C)}/{comb(K, L)}",
    "|R_live|_pi": f"{len(R_live)}/{comb(K, L)}",
})
```

Output:

```text
{
  'state_ok': True,
  'small_legal_relative_blocker_exists_up_to_h/2': False,
  '|C|': 16,
  '|R_live|': 439,
  '|R_live|/|C|': 27.4375,
  'packet_denominator': 1820,
  '|C|_pi': '16/1820',
  '|R_live|_pi': '439/1820'
}
```

This refutes the proposed two-outcome Case A/Case B scheme.

The missing third outcome is not ordinary saturation of (\mathcal C). It is a **covering-design cone regime**:

[
\mathcal C={x}\ast \mathcal F,\qquad \mathcal D={{x}},
]

where (\mathcal F) has very small packet mass but very large transversal number. The obstruction is measured by the disjoint (t)-shadow

[
\nabla_t^\perp(\mathcal F)
==========================

\left{T\in\binom Yt:\exists A\in\mathcal F,\ A\cap T=\varnothing\right}.
]

In this construction,

[
\nabla_t^\perp(\mathcal F)=\binom Yt
]

even though

[
|\mathcal F|\le \exp(O(L)).
]

So the paradigm needs a third invariant controlling this high-order disjoint shadow, or a separate strategy preventing a forbidden core from turning a sparse high-transversal base into an almost full live cone. Weighted Kruskal-Katona/LYM in terms of (|\mathcal C|_\pi) alone cannot supply the needed charge.

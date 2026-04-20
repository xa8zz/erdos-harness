WLST is false as stated. The obstruction is a **forbidden-core star**: one previously claimed legal blocker can be the unique small blocker of the current complement clutter, and once that core is forbidden, every remaining legal relative blocker has rank (h) and captures only one packet atom.

Here is the exact counterexample.

Let (K=h+L), with (L\ge 2), and let the packet be

[
P={x,z}\sqcup Y,\qquad |Y|=h+L-2.
]

Define the Prolonger complement clutter

[
\mathcal C
==========

\bigl{, C_A:={x}\cup A:\ A\in \binom{Y}{L-1},\bigr},
]

and let the prior Shortener blocker family be

[
\mathcal D=\bigl{{x}\bigr}.
]

The corresponding Prolonger moves are

[
B_A=P\setminus C_A={z}\cup (Y\setminus A),
]

and each (B_A) has size

[
1+\bigl(|Y|-(L-1)\bigr)=1+(h+L-2-L+1)=h.
]

So this is a rank-(h) packet state.

The state is game-legal. The (B_A)’s are distinct (h)-sets, hence form an antichain. The prior Shortener move ({x}) is incomparable with every (B_A), because (x\notin B_A), while (|B_A|=h>1). Thus Prolonger’s whole family is legal after Shortener has claimed ({x}).

Now characterize every legal relative blocker (Q). WLST requires

[
Q\cap C_A\neq \varnothing\quad\text{for every }A\in\binom{Y}{L-1},
]

and

[
{x}\not\subseteq Q.
]

The second condition is simply (x\notin Q). Since (z) belongs to no (C_A), the point (z) is useless for hitting (\mathcal C). Therefore (Q) must hit every ((L-1))-subset of (Y). This is possible only if

[
|Y\setminus Q|\le L-2.
]

Since (|Y|=h+L-2), this gives

[
|Q\cap Y|\ge h.
]

So every legal relative blocker has at least (h) packet primes.

Conversely, every (h)-subset (Q\subseteq Y) is a minimal legal relative blocker: it avoids (x), hits every (C_A), is not contained in any played (B_A), and contains no played (B_A), because every played (B_A) contains (z) while (Q\subseteq Y).

Thus the blocker structure is exactly

[
b(\mathcal C)=\bigl{{x}\bigr}\ \cup\ \binom{Y}{h}.
]

After the prior legal blocker ({x}) has been claimed, all remaining minimal legal blockers have size (h).

Now compute the packet capture. Under the packet quotient measure,

[
\pi\bigl({C':C'\cap Q=\varnothing}\bigr)
========================================

\frac{\binom{K-|Q|}{L}}{\binom{K}{L}},
]

with the convention that (\binom{K-|Q|}{L}=0) if (K-|Q|<L). Since every legal relative blocker has (|Q|\ge h),

[
\pi\bigl({C':C'\cap Q=\varnothing}\bigr)
\le
\frac{\binom{K-h}{L}}{\binom{K}{L}}
===================================

\frac{1}{\binom{h+L}{L}}.
]

For the central choice (L=\lfloor h/\log h\rfloor),

[
\binom{h+L}{L}
\ge
\left(\frac{h+L}{L}\right)^L
\ge
(\log h)^L
]

for all sufficiently large (h). Hence

[
\pi\bigl({C':C'\cap Q=\varnothing}\bigr)
\le
\exp\bigl(-L\log\log h\bigr)
============================

\exp!\left(-\Omega!\left(\frac{h\log\log h}{\log h}\right)\right).
]

In particular,

[
\pi\bigl({C':C'\cap Q=\varnothing}\bigr)
\le
\exp(-h^{1/2})
]

for all sufficiently large (h). This is the requested (\exp(-\operatorname{poly}(h))) obstruction.

The packet is not already closed. After ({x}) has been claimed and all (B_A)’s above have been played, the remaining legal Prolonger moves inside the packet are precisely the (h)-subsets of (Y). Their count is

[
\binom{|Y|}{h}
==============

# \binom{h+L-2}{h}

\binom{h+L-2}{L-2},
]

and their total packet mass is

[
\frac{\binom{h+L-2}{h}}{\binom{h+L}{h}}
=======================================

\frac{L(L-1)}{(h+L)(h+L-1)}
\asymp
\frac1{(\log h)^2}
]

when (L\sim h/\log h). So the obstruction is not a terminal-packet artifact: a polynomially visible residual packet remains, but every legal relative blocker captures only one atom of it.

I also verified the finite packet legality and capture computation by exhaustive enumeration. For example:

```python
from itertools import combinations
from math import comb

def forbidden_core_star_check(h, L):
    K = h + L
    P = tuple(range(K))
    x, z = 0, 1
    Y = tuple(i for i in P if i not in (x, z))

    C = [frozenset((x, *A)) for A in combinations(Y, L - 1)]
    B = [frozenset(set(P) - set(c)) for c in C]
    D = frozenset([x])

    state_ok = (
        len(set(B)) == len(B)
        and all(len(b) == h for b in B)
        and all(not (b1 < b2 or b2 < b1)
                for i, b1 in enumerate(B) for b2 in B[i+1:])
        and all(not D.issubset(b) and not b.issubset(D) for b in B)
    )

    legal_relative = []
    legal_full = []
    total_L = comb(K, L)
    max_cap_rel = -1
    max_cap_full = -1
    min_size_rel = None
    min_size_full = None

    for qsize in range(1, K + 1):
        for tup in combinations(P, qsize):
            Q = frozenset(tup)

            # WLST relative legality: Q hits every C and does not contain prior D={x}.
            if D.issubset(Q):
                continue
            if not all(Q & c for c in C):
                continue

            cap = comb(K - len(Q), L) if K - len(Q) >= L else 0
            legal_relative.append((Q, cap))
            max_cap_rel = max(max_cap_rel, cap)
            min_size_rel = qsize if min_size_rel is None else min(min_size_rel, qsize)

            # Full antichain legality against played Prolonger sets and D.
            full_ok = (
                not Q.issubset(D)
                and all(not b.issubset(Q) and not Q.issubset(b) for b in B)
            )
            if full_ok:
                legal_full.append((Q, cap))
                max_cap_full = max(max_cap_full, cap)
                min_size_full = qsize if min_size_full is None else min(min_size_full, qsize)

    return {
        "h": h,
        "L": L,
        "K": K,
        "|C|": len(C),
        "state_ok": state_ok,
        "relative_blockers": len(legal_relative),
        "min_relative_size": min_size_rel,
        "max_relative_capture_fraction": f"{max_cap_rel}/{total_L}",
        "fully_legal_blockers": len(legal_full),
        "min_fully_legal_size": min_size_full,
        "max_fully_legal_capture_fraction": f"{max_cap_full}/{total_L}",
    }

print(forbidden_core_star_check(8, 3))
print(forbidden_core_star_check(10, 4))
```

The output was:

```text
{'h': 8, 'L': 3, 'K': 11, '|C|': 36, 'state_ok': True,
 'relative_blockers': 20, 'min_relative_size': 8,
 'max_relative_capture_fraction': '1/165',
 'fully_legal_blockers': 10, 'min_fully_legal_size': 8,
 'max_fully_legal_capture_fraction': '1/165'}

{'h': 10, 'L': 4, 'K': 14, '|C|': 220, 'state_ok': True,
 'relative_blockers': 158, 'min_relative_size': 10,
 'max_relative_capture_fraction': '1/1001',
 'fully_legal_blockers': 79, 'min_fully_legal_size': 10,
 'max_fully_legal_capture_fraction': '1/1001'}
```

There is also a sparse version showing that this is not merely caused by taking all ((L-1))-subsets of (Y). Fix (0<\alpha<1), let (t=\lfloor \alpha h\rfloor), (N=|Y|=h+L-2), and (k=L-1). There exists a family

[
\mathcal F\subseteq \binom{Y}{k}
]

such that every (t)-subset of (Y) misses at least one member of (\mathcal F), and

[
|\mathcal F|
\le
\left\lceil
\frac{\log \binom{N}{t}+1}
{\binom{N-t}{k}/\binom{N}{k}}
\right\rceil.
]

This follows by sampling (m) random (k)-sets. For a fixed (t)-set (T), the probability that a sampled (k)-set is disjoint from (T) is

[
p=\frac{\binom{N-t}{k}}{\binom{N}{k}}.
]

If (m\ge(\log\binom Nt+1)/p), the union bound gives positive probability that every (T) is missed by some sampled edge. With (L\sim h/\log h), this gives

[
|\mathcal F|\le \exp(O_\alpha(L)).
]

Now set

[
\mathcal C=\bigl{{x}\cup A:A\in\mathcal F\bigr},
\qquad
\mathcal D={{x}}.
]

Every legal relative blocker avoiding (x) must hit all members of (\mathcal F), so it has size at least (t+1). Therefore

[
\pi(C':C'\cap Q=\varnothing)
\le
\frac{\binom{K-t-1}{L}}{\binom{K}{L}}
\le
\exp(-c_\alpha L)
\le
\exp(-h^{1/2})
]

for all sufficiently large (h). Thus even in the (s=\exp(O(L))) regime, a single forbidden prior blocker can force the separator capture down to exponentially small in (L).

The missing ingredient is therefore not another scalar packet-transversal lemma. The theorem would need a **core-deletion rank-jump control** or a genuinely residual potential. In this example,

[
\tau(\mathcal C)=1,
]

because ({x}) blocks everything, but after the legal prior claim ({x}), the relative blocker rank jumps to

[
\tau_{\mathcal D}(\mathcal C)=h.
]

Blocker duality still holds perfectly; the problem is that the legal relative blocker family after deleting a claimed core can become atomized. Any successful version of the paradigm has to amortize the Prolonger saturation of this forbidden-core star, or measure separator gain only against an invariant that already credits the mass closed by (\mathcal D).

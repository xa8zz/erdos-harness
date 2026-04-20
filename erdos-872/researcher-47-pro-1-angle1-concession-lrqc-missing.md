The precise concession is this:

**The activator-quotient angle is not closed by the stated ingredients alone.** The missing ingredient is a genuinely new legal-response Carleson estimate. Strong freshness, local usefulness, and the (\sigma^\star) smallest-legal-prime dynamic do not by themselves force either the quotient state inequality or the (Q_h) budget.

Here is the exact lemma that would close the angle.

Let (T_h) be the set of Prolonger turns at which a rank-(h) facet (F_t) first-hits at least one strongly fresh locally useful exceptional shield. Put

[
Q_h=\sum_{t\in T_h} w(F_t).
]

Let

[
\mathcal C_t
============

\operatorname{Cl}*h(\mathcal S_t(F_t))
\setminus
\bigcup*{s<t}\operatorname{Cl}_h(\mathcal S_s(F_s))
]

be the disjointified rank-(h) closure mass first charged to (F_t). Let (p_t) be Shortener’s (\sigma^\star)-move immediately after (F_t), and let

[
u_t=\mu_t{G\in \Omega_h: p_t\mid G}
]

be the rank-(h) mass newly removed by that legal Shortener claim.

The needed missing lemma is:

**Legal-Response Quotient Carleson Lemma.** For central ranks (h\sim H=\log\log n), along every legal play against (\sigma^\star),

[
\sum_{t\in T_h}\mu(\mathcal C_t)
\le
C_1\frac{h}{\log h}\sum_{t\in T_h}w(F_t)
+
C_2\frac{H^2}{\log n}\sum_{t\in T_h}u_t,
\tag{LRQC-1}
]

and

[
\sum_{t\in T_h} w(F_t)
\le
C_3\frac{H^2\log h}{h\log n}\sum_{t\in T_h}u_t.
\tag{LRQC-2}
]

This is not cosmetic. It is exactly the missing bridge between quotient activators and the one dynamic budget that is already known.

Indeed, by the established online harmonic domination,

[
\sum_t u_t\le N_h.
]

Then LRQC-1 gives

[
\mu(\operatorname{Cl}_h)
\le
C_1\frac{h}{\log h}Q_h
+
C_2 N_h\frac{H^2}{\log n},
]

which is the desired activator-quotient state inequality. LRQC-2 gives

[
Q_h
\le
C_3 N_h\frac{H^2\log h}{h\log n},
]

which is the desired (Q_h) budget. So proving LRQC closes the angle immediately.

The reason this lemma is genuinely missing is that the quotient does not, by itself, collapse sparse star fibres. Here is the clean obstruction.

Fix (h\ge 4) and (M\ge 1). Let

[
C={c_1,\dots,c_{h-2}},
\qquad
F=C\cup{a,b},
]

and let

[
G_j=C\cup{x_j,y_j},
\qquad 1\le j\le M.
]

Think of (D=C) as a defect-two shield. The activator (F) first-hits (D). The local closure of (D) contains (G_1,\dots,G_M). In a narrow prime packet, all these facets have comparable harmonic weight, so

[
\mu(\operatorname{Cl}_h(D))\asymp M,w(F).
]

Thus, for (M\gg h/\log h), the quotient contribution (w(F)) is far too small to control the closure mass locally.

The (\sigma^\star)-move can be made fully legal. Burn in all primes below the packet using Prolonger moves at primes (>n/2). Then choose (F) so that after it is played, all primes of (F) are illegal because they divide (F), while (x_1) is the smallest remaining legal prime. Shortener’s forced move is (x_1), and (x_1\nmid F). So this avoids the invalid move pattern where Shortener claims a core divisor of the activator.

Locally, the claim (x_1) removes only (G_1). The first legal (\sigma^\star)-touch captures (O(w(F))) of the displayed closure, while the closure itself has mass (\asymp M w(F)). This is the matching-star sparse-support obstruction in quotient form.

A minimal incidence verifier is:

```python
def local_matching_star(h=6, M=10):
    core = [f"c{i}" for i in range(1, h-1)]  # h-2 core vertices
    F = tuple(core + ["a", "b"])
    facets = [F] + [tuple(core + [f"x{j}", f"y{j}"]) for j in range(1, M+1)]

    played = {F}
    illegal_primes = set(F)
    vertices = set().union(*map(set, facets))
    legal_primes = sorted(vertices - illegal_primes)

    degrees = {
        p: sum(p in G for G in facets if G not in played)
        for p in legal_primes
    }

    maxdeg = max(degrees.values())
    sigma = min(p for p, d in degrees.items() if d == maxdeg)

    assert sigma not in illegal_primes          # Shortener move is legal
    assert degrees[sigma] == 1                 # touches one local facet
    assert len(facets) - 1 == M                # closure size
    return sigma, degrees[sigma], M
```

The arithmetic embedding is also straightforward locally. Choose a packet

[
I=[P,(1+\eta)P],
\qquad \eta<\frac{\log 2}{2h}.
]

Then every (h)-fold squarefree product from (I) lies in an interval of multiplicative width (<2), so after setting (n) to the top of that interval, all these facets lie in (U=(n/2,n]). For central (h\sim \log\log n), the packet contains (\gg P/(h\log P)) primes, so (M\to\infty) is available. The burn-in is legal because the number of primes below (I) is (o(n/\log n)), while there are (\gg n/\log n) primes above (n/2) available for Prolonger’s burn-in moves.

This does **not** by itself refute the proposed asymptotic inequality, because a single packet-star can be swallowed by the global residual term

[
N_h\frac{H^2}{\log n}.
]

To refute the angle one would need to tile such sparse stars through central rank so that their total closure mass exceeds the residual while (Q_h) and the legal response masses remain too small. The stated facts do not provide such a tiling, but they also do not rule it out. That is exactly the gap.

So the sharp status of this angle is:

[
\boxed{
\text{The activator quotient is not enough without LRQC.}
}
]

The missing step must simultaneously do three things:

1. **Burst-star collapse:** prove that all closure mass beyond ((h/\log h)w(F)) is chargeable to legal Shortener response mass (u_t), not merely to the activator (F).

2. **Activator packing:** prove that every first-hit activator has enough future legal-response mass behind it to give

[
Q_h
\ll
\frac{H^2\log h}{h\log n}\sum_t u_t.
]

3. **Sparse matching-star control:** handle low-density matching supports where dense projection and collision tails see nothing, but where one activator still opens a large closure fibre.

Without precisely such a legal-response Carleson inequality, the current toolkit leaves the activator-quotient state inequality unproved and unrefuted.

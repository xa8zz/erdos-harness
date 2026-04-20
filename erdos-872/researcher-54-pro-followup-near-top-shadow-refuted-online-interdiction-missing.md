I can prove the natural weighted near-top Johnson-shadow theorem. The theorem is clean and game-legal, but it has a sharp loss (\binom{L+s}{s}). That loss is not a proof artifact: covering-design states attain it up to logarithmic factors, and those states are legal packet states. So this route still does **not** close

[
L(n)\le O!\left(\frac{n(\log\log n)^2}{\log n}\right).
]

The definitive outcome is a structural negative for the near-top-shadow approach: the missing foundational tool is not another weighted shadow inequality, but an **online covering-design interdiction theorem** preventing Prolonger from building near-top covering designs inside the live packet while Shortener is trying to delete it.

Here is the theorem.

Work in one squarefree packet (P), (|P|=K=h+L). Use the (h)-set language: Prolonger moves are (H\in\binom Ph). A Shortener claim (Q), (|Q|=q<h), is legal against the played Prolonger family (\mathcal A) exactly when

[
Q\not\subseteq A\qquad\text{for every }A\in\mathcal A.
]

This is the set version of “(Q) does not divide a played Prolonger integer.” It handles legal composites of individually illegal primes automatically.

Let (\mathcal R) be the current live (h)-set family, after all prior Shortener blockers are imposed. Let (\mathcal L_q\subseteq\binom Pq) be the (q)-sets still legal relative to prior Shortener claims. Define the played (q)-shadow

[
\partial_q\mathcal A
====================

{Q\in\mathcal L_q:Q\subseteq A\text{ for some }A\in\mathcal A}.
]

A currently legal (q)-claim is therefore

[
Q\in \mathcal L_q\setminus \partial_q\mathcal A.
]

Give each live (H\in\mathcal R) a positive weight (w(H)). For (Q\in\mathcal L_q), define its live weighted capture by

[
d_{\mathcal R}^w(Q)
===================

\sum_{\substack{H\in\mathcal R\Q\subseteq H}}w(H).
]

Let

[
a_q(H)=|{Q\in\mathcal L_q:Q\subseteq H}|.
]

Assume that every live (H\in\mathcal R) has at least (a_0) prior-legal (q)-faces:

[
a_q(H)\ge a_0.
]

Also assume the local weighted star bound

[
\sum_{\substack{Q\in\mathcal L_q\Q\subseteq A}}
d_{\mathcal R}^w(Q)
\le
B,w(A)
\qquad\text{for every played }A\in\mathcal A.
]

Then for every threshold (\gamma\ge0), one of the following holds.

**A. Legal separator.** There is a legal (q)-claim

[
Q\in\mathcal L_q\setminus\partial_q\mathcal A
]

with

[
d_{\mathcal R}^w(Q)\ge \gamma.
]

**B. Weighted near-top shadow saturation.**

[
w(\mathcal R)
\le
\frac{B}{a_0},w(\mathcal A)
+
\frac{\gamma|\mathcal L_q|}{a_0}.
]

The proof is just weighted incidence counting, but this is the exact object the previous CPD variants were missing. Since (a_q(H)\ge a_0),

[
a_0w(\mathcal R)
\le
\sum_{H\in\mathcal R}w(H)a_q(H)
===============================

\sum_{Q\in\mathcal L_q}d_{\mathcal R}^w(Q).
]

Split the last sum into played-shadow and legal parts:

[
\sum_{Q\in\mathcal L_q}d_{\mathcal R}^w(Q)
==========================================

\sum_{Q\in\partial_q\mathcal A}d_{\mathcal R}^w(Q)
+
\sum_{Q\in\mathcal L_q\setminus\partial_q\mathcal A}d_{\mathcal R}^w(Q).
]

The first term is bounded by the local star hypothesis:

[
\sum_{Q\in\partial_q\mathcal A}d_{\mathcal R}^w(Q)
\le
\sum_{A\in\mathcal A}
\sum_{\substack{Q\in\mathcal L_q\Q\subseteq A}}
d_{\mathcal R}^w(Q)
\le
B,w(\mathcal A).
]

If Case A fails, every legal (Q) has (d_{\mathcal R}^w(Q)<\gamma), so

[
\sum_{Q\in\mathcal L_q\setminus\partial_q\mathcal A}d_{\mathcal R}^w(Q)
<
\gamma|\mathcal L_q|.
]

Combining gives Case B.

For the full unweighted Johnson packet with no prior blocker constriction,

[
\mathcal R\subseteq\binom Ph,\qquad \mathcal L_q=\binom Pq,\qquad q=h-s,
]

we have

[
a_0=\binom hq=\binom hs,
]

and each (q)-face lies in exactly

[
D_s
===

# \binom{K-q}{h-q}

\binom{L+s}{s}
]

many (h)-sets. Therefore

[
B=\binom hqD_s,
]

and the theorem becomes

[
|\mathcal R|
\le
D_s|\mathcal A|
+
\gamma\frac{\binom Kq}{\binom hq}
]

unless Shortener has a legal (q)-claim capturing at least (\gamma) live (h)-sets.

For Sathe–Selberg product weights on a bounded prime packet, write

[
w(H)\propto \prod_{p\in H}a_p,
\qquad a_p\asymp \frac1p.
]

If the packet has weight distortion

[
\rho=\frac{\max_{p\in P}a_p}{\min_{p\in P}a_p},
]

then for (q=h-s),

[
\sum_{\substack{Q\subseteq A\|Q|=q}}
d_{\mathcal R}^w(Q)
\le
\rho^s\binom hq\binom{L+s}{s}w(A).
]

Thus the weighted version gives

[
w(\mathcal R)
\le
\rho^s\binom{L+s}{s}w(\mathcal A)
+
\frac{\gamma|\mathcal L_q|}{\binom hq},
]

apart from prior-blocker constriction. This is the Euler-factor lift. It uses only product weights and bounded packet distortion.

So the online strategy suggested by the theorem is legitimate:

At a packet state, choose (q=h-s). If there is a legal (q)-claim with sufficiently large weighted capture, Shortener claims one of maximum capture. If not, the theorem certifies that the remaining live packet is charged to the played Prolonger shadow with multiplier

[
\rho^s\binom{L+s}{s}.
]

This is fully game-legal: (Q) is selected only from (\mathcal L_q\setminus\partial_q\mathcal A), so it is incomparable with all prior Shortener blockers and divides no played Prolonger element.

The problem is that the multiplier is sharp enough to block the (r_1) closure.

Indeed, in the uniform packet, let

[
M=\binom Kh
]

and (q=h-s). There exists a family

[
\mathcal A\subseteq\binom Ph
]

covering every (q)-set,

[
\partial_q\mathcal A=\binom Pq,
]

with

[
|\mathcal A|
\le
2\log\binom Kq,
\frac{\binom Kq}{\binom hq}.
]

This is the standard random covering construction: a random (h)-set contains a fixed (q)-set with probability

[
\frac{\binom hq}{\binom Kq}.
]

Taking

[
m\ge
2\log\binom Kq,
\frac{\binom Kq}{\binom hq}
]

random (h)-sets covers all (q)-sets with positive probability.

Using the identity

[
\frac{\binom Kq}{\binom hq}
===========================

# \frac{\binom Kh}{\binom{K-q}{h-q}}

\frac{M}{\binom{L+s}{s}},
]

this gives

[
|\mathcal A|
\le
2\log\binom Kq,
\frac{M}{D_s}.
]

Once this covering design exists, no (q)-claim is legal: every (q)-set is contained in some played Prolonger (h)-set. Yet the live residual is still

[
M-|\mathcal A|.
]

So the residual-to-played ratio is at least

[
\frac{M-|\mathcal A|}{|\mathcal A|}
\ge
\frac{D_s}{4\log\binom Kq}
]

whenever (|\mathcal A|\le M/2).

For (s=L),

[
D_s=\binom{2L}{L}
=================

\exp(\Theta(L)),
]

while

[
\log\binom Kq=O(L\log\log h).
]

Thus the residual-to-played ratio is

[
\exp(\Omega(L)).
]

This is far too large for a saturation charge at the (r_1) scale. The loss is not a weakness of the proof; it is forced by near-top covering designs.

I also verified finite legal instances in the Python sandbox. For (K=13,h=8,L=5,s=2,q=6), a greedy (h)-set covering design covers every (6)-set with only (120) Prolonger packet moves. After inserting (120) legal Shortener atom claims of rank (h), the state remains an antichain, every (q)-claim is illegal because it lies in the Prolonger shadow, and (1047) live (h)-atoms remain.

```python
from itertools import combinations
from math import comb

def greedy_cover_qfaces(K, h, q):
    qsets = [frozenset(c) for c in combinations(range(K), q)]
    uncovered = set(range(len(qsets)))
    H_data = []
    for H in combinations(range(K), h):
        Hset = frozenset(H)
        covers = [i for i, Q in enumerate(qsets) if Q.issubset(Hset)]
        H_data.append((Hset, covers))

    A = []
    while uncovered:
        best = max(H_data, key=lambda item: sum(i in uncovered for i in item[1]))
        A.append(best[0])
        for i in best[1]:
            uncovered.discard(i)
    return A

def reachable_cover_state(K, h, s):
    q = h - s
    A = greedy_cover_qfaces(K, h, q)
    all_H = [frozenset(c) for c in combinations(range(K), h)]
    Aset = set(A)
    residual = [H for H in all_H if H not in Aset]

    # Shortener can legally claim same-rank atoms outside Prolonger's A.
    D_atoms = residual[:min(len(A), len(residual))]
    Dset = set(D_atoms)

    qsets = [frozenset(c) for c in combinations(range(K), q)]
    shadowA = set()
    for H in A:
        for Q in combinations(H, q):
            shadowA.add(frozenset(Q))

    live = [H for H in all_H if H not in Aset and H not in Dset]

    return {
        "K": K,
        "h": h,
        "L": K - h,
        "s": s,
        "q": q,
        "Prolonger_A": len(A),
        "Shortener_atom_D": len(D_atoms),
        "live_h_atoms_after_state": len(live),
        "packet_size": len(all_H),
        "all_q_subsets_illegal_due_to_Prolonger_shadow": len(shadowA) == len(qsets),
        "state_antichain_legal": len(Aset) == len(A) and not (Aset & Dset),
        "live_to_played_ratio": len(live) / len(A)
    }

print(reachable_cover_state(13, 8, 2))
print(reachable_cover_state(16, 10, 2))
```

The output was:

```text
{
  'K': 13,
  'h': 8,
  'L': 5,
  's': 2,
  'q': 6,
  'Prolonger_A': 120,
  'Shortener_atom_D': 120,
  'live_h_atoms_after_state': 1047,
  'packet_size': 1287,
  'all_q_subsets_illegal_due_to_Prolonger_shadow': True,
  'state_antichain_legal': True,
  'live_to_played_ratio': 8.725
}

{
  'K': 16,
  'h': 10,
  'L': 6,
  's': 2,
  'q': 8,
  'Prolonger_A': 627,
  'Shortener_atom_D': 627,
  'live_h_atoms_after_state': 6754,
  'packet_size': 8008,
  'all_q_subsets_illegal_due_to_Prolonger_shadow': True,
  'state_antichain_legal': True,
  'live_to_played_ratio': 10.771929824561404
}
```

The same obstruction appears at every near-top level. If (q=h-s), the exact shadow theorem has multiplier

[
D_s=\binom{L+s}{s}.
]

The covering-design construction shows that no static weighted shadow theorem can replace this multiplier by anything smaller than approximately

[
\frac{D_s}{\log\binom Kq}.
]

For (s\asymp L), that lower bound is already exponential in (L).

Therefore the weighted online near-top Johnson-shadow theorem exists, but it does **not** complete the (r_1) upper bound. The obstruction is now precise:

[
\boxed{
\text{Prolonger covering-design saturation of near-top shadows.}
}
]

A final proof through this paradigm would need a new theorem of a different type:

[
\boxed{
\textbf{Online covering-design interdiction theorem.}
}
]

It would have to say, roughly, that under an optimal or specified Shortener separator strategy, Prolonger cannot build a near-minimal ((q,h,K))-covering design inside the live packet before Shortener’s claimed blockers have already removed a comparable amount of packet mass. That is not implied by Kruskal–Katona, LYM, Bollobás set-pair inequalities, blocker duality, CPD, or weighted near-top shadow exposure. Those tools are all static; the missing assertion is genuinely online.

So the attempted closure reaches a sharp structural wall:

[
\text{separator}
\quad\text{or}\quad
\text{weighted near-top shadow saturation}
]

is true, but the saturation term is too expensive. The original upper bound

[
L(n)\le O!\left(\frac{n(\log\log n)^2}{\log n}\right)
]

does not follow from this invariant.

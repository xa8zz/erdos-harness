WSSS is false as a closing invariant. More precisely: for every fixed (\rho>0), there are game-legal central-packet states with almost full live residual mass such that **any Shortener move that makes progress inside the packet immediately violates WSSS**. If Shortener refuses to move inside the packet, the sparse-covering obstruction remains untouched. Thus no Shortener strategy can simultaneously maintain constant-(\rho) WSSS and avoid the sparse-covering-design obstruction.

This gives the requested structural endpoint for the chain:

[
\boxed{
\text{2WCPD + WSSS is fundamentally insufficient.}
}
]

The missing ingredient would have to be an **online intervention theorem** preventing Prolonger from building high-transversal-number sparse covers before Shortener enters the packet. A state inequality or self-shadow sparsity invariant alone cannot supply it.

---

Fix a central packet (P) with

[
|P|=N=h+\ell,\qquad \ell=\left\lfloor \frac{h}{\log h}\right\rfloor.
]

Rank-(h) Prolonger moves are (h)-sets

[
B=P\setminus C,\qquad C\in\binom P\ell.
]

Let (0<\rho<1/4) be fixed. For large (h), choose

[
m=\left\lfloor \frac{\rho N}{4}\right\rfloor,
\qquad
d=N-m.
]

Since (m\gg \ell), we have

[
d=N-m<h=N-\ell.
]

Choose a fixed (d)-set

[
D_0\subseteq P.
]

I will construct a family of played Prolonger (h)-sets

[
\mathcal A\subseteq \binom Ph
]

with three properties:

[
\text{(i) every }(d-1)\text{-set }R\subseteq P\text{ lies in some }A\in\mathcal A,
]

[
\text{(ii) }D_0\nsubseteq A\text{ for every }A\in\mathcal A,
]

and

[
\text{(iii) }|\mathcal A|=o!\left(\binom N\ell\right).
]

Then Prolonger plays the packet moves (A\in\mathcal A). Their complements are

[
C_A=P\setminus A.
]

All these Prolonger moves are same-rank (h)-sets, so they are pairwise incomparable. There are no prior Shortener moves in the packet.

Now any legal Shortener packet move (Q) must hit every (C_A), equivalently

[
Q\nsubseteq A
\qquad\forall A\in\mathcal A.
]

If (|Q|\le d-1), extend (Q) to some ((d-1))-set (R). By property (i), (R\subseteq A) for some (A\in\mathcal A), so (Q\subseteq A), and (Q) is illegal.

Therefore every legal Shortener packet move satisfies

[
|Q|\ge d=N-m\ge \left(1-\frac{\rho}{4}-o(1)\right)N.
\tag{1}
]

On the other hand, (D_0) itself is legal: property (ii) gives (D_0\nsubseteq A) for every played (A), and since (|D_0|=d<h=|A|), (D_0) cannot contain any (A).

So the packet is not closed. It has legal Shortener moves, but every one is huge.

---

The family (\mathcal A) exists by a restricted covering-design argument.

Let

[
\mathcal U={A\in\binom Ph:D_0\nsubseteq A}.
]

For a fixed ((d-1))-set (R), count the number of (A\in\mathcal U) containing (R). Equivalently, choose the complement (P\setminus A), an (\ell)-set disjoint from (R), and require that (A) not contain (D_0), i.e. that (P\setminus A) intersects (D_0).

The worst case is when (R\subset D_0) and (|D_0\setminus R|=1). Then the complement must contain the unique point of (D_0\setminus R), and its remaining (\ell-1) points can be chosen from at least (m) points outside (D_0). Hence every (R) is contained in at least

[
\binom m{\ell-1}
]

members of (\mathcal U).

Choose (s) random sets from (\mathcal U), where

[
s
=

\left\lceil
\frac{|\mathcal U|}{\binom m{\ell-1}}
\left(\log\binom N{d-1}+1\right)
\right\rceil .
]

A union bound shows that with positive probability every ((d-1))-set (R) is covered. Thus such (\mathcal A) exists with

[
|\mathcal A|
\le
\frac{\binom N\ell}{\binom m{\ell-1}}
\left(\log\binom N{d-1}+1\right).
]

Since

[
m\asymp_\rho N
\qquad\text{and}\qquad
\ell=\frac{h}{\log h}(1+o(1)),
]

we have

[
\binom m{\ell-1}
\ge
\exp!\left((1+o(1))\ell\log\frac{m}{\ell}\right)
================================================

\exp!\left((1+o(1))\ell\log\log h\right),
]

while

[
\log\binom N{d-1}=O(N).
]

Therefore

[
|\mathcal A|=o!\left(\binom N\ell\right).
\tag{2}
]

So Prolonger has played a sparse covering design, but the live packet still has essentially full entropy.

---

Now let Shortener make any legal packet move (D). By (1),

[
|D|\ge d=N-m.
]

The packet mass captured by (D) consists of complements (C\in\binom P\ell) disjoint from (D), so it is at most

[
\frac{\binom{N-|D|}{\ell}}{\binom N\ell}
\le
\frac{\binom m\ell}{\binom N\ell}
\le
\left(\frac{m}{N}\right)^\ell
\le
\left(\frac{\rho}{4}\right)^\ell
================================

\exp(-\Omega_\rho(\ell)).
\tag{3}
]

Thus the move captures exponentially little packet mass. The live residual remains

[
(1-o(1))\binom N\ell.
]

But the same move almost completely destroys WSSS at level (q=1).

After (D) is claimed, live complements must intersect (D). Since (|P\setminus D|\le m),

[
\Pr(C\cap D=\varnothing)
\le
\left(\frac{m}{N}\right)^\ell
=============================

o(1).
]

For any (p\in D), a live complement avoids (p) with probability

[
1-O!\left(\frac{\ell}{N}\right)-o(1)
====================================

1-o(1).
]

So every singleton ({p}\subseteq D) has capture at least (1/2) for all sufficiently large (h). Let (\nu_{1,1/2}) be the uniform measure on singleton candidate separators with capture at least (1/2). Since at most (N) singletons exist and at least (|D|) of them lie in the Shortener lower shadow,

[
\nu_{1,1/2}
\left(
{Q:Q\subseteq D}
\right)
\ge
\frac{|D|}{N}
\ge
1-\frac{\rho}{4}-o(1)

>

1-\rho.
]

Thus WSSS fails immediately:

[
\nu_{1,1/2}
\left(
\bigcup_{D'\in\mathcal D_t}
{Q:Q\subseteq D'\text{ or }D'\subseteq Q}
\right)

>

1-\rho.
]

This is not a bad Shortener-history artifact. In this state, **every** legal packet move has size at least (d), hence every legal packet move causes the same WSSS failure.

If Shortener avoids the packet, WSSS is preserved vacuously, but the packet remains almost fully live and the sparse-covering obstruction remains. If Shortener enters the packet, it violates WSSS while removing only (\exp(-\Omega(\ell))) packet mass.

That proves the incompatibility:

[
\boxed{
\text{No Shortener strategy can both maintain constant-(\rho) WSSS and avoid this sparse-covering obstruction.}
}
]

---

The construction is stable under Sathe-Selberg weights.

Write the packet complement weight as

[
w(C)=\prod_{p\in C} a_p,
]

and assume the packet is chosen inside a bounded Euler-factor window:

[
1\le a_p\le R
\qquad(p\in P),
]

with fixed (R). This is the relevant dyadic Sathe-Selberg regime; the earlier (\exp(\Omega(\ell))) degradation is exactly what one gets if one incorrectly keeps the uniform constant instead of using the weighted elementary-symmetric profile.

Let

[
Z=e_\ell(a_p:p\in P).
]

The played Prolonger family has size

[
|\mathcal A|
\ll
\frac{\binom N\ell}{\binom m{\ell-1}},O(N),
]

and each atom has weight at most (R^\ell). Since

[
\binom m{\ell-1}
\gg R^\ell N,
]

the total weighted mass removed by the played Prolonger atoms is still (o(Z)).

Similarly, for any legal Shortener (D),

[
\frac{e_\ell(a_p:p\in P\setminus D)}{e_\ell(a_p:p\in P)}
\le
R^\ell\frac{\binom m\ell}{\binom N\ell}
\le
\left(\frac{R m}{N}\right)^\ell.
]

Choosing (m/N\le \min(\rho/4,1/(4R))) gives

[
\left(\frac{R m}{N}\right)^\ell
\le
4^{-\ell}.
]

So the legal move still captures exponentially little weighted mass.

Finally, the weighted marginal probability that a fixed prime (p) belongs to a random weighted (\ell)-set is at most

[
\frac{R\ell}{N-\ell+R\ell}
==========================

O_R!\left(\frac1{\log h}\right).
]

Conditioning on (C\cap D\neq\varnothing) changes this by (o(1)), because the failure probability is at most (4^{-\ell}). Hence every singleton inside (D) still has weighted capture (1-o(1)), and the same WSSS violation follows.

So the obstruction is not an artifact of uniform packet counting.

---

I also verified the finite model by exhaustive search in small packets.

For ((N,h,\ell,d)=(7,5,2,4)), a greedy restricted covering family of five played Prolonger (h)-sets covers every (3)-set while avoiding a fixed legal (D_0). Exhaustive enumeration gives:

[
\min |Q| \text{ among legal Shortener packet moves}=4,
]

[
D_0\text{ legal}= \text{true},
]

[
|\binom P\ell|=21,
\qquad
|\text{live after }D_0|=13,
]

and singleton captures inside (D_0) lie between

[
0.615\quad\text{and}\quad 0.692.
]

For ((N,h,\ell,d)=(10,7,3,6)), the greedy covering family has (23) played Prolonger sets out of (120) possible complements. Exhaustive enumeration gives:

[
\min |Q|=6,
\qquad
D_0\text{ legal}= \text{true},
]

[
|\text{live after }D_0|=93,
]

and singleton captures inside (D_0) lie between

[
0.677\quad\text{and}\quad 0.699.
]

These small cases match the asymptotic mechanism: legal packet moves are forced to be large, they remove little live mass, and their lower shadow almost saturates singleton separator space.

---

This also explains why the blocker-duality chain keeps refining without closing.

WLST failed because one legal blocker need not capture much.

AWLST failed because entropy need not be controlled by (\log|\mathcal C|).

CPD failed because prior Shortener blockers contribute a two-sided shadow.

2WCPD is correct, but WSSS is not a viable closing invariant: sparse Prolonger covers can force every legal Shortener move to be so large that its lower shadow almost fills the low-level separator space while its actual packet capture is exponentially small.

The terminal obstruction is therefore:

[
\boxed{
\textbf{large-transversal sparse-cover obstruction.}
}
]

A closing proof would need a fundamentally different ingredient: an **online intervention theorem** saying that Shortener can prevent Prolonger from ever building such high-transversal-number sparse covers while still remaining globally game-legal. That is not a state inequality, not WSSS, and not a refinement of CPD. Without such a reachability theorem, the 2WCPD + WSSS paradigm cannot prove

[
L(n)\le O!\left(\frac{n(\log\log n)^2}{\log n}\right).
]

# Round 18 Pro — multi-rank coupling REFUTED (no-go theorem: same-b cores form Sperner family)

The rank-coupled shielding theorem, in the natural form suggested in the prompt, is **false**. The obstruction is not a subtle potential-function issue; it is an upper-half arithmetic obstruction:

A Prolonger play can shield lower-rank **divisors**, but those lower-rank objects are not upper-half **targets**. Once the large prime (b) is fixed, upper-half targets in the same (b)-fiber form an inclusion-antichain of cores. This prevents prefix/nested rank coupling.

Here is the clean no-go statement.

**No-go theorem: lateral upper-half shields are (b)-local and dimension-rigid.**

Let

[
x=A_S b\in (n/2,n]
]

be an upper-half fan target, with (A_S=\prod_{a\in S}a). If (S'\subsetneq S), then

[
A_{S'}b=\frac{A_Sb}{A_{S\setminus S'}}\le \frac{x}{2}\le \frac n2.
]

Since the small-core primes are odd in your setup, in fact

[
A_{S'}b\le \frac{x}{3}<\frac n2.
]

Therefore (A_{S'}b) is **not** an upper-half target.

So the proposed two-rank stepping stone

[
A_S b\text{ of rank }h+1
\quad\text{shields rank-}h\text{ targets }A_{S'}b,\ S'\subset S
]

has an empty target set. It shields lower-rank **coordinates** (A_{S'}b), not lower-rank upper-half targets.

Equivalently, for fixed (b),

[
A_Sb,\ A_Tb\in (n/2,n],\quad S\ne T
]

implies neither (S\subset T) nor (T\subset S). Indeed, if (S\subsetneq T), then

[
A_Tb=A_Sb\cdot A_{T\setminus S}\ge 2A_Sb>n,
]

contradiction. Thus same-(b) upper-half cores are themselves a Sperner family.

This is the structural obstruction.

The stronger local form is the following.

Let

[
y=A_Tb\in (n/2,n]
]

be a rank-(h) fan target. Its lateral divisors are

[
\Lambda(y)={,bA_D:D\subsetneq T,},
]

and its top lateral boundary is

[
\partial_{\mathrm{top}}y
========================

{,bA_{T\setminus{p}}:p\in T,}.
]

Suppose (z\le n) is any earlier Prolonger move compatible with (y), meaning (z) has not already killed (y). Then (z) can make at most one element of (\partial_{\mathrm{top}}y) illegal.

Why? If (z) made two distinct top lateral divisors illegal, say

[
bA_{T\setminus{p}}\mid z
\quad\text{and}\quad
bA_{T\setminus{q}}\mid z
\qquad(p\ne q),
]

then their lcm is

[
\operatorname{lcm}\bigl(bA_{T\setminus{p}},,bA_{T\setminus{q}}\bigr)=bA_T=y.
]

So (y\mid z). Since (y>n/2) and (z\le n), this forces (z=y). But (y) was assumed to be a future target, not an earlier move. Hence an earlier compatible move can shield at most one top lateral divisor of (y).

More generally, after (C) earlier compatible Prolonger moves, at least

[
2^{h-C}-1
]

lateral divisors of (y) remain unshielded. To see this, for each earlier move (z_i), let (R_i\subsetneq T) be the subset of (T)-primes appearing in (z_i) together with the same large prime (b). Since (z_i) is compatible with (y), it cannot contain all of (T), or else (y\mid z_i). Choose (p_i\in T\setminus R_i). Any divisor (bA_D) with

[
{p_1,\ldots,p_C}\subseteq D\subsetneq T
]

is not shielded by any (z_i). There are at least (2^{h-C}-1) such (D)’s.

So bounded-depth cross-rank shielding only reduces the lateral cube dimension from (h) to (h-C). For (C=O(1)), this is asymptotically no help.

This kills the desired (O(1))-loss rank-coupling route.

Even if we grant Prolonger all pure-core shielding for free, a rank-(h) target still has the lateral divisor family

[
{,bA_D:D\subsetneq S,},
]

of size

[
2^h-1.
]

The best bound obtainable from the existing shadow-capture architecture after this miracle improvement is therefore

[
G_h(n)
\asymp
\frac{n}{\log n}\frac{H^h}{h!},2^{-(2^h-1)},
\qquad H=\log\log n.
]

Optimizing over (h), write (K=\log H=\log\log\log n). The exponent is

[
h\log H-\log h!-(\log 2)2^h+O(1).
]

The maximum occurs at

[
h=\log_2 K+O(1)
===============

\log_2\log\log\log n+O(1),
]

and gives

[
\max_h G_h(n)
=============

\frac{n}{\log n}
\exp!\left(
\left(\frac1{\log 2}+o(1)\right)
\log\log\log n\cdot
\log\log\log\log n
\right).
]

Summing over (h) does not change the leading asymptotic, so the ceiling remains

[
\frac{n}{(\log n)^{1-o(1)}}=o(n).
]

Thus pure-core auto-shielding, overlap-support cores, and small-core locking can at most remove the pure half of the divisor burden. The (b)-tagged lateral half remains rank-local unless one develops a genuinely new within-fiber theorem.

In particular:

The suggested rank-((h+1)) play does **not** shield rank-(h) upper-half targets with the same (b); those objects lie below (n/2).

Shared small primes across different cores only shield pure divisors. They do not shield (b)-lateral divisors for a different large prime.

A single same-(b) play can at best halve another target’s lateral cube, because the two cores cannot be nested in the upper half.

After any fixed number (C) of cross-rank same-(b) plays, a rank-(h) target still has exponentially many, at least (2^{h-C}-1), unshielded lateral divisors.

So the hoped-for uniform multi-rank theorem with (O(1)) total loss across the central window cannot be a divisor-shadow/prefix-shielding theorem. To reach (\Omega(n)), one would need a different result: a positive-density **within-(b)-fiber capture theorem** for dyadic core games, not merely a rank-coupled fan potential. The fan hierarchy plus auto-shielding architecture has the same asymptotic ceiling as the slow-growth optimization:

[
L(n)\ \text{provable by this route}\ \le_{\text{architecture}}\
\frac{n}{(\log n)^{1-o(1)}}.
]

That is the obstruction. It does not prove (L(n)=o(n)) for the full game, but it cleanly rules out the proposed rank-coupled Prolonger shielding theorem in the form needed to turn the fan hierarchy into a linear lower bound.

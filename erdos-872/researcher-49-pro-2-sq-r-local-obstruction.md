I did not find a defensible proof of A, B, or C. The rigorous result I can stand behind is a named local obstruction with an exact decidability criterion. It does not determine (L(n)), but it gives a clean, checkable failure mode for a large class of attempted (r_1)-upper-bound and (r_2)-lower-bound arguments that simplify (\sigma^\star) to “take the smallest legal prime.”

**Core-star quotient gap.**
Fix a prime (r\ge 13), and fix another prime (q>r). Let

[
S_{q,r}:={qp:p<r,\ p\text{ prime}}.
]

Take (n\ge q\max{p:p<r}), so every element of (S_{q,r}) is in ({2,\dots,n}). Then:

1. (S_{q,r}) is an antichain.
2. Every prime (p<r) is illegal, because (p\mid qp\in S_{q,r}).
3. The prime (r) is legal and is the smallest legal prime.
4. The composite (6=2\cdot 3) is legal.
5. In the Sathe-Selberg limiting rank-(h) harmonic degree calculation, the legal composite (6) has strictly larger unresolved degree than the smallest legal prime (r).

Here is the exact calculation. For a fixed finite-prime state (S), define the limiting normalized unresolved degree of a squarefree candidate (x) by

[
D_S(x)
======

\Pr\bigl(P(x)\subseteq X,; P(F)\not\subseteq X\text{ for every }F\in S\bigr),
]

where (P(y)) is the set of prime divisors of (y), and the random set (X) has independent indicators

[
\Pr(p\in X)=\frac1{p+1},\qquad
\Pr(p\notin X)=\frac p{p+1}.
]

This is exactly the finite-state limiting computation supplied by the Sathe-Selberg Euler factors. Since (h\to\infty) on the central ranks, the reverse relation (m\mid x) is negligible for fixed (x); comparability with (x) is captured by (x\mid m).

For (S=S_{q,r}), the candidate (6) has

[
D_S(6)
======

# \Pr(2,3\in X,\ q\notin X)

# \frac{1}{3}\cdot \frac{1}{4}\cdot \frac{q}{q+1}

\frac{q}{12(q+1)}.
]

The smallest legal prime (r) has

[
D_S(r)
======

\frac{1}{r+1}
\left(
\frac{q}{q+1}
+
\frac{1}{q+1}\prod_{p<r}\frac{p}{p+1}
\right).
]

Let

[
\Pi_r:=\prod_{p<r}\frac{p}{p+1}.
]

Then

[
D_S(6)-D_S(r)
=============

\frac{q(r-11)-12\Pi_r}{12(q+1)(r+1)}.
]

Since (r\ge 13), (q>r), and (0<\Pi_r<1),

[
q(r-11)-12\Pi_r

>

q\cdot 2-12

>

0.

]

Therefore

[
D_S(6)>D_S(r).
]

So in this perfectly legal antichain state, the legal composite (6) beats the smallest legal prime (r) by a fixed positive Euler-factor margin. Thus (\sigma^\star), if it is maximizing unresolved harmonic degree, cannot be justified by a smallest-legal-prime rule outside the hypothesis that every legal composite has a legal prime factor.

For the concrete sandbox check I used (r=67), (q=101), so

[
S={101p:p<67,\ p\text{ prime}}.
]

The selected set has 18 elements, maximum (101\cdot 61=6161), and is an antichain. All primes below (67) are illegal, (67) is legal, and (6) is legal. Exact Fraction arithmetic gives

[
D_S(6)=\frac{101}{1224}\approx 0.0825163,
]

while

[
D_S(67)
=======

\frac{40429775367801309653}{2770524857367841996800}
\approx 0.0145928.
]

The gap is

[
D_S(6)-D_S(67)
\approx 0.0679235.
]

The Python verification used exact divisibility and exact rational arithmetic; no floating-point comparison was needed for the sign.

The resulting decidability criterion is this:

Given any finite squarefree state (S) and any finite candidate response set (C), compute

[
D_S(x)
======

\sum_{\substack{T\supseteq P(x)\ P(F)\not\subseteq T\ \forall F\in S}}
\prod_{p\in T}\frac1{p+1}
\prod_{p\notin T}\frac p{p+1},
\qquad x\in C,
]

over the finite prime universe

[
\bigcup_{F\in S}P(F)\cup \bigcup_{x\in C}P(x).
]

All values are rational. If the maximizer has a positive rational gap, the (\sigma^\star) decision is stable for all sufficiently large central ranks. Any proposed (r_2)-scale Prolonger construction, or (r_1)-scale Shortener proof, that relies on a local (\sigma^\star) response can therefore be checked at each finite activation state by this Euler-factor comparison.

What this does **not** prove: it is not a Prolonger lower bound of order (n/\log\log\log n), because the state (S_{q,r}) has not been shown to be forceably reachable against an adversarial Shortener. It is also not an upper bound. It is a rigorous local obstruction: any argument that replaces the legal (\sigma^\star) response by “the smallest legal prime” in cross-core states is false, and the failure is not lower-order—it has positive limiting harmonic mass.

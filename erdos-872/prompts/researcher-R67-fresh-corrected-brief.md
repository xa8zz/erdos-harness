Don't search the internet. This is a test to see how well you can craft non-trivial, novel and creative proofs given a "primitive sets and divisibility games" math problem. Provide a full unconditional proof or disproof of the problem.

# Primitive sets and divisibility games

## Problem

Let (n \geq 2). Two players alternately pick integers from

[
{2,3,\ldots,n}
]

to add to a common set (A), subject to the constraint that (A) remain primitive: no element of (A) divides another. The game ends when no legal move is possible. One player, “Prolonger,” wants the game to last as long as possible; the other, “Shortener,” wants it to end as quickly as possible. Prolonger moves first.

Let (L(n)) be the guaranteed game length under optimal play.

Determine (L(n)) asymptotically. In particular, decide whether

[
L(n)=\Theta(n)
]

or

[
L(n)=o(n),
]

and, if sublinear, give the sharp rate.

## Known progress

### Upper bound

[
L(n)\leq \left(\frac{W_4}{2}+o(1)\right)n,
\qquad
\frac{W_4}{2}\leq 0.1897123371.
]

Method: Shortener uses the prefix strategy (\sigma_{15}), playing the smallest legal odd prime while the strategy remains active. Let

[
p_1<p_2<\cdots<p_K
]

be the odd primes actually played by Shortener.

The odd-part reduction used in this argument is **not** the false assertion that odd parts of a primitive set form a primitive set. The correct intermediate fact is the following labelled odd-part comparison.

For (x\in{2,\ldots,n}), write

[
x=2^{\nu_2(x)}\omega(x),
]

where (\omega(x)) is odd. If (A) is primitive, then:

1. the map (x\mapsto \omega(x)) is injective on (A), since two numbers with the same odd part lie on the same dyadic chain and are comparable;

2. if (x,y\in A), (x\neq y), and (\omega(x)\mid \omega(y)), then necessarily

[
\nu_2(x)>\nu_2(y).
]

Equivalently, (A) maps to an antichain in the labelled odd-part poset

[
(u,a)\preceq (v,b)
\quad\Longleftrightarrow\quad
u\mid v\ \text{ and }\ a\leq b.
]

Thus (\omega(A)) may contain divisor chains, but those chains must be accompanied by strictly decreasing (2)-adic labels. For example, ({12,30}) is primitive, and its odd parts (3,15) satisfy (3\mid 15); this is allowed because

[
\nu_2(12)=2>\nu_2(30)=1.
]

The upper-bound proof applies the sieve and monotone comparison to the odd-part survivor set determined by Shortener’s played primes, not to (\omega(A)) as if it were an odd primitive set.

Given (P={p_1,\ldots,p_K}), define the odd survivor set

[
R(P)={m\leq n:\ m\ \text{odd and }p_i\nmid m\text{ for every }i}.
]

The labelled odd-part comparison gives the safe replacement principle: played numbers not equal to Shortener’s selected primes have odd parts lying in the appropriate survivor shadow, with the (2)-adic labels recording all remaining divisibility restrictions. The monotone replacement step then compares the actual sequence (p_1,p_2,\ldots) to a model bin sequence (b_1,b_2,\ldots) satisfying

[
\sup_j \frac{p_j}{b_j}=1+o(1).
]

The survivor terms are estimated by Bonferroni inclusion-exclusion. With

[
T_r(P)=\sum_{1\leq i_1<\cdots<i_r\leq K}
#{m\leq n:\ m\text{ odd and }p_{i_1}\cdots p_{i_r}\mid m},
]

one uses the fourth Bonferroni truncation, with the parity appropriate to survivor counts:

[
|R(P)|\leq T_0-T_1+T_2-T_3+T_4.
]

The factorial-moment transfer sends the normalized (T_r)’s to the simplex integrals

[
J_r
===

\frac1{r!}
\int_{\Delta_r}
\prod_{i=1}^r \frac{du_i}{1+u_i},
\qquad
\Delta_r={u_i\geq 0:\ u_1+\cdots+u_r\leq 1}.
]

Optimising the fourth-order truncation gives the constant (W_4/2).

### Lower bound: best constant in the (n\log\log n/\log n) scale

[
L(n)\geq
\left(\frac12-o(1)\right)
\frac{n\log\log n}{\log n}.
]

Method: dyadic refinement of fan-capture.

For fixed (H), Prolonger first runs an activation phase that (H)-secures the small odd primes: for each relevant small odd prime (p), every element

[
2^b p,\qquad 0\leq b\leq H,
]

is made illegal. Prolonger then applies a right-star capture argument to dyadic chains

[
C_{pq}={pq,2pq,4pq,\ldots}
]

with

[
\frac{n}{2^{H+1}}<pq\leq n.
]

This gives, for every fixed (H),

[
L(n)\geq
\left(
\frac12(1-2^{-H-1})-o_H(1)
\right)
\frac{n\log\log n}{\log n}.
]

Letting (H\to\infty) slowly yields

[
L(n)\geq
\left(\frac12-o(1)\right)
\frac{n\log\log n}{\log n}.
]

### Lower bound: best rate

[
L(n)\geq \frac{n}{(\log n)^{1-o(1)}}.
]

Method: divisor-shadow hierarchy.

For every fixed (h\geq 1), Prolonger can use an upper-half rank-(h) fan with two-layer fiber capture to obtain

[
L(n)\geq
c_h,
\frac{n(\log\log n)^h}{\log n}.
]

The constants have rapid decay, of the form

[
c_h\sim \frac{2^{-2^h}}{h!},
]

so the fixed-(h) hierarchy alone does not give a linear lower bound. Taking

[
h=\log_2(\log\log\log n)
]

slowly increasing with (n) gives

[
L(n)\geq \frac{n}{(\log n)^{1-o(1)}}.
]

### Numerical evidence

Exact minimax was recomputed for (n=2,\ldots,40) using the residual legal-mask recurrence. If (S) is the set of currently legal numbers and

[
N[x]={y\in{2,\ldots,n}: x\mid y\text{ or }y\mid x},
]

then

[
V_{\mathrm{Long}}(S)
====================

1+\max_{x\in S} V_{\mathrm{Short}}(S\setminus N[x]),
]

[
V_{\mathrm{Short}}(S)
=====================

1+\min_{x\in S} V_{\mathrm{Long}}(S\setminus N[x]),
]

with value (0) when (S=\varnothing). The initial value is

[
f(n)=V_{\mathrm{Long}}({2,\ldots,n}).
]

The corrected exact values for (n=2,\ldots,40) are

[
\begin{aligned}
&1,2,2,3,3,4,4,5,5,6,6,7,7,7,7,8,8,9,9,10,\
&10,11,11,11,11,11,12,13,13,14,14,14,14,15,15,16,16,16,16.
\end{aligned}
]

Thus

[
f(11)=6,
]

not (5).

The offsets (f(n)-\pi(n)) from the computed values are

[
f(n)-\pi(n)=0
\quad\text{for }2\leq n\leq 8,
]

[
f(n)-\pi(n)=1
\quad\text{for }9\leq n\leq 20,
]

[
f(n)-\pi(n)=2
\quad\text{for }21\leq n\leq 27,
]

[
f(n)-\pi(n)=3
\quad\text{for }28\leq n\leq 34,
]

and

[
f(n)-\pi(n)=4
\quad\text{for }35\leq n\leq 40.
]

For the exact range (2\leq n\leq 40), the normalized ratio

[
R(n)=\frac{f(n)\log n}{n}
]

lies in the band

[
0.3466\leq R(n)\leq 1.5615.
]

Restricting away from the very small initial cases:

[
1.1513\leq R(n)\leq 1.5615
\qquad (10\leq n\leq 40),
]

[
1.3427\leq R(n)\leq 1.5615
\qquad (20\leq n\leq 40),
]

and

[
1.4520\leq R(n)\leq 1.5615
\qquad (30\leq n\leq 40).
]

The trajectory is saw-toothed: it jumps when (f(n)) increases and then declines locally across stretches where (f(n)) is constant. Near the end of the computed range,

[
R(37)=1.5615,\quad
R(38)=1.5316,\quad
R(39)=1.5030,\quad
R(40)=1.4756.
]

This exact range is too short to distinguish a law of order

[
\frac{n}{\log n}
]

from one of order

[
\frac{n\log\log n}{\log n}.
]

In particular, throughout (10\leq n\leq 40), the factor (\log\log n) changes only from about (0.834) to about (1.305), while the prime-driven saw-tooth fluctuations in (f(n)\log n/n) are already of comparable size.

REMEMBER - this unconditional argument may require non-trivial, creative and novel elements.

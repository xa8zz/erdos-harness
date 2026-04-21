# Section 7 Repair — GPT Pro Return (verbatim)

Pro's response to the follow-up dispatch at
`erdos-872/prompts/researcher-section-7-repairs.md`. Covers all four
sub-problems (A) prime-rounding bridge matching, (B) cell-count for
shrinking boundary strips, (C) diagonalization with full parameter control,
and (D) interval-arithmetic certification of W_4/2 < 0.19.

Recorded verbatim for Codex to integrate into the paper.

---

Pro returned. We should have a prompt to vet this but assume it's true and get Codex working on updating our paper:

All four sub-steps can be closed. The clean repair is to replace the old “boundary reservoir Hall condition” with a queued coarse-bin matching. This avoids short-interval prime estimates entirely; only fixed-ratio PNT estimates are used.

(A) Prime-rounding bridge

Fix H≥2. Write the genuine envelope blocks as

A
h
	

:=n
α
h
	

,B
h
	

:=n
β
h
	

,1≤h≤H−1.

Let a>1 be fixed, later chosen with a
2
≤λ. For a fixed block [A
h
	

,B
h
	

], abbreviate A=A
h
	

, B=B
h
	

, and partition it into multiplicative bins

I
k
	

=[Aa
k
,Aa
k+1
),k=0,1,…,M,

where M is chosen so that the last bin may be truncated at B. Let

d
k
	

:=#{j:b
j
	

∈I
k
	

, j lies in the genuine h-block}.

Also let

f
h
	

:=#{j:b
j
	

=A
h
	

}

be the flat atom at the left endpoint of the block. This includes the bottom atom when h=H−1, and the gap atom between adjacent genuine blocks for smaller h.

For every fixed c>1, the envelope construction gives, uniformly for X≥n
1/H
 and [X,cX]⊆[A
h
	

,B
h
	

],

#{j:X≤b
j
	

<cX, j genuine in block h}≤(1+o
H
	

(1))
(h+1)logX
(c−1)X
	

.
(1)

This follows directly from the derivative of the envelope:

dY
d
	

A
n,h
	

(log
n
	

Y)=
(h+1)logY
1−ξ
H
	

(n)
	

(1−
logY
1
	

),

plus an O(1) endpoint error, negligible because Y≥n
1/H
.

Similarly,

f
h
	

≤(1+o
H
	

(1))
(h+1)logA
h
	

A
h
	

	

.
(2)

Let P
k
	

 denote the number of odd primes in the prime bin

[Aa
k
,Aa
k+1
).

By the PNT in fixed multiplicative intervals, uniformly for k in this block,

P
k
	

=(1+o
H,a
	

(1))
log(Aa
k
)
(a−1)Aa
k
	

.
(3)

Now choose a finite integer s=s(a) such that, for a small fixed η>0,

(1−η)(a
s+1
−1)>(1+η)
2
a
s
	

.
(4)

This is possible because the left side is asymptotic to a
s+1
, while the right side is asymptotic to a
s
/2.

Use the following queueing assignment in each genuine block.

The flat atom f
h
	

 is eligible for primes in bin 0. Genuine demand from I
k
	

 is released only at prime bin k+1, so every prime assigned to it is at least the upper endpoint Aa
k+1
 of its b-bin. Process prime bins in increasing order, always assigning available primes to the oldest unassigned demand.

By (1), (2), and (3), for all large n,

f
h
	

+
k=0
∑
s−1
	

d
k
	

≤(1+η)
(h+1)logA
a
s
A
	

≤(1+η)
2logA
a
s
A
	

,

while

ℓ=0
∑
s
	

P
ℓ
	

≥(1−η)
logA
(a
s+1
−1)A
	

.

By (4), the queue is empty after prime bin s. Thus the flat atom and the first s genuine bins can be assigned to primes in bins 0,…,s, with all assigned primes at least as large as the corresponding b
j
	

.

For every later full bin I
k
	

, k≥s, assign its d
k
	

 elements to primes in the next bin [Aa
k+1
,Aa
k+2
). This is possible because

d
k
	

≤(1+o)
(h+1)log(Aa
k
)
(a−1)Aa
k
	

<(1−o)
log(Aa
k+1
)
(a−1)Aa
k+1
	

≤P
k+1
	


for all sufficiently large n, since 1/(h+1)≤1/2<a. The final truncated source bin is handled the same way, using the next prime bin above the block.

For every nonexceptional index produced by this assignment,

b
j
	

≤p
j
	

≤a
2
b
j
	

≤λb
j
	

.
(5)

The exceptional indices are the flat atoms, the first s(a) genuine bins of each block, and the top flat block b
j
	

=n. Their reciprocal mass is negligible:

j∈E
∑
	

b
j
	

1
	

=O
H,a
	

(
logn
1
	

).
(6)

Indeed, each fixed multiplicative bin contributes O
H
	

(1/logn), there are only O
H,a
	

(1) exceptional bins, and the top flat block contributes

n
K
	

=O(
logn
1
	

).

The top flat block is assigned to odd primes in [n,2n], which contains (1+o)n/logn odd primes, more than enough for

K≤
2logn
n
	

.

Assignments from different genuine blocks do not overlap. The largest prime used for block h is at most a
2
B
h
	

, while the next larger block begins at

A
h−1
	

=n
1/h+τ
H
	

=n
2τ
H
	

B
h
	

,

so a
2
B
h
	

<A
h−1
	

 for large n. Also a
2
B
1
	

=o(n), so the top flat assignment above n comes last.

Now compare moments. The total reciprocal masses of both sequences are O
H
	

(1), and by (6), any r-tuple containing an exceptional index contributes o
H,a
	

(1) to either T
r
(b)
	

 or T
r
(p)
	

. For nonexceptional tuples, (5) gives

b
I
	

:=
j∈I
∏
	

b
j
	

≤p
I
	

:=
j∈I
∏
	

p
j
	

≤λ
r
b
I
	


and

λ
−r
b
I
	

1
	

≤
p
I
	

1
	

≤
b
I
	

1
	

.

Thus the weight change contributes O
H,r
	

(λ−1). The only cutoff discrepancy comes from tuples with

n/λ
r
<b
I
	

≤n,

and part (B) below gives that their total reciprocal contribution is o
H,λ
	

(1). Hence, for fixed H and fixed λ>1,

T
r
(p)
	

(n)=T
r
(b)
	

(n)+O
H,r
	

(λ−1)+o
H,λ
	

(1),1≤r≤4.
(7)

Taking λ=λ
m
	

↓1 and diagonalizing in n gives the literal fixed-H bridge

T
r
(p)
	

(n)=T
r
(b)
	

(n)+o
H
	

(1).

So the reservoir-matching obstruction is repairable; no short-interval Hall condition is needed.

(B) Cell-count for shrinking boundary strips

Let c>1 be fixed. Partition the positive scale into logarithmic cells

[Y,cY).

For the b-sequence, each such cell has reciprocal mass

Y≤b
j
	

<cY
∑
	

b
j
	

1
	

=O
H,c
	

(
logn
1
	

),
(8)

uniformly over the whole domain.

Inside a genuine block this follows from (1):

Y≤b
j
	

<cY
∑
	

b
j
	

1
	

≤
Y
1
	

#{j:Y≤b
j
	

<cY}≪
H,c
	

logn
1
	

.

If the cell is adjacent to a breakpoint, it may also contain one flat atom. But every flat atom at A
h
	

 has reciprocal mass

A
h
	

f
h
	

	

≪
H
	

logn
1
	

,

and the top flat atom has reciprocal mass K/n=O(1/logn). Since fixed-ratio cells cannot meet two different breakpoints for large n, (8) remains uniform.

The same bound holds for the rounded prime sequence. Nonexceptional p
j
	

’s in a fixed prime cell come from only O
a,c
	

(1) neighboring b-cells, and the exceptional reciprocal mass is O
H,a
	

(1/logn).

Now consider the product boundary strip

n/C<x
1
	

x
2
	

⋯x
r
	

≤Cn

for fixed C>1. In logarithmic coordinates, this is a strip of O
C,c
	

(1) cell-width around the hyperplane

y
1
	

+⋯+y
r
	

=logn.

There are O
H
	

(logn) possible cells in each coordinate. Once the first r−1 cell indices are chosen, only O
C,c,r
	

(1) choices of the last cell can meet the strip. Hence the number of relevant r-cell patterns is

O
H,C,c,r
	

((logn)
r−1
).

By (8), each cell pattern has product reciprocal mass

O
H,c,r
	

(
(logn)
r
1
	

).

Therefore the whole strip has reciprocal contribution

O
H,C,c,r
	

(
logn
1
	

)=o
H
	

(1).
(9)

This proves the shrinking-boundary control needed in (A). The weak-convergence argument should indeed be discarded; the cell count is the correct proof.

(C) Diagonalization with full parameter control

Choose H
m
	

→∞ increasing so fast that, for every 1≤r≤4,

∣J
r
(H
m
	

)
	

−J
r
	

∣≤
4m
1
	

.
(10)

The excision bound 5r/(4Hr!) makes this immediate, for example by taking H
m
	

≫m.

For this fixed H
m
	

, choose λ
m
	

>1 so close to 1 that the weight-change term in (7) satisfies

C
H
m
	

,r
	

(λ
m
	

−1)≤
4m
1
	

,1≤r≤4.
(11)

Let a
m
	

>1 satisfy a
m
2
	

≤λ
m
	

, and let s
m
	

=s(a
m
	

) be the finite queue-clearing length from (A).

Because all estimates at fixed H
m
	

,λ
m
	

,a
m
	

 are eventually valid, choose N
m
	

 recursively increasing so that for all n≥N
m
	

:

ξ
H
m
	

	

(n)≤
m
1
	

,
∣T
r
(b
(H
m
	

)
)
	

(n)−J
r
(H
m
	

)
	

∣≤
4m
1
	

,1≤r≤4,
	

T
r
(p
(H
m
	

)
)
	

(n)−T
r
(b
(H
m
	

)
)
	

(n)
	

≤
2m
1
	

,1≤r≤4,

and

n
α
H
m
	

−1
	

=n
1/H
m
	

+τ
H
m
	

	

≥m.

The last condition is harmless because H
m
	

 is fixed while n→∞. Also enlarge N
m
	

 so that the fixed-ratio PNT estimates used in the queue construction, the cell-count bound, and the exceptional-mass bound are all within their 1/m tolerances.

Define

H(n):=H
m
	

for N
m
	

≤n<N
m+1
	

.

Then H(n)→∞. For n∈[N
m
	

,N
m+1
	

), using (10),

∣T
r
(b
(H(n))
)
	

(n)−J
r
	

∣
	

≤∣T
r
(b
(H
m
	

)
)
	

(n)−J
r
(H
m
	

)
	

∣+∣J
r
(H
m
	

)
	

−J
r
	

∣
≤
4m
1
	

+
4m
1
	

=
2m
1
	

.
	


Thus

T
r
(b
(n)
)
	

(n)=J
r
	

+o(1).

Similarly,

∣T
r
(p
(H(n))
)
	

(n)−J
r
	

∣
	

≤∣T
r
(p
(H
m
	

)
)
	

(n)−T
r
(b
(H
m
	

)
)
	

(n)∣
+∣T
r
(b
(H
m
	

)
)
	

(n)−J
r
(H
m
	

)
	

∣+∣J
r
(H
m
	

)
	

−J
r
	

∣
≤
2m
1
	

+
4m
1
	

+
4m
1
	

=
m
1
	

.
	


Therefore

T
r
(p
(n)
)
	

(n)=J
r
	

+o(1),1≤r≤4.

This supplies the required single diagonal sequence.

(D) Certification of \Wfour/2<0.19

A rigorous certification can be done efficiently by reducing the r-fold integrals to one-dimensional interval masses and then using interval convolution.

Let

μ(du)=ρ(u)du.

Then

r!J
r
	

=μ
⊗r
{(u
1
	

,…,u
r
	

):u
1
	

+⋯+u
r
	

≤1}.

Take N=100000, and partition (0,1] into

I
i
	

=(
N
i−1
	

,
N
i
	

],1≤i≤N.

Let

m
i
	

:=μ(I
i
	

).

These masses are computed by the exact antiderivative formula. If

x∈(
h+1
1
	

,
h
1
	

],

then

F(x):=∫
0
x
	

ρ(u)du=T
h+1
	

+
h+1
1
	

log((h+1)x),

where

T
k
	

:=
ℓ=k
∑
∞
	

ℓ+1
log(1+1/ℓ)
	

.

Thus

m
i
	

=F(i/N)−F((i−1)/N).

For certification, truncate T
k
	

 at H
⋆
=10
6
. The tail is bounded using

(ℓ+1)
2
1
	

≤
ℓ+1
log(1+1/ℓ)
	

≤
ℓ(ℓ+1)
1
	

.

Hence

ℓ>H
⋆
∑
	

(ℓ+1)
2
1
	

≤
ℓ>H
⋆
∑
	

ℓ+1
log(1+1/ℓ)
	

≤
ℓ>H
⋆
∑
	

ℓ(ℓ+1)
1
	

=
H
⋆
+1
1
	

.

All logarithms and sums are evaluated with outward-rounded interval arithmetic.

Let c
s
(r)
	

 be the interval convolution coefficients

c
s
(r)
	

:=
i
1
	

+⋯+i
r
	

=s
∑
	

m
i
1
	

	

⋯m
i
r
	

	

.

Since every cell with

N
i
1
	

+⋯+i
r
	

	

≤1

lies wholly inside the simplex, and every cell whose lower endpoints can meet the simplex satisfies

N
(i
1
	

−1)+⋯+(i
r
	

−1)
	

≤1,

we get rigorous bounds

r!
1
	

s≤N
∑
	

c
s
(r)
	

≤J
r
	

≤
r!
1
	

s≤N+r
∑
	

c
s
(r)
	

.

Using N=100000, H
⋆
=10
6
, and directed rounding gives the following certified intervals:

J
1
	

∈[0.7885305658, 0.7885305661],
J
2
	

∈[0.18681848, 0.18682451],
J
3
	

∈[0.02009209, 0.02009370],
J
4
	

∈[0.00122263, 0.00122282].

For an upper bound on

2
\Wfour
	

=
2
1
	

(1−J
1
	

+J
2
	

−J
3
	

+J
4
	

),

use the lower bounds for J
1
	

,J
3
	

 and the upper bounds for J
2
	

,J
4
	

:

2
\Wfour
	

≤
2
1
	

(1−0.7885305658+0.18682451−0.02009209+0.00122282).

This gives

2
\Wfour
	

≤0.1897123371<0.19.

So one may take, for example,

η=2.87×10
−4

in

2
\Wfour
	

≤0.19−η.

Thus the four open substeps are all repairable. The key structural change is in (A): exceptional boundary indices should not be matched by a suffix Hall argument inside a short reservoir. They should be absorbed by a finite queued system of fixed-ratio bins, after which the ordinary next-bin assignment has enough half-density slack.

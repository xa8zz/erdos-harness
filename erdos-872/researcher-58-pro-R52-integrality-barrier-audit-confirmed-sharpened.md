Result: the random construction is correct, and the Sherali-Adams part is true but much weaker than necessary. A cleaner theorem is available: the hypothesis 0<α<1/2 can be weakened to 0<α<1, the covering-family size is optimal in the exponential scale, and the level-r SA value is at most N/(ℓ−r), with no additive r.

I use natural logarithms throughout.

Theorem. Fix 0<α<1, put β=1−α, and for all sufficiently large N let

ℓ=⌊
logN
N
	

⌋,q=⌊αN⌋,δ=
(
ℓ
N
	

)
(
ℓ
N−q
	

)
	

.

For every N-point set P, there is a family C⊆(
ℓ
P
	

) such that every Q⊆P with ∣Q∣≤q is disjoint from some C∈C, and

∣C∣≤⌈
δ
log(
q
N
	

)+1
	

⌉.

Moreover no family with the q-avoidance property can have size smaller than 1/δ. Hence the minimum possible size m
N
	

 satisfies

logm
N
	

=log
δ
1
	

+O(logN)=(log
1−α
1
	

+o(1))
logN
N
	

.

More explicitly, for all sufficiently large N,

log
δ
1
	

≤ℓlog
β
1
	

+
β
α
	

N
ℓ
2
	

,

and therefore one may choose

log∣C∣≤ℓlog
β
1
	

+
β
α
	

N
ℓ
2
	

+log(2(Nlog2+1)).

For this family,

τ
Z
	

(C)≥q+1>αN,τ
f
	

(C)≤
ℓ
N
	

,

so

G(C)=
τ
f
	

(C)
τ
Z
	

(C)
	

≥αℓ=(α+o(1))
logN
N
	

.

Finally, the following stronger Sherali-Adams statement holds for every ℓ-uniform family H⊆(
ℓ
P
	

), not only for the random construction above. Under the level-r convention in the question, for every integer 0≤r<ℓ,

SA
r
	

(H)≤
ℓ−r
N
	

.

Consequently, for the constructed C, if r≤ℓ/2, then

SA
r
	

(C)≤
ℓ
2N
	

=(2+o(1))logN,

while

τ
Z
	

(C)>αN.

Thus the level-r SA integrality gap is at least

SA
r
	

(C)
τ
Z
	

(C)
	

≥
2N/ℓ
αN
	

=(
2
α
	

+o(1))
logN
N
	

(r≤ℓ/2).

Proof.

Let B=(
q
N
	

). Choose s independent uniformly random ℓ-subsets of P, where

s=⌈
δ
logB+1
	

⌉.

For a fixed q-set Q⊆P, a random ℓ-set C avoids Q with probability

Pr(C∩Q=∅)=
(
ℓ
N
	

)
(
ℓ
N−q
	

)
	

=δ.

Therefore

Pr(no chosen C avoids Q)=(1−δ)
s
≤e
−sδ
≤e
−(logB+1)
=
B
e
−1
	

.

Taking a union bound over all B choices of Q, the probability that some q-set is not avoided is at most e
−1
<1. Hence with positive probability every q-set is avoided. Removing duplicate chosen ℓ-sets, if any, gives a genuine family C⊆(
ℓ
P
	

) of size at most s.

If Q
′
⊆P has ∣Q
′
∣≤q, choose a q-set Q⊇Q
′
. Since some C∈C is disjoint from Q, it is also disjoint from Q
′
. This proves the stated avoidance property for all sets of size at most q.

For the lower bound on the size of any such family, count pairs (C,Q) with C∈C, ∣Q∣=q, and C∩Q=∅. Each C is disjoint from exactly (
q
N−ℓ
	

) many q-sets. Since every q-set must be avoided by at least one C,

∣C∣(
q
N−ℓ
	

)≥(
q
N
	

).

Using the identity

(
q
N
	

)
(
q
N−ℓ
	

)
	

=
(
ℓ
N
	

)
(
ℓ
N−q
	

)
	

=δ,

we get

∣C∣≥
δ
1
	

.

Thus the random construction is optimal up to the multiplicative factor log(
q
N
	

)+1=O(N), and therefore optimal in the logarithmic/exponential scale.

Now estimate δ. Let m=N−q. Since q=⌊αN⌋,

m=βN+O(1).

For large N, ℓ≤βN/2. We have

log
δ
1
	

=
i=0
∑
ℓ−1
	

log
m−i
N−i
	

=
i=0
∑
ℓ−1
	

[log
m
N
	

+log
1−i/m
1−i/N
	

].

Because m≥βN, the first summand satisfies

log
m
N
	

≤log
β
1
	

.

For the second summand,

1−i/m
1−i/N
	

=1+
N(m−i)
i(N−m)
	

,

so

log
1−i/m
1−i/N
	

≤
N(m−i)
i(N−m)
	

≤
βN
2αi
	

,

where we used N−m=q≤αN and m−i≥βN/2. Summing over 0≤i<ℓ,

log
δ
1
	

≤ℓlog
β
1
	

+
βN
2α
	

i=0
∑
ℓ−1
	

i≤ℓlog
β
1
	

+
β
α
	

N
ℓ
2
	

.

Conversely, since m≤βN+1 and the second summand is nonnegative,

log
δ
1
	

≥ℓlog
βN+1
N
	

=ℓlog
β
1
	

−O
α
	

(ℓ/N).

Thus

log
δ
1
	

=ℓlog
β
1
	

+O
α
	

(ℓ
2
/N)=(log
1−α
1
	

+o(1))
logN
N
	

.

Also log(
q
N
	

)≤Nlog2, so the chosen family satisfies

log∣C∣≤log
δ
1
	

+log(2(log(
q
N
	

)+1))≤ℓlog
β
1
	

+
β
α
	

N
ℓ
2
	

+log(2(Nlog2+1)).

The hitting-number and fractional-number claims are immediate but important. If Q is a hitting set with ∣Q∣≤q, the avoidance property gives some C∈C with C∩Q=∅, a contradiction. Hence

τ
Z
	

(C)≥q+1>αN.

On the other hand, the uniform fractional assignment x
p
	

=1/ℓ gives

p∈C
∑
	

x
p
	

=1

for every C∈C, so

τ
f
	

(C)≤
p∈P
∑
	

x
p
	

=
ℓ
N
	

.

Therefore

G(C)≥
N/ℓ
q+1
	

>αℓ.

It remains to prove the sharper Sherali-Adams claim. Let H⊆(
ℓ
P
	

) be arbitrary and fix 0≤r<ℓ. Put

p=
ℓ−r
1
	

.

Let Y⊆P be a random subset obtained by including each point independently with probability p. Define the moment functional by

E
[
i∈S
∏
	

y
i
	

]=Pr(S⊆Y)=p
∣S∣
.

Because this comes from an actual probability distribution on {0,1}
P
, all lifted box constraints 0≤y
i
	

≤1 are automatically satisfied.

Now take any covering constraint

g
C
	

(y)=
u∈C
∑
	

y
u
	

−1≥0,C∈H,

and any literal monomial

L
I,J
	

(y)=
i∈I
∏
	

y
i
	

j∈J
∏
	

(1−y
j
	

),∣I∣+∣J∣≤r.

If I∩J

=∅, then L
I,J
	

≡0 on {0,1}
P
, so the lifted inequality has expectation 0. Assume I∩J=∅.

If I∩C

=∅, then whenever L
I,J
	

(y)=1, at least one variable in C is already equal to 1. Hence

(
u∈C
∑
	

y
u
	

−1)L
I,J
	

(y)≥0

pointwise, and the required SA inequality follows.

It remains to handle I∩C=∅. Let

c=∣J∩C∣.

Condition on the event represented by L
I,J
	

=1, namely I⊆Y and J∩Y=∅. If this event has probability zero, the lifted expectation is zero. Otherwise, the variables in C∖J remain independent Bernoulli-p, while the c variables in C∩J are fixed to 0. Therefore

E
[
u∈C
∑
	

y
u
	

 
	

 L
I,J
	

=1]=(ℓ−c)p.

Since c≤∣J∣≤∣I∣+∣J∣≤r,

(ℓ−c)p≥(ℓ−r)⋅
ℓ−r
1
	

=1.

Thus

E
[g
C
	

(y)L
I,J
	

(y)]≥0.

So the level-r SA relaxation is feasible with objective value

E
u∈P
∑
	

y
u
	

=Np=
ℓ−r
N
	

.

This proves the SA bound.

One audit note: the draft’s fixed-cardinality SA proof has a literal edge-case defect when r=ℓ−1, because its proposed

M=⌈r+
ℓ−r
N
	

⌉

can exceed N, so a uniform random M-subset is not defined. This does not refute the SA claim; the product Bernoulli construction above proves a stronger bound and covers r=ℓ−1 as well, where p=1 and the objective is N.

The broad “proof technique” consequence in the draft is mathematically valid only after each named technique is formalized as factoring through level-r SA, or through a weaker local-moment relaxation. The precise formal consequence proved here is: no argument whose entire certificate is bounded by the above level-r SA relaxation can certify a transversal lower bound exceeding N/(ℓ−r) on these instances, even though the true integral optimum is >αN.

Python sandbox verification:

import math
from itertools import combinations
from fractions import Fraction

def log_binom(n, k):
    return math.lgamma(n + 1) - math.lgamma(k + 1) - math.lgamma(n - k + 1)

def numerical_table(alpha=0.25):
    print("alpha =", alpha)
    print("N ell q -log(delta) log_s_draft_approx ratio_to_(N/logN)")
    for N in [1000, 5000, 10000]:
        ell = math.floor(N / math.log(N))
        q = math.floor(alpha * N)
        neg_log_delta = log_binom(N, ell) - log_binom(N - q, ell)
        log_s_draft_approx = math.log(2 * log_binom(N, q)) + neg_log_delta
        ratio = neg_log_delta / (N / math.log(N))
        print(N, ell, q, f"{neg_log_delta:.12f}", f"{log_s_draft_approx:.12f}", f"{ratio:.12f}")

def check_counting_identity():
    print("counting identity checks:")
    for N, ell, q in [(8, 3, 2), (10, 4, 3), (12, 5, 4)]:
        left = math.comb(N, ell) * math.comb(N - ell, q)
        right = math.comb(N, q) * math.comb(N - q, ell)
        print((N, ell, q), left == right, left, right)

def all_subsets(n, max_size):
    for k in range(max_size + 1):
        for comb in combinations(range(n), k):
            yield frozenset(comb)

def expectation_cover_literal(N, ell, r, C, I, J):
    # Product Bernoulli pseudo-solution with p = 1/(ell-r), computed exactly.
    p = Fraction(1, ell - r)
    expval = Fraction(0, 1)
    for mask in range(1 << N):
        ones = mask.bit_count()
        prob = (p ** ones) * ((1 - p) ** (N - ones))
        literal = all((mask >> i) & 1 for i in I) and all(not ((mask >> j) & 1) for j in J)
        if literal:
            expval += prob * (sum((mask >> c) & 1 for c in C) - 1)
    return expval

def brute_verify_SA(maxN=7):
    total = 0
    worst = None
    for N in range(1, maxN + 1):
        subsets_by_size = {k: list(combinations(range(N), k)) for k in range(N + 1)}
        subset_cache = {k: list(all_subsets(N, k)) for k in range(N + 1)}
        for ell in range(1, N + 1):
            for r in range(0, ell):
                for C_tuple in subsets_by_size[ell]:
                    C = frozenset(C_tuple)
                    for I in subset_cache[r]:
                        remaining = [x for x in range(N) if x not in I]
                        for b in range(r - len(I) + 1):
                            for J_tuple in combinations(remaining, b):
                                J = frozenset(J_tuple)
                                expval = expectation_cover_literal(N, ell, r, C, I, J)
                                total += 1
                                if expval < 0:
                                    return False, total, (N, ell, r, C, I, J, expval)
                                if worst is None or expval < worst[-1]:
                                    worst = (N, ell, r, C, I, J, expval)
    return True, total, worst

numerical_table()
print()
check_counting_identity()
print()
ok, total, worst = brute_verify_SA(7)
print("SA exhaustive check through N=7:", ok)
print("literal-cover constraints checked:", total)
print("minimum expectation found:", worst[-1])
print("minimum attained at (N, ell, r, C, I, J):", worst[:-1])

print()
N, ell, r = 100, 21, 20
draft_M = math.ceil(r + N / (ell - r))
print("Draft fixed-cardinality M example:", {"N": N, "ell": ell, "r": r, "ceil(r+N/(ell-r))": draft_M, "M<=N": draft_M <= N})
print("Sharper product objective N/(ell-r):", N / (ell - r))

Output:

alpha = 0.25
N ell q -log(delta) log_s_draft_approx ratio_to_(N/logN)
1000 144 250 45.297361890176 52.316298829026 0.312903090721
5000 587 1250 181.503210424118 190.136348555446 0.309179581609
10000 1085 2500 333.566976777634 342.893973201940 0.307226539297

counting identity checks:
(8, 3, 2) True 560 560
(10, 4, 3) True 4200 4200
(12, 5, 4) True 27720 27720

SA exhaustive check through N=7: True
literal-cover constraints checked: 93671
minimum expectation found: 0
minimum attained at (N, ell, r, C, I, J): (1, 1, 0, frozenset({0}), frozenset(), frozenset())

Draft fixed-cardinality M example: {'N': 100, 'ell': 21, 'r': 20, 'ceil(r+N/(ell-r))': 120, 'M<=N': False}
Sharper product objective N/(ell-r): 100.0

The numerical values in the draft table are correct to the displayed precision. The exhaustive SA check enumerates all choices of C,I,J for N≤7, all 1≤ℓ≤N, and all 0≤r<ℓ, using exact rational arithmetic for the product Bernoulli pseudo-solution.

Verdict: the fixed-q argument is correct in the nondegenerate separator range, and it admits a cleaner, sharper formulation. The two useful sharpenings are:

use the actual live density r, not only the threshold η;
state the exact covering conclusion before applying the union bound.

There is one necessary normalization: take L≥1 and 1≤q≤h. If q=0, the strict statement is false: with h=L=1, D=∅, one played complement C, and R=Y, there is no legal 0-separator, while σ
0
	

(D)+∣C∣δ
0
	

=1 and 1−4λ
0
2
	

/r=1, so the claimed strict > fails. This is also exactly where the quoted spectral implication degenerates at threshold 0.

Here is the paper-facing version I would use.

Fixed-rank shadow/capture dichotomy

Let P be a set of size K=h+L, with h,L≥1, and fix 1≤q≤h. Let

Y=(
L
P
	

),Q
q
	

=(
q
P
	

).

For C∈Y, define its killed q-neighborhood

B
q
	

(C)={Q∈Q
q
	

:Q∩C=∅}.

For a blocker family D⊆2
P
, define

F
q
	

(D)={Q∈Q
q
	

:∃d∈D with d⊆Q or Q⊆d}.

For a played complement family C⊆Y, define

A
q
	

(D,C)=Q
q
	

∖(F
q
	

(D)∪
C∈C
⋃
	

B
q
	

(C)).

Let

a
q
	

=
∣Q
q
	

∣
∣A
q
	

(D,C)∣
	

,σ
q
	

(D)=
∣Q
q
	

∣
∣F
q
	

(D)∣
	

,r=
∣Y∣
∣R∣
	

.

Finally put

δ
q
	

=
(
L
K
	

)
(
L
K−q
	

)
	

,λ
q
2
	

=
h(K−q)
qL
	

.

Assume R⊆Y has density r>0. If no legal q-separator Q∈A
q
	

(D,C) captures at least

2
1
	

δ
q
	

∣R∣

live complements, then

a
q
	

<
r
4λ
q
2
	

	

.

Equivalently, if

U
q
	

(D,C)=F
q
	

(D)∪
C∈C
⋃
	

B
q
	

(C),

then

∣Q
q
	

∣
∣U
q
	

(D,C)∣
	

>1−
r
4λ
q
2
	

	

.

Consequently,

σ
q
	

(D)+∣C∣δ
q
	

>1−
r
4λ
q
2
	

	

.

In particular, if r≥η>0, then

σ
q
	

(D)+∣C∣δ
q
	

>1−
η
4λ
q
2
	

	

,

and, since δ
q
	

>0 for q≤h,

∣C∣>
δ
q
	

1−
η
4λ
q
2
	

	

−σ
q
	

(D)
	

.

This proves the draft theorem, with the slightly stronger r-dependent version.

Proof

For each C∈Y, the q-sets killed by C are exactly the q-subsets of P∖C. Since ∣P∖C∣=h,

∣B
q
	

(C)∣=(
q
h
	

).

Moreover,

(
q
K
	

)
(
q
h
	

)
	

=
(
L
K
	

)
(
L
K−q
	

)
	

=δ
q
	

.

The equality follows directly from

(
q
K
	

)
(
q
h
	

)
	

=
(h−q)!K!
h!(K−q)!
	

=
(
L
K
	

)
(
L
K−q
	

)
	

,

using K−L=h.

By definition,

A
q
	

(D,C)=Q
q
	

∖(F
q
	

(D)∪
C∈C
⋃
	

B
q
	

(C)).

Hence, with U
q
	

=U
q
	

(D,C),

a
q
	

=1−
∣Q
q
	

∣
∣U
q
	

∣
	

.

Now suppose no legal q-separator captures at least 
2
1
	

δ
q
	

∣R∣ live complements. The given Spectral Separator Theorem says that if

a
q
	

r≥4λ
q
2
	

,

then such a separator exists. Therefore its contrapositive gives

a
q
	

r<4λ
q
2
	

,

so

a
q
	

<
r
4λ
q
2
	

	

.

Since a
q
	

=1−∣U
q
	

∣/∣Q
q
	

∣, this is exactly

∣Q
q
	

∣
∣U
q
	

∣
	

>1−
r
4λ
q
2
	

	

.

Finally, by the union bound,

∣U
q
	

∣≤∣F
q
	

(D)∣+
C∈C
∑
	

∣B
q
	

(C)∣=∣F
q
	

(D)∣+∣C∣(
q
h
	

).

Dividing by ∣Q
q
	

∣=(
q
K
	

) gives

∣Q
q
	

∣
∣U
q
	

∣
	

≤σ
q
	

(D)+∣C∣δ
q
	

.

Combining the last two inequalities yields

σ
q
	

(D)+∣C∣δ
q
	

>1−
r
4λ
q
2
	

	

.

If r≥η, then

r
4λ
q
2
	

	

≤
η
4λ
q
2
	

	

,

so

σ
q
	

(D)+∣C∣δ
q
	

>1−
η
4λ
q
2
	

	

.

This proves the theorem.

Fixed-q packet-race corollary

Suppose all prior Shortener moves in the packet are q-separators, and let S⊆Q
q
	

 be the family of previously played q-separators. Then

F
q
	

(S)=S.

Indeed, if d,Q∈Q
q
	

, then d⊆Q or Q⊆d holds if and only if d=Q. Therefore

σ
q
	

(S)=
∣Q
q
	

∣
∣S∣
	

.

Thus, if r≥η>0 and no legal q-separator captures at least 
2
1
	

δ
q
	

∣R∣ live complements, then

∣Q
q
	

∣
∣S∣
	

+∣C∣δ
q
	

>1−
η
4λ
q
2
	

	

,

or equivalently

∣C∣>
δ
q
	

1−
η
4λ
q
2
	

	

−
∣Q
q
	

∣
∣S∣
	

	

.

So the draft corollary is correct, again in the nondegenerate range 1≤q≤h.

Central-scale specialization with sharper constants

Let natural logarithms be used, and set

L=⌊
logh
h
	

⌋,q=⌊2(logh)
2
⌋.

Then, as h→∞,

δ
q
	

=(e+o(1))h
−2
,

which sharpens the draft estimate δ
q
	

=h
−2+o(1)
. Also,

λ
q
2
	

=(2+o(1))
h
logh
	

.

Therefore, for any threshold η=η
h
	

 satisfying

η
h
	

≫
h
logh
	

,

failure of 
2
1
	

δ
q
	

-capture implies

σ
q
	

(D)+(e+o(1))
h
2
∣C∣
	

>1−o(1).

More explicitly,

σ
q
	

(D)+(e+o(1))
h
2
∣C∣
	

>1−(8+o(1))
hη
h
	

logh
	

.

Thus, if σ
q
	

(D)=o(1), then starving the spectral branch forces

∣C∣>(e
−1
−o(1))h
2
.

More generally, if σ
q
	

(D)≤1−ε along some range, with fixed ε>0, then

∣C∣>(
e
ε
	

−o(1))h
2
.

So the central-scale conclusion should be stated as an Ω(h
2
), or sharper (1/e−o(1))h
2
 when σ
q
	

=o(1), lower bound. The phrase “∣C∣=h
2+o(1)
” is too equality-like unless an independent upper bound is also available.

Proof of the central estimates:

Let t=logh. Then

L=
t
h
	

+O(1),q=2t
2
+O(1).

For δ
q
	

,

δ
q
	

=
(
q
h+L
	

)
(
q
h
	

)
	

=
i=0
∏
q−1
	

h+L−i
h−i
	

=exp(−
i=0
∑
q−1
	

log(1+
h−i
L
	

)).

Put x
i
	

=L/(h−i). Uniformly for 0≤i<q,

x
i
	

=O(1/t).

Hence

log(1+x
i
	

)=x
i
	

−
2
x
i
2
	

	

+O(x
i
3
	

).

Now

i=0
∑
q−1
	

x
i
	

=L
i=0
∑
q−1
	

h−i
1
	

=
h
qL
	

+O(
h
2
Lq
2
	

)=2t+o(1),

and

i=0
∑
q−1
	

x
i
2
	

=L
2
i=0
∑
q−1
	

(h−i)
2
1
	

=
h
2
qL
2
	

+o(1)=2+o(1).

Also,

i=0
∑
q−1
	

x
i
3
	

=O(1/t)=o(1).

Therefore

i=0
∑
q−1
	

log(1+x
i
	

)=2t−1+o(1),

so

logδ
q
	

=−2t+1+o(1),

and hence

δ
q
	

=(e+o(1))h
−2
.

For λ
q
2
	

,

λ
q
2
	

=
h(h+L−q)
qL
	

.

Using q=2t
2
+O(1), L=h/t+O(1), and q=o(h), we get

qL=(2+o(1))ht

and

h(h+L−q)=h
2
(1+o(1)).

Thus

λ
q
2
	

=(2+o(1))
h
t
	

=(2+o(1))
h
logh
	

.

Substitution into the fixed-q dichotomy gives the central-scale statement.

Sandbox verification

I verified the binomial identity, the exact complement identity A
q
	

=Q
q
	

∖U
q
	

, the union-bound inequality, the fixed-rank corollary comparability claim, the stated spectral parameter on small Johnson disjointness matrices, and the central-scale numerics.

from itertools import combinations
from math import comb, log, floor
import numpy as np

def masks_of_size(n, k):
    return [sum(1 << i for i in c) for c in combinations(range(n), k)]

def all_masks(n):
    return list(range(1 << n))

def F_q_masks(D, Qs):
    F = set()
    for Q in Qs:
        for d in D:
            if (d & ~Q) == 0 or (Q & ~d) == 0:
                F.add(Q)
                break
    return F

def killed_by_C(C, Qs):
    return {Q for Q in Qs if (Q & C) == 0}

identity_checks = 0
identity_violations = 0
for h in range(1, 9):
    for L in range(1, 9):
        K = h + L
        for q in range(0, K + 1):
            lhs = comb(h, q) * comb(K, L)
            rhs = comb(K, q) * comb(K - q, L)
            identity_checks += 1
            identity_violations += (lhs != rhs)

exhaustive_cases = 0
union_bound_violations = 0
exact_complement_violations = 0
for K in range(1, 5):
    P_masks = all_masks(K)
    all_D_families = []
    for selector in range(1 << len(P_masks)):
        D = [P_masks[i] for i in range(len(P_masks)) if (selector >> i) & 1]
        all_D_families.append(D)

    for L in range(1, K + 1):
        h = K - L
        if h < 1:
            continue
        Ys = masks_of_size(K, L)
        all_C_families = []
        for selector in range(1 << len(Ys)):
            Cfam = [Ys[i] for i in range(len(Ys)) if (selector >> i) & 1]
            all_C_families.append(Cfam)

        for q in range(1, h + 1):
            Qs = masks_of_size(K, q)
            N = len(Qs)
            killed_per_C = comb(h, q)

            for D in all_D_families:
                F = F_q_masks(D, Qs)

                for Cfam in all_C_families:
                    Bunion = set()
                    for C in Cfam:
                        Bunion |= killed_by_C(C, Qs)

                    A = [
                        Q for Q in Qs
                        if Q not in F and all((Q & C) != 0 for C in Cfam)
                    ]

                    exhaustive_cases += 1
                    union_bound_violations += (
                        len(A) < N - len(F) - len(Cfam) * killed_per_C
                    )
                    exact_complement_violations += (
                        len(A) != N - len(F | Bunion)
                    )

# Fixed-rank comparability:
# for q-sets d,Q, d subset Q or Q subset d iff d=Q.
fixed_rank_pair_checks = 0
fixed_rank_pair_violations = 0
for K in range(1, 11):
    for q in range(0, K + 1):
        Qs = masks_of_size(K, q)
        for d in Qs:
            for Q in Qs:
                comparable = ((d & ~Q) == 0) or ((Q & ~d) == 0)
                fixed_rank_pair_checks += 1
                fixed_rank_pair_violations += (comparable != (d == Q))

def spectral_ratio_squared(K, L, q):
    h = K - L
    Qs = masks_of_size(K, q)
    Ys = masks_of_size(K, L)
    M = np.array([[1.0 if (Q & Y) == 0 else 0.0 for Y in Ys] for Q in Qs])
    s = sorted(np.linalg.svd(M, compute_uv=False), reverse=True)
    return (s[1] / s[0]) ** 2

spectral_tests = 0
max_spectral_error = 0.0
for K in range(4, 9):
    for L in range(1, K):
        h = K - L
        for q in range(1, h + 1):
            if comb(K, q) * comb(K, L) <= 2500 and min(comb(K,q), comb(K,L)) >= 2:
                observed = spectral_ratio_squared(K, L, q)
                formula = q * L / (h * (K - q))
                spectral_tests += 1
                max_spectral_error = max(max_spectral_error, abs(observed - formula))

def central_log_delta_by_sum(h):
    t = log(h)
    L = floor(h / t)
    q = floor(2 * t * t)
    K = h + L
    log_delta = 0.0
    for i in range(q):
        log_delta += log((h - i) / (K - i))
    lam2 = q * L / (h * (K - q))
    return L, q, log_delta, lam2

print("binomial_identity_checks =", identity_checks)
print("binomial_identity_violations =", identity_violations)
print("exhaustive_union_bound_cases =", exhaustive_cases)
print("union_bound_violations =", union_bound_violations)
print("exact_complement_identity_violations =", exact_complement_violations)
print("fixed_rank_pair_checks =", fixed_rank_pair_checks)
print("fixed_rank_pair_violations =", fixed_rank_pair_violations)
print("spectral_parameter_tests =", spectral_tests)
print("max_spectral_parameter_error =", max_spectral_error)
print("central_scale_rows:")
print("h, L, q, log(delta)/log(h), lambda^2/(log(h)/h), log(delta)+2log(h)")
for h in [10**3, 10**6, 10**9, 10**12, 10**15, 10**20]:
    t = log(h)
    L, q, log_delta, lam2 = central_log_delta_by_sum(h)
    print((h, L, q,
           round(log_delta / t, 12),
           round(lam2 / (t / h), 12),
           round(log_delta + 2*t, 12)))

Output:

binomial_identity_checks = 640
binomial_identity_violations = 0
exhaustive_union_bound_cases = 12589120
union_bound_violations = 0
exact_complement_identity_violations = 0
fixed_rank_pair_checks = 250952
fixed_rank_pair_violations = 0
spectral_parameter_tests = 74
max_spectral_parameter_error = 4.440892098500626e-16
central_scale_rows:
h, L, q, log(delta)/log(h), lambda^2/(log(h)/h), log(delta)+2log(h)
(1000, 144, 95, -1.936666512096, 1.887876870809, 0.437492235404)
(1000000, 72382, 381, -1.927547999896, 1.862058946316, 1.000961372378)
(1000000000, 48254942, 858, -1.951180386323, 1.905918495506, 1.011701832286)
(1000000000000, 36191206825, 1526, -1.963440938613, 1.928949074945, 1.010164197171)
(1000000000000000, 28952965460216, 2385, -1.970888181045, 1.943027577974, 1.005486605334)
(100000000000000000000, 2171472409516259072, 4241, -1.978352730714, 1.957254280872, 0.996893591262)

The last column numerically reflects the sharper asymptotic

logδ
q
	

+2logh→1,

i.e.

δ
q
	

∼eh
−2
.

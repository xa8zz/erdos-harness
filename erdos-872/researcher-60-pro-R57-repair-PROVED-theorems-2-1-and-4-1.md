---
id: R60-pro-R57-repair-theorems-2-1-4-1
type: verification
date: 2026-04-20
intent: >
  Audit the R57 repair in r57_bonferroni4_audit_and_repair.md; prove or
  refute the prime-sequence Bonferroni-4 comparison theorem (Theorem 2.1)
  and the prime-rounding bridge (Theorem 4.1).
predecessors: [R57-pro-bonferroni4-L-le-0.19n, R57-codex-bonferroni4-audit-repair]
prompt: erdos-872/prompts/researcher-R60-fresh-pro-R57-repair-audit-or-prove.md
action:
  kind: confirms
  target: R57-codex-bonferroni4-audit-repair
claim: >
  Both theorems proved rigorously. Theorem 2.1: odd-part injection +
  monotone replacement N(q) <= N(p) + 4th-order Bonferroni with
  M_r(n) = O_r(n (log log n)^{r-1} / log n) = o(n) error. Theorem 4.1:
  the Round 57 local-density envelope bound (half odd-prime density)
  supplies the slack for the bin-to-next-bin prime-rounding construction;
  greedy assignment + diagonal delta(n) -> 0 gives sup p_j/b_j = 1 +
  o(1) uniformly; factorial moment transfer T_r^(p)(n) = T_r^(b)(n) +
  o(1) = J_r + o(1). Chaining: L(n) <= (W_4/2 + o(1))n = (0.1897112 +
  o(1))n < 0.19n.
failure_mechanism: >
  Flagged one real repair to the bridge proof: the naive "by PNT,
  p_j/b_j = 1 + O(1/log b_j) uniformly" is NOT justified by PNT alone.
  The correct argument uses the Round 57 local-density envelope bound
  forcing b_j density <= (1/2) odd-prime density; that slack is
  decisive and must appear in the bridge proof.
verifiers_at_time:
  - [sandbox, agrees]
confidence_at_time: high
strategy_dependence: strategy-specific
numerics:
  - {regime: "n=14 exhaustive", value: "odd-part injection across 732 antichains, no violations"}
  - {regime: "n=10^4, 10^5, 10^6", value: "N(q) <= N(p) confirmed in all test cases"}
  - {regime: "n=10^4 to 10^8", value: "controlled prime-rounding: T_p - T_b = o(1)"}
  - {regime: "W_4/2 numeric", value: 0.1897112}
---

I did not search online. The finite Bonferroni-4 theorem does follow, with one repair to the proposed proof of Theorem 4.1: the sentence “by PNT, p
j
	

/b
j
	

=1+O(1/logb
j
	

) uniformly” is not justified by PNT alone. What is rigorously true, and sufficient, is the stronger bridge statement below:

p
j
	

≥b
j
	

,
b
j
	

≤n
sup
	

b
j
	

p
j
	

	

=1+o(1),

for the Round 57 envelope scale, because that scale has local density at most one half of the odd-prime density. This proves Theorem 4.1 as stated, and then Theorem 2.1 chains exactly with Λ
r
	

=J
r
	

.

1. Proof of Theorem 2.1

Let A be the final set of played integers. It is an antichain under divisibility. If the game ends before Shortener makes K moves, then

L(n)≤2K+1=O(n/logn)=o(n),

so the desired upper bound is trivial. Assume therefore that q
1
	

,…,q
K
	

 have all been played.

Define the odd-part map

ϕ(x)=
2
v
2
	

(x)
x
	

.

If ϕ(x)=ϕ(y)=m, then x=2
a
m, y=2
b
m. If a<b, then x∣y; if b<a, then y∣x. Since A is an antichain, this forces a=b, hence x=y. Therefore ϕ is injective on A.

Since q
j
	

∈A, no other element x∈A∖{q
1
	

,…,q
K
	

} can be divisible by any q
j
	

. Because q
j
	

 is odd, q
j
	

∣x iff q
j
	

∣ϕ(x). Hence

ϕ(A)⊆{m≤n:m odd and no q
j
	

∣m}∪{q
1
	

,…,q
K
	

}.

Let

N(q
1
	

,…,q
K
	

)=#{m≤n:m odd and no q
j
	

∣m}.

Then

L(n)=∣A∣≤N(q
1
	

,…,q
K
	

)+K=N(q
1
	

,…,q
K
	

)+o(n).

Now prove monotone replacement. For a finite set R of odd primes, write

C
R
	

(x)=#{m≤x:m odd and no r∈R divides m}.

If a∈
/
R is an odd prime, then

C
R∪{a}
	

(n)=C
R
	

(n)−C
R
	

(n/a),

because the excluded multiples of a are exactly at, with t≤n/a, t odd, and t not divisible by any prime in R. Thus if a≤b, then C
R
	

(n/a)≥C
R
	

(n/b), so

C
R∪{a}
	

(n)≤C
R∪{b}
	

(n).

Replace q
K
	

 by p
K
	

, then q
K−1
	

 by p
K−1
	

, and so on. Since both sequences are increasing and q
i
	

≤p
i
	

, every replacement remains among distinct odd primes. Therefore

N(q
1
	

,…,q
K
	

)≤N(p
1
	

,…,p
K
	

).

Now let U be the set of odd integers ≤n, and let

A
j
	

={m∈U:p
j
	

∣m}.

The fourth-order Bonferroni inequality for the union gives

∣
j
⋃
	

A
j
	

∣≥S
1
	

−S
2
	

+S
3
	

−S
4
	

,

where

S
r
	

=
1≤j
1
	

<⋯<j
r
	

≤K
∑
	

∣A
j
1
	

	

∩⋯∩A
j
r
	

	

∣.

Therefore

N(p
1
	

,…,p
K
	

)=∣U∣−∣
j
⋃
	

A
j
	

∣≤∣U∣−S
1
	

+S
2
	

−S
3
	

+S
4
	

.

For d=p
j
1
	

	

⋯p
j
r
	

	

, the intersection A
j
1
	

	

∩⋯∩A
j
r
	

	

 is the set of odd multiples of d, so

∣A
j
1
	

	

∩⋯∩A
j
r
	

	

∣={
2d
n
	

+O(1),
0,
	

d≤n,
d>n.
	


Thus

S
r
	

=
2
n
	

T
r
(p)
	

(n)+O(M
r
	

(n)),

where M
r
	

(n) is the number of r-tuples of distinct odd primes with product ≤n. For r≤4,

M
r
	

(n)=O
r
	

(
logn
n(loglogn)
r−1
	

)=o(n).

For r=1, this is PNT. For r=2,3,4, sort the primes in a product p
1
	

<⋯<p
r
	

. For example, for r=4, after choosing p
1
	

≤n
1/4
, p
2
	

≤(n/p
1
	

)
1/3
, and p
3
	

≤(n/(p
1
	

p
2
	

))
1/2
, the last prime has at most

O(
p
1
	

p
2
	

p
3
	

logn
n
	

)

choices, because n/(p
1
	

p
2
	

p
3
	

)≥n
1/4
. Summing 1/p
i
	

 over primes gives O(loglogn) per chosen prime, hence

M
4
	

(n)=O(
logn
n(loglogn)
3
	

).

The r=2,3 cases are the same argument with fewer chosen primes.

Since ∣U∣=n/2+O(1), and since T
r
(p)
	

(n)=Λ
r
	

+o(1), we obtain

L(n)
	

≤N(p
1
	

,…,p
K
	

)+o(n)
≤
2
n
	

−
2
n
	

T
1
(p)
	

(n)+
2
n
	

T
2
(p)
	

(n)−
2
n
	

T
3
(p)
	

(n)+
2
n
	

T
4
(p)
	

(n)+o(n)
=
2
n
	

(1−Λ
1
	

+Λ
2
	

−Λ
3
	

+Λ
4
	

+o(1)).
	


This proves Theorem 2.1.

2. Proof of the prime-rounding bridge, Theorem 4.1

The proposed construction is

p
j
	

=the smallest odd prime with p
j
	

≥b
j
	

 and p
j
	

>p
j−1
	

.

The missing ingredient is not merely PNT; it is the Round 57 local count envelope. Let

B
n
	

(X)=#{j:b
j
	

≤X}.

From the Round 57 construction, on u=log
n
	

X∈(1/(h+1),1/h],

dX
dB
n
	

	

=
logn
ρ(u)
	

=
(h+1)ulogn
1
	

=
(h+1)logX
1
	

≤
2logX
1
	

.

Thus, uniformly for fixed Δ>0 and X∈[n
α
,n],

B
n
	

((1+Δ)X)−B
n
	

(X)≤(
2
1
	

+o(1))
logX
ΔX
	

.
(LC)

This is the decisive slack: the b
j
	

’s have local density at most half the odd-prime density.

Fix δ>0, and form multiplicative bins

I
k
	

=[x
k
	

,x
k+1
	

),x
k+1
	

=(1+δ)x
k
	

.

Assign the b
j
	

’s lying in I
k
	

 to distinct odd primes lying in the next bin

P
k
	

=[x
k+1
	

,x
k+2
	

).

By PNT,

#P
k
	

=(1+o(1))
logx
k+1
	

δx
k+1
	

	

=(1+δ+o(1))
logx
k
	

δx
k
	

	

.

By (LC),

#{j:b
j
	

∈I
k
	

}≤(
2
1
	

+o(1))
logx
k
	

δx
k
	

	

.

So, for all large n, each next bin P
k
	

 contains more than enough primes. Assign within each bin in increasing order. The bins P
k
	

 are disjoint and increasing, so this gives an increasing odd-prime sequence p
j
′
	

 with

p
j
′
	

≥b
j
	

≥q
j
	

,
b
j
	

p
j
′
	

	

≤(1+δ)
2
(b
j
	

≤n).

The greedy construction is coordinatewise no larger than any feasible increasing assignment: by induction, if g
i
	

≤p
i
′
	

 for i<j, then p
j
′
	

 is an admissible prime for the greedy j-th choice, so g
j
	

≤p
j
′
	

. Therefore the candidate greedy sequence also satisfies

q
j
	

≤b
j
	

≤p
j
	

≤(1+δ)
2
b
j
	

(b
j
	

≤n).

Using a standard diagonal choice δ=δ(n)→0, we get

b
j
	

≤n
sup
	

b
j
	

p
j
	

	

=1+o(1).
(1)

Now compare the factorial-moment sums. Fix r≤4, and put

λ
n
	

=
b
j
	

≤n
sup
	

b
j
	

p
j
	

	

=1+o(1).

For every r-tuple I={j
1
	

<⋯<j
r
	

},

b
I
	

:=
j∈I
∏
	

b
j
	

,p
I
	

:=
j∈I
∏
	

p
j
	

,

satisfy

b
I
	

≤p
I
	

≤λ
n
r
	

b
I
	

.

Therefore

T
r
(p)
	

(n)≤T
r
(b)
	

(n),

and

T
r
(p)
	

(n)≥λ
n
−r
	

T
r
(b)
	

(n/λ
n
r
	

).

So

0≤T
r
(b)
	

(n)−T
r
(p)
	

(n)≤(1−λ
n
−r
	

)T
r
(b)
	

(n)+(T
r
(b)
	

(n)−T
r
(b)
	

(n/λ
n
r
	

)).
(2)

The first term is o(1), because T
r
(b)
	

(n)=J
r
	

+o(1)=O(1).

It remains to show that the boundary layer is o(1). This follows from the same local density bound. Partition [n
α
,n] into logarithmic cells

C
a
	

=[e
a
,e
a+1
).

By (LC),

#{j:b
j
	

∈C
a
	

}=O(e
a
/a),

and hence the reciprocal mass of one cell is

b
j
	

∈C
a
	

∑
	

b
j
	

1
	

=O(1/a)=O(1/logn),

uniformly for a∈[αlogn,logn].

For fixed A>1, the tuples with

n/A<b
j
1
	

	

⋯b
j
r
	

	

≤n

lie in O
A
	

((logn)
r−1
) possible r-tuples of logarithmic cells, because the sum of the r logarithmic cell indices is confined to an interval of bounded length. Each cell tuple contributes at most O((logn)
−r
). Hence

T
r
(b)
	

(n)−T
r
(b)
	

(n/A)=O
A
	

(1/logn)=o(1).

Apply this with A=λ
n
r
	

=1+o(1). The boundary term in (2) is o(1). Therefore

T
r
(p)
	

(n)=T
r
(b)
	

(n)+o(1)

for r=1,2,3,4. Since the Round 57 envelope gives

T
r
(b)
	

(n)=J
r
	

+o(1),

we have

T
r
(p)
	

(n)=J
r
	

+o(1).

This proves Theorem 4.1.

3. Chaining Theorem 4.1 into Theorem 2.1

Theorem 4.1 gives an increasing odd-prime sequence p
1
	

<⋯<p
K
	

 with q
j
	

≤p
j
	

 and

T
r
(p)
	

(n)=J
r
	

+o(1),r=1,2,3,4.

This is exactly the hypothesis of Theorem 2.1 with

Λ
r
	

=J
r
	

.

There is no hidden notational gap: Theorem 2.1 uses arbitrary constants Λ
r
	

, and Theorem 4.1 supplies the specific constants J
r
	

.

Therefore

L(n)≤
2
n
	

(1−J
1
	

+J
2
	

−J
3
	

+J
4
	

+o(1))=(
2
W
4
	

	

+o(1))n.

Using the supplied numerical values,

W
4
	

=1−0.7885306+0.18682−0.02009+0.001223=0.3794224,

so

2
W
4
	

	

=0.1897112<0.19.

Thus

L(n)≤(0.1897112+o(1))n<0.19n

for all sufficiently large n.

4. Sandbox verification
Code
from itertools import combinations
import math, bisect

def primes_upto(n):
    if n < 2:
        return []
    sieve = bytearray(b"\x01") * (n + 1)
    sieve[0:2] = b"\x00\x00"
    r = int(n**0.5)
    for p in range(2, r + 1):
        if sieve[p]:
            start = p * p
            sieve[start:n+1:p] = b"\x00" * (((n - start) // p) + 1)
    return [i for i in range(2, n + 1) if sieve[i]]

def odd_part(x):
    while x % 2 == 0:
        x //= 2
    return x

def is_antichain(S):
    S = sorted(S)
    for i, a in enumerate(S):
        for b in S[i+1:]:
            if b % a == 0:
                return False
    return True

def verify_injection(n=14):
    arr = list(range(2, n+1))
    antichains = 0
    for mask in range(1 << len(arr)):
        S = [arr[i] for i in range(len(arr)) if (mask >> i) & 1]
        if is_antichain(S):
            antichains += 1
            parts = [odd_part(x) for x in S]
            if len(parts) != len(set(parts)):
                return False, S, parts, antichains
    return True, None, None, antichains

print("odd-part injection exhaustive check:", verify_injection(14))

def odd_nonmultiple_count(n, primes):
    total = (n + 1) // 2
    K = len(primes)
    for r in range(1, K+1):
        s = 0
        for comb in combinations(primes, r):
            d = 1
            for p in comb:
                d *= p
            s += ((n // d) + 1) // 2
        total += (-1)**r * s
    return total

tests = [
    ((3,5,11,17,23,31), (7,13,19,29,37,43)),
    ((3,7,13,19,31), (5,11,17,23,43)),
    ((5,11,17,29), (7,13,23,31)),
]

for n in [10_000, 100_000, 1_000_000]:
    print(f"\nmonotone replacement tests, n={n}")
    for q, p in tests:
        Nq = odd_nonmultiple_count(n, q)
        Np = odd_nonmultiple_count(n, p)
        print({"q": q, "p": p, "N(q)": Nq, "N(p)": Np, "N(q)<=N(p)": Nq <= Np})

def squarefree_omega_counts(N, R=4):
    omega = bytearray(N+1)
    squarefree = bytearray(b"\x01") * (N+1)
    squarefree[0] = 0
    ps = primes_upto(N)
    for p in ps:
        for m in range(p, N+1, p):
            omega[m] += 1
        pp = p*p
        for m in range(pp, N+1, pp):
            squarefree[m] = 0
    counts = [0]*(R+1)
    for m in range(3, N+1, 2):
        if squarefree[m] and omega[m] <= R:
            counts[omega[m]] += 1
    return counts

print("\nBonferroni floor-error combinatorial counts")
for N in [10_000, 100_000, 1_000_000]:
    counts = squarefree_omega_counts(N, 4)
    E = sum(counts[1:5])
    scale = N * (math.log(math.log(N))**3) / math.log(N)
    print({"n": N, "M1..M4": counts[1:5], "E=sum": E,
           "E/n": round(E/N, 6),
           "E/(n(loglog n)^3/log n)": round(E/scale, 6)})

for N in [10_000, 100_000, 1_000_000]:
    counts = squarefree_omega_counts(N, 4)
    print(f"n={N}")
    for r in range(1,5):
        scale_r = N * (math.log(math.log(N))**(r-1)) / math.log(N)
        print(f"  r={r}: M_r={counts[r]}, M_r/n={counts[r]/N:.6f}, "
              f"M_r/scale={counts[r]/scale_r:.6f}")

J1, J2, J3, J4 = 0.7885306, 0.18682, 0.02009, 0.001223
W4 = 1 - J1 + J2 - J3 + J4
print("\nW4 computation from supplied J-values:",
      {"W4": W4, "W4/2": W4/2, "W4/2 < 0.19": W4/2 < 0.19})
Output
odd-part injection exhaustive check: (True, None, None, 732)

monotone replacement tests, n=10000
{'q': (3, 5, 11, 17, 23, 31), 'p': (7, 13, 19, 29, 37, 43), 'N(q)': 2111, 'N(p)': 3441, 'N(q)<=N(p)': True}
{'q': (3, 7, 13, 19, 31), 'p': (5, 11, 17, 23, 43), 'N(q)': 2416, 'N(p)': 3199, 'N(q)<=N(p)': True}
{'q': (5, 11, 17, 29), 'p': (7, 13, 23, 31), 'N(q)': 3305, 'N(p)': 3662, 'N(q)<=N(p)': True}

monotone replacement tests, n=100000
{'q': (3, 5, 11, 17, 23, 31), 'p': (7, 13, 19, 29, 37, 43), 'N(q)': 21120, 'N(p)': 34386, 'N(q)<=N(p)': True}
{'q': (3, 7, 13, 19, 31), 'p': (5, 11, 17, 23, 43), 'N(q)': 24179, 'N(p)': 31975, 'N(q)<=N(p)': True}
{'q': (5, 11, 17, 29), 'p': (7, 13, 23, 31), 'N(q)': 33046, 'N(p)': 36619, 'N(q)<=N(p)': True}

monotone replacement tests, n=1000000
{'q': (3, 5, 11, 17, 23, 31), 'p': (7, 13, 19, 29, 37, 43), 'N(q)': 211203, 'N(p)': 343889, 'N(q)<=N(p)': True}
{'q': (3, 7, 13, 19, 31), 'p': (5, 11, 17, 23, 43), 'N(q)': 241794, 'N(p)': 319752, 'N(q)<=N(p)': True}
{'q': (5, 11, 17, 29), 'p': (7, 13, 23, 31), 'N(q)': 330443, 'N(p)': 366198, 'N(q)<=N(p)': True}

Bonferroni floor-error combinatorial counts
{'n': 10000, 'M1..M4': [1228, 1932, 820, 75], 'E=sum': 4055, 'E/n': 0.4055, 'E/(n(loglog n)^3/log n)': 0.341205}
{'n': 100000, 'M1..M4': [9591, 18181, 10618, 2053], 'E=sum': 40443, 'E/n': 0.40443, 'E/(n(loglog n)^3/log n)': 0.31916}
{'n': 1000000, 'M1..M4': [78497, 168330, 120807, 34334], 'E=sum': 401968, 'E/n': 0.401968, 'E/(n(loglog n)^3/log n)': 0.306745}

n=10000
  r=1: M_r=1228, M_r/n=0.122800, M_r/scale=1.131030
  r=2: M_r=1932, M_r/n=0.193200, M_r/scale=0.801431
  r=3: M_r=820, M_r/n=0.082000, M_r/scale=0.153199
  r=4: M_r=75, M_r/n=0.007500, M_r/scale=0.006311
n=100000
  r=1: M_r=9591, M_r/n=0.095910, M_r/scale=1.104205
  r=2: M_r=18181, M_r/n=0.181810, M_r/scale=0.856636
  r=3: M_r=10618, M_r/n=0.106180, M_r/scale=0.204745
  r=4: M_r=2053, M_r/n=0.020530, M_r/scale=0.016201
n=1000000
  r=1: M_r=78497, M_r/n=0.078497, M_r/scale=1.084476
  r=2: M_r=168330, M_r/n=0.168330, M_r/scale=0.885662
  r=3: M_r=120807, M_r/n=0.120807, M_r/scale=0.242069
  r=4: M_r=34334, M_r/n=0.034334, M_r/scale=0.026201

W4 computation from supplied J-values: {'W4': 0.3794224, 'W4/2': 0.1897112, 'W4/2 < 0.19': True}

For a direct finite prime-rounding check, I used synthetic monotone b-prefixes satisfying q
j
	

≤b
j
	

, rounded them upward to increasing odd primes, and computed T
r
(b)
	

 and T
r
(p)
	

 exactly for r≤4.

def first_odd_primes(K):
    limit = max(100, int(20*K*math.log(K+10)))
    while True:
        ps = [p for p in primes_upto(limit) if p != 2]
        if len(ps) >= K:
            return ps[:K]
        limit *= 2

def round_up_primes(b):
    maxb = max(b)
    limit = int(maxb + 1000 + 50*len(b)*math.log(maxb + len(b) + 10))
    while True:
        ps = [p for p in primes_upto(limit) if p != 2]
        out, idx, prev = [], 0, 0
        ok = True
        for x in b:
            target = max(math.ceil(x), prev+1)
            idx = bisect.bisect_left(ps, target, lo=idx)
            if idx >= len(ps):
                ok = False
                break
            out.append(ps[idx])
            prev = ps[idx]
            idx += 1
        if ok:
            return out
        limit *= 2

def T_values(vals, n):
    vals = sorted(vals)
    K = len(vals)
    inv = [1.0/v for v in vals]
    pref = [0.0]
    for x in inv:
        pref.append(pref[-1] + x)

    T1 = pref[bisect.bisect_right(vals, n)]
    T2 = T3 = T4 = 0.0

    for i in range(K):
        vi = vals[i]
        if vi > n: break
        m = bisect.bisect_right(vals, n/vi)
        if m > i+1:
            T2 += inv[i]*(pref[m]-pref[i+1])
        for j in range(i+1, K):
            vij = vi*vals[j]
            if vij > n: break
            m = bisect.bisect_right(vals, n/vij)
            if m > j+1:
                T3 += inv[i]*inv[j]*(pref[m]-pref[j+1])
            for k in range(j+1, K):
                vijk = vij*vals[k]
                if vijk > n: break
                m = bisect.bisect_right(vals, n/vijk)
                if m > k+1:
                    T4 += inv[i]*inv[j]*inv[k]*(pref[m]-pref[k+1])

    return (T1, T2, T3, T4)

def make_test_b_range(n, K, a=0.2, c=0.5):
    qs = first_odd_primes(K)
    lo, hi = n**a, n**c
    b = []
    for j in range(K):
        x = lo * (hi/lo)**((j+0.5)/K)
        b.append(max(x, qs[j] + 0.37))
    for j in range(1, K):
        if b[j] < b[j-1]:
            b[j] = b[j-1]
    return qs, b

print("controlled bridge tests")
for n,K in [(10_000,6),(100_000,12),(1_000_000,24),(100_000_000,60)]:
    q,b = make_test_b_range(n,K,0.2,0.5)
    p = round_up_primes(b)
    Tb = T_values(b,n)
    Tp = T_values(p,n)
    print({"n":n,"K":K,"min_b":round(min(b),3),"max_b":round(max(b),3),
           "max_p/b":round(max(p[i]/b[i] for i in range(K)),6),
           "q<=b":all(q[i]<=b[i] for i in range(K)),
           "q<=p":all(q[i]<=p[i] for i in range(K))})
    print("  T_b =", tuple(round(x,8) for x in Tb))
    print("  T_p =", tuple(round(x,8) for x in Tp))
    print("  T_p - T_b =", tuple(round(Tp[i]-Tb[i],8) for i in range(4)))

Output:

controlled bridge tests
{'n': 10000, 'K': 6, 'min_b': 7.943, 'max_b': 79.433, 'max_p/b': 1.384818, 'q<=b': True, 'q<=p': True}
  T_b = (0.31960874, 0.03796138, 0.00159415, 0.0)
  T_p = (0.26925357, 0.02759694, 0.00073181, 0.0)
  T_p - T_b = (-0.05035517, -0.01036444, -0.00086233, 0.0)
{'n': 100000, 'K': 12, 'min_b': 11.548, 'max_b': 273.842, 'max_p/b': 1.125754, 'q<=b': True, 'q<=p': True}
  T_b = (0.33529017, 0.0476512, 0.00331983, 0.0)
  T_p = (0.30835679, 0.04052679, 0.00248624, 0.0)
  T_p - T_b = (-0.02693338, -0.00712441, -0.0008336, 0.0)
{'n': 1000000, 'K': 24, 'min_b': 17.278, 'max_b': 917.276, 'max_p/b': 1.188223, 'q<=b': True, 'q<=p': True}
  T_b = (0.3591247, 0.05875207, 0.00546662, 6.692e-05)
  T_p = (0.33365547, 0.05089494, 0.00434972, 3.171e-05)
  T_p - T_b = (-0.02546924, -0.00785713, -0.0011169, -3.52e-05)
{'n': 100000000, 'K': 60, 'min_b': 41.687, 'max_b': 9549.926, 'max_p/b': 1.106124, 'q<=b': True, 'q<=p': True}
  T_b = (0.27154288, 0.03515758, 0.00284648, 7.419e-05)
  T_p = (0.2638071, 0.03319662, 0.00260954, 6.257e-05)
  T_p - T_b = (-0.00773578, -0.00196096, -0.00023694, -1.162e-05)

The proof above is the rigorous part; the sandbox checks confirm the finite injectivity, monotone replacement behavior, Bonferroni error scale, and representative prime-rounding behavior.

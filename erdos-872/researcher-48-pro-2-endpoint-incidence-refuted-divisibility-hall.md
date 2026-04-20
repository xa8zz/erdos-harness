The named lemma is **false as stated**. The failure is not a constant-loss issue; it is a literal incidence failure caused by legal composites of individually illegal primes.

The endpoint-incidence condition I stated,

[
\alpha_{\mathcal F,i,e,t}=0
\quad\text{unless}\quad
s_t\in e,
]

cannot be correct once (\sigma^\star) may legally claim composites such as (91=7\cdot13). The correct incidence relation, if such a lemma is to be true, must be divisibility-based, not endpoint-based.

I verified the following finite state exactly in Python.

Take

[
n=10^6,\qquad h=4,\qquad U=(5\cdot10^5,10^6].
]

For a played antichain (A), define

[
\deg_A(x)
=========

\sum_{\substack{
m\in U\
m\ \text{squarefree}\
\Omega(m)=4\
m\ \text{incomparable with every }a\in A\
x\mid m
}}
\frac1m.
]

This is exactly the rank-(4) unresolved harmonic mass newly removed by the legal claim (x). Since (m>n/2), any legal (x) with positive degree must divide one of the unresolved rank-(4) products (m), so enumerating divisors of those (m)’s is exhaustive for (\sigma^\star).

Use Prolonger activators

[
30\cdot7,\ 30\cdot13,\ 30\cdot19,\ 30\cdot29,\ 30\cdot37,\ 30\cdot43,\ 30\cdot53,\ 30\cdot61,
]

with (\sigma^\star)-responses after the first seven activators

[
11,\ 17,\ 23,\ 31,\ 41,\ 47,\ 59.
]

After the eighth activator (30\cdot61=1830), the unique (\sigma^\star)-maximizer is the composite (91=7\cdot13).

The verified degree table is:

[
\begin{array}{c|c|c}
\text{Prolonger move} & \sigma^\star\text{ response} & \deg(\sigma^\star)\
\hline
210 & 11 & 0.011382046577424651\
390 & 17 & 0.006723872037473487\
570 & 23 & 0.004628376806804652\
870 & 31 & 0.0031606888592473005\
1110 & 41 & 0.00227788412609712\
1290 & 47 & 0.0018716142274825965\
1590 & 59 & 0.0014591532685198298\
1830 & 91 & 0.0013026100396235528
\end{array}
]

At the last state,

[
\deg(91)=0.0013026100396235528

>

# 0.0012312747277205944

\deg(67),
]

and (67) is then the smallest legal prime.

The legality check is crucial. The primes (7) and (13) are both illegal forever, because

[
7\mid 210,\qquad 13\mid 390.
]

But the composite (91) is legal, because no previous played element divides (91), and (91) divides no previous played element:

[
91\nmid 30p
\quad\text{for }p\in{7,13,19,29,37,43,53,61},
]

since each (30p) contains at most one of (7,13), and

[
30p\nmid 91
]

for size and prime-factor reasons. Also (91) is incomparable with the earlier Shortener primes (11,17,23,31,41,47,59).

Thus (\sigma^\star) legally claims a composite made from two individually illegal primes.

Now take the residue edge

[
e={7,13}.
]

The named lemma requires assigning the positive quotient mass of this edge to actual Shortener claims (s_t) with

[
s_t\in e.
]

But neither (7) nor (13) is ever a legal Shortener claim after the activators (210) and (390). Both are permanently forbidden by antichain legality. The actual (\sigma^\star)-claim that removes the corresponding rank-(4) mass is (91), and

[
91\notin {7,13}.
]

Therefore the demanded coefficients cannot exist:

[
\sum_t \alpha_{e,t}=1
\quad\text{and}\quad
\alpha_{e,t}=0\text{ unless }s_t\in{7,13}
]

are incompatible, because the endpoint-neighborhood of (e) is empty.

So the original Legal Activator-Quient Incidence Budget Lemma is rigorously refuted.

The exact sharper replacement is the following.

**Divisibility-Hall Legal Exposure Criterion.**

Let (\mathcal E) be the finite family of counted quotient atoms, with positive demands (q_a). For a prime-edge atom (a=e={u,v}), its residue product is

[
r(a)=uv.
]

Let (T) be the set of actual legal (\sigma^\star)-claims, with capacities

[
c_t=C\kappa_h,\mu(u_t).
]

Define the legal divisibility-neighborhood relation

[
a\sim t
\quad\Longleftrightarrow\quad
s_t\mid r(a)
]

or, more generally, (s_t) is the legal claim that actually removes the unresolved rank-(h) facets represented by (a).

Then coefficients

[
\alpha_{a,t}\in[0,1],
\qquad
\alpha_{a,t}=0\text{ unless }a\sim t,
]

with

[
\sum_t\alpha_{a,t}=1
\quad\text{for every }a,
]

and

[
\sum_a \alpha_{a,t}q_a\le c_t
\quad\text{for every }t
]

exist **if and only if** the following Hall-Carleson inequalities hold for every subfamily (\mathcal X\subseteq\mathcal E):

[
\boxed{
\sum_{a\in\mathcal X} q_a
\le
\sum_{t:\exists a\in\mathcal X,\ a\sim t} c_t.
}
]

This is not a research direction; it is a necessary and sufficient finite inequality. It is decidable by a max-flow computation.

Proof: build a bipartite flow network with source connected to each atom (a) by capacity (q_a), edges (a\to t) of infinite capacity whenever (a\sim t), and claim nodes (t) connected to the sink by capacity (c_t). A feasible full flow of value (\sum_a q_a) gives

[
\alpha_{a,t}=\frac{f(a,t)}{q_a}.
]

Conversely, any such (\alpha) gives a full flow. By max-flow/min-cut, a full flow exists exactly when every atom subfamily has enough claim-neighborhood capacity, which is precisely the displayed Hall-Carleson condition.

This sharper criterion handles all three obstructions mechanically:

Burst-star multiplicity is tested by taking (\mathcal X) to be all atoms first-hit by the burst. If one claim has too little capacity, Hall fails.

Sparse matching-star residues are tested by taking (\mathcal X) to be any sparse matching subfamily. Low local degree or low defect-three density does not matter; the criterion asks whether the actual legal claims touching that residue family have enough capacity.

Cross-activator composites are handled because the correct neighbor of (e={7,13}) is (91), not (7) or (13). The endpoint version has empty neighborhood and is false; the divisibility version has (91) in the neighborhood and then asks the real budget question:

[
q_{{7,13}}
\le
C\kappa_h,\mu(u_{91}).
]

That is the strictly sharper decidable inequality. The looser endpoint-incidence lemma cannot bypass it, because in the verified state the endpoint Hall inequality reads

[
q_{{7,13}}\le 0,
]

while (q_{{7,13}}>0), witnessed by

[
\deg(91)=0.0013026100396235528.
]

Here is the Python verifier I used:

```python
import sympy as sp
from collections import defaultdict

n = 10**6
h = 4
U_low = n // 2

# Generate all squarefree rank-4 products in U=(n/2,n].
primes = list(sp.primerange(2, n + 1))
products = []
divisor_lists = []

def gen(start, k, prod, fs):
    if k == 0:
        if U_low < prod <= n:
            products.append(prod)
            divs = [1]
            for p in fs:
                divs += [d * p for d in divs[:]]
            divisor_lists.append([d for d in divs if d > 1])
        return

    for idx in range(start, len(primes)):
        p = primes[idx]
        if prod * p > n:
            break
        gen(idx + 1, k - 1, prod * p, fs + [p])

gen(0, h, 1, [])

def legal(x, A):
    return all((a % x != 0) and (x % a != 0) for a in A)

def degree_map(A):
    deg = defaultdict(float)

    for m, divs in zip(products, divisor_lists):
        if legal(m, A):
            w = 1.0 / m
            for d in divs:
                deg[d] += w

    # Exhaustive: any positive-degree claim must divide some unresolved rank-4 m.
    return {d: v for d, v in deg.items() if legal(d, A)}

def sigma_star(A):
    deg = degree_map(A)
    return max(deg.items(), key=lambda kv: (kv[1], -kv[0]))

P_leaves = [7, 13, 19, 29, 37, 43, 53, 61]
expected_S = [11, 17, 23, 31, 41, 47, 59, 91]

A = []
rows = []

for j, p in enumerate(P_leaves):
    F = 30 * p
    assert legal(F, A), f"Prolonger move {F} is illegal"
    A.append(F)

    s, d = sigma_star(A)
    rows.append((F, s, d))
    assert s == expected_S[j], (F, s, expected_S[j], d)

    if j < 7:
        assert legal(s, A), f"Shortener move {s} is illegal"
        A.append(s)

# Last state: after Prolonger has played 30*61, before Shortener claims 91.
deg = degree_map(A)

print("rank-4 products in U:", len(products))
for row in rows:
    print(row)

print("legal(7):", legal(7, A))
print("legal(13):", legal(13, A))
print("legal(91):", legal(91, A))
print("deg(91):", deg[91])
print("deg(67):", deg[67])
```

The decisive output is:

```text
rank-4 products in U: 49601
(210, 11, 0.011382046577424651)
(390, 17, 0.006723872037473487)
(570, 23, 0.004628376806804652)
(870, 31, 0.0031606888592473005)
(1110, 41, 0.00227788412609712)
(1290, 47, 0.0018716142274825965)
(1590, 59, 0.0014591532685198298)
(1830, 91, 0.0013026100396235528)
legal(7): False
legal(13): False
legal(91): True
deg(91): 0.0013026100396235528
deg(67): 0.0012312747277205944
```

So the endpoint-incidence lemma is definitively false. The exact decidable replacement is the Divisibility-Hall Legal Exposure Criterion above.

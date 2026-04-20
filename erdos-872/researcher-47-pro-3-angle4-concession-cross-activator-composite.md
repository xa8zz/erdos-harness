The angle closes as a **precise concession**, not as a Prolonger lower-bound refutation.

The obstruction is sharper than the listed failed attempts: the “smallest legal prime” conclusion does not follow from the stated (\sigma^\star) degree comparisons in the actual antichain game. A legal composite can have all of its prime factors individually illegal, because those prime factors may divide different earlier Prolonger moves. Such a composite can have larger rank-(h) harmonic degree than the smallest legal prime, and then (\sigma^\star) is forced to play the composite.

That breaks the prime-only forced-dynamics template needed by the proposed activator-quotient proof/refutation.

Here is the finite, exact counterexample I verified in the Python sandbox.

Take (n=10^6), (h=4), and let rank-(4) facets be squarefree products of four primes in

[
U=(500000,1000000].
]

Use harmonic degree

[
\deg_t(x)=\sum_{\substack{m\in U\ m\text{ squarefree},\ \omega(m)=4\ m\text{ unresolved at }t\ x\mid m}}\frac1m.
]

Consider the following legal prefix. Prolonger repeatedly plays (30q=2\cdot3\cdot5\cdot q):

[
\begin{aligned}
&210,\ 390,\ 570,\ 870,\ 1110,\ 1290,\ 1590,\ 1830,
\end{aligned}
]

with Shortener’s first seven (\sigma^\star) replies

[
11,\ 17,\ 23,\ 31,\ 41,\ 47,\ 59.
]

So immediately before Shortener’s eighth reply, the chosen set is

[
A={210,11,390,17,570,23,870,31,1110,41,1290,47,1590,59,1830}.
]

All these moves are legal. The smallest legal prime at this state is (67). However the composite

[
91=7\cdot 13
]

is also legal: (7) divides the earlier Prolonger move (210), (13) divides the earlier Prolonger move (390), but (91) is not comparable by divisibility with either (210) or (390), nor with any other chosen element.

The exact harmonic degrees are:

[
\deg(91)=0.00130261003962355\ldots,
]

while

[
\deg(67)=0.00123127472772059\ldots.
]

In fact, exact enumeration gives the top candidates:

[
91,\ 67,\ 71,\ 73,\ 79,\ 83,\ 89,\ 133,\ldots
]

so (\sigma^\star) plays the legal composite (91), not the smallest legal prime (67).

The relevant verifier is self-contained except for ordinary Python arithmetic; it uses exact rational sums for the degree comparison.

```python
from itertools import combinations
from fractions import Fraction
from math import prod

n = 10**6
h = 4

def primes_upto(N):
    sieve = bytearray(b"\x01") * (N + 1)
    sieve[0:2] = b"\x00\x00"
    p = 2
    while p * p <= N:
        if sieve[p]:
            step = p
            start = p * p
            sieve[start:N+1:step] = b"\x00" * (((N - start) // step) + 1)
        p += 1
    return [i for i in range(N + 1) if sieve[i]]

primes = primes_upto(n)

def legal(x, chosen):
    if x < 2 or x > n or x in chosen:
        return False
    return all(x % a != 0 and a % x != 0 for a in chosen)

chosen = [
    210, 11,
    390, 17,
    570, 23,
    870, 31,
    1110, 41,
    1290, 47,
    1590, 59,
    1830
]

# enumerate rank-4 squarefree facets in U=(n/2,n]
facets = []
for a_i in range(len(primes)):
    a = primes[a_i]
    if a**4 > n:
        break
    for b_i in range(a_i + 1, len(primes)):
        b = primes[b_i]
        if a*b*b*b > n:
            break
        for c_i in range(b_i + 1, len(primes)):
            c = primes[c_i]
            if a*b*c*c > n:
                break
            for d_i in range(c_i + 1, len(primes)):
                d = primes[d_i]
                m = a*b*c*d
                if m > n:
                    break
                if m > n // 2:
                    facets.append((a,b,c,d,m))

def unresolved(m):
    return all(m % a != 0 and a % m != 0 for a in chosen)

unresolved_facets = [f for f in facets if unresolved(f[-1])]

def degree(x):
    s = Fraction(0, 1)
    count = 0
    for *fs, m in unresolved_facets:
        if m % x == 0:
            s += Fraction(1, m)
            count += 1
    return count, s

def smallest_legal_prime():
    for p in primes:
        if legal(p, chosen):
            return p
    return None

p = smallest_legal_prime()
cnt91, deg91 = degree(91)
cntp, degp = degree(p)

print("smallest legal prime:", p)
print("91 legal:", legal(91, chosen))
print("count degree 91:", cnt91)
print("count degree p:", cntp)
print("harmonic degree 91:", float(deg91))
print("harmonic degree p:", float(degp))
print("91 beats p exactly:", deg91 > degp)
```

The output is:

```text
smallest legal prime: 67
91 legal: True
count degree 91: 940
count degree p: 891
harmonic degree 91: 0.00130261003962355
harmonic degree p: 0.00123127472772059
91 beats p exactly: True
```

This does not violate the true inequality

[
\deg_t(R)\le \min_{r\mid R}\deg_t(r),
]

because (7) and (13) themselves are not legal singleton moves. The invalid step is the inference from that inequality to “(\sigma^\star) claims the smallest remaining legal prime.” That inference requires every legal composite to have at least one legal prime divisor. The antichain game does not have that property.

This is the exact failure mechanism for the natural Prolonger refutation strategy. A common-base construction can protect many leaves (q_i) by playing (Bq_i), but once several leaves have been protected, composites such as (q_iq_j) become legal even though each (q_i) is individually illegal as a singleton. When the smallest legal prime has been pushed far enough upward, those cross-activator composites have larger rank-(h) harmonic degree than the next legal prime. Then true (\sigma^\star) starts claiming them and dismantles the would-be product family.

The missing statement is therefore the following, and it is genuinely additional; it is not a consequence of strong freshness, local usefulness, dense-packet absorption, or the prime monotonicity lemma.

**Cross-Activator Composite Quotient Budget Lemma.**
For central (h), let (\mathcal R_h(t)) be the unresolved rank-(h) squarefree family at time (t). Let (\mathcal X_t) be the legal squarefree composites (r) such that every prime factor of (r) is individually illegal because it appears in some earlier Prolonger move, but no earlier chosen element is comparable with (r). Define

[
\deg_t(r)=\mu{m\in \mathcal R_h(t): r\mid m}.
]

Let (Q_h^\times) be the total activator-quotient mass whose first valid (\sigma^\star)-certificate lies in (\mathcal X_t), rather than at a legal prime. A proof of the conjectured sharp upper rate needs the uniform bound

[
Q_h^\times \ \le\ C,\frac{h^2}{\log n},N_h
]

for all legal plays against (\sigma^\star), with an absolute constant (C).

Equivalently, any activator-quotient state inequality must include a separate cross-composite term:

[
\mu(\operatorname{Cl}_h^{\mathrm{sf,lu}})
\ \le
C\bigl(Q_h^{\mathrm{prime}}+Q_h^\times\bigr),
]

together with both budgets

[
Q_h^{\mathrm{prime}}\le C,\frac{h^2}{\log n}N_h,
\qquad
Q_h^\times\le C,\frac{h^2}{\log n}N_h.
]

The existing ingredients do not supply the second budget. Strong freshness is a condition on individual shields; it does not prevent quotients assembled from prime factors belonging to different earlier activators. Local usefulness only controls local replacement geometry; it does not rule out high-degree legal composites with no legal prime divisor. Dense-packet projection misses sparse matching-star support, and burst-star multiplicity means one cross-composite can interact with many first-hit certificates at once.

So the definitive concession is:

[
\boxed{\text{The angle requires the Cross-Activator Composite Quotient Budget Lemma.}}
]

Without that lemma, the stated (\sigma^\star) dynamics are insufficient, and the proposed (N_h/\log h) Prolonger refutation cannot be made rigorous. The R35 residual remains an upper-bound artifact, not a forceable lower bound, and the missing obstruction is precisely the unbudgeted legal composite quotient class illustrated above.

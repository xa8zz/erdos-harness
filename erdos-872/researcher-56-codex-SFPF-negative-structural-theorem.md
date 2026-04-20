After checking the saved state in [current_state.md](/Users/omisverycool/.codex/worktrees/a43b/erdos-harness/erdos-872/current_state.md), plus the latest focused writeups [researcher-56-pro-tau-sf-refuted-upper-half-dyadic-shielding.md](/Users/omisverycool/.codex/worktrees/a43b/erdos-harness/erdos-872/researcher-56-pro-tau-sf-refuted-upper-half-dyadic-shielding.md) and [researcher-54-pro-sigma-star-audit-class-C-named-shortener-class.md](/Users/omisverycool/.codex/worktrees/a43b/erdos-harness/erdos-872/researcher-54-pro-sigma-star-audit-class-C-named-shortener-class.md), I do not have a full proof of either sharp rate. The strongest rigorous outcome supported by the current inventory is the following negative structural theorem, which your prompt explicitly permits.

**Theorem**
Define the `SFPF(P,q_0)` technique class as follows. Fix a packet `P` of odd primes and `q_0 >= 1`. A Shortener proof scheme belongs to `SFPF(P,q_0)` if, until no legal packet-separator
\[
s_Q=\prod_{p\in Q}p,\qquad \varnothing\neq Q\subseteq P,\ |Q|\le q_0
\]
exists, it only plays such separators; afterwards, until no legal prime exists, it only plays primes. Then no `SFPF(P,q_0)` scheme can prove `L(n)=O(r_1(n))`. More strongly, Prolonger can force the end of those two phases after
\[
S+O(n/\log n)\qquad\text{with }S=\sum_{j\le q_0}\binom{|P|}{j},
\]
while still leaving `Omega(n)` unused legal composite moves in `U=(n/2,n]`. For the literal `\tau_{SF}` in your prompt, `S=n^{1/8+o(1)}=o(r_1(n))`, so the obstruction appears after `o(r_1(n))` Prolonger moves.

**Proof**
1. Prolonger first plays any even `u_0 in U`. Then prime `2` is illegal forever.
2. During the separator phase, if Shortener’s next legal move would be `d=s_Q`, Prolonger instead plays `2^a d in U` with `n/2<2^a d<=n`. This is legal: all previous Prolonger moves lie in `U`, and if a previous Shortener separator `s_R` divided `2^a d`, then `s_R|d`, so `R subseteq Q`, contradicting the legality of `d`.
3. Hence each Prolonger move permanently kills one legal separator. There are at most `S` separator integers, so after at most `S` such moves no legal separator remains.
4. At that point no packet prime is legal, since a legal packet prime would itself be a legal singleton separator.
5. In the prime phase, Prolonger repeatedly takes the maximal consecutive block `B_i` of current legal odd primes starting from the smallest one, with product `D_i<=n`. Then either `D_i>sqrt n` or this was the last block. Because no packet prime is legal, `D_i` has no packet factor; because its factors are current legal primes, no previously played Shortener prime divides `D_i`. So `2^{a_i}D_i in U` is legal and kills every prime in `B_i`.
6. Every full block has `log D_i > (1/2)log n`, so there are `O(n/log n)` such Prolonger blocks by `theta(n)=O(n)`. If `q_i` is Shortener’s `i`th prime reply, then `theta(q_i) >= (i-1)(1/2)\log n`, hence `q_i >> i log n`, so
\[
\sum_i \frac1{q_i}=O(1).
\]
7. Let `R` be `P` together with all Shortener-played primes. Then `sum_{p in P}1/p = O(1/\log Y)=o(1)` and `sum_{q_i}1/q_i=O(1)`, so `sum_{r in R}1/r <= M` for some absolute `M`.
8. Apply a standard one-dimensional lower-bound sieve to the odd integers `m in (n/4,n/2]` avoiding all primes in `R`. Their count is
\[
\gg n\prod_{r\in R}\Bigl(1-\frac1r\Bigr).
\]
Since all `r` are odd, `-\log(1-1/r)<=2/r`, so the product is `>= exp(-2M+o(1))`. Thus there are `c n` such `m`.
9. For each such `m`, the number `2m in U` is composite and is divisible by no Shortener separator (every separator has a packet-prime factor) and by no Shortener prime. Distinct numbers in `U` are pairwise incomparable, so after subtracting Prolonger’s earlier `S+O(n/log n)` upper-half moves, `Omega(n)` legal composites remain.

That proves the theorem. If one interprets the incomplete `\tau_{SF}` by “pass once no separator/prime exists,” then Prolonger simply keeps taking those composites, so `L_{\tau_{SF}}(n) >= c n = \omega(r_1(n))`. If instead one adds a composite fallback, that is a different strategy outside `SFPF`; the composite phase is exactly the missing hard part.

**Sandbox**
```python
import math

def sieve(n):
    spf=list(range(n+1)); primes=[]
    for i in range(2,n+1):
        if spf[i]==i:
            primes.append(i)
            if i*i<=n:
                for j in range(i*i,n+1,i):
                    if spf[j]==j: spf[j]=i
    return primes

def prime_blocks(n, packet_primes=()):
    rem=[p for p in sieve(n) if p!=2 and p not in set(packet_primes)]
    shortener=[]; blocks=[]
    while rem:
        prod=1; k=0
        while k<len(rem) and prod*rem[k]<=n:
            prod*=rem[k]; k+=1
        blocks.append((rem[:k], prod))
        rem=rem[k:]
        if rem:
            shortener.append(rem[0])   # worst reciprocal mass
            rem=rem[1:]
    return shortener, blocks

def good_even_composites(n, bad_primes):
    lo, hi = n//4 + 1, n//2
    bad=sorted(set(p for p in bad_primes if p!=2))
    cnt=0
    for m in range(lo, hi+1):
        if m%2==0: continue
        if all(m%p for p in bad if p<=m): cnt += 1
    return cnt

for H in [20,40,80]:
    h=H; q0=h//4; ln_n=math.exp(H)
    lnS=(q0+1)*(math.log(2)+ln_n/(2*h))
    lnr1=ln_n + 2*math.log(h) - H
    print("H",H,"ln(S/r1)=",lnS-lnr1)

for n in [100000, 1000000]:
    h=max(1,int(math.log(math.log(n))))
    Y=int(n**(1/(2*h)))
    P=[p for p in sieve(n) if Y<=p<=2*Y]
    shortener, blocks = prime_blocks(n, P)
    bad=set(P)|set(shortener)
    print(n, sum(1/p for p in shortener), good_even_composites(n,bad))
```

```text
H 20 ln(S/r1)= -412390397.931
H 40 ln(S/r1)= -2.0301979264692973e+17
H 80 ln(S/r1)= -4.813415696441862e+34
100000 0.494088 4891
1000000 0.55462 48179
```

Those checks match the proof’s quantitative claims: the separator budget is negligible against `r_1`, the prime-fallback reciprocal mass stays bounded, and a positive-density upper-half composite reservoir survives.

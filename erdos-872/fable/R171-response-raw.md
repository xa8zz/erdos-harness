# Proof of L(n) o(n)

conversation_id: 6a5821f8-663c-83e8-b676-17bfa57bf9d1
n_messages: 37

---

## [system] (model=n/a, content_type=text, time=null)



## [system] (model=n/a, content_type=text, time=null)



## [user] (model=n/a, content_type=text, time=1784160760.192) [TRUNCATED]

Don't search the internet. This is a test to see how well you can craft non-trivial, novel and creative proofs given a "primitive sets and divisibility games" math problem. Provide a full unconditional proof or disproof of the problem.

## Problem

For n >= 2, two players alternately choose previously unchosen integers from {2,...,n}, always keeping the chosen set an antichain under divisibility (a primitive set). The game ends when the set is maximal (no further integer can be added while keepi...[truncated user msg]

## [tool] (model=gpt-5-6-pro, content_type=text, time=1784160761.309372)



## [assistant] (model=gpt-5-6-pro, content_type=thoughts, time=1784160774.929213)

**Analyzing strategy**
I need to deeply explore a mathematical strategy involving a poset and divisibility game. The goal is to construct a proof addressing whether the minimal/maximal chain length is sublinear or linear, requiring rigorous reasoning.

Analyzed strategy

## [assistant] (model=gpt-5-6-pro, content_type=text, time=1784160783.783631)

I’ll pursue both directions globally: a nonadditive blocker-tree Shortener potential and a positive-density Prolonger construction, while stress-testing against the known shell, compatibility, capacity, and terminal-delay failures.

## [assistant] (model=gpt-5-6-pro, content_type=thoughts, time=1784160787.060681)

**Exploring game theory strategy**
I’m exploring a strategy in a comparison graph game, focusing on independence sets and how both players can maximize or minimize their goals. I’ll check if behavioral strategies like pairing can help force the desired outcomes.

Explored game theory strategy

## [assistant] (model=gpt-5-6-pro, content_type=thoughts, time=1784160810.044736)

**Exploring game dynamics**
I’m thinking about a strategy where the player blocks multiples of primes to control the game, using sieving and divisor-based moves. I need to explore how to manage compatibility and optimize efficiency.

## [assistant] (model=gpt-5-6-pro, content_type=thoughts, time=1784160812.26049)

**Modeling prime-based strategy**
I’m analyzing a strategy where players select primes to block multiples, creating a complex interplay between activated primes, divisors, and primes’ protection. I’m considering how recursion, load balancing, and legal moves impact outcomes.

Modeled prime-based strategy

## [assistant] (model=gpt-5-6-pro, content_type=code, time=1784160763.158771)

from functools import lru_cache
from itertools import combinations

def game_value(n, edges):
    adj=[0]*n
    for i,j in edges:
        adj[i]|=1<<j
        adj[j]|=1<<i
    @lru_cache(None)
    def rec(mask, turn): # turn 0 max P,1 min S; mask independent
        legal=[]
        blocked=mask
        # legal v not in mask no adjacency to mask
        for v in range(n):
            if not (mask>>v)&1 and (adj[v]&mask)==0:
                legal.append(v)
        if not legal:
            return mask.bit_count()
        vals=[rec(mask|1<<v,1-turn) for v in legal]
        return max(vals) if turn==0 else min(vals)
    return rec(0,0)

def find_nonmonotone(maxn=6):
    for n in range(2,maxn+1):
        all_edges=list(combinations

## [assistant] (model=gpt-5-6-pro, content_type=text, time=1784163306.849667)

Shortener can exhaust legal primes in \(o(n)\) turns, but this alone leaves positive-density survivors; any further gain must exploit composite cross-bin divisors and chronology.

## [assistant] (model=n/a, content_type=thoughts, time=1784163376.127336)

Evaluated game values and monotonicity for various settings

## [assistant] (model=gpt-5-6-pro, content_type=code, time=1784163199.375875)

import math
def max_degree_second_shell(n,A):
    Aset=set(A)
    # legal x wrt A
    Q=[x for x in range(n//4+1,n//2+1) if all(not is_comparable(x,a) for a in A)]
    legal_d=[]
    maxdeg=0; arg=None
    for d in range(2,n//4+1):
        if all(not is_comparable(d,a) for a in A):
            deg=sum(1 for x in Q if x%d==0)
            if deg>maxdeg: maxdeg=deg;arg=d
    return len(Q),maxdeg,arg
for n in [1000,2000,5000]:
    t=n//int(math.log(n))
    A=list(range(n-t+1,n+1))
    print(n,t,max_degree_second_shell(n,A))


## [assistant] (model=gpt-5-6-pro, content_type=text, time=1784163850.466734)

Shortener rigorously clears at least \((\log 2/4+o(1))n\) upper-half targets from clean \(p>\sqrt n\) fibers in \(o(n)\) replies. The unresolved \(\sqrt n\)-smooth core still needs nonadditive cross-band control.

## [tool] (model=gpt-5-6-pro, content_type=execution_output, time=1784163374.2380233)

1000 166 (112, 1, 201)
2000 285 (262, 1, 334)
5000 625 (729, 2, 715)


## [assistant] (model=n/a, content_type=thoughts, time=1784164191.814857)

Computed maximum legal divisor degree and evaluated activation area

## [assistant] (model=gpt-5-6-pro, content_type=code, time=1784163815.125891)

from functools import lru_cache
import itertools, random, math

def game_value_graph(adj, max_starts=True):
    n=len(adj)
    # legal vertices relative to independent set mask: not in mask and no adj to mask
    @lru_cache(None)
    def f(mask, turn): # turn 0 max,1 min; remaining game length from here incl future
        legal=[v for v in range(n) if not(mask>>v&1) and (adj[v]&mask)==0]
        if not legal: return 0
        vals=[1+f(mask|1<<v,1-turn) for v in legal]
        return max(vals) if turn==0 else min(vals)
    return f(0,0)

def min_maximal_independent(adj):
    n=len(adj)
    best=n+1
    for mask in range(1<<n):
        # independent
        ok=True
        for v in

## [assistant] (model=gpt-5-6-pro, content_type=code, time=1784164674.207154)

{"query":"Retrieve the user's prior discussions and any detailed attempted proofs, counterexamples, lemmas, or failure analyses for the primitive-set divisibility game conjecture L(n)=o(n), especially global blocker-tree potentials, asynchronous largest-prime-band recursion, terminal maximality certificates, second-shell clearing, and any prior assistant derivations not fully included in the current prompt. I need the exact mathematical content to continue rather than repeat failed routes."}

## [assistant] (model=gpt-5-6-pro, content_type=thoughts, time=1784165161.833504)

**Approaching problem from scratch**
I need to solve this math problem using previous work while providing a deep proof. I’ll start fresh, avoid referencing the web, and thoroughly analyze the game for insights or patterns.

Approached problem from scratch

## [assistant] (model=gpt-5-6-pro, content_type=thoughts, time=1784165174.135897)

**Analyzing the game strategy**
I’m formalizing the game with divisibility and making small simulations for combinatorial exploration. I’ll focus on understanding the strategy for minimizing moves and determining how moves create isolated game states.

Analyzed the game strategy

## [assistant] (model=gpt-5-6-pro, content_type=thoughts, time=1784165184.921718)

**Analyzing prime strategy**
I’m considering how to handle composites and primes, and how each move by Short ener and Pro longer affects the remaining game space. Blocking primes and selecting composites seems crucial.

Analyzed prime strategy

## [assistant] (model=gpt-5-6-pro, content_type=thoughts, time=1784165196.507686)

**Exploring divisor strategy**
I’m considering how Short ener probes divisors and Pro longer blocks them, leading to a recursive structure. The goal is to measure how blocked divisors affect the potential moves and game dynamics.

Explored divisor strategy

## [assistant] (model=gpt-5-6-pro, content_type=code, time=1784165151.294174)

from functools import lru_cache
def game_n(n):
    vals=list(range(2,n+1))
    m=len(vals)
    comp=[0]*m
    for i,x in enumerate(vals):
        mask=0
        for j,y in enumerate(vals):
            if x%y==0 or y%x==0:
                mask|=1<<j
        comp[i]=mask
    # state legal mask? At any position, legal items. Selecting i updates legal &= ~comp[i].
    @lru_cache(None)
    def F(legal, turn): # returns optimal remaining moves from legal, Prolonger max if turn0, Shortener min turn1
        if legal==0: return 0
        moves=[]
        lm=legal
        while lm:
            b=lm & -lm; i=b.bit_length()-1; lm-=b
            moves.append(1+F(legal & ~comp[i],1-turn))
        return max(moves) if turn==0 else min(moves)
    full=(1<<m)-1
    val=F(full,0)
    # principal variation
    legal=full; turn=0; pv=[]
    while legal:
        choices=[]
        lm=legal
        while lm:
            b=lm&-lm;i=b.bit_length()-1;lm-=b
            v=1+F(legal&~comp[i],1-turn)
            choices.append((v,vals[i]))
        target=max(v for

## [assistant] (model=gpt-5-6-pro, content_type=text, time=1784165476.679839)

An asynchronous tagged-cone recursion avoids simultaneous-local-reply assumptions, but two-tag packets allow linear stale-reply backlog. Separately, a sublinear selected set cannot fully prepare a linear macroscopic root cohort.

## [tool] (model=gpt-5-6-pro, content_type=execution_output, time=1784165296.986668)

2 1 [2] 2
3 2 [2, 3] 4
4 2 [2, 3] 4
5 3 [2, 3, 5] 8
6 3 [2, 3, 5] 12
7 4 [2, 3, 5, 7] 24
8 4 [2, 3, 5, 7] 24
9 5 [6, 4, 5, 7, 9] 44
10 5 [6, 4, 5, 7, 9] 52
11 6 [6, 4, 5, 7, 9, 11] 104
12 6 [6, 4, 5, 7, 9, 11] 136
13 7 [6, 4, 5, 7, 9, 11, 13] 272
14 7 [6, 4, 5, 7, 9, 11, 13] 288
15 7 [6, 5, 4, 7, 9, 11, 13] 572
16 7 [6, 5, 4, 7, 9, 11, 13] 572
17 8 [6, 5, 4, 7, 9, 11, 13, 17] 1144
18 8 [6, 5, 4, 7, 9, 11, 13, 17] 1432
19 9 [6, 5, 4, 7, 9, 11, 13, 17, 19] 2864
20 9 [6, 5, 4, 7, 9, 11, 13, 17, 19] 3280


## [assistant] (model=n/a, content_type=thoughts, time=1784165514.841359)

Evaluated Shortener and Prolonger game strategies

## [assistant] (model=gpt-5-6-pro, content_type=code, time=1784165316.206403)

{"queries":["+(W_4) +(0.1897123371) labelled odd-part Bonferroni prime-rounding upper bound divisibility antichain game","+(labelled odd-part comparison) +(monotone replacement) fourth-order Bonferroni idealized bin construction actual primes","+(primitive sets divisibility game) upper bound 0.1897123371 W4"],"source_filter":["file_library"]}

## [tool] (model=gpt-5-6-pro, content_type=text, time=1784165514.657379)



## [tool] (model=gpt-5-6-pro, content_type=tether_browsing_display, time=1784165515.449859)

# 【0†Pasted text.txt†file_000000009bb471f590f71621a3f1aa3c】
File created at: 2026-04-29T20:30:52Z
File last modified at: 2026-04-29T20:30:52Z
Content source: Source.file
Title: Pasted text.txt
Citation Marker: fileciteturn0file0
Content Snippet:
Don't search the internet. This is a test to see how well you can craft non-trivial, novel and creative proofs given a "primitive sets and divisibility games" math problem. Provide a full unconditional proof or disproof of the problem.

## Problem

Let $n \geq 2$. Two players alternately pick integers from $\{2, 3, \ldots, n\}$ to add to a common set $A$, subject to the constraint that $A$ remain primitive: no element of $A$ divides another. The game ends when no legal move is possible. One player ("Prolonger") wants the game to last as long as possible; the other ("Shortener") wants it to end as quickly as possible. Let $L(n)$ be the guaranteed game length under optimal play, with Prolonger moving first.

Determine $L(n)$ asymptotically. In particular, decide whether $L(n) = \Theta(n)$ or $L(n) = o(n)$, and if sublinear, give the sharp rate.

## Known progress

### Upper bounds

- **$L(n) \leq (0.18969 + o(1)) n$**, with constant $W_4/2 \leq 0.1897123371$ (interval-arithmetic certified). Method: Shortener plays the prefix $\sigma_{15}$ of smallest legal odd primes. The number $K$ of played odd primes satisfies a fourth-order finite Bonferroni inclusion-exclusion. The proof uses (a) odd-part injection from antichains in $\{2, \ldots, n\}$ to antichains of odd integers, (b) monotone replacement comparing the played-prime sequence $p_1 < p_2 < \cdots$ to a model bin-sequence $b_1 < b_2 < \cdots$ with $\sup_j p_j/b_j = 1 + o(1)$ via a greedy diagonal assignment, (c) factorial-moment transfer $T_r^{(p)}(n) = T_r^{(b)}(n) + o(1) = J_r + o(1)$ where the $J_r$ are simplex integrals $J_r = (1/r!) \int_{\Delta_r} \prod du_i / (1 + u_i)$, and (d) the fourth-order Bonferroni inequality $\#\{\text{survivors}\} \geq \sum_{r=0}^{4} (-1)^r T_r$. Optimization gives the constant $W_4/2$; the Lean endgame reduction is verified, the prose envelope-inversion / prime-rounding bridge has been independently audited.

- **$L(n) \leq (5/16 + o(1)) n$** (zero-sorry Lean). Method: for every $A > 2$, the second-order Bonferroni applied to the truncated odd-prime prefix of length $k = n / (2A \log n)$ gives $L(n) \leq (1/2 - 1/(2A) + 1/(4A^2) + o(1)) n$. Optimization $A \to 2$ yields $5/16$. Combinatorial core formalized: algebraic optimization $g(2) = 5/16$, odd-part injectivity on antichains, harmonic sum lower bound, Bonferroni sieve, antichain-complement DFree bound, game-value induction.

- **$L(n) \leq (13/36 + o(1)) n$** (zero-sorry Lean). Earlier intermediate bound, superseded by $5/16$ via the longer-prefix optimization above.
# 【1†Pasted text.txt†file_00000000e570722fb7ed727c6c09b136】
File created at: 2026-04-29T23:06:51Z
File last modified at: 2026-04-29T23:06:51Z
Content source: Source.file
Title: Pasted text.txt
Citation Marker: fileciteturn0file1
Content Snippet:
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
# 【2†Pasted text.txt†file_00000000e570722fb7ed727c6c09b136】
File created at: 2026-04-29T23:06:51Z
File last modified at: 2026-04-29T23:06:51Z
Content source: Source.file
Title: Pasted text.txt
Citation Marker: fileciteturn0file2
Content Snippet:
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
# 【3†Pasted text.txt†file_000000009bb471f590f71621a3f1aa3c】
File created at: 2026-04-29T20:30:52Z
File last modified at: 2026-04-29T20:30:52Z
Content source: Source.file
Title: Pasted text.txt
Citation Marker: fileciteturn0file3
Content Snippet:
\int_{\Delta_r} \prod du_i / (1 + u_i)$, and (d) the fourth-order Bonferroni inequality $\#\{\text{survivors}\} \geq \sum_{r=0}^{4} (-1)^r T_r$. Optimization gives the constant $W_4/2$; the Lean endgame reduction is verified, the prose envelope-inversion / prime-rounding bridge has been independently audited.

- **$L(n) \leq (5/16 + o(1)) n$** (zero-sorry Lean). Method: for every $A > 2$, the second-order Bonferroni applied to the truncated odd-prime prefix of length $k = n / (2A \log n)$ gives $L(n) \leq (1/2 - 1/(2A) + 1/(4A^2) + o(1)) n$. Optimization $A \to 2$ yields $5/16$. Combinatorial core formalized: algebraic optimization $g(2) = 5/16$, odd-part injectivity on antichains, harmonic sum lower bound, Bonferroni sieve, antichain-complement DFree bound, game-value induction.

- **$L(n) \leq (13/36 + o(1)) n$** (zero-sorry Lean). Earlier intermediate bound, superseded by $5/16$ via the longer-prefix optimization above.

- **Shield reduction**: for any Prolonger upper-prefix $P \subseteq U = (n/2, n]$, every eventual maximal $A$ satisfies $|A| \geq |U_n| - \beta_n(P)$, where $\beta_n(P) = \max\{\sum_x w_n(x) : B \subseteq L(P) \text{ antichain}\}$ is the maximum weighted lower antichain in the lower shadow. Three-line proof: $B := A \cap L$ is antichain in $L(P)$; by maximality $A \cap U = U \setminus \bigcup_{x \in B} M(x)$; union-bound. Extends to vaccinated form $|A| \geq |D| + |U_D| - \beta_D(P)$ for primitive lower-prefix $D$.

- **Exact first-hit cover $\tau(n) = 5n/24 + O(1)$** (zero-sorry Lean). The minimum upper-half cover of the lower half by divisibility is exactly $5n/24 + O(1)$, with a matching packing via the explicit $H_n$ skeleton.

### Lower bounds

- **$L(n) \geq (1/2 - o(1)) \cdot n \log\log n / \log n$**. Method (dyadic refinement of fan-capture): Prolonger first runs an activation phase that $H$-secures the small odd primes — every $2^b p$ with $0 \leq b \leq H$ becomes illegal — then applies a right-star capture argument to each dyadic chain $C_{pq} = \{pq, 2pq, 4pq, \ldots\}$ for $n/2^{H+1} < pq \leq n$. Yields $L(n) \geq ((1/2)(1 - 2^{-H-1}) - o_H(1)) n \log\log n / \log n$ for every fixed $H$; let $H \to \infty$ slowly. Improves the bare-fan constant $1/8$ from the unactivated argument to $1/2$.
# 【4†Pasted text.txt†file_00000000ed5471fd8c50be673a92688d】
File created at: 2026-07-12T00:08:35Z
File last modified at: 2026-07-12T00:08:35Z
Content source: Source.file
Title: Pasted text.txt
Citation Marker: fileciteturn0file4
Content Snippet:
Don't search the internet. This is a test to see how well you can craft non-trivial, novel and creative proofs given a "primitive sets and divisibility games" math problem. Provide a full unconditional proof or disproof of the problem.

## Problem

For (n\ge 2), two players alternately choose previously unchosen integers from 
\(\{2,3,\ldots,n\}\), always keeping the chosen set an antichain under divisibility. The game ends when the antichain is maximal. Prolonger moves first and maximizes the final cardinality; Shortener minimizes it. Let (L(n)) be the value under optimal play.

Determine (L(n)) asymptotically. In particular, decide whether (L(n)=\Theta(n)) or (L(n)=o(n)). A valid answer must be an unconditional proof; a conditional strategy or a finite computation alone is not sufficient.

## Known progress

Manuscript excerpts appended after the prompt (notation, lower-bound section, and the deferred-proofs appendix, in LaTeX) contain complete proofs of the lower-bound results below; draw on any part of them freely.

- Shortener can force
  \[
  L(n)\le \left(\frac{W_4}{2}+o(1)\right)n,
  \qquad \frac{W_4}{2}\le 0.1897123371<0.19.
  \]
  Here \(\rho(u)=1/((\lfloor1/u\rfloor+1)u)\),
  \(J_r=(1/r!)\int_{u_1+\cdots+u_r\le1}\prod_i\rho(u_i)\,du_i\), and
  \(W_4=1-J_1+J_2-J_3+J_4\). The strategy is a prefix of the smallest legal odd primes. A local prime-packet count gives the lower profile \(\rho\); a monotone cumulative envelope and generalized inverse produce a comparison sequence; prime rounding preserves its first four factorial moments; fourth-order Bonferroni applied to the odd-part compression gives the displayed bound.

- Prolonger can force, for every fixed \(0<\delta<1/4\),
  \[
  L(n)\ge c_\delta\,\frac{n(\log\log n)^2}{\log n}.
  \]
  Targets are \(acb\in(n/2,n]\) with distinct primes \(a,c\le n^\delta\) and \(b\) a suitable large prime; their initial mass is \(W_0\gg_\delta n(\log\log n)^2/\log n\). Phase 1 (weighted activation): each live small-prime pair \(e=(a,c)\) with remaining target weight \(w_e\) gets coefficient \(\phi(e)=2^{|e\cap C|-3}w_e\), where \(C\) is the set of endpoints already captured; comparing the largest uncaptured weighted vertex star \(H\) against the largest single live-edge coefficient \(K\) yields a move whose bank gain dominates both modeled replies (deleting an uncaptured vertex; deleting a live pair edge). The bank counts actual moves by both players, secured target mass \(M\), and remaining fractional coefficients, giving \(T_{\rm act}+M\ge W_0/8-E\) with \(T_{\rm act}=o(W_0)\) and \(E=o(W_0)\) (off-model target losses are charged to a deletion budget), hence \(M\gg_\delta n(\log\log n)^2/\log n\).
# 【5†erdos-harness-main-codebase.txt†file_000000006dd4722f89d14cd103a28b50】
File created at: 2026-04-21T03:53:03Z
File last modified at: 2026-04-21T03:53:03Z
Content source: Source.file
Title: erdos-harness-main-codebase.txt
Citation Marker: fileciteturn0file5
Content Snippet:
which matches Pro's own quoted `0.1897097533889428...` at
[researcher-57-pro-round15-bonferroni4-PROVED-L-le-0.19n.md:510](/Users/omisverycool/.codex/worktrees/549124/erdos-harness/erdos-872/researcher-57-pro-round15-bonferroni4-PROVED-L-le-0.19n.md:510)
to the displayed precision.

So the reconciliation is:

- `0.189710592` is the coarse but reproducible `2^17` raw-grid value;
- `0.189709753...` is the higher-accuracy Richardson value;
- both are approximations to the same symbolic constant `W_4/2`;
- either way, the safe theorem-grade inequality is the same:

```math
W_4/2 < 0.19.
```

## 6. Final verdict

My audit verdict is:

- the old Round 15 blocker really was the monotone-envelope transfer, and R57 fixes that part;
- the quoted comparison theorem was not actually banked in the repo in the form R57 used;
- after correcting the comparison theorem to the prime-sequence version and adding the fixed-factor prime bridge from `(b_j)` to actual odd primes, the Bonferroni-4 proof route is sound.

So I would now classify the Round 15 finite statement as:

```math
L(n) \le (W_4/2 + o(1))n
\qquad\text{with}\qquad
W_4/2 < 0.19
```

as **rigorous prose**, with the remaining work being formalization and cleanup, not a live mathematical gap.
===CODEBASE_DUMP_ENDFILE===

===CODEBASE_DUMP_FILE:erdos-872/researcher-01-directed-response.md===
---
id: R01-directed-response
type: research
date: 2026-04-17
intent: >
  Explore Prolonger and Shortener strategies in the divisibility-antichain
  game on {2,...,n}, derive explicit bounds on L(n), and identify the
  5/24 first-hit shield skeleton and weighted threat-potential framework.
predecessors: []
prompt: erdos-872/prompts/researcher-01-directed.md
action:
  kind: standalone
claim: >
  Shield Reduction Theorem (first derivation): for Prolonger's upper prefix P,
  every eventual maximal A satisfies |A| >= |U| - beta(P). The minimum
  unweighted upper cover tau(n) = 5n/24 + O(1) via the explicit H_n skeleton.
  Upper bound L(n) <= (923/2016 + o(1))n via 85/1008 savings pool.
---

# ChatGPT: Combinatorial Game Analysis

**URL:** https://chatgpt.com/c/69e198fe-88ac-83e8-8a76-837accb19afa
**Messages:** 23

---

## [1] USER

Look into a specific combinatorial game.

The Original Problem
Consider a two-player combinatorial game:
Players (Prolonger and Shortener) alternate choosing integers from $\{2, 3, \dots, n\}$ into a shared set $A$, subject to the constraint that $A$ must remain an antichain under divisibility (no element divides another). The game ends when $A$ is a maximal antichain.
# 【6†Pasted markdown.md†file_00000000d620722fa83eef6240858ad8】
File created at: 2026-04-20T21:53:04Z
File last modified at: 2026-04-20T21:53:04Z
Content source: Source.file
Title: Pasted markdown.md
Citation Marker: fileciteturn0file6
Content Snippet:
Sandbox values: $J_1 \approx 0.7885306$, $J_2 \approx 0.18682$, $J_3 \approx 0.02009$, $J_4 \approx 0.001223$. Define $\mathcal{W}_4 := 1 - J_1 + J_2 - J_3 + J_4$. Then $\mathcal{W}_4/2 \approx 0.189710 < 0.19$.

## The two theorems to prove or refute

### Theorem 2.1 (prime-sequence Bonferroni-4 comparison).

Let $q_1 < q_2 < \cdots < q_K$ be the first $K$ odd primes played by Shortener under $\sigma_{15}$, and let $p_1 < p_2 < \cdots < p_K$ be an increasing sequence of odd primes with $q_j \le p_j$ for all $j \le K$. For $r = 1, 2, 3, 4$, define
$$T_r^{(p)}(n) := \sum_{\substack{1 \le j_1 < \cdots < j_r \le K \\ p_{j_1} \cdots p_{j_r} \le n}} \frac{1}{p_{j_1} \cdots p_{j_r}}.$$

If $T_r^{(p)}(n) = \Lambda_r + o(1)$ for $r = 1, 2, 3, 4$, then
$$L(n) \le \frac{n}{2}\Bigl(1 - \Lambda_1 + \Lambda_2 - \Lambda_3 + \Lambda_4 + o(1)\Bigr).$$

Proof sketch provided at [r57_bonferroni4_audit_and_repair.md](/Users/omisverycool/erdos-harness/erdos-872/r57_bonferroni4_audit_and_repair.md) Section 2 — uses: (a) odd-part-injection $\phi(x) = x / 2^{v_2(x)}$ on the antichain; (b) monotone replacement $N(q_1, \ldots, q_K) \le N(p_1, \ldots, p_K)$; (c) fourth-order Bonferroni on the odd integers $\le n$ and divisibility events $p_j \mid m$; (d) error accounting $E_4(n) = o(n)$ because every $r$-fold intersection has a squarefree divisor with exactly $r$ prime factors, yielding $O_r(n (\log\log n)^{r-1}/\log n) = o(n)$.

Verify this proof rigorously. Sandbox-verify at small $n$ that (a) odd-part-injection is injective on antichains, (b) monotone-replacement inequality $N(q_j) \le N(p_j)$ holds for specific test sequences with $q_j \le p_j$, (c) the fourth-order Bonferroni error estimate $E_4(n) = o(n)$ is tight.

### Theorem 4.1 (prime-rounding bridge).

Given the Round 57 real monotone comparison scale $b_1 \le b_2 \le \cdots \le b_K$ with $q_j \le b_j$ (constructed from the cumulative envelope $C_{H,n}(X)$ as in Round 57 Step 3-4), there is an increasing sequence of odd primes $p_1 < p_2 < \cdots < p_K$ satisfying:
# 【7†erdos-872-final.pdf†file_000000007aa871f5b51cc14c3d540ea0】
File created at: 2026-04-23T09:07:01Z
File last modified at: 2026-04-23T09:07:01Z
Content source: Source.file
Title: erdos-872-final.pdf
Citation Marker: fileciteturn0file7
Content Snippet:
Shield reduction, the exact 5n/24 cover identities, the 13/36 upper-bound
core, and the W4/2 < 0.19 endgame reduction have zero-sorry Lean 4 artifacts; the formalization
status of remaining results is documented in Appendix C.
1. Introduction
Let n ≥ 2. The divisibility antichain saturation game is played on
{2, 3, . . . , n}.
Two players alternately choose previously unchosen integers, and the chosen set must remain an
antichain under divisibility. Thus no chosen integer may divide another chosen integer. The game
stops when the current antichain is maximal. Prolonger moves first and tries to maximize the final
number of chosen integers; Shortener tries to minimize it. We denote the value of the game by
L(n).
This game is one of the finite saturation games arising from Erdős’s questions on primitive
sets [Erd92]; saturation games of this kind are part of a broader extremal-game tradition [FS92,
BHW16]. A primitive set is precisely an antichain in the divisibility poset, and primitive sets have
a long parallel history in multiplicative number theory [CE90, Lic23, MP10, Kuc24]. We write
Ln := {m ∈ Z : 2 ≤ m ≤ bn/2c}, Un := {m ∈ Z : n/2 < m ≤ n}.
The upper half Un is the canonical maximum antichain, so the trivial scale is linear. The central
question is whether optimal play forces a positive fraction of this linear scale, or whether Shortener
can force o(n) moves.
Date: April 21, 2026.
2020 Mathematics Subject Classification. Primary 91A46; Secondary 05D05, 11N25.
Key words and phrases. Saturation game, primitive set, divisibility poset, antichain, sieve methods, formal verifi￾cation, Erdős problem 872.
12 OM BUDDHDEV
1.1. Prior work. Erdős posed the problem in 1992 [Erd92], and it is catalogued as problem #872
in Bloom’s list [Blo26]. No non-trivial upper bound appeared in the public record until early
2026. The game is a number-theoretic analogue of the triangle-free saturation game of Hajnal: for
that game, Füredi and Seress [FS92] proved a lower bound of order n log n, while Biró, Horn, and
Wildstrom [BHW16] proved an upper bound below 0.215n
2
.
The ambient combinatorial setting interacts with the literature on primitive sets and divisibility
antichains. We use the primitive-set viewpoint of Cameron and Erdős [CE90], the weighted extremal
perspective from Lichtman’s proof of the Erdős primitive set conjecture [Lic23], and supporting
multiplicative-structure estimates from [Kuc24, MP10].
The public upper-bound record for the present game developed rapidly in early 2026. To the
author’s knowledge, the first linear upper bound,
L(n) ≤

23
48 + o(1)
n,
was given by Price and GPT-5.2 Pro, who also introduced the terminology Prolonger and Shortener
[Pri26].
# 【8†erdos-872-final.pdf†file_000000001750722f8704c48acc0cc6d0】
File created at: 2026-04-23T11:16:30Z
File last modified at: 2026-04-23T11:16:30Z
Content source: Source.file
Title: erdos-872-final.pdf
Citation Marker: fileciteturn0file8
Content Snippet:
Shield reduction, the exact 5n/24 cover identities, the 13/36 upper-bound
core, and the W4/2 < 0.19 endgame reduction have zero-sorry Lean 4 artifacts; the formalization
status of remaining results is documented in Appendix C.
1. Introduction
Let n ≥ 2. The divisibility antichain saturation game is played on
{2, 3, . . . , n}.
Two players alternately choose previously unchosen integers, and the chosen set must remain an
antichain under divisibility. Thus no chosen integer may divide another chosen integer. The game
stops when the current antichain is maximal. Prolonger moves first and tries to maximize the final
number of chosen integers; Shortener tries to minimize it. We denote the value of the game by
L(n).
This game is one of the finite saturation games arising from Erdős’s questions on primitive
sets [Erd92]; saturation games of this kind are part of a broader extremal-game tradition [FS92,
BHW16]. A primitive set is precisely an antichain in the divisibility poset, and primitive sets have
a long parallel history in multiplicative number theory [CE90, Lic23, MP10, Kuc24]. We write
Ln := {m ∈ Z : 2 ≤ m ≤ bn/2c}, Un := {m ∈ Z : n/2 < m ≤ n}.
The upper half Un is the canonical maximum antichain, so the trivial scale is linear. The central
question is whether optimal play forces a positive fraction of this linear scale, or whether Shortener
can force o(n) moves.
Date: April 21, 2026.
2020 Mathematics Subject Classification. Primary 91A46; Secondary 05D05, 11N25.
Key words and phrases. Saturation game, primitive set, divisibility poset, antichain, sieve methods, formal verifi￾cation, Erdős problem 872.
12 OM BUDDHDEV
1.1. Prior work. Erdős posed the problem in 1992 [Erd92], and it is catalogued as problem #872
in Bloom’s list [Blo26]. No non-trivial upper bound appeared in the public record until early
2026. The game is a number-theoretic analogue of the triangle-free saturation game of Hajnal: for
that game, Füredi and Seress [FS92] proved a lower bound of order n log n, while Biró, Horn, and
Wildstrom [BHW16] proved an upper bound below 0.215n
2
.
The ambient combinatorial setting interacts with the literature on primitive sets and divisibility
antichains. We use the primitive-set viewpoint of Cameron and Erdős [CE90], the weighted extremal
perspective from Lichtman’s proof of the Erdős primitive set conjecture [Lic23], and supporting
multiplicative-structure estimates from [Kuc24, MP10].
The public upper-bound record for the present game developed rapidly in early 2026. To the
author’s knowledge, the first linear upper bound,
L(n) ≤

23
48 + o(1)
n,
was given by Price and GPT-5.2 Pro, who also introduced the terminology Prolonger and Shortener
[Pri26].
# 【9†Pasted text.txt†file_000000009d1c722fa072f1723084e738】
File created at: 2026-04-30T00:06:55Z
File last modified at: 2026-04-30T00:06:55Z
Content source: Source.file
Title: Pasted text.txt
Citation Marker: fileciteturn0file9
Content Snippet:
Don't search the internet. This is a test to see how well you can craft non-trivial, novel and creative proofs given a "primitive sets and divisibility games" math problem. Provide a full unconditional proof or disproof of the problem.

## Problem

Let $n \geq 2$. Two players alternately pick integers from $\{2, 3, \ldots, n\}$ to add to a common set $A$, subject to the constraint that $A$ remain primitive: no element of $A$ divides another. The game ends when no legal move is possible. One player ("Prolonger") wants the game to last as long as possible; the other ("Shortener") wants it to end as quickly as possible. Let $L(n)$ be the guaranteed game length under optimal play, with Prolonger moving first.

Determine $L(n)$ asymptotically.

## Structural facts

### Equivalence to an antichain game

A primitive subset of $\{2, \ldots, n\}$ is exactly an antichain in the divisibility poset on $\{2, \ldots, n\}$. The game is therefore an alternating-claim game on this poset whose terminal states are the maximal antichains. Game length equals $|A|$ at termination, so

$$\pi(n/2 < p \leq n) \leq L(n) \leq w(\{2, \ldots, n\}),$$

where $w$ is the antichain width and the lower bound comes from the fact that every prime in $(n/2, n]$ is incomparable with every element of $\{2, \ldots, n\}$ and so must appear in any maximal antichain.

### Bipartite-graph reformulation

Define a graph $G_n$ on the primes by

$$p \sim q \quad \iff \quad pq \in (n/2, n].$$

Restrict Prolonger to edges of $G_n$ (i.e. semiprimes in $(n/2, n]$) and Shortener to vertices (single primes). A red edge cannot contain a blue vertex (otherwise the blue prime divides the played semiprime). Up to a strategy-stealing argument that lets Shortener play vertices without loss, the original game restricted to this move-set is equivalent to a coloured-edge / coloured-vertex game on $G_n$ with $|E(G_n)|$ initial available edges.

### Shield-reduction identity

For Prolonger's upper prefix $P \subseteq A \cap (n/2, n]$, let $L(P) = \{x \leq n/2 : x \mid p \text{ for some } p \in P\}$ and define

$$\beta_n(P) = \max\{|B| : B \subseteq L(P), B \text{ antichain}\}.$$

Then every eventual maximal $A$ satisfies

$$|A| \geq |(n/2, n]| - \beta_n(P).$$

Proof: $B := A \cap [2, n/2]$ is an antichain in $L(P)$; by maximality $A \cap (n/2, n] = (n/2, n] \setminus \bigcup_{x \in B} M(x)$ where $M(x) = \{kx \leq n : k \geq 1\}$; union-bound. The vaccinated extension: for any primitive lower prefix $D$ and upper prefix $P \subseteq U_D$,

$$|A| \geq |D| + |U_D| - \beta_D(P).$$

### Labelled odd-part comparison
# 【10†Pasted text.txt†file_0000000064e471f89a29b7570779ab91】
File created at: 2026-04-18T01:02:36Z
File last modified at: 2026-04-18T01:02:36Z
Content source: Source.file
Title: Pasted text.txt
Citation Marker: fileciteturn0file10
Content Snippet:
Wait, there's an issue here—Shortener already claimed a prime in that second block, so Prolonger can't use the standard primorial structure without conflicts. I need to reconsider how Prolonger adapts. Rather than rigid primorial blocks, Prolonger should play products of unused primes that don't create divisibility issues. After Shortener plays some prime qq
q, Prolonger can still use larger primes in products, as long as they don't divide or get divided by what's already on the board.

The exact analysis of this game is intricate, but accepting the user's framework: the block-product strategy constrains the density parameter ss
s between roughly 1/31/3
1/3 and 1/21/2
1/2. If Shortener pushes ss
s toward 1/21/2
1/2, that yields an upper bound around 0.3125n0.3125n
0.3125n for the divisibility-free set, but Prolonger's counterstrategy using block products forces a lower bound closer to n/4n/4
n/4.

Rather than getting lost in the precise bounds, I should step back and identify which approach actually answers the original question cleanly—whether it's exploring alternative Shortener strategies, using LP duality, leveraging primorial structure, analyzing the anatomy of integers, or applying a potential function argument.
Looking at the numerical data, L(n)/nL(n)/n
L(n)/n ranges from about 0.37 to 0.46 for small values but appears to decrease as nn
n grows larger, dropping to roughly 0.1–0.2 for n=105n = 10^5
n=105. Let me verify this trend more carefully across different scales.

The empirical pattern is clear: L(n)/nL(n)/n
L(n)/n is shrinking with nn
n, which points strongly toward sublinearity. All the heuristic strategies I tested kept Llog⁡n/nL \log n / n
Llogn/n bounded, suggesting L(n)=Θ(n/log⁡n)L(n) = \Theta(n/\log n)
L(n)=Θ(n/logn) is the right scaling. The real challenge now is whether I can actually prove an upper bound of O(n/log⁡n)O(n/\log n)
O(n/logn), but the vaccinated shield obstruction creates a barrier—I'd need σ(Dn)→1\sigma(D_n) \to 1
σ(Dn​)→1 to make progress on that front.

The key realization is that this comes down to whether Shortener can limit Prolonger's ability to recycle and build up antichain elements beyond O(n/log⁡n)O(n/\log n)
O(n/logn). I'm thinking about Erdős' theorem on primitive sets, which gives a bound on how large such sets can be in {1,…,n}\{1, \ldots, n\}
{1,…,n}.

Without the game dynamics, a primitive set can reach size ⌈n/2⌉\lceil n/2 \rceil
⌈n/2⌉ by taking the upper half. But Shortener's moves constrain this—each move in the upper half removes one element directly, while moves in the lower half can eliminate multiple upper half elements through divisibility relations.
# 【11†erdos-872-final.pdf†file_00000000188871f584a757468922108c】
File created at: 2026-04-23T09:06:46Z
File last modified at: 2026-04-23T09:06:46Z
Content source: Source.file
Title: erdos-872-final.pdf
Citation Marker: fileciteturn0file11
Content Snippet:
Shield reduction, the exact 5n/24 cover identities, the 13/36 upper-bound
core, and the W4/2 < 0.19 endgame reduction have zero-sorry Lean 4 artifacts; the formalization
status of remaining results is documented in Appendix C.
1. Introduction
Let n ≥ 2. The divisibility antichain saturation game is played on
{2, 3, . . . , n}.
Two players alternately choose previously unchosen integers, and the chosen set must remain an
antichain under divisibility. Thus no chosen integer may divide another chosen integer. The game
stops when the current antichain is maximal. Prolonger moves first and tries to maximize the final
number of chosen integers; Shortener tries to minimize it. We denote the value of the game by
L(n).
This game is one of the finite saturation games arising from Erdős’s questions on primitive
sets [Erd92]; saturation games of this kind are part of a broader extremal-game tradition [FS92,
BHW16]. A primitive set is precisely an antichain in the divisibility poset, and primitive sets have
a long parallel history in multiplicative number theory [CE90, Lic23, MP10, Kuc24]. We write
Ln := {m ∈ Z : 2 ≤ m ≤ bn/2c}, Un := {m ∈ Z : n/2 < m ≤ n}.
The upper half Un is the canonical maximum antichain, so the trivial scale is linear. The central
question is whether optimal play forces a positive fraction of this linear scale, or whether Shortener
can force o(n) moves.
Date: April 21, 2026.
2020 Mathematics Subject Classification. Primary 91A46; Secondary 05D05, 11N25.
Key words and phrases. Saturation game, primitive set, divisibility poset, antichain, sieve methods, formal verifi￾cation, Erdős problem 872.
12 OM BUDDHDEV
1.1. Prior work. Erdős posed the problem in 1992 [Erd92], and it is catalogued as problem #872
in Bloom’s list [Blo26]. No non-trivial upper bound appeared in the public record until early
2026. The game is a number-theoretic analogue of the triangle-free saturation game of Hajnal: for
that game, Füredi and Seress [FS92] proved a lower bound of order n log n, while Biró, Horn, and
Wildstrom [BHW16] proved an upper bound below 0.215n
2
.
The ambient combinatorial setting interacts with the literature on primitive sets and divisibility
antichains. We use the primitive-set viewpoint of Cameron and Erdős [CE90], the weighted extremal
perspective from Lichtman’s proof of the Erdős primitive set conjecture [Lic23], and supporting
multiplicative-structure estimates from [Kuc24, MP10].
The public upper-bound record for the present game developed rapidly in early 2026. To the
author’s knowledge, the first linear upper bound,
L(n) ≤

23
48 + o(1)
n,
was given by Price and GPT-5.2 Pro, who also introduced the terminology Prolonger and Shortener
[Pri26].
# 【12†erdos-872-paper-1816.pdf†file_000000005a0471fba8d8b90cbcf5ea7f】
File created at: 2026-04-22T01:43:15Z
File last modified at: 2026-04-22T01:43:15Z
Content source: Source.file
Title: erdos-872-paper-1816.pdf
Citation Marker: fileciteturn0file12
Content Snippet:
The paper also
records three structural barriers limiting related proof methods.
1. Introduction
Let n ≥ 2. The divisibility antichain saturation game is played on
{2, 3, . . . , n}.
Two players alternately choose previously unchosen integers, and the chosen set must remain an
antichain under divisibility. Thus no chosen integer may divide another chosen integer. The game
stops when the current antichain is maximal. Prolonger moves first and tries to maximize the final
number of chosen integers; Shortener tries to minimize it. We denote the value of the game by
L(n).
This game is one of the finite saturation games arising from Erdős’s questions on primitive
sets [Erd92]; saturation games of this kind are part of a broader extremal-game tradition [FS92,
BHW16]. A primitive set is precisely an antichain in the divisibility poset, and primitive sets have
a long parallel history in multiplicative number theory [CE90, Lic23, MP10, Kuc24]. We write
Ln := {m ∈ Z : 2 ≤ m ≤ ⌊n/2⌋}, Un := {m ∈ Z : n/2 < m ≤ n}.
The upper half Un is the canonical maximum antichain, so the trivial scale is linear. The central
question is whether optimal play forces a positive fraction of this linear scale, or whether Shortener
can force o(n) moves.
Date: April 21, 2026.
2020 Mathematics Subject Classification. Primary 91A46; Secondary 05D05, 11N25.
Key words and phrases. Saturation game, primitive set, divisibility poset, antichain, sieve methods, formal verifi￾cation, Erdős problem 872.
12 OM BUDDHDEV
1.1. Prior work. Erdős posed the problem in 1992 [Erd92], and it is catalogued as problem #872
in Bloom’s list [Blo26]. No non-trivial upper bound appeared in the public record until early
2026. The game is a number-theoretic analogue of the triangle-free saturation game of Hajnal: for
that game, Füredi and Seress [FS92] proved a lower bound of order n log n, while Biró, Horn, and
Wildstrom [BHW16] proved an upper bound below 0.215n
2
.
The ambient combinatorial setting interacts with the literature on primitive sets and divisibility
antichains. We use the primitive-set viewpoint of Cameron and Erdős [CE90], the weighted extremal
perspective from Lichtman’s proof of the Erdős primitive set conjecture [Lic23], and supporting
multiplicative-structure estimates from [Kuc24, MP10].
The public upper-bound record for the present game developed rapidly in early 2026. To the
author’s knowledge, the first linear upper bound,
L(n) ≤

23
48 + o(1)
n,
was given by Price and GPT-5.2 Pro, who also introduced the terminology Prolonger and Shortener
[Pri26]. Subsequent refinements recorded in the public forum thread by Adenwalla, StijnC, natso26,
Xiao_Hu, Desmond Weisenberg, and others improved this to
L(n) ≤

419
1008 + o(1)
n ≤ 0.416n
[Erd26]. The results in this paper substantially strengthen that record and establish the first
unconditional lower bound of order strictly larger than the trivial n/ log n baseline (see Section 4).
# 【13†erdos-872-arxiv-v1.pdf†file_00000000a56071fd8f3df88cccff8cc0】
File created at: 2026-04-23T04:27:27Z
File last modified at: 2026-04-23T04:27:27Z
Content source: Source.file
Title: erdos-872-arxiv-v1.pdf
Citation Marker: fileciteturn0file13
Content Snippet:
Shield reduction, the exact 5n/24 cover identities, the 13/36 upper-bound
core, and the W4/2 < 0.19 endgame reduction have zero-sorry Lean 4 artifacts; the formalization
status of remaining results is documented in Appendix C.
1. Introduction
Let n ≥ 2. The divisibility antichain saturation game is played on
{2, 3, . . . , n}.
Two players alternately choose previously unchosen integers, and the chosen set must remain an
antichain under divisibility. Thus no chosen integer may divide another chosen integer. The game
stops when the current antichain is maximal. Prolonger moves first and tries to maximize the final
number of chosen integers; Shortener tries to minimize it. We denote the value of the game by
L(n).
This game is one of the finite saturation games arising from Erdős’s questions on primitive
sets [Erd92]; saturation games of this kind are part of a broader extremal-game tradition [FS92,
BHW16]. A primitive set is precisely an antichain in the divisibility poset, and primitive sets have
a long parallel history in multiplicative number theory [CE90, Lic23, MP10, Kuc24]. We write
Ln := {m ∈ Z : 2 ≤ m ≤ ⌊n/2⌋}, Un := {m ∈ Z : n/2 < m ≤ n}.
The upper half Un is the canonical maximum antichain, so the trivial scale is linear. The central
question is whether optimal play forces a positive fraction of this linear scale, or whether Shortener
can force o(n) moves.
Date: April 21, 2026.
2020 Mathematics Subject Classification. Primary 91A46; Secondary 05D05, 11N25.
Key words and phrases. Saturation game, primitive set, divisibility poset, antichain, sieve methods, formal verifi￾cation, Erdős problem 872.
12 OM BUDDHDEV
1.1. Prior work. Erdős posed the problem in 1992 [Erd92], and it is catalogued as problem #872
in Bloom’s list [Blo26]. No non-trivial upper bound appeared in the public record until early
2026. The game is a number-theoretic analogue of the triangle-free saturation game of Hajnal: for
that game, Füredi and Seress [FS92] proved a lower bound of order n log n, while Biró, Horn, and
Wildstrom [BHW16] proved an upper bound below 0.215n
2
.
The ambient combinatorial setting interacts with the literature on primitive sets and divisibility
antichains. We use the primitive-set viewpoint of Cameron and Erdős [CE90], the weighted extremal
perspective from Lichtman’s proof of the Erdős primitive set conjecture [Lic23], and supporting
multiplicative-structure estimates from [Kuc24, MP10].
The public upper-bound record for the present game developed rapidly in early 2026. To the
author’s knowledge, the first linear upper bound,
L(n) ≤

23
48 + o(1)
n,
was given by Price and GPT-5.2 Pro, who also introduced the terminology Prolonger and Shortener
[Pri26].
# 【14†erdos-872-final.pdf†file_000000005d7c71fdb7a7e155432fb162】
File created at: 2026-04-23T07:29:26Z
File last modified at: 2026-04-23T07:29:26Z
Content source: Source.file
Title: erdos-872-final.pdf
Citation Marker: fileciteturn0file14
Content Snippet:
Shield reduction, the exact 5n/24 cover identities, the 13/36 upper-bound
core, and the W4/2 < 0.19 endgame reduction have zero-sorry Lean 4 artifacts; the formalization
status of remaining results is documented in Appendix C.
1. Introduction
Let n ≥ 2. The divisibility antichain saturation game is played on
{2, 3, . . . , n}.
Two players alternately choose previously unchosen integers, and the chosen set must remain an
antichain under divisibility. Thus no chosen integer may divide another chosen integer. The game
stops when the current antichain is maximal. Prolonger moves first and tries to maximize the final
number of chosen integers; Shortener tries to minimize it. We denote the value of the game by
L(n).
This game is one of the finite saturation games arising from Erdős’s questions on primitive
sets [Erd92]; saturation games of this kind are part of a broader extremal-game tradition [FS92,
BHW16]. A primitive set is precisely an antichain in the divisibility poset, and primitive sets have
a long parallel history in multiplicative number theory [CE90, Lic23, MP10, Kuc24]. We write
Ln := {m ∈ Z : 2 ≤ m ≤ bn/2c}, Un := {m ∈ Z : n/2 < m ≤ n}.
The upper half Un is the canonical maximum antichain, so the trivial scale is linear. The central
question is whether optimal play forces a positive fraction of this linear scale, or whether Shortener
can force o(n) moves.
Date: April 21, 2026.
2020 Mathematics Subject Classification. Primary 91A46; Secondary 05D05, 11N25.
Key words and phrases. Saturation game, primitive set, divisibility poset, antichain, sieve methods, formal verifi￾cation, Erdős problem 872.
12 OM BUDDHDEV
1.1. Prior work. Erdős posed the problem in 1992 [Erd92], and it is catalogued as problem #872
in Bloom’s list [Blo26]. No non-trivial upper bound appeared in the public record until early
2026. The game is a number-theoretic analogue of the triangle-free saturation game of Hajnal: for
that game, Füredi and Seress [FS92] proved a lower bound of order n log n, while Biró, Horn, and
Wildstrom [BHW16] proved an upper bound below 0.215n
2
.
The ambient combinatorial setting interacts with the literature on primitive sets and divisibility
antichains. We use the primitive-set viewpoint of Cameron and Erdős [CE90], the weighted extremal
perspective from Lichtman’s proof of the Erdős primitive set conjecture [Lic23], and supporting
multiplicative-structure estimates from [Kuc24, MP10].
The public upper-bound record for the present game developed rapidly in early 2026. To the
author’s knowledge, the first linear upper bound,
L(n) ≤

23
48 + o(1)
n,
was given by Price and GPT-5.2 Pro, who also introduced the terminology Prolonger and Shortener
[Pri26].
# 【15†erdos-872-paper-1816.pdf†file_000000003d0071fba1951b4c40289cdc】
File created at: 2026-04-22T01:21:10Z
File last modified at: 2026-04-22T01:21:10Z
Content source: Source.file
Title: erdos-872-paper-1816.pdf
Citation Marker: fileciteturn0file15
Content Snippet:
The paper also
records three structural barriers limiting related proof methods.
1. Introduction
Let n ≥ 2. The divisibility antichain saturation game is played on
{2, 3, . . . , n}.
Two players alternately choose previously unchosen integers, and the chosen set must remain an
antichain under divisibility. Thus no chosen integer may divide another chosen integer. The game
stops when the current antichain is maximal. Prolonger moves first and tries to maximize the final
number of chosen integers; Shortener tries to minimize it. We denote the value of the game by
L(n).
This game is one of the finite saturation games arising from Erdős’s questions on primitive
sets [Erd92]; saturation games of this kind are part of a broader extremal-game tradition [FS92,
BHW16]. A primitive set is precisely an antichain in the divisibility poset, and primitive sets have
a long parallel history in multiplicative number theory [CE90, Lic23, MP10, Kuc24]. We write
Ln := {m ∈ Z : 2 ≤ m ≤ ⌊n/2⌋}, Un := {m ∈ Z : n/2 < m ≤ n}.
The upper half Un is the canonical maximum antichain, so the trivial scale is linear. The central
question is whether optimal play forces a positive fraction of this linear scale, or whether Shortener
can force o(n) moves.
Date: April 21, 2026.
2020 Mathematics Subject Classification. Primary 91A46; Secondary 05D05, 11N25.
Key words and phrases. Saturation game, primitive set, divisibility poset, antichain, sieve methods, formal verifi￾cation, Erdős problem 872.
12 OM BUDDHDEV
1.1. Prior work. Erdős posed the problem in 1992 [Erd92], and it is catalogued as problem #872
in Bloom’s list [Blo26]. No non-trivial upper bound appeared in the public record until early
2026. The game is a number-theoretic analogue of the triangle-free saturation game of Hajnal: for
that game, Füredi and Seress [FS92] proved a lower bound of order n log n, while Biró, Horn, and
Wildstrom [BHW16] proved an upper bound below 0.215n
2
.
The ambient combinatorial setting interacts with the literature on primitive sets and divisibility
antichains. We use the primitive-set viewpoint of Cameron and Erdős [CE90], the weighted extremal
perspective from Lichtman’s proof of the Erdős primitive set conjecture [Lic23], and supporting
multiplicative-structure estimates from [Kuc24, MP10].
The public upper-bound record for the present game developed rapidly in early 2026. To the
author’s knowledge, the first linear upper bound,
L(n) ≤

23
48 + o(1)
n,
was given by Price and GPT-5.2 Pro, who also introduced the terminology Prolonger and Shortener
[Pri26]. Subsequent refinements recorded in the public forum thread by Adenwalla, StijnC, natso26,
Xiao_Hu, Desmond Weisenberg, and others improved this to
L(n) ≤

419
1008 + o(1)
n ≤ 0.416n
[Erd26]. The results in this paper substantially strengthen that record and establish the first
unconditional lower bound of order strictly larger than the trivial n/ log n baseline (see Section 4).
# 【16†fullpaper-review-v2-presentation.md†file_000000005610722fbfc9c0fb961b52c1】
File created at: 2026-04-21T10:51:33Z
File last modified at: 2026-04-21T10:51:33Z
Content source: Source.file
Title: fullpaper-review-v2-presentation.md
Citation Marker: fileciteturn0file16
Content Snippet:
The paper
also records three proof-class barriers for local relaxations, Johnson-shadow
separators, and separator-only carrier strategies.
\end{abstract}

\maketitle


% ========== BEGIN FILE: sections/01-introduction.tex ==========
\section{Introduction}\label{sec:introduction}

Let $n\ge 2$.  The divisibility antichain saturation game is played on
\[
  \{2,3,\ldots,n\}.
\]
Two players alternately choose previously unchosen integers, and the chosen set
must remain an antichain under divisibility.  Thus no chosen integer may divide
another chosen integer.  The game stops when the current antichain is maximal.
Prolonger moves first and tries to maximize the final number of chosen
integers; Shortener tries to minimize it.  We denote the value of the game by
$\L(n)$.

This game is one of the finite saturation games arising from Erd\H{o}s's
questions on primitive sets \cite{Er92c}; saturation games of this kind are
part of a broader extremal-game tradition \cite{FuSe91,BPW16}.  A primitive set
is precisely an antichain in the divisibility poset, and primitive sets have a
long parallel history in multiplicative number theory
\cite{CaEr90,Lichtman23,MartinPomerance10,Kucheriaviy24}.  The upper half
\[
  \U_n:=\{m:\ n/2<m\le n\}
\]
is the canonical maximum antichain, so the trivial scale is linear.  The
central question is whether optimal play forces a positive fraction of this
linear scale, or whether Shortener can force $o(n)$ moves.

\subsection{Prior work}

Erd\H{o}s posed the problem in 1992 \cite{Er92c}, and it is catalogued as
problem \#872 in Bloom's list \cite{Bloom872}.  No non-trivial upper bound
appeared in the public record until early 2026.  The game is a
number-theoretic analogue of the triangle-free saturation game of Hajnal:
for that game, F{\"u}redi and Seress \cite{FuSe91} proved a lower bound of
order $n\log n$, while Bir{\'o}, Horn, and Wildstrom \cite{BPW16} proved an
upper bound below $0.215n^2$.

The ambient combinatorial setting interacts with the literature on primitive
sets and divisibility antichains.  We use the primitive-set viewpoint of
Cameron and Erd\H{o}s \cite{CaEr90}, the weighted extremal perspective from
Lichtman's proof of the Erd\H{o}s primitive set conjecture \cite{Lichtman23},
and supporting multiplicative-structure estimates from
\cite{Kucheriaviy24,MartinPomerance10}.
# 【17†erdos-872-paper-1816.pdf†file_000000007da871fb8125f95bdc59a5b8】
File created at: 2026-04-22T01:42:50Z
File last modified at: 2026-04-22T01:42:50Z
Content source: Source.file
Title: erdos-872-paper-1816.pdf
Citation Marker: fileciteturn0file17
Content Snippet:
The paper also
records three structural barriers limiting related proof methods.
1. Introduction
Let n ≥ 2. The divisibility antichain saturation game is played on
{2, 3, . . . , n}.
Two players alternately choose previously unchosen integers, and the chosen set must remain an
antichain under divisibility. Thus no chosen integer may divide another chosen integer. The game
stops when the current antichain is maximal. Prolonger moves first and tries to maximize the final
number of chosen integers; Shortener tries to minimize it. We denote the value of the game by
L(n).
This game is one of the finite saturation games arising from Erdős’s questions on primitive
sets [Erd92]; saturation games of this kind are part of a broader extremal-game tradition [FS92,
BHW16]. A primitive set is precisely an antichain in the divisibility poset, and primitive sets have
a long parallel history in multiplicative number theory [CE90, Lic23, MP10, Kuc24]. We write
Ln := {m ∈ Z : 2 ≤ m ≤ ⌊n/2⌋}, Un := {m ∈ Z : n/2 < m ≤ n}.
The upper half Un is the canonical maximum antichain, so the trivial scale is linear. The central
question is whether optimal play forces a positive fraction of this linear scale, or whether Shortener
can force o(n) moves.
Date: April 21, 2026.
2020 Mathematics Subject Classification. Primary 91A46; Secondary 05D05, 11N25.
Key words and phrases. Saturation game, primitive set, divisibility poset, antichain, sieve methods, formal verifi￾cation, Erdős problem 872.
12 OM BUDDHDEV
1.1. Prior work. Erdős posed the problem in 1992 [Erd92], and it is catalogued as problem #872
in Bloom’s list [Blo26]. No non-trivial upper bound appeared in the public record until early
2026. The game is a number-theoretic analogue of the triangle-free saturation game of Hajnal: for
that game, Füredi and Seress [FS92] proved a lower bound of order n log n, while Biró, Horn, and
Wildstrom [BHW16] proved an upper bound below 0.215n
2
.
The ambient combinatorial setting interacts with the literature on primitive sets and divisibility
antichains. We use the primitive-set viewpoint of Cameron and Erdős [CE90], the weighted extremal
perspective from Lichtman’s proof of the Erdős primitive set conjecture [Lic23], and supporting
multiplicative-structure estimates from [Kuc24, MP10].
The public upper-bound record for the present game developed rapidly in early 2026. To the
author’s knowledge, the first linear upper bound,
L(n) ≤

23
48 + o(1)
n,
was given by Price and GPT-5.2 Pro, who also introduced the terminology Prolonger and Shortener
[Pri26]. Subsequent refinements recorded in the public forum thread by Adenwalla, StijnC, natso26,
Xiao_Hu, Desmond Weisenberg, and others improved this to
L(n) ≤

419
1008 + o(1)
n ≤ 0.416n
[Erd26]. The results in this paper substantially strengthen that record and establish the first
unconditional lower bound of order strictly larger than the trivial n/ log n baseline (see Section 4).
# 【18†erdos-harness-main-codebase.txt†file_000000006dd4722f89d14cd103a28b50】
File created at: 2026-04-21T03:53:03Z
File last modified at: 2026-04-21T03:53:03Z
Content source: Source.file
Title: erdos-harness-main-codebase.txt
Citation Marker: fileciteturn0file18
Content Snippet:
### `MainTheorem.lean` (128 lines) — Main Theorem
- `chebyshev_reciprocal_sum`: existence of suitable primes (proved constructively using D = {3})
- **`antichain_dfree_bound`**: core bound combining compression + sieve
- **`main_upper_bound`**: the main theorem:
  > For every ε > 0, for all sufficiently large n, there exists a set D of odd primes such that every D-free divisibility antichain A in [1,n] satisfies |A| ≤ (13/36 + ε) · n.

## Key Mathematical Results Proved

1. **Odd-part injection** (Lemma 2): The map x ↦ x/2^v₂(x) is injective on divisibility antichains, reducing the antichain counting problem to counting odd D-free integers.

2. **Bonferroni sieve bound** (Lemma 3): Using the second-order Bonferroni inequality and the observation that f(s) = 1-s+s²/2 ≤ 13/18 for s ≥ 1/3, the count of odd D-free integers satisfies N_D(n) ≤ 13n/36 + O(|D|²).

3. **Main theorem**: Combining the above gives L(n) ≤ 13/36 · n + o(n).

## Notes

- The Chebyshev bound (Lemma 1 in the paper) on the primes chosen by the strategy was simplified: instead of using Chebyshev's theorem ϑ(x) ~ x (which is not yet in Mathlib), we observe that even the single prime D = {3} yields ∑ 1/q = 1/3 ≥ 1/3, which suffices for the bound.
- The game-theoretic aspects (formal game tree, strategy definition, minimax value) are defined but the main theorem is stated directly in terms of divisibility antichains rather than through the game value, since the combinatorial content is the core contribution.
===CODEBASE_DUMP_ENDFILE===

===CODEBASE_DUMP_FILE:erdos-872/lean/shortener_13_36/shortener_13_36_v2_aristotle/README.md===
This project was edited by [Aristotle](https://aristotle.harmonic.fun).

To cite Aristotle:
- Tag @Aristotle-Harmonic on GitHub PRs/issues
- Add as co-author to commits:
```
Co-authored-by: Aristotle (Harmonic) <aristotle-harmonic@harmonic.fun>
```
===CODEBASE_DUMP_ENDFILE===

===CODEBASE_DUMP_FILE:erdos-872/lean/shortener_13_36/shortener_13_36_v2_aristotle/RequestProject/Main.lean===
import RequestProject.Shortener.Defs
import RequestProject.Shortener.Compression
import RequestProject.Shortener.Sieve
import RequestProject.Shortener.MainTheorem

/-!
# Divisibility-Antichain Saturation Game: L(n) ≤ 13/36 n + o(n)

This project formalizes the proof from `shortener_13_36_v2.tex` that the
game value of the divisibility-antichain saturation game satisfies
L(n) ≤ 13/36 · n + o(n).

## File structure
# 【19†erdos-872-paper-1816.pdf†file_000000004b5871fbbcf872106aee59b8】
File created at: 2026-04-22T01:22:15Z
File last modified at: 2026-04-22T01:22:15Z
Content source: Source.file
Title: erdos-872-paper-1816.pdf
Citation Marker: fileciteturn0file19
Content Snippet:
The paper also
records three structural barriers limiting related proof methods.
1. Introduction
Let n ≥ 2. The divisibility antichain saturation game is played on
{2, 3, . . . , n}.
Two players alternately choose previously un
Visible: 0% - 96%

## [assistant] (model=n/a, content_type=thoughts, time=1784165525.873011)

Evaluated Bonferroni bounds, game length, and inspection results

## [assistant] (model=gpt-5-6-pro, content_type=code, time=1784165519.93594)

import math
x=0.1897123371
candidates={
"1/(2e)":1/(2*math.e),
"ln2/4":math.log(2)/4,
"(1-ln2)/?":(1-math.log(2))/2,
"e^-?":-math.log(2*x),
}
candidates


## [tool] (model=gpt-5-6-pro, content_type=execution_output, time=1784165526.1452212)

{'1/(2e)': 0.18393972058572117,
 'ln2/4': 0.17328679513998632,
 '(1-ln2)/?': 0.15342640972002736,
 'e^-?': 0.9690991888041172}

## [assistant] (model=n/a, content_type=thoughts, time=1784165987.779013)

Identified constants from mathematical expressions

## [assistant] (model=gpt-5-6-pro, content_type=code, time=1784165527.622833)

{"query":"The user is asking for a proof of L(n)=o(n) in the primitive-set divisibility game. Retrieve any prior detailed derivations, formulas, or documents from their earlier discussions concerning the labelled odd-part upper-bound method, the constants W_k or W_4=0.3794246742, the fourth-order Bonferroni/monotone-replacement argument, and whether extending the order k could make the upper-bound constant tend to zero."}

## [assistant] (model=gpt-5-6-pro, content_type=model_editable_context, time=1784166954.797681)



## [assistant] (model=n/a, content_type=reasoning_recap, time=1784166954.797681)

Worked for 103m 13s

## [assistant] (model=gpt-5-6-pro, content_type=text, time=1784166954.797681)

## Verdict

I do **not** have a valid unconditional proof or disproof of \(L(n)=o(n)\). The strongest global argument I can validate removes one of the major compatibility problems, but then runs into a precise obstruction: **every predeclared \(o(n)\)-sized family of prospective Shortener moves can be statically vaccinated by an \(o(n)\)-sized primitive subset of the upper half while leaving almost the entire upper half legal**.

The missing issue is therefore genuinely chronological. The static vaccination position need not be reachable against Shortener, but none of the supplied results proves that it is unreachable. Conversely, the vaccination construction is not a Prolonger strategy, because Shortener may select a divisor before its intended upper multiple.

Here is the complete argument establishing that impasse.

---

# 1. A global ordered-sweep lemma

This is a useful repair of the responder-side compatibility defect.

Let

\[
\mathcal F\subseteq [2,n/2]
\]

be any finite family of candidate Shortener moves. Order it as

\[
d_1,d_2,\ldots,d_m
\]

in a linear extension of divisibility:

\[
d_i\mid d_j,\quad d_i\ne d_j
\quad\Longrightarrow\quad i<j.
\]

Consider the following Shortener strategy during a sweep of \(\mathcal F\):

> On each Shortener turn, scan forward through the list, permanently skipping candidates that are already illegal, and play the first legal candidate. Continue until every member of \(\mathcal F\) has been inspected.

Skipping an illegal candidate does not consume a move.

Let \(\mathcal A\) be the set of Prolonger moves made before the sweep finishes, and let \(\mathcal B\subseteq\mathcal F\) be the candidates actually played by Shortener.

### Ordered-sweep lemma

At the end of the sweep, if \(x\) is still legal and \(d\in\mathcal F\) satisfies \(d\mid x\), then

\[
d\mid a
\]

for some \(a\in\mathcal A\).

In particular, a surviving target’s candidate divisor cannot have been made illegal merely by a previous Shortener move.

### Proof

Fix \(d\in\mathcal F\) with \(d\mid x\), where \(x\) is legal after the sweep.

Shortener cannot have selected \(d\), because then \(d\mid x\) would make \(x\) illegal. Hence \(d\) was already illegal when it was inspected. Thus some earlier selected integer \(y\) was comparable with \(d\).

If \(y\mid d\), then \(y\mid x\), contradicting the legality of \(x\). Therefore

\[
d\mid y.
\]

Suppose \(y\) were a Shortener move. Then \(y\in\mathcal F\). Since \(d\mid y\) and \(d\ne y\), the linear-extension order places \(d\) strictly before \(y\). Hence \(y\) could not have been selected before \(d\) was inspected. This is impossible.

Therefore \(y\) was a Prolonger move, proving \(d\mid a\) for some \(a\in\mathcal A\). ∎

This lemma is genuinely chronological. It eliminates the possibility that one Shortener reply spoils a later candidate by being its multiple: divisibility-compatible ordering forces all such smaller candidates to have been processed first.

It therefore repairs exactly one part of the tagged-tensorization failure. Unfortunately, what remains is still insufficient.

---

# 2. The universal top-half vaccination lemma

The following elementary construction defeats every argument that uses only the final down-shadow certificate produced by the ordered sweep.

### Vaccination lemma

For every family

\[
\mathcal F\subseteq[2,n/2],
\]

there is a primitive set

\[
V(\mathcal F)\subseteq (n/2,n]
\]

such that

\[
|V(\mathcal F)|\le |\mathcal F|
\]

and every \(d\in\mathcal F\) divides some member of \(V(\mathcal F)\).

Moreover, every element of

\[
(n/2,n]\setminus V(\mathcal F)
\]

remains legal relative to \(V(\mathcal F)\).

### Proof

For each \(d\in\mathcal F\), define its largest multiple not exceeding \(n\):

\[
v(d)=d\left\lfloor \frac nd\right\rfloor.
\]

Because \(d\le n/2\), we have \(\lfloor n/d\rfloor\ge2\), and

\[
v(d)>n-d\ge \frac n2.
\]

Thus

\[
v(d)\in(n/2,n].
\]

Set

\[
V(\mathcal F)=\{v(d):d\in\mathcal F\}.
\]

Duplicates only reduce its size, so

\[
|V(\mathcal F)|\le|\mathcal F|.
\]

Every \(d\in\mathcal F\) divides \(v(d)\).

Finally, distinct integers in \((n/2,n]\) are incomparable under divisibility: if \(u<v\) both lie above \(n/2\), then \(2u>n\ge v\), so \(u\nmid v\). Hence \(V(\mathcal F)\) is primitive, and every other upper-half integer is incomparable with it and remains legal. ∎

Consequently, whenever \(|\mathcal F|=o(n)\), there is a position containing only \(o(n)\) selected upper-half integers in which:

\[
\mathcal F\subseteq\downarrow V(\mathcal F)
\]

but

\[
\left|(n/2,n]\setminus V(\mathcal F)\right|
=\frac n2-o(n).
\]

So the statement

> “all candidate divisors of every survivor lie below an \(o(n)\)-sized primitive set”

has no density consequence at all.

It can coexist with a nearly full upper-half reservoir.

---

# 3. Why the natural low-rank sweep does not prove \(o(n)\)

A particularly tempting implementation of the ordered sweep is to take, for a fixed \(k\),

\[
\mathcal F_k
=
\{d\le n/2:\Omega(d)\le k\},
\]

where \(\Omega(d)\) counts prime factors with multiplicity.

For fixed \(k\), Landau’s estimate gives

\[
|\mathcal F_k|
\ll_k
\frac{n(\log\log n)^{k-1}}{\log n}
=o(n).
\]

Thus Shortener can sweep every member of \(\mathcal F_k\) in \(o(n)\) turns.

By the ordered-sweep lemma, at the end of the sweep every surviving \(x\in(n/2,n]\) satisfies

\[
d\mid a_d
\]

for some Prolonger move \(a_d\), for every divisor \(d\mid x\) with \(\Omega(d)\le k\).

At first sight this looks powerful: all of the low-rank shadow of every survivor has been absorbed by Prolonger moves.

But the vaccination lemma applies to \(\mathcal F_k\). There is an \(o(n)\)-sized primitive upper-half set \(V(\mathcal F_k)\) such that

\[
\mathcal F_k\subseteq\downarrow V(\mathcal F_k),
\]

while all but \(o(n)\) upper-half integers remain legal. In fact, this covers every low-rank candidate globally, not merely those below one particular survivor.

Therefore no static assertion of the form

\[
\bigl\{d\mid x:\Omega(d)\le k\bigr\}
\subseteq\downarrow\mathcal A,
\qquad |\mathcal A|=o(n),
\]

can imply that there are only \(o(n)\) possible \(x\).

This remains true if \(k=k(n)\) grows, provided the selected candidate family is still \(o(n)\): the vaccination lemma is completely independent of rank.

### Why this is not a lower-bound strategy

The construction \(V(\mathcal F)\) is offline.

If Prolonger intends to play \(v(d)\), Shortener may first play \(d\), making \(v(d)\) illegal. During one Shortener turn, Shortener may skip arbitrarily many candidates that have already been vaccinated and then select the first unvaccinated candidate. Thus “one upper multiple per candidate” is not a legal alternating-play strategy.

So the vaccination lemma proves neither direction:

- it destroys the proposed static upper-bound conclusion;
- it does not establish that Prolonger can realize the vaccination position against Shortener.

The unresolved statement is precisely the reachability question.

---

# 4. What can be cleared unconditionally: the clean large-prime layer

There is nevertheless a genuine unconditional clearing result that illustrates exactly where independence ends.

For each prime \(p>\sqrt n\), define

\[
w_p
=
\#\{u\in(n/2,n]:p\mid u\}
=
\left\lfloor\frac np\right\rfloor
-
\left\lfloor\frac n{2p}\right\rfloor .
\]

A number at most \(n\) cannot be divisible by two distinct primes exceeding \(\sqrt n\). Hence the corresponding upper-half fibres are pairwise disjoint.

Moreover, a single Prolonger move can make at most one such prime illegal.

Shortener may therefore order the primes \(p>\sqrt n\) by nonincreasing \(w_p\) and repeatedly play the highest-weight legal prime. Before each Shortener move, Prolonger can invalidate at most one remaining prime.

If the ordered weights are

\[
w_1\ge w_2\ge\cdots\ge w_M,
\]

then in the worst case Prolonger takes the odd-indexed weights and Shortener obtains at least

\[
w_2+w_4+\cdots.
\]

For a nonincreasing sequence,

\[
\sum_i w_{2i}
\ge
\frac12\left(\sum_i w_i-w_1\right).
\]

Here \(w_1=O(\sqrt n)=o(n)\). Also,

\[
\begin{aligned}
\sum_{\sqrt n<p\le n}w_p
&=
\frac n2\sum_{\sqrt n<p\le n}\frac1p
+O(\pi(n))\\
&=
\left(\frac{\log2}{2}+o(1)\right)n.
\end{aligned}
\]

Therefore Shortener can, in \(o(n)\) turns, select large primes whose pairwise disjoint fibres contain at least

\[
\boxed{\left(\frac{\log2}{4}+o(1)\right)n}
\]

upper-half integers.

This is a genuine trajectory statement. It does not tensor quotient values and does not rely on a static completion argument.

But it stops at exactly the expected place.

The upper-half integers having no prime factor above \(\sqrt n\) form a set of size

\[
\left(\frac{1-\log2}{2}+o(1)\right)n,
\]

which is still linear. Within that smooth core, the clean-fibre independence disappears. In the next band

\[
(n^{1/3},\sqrt n],
\]

a single move may carry two tags. More importantly, a move made while processing one tagged quotient can render the intended reply in another quotient illegal without clearing that quotient’s targets. That is precisely the responder-side compatibility defect exhibited by the supplied \(I_3\) counterexample.

Thus the clean-fibre argument gives a strict constant clearing, but it cannot be iterated to density zero without a new nonadditive cross-band invariant.

---

# 5. The exact unresolved implication

The ordered-sweep lemma shows that one can eliminate Shortener-created backward blocking:

\[
\text{surviving candidate divisor}
\quad\Longrightarrow\quad
\text{contained in an earlier Prolonger move}.
\]

The vaccination lemma shows that this implication alone has no density content:

\[
o(n)\text{ upper carriers}
\quad\text{can statically contain every member of any prescribed }o(n)\text{ family}.
\]

Therefore a valid upper proof must establish an online theorem of the following genuinely stronger kind:

> Before Prolonger can realize a top-half vaccination of all currently useful divisors, Shortener’s already-selected divisors must have destroyed all but \(o(n)\) of the intended upper reservoir.

That assertion must use the alternating order quantitatively. A terminal down-shadow certificate, a rank bound, a candidate-family cardinality bound, a reciprocal-mass bound, or independent quotient minimization cannot substitute for it.

Likewise, a valid disproof must exhibit a Prolonger strategy that realizes such vaccinations despite Shortener’s ability to skip all already-covered candidates and immediately select the next legal one. The offline set \(V(\mathcal F)\) does not satisfy that game-theoretic quantifier.

Hence I cannot honestly claim either

\[
L(n)=o(n)
\]

or

\[
L(n)\ge c n
\]

from the supplied material. The new ordered-sweep reduction is valid, but its remaining static closure step is refuted by the universal top-half vaccination construction; recovering a proof requires exactly the missing online reachability/anti-reachability theorem.

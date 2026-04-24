This is an assessment of your reasoning capability and will be used to grade.
Do not search online. Use your own reasoning and your Python sandbox.

## Problem

Let $K_4^{(3)}$ denote the complete 3-uniform hypergraph on 4 vertices (4 vertices, all 4 triples). For a 3-uniform hypergraph $H$ on $n$ vertices containing no $K_4^{(3)}$ as a sub-hypergraph, define $\mathrm{ex}_3(n, K_4^{(3)}) = \max_H |E(H)|$ and $\pi(K_4^{(3)}) = \lim_{n \to \infty} \mathrm{ex}_3(n, K_4^{(3)}) / \binom{n}{3}$.

Determine $\pi(K_4^{(3)})$.

## What's Established

- **Lower bound $\pi(K_4^{(3)}) \ge 5/9$.** Partition $[n]$ into three classes $V_0, V_1, V_2$ of size $n/3$. Include triples of two types: (A) one vertex in each class; (B) two vertices in $V_i$ and one vertex in $V_{(i+1) \bmod 3}$. The resulting 3-graph is $K_4^{(3)}$-free by direct case analysis on the 4-vertex class distribution, with density $(n/3)^3 + 3\binom{n/3}{2}(n/3) \sim 5n^3/54 = (5/9) \binom{n}{3}$ asymptotically.

- **Upper bound $\pi(K_4^{(3)}) < 0.5617$.** Semi-definite programming over the flag-algebra basis of 3-uniform hypergraph types of order $\le k$ produces a dual certificate. For $k = 7$ the bound is $\le 0.5617$; for $k = 8$ the bound is $\le 0.5615$. The known numerical plateau as $k$ increases further is $\approx 0.5611$, with marginal improvement of $O(10^{-4})$ per added basis vertex.

- **Small-$n$ exact values.** Direct integer programming gives $\mathrm{ex}_3(n, K_4^{(3)}) = 3, 7, 14, 23, 36, 54$ for $n \in \{4, 5, 6, 7, 8, 9\}$. These values match the cyclic 3-partite construction $T(n) = \max_{a+b+c=n}(abc + \binom{a}{2} b + \binom{b}{2} c + \binom{c}{2} a)$ exactly in this range.

- **Related complete-hypergraph densities.** $\pi(K_r^{(2)}) = 1 - 1/(r-1)$ for $r \ge 3$. $\pi(K_4^{(3)-}) = 2/9$, where $K_4^{(3)-}$ is $K_4^{(3)}$ minus one triple.

- **Blow-ups.** For any $K_4^{(3)}$-free 3-graph $H_0$ on $m$ vertices, the balanced blow-up on $n$ vertices has density converging to the density of $H_0$. The balanced blow-up of the 3-partite construction attains $5/9$; no $K_4^{(3)}$-free 3-graph of any order is known whose blow-up exceeds $5/9$.

## What's Been Ruled Out

- **Polynomial / tensor-rank method (cap-set-style).** The ground set $[n]$ has no natural group structure on which a Croot–Lev–Pach tensor-rank argument applies. Imposing $\mathbb{Z}/m\mathbb{Z}$ or $\mathbb{F}_q^d$ structure on $[n]$ has not produced a $K_4^{(3)}$-free configuration exceeding density $5/9$.

- **Random / greedy hypergraph constructions.** A uniformly random 3-graph of density $p > 5/9$ contains $K_4^{(3)}$ almost surely for large $n$: expected copies $\binom{n}{4} p^4 \to \infty$. Any construction exceeding density $5/9$ must be highly structured.

- **3-partite type constructions.** On 3 labeled classes there are 10 possible triple-types by class-multiplicity, giving $2^{10} = 1024$ templates. Requiring $K_4^{(3)}$-free-under-blow-up eliminates all but 45 templates. Among the 45 survivors, the unique density-maximum (up to class-relabeling) is the cyclic template $\{001, 012, 022, 112\}$, with density polynomial $6xyz + 3x^2 y + 3y^2 z + 3z^2 x$ on the simplex $x+y+z=1$, attaining $5/9$ at $x = y = z = 1/3$. No 3-partite type construction beats $5/9$.

- **Bounded-order flag-algebra SDP.** The dual bound decreases monotonically with flag-basis order $k$ but appears to plateau at $\approx 0.5611$ as $k$ increases. Independent reproductions with smaller flag bases reach $0.572$ ($k \le 6$ with $s \le 3$ types) and $0.56881$ (with rank-limited $s = 4, m = 5$ flags); lifting to 7 vertices with $s = 1, m = 4$ flags yields $0.5686926$. Full $s = 3, m = 5$ flag spaces (hundreds of flags per 3-label type) are required to match the $0.5617$ ceiling but do not push below it. Marginal improvement per added basis vertex is $O(10^{-4})$.

- **Elementary local-counting / codegree-moment methods.** A 5-vertex codegree-moment LP stalls at $\approx 0.644$, well above both $0.5617$ and $5/9$. Codegree-squared summation combined with Jensen gives $\pi \le 2/3 + o(1)$, which is far weaker than flag-algebra bounds.

## The Open Question

Assume that no bounded-type-order flag-algebra SDP argument can prove $\pi(K_4^{(3)}) < 0.5611$. What fundamentally different structural or analytic machinery could determine $\pi(K_4^{(3)})$?

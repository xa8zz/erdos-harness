Below is the current state of a problem plus a new claim from a primary researcher. Rigorously audit the new claim. Be adversarial — your job is to find what breaks.

## Problem

Let $K_4^{(3)}$ denote the complete 3-uniform hypergraph on 4 vertices (4 vertices, all 4 triples). For a 3-uniform hypergraph $H$ on $n$ vertices containing no $K_4^{(3)}$ as a sub-hypergraph, define $\mathrm{ex}_3(n, K_4^{(3)}) = \max_H |E(H)|$ and $\pi(K_4^{(3)}) = \lim_{n \to \infty} \mathrm{ex}_3(n, K_4^{(3)}) / \binom{n}{3}$.

Determine $\pi(K_4^{(3)})$.

## Established Facts

- **Lower bound $\pi \ge 5/9$.** Partition $[n]$ into three classes $V_0, V_1, V_2$ of size $n/3$. Take triples of two types: (A) one vertex in each class; (B) two vertices in $V_i$ and one vertex in $V_{(i+1) \bmod 3}$. Density calculation $\sim (5/9) \binom{n}{3}$, verified $K_4^{(3)}$-free by case analysis on the 4-vertex class distribution.

- **Upper bound $\pi \le \sim 0.5615$.** Semi-definite programming over the flag-algebra basis of 3-uniform hypergraph types of order $\le 8$ gives a dual certificate. Numerical plateau near $0.5611$ as the flag-basis order increases further.

- **Related densities.** $\pi(K_4^{(3)-}) = 2/9$ (tetrahedron minus one edge). $\pi(K_r^{(2)}) = 1 - 1/(r-1)$ for graph Turán.

## The New Claim

Verbatim excerpt from the researcher's output (light Unicode cleanup of LaTeX-to-plaintext rendering artifacts; substantive content unchanged):

> My determination is $\pi(K_4^{(3)}) = 5/9$, but I cannot honestly present that as a proved theorem here. The rigorous status is still $5/9 \le \pi(K_4^{(3)}) \le 0.5617$, so the exact value remains unproved. What I can add is that every independent check I ran points to $5/9$, not to anything larger.
>
> The cleanest universal upper bound I could re-derive is $2/3$. Let $d(xy)$ be the codegree of the pair $xy$. Then
>
> $$\sum_{xy} \binom{d(xy)}{2} = \sum_{Q \in \binom{V(H)}{4}} \binom{e(Q)}{2} \le \sum_{Q \in \binom{V(H)}{4}} e(Q) = (n-3) e(H),$$
>
> because every 4-set spans at most 3 edges. By convexity,
>
> $$\binom{n}{2} \binom{3 e(H) / \binom{n}{2}}{2} \le \sum_{xy} \binom{d(xy)}{2},$$
>
> so $e(H) \le \frac{2n-3}{9} \binom{n}{2} = (2/3 + o(1)) \binom{n}{3}$. That is far from $5/9$, but it shows the basic obstruction.
>
> I also checked exact small cases by solving the integer program
>
> $$\max \sum_{e \in \binom{[n]}{3}} x_e \quad \text{subject to} \quad \sum_{e \subset Q} x_e \le 3 \text{ for every } Q \in \binom{[n]}{4},\ x_e \in \{0, 1\}.$$
>
> For $n = 4, 5, 6, 7, 8, 9$ this gives
>
> $$3,\ 7,\ 14,\ 23,\ 36,\ 54,$$
>
> which exactly match the cyclic 3-part construction
>
> $$T(n) = \max_{a+b+c=n}\Bigl(abc + \binom{a}{2} b + \binom{b}{2} c + \binom{c}{2} a\Bigr).$$
>
> So the first exact values support the $5/9$ picture perfectly.
>
> The strongest new thing I could verify exactly is this: among all "coarse" constructions on 3 classes, the cyclic one is optimal. On 3 labeled parts there are 10 possible triple-types by class-multiplicity. I exhaustively checked all $2^{10} = 1024$ such templates, imposed the blow-up $K_4^{(3)}$-free condition on every 4-multiset of class labels, and only 45 templates survive. Among those, the unique optimum up to relabeling is the cyclic template
>
> $$001,\ 012,\ 022,\ 112,$$
>
> whose density polynomial is
>
> $$f(x, y, z) = 6xyz + 3 x^2 y + 3 y^2 z + 3 z^2 x, \quad x + y + z = 1,$$
>
> and its maximum is $5/9$, attained at $x = y = z = 1/3$. So no 3-part type construction beats $5/9$.
>
> I also tried a higher-moment refinement using 5-vertex local data and codegree moments. It still stalls far above $5/9$, around $0.644$, which is another way of seeing why elementary local counting does not finish the problem and why one needs genuinely stronger machinery to get down near the SDP plateau.
>
> So the mathematically honest bottom line is: the exact value is not yet proved, but all the evidence here points to $\pi(K_4^{(3)}) = 5/9$.

## Your job

Treat the four substantive claims separately. For each, say whether it holds, where the weakest link is, and what a skeptic would push back on.

1. **Re-derivation of $\pi \le 2/3$.** Does the codegree-squared $\to$ Jensen argument hold as stated? Any arithmetic or convexity error? The $(2n-3)/9$ constant — does it actually give $\pi \le 2/3 + o(1)$?

2. **Small-$n$ exact values $\{3, 7, 14, 23, 36, 54\}$ for $n \in \{4, 5, 6, 7, 8, 9\}$.** Are these correct values for $\mathrm{ex}_3(n, K_4^{(3)})$? Do they match $T(n) = \max_{a+b+c=n}(abc + \binom{a}{2} b + \binom{b}{2} c + \binom{c}{2} a)$? Is there a published enumeration that agrees or disagrees?

3. **1024-template exhaustion — THIS IS THE LOAD-BEARING CLAIM.** Does the argument really show that among all possible triple-templates on 3 labeled classes, the cyclic template $\{001, 012, 022, 112\}$ is the unique $K_4^{(3)}$-free blow-up attaining density $5/9$? Specifically:
   - Are there really 10 triple-types by class-multiplicity, giving $2^{10} = 1024$ templates to check?
   - Is the $K_4^{(3)}$-free-under-blow-up condition correctly characterized as "for every 4-multiset of class labels, at most 3 of the 4 induced triples are in the template"?
   - Does the count of 45 surviving templates look right? (Spot-check a few templates by hand — does the cyclic template $\{001, 012, 022, 112\}$ survive? Do simple alternatives like $\{012\}$-only, $\{111\}$-only, or $\{001, 002, 011, 022\}$ survive or fail?)
   - Is the density polynomial $f(x, y, z) = 6xyz + 3 x^2 y + 3 y^2 z + 3 z^2 x$ correct for the cyclic template? (The cyclic template includes the all-different type $(1,1,1)$ and the three cyclic 2-1 types $(2,1,0), (0,2,1), (1,0,2)$ — with the labeling $001$ meaning "two in class 0 plus one in class 1". Verify multiplicities: type $(1,1,1)$ contributes $6xyz$ because it corresponds to $3!$ orderings; types $(2,1,0)$ etc. contribute $\binom{3}{1} = 3$ ordered permutations inside each type.)
   - Is $5/9$ really the maximum of $f$ on the simplex $x+y+z=1$, attained at $x = y = z = 1/3$? (Lagrange multipliers or direct substitution.)
   - Is the uniqueness claim "up to relabeling" rigorous, or is it simply that the cyclic template was the best of the 45 without a symmetry argument showing others cannot tie?

4. **5-vertex codegree-moment LP at $\sim 0.644$.** Is $0.644$ plausible for a generic 5-vertex local-counting LP on $K_4^{(3)}$-free 3-graphs? Compared to published upper bounds pre-flag-algebras ($\sim 0.593$ from 5-vertex moment methods in the late 1990s), is this specific value new, the same, or a weaker re-derivation?

Separately, check each claim against existing mathematical literature:

- Claim (1): de Caen's 1983 bound from codegree-squared summation is widely cited. Is this an exact re-derivation, does it agree with de Caen up to formatting, or does it differ?
- Claim (2): small-$n$ Turán numbers for $K_4^{(3)}$ — are $\{3, 7, 14, 23, 36, 54\}$ the published values? Cite any computational Turán-number table you know (Brouwer, Sidorenko, OEIS, etc.).
- Claim (3): has the "all 3-partite templates on 3 classes" problem been enumerated before? Frankl–Füredi, Sidorenko, Chung–Lu, Pikhurko, Keevash, Razborov are the most relevant authors. Is this meta-theorem implicit in any paper from the 1980s–2020s, or is the $1024 \to 45 \to 1$ computation genuinely new?
- Claim (4): compare $0.644$ to published 5-vertex-moment / codegree-moment upper bounds from Chung–Lu (1999), de Caen, or successor works. Is $0.644$ the best known from this technique, or is it weaker than published results?

If all four claims are sound and (3) is genuinely novel, say so plainly. If any claim is broken or unclear, explain precisely where. If (3) turns out to be classical or implicit in existing literature, cite the reference.

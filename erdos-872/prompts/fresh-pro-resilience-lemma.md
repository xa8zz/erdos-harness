This is an assessment of your reasoning capability and will be used to grade.
Do not search online. Use your own reasoning and your Python sandbox.

A specific combinatorial lemma has been isolated as the load-bearing missing step for a long-open asymptotic question. Prove it, refute it, or produce a substantive partial result.

## The question

Let $h \ge 2$ be a parameter. Consider the $h$-uniform hypergraph $H^{(h)}$ whose vertices are the $(h-1)$-element subsets of a ground set $\mathcal P$ of size $N$, and whose hyperedges are the $h$-element subsets of $\mathcal P$ — each hyperedge $S \subseteq \mathcal P$ consists of its $h$ "top facets" $\{S \setminus \{p\} : p \in S\}$. So $|E(H^{(h)})| = \binom{N}{h}$, $|V(H^{(h)})| = \binom{N}{h-1}$, every vertex is in $N - h + 1$ hyperedges, and every hyperedge has $h$ vertices.

Play the following online game on $H^{(h)}$:

- **Shortener** moves first each round, claiming one uncaptured, unstolen vertex.
- **Prolonger** moves second, scoring one unscored, unstolen hyperedge $S$ and stealing all $h$ of its top-facet vertices (marking them unavailable to Shortener).
- A hyperedge $S$ is *fully closed* if all $h$ of its top-facet vertices have been claimed by Shortener (before Prolonger could score it).
- The game continues until no unscored, unstolen hyperedge remains.

Let $R$ be the residual (unscored, unstolen) hyperedges at any point, $C$ the claimed vertices. Define the **defect-layer closure budget**
$$\mathfrak{B}_h(R, C) := \sum_{k=1}^{h} \frac{|\partial_{h-k} R \setminus C_{h-k}|}{\binom{h}{k}},$$
where $\partial_j R$ is the collection of $j$-subsets appearing as some $h$-face boundary of an $R$-hyperedge, and $C_j$ is the collection of $j$-subsets claimed so far (or more precisely captured in the natural sense for the game).

**Theorem to prove or refute.** There exists a Shortener strategy such that, at every point in the game,
$$|\operatorname{Cl}_h(R, C)| \le O\!\left(\log h \cdot \mathfrak{B}_h(R, C) + (\text{hyperedges already scored by either player})\right),$$
where $\operatorname{Cl}_h(R, C) = \{S \in R : \text{every proper subset } T \subsetneq S \text{ with } |T| = h-1 \text{ lies in } C\}$ — the fully-closed residual hyperedges.

## Why this specific lemma

This theorem would imply $L(n) = o(n)$ for a combinatorial game on integers (Erdős Problem #872) that has been open for decades. The translation: the hypergraph $H^{(h)}$ is a combinatorial abstraction of a certain divisibility structure, top-facet certificates are lateral moves in a number-theoretic game, and the defect-layer budget $\mathfrak{B}_h$ generalizes pair-shadow mass in the way needed to handle the full multiplicative closure.

Quantitatively, proving $g(h) = O(\log h)$ in the statement above gives
$$L(n) \ll n \cdot \frac{\log \log \log n}{\log \log n} = o(n).$$

## What is already known

**Rate identity.** Let $N_h = |E(H^{(h)})|$, $V_{h,k} = \binom{N}{h-k}$ the count of $(h-k)$-subsets, $D_{h,k} = \binom{N - h + k}{k}$ the number of hyperedges containing a fixed $(h-k)$-subset. Then $V_{h,k} / \binom{h}{k} = N_h / D_{h,k}$. This identity means no positive drift at any fixed defect layer $k$ — a Shortener move at a defect-$k$ certificate kills $D_{h,k}$ hyperedges while a Prolonger score captures $\binom{h}{k}$ defect-$k$ vertices; rates match.

**Static cover is $O(\log h)$, not $O(1)$.** Independent random inclusion of each vertex with probability $p = \lambda/h$ leaves a fixed hyperedge uncovered with probability $(1-p)^h = e^{-\lambda + O(\lambda^2/h)}$. Choosing $\lambda = C \log h$ gives uncovered hyperedges $N_h h^{-C+o(1)}$; adding an arbitrary vertex from each uncovered hyperedge gives a static transversal of expected size $O(\log h \cdot N_h/h) = O(\log h \cdot V/h^2)$. This is the right static scale.

**Online-vs-static lower principle.** Let $\tau(H^{(h)})$ be the minimum static transversal size. Prolonger can force at least $\tau(H^{(h)})/2$ online scored hyperedges: after $t$ rounds with Shortener claiming $\le t$ vertices and Prolonger scoring $\le t$ hyperedges, the union of Shortener's vertices with one representative-per-scored-edge is a static transversal of size $\le 2t$; so $2t \ge \tau$. Therefore $g(h) = O(1)$ in the theorem above is impossible unless the static cover size itself is $O(N_h/h^2)$, which the random-cover calculation rules out (static cover is $\Theta(\log h \cdot N_h/h^2)$).

**Within-layer cleanup fails.** Any pure single-layer attack fails because the rate identity gives no drift. Cross-layer coupling is required; $\mathfrak B_h$ sums over all layers with the "correct" normalization $1/\binom{h}{k}$ at layer $k$.

**Cross-layer / singleton attack also fails at the same identity.** A singleton move $\{p\} \in V$ — viewing $V$ as $(h-1)$-subsets — hits hyperedges with top-facet shape containing the singleton; rate is the same $h \sim \log\log n$ kills per move against $h$ shields per steal. So defect-budget $\mathfrak B_h$ is genuinely the right object.

## What you are asked to do

Prove the resilience lemma, refute it with an explicit Prolonger stealing construction, or produce a partial result with weaker $g(h)$ (any $g(h) = o(h)$ is valuable; $g(h) = O(\log h)$ is the target).

Natural attack vectors:

1. **Static + local repair via second moment on fully-closed events.** A rank-$h$ hyperedge becomes fully closed only when all $h$ of its top-facets are captured. Under near-independent captures, $\Pr[\text{fully closed}] = p^h$. If the dependence in Prolonger's adversarial stealing is bounded (e.g., each stolen hyperedge shares $\le O(\log h)$ top-facets with the existing closure set in expectation), the expected per-steal increase in $|\operatorname{Cl}_h|$ is $O(\log h)$.

2. **Cross-layer potential with martingale-style accounting.** Define $\Phi(R, C) = \sum_k w_k |C_{h-k}| + w_\text{score} \cdot (\text{scored})$ with weights $w_k$ chosen to balance across layers. Find weights making $\Phi$ Maker-first nondecreasing up to a $\log h$ factor.

3. **Derandomization of the static cover via method of conditional expectations.** Shortener commits to a specific deterministic online ordering of vertex claims (derived from the static random cover's conditional expectations). Show that under any Prolonger stealing, conditional expected $|\operatorname{Cl}_h|$ stays $O(\log h \cdot N_h/h^2 + \text{scored})$.

4. **LP / fractional relaxation.** Write the online game as a fractional hitting-set LP, bound the integrality gap, and show online rounding achieves $O(\log h)$ competitive ratio.

5. **Explicit Prolonger counter-construction.** Steal hyperedges whose top-facets are maximally concentrated around a specific "core" of Shortener's partial claim, creating closure cascades. If such a construction forces $|\operatorname{Cl}_h| = \omega(\log h \cdot \mathfrak B_h)$, the theorem is false and $L(n) \ne o(n)$ via this framework.

6. **Computational / small-$h$ sanity checks.** At $h = 3, 4, 5$ and small $N$, compute the exact minimum online transversal via minimax. Track empirical $g(h)$ versus the $O(\log h)$ target.

Partial results, honest concessions with precise remaining gap, or structural refutations are all valuable.

## Additional notes

- Small-$h$ instances are exhaustively tractable: for $h \le 5$ and $N \le 10$, the game tree has $\binom{N}{h-1}!$ ordered states, manageable via memoized backtracking.
- The full number-theoretic problem has $\mathcal P = \{p \text{ prime} : p \le y\}$ with $y = n^\alpha$ some fixed $\alpha \in (1/3, 1/2)$, so $N = \pi(y)$ is polynomial in $n$. But the hypergraph-level theorem should be uniform over $N$, $h$ — abstract combinatorial, not number-theoretic.
- Cross-reference: the theorem, if proved, combines with previously established results (second-order lower bound $L(n) \ge c n (\log\log n)^2/\log n$, upper bound chain $L(n) \le 0.18969 n$) to give the sharp sublinear rate $L(n) = \Theta(n (\log\log n)^k/\log n)$ for some $k \ge 2$ with explicit constants.
- Static sampling at $p = \lambda/h$ gives cover $\sim N_h/h$ and uncovered $\sim N_h/h^C$; this is a *starting* scale, not the final answer. The online repair is what's subtle.

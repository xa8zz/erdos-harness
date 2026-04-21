This is an assessment of your reasoning capability and will be used to grade.
Do not search online. Use your own reasoning and your Python sandbox.

## Problem

Fix $n$ large and $\delta \in (0, 1/4)$. Set $Y := n^\delta$. Let $\mathcal P_Y$ be the set of odd primes at most $Y$.

For each unordered pair $\{a,c\}$ of distinct primes with $a<c$ in $\mathcal P_Y$, put
\[
  I_{a,c} := \left(\tfrac{n}{2ac},\ \tfrac{n}{ac}\right], \qquad
  B_{a,c} := I_{a,c} \cap \mathbb P.
\]
Define the **target family**
\[
  \mathcal T := \{\, t = acb \ :\ a<c \in \mathcal P_Y,\ b \in B_{a,c}\,\}.
\]
For every $t = acb \in \mathcal T$ the number $t$ lies in $(n/2, n]$, and $b > n/(2Y^2) > Y$, so $a < c \le Y < b$ and the three prime factors are distinct.

Consider the following finite positional game $G(n,\delta)$ played on $\mathcal T$.

**Board.** The hyperedges of $G(n,\delta)$ are
\[
  e_t := \{b,\ ab,\ cb\} \subseteq [2, n/2], \qquad w(e_t) := 1, \qquad t = acb \in \mathcal T.
\]
The vertex set is $V := \bigcup_{t\in\mathcal T} e_t \cup \mathcal T \subseteq [2, n]$.

**State.** A state is a tuple $(C, D_V, K, D_E, S)$ where $C, D_V \subseteq V$ are disjoint finite *captured* and *deleted-vertex* sets, $K, D_E$ are disjoint finite subsets of the hyperedge set, and $S \in \mathbb N$. An edge $e_t$ is **live** iff $e_t \notin K \cup D_E$ and $e_t \cap D_V = \emptyset$.

**Potential.**
\[
  Q := 8S + \sum_{e \text{ live}} 2^{|e \cap C|}\, w(e).
\]

**Moves.** Maker moves first; play alternates.
- **Maker** picks a live edge $f$. Maker increments $S$ by $w(f)$, adds $f$ to $K$, and adds $f$ (as a set of three vertices) to $C$.
- **Maker alternate move: score the exact target $t$.** For any target $t$ with $e_t$ live, Maker may instead add $e_t$ to $K$ and increment $S$ by $w(e_t)$ without adding $\{b,ab,cb\}$ to $C$. (This corresponds to scoring the target itself without claiming slot vertices.)
- **Breaker** may either (i) add a vertex $v \in V \setminus C$ to $D_V$, or (ii) add a live $e$ to $D_E$, or (iii) score a live $e$ by adding it to $K$ and adding $w(e)$ to $S$.

Play continues until no positive-weight live edge remains.

**Arithmetic incidence constraints** that distinguish $G(n,\delta)$ from a generic rank-$3$ scored capture game:
- Each edge has weight exactly $1$.
- Every edge $e_t$ has the form $\{b, ab, cb\}$ with $b$ prime, $b > Y$, $a < c \le Y$ distinct primes.
- For two distinct targets $t = acb$ and $t' = a'c'b'$, the intersection $e_t \cap e_{t'}$ is controlled by factorization:
  - the slot $b$ is shared between $e_t$ and $e_{t'}$ iff $b = b'$;
  - the slot $ab$ is shared between $e_t$ and $e_{t'}$ iff $b = b'$ and $\{a\} \cap \{a', c'\} \ne \emptyset$;
  - analogously for $cb$.
- In particular, two edges $e_t, e_{t'}$ can share $2$ or $3$ slots only if $b = b'$; and $3$ slots only if $\{a, c\} = \{a', c'\}$, i.e., $t = t'$.

## Safe-edge hypothesis

At every reachable pre-Maker state with at least one positive-weight live edge, Maker has a legal move $f$ such that for every legal Breaker reply the potential $Q$ is at least as large after the full round as it was before Maker's move.

## What's Established

- In arbitrary rank-$2$ scored Maker--Breaker capture games with the potential $Q = 8S + \sum_{e \text{ live}} 2^{|e\cap C|} w(e)$, a max-incident-weight move suffices to satisfy the safe-edge hypothesis. Standard scaled-potential argument.

- The integer game from which $G(n,\delta)$ arises is the divisibility antichain saturation game on $\{2, 3, \dots, n\}$, played alternately with the constraint that the chosen set remains primitive; game length $L(n)$ under optimal play with the maximizer moving first. A sequence of elementary reductions shows that if the safe-edge hypothesis holds for all $G(n,\delta)$ with $\delta \in (0,1/4)$, together with an analogous hypothesis for a rank-$2$ activation game on the small-prime pairs, then for every fixed $\delta \in (0,1/4)$ there exists $c_\delta > 0$ with
\[
  L(n) \ge c_\delta\, \frac{n (\log\log n)^2}{\log n}
\]
for all sufficiently large $n$. The rank-$2$ activation part is standard; the rank-$3$ residual part is the content of this problem.

- Target mass: $\sum_{a<c \in \mathcal P_Y} |B_{a,c}| = (1/2 + o(1)) (\log\log n)^2 \cdot (n/\log n)$.

- Slot sharing is controlled by factorization. If two distinct $e_t, e_{t'}$ share a slot, that slot's factorization determines whether $b = b'$ and the overlap of small-prime pairs. In particular, the set of edges $\{e_t : t = acb,\ b \text{ fixed}\}$ partitions by unordered pair $\{a,c\}$ and each such edge contains $b$.

## What's Ruled Out

- The safe-edge hypothesis is **false** for arbitrary rank-$3$ scored capture games with non-uniform weights. Explicit counterexample: take the state with captured vertex set $C = \{z_{ij} : 1 \le i,j \le 3\}$, uncaptured vertices $u_1, u_2, u_3, v$, and live edges
\[
  f = \{u_1, u_2, u_3\},\ w(f) = 9, \qquad
  e_{ij} = \{v, u_i, z_{ij}\},\ w(e_{ij}) = 4\ \text{for all}\ i,j \in \{1,2,3\}.
\]
Then $\Phi(f) = 2^{|f \cap C|} w(f) = 1 \cdot 9 = 9$ and $\Phi(e_{ij}) = 2^1 \cdot 4 = 8$. Direct computation gives $\Delta(f) = 135$, $\Delta(e_{ij}) = 129$, so $f$ is the unique max-gain move. After Maker plays $f$, Breaker deletes $v$, killing all nine $e_{ij}$ at post-capture $\Phi$-value $16$ each. Breaker loss is $9 \cdot 16 = 144 > 135$, so $Q$ strictly decreases. This counterexample does not meet the arithmetic structure of $G(n,\delta)$: its weights are non-uniform, and more seriously its slot-incidence pattern (nine edges all sharing a common uncaptured vertex $v$, each paired with one of only three other uncaptured vertices $u_i$, with captured "tail" vertices $z_{ij}$ peculiar to each pair) has no realization in an edge set of the form $\{\{b, ab, cb\}\}$ obtained from targets $acb$ with $b$ prime.

- Naive "max-gain dominates" Maker strategies fail, per the above. Any proof of the safe-edge hypothesis for $G(n,\delta)$ must use the arithmetic incidence constraints, not a move-choice that depends only on edge weights.

- In the rank-$2$ activation game, the potential argument is standard; the rank-$3$ content here is genuinely new.

## Numerical / Computational Evidence

None specific to this question; the question is new enough that no small-$n$ exploration has been carried out.

## The Open Question

Does the safe-edge hypothesis hold for every reachable state of the rank-$3$ scored hypergraph game $G(n, \delta)$ defined above, for all $\delta \in (0, 1/4)$ and all sufficiently large $n$?

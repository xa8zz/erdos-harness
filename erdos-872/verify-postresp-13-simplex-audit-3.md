---
id: R13-simplex-audit-3
type: verification
date: 2026-04-18
intent: >
  Second of three adversarial audits of Pro simplex obstruction; focus on
  directional error in core lemma proof and hidden game-history assumption.
predecessors: [R13-pro-A-obstruction]
action:
  kind: confirms
  target: R13-pro-A-obstruction
claim: >
  Core lemma true but proof has directional error: "carrier divides x" should
  be "x divides carrier" (squarefree divisibility direction). Conclusion
  still holds. Simplex construction structurally sound but relies on implicit
  assumption that prime 2 is unplayed.
siblings: [R13-simplex-audit-1, R13-simplex-audit-5]
---
# Audit of Package B — simplex obstruction (second of three)

Here is a rigorous audit of the response, pressuring the five specific points you identified.

### 1. The "Legal Circuit" Definition and Core Lemma
**Verdict: The lemma is true, but the written proof contains a strict logical inversion regarding divisibility.**

The response claims: *"if $x \mid m_T$ and $x \ne m_T$, then $\operatorname{supp}(x) \subsetneq T$, so by (2) some carrier has support containing $\operatorname{supp}(x)$, which since everything is squarefree means that carrier divides $x$, making $x$ illegal."*

This is backwards. If a carrier $C$ has $\operatorname{supp}(C) \supseteq \operatorname{supp}(x)$ and both are squarefree, then **$x$ divides the carrier**, not the other way around. 
* **Example:** If $C = 2 \cdot 3 \cdot 5$ and $x = 2 \cdot 3$, then $\operatorname{supp}(C) \supseteq \operatorname{supp}(x)$. $C$ does not divide $x$; $x$ divides $C$.
* **The correction:** Because $x$ divides the previously played carrier $C$, $x$ is a divisor of an existing antichain element. By the rules of the game, playing a proper divisor of a board element is illegal. 

The squarefree assumption *is* doing the necessary work here—without it, $\operatorname{supp}(x) \subseteq \operatorname{supp}(C)$ would not guarantee $x \mid C$ (e.g., $x = p^2$, $C = p$)—but the response bungles the arithmetic direction of the final step. 

### 2. The Simplex Construction
**Verdict: Structurally sound, but relies on the implicit assumption that the prime 2 is unplayed.**

* **(a) Antichain validation:** The elements $C_i = 2 Q_t / q_i$ are indeed an antichain. They are squarefree, each has exactly $t$ prime factors, and their supports are distinct. None can divide another.
* **(b) Conditions (1) and (2):** * Condition (1) holds: $S_i \not\subseteq T$ because $2 \in S_i$ but $2 \notin T$. $T \not\subseteq S_i$ because $q_i \in T$ but $q_i \notin S_i$.
    * Condition (2) holds: Any proper subset $U \subsetneq T$ misses at least one prime $q_j \in T$. Thus, $U \subseteq T \setminus \{q_j\} \subset S_j$. 
* **(c) Legality of $Q_t$:** $Q_t$ is incomparable with all $C_i$ by Condition (1). However, $Q_t$ would be illegal if any of its divisors were already on the board. The construction implicitly assumes that the board consists *only* of the set $\mathcal{C}$. Specifically, if Shortener had played the prime $2$ earlier, Prolonger's entire simplex would be illegal (since $2 \mid C_i$). The construction is valid as a localized board state, but it requires that $2$ (or whatever anchor prime is used) is left open.

### 3. The Asymptotic $t(n)$
**Verdict: The asymptotic arithmetic is flawless.**

The response seeks the maximal $t$ such that $Q_t = \prod_{i=1}^t q_i \le n$.
Taking the logarithm: $\log Q_t = \sum_{i=1}^t \log q_i$.
By the Prime Number Theorem ($\vartheta(x) \sim x$), this sum is asymptotically the $t$-th prime, $p_t$.
Since $p_t \sim t \log t$, we require $t \log t \le \log n$.
Solving $t \log t = \log n$ asymptotically yields $t(n) \sim \log n / \log\log n$.
The implicit constant is exactly $1$, and the algebraic chain holds up to rigorous scrutiny.

### 4. The Scope of the Obstruction
**Verdict: The logical leap is valid. The obstruction forces universal strategies to abandon bounded-order repair.**

You asked if this forces the $\Omega(\log n / \log\log n)$ order on *every* Shortener strategy, or just those that refuse to play $Q_t$. 

If Shortener employs a strategy restricted to bounded-order moves (e.g., a "k-tuple repair theory" where $k$ is fixed), she is structurally incapable of playing $Q_t$ when $t(n) > k$. Because the game must end in a maximal antichain, leaving a legal move like $Q_t$ unplayed indefinitely is impossible—the game cannot terminate until it is blocked. If Shortener's algorithm forbids playing it, Prolonger can simply leave it open, breaking Shortener's strategy. 

Therefore, any *universal* proof extending the Resolution Theorem must provide a mechanism for Shortener to generate moves of order $\Omega(\log n / \log\log n)$. A universal strategy must handle the worst-case Prolonger board, and this simplex is a valid Prolonger board.

### 5. Relationship to $O(n/\log n)$
**Verdict: The obstruction is strictly compatible with the $O(n/\log n)$ upper bound; it is an order barrier, not a move-count barrier.**

If Shortener plays $Q_t$, the specific circuit is closed. You correctly pressure whether Prolonger could spam this obstruction to exhaust Shortener's move budget. 

Let's calculate the cost of a spam attack:
1.  Prolonger requires $t \approx \log n / \log\log n$ moves to build a single simplex.
2.  Prolonger's total move budget is capped at the number of upper primes, roughly $n/(2\log n)$.
3.  The maximum number of disjoint simplices Prolonger can construct is $\approx \frac{n/\log n}{\log n / \log\log n} = \frac{n \log\log n}{\log^2 n}$.

If Shortener responds by playing one $Q_t$ per simplex, she spends exactly $\frac{n \log\log n}{\log^2 n}$ moves. Because $\frac{n \log\log n}{\log^2 n} = o(n/\log n)$, Shortener easily absorbs the cost without violating the $O(n/\log n)$ target. The response is completely correct in its final assessment: the simplex proves that the *nature* of the required moves must be high-order, but it does not mandate an excessive *volume* of moves.

---
id: R13-rank3-audit-4
type: verification
date: 2026-04-18
intent: >
  Second of three adversarial audits of Pro rank-3 extension theorem; focus
  on phase-4 counting degeneration near alpha=1/2 and induction structure.
predecessors: [R13-pro-rank3-extension]
action:
  kind: confirms
  target: R13-pro-rank3-extension
claim: >
  Phase-2 legality airtight (relies strictly on alpha < 1/2 boundary).
  Phase-4 counting lemma: correct for strictly fixed alpha, violently
  degenerates as alpha -> 1/2 (Mertens sum blows up). Induction step for
  "no legal move survives": largely sound. Overall theorem valid for fixed alpha.
siblings: [R13-rank3-audit-2, R13-rank3-audit-6]
---
# Audit of Package A — rank-3 vs loglog (second of three)

Here is an adversarial audit of the two responses, breaking down the claims rigorously against the constraints of the game's state space.

### 1. A's Phase-2 Legality Claim
**Verdict: Airtight, but strictly reliant on the $\alpha < 1/2$ boundary.**
A claims that for any prime $p \in B$, $p^2$ is a legal Shortener move unless $p$ was already played. This is mathematically correct. 
* **Comparability with Carriers:** Prolonger's composite carriers are explicitly defined as squarefree, meaning $p^2 \nmid C$. Furthermore, since carriers are composite, $C \nmid p^2$ (the only divisors of $p^2$ are $1, p,$ and $p^2$, none of which are composite).
* **Comparability with History:** Shortener’s Phase 1 only played primes, and $p^2 > p$, so no Phase 1 move invalidates $p^2$.
* **The Size Edge Case:** The only way $p^2$ is an illegal move *by definition* is if $p^2 > n$. However, A restricts $p \le y = n^\alpha$. Since $\alpha \in (1/3, 1/2)$, it strictly guarantees $p^2 \le n^{2\alpha} < n$. The legality claim holds perfectly.

### 2. A's Phase-4 Counting Lemma
**Verdict: Technically correct for fixed $\alpha$, but degenerates approaching $1/2$.**
A attempts to prove $T_\alpha(n) = O_\alpha(n/\log n)$ by splitting at $pq = n^{1-\alpha}$. The critical vulnerability is in the Mertens sum for the second regime ($pq > n^{1-\alpha}$):
$$\sum_{n^{1-2\alpha} < p < q \le n^\alpha}\frac{1}{pq} \approx \frac{1}{2} \left( \sum_{n^{1-2\alpha} < p \le n^\alpha} \frac{1}{p} \right)^2 \approx \frac{1}{2} \left( \log \frac{\alpha}{1-2\alpha} \right)^2$$
While this evaluates to $O_\alpha(1)$ for any *strictly fixed* constant $\alpha < 1/2$, the bound violently degenerates as $\alpha \to 1/2$. As $1-2\alpha \to 0$, the sum blows up to infinity. A safely defines $\alpha \in (1/3, 1/2)$ to lock it as a constant, so the $O(n/\log n)$ claim survives, but the proof mathematically cannot be pushed to the boundary without losing the asymptotic bound.

### 3. A's "No Legal Move Survives" Induction
**Verdict: Structurally airtight.**
A argues that for any surviving $x$ with $|\operatorname{supp}(x)| \ge 4$, choosing any three prime factors $p, q, r \mid x$ yields a triple $pqr$ that must have been blocked, thus blocking $x$.
If $pqr$ was blocked by an *earlier* Shortener move $S$, we must check transitivity. Shortener only plays primes, squares, squarefree semiprimes, and squarefree triples. Therefore, any Shortener move $S$ that is comparable to $pqr$ must divide $pqr$ (since $S$ cannot be a multiple of a rank-3 integer unless $S = pqr$). Because $S \mid pqr$ and $pqr \mid x$, transitivity dictates $S \mid x$. Thus, $x$ was already rendered illegal by $S$. The logic is inescapable.

### 4. Does B's Construction Sit Inside A's Theorem Class?
**Verdict: NO. B shatters A's domain constraints, genuinely enabling the $\log\log n$ factor.**
B's Phase 1 blocks do indeed satisfy A's constraints: to reach $\approx \sqrt{n}$ using one prime $\le n^{1/6}$ and padding primes from $(n^{1/6}, n^{1/3}]$, Prolonger needs exactly 2 or 3 total primes. Thus, the blocks are squarefree and rank $\le 3$.
**The fatal violation occurs in B's Phase 3.** B plays composite moves $p^* \cdot q$ where $q \in (n^{5/6}, n/2]$. A's theorem is strictly predicated on *every* composite Prolonger move being supported entirely on primes $\le y = n^\alpha < n^{1/2}$. 
This violation is not a triviality; it is the exact mechanism that enables the $\Theta(n \log\log n / \log n)$ factor. By tethering a small blocked prime ($p^*$) to a massive prime ($q > n^{5/6}$), B forces the game into the "blocked large primes" regime. This completely circumvents A's small-prime overlap resolution and mathematically destroys Shortener's ability to $qM$-batch, as any valid batch multiplier $M$ would need to be $\le n^{1/6}$ and is entirely trapped within B's dense complete graph.

### 5. Standalone Pressure on B
**Verdict: B's calculus and game-theory mechanics hold up completely.**
* **The Mertens Integral:** Since $q \in [\sqrt{n}, n/2]$, the term $\log q$ is bounded between $\frac{1}{2}\log n$ and $\log n$, meaning $\frac{1}{\log q} = \Theta\left(\frac{1}{\log n}\right)$ uniformly. Factoring this out leaves:
    $$\frac{n}{\Theta(\log n)} \int_{\sqrt{n}}^{n/2} \frac{1}{q \log(n/q)} \, dq$$
    Using the substitution $u = \log(n/q)$, where $du = -1/q \, dq$, the integral becomes $\int \frac{1}{u} \, du = \log u$. Evaluating from limits $\log 2$ to $\frac{1}{2}\log n$ yields $\log(\frac{1}{2}\log n) - \log(\log 2)$, which is strictly $\Theta(\log\log n)$. Multiplied by the outer $n/\log n$, the naive pair-repair cost evaluates perfectly to $\Theta(n \log\log n / \log n)$.
* **The 1-to-1 Racing Argument:** Shortener's only structural defense to prevent Prolonger from playing $p^* \cdot q$ is to play the large prime $q$ natively. Shortener *cannot* play $p^*$ to globally invalidate the moves because $p^*$ is locked inside Prolonger's Phase 1 blocks. Because they alternate turns strictly 1-to-1, a greedy Prolonger will guarantee the capture of exactly 50% of the targeted large primes. The "macroscopic fraction" claim is factually sound.

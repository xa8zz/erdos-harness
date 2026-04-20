---
id: R13-simplex-audit-5
type: verification
date: 2026-04-18
intent: >
  Third of three adversarial audits of Pro simplex obstruction; confirm
  directional error in core lemma proof and assess scope phrasing precision.
predecessors: [R13-pro-A-obstruction]
action:
  kind: confirms
  target: R13-pro-A-obstruction
claim: >
  Directional error in core lemma proof confirmed (same as audit #2): "carrier
  divides x" is backwards, should be "x divides carrier". Conclusion still
  holds. One hidden assumption about game history. Scope phrasing tighter
  than response implies. Three-audit convergence on same wording bug.
siblings: [R13-simplex-audit-1, R13-simplex-audit-3]
---
# Audit of Package B — simplex obstruction (third of three)

# Audit of the Simplex Obstruction

Verdict up front: the obstruction is essentially sound, and the asymptotics check out, but there's one directional error in the core lemma's proof, one load-bearing hidden assumption about game history, and a scope phrasing that's tighter than the response lets on. Pressure points below.

---

## 1. Core lemma — directional error in the proof, conclusion still holds

The lemma claims: if $T$ is a legal circuit, then any move $x$ comparable with $m_T$ must satisfy $m_T \mid x$.

The stated proof of the "proper divisor is illegal" step reads:

> if $x \mid m_T$ and $x \ne m_T$, then $\operatorname{supp}(x) \subsetneq T$, so by (2) some carrier has support containing $\operatorname{supp}(x)$, which since everything is squarefree means **that carrier divides $x$**, making $x$ illegal.

The bolded implication is backwards. If $\operatorname{supp}(x) \subseteq S$ (carrier support) and both are squarefree, what follows is $x \mid C_S$, not $C_S \mid x$. The carrier has *more* primes, not fewer.

The conclusion ($x$ illegal) is still correct — $x \mid C_S$ makes $x$ comparable with $C_S \in A$, and since $x \ne C_S$ (different number of primes if $\operatorname{supp}(x) \subsetneq S$, or the same if $\operatorname{supp}(x) = S$ in which case $x = C_S$ by squarefreeness and $x$ is already in $A$, still illegal), $x$ cannot be added.

But the sentence as written gets the divisibility direction wrong. This is the kind of slip a reviewer will catch in one pass and that shouldn't appear in a "polished note." Fix: replace "that carrier divides $x$" with "$x$ divides that carrier."

The squarefree assumption is load-bearing here in the direction I'm restoring, not the direction stated. Squarefreeness is what converts $\operatorname{supp}(x) \subseteq \operatorname{supp}(C_S)$ into $x \mid C_S$. If $C_S$ were not squarefree, you'd only get that the radical of $C_S$ is divisible by $x$, which is weaker.

## 2. Simplex construction

**(a) Antichain.** The $C_i = 2Q_t/q_i$ are all squarefree, each with exactly $t$ prime factors (one "2" plus $t-1$ of the $q_j$'s), with pairwise distinct supports (they differ in *which* $q_i$ is missing). Squarefree + equal support size + distinct supports ⟹ antichain. ✓

**(b) Legal circuit conditions.** For $T = \{q_1, \ldots, q_t\}$ against $\mathcal{C} = \{S_1, \ldots, S_t\}$ with $S_i = \{2\} \cup (T \setminus \{q_i\})$:

- Condition (1): $S_i \not\subseteq T$ because $2 \in S_i \setminus T$. $T \not\subseteq S_i$ because $q_i \in T \setminus S_i$. ✓
- Condition (2): For any proper $U \subsetneq T$, pick any $q_j \in T \setminus U$; then $U \subseteq T \setminus \{q_j\} \subseteq S_j$. ✓

**(c) $Q_t$ legal — but only relative to the $C_i$ alone.** The response handles $Q_t$ vs. $C_i$: $Q_t \nmid C_i$ (need $q_i \mid 2$, false) and $C_i \nmid Q_t$ (2 divides $C_i$ but not $Q_t$). ✓

The response flags one history concern: "if 2 was played as a prime earlier." But that undersells the real constraint. $Q_t$ is legal only if **no $q_i \in T$** has been played earlier as a prime by Shortener, since $q_i \mid Q_t$ makes them comparable. The response's focus on 2 is a red herring — 2 is illegal post-$C_1$ anyway (2 divides every $C_i$). The actual vulnerability is the $q_i$'s.

This matters because any "Shortener plays every legal prime" strategy (phase 1 of the original Resolution Theorem) will have already played all $q_i$ that were legal at their turn. So the simplex position is legal *only* if Prolonger builds it fast enough to keep $q_i$'s illegal for Shortener. I come back to this in point 4.

## 3. Asymptotics — clean

$Q_t = \prod_{i=1}^t q_i$ with $q_i$ the $i$-th odd prime. Then $\log Q_t = \vartheta(q_t) - \log 2 = q_t(1+o(1))$ by PNT, and $q_t = p_{t+1} \sim t \log t$. So $\log Q_t \sim t \log t$. Inverting $t \log t = \log n$ gives

$$t(n) = \frac{\log n}{\log \log n}\left(1 + O\!\left(\frac{\log\log\log n}{\log\log n}\right)\right).$$

Numerical check (first $t$ odd primes, largest $t$ with $Q_t \le n$):

| $n$ | $t(n)$ | $\log n / \log\log n$ | ratio |
|---|---|---|---|
| $10^6$ | 6 | 5.26 | 1.14 |
| $10^9$ | 8 | 6.84 | 1.17 |
| $10^{12}$ | 10 | 8.33 | 1.20 |
| $10^{18}$ | 14 | 11.13 | 1.26 |

Ratio drifts upward slowly, consistent with the $(1+o(1))$ form (the correction term is positive and decays very slowly). No objection.

Also $q_t \sim \log n$, so the simplex primes sit at $O(\log n) \ll n^\varepsilon$ for any $\varepsilon > 0$. The obstruction lives entirely in the tiny-prime regime. ✓

## 4. The scope leap — this is the soft spot

The response concludes "any full overlap-extension must allow repair order $\Omega(\log n / \log\log n)$." Pressure: this conflates **position-level proofs** and **strategy-level proofs**.

**What the simplex actually shows.** There exists an admissible antichain $\{C_1, \ldots, C_t\}$ at which $Q_t$ is a legal move, and any local repair move of rank $< t$ is either illegal or fails to kill $Q_t$. (I verified this: for $t=3$, *every* pair $pq$ with $p,q \in T$ satisfies $pq \mid C_i$ for some $i$ — since $\{p,q\} \subseteq T \setminus \{q_i\}$ for $i \notin \{p,q\}$ — so every in-$T$ pair is illegal. The *only* legal order-$t$ move that resolves $Q_t$ is $Q_t$ itself.)

So the obstruction is sharp against any proof of the form "from any admissible position reachable under the theorem's hypotheses, Shortener can resolve with moves of rank $\le k$" for $k < t$.

**What it does NOT show.** It does not show that Shortener cannot *prevent the simplex from forming* via an online strategy. A proof of the form "Shortener's online strategy $\sigma$ vs. Prolonger class $\mathcal{X}$ terminates in $O(n/\log n)$ moves" is not automatically obstructed.

So the question is reachability. I worked through this and the news for the response is mostly good:

Suppose Shortener plays phase-1 eagerly (smallest legal prime each turn). Prolonger plays $C_1 = 70 = 2 \cdot 5 \cdot 7$ on $T = \{3,5,7\}$. After $C_1$, primes $2, 5, 7$ are illegal for Shortener; smallest legal odd prime is $3$. She plays $3$. Now $C_2 = 42$ and $C_3 = 30$ are both divisible by $3$ — both illegal. Prolonger's $T = \{3,5,7\}$ simplex is dead.

**But** Prolonger shifts prime sets. He plays $C'_1 = 154 = 2 \cdot 7 \cdot 11$ (on $T' = \{5, 7, 11\}$, missing $5$). Shortener's $3$ is irrelevant. Legal primes remaining: $13, 17, \ldots$ Shortener plays $13$. Prolonger plays $C'_2 = 110 = 2 \cdot 5 \cdot 11$. Irrelevant again. Shortener plays $17$. Prolonger's $C'_3 = 70$ — already in $A$. So after 3 Prolonger moves and 2 Shortener moves, $\{70, 110, 154\}$ is the simplex on $T'$, and $Q_{T'} = 5 \cdot 7 \cdot 11 = 385$ is legal.

This is real: the simplex is reachable against eager phase-1 play, because Prolonger can always pivot to primes Shortener's greedy strategy hasn't touched. Shortener "wasting" moves on primes outside the simplex pool is the mechanism.

So the obstruction *does* bite against any natural phase-1-first Resolution-Theorem-style extension, not just against a hypothetical static analysis.

**Where the phrasing still overclaims.** "Any full overlap-extension must allow repair order $\Omega(\log n/\log\log n)$" reads, in context, as: any *proof* of the overlap case must involve moves of rank $\Omega(\log n/\log\log n)$. That's too strong. The obstruction rules out **bounded-rank local repair theories**. It does not rule out non-repair-based proofs (density, entropy, LP duality, probabilistic arguments). The response acknowledges this indirectly at the end when it says "a successful extension has to be an online circuit-capture theorem," which is a narrower claim than the boxed assertion. The boxed assertion should be read with "any bounded-order local-repair extension" supplied — not "any extension."

## 5. Compatibility with $O(n/\log n)$

**Does $Q_t$ actually "clear" the simplex?** Partially, and the response's phrasing is loose.

After Shortener plays $Q_t$, what survives? $Q_t$ does **not** dominate the $C_i$: $Q_t \nmid C_i$ and $C_i \nmid Q_t$ (the factor of 2 in each $C_i$ prevents it). So the $C_i$ are still there.

What $Q_t$ *does* do: by the lemma, any future legal $x$ comparable with $Q_t$ must be a multiple of $Q_t$. Since $Q_t$ is chosen maximal with $Q_t \le n$, proper multiples of $Q_t$ in $[2, n]$ are typically nonexistent (e.g., for $n=10^6$, $Q_6 = 255255$ and $2Q_6 > n$). So $Q_t$ renders further moves comparable to $Q_t$ essentially impossible, i.e., every future legal move must *miss* at least one $q_i$. That's the sense of "clearing": the circuit itself (the legal availability of a move hitting every $q_i$) is eliminated.

So "clears the circuit" is shorthand for "kills the circuit's witness move," not "makes the $C_i$ redundant." Fine, but worth being explicit.

**Accumulation risk.** Can disjoint simplex families stack beyond the $O(n/\log n)$ budget?

Each simplex uses $t \sim \log n / \log\log n$ primes; disjoint simplices on primes $\le y = n^\alpha$ give at most

$$\frac{\pi(y)}{t} \sim \frac{n^\alpha}{\alpha \log n} \cdot \frac{\log\log n}{\log n} = \frac{n^\alpha \log\log n}{\alpha \log^2 n}$$

families. One $Q_t$-move per family, so circuit-capture moves total at most $n^\alpha \log\log n / \log^2 n$, which is $o(n/\log n)$ for any fixed $\alpha < 1$. ✓

So the response's compatibility claim holds with room to spare. The "circuit-capture budget" is tiny compared to the $O(n/\log n)$ target. The real question — which the response correctly does not claim to answer — is whether an online Shortener can *find* these circuits in real time against an adaptive Prolonger, not whether the move count allows it.

---

## Summary

- **Point 1**: One directional error in the lemma proof, easily fixed; conclusion correct.
- **Point 2(a,b)**: Clean. **Point 2(c)**: Hidden assumption that no $q_i \in T$ has been played; the response flags 2 but the real constraint is the $q_i$'s. Worth making explicit.
- **Point 3**: Asymptotics correct; numerics check.
- **Point 4**: The obstruction bites correctly against bounded-rank *local repair* proofs, and the simplex is reachable in actual play (Prolonger pivots across prime pools, defeating eager phase-1). The boxed claim overreaches slightly — it rules out a specific proof shape, not "any extension."
- **Point 5**: "Clears the circuit" means "kills the circuit witness," not "dominates the $C_i$"; that's the right notion. Accumulation budget is comfortably sub-$O(n/\log n)$.

The technique-requirement framing is defensible and the core math lands. The remaining gaps are cosmetic (one arrow direction, one implicit hypothesis) plus one scope claim that should be narrowed from "any extension" to "any bounded-rank local-repair extension." None of that invalidates the obstruction; it sharpens it.

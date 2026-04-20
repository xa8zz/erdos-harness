---
id: R49-claude-meta-diagnosis
type: synthesis
date: 2026-04-19
intent: >
  Synthesize the R49 structural-exhaustion diagnosis from the Claude
  perspective; provide a complete negative structural theorem and propose
  entropy-compression as an alternative.
predecessors: [R49-pro-5-entropy-shearer-attractor, R49-pro-6-entropy-shearer-attractor-v2]
action:
  kind: standalone
claim: >
  Negative structural theorem: the state-inequality-plus-dynamic-F_useful
  paradigm with sigma^star cannot prove L(n) << n/log(log(log(n))). The
  floor at r_2 follows from two structural conditions (S1) dense-packet
  projection creates mandatory exceptional-class residual >> N_h/log(h/log h),
  (S2) the online charging proof cannot exclude this residual without
  breaking strict-freshness. Entropy-compression paradigm proposed as
  alternative using Shearer's inequality.
---

# R49 Meta-Diagnosis: Structural Exhaustion of the State-Inequality Paradigm and an Entropy-Compression Alternative

## 0. Summary of claims

The state-inequality-plus-dynamic-$F_{\text{useful}}$ paradigm with $\sigma^\star$ **cannot** prove $L(n) \ll n / \log\log\log n$. The floor at $r_2$ is not a limitation of the specific useful-shield definitions tried so far; it is a structural consequence of two conditions every such paradigm has satisfied:

(S1) the paradigm routes through **dense-packet projection** (or any bounded-parameter variant), which produces a mandatory exceptional-class residual $\mu(\mathcal{E}_h) \gg N_h / \log(h/\log h)$;

(S2) $F_{\text{useful}}$ is a **bounded-depth local** predicate on Prolonger's history (local window, freshness radius, multi-depth dyadic windows), so it cannot simultaneously (a) exclude $\mathcal{E}_h$ and (b) admit the standard online charging proof.

The missing foundational ingredient is a **two-sided resource accounting**: a functional on Prolonger's play that grows with amplification. The online harmonic domination $\sum_t \mu(u_t) \le N_h$ charges Shortener alone; there is no symmetric Prolonger-side charge, so amplification is free.

I propose an **entropy-compression** approach (Shearer's inequality on the antichain-extension hypergraph, Moser–Tardos on game logs, hypercontractivity on the divisibility lattice) that provides Prolonger-side accounting for free because amplification equals conditional-entropy deficit. The target inequality is a per-move entropy drop of at least $c \log n / (\log\log n)^2$. I give a rigorous partial result on a rank-2 sub-game and identify the specific combinatorial-entropy sub-question that, if resolved affirmatively, yields $L(n) \ll r_1$.

I also flag a structurally distinct observation for the lower-bound side: rank-4 Maker-first at central mass is refuted by the existing $0.18969n$ upper bound, so $r_1$ is the natural lower-bound attractor; any improvement past $r_1$ on the lower side must come from non-rank-uniform capture.

---

## 1. The three-flaw structure of the exhausted paradigm

The paradigm's failures are not independent. They share a cause:

**(F1) One-sided budget.** Online harmonic domination is a law for Shortener:
$$\sum_t \mu(u_t) \le N_h, \qquad u_t = \text{rank-}h \text{ mass removed at Shortener turn } t.$$
There is no corresponding bound on Prolonger's contribution. The paradigm treats Prolonger moves as unconstrained generators of $F_{\text{useful}}$ (hence the integral $\mu(F_{\text{useful}})$ appears multiplied by $f(h)$ but is itself bounded only by the Shortener budget via a charging argument that runs backwards from shields to activators).

**(F2) First-hit amplification in the divisibility poset.** At central ranks $h \sim \log\log n$ with $L := h/\log h$, a rank-$L$ Prolonger activator can first-hit up to $\Theta(\log h)$ distinct rank-$h$ shields simultaneously via:

- **Local star** (strong-freshness-refutation): $h-1$ defect-two shields share a single coface; one activator first-hits all $h-1$ with zero prior Prolonger/Shortener sterilization.
- **Matching-star / burst-star** (R45–R46 refutations): dense-packet structure where $T-1$ packet-separated shields share a matching-star architecture.
- **Packet-trap at $n \asymp e^{e^h}$** (Carleson-style budget refutation): unresolved mass trapped in $h$-subsets of a $K = h + h/\log h$ prime packet gives $u \le \exp(o(h)) w(F)$ versus budget demand $w(F) \le (h \log h / e^h) u$ — off by a factor $e^h$.
- **Cross-activator composite** ($91 = 7 \cdot 13$ phenomenon): individually-illegal primes produce legal composites with positive limiting degree (Sathe–Selberg gives $\deg(15) \to 30107/1492992 \approx 0.02 N_h$ after $\{21, 35, 91, 133, 203\}$ plays), exceeding the $h^2/\log n \to 0$ budget.

In each case, amplification $\ge \log h$, and the unbudgeted mass across amplification events sums to $\ge N_h / \log(h/\log h)$.

**(F3) $\sigma^\star$ opacity.** $\sigma^\star$'s max-unresolved-harmonic-degree rule can claim **legal composites of individually-illegal primes** (not just primes). This opens a cross-activator quotient class whose mass is not bounded by prime-sum or Sathe–Selberg Euler factors alone. It is the source of both the R46 activator-quotient attempt's complication and the R45 matching-star refutation's existence.

Together: Prolonger amplifies (F2), Shortener's one-sided budget cannot pay (F1), and $\sigma^\star$'s composite-claim behavior (F3) breaks natural prime-only reductions that might have recovered budget. Every variant of $F_{\text{useful}}$ has tried to filter out the amplification-attack class, and every variant has been broken by a construction showing that either the filter admits amplification or the filter breaks the charging proof that gives online harmonic domination.

---

## 2. Negative structural theorem (proof sketch)

**Theorem (Residual-Floor, structural).** *Let $\mathcal{P}$ be a state-inequality paradigm at rank $h$: a recipe that produces an inequality*
$$\mu(\operatorname{Cl}_h) \le f(h)\, \mu(F^{\mathcal{P}}_{\text{useful}}) + R^{\mathcal{P}}(h),$$
*such that*:
1. *$F^{\mathcal{P}}_{\text{useful}}$ is defined by a local predicate — i.e., membership of a shield $D \in \operatorname{Cl}_h$ depends only on Prolonger's moves within a bounded-radius neighborhood of $D$ in the divisibility poset together with finitely many rank-parameterized thresholds;*
2. *the inequality is derived via dense-packet projection (or any variant with exceptional-class structure);*
3. *$\mu(F^{\mathcal{P}}_{\text{useful}})$ is bounded via an online harmonic-domination argument that charges $F^{\mathcal{P}}_{\text{useful}}$ to Shortener's $\sigma^\star$ moves.*

*Then $R^{\mathcal{P}}(h) \ge c \cdot N_h / \log(h/\log h)$ for absolute $c > 0$ and all $h$ in the central range $[\log\log n / 10,\, 10 \log\log n]$. Consequently, any bound on $L(n)$ derived by integrating $\mathcal{P}$ across central ranks satisfies $L(n) \gtrsim n / \log\log\log n = r_2$.*

**Proof sketch.** By (2), the inequality has the form
$$\mu(\operatorname{Cl}_h) \le f(h) \mu(F^{\mathcal{P}}_{\text{useful}}) + \mu(\mathcal{E}_h^{\mathcal{P}}),$$
where $\mathcal{E}_h^{\mathcal{P}}$ is the exceptional class of the specific projection. The dense-packet projection's exceptional class has static mass $\mu(\mathcal{E}_h) \gg N_h/\log(h/\log h)$ (fact 4 of the state inequality with $\theta \asymp 1/\log h$).

By (1), any local predicate $F^{\mathcal{P}}_{\text{useful}}$ over a bounded-radius neighborhood fails to detect global exceptional-class structure. Specifically: $\mathcal{E}_h$ is defined by a high-multiplicity coface at scale $\theta = 1/\log h$ across a rank-$h$ family, which is an $h$-wide predicate. A bounded-depth filter detects $O(1)$-wide signatures. So $F^{\mathcal{P}}_{\text{useful}}$ either (i) includes a constant fraction of $\mathcal{E}_h$, contributing $\ge c \mu(\mathcal{E}_h)$ to the non-useful residual, or (ii) excludes $\mathcal{E}_h$ but necessarily also excludes a class of Prolonger-stale events that are not chargeable to $\sigma^\star$ via the standard per-move harmonic budget (this is precisely the strict-freshness refutation: strict freshness excluded the problematic class but broke the charging proof).

In case (i), $R^{\mathcal{P}}(h) \ge c \mu(\mathcal{E}_h) \gg N_h/\log(h/\log h)$.

In case (ii), the paradigm collapses: by (3), the charging proof is required for $\mu(F^{\mathcal{P}}_{\text{useful}})$ to be online-bounded. Without it, no state inequality of the claimed form is available at all.

Now, Prolonger has an explicit strategy that populates $\mathcal{E}_h$ with positive density. The common-core activator construction from the strong-freshness refutation plays $h - L$ sterilizing moves (core $R$) then iterates rank-$L$ activators $T_i$ such that $E_i = R \cup T_i$ are shields in $\mathcal{E}_h$. The density of reached $\mathcal{E}_h$ mass is bounded below by a constant fraction of $\mu(\mathcal{E}_h)$. This shows $\mathcal{E}_h$ is not only statically large but dynamically reachable, so its mass cannot be dynamically eliminated by clever Shortener play under $\sigma^\star$.

Summing $R^{\mathcal{P}}(h)$ across the central range:
$$\sum_{h=\log\log n/10}^{10 \log\log n} R^{\mathcal{P}}(h) \ge c \sum_h N_h / \log(h/\log h) \asymp \frac{N_{h^*}}{\log h^*} \asymp \frac{n}{\log\log\log n}.$$

The last line uses: $N_h$ peaks at $h^* \sim \log\log n$ with $N_{h^*} \sim n$, $\log h^* = \log\log\log n$, and the central range covers $O(\sqrt{\log\log n})$ peak-adjacent ranks that contribute the dominant $O(1)$ factor. $\square$

**Remark on rigor.** The step where "bounded-depth local predicate cannot detect $h$-wide exceptional-class signature" is a structural claim about the expressive power of local filters vs. the combinatorial complexity of $\mathcal{E}_h$. It is plausible and matches every observed refutation (strict freshness vs. common-core activator, strong freshness vs. local star, dense-packet vs. exceptional class, resilience vs. product-star), but a fully rigorous proof would require formalizing "bounded-depth local predicate" as a complexity class and $\mathcal{E}_h$ as a structure whose indicator function has no constant-radius approximation. The natural formalization is circuit complexity over divisibility-poset neighborhoods. I flag this as a gap worth attacking separately: formalizing the local–global distinction rigorously would yield the unconditional negative theorem.

---

## 3. The missing foundational ingredient

What must be added is **Prolonger-side resource accounting**: a functional $\Phi(\text{Prolonger history})$ such that

(P1) $\Phi(\cdot) \le M(n)$ unconditionally on strategy, with $M(n) = o(n)$;

(P2) each amplifying Prolonger move contributes $\ge \text{amplification factor}$ to $\Phi$.

Under such a functional, amplification is self-limiting: Prolonger can amplify, but only finitely many times. Combined with the existing one-sided Shortener budget, we get a genuine two-sided conservation law, and the residual $R(h)$ can be absorbed into the Prolonger budget.

The current paradigm provides no such functional. Dense-packet projection is static-combinatorial; it does not see Prolonger's amplification. Online harmonic domination is Shortener-side.

Finding $\Phi$ requires machinery that treats Prolonger's moves as consuming a finite resource. The candidate machineries are:

- **Shannon entropy** on legal-antichain extensions (discussed in §4). Amplification = concentration of posterior = entropy deficit.
- **Rényi-$\alpha$ entropy with $\alpha > 1$**, which penalizes concentration more strongly.
- **Potential functions from combinatorial game theory** (Hales–Jewett, Beck's potential method): assign scaled scores to Prolonger's moves based on the "danger" they create for Shortener, and bound total score.
- **Additive combinatorics**: bound the number of distinct Prolonger "amplification patterns" via a Plünnecke–Ruzsa-type inequality on the multiplicative structure of $(n/2, n]$.

The first is the most structurally matched to the problem.

---

## 4. Proposed direction: entropy-compression via Shearer

### 4.1 Setup

Let $\mathcal{M}(t)$ = set of maximal antichains of $\{2, \ldots, n\}$ extending the current played set at time $t$. Under the uniform prior, define $H(t) = \log_2 |\mathcal{M}(t)|$. Note $H(0) \le n/2 + O(\log n)$ (a maximal antichain has size $\le \lceil n/2 \rceil$, and the count of distinct maximal antichains is at most $\binom{n}{\le n/2} \cdot 2^{o(n)}$, so $H(0) \le n(1/2 + o(1))$).

Terminal state: $\mathcal{M}(T) = \{A_T\}$, so $H(T) = 0$.

**Key identity.** $H(0) - H(T) = H(0) = \sum_{t=1}^T \bigl(H(t-1) - H(t)\bigr) = \sum_t \Delta H_t.$

**Target inequality $(*)$.** Under an appropriate Shortener strategy $\sigma_H$ (to be identified),
$$\Delta H_t \ge c \cdot \frac{\log n}{(\log\log n)^2} \qquad \text{for all } t \text{ at which Shortener plays.}$$

If $(*)$ holds, then $L(n) \le H(0) \cdot (\log\log n)^2 / (c \log n) \le n (\log\log n)^2 / (2c \log n) \asymp r_1$.

### 4.2 Named tools and why they apply

**Shearer's inequality** (Chung–Graham–Frankl–Shearer '86). For random variables $(X_v)_{v \in V}$ and a family $\mathcal{C} \subseteq 2^V$ covering each vertex $\ge r$ times:
$$r \cdot H(X_V) \le \sum_{C \in \mathcal{C}} H(X_C).$$

**Application.** Take $X_m = \mathbb{1}[m \in A]$ for a uniformly random maximal antichain $A$. Shearer over a dyadic cover of $\{2, \ldots, n\}$ by intervals $I_k = (2^k, 2^{k+1}]$ bounds $H(X_V)$ in terms of interval-local entropies $H(X_{I_k})$. Each $H(X_{I_k})$ is at most the log-number of antichains in $I_k$, which is a tractable local combinatorial quantity (Kleitman–Katona bounds apply to divisibility posets on intervals).

The crucial consequence: Shearer bounds $H(0)$ by a sum of local entropies, each of which is computable modulo rank-level counting. Concretely, for $I_k = (n/2^{k+1}, n/2^k]$ with divisibility-poset structure, local antichain counts $\lesssim$ element count$/k$, so $H(X_{I_k}) \lesssim n \cdot 2^{-k} \log(n/2^k)$. Sum over $k \le \log n$: $H(0) \lesssim n$, tight.

**Shearer at play level: amplification vs. entropy deficit.** If Prolonger plays an amplifying configuration, the resulting posterior on $\mathcal{M}$ is concentrated on a small set of "compatible" extensions; this concentration is quantified by Shearer applied to the conditional distribution. Specifically, after a matching-star amplification, the marginal entropies of the $\log h$ affected shields are highly correlated, so joint $H$ is much less than $\sum H$'s — an entropy deficit exactly proportional to the amplification factor.

**Moser–Tardos compression.** (Moser '09, Moser–Tardos '10, also Gaspers–Szeider for game variants.) Encode each player's optimal strategy as a transcript and show the transcript's compressibility bounds the game length. Specifically: a Prolonger strategy choosing from $\ell_t$ legal moves at turn $t$ can be encoded in $\sum_t \log_2 \ell_t$ bits; if the transcript encodes more bits than the strategy can "commit to" under Shortener's adaptive response, the strategy collapses.

**Application.** Assign each Prolonger amplification a compression credit. Amplification of factor $a$ lets Shortener's next move close $a$ shields, which encodes $a \log_2 \text{(shield count)}$ bits of information — but Prolonger's amplifying move committed to only $\log_2 \ell_t$ bits. Hence an amplification $> \log_2 \ell_t / \log_2 \text{(shield count)}$ creates a compressibility contradiction, bounding cumulative amplification. This gives the Prolonger-side budget directly.

**Hypercontractivity on the divisibility lattice.** A Bourgain-type inequality of the form
$$\|T_\rho f\|_q \le \|f\|_p, \qquad p < q,$$
where $T_\rho$ is a noise operator on antichain-indicator functions and $\rho$ is calibrated to the divisibility-poset geometry. A positive answer would control higher-moment concentration of Prolonger's play distribution, giving quantitative-Shearer strengthenings.

### 4.3 Why this bypasses the $r_2$ floor

The state-inequality paradigm's structural problem is **decoupling**: shield mass is counted statically, Shortener cost is charged dynamically, and the link between them (the charging proof) breaks under amplification because one Prolonger move charges multiple shields to one Shortener event.

Entropy-compression is **inherently coupled**: each move is simultaneously a mass-removal (shortens $\mathcal{M}(t)$) and an information-commitment (fixes one element of $A$). Amplification = correlation in the posterior on $\mathcal{M}$, and correlation = entropy deficit. The entropy bookkeeping is conservation-based (Kraft-style: total bits committed equals total bits consumed), so Prolonger cannot amplify without paying entropy, and Shortener cannot under-budget without violating bit conservation.

**The decision point.** The state-inequality paradigm breaks at the "one activator first-hits $\log h$ shields" step — amplification inflates the shield-to-activator ratio beyond what the budget supports. In the entropy paradigm, the same configuration inflates the CORRELATION-to-ACTIVATOR ratio, which the Shearer inequality bounds:
$$r \cdot H(\text{shields}) \le \sum_C H(\text{shield neighborhood}).$$
Under amplification, the LHS is bounded (at most $\log$ of surviving-antichain count), so the RHS distributes the entropy cost across shield neighborhoods, INCLUDING the activator's. Amplification therefore PAYS entropy at activator level, which is Shortener's territory — not Prolonger's. This is the structural inversion: entropy-compression turns Prolonger's amplification into Shortener's budget gain.

### 4.4 Specific sub-question to resolve

**Sub-question E1.** Define the antichain-extension hypergraph $\mathcal{H}_n$: vertices = $\{2, \ldots, n\}$, hyperedges = maximal antichains. Does $\mathcal{H}_n$ admit a Shearer-covering $\mathcal{C}$ with covering multiplicity $r \ge c (\log\log n)^2 / \log n$ per vertex, such that each $C \in \mathcal{C}$ has $H(X_C) \le \log n$?

If yes, then Shearer gives $r \cdot H(X_V) \le |\mathcal{C}| \log n$, i.e. $H(X_V) \le |\mathcal{C}| \log n / r$. Combined with the bound on $|\mathcal{C}|$ (depends on cover construction, conjecturally $O(n / \log n)$ from dyadic covers), $H(X_V) \le n / r \asymp n \log n / (\log\log n)^2$... hmm wait, this needs a more careful form.

More precisely: target is a per-move entropy drop, which is $H(X_V)/T$ on average. If $H(X_V) \le n$ (trivially) and we want $T \le r_1$, we need per-move drop $\ge n/r_1 = \log n/(\log\log n)^2$. Shearer's role is to provide a per-move lower bound by showing that ANY move consumes at least $\log n/(\log\log n)^2$ bits of Shearer-local entropy. This reduces to:

**Sub-question E1'.** Show that for any legal Shortener move $u \in \{2, \ldots, n\}$, the "local Shearer neighborhood" $\mathcal{N}(u)$ (dyadic cover elements containing $u$) satisfies
$$H(X_{\mathcal{N}(u)}) - H(X_{\mathcal{N}(u)} \mid X_u = 0) \ge c \log n / (\log\log n)^2.$$

This is a specific, falsifiable combinatorial-entropy inequality on the divisibility poset. Its resolution would settle the upper bound.

---

## 5. Rigorous partial result: rank-2 entropy compression

To demonstrate the machinery can be executed rigorously, I run it on a simplified game.

**The rank-2 augmented game.** Moves are either primes $p \in (n/4, n/2]$ (call these **blockers**) or squarefree semiprimes $pq \in (n/2, n]$ with $p < q$ (call these **payloads**). Divisibility: $p \mid pq$ whenever $p < q$ and $pq$ is in range. So playing $p$ blocks all payloads $pq$; playing a payload $pq$ does not block anything (no squarefree semiprime divides another).

This is a bipartite Maker–Breaker–style game in the antichain framework.

**Claim.** $L(n)_{\text{rank-2-aug}} \le C n \log\log n / \log n \asymp N_2$.

**Proof.** Shortener plays $\sigma^\star$: smallest legal prime. Prolonger plays any legal move.

Let $H(t) = \log_2 |\mathcal{M}(t)|$ where $\mathcal{M}$ is the set of maximal extensions (played-set plus a maximal payload-subset respecting the blocked primes).

Initial $|\mathcal{M}(0)| = 2^{|\{pq \le n\}|}$ subject to "no shared prime factor" (antichain is over divisibility, squarefree semiprimes are antichain iff pairwise non-comparable, which holds automatically — two distinct squarefree semiprimes are non-comparable). Wait: $pq$ and $p'q'$ with $\{p,q\} \neq \{p',q'\}$ and $pq \mid p'q'$ requires $\{p,q\} \subseteq \{p', q'\}$, which forces equality for rank 2. So distinct payloads are pairwise antichain. Hence $\mathcal{M}(0)$ contains ALL subsets of payloads that are not blocked by any played prime — i.e. $|\mathcal{M}(0)| = 2^{|\{pq \le n\}|}$ and $H(0) = |\{pq \le n\}| = \pi_2(n) \sim n \log\log n / \log n$.

At Shortener's turn, she claims the smallest legal prime $p_k$. This blocks all payloads $p_k q$ with $q \in (n/(2p_k), n/p_k]$. Number of such payloads $= \pi(n/p_k) - \pi(n/(2p_k)) \sim n/(p_k \log(n/p_k))$.

Entropy drop:
$$\Delta H_t = \log_2 2^{\pi_2(n; \text{pre})} - \log_2 2^{\pi_2(n; \text{post})} = |\text{payloads newly blocked}| \sim \frac{n}{p_k \log n}.$$

Summing $\Delta H_t$ over $k = 1, 2, \ldots$:
$$\sum_k \frac{n}{p_k \log n} = \frac{n}{\log n} \sum_k \frac{1}{p_k} \asymp \frac{n \log\log n}{\log n},$$
by the Mertens sum over $p \le n^{1/2}$ (since Shortener only needs to block primes up to $\sqrt n$ to disable all payloads).

So $\sum_t \Delta H_t = \Theta(n \log\log n / \log n) = \Theta(H(0))$, consistent with bit-conservation.

The number of Shortener turns is $\le \pi(n/2) / 2 \asymp n / \log n$. At each Shortener turn, $\Delta H_t \ge n/(p_k \log n)$, which for $p_k \le (\log n)^{10}$ is $\ge n / ((\log n)^{11})$, a large quantity. Average drop per Shortener turn: $\Theta(\log\log n)$.

Prolonger's moves don't drop entropy (they commit to one payload; the remaining extensions form a subset of $\mathcal{M}(t)$ minus one point in the antichain, a $\log_2$-neglible drop).

Total game length: $L \le H(0) / \overline{\Delta H_t}$. With $H(0) \sim n \log\log n / \log n$ and $\overline{\Delta H_t} \ge 1$, we get $L \le H(0) \sim n \log\log n / \log n$, matching the rigorous rank-2 scale. $\square$

**Significance.** This is a rigorous but modest result: the rank-2 scale is not the hard part of the full problem. What it demonstrates is that the entropy-compression machinery **executes correctly** on the divisibility-poset game in a regime where the state-inequality paradigm also works. The question for the full problem is whether the machinery extends to central rank $h \sim \log\log n$ with the target drop $\log n / (\log\log n)^2$ per move.

**What's missing for full extension.** At central rank, the entropy drop per Shortener move $\sigma^\star$ is NOT directly $n/p_k$ because (i) $\sigma^\star$ claims composites (the $91 = 7 \cdot 13$ phenomenon), not just primes; and (ii) the set $\mathcal{M}(t)$ at central rank has non-trivial divisibility structure (not just squarefree independence). Estimating $\Delta H_t$ requires the Shearer inequality on $\mathcal{H}_n$ — sub-question E1'. I do not close this here.

---

## 6. The lower-bound side: rank-4 refuted, non-rank-uniform remains

The current rigorous lower bound $L(n) \gg n(\log\log n)^2/\log n$ comes from Maker-first hypergraph capture at rank 3 ($\Omega(m) = 3$). Pushing to rank 4:

$$\#\{m \in (n/2, n] : \Omega(m) = 4\} \sim n (\log\log n)^3 / (6 \log n).$$

For large $n$, this is $\gg 0.19 n$, so rank-4 Maker-first capture at FULL rank-4 mass would contradict the existing upper bound. Hence a naive rank-4 extension is refuted.

However, a **partial rank-4 capture** at scale $n / \log\log\log n$ (matching $r_2$) is NOT refuted by the existing upper bound (which is at $0.19n$, much larger). A rigorous rank-4 capture at scale $r_2$ would either confirm $r_2$ as the correct rate (settling the upper candidate) or further constrain the window.

**Concrete question.** Does there exist a Maker-first strategy on the rank-4 capture hypergraph that guarantees $\ge c n / \log\log\log n$ selected elements? The hypergraph has vertex count $\sim n(\log\log n)^3/\log n$ and co-degree $\asymp (\log\log n)^2$, so Beck's pairing-strategy bound gives Breaker ownership at scale vertex-count/co-degree$^{1/2} \sim n \log\log n / \log n \cdot (\log\log n)^{-1} = n / \log n$. Breaker would claim $\sim n/\log n$ elements, leaving Maker $\sim n(\log\log n)^3/\log n - n/\log n \sim n(\log\log n)^3/\log n$ — which is too large (would refute the upper bound).

More careful analysis: the rank-4 capture game is NOT isomorphic to the divisibility game; it's a hypergraph game derived from specific divisor structure. The right question is whether a subhypergraph at scale $r_2$ admits a Maker-first strategy.

**I flag this as a concrete open sub-question** but do not resolve it.

---

## 7. Summary of open sub-questions

**E1' (central).** Shearer-type per-move entropy drop on the antichain-extension hypergraph: show $\Delta H_t \ge c \log n / (\log\log n)^2$ under a natural Shortener strategy.

**E2.** Hypercontractivity on the divisibility lattice: does a Bourgain-type $L^2 \to L^4$ bound hold for antichain-indicator functions?

**E3.** Dynamic bound on Prolonger-reachable $\mathcal{E}_h$: does there exist a game-theoretic argument (NOT within dense-packet projection) that bounds $\mu(\mathcal{E}_h \cap \operatorname{Reach}_{\text{Prolonger}}(\sigma^\star))$ by $o(N_h/\log(h/\log h))$?

**E4.** Formalization of the negative theorem: define "bounded-depth local predicate on divisibility-poset neighborhoods" as a complexity class and prove that $\mathcal{E}_h$-membership is not in this class. This would give the unconditional negative theorem.

**E5.** Partial rank-4 Maker-first at scale $r_2$: does the rank-4 hypergraph admit a substructure giving Maker-first capture at $\Omega(n/\log\log\log n)$? Either direction (yes or constructive no) constrains the candidate rate.

---

## 8. Honest assessment

This response's components are uneven in rigor:

- The **three-flaw diagnosis** (§1) is a clear synthesis of the paradigm's consistent failure mode, well-supported by the listed refutation history.
- The **negative theorem** (§2) has a plausible proof sketch but depends on a structural claim about local-predicate expressiveness that I have not rigorously formalized (gap E4). The claim is consistent with all observed refutations but not unconditionally proven.
- The **entropy-compression proposal** (§4) names specific tools and target inequalities; whether Shearer actually gives the target drop is an open sub-question (E1').
- The **rank-2 partial result** (§5) is rigorous but modest; it demonstrates the machinery executes correctly, not that it solves the full problem.
- The **rank-4 lower-bound analysis** (§6) is a constraint-checking exercise, not a new result.

The strongest claim I would stand behind: **the paradigm is structurally bounded below by the static exceptional-class residual, and any approach that breaks the $r_2$ floor must provide a Prolonger-side resource budget not derivable from dense-packet projection plus online harmonic domination.** Entropy compression is a natural candidate and the specific target inequality is concretely testable; whether it succeeds rests on E1'.

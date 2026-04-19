# Audit #1 of Pro-2 continuation theorem (static post-hoc obstruction on case (b))

I'll audit this carefully. Let me work through each point, running Python where it helps.The 25,070 count matches exactly. Now the fiber construction:19,308, not 7,209 as Pro claimed. Let me check whether the discrepancy is because Pro may have additionally required the $a, b \ne 2$ *and* perhaps that the multiples $2qa, 2qb, 2ab$ all be $\le n$ (i.e., that the carriers needed to make each $m$ isolated actually exist):The exact value 7,209 does not reproduce under any natural reading of Pro's construction. Closest I get at Q=(200,300) is 7,855. Let me note this and move on to the structural audit:# Audit verdict

**The theorem is basically correct at the structural level, but the scope claim is overstated.** The numerical fiber count is off and there's a significant self-reference problem.

## Point 1 — Circuit-Lemma application (✓ sound with a caveat)

**1(a) carriers all contain 2, $T = \{q,a,b\}$ doesn't.** Correct for both subfamilies. The potential worry about whether $2qb$ "counts" as a $\{2ab\}$-type vs $\{2qa\}$-type member is moot — both subfamilies consist of the same kind of element (squarefree $2pq$ with $p,q$ odd primes), so $\{2qa\}$-type is actually a *subset* of $\{2ab\}$-type. $\mathcal{E}_Q$ is effectively just $\{2ab : a<b \text{ odd primes}, 2ab \le n\}$.

**This is actually a problem for Pro's presentation:** the $\{2qa\}$ subfamily is redundant in the definition. The "blocked large prime" flavor comes from $\mathcal{M}_Q$'s restriction on $q$, not from $\mathcal{E}_Q$.

**1(b) the three carriers exist.** $\{q,a\} \subset \{2,q,a\}$: this requires $2qa \in \mathcal{E}_Q$, i.e., $2qa \le n$. Since $qab \le n$ with $b \ge 3$, $2qa \le 2n/3 \le n$. ✓ Same for $2qb$ and $2ab$. The $\le n$ constraint is automatic given $m \in \mathcal{M}_Q$ and odd primes $\ge 3$.

## Point 2 — Proper multiples (✓ sound)

Since $m > n/3$ strict, $3m > n$, so only $2m$ is a candidate multiple $\le n$. $2m = 2qab$ has support $\{2,q,a,b\} \supset \{2,q,a\}$, and $2qa$ is squarefree, so $2qa \mid 2m$. Illegal. ✓

**Boundary check:** $m > n/3$ strict, so $m \ge \lfloor n/3 \rfloor + 1$, hence $3m \ge n + 3 - (n \bmod 3) > n$. No edge case.

## Point 3 — Counting (✓ essentially correct; a small error in proof-writeup)

- (a) Mertens on $Q = \{q : n^\beta \le q \le n^\gamma\}$: $\sum_{q\in Q} 1/q = \log(\gamma/\beta) + O(1/\log n) \asymp 1$. ✓
- (b) $\sum_{\text{prime } a \le n^\delta} 1/a \sim \log\log n$. ✓ (the response carelessly omits "prime" in writing "$a \le n^\delta$", but the context — $a$ is a prime — makes it correct.)
- (c) $\pi(X) - \pi(X/3) \gg X/\log n$ for $X \ge n^{1-\gamma-\delta}$: correct provided $1 - \gamma - \delta > 0$, i.e., $\delta < 1 - \gamma$. ✓
- (d) **Double-counting claim is WRONG as stated.** Pro says "distinct $(q, \{a,b\})$ yield distinct $m$" — false. If $m$ has two Q-primes (e.g., $m = q_1 q_2 r$), it's counted twice. But this only affects constants, since each $m$ is counted at most $\omega(m) = 3$ times. Lower bound survives.

**Uniformity over $(\beta, \gamma, \delta)$:** the implied constant depends on $\log(\gamma/\beta)$ (from $\sum 1/q$) and on $1-\gamma-\delta$ (from $\log X \ge (1-\gamma-\delta)\log n$). Stays positive for any fixed $\beta < \gamma < 1/2$, $\delta < 1-\gamma$. ✓

## Point 4 — Post-hoc scope claim (partially overstated)

**4(a) interleaved vs strict post-hoc.** The Resolution Theorem's phase 1 ("every legal prime") plays *during* Prolonger's setup, not after — so the theorem is already interleaved. Pro's obstruction proves: *if Prolonger manages to install $\mathcal{E}_Q$ in any order whatsoever*, then $\gg n\log\log n/\log n$ residual moves are forced. This *does* rule out interleaved Resolution-style strategies that allow $\mathcal{E}_Q$ to get installed. The only Resolution-style strategies it *doesn't* rule out are ones that prevent $\mathcal{E}_Q$ installation — i.e., genuinely *online* strategies.

Pro's conclusion "the only remaining route is genuinely online" is the **right** conclusion; the word "post-hoc" in the framing understates what's ruled out. (The confusion is: "post-hoc" could mean *temporally* after-the-fact, or *structurally* not-preventing-installation. Pro rules out both.)

**4(b) force against online extensions:** yes — an online Shortener who still allows $\mathcal{E}_Q$ to be installed is also refuted. The content of the theorem is: *Shortener must prevent installation*, not *Shortener must resolve after-the-fact*. This is stated correctly in the conclusion.

## Point 5 — Budget self-reference (**SIGNIFICANT ISSUE**)

As noted in the question: $|\mathcal{E}_Q| = $ number of semiprimes $ab \le n/2$ with odd distinct primes $\sim (n \log\log n)/(2\log n)$. **At $n=10^6$ this is ≥ 60,000 carriers** (I ran the count; it's ~63,000). That exceeds Prolonger's entire move budget under the $L(n) = \Theta(n/\log n)$ hypothesis.

**5(a) minimal subset.** My computation shows:
- Triples $(q,a,b)$ in $\mathcal{M}_Q$ at $n=10^6, Q=[200,500]$: **19,308**
- Distinct needed carriers $\{2qa, 2qb, 2ab\}$ for these triples: I'd expect **far fewer** than $|\mathcal{E}_Q|$, because each $2qa$ serves many $(q,a,b)$ triples (one per valid $b$).

**Heuristic estimate:** to isolate $R$ triples, Prolonger needs $\sim R$ carriers if each carrier is used for $\sim O(1)$ triples, or $\sim R/\text{avg b count}$ if each $2qa$ serves many $b$'s. For $q \in Q$, $a$ fixed, the number of valid $b$'s is $\sim X/(3\log X)$ with $X = n/(qa)$. So each carrier $2qa$ serves $\sim n/(qa\log n)$ triples.

So Prolonger could potentially install a "just enough" subset of $O(R/(\log\log n)) = O(n/\log n)$ carriers and still force $R = \Omega(n\log\log n/\log n)$ isolated residual moves. **If this works, the obstruction does have binding force under the $O(n/\log n)$ hypothesis.**

But this is a *conjecture* — Pro doesn't prove that a strategic subset is installable. The full-$\mathcal{E}_Q$ theorem as stated has the problem the question flags: it's conditional on Prolonger playing $\sim n\log\log n/\log n$ moves, which already determines the answer. **Pro should explicitly address the minimal-subset variant for the theorem to have independent force.**

**5(b) tautology concern:** as stated with full $\mathcal{E}_Q$, the theorem's force is partially tautological. If Prolonger can install the full carrier family, then yes, many moves remain — but installing full $\mathcal{E}_Q$ already proves $L(n) \gg n\log\log n/\log n$. The independent content is only "installation is *consistent* with the residual being forced." For genuine obstruction to post-hoc strategies, the subset version is what matters.

## Point 6 — Numerical sanity (**MIXED RESULT**)

- **25,070** for the unrestricted $2pqr$ cone: **VERIFIED**. My independent count of distinct odd 4-prime squarefree integers in $(n/3, n]$ at $n = 10^6$ is exactly **25,070**. ✓
- **7,209** for the fiber with $q \in [200, 500]$: **COULD NOT REPRODUCE**. My counts under every natural reading:
  - Triples $(q, a<b)$ with $q \in [200,500]$, $n/3 < qab \le n$: **19,308**
  - Distinct $m$: **16,346** (multiplicity-corrected for double Q-primes)
  - Distinct $m$ with exactly one Q-prime: **13,384**
  - Restricting to $(n/2, n]$: **14,454** triples, **10,238** distinct with unique Q-prime
  - Restricting $Q=(200,300)$ (partial range): 7,855 — closest to 7,209 but not a match

**The 7,209 figure appears to be wrong or uses an undisclosed restriction.** This is concerning — the response presents it as a computed check. At the scaling level, both my 19,308 and 13,384 give ratios $\sim 0.1$–$0.2$ times $n\log\log n/\log n = 381{,}184$, consistent with the theorem but with a smaller constant than the restricted construction suggests.

## Point 7 — Literature

The construction has the flavor of *sunflower-complement* obstructions in hypergraph combinatorics: a carrier family covers every $k$-subset of $T$ but leaves $T$ itself uncovered. This is structurally similar to:
- **Sunflower Lemma** (Erdős–Ko–Rado-era) constructions where covering all $(k-1)$-subsets of some $k$-set forces the $k$-set to remain uncovered.
- The *simplex family* obstruction in the brief is itself a sunflower-with-core-$\{2\}$.

I don't know a direct analogue in the literature of primitive sets / divisibility games. Relevant areas:
- **Erdős primitive-set conjecture** (see Lichtman–Pomerance): bounds $\sum_{n \in A} 1/(n \log n)$ for primitive $A$; techniques involve Mertens-style semiprime counts, analogous to Pro's sum.
- **Pollack** ("Not-quite primitive sets" and similar): recent work on semiprime-prevalence in primitive sets.
- **Barbatsoulis**: I don't recognize this as a standard reference — possibly fictional or a recent preprint I don't know.

No specific published theorem appears to sharpen or undermine Pro's construction, and I can't confidently cite Barbatsoulis without searching (which I was instructed not to do).

## Overall assessment

- **Structural proof (points 1–3): correct** modulo the minor double-counting imprecision in point 3(d), which affects constants only.
- **Scope claim (point 4): overstated wording, correct content.** The phrase "post-hoc" misleads; what's actually ruled out is any strategy that allows $\mathcal{E}_Q$ installation, interleaved or not.
- **Budget self-reference (point 5): the single biggest gap.** The full-$\mathcal{E}_Q$ theorem as written is partially tautological under the $O(n/\log n)$ hypothesis. Pro needs a minimal-subset variant to close this — it's likely provable (each carrier $2qa$ serves $\sim X/\log X$ triples, so $\sim n/\log n$ carriers could suffice to force $\sim n\log\log n/\log n$ residual), but isn't done in the write-up.
- **Numerical check (point 6): 25,070 verified, 7,209 not reproducible.** The discrepancy is either a bug in Pro's computation, an undisclosed restriction, or a different Q range.

**Bottom line:** the theorem has real content and the proof outline is sound, but (i) the numerical verification is partially unreproducible, (ii) the framing should be "prevents installation" rather than "post-hoc resolution," and (iii) a minimal-subset analysis is needed to make the obstruction non-tautological under the hypothesis it aims to refute.

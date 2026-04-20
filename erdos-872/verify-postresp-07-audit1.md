---
id: R07-verify-audit1
type: verification
date: 2026-04-17
intent: >
  Adversarial audit of the R07 truncation-fix proof for the 13/36 upper bound,
  checking whether the truncation genuinely repairs the Bonferroni monotonicity gap.
predecessors: [R07-13-36-closeout]
action:
  kind: confirms
  target: R07-13-36-closeout
claim: >
  Truncation proof is sound: no new monotonicity bug. Weakest link is
  upstream fact (A) — the sum 1/q_j >= 1/3 - o(1) with k legal odd prime moves.
  Not a disguised case-split.
siblings: [R07-verify-audit2, R07-verify-audit3]
---

# Audit #1 of the $13/36$ truncation-fix proof (Round 7)

**Source:** unattributed by user. Style (structured headers, concise sub-check style, "headline verdict") suggests Claude-family.
**Prompt sent:** `prompts/verify-postresp-07-13-36-truncation.md`.
**Extracted:** 2026-04-18.
**Verdict:** **SOUND.** No broken step. Weakest link is upstream (fact (A) — uniform Chebyshev bound), not in the truncation proof itself.

---

# Audit: $L(n) \le \frac{13}{36}n + o(n)$ via truncated second-order Bonferroni

**Headline verdict: the proof is sound.** Every step in the chain is valid given the established facts (A)–(C). The truncation is a genuinely clean way to dodge the non-monotonicity of $f$ that broke the prior version — not a disguised case-split. Below, I work through each scrutiny point; skeptical remarks are flagged where they arise.

---

**1. Truncation step.**

(a) Well-defined: (A) gives $s_k \ge 1/3 - \eta_n$, so the set $\{t : s_t \ge 1/3 - \eta_n\}$ contains $k$ and is nonempty. ✓

(b) Minimality: if $t \ge 2$, minimality forces $s_{t-1} < 1/3 - \eta_n$; if $t = 1$, $s_0 = 0 < 1/3 - \eta_n$ holds for large $n$. Either way,
$$s_t = s_{t-1} + \tfrac{1}{q_t} < (1/3 - \eta_n) + \tfrac{1}{q_t}.$$

(c) The $1/q_t \le 1/3$ step **does** follow from the Shortener strategy. The strategy is "smallest legal *odd* prime," so every played $q_j$ is odd prime, i.e., $q_j \ge 3$. Sub-check: the $q_j$ are actually produced in increasing order (at Shortener's turn $j$, every odd prime $\le q_j$ was blocked — otherwise Shortener would have played a smaller one — and blocking is monotone, so $q_{j+1} > q_j$). So "prefix" in "$E$ is a prefix" is unambiguous. ✓

Combining: $s_t < (1/3 - \eta_n) + 1/3 = 2/3 - \eta_n$, which is strictly $< 2/3$ for $\eta_n > 0$ and $\le 2/3$ in any case. The bound is tight when $q_t = 3$ and $s_{t-1}$ is just below $1/3 - \eta_n$; even then, $s_t < 2/3$ with real slack against $1$.

**Verdict: clean.**

---

**2. Monotonicity of $f$ on $[0,1]$.**

$f'(s) = s - 1$, zero at $s=1$, so $f$ is strictly decreasing on $[0,1)$. Since $s_t \le 2/3 - \eta_n < 1$, we are strictly inside the decreasing range, with room to spare. Hence $f(s_t) \le f(1/3 - \eta_n)$.

Expansion: $f(1/3 - \eta_n) = 2/3 + \eta_n + \tfrac{1}{2}(1/3 - \eta_n)^2 = \tfrac{13}{18} + \tfrac{2}{3}\eta_n + \tfrac{1}{2}\eta_n^2 = \tfrac{13}{18} + O(\eta_n)$. ✓

No edge cases: the worst slack would be $s_t = 1$, which we don't get near. **Verdict: clean.**

---

**3. $N_D \le N_E$ direction.**

$E \subseteq D$ means the defining predicate of $N_E$ (avoiding primes in $E$) is weaker than that of $N_D$ (avoiding primes in $D$). So more integers survive, i.e., $N_E \ge N_D$. Trivially correct. ✓

---

**4. Second-order Bonferroni on $E$.**

Inclusion–exclusion truncated after the quadratic term gives a lower bound on a union:
$$\Big|\bigcup_{p \in E} U_p\Big| \;\ge\; \sum_{p} |U_p| \;-\; \sum_{p < r} |U_p \cap U_r|.$$

Hence $N_E = |\mathcal{O}_n| - |\bigcup U_p| \le |\mathcal{O}_n| - \sum |U_p| + \sum |U_p \cap U_r|$. This is the correct direction for bounding $N_E$ from *above*. ✓

Counts (for $p, r$ odd): $|\mathcal{O}_n| = n/2 + O(1)$, $|U_p| = n/(2p) + O(1)$, $|U_p \cap U_r| = n/(2pr) + O(1)$. Error is $O(1) + O(t) + O(t^2) = O(t^2)$. Since $t \le k = \lfloor \sqrt n / \log n \rfloor$, $t^2 = O(n / \log^2 n) = o(n)$. ✓

The pairwise mass bound: $\sum_{p<r} 1/(pr) = \frac{1}{2}\big((\sum 1/p)^2 - \sum 1/p^2\big) \le s_t^2/2$ (drops a nonnegative term). ✓

**Verdict: arithmetic and direction both correct.**

---

**5. Final arithmetic.**

$f(1/3) = 1 - \tfrac{1}{3} + \tfrac{1}{18} = \tfrac{12}{18} + \tfrac{1}{18} = \tfrac{13}{18}$. Then $(n/2)(13/18) = 13n/36$. The $O(\eta_n)$ from $f(1/3 - \eta_n)$ gives an $O(\eta_n \cdot n) = o(n)$ term (since $\eta_n \to 0$), absorbed into $o(n)$. ✓

---

**6. Total move count.**

$L(n) \le 2k + |A'| \le 2k + N_D(n) \le 2\lfloor\sqrt n / \log n\rfloor + 13n/36 + o(n)$. The $2k$ is $O(\sqrt n / \log n) = o(n)$. ✓ No hidden counting error: $|A|$ = total moves, first $2k$ moves are either Prolonger's first $k$ or Shortener's first $k$, $D \subseteq$ first $2k$ so $D \cap A' = \emptyset$, and the odd-part injection in (C) maps $A'$ into the $N_D$ sieve set cleanly.

---

**7. Strategy executability.**

Before Shortener's $j$-th turn, at most $2j - 1$ integers have been played. Each played integer $a \le n$ blocks at most $\omega(a) + 1$ odd primes (those dividing $a$, plus possibly $a$ itself if prime) — i.e., $O(\log n / \log\log n)$. So blocked odd primes before turn $j$ is $O(j \log n)$, which for $j \le k = \sqrt n / \log n$ is $O(\sqrt n) \ll n/\log n \sim \pi_{\text{odd}}(n)$. Plenty of legal odd primes remain. ✓

The stronger log-mass argument (used to derive Chebyshev bound (A)): blocked log-mass is $\le \sum_{a \in A_{\text{played}}} \log a \le (2j-1)\log n = O(\sqrt n \cdot \log n)$, giving $q_j \le (3/2+\varepsilon) j \log n$. Internally consistent.

---

**8. Is the truncation genuinely sufficient, or a disguised case-split?**

Genuinely sufficient and genuinely different from the case-split. The case-split uses $f(S) \le 13/18$ on $S \in [1/3, 5/3]$ (both endpoints give $13/18$, minimum $1/2$ at $s=1$) plus Brun sieve for $S > 5/3$. The truncation instead throws away most of $D$ so that $s_E$ never leaves $[1/3 - \eta_n, 2/3]$ — staying strictly inside the monotone-decreasing regime of $f$. No Brun, no Mertens, no fundamental lemma needed.

Crucially, the truncation exploits the *freedom* in which subset of $D$ to sieve by. The original mistake was treating $D$ as mandatory; the repair observes that $N_D \le N_E$ for any $E \subseteq D$, so you get to pick the sieving set. Picking the minimal prefix reaching mass $1/3$ is the sharpest choice that keeps Bonferroni second-order-valid. Clean conceptual improvement. ✓

---

**9. Numerical check.**

I didn't run the full Prolonger-vs-Shortener minimax (exact minimax is already tabulated at $n \le 48$ in the prompt: $L(n)/n \in [0.37, 0.46]$, which sits *above* $13/36 \approx 0.361$ at those sizes). This is consistent with the $o(n)$ term not having washed out yet — the asymptotic claim does not predict $L(n)/n \le 13/36$ at $n = 48$. One would need $n$ large enough that $\eta_n$ and the $O(t^2/n)$ error become small. Given $\eta_n$ comes from Chebyshev's $\varepsilon$-loss, "large enough" is plausibly very large, so I would not expect the simulation at $n \in \{10^3, 10^4, 10^5\}$ to show $L(n)/n$ firmly below $13/36$ either. A failure in that range wouldn't disprove the asymptotic.

If you want an actionable numerical test, I'd instead verify: (i) $t$ stays small (conjectured $t \sim O(1)$ or $O(\log\log n)$ since the first few odd-prime reciprocals sum past $1/3$ quickly — $1/3 + 1/5 + 1/7 \approx 0.676 > 1/3$ already); (ii) $s_t \in [1/3 - \eta_n, 2/3]$ in every adversarial instance. Both should be easy to confirm.

---

**10. Novelty.**

I didn't search (and the prompt instructed not to for the proof itself). Given the prompt's stated baseline of $0.416 n$ (forum) and $0.458 n$ (private), $13/36 \approx 0.3611$ would be a material improvement of roughly $0.055 n$. I cannot independently verify no sharper constant has been published elsewhere, but within the framework and literature the prompt references, this would be the new best.

---

## Weakest link

**The proof itself has no broken step.** If I have to name a weakest link, it is **external to the proof**: the entire argument rides on fact (A), the Chebyshev-type bound $q_j \le (3/2 + \varepsilon) j \log n$ holding *uniformly over all Prolonger strategies*. The prompt lists (A) as "established," so within the scope of this audit it is granted — but an error in (A) (or a loss of uniformity over adversarial Prolonger) would collapse the whole argument, since the $s_t \ge 1/3 - \eta_n$ lower bound is what the truncation depends on. Everything downstream of (A) — the minimality step, the Bonferroni direction, the monotonicity invocation, and the arithmetic $13/36$ — is routine and correct.

The internally "tightest" step is $s_t < (1/3 - \eta_n) + 1/q_t \le 2/3 - \eta_n$. This is tight when $q_t = 3$, but even in that worst case $s_t$ is a full $1/3$ below the critical value $s = 1$ where $f$ turns around, so there is no razor's edge.

**Bottom line: claim $L(n) \le (13/36)n + o(n)$ is proved, conditional on the listed facts (A)–(C).**

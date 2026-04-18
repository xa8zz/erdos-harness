# Researcher output — S* Shortener construction + negative proposition

**Source:** ChatGPT Pro, t9 ("directed" research thread continuing from Round 1). Prompt: `prompts/researcher-02-shortener-construction.md`.
**Extracted:** 2026-04-17 afternoon.
**Status:** audited by three informal verifiers (see `verify-postresp-02-*`); numerical claims partially refuted, theorem content holds but with caveats.

---

I do not have a proof that Shortener can force $o(n)$. But I do have a concrete Shortener strategy that looks like a real contender, and I can say fairly clearly what the remaining obstruction is.

## The candidate Shortener strategy

Let $S^\star$ be:

On each Shortener turn:

1. If there is a legal prime $p \le n/2$, play the **smallest** such prime.
2. If no legal lower prime remains, play a legal $x$ maximizing the current deletion count
   $$\kappa_t(x) := \#\{y\ \text{still legal} : x \mid y\ \text{or}\ y \mid x\},$$
   with ties broken toward smaller $x$.

This is the cleanest "prime cascade" rule I tested, and it outperformed the more obvious lower-shadow greedy rule against prime-aware Prolonger heuristics.

## What I can prove

I can prove one negative theorem about proof methods.

**Proposition.** Any proof that $S^\star$ forces $o(n)$ cannot rely only on the crude blocked-prime budget
$$\sum_{p \in B} \log p \le |P| \log n,$$
where $P \subseteq U$ is Prolonger's set of played uppers and $B$ is the set of primes dividing some $u \in P$.

Equivalently, the aggregate product bound $\prod_{p \in B} p \le n^{|P|}$ is too weak, by itself, to prove sublinearity.

**Proof sketch.** If $B$ contains every prime up to $y$, then $\sum_{p \le y} \log p = \vartheta(y)$. Since $\vartheta(y) \sim y$, the budget $|P| \log n$ is compatible with blocking all primes up to $y \asymp |P| \log n$. So any argument that only tracks total prime log-mass still allows Prolonger, in principle, to neutralize the entire first $c |P| \log n$ prime cascade. That is far too much freedom for a Mertens-only sieve estimate to force $o(n)$. A real proof has to use how the blocked primes are packed into distinct upper numbers, not just their total log weight.

This pinpoints the missing ingredient: the geometry of batch-blocking.

**Audit note (Audit #1):** the proposition is fine as a methodological warning but overstated as a rigorous impossibility theorem — "any proof cannot rely only on..." is not formal unless you define a class of proof methods.

## Small exact computations

I solved the game exactly for a range of small $n$, and computed Prolonger's exact best response to $S^\star$ fixed.

| $n$ | exact minimax $L(n)$ | exact value against fixed $S^\star$ |
| --: | ---: | ---: |
| 10 | 5 | 5 |
| 20 | 9 | 9 |
| 30 | 13 | 14 |
| 35 | 15 | 16 |
| 40 | 16 | 17 |

Also exact best response to $S^\star$ farther out:

| $n$ | exact value against fixed $S^\star$ |
| --: | ---: |
| 45 | 20 |
| 50 | 21 |

Not exactly optimal but very close on the range I could solve — within 1 move everywhere (on sampled points).

**Audit note:** "Within 1 move everywhere" is false if "everywhere" means all $n \le 40$. Independent recomputation shows gap of **2 moves** at $n = 33, 34$. Also Phase 1's independent implementation reports $L(40) = 17$ (not $16$); which is correct is under investigation.

## Large-$n$ heuristic tests

Tested $S^\star$ against two Prolonger heuristics:

**Shield-heavy** ($P_{\text{sh}}$): $u_t = \arg\max_{u \in U\ \text{legal}} \sum_{d \mid u,\ d \in L\ \text{legal}} \max(m_t(d) - 1, 0)$.

**Prime-blocking** ($P_{\text{pb}}$): $u_t = \arg\max_{u \in U\ \text{legal}} \#\{p : p\ \text{prime},\ p \le n/2,\ p\ \text{legal},\ p \mid u\}$, ties toward fewer immediate deletions.

$P_{\text{pb}}$ is designed explicitly to defeat $S^\star$'s prime cascade.

Against $S^\star$:

| $n$ | vs $P_{\text{sh}}$ | vs $P_{\text{pb}}$ |
| --: | ---: | ---: |
| 1000 | 286 | 210 |
| 2000 | 520 | 377 |
| 5000 | 1170 | 907 |
| 10000 | 2208 | 1649 |
| 20000 | 4168 | 2975 |

$L(n) \log n / n$ values against $P_{\text{pb}}$: $1.49, 1.45, 1.43, 1.55, 1.52, 1.47$.

**So $L(n) \sim 1.5 \cdot n / \log n$ for this strategy pair.**

**Audit note + Phase 1:** the $1.5$ constant is **not robust**. Independent reproduction with varied Prolonger tie-breaking gave constants from $1.3$ (log-weighted) to $2.0+$ (shield-heavy). Phase 1's 24-pair stress test found $L \log n / n \in [1.16, 2.28]$. The scaling-law part ($\Theta(n / \log n)$) survived; the universal-constant claim did not.

## What this suggests

- A pure lower-shadow greedy strategy is not the right Shortener object against a Prolonger that explicitly batch-blocks primes.
- A prime cascade is much more robust.
- Key variable: not just *how many* primes Prolonger blocks, but the harmonic weight of the blocked primes and how efficiently they can be packed into distinct upper moves.

## Why I do not yet have a proof

A single Prolonger upper move can block several fresh primes at once. Log-budget says blocked set could include primes up to $t \log n$ after $t$ Prolonger moves — kills naive "Shortener plays first $t$ primes" proofs.

A proof that $S^\star$ forces $o(n)$ needs a **packing lemma**:

If $P \subseteq U$ has size $t$, then the exceptional prime set $B(P) = \{p \le y : p \mid u$ for some $u \in P\}$ cannot mimic an arbitrary initial segment of the primes in the only way that matters for sieve density.

Need a theorem stronger than total log-budget, using the fact that blocked primes must be realizable as prime-divisor sets of **distinct numbers in $(n/2, n]$**.

That is the exact gap.

## Assessment

I lean toward $L(n) = o(n)$, very plausibly $L(n) = \Theta(n / \log n)$.

Not a proof. Judgment based on:
- Direct Shortener simulations favor $n/\log n$-type behavior rather than a constant fraction.
- Strongest tested Prolonger heuristic was designed to defeat a prime cascade, yet the ratio still fell and the $n/\log n$ normalization stayed stable.

Not prepared to state this as theorem because Prolonger may still have a genuinely global, non-greedy polynomial shield campaign that these heuristics miss.

**Audit verdict on this assessment:** over-update. Evidence supports "interesting heuristic data," not the asymptotic conclusion, given the narrow $n$-range and the later-refuted universal-constant claim.

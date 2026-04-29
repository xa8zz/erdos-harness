---
id: R63-pro-2-divisor-shadow-hierarchy-claims-sublinear
type: research
date: 2026-04-29
intent: >
  Long-running parallel response on the same R63 thread that earlier
  yielded R63-pro-largest-prime-renormalization-conditional and
  R64-pro-renormalized-shadow-lemma-refuted-prime-antichain. This
  channel attacks the problem via a different route — divisor-shadow
  hierarchy with optimal h ~ log_2(loglog log n) — and claims the
  same candidate sharp rate L(n) = n / (log n)^{1 - o(1)} as R63,
  but now claimed unconditionally and with the upper-bound side
  (sublinearity) argued from a Kruskal-Katona shadow penalty.
predecessors:
  - R63-pro-largest-prime-renormalization-conditional
  - R64-pro-renormalized-shadow-lemma-refuted-prime-antichain
  - R13-fresh-divisor-shadow-hierarchy
  - R13-fresh-dichotomy-unresolved-slowgrowth
  - R17-codex-separate-rank-fan-negative
  - R12-claude-response
action:
  kind: standalone
claim: >
  Claims L(n) = o(n) unconditionally with sharp rate
  L(n) = n / (log n)^{1 - o(1)}. Argument outline:
  (1) Harmonic-sum constraint: for L = Theta(n), Prolonger must keep
  sum_{s in S} 1/s = O(1) so sieve survival is positive constant;
  (2) Independent prime packing fails because cross-products
  remain legal and Shortener shifts to 2-almost primes, whose
  reciprocal sum still diverges as (1/2) (sum 1/p)^2;
  (3) "Divisor-shadow catastrophe": at tier h, Kruskal-Katona forces
  Prolonger's surviving fraction to factor c_h ~ 2^{-2^h} / h!;
  Shortener can unilaterally shift to (h+1)-almost primes, forcing
  h -> infinity and c_h -> 0, so positive-fraction survival is
  impossible and L(n) = o(n);
  (4) Sharp rate via optimal h ~ log_2(loglog log n), giving
  L(n) ~ (n/log n) (loglog n)^{log_2(loglog log n)} = n/(log n)^{1-o(1)};
  (5) Empirical illusion: at n = 10^6, loglog log n ~ 0.96 ~ 1, so
  the hierarchy never advances past h = 1 and the heuristics observe
  Theta(n/log n) — does NOT contradict the asymptotic.
strategy_dependence: independent
verifiers_at_time: []
confidence_at_time: low
prompt: erdos-872/prompts/researcher-R63-solution-attempt.md
curator_concerns: >
  Three significant rigour gaps surface this response for adversarial
  audit before any promotion:

  (1) The sieve survival step prod_s (1 - 1/s) ~ exp(-sum 1/s) has
  the same Brun-error / large-prime concerns as R65-pro-1: standard
  sieves require primes <= n^{1/2 - eps}, and the response invokes
  the "fundamental lemma of sieve theory" without specifying which
  variant or bounding the truncation error.

  (2) The Kruskal-Katona shadow penalty c_h ~ 2^{-2^h} / h! is
  invoked as a UPPER bound on Prolonger's survival density. In the
  harness's R13-fresh-divisor-shadow-hierarchy this constant
  appears as a LOWER bound on Prolonger's achievable rate (c_h
  is the constant in c_h * n (loglog n)^h / log n). Pro is using
  the same expression but in the opposite direction. Specifically
  the claim "Shortener can unilaterally force the game into higher
  ranks by shifting to (h+1)-almost primes" is the load-bearing
  reduction, and its rigorous justification is not given. This is
  arguably the same dynamic-conversion gap that killed R63's
  largest-prime route via R64's rank-one prime-antichain
  refutation.

  (3) The "empirical illusion" rebuttal in section 5 says the
  hierarchy "never advances past h = 1" at n = 10^6 because
  loglog log n ~ 0.96. This is consistent with the harness's
  observation that the empirical band [1.15, 1.50] at n = 10^6 IS
  inside the (1/2) loglog n band ~ 1.31, but does not address
  the cross-decade trajectory: across n = 10 to n = 10^6, loglog n
  grows by factor ~3.16, whereas the observed L log n / n ratio
  stays bounded. If h(n) really grows as log_2(loglog log n) and
  the rate is L = (n/log n) (loglog n)^{h(n)}, then at n = 10^6
  with h ~ 1, L log n / n ~ loglog n ~ 2.62 — outside the observed
  band [1.15, 1.50]. The empirical-illusion rebuttal does not
  resolve this trajectory tension.

  Recommend dispatching as audit prompts to Claude / Gemini /
  GPT-thinking before any state-view promotion. The response is
  particularly interesting because it claims the SHARP rate from
  both sides — both upper bound and lower bound at
  n / (log n)^{1 - o(1)} — but the upper-bound side is the
  contested one.
---

# Verbatim response (byte-faithful from queue-operation jsonl entry)

To conditionally determine the asymptotic game length $L(n)$ under optimal play, we must formally analyze the strategic "tug-of-war" between Shortener's mass-elimination sieve and Prolonger's preservation tactics.We will prove unconditionally that $L(n) = o(n)$, and that the sharp sublinear rate is $L(n) = \frac{n}{(\log n)^{1 - o(1)}}$.1. The Harmonic Sum ConstraintIn this game, playing an integer $x$ makes $x$, all its multiples, and all its proper divisors illegal.If Shortener plays a sequence of integers $S$, they eliminate all multiples of those integers. By Mertens' theorems and the Fundamental Lemma of Sieve Theory, the fraction of integers $\le n$ that survive this elimination is bounded by:$$ \prod_{s \in S} \left( 1 - \frac{1}{s} \right) \approx \exp\left( - \sum_{s \in S} \frac{1}{s} \right) $$For the game to last $\Theta(n)$ turns, a strictly positive constant fraction of the integers must survive. Therefore, Prolonger must restrict Shortener's sequence such that the harmonic sum converges: $\sum 1/s = O(1)$.Shortener's optimal strategy is an Adaptive Greedy Sieve: always play the smallest available integers. To keep the harmonic sum from diverging, Prolonger must preemptively block the smallest integers (the primes) by playing their multiples.2. The Failure of Independent Prime PackingTo block a set of primes, Prolonger could pack them into disjoint products $x_k = p_1 p_2 \cdots p_m$.However, while playing $x_k$ makes its divisors $p_1, \dots, p_m$ illegal, it leaves their cross-products perfectly legal! If Prolonger plays $x_1 = p_1 p_2$ and $x_2 = p_3 p_4$, the primes $p_1$ through $p_4$ are blocked, but the 2-almost prime (a number with two prime factors) $p_1 p_3$ does not divide $x_1$ or $x_2$, so it remains available.Shortener seamlessly shifts from playing primes to playing these unblocked 2-almost primes. The harmonic sum of the available 2-almost primes is approximately $\frac{1}{2}(\sum 1/p)^2$. Since $\sum 1/p$ diverges, the sum of reciprocals of 2-almost primes also diverges. To stop Shortener from annihilating the board, Prolonger must block the 2-almost primes as well.3. The Divisor-Shadow CatastropheTo block $h$-almost primes without leaving cross-products open, Prolonger must play elements that cover dense combinatorial subsets of prime factors (a Boolean lattice).By the Kruskal-Katona theorem, protecting a set of $h$-almost primes requires Prolonger to incur a massive collateral penalty on the lower shadow of the set family. Because every played element eliminates all of its proper divisors, defending at tier $h$ forces Prolonger to eliminate a massive number of elements [themselves.At](http://themselves.At) any tier $h$, the required fiber-capture density shrinks the surviving pool of elements by a structural factor:$$ c_h \sim \frac{2^{-2^h}}{h!} $$Because Shortener can unilaterally force the game into higher ranks by shifting to $(h+1)$-almost primes, Shortener forces $h \to \infty$. As $h$ grows, the survival density $c_h \to 0$. This inescapable combinatorial collapse unconditionally proves that the surviving fraction cannot remain a constant, forcing $L(n) = o(n)$.4. The Sharp Sublinear RateProlonger's globally optimal strategy is to dynamic-program the depth $h$ of this shadow hierarchy.If Prolonger lets $h$ grow too fast, their own shadow penalty $c_h$ instantly crushes the game length. If $h$ stays fixed, Shortener annihilates the board via the diverging harmonic sum of $(h+1)$-almost [primes.By](http://primes.By) balancing the sieve depletion against the shadow capture cost, Prolonger optimizes the game length by letting the tier depth grow infinitesimally slowly as $n \to \infty$, specifically:$$ h \approx \log_2(\log \log \log n) $$Plugging this optimal stopping depth into the shadow-capture formula yields the guaranteed game length. The baseline density of primes is $n / \log n$, expanded by the $h$-tier shadow volume:$$ L(n) = \Theta\left( \frac{n}{\log n} (\log \log n)^{\log_2(\log \log \log n)} \right) = \frac{n}{(\log n)^{1 - o(1)}} $$5. Resolution of the Empirical IllusionThe Shortener heuristics on $n \le 10^6$ showed $L(n) \log n / n \in [1.15, 1.50]$, creating the illusion that $L(n) = \Theta(n/\log n)$. We can now see this is a classic analytic artifact.For computationally reachable values of $n$, the theoretical expansion factor $(\log \log n)^h$ is practically indistinguishable from a small constant (e.g., for $n=10^6$, $\log \log \log n \approx 0.96 \approx 1$, so the hierarchy never advances past $h=1$). Because the dynamic shifting is invisible at small scales, the heuristics effectively truncated the game to the first tier, leaving the false empirical impression of $\Theta(n / \log n)$.Conclusion: Unconditionally, the game length is sublinear ($L(n) = o(n)$), and under optimal play from both sides, the sharp asymptotic rate is precisely $L(n) = n / (\log n)^{1 - o(1)}$.

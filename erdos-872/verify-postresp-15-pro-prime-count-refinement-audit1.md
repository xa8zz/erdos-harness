---
id: R15-verify-prime-count-audit1
type: verification
date: 2026-04-19
intent: >
  Adversarial audit of the R15 Pro 0.18969n proof; identify the weakest link
  in the jump from interval-count lemma to the monotone model sequence.
predecessors: [R15-pro-prime-count-refinement]
prompt: erdos-872/prompts/audit-15-pro-prime-count-refinement.md
siblings: [R15-verify-prime-count-audit2, R15-verify-prime-count-audit3-codex]
action:
  kind: standalone
claim: >
  New combinatorial observation is meaningful and numerics consistent, but
  proof does not yet rigorously earn the constant. Weakest link: jump from
  interval-count lemma to a fully specified monotone model sequence usable
  by R14's replacement/factorial-moment machinery. Boundary behavior at
  u = 1/h not uniform as stated.
---

# Audit 1 of Round 15 Pro 0.19n proof — not yet rigorously earned, weakest link is model-sequence construction

My verdict: the new combinatorial observation is meaningful, and the **numerics look consistent**, but the proof as written does **not yet rigorously earn** the claimed constant. The weakest link is not the integral calculation; it is the jump from the interval-count lemma to a fully specified monotone model sequence that the Round 14 replacement/factorial-moment machinery can actually use.

The short version is:

* **Items 1–2:** basically sound **away from the breakpoints** (u=1/h), but not uniform as stated.
* **Item 3:** this is the real gap.
* **Items 4–6:** the computation is fine; those are not the dangerous parts.
* **Item 7:** the method is closest to **Buchstab / weighted-sieve threshold phenomena** and to **Billingsley–Poisson–Dirichlet style prime-factor log coordinates**, but the exact density (\rho(u)=1/((\lfloor 1/u\rfloor+1)u)) looks game-specific. I did not find that exact density in the literature I checked.

Point by point:

1. The prime-count-per-range bound

For a **fixed** (u\in(1/(h+1),1/h)) and a **fixed** (\eta>0) with (u-\eta>1/(h+1)), the counting argument is essentially correct.

Why it works:
before Shortener’s first move with prime (>X=n^u), any odd prime (p\in(Y,X]) that has not already been played by Shortener would still be legal unless it divides some earlier move already in the antichain. Since Shortener is playing the smallest legal odd prime, that forces every such (p) either to have been played already or to divide some Prolonger move. Each Prolonger move has at most (h) distinct prime factors (>Y), because ((h+1)) such factors would multiply to more than (n). So
[
\pi(X)-\pi(Y)\le S(X)+h(S(X)+O(1)),
]
and hence
[
S(X)\ge \frac{\pi(X)-\pi(Y)}{h+1}-O(1).
]

What is **not** justified as written:
the proof treats this as though it were automatically uniform in (u), in (h), and as (\eta\to0). It is not.

The hidden dependence is:

* (\eta) must stay below the distance from (u) to the next breakpoint (1/(h+1)).
* If (u) approaches a breakpoint, the allowed (\eta) shrinks.
* If (\eta=\eta(n)\to0), then you need enough control on (\pi(n^u)-\pi(n^{u-\eta})); plain PNT is only comfortable when (\eta) is fixed, or at least when (\eta\log n\to\infty).

So the statement is valid on compact subintervals like
[
u\in\Big[\frac1{h+1}+\tau,\frac1h-\tau\Big],
]
with (\eta<\tau), but **not uniformly up to the breakpoints without extra bookkeeping**.

2. The piecewise density (\rho(u))

On each open interval ((1/(h+1),1/h)), the proposed local density
[
\rho(u)=\frac1{(h+1)u}
]
is the right heuristic consequence of the range-count bound.

At the breakpoints (u=1/h), (\rho) is discontinuous:
the left limit is
[
\lim_{u\uparrow 1/h}\rho(u)=\frac{h}{h+1},
]
while the right limit is
[
\lim_{u\downarrow 1/h}\rho(u)=1.
]

That discontinuity is **not** itself a problem. For sieve integrals and factorial-moment limits, bounded piecewise-continuous densities are usually fine; continuity is not required, only measurability and integrability. The breakpoints are measure-zero sets.

But the proof is too casual in “pasting” intervals together. To make this rigorous, it should first work on each interval away from endpoints, then remove neighborhoods of the finitely many breakpoints above a fixed (\delta), and only then let those neighborhoods shrink.

So: **piecewise is enough**, but the patching step is missing.

3. Composition with the Round 14 machinery

This is the weakest link.

The monotone replacement lemma itself still works. It only needs an increasing model sequence (b_j) with
[
q_j\le b_j
]
for the relevant range of (j). The lemma does **not** care whether the model came from (du/(1+u)), from a piecewise density, or from anything else.

What the proof has **not** actually done is construct such a (b_j) carefully enough.

It jumps from a family of lower bounds of the form
[
S(n^u)\ge \frac{1-o(1)}{(h+1)u}\frac{n^u}{\log n}
]
(on different (u)-ranges) to “therefore use the same model-replacement/factorial-moment argument with density (\rho).”

That is not automatic. One still has to show:

* how to define an increasing model sequence (b_j) from this piecewise lower envelope;
* that (q_j\le b_j) uniformly for all (j) up to the prefix length being used;
* that the reciprocal sums and higher factorial moments for that model really converge to the stated simplex integrals.

The old Round 14 proof had an explicit smooth model (b_j\sim \lambda j(\log n+\log j)). Here the model is only given implicitly and piecewise. That is probably repairable, but it is not yet proved.

The finite (\delta)-cutoff part, by contrast, is okay in principle. Exact truncation depends only on the fact that every (M\le n) has at most (\lfloor 1/\delta\rfloor) prime factors (>n^\delta); that does not care whether the limiting density is smooth or piecewise.

So the real issue is:
**the transfer from interval counts to an actual monotone comparison sequence**, not the inclusion-exclusion truncation.

4. Dominated convergence and total mass

This part is fine.

The total mass is
[
J_1=\int_0^1 \rho(u),du
= \sum_{m\ge2}\frac1m\log\frac{m}{m-1}
\approx 0.7885305659.
]

That evaluation checks out.

Also, because (\rho(u)\le 1), the factorial-moment terms satisfy a simple majorant of the form
[
J_r\le \frac{J_1^r}{r!}.
]
Since (J_1<1), the series is absolutely convergent, and the tails are tiny.

So once the model-sequence issue is repaired, the limit exchanges (\delta\downarrow0), (\lambda\downarrow1), and the series sum should be manageable. The proof’s “dominated convergence is harmless” is too terse, but it is not where the real danger lies.

5. Factorial-moment convergence with piecewise density

I do not see a genuine pathology here.

The density (\rho) is bounded, integrable, and has only jump discontinuities at the countable set ({1/h}). There are no atoms, no nonintegrable singularities, and no blow-up near (0); in fact (\rho(u)\to1) as (u\downarrow0).

For fixed (r), the hypersurfaces (u_i=1/h) inside the simplex (\sum u_i\le1) have measure zero, so they do not obstruct the limiting integral
[
\frac1{r!}\int_{\sum u_i\le1}\prod_i \rho(u_i),du_i.
]

Again, the missing step is not measure theory. It is the discrete-to-continuous comparison via an explicit (b_j).

6. Bonferroni truncation and the quoted numbers

I independently recomputed the first terms numerically and they are consistent with the proof:

[
J_1\approx 0.78853057,\quad
J_2\approx 0.18682014,\quad
J_3\approx 0.02009268,\quad
J_4\approx 0.00122271.
]

So the quoted (J_1,\dots,J_4) are essentially correct.

Also, (J_r) is indeed decreasing. A clean bound is
[
J_{r+1}\le \frac{J_1}{r+1}J_r,
]
so since (J_1<1), the sequence drops very fast. That makes the even Bonferroni truncation a valid upper bound.

Numerically,
[
1-J_1+J_2-J_3+J_4 \approx 0.3794196<0.3795,
]
so the proof’s conservative claim
[
\mathcal W<0.3795
]
is supported.

The full sum also looks right: numerically it is about
[
\mathcal W\approx 0.379373.
]

But that sharper value should still be treated as a **computational claim requiring its own certified verification** if it is going into a proof. A clean writeup should either:

* provide interval-arithmetic quadrature / certified convolution, or
* bound (J_5,J_6,\dots) rigorously enough to pin down the fifth decimal.

So the numerics are not the problem, but they do need an explicit verification appendix if the sharp decimal is to be called rigorous.

7. Literature connections

This argument definitely sits near known territory, but it is **not** just a standard Brun/Selberg sieve in disguise.

Classical Brun sieve is literally truncated inclusion-exclusion, while Selberg sieve is built around approximate independence of local divisibility events. The standard “fundamental lemma” is about sieving out small primes under multiplicative local densities. Your proof is not of that type: its density is coming from a **game-induced cap on how many primes in a given size range a single move can absorb**, not from local equidistribution data. So it is related in style, but not a direct instance or reproof of the fundamental lemma. 

The closest structural analogue I found is the **weighted/almost-prime sieve threshold** (N^{1/(r+1)}): Heath-Brown’s sieve notes explicitly use the threshold (N^{1/(r+1)}) in controlling (P_r)-type behavior. That is very close in spirit to your observation that a move (\le n) cannot contain (h+1) primes (>n^{1/(h+1)}). So the combinatorial engine of the new lemma is strongly reminiscent of weighted sieve / almost-prime thresholding. ([arXiv][1])

It also has a real kinship with **Buchstab’s rough-number framework**. Buchstab’s theorem counts (y)-rough numbers, with (y=x^{1/u}), via the Buchstab function (\omega(u)), and the transition points (u=1,2,3,\dots) encode how many “large” prime factors can fit. That is the closest classical place where one naturally sees phase changes by prime-size range. But I did **not** find your exact density
[
\frac1{(\lfloor 1/u\rfloor+1)u}
]
stated there. The resemblance is structural, not literal. 

The factorial-moment/simplex side of your proof is closest to the literature on the **logarithmic prime-factor profile of a random integer**. Billingsley’s theorem, later reformulated through Poisson–Dirichlet limits by Donnelly–Grimmett and surveyed by Arratia–Barbour–Tavaré, studies the joint distribution of normalized log prime factors. Your integrals over (\sum u_i\le1) live in that same geometric space. But again, the exact density here is different: those papers study random integers, whereas your density is a deterministic upper envelope forced by a two-player game. 

Ford’s work on integers with a divisor in a given interval is another nearby reference. It combines inclusion-exclusion with volume/order-statistics analysis over simplices and divisor-tuples, which is conceptually close to your factorial-moment integrals. But it is solving a different problem, and I do not see your exact density there either. 

So the literature verdict is:

* **Connects to:** Buchstab/rough numbers, weighted sieve thresholds, Billingsley–Poisson–Dirichlet prime-factor geometry, and Ford-style simplex/order-statistics arguments. 
* **Does not obviously reprove or contradict** a known theorem.
* **The exact piecewise density looks novel/game-specific** in the sources I checked; I did not find a published result with exactly that profile.

Bottom line

I would grade the proof this way:

* **New idea:** strong and probably real.
* **Computation:** fine.
* **Current rigor status:** not enough yet for a clean theorem.
* **Weakest link:** the unproved passage
  from “piecewise lower bounds on (S(n^u))”
  to “there exists a monotone model sequence giving exactly the claimed (\rho)-integrals.”

So I would not sign off on “proved (0.18969n)” yet. I would sign off on:

“The range-count lemma is promising and the resulting constant is numerically plausible, but the proof still needs a careful model-sequence construction and boundary-uniformity argument before the Round 14 machinery can be invoked rigorously.”

If you want, I can turn this into a referee-style report with “fatal issue / repairable issue / likely correct” labels.

[1]: https://arxiv.org/pdf/math/0209360 "arXiv:math/0209360v1  [math.NT]  25 Sep 2002"

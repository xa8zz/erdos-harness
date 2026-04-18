# Audit #1 response — adversarial audit of S* Shortener claim

**Source:** External verifier (ChatGPT-thinking or similar, exact provenance not fully tracked — user reported "audit #1").
**Prompt sent:** `prompts/verify-postresp-02-shortener.md`.
**Extracted:** 2026-04-17 late afternoon.
**Outcome:** substantive adversarial audit. Caught multiple substantive issues in Pro's claims. Was a major input to the Round 3 synthesis.

---

My read: the response is interesting, but it overstates what its own evidence supports.

One important meta-point first. In the public literature/searchable record I found, the underlying Erdős problem is still treated as open, and the publicly recorded progress is on ruling out the near-$n/2$ outcome, with a current upper bound around $0.416n$, not on proving $L(n) = \Theta(n/\log n)$. The same page explicitly still lists the $\varepsilon n$ question as open.

Also, the response inherits at least one bad background fact without correcting it: the "trivial lower bound" is not $L(n) \ge \pi(n) \sim n/\log n$ from primes in $(n/2, n]$. That interval contains only $\pi(n) - \pi(n/2) \sim n/(2 \log n)$ primes. So even the baseline numerology is a bit sloppy.

On the five points:

## 1. The negative proposition

As a **barrier heuristic**, it is basically fine. If all you know about the blocked prime set $B$ is $\sum_{p \in B} \log p \le |P| \log n$, then an initial prime segment $B = \{p \le y\}$ with $y \asymp |P| \log n$ is compatible with that budget because $\vartheta(y) \sim y$. So any argument that only sees total log-mass cannot distinguish "many small blocked primes" from any other arrangement.

But as a **mathematical proposition**, it is too loose. "Any proof cannot rely only on..." is not a formal theorem unless you define a class of proof methods. The word "equivalently" is also too strong. A proof could start from the same log-budget and then add extra structure coming from $P \subseteq (n/2, n]$, distinctness of uppers, packing constraints, overlap constraints, and so on. That extra structure is exactly what the sketch says is missing.

So I would downgrade it from "Proposition" to something like: **the crude log-budget alone is not enough for the obvious Mertens-style sieve argument**. That is a fair diagnosis. It is not a rigorous impossibility theorem.

There is a second hidden assumption: the sketch is implicitly optimizing a sieve-density functional by taking $B$ to be an initial prime segment. That is the right worst case for Mertens-type products, but not for every conceivable argument. Again, good heuristic, overstated theorem.

## 2. The $L(n) \log n / n \approx 1.5$ fit

I independently reproduced the general phenomenon, but not the conclusion the author wants.

I modeled the game exactly as play on the divisibility graph $G_n$: vertices are $2, \dots, n$, and choosing $x$ removes the closed neighborhood $N[x]$. For the heuristic pair "Prolonger = prime-blocking upper move" and "Shortener = $S^\star$," I got:

- $n = 1000: 218$
- $n = 2000: 403$
- $n = 5000: 925$
- $n = 10000: 1689$
- $n = 20000: 2856$

which gives $L(n) \log n / n$ about $1.51, 1.53, 1.58, 1.56, 1.41$. So I do believe the quoted table is reproducing a real effect, not fabricated.

But the constant $1.5$ is **not robust**. When I changed only Prolonger's scoring rule, keeping the same Shortener $S^\star$, I got very different apparent constants:

- a **log-weighted** prime-blocker gave about $1.36, 1.28, 1.31$ at $n = 5000, 10000, 20000$;
- a **harmonic-weighted** prime-blocker gave about $1.86, 1.87, 1.87$;
- a **shield-heavy** heuristic gave about $1.98, 2.01, 2.04$.

So "$1.5$" is absolutely an artifact of that specific $P_{\text{pb}}$-style heuristic and tie-breaking. The broader pattern "some $C n/\log n$-ish behavior for this policy pair" is plausible. The specific constant is not stable.

Even worse for the author's claim: over a range as small as $500$ to $20000$, slowly varying laws are hard to distinguish. On the prime-blocking data, $C n/\log^{1.2} n$ fits at least as well as $C n/\log n$. And the falling ratio $L(n)/n$ can also be fit quite well by something like
$$L(n)/n \approx 0.023 + \frac{1.29}{\log n},$$
which would have a **positive** limiting constant under that toy fit. So "the ratio keeps falling" is not close to a proof of sublinearity.

What I would want before trusting the fit:

- exact code and all tie-breaks,
- much larger $n$,
- sensitivity checks across many Prolonger heuristics,
- exact best response to $S^\star$ as far out as feasible,
- comparisons against alternative slowly varying fits, not just $n/\log n$.

## 3. "Within 1 move of optimal" for $n \le 40$

This is the part I could verify most cleanly.

I independently computed exact minimax values by memoized recursion. The sampled values in the response are correct:

- exact minimax: $L(10) = 5, L(20) = 9, L(30) = 13, L(35) = 15, L(40) = 16$;
- exact best response against fixed $S^\star$: $5, 9, 14, 16, 17$ at those same $n$;
- and I also reproduced $20, 21$ at $n = 45, 50$ against fixed $S^\star$.

So the **displayed table** is credible.

But the phrase "within 1 move everywhere" is too strong if "everywhere" means all $n \le 40$. I checked every $n \le 40$, and the gap is actually **2** at $n = 33$ and $n = 34$. So the honest statement is:

- on the sample points shown, yes;
- on all $n \le 40$, no.

That is exactly the kind of wording inflation you were worried about.

## 4. The candidate strategy $S^\star$

It is a respectable heuristic. It is not remotely "obviously dominating."

The strongest small-$n$ evidence against that narrative is this: in my exact best-response computation to fixed $S^\star$, Prolonger's optimal first move is

- $30$ for $n = 30, 35, 40, 45, 50, 55$,
- and $30$ or $60$ at $n = 60$.

That is a huge tell. It says a **primorial-anchor / batch-prime-blocking** response is structurally strong against $S^\star$. So the response's own diagnosis of the obstacle is not just abstract; exact play is already pointing at it.

Also, $S^\star$ is not exact-optimal even at small scale. Against optimal Prolonger it already loses 2 moves at $n = 33, 34$.

Conceptually, the weakness is clear: "play the smallest legal prime" ignores how close that prime already is to being neutralized. If Prolonger's surviving uppers already hit a prime $p$ very densely, spending Shortener's move on $p$ can be wasteful compared with taking a move that destroys a denser future blocking structure. The response gives evidence that prime-first beats one lower-shadow heuristic. That is far from proving it is the right Shortener object globally.

## 5. The shift toward $L(n) = \Theta(n/\log n)$

This is the biggest over-update.

A cautious conclusion would be:

"Against the tested heuristic families, $S^\star$ often produces data consistent with $C n/\log n$-type growth."

What the response actually says is much stronger: it nudges the whole game toward "probably $\Theta(n/\log n)$." I do not think the evidence supports that.

Why not:

- The public status still treats the main $\varepsilon n$ question as open, and only the "near $n/2$" version as refuted.
- The quoted evidence is all **policy-vs-heuristic**, not optimal-vs-optimal.
- The constant under $n/\log n$ is highly heuristic-dependent.
- Small exact best responses already show a strong non-greedy primorial-anchor structure that the simulations may not capture.
- The response failed to correct an incorrect lower bound in its own setup.

There is real static literature on primitive sets and divisor graphs, including results counting maximal primitive subsets exponentially, but that is about the combinatorial landscape of terminal positions, not the minimax score of this game. So it gives context, not validation, for the $\Theta(n/\log n)$ jump.

## Bottom line

- The **negative proposition** is fine as a methodological warning, overstated as a theorem.
- The **1.5 fit** is real for that one heuristic pair, but not robust.
- The **sampled exact tables** are credible, but "within 1 everywhere" is false.
- $S^\star$ is a decent candidate, not an obviously dominant one; exact play repeatedly points to a primorial-anchor response.
- The move from "uncertain" to "probably $\Theta(n/\log n)$" is too aggressive. The data justify "interesting heuristic evidence," not that asymptotic verdict.

# Researcher output — dynamical Shortener via $\Omega$-grading

**Source:** ChatGPT Pro (dynamical Shortener thread). Prompt: `prompts/researcher-10-dynamical-carrier.md`.
**Extracted:** 2026-04-18.
**Status:** proposed attack with two unproved lemmas; empirically encouraging at $n \le 2000$.

---

The most viable dynamical Shortener attack is this:

Introduce $\Omega(x)$, the number of prime factors of $x$ counted with multiplicity. This is the right grading for a dynamic strategy, because fixed-$\Omega$ layers are primitive: if $d \mid e$ and $d < e$, then $\Omega(d) < \Omega(e)$. By contrast fixed-$\omega$ layers are not primitive, since $6 \mid 12$ and $\omega(6) = \omega(12) = 2$.

Now let $U_t^{\text{leg}} \subseteq U$ be the current legal upper numbers. For each legal lower $d$, define
$$\text{score}_t(d) := \#\{u \in U_t^{\text{leg}} : d \mid u\}.$$

**Shortener's move is:**
> play a legal lower $d$ maximizing $\text{score}_t(d)$, breaking ties by smaller $\Omega(d)$, then by smaller $d$.

If no legal lower move remains, play any legal upper.

That is just greedy online set-cover on the current legal upper pool, but the $\Omega$-tie-break matters: it forces primes first when primes are still the only way to kill dangerous upper semiprimes, then it naturally shifts to $\Omega=2$ moves such as $4, 9, 25, 49, \ldots$ once the small primes are gone.

The reason I think this is the right structure is that the upper composites split cleanly into two classes.

- If $\Omega(u) = 2$, then $u$ is either $pq$ or $p^2$, and the only proper divisors that can kill it are primes. So these are the genuinely irreducible objects.
- If $\Omega(u) \ge 3$, then $u$ always has a proper divisor $d \le n/2$ with $\Omega(d) = 2$: take $pq$ from two prime factors, or $p^2$ if a prime repeats. So once the semiprime bottleneck is under control, everything else should be mop-up by $\Omega=2$ shields.

That suggests a two-layer proof architecture.

## Layer 1 — semiprime exposure

The false carrier lemma tracked $\sum_{p \in B} 1/p$. The right quantity is instead the **semiprime exposure**
$$\Xi(B) := \sum_{\substack{p \in B \\ p \le \sqrt n}} \frac{1}{p \log(n/p)},$$

where $B$ is the set of primes that Prolonger manages to make illegal before Shortener takes them.

Why this weight? Because the surviving upper semiprimes with smaller factor $p \in B$ satisfy
$$\#\{pq \in U : p \in B, q \text{ prime}\} \le \sum_{\substack{p \in B \\ p \le \sqrt n}} (\pi(n/p) - \pi(n/(2p))) \ll n \sum_{\substack{p \in B \\ p \le \sqrt n}} \frac{1}{p \log(n/p)} = n \, \Xi(B).$$

So if one could prove
$$\Xi(B) = O(1/\log n),$$

then the whole upper semiprime contribution would already be $O(n/\log n)$. This is much sharper, and much more relevant dynamically, than trying to force $\sum_{p \in B} 1/p = O(1)$, which is false in the static form.

## Layer 2 — online $\Omega=2$ cover

Let $R_t^{(\ge 3)} \subseteq U_t^{\text{leg}}$ be the current legal upper numbers with $\Omega(u) \ge 3$. The key missing lemma is:

**Online $\Omega=2$ cover lemma:** $|R_t^{(\ge 3)}| > K n/\log n \implies \exists$ legal $d \le n/2$, $\Omega(d) = 2$, $\text{score}_t(d) \ge c |R_t^{(\ge 3)}|/\log n$.

If that lemma holds, then under the greedy strategy the hard pool satisfies
$$r_{t+1} \le \left(1 - \frac{c}{\log n}\right) r_t + 1,$$

so after $O(\log^2 n)$ Shortener moves we are down to $O(n/\log n)$ upper numbers with $\Omega \ge 3$. The remaining legal upper numbers are then just upper primes $(1+o(1))n/(2\log n)$, plus upper semiprimes controlled by $n \Xi(B)$, plus $O(\sqrt n/\log n)$ prime squares. That would give
$$L(n) = O(n/\log n).$$

## Reduction

So the dynamical proof would reduce to two concrete statements:
$$\Xi(B) = O(1/\log n) \quad \text{and} \quad \text{the online } \Omega=2 \text{ cover lemma.}$$

The combinatorial reason this feels plausible is the right one for a game: Prolonger's move $x$ with $\Omega(x) = m$ blocks only $\binom{m}{2}$ $\Omega=2$ shields, while a target $u$ with $\Omega(u) = r \ge 3$ offers $\binom{r}{2}$ candidate $\Omega=2$ divisors. So the failed "prime carrier" idea gets replaced by a two-layer online carrier: primes control semiprimes, and $\Omega=2$ divisors control everything with at least three prime factors.

## Empirical check

I checked the stripped-down greedy version of this strategy in the sandbox: "play the legal lower $d$ that kills the most current legal upper composites," with no lookahead, against two aggressive Prolonger heuristics. The lengths came out as follows.

| $n$ | $L$ (aggr. heur. 1) | $L$ (aggr. heur. 2) |
|---|---|---|
| 200 | 54 | 65 |
| 500 | 118 | 143 |
| 1000 | 208 | 282 |
| 2000 | 364 | 506 |

So $L \log n / n$ stayed between about 1.38 and 1.95. Also, the Shortener moves naturally switched into the $\Omega=2$ layer: for example $4, 9, 23, 25, 41, 47, 49, \ldots$ in one run, and $9, 16, 19, 29, 37, 41, 43, 49, 53, \ldots$ in another. That is exactly the behavior this analysis predicts.

## Summary

Shortener should not try to reserve a static prime shield. She should play the greedy current-cover strategy on legal lower numbers, analyzed through $\Omega$-layers. The proof target is not the false bound on $\sum_{p \in B} 1/p$, but the pair of dynamical lemmas above: a semiprime-exposure bound for blocked primes, and an online $\Omega=2$ cover lemma for the $\Omega \ge 3$ pool.

I do not have those two lemmas proved cleanly yet, but this is the first dynamical strategy that seems to survive the failure of the carrier-capacity lemma and still point honestly toward $O(n/\log n)$.

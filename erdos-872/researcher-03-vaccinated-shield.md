# Researcher output — Vaccinated Shield Reduction + prefix obstruction

**Source:** ChatGPT Pro, "broad search" thread. Prompt: `prompts/researcher-02-open-exploration.md` (no directions suggested, pure exploration).
**Extracted:** 2026-04-17 late evening, verbatim from the response.
**Status:** not yet Aristotle-verified; not yet independently audited.

---

I pursued the idea suggested by the exact first moves ($6$) and ($18$): a lower-half move can "vaccinate" the game by making many dangerous divisors illegal. That leads to one clean exact extension of the shield reduction, and then to a rigorous no-go theorem for a broad class of shield-based lower-bound attempts.

Let me write the new part in a compact form.

For a primitive lower prefix $D \subseteq L$, define
$$U_D := \{u \in U : d \nmid u \text{ for every } d \in D\}.$$
If $P \subseteq U_D$ is a primitive upper prefix, define
$$L_D(P) := \{x \in L : x \nmid u\ \forall u \in P,\ \text{and}\ x \nmid d,\ d \nmid x\ \forall d \in D\}.$$
For $x \in L_D(P)$, set
$$M_D(x) := \{u \in U_D : x \mid u\},\qquad w_D(x) := |M_D(x)| - 1,$$
and
$$\beta_D(P) := \max\Bigl\{\sum_{x \in B} w_D(x) : B \subseteq L_D(P)\ \text{antichain}\Bigr\}.$$

## Vaccinated Shield Reduction

Every maximal extension $A \supseteq D \cup P$ satisfies
$$|A| \ge |D| + |U_D| - \beta_D(P).$$

**Proof.** Same counting argument as the original shield theorem. If $B = A \cap L_D(P)$, every $u \in U_D \setminus A$ must be divisible by some $x \in B$ (else $u$ could be added). Hence
$$|A \cap U_D| \ge |U_D| - \Bigl|\bigcup_{x \in B} M_D(x)\Bigr|$$
and therefore
$$|A| = |D| + |B| + |A \cap U_D| \ge |D| + |U_D| - \sum_{x \in B}(|M_D(x)| - 1).$$

This far, exact.

## Quantitative obstruction

Define the **reciprocal mass** $\sigma(D) := \sum_{d \in D} 1/d$.

Let $D_n \subseteq L_n$, $P_n \subseteq U_n$ be any prefixes with $m_n := |D_n| + |P_n| = n^{o(1)}$.

For a prime $p$ dividing no element of $D_n \cup P_n$, all $U$-multiples of $p$ remain legal except those also divisible by some $d \in D_n$. Union bound:
$$|M_{D_n}(p)| \ge \Bigl(\Bigl\lfloor\frac{n}{p}\Bigr\rfloor - \Bigl\lfloor\frac{n}{2p}\Bigr\rfloor\Bigr) - \sum_{d \in D_n}\Bigl(\Bigl\lfloor\frac{n}{pd}\Bigr\rfloor - \Bigl\lfloor\frac{n}{2pd}\Bigr\rfloor\Bigr)$$
because $p \nmid d$ implies $\mathrm{lcm}(p, d) = pd$. Hence
$$w_{D_n}(p) \ge \frac{(1 - \sigma(D_n)) n}{2p} + O(|D_n|).$$

Let $Q_\delta$ be primes $p \le n^\delta$ dividing no element of $D_n \cup P_n$, for fixed $0 < \delta < 1$. These primes form an antichain in $L_{D_n}(P_n)$, so
$$\beta_{D_n}(P_n) \ge \sum_{p \in Q_\delta} w_{D_n}(p) \ge \frac{(1 - \sigma(D_n)) n}{2} \sum_{p \in Q_\delta} \frac{1}{p} + O(|D_n| \pi(n^\delta)).$$
Since $m_n = n^{o(1)}$, the error is $o(n)$.

Excluded primes have log-mass bounded by
$$\sum_{p \mid \prod_{a \in D_n \cup P_n} a} \log p \le \sum_{a \in D_n \cup P_n} \log a \le m_n \log n.$$
Among prime sets with given log-mass, $\sum 1/p$ is maximized by smallest primes, so by Chebyshev/Mertens
$$\sum_{p \notin Q_\delta,\ p \le n^\delta} \frac{1}{p} \le \log\log(m_n \log n) + O(1),$$
while
$$\sum_{p \le n^\delta} \frac{1}{p} = \log\log n + O(1).$$
Therefore
$$\sum_{p \in Q_\delta} \frac{1}{p} \ge \log\frac{\log n}{\log(m_n \log n)} + O(1).$$

And we get the main obstruction:

$$\boxed{\beta_{D_n}(P_n) \ge \left(\frac{1 - \sigma(D_n)}{2} \log\frac{\log n}{\log(m_n \log n)} + o(1)\right) n.}$$

## Immediate consequences

- If $1 - \sigma(D_n)$ stays bounded below by a positive constant, then $\beta_{D_n}(P_n)/n \to \infty$. Since $|U_{D_n}| \le |U| \sim n/2$ and $|D_n| = o(n)$, the vaccinated shield bound $|A| \ge |D_n| + |U_{D_n}| - \beta_{D_n}(P_n)$ is asymptotically vacuous.

- Any subpolynomial-prefix shield proof must satisfy
$$(1 - \sigma(D_n)) \log\frac{\log n}{\log(m_n \log n)} = O(1).$$
In particular: **$\sigma(D_n) = 1 - o(1)$**.

- **Clearest new structural conclusion**: a successful shield-after-prefix strategy cannot come from a bounded or subpolynomial amount of "local cleanup" unless the lower prefix accumulates reciprocal mass very close to $1$.

- **Corollary**: if $D_n \subseteq [n^\varepsilon, n/2]$ and $|D_n| = n^{o(1)}$, then $\sigma(D_n) \le |D_n|/n^\varepsilon = o(1)$, so the obstruction applies with full coefficient $1/2$. Thus any "play a subpolynomial number of medium/large lower-half moves, then invoke shield" strategy is **asymptotically ruled out**.

  This directly kills the most tempting extension of the zero-shadow layer $(n/3, n/2]$.

## Fixed-prefix sharpening (relevant to exact moves 6 and 18)

For fixed finite $D$, let $\rho(D) := \lim_{N \to \infty} \frac{1}{N} |\{m \le N : d \nmid m\ \forall d \in D\}|$ (periodic density, positive).

Then $|U_D| = (\rho(D)/2 + o(1)) n$. For every prime $p \nmid \mathrm{lcm}(D)$,
$$w_D(p) = \frac{\rho(D) n}{2p} + O_D(1)$$
because multiplication by $p$ permutes residue classes mod $\mathrm{lcm}(D)$.

Running the prime argument gives, for $|P| \le n^\alpha$ with fixed $0 < \alpha < 1$:
$$\beta_D(P) \ge \left(\frac{\rho(D)}{2} \log\frac{1}{\alpha} + o(1)\right) n.$$

Since $|U_D| = (\rho(D)/2 + o(1)) n$, this is the clean ratio form

$$\boxed{\beta_D(P) \ge (\log(1/\alpha) + o(1)) |U_D|.}$$

So a fixed finite vaccination does **not** change the normalized prime barrier at all. The critical threshold $\alpha = e^{-1}$ is unchanged.

**Two concrete examples:**

- $D = \{6\}$: $|U_D| = \frac{5}{12}n + O(1)$, $\beta_D(P) \ge (\frac{5}{12} \log\frac{1}{\alpha} + o(1)) n$.
- $D = \{18\}$: $|U_D| = \frac{17}{36}n + O(1)$, $\beta_D(P) \ge (\frac{17}{36} \log\frac{1}{\alpha} + o(1)) n$.

In the shield metric, $18$ is not an asymptotic improvement over $6$; its advantage is purely finite-scale, coming from killing $9$ and a few nearby blockers. The medium-prime obstruction survives with the same normalized strength.

## Interpretation

The exact small-$n$ preference for divisor-rich first moves is real, but it is a *local* phenomenon. Any asymptotic proof of $L(n) \ge \varepsilon n$ that still runs through a shield reduction will need something much more global than "play $6$, or $18$, or a subpolynomial number of clever low-shadow moves, then shield." The lower prefix must either:

1. carry reciprocal mass $\sigma(D_n)$ all the way up to $1 - o(1)$, which forces many genuinely small numbers into play, or
2. avoid shield reduction entirely and use a different certificate.

That gives a concrete next target: study primitive lower prefixes $D_n$ with $\sigma(D_n) \approx 1$ and ask whether they can simultaneously have small enough upper-half cost to leave room for a linear final antichain.

Does not resolve the linear lower bound itself, but sharply narrows what a successful proof would have to look like.

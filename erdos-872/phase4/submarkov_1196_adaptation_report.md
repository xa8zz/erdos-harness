# Sub-Markov Adaptation of #1196 to #872

Date: 2026-04-19

## Executive summary

I fetched and read the public `math-inc/Erdos1196` proof and Lean development. The outcome for #872 is:

1. The **first-hit / antichain** part of #1196 does **not** directly adapt to give a useful bound on `L(n)`. At an abstract level it only yields a weighted LYM inequality on divisibility antichains, and that cannot force `o(n)` on game terminal positions because the whole upper half `(n/2, n]` is already an antichain of size `n/2`.
2. The **normalization** idea *does* adapt to the R22 certificate weight `1 / φ(d)`. After normalization, the quantity
   \[
   \sum_{d \in \mathcal K(P)} \frac{1}{\varphi(d)}
   \]
   is exactly a Bernoulli product-measure probability on squarefree `y`-smooth supports.
3. This gives a clean probabilistic reformulation of the certificate gap:
   \[
   \sup_{\text{reachable } P} \sum_{d \in \mathcal K(P)} \frac{1}{\varphi(d)} = o(\log y)
   \quad\Longleftrightarrow\quad
   \sup_{\text{reachable } P} \mathbf P(D_y \in \mathcal K(P)) = o(1),
   \]
   where `D_y` is the random squarefree product obtained by including each prime `p <= y` independently with probability `1/p`.
4. I do **not** see a way to turn that reformulation into a #1196-style first-hit theorem, because `\mathcal K(P)` is a **down-set**, not an antichain. The correct object is a survival / terminal-membership probability, not a single-hit mass.

So this angle is **partially successful**: it does not close #872, but it gives a precise probabilistic state space for the certificate lemma and a clear obstruction to the direct `L(n)=o(n)` route.

## 1. What #1196 actually does

In `source.tex`, the chain is built on the divisibility poset above `x` as follows.

For `m >= x` and prime powers `q >= Y`,
\[
p(m,mq) := \frac{\log m}{\log^2(mq)} \frac{\Lambda(q)}{q},
\]
and for `Y` large enough the row sum
\[
R_Y(m) = \sum_{q \ge Y} p(m,mq)
\]
is at most `1`, so this is a genuine sub-Markov chain (with cemetery state for the missing mass).

The initial distribution is not arbitrary. One defines
\[
b_x(n) := \frac{1}{n \log^2 n}
\left(
\sum_{\substack{q \mid n\\ q < Y}} \Lambda(q)
+
\sum_{\substack{q \mid n\\ q \ge Y\\ n/q < x}} \Lambda(q)
\right),
\qquad
\mu_x(n) := \frac{b_x(n)}{B_x},
\]
where `B_x = \sum_{n >= x} b_x(n) = 1 + O(1 / \log x)`.

Then the visit probabilities satisfy the exact closed formula
\[
v_x(n) = \frac{1}{B_x\, n \log n}.
\]

The reason this works is the divisor identity
\[
\sum_{q \mid n} \Lambda(q) = \log n.
\]
The recurrence for `v_x(n)` plus this identity collapses the whole last-jump sum to `1 / (B_x n log n)`.

After that, the first-hit argument is conceptually simple: every sample path is a strict divisibility chain, so a primitive set can be hit at most once. Hence for every primitive set `A`,
\[
\sum_{a \in A} v_x(a) \le 1,
\]
which yields
\[
\sum_{a \in A} \frac{1}{a \log a} \le B_x = 1 + O(1/\log x).
\]

## 2. Structural invariant extracted from #1196

The load-bearing invariant is not the specific weight `1 / (n log n)`. It is this:

> A #1196-style construction gives a random **divisibility chain** together with state weights
> \[
> w(n) = \mathbf P(n \text{ is visited}),
> \]
> and therefore a weighted LYM inequality
> \[
> \sum_{a \in A} w(a) \le 1
> \]
> for every divisibility antichain `A`.

So any adaptation to #872 has to make the target quantity look like one of the following.

1. A sum of visit probabilities over an antichain.
2. A first-hit mass for a monotone event along a divisibility chain.
3. A terminal/survival probability of a related chain, if the target set is not an antichain.

The novelty in #1196 is the exact arithmetic tuning that makes `w(n)` equal the desired weight. The antichain inequality itself is just the weighted Lubell principle for a random chain.

## 3. Direct route to `L(n) = o(n)` fails structurally

Suppose we try to imitate #1196 literally on `\{2,\dots,n\}` and hope for a direct antichain bound on final game positions.

Let `w_n(u)` be any visit-probability weight coming from a random strict divisibility chain in `\{2,\dots,n\}`. Then for every antichain `A`,
\[
\sum_{u \in A} w_n(u) \le 1.
\]

Take the upper half
\[
U_n := (n/2, n] \cap \mathbf Z.
\]
This is itself an antichain, so necessarily
\[
\sum_{u \in U_n} w_n(u) \le 1.
\]
Hence the average value of `w_n` on `U_n` is at most `2/n`.

Therefore:

> No game-state-blind first-hit / weighted-LYM construction can prove a universal cardinality bound
> \[
> |A| \le f(n)
> \]
> with `f(n) = o(n)` for terminal antichains `A`, because the already-legal position `U_n` forces the chain weights on upper-half states down to scale `1/n`.

This does **not** rule out a Markov argument that uses additional game-state information. But it does rule out the naive hope that one can transplant #1196 and get `o(n)` just from a better antichain weight on the raw divisibility poset.

So option **(a)** from the dispatch is a dead end in its literal #1196 form.

## 4. The useful adaptation: normalize `1 / φ(d)` as a product measure

Now turn to the R22 certificate gap.

Let
\[
y := \exp\!\big((\log n)^{1/2}\big),
\]
and restrict to squarefree `y`-smooth integers. For such `d`, write
\[
W_y(d) := \frac{1}{\varphi(d)} = \prod_{p \mid d} \frac{1}{p-1}.
\]

Define the normalizing constant
\[
Z_y := \sum_{\substack{d \text{ squarefree}\\ P^+(d) \le y}} \frac{1}{\varphi(d)}
= \prod_{p \le y} \left(1 + \frac{1}{p-1}\right)
= \prod_{p \le y} \frac{p}{p-1}.
\]
By Mertens,
\[
Z_y = e^\gamma \log y + O(1).
\]

Now define a random squarefree product
\[
D_y := \prod_{p \le y} p^{X_p},
\]
where the `X_p` are independent Bernoulli random variables with
\[
\mathbf P(X_p = 1) = \frac{1}{p}, \qquad \mathbf P(X_p = 0) = 1 - \frac{1}{p}.
\]

Then for every squarefree `d` with `P^+(d) <= y`,
\[
\mathbf P(D_y = d)
= \prod_{p \mid d} \frac{1}{p} \prod_{p \nmid d} \left(1 - \frac{1}{p}\right)
= \left(\prod_{p \le y} \left(1 - \frac{1}{p}\right)\right) \prod_{p \mid d} \frac{1}{p-1}
= \frac{1}{Z_y \varphi(d)}.
\]

Therefore, for every family `K` of squarefree `y`-smooth integers,
\[
\sum_{d \in K} \frac{1}{\varphi(d)}
= Z_y \, \mathbf P(D_y \in K).
\]

This is the exact normalization identity that survives from #1196.

## 5. Reformulation of the certificate gap

The missing lemma from the dispatch is
\[
\sup_{\text{reachable } P}
\sum_{d \in \mathcal K(P)} \frac{1}{\varphi(d)}
= o(\log y).
\]

Since `Z_y ~ e^\gamma \log y`, the identity above gives the equivalent statement
\[
\sup_{\text{reachable } P} \mathbf P(D_y \in \mathcal K(P)) = o(1).
\]

This is the cleanest #1196-style reformulation I found.

Interpretation:

- `\mathcal K(P)` is a down-closed complex of squarefree `y`-smooth supports.
- `D_y` is the natural random support in which each prime `p <= y` is activated independently with probability `1/p`.
- The entire certificate problem is: **can a reachable Prolonger closure capture a vanishing fraction of this Bernoulli support law, uniformly?**

That is a genuinely new probabilistic framing of the gap.

## 6. Why the first-hit argument does not transfer

This is the main obstruction.

In #1196, the target set `A` is an antichain, so a chain can meet it at most once. That is why first-hit mass and total visit mass coincide.

Here, `\mathcal K(P)` is a **down-set**. Along any increasing support chain,
\[
\emptyset \subset \{p_1\} \subset \{p_1,p_2\} \subset \cdots,
\]
the path may stay inside `\mathcal K(P)` for many consecutive steps before leaving it.

So:

- first-hit mass of `\mathcal K(P)` is not the right quantity,
- total visit mass of `\mathcal K(P)` overcounts badly,
- terminal membership / survival probability is the correct quantity.

In other words, only the **normalization** piece of #1196 ports cleanly. The **single-hit antichain** piece does not.

The natural chain on supports is:

1. order primes `p <= y` increasingly,
2. at prime `p`, include it with probability `1/p`,
3. the state is the current partial squarefree product.

Its terminal law is exactly `\mathbf P(D_y = d) = 1/(Z_y \varphi(d))`, but the event `D_y \in \mathcal K(P)` is a survival/terminal event, not a first-hit event.

So option **(b)** succeeds only partially:

- yes for normalization,
- no for the #1196 first-hit inequality.

## 7. One concrete corollary

Let
\[
N_y := \omega(D_y) = \sum_{p \le y} X_p.
\]
Then
\[
\mathbf E[N_y] = \sum_{p \le y} \frac{1}{p}
= \log\log y + M + o(1)
= \frac{1}{2}\log\log n + O(1).
\]

So a typical `D_y` has about `(1/2) log log n` prime factors.

This gives a rigorous corollary:

> If every `d \in \mathcal K(P)` satisfies
> \[
> \omega(d) \le r(n)
> \]
> with `r(n) = o(log log n)`, then
> \[
> \sum_{d \in \mathcal K(P)} \frac{1}{\varphi(d)} = o(\log y).
> \]

Proof: by the product-measure reformulation,
\[
\sum_{d \in \mathcal K(P)} \frac{1}{\varphi(d)}
\le Z_y \, \mathbf P(N_y \le r(n)).
\]
Since `N_y` is a sum of independent Bernoulli variables with mean `~ (1/2) log log n -> \infty`, a standard Chernoff bound gives
\[
\mathbf P(N_y \le r(n)) = o(1)
\]
whenever `r(n) = o(log log n)`. Multiplying by `Z_y ~ e^\gamma \log y` yields `o(log y)`.

This does not solve the certificate gap, but it shows exactly where a counterexample would have to live:

> A bad reachable closure cannot be concentrated on bounded-rank or even `o(log log n)`-rank supports. It would have to cover **medium-rank** `y`-smooth supports, on the natural Bernoulli scale `\omega(d) ~ (1/2)\log\log n`.

That is a real structural narrowing.

## 8. What I could not get

I did **not** find:

1. a sub-Markov chain on raw integers whose visit probabilities are exactly proportional to `1 / φ(d)` on squarefree `y`-smooth numbers,
2. a first-hit argument that bounds the total `1 / φ`-mass of a down-closed complex,
3. a Markov formulation that controls the R26 residual-fiber-mass problem after core activation,
4. a structural impossibility theorem ruling out all possible Markov-style arguments for #872.

The most I can honestly claim is:

- the direct antichain route to `o(n)` is structurally blocked,
- the certificate gap admits a clean probabilistic normalization,
- the remaining missing input is a **survival estimate** for reachable down-sets under the Bernoulli `1/p` product law.

## 9. Bottom line

The #1196 framework does **not** directly solve #872.

What survives is not the first-hit lemma, but the normalization philosophy:

- choose the right probabilistic law,
- normalize the target weight exactly,
- reinterpret the open lemma as a probability statement.

For #872, that law is the Bernoulli support measure
\[
X_p \sim \mathrm{Bernoulli}(1/p),
\]
and the open R22 certificate gap becomes:

> show that every reachable closure `\mathcal K(P)` has vanishing probability under this law.

That is the sharpest useful reformulation I found. It seems genuinely orthogonal to the existing bounded-rank / blocker-race obstructions, and it gives a concrete next target if this direction is pursued again.

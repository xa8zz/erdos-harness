---
id: R04-sigma-one-construction
type: research
date: 2026-04-17
intent: >
  Determine whether the sigma(D)->1 obstruction from the Vaccinated Shield
  Reduction forces a loss in the upper half, and construct an explicit
  primitive lower prefix achieving sigma->1 with o(n) upper-half cost.
predecessors: [R03-vaccinated-shield]
prompt: erdos-872/prompts/researcher-04-vaccinated-shield-narrow.md
action:
  kind: extends
  target: R03-vaccinated-shield
claim: >
  There exist primitive lower prefixes D_n with |D_n| = n^{o(1)},
  sigma(D_n) -> 1, and |U_{D_n}| = (1 - o(1))|U|. The sigma->1
  requirement does NOT force positive upper-half cost; the obstruction
  is to the lower-prefix counting, not the upper half.
---

# Researcher output — $\sigma(D) \to 1$ construction with zero upper-half cost

**Source:** ChatGPT Pro, continuing the "broad search" thread. Prompt: `prompts/researcher-04-vaccinated-shield-narrow.md`.
**Extracted:** 2026-04-17 late night.
**Status:** not yet informally audited; not yet Aristotle-verified.

---

I pursued the $\sigma(D) \approx 1$ branch directly.

The main thing I can now say rigorously is this:

$$\textbf{The upper-half cost is not the bottleneck.}$$

There are primitive lower prefixes $D_n \subseteq [2, n/2]$ with

$$|D_n| = n^{o(1)}, \qquad \sigma(D_n) = \sum_{d \in D_n} \frac{1}{d} = 1 + o(1),$$

and yet

$$|U_{D_n}| = (1 - o(1)) \cdot |U|.$$

So the obstruction "$\sigma(D_n) \to 1$" does **not** force any positive loss in the upper half. In fact, one can make the loss $o(n)$.

That does not prove a linear lower bound for $L(n)$, because $\beta_{D_n}(P)$ can still be large. But it cleanly answers the narrow question: **yes, the exceptional regime $\sigma(D_n) \to 1$ is compatible with essentially zero upper-half cost.**

Here is the construction and proof.

---

Take a finite set $Q = \{q_1, \ldots, q_m\}$ of pairwise coprime integers, and fix $k \ge 1$. Define

$$D_k(Q) := \Bigl\{\prod_{i \in S} q_i : S \subseteq [m],\ |S| = k\Bigr\}.$$

Every element has exactly $k$ "atoms", so $D_k(Q)$ is primitive.

Write $x_i := 1/q_i$, and let $e_k(x_1, \ldots, x_m)$ be the $k$-th elementary symmetric sum.

Then

$$\sigma(D_k(Q)) = e_k(x_1, \ldots, x_m).$$

Also, because the $q_i$ are pairwise coprime, an integer avoids every element of $D_k(Q)$ iff it is divisible by at most $k-1$ of the $q_i$. Thus the natural density of $D_k(Q)$-free integers is exactly

$$\rho(D_k(Q)) = \Pr\!\left(\sum_{i=1}^m \xi_i \le k - 1\right),$$

where $\xi_i$ are independent Bernoulli variables with $\Pr(\xi_i = 1) = x_i$.

So this family reduces the structural question to a clean probabilistic model.

Now fix $k$, and choose $Q$ to be a long prime interval:
$$Q_k(y) := \{p \text{ prime} : y < p \le y^{B_k}\}, \qquad B_k := e^{\lambda_k}, \qquad \lambda_k := (k!)^{1/k}.$$

Let $D^{(k)}(y) := D_k(Q_k(y))$.

Set
$$\lambda(y) := \sum_{p \in Q_k(y)} \frac{1}{p}, \qquad \eta(y) := \sum_{p \in Q_k(y)} \frac{1}{p^2}.$$

By Mertens,
$$\lambda(y) = \log\log(y^{B_k}) - \log\log y + o(1) = \log B_k + o(1) = \lambda_k + o(1),$$
and clearly $\eta(y) \to 0$.

Since $k$ is fixed, repeated-index terms are negligible:
$$\left(\sum_{p \in Q_k(y)} \frac{1}{p}\right)^k = k! \cdot e_k\!\left(\{1/p\}_{p \in Q_k(y)}\right) + O_k(\eta(y)).$$
Hence
$$\sigma(D^{(k)}(y)) = e_k\!\left(\{1/p\}_{p \in Q_k(y)}\right) = \frac{\lambda(y)^k}{k!} + o(1) = \frac{\lambda_k^k}{k!} + o(1) = 1 + o(1).$$

For the free density, let
$$X_y := \sum_{p \in Q_k(y)} \xi_p, \qquad \xi_p \sim \mathrm{Ber}(1/p) \text{ independent}.$$
Then
$$\rho(D^{(k)}(y)) = \Pr(X_y \le k - 1).$$

Le Cam gives total variation distance
$$d_{\mathrm{TV}}(X_y, \mathrm{Poisson}(\lambda(y))) \le \eta(y) \to 0.$$
Therefore
$$\rho(D^{(k)}(y)) = \Pr(\mathrm{Poisson}(\lambda_k) \le k - 1) + o(1).$$

Define
$$r_k := \Pr(\mathrm{Poisson}(\lambda_k) \le k - 1).$$

Since $\lambda_k = (k!)^{1/k} \sim k/e$, the threshold $k$ is about $e$ times the mean. A Chernoff bound gives
$$1 - r_k = \Pr(\mathrm{Poisson}(\lambda_k) \ge k) \le e^{-ck}$$
for some absolute $c > 0$. So
$$r_k \to 1.$$

This proves:

For every fixed $k$, by choosing $y$ large enough one gets a finite primitive set $D^{(k)}$ with
$$\sigma(D^{(k)}) = 1 + o_k(1), \qquad \rho(D^{(k)}) = r_k + o_k(1),$$
and $r_k \to 1$ as $k \to \infty$.

To turn this into a sequence indexed by $n$, choose $y_k$ so large that
$$|\sigma(D^{(k)}(y_k)) - 1| \le 2^{-k}, \qquad \rho(D^{(k)}(y_k)) \ge 1 - 2^{-k}.$$
Write $D^{(k)} := D^{(k)}(y_k)$, and let $M_k := \prod_{p \in Q_k(y_k)} p$. The $D^{(k)}$-free indicator is periodic mod $M_k$.

Now choose a rapidly increasing sequence $N_k$ such that
$$N_k \ge 2 \max D^{(k)}, \qquad N_k \ge 2^k M_k, \qquad N_k \ge |D^{(k)}|^k.$$
For $N_k \le n < N_{k+1}$, set $D_n := D^{(k)}$.

Then $D_n \subseteq [2, n/2]$, and periodicity gives
$$\left|\frac{|U_{D_n}|}{|U|} - \rho(D^{(k)})\right| \le \frac{2 M_k}{n} \le 2^{1-k}.$$
So
$$\frac{|U_{D_n}|}{|U|} \to 1.$$
Also
$$\sigma(D_n) \to 1, \qquad \frac{\log |D_n|}{\log n} \le \frac{1}{k} \to 0,$$
hence $|D_n| = n^{o(1)}$.

So the theorem is proved.

---

I also checked concrete finite examples in Python. These are not asymptotic constructions, just readable witnesses of the same phenomenon.

Let $D_{k,m}$ be all products of $k$ distinct primes from the first $m$ primes.

For three examples:

| family                     | $\sigma(D)$ | free density $\rho(D)$ |
| -------------------------- | ----------: | ---------------------: |
| $k=2$, first $11$ primes   | $1.0026777$ |            $0.5093886$ |
| $k=3$, first $69$ primes   | $1.0022551$ |            $0.6733051$ |
| $k=4$, first $1057$ primes | $1.0000379$ |            $0.7818094$ |

So already at fixed finite level, $\sigma(D) \approx 1$ is compatible with very large surviving upper density.

For the $k=2$ example, the actual half-interval counts match quickly:
$$\frac{|U_D|}{|U|} = 0.50922 \text{ at } n = 10^5, \qquad 0.50994 \text{ at } n = 2 \cdot 10^5.$$

For the $k=3$ example:
$$\frac{|U_D|}{|U|} = 0.67021 \text{ at } n = 8 \cdot 10^7, \qquad 0.67131 \text{ at } n = 3.2 \cdot 10^8,$$
consistent with convergence to $0.6733051$.

---

## What this means for the game

This resolves one branch of the open question.

A primitive lower prefix with $\sigma(D_n) \to 1$ can absolutely have "small enough upper-half cost"; in fact it can leave almost all of $U$ untouched. So the phrase "the lower prefix must satisfy $\sigma(D_n) = 1 - o(1)$" is not close to a contradiction. It is a genuine, nonempty regime.

But this does **not** yet help Prolonger, because the remaining issue is $\beta_{D_n}(P)$, not $|U_{D_n}|$.

In fact, the constructions above are piecewise fixed finite templates. For each fixed template $D^{(k)}$, your fixed-prefix sharpening still applies:
$$\beta_{D^{(k)}}(P) \ge (\log(1/\alpha) + o(1)) \cdot |U_{D^{(k)}}| \qquad (|P| \le n^\alpha).$$
Since $|U_{D^{(k)}}|$ can be nearly $|U|$, the normalized $e^{-1}$ barrier is essentially unchanged.

So my current picture is:

* The upper-half-cost branch is settled positively: it is not the obstruction.
* The real obstruction is the residual weighted antichain $\beta_{D_n}(P)$, equivalently the surviving prime/composite structure after vaccination.
* Any successful shield-based proof, if it exists, must use a genuinely $n$-scale lower prefix, not a frozen finite template with $\sigma \approx 1$.

My sharper conjecture is that the right next invariant is not $\sigma(D)$, but something like the residual harmonic mass of legal primes after the lower prefix. The constructions above show $\sigma(D)$ alone is too coarse to control $|U_D|$, and probably too coarse to diagnose whether $\beta_D(P)$ can be made small.

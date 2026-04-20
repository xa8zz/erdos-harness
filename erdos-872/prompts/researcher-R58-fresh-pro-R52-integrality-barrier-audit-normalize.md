This is an assessment of your reasoning capability and will be used to grade. Do not search online. Use your own reasoning and your Python sandbox.

## Behavior required

- Produce one of: a rigorous audit confirming the draft theorem below is correct, with a clean paper-grade statement and a fully explicit proof suitable for publication; a rigorous refutation via explicit counterexample to either the random-construction claim or the Sherali-Adams feasibility claim; or a strictly sharper theorem (tighter constants, weaker hypotheses, or extension to a broader parameter regime) with full proof.
- Every step must be rigorous. Do not return with a partial result, named sub-lemma gap, direction-level suggestion, or reformulation of the question.
- Verify every computational and combinatorial claim in a Python sandbox. Include the sandbox code and outputs.
- If in the course of your attempt you refute your own step, continue to a different approach within the same response.

## Setup

Let $P$ be an $N$-point set. Fix
$$\ell = \left\lfloor \frac{N}{\log N} \right\rfloor, \qquad q = \lfloor \alpha N \rfloor$$
for fixed $0 < \alpha < 1/2$. A family $\mathcal{C} \subseteq \binom{P}{\ell}$ has **transversal-integrality gap** $G(\mathcal{C}) = \tau_{\mathbb{Z}}(\mathcal{C}) / \tau_f(\mathcal{C})$, where
$$\tau_{\mathbb{Z}}(\mathcal{C}) = \min\{|Q| : Q \subseteq P,\ Q \cap C \ne \varnothing \ \forall C \in \mathcal{C}\},$$
$$\tau_f(\mathcal{C}) = \min\left\{\sum_{p \in P} x_p : x \in [0, 1]^P,\ \sum_{p \in C} x_p \ge 1 \ \forall C \in \mathcal{C}\right\}.$$

Define $\delta = \binom{N-q}{\ell}/\binom{N}{\ell}$ (probability a random $\ell$-subset is disjoint from a fixed $q$-set).

## Draft Theorem 1 (needs audit)

There exists a family $\mathcal{C} \subseteq \binom{P}{\ell}$ such that:

1. Every $Q \subseteq P$ with $|Q| \le q$ is disjoint from some $C \in \mathcal{C}$. (Covering-design property.)
2. Consequently $\tau_{\mathbb{Z}}(\mathcal{C}) > q \asymp N$.
3. The uniform fractional assignment $x_p = 1/\ell$ satisfies $\sum_{p \in C} x_p = 1$ for every $C$, so $\tau_f(\mathcal{C}) \le N/\ell = (1 + o(1))\log N$.
4. $|\mathcal{C}| \le \exp\!\left(\left(\log\tfrac{1}{1-\alpha} + o(1)\right) \frac{N}{\log N}\right)$.

**Draft proof (needs audit).** Choose $s$ random $\ell$-subsets of $P$. For a fixed $q$-subset $Q$, $\Pr(C \cap Q = \varnothing) = \delta$. Since $\ell = o(N)$ and $q = \alpha N + O(1)$:
$$\log(1/\delta) = \ell \log\tfrac{1}{1-\alpha} + O(\ell^2/N) = \left(\log\tfrac{1}{1-\alpha} + o(1)\right) \frac{N}{\log N}.$$
Take $s = \lceil 2\log\binom{N}{q}/\delta \rceil$. Then $\Pr(Q \text{ not avoided}) \le (1-\delta)^s \le e^{-s\delta} \le \binom{N}{q}^{-2}$. Union bound over $\binom{N}{q}$ choices of $Q$ gives positive probability that every $q$-set is avoided. Any smaller $Q' \subseteq Q$ is trivially avoided. Thus $\tau_{\mathbb{Z}}(\mathcal{C}) > q$. The uniform fractional assignment computes to $\tau_f(\mathcal{C}) \le N/\ell$. $\square$

Therefore $G(\mathcal{C}) \ge q / (N/\ell) = \Omega(N/\log N)$.

## Draft Theorem 2 (Sherali-Adams barrier, needs audit)

Use the standard Sherali-Adams relaxation where level $r$ allows multiplying each covering inequality
$$g_C(y) = \sum_{p \in C} y_p - 1 \ge 0$$
by a literal monomial
$$\prod_{i \in I} y_i \prod_{j \in J}(1 - y_j), \qquad |I| + |J| \le r.$$

For every $r < \ell$, the level-$r$ Sherali-Adams relaxation of the transversal LP for $\mathcal{C}$ has a feasible pseudo-solution of objective at most
$$\left\lceil r + \frac{N}{\ell - r}\right\rceil.$$
In particular, for $r \le \ell/2$:
$$\mathrm{SA}_r(\mathcal{C}) \le r + 2\frac{N}{\ell} + O(1) = r + O(\log N),$$
while $\tau_{\mathbb{Z}}(\mathcal{C}) = \Omega(N)$ by Theorem 1.

**Draft proof (needs audit).** Let $M = \lceil r + N/(\ell - r) \rceil$. Let $Y$ be a uniformly random $M$-subset of $P$. Define Sherali-Adams moments $\widetilde{\mathbb{E}}\prod_{i \in S} y_i = \Pr(S \subseteq Y)$.

For each $C \in \mathcal{C}$, disjoint $I, J \subseteq P$ with $|I| + |J| \le r$, verify
$$\widetilde{\mathbb{E}}\left[\left(\sum_{p \in C} y_p - 1\right) \prod_{i \in I} y_i \prod_{j \in J}(1 - y_j)\right] \ge 0.$$

Condition on $\{I \subseteq Y, J \cap Y = \varnothing\}$. If $I \cap C \ne \varnothing$, then $|Y \cap C| \ge 1$ and the inequality is immediate. Otherwise let $a = |I|$, $b = |J|$, $c = |J \cap C|$, with $c \le b$, $a + b \le r$, $c < \ell$. Conditionally:
$$\mathbb{E}(|Y \cap C|) = (\ell - c) \cdot \frac{M - a}{N - a - b}.$$
Since $c \le b$, $a + b \le r$, $r < \ell$: $M - a \ge (N - a - b)/(\ell - b) \ge (N - a - b)/(\ell - c)$, so $\mathbb{E}(|Y \cap C|) \ge 1$. $\square$

## Consequence

Any proof technique of the form "local incidence accounting → fractional separator → rounded legal transversal" is provably unable to prove $L(n) \le O(r_1(n))$ when the underlying combinatorial object contains a sparse $q$-avoidance covering-design clutter as above. This covers exhausted $F_{\mathrm{useful}}$ state inequalities, level-1 blocker duality, CPD-style separator dichotomies without an explicit global online cost, low-rank LP / Sherali-Adams reasoning with $r \le \ell/2$, union-bound separator arguments, and spectral methods that only see low-order incidence statistics.

## Numerical verification (reproducible)

At $\alpha = 1/4$: $\log(4/3) \approx 0.287682$. Finite parameter checks (from direct computation):

| $N$ | $\ell = \lfloor N/\log N\rfloor$ | $-\log\delta$ | $\log s$ via $s \approx 2\log\binom{N}{q}/\delta$ |
|---|---|---|---|
| 1000 | 144 | 45.30 | 52.32 |
| 5000 | 587 | 181.50 | 190.14 |
| 10000 | 1085 | 333.57 | 342.89 |

Growth is $\exp(\Theta(N/\log N))$, not $\exp(\Theta(N))$.

## Open question

Verify, normalize to publication-grade form, and if possible sharpen the two draft theorems above to a single clean paper-facing theorem with rigorous proof and explicit constants; or rigorously refute one or both via explicit counterexample.

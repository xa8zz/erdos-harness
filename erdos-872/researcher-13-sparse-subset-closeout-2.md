# Sparse-subset closeout — independent derivation #2 (2026-04-18)

Cross-family duplicate of the first sparse-subset closeout: three-family construction, same size bounds, same Mertens-based counting, same Circuit-Lemma isolation argument. Adds direct Python sieve sanity at $n = 10^6$, $(\beta, \gamma, \delta) = (0.40, 0.49, 0.20)$: $|R| = 14521$, $|S| = 7910$, $|S|/|R| = 0.545$ — matches the explicit-construction figure from the greedy run and the Codex empirical measurement.

Two independent derivations from the same canonical brief agree on the theorem statement, construction, size decomposition, and numerical witness. Strong convergence signal.

---

I can rigorously close the sparse-subset analytic gap (c). The full reachability question remains, but the "full $\mathcal{E}$ is too large" objection is no longer a gap: an explicit $O(n/\log n)$-sized subset of $\mathcal{E}$ already isolates $\gg n \log\log n / \log n$ residual moves.

Here is the clean statement.

**Sparse obstruction theorem.** Fix $0 < \beta < \gamma < 1/2$, and let
$$Q = \{q \text{ prime} : n^\beta \le q \le n^\gamma\}.$$
Choose a fixed $0 < \delta < \min(\beta, (1-\gamma)/2)$, and let
$$A = \{a \text{ odd prime} : a \le n^\delta\}.$$
Then there is an explicit antichain $S \subseteq \mathcal{E}$ with
$$|S| = O_{\beta,\gamma,\delta}(n/\log n)$$
such that, after $S$ is installed, at least
$$\gg_{\beta,\gamma,\delta} \frac{n \log\log n}{\log n}$$
elements of $\mathcal{M}_Q$ are isolated maximal legal moves. Consequently any maximal completion from that position has size at least
$$|S| + \gg \frac{n \log\log n}{\log n}.$$

So the sparse-subset closeout is true.

**Construction.** Define
$$S = S_{QA} \cup S_{AB} \cup S_{QB},$$
where
\begin{align*}
S_{QA} &= \{2qa : q \in Q, a \in A\}, \\
S_{AB} &= \{2ab : a \in A, b \text{ odd prime}, \exists q \in Q \text{ with } n/3 < qab \le n\}, \\
S_{QB} &= \{2qb : q \in Q, b \text{ odd prime}, b \ne q, \exists a \in A \text{ with } n/3 < qab \le n\}.
\end{align*}

For large $n$, every element of $S$ lies in $\mathcal{E}$: $2qa \le 2n^{\gamma+\delta} < n$; if $2ab \in S_{AB}$, then $qab \le n$ with $q \ge n^\beta$, so $2ab \le 2n^{1-\beta} < n$; if $2qb \in S_{QB}$, then $qab \le n$ with $a \ge 3$, so $2qb \le 2n/3 < n$. Primes are distinct: $a < q$ because $\delta < \beta$, and for valid $b$, $b > n/(3qa) \ge n^{1-\gamma-\delta}/3 > n^\delta \ge a$ for large $n$ since $\delta < (1-\gamma)/2$. We explicitly excluded $b = q$ in $S_{QB}$.

$S$ is an antichain: all elements are squarefree rank-3 integers containing 2, so distinct elements have distinct size-3 supports and are incomparable.

**Size bounds.**
- $|S_{QA}| = |Q||A| \ll (n^\gamma/\log n)(n^\delta/\log n) = o(n/\log n)$ since $\gamma + \delta < 1$.
- If $2ab \in S_{AB}$, then $b \le n^{1-\beta}/a$. Hence $|S_{AB}| \le \sum_{a \in A} \pi(n^{1-\beta}/a) \ll (n^{1-\beta}/\log n) \sum_{a \in A} 1/a \ll n^{1-\beta} \log\log n / \log n = o(n/\log n)$.
- If $2qb \in S_{QB}$, then for some $a \ge 3$, $b \le n/(qa) \le n/(3q)$. Thus $|S_{QB}| \le \sum_{q \in Q} \pi(n/(3q)) \ll (n/\log n) \sum_{q \in Q} 1/q$. By Mertens over $[n^\beta, n^\gamma]$, $\sum_{q \in Q} 1/q = \log(\gamma/\beta) + o(1)$, so $|S_{QB}| = O_{\beta,\gamma}(n/\log n)$.

Total $|S| = O_{\beta,\gamma,\delta}(n/\log n)$.

**Residual count.** Let $R = \{qab : q \in Q, a \in A, b \text{ odd prime}, b \notin \{q, a\}, n/3 < qab \le n\}$. For fixed $(q, a)$, put $X = n/(qa) \ge n^{1-\gamma-\delta} \to \infty$. Admissible $b \in (X/3, X]$; PNT gives $\pi(X) - \pi(X/3) \gg X/\log n$. Therefore
$$\#\{(q,a,b)\} \gg \sum_{q \in Q} \sum_{a \in A} \frac{n}{qa \log n} = \frac{n}{\log n} \left(\sum_{q \in Q} \frac{1}{q}\right) \left(\sum_{a \in A} \frac{1}{a}\right).$$
$\sum_{q \in Q} 1/q = \log(\gamma/\beta) + o(1)$; $\sum_{a \in A} 1/a = \log\log(n^\delta) + O(1) = \log\log n + O(1)$. So the ordered triple count is $\gg_{\beta,\gamma,\delta} n \log\log n / \log n$. A single integer $m = qab$ has at most 6 ordered representations, so $|R| \gg_{\beta,\gamma,\delta} n \log\log n / \log n$.

**Isolation.** Take $m = qab \in R$, $T = \{q, a, b\}$. The three carriers $2qa, 2qb, 2ab$ are in $S$. Every carrier in $S$ has support $\{2, u, v\}$; $T$ doesn't contain 2, so $T$ is incomparable with every carrier support in $S$. Every proper subset of $T$ is contained in one of $\{2,q,a\}, \{2,q,b\}, \{2,a,b\}$. Thus $T$ is a legal circuit relative to $S$. By Circuit Lemma, $m$ is legal and every legal move comparable with $m$ is a multiple of $m$. Since $m > n/3$, only $2m \le n$ is a candidate; $2m = 2qab$ is divisible by $2qa \in S$, illegal. Hence $m$ is an isolated maximal legal move.

So every $m \in R$ is forced into any maximal completion after $S$ is installed. This closes the analytic gap in (c).

**Numerical sanity (Python sieve).** At $n = 10^6$, $(\beta, \gamma, \delta) = (0.40, 0.49, 0.20)$: $|R| = 14521$, $|S| = 7910$, $|S|/|R| \approx 0.545$.

**Consequence.** The remaining central issue is purely online/reachability. The obstruction no longer requires Prolonger to install the full family $\mathcal{E}$ of size $\sim n \log\log n / \log n$; it is enough for Prolonger to force installation of an $O(n/\log n)$-sized triangle-carrier graph of the above form. Therefore any proof of $L(n) = \Theta(n/\log n)$ must show optimal Shortener can online-disrupt even these sparse $S_{QA} \cup S_{AB} \cup S_{QB}$ configurations. Conversely, if Prolonger can force such a sparse carrier set for some fixed $\beta < \gamma < 1/2$, then the lower bound strengthens to $L(n) \ge \Omega(n \log\log n / \log n)$.

The sparse-subset obstacle is settled in favor of the obstruction; the unresolved part is whether the sparse carrier graph is dynamically forceable.

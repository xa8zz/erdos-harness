---
id: R07-13-36-closeout
type: research
date: 2026-04-17
intent: >
  Repair the broken Bonferroni substitution in the 13/36 upper-bound proof
  via a truncation argument that avoids the non-monotonicity of f(s) = 1 - s + s^2/2.
predecessors: [R05-shortener-13-36, R06-direct-sieve-refutation]
prompt: erdos-872/prompts/researcher-07-shortener-13-36-closeout.md
action:
  kind: supersedes
  target: R05-shortener-13-36
claim: >
  L(n) <= (13/36 + o(1))n via a truncated prefix E of the odd-prime sequence.
  Choose t minimal with sum_{j<=t} 1/q_j >= 1/3 - eta_n; then s_t in [1/3, 2/3)
  and the second Bonferroni inequality is valid in this range, giving N_E(n) <=
  (13/36)*(n/2) + o(n) and L(n) <= (13/36 + o(1))n.
failure_mechanism: >
  The prior (R05) version applied Bonferroni at s >= 1/2 where f(s) is not monotone;
  truncating at t with s_t < 2/3 keeps f in the monotone region.
---

# Researcher output — $L(n) \le \tfrac{13}{36} n + o(n)$ via truncation fix

**Source:** ChatGPT Pro (continuation of the 6B thread). Prompt: `prompts/researcher-07-shortener-13-36-closeout.md`.
**Extracted:** 2026-04-18.
**Status:** rigorous; not yet audited; not yet Aristotle-verified. Replaces the broken Bonferroni substitution in `researcher-05-shortener-13-36.md`.

---

The $13/36$ bound already follows from the stated facts (A)–(C). The key step is to **truncate** the sieving set before the nonmonotonicity of
$$f(s) = 1 - s + \frac{s^2}{2}$$
becomes a problem.

Let me write it cleanly.

From (A), there is a sequence $\eta_n \to 0$ such that
$$S(D) := \sum_{j=1}^k \frac{1}{q_j} \ge \frac{1}{3} - \eta_n.$$

For $t \le k$, define
$$s_t := \sum_{j=1}^t \frac{1}{q_j}.$$
Choose $t$ minimal such that
$$s_t \ge \frac{1}{3} - \eta_n.$$
Because every $q_j$ is an odd prime, $1/q_j \le 1/3$. By minimality,
$$\frac{1}{3} - \eta_n \le s_t < \frac{1}{3} - \eta_n + \frac{1}{3} \le \frac{2}{3}$$
for all large $n$.

Now set
$$E := \{q_1, \ldots, q_t\} \subseteq D.$$

Since avoiding all primes in $D$ is stronger than avoiding all primes in $E$,
$$N_D(n) \le N_E(n),$$
where
$$N_E(n) := \#\{m \le n :\ m \text{ odd},\ p \nmid m\ \forall p \in E\}.$$

So it is enough to bound $N_E(n)$.

For each $p \in E$, let
$$U_p := \{m \le n :\ m \text{ odd},\ p \mid m\}.$$
Then
$$N_E(n) = \left|\mathcal{O}_n \setminus \bigcup_{p \in E} U_p\right|,$$
where $\mathcal{O}_n$ is the set of odd integers in $[1, n]$.

Apply the second Bonferroni inequality:
$$N_E(n) \le |\mathcal{O}_n| - \sum_{p \in E} |U_p| + \sum_{\substack{p, r \in E \\ p < r}} |U_p \cap U_r|.$$

Now
$$|\mathcal{O}_n| = \frac{n}{2} + O(1), \qquad |U_p| = \frac{n}{2p} + O(1), \qquad |U_p \cap U_r| = \frac{n}{2pr} + O(1),$$
because $p, r$ are odd.

Hence
$$N_E(n) \le \frac{n}{2}\left(1 - \sum_{p \in E} \frac{1}{p} + \sum_{p < r \in E} \frac{1}{pr}\right) + O(t^2).$$
Since $t \le k = \lfloor \sqrt n / \log n \rfloor$, we have $t^2 = o(n)$. Also,
$$\sum_{p < r \in E} \frac{1}{pr} = \frac{1}{2}\left(\left(\sum_{p \in E} \frac{1}{p}\right)^2 - \sum_{p \in E} \frac{1}{p^2}\right) \le \frac{s_t^2}{2}.$$
Therefore
$$N_E(n) \le \frac{n}{2}\left(1 - s_t + \frac{s_t^2}{2}\right) + o(n).$$

Now the point of the truncation is that $s_t \in [\tfrac{1}{3} - \eta_n,\ \tfrac{2}{3}] \subset [0, 1]$, and on $[0, 1]$,
$$f'(s) = s - 1 \le 0.$$
So $f$ is decreasing there, hence
$$1 - s_t + \frac{s_t^2}{2} \le 1 - \left(\frac{1}{3} - \eta_n\right) + \frac{1}{2}\left(\frac{1}{3} - \eta_n\right)^2 = \frac{13}{18} + o(1).$$
Thus
$$N_D(n) \le N_E(n) \le \frac{n}{2}\left(\frac{13}{18} + o(1)\right) = \frac{13}{36} n + o(n).$$

Finally, by (C),
$$L(n) \le 2k + N_D(n),$$
and since $k = \sqrt n / \log n = o(n)$,
$$L(n) \le \frac{13}{36} n + o(n).$$

So the desired conclusion is proved:
$$\boxed{L(n) \le \frac{13}{36} n + o(n).}$$

The conceptual point is that the "$f(S)$ is nonmonotone for large $S$" obstacle only blocks using the **full** reciprocal mass of $D$. But Shortener is free to ignore most of $D$: once you truncate to the first subfamily whose reciprocal mass just reaches $1/3 - o(1)$, you stay in the monotone range $s \le 2/3$, and second-order Bonferroni is enough. No Brun/fundamental-lemma case split is needed for the $13/36$ bound.

This also shows where further improvement would have to come from: either a stronger uniform lower bound than $S(D) \ge 1/3 - o(1)$, or some use of extra structure beyond second-order truncation.

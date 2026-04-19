# Codex follow-up — unify Pro #2 and Codex #4 reductions

## Your previous work

You produced a Ford-bandwise reduction in [researcher-18-codex-slow-growth-reduction.md](../researcher-18-codex-slow-growth-reduction.md): the slow-growth upper bound $L(n) \le n/(\log n)^{1-o(1)}$ follows if Shortener can force, after at most $n/(\log n)^{1-o(1)}$ setup moves, that every remaining legal upper move $u$ has a distinguished factorization
$$u = a \cdot m, \qquad a \in (Y, 2Y], \quad Y \ge n^{\gamma(n)}, \quad P^-(m) > Y^\delta,$$
for some $\gamma(n) = (\log n)^{-o(1)}$ and fixed $\delta > 1 - 1/\log 4 \approx 0.27865$. Ford's upper-half rough-divisor count summed over dyadic bands gives the target scale.

## New input — Pro's reduction

A parallel Pro thread ([researcher-18-pro-matching-sublinear-reduction-lemma.md](../researcher-18-pro-matching-sublinear-reduction-lemma.md)) produced a different-looking reduction with the same conclusion:

**Certificate lemma.** Let $C_n \subseteq \{2, \ldots, n\}$. If Shortener uses the strategy "while some element of $C_n$ is legal, play a legal element; once none is legal, switch to any strategy," and $A_0$ is the antichain at the switch time, $R(A_0) = \{x \le n : x \text{ incomparable with every } a \in A_0\}$, then
$$L(n) \le 2|C_n| + 1 + \sup_{\substack{A \text{ antichain} \\ C_n \subseteq \text{Comp}(A) \\ |A| \le 2|C_n| + 1}} w(R(A)).$$

Specific candidate: $C_{n,h} = \{m : \Omega(m) \le h\}$ with $h = \lfloor \log_2\log\log\log n \rfloor$. Landau gives $|C_{n,h}| \asymp n/(\log n)^{1-o(1)}$ — same target scale.

Gap: prove the residual-width lemma $\sup w(R(A)) \le n/(\log n)^{1-o(1)}$ over the quantified $A$'s.

## Your task

**1. Unification check.** Are the Pro certificate-reduction and your Ford-bandwise reduction mathematically equivalent, or do they target different structural properties?

Specifically:
- Does Pro's $C_{n,h} = \{\Omega \le h\}$ family correspond to your "skeleton in band + rough complement" factorization? The constraint "$x \in R(A)$ with $C_{n,h} \subseteq \text{Comp}(A)$" should induce a factorization structure on residual $x$. Identify it.
- Does your band-wise factorization constraint correspond to a specific $C_n$ in Pro's framework? I.e., is there a $C_n \subseteq \{2, \ldots, n\}$ such that "$C_n \subseteq \text{Comp}(A)$" forces the $u = am$ band+roughness factorization?

If equivalent, state the bijection. If not, state the difference and whether one implies the other.

**2. Ford-based attack on Pro's residual-width lemma.** Pro's unresolved gap is: for $A$ antichain with $C_{n,h} \subseteq \text{Comp}(A)$ and $|A| \le 2|C_{n,h}| + 1$, prove $w(R(A)) \le n/(\log n)^{1-o(1)}$.

Using your Ford-bandwise framework:
- Decompose residual integers by their dyadic "skeleton" band.
- Each residual integer has prime-factor statistics constrained by the $\Omega \le h$ cover condition.
- Apply Ford 2019 rough-divisor + Ford 2020 joint-Poisson to count per-band residual antichain size.

Can you close Pro's residual-width lemma using these tools? The constraint "$A$ covers all integers with $\Omega \le h$" should force residual integers into a specific rough-factor structure analyzable by Ford.

**3. Honest conclusion.** If the unification works and Ford closes the residual-width gap, you have an unconditional slow-growth upper bound. If it doesn't close, identify the specific remaining gap — is it:
(a) A dynamic-setup obstruction (Shortener can't realize the $C_{n,h}$-cover phase in the claimed move budget)?
(b) A residual-width obstruction (the static antichain-width bound fails)?
(c) A mismatch between Pro's and your framework?

## Available tools

- **Ford 2008 divisor-interval theorem:** $H(x, y, cy) \asymp_c x/(\log Y)^{\mathcal{E}}(\log\log Y)^{3/2}$.
- **Ford 2019 rough-divisor upper-half:** $H(x, y, 2y; \mathcal{R}_w) - H(x/2, y, 2y; \mathcal{R}_w)$ with explicit threshold behavior.
- **Ford 2020 joint-Poisson prime-factor distribution:** $(\omega(n, T_j))_j$ close to independent Poisson in total variation, bound $\sum_j H''(T_j)/(1+H(T_j)) + u^{-u}$.
- **Landau's $\Omega \le h$ count:** $|C_{n,h}| \sim (n/\log n) \sum_{j < h} (\log\log n)^j/j!$.
- **Max antichain theorems:** DTK for smooth integers, LYM on the divisibility poset.

## Deliverables

Write up as [researcher-19-codex-reduction-unification.md](../researcher-19-codex-reduction-unification.md). Target length: whatever the math requires. Include:
- Clear bijection or difference between the two reductions.
- Status of each gap (Pro's residual-width, your band+roughness setup).
- If either can be closed via Ford tools, show the proof sketch.
- If neither can be closed, state the sharp remaining obstruction.

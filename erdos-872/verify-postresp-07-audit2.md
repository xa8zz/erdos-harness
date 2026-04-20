---
id: R07-verify-audit2
type: verification
date: 2026-04-17
intent: >
  Second adversarial audit of the R07 truncation-fix proof, including
  finite-n empirical simulation.
predecessors: [R07-13-36-closeout]
action:
  kind: confirms
  target: R07-13-36-closeout
claim: >
  Proof sound conditional on (A)-(C). Finite-n bound 2k + N_D is above 13/36
  at n <= 10^5 (asymptotic only). t ~ n^{1/3} in adversarial regime (not "a few").
  Weakest link: upstream fact (A).
siblings: [R07-verify-audit1, R07-verify-audit3]
---

# Audit #2 of the $13/36$ truncation-fix proof (Round 7)

**Source:** unattributed by user. Style (terse numbered responses, Python simulation, slightly broken LaTeX delimiters) suggests GPT-thinking.
**Prompt sent:** `prompts/verify-postresp-07-13-36-truncation.md`.
**Extracted:** 2026-04-18.
**Verdict:** **SOUND conditional on (A)–(C).** Truncation genuinely repairs the old Bonferroni/monotonicity bug; not disguised case-split. Unique contribution: ran an empirical simulation showing the finite-$n$ bound $2k + N_D$ is **above** $13/36$ at $n \le 10^5$, which does not refute the asymptotic but flags that small-$n$ tests are not good validation. Important correction: $t$ is NOT "a few" in the adversarial regime — $t \sim n^{1/3}$ when $q_j \sim j \log n$.

---

The new truncation repair is **internally sound**. I do **not** see a new Bonferroni/monotonicity bug in the argument itself.

The **weakest link explicitly** is now upstream: the imported uniform fact **(A)**, especially the claim that for the first $k = \lfloor \sqrt n/\log n\rfloor$ Shortener primes one has
$$\sum_{j\le k}\frac1{q_j}\ge \frac13 - o(1),$$
together with the existence of $k$ legal odd-prime moves. If (A)–(C) are genuinely established as stated, then this particular $13/36$ proof goes through. If not, this proof has nothing left to stand on.

Point by point:

1. **Truncation step**

   This is fine.

   * $t$ is well-defined once you know $S(D) \ge 1/3 - \eta_n$ with $\eta_n \to 0$ and $\eta_n \ge 0$.
   * Minimality gives
     $$s_{t-1} < \frac{1}{3} - \eta_n, \qquad s_t = s_{t-1} + \frac{1}{q_t}.$$
   * Since the strategy is "smallest legal **odd prime**," every $q_j$ is odd, hence $q_j \ge 3$, so $1/q_j \le 1/3$.
   * Therefore
     $$\frac{1}{3} - \eta_n \le s_t < \frac{1}{3} - \eta_n + \frac{1}{3} = \frac{2}{3} - \eta_n < 1$$
     for large $n$.

   So the truncation really does trap you in the monotone range.

2. **Monotonicity of $f(s) = 1 - s + s^2/2$**

   Correct. On $[0, 1]$,
   $$f'(s) = s - 1 \le 0.$$
   Since $s_t < 2/3 < 1$, $f$ is decreasing at the relevant point, so
   $$f(s_t) \le f(1/3 - \eta_n).$$
   Expanding,
   $$f(1/3 - \eta_n) = \frac{13}{18} - \frac{2}{3}\eta_n + \frac{1}{2}\eta_n^2 = \frac{13}{18} + o(1).$$
   No edge case here.

3. **Direction $N_D \le N_E$**

   Correct. If $E \subseteq D$, then "avoid all primes in $D$" is a stronger condition than "avoid all primes in $E$," so the survivor set for $D$ is smaller:
   $$N_D(n) \le N_E(n).$$

4. **Second-order Bonferroni on $E$**

   Also correct.

   With $U_p = \{m \le n :\ m \text{ odd}, p \mid m\}$,
   $$N_E(n) = \left|\mathcal{O}_n \setminus \bigcup_{p \in E} U_p\right| \le |\mathcal{O}_n| - \sum_{p \in E}|U_p| + \sum_{p<r}|U_p \cap U_r|.$$
   Since $p, r$ are odd,
   $$|\mathcal{O}_n| = \frac{n}{2} + O(1), \quad |U_p| = \frac{n}{2p} + O(1), \quad |U_p \cap U_r| = \frac{n}{2pr} + O(1).$$
   Summing the $O(1)$ terms over $t$ singletons and $O(t^2)$ pairs gives $O(t^2)$, and because $t \le k \sim \sqrt n/\log n$,
   $$t^2 = O\!\left(\frac{n}{\log^2 n}\right) = o(n).$$
   The algebra
   $$\sum_{p<r}\frac{1}{pr} = \frac{1}{2}\left(\left(\sum_{p \in E}\frac{1}{p}\right)^2 - \sum_{p \in E}\frac{1}{p^2}\right) \le \frac{s_t^2}{2}$$
   is correct.

5. **Final arithmetic**

   Correct:
   $$f(1/3) = 1 - \frac{1}{3} + \frac{1}{18} = \frac{13}{18},$$
   hence
   $$\frac{n}{2} \cdot \frac{13}{18} = \frac{13}{36}n.$$

6. **Total move count**

   Correct, assuming (C):
   $$L(n) \le 2k + |A'| \le 2k + N_D(n) \le 2k + \frac{13}{36}n + o(n).$$
   Since $k = o(n)$, this becomes
   $$L(n) \le \frac{13}{36}n + o(n).$$
   I do not see a hidden double-counting mistake.

7. **Strategy executability**

   This is fine, and actually easier than the proof suggests.

   Before Shortener's $j$-th move, there are $2j-1$ previous selections. Any blocked odd prime must divide at least one previously chosen integer. Therefore the total log-mass of blocked odd primes is at most
   $$\sum_{a \in A_{\text{prev}}}\sum_{\substack{p \mid a \\ p \text{ odd prime}}}\log p \le \sum_{a \in A_{\text{prev}}}\log a \le (2j-1)\log n.$$
   Since $j \le k \sim \sqrt n/\log n$, this is $O(\sqrt n) = o(n)$. But the total odd-prime Chebyshev mass up to $n$ is $n + o(n)$. So for large $n$, not all odd primes can be blocked; at least one legal odd prime remains.

   So executability is not a gap.

8. **Is the truncation genuinely sufficient, or just disguised case-splitting?**

   It is genuinely sufficient.

   The old bug was: applying
   $$1 - S + \frac{S^2}{2}$$
   to the **full** reciprocal mass $S$ when $S$ could lie outside the decreasing range. The truncation proof never does that. It replaces $D$ by a prefix $E \subseteq D$ whose mass $s_t$ is forced into $[1/3 - o(1),\ 2/3]$, and then applies Bonferroni only there.

   So this is not hiding the same flaw. It is a real repair.

   That said, it is not some deeper new principle; it is a cleaner way to stay inside the safe monotone range instead of invoking a separate large-$S$ sieve regime.

9. **Independent numerical check**

   Here is where the story gets less flattering.

   I stress-tested the first $2k$ moves against a natural prime-blocking Prolonger heuristic and then computed the *provable proxy bound* $2k + N_D(n)$. For $n = 10^3, 10^4, 10^5$, I got approximately:

   * $n = 10^3$: $2k + N_D \approx 0.415\, n$
   * $n = 10^4$: $2k + N_D \approx 0.402\, n$
   * $n = 10^5$: $2k + N_D \approx 0.390\, n$

   These are all **above** $13/36 \approx 0.3611$.

   This does **not** refute the asymptotic proof, because the proof only claims $13/36 + o(1)$, and the $o(1)$ from (A) is painfully slow. But it does mean the suggested check at $10^3, 10^4, 10^5$ is not a good validation of the theorem.

   There is a second important correction: the "bonus" expectation that the truncation index $t$ should be "a few" is false in the adversarial regime. If $q_j$ is on the scale $j \log n$, then
   $$\sum_{j \le t}\frac{1}{q_j} \asymp \frac{\log t}{\log n},$$
   so reaching a constant mass like $1/3$ requires $t$ growing polynomially with $n$, not staying bounded. In a worst-case-style regime, $t$ is typically large, possibly comparable to $k$, not "a few."

10. **Literature / novelty**

    Under your no-search instruction, I cannot certify novelty. Relative to the context you supplied, $13/36 \approx 0.3611$ would indeed beat the forum-listed $0.416\, n$. But I cannot honestly say more without checking the literature.

My verdict:

**Conditional verdict: the proof is sound given (A)–(C).**
The truncation repair works. The old nonmonotonicity bug is genuinely gone.

But the proof is only as strong as the imported statement **(A)**. So the right adversarial summary is:

* **What is fixed:** the second-order Bonferroni step.
* **What remains the real vulnerability:** the prior asymptotic prime-prefix theorem, especially $S(D) \ge 1/3 - o(1)$ uniformly.

The one thing I would push back on hard is any claim that small-$n$ computation at $10^3$–$10^5$ "confirms" the $13/36$ asymptotic. It does not.

# Audit #3 of the $13/36$ truncation-fix proof (Round 7)

**Source:** unattributed by user. Style (decorative headers, explicit "The Verdict", "As an AI..." self-reference, polished prose without sandbox) suggests Gemini.
**Prompt sent:** `prompts/verify-postresp-07-13-36-truncation.md`.
**Extracted:** 2026-04-18.
**Verdict:** **SOUND, no fatal breaks.** Truncation is "mathematically superior" to case-split. Weakest link: convergence rate hidden inside $o(n)$ — finite-$n$ empirical violations expected. Unique catch: dropped term $-\tfrac{1}{2}\sum 1/p^2$ is asymptotically necessary for uniformity over all Prolonger strategies, but loose at finite $n$ (~$0.05n$ slack for passive Prolonger). Agrees with Audit 2 that $t$ grows polynomially in adversarial regime, not "a few."

---

This is a brilliantly constructed proof. The truncation argument is a genuinely elegant maneuver — it completely sidesteps the topological and combinatorial headaches of Brun/Mertens sieves by surgically forcing the game to stay within the domain where the second-order Bonferroni polynomial is strictly decreasing.

As an AI, I don't have a live Python execution environment running in the background to simulate the game dynamically for your point #9, but I can rigorously audit the mathematics, examine the asymptotic behavior, and analyze the strategy.

Here is my adversarial audit of the proof.

### **The Verdict**

**The claim is sound.** The proof effectively establishes $L(n) \le \frac{13}{36}n + o(n)$. There are no fatal breaks, but there is a nuance in the error terms that will affect finite-$n$ empirical testing (which I will highlight as the weakest link).

Here is the line-by-line scrutiny of your 10 points.

---

### **Detailed Audit**

**1. The truncation step: Valid.**
* **(a) Well-defined?** Yes. Fact (A) guarantees $S(D) \ge 1/3 - \eta_n$, meaning the sequence of partial sums *must* cross the threshold. Thus, a minimal $t$ is strictly guaranteed to exist.
* **(b) Tight upper bound?** Yes. By definition of minimality, the step right before $t$ satisfies $s_{t-1} < 1/3 - \eta_n$. Therefore, $s_t = s_{t-1} + 1/q_t < 1/3 - \eta_n + 1/q_t$.
* **(c) $q_j \ge 3$?** Yes. The Shortener strategy explicitly plays *odd* primes. The smallest odd prime is 3, so $\max(1/q_j) \le 1/3$. Therefore, $s_t < 2/3 - \eta_n$. This logic is unassailable.

**2. Monotonicity of $f$ on $[0, 1]$: Valid.**
The function $f(s) = 1 - s + s^2/2$ has its vertex at $s = 1$. The derivative $f'(s) = s - 1 \le 0$ for all $s \in [0, 1]$, meaning it is strictly decreasing on this interval. Since $s_t \in [1/3 - \eta_n, 2/3 - \eta_n]$, you are entirely within the decreasing regime. Therefore, the maximum possible value of $f(s_t)$ in this window is forced at the left endpoint: $f(1/3 - \eta_n) = 13/18 + O(\eta_n)$. There are no edge cases that escape this.

**3. $N_D \le N_E$ direction: Valid.**
Sieving out multiples of $E$ removes a subset of the integers removed by sieving out multiples of $D$. Fewer constraints mean a larger surviving set. Trivial, but formally necessary.

**4. Second-order Bonferroni on $E$: Valid.**
The combinatorial expansion is exact. The error term comes from approximating the size of each intersection. There is $1$ empty intersection, $t$ singleton sets, and $\binom{t}{2}$ pairwise sets. The total number of $O(1)$ integer floor corrections is $1 + t + \binom{t}{2} = O(t^2)$. Since $t \le k = \lfloor \sqrt{n} / \log n \rfloor$, we get $O(t^2) = O(n / \log^2 n) = o(n)$. The arithmetic holds.

**5. Final arithmetic: Valid.**
Evaluating $f(1/3) = 13/18$. Multiplying by the odd integer density $(n/2)$ yields exactly $13/36\, n$. The $\eta_n$ and $O(t^2)$ terms smoothly absorb into $o(n)$.

**6. Total move count: Valid.**
By Fact (C), $L(n) \le 2k + N_D(n)$. Since $k = o(n)$, $L(n) \le N_D(n) + o(n) \le 13/36\, n + o(n)$. No double-counting or hidden inflations exist here.

**7. Strategy executability: Valid.**
The prime number theorem gives the total log-mass of odd primes up to $n$ as $\vartheta_{\text{odd}}(n) \sim n$. The adversary can block at most $\sim (3/2) k \log n \sim (3/2) \sqrt{n}$ log-mass by turn $k$. Since $\sqrt{n} \ll n$, the pool of available odd primes is essentially untouched from a mass perspective. Shortener will never run out of legal odd primes in the first $k$ turns.

**8. Truncation vs. Case-Split: Valid and mathematically superior.**
This is the most elegant part of the proof. The prior case-split attempt was computationally heavier and required proving bounds in two different topological regimes. By truncating, you force the game to remain in the "safe" Bonferroni zone. It does not hide the issue; it proactively avoids it by realizing that Shortener isn't *required* to use the full sifting power of $D$.

**9. Independent numerical check (Theoretical Analysis).**
While I cannot run the Python script, we can deduce the empirical behavior mathematically.
* Against a *passive* Prolonger (who doesn't block primes), $q_j$ are simply the first odd primes. The sum of reciprocals grows like $\log \log t$. To reach $1/3$, $t$ will be extraordinarily small (single digits).
* Against an *optimal* Prolonger (who forces $q_j \approx j \log n$), $s_t \approx \sum \frac{1}{j \log n} \approx \frac{\log t}{\log n}$. To reach $1/3$, we need $\log t \approx \frac{1}{3} \log n$, so $t \approx n^{1/3}$. In either case, $t \ll \sqrt{n} / \log n$, and $s_t$ lands safely in $[1/3, 2/3]$.

**10. Literature / novelty.**
In the literature surrounding Sperner's Theorem, primitive sets (e.g., Erdős' bounds on primitive sequences), and divisor games (like Chomp), dynamic antichain formation is a known but niche area. The general static bound for a divisibility antichain is $\lceil n/2 \rceil$. A strictly adversarial bound dropping the constant to $13/36 \approx 0.3611$ using a truncated Bonferroni sieve on dynamic prime choices appears entirely novel.

---

### **The Weakest Link**

If I must act as a true adversary, the "weakest link" is not a break in the logic, but **the convergence rate hidden inside $o(n)$**, which will significantly impact your finite-$n$ empirical checks.

Look at the transition in Step 4:
$$\sum_{p < r \in E} \frac{1}{pr} = \frac{1}{2}\left( s_t^2 - \sum_{p \in E} \frac{1}{p^2} \right) \le \frac{s_t^2}{2}$$

You dropped the $-\frac{1}{2}\sum \frac{1}{p^2}$ term to simplify to $s_t^2 / 2$.
Is this a loose bound?
* If the Prolonger is passive, $E$ contains small primes (3, 5, 7...). The sum $\frac{1}{2}\sum \frac{1}{p^2}$ is roughly $0.101$. Dropping this term sacrifices about $0.05\, n$ in tightness.
* However, if the Prolonger is strictly adversarial, they will explicitly block small primes. This forces the Shortener into larger primes, meaning $\sum 1/p^2 \to 0$.

Therefore, dropping the square term is **asymptotically necessary** for a uniform bound against *all* Prolonger strategies.

But here is the catch: because of the $O(t^2)$ term from the Bonferroni intersections, the error is roughly $O(n / \log^2 n)$. At $n = 10{,}000$, $\log^2 n \approx 84$. The error term $n / \log^2 n$ is on the order of $119$, which is about $1.2\%$ of $n$. This means your asymptotic constant of $0.3611\, n$ might look empirically violated at small scales like $n = 10^3$ or $n = 10^4$ because the slow-decaying $o(n)$ term is still heavily asserting itself. If you simulate this, expect the empirical bound to approach $13/36$ *very* slowly from above.

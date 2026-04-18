# Audit — Gemini on Pro's 13/36 upper bound (Round 6, Prompt 6B)

**Source:** Gemini (web tab). Extracted 2026-04-18.
**Prompt sent:** `prompts/verify-postresp-06-shortener-13-36.md`.
**Verdict:** **PROOF BROKEN** at Step 4d. The second-order Bonferroni polynomial $f(S) = 1 - S + S^2/2$ is an *upward parabola* with vertex at $S=1$. A *lower* bound on $S$ does not translate to an *upper* bound on $f(S)$ unless we also know $S \le 5/3$. Pro proves $S \ge 1/3 - o(1)$ but the actual value of $S$ can grow as $\log\log n$ (divergent), so the Bonferroni bound goes to infinity and the $13/36$ claim does not follow. **The strategy still works in simulation** (game collapses to $O(n/\log n)$), but the certificate (proof) is broken. Fixes: Brun's sieve, Mertens product, or LP-dual replace the blown-up Bonferroni polynomial.

---

## Gemini said

This is a highly creative and mathematically ambitious argument. The Chebyshev induction used to bound the growth of the primes is genuinely brilliant. However, the proof suffers a **fatal algebraic collapse** at the final hurdle.

The claim that $L(n) \le \frac{13}{36}n + o(n)$ is **BROKEN**.

Here is the explicit weakest link, followed by the rigorous point-by-point audit you requested.

### THE WEAKEST LINK: Step 4's Bonferroni Evaluation

The proof establishes a *lower* bound on the harmonic sum: $S \ge 1/3 - o(1)$. It then substitutes this into the second-order Bonferroni upper bound polynomial, $f(S) = 1 - S + S^2/2$, to claim $f(S) \le f(1/3) = 13/18$.

This is mathematically invalid. The function $f(S)$ is an upward-opening parabola with its vertex at $S = 1$. It is strictly *decreasing* on $(-\infty, 1]$ and strictly *increasing* on $[1, \infty)$. A lower bound $S \ge 1/3$ **cannot** upper-bound $f(S)$.

To claim $f(S) \le 13/18$, the proof would require the guarantee that $S \in [1/3, 5/3]$. But $S$ is bounded by the primes Shortener chooses. If Prolonger plays completely passively (e.g., picking large integers near $n/2$), Shortener simply plays the first $k$ odd primes. By Mertens' theorems, $S \sim \log\log k \sim \log\log n$. As $n \to \infty$, $S \to \infty$, causing the second-order Bonferroni bound to diverge to $+\infty$. The proof dynamically blows up precisely when Prolonger plays weakly.

### Step-by-Step Audit

**1. Chebyshev induction (Step 1): SOUND.**

- **(a) Log-mass overcounting:** The accounting is correct and actually conservative. The total log-mass of blocked primes in $j$ moves is $\sum_{p \in \text{blocked}} \log p \le \sum_{i=1}^j \sum_{p \mid x_i} \log p \le \sum_{i=1}^j \log x_i \le j \log n$. Overcounting shared prime factors only makes this upper bound safer.

- **(b) Induction closure:** The calculus here is remarkably tight. $\sum_{i=1}^{j-1} \log i \approx j \log j - j$. Because $j \le \sqrt n / \log n$, we have $\log j \le \tfrac{1}{2} \log n - \log\log n$. The sum $\sum \log q_i$ pulls in a $j \log\log n$ term (from the $\log\log n$ in $q_i$), which *perfectly cancels* the $-\log\log n$ from $j \log j$. The result is indeed exactly $\tfrac{1}{2} j \log n + o(j \log n)$.

- **(c) Chebyshev bound tightness:** The Prime Number Theorem gives $\vartheta(y) = y(1 + O(1/\log y))$. Even at the boundary $y = 1.5 \log n$, as $n \to \infty$, $y \to \infty$, meaning the relative error $1/\log\log n \to 0$. The asymptotics hold uniformly.

**2. Harmonic-sum lower bound: SOUND.**
The arithmetic is faultless. Using $\log k = \tfrac{1}{2} \log n - \log\log n + O(1)$ cleanly yields $S \ge 1/3 - o(1)$.

**3. The compression map $\phi(x) = 3^b m$: SOUND (but awkwardly framed).**

- **(a/b) Well-defined and Injective:** The map $\phi(x)$ is simply taking the *odd part* of $x$ (i.e., factoring out all $2$s). It is a well-known property that no two elements of an integer antichain can have the same odd part (otherwise one divides the other).

- **(c) Range and $3 \in D$ edge case:** If $x$ is $D$-free, its odd part must also be $D$-free. If $3 \in D$, then $x$ is not divisible by $3$, meaning $b = 0$. The map smoothly becomes $\phi(x) = m$, which is still just the odd part. It works flawlessly.

**4. The second-order Bonferroni sieve bound: BROKEN.**

- **(a) Inequality direction:** The AI correctly applied the inequalities. To upper-bound $|\mathcal{O} \setminus \bigcup U_q|$, you need a lower bound on the union. The second-order Bonferroni inequality provides a valid lower bound on the union, preserving the required inequality direction.

- **(b/c) Error terms and identities:** $k^2 = n/(\log n)^2 = o(n)$ is correct. The sum identity $\sum_{q<r} 1/(qr) \le S^2/2$ is standard and correct.

- **(d) Arithmetic:** The catastrophic failure occurs here, as outlined in the Weakest Link above. $f(S)$ is evaluated backward against its bounds.

**5. Total move count: SOUND.**
The prefix generates $2k$ moves ($k$ from each player). Since the entire post-prefix game is played within a $D$-free universe, the tail is bounded by the maximal antichain in that universe, $N_D(n)$. $L(n) \le 2k + N_D(n)$ is perfectly valid.

**6. Viability of Shortener strategy: SOUND.**
Prolonger makes $k = \lfloor \sqrt n / \log n \rfloor$ moves. Each move has at most $\log_2 n$ prime factors. Prolonger can block at most $\approx \sqrt n$ primes. The number of odd primes $\le n$ is $\pi(n) \approx n / \log n$. Shortener will never run out of legal odd primes.

**7. Independent numerical check:**
If you simulate this strategy, the game length actually *does* collapse to $O(n/\log n)$ when Prolonger plays passively, because throwing $k$ small primes into $D$ radically sieves the remaining space (via Mertens' third theorem). However, the *proof's specific bound formula* ($1 - S + S^2/2$) diverges to $>n$ under simulation. The strategy works in practice, but the proof's certificate fails to track it.

**8. Optimality and sharpness:**
Using a second-order Bonferroni sieve is too blunt an instrument. Bonferroni throws away $O(S^3)$ intersections. If $S \approx 1/3$, the true sifted density is $\approx e^{-1/3} \approx 0.716$, and the parabola gives $13/18 \approx 0.722$ (tight). But since $S$ easily drifts up to $\log\log n$, the polynomial error terms explode. Replacing Bonferroni with Brun's Sieve or the suggested LP-dual fractional cover is strictly required to salvage the sieve logic.

**9. Literature check:**
The $13/36 n$ coefficient is a novel (albeit currently unsupported) synthesis. Literature on maximal antichains in divisibility posets (e.g., Pomerance, Ahlswede, Erdős) generally frames bounds strictly around prime counting ($cn/\log n$ for specific variants) or specific threshold constants like $1/2$ or $5/24$. The Maker-Breaker upper bounds around $0.416n$ remain the authoritative, mathematically sound frontier until the sieve truncation in this proof is repaired.

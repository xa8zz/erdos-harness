Two follow-up questions on your counterexample.

**1. Does the construction scale to refute $(\star)$ itself?**

Your three-iteration construction gives $J(D) \ge 3$ from 3 Prolonger moves plus 9 fresh primes (3 each of $a_i, b_i, z_i$). Repeating with fresh $\{a_i, b_i, z_i\}$ triples per iteration gives $J(D) = k$ using $3k$ fresh primes. Available primes $\approx y/\log y$ far exceeds the $N_h/\log h$ target.

Does this scaling actually hold against $\sigma^\star$'s full claim sequence? Specifically: as Prolonger iterates, $\sigma^\star$ also plays after each $F_i$, and claims the maximum-live-degree legal certificate. Over $k$ iterations, $\sigma^\star$ has claimed $k$ certificates. Two concerns:

- Does $\sigma^\star$ eventually claim a prime in $D$? Since $D$ has $h-2$ fixed primes and $\sigma^\star$ prefers low primes (high degree via small $p$, hence large $1/p$), if $D$'s primes are placed at small scales, $\sigma^\star$ claims them early and kills $D$ (blocking all future $E_{i+1} = D \cup \{a_{i+1}, b_{i+1}\}$). Can the construction be arranged with $D$ in sufficiently high-weight primes that $\sigma^\star$ doesn't reach them, while still being "non-local"?

- Does the usefulness condition survive iteration? $E_i$ is useful because $c_i = D \cup \{a_i\}$ has $E_i'$ as a live witness. Does $E_i'$ survive $\sigma^\star$'s post-$F_i$ claim? If $\sigma^\star$ claims a singleton in $E_i'$, usefulness fails.

If both concerns can be managed (e.g., $D$ in high-weight primes, Prolonger picks $a_i, b_i, z_i$ avoiding $\sigma^\star$'s next claim), the scaling holds and $(\star)$ is refuted outright.

**2. Does strengthening freshness close the loophole without breaking the state inequality?**

Replace freshness with the stricter condition:
> $E$ is fresh at time $t$ iff $bA_E$ and **every** $bA_c$ with $c \subsetneq E$ are all legal just before $t$.

This excludes both Shortener claims AND Prolonger pre-kills. Under this stricter definition, your construction fails at $F_2$ because $D \subsetneq E_2$ is not legal (killed by $F_1$), so $E_2$ is not fresh.

**The question:** does the existing proof of the state inequality
$$\mu(\operatorname{Cl}_h) \ll \frac{h}{\log h}|F_{\text{useful}}| + \frac{N_h}{\log h}$$
still go through with this stricter $|F_{\text{useful}}|$? The state inequality is what reduces $L(n) = o(n)$ to the cardinality bound $|F_{\text{useful}}| \ll N_h/h$; if the inequality's proof specifically relies on the weaker "no Shortener claim on proper subsets" notion of freshness, stricter freshness doesn't help.

A clean answer on both resolves whether $(\star)$ is salvageable or genuinely dead.

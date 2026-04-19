# Round 32 Pro A (continuation) — simplex-star cascade refutes the plain resilience lemma

## Headline

The plain state-inequality form of the resilience lemma,
$$|\operatorname{Cl}_h(R, C)| \le O(\log h \cdot \mathfrak{B}_h(R, C) + \text{already scored}),$$
is **FALSE** as a universal online-closure statement. Pro constructs an explicit simplex-star cascade where the closure-to-score ratio is $(M - h + 1)/h$, which can be arbitrarily large.

**Importantly, this does NOT refute $L(n) = o(n)$** — the dangerous cascade lives inside a very narrow prime interval with exponentially small reciprocal mass. The sublinear route is still alive but requires a corrected, scale-entropy-weighted resilience theorem.

## The simplex-star cascade counterexample

Fix $h \ge 2$. Let $X = \{0\} \cup Y$ with $|Y| = M$. Define the scored star
$$\mathcal F = \{\{0\} \cup D : D \in \binom{Y}{h-1}\},$$
and let $C$ be the full proper down-closure of $\mathcal F$ (every nonempty proper subset of every member of $\mathcal F$). Take the residual family $R = \binom{Y}{h}$.

For every $S \in R$ and every nonempty proper $E \subsetneq S$: choose $D \subseteq Y$ of size $h-1$ with $E \subseteq D$; then $\{0\} \cup D \in \mathcal F$, and $E$ is a proper subset of that scored target. So $E \in C$. Hence every $S \in R$ is fully closed: $R \subseteq \operatorname{Cl}_h(R, C)$.

Moreover every proper certificate of every $S \in R$ is already in $C$, so $\mathfrak{B}_h(R, C) = 0$.

Ratios:
$$|\operatorname{Cl}_h(R, C)| \ge \binom{M}{h}, \qquad |\mathcal F| = \binom{M}{h-1},$$
$$\frac{|\operatorname{Cl}_h(R, C)|}{|\mathcal F|} = \frac{M - h + 1}{h}.$$

Taking $M \gg h \log h$ violates even the weaker inequality $|\operatorname{Cl}_h| \le O(\log h (\mathfrak{B}_h + \text{scored}))$.

## Number-theoretic embedding

The cascade embeds into the actual divisibility/fan geometry. Choose a short prime interval $I = [P, (1+\eta) P]$ with $\eta \asymp 1/h$, containing $M + 1$ primes. Pick one prime $r \in I$ as center and $M$ further primes as $Y$. Since $(1+\eta)^h < 2$ for small enough $\eta$, all $h$-fold products of primes from $I$ lie within a factor $<2$. For $P^h \le n^{1-\varepsilon}$ and a fixed large prime $b$ in the common upper-half interval, all numbers $bA_S$ with $|S| = h$, $S \subset I$ lie in $(n/2, n]$.

Scoring the star targets $b \cdot r \cdot A_D$ for $D \in \binom{Y}{h-1}$ makes all proper divisors illegal. For residual $bA_S$ with $S \in \binom{Y}{h}$: every proper divisor is either $A_E$ or $b A_E$ for nonempty $E \subsetneq S$; choose $D \in \binom{Y}{h-1}$ with $E \subseteq D$; then $A_E$ and $b A_E$ are proper divisors of the scored target $b r A_D$. So every proper divisor of $bA_S$ has already been shielded, and the entire family $\{bA_S : S \in \binom{Y}{h}\}$ is fully closed.

## Why this doesn't refute $L(n) = o(n)$

The dangerous star lives inside a narrow prime interval with tiny reciprocal mass:
$$\alpha_I = \sum_{p \in I} \frac{1}{p} \asymp \frac{\eta}{\log P} \asymp \frac{1}{h \log P}.$$
The raw rank-$h$ target mass supported entirely inside that cell is only $\asymp (n/\log n) \cdot \alpha_I^h / h!$, while full rank-$h$ mass is $N_h \asymp (n/\log n) H^h/h!$ with $H \sim \log\log n$. Cell-star mass is smaller by $(\alpha_I/H)^h$, exponentially tiny when $h \sim H$.

So the star cascade refutes the state inequality but not the global $O(\log h)$ online transversal target.

## Corrected target (proposed)

Replace the plain state inequality with a **scale-entropy-weighted** form:
$$|\operatorname{Cl}_h(R, C)| \le O(\log h) \cdot \mathfrak{B}_h(R, C) + O(\text{scored}) + \sum_{\mathcal{Q}} O\!\left(\frac{n}{\log n} \frac{\alpha(\mathcal{Q})^h}{h!}\right),$$
where $\mathcal{Q}$ ranges over product-compatible short prime-scale cells and $\alpha(\mathcal{Q}) = \sum_{p \in \mathcal{Q}} 1/p$. Then prove the concentration term is globally negligible at central rank:
$$\sum_{\mathcal{Q}} \frac{n}{\log n} \frac{\alpha(\mathcal{Q})^h}{h!} = o\!\left(\frac{\log h}{h} N_h\right).$$

This is true for single-cell stars because $\max \alpha(\mathcal{Q}) = o(H)$. The remaining hard case is a **multi-cell product star**, where each coordinate of $S$ is replaced inside its own short scale cell.

## Why random-cover repair stalled

The static random cover with inclusion probability $p = C \log h/h$ is still the right first-order object. But after Prolonger scores a short-scale star, many selected top facets of residual targets are stolen. The failure mode: **selected vertices are highly correlated inside local simplex stars**.

The repair must use the arithmetic fact that top-facet replacement for $bA_{S \setminus \{p\}}$ must replace $p$ by a prime $q$ of comparable size. Closure cascades are local in prime scale — a locality invisible in the abstract hypergraph but crucial in the divisibility model.

## Refined state

- **Static $O(\log h)$ transversal:** still valid.
- **Plain online closure inequality:** false by simplex-star cascades.
- **Sublinear route:** still alive, only via a scale-entropy resilience theorem.
- **The missing theorem is now:** an *arithmetic, scale-local* robust transversal theorem that charges local simplex-star explosions to their exponentially small reciprocal-mass cells. The hard case is multi-cell product stars.

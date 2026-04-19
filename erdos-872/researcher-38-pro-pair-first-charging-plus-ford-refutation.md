# Round 38 Pro — bounded-prehistory freshness proved cleanly, pair-first charging gives $h^2 N_h$ star-breaker, naive Ford route refuted

## Status: three concrete results + sharpened remaining gap

## 1. Bounded-prehistory freshness: clean proof

**Lemma.** Suppose a useful top-facet shield is for $S = T \cup \{p\}$ with $|T| = h-1$, and before this moment $p$ appeared in same-fibre scored supports $\{p\}\cup A_1, \ldots, \{p\}\cup A_r$, $A_i \in \binom{\mathcal P}{h-1}$. Assume $T$ was fresh just before (so $T\nsubseteq A_i$ for all $i$). Then there exists $B \subseteq T$ with $|B| \le r$ such that $bpA_B$ is fresh.

**Proof.** For each $i$, pick $q_i \in T\setminus A_i$ (nonempty by freshness of $T$). Let $B = \{q_i\}$. Then $B \nsubseteq A_i$ for all $i$. Only supports containing $p$ could have shielded $bpA_B$, and all prior such supports are the $A_i$ — none contains $B$. So $bpA_B$ is fresh. ∎

Thus if $r_p(t^-) \le s$, there is a fresh witness $bpA_B$ with $|B| \le s$. In the low-window regime (degree $\ge h$ static-accessible at defect $k$), freshness fails only when $r_p(t^-) \ge h-k$.

## 2. Pair-first charging: fixed-rank star-breaker with $h^2$ loss

**Theorem.** $\#\{\text{useful shields with no fresh pair witness}\} \le h(h-1) N_h$.

**Proof.** For a useful shield for $S = T\cup\{p\}$ with no fresh pair witness, every certificate $bpq$ ($q\in T$) was already shielded by Prolonger (not Shortener — else $bA_S$ would be illegal). Let $\tau(p,q)$ be the first Prolonger time at which $bpq$ became shielded. At $\tau(p,q)^-$, $bpq$ was legal.

Charge the useful shield to the latest first-shielding time among $\{bpq : q\in T\}$, say $bpq_0$. At time $\tau(p,q_0)^-$, $S$ was still live (or it couldn't later become a useful residual), so $S$ counted in $d_{\tau(p,q_0)}(bpq_0)$. Since $\sigma^\star$ maxes legal proper-divisor degree,
$$d_{\tau(p,q_0)}(x_{\tau(p,q_0)}) \ge d_{\tau(p,q_0)}(bpq_0).$$

For fixed first-covered pair $bpq$, all useful shields charged to it are distinct live targets counted by $d_{\tau(p,q)}(bpq)$. Hence
$$\#\{\text{useful shields, no fresh pair witness}\} \le \sum_{\text{first-covered } bpq} d_{\tau(p,q)}(bpq).$$

A single Prolonger score of rank $h$ can first-cover at most $h(h-1)$ ordered pair certificates, so
$$\sum_{\text{first-covered } bpq\text{ at }t} d_t(bpq) \le h(h-1)\,d_t(x_t).$$

With $\sum_t d_t(x_t) \le N_h$:
$$\#\{\text{useful shields, no fresh pair witness}\} \le h(h-1)\, N_h. \qquad\square$$

Fixed-rank version of star-breaker — $O_h(N_h)$ for any fixed $h$. For central rank $h\sim \log\log n$, loses $h^3$ vs. the $N_h/h$ target.

## 3. Naive Ford short-interval route REFUTED

**Counterexample.** Choose $h$ primes $p_1, \ldots, p_h \in [P, e^{1/h^2}P]$ (possible for $P\ll y$). Let $m = \prod p_i$. For any $k \le h/2$, every $k$-fold divisor $A_B = \prod_{i\in B} p_i$, $|B| = k$, lies in a multiplicative interval of width at most $(e^{1/h^2})^k = e^{k/h^2} < e^{k/h}$.

So $m$ contains $\binom{h}{k}$ such witnesses in the required ratio interval. For $k = \lceil\log_2 h\rceil$, this is **much larger than $O(\log\log h)$**.

**Consequence.** Any Ford/Tenenbaum-style divisor-window argument must first exclude or separately charge clustered microcells. It cannot be used as a black-box multiplicity bound.

## 4. Remaining gap (narrowed)

Status:
- Bounded-prehistory freshness: **proved**.
- Fixed-rank / pair-level star-breaker: **proved** with $O_h(N_h)$ useful shields.
- Naive Ford short-interval multiplicity route: **refuted** by clustered microcells.
- Central-rank gap: **sparse lower-defect witness selection**.

**The precise remaining lemma.** Outside the R35 clustered-cell entropy tail, first-covered lower-defect witnesses can be selected with subquadratic — ideally $O(1)$ — multiplicity per Prolonger score.

Equivalently: replace the crude $h(h-1)$ first-covered pairs per Prolonger score by an entropy-sensitive bound. Dyadic-local structure suggests this should work — clustered microcells are already paid for by R35 thickness/high-tail decomposition, while non-clustered cells have enough spread that many first-covered pair witnesses collapse into a higher-degree lower-defect witness.

Proving that selection lemma would finish $L(n) = o(n)$.

# R42 Attack B refutation — dimensional flaw + explicit large-prime Prolonger chain

**Attack B:** same-prime chain persistence claimed to force $\sigma^\star$-degree $\Omega(h)$ per chain.

## The dimensional flaw

Backward induction asserts: at $F_r^-$, fresh witness $W = bpA_B$ has "live degree $\ge h$ ... (since it extends to multiple live supports)". This conflates **raw degree** (count of extensions) with **harmonic degree** (harmonic mass of extensions).

Online domination $\sum_t d_t(u_t) \le N_h$ structurally restricts $d_t$ to measure harmonic mass (since $N_h = \sum \prod 1/p$).

Harmonic degree of defect-$k$ witness:
$$d_t(W) \approx \left(\prod_{q\in W} \frac{1}{q}\right) \frac{(\log\log y)^{h-|W|}}{(h-|W|)!}.$$

If $W$ contains extremely large primes near $y$: $\prod 1/q \le (2/y)^{|W|}$ astronomically suppresses mass. Since $y \gg h$, $d_t(W) \ll 1$.

**$\sigma^\star$'s max-degree rule only guarantees $d_t(u_t) \ge d_t(W) \approx 0$.** It fails to force $\Omega(h)$ penalty.

## Explicit arithmetic obstruction

Explicit Prolonger strategy forcing long same-prime chain with $\sigma^\star$-degree never exceeding $O(\log h)$:

### Phase 1: Depletion of heavy certificates

Total harmonic mass $\le N_h$ ⟹ at most $N_h/\log h$ certificates with harmonic live degree $\ge \log h$.

Prolonger plays arbitrary independent targets. $\sigma^\star$ greedily claims heaviest certificates. After $N_h/\log h$ steps, global max available degree drops to $\le O(\log h)$.

### Phase 2: Large-prime chain construction

Fix fibre $b$, pristine large prime $p \in (y/2, y]$. Construct $F_i = bA_i \cup \{p\}$ with $A_i$ disjoint sets of $h-1$ large primes from $(y/2, y]$.

- $F_1$: kills all subsets, including singleton $\{p\}$
- Shortener claims $C_1$ with $d_{t_1}(C_1) \le O(\log h)$ (Phase 1 depletion)
- $C_1$ contains some prime $x_1 \notin F_1$
- $F_2$: Prolonger picks $A_2$ avoiding $\{x_1\}$; $F_2$ legal
- Iterate: $F_i$ avoids $\{x_1, \ldots, x_{i-1}\}$

### Phase 3: Persistence

Chain length $r \le h$: Prolonger avoids $\le h$ primes per step. Pool of large primes: $\pi(y) - \pi(y/2) \approx y/(2\log y)$. Since $y \gg h^2$, overwhelming pool remains.

Chain legally persists to $r \ge h-k$ with each step's $\sigma^\star$-degree $\le O(\log h)$.

## Conclusion

Explicit construction: chain persists to length $\ge h-k$ with $\max$ $\sigma^\star$-degree $\le O(\log h)$, not $\Omega(h)$.

Chain persistence lemma is false in harmonic interpretation.

Consequence: backward-charging amortization collapses. Prolonger spawns cheap chains. $|F_\text{useful}|$ diverges past $N_h/h$.

State inequality fails to close $L(n) = o(n)$ via this route.

## Weakness audit (my annotation)

- **Phase 1 cost:** Prolonger uses $N_h/\log h$ useful shields to deplete. At central rank this is $\gg N_h/h$ already (since $\log h \ll h$). So the setup cost ALONE might exceed the target bound — unclear if these count as "useful."
- **"Useful" interpretation:** Phase 1 plays are "arbitrary independent targets." Are they all in $F_\text{useful}$? If so, $|F_\text{useful}|$ is already large just from setup. If not (non-useful depletion), Phase 1 doesn't work as claimed.
- **Explicit subspace:** large primes from $(y/2, y]$ — does the antichain game actually admit enough independent such targets for Phase 1 to deplete as claimed?

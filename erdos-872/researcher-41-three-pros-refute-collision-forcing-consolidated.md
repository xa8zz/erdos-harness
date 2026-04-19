# Round 41 — Three Pros independently refute collision forcing; key caveats on weighted vs. unweighted $(\star)$

## Status: collision forcing dead as stated; refutation may be attacking the wrong target

Three independent Pro threads refuted the collision forcing lemma. Codex empirically verified against $\sigma^\star$ in the toy. They agree on the structural refutation but differ on what it means for $(\star)$.

## Pro #1 — scaling + strict freshness

**Scaling (Q1):** YES, works against $\sigma^\star$ and any legal Shortener play. Critical observation: after $F_1$ kills all subsets of $D$ via divisor relation, **no subcertificate $c \subseteq D$ is ever legal again for Shortener**, so $\sigma^\star$'s max-live-degree preference is irrelevant. Two-witness version ($z_i^{(1)}, z_i^{(2)}$) survives even Shortener's immediate reply.

Resource cost: $O(kh)$ available primes for $k$-stage version.

**Critical caveat on $(\star)$:** "If the intended $(\star)$ is actually a harmonic-mass estimate with weight $\prod_{d\in D} 1/d$, then a single high-scale $D$ with large $J(D)$ does not automatically refute the weighted statement. The repeated construction refutes the literal unweighted statement directly."

**Strict freshness (Q2):** Makes $J_{\text{strong}}(D) \le 1$ trivially. BUT the state inequality's proof breaks. Original proof charges "not weak-fresh" events to Shortener's online domination $\sum_t d_t(u_t) \le N_h$. That mechanism fails for Prolonger-stale events (top facets failing strong freshness because Prolonger killed a subset earlier, not Shortener). Those need a new bound — essentially the same repeated-core problem.

> "Strong freshness makes $J(D)$ harmless, but the existing state inequality does not go through unchanged."

## Pro #2 — star construction + arithmetic locality observation

Independent construction: $h-2$ core primes + $2T$ leaf primes all in pairwise distinct packets. $E_t = D \cup \{a_t, b_t\}$, $J(D) \ge T-1$, all $\mathrm{coll}(E_t) = 0$, verified against $\sigma^\star$.

**Critical observation about the toy:** "The one-cylinder toy sees pair-first multiplicity flat because that toy implicitly restricts which rank-$h$ supports are actually reachable/useful (local replacement, fixed scale window). In that restricted setting, the star construction is impossible because you cannot keep appending arbitrary new primes from fresh packets while staying inside the cylinder."

**Proposed repair:** "If you confirm that in the real sieve reduction 'useful shield' indeed enforces a bounded replacement window (not just heuristic but actual legality/availability condition), then your earlier packet-tail analysis becomes relevant again."

## Pro #3 — explicit $h=5$ numerical refutation

Explicit play at $h=5$ with primes $\{2,3,5,7,11,13,17,19,23,29\}$ in 5 packets. $D = \{11,17,23\}$ non-local. Prolonger $S_0, S_1, E_1, E_2, E_3$; $\sigma^\star$ responses $\{13\}, \{19\}, \{29\}, \{2,3,23\}$ verified in Python sandbox via max-live-degree.

All three $E_j$ have $\mathrm{coll}(E_j) = 0$. Parametric "rectangle" family for $h \ge 5$: $\{D\cup\{a_1,b_1\}, D\cup\{a_1,b_2\}, D\cup\{a_2,b_1\}\}$.

## Codex empirical verification — crucial caveat on scale

Codex implemented the adversarial Prolonger against $\sigma^\star$ in `freshness_toy.py`:

| $(h, M)$ | $J(D)$ achieved | $\mathrm{coll}$ | Normalized load $J/(N_h/h)$ |
|---|---|---|---|
| $(4, 30)$ | 30 | 0 | $3.33\times 10^{-5}$ |
| $(5, 30)$ | 30 | 0 | $4.16\times 10^{-5}$ |
| $(6, 25)$ | 25 | 0 | $8.65\times 10^{-5}$ |
| $(4, 50)$ | 50 | 0 | $7.16\times 10^{-6}$ |
| $(5, 50)$ | 50 | 0 | $8.95\times 10^{-6}$ |

All halted with "no fresh packets."

Codex verdict: **"Coherent local counterpattern, not a decisive route-2 refutation on the toy's $N_h/h$ scale."**

## What's refuted, what's not

- Collision forcing lemma **as stated with the given antichain legality rules**: dead.
- $(\star)$ **as an unweighted count bound**: likely refuted (scales up to available prime pool).
- $(\star)$ **as a weighted/harmonic version**: not automatically refuted. Codex data ($10^{-5}$ normalized load) is consistent with weighted $(\star)$ surviving.
- Route 2 with **arithmetic-locality-constrained "useful"**: still viable; star construction doesn't apply.
- State inequality **with strict freshness**: does not go through.

## Three paths forward

1. **Clarify $(\star)$** — unweighted count or weighted harmonic-mass? Does "useful" in the state inequality's derivation enforce arithmetic locality implicitly?
2. **Repair via arithmetic locality** — redefine "useful shield" to require $q$ in same microcell as missing $p$. Re-examine collision forcing under tighter rule.
3. **Refocus on dense regime** — fix Pro R39 #1's audit gaps, close directly without packet absorption.

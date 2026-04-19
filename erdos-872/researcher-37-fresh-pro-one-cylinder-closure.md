# Round 37 fresh Pro — freshness lemma PROVED in the one-cylinder arithmetic model; full game reduced to a divisors-in-short-intervals bound

## Status: genuine conditional closure in the one-cylinder arithmetic model

Fresh Pro gives the first clean proof that closes the R35/R36 amortization gap **in the model where Codex's empirical evidence showed useful residuals stayed at 0–2**. Explicitly honest about the remaining gap to the full game and isolates it as a concrete analytic NT statement.

## What fresh Pro proved

**Model.** One-cylinder arithmetic: primes partitioned into microcells $\mathcal Q_j = [P_j, e^{1/h}P_j]\cap\mathcal P$ with $M_j = |\mathcal Q_j|$. Rank-$h$ targets are admissible $h$-sets. Certificate $c\subsetneq S$ has defect $k = h-|c|$. Completions are cellwise: each missing prime replaces a prime in the same microcell. The legality rule is "certificate-kills-all-completions": claiming $c$ removes all targets containing $c$.

This is exactly the Codex "minimal arithmetic cylinder preserving lower defects" in which $\sigma$ empirically kept useful residuals at $0$–$2$.

**Lemma (fresh high-degree witness, one-cylinder model).** Let $k_0 = \lceil \log_2 h \rceil$. In any round where Prolonger executes a useful top-facet shield on $S$ **outside the entropy tail** (meaning $S$ contains at least $k_0$ primes from microcells with $M \ge 2$), there exists a legal certificate $c\subsetneq S$ with
$$d_t(c) \ge h, \qquad \text{defect}(c) \le k_0.$$

**Proof.** Pick $k_0$ distinct primes $r_1, \ldots, r_{k_0}\in S$ each in a microcell with $M_{\mathcal Q(r_i)} \ge 2$. Set $c = S\setminus\{r_1,\ldots,r_{k_0}\}$. Completions are products of cellwise replacements, so
$$d_t(c) \ge \prod_{i=1}^{k_0} M_{\mathcal Q(r_i)} \ge 2^{k_0} \ge h.$$
Freshness: if $c$ had been claimed earlier, then (by the certificate-kills-completions rule) every target containing $c$, including $S$, would already be dead — contradicting that $S$ is about to be usefully shielded. ∎

**Tail control.** Targets failing the $k_0$-replaceable-primes condition contain at least $h-k_0$ primes from $\mathcal P_\le := \{p \ll h\log h\}$ (since $M_j \le 1$ forces $P_j \ll h\log h$). Standard tilting:
$$\mu\{S : |S\cap\mathcal P_\le| \ge h-k_0\} \ll \binom{h}{k_0}\left(\frac{\log\log h}{h}\right)^{h-k_0} N_h \ll \frac{N_h}{\log h}.$$

**Amortization.** Online domination $\sum_t d_t(u_t) \le N_h$ (cleaner in this model: certificate completion sets are disjoint over time). Applying the lemma:
$$T \cdot h \le \sum_{\text{useful}} d_t(u_t) \le N_h \implies |F_{\text{useful}}| \ll \frac{N_h}{h}.$$

**Combined with R35 state estimate.** $\mu(\text{Cl}_h) \ll \frac{h}{\log h}|F_{\text{useful}}| + \frac{N_h}{\log h} \ll \frac{N_h}{\log h}.$

Sieve/game translation over the central rank window $h\sim \log\log n$:
$$\boxed{L(n) \ll \frac{n}{\log\log\log n} = o(n) \quad \text{in the one-cylinder arithmetic model.}}$$

## The explicit remaining gap to the full divisibility game

The proof used one rule where the full game is harder: **certificate-kills-all-completions**. In the full divisibility saturation game on $[n]$, legality is antichain-type: a divisor $c$ can become illegal because a multiple of $c$ was played earlier, even though many other multiples of $c$ (including the specific $S$ one cares about) remain legal. In that world, $c\subseteq S$ does **not** imply $c$ is legal/fresh.

This is exactly the "non-privacy of divisors" quantitative phenomenon. Fresh Pro proposes the missing ingredient as a concrete analytic NT statement:

**Candidate analytic NT lemma (divisors in short multiplicative intervals).** A single previously played integer $m$ can contain, as divisors, only few of the candidate witnesses $c\subsetneq S$ — because these lie in an extremely short multiplicative interval (ratios are products of at most $k_0 = \log_2 h$ within-cell ratios, hence $\le e^{k_0/h}$).

Concretely: prove an upper bound on $\#\{d \mid m : d \in [x, x(1+\varepsilon)]\}$ with $\varepsilon \asymp e^{k_0/h}$, for $x$ of sieve-cylinder form. Rankin trick + smooth-part decomposition + divisor bounds should give at least $O(\log\log h)$ multiplicity — enough for $L(n) = o(n)$, possibly not enough for the optimal $n/\log\log\log n$ rate.

## Fresh Pro's assessment

- One-cylinder closure is **clean and complete** (defends it against the "too optimistic" charge).
- Full game gap is isolated as a specific analytic NT question about divisors in short intervals on sieve-cylinder scales.
- Offers to formalize and push the Rankin-trick version as far as purely elementary tools allow.

## Interpretation

This is the first concrete conditional closure of $L(n) = o(n)$ with all pieces actually written out. The remaining gap is now a **single analytic NT statement**, not a combinatorial game-theoretic one.

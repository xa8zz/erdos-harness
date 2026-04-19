# Round 36 Pro A — freshness lemma isolated as the specific remaining gap

## Status: strong partial; specific remaining sub-gap

Pro A could not close the full star-breaker but reduced the entire amortization to ONE precise conditional lemma. Substantial progress.

## What Pro A proved

**Multi-defect σ⋆ version.** Shortener claims a legal certificate $x_t$ maximizing $d_t(c)$ over ALL currently legal proper divisors (not only top facets). Rigorous online budget:
$$\sum_t d_t(x_t) \le N_h.$$

**Amortization of "witnessed" useful shields.** If a useful shield admits a fresh legal lower-defect witness $c \subsetneq S$ with $d_t(c) \ge h$, and each shield has $O(1)$ witness assignments, then:
$$|F_{\text{useful}}^{\text{witnessed}}| \ll \frac{N_h}{h}.$$

**Dyadic arithmetic provides candidate witnesses.** For top facet $bA_{S \setminus \{p\}}$ and any block $B \subseteq S$ with $p \in B$, the lower lateral $c = bA_{S \setminus B}$ is shielded by the same Prolonger score. Its static replacement degree is $\prod_{q \in B} M_{\mathcal Q(q)}$. Enlarging $B$ until this product $\ge h$ gives a lower-defect certificate with the right scale.

## The exact missing step: FRESHNESS

The issue: $c = bA_{S \setminus B}$ may already have been shielded by an earlier Prolonger score, so it is no longer legal when $\sigma^\star$ moves. If legal, amortization closes. If pre-shielded, current useful shield must be charged recursively to the earlier lower-defect shielding event.

**Conditional star-breaker theorem.** If for every useful top-facet shield outside the R35 high-window entropy tail there is a fresh legal lower-defect witness $c$ with $d_t(c) \ge h$ and assignment multiplicity $O(1)$, then:
$$|F_{\text{useful}}| \ll \frac{N_h}{h} + \frac{N_h}{\log h},$$
combined with the R35 state estimate gives $|\operatorname{Cl}_h| \ll N_h/\log h$, and summing over the central rank window $h \sim \log\log n$ yields $L(n) \ll n/\log\log\log n$.

**The unresolved sub-gap.** A backward-charging / recursive lemma:
$$\text{Every chain of pre-shielded lower defects has bounded branching loss before it reaches a fresh degree-}\gg h\text{ certificate.}$$

Equivalently: "pre-shielding all high-degree lower witnesses for many useful top facets already costs $\Omega(h)$-degree exposure somewhere earlier."

## Pro A's assessment

- No counterexample in the arithmetic dyadic model.
- Abstract star-forest does NOT embed faithfully (lower certificates $bA_D, A_D$ are shared across many targets, not private leaves).
- Refutation would need a Prolonger strategy that repeatedly useful-shields top facets while ensuring all degree-$\gg h$ lower witnesses were already shielded earlier, WITHOUT itself creating enough earlier high-degree exposure for $\sigma^\star$ to delete comparable mass. That is the exact remaining sub-gap.

The gap is narrower than before: any refutation now has this very specific form.

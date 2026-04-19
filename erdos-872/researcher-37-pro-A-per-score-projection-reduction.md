# Round 37 Pro A — freshness lemma reduced to a sharper per-score projection bound

## Status: bounded-depth version proved; reduced full lemma to a specific dyadic supersaturation inequality

Pro A could not give a complete proof but reduced the entire freshness lemma to **one** sharper extremal statement inside the divisor lattice. This is strictly narrower than the R36 statement of the gap.

## What Pro A proved

**Bounded-depth freshness (direct online domination).** If every useful top-facet shield has a fresh legal witness at depth at most $r$ — i.e. a divisor $bA_{E\setminus B}$ with $|B|\le r$ and live degree $\ge h$, with assignment multiplicity $O_r(1)$ — then
$$|F_{\text{useful}}| \ll_r \frac{N_h}{h}.$$
Proof is direct: $\sum_t d_t(x_t) \le N_h$ by multi-defect $\sigma^\star$ online domination, and each assigned witness has degree $\ge h$. Closes amortization for bounded-depth fresh witnesses.

**Distinctness of first-shielders for freshless top facets.** If a fresh useful top facet $E$ has no fresh lower witness, then every codim-2 face $D = E\setminus\{p\}$ was first-shielded earlier by a scored support, and the $h-1$ first-shielders are distinct (union argument: if one support covered two such faces, it would contain $E$, contradicting freshness of $E$).

**Arithmetic gain over abstract model.** In a dyadic-local arithmetic cell, letting $J(D) := \#\{E: D\subset E,\ E\text{ later becomes a fresh useful top facet}\}$,
$$J(D) \ll \sum_{\mathcal Q} m_{\mathcal Q}(D), \qquad d(D) \asymp \sum_{\mathcal Q, \mathcal Q'} m_{\mathcal Q}(D) m_{\mathcal Q'}(D),$$
so typically $J(D) \lesssim \sqrt{d(D)}$ — strictly better than the private-leaf model where $J(D) \asymp d(D)$. This is why the abstract counterexample (star-forest with private leaves) does not embed.

## The exact missing step

**Per-score dyadic projection inequality.** For every Prolonger score $F_t$, outside the R35 entropy tail,
$$\boxed{\sum_{\substack{D\subset F_t \\ |D|=h-2 \\ D\text{ first-shielded at }t}} J(D) \ll d_t(x_t).}$$

Summing over $t$ plus distinctness would give $\sum_D J(D) \ll N_h$, hence $|F_{\text{useful}}| \ll N_h/h$.

Pro A describes this as equivalent to a **dyadic-local clique-removal / supersaturation** statement for the lower-defect divisor shadow: if many boundary-complete $(h-1)$-sets exist in the lower shadow of first-shielded faces, then some fresh lower face has live degree comparable to their average — so $\sigma^\star$ deletes it first.

## Pro A's assessment

- Unconditional bound available from Cauchy + online domination is $\sum_D J(D) \ll h\sqrt{N_h|F|} \ll hN_h$, too large by factor $h$.
- No arithmetic counterexample. Natural counterexamples use private lower faces which do not exist under actual divisibility.
- The remaining ingredient is an anti-concentration / supersaturation fact specific to the arithmetic divisor lattice, not a pure combinatorial argument.

**The unresolved lemma is now strictly narrower:** it is a per-score statement about codim-2 incidences rather than a global recursive backward-charging argument.

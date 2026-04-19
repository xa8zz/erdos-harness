# R42 Attack C refutation — non-local useful witnesses can carry harmonic mass $\gg N_h$

**Attack C:** arithmetic locality on "useful" preserves state inequality.

## Refutation

**Claim:** The state inequality $\mu(\operatorname{Cl}_h) \ll (h/\log h)|F_{\text{useful}}^{\text{local}}| + N_h/\log h$ does NOT hold for the proposed locally-useful definition.

## Counterexample

At central rank $H = \sum_{p \le y} 1/p \sim h$, fix expanded-window constant $C$.

Choose marker primes $A$ with:
- $\sum_{a \in A} 1/a = \lambda + o(1)$ for fixed $\lambda > 0$
- $\max_{a\in A} 1/a = o(1)$
- Primes of $A$ separated by $> 2C + O(1)$ microcells

Consider $\mathcal R_2 = \{S \in \binom{\mathcal P}{h} : |S \cap A| = 2\}$.

By generating function / Poisson approximation:
$$\mu(\mathcal R_2) = \left(e^{-\lambda}\frac{\lambda^2}{2} + o(1)\right) N_h.$$

By $s=1$ packet tail: $\mu(\mathrm{coll}(S) \ge 1) \ll N_h/h \ll N_h/\log h$. So
$$\mu(\mathcal R_2 \cap \{\mathrm{coll}(S) = 0\}) = \left(e^{-\lambda}\frac{\lambda^2}{2} + o(1)\right) N_h \gg N_h/\log h.$$

## Non-locality

Take collision-free $S = D \cup \{a_1, a_2\} \in \mathcal R_2$ with $a_1, a_2 \in A$ and $D \subseteq \mathcal P \setminus A$, $|D| = h-2$.

Defect-2 certificate $c = D$. Other extensions $S' = D \cup \{a_i, a_j\}$ with $\{a_i, a_j\} \ne \{a_1, a_2\}$:
- $S \triangle S' \subseteq \{a_1, a_2, a_i, a_j\}$
- $A$-primes in mutually separated expanded packets ⟹ no new marker $a_i$ or $a_j$ lies in dyadic-expanded window of $a_1$ or $a_2$.
- So $S \triangle S' \not\subseteq W_C(S \setminus D)$: these are **non-local** useful witnesses.

Also $\mathrm{coll}(S') = 0$ by construction.

**Result:** harmonic mass $\gg N_h$ of non-local useful witnesses that have no packet collisions ⟹ not absorbable by the packet-collision entropy tail ⟹ state inequality substitution fails.

## Repaired statement

The corrected version must build locality into the charging map itself:
> For every closed rank-$h$ target outside an explicitly defined bad family $\mathcal B$ with $\mu(\mathcal B) \ll N_h/\log h$, the actual charging map in the state-inequality proof assigns it to a useful pair $(E, c)$ for which there exists a residual extension $E' \supset c$, $E' \ne E$, satisfying $E \triangle E' \subseteq W_C(E\setminus c)$.

That's an **extra hypothesis about the image of the charging map**, not a consequence of global usefulness + packet-collision tail.

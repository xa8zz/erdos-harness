---
id: R42-attack-A-proof-attempt
type: research
date: 2026-04-19
intent: >
  Attempt to prove the weighted (*) via harmonic packet absorption with a
  three-regime partition of the degree graph G_D.
predecessors: [R41-three-pros-refute-collision-forcing]
action:
  kind: extends
  target: R41-three-pros-refute-collision-forcing
claim: >
  Proof attempt of weighted (*) via three-regime decomposition of G_D:
  (i) large-packet regime absorbed by dyadic expansion, (ii) medium-packet
  regime absorbed by harmonic mass concentration, (iii) sparse singleton
  regime absorbed by high-window entropy tail. Claimed to close
  Sigma_omega(p,q) = O(N_h/log h).
---

# R42 Attack A proof attempt — three-regime partition of $G_D$

**Attack A:** harmonic packet absorption proving $(\star_\omega)$.

Claims to prove $(\star_\omega)$ via exhaustive three-regime decomposition.

## The decomposition

For non-local defect-2 core $D \supset \{p,q\}$, partition $G_D$ (graph of useful extension pairs $\{r,s\}$ with $D \cup \{r,s\} \in F_\text{useful}$) into three regimes by structural topology.

### Regime 1: adversarial high-degree stars

Edges with at least one endpoint of degree $\ge 2$ in $G_D$. Vertex $r$ with multiple edges ⟹ Prolonger scored multiple useful supports $D \cup \{r, \cdot\}$, so $r$-prehistory grows. By bounded-prehistory (3), at prehistory $s = 2$, Prolonger is forced to leave a fresh witness $B \subset E$ with $|B| \le 2$.

Harmonic mass of rank-$h$ sets containing such forced 2-witnesses is bounded by second factorial moment $\ll N_h(c^2/h)^2$ — absorbable.

### Regime 2: heavy matchings (non-star residual)

Post-pruning, $G_D'$ is a matching. Entropy threshold:
$$\tau = \max J_\omega(M) \text{ for collision-free matching} \le \frac{1}{2}\sum_\Pi \beta(\Pi)^2 \ll c^2/h \ll 1/\log h.$$

If $J_\omega(D) > \tau$, the matching cannot be collision-free ⟹ some edge $\{r, s\}$ has both vertices in same packet ⟹ $\mathrm{coll}(D \cup \{r, s\}) \ge 1$. Absorb via $s=1$ collision tail:
$$\mu(\mathrm{coll}(S) \ge 1) \ll N_h \cdot c^2/h \ll N_h/\log h.$$

### Regime 3: light residual matchings

$J_\omega(D) \le \tau$. Direct incidence:
$$\sum_{\text{light } D} \omega(D) J_\omega(D) \le \tau \sum_D \omega(D) \le \tau \cdot N_{h-2}(p,q) \ll N_h(p,q)/\log h.$$

## Conclusion

Summing three regimes: $\Sigma_\omega(p,q) \ll N_h(p,q)/\log h$.

Integrated over non-local pairs: $|F_\text{useful}| \ll N_h/h$. Combined with state inequality: $\mu(\operatorname{Cl}_h) \ll N_h/\log h$, and $L(n) \ll n/\log\log\log n$.

## Weakness audit (my annotation)

- **Regime 1 absorption via factorial moment**: the argument "bounded-prehistory forces small witnesses absorbed by collision tail" is not fully rigorous. The mapping from forced 2-witnesses to collision configurations isn't made explicit.
- **Regime 2 collision-forcing**: correct direction but the $s=1$ tail's $N_h \cdot c^2/h \ll N_h/\log h$ holds only at central rank $h \sim \log\log n$ where $c^2/h \ll 1/\log\log\log n$. Also need: a heavy matching produces $\mathrm{coll}(E) \ge 1$ for the scored $E$, which depends on which $E = D \cup \{r, s\}$ is scored.
- **Regime 3 light residual**: the bound $\tau \cdot N_{h-2}(p,q) \ll N_h(p,q)/\log h$ uses $\tau \ll 1/\log h$ and $N_{h-2}(p,q) \asymp N_h(p,q)$ at central rank. Seems OK.

Main risk: Regime 1 step is hand-wavy.

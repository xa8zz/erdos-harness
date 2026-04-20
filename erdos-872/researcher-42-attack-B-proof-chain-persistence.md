---
id: R42-attack-B-proof
type: research
date: 2026-04-19
intent: >
  Prove the same-prime chain persistence lemma: chains under sigma^star
  must expose a high-degree certificate before the chain ends.
predecessors: [R41-three-pros-refute-collision-forcing]
siblings: [R42-attack-A-proof-attempt]
action:
  kind: extends
  target: R41-three-pros-refute-collision-forcing
claim: >
  Chain persistence lemma proved via binomial ratio: any same-prime chain
  of pre-shielding events of length k forces sigma^star to claim a
  certificate of degree >= h * C^k / binom(h,k) >= Omega(h/k) at some
  step. Summing over chains of bounded depth k = O(log h) gives the
  needed N_h/h amortization.
---

# R42 Attack B proof — chain persistence lemma via binomial ratio

**Attack B:** same-prime chain persistence under $\sigma^\star$.

## Precise chain persistence lemma (claimed proved)

Fix fibre $b$, prime $p$, rank $h$, defect depth $1 \le k \le K = O(1)$. Let $E = bA_{\{p\}\cup T}$, $|T| = h-1$, be a legal useful Prolonger shield whose defect-$k$ $p$-freshness fails. Let $G_i = bA_{\{p\}\cup A_i}$, $|A_i| = h-1$, be earlier Prolonger scores in the same $(b,p)$-fibre, time-ordered.

At the Shortener turn immediately following $G_1$, $\sigma^\star$-move has live degree
$$d_{t_1}(u_{t_1}) \ge \frac{h-2}{k} = \Omega(h) \text{ for fixed } K.$$

## Proof

Since $E$ is legal at score time, no earlier Shortener claim divides $E$. So if $bA_{\{p\}\cup B}$ with $B \subseteq T$ is illegal at $E^-$, it was killed by earlier Prolonger score — necessarily in the same $(b,p)$-fibre.

Defect $k$ with $|B| = h-k-1$. Let $m = h-1$, so $|T| = m$, $|B| = m-k$.

Freshness fails ⟹ every $B \in \binom{T}{m-k}$ is killed by some earlier $A_i$ with $B \subseteq A_i$.

Consider $A_1$: since $A_1 \ne T$ (both size $m$), pick $q \in T \setminus A_1$. Failed witnesses $B$ with $q \in B$: $\binom{m-1}{k}$ of them. None contained in $A_1$, so must be covered by later $A_i$ ($i \ge 2$) with $q \in A_i$.

Branching bound: single $A_i$ with $q \in A_i$ covers $\le \binom{|A_i \cap T| - 1}{m-k-1} \le \binom{m-2}{k-1}$ such $B$'s.

Ratio: $\binom{m-1}{k} / \binom{m-2}{k-1} = (m-1)/k = (h-2)/k$ distinct later $A_i$'s containing $q$.

Now certificate $u = bA_{\{p,q\}}$ at time $t_1$ (post-$G_1$):
- Legal: $G_1$ didn't kill $u$ ($q \notin A_1$); no earlier $(b,p)$-Prolonger score; no earlier Shortener claim divides $u$ (else would divide $E$).
- Live degree $\ge (h-2)/k$ via later $G_i$'s containing both $p$ and $q$.

$\sigma^\star$ max: $d_{t_1}(u_{t_1}) \ge (h-2)/k$.

## Closure chain

- Chain persistence: each freshness-failing useful shield forces $\sigma^\star$-degree $\Omega(h)$ at some earlier chain step.
- Online domination: $\sum_t d_t(u_t) \le N_h$ ⟹ # chains $\ll N_h/h$.
- Each useful shield assigned to $O(1)$ chains via fibre-prime indexing (via pair-first structure) ⟹ $|F_{\text{useful}}| \ll N_h/h$.
- State inequality: $\mu(\operatorname{Cl}_h) \ll \frac{h}{\log h} \cdot \frac{N_h}{h} + \frac{N_h}{\log h} \ll \frac{N_h}{\log h}$.
- Summing: $L(n) \ll n/\log\log\log n = o(n)$.

## Corrections to the original skeleton

- "Shortener killed witness" branch cannot occur for legal $E$: any Shortener divisor of a candidate witness inside $E$ also divides $E$.
- Backward induction should not start from assumed-fresh witness at $F_r^-$ (when freshness fails, such witness is absent). Right object: entire family $\binom{T}{h-k-1}$ of dead defect-$k$ witnesses. Bounded branching via binomial ratio.

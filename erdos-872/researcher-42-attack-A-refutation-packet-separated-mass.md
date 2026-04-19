# R42 Attack A refutation — packet-separated family has full harmonic mass

**Attack A:** harmonic packet absorption proving $(\star_\omega) = \Sigma_\omega(p,q) = \binom{h-2}{2}\sum_E\omega(E) \ll N_h/\log h$.

## Refutation

For non-local pair $(p,q)$ (in distinct packets), define
$$\mathcal F_\text{sep}(p,q) = \{E : |E|=h,\ \{p,q\}\subset E,\ m_\Pi(E) \le 1 \text{ for every packet}\}.$$
Every $E \in \mathcal F_\text{sep}$ has $\mathrm{coll}(E) = 0$.

Let $M_\text{sep}(p,q) = \sum_{E\in\mathcal F_\text{sep}}\omega(E)$. By the $s=1$ packet tail conditioned on $\{p,q\}$:
$$N_h(p,q) - M_\text{sep}(p,q) \ll N_h(p,q)\cdot c^2/h.$$
So $M_\text{sep}(p,q) = (1 - O(1/h)) N_h(p,q)$ — **essentially the full harmonic mass of rank-$h$ sets containing $\{p,q\}$**.

Taking $F_\text{useful} = \mathcal F_\text{sep}(p,q)$ as test family:
$$\Sigma_\omega(p,q) = \binom{h-2}{2} M_\text{sep}(p,q) \ge (1 - O(1/h))\binom{h-2}{2}N_h(p,q) \asymp h^2 N_h(p,q).$$

Compared to target $N_h(p,q)/\log h$: **gap of $h^2 \log h$**.

## Why packet collision forcing fails

Packet-separated defect $D = \{p,q\}\cup R$ with $|D| = h-2$ has remaining packet mass $B_D \asymp h$ (occupies only $h-2$ packets with mass $O(1/h)$ each). Non-collision extensions:
$$J_\omega(D) \ge \frac{1}{2}(B_D^2 - \sum_\Pi \beta(\Pi)^2) \asymp h^2.$$

**Large $J_\omega(D)$ does not force packet collision** — it comes from many distinct packets, not clustering.

## The proposed step

$$\omega(D) J_\omega(D) \text{ large} \Longrightarrow \text{positive harmonic mass in packet-collision configuration}$$
is **false**. The bound $J_\omega(D) \le (\log\log y)^2/2 \asymp h^2/2$ at central rank is also too weak to give $(\star_\omega)$.

## What's missing

To make $(\star_\omega)$ true, need an additional game-dynamic statement excluding a positive harmonic fraction of packet-separated useful supports through a fixed non-local pair. Without it, the packet-separated family is a harmonic obstruction, not merely raw-count.

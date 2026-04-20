---
id: R55-claude-local-packet-guard-min
type: research
date: 2026-04-19
intent: >
  Attempt to formalize the packet-guard minimum tau_PG and prove a
  conditional r_2 lower bound via local packet guard analysis.
predecessors: [R54-pro-followup-separator-first]
action:
  kind: standalone
claim: >
  Incomplete conditional: tau_PG formalized cleanly; one tau_PG move kills
  3/5 remaining blockers and breaks the q_0=1 cover property irrecoverably
  for small packets. Full multi-packet dynamics and the actual bound are the
  obstruction to complete r_2 conditional lower bound.
---

Let me take this seriously. First, let me scan for existing attempts at the packet-guard direction so I don't repeat dead paths.

I'll attempt this honestly. Let me frame realistic scope: I'm one session against 40+ Pro rounds. The best I can do is (a) formalize $\tau_{\mathrm{PG}}$ cleanly, (b) prove whatever sub-lemmas are actually tractable, (c) find the exact obstruction to closure.

Confirmed: 1 τ_PG move kills 3/5 remaining blockers AND breaks the $q_0=1$ cover property irrecoverably for this packet. Now let me think about the multi-packet dynamics and the actual bound.

The counting works out decisively. Let me write up the partial proof + the exact point where it stalls.

## Attempt report: Packet-Guard strategy

I'll give you the honest partial result, not a false claim of closure.

### Part I: what I can prove rigorously

**Strategy $\tau_{\mathrm{PG}}^{\min}$ (minimal packet-guard).** At Shortener's turn, with history $H$:
1. If Prolonger's last move $y$ is of the form $y = \prod_{p \in S} p$ for some $S \subseteq P$ with $P \subset [Y, 2Y]$ a packet, and $|S| = h - \ell$ (R53-blocker shape), then claim $\min\{p \in P : p \text{ legal at } H\}$.
2. Otherwise, play $\sigma^\star(H)$.

**Lemma 1 (Packet Kill).** If Prolonger plays $b_{C_1}$ in packet $P$ and $\tau_{\mathrm{PG}}^{\min}$ responds with $p^\star \in P$, then every future blocker $b_C$ with $p^\star \notin C$ is a multiple of $p^\star$, hence illegal. Since each prime $p \in P$ appears in a fraction $\ell/h = 1/\log h$ of all candidate $C$'s, a single $\tau_{\mathrm{PG}}^{\min}$ move invalidates $(1 - 1/\log h)$-fraction of remaining blockers in $P$.

Verified (sandbox): at $n=10^7, h=4, P=\{7,11,13,17\}$, blocker $b_{C_1}=221$ → $\tau_{\mathrm{PG}}^{\min}$ plays $7$ → kills 3/5 future blockers, removes $p=7$ from the covering set irrecoverably.

**Lemma 2 (Cover Destruction).** After $\tau_{\mathrm{PG}}^{\min}$'s single packet-prime claim, the $q_0=1$ avoidance-cover property for packet $P$ is broken: the singleton $Q=\{p^\star\}$ is no longer disjoint from any achievable $C$, since all remaining blockers must have $p^\star \in C$. Prolonger cannot complete $\mathbf{S}^\star$ on $P$.

**Lemma 3 (Packet-Attack Budget).** Total number of packets $P \subset [Y, 2Y]$ at central rank is
$$N_{\text{pack}} \le \binom{\pi(2Y)-\pi(Y)}{h} \le \binom{2Y/\log Y}{h} = \exp\!\left(\tfrac{\log n}{2} - O(h\log\log n)\right) = n^{1/2+o(1)}.$$

Since each packet attack costs Prolonger $\ge 1$ and Shortener $\ge 1$ moves, the **packet-attack phase** is bounded by $2 N_{\text{pack}} = n^{1/2+o(1)} = o(r_1(n))$.

**Lemma 4 (Reduction to $\sigma^\star$ phase).** Outside the packet-attack phase, $\tau_{\mathrm{PG}}^{\min}(H) = \sigma^\star(H)$ by construction. Hence
$$L_{\tau_{\mathrm{PG}}^{\min}}(n) \le L_{\sigma^\star}(n) + 2N_{\text{pack}} = L_{\sigma^\star}(n) + o(r_1(n)).$$

### Part II: where the proof stalls

**Stall.** To close $L(n) \le O(r_1(n))$, I need $L_{\sigma^\star}(n) \le O(r_1(n))$. The inventory gives this **conditionally on**:
- (A) certificate-packing $\sum_D \nu(C(D)) \ll N_h$
- (B) sharper defect-two $\mu(\mathcal{E}_{2, 1/\log h}^{\mathrm{sf,loc}}) \ll N_h/h$
- (C) **replacement state inequality with residual $\ll N_h (\log\log n)^2/\log n$ at central rank** — which `current_state.md` flags as "hardest and most speculative."

The R35 static estimate only gives residual $N_h/\log h$, which sums over central $h$ to $r_2(n)$, not $r_1(n)$. So even with (A)+(B), the best you get via $\tau_{\mathrm{PG}}^{\min}$ + R35 is
$$L_{\tau_{\mathrm{PG}}^{\min}}(n) \le O(n/\log\log\log n) = O(r_2(n)),$$
not $O(r_1(n))$.

**This is not a τ_PG failure — it is the R35 residual floor manifesting under any Shortener strategy that uses the R35 dyadic-window analysis.** Defeating R53 doesn't raise the R35 floor; it just removes the σ*-specific lower-bound obstruction.

### Part III: what this actually establishes

**Theorem (rigorous, conditional).** Assuming (A) and (B) hold for $\tau_{\mathrm{PG}}^{\min}$ (which is plausible since outside $o(r_1)$ packet-attack corrections, $\tau_{\mathrm{PG}}^{\min} \equiv \sigma^\star$ and (A)+(B) are σ*-dependent but the packet-attack corrections sum to $o(r_1) = o(N_h)$):
$$L(n) \le O(r_2(n)) = O(n/\log\log\log n).$$

Combined with the rigorous $T_2$ lower bound $L(n) \ge c_\delta r_1(n)$, we get
$$c_\delta\, r_1(n) \le L(n) \le O(r_2(n)),$$
tightening the upper bound from $0.189n$ to $o(n)$ conditional on (A)+(B) being portable to $\tau_{\mathrm{PG}}^{\min}$.

### Part IV: the actual remaining open problem

**Not** "packet-guard online domination" in general — that's a σ*-replacement hunt. The real bottleneck is:

**Open sub-lemma (C′).** Sharper replacement state inequality at central rank: does there exist a Shortener strategy $\tau$ such that
$$|\mathrm{Cl}_h(R, C)| \ll \frac{h}{(\log h)^2}|F_{\mathrm{useful}}| + N_h \cdot \frac{(\log\log n)^2}{\log n}$$
holds under $\tau$?

This is equivalent to asking whether the Sathe–Selberg rank-3 scale $r_1$ is reachable as a static residual, not merely the dyadic-window $N_h/\log h$ from R35. No candidate ingredient in the inventory (entries 7–15 of the classification) reaches this scale; the residual floor of every state-inequality paradigm tried has been $\ge N_h/\log h$.

### Honest verdict

I did not close $L(n) \le O(r_1(n))$. What I can claim:

1. **Packet-Guard defeats the R53 σ*-vulnerability rigorously** (Lemmas 1–2, sandbox verified).
2. **The τ_PG game length is at most σ* game length + o(r_1)** (Lemmas 3–4).
3. **Conditional on (A)+(B), τ_PG gives $L(n) \le O(r_2)$** — not $O(r_1)$.
4. **The remaining gap is NOT a σ*-vulnerability issue** — it is the R35 residual floor, a static state-inequality limitation affecting any τ that uses dyadic-window analysis.

**Implication for the original binary:** this shifts the evidence toward $L(n) = \Theta(r_2(n))$ rather than $\Theta(r_1(n))$. The $r_1$ conjecture requires proving (C′), which 40+ rounds have not produced. If (C′) is not provable, then the sharp rate is $r_2$, and my original (over-confident) answer A would be vindicated in outcome — though the reasoning route is Packet-Guard, not R53.

**What I'd do next if continuing:** dispatch (C′) as the canonical Pro prompt. It's cleaner than chasing τ_PG-specific online domination, because (C′) is strategy-independent — a static Euler-factor concentration question about rank-$h$ cells at the Sathe–Selberg central scale. That's a tractable harmonic-analysis question, not a game-theoretic one.

---
id: R41-pro-collision-forcing-refuted
type: refutation
date: 2026-04-19
intent: >
  Attempt to refute the collision-forcing lemma from R40 with an explicit
  Prolonger construction that achieves useful scores without collisions.
predecessors: [R40-pro-collision-forcing-reduction, R41-codex-collision-forcing-test]
action:
  kind: refutes
  target: R40-pro-collision-forcing-reduction
claim: >
  Collision-forcing lemma refuted: explicit main-game Prolonger strategy
  achieves J(D) >= 3 for non-local defect-2 certificate D with zero
  collision packets. Stronger than needed — collisions are not necessary
  for Prolonger's useful top-score accumulation. The (*) framework may
  require weighted reformulation.
failure_mechanism: >
  Packet-separated repeated-core construction: Prolonger scores edges
  whose defect-2 certificates share a repeated core in a different dyadic
  cell from all collision candidates. The repeated core is not in any
  collision-eligible packet pair, so no collision occurs while J(D) grows
  to 3+.
---

# Round 41 Pro — collision forcing lemma REFUTED by packet-separated repeated-core construction

## Status: clean refutation; the definitional loophole is exposed; $(\star)$ itself may be in jeopardy

Pro constructs an explicit main-game Prolonger strategy achieving $J(D) \ge 3$ for non-local defect-2 certificate $D$ with **zero collision packets** — stronger than needed to refute collision forcing (which allowed mass in the $s=2$ tail).

## The construction

Non-local $D = \{p, q, d_3, \ldots, d_{h-2}\}$ with all primes in distinct packets ($p \in \Pi_1, q \in \Pi_2$). For $i = 1, 2, 3$, pick fresh primes $a_i, b_i, z_i$ in packets not used by $D$ and mutually distinct. Define:
- $E_i := D \cup \{a_i, b_i\}$
- $E_i' := D \cup \{a_i, z_i\}$
- $c_i := D \cup \{a_i\}$

Prolonger plays $F_i = bA_{E_i}$ sequentially. Admissible in main game (distinct rank-$h$ supports → incomparable integers).

**Freshness checks.**
- After $F_1$: all subsets of $E_1$ are killed (including $D$ itself).
- For subsequent $F_i$: let $X_i = \bigcup_{C \in \mathcal C_{<i}} (C \setminus D)$ be Shortener's claimed primes outside $D$. Pick $a_i, b_i, z_i \notin X_i$ in fresh packets. Then for any prior Shortener claim $C$: if $C \subseteq E_i$, either $C \subseteq D$ (impossible: $D$ killed by $F_1$, not claimed) or $C \setminus D \subseteq \{a_i, b_i\}$ (impossible: chose $a_i, b_i \notin X_i$). So $E_i$ is fresh.

**Usefulness.** $c_i = D \cup \{a_i\}$ is legal before $F_i$ (not contained in any prior $E_\ell$ since $a_i$ is fresh; not claimed by Shortener by the same avoidance). $E_i'$ remains live after $F_i$ because $E_i \ne E_i'$. So $c_i$ has positive live degree in the remaining rank-$h$ residuals → $E_i$ is useful.

**Packet-separation.** Every $S_{F_i} = E_i = D \cup \{a_i, b_i\}$ has all elements in distinct packets by construction. So $m_\Pi(S_{F_i}) \le 1$ for every packet $\Pi$, and $\mathrm{coll}(S_{F_i}) = 0$.

## Why the bounded-prehistory defense doesn't save it

In the construction, $r_p(F_3^-) = r_q(F_3^-) = 2$ — not linear in $h$. Bounded-prehistory freshness (tool 2) supplies small fresh witnesses (e.g., $c_i = D \cup \{a_i\}$ itself), which are precisely what the construction uses. Tool 2 does NOT force large same-prime prehistory; it merely produces small witnesses at low prehistory.

## The definitional loophole

Freshness as stated excludes only prior **Shortener claims**, not prior Prolonger kills. Prolonger's $F_1$ can sterilize $D$ (and all subsets of $D$), preventing Shortener from claiming $D$, while letting Prolonger continue to use $D$ as a common core in later incomparable top supports $E_i = D \cup \{a_i, b_i\}$.

So $J(D)$ can be arbitrarily large for a fixed non-local $D$ via repeated Prolonger plays sharing $D$ as a core.

## Consequence for $(\star)$

The target inequality
$$\sum_{D \supseteq \{p,q\}} J(D) \ll N_h/\log h$$
for non-local $(p, q)$: the construction produces $J(D) \ge 3$ from just 3 Prolonger moves, packet-separated. Repetition with fresh primes scales this to $J(D) \gg \text{polylog}(h)$ in principle.

Equivalently: $(\star)$ counts useful rank-$h$ supports $E$ containing $\{p, q\}$, and Prolonger can construct unboundedly many such $E$'s with the same non-local core $\{p, q\}$. This directly threatens $(\star)$, not just collision forcing.

## Pro's conclusion

> "The global bound $(\star)$ might still be true by a different charging argument, but this particular forcing step is refuted by the packet-separated repeated-core strategy above."

Pro explicitly flags that the charging lemma (backward through same-prime prehistory + packet structure) cannot close the gap as framed. Tool 2 gives small witnesses, which is what Prolonger exploits — it doesn't force the prehistory bound.

## What's refuted vs. what might survive

- **Collision forcing lemma (as stated):** refuted.
- **Bounded-branching backward charging (the proposed proof strategy):** invalid for this framing.
- **$(\star)$ itself:** under threat. The construction seems to scale.
- **Packet absorption machinery (Lemma A, all-depth tail):** still rigorous as a static analytic result, but may not combine with game-side constraints to close the main game.

## What's needed next

Either:
1. **Strengthen the freshness definition** to also exclude Prolonger pre-kills (not just Shortener claims). If freshness of $E_i$ requires "$D \subset E_i$ is itself legal at time $t$", the construction fails because $F_1$ killed $D$. But this changes the game: it's unclear if this stricter freshness is what's needed for the state inequality.

2. **Find a different charging argument** that bounds $\sum_D J(D)$ directly without passing through collision forcing. Possibly via counting distinct Prolonger moves per fixed non-local core, or a budget argument on Prolonger's total prime resources.

3. **Accept that $(\star)$ may be false** and the route via packet absorption is dead; refocus on the dense regime (which has audit gaps but is a distinct path).

4. **Reconsider the problem's trajectory.** Possibly $L(n) \ne o(n)$ at the $n/\log\log\log n$ rate — the refutation would be forcing us to this conclusion.

---
id: R40-pro-collision-forcing-reduction
type: research
date: 2026-04-19
intent: >
  Push the localization beyond R39's static side; reduce the remaining
  dynamic gap to a collision-forcing lemma and attempt Lemma C partial.
predecessors: [R39-pro-dyadic-packet-absorption-static, R40-codex-packet-formulation-sharpening]
action:
  kind: extends
  target: R39-pro-dyadic-packet-absorption-static
claim: >
  All-depth packet tail bound proved analytically. Remaining dynamic
  game-side gap reduced to a single collision-forcing lemma: sigma^star
  must force a collision between two dyadic-cell packets within O(h) steps
  whenever Prolonger accumulates more than N_h/h^2 useful scores.
  Lemma C (packet collision in the main game) proved in a partial case.
---

# Round 40 Pro (localization push) — all-depth packet tail + reduction to collision forcing + Lemma C partial

## Status: analytic side strictly stronger; localization reduced to one concrete dynamic lemma

Continuation of R39 Pro #2's dyadic-packet static absorption. Pro pushes the localization as far as the analytic side allows:

1. All-depth packet collision tail (Lemma A): $\mu(\mathrm{coll}(S) \ge s) \ll_s N_h (c^2/h)^s$.
2. Reduction of localization to a concrete collision forcing lemma.
3. Partial Lemma C under a mild "low-window shielding property" hypothesis.

The remaining step is a single, well-specified dynamic statement; Pro asks for the main-game legality rules to attempt it formally.

## 1. All-depth packet collision tail (Lemma A)

For packets $\Pi$ = union of $c$ consecutive microcells, $\beta(\Pi) = \sum_{p\in\Pi}1/p$, $m_\Pi(S) = |S\cap\Pi|$, $\mathrm{coll}(S) = \#\{\Pi : m_\Pi(S) \ge 2\}$.

**Lemma A.** For every integer $s \ge 1$,
$$\mu(\mathrm{coll}(S) \ge s) \ll_s N_h \left(\frac{c^2}{h}\right)^s.$$

**Proof.** Elementary symmetric-sum bound plus second-moment: distinct packets $\Pi_1, \ldots, \Pi_s$ each forced to contribute at least 2 primes gives
$$\sum_{|S|=h,\ m_{\Pi_i}\ge 2\ \forall i}\mu(S) \le \prod_i \frac{\beta(\Pi_i)^2}{2} \cdot \frac{H^{h-2s}}{(h-2s)!}.$$
Sum over $s$-tuples $\le (\sum_\Pi \beta(\Pi)^2)^s \ll (c^2/h)^s$. At central rank $H \asymp h$, $H^{h-2s}/(h-2s)! \asymp_s N_h$. Combine. ∎

**Interpretation.** Collision packets are exponentially suppressed in $s$. $s=1$ costs $c^2/h$; $s=2$ costs $c^4/h^2 \ll N_h/\log h$ at central rank; higher $s$ exponentially smaller.

## 2. Constant-multiplicity corollary matches Codex's maxima

Outside the $s=1$ tail: $\mathrm{Pairs}_c(S) = 0$. Inside $s=1$ but no $m_\Pi \ge 3$: $\mathrm{Pairs}_c(S) = 2$. If some $m_\Pi \ge 3$: $\mathrm{Pairs}_c(S) \ge 6$.

**Exact match to observed empirical maxima:**
- **4** = sliding-window double-count of one collision $(2\mapsto 4)$
- **6** = one packet with 3 primes: $3\cdot 2 = 6$ ordered pairs

Triple occupancy is part of the $s=1$ tail with stronger exponent — its mass is $\ll N_h/h^2$, already absorbed.

## 3. Reduction B — localization from collision forcing

**Target:** $\sum_{D\supseteq\{p,q\},\ |D|=h-2} J(D) \ll N_h/\log h$ for non-local $(p,q)$.

**Reduction:** Suppose the following dynamic statement holds for some fixed $s \ge 2$, $c = O(1)$:

> **Collision forcing lemma (dynamic).** Whenever a defect-2 certificate $D$ containing a non-local pair has $J(D) \ge 1$ outside the R35 high-window entropy tail, the supporting scored moves realizing those future useful facets create **at least $s$ distinct collision packets** in the rank-$h$ supports.

Then by Lemma A, the mass of such events is $\ll_s N_h(c^2/h)^s \ll N_h/\log h$ for $s \ge 2$ at central rank. Localization target proven.

## 4. Lemma C — static demand ⟹ collision packet (under mild hypothesis)

**Low-window shielding property** (assumed):
> Every fresh useful top facet $E$ outside the R35 high-window tail is shielded by a Prolonger score with replacement prime in the same dyadic packet as the missing prime, and that packet contains at least two distinct primes used across the history.

**Lemma C.** Under this property, for any fixed defect-2 certificate $D$: if $J(D) \ge 3$, then along the scores realizing those $J(D)$ events, either:
- some packet has $m_\Pi \ge 3$ (triple occupancy), OR
- there are at least 2 distinct packets with $m_\Pi \ge 2$.

**Proof sketch.** Each $J(D)$ event adds a distinct extra prime $r$ to $D$ forming $E = D \cup \{r\}$. Packet-local shielding forces $r$ to come from a packet containing ≥2 distinct primes used in history (packet collision). Three such events ⟹ either same packet (triple occupancy) or at least two distinct packets.

**Consequence.** $J(D) \ge 3$ implies membership in packet tail $\mathcal T_c$.

## 5. What's still missing: main-game collision forcing

The remaining step Pro cannot complete without the main-game legality model:

> **Main-game collision forcing (to prove).** For any defect-2 certificate $D$ containing primes from two distinct dyadic packets, if Prolonger realizes $J(D) \ge 3$ fresh useful top facets containing $D$ outside the R35 tail, then Prolonger must have created either a triple occupancy or two distinct collision packets somewhere in the scored supports realizing those facets.

This is the quantitative "divisors are not private" statement in packet-local, collision-counting form.

If proven:
- Non-local $J(D) \ge 3$ contributions live inside $\mathcal T_c$ with mass $\ll N_h c^4/h^2$.
- $J(D) \le 2$ outside the tail, giving the observed constant multiplicity.
- Non-local contributions $\ll N_h/h^2 \ll N_h/\log h$: localization done.
- Combined with R35 static estimate + pair-first charging + dense-packet projection lemma: $L(n) \ll n/\log\log\log n$.

## 6. Pro's explicit ask

> "If you can supply (or formalize) the precise main-game rule that defines 'fresh useful top facet' and 'first-shielded' for defect-2 divisors, I can try to write the collision forcing lemma as a fully formal backward charging argument using same-prime prehistory (route 2) and then plug it into the analytic tail above."

Pro believes the collision forcing is "very plausibly provable by a bounded-branching backward charging argument" once the legality model is pinned down.

## Bottom line

**Pushed:**
- Analytic tail to all depths $s$ (Lemma A); strictly stronger than R39 Pro #2's $s=2$ result.
- Explains observed maxima 4, 6 exactly.
- Reduces localization to a single concrete dynamic lemma (collision forcing).
- Lemma C proves the static side under mild shielding property.

**Still open:**
- Main-game collision forcing — the dynamic statement about how Prolonger's chain of scored moves interacts with antichain legality. Requires precise legality model to formalize.

**Pro's concrete request:** supply the main-game legality rules so the final step can be attempted by bounded-branching backward charging.

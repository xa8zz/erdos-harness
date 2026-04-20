---
id: R54-pro-followup-separator-first
type: research
date: 2026-04-19
intent: >
  Determine the correct minimax response to packet-building; analyze
  separator-first strategy and hidden-packet obstruction.
predecessors: [R54-pro-followup-near-top-shadow-refuted]
action:
  kind: extends
  target: R54-pro-followup-near-top-shadow-refuted
claim: >
  Separator-first strategy identified as better than sigma^star for exposed
  packets: play a low-rank packet separator even with small harmonic degree.
  Bare cooperative sparse-design is preventable under separator-first.
  Hidden-packet / shielded-separator ambiguity is the remaining obstruction:
  Prolonger uses decoy and shield moves to hide the packet from separator-first.
---

The right minimax response is **not** harmonic-degree maximization. It is a **separator-first strategy**: when Prolonger is building a packet, Shortener should spend a move on a low-rank packet separator even if that move has tiny harmonic degree.

But this gives a third answer rather than the clean “(r_1) upper” or “(r_2) lower” closure. The bare cooperative sparse-design construction is preventable, but that does **not** yet identify a full closed-form minimax-optimal strategy for the whole game, because Prolonger can add decoy and shield moves. The named obstruction is the **hidden-packet / shielded-separator ambiguity**.

Here is the rigorous part.

Let (P) be a candidate packet, (|P|=h), and write each desired blocker as

[
b_C=\prod_{p\in P\setminus C}p,
\qquad |C|=\ell,
\qquad k=h-\ell.
]

Equivalently, let

[
B=P\setminus C,\qquad |B|=k.
]

The target property

[
\forall Q\subseteq P,\ |Q|\le q_0,\ \exists C\in\mathcal C \text{ with } C\cap Q=\varnothing
]

is exactly

[
\forall Q\subseteq P,\ |Q|\le q_0,\ \exists B\in\mathcal B \text{ with } Q\subseteq B.
]

So, before the packet design is complete, there is some small (Q\subseteq P), (|Q|\le q_0), not contained in any already-played packet blocker. If the pure separator

[
s_Q=\prod_{p\in Q}p
]

is legal, Shortener should play (s_Q). After that, no future blocker containing (Q) can ever be played, because (s_Q\mid b_C). Since no previous blocker contained (Q), the final target property for that (Q) is permanently impossible.

That is the packet-level minimax move. It deliberately ignores harmonic degree.

For a fixed exposed packet (P), this kills the sparse-design construction at once. In particular, after two distinct blocker supports (B_1,B_2\subseteq P), choose

[
p\in B_1\setminus B_2,\qquad q\in B_2\setminus B_1.
]

Then (pq) is not contained in (B_1) or (B_2). If no earlier Prolonger move has shielded (pq), then (pq) is legal for Shortener and permanently prevents any final design on (P), because the target requires some blocker containing ({p,q}).

This is the concrete strategy that (\sigma^\star) misses:

[
\boxed{\text{If a legal small packet separator exists, play it before any harmonic-degree move.}}
]

Only when no such separator exists should Shortener fall back to a mass-covering rule such as the small-prime first-hit strategy.

A toy legality check at (h=8), (q_0=2), (k=5):

[
P={2,3,5,7,11,13,17,19}.
]

Suppose Prolonger plays

[
B_1={2,3,5,7,11},\qquad b_1=2310,
]

Shortener uses a neutral filler, and then Prolonger plays

[
B_2={2,3,5,13,17},\qquad b_2=6630.
]

Then (7\in B_1\setminus B_2) and (13\in B_2\setminus B_1). Shortener plays

[
7\cdot 13=91.
]

This is incomparable with both (2310) and (6630). No existing blocker contains ({7,13}), and every future blocker containing both (7) and (13) is now illegal because it would be divisible by (91). Thus the (q_0=2) covering condition is impossible for any final packet containing those two primes.

So: **yes, the bare sparse-design construction is prevented at (O(1)) packet-response cost once the packet is exposed.**

However, this is not yet a proof of the global (O(r_1(n))) upper bound, because Prolonger is not required to expose a clean packet. Prolonger may play non-target **shields** of the form

[
z_Q=r_Q\prod_{p\in Q}p,
]

where (r_Q\notin P). Such a shield makes (s_Q=\prod_{p\in Q}p) illegal for Shortener, while (z_Q) need not be comparable with future packet blockers. The final target state allows the antichain to be “otherwise arbitrary,” so these shields are not excluded.

That is the exact reason the minimax question is not solved merely by replacing (\sigma^\star) with separator-first play.

The precise remaining finite game is this:

Prolonger, using packet primes and outside shield primes, tries to create an (h)-set (P) such that every (Q\subseteq P), (|Q|\le q_0), is either already contained in a played blocker or already shielded by a Prolonger move. Shortener, one move at a time, tries to claim an unshielded separator (s_Q) before that happens. The integer game realizes this finite hidden-packet game with (n^{o(1)}) overhead because all involved packet products have size (n^{O(1/h)}), and there are more than enough outside primes for shields.

Thus the rigorous conclusion is:

[
\boxed{
\sigma^\star \text{ is suboptimal, and the exposed sparse-design construction is preventable by separator-first play.}
}
]

But also:

[
\boxed{
\text{This does not by itself prove } L(n)=O(r_1(n)),
\text{ nor does }\sigma^\star\text{’s failure prove }L(n)\ge r_2(n).
}
]

The minimax-optimal Shortener strategy, in exact finite-game terms, is the backward-induction value strategy

[
V(A,\text{Shortener turn})=\min_{x\ legal}V(A\cup{x}),
]

and its packet component must be separator-first rather than harmonic-degree-first. What remains, after this reduction, is not the old (\sigma^\star) question; it is the hidden shielded-separator game above. That is the specific obstruction preventing a valid jump from “(\sigma^\star) fails” to either the (r_1) upper bound or the (r_2) lower bound.

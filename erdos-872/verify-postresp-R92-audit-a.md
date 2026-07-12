---
id: R92-persistence-audit-a-temporal-double-count
type: verification
date: 2026-07-12
intent: >
  Adversarial audit of the claimed arbitrary-reply persistence theorem at
  maximal-divisor scale (temporal face capacity of one ordered spoiler at
  most binom(r, floor(r/2)) tau(c); policy-robust scheduler; lower bound
  L(n) >> n / T(n)^{1+delta}).
predecessors: [R92-arbitrary-reply-persistence-claim]
action:
  kind: refutes
  target: R92-arbitrary-reply-persistence-claim
claim: >
  The argument does not hold as stated. The fixed-delta arithmetic is
  sound and the displayed numerical bound is true (it already follows
  from the established n(log log n)^2 / log n lower bound), but the
  arbitrary-reply persistence theorem and the claimed closure of the
  ordered-area no-direction are not proved.
failure_mechanism: >
  The pointwise bound (7) — at the instant a spoiler c is played, the
  active faces losing a lift number at most B_r tau(c), with
  B_r = binom(r, floor(r/2)), by fixed-time Sperner over at most tau(c)
  cores — is promoted without justification to the temporal bound (10):
  the number of faces whose exhaustion certificate ever uses c. A face
  charged to c may be a descendant created later by canonical splitting,
  born with a lift already illegal because of c; ordered revelation does
  not prevent inherited blocking, since played integers are permanent
  blockers. Either reading of Gamma(c) fails: instantaneous Gamma misses
  descendant charges (first inequality of the double count (12)
  unjustified), while lifetime Gamma is not bounded by the fixed-time
  antichain argument. Concrete diagnostic on the board n = 2310 with
  P = {2,3,5,7}, B_4 = 6: after the legal opening 2309, the reply c = 11
  permanently invalidates all fifteen integers 11 * prod(S) over nonempty
  S subset of P; rank-by-rank revelation (4, 6, 4, 1 signatures) keeps
  every instantaneous layer within the antichain width 6, yet the
  lifetime multiplicity is 15 > B_4 tau(11) = 12. Independent further
  gaps: the unweighted-to-weighted passage (12) to (13) needs an
  unproved non-overcounting packet identity (parent and descendants must
  not both be charged, against the one-carrier Omega(H^2) shadow
  obstruction); the five-step scheduler is not a complete legal strategy
  (splits treated as free bookkeeping, no fallback move when a popped
  face has no legal lift, descendants can be born exhausted, queue
  completion not shown to imply the degree cap — a missing third branch
  in the stopping dichotomy); the refinement-forest necessary condition
  (omega(t) simultaneously active minimal-root classes, Prolonger-paid,
  with dispersed ancestral mass) is neither met nor accounted; direct
  reservoir sacrifice is uncovered (on n = 2310 the legal lower move 2
  eliminates 578 live upper targets at once, so one reply can destroy
  linear reservoir mass without completing any counted exhaustion); and
  the general form (20) is overbroad — only an existential choice of
  H = T^{1+o(1)} works, not every such H. A repair needs a genuine
  hereditary lifetime lemma: faces ever charged to c bounded by
  M_r tau(c) with M_r = H^{o(1)} (M_r = 2^r would suffice arithmetically)
  plus a weighted packet identity and a complete scheduler theorem; none
  is contained in the submitted proof.
implications:
  - The numerical bound L(n) >> n / T(n)^{1+delta} is true but strictly weaker than the established lower bound, so nothing is gained even where the arithmetic is sound.
  - The ordered-area o(n) route at divisor-width cap scales remains open; the claimed closure is unsupported.
  - The maximal-divisor-scale idea has arithmetic slack for a repair (any M_r = H^{o(1)} historical factor suffices); the missing piece is a temporal/weighted no-repetition lemma.
verifiers_at_time:
  - [adversarial-audit-thread-a, refutes]
  - [adversarial-audit-thread-b, refutes]
confidence_at_time: high
strategy_dependence: independent
prompt: erdos-872/prompts/audit-R92-persistence-adversarial.md
---

# Verdict

**The argument does not hold as stated.** The first fatal break is the promotion of the pointwise bound (7) into the temporal bound (10), followed by the double count in (12). “Ordered” revelation does not prevent an already-played integer from blocking descendants created later: selected integers remain permanent blockers.

There are also independent gaps in the weighted passage (12)(\to)(13), the realizability of the queue, and the claimed two-case stopping dichotomy.

The fixed-(\delta) arithmetic in Section 3 is sound. Moreover, the displayed numerical lower bound
[
L(n)\gg_\delta \frac{n}{\mathfrak T(n)^{1+\delta}}
]
is already implied by the stronger established lower bound, so that inequality may be true even though the claimed arbitrary-reply persistence theorem has not been proved. I audited the supplied claim directly. 

## 1. Exact failure of the temporal capacity argument

For a move (c), let (\Gamma_s(c)) mean the faces active immediately before (c) is played and losing a lift at that moment.

Subject to one injectivity caveat discussed below, the proof establishes the **instantaneous** statement
[
|\Gamma_s(c)|\le B_r\tau(c),
\qquad
B_r=\binom r{\lfloor r/2\rfloor}.
]

Indeed:

1. Every such face has a core (b=\kappa(F)\mid c).
2. There are at most (\tau(c)) possible core values.
3. At that instant, the signatures over any one core form an antichain and hence have cardinality at most (B_r).

That part is fine as a fixed-time count.

But (10) needs the quite different **lifetime** assertion
[
#{F:\ c\text{ is used in the exhaustion certificate of }F}
\le B_r\tau(c).
\tag{L}
]

Nothing in the fixed-time Sperner bound proves (L). Suppose (c) is played while a parent face is active. The parent is split later, and a descendant is born with one of its lifts already illegal because of the old move (c). The same (c) can then appear in the descendant’s exhaustion certificate even though that descendant was not in (\Gamma_s(c)).

There are only two possible interpretations, and neither supports the proof:

* If (\Gamma(c)) includes only faces active when (c) was played, then the later descendant charge is absent from (\sum_j|\Gamma(c_j)|), so the first inequality in (12) is unjustified.
* If (\Gamma(c)) is redefined to include all future descendants affected by (c), the fixed-time antichain argument no longer bounds (|\Gamma(c)|).

The sentence that descending to lower shells cannot increase the number of divisors of (c) misses the issue. The number of **distinct core values** does not increase, but the same core value can be reused through multiple generations.

Thus the exact first broken implication is
[
(7)\not\Longrightarrow(10),
]
and consequently
[
q_H|\mathcal E_t|
\le \sum_{j<t}|\Gamma(c_j)|
\tag{12, first inequality}
]
has not been established.

### What would repair it

One needs a genuine hereditary lemma such as
[
#{F:\ c\text{ is charged to }F
\text{ anywhere in the entire descendant forest}}
\le M_r\tau(c),
]
where (M_r=H^{o(1)}), together with an explicit definition of face identity.

Equivalent sufficient formulations would be:

* every exhausted face has (q_H) distinct spoilers played **after that face was born**; or
* an old spoiler is inherited by at most one child at each split and has bounded total descendant multiplicity; or
* the total canonical split history per core, including regeneration, contains only (O(B_r)) chargeable faces.

The accepted statement that splitting inside one cube costs (O(B_r)) carrier moves may be useful for such a repair, but the new proof neither invokes it as a lifetime bound nor accounts for those carrier moves.

## 2. Small-board diagnostic: an old blocker kills later rank frontiers

I exhaustively checked a concrete divisibility board.

Take
[
n=2310,\qquad
\mathcal P={2,3,5,7},
\qquad B_4=\binom42=6.
]

Prolonger may legally open with (2309). Shortener may then legally play (c=11).

For every nonempty (S\subseteq\mathcal P), put
[
x_S=11\prod_{p\in S}p.
]
All fifteen (x_S) lie in ({2,\ldots,2310}), and all were legal immediately after the opening (2309). Once (11) is played, every one becomes permanently illegal.

Reveal the signatures by rank:

[
\begin{array}{c|cccc}
|S|&1&2&3&4\ \hline
#\text{ signatures}&4&6&4&1
\end{array}
]

Every individual rank is an antichain and has size at most (B_4=6). Nevertheless, the same old move (11) affects (4+6+4+1=15) signatures over time, whereas
[
B_4\tau(11)=6\cdot2=12.
]

This is not claimed as a counterexample to some stronger, unstated canonical-split invariant. It demonstrates that the two properties actually used in the proof—“the current frontier is an antichain” and “the core divides (c)”—do not imply the claimed lifetime bound. Any canonical rule forbidding this inheritance must be stated and proved.

The exhaustive search over all legal replies after (2309) found that both (11) and (2310) invalidate all fifteen queued integers. After the legal position
[
A={2309,11},
]
there are still (1049) legal upper-half integers, while the legal lower move (2) has upper-reservoir degree (525). Thus a queue can be rendered stale while the reservoir remains linear and the degree remains high. This illustrates the unproved third outcome between the two claimed cases.

A nuance: this finite example refutes (B_r\tau(c)) as a lifetime argument. It does not by itself exceed the much looser value (B_r\mathfrak T(2310)=240). The issue is that the proof of the uniform bound is invalid; testing its exact numerical truth would require the missing canonical split and regeneration rules.

## 3. The unweighted-to-weighted passage is another independent gap

Even granting a valid version of (12), the proof next asserts
[
\text{resolved shell area}
\le O(H)|\mathcal E_t|.
\tag{13}
]

This requires substantially more than “a face has (O(H)) capacity.” One must prove that:

* exhausted packets are disjoint, or at least have bounded overlap;
* a parent and its descendants are not both charged for the same area;
* partial loss spread across many non-exhausted faces is eventually closed into packets exactly once;
* regeneration does not create a second copy of already charged weight.

The phrase “dynamic splitting closes partial losses into descendant face packets” is the desired weighted theorem, not a consequence of the unweighted count.

This matters especially because the accepted one-carrier obstruction says one legal carrier can interact with (H) incomparable degree-(H) roots having combined shell shadows (\Omega(H^2)). A proof cannot simply assign (O(H)) area to an exhausted face without explaining where that (\Omega(H^2)) geometry is partitioned and how the carrier-paid refinements are counted.

So (13) needs a separate laminar-weight or conserved-mass lemma. It is not supplied by (7)–(12).

## 4. The arithmetic for fixed (\delta) is correct

Write (T=\mathfrak T(n)) and take
[
H=T^{1+\delta}
]
for fixed (\delta>0). Since
[
r=\pi(y)\le y
\le \frac{\log H}{(\log\log H)^2},
]
we have
[
\log B_r
\le r\log2
=O!\left(\frac{\log H}{(\log\log H)^2}\right).
]

Therefore
[
\begin{aligned}
\log\left(\frac{B_rT\log H}{H}\right)
&\le
-\delta\log T
+O!\left(\frac{\log T}{(\log\log T)^2}\right)
+O(\log\log T)\
&\longrightarrow-\infty.
\end{aligned}
]

Thus
[
B_rT\log H=o(H)
]
is valid for every fixed (\delta>0), assuming the scheduler may indeed use the stated rank at the working shell.

The primorial estimate is also fine:
[
\log\prod_{p\le y}p
\le \pi(y)\log y
\le y\log y
=o(\log H).
]

There remains a realizability issue: proving that the primorial itself is (<H) does not by itself show that every core–signature–lift product lies inside the relevant shell and below (n). That may follow from the accepted entry construction, but it is not demonstrated here.

### Equation (20) is overbroad

The conclusion
[
H=T^{1+o(1)}
\quad\Longrightarrow\quad
B_rT\log H=o(H)
]
is not valid for an arbitrary (o(1)) exponent.

Writing (H=T^{1+\eta(n)}), one needs roughly
[
\eta(n)\log T
\gg \log B_r+\log\log H.
]
An (\eta(n)) tending to zero too quickly does not suffice. The particular choice in (19),
[
H
=

T\exp!\left(\frac{10\log T}{\log\log T}\right),
]
does work. The correct statement is existential: **there is a choice**
[
H=T^{1+o(1)}
]
with enough overhead. It is not a generic implication for every (T^{1+o(1)}).

The maximal-divisor estimate with constant (4) is otherwise valid for sufficiently large (n). The expression involving (\tau!\left(2^{\lfloor\log_2n\rfloor}\right)) is evidently a typesetting error for
[
\tau\left(2^{\lfloor\log_2n\rfloor}\right)
=\lfloor\log_2n\rfloor+1.
]

## 5. The queue is not yet a complete legal strategy

The stated five-step scheduler does not define a move on every nonterminal position.

Several missing cases matter:

1. **A split is treated as free bookkeeping.**
   The accepted premise says canonical splitting costs carrier moves. Step 4 instead immediately inserts descendants. If splitting is physically realized by moves, Shortener acts between them and those moves must be included in (N_{\rm att}).

2. **Only “the face” is updated.**
   A single reply may affect many queued faces. Every affected task must be refreshed, split, or deleted, not merely the face most recently popped.

3. **No move is specified when a face has no legal lift.**
   Marking a face exhausted is not a Prolonger move. The algorithm must continue popping tasks during the same turn and eventually output a legal integer. If the queue empties while the game is nonterminal, no strategy is specified.

4. **Descendants can be born exhausted.**
   The accepted lift-exhaustion lemma applies to a “currently legal face.” A descendant whose lifts were already blocked by old moves is not automatically covered by that lemma.

5. **Queue completion is not shown to imply the cap.**
   “(T_X) attempts did not occur” is not logically equivalent to “the scheduler reached (\Delta_Q\le CH).” The queue might instead be stale, empty, unrealizable, or invalidated by a loss category not represented in the queue.

The claimed dichotomy therefore has a missing third branch.

## 6. The refinement-forest condition is not met or accounted for

The necessary condition says a low-area history of length (t\asymp X/h) must produce
[
\omega(t)
]
simultaneously active minimal-root classes, all Prolonger-paid, with the required ancestral-weight condition.

The scheduler proves none of the following:

[
#{\text{simultaneously active minimal-root classes}}=\omega(t),
]
[
\sum{\text{largest ancestral class weights}}=o(X),
]
or
[
\text{each class creation is charged to a counted Prolonger move}.
]

Instead, descendants are inserted for free. This is exactly where the accepted split-cost lemma should enter: either the refinements consume sufficiently many carrier moves, helping Case 1, or the scheduler must exhibit the large simultaneous refinement forest required in Case 2. The proof does neither.

The refinement theorem is not necessarily a direct contradiction—entry might happen before the full horizon—but it exposes an omitted structural branch. A narrow queue cannot simply be assumed to sustain the claimed low-area evolution.

## 7. “Arbitrary policy” is asserted rather than proved

The pointwise divisor calculation is genuinely policy-independent: it only uses
[
c\le n,\qquad \kappa(F)\mid c.
]

But the full theorem also needs the following statements to be uniform over arbitrary histories:

* ordinary failures, pair effects, and exceptional families satisfy (15);
* every reservoir loss belongs to one of the accounted categories;
* queue completion certifies the degree cap;
* the fortress prerequisites survive arbitrary intervening replies;
* stale or inherited descendants have bounded temporal multiplicity.

None follows merely from (c\le n).

An arbitrary-policy proof could argue that harmless replies only increase the game length, while every harmful reply belongs to an exhaustively controlled damage class. The proposed proof never establishes that exhaustive classification.

There is also a notation mismatch to resolve: if (\Delta_i) means the **maximum currently legal degree**, bounding incidences of the actual move (c_i) does not automatically bound (\Delta_i). If it means the degree or area caused by (c_i), it is not the “maximum-degree area” occurring in the refinement condition.

## 8. Reservoir sacrifice is not fully covered

Playing (T_X) reservoir targets certainly gives (T_X) moves. But fewer than (T_X) lower or mixed moves may remove much more than (T_X) reservoir mass.

That mass is supposed to be bounded by (TA), but (TA) depends on the invalid temporal double count and the unsupported weighted upgrade. Therefore a history in which Shortener sacrifices reservoir mass rather than repeatedly spoiling the currently popped face is not covered.

The sentence
[
\text{“Prolonger’s own carrier moves remove at most }T_X
\text{ upper targets”}
]
also needs a structural lemma. It is true if every carrier lies in the same upper-shell antichain and hence removes only itself from that reservoir. It is false for general lower carriers: on (V_{2310}), for example, the legal move (2) can eliminate (578) initially live upper-half integers. The proof must explicitly state and preserve the special upper-carrier property, or include Prolonger-caused area in the accounting.

## 9. What the computation did and did not verify

For (n\le5000), I computed
[
\mathfrak T(1000)=32,\quad
\mathfrak T(2310)=40,\quad
\mathfrak T(3000)=48,\quad
\mathfrak T(5000)=48.
]

With (\delta=\tfrac12), the literal parameter choice in the claim gives (y=1) and (r=0) throughout (1000\le n\le5000). Thus the actual asymptotic primorial scheduler is trivial at these finite board sizes; a nontrivial direct implementation “up to a few thousand” is impossible with the stated parameters. The (r=4) board above deliberately isolates the disputed temporal logic instead.

The exhaustive (V_{2310}) reply search confirms:

* the opening (2309) and reply (11) are legal;
* (11) permanently invalidates all fifteen natural rank-layer lift candidates;
* the reservoir remains linear afterward;
* a high-degree legal lower root remains;
* fixed-time Boolean width does not control cumulative rank revelation.

Because the claim never defines the canonical split map, initial task family, face identity, or regeneration rule, no exact implementation of “the scheduler” exists in the supplied text. The executable portion can be tested; the missing portion is precisely where the proof gap lies.

[Python diagnostic script](sandbox:/mnt/data/temporal_capacity_audit.py)
[Diagnostic output](sandbox:/mnt/data/temporal_capacity_audit_output.txt)

## 10. Does the displayed lower bound nevertheless hold?

Yes, but it is already a consequence of the established stronger lower bound.

Since
[
\mathfrak T(n)
\ge \tau\left(2^{\lfloor\log_2n\rfloor}\right)
\asymp\log n,
]
for fixed (\delta>0),
[
\frac{n}{\mathfrak T(n)^{1+\delta}}
\ll
\frac{n}{(\log n)^{1+\delta}}
=============================

o!\left(\frac{n(\log\log n)^2}{\log n}\right).
]

Therefore the already accepted lower bound implies
[
L(n)\gg_\delta
\frac{n}{\mathfrak T(n)^{1+\delta}}.
]

So the situation is:

* **The numerical inequality (2):** true independently, given the established lower bound.
* **The fixed-(\delta) composition arithmetic:** correct.
* **The arbitrary-reply primorial persistence theorem:** not proved.
* **The temporal Hall-capacity closure:** not proved.
* **The claim that the ordered-area no-direction is ruled out:** unsupported.

## What a skeptic should demand

A repair must provide, at minimum:

[
\boxed{
#{F:\ c\text{ is used anywhere in }F\text{’s exhaustion certificate}}
\le M_r\tau(c)
}
]
for a lifetime quantity (M_r=H^{o(1)}), including descendants and regeneration.

It must also prove a weighted, non-overcounting packet identity; count every Prolonger-paid split move; establish that the queue always outputs a legal move; prove that every premature stopping state has either the degree cap or enough already-counted moves; and verify the refinement-forest requirements.

A bound with (M_r=2^r), or (M_r=B_r\operatorname{poly}(r)), would still be (H^{o(1)}), so the maximal-divisor-scale arithmetic has enough slack for a repair. But that repair is a new temporal/weighted lemma. It is not contained in the submitted proof.

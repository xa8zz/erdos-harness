---
id: R92-persistence-audit-b-instantaneous-vs-cumulative
type: verification
date: 2026-07-12
intent: >
  Second independent adversarial audit of the claimed arbitrary-reply
  persistence theorem at maximal-divisor scale, auditing the divisor
  lemma, the weighted time-area conversion, scheduler legality, and
  adversarial simulations separately.
predecessors: [R92-arbitrary-reply-persistence-claim]
action:
  kind: refutes
  target: R92-arbitrary-reply-persistence-claim
claim: >
  The argument does not hold as stated: one spoiler's instantaneous
  B_r tau(c) capacity is incorrectly treated as a cumulative capacity
  across an adaptive refinement history. The composition arithmetic for
  fixed delta is valid and the numerical bound follows from the already
  accepted stronger lower bound, but the policy-independent persistence
  theorem and the claimed closure of the ordered-area obstruction do not
  follow.
failure_mechanism: >
  The valid instantaneous bound (A) counts faces active at the moment
  s(c) the spoiler c is played; the exhaustion double count needs the
  historical set of exhausted faces whose certificates charge c, and the
  proof silently replaces the historical set by the instantaneous one.
  A face charged to c need not have existed at s(c): a descendant born
  later by canonical splitting inherits the lost lift. Boolean refinement
  counterexample: over one core b | c, stage k activates all signatures
  S of size k, each stage an antichain of size at most
  B_r = binom(r, floor(r/2)), yet the whole history reveals 2^r distinct
  core-signature pairs — a fixed old move can spoil 2^r sequentially
  revealed signatures while meeting at most B_r simultaneously active
  ones. Realized legality stress test on n = 4000: with c = 30
  (tau = 8, claimed temporal capacity B_4 tau(30) = 48), the 8 divisor
  cores times 2^4 signatures give 128 latent lifts embedded as the
  distinct multiples 60, 90, ..., 3870 of 30, all legal immediately
  before the reply 30 after the opening 2003 and all killed by it; a
  258-move verified-antichain continuation realizes the refinement
  history, so lifetime multiplicity 128 far exceeds the claimed 48 while
  every instantaneous count stays at most 48. Additional unproved
  quantifiers: uniqueness of active faces per core-signature pair
  (packets may duplicate); the (12) to (13) weighted upgrade needs a
  packet-assignment lemma with no duplicate charging of parent and
  descendants; equation (15) asserts an exhaustive policy-uniform
  decomposition of reservoir loss that is never exhibited (direct
  reservoir sacrifice is a missing third branch of the stopping
  dichotomy); the scheduler pseudo-code cannot be independently
  implemented (initial queue, split map, merging, inheritance,
  cap-completion test and fallback rule all unspecified); the
  refinement-forest necessary condition gets only an upper bound on
  signatures per core, no lower bound on simultaneously active
  minimal-root classes; and (20) is false as written — H = T(n) itself
  is of the form T^{1+o(1)} and gives ratio at least log H, so only an
  existential version is justified. A repair replacing B_r by 2^r (or
  any C^r, still H^{o(1)}) is arithmetically viable but requires a
  historical no-repetition lemma (HIST): faces ever charged to c at most
  H^{o(1)} tau(c), with explicit descendant, regeneration and merging
  rules — not contained in the claim. Literal asymptotic parameters are
  degenerate on small boards: y >= 7 (rank r = 4) needs H of order
  10^84, so finite experiments in the thousands cannot instantiate the
  stated scheduler.
implications:
  - Same fatal break as the sibling audit, found independently — the instantaneous-to-temporal promotion at (7) to (10) and the double count (12) — a cross-convergent refutation.
  - The line-by-line table localizes what survives (primorial product H^{o(1)}, B_r = H^{o(1)}, instantaneous bound, fixed-delta arithmetic, fortress potential after valid entry) versus what fails (temporal capacity, double count, weighted conversion, scheduler completeness, policy independence, (20) as stated).
verifiers_at_time:
  - [adversarial-audit-thread-a, refutes]
  - [adversarial-audit-thread-b, refutes]
confidence_at_time: high
strategy_dependence: independent
prompt: erdos-872/prompts/audit-R92-persistence-adversarial.md
---

# Verdict

**The argument does not hold as stated.** The exact failure is the upgrade from the instantaneous incidence bound (7) to the purported temporal Hall bound (10), and hence the double count leading to (12). The proof bounds the faces active when a spoiler is played, but lift exhaustion charges that spoiler to faces that may be created later by canonical splitting. Those are different incidence relations. 

The standalone numerical inequality

[
L(n)\gg_\delta \frac{n}{\mathfrak T(n)^{1+\delta}}
]

is nevertheless true from the already accepted lower bound: since

[
\mathfrak T(n)\ge \tau!\left(2^{\lfloor\log_2n\rfloor}\right)\asymp\log n,
]

we have

[
\frac{n}{\mathfrak T(n)^{1+\delta}}
\ll
\frac{n}{(\log n)^{1+\delta}}
=o!\left(\frac{n(\log\log n)^2}{\log n}\right).
]

So what fails is not necessarily that weak numerical conclusion. What fails is the claimed new policy-independent persistence theorem and the claimed closure of the ordered-area obstruction.

## 1. The exact temporal error

Let (s(c)) be the time when the opposing move (c) is played. The proof establishes, at best,

[
\Gamma_{s(c)}(c)
================

\left{
F:\ F\text{ is active at }s(c)
\text{ and loses a lift when }c\text{ is played}
\right},
]

and, assuming that an active face is uniquely determined by its core and signature,

[
|\Gamma_{s(c)}(c)|\le B_r\tau(c).
\tag{A}
]

That is an **instantaneous** bound.

The exhaustion double count instead needs

[
\widehat\Gamma_t(c)
===================

\left{
F\in\mathcal E_t:\ c
\text{ is one of the earlier moves charged to the exhaustion of }F
\right}.
]

For an exhausted face (F), the accepted lift-exhaustion lemma gives (q_H) distinct earlier moves, so the valid first step would be

[
q_H|\mathcal E_t|
\le
\sum_{c\text{ played before }t}
|\widehat\Gamma_t(c)|.
\tag{B}
]

The proof then silently replaces (\widehat\Gamma_t(c)) by (\Gamma_{s(c)}(c)). There is no justification for

[
|\widehat\Gamma_t(c)|
\le
|\Gamma_{s(c)}(c)|.
]

Indeed, a face charged to (c) may not have existed when (c) was played. It can be a descendant created much later, carrying an already unavailable lift because of (c).

This produces an unavoidable definitional fork:

* If an “incidence caused by (c)” means a loss occurring when (c) is played, then (A) may be true, but a later-born descendant cannot count (c) among its (q_H) exhaustion incidences.
* If descendants are allowed to count inherited earlier spoilers, then lift exhaustion can use (c), but (A) is not a cumulative bound on how many descendants can use it.

“Ordered” chronology does not resolve this. It is precisely what creates the discrepancy.

### A Boolean refinement counterexample to the inference

Fix one core (b\mid c). At refinement stage (k), let the active signatures be

[
\mathcal A_k(b)={S\subseteq[r]:|S|=k}.
]

At every stage, (\mathcal A_k(b)) is an antichain and

[
|\mathcal A_k(b)|=\binom rk\le B_r.
]

But over the whole refinement history,

[
\left|\bigcup_{k=0}^{r}\mathcal A_k(b)\right|
=============================================

2^r.
]

A fixed old move (c) can therefore be an inherited spoiler for (2^r) sequentially revealed signatures even though it meets at most (B_r) simultaneously active signatures.

Thus the stated facts imply at most an instantaneous (B_r) bound, not a historical one. The sentence claiming that the argument is “unaffected by when the face was created or split” is exactly where the temporal issue is assumed away.

There is an additional, earlier multiplicity assumption: the argument also needs at most one active face for each pair ((b,S)). Merely saying that faces have one of (B_r) signatures does not bound their number if multiple packets can carry the same core and signature.

## 2. A possible repair—and what it would still require

If the canonical splitter has the stronger property that:

1. every face is uniquely identified by ((\kappa(F),\sigma(F)));
2. no such pair is ever recreated; and
3. refinement is acyclic,

then one obtains the weaker historical bound

[
|\widehat\Gamma_t(c)|\le 2^r\tau(c),
\tag{C}
]

rather than (B_r\tau(c)).

Importantly, that loss is asymptotically harmless here:

[
2^r
\le
\exp!\left(
O!\left(\frac{\log H}{(\log\log H)^2}\right)
\right)
=======

H^{o(1)}.
]

Consequently,

[
\frac{2^r\mathfrak T(n)\log H}{H}=o(1)
]

still holds when (H=\mathfrak T(n)^{1+\delta}).

So the simple chronology objection does not automatically kill the maximal-divisor-scale idea. It does kill the proof as written. To repair it, the researcher must prove a genuine **historical no-repetition lemma**, such as

[
#{F\text{ ever charged to }c}
\le M_r\tau(c),
\qquad M_r=H^{o(1)}.
\tag{HIST}
]

Possible valid forms would be:

* all descendants charged to (c) lie in one fixed antichain over the entire history;
* every core-signature pair occurs at most once, giving (M_r\le2^r);
* or inherited charges are conserved at the ancestor-packet level rather than copied to every descendant.

None of these is proved in the claim. If identical core-signature packets can be regenerated, even (2^r\tau(c)) is unavailable.

## 3. Line-by-line status

| Step                                             | Assessment                                                                                                                                                                                                                             |                 |                                                                                                                 |
| ------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------- | --------------------------------------------------------------------------------------------------------------- |
| Primorial product is (H^{o(1)})                  | Correct. Since (y=\log H/(\log\log H)^2), (y\log y=o(\log H)).                                                                                                                                                                         |                 |                                                                                                                 |
| (B_r=H^{o(1)})                                   | Correct. In fact (\log B_r\le(\log2)\log H/(\log\log H)^2).                                                                                                                                                                            |                 |                                                                                                                 |
| Instantaneous (                                  | \Gamma(c)                                                                                                                                                                                                                              | \le B_r\tau(c)) | Correct only if active faces are unique by core and signature and all affected faces satisfy (\kappa(F)\mid c). |
| Equation (10), temporal capacity                 | Not proved; false from instantaneous Sperner width alone.                                                                                                                                                                              |                 |                                                                                                                 |
| Double count in (12)                             | Invalid because it counts historical exhaustion incidences using instantaneous (\Gamma(c_j)).                                                                                                                                          |                 |                                                                                                                 |
| Face count to weighted shell area, (12)(\to)(13) | Also needs a new packet-assignment lemma: every resolved target must be assigned to an exhausted descendant of capacity (O(H)), with inherited/partial losses not duplicated.                                                          |                 |                                                                                                                 |
| Equation (15)                                    | Asserted “by hypothesis,” but the proof does not exhibit a policy-uniform exhaustive decomposition covering direct reservoir sacrifice and self-spoiling by Prolonger carriers.                                                        |                 |                                                                                                                 |
| Fixed-(\delta) composition arithmetic            | Correct, conditional on a valid (H^{o(1)}) historical incidence factor.                                                                                                                                                                |                 |                                                                                                                 |
| Specific choice in (19)                          | Correct asymptotically.                                                                                                                                                                                                                |                 |                                                                                                                 |
| General statement (20)                           | False as written. Not every (H=\mathfrak T(n)^{1+o(1)}) works; (H=\mathfrak T(n)) itself is of that form, but gives a ratio at least (\log H), not (o(1)). It should say that **there exists** a suitable (H=\mathfrak T(n)^{1+o(1)}). |                 |                                                                                                                 |
| Elementary divisor estimate (3)                  | Correct for sufficiently large (n); the constant (4) is safe.                                                                                                                                                                          |                 |                                                                                                                 |
| Fortress potential after valid entry             | Correct from the accepted theorem. The unresolved issue is obtaining the required entry position.                                                                                                                                      |                 |                                                                                                                 |

For the fixed-(\delta) arithmetic, writing (T=\mathfrak T(n)),

[
\begin{aligned}
\log!\left(
\frac{B_rT\log H}{H}
\right)
&\le
-\delta\log T
+
O!\left(\frac{\log T}{(\log\log T)^2}\right)
+
O(\log\log T)\
&\longrightarrow-\infty.
\end{aligned}
]

So the arithmetic is not the weak link.

## 4. Policy independence is only established for the divisor count

The argument

[
\kappa(F)\mid c
\quad\Longrightarrow\quad
#{\kappa(F)}\le\tau(c)\le\mathfrak T(n)
]

does not use maximum-degree or minimal-legal play. That part is genuinely policy-independent.

But the whole proof is policy-independent only if all of the following are uniform over arbitrary legal replies:

* the orientation (\kappa(F)\mid c);
* the removal of ordinary failures, pair effects and exceptional families;
* the weighted target-loss decomposition;
* the implication “scheduler completion (\Rightarrow \Delta_Q\le CH)”;
* and the claim that no other kind of opposing reply can destroy significant reservoir mass.

Those quantifiers are not checked.

There is also a potential ambiguity in (\Delta_i). If (\Delta_i) means the degree or area of the **actual** opposing move, then it is not the same quantity as the “accumulated maximum-degree area” appearing in the refinement-forest condition. If (\Delta_i) means the current maximum legal degree, then counting incidences of the actual replies (c_i) does not by itself control it unless the incidence estimate is separately proved for every currently legal potential reply. The proof does not clarify this distinction.

## 5. The scheduler is not yet a complete game strategy

“Scan for the first currently legal lift” ensures that a selected integer is legal **provided one exists**. It does not prove that the queue always supplies one.

Several histories are not covered by the stated two cases:

1. Every queued face has become exhausted by inherited old blockers, so the scheduler performs only bookkeeping and has no integer to play.
2. The queue empties while a legal root of degree (>CH) remains elsewhere.
3. A Prolonger carrier makes lifts in many other queued faces illegal.
4. A split creates descendants all of whose lifts are already illegal under the full previous history.
5. Shortener kills reservoir mass directly without producing the kind of completed face exhaustion counted in (12).

Marking faces exhausted is not itself a game move. A complete online strategy must specify a legal fallback move whenever the game has not ended, and prove that queue exhaustion implies either the degree cap or the required number of already played moves.

The supplied pseudo-code also does not specify enough to be independently implemented:

* the initial queue;
* the integer represented by a core, signature and lift prime;
* the exact split map;
* whether identical descendants are merged;
* whether old spoilers are inherited or recharged;
* the cap-completion test;
* and the fallback rule.

Therefore a faithful adversarial execution of “the canonical scheduler” cannot be reconstructed from the claim alone.

## 6. Refinement-forest check

The proof does not verify the accepted necessary condition.

In a branch with

[
t\asymp X/H,\qquad |R_t|\gg X,\qquad \sum_{i<t}\Delta_i=o(X),
]

one must have:

[
\omega(t)
]

simultaneously active minimal-root classes, together with the required ancestral-mass dispersion.

The scheduler analysis provides only an **upper** bound on signatures per core. It gives no lower bound on:

* the number of simultaneously active minimal-root classes;
* the amount of branching actually realized;
* the number of distinct ancestral classes;
* or the sum of their largest surviving descendants.

A FIFO/colex order by itself establishes none of these. If each cross-spoil creates only (O(1)) new live classes, the queue has only (O(t)) classes and violates the necessary condition. If one split creates (B_r) descendants, the proof must explain how those classes are Prolonger-paid and why their ancestral masses have dispersed sufficiently.

This is not automatically a contradiction in Case 1, because that branch stops after counting (T_X) moves without asserting linear survival. It is a genuine missing consistency argument for any Case 2 history whose entry time is comparable to (X/H).

## 7. Reservoir sacrifice is a missing third branch

The stated dichotomy is:

* (T_X) carrier attempts occur; or
* the scheduler reaches the cap while retaining a linear reservoir.

That is not exhaustive until one proves that every significant reservoir loss is included in the time–area accounting.

A Shortener move can instead sacrifice reservoir mass without fully exhausting one of the active faces used in (12). Then:

* (|\mathcal E_t|) may remain small;
* the reservoir may lose (\Theta(X)) mass;
* and the scheduler may neither reach the cap nor survive for (T_X) attempts.

Equation (15) is where this third possibility is supposed to disappear, but it is only asserted. The proof needs a policy-uniform partition or injective charging statement of the form

[
R_0\setminus R_t
\subseteq
D_{\rm cross}\cup
D_{\rm ordinary}\cup
D_{\rm pair}\cup
D_{\rm exceptional}\cup
D_{\rm Prolonger}\cup
D_{\rm exact},
]

with each term quantitatively controlled. Without that, (22) does not imply (23).

The accepted one-carrier-loss obstruction makes this especially nontrivial: a legal carrier can interact with many roots and a much larger aggregate shadow. Merely counting one played carrier as one removed upper target does not account for all structural reservoir damage unless a separate same-shell argument proves that those shadows are irrelevant to (R).

## 8. Computational checks

### Literal asymptotic parameters are degenerate on small boards

I computed (\mathfrak T(n)), (H=\mathfrak T(n)^{1+\delta}), (y), (r=\pi(y)), (B_r), and the ratio in (17).

For (\delta=1):

|     (n) | (\mathfrak T(n)) |    (H) | (y) | (r) | (\frac{B_r\mathfrak T(n)\log H}{H}) |
| ------: | ---------------: | -----: | --: | --: | ----------------------------------: |
|  (1000) |             (32) | (1024) | (1) | (0) |                             (0.217) |
|  (3000) |             (48) | (2304) | (1) | (0) |                             (0.161) |
|  (4000) |             (48) | (2304) | (1) | (0) |                             (0.161) |
| (10000) |             (64) | (4096) | (1) | (0) |                             (0.130) |

Thus, at boards of a few thousand, the claimed formula gives no nontrivial primorial coordinate set at all. On the large-(H) branch, obtaining (y\ge7), enough for (r=4), requires approximately (H\gtrsim10^{84}). Finite experiments at (n) in the thousands necessarily test an abstracted fixed-rank scheduler, not the literal asymptotic parameter choice.

### Explicit chronology stress test on (n=4000)

I tested the exact logical gap using actual divisibility legality.

Take

[
r=4,\qquad B_4=6,\qquad c=30,\qquad \tau(30)=8.
]

The claimed temporal capacity is

[
B_4\tau(30)=48.
]

Use the eight divisors (b\mid30). At refinement level (k=0,\dots,4), activate all pairs

[
(b,S),\qquad |S|=k.
]

The active-face counts are

[
8,\ 32,\ 48,\ 32,\ 8.
]

At every instant, the signatures over each fixed core form a Boolean level and hence an antichain; the simultaneous total never exceeds (48).

Across the whole history, however, there are

[
8\cdot2^4=128
]

distinct core-signature pairs.

I embedded the lost lifts into the board by assigning them the distinct integers

[
60,90,120,\ldots,3870,
]

all multiples of (30). Start with Prolonger playing (2003), followed by the legal Shortener reply (30). Every assigned lift was legal immediately before (30) and became illegal when (30) was played.

Each task was also given a distinct legal alternative in ((2000,4000]) not divisible by (30). Subsequent replies were chosen from the same upper shell. The resulting prefix contained 258 moves and was verified to remain an antichain throughout:

* distinct integers in ((2000,4000]) cannot divide one another;
* none of them was divisible by (30);
* hence all were incomparable with the chosen (30).

I also exhaustively scanned every legal reply after the opening (2003). For this predetermined pool of 128 latent first lifts, the maximum possible immediate score was 128, and (c=30) was among the maximizing replies.

This computation is not asserted to reproduce an unstated canonical arithmetic relation between signatures and lifts. It shows something more basic: **the properties actually invoked in the proof—core divisibility and instantaneous antichain width—do not imply the temporal bound.** A stronger canonical invariant is indispensable.

## 9. What a valid repair must contain

The maximal-divisor-scale result could plausibly be repaired, because replacing (B_r) by (2^r), (3^r), or any (C^r) still gives (H^{o(1)}). But the repaired proof needs all three components:

1. **Historical incidence control**
   [
   #{F\text{ ever charged to }c}\le H^{o(1)}\tau(c),
   ]
   with explicit handling of descendants, packet copies, regeneration and merging.

2. **Policy-uniform mass accounting**
   proving that arbitrary reservoir sacrifice, ordinary failures, pair effects, self-spoiling and exact-target plays exhaust all ways targets can disappear.

3. **A complete scheduler theorem**
   proving legality on every history, specifying fallback moves, showing completion implies (\Delta_Q\le CH), and verifying the refinement-forest requirement in any low-area persistence branch.

Without these, the proof has not closed the ordered-multiplicity gap.

# Bottom line

* **Boxed instantaneous bound (7):** conditionally valid.
* **Boxed temporal bound (10):** not established and false from the stated premises.
* **Double count (12):** therefore invalid.
* **Composition arithmetic for fixed (\delta):** valid.
* **Equation (20):** overstated; only an existence statement can be justified.
* **Policy-independent scheduler and dichotomy:** not proved.
* **Numerical lower bound:** already follows from the stronger accepted lower bound.
* **Claimed closure of the ordered-area no-direction:** does **not** follow.

The weakest link is the exact lemma the claim presents as solved: **one spoiler’s instantaneous (B_r\tau(c)) capacity is incorrectly treated as a cumulative capacity across an adaptive refinement history.**

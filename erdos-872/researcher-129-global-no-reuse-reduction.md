---
id: R129-global-no-reuse-reduction
type: research
date: 2026-07-12
intent: >
  Prove or disprove the repaired aggregate-excess halving statement
  (AE-dagger): with H^6 = o(n) and uniformly closed outer quantifiers,
  a fully specified Shortener policy halves the aggregate excess
  potential R(t) = sum_{X >= H^6}(q_X - ceil(4X/h^2))_+ within
  C M log h / h + K log n turns whenever R = M > 0, against every
  Prolonger strategy, with mandatory succession.
predecessors: [R128-aggregate-excess-parameter-witness]
action:
  kind: extends
  target: R128-aggregate-excess-parameter-witness
claim: >
  (AE-dagger) is neither proved nor disproved; its nondegeneracy after
  the parameter repair is confirmed (empty-shell witness gone, ticket
  process nonvacuous, genuine trajectory-level rate theorem). New
  reductions: (1) baseline lemma — from any state with R = M > 0,
  playing any legal proper divisor of any excess target deletes at
  least one unit of R per turn, so halving within ceil(M/2) turns is
  unconditional and the K log n term disposes of all M = O(log n);
  the entire content of (AE-dagger) is the rate H/log H per turn for
  large tickets. (2) Accumulated-area reformulation: with Delta_i* the
  best available single-move aggregate deletion, a non-halved ticket of
  mass M after T turns forces sum_{i<T} Delta_i* < M/2, so a proof is
  exactly a theorem excluding every reachable interval of length
  ~ M log H/H during which R stays above M/2 while accumulated global
  maximum-degree area stays below M/2 — an interval-exclusion, not an
  endpoint-degree statement. (3) The precise missing positive
  ingredient is a GLOBAL NO-REUSE LEMMA: a fixed policy and a
  normalized historical debt potential Phi such that on every reachable
  interval with R > M/2: failure of available high-degree moves to
  delete M/2 creates Omega(M) permanent debt; each Prolonger move
  creates only O(1) net new debt over its ENTIRE future refinement
  history; debt resolved by deletion or transfer is charged once; and
  baseline/boundary error is o(M) + O(log n). Since a ticket contains
  only o(M) + O(log n) Prolonger moves, the lemma forces halving.
  Frozen repair theorems fail exactly item 2 (direct-ancestor insertion
  jumps the repair potential by the mass of many unrelated structures).
  (4) A disproof requires forcing, against EVERY complete policy, an
  on-trajectory interval where each adversarial move repeatedly
  protects Omega(H/log H) fresh excess targets that neither die nor
  transfer to the minimal/exact-only bank — off-policy fortresses,
  prelude-consumable fans, and shadow constructions (which decrease R
  through minimal-transfer) all lack this quantifier strength.
implications:
  - Seventh independent concurrence on the chronological separator, now
    in checkable four-item lemma form; targeted dispatches can attack
    the Global No-Reuse Lemma directly.
  - Shadow-type lower-bound constructions inherently reduce R via
    minimal-bank transfer; disproof attempts must protect excess
    targets from BOTH death and transfer.
verifiers_at_time: []
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/researcher-R129-ae-dagger.md
---

## Verdict

\[
\boxed{\text{I do not obtain a valid unconditional proof or disproof of }(\mathrm{AE}^{\dagger}).}
\]

After imposing \(H(n)^6=o(n)\) and closing the quantifiers uniformly, the empty-shell witness is gone, the ticket process is nonvacuous, and the resulting assertion is a genuine trajectory-level rate theorem. The supplied results identify several necessary mechanisms, but none proves the required rate, and none supplies an arbitrary-policy Prolonger counterstrategy. Claiming either truth value would require inserting precisely the global chronological lemma that remains unproved in the record. 

What follows is the exact reduction showing where a proof or disproof must occur.

## 1. The closed statement and its negation

The repaired statement has the quantifier form

\[
\exists H,\sigma,C,K,N\quad
\forall n\ge N\quad
\forall\Pi\quad
\forall t\ge b,
\]

where

\[
H(n)\longrightarrow\infty,
\qquad
H(n)^6=o(n),
\]

\(\sigma\) is one completely specified Shortener policy, \(\Pi\) is an arbitrary Prolonger strategy, \(b\) is the prescribed post-trapping baseline, and

\[
R(t)=M>0
\]

must imply that, after at most

\[
T(M,n)
=
C M\frac{\log H}{H}+K\log n
\tag{1}
\]

further Shortener turns,

\[
R\le \frac M2.
\tag{2}
\]

Its exact negation is therefore:

> For every candidate \(H,\sigma,C,K\) satisfying the parameter conditions, there are arbitrarily large \(n\), a Prolonger strategy \(\Pi\), and an on-policy reachable ticket time \(t\) such that \(R(t)=M>0\) and
> \[
> R(t+s)>\frac M2
> \]
> throughout the first \(T(M,n)\) subsequent Shortener turns.

This quantifier order explains why an obtainable fortress, a bad frozen configuration, or a history defeating one familiar policy is not a disproof. The bad ticket state must be forced against the particular complete policy \(\sigma\) being tested.

## 2. An unconditional baseline bound

There is one elementary rate bound that always holds.

### Lemma

From any state with \(R=M>0\), Shortener can reduce \(R\) to at most \(M/2\) in at most \(\lceil M/2\rceil\) of her turns.

### Proof

Because \(R>0\), some shell \(X\) satisfies

\[
q_X>\left\lceil\frac{4X}{H^2}\right\rceil.
\]

Choose a target \(u\in Q_X\). By definition, \(u\) is nonminimal and legal, so it has a legal proper divisor \(d\). Shortener may play \(d\). This makes \(u\) illegal, and hence decreases \(q_X\), and therefore \(R\), by at least one.

Repeating gives one unit of aggregate-excess deletion per Shortener turn until \(R\le M/2\). ∎

Thus the \(K\log n\) term automatically handles \(M=O(\log n)\). The substantive demand in \((\mathrm{AE}^{\dagger})\) is the factor

\[
\frac{\log H}{H}=o(1):
\]

for larger tickets, Shortener must average approximately

\[
\Omega\!\left(\frac{H}{\log H}\right)
\tag{3}
\]

units of aggregate-excess deletion per turn, rather than merely one.

## 3. The exact accumulated-area formulation

Index the post-baseline Shortener turns during a ticket by \(i=0,1,\ldots\), and let \(A_i\) be the position immediately before Shortener’s \(i\)-th move. Define the best current aggregate deletion

\[
\Delta_i^\star
=
\max_{x\text{ legal at }A_i}
\bigl(R(A_i)-R(A_i\cup\{x\})\bigr).
\tag{4}
\]

Suppose Shortener uses a policy that chooses a maximizer in (4), with fixed tie-breaking and the necessary batch guards. Prolonger’s moves can only decrease \(R\), so they are helpful for this calculation.

If a ticket of mass \(M\) has not halved after \(T\) Shortener turns, then necessarily

\[
\sum_{i<T}\Delta_i^\star<\frac M2.
\tag{5}
\]

For

\[
M\gg \log n
\]

and \(T\) as in (1), this says that the average available aggregate deletion was at most

\[
\frac1T\sum_{i<T}\Delta_i^\star
<
\left(\frac{1}{2C}+o(1)\right)\frac{H}{\log H}.
\tag{6}
\]

Consequently, a proof of \((\mathrm{AE}^{\dagger})\) is exactly a theorem excluding every reachable interval of length

\[
\asymp M\frac{\log H}{H}
\]

during which \(R\) stays above \(M/2\) while the accumulated global maximum-degree area remains below \(M/2\).

Conversely, a disproof must force such a low-area interval against every complete Shortener policy.

That is the precise unresolved separator. It is not an endpoint-degree statement.

## 4. Why the positive facts do not prove the accumulated-area bound

### Static completion and static covering have the wrong normalization

The accepted theorems provide a cover or maximal completion of size \(o(n)\). A ticket may have

\[
\log n\ll M\ll n.
\]

For such a ticket, \((\mathrm{AE}^{\dagger})\) needs a relative bound of order

\[
O\!\left(M\frac{\log H}{H}\right),
\tag{7}
\]

not merely an absolute \(o(n)\) bound.

Moreover, even a small static cover is not automatically executable. Prolonger may play one carrier that is comparable with many members of the cover while remaining incomparable with the targets those members covered. Recomputing the cover can then generate new covers. This is the quadratic-regeneration and direct-ancestor obstruction.

### Positive-density degree availability does not control sublinear excess

Degree availability applies when a positive fraction of the whole upper half remains live. Aggregate excess may instead be concentrated in one or more sublinear shells, or may exceed the shell floors by only a sublinear amount.

Thus a move deleting \(r(n)\to\infty\) targets at positive density does not imply the scale-sensitive deletion rate \(H/\log H\) throughout every ticket.

### Frozen witness estimates are not chronological capacity estimates

The all-orders witness inequality controls a fixed depleted family. It does not imply that every later insertion changes the optimal repair potential by only \(O(1)\), or even \(O(\tau(c))\).

A direct-ancestor move can invalidate many latent faces simultaneously. The same move can also reappear through successive refinements. This is exactly why an instantaneous incidence bound cannot be promoted to a lifetime bound.

The missing positive theorem is therefore a **global historical no-reuse or Lipschitz principle**: one needs a normalized debt potential for which each actual Prolonger move can save only bounded total aggregate mass over its entire future refinement history. No such potential is supplied.

### “Choose \(H\) slowly” does not repair the gap

For every fixed number of regeneration layers, repeated static completion does give \(o(n)\). But its modulus can depend arbitrarily badly on the number of layers. At the same time, the number and resolution of the structures that must be controlled grows with \(H\).

There is no supplied quantitative relation ensuring that the modulus required to control the first \(j\) layers is compatible with a choice of \(H\) for which \(j\) is at least the depth demanded by that same \(H\). This is the familiar coupled-modulus obstruction: two separate little-\(o\) assertions cannot simply be composed by declaring that \(H\) grows slowly.

## 5. Why the negative constructions do not disprove the statement

### An off-policy fortress has the wrong quantifiers

A capped primorial fortress would resist rapid deletion once reached. But \((\mathrm{AE}^{\dagger})\) quantifies existentially over Shortener policies and only over states reachable against that policy.

The fixed-density clearing sweep prevents entry into a positive-density bounded-cap fortress at sufficiently low cap. Thus an off-path fortress does not supply the required

\[
\forall\sigma\ \exists\Pi
\]

forcing theorem.

### Fan and matching lower bounds can occur before the baseline

A blocked-root fan such as

\[
\{qp:p\in\mathcal P\}
\]

may indeed require essentially one move per target once \(q\) has been preempted and each \(p\) is private. This explains known sublinear lower bounds.

But the trapping prelude is itself permitted \(o(n)\) moves. A sublinear fan can be consumed, transferred to the minimal bank, or played during that prelude. To refute \((\mathrm{AE}^{\dagger})\), one must force a comparable private reservoir after the prescribed baseline and keep it globally significant until a ticket begins. The known fan constructions do not have that quantifier strength.

### Private-carrier drafting controls raw or surviving shadow, not \(R\)

Private carriers can force a linear proper-multiple shadow, and even a linear legal surviving shadow, against every first-layer ordering. But blocking a root can make many descendants minimal legal. Such a transfer decreases \(q_X\) and therefore decreases \(R\), even though it may preserve many future legal moves.

Hence

\[
\text{large legal shadow}
\not\Longrightarrow
\text{large surviving aggregate excess}.
\]

The supplied construction exposes only a sublinear next minimal layer because of its cone quotient structure.

### Fresh-batch persistence starts after activation

Once a sufficiently fresh batch is activated, Prolonger’s persistence theorem is robust. It does not show that some such batch must remain fresh against the candidate Shortener policy before first activation.

Advance depletion is the entire unresolved entry problem. Using persistence as though it supplied entry would reverse the player quantifiers.

## 6. The precise missing lemma

A positive resolution would follow from a global chronological statement of the following form.

> **Global no-reuse lemma.** There is a fixed Shortener policy and a normalized historical debt \(\Phi\) such that, on every reachable interval with initial excess \(M\) and \(R>M/2\):
>
> 1. failure of the currently available high-degree moves to delete \(M/2\) creates \(\Omega(M)\) units of permanent debt;
> 2. each Prolonger move creates only \(O(1)\) net new debt over its full future refinement history;
> 3. debt resolved by actual deletion or transfer is charged only once;
> 4. the total baseline and boundary error is \(o(M)+O(\log n)\).

Since a ticket contains only

\[
O\!\left(M\frac{\log H}{H}\right)+O(\log n)
=o(M)+O(\log n)
\]

Prolonger moves, such a lemma would make it impossible for Prolonger to protect \(\Omega(M)\) excess targets, and the ticket would halve.

The frozen repair theorems do not establish item 2. Direct-ancestor insertion is exactly the operation under which the known repair potentials can jump by the mass of many previously unrelated structures.

A negative resolution requires the converse construction:

> For every complete Shortener policy, force an on-trajectory interval in which only \(o(M)\) aggregate excess is deleted during \(O(M\log H/H+\log n)\) turns, while each adversarial move repeatedly protects \(\Omega(H/\log H)\) fresh excess targets and the protected targets neither die nor transfer to the minimal/exact-only bank.

No supplied construction currently does this globally.

## Conclusion

The repaired proposition is not vacuous, and the previous empty-shell counterexample no longer applies. It is also not a formal restatement of \(L(n)=o(n)\). But the accepted facts stop exactly before the accumulated global-area/no-reuse estimate needed to settle it.

Thus the mathematically defensible resolution is

\[
\boxed{
\begin{array}{c}
\text{Literal (AE): true vacuously, as shown in Attachment 0;}\\[2mm]
\text{repaired }(\mathrm{AE}^{\dagger}):
\text{ neither proved nor disproved by a valid argument here.}
\end{array}}
\]

Any purported full proof would be assuming a chronological Lipschitz/no-reuse theorem; any purported full disproof would be assuming a robust arbitrary-policy entry theorem. Neither assumption is among the established facts.
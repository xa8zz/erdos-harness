---
id: R149-capped-tail-vacuous-repair-root-reduction
type: research
date: 2026-07-13
intent: >
  Determine whether the displayed second-shell capped-tail exclusion statement,
  as literally quantified, holds — and if it holds only degenerately, supply
  the exact repair and whatever structural results can be proved about the
  repaired statement.
predecessors: [R146-fsc2-second-shell-cap-entry-open, R148-second-shell-cumulative-sparsity-still-open]
action:
  kind: extends
  target: R146-fsc2-second-shell-cap-entry-open
claim: >
  (i) Vacuity mechanism: the displayed statement quantifies only "some fixed
  eta_0<eta/2" without requiring eta_0>0. Fixing eta_0=-1 before Prolonger is
  quantified makes the top-phase stopping time tau_0=inf{t: |Q_0(A_t)|<=eta_0|S_0|}
  unattainable at every finite nonterminal history, since |Q_0(A_t)|>=0>eta_0|S_0|
  always; hence no post-top position exists, and under either phase convention
  no active sparse B_n followed by a capped tail can exist — the literal
  statement is true but vacuous.
  (ii) Exact repair: for every fixed 0<eta<1, fix 0<eta_0<eta/2 (e.g. eta_0=eta/4),
  fix the complete prelude, stopping rule, top-phase stopping rule, and
  prefix-measurable tie-break before Prolonger is quantified, and require
  that the prelude and top phase terminate in o(n) actual moves uniformly
  against every Prolonger strategy. Under this repair there do not exist a
  constant c>0, a sequence n_k->infty, a function H(n_k)->infty, and finite
  on-trajectory post-top times b_k inside the active second-shell phase such
  that |A_{b_k}|=o(n_k), |Q_1(A_{b_k})|>eta|S_1|, Delta_{Q_1}(A_{b_k})<=H(n_k),
  followed by at least c*n_k further Shortener turns with the phase remaining
  active and the degree remaining at most H(n_k). This repaired statement is
  exactly FSC(2,eta).
  (iii) Legal-divisor upset lemma: if x is legal, d|e|x, and d is legal, then
  e is legal (the legal divisors of a legal target form an upper order ideal).
  (iv) Minimal-root equivalence: if Shortener's prescribed maximum-degree move
  d satisfies |N_Q(d)|=Delta_Q, there is a divisibility-minimal legal r|d with
  N_Q(r)=N_Q(d); selecting d has exactly the same deletion set as selecting
  its minimal legal root r, and r is permanently killed by d.
  (v) Linear minimal-root events corollary: a second-shell phase with T
  Shortener turns generates at least T distinct integers that are minimal
  legal immediately before their charged turn; a linear tail (T>=cn) requires
  at least cn such distinct minimal-root events, and since the sparse entry
  position B_n has only o(n) minimal legal elements by static completion, all
  but o(n) of these roots must first become minimal after entry into the
  capped tail.
  (vi) Fixed-interval concentration: every charged root is at most n/4, so for
  T>=cn (forcing c<=1/4+o(1)), at least (c/2)n of the cn distinct charged roots
  lie in the fixed macroscopic interval ((c/2)n, n/4]; combined with the
  cumulative sparsity theorem bounding minimal-legal events in any fixed
  interval during an o(n)-move prefix to o(n), this linear family cannot be
  produced during cap entry and must arise after a positive linear number of
  moves.
  (vii) Linear fixed-cap suffix: since Delta_t is nonincreasing with
  sum_{t<T}Delta_t<=|S_1|=n/4+O(1), for any fixed D the number of turns with
  Delta_t>D is at most n/(4(D+1))+O(1); choosing D=D(c) with 1/(4(D+1))<c/2
  shows every linear tail (T>=cn) contains a final suffix of at least
  (c/2)n-O(1) turns with Delta_t<=D, beginning after at most a fixed positive
  fraction n/(4(D+1)) of n turns — not o(n) — so this does not contradict the
  fixed-cap no-entry theorem.
  (viii) Deadline formulation: for the final survivor population X=Q_T after
  T active tail turns and k_X(d)=|{x in X: d|x}|, if d remains legal for s
  consecutive Shortener positions then Delta_t>=k_X(d) on each, giving
  s*k_X(d)<=|S_1|, i.e. s<=|S_1|/k_X(d); if d stays legal for the entire
  T-turn interval with T>=cn, then k_X(d)<=1/(4c)+o(1).
  (ix) Open: the repaired FSC(2,eta) statement is not decided. The unresolved
  obstruction is whether one blocker move, by being divisible by many
  currently-legal roots at once, can satisfy many final-survivor deadlines
  simultaneously (the direct-ancestor batch phenomenon). All results
  (iii)-(viii) apply unchanged to any fixed deeper shell as localization
  statements but do not compose into a finite-shell induction, since deeper
  shells inherit blockers from every previously processed shell.
implications:
  - The displayed exclusion statement cannot be cited toward L(n)=o(n) as
    proved; its only valid content is the degenerate eta_0<0 vacuity, not
    FSC(2,eta).
  - Any future dispatch on this exclusion must state 0<eta_0<eta/2 and uniform
    o(n) activation explicitly, or it will re-derive the same vacuous proof.
  - A genuine counterexample to the repaired statement must simultaneously
    exhibit sparse growing-cap entry, a linear constant-cap suffix, linearly
    many newly-minimal roots concentrated in one fixed macroscopic interval,
    and a blocker schedule meeting every final-survivor deadline — this
    narrows the disproof search space considerably.
  - Deeper-shell extension remains a distinct open problem: the
    root-reduction and deadline machinery localizes per-shell but supplies no
    finite-shell induction.
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/researcher-R149-capped-tail-exclusion.md
---

# Verdict

There are two mathematically different readings.

\[
\boxed{\text{As literally quantified, the displayed exclusion is true but vacuous.}}
\]

The omission is the lower bound \(\eta _0>0\), together with an explicit requirement that the top phase terminate uniformly in \(o(n)\) turns. Without those requirements, one may choose a fixed negative threshold. The top phase then never reaches its stopping condition before the game ends, so no active post-top position \(B_n\) exists.

Under the intended reading inherited from \(\mathrm{FSC}\),

\[
0<\eta _0<\eta/2
\]

with uniform \(o(n)\) termination, this collapse disappears. My argument below does **not** prove or disprove that repaired substantive assertion. It does, however, give an exact root-reduction theorem and a strong necessary normal form for any counterexample.

---

## 1. Literal proof by parameter-level activation suppression

Fix \(0<\eta<1\). The quoted statement requires only that the top phase be run at “some fixed”

\[
\eta _0<\eta/2.
\]

It does not explicitly require \(\eta _0>0\). Choose, before Prolonger is quantified,

\[
\eta _0=-1.
\]

This choice is fixed, deterministic, and independent of Prolonger and of the realized history.

Let the top-phase stopping time be the one dictated by the definition:

\[
\tau_0
=
\inf\left\{
t:
|Q_0(A_t)|\le \eta _0|S_0|
\right\}.
\]

For every position \(A_t\),

\[
|Q_0(A_t)|\ge0,
\]

whereas

\[
\eta _0|S_0|=-|S_0|<0.
\]

Therefore

\[
|Q_0(A_t)|\le\eta _0|S_0|
\]

is impossible at every finite nonterminal history. Hence the threshold stopping time is never attained.

There are now two possible phase conventions.

1. If a post-top position is defined only when the prescribed threshold stopping time is finite, there is no post-top position at all.
2. If every phase is forcibly terminated when the game itself terminates, its only possible post-top position is terminal. A terminal position is not an active second-shell position.

Under either convention, no Prolonger strategy can produce an active sparse position \(B_n\) **after** this top phase. In particular, no strategy can produce such a \(B_n\) followed by a linear capped tail.

Thus the quantified nonexistence assertion holds:

\[
\boxed{\text{No prohibited witness exists.}}
\]

This completes the literal proof. It is a combination of **parameter-level vacuity** and **top-phase delay/activation suppression**.

Notice that fixing \(\mathcal T_n\) and \(\prec_n\) before Prolonger is quantified does not close this particular loophole: the defective stopping rule itself is fixed before Prolonger.

---

## 2. Exact repair

The substantive statement should say the following.

> For every fixed \(0<\eta<1\), choose and fix a number
> \[
> 0<\eta _0<\eta/2,
> \]
> for example \(\eta _0=\eta/4\). Fix the complete prelude, its stopping rule, the top-phase stopping rule, and the prefix-measurable tie-break before Prolonger is quantified. Require that, uniformly against every Prolonger strategy, the prelude and top phase terminate after \(o(n)\) actual moves. Then there do not exist a constant \(c>0\), an infinite sequence \(n_k\to\infty\), a function \(H(n_k)\to\infty\), and finite on-trajectory post-top times \(b_k\), lying inside the active second-shell phase, such that
> \[
> |A_{b_k}|=o(n_k),\qquad
> |Q_1(A_{b_k})|>\eta|S_1|,
> \qquad
> \Delta_{Q_1}(A_{b_k})\le H(n_k),
> \]
> and the next at least \(c n_k\) Shortener turns all occur while the phase remains active and the degree remains at most \(H(n_k)\).

This repair explicitly supplies:

\[
0<\eta _0<\eta/2,
\]

uniform finite \(o(n)\) activation, a realized on-policy position, a fixed positive constant behind \(\Omega(n)\), and the correct quantifier order.

With this repair, the negative-\(\eta _0\) proof is unavailable. The statement becomes precisely the substantive \(\mathrm{FSC}(2,\eta)\) problem isolated in Attachment C.

---

# 3. An exact root reduction for the repaired problem

Although it does not by itself exclude the tail, the following observation substantially sharpens what such a tail must do.

For a current position \(A\), a target set \(Q=Q_1(A)\), and a legal \(d\le n/4\), write

\[
N_Q(d)=\{x\in Q:d\mid x\}.
\]

## Lemma 1: legal divisors form an upset

Let \(x\) be legal. If

\[
d\mid e\mid x
\]

and \(d\) is legal, then \(e\) is legal.

### Proof

Suppose instead that \(e\) is illegal. Then some chosen \(a\in A\) is comparable with \(e\).

If \(a\mid e\), then

\[
a\mid e\mid x,
\]

contradicting the legality of \(x\).

If \(e\mid a\), then

\[
d\mid e\mid a,
\]

contradicting the legality of \(d\).

Both possibilities are impossible. Therefore \(e\) is legal. \(\square\)

Thus, inside the divisor lattice of a legal target, the legal divisors constitute an upper order ideal.

## Lemma 2: every greedy move is equivalent to a minimal legal root

Suppose Shortener’s prescribed move \(d\) has maximum current degree

\[
|N_Q(d)|=\Delta_Q.
\]

Choose, by finite descent, a divisibility-minimal legal element \(r\) satisfying

\[
r\mid d.
\]

Then

\[
r\in\mathcal M(A)
\]

and

\[
N_Q(r)=N_Q(d).
\]

### Proof

Certainly

\[
N_Q(d)\subseteq N_Q(r),
\]

because \(r\mid d\).

But \(r\) is itself a legal candidate move. By maximality of the degree of \(d\),

\[
|N_Q(r)|\le \Delta_Q=|N_Q(d)|.
\]

The inclusion and the cardinality inequality force equality:

\[
N_Q(r)=N_Q(d).
\]

The choice of \(r\) makes it minimal legal. \(\square\)

Because every \(x\in S_1\) is larger than every proper divisor used by the policy, selecting \(d\) removes from \(Q\) exactly its multiples. Consequently, as far as the current shell is concerned, selecting \(d\) has exactly the same deletion set as selecting \(r\).

Moreover, the selected \(d\) permanently kills \(r\), since \(r\mid d\). Hence the roots charged to different Shortener turns are distinct.

## Corollary 3: a linear tail requires linearly many minimal-root events

If a second-shell phase contains \(T\) Shortener turns, then during those turns there are at least \(T\) distinct integers which are minimal legal immediately before their charged turns.

In particular, a counterexample tail of length

\[
T\ge cn
\]

requires at least \(cn\) distinct minimal-root events.

At its sparse entry position \(B_n\), static completion gives only

\[
|\mathcal M(B_n)|=o(n).
\]

Therefore all but \(o(n)\) of the charged roots must become minimal **after** entry into the capped tail.

This rules out an interpretation in which Prolonger merely rotates the greedy policy among a fixed sparse family of roots. A real counterexample must generate new minimal roots at a linear cumulative rate once the trajectory has left its sparse initial segment.

---

## 4. A fixed macroscopic interval must contain linearly many charged roots

Every charged root is at most \(n/4\). Assume \(T\ge cn\). Since each Shortener move deletes at least one target,

\[
c\le\frac14+o(1).
\]

There are at most \(cn/2\) integers not exceeding \(cn/2\). Therefore, among the \(cn\) distinct charged roots, at least

\[
\frac c2n
\]

lie in the fixed interval

\[
\left(\frac c2n,\frac n4\right].
\]

Thus any linear counterexample has the stronger property

\[
\boxed{
\text{linearly many distinct integers in one fixed macroscopic interval
become minimal legal during the tail.}
}
\]

This interfaces exactly with the cumulative sparsity theorem in Attachment D. That theorem shows that only \(o(n)\) such events can occur during an \(o(n)\)-move prefix. Hence the linear family above cannot be created during cap entry. It must be created after a positive linear number of actual moves have accumulated.

That is why cumulative sparse-prefix control does not alone prove exclusion.

---

# 5. Every linear tail contains a linear fixed-cap suffix

There is another useful sharpening that does not appear to require a growing cap.

Suppose the phase has \(T\ge cn\) Shortener turns. From the monotone-degree lemma,

\[
\sum_{t<T}\Delta_t\le |S_1|=\frac n4+O(1),
\]

and \(\Delta_t\) is nonincreasing.

Fix an integer \(D\ge1\). The number of turns with \(\Delta_t>D\) is at most

\[
\frac{|S_1|}{D+1}
\le
\frac{n}{4(D+1)}+O(1).
\]

Since the degree is nonincreasing, all such turns form an initial segment. Choose \(D=D(c)\) so large that

\[
\frac1{4(D+1)}<\frac c2.
\]

Then the final

\[
\frac c2n-O(1)
\]

turns satisfy the **fixed** cap

\[
\Delta_t\le D.
\]

Therefore:

\[
\boxed{
\text{A linear growing-cap counterexample necessarily has a linear
constant-cap suffix.}
}
\]

This does not contradict the accepted fixed-cap entry theorem. The constant-cap suffix need only begin after as many as

\[
\frac{n}{4(D+1)}
\]

turns, which is a small but fixed positive fraction of \(n\), not \(o(n)\). By that time the position need not be sparse. This is the exact boundary between the existing fixed-cap no-entry theorem and the required exclusion.

---

# 6. A deadline formulation for the final survivors

Let \(Q_T\) be the target population after a prefix of \(T\) active tail turns, and put

\[
X=Q_T.
\]

For a lower integer \(d\), define its incidence with the final survivors by

\[
k_X(d)=|\{x\in X:d\mid x\}|.
\]

Because legality and membership in \(Q\) only disappear,

\[
X\subseteq Q_t
\]

for every earlier time \(t\).

Suppose \(d\) remains legal for the first \(s\) Shortener positions of this interval. Then on each of those positions,

\[
\Delta_t\ge k_X(d).
\]

Consequently,

\[
s\,k_X(d)
\le
\sum_{t<s}\Delta_t
\le |S_1|.
\]

Thus every divisor \(d\) of many final survivors has an early blocking deadline:

\[
\boxed{
s\le\frac{|S_1|}{k_X(d)}.
}
\]

If \(d\) stays legal for the entire \(T\)-turn interval, then

\[
T\,k_X(d)\le |S_1|.
\]

For a linear interval \(T\ge cn\), this implies

\[
k_X(d)\le \frac1{4c}+o(1)
\]

for every divisor that remains legal throughout.

So a counterexample strategy must schedule blockers early enough to meet simultaneously all these incidence-dependent deadlines.

The remaining obstruction is that one chosen move can meet many deadlines at once: if it is divisible by many currently legal roots, it can make all of them illegal while leaving their targets alive. That is exactly the direct-ancestor batch phenomenon. The deadline system therefore isolates the missing assertion but does not, by itself, prove that the schedule is impossible.

---

# 7. What this resolves—and what it does not

The exact displayed sentence is settled by the negative-\(\eta _0\) witness:

\[
\boxed{\text{It is true for a degenerate activation-suppression reason.}}
\]

This literal resolution does **not** prove \(\mathrm{FSC}(2,\eta)\), because it prevents the second-shell phase from being validly activated. It consequently says nothing about \(L(n)\), and it says nothing about whether a batch-aware or otherwise different Shortener policy succeeds.

For the repaired positive-threshold statement, the root reduction proves that a counterexample must simultaneously exhibit all of the following:

\[
\begin{gathered}
\text{a sparse growing-cap entry},\\
\text{a linear constant-cap suffix after the position is no longer sparse},\\
\text{linearly many newly created minimal roots in a fixed macroscopic interval},\\
\text{and a blocker schedule satisfying every final-survivor deadline.}
\end{gathered}
\]

The accepted direct-ancestor examples explain why none of those conditions alone is contradictory.

The legal-divisor upset lemma, root reduction, fixed-cap-suffix reduction, and deadline inequality apply without change to any fixed deeper shell. They therefore **iterate as localization statements**. They do not give a finite-shell induction: in deeper shells, roots can be destroyed by elements from every previously processed shell, so the same batch-deadline obstruction only becomes more complicated.

Hence the final scope is:

\[
\boxed{
\begin{array}{l}
\textbf{Literal statement: proved, but vacuously, by the missing condition }\eta_0>0.\\[1mm]
\textbf{Exact repair: require }0<\eta_0<\eta/2\textbf{ and uniform }o(n)\textbf{ activation.}\\[1mm]
\textbf{Repaired statement: not decided by this proof; the remaining issue is}\\
\textbf{chronological batch blocking of linearly many newly exposed roots.}
\end{array}}
\]
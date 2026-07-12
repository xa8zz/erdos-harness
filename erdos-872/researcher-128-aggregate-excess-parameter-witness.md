---
id: R128-aggregate-excess-parameter-witness
type: research
date: 2026-07-12
intent: >
  Prove or disprove the aggregate-excess halving statement (AE): a
  fully specified Shortener policy halves the global excess potential
  R(t) over dyadic shells X >= H^6 within C*M*log(h)/h + O(log n) turns
  whenever R = M > 0, with mandatory succession.
predecessors: [R124a-aggregate-excess-counterexample]
action:
  kind: extends
  target: R124a-aggregate-excess-counterexample
claim: >
  Literal (AE) is TRUE vacuously — fifteenth collapse, parameter-level:
  choosing H(n) = n makes the eligible-shell range X >= H^6 empty, so
  R is identically zero and any legal policy satisfies the conditional;
  the transcribed statement never required nonempty ticket-eligible
  shells (the constraint H^6 = o(n) was implicit in the construction's
  pipeline-sufficiency, not in the statement). The repaired (AE-dagger)
  — H^6 = o(n) plus uniform closed outer quantifiers — is analyzed:
  it implies L(n) = o(n) through the accepted pipeline, and it does
  NOT collapse to the full problem: an abstract monotone process with
  R(0) = sqrt(n) decremented by one per turn has o(n) total length yet
  fails aggregate halving for every h -> infinity, so (AE-dagger) is a
  strictly stronger local rate assertion than global sublinearity —
  the first intermediate of this program proven non-tautological.
  (AE-dagger) itself is neither proved nor refuted: the energy and
  ledger bounds lack the global no-reuse/Lipschitz estimate, and
  fresh-batch persistence is Prolonger-side.
implications:
  - Parameter ranges are part of the statement: every scale parameter
    must carry its implicit constraints explicitly (here H^6 = o(n)).
    Fifteenth collapse family: parameter-level vacuity.
  - (AE-dagger) is the canonical target: well-posed, nondegenerate
    modulo the stated parameter range, implies o(n), provably not a
    rewrite of the full problem.
verifiers_at_time: []
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/researcher-R128-aggregate-excess-halving.md
---

# Verdict

\[
\boxed{\text{The literal statement (AE) is true, but vacuously.}}
\]

The defect is not in the ticket recurrence. It is in the outer quantification of the scale parameter \(H\). Attachment 1 verifies that **an existing ticket** certifies genuine progress, but it never requires the set of ticket-eligible shells to be nonempty. 

## Proof of the literal statement

For each \(n\), choose

\[
h(n)=H(n)=n.
\]

Then \(H(n)\to\infty\), as required. Every dyadic shell of the board has scale \(X\le n\), whereas

\[
H(n)^6=n^6>n.
\]

Consequently there is no dyadic shell satisfying \(X\ge H^6\). The sum defining the aggregate excess is therefore an empty sum:

\[
R(t)
=
\sum_{X\ge H^6}
\left(q_X(t)-\left\lceil\frac{4X}{h^2}\right\rceil\right)_+
=0
\qquad\text{at every time }t.
\]

Now specify any deterministic legal Shortener policy, for example:

> On every nonterminal Shortener turn, play the least currently legal integer.

This is fully specified and legal. Take \(C=1\), and take the \(O(\log n)\) term to be identically zero.

The assertion in (AE) is conditional:

\[
R(t)=M>0
\quad\Longrightarrow\quad
\text{\(R\) is reduced to at most \(M/2\) within the stated budget.}
\]

But \(R(t)>0\) never occurs. Hence the implication holds at every time, against every Prolonger strategy. Mandatory succession while \(R>0\) is also vacuous.

Thus the literal (AE) is proved. \(\square\)

# Why the stated “nondegeneracy” does not exclude this

The audit establishes a **conditional** form of nondegeneracy:

> whenever a global ticket is registered, resolving it proves genuine deletion of aggregate excess.

That does not imply that any ticket is ever registered. Universal claims over an empty family of tickets remain true.

The pipeline calculation in Attachment 1 contains the line

\[
O(n/h^2)+O(H^6)=o(n).
\]

The first term is \(o(n)\) from \(h\to\infty\), but the second conclusion requires the additional hypothesis

\[
H^6=o(n).
\tag{1}
\]

It does not follow from \(H\to\infty\). With the witness \(H=n\), the second term is \(O(n^6)\), so the advertised pipeline conclusion no longer follows. In other words, the literal ticket statement and the claimed pipeline-sufficient statement have different parameter domains.

This is an outer-quantifier collapse, not one of the fourteen internal ledger collapses.

# The nondegenerate repair

The intended proposition should explicitly be something like the following.

There exist functions \(H(n)\), a deterministic Shortener policy \(\sigma_n\), and absolute constants \(C,K\) such that

\[
H(n)\to\infty,
\qquad
H(n)^6=o(n),
\tag{2}
\]

and, with \(h=H(n)\), after the prescribed fixed trapping baseline, for every Prolonger strategy and every ticket-start time \(t\),

\[
R(t)=M>0
\quad\Longrightarrow\quad
R(t')\le \frac M2
\]

for some \(t'\) occurring within at most

\[
C M\frac{\log H}{H}+K\log n
\tag{3}
\]

Shortener turns, with every intervening Shortener turn owned and with immediate successor registration while \(R>0\).

The order of quantifiers must be

\[
\exists H,\sigma,C,K\quad
\forall n\text{ sufficiently large}\quad
\forall\Pi\quad
\forall t,
\]

so that \(H\), the policy, the constants, the baseline rule, and all tie-breakers are fixed before Prolonger’s strategy.

Call this strengthened statement \((\mathrm{AE}^{\dagger})\).

# Status of the repaired statement

The vacuous proof above does not apply to \((\mathrm{AE}^{\dagger})\). Nor do the supplied established facts prove or disprove it. The record itself identifies the global chronological problem as open in both directions. 

The exact obstruction is local-rate control. Define, for a fixed policy \(\sigma\),

\[
V_\sigma(A,M)
=
\sup_{\Pi}
\{\text{number of future Shortener turns required to reduce \(R\) from \(M\) to \(M/2\)}\}.
\]

Then \((\mathrm{AE}^{\dagger})\) asks for the uniform trajectory estimate

\[
V_\sigma(A,M)
\le
C M\frac{\log H}{H}+K\log n
\tag{4}
\]

at every reachable ticket state.

The accepted results do not provide (4):

* Static completion and the fractional relaxation give quantities that are \(o(n)\), not \(o(M)\) uniformly at every sublinear ticket mass \(M\).
* Degree availability controls positive-density upper reservoirs. Aggregate excess may be concentrated at a sublinear scale or may exceed a shell floor by a relatively small amount.
* Primorial fortresses and face-carrier configurations show that endpoint degree bounds cannot prove (4), but those states need not be reachable against the proposed policy.
* The all-orders witness inequality controls frozen witness multiplicities, while a chronological direct-ancestor move can destroy many candidate faces at once. No accepted no-reuse or Lipschitz estimate turns that inequality into the required global service bound.
* Fresh-batch persistence is a Prolonger-side theorem and cannot be used as the move scheduler for a Shortener policy.

Thus the repaired statement is a genuine additional global chronological theorem.

# It does not tautologically collapse to \(L(n)=o(n)\)

The forward implication is accepted:

\[
(\mathrm{AE}^{\dagger})\Longrightarrow L(n)=o(n).
\]

The converse is not a formal consequence of sublinear total game length. To see the distinction, consider the abstract monotone process

\[
R(0)=\lfloor\sqrt n\rfloor,
\]

in which every Shortener turn decreases \(R\) by exactly one and the process terminates when \(R=0\). Its total length is

\[
\lfloor\sqrt n\rfloor=o(n).
\]

But halving \(M=\lfloor\sqrt n\rfloor\) takes at least \(M/2\) turns. For every \(h(n)\to\infty\) and fixed \(C,K\),

\[
C M\frac{\log h}{h}+K\log n=o(M),
\]

so the aggregate-halving estimate fails.

This abstract example does not disprove a divisibility-specific converse, but it proves that aggregate halving is a stronger **local rate assertion**, not merely a logical rewriting of global sublinearity.

# Final resolution

There are therefore two mathematically distinct verdicts:

\[
\boxed{
\begin{array}{ll}
\textbf{Literal (AE):}
&
\text{true by the empty-shell witness }H(n)=n.
\\[4pt]
\textbf{Intended nondegenerate }(\mathrm{AE}^{\dagger}):
&
\text{requires at least }H^6=o(n)\text{ and uniform closed quantifiers;}\\
&
\text{the supplied results do not prove or refute it.}
\end{array}}
\]

So Attachment 1’s internal ticket mechanics may be nondegenerate, but the statement as posed still admits a parameter-level vacuous witness.
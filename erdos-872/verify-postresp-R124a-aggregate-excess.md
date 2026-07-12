---
id: R124a-aggregate-excess-counterexample
type: verification
date: 2026-07-12
intent: >
  Adversarial audit of the activation-area impossibility theorem, with
  the family-coverage attack as primary task.
predecessors: [R123-activation-area-impossibility]
action:
  kind: refutes
  target: R123-activation-area-impossibility
failure_mechanism: >
  The impossibility theorem is valid only for the family whose feature
  (4) bakes per-shell online-area contraction into the definition; it
  is not architectural for all ledger/ticket intermediates.
  Counterexample: the aggregate-excess ticket ledger — define
  R(t) = sum over shells X >= H^6 of (q_X(t) - ceil(4X/h^2))_+;
  whenever R > 0 register ONE global ticket of mass M = R(t), every
  Shortener turn is owned by it, and it resolves within
  C*M*log(h)/h + O(log n) turns by proving R(t') <= M/2, with mandatory
  succession. Nondegenerate (real global deletion, every turn owned,
  well-founded recurrence) and pipeline-sufficient (sum of masses
  <= 2R(b) <= 2n, total service o(n), residual mass o(n)) — yet not a
  per-shell online-area decomposition.
claim: >
  Verdicts: A VALID (fourteenth collapse and 4X/h^2 repair), B REFUTED
  (aggregate-excess counterexample above), C REPAIRABLE (the forward
  implication to L(n) = o(n) is valid; the equivalence/minimality
  framing overclaims). The aggregate-excess halving statement is a new,
  simpler candidate intermediate target.
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/audit-R124-impossibility-theorem.md
---

Source record reviewed. 

## A. **VALID**

The fourteenth collapse is real. With the old live threshold \(q_X>d_X\), a live shell with \(d_X<q\le2d_X\) already satisfies \(q\le q/2+d_X\), so a ticket can “complete” without deleting anything. The three outcomes listed are exhaustive for that architecture: zero-time re-registration loop, positive-service nonprogress loop, or finite epoch exhaustion. 

The \(4d_X\) repair works. The recurrence
\[
m_{j+1}\le \frac12m_j+d_X
\]
has fixed point \(2d_X\), and with \(J_H=2\lceil\log_2h\rceil+3\),
\[
m_{J_H}<17d_X/8<4d_X,
\]
so no further live epoch is required. The repair restores well-foundedness for the stated half-plus-dust recurrence. 

## B. **REFUTED**

The impossibility theorem is valid only for the family after feature (4) has already baked in per-shell online-area contraction. It is not an architectural impossibility theorem for all reasonable ledger/ticket intermediates.

A clean counterexample is an **aggregate-excess ticket ledger**.

Define
\[
R(t)=\sum_{X\ge H^6}\bigl(q_X(t)-\lceil4X/h^2\rceil\bigr)_+ .
\]
Whenever \(R(t)>0\), register one global ticket with mass \(M=R(t)\). Every Shortener turn while \(R>0\) is owned by this ticket. The ticket resolves within
\[
C M\frac{\log h}{h}+O(\log n)
\]
turns by proving
\[
R(t')\le M/2.
\]
Then immediately register the successor if \(R(t')>0\).

This is nondegenerate: every ticket proves real global deletion, every turn is owned, successors are mandatory, and the recurrence is well-founded. It is pipeline-sufficient because
\[
\sum M_j\le 2R(b)\le 2n,
\]
so total service is
\[
O(n\log h/h)+O(\log^2 n)=o(n),
\]
and termination leaves only \(O(n/h^2)+O(H^6)=o(n)\) residual mass.

But it is **strictly weaker than per-shell online area**. Consider an abstract monotone trajectory with \(N\) live shells, each starting at mass \(M\), and all shells eroding slowly in parallel so that none reaches \(M/2+d_X\) before time
\[
T\asymp N M\frac{\log h}{h},
\]
while the aggregate \(R\) halves at time \(T\). The aggregate ticket succeeds with budget proportional to total mass \(NM\). A serial online-area block fails: some individual shell must be active from the beginning, but no individual shell contracts within \(O(M\log h/h)\) raw Shortener turns once \(N\) is larger than the hidden constant.

So the exact failure is: Section VII’s feature list excludes aggregate-potential ledgers, and feature (4) silently identifies “successful ticket” with “per-shell half contraction.” That is already the online-area shape. The theorem proves a tautology for that subfamily, not an impossibility for ledger/ticket methods generally. 

## C. **REPAIRABLE**

Section VIII’s implication
\[
\mathsf{CTRMLA}_4\Rightarrow L(n)=o(n)
\]
is basically sound, conditional on the accepted reductions. The summation over epoch masses, the \(O(J_H\log n)\) ceiling term, the \(8n/h^2\) remaining large-shell dust, and the \(O(H^6)=o(n)\) small-shell contribution are all consistent. 

The overreach is in the final framing. The defensible statement is:

\[
\mathsf{CTRMLA}_4 \Rightarrow \mathrm{OA}^{path}_4 \Rightarrow L(n)=o(n).
\]

The non-defensible statement is “proving the repaired statement equals proving online area” without restricting to the same nonpreemptive, per-shell, serial-ticket encoding. The converse direction also needs the online-area schedule to be genuinely online and fixed before Prolonger; otherwise “register records in the order in which their online-area blocks are scheduled” is an after-the-fact quantifier slip. 

Final verdicts:

**A: VALID.**  
**B: REFUTED.**  
**C: REPAIRABLE — implication valid, equivalence/framing overclaims.**
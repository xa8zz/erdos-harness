---
id: R124b-global-batch-ticket-escape
type: verification
date: 2026-07-12
intent: >
  Second independent adversarial audit (same brief, separate thread) of
  the activation-area impossibility theorem.
predecessors: [R123-activation-area-impossibility]
action:
  kind: refutes
  target: R123-activation-area-impossibility
failure_mechanism: >
  The feature list defining the theorem's family is not exhaustive
  (cross-convergent with the sibling audit): a bounded ticket may
  terminate by reaching dust rather than half-contraction, and more
  substantially a mandatory global batch ticket contracting an
  aggregate excess potential is nondegenerate and pipeline-sufficient
  without yielding per-shell online-area blocks. Additionally the
  repaired state machine has an unhandled case (an active ticket can
  become nonlive at q_X <= 4d_X without satisfying half-plus-dust
  contraction, with no removal or continued-service rule), and only
  the FORWARD implication to online area is justified — the
  equivalence, minimality, and "every weakening reopens starvation"
  framing are false, with FIFO / prefix-measurability / master-ledger
  quantifier gaps in the converse.
claim: >
  Verdicts: A REPAIRABLE (chattering diagnosis and 4d_X scalar repair
  correct; state-machine case unhandled), B REFUTED (global batch
  ticket escape), C REPAIRABLE (forward implication sound after the A
  repair; equivalence framing overclaims). Scope outcome matches the
  sibling audit: the per-shell dichotomy stands for its stated family;
  the architectural no-go does not.
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/audit-R124-impossibility-theorem.md
---

## Verdicts

| Item | Verdict | Decisive reason |
|---|---|---|
| **A** | **REPAIRABLE** | The original \(d_X\)-threshold chattering diagnosis is correct, and \(4d_X\) fixes the scalar recurrence. But the repaired state machine has an unhandled case: an **active** ticket can become nonlive at \(q_X\le 4d_X\) without satisfying half-plus-dust contraction, after which the rules neither permit its removal nor require its continued service. |
| **B** | **REFUTED** | The feature list is not exhaustive. A bounded ticket may terminate by reaching dust rather than by half-contraction; more substantially, a mandatory global batch ticket can contract an aggregate excess potential. Both are nondegenerate and pipeline-sufficient without yielding per-shell online-area blocks. |
| **C** | **REPAIRABLE** | The asymptotic summation in Section VIII is sound after fixing A. But only the forward implication to online area is justified. The claimed equivalence, minimality, and “every weakening reopens starvation” framing are false; the converse also has FIFO, prefix-measurability, and master-ledger quantifier gaps. |

References below are to the uploaded document. 

---

# A. The fourteenth collapse and the \(4d_X\) repair

## 1. The original chattering diagnosis is correct

Write \(d=d_X\). At activation the current mass equals the ticket mass, \(q=m\). Therefore

\[
q\le \frac q2+d
\quad\Longleftrightarrow\quad
q\le 2d.
\]

So every integer \(q\in(d,2d]\) is simultaneously:

- live under the original threshold \(q>d\), and
- already complete under the ticket endpoint \(q\le q/2+d\).

The existence of such an integer is correctly justified: for audited shells \(d\ge H^2\to\infty\).

The recurrence observation is also exact. From

\[
m_{j+1}\le \frac12m_j+d
\]

one gets

\[
m_j\le 2^{-j}m_0+2d(1-2^{-j}),
\]

whose fixed point is \(2d\). Thus a stopping threshold below \(2d\) cannot be forced by this recurrence alone.

Under the document’s original succession rules:

- checking completion immediately creates a genuine zero-game-time administrative loop;
- requiring positive service before discharge permits arbitrarily many paid tickets with no shell decrease;
- retaining only \(J_H\) preconstructed epochs eventually demands a nonexistent next epoch.

For a fixed finite board, “infinitely many positive-cost tickets” is literally too strong—the game has finitely many moves. The precise failure is that their number is not bounded by the advertised geometric recurrence and may be linear in the remaining game length, or the finite epoch ledger may be exhausted. That wording issue does not affect the collapse.

## 2. What \(4d\) genuinely repairs

If a ticket activates with

\[
m>4d,
\]

then it is not complete at activation, because \(m>2d\). Moreover, any successful contraction satisfies

\[
q'\le \frac m2+d<\frac34m.
\]

Consequently completed tickets cannot recreate the same state, and their successor masses satisfy the claimed recurrence. The calculation

\[
m_j<2^{-j}X+2d
\]

and the choice

\[
J_H=2\lceil\log_2h\rceil+3
\]

indeed give

\[
m_{J_H}<\frac{17}{8}d<4d.
\]

Thus **the scalar succession recurrence is well founded**.

## 3. But the full ticket process is not well founded

There is a missing transition when an **active** ticket crosses the live threshold without achieving half-contraction.

Take \(d>1\), and set

\[
m=\lfloor4d\rfloor+1,
\qquad
q=\lfloor4d\rfloor.
\]

Then

\[
m>4d,
\qquad
q\le4d,
\]

so the ticket starts live and subsequently becomes nonlive after a decrease of only one target. But

\[
q>\frac m2+d.
\]

Indeed, the latter inequality is equivalent to

\[
\lfloor4d\rfloor>2d+1,
\]

which holds for all sufficiently large \(d\), in particular in the asymptotic regime here.

Now compare this state with the rules:

1. Administrative operation III.1 removes only a **waiting** record whose shell is nonlive.
2. The active ticket is not waiting.
3. III.5 says a ticket leaves the system **only** after satisfying
   \[
   q\le \frac m2+d.
   \]
4. Invariant (19) says a nonlive shell has no active or waiting record.
5. If this was the last live shell, III.5 simultaneously orders immediate entry into the completion phase.

These clauses are inconsistent in this state. The active ticket is nonlive, cannot be removed, has not completed, and may coexist with an instruction to start the endgame.

This is not merely a cosmetic administrative omission. Such a threshold crossing can be caused by a Prolonger move between Shortener turns, so the Shortener scheduler cannot prevent it.

Therefore:

\[
\boxed{\text{\(4d_X\) fixes chattering, but does not close the ticket automaton.}}
\]

## 4. Exact repair

Replace the sole completion condition by the two-way stopping rule

\[
\boxed{
q_X(t)\le \frac12m_{X,j}+d_X
\quad\text{or}\quad
q_X(t)\le4d_X.
}
\tag{A1}
\]

Administrative closure must terminate an active or waiting record immediately when the second alternative occurs. No successor is registered in that case.

Correspondingly, capped resolution should state

\[
\boxed{
\text{within }B_\delta(m)\text{ service turns, either }
q_X\le \frac12m+d_X
\text{ or }q_X\le4d_X.
}
\tag{A2}
\]

The same alternative must be added to the high-mode stopping rules.

This preserves all needed accounting:

- Every contraction-ended ticket that has a live successor obeys
  \[
  m_{j+1}\le \frac12m_j+d_X.
  \]
- A dust-ended ticket is the final ticket for its shell.
- There is at most one such terminal ticket per shell.
- Its start mass is already part of the same geometric sequence.
- Hence the bound
  \[
  \sum_jm_j=O(X)
  \]
  remains valid.
- The existing \(J_H\) epochs remain sufficient.

So A is **REPAIRABLE**, but not valid as written.

---

# B. The activation–area impossibility theorem

## Verdict: REFUTED

There are two independent refutations. The first stays almost entirely inside the shell-ticket architecture. The second gives a more robust aggregate ledger that remains a counterexample even if “online area” is amended to permit terminal dust exits.

---

## 1. The theorem omits a third branch: bounded termination at dust

Consider the following statement, identical to the repaired ticket process except that every ticket resolves within its budget by

\[
q_X(\tau)\le \frac12m+d_X
\quad\textbf{or}\quad
q_X(\tau)\le4d_X.
\tag{B1}
\]

Call this \(\mathsf{SDT}_4\), for serial dust-or-contraction tickets.

It has:

- mandatory registration;
- immediate succession;
- exactly one service owner for every relevant Shortener turn;
- bounded high-plus-cap chains;
- no zero-time chattering;
- no uncovered service;
- no unbounded phase chain;
- a fixed prefix-measurable stopping rule.

It is therefore nondegenerate.

It is also pipeline-sufficient. Until the terminal dust ticket, successor masses satisfy

\[
m_{j+1}\le \frac12m_j+d_X.
\]

Thus there are \(O(\log h)\) tickets per shell,

\[
\sum_jm_j=O(X),
\]

and the service summation in Section VIII is unchanged. At termination every large shell has \(q_X\le4d_X\), so the residual is \(o(n)\).

But \(\mathsf{SDT}_4\) does not imply the displayed online-area endpoint (37). The state

\[
m=\lfloor4d\rfloor+1,
\qquad
q'=\lfloor4d\rfloor
\]

satisfies the dust alternative but fails

\[
q'\le \frac m2+d.
\]

Thus it is strictly weaker than the document’s stated per-shell online-area condition.

This is already a counterexample to the claimed dichotomy:

\[
\boxed{
\text{no starvation}
\;+\;
\text{no half-contraction block}
\;+\;
\text{pipeline still closes}.
}
\]

It is also the exact repair required by A. Hence the document’s own state-machine defect produces an outside-the-family intermediate theorem.

---

## 2. A stronger counterexample: aggregate excess tickets

The author might try to redefine a block ending at dust as “operationally online area.” That does not rescue the architectural claim. A genuinely cross-shell amortized ticket also works.

Let

\[
\mathcal X_n^+
=
\{X\in\mathcal X_n:X\ge H^6\},
\]

and define the aggregate dust scale

\[
\Delta_n
=
\sum_{X\in\mathcal X_n^+}d_X.
\]

Because \(X=n\) is one of the scales and \(\sum_XX<2n\),

\[
\frac n{h^2}
\le
\Delta_n
<
\frac{2n}{h^2}.
\tag{B2}
\]

For each shell define its excess above the fixed point:

\[
p_X(t)
=
\bigl(q_X(t)-2d_X\bigr)_+,
\]

and let

\[
\Phi(t)
=
\sum_{X\in\mathcal X_n^+}p_X(t).
\tag{B3}
\]

### Aggregate-ticket statement \(\mathsf{BET}\)

Whenever

\[
\Phi(s)>4\Delta_n,
\]

a unique global batch ticket is activated with mass

\[
M=\Phi(s).
\]

Every relevant Shortener turn belongs to this ticket. Within at most

\[
\widehat B_\delta(M)
=
\left\lceil
K_\delta M\frac{\log h}{h}
\right\rceil
\tag{B4}
\]

assigned Shortener turns, the ticket reaches

\[
\Phi(\tau)
\le
\frac12M+\Delta_n.
\tag{B5}
\]

If \(\Phi(\tau)>4\Delta_n\), its successor is immediate. Otherwise the accepted completion phase begins.

All quantities and stopping times can be required to be prefix-measurable. There is no ticket deletion, no idle time, and no optional activation.

This is a completely reasonable serial-ticket ledger. Its ticket happens to cover a batch of shells rather than one shell.

### Why \(\mathsf{BET}\) implies \(L(n)=o(n)\)

Let \(M_r\) be successive batch-ticket masses. Then

\[
M_{r+1}\le\frac12M_r+\Delta_n,
\]

hence

\[
M_r
\le
2^{-r}M_0+2\Delta_n.
\tag{B6}
\]

Since \(M_0\le n\) and \(\Delta_n\ge n/h^2\), after \(O(\log h)\) rounds one has \(M_r\le4\Delta_n\).

Furthermore,

\[
\sum_rM_r
\le
2M_0+2R\Delta_n
=
O(n),
\tag{B7}
\]

where \(R=O(\log h)\). Therefore total service is

\[
O_\delta\!\left(
n\frac{\log h}{h}
\right)
+
O(\log h)
=
o(n).
\tag{B8}
\]

At termination,

\[
q_X
\le
p_X+2d_X,
\]

so

\[
\sum_{X\in\mathcal X_n^+}q_X
\le
\Phi+2\Delta_n
\le
6\Delta_n
=
O\!\left(\frac n{h^2}\right)
=
o(n).
\tag{B9}
\]

Together with the same small-shell and completion inputs used in Section VIII, this proves \(L(n)=o(n)\).

Thus \(\mathsf{BET}\) is pipeline-sufficient without any per-shell half-contraction ticket.

---

## 3. Online area implies \(\mathsf{BET}\)

This establishes that \(\mathsf{BET}\) is genuinely weaker, not merely incomparable.

Suppose a per-shell online-area block starts with mass \(q\) and gives

\[
q'\le\frac q2+d.
\]

Then

\[
(q'-2d)_+
\le
\frac12(q-2d)_+.
\tag{B10}
\]

Now perform one sweep of the shells that satisfy \(q_X>4d_X\) at the beginning of the sweep.

For a processed shell, (B10) halves its excess.

For a shell that falls below \(4d_X\) while waiting,

\[
p_X'\le2d_X
\le
\frac12p_X+d_X,
\]

because it initially had \(p_X>2d_X\).

For a shell initially satisfying \(q_X\le4d_X\), one has \(p_X\le2d_X\), and monotonicity gives

\[
p_X'\le p_X\le\frac12p_X+d_X.
\]

Summing yields

\[
\Phi_{\rm end}
\le
\frac12\Phi_{\rm start}+\Delta_n.
\tag{B11}
\]

The service budget of the sweep is also \(O(\Phi_{\rm start}\log h/h)\). For every processed shell,

\[
q_X>4d_X
\quad\Longrightarrow\quad
p_X=q_X-2d_X>\frac12q_X,
\]

so

\[
\sum_{\rm processed}q_X
<
2\Phi_{\rm start}.
\tag{B12}
\]

The per-shell \(O(1)\) ceiling costs can be absorbed because every processed shell has

\[
q_X>4d_X\ge4H^2
\]

and therefore

\[
q_X\frac{\log h}{h}
\ge
4H^2\frac{2\log H}{H^2}
=
8\log H.
\]

Hence a scheduled per-shell online-area policy furnishes the aggregate tickets.

Therefore

\[
\mathrm{OA}^{\rm path}_4
\Longrightarrow
\mathsf{BET}.
\tag{B13}
\]

---

## 4. But \(\mathsf{BET}\) does not imply per-shell online area

Take \(r=r(n)\to\infty\) live shell coordinates and arrange

\[
p_i(0)=m
\qquad (1\le i\le r),
\]

with \(m\gg d_i\). For the first

\[
T
=
\left\lfloor
\frac{K_\delta}{2}\,r m\frac{\log h}{h}
\right\rfloor
\tag{B14}
\]

service turns, leave every \(p_i\) unchanged. On turn \(T\), let all of them simultaneously fall to \(m/2\).

Then the aggregate ticket has mass \(M=rm\), uses at most its budget, and ends with

\[
\Phi(T)
=
\frac12rm
=
\frac12M.
\]

So \(\mathsf{BET}\) holds.

But no shell contracts before turn \(T\). A shell-local block has start mass \(\Theta(m)\) and is allowed only

\[
C_\delta m\frac{\log h}{h}+O(1)
\]

turns. The ratio is

\[
\frac{T}{m\log h/h}
=
\Theta(r)
\longrightarrow\infty.
\tag{B15}
\]

Because every earlier turn must have a service owner, the first active shell ticket already misses its deadline. It cannot be postponed until turn \(T\), since that leaves the earlier turns uncovered; it cannot be replaced by another shell ticket, since no shell contracts earlier.

This example is compatible with the shell capacities and thresholds. One may take approximately \(r\asymp\log h\) upper dyadic scales and choose equal excess masses of order \(n/h^2\); all are above their \(4d_X\) thresholds and fit inside their shells.

The point is structural: cross-shell progress can occur simultaneously and be paid for by pooled area even though no individual shell can finance the preceding interval.

Thus

\[
\boxed{
\mathsf{BET}\not\Longrightarrow
\mathrm{OA}^{\rm path}_4.
}
\tag{B16}
\]

If the term “online area” is expanded to include this aggregate-potential theorem, then “online area” no longer means the displayed per-shell condition (37), and the claimed impossibility becomes terminological rather than mathematical.

---

## 5. Exact defects in the proof of Section VII

The counterexamples expose several unjustified steps.

### The deletion argument assumes a syntactic property not present in features (1)–(4)

Section VII.1 claims that all conditions are either universal over existing tickets or upper bounds, and are therefore preserved under ticket deletion.

Nothing in features (1)–(4) implies that. A ledger may contain:

- a lower-bound coverage condition;
- an exact mass-conservation identity;
- a fractional-cover constraint;
- an aggregate-potential invariant;
- a global mandatory batch ticket.

All of these are destroyed by deleting tickets. The proof has silently restricted the family to **downward-closed, shell-local ledgers**, but that restriction is absent from the theorem.

### Unique service ownership is not the only noncircular accounting method

A turn can be charged to:

- one global batch ticket;
- fractional shares of several tickets;
- a conserved cross-shell bank;
- decrease of an aggregate potential.

A separately proved global amortized bound is not logically circular merely because it is global. Calling every such alternative “already a direct global time bound” does not prove impossibility.

### Coalescing phases works only under self-financing

Section VII.3 assumes that a chain must be paid for by the starting mass of the same shell. In \(\mathsf{BET}\), a long interval for any one shell is paid for by aggregate excess across many shells. Coalescing does not produce a shell-local block with budget \(O(m_X\log h/h)\).

Accordingly, the narrow statement that can be salvaged is:

> Within a formally defined class of downward-closed, shell-local, self-financing ticket systems that already require every bounded chain to end in per-shell half-plus-dust contraction, mandatory coverage packages the chains into per-shell online-area blocks.

That is essentially definitional. It does not imply the architectural impossibility theorem claimed in the document.

---

# C. Section VIII and the Final Resolution

## 1. The numerical \(o(n)\) summation is sound

Conditional on every started ticket resolving by contraction or terminal dust within \(2B_\delta(m)\), the mass calculation is correct.

For one shell,

\[
\sum_jm_j=O(X),
\]

and therefore

\[
\sum_j2B_\delta(m_j)
=
O_\delta\!\left(
X\frac{\log h}{h}
\right)
+
O(J_H).
\]

Since

\[
\sum_XX<2n
\]

and there are \(O(\log n)\) scales,

\[
\text{large-shell service}
=
O_\delta\!\left(
n\frac{\log h}{h}
\right)
+
O(J_H\log n)
=
o(n).
\]

The ceiling term is harmless because

\[
J_H=O(\log H)=O_\delta(\log n),
\]

so \(J_H\log n=O_\delta((\log n)^2)=o(n)\).

The residual estimates are also correct:

\[
\sum_X4d_X
<
\frac{8n}{h^2}
=
o(n),
\]

and the union of shells below \(H^6\) has size \(O(H^6)=o(n)\).

With the accepted preprocessing and completion theorem, alternation converts \(o(n)\) Shortener turns into \(o(n)\) total moves.

There is no substantive asymptotic error in equations (49)–(52).

## 2. But the current premises do not ensure the processing phase terminates

Section VIII begins its residual argument with:

> “When ticket processing terminates, every large shell has \(q_X\le4d_X\).”

As A shows, the existing rules permit an active ticket to become nonlive without satisfying its sole completion inequality. In that state, ticket processing is not formally allowed to terminate, but service is no longer coherently specified either.

Thus Section VIII is valid only after replacing ticket resolution by the contraction-or-dust alternative (A1)–(A2).

The repaired forward implication is

\[
\boxed{
\mathsf{CTRMLA}^{\dagger}_4
\Longrightarrow
\mathrm{OA}^{\rm path,\dagger}_4
\Longrightarrow
L(n)=o(n),
}
\tag{C1}
\]

where \(\mathrm{OA}^{\rm path,\dagger}_4\) permits a block to end either in half-plus-dust contraction or below the terminal dust threshold.

## 3. The converse does not construct the full repaired statement

Section VII.6 starts with online-area blocks and says they “furnish tickets.” At most it constructs a service-registration skeleton. It does not construct:

- the fixed baseline atom sets \(\Omega_{X,j}(B)\);
- positive fiber weights satisfying (10);
- total prefix-measurable unavailability maps;
- exact immutable cause maps;
- online certificate marks;
- direct-ancestor completeness;
- \((\mathrm{TR\!-\!AH}_4)\);
- the local and global causal-clock budgets.

Therefore

\[
\mathrm{OA}^{\rm path}_4
\not\Longrightarrow
\mathsf{CTRMLA}_4
\]

from anything proved in the document. The master-ledger theorem may be substantially stronger than online area.

The defensible claim is only

\[
\mathsf{CTRMLA}_4
\Longrightarrow
\text{its ticket skeleton}
\Longrightarrow
\mathrm{OA}^{\rm path}_4.
\]

## 4. The claimed converse has a genuine quantifier and online-order problem

The closed quantifier prefix requires the constructor, policy family, and tie-breakers to be selected before the universally quantified Prolonger policy.

But Section VII.6 says:

> “Put the records in the order in which their online-area blocks are scheduled.”

That block order may depend on later Prolonger moves. At the baseline, mandatory registration places all currently live shells into a FIFO queue. Their relative order must therefore already be fixed from the current prefix. One cannot later reorder those records to match an adaptively revealed block schedule.

To make the converse valid, one would have to assume in advance that online area comes with:

1. a deterministic prefix-measurable scheduler;
2. an initial ordering of all live shells;
3. FIFO-compatible successor placement;
4. the same fixed tie-breaker required by the ticket constructor.

A generic pathwise decomposition does not supply these.

## 5. “Proving the repaired statement = proving online area” is an overstatement

The forward direction is true in the following limited sense:

- the repaired ticket statement already assumes bounded ticket resolution;
- each resolved ticket interval has the displayed online-area endpoint;
- unique ownership and succession arrange those intervals into a schedule.

Thus a proof of the full ledger statement would indeed yield a proof of online area.

But equality is false:

\[
\mathsf{CTRMLA}_4
\quad\text{may be strictly stronger than}\quad
\mathrm{OA}^{\rm path}_4.
\]

And the stronger final assertion—

> weakening the ticket system enough to avoid online area necessarily reopens starvation—

is directly refuted by both:

\[
\mathsf{SDT}_4
\]

and

\[
\mathsf{BET}.
\]

The former terminates at negligible dust; the latter uses aggregate amortization. Neither has registration starvation, service starvation, phase-chain starvation, nor additive-floor chattering.

There is no formal circularity in the forward arithmetic proof. The problem is instead **premise loading**: feature (4) already inserts the defining per-shell online-area endpoint, and the later “impossibility theorem” treats that selected architecture as if it exhausted all ledger architectures.

---

# Final adjudication

### A — **REPAIRABLE**

The \(d_X\)-threshold collapse and fixed-point analysis are correct. The \(4d_X\) threshold removes same-state succession and makes the numerical recurrence finite. It does **not** close the full process because active tickets may cross into dust without half-contraction. Add an explicit terminal-dust endpoint and active-record cancellation.

### B — **REFUTED**

The impossibility theorem is false as an architectural statement. Its family excludes at least two reasonable, nondegenerate, pipeline-sufficient alternatives:

\[
q'\le\frac12m+d_X
\quad\text{or}\quad
q'\le4d_X,
\]

and the aggregate-excess ticket

\[
\Phi'\le\frac12\Phi+\Delta_n.
\]

The second is implied by per-shell online area but does not imply any bounded serial per-shell contraction decomposition. The deletion and coalescence arguments rely on unstated downward-closure and self-financing assumptions.

### C — **REPAIRABLE**

The Section VIII summation is correct after the active-dust defect is fixed. The final statement must be reduced to the one-way implication

\[
\mathsf{CTRMLA}^{\dagger}_4
\Longrightarrow
L(n)=o(n).
\]

The converse, equivalence, and minimality claims should be deleted. In particular, the document has not shown that online area supplies the master ledger, that its schedule is prefix-measurable and FIFO-compatible, or that all weaker amortized ticket systems starve.
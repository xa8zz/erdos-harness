---
id: R117-bfah-eighth-witness
type: verification
date: 2026-07-12
intent: >
  Adversarial audit of the canonical baseline-frozen ancestor-harvest
  formulation (BF-AH): well-formedness, hunt for an unanticipated
  degenerate witness, and the implication chain to L(n) = o(n).
predecessors: [R115-baseline-frozen-ancestor-harvest]
action:
  kind: refutes
  target: R115-baseline-frozen-ancestor-harvest
failure_mechanism: >
  B REFUTED — eighth collapse witness: incorporate an O(n/H)-move
  micro-baseline compression sweep into the (unconstrained) trapping
  algorithm before declaring its first endpoint: repeatedly find a
  shell with current degree above H and reservoir above B = H+1 and
  play a maximum-degree move there. At the freeze, every baseline-
  active ledger has mass O(H) while still passing the stated
  nontriviality tests (|Q_X| > X/h^2, D_X(0) > H, tau_X >= 1) — the
  formulation never requires the frozen reservoir to be much larger
  than H, so the single first clock increment CH pays for the whole
  ledger and the inequality holds trivially without controlling
  direct-ancestor mass. C REFUTED — the implication proof applies a
  one-baseline one-stopping-event statement repeatedly after expressly
  forbidding rebasing, and treats the unbudgeted global Ht term as a
  local summable per-shell cost. A REPAIRABLE — outer data lack
  quantifier status and several predicates remain prose.
claim: >
  (BF-AH) as formulated is degenerate (eighth witness) and its stated
  implication to L(n) = o(n) is invalid as written. The audit supplies
  the repair directions: require frozen reservoir mass much larger
  than H per active shell (e.g. |Q_X| >= X/h^2 AND X/h^2 >> H
  enforced), give outer data explicit quantifier status, restate the
  inequality as a genuinely multi-epoch or globally-budgeted bound
  with a stated error hierarchy, and make every predicate mathematical.
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/audit-R117-bfah-formulation.md
---

I audited the uploaded document as written, rather than the stronger statement it appears to intend. 

## Verdicts

| Item | Verdict | Decisive reason |
|---|---|---|
| **A. Well-formedness** | **REPAIRABLE** | Several objects and predicates are not mathematically defined, and the outer “fixed” data have no clear quantifier status. |
| **B. Nondegeneracy** | **REFUTED** | There is an eighth collapse: incorporate an \(O(n/H)\)-move **micro-baseline compression sweep** into the unspecified trapping algorithm. Every baseline-active ledger then has mass \(O(H)\), so the term \(CHt\) pays for the entire ledger after the first move. |
| **C. \((\mathrm{BF\!-\!AH})\Rightarrow L(n)=o(n)\)** | **REFUTED** | The proof applies a one-baseline, one-stopping-event statement repeatedly after expressly forbidding rebasing. It also treats an unbudgeted global \(Ht\) term as though it were a local, summable block cost. |

The verdict on C refutes the claimed deduction, not the underlying possibility that \(L(n)=o(n)\).

---

# A. Well-formedness: **REPAIRABLE**

The displayed inequality itself is syntactically clear once all its ingredients exist. The problem is that the document does not define a single closed tuple of ingredients.

## A.1 The outer data have no quantifier status

The document says to “fix once and for all”:

- a trapping algorithm \(\mathcal T_n\);
- its stopping rule;
- a canonical decomposition and first-exit construction;
- a shell scheduler.

It then existentially quantifies only \(C,\varepsilon,h,\Sigma\). 

There are at least three inequivalent readings:

\[
\begin{aligned}
&\text{(i) for one particular externally supplied }\mathcal T_n;\\
&\text{(ii) for every }\mathcal T_n\text{ satisfying the listed conditions};\\
&\text{(iii) for some }\mathcal T_n\text{ satisfying those conditions}.
\end{aligned}
\]

The truth and nondegeneracy of BF-AH change drastically between these readings. “Fixed” is not a substitute for identifying the object or quantifying it.

There is a similar dependency ambiguity around \(\delta\). The text first fixes \(\delta>0\), then asserts an “absolute” \(C\). It is unclear whether \(C\) is independent of \(\delta\). If so, \(C\) must be quantified before \(\delta\); if not, it is not absolute in the usual sense.

## A.2 Several predicates remain prose rather than mathematics

The following expressions are not defined as predicates or maps:

- “smooth/rough trapping algorithm”;
- “first prescribed endpoint”;
- “canonical active family”;
- “represented live shell payload”;
- “required lift slot”;
- “before the face is processed”;
- “actual target death or transfer”;
- “ordinary, boundary, pairwise-overlap, and exact/minimal channels”;
- “chosen sufficiently slowly for the accepted parameter hierarchy”;
- “equivalent maximum-degree-area bank.”

The first-exit section, for example, gives descriptions of overlapping channels but does not state the priority order that turns them into a disjoint partition. A proper-multiple event can potentially coincide with a lift-slot failure; saying there is “one fixed, predeclared priority rule” without declaring that rule does not determine \(\operatorname{Anc}_X(t)\). 

The phrase

> “One may replace \(\mathsf A_X\) by the equivalent maximum-degree-area bank”

is particularly fatal to singleness: those are two different right-hand sides unless a proved identity or comparison is incorporated into the statement. A theorem cannot leave its principal quantity optional. 

## A.3 Smaller formal gaps

There are also several local omissions:

1. The index set of “dyadic shells” is not specified. Is \(X\) restricted to powers of two, to \(n/2^j\), or to every real \(X\)? This matters both for overlap and for summing costs.

2. The convention for
   \[
   \max_{d\in D(A)}(\cdots)
   \]
   when \(D(A)=\varnothing\) is missing. The terminal-branch argument implicitly needs this maximum to be \(0\).

3. If a face never exits, one needs \(\xi_X(F)=\infty\).

4. “Every deterministic or history-dependent stopping time \(0\le t\le\tau_X\)” requires a filtration and a quantification over stopping rules. Since the desired assertion is pathwise, the clean formulation is simply “for every integer \(t\in\{0,\ldots,\tau_X\}\).”

5. The functions should be nonnegative:
   \[
   C>0,\qquad \varepsilon(H)\ge0,\qquad h(n)>0.
   \]

6. The proof later chooses \(h\) after seeing error moduli. The theorem must encode that dependency order rather than list \(\varepsilon\) and \(h\) simultaneously.

## A.4 Repair

A closed formulation should begin by fixing a named external data tuple

\[
\mathbf K_n=
\bigl(
\mathcal X_n,\mathcal T_n,b_n,
\mathscr F,\lambda,
\operatorname{Ancestors},
\operatorname{Slots},
\chi,
\operatorname{Sched}
\bigr),
\]

where \(\chi\) is an explicit disjoint first-exit channel map and every component is an actual function on finite histories.

Then state an exact quantifier prefix. For example, if \(C\) is genuinely absolute,

\[
\exists C>0\ \forall\delta>0\
\exists \varepsilon_\delta,h_\delta,\{\Sigma_{n,\delta}\}_{n\ge2}\
\exists N_\delta\
\forall n\ge N_\delta\
\forall \Pi\
\forall X\in\mathcal X_n\
\forall t\in\{0,\ldots,\tau_X\}.
\]

The statement must also choose one area bank and state every parameter relation needed later, such as

\[
\varepsilon(H)h(n)^2\longrightarrow0
\]

if the \(\varepsilon(H)X\) term is to be absorbed into \(X/h^2\).

That repair makes A precise, but it does not rescue B or C.

---

# B. Nondegeneracy: **REFUTED**

## B.1 Eighth witness: micro-baseline compression inside the trapping algorithm

The document tries to ensure nontriviality using

\[
|\widehat Q_X|>\frac{X}{h^2},
\qquad
D_X(0)>H,
\qquad
\tau_X\ge1.
\]

But it never requires

\[
|\widehat Q_X|\gg H.
\]

That omission lets the entire frozen ledger be paid for by the single first clock increment \(CH\).

Let

\[
B:=\lfloor H\rfloor+1.
\]

Use the standard disjoint dyadic shell system. Define a deterministic trapping algorithm \(\widetilde{\mathcal T}_n\) as follows. One may prepend whatever smooth/rough routine the document intends; before declaring its first endpoint, continue with this sweep.

At every nonterminal Shortener turn:

1. Search the shells in a fixed order for the first \(X\) satisfying
   \[
   D_X(A)>H
   \quad\text{and}\quad
   |Q_X(A)|>B.
   \]
2. If such a shell exists, play the least
   \[
   d\in D(A)
   \]
   attaining \(D_X(A)\).
3. If no such shell exists, declare the first prescribed endpoint \(b\).

All tie-breaking is explicit. The move is legal because \(d\in D(A)\).

### Uniform \(o(n)\) endpoint bound

Whenever the algorithm makes a sweep move, the integer-valued degree satisfies

\[
D_X(A)\ge B.
\]

Therefore the chosen \(d\) makes at least \(B\) currently live members of \(Q_X(A)\) illegal. Those target-shell incidences never return.

For disjoint dyadic shells there are at most \(n-1\) target-shell incidences initially. Hence the number of Shortener sweep moves is at most

\[
\frac{n-1}{B}.
\]

Including interleaved Prolonger moves, the endpoint occurs within

\[
\frac{2(n-1)}{B}+1
=
O\!\left(\frac nH\right)
=
o(n)
\]

actual moves, uniformly over every Prolonger continuation.

Thus \(\widetilde{\mathcal T}_n\) satisfies every formal endpoint condition listed in the document.

### State at the freeze

At its endpoint, every shell satisfies

\[
D_X(A_b)\le H
\quad\text{or}\quad
|\widehat Q_X|\le B.
\tag{B1}
\]

Consequently, every **baseline-active** shell must satisfy

\[
|\widehat Q_X|\le B.
\tag{B2}
\]

The exact normalization (N3) now gives

\[
\operatorname{Anc}_X(t)
\le
\sum_{F\in\widehat{\mathscr F}_X}\widehat w_X(F)
=
|\widehat Q_X|
\le B.
\tag{B3}
\]

At \(t=0\), no post-freeze first exit has occurred, so

\[
\operatorname{Anc}_X(0)=0.
\]

For every integer \(t\ge1\), and all sufficiently large \(n\),

\[
B
=
\lfloor H\rfloor+1
\le H+1
\le 2H
\le 2Ht.
\]

Therefore BF-AH holds with the completely uninformative choices

\[
\boxed{
C=2,\qquad
\varepsilon(H)\equiv0
}
\]

and any \(h(n)\to\infty\). Indeed,

\[
\operatorname{Anc}_X(t)
\le B
\le 2Ht
\le 2\mathsf A_X(t)+2Ht
\]

for every \(1\le t\le\tau_X\), uniformly over every subsequent Prolonger strategy and regardless of what the post-freeze policy does.

Take, for completeness, the following deterministic extension \(\Sigma\): on each Shortener turn, service the first shell in the fixed order with degree \(>H\) by choosing its least maximum-degree divisor; if none exists, choose the least legal integer.

This is a fully specified legal policy.

## B.2 Why this is an eighth collapse

This witness is not any of the seven named ones:

- The game need not be terminal.
- A nonempty baseline-active shell may remain.
- Its degree cap need not hold at \(b\).
- The stopping interval has positive length:
  \[
  \tau_X\ge1.
  \]
- The stopping move is included.
- The ledger is frozen exactly once.
- Every weight is positive and the total mass is exact.
- No face is omitted.
- No channel is changed after the freeze.
- The global clock includes every move.

Nevertheless no chronological ancestor estimate is proved. The entire ledger is merely compressed to \(O(H)\) before the freeze, and the first \(CH\) clock allowance pays for all of it.

This is stronger than the already discussed cap-before-freeze defect. The previous defect made \(\tau_X=0\). Here one can have

\[
D_X(0)>H,\qquad \tau_X\ge1,
\]

yet the estimate is automatic.

The document’s activity conditions and endpoint inclusion therefore do not establish a “genuinely nontrivial baseline.” They establish only a positive-length interval, not a ledger whose mass is asymptotically larger than the built-in \(O(H)\) allowance. The claimed BF-AH quantifiers are exactly those displayed in the document. 

## B.3 The outer-quantifier defect

The document’s response to prelude and pre-freeze attacks is that the post-trapping policy cannot alter \(b\). 

My policy does not alter \(b\) after the fact. The trapping algorithm itself, fixed before play, declares its first endpoint only after the compression sweep.

If the intended meaning is that one particular externally supplied \(\mathcal T_n^\star\) must be used and may not be replaced by \(\widetilde{\mathcal T}_n\), then the document must name \(\mathcal T_n^\star\). Under that repaired statement this witness may become inadmissible, but that is precisely the well-formedness repair identified in A. The literal statement cannot invoke an unspecified adjective such as “smooth/rough” to disqualify a fully defined algorithm satisfying all the conditions it actually lists.

## B.4 Audit of the seven advertised exclusions

### 1. Terminal delay

Conditionally sound. Once a particular nonterminal \(b\) and a baseline-active shell are fixed, terminal delay cannot erase its ledger, and the terminal stopping move is included.

It does not address an empty active-shell domain or an \(O(H)\)-mass active ledger.

### 2. Prelude delay

Not closed as written. It proves only that \(\Sigma\) cannot change the endpoint of an already identified \(\mathcal T_n\). It does not prevent the selected trapping algorithm or selected stopping rule from containing the compression sweep.

### 3. Pre-freeze cap forcing

The argument excludes a sweep that reaches \(D_X\le H\) after the freeze.

It does not exclude the present sweep, which freezes with either

\[
D_X\le H
\]

or

\[
|\widehat Q_X|\le H+1.
\]

The second alternative can satisfy \(D_X>H\), so the formal positive-interval test survives while BF-AH remains trivial.

### 4. Shell deferral

The document proves only that elapsed time does not by itself trigger halving or degree capping. It overlooks that elapsed time makes the **inequality** itself vacuous.

In general, N3 gives

\[
\operatorname{Anc}_X(t)\le|\widehat Q_X|.
\]

Therefore once

\[
t\ge\frac{|\widehat Q_X|}{CH},
\]

the \(CHt\) term alone proves BF-AH. Thus deferral supplies free certificate credit even when it supplies no free state transition. The assertion that this is automatically part of a “global sublinear scheduling budget” is not accompanied by a summability or prefix bound. 

In the eighth witness, saturation occurs already at \(t=1\).

### 5. Zero weights and omitted faces

N1–N3 correctly rule out zero total mass and literal omission of targets.

They do not rule out all mass lying in a ledger of total size \(O(H)\), which is the present collapse.

They also do not by themselves ensure that each positive mass unit has a meaningful designated-ancestor channel; that still depends on the external canonical construction.

### 6. First-exit reassignment

Freezing an explicit channel assignment would prevent later reassignment.

But the initial priority partition is not actually declared. Thus the argument is valid only after the A-level formalization repair.

### 7. Non-collapse to the cost-only statement

The document correctly rules out the particular strategy “play optimally until terminal, then initialize the ledger.”

That establishes only that one old collapse is absent. It does not establish that every BF-AH witness must prove a direct-ancestor theorem. The micro-baseline witness is unconditional, costs \(O(n/H)=o(n)\), and never uses an optimal terminal strategy.

Hence the verdict for B is decisively **REFUTED**.

A suitable repair would have to do both of the following:

\[
\text{fix the trapping algorithm externally}
\]

and require, for every audited shell,

\[
\frac{|\widehat Q_X|}{H}\longrightarrow\infty
\]

uniformly, or else place all \(O(H)\)-mass shells into a separately proved globally negligible error class.

---

# C. The implication: **REFUTED**

There are two independently fatal steps.

## C.1 A one-epoch statement is silently iterated

BF-AH freezes exactly one reservoir

\[
\widehat Q_X=Q_X(A_b)
\]

and defines exactly one stopping event

\[
\tau_X
=
\min\left\{
t\ge1:
D_X(t)\le H
\ \text{or}\
|Q_X^t|\le\tfrac12|\widehat Q_X|
\right\}.
\]

Its inequality is required only for

\[
0\le t\le\tau_X.
\]

The document also expressly forbids rebasing a shell or changing any frozen face, weight, ancestor, or slot. 

Suppose, charitably, that BF-AH and the stipulated reductions prove one estimate

\[
q_1
\le
\frac12q_0+\frac{X}{h^2},
\qquad
q_0=|\widehat Q_X|.
\tag{C1}
\]

To obtain a second estimate of the required form, one needs

\[
q_2
\le
\frac12q_1+\frac{X}{h^2}.
\tag{C2}
\]

But (C2) requires a new baseline \(q_1\), a new face family, new weights, and a new stopping event. BF-AH supplies none of those. Once the original reservoir is halved, \(t=\tau_X\) and the theorem stops.

Keeping the old ledger does not help: it can at most prove another estimate relative to \(q_0\), not a halving relative to \(q_1\). Moreover, the cumulative area term is then already of order \(q_0\), so the old estimate has lost the fresh-block form needed for iteration.

The document nevertheless says:

> “Applying (9) \(O(\log h)\) times gives a residual \(O(X/h)\).”

That is the exact false step. 

The proof is using an epoch-uniform theorem

\[
\text{BF-AH at every scheduler-generated restart}
\]

whereas the statement provides only

\[
\text{BF-AH at the single common baseline }b.
\]

This is not a small omission. The natural repair—fresh ledgers at later epochs—is precisely what the statement prohibits unless one introduces a master ledger that proves no old loss is forgotten.

## C.2 The global \(Ht\) term has no usable shell budget

The clock \(t\) counts every actual move after \(b\), including moves spent on other shells. 

That makes BF-AH resistant to one bookkeeping reset, but it also makes its \(CHt\) term nonlocal and repeatedly counted.

For every shell,

\[
\operatorname{Anc}_X(t)
\le |\widehat Q_X|
\le |S_X|
\le \frac X2+1.
\]

Hence, after

\[
t\asymp\frac XH,
\]

the inequality becomes automatic regardless of any ancestor-harvest mechanism.

A total scheduling cost \(t=o(n)\) does not imply

\[
Ht=o(X)
\]

uniformly over shells. For example, a shell with scale \(X=n/h^2\) can be reached after \(t=n/h=o(n)\) prior moves, while

\[
\frac{Ht}{X}
=
Hh
\longrightarrow\infty.
\]

Thus “global sublinear time” gives no useful bound at that shell scale.

There is also an incompatibility visible in the document’s own claimed block cost. It says a shell uses

\[
t=O\!\left(\frac{X\log h}{h}\right)
\]

turns. Then

\[
Ht
=
O\!\left(
X\frac{H\log h}{h}
\right).
\]

For this to be \(o(X)\), one needs at minimum

\[
\frac{H\log h}{h}\longrightarrow0.
\tag{C3}
\]

No such hierarchy appears. The phrase “choose \(h\) sufficiently slowly” ordinarily points in the opposite direction; in any case it is not the mathematical condition (C3).

Moreover, because \(t\) is an absolute clock, the same earlier move contributes \(H\) units of allowance to every shell not yet stopped. A proof that the \(Ht\) terms are “part of the global budget” requires an explicit overlap inequality such as

\[
\sum_{X,j} H\,\ell_{X,j}=o(n),
\]

where \(\ell_{X,j}\) is a properly charged local epoch clock. No such inequality is stated or derived.

Therefore the passage

\[
\operatorname{Repair}_X(t)
\le o(X)+O(Ht)+C\mathsf A_X(t)
\tag{8}
\]

to the block contraction (9) silently treats the global \(t\) as a locally bounded and summable clock. That is a substantive strengthening of BF-AH.

## C.3 The error hierarchy is also unstated

To absorb the BF-AH error

\[
\varepsilon(H)X
\]

into the desired additive error

\[
\frac{X}{h^2},
\]

one needs, quantitatively,

\[
\varepsilon(H)h^2\longrightarrow0.
\]

The two separate facts

\[
\varepsilon(H)\to0,
\qquad
h\to\infty
\]

do not imply this. A diagonal choice of \(h\) can enforce it, but only if the quantifier order explicitly permits \(h\) to be chosen after \(\varepsilon\) and after every other uniform error modulus.

This is repairable, unlike the one-epoch defect, but it is another place where “sufficiently slowly” is doing unproved work.

## C.4 What survives

The residual algebra

\[
\frac{2^r\mathfrak T(n)}{q_H}=o(1)
\]

is consistent with the stipulated parameter choices. I do not find a circular invocation of \(L(n)=o(n)\) in that calculation or in the final use of the accepted static-completion theorem.

The failure occurs between the local repair estimate and the claimed iterable shell contraction.

## C.5 Necessary repair

A sufficient replacement would need an epoch-indexed statement. For every shell \(X\) and every prescribed epoch \(j\), one would freeze

\[
Q_{X,j}^0,\qquad
\mathscr F_{X,j}^0,\qquad
w_{X,j}^0,
\]

and prove BF-AH until that epoch’s halving or cap event, while also maintaining a master first-exit ledger ensuring that moving from epoch \(j\) to \(j+1\) does not erase any earlier ancestor loss.

The clock must be replaced by a charged clock \(\ell_{X,j}\) satisfying a proved global budget, for example

\[
\sum_{X,j}H\ell_{X,j}=o(n).
\]

Alternatively, one needs a genuinely single-baseline potential valid all the way until

\[
|Q_X|\le O(X/h),
\]

not merely until the first halving.

That would be a materially stronger theorem than BF-AH.

---

# Final referee conclusion

The document has not reached a canonical nondegenerate separator.

Its literal statement admits the following unconditional collapse:

\[
\boxed{
\begin{minipage}{0.86\linewidth}
Before the first declared trapping endpoint, compress every uncapped
shell to at most \(\lfloor H\rfloor+1\) live targets. This costs
\(O(n/H)=o(n)\) moves. Every shell that is still baseline-active then
has total frozen weight \(O(H)\), so \(CHt\) dominates the entire ledger
for every \(t\ge1\). BF-AH holds with \(C=2\) and
\(\varepsilon\equiv0\), without any chronological ancestor theorem.
\end{minipage}}
\]

Even after forbidding that witness by externally fixing the trapping algorithm, the claimed implication still fails at the sentence “Applying (9) \(O(\log h)\) times”: BF-AH has only one baseline and ends at the first halving, while the proof requires a fresh uniform theorem at every subsequent block. The global-clock \(Ht\) term is also not shown to be locally useful or globally summable.

Thus the decisive assessments are:

\[
\boxed{
\text{A: REPAIRABLE,\qquad
B: REFUTED,\qquad
C: REFUTED.}
}
\]
---
id: R114-frozen-ledger-preforce-degenerate
type: research
date: 2026-07-12
intent: >
  Prove or disprove the frozen-ledger ancestor-harvest statement (AH*):
  a prescribed post-trapping activation time per shell, frozen
  reservoir/face-family/weights with no reinitialization, immediate
  processing, and Anc_X(t) <= o(X) + O(Ht) uniformly at stopping times
  before the degree cap or halving of the frozen reservoir.
predecessors: [R112-ancestor-harvest-degenerate]
action:
  kind: extends
  target: R112-ancestor-harvest-degenerate
claim: >
  (AH*) as stated is unconditionally true for a degenerate PRE-FREEZE
  reason: Shortener can use a preannounced sublinear sequence of moves
  before s_X (total cost O(n/H + log n) = o(n)) to make the degree-cap
  stopping condition already hold at the freeze, so the quantified
  processing interval has length zero. This witness is stronger than
  terminal delay: the schedule is fixed before subsequent Prolonger
  play, no ledger is rebased, and the game need not be terminal.
  "Fixed in advance" controls adaptivity of the activation time but
  not its lateness; the specification freezes the ledger at s_X
  instead of at the common post-trapping baseline with all subsequent
  losses (including scheduling losses) charged to that original
  ledger, which is the correct repair.
implications:
  - Fourth formulation collapse in the ancestor-harvest family; the
    canonical nondegenerate statement must freeze at the common
    post-trapping baseline, impose a uniform o(n) trapping deadline,
    normalize the ledger, and make stopping events non-preforcible.
  - Formulating the statement is itself adversarial work; delegate the
    next formulation to the researcher with all failed variants and
    the audit repair list attached as constraints.
verifiers_at_time:
  - [R113-audit-shadow-and-ah-claims, agrees-in-mechanism-on-prelude-hole]
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/researcher-R114-frozen-ledger-ancestor-harvest.md
---

# Verdict

\[
\boxed{\text{(AH*) is unconditionally true as stated, but for a degenerate pre-freeze reason.}}
\]

The freezing condition prevents **reinitialization after** \(s_X\). It does not prevent Shortener from using a preannounced, sublinear sequence of moves **before** \(s_X\) to make the degree-cap stopping condition hold, and only then freezing the ledger. Consequently the quantified processing interval has length zero.

This is stronger than the old terminal-delay defect:

- the activation schedule is fixed before the subsequent Prolonger play;
- no ledger is ever rebased;
- the game need not be terminal;
- the complete preactivation cost is only \(O(n/H+\log n)=o(n)\) when \(H\to\infty\).

Thus “fixed in advance” controls adaptivity of the activation time, but not lateness of the first freeze. The uploaded specification freezes the ledger at \(s_X\), rather than freezing it at the common post-trapping baseline and counting all losses thereafter. 

---

## 1. Monotonicity

For a shell \(S_X\), write

\[
\deg_A^X(d)
   :=\#\{u\in Q_X(A):d\mid u\},
\qquad
\Delta_X(A):=\max_{d\in D(A)}\deg_A^X(d),
\]

with \(\Delta_X(A)=0\) when \(D(A)=\varnothing\).

If \(A'\) is a continuation of \(A\), then

\[
Q_X(A')\subseteq Q_X(A),
\qquad
D(A')\subseteq D(A).
\]

Moreover, for every \(d\in D(A')\),

\[
\deg_{A'}^X(d)\le \deg_A^X(d).
\]

Hence

\[
\Delta_X(A')\le \Delta_X(A).
\tag{1}
\]

In particular, once the degree cap \(\Delta_X\le H\) holds, it holds forever.

Also, whenever \(\Delta_X(A)>H\), Shortener can legally select some \(d\in D(A)\) with

\[
\deg_A^X(d)\ge H+1.
\]

That move makes at least \(H+1\) currently live members of \(Q_X(A)\) illegal. Those targets never return.

---

## 2. A prescribed pre-freeze cap sweep

Fix the stipulated smooth/rough trapping policy and let \(s_{\mathrm{tr}}\) be the end of its trapping phase.

Let \(\mathcal X_n\) be the fixed dyadic shell system, in any predetermined order, say decreasing \(X\). Put

\[
M_X:=|S_X\cap\{2,\ldots,n\}|.
\]

For the usual disjoint dyadic shells,

\[
\sum_{X\in\mathcal X_n}M_X\le n-1;
\]

constant overlap would make no difference.

Set

\[
B:=H+1,
\qquad
m_X:=\left\lceil\frac{M_X}{B}\right\rceil.
\tag{2}
\]

At \(s_{\mathrm{tr}}\), before observing any subsequent Prolonger play, Shortener announces the following complete schedule.

For each shell \(X\), she reserves exactly \(m_X\) of her turns before activating that shell. On every such reserved turn:

- if \(\Delta_X>H\), she plays the least legal \(d\in D(A)\) attaining \(\Delta_X\);
- if \(\Delta_X\le H\), she plays the least currently legal integer as a fallback.

After exactly those \(m_X\) Shortener turns, she activates shell \(X\), freezes

\[
Q_X^0=Q_X(s_X),\qquad
\mathscr F_X^0,\qquad
w_X^0,
\]

and never rebases that ledger.

The shell order, the integers \(m_X\), and therefore all activation offsets \(s_X-s_{\mathrm{tr}}\), are fixed before the intervening play. Only the legal move selected inside an allocated turn depends on the current position, as any online policy necessarily must. Ties and fallbacks have been completely specified.

If the game terminates before some scheduled activation, use the usual absorbing extension of the terminal state; equivalently, all remaining reservoirs are empty and already capped.

---

## 3. Every shell is capped when its ledger is frozen

Fix a shell \(X\). Suppose for contradiction that

\[
\Delta_X(s_X)>H.
\tag{3}
\]

By monotonicity (1), the cap could not have held at any earlier point during the \(m_X\) allocated turns. Therefore on every one of those turns Shortener selected a legal lower integer of shell degree at least \(B=H+1\).

Each such move removed at least \(B\) currently live shell targets. The sets removed on different turns are disjoint, because illegality is irreversible. Consequently those \(m_X\) moves removed at least

\[
m_XB
   \ge
   \left\lceil\frac{M_X}{B}\right\rceil B
   \ge M_X
\]

distinct members of \(S_X\).

But there were at most \(M_X\) shell integers altogether. Thus \(Q_X(s_X)=\varnothing\), which implies

\[
\Delta_X(s_X)=0,
\]

contradicting (3). Hence

\[
\boxed{\Delta_X(s_X)\le H}
\tag{4}
\]

for every Prolonger continuation and every shell.

Notice that \(Q_X(s_X)\) need not be empty. The sweep can make all useful lower moves have degree at most \(H\) while leaving a large reservoir. The degeneracy is therefore not terminality.

---

## 4. Verification of (AH*)

Let \(\tau_X\) denote the first postactivation time at which either

\[
\Delta_X\le H
\]

or the frozen reservoir \(Q_X^0\) has been halved.

By (4), the first condition already holds at activation, so

\[
\tau_X=0.
\]

If “before the stopping time” means \(t<\tau_X\), there are no such \(t\).

The stronger convention in the attached Section 5 tests the endpoint \(0\le t\le\tau_X\). Then the only relevant time is \(t=0\). Since the ledger has just been frozen, no face has yet had a post-freeze first exit, and therefore

\[
\operatorname{Anc}_X(0)=0.
\]

We may take

\[
\varepsilon(H)=0
\]

and any absolute \(C\ge1\). Then

\[
\operatorname{Anc}_X(0)
 =0
 \le
 \varepsilon(H)X+CH\cdot0
 =0.
\]

Thus, uniformly over every shell, starting history, and Prolonger strategy,

\[
\boxed{
\operatorname{Anc}_X(t)
   \le o(X)+O(Ht)
}
\]

at every stopping time demanded by the literal statement.

No information about residual blockers, traces, common cores, or direct ancestors was needed.

---

## 5. The preactivation cost is already sublinear

From (2),

\[
\sum_{X\in\mathcal X_n}m_X
 \le
 \frac{\sum_XM_X}{H+1}
   +|\mathcal X_n|
 =
 O\!\left(\frac nH+\log n\right).
\]

In the intended regime \(H=H(n)\to\infty\),

\[
\sum_Xm_X=o(n).
\tag{5}
\]

There is at most one Prolonger move between consecutive Shortener moves, so the number of actual moves spent during this entire pre-freeze phase is also \(o(n)\). Adding the stipulated \(o(n)\)-move trapping sweep still gives \(o(n)\).

Therefore the defect is not repaired by saying that scheduling and prelude costs must be counted. This witness has sublinear cost without assuming \(L(n)=o(n)\).

---

## 6. Even a one-move nonterminal block can be arranged

The zero-length interval is not essential.

Replace \(m_X\) by

\[
m_X'
 :=
 \max\!\left\{
 0,\,
 \left\lceil\frac{M_X}{H+1}\right\rceil-1
 \right\}.
\]

At the resulting activation time, either the cap already holds, or every one of the \(m_X'\) previous moves removed at least \(H+1\) targets. In the latter case,

\[
|Q_X^0|
 \le
 M_X-m_X'(H+1)
 \le H+1.
\tag{6}
\]

If the cap does not yet hold, then necessarily

\[
\Delta_X(s_X)>H
\quad\text{and}\quad
|Q_X^0|\le H+1.
\]

Shortener immediately plays a maximum-degree move. It removes at least \(H+1\) shell targets, so \(Q_X\) becomes empty and the cap holds after one processing move.

Under the standard normalization of the canonical weighted ledger,

\[
\sum_{F\in\mathscr F_X^0}w_X^0(F)=|Q_X^0|.
\]

Therefore, even if every frozen face were charged to the direct-ancestor channel during that single move,

\[
\operatorname{Anc}_X(1)
 \le |Q_X^0|
 \le H+1
 \le 2H.
\]

So the claimed estimate holds with \(C=2\). This shows that merely insisting on a formally positive processing interval does not repair the problem: Shortener may first compress the reservoir to \(O(H)\), freeze only then, and finish in one move.

---

## 7. Why this does not imply \(L(n)=o(n)\)

The cap sweep can reach

\[
\Delta_X\le H
\]

while leaving

\[
|Q_X|\asymp X.
\]

The frozen ancestor estimate is then vacuous, but the shell has not been halved. Such a capped large reservoir is exactly the difficult alternative highlighted by the fortress discussion.

The invalid step in the proposed conditional pipeline is therefore:

\[
\text{an estimate beginning from }Q_X(s_X)
\quad\Longrightarrow\quad
\text{halving progress from the original post-trapping }Q_X.
\]

Those two starting reservoirs need not be comparable. The policy can erase or cap almost all relevant structure before \(s_X\), and none of that pre-freeze history appears in \(\operatorname{Anc}_X\).

Freezing forbids resetting the ledger **after** \(s_X\); it does not stop Shortener from choosing a late first ledger.

---

## 8. The correction that actually closes the loophole

A genuine frozen-ledger theorem must distinguish the **baseline freeze time** from the later **scheduled processing time**.

Let \(b\) be the prescribed common end of trapping. At \(b\), simultaneously freeze for every shell

\[
\widehat Q_X:=Q_X(b),\qquad
\widehat{\mathscr F}_X,\qquad
\widehat w_X.
\]

If shell \(X\) is scheduled for active processing only at a later time \(s_X\), all first exits during

\[
[b,s_X]
\]

must remain on this original ledger and be included in \(\operatorname{Anc}_X\). Halving must likewise be measured relative to \(\widehat Q_X\), not relative to the smaller set \(Q_X(s_X)\).

Equivalently, define

\[
\tau_X
 :=
 \inf\left\{
 t\ge0:
 \Delta_X(b+t)\le H
 \ \text{or}\
 |Q_X(b+t)|\le\frac12|\widehat Q_X|
 \right\},
\]

and require the ancestor estimate from time \(b\), including all scheduling delay.

A fully explicit nondegeneracy condition would therefore require, for every relevant block,

\[
|\widehat Q_X|>\frac{X}{h^2},
\qquad
\Delta_X(b)>H,
\]

with every post-\(b\) move charged to the frozen ledger. The phrase “the stopping condition may not already hold merely because activation was deferred” should be replaced by these objective inequalities; “merely because” is not a mathematical predicate.

---

# Conclusion

\[
\boxed{
\begin{aligned}
&\text{Literal (AH*) is true;}\\
&\text{its witness is a precommitted }O(n/H)\text{-move cap-before-freeze sweep;}\\
&\text{the ledger is frozen once and never rebased;}\\
&\text{nevertheless every block begins at, or one move from, its stopping event.}
\end{aligned}}
\]

Thus the proposed freezing does **not** yet isolate the chronological direct-ancestor theorem. It freezes too late. The substantive statement needed by the online-area pipeline is the different assertion in which every shell’s ledger is frozen at the common post-trapping baseline and all subsequent losses, including scheduling losses, remain charged to that original ledger.
---
id: R119a-no-go-scope-limited
type: verification
date: 2026-07-12
intent: >
  Adjudicate the claimed ancestor-harvest formulation no-go against the
  established fortress-prevention theorem, with the quantifier
  reconciliation as primary check.
predecessors: [R118-ancestor-harvest-no-go, R104-fixed-cap-entry-refuted]
action:
  kind: refutes
  target: R118-ancestor-harvest-no-go
failure_mechanism: >
  The family-wide no-go inference is invalid. Part IV's disproof is
  VALID only for the statement as literally written, whose (CAP) clause
  quantifies over ALL baseline positions in B_n — including positions
  UNREACHABLE against the policy being quantified. The fortress
  counterexample is in fact NOT reachable against a policy
  incorporating the established clearing sweep (the prevention theorem
  applies; the two documents quantify over fundamentally different
  position sets), so the disproof says nothing about
  trajectory-restricted formulations in which the capped-state
  obligation applies only to states actually reachable against the
  policy. Additionally Parts I-II are only REPAIRABLE: epoch laundering
  is not fully closed and there is an eleventh collapse via uncharged
  scheduling delay.
claim: >
  Verdicts: B VALID with the reachability correction (the exact
  written statement is indeed false, defeated off-path); A REPAIRABLE
  (eleventh collapse: uncharged scheduling delay); C REFUTED — the
  surviving canonical target is the trajectory-restricted,
  reachability-aware ancestor-harvest / capped-state formulation, and
  no theorem of this record rules it out.
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/audit-R119-no-go-vs-fortress-prevention.md
---

# Adjudication

The decisive quantifier issue favors Part IV **for the statement actually written**, but not for a trajectory-restricted replacement. Parts I–II still have formulation defects, and Part V substantially overstates what Part IV proves. I treat the uploaded document as the operative record. 

| Item | Verdict |
|---|---|
| **B. Part IV and Document II** | **VALID**, with an important correction: the fortress is not reachable against the clearing policy, but reachability is irrelevant under Document I’s universal-baseline quantifiers |
| **A. Parts I–II** | **REPAIRABLE**, but not valid as written; epoch laundering is not fully closed, and there is an eleventh collapse through uncharged scheduling delay |
| **C. Family-wide no-go** | **REFUTED**; Part IV rules out a particular uniform off-path CAP formulation, not the whole advertised family |

---

# B. Part IV: the quantifiers do not let Document II rescue the stated theorem

## 1. The clearing policy does prevent the fortress from being reached

Write \(r_{\mathrm{av}}(n)\) for Document II’s degree-availability scale, to distinguish it from Document I’s unrelated parameter

\[
r=\lfloor(\log H)^{1/3}\rfloor.
\]

Assuming the informal phrase “\(H_0(n)\to\infty\) slowly” is made precise as

\[
H_0(n)=o(r_{\mathrm{av}}(n)),
\]

Document II gives a Shortener policy \(\Sigma_{\mathrm{clr}}\) such that, from the actual initial game position,

\[
\forall \Pi\quad
\operatorname{Play}(\Sigma_{\mathrm{clr}},\Pi)
\]

never contains a trapped upper reservoir of density at least \(c\) and cap at most \(H_0(n)\).

Thus the answer to the literal reachability question is:

\[
\boxed{\text{No, }A_n^\star\text{ is not obtainable against }\Sigma_{\mathrm{clr}}.}
\]

Document I’s use of “obtainable” must therefore not be read as “obtainable against every Shortener policy,” or even as “obtainable against the eventual witness policy \(\Sigma_{n,\delta}\).” It can only mean obtainable along some legal play.

That distinction does **not**, however, save the stated \(\mathrm{RMEAH}^{\sharp}\).

## 2. Document I does not quantify only over baselines reached by its policy

The operative portion of Document I’s prefix is

\[
\exists \Sigma_{n,\delta}\;
\forall A\in\mathcal B_n\;
\forall\Pi.
\]

This is an off-path or subgame-uniform requirement. The strategy is chosen first and must then satisfy the assertion from **every** admitted baseline \(A\), including baselines that would never arise from the initial game if that same strategy had been used earlier.

By contrast, Document II proves a statement of the form

\[
\exists\Sigma_{\mathrm{clr}}\;
\forall\Pi\;
\bigl(
\operatorname{Reach}_{\varnothing}(\Sigma_{\mathrm{clr}},\Pi)
\cap\mathcal F_{c,H_0}
=\varnothing
\bigr),
\]

where \(\mathcal F_{c,H_0}\) is the fortress class.

These statements are perfectly compatible:

- \(\Sigma_{\mathrm{clr}}\) can prevent \(A_n^\star\) from being reached from the initial position.
- The same total strategy still has prescribed moves at a hypothetical history rooted at \(A_n^\star\).
- Document I expressly tests it at that hypothetical root because \(A_n^\star\in\mathcal B_n\).

The load-bearing premise in Part IV is therefore not “\(A_n^\star\) is obtainable.” It is

\[
\boxed{A_n^\star\in\mathcal B_n.}
\]

Document I explicitly stipulates that baseline-complete data include the accepted primorial-batched trapped positions. Once that inclusion is granted, reachability against \(\Sigma\) is irrelevant.

## 3. The clearing sweep cannot be restarted after the fortress is supplied as the baseline

Document II’s sweep succeeds because, before entry into the fortress, the whole live upper set has a lower legal divisor of degree on the order of \(r_{\mathrm{av}}(n)\). It exploits those high degrees to remove a fixed density in

\[
O\!\left(\frac{n}{r_{\mathrm{av}}(n)}\right)
\]

actual moves.

At the supplied fortress baseline \(A_n^\star\), that opportunity has already disappeared. Against the entry reservoir, every subsequently legal lower move has degree at most \(H_0(n)\). Consequently, during the CAP window

\[
T_n=O_\delta\!\left(n\frac{\log H}{H^2}\right),
\]

the total direct erosion is at most

\[
H_0(n)T_n
\le
O_\delta\!\left(n\frac{\log H}{H}\right)
=o(n).
\]

Selections and exact-only transfers add only \(o(n)\). Thus even a policy that says “always play a maximum-degree lower move” cannot recover the earlier sweep once initialized at \(A_n^\star\).

The policy cannot retroactively make the moves that would have prevented the state.

## 4. Formal negation of the quantifier prefix

Fix \(\delta\), any finite \(K_\delta\), any proposed strategy family, and any \(N\). For infinitely many sufficiently large \(n\), Part IV supplies an admitted baseline \(A_n^\star\) with \(q_n\ge cn\). Its deterministic erosion estimate gives, for every continuation,

\[
|Q_n^{\mathrm{end}}|
\ge q_n-o(n)
>
\frac12q_n+\frac{n}{h^2}.
\]

Therefore, in fact, Part IV provides the stronger negation

\[
\forall\Sigma\;\forall N\;
\exists n\ge N\;
\exists A_n^\star\in\mathcal B_n\;
\forall\Pi:
\neg\mathrm{CAP}(\Sigma,A_n^\star,\Pi).
\]

That directly contradicts

\[
\exists\Sigma\;
\forall n\ge N\;
\forall A\in\mathcal B_n\;
\forall\Pi:
\mathrm{CAP}.
\]

So the decisive Part IV conclusion survives Document II.

## 5. What changes under a trajectory-restricted formulation

Suppose the theorem were instead changed to

\[
\exists\Sigma\;
\forall\Pi\;
\forall A\in
\operatorname{ReachBaselines}(\Sigma,\Pi):
P(\Sigma,A,\Pi).
\]

Then Part IV could no longer insert \(A_n^\star\) merely because it exists or is obtainable under some other play. Under the premise \(H_0=o(r_{\mathrm{av}})\), Document II’s clearing policy would exclude it.

Nor does Document I establish that its other clauses prevent the clearing sweep:

- CAP is conditional; if the bad capped state never occurs, CAP creates no obstacle.
- The high-degree inequalities do not themselves prove that the maximum-degree sweep is illegal.
- No incompatibility is shown between the sweep and the fixed scheduler.
- The fixed-density sweep does not prove OA, but it is sufficient to invalidate this particular fortress counterexample on the chosen trajectory.

There is one qualification: Document I currently starts its existential policy **after** an externally supplied baseline. To exploit Document II, the sweep must be incorporated before baseline admission, or the baseline class must be restricted to outputs reachable after the sweep. Merely saying that the continuation strategy “would have swept earlier” is not enough under the present prefix.

### B verdict

\[
\boxed{\textbf{VALID}}
\]

Part IV correctly refutes the universally baseline-complete assertion. Its rhetoric about “obtainability” should be replaced by the more precise statement that the fortress is an explicitly admitted off-path baseline.

---

# A. Parts I–II: the formulation is not yet genuinely closed

The CAP clause does close the elementary version of cap escape: if a large capped state is supplied, the theorem no longer simply stops and declares success. But the epoch construction and scheduling rules still allow genuine collapses.

## 1. Epoch-boundary laundering is not actually eliminated

For an epoch beginning at \(s=s_{X,j}\), Document I defines

\[
\xi(\omega)
=
\min\left\{
t\ge s:
\max_c I_c(A,X,\omega,\mathfrak h_t)=1
\right\},
\]

but counts ancestor mass only when

\[
s<\xi(\omega)\le t.
\]

Consider an atom in the new epoch whose relevant obstruction was created before \(s\).

There are two natural interpretations of \(I_c\).

### Persistent-state interpretation

Suppose \(I_{\mathrm{anc}}\) remains true after the old spoiler has created the obstruction. Then at the new epoch start,

\[
\xi(\omega)=s.
\]

But such an atom is excluded by the strict inequality \(s<\xi(\omega)\). It contributes neither to \(\operatorname{Anc}_{X,j}\) nor to the new epoch’s area, since

\[
\mathsf A_{X,j}(s)=0.
\]

### Event-time interpretation

Suppose \(I_{\mathrm{anc}}\) is true only when the causal event occurs. If that event occurred before \(s\), then there may be no \(t\ge s\) at which the predicate becomes true, so

\[
\xi(\omega)=\infty.
\]

Again the inherited obstruction is omitted.

In both interpretations, the earlier setup move is also outside the new clock because

\[
\ell_{X,j}(t)
=
\sum_{i=s+1}^t\rho_{X,j,i}.
\]

Thus the new atom can be born already damaged while neither the old causal move nor the inherited deficit appears in the new ledger.

The statements

\[
\Omega_{X,j}\cap\Omega_{X,k}=\varnothing
\]

and

\[
\sum_j\text{exposure}(u,j)\le J_H
\]

do not fix this. They bound how many labels may exist; they do not impose a conservation law tying a future epoch atom to the earlier move that damaged it. Pre-registering a label is not the same as globally monitoring and charging its exit.

A genuine repair needs something like:

\[
\xi^{\mathrm{glob}}(\omega)
=
\min\{t\ge t_{\mathrm{baseline}}:I_c(\omega,\mathfrak h_t)=1\},
\]

together with an inherited-debt balance carried across epochs. Alternatively, the epoch ledger must consist only of globally unexited master mass, without renormalizing each surviving target to a fresh unit.

As written, Part II §10 has not proved that epoch-boundary laundering is gone.

## 2. Eleventh collapse: uncharged service starvation

The charged clock fixes one problem: unrelated elapsed time cannot be used to enlarge the right-hand side of ME-AH.

It does not fix the dual problem: unrelated elapsed time can occur without being charged at all.

There is no axiom requiring:

- every active high-degree shell to be opened as an epoch;
- every Shortener turn while an epoch is active to count in its clock;
- an active epoch to finish within a bounded number of actual turns;
- every actual Shortener move to be assigned to some active block;
- the scheduler to be fair or work-conserving.

Consequently, an active high-degree shell can remain unchanged during a segment of \(M\) actual moves for which

\[
\rho_{X,j,i}=0.
\]

During that segment one may have

\[
\ell_{X,j}(t+M)=\ell_{X,j}(t),
\]

\[
\mathsf A_{X,j}(t+M)=\mathsf A_{X,j}(t),
\]

and

\[
\operatorname{Anc}_{X,j}(t+M)
=
\operatorname{Anc}_{X,j}(t).
\]

Every stated inequality is unaffected, while the game length has increased by \(M\). The epoch can eventually finish with a small value of \(\ell\), so B1 and B2 still hold.

This is not the old “delay to accumulate a \(CHt\) credit” collapse. It is:

\[
\boxed{\text{delay with zero credit and zero accounting cost}.}
\]

The fixedness of \(\operatorname{Sched}\) does not prevent it. A fixed scheduler can still starve a shell, and no fairness or actual-duration property is imposed on that scheduler.

This also exposes a direct gap in Part III. From B1, Document I concludes that the number of Shortener service turns in shell \(X\) is

\[
O\!\left(\frac{\log h}{h}\sum_jm_{X,j}\right).
\]

But B1 bounds \(\ell_{X,j}\), not the number of Shortener turns or elapsed actual moves. No stated axiom identifies those quantities.

A repair needs either an actual-time bound such as

\[
\tau_{X,j}-s_{X,j}
\le
C\,\ell_{X,j}(\tau_{X,j})+g_{X,j},
\qquad
\sum_{X,j}g_{X,j}=o(n),
\]

or a global assignment rule under which every post-baseline Shortener turn is charged to exactly one active block, with bounded overlap and bounded queueing delay.

## 3. CAP blocks are not globally serialized

CAP says that for **every** time \(s\) and shell \(X\) satisfying C1, Shortener must “immediately enter an exclusive capped block for shell \(X\).”

Two literal problems follow.

First, several shells can satisfy C1 at the same time. Each then demands that every one of the next \(B_\delta(q)\) Shortener moves be assigned exclusively to its block. A single move cannot be exclusively assigned to two different blocks.

Second, while a CAP block is running, the same shell will generally continue to satisfy C1 at every intermediate time. The text therefore appears to retrigger a new “immediate” exclusive block at each step.

The scheduler may have been intended to serialize these triggers, but no rule says:

- which trigger has priority;
- whether other triggers are queued;
- whether “immediately” permits waiting;
- whether a shell may retrigger while already active;
- how waiting time is charged.

This is a literal well-formedness issue, not merely a proof omission.

## 4. The channel maps need correctness axioms

The text says that prose predicates have been replaced by fixed Boolean maps \(I_c\), but it imposes no formal coverage or semantic-consistency condition on those maps.

For example, the displayed axioms do not by themselves rule out

\[
I_{\mathrm{anc}}\equiv0,
\]

or a choice under which problematic events are never assigned any channel. L5 tells us how to choose the first true channel, but does not require some channel to become true whenever a relevant ledger loss occurs.

For Part III to follow, one needs an explicit partition or domination statement connecting every actual repair/lift failure to exactly one of the stipulated channels and to the accepted bounds for that channel.

Similarly, \(\Omega_{X,j}(A)\) and \(\pi_{X,j}\) are described as pre-registered at \(A\), yet their codomain

\[
Q_X^{s_{X,j}}
\]

depends on the future continuation, on \(\Pi\), and indirectly on \(\delta\). This can be formalized using contingent history-indexed atoms, but the required signatures and branch-consistency conditions are absent.

### A verdict

\[
\boxed{\textbf{REPAIRABLE}}
\]

The cap-escape idea is conceptually repaired by CAP, but the statement is not yet well-formed and nondegenerate as claimed. In particular:

1. the master ledger does not globally charge inherited pre-epoch damage;
2. the charged clock permits uncharged actual-time starvation;
3. CAP triggers lack serialization;
4. channel completeness is unstated.

The eleventh collapse is the uncharged-service or wall-clock-starvation witness. Even after adding a charged clock, the statement can ignore arbitrarily long stretches of actual play.

These repairs would improve the formulation, but they would not save the universal CAP assertion from Part IV.

---

# C. The family-wide no-go inference does not follow

Part IV proves a narrow and useful impossibility result:

> If a baseline class contains the robust fortress baselines, no theorem can demand that every such supplied capped baseline halve in
> \[
> O\!\left(q\frac{\log H}{H^2}\right)
> \]
> Shortener turns.

It also supports the separate observation:

> An ancestor inequality that simply stops at \(D_X\le H\), with no avoidance, clearing, amortization, or other capped-state argument, does not by itself imply OA.

Those conclusions do not establish the boxed family-wide no-go.

## 1. The trichotomy omits prevention

Part V asserts that if capped states are audited only on the chosen policy’s trajectory, the theorem must include direct CAP halving and therefore already contains OA.

That is false. There is another logical possibility:

\[
\boxed{
\text{The chosen policy prevents large capped states from being reached.}
}
\]

One may prove:

1. an ancestor-harvest theorem for reached high-degree states; and
2. a separate avoidance invariant such as
   \[
   D_X(t)\le H
   \Longrightarrow
   |Q_X(t)|\le X/h^2
   \]
   along the selected policy.

The second assertion is not a post-entry halving clause. It says the dangerous branch never occurs.

Document II is an independently verified fixed-density instance of exactly this logical architecture. It does not solve the full shrinking-density OA problem, but it disproves Part V’s assertion that policy restriction necessarily inserts CAP itself.

## 2. Uniform-all-baselines and policy-trajectory are not the only choices

There are intermediate formulations, for example:

- Audit all baselines satisfying a policy-independent structural invariant \(\mathcal G(A)\), and prove separately that the selected policy preserves \(\mathcal G\).
- Use a baseline class generated by a certified preprocessing map rather than all trapped \(o(n)\)-sized positions.
- Continue with a different potential below the cap instead of demanding immediate shell halving.
- Bound the aggregate mass of all capped blocks globally rather than halving each capped block individually.
- Change the cap scale dynamically or use nested cap thresholds.
- Allow capped blocks a longer local duration while paying for them through a cross-shell amortized potential.

None of these is covered by the purported “exactly one of three cases.”

## 3. “Baseline-independent” is being conflated with “uniform over all off-path baselines”

A theorem may have constants, ledger maps, and estimates that are baseline-independent while applying only to states satisfying a structural invariant. That is materially weaker than

\[
\forall A\in\mathcal B_n
\]

for a class deliberately enlarged to include every known off-path fortress.

Part IV rules out the latter. It does not rule out the former.

## 4. The corrected no-go statement

The justified conclusion is:

\[
\boxed{
\begin{minipage}{0.88\linewidth}
No baseline-uniform theorem whose admissible class contains the
primorial fortress baselines can require per-baseline CAP halving within
the budget \(O(q\log H/H^2)\).

Also, a theorem that merely stops at the cap cannot imply OA unless it
is supplemented by some independent capped-state avoidance, clearing,
or amortization mechanism.
\end{minipage}
}
\]

The unjustified conclusion is:

\[
\text{“No baseline-independent ancestor-harvest separator of the whole family exists.”}
\]

### C verdict

\[
\boxed{\textbf{REFUTED}}
\]

Part V overgeneralizes from one off-path, universally baseline-complete CAP formulation. It does not establish a formulation no-go theorem for the whole ancestor-harvest family.

# Bottom line

\[
\boxed{
\begin{aligned}
\textbf{B:}&\ \text{Part IV valid for the written universal-baseline prefix.}\\
\textbf{A:}&\ \text{Formulation repairable, but laundering and scheduling holes remain.}\\
\textbf{C:}&\ \text{Family-wide no-go inference refuted.}
\end{aligned}
}
\]

Document II prevents the fortress from arising against its clearing policy, but Document I deliberately demands success even when that fortress is supplied as an off-policy starting baseline. That preserves the narrow Part IV contradiction. It does not justify the broader claim that every policy-aware ancestor-harvest route must either be false or contain OA verbatim.
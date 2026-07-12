---
id: R120-trajectory-restricted-statement
type: research
date: 2026-07-12
intent: >
  Formulate the trajectory-restricted capped-state/ancestor-harvest
  statement (obligations only at states reachable against the policy),
  prove it nondegenerate against the eleven known collapse families
  plus a twelfth-witness search, and prove or disprove it.
predecessors: [R118-ancestor-harvest-no-go, R119a-no-go-scope-limited]
action:
  kind: extends
  target: R119a-no-go-scope-limited
claim: >
  A precise trajectory-restricted statement is constructed (predictable
  master cohorts registered before damaging moves; actual baseline and
  shell populations; global first exits with inherited damage; a causal
  clock for actual progress plus a separate service clock; high-degree
  and capped tickets; final statement quantified only over realized
  trajectories). It closes all eleven known collapse families and a
  newly discovered TWELFTH: post-hoc cohort selection — pre-registering
  a large latent universe is insufficient if a later epoch may choose
  which undamaged atoms receive unit mass; cohorts and weights must be
  fixed before the moves capable of damaging them. The statement is
  then neither proved nor disproved: the fortress disproof is
  genuinely inapplicable (it supplies an off-policy state, while the
  corrected quantifiers demand a Prolonger strategy forcing a bad
  state against EVERY candidate policy — no stipulated negative
  construction has that strength), and no stipulated positive result
  proves the remaining chronological direct-ancestor inequality.
implications:
  - The formulation war appears to have reached a fixed point: a
    well-posed trajectory-restricted target untouched by all known
    machinery on either side. Pending formulation audit, this is the
    canonical o(n)-side statement alongside bounded-depth compression.
  - Twelfth collapse family recorded; the collapse-family list is
    reusable adversarial tooling for any future intermediate statement.
verifiers_at_time: []
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/researcher-R120-trajectory-restricted-harvest.md
---

I treat the two verbatim attachments and all “established facts” in the uploaded record as hypotheses. 

# Verdict

There is a precise trajectory-restricted replacement of the baseline-uniform statement. It closes the eleven identified collapses. A twelfth collapse also has to be excluded:

\[
\boxed{\text{post-hoc cohort selection}}
\]

Pre-registering a large universe of latent atoms is not enough if, at a later epoch, the policy may choose which still-undamaged atoms receive the unit mass. The epoch cohort and all its weights must be fixed before the moves capable of damaging it.

After making that repair, however, I do **not** obtain a valid proof or disproof of the resulting statement. The old fortress disproof is genuinely inapplicable: it supplies an off-policy state, while the corrected quantifiers require an actual Prolonger strategy that forces a bad state against every candidate Shortener policy. None of the stipulated negative constructions has that quantifier strength, and none of the stipulated positive results proves the remaining chronological direct-ancestor inequality.

The exact outcome is therefore:

\[
\boxed{
\begin{array}{c}
\text{A closed trajectory-restricted statement can be formulated,}\\[2mm]
\text{and it is sufficient for }L(n)=o(n),\\[2mm]
\text{but its truth value is not settled by the supplied results.}
\end{array}}
\]

A purported unconditional proof or disproof would have to add a genuinely new arbitrary-policy theorem at the point isolated in Part IV below.

---

# Part I. The trajectory-restricted statement

## 1. Parameters and quantifiers

Let

\[
\mathcal X_n=
\left\{
\frac{n}{2^j}:
0\le j\le\left\lfloor\log_2\frac n2\right\rfloor
\right\},
\qquad
S_X=(X/2,X]\cap\mathbb Z.
\]

Fix, outside all strategy quantifiers, a canonical datum

\[
\mathbf K^\star
=
\bigl(
\mathcal T,\Omega,\pi,w,
(\mathsf E_c)_{c\in\mathcal C},
\prec,\rho,\mathsf{Queue}
\bigr).
\]

Its components are:

1. A completely specified trapping-and-fixed-density preprocessing policy \(\mathcal T_n\), with a first prescribed stopping time \(b\) and a uniform cost \(a(n)=o(n)\). If the game ends before \(b\), its total length is already \(o(n)\).

2. A finite channel set \(\mathcal C\), containing a distinguished direct-ancestor channel \(\mathrm{anc}\), and a fixed priority order \(\prec\).

3. Canonical, prefix-measurable ledger maps \(\Omega,\pi,w\).

4. Total Boolean exit predicates
   \[
   \mathsf E_c(\omega,\mathfrak h_t)\in\{0,1\},
   \qquad c\in\mathcal C,
   \]
   together with the coverage and soundness axioms stated below.

5. A prefix-measurable relevance map \(\rho\).

6. A fixed serial queue protocol \(\mathsf{Queue}\).

Fix \(\delta>0\), and define

\[
\mathfrak T(n)=\max_{m\le n}\tau(m),
\qquad
H=\mathfrak T(n)^{1+\delta},
\qquad
r=\lfloor(\log H)^{1/3}\rfloor,
\qquad
h=H^2.
\]

Let

\[
J_H=2\lceil\log_2h\rceil+3.
\]

The required hierarchy is

\[
\varepsilon_\delta(H)H^4J_H\longrightarrow0,
\tag{1}
\]

\[
\beta_\delta(n)\longrightarrow0,
\tag{2}
\]

\[
\frac{HJ_H\log h}{h}
=
O\!\left(\frac{\log^2H}{H}\right)
\longrightarrow0,
\tag{3}
\]

and

\[
H^6=o(n).
\tag{4}
\]

The quantifier prefix is

\[
\boxed{
\mathbf K^\star\text{ fixed};\
\exists C_0>0\
\forall\delta>0\
\exists K_\delta,\varepsilon_\delta,\beta_\delta,N_\delta,
\{\Sigma_{n,\delta}\}_{n\ge N_\delta}\
\forall n\ge N_\delta\
\forall\Pi.
}
\tag{Q}
\]

Here \(\Sigma_{n,\delta}\) is a complete deterministic Shortener policy extending \(\mathcal T_n\). For each Prolonger policy \(\Pi\), every condition below is imposed only on the single realized play

\[
\mathfrak h(\Sigma_{n,\delta},\Pi).
\]

There is no universal quantifier over externally supplied baselines.

---

## 2. Actual baseline and actual shell populations

Let \(b=b(\Sigma,\Pi)\) be the first prescribed endpoint of \(\mathcal T_n\) on the realized play, and write

\[
B=A_b.
\]

For \(t\ge b\), define

\[
Q_X(t)=Q_X(A_t)\cap Q_X(B),
\]

and

\[
D_X(t)
=
\max_{d\in D(A_t)}
\#\{u\in Q_X(t):d\mid u\}.
\]

Everything is measured on the actual continuation from \(B\). States not reached against \(\Sigma\) carry no obligations.

---

## 3. Predictable master cohorts

For each actual baseline \(B\), shell \(X\), and potential epoch

\[
0\le j<J_H,
\]

the fixed map \(\Omega\) produces a finite atom set

\[
\Omega_{X,j}(B).
\]

There are maps

\[
\pi_{X,j}:\Omega_{X,j}(B)\to Q_X(B)
\]

and

\[
w_{X,j}:\Omega_{X,j}(B)\to(0,\infty)
\]

such that for every baseline target \(u\in Q_X(B)\),

\[
\sum_{\substack{\omega\in\Omega_{X,j}(B)\\
\pi_{X,j}(\omega)=u}}
w_{X,j}(\omega)=1.
\tag{5}
\]

Thus every potential epoch has a unit, positive-weight copy of every baseline target. All these weights are fixed at \(b\). They do not depend on:

- which atoms later become damaged;
- the future Prolonger strategy;
- the epoch start time;
- the order in which shells are serviced.

The cumulative target exposure is therefore bounded by

\[
\sum_{j<J_H}
\sum_{\substack{\omega\in\Omega_{X,j}(B)\\
\pi_{X,j}(\omega)=u}}
w_{X,j}(\omega)
\le J_H.
\tag{6}
\]

An epoch cohort is activated solely by target survival:

\[
\Omega^{\mathrm{act}}_{X,j}
=
\{\omega\in\Omega_{X,j}(B):
\pi_{X,j}(\omega)\in Q_X(s_{X,j})\},
\tag{7}
\]

where \(s_{X,j}\) is the actual service-start time. No damaged atom may be replaced by an undamaged atom at activation.

This is the repair of post-hoc cohort selection.

---

## 4. Global first exits and inherited damage

For every master atom, define its exit time from the original baseline, not from its epoch start:

\[
\xi(\omega)
=
\min\left\{
t\ge b:
\max_{c\in\mathcal C}
\mathsf E_c(\omega,\mathfrak h_t)=1
\right\},
\tag{8}
\]

with \(\xi(\omega)=\infty\) if no exit occurs.

If \(\xi(\omega)<\infty\), define

\[
\chi(\omega)
=
\min_{\prec}
\{c:\mathsf E_c(\omega,\mathfrak h_{\xi(\omega)})=1\}.
\tag{9}
\]

The predicates satisfy:

### Coverage

Whenever a canonical atom becomes permanently unusable for the accepted repair procedure, at least one \(\mathsf E_c\) is true.

### Soundness

Each true \(\mathsf E_c\) carries the fixed arithmetic certificate belonging to channel \(c\). In particular, \(\mathsf E_{\mathrm{anc}}\) may be true only when the atom’s prescribed ancestor has become unavailable through the designated direct-ancestor mechanism.

### Irreversibility

Once an atom exits, its channel never changes.

For an active epoch, define

\[
\operatorname{Anc}_{X,j}(t)
=
\sum_{\substack{
\omega\in\Omega^{\mathrm{act}}_{X,j}\\
\xi(\omega)\le t\\
\chi(\omega)=\mathrm{anc}
}}
w_{X,j}(\omega).
\tag{10}
\]

Crucially, atoms with

\[
\xi(\omega)<s_{X,j}
\]

are included. They are inherited debt; they are not born fresh at the epoch boundary.

---

## 5. Actual progress and the causal clock

Let

\[
m_{X,j}=|Q_X(s_{X,j})|
\]

and

\[
\mathsf A_{X,j}(t)
=
|Q_X(s_{X,j})\setminus Q_X(t)|.
\tag{11}
\]

This counts actual target deaths and transfers out of the live nonminimal shell population.

The causal clock starts at the common baseline:

\[
\ell_{X,j}(t)
=
\sum_{i=b+1}^{t}
\rho_{X,j}(\mathfrak h_{i-1},z_i),
\tag{12}
\]

where

\[
\rho_{X,j}(\mathfrak h_{i-1},z_i)\in\{0,1\}.
\]

The relevance map must obey:

> Every move used in a causal certificate for an atom in  
> \(\Omega^{\mathrm{act}}_{X,j}\), including a move made before \(s_{X,j}\), has \(\rho_{X,j}=1\).

Thus a setup move that damages a future epoch cannot disappear from that epoch’s clock.

The local and global budgets are

\[
\ell_{X,j}(\tau_{X,j})
\le
K_\delta m_{X,j}\frac{\log h}{h},
\tag{13}
\]

and

\[
H\sum_{X,j}
\ell_{X,j}(\tau_{X,j})
\le
\beta_\delta(n)n.
\tag{14}
\]

The first prevents inherited setup credit from making a particular epoch vacuous. The second prevents one actual move from providing unlimited credit to many future cohorts.

---

## 6. A separate service clock

The eleventh collapse arises if \(\ell_{X,j}\) is treated as elapsed service time. It is not.

Let

\[
v_{X,j}(t)
\]

be the number of actual Shortener turns assigned by the serial scheduler to epoch \((X,j)\) by time \(t\). Define

\[
B_\delta(m)
=
\left\lceil
K_\delta m\frac{\log h}{h}
\right\rceil.
\tag{15}
\]

Every active epoch receives at most \(B_\delta(m_{X,j})\) service turns before its high-degree deadline.

The scheduler is serial and work-conserving:

1. At most one ticket is being serviced at any time.

2. Every Shortener turn while a ticket is active increments that ticket’s \(v\), regardless of whether the move receives causal credit in \(\ell\).

3. A move made for another shell still consumes the current ticket’s service slot.

4. Waiting tickets are ordered by a fixed FIFO rule with a fixed shell tie-breaker.

5. There is at most one outstanding ticket per shell.

6. A ticket that has already achieved its contraction while waiting is discharged as helpful progress.

Consequently there is no sequence of arbitrarily many actual turns on which every relevant service clock remains frozen.

---

## 7. High-degree tickets

An epoch is audited only if

\[
X\ge H^6,
\qquad
m_{X,j}>\frac{X}{h^2}=\frac{X}{H^4}.
\tag{16}
\]

Hence

\[
\frac{m_{X,j}}H
>
\frac{X}{H^5}
\ge H.
\tag{17}
\]

This is the frozen-mass domination condition.

If

\[
D_X(s_{X,j})>H,
\]

define the high-degree stopping time as the first of:

\[
|Q_X(t)|
\le
\frac12m_{X,j}+\frac{X}{h^2},
\tag{18}
\]

\[
D_X(t)\le H,
\tag{19}
\]

or

\[
v_{X,j}(t)=B_\delta(m_{X,j}).
\tag{20}
\]

The trajectory-restricted ancestor-harvest inequality is

\[
\boxed{
\operatorname{Anc}_{X,j}(t)
\le
\varepsilon_\delta(H)X
+
C_0\mathsf A_{X,j}(t)
+
C_0H\ell_{X,j}(t)
}
\tag{TR-AH}
\]

for every actual prefix

\[
s_{X,j}\le t\le\tau_{X,j},
\]

including the stopping move.

---

## 8. Capped tickets

Whenever, on the actual play,

\[
X\ge H^6,
\qquad
q=|Q_X(c)|>\frac{X}{h^2},
\qquad
D_X(c)\le H,
\tag{21}
\]

a single capped ticket is generated for shell \(X\).

If it waits in the queue, every move during the wait remains visible to the global atom ledger and causal clocks. If, before service begins,

\[
|Q_X|\le\frac12q+\frac{X}{h^2},
\]

the ticket is discharged by actual progress.

Otherwise it receives

\[
B_\delta(q)
\]

Shortener service turns and must satisfy

\[
\boxed{
|Q_X(\mathrm{end})|
\le
\frac12q+\frac{X}{h^2}.
}
\tag{TR-CAP}
\]

A shell already carrying a ticket cannot retrigger another one. If a high-degree ticket crosses the cap, it converts into its unique capped successor; it does not erase or renormalize its old ledger.

This clause applies only to capped states actually reached against \(\Sigma\).

---

## 9. The final statement

Call the conjunction

\[
\boxed{
\mathrm{TRMEAH}^{\sharp}(\mathbf K^\star)
}
\]

of

\[
(\mathrm{TR\!-\!AH}),
\quad
(\mathrm{TR\!-\!CAP}),
\quad
(5)\text{--}(17),
\]

the **trajectory-restricted master-ledger ancestor-harvest statement**.

Its operative quantifiers are

\[
\exists\Sigma\ \forall\Pi\
P\bigl(\operatorname{Play}(\Sigma,\Pi)\bigr),
\]

not

\[
\exists\Sigma\ \forall A\in\mathcal B_n\ \forall\Pi\
P(\Sigma,A,\Pi).
\]

That is the load-bearing correction.

---

# Part II. Nondegeneracy

## 1. Terminal delay

An audited epoch has positive mass exceeding \(X/h^2\). It therefore cannot be initialized at a terminal position.

The ledger is frozen at the prescribed actual baseline, and all inequalities are prefix inequalities. Ending the game later does not erase an earlier ancestor jump.

If the game terminates during the fixed \(o(n)\)-move preprocessing policy, that is genuine sublinear termination.

---

## 2. Prelude delay

The preprocessing policy and its first endpoint are fixed outside the existential continuation policy. Shortener cannot redefine the baseline after seeing later play.

Any clearing sweep admitted before the baseline is part of the fixed preprocessing algorithm and has its actual \(o(n)\) cost. Any later sweep occurs under the already existing master ledger.

---

## 3. Cap before the freeze

If the actual baseline is already capped and its shell mass exceeds the dust threshold, it immediately produces a capped ticket.

Thus cap attainment cannot make the active domain empty unless the remaining mass is already globally negligible.

---

## 4. Shell deferral and raw-time credit

Unrelated elapsed time does not enlarge the term \(H\ell\), because \(\ell\) is causal rather than temporal.

Conversely, unrelated elapsed time cannot be ignored: every Shortener turn consumes the unique active ticket’s service budget \(v\). Hence neither “delay for free credit” nor “delay with zero credit” is possible.

---

## 5. Zero weights and omitted targets

Equation (5) gives exact unit mass on every target in every potential cohort, with strictly positive weights.

The policy cannot discard inconvenient targets or assign them zero mass.

---

## 6. First-exit reassignment

The first global exit time and the priority order (8)–(9) are immutable.

A later target death, residual lift death, or boundary event cannot relabel an earlier direct-ancestor exit.

---

## 7. Collapse to the cost-only statement

The baseline is the first endpoint of a fixed structural procedure, not a strategy-dependent terminal witness.

The estimates are tested on early prefixes. Merely knowing that some policy eventually terminates in \(o(n)\) moves supplies no proof of the first-move or first-epoch inequalities.

The parameter \(H\) is fixed arithmetically from \(\mathfrak T(n)\); it cannot be chosen as \(n/(L(n)+1)\).

---

## 8. Micro-baseline compression

If preprocessing reduces every large shell below

\[
X/h^2,
\]

then

\[
\sum_{X\in\mathcal X_n}\frac{X}{h^2}
<\frac{2n}{h^2}=o(n).
\]

The shells \(X<H^6\) contain only \(O(H^6)=o(n)\) integers.

Thus compression below the activity threshold is genuine global progress. If a shell retains more than dust, it necessarily creates a high-degree or capped ticket.

---

## 9. Cap escape

Crossing from \(D_X>H\) to \(D_X\le H\) does not terminate the obligation. It creates or converts to the unique capped ticket.

The ledger, area, and clocks are not reset.

---

## 10. Epoch-boundary laundering

Exit times are measured from the common baseline \(b\), and ancestor mass includes atoms with

\[
\xi(\omega)<s_{X,j}.
\]

Every causal move responsible for that inherited damage is included in the cohort’s clock, even if it occurred during an earlier epoch.

Therefore an atom cannot be born already damaged with neither debt nor causal cost.

---

## 11. Uncharged scheduling delay

The service counter \(v\) is distinct from the credit counter \(\ell\).

Every actual Shortener turn while a ticket is active increments \(v\), even when \(\rho=0\). The serial queue ensures that a ticket cannot be postponed behind an infinite sequence of zero-cost moves.

The gap identified in the audit,

\[
\ell\text{ small}
\not\Rightarrow
\text{few actual turns},
\]

is closed by explicitly budgeting actual service turns.

---

## 12. Post-hoc cohort selection

Here is the additional collapse.

Suppose each target has many pre-registered latent signatures. An earlier blocker destroys one subset of them. If, at epoch activation, the policy is allowed to choose a fresh unit-weight distribution supported only on surviving signatures, the old damage disappears even though the latent universe was nominally pre-registered.

That is not ordinary epoch-boundary laundering: even global exit times do not help if the cohort itself is selected after the exits are known.

Equations (5)–(7) close it. Every epoch’s weights are fixed at the original baseline, and activation depends only on target survival and the epoch number. Pre-exited signatures remain in the active cohort as inherited debt.

---

## Additional formal closures

The serial queue also resolves conflicting simultaneous CAP triggers. Channel coverage prevents \(I_{\mathrm{anc}}\equiv0\). Prefix measurability prevents ledger data from depending retrospectively on the future Prolonger strategy.

---

# Part III. Why the statement implies \(L(n)=o(n)\)

Consider an audited high-degree ticket.

The accepted residual-channel estimate, the atomic ledger, prime guards, ordinary-failure bounds, high-\(\operatorname{lcm}\) truncation, boundary estimates, and exact/minimal banks control every channel except the direct-ancestor channel.

Adding \((\mathrm{TR\!-\!AH})\) gives, before the service deadline,

\[
\operatorname{Repair}_{X,j}(t)
\le
o(m_{X,j})
+
C_0\mathsf A_{X,j}(t)
+
O(H\ell_{X,j}(t))
+
\varepsilon_\delta(H)X.
\tag{22}
\]

By (13),

\[
H\ell_{X,j}(\tau)
\le
K_\delta
m_{X,j}\frac{H\log h}{h}
=
o(m_{X,j}).
\tag{23}
\]

Since

\[
m_{X,j}>\frac{X}{H^4},
\]

equation (1) gives

\[
\varepsilon_\delta(H)X
=
o\!\left(\frac{m_{X,j}}{J_H}\right).
\tag{24}
\]

The stipulated advance-depletion reduction then shows that the high-degree service deadline cannot occur while both

\[
D_X>H
\]

and

\[
|Q_X|>
\frac12m_{X,j}+\frac{X}{h^2}
\]

remain true. Hence the ticket either contracts or enters capped mode.

The capped mode gives the same contraction by \((\mathrm{TR\!-\!CAP})\). Thus every completed macro-epoch satisfies

\[
m_{X,j+1}
\le
\frac12m_{X,j}+\frac{X}{h^2}.
\tag{25}
\]

After \(O(\log h)\) macro-epochs,

\[
m_{X,j}=O(X/h^2).
\tag{26}
\]

Moreover,

\[
\sum_jm_{X,j}=O(X),
\]

so the total Shortener service allocated to shell \(X\) is

\[
O\!\left(
\frac{\log h}{h}\sum_jm_{X,j}
\right)
=
O\!\left(\frac{X\log h}{h}\right).
\tag{27}
\]

Summing over the disjoint dyadic shells,

\[
\sum_X O\!\left(\frac{X\log h}{h}\right)
=
O\!\left(\frac{n\log h}{h}\right)
=o(n).
\tag{28}
\]

The queue is work-conserving, so waiting creates no additional unaccounted actual turns. The small shells contribute \(O(H^6)=o(n)\), and the dust contributes \(O(n/h^2)=o(n)\).

Adding the fixed \(o(n)\)-move preprocessing stage and applying the stipulated static-completion endgame yields

\[
L(n)=o(n).
\]

Therefore

\[
\boxed{
\mathrm{TRMEAH}^{\sharp}(\mathbf K^\star)
\Longrightarrow
L(n)=o(n).
}
\tag{29}
\]

---

# Part IV. Resolution attempt

## 1. Why the fortress no longer disproves the statement

The old argument had the quantifier form

\[
\forall\Sigma\ \exists A^\star\in\mathcal B_n:
\neg\mathrm{CAP}(\Sigma,A^\star).
\]

The corrected negation would require

\[
\forall\Sigma\ \exists\Pi:
A^\star\in
\operatorname{Play}(\Sigma,\Pi).
\]

These are not equivalent.

For a policy incorporating the established fixed-density clearing sweep, the low-cap linear fortress is not on the trajectory. Supplying it as a hypothetical starting node is forbidden by the new statement.

Thus the erosion estimate

\[
q-|Q^T|
\le H_0T+2T+o(n)
\]

remains correct **conditional on fortress entry**, but no stipulated theorem forces that entry against the clearing policy.

---

## 2. What a genuine disproof must construct

A disproof must establish, for some fixed \(\delta>0\),

\[
\forall\Sigma\
\exists n\ \exists\Pi
\]

such that on the realized play at least one of the following occurs:

1. A reached high-degree epoch and prefix satisfy
   \[
   \operatorname{Anc}_{X,j}(t)
   >
   \varepsilon_\delta(H)X
   +
   C_0\mathsf A_{X,j}(t)
   +
   C_0H\ell_{X,j}(t).
   \]

2. A reached capped ticket retains more than
   \[
   \frac12q+\frac{X}{h^2}
   \]
   after its full service budget.

3. The fixed global clock or service budget is necessarily exceeded.

The known counterexamples do not do this:

- The primorial fortress is only known to be obtainable on some play, not forceable against the clearing policy.
- The private-carrier construction defeats every ordering of one fixed minimal layer, but not arbitrary cross-cone or guard moves.
- The literal maximum-degree anchor exploit is defeated by a legal packet guard.
- The \(128\)-versus-\(48\) history refutes an instantaneous-to-lifetime promotion but does not force a linear weighted ancestor jump against every policy.
- The one-carrier example is a pointwise jump; its required prehistory can be harvested or prevented by a general policy.
- The raw-shadow construction does not force linearly many surviving later minimal elements.
- The example \(\{6,35\}\) defeats one common-blocker rule, not every possible policy.

So no supplied negative theorem has the necessary

\[
\forall\Sigma\exists\Pi
\]

quantifiers.

---

## 3. What a genuine proof must establish

The positive direction needs a chronology-stable online transversal theorem for the reverse orientation

\[
c\mid a_F.
\]

Concretely, it must show that along one complete policy’s actual trajectories, direct-ancestor first exits admit a causal allocation satisfying

\[
\operatorname{Anc}
\le
o(X)+O(\mathsf A)+O(H\ell)
\]

with both the local and global clock budgets.

The stipulated facts do not supply it:

- The atomic ledger controls the opposite orientation \(\kappa(F)\mid c\).
- Exhaustion cost counts actual lift deaths, whereas a direct ancestor can erase a face before its lifts die.
- All-orders witness inequalities are static and permit a shared low-lcm core.
- Frozen coded repairs have no chronological Lipschitz bound.
- Root-indexed first blockers apply to a restricted minimal-layer sweep and are too weak in the early generations.
- Fixed-density clearing controls constant-density reservoirs at sufficiently low caps; it does not give the shrinking-density, all-shell chronological inequality.
- The refinement-forest theorem describes what a counterexample must look like, but gives neither a policy that destroys it nor a Prolonger strategy that maintains it.

A full proof therefore needs a new online weighted-hitting or no-repetition theorem. A full disproof needs an arbitrary-policy persistent direct-ancestor cascade.

---

# Final conclusion

The correct repaired target is

\[
\boxed{\mathrm{TRMEAH}^{\sharp}(\mathbf K^\star)}
\]

with:

\[
\text{actual-trajectory quantifiers},
\]

\[
\text{globally monitored, predictable epoch cohorts},
\]

\[
\text{immutable first exits and complete channels},
\]

\[
\text{local and global causal-clock budgets},
\]

\[
\text{a separate actual-service counter},
\]

\[
\text{a serialized capped-state queue},
\]

and

\[
\text{no post-hoc choice of undamaged signatures}.
\]

It is nondegenerate against all eleven stated collapses and the additional post-hoc-cohort collapse. It implies \(L(n)=o(n)\).

But the supplied facts prove neither

\[
\mathrm{TRMEAH}^{\sharp}
\]

nor its negation. In particular, the valid off-path fortress argument cannot be recycled under the corrected reachability quantifiers. The remaining separator is exactly:

\[
\boxed{
\begin{minipage}{0.88\linewidth}
Either construct one complete Shortener policy giving a
chronology-stable direct-ancestor allocation on every realized play, or
construct one Prolonger strategy which, against every complete policy,
forces a reached prefix with large ancestor mass, small actual area, and
small charged clock.
\end{minipage}}
\]

I am not confident that either direction can be completed from the stipulated lemmas alone; asserting otherwise would conceal the missing arbitrary-policy theorem rather than prove it.
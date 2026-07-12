---
id: R123-activation-area-impossibility
type: research
date: 2026-07-12
intent: >
  Close the trajectory-restricted ledger statement against all thirteen
  collapse families (mandatory-activation invariant) and resolve it, or
  prove the family unclosable as a genuinely weaker intermediate
  theorem.
predecessors: [R120-trajectory-restricted-statement, R122a-epoch-suppression-witness, R122b-registration-starvation-witness]
action:
  kind: extends
  target: R120-trajectory-restricted-statement
claim: >
  Activation-area impossibility theorem (the formulation loop's
  terminus). First, a FOURTEENTH collapse: additive-floor ticket
  chattering / epoch exhaustion — with dust threshold X/h^2, any
  population q in (d_X, 2d_X] already satisfies its half-plus-floor
  completion inequality at activation, so tickets discharge with no
  work, mandatory succession chatters forever or exhausts the finite
  epoch ledger; repaired by raising the terminal threshold to 4X/h^2.
  Second, the theorem: for ANY trajectory-restricted serial-ticket
  scheme whose non-prelude time is bounded by ticket service budgets,
  with ticket-local certificates, bounded per-chain budgets
  O(m log h / h) + O(1), and contraction q' <= m/2 + d_X, exactly one
  of two branches holds — a starvation branch (some live shell
  unticketed, some turn unowned, a blocked successor, or an unbounded
  phase chain; the assertions then fail to bound total time) or an
  online-area branch (the ticket chains form precisely a scheduled
  trajectory-restricted online-area decomposition). Hence no
  nondegenerate, pipeline-sufficient member of the ledger family is
  strictly weaker than trajectory-restricted online area: proving the
  fully repaired statement IS proving online area; weakening it reopens
  a starvation witness. Does not decide L(n) = o(n); decisively ends
  the intermediate-statement search — the canonical upper-route target
  is trajectory-restricted online area itself.
implications:
  - The formulation loop (six iterations, fourteen collapse families)
    terminates with an explanation: no ledger-type shortcut below (OA)
    exists. Upper-route dispatches should target trajectory-restricted
    online area directly, alongside bounded-depth compression.
  - The fourteen-family collapse catalogue plus this dichotomy is
    reusable for ANY future intermediate-statement proposal.
verifiers_at_time: []
confidence_at_time: low
strategy_dependence: independent
prompt: erdos-872/prompts/researcher-R123-mandatory-activation.md
---

I use the uploaded record, including both audits and every item labeled established, as hypotheses. 

# Verdict

The thirteenth repair can be made formally complete, but it exposes a fourteenth collapse:

\[
\boxed{\textbf{additive-floor ticket chattering / epoch exhaustion}.}
\]

With the original dust threshold

\[
d_X=\frac{X}{h^2},
\]

every population \(q\in(d_X,2d_X]\) already satisfies

\[
q\le \frac q2+d_X.
\]

Consequently a ticket may satisfy its advertised “contraction” condition without removing even one target. Immediate re-registration then creates an infinite zero-time loop; delaying discharge merely creates infinitely many positive-cost tickets. A finite list of \(J_H\) epochs instead runs out while the shell is still above the registration threshold.

This fourteenth collapse is repairable by declaring populations at most \(4d_X\) to be dust. However, after that repair, mandatory registration, no-idle service, immediate succession, and the two ticket-resolution clauses are exactly a scheduled, trajectory-restricted version of the online-area statement.

The decisive conclusion is therefore the following impossibility theorem.

\[
\boxed{
\begin{minipage}{0.9\linewidth}
Within the serial-ticket/master-ledger architecture of the uploaded
statement, there is no closed, nondegenerate, pipeline-sufficient
intermediate theorem strictly weaker than trajectory-restricted online
area.

If mandatory registration, succession, or service coverage is omitted,
registration starvation remains possible. If those axioms are imposed
and every bounded ticket chain must end in the advertised
half-plus-dust contraction, the ticket intervals themselves are the
online-area processing blocks.
\end{minipage}}
\tag{IAT}
\]

Thus the route can be used as machinery for proving online area, but it cannot furnish a logically weaker separator between the presently established lemmas and online area.

---

# I. The maximally repaired statement

I first give the fully closed version to which the impossibility theorem applies.

## 1. Parameters

Let

\[
\mathcal X_n=
\left\{\frac n{2^k}:
0\le k\le\left\lfloor\log_2\frac n2\right\rfloor
\right\},
\qquad
S_X=(X/2,X]\cap\mathbb Z.
\]

For fixed \(\delta>0\), set

\[
H=\mathfrak T(n)^{1+\delta},
\qquad
h=H^2,
\qquad
d_X=\frac{X}{h^2}=\frac{X}{H^4},
\]

and

\[
J_H=2\lceil\log_2h\rceil+3.
\]

The repaired live-shell predicate is

\[
\mathsf{Live}_X(t)
\iff
X\ge H^6
\quad\text{and}\quad
|Q_X(t)|>4d_X.
\tag{1}
\]

The factor \(4\) is essential; it is not cosmetic.

The asymptotic hierarchy is

\[
\varepsilon_\delta(H)H^4J_H\longrightarrow0,
\tag{2}
\]

\[
\beta_\delta(n)\longrightarrow0,
\tag{3}
\]

\[
\frac{HJ_H\log h}{h}\longrightarrow0,
\tag{4}
\]

and

\[
H^6=o(n).
\tag{5}
\]

Here

\[
K_\delta\in(0,\infty),
\quad
\varepsilon_\delta:[1,\infty)\to[0,\infty),
\quad
\beta_\delta:\mathbb N\to[0,\infty).
\]

Define the service budget

\[
B_\delta(m)
=
\left\lceil
K_\delta m\frac{\log h}{h}
\right\rceil.
\tag{6}
\]

## 2. Closed quantifiers

Let \(\mathbf{Adm}\) denote the class of deterministic ledger constructors satisfying the axioms below.

The closed proposition has quantifier prefix

\[
\boxed{
\exists\mathcal K^\star\in\mathbf{Adm}\;
\exists C_0>0\;
\forall\delta>0\;
\exists K_\delta,\varepsilon_\delta,\beta_\delta,N_\delta,
\{\Sigma_{n,\delta}\}_{n\ge N_\delta}\;
\forall n\ge N_\delta\;
\forall\Pi.
}
\tag{7}
\]

The constructor \(\mathcal K^\star\), the policy family, all tie-breakers, and all witness algorithms are chosen before the universally quantified Prolonger policy \(\Pi\).

The exact negation is therefore

\[
\begin{aligned}
\forall\mathcal K^\star\in\mathbf{Adm}\;
\forall C_0>0\;
\exists\delta>0\;
\forall K_\delta,\varepsilon_\delta,\beta_\delta,N_\delta,
\{\Sigma_{n,\delta}\}\;
\exists n\ge N_\delta\;
\exists\Pi:
\neg P.
\end{aligned}
\tag{8}
\]

In particular, neither \(\delta\) nor a single Prolonger policy may be moved outside the quantifiers without strengthening the negation.

## 3. Actual baseline

The Shortener policy begins with the fixed preprocessing policy \(\mathcal T_n\). Let \(b\) be its first prescribed endpoint on the actual play and put

\[
B=A_b.
\]

If the game terminates before \(b\), the accepted preprocessing theorem already gives a sublinear game.

For \(t\ge b\), define

\[
Q_X(t)=Q_X(A_t)\cap Q_X(B)
\]

and

\[
q_X(t)=|Q_X(t)|.
\]

Also define

\[
D_X(t)
=
\max_{d\in D(A_t)}
\#\{u\in Q_X(t):d\mid u\},
\tag{9}
\]

with \(D_X(t)=0\) when \(D(A_t)=\varnothing\).

Both \(q_X(t)\) and \(D_X(t)\) are nonincreasing along the actual continuation.

---

# II. Fully mathematical ledger data

At the baseline \(b\), the fixed constructor \(\mathcal K^\star\) generates, for every \(X\in\mathcal X_n\) and every \(0\le j<J_H\), the following objects.

## 1. Master atoms and weights

A finite set

\[
\Omega_{X,j}(B),
\]

a projection

\[
\pi_{X,j}:\Omega_{X,j}(B)\to Q_X(B),
\]

and positive weights

\[
w_{X,j}:\Omega_{X,j}(B)\to(0,\infty)
\]

satisfying

\[
\sum_{\substack{\omega\in\Omega_{X,j}(B)\\
\pi_{X,j}(\omega)=u}}
w_{X,j}(\omega)=1
\quad
\text{for every }u\in Q_X(B).
\tag{10}
\]

Thus every potential epoch contains a fixed unit-weight copy of every baseline target, and

\[
\sum_{j<J_H}
\sum_{\pi_{X,j}(\omega)=u}w_{X,j}(\omega)
=J_H.
\tag{11}
\]

No atom, signature, or weight can be chosen after future damage is known.

## 2. Canonical unavailability and causes

For each atom there is a total prefix-measurable Boolean map

\[
\mathsf U(\omega,\mathfrak h_t)\in\{0,1\},
\]

with

\[
\mathsf U(\omega,\mathfrak h_b)=0
\tag{12}
\]

and

\[
\mathsf U(\omega,\mathfrak h_t)
\le
\mathsf U(\omega,\mathfrak h_{t+1}).
\tag{13}
\]

The first exit time is

\[
\xi(\omega)
=
\min\{t>b:\mathsf U(\omega,\mathfrak h_t)=1\},
\tag{14}
\]

with \(\xi(\omega)=\infty\) if the set is empty.

There is a total cause map

\[
\chi(\omega)\in\mathcal C\cup\{\bot\},
\]

where \(\chi(\omega)=\bot\) exactly when \(\xi(\omega)=\infty\). The channels form an exact partition of first exits.

There is a fixed canonical predicate

\[
\mathsf{DA}(\omega,\mathfrak h_{\xi(\omega)-1},z_{\xi(\omega)})
\]

for the designated direct-ancestor mechanism, including its fixed tie-break in simultaneous-cause cases, and

\[
\boxed{
\chi(\omega)=\mathrm{anc}
\iff
\mathsf{DA}
(\omega,\mathfrak h_{\xi(\omega)-1},z_{\xi(\omega)})=1.
}
\tag{15}
\]

This excludes duplicate-channel and priority laundering. The distinguished ancestor channel is complete in both directions, not merely sound in one direction.

## 3. Online witness maps

For every channel \(c\), atom \(\omega\), and move index \(i>b\), there is a prefix-measurable mark

\[
\gamma_c(\omega,\mathfrak h_i)\in\{0,1\}.
\tag{16}
\]

If \(\chi(\omega)=c\), its canonical certificate is

\[
\Gamma_c(\omega)
=
\{i:b<i\le\xi(\omega),\
\gamma_c(\omega,\mathfrak h_i)=1\}.
\tag{17}
\]

A fixed arithmetic predicate

\[
\mathsf{Cert}_c
(\omega,\mathfrak h_{\xi(\omega)},\Gamma_c(\omega))
\]

must hold and must imply the claimed channel-\(c\) first exit.

The important online condition is that membership of \(i\) in the certificate is decided at prefix \(i\). Earlier moves cannot be inserted retrospectively into a certificate after an epoch is activated.

Define the potential-epoch relevance indicator

\[
\rho_{X,j}(i)
=
\mathbf 1
\left[
\exists\omega\in\Omega_{X,j}(B),\
\exists c\in\mathcal C:
\gamma_c(\omega,\mathfrak h_i)=1
\right].
\tag{18}
\]

This is a completely defined prefix-measurable map. There is no longer an undefined phrase such as “a move used in some causal certificate.”

---

# III. Mandatory ticket process

Tickets are queue records attached to shells. Registration and epoch activation are distinct.

## 1. Administrative closure before every Shortener move

Before each post-baseline Shortener move, repeatedly perform the following zero-move administrative operations until none applies:

1. Remove every waiting record whose shell is no longer live.

2. If a live shell has no active or waiting record, immediately enqueue one.

3. If no ticket is active and the queue is nonempty, activate the FIFO head.

The invariant after administrative closure is

\[
\boxed{
\mathsf{Live}_X(t)
\iff
\text{shell \(X\) has exactly one active or waiting record}.
}
\tag{19}
\]

If at least one live shell exists, exactly one ticket is active.

No completed ticket remains outstanding. There are no zombie tickets.

The queue order is FIFO, with a fixed deterministic shell tie-breaker. Successor records are appended after records already waiting.

## 2. Bounded activation delay

Suppose a record for \(X\) is registered at time \(r\), with registration mass \(a=q_X(r)\).

Every record ahead of it has total high-plus-cap service at most

\[
2B_\delta(a')
\]

where \(a'\) is its registration mass, because its eventual service-start mass cannot exceed \(a'\).

Therefore, unless \(X\) ceases to be live while waiting, its epoch activates within at most

\[
\sum_{\text{records ahead at registration}}
2B_\delta(a')
\tag{20}
\]

subsequent Shortener turns.

Thus “eventual service” is not merely a fairness slogan; it has a stated queue-potential bound.

## 3. Epoch start

When the record becomes active at time \(s_{X,j}\), assign it the next unused epoch index \(j\), and put

\[
m_{X,j}=q_X(s_{X,j}).
\tag{21}
\]

Since it is still live,

\[
m_{X,j}>4d_X.
\tag{22}
\]

Its active cohort is

\[
\Omega^{\mathrm{act}}_{X,j}
=
\{\omega\in\Omega_{X,j}(B):
\pi_{X,j}(\omega)\in Q_X(s_{X,j})\}.
\tag{23}
\]

This selection depends only on target survival. In particular, an already exited atom whose target survives is still included with its original weight.

Define

\[
\operatorname{Anc}_{X,j}(t)
=
\sum_{\substack{
\omega\in\Omega^{\mathrm{act}}_{X,j}\\
\xi(\omega)\le t\\
\chi(\omega)=\mathrm{anc}
}}
w_{X,j}(\omega),
\tag{24}
\]

and

\[
\mathsf A_{X,j}(t)
=
m_{X,j}-q_X(t).
\tag{25}
\]

All exits between \(b\) and \(s_{X,j}\) are inherited in (24).

The causal clock is

\[
\ell_{X,j}(t)
=
\sum_{i=b+1}^{t}\rho_{X,j}(i).
\tag{26}
\]

Thus pre-service witnesses are charged.

## 4. Separate service clock

Let

\[
v^H_{X,j}(t),\qquad v^C_{X,j}(t)
\]

count, respectively, Shortener turns assigned to this epoch while it is in high-degree or capped mode.

Every Shortener turn while any live shell exists increments exactly one of these counters for exactly one active ticket.

A move may causally affect many future cohorts, but it has only one service owner.

## 5. High-to-cap conversion and completion

If

\[
D_X(s_{X,j})>H,
\]

the ticket begins in high mode. Its high stopping time is the first of

\[
q_X(t)\le\frac12m_{X,j}+d_X,
\tag{27}
\]

\[
D_X(t)\le H,
\tag{28}
\]

or

\[
v^H_{X,j}(t)=B_\delta(m_{X,j}).
\tag{29}
\]

If (28) occurs first, the same ticket and same cohort convert to capped mode. There is no fresh epoch, no reset of \(m\), no reset of the ledger, and no reset of inherited debt.

If the ticket begins with \(D_X(s_{X,j})\le H\), it begins directly in capped mode.

A ticket leaves the system only after achieving

\[
q_X(t)\le \frac12m_{X,j}+d_X.
\tag{30}
\]

If the resulting shell remains live, its successor record is enqueued before the next Shortener move.

If no shell remains live, the policy immediately enters its fixed accepted completion phase. It may not spend an arbitrary unaccounted interval playing unrelated moves.

---

# IV. The two substantive inequalities

## 1. Ancestor harvest

For every high-mode prefix, including inherited debt at the start and the final high-mode move,

\[
\boxed{
\operatorname{Anc}_{X,j}(t)
\le
\varepsilon_\delta(H)X
+
C_0\mathsf A_{X,j}(t)
+
C_0H\ell_{X,j}(t).
}
\tag{TR-AH\(_4\)}
\]

The clock budgets are

\[
\ell_{X,j}(\tau_{X,j})
\le
K_\delta m_{X,j}\frac{\log h}{h},
\tag{31}
\]

and

\[
H\sum_{\text{activated }(X,j)}
\ell_{X,j}(\tau_{X,j})
\le
\beta_\delta(n)n.
\tag{32}
\]

## 2. Capped resolution

Every capped phase satisfies, within at most

\[
B_\delta(m_{X,j})
\]

assigned capped service turns,

\[
\boxed{
q_X(\tau_{X,j})
\le
\frac12m_{X,j}+d_X.
}
\tag{TR-CAP\(_4\)}
\]

Together with the accepted non-ancestor estimates and advance-depletion reduction, \((\mathrm{TR\!-\!AH}_4)\) implies that a high phase cannot hit (29) while both

\[
D_X>H
\]

and

\[
q_X>\frac12m_{X,j}+d_X
\]

still hold. Hence each activated ticket uses at most

\[
2B_\delta(m_{X,j})
\tag{33}
\]

Shortener service turns before contraction: at most one high budget and one capped budget.

Call the complete quantified proposition above

\[
\mathsf{CTRMLA}_4.
\]

It is the closed trajectory-restricted master-ledger activation statement.

---

# V. Closure of the first thirteen families

The exact clauses closing the known degeneracies are now:

| Collapse | Closing clause |
|---|---|
| Terminal delay | Fixed baseline; early termination already costs \(o(n)\); prefix obligations cannot be erased later. |
| Prelude delay | The preprocessing algorithm and first endpoint are fixed before the continuation. |
| Cap before freeze | Every live capped shell is immediately registered at the baseline. |
| Shell deferral/raw-time credit | Causal clocks count only online marked witnesses; service clocks count every Shortener turn. |
| Zero weights/omitted targets | Strictly positive weights and exact unit mass in every target fiber. |
| First-exit reassignment | Global monotone exit time and immutable exact cause map. |
| Cost-only/terminal equivalence | \(H\) is arithmetically fixed, and the baseline is not chosen at a terminal witness. |
| Micro-baseline compression | Populations at most \(4X/h^2\) are genuinely globally negligible. |
| Cap escape | High-to-cap conversion preserves the same ticket, mass, cohort, and ledger. |
| Epoch-boundary laundering | Exit times and clocks begin at the common baseline; inherited exits remain charged. |
| Uncharged scheduling delay | Every relevant Shortener turn has exactly one active service owner. |
| Post-hoc cohort selection | Every potential cohort and weight is fixed at \(b\); activation uses only target survival. |
| Registration starvation | Actual live shells are in exact bijection with active or waiting records; successors are immediate. |

The audits’ additional formal defects are also removed:

- direct-ancestor channel completeness is an equivalence, not a one-way soundness clause;
- witnesses are prefix-measurable online maps;
- baseline atoms are initially usable;
- stopped tickets cannot block successors;
- the conjunction includes the quantifiers, hierarchy, triggers, deadlines, queue rules, and terminal convention.

---

# VI. The fourteenth collapse

The original threshold was

\[
q_X>d_X.
\]

Choose an integer \(q\) satisfying

\[
d_X<q\le2d_X.
\tag{34}
\]

Such an integer exists for every audited shell when \(n\) is large, because

\[
d_X\ge\frac{H^6}{H^4}=H^2\to\infty.
\]

Then

\[
q\le2d_X
\iff
q\le\frac q2+d_X.
\tag{35}
\]

Therefore a newly activated ticket with mass \(m=q\) already meets its completion inequality at its starting state.

There are only three possibilities.

### Immediate discharge

The ticket is discharged without a move. Since \(q>d_X\), mandatory succession creates another ticket at the same state. This repeats forever before the policy makes its next game move.

### Positive-service discharge

The scheduler insists on spending service turns before checking completion. It may then spend \(B_\delta(q)\) turns and discharge the ticket while \(q\) is unchanged. Re-registration creates an unbounded sequence of positive-cost tickets.

### Finite epoch list

After \(J_H\) such tickets, no pre-registered epoch remains, while the shell still satisfies \(q>d_X\). Mandatory registration and the finite master ledger become inconsistent.

Thus the original registration repair is not well founded.

The recurrence explains the obstruction. If

\[
m_{j+1}\le\frac12m_j+d_X,
\tag{36}
\]

then its fixed point is \(2d_X\). A terminal threshold below that fixed point cannot be reached from (36) alone.

The threshold \(4d_X\) repairs the defect. Any constant strictly larger than \(2\) would work, with a corresponding change in the number of epochs.

---

# VII. Activation–area impossibility theorem

We now prove the architectural theorem.

## Theorem

Consider any trajectory-restricted serial-ticket scheme with the following features:

1. Apart from a fixed \(o(n)\) prelude and endgame, all Shortener time is meant to be bounded by summing ticket service budgets.

2. Ticket-local certificate inequalities are asserted only for registered or activated tickets.

3. A ticket, or a bounded chain of its non-resetting phases, has total service budget

   \[
   O\!\left(m\frac{\log h}{h}\right)+O(1).
   \]

4. A successful chain above dust must terminate with actual shell contraction

   \[
   q'\le\frac12m+d_X.
   \tag{37}
   \]

Then exactly one of the following holds.

### Starvation branch

Some live shell can have no outstanding ticket, some relevant turn can have no service owner, some completed ticket can block a successor, or an unbounded phase chain can occur before contraction. In that case the ticket assertions do not support the claimed total-time bound.

### Online-area branch

Every live shell is registered, all relevant turns are service-owned, every live successor is immediate, and every bounded phase chain ends in (37). Then the ticket chains themselves form a scheduled trajectory-restricted online-area decomposition.

For the half-plus-\(d_X\) recurrence with \(J_H=2\lceil\log_2h\rceil+3\), a well-founded \(O(\log h)\)-epoch decomposition requires a terminal threshold strictly above \(2d_X\); the choice \(4d_X\) suffices.

Consequently no nondegenerate, pipeline-sufficient member of this ticket architecture is strictly weaker than trajectory-restricted online area.

## Proof

### 1. Deletion gives registration starvation

Let \(\mathcal E\) be the collection of activated epochs.

Before mandatory registration is inserted, every ledger assertion has the form

\[
\forall e\in\mathcal E:\ P(e),
\tag{38}
\]

while clock conditions have upper-bound form

\[
\sum_{e\in\mathcal E}C(e)\le M.
\tag{39}
\]

Queue conditions similarly quantify over tickets that exist.

If eligibility does not imply registration, replace \(\mathcal E\) by any subcollection \(\mathcal E'\subseteq\mathcal E\), in particular by deleting all high-degree tickets.

Then:

- every universal condition (38) remains true;
- every upper-bound condition (39) becomes easier;
- FIFO and uniqueness properties remain true on the smaller queue;
- every deleted service counter and causal clock disappears;
- all potential master cohorts may remain honestly pre-registered.

Thus the ticket language is downward closed under ticket deletion unless it contains an explicit existence axiom.

The same argument applies after a completed ticket if successor registration is not mandatory. Delete all successors. It also applies when a stopped ticket is allowed to remain outstanding: leave one zombie record and suppress every later epoch.

Therefore a total registration-and-succession invariant is logically necessary.

### 2. Service ownership is necessary

Suppose a live shell exists but a Shortener turn need not increment any active service clock. That turn is absent from every sum of ticket budgets.

Repeating such uncovered turns produces an arbitrarily long interval not bounded by the service accounting. “Work-conserving” is irrelevant when the queue is empty or no ticket is declared active.

The only alternatives are:

- require every relevant turn to have exactly one service owner; or
- separately assume that the number of uncovered turns is \(o(n)\).

The second alternative is already a direct global time bound. Within the stipulated ticket-summing pipeline, the first is the noncircular formulation.

### 3. An unbounded phase chain is another starvation mechanism

High and capped phases may be separate, and other finite repair phases could be introduced. Coalesce all consecutive non-resetting phases of one shell until the first occurrence of (37).

If their total service is not bounded by

\[
C B_\delta(m)+O(1)
\]

for an absolute or \(\delta\)-dependent constant \(C\), then arbitrarily many service turns may occur without an online-area contraction. The total service proof fails.

If their total service is bounded, the coalesced interval is one processing block satisfying (37).

Thus adding more named phases does not avoid the dichotomy: they either form an unbounded starvation chain or coalesce into an online-area block.

### 4. The repaired recurrence has finitely many epochs

Let \(m_j\) be the service-start mass of the \(j\)-th activated epoch of shell \(X\). Waiting can only decrease the shell population, so

\[
m_{j+1}
\le
\frac12m_j+d_X.
\tag{40}
\]

Inductively,

\[
m_j
\le
2^{-j}m_0+2d_X(1-2^{-j})
<
2^{-j}X+2d_X.
\tag{41}
\]

For

\[
J_H=2\lceil\log_2h\rceil+3,
\]

we have

\[
2^{-J_H}X
\le
\frac{X}{8h^2}
=
\frac{d_X}{8}.
\tag{42}
\]

Hence

\[
m_{J_H}
<
\frac{17}{8}d_X
<
4d_X.
\tag{43}
\]

Therefore no \((J_H+1)\)-st live epoch is requested. The repaired registration process is well founded.

Moreover,

\[
\begin{aligned}
\sum_{j<J_H}m_j
&\le
\sum_{j<J_H}2^{-j}X+2J_Hd_X\\
&<
2X+\frac{2J_HX}{h^2}\\
&=O(X).
\end{aligned}
\tag{44}
\]

### 5. Tickets give online-area blocks

Consider one activated epoch with service-start mass \(m\).

If it begins capped, \((\mathrm{TR\!-\!CAP}_4)\) gives, in at most \(B_\delta(m)\) assigned turns,

\[
q_X(\mathrm{end})
\le
\frac12m+d_X.
\tag{45}
\]

If it begins high-degree, the accepted advance-depletion reduction and \((\mathrm{TR\!-\!AH}_4)\) give, within the first \(B_\delta(m)\) turns, either (45) or cap conversion.

Indeed, because \(m>4X/H^4\),

\[
\frac{\varepsilon_\delta(H)X}{m}
\le
\frac14\varepsilon_\delta(H)H^4
=
o(1/J_H),
\tag{46}
\]

and by the local clock bound,

\[
\frac{H\ell_{X,j}}{m}
\le
K_\delta\frac{H\log h}{h}
=
K_\delta\frac{\log h}{H}
=o(1).
\tag{47}
\]

The other accepted channels contribute \(o(m)\), so the stipulated high-degree reduction rules out a deadline with both high degree and no contraction.

After conversion, the capped phase uses at most one additional budget. Therefore the coalesced high-plus-cap interval has at most

\[
2B_\delta(m)
\tag{48}
\]

Shortener turns and ends with (45).

That interval is precisely an online-area processing block.

Mandatory registration ensures every live shell has such a block waiting or active. No-idle service ensures every relevant Shortener turn belongs to one block. Immediate succession repeats the construction while the shell remains above \(4d_X\).

Hence the tickets furnish a scheduled pathwise online-area decomposition.

### 6. Conversely, online-area blocks furnish tickets

Suppose a complete Shortener policy already has a scheduled pathwise online-area decomposition: whenever a shell is processed with starting mass \(m>4d_X\), a block of at most

\[
C m\frac{\log h}{h}+O(1)
\]

Shortener turns ends with

\[
q_X\le\frac12m+d_X,
\]

and all relevant turns belong to one serial block.

Register every live shell immediately. Put the records in the order in which their online-area blocks are scheduled. A record disappearing below \(4d_X\) while waiting is discharged by helpful progress. Activate the next record at the beginning of its block and re-register a successor after its block if necessary.

This gives mandatory registration, no-idle service, FIFO succession, bounded service, and the same contraction recurrence.

Therefore the operational ticket core and scheduled trajectory online area are equivalent encodings.

This proves the theorem. ∎

---

# VIII. Verification of the implication to \(L(n)=o(n)\)

The maximally repaired statement \(\mathsf{CTRMLA}_4\) does imply \(L(n)=o(n)\), but the proof now makes clear that this is because it already implies online area.

For one shell, the total Shortener service is, using (44),

\[
\begin{aligned}
\sum_{j<J_H}2B_\delta(m_j)
&\le
2K_\delta\frac{\log h}{h}
\sum_{j<J_H}m_j
+
2J_H\\
&=
O_\delta\!\left(\frac{X\log h}{h}\right)
+
O(J_H).
\end{aligned}
\tag{49}
\]

The dyadic scales satisfy

\[
\sum_{X\in\mathcal X_n}X<2n
\]

and

\[
|\mathcal X_n|=O(\log n).
\]

Therefore all large-shell ticket service is

\[
O_\delta\!\left(\frac{n\log h}{h}\right)
+
O(J_H\log n)
=
o(n).
\tag{50}
\]

The ceiling term is harmless because

\[
J_H=O(\log H)=O(\log n)
\]

and hence

\[
J_H\log n=o(n).
\]

When ticket processing terminates, every large shell has

\[
q_X\le4d_X=\frac{4X}{h^2},
\]

so the total remaining large-shell mass is at most

\[
\sum_X\frac{4X}{h^2}
<
\frac{8n}{h^2}
=o(n).
\tag{51}
\]

The shells with \(X<H^6\) contain only

\[
O(H^6)=o(n)
\tag{52}
\]

integers.

The fixed preprocessing costs \(o(n)\). Since Prolonger and Shortener alternate, \(o(n)\) Shortener service turns account for \(o(n)\) actual moves. The exact-only bank, transfers to the minimal legal set, the negligible dust and small-shell populations, and the accepted static completion theorem then give the stipulated online-area endgame.

Consequently

\[
\boxed{
\mathsf{CTRMLA}_4
\Longrightarrow
\mathrm{OA}^{\mathrm{path}}_4
\Longrightarrow
L(n)=o(n).
}
\tag{53}
\]

---

# Final resolution

The fourteenth collapse is

\[
\boxed{\text{additive-floor ticket chattering}.}
\]

It is repaired by changing the live threshold from

\[
\frac{X}{h^2}
\]

to, for example,

\[
\frac{4X}{h^2}.
\]

After making that repair and adding the audits’ mandatory registration, exact witness, unique-cause, no-idle, succession, and re-registration requirements, the formal statement is well defined and excludes all identified degeneracies.

But the repair has an unavoidable architectural consequence:

\[
\boxed{
\text{mandatory activation}
+
\text{bounded ticket resolution}
+
\text{no-idle coverage}
=
\text{trajectory-restricted online area}.
}
\]

Therefore the trajectory master-ledger family cannot be closed as a genuinely weaker intermediate theorem. Either some ticketless or noncontracting interval remains, producing a starvation witness, or the resulting statement already contains the operational content of online area.

This does not decide whether \(L(n)=o(n)\). It decisively ends this formulation loop: proving the fully repaired ancestor-ledger statement would be a proof of online area itself, while weakening it enough to avoid that implication reopens registration starvation, service starvation, phase-chain starvation, or additive-floor chattering.
---
id: R122a-epoch-suppression-witness
type: verification
date: 2026-07-12
intent: >
  Adversarial audit of the trajectory-restricted capped-state statement:
  well-formedness, thirteenth-witness hunt, and preservation of the
  implication to L(n) = o(n).
predecessors: [R120-trajectory-restricted-statement]
action:
  kind: refutes
  target: R120-trajectory-restricted-statement
failure_mechanism: >
  Thirteenth collapse — post-hoc epoch suppression / null registration:
  the statement obliges cohorts and tickets only within ACTIVATED
  high-degree epochs, but nothing forces the policy ever to activate
  one; all potential cohorts can be pre-registered while no high-degree
  epoch is opened, so every clocked obligation is vacuous on the
  realized trajectory. Also REPAIRABLE well-formedness defects: ticket
  creation, epoch succession, causal witnesses (no canonical witness
  set for causal certificates), and several outer quantifiers are not
  fully defined.
claim: >
  Verdicts: A REPAIRABLE (seven-item repair list including explicit
  finite witness sets for causal certificates), B REFUTED (epoch
  suppression witness), C not established as written. The Section 9
  statement is degenerate; the repair direction is a mandatory
  activation / no-idle invariant tied to the actual shell populations.
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/audit-R122-trajectory-statement.md
---

I audited the uploaded statement as written, including the literal Section 9 conjunction rather than silently supplying missing scheduler axioms. 

## Verdicts

| Issue | Verdict | Decisive point |
|---|---|---|
| **A. Well-formedness** | **REPAIRABLE** | The on-path strategy quantifier is clear, but ticket creation, epoch succession, causal witnesses, and several outer quantifiers are not fully defined. |
| **B. Nondegeneracy** | **REFUTED** | There is a thirteenth collapse: **post-hoc epoch suppression / null registration**. Potential cohorts may all be pre-registered while no high-degree epoch is ever activated. |
| **C. Inapplicability and implication** | **REPAIRABLE** | The off-path fortress objection is indeed inapplicable, but the stated negation is not exact and the \(L(n)=o(n)\) derivation assumes an unstated total-service-cover invariant. |

# A. Well-formedness — **REPAIRABLE**

The trajectory restriction itself is correctly expressed. A deterministic \(\Sigma_{n,\delta}\) is chosen before \(\Pi\), and all subsequent quantities are evaluated on the one realized play, with \(B=A_b\). Thus there is genuinely no obligation at externally supplied baselines. 

But the Section 9 box is not yet a single closed mathematical proposition.

### 1. \(\mathbf K^\star\) is neither concretely specified nor quantified

The text says “\(\mathbf K^\star\) fixed,” but only gives axiomatic descriptions of its components. It never says whether the theorem is:

\[
\forall \mathbf K^\star\in\mathcal K,\qquad
\exists \mathbf K^\star\in\mathcal K,
\]

or about one explicitly defined datum. Different admissible choices of exit predicates, priorities, relevance maps, and queue protocols give different statements. 

Similarly, \(\varepsilon_\delta\) and \(\beta_\delta\) are used as functions but their domains, codomains, nonnegativity, and the precise meaning of their limits are unstated. \(K_\delta\) should explicitly satisfy \(0<K_\delta<\infty\).

### 2. There is no high-degree ticket-generation rule

Section 7 says:

> “An epoch is audited only if …”

and then:

> “If \(D_X(s_{X,j})>H\), define the stopping time …”

This presupposes an already existing \(s_{X,j}\). It gives a necessary condition for auditing, not a rule saying that a shell satisfying the condition must generate an epoch. In contrast, capped tickets are introduced with an explicit “Whenever” trigger. 

Missing are recursive definitions of:

- when epoch \(j=0\) is registered;
- when \(s_{X,j}\) exists;
- when the successor \(j+1\) is registered;
- whether cancellation is allowed;
- what happens after a waiting ticket contracts but remains above dust;
- how a completed capped ticket retriggers;
- whether every post-baseline Shortener turn belongs to some ticket.

The sentence in Part II that every non-dust shell “necessarily creates a high-degree or capped ticket” is therefore an assertion, not a consequence of the formal clauses. 

### 3. The final conjunction omits the ticket domains and stopping rules

Section 9 defines the final statement as the conjunction of

\[
(\mathrm{TR\!-\!AH}),\quad
(\mathrm{TR\!-\!CAP}),\quad
(5)\text{--}(17).
\]

That literally omits conditions (18)–(21), including all three high-degree stopping events and the capped-ticket trigger. It also omits the unnumbered coverage, soundness, irreversibility, and queue axioms. 

A charitable reader can import all preceding prose, but then the Section 9 box is not itself the claimed closed statement.

### 4. “Used in a causal certificate” is not a mathematical relation

The clock requirement says every move “used in a causal certificate” must receive \(\rho=1\), but no canonical witness set is defined. If several certificates exist, it is unclear whether \(\rho\) must cover:

\[
\text{one selected certificate},\qquad
\text{all certificates},\qquad
\text{or some minimal certificate}.
\]

That distinction changes both local and global clock budgets. 

### 5. The first-exit channels need an exact partition axiom

Coverage only says that at least one channel fires. Soundness says that a true channel has an appropriate certificate. Neither says that direct-ancestor exits must be classified as \(\mathrm{anc}\), or that two channels cannot claim the same first exit. This is also the basis of the second degeneracy discussed below.

### Repair

A precise version should add a recursively defined ticket process \(\mathcal E(\mathfrak h_t)\) with these invariants:

1. Whenever \(X\ge H^6\), \(|Q_X(t)|>X/h^2\), and shell \(X\) has no outstanding ticket, its next unused epoch is immediately enqueued.
2. Its mode is high-degree when \(D_X(t)>H\), otherwise capped.
3. Every post-baseline Shortener turn before the static endgame increments exactly one active service clock.
4. A ticket can leave the system only through contraction, high-to-cap conversion, its stipulated deadline, or terminal play.
5. After contraction, a successor is immediately generated if the residual remains above dust.
6. A canonical first-cause map assigns exactly one channel to each first exit.
7. Each causal certificate has an explicitly defined finite witness set of move indices.
8. Conditions (1)–(21), all queue/channel axioms, and terminal conventions are included in the final formula.

With those additions, the obligations can still range exclusively over actual trajectories.

# B. Nondegeneracy — **REFUTED**

## Thirteenth collapse: **post-hoc epoch suppression**

The twelve exclusions freeze the contents of a cohort after an epoch is selected. They do not force any high-degree epoch to be selected.

Here is the witness.

### The data

After the stipulated preprocessing, let Shortener use the completely deterministic legal policy

\[
\Sigma_{\min}(A)
=
\min\{z\in\{2,\ldots,n\}:z\text{ is legal at }A\}.
\]

For the master cohorts, take the entirely nondegenerate unit-copy system

\[
\Omega_{X,j}(B)
=
\{(u,j):u\in Q_X(B)\},
\qquad
\pi_{X,j}(u,j)=u,
\qquad
w_{X,j}(u,j)=1.
\]

Thus every target has exactly unit weight in every potential epoch; equations (5) and (6) hold.

Now choose the fixed queue protocol:

\[
\mathsf{RegisterHigh}(X,j,\mathfrak h_t)\equiv0.
\]

In words: no high-degree potential epoch is ever registered or assigned a service-start time.

### Why it satisfies every stated queue property

The six queue conditions only regulate active or waiting tickets:

- at most one ticket is active;
- turns increment \(v\) while a ticket is active;
- waiting tickets obey FIFO;
- at most one ticket is outstanding per shell.

The empty high-degree queue satisfies all of them vacuously. Work conservation says that waiting work must be serviced; it does not say that eligible work must be created. 

Consequently:

- no \(s_{X,j}\) exists for a high-degree epoch;
- no \(\Omega^{\mathrm{act}}_{X,j}\) is formed;
- no \(\tau_{X,j}\) exists;
- \((\mathrm{TR\!-\!AH})\) has no instances;
- the local clock inequalities have no instances;
- the global clock sum over actual epochs is \(0\).

Arbitrarily many actual moves may therefore occur in high-degree states without any service clock being “frozen”: there simply is no service clock. This is **not** collapse 11, which assumes that a ticket is already active. It is also not post-hoc cohort selection: every potential cohort and every weight is honestly fixed at \(b\); the policy merely suppresses activation of all of them.

Under the literal Section 9 conjunction, the capped trigger (21) is also not included, so the same queue can generate no capped tickets either. Then both substantive boxed obligations have empty domains.

Under the most charitable reading, where Section 8’s “Whenever” clause is imported despite its omission from Section 9, capped tickets remain. But the entire high-degree direct-ancestor problem has still been bypassed; one may combine the null high-degree registration rule with whatever stipulated capped-clearing module the manuscript already assumes. The claimed new chronological work is never performed.

This is exactly the missing axiom:

\[
\boxed{
X\ge H^6,\quad |Q_X(t)|>\frac{X}{h^2},
\quad\text{no outstanding ticket}
\ \Longrightarrow\
\text{a ticket is registered at }t.
}
\]

It must apply at the baseline and immediately after every ticket discharge.

## Independent additional loophole: channel-priority laundering

The manuscript also states that “channel coverage prevents \(I_{\mathrm{anc}}\equiv0\).” That is false. 

Introduce a duplicate channel \(\mathrm{anc}'\) carrying exactly the same arithmetic direct-ancestor certificate, and put

\[
\mathrm{anc}'\prec\mathrm{anc}.
\]

Set

\[
\mathsf E_{\mathrm{anc}'}
=
\text{the designated direct-ancestor predicate},
\qquad
\mathsf E_{\mathrm{anc}}\equiv0.
\]

All direct-ancestor exits remain covered and sound; irreversibility is unchanged. But every such exit has

\[
\chi(\omega)=\mathrm{anc}',
\]

so

\[
\operatorname{Anc}_{X,j}(t)\equiv0.
\]

Coverage is existential over channels, while soundness is only one-way. Neither supplies **completeness of the distinguished ancestor channel**. The fixed priority order makes simultaneous first-exit laundering permanent. 

The repair is to require a unique canonical cause map, or at minimum:

\[
\chi(\omega)=\mathrm{anc}
\quad\Longleftrightarrow\quad
\omega\text{ first becomes unusable by the designated direct-ancestor mechanism}.
\]

# C. Inapplicability and implication — **REPAIRABLE**

## 1. The fortress inapplicability claim is substantively correct

The core logical distinction is valid:

\[
\forall\Sigma\ \exists A^\star:
\neg P(\Sigma,A^\star)
\]

does not imply

\[
\forall\Sigma\ \exists\Pi\ \exists t:
\neg P(\Sigma,A_t(\Sigma,\Pi)).
\]

An off-policy fortress can refute a statement uniform over all baselines. It cannot refute an existential complete policy whose obligations concern only states reached against that policy. To reuse the fortress, Prolonger must force entry into a fortress or force some other on-path violating prefix. The conditional bounded-erosion estimate by itself does not provide that forcing theorem. 

Likewise, accepting the document’s descriptions of the stipulated lemmas, none supplies the missing arbitrary-policy chronological direct-ancestor allocation. That assessment of the **intended repaired target** is reasonable.

## 2. The claimed negation is not exact

Suppressing \(\mathbf K^\star\), write the statement as

\[
\exists C_0>0\
\forall\delta>0\
\exists\Theta_\delta\
\forall n\ge N_\delta\
\forall\Pi\
P(C_0,\delta,\Theta_\delta,n,\Pi),
\]

where \(\Theta_\delta\) contains

\[
K_\delta,\varepsilon_\delta,\beta_\delta,N_\delta,
\{\Sigma_{n,\delta}\}_{n\ge N_\delta}.
\]

Its negation is

\[
\boxed{
\forall C_0>0\
\exists\delta>0\
\forall\Theta_\delta\text{ admissible}\
\exists n\ge N_\delta\
\exists\Pi:
\neg P(C_0,\delta,\Theta_\delta,n,\Pi).
}
\]

The manuscript’s shorthand

\[
\text{“for some fixed }\delta,\quad
\forall\Sigma\exists n\exists\Pi”
\]

omits the universal quantifiers over \(C_0,K_\delta,\varepsilon_\delta,\beta_\delta,N_\delta\), and it obscures that \(\Sigma\) is an \(n\)-indexed family. A single fixed \(\delta\) working for every \(C_0\) would be a stronger sufficient disproof, not the literal negation. 

## 3. Trajectory restriction itself does not damage the implication

If there is one complete Shortener policy \(\Sigma_n\) such that

\[
\sup_\Pi
|\operatorname{Play}(\Sigma_n,\Pi)|
=o(n),
\]

then immediately

\[
L(n)\le
\sup_\Pi
|\operatorname{Play}(\Sigma_n,\Pi)|
=o(n).
\]

No control of states that \(\Sigma_n\) never reaches is required. In fact, the actual-trajectory quantifier is exactly what a game-value upper bound needs.

## 4. But the written ticket statement does not establish that play-length bound

Part III bounds the number of **allocated service turns**:

\[
O\!\left(\frac{\log h}{h}\sum_jm_{X,j}\right),
\]

then concludes that work conservation leaves no unaccounted time. 

That conclusion silently assumes:

\[
\boxed{
\text{Every post-baseline Shortener turn before the endgame
is assigned to exactly one active ticket.}
}
\]

The queue axioms establish only the weaker statement:

\[
\text{if a ticket exists, its service cannot be frozen.}
\]

They do not ensure:

- an initial high-degree ticket exists;
- a successor ticket exists after contraction;
- a shell above dust cannot become ticketless;
- a completed capped ticket retriggers when residual mass remains;
- the intervals covered by active tickets partition the actual continuation.

Thus the service estimate may account for every turn in the union of service intervals while leaving arbitrary gaps outside that union. “Work-conserving” does not fill a queue that the registration protocol leaves empty.

There is also a smaller accounting omission:

\[
B_\delta(m)
=
\left\lceil K_\delta m\frac{\log h}{h}\right\rceil
\]

gives an additive \(1\) per epoch. Once registration is fixed, this merely contributes

\[
O(J_H\log n)=o(n)
\]

over all shells, so it is repairable rather than fatal.

## 5. After the registration repair, the implication works

Let

\[
d_X=\frac{X}{h^2}.
\]

If every completed epoch has a successor whenever its residual exceeds \(d_X\), then

\[
m_{j+1}\le\frac12m_j+d_X
\]

implies

\[
m_j\le 2^{-j}m_0+2d_X.
\]

Since \(m_0\le X\), after \(2\lceil\log_2h\rceil+O(1)\) epochs,

\[
m_j=O(d_X),
\]

and

\[
\sum_jm_j=O(X).
\]

The actual service for shell \(X\) is then

\[
\sum_j
\left\lceil
K_\delta m_j\frac{\log h}{h}
\right\rceil
=
O\!\left(\frac{X\log h}{h}\right)+O(J_H).
\]

Summing over the \(O(\log n)\) dyadic shells yields

\[
O\!\left(\frac{n\log h}{h}\right)
+
O(J_H\log n)
=o(n).
\]

If every post-baseline Shortener turn is assigned exactly once, alternation gives at most twice that many total moves, plus one. Adding the stipulated preprocessing, small-shell, dust, and static-completion costs then proves \(L(n)=o(n)\).

# Bottom line

The central off-path/on-path correction is real. The old fortress does not disprove the intended trajectory-restricted theorem.

But the manuscript has not yet written that intended theorem. Its present box permits **epoch-registration starvation**, and its channel axioms permit **ancestor-channel laundering**. Part III then assumes the missing registration invariant when converting ticket budgets into a bound on total play.

Accordingly, the defensible conclusion is:

\[
\boxed{
\begin{array}{c}
\text{The intended on-path theorem can be repaired and would imply }L(n)=o(n),\\[1mm]
\text{the fortress still would not refute that repaired theorem,}\\[1mm]
\text{but the current Section 9 statement is degenerate and its}\\
\text{claimed implication is not established as written.}
\end{array}}
\]
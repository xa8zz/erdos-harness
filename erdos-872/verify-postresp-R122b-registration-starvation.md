---
id: R122b-registration-starvation-witness
type: verification
date: 2026-07-12
intent: >
  Second independent adversarial audit (same brief, separate thread) of
  the trajectory-restricted capped-state statement.
predecessors: [R120-trajectory-restricted-statement]
action:
  kind: refutes
  target: R120-trajectory-restricted-statement
failure_mechanism: >
  Thirteenth collapse — high-degree registration starvation (same
  family as the sibling audit's epoch suppression, found independently):
  the queue may simply never create a high-degree ticket, leaving both
  the causal and service clocks inactive and the statement vacuously
  true. Well-formedness REFUTED as written: high-degree epoch creation
  and re-registration are never defined, and "causal certificate" lacks
  a fixed prefix-measurable witness map, so several displayed
  obligations have unbound objects.
claim: >
  Verdicts: A REFUTED (definitional gaps), B REFUTED (registration
  starvation), C REPAIRABLE — the off-path/on-path fortress distinction
  is correct, but the stated negation is imprecise and the derivation
  of L(n) = o(n) silently assumes a missing no-idle ticket-coverage
  invariant. The intended repaired theorem may still be sound; Section
  9 has not yet stated it.
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/audit-R122-trajectory-statement.md
---

I audited the uploaded statement as written, including the literal Section 9 definition rather than the theorem the surrounding prose appears to intend. 

| Question | Verdict | Decisive issue |
|---|---|---|
| **A. Well-formedness** | **REFUTED** | High-degree epoch creation and re-registration are never defined; several displayed obligations therefore have unbound or partial objects. |
| **B. Nondegeneracy** | **REFUTED** | A thirteenth collapse exists: **high-degree registration starvation**. The queue may simply never create a high-degree ticket, leaving both clocks inactive. |
| **C. Inapplicability and implication** | **REPAIRABLE** | The off-path/on-path fortress distinction is correct, but the full negation is misstated and the \(L(n)=o(n)\) derivation silently assumes a missing no-idle ticket-coverage invariant. |

# A. Well-formedness — **REFUTED**

The reachability idea itself is sound: after fixing \(\Sigma_{n,\delta}\), requiring the inequalities only on histories produced by some Prolonger policy is a coherent pathwise restriction. The failure is that the document never defines which high-degree histories become audited histories.

## The fatal missing definition

The following objects are used:

\[
s_{X,j},\qquad m_{X,j}=|Q_X(s_{X,j})|,\qquad
\Omega^{\mathrm{act}}_{X,j},\qquad
v_{X,j},\qquad
\tau_{X,j}.
\]

But there is no rule assigning \(s_{X,j}\).

Section 7 says only:

- an epoch is audited **only if** the size conditions hold; and
- **if** \(D_X(s_{X,j})>H\), then a stopping time is defined.

Those are filters on an epoch that already exists. Neither is an epoch-generation rule. In contrast, Section 8 explicitly says that a capped state generates a capped ticket. 

Nothing says:

\[
\begin{split}
&\text{whenever }X\ge H^6,\quad |Q_X(t)|>X/h^2,\quad D_X(t)>H,\\
&\text{and shell }X\text{ has no outstanding ticket,}\\
&\text{the next unused epoch }j\text{ is registered and enqueued.}
\end{split}
\tag{R}
\]

Nor is there a rule saying that, after an epoch contracts, the next epoch is immediately registered if the shell remains above dust.

Consequently:

- \(s_{X,j}\) may never exist;
- \(\tau_{X,j}\) may never exist;
- the sum in (14) has no specified index set;
- “work-conserving” only controls tickets already in the queue;
- a live high-degree shell may generate no service obligation at all.

The manuscript later asserts that every shell above dust “necessarily creates a high-degree or capped ticket,” but that is not a consequence of any formal clause preceding Section 9. 

## The literal Section 9 conjunction is also incomplete

Section 9 defines the statement as the conjunction of

\[
(\mathrm{TR\!-\!AH}),\qquad
(\mathrm{TR\!-\!CAP}),\qquad
(5)\text{--}(17).
\]

Literally, this omits:

- the hierarchy (1)–(4);
- the quantifier prefix (Q);
- coverage, soundness and irreversibility;
- the queue axioms;
- stopping events (18)–(20);
- the capped trigger (21);
- ticket conversion and re-registration rules.

At best, the reader must guess that all surrounding prose is imported into the labels. Even under that charitable reading, rule (R) is absent. 

## Further formal incompletenesses

These are secondary to the missing registration rule, but real:

1. **\(\mathbf K^\star\) is not a closed quantified object.** It is declared “fixed,” but no admissible class is defined and no actual canonical datum is supplied. A theorem conditional on a named datum is legitimate; an abstract list of semantically described maps is not yet such a datum.

2. **“Causal certificate” is not a mathematical object.** There should be a fixed prefix-measurable witness map
   \[
   \Gamma_c(\omega,\mathfrak h_t)\subseteq\{1,\ldots,t\}
   \]
   specifying exactly which moves constitute the certificate. Otherwise the clock requirement depends on an unspecified choice of proof.

3. **“Permanently unusable for the accepted repair procedure” and “the prescribed ancestor” are not defined predicates.** Coverage and soundness therefore remain prose obligations.

4. **Parameter types are missing.** At minimum one needs
   \[
   K_\delta>0,\qquad
   \varepsilon_\delta:\mathbb R_{>0}\to\mathbb R_{\ge0},\qquad
   \beta_\delta:\mathbb N\to\mathbb R_{\ge0},
   \]
   and \(N_\delta\in\mathbb N\).

5. **Empty maxima need a convention.** If \(D(A_t)=\varnothing\), then \(D_X(t)\) should be defined as \(0\).

Thus the Section 9 box is not yet one precise mathematical statement.

# B. Nondegeneracy — **REFUTED**

## Thirteenth collapse: high-degree registration starvation

The twelve exclusions control what happens **after** a cohort or ticket has been activated. They do not force activation.

Here is a fully specified admissible construction under the stated axioms.

### Master cohorts

For each \(B,X,j\), put

\[
\Omega^\circ_{X,j}(B)
=
\{(X,j,u):u\in Q_X(B)\},
\]

with

\[
\pi_{X,j}(X,j,u)=u,\qquad
w_{X,j}(X,j,u)=1.
\]

Then (5) holds exactly and (6) holds with equality \(J_H\).

### Queue

Define \(\mathsf{Queue}^\circ\) as follows.

- It accepts and serially services capped tickets generated by Section 8.
- It uses the stated FIFO shell tie-breaker.
- It never generates a high-degree ticket.
- When no capped ticket exists, the queue is empty.

This queue satisfies all six listed queue properties:

- at most one ticket is serviced;
- each Shortener turn during capped service increments that ticket’s \(v\);
- FIFO is obeyed;
- there is at most one outstanding capped ticket per shell;
- helpful waiting contraction discharges a ticket;
- the server is work-conserving relative to the tickets that actually exist.

“Work-conserving” does not require a job to be manufactured when the queue is empty.

### Shortener policy

Let \(\Sigma^\circ\) be:

1. follow the prescribed preprocessing \(\mathcal T_n\);
2. while a capped ticket is active, follow the stipulated capped-state clearing module, with a fixed deterministic tie-breaker;
3. otherwise choose the least currently legal integer.

This is a complete deterministic legal Shortener policy.

Choose, for example,

\[
C_0=1,\qquad
\varepsilon_\delta(H)=\frac{1}{H^5J_H^2},\qquad
\beta_\delta(n)=\frac1{\log(n+2)},
\]

and take \(K_\delta\) to be the constant used by the stipulated capped module.

### Why the intended work disappears

No high-degree ticket is ever created. Therefore:

- no high-degree \(s_{X,j}\) exists;
- no high-degree cohort is activated;
- \((\mathrm{TR\!-\!AH})\) has no instances;
- every local causal-clock obligation is vacuous;
- the high-degree contribution to (14) is the empty sum;
- no service clock counts Shortener turns occurring while the board is high-degree and the capped queue is empty.

The policy can therefore spend an arbitrarily large portion of the play in high-degree states without invoking the direct-ancestor theorem at all. Only the separately stipulated capped module remains.

This is precisely the missing interaction between the clocks and cohort registration:

\[
\text{no ticket}
\Longrightarrow
\text{no active cohort}
\Longrightarrow
\ell=v=0
\Longrightarrow
\text{no ancestor obligation and no service accounting}.
\]

The document’s conclusion that the service clock prevents every relevant clock from remaining frozen assumes that some relevant ticket exists. That premise is absent. 

Under the strictly literal Section 9 conjunction, one may go further and choose an entirely empty queue: the capped generation clause (21) is not included in the listed conjunction. Then both ticket inequalities are vacuous and the “least legal integer” policy is a complete witness. Under the more charitable reading that Section 8 is imported, the construction above still deletes the whole high-degree/direct-ancestor component.

## Independent defect: coverage does not prevent \(\operatorname{Anc}\equiv0\)

The manuscript explicitly claims that channel coverage prevents the ancestor indicator from being identically zero. That is logically false.

Take

\[
\mathcal C=\{\mathrm{anc},\mathrm{misc}\},
\qquad
\mathrm{misc}\prec\mathrm{anc},
\]

and define

\[
\mathsf E_{\mathrm{anc}}\equiv0,
\]

while \(\mathsf E_{\mathrm{misc}}\) fires whenever the atom becomes permanently unusable, carrying the corresponding unavailability certificate.

Then:

- coverage holds;
- soundness for \(\mathrm{anc}\) holds vacuously;
- irreversibility holds;
- every exited atom has channel \(\mathrm{misc}\);
- hence
  \[
  \operatorname{Anc}_{X,j}(t)=0
  \]
  for every epoch and prefix.

Even requiring \(\mathsf E_{\mathrm{anc}}\) to be true on direct-ancestor events would not suffice if a higher-priority channel may fire simultaneously. The priority rule can still siphon all such exits away from \(\mathrm{anc}\). The text only imposes the one-way implication

\[
\mathsf E_{\mathrm{anc}}=1
\Longrightarrow
\text{direct-ancestor event},
\]

not the necessary reverse implication. 

The repair must require channel completeness, for example:

\[
\text{the first permanent-unavailability mechanism is direct ancestor}
\Longrightarrow
\chi(\omega)=\mathrm{anc}.
\tag{AC}
\]

Preferably \(\chi\) should be a directly defined total classification function, rather than overlapping Boolean predicates followed by a manipulable priority order.

## Required repair

To close the thirteenth collapse, add all of the following.

Define

\[
\mathsf{Live}(t)
=
\left\{
X\in\mathcal X_n:
X\ge H^6,\ |Q_X(t)|>X/h^2
\right\}.
\]

Then impose:

1. **Mandatory registration.** When \(X\in\mathsf{Live}(t)\) has no outstanding ticket, its next unused epoch is immediately enqueued, high-degree or capped according to \(D_X(t)\).

2. **No-idle coverage.**
   \[
   \mathsf{Live}(t)\ne\varnothing
   \Longrightarrow
   \text{a ticket is active or waiting}.
   \]

3. **Immediate re-registration.** On completion or discharge, if \(X\) remains live, the next epoch is enqueued before the next Shortener turn.

4. **No stopped-ticket blocker.** A completed or deadline-stopped ticket ceases to be outstanding unless it converts immediately to its capped successor.

5. **Channel completeness (AC).**

6. **Initial freshness or initialization debt.** Either require every master atom to be usable at \(b\),
   \[
   \mathsf E_c(\omega,\mathfrak h_b)=0
   \quad\text{for every }c,
   \]
   or explicitly charge pre-\(b\) causal damage. As written, \(\xi\) may equal \(b\), while \(\ell\) starts at \(b+1\).

# C. Inapplicability and implication — **REPAIRABLE**

## 1. The central fortress objection is genuinely inapplicable

At the strategy layer, the document is correct.

A result of the form

\[
\forall\Sigma\ \exists A^\star:
\text{\(\Sigma\) performs badly if started at }A^\star
\]

does not refute

\[
\exists\Sigma\ \forall\Pi:
P(\operatorname{Play}(\Sigma,\Pi)).
\]

One must show that, against the candidate \(\Sigma\), some Prolonger policy actually produces a bad **history**.

Indeed, because tickets, frozen masses \(q\), cohort exits and remaining service budgets are path-dependent, merely reaching the same board position \(A^\star\) is not necessarily sufficient. The disproof must reach a prefix having the relevant outstanding ticket and ledger history. A fortress reached after its reservoir has already been partly charged or after its ticket has been reset is not automatically the same counterexample.

Thus the old conditional erosion calculation remains valid conditional on entering the appropriate fortress history, but an off-policy starting state does not establish such entry. 

I also agree, on the supplied hypotheses, that none of the listed positive facts proves the intended chronology-stable direct-ancestor allocation.

## 2. The document’s “exact” negation is not exact

For fixed \(\mathbf K^\star\), the displayed quantifier prefix is

\[
\exists C_0>0\
\forall\delta>0\
\exists K_\delta,\varepsilon_\delta,\beta_\delta,N_\delta,
\{\Sigma_{n,\delta}\}\
\forall n\ge N_\delta\
\forall\Pi\
P.
\]

Its negation is

\[
\boxed{
\forall C_0>0\
\exists\delta>0\
\forall K_\delta,\varepsilon_\delta,\beta_\delta,N_\delta,
\{\Sigma_{n,\delta}\}\
\exists n\ge N_\delta\
\exists\Pi\
\neg P,
}
\tag{N}
\]

with the universal quantification restricted to admissible auxiliary functions and policy families.

The manuscript’s abbreviation

\[
\text{“for some fixed }\delta,\quad
\forall\Sigma\exists n\exists\Pi”
\]

suppresses several load-bearing quantifiers:

- \(\forall C_0\);
- all choices of \(K_\delta,\varepsilon_\delta,\beta_\delta\);
- \(\forall N_\delta\), which forces arbitrarily large counterexamples;
- policy families \(\{\Sigma_{n,\delta}\}\), rather than one isolated finite-\(n\) policy.

Moreover, the final boxed prose asks for “one Prolonger strategy which, against every complete policy,” which has the order

\[
\exists\Pi\ \forall\Sigma.
\]

That is strictly stronger than the required

\[
\forall\Sigma\ \exists\Pi.
\]

So the core off-path/on-path distinction is correct, but the claimed complete quantifier analysis is not.

## 3. The stated implication to \(L(n)=o(n)\) has a real gap

The problematic sentence is that the queue is work-conserving, so waiting causes no unaccounted turns. 

That proves only:

\[
\text{a ticket is waiting}
\Longrightarrow
\text{some ticket is being serviced}.
\]

The proof needs:

\[
\text{some large shell remains above dust}
\Longrightarrow
\text{some ticket is active}.
\tag{NI}
\]

Condition (NI) is missing. Registration-starved high-degree intervals are neither:

- charged to any \(v_{X,j}\);
- bounded by any \(B_\delta(m)\);
- counted by the causal clocks;
- included in the sum in (27).

Therefore equation (27) bounds total **ticket-service turns**, not all post-preprocessing Shortener turns. The inference from (27) to total game length is invalid as written.

This does not show that the underlying intended master-ledger theorem is false. It shows that the displayed statement does not yet imply the desired bound through the stated pipeline.

## 4. After the registration repair, trajectory restriction is sufficient

Once (NI), mandatory registration and immediate re-registration are added, no off-path uniformity is needed. A single policy \(\Sigma\) satisfying the pathwise assertions against every \(\Pi\) is exactly what an upper bound on the game value requires.

For one shell, the contraction recurrence gives

\[
m_{j+1}
\le
\frac12m_j+\frac{X}{h^2},
\]

so after \(J_H=2\lceil\log_2h\rceil+3\) epochs,

\[
m_{J_H}=O(X/h^2),
\qquad
\sum_{j<J_H}m_j=O(X).
\]

Including the ceilings omitted in the manuscript,

\[
\begin{aligned}
\sum_{j<J_H} B_\delta(m_j)
&=
\sum_{j<J_H}
\left\lceil
K_\delta m_j\frac{\log h}{h}
\right\rceil\\
&\le
K_\delta\frac{\log h}{h}\sum_jm_j+J_H\\
&=
O\!\left(\frac{X\log h}{h}\right)+O(J_H).
\end{aligned}
\]

Summing over the \(O(\log n)\) dyadic shells gives

\[
O\!\left(\frac{n\log h}{h}\right)
+
O(J_H\log n)
=
o(n).
\]

The second term is \(o(n)\) because \(J_H=O(\log H)=O(\log n)\).

Under (NI), every relevant post-baseline Shortener turn belongs to one of those service intervals. The number of Prolonger turns differs by at most one, so the actual play length is also \(o(n)\), after adding the stipulated preprocessing, small-shell, dust and completion costs.

Thus:

\[
\boxed{
\text{trajectory restriction itself does not break the implication;}
}
\]

the missing mandatory-registration invariant does.

# Final referee conclusion

The document correctly identifies why an off-policy fortress is not an on-path game-theoretic disproof. It also plausibly identifies the intended remaining mathematical obstacle.

But its stronger formal claims do not survive:

\[
\boxed{\text{A: REFUTED}}
\]

because high-degree epochs, their start times and their recursion are not defined;

\[
\boxed{\text{B: REFUTED}}
\]

because registration starvation gives a thirteenth degenerate construction, and channel coverage does not prevent \(\operatorname{Anc}\equiv0\);

\[
\boxed{\text{C: REPAIRABLE}}
\]

because the fortress distinction is right, while the exact negation and the \(L(n)=o(n)\) accounting require correction.

The manuscript’s “unresolved” assessment may still be correct for the intended repaired theorem. Section 9, however, has not yet stated that theorem.
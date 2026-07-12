---
id: R132-clock-debt-degeneracy
type: research
date: 2026-07-12
intent: >
  Prove or disprove the global no-reuse lemma (GNR): existence of a
  policy, scale H, and normalized historical debt potential Phi such
  that on reachable intervals with excess above M/2, failure to halve
  creates Omega(M) permanent debt, each Prolonger move creates O(1)
  net new debt over its entire future refinement history, resolved
  debt is charged once, and boundary error is o(M) + O(log n).
predecessors: [R129-global-no-reuse-reduction]
action:
  kind: refutes
  target: R129-global-no-reuse-reduction
failure_mechanism: >
  Sixteenth collapse — clock-debt / unowned-atom laundering: the
  literal four-item specification is satisfied by a trivial witness
  that assigns (n-1) unit atoms per completed Shortener turn, all
  owned by a distinguished non-move symbol. Item 1 holds because any
  ticket interval contains a Shortener turn and n-1 >= M (the
  implication form "failure => Omega(M) debt" never requires debt to
  be CAUSED by failure); item 2 holds with 0 = O(1) because no atom is
  ever owned by a Prolonger move; item 3 holds vacuously (nothing is
  ever resolved); item 4 holds with error exactly zero. Hence the
  deduction (GNR) => aggregate-excess halving is invalid without an
  unstated source-exhaustivity/conservation axiom tying debt creation
  to actual protected excess and forcing every protected target's
  debt to be owned by some actual Prolonger move. The reduction's
  decisiveness claim fails as stated; the reduction target must be
  repaired, not abandoned.
claim: >
  Literal (GNR) is true via the clock-debt witness and is therefore
  not the missing no-reuse lemma. The repaired statement (GNR')
  requires: fresh-debt conservation (every unit of excess surviving a
  failed halving interval is charged to an owner that is an actual
  Prolonger move, via a prefix-measurable assignment), immutable
  ownership, one-use settlement, explicit interval duration in actual
  Shortener turns, and the fifteen-family checklist (all verified
  passable for the repaired form except one clause). The single
  substantive unresolved clause is direct-ancestor bounded lifetime
  ownership: an earlier move that later invalidates many latent faces
  must have bounded total ownership after every future refinement —
  exactly the channel the atomic ledger controls only in the
  kappa(F) | c orientation. Neither the repaired statement nor its
  negation follows from the accepted facts; this resolution does not
  disprove aggregate-excess halving or L(n) = o(n).
implications:
  - Sixteenth collapse family for the catalogue - implication-form
    obligations satisfied by unowned bookkeeping; require conservation
    plus ownership axioms in any debt/ledger formulation.
  - The canonical upper-route target is now the repaired (GNR') whose
    only open clause is the direct-ancestor lifetime bound.
verifiers_at_time: []
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/researcher-R132-global-no-reuse-lemma.md
---

## Verdict

\[
\boxed{\text{(GNR) as written admits a degenerate witness and therefore is not the missing no-reuse lemma.}}
\]

More precisely:

1. Under the interval convention used by the attachment—an interval containing one or more Shortener turns—the literal existential assertion is **true for a trivial prefix-measurable potential**.
2. That potential satisfies items 1–4 while conveying no information about Prolonger’s ability to preserve excess.
3. Consequently, the claimed deduction
   \[
   (\mathrm{GNR})\Longrightarrow(\mathrm{AE}^{\dagger})
   \]
   is invalid without an additional **source-exhaustivity/conservation axiom**.
4. If “creates” is instead interpreted as a fresh increase on every arbitrary interval, including zero-turn or one-ply intervals, then the statement is malformed: item 1 is incompatible with item 2 for large \(M\), unless the assertion is vacuous.

This is a resolution of the formulation, not a disproof of \((\mathrm{AE}^{\dagger})\), and not a proof that a genuine chronological no-reuse potential cannot exist. The attachment expressly identifies a degenerate potential or ill-posed obligation as a valid kind of resolution. 

---

# 1. A completely specified witness

We first specify \(H\), the policy, and the potential.

## 1.1 The scale

Take

\[
H(n)=\max\left\{2,\left\lfloor (\log(n+3))^{1/12}\right\rfloor\right\}.
\]

Then

\[
H(n)\longrightarrow\infty
\]

and

\[
H(n)^6=O\bigl((\log n)^{1/2}\bigr)=o(n).
\]

## 1.2 The Shortener policy

Fix a deterministic implementation of the accepted smooth/rough trapping prelude, resolving every discretionary choice by choosing the least legal integer. Let \(b\) be its prescribed stopping time.

After \(b\), at every Shortener position \(A\), put

\[
\Delta_A(x)=R(A)-R(A\cup\{x\})
\]

for every legal move \(x\), and let

\[
\sigma(A)=
\min\operatorname*{arg\,max}_{x\text{ legal at }A}\Delta_A(x).
\]

Thus \(\sigma\) is a legal online policy, uses an actual maximum-aggregate-deletion move, and has complete deterministic tie-breaking. A legal batch product, when available, is included among the candidates \(x\); there is no unspecified exception or guard rule.

The particular policy will not matter for the degeneracy.

## 1.3 Unit normalization

For every post-baseline Shortener turn \(i\), and every integer \(v\in\{2,\ldots,n\}\), introduce one formal atom

\[
\alpha_{i,v}.
\]

Every atom has mass exactly \(1\). Hence there is no arbitrary real-valued rescaling: the potential is normalized as the cardinality of a set of unit atoms.

Let \(s(h)\) be the number of completed post-baseline Shortener turns in the history prefix \(h\). Define

\[
\mathcal D(h)
 =
 \{\alpha_{i,v}:1\le i\le s(h),\ 2\le v\le n\},
\]

and

\[
\Phi(h)=|\mathcal D(h)|=(n-1)s(h).
\tag{8}
\]

The atoms have the following ledger data:

- birth time: the end of Shortener turn \(i\);
- owner: a distinguished symbol \(\bot\), not a game move;
- status: permanent;
- resolution status: unresolved forever.

Thus \(\Phi\) is a nonnegative, integer-valued, prefix-measurable functional of the realized history. It is nondecreasing.

This is the **clock-debt potential**.

---

# 2. Verification of the four stated requirements

First note the elementary bound

\[
R(A)\le \sum_Xq_X(A)\le n-1.
\tag{9}
\]

The dyadic shells are disjoint, and all their targets belong to the \(n-1\) element ground set \(\{2,\ldots,n\}\).

Now consider an on-policy interval beginning with

\[
R=M>0
\]

and satisfying

\[
R>\frac M2
\]

throughout.

The ticket intervals used in the attachment contain at least one Shortener turn; indeed their length is

\[
C M\frac{\log H}{H}+K\log n,
\]

which is positive for sufficiently large \(n\).

## Item 1

At the first Shortener turn in the interval, exactly \(n-1\) new atoms are created. Therefore

\[
\Delta_I\Phi\ge n-1\ge M.
\tag{10}
\]

These atoms remain permanently in \(\Phi\). In particular, failure of the maximum-deletion moves to halve the ticket implies that at least \(M\), hence \(\Omega(M)\), units of permanent debt have been created during the interval.

The atoms would also be created on a successful interval, but item 1 states only an implication:

\[
\text{failure}\quad\Longrightarrow\quad\Omega(M)\text{ debt}.
\]

It does not state that the debt must be created only because of failure, or only when failure occurs.

Thus item 1 holds with constant \(1\).

## Item 2

A Prolonger move does not change \(s(h)\). Hence its immediate net contribution to \(\Phi\) is exactly zero.

Moreover, no present or future atom is assigned to a Prolonger move: every atom has owner \(\bot\). Therefore the total mass ever acquired by any Prolonger move throughout all later refinements is

\[
0=O(1).
\tag{11}
\]

In particular, a direct-ancestor move never acquires ownership of any debt at all.

## Item 3

No atom is ever declared resolved. Therefore the assertion

> every debt unit that is resolved by deletion or bank transfer is charged only once

holds vacuously: there is no resolved debt unit charged twice.

One can make this nonvacuous without changing the argument. Give every atom a settlement bit, set it at most once when any chosen bookkeeping event occurs, and continue counting the atom in the permanent historical archive. Each atom is then settled at most once, while its charge remains permanently in \(\Phi\).

## Item 4

No exceptional mass is discarded and no boundary correction is used. The baseline and boundary error is exactly

\[
0,
\]

which is certainly

\[
o(M)+O(\log n).
\]

Thus all four literal clauses hold.

---

# 3. An excess-labelled version of the same degeneracy

The preceding witness uses administrative clock atoms. Even requiring the atoms to be labelled by actual excess targets does not repair the statement.

Immediately after Shortener’s \(i\)-th post-baseline move, let the position be \(B_i\). In each shell \(S_X\), put

\[
e_{i,X}
 =
 \left(q_X(B_i)-\left\lceil\frac{4X}{H^2}\right\rceil\right)_+.
\]

Order \(Q_X(B_i)\) increasingly and let \(E_{i,X}\) be its first \(e_{i,X}\) elements. Then

\[
\left|\bigcup_XE_{i,X}\right|=R(B_i).
\]

Create one unit atom \((i,u)\) for every

\[
u\in\bigcup_XE_{i,X},
\]

assign all such atoms to owner \(\bot\), and retain them permanently. The corresponding potential is

\[
\Phi_{\mathrm{ex}}(h)
 =
 \sum_{\substack{i\le s(h)}}R(B_i).
\tag{12}
\]

On a failed interval, after the first Shortener response,

\[
R(B_i)>\frac M2,
\]

so that response creates more than \(M/2\) unit atoms labelled by actual live excess targets. Prolonger still owns zero atoms.

The same physical target may be registered again on later Shortener turns. Nothing in (GNR) forbids this. Thus even “one unit per atom” and “atoms correspond to excess targets” do not suffice. What is missing is a prohibition on **historical replication of the same protected mass**.

---

# 4. The exact logical gap in the claimed deduction

Let \(D_I\) denote the \(\Omega(M)\) debt supplied by item 1, and let \(D(p)\) be the total lifetime debt owned by a Prolonger move \(p\).

Items 1, 2, and 4 are intended to give

\[
D_I\ge cM-E_I
\tag{13}
\]

and

\[
D(p)\le C.
\tag{14}
\]

The argument in the attachment then wants to conclude

\[
cM-E_I
 \le
 \sum_{p\in\mathcal P(I)}D(p)+E_I
 \le
 C|\mathcal P(I)|+E_I,
\tag{15}
\]

where \(\mathcal P(I)\) is the set of Prolonger moves in the ticket.

But the first inequality in (15) is nowhere stated in (GNR). It is a missing conservation law:

\[
\boxed{
D_I
\le
\sum_{p\in\mathcal P(I)}D(p)
+
\text{boundary/baseline mass}.
}
\tag{16}
\]

Our witness has

\[
D_I\ge M,\qquad D(p)=0\quad\text{for every Prolonger move }p,
\]

because all debt is unowned clock debt. Hence the fact that the ticket contains only \(o(M)+O(\log n)\) Prolonger moves gives no contradiction.

This is not merely a peculiar choice of potential. It identifies the missing logical premise:

> Item 2 bounds one possible source of debt, but (GNR) never says that this is the only source of the debt counted in item 1.

Item 3 likewise does not supply that premise. It does not require debt to be settled, does not say settled debt must disappear from the lower bound, and does not prohibit the same target from producing new time-stamped debts later.

---

# 5. A second defect: “every interval” has no duration restriction

Suppose instead that “creates \(\Omega(M)\)” is intended to mean the genuinely incremental inequality

\[
\Phi(h_{\mathrm{end}})-\Phi(h_{\mathrm{start}})
 \ge
 cM-o(M)-O(\log n).
\tag{17}
\]

Then the phrase “on every interval” is untenable unless a ticket duration is specified.

Consider a zero-length interval \([h,h]\) at a state with

\[
M=R(h)\gg\log n.
\]

It satisfies \(R>M/2\) throughout, but

\[
\Phi(h)-\Phi(h)=0,
\]

contradicting (17).

Even after excluding empty intervals, an interval containing only one Prolonger move gives, under item 2,

\[
\Delta_I\Phi=O(1),
\]

whereas item 1 demands

\[
\Delta_I\Phi=\Omega(M)
\]

for unbounded \(M\).

Therefore there is a semantic dichotomy:

- If item 1 concerns a stock of debt, preloaded or unowned debt gives a trivial witness.
- If item 1 concerns fresh interval-local debt, arbitrary short intervals make the clause impossible whenever a large-excess state occurs.

The intended obligation must apply only to a **failed ticket of the prescribed duration**, not to every interval on which \(R>M/2\).

---

# 6. An exact nondegenerate repair

Here is a formulation that contains the missing information and really does imply \((\mathrm{AE}^{\dagger})\).

## Repaired global no-reuse statement \((\mathrm{GNR}^{\mathrm{cons}})\)

There exist

\[
H,\sigma,c,C_0,C_1,K_0,K_1,N
\]

and a function \(\eta(n)\to0\), with

\[
c>0,\qquad H(n)\to\infty,\qquad H(n)^6=o(n),
\]

together with a prefix-measurable unit-mass debt ledger, such that the following holds uniformly for every \(n\ge N\), every Prolonger strategy, and every prescribed post-baseline ticket start \(s\).

Let

\[
M=R(s)>0
\]

and

\[
T(M,n)=
\left\lceil
C_0M\frac{\log H}{H}+K_0\log n
\right\rceil.
\tag{18}
\]

Suppose \(R>M/2\) throughout the next \(T(M,n)\) Shortener turns. Let \(I\) be this entire failed ticket. Then there is a set \(\mathcal C_I\) of debt atoms, open at the end of \(I\), satisfying:

### A. Fresh lower bound

\[
\operatorname{mass}(\mathcal C_I)
 \ge
 cM-\eta(n)M-K_1\log n.
\tag{19}
\]

Only fresh unresolved debt counts. A permanent archive of earlier or already settled charges does not count.

### B. Source exhaustivity

Every atom in \(\mathcal C_I\) is either:

1. owned by a Prolonger move made during \(I\); or
2. carry-in/boundary debt.

The total carry-in/boundary mass is at most

\[
\eta(n)M+K_1\log n.
\tag{20}
\]

In particular, no clock debt, Shortener-created debt, unowned debt, or post-hoc debt can contribute to (19).

### C. Immutable lifetime ownership

Ownership is assigned at birth using only the history prefix then available, and can never be reassigned. For every Prolonger move \(p\),

\[
\sum_{\alpha:\operatorname{owner}(\alpha)=p}
w(\alpha)
\le C_1
\tag{21}
\]

over the entire future continuation, including all direct-ancestor refinements.

Splitting, relabelling, or refining an atom may not increase its total descendant mass.

### D. One-use settlement

If an atom’s represented excess is actually deleted or transferred to the minimal/exact-only bank, the atom is retired. A retired atom:

- cannot re-enter the open ledger;
- cannot occur in a later certificate;
- cannot be re-registered under another owner.

Every atom is settled at most once.

### E. Advance registration

The candidate excess cohort and all update rules are fixed from the common baseline and the ticket-start prefix. No cohort may be selected retrospectively after seeing which targets survived.

---

# 7. Why the repaired statement implies halving

Let \(P(I)\) be the number of Prolonger moves in \(I\). Since turns alternate,

\[
P(I)\le T(M,n)+1.
\tag{22}
\]

By source exhaustivity and the lifetime cap,

\[
\operatorname{mass}(\mathcal C_I)
\le
C_1P(I)+\eta(n)M+K_1\log n.
\tag{23}
\]

Combining (19), (22), and (23),

\[
cM-\eta M-K_1\log n
\le
C_1
\left(
C_0M\frac{\log H}{H}
+
K_0\log n
+
2
\right)
+
\eta M
+
K_1\log n.
\]

Hence

\[
cM
\le
C_0C_1M\frac{\log H}{H}
+
2\eta(n)M
+
O(\log n).
\tag{24}
\]

Because

\[
\frac{\log H}{H}\longrightarrow0
\qquad\text{and}\qquad
\eta(n)\longrightarrow0,
\]

for sufficiently large \(n\) the coefficient of \(M\) on the right of (24) is less than \(c/2\). Therefore a failed ticket would imply

\[
\frac c2M\le O(\log n),
\]

so

\[
M=O(\log n).
\tag{25}
\]

But the unconditional one-deletion-per-Shortener-turn argument halves such a ticket in \(O(\log n)\) turns. Increasing \(K_0\) absorbs this range.

Thus no failed ticket exists, and the repaired statement yields \((\mathrm{AE}^{\dagger})\).

This calculation shows exactly why source exhaustivity is indispensable.

---

# 8. Audit against the fifteen listed collapse families

The repaired formulation blocks the stated collapses as follows.

**Terminal delay and prelude delay.** The trapping baseline is prescribed, and the obligation occurs at the fixed timeout \(T(M,n)\); neither the baseline nor the certificate can be postponed until the game ends.

**Pre-freeze cap forcing.** \(H\), shell floors, the policy, and ledger update rule are fixed before the relevant trajectory is observed.

**Shell deferral.** The ticket is global and uses the full aggregate \(R\); there is no option to process only favorable shells.

**Zero weights.** The lower-bound constant \(c\) is positive, atoms have positive unit-normalized mass, and the certificate must contain \(cM-o(M)-O(\log n)\) actual mass.

**First-exit reassignment.** Ownership is immutable at birth; a debt atom cannot be handed to the move that later turns out to be convenient.

**Cost-only equivalence.** The lower bound concerns open represented excess mass, not an abstract repair cost that may be inflated without protecting targets.

**Micro-baseline compression.** All carry-in and baseline mass is explicitly bounded by \(\eta(n)M+K_1\log n\); linear ticket mass cannot be hidden there.

**Cap escape.** The obligation covers the full prescribed aggregate over all \(X\ge H^6\), with no exception when a degree or refinement parameter crosses an auxiliary cap.

**Epoch-boundary laundering.** Carry-in is bounded, ownership is immutable, and retired atoms cannot reappear in a new epoch.

**Uncharged scheduling delay.** Every Shortener turn in the ticket counts toward \(T(M,n)\); guard or maintenance turns cannot be omitted from the elapsed-time accounting.

**Post-hoc cohort selection.** The cohort and update rules are prefix-measurable and fixed before future survival information is known.

**Registration starvation.** The lower bound applies to a canonically registered ticket cohort of mass \(M\); the ledger cannot register only an \(o(M)\) favorable subfamily.

**Additive-floor chattering.** An atom can be born and settled only once, and shell floors are frozen. A unit crossing an excess floor repeatedly cannot manufacture repeated debt.

**Parameter-level vacuity.** The constants, error modulus, ticket duration, \(H^6=o(n)\), large-\(n\) threshold, and small-\(M\) treatment are all explicit and uniform.

The substantive unresolved clause in this repair is precisely (21): a direct-ancestor move must have bounded lifetime ownership even after every future refinement. The accepted frozen and atomic results do not establish that.

---

# Conclusion

The correct resolution of the stated problem is

\[
\boxed{
\begin{array}{c}
\text{Literal (GNR) has a trivial prefix-measurable unit-debt witness;}\\[1mm]
\text{therefore it is not a valid decisive reduction to }(\mathrm{AE}^{\dagger});\\[1mm]
\text{the intended theorem requires fresh-debt conservation,}\\
\text{interval duration, immutable ownership, and one-use settlement.}
\end{array}
}
\]

The clock-debt or repeated excess-registration potential proves the literal clauses while assigning zero debt to every Prolonger move. Hence the number of Prolonger moves in a ticket is irrelevant.

This does **not** disprove \((\mathrm{AE}^{\dagger})\), does **not** disprove \(L(n)=o(n)\), and does **not** show that every genuinely source-conservative chronological potential must fail. It shows that the stated (GNR) is underconstrained and that its claimed decisiveness relies on the unstated conservation inequality (16).
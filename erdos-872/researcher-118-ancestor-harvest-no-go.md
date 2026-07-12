---
id: R118-ancestor-harvest-no-go
type: research
date: 2026-07-12
intent: >
  Repair the baseline-frozen ancestor-harvest statement to survive the
  eighth-witness audit (all eight collapse families plus a ninth-witness
  search), then prove or disprove it — or prove a formulation no-go
  theorem for the family.
predecessors: [R115-baseline-frozen-ancestor-harvest, R117-bfah-eighth-witness]
action:
  kind: extends
  target: R117-bfah-eighth-witness
claim: >
  Claimed formulation no-go for the ancestor-harvest family. The
  repaired canonical statement is constructed in full (pre-registered
  master ledger across epochs, global budgets for every clock and error,
  frozen reservoir mass forced to dominate H, epoch machinery without
  laundering) and proved nondegenerate against TEN collapse families —
  the eight known ones plus two newly discovered: cap escape (an epoch
  reaches degree cap <= H with a linear reservoir and essentially no
  ancestor loss, so an ancestor inequality says nothing while the shell
  need not halve in budget) and epoch-boundary laundering (setup in one
  epoch finances a large direct-ancestor jump after rebasing). The
  repaired statement is then claimed FALSE: at an obtainable primorial-
  batched trapped position with top-shell reservoir >= cn and monotone
  cap <= H_0(n) -> infinity slowly, bounded erosion (each lower move
  removes at most H_0 targets) makes the required processing budget
  unattainable — the capped-state clause cannot be satisfied. Verdict:
  no baseline-independent, ancestor-harvest-only separator of this
  family exists; restricting to capped states reached by the proposed
  policy re-inserts the missing capped-state part of the online-area
  statement into the theorem itself. The sublinear route must directly
  handle capped linear reservoirs (prevent or rapidly clear them),
  not treat cap attainment as a harmless stopping event.
implications:
  - If the no-go survives audit, the upper route's target moves from
    ancestor-harvest inequalities to capped-reservoir handling — the
    same object the promoted lower-side refutation manipulates, and the
    compression-persistence question already under attack.
  - CURATOR FLAG for audit: the disproof requires an OBTAINABLE
    linear-reservoir fortress at slowly growing cap, while the promoted
    fixed-cap refutation shows Shortener can PREVENT such entry at any
    cap o(r(n)); whether the quantifier order (existential policy vs
    forced entry) reconciles these is the primary verification target.
verifiers_at_time: []
confidence_at_time: low
strategy_dependence: independent
prompt: erdos-872/prompts/researcher-R118-repaired-ancestor-harvest.md
---

# Verdict

The previous one-baseline statement cannot be repaired merely by adding the condition \(|\widehat Q_X|/H\to\infty\) and replacing the global time \(t\) by epoch-local clocks. Two further defects appear:

1. **Epoch-boundary laundering:** setup performed in one epoch can finance a large direct-ancestor jump immediately after rebasing unless all epoch ledgers are pre-registered in one master ledger and every clock/error has a global budget.
2. **Cap escape:** an epoch may reach \(D_X\le H\) with a linear reservoir and essentially no ancestor loss. An ancestor inequality then says nothing, while the shell need not halve within the required processing budget.

The second defect is decisive. The strongest baseline-complete repair is false by the accepted primorial-fortress construction. Restricting the repair to only those capped states reached by the proposed policy avoids the counterexample only by inserting the missing capped-state part of (OA) into the theorem itself. Thus there is no baseline-independent, ancestor-harvest-only separator of this family.

I treat the previous formulation and its audit as the supplied record. 

---

# Part I. The repaired canonical statement

## 1. Fixed outer data and parameter order

For each \(n\), let

\[
\mathcal X_n=\left\{\frac{n}{2^j}:0\le j\le \left\lfloor\log_2\frac n2\right\rfloor\right\},
\qquad
S_X=(X/2,X]\cap\mathbb Z.
\]

These shells are pairwise disjoint.

Fix, **outside every existential quantifier below**, a data sequence

\[
\mathbf K^\star=(\mathbf K^\star_n)_{n\ge2}.
\]

For each \(n\), the datum \(\mathbf K^\star_n\) consists of actual total functions on finite legal histories:

\[
\mathbf K^\star_n=
\bigl(
\mathcal B_n,\,
\Omega,\pi,w,\,
(I_c)_{c\in\mathcal C},\prec,\,
\operatorname{Sched},\rho
\bigr).
\]

Here:

- \(\mathcal B_n\) is the fixed set of admissible post-trapping baseline positions. It is not chosen by the eventual Shortener policy.
- \(\Omega,\pi,w\) are the canonical master-ledger maps described below.
- \(\mathcal C\) is a finite channel set containing a distinguished channel \(\mathrm{anc}\).
- Each
  \[
  I_c(A,X,\omega,\mathfrak h)\in\{0,1\}
  \]
  is a fixed Boolean function of the baseline, shell, ledger atom and current history extension.
- \(\prec\) is a fixed total order on \(\mathcal C\), used to resolve simultaneous channel events.
- \(\operatorname{Sched}\) is the fixed shell/epoch scheduling map.
- \(\rho\) is the fixed relevance map used to define charged clocks.

Thus expressions such as “required lift,” “represented payload,” “ordinary failure” and “first prescribed endpoint” do not occur in the theorem as prose predicates. They have already been replaced by components of \(\mathbf K^\star\).

For concreteness, a smooth/rough trapping predicate can be written mathematically. With \(y=\frac14\log n\), define

\[
m_{\mathrm{sm}}
=
\prod_{\substack{p^a\parallel m\\p\le y}}p^a,
\qquad
m_{\mathrm{rf}}=\frac{m}{m_{\mathrm{sm}}},
\]

and

\[
\operatorname{Trap}_n(A)
\iff
\forall m\in\mathcal L(A)\ 
\exists a_{\mathrm{sm}},a_{\mathrm{rf}}\in A:
m_{\mathrm{sm}}\mid a_{\mathrm{sm}}
\ \text{and}\
m_{\mathrm{rf}}\mid a_{\mathrm{rf}}.
\]

A baseline-complete datum has

\[
\{A:\ A\text{ primitive},\ |A|\le \eta_n n,\ 
\operatorname{Trap}_n(A)\}
\subseteq \mathcal B_n
\]

for some fixed \(\eta_n\to0\), and includes the accepted primorial-batched trapped positions.

Now fix \(\delta>0\) and put

\[
\mathfrak T(n)=\max_{m\le n}\tau(m),
\qquad
H=\mathfrak T(n)^{1+\delta},
\qquad
r=\left\lfloor(\log H)^{1/3}\right\rfloor,
\qquad
h=H^2.
\]

The quantitative hierarchy is required to be

\[
\varepsilon_\delta(H)H^4\log H\longrightarrow0,
\tag{H1}
\]

\[
\beta_\delta(n)\longrightarrow0,
\tag{H2}
\]

and

\[
\frac{H\log h}{h}
=
\frac{2\log H}{H}
\longrightarrow0.
\tag{H3}
\]

Also \(H=n^{o(1)}\), so

\[
H^6=o(n).
\tag{H4}
\]

The residual-channel coefficient remains valid:

\[
\frac{2^r\mathfrak T(n)}{H/\log H}
=
H^{-\delta/(1+\delta)+o(1)}\log H
=o(1).
\tag{H5}
\]

The exact quantifier prefix is

\[
\boxed{
\mathbf K^\star\text{ fixed};\
\exists C_0>0\
\forall\delta>0\
\exists K_\delta>0,\varepsilon_\delta,\beta_\delta,N_\delta,
\{\Sigma_{n,\delta}\}_{n\ge N_\delta}\
\forall n\ge N_\delta\
\forall A\in\mathcal B_n\
\forall\Pi.
}
\tag{Q}
\]

Here \(C_0\) is independent of \(\delta\), while \(K_\delta,\varepsilon_\delta,\beta_\delta\) and the strategy may depend on \(\delta\). The maps in \(\mathbf K^\star\) do not.

---

## 2. The pre-registered master ledger

Fix a baseline \(A\in\mathcal B_n\), a continuation generated by Shortener’s \(\Sigma_{n,\delta}\) against Prolonger’s strategy \(\Pi\), and a shell \(S_X\).

Write

\[
Q_X^t=Q_X(A_t)\cap Q_X(A).
\]

For every epoch \(j\), the fixed ledger supplies a finite atom set

\[
\Omega_{X,j}(A),
\]

a target map

\[
\pi_{X,j}:\Omega_{X,j}(A)\to Q_X^{s_{X,j}},
\]

and positive weights \(w_{X,j}(\omega)>0\) satisfying

\[
\sum_{\substack{\omega\in\Omega_{X,j}(A)\\
\pi_{X,j}(\omega)=u}}
w_{X,j}(\omega)=1
\qquad
(u\in Q_X^{s_{X,j}}).
\tag{L1}
\]

Consequently

\[
\sum_{\omega\in\Omega_{X,j}(A)}
w_{X,j}(\omega)
=
|Q_X^{s_{X,j}}|.
\tag{L2}
\]

All epoch atoms are pre-registered at the original baseline. They are pairwise disjoint as labelled objects:

\[
\Omega_{X,j}\cap\Omega_{X,k}=\varnothing
\qquad(j\ne k).
\tag{L3}
\]

The total exposure of one baseline target is bounded by the maximum possible number of halving epochs:

\[
\sum_j
\sum_{\substack{\omega\in\Omega_{X,j}\\\pi_{X,j}(\omega)=u}}
w_{X,j}(\omega)
\le
J_H,
\qquad
J_H:=2\lceil\log_2 h\rceil+3.
\tag{L4}
\]

Thus rebasing cannot repeatedly create unlimited new unit mass.

For \(\omega\in\Omega_{X,j}\), define

\[
\xi(\omega)
=
\min\left\{
t\ge s_{X,j}:
\max_{c\in\mathcal C}
I_c(A,X,\omega,\mathfrak h_t)=1
\right\},
\]

with \(\xi(\omega)=\infty\) if the set is empty. At time \(\xi(\omega)<\infty\), define

\[
\chi(\omega)
=
\min_{\prec}
\left\{
c\in\mathcal C:
I_c(A,X,\omega,\mathfrak h_{\xi(\omega)})=1
\right\}.
\tag{L5}
\]

This is a disjoint, immutable first-exit assignment.

The direct-ancestor mass accumulated in epoch \(j\) by time \(t\) is

\[
\operatorname{Anc}_{X,j}(t)
=
\sum_{\substack{\omega\in\Omega_{X,j}\\
s_{X,j}<\xi(\omega)\le t\\
\chi(\omega)=\mathrm{anc}}}
w_{X,j}(\omega).
\tag{L6}
\]

---

## 3. Epochs, area and charged clocks

Let

\[
m_{X,j}=|Q_X^{s_{X,j}}|.
\]

A shell epoch is audited only when

\[
X\ge H^6
\qquad\text{and}\qquad
m_{X,j}>\frac{X}{h^2}=\frac{X}{H^4}.
\tag{A1}
\]

Then automatically

\[
\frac{m_{X,j}}H
>
\frac{X}{H^5}
\ge H.
\tag{A2}
\]

Thus every audited reservoir exceeds \(H\) by the explicit factor \(H\).

Define the actual favorable area in the epoch by

\[
\mathsf A_{X,j}(t)
=
|Q_X^{s_{X,j}}\setminus Q_X^t|.
\tag{A3}
\]

The fixed relevance map gives

\[
\rho_{X,j,i}
=
\rho(A,X,j,\mathfrak h_{i-1},z_i)
\in\{0,1\},
\]

where \(z_i\) is the move made at time \(i\). The charged clock is

\[
\ell_{X,j}(t)
=
\sum_{i=s_{X,j}+1}^{t}\rho_{X,j,i}.
\tag{A4}
\]

Unrelated elapsed time gives no credit. Every move used by the canonical residual, ancestor or repair accounting must have \(\rho_{X,j,i}=1\).

A high-degree epoch begins with

\[
D_X(s_{X,j})>H
\]

and ends at

\[
\tau_{X,j}
=
\min\left\{
t>s_{X,j}:
D_X(t)\le H
\ \text{or}\
|Q_X^t|
\le
\frac12m_{X,j}+\frac{X}{h^2}
\right\}.
\tag{A5}
\]

The estimate includes \(t=\tau_{X,j}\).

---

## 4. The repaired multi-epoch harvest inequality

The ancestor component is

\[
\boxed{
\operatorname{Anc}_{X,j}(t)
\le
\varepsilon_\delta(H)X
+
C_0\,\mathsf A_{X,j}(t)
+
C_0H\,\ell_{X,j}(t)
}
\tag{ME-AH}
\]

for every audited high-degree epoch and every integer

\[
s_{X,j}\le t\le\tau_{X,j}.
\]

The local and global clock requirements are

\[
\ell_{X,j}(\tau_{X,j})
\le
K_\delta
m_{X,j}\frac{\log h}{h},
\tag{B1}
\]

and

\[
H
\sum_{X,j}
\ell_{X,j}(\tau_{X,j})
\le
\beta_\delta(n)n.
\tag{B2}
\]

The first estimate makes the clock cost a vanishing fraction of the current epoch mass:

\[
\frac{H\ell_{X,j}(\tau_{X,j})}{m_{X,j}}
\le
K_\delta\frac{H\log h}{h}
=
O_\delta\!\left(\frac{\log H}{H}\right)
=o(1).
\tag{B3}
\]

The second prevents the same actual moves from creating unlimited credit in many ledgers.

Because epoch ledgers are pre-registered and satisfy (L3)–(L4), all ancestor exits from previous epochs remain in the master accounting. They are not erased by rebasing.

---

## 5. The missing capped-mode clause

The previous formulation stopped when \(D_X\le H\). That is insufficient.

For every time \(s\) at which

\[
X\ge H^6,\qquad
q:=|Q_X^s|>\frac{X}{h^2},
\qquad
D_X(s)\le H,
\tag{C1}
\]

Shortener must immediately enter an exclusive capped block for shell \(X\). Put

\[
B_\delta(q)
=
\left\lceil
K_\delta q\frac{\log h}{h}
\right\rceil.
\tag{C2}
\]

During the next \(B_\delta(q)\) Shortener turns, every Shortener move is assigned to this block. Hence there are at most \(2B_\delta(q)+1\) actual moves before the block ends.

The required capped-mode conclusion is

\[
\boxed{
|Q_X^{\mathrm{end}}|
\le
\frac12q+\frac{X}{h^2}.
}
\tag{CAP}
\]

This clause also applies when the baseline itself already satisfies \(D_X(0)\le H\).

---

## 6. The canonical repaired assertion

The repaired statement is the conjunction

\[
\boxed{
\mathrm{RMEAH}^{\sharp}(\mathbf K^\star)
:=
(\mathrm{ME\!-\!AH})+(\mathrm{B1})+(\mathrm{B2})+(\mathrm{CAP})
}
\]

with quantifiers (Q), exact ledgers (L1)–(L5), activity rule (A1), and hierarchy (H1)–(H5).

This is the minimal baseline-complete repair of the previous proposal. Omitting \((\mathrm{CAP})\) restores the cap-escape collapse proved below.

---

# Part II. Nondegeneracy

## 1. Terminal delay

An audited epoch has

\[
m_{X,j}>X/h^2>0.
\]

It therefore cannot start at a terminal position. If the game terminated during the externally fixed trapping stage, it ended after \(o(n)\) moves and is genuinely harmless.

After the baseline, the ledger already exists. Waiting until terminal does not create a new empty ledger: target deaths and transfers contribute to \(\mathsf A_{X,j}\), and ancestor exits remain in their original epoch atoms.

---

## 2. Prelude delay

The baseline \(A\) is universally quantified in \(\mathcal B_n\). Shortener receives \(A\) as input and begins immediately.

There is no existential “first endpoint” that Shortener may move. The fixed external datum \(\mathbf K^\star\) is outside the quantifier prefix (Q).

---

## 3. Cap forcing before the freeze

A baseline satisfying

\[
D_X(0)\le H,\qquad |Q_X^0|>X/h^2
\]

is not excluded. It immediately triggers \((\mathrm{CAP})\).

Thus a preprocessing sweep cannot make the ancestor theorem empty merely by crossing the cap.

---

## 4. Shell deferral and global-time credit

The right side contains no raw term \(CHt\). It contains the charged clock

\[
CH\ell_{X,j}(t).
\]

An unrelated move has \(\rho_{X,j,i}=0\), hence contributes no credit. Relevant moves may be charged, but (B2) prevents repeated global counting.

In particular, delaying a linear shell for \(q/H\) charged moves would itself consume order \(q\) of the global budget and cannot be hidden inside an \(o(n)\) allowance.

---

## 5. Zero weights and omitted mass

Equations (L1)–(L2) imply exact unit normalization on every live target. All weights are positive.

One cannot choose a preferred subfamily of faces or give inconvenient targets zero mass.

---

## 6. First-exit reassignment

The channel is the lexicographically first true Boolean predicate at the first exit time, as defined by (L5).

A later residual death, target death, boundary event or minimal transfer cannot change an earlier \(\mathrm{anc}\) assignment.

---

## 7. Collapse to the cost-only statement

The assertion is uniform over every \(A\in\mathcal B_n\), not merely the terminal node reached by an optimal Shortener policy.

Moreover, (ME-AH) is tested at every prefix of every audited epoch. Ending the game eventually does not establish the early-prefix inequalities.

---

## 8. Micro-baseline compression

Suppose a preprocessing rule reduces every uncapped shell to \(O(H)\) targets.

For \(X\ge H^6\),

\[
O(H)<\frac{X}{H^4}=\frac{X}{h^2}
\]

for all large \(n\). Such a shell is placed in the dust class.

Because the shells are disjoint and

\[
\sum_{X\in\mathcal X_n}X<2n,
\]

the total large-shell dust is at most

\[
\sum_X\frac{X}{h^2}
<
\frac{2n}{H^4}
=o(n).
\tag{D1}
\]

All shells with \(X<H^6\) together contain only

\[
O(H^6)=o(n)
\tag{D2}
\]

integers.

Therefore compressing every shell below the activity threshold is genuine global progress: only \(o(n)\) target mass remains. If instead the sweep leaves a large shell with \(D_X\le H\), it triggers \((\mathrm{CAP})\).

The eighth collapse is therefore excluded.

---

## 9. New collapse: cap escape

The old stopping rule regarded \(D_X\le H\) as an acceptable endpoint even if the shell retained linear mass.

At such an endpoint one can have

\[
\operatorname{Anc}_{X,j}=0,
\qquad
\mathsf A_{X,j}=0,
\]

so every ancestor inequality holds, but no shell contraction has occurred.

Clause \((\mathrm{CAP})\) is precisely the repair.

---

## 10. New collapse: epoch-boundary laundering

Without (L3)–(L4), one could perform setup during epoch \(j\), rebase after an unrelated halving, and let a single move at the beginning of epoch \(j+1\) erase a large new face ledger. All setup costs would lie in the old epoch while the ancestor loss would lie in the new one.

Here every epoch atom is pre-registered, every atom has one first exit, and the cumulative exposure of one target is at most \(J_H=O(\log h)\). No previous exit is deleted when the epoch number changes.

The rate condition

\[
\varepsilon(H)h^2\log h\to0
\]

is exactly (H1), so even the \(O(\log h)\) repetition allowed by (L4) cannot inflate the error beyond \(X/h^2\).

---

# Part III. Why the repaired statement would imply \(L(n)=o(n)\)

For a high-degree epoch, the accepted residual estimate gives

\[
|\mathcal E_{\mathrm{res}}|
\le
o(1)\,\ell_{X,j},
\]

and capped face weights contribute only \(o(H\ell_{X,j})\). The ordinary, boundary, high-lcm, overlap, guard and exact/minimal channels are already covered by the accepted reductions.

Combining them with (ME-AH) gives, on the epoch,

\[
\operatorname{Repair}_{X,j}
\le
o(m_{X,j})
+
C_0\mathsf A_{X,j}
+
O(H\ell_{X,j})
+
\varepsilon(H)X.
\]

By (B3),

\[
H\ell_{X,j}=o(m_{X,j}).
\]

Since an audited epoch satisfies \(m_{X,j}\ge X/h^2\), condition (H1) gives

\[
\varepsilon(H)X=o(m_{X,j}/\log h).
\]

The accepted advance-depletion reduction therefore yields one of two events:

\[
|Q_X^{\tau_{X,j}}|
\le
\frac12m_{X,j}+\frac{X}{h^2},
\]

or

\[
D_X(\tau_{X,j})\le H.
\]

In the second case, \((\mathrm{CAP})\) gives the same contraction after at most one additional capped block.

Hence every completed macro-epoch satisfies

\[
m_{X,j+1}
\le
\frac12m_{X,j}+\frac{X}{h^2}.
\tag{R1}
\]

After \(O(\log h)\) epochs,

\[
m_{X,j}=O(X/h^2).
\]

Moreover,

\[
\sum_j m_{X,j}=O(X),
\]

so the number of Shortener service turns in shell \(X\) is

\[
O\!\left(
\frac{\log h}{h}\sum_jm_{X,j}
\right)
=
O\!\left(\frac{X\log h}{h}\right).
\]

Summing over the disjoint shells gives

\[
O\!\left(\frac{n\log h}{h}\right)=o(n).
\]

The small shells contribute \(O(H^6)=o(n)\), and the final dust contributes \(O(n/h^2)=o(n)\). Adding the \(o(n)\)-move trapping stage, the position has size \(o(n)\); the accepted static-completion theorem supplies an \(o(n)\)-sized maximal completion.

Therefore

\[
\mathrm{RMEAH}^{\sharp}(\mathbf K^\star)
\Longrightarrow
L(n)=o(n).
\]

The implication is now valid: it uses genuinely repeatable ledgers, a summable clock and an explicit capped-state branch.

---

# Part IV. Disproof of the repaired statement

The obstruction is the accepted primorial-batched fortress.

## 1. The fortress baseline

Choose a slowly growing function \(H_0(n)\to\infty\) with

\[
H_0(n)\le H(n).
\]

By the stipulated primorial-batching construction, for infinitely many \(n\) there is an obtainable trapped position \(A_n^\star\) with a top-shell reservoir

\[
Q_n^\star\subseteq(n/2,n]
\]

such that

\[
q_n:=|Q_n^\star|\ge c n
\tag{F1}
\]

for some fixed \(c>0\),

\[
\Delta_{Q_n^\star}(A_n^\star)\le H_0(n),
\tag{F2}
\]

and the number of exact-only targets present or previously created is \(o(n)\).

The fortress property says that the degree cap is monotone along every continuation.

Take \(X=n\). Since \(h\to\infty\),

\[
q_n>\frac{n}{h^2}
\]

for all sufficiently large \(n\). Also

\[
D_n(0)\le H_0\le H.
\]

Thus \((\mathrm{CAP})\) applies immediately.

---

## 2. How quickly can \(Q_n^\star\) shrink?

Consider any continuation of \(T\) actual moves.

A member of \(Q_n^\star\) can leave the live nonminimal population in three relevant ways.

### Direct illegality from a lower move

Every legal lower move divides at most \(H_0\) current fortress targets, because the cap is monotone. Thus at most

\[
H_0T
\]

targets leave by this mechanism.

### The target itself is selected

Distinct integers in \((n/2,n]\) are incomparable under divisibility. Hence an upper move removes at most the selected target from \(Q_n^\star\). There are at most \(T\) such losses.

### Transfer into the minimal legal set

For an upper-half target, becoming minimal while still legal means becoming exact-only: it has no other upper-half comparable and no legal proper divisor.

The accepted exact-only bank says that along a play of \(t\) actual moves, the number of targets that ever become exact-only is

\[
e_n+t,
\qquad e_n=o(n).
\]

The history reaching \(A_n^\star\) has \(o(n)\) moves, so during the next \(T\) moves the number of such transfers is at most

\[
o(n)+T.
\]

Combining these bounds,

\[
q_n-|Q_n^T|
\le
H_0T+2T+o(n).
\tag{F3}
\]

This estimate holds for every pair of continuation strategies.

---

## 3. The capped processing budget is too short

The repaired statement allows

\[
B_\delta(q_n)
=
\left\lceil
K_\delta q_n\frac{\log h}{h}
\right\rceil
\]

Shortener turns, hence at most

\[
T_n:=2B_\delta(q_n)+1
=
O_\delta\!\left(n\frac{\log h}{h}\right)
=
O_\delta\!\left(n\frac{\log H}{H^2}\right)
\tag{F4}
\]

actual moves.

Since \(H_0\le H\),

\[
\frac{H_0T_n}{n}
=
O_\delta\!\left(
\frac{H_0\log H}{H^2}
\right)
\le
O_\delta\!\left(
\frac{\log H}{H}
\right)
=o(1).
\tag{F5}
\]

Also \(T_n=o(n)\). Substituting into (F3),

\[
q_n-|Q_n^{T_n}|=o(n).
\]

Using \(q_n\ge cn\),

\[
|Q_n^{T_n}|=q_n-o(n).
\tag{F6}
\]

But \((\mathrm{CAP})\) requires

\[
|Q_n^{T_n}|
\le
\frac12q_n+\frac{n}{h^2}.
\]

The right side equals

\[
\frac12q_n+o(n),
\]

whereas (F6) is \(q_n-o(n)\). For sufficiently large \(n\),

\[
q_n-o(n)>
\frac12q_n+\frac{n}{h^2}.
\]

This is a contradiction.

Therefore

\[
\boxed{
\mathrm{RMEAH}^{\sharp}(\mathbf K^\star)
\text{ is false for every baseline-complete }\mathbf K^\star.
}
\]

The contradiction is independent of the proposed Shortener policy: no continuation can shrink the fortress top-shell population by one half in the prescribed capped-block budget.

---

# Part V. The formulation no-go theorem

The preceding disproof yields a precise trichotomy.

## Theorem

Consider a proposed baseline-frozen or epoch-frozen ancestor-harvest statement using the threshold \(H\), intended to imply (OA).

Exactly one of the following occurs.

### Case 1: Large capped states are exempt

The statement stops when \(D_X\le H\), with no separate conclusion about the surviving reservoir.

Then it does **not** imply (OA). A capped primorial fortress may have

\[
\operatorname{Anc}=0
\]

and satisfy every ancestor inequality while keeping a linear shell population for much longer than the claimed block budget.

### Case 2: Large capped states are audited uniformly over all admissible baselines

Then the assertion is false by the fortress proof above.

### Case 3: Large capped states are audited only when reached by the same existential Shortener policy

Then the statement must assert, for every reached capped block,

\[
|Q_X(\mathrm{end})|
\le
\frac12|Q_X(\mathrm{start})|
+
\frac{X}{h^2}
\]

within the required shell budget.

For high-degree blocks, the ancestor inequality plus the accepted reductions is supposed to give precisely the same conclusion. Therefore, after projecting away the ledger variables, the full trajectory-restricted statement already contains

\[
|Q_X(\mathrm{end})|
\le
\frac12|Q_X(\mathrm{start})|
+
\frac{X}{h^2}
\]

for every processing block. That projection is (OA).

Hence the trajectory-restricted repair is not a proper intermediate ancestor theorem; it contains the desired shell contraction as one of its policy-specific clauses.

This proves:

\[
\boxed{
\begin{minipage}{0.88\linewidth}
There is no baseline-complete, ancestor-harvest-only statement of the
stop-at-cap family that is both nondegenerate and sufficient for
\(L(n)=o(n)\).

Omitting capped-state control makes the implication invalid. Requiring
robust capped-state control makes the assertion false. Restricting
capped-state control to the chosen policy inserts the missing (OA)
branch into the statement itself.
\end{minipage}
}
\]

---

# Final conclusion

The eighth audit repair, \(|Q|/H\to\infty\), is necessary but not sufficient. The genuinely closed formulation also needs:

\[
\text{pre-registered epoch ledgers},
\]

\[
\text{a globally summable relevance clock},
\]

\[
\varepsilon(H)h^2\log h\to0,
\]

and

\[
\text{an explicit theorem for large capped reservoirs}.
\]

After including all of those, the baseline-complete assertion is refuted by a primorial-batched fortress. Over the allowed capped-block duration, direct deaths contribute \(o(n)\), exact selections contribute \(o(n)\), and transfers contribute only \(o(n)\) by the exact-only bank, so a linear top-shell reservoir cannot halve.

Thus the formulation loop resolves as follows:

\[
\boxed{
\text{The robust repaired statement is false.}
}
\]

\[
\boxed{
\text{A policy-trajectory repair is no longer an intermediate
ancestor-harvest theorem; it contains the capped branch of (OA).}
}
\]

This disproves the claimed existence of a canonical ancestor-harvest separator of the advertised family. It does not, by itself, decide whether \(L(n)=o(n)\); any successful sublinear proof must add a new policy-specific theorem preventing or rapidly clearing large capped reservoirs, rather than treating cap attainment as a harmless stopping event.
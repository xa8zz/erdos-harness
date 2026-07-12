Don't search the internet. You are an adversarial referee. Document I below constructs a repaired game-theoretic statement, proves it nondegenerate against ten collapse families, and then claims to DISPROVE it (its Part IV), concluding a formulation no-go theorem for its statement family. Document II is a separate, independently double-verified theorem about the same game. Your job: adjudicate Document I. Verdicts (VALID / REPAIRABLE / REFUTED) on:

A. Part I-II: is the repaired statement well-formed and genuinely nondegenerate (including the two new collapse families, cap escape and epoch-boundary laundering)? Hunt for an eleventh witness.
B. Part IV (the decisive item): the disproof rests on an "obtainable" primorial-batched trapped position with top-shell reservoir >= cn and monotone degree cap <= H_0(n) -> infinity slowly. Document II proves Shortener has a strategy PREVENTING any such position (reservoir >= cn at cap H(n) = o(r(n))) from ever appearing, for every fixed density. The repaired statement in Document I quantifies EXISTENTIALLY over Shortener policies. Resolve the quantifier question precisely: does Part IV's counterexample position remain obtainable against a policy that incorporates Document II's clearing sweep? If not, does the disproof survive — e.g. because the statement's own clauses (capped-state obligations, budgets, scheduling) prevent the policy from running that sweep — or does the no-go claim fail? This is the primary check; be exact about who moves, what the policy commits to, and which positions are reachable against it.
C. The concluding no-go inference ("no baseline-independent, ancestor-harvest-only separator of this family"): even granting Parts I-II and IV, does the conclusion follow for the whole FAMILY, or only for the specific repaired statement?

## The game

For \(n\ge2\), two players alternately choose previously unchosen integers from \(\{2,\ldots,n\}\), always keeping the chosen set an antichain under divisibility. The game ends when the set is maximal. Prolonger moves first and maximizes total moves; Shortener minimizes; \(L(n)\) is the optimal length. "Legal" at \(A\) = unchosen and incomparable with every member of \(A\). Document I's stipulated reductions (residual channel, prime guard, canonical cubes/faces, online-area pipeline, primorial batching) may be taken as given inputs.

## Document I (verbatim)

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

## Document II (verbatim; independently double-verified — treat its theorem as established)

# Verdict

\[
\boxed{\text{Statement (F) is false.}}
\]

In fact, a stronger statement holds:

> For every fixed \(H_0<\infty\) and every fixed \(c>0\), Shortener has a strategy which, for all sufficiently large \(n\), prevents the appearance at any time of an \(H_0\)-capped trapped upper reservoir of size at least \(cn\).

The proof uses only the supplied degree-availability theorem, monotonicity of legality, and the fact that the fortress reservoir lies in the live upper set \(R(A)\subseteq (n/2,n]\). 

The key incompatibility is:

1. Shortener can reduce the **entire** live upper set below any fixed positive density in \(o(n)\) actual moves.
2. Once a fixed-cap upper reservoir of linear size exists, only \(O(1)\) of its members can disappear per subsequent move.

Thus such a reservoir cannot appear either before or after Shortener’s density-clearing sweep.

---

## 1. A fixed-density clearing lemma

Let \(r(n)\to\infty\) be the function in the degree-availability statement.

### Lemma 1

For every fixed \(\eta>0\), Shortener has a strategy under which, after \(o(n)\) actual moves, either the game has ended or

\[
|R(A)|<\eta n.
\]

### Proof

Fix \(\eta>0\). Put \(r_n=r(n)\), and define

\[
M_n=\left\lfloor \frac{n}{\sqrt{r_n}}\right\rfloor.
\]

Since \(M_n=o(n)\), the degree-availability theorem implies that, uniformly over all positions satisfying

\[
|A|\le M_n,
\qquad
|R(A)|\ge \eta n,
\]

we have, for all sufficiently large \(n\),

\[
\Delta(A)\ge \eta r_n.
\tag{1}
\]

Here is the standard justification for the uniformity in (1). If it failed, then for infinitely many \(n\) one could choose a position \(A_n\) with

\[
|A_n|\le M_n=o(n),\qquad |R(A_n)|\ge\eta n,
\qquad \Delta(A_n)<\eta r_n.
\]

But the supplied degree theorem, applied to this sequence, gives

\[
\Delta(A_n)\ge (2\eta-o(1))r_n>\eta r_n,
\]

a contradiction.

Shortener now follows this policy:

> While \(|R(A)|\ge\eta n\), choose a legal lower integer of maximum degree.

By (1), provided the total number of moves is at most \(M_n\), each such Shortener move removes at least \(\eta r_n\) currently live upper integers.

Set

\[
K_n
=
\left\lceil
\frac{|U_n|-\eta n}{\eta r_n}
\right\rceil+1.
\]

Since \(|U_n|\le n/2+1\),

\[
K_n=O_\eta\!\left(\frac{n}{r_n}\right)=o(n).
\]

Before Shortener has made \(K_n\) moves, the total number of actual moves is at most

\[
2K_n+1=O_\eta\!\left(\frac{n}{r_n}\right).
\]

Because \(r_n\to\infty\),

\[
2K_n+1
=
o\!\left(\frac{n}{\sqrt{r_n}}\right)
=o(M_n),
\]

so in particular \(2K_n+1\le M_n\) for all sufficiently large \(n\). Thus the degree guarantee (1) remains valid throughout the proposed sweep.

If \(|R(A)|\ge\eta n\) held at all of Shortener’s first \(K_n\) turns, those turns would remove at least

\[
K_n\eta r_n>|U_n|-\eta n
\]

distinct currently live upper targets. Prolonger’s intervening moves cannot increase \(R(A)\). Hence after those turns,

\[
|R(A)|<\eta n.
\]

Therefore the threshold is crossed after at most

\[
N_\eta(n):=2K_n+1
=
O_\eta\!\left(\frac{n}{r(n)}\right)
=o(n)
\tag{2}
\]

actual moves. ∎

---

## 2. A capped upper reservoir erodes only at bounded speed

The next observation is purely deterministic. It does not need the full absorbing-fortress theorem.

### Lemma 2

Suppose that at a position \(A_0\) there is a set

\[
Q_0\subseteq R(A_0)\subseteq U_n
\]

such that

\[
\max_{d\in D(A_0)}
\#\{q\in Q_0:d\mid q\}\le H.
\tag{3}
\]

Then after any \(m\) subsequent actual moves, at least

\[
|Q_0|-\max\{H,1\}m
\tag{4}
\]

members of \(Q_0\) are still legal.

The same conclusion holds for a fortress reservoir \(E_0\sqcup Q_0\), where \(E_0\) is the exact-only bank and (3) holds for \(Q_0\).

### Proof

Track the members of the entry reservoir that cease to be legal. Charge each such target \(q\) to the first subsequently played integer \(x\) comparable with \(q\).

Legality is monotone: an integer legal at a later time was also legal at \(A_0\).

Consider one subsequently played move \(x\).

#### Case 1: \(x\in U_n\)

Distinct integers in \(U_n=(n/2,n]\) are incomparable under divisibility. Indeed, if \(u<v\) and \(u\mid v\), then \(v\ge2u>n\), impossible.

Thus an upper move can remove at most one member of the entry reservoir, namely itself.

#### Case 2: \(x\in L_n\)

If \(x\) removes \(q\in Q_0\), then \(x\mid q\). Since \(x\) is legal when played, it was legal at \(A_0\). Therefore \(x\in D(A_0)\), and (3) shows that it divides at most \(H\) members of \(Q_0\).

If \(e\in E_0\) is exact-only at \(A_0\), no legal proper divisor of \(e\) exists at \(A_0\). Hence no later legal lower move can remove \(e\); it can disappear only by being selected itself.

Consequently every actual move is charged by at most

\[
h:=\max\{H,1\}
\]

entry-reservoir targets. After \(m\) moves, at most \(hm\) have disappeared, proving (4). ∎

This lemma also explains directly why the fixed-cap condition is so restrictive: a linear upper reservoir cannot be destroyed in \(o(n)\) moves once \(H\) is fixed.

---

## 3. Shortener’s counterstrategy to (F)

Fix arbitrary constants

\[
H_0<\infty,\qquad c>0.
\]

If \(c>1/2+o(1)\), the claimed reservoir is impossible simply because \(|U_n|\le n/2+1\). So assume \(0<c\le1/2\).

Set

\[
\eta=\frac c4.
\]

Shortener uses the strategy from Lemma 1. Let \(\sigma\) be the first time at which

\[
|R(A_\sigma)|<\eta n=\frac c4n,
\]

or the time the game ends. By Lemma 1,

\[
\sigma\le N_\eta(n)=o(n)
\tag{5}
\]

in terms of the number of actual moves.

Suppose, toward a contradiction, that Prolonger nevertheless forces arrival at a primorial-batched fortress position \(A_\tau\) with cap at most \(H_0\) and trapped reservoir of size at least \(cn\).

There are two possibilities.

### Case 1: \(\tau\ge\sigma\)

Since legality is monotone,

\[
R(A_\tau)\subseteq R(A_\sigma).
\]

Therefore

\[
|R(A_\tau)|<\frac c4n,
\]

so \(A_\tau\) cannot contain a live reservoir of size \(cn\). Contradiction.

### Case 2: \(\tau<\sigma\)

Let \(T_\tau\) be the trapped entry reservoir. Thus

\[
|T_\tau|\ge cn.
\]

If the stated reservoir is \(Q(A_\tau)\), apply Lemma 2 directly to \(Q(A_\tau)\). If the convention is that the reservoir is \(E(A_\tau)\sqcup Q(A_\tau)\), apply the second part of Lemma 2.

Put

\[
h=\max\{1,\lceil H_0\rceil\}.
\]

Between times \(\tau\) and \(\sigma\), there are at most \(N_\eta(n)=o(n)\) actual moves. Lemma 2 therefore gives

\[
|T_\tau\cap R(A_\sigma)|
\ge
cn-hN_\eta(n)
=
(c-o(1))n.
\]

Because \(h\) is fixed, for all sufficiently large \(n\),

\[
cn-hN_\eta(n)>\frac c2n.
\]

Hence

\[
|R(A_\sigma)|\ge\frac c2n,
\]

contradicting the defining property

\[
|R(A_\sigma)|<\frac c4n.
\]

Both cases are impossible.

Thus for the arbitrary pair \((H_0,c)\), Shortener’s strategy prevents the claimed entry for all sufficiently large \(n\). Since \(H_0\) and \(c\) were arbitrary, (F) is false. ∎

---

## Stronger consequence

The same proof gives more than fixed cap.

Let \(H(n)\) be any cap satisfying

\[
H(n)=o(r(n)),
\]

where \(r(n)\to\infty\) is the degree-availability scale. Lemma 1 clears a fixed density in

\[
O\!\left(\frac{n}{r(n)}\right)
\]

actual moves, while an \(H(n)\)-capped reservoir can lose at most

\[
O\!\left(
H(n)\frac{n}{r(n)}
\right)
=o(n)
\]

members during that interval. Therefore:

\[
\boxed{
\text{No linear upper reservoir can be robustly entered with cap }
H(n)=o(r(n)).
}
\]

In particular, every fixed cap is ruled out.

This does **not** prove \(L(n)=o(n)\). The sweep only reduces \(R(A)\) below an arbitrarily chosen **fixed** density \(\eta n\). The degree-availability theorem supplied in the problem is not uniform as \(\eta=\eta(n)\to0\), which is precisely why the growing-depth/OA problem remains. What is closed is the fixed-cap absorbing-fortress route: a cap small enough that the reservoir erodes only \(o(n)\) during the fixed-density sweep cannot coexist with that sweep.

Report: verdicts A, B, C with decisive reasoning; B first. REMEMBER: your value is in finding real errors, not in summarizing.
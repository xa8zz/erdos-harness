---
id: R146-fsc2-second-shell-cap-entry-open
type: research
date: 2026-07-12
intent: >
  Determine whether the second-shell clearing statement FSC(2,η) — that the
  prescribed maximum-degree greedy policy clears the second dyadic shell
  (n/4,n/2] in o(n) Shortener turns against every adversary, starting from
  any position reached after an o(n) prelude and a completed top-shell phase
  — is true or false, and if neither can be settled, isolate the precise
  gap that remains.
predecessors: [R145-fsc-top-shell-proven]
prompt: erdos-872/prompts/researcher-R146-fsc-second-shell.md
action:
  kind: extends
  target: R145-fsc-top-shell-proven
claim: >
  FSC(2,η) is neither proved nor disproved. Two unconditional structural
  results are established for the second-shell phase: (1) a monotone-degree
  lemma showing the maximum currently-achievable deletion degree Δ_t is
  non-increasing along the greedy trajectory and that the sum of degrees
  over all turns is bounded by |S_1|, which forces a sparse cap-entry
  theorem — if the phase lasts more than m_H = floor(|S_1|/(H+1))+1 turns
  then Δ_t falls to at most H before turn m_H, giving an exact normal form
  for any counterexample: it must reach, in o(n) turns, a sparse position
  with |Q_1|>η|S_1| and degree ≤ H(n) for every H(n)→∞, followed by a
  linear-length tail sustaining that capped degree; and (2) a
  doubling/direct-ancestor lemma showing that once the top shell is cleared
  to |Q_0|≤(η/4)|S_1|, at least (η/8+o(1))n elements x of Q_1 have an
  illegal double 2x, and each such x carries an explicit blocker
  a_x=2d_x with d_x∣x and x/d_x odd already selected in the top shell.
  Neither result settles FSC(2,η): the missing step is shown to be
  precisely the unproved "second-shell capped-tail exclusion" statement —
  that no Prolonger strategy can realize the normal-form counterexample
  trajectory — and the direct-ancestor obstruction is shown to escape any
  capacity bound of the form #{x : a_x=a} ≤ C·τ(a), since a single blocker
  a=2d can certify Θ(n/d) targets at once.
implications:
  - Collapses the open problem from the general FSC(2,η) question to one
    sharp named trajectory statement, "second-shell capped-tail exclusion",
    whose truth is equivalent to FSC(2,η) via the cap-entry normal form.
  - Rules out off-policy sparse positions and latent-repair-face
    destructions as valid disproof mechanisms — a valid disproof must
    exhibit a reachable, on-trajectory, linear-length capped tail, not
    merely a static or off-policy construction.
  - Shows the monotone cap-entry normal form generalizes formally to every
    fixed shell, but the direct-ancestor certificate control does not
    iterate cleanly, since deeper shells inherit blockers from every
    previously processed shell — so the method is currently a localization
    theorem, not a finite-shell induction.
  - Clarifies that even a full disproof against the prescribed greedy
    policy would not establish L(n)=Ω(n), since a batch-aware or otherwise
    different Shortener policy could still succeed.
confidence_at_time: medium
strategy_dependence: greedy-policy-specific
---

# Verdict

\[
\boxed{\text{I do not obtain a valid proof or disproof of }\mathrm{FSC}(2,\eta).}
\]

A claimed proof would have to insert a new chronology-sensitive no-entry theorem for externally blocked divisors. A claimed disproof would have to construct a **reachable linear capped tail**, not merely an off-policy low-degree position or a latent-face failure. Neither follows from the stipulated results. I use the definitions and accepted facts exactly as stated in the attachment. 

There is, however, a sharp unconditional normal form for any counterexample. It substantially narrows what remains and shows precisely why the direct-ancestor obstruction is unavoidable already in the second shell.

---

## 1. Setup

Let \(A_t\) be the position immediately before Shortener’s \(t\)-th move in the second-shell phase, and write

\[
Q_t=Q_1(A_t),\qquad q_t=|Q_t|.
\]

For a currently legal lower element \(d\), put

\[
N_t(d)=\{x\in Q_t:d\mid x\},
\]

and define the current second-shell degree

\[
\Delta_t=\max_{d\text{ legal}}|N_t(d)|.
\]

Every proper divisor of an element of

\[
S_1=(n/4,n/2]
\]

is at most \(n/4\), so it is harmless to restrict the maximum to \(d\le n/4\).

The prescribed policy selects some \(d_t\) with

\[
|N_t(d_t)|=\Delta_t,
\]

using the fixed prefix-measurable tie-break.

Let \(T=T(n)\) denote the total number of Shortener turns in this phase.

---

# 2. Monotone-degree lemma

## Lemma 1

Throughout the second-shell phase,

\[
q_{t+1}\le q_t-\Delta_t
\tag{1}
\]

and

\[
\Delta_{t+1}\le \Delta_t.
\tag{2}
\]

Consequently,

\[
\sum_{t<T}\Delta_t\le q_0\le |S_1|.
\tag{3}
\]

### Proof

Shortener plays \(d_t\). Every member of \(N_t(d_t)\) is a multiple of the newly selected \(d_t\), so all those targets immediately become illegal. Prolonger’s following move can only remove further legal elements or cause further transfers into the minimal legal set. Legality never regenerates. Therefore

\[
Q_{t+1}\subseteq Q_t\setminus N_t(d_t),
\]

which proves (1).

Now let \(d\) be legal at time \(t+1\). It was also legal at time \(t\), and

\[
Q_{t+1}\subseteq Q_t.
\]

Hence

\[
N_{t+1}(d)\subseteq N_t(d),
\]

so

\[
|N_{t+1}(d)|\le |N_t(d)|\le\Delta_t.
\]

Taking the maximum over the smaller set of moves that remain legal at time \(t+1\) gives (2).

Finally, the sets \(N_t(d_t)\) are disjoint as sets of targets at their deletion times: once a target leaves the legal set, it never re-enters it. Summing (1) yields (3). \(\square\)

This monotonicity is stronger than is needed for the top-shell bootstrap: once the greedy degree falls below a cap, it stays below that cap for the remainder of the phase.

---

# 3. Sparse cap-entry theorem

## Theorem 2

Let \(H=H(n)\ge1\). If the second-shell phase lasts more than

\[
m_H=
\left\lfloor\frac{|S_1|}{H+1}\right\rfloor+1
\tag{4}
\]

Shortener turns, then before turn \(m_H\) it reaches an active position satisfying

\[
\Delta_t\le H.
\tag{5}
\]

In particular, suppose that for some fixed \(c>0\), along an infinite sequence of \(n\),

\[
T(n)\ge cn.
\tag{6}
\]

Then for **every** choice \(H(n)\to\infty\), the realized trajectory reaches, after \(o(n)\) phase turns, a position \(B_n\) for which

\[
|B_n|=o(n),
\tag{7}
\]

\[
|Q_1(B_n)|>\eta|S_1|,
\tag{8}
\]

\[
\Delta_{Q_1}(B_n)\le H(n),
\tag{9}
\]

and the remaining second-shell phase has length

\[
cn-o(n)=\Omega(n),
\tag{10}
\]

throughout which the degree stays at most \(H(n)\).

### Proof

If \(\Delta_t>H\) for each \(0\le t<m_H\), integrality gives

\[
\Delta_t\ge H+1.
\]

Then Lemma 1 gives

\[
|S_1|
\ge
\sum_{t<m_H}\Delta_t
\ge
m_H(H+1)
>
|S_1|,
\]

a contradiction. This proves (5).

Now assume (6) and choose any \(H(n)\to\infty\). Since

\[
|S_1|=\frac n4+O(1),
\]

we have

\[
m_H=O\!\left(\frac nH\right)=o(n).
\]

For sufficiently large \(n\), \(m_H<T(n)\), so the position supplied above is still inside the active phase and therefore satisfies (8).

The phase starts from a position of size \(o(n)\). Before the first \(m_H\) Shortener turns there are at most \(2m_H+O(1)=o(n)\) additional actual moves. Hence (7) holds.

Finally, Lemma 1 says that \(\Delta_t\) is nonincreasing. Once it has fallen below \(H(n)\), it remains below \(H(n)\) for the entire remaining phase. Since the cap was reached after \(o(n)\) turns and the full phase has at least \(cn\) turns, (10) follows. \(\square\)

Thus a disproof of \(\mathrm{FSC}(2,\eta)\) is not merely a capped-reservoir construction. It must force the following very specific object:

\[
\boxed{
\begin{array}{c}
\text{a positive-density active second-shell reservoir, reached on the}\\
\text{prescribed trajectory while the position is still sparse, followed by}\\
\text{a linear-length tail whose maximum deletion degree is }H(n)=o(n)\\
\text{for every arbitrarily slowly growing chosen cap }H(n).
\end{array}}
\tag{11}
\]

Conversely, such a realized linear capped tail is plainly a disproof. Hence (11) is an exact counterexample normal form.

---

# 4. What static completion says at the cap

At the cap-entry position \(B=B_n\), every \(x\in Q_1(B)\) has a proper legal divisor. By finite descent, it has a divisibility-minimal legal divisor

\[
\rho(x)\in\mathcal M(B),\qquad \rho(x)\mid x,\qquad \rho(x)<x.
\]

Since \(x\le n/2\),

\[
\rho(x)\le n/4.
\]

A fixed root \(\rho\) divides at most \(H\) members of \(Q_1(B)\), by (9). Therefore

\[
|Q_1(B)|
\le
H\,|\mathcal M(B)|.
\]

Using (8),

\[
|\mathcal M(B)|
>
\frac{\eta|S_1|}{H}
=
\left(\frac{\eta}{4}+o(1)\right)\frac nH.
\tag{12}
\]

But this does not contradict static completion. Since \(H(n)\to\infty\),

\[
\frac nH=o(n),
\]

and static completion permits an \(o(n)\)-sized minimal layer. The interval-blocker modulus shows why no rate of the form

\[
|\mathcal M(B)|=o(n/H)
\]

can be extracted from the qualitative theorem.

This is the exact quantitative obstruction: the cap-entry theorem produces only the lower bound \(n/H\), while static completion supplies only an unspecified \(o(n)\).

---

# 5. The previous shell forces linear direct-ancestor mass

The completed top-shell phase supplies additional structure that is absent from a generic sparse position.

Because \(\mathrm{FSC}(1,\eta_0)\) holds for every fixed \(\eta_0>0\), in the phase-alone formulation one may, for example, process the top shell down to

\[
|Q_0|\le \eta_0|S_0|
\qquad\text{with}\qquad
\eta_0=\frac{\eta}{4}.
\tag{13}
\]

This costs only \(o(n)\) turns.

## Lemma 3: doubling/direct-ancestor lemma

At any subsequent position \(A\),

\[
\#\{x\in Q_1(A):2x\text{ is legal}\}\le |Q_0(A)|.
\tag{14}
\]

Consequently, while

\[
|Q_1(A)|>\eta|S_1|
\]

and (13) holds, at least

\[
\left(\frac{\eta}{8}+o(1)\right)n
\tag{15}
\]

members \(x\in Q_1(A)\) have an illegal double \(2x\). For every such \(x\), some previously selected integer has the form

\[
a_x=2d_x,\qquad d_x\mid x,\qquad \frac{x}{d_x}\ \text{odd}.
\tag{16}
\]

The possibility \(d_x=1\), corresponding to \(a_x=2\), is allowed.

### Proof

If \(x\in Q_1(A)\) and \(2x\) is legal, then \(x\) is a legal proper divisor of \(2x\). Hence \(2x\) is nonminimal. Since

\[
x\in(n/4,n/2]
\quad\Longrightarrow\quad
2x\in(n/2,n],
\]

we have

\[
2x\in Q_0(A).
\]

The map \(x\mapsto2x\) is injective, proving (14).

Now

\[
|Q_1(A)|>\eta|S_1|
=
\left(\frac{\eta}{4}+o(1)\right)n
\]

and

\[
|Q_0(A)|
\le
\eta_0|S_0|
=
\left(\frac{\eta_0}{2}+o(1)\right)n.
\]

With \(\eta_0=\eta/4\), the number of \(x\in Q_1\) whose double is illegal is at least

\[
|Q_1|-|Q_0|
>
\left(
\frac{\eta}{4}-\frac{\eta}{8}+o(1)
\right)n,
\]

which is (15).

Fix one such \(x\). Because \(2x\) is illegal, it is comparable with a previously selected \(a_x\). We cannot have

\[
2x\mid a_x,
\]

because then \(x\mid a_x\), contradicting the legality of \(x\). Thus

\[
a_x\mid2x.
\]

Similarly \(a_x\nmid x\), again because \(x\) is legal. Comparing \(2\)-adic valuations, the fact that \(a_x\mid2x\) but \(a_x\nmid x\) implies

\[
v_2(a_x)=v_2(x)+1.
\]

Therefore \(a_x=2d_x\) for some \(d_x\mid x\), and

\[
v_2(x/d_x)=0.
\]

This is exactly (16). \(\square\)

So any linear counterexample tail necessarily begins with a linear population carrying explicit ratio-\(2\) direct-ancestor certificates.

The same observation iterates formally between adjacent shells:

\[
x\in Q_j,\quad 2x\text{ legal}
\quad\Longrightarrow\quad
2x\in Q_{j-1}.
\tag{17}
\]

What does **not** iterate is a capacity estimate for the blockers in (16).

---

# 6. Why Lemma 3 does not finish the proof

The obstruction is genuine concentration. A single selected integer can certify linearly many targets.

For instance, if \(a=2\), then every odd \(x\) has

\[
a\mid2x,\qquad a\nmid x.
\]

More generally, for a fixed blocker

\[
a=2d,
\]

all targets in its trace fiber have the form

\[
x=dm,\qquad m\text{ odd},
\]

and a single such fiber may contain \(\Theta(n/d)\) shell elements.

Thus no inequality of the form

\[
\#\{x:a_x=a\}\le C\tau(a)
\tag{18}
\]

is possible. This is precisely the direct-ancestor orientation that escapes the atomic ledger. The doubling lemma identifies the obstruction canonically, but it does not bound its lifetime capacity.

Nor does the literal anchor-and-lift construction supply the missing disproof. It proves that the maximum-degree policy can ignore a useful zero-current-deletion batch guard and that a sparse sequence of replies can destroy many **latent repair faces**. It does not establish all three facts needed here:

\[
|Q_1|\asymp n,
\qquad
Q_1\text{ remains nonminimal},
\qquad
\text{the actual capped tail lasts }cn.
\]

Destroying a bookkeeping family is not the same as keeping actual shell targets alive for linearly many greedy turns.

---

# 7. The precise unresolved assertion

The preceding proof reduces the positive direction to the following trajectory statement.

> **Second-shell capped-tail exclusion.**  
> For each fixed \(0<\eta<1\), after the fixed prelude and a top phase run at some fixed \(\eta_0<\eta/2\), there is no Prolonger strategy producing a sequence \(H(n)\to\infty\) and an active sparse position \(B_n\) such that
> \[
> |Q_1(B_n)|>\eta|S_1|,
> \qquad
> \Delta_{Q_1}(B_n)\le H(n),
> \]
> followed by \(\Omega(n)\) further active turns while the degree remains at most \(H(n)\).

By Theorem 2, this exclusion is equivalent to ruling out the normal form of every linear counterexample. But none of the supplied results proves it:

- Static completion permits the \(n/H\) minimal layer in (12).
- The exact-only bank does not control a move that simultaneously removes many legal divisors and jumps targets directly across intermediate depths.
- Frozen blocker repairs do not have chronological Lipschitz control.
- The atomic ledger controls the opposite divisibility orientation.
- All-orders witnesses allow the common trace \(d_x=1\).
- Fixed-cap fortress exclusion does not apply after rescaling, because the elements \(a_x\) in (16) are exactly the external blockers omitted by the rescaled board.
- The known lower constructions supply capped reservoirs of only \(n/H=o(n)\) moves or produce them off the required trajectory.

Accordingly, asserting \(\mathrm{FSC}(2,\eta)\) would amount to assuming capped-tail exclusion. Asserting its negation would require an explicit strategy realizing that tail. Neither implication is currently justified.

---

# 8. Formulation repair

The phrase “a fixed prefix-measurable tie-break” must mean that the following data are fixed before Prolonger is quantified:

\[
\mathcal T_n
=
\text{the exact prelude and stopping rule},
\]

\[
\prec_n(h)
=
\text{the tie-breaking order after every finite history }h.
\]

The substantive proposition is therefore properly indexed as

\[
\mathrm{FSC}_{\mathcal T,\prec}(2,\eta;\eta_0).
\]

A proof may establish it for one fully specified tie-break, or uniformly over all prefix-measurable tie-breaks. A disproof must attack the tie-break actually fixed; it may not choose a favorable tie-break after seeing the construction.

With that quantifier made explicit, I find no terminal, activation, zero-weight, scheduling, or parameter-level collapse. The obstruction is mathematical rather than definitional.

---

# Conclusion

The strongest rigorous conclusion is

\[
\boxed{
\begin{array}{c}
\text{Every failure of }\mathrm{FSC}(2,\eta)\text{ has a sparse cap-entry}\\
\text{after }o(n)\text{ turns and then a linear capped tail.}\\[1mm]
\text{After a slightly stronger completed top phase, that tail contains}\\
\text{linearly many explicit ratio-2 direct-ancestor certificates }a_x=2d_x.\\[1mm]
\text{The supplied results neither exclude such a tail nor force one.}
\end{array}}
\]

The monotone cap-entry normal form extends to every fixed shell. The direct-ancestor control does not: deeper shells inherit blockers from every previously processed shell. Therefore this method is a localization theorem, not yet a finite-shell induction.

A disproof of the prescribed greedy policy would not imply \(L(n)=\Omega(n)\), because a batch-aware or otherwise different Shortener policy could still succeed. A proof would be the first genuine step of the desired finite induction, but it requires exactly the new chronology-sensitive capped-tail exclusion isolated above.
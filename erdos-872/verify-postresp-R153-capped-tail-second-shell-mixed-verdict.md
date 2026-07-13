---
id: R153-capped-tail-second-shell-mixed-verdict
type: verification
date: 2026-07-13
intent: >
  Adversarially audit nine numbered results concerning a capped-tail
  exclusion statement, its claimed equivalence to second-shell clearing
  in a divisibility antichain game, and a Turán-Kubilius degree lemma
  with an accompanying integrability/abstract-trajectory argument meant
  to bound a linear second-shell phase.
predecessors: [R149-capped-tail-vacuous-repair-root-reduction, R150-second-shell-chronology-gap]
action:
  kind: confirms
  target: R149-capped-tail-vacuous-repair-root-reduction
claim: >
  R0 (REPAIRABLE): the negative-threshold activation-suppression argument
  is a genuine but non-substantive vacuity under one formalization, and
  the top-phase policy can independently become undefined at a
  nonterminal position (explicit n=11 witness). The capped-tail exclusion
  is equivalent to second-shell clearing only after adding: 0<eta_0<eta/2;
  a uniform activation bound sup over Prolonger strategies of the actual
  activation time = o(n); explicit adversarial quantification of the
  capped-tail witness (no c>0, n_k->infty, strategies sigma_k, caps
  H_k->infty, active times b_k with |A_{b_k}|=o(n_k), degree<=H_k, and
  >=c n_k further active turns of degree <=H_k); and alignment of the
  top-shell stopping threshold with eta_0, absorbed into the o(n)
  prelude. R1 (VALID): legal divisors of a fixed legal element form an
  upper ideal in its divisor poset. R2 (VALID, narrowly construed): a
  maximum-degree lower candidate d<=n/4 and its divisibility-minimal
  legal divisor r have the same current target-deletion set N_Q(r)=N_Q(d),
  but r is not substitutable for d as an equivalent game move (n=48
  counterexample: A={5,7,11,16}, d=6, r=3, both delete {18,24}, but r
  additionally kills 9 while d does not). R3 (REPAIRABLE): a T-turn phase
  yields T distinct charged roots, but only T-o(n), not all T, are
  guaranteed to first become minimal legal after a sparse entry position
  (a safe fixed-constant form is >= (c/2)n for T>=cn). R4 (VALID): with
  the repaired R3, at least (c/2)n-o(n) charged roots lie in
  ((c/2)n, n/4]. R5 (VALID): every T>=cn-turn tail of the second-shell
  greedy phase contains a suffix of length >= (c/2)n-O(1) on which the
  degree is bounded by a fixed constant. R6 (VALID, hypothesis retained):
  for the surviving target set after a cn-turn interval, any divisor
  legal throughout that interval has degree <= 1/(4c)+o(1) against that
  set. R7 (VALID, endpoint fix only): the degree lemma
  Delta_Q(A) >>_eta loglog K, K=min(n^{1/8},(n/t)^{1/4}), holds for
  t>=1; at t=0 the correct convention is K=n^{1/8}, giving
  Delta_Q(A) >>_eta loglog n. R8 (REPAIRABLE, four overreaches): the
  degree lemma requires t=o(n) and is misapplied when summed over a
  genuinely linear range T=epsilon n (only a sparse horizon m_n=o(n) is
  licensed, whose integral bound tends to a vanishing fraction of n); a
  guaranteed lower bound on degree is treated as an upper bound on actual
  deletion, which is unjustified; the O(n/H) bound on the count of
  high-degree turns is mislabeled a cap-entry time when it is only an
  upper bound (the true cap-entry time for a loglog(n/t) trajectory
  solves loglog(n/t)~H, giving t ~ n*exp(-exp(Theta(H))), not n/H); and
  the constructed scalar trajectory (delta_j, q_j, m_j) only shows a set
  of one-dimensional cover/degree/degree-sum inequalities are mutually
  consistent, without constructing actual primitive positions, target
  sets, realizing legal divisors, realizing external blockers, or a
  Prolonger strategy. Overall: R1, R4, R5, R6, R7 stand as stated; R2
  stands only in its narrow deletion-set form; R3 and R0 stand only with
  the stated repairs. Neither audited document proves or disproves the
  repaired second-shell clearing assertion; FSC(2,eta) is not
  established, and neither L(n)=o(n) nor its negation follows from these
  results.
implications:
  - R1, R4, R5, R6, R7 may be cited as established lemmas exactly as stated.
  - R2 may be cited only in its narrow form (equal current target-deletion
    set); it must never be used as an interchangeable game move in a
    strategy argument.
  - R3 must be cited only in repaired form (T-o(n), or the fixed-constant
    (c/2)n bound for T>=cn), never as literally all T roots newly minimal
    after entry.
  - R0's negative-eta_0 vacuity observation is not a substantive result; any
    future claim that the capped-tail exclusion equals second-shell clearing
    must carry all four repair conditions (eta_0 lower bound, uniform
    activation bound, adversarial strategy quantifiers, top/second-shell
    threshold alignment).
  - R8's constructed abstract scalar trajectory must not be cited as
    evidence that a linear second-shell tail is game-theoretically
    achievable or even consistent with the accepted theorems; it only shows
    one-dimensional inequality compatibility.
  - The O(n/H) bound relating turn count to degree cap is an upper bound on
    cap-entry time only and must not be used as a lower bound or as the true
    first cap-entry time.
  - FSC(2,eta) remains unresolved; no future dispatch may treat it, or
    L(n)=o(n)/its negation, as settled by these two documents.
verifiers_at_time:
  - [gpt-pro-R153-audit, mixed]
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/audit-R152pre-root-reduction-and-tk-lemma.md
---

# Referee verdicts

| Result | Verdict | Core ruling |
|---|---|---|
| **R0** | **REPAIRABLE** | The negative-\(\eta _0\) loophole is a genuine syntactic vacuity under one formalization, but the proposed phase can also become undefined at a nonterminal position. The repaired no-tail statement is equivalent to second-shell clearing only after adding explicit strategy quantifiers and fixing the activation protocol. |
| **R1** | **VALID** | The legality argument is complete. |
| **R2** | **VALID, narrowly construed** | A maximum-degree move has the same current \(Q\)-deletion set as a minimal legal divisor. It is not an equivalent game move and cannot be substituted in the strategy. |
| **R3** | **REPAIRABLE** | There are \(T\) distinct charged roots, but only \(T-o(n)\), not necessarily \(T\), first become minimal after entry. |
| **R4** | **VALID** | The interval count is correct up to the usual \(O(1)\) rounding. The count of newly exposed roots is \((c/2)n-o(n)\). |
| **R5** | **VALID** | The monotonicity and degree-sum argument gives a linear constant-cap suffix. |
| **R6** | **VALID** | The survivor-incidence deadline inequality is correct for legal lower candidates. |
| **R7** | **VALID** | The Turán–Kubilius and blocked-coatom calculations work. The exact statement should use the displayed truncation \(K\), especially when \(t=0\). |
| **R8** | **REPAIRABLE** | The integral computation is correct, but the proof applies a sparse-prefix lemma at fixed linear times, calls an \(O(n/H)\) checkpoint a cap-entry time, and overstates what an abstract numerical trajectory proves. |

---

## R0 — activation suppression and the alleged exact equivalence

### Verdict: **REPAIRABLE**

There are two separate questions.

### 1. The negative-\(\eta _0\) observation

If the literal logical formula is interpreted as

\[
\exists \eta _0<\eta/2
\quad\text{such that no prohibited position exists after the threshold stop},
\]

and a “post-top position” exists only if

\[
|Q_0|\le \eta _0|S_0|
\]

is attained, then choosing \(\eta _0=-1\) indeed makes the set of post-top positions empty. Under that deliberately permissive semantics, the sentence is vacuously true.

But Document 1 overstates this when it says its two conventions exhaust the possibilities. A third possibility is that the prescribed top policy becomes undefined at a nonterminal position.

Here is an explicit example.

Take \(n=11\), so the lower region is \(\{2,3,4,5\}\) and

\[
S_0=(11/2,11]=\{6,7,8,9,10,11\}.
\]

Consider the legal play

\[
3,\ 2,\ 5.
\]

After Prolonger chooses \(3\), the live nonminimal top targets are \(8\) and \(10\). The lower move \(2\) deletes both, so \(2\) is a maximum-degree top-shell move. Prolonger can then choose \(5\).

At

\[
A=\{2,3,5\},
\]

there is no legal lower element:

- \(2,3,5\) are already chosen;
- \(4\) is illegal because \(2\mid 4\).

But \(7\) and \(11\) are still legal, so the game is not terminal. Also \(Q_0=\varnothing\), yet with \(\eta _0=-1\),

\[
0=|Q_0|>-|S_0|,
\]

so the top phase remains formally active. The policy now asks Shortener to choose a legal lower maximizer, but no legal lower move exists.

Thus the negative-threshold choice does not automatically define a complete game strategy. It yields a vacuous logical statement only if nontermination or partial policies are explicitly admitted.

There is a second possible obstruction: if the phrase “run the \(\mathrm{FSC}(1,\eta _0)\) top phase” imports the previously defined domain \(0<\eta _0<1\), then \(\eta _0=-1\) is simply ill-typed. The omission must genuinely occur in the formal quantifier, not merely in an informal restatement.

### 2. Exact repair and equivalence

The following is the correct formal repair.

Fix a complete activation protocol \(\Pi_n\), including all fallback moves, stopping rules, and tie-breaks, before quantifying over Prolonger. Require

\[
0<\eta _0<\eta/2
\]

and the uniform activation bound

\[
\sup_{\sigma}
\tau_{\mathrm{act}}(n,\sigma)=o(n),
\]

where \(\sigma\) ranges over Prolonger strategy families and \(\tau_{\mathrm{act}}\) counts actual moves before the second-shell phase.

Let \(G_n(\sigma)\) be the number of Shortener turns in the active second-shell phase. Then the substantive second-shell statement is

\[
\sup_{\sigma}G_n(\sigma)=o(n).
\tag{FSC2}
\]

Its exact capped-tail reformulation must explicitly quantify the adversarial histories:

> There do not exist \(c>0\), \(n_k\to\infty\), Prolonger strategies \(\sigma_k\), caps \(H_k\to\infty\), and on-trajectory active times \(b_k\) such that
> \[
> |A_{b_k}|=o(n_k),\qquad
> \Delta_{Q_1}(A_{b_k})\le H_k,
> \]
> and at least \(c n_k\) subsequent Shortener turns remain active with degree at most \(H_k\).

With this quantification, the equivalence follows from the accepted normal form.

If \((\mathrm{FSC2})\) fails, then for some \(\varepsilon>0\),

\[
G_{n_k}(\sigma_k)\ge \varepsilon n_k.
\]

For any \(H_k\to\infty\), the number of turns with \(\Delta>H_k\) is at most

\[
\frac{|S_1|}{H_k+1}=o(n_k).
\]

Since the degree is nonincreasing, after an \(o(n_k)\)-turn initial segment the cap \(\Delta\le H_k\) holds permanently. Activation was also \(o(n_k)\), so the resulting position is sparse, and at least

\[
\varepsilon n_k-o(n_k)\ge \frac{\varepsilon}{2}n_k
\]

active Shortener turns remain. This produces the prohibited witness.

The converse is immediate: such a witness gives a linear second-shell phase.

One final protocol issue remains. If Attachment A’s literal definition insists that the top shell itself stops at threshold \(\eta|S_0|\), while Document 1 runs it to \(\eta _0|S_0|\), these are not literally the same policy. They become equivalent only if the extra top clearing is absorbed into the allowed \(o(n)\) prelude, after which the standard \(S_0\)-phase immediately terminates. That absorption should be stated.

So the corrected capped-tail exclusion is genuinely equivalent to second-shell clearing, but Document 1’s formulation needs those explicit additions.

---

## R1 — legal divisors form an upset

### Verdict: **VALID**

Suppose \(x\) is legal and

\[
d\mid e\mid x,
\]

with \(d\) legal. If \(e\) were illegal, some chosen \(a\in A\) would be comparable with \(e\).

If \(a\mid e\), then

\[
a\mid x,
\]

contradicting the legality of \(x\).

If \(e\mid a\), then

\[
d\mid a,
\]

contradicting the legality of \(d\).

These are the only two possibilities. Equality cases cause no problem. The conclusion is exactly that the legal divisors of a fixed legal \(x\) form an upper ideal in its divisor poset.

No primitiveness property of \(A\) is even needed beyond the definition of legality.

---

## R2 — minimal-root equivalence

### Verdict: **VALID, narrowly construed**

Let \(d\le n/4\) be a legal maximum-degree candidate and let \(r\mid d\) be divisibility-minimal among the legal divisors of \(d\).

If \(r\) had a proper legal divisor \(q\), then \(q\mid d\), contradicting the choice of \(r\). Hence

\[
r\in\mathcal M(A).
\]

Also,

\[
N_Q(d)\subseteq N_Q(r).
\]

Since \(r\le d\le n/4\), \(r\) is itself an eligible lower move. Maximality of \(d\) gives

\[
|N_Q(r)|\le |N_Q(d)|,
\]

so equality of sets follows:

\[
N_Q(r)=N_Q(d).
\]

That formal claim is correct.

The word “equivalent” must not be interpreted game-theoretically. Choosing \(r\) instead of \(d\) generally changes the future lower legal set, the blockers available to Prolonger, and the fixed tie-break trajectory.

A concrete example is available at \(n=48\). Let

\[
A=\{5,7,11,16\}.
\]

This is primitive, and in

\[
S_1=(12,24]
\]

the live nonminimal population is

\[
Q_1(A)=\{18,24\}.
\]

Both \(d=6\) and its minimal legal divisor \(r=3\) have current deletion set

\[
N_Q(6)=N_Q(3)=\{18,24\}.
\]

Thus \(6\) can be a maximum-degree move under an appropriate tie-break. But \(9\) is currently legal. Choosing \(3\) kills \(9\), whereas choosing \(6\) leaves \(9\) legal. Therefore the two moves are not interchangeable in the game tree.

What is established is only:

\[
\boxed{\text{same current target-deletion set, not same successor position.}}
\]

The subsequent charging argument uses only this narrower fact, so that argument is not harmed.

---

## R3 — distinct minimal-root events

### Verdict: **REPAIRABLE**

The first assertion is correct.

If \(r_t\mid d_t\) is the charged root on Shortener turn \(t\), then after \(d_t\) is chosen, \(r_t\) is permanently unavailable. Legal elements never reappear. Therefore

\[
r_t\ne r_{t'}
\qquad(t\ne t').
\]

A \(T\)-turn phase produces at least \(T\) distinct roots that are minimal legal immediately before their charged turns.

The quantitative post-entry conclusion needs a constant correction.

Let \(B\) be the sparse entry position. At most

\[
|\mathcal M(B)|=o(n)
\]

of the charged roots were already minimal at \(B\). Every later charged root was legal at \(B\), because legality only decreases. If it was not minimal at \(B\), then there is a well-defined first time after \(B\) when it becomes minimal; once an element becomes minimal and remains legal, it cannot cease being minimal.

Consequently the exact bound is

\[
\#\{\text{charged roots first becoming minimal after }B\}
\ge T-|\mathcal M(B)|
=T-o(n).
\]

Thus, from \(T\ge cn\), one gets

\[
(c-o(1))n,
\]

not literally \(cn\), newly minimal roots. A safe fixed-constant version is

\[
\ge \frac c2 n
\]

for all sufficiently large \(n\).

The exact repair is therefore:

\[
\boxed{
T\text{ distinct charged roots, of which at least }T-o(n)
\text{ first become minimal after entry.}
}
\]

---

## R4 — a macroscopic interval contains linearly many roots

### Verdict: **VALID**

During the active second-shell phase, each Shortener move deletes at least one current target. These deletions are from a monotonically shrinking subset of \(S_1\). Hence

\[
T\le |S_1|=\frac n4+O(1).
\]

If \(T\ge cn\), this implies

\[
c\le \frac14+o(1),
\]

and since \(c\) is fixed, necessarily \(c\le1/4\).

Every charged root lies in \([2,n/4]\). There are at most

\[
\left\lfloor\frac{cn}{2}\right\rfloor
\]

integers at most \(cn/2\). Among any \(cn-O(1)\) distinct roots, at least

\[
\frac c2n-O(1)
\]

therefore lie in

\[
\left(\frac c2n,\frac n4\right].
\]

This count is correct.

Combining it with the repaired R3 statement gives

\[
\#\left\{
r\in\left(\frac c2n,\frac n4\right]:
r\text{ first becomes minimal after }B
\right\}
\ge \frac c2n-o(n).
\]

Thus the section’s qualitative conclusion—linearly many newly exposed roots in a single fixed macroscopic interval—is valid. Only an exact claim of \((c/2)n\) newly exposed roots would need the \(o(n)\) subtraction.

---

## R5 — linear tails have linear constant-cap suffixes

### Verdict: **VALID**

Let \(\Delta_t\) be the maximum degree at the \(t\)-th Shortener position. By the accepted normal form,

\[
\Delta_t
\]

is nonincreasing and

\[
\sum_{t<T}\Delta_t\le |S_1|=\frac n4+O(1).
\]

For an integer \(D\ge1\), every turn with \(\Delta_t>D\) contributes at least \(D+1\), so

\[
\#\{t<T:\Delta_t>D\}
\le \frac{|S_1|}{D+1}
\le \frac{n}{4(D+1)}+O(1).
\]

Because the degrees are nonincreasing, all such turns form an initial segment.

Choose \(D=D(c)\) with

\[
\frac1{4(D+1)}<\frac c2.
\]

If \(T\ge cn\), the remaining suffix has length at least

\[
cn-\frac{n}{4(D+1)}-O(1)
\ge \frac c2n-O(1),
\]

and throughout that suffix

\[
\Delta_t\le D.
\]

The dependence \(D=D(c)\) is harmless because \(c\) is a fixed witness constant. The proof does not require Shortener to know \(c\) in advance; it is a structural statement about any putative tail.

---

## R6 — final-survivor deadlines

### Verdict: **VALID**

Let

\[
X=Q_T
\]

be the targets remaining after the selected \(T\)-turn interval. Since legal and nonminimal target status can only disappear,

\[
X\subseteq Q_t
\]

at every earlier Shortener position \(t\).

Let \(2\le d\le n/4\) and suppose \(d\) is legal at the first \(s\) Shortener positions. For each such position, every \(x\in X\) divisible by \(d\) is still a current target. Hence \(d\) is a legal candidate of degree at least

\[
k_X(d)=|\{x\in X:d\mid x\}|.
\]

Therefore

\[
\Delta_t\ge k_X(d)
\]

at each of those \(s\) positions, and

\[
s\,k_X(d)
\le\sum_{t<s}\Delta_t
\le |S_1|.
\]

Thus

\[
s\le\frac{|S_1|}{k_X(d)}
\]

whenever \(k_X(d)>0\).

If \(d\) remains legal throughout a \(T\)-turn interval with \(T\ge cn\), then

\[
k_X(d)
\le\frac{|S_1|}{T}
\le\frac1{4c}+O\!\left(\frac1n\right)
=\frac1{4c}+o(1).
\]

The formulation should retain the condition that \(d\) is a legal lower candidate. Subject to that, the deadline result is sound.

---

## R7 — the second-shell degree lemma

### Verdict: **VALID**

The proof survives adversarial checking.

Let

\[
K=\min\left\{n^{1/8},\left(\frac nt\right)^{1/4}\right\}
\]

for \(t\ge1\), with \(K=n^{1/8}\) for \(t=0\).

The restricted Turán–Kubilius estimate

\[
\sum_{n/4<x\le n/2}
\bigl(\omega_K(x)-\lambda_K\bigr)^2
=O(n\lambda_K)
\]

is legitimate. One may obtain it either from the usual prefix estimate, since the interval is a subset of \([1,n/2]\), or directly by expanding first and second moments. The slight difference between the exact additive-function mean and

\[
\lambda_K=\sum_{p\le K}\frac1p
\]

is \(O(1)\), absorbed by \(O(n\lambda_K)\).

Chebyshev gives only \(O(n/\lambda_K)\) numbers with fewer than \(\lambda_K/2\) small prime divisors. Therefore an arbitrary \(Q\) of size at least \(\eta n\) contains

\[
\gg_\eta n\lambda_K
\]

small-prime incidences.

The external-blocker count is also correct. For a blocked coatom

\[
d=\frac xp,
\]

legality of \(x\) rules out a blocker \(a\mid d\); otherwise \(a\mid x\). Hence one has

\[
d\mid a,\qquad a=dr,\qquad x=dp,
\]

and therefore

\[
r=\frac{ap}{x}<4p.
\]

For fixed \(a\) and \(p\), fewer than \(4p\) values of \(r\) are possible. Thus one chosen \(a\) accounts for at most

\[
\sum_{p\le K}4p
\le 4K\pi(K)
\le 4K^2
\]

blocked incidences.

The claimed error is indeed \(o(n)\). There are two cases.

If \(t\le n^{1/2}\), then \(K=n^{1/8}\), so

\[
K^2t=n^{1/4}t\le n^{3/4}=o(n).
\]

If \(n^{1/2}<t=o(n)\), then \(K=(n/t)^{1/4}\), so

\[
K^2t
=\left(\frac nt\right)^{1/2}t
=\sqrt{nt}
=n\sqrt{\frac tn}
=o(n).
\]

After deleting blocked incidences, \(\gg_\eta n\lambda_K\) legal incidences remain. There are at most \(n/4\) possible lower \(d\), so some legal \(d\) has degree

\[
\gg_\eta\lambda_K
\asymp_\eta \log\log K.
\]

For \(t\ge1\) and \(t=o(n)\),

\[
\log\log K
=\Theta\!\left(\log\log\frac nt\right).
\]

The only formal cleanup is the \(t=0\) endpoint. A fully exact statement is

\[
K=\min\left\{
n^{1/8},
\left(\frac{n}{t\vee1}\right)^{1/4}
\right\},
\qquad
\Delta_Q(A)\gg_\eta\log\log K.
\]

At \(t=0\), this reads \(\Delta_Q(A)\gg_\eta\log\log n\). With that convention, R7 is established.

---

## R8 — integrability and the abstract trajectory

### Verdict: **REPAIRABLE**

The main intuition is right, but four claims need correction.

### 1. The lemma is applied outside its stated domain

R7 assumes

\[
t=|A|=o(n).
\]

Document 2 then says: suppose the population remains linear through

\[
T=\varepsilon n
\]

and sum the degree guarantee over \(t\le\varepsilon n\). For fixed \(\varepsilon>0\), the later positions have \(t=\Theta(n)\), so R7, as stated, does not apply there.

The valid sparse version is to take

\[
m_n=o(n),\qquad \varepsilon_n=\frac{m_n}{n}\to0.
\]

Then the lower bound supplied by R7 sums to

\[
\sum_{j\le m_n}
\log\log\frac{n}{j}
\]

up to activation and constant-factor adjustments. Its continuous analogue is

\[
n\int_0^{\varepsilon_n}
\log\log\frac1s\,ds.
\]

The integral evaluation is correct:

\[
\int_0^\varepsilon
\log\log\frac1s\,ds
=
\varepsilon\log\log\frac1\varepsilon
+
O\!\left(\frac{\varepsilon}{\log(1/\varepsilon)}\right),
\]

and this tends to \(0\). Consequently, the amount of deletion that R7 alone certifies through an \(o(n)\)-turn horizon is only \(o(n)\).

### 2. A small lower bound is not an upper bound on actual deletion

R7 proves

\[
\Delta_t\ge c_\eta\log\log(n/t).
\]

Summing it gives a guaranteed minimum. If that minimum is \(o(n)\), one may correctly conclude:

\[
\boxed{\text{R7 by itself does not certify linear contraction in sparse time.}}
\]

One may not conclude that actual deletion is \(o(n)\), nor that the game genuinely follows the lower envelope. Additional structure could force much larger degrees.

Thus “the lemma forces approximately the displayed sum” should be replaced by “the lemma guarantees at least the displayed sum, and this guaranteed amount is insufficient.”

### 3. \(t\asymp n/H\) is not a cap-entry theorem

The degree-sum argument gives only

\[
\#\{\Delta_t>H\}
\le \frac{|S_1|}{H+1}
=O(n/H).
\]

Therefore, if the phase is still active, the cap has been entered **no later than** \(O(n/H)\) Shortener turns. It gives no matching lower bound. The first cap-entry time may be much earlier.

This matters especially for the proposed trajectory

\[
\Delta_t\asymp\log\log(n/t).
\]

Solving \(\Delta_t\asymp H\) gives

\[
\log\log(n/t)\asymp H
\quad\Longrightarrow\quad
t\asymp n\exp(-\exp(\Theta(H))),
\]

not \(n/H\).

At time \(t=n/H\), that trajectory has

\[
\Delta_t\asymp\log\log H,
\]

so \(n/H\) is a later capped checkpoint, not the first cap-entry time.

The correct sentence is:

> By \(O(n/H)\) Shortener turns, the cap \(\Delta\le H\) must already have been entered if the phase survives; at such a late capped checkpoint, R7 is consistent with a degree as small as order \(\log\log H\).

If one wants \(|A|=O(n/H)\) at that checkpoint, the activation cost must also be \(O(n/H)\), or \(H\) must be chosen sufficiently slowly relative to the known \(o(n)\) activation rate.

### 4. The abstract trajectory is only a scalar compatibility model

A rigorous numerical version can be constructed. Fix \(0<\rho<1/4\), choose a constant \(C\) at least as large as the degree-lemma constant, and choose a sufficiently small fixed \(c>0\) such that

\[
C\int_0^c
\max\left\{1,\log\log\frac1s\right\}\,ds
<\frac{\rho}{2}.
\]

For \(1\le j\le cn\), define

\[
\delta_j=
\left\lceil
C\max\left\{1,\log\log\frac nj\right\}
\right\rceil,
\]

\[
q_j=
\lfloor\rho n\rfloor-\sum_{i<j}\delta_i,
\]

and

\[
m_j=\left\lceil\frac{q_j}{\delta_j}\right\rceil.
\]

Then:

\[
\delta_j\ \text{is nonincreasing},
\]

\[
\sum_{j\le cn}\delta_j<\frac{\rho n}{2},
\]

\[
q_j\ge\frac{\rho n}{2},
\]

\[
q_j\le m_j\delta_j,
\]

and whenever \(j=o(n)\),

\[
\delta_j\to\infty,\qquad m_j=o(n).
\]

Thus these scalar quantities satisfy the displayed cover inequality, sparse-root bound, degree divergence, degree monotonicity, degree-sum constraint, and persistence of a linear-sized target population.

That is a legitimate demonstration that the listed **one-dimensional inequalities** do not contradict one another.

It does not produce:

- primitive positions \(A_j\);
- actual target sets \(Q_j\);
- legal divisors realizing the prescribed degrees;
- external blockers realizing the required chronology;
- a Prolonger strategy against arbitrary Shortener play.

Consequently, the abstract trajectory does not prove that the full accepted game-theoretic theorems are logically compatible with a linear tail. It proves only that their displayed scalar consequences do not yield a contradiction by themselves.

The sentence concerning the “exact-only population” is likewise unsupported unless that population is formally defined and its evolution constraints are checked.

---

# Overall ruling

The following may be treated as established:

\[
\boxed{
\text{R1,\ R4,\ R5,\ R6,\ R7}
}
\]

together with the narrowly stated form of R2:

\[
\boxed{
r\in\mathcal M(A),\qquad N_Q(r)=N_Q(d).
}
\]

The corrected form of R3 is also established:

\[
\boxed{
T\text{ distinct charged roots, and }T-o(n)
\text{ first become minimal after sparse entry.}
}
\]

Consequently, a linear second-shell tail really would force:

\[
\begin{gathered}
\text{linearly many distinct charged roots},\\
\text{linearly many newly exposed roots in a fixed macroscopic interval},\\
\text{a linear fixed-cap suffix},\\
\text{and the survivor-incidence deadline inequalities}.
\end{gathered}
\]

R0 may be treated only as a warning about malformed quantifiers. The negative-\(\eta _0\) argument is not a substantive game result, and without an explicit total-policy convention it can make the phase undefined. After positivity, uniform activation, adversarial strategy quantifiers, and protocol alignment are supplied, the capped-tail exclusion is equivalent to second-shell \(o(n)\)-clearing.

From R8, only the following conclusion is established:

\[
\boxed{
\text{The }\log\log(n/t)\text{ lower bound is integrable and does not,
by summation alone, prove sparse-time clearing.}
}
\]

The proposed abstract trajectory is not an actual divisibility-game trajectory and supplies no lower-bound strategy.

Therefore neither document proves or disproves the repaired second-shell clearing assertion. In particular, the audited results do **not** establish \(\mathrm{FSC}(2,\eta)\), and they do **not** establish either

\[
L(n)=o(n)
\]

or its negation.
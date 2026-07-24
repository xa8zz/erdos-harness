I found no fatal mathematical error in the cone decomposition or density recursion. There are several mandatory formal repairs, including an incomplete definition of (V_b), one false sentence in §4.3, and an incomplete Shortener strategy on exceptional-only positions.

# Referee report

I refereed the submitted manuscript under the requested adversarial standard. 

## Overall finding

The central argument appears mathematically sound. In particular, I do not find a counterexample to the root-cone pairing, quotient projection, local-game recursion, arithmetic decomposition, or limit passage.

There are, however, three genuine defects:

1. The robust game is not formally defined because “minimax” and “at any time” do not specify the strategy quantifiers or erasure protocol.
2. A sentence in §4.3 incorrectly counts the number of post-opening Prolonger moves that can precede the first local Shortener response.
3. The stated Shortener strategy is undefined when all root cones are unavailable but legal exceptional vertices remain.

All three are repairable without changing the numerical inequalities. My verdict is therefore **ACCEPT AFTER MINOR FIXES**, subject to the exact repairs listed at the end.

---

## (a) Robust game (V_b(N)) and (L(n)\le V_1(n))

### Status: **FLAW (minor but mandatory formal gap)**

The phrase

> “An auxiliary adversary allied with Prolonger may, at any time, erase…”

does not define an extensive-form game. Nor does “the minimax length” specify whether the intended normal-form expression is

[
\inf_{\sigma_S}\sup_{\sigma_P,\sigma_E}\ell
]

or

[
\sup_{\sigma_P,\sigma_E}\inf_{\sigma_S}\ell.
]

The later local-strategy argument requires the former interpretation, or equivalently the backward-induction value of a finite perfect-information game: there must exist one Shortener strategy that works simultaneously against every adaptive Prolonger strategy and every adaptive erasure strategy.

If instead (V_b) were merely a supremum over Prolonger/erasure histories followed by an infimum allowing Shortener to tailor her strategy to that complete history, §4.3 would not follow.

### Required repair

For each fixed downset (D), define a finite extensive-form game in which:

* Prolonger and the erasure actor jointly maximize the number of actual selections.
* Shortener minimizes it.
* The opening consists of at most (b) consecutive legal Prolonger selections; Prolonger explicitly ends the opening phase.
* Before each scheduled player action, the erasure actor may erase any collection of currently unselected live vertices that is an upset in the original (D).
* After the opening, Prolonger may either select or pass.
* Shortener must select whenever a legal vertex remains.
* The game ends exactly when no live legal vertex remains.
* Erasures never revive vertices or undo the blocking effect of an earlier selection.

Multiple erasures between two actual moves can be replaced by their union, which is again an upset. Null erasures can be suppressed. The resulting game tree is finite because every non-pass player action or nontrivial erasure strictly reduces a finite state, and every Prolonger pass is followed either by a Shortener selection or termination.

Then set

[
v_b(D)=\inf_{\sigma_S}\sup_{\sigma_P,\sigma_E}\ell,
\qquad
V_b(N)=\max_{D\subseteq[N]\text{ downset}}v_b(D).
]

Under this formulation, (0\le V_b(N)\le N) is valid.

### Verification of (L(n)\le V_1(n))

Under the repaired definition, this claim is **valid**.

Take (D=[n]). Prolonger makes one opening selection (x\ge2), uses no erasures and never passes. The selected (x) kills (1), along with exactly the elements of ([n]) comparable to (x). The remaining position is precisely the original game on ({2,\ldots,n}) after its first move (x).

Since the robust game gives the maximizing side additional options, its value cannot be smaller:

[
L(n)\le V_1(n).
]

The presence of (1) causes no discrepancy after the first move.

---

## (b) Active-cone bound (V_{b+1}(q_t)) and global implementability

### Status: **VALID, with one false explanatory sentence**

The conclusion

[
#{\text{selections in }C_t}\le V_{b+1}(q_t)
]

is valid under the repaired robust-game definition.

### The false sentence

The manuscript says:

> “After global alternation starts, it can receive at most one further Prolonger selection before Shortener’s first local response.”

This is false for a cone first activated after the opening.

For example, let (b=1), and suppose (C_t) has quotient vertices (2) and (3) still live.

1. Prolonger first enters (C_t) by selecting (2t).
2. Shortener performs a root sweep in another cone.
3. Prolonger returns to the now-active (C_t) and selects (3t).
4. Only now does Shortener make her first selection inside (C_t).

Thus (C_t) received two post-opening Prolonger selections before its first local Shortener response.

This does **not** invalidate the bound, because (b\ge1), and therefore

[
2\le b+1.
]

The correct count is:

* If (C_t) received (k) selections during the global opening, then (k\le b), and at most one further local Prolonger selection can occur before the first local response.
* If it received no opening selection and is first activated later, it can receive at most two Prolonger selections before the first local response: the activation move and one return move.

Hence the number of local opening selections is at most

[
\max{b+1,2}=b+1.
]

### Valid local trace construction

Fix an active cone (C_t). Form its projected local history as follows.

* Retain every actual selection made inside (C_t).
* Project external selections and global erasures to the corresponding quotient-upset erasures.
* Ignore a global pair of turns on which neither player selects inside (C_t).
* If Shortener selects inside (C_t) after a global Prolonger move or pass outside (C_t), insert a local Prolonger pass before that Shortener selection.
* Before the first local Shortener selection, regard all projected Prolonger selections as the opening block.

After Shortener’s first local move, every actual Prolonger selection inside an already active cone receives an immediate Shortener response there. Thus no two later local Prolonger selections occur without an intervening local Shortener selection.

The resulting local history is a legal robust game with at most (b+1) opening selections.

### Global implementability

The local optimal strategies can be run simultaneously.

There is never more than one active cone requiring an immediate local response after a global Prolonger selection: it is the cone in which that selection was made. Other local games can simply remain frozen.

When Prolonger acts outside all active cones, Shortener may:

* sweep a root;
* advance one active local game, treating the external move as a local pass; or
* after the strategy is completed as discussed under item (h), select an exceptional outside vertex.

There is therefore no synchronization conflict among the local strategies.

External erasure histories may be correlated across cones, but each local strategy is constructed to handle every adaptive upset-erasure history. Independence of the erasures is unnecessary.

---

## (c) Drafting/pairing inequality (4.1)

### Status: **VALID**

List the post-opening new activations chronologically as

[
A_1,A_2,\ldots,A_k.
]

For every (i<k), a root sweep must occur immediately after (A_i).

Indeed, if no live unprocessed root existed after (A_i), no later new activation (A_{i+1}) could occur. Availability is monotone decreasing, and an unprocessed cone with a live vertex necessarily has a live root by §4.1.

Let (C_i) be the root swept after (A_i). Pair

[
A_{i+1}\longleftrightarrow C_i.
]

At the moment (C_i) is chosen, the root eventually activated as (A_{i+1}) is:

* still unprocessed;
* still live, because it is selected later;
* among the candidates scanned by Shortener.

Since Shortener selects a maximum-weight live unprocessed root,

[
\nu(C_i)\ge \nu(A_{i+1}).
]

The pairing is injective because different activations use different preceding sweeps.

Collateral deaths do not cause a problem. A root that is activated later cannot have died in the interim. Heavier roots may die, but that only removes competitors; it does not change the fact that the future activated root was present at the earlier sweep.

The only unpaired activations are:

* at most (b) opening activations;
* the first post-opening activation.

Therefore

[
W_{\mathcal A}
\le W_{\mathcal C}+(b+1)\nu_{\max}.
]

The edge case in which a sweep is unavailable is also correctly handled: such unavailability implies that there can be no subsequent new activation.

---

## (d) Projection claims (3.12)–(3.14)

### Status: **VALID**

Let (r\notin C_t) be selected and comparable with (tm\in C_t).

If

[
tm\mid r,
]

then (t\mid r). Since (r\le N), this would place (r) in

[
C_t={t,2t,\ldots,\lfloor N/t\rfloor t},
]

contrary to (r\notin C_t). Hence necessarily

[
r\mid tm.
]

Writing

[
g=(r,t),\qquad r=gq,\qquad t=gs,\qquad (q,s)=1,
]

one has

[
r\mid tm
\iff
gq\mid gsm
\iff
q\mid m.
]

Thus the external selection deletes inside the cone precisely the live part of

[
{m\in D_t:q\mid m},
]

a principal upset of the quotient downset. The boundary cases are harmless:

* (q=1) deletes the whole cone;
* (q>q_t) deletes nothing.

If (U\subseteq D) is a global upset, then

[
U_t={m\in D_t:tm\in U}
]

is an upset in (D_t). Indeed, if (m\mid m'), then (tm\mid tm').

Internally,

[
tm_1\mid tm_2\iff m_1\mid m_2.
]

Finally,

[
D_t={m\le q_t:tm\in D}
]

is a divisibility downset because (D) is one.

Strictly speaking, the proof only requires that every projected global history be an admissible robust local history. That one-way simulation is fully established. The word “exactly” should not be read as asserting that different cones receive independently controllable erasures.

---

## (e) Lemma 3.1, cone disjointness and covering

### Status: **VALID**

Assume

[
\nu_t=\frac Nt\ge\frac Ns=\nu_s
]

and (t\nmid s). Choose a prime (p) whose exponent in (t) is larger than its exponent in (s). Then

[
p\ge P^-(t)>H\nu_t.
]

Since adjoining the missing factor (p) to (s) is necessary in the least common multiple,

[
\operatorname{lcm}(s,t)\ge sp.
]

Consequently,

[
\operatorname{lcm}(s,t)

>

\frac N{\nu_s}H\nu_t
\ge HN>N,
]

contradicting the assumed common multiple at most (N). Thus (t\mid s). Reversing the initial ordering gives the stated nesting alternative.

For distinct divisibility-minimal tags (s,t\in\mathcal R), nesting is impossible, so no common multiple lies at most (N).

It follows that:

* their full cones are disjoint;
* no element of one cone is comparable with an element of another;
* every useful (x\in D) belongs to a root cone.

For the covering assertion, if (t_K(x)\in\mathcal T), finite descent in (\mathcal T) produces a minimal (r\in\mathcal R) with

[
r\mid t_K(x)\mid x.
]

Since (x\le N), this means (x\in C_r). Hence

[
D\setminus\bigcup_{r\in\mathcal R}C_r\subseteq\mathcal E_N.
]

No assumption that the entire cone lies in (D) is needed; the cones are used as ambient containers.

---

## (f) Lemmas 2.1, 2.2 and 2.3

### Status: **VALID**

### Lemma 2.1

The Selberg-sieve calculation is correct.

The family (\mathcal D) is divisor-closed, so

[
\sum_{\substack{d\in\mathcal D\q\mid d}}\frac{\lambda_d}{d}=y_q
]

holds by Möbius inversion. Also,

[
\lambda_1
=========

\frac1G\sum_{r\in\mathcal D}\frac{\mu(r)^2}{\varphi(r)}
=1.
]

The quadratic form diagonalization gives (1/G).

The error estimate is adequate:

[
\sum_{d\in\mathcal D}|\lambda_d|
\le
\frac1G\sum_{r\in\mathcal D}\frac{\sigma(r)}{\varphi(r)}
\ll R(\log R)^C,
]

and therefore the floor-function error is

[
O!\left(R^2(\log R)^{2C}\right)
===============================

O!\left(X^{1/3}(\log X)^{2C}\right).
]

The lower bound

[
G\gg\log z_0
]

is valid because every squarefree (d\le z_0) belongs to (\mathcal D) and (1/\varphi(d)\ge1/d). The elementary squarefree-density argument needs harmless floor-error terms, but its conclusion is correct.

For (z>X), (\Phi(X,z)=1), so the omitted range is covered by the (+1).

The implied constant can be taken absolute.

### Lemma 2.2

The recurrence

[
a_i\le K a_{i-1}^2
]

gives

[
a_i\le K^{2^i-1}.
]

Thus (a>\sqrt X) implies

[
\Omega(a)
\ge
\frac{\log\log X}{\log2}-O_K(1).
]

The multiplicative-moment identity is correct:

[
z^{\Omega(m)}=\sum_{d\mid m}h(d),
\qquad
h(p^e)=(z-1)z^{e-1}.
]

The Euler product is finite at (z=c_0=1/\log2) because

[
1<c_0<2.
]

The exponent is

[
\kappa
======

c_0\log c_0-c_0+1
\approx 0.0860713321>0.
]

Therefore

[
D_K(X)\ll_K\frac{X}{(\log X)^\kappa}
]

is justified.

### Lemma 2.3

The exceptional integers are completely partitioned, for sufficiently large (N), into:

1. (x\le\delta N);
2. (a_K(x)\le A);
3. (a_K(x)>N^\gamma).

For (a\le A), the overcount

[
\sum_{a\le A}\Phi(N/a,Ka)
]

is legitimate, including the (t=1) case because (P^-(1)=\infty). It gives

[
\ll
N\frac{1+\log A}{\log K}+O(A).
]

For (N^\gamma<a\le\sqrt{N/K}), partial summation from Lemma 2.2 gives

[
\sum_{\substack{a>N^\gamma\a\ K\text{-dense}}}\frac1a
\ll_K(\log N)^{1-\kappa},
]

and hence the main contribution is

[
O_K!\left(\frac{N}{(\log N)^\kappa}\right)=o(N).
]

The accumulated (+1) terms contribute at most (D_K(N)=o(N)).

For (a>\sqrt{N/K}), if (t>1), then

[
P^-(t)>Ka>\frac Na\ge t,
]

which is impossible. Thus (t=1), and (x=a) is (K)-dense, again giving (o(N)).

The argument works for every fixed (0<\gamma<1); if one of the displayed subranges is empty, nothing changes.

---

## (g) Passage to the limit

### Status: **VALID, with minor parameter declarations needed**

The order of limits is correct:

1. Fix (A,K,\delta,\gamma,b).
2. Let (N\to\infty).
3. Then let (A\to\infty), with (K) and (\delta) chosen as functions of (A).

For each fixed (A), take

[
\delta=A^{-2},
\qquad
K=\lceil e^{A^3}\rceil.
]

Then

[
K\delta>1
]

for all sufficiently large (A), and

[
\delta+
C\frac{1+\log A}{\log K}
+\frac1A
========

O(A^{-2})+O!\left(\frac{\log A}{A^3}\right)+O(A^{-1})
\to0.
]

The dependence of the (o(N)) term in Lemma 2.3 on (A,K,\delta,\gamma) is harmless because (N) is sent to infinity first.

For any bounded sequence (a_m),

[
\lim_{A\to\infty}\sup_{m\ge A}a_m
=================================

\limsup_{m\to\infty}a_m.
]

Hence

[
M_{b+1}(A)\to c_{b+1}.
]

The iteration also needs no estimate uniform in (b). For every fixed (r), apply the separately established inequalities for

[
b=1,2,\ldots,r.
]

This gives

[
c_1\le 2^{-r}c_{r+1}\le2^{-r}.
]

Only after this finite chain is established is (r\to\infty) taken. This is legitimate.

The manuscript should explicitly declare:

* (A) to be an integer, as used in (q_t\ge A);
* a fixed (\gamma\in(0,1)), for example (\gamma=1/2), throughout the limiting argument.

These are not substantive defects.

---

## (h) Final bookkeeping (4.7)

### Status: **FLAW (minor strategy-completeness gap)**

The proposed Shortener strategy is not defined on every possible position.

Suppose:

* no live unprocessed root remains;
* every active local cone has no legal prescribed move or there are no active cones;
* at least one legal vertex remains outside all root cones.

The response rule only says that Shortener “continues the active local games.” It does not tell her what to do when no such move exists.

This situation is possible. For example, (D) may consist entirely of exceptional small vertices, so (\mathcal R=\varnothing), while legal vertices remain after the opening move.

### Required repair

Add:

> If no root sweep is available and no active local strategy supplies a legal move, Shortener selects an arbitrary legal vertex outside all root cones.

This repair does not affect the estimate, because every such selected vertex lies in

[
D\setminus\bigcup_{t\in\mathcal R}C_t
\subseteq\mathcal E_N.
]

After this addition, the three classes are exhaustive and disjoint:

1. Every Prolonger selection in a root cone makes that cone active, and all later selections there belong to class 1.
2. A root fired by Shortener belongs to a cone that was not active and can never subsequently become active.
3. Every remaining selection is outside all root cones and hence belongs to class 3.

A vertex may be arithmetically exceptional while lying inside an active cone, but it is still assigned only to class 1. The term (|\mathcal E_N|) is used only for selections outside the union of root cones, so there is no double counting.

With the strategy completed, (4.7) follows.

---

## (i) Unstated assumptions

### Status: **FLAW (minor; all are repairable)**

The following should be stated explicitly.

### 1. Erasure protocol

Erasures affect only availability. They do not remove a previous selection from the antichain, undo its deletions or revive vertices.

The timing and information structure must be specified as discussed under item (a).

### 2. End of the opening

Because Prolonger may use “up to” (b) moves, the rules must include an explicit decision by Prolonger to end the opening phase.

### 3. Game termination

The game ends when no live legal vertex remains. Prolonger cannot prevent termination by repeatedly passing: each pass is followed by a Shortener selection unless the game has already ended.

Shortener has no pass option, although the added exceptional fallback makes her strategy total whenever a move exists.

### 4. Downsets and (1)

Every nonempty divisibility downset contains (1). This is intended.

The original game does not contain (1), but in the comparison with (D=[n]), the first opening move (x\ge2) kills (1). Thereafter the positions agree exactly.

The empty downset, if allowed, has value zero and is harmless.

### 5. Tie-breaking

The decreasing-(\nu_t) root order should use an arbitrary fixed deterministic tie-breaking rule. Only the weak inequality between weights is needed.

### 6. Integer (A)

The statement

[
\nu_t>A\implies q_t=\lfloor\nu_t\rfloor\ge A
]

uses that (A) is an integer. Otherwise, for example, (A=2.5) and (\nu_t=2.6) give (q_t=2<A).

Declare (A\in\mathbb N).

### 7. Fixed (\gamma)

Section 5 should state that (\gamma\in(0,1)) is held fixed while (N\to\infty) and (A\to\infty).

### 8. Total Shortener strategy

The exceptional-vertex fallback described under item (h) must be included.

---

# Verdict

## **ACCEPT AFTER MINOR FIXES**

I found no fatal flaw in the argument establishing

[
c_b\le\frac12c_{b+1}
]

or in its iteration.

The required fixes are:

1. Give a formal extensive-form definition of the robust game and specify the required
   [
   \inf_{\sigma_S}\sup_{\sigma_P,\sigma_E}
   ]
   strategy quantifiers.
2. State precisely when erasures occur and that they do not undo previous selections.
3. Replace the false sentence in §4.3 by the correct bound
   [
   \max{b+1,2}=b+1.
   ]
4. Add the exceptional-vertex fallback to make Shortener’s strategy defined on every nonterminal position.
5. Declare (A) integral, fix (\gamma\in(0,1)), and specify deterministic tie-breaking and termination.

Once those changes are made, the manuscript gives a coherent unconditional proof of

[
L(n)=o(n).
]

A line-numbered version would be the appropriate format for communicating these mandatory revisions to the author.

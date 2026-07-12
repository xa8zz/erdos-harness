---
id: R115-baseline-frozen-ancestor-harvest
type: research
date: 2026-07-12
intent: >
  Formulate the canonical nondegenerate ancestor-harvest statement
  (meeting the audit repair list: baseline freezing, uniform o(n)
  trapping deadline, ledger normalization, non-preforcible stopping),
  prove its nondegeneracy, and prove or disprove it.
predecessors: [R113-audit-shadow-and-ah-claims, R114-frozen-ledger-preforce-degenerate]
action:
  kind: extends
  target: R114-frozen-ledger-preforce-degenerate
claim: >
  Canonical statement (BF-AH), baseline-frozen and globally clocked:
  with H = T(n)^(1+delta) and a fixed deterministic trapping algorithm
  whose first prescribed endpoint b occurs within a(n) = o(n) moves on
  every continuation, ALL shell ledgers are frozen simultaneously at
  A_b with exact positive mass normalization and frozen first-exit
  channels; every later move (including moves servicing other shells)
  stays on the global clock and the original ledger; stopping tests
  start from a genuinely nontrivial baseline and include the stopping
  move; the required inequality is the uniform chronological
  direct-ancestor bound on the frozen ledger. Nondegeneracy is proved
  against all seven known collapse families: terminal delay, prelude
  delay, pre-freeze cap forcing, shell deferral, zero weights / omitted
  faces, first-exit reassignment, and collapse to the cost-only
  statement equivalent to the full problem. Together with the
  residual-channel closure, prime guard, and online-area reductions,
  (BF-AH) implies L(n) = o(n). (BF-AH) itself is neither proved nor
  disproved: known Prolonger examples refute pointwise charging,
  order-only policies, and common-blocker responses but not every
  complete post-trapping policy; known positive facts do not supply the
  chronological potential.
implications:
  - The o(n) side of the dichotomy now has a single canonical,
    nondegeneracy-proven target statement; dispatches can attack
    (BF-AH) directly once the formulation survives audit.
  - A disproof of the full sublinear side must beat (BF-AH)'s
    quantifier: an arbitrary-policy persistent direct-ancestor cascade.
verifiers_at_time: []
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/researcher-R115-canonical-ancestor-harvest.md
---

# Verdict

The canonical repair is a **baseline-frozen, globally clocked ancestor-harvest statement**. Every shell ledger is frozen simultaneously at the first prescribed endpoint of one fixed trapping algorithm; all later moves, including moves spent processing other shells, remain on that ledger; the ledger has exact positive mass normalization; and the stopping test begins from a genuinely nontrivial baseline and includes the stopping move.

This formulation is nondegenerate and, together with the accepted residual-channel, prime-guard, and online-area reductions, implies \(L(n)=o(n)\).

I do **not** obtain a valid proof or disproof of the resulting statement. The remaining assertion is exactly the uniform chronological direct-ancestor inequality already isolated in the attachments. The known examples refute pointwise charging, order-only policies, and common-blocker responses, but they do not beat every complete post-trapping Shortener policy. Conversely, the supplied positive facts do not furnish the required chronological potential. Declaring the statement true or false would therefore insert an unproved lemma at precisely that point. I take the attached facts and audits as stipulated throughout. 

---

# Part 1: the canonical nondegenerate statement

## 1. Parameters fixed before play

Fix \(\delta>0\), and put

\[
\mathfrak T(n):=\max_{m\le n}\tau(m),
\qquad
H=H(n):=\mathfrak T(n)^{1+\delta}.
\]

Thus \(H\to\infty\) and \(H=n^{o(1)}\). As in the accepted batch reduction, set

\[
r=\left\lfloor(\log H)^{1/3}\right\rfloor,
\qquad
W_r=\binom r{\lfloor r/2\rfloor}.
\]

Fix once and for all the following data, independently of the eventual Prolonger continuation.

1. A deterministic smooth/rough trapping algorithm \(\mathcal T_n\), including all tie-breaking and fallback moves.
2. A deterministic stopping rule for \(\mathcal T_n\). Along every continuation, its **first prescribed endpoint** occurs after at most
   \[
   a(n)=o(n)
   \]
   actual moves.
3. The canonical cube, face, lift-slot, and first-exit construction used in the accepted advance-depletion reduction.
4. The shell scheduler used by the accepted online-area reduction, including the order in which shells and batches are serviced and every batch, guard, maximum-degree, and fallback rule.

The last item means that a witness is a total deterministic map from every finite legal history at which Shortener moves to a specific legal integer. Phrases such as “choose a suitable blocker” are not a policy.

Let \(b\) denote the first endpoint of \(\mathcal T_n\) on the realized history. If the game has already terminated by \(b\), then its total length is at most \(a(n)=o(n)\), and that branch is already harmless. Otherwise, time \(0\) below means the position \(A_b\).

The crucial point is that the post-trapping policy has no authority to alter \(b\).

---

## 2. Simultaneous baseline freeze

For every dyadic shell

\[
S_X=(X/2,X]\cap[2,n],
\]

freeze at time \(b\)

\[
\widehat Q_X:=Q_X(A_b).
\]

At the same instant, apply the fixed canonical decomposition and freeze

\[
\widehat{\mathscr F}_X
\quad\text{and}\quad
\widehat w_X:\widehat{\mathscr F}_X\to(0,\infty).
\]

A convenient exact formulation of ledger normalization is the following. There are fixed coefficients

\[
\lambda_{X,F}(u)\ge0
\qquad
(F\in\widehat{\mathscr F}_X,\ u\in\widehat Q_X)
\]

such that

\[
\sum_{F\in\widehat{\mathscr F}_X}\lambda_{X,F}(u)=1
\quad\text{for every }u\in\widehat Q_X,
\tag{N1}
\]

and

\[
\widehat w_X(F)
=
\sum_{u\in\widehat Q_X}\lambda_{X,F}(u)>0.
\tag{N2}
\]

Consequently,

\[
\sum_{F\in\widehat{\mathscr F}_X}\widehat w_X(F)
=
|\widehat Q_X|.
\tag{N3}
\]

The coefficients are produced by the fixed canonical decomposition, not chosen by the eventual Shortener policy. Thus one cannot put all mass on “exceptional” faces, set weights equal to zero, or omit inconvenient targets.

No coefficient, face, weight, designated ancestor, or lift slot may later be changed.

---

## 3. Frozen first-exit channels

For each \(F\in\widehat{\mathscr F}_X\), the canonical construction specifies its designated ancestors and lift slots.

As play continues, let \(\xi_X(F)\) be the first actual time after \(b\) at which \(F\) exits the canonical active family. At that first exit, assign it one channel according to one fixed, predeclared priority rule. In particular:

- it is a **target-death or transfer exit** when its represented live shell payload actually leaves \(Q_X\);
- it is a **residual exit** when the face remains legal but a required lift slot first becomes illegal;
- it is a **direct-ancestor exit** when a designated ancestor becomes illegal through a proper-multiple move before the face is processed, without that event already being charged as an actual target death or transfer;
- the remaining ordinary, boundary, pairwise-overlap, and exact/minimal channels are those of the accepted reduction.

Only the first exit counts. Later events cannot change its channel.

Define

\[
\operatorname{Anc}_X(t)
:=
\sum_{\substack{F\in\widehat{\mathscr F}_X\\
                 \xi_X(F)\le t\\
                 F\text{ exits through the direct-ancestor channel}}}
\widehat w_X(F).
\tag{1}
\]

This definition includes direct-ancestor exits occurring while the policy is processing other shells.

---

## 4. The global clock and actual area

Index **all** actual moves after \(b\) by \(1,2,\ldots\), including both players’ moves and moves devoted to other shells.

Let

\[
Q_X^t:=\widehat Q_X\cap Q_X(A_{b+t}).
\]

Thus halving is always measured relative to the common frozen baseline, not relative to a later shell-specific activation set.

Write

\[
D_X(t)
:=
\max_{d\in D(A_{b+t})}
\#\{u\in Q_X^t:d\mid u\}
\tag{2}
\]

for the current residual shell degree. Define the contemporaneous favorable area on move \(i\) by

\[
\alpha_{X,i}:=
|Q_X^{i-1}\setminus Q_X^i|.
\tag{3}
\]

This includes direct target deaths and irreversible transfers out of the live nonminimal shell population. Put

\[
\mathsf A_X(t):=\sum_{i=1}^{t}\alpha_{X,i}.
\tag{4}
\]

One may replace \(\mathsf A_X\) by the equivalent maximum-degree-area bank used in the accepted reduction; the important point is that it is actual contemporaneous progress, not endpoint degree times elapsed time.

---

## 5. Genuine active blocks and genuine stopping events

Let \(h=h(n)\to\infty\) be chosen sufficiently slowly for the accepted parameter hierarchy.

A shell is **active at the baseline** when

\[
|\widehat Q_X|>\frac{X}{h^2}
\qquad\text{and}\qquad
D_X(0)>H.
\tag{5}
\]

For an active shell define

\[
\tau_X
:=
\min\left\{
t\ge1:
D_X(t)\le H
\ \text{or}\
|Q_X^t|\le\frac12|\widehat Q_X|
\right\}.
\tag{6}
\]

The requirement \(t\ge1\), together with (5), guarantees

\[
\tau_X\ge1.
\]

The estimate below is required at every deterministic or history-dependent stopping time

\[
0\le t\le\tau_X,
\]

including \(t=\tau_X\). In particular, a large jump on the stopping move cannot be discarded.

---

## 6. Canonical baseline-frozen ancestor harvest

### Statement \((\mathrm{BF\!-\!AH})\)

There exist:

- an absolute constant \(C\);
- a function \(\varepsilon(H)\to0\);
- a function \(h(n)\to\infty\);
- and a completely specified deterministic online Shortener policy \(\Sigma\) extending the fixed trapping algorithm and using the fixed shell scheduler,

such that, uniformly over every Prolonger strategy, every sufficiently large \(n\), every baseline-active dyadic shell \(S_X\), and every stopping time \(0\le t\le\tau_X\),

\[
\boxed{
\operatorname{Anc}_X(t)
\le
\varepsilon(H)X
+
C\,\mathsf A_X(t)
+
CHt.
}
\tag{BF-AH}
\]

The policy may not:

- change the freeze time;
- rebase a shell when its scheduled processing begins;
- discard or repartition frozen mass;
- alter a first-exit channel;
- or count only moves made while that shell is actively being serviced.

That is the canonical nondegenerate statement.

---

# 2. Proof that \((\mathrm{BF\!-\!AH})\) is nondegenerate

## 2.1 Terminal delay cannot witness it

Suppose \(\widehat Q_X\) is baseline-active. Then

\[
|\widehat Q_X|>\frac{X}{h^2}>0
\quad\text{and}\quad
D_X(0)>H,
\]

so the baseline position is not terminal and neither stopping condition holds at time \(0\). Hence \(\tau_X\ge1\).

There is no later operation called “activate shell \(X\).” Its ledger and clock already exist at time \(b\). If the policy waits until the game becomes terminal, then at the terminal move

\[
Q_X^t=\varnothing,
\]

so shell halving occurs. Every earlier time and the terminal stopping move itself lie in the quantified interval, and every direct-ancestor exit during the delay remains in \(\operatorname{Anc}_X(t)\).

Thus the old witness

\[
\text{wait until terminal, then initialize an empty ledger}
\]

is syntactically impossible.

If the game terminates during the fixed trapping phase, before a nonterminal baseline exists, then it has terminated in at most \(a(n)=o(n)\) moves. That is genuine progress, not a vacuous ancestor-harvest certificate.

---

## 2.2 Prelude delay cannot witness it

The endpoint \(b\) belongs to the already fixed algorithm \(\mathcal T_n\). It is the algorithm’s first prescribed endpoint and satisfies a uniform \(o(n)\) bound.

The post-trapping policy \(\Sigma\) has no parameter corresponding to “continue the prelude.” The freeze occurs before the first subsequent move. Therefore \(\Sigma\) cannot:

- inspect later Prolonger play;
- run until a shell becomes small;
- run until the game becomes terminal;
- or run a degree-reduction sweep and call its endpoint the trapping endpoint.

Every such move necessarily occurs after the ledger has been frozen.

---

## 2.3 Pre-freeze cap forcing cannot witness it

Consider the previous degenerate construction in which Shortener devoted

\[
m_X=\left\lceil\frac{|S_X|}{H+1}\right\rceil
\]

turns to reducing the shell degree and froze the ledger only afterward.

Under \((\mathrm{BF\!-\!AH})\), these \(m_X\) turns occur after time \(0\). Therefore:

- all direct-ancestor exits during those turns are charged to the original ledger;
- all target deaths contribute to \(\mathsf A_X(t)\);
- all elapsed turns contribute to \(Ht\);
- halving is tested against \(\widehat Q_X\), not the smaller post-sweep reservoir;
- and the cap crossing is tested at its actual time.

Since \(D_X(0)>H\), the cap condition cannot already hold at the freeze. If it first holds at time \(m\), then

\[
m=\tau_X
\]

unless baseline halving occurred earlier, and the inequality is required for every \(t\le m\), including \(m\).

Thus the processing interval cannot be made empty by a cap-before-freeze sweep.

---

## 2.4 Deferring a shell does not force a stopping event for free

Suppose the scheduler spends several moves processing other shells.

Those moves still increment the clock of shell \(X\). If they alter \(Q_X^t\), its frozen ledger records the resulting exits and its area bank records actual losses. If they do not alter \(Q_X^t\), neither halving nor the monotone degree cap is triggered merely by the passage of “scheduler time.”

Hence deferral supplies no free state transition. The term \(CHt\) records actual moves and is part of the global sublinear scheduling budget in the accepted shell pipeline.

---

## 2.5 Zero weights and omitted faces are impossible

Equations (N1)–(N3) imply

\[
\widehat w_X(F)>0
\]

for every ledger face and

\[
\sum_F\widehat w_X(F)=|\widehat Q_X|.
\]

Therefore neither

\[
\widehat w_X\equiv0
\]

nor a ledger covering only a negligible preferred subfamily is admissible.

Because the canonical decomposition is fixed before the existential policy \(\Sigma\), the policy cannot choose a favorable decomposition.

---

## 2.6 First-exit reassignment is impossible

A face is charged at its first irreversible exit, using a priority rule frozen at \(b\). A later event cannot relabel a direct-ancestor exit as:

- a residual exit;
- a boundary loss;
- an exact-only event;
- or a loss belonging to a later processing block.

Thus policy-dependent bookkeeping cannot make \(\operatorname{Anc}_X\) small.

---

## 2.7 It is not the cost-only statement equivalent to \(L(n)=o(n)\)

The earlier reverse implication from \(L(n)=o(n)\) used an optimal Shortener strategy until termination and initialized the ledger only at the terminal node.

That construction does not witness \((\mathrm{BF\!-\!AH})\):

- the trapping algorithm and first endpoint are fixed independently of the optimal terminal strategy;
- a nonempty ledger is frozen there;
- the inequality is tested at every early stopping time;
- and later terminal activation is not permitted.

In particular, knowing only that the total continuation length is \(o(n)\) gives no bound on a possible direct-ancestor jump at time \(1\), \(2\), or any other early time. Thus \((\mathrm{BF\!-\!AH})\) is not definitionally a statement that Shortener can end the game in \(o(n)\) moves.

It is a specific local chronological inequality for one canonical channel. Its implication to \(L(n)=o(n)\) uses the other accepted theorems.

---

# 3. Why \((\mathrm{BF\!-\!AH})\) implies \(L(n)=o(n)\)

The attached residual calculation gives, with

\[
q_H\asymp\frac{H}{\log H},
\]

the bound

\[
q_H|\mathcal E_{\mathrm{res}}|
\le
2^r\mathfrak T(n)t.
\]

Hence

\[
|\mathcal E_{\mathrm{res}}|
\le
\frac{2^r\mathfrak T(n)}{q_H}\,t.
\]

Because

\[
H=\mathfrak T(n)^{1+\delta},
\qquad
2^r=H^{o(1)},
\]

we have

\[
\frac{2^r\mathfrak T(n)}{q_H}=o(1).
\]

Since a capped face has weight \(O(H)\), the residual-channel repair mass is

\[
o(Ht).
\tag{7}
\]

The legal prime-product guard removes the pure trace-\(1\) anchor channel at a negligible cost. Ordinary lift failures, high-\(\operatorname{lcm}\) tuples, boundary cubes, pairwise overlaps, and exact/minimal transfers are already controlled by the accepted banks.

Adding \((\mathrm{BF\!-\!AH})\) therefore gives the total repair estimate

\[
\operatorname{Repair}_X(t)
\le
o(X)
+
O(Ht)
+
C\,\mathsf A_X(t).
\tag{8}
\]

This is exactly the contemporaneous-area repair estimate required by the accepted advance-depletion-to-online-area reduction. Choosing \(h(n)\to\infty\) sufficiently slowly absorbs \(\varepsilon(H)\), the \(H^{o(1)}\) cell factors, and the other uniform error moduli.

Consequently the prescribed processing block satisfies

\[
|Q_X(\mathrm{end})|
\le
\frac12|Q_X(\mathrm{start})|
+
\frac{X}{h(n)^2}.
\tag{9}
\]

Applying (9) \(O(\log h)\) times gives a residual \(O(X/h)\) in shell \(S_X\), using

\[
O\!\left(\frac{X\log h}{h}\right)
\]

Shortener turns. Geometric summation over the dyadic shells gives \(o(n)\) total processing moves. The trapping phase costs \(o(n)\), and the resulting \(o(n)\)-sized position has an \(o(n)\)-sized maximal completion by the accepted static-completion theorem.

Therefore

\[
\boxed{(\mathrm{BF\!-\!AH})\Longrightarrow L(n)=o(n).}
\]

No additional post-entry persistence theorem or completion estimate is being inserted here.

---

# Part 2: resolution attempt

## 4. The exact statement that would prove \((\mathrm{BF\!-\!AH})\)

For a future move \(c_i\), let

\[
\mathcal B_i
\]

be the baseline faces whose first exit occurs at \(i\) through the direct-ancestor channel. Since first exits are disjoint,

\[
\operatorname{Anc}_X(t)
=
\sum_{i\le t}\widehat w_X(\mathcal B_i).
\]

The missing theorem is a chronological weighted capacity inequality:

\[
\boxed{
\sum_{i\le t}\widehat w_X(\mathcal B_i)
\le
o(X)
+
C\sum_{i\le t}\alpha_{X,i}
+
CHt
}
\tag{CH}
\]

uniformly over the actual ordered history generated against a single complete Shortener policy.

A proof cannot be pointwise. The known one-carrier construction permits

\[
\widehat w_X(\mathcal B_i)=\Omega(H^2)
\]

while

\[
\alpha_{X,i}=O(H).
\]

Thus the stronger increment inequality

\[
\widehat w_X(\mathcal B_i)
\le C(\alpha_{X,i}+H)
\]

is false. Any valid proof of (CH) must show that a move capable of such a jump required earlier setup, refinement, or lost opportunities whose accumulated credit pays for that jump.

Equivalently, one needs a potential \(\Phi_X(t)\) satisfying

\[
\Phi_X(0)=o(X)
\]

and

\[
\operatorname{Anc}_X(t)
\le
\Phi_X(t)+C\mathsf A_X(t)+CHt,
\]

with chronology-stable increments. No supplied frozen repair potential has this property: one later minimum-product edge can simultaneously interact with many previously repaired objects.

---

## 5. Why the known obstructions do not disprove it

A disproof of \((\mathrm{BF\!-\!AH})\) would have to show that for **every** completely specified Shortener policy there is an actual post-trapping continuation, a baseline-active shell, and a time \(t\le\tau_X\) such that, for some fixed \(c>0\),

\[
\operatorname{Anc}_X(t)\ge cX,
\tag{10}
\]

while simultaneously

\[
\mathsf A_X(t)=o(X)
\qquad\text{and}\qquad
Ht=o(X).
\tag{11}
\]

Then the right side of \((\mathrm{BF\!-\!AH})\) would be \(o(X)\), contradicting (10).

None of the accepted counterexamples supplies all of these quantifiers.

### The one-carrier jump

It disproves a per-move area charge, but not the cumulative inequality. The carrier may require a substantial prehistory, and \(Ht\) and earlier area are measured from the common baseline.

### The private-carrier drafting construction

It defeats every **ordering** of a fixed minimal layer and can leave a linear family of descendants legal. But its proof assumes that the intervening Shortener moves are exact selections from that fixed layer. A general Shortener policy may insert cross-cone blockers, guard products, or other lower moves. Moreover, the obtainable post-peel position used by the construction is not shown to be forceable as the endpoint of every fixed trapping algorithm.

Thus it refutes order-only ancestor harvesting, not the policy-existential statement above.

### The example \(A=\{6,35\}\)

The legal threats \(10\) and \(15\) have no common legal blocker. This refutes the rule “respond to all threats by playing their product or least common multiple.” It does not prove that Shortener cannot harvest the two families separately or use another coordinate.

### The lifetime inheritance example

The \(128\)-versus-\(48\) history proves that instantaneous Sperner width cannot be promoted to lifetime capacity. The atomic ledger correctly loses a factor \(2^r\). It does not itself force linear ancestor mass with both quantities in (11) sublinear.

### The raw-shadow counterexample

A linear raw proper-multiple shadow is insufficient. Even a linear legal descendant set may have a sublinear current minimal cover; subsequent regeneration of those covers is precisely the unresolved chronological phenomenon.

---

## 6. Why the positive facts do not prove it

The accepted positive statements stop just short of (CH):

- exhaustion cost counts distinct blocked lift tags of a face, but direct-ancestor exit can erase the face before those actual lift deaths occur;
- the atomic ledger controls the residual orientation \(\kappa(F)\mid c\), not the reverse orientation \(c\mid a_F\);
- the all-orders witness inequality is static and permits a common low-\(\operatorname{lcm}\) core;
- frozen coded repairs have no Lipschitz bound under later edge insertion;
- the root-indexed first-blocker bound gives only
  \[
  \sum_{j>i}|C_j|\le (H/2^i)^2p_i,
  \]
  which is too weak in the first few generations;
- the refinement-forest theorem says a low-area counterexample must maintain many simultaneously active refined classes, but supplies neither a Shortener strategy that harvests them nor a Prolonger strategy that robustly maintains them.

The missing implication is therefore not algebraic bookkeeping. It is an online weighted transversal theorem for the actual divisibility trace system.

---

# Final conclusion

The canonical statement is

\[
\boxed{\mathrm{BF\!-\!AH}}
\]

as formulated above: a simultaneous baseline freeze at the first prescribed trapping endpoint, exact positive ledger normalization, immutable first-exit channels, a global clock including scheduling moves, baseline-relative halving, a genuinely positive cap-crossing interval, and endpoint-inclusive estimates.

It has no terminal-delay, prelude-delay, or cap-before-freeze witness, and the accepted conditional pipeline proves

\[
\mathrm{BF\!-\!AH}\Longrightarrow L(n)=o(n).
\]

The resolution currently stops at the following exact separator:

\[
\boxed{
\begin{minipage}{0.88\linewidth}
Construct a complete online Shortener policy and a chronology-stable
potential proving (CH), or construct, against every such policy, an actual
post-trapping history satisfying
\[
\operatorname{Anc}_X(t)=\Omega(X),\qquad
\mathsf A_X(t)=o(X),\qquad
Ht=o(X).
\]
\end{minipage}}
\]

The supplied results establish neither side. A claimed full proof would need a new historical no-repetition or potential theorem; a claimed disproof would need an arbitrary-policy persistent direct-ancestor cascade.
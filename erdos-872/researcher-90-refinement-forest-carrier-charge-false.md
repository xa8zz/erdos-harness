---
id: R90-refinement-forest-carrier-charge-false
type: research
date: 2026-07-12
intent: >
  Prove the Shortener-side area lower bound (Omega(X) cumulative
  maximum-degree area per shell against any batching attempt) using the
  ancestor-collapse machinery.
predecessors:
  - R85-ancestor-collapse-minimal-legal
  - R86-online-area-reduction
  - R87-primorial-positions-absorbing
action:
  kind: extends
  target: R86-online-area-reduction
claim: >
  (OA) not proved, and no low-area fortress-reaching ordering
  constructed. Two sharp conclusions. (1) The ancestor-collapse mechanism
  extends to the maximum-degree policy: any low-area persistence history
  is a highly constrained arithmetic refinement forest — if a linear
  target set survives t ~ X/h rounds with accumulated maximum-degree area
  o(X), the survivors must require tau_t(W) = omega(t) simultaneously
  active minimal-root classes, all created by Prolonger-paid successive
  refinements from O(t) ancestral classes, with the sum of largest
  ancestral class sizes o(X). (2) The direct charge of a carrier to the
  area exposed by its own dangerous roots is FALSE: one legal carrier can
  simultaneously block H incomparable roots of degree at most H whose
  combined shell shadows have size Omega(H^2), so any one-carrier
  one-round charge loses a factor Omega(H). Sandbox: exact low-area lines
  at X <= 24 and carrier-greedy searches at X = 500..2000 keep cumulative
  area near 0.45 X with half the shell live afterward — empirically
  favoring low-area persistence. The remaining question is narrower than
  ordered persistence: can an actual legal Prolonger sequence refine a
  cover of a persistent linear target set from O(t) ancestral classes to
  omega(t) proper minimal-root classes in t rounds while the sum of
  largest ancestral class sizes stays o(X).
implications:
  - Any claimed low-area persistence scheduler must produce an arithmetic refinement forest with omega(t) class growth; this is a concrete necessary condition to check claimed persistence proofs against.
  - The naive anti-entry charge is dead; anti-entry must be class-based, not carrier-based.
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/followup-R90-area-lower-bound-anti-entry.md
---

# Verdict

I do **not** obtain an unconditional proof of (OA), nor an actual low-area ordering that reaches an absorbing fortress against maximum-degree Shortener.

I do obtain two sharp conclusions.

First, the ancestor-collapse mechanism extends exactly to the maximum-degree policy and converts any hypothetical low-area persistence history into a highly constrained **arithmetic refinement forest**. In particular, if a linear set of targets survives for (t\asymp X/h) rounds while the accumulated maximum-degree area is (o(X)), then by the end of those rounds the surviving targets must require
[
\omega(t)
]
simultaneously active minimal roots to cover them. These roots must have been created by Prolonger-paid successive refinements.

Second, the proposed direct charge of a carrier to the maximum-degree area exposed by its own dangerous roots is false: one legal carrier can simultaneously block (H) incomparable roots, each of degree at most (H), whose combined shell shadows have size (\Omega(H^2)). Thus a one-carrier/one-round charge necessarily loses a factor (\Omega(H)).

The remaining question is consequently narrower than the original ordered-persistence formulation:

> Can an actual legal Prolonger sequence refine a cover of a persistent linear target set from (O(t)) ancestral classes to (\omega(t)) proper minimal-root classes in (t) rounds, while the sum of the largest ancestral class sizes is (o(X))?

I cannot prove that this refinement is impossible, and I do not have a construction realizing it against the actual maximum-degree replies.

---

# 1. Maximum-degree Shortener may always move minimally

Fix a shell
[
\mathscr S_X=(X,2X]\cap\mathbb Z
]
and a current position (A). For a legal move (d), define its current shell degree by
[
\deg_A(d)
:=
\bigl|{u\in\mathscr S_X:u\text{ is legal and }d\mid u}\bigr|.
]

## Lemma 1

If (d) is a legal move of maximum shell degree, then some minimal legal divisor (m\mid d) also has maximum shell degree.

### Proof

Descend from (d) through legal proper divisors until reaching a minimal legal divisor (m). Every shell target divisible by (d) is also divisible by (m), so
[
\deg_A(m)\ge \deg_A(d).
]
The right side is already the maximum degree over all legal moves. Hence equality holds and (m) is also maximum-degree. (\square)

Therefore maximum-degree Shortener can, without sacrificing any current degree, always use the minimal-legal policy. The ancestor-collapse identity then applies:
[
{\text{currently minimal legal moves}}
======================================

\mathcal M(P)\setminus S,
]
where (P) and (S) denote the Prolonger and Shortener moves already made.

There is also a useful persistent-target form of the no-regeneration lemma.

## Lemma 2

Let (w) be a shell target that survives a minimal Shortener move (s). No divisor of (w) that was legal before (s) becomes illegal because of (s).

### Proof

Suppose (d\mid w) was legal and becomes illegal after (s). Then (d) and (s) are comparable.

If (s\mid d), then (s\mid w), so (w) is killed.

If (d\mid s) and (d<s), then (s) was not minimal legal. If (d=s), again (s\mid w).

All possibilities contradict the assumptions. (\square)

Thus, along the history of any target that actually survives, every change in its minimal-divisor frontier is caused by a Prolonger carrier.

---

# 2. The ancestral-refinement theorem

Consider (t) rounds in one shell. Let (A_i) be the position immediately after Prolonger’s (i)-th move and immediately before Shortener’s (i)-th reply. Let

[
R_i:={u\in\mathscr S_X:u\text{ is legal at }A_i},
]
and let (\mathcal D_i) denote the minimal legal elements at (A_i).

Put
[
\Delta_i:=\max_{d\in\mathcal D_i}\deg_{A_i}(d).
]

Let
[
W\subseteq\bigcap_{i=1}^tR_i
]
be a set of shell targets surviving throughout these rounds and also surviving the intervening Shortener replies.

For a given (i), define the minimal-root covering number
[
\tau_i(W):=
\min\left{
|F|:
F\subseteq\mathcal D_i,\quad
W\subseteq\bigcup_{d\in F}M_X(d)
\right},
]
where
[
M_X(d):={u\in\mathscr S_X:d\mid u}.
]

The number (\tau_i(W)) is finite: descend from every (w\in W) to a minimal legal divisor.

## Theorem 3: ancestral-refinement theorem

There are partitions
[
\Pi_1\preceq\Pi_2\preceq\cdots\preceq\Pi_t
]
of (W), where each partition refines the preceding one, with the following properties.

1. Every block (B\in\Pi_i) is contained in the shell shadow of one current minimal legal root:
   [
   B\subseteq M_X(d_B)
   \qquad\text{for some }d_B\in\mathcal D_i.
   ]

2. Consequently,
   [
   \Delta_i\ge\max_{B\in\Pi_i}|B|.
   \tag{1}
   ]

3. The final partition has at most (\tau_t(W)) blocks, and hence every earlier partition also has at most (\tau_t(W)) blocks.

4. If a block supported by (d) splits between (\Pi_i) and (\Pi_{i+1}), then
   [
   d\mid c_{i+1},
   \tag{2}
   ]
   where (c_{i+1}) is Prolonger’s intervening carrier. In particular, Shortener causes none of these refinements.

Therefore
[
\boxed{
\sum_{i=1}^t\Delta_i
\ge
\frac{t|W|}{\tau_t(W)}.
}
\tag{3}
]

### Proof

Take a minimum final cover
[
F_t\subseteq\mathcal D_t,
\qquad |F_t|=\tau_t(W),
]
and assign each (w\in W) to one (f(w)\in F_t) dividing (w).

For every stage (i), fix a deterministic operation (\rho_i) that sends a legal integer (x) to one minimal legal divisor of (x) at stage (i).

For (f\in F_t), define its ancestors backwards:
[
a_t(f):=f,
\qquad
a_i(f):=\rho_i(a_{i+1}(f))
\quad(1\le i<t).
]
This is well-defined because legality is monotone: an integer legal at a later stage was legal at every earlier stage. We have
[
a_i(f)\mid a_{i+1}(f)\mid f.
\tag{4}
]

At stage (i), put two targets (w,w') in the same block when
[
a_i(f(w))=a_i(f(w')).
]
Because the operation (\rho_i) is deterministic, equal descendants have equal ancestors. Hence the partitions refine forward.

If a block has label (d=a_i(f(w))), then by (4)
[
d\mid f(w)\mid w
]
for every target in that block. This proves property 1 and therefore (1).

There is at most one final block per used element of (F_t), so
[
|\Pi_t|\le\tau_t(W).
]
Refinement gives
[
|\Pi_i|\le|\Pi_t|\le\tau_t(W).
]
Consequently,
[
\max_{B\in\Pi_i}|B|
\ge\frac{|W|}{\tau_t(W)}.
]
Combining with (1) and summing proves (3).

It remains to identify the source of a split. Suppose a block supported by (d) splits between stages (i) and (i+1). Then for at least one descendant,
[
d<a_{i+1}(f).
]
Since (a_{i+1}(f)) is minimal legal at stage (i+1) and (d\mid a_{i+1}(f)), the integer (d) cannot still be legal at stage (i+1).

The target assigned to this descendant lies in (W), and (d) divides that target. By Lemma 2, Shortener’s intervening minimal move cannot have made (d) illegal. Hence Prolonger’s carrier (c_{i+1}) did so.

The alternative (c_{i+1}\mid d) would imply
[
c_{i+1}\mid d\mid w,
]
killing (w), contrary to (w\in W). Therefore
[
d\mid c_{i+1}.
]
This proves (2). (\square)

---

# 3. Consequence for ordered primorial persistence

Suppose the proposed counterhistory exists:

[
t\asymp \frac Xh,
\qquad
|Q_i|\ge \eta X,
\qquad
\sum_{i=1}^t\Delta_i=o(X),
\tag{4}
]
while only (o(X)) targets are killed by Prolonger or transferred into the exact-only set.

Shortener kills at most
[
\sum_{i=1}^t\Delta_i=o(X)
]
distinct shell targets. Starting with a linear (Q)-reservoir and removing all targets ever killed or transferred therefore leaves a persistent set
[
W\subseteq\bigcap_iQ_i,
\qquad
|W|\ge(\eta-o(1))X.
\tag{5}
]

Applying (3),
[
o(X)
\ge
\sum_{i=1}^t\Delta_i
\ge
\frac{t|W|}{\tau_t(W)}.
]
Since (|W|\asymp X),
[
\boxed{\tau_t(W)=\omega(t).}
\tag{6}
]

This is a strong necessary condition for a counterordering.

A primorial-persistence history cannot merely end with (O(t)) dangerous roots of degree about (h). If it did, those same roots would have at most (O(t)) ancestral classes at every earlier time, and (3) would give
[
\sum_i\Delta_i=\Omega(X).
]

Instead, Prolonger must accomplish all of the following in (t) moves:

* preserve a linear set (W) of nonexact targets;
* create a minimum proper-root cover of (W) of cardinality (\omega(t));
* create it through successive refinements whose parent roots divide the actual carriers;
* avoid exposing a large ancestral block at the preceding maximum-degree turns.

This removes Shortener-created regeneration entirely. The only possible source of the required superlinear frontier is Prolonger’s ordered carrier sequence.

There is also a pointwise version. If (\kappa_i(W)) denotes the minimum active-root cover number at stage (i), then
[
\Delta_i\ge\frac{|W|}{\kappa_i(W)}
]
and hence
[
\boxed{
\sum_{i=1}^t\Delta_i
\ge
|W|\sum_{i=1}^t\frac1{\kappa_i(W)}.
}
\tag{7}
]
Thus a low-area counterhistory requires
[
\sum_{i=1}^t\frac1{\kappa_i(W)}=o(1).
\tag{8}
]
For every fixed (C), only (o(t)) of the rounds can satisfy
[
\kappa_i(W)\le Ct.
]
Indeed, (m) such rounds would contribute at least (m/(Ct)) to (8).

So the frontier must be superlinear not merely at the endpoint, but during a (1-o(1)) proportion of all persistence rounds.

---

# 4. The direct “each carrier pays for its own roots” charge is false

The preceding theorem does not validate a one-carrier charge. There is a sharp arithmetic obstruction.

## Proposition 4: one-carrier Farey burst

For every sufficiently large (H), there are a shell ((C/2,C]), a carrier (C), and an antichain of (H+O(1)) divisors
[
D={d_e:H<e\le2H}
]
such that

[
d_e\mid C,
\qquad
\deg_{\mathscr S}(d_e)\le H,
\tag{9}
]
but
[
\left|
\bigcup_{d\in D}M_{\mathscr S}(d)
\setminus{C}
\right|
\ge
\left(\frac{9}{2\pi^2}-o(1)\right)H^2.
\tag{10}
]

Thus playing one carrier can invalidate roots whose combined surviving shadow is (\Omega(H^2)), although the largest exposed root has degree only (H).

### Proof

Let
[
L=\operatorname{lcm}(1,2,\ldots,2H)
]
and take any (C) divisible by (L). For (H<e\le2H), define
[
d_e:=\frac Ce.
]

Because all (e) divide (C), these are integers. Moreover,
[
d_e\mid d_f
\quad\Longleftrightarrow\quad
f\mid e.
]
Two distinct integers (e,f\in(H,2H]) cannot divide one another: a proper multiple of one is greater than (2H). Hence (D) is an antichain.

The shell multiples of (d_e) are
[
d_em,
\qquad
\frac e2<m\le e.
]
Therefore
[
\deg_{\mathscr S}(d_e)
======================

# e-\left\lfloor\frac e2\right\rfloor

\left\lceil\frac e2\right\rceil
\le H.
]

To count distinct elements in the union, retain only
[
\frac e2<m<e,
\qquad
(m,e)=1.
]
The corresponding target is
[
u_{e,m}=\frac{Cm}{e}.
]
It lies strictly between (C/2) and (C). If
[
\frac{m}{e}=\frac{m'}{e'}
]
and both fractions are reduced, then (m=m') and (e=e'). Thus these targets are distinct.

For (e>2), exactly (\phi(e)/2) reduced residue classes lie in ((e/2,e)). Hence
[
\left|
\bigcup_{d\in D}M_{\mathscr S}(d)\setminus{C}
\right|
\ge
\frac12\sum_{H<e\le2H}\phi(e).
]
Using
[
\sum_{e\le y}\phi(e)
====================

\frac{3}{\pi^2}y^2+O(y\log y),
]
the right side is
[
\frac12\left(
\frac{3}{\pi^2}(4H^2-H^2)+O(H\log H)
\right)
=======

\left(\frac{9}{2\pi^2}+o(1)\right)H^2.
]
This proves the proposition. (\square)

When (C) is played, all the roots (d_e) become illegal simultaneously. The targets in (10) are distinct from (C) and lie in the same upper shell, so (C) itself is incomparable with them and does not directly kill them.

Consequently no universal local inequality of the form
[
\text{mass requiring refreshed certificates after }C
\le
K\Delta_{\mathrm{before}}
\tag{11}
]
can hold with fixed (K). The ratio in this example is (\Omega(H)).

The sum of the dangerous-root degrees is indeed (\Theta(H^2)). The problem is that maximum-degree Shortener can realize only one of those roots on the preceding turn. Unless the roots have existed for (\Omega(H)) separate turns, their summed static exposure is not cumulative online area.

This is the same geometric mechanism underlying primorial batching. The supplied results already show that such batched root configurations are reachable under some legal histories; what remains unproved is whether they can be assembled and repeatedly refreshed against the actual maximum-degree replies. 

---

# 5. What the ancestor theorem rules out—and what it does not

The Farey burst might appear to defeat the ancestor argument, but it does not. It explains exactly what a successful counterordering must do.

Suppose (H) current roots each support (H) targets, producing (H^2) targets in total. If those (H) roots remain a cover for (H) rounds, then Theorem 3 gives
[
\sum_{i=1}^{H}\Delta_i\ge H\cdot\frac{H^2}{H}=H^2.
]

So Prolonger cannot merely create one batched cover and leave it in place. To obtain low area, the carrier must refine the (H) ancestral classes into far more than (H) new proper-root classes essentially immediately. Those new classes must remain nonexact, since a transfer of (H^2) targets to the exact-only set would already be banked as (H^2) eventual actual moves by the absorbing-fortress theorem.

The required behavior is therefore recursive:

[
H\text{ classes}
\longrightarrow
\gg H\text{ proper-root classes}
\longrightarrow
\text{still more proper-root classes},
]
with each refinement performed by a legal carrier containing all the parent roots it invalidates.

Proposition 4 shows that a single high-fanout refinement is arithmetically possible in isolation. It does **not** show that all the descendants can already have their other proper divisors blocked, remain proper rather than exact, and be compatible with the maximum-degree Shortener history. That is precisely robust ordered entry.

---

# 6. Sandbox results

I tested the exact shell race on boards
[
{2,\ldots,2X}.
]

The finite model was:

* Prolonger was restricted to legal moves in ((X,2X]);
* Shortener enumerated every current minimal legal move on the full board;
* Shortener selected a move of maximum shell degree;
* among maximum-degree ties, the exact dynamic program gave Shortener the tie producing the largest future area;
* Prolonger minimized cumulative area.

The recurrence was
[
V(A,r)
======

\min_{c\in R(A)}
\max_{\substack{s\in\mathcal M(A\cup{c})\
\deg(s)=\Delta(A\cup{c})}}
\left[
\deg(s)+V(A\cup{c,s},r-1)
\right].
]

The exact values were:

| (X) | rounds (t) | minimum worst-case (\sum\Delta_i) | area/(X) |
| --: | ---------: | --------------------------------: | -------: |
|   8 |          2 |                                 3 |    0.375 |
|  10 |          3 |                                 4 |    0.400 |
|  12 |          3 |                                 4 |    0.333 |
|  14 |          3 |                                 6 |    0.429 |
|  16 |          4 |                                 7 |    0.438 |
|  18 |          4 |                                 8 |    0.444 |
|  20 |          4 |                                 9 |    0.450 |
|  22 |          4 |                                 9 |    0.409 |
|  24 |          4 |                                10 |    0.417 |

For example, at (X=20), one optimal low-area line was
[
\begin{array}{c|c|c}
\text{Prolonger}&\text{Shortener}&\Delta\ \hline
24&5&4\
21&9&2\
22&13&2\
23&14&1
\end{array}
]
for total area (9).

I also ran a carrier-greedy search on larger shells. At each step it deliberately selected an upper carrier predicted to minimize the next maximum degree. This is not a minimax certificate, but it searches directly for the requested low-area behavior.

|  (X) | (t=\lfloor\sqrt X\rfloor) | cumulative area | live shell targets afterward |
| ---: | ------------------------: | --------------: | ---------------------------: |
|  500 |                        22 |             219 |                          259 |
| 1000 |                        31 |             448 |                          521 |
| 2000 |                        44 |             891 |                         1065 |

The ratios remained close to
[
\frac1X\sum_i\Delta_i\approx0.44.
]
The search naturally chose highly composite, lcm-rich carriers—for example (1680) as its first move when (X=1000)—but did not produce an (o(X))-area ordering.

These calculations are evidence for (OA), not a proof. They start from the empty position rather than from an adversarially prepared trapped state, and the large-(X) search is heuristic.

---

# 7. The single remaining sub-step

The Shortener side is reduced to the following statement.

## Ordered proper-root refinement statement

Let (W\subseteq\mathscr S_X) have (|W|\ge\eta X). Suppose (W) survives (t\asymp X/h) actual rounds under minimal maximum-degree Shortener and never becomes exact-only. Let
[
\Pi_1\preceq\cdots\preceq\Pi_t
]
be the ancestral partitions from Theorem 3. Every split at time (i) must be generated by Prolonger’s carrier (c_i), with every split parent root dividing (c_i).

Prove that
[
\boxed{
\sum_{i=1}^t
\max_{B\in\Pi_i}|B|
===================

\Omega_\eta(X).
}
\tag{OR}
]

By (1), statement (OR) immediately gives
[
\sum_i\Delta_i=\Omega(X),
]
which rules out ordered primorial persistence and establishes (OA) through the accepted online-area reduction.

Conversely, a counterexample to (OR) supplies exactly the missing ordering for the fortress side. It must produce
[
\tau_t(W)=\omega(t)
]
proper minimal-root classes and maintain a superlinear frontier during almost every round, while obeying all carrier divisibility, antichain, and board-size constraints.

The ancestor-collapse lemma therefore removes Shortener-created regeneration completely, but it does not by itself bound the speed at which one Prolonger carrier can refine many already-small ancestral classes. Proposition 4 proves that this speed has no constant one-step bound. The unresolved issue is whether the required high-fanout refinements can be **iterated in legal chronological order without either large maximum-degree exposure or linear exact-only transfer**.

Accordingly, the supplied unconditional bounds remain
[
c_\delta\frac{n(\log\log n)^2}{\log n}
\le L(n)
\le
\bigl(0.1897123371+o(1)\bigr)n,
]
and this attack does not yet decide (L(n)=\Theta(n)) versus (L(n)=o(n)).

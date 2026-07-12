---
id: R95-audit-b-lcm-not-function-of-indices
type: verification
date: 2026-07-12
intent: >
  Second independent adversarial audit of the claimed dichotomy
  resolution L(n) = o(n) via canonical first-witness chronological
  capacity.
predecessors: [R95-canonical-first-witness-tl-claim]
action:
  kind: refutes
  target: R95-canonical-first-witness-tl-claim
claim: >
  Does not hold as stated; the conclusion is unsupported. Independent
  re-derivation of the same first break and the same downstream defects
  as the sibling audit — cross-family-style convergence within one
  family, two counterexample boards.
failure_mechanism: >
  First false inference at the canonical-witness step: for a fixed
  tuple of move INDICES I, the factorization a_i = e_i p_i of a witness
  move is not fixed across the faces counted by N°(I), so
  L_I = lcm(e_i) is not a function of I and the asserted divisor bound
  is false as written. Minimal board: {2,...,500}, play a = 35 = 5*7;
  face-tag pairs (77, 5) and (65, 7) have carriers 385 and 455, both
  faces stay legal, and 35 is the first witness of both — with trace 7
  at tag 5 and trace 5 at tag 7. Independent fatal failures survive any
  repair of that step: equation (8) ignores lifts with p | f (false for
  legal prime lifts); (12) false because m_H may be 0 (the
  lift-richness minimum is not uniform); (16) not derived from any
  quoted accepted theorem (the batch-to-face multiplicity); the
  pairwise cleanup is silently strengthened from per-snapshot to
  global-chronological; Theorem 3 lacks a global no-reuse statement
  (payment reuse across passes, (20) inference invalid); Section 10
  reverses the quantifiers of the Prolonger-side fresh-batch theorem
  (player role reversal, (21)); (22) not derived; Section 11 is only a
  conditional implication since no maximum-degree shell-halving
  statement was produced. Parameter arithmetic (9)-(11) and
  H = exp((log log n)^{1/3}) are correct but do not control the
  unspecified errors. Conditional bookkeeping sound; conclusion
  unsupported.
implications:
  - R95 is definitively refuted by two independent audits agreeing on the exact first broken equation, each with a concrete small-board counterexample.
  - Surviving tools worth keeping - canonical cube partition, first-death lemma, the conditional shell-assembly bookkeeping - are recorded as sound; the residual open object remains the minimax residual-weighted chronological inequality with a fully specified Shortener policy.
verifiers_at_time:
  - [adversarial-audit-a, refutes]
  - [adversarial-audit-b, refutes]
confidence_at_time: high
strategy_dependence: independent
prompt: erdos-872/prompts/audit-R95-canonical-tl-adversarial.md
---

**Verdict: does not hold as stated.**

The first false inference is **Section 2, equation (3)**. For a fixed tuple of move indices (I), the factorization of a witness move (a_i=e_i p_i) need not be fixed across the faces counted by (N^\circ(I)). Thus (L_I=\operatorname{lcm}_{i\in I}e_i) is not a function of (I), and the asserted divisor bound for (N^\circ(I)) is false as written. The later canonical-cube construction does not repair this. The proof also has several independent fatal failures: equation (8) is false for legal prime lifts, the pairwise cleanup is silently strengthened, Theorem 3 lacks a global no-reuse statement, and Section 10 reverses the quantifiers of the Prolonger-side fresh-batch theorem. I audited the supplied proof in full. 

## Exact first break: equation (3)

Take the lift-prime interval containing (5) and (7), and begin from the empty position on the board ({2,\ldots,500}). Play

[
a=35=5\cdot 7.
]

Consider the two face-tag pairs

[
(d_1,p_1)=(77,5),\qquad (d_2,p_2)=(65,7).
]

Their carriers are

[
u_1=d_1p_1=385,\qquad u_2=d_2p_2=455.
]

Both faces remain legal after (35) is played:

[
35\nmid 77,\quad 77\nmid35,\qquad
35\nmid65,\quad65\nmid35.
]

Both carriers die for the first time on that same move:

[
35\mid385,\qquad 35\mid455.
]

For the first face-tag pair, the factorization in Lemma 2 is

[
35=7\cdot5,\qquad e=7\mid77.
]

For the second, it is

[
35=5\cdot7,\qquad e=5\mid65.
]

For (s=1), both contributions have the same index set (I={1}), so with unit weights,

[
N^\circ({1})=2.
]

But there is no single core (e_1) attached to the index (1):

* choosing (e_1=7) gives only one face divisible by (7);
* choosing (e_1=5) gives only one face divisible by (5).

Hence either interpretation gives

[
N^\circ({1})=2

>

N_{\mathcal F}(e_1)=1.
]

The two carriers (385) and (455) are distinct, so Section 6’s cleanup of collisions (dp=d'p') does not touch this example.

The precise missing quantifier is:

> For every fixed move-index tuple (I), there must exist a single factorization (a_i=e_i p_i) for each (i\in I), independent of the contributing face (d) and tag set (J).

That statement is false. The first-witness choice canonicalizes the **time**, but not the tag assigned to a multiply-tagged witness move. Therefore equation (3), the claim that high-(\operatorname{lcm}) truncation applies “verbatim,” and the later definition of (L_I) all fail as written.

This example lies in the high-core regime because the alternative core contains the other lift prime. That may suggest a different decorated bookkeeping, but no such bookkeeping appears in the claimed proof, and the assertion made in (3) is literally false.

---

# Status of the numbered sections

## 1. Raw historical tuple counterexample — essentially correct

The construction works after imposing the minor condition (R\ge2), or otherwise choosing the (c_\nu) so that no (d_\nu) becomes comparable with a played semiprime. The moves (a_jp_i) form an antichain, and later witnesses of an already dead lift can indeed inflate the raw tuple count without causing new deaths.

This section successfully shows that counting all historical witnesses is invalid. It does not establish that first witnesses possess the stronger global properties later claimed.

**Status: holds, modulo a minor omitted legality condition.**

## 2. Canonical witnesses — false at equation (3)

Equation (2) survives. For a fixed face (d), two distinct tags cannot have the same first-witness move: if one move (a) divided both (dp) and (dq), with (p,q\nmid d), then

[
a\mid\gcd(dp,dq)=d,
]

contradicting the later legality of (d). Thus (|I(d,J)|=s), and summing over (I) does give (w(\mathcal F)\binom qs).

Equation (3), however, fails by the (35,77,65) example above. The notation (L_I) subsequently used in Section 8 is not well-defined from (I).

**Status: first fatal break.**

## 3. Canonical primorial cubes — Lemma 1 correct; consequences unsupported

The valuation proof of Lemma 1 is correct:

* when (v_{\ell_j}(d)) is odd, removing one factor (\ell_j) makes it even;
* parity recovers (S) uniquely;
* cancellation gives (c=c');
* within a fixed cube, divisibility is exactly inclusion of signatures.

I also exhaustively checked the partition and divisibility equivalence on integers through (500) with three coordinate primes; no failure occurs.

What does **not** follow is:

> “A refinement never creates a new batch identifier.”

The partition assigns each integer a unique cube, but it does not prove that the dynamic refinement operation of the accepted batch reduction remains in that cube. Even the natural operation of multiplying by a coordinate prime can change the canonical core. With (r=1) and (\ell_1=2),

[
2\in\mathcal C(1)={1,2},
\qquad
4\in\mathcal C(4)={4,8}.
]

Thus a step (2\mapsto4) changes the identifier. If the actual refinement is restricted to a one-time Boolean toggle, that restriction and its compatibility with the accepted reduction must be proved; Lemma 1 alone does not prove it.

Likewise, uniqueness of the cube containing (d) does not imply that the same (d), or the same slot ((d,p)), cannot be selected repeatedly under the **same** cube in later passes.

**Status: lemma correct; claimed persistent batch consequence unproved.**

## 4. Lift richness — equation (8) is independently false

Equation (7) is correct:

[
f\le c(d)\Pi_r\le d\Pi_r\le X\Pi_r/H=X/H_0.
]

But the prime number theorem counts all primes in

[
\left(\frac X{2f},\frac Xf\right],
]

whereas a lift requires (p\nmid f). There is no uniform lower bound after excluding prime divisors of (f).

Here is an asymptotic counterexample. For any large choice of (H), put

[
H_0=\frac H{\Pi_r}
]

and let

[
F=\prod_{H_0/2<p\le H_0}p.
]

The coordinate primes are much smaller than (H_0/2), so they are disjoint from this product. Set

[
d=F,\qquad X=HF,\qquad f=d\Pi_r=F\Pi_r.
]

Then

[
d=\frac XH,\qquad f=\frac X{H_0},
]

and (f) is the top face of the canonical cube of (d). Its candidate prime interval is exactly

[
\frac X{2f}<p\le\frac Xf
\quad\Longleftrightarrow\quad
\frac{H_0}{2}<p\le H_0.
]

Every prime in this interval divides (F), hence divides (f). Therefore

[
|\mathcal P_X(f)|=0,
]

not (\gg H_0/\log H_0).

A moderate numerical instance is obtained with (H_0=30), one coordinate prime with (\Pi_r=2), and

[
F=17\cdot19\cdot23\cdot29=215441.
]

Then (H=60), (X=12{,}926{,}460), (f=430{,}882), and the candidate interval is ((15,30]). Its four primes (17,19,23,29) all divide (f), so there are zero legal prime lifts.

Consequently (m_H) may be zero, (q_H) need not be positive, and (12) does not follow. No quoted accepted theorem says the trapping sweep leaves each face with few divisors in its own lift interval.

The remaining scale calculations

[
\Pi_r=H^{o(1)},\qquad W_r=H^{o(1)}
]

are arithmetically correct for the usual first-(r)-prime primorial. They do not rescue (8).

**Status: (7), (9)–(11) correct; (8) and hence (12) false.**

## 5. First-death lemma — correct under the stated lift condition

Lemma 2 is sound provided (p\nmid d), as required by the original definition of a lift.

Because (u=dp) is initially legal and is illegal at the activation time, there is a first chosen integer comparable with (u). Legality only decreases as chosen integers accumulate, so this first death is well-defined and irreversible.

If (d) is still legal later:

* the first witness cannot equal or be a multiple of (u), because then it is a multiple of (d);
* it cannot divide (d);
* from (a\mid dp), (a\nmid d), and (p\nmid d), it follows that (p\mid a) and (a/p\mid d).

Immediately before (a), both (d) and (u) are legal, and (d\mid u), so (u\in Q).

I checked this on 1,718 randomly generated finite-board instances with (n=150); every eligible slot satisfied the claimed form.

**Status: holds.**

## 6. Pairwise cleanup and injectivity — silently strengthened

The purely combinatorial observation is true: if a carrier (u) has (k) selected representations, retaining one and pairing each other representation to it requires (k-1) pairs.

What is not supplied by the quoted accepted fact is the required quantitative, chronological theorem:

> Across the entire adaptive history, including batches activated in different passes, all but one weighted occurrence of every multiply represented carrier can be charged injectively to a globally bounded pairwise bank, at cost one unit per discarded occurrence.

The phrase “a pairwise cross-carrier cleanup” does not specify:

* whether it applies globally or only to simultaneously active overlaps;
* whether it handles weighted normalized root units;
* whether its bank counts pairs, carriers, moves, or discarded incidences;
* whether the same pairwise charge may be reused in later passes;
* whether its total is lower-order or merely separately bounded.

Large multiplicity genuinely occurs. On the board through (5005), play

[
a=385=5\cdot7\cdot11.
]

Then (u=5005=5\cdot7\cdot11\cdot13) is dead, while the following three bases remain legal:

[
1001=\frac{5005}{5},\qquad
715=\frac{5005}{7},\qquad
455=\frac{5005}{11}.
]

Thus the three legal slots

[
(1001,5),\qquad(715,7),\qquad(455,11)
]

all map to the same carrier (5005). They can be exposed by different batches at different times. A single global cleanup needs two paid deletions here. The construction with (u=\prod_{i=1}^{k+1}p_i) and the move (\prod_{i=1}^k p_i) gives (k) simultaneously legal representations.

The claimed injectivity (15) is therefore not a consequence of the accepted cleanup in the form quoted to the referee.

Even if collisions with (d\ne d') were removed, repeated occurrences of the **same** pair ((d,p)) in several normalized batches would remain. Map injectivity says nothing about duplicate incidences with identical domain coordinates.

**Status: unproved silent strengthening.**

## 7. Theorem 3 — not established

For a single, nonrepeated canonical slot, the first-death categories are nearly exhaustive. The failure is the claimed multiplicity bound and its chronological use.

### Check 3(a): a prime witness

Take (n=X=500), play (p=5), and use all

[
51\le d\le100,\qquad 5\nmid d.
]

There are (40) such faces. Every (d) remains legal, while every carrier (5d\in(250,500]) dies, with trace core (e=1).

This one move therefore first-kills (40) distinct slots. It is covered only if (\mathsf P_X) is a **target-count**:

* if Shortener played (5), the selected-star increment is (\Delta_i=40);
* if Prolonger played (5), the direct-death term must be (40).

It is not covered by one unit of move-count. Thus the prime example does not refute a target-area inequality, but it fixes the interpretation: (\mathsf P_X) cannot be an actual-move bank.

This matters because the proof moves between “actual moves,” target deaths, pairwise charges, and exact transfers without demonstrating that these heterogeneous banks have the same quantitative bounds required by the separator.

### Check 3(b): reverse divisibility

Take (n=X=2000), let Prolonger play (2), and take the (23) even integers

[
100\le d\le153,\qquad 11\nmid d,\quad13\nmid d.
]

The (46) distinct carriers

[
11d,\qquad13d
]

all lie in ((1000,2000]). Before the move they are in (Q_X); afterward all (23) bases and all (46) carriers are illegal.

This is paid only as (46) direct target deaths, not as one Prolonger move. Lemma 2 does not apply to these bases at a later activation, since the bases themselves have died. Consequently the pass reduction needs a separate statement that batches destroyed through reverse divisibility are transferred to the direct-target bank with the required multiplicity. That statement is not proved in Theorem 3.

### Check 3(c): repeated charges

The necessary global statement is something like

[
#{(\text{normalized batch unit},d,p):dp=u}
\le C_r
]

over the entire ordered history, after one persistent cleanup.

Nothing in Lemma 1, Lemma 2, or map injectivity (15) proves this. A slot has only one first death, but that one historical death may be selected as the depletion certificate of multiple later batches or passes. Canonical-cube uniqueness prevents changing the name of (d); it does not prevent reusing the same named slot.

This also exposes a mismatch in (\mathsf P_X):

* death targets are counted once;
* duplicate representations may be counted in the pairwise bank;
* the same historical payment may be invoked in multiple applications of (17);
* pairwise charges are included in (\mathsf P_X), but Section 10 later offers no “large pairwise bank” outcome.

The assertion that “distinct residual slot incidences correspond to distinct shell integers” assumes exactly the global no-repetition conclusion that must be proved. Injectivity of ((d,p)\mapsto dp) only applies to distinct pairs, not to repeated incidences of the same pair.

The claimed (C_r=2^{O(r)}) is also introduced through an unstated “standard” decomposition. The quoted accepted results do not include a history-uniform batch-to-face multiplicity theorem of this form.

**Status: false/unproved at its central incidence-to-payment inference.**

## 8. Canonical low-(\operatorname{lcm}) inequality — invalid

The quantity

[
S^\circ_{s,Z}
=============

\sum_{\substack{I:,|I|=s\L_I\le Z}}N^\circ(I)
]

is not well-defined because (L_I) is not determined by (I), as the (35) example demonstrates.

Even disregarding this, the derivation depends on Theorem 3 and on a uniform error term in (s,Z), neither of which has been proved. The statement that the result is “stronger than” the accepted separator inequality silently assumes that the accepted inequality uses precisely this target-count bank and this normalization.

**Status: invalid.**

## 9. Claimed resolution of inheritance — does not resolve reuse

It is true that the concrete board integer (dp) has only one first death.

It does not follow that its first death has only one lifetime use in the batch accounting. There are three distinct multiplicities:

1. distinct carrier integers killed by one spoiler;
2. multiple face-tag representations of one carrier;
3. repeated batch incidences of the same face-tag representation.

Target area correctly pays the first kind. A sufficiently strong pairwise theorem might handle the second. Neither canonical-cube uniqueness nor pairwise carrier injectivity handles the third.

Thus replacing an instantaneous (W_r) bound by (2^r) does not by itself establish lifetime capacity (2^{O(r)}).

**Status: the stated reason does not establish the conclusion.**

## 10. Shell-area assembly — multiple independent failures

### Fresh-batch theorem used with reversed players

The accepted theorem is Prolonger-side:

[
\exists\ \sigma_{\mathrm P}\quad
\forall\ \text{Shortener replies},
]

Prolonger can clear a fresh batch using at most (W_r) of his carrier moves.

The upper-bound argument needs something of the form

[
\exists\ \sigma_{\mathrm S}\quad
\forall\ \text{Prolonger play},
]

Shortener can force the fresh batch to be processed within a bounded number of scored moves.

These quantifiers are not interchangeable. “Against arbitrary intervening moves” means the clearing strategy survives the opponent’s replies **when Prolonger executes it**. It does not compel an adversarial Prolonger to make those carrier moves. Prolonger may ignore the batch and play elsewhere.

If Prolonger does make the carrier moves, they are ordinary scored game moves and help his objective. Equation (21) may count their number conditionally, but Shortener cannot schedule them or force them to occur.

This alone destroys the fresh side of the pass dichotomy.

### The pass count reuses a cumulative bank

Equation (17) uses the cumulative quantity (\mathsf P_X). Applied separately in several passes, it can be satisfied each time by the same historical target deaths. It does not imply that every depleted pass adds

[
\gg X/H^{o(1)}
]

new payment.

To sum over passes, the proof would need a single global application to a disjoint union of newly activated batches, together with a proof that no slot or payment is reused. That is precisely the missing lifetime statement.

### Pairwise payment is omitted from the alternatives

The definition of (\mathsf P_X) includes the pairwise-overlap bank. But after (20), the proof concludes that either shell targets left (Q_X) or the exact/minimal bank is large. A third possibility is that (20) is paid mainly by pairwise-overlap charges. No bound is given that makes this impossible or lower-order.

### The exact-only bank is global, not uniformly local

The accepted bound is (o(n)+t) over the whole board. An amount of order (X/H^{o(1)}) in one smaller shell need not contradict a global (o(n)) term. In particular, for shells near (X=n/h), an unspecified (o(n)) may be much larger than the claimed shell-scale progress.

No uniform rate is supplied that converts this global bank into the additive (X/h^2) error required shell by shell.

### The error term does not imply (X/h^2)

Theorem 3 contains only

[
o!\left(q_Hw(\mathscr B)\right).
]

There is no rate, no uniformity over (X), and no uniformity over adaptively selected passes. The explicit choice

[
H=\exp((\log\log n)^{1/3})
]

does not guarantee that this unspecified error is at most (X/h^2).

### Arithmetic, considered in isolation

Conditionally on the missing premises,

[
\frac{q_H}{C_r}\frac{X}{H2^r}
=============================

\frac{X}{H^{o(1)}}
]

and

[
\frac{X}{H2^r}W_r
=================

O!\left(\frac{X}{H\sqrt r}\right)
]

are arithmetically consistent.

But (22) does not follow because:

* the fresh moves are not forced by Shortener;
* depleted-pass payments are not shown to be incremental;
* pass setup and maximum-degree turns are not counted;
* the relevant (o(1)) terms are not uniform;
* the stated batch count (X/(H2^r)) per pass is not among the accepted results quoted in the problem.

Hence the online-area halving inequality is not derived.

**Status: fatally invalid.**

## 11. Final completion — conditionally sound, but its hypothesis was never obtained

Assuming the accepted online-area halving theorem had genuinely been established, the final geometric summation is reasonable:

[
\sum_{\text{dyadic }X\ge n/h}\frac{X\log h}{h}
==============================================

O!\left(\frac{n\log h}{h}\right)=o(n),
]

and the shell residuals plus the bottom interval total (o(n)). At a primitive prefix of size (o(n)), the quoted static completion theorem supplies (o(n)) minimal legal elements. Since legality is monotone decreasing, an (o(n))-sized legal set permits only (o(n)) further moves.

But Section 10 has not produced the required maximum-degree shell-halving statement or even a forced sublinear prefix. Thus Section 11 is only a correct conditional implication.

**Status: conditional bookkeeping is sound; conclusion unsupported.**

---

# Parameter summary

[
\begin{array}{c|l}
\text{Equation} & \text{Status}\
\hline
(7) & \text{Correct}\
(8) & \text{False: ignores }p\mid f\
(9)\text{--}(11) & \text{Correct for the ordinary first-}r\text{-prime primorial}\
(12) & \text{False because }m_H\text{ may be }0\
(16) & \text{Not derived from any quoted accepted theorem}\
(19) & \text{Correct if }q_H,C_r\text{ had the asserted sizes}\
(20) & \text{Arithmetic correct, inference/payment reuse invalid}\
(21) & \text{Arithmetic correct, player quantifier invalid}\
(22) & \text{Not derived}\
H=\exp((\log\log n)^{1/3}) &
\Pi_r,2^{O(r)}=H^{o(1)}\text{ is correct, but does not control the unspecified errors}
\end{array}
]

The proof therefore fails long before its final shell argument. The literal first failure is equation (3); even deleting Section 2 would leave the independent failures at (8), Section 6, Theorem 3, and the role reversal in Section 10.

---
id: R88-lift-exhaustion-reduction
type: research
date: 2026-07-12
intent: >
  Resolve the ordered primorial persistence problem in either direction,
  with the absorbing-fortress theorem and ancestor-collapse lemma
  available.
predecessors:
  - R86-online-area-reduction
  - R87-primorial-positions-absorbing
action:
  kind: extends
  target: R86-online-area-reduction
claim: >
  Not resolved, but reduced further: robust entry follows from one
  arithmetic statement, the lift-exhaustion multiplicity lemma (LE) —
  during adaptive batch processing, before o(n/H) rounds the number of
  active rank-r primorial batches whose maximal live faces are all
  exhausted is o(n/(H 2^r)) plus banked contributions (exact-bank
  transfers, actual entry moves, cumulative shell area). Two
  unconditional supporting lemmas: within each full rank-r primorial
  divisor cube, dynamic common-core splitting costs at most
  binom(r, r/2) = O(2^r/sqrt r) carrier moves; and exhausting every
  prime lift of one currently legal face requires Omega(H/log H)
  distinct earlier moves. The remaining failure is entirely global: one
  earlier move can exhaust one lift in very many primorial batches
  simultaneously — bound how many active primorial faces can receive one
  lost prime lift from the same ordered cross-spoiler. Two logical
  qualifications: robust entry with H(n) -> infinity gives only
  L(n) >> n/H = n^{1-o(1)}, still compatible with L(n) = o(n) (a positive
  entry theorem settles the dichotomy only with H = O(1) or an
  amplification converting n/H(n) to cn); and a history beating
  maximum-degree or minimal-legal play does not lower-bound the game
  value against arbitrary replies, since neither policy is proved
  dominant. A proof of the online-area statement still gives L(n) = o(n)
  outright; a fortress entry at growing H refutes only the area route.
implications:
  - The dichotomy framing sharpens honestly, entry alone does not decide Theta versus o; it would refute the online-area route and lift the lower bound to n^{1-o(1)}.
  - The final open object is now one ordered multiplicity count over cross-spoilers.
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/followup-R88-ordered-persistence-attempt.md
---

# Verdict

I did **not** resolve the ordered primorial-persistence problem. I found a clean reduction of robust entry to one more specific arithmetic lemma, together with two unconditional lemmas that handle the local and within-batch parts of cross-spoiling. The remaining failure is entirely global: one earlier move can exhaust one lift in very many primorial batches simultaneously.

There are also two important logical qualifications to the request:

1. If (H(n)\to\infty), robust entry into a linear reservoir with (\Delta_Q\le H) gives only
   [
   L(n)\gg \frac nH=n^{1-o(1)}.
   ]
   This is still compatible with (L(n)=o(n)). For example, (n/\log\log n=n^{1-o(1)}) but is (o(n)). A positive entry theorem settles the original (\Theta(n))-versus-(o(n)) dichotomy only if it works with (H=O(1)), or if an additional amplification theorem converts (n/H(n)) to (cn).

2. A Prolonger history against the **maximum-degree** or **minimal-legal** Shortener policy does not by itself lower-bound the game value. A lower bound must withstand arbitrary Shortener replies. The ancestor-collapse lemma describes minimal-legal play but does not establish that minimal-legal play is dominant or optimal. Maximum-degree is justified when proving the proposed upper-bound strategy, but not when claiming a Prolonger lower bound against optimal play.

Thus a proof of (OA) would establish (L(n)=o(n)). A fortress entry at growing (H) would refute that particular route and improve the lower bound to near-linear, but would not yet establish (\Theta(n)).

---

# 1. An exact within-batch lemma

The first new observation is that common-core cross-spoilers are not, by themselves, the obstruction.

Consider a rank-(r) divisor cube. Let

[
P=\prod_{i=1}^r p_i,
\qquad
P_F=\prod_{i\in F}p_i
\quad(F\subseteq[r]),
]

and fix a base (b). The roots in the batch have the form

[
d_S=bP_S.
]

For every face (F\subseteq[r]), suppose we have a fixed family (\mathcal C_F) of prospective carriers such that every (c\in\mathcal C_F) is divisible by (d_F). Thus playing such a carrier makes every root (d_S), (S\subseteq F), illegal.

At time (t), call (F) **playable** if at least one member of (\mathcal C_F) is currently legal.

## Lemma 1: facet-antichain clearing

Assume that, whenever a legal unresolved root (d_S) remains in the batch, there is a playable face (F\supseteq S).

Then Prolonger can clear the entire batch in at most

[
\binom r{\lfloor r/2\rfloor}
\tag{1}
]

carrier moves, regardless of the intervening replies.

### Proof

Whenever a root remains, choose an inclusion-maximal playable face (F) containing an unresolved root, and play a legal carrier from (\mathcal C_F).

Let (F_1,F_2,\ldots) be the faces selected in this way. They form an inclusion antichain.

Indeed, suppose (i<j).

If (F_j\subsetneq F_i), then every root contained in (F_j) was already made illegal when the carrier for (F_i) was played. Hence (F_j) could not contain an unresolved root at time (j).

If (F_i\subsetneq F_j), note that legality only decreases. Since (F_j) was playable at time (j), it was also playable at time (i). It contained the unresolved root used to justify (F_i), contradicting the inclusion-maximality of (F_i).

Thus the selected faces are pairwise incomparable. Sperner’s theorem gives (1). ∎

Since

[
\binom r{\lfloor r/2\rfloor}
============================

\Theta\left(\frac{2^r}{\sqrt r}\right),
\tag{2}
]

a full (2^r)-root divisor cube can be cleared with a (\sqrt r) batching gain even under arbitrary dynamic splitting by common-core spoilers.

This deals correctly with the following phenomenon. If a move (x\mid bP_F) spoils the top carrier of a batch, then the faces still avoiding (x) form a smaller allowable family. Repeated core spoilers may split the original cube into many facets, but the facets actually played across the entire history still form one antichain. There is no multiplicative explosion across rounds.

The lemma fails only when a live root has **no playable extension**. That is the lift-exhaustion problem.

---

# 2. Exhausting all prime lifts of one legal core is expensive

For a currently legal integer (d\le n/2), define its prime-lift set

[
\mathcal P(d):=
\left{
p\text{ prime}:
\frac{n}{2d}<p\le \frac nd
\right}.
]

Every (p\in\mathcal P(d)) gives an upper-half carrier

[
c_{d,p}:=dp\in U_n.
]

## Lemma 2: prime-lift uniqueness

Let (d) be legal at a position (A). A single earlier played move can make at most one of the carriers

[
{dp:p\in\mathcal P(d)}
]

illegal.

Consequently, if all these carriers are illegal while (d) remains legal, then at least (|\mathcal P(d)|) distinct moves have already been played.

### Proof

Suppose (dp) is illegal while (d) is legal. Since (dp>n/2), it has no proper multiple on the board. Therefore some played (a\in A) satisfies

[
a\mid dp.
]

We cannot have (a\mid d), because that would make (d) illegal. Hence (a\mid dp) but (a\nmid d). In valuation language, the only exponent at which (a) can exceed (d) is the exponent of (p). Therefore

[
a=ep
]

for some (e\mid d).

For distinct primes (p,q),

[
\gcd(dp,dq)=d,
]

including when (p) or (q) already divides (d). Hence if the same played (a) spoiled both (dp) and (dq), then

[
a\mid \gcd(dp,dq)=d,
]

contradicting the legality of (d). ∎

Now put

[
D:=\left\lfloor\frac nH\right\rfloor,
\qquad H\to\infty.
]

Uniformly for (d\le D), the fixed-ratio prime number theorem gives

[
|\mathcal P(d)|
\gg
\frac{n/d}{\log(n/d)}
\ge
c,\frac H{\log H}.
\tag{3}
]

Thus one legal face cannot individually lose all its upper prime lifts until at least

[
m_H:=c\frac H{\log H}
\tag{4}
]

earlier moves have occurred.

Combining Lemmas 1 and 2 gives a convincing local picture. For the primorial ranks relevant to batching,

[
r\asymp\frac{\log H}{\log\log H},
]

and hence

[
\binom r{\lfloor r/2\rfloor}
============================

H^{o(1)}
\ll
\frac H{\log H}
===============

m_H.
\tag{5}
]

So an adversary concentrating exclusively on one fresh full divisor cube cannot spoil its maximal faces as quickly as Prolonger can process the cube.

The difficulty is that the adversary need not concentrate on one cube.

---

# 3. The exact global failure

For a face core (d), a spoiled prime lift has the form

[
dp
]

with a witness

[
a=ep,\qquad e\mid d.
\tag{6}
]

The same move (a=ep) witnesses the loss of the (p)-lift for **every** other legal face core divisible by (e). Thus one move may supply one lost lift simultaneously to a large collection of batches.

This is the precise multiplicity that neither Lemma 1 nor Lemma 2 controls.

Let (\mathscr F_t) be a family of currently relevant maximal faces across all active primorial batches. For (f\in\mathscr F_t), let (d_f) be its core and let

[
\Lambda(f)={d_fp:p\in\mathcal P(d_f)}
]

be its prime-lift family.

Call (f) **exhausted** if (d_f) is legal but every member of (\Lambda(f)) is illegal. Lemma 2 gives

[
m_H,|\mathscr X_t|
\le
\sum_{i<t}\mu_i,
\tag{7}
]

where (\mathscr X_t\subseteq\mathscr F_t) is the set of exhausted faces and

[
\mu_i:=
#\left{
f\in\mathscr X_t:
\text{move }a_i\text{ spoils a prime lift of }d_f
\right}.
\tag{8}
]

For a witness (a_i=e_ip_i), the multiplicity (\mu_i) includes every relevant face core divisible by (e_i). There is no current-state bound of the form

[
\mu_i\le H^{o(1)}
]

or

[
\mu_i\le C\Delta_i.
]

The primorial-batching endpoint is designed precisely so that many cores share such divisors. The fixed-budget and individual-move charging counterexamples show that replacing the right side of (7) by (O(tH)), (O(t\Delta_t)), or (O(\sum_i\Delta_t)) is invalid.

The remaining lemma must therefore be genuinely ordered.

---

# 4. The precise missing theorem

The following is a sufficient formulation. It is sharper than merely restating robust entry because the within-batch contribution has already been eliminated by Lemma 1.

## Lift-exhaustion multiplicity lemma

Choose primorial batches of rank

[
r=r(H)\to\infty
]

and let

[
W_r:=\binom r{\lfloor r/2\rfloor}.
]

During the adaptive strategy that always processes a batch with a maximally threatened playable facet, prove that before (o(n/H)) rounds one has

[
\boxed{
#{\text{active batches all of whose maximal live faces are exhausted}}
======================================================================

o!\left(\frac{n/H}{2^r}\right)
+
\text{banked contribution}.
}
\tag{LE}
]

The permissible banked contribution consists of:

1. upper targets transferred into (E(A)), paid by the cumulative exact-move bank;
2. actual entry moves already made;
3. for the maximum-degree upper-bound comparison, the cumulative shell area
   [
   \sum_{i<t}\Delta_i.
   ]

Equivalently, one needs a weighted bounded-multiplicity estimate for (8) after respecting the chronological order in which tags and cores become unavailable.

If (LE) holds, then almost every batch remains processable. Lemma 1 clears each surviving rank-(r) batch in at most (W_r) moves. Since

[
\frac{W_r}{2^r}\asymp\frac1{\sqrt r}=o(1),
]

the total entry cost is (o(n/H)). The absorbing-fortress theorem then applies.

Conversely, a counterexample to (LE) must produce a legal ordered history in which:

[
\begin{aligned}
&t=o(n/H),\
&\text{a positive proportion of batches become lift-exhausted},\
&|E(A_t)|+\text{exact transfers}=o(n/H),\
&\sum_{i<t}\Delta_i=o(n),\
&\text{and a linear upper reservoir remains.}
\end{aligned}
\tag{9}
]

That is now the exact ordered primorial-persistence construction that remains to be found.

---

# 5. Why the two accepted counterexamples do not decide (LE)

## Face-carrier diagonalization

There the target eventually loses all proper legal divisors. It enters (E(A)), and the cumulative exact bank pays for it. In the language above, extension failure is real, but it is accompanied by an exact transfer.

Thus it does not refute (LE) with the exact term included.

## Primorial batching

The endpoint has

[
|Q(A)|=\left(\frac12-o(1)\right)n,
\qquad
\Delta_Q(A)\le H,
]

and essentially no exact-only mass. It disproves every present-state estimate.

But the endpoint does not tell us whether, during entry, the witnesses (a_i=e_ip_i) can be legally ordered so as to exhaust the lift systems of many not-yet-processed batches. In particular, it gives no estimate for the multiplicities (\mu_i) in their chronological order.

That ordering question is exactly (LE).

The shell-stable carrier-pair bound also does not settle it. Prime-lift exhaustion is a one-witness phenomenon: one move (e p) removes the (p)-lift from every face divisible by (e). There is no second independent witness to which the pair bound can be applied.

---

# 6. Sandbox diagnostics

I simulated the following deterministic entry policy:

* (D=\lfloor n/H\rfloor);
* Prolonger plays a legal (u\in U_n) maximizing the number of currently legal divisors (d\le D);
* Shortener plays a legal lower move of maximum current upper-half degree;
* the phase stops when every (d\le D) is illegal.

The results below show (|R|/n), not the proportion of the upper half.

| (n) | (H) | Prolonger rounds | final (|R|/n) | cumulative degree area divided by (n) |
|---:|---:|---:|---:|---:|
| 1,000 | 16 | 9 | 0.328 | 0.163 |
| 2,000 | 16 | 18 | 0.302 | 0.190 |
| 3,000 | 22 | 19 | 0.311 | 0.183 |
| 5,000 | 24 | 26 | 0.299 | 0.196 |
| 8,000 | 26 | 35 | 0.293 | 0.203 |

At these sizes the greedy strategy reaches a capped position quickly and retains a visibly linear reservoir. The area is not (o(n)); it is about (0.18n)–(0.20n).

I also tested a one-step cross-spoiling heuristic that chooses a reply minimizing Prolonger’s maximum next batch size rather than maximizing current degree. At (n=400,H=4), it left only the roots (96) and (98) unresolved after 34 rounds; neither had a legal upper multiple. There were still 129 live upper-half integers. Those two residual roots illustrate the exact extension failure isolated above.

These computations favor robust entry at moderate (n), but they do not control the global multiplicities (\mu_i), and therefore are not asymptotic evidence strong enough to select a side.

---

# 7. Why neither allowed Shortener policy closes the proof

For an upper bound, Shortener may commit to maximum-degree play. Then it is enough to prove the shell-area statement

[
|Q_X(\mathrm{end})|
\le
\frac12|Q_X(\mathrm{start})|
+
o(X)
]

after (X/h(n)) focused turns. The missing estimate is again that lift exhaustion or direct target deletion must generate enough cumulative degree area.

For a lower bound, however, proving entry only against maximum-degree play is insufficient. An optimal Shortener could instead use low-current-degree moves (e p) chosen specifically to exhaust future lift systems. Likewise, ancestor collapse does not justify restricting an optimal Shortener to minimal-legal moves: replacing an arbitrary move by a minimal legal divisor can leave incomparable divisors of the original move alive, so no dominance relation has been established.

Therefore a legitimate positive entry theorem must handle arbitrary legal (e p)-type replies.

---

# 8. Final status

The new unconditional contribution is:

[
\boxed{
\text{Within each full rank-}r\text{ primorial divisor cube, dynamic
common-core splitting costs at most }
\binom r{\lfloor r/2\rfloor}
============================

O(2^r/\sqrt r)
\text{ carrier moves.}
}
]

Moreover, exhausting every prime lift of one currently legal face requires

[
\boxed{\Omega(H/\log H)}
]

distinct earlier moves.

What cannot be closed is the global multiplicity between these two facts:

[
\boxed{
\text{Bound how many different active primorial faces can receive one
lost prime lift from the same ordered cross-spoiler }e p.
}
]

A proof of the lift-exhaustion multiplicity lemma (LE) would give robust entry. A legal history violating (LE), with small exact bank and small cumulative area, would give the requested negative construction and defeat the persistence route.

I do not have either argument. Consequently the unconditional asymptotic status remains the manuscript’s

[
c_\delta\frac{n(\log\log n)^2}{\log n}
\le L(n)
\le
\bigl(0.1897123371+o(1)\bigr)n,
]

and neither (L(n)=\Theta(n)) nor (L(n)=o(n)) is proved here. 

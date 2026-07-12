---
id: R86-online-area-reduction
type: research
date: 2026-07-12
intent: >
  Prove or disprove the trapped-residual bounded-multiplicity charge with
  the dynamic exact-only bank, stress-tested against both known
  counterexample mechanisms.
predecessors:
  - R82-charging-inequality-disproved-exact-only-bank
  - R84-primorial-batching-counterexample
action:
  kind: extends
  target: R82-charging-inequality-disproved-exact-only-bank
claim: >
  The primorial-batching construction disproves the trapped-residual
  charge (33) and, more generally, every current-state charge to
  individual earlier moves with capacity O(Delta) per move. Two positive
  results survive. (1) An unconditional shell-stable PAIR charge: within
  a dyadic shell S_X, all but an exceptional set of size
  N_{<2s}(X) + D_2(n) (k choose 2)/(s choose 2) live shell targets are
  covered with the maximum facet degree Delta_X(A) at capacity X/(2s)
  per carrier pair; genuine bounded multiplicity, but to carrier pairs,
  which is quadratically too weak on batched positions. (2) An exact
  reduction: L(n) = o(n) follows from one online-area statement (OA) —
  along any play under the maximum-degree Shortener policy, processed
  shell by shell, the cumulative maximum-degree area suffices to clear
  each shell in O(X log h / h) Shortener turns. The pair charge, the
  one-facet-per-target property, the divisor-multiplicity theorem, and
  the exact-only bank provably do NOT establish (OA). The single
  unresolved sub-step, stated without reference to any charging scheme:
  the ordered primorial persistence problem — after the trapping sweep,
  can Prolonger legally order and continually refresh primorial-batched
  or cross-carrier moves against the actual maximum-degree Shortener
  policy so that for some shell S_X and h(n) -> infinity, t ~ X/h(n)
  rounds keep |Q_i| >> X while the accumulated maximum degrees satisfy
  sum Delta_i = o(X) and only o(X) targets are killed by Prolonger or
  transferred to the minimal legal set. A yes gives a genuinely new
  lower-bound mechanism; a quantitative no proves (OA) and hence
  L(n) = o(n). The needed theorem is a lower bound on the cumulative
  maximum-degree area during the creation and refresh of a
  primorial-batched trapped state.
implications:
  - Sublinear side is now equivalent to a single quantitative statement about cumulative degree area, with no residual freedom in the charging formalism.
  - The two counterexamples resolve opposite static failure modes; only the ordered, history-realizable version remains.
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/followup-R86-trapped-residual-charge-with-exact-bank.md
---

# Verdict

The new primorial-batching construction decisively disproves (33), and in fact disproves every **current-state charge to individual earlier moves** whose capacity is (O(\Delta)) per move.

I did **not** obtain either:

1. a proof of the genuinely history-sensitive, shell-stable charge needed for (L(n)=o(n)); or
2. a legal Prolonger history against the specified maximum-degree policy that disproves such a charge.

The static primorial endpoint is not by itself a dynamic counterexample. It controls the **final** maximum degree, whereas the relevant quantity is the cumulative area under the maximum degree during the history that creates the endpoint.

I can, however, give:

* an unconditional shell-stable charge to **pairs** of earlier carriers;
* an exact reduction of (L(n)=o(n)) to one sharply stated “online area” lemma;
* a proof that the pair charge, the one-facet-per-target property, Theorem 1, and the exact-only bank still do not establish that lemma;
* a precise description of the one step that remains.

---

# 1. The codimension-one representation is exact

Let (A) be a primitive position, and let (u) be any currently legal integer. It need not lie in the global upper half.

Call

[
F_A(u):=
\left{
\frac{u}{p}:
p\mid u\text{ prime},\ \frac up\ge2,\ \frac up\text{ is legal relative to }A
\right}
]

the set of legal facets of (u).

Let (E(A)) denote the minimal legal elements, namely legal (u) with no legal proper divisor, and put

[
Q(A):={\text{legal }u}\setminus E(A).
]

## Lemma 1

For every legal (u),

[
u\in Q(A)
\quad\Longleftrightarrow\quad
F_A(u)\ne\varnothing .
\tag{1}
]

### Proof

The reverse implication is immediate.

Suppose (d\mid u), (2\le d<u), and (d) is legal. Choose a prime (p\mid u) for which

[
v_p(d)<v_p(u).
]

Then (d\mid u/p).

Assume (u/p) is illegal. Some (a\in A) is comparable with (u/p). The possibility

[
a\mid \frac up
]

would imply (a\mid u), contradicting the legality of (u). Therefore

[
\frac up\mid a.
]

But then (d\mid a), contradicting the legality of (d). Hence (u/p) is legal. ∎

Thus there is no hidden deeper-divisor hierarchy: once every codimension-one facet of a live target is illegal, every proper divisor is illegal.

## Lemma 2: one move blocks at most one facet of a surviving target

Let (u) remain legal after a move (a). Then (a) can make at most one member of

[
\left{\frac up:p\mid u\text{ prime}\right}
]

illegal.

### Proof

If (a\mid u/p), then (a\mid u), so (u) would not survive. Hence any newly blocked facet of a surviving (u) must satisfy

[
\frac up\mid a.
]

If this held for two distinct primes (p,q\mid u), then

[
u
=

\operatorname{lcm}\left(\frac up,\frac uq\right)
\mid a,
]

again contradicting the survival of (u). ∎

This is the strongest generic local property available. Unfortunately, it is not by itself sufficient: one carrier can block one facet for each of a linear number of different targets simultaneously.

---

# 2. A shell-stable charge to pairs of carriers

For a legal (u), define the number of blocked facets

[
b_A(u):=
#\left{
p\mid u:
\frac up\ge2,\
\frac up\text{ is illegal relative to }A
\right}.
]

Put

[
D_2(n):=\max_{m\le n^2}\tau(m).
]

The standard maximal-order estimate for the divisor function gives

[
D_2(n)
======

\exp!\left(
O!\left(\frac{\log n}{\log\log n}\right)
\right)
=======

n^{o(1)}.
\tag{2}
]

## Theorem 3: carrier-pair charge

For every primitive position (A), with (k=|A|),

[
\boxed{
\sum_{\substack{u\text{ legal}}}
\binom{b_A(u)}2
\le
D_2(n)\binom{k}{2}.
}
\tag{3}
]

Consequently, for every integer (s\ge2),

[
\boxed{
#{u\text{ legal}:b_A(u)\ge s}
\le
D_2(n)\frac{\binom{k}{2}}{\binom{s}{2}}.
}
\tag{4}
]

### Proof

For every blocked facet (u/p), choose one witness (a(u,p)\in A) comparable with (u/p). Since (u) is legal, the argument from Lemma 1 shows that necessarily

[
\frac up\mid a(u,p).
\tag{5}
]

For fixed (u), distinct blocked facets have distinct witnesses. Indeed, if the same (a) witnessed both (u/p) and (u/q), then

[
u=\operatorname{lcm}(u/p,u/q)\mid a,
]

contradicting the legality of (u).

Thus each legal (u) contributes (\binom{b_A(u)}2) distinct unordered pairs of witnesses from (A).

Fix a pair ({a_1,a_2}\subseteq A). If it receives a contribution from (u), then for distinct primes (p,q\mid u),

[
\frac up\mid a_1,
\qquad
\frac uq\mid a_2.
]

Therefore

[
u
=

\operatorname{lcm}\left(\frac up,\frac uq\right)
\mid
\operatorname{lcm}(a_1,a_2).
\tag{6}
]

Since (\operatorname{lcm}(a_1,a_2)\le n^2), there are at most (D_2(n)) possible values of (u). Summing over the (\binom{k}{2}) carrier pairs proves (3). Markov’s inequality in the form

[
\binom{s}{2}\mathbf 1_{{b_A(u)\ge s}}
\le
\binom{b_A(u)}2
]

gives (4). ∎

This bound does not use trapping and is therefore valid after the trapping sweep as well.

---

# 3. The resulting current-shell inequality

For (X\le n), write

[
S_X:=(X/2,X]\cap\mathbb Z,
]

and let (Q_X(A)=Q(A)\cap S_X). Define

[
\Delta_X(A):=
\max_{\substack{d\text{ legal}}}
#{u\in Q_X(A):d\mid u}.
\tag{7}
]

For (s\ge2), set

[
N_{<2s}(X):=
#{u\in S_X:\omega(u)<2s}.
]

## Corollary 4

For every position (A), with (k=|A|),

[
\boxed{
|Q_X(A)|
\le
N_{<2s}(X)
+
D_2(n)\frac{\binom{k}{2}}{\binom{s}{2}}
+
\frac{X}{2s}\Delta_X(A).
}
\tag{8}
]

### Proof

Apart from the first two exceptional families, every (u\in Q_X(A)) satisfies

[
\omega(u)\ge2s,
\qquad
b_A(u)<s.
]

It therefore has at least (s) legal facets.

Every facet (u/p) is at most (X/2). Hence there are at most (X/2) possible facet values. If (G) denotes the good target family, the number of target-facet incidences is at least (s|G|), while every facet has degree at most (\Delta_X(A)). Therefore

[
s|G|
\le
\frac X2\Delta_X(A).
]

Combine this with (4). ∎

For (s\to\infty) sufficiently slowly relative to (\log\log X), standard estimates for (\omega) make

[
N_{<2s}(X)=o(X).
]

Thus (8) is a genuine shell-stable bounded-multiplicity charge. But the charge is to **carrier pairs**, and this is exactly where it becomes too weak.

---

# 4. Quadratic regeneration makes the pair term unavoidable

For the accepted carriers

[
a_i=p_iq_i,
]

the cross-target

[
u_{ij}=p_iq_j
]

has two blocked facets:

[
\frac{u_{ij}}{q_j}=p_i\mid a_i,
\qquad
\frac{u_{ij}}{p_i}=q_j\mid a_j.
]

Thus (u_{ij}) is charged to the pair ({a_i,a_j}). There are (t(t-1)) ordered cross-targets from (t) carriers. Accordingly,

[
\sum_u\binom{b_A(u)}2\asymp t^2.
]

So the quadratic dependence in (3) is structurally sharp; it cannot be replaced by (O(k)) without using more than the current trapped state.

This also cleanly separates the two counterexamples:

* In the face-carrier construction, the relevant targets lose every facet and enter the minimal/exact bank.
* In primorial batching, (Q) remains linear, but the carrier-pair term is already large enough that (8) becomes vacuous.

In particular, if (k) is as large as (n/(H\ell(n))) for any slowly growing batching gain (\ell(n)), then (kH=o(n)) can hold while

[
D_2(n)k^2\gg n.
]

The pair charge therefore survives the counterexamples but does not give the desired game bound.

---

# 5. Every charge to individual earlier moves is disproved

Here is a precise broad version of the fixed-budget failure.

Suppose a proposed current-state charging theorem says that, outside (e(A)) exceptional targets, every (u\in Q(A)) is charged to one earlier move (a\in A), with at most

[
C\Delta(A)
]

targets charged to each (a). Then necessarily

[
|Q(A)|
\le
e(A)+C|A|\Delta(A).
\tag{9}
]

The primorial-batched positions have

[
|Q(A)|=\left(\frac12-o(1)\right)n,
\qquad
\Delta(A)\le H,
\qquad
|A|H=o(n),
]

and essentially no exact-only exceptional family. Hence (9) fails.

The same argument rules out any bounded-multiplicity variant with (O(\Delta)) total capacity per earlier move. A successful charge must therefore give different capacities to different historical times, effectively using the past values

[
\Delta_1,\Delta_2,\ldots
]

rather than the endpoint value (\Delta_t).

---

# 6. The exact dynamic quantity: maximum-degree area

Consider one shell (S_X). Suppose Shortener focuses on that shell and, after each Prolonger move, plays a legal divisor attaining (\Delta_X).

Let (Q_i) be the shell’s nonminimal live targets immediately before Shortener’s (i)-th focused move, and let

[
\Delta_i:=\Delta_X(A_i).
]

Let (K_t) count targets from (Q_0) that leave (Q) because of a Prolonger move, and let (B_t) count targets that leave (Q) by becoming minimal legal elements as a side effect rather than by lying in Shortener’s selected star.

## Lemma 5: shell area identity

After (t) focused Shortener moves,

[
\boxed{
|Q_0|
=====

|Q_t|
+
\sum_{i<t}\Delta_i
+
K_t
+
B_t.
}
\tag{10}
]

### Proof

Classify every target in (Q_0) according to its first exit from the evolving (Q)-family.

If its first exit occurs because it is a multiple of Shortener’s chosen divisor on round (i), it belongs to the selected star of size (\Delta_i). These stars are disjoint over time because legality never returns.

Otherwise its first exit is caused by a Prolonger move, or it remains live but loses its final legal proper divisor and enters the minimal set. The targets still in (Q_t) form the final class. ∎

Thus the relevant object is

[
\boxed{\sum_{i<t}\Delta_i,}
]

not (t\Delta_t), and not ((|A_t|+b(n))\Delta_t).

The static primorial result only says that a state exists with small (\Delta_t). It gives no estimate for the area accumulated while producing that state.

---

# 7. A precise online-area lemma that would prove (L(n)=o(n))

The following is strong enough and is substantially weaker than a pointwise inequality such as (33).

## Online-area/persistence statement

There exists (h(n)\to\infty) such that the following holds after the accepted trapping sweep.

Uniformly for every dyadic shell (S_X) with

[
X\ge \frac{n}{h(n)},
]

and every trapped position reached after (o(n)) moves, if Shortener focuses on (S_X) for

[
m_X:=\left\lceil\frac{X}{h(n)}\right\rceil
]

turns and always plays a legal divisor of maximum current (Q_X)-degree, then

[
\boxed{
|Q_X(\mathrm{end})|
\le
\frac12|Q_X(\mathrm{start})|
+
\frac{X}{h(n)^2}.
}
\tag{OA}
]

This formulation automatically permits:

* direct maximum-degree kills;
* helpful Prolonger moves that kill shell targets;
* transfers into the minimal legal set.

## Proposition 6

Statement (OA), together with the trapping sweep and the static completion theorem, implies

[
L(n)=o(n).
]

### Proof

Choose (h(n)\to\infty) slowly enough that all uniform hypotheses hold and

[
\frac{\log h(n)}{h(n)}\to0.
]

After the trapping sweep, process the dyadic shells

[
S_{n},S_{n/2},S_{n/4},\ldots,S_{n/2^{J-1}},
\qquad
2^J\asymp h(n),
]

from top to bottom.

Apply (OA) repeatedly to a shell. After (O(\log h)) blocks,

[
|Q_X|
=====

O\left(\frac Xh\right).
]

The number of Shortener turns used on that shell is

[
O\left(\frac{X\log h}{h}\right).
]

Summing geometrically over the processed shells gives

[
O\left(\frac{n\log h}{h}\right)=o(n)
]

Shortener turns, and the same order of Prolonger turns. Together with the trapping sweep, the whole prefix still has size (o(n)).

At the resulting position (A), the static completion theorem gives

[
|\mathcal M(A)|=o(n),
]

where (\mathcal M(A)) is the set of all minimal legal elements over the whole board.

Every currently legal element in a processed shell is either:

1. in (Q_X(A)), or
2. in (\mathcal M(A)).

Therefore the total number of legal elements in the processed shells is

[
O\left(
\sum_{j<J}\frac{n/2^j}{h}
\right)
+
|\mathcal M(A)|
===============

o(n).
]

The unprocessed bottom interval contains only

[
O\left(\frac nh\right)=o(n)
]

integers. Hence the complete legal set at this checkpoint has size (o(n)). Legality only decreases, so at most (o(n)) further moves can be made. ∎

This gives an exact target for the requested shell-stable amortized charge.

---

# 8. Why the accepted codimension-one theorem does not prove (OA)

Suppose, at the beginning of a phase in the top shell, almost every target has (r) selected legal facets. Let (L_i) be the number of those selected target-facet incidences that have subsequently become illegal while their targets survive.

At Shortener turn (i), the number of still-live selected incidences is at least

[
r|Q_i|-L_i.
]

There are at most (n/2) possible facets, so

[
\Delta_i
\ge
\frac{2(r|Q_i|-L_i)}{n}.
\tag{11}
]

If one could prove

[
L_i\le \frac r2|Q_i|+o(n)
\tag{12}
]

through (O(n/r)) rounds, then (11) would give multiplicative decrease and would establish the top-shell version of (OA).

But the available worst-case loss bounds cannot establish (12).

Using small-prime facets (u/p), (p\le z), Theorem 1 supplies only

[
r=O(\log\log z)
]

directions per typical target, while one intervening move can globally block (O(z^2)) such target-facet incidences. Over the (t\asymp n/r) rounds required for a constant-factor decrease, the crude cumulative loss allowance is

[
O\left(\frac{nz^2}{r}\right).
]

The initial incidence supply is only (nr). To make the crude loss negligible would require

[
z^2=o(r^2),
]

but

[
r=O(\log\log z),
]

so this is impossible for every (z\to\infty).

The per-target version of Lemma 2 also does not suffice. It says that one move removes at most one facet from a fixed surviving target, but an (n/r)-round phase is much longer than the (r) rounds required to exhaust an (r)-element certificate set.

Primorial batching is precisely the stress test: it can spread one facet loss across many targets per carrier and repeatedly replace the certificate layer, while keeping the target reservoir nonminimal.

---

# 9. Why the remaining issue is genuinely arithmetic

The following abstract construction shows that the exact-only bank, pointwise (\Delta\to\infty), and “one lost facet per target per move” are not enough by themselves.

Take (N) abstract targets. For each of (r) layers, partition them into blocks of size (H); each block is a right-hand certificate shared by its (H) targets. Thus every target has one certificate in every layer.

Permit an adversarial move to delete all certificates in one layer. Such a move deletes exactly one certificate from every surviving target. Between layer deletions, maximum-degree play removes at most (H) targets.

After (r-1) deleted layers:

* at most (rH) targets have been killed by maximum-degree moves;
* every remaining target still has one legal certificate;
* no target is exact;
* the maximum degree is at most (H).

Choosing

[
rH=o(N)
]

leaves (N-o(N)) nonexact targets.

This is not asserted to be divisibility-realizable. The carrier-pair theorem explains one obstruction: two genuine carrier moves can jointly delete two different facets for at most (D_2(n)=n^{o(1)}) common targets. The abstract construction lets every pair of layers affect all (N) targets.

However, after approximately (\sqrt{N/D_2(n)}) carriers, the pair bound becomes compatible with a linear affected family. Quadratic regeneration shows that this transition is not merely an artifact of the estimate. Hence the pair-lcm obstruction alone still does not settle the online game.

---

# 10. The single unresolved sub-step

The remaining question can now be stated without reference to an unspecified “charging scheme.”

> **Ordered primorial persistence problem.**
> After the trapping sweep, can Prolonger legally order and continually extend primorial-batched or cross-carrier moves against the actual maximum-degree Shortener policy so that, for some shell (S_X) and some (h(n)\to\infty),
> [
> t\asymp \frac{X}{h(n)},\qquad
> |Q_i|\gg X\quad(0\le i\le t),
> ]
> while
> [
> \sum_{i<t}\Delta_i=o(X)
> ]
> and only (o(X)) targets are killed by Prolonger or transferred into the minimal legal set?
>
> Equivalently, prove that no such history exists, in the quantitative form (OA).

The two accepted counterexamples resolve opposite static failure modes but do not answer this ordered question:

* **Face-carrier diagonalization:** depletion is paid by the minimal/exact bank.
* **Primorial batching:** the endpoint has linear (Q) and small (\Delta), but no legal ordering against maximum-degree play with sublinear accumulated area has been supplied.

The precise missing theorem is therefore not another endpoint inequality. It is:

[
\boxed{
\text{A lower bound on the cumulative maximum-degree area during the creation
and refresh of a primorial-batched trapped state.}
}
]

I do not have a valid proof of that persistence bound, nor a divisibility-realizable history violating it. Consequently, the full asymptotic dichotomy remains unresolved here, with the manuscript’s unconditional bounds still the strongest established ones. 

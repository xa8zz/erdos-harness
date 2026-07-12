---
id: R137-legal-divisor-depth-capture
type: research
date: 2026-07-12
intent: >
  Independent full-solution attempt at the divisibility-game dichotomy
  L(n) = o(n) vs L(n) = Omega(n) on {2..n}, given the corrected record
  (entry-coupling fix, cone proposition, interval-blocker refutation of
  the static modulus, sixteenth collapse).
predecessors: []
action:
  kind: standalone
claim: >
  No unconditional proof or disproof follows from the record, but two
  new unconditional pieces come very close on the upper side. (1)
  Fixed-depth thinness lemma: with lambda_A(x) the number of legal
  divisors of x (so minimal legal means lambda = 1) and T_k(A) the set
  of legal x with lambda_A(x) <= k, for every FIXED k the bound
  |T_k(A)| = o(n) holds uniformly over primitive |A| = o(n). Proof:
  T_k has divisibility-height at most k, so by Mirsky it splits into k
  antichains; induction on k using the fact that every proper legal
  divisor of an element of T_k lies in T_{k-1}, plus a counting
  contradiction against the static-completion theorem. (2) Randomized
  capture strategy: Shortener samples a legal d with probability
  proportional to d^{-1/2}; for any target x with at least K legal
  divisors, the divisors x/q_i give hazard >= K^{3/2}/(3n) per turn
  (partial sums of q_i^{1/2} beat (2/3)K^{3/2}, denominator < 2 sqrt
  n), so after T = ceil(n/K) Shortener turns the expected number of
  surviving legal targets with lambda >= K is at most n exp(-sqrt(K)/3)
  — valid against adaptive play (conditional hazard bound) and
  derandomizable by backward induction in the finite perfect-
  information game. Hence after O(n/K) moves all but o(n) legal
  integers have at most K legal divisors. The exact missing statement:
  a trajectory-restricted growing-depth estimate — for some K(n) ->
  infinity, |T_K| = o(n) along the realized trajectory of an actual
  policy; the fixed-k lemma cannot be diagonalized (same coupled-
  modulus obstruction as peeling), and the worst-case-position version
  at growing K is expected false by interval-blocker-type adversaries.
  The lower route remains short of a disproof for the standard
  quantifier reasons.
implications:
  - New reduction surface: the dichotomy's upper route is now equivalent
    to trajectory-restricted thinness at growing depth — a pure counting
    statement with no shells, tickets, or ledgers; audit before
    load-bearing use (single-source).
  - The d^{-1/2} sampling policy is the first randomized Shortener
    machinery in the record, with an explicit derandomization argument.
verifiers_at_time: []
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/researcher-R137-solution-attempt.md
---

## Verdict

Taking every theorem, construction, and refutation in the supplied record as established, I do **not** obtain a valid unconditional proof or disproof of

\[
L(n)=o(n).
\]

The current unconditional conclusion remains

\[
c_\delta\,\frac{n(\log\log n)^2}{\log n}
\;\le\;
L(n)
\;\le\;
(0.1897123371+o(1))n,
\]

and neither endpoint settles whether \(L(n)/n\to0\). 

What follows is a new unconditional lemma and a concrete randomized Shortener strategy that get very close to an upper-bound proof. The precise point where the proof stops is exactly a growing-depth, trajectory-sensitive statement not supplied by the record. This also gives a direct audit test for any claimed solution.

---

# 1. Legal-divisor depth

For a position \(A\) and a legal integer \(x\), put

\[
\lambda_A(x)
:=
\#\{d\in\mathcal L(A):d\mid x\}.
\]

Thus \(x\in\mathcal M(A)\) exactly when \(\lambda_A(x)=1\). Define

\[
T_k(A):=\{x\in\mathcal L(A):\lambda_A(x)\le k\}.
\]

The following fixed-depth strengthening of static completion is valid.

## Fixed-depth thinness lemma

For every fixed \(k\ge1\), uniformly over primitive positions \(A=A_n\) satisfying \(|A|=o(n)\),

\[
|T_k(A)|=o(n).
\tag{1}
\]

### Proof

We induct on \(k\).

For \(k=1\),

\[
T_1(A)=\mathcal M(A),
\]

so (1) is precisely the accepted static-completion theorem.

Assume the assertion for \(k-1\). First observe that \(T_k(A)\), ordered by divisibility, has height at most \(k\): if

\[
x_1\mid x_2\mid\cdots\mid x_r
\]

are legal, then \(x_1,\ldots,x_r\) are distinct legal divisors of \(x_r\), hence \(r\le\lambda_A(x_r)\le k\). By Mirsky’s theorem, \(T_k(A)\) is a union of at most \(k\) antichains. It therefore suffices to prove that every antichain

\[
C\subseteq T_k(A)
\]

has size \(o(n)\).

Remove \(C\cap T_{k-1}(A)\), which has size \(o(n)\) by induction. For every remaining \(x\in C\), let

\[
D_x=\{d\in\mathcal L(A):d\mid x,\ d<x\}.
\]

This set is nonempty. Moreover,

\[
D_x\subseteq T_{k-1}(A).
\tag{2}
\]

Indeed, if \(d\in D_x\), every legal divisor of \(d\) is also a legal divisor of \(x\), while \(x\) itself is an additional legal divisor of \(x\). Consequently

\[
\lambda_A(d)\le \lambda_A(x)-1\le k-1.
\]

Write

\[
D:=T_{k-1}(A),\qquad s:=|D|=o(n).
\]

Suppose toward a contradiction that along some subsequence

\[
|C|\ge\varepsilon n
\tag{3}
\]

for a fixed \(\varepsilon>0\).

For \(d\in D\), let

\[
r_C(d):=\#\{x\in C:d\mid x\}.
\]

Put

\[
\eta:=\max\left\{\frac{s}{n},\frac1n\right\},\qquad
p:=\eta^{1/3},\qquad
R:=\eta^{-2/3}.
\]

Then

\[
p\to0,\qquad pR\to\infty,\qquad Rs=o(n).
\tag{4}
\]

Choose a random subset \(Z\subseteq C\), including each element independently with probability \(p\). Since \(C\) is an antichain consisting of integers legal relative to \(A\),

\[
A\cup Z
\]

is primitive.

Call \(x\in C\) low-degree if some \(d\in D_x\) satisfies \(r_C(d)<R\). Assign each such \(x\) to one such \(d\). For fixed \(d\), fewer than \(R\) elements can be assigned to it, and therefore the total number of low-degree \(x\) is at most

\[
R|D|=Rs=o(n).
\tag{5}
\]

Now take a non-low-degree \(x\in C\). Conditional on \(x\notin Z\), every \(d\in D_x\) has at least \(R-1\) other multiples in \(C\). Hence

\[
\Pr\bigl(d\nmid z\text{ for every }z\in Z\setminus\{x\}\bigr)
\le (1-p)^{R-1}.
\]

Since \(|D_x|\le k-1\), the union bound gives

\[
\Pr\bigl(\text{some }d\in D_x\text{ is not covered by }Z
          \mid x\notin Z\bigr)
\le (k-1)e^{-p(R-1)}
=o(1).
\tag{6}
\]

Whenever \(x\notin Z\) and every \(d\in D_x\) divides some member of \(Z\), the integer \(x\) becomes minimal legal relative to \(A\cup Z\):

* \(x\) remains legal because \(C\) is an antichain, so no member of \(Z\) is comparable with \(x\);
* every formerly legal proper divisor of \(x\) is now illegal because it divides a selected member of \(Z\);
* every formerly illegal divisor remains illegal.

Equations (5)–(6) show that the expected number of members of \(C\) becoming minimal legal is

\[
(1-o(1))|C|.
\]

At the same time,

\[
\mathbb E|Z|=p|C|=o(n).
\]

Thus some realization of \(Z\) satisfies simultaneously

\[
|Z|=o(n)
\]

and

\[
|\mathcal M(A\cup Z)|\ge \frac12|C|.
\]

Under (3), this gives a primitive position \(A\cup Z\) of size \(o(n)\) with a linear number of minimal legal elements, contradicting static completion. Hence every such \(C\) is \(o(n)\), and the union of at most \(k\) such antichains is also \(o(n)\). ∎

This is a genuine extension of the supplied \(k=1\) theorem, but only for **fixed** \(k\).

---

# 2. A randomized capture strategy

The preceding lemma can be coupled to a Shortener policy that efficiently kills every target having many currently legal divisors.

At each Shortener turn, choose a legal \(d\) with probability

\[
\Pr(d)=
\frac{d^{-1/2}}
{\displaystyle\sum_{z\in\mathcal L(A)}z^{-1/2}}.
\tag{7}
\]

The denominator is at most

\[
\sum_{z=2}^n z^{-1/2}<2\sqrt n.
\tag{8}
\]

Fix a legal target \(x\) with at least \(K\) legal divisors. Write \(K\) distinct such divisors as

\[
d_i=\frac{x}{q_i},
\]

where, after ordering, the distinct positive integers \(q_i\) satisfy \(q_i\ge i\). Therefore

\[
\begin{aligned}
\sum_{\substack{d\mid x\\d\text{ legal}}}d^{-1/2}
&\ge
x^{-1/2}\sum_{i=1}^K q_i^{1/2} \\
&\ge
n^{-1/2}\sum_{i=1}^K i^{1/2} \\
&\ge
\frac{2}{3}\frac{K^{3/2}}{\sqrt n}.
\end{aligned}
\tag{9}
\]

Combining (8) and (9), at any Shortener turn at which \(x\) is legal and has at least \(K\) legal divisors,

\[
\Pr(\text{Shortener selects a divisor of }x)
\ge
\frac{K^{3/2}}{3n}.
\tag{10}
\]

Selecting such a divisor either selects \(x\) itself or makes \(x\) illegal. Prolonger’s intervening moves can only remove \(x\) or reduce the set of its legal divisors; they cannot create new legal divisors.

Consequently, after \(T\) Shortener turns,

\[
\Pr\bigl(
x\text{ is still legal and }\lambda(x)\ge K
\bigr)
\le
\exp\left(-\frac{TK^{3/2}}{3n}\right).
\tag{11}
\]

This remains valid against an adaptive Prolonger: conditionally on every realized history at which \(x\) is still in the high-divisor regime, the next-turn hazard is at least the quantity in (10).

Taking

\[
T=\left\lceil\frac nK\right\rceil
\]

gives

\[
\mathbb E\,
\#\{x\in\mathcal L(A_T):\lambda_{A_T}(x)\ge K\}
\le
n e^{-\sqrt K/3}.
\tag{12}
\]

Thus, after only \(O(n/K)\) Shortener moves, all but \(o(n)\) of the remaining legal integers have at most \(K\) legal divisors, provided \(K\to\infty\).

Because the game is finite and of perfect information, this randomized bound can be derandomized by backward induction: at every Shortener node, some deterministic move has conditional payoff no larger than the randomized average.

---

# 3. The exact missing statement

The two lemmas would prove the requested result if one could establish, for some \(K=K(n)\to\infty\), the trajectory-restricted growing-depth estimate

\[
\left|
\left\{
x\in\mathcal L(A_T):
\lambda_{A_T}(x)\le K
\right\}
\right|
=o(n),
\qquad
T=\left\lceil\frac nK\right\rceil,
\tag{GD}
\]

uniformly against every Prolonger strategy under the weighted policy (7).

Indeed, by (12) the complementary high-divisor population is \(o(n)\). Hence the entire legal set at time \(T\) would be \(o(n)\). The prefix itself has only \(O(n/K)=o(n)\) moves, and every subsequent move consumes one member of the current legal set, so the whole game would have length \(o(n)\).

The fixed-depth thinness lemma proves

\[
\forall k\text{ fixed},\qquad |T_k(A)|=o(n)
\]

for sublinear positions. It does **not** prove (GD), because the required depth \(K(n)\) grows while the permitted position size is approximately \(n/K(n)\).

The quantifier gap is real. Abstractly, statements of the form

\[
b_k(\alpha)\longrightarrow0
\quad\text{as }\alpha\downarrow0
\quad\text{for every fixed }k
\]

do not imply

\[
b_{K(n)}(1/K(n))\longrightarrow0
\]

for some \(K(n)\to\infty\). For example,

\[
b_k(\alpha)
=
\min\left\{1,\frac{k}{\log(1/\alpha)}\right\}
\]

vanishes for each fixed \(k\) as \(\alpha\downarrow0\), while

\[
b_k(1/k)
\]

does not vanish. “Choose \(K\) sufficiently slowly” therefore does not repair the proof.

Mathematically, (GD) is another form of the same growing-depth chronological obstruction already visible in:

* the non-iterability of static completion;
* quadratic regeneration;
* direct-ancestor refinement cascades;
* the failure of fixed-prefix minimal-layer estimates to remain uniform through a growing number of layers.

None of the accepted facts proves (GD). Conversely, none of the listed counterexamples defeats the particular weighted policy against **all** its trajectories, so they do not disprove it either.

---

# 4. Why the lower-bound side also remains short of a disproof

A disproof of \(L(n)=o(n)\) requires a fixed \(c>0\) and a Prolonger strategy forcing at least \(cn\) moves against every Shortener strategy.

The supplied lower mechanisms do not have that conclusion:

\[
\frac{cn}{H(n)}
\]

from a growing-cap absorbing fortress is still \(o(n)\) whenever \(H(n)\to\infty\). Fixed-cap fortress entry, which could give a positive density, is ruled out by the accepted fixed-density clearing theorem. A linear surviving shadow is also insufficient because its quotient cones may expose only \(o(n)\) new minimal elements. Finally, histories defeating maximum-degree or minimal-root policies do not handle arbitrary Shortener replies.

So a valid negative resolution would need a new arbitrary-policy cumulative-layer mechanism or an amplification turning a forceable \(n/H(n)\) reservoir into \(cn\). The record supplies neither.

---

## Conclusion

The requested binary statement is not presently resolved by the stipulated facts:

\[
\boxed{
\text{No valid unconditional proof or disproof of }L(n)=o(n)
\text{ follows from the record.}
}
\]

The strongest new route above reduces the upper direction to the concrete trajectory statement (GD). Fixed legal-divisor depth is now controlled unconditionally, and high-depth targets admit a fast randomized capture. The remaining obstacle is precisely the promotion from every fixed depth to one growing depth along the actual trajectory—the same chronology-sensitive gap that survives the shell, ancestor, and cumulative-layer formulations.
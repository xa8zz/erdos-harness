Don't search the internet. You are an adversarial referee. The document below, produced during an analysis of a two-player divisibility game, claims two new unconditional results that are about to become load-bearing: (1) a FIXED-DEPTH THINNESS LEMMA — with lambda_A(x) the number of legal divisors of a legal integer x and T_k(A) = {x legal : lambda_A(x) <= k}, for every fixed k, |T_k(A)| = o(n) uniformly over primitive positions |A| = o(n); (2) a RANDOMIZED CAPTURE STRATEGY — sampling a legal move d with probability proportional to d^{-1/2} kills every target with at least K legal divisors at per-turn hazard >= K^{3/2}/(3n), so after O(n/K) Shortener turns all but o(n) legal integers have at most K legal divisors, valid against adaptive play and derandomizable. Give THREE verdicts (VALID / REPAIRABLE with gap+repair / REFUTED with exact failure):

A. The fixed-depth thinness lemma and its proof: the height-at-most-k claim and Mirsky decomposition; the induction step (is D_x really contained in T_{k-1} — check the lambda_A(d) <= lambda_A(x) - 1 inequality carefully, including whether x itself counts as a legal divisor of x in the definition); and the counting contradiction against the static-completion theorem (read the omitted middle of the argument closely — does the contradiction actually complete from the displayed inequalities, and is the o(n) uniform over the position family as claimed?). This is your primary task.
B. The randomized capture strategy: the denominator bound sum z^{-1/2} < 2 sqrt n; the divisor sum lower bound (are the q_i = x/d_i really distinct positive integers with q_i >= i after ordering, and does the partial sum of sqrt(q_i) really beat (2/3)K^{3/2}?); the hazard-to-survival exponential (11) against an ADAPTIVE adversary (is the conditional-hazard argument sound — any filtration/optional-stopping subtlety?); the expectation bound (12) with T = ceil(n/K); and the derandomization claim (backward induction in a finite perfect-information game — is the claimed deterministic policy well-defined, and does it preserve the bound simultaneously for ALL targets x or only for the expected count?).
C. The document's framing of the exact missing statement (trajectory-restricted thinness at growing depth K(n) -> infinity): is the claim that the two lemmas plus this statement would prove L(n) = o(n) actually correct — check the composition (what happens between the capture phase and the endgame; does o(n) survivors with lambda <= K really imply an o(n) continuation bound, or is an additional step needed?), and is the assertion that fixed-k cannot be diagonalized consistent with the coupled-modulus obstructions it cites?

If every step survives, say VALID plainly — do not manufacture objections. If anything fails, give the exact numeric or logical failure and whether it is repairable.

## The game

For \(n\ge2\), two players alternately choose previously unchosen integers from \(\{2,\ldots,n\}\), always keeping the chosen set an antichain under divisibility (a primitive set). The game ends when the set is maximal. Prolonger moves first and maximizes total moves; Shortener minimizes; \(L(n)\) is the optimal length. "Legal" at \(A\) = unchosen and incomparable with every member of \(A\). The static-completion theorem (any primitive \(P\) with \(|P|=o(n)\) has \(o(n)\) divisibility-minimal legal elements) and every other fact the document cites as supplied may be taken as given.

## The document (verbatim)

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
---
id: R156-prolonger-common-core-mass-release
type: research
date: 2026-07-13
intent: >
  Attempt a full unconditional proof or disproof that the optimal-play length
  L(n) of the divisibility-antichain (primitive-set) selection game on
  {2,...,n} satisfies L(n)=o(n), given the complete established theorem
  stack, and isolate the exact obstruction if neither direction closes.
predecessors: []
prompt: erdos-872/prompts/researcher-R156-solution-attempt-full-compilation.md
action:
  kind: standalone
claim: >
  No unconditional proof or disproof of L(n)=o(n) is established. Five new
  results are proved. (1) At every nonterminal position there exists a
  divisibility-minimal legal integer attaining the maximum current deletion
  degree, so a Shortener upper-bound strategy may always restrict to
  divisibility-minimal maximum-degree moves. (2) Noncreation lemma: if a
  minimal legal move m is selected and an integer x remains legal afterward,
  then x nonminimal before the move implies x nonminimal after; consequently,
  under the minimal maximum-degree Shortener policy, a surviving second-shell
  target can become divisibility-minimal only on a Prolonger turn, i.e. all
  root regeneration under this policy is attributable to Prolonger alone.
  (3) For any family X remaining legal throughout an interval with moves
  a_1,...,a_T, the count (and, weighted by any w>=0, the weighted sum) of
  divisors of members of X that are legal at the interval start and illegal
  at its end is at most sum_i tau(a_i) (resp. sum_i sum_{d|a_i} w(d)) — an
  exact one-use ledger on first deaths of actual divisors, which bounds
  destroyed-divisor multiplicity but not released target mass. (4) The claim
  "one Prolonger move creates only O(1) relevant new minimal roots" is false
  even under the minimal maximum-degree Shortener policy: a common-core
  construction (position {P}, P = prod p_i <= n, with r_i = d*p_i and a
  Prolonger move a = d*q incomparable to every r_i) makes k distinct r_i
  simultaneously divisibility-minimal in one move, with k asymp log n/log
  log n achievable along a suitable sequence of n; this does not scale to a
  linear lower bound since the sparse-position completion theorem blocks
  direct scaling. (5) Fixed-depth clearing: from any
  position of size o(n), Shortener can clear any fixed number J of
  successive minimal legal layers in o(n) moves uniformly against Prolonger,
  but this cannot be diagonalized to growing depth g(n)->infinity: a profile
  with |C_j| = floor(n/g(n)) for 0<=j<g(n) satisfies every fixed-J partial
  sum bound o(n) while the full sum over all g(n) layers is (1-o(1))n.
  The strongest available charging estimate for Prolonger-created root mass,
  new-incidences(a) <= tau(a)*Delta_X, is shown insufficient because tau(a)
  is unbounded, one common-core move can be inherited by unboundedly many
  later refinements, and some future roots are already legal at the sparse
  baseline rather than newly created. No off-policy construction (including
  the common-core example) qualifies as a Prolonger strategy surviving
  arbitrary Shortener play, so no disproof follows either. The established
  bounds c_delta * n*(log log n)^2/log n <= L(n) <= (0.1897123371+o(1))n
  stand with the o(n) question for L(n) open.
implications:
  - Root regeneration under the minimal-maximum-degree Shortener policy is
    now provably a Prolonger-only phenomenon, eliminating one entire
    hypothesized regeneration source (Shortener-side creation) from future
    closure attempts.
  - The remaining gap is precisely a direct-ancestor lifetime-ownership
    clause: bounding the total target mass released across arbitrarily many
    later refinements of a single Prolonger common-core move, not merely its
    instantaneous or one-use divisor multiplicity.
  - Fixed-depth arguments (any bounded number of minimal-layer sweeps) are
    now formally confirmed insufficient in principle, not just empirically
    stalled; a genuinely uniform-in-depth theorem is required, ruling out
    further fixed-J variants.
  - A valid disproof strategy must satisfy six simultaneous global
    requirements (survive sparse prelude, positive aggregate shell excess
    for arbitrarily slow scale growth, nonminimality retention, survival of
    batch/prime-product guards, postponed transition to linear private
    roots, positive-density payoff) that the common-core construction alone
    does not meet.
confidence_at_time: medium
strategy_dependence: independent
---

## Verdict

I do **not** have a valid unconditional proof or disproof of  
\[
L(n)=o(n).
\]
The two strongest prospective closures both fail at a precise chronological point. Below are rigorous deductions that sharpen that point. In particular, one can eliminate Shortener-created root regeneration entirely; nevertheless, Prolonger’s common-core moves still defeat the required amortization.

Thus the conclusion of the problem is **not resolved by the supplied theorem stack or by the additional arguments below**. Claiming otherwise would require inserting an unproved direct-ancestor lifetime bound.

---

## 1. Maximum-degree play may be made minimal

For a legal target family \(Q\), write
\[
N_Q(d)=\{x\in Q:d\mid x\},
\qquad
\deg_Q(d)=|N_Q(d)|.
\]

### Lemma 1

At every nonterminal position, there is a divisibility-minimal legal integer \(r\) attaining the maximum \(Q\)-deletion degree.

### Proof

Let \(d\) be any legal integer of maximum \(Q\)-degree. Descend through legal divisors of \(d\) until reaching a divisibility-minimal legal divisor \(r\mid d\).

Since \(r\mid d\),
\[
N_Q(d)\subseteq N_Q(r).
\]
Hence
\[
\deg_Q(r)\ge \deg_Q(d).
\]
The maximality of \(\deg_Q(d)\) forces equality. Therefore \(r\) is also a maximum-degree move. ∎

So, for purposes of an upper-bound strategy, Shortener may use the following policy:

> On every turn, choose a divisibility-minimal legal move among those maximizing current target deletion.

This differs from a prescribed literal tie-breaking rule, but it is a legitimate Shortener strategy for the original game.

---

## 2. Minimal Shortener moves never create new minimal legal elements

This removes one entire source of regeneration.

### Lemma 2: noncreation lemma

Let \(m\in\mathcal M(A)\), and suppose \(x\) remains legal after \(m\) is selected. If \(x\) was nonminimal legal before the move, then it remains nonminimal legal afterward.

Equivalently,
\[
\mathcal M(A\cup\{m\})\cap\mathcal L(A\cup\{m\})
\subseteq \mathcal M(A).
\]

### Proof

Because \(x\) was nonminimal, it had a proper legal divisor \(d\mid x\) before the move. Suppose \(d\) becomes illegal when \(m\) is selected. Then \(d\) and \(m\) are comparable.

If \(d\mid m\), minimality of \(m\) forces \(d=m\). Consequently \(m\mid x\), contradicting the assumption that \(x\) survives the selection of \(m\).

If \(m\mid d\), then again \(m\mid x\), giving the same contradiction.

Thus no proper legal divisor of a surviving \(x\) is destroyed by the move \(m\). In particular, \(x\) retains the divisor \(d\) and stays nonminimal. ∎

### Consequence for the second shell

Under the minimal maximum-degree policy furnished by Lemma 1:

- a surviving second-shell target can become minimal only on a **Prolonger** turn;
- Shortener’s turns either delete the target or leave its nonminimality unchanged.

Hence the unresolved regeneration phenomenon is entirely attributable to Prolonger’s upward blockers. This is a genuine simplification, but it does not close the problem.

---

## 3. An exact lifetime ledger for actual survivor divisors

Fix an interval of play, and let \(X\) be a family of integers that remains legal throughout the entire interval. At time \(t\), define
\[
\mathcal D_t(X)=
\{d\in\mathcal L(A_t):d\mid x
\text{ for at least one }x\in X\}.
\]

### Lemma 3: actual-divisor first-death ledger

If the moves during the interval are \(a_1,\ldots,a_T\), then
\[
\left|\mathcal D_0(X)\setminus\mathcal D_T(X)\right|
\le
\sum_{i=1}^{T}\tau(a_i).
\tag{1}
\]

More generally, for every nonnegative weight function \(w\),
\[
\sum_{d\in\mathcal D_0(X)\setminus\mathcal D_T(X)}w(d)
\le
\sum_{i=1}^{T}\ \sum_{d\mid a_i}w(d).
\tag{2}
\]

### Proof

Assign each disappearing divisor \(d\) to the first move \(a_i\) that makes it illegal. Since \(d\) was legal immediately before \(a_i\), it must be comparable with \(a_i\).

Choose \(x\in X\) with \(d\mid x\). The alternative \(a_i\mid d\) is impossible, because it would imply
\[
a_i\mid d\mid x,
\]
so \(x\) would become illegal, contrary to the definition of \(X\). Therefore necessarily
\[
d\mid a_i.
\]

Thus all divisors first destroyed by \(a_i\) are divisors of \(a_i\), giving at most \(\tau(a_i)\) of them. Summing first deaths proves (1), and the same assignment proves (2). ∎

This is a genuine immutable, one-use ledger. It completely avoids repeated counting of the **same actual legal divisor**.

The difficulty is that the desired conclusion is about target mass, not the number of actual divisors. A single destroyed divisor can support many targets, and after its destruction those targets can use other divisors that were already legal at the interval’s beginning. Consequently (1) does not control postponed refinement.

---

## 4. Why Prolonger-created minima have no bounded per-move multiplicity

Even under the minimal Shortener policy, one Prolonger move can create an unbounded number of new minima.

### Common-core construction

Choose distinct primes
\[
p_1,\ldots,p_k,d,q
\]
such that
\[
P=\prod_{i=1}^{k}p_i\le n,
\qquad
dp_i\le n,
\qquad
dq\le n.
\]
Consider the primitive position
\[
A=\{P\}.
\]

For every \(i\), put
\[
r_i=dp_i.
\]

Then:

- \(p_i\) is illegal because \(p_i\mid P\);
- \(d\) is legal;
- \(r_i\) is legal and its only proper legal divisor is \(d\);
- \(a=dq\) is legal and incomparable with every \(r_i\).

When Prolonger selects \(a=dq\), the common divisor \(d\) becomes illegal. Therefore all
\[
r_1,\ldots,r_k
\]
simultaneously become divisibility-minimal legal elements.

Taking \(p_1,\ldots,p_k\) to be small primes gives
\[
k\asymp \frac{\log n}{\log\log n}
\]
along a suitable sequence of \(n\). Thus one Prolonger move can create a diverging number of fresh minimal roots.

This does **not** yield a linear lower bound: the sparse-position completion theorem prevents the construction from being scaled directly to linearly many minima. It does prove that the hoped-for assertion

\[
\text{“one Prolonger move creates only }O(1)\text{ relevant roots”}
\]

is false, even after Shortener is made minimal.

The higher-rank cube mechanisms in the supplied record are precisely amplified versions of this common-core phenomenon.

---

## 5. The tempting fixed-depth proof and its exact quantifier failure

There is another seemingly short upper-bound argument:

1. perform the sparse \(\Omega\bmod g\) sweep, obtaining legal-poset height below \(g\) in \(n/g=o(n)\) moves;
2. sweep the divisibility-minimal legal layer;
3. repeat until the height is exhausted;
4. invoke static completion at each layer.

For every **fixed** number of layers, this argument is valid.

### Proposition 4: fixed-depth clearing

Starting from any position \(A_0\) with \(|A_0|=o(n)\), Shortener can sweep any fixed number \(J\) of successive minimal legal layers in \(o(n)\) turns, uniformly against Prolonger.

### Proof

Freeze
\[
C_0=\mathcal M(A_0).
\]
Shortener selects still-legal elements of \(C_0\) until none remain. This takes at most \(|C_0|=o(n)\) Shortener turns by static completion. Prolonger has made at most the same number plus one of intervening moves, so the new position \(A_1\) is still sparse.

Now
\[
C_1=\mathcal M(A_1)
\]
again has size \(o(n)\). Repeat. Induction works for every fixed \(J\). ∎

The invalid step is to put \(J=g(n)\to\infty\). The following numerical profile satisfies every fixed-depth conclusion:
\[
|C_j|=\left\lfloor\frac n{g(n)}\right\rfloor,
\qquad
0\le j<g(n).
\]
For each fixed \(J\),
\[
\sum_{j<J}|C_j|
\le \frac{Jn}{g(n)}=o(n),
\]
but
\[
\sum_{j<g(n)}|C_j|=(1-o(1))n.
\]

This does not construct such a divisibility trajectory; it proves that fixed-prefix little-\(o\) estimates cannot be diagonalized into a growing-depth estimate. A new uniform chronological theorem is indispensable.

---

## 6. Where an attempted second-shell proof stops

Under the minimal maximum-degree policy, suppose a linear capped tail exists. All fresh minimal roots in the tail are created on Prolonger turns. For a Prolonger move \(a\), every newly unavailable actual divisor of a final survivor divides \(a\), by Lemma 3.

One might now try to charge fresh roots to divisors of \(a\). The strongest immediate estimate has the shape
\[
\text{new root/target incidences caused by }a
\ \le\
\sum_{\substack{d\mid a\\d\text{ legal before }a}}
\deg_X(d)
\ \le\
\tau(a)\,\Delta_X.
\tag{3}
\]

Equation (3) is insufficient for exactly the reasons encoded in the supplied direct-ancestor obstruction:

- \(\tau(a)\) is unbounded;
- even when the current maximum degree is capped, one old common-core move can be inherited by many later refinements;
- different future roots can already have been legal at the sparse baseline, so they are not “created” as actual integers when their ancestors disappear;
- endpoint bounds such as \(t\Delta_t\) do not control the accumulated chronological area;
- a static replacement-window or frozen-repair charge can reuse the same ancestral move after each subsequent split.

Thus Lemma 3 controls actual divisor deaths but not the latent root mass that those deaths release. The missing assertion would have to say that this release can be charged with bounded **lifetime target mass**, not merely bounded actual-divisor multiplicity.

That is precisely the unresolved direct-ancestor clause.

---

## 7. Why this also does not give a disproof

The common-core construction is not an on-policy linear lower-bound strategy. To disprove \(L(n)=o(n)\), Prolonger would still have to produce, against **every** Shortener strategy, a trajectory that simultaneously:

1. survives the required sparse prelude;
2. retains positive aggregate shell excess for arbitrarily slowly growing scale parameters;
3. keeps the retained targets nonminimal;
4. survives prime-product guards and other batch moves;
5. postpones the transition to linearly many private roots until the position is no longer sparse;
6. does so with a positive-density payoff, rather than \(n/H(n)\).

The established fixed-cap exclusion prevents the most direct version, and a growing-cap fortress gives only \(n/H(n)=o(n)\). The fixed-rank fan hierarchy also cannot be sent to growing rank because its constants collapse. The local common-core example above supplies no strategy satisfying these global quantifiers.

---

## Final conclusion

The rigorous additions above show that Shortener can be assumed to play minimal maximum-degree moves and therefore never causes root regeneration herself. They also give an exact one-use ledger for actual divisors of final survivors. Neither result controls the mass released by a Prolonger common-core move after arbitrarily many later refinements.

Accordingly, the problem remains at the following exact dichotomy:

- an upper proof must establish an interval-local chronological trichotomy forcing a fixed positive amount of direct deletion, exact play, or irreversible minimal banking in \(o(n)\) turns; equivalently, it must close the direct-ancestor lifetime ownership clause in the second-shell multiple-cover schedule;
- a disproof must construct a legally realized postponed-refinement schedule against arbitrary Shortener play, not merely a capped endpoint or an off-policy fortress.

No such theorem or schedule is proved here. Therefore I cannot honestly assert either \(L(n)=o(n)\) or \(L(n)\not=o(n)\). The strongest unconditional conclusion remains
\[
c_\delta\frac{n(\log\log n)^2}{\log n}
\le L(n)
\le
(0.1897123371+o(1))n,
\]
with the sublinearity question unresolved.
---
id: R127-rate-model-obstruction-separator
type: research
date: 2026-07-12
intent: >
  Independent full-solution attempt at the divisibility-game dichotomy
  L(n) = o(n) vs L(n) = Omega(n) on {2..n}, given the complete
  established/ruled-out record (one-sweep containment, surviving-shadow
  compression, deep-layer theorem, fixed-cap and ordered-shadow
  refutations, the fifteen-family formulation-collapse catalogue).
predecessors: []
action:
  kind: standalone
claim: >
  No unconditional proof or disproof follows from the accepted record;
  the honest bracket c_delta n(loglog n)^2/log n <= L(n) <=
  (0.1897123371+o(1))n stands. New diagnostic content: (1) a rate-model
  obstruction — an admissible static-completion modulus F(s) = sqrt(s)
  yields guaranteed per-turn deletions sqrt(n/t) that diverge pointwise
  yet accumulate to only 2n*sqrt(alpha) + O(sqrt n) = o(n) over any
  sublinear horizon alpha*n, so pointwise sublinear completion plus
  degree divergence do NOT imply sublinear accumulated clearing;
  (2) fixed-depth peeling (any fixed J layers, sum_{j<J}|M_j| = o(n))
  is provable by finite induction, but passing to the growing depth
  J = C*loglog H needed by the deep-layer theorem requires an
  unavailable uniform modulus-vs-H relation, with quadratic semiprime
  regeneration as the concrete deterioration mechanism; (3) the strict
  implication chain: linear raw shadow does not imply linear surviving
  legal set does not imply linear cumulative minimal layers — the
  survivor construction makes the middle quantity linear while the last
  stays open; (4) witness/trace inequalities fail for three reasons
  (repeated semiprime-grid witnesses, shared small cores, chronological
  inheritance across face birth times), and the missing statement is a
  chronological no-reuse property: every harmful first-exit event gets
  a frozen owner and no move acquires more than globally summable new
  ownership over the realized trajectory; (5) the disproof side needs a
  fixed cap H = O(1) (refuted) or an n/H-to-cn amplification (absent).
  The upper-route missing lemma (online-area halving / bounded-depth
  compression) and the lower-route missing mechanism (repeated forced
  regeneration) are opposite sides of the same unresolved phenomenon.
implications:
  - Sixth independent concurrence on the separator; first to name the
    accumulated-clearing rate obstruction explicitly, which rules out
    any purely pointwise use of static completion for the upper route.
  - Bounded-depth compression attempts must produce a uniform
    modulus-vs-H relation, not iterate fixed-depth induction.
verifiers_at_time: []
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/researcher-R127-solution-attempt.md
---

## Verdict

I do **not** have a valid unconditional proof or disproof of  
\[
L(n)=o(n).
\]

After testing the upper- and lower-bound routes against every obstruction in the supplied record, the correct conclusion is that the statement remains unresolved under the accepted results. Claiming either outcome would require inserting a chronology-sensitive assertion that has not been proved and is not a consequence of the static, pointwise, or frozen-configuration theorems listed in the prompt. 

What can be established rigorously is the following exact diagnosis.

---

## 1. The strongest consequence of static completion is still only pointwise

Let \(\mathcal L(A)\) be the legal set at a position \(A\), and let
\[
M(A)=\mathcal M(A)
\]
be its minimal legal elements. Every \(x\in\mathcal L(A)\) is divisible by some \(m\in M(A)\). Consequently, if
\[
N_A(m)=\{x\in\mathcal L(A):m\mid x\},
\]
then
\[
\sum_{m\in M(A)}|N_A(m)|\ge |\mathcal L(A)|.
\]
Thus some legal minimal move satisfies
\[
|N_A(m)|\ge \frac{|\mathcal L(A)|}{|M(A)|}.
\tag{1}
\]

Since \(|M(A)|=o(n)\) whenever \(|A|=o(n)\), (1) says that while a linear legal population remains, Shortener always has a move deleting an unbounded number of legal elements.

The fatal issue is that **unbounded is not quantitatively sufficient over a sublinear time horizon**.

Define the worst completion modulus
\[
F_n(\alpha)
=
\sup_{\substack{A\text{ primitive}\\ |A|\le \alpha n}}
\frac{|M(A)|}{n}.
\]
Static completion says only that
\[
\alpha_n\longrightarrow0
\quad\Longrightarrow\quad
F_n(\alpha_n)\longrightarrow0.
\tag{2}
\]

If the legal population is at least \(cn\), then (1) guarantees a deletion of at least
\[
\frac{c}{F_n(t/n)}
\]
at time \(t\). Hence direct greedy progress through \(T=\alpha n\) turns is controlled only by
\[
\sum_{t\le \alpha n}\frac{1}{F_n(t/n)}.
\tag{3}
\]

For sublinear play to clear a linear population, one would need (3) to be \(\Omega(n)\) for some \(\alpha=o(1)\). Nothing in (2) implies that.

### A precise rate-model obstruction

Take the perfectly compatible qualitative modulus
\[
F(s)=\sqrt{s}.
\]
At time \(t\), a legal population of order \(n\) would then yield only
\[
\frac1{F(t/n)}
=
\sqrt{\frac nt}
\]
guaranteed deletions. For \(T=\alpha n\),
\[
\sum_{t=1}^{T}\sqrt{\frac nt}
\le
2\sqrt{nT}+O(\sqrt n)
=
2n\sqrt{\alpha}+O(\sqrt n).
\tag{4}
\]
If \(\alpha\to0\), this is \(o(n)\).

Yet at every sublinear horizon \(t=o(n)\),
\[
nF(t/n)=\sqrt{nt}=o(n)
\]
and the guaranteed deletion \(\sqrt{n/t}\) tends to infinity. Thus:

\[
\boxed{
\text{pointwise sublinear completion and pointwise degree divergence}
\not\Rightarrow
\text{sublinear accumulated clearing}.
}
\]

This is an obstruction to the inference, not a counterexample to the divisibility game. It identifies exactly why the static theorem and degree-availability theorem do not finish the upper bound.

---

## 2. Fixed-depth peeling works, but growing depth does not follow

After the \(n/H\)-move peel, consider successive minimal layers \(M_0,M_1,\ldots\).

For every **fixed** integer \(J\), one can prove
\[
\sum_{j<J}|M_j|=o(n).
\tag{5}
\]

Indeed, \(M_0=o(n)\). Sweeping \(M_0\) takes at most \(|M_0|\) Shortener turns and the same number of opposing turns, so the resulting position still has size \(o(n)\). Static completion then gives \(M_1=o(n)\), and fixed finite induction proves (5).

But the deep-layer theorem requires control through
\[
J=C\log\log H,
\tag{6}
\]
where \(H\to\infty\). Passing from every fixed \(J\) to the growing \(J\) in (6) requires a relation between the static-completion modulus and \(H\). No such relation is available.

A diagonal choice of “very slowly growing” \(H\) does not automatically repair this. The initial prefix has normalized size about \(1/H\), but an admissible static modulus can improve arbitrarily slowly. Its first value might be roughly \(1/\log H\), its next value roughly \(1/\log\log H\), and so on. Qualitative convergence at each fixed depth gives no control over \(C\log\log H\) iterates. Quadratic semiprime regeneration is a concrete arithmetic mechanism by which such iterated deterioration can occur.

Thus the implication
\[
\forall J\text{ fixed},\quad
\sum_{j<J}|M_j|=o(n)
\quad\Longrightarrow\quad
\sum_{j<C\log\log H}|M_j|=o(n)
\]
is invalid without a new uniform theorem.

---

## 3. Raw or surviving shadow does not decide the issue

The one-sweep containment theorem gives
\[
\bigcup_{\ell>0}M_\ell
\subseteq
\operatorname{Sh}^{-}(K_0),
\tag{7}
\]
where \(K_0\) is the set of first-layer roots killed upward by Prolonger.

The ordered raw-shadow statement is false: Prolonger can force a linear raw shadow against every root ordering. Even strengthening “raw” to “still legal at the end of the sweep” is insufficient, because the surviving-shadow construction produces disjoint cones
\[
\Gamma_m=\{mk:2\le k\le K_m,\ k\ne q_m\}
\]
with
\[
\sum_m|\Gamma_m|=\Omega(n),
\]
while their next minimal elements are only
\[
mp,\qquad p\le K_m\text{ prime},
\]
and hence number
\[
O\!\left(
n\frac{\log\log H}{\log H}
\right)
=o(n).
\tag{8}
\]

So the implications are genuinely distinct:
\[
\text{linear raw shadow}
\not\Rightarrow
\text{linear surviving legal set}
\not\Rightarrow
\text{linear cumulative minimal layers}.
\]

The accepted survivor construction makes the middle quantity linear but still leaves the last quantity unresolved.

---

## 4. Why the witness inequalities still stop short

For a depleted face \(f\), each blocked prime lift has a trace, and for every \(s\),
\[
|\mathcal F|\binom qs
\le
\sum_I
N_{\mathcal F}\!\left(
\operatorname{lcm}_{i\in I}e_i
\right).
\tag{9}
\]

High-lcm tuples can be discarded. The obstruction is the low-lcm part.

There are three distinct failures:

1. **Repeated witnesses.** A semiprime grid can generate \(R^s\) witness tuples from only \(Rq\) actual moves.

2. **Shared cores.** Many different tags can use traces having the same small core, so all their lcms remain small.

3. **Chronological inheritance.** A blocker played once can be inherited by faces born much later. An instantaneous Sperner bound therefore does not give a lifetime capacity.

The atomic ledger repairs inheritance for one orientation, with a lifetime factor \(2^r\tau(c)\). It does not control the direct-ancestor channel. A later small ancestor can simultaneously enter the records of many previously repaired structures. Frozen coded repairs do not prevent that jump.

What is missing is not another static moment estimate. It is a statement of the following kind:

> Every harmful first-exit event receives a frozen chronological owner, and no actual move can acquire more than a globally summable amount of new ownership over the whole realized trajectory.

No accepted lemma supplies that no-reuse property.

---

## 5. The lower-bound route also stops at an exact quantitative barrier

A growing-cap fortress with
\[
|Q(A)|\asymp n,\qquad \Delta_Q\le H(n)
\]
has remaining value at least
\[
\frac{|Q(A)|}{H(n)}
=
\Omega\!\left(\frac n{H(n)}\right).
\tag{10}
\]

For \(H(n)=(\log n)^{o(1)}\), this gives \(n^{1-o(1)}\), but still
\[
\frac{n/H(n)}n=\frac1{H(n)}\longrightarrow0.
\]
Therefore it does not disprove \(L(n)=o(n)\).

To obtain a positive-density lower bound, Prolonger would need at least one of:

\[
H=O(1),
\tag{11}
\]
or an amplification converting \(n/H\) protected moves into \(cn\) moves.

But robust fixed-cap entry is ruled out by the fixed-density clearing sweep, and no accepted amplification theorem exists. Likewise:

- policy-specific examples do not handle arbitrary Shortener replies;
- an obtainable off-policy fortress is not enough;
- linear surviving legal mass after one sweep is not enough because of compression into \(o(n)\) minima;
- repeated minimal-layer exposure has not been forced against every Shortener policy.

Thus there is no valid disproof either.

---

## 6. The exact unresolved separator

A proof of \(L(n)=o(n)\) would follow from either of these genuinely new statements:

\[
|Q_X(\mathrm{end})|
\le
\frac12|Q_X(\mathrm{start})|
+\frac{X}{h(n)^2}
\tag{OA}
\]
under a fully specified online Shortener policy, uniformly on its realized trajectory; or, equivalently for the peeling route, a uniform bound
\[
\sum_{j<C\log\log H}|M_j|=o(n)
\tag{12}
\]
for some \(H\to\infty\), again against arbitrary replies.

A disproof would require a Prolonger strategy that, against every Shortener policy, forces
\[
\sum_j|M_j|=\Omega(n),
\tag{13}
\]
or forces a robust constant-cap reservoir. None of the supplied constructions establishes (13).

The chronological first-exit/direct-ancestor inequality needed for the upper direction and the repeated-regeneration strategy needed for the lower direction are precisely opposite sides of the same unresolved phenomenon.

Therefore the mathematically defensible conclusion is

\[
\boxed{
\text{The supplied results do not yield a valid unconditional proof or disproof of }
L(n)=o(n).
}
\]

The currently justified unconditional bounds remain
\[
c_\delta\,
\frac{n(\log\log n)^2}{\log n}
\le
L(n)
\le
\bigl(0.1897123371+o(1)\bigr)n.
\]
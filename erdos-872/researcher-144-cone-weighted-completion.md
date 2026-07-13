---
id: R144-cone-weighted-completion
type: research
date: 2026-07-12
intent: >
  Independent full-solution attempt at the divisibility-game dichotomy
  L(n) = o(n) vs L(n) = Omega(n) on {2..n}, given the full compiled
  record including the sparse rank sweep and frozen-cone accounting.
predecessors: []
action:
  kind: standalone
claim: >
  No unconditional proof or disproof follows from the record. New
  refinement — cone-weighted completion lemma: if every legal integer
  exceeds n/H and C is a maximal legal completion, then |L(A)| <=
  sum_{c in C} (floor(n/c) + #{d | c : d > n/H}) — each legal x is
  comparable with some completion element, and c's comparability
  neighborhood splits into multiples (at most n/c) and large divisors.
  This is genuinely sharper than the uniform (2H+1)|C| continuation
  bound: interval-blocker-type positions, whose many new minima sit
  near n/3, contribute only O(1) multiples each and so do NOT defeat
  the weighted bound. But it still fails to give o(n): a trapped
  capped reservoir with Theta(n/H) minimal roots each supporting
  Theta(H) live targets makes the weighted sum Theta(n) — exactly the
  primorial-batched geometry — so cone weighting improves the
  diagnosis without removing the online obstruction. Remaining
  analysis reconfirms: static completion cannot be bootstrapped,
  peeling plus completion and iterated minimal layers fail at the
  coupled modulus, lower constructions lack the arbitrary-policy
  quantifier, and the exact unresolved statement is the
  trajectory-restricted clearing/halving rate.
implications:
  - The weighted completion bound separates the two known adversary
    geometries: interval blockers are harmless to it, primorial
    reservoirs are not — any future static refinement must attack the
    n/H-roots-times-H-targets rectangle specifically.
verifiers_at_time: []
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/researcher-R144-solution-attempt-full-compilation.md
---

## Verdict

**No unconditional proof or disproof follows from the stated results, and I do not have a valid new argument settling the problem.** The mathematically defensible conclusion is still

\[
c_\delta\,\frac{n(\log\log n)^2}{\log n}
\;\le\;
L(n)
\;\le\;
(0.1897123371+o(1))n,
\]

with neither

\[
L(n)=o(n)
\]

nor

\[
\limsup_{n\to\infty}\frac{L(n)}n>0
\]

established. The attachment itself correctly identifies the remaining upper obstruction as trajectory-restricted accumulated-area control, or equivalently a result at the strength of the proposed aggregate-excess halving theorem; it also correctly identifies the missing lower ingredient as robust bounded-cap entry or a genuine amplification mechanism. 

Here is why the most promising synthesis still does not close the problem.

---

## 1. A cone-weighted completion lemma

There is a modest strengthening of the continuation lemma that initially looks capable of bypassing the bad cardinality modulus.

Suppose every integer legal at \(A\) exceeds \(n/H\), and let \(C\subseteq\mathcal L(A)\) be a maximal legal completion. For \(c\in C\), define its remaining comparability neighborhood

\[
N_H(c)
=
\{x\in\mathcal L(A): x\mid c\text{ or }c\mid x\}.
\]

Since \(A\cup C\) is maximal, every \(x\in\mathcal L(A)\) is comparable with some \(c\in C\). Hence

\[
|\mathcal L(A)|
\le
\sum_{c\in C}|N_H(c)|.
\tag{1}
\]

Moreover,

\[
|N_H(c)|
\le
\left\lfloor\frac nc\right\rfloor
+
\#\{d\mid c:d>n/H\}.
\tag{2}
\]

Consequently,

\[
|\mathcal L(A)|
\le
\sum_{c\in C}
\left(
\left\lfloor\frac nc\right\rfloor
+
\#\{d\mid c:d>n/H\}
\right).
\tag{3}
\]

This is genuinely sharper than the uniform continuation bound

\[
|\mathcal L(A)|\le(2H+1)|C|,
\]

because large completion elements may have only \(O(1)\) comparable legal integers. In particular, the interval-blocker examples, whose numerous new minima lie around \(n/3\), do not by themselves defeat (3): each such minimum has only constantly many multiples.

Unfortunately, (3) still does not yield \(o(n)\).

A trapped capped reservoir can have \(\Theta(n/H)\) minimal roots, each supporting \(\Theta(H)\) live targets. Then

\[
\sum_{c\in C}|N_H(c)|=\Theta(n).
\tag{4}
\]

This is exactly the geometry of the primorial-batched obstruction. Replacing cardinality by cone weight therefore improves the diagnosis but does not eliminate the online obstruction.

---

## 2. Why static completion cannot be bootstrapped

Let

\[
\mu_n(\alpha)
=
\max_{\substack{P\text{ primitive}\\ |P|\le \alpha n}}
\frac{|\mathcal M(P)|}{n}.
\]

At a position containing at most \(\alpha n\) chosen numbers, the minimal-cone lemma gives a legal move deleting at least

\[
\frac{|\mathcal L(A)|}{|\mathcal M(A)|}
\ge
\frac{|\mathcal L(A)|/n}{\mu_n(\alpha)}
\tag{5}
\]

legal integers.

If \(|\mathcal L(A)|\ge\eta n\), this is at least \(\eta/\mu_n(\alpha)\). It is tempting to argue that \(\mu_n(\alpha)\to0\), so this deletion rate tends to infinity and therefore only \(o(n)\) turns are needed.

The problem is self-consistency. By the time Shortener has used \(\alpha n\) turns, the largest uniformly guaranteed accumulated deletion is heuristically only

\[
n\int_0^\alpha \frac{ds}{\mu_n(Cs)}.
\tag{6}
\]

The established interval-blocker construction allows the worst-case behavior

\[
\mu_n(\alpha)\gtrsim
\frac1{\log(1/\alpha)}.
\tag{7}
\]

Substituting that scale into (6) gives

\[
n\int_0^\alpha \log(1/s)\,ds
=
n\bigl(\alpha\log(1/\alpha)+\alpha\bigr)
=
o(n)
\qquad(\alpha\to0).
\tag{8}
\]

Thus pointwise divergence of the maximum cone size is fully compatible with only \(o(n)\) total progress over every \(o(n)\)-move prefix. The stronger condition

\[
\mu_n(3\alpha_n)=o(\alpha_n)
\]

would solve this fixed-point problem, but that condition is explicitly false.

This does not prove that the actual on-policy modulus is bad. It proves that the uniform static theorem cannot substitute for a trajectory theorem.

---

## 3. Why peeling plus completion still fails

After the \(n/H\)-move magnitude peel, let \(C\) be a maximal completion of the resulting position. The continuation lemma gives

\[
\text{remaining moves}\le (2H+1)|C|.
\tag{9}
\]

Therefore this route needs

\[
|C|=o(n/H).
\tag{10}
\]

The static completion theorem supplies only

\[
|C|=o(n).
\tag{11}
\]

These statements cannot be composed by choosing \(H\) “sufficiently slowly.” For example, the entirely compatible completion modulus

\[
|C|\asymp\frac{n}{\log H}
\tag{12}
\]

satisfies (11), while

\[
\frac{H|C|}{n}
\asymp
\frac{H}{\log H}
\longrightarrow\infty.
\tag{13}
\]

The cone-weighted variant (3) removes this particular numerical loss for large roots, but capped reservoirs produce the linear obstruction (4).

---

## 4. Why iterating minimal layers does not repair it

The deep-layer theorem reduces the problem to the first

\[
O(\log\log H)
\]

minimal layers. For each fixed layer index \(j\), static completion gives

\[
|M_j|=o(n).
\]

But it gives no rate uniform over a number of layers tending to infinity. One cannot conclude

\[
\sum_{j\le C\log\log H}|M_j|=o(n)
\tag{14}
\]

from the individual assertions.

This is not merely formal caution. If \(t\) incomparable semiprime carriers are played, the next border may contain \(t(t-1)\) cross-products. Thus a schematic recurrence such as

\[
t_{j+1}\asymp t_j^2
\tag{15}
\]

is genuinely realizable at the level of border regeneration. Even an initially tiny family can grow through \(O(\log\log H)\) refinement levels. Frozen coded repairs control a fixed blocker configuration, but the later insertion of one low-product edge can simultaneously alter many previously repaired structures. The missing statement is precisely an amortized chronological bound on those insertions.

---

## 5. Why the available lower constructions do not disprove sublinearity

The strongest fortress conclusion has the form

\[
\text{remaining value}
\ge
|E(A)|+\frac{|Q(A)|}{H}.
\tag{16}
\]

Even if \(|Q(A)|\ge cn\), a growing cap gives only

\[
\frac{|Q(A)|}{H}
\ge
\frac{cn}{H}
=
o(n)
\qquad(H\to\infty).
\tag{17}
\]

Thus an \(n^{1-o(1)}\) lower bound remains compatible with \(L(n)=o(n)\).

To obtain a positive-density lower bound from this mechanism, one would need either

\[
H=O(1)
\tag{18}
\]

or an amplification converting \(n/H\) forced moves into \(cn\) forced moves. But fixed-cap robust entry is ruled out by the established clearing sweep, and no valid amplification is given.

The rank-\(k\) fan hierarchy also stays sublinear:

\[
L(n)\ge
c_k\frac{n(\log\log n)^{k-1}}{\log n},
\qquad
c_k=2^{-k-2^{k-1}+1}.
\tag{19}
\]

For fixed \(k\), the right side is \(o(n)\). Letting \(k\to\infty\) does not help because the doubly exponential loss in \(c_k\) defeats the iterated \(\log\log n\) gain.

Finally, a linear raw shadow, or even a linear shadow that remains legal through one sweep, is not a linear-move lower bound. Those descendants can have only \(o(n)\) exposed minima and may subsequently be covered in batches.

---

## 6. The exact unresolved statement

A valid upper proof must establish a genuinely chronological assertion. One sufficient form is the aggregate-excess estimate:

\[
R(t)=M
\quad\Longrightarrow\quad
R\le \frac M2
\]

within

\[
O\!\left(M\frac{\log H}{H}+\log n\right)
\]

Shortener turns, uniformly along every reachable trajectory, for some

\[
H\to\infty,\qquad H^6=o(n).
\tag{20}
\]

Equivalently, it would suffice to prove that every failed interval creates \(\Omega(M)\) fresh unresolved obligations while every **interval-local actual Prolonger move** can be causally responsible for only \(O(1)\) obligations over its entire later refinement history. The direct-ancestor channel is exactly where the available atomic ledger fails.

A valid disproof must instead produce, against every Shortener policy, an on-trajectory sparse prefix followed by an interval in which a super-floor, nonminimal reservoir survives for the prescribed \(o(M)\) turns. It must survive batch guards, transfers into the minimal bank, fixed-density clearing, and arbitrary policy choices. No listed fortress or shadow construction has all those properties.

Moreover, failure of aggregate halving would not by itself imply \(L(n)\not=o(n)\), because aggregate halving is strictly stronger than global sublinearity. So merely refuting that proposed local theorem would not settle the original problem either.

---

## Conclusion

The proposed statement has **not** been proved or disproved by the accepted machinery. The two decisive missing alternatives are:

\[
\boxed{
\begin{array}{ll}
\text{Upper direction:}&
\text{trajectory-restricted accumulated-area/no-reuse control};\\[1mm]
\text{Lower direction:}&
\text{forceable bounded-cap density or a genuine linear amplification}.
\end{array}}
\]

Accordingly, labeling either \(L(n)=o(n)\) or \(L(n)\not=o(n)\) as proved would require inserting precisely the theorem that remains missing. The rigorous verdict is therefore

\[
\boxed{\text{The truth of }L(n)=o(n)\text{ remains unresolved by the supplied record.}}
\]
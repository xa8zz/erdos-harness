---
id: R131-entry-oa-coupling-correction
type: research
date: 2026-07-12
intent: >
  Prove or disprove robust absorbing-fortress entry at a slowly growing
  cap: existence of c > 0 and H(n) -> infinity with H(n) = n^{o(1)}
  such that Prolonger forces, against every Shortener strategy, arrival
  at a primorial-batched position with degree cap <= H(n) and trapped
  reservoir >= cn.
predecessors: [R104-fixed-cap-entry-refuted]
action:
  kind: extends
  target: R104-fixed-cap-entry-refuted
claim: >
  The entry statement itself is neither proved nor disproved, and two
  widely repeated consequence claims about it are FALSE. (1) Entry at
  cap H(n) = n^{o(1)} does NOT refute the online-area shell statement:
  the resulting bound L(n) >= cn/H(n) = n^{1-o(1)} is compatible with
  L(n) = o(n) (n/log n is n^{1-o(1)} and o(n) simultaneously), and at
  block level a valid online-area witness h_0 can be downgraded to
  g = min(h_0, sqrt(H)), making the processing block X log g / g far
  LONGER than the X/H fortress erosion time; a genuinely
  online-area-refuting entry theorem needs the quantifier coupling
  H log h = o(h) against every proposed witness h — a relative
  statement strictly stronger than the existential one. (2) Entry at
  H = n^{o(1)} need not improve the known lower bound
  c n(loglog n)^2/log n: that requires H = o(log n/(loglog n)^2),
  e.g. H = (log n)^2 gives the weaker n/(log n)^2. The genuine open
  content is reachability: the positive direction lacks
  chronology-sensitive control of advance direct-ancestor depletion
  (one earlier move can invalidate H^{Omega(1)} latent unmergeable
  faces with bounded divisor count and little contemporaneous reservoir
  loss); the negative direction covers only caps o(r(n)). As a
  standalone sentence the statement also needs imported definitions of
  primorial-batched, trapped reservoir, and the cap.
implications:
  - Correct the recurring dossier bullet: entry at growing cap gives
    only L(n) >= n^{1-o(1)}, which neither refutes the online-area
    statement nor (unless H = o(log n/(loglog n)^2)) improves the
    public lower bound. Drop the "refutes (OA)" parenthetical from all
    future prompt dossiers.
  - The corrected decisive lower-route target is the relative entry
    theorem: for every proposed online-area witness h(n), entry at
    some cap H_h(n) with H_h log h = o(h).
verifiers_at_time: []
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/researcher-R131-reservoir-entry-window.md
---

# Verdict

The requested dichotomy is **not valid as stated**. There is a complete unconditional disproof of the claim that (RE) would refute (OA), and also of the claim that (RE), with the stated class \(H(n)=n^{o(1)}\), would necessarily improve the known lower bound.

This does **not** prove that the intended reachability assertion (RE) itself is false. Under the intended meanings of “primorial-batched” and “trapped reservoir,” the supplied facts still leave (RE) undecided: the positive direction lacks control of advance direct-ancestor interference, while the negative direction only handles \(H=o(r(n))\). Those limitations are explicitly part of the uploaded record. 

What follows is the precise formulation-level resolution.

---

## 1. The asserted implication \((\mathrm{RE})\Rightarrow\neg(\mathrm{OA})\) is false

Assume (RE), and let \(A\) be the forced fortress-entry position. The absorbing-fortress theorem gives

\[
V(A)\ge \frac{|Q(A)|}{H(n)}\ge \frac{cn}{H(n)}.
\]

Hence

\[
L(n)\ge \frac{cn}{H(n)}.
\tag{1}
\]

Because \(H(n)=n^{o(1)}\), write

\[
H(n)=n^{\varepsilon(n)},\qquad \varepsilon(n)\longrightarrow0.
\]

Then

\[
\frac{n}{H(n)}
=
n^{1-\varepsilon(n)}
=
n^{1-o(1)}.
\]

But because \(H(n)\to\infty\),

\[
\frac{n/H(n)}{n}=\frac1{H(n)}\longrightarrow0.
\]

Therefore

\[
\boxed{\frac{n}{H(n)}=n^{1-o(1)}\quad\text{and simultaneously}\quad
\frac{n}{H(n)}=o(n).}
\tag{2}
\]

The notation \(n^{1-o(1)}\) does **not** mean “not \(o(n)\).” For example,

\[
\frac{n}{\log n}=n^{1-o(1)}
\]

and yet \(n/\log n=o(n)\).

An explicit asymptotic compatibility witness is

\[
F(n):=\frac{n}{\sqrt{H(n)}}.
\]

Then

\[
F(n)=o(n),
\qquad
F(n)=n^{1-o(1)},
\]

and, for every fixed \(c>0\),

\[
F(n)\ge \frac{cn}{H(n)}
\]

for all sufficiently large \(n\), because \(\sqrt{H(n)}\ge c\). Thus the two assertions

\[
L(n)=o(n)
\]

and

\[
L(n)\ge \frac{cn}{H(n)}
\]

are logically compatible.

So the numerical consequence of (RE) does not contradict the conclusion of (OA).

---

## 2. The incompatibility does not reappear at the block level

One might object that (OA) is more quantitative than merely \(L(n)=o(n)\). That does not repair the claimed implication.

Suppose (OA) holds with witness \(h_0(n)\to\infty\). It is downward-monotone in its witness: if \(g(n)\to\infty\) and \(g(n)\le h_0(n)\), then the same assertion holds with \(g\).

Indeed, the recurrence with \(h_0\),

\[
|Q_X(\mathrm{end})|
\le
\frac12|Q_X(\mathrm{start})|+\frac{X}{h_0^2},
\]

implies the weaker recurrence

\[
|Q_X(\mathrm{end})|
\le
\frac12|Q_X(\mathrm{start})|+\frac{X}{g^2},
\]

since \(g\le h_0\). Moreover, for \(x>e\), the function \(\log x/x\) is decreasing, so

\[
\frac{\log h_0}{h_0}
\le
\frac{\log g}{g}.
\]

Consequently a block using

\[
O\!\left(\frac{X\log h_0}{h_0}\right)
\]

turns also uses

\[
O\!\left(\frac{X\log g}{g}\right)
\]

turns.

Now, given the cap \(H(n)\) from (RE), set

\[
g(n):=\min\{h_0(n),\sqrt{H(n)}\}.
\]

Both \(h_0\) and \(\sqrt H\) tend to infinity, so \(g\to\infty\). The preceding argument shows that \(g\) is also a valid OA witness.

At a capped linear reservoir, bounded erosion requires order

\[
\frac{X}{H}
\]

moves to remove a fixed positive fraction of the reservoir. But the \(g\)-version of OA allows a block of order

\[
\frac{X\log g}{g}.
\]

Their ratio is

\[
\frac{X\log g/g}{X/H}
=
\frac{H\log g}{g}.
\]

Since \(g\le\sqrt H\),

\[
\frac{H\log g}{g}
\ge
\sqrt H\,\log g
\longrightarrow\infty.
\tag{3}
\]

Thus the OA processing block may be asymptotically **much longer** than the \(\Omega(X/H)\) fortress erosion time. There is again no contradiction.

The condition that would produce a contradiction for the **same** OA witness \(h\) is

\[
\frac{X\log h}{h}=o\!\left(\frac{X}{H}\right),
\]

equivalently

\[
\boxed{H\log h=o(h).}
\tag{4}
\]

(RE) contains no relationship at all between its existentially chosen \(H\) and the existential OA witness \(h\). That missing quantifier coupling is fatal to the claimed implication.

A genuinely OA-refuting entry theorem would need a relative formulation such as:

> For every proposed OA witness \(h(n)\to\infty\), Prolonger can force fortress entry at some cap \(H_h(n)\) satisfying  
> \[
> H_h(n)\log h(n)=o(h(n)).
> \]

The current \(\exists H\) statement is strictly weaker.

---

## 3. (RE) also need not improve the known lower bound

The known lower bound is

\[
L(n)\ge
c_\delta\frac{n(\log\log n)^2}{\log n}.
\tag{5}
\]

The lower bound furnished by (RE) would be

\[
L(n)\ge \frac{cn}{H(n)}.
\tag{6}
\]

For (6) to be an asymptotic improvement over (5), one needs

\[
\frac1{H(n)}
\gg
\frac{(\log\log n)^2}{\log n},
\]

or

\[
\boxed{
H(n)=o\!\left(\frac{\log n}{(\log\log n)^2}\right).
}
\tag{7}
\]

But \(H(n)=n^{o(1)}\) does not imply (7). For example,

\[
H(n)=(\log n)^2
\]

satisfies \(H(n)\to\infty\) and \(H(n)=n^{o(1)}\), while the resulting bound

\[
\frac{n}{(\log n)^2}
\]

is asymptotically much weaker than

\[
\frac{n(\log\log n)^2}{\log n}.
\]

Thus a proof of (RE), as quantified, need not improve the currently stated lower bound either. The narrower requirement \(H=(\log n)^{o(1)}\) would ensure an improvement, but that is not the statement posed.

---

## 4. Why the supplied facts do not decide the intended reachability assertion

After removing those incorrect consequences, the actual content of (RE) remains a nontrivial reachability question.

The positive facts supply:

\[
\text{static fortress existence}
+
\text{post-entry absorption}
+
\text{fresh-batch persistence}.
\]

They do not supply robust entry. Fresh-batch persistence only handles interference **after** activation. Advance depletion remains, and the atomic ledger controls only the orientation

\[
\kappa(F)\mid c.
\]

The opposite direct-ancestor orientation

\[
c\mid a_F
\]

is explicitly uncontrolled: one earlier move may invalidate \(H^{\Omega(1)}\) latent, mutually unmergeable faces while having bounded divisor count and causing little contemporaneous reservoir loss. None of the all-orders, trace-energy, frozen-repair, or maximal-divisor arguments in the record supplies the required chronology-sensitive no-reuse or Lipschitz invariant.

Consequently, a purported proof of (RE) from the listed facts would have to insert an unproved assertion of essentially the following kind:

\[
\text{total advance direct-ancestor depletion}
\le
o(n)+O(\text{actual reservoir erosion})+o(n).
\tag{8}
\]

The supplied counterexamples rule out the obvious current-state and per-move versions of (8).

Conversely, the negative theorem only establishes prevention when

\[
H(n)=o(r(n)).
\]

It gives no Shortener strategy for every \(H=n^{o(1)}\) at or above \(r(n)\). The layer-peeling and static-completion results likewise do not compose at the required scale, and the first-sweep raw-shadow counterexample does not control surviving minimal descendants. Hence they do not prove \(\neg(\mathrm{RE})\).

So neither direction follows:

\[
\boxed{
\text{the supplied results prove neither (RE) nor its negation.}
}
\tag{9}
\]

---

## 5. A secondary formal defect

As a standalone statement, (RE) also does not define “primorial-batched position,” \(Q\), \(\Delta_Q\), or “trapped reservoir.” I have interpreted them through the stated absorbing-fortress and batching facts. Without importing those external definitions, (RE) is not a closed mathematical proposition and literally has no determinate truth value.

---

# Final conclusion

The formulation-level claim is rigorously resolved as follows:

\[
\boxed{
(\mathrm{RE})\not\Rightarrow \neg(\mathrm{OA}).
}
\]

Indeed, the consequence \(L(n)\ge cn/H(n)=n^{1-o(1)}\) remains compatible with \(L(n)=o(n)\). Moreover, for the allowed class \(H=n^{o(1)}\), it need not improve the already stated lower bound.

Under the intended imported definitions, however, the reachability assertion (RE) itself is **not** proved or disproved by the accepted theorem stack. The unresolved mathematical step is still robust, chronology-sensitive control of advance direct-ancestor depletion; the corresponding all-cap Shortener prevention theorem is also absent. Therefore presenting either truth value for (RE) from the supplied assumptions would require asserting a new theorem whose load-bearing step has not been established.
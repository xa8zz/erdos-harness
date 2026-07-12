---
id: R96-layer-peeling-chronological-separator
type: research
date: 2026-07-12
intent: >
  Fresh full-solution attempt from the complete post-advance-depletion
  obstruction map, with no anchoring on any prior route.
predecessors: []
action:
  kind: standalone
claim: >
  No unconditional proof or disproof; the supplied results leave one
  genuine unresolved chronological separator, exhibited via a
  near-proof of the upper bound. Deterministic layer-peeling reduction:
  phase 0 eliminates all legal lower moves up to n/H in at most n/H
  Shortener moves (legality is monotone); the remaining game is
  analyzed through a minimal-layer sweep in which the only unresolved
  quantity is the total size of the minimal legal layers,
  sum over j < log_2 H of |M(A_j)|. Sufficient statements, any one of
  which gives L(n) = o(n): (i) that sweep total is o(n) for some
  H -> infinity (the static-completion theorem gives each layer o(n)
  only at a FIXED prefix — iterating it across log_2 H growing-depth
  layers is a growing-depth uniformity problem it does not cover);
  (ii) the shell inequality (OA); (iii) a repair potential whose
  increase under one chronological blocker is controlled by the
  blocker's CONTEMPORANEOUS degree area rather than by its lifetime
  descendant multiplicity. A disproof (L(n) >= cn) requires an
  arbitrary-reply entry theorem at FIXED cap H = O(1), or a rigorous
  amplification turning a growing-cap fortress into a fixed-cap one
  without losing a linear number of targets. None of these follows
  from the present results: the minimal-layer route stops at
  growing-depth uniformity; the random-witness repair route stops at
  the unavoidable 2^r / W_r = sqrt(r) temporal loss. Asserting either
  direction from present hypotheses would require inserting an
  unproved chronology theorem and would not be an unconditional
  resolution.
implications:
  - Independent zoom-out synthesis agrees exactly with the audit-phase localization; the program-level separator is one chronology theorem, now stated in three sufficient forms for o(n) and two required forms for the lower bound.
  - New machinery worth keeping - the layer-peeling reduction and the explicit growing-depth uniformity gap in iterated static completion.
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/researcher-R96-solution-attempt-post-advance-depletion.md
---

## Verdict

I do not have a valid unconditional proof or disproof. The supplied results leave a genuine unresolved chronological separator. In particular, neither the static-completion theorem nor the lifetime bound (2^r) for Boolean refinements can presently be iterated strongly enough to prove (L(n)=o(n)), while the absorbing-fortress theorem at a growing cap gives only a sublinear lower bound.

Below is a rigorous near-proof of the upper bound. It isolates an especially clean sufficient statement, and then shows exactly why the known results do not establish it.

---

## 1. A deterministic “layer peeling” reduction

Fix an integer parameter (H\ge 4).

### Phase 0: eliminate all small legal lower moves

Shortener repeatedly plays any currently legal

[
d\le \frac nH.
]

Legality is monotone: once an integer becomes illegal, it never becomes legal again. There are at most (n/H) such integers, so this phase uses at most

[
\frac nH
]

Shortener moves and at most (2n/H+1) total moves.

At the end of the phase,

[
D(A)\subseteq \left(\frac nH,\frac n2\right].
]

Consequently every legal lower move has upper-half degree at most

[
\deg_A(d)
\le \left\lfloor\frac nd\right\rfloor
-\left\lfloor\frac {n/2}{d}\right\rfloor
\le \frac{n}{2d}+1
<\frac H2+1.
]

Thus Phase 0 gives a completely robust degree cap (O(H)) in (O(n/H)) moves. No batching or persistence result is needed for this.

### Minimal-layer sweeps

Let (A_0) be the position after Phase 0, and write

[
D_j=D(A_j).
]

At the start of sweep (j), let (M_j) be the set of minimal elements of (D_j) under divisibility.

Shortener fixes an ordering of (M_j) and, on each of her turns, plays the first member of (M_j) that is still legal. She starts the next sweep as soon as no member of (M_j) remains legal. Therefore sweep (j) costs at most (|M_j|) Shortener moves.

At its conclusion,

[
D_{j+1}\subseteq D_j\setminus M_j.
]

Here is the key elementary fact.

### Lemma 1: multiplicative layer growth

If (x\in D_J), then there is a strict divisibility chain

[
d_0\mid d_1\mid\cdots\mid d_J=x
]

with (d_j\in M_j) at the appropriate ancestral stage. In particular,

[
x>2^J\frac nH.
]

#### Proof

Because (x\in D_J\subseteq D_{J-1}), there is a minimal element (d_{J-1}\in M_{J-1}) with (d_{J-1}\mid x). Since every member of (M_{J-1}) is absent from (D_J), we have (d_{J-1}\ne x), so

[
x\ge 2d_{J-1}.
]

Similarly, (d_{J-1}\in D_{J-1}\subseteq D_{J-2}), and some (d_{J-2}\in M_{J-2}) properly divides it. Continuing gives the chain. Since every (d_0\in D_0) exceeds (n/H), repeated strict divisibility gives

[
x\ge 2^Jd_0>2^J\frac nH.
]

(\square)

Take

[
J=\left\lceil \log_2 H\right\rceil.
]

Then Lemma 1 would give (x>n) for every (x\in D_J). Hence

[
D_J=\varnothing.
]

In particular, every live upper target is exact-only. By the exact-only bank, if the history so far has (t=o(n)) moves, then the number of such targets is

[
o(n)+t=o(n).
]

They can therefore be absorbed into the final (o(n))-cost completion.

We have proved the following rigorous sufficient statement.

### Proposition 2: cumulative minimal-layer criterion

If one can choose (H=H(n)\to\infty) so that, under the preceding sweep strategy,

[
\sum_{j<\lceil\log_2 H\rceil}|M_j|=o(n),
\tag{CML}
]

then

[
L(n)=o(n).
]

Indeed, the complete move count is bounded by

[
\frac{2n}{H}
+2\sum_{j<\lceil\log_2H\rceil}|M_j|
+o(n).
]

This gives a second clean separator, alongside (OA).

---

## 2. Why static completion does not prove (CML)

The static theorem gives

[
|M(A)|=o(n)
\qquad\text{whenever}\qquad |A|=o(n).
\tag{S}
]

For every fixed number (J), this lets one perform (J) minimal sweeps at total cost (o(n)). But in Proposition 2 one needs

[
J=\lceil\log_2H(n)\rceil\longrightarrow\infty.
]

There is no uniform modulus in (S) that permits this iteration.

This is not a minor issue involving a sum of (o(n)) quantities. Later sweeps can be much larger than earlier sweeps, and the position can cease to be sublinear before the required number of layers have been removed.

To see the precise logical failure, normalize sizes by (n). A bound of the schematic form

[
\frac{|M(A)|}{n}\le \sqrt{\frac{|A|}{n}}
\tag{3}
]

would be fully consistent with (S): whenever (|A|/n\to0), the right-hand side also tends to zero.

Starting at normalized size

[
x_0=\frac1H,
]

successive sweeps could then behave like

[
x_{j+1}=\sqrt{x_j}.
]

Thus

[
x_j=H^{-1/2^j}.
]

Already for

[
j=\left\lceil\log_2\log H\right\rceil
]

we have (x_j) bounded away from zero. This occurs far earlier than the (\log_2H) layers needed in Proposition 2.

The example is only a modulus calculation, not a construction of a divisibility position. But it proves that the qualitative statement (S) cannot be diagonally iterated into (CML). The Boolean refinement mechanisms in the prompt are precisely capable of the corresponding phenomenon: every fixed stage can be sublinear while a growing number of stages reveals a macroscopically large cumulative family.

So the following inference is invalid:

[
\text{“each sweep costs }o(n)\text{”}
\quad\Longrightarrow\quad
\text{“}\log H\text{ sweeps cost }o(n)\text{.”}
]

That would require a quantitative, chronology-stable strengthening of static completion.

---

## 3. Randomly charging an exhausted face does not repair the temporal gap

There is another tempting repair of the failed lifetime charging argument.

Suppose every advance-depleted face (d\in\mathcal F) has at least (q) distinct earlier witness moves. Let (I) be the face-witness incidence set. Then

[
q|\mathcal F|\le |I|.
]

The valid lifetime bound from the Boolean refinement mechanism is, at best,

[
#{d\in\mathcal F:c_i\text{ witnesses }d}
\le 2^r\tau(c_i),
]

rather than (W_r\tau(c_i)). Therefore

[
|\mathcal F|
\le
\frac{2^r}{q}\sum_i\tau(c_i).
\tag{4}
]

One might try to choose, independently for each face, a uniformly random witness and charge the face only to that witness. But this gives exactly the same estimate: witness (i) receives expected load

[
\sum_{d:i\text{ witnesses }d}\frac1{|W(d)|}
\le \frac{2^r\tau(c_i)}q.
]

Thus random charging merely reproves (4). It does not turn (2^r) into

[
W_r\asymp \frac{2^r}{\sqrt r}.
]

Nor do the higher-order witness inequalities fix the common-core obstruction. If the (q) witnesses have a shared core (e), then every selected (s)-tuple has lcm (e), and

[
N_{\mathcal F}(e)\binom qs
]

appears at once. There is no (s)-dependent decay to exploit. This is exactly the static all-moments failure described in the prompt.

A valid upper proof therefore needs more than choosing certificates differently. It needs a historical invariant or potential that prevents the same low-product core from being inherited through too many successive refinements **in the weighted target accounting relevant to (OA)**.

---

## 4. Why the lower-bound facts do not disprove (o(n))

The absorbing-fortress theorem gives, from a position with a linear reservoir and degree cap (H),

[
\text{remaining game length}
\ge |E(A)|+\frac{|Q(A)|}{H}.
]

For (H=H(n)\to\infty), this yields only

[
\frac{|Q(A)|}{H}=o(n).
]

Even a robust entry theorem at (H=(\log n)^{o(1)}) would therefore give only (n^{1-o(1)}), not (cn).

A recursive amplification would have to lower the cap repeatedly while retaining a linear reservoir. But at every new scale, batches not yet activated are exposed to all earlier permanent blockers. Fresh-batch persistence protects a batch only after activation. Thus the proposed recursion needs exactly the missing chronology-sensitive entry theorem; it does not follow from the absorbing property.

Likewise, histories defeating maximum-degree or minimal-legal policies do not give a lower bound on (L(n)), because Shortener may use a different policy specifically to advance-deplete the proposed future batches.

---

## 5. What would actually settle the problem

A proof of (L(n)=o(n)) would follow from either of the following genuinely new statements:

[
\sum_{j<\log_2H}|\mathcal M(A_j)|=o(n)
]

for some (H\to\infty) along the minimal-layer sweep above; or the stated shell inequality (OA); or an equivalent repair potential whose increase under one chronological blocker is controlled by the blocker’s contemporaneous degree area rather than by its lifetime descendant multiplicity.

A disproof would require an arbitrary-reply entry theorem at a fixed cap (H=O(1)), or a rigorous amplification turning a growing-cap fortress into a fixed-cap fortress without spending or losing a linear number of targets.

None of those statements follows from the supplied results. In particular, the attractive minimal-layer proof stops precisely at a growing-depth uniformity problem, while the attractive random-witness repair stops at the unavoidable (2^r/W_r\asymp\sqrt r) temporal loss.

Accordingly, asserting either

[
L(n)=o(n)
]

or

[
L(n)\ge c n
]

from the present hypotheses would require inserting an unproved chronology theorem. I would not regard such an argument as an unconditional resolution.

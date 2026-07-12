---
id: R91-advance-depletion-low-lcm-reduction
type: research
date: 2026-07-12
intent: >
  Prove or refute the shared ordered-multiplicity statement (equivalent
  lift-exhaustion / blocker-game / temporal-Hall forms) that is the last
  open step of the online-area route to the divisibility-game dichotomy.
predecessors:
  - R88-lift-exhaustion-reduction
  - R89-blocker-game-time-area
  - R90-refinement-forest-carrier-charge-false
action:
  kind: extends
  target: R88-lift-exhaustion-reduction
claim: >
  Not resolved, but the ordered persistence problem is reduced to pure
  advance-depletion. Theorem 1 (fresh-batch persistence): if at
  activation every legal face of a rank-r batch has at least 2W_r + 1
  legal prime lifts (W_r = binom(r, floor(r/2))), Prolonger clears the
  batch in at most W_r carrier moves against arbitrary subsequent
  replies (inclusion-maximal face selection + Sperner) — so dynamic
  blockers arriving after activation are harmless, and a batch can fail
  only if depleted before first touched. Theorem 2 (all-orders witness
  inequality): for an advance-depleted family F in one shell with q
  blocked tags each, |F| binom(q,s) <= sum over s-tuples of distinct-tag
  witness moves of N_F(lcm of their cores), for every s <= q. Tuples
  with lcm above Z contribute at most (2X/Z) binom(t,s), so only
  chronologically accumulated LOW-lcm witness tuples matter. The entire
  dichotomy now separates along one chronological inequality (TL):
  low-lcm witness capacity over untouched batches is o(B binom(q,s))
  plus O((Area_t + Bank_t) binom(q,s)). Proving (TL) gives the
  online-area statement and L(n) = o(n); violating it requires an
  ordered history with full-order low-lcm sum while area and bank stay
  negligible. Face-carrier diagonalization pays into the bank (no
  violation); primorial batching shows no static s-th-moment estimate
  suffices (one shared core e gives N(e) binom(q,s) at once); frozen
  covering-array repairs lack a Lipschitz property under chronological
  edge insertion — one new minimum-product edge can create
  N(e) binom(q-1,s-1) fresh low-lcm capacity in one reply. Neither
  direction of the dichotomy is closed; unconditional bounds unchanged.
implications:
  - The one remaining object is the chronological low-lcm capacity inequality (TL); both outcomes of the dichotomy are separated by exactly it.
  - A refutation must satisfy the six simultaneous conditions listed at (14); the two known counterexample mechanisms each fail one line.
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/followup-R91-ordered-multiplicity-final.md
---

# Verdict

I did **not** prove or refute the shared ordered-multiplicity statement.

I can, however, eliminate the part of the difficulty caused by blockers arriving **after** a batch is activated. After that reduction, the entire problem becomes one precise chronological low-(\operatorname{lcm}) inequality. The face-carrier and primorial-batching mechanisms fall on opposite sides of exactly this inequality.

The unresolved step is therefore narrower than the previous lift-exhaustion formulation:

[
\boxed{\text{Control low-(\operatorname{lcm}) witness tuples accumulated before a batch is first activated.}}
]

I do not have that control, nor a legal history violating it against every adaptive repair strategy.

---

# 1. Blocker-incidence normalization

Work inside one sufficiently narrow root shell, so that every relevant face core (d) has a common set (\mathcal P) of prime lifts. Thus

[
dp\in (n/2,n]\qquad(d\in\mathcal D,\ p\in\mathcal P),
]

where

[
m:=|\mathcal P|\asymp \frac{H}{\log H}.
]

A harmful earlier move that makes the (p)-lift (dp) illegal while (d) remains legal has the form

[
a=e p,\qquad e\mid d.
\tag{1}
]

This follows from the accepted prime-lift uniqueness lemma.

For a position (A_t), define

[
J_t(d):=
\left{
p\in\mathcal P:
\exists,a_i=e_i p\in A_t,\ e_i\mid d
\right}.
\tag{2}
]

Thus (J_t(d)) is the set of selected lift tags already blocked at (d). The face (d) is lift-exhausted relative to (\mathcal P) precisely when

[
J_t(d)=\mathcal P.
\tag{3}
]

For a fixed surviving face (d), one actual move adds at most one tag to (J_t(d)).

The multiplicity problem is that the same move (e_ip) may add the tag (p) to (J_t(d)) for every active (d) divisible by (e_i).

---

# 2. Dynamic blockers after activation are harmless

Let

[
W_r:=\binom r{\lfloor r/2\rfloor}.
]

This is the common-core splitting cost for a full rank-(r) divisor cube.

## Theorem 1: fresh-batch persistence

Suppose that, at the moment a rank-(r) batch is activated, **every legal face of the cube has at least**

[
2W_r+1
\tag{4}
]

currently legal prime lifts from (\mathcal P).

Then Prolonger can clear the batch in at most (W_r) carrier moves against arbitrary subsequent replies.

### Proof

On each turn, choose an inclusion-maximal face (F) that:

1. contains an unresolved root of the batch; and
2. still has a legal prime lift.

Play such a lift.

After (j-1) completed rounds, fewer than (2j) actual moves have occurred since activation. Every one of those moves can make at most one prime lift of a fixed surviving face illegal. Therefore, before the (j)-th Prolonger move, every surviving face still has at least

[
2W_r+1-2(j-1)>0
]

legal selected lifts, as long as (j\le W_r). Hence an unresolved root always has a playable extension.

The faces selected by Prolonger form an inclusion antichain. Indeed, if a later selected face were contained in an earlier one, its roots would already have been resolved. If an earlier selected face were properly contained in a later one, the later face was already playable when the earlier face was chosen, contradicting inclusion-maximality.

Sperner’s theorem now bounds the number of selected faces by (W_r). ∎

This theorem incorporates arbitrary common-core splitting and arbitrary new blockers inserted during the clearing phase. No multiplicity estimate across batches is needed.

## Consequence

A batch can fail only if it was already severely depleted **before Prolonger first touched it**.

If a common tag set of size (m) is used, define

[
q:=m-2W_r.
\tag{5}
]

Since

[
W_r=\Theta!\left(\frac{2^r}{\sqrt r}\right)
]

and in the primorial regime (2^r=H^{o(1)}), one may arrange

[
q=(1-o(1))m.
]

Every failed untouched batch therefore contains a face (d) satisfying

[
|J_\tau(d)|\ge q
\tag{6}
]

at its activation time (\tau).

Thus continual insertion during a repair is not itself the gap. The gap is **advance depletion of untouched batches**.

---

# 3. The exact all-orders Hall-moment inequality

Let (\mathcal F) be a family of distinct advance-depleted face cores in one shell. Let the earlier harmful moves be indexed by

[
a_i=e_i p_i,\qquad 1\le i\le t,
]

where (p_i\in\mathcal P). For an integer (\ell), define the shell capacity

[
N_{\mathcal F}(\ell)
:=
|{d\in\mathcal F:\ell\mid d}|.
\tag{7}
]

## Theorem 2: all-orders witness inequality

For every (1\le s\le q),

[
\boxed{
|\mathcal F|\binom qs
\le
\sum_{\substack{I\subseteq[t]\|I|=s\
p_i\ {\rm distinct}\ (i\in I)}}
N_{\mathcal F}!\left(
\operatorname{lcm}_{i\in I}e_i
\right).
}
\tag{8}
]

### Proof

Fix (d\in\mathcal F). It has at least (q) blocked tags. Choose any (s) of those tags. For each chosen tag (p), choose one witness move (e p) with (e\mid d).

The witnesses are distinct because their tags are distinct. Their small cores satisfy

[
\operatorname{lcm}(e_1,\ldots,e_s)\mid d.
]

Consequently, every (s)-subset of blocked tags at (d) contributes at least one term on the right side of (8) that counts (d). There are at least (\binom qs) such tag subsets. Summing over (d\in\mathcal F) proves the result. ∎

This is the exact temporal Hall-capacity expression.

The cases (s=1) and (s=2) correspond, respectively, to ordinary lift accounting and the accepted carrier-pair charge. Higher (s) detects the coded and product-escalating structure invisible to pairwise accounting.

---

# 4. Large least-common-multiple tuples are automatically negligible

Suppose the distinct face cores lie in an interval of length at most (X). Then

[
N_{\mathcal F}(\ell)\le \frac{X}{\ell}+1.
\tag{9}
]

Fix (Z\le X), and divide the right side of (8) according to whether

[
L_I:=\operatorname{lcm}_{i\in I}e_i
]

is greater than (Z).

The high-(\operatorname{lcm}) contribution is at most

[
\sum_{I:L_I>Z}N_{\mathcal F}(L_I)
\le
\left(\frac XZ+1\right)\binom ts
\le
\frac{2X}{Z}\binom ts,
\tag{10}
]

after harmlessly restricting to (Z\le X).

Consequently,

[
\boxed{
|\mathcal F|
\le
\frac{2X}{Z}
\frac{\binom ts}{\binom qs}
+
\frac{1}{\binom qs}
\sum_{\substack{I:,|I|=s\
p_i\ {\rm distinct}\L_I\le Z}}
N_{\mathcal F}(L_I).
}
\tag{11}
]

Thus (Z) may be chosen so that the first term is negligible. Every genuinely dangerous family must then be supported by many chronological witness tuples whose least common multiples stay unexpectedly small.

This isolates exactly what product escalation is supposed to prevent.

---

# 5. The missing chronological inequality

Let

[
\mathsf{Area}*t:=\sum*{i<t}\Delta_i
]

be the accumulated maximum-degree shell area, and let (\mathsf{Bank}_t) include exact-only transfers and actual moves already banked by the accepted arguments.

A quantitative no-direction would follow from an estimate of the following form, in the appropriately weighted block version:

[
\boxed{
\sum_{\substack{I:,|I|=s\
p_i\ {\rm distinct}\
L_I\le Z}}
N_{\rm untouched}(L_I)
\le
o!\left(B\binom qs\right)
+
O!\left(
(\mathsf{Area}_t+\mathsf{Bank}_t)\binom qs
\right),
}
\tag{TL}
]

where (B) is the number or total weight of untouched active batches.

Combined with (11), this would imply that all but a negligible or already-paid family of batches begins with more than (2W_r) live lifts. Theorem 1 would then process those batches, yielding the online-area statement and hence

[
L(n)=o(n).
]

A persistence construction would instead have to violate (TL): it would produce an ordered history for which the left side is of order

[
B\binom qs,
]

while both (\mathsf{Area}_t) and (\mathsf{Bank}_t) remain negligible.

So (TL) is not merely a sufficient technical estimate. It cleanly separates the two possible outcomes.

---

# 6. Why the available mechanisms do not prove (TL)

## Face-carrier diagonalization

In that mechanism, heavily depleted faces become minimal or exact. Their contribution is paid by (\mathsf{Bank}_t). Hence it does not contradict (TL) with the bank term included.

## Primorial batching

Here many witness cores can have the same small least common multiple. In the extreme model,

[
e_i=e
]

for one witness in every tag. Then for every (s)-tuple,

[
L_I=e,
]

and

[
\sum_I N(e)
===========

N(e)\binom qs.
\tag{12}
]

If (e) divides a linear family of untouched cores, (12) is already of full order. This is why no static (s)-th-moment estimate, regardless of how large (s) is, can settle the problem.

A valid proof must use the chronology: after some of the (ep) blockers appear, Prolonger’s coded or product-escalating repairs should constrain which further blockers remain legal.

## Frozen covering-array repair

The covering-array result defeats a fixed diagonal or sunflower-like clutter. But applying it repeatedly does not supply (TL). After a repair is chosen, one newly inserted minimum-product edge may participate in

[
\binom{q-1}{s-1}
]

new low-(\operatorname{lcm}) tuples and may do so simultaneously in (N(e)) untouched batches.

The resulting jump can be as large as

[
N(e)\binom{q-1}{s-1},
\tag{13}
]

although only one actual reply occurred. The primorial construction permits (N(e)) to be linear while the current degree remains capped.

Therefore a frozen repair theorem must be supplemented by a **Lipschitz theorem for the optimal repair potential under chronological edge insertion**. None of the stated frozen results supplies that Lipschitz property.

## Block harvest

In the block-harvest language, (N(L_I)) is exactly the number or weight of blocks sharing the arithmetic coordinates encoded by (L_I). The known (\Omega(m^2)) harvest solves one block, but (TL) asks whether the same ordered blocker tuple can consume capacity in too many not-yet-touched blocks.

That is the temporal Hall problem in its literal form.

---

# 7. A tempting sunflower composition still leaves the same gap

One can partition a sufficiently large frozen rank-(r) clutter into sunflowers using the elementary (\Delta)-system bound

[
|\mathcal H|>r!(k-1)^r
\quad\Longrightarrow\quad
\mathcal H\text{ contains a }k\text{-sunflower}.
]

For

[
r\asymp\frac{\log H}{\log\log H},
]

one may take (k) growing on the scale of (\log\log H). The logarithmic coded repair then handles each frozen sunflower at cost (o(k)), so a frozen clutter can indeed be compressed substantially.

This does not resolve the online problem. A later edge with a smaller common arithmetic core may join low-(\operatorname{lcm}) tuples from many already repaired sunflowers. Its multiplicity is (N(e)), not the number of petals in one sunflower. The cost of the insertion can therefore jump by a linear block weight.

The missing assertion is again exactly (TL), or equivalently:

[
\boxed{
\text{A new minimum-product edge cannot create linear fresh low-LCM
capacity without paying linear area or banked moves.}
}
]

I could not prove this assertion.

---

# 8. What a counterexample must now do

A refutation of the shared statement must give an actual ordered history satisfying all of the following simultaneously for some shell:

[
\begin{aligned}
&t=o(X/H),\
&\mathsf{Area}_t=o(X),\
&\mathsf{Bank}_t=o(X),\
&\text{a positive-weight family of untouched batches has }q=(1-o(1))m
\text{ tags blocked in advance},\
&\text{the low-LCM sum in (TL) is of full order},\
&\text{every coded or product-escalating repair attempted in chronological
order is legally cross-spoiled.}
\end{aligned}
\tag{14}
]

The static primorial-batched endpoint establishes all but the last line. The face-carrier construction satisfies the last line only by transferring mass into the exact bank. Neither is yet a counterexample to (TL).

---

# Final status

The new unconditional conclusion is:

> **Once a batch starts with (2W_r+1) surviving prime lifts per face, all subsequent dynamic insertion is harmless; arbitrary play clears the batch in at most (W_r) carrier moves.**

Therefore the ordered persistence problem is entirely an advance-depletion problem. Its exact all-orders obstruction is the low-(\operatorname{lcm}) sum in (TL).

I have neither proved the required chronological low-(\operatorname{lcm}) capacity bound nor constructed an arbitrary-reply history violating it. Consequently, neither the persistence direction nor the online-area direction is closed.

The unconditional asymptotic bounds remain

[
c_\delta\frac{n(\log\log n)^2}{\log n}
\le L(n)
\le
\bigl(0.1897123371+o(1)\bigr)n.
]


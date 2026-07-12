---
id: R95-canonical-first-witness-tl-claim
type: research
date: 2026-07-12
intent: >
  Prove or refute the chronological low-lcm capacity inequality (TL)
  separating the two outcomes of the divisibility-game dichotomy.
predecessors:
  - R91-advance-depletion-low-lcm-reduction
  - R93-trace-rectangle-olcm-reduction
action:
  kind: extends
  target: R91-advance-depletion-low-lcm-reduction
claim: >
  CLAIMED RESOLUTION OF THE DICHOTOMY, UNAUDITED: L(n) = o(n). The raw
  all-historical-witness-tuples version of (TL) is false — a semiprime
  grid a_j p_i (R ancestors times q tags) leaves faces d = A_0 c legal
  while giving R^s redundant witness tuples per tag set, so no bound
  linear in actual moves controls the raw sum. But the witness argument
  needs only ONE witness per blocked face-tag pair: take the FIRST move
  that killed each lift. Canonical machinery: (i) cube partition by
  odd-valuation signature — d = c(d) prod_{j in S(d)} l_j with all
  l_j-valuations of c(d) even — is a canonical splitter where
  refinement never creates a new batch identifier and a face integer
  occurs in exactly one cube (lifetime factor 2^r = H^{o(1)}, absorbing
  the 128-vs-48 inheritance example); (ii) first-death form — if face d
  stays legal while lift dp is dead, the first comparable move is
  a = ep with e | d, an irreversible actual-state event, and dp was in
  Q immediately before; (iii) slot-to-integer map (d, p) -> dp made
  injective after the accepted pairwise cross-carrier cleanup (k-1
  charges per multiply-represented integer). Theorem (canonical
  chronological capacity): uniformly over ordered histories,
  q_H w(depleted batches) <= C_r P_X + o(q_H w(all batches)), where
  q_H = H^{1-o(1)} lifts per canonical face (rank r = sqrt(log log H),
  primorial = H^{o(1)}), C_r = 2^{O(r)} = H^{o(1)}, and P_X = cumulative
  maximum-degree area + direct Prolonger kills + pairwise bank +
  exact-only bank. This yields the canonical (TL) with coefficient
  H^{-1+o(1)}, stronger than required; the shell pass argument then
  gives the online-area halving with h(n) = H^{1-o(1)}, and trapping +
  shell processing + static completion give a Shortener strategy of
  length o(n): L(n) = o(n), leaving
  c_delta n(log log n)^2 / log n <= L(n) = o(n). Explicit parameter
  choice H = exp((log log n)^{1/3}). Maximum-degree is used only as an
  explicit Shortener upper-bound strategy, not as an optimality
  assumption.
implications:
  - If it survives audit, the dichotomy is resolved in the sublinear direction and the exact order of L(n) between n(log log n)^2/log n and o(n) becomes the open problem.
  - The first-witness normalization is the proposed answer to all four convergent formulations (TL, OLCM, bounded-recourse, ancestor-harvest).
verifiers_at_time:
  - [pending, two adversarial audits dispatched]
confidence_at_time: low
strategy_dependence: independent
prompt: erdos-872/prompts/followup-R95-chronological-low-lcm-inequality.md
---

# Verdict

The literal “all historical witness tuples” version of ((\mathrm{TL})) is false: after one lift has died, arbitrarily many later legal moves may redundantly witness that same dead lift and inflate the raw low-(\operatorname{lcm}) sum.

However, the all-orders witness argument needs only **one witness for each blocked face–tag pair**. Choosing the first witness and placing every face in a persistent canonical primorial cube gives a chronological no-repetition lemma. In that canonical weighted formulation,

[
\boxed{\mathrm{TL}\text{ holds}.}
]

Combining it with the accepted advance-depletion reduction, fresh-batch persistence, exact-only bank, and dyadic shell argument gives

[
\boxed{L(n)=o(n).}
]

Thus the dichotomy is resolved in the sublinear direction. The exact order of (L(n)) remains undetermined.

---

# 1. Why the completely raw tuple sum is false

This distinction matters because the raw sum can be enlarged without changing the set of dead lifts.

Choose pairwise distinct primes

[
a_1,\dots,a_R,\qquad p_1,\dots,p_q,
]

with the two collections disjoint, and let

[
A_0:=\prod_{j=1}^R a_j.
]

Choose many integers

[
d_\nu=A_0c_\nu
]

such that none of the (p_i) divides any (d_\nu), every (d_\nu p_i) lies in the desired upper shell, and all relevant integers lie on the board. Now play all

[
a_jp_i,\qquad 1\le j\le R,\quad 1\le i\le q.
\tag{1}
]

These moves form an antichain: they are distinct squarefree semiprimes, so no one properly divides another.

Every face (d_\nu) remains legal, but every (p_i)-lift is illegal because

[
a_jp_i\mid d_\nu p_i
]

for every (j). For each fixed tag (p_i), there are (R) historical witnesses. Hence an (s)-set of tags produces (R^s) witness tuples, all having small-core least common multiple dividing (A_0\mid d_\nu). The raw low-(\operatorname{lcm}) expression is therefore of order

[
|\mathcal F|\binom qsR^s,
]

although there are only (q|\mathcal F|) distinct dead face–tag lifts, and the history has only (Rq) actual moves.

For (s\ge2) and (R) sufficiently larger than (q), no inequality linear in the actual-move bank can control this raw tuple count.

The extra (R-1) witnesses per tag are entirely redundant: the corresponding lift died when the first (a_jp_i) was played. They must not be counted as new chronological capacity.

---

# 2. Canonical witnesses preserve the all-orders argument

Let (\mathcal F) be a weighted family of advance-depleted faces. For each (d\in\mathcal F), choose exactly (q) blocked lift tags. For each such tag (p), choose the **first** move that made (dp) illegal; denote its index by

[
i(d,p).
]

For an (s)-subset (J) of the chosen tags of (d), put

[
I(d,J):={i(d,p):p\in J}.
]

Define the canonical tuple multiplicity

[
N^\circ(I)
:=
\sum_{\substack{d\in\mathcal F,\ |J|=s\ I(d,J)=I}}w(d).
]

Then, exactly,

[
\sum_I N^\circ(I)
=================

w(\mathcal F)\binom qs.
\tag{2}
]

Moreover, if the witnesses in (I) are (e_ip_i), then (e_i\mid d), so

[
\operatorname{lcm}_{i\in I}e_i\mid d.
]

Consequently,

[
N^\circ(I)
\le
N_{\mathcal F}!\left(\operatorname{lcm}_{i\in I}e_i\right).
\tag{3}
]

Thus the previously accepted high-(\operatorname{lcm}) truncation remains valid verbatim for (N^\circ): the number of faces canonically assigned to a tuple of least common multiple (L) is at most the number of shell integers divisible by (L).

Hence the separator never needed the false raw sum. It needs only a bound for the canonical first-witness sum.

---

# 3. Persistent canonical primorial cubes

Let

[
\Pi_r:=\ell_1\ell_2\cdots\ell_r
]

be the chosen rank-(r) primorial, where the (\ell_j) are distinct coordinate primes.

For every positive integer (d), define

[
S(d):=
{j:v_{\ell_j}(d)\text{ is odd}},
]

and

[
c(d):=
\frac{d}{\prod_{j\in S(d)}\ell_j}.
\tag{4}
]

Every (\ell_j)-adic valuation of (c(d)) is even, and

[
d=c(d)\prod_{j\in S(d)}\ell_j.
]

For an integer (c) whose (\ell_j)-adic valuations are all even, define

[
\mathcal C(c)
:=
\left{
c\prod_{j\in S}\ell_j:S\subseteq[r]
\right}.
\tag{5}
]

## Lemma 1: canonical cube partition

The families (\mathcal C(c)) partition the positive integers. Within one cube,

[
c\ell_S\mid c\ell_T
\quad\Longleftrightarrow\quad
S\subseteq T.
\tag{6}
]

### Proof

Existence follows from (4).

If

[
c\ell_S=c'\ell_T
]

and all coordinate-prime valuations of (c,c') are even, comparison modulo (2) of the (\ell_j)-adic valuations gives (S=T). Cancellation then gives (c=c'). This proves uniqueness.

Equation (6) follows by cancelling the common factor (c). ∎

This is the required canonical splitter. A refinement never creates a new batch identifier: it only reveals another face of the already fixed cube (\mathcal C(c)).

In particular, the sequential Boolean history that reveals all (2^r) signatures over one core has lifetime capacity (2^r), not the instantaneous Sperner width. That loss is acceptable because (2^r=H^{o(1)}) in the parameter regime below.

More importantly, a given face integer occurs in only one canonical cube. It cannot be repeatedly reintroduced under different ancestral descriptions.

---

# 4. All canonical faces remain lift-rich

Work in a shell

[
S_X=(X/2,X].
]

The dangerous lower faces have size at most (X/H). If (d\le X/H), then every face (f) in its canonical cube satisfies

[
f\le c(d)\Pi_r\le d\Pi_r\le \frac{X\Pi_r}{H}.
\tag{7}
]

Put

[
H_0:=\frac{H}{\Pi_r}.
]

Then (f\le X/H_0). The prime lifts

[
fp\in S_X
]

are obtained from primes

[
\frac{X}{2f}<p\le\frac Xf.
]

Uniformly in such (f), the fixed-ratio prime number theorem gives

[
|\mathcal P_X(f)|
\gg
\frac{H_0}{\log H_0}.
\tag{8}
]

Choose

[
r=\left\lfloor\sqrt{\log\log H}\right\rfloor.
\tag{9}
]

Then

[
\log\Pi_r=(1+o(1))r\log r=o(\log H),
]

so

[
\Pi_r=H^{o(1)},\qquad H_0=H^{1-o(1)}.
\tag{10}
]

Also,

[
W_r=\binom r{\lfloor r/2\rfloor}
\le2^r=H^{o(1)}.
\tag{11}
]

Let

[
m_H:=\min_f|\mathcal P_X(f)|
]

over the canonical faces under consideration, and set

[
q_H:=m_H-2W_r.
]

Equations (8)–(11) give

[
\boxed{q_H=H^{1-o(1)}.}
\tag{12}
]

Thus the accepted fresh-batch theorem applies to these canonical cubes.

---

# 5. A blocked canonical slot has one genuine first death

A **canonical lift slot** is a pair ((d,p)), where (d) is a canonical face and (dp\in S_X).

Suppose (d) is still legal at the later activation time, but its (p)-lift (u=dp) is already illegal. Let (a) be the first move comparable with (u).

## Lemma 2: first-death form

The move (a) is a proper divisor of (u) of the form

[
a=ep,\qquad e\mid d.
\tag{13}
]

Immediately before (a) was played, (u) belonged to the nonminimal residual family (Q).

### Proof

Since (d) is legal at the later activation time, it was legal at every earlier time.

The move (a) cannot be a multiple of (u), because then (d\mid u\mid a), making (d) illegal. Nor can (a=u), for the same reason. Thus (a) is a proper divisor of (u).

It cannot divide (d), because that too would make (d) illegal. Since

[
a\mid dp,\qquad a\nmid d,
]

comparison of valuations shows that the only exponent at which (a) exceeds (d) is the exponent of (p), by exactly one. Hence

[
a/p\mid d,
]

which proves (13).

Immediately before (a) was played, both (d) and (u) were legal, with (d) a proper divisor of (u). Therefore (u\in Q). ∎

This is an actual-state fact, not a bookkeeping convention. Once (u=dp) dies, it remains dead forever. Later refinement stages cannot generate a second first death of the same slot.

---

# 6. Removing the only remaining slot collisions

Two different canonical slots can represent the same board integer only if

[
dp=d'p'.
\tag{14}
]

If (p=p'), then (d=d'), and Lemma 1 gives the same canonical cube and signature.

If (p\ne p'), equation (14) is precisely a pairwise cross-carrier overlap: the same carrier simultaneously realizes two different prime-removal directions. These are among the pairwise effects already removed and banked in the accepted blocker-game reduction.

Equivalently, for each integer (u) having several representations, retain one canonical representation and pair every other representation with it. This uses (k-1), not (\binom k2), pairwise charges for an integer with (k) representations. The accepted pairwise cleanup therefore leaves an incidence system in which

[
(d,p)\longmapsto dp
\tag{15}
]

is injective.

This is where the diagonal semiprime and covering-array work is used. It is not being reproved or silently assumed away.

---

# 7. Chronological face capacity

Let (\mathscr B_{\rm dep}) be a weighted family of untouched batches that are already advance-depleted when first activated. Choose, for each batch, one witnessing legal face and exactly (q_H) blocked prime lifts of that face.

A rank-(r) batch contains at most (2^r) root units. The standard rank and narrow-size-cell decomposition introduces at most another (2^{O(r)}) multiplicity. Let

[
C_r=2^{O(r)}=H^{o(1)}
\tag{16}
]

be a common bound for this normalized batch-to-face multiplicity.

Let

[
\mathsf P_X
]

be the total paid shell quantity before the activations, comprising:

* newly dead (Q_X)-targets in Shortener’s selected stars, hence the cumulative area
  [
  \sum_i\Delta_i;
  ]
* targets killed directly by intervening Prolonger moves;
* the already accepted pairwise-overlap bank;
* exact/minimal transfers already paid by the cumulative exact-only bank.

## Theorem 3: canonical chronological capacity

Uniformly over every ordered history,

[
\boxed{
q_H,w(\mathscr B_{\rm dep})
\le
C_r,\mathsf P_X
+
o!\left(q_H,w(\mathscr B)\right),
}
\tag{17}
]

where (\mathscr B) is the full active batch family.

### Proof

Expand each depleted batch into at most (C_r) normalized root units. Each unit supplies (q_H) canonical blocked slots.

For every slot ((d,p)), use the first witness from Lemma 2. After removal of the accepted pairwise overlaps, the map (15) is injective. Therefore distinct residual slot incidences correspond to distinct shell integers (u=dp) that genuinely left (Q_X).

If (u) first dies on a maximum-degree Shortener move, it is counted once in that move’s newly killed star. If it dies through a Prolonger move, it is counted in the direct-death term. Pairwise collisions and exact/minimal transfers are counted in their corresponding accepted banks.

Ordinary lift failures, incomplete boundary cubes, and the already removed pairwise exceptional family contribute the displayed lower-order term. No other incidence is possible. ∎

Since (q_H=H^{1-o(1)}) and (C_r=H^{o(1)}),

[
\boxed{
w(\mathscr B_{\rm dep})
\le
H^{-1+o(1)}\mathsf P_X
+
o!\left(w(\mathscr B)\right).
}
\tag{18}
]

This is the missing temporal Hall-capacity bound.

---

# 8. The canonical low-(\operatorname{lcm}) inequality

For every depleted face, retain exactly the (q_H) first witnesses selected above. Let

[
S^\circ_{s,Z}
:=
\sum_{\substack{I:\ |I|=s\L_I\le Z}}N^\circ(I)
]

be the canonical low-(\operatorname{lcm}) sum.

Every face contributes at most (\binom{q_H}{s}), so

[
S^\circ_{s,Z}
\le
w(\mathscr B_{\rm dep})\binom{q_H}{s}.
]

Applying (17),

[
\boxed{
S^\circ_{s,Z}
\le
o!\left(
w(\mathscr B)\binom{q_H}{s}
\right)
+
\frac{C_r}{q_H},
\mathsf P_X
\binom{q_H}{s}.
}
\tag{TL(_{\rm can})}
]

Because

[
\frac{C_r}{q_H}=H^{-1+o(1)},
\tag{19}
]

this is stronger than the chronological inequality required in the accepted separator reduction.

It is uniform in (s) and (Z). In particular, common-core witnesses with

[
L_I=e
]

for every tuple cause no difficulty: each blocked face–tag slot still has a distinct first-dead carrier, except for pairwise overlaps already banked.

---

# 9. Why the inheritance counterexample no longer applies

The failed width theorem asserted an instantaneous bound

[
W_r\mathfrak T(n)
]

on lifetime capacity. That promotion was invalid.

The present argument makes no such assertion. Over one canonical cube, an old spoiler may indeed be inherited by all (2^r) Boolean signatures. There are two possibilities:

1. those signatures correspond to distinct lift integers (dp); then the spoiler genuinely first-killed those distinct (Q)-elements, and they are paid in its shell degree;
2. two descriptions correspond to the same integer; then canonical cube uniqueness and the pairwise cleanup merge them.

Thus the verified (128)-versus-(48) example is handled with lifetime factor (2^r), not width (W_r). Since

[
2^r=H^{o(1)},
]

that loss is harmless in the arithmetic hierarchy.

Nor is this the invalid practice of merely marking a repeatedly used static certificate “stale.” A canonical slot is the concrete board integer (dp). Its first death is an irreversible change in the actual legal set.

---

# 10. Consequence for the shell-area argument

The accepted batch reduction supplies, in one shell, on the order of

[
\frac{X}{H,2^r}
]

normalized repair batches per pass. If a fixed positive proportion is advance-depleted, (17) forces

[
\mathsf P_X
\gg
\frac{q_H}{C_r}
\frac{X}{H,2^r}
===============

\frac{X}{H^{o(1)}}.
\tag{20}
]

If instead most batches are fresh, the accepted fresh-batch theorem processes them, against arbitrary intervening moves, using at most

[
W_r
===

\Theta!\left(\frac{2^r}{\sqrt r}\right)
]

moves per batch. One pass therefore costs

[
O\left(
\frac{X}{H2^r}W_r
\right)
=======

O\left(\frac{X}{H\sqrt r}\right).
\tag{21}
]

All losses hidden in (20) are (H^{o(1)}). Hence after at most (H^{o(1)}) passes, either:

* a constant fraction of the shell has left (Q_X) through maximum-degree stars or direct Prolonger kills; or
* an inadmissibly large exact/minimal bank has accumulated, contradicting the accepted cumulative exact-only bound during a sublinear prefix.

The total number of turns is

[
\frac{X}{H^{1-o(1)}}.
\tag{22}
]

Thus there is a function

[
h(n)=H(n)^{1-o(1)}\longrightarrow\infty
]

for which the accepted online-area statement holds:

[
|Q_X(\mathrm{end})|
\le
\frac12|Q_X(\mathrm{start})|
+
\frac{X}{h(n)^2}
]

after (O(X/h(n))) focused maximum-degree turns. Repeating for (O(\log h)) blocks reduces the shell residual to (O(X/h)) in

[
O\left(\frac{X\log h}{h}\right)
]

turns.

For example, one may take

[
H(n)=\exp!\left((\log\log n)^{1/3}\right),
\qquad
r=\left\lfloor\sqrt{\log\log H(n)}\right\rfloor;
]

all the (2^{O(r)}), primorial, cell, and covering-array factors are then (H^{o(1)}), while (h(n)\to\infty).

---

# 11. Completion of the game bound

Shortener uses the accepted strategy:

1. perform the smooth/rough trapping sweep;
2. process dyadic shells from the top downward;
3. in each shell, use the maximum-current-(Q)-degree move and the canonical batch accounting above.

The total focused prefix has length

[
O\left(\frac{n\log h}{h}\right)=o(n).
]

After all shells above (n/h) have been processed:

* their total nonminimal legal residual is (o(n));
* the bottom interval contains (O(n/h)=o(n)) integers;
* by the accepted static completion theorem, the complete set of minimal legal elements at this sublinear prefix has size (o(n)).

Thus the entire legal set at that checkpoint has size (o(n)). Legality only decreases, so every continuation contains only (o(n)) further moves.

Therefore Shortener has a strategy forcing

[
\boxed{L(n)=o(n).}
]

The maximum-degree assumption is fully justified here: this is an explicit Shortener upper-bound strategy. No claim that maximum-degree or minimal-legal play is optimal for Prolonger’s lower-bound problem is being made.

Combining this with the manuscript’s unconditional rank-three lower bound leaves

[
\boxed{
c_\delta\frac{n(\log\log n)^2}{\log n}
\le
L(n)
====

o(n)
\qquad(0<\delta<1/4).
}
]

The earlier constant-linear upper bound and the established lower-bound constructions are documented in the supplied manuscript. 

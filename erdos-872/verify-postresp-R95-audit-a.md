---
id: R95-audit-a-move-index-trace-collapse
type: verification
date: 2026-07-12
intent: >
  Adversarial audit of the claimed dichotomy resolution L(n) = o(n) via
  the canonical first-witness chronological capacity argument.
predecessors: [R95-canonical-first-witness-tl-claim]
action:
  kind: refutes
  target: R95-canonical-first-witness-tl-claim
claim: >
  The claimed proof does not hold as stated and L(n) = o(n) does not
  follow. The first literal failure is in the canonical-witness setup
  (Section 2, equation (3)), before the capacity theorem; Sections 4,
  6-7, and 10 contain independent fatal gaps, including a
  player-quantifier reversal in the final assembly that alone prevents
  the last two sections from defining a valid Shortener strategy.
failure_mechanism: >
  First broken step: the canonical tuple multiplicity groups witness
  tuples only by the INDICES of witnessing moves, I(d, J) =
  {i(d,p) : p in J}, and then treats each fixed move index i as having
  one fixed decomposition a_i = e_i p_i with one fixed trace e_i. False:
  the same move can first-witness different prime tags with different
  traces for different faces that remain legal. Concrete board: n =
  3000, shell (1500, 3000], single move a = 143 = 11 * 13 first-blocks
  u = 13d at tag p = 13 with trace 11 for one legal face and u' = 11d'
  at tag p' = 11 with trace 13 for another, so lcm-by-index and the
  equality (2) / bound (3) are not well-defined for an index-only tuple.
  Granting an unstated tagged-orientation cleanup, four independent
  defects remain, each fatal: (i) the lift-richness bound q_H =
  H^{1-o(1)} is not uniform over admissible lifts (the fixed-ratio PNT
  count applies to the canonical-cube faces only under constraints the
  proof does not establish for all faces it charges); (ii) the pairwise
  cross-carrier cleanup is invoked as a GLOBAL, CHRONOLOGICAL
  injectivity statement while the accepted result is per-snapshot —
  silently strengthened; (iii) Theorem 3 lacks precisely the lifetime
  incidence-multiplicity bound it needs — slot death is irreversible,
  but the same slot can be reused under the same canonical description
  in later batches, so the per-slot payment does not sum; (iv)
  fresh-batch persistence is used with the players REVERSED: it is a
  Prolonger-clearing theorem (Prolonger plays the W_r carrier moves
  against arbitrary replies), and Sections 10-11 deploy it as if
  Shortener could schedule those clearings inside a Shortener
  upper-bound strategy — the pass argument and the online-area halving
  derivation therefore do not define a legal Shortener strategy.
  Cumulative banks are also reused across passes without a shell-local
  exact-bank control. Verdict table: valuation lemmas (cube partition,
  first-death form) survive; everything from the capacity theorem
  through the assembly fails.
implications:
  - The dichotomy remains open; the unconditional bracket stands.
  - The canonical-cube and first-death machinery survive audit and enter the toolbox; the missing piece is again a lifetime incidence-multiplicity bound plus a correctly-quantified policy - the same minimax gap isolated by the anchor construction.
verifiers_at_time:
  - [adversarial-audit-a, refutes]
  - [adversarial-audit-b, pending at save time - narration converging on the same section-2 break and player reversal]
confidence_at_time: high
strategy_dependence: independent
prompt: erdos-872/prompts/audit-R95-canonical-tl-adversarial.md
---

# Verdict: **DOES NOT HOLD AS STATED**

The first literal failure occurs in Section 2, before Theorem 3. Independently, Sections 4, 6–7, and 10 contain additional fatal gaps, including a player-quantifier reversal in the final assembly. 

## Exact first broken step: Section 2, equation (3)

The proof groups canonical witness tuples only by the **indices of the witnessing moves**:

[
I(d,J)={i(d,p):p\in J}.
]

It then treats each fixed move index (i\in I) as having a fixed decomposition

[
a_i=e_i p_i
]

and hence a fixed trace (e_i). That is false: the same move can first witness different prime tags for different faces that remain legal.

Take the board (n=3000), shell

[
S_{3000}=(1500,3000],
]

and play the single move

[
a=143=11\cdot13.
]

Use the two faces and tags

[
\begin{array}{c|c|c|c}
d & p & u=dp & e=a/p\ \hline
221=13\cdot17 & 11 & 2431=11\cdot13\cdot17 & 13\
209=11\cdot19 & 13 & 2717=11\cdot13\cdot19 & 11
\end{array}
]

Both (u=2431,2717) lie in the shell. Before (143) is played, each (u) is legal and nonminimal because its corresponding (d) is a legal proper divisor. The move (143) divides both lifts, but it is incomparable with both faces:

[
143\nmid221,\quad221\nmid143,\qquad
143\nmid209,\quad209\nmid143.
]

Thus both faces remain legal while both lifts die, and

[
i(221,11)=i(209,13)=1.
]

For (q=s=1), with unit weights,

[
I={1},\qquad N^\circ({1})=2.
]

But there is no single trace (e_1) attached to the index (1):

* for the first face, (e_1=143/11=13);
* for the second face, (e_1=143/13=11).

If equation (3) uses (e_1=13), only (221) is divisible by (13), so the relevant divisor count is (1<2). If it uses (e_1=11), only (209) is counted. There is therefore no well-defined (L_I), and

[
N^\circ(I)
\le N_{\mathcal F}!\left(\operatorname{lcm}_{i\in I}e_i\right)
\tag{3}
]

does not follow.

Crucially,

[
2431\ne2717.
]

So Section 6’s cleanup of collisions (dp=d'p') does **not** remove this example. Avoiding it would require an additional global tagged-orientation cleanup saying that every retained move index has one prime-tag orientation across every face assigned to it. No such statement is among the quoted givens or proved before (3).

Consequently, the claimed canonical low-(\operatorname{lcm}) decomposition is already invalid.

---

# The requested key checks

## 1. Lemma 1 and Lemma 2

### Lemma 1: the valuation argument itself is correct

For every coordinate prime (\ell_j), subtracting one copy exactly when (v_{\ell_j}(d)) is odd makes the valuation of (c(d)) even. Equality

[
c\ell_S=c'\ell_T
]

forces (S=T) by parity of the (\ell_j)-adic valuations, and then (c=c'). Within one fixed cube, cancellation of (c) gives

[
c\ell_S\mid c\ell_T\iff S\subseteq T.
]

So the canonical cubes do partition the positive integers.

What does **not** follow is the later temporal claim. A face having one canonical cube does not imply that the same face, slot, or cube cannot be activated repeatedly in different passes or batch records. Canonical uniqueness rules out different cube labels; it does not provide a lifetime “used once” property.

### Lemma 2: correct under its stated hypothesis

Suppose (d) is legal at the later activation time and (u=dp) is already illegal. Since legality is monotone decreasing, (d) was legal at every earlier time. The first selected number (a) comparable with (u) is therefore well-defined.

It cannot satisfy (u\mid a), because then (d\mid a), killing (d). It cannot equal (u), for the same reason. It cannot divide (d), again because that would kill (d). Hence

[
a\mid dp,\qquad a\nmid d.
]

Every valuation of (a) other than the (p)-valuation is bounded by the corresponding valuation of (d); at (p), the excess is exactly one. Therefore

[
a=ep,\qquad e\mid d.
]

Immediately before (a), both (d) and (u) are legal and (d\mid u) properly, so (u\in Q). Once (a) is selected, (u) remains illegal permanently.

Thus **Lemma 2 and the irreversibility assertion survive**.

---

## 2. Section 6: the claimed pairwise cleanup is not established in the required form

For one fixed target integer (u) with (k) distinct representations (u=d_ip_i), it is combinatorially true that retaining one representation and pairing every other representation to it uses (k-1) pairs rather than (\binom{k}{2}).

But Section 6 needs a much stronger theorem:

> Over the union of all slot incidences produced during the entire adaptive history, across all activations and passes, one can discard every excess incidence at total **weighted** bank cost
> [
> \sum_u(k_u-1),
> ]
> and no retained slot or paid collision is ever reused.

That lifetime weighted statement is not contained in the quoted phrase “pairwise cross-carrier cleanup.”

A concrete cross-time collision is

[
210=42\cdot5=30\cdot7.
]

Play

[
a=35.
]

Then (35\mid210), while (35) is incomparable with both (42) and (30). Both faces remain legal, and both representations of the same target (210) are dead. One representation can be activated earlier and the other much later. A cleanup valid only for simultaneously active batches will never see the pair.

There is an even more basic lifetime issue: the same representation ((d,p)) can occur in several batch incidences. Then the number (k) of distinct representations may equal (1), so “(k-1)” pays nothing, even though the same dead target has been used repeatedly.

Section 7 later makes exactly this invalid inference:

[
\text{injectivity on distinct pairs }(d,p)
\quad\Longrightarrow\quad
\text{injectivity on batch slot incidences}.
]

That implication is false unless one proves a global bound on the occurrence multiplicity of each pair. Canonical cube uniqueness does not prove it.

So Section 6 silently upgrades the accepted cleanup to a global, weighted, adaptive, no-reuse cleanup.

---

## 3. Theorem 3 and the specified stress tests

### 3(a). A played prime (a=p)

This case does **not** refute Theorem 3 provided (\mathsf P_X) is a count of dead targets rather than moves.

A sandbox enumeration on (n=X=500) gives a clean example. Before playing (p=5), the shell is

[
(250,500].
]

Playing (5) kills all (50) shell multiples

[
255,260,\ldots,500.
]

There are (40) valid (5)-slots of the form (u=5d) with

[
51\le d\le100,\qquad5\nmid d.
]

All have trace (e=1). Thus one actual move first-kills at least (40) selected canonical slots.

* If (\mathsf P_X) meant **one move**, any bound with (O(1)) payment would fail immediately.
* If Shortener plays (5), those targets are counted in the newly dead star (\Delta_i).
* If Prolonger plays (5), they must be counted in the direct-Prolonger-death **target count**.

The proof’s wording defines these terms as target counts, so the prime example is locally covered by the star/direct-death component. But it proves that (\mathsf P_X) cannot be interpreted as a move bank. One move can have arbitrarily large payment.

It also does not fix equation (3): the prime case happens to have a unique trace (e=1), whereas the (143) example above has incompatible tag orientations.

### 3(b). Reverse divisibility: (a\mid d)

Take (n=X=1000), play the Prolonger move (a=6), and use tag (p=17). The five faces

[
d\in{30,36,42,48,54}
]

have shell lifts

[
510,612,714,816,918.
]

The move (6) divides every face and every lift. Thus one move destroys all five face bases and all five lift families.

This does not contradict Lemma 2, because Lemma 2 assumes the face is still legal at activation. Here every (d) is dead.

It does expose an omitted case in the pass argument. Such a batch is neither:

* advance-depleted with a surviving legal witnessing face, nor
* fresh at activation.

It has been destroyed before activation. That is favorable to Shortener only if the reduction proves a target-injective, bounded-multiplicity charge from destroyed batch weight to the directly killed shell targets. The claimed proof supplies no such statement. Merely including “targets killed directly by Prolonger” in (\mathsf P_X) does not establish the required batch-to-target multiplicity.

### 3(c). What exactly is (\mathsf P_X), and can it be reused?

For (17), (\mathsf P_X) must be measured in **target/incidence units**, not move units. But its four components are not shown to form a disjoint bank:

1. A first death on a Shortener move and a first death on a Prolonger move are mutually exclusive.
2. A first death and a first transfer to minimal/exact-only status can be made disjoint by explicitly charging the first exit from (Q_X).
3. The pairwise-overlap bank is not an exit type. The same target may already have been counted in a Shortener star or a Prolonger death and then be counted again for its multiple representations.

Overcounting is harmless when proving an **upper** bound such as (17), because it enlarges the right-hand side. It becomes fatal in Section 10, where a large (\mathsf P_X) is treated as evidence of a correspondingly large amount of new shell progress or exact-only mass.

There is also no no-reuse statement between passes. In (17), (\mathsf P_X) is the cumulative paid quantity “before the activations.” The same historical dead target can therefore certify separately chosen depleted batch families in multiple passes. Applying (17) once per pass does not show that (\mathsf P_X) increases once per pass.

An exact target integer lies in only one fixed dyadic shell, so literal cross-shell duplication is avoidable. The unresolved duplication is mainly across repeated passes and batch activations within the same shell.

### The (C_r) multiplicity is not proved

The decisive sentence is:

> “After removal of the accepted pairwise overlaps, the map (15) is injective. Therefore distinct residual slot incidences correspond to distinct shell integers.”

Injection of the function

[
(d,p)\mapsto dp
]

on **distinct pairs** does not imply that two different batch incidences cannot contain the same pair ((d,p)).

For the inference to work, the proof needs the lifetime multiplicity bound

[
\sup_{d,p}
#{\text{normalized batch incidences over the entire history using }(d,p)}
\le C_r.
]

The facts that one cube has (2^r) signatures and one static decomposition has (2^{O(r)}) cells do not establish this chronological statement. Repeated activations under the same canonical description remain possible.

Thus Theorem 3 is not proved even after one grants a static pairwise cleanup.

---

## 4. Sections 10–11: the Shortener assembly is invalid

### Fatal player-quantifier reversal

The quoted fresh-batch theorem is a **Prolonger-side** theorem. Its logical form is of the type

[
\exists\ \text{a Prolonger carrier policy}\quad
\forall\ \text{opponent replies},\quad
\text{the batch clears within }W_r\text{ carrier moves}.
]

Section 10 uses it as though it implied

[
\exists\ \text{a Shortener policy}\quad
\forall\ \text{Prolonger play},\quad
\text{all fresh batches are processed at cost }W_r\text{ each}.
]

That is a quantifier reversal.

There are only two possible interpretations of the (W_r) carrier moves:

* **Prolonger plays them.** They are scored game moves and may be counted in the total length, but Prolonger is not compelled to play the nominated carriers. “Against arbitrary intervening replies” does not force him to initiate or continue the carrier schedule.
* **Shortener plays them.** The stated theorem is not a theorem about Shortener playing those moves. Moreover, the claimed Shortener strategy is maximum-current-(Q)-degree play; there is no proof that the required carrier moves are the maximum-degree moves.

Therefore equation (21) is not the cost of any demonstrated Shortener strategy.

### The per-pass either/or does not accumulate

Even granting (17), equation (20) only proves that the **cumulative** (\mathsf P_X) is already at least (X/H^{o(1)}) when a depleted family is activated. It does not prove a fresh increment of that size.

To conclude that (H^{o(1)}) passes accumulate (\Theta(X)) progress, one needs the depleted batch-slot incidences from different passes to be globally disjoint or consumed after use. That is precisely the unproved lifetime no-reuse statement.

### The exact-only bank is global, not shell-local

The accepted exact-only estimate is

[
E(n,t)=o(n)+t.
]

Section 10 needs something of the form

[
E_X\ll \frac{X}{h^2}
]

for each shell, or a proved allocation of the global bank among shells. That does not follow.

For a lower processed shell (X=n/h), even an exact-only accumulation of order (X=n/h) is still (o(n)), so it does not contradict the quoted global bound. Thus the claimed alternative

> “an inadmissibly large exact/minimal bank has accumulated”

is not justified uniformly over shells.

Consequently, the asserted halving estimate

[
|Q_X(\mathrm{end})|
\le \frac12|Q_X(\mathrm{start})|+\frac{X}{h^2}
]

has not been derived.

### Final summation

Conditional on having the stated shell-halving result, the final summation is sound:

* there are (O(\log h)) dyadic levels above (n/h);
* the geometric sum of their (X)-values is (O(n));
* hence (O(X\log h/h)) per shell sums to (O(n\log h/h)=o(n));
* both players’ turns only introduce a constant factor;
* the accepted static-completion theorem then applies to the sublinear chosen prefix.

So Section 11’s bookkeeping is reasonable **conditional on Section 10**, but Section 10 does not establish its hypothesis.

---

# 5. Parameter arithmetic

| Formula  | Status                                                                                                                                           |
| -------- | ------------------------------------------------------------------------------------------------------------------------------------------------ |
| (7)      | Correct: (c(d)\le d) and every cube member is at most (c(d)\Pi_r).                                                                               |
| (8)      | Not valid for legal lifts as stated; it counts interval primes without controlling (p\mid f).                                                    |
| (9)–(11) | The asymptotic arithmetic is correct.                                                                                                            |
| (12)     | Does not follow because (8) does not give a uniform supply of admissible lifts.                                                                  |
| (16)     | (2^{O(r)}=H^{o(1)}) is arithmetically correct, but the claimed lifetime multiplicity (C_r) is unproved.                                          |
| (19)     | Algebraically correct conditional on (q_H) and (C_r).                                                                                            |
| (20)     | The displayed exponent arithmetic is correct conditional on (17); its interpretation as new per-pass progress is false.                          |
| (21)     | (\binom r{\lfloor r/2\rfloor}=\Theta(2^r/\sqrt r)) and the multiplication are correct; the moves are not under Shortener’s demonstrated control. |
| (22)     | Follows arithmetically from (H^{o(1)}) passes of the stated cost, but neither the pass count nor the controllable cost has been proved.          |

### Concrete failure of (8)

Under the lift convention (p\nmid f), take a large (y) and define

[
f_y=\prod_{y/2<p\le y}p,\qquad X_y=yf_y.
]

Then

[
\frac{X_y}{2f_y}<p\le\frac{X_y}{f_y}
\iff
\frac y2<p\le y.
]

Every prime in this interval divides (f_y), so there are **zero** admissible prime lifts, despite the PNT supplying (\asymp y/\log y) primes in the interval.

The sandbox instance (y=20) gives

[
f=11\cdot13\cdot17\cdot19=46189,\qquad X=923780,
]

and every one of (11,13,17,19) divides (f).

For the proposed sample choice

[
H(n)=\exp((\log\log n)^{1/3}),
]

the asymptotic family remains within the claimed size range: since (\log X_y\asymp y),

[
H(X_y)=\exp((\log y+O(1))^{1/3})=y^{o(1)}<y,
]

so

[
f_y=\frac{X_y}{y}\le\frac{X_y}{H(X_y)}.
]

Thus (8) does not follow from the written size hypothesis. Any claim that such faces were already removed as “ordinary lift failures” would require a quantitative theorem showing that their total weight is lower-order; no such invocation appears here.

### The sample (H) handles the explicit (2^{O(r)}) factors, but not unspecified (o(n)) errors

Put (T=\log\log n). Then

[
\log H=T^{1/3},\qquad
r\asymp\sqrt{\log T},
]

and

[
\log\Pi_r=O(\sqrt{\log T}\log\log T)=o(T^{1/3})=o(\log H).
]

So the primorial and Boolean factors are indeed (H^{o(1)}).

But the accepted exact-only and exceptional estimates are merely (o(n)), with no rate. For example, an allowed error

[
\frac{n}{\log\log\log n}=o(n)
]

is much larger than

[
\frac{n}{h^3}
]

for the displayed (h\approx\exp(T^{1/3})). Therefore the explicit choice of (H) does not justify the claimed (X/h^2) shell error. A separate rate-sensitive diagonal argument would be needed, and none is given.

---

# Section-by-section status

| Section | Status                                         | Referee finding                                                                                                                                                |
| ------: | ---------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|       1 | **Holds**                                      | The raw historical-tuple counterexample is valid, subject to the stated easy size choices.                                                                     |
|       2 | **Fails**                                      | Equation (3) is the first broken inference: a move index does not determine its tag or trace across faces.                                                     |
|       3 | **Lemma holds; temporal consequence does not** | The cube partition is correct, but canonical uniqueness does not imply one activation or one lifetime slot incidence.                                          |
|       4 | **Fails**                                      | Equation (8) counts primes, not necessarily admissible lifts (p\nmid f); consequently (12) and the fresh-batch invocation are unsupported.                     |
|       5 | **Holds**                                      | First death is well-defined, has form (a=ep), occurs while (u\in Q), and is irreversible.                                                                      |
|       6 | **Not established**                            | Static (k-1) pairing is true, but the required weighted global adaptive cleanup and no-reuse property are not among the givens.                                |
|       7 | **Fails**                                      | Injection on distinct slot pairs is promoted to injection on chronological slot incidences; the lifetime (C_r) multiplicity is unproved.                       |
|       8 | **Fails**                                      | Depends on false (3) and unproved (17); moreover (L_I) is not well-defined for an index-only tuple.                                                            |
|       9 | **Incomplete**                                 | Slot death is irreversible, but the same slot can be reused under the same canonical description in later batches.                                             |
|      10 | **Fails**                                      | Fresh-batch persistence is used with the wrong player quantifier; cumulative banks are reused; no shell-local exact-bank control or halving proof is supplied. |
|      11 | **Conditional only**                           | The geometric shell summation and static completion are sound if the online-area hypothesis has been proved, but it has not.                                   |

## Bottom line

The claimed conclusion

[
L(n)=o(n)
]

does not follow.

The earliest explicit false inference is equation (3). Even after granting an unstated tagged-orientation cleanup to bypass that counterexample, the proof still fails because:

[
\boxed{
\begin{gathered}
\text{the lift-richness bound is not uniform for admissible lifts,}\
\text{the pairwise cleanup is silently made global and chronological,}\
\text{Theorem 3 lacks a lifetime incidence-multiplicity bound,}\
\text{and fresh-batch persistence is used with the players reversed.}
\end{gathered}
}
]

The last of these alone prevents Sections 10–11 from defining a valid Shortener strategy.

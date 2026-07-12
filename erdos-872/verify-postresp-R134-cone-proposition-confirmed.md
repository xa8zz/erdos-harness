---
id: R134-cone-proposition-confirmed
type: verification
date: 2026-07-12
intent: >
  Adversarial referee audit of the maximal-cone greedy proposition
  (uniform completion modulus mu_n(3 alpha_n) = o(alpha_n) implies
  L(n) = o(n)) before load-bearing use, plus its cone lemma and the
  associated negative claims.
predecessors: [R126-completion-modulus-sufficient-condition]
action:
  kind: confirms
  target: R126-completion-modulus-sufficient-condition
claim: >
  Verdicts: A VALID (global minimal-cone lemma airtight — direct proof
  via minimal element of the legal divisor set, no maximality needed;
  overlap of cones only helps; exclude the terminal 0/0 case), B
  REPAIRABLE and TRUE (the proposition holds; repairs are local: an
  explicit round indexing measuring the legal count after Prolonger's
  move, and the omitted deduction n alpha_n -> infinity, which follows
  from mu >= 1/n and mu/alpha -> 0; with those, budget counting
  2t+1 <= 3 alpha n, per-round contraction, exponential estimate, and
  the continuation bound by monotone legality are all verified), C
  REPAIRABLE (the qualitative-vs-quantitative non-implication is
  correct after replacing the literal sqrt(alpha) modulus by a
  baseline-corrected b_n + sqrt(alpha); the peel non-composability
  witness H = sqrt(n), |C| ~ n/log n is quantifier-clean; the log* H
  recurrence escape is correct once truncated, with the caveat that it
  is an abstract countermodel, not a claim about actual divisibility
  layers). The proposition may safely become load-bearing.
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/audit-R134-completion-modulus-proposition.md
---

I audited the three claims in the uploaded document as written. 

## Verdict summary

| Item | Verdict | Bottom line |
|---|---|---|
| **A. Global minimal-cone lemma** | **VALID** | Every legal \(x\) is a multiple of a divisibility-minimal legal element, and (1) follows even though the cones may overlap. Only the terminal \(0/0\) case should be excluded explicitly. |
| **B. Proposition** | **REPAIRABLE** | The proposition is true. The written proof needs a precise round indexing and one omitted deduction, \(n\alpha_n\to\infty\), to justify the floor estimates. After those repairs, every step is valid. |
| **C. Negative claims** | **REPAIRABLE** | The substantive non-implication and peel obstruction are correct. The literal display \(\mu_n(\alpha)\asymp\sqrt\alpha\) is not globally compatible with the discrete nonzero baseline at very small \(\alpha\); a baseline-corrected modulus fixes it. The \(\log^*H\) recurrence argument is correct after truncating the recurrence and stating its quantifiers precisely. |

No principal claim is refuted.

---

# A. Global minimal-cone lemma

## Verdict: **VALID**

Let

\[
\mathcal L(A)=\{x\in\{2,\dots,n\}:x\text{ is legal at }A\}
\]

and let \(M(A)\) be the divisibility-minimal members of \(\mathcal L(A)\).

The key assertion is

\[
\forall x\in\mathcal L(A)\quad \exists m\in M(A)\quad m\mid x.
\]

This is airtight. In fact, it does not require invoking maximality of \(A\cup M(A)\). For a given \(x\in\mathcal L(A)\), consider

\[
D_x=\{d\in\mathcal L(A):d\mid x\}.
\]

This set is finite and nonempty because \(x\in D_x\). Choose a divisibility-minimal \(m\in D_x\). If some legal \(y\) properly divided \(m\), then \(y\mid m\mid x\), so \(y\in D_x\), contradicting the choice of \(m\). Thus \(m\in M(A)\), and by construction \(m\mid x\).

The document’s own argument is also correct. If \(x\) and \(m\) are comparable, there are three possibilities:

\[
x=m,\qquad m\mid x\text{ properly},\qquad x\mid m\text{ properly}.
\]

The third possibility is impossible because \(x\in\mathcal L(A)\) would then be a proper legal divisor of the minimal legal element \(m\). Therefore \(m\mid x\), allowing equality.

Consequently,

\[
\mathcal L(A)=\bigcup_{m\in M(A)}C_A(m),
\qquad
C_A(m)=\{x\in\mathcal L(A):m\mid x\}.
\]

The cones need not be disjoint: for example, one legal integer may be divisible by two incomparable minimal legal integers. But overlap has the favorable direction:

\[
|\mathcal L(A)|
=
\left|\bigcup_{m\in M(A)}C_A(m)\right|
\le
\sum_{m\in M(A)}|C_A(m)|
\le
|M(A)|\max_{m\in M(A)}|C_A(m)|.
\]

Thus

\[
\max_{m\in M(A)}|C_A(m)|
\ge
\frac{|\mathcal L(A)|}{|M(A)|}.
\tag{1}
\]

The only formal caveat is that at a terminal position,

\[
\mathcal L(A)=M(A)=\varnothing,
\]

so the displayed quotient is \(0/0\). Equation (1) should therefore be stated for nonterminal positions, equivalently whenever \(\mathcal L(A)\ne\varnothing\). Every use in the document is in that regime.

The claimed consequence also follows: if

\[
|\mathcal L(A)|\ge \eta n
\quad\text{and}\quad
|M(A)|=o(n),
\]

then

\[
\max_m |C_A(m)|
\ge
\frac{\eta n}{o(n)}
=
\omega(1).
\]

---

# B. The proposition

## Verdict: **REPAIRABLE**

The implication

\[
\mu_n(3\alpha_n)=o(\alpha_n)
\quad\Longrightarrow\quad
L(n)=o(n)
\]

is correct. There is no adversarial counterplay that defeats the maximal-cone strategy.

The proof as written is not quite referee-tight for two reasons:

1. \(A_t\) and the exact time at which \(Q_t\) is measured are not defined. Depending on whether \(Q_t\) is measured before or after Prolonger’s move, the sentence saying Shortener destroys \(Q_t/(\mu n)\) is either correct or requires an intermediate variable.
2. The bounds
   \[
   T\ge \frac{\alpha_n n}{2},
   \qquad
   2T+1\le 3\alpha_n n
   \]
   require \(\alpha_n n\to\infty\), which is true under the hypothesis but is not proved in the document.

Both repairs are local.

## 1. The modulus is well-defined and monotone

For fixed \(n\),

\[
\mu_n(\alpha)
=
\sup\left\{
\frac{|M(A)|}{n}:
A\text{ primitive and }|A|\le \alpha n
\right\}.
\]

There are finitely many positions, so the supremum is actually a maximum. Moreover, if \(\beta\le\gamma\), then the positions allowed for \(\beta\) form a subset of those allowed for \(\gamma\). Hence

\[
\mu_n(\beta)\le\mu_n(\gamma).
\]

Thus whenever \(|A|\le3\alpha_n n\),

\[
|M(A)|\le \mu_n(3\alpha_n)n.
\]

The claimed equivalence with the qualitative static theorem is also correct. Suppose \(\alpha_n\to0\). Choose a position \(A_n\) attaining the maximum in \(\mu_n(\alpha_n)\). Then

\[
\frac{|A_n|}{n}\le\alpha_n\to0,
\]

so the static theorem gives

\[
\frac{|M(A_n)|}{n}\to0.
\]

Therefore \(\mu_n(\alpha_n)\to0\).

Conversely, for any sequence of primitive positions \(A_n\) with \(|A_n|=o(n)\), put

\[
\alpha_n=\frac{|A_n|}{n}.
\]

Then

\[
\frac{|M(A_n)|}{n}
\le
\mu_n(\alpha_n)
\to0.
\]

So the sequential uniform formulation is indeed equivalent to the stated qualitative conclusion about the number of minimal legal elements.

## 2. The hypothesis forces \(\alpha_n n\to\infty\)

Write

\[
\alpha=\alpha_n,
\qquad
\mu=\mu_n(3\alpha_n).
\]

The empty position is always included in the supremum defining \(\mu\), and \(M(\varnothing)\ne\varnothing\); for example, \(2\) is legal and some divisibility-minimal legal element exists. Hence

\[
\mu n\ge1,
\qquad\text{so}\qquad
\mu\ge\frac1n.
\]

The hypothesis says

\[
\frac{\mu}{\alpha}\to0.
\]

Therefore

\[
0\le \frac1{n\alpha}
\le
\frac{\mu}{\alpha}
\longrightarrow0.
\]

Consequently,

\[
n\alpha\longrightarrow\infty.
\tag{2}
\]

This supplies all the floor estimates omitted in the document. In particular, for sufficiently large \(n\),

\[
T=\lfloor \alpha n\rfloor
\ge \frac{\alpha n}{2}.
\tag{3}
\]

## 3. Count both players’ moves

A clean indexing is to regard one round as:

\[
\text{Prolonger move}\quad+\quad\text{Shortener move}.
\]

Let \(A_t\) be the position immediately after Shortener’s \(t\)-th move, with

\[
A_0=\varnothing,
\qquad
Q_t=|\mathcal L(A_t)|.
\]

Suppose the game has not ended at \(A_t\). Prolonger moves, producing a position \(B_t\). Let

\[
R_t=|\mathcal L(B_t)|.
\]

Legality is monotone under enlarging the chosen set, so

\[
R_t\le Q_t.
\tag{4}
\]

Before Shortener’s \((t+1)\)-st move, the total number of chosen elements is

\[
|B_t|=2t+1.
\]

For \(0\le t<T\),

\[
2t+1
\le
2T-1
<
2\alpha n
\le
3\alpha n.
\tag{5}
\]

Thus every position at which Shortener invokes the cone estimate lies inside the modulus budget. This count includes both players’ moves.

After Shortener’s \(T\)-th move, if all \(T\) rounds occurred, the position has size exactly \(2T\le2\alpha n\). Hence the factor \(3\) is more than sufficient.

If the game ends before all \(T\) Shortener moves occur, the total game already has at most \(2T\) or \(2T-1\) moves and is therefore \(o(n)\). So it remains only to analyze paths on which the first \(T\) rounds are completed.

## 4. The contraction is valid

At \(B_t\), assume the game has not ended, so \(R_t>0\). Then \(M(B_t)\ne\varnothing\), and by (5),

\[
|M(B_t)|\le\mu n.
\]

By the cone lemma, Shortener can choose \(m\in M(B_t)\) satisfying

\[
|C_{B_t}(m)|
\ge
\frac{R_t}{|M(B_t)|}
\ge
\frac{R_t}{\mu n}.
\]

Once \(m\) is played, every member of \(C_{B_t}(m)\) is either \(m\) itself or a multiple of \(m\), so it is no longer legal. Therefore

\[
Q_{t+1}
\le
R_t-\frac{R_t}{\mu n}
=
R_t\left(1-\frac1{\mu n}\right).
\]

Using \(R_t\le Q_t\),

\[
Q_{t+1}
\le
Q_t\left(1-\frac1{\mu n}\right).
\tag{6}
\]

This is the precise version of the document’s per-round contraction.

### Can Prolonger create new legal elements?

No. If \(A\subseteq A'\), then every integer legal at \(A'\) is unchosen and incomparable with every member of \(A'\), hence in particular incomparable with every member of \(A\). Thus

\[
\mathcal L(A')\subseteq\mathcal L(A).
\tag{7}
\]

An integer made illegal by an earlier chosen element can never become legal again because that chosen element remains in the position.

### Can Prolonger end the game?

Yes, but this only helps Shortener. If Prolonger’s move produces \(R_t=0\), then the position is maximal and the game ends immediately. One may set all subsequent \(Q_s=0\), and (6) is trivially satisfied for the purposes of the upper bound.

Similarly, if Shortener’s move ends the game, then \(Q_{t+1}=0\).

## 5. The exponential estimate is correct after (2)

Iterating (6),

\[
Q_T
\le
Q_0\left(1-\frac1{\mu n}\right)^T.
\]

Since the initial legal set has at most \(n\) elements,

\[
Q_0\le n.
\]

Also \(\mu n\ge1\), so \(0\le1/(\mu n)\le1\), and

\[
1-x\le e^{-x}
\]

gives

\[
Q_T
\le
n\exp\left(-\frac{T}{\mu n}\right).
\]

Using (3),

\[
\frac{T}{\mu n}
\ge
\frac{\alpha n/2}{\mu n}
=
\frac{\alpha}{2\mu}.
\]

Therefore

\[
Q_T
\le
n\exp\left(-\frac{\alpha}{2\mu}\right).
\tag{8}
\]

Because \(\mu=o(\alpha)\),

\[
\frac{\alpha}{\mu}\to\infty,
\]

so the exponential factor in (8) tends to zero. Hence

\[
Q_T=o(n).
\]

## 6. The final continuation bound covers both players

Let \(A_\ast=A_T\) be the position at the end of the first stage and let

\[
F=\mathcal L(A_\ast),
\qquad |F|=Q_T.
\]

For every later position \(B\supseteq A_\ast\), monotonicity (7) gives

\[
\mathcal L(B)\subseteq F.
\]

Every subsequent move, whether made by Prolonger or Shortener, must choose a previously unchosen member of the current legal set. Therefore every subsequent move consumes a distinct member of the fixed finite set \(F\). No later move can lie outside \(F\), because legal elements are never created.

Thus the number of all subsequent moves by both players is at most

\[
|F|=Q_T.
\]

After at most \(Q_T\) such moves, either the game has already ended or no legal element remains. Having no legal element is exactly maximality: if the chosen antichain were not maximal, an unchosen integer incomparable with every chosen member would be legal.

The total length is therefore at most

\[
2T+Q_T
\le
2\alpha_n n+o(n)
=
o(n).
\]

This establishes

\[
L(n)=o(n).
\]

So the proposition is safe to use once the proof is replaced by this indexed version.

---

# C. The negative claims

## Overall verdict: **REPAIRABLE**

The conclusions are correct, but some of the displayed examples are schematic rather than literally valid as global two-parameter formulas.

## C(i). Does qualitative vanishing imply the stronger hypothesis?

It does not.

The document’s intended square-root obstruction is correct:

\[
\frac{\alpha}{\sqrt\alpha}=\sqrt\alpha\to0,
\]

whereas the greedy proof needs

\[
\frac{\alpha}{\mu_n(3\alpha)}\to\infty.
\]

However, the literal statement

\[
\mu_n(\alpha)\asymp\sqrt\alpha
\]

cannot hold uniformly all the way down to arbitrary \(\alpha\). For example, if

\[
0\le\alpha<\frac1n,
\]

then the only position with \(|A|\le\alpha n\) is \(A=\varnothing\). Hence \(\mu_n(\alpha)\) is constant and positive throughout that interval:

\[
\mu_n(\alpha)=\frac{|M(\varnothing)|}{n}>0.
\]

It therefore cannot be uniformly comparable to \(\sqrt\alpha\) as \(\alpha\downarrow0\).

A fully correct countermodel is obtained by adding an \(n\)-dependent baseline. Let \(b_n>0\) satisfy \(b_n\to0\), and define the abstract monotone modulus

\[
\nu_n(\alpha)
=
\min\{1,b_n+\sqrt\alpha\}.
\]

Then for every sequence \(\alpha_n\to0\),

\[
\nu_n(\alpha_n)
\le
b_n+\sqrt{\alpha_n}
\longrightarrow0.
\]

Thus it has exactly the qualitative sequential vanishing property.

But for every positive \(\alpha_n\to0\),

\[
\frac{\nu_n(3\alpha_n)}{\alpha_n}
\ge
\frac{\sqrt{3\alpha_n}}{\alpha_n}
=
\frac{\sqrt3}{\sqrt{\alpha_n}}
\longrightarrow\infty.
\]

In particular,

\[
\nu_n(3\alpha_n)\ne o(\alpha_n)
\]

for every such sequence.

If desired, \(\nu_n\) can be rounded upward to multiples of \(1/n\) without changing either conclusion.

Therefore the logical claim is correct:

\[
\bigl[\forall\alpha_n\to0,\ \mu_n(\alpha_n)\to0\bigr]
\not\Longrightarrow
\bigl[\exists\alpha_n\to0,\ \mu_n(3\alpha_n)=o(\alpha_n)\bigr].
\]

The repair is only to replace the globally literal \(\sqrt\alpha\) display by a baseline-corrected family such as \(b_n+\sqrt\alpha\).

## C(ii). The peel-route composition

The arithmetic here is correct.

From

\[
|\mathcal L(A)|\le(2H+1)|C|,
\]

to obtain an \(o(n)\) upper bound from this inequality alone, one needs

\[
(2H+1)|C|=o(n).
\]

For \(H\ge1\), this is equivalent to

\[
H|C|=o(n),
\]

or

\[
|C|=o\left(\frac nH\right).
\tag{9}
\]

The move counting during the peel also works. If Shortener makes \(s=O(n/H)\) peeling moves, then Prolonger has made at most \(s+1\) moves. Hence the entire position has size

\[
|A|\le2s+1=O(n/H)=o(n)
\]

when \(H\to\infty\). So the static theorem does apply, but supplies only

\[
|C|=o(n).
\]

That does not imply (9).

A quantifier-clean witness is obtained by fixing one explicit sequence, for example

\[
H_n=\sqrt n,
\qquad
|C_n|\asymp\frac{n}{\log H_n}
\asymp\frac{2n}{\log n}.
\]

Then

\[
\frac{|C_n|}{n}\asymp\frac2{\log n}\to0,
\]

so \(|C_n|=o(n)\), but

\[
\frac{H_n|C_n|}{n}
\asymp
\frac{2\sqrt n}{\log n}
\longrightarrow\infty.
\]

Thus the continuation estimate may be completely vacuous even though the completion has sublinear size.

The document’s phrase “compatible for every \(H\to\infty\)” should be understood sequencewise, with \(H=H(n)\), preferably restricted to a natural range such as \(2\le H\le n\). Only one such sequence is needed to demonstrate the invalidity of the proposed little-\(o\) composition.

## The \(\log^*H\) recurrence

The arithmetic idea is correct. To make it fully rigorous, replace the untruncated schematic recurrence by

\[
f(x)
=
\min\left\{\frac14,\frac1{\log(1/x)}\right\},
\qquad 0<x\le\frac14.
\]

Set

\[
\alpha_0=\frac1H,
\qquad
\alpha_{j+1}=f(\alpha_j).
\]

Until the truncation is reached, the iterates are exactly

\[
\alpha_1=\frac1{\log H},
\]

\[
\alpha_2=\frac1{\log\log H},
\]

and generally

\[
\alpha_j
=
\frac1{\log^{(j)}H}.
\]

For every fixed \(j\),

\[
\log^{(j)}H\to\infty
\quad\text{as }H\to\infty,
\]

so

\[
\alpha_j\to0.
\]

Thus every fixed-depth induction is compatible with the qualitative static theorem.

On the other hand, let

\[
j_\ast
=
\min\{j:\log^{(j)}H\le4\}.
\]

Then

\[
j_\ast=\log^\ast H+O(1)
\]

and

\[
\alpha_{j_\ast}=\frac14.
\]

So a constant-density layer can appear after only \(O(\log^\ast H)\) iterations, despite every fixed number of iterations producing \(o(1)\) density.

Finally,

\[
\log^\ast H=o(\log\log H),
\]

so this escape occurs far before \(C\log\log H\) layers have been traversed.

There is no arithmetic error here. The necessary qualification is logical: this recurrence is an abstract countermodel showing what the qualitative theorem alone fails to exclude. It is not by itself evidence that the actual divisibility layers obey this recurrence.

---

# Final referee determination

The document’s main structural conclusion survives:

\[
\boxed{
\mu_n(3\alpha_n)=o(\alpha_n)
\text{ for some }\alpha_n\to0
\quad\Longrightarrow\quad
L(n)=o(n).
}
\]

The proposition may safely become load-bearing after its proof is rewritten with explicit round indexing and the deduction \(n\alpha_n\to\infty\).

The negative conclusion also survives:

\[
\mu_n(\alpha_n)\to0
\text{ for every }\alpha_n\to0
\]

does not, by itself, supply the quantitative ratio needed by the greedy argument. Likewise, \(|C|=o(n)\) cannot be composed with the factor \(H\) in the peel continuation estimate without additional uniform rate information.
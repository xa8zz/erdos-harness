---
id: R147-fsc-top-shell-confirmed
type: verification
date: 2026-07-13
intent: >
  Adversarially audit the top-shell clearing theorem FSC(1,eta) and its proof,
  focusing on a flagged disjointness/double-counting concern about
  Q_0-members leaving via becoming minimal rather than becoming illegal.
predecessors: [R145-fsc-top-shell-proven]
action:
  kind: confirms
  target: R145-fsc-top-shell-proven
claim: >
  The audit rules the theorem statement (part A) VALID, the proof (part B)
  VALID, and the J=2 boundary discussion together with the proposed
  counterexample challenge (part C) REPAIRABLE at a quantifier level only.
  Overall disposition: FSC(1,eta) holds for every fixed 0<eta<1.
  Part A: the activation threshold range 0<eta<1 is correctly handled (at
  eta>=1 the strict activation condition is vacuous since |Q_j| <= |S_j|);
  the phase bound K_n = floor(2|S_0|/(eta r(n))) + 2 is genuinely uniform
  over Prolonger strategies and prelude positions, with one clarification:
  "after any o(n)-move prelude" must be read as "for every fixed family of
  preludes uniformly o(n) in length" (no single threshold N is uniform over
  the entire unspecified class of o(n) functions). Part B: every step
  survives — theta = eta/3 works without a large-n proviso; the degree
  theorem reapplies at each of the K_n = o(n) bootstrap turns; each counted
  target u has the chosen d as a legal proper divisor, so u is nonminimal
  and dies the same turn. The critical disjointness concern is resolved
  with a supplied one-line addition: a minimal legal element can never
  later become nonminimal (a legal proper divisor at a later position was
  already legal earlier, contradicting earlier minimality), so members
  leave Q_0 by illegality or by becoming minimal and never re-enter;
  independently, every degree-certified target becomes illegal on the very
  turn it is counted, so deletion sets are pairwise disjoint and
  K_n (eta/2) r(n) > |S_0| forces the phase under K_n turns; Prolonger can
  never re-inflate Q_0. Part C: the obstruction to rescaling the
  upper-half degree theorem is confirmed real via the explicit n=100
  witness d=2, x=40 in S_1, a=62 in S_0 (a kills d globally without
  killing x), though this does not preclude a different method clearing
  the second shell. Repair: the exhaustive negation of the uniform o(n)
  claim is only SUBSEQUENTIAL (exists c > 0 and n_k -> infinity with
  second-shell time >= c n_k), not an all-large-n Omega(n) bound; the
  challenge should be restated accordingly and should fix the prelude
  stopping rule and the tie-break among maximum-deletion moves.
confidence_at_time: high
strategy_dependence: independent
prompt: erdos-872/prompts/audit-R147-fsc-top-shell.md
---

I audited the theorem and proof as stated in the uploaded document. 

# Overall ruling

\[
\boxed{\text{The load-bearing theorem }\mathrm{FSC}(1,\eta)\text{ is VALID for every fixed }0<\eta<1.}
\]

The highlighted disjointness concern does **not** break the proof. A top-shell target can indeed leave \(Q_0\) by becoming minimal rather than illegal, but it cannot subsequently re-enter \(Q_0\), and the targets certified by the degree theorem are made outright illegal by the Shortener move. Prolonger cannot re-inflate \(Q_0\).

The three verdicts are:

| Item | Verdict |
|---|---|
| A. Threshold and theorem statement | **VALID**, with one quantifier clarification |
| B. Proof, including disjointness | **VALID** |
| C. \(J=2\) boundary and repaired challenge | **REPAIRABLE**, only because the stated counterexample alternative is slightly stronger than the exact negation |

---

# A. Threshold range and theorem statement

## Verdict: **VALID**

### Threshold and strictness

Since

\[
Q_j(A)\subseteq S_j,
\]

one always has

\[
|Q_j(A)|\le |S_j|.
\]

The activation condition is

\[
|Q_j(A)|>\eta |S_j|.
\]

Therefore:

- for \(\eta>1\), activation is impossible;
- for \(\eta=1\), activation would require \(|Q_j(A)|>|S_j|\), also impossible;
- the meaningful range is exactly \(0<\eta<1\).

The document handles the strict inequality correctly. There is no boundary error at \(\eta=1\).

### Uniformity over Prolonger

The resulting phase bound is

\[
T_{S_0}(n)<K_n,
\qquad
K_n=
\left\lfloor\frac{2|S_0|}{\eta r(n)}\right\rfloor+2,
\]

and this bound contains no dependence on Prolonger’s strategy or on the actual prelude position. The only use of the prelude is to guarantee that the positions in the bootstrap interval remain sparse.

The precise uniform statement proved is:

> For every fixed \(\eta\in(0,1)\) and every fixed function \(p(n)=o(n)\), uniformly over every legal prelude endpoint satisfying
> \[
> |A^{\mathrm{pre}}|\le p(n)
> \]
> and every Prolonger strategy, the phase lasts fewer than \(K_n=o(n)\) Shortener turns.

That is genuine strategy-uniformity.

There is one standard asymptotic quantifier caveat: it is not meaningful to demand one common threshold \(N\) uniformly over the entire class of all unspecified little-\(o\) functions \(p(n)\). The threshold may depend on the chosen sparsity modulus \(p\). Thus “after any \(o(n)\)-move prelude” should mean “for every fixed family of preludes whose length is uniformly \(o(n)\).” Under that standard interpretation, the theorem statement is correct.

---

# B. Proof audit

## Verdict: **VALID**

Every substantive proof step survives.

## 1. From \(Q_0\) to \(R(A)\)

While the phase is active,

\[
|Q_0(A)|>\eta |S_0|.
\]

Because

\[
|S_0|=\left\lceil\frac n2\right\rceil\ge\frac n2,
\]

this gives, in fact without needing “sufficiently large \(n\),”

\[
|Q_0(A)|>\frac{\eta n}{2}.
\]

Since

\[
Q_0(A)\subseteq R(A)=\mathcal L(A)\cap(n/2,n],
\]

one obtains

\[
|R(A)|\ge |Q_0(A)|>\frac{\eta n}{2}.
\]

Taking

\[
\theta=\frac{\eta}{3}
\]

therefore leaves a fixed margin:

\[
|R(A)|>\frac{\eta n}{2}>\frac{\eta n}{3}=\theta n.
\]

This step is correct.

## 2. Degree availability at every bootstrap turn

Suppose the phase lasts for at least \(K_n\) Shortener turns.

Before any of the first \(K_n\) such turns,

\[
|A|
\le
|A^{\mathrm{pre}}|+2K_n+1.
\]

The \(2K_n+1\) allowance is conservative and covers either parity of the turn at which the prelude ends.

Now

\[
K_n
\le
\frac{2|S_0|}{\eta r(n)}+2
\le
\frac{n+1}{\eta r(n)}+2.
\]

Hence

\[
\frac{K_n}{n}
\le
\frac{1+1/n}{\eta r(n)}+\frac2n
\longrightarrow 0,
\]

because \(r(n)\to\infty\). Therefore \(K_n=o(n)\), and so

\[
|A^{\mathrm{pre}}|+2K_n+1=o(n).
\]

At every one of those first \(K_n\) Shortener turns:

- the sparsity condition \(|A|=o(n)\) holds;
- the phase is assumed still active, so \(|R(A)|\ge\theta n\).

Thus the degree-availability theorem can indeed be reapplied to the **actual current position at every turn**. Prolonger may have blocked all previously attractive divisors; the theorem simply supplies a new currently legal divisor.

The document’s displayed shorthand

\[
K_n=O(n/r(n))
\]

is safest written as

\[
K_n=O(n/r(n)+1)=o(n).
\]

This is only bookkeeping, not a gap. One can alternatively infer \(r(n)=O(n)\) from the fact that a degree cannot exceed \(n\), in which case \(O(n/r(n))\) is also defensible.

## 3. The degree theorem counts current \(Q_0\)-members

The theorem gives a currently legal \(d\le n/2\) with

\[
\deg_A(d)
=
\#\{u\in R(A):d\mid u\}
\ge
(2\theta-o(1))r(n).
\]

With \(\theta=\eta/3\),

\[
2\theta=\frac{2\eta}{3}.
\]

For sufficiently large \(n\), the \(o(1)\) term is at most \(\eta/6\), giving

\[
\deg_A(d)\ge\frac{\eta}{2}r(n).
\]

Now let \(u\) be counted in \(\deg_A(d)\). Then:

- \(u\in R(A)\), so \(u\) is currently legal and \(u>n/2\);
- \(d\) is currently legal and \(d\le n/2\);
- \(d\mid u\), and necessarily \(d<u\).

Therefore \(u\) has a currently legal proper divisor \(d\). It cannot be minimal in the legal divisibility poset. Hence

\[
u\in \mathcal L(A)\setminus\mathcal M(A),
\]

and, because \(u\in S_0\),

\[
u\in Q_0(A).
\]

Moreover, when Shortener chooses \(d\), every such \(u\) becomes illegal immediately, since it is comparable with the newly selected \(d\). Thus this is not merely a potential decrease in some auxiliary degree: it is a deletion of at least

\[
\frac{\eta}{2}r(n)
\]

current \(Q_0\)-members.

## 4. Greedy domination

The certified \(d\) is an admissible legal lower move. The prescribed policy chooses a legal lower move maximizing the number of current \(Q_0\)-members deleted. Therefore its deletion count is at least that of \(d\):

\[
D_t\ge\frac{\eta}{2}r(n)
\]

on every active Shortener turn in the bootstrap interval.

This step is exact; no tie-breaking assumption is needed for the lower bound because every maximizer attains at least the certified value.

## 5. Bootstrap arithmetic

Set

\[
x_n=\frac{2|S_0|}{\eta r(n)}.
\]

Then

\[
K_n=\lfloor x_n\rfloor+2>x_n.
\]

Consequently,

\[
K_n\frac{\eta}{2}r(n)
>
x_n\frac{\eta}{2}r(n)
=
|S_0|.
\]

The strict inequality is valid, including when \(x_n\) is an integer. The \(+2\) is more than sufficient; \(+1\) would already work.

Thus, if the first \(K_n\) Shortener turns deleted pairwise disjoint sets of at least \((\eta/2)r(n)\) targets, they would delete more than \(|S_0|\) distinct elements of \(S_0\).

## 6. The critical disjointness question

A \(Q_0\)-member can indeed leave \(Q_0\) in two different ways:

1. it can become illegal;
2. it can remain legal but become minimal because all its legal proper divisors have disappeared.

The second phenomenon does **not** break the counting.

The relevant monotonicity lemma is:

\[
A\subseteq A'
\quad\Longrightarrow\quad
Q_0(A')\subseteq Q_0(A).
\]

Proof:

- Legal sets shrink:
  \[
  \mathcal L(A')\subseteq\mathcal L(A).
  \]
- Suppose \(u\) is minimal legal at \(A\) and remains legal at \(A'\). If \(u\) had a legal proper divisor at \(A'\), that divisor would also have been legal at \(A\), contradicting minimality at \(A\).
- Therefore a legal minimal element can never later become legal nonminimal.

So an element that leaves \(Q_0\) by becoming minimal cannot re-enter. An element that leaves by becoming illegal also cannot re-enter because legal sets only shrink.

Even more directly, every target supplied by the degree theorem is a multiple of the Shortener move \(d\), and hence becomes illegal on that turn. Such a target is permanently unavailable and cannot be counted on a later Shortener turn.

Therefore the sets

\[
D_1,D_2,\ldots,D_{K_n}
\]

of current \(Q_0\)-members deleted on the distinct Shortener turns are pairwise disjoint.

The document’s sentence

> “Legal sets are monotone decreasing. In particular, a member deleted from \(Q_0\) can never later re-enter \(Q_0\).”

is slightly compressed: legal-set monotonicity alone does not explicitly address a member that left by becoming minimal. But the missing one-line minimality argument above is valid, and the degree-certified targets are made illegal anyway. This is not a substantive proof gap.

## 7. Prolonger cannot disrupt the accounting

Prolonger’s move may:

- make some current \(Q_0\)-members illegal;
- choose a member of \(Q_0\);
- remove legal divisors and thereby make some \(Q_0\)-members minimal;
- block lower moves that were previously attractive;
- play somewhere unrelated.

None of these actions increases \(Q_0\). In fact,

\[
Q_0(A_{t+1})\subseteq Q_0(A_t)
\]

after either player’s move.

Prolonger therefore cannot re-inflate \(Q_0\). Blocking lower candidates is harmless because degree availability is reapplied to the updated position. Deleting or minimalizing targets only helps the phase terminate sooner.

The contradiction is consequently sound:

\[
\sum_{t=1}^{K_n}|D_t|
\ge
K_n\frac{\eta}{2}r(n)
>
|S_0|,
\]

while the \(D_t\) are disjoint subsets of \(S_0\).

Hence the phase has fewer than \(K_n=o(n)\) Shortener turns.

---

# C. The \(J=2\) boundary and repaired challenge

## Verdict: **REPAIRABLE**

The Section 4 mathematical diagnosis is correct. The only repair concerns the exact logical form of the proposed counterexample challenge.

## Section 4: external blockers

The obstruction to naïvely replacing \(n\) by \(n/2\) is real.

For example, with \(n=100\), take

\[
d=2,\qquad x=40,\qquad a=62.
\]

Then

\[
x\in(25,50]=S_1,\qquad a\in(50,100]=S_0,
\]

and

\[
d\mid x,\qquad d\mid a,
\qquad x\nmid a,\qquad a\nmid x.
\]

If \(a\) has previously been selected, then \(d\) is globally illegal because \(d\mid a\). But \(x\) is incomparable with \(a\), so \(a\) does not itself make \(x\) illegal.

If one truncates the game to the smaller board \(\{2,\ldots,n/2\}\), the blocker \(a\) disappears. A divisor may therefore look legal in the rescaled position while being illegal in the actual game. Thus the accepted upper-half theorem cannot simply be invoked with \(n\) replaced by \(n/2\).

This accurately explains why the **present proof and present degree theorem** stop at the top shell. It does not prove that no different degree theorem or different method can clear \(S_1\), and the document does not claim that it does.

## Section 5: exact counterexample formulation

Fixing the prelude rule and fixing or quantifying over maximum-deletion tie-breaks is necessary and correctly identified.

There is one further exactness issue. The negation of a uniform \(o(n)\) assertion is not necessarily an all-sufficiently-large-\(n\) \(\Omega(n)\) lower bound. The exact negation is subsequential:

\[
\exists c>0,\quad
\exists n_k\to\infty,\quad
\exists\text{ Prolonger strategies }\sigma_k
\]

such that

\[
T_{J,\eta}(n_k,\sigma_k)\ge c n_k.
\]

An \(\Omega(n)\) construction valid for all sufficiently large \(n\) would certainly refute FSC, but it is stronger than logically necessary. Therefore the proposed “either/or” is not literally exhaustive if \(\Omega(n)\) is being used in its usual all-large-\(n\) sense.

A completely precise challenge would be:

> Fix the trapping-prelude strategy and stopping rule, with a uniform \(o(n)\) bound over Prolonger. Also fix a prefix-measurable tie-break among maximum-deletion moves, or explicitly state the intended quantifier over tie-breaks. Then either prove \(\mathrm{FSC}(J,\eta)\) for every fixed \(J\ge2\) and \(0<\eta<1\), or exhibit fixed \(J\ge2\), fixed \(0<\eta<1\), a constant \(c>0\), an infinite sequence \(n_k\to\infty\), and Prolonger strategies for which the relevant phase takes at least \(c n_k\) Shortener turns.

# Final disposition

\[
\boxed{
\begin{aligned}
\textbf{A: }&\textbf{VALID},\\
\textbf{B: }&\textbf{VALID},\\
\textbf{C: }&\textbf{REPAIRABLE}\text{ only at the exact counterexample quantifiers.}
\end{aligned}}
\]

Most importantly, the proof of

\[
\boxed{\mathrm{FSC}(1,\eta)\quad\text{for every fixed }0<\eta<1}
\]

survives intact. The possibility that a target becomes minimal, rather than illegal, causes neither double-counting nor re-inflation and does not invalidate the bootstrap argument.
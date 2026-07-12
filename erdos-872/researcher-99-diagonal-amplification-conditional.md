---
id: R99-diagonal-amplification-conditional
type: research
date: 2026-07-12
intent: >
  Prove or disprove fixed-cap entry or an amplification converting
  growing-cap fortress entry into a linear lower bound.
predecessors:
  - R87-primorial-positions-absorbing
  - R96-layer-peeling-chronological-separator
action:
  kind: extends
  target: R87-primorial-positions-absorbing
claim: >
  CONDITIONAL amplification theorem — the hypothesis is NOT established
  by the program; nothing unconditional about L(n) changes. Statement
  proved: if growing-cap entry is available for EVERY function
  H(n) -> infinity (the universal quantifier is essential), then by a
  diagonal/staircase argument there exist constants H_0 and c > 0 with
  entry at the fixed cap H_0 and hence, with the absorbing-fortress
  potential, L(n) >= cn. Mechanism: for a property monotone in H,
  [for all h(n) -> infinity, eventually-for-all n, E(n, h(n))] is
  equivalent to [exists H_0, eventually-for-all n, E(n, H_0)] — the
  reverse implication by monotonicity, the forward by diagonalizing a
  staircase h against failure at every fixed level. IMPORTANT SCOPE
  QUALIFICATIONS recorded by the response itself: (i) the dispatch's
  parenthetical grant ("granted at any H(n) -> infinity if you need
  it") was a hypothetical the program has never proven — no entry
  theorem exists at ANY cap, growing or fixed; (ii) if entry were
  proven for only one particular H_*(n) -> infinity, the diagonal does
  not apply, and the unresolved sub-step becomes a genuinely
  chronological fixed-level advance-depletion bound: for some fixed H
  and r, uniformly over arbitrary Shortener histories, a positive
  linear number of batch faces still possess 2 binom(r, floor(r/2)) + 1
  legal lifts at first activation — static witness and low-lcm
  estimates do not control repeated lifetime use of old blockers at a
  fixed level. The diagonal argument itself warrants audit before any
  promotion (strategy-existence diagonalization has quantifier
  subtleties across n and across opposing strategies), but is not
  promotion-grade while its hypothesis is open.
implications:
  - The Theta side now has a clean sufficient target hierarchy - proving entry at every growing cap suffices (diagonal), proving it at one growing cap gives n^{1-o(1)} only, and the fixed-level advance-depletion bound is the concrete statement separating the two.
  - Curator note - dispatch prompts must not offer hypothetical grants with ambiguous quantifiers; the "granted if you need it" phrasing invited a conditional resolution of the literal statement.
confidence_at_time: low
strategy_dependence: independent
prompt: erdos-872/prompts/researcher-R99-fixed-cap-entry-amplification.md
---

## Verdict

Using the parenthetical grant **literally**—namely, that growing-cap entry is available for **every arbitrarily slowly diverging function** (H(n)\to\infty)—the amplification alternative holds. In fact, that universal growing-cap statement already forces entry at one fixed cap by a diagonal argument.

Consequently, there are constants (H_0) and (c>0) such that, for all sufficiently large (n), Prolonger can force a trapped reservoir (Q) with

[
|Q|\ge cn,\qquad \Delta_Q\le H_0
]

against arbitrary legal Shortener play. The absorbing-fortress theorem then gives (L(n)\ge c'n), and hence

[
L(n)=\Theta(n).
]

The key point is a quantifier distinction: entry for one growing function (H(n)) is insufficient, but entry for every arbitrarily slowly growing (H(n)) is equivalent to entry at some fixed (H_0).

---

# 1. Formalizing the entry property

Fix once and for all a constant

[
0<\alpha<\frac12;
]

for concreteness, take (\alpha=\frac13).

For integers (n\ge2) and (H\ge1), let (\mathsf E_\alpha(n,H)) denote the following statement:

> Prolonger has a strategy such that, against every legal Shortener strategy, some finite prefix of the resulting play reaches a position possessing a trapped reservoir (Q) with
> [
> |Q|\ge \alpha n
> \qquad\text{and}\qquad
> \Delta_Q\le H.
> ]

This is a genuine finite-game strategy property. In particular, the quantifier order is

[
\exists\text{ Prolonger strategy };
\forall\text{ Shortener strategies };
\exists\text{ reached fortress position}.
]

The property is monotone in the cap:

[
\mathsf E_\alpha(n,H)
\implies
\mathsf E_\alpha(n,H')
\qquad(H'\ge H),
\tag{1}
]

because the same reached position satisfying (\Delta_Q\le H) also satisfies (\Delta_Q\le H').

---

# 2. The exact growing-cap hypothesis

The granted growing-cap entry, in its universal form, says:

[
\boxed{
\text{For every integer-valued }h(n)\to\infty,
\quad
\mathsf E_\alpha(n,h(n))
\text{ holds for all sufficiently large }n.
}
\tag{GE}
]

Indeed, the stated growing-cap construction gives

[
|Q|=\left(\frac12-o(1)\right)n.
]

For any fixed (\alpha<1/2), and for each chosen function (h(n)\to\infty), the error is eventually small enough that (|Q|\ge\alpha n). Thus the original growing-cap conclusion implies ((GE)).

Only arbitrarily slowly diverging (h) are needed below. Thus the proof is unchanged if the construction is stated only for caps satisfying side conditions such as

[
h(n)=o(\log\log n),\qquad e^{O(h(n))}=n^{o(1)},
]

or any similar “sufficiently slow” requirement.

---

# 3. Diagonal fixed-cap lemma

## Lemma

Assume ((GE)). Then there exist constants (H_0) and (N_0) such that

[
\mathsf E_\alpha(n,H_0)
]

holds for every (n\ge N_0).

## Proof

Suppose, toward a contradiction, that no fixed cap works eventually. Then for every integer (k\ge1),

[
\mathsf E_\alpha(n,k)
]

fails for arbitrarily large (n). Equivalently,

[
\forall k\ge1;\forall N;
\exists n\ge N
\quad
\neg\mathsf E_\alpha(n,k).
\tag{2}
]

Choose recursively an increasing sequence

[
n_1<n_2<n_3<\cdots
]

such that

[
\neg\mathsf E_\alpha(n_k,k)
\tag{3}
]

for every (k).

We may make the sequence grow as rapidly as desired. For example, if the growing-cap construction requires (h(n)=o(\log\log n)), choose (n_k) additionally so large that

[
\log\log n_k\ge k^2.
\tag{4}
]

This is possible because, by assumption, failures at cap (k) occur arbitrarily far out.

Now define a staircase function (h:\mathbb N\to\mathbb N) by

[
h(n)=
\begin{cases}
1,&n<n_1,[2mm]
k,&n_k\le n<n_{k+1}.
\end{cases}
\tag{5}
]

Then (h(n)\to\infty). Moreover, by choosing the (n_k) sufficiently rapidly, (h) is admissibly slow. For instance, under (4), whenever (n_k\le n<n_{k+1}),

[
\frac{h(n)}{\log\log n}
\le
\frac{k}{\log\log n_k}
\le
\frac1k,
]

so

[
h(n)=o(\log\log n).
\tag{6}
]

At the selected integers (n_k), however,

[
h(n_k)=k.
]

Therefore, from (3),

[
\neg\mathsf E_\alpha(n_k,h(n_k))
\tag{7}
]

for every (k).

Thus (\mathsf E_\alpha(n,h(n))) fails for infinitely many (n), contradicting ((GE)), which says it holds for all sufficiently large (n).

Hence some fixed (H_0) satisfies

[
\mathsf E_\alpha(n,H_0)
]

for every sufficiently large (n). ∎

---

# 4. Interpretation in terms of Shortener strategies

The diagonal proof fully respects the requirement that entry withstand **arbitrary** replies.

Indeed, if (\mathsf E_\alpha(n_k,k)) fails, then no single Prolonger strategy forces cap-(k) entry with an (\alpha n_k)-sized reservoir. Since the game is finite and perfect-information, Shortener has a counterstrategy preventing that entry objective.

The staircase (h) therefore produces infinitely many board sizes (n_k) at which Shortener has a counterstrategy against cap (h(n_k)). This directly contradicts growing-cap entry against arbitrary Shortener play.

No assumption about maximum-degree, minimal-legal, or any other particular Shortener policy is involved.

---

# 5. Applying the absorbing fortress

By the lemma, there are constants (H_0,N_0) such that for every (n\ge N_0), Prolonger can force a position with

[
|Q|\ge\alpha n,
\qquad
\Delta_Q\le H_0.
\tag{8}
]

Take (\alpha=1/3). Thus the first alternative in the problem holds with

[
c=\frac13.
]

Once this position is reached, the absorbing-fortress theorem applies. It gives remaining game value at least

[
|E|+\frac{|Q|}{H_0}
\ge
\frac{|Q|}{H_0}
\ge
\frac{\alpha n}{H_0}.
\tag{9}
]

Prolonger uses the fixed-cap entry strategy until the fortress is reached and then switches to the fortress continuation strategy. Both parts withstand arbitrary legal Shortener replies, so their composition does as well.

Consequently,

[
L(n)\ge \frac{\alpha}{H_0}n-O(1).
\tag{10}
]

For example, for all sufficiently large (n),

[
L(n)\ge \frac{1}{4H_0}n.
\tag{11}
]

Thus one may take

[
c'=\frac1{4H_0}>0.
]

Together with the known upper bound,

[
L(n)\le (0.1897123371+o(1))n,
]

this proves

[
\boxed{L(n)=\Theta(n).}
]

---

# 6. Why this does not contradict the stated growing-cap warning

There are two very different logical statements.

A single growing-cap theorem has the form

[
\exists h(n)\to\infty\quad
\forall^{\infty} n\quad
\mathsf E_\alpha(n,h(n)).
\tag{12}
]

That does **not** imply a fixed cap. Abstractly, the property

[
\mathsf P(n,H)\iff H\ge \lceil\log\log n\rceil
]

holds for the growing cap (H(n)=\lceil\log\log n\rceil), but fails eventually for every fixed (H).

By contrast, the grant used here is

[
\forall h(n)\to\infty\quad
\forall^{\infty} n\quad
\mathsf E_\alpha(n,h(n)).
\tag{13}
]

For any property monotone in (H), the diagonal lemma shows

[
\left[
\forall h(n)\to\infty;
\forall^{\infty}n;
\mathsf E_\alpha(n,h(n))
\right]
\Longleftrightarrow
\left[
\exists H_0;
\forall^{\infty}n;
\mathsf E_\alpha(n,H_0)
\right].
\tag{14}
]

The reverse implication is immediate from monotonicity, since every (h(n)\to\infty) eventually satisfies (h(n)\ge H_0). The forward implication is exactly the staircase argument.

So the phrase “granted at **any** (H(n)\to\infty)” is not merely a growing-cap result. At the level of eventual strategy existence, it is already equivalent to fixed-cap entry.

---

## Scope of the conclusion

Under the literal universal grant in the question, the amplification theorem above is complete and proves the linear lower bound.

If “growing-cap entry” were weakened to entry for only one particular function (H_*(n)\to\infty), then the diagonal argument would no longer apply. In that weaker formulation, the unresolved sub-step would be a genuinely chronological fixed-level advance-depletion bound: for some fixed (H,r), one would need to show uniformly over arbitrary Shortener histories that a positive linear number of batch faces still possess the required

[
2\binom r{\lfloor r/2\rfloor}+1
]

legal lifts at first activation. The static witness and low-(\operatorname{lcm}) estimates alone do not control repeated lifetime use of old blockers. But the stronger “any (H(n))” hypothesis supplied here eliminates that gap by diagonal compactness.

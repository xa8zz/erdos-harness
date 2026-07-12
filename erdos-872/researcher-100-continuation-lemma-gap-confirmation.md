---
id: R100-continuation-lemma-gap-confirmation
type: research
date: 2026-07-12
intent: >
  Full solution attempt from the complete current state: prove or disprove
  L(n) = o(n) unconditionally for the divisibility antichain game on {2..n}.
predecessors: [R96-layer-peeling-chronological-separator]
action:
  kind: confirms
  target: R96-layer-peeling-chronological-separator
claim: >
  Continuation lemma: if every integer legal at position A exceeds n/H and
  C is a subset of the legal set L(A) with A union C maximal primitive, then
  |L(A)| <= (2H+1)|C|, bounding every continuation by (2H+1)|C| moves. Hence
  a layer-peeling upper completion needs the strengthening |C| = o(n/H) after
  an n/H-move peel â€” strictly stronger than static completion's o(n), and not
  recoverable by composing two little-o statements (|C| <= n/log H with any
  H -> infinity gives H|C|/n -> infinity). Dually, the LP/max-degree facts do
  not bootstrap: pointwise degree divergence Delta_t -> infinity at horizon
  t = n/H is compatible with t*Delta_t = o(n) (e.g. Delta_t ~ loglog H), and a
  modulus phi(alpha) = sqrt(alpha) makes the accumulated-progress integral
  vanish. The absorbing fortress with growing cap H(n) -> infinity yields only
  o(n), so a disproof of o(n) requires fixed-cap H = O(1) robust entry against
  arbitrary replies or a new amplification theorem. The numerical bracket is
  compatible with both L(n) ~ n/logloglog(n) and L(n) ~ 0.1n; the problem is
  unresolved from the current toolbox in both directions.
implications:
  - Independent re-derivation (different machinery: continuation lemma plus
    modulus counterexamples) of the chronological separator; both directions
    reduce to explicitly named missing chronological assertions.
  - Upper route target sharpened: prove the minimal-completion bound
    |C| = o(n/H) after the peel, not merely o(n).
  - Any claimed full proof in either direction must be audited for smuggling
    one of the named missing assertions.
verifiers_at_time: []
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/researcher-R100-solution-attempt-post-separator.md
---

# Verdict

I do **not** have a valid unconditional proof or disproof of
[
L(n)=o(n).
]
The supplied results leave a genuine quantifier-and-chronology gap in both directions. Closing that gap would require a new theorem not contained in the hypotheses. Presenting either conclusion as proved would require silently reintroducing one of the mechanisms explicitly ruled out in the dossier. 

Below is a precise demonstration of where the strongest apparent completions fail.

## 1. A useful continuation lemmaÑand the exact missing factor

Write (\mathcal L(A)) for all integers still legal at a position (A).

### Lemma

Suppose that every legal integer at (A) is greater than (n/H). Let (C\subseteq\mathcal L(A)) be such that (A\cup C) is a maximal primitive set. Then
[
|\mathcal L(A)|\le (2H+1)|C|.
]
Consequently, every continuation from (A), under arbitrary play by both players, has at most ((2H+1)|C|) further moves.

### Proof

Take (x\in\mathcal L(A)).

If (x\in C), assign (x) to itself. Otherwise, maximality of (A\cup C) implies that (x) is comparable with some element of (A\cup C). But (x) is legal relative to (A), so it is incomparable with every element of (A). Hence (x) is comparable with some (c\in C).

Both (x) and (c) exceed (n/H). For a fixed (c), its comparable elements above (n/H) are of two forms.

First, its multiples:
[
c,2c,\ldots,\left\lfloor\frac nc\right\rfloor c.
]
Since (c>n/H),
[
\frac nc<H,
]
so there are fewer than (H) such multiples.

Second, its divisors above (n/H). Such a divisor can be written (c/k), where
[
\frac ck>\frac nH,
\qquad\text{hence}\qquad
k<\frac{cH}{n}\le H.
]
Thus there are at most (H) such divisors.

Therefore at most (2H+1) legal integers can be assigned to any fixed (c), and
[
|\mathcal L(A)|\le(2H+1)|C|.
]
Every future move must come from (\mathcal L(A)), because legality is monotone decreasing. This proves the continuation bound. ?

This lemma shows exactly what a one-shot layer-peeling proof would need. After Shortener has made every integer up to (n/H) illegal, there have been at most (n/H) Shortener moves and hence (O(n/H)) total moves. Static completion supplies
[
|C|=o(n).
]
But the continuation lemma requires the stronger estimate
[
H|C|=o(n),
\qquad\text{equivalently}\qquad
|C|=o(n/H).
\tag{1}
]

The stated static-completion theorem does not give (1).

This cannot be repaired merely by saying Òchoose (H) sufficiently slowly.Ó Abstractly, a bound such as
[
|C|\le \frac{n}{\log H}
]
is perfectly compatible with (|C|=o(n)) whenever (H\to\infty), yet
[
\frac{H|C|}{n}\ge \frac{H}{\log H}\longrightarrow\infty.
]
Thus the composition of two little-(o) statements is not available here. The quadratic semiprime regeneration mechanism in the prompt explains how minimal layers can in fact be much larger than the number of moves that created them.

So layer peeling plus static completion does not prove the claim.

## 2. Why the LP and maximum-degree facts do not bootstrap

The fractional packing fact implies, by assigning weight (1/\Delta(A)) to every live target, that
[
\nu(A)\ge \frac{|R(A)|}{\Delta(A)};
]
hence
[
\Delta(A)\ge \frac{|R(A)|}{\nu(A)}.
\tag{2}
]

If (|R(A)|\ge\eta n) and (|A|=o(n)), uniform sublinearity of (\nu(A)) indeed gives (\Delta(A)\to\infty). But to clear a linear number of targets within (t=o(n)) turns, one needs an amortized relation of the form
[
t,\Delta_t=\Omega(n),
\tag{3}
]
or its accumulated-area analogue.

Pointwise divergence does not imply (3). For example, at the horizon
[
t=\frac nH
]
a degree guarantee of size
[
\Delta_t\asymp \log\log H
]
still tends to infinity, but
[
\frac{t\Delta_t}{n}
\asymp \frac{\log\log H}{H}
\longrightarrow0.
]
This is exactly the non-self-bootstrap phenomenon stated in the prompt.

The same obstruction can be expressed using a modulus. Let
[
\phi_n(\alpha)
=\sup\left{
\frac{\nu(A)}n:
|A|\le\alpha n
\right}.
]
The known result says that
[
\phi_n(\alpha_n)\to0
]
for every (\alpha_n\to0). At time (\alpha n), (2) gives a degree on the order of (1/\phi_n(\alpha)). The total direct progress available by that horizon is only heuristically
[
n\int_0^\alpha\frac{ds}{\phi_n(s)}.
]
Nothing in the stated theorem forces this integral to be bounded below by a positive constant for some (\alpha=o(1)). A modulus such as (\phi(\alpha)=\sqrt{\alpha}), for example, tends to zero but gives
[
\int_0^\alpha \frac{ds}{\sqrt{s}}
=2\sqrt{\alpha}\to0.
]

Therefore neither the LP relaxation nor degree availability proves (L(n)=o(n)) without an additional chronological area estimate such as (OA).

## 3. Why the fortress does not disprove (o(n))

The absorbing-fortress result says that, after entry with cap (H) and a linear reservoir (Q),
[
\text{remaining length}\ge \frac{|Q|}{H}
]
up to the exact-only bank.

If (H=H(n)\to\infty), even very slowly, this gives only
[
\frac{|Q|}{H}=o(n).
]
For example,
[
H=(\log\log n)^{1/10}
]
gives an (n^{1-o(1)}) lower bound, but still a vanishing proportion of (n).

Thus a disproof requires one of the following genuinely stronger statements:

[
\boxed{\text{Prolonger can force entry with }H=O(1)}
]
while retaining (\Omega(n)) targets against every Shortener strategy; or

[
\boxed{\text{a valid amplification converts }n/H(n)\text{ into }cn.}
]

Neither statement is among the accepted facts.

Fresh-batch persistence does not supply fixed-cap entry. It begins only after a batch has been activated with enough currently legal lifts. Advance depletion before activation remains uncontrolled. The given batch-blocker example also shows why defeating the literal maximum-degree policy is not sufficient: an arbitrary Shortener can use a legal low-current-degree batch move that the maximum-degree policy would never select.

So the existing lower-bound machinery cannot establish
[
\limsup_{n\to\infty}\frac{L(n)}n>0.
]

## 4. The two unresolved chronological statements

The problem is therefore separated into two possible breakthroughs.

### An upper-bound breakthrough

It would suffice to prove (OA), or an equivalent chronological repair theorem, for a completely specified Shortener strategy. Such a theorem must control accumulated maximum-degree area while permitting:

* repeatedly inherited old spoilers;
* direct-ancestor interference;
* simultaneous refinement of many classes;
* later low-product edges joining many previous witness structures;
* batch moves that are not current maximum-degree moves.

A snapshot incidence estimate cannot do this, because the same permanent blocker can be inherited by sequentially created descendants.

### A lower-bound breakthrough

It would suffice to prove robust fixed-(H) entry into the absorbing fortress against arbitrary replies. Such a proof must survive, in particular, proactive batch blockers and cannot rely on the opponent following maximum degree, minimum product, or minimum legal element.

Alternatively, one needs an amplification theorem strong enough to turn a growing-cap fortress lower bound
[
\Omega(n/H(n))
]
into a positive-density lower bound. No such amplification is supplied.

## 5. The numerical bounds themselves permit either answer

The current inequalities are numerically compatible with, for example,
[
L(n)\asymp \frac{n}{\log\log\log n},
]
which satisfies (L(n)=o(n)) and is much larger than
[
n\frac{(\log\log n)^2}{\log n}.
]

They are also compatible with
[
L(n)\asymp 0.1n,
]
which contradicts (o(n)) while respecting the stated (0.1897123371n) upper bound for sufficiently large (n).

The additional structural results do not eliminate either profile, because the decisive results among them are conditional: (OA) has not been proved, and fixed-cap robust fortress entry has not been proved.

## Conclusion

The unconditional statement
[
L(n)=o(n)
]
is **not proved or disproved by the supplied results**. The most direct proposed upper completion needs the unjustified strengthening
[
|\mathcal M(A)|=o(n/H)
]
after an (n/H)-move peel, while the lower completion needs robust entry at bounded (H) or a new amplification theorem.

Accordingly, a purported full proof in either direction would presently have to smuggle in one of the explicitly missing chronological assertions. The mathematically honest verdict from the stated premises is that the problem remains unresolved.

---
id: R85-ancestor-collapse-minimal-legal
type: research
date: 2026-07-12
intent: >
  Unanchored full-solution attempt from the updated base including the
  fractional invariant, sublinear packing value, completion, trapping, and
  regeneration results, with manuscript excerpts and complete proofs
  supplied.
predecessors:
  - R78-fractional-invariant-interdiction-frontier
  - R80-nu-sublinear-sparse-covers-charging-gap
  - R81-static-completion-smooth-rough-sweep
action:
  kind: extends
  target: R81-static-completion-smooth-rough-sweep
claim: >
  No unconditional resolution. Three new unconditional results. (1)
  Ancestor-collapse lemma: under the minimal-legal Shortener policy
  (always play a legal element having no legal proper divisor, which
  always exists by divisor descent), Shortener's own minimal lower moves
  never regenerate surviving upper targets, and at termination Shortener's
  move set equals the minimal legal completion M(P); all recursive
  regeneration collapses onto Prolonger's moves alone. (2) A linear
  construction based on the 5n/24 cover shows this exact reduction alone
  still permits linearly many completions, so minimal-legal play does not
  by itself prove sublinearity. (3) A stronger static large-divisor cover:
  for 3 <= w < z < n/2, all but O(kz^2 + n log w/log z + 2^{pi(z)}) live
  upper targets have a minimal legal divisor x <= n/w, so the live upper
  half is covered by at most n/w currently legal minimal lower moves; the
  guaranteed current degree is still only H^{o(1)} against a needed H,
  reproducing the quantitative failure of pointwise interdiction. A proof
  of o(n) must bound cumulative cross-carrier regeneration, not each
  static generation; a proof of Theta(n) must convert the same
  regeneration into a strategy while preventing shared mixed divisors
  from resolving a linear family at sublinear cost.
implications:
  - Shortener may be assumed minimal-legal for free, collapsing regeneration accounting onto Prolonger's carriers only.
  - Even the strengthened n/w-cover cannot beat the H^{o(1)}-vs-H degree gap pointwise; the cumulative-area formulation is unavoidable.
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/researcher-R85-solution-attempt-post-charging-frontier.md
---

# Verdict

I do **not** obtain a valid unconditional proof of either
[
L(n)=\Theta(n)
\qquad\text{or}\qquad
L(n)=o(n).
]
Claiming either conclusion from the supplied results would require precisely the online amortization theorem that is still absent. The source establishes the unconditional range
[
c_\delta\frac{n(\log\log n)^2}{\log n}
\le L(n)
\le \bigl(0.1897123371+o(1)\bigr)n
]
and explicitly identifies cross-carrier regeneration as the unresolved obstruction. 

There is, however, a useful exact reduction that was not stated in the supplied notes. It collapses all recursive regeneration caused by Shortener’s own minimal moves onto the Prolonger moves alone. Unfortunately, a linear construction based on the (5n/24) cover shows that this reduction by itself still cannot prove sublinearity.

## 1. Ancestor-collapse lemma

Consider the following natural Shortener policy:

> On every Shortener turn, choose a legal element having no legal proper divisor.

Such an element always exists: descend through legal proper divisors until this is no longer possible.

At any time, write
[
P={\text{moves made by Prolonger}},\qquad
S={\text{moves made by Shortener}}.
]

### Theorem 1

Under the minimal-legal policy,
[
\boxed{S\subseteq\mathcal M(P)}
]
at every point of the game.

In fact,
[
\boxed{{\text{currently minimal legal moves}}=\mathcal M(P)\setminus S.}
]

Consequently, at a terminal position,
[
\boxed{S=\mathcal M(P).}
]

### Proof

Fix (s\in S), and let (d\mid s) with (2\le d<s). When (s) was played, (d) was illegal because (s) was chosen minimal legal. Let (a_1) be an earlier played move comparable with (d).

The possibility (a_1\mid d) is impossible: then
[
a_1\mid d\mid s,
]
contradicting the legality of (s) when it was chosen. Hence
[
d\mid a_1.
\tag{1}
]

If (a_1\in P), then (d) divides a Prolonger move and we are done.

Suppose instead that (a_1\in S). Since the final played set is primitive, (a_1\ne d); otherwise (a_1=d\mid s). Therefore (d) is a proper divisor of (a_1). Because (a_1) was itself chosen minimal legal, (d) was already illegal when (a_1) was played. Applying the same reasoning gives an even earlier move (a_2) with
[
d\mid a_2.
]

Continue backwards. The times strictly decrease, so this process must terminate. It cannot terminate at a Shortener move, because every Shortener move containing (d) has (d) as a proper divisor and therefore has an earlier witness. Since Prolonger made the first move of the game, the chain eventually reaches some (p\in P) satisfying
[
d\mid p.
\tag{2}
]

Thus every proper divisor of (s) is illegal relative to (P) alone. Moreover, (s) is incomparable with every element of (P), since all played moves form an antichain. Hence
[
s\in\mathcal M(P).
]

This proves (S\subseteq\mathcal M(P)).

Conversely, let (m\in\mathcal M(P)\setminus S). The set (\mathcal M(P)) is an antichain, and (S\subseteq\mathcal M(P)), so (m) is incomparable with every element of (S). It is incomparable with (P) by definition. Thus (m) is currently legal. Every proper divisor of (m) is already illegal relative to (P), so (m) is currently minimal legal. Therefore
[
{\text{currently minimal legal moves}}
=\mathcal M(P)\setminus S.
]

At termination the right side must be empty, proving
[
S=\mathcal M(P).
\qquad\square
]

This is a genuine dynamic simplification. Shortener’s own carrier moves do not need to be included in the final certificate set: their effects can always be traced backwards to earlier Prolonger carriers.

Equivalently, the minimal-legal strategy becomes the following queue process:

1. Prolonger enlarges (P) by one legal move.
2. The canonical queue (\mathcal M(P)\setminus S) changes.
3. Shortener removes one element from that queue.
4. The game ends exactly when the queue is empty.

## 2. Why the collapse does not prove (o(n))

One might now try to argue that the static theorem
[
|P|=o(n)\Longrightarrow |\mathcal M(P)|=o(n)
]
forces the queue to empty after (o(n)) rounds. That argument is circular: at the terminal position,
[
|\mathcal M(P)|=|S|=|P|+O(1),
]
and the static theorem supplies no contradiction once (|P|) is a fixed positive fraction of (n).

More seriously, there are linear primitive sets satisfying exactly this fixed-point relation.

### Proposition 2

For infinitely many (n), and in fact up to (O(1)) endpoint errors for every (n), there is a primitive set (P\subseteq U_n) such that
[
|P|=\frac n4+O(1),
\qquad
|\mathcal M(P)|=\frac n4+O(1).
]

### Proof

Let (C\subseteq U_n) be the optimal upper cover from the supplied theorem:
[
|C|=\frac{5}{24}n+O(1),
]
and every (x\in L_n) divides some member of (C).

Choose
[
Q\subseteq U_n\setminus C
]
so that
[
P:=C\cup Q
]
has size
[
|P|=\left\lfloor\frac{|U_n|}{2}\right\rfloor
=\frac n4+O(1).
]

All upper-half integers are mutually incomparable, so (P) is primitive.

Every (x\in L_n) divides a member of (C\subseteq P), and is therefore illegal relative to (P). On the other hand, every (u\in U_n\setminus P) is incomparable with (P). Every proper divisor of (u) lies in (L_n) and is illegal relative to (P). Hence
[
u\in\mathcal M(P).
]

There are no minimal legal lower elements, because every lower element is already illegal. Thus
[
\mathcal M(P)=U_n\setminus P.
]
Consequently,
[
|\mathcal M(P)|
=|U_n|-|P|
=\frac n4+O(1).
\qquad\square
]

This configuration is not asserted to be forceable by Prolonger. Its significance is narrower but decisive: the equality
[
S=\mathcal M(P),\qquad |S|\simeq|P|,
]
even together with the canonical-completion interpretation, does not imply sublinearity. The missing theorem must use the chronological restrictions on how Prolonger can build such a (P) while avoiding Shortener’s earlier moves.

## 3. Minimal lower moves do not themselves regenerate upper exceptions

There is another exact fact that isolates the adversarial part of the problem.

### Lemma 3

Suppose (x\in L_n) is a minimal legal move and Shortener plays (x). If an upper target (u) survives this move, then every lower divisor of (u) that was legal before the move remains legal afterward.

### Proof

Let (d\mid u), (d\in L_n), and suppose (d) was legal before (x) was played. If (d) becomes illegal because of (x), then (d) and (x) are comparable.

If (x\mid d), then
[
x\mid d\mid u,
]
so (u) is killed by (x), contrary to the assumption that (u) survives.

If (d\mid x), then minimality of (x) rules out (d<x), because (d) was legal. Thus (d=x), and again (x\mid u), contradicting survival.

Therefore no legal lower divisor of a surviving upper target is lost. (\square)

So if Shortener consistently chooses minimal lower moves, all harmful cross-carrier regeneration of surviving upper targets is caused by Prolonger, not by Shortener.

There is also an exact finite resource:

### Lemma 4

For each upper move (u), let
[
q(u):=
#{d\in L_n:d\mid u,\ d\text{ is legal immediately before }u\text{ is played}}.
]
Then, over the entire game,
[
\boxed{\sum_{\substack{u\text{ played}\u\in U_n}}q(u)\le |L_n|\le\frac n2.}
\tag{3}
]

### Proof

When (u) is played, all the (q(u)) legal lower divisors of (u) become illegal. Legality is monotone, so the same lower integer can never be counted again for a later upper move. The sets counted for different upper moves are therefore disjoint subsets of (L_n). (\square)

Thus upper moves with (q(u)\ge r) number at most (n/(2r)). The entire difficulty is the possible succession of upper moves with small (q(u)), especially (q(u)=0). Those moves use little or none of the finite resource in (3).

The cross-product construction
[
P={p_iq_i:1\le i\le t},
\qquad
m_{ij}=p_iq_j\quad(i\ne j),
]
shows the mechanism: (t) carriers can create (t(t-1)) exact targets. Arithmetic forces this one generation to be (o(n)), but no accepted theorem bounds the cumulative mass of many successive generations.

## 4. A stronger static large-divisor cover

The following refinement makes the quantitative obstruction particularly transparent.

### Theorem 5

Let (A) be any current primitive position with (k=|A|). For
[
3\le w<z<n/2,
]
all but
[
\boxed{
O\left(
kz^2
+n\frac{\log w}{\log z}
+2^{\pi(z)}
\right)
}
\tag{4}
]
live upper targets (u) have a minimal legal divisor
[
x\le\frac n w.
]

Consequently, apart from the exceptional targets in (4), the live upper half is covered by at most (n/w) currently legal minimal lower moves.

### Proof

Let (u\in U_n) be live.

First count integers having no prime divisor in ((w,z]). Put
[
Q=\prod_{w<p\le z}p.
]
Inclusion–exclusion gives
[
#{m\le n:(m,Q)=1}
=================

n\prod_{w<p\le z}\left(1-\frac1p\right)
+O\bigl(2^{\pi(z)}\bigr).
]
By Mertens’ theorem,
[
\prod_{w<p\le z}\left(1-\frac1p\right)
\ll \frac{\log w}{\log z}.
]
Hence at most
[
O\left(n\frac{\log w}{\log z}+2^{\pi(z)}\right)
\tag{5}
]
integers have no prime factor in ((w,z]).

Now suppose (p\in(w,z]) divides (u), but (u/p) is illegal. As in the supplied blocked-direction argument, illegality cannot be witnessed by a played divisor of (u/p), because that would divide (u). Therefore
[
\frac up\mid c
]
for some (c\in A). Writing
[
c=\frac up,e,
]
the inequalities (c\le n) and (u>n/2) give
[
e<2p.
]
For fixed (c) and (p), there are fewer than (2p) possibilities for (e), and (u=cp/e) is then determined. Thus the total number of blocked pairs ((u,p)), (p\le z), is
[
O(kz^2).
\tag{6}
]

Outside the sets counted by (5) and (6), (u) has a prime
[
p\in(w,z]
]
for which (d=u/p) is legal. Descend from (d) through legal proper divisors until reaching a minimal legal divisor (x). Since (p>w),
[
x\le d=\frac up\le\frac n w.
]
This proves (4).

Taking all currently minimal legal (x\le n/w) gives at most (n/w) moves and covers every nonexceptional target. (\square)

This strengthens the static conclusion: not only is there an (o(n))-sized cover, but most targets can be covered using genuinely small minimal legal divisors.

It still does not self-bootstrap. At a prospective horizon
[
k=\frac nH,
]
making the first error in (4) sublinear requires
[
z^2=o(H).
]
Making the sieve error sublinear requires
[
\frac{\log w}{\log z}=o(1).
]
Therefore
[
w=z^{o(1)}=H^{o(1)}.
]
The guaranteed current degree is only of order (H^{o(1)}), whereas one would need degree comparable to (H) to eliminate a linear reservoir in (n/H) rounds. Thus even this stronger cover reproduces the precise quantitative failure of pointwise interdiction.

# Final unconditional status

The rigorous conclusions are therefore:

[
\boxed{
c_\delta\frac{n(\log\log n)^2}{\log n}
\le L(n)
\le
\bigl(0.1897123371+o(1)\bigr)n
}
]
for every fixed (0<\delta<1/4);

[
\boxed{
\text{minimal-legal Shortener play satisfies }S=\mathcal M(P)
\text{ at termination};
}
]

[
\boxed{
\text{Shortener’s minimal lower moves do not regenerate surviving upper targets};
}
]

and

[
\boxed{
\text{most live upper targets have a minimal legal divisor }x\le n/w
\text{ with the quantitative error in (4).}
}
]

None of these supplies the required bounded-multiplicity charge for the low-resilience upper moves created by successive Prolonger carriers. A proof of (L(n)=o(n)) must bound that cumulative regeneration, not merely each static generation. A proof of (L(n)=\Theta(n)) must turn the same regeneration into a strategy while preventing shared mixed divisors from resolving a linear family at sublinear cost. No such unconditional step is established here.

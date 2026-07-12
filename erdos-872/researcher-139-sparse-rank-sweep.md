---
id: R139-sparse-rank-sweep
type: research
date: 2026-07-12
intent: >
  Independent full-solution attempt at the divisibility-game dichotomy
  L(n) = o(n) vs L(n) = Omega(n) on {2..n}, given the corrected record
  including the promoted interval-blocker refutation and the
  seventeenth collapse.
predecessors: []
action:
  kind: standalone
claim: >
  No unconditional proof or disproof follows from the record. NEW
  reduction — sparse rank-sweep lemma: for every g >= 2, Shortener can
  in at most n/g of his moves reach a terminal position or one where
  every legal divisible pair d | x satisfies Omega(x) - Omega(d) < g
  (choose a residue class C_r of Omega mod g with |C_r| <= n/g and play
  its currently legal members until none remain; a surviving legal
  chain gap >= g contains a divisor e in C_r with d | e | x, e != x;
  e is illegal but x legal, so some selected a has e | a, whence
  d | a, contradicting d legal). Taking g(n) -> infinity: o(n)
  Shortener moves force the remaining legal divisibility poset to have
  height at most g(n) — a genuine o(n)-cost structural reduction
  complementary to the n/H magnitude peel. Why it does not finish: low
  height does not control width or online saturation — a single legal
  root d supports pairwise-incomparable prime multiples dp
  (n/2d < p <= n/d) all one Omega-step up, so a sublinear root family
  can carry a linear reservoir through quotient-prime edges (star
  posets; the primorial-batched and direct-ancestor constructions are
  the arithmetic versions), and preventing regeneration along the
  actual sweep trajectory is again the chronological ownership
  statement. Also reconfirmed: shell recursion cannot be justified by
  rescaling; the precise unresolved clause is the aggregate-excess
  halving rate with the direct-ancestor lifetime-ownership bound
  (one earlier move can invalidate lift families of H^{Omega(1)}
  later-exposed unmergeable faces; even a polylogarithmic per-move
  ownership bound is the missing theorem).
implications:
  - The rank sweep composes with layer peeling: o(n) moves buy BOTH all
    legal integers > n/H AND legal-poset height < g(n) — future
    formulations may assume the post-sweep structure.
  - Candidate for a quick confirmation audit alongside the frozen-cone
    lemmas; single-source until then.
verifiers_at_time: []
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/researcher-R139-solution-attempt.md
---

# Verdict

I do **not** have a valid unconditional proof or disproof of  
\[
L(n)=o(n).
\]

After treating every item in the attachment as an established lemma, the remaining obstruction is still substantive: none of those lemmas controls the chronological regeneration of legal minimal roots strongly enough to prove sublinearity, and none supplies the amplification needed for a linear lower bound. Claiming otherwise would require silently assuming one of the statements that the attachment explicitly leaves open. 

Thus, on the supplied record, the rigorous conclusion remains
\[
c_\delta\,\frac{n(\log\log n)^2}{\log n}
\;\le\;
L(n)
\;\le\;
(0.1897123371+o(1))n,
\]
which is compatible with both \(L(n)=o(n)\) and \(\limsup L(n)/n>0\).

What follows is the precise audit, including one additional valid reduction that still does not close the problem.

---

## 1. Why global minimal-root greed does not prove it

Write
\[
Q(A)=\mathcal L(A)\setminus\mathcal M(A)
\]
and
\[
\mu_n(\alpha)
=
\max_{\substack{P\text{ primitive}\\|P|\le \alpha n}}
\frac{|\mathcal M(P)|}{n}.
\]

At a position of density approximately \(\alpha\), the global minimal-cone lemma gives a legal minimal root killing at least
\[
\frac{|Q(A)|}{|\mathcal M(A)|}
\ge
\frac{|Q(A)|/n}{\mu_n(C\alpha)}
\]
nonminimal legal integers.

If \(|Q(A)|\ge\eta n\), this is at least
\[
\frac{\eta}{\mu_n(C\alpha)}.
\]
Consequently, over an infinitesimal normalized time interval \(d\alpha\), maximal-cone play can guarantee only about
\[
\frac{d\alpha}{\mu_n(C\alpha)}
\]
normalized deletion. To remove a positive fraction before the prefix reaches density \(\alpha\), one would need
\[
\int_0^\alpha \frac{ds}{\mu_n(Cs)}
\]
to be bounded away from zero for some \(\alpha=o(1)\).

The qualitative static theorem \(\mu_n(\alpha)\to0\) gives no such conclusion. Indeed, the interval-blocker construction permits the worst-case scale
\[
\mu_n(\alpha)\gtrsim \frac1{\log(1/\alpha)}.
\]
At that scale,
\[
\int_0^\alpha \frac{ds}{\mu_n(Cs)}
\lesssim
\int_0^\alpha \log\frac1s\,ds
=
\alpha\log\frac1\alpha+\alpha
=o(1).
\]

So the tempting argument

> “The maximum degree tends to infinity, hence \(o(n)\) turns clear a linear population”

is circular. The number of turns needed to exploit the divergence may already be large enough that the static modulus has deteriorated. This is exactly why the refuted condition
\[
\mu_n(3\alpha_n)=o(\alpha_n)
\]
was sufficient: it supplied the missing self-consistent horizon.

---

## 2. Shell recursion cannot be justified by rescaling

A second tempting proof is to clear the top half, then treat the next dyadic shell as a smaller fresh board. External selected integers invalidate that reduction.

Choose \(d\) and \(X\) satisfying
\[
\frac X2<7d\le X<8d\le n.
\]
At the position
\[
A=\{8d\},
\]
the integer
\[
u=7d\in(X/2,X]
\]
is legal because \(7d\) and \(8d\) are incomparable. But \(d\) is illegal because
\[
d\mid 8d.
\]

If one discards the external blocker \(8d>X\) and views \([2,X]\) as a fresh board, \(d\) falsely appears legal. Thus the top-half degree theorem at board size \(X\) cannot simply be applied to an inner shell.

This is not a technical boundary effect. It is the direct-ancestor mechanism: a move outside the shell can destroy divisors inside the shell without killing their shell multiples. The online-area statement is precisely the theorem needed to control this phenomenon.

---

## 3. A valid rank-sweep reduction

There is a clean additional reduction using the total-prime-factor rank
\[
\Omega(m).
\]

### Lemma: sparse rank sweep

For every integer \(g\ge2\), Shortener can, in at most \(n/g\) of his moves, reach either a terminal position or a position in which
\[
d,x\in\mathcal L(A),\quad d\mid x
\qquad\Longrightarrow\qquad
\Omega(x)-\Omega(d)<g.
\tag{1}
\]

#### Proof

Partition \(\{2,\ldots,n\}\) according to \(\Omega(m)\bmod g\). Choose a residue \(r\) whose class
\[
C_r=\{m\le n:\Omega(m)\equiv r\pmod g\}
\]
has size at most \((n-1)/g\).

Shortener repeatedly plays any currently legal member of \(C_r\). Since legality only decreases, this phase uses at most \(|C_r|\le n/g\) Shortener moves.

At its end, suppose that \(d,x\) are legal, \(d\mid x\), and
\[
\Omega(x)-\Omega(d)\ge g.
\]
There is an integer
\[
k\in[\Omega(d),\Omega(x)-1]
\]
with \(k\equiv r\pmod g\). By taking an appropriate submultiset of the prime factors of \(x/d\), choose a divisor \(e\) such that
\[
d\mid e\mid x,\qquad e\ne x,\qquad \Omega(e)=k.
\]
Thus \(e\in C_r\).

The phase has ended, so \(e\) is illegal. Since \(x\) is legal, no selected integer can divide \(e\), because it would then divide \(x\). Hence some selected integer \(a\) satisfies
\[
e\mid a.
\]
But then
\[
d\mid e\mid a,
\]
contradicting the legality of \(d\). Therefore (1) holds. ∎

Consequently, by taking \(g=g(n)\to\infty\), Shortener can in \(o(n)\) moves force the remaining legal divisibility poset to have height at most \(g(n)\).

### Why this still does not finish the proof

Low height does not control width or online saturation. A single legal root \(d\) can have many pairwise incomparable prime multiples
\[
dp,\qquad \frac{n}{2d}<p\le\frac nd,
\]
all only one \(\Omega\)-step above \(d\). With many roots, a sublinear root family can support a linear reservoir through quotient-prime edges.

In a star poset, deleting or preempting the center turns all leaves into isolated legal moves. The primorial-batched and direct-ancestor constructions are the arithmetic versions of this obstruction. Therefore a bound on rank depth, even a very slowly growing one, does not control cumulative minimal-layer width.

To turn the rank-sweep lemma into a proof, one would still have to show that the actual sweep trajectory cannot regenerate a linear family of such near-rank descendants. That is again a chronology-sensitive entry or ownership theorem.

---

## 4. Why peeling plus static completion does not close the argument

After making every integer at most \(n/H\) illegal, Shortener has used at most \(n/H\) moves. Since all remaining legal integers exceed \(n/H\), the continuation lemma gives
\[
\text{remaining length}\le(2H+1)|C|
\]
for any maximal completion \(C\).

Thus this route requires
\[
|C|=o(n/H).
\tag{2}
\]

Static completion supplies only
\[
|C|=o(n).
\]
These statements do not compose. The interval-blocker modulus is consistent with
\[
|C|\asymp \frac n{\log H},
\]
in which case
\[
\frac{H|C|}{n}
\asymp
\frac H{\log H}\longrightarrow\infty.
\]

Choosing \(H\) “sufficiently slowly” does not fix this, because the completion modulus may itself decay more slowly than every self-consistent choice needed for (2).

The minimal-layer version has the same problem. Each fixed layer is \(o(n)\) when the prefix is \(o(n)\), but the number of relevant layers grows, and the prefix produced by earlier layers changes the modulus. Quadratic regeneration shows that one cannot simply sum the fixed-layer estimates.

---

## 5. Why the established lower machinery does not disprove \(o(n)\)

A trapped reservoir of size \(cn\) with degree cap \(H(n)\to\infty\) yields only
\[
L(n)\ge \frac{cn}{H(n)}.
\]
This can be \(n^{1-o(1)}\) while still being \(o(n)\). For example, \(n/\log n\) has exactly that character.

To derive a positive-density lower bound, one would need one of the following:

\[
H=O(1),
\]
or an amplification converting the \(n/H\) bank into \(cn\) moves.

The fixed-cap route is unavailable: the supplied fixed-density clearing theorem prevents robust entry into a linear upper reservoir at every fixed cap, and more generally below the degree-availability scale.

The amplification is also not automatic. In a genuinely disjoint star forest, Prolonger could preempt centers and turn many leaves into forced exact moves. But the divisibility neighborhoods overlap heavily; extracting enough private stars against arbitrary Shortener replies is exactly what has not been proved. Histories defeating maximum-degree or minimal-root policies do not suffice because a game lower bound must defeat every Shortener strategy.

---

## 6. The precise unresolved online clause

Within the supplied upper-bound pipeline, the remaining decisive assertion has the aggregate form
\[
R(t)=
\sum_{X\ge H^6}
\left(q_X(t)-\left\lceil\frac{4X}{H^2}\right\rceil\right)_+.
\]

For \(R(t)=M>0\), one needs a single legal online Shortener policy satisfying
\[
R(t')\le\frac M2
\]
within
\[
t'-t
\le
C\,M\frac{\log H}{H}+K\log n
\tag{3}
\]
Shortener turns, with immediate continuation while \(R>0\).

The supplied pipeline proves that (3) would imply \(L(n)=o(n)\). But no listed result proves (3).

A failed interval in (3) contains only
\[
O\!\left(M\frac{\log H}{H}+\log n\right)=o(M)
\]
new Prolonger moves. Hence an ownership proof would have to charge \(\Omega(M)\) unresolved units to those moves while showing that one move cannot own approximately \(H/\log H\) or more units.

The residual orientation has a lifetime ledger, but the direct-ancestor orientation does not. One earlier move can invalidate lift families belonging to \(H^{\Omega(1)}\) subsequently exposed, mutually unmergeable faces. Endpoint degree, divisor count, fixed moments, and snapshot incidence bounds do not control that lifetime multiplicity.

Asserting that every move owns only \(O(1)\), \(O(\tau(a))\), or even a harmless polylogarithmic number of future units is therefore the missing theorem, not a consequence of the existing machinery.

---

# Conclusion

The uploaded record does not contain, and my analysis did not produce, an unconditional proof or disproof of
\[
L(n)=o(n).
\]

The rank-sweep lemma above gives a genuine \(o(n)\)-cost reduction to a slowly growing-height legal poset, but low height still permits the same quotient-prime and direct-ancestor regeneration responsible for the unresolved aggregate-excess problem.

A claimed solution based only on static completion, instantaneous maximum degree, shell rescaling, growing-cap fortress entry, or a nonchronological witness count necessarily crosses one of the explicit gaps above. Supplying the requested “full proof” by inserting such a step would not be mathematically sound.
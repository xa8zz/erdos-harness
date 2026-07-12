---
id: R138-first-failure-localization
type: research
date: 2026-07-12
intent: >
  Direct attack on the aggregate-excess halving statement (AE-dagger)
  after the certificate-route terminus: prove or disprove that a fully
  specified policy halves the aggregate excess R within
  C M log H / H + K log n turns, uniformly, with H^6 = o(n) and closed
  quantifiers.
predecessors: [R129-global-no-reuse-reduction, R136-owner-time-laundering]
action:
  kind: extends
  target: R136-owner-time-laundering
claim: >
  (AE-dagger) is neither proved nor disproved, and under the repaired
  quantifiers NO further degeneracy or hidden collapse is exposed
  (third independent nondegeneracy confirmation). NEW unconditional
  reduction — first-failure localization theorem: for any candidate
  (H, sigma, C, K) with o(n) trapping prelude, if the statement fails
  then the first failed ticket starts and completes while the position
  has only o(n) chosen integers; quantitatively, at most
  b_n + O(n log H / H + log^2 n) = o(n) actual moves precede the end of
  the first failed interval (canonical immediate-successor tickets
  halve geometrically, M_j <= 2^{-j} n, sum M_j <= 2n, at most
  ceil(log2(n+1)) completed tickets, budgets sum to o(n)). Hence a
  proof need only establish halving along sparse on-policy prefixes,
  and any disproof must force its bad interval inside an o(n)-move
  prefix. Sparse localization is still insufficient for a proof:
  static completion gives max degree >= M/o(n), while the demanded
  rate is H/log H — wrong normalization for sublinear tickets
  log n << M << n; the missing estimate remains the accumulated-area
  bound sum_i Delta_i* >= M/2 within the budget. On the disproof side,
  the private-root family {2p : n/4 < p <= n/2} after playing 6 is a
  genuine one-unit-per-turn fortress of size Theta(n/log n) (unique
  legal proper divisor p; no move retires two members since pq > n and
  2 is dead) — yet it fails as a disproof for two reasons: the o(n)
  prelude may consume it before baseline, and for H = o(sqrt(log n))
  its population n/log n sits BELOW the shell floor 4X/H^2 ~ n/H^2, so
  it contributes zero aggregate excess. Any actual disproof reservoir
  must simultaneously: survive the prelude against the policy being
  defeated; exceed the 4X/H^2 floors for arbitrarily slow H; stay
  nonminimal (no minimal-bank transfer); and be forced on the realized
  trajectory. No known construction has all four properties.
implications:
  - (AE-dagger) reduces to sparse prefixes; combined with static
    completion this pins every counterexample to positions with o(n)
    minimal legal elements and sublinear ticket masses.
  - The four-property disproof checklist is the sharpest lower-route
    filter to date; the shell-floor property (2) kills all n/log n-size
    private families outright for slow H.
verifiers_at_time: []
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/researcher-R138-ae-dagger-direct.md
---

## Verdict

\[
\boxed{\text{I do not obtain a valid unconditional proof or disproof of }(\mathrm{AE}^{\dagger}).}
\]

This is not because the statement is merely “difficult.” After testing the repaired quantifiers directly, the remaining obstruction is mathematically exact: a proof needs a trajectory-uniform accumulated-deletion theorem, while a disproof needs an arbitrary-policy post-baseline entry construction. Neither follows from the supplied results.

The repairs do eliminate the known formal escapes. In particular, \(H^6=o(n)\) prevents the empty-shell choice, the fixed post-trapping baseline prevents terminal or prelude delay, and uniform \(C,K,\sigma\) prevent parameter-by-parameter witnesses. Thus I find no further vacuity in the literal formulation you supplied. 

I can, however, add a useful unconditional reduction that substantially narrows where a proof or counterexample must live.

---

## 1. Exact logical form

Write

\[
B_n(M)
=
\left\lceil
C M\frac{\log H}{H}+K\log n
\right\rceil .
\]

The repaired assertion is

\[
\exists H,\sigma,C,K,N\;
\forall n\ge N\;
\forall\Pi\;
\forall t\ge b_n:
\quad
R(t)=M>0
\Longrightarrow
R(t+B_n(M))\le \frac M2,
\]

where time in the last expression is measured in subsequent Shortener turns, \(b_n\) is the prescribed trapping endpoint,

\[
H(n)\longrightarrow\infty,
\qquad
H(n)^6=o(n),
\]

and \(\sigma\) must immediately continue processing while \(R>0\).

Its negation requires much more than a difficult position:

\[
\forall H,\sigma,C,K,N\;
\exists n\ge N,\Pi,t\ge b_n
\]

such that \(R(t)=M>0\) and

\[
R(t+s)>\frac M2
\qquad
\text{for every }0\le s\le B_n(M).
\tag{1}
\]

In particular, \(t\) must be reached against the particular policy \(\sigma\) being defeated.

---

## 2. First-failure localization theorem

### Theorem

Fix any candidate data \(H,\sigma,C,K\), with \(H\to\infty\), and suppose the prescribed trapping prelude has length \(b_n=o(n)\).

If \((\mathrm{AE}^{\dagger})\) fails against this candidate, then there is a failed ticket whose starting position, and every position throughout its service interval, contains only \(o(n)\) chosen integers.

More quantitatively, the number of actual moves before the end of the first failed interval is at most

\[
b_n
+
O\!\left(
n\frac{\log H}{H}
+
\log ^2 n
\right)
=
o(n).
\tag{2}
\]

### Proof

Fix \(n\) and a Prolonger continuation on which some ticket fails.

Starting at the fixed baseline, form the canonical immediate-successor tickets. Put

\[
s_0=b_n,\qquad M_j=R(s_j).
\]

When \(M_j>0\), let \(s_{j+1}\) be the first subsequent Shortener-turn time at which

\[
R(s_{j+1})\le \frac{M_j}{2}.
\]

If no such time occurs within \(B_n(M_j)\) Shortener turns, the ticket starting at \(s_j\) fails.

Take the first failed canonical ticket, or, if the earliest failing start lies inside a successful canonical ticket, stop at that earliest failing start. Every completed canonical ticket before this point satisfies

\[
s_{j+1}-s_j\le B_n(M_j).
\tag{3}
\]

Moreover,

\[
M_{j+1}\le \frac{M_j}{2}.
\]

Since \(R\le n\),

\[
M_j\le 2^{-j}n,
\qquad
\sum_jM_j\le 2n,
\tag{4}
\]

and there are at most

\[
J\le \lceil\log _2(n+1)\rceil
\tag{5}
\]

nonzero completed tickets.

Consequently, the total number of Shortener turns after the baseline and before the first failed start is at most

\[
\begin{aligned}
\sum_{j<J} B_n(M_j)
&\le
C\frac{\log H}{H}\sum_{j<J}M_j
+
KJ\log n
+
O(J)\\
&\le
2Cn\frac{\log H}{H}
+
K\log n\lceil\log _2(n+1)\rceil
+
O(\log n)\\
&=
o(n).
\end{aligned}
\tag{6}
\]

The first failed interval itself has at most

\[
B_n(M)
\le
Cn\frac{\log H}{H}+K\log n+1
=
o(n)
\tag{7}
\]

Shortener turns.

There is at most one Prolonger move per Shortener move, up to an endpoint error of one. Adding the \(o(n)\)-move trapping prelude proves (2). ∎

### Consequence

A late, linearly developed history cannot be the essential reason that \((\mathrm{AE}^{\dagger})\) fails. Any counterexample has a first bad interval while

\[
|A|=o(n).
\tag{8}
\]

Equivalently, to prove \((\mathrm{AE}^{\dagger})\), it is enough to prove its halving estimate along sparse on-policy prefixes. This removes one possible source of chronological difficulty, but not the important one: the excess \(M\) itself may be much smaller than \(n\).

---

## 3. Why sparse localization still does not prove the assertion

Let \(\mathcal M(A)\) be the divisibility-minimal legal elements, and let \(Q(A)\) be the nonminimal legal targets currently contributing to the shell system.

Every member of \(Q(A)\) is divisible by some element of \(\mathcal M(A)\). Hence some minimal legal root divides at least

\[
\frac{|Q(A)|}{|\mathcal M(A)|}
\tag{9}
\]

nonminimal legal targets.

At the first failed interval, the theorem above permits use of static completion:

\[
|A|=o(n)
\quad\Longrightarrow\quad
|\mathcal M(A)|=o(n).
\tag{10}
\]

But this yields only

\[
\max_d\deg_A(d)
\ge
\frac{M}{o(n)}.
\tag{11}
\]

The demanded rate instead requires, throughout a ticket with \(M\gg\log n\), average aggregate deletion on the scale

\[
\frac{H}{\log H}.
\tag{12}
\]

For a sublinear ticket

\[
\log n\ll M\ll n,
\]

the denominator \(o(n)\) in (11) can be arbitrarily larger than \(M\log H/H\). Thus the static theorem has the wrong normalization even after the sparse-prefix reduction.

The exact positive statement still needed is an accumulated-area estimate. If

\[
\Delta_i^\star
=
\max_{x\text{ legal at }A_i}
\left(
R(A_i)-R(A_i\cup\{x\})
\right),
\]

then a maximum-deletion policy would prove the ticket provided

\[
\sum_{i<T}\Delta_i^\star\ge \frac M2,
\qquad
T=
\left\lceil
CM\frac{\log H}{H}+K\log n
\right\rceil .
\tag{13}
\]

A failed ticket produces the opposite inequality

\[
\sum_{i<T}\Delta_i^\star<\frac M2.
\tag{14}
\]

The frozen repair and incidence theorems do not establish (13), because one later direct-ancestor move can invalidate many currently useful roots or repair certificates while leaving their targets nonminimal through newly exposed roots. That is precisely the chronological Lipschitz/no-reuse gap identified in Attachment A. 

The new localization theorem shows that this gap must already occur in a sparse history. It does not bound the amount of old structural information that one of the \(o(n)\) earlier moves can influence relative to a much smaller ticket mass \(M\).

---

## 4. A concrete slow reservoir, and why it is not a disproof

The simplest private-root construction illustrates both the strength and the insufficiency of known lower mechanisms.

Suppose Prolonger opens by playing \(6\). For every prime

\[
p\in\left(\frac n4,\frac n2\right],
\]

put

\[
u_p=2p\in\left(\frac n2,n\right].
\]

For sufficiently large \(n\), \(p\ne3\), so \(u_p\) is incomparable with \(6\). Its proper divisors are \(2\) and \(p\). The divisor \(2\) is illegal because \(2\mid6\), while \(p\) remains legal. Thus \(p\) is the unique legal proper divisor of \(u_p\).

No legal move can retire two different \(u_p,u_q\):

- a common legal divisor would have to divide both \(2p\) and \(2q\), hence would divide \(2\), which is illegal;
- a move making both \(p\) and \(q\) illegal by upward comparability would have to be a common multiple of \(p\) and \(q\), but \(pq>n\).

Therefore the family

\[
\mathcal F_n=\{2p:n/4<p\le n/2,\ p\text{ prime}\}
\]

can lose at most one member per subsequent move that affects it. Its size is

\[
|\mathcal F_n|=\Theta\!\left(\frac n{\log n}\right).
\tag{15}
\]

So it really is a one-unit-per-turn fortress once activated.

Nevertheless it does not refute \((\mathrm{AE}^{\dagger})\), for two independent reasons.

First,

\[
\frac n{\log n}=o(n),
\]

so the stipulated trapping prelude is allowed, in principle, to consume the entire family before the fixed baseline.

Second, in the top shell its population is smaller than the shell floor whenever \(H\) is sufficiently slow. Indeed,

\[
|\mathcal F_n|
\asymp\frac n{\log n},
\qquad
\frac{4X}{H^2}\asymp\frac n{H^2}.
\]

If, for example,

\[
H=o(\sqrt{\log n}),
\]

then

\[
\frac n{\log n}
=o\!\left(\frac n{H^2}\right),
\]

so this whole private family contributes no positive aggregate excess at all.

Thus any actual disproof must produce a denser or repeatedly refined private reservoir that:

1. survives the prescribed prelude against the policy being defeated;
2. lies above the \(4X/H^2\) shell floors even for an arbitrarily slowly growing \(H\);
3. remains nonminimal rather than transferring into the minimal bank;
4. is forced on the realized trajectory, not merely exhibited as a legal off-policy position.

No construction in the supplied record has all four properties.

---

## 5. The exact remaining alternatives

A proof must establish, for one explicit online policy, a sparse-trajectory inequality of the form

\[
R(s+T)
\le \frac{R(s)}2
\]

with

\[
T=O\!\left(R(s)\frac{\log H}{H}+\log n\right),
\]

despite all direct-ancestor refinements. Equivalently, it must prove the accumulated-area lower bound (13).

A disproof must show that for **every** complete policy and every admissible choice of \(H,C,K\), Prolonger can force an on-policy post-baseline interval satisfying

\[
R(s+i)>\frac{R(s)}2
\qquad
(0\le i\le B_n(R(s))),
\]

while the protected excess neither dies nor becomes minimal. The first-failure theorem additionally shows that this forcing construction can and must occur during an \(o(n)\)-move prefix.

The ledger route does not bridge the gap. Once ownership is genuinely interval-local and causally tied to the moves made during the failed interval, the ledger assertion is equivalent to aggregate halving itself; without that locality, owner-time laundering makes it vacuous. 

## Final conclusion

\[
\boxed{
\begin{minipage}{0.88\linewidth}
Under the exact repaired quantifiers, no additional degeneracy or hidden
collapse is exposed.  But the supplied theorems also do not prove the
required accumulated global deletion, and the supplied lower constructions
do not force a bad interval against every complete Shortener policy.

Therefore no valid unconditional proof or disproof of
\((\mathrm{AE}^{\dagger})\) is obtained.  The new unconditional conclusion is
that any first counterexample must already occur on a sparse,
\(o(n)\)-move trajectory; the unresolved issue is entirely the
ticket-relative chronological normalization.
\end{minipage}}
\]
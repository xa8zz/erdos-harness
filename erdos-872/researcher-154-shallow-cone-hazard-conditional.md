---
id: R154-shallow-cone-hazard-conditional
type: research
date: 2026-07-13
intent: >
  Attempt a full unconditional proof or disproof of L(n)=o(n) for the
  primitive-set divisibility game, given the complete established record as
  fact.
predecessors: []
prompt: erdos-872/prompts/researcher-R154-solution-attempt-full-compilation.md
action:
  kind: standalone
claim: >
  No unconditional proof or disproof of L(n)=o(n) is obtained; the bounds
  c_delta n(loglog n)^2/log n <= L(n) <= (0.1897123371+o(1))n stand unchanged.
  Lemma 1: for any play prefix with t=o(n) actual moves, the union M_t of the
  sets of minimal legal integers occurring at every point of that prefix
  satisfies |M_t|=o(n), uniformly over all such prefixes (cumulative, not
  merely pointwise, minimal-root sparsity). Lemma 2 (root-quotient hazard):
  fix 0<s<1 and let Shortener, at each turn, choose a legal integer d with
  probability proportional to d^{-s} among currently legal integers; if x is
  currently legal and non-minimal with a minimal legal divisor m satisfying
  x/m>H, then, conditional on the entire realized history (hence valid
  against an adaptive Prolonger), the probability the next move makes x
  illegal is at least c_s H^s/n for a constant c_s>0 depending only on s.
  Proposition 3 (conditional upper theorem): if there exist T=T(n), H=H(n)
  with T=o(n), H->infinity, T H^s/n -> infinity, and, uniformly over all
  play prefixes of at most 2T+1 actual moves, the shallow quotient cone
  C_T(H) = {x<=n : x=mq, m in M_T, 1<=q<=H} satisfies |C_T(H)|=o(n), then
  L(n)=o(n) (proved by running the hazard policy for T Shortener turns,
  bounding expected surviving legal set size by |C_T(H)|+n*exp(-c_s T H^s/n),
  derandomizing via backward induction on the finite zero-sum game, then
  applying the continuation lemma). Section 4 shows Lemma 1 cannot supply
  Proposition 3's hypothesis: writing T=n/G with G->infinity, the hazard
  condition forces H >> G^{1/s} >> G (since s<1); a root population of size
  Theta(n/G) concentrated at scale m ~ n/G, each with Theta(G) quotients up
  to n, is compatible with |M_T|=o(n) and with every fixed dyadic-shell
  cumulative sparsity bound, yet gives |C_T(H)| ~ n; the linear shallow-cone
  mass migrates to a deeper shell as n grows, so no fixed-shell cutoff choice
  repairs the argument. Section 5 identifies this as an instance of the
  direct-ancestor obstruction: a single blocker move a=2d can render every
  target in the fiber {dm : m odd} affected simultaneously without directly
  deleting them or transferring them to minimality, so they may instead
  acquire new, deeper minimal roots; closing the hypothesis of Proposition 3
  would require a chronological theorem stating that during any o(n)-move
  on-policy interval, targets whose minimal roots move through quotient
  cones of total weighted size Theta(n) must undergo Theta(n) direct
  deletion, exact play, or irreversible transfer to the minimal bank — not
  supplied by static completion, cumulative fixed-shell sparsity, pointwise
  degree growth, or all-orders frozen witnesses. Section 6: the lower-bound
  direction is separately unresolved — no accepted mechanism (growing-cap
  fortress giving only Omega(n/H(n))=o(n); fixed robust-entry into a
  positive-density reservoir, ruled out; the rank-k hierarchy
  c_k n(loglog n)^{k-1}/log n with c_k decaying doubly exponentially in k,
  blocked from k=k(n)->infinity by multiplier-lock analysis; or defeats of
  specific named Shortener policies, which do not lower-bound the minimax
  value) supplies a fixed c>0 and n_k->infinity with L(n_k)>=c n_k against
  every Shortener strategy.
implications:
  - The problem now reduces to one precisely quantified chronological
    hypothesis (weighted, moving-scale shallow-cone sparsity, condition (6)
    of Proposition 3); resolving it in either direction resolves L(n)=o(n).
  - Cumulative minimal-root sparsity, even at every fixed dyadic shell, is
    proven insufficient for that hypothesis via an explicit counter-profile
    (roots at scale n/G, each carrying Theta(G) quotients, G to infinity).
  - The obstruction is sharpened from a qualitative "one blocker serves many
    deadlines at once" description into a quantitative scale-matching
    requirement between the hazard threshold H and the root-spacing scale G.
  - Both the upper hypothesis and any linear-density lower-bound
    mechanism remain open; no direction of L(n)=o(n) is closer to closure
    than before this attempt.
confidence_at_time: medium
strategy_dependence: independent
---

# Verdict

I did **not** obtain a valid unconditional proof or disproof of

\[
L(n)=o(n).
\]

After treating every item in the prompt as established and attempting both directions, a complete argument still stops at the chronology-sensitive direct-ancestor problem. In particular, neither of the following has been proved:

\[
\text{a Shortener strategy forcing }o(n)\text{ moves},
\]

or

\[
\exists c>0,\ \exists n_k\to\infty,\qquad L(n_k)\ge c n_k.
\]

Thus the strongest unconditional bounds remain

\[
c_\delta\frac{n(\log\log n)^2}{\log n}
\le L(n)
\le(0.1897123371+o(1))n.
\]

Both are compatible with either answer. The most recent uploaded audit reaches the same endpoint: a linear capped tail is neither excluded nor realized by the established machinery. 

What follows is the strongest additional reduction I can prove. It gives a new probabilistic Shortener policy and identifies, in a particularly explicit form, why cumulative minimal-root sparsity still does not close the problem.

---

# 1. Cumulative minimal roots are globally sparse

Consider any play prefix containing \(t=o(n)\) actual moves. Let

\[
\mathscr M_t
=
\bigcup_{0\le i\le t}\mathcal M(A_i)
\]

be the set of all integers which are minimal legal at some time during that prefix.

## Lemma 1

Uniformly over all such prefixes,

\[
|\mathscr M_t|=o(n).
\]

## Proof

Fix \(\varepsilon>0\). The number of members of \(\mathscr M_t\) below \(\varepsilon n\) is trivially at most \(\varepsilon n\).

By the accepted cumulative fixed-interval sparsity theorem, only \(o(n)\) integers in the fixed interval

\[
(\varepsilon n,n]
\]

ever become minimal legal during an \(o(n)\)-move prefix. Hence

\[
|\mathscr M_t|
\le \varepsilon n+o_\varepsilon(n).
\]

First let \(n\to\infty\), then let \(\varepsilon\downarrow0\). This gives

\[
|\mathscr M_t|=o(n).
\qquad\square
\]

This strengthens the pointwise static-completion statement: not merely the current minimal layer, but the union of all minimal layers encountered during a sparse prefix is sublinear.

It is nevertheless insufficient, because one minimal root may support a growing quotient cone.

---

# 2. A root–quotient hazard strategy

Fix a constant

\[
0<s<1.
\]

At each Shortener turn, at the current position \(A\), choose a legal integer \(d\) randomly with probability

\[
\Pr_A(d)
=
\frac{d^{-s}}{Z(A)},
\qquad
Z(A)=\sum_{z\in\mathcal L(A)}z^{-s}.
\tag{1}
\]

Since

\[
Z(A)
\le \sum_{z=2}^{n}z^{-s}
\le C_s n^{1-s},
\tag{2}
\]

where \(C_s\) depends only on \(s\), small legal roots receive appreciable probability.

For a prefix containing \(T\) Shortener turns, let \(\mathscr M_T\) include all minimal roots appearing at any position of that prefix, including positions immediately after Prolonger moves. For \(H\ge2\), define its **shallow quotient cone**

\[
\mathscr C_T(H)
=
\left\{
x\le n:
x=mq,\quad
m\in\mathscr M_T,\quad
1\le q\le H
\right\}.
\tag{3}
\]

## Lemma 2: root–quotient hazard

Suppose \(x\) is currently legal and nonminimal, and it has a minimal legal divisor \(m\) satisfying

\[
\frac{x}{m}>H.
\]

Then under policy (1), the conditional probability that Shortener’s next move makes \(x\) illegal is at least

\[
c_s\frac{H^s}{n},
\tag{4}
\]

for some \(c_s>0\) depending only on \(s\).

## Proof

Put \(q=x/m>H\). Choosing \(m\) makes \(x\) illegal. By (1) and (2),

\[
\Pr_A(m)
\ge
\frac{m^{-s}}{C_s n^{1-s}}
=
\frac{q^s x^{-s}}{C_s n^{1-s}}.
\]

Since \(x\le n\),

\[
x^{-s}\ge n^{-s},
\]

and therefore

\[
\Pr_A(m)
\ge
\frac{q^s}{C_s n}
\ge
\frac{H^s}{C_s n}.
\]

Take \(c_s=C_s^{-1}\). \(\square\)

The estimate is conditional on the entire realized history. It therefore remains valid against an adaptive Prolonger.

---

# 3. A precise conditional upper theorem

## Proposition 3

Suppose there are functions \(T=T(n)\), \(H=H(n)\) such that

\[
T=o(n),\qquad H\to\infty,\qquad
\frac{T H^s}{n}\longrightarrow\infty,
\tag{5}
\]

and, uniformly over all play prefixes of at most \(2T+1\) actual moves,

\[
|\mathscr C_T(H)|=o(n).
\tag{6}
\]

Then

\[
L(n)=o(n).
\]

## Proof

Run policy (1) for \(T\) Shortener turns, unless the game terminates earlier.

Fix an integer \(x\). Consider the event that at the end of these turns:

1. \(x\) is still legal; and
2. \(x\notin\mathscr C_T(H)\).

At every earlier Shortener turn at which this event remains possible, \(x\) cannot be minimal: if it were minimal, then \(x\in\mathscr M_T\), and the representation \(x=x\cdot1\) would put it in \(\mathscr C_T(H)\).

Choose any current minimal legal divisor \(m\mid x\). If \(x/m\le H\), then again \(x\in\mathscr C_T(H)\). Consequently, as long as \(x\) remains legal without entering the shallow cone, every current minimal root satisfies

\[
\frac{x}{m}>H.
\]

Lemma 2 gives a conditional deletion probability at least \(c_sH^s/n\) on each Shortener turn. Hence

\[
\Pr\left(
x\text{ survives and }x\notin\mathscr C_T(H)
\right)
\le
\left(1-c_s\frac{H^s}{n}\right)^T
\le
\exp\left(-c_s\frac{T H^s}{n}\right).
\tag{7}
\]

Summing over \(x\le n\),

\[
\mathbb E|\mathcal L(A_T)|
\le
\sup|\mathscr C_T(H)|
+
n\exp\left(-c_s\frac{T H^s}{n}\right).
\tag{8}
\]

By (5) and (6), the right-hand side is \(o(n)\).

The finite horizon game is a finite perfect-information zero-sum game with payoff \(|\mathcal L(A_T)|\). Pure optimal strategies exist by backward induction. Thus the randomized guarantee can be derandomized: there is a deterministic Shortener strategy leaving only \(o(n)\) legal integers after \(T=o(n)\) Shortener turns.

Every subsequent actual move consumes one currently legal integer, and legal sets only shrink. The continuation therefore has length at most \(o(n)\). Including the initial \(O(T)=o(n)\) moves gives

\[
L(n)=o(n).
\qquad\square
\]

So the entire problem would follow from the weighted shallow-cone estimate (6).

---

# 4. Why cumulative root sparsity does not prove (6)

Lemma 1 only says

\[
|\mathscr M_T|=o(n).
\]

The immediate estimate

\[
|\mathscr C_T(H)|
\le H|\mathscr M_T|
\tag{9}
\]

is useless without a coupled rate. More fundamentally, this is not merely a defect of the crude inequality.

Write

\[
T=\frac nG,
\qquad G\to\infty.
\]

The hazard requirement in (5) becomes

\[
\frac{H^s}{G}\longrightarrow\infty.
\tag{10}
\]

Since \(s<1\), this forces

\[
H\gg G^{1/s}\gg G.
\tag{11}
\]

Now consider the moving root scale

\[
m\asymp\frac nG.
\]

There can be \(\Theta(n/G)=\Theta(T)=o(n)\) roots on that scale without contradicting cumulative global sparsity. Each such root has room for \(\Theta(G)\) quotients before reaching \(n\). Since \(G<H\), all those targets lie in the shallow quotient cone.

Thus the profile

\[
\#\{\text{roots}\}\asymp\frac nG,
\qquad
\#\{\text{targets per root}\}\asymp G
\tag{12}
\]

has

\[
|\mathscr M_T|=o(n)
\]

but potentially

\[
|\mathscr C_T(H)|\asymp n.
\tag{13}
\]

This is exactly the \(\Theta(n/H)\)-root times \(\Theta(H)\)-target phenomenon already visible in the cone-weighted continuation obstruction.

There is also a clean shell formulation of the quantifier gap. Let

\[
I_j=\left(\frac{n}{2^{j+1}},\frac{n}{2^j}\right].
\]

Fixed-shell cumulative sparsity controls the number \(U_j(T)\) of roots ever appearing in \(I_j\) for every fixed \(j\). But it is compatible with the moving-scale profile

\[
U_j(T)
\asymp
\min\left\{T,\frac{n}{2^j}\right\}.
\tag{14}
\]

At the boundary

\[
2^j\asymp\frac nT=G,
\]

one has

\[
2^j U_j(T)\asymp n.
\tag{15}
\]

For every fixed \(j\), the right side of (14) is eventually \(T=o(n)\), so no fixed-shell theorem is violated. The linear contribution travels to a deeper shell as \(n\) grows. This is why choosing the shell cutoff “sufficiently slowly” does not solve the problem.

The arithmetic question is precisely whether the actual on-policy chronology forbids this moving linear cone profile. None of the stipulated facts does so.

---

# 5. Relation to the direct-ancestor obstruction

In the second shell, a legal target \(x=dm\), with \(m\) odd, may have its canonical lift \(2x\) blocked by the selected move

\[
a=2d,
\]

even though \(x\) itself remains legal. One such \(a\) simultaneously certifies every target in the fiber

\[
\{dm:m\text{ odd}\}.
\]

Thus a root \(d\) supporting a large cone can be removed without any of those targets being directly deleted or transferred to minimality. They may then acquire new roots farther down the divisor lattice.

This creates exactly the moving-scale profile that defeats (6):

\[
\text{few direct deletions}
\;+\;
\text{few minimal targets}
\;+\;
\text{many successive root refinements}.
\]

A shared-core blocker may drive these refinements for many targets simultaneously, and the existing atomic ledger controls the opposite divisibility orientation. 

Consequently, proving (6) would require a genuinely chronological theorem such as:

\[
\boxed{
\begin{minipage}{0.86\linewidth}
During every \(o(n)\)-move on-policy interval, targets whose currently
minimal roots move through quotient cones of total weighted size
\(\Theta(n)\) must undergo \(\Theta(n)\) direct deletion, exact play, or
irreversible transfer to the minimal bank.
\end{minipage}}
\]

That is another formulation of the direct-ancestor bounded-lifetime or aggregate-excess-halving problem. It is not supplied by static completion, cumulative fixed-shell sparsity, pointwise degree growth, or all-orders frozen witnesses.

---

# 6. Why the lower-bound direction also remains incomplete

A disproof of \(L(n)=o(n)\) requires a fixed \(c>0\) and a Prolonger strategy such that, along some \(n_k\to\infty\),

\[
L(n_k)\ge c n_k
\]

against **every** Shortener strategy.

None of the accepted lower mechanisms has those quantifiers:

- A growing-cap fortress gives only

  \[
  \Omega\left(\frac n{H(n)}\right)=o(n).
  \]

- A fixed cap would turn that into a linear lower bound, but robust fixed-cap entry into a positive-density upper reservoir is ruled out.

- The rank-\(k\) hierarchy gives

  \[
  c_k\frac{n(\log\log n)^{k-1}}{\log n}
  \]

  for every fixed \(k\), while \(c_k\) decays doubly exponentially. The accepted multiplier-lock analysis prevents choosing \(k=k(n)\) to obtain positive density.

- A history defeating maximum-degree, smallest-root, or another named policy does not lower-bound the minimax value. An arbitrary-policy strategy is required.

- A linear raw or even legal shadow is not enough: quotient cones may expose only \(o(n)\) new minimal elements.

Therefore a negative resolution would require either a new non-reservoir positive-density mechanism or an amplification converting a forceable \(n/H(n)\) bank into \(cn\). No such amplification follows from the established results.

---

# Conclusion

The attempted weighted strategy proves the following genuine reduction:

\[
\boxed{
\begin{aligned}
&\text{Cumulative minimal roots in every sparse prefix are }o(n);\\
&\text{large root quotients can be eliminated in }o(n)\text{ turns};\\
&\text{the only remaining population is the weighted shallow-cone mass.}
\end{aligned}}
\]

But that shallow-cone mass can remain linear at a moving root scale while every fixed-shell and unweighted root count remains sublinear. Excluding this requires exactly the chronology-sensitive direct-ancestor theorem that is still missing.

Accordingly, the honest mathematical ruling is

\[
\boxed{\text{No valid unconditional proof or disproof of }L(n)=o(n)
\text{ is presently obtained from the stipulated record.}}
\]

Presenting either binary conclusion as established would hide the unproved passage from cumulative root sparsity to weighted, moving-scale cone sparsity.
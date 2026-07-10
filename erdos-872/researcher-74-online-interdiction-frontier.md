---
id: R74-online-interdiction-frontier
type: synthesis
date: 2026-07-10
intent: >
  Attempt a full resolution of the linear-versus-sublinear dichotomy after
  importing the external computations, and isolate the first statement that
  remains both sufficient and not statically false.
predecessors:
  - R64-pro-renormalized-shadow-lemma-refuted-prime-antichain
  - R71-edwin-k5-safe-edge-email
  - R73-unconditional-T2-exact-move-potential
action:
  kind: extends
  target: R64-pro-renormalized-shadow-lemma-refuted-prime-antichain
claim: >
  The original dichotomy remains unresolved. A fixed-rank Shortener sweep
  reduces L(n)=o(n) to a reachable q-shadow closure lemma, but an upper-half
  consecutive-block construction refutes the corresponding static lemma even
  within the sweep's move budget. The surviving core is an online weighted
  divisor-interdiction game; local per-fiber rank iteration cannot yield a
  linear lower bound because simplex fibers lose a factor of order 1/h.
implications:
  - A proof of the reachable q-shadow closure lemma gives L(n)=o(n).
  - A Prolonger strategy winning the weighted quotient cover-or-snipe game by a constant harmonic fraction is a serious linear-lower-bound route.
  - Per-move divisor-cloud volume and arbitrary-prefix shadow bounds are both insufficient.
verifiers_at_time:
  - fixed-rank implication exhaustively checked through n=11, no counterexample
  - packet-union asymptotic checked numerically at three scales
  - independent static-counterexample audit, agrees
confidence_at_time: high
strategy_dependence: independent
prompt: erdos-872/prompts/researcher-R72-solution-attempt-verified-core.md
---

# The remaining online-interdiction frontier

No full proof of \(L(n)=o(n)\) or \(L(n)\ge\varepsilon n\) was obtained. The
following reduction and counterexamples isolate the surviving issue without
promoting a static certificate to an online theorem.

## 1. Fixed-rank sweep reduction

Let \(\Omega(m)\) count prime factors with multiplicity and put

\[
  \mathcal D_q(n):=\{d\le n:\Omega(d)=q\},
  \qquad A_q(n):=|\mathcal D_q(n)|.
\]

Shortener repeatedly chooses any legal member of \(\mathcal D_q(n)\) until
none remains. This prefix contains at most \(A_q(n)\) Shortener moves and
\(A_q(n)+1\) Prolonger moves.

Let \(P\) be the Prolonger prefix. If \(x\) is legal after the sweep,
\(\Omega(x)\ge q\), and \(d\mid x\) with \(\Omega(d)=q\), then

\[
  d\mid p
  \quad\text{for some }p\in P.
\]

Indeed, \(d\) is no longer a legal rank-\(q\) move. It cannot be comparable
with a rank-\(q\) Shortener move: two comparable integers with the same
\(\Omega\) are equal, and that selected divisor would make \(x\) illegal.
It cannot contain a Prolonger move as a divisor, since \(p\mid d\mid x\)
would again make \(x\) illegal. The only remaining reason for illegality is
\(d\mid p\) for a prefix Prolonger move.

Define

\[
  R_q(P):=
  \{x:\Omega(x)<q\}
  \cup
  \left\{
    x:\text{every }d\mid x\text{ with }\Omega(d)=q
       \text{ divides some }p\in P
  \right\}.
\]

Every later move lies in \(R_q(P)\). Since later moves form an antichain,

\[
  L(n)\le 2A_q(n)+1+\operatorname{width}(R_q(P)).
\]

Take \(H=\log\log n\) and \(q=\lfloor H/2\rfloor\). Standard
Sathe--Selberg large deviations give

\[
  A_q(n)
  =
  \frac{n}{(\log n)^{I(1/2)+o(1)}},
  \qquad
  I(1/2)=\frac12-\frac{\log2}{2}>0,
\]

and the count of \(\Omega<q\) integers is also \(o(n)\). Therefore the
following genuinely online statement is sufficient for sublinearity:

> **Reachable \(q\)-shadow closure lemma.** For the prefix generated against
> the fixed-rank sweep above,
> \[
>   \operatorname{width}(R_q(P))=o(n).
> \]

## 2. The static closure statement is sharply false

Let \(h=\lceil H\rceil\) and

\[
  T:=\left\lceil\frac{n}{2^{h-q}}\right\rceil
    =\frac{n}{(\log n)^{(\log2)/2+o(1)}}.
\]

Take \(P\) to be \(T\) consecutive integers in \(U_n=(n/2,n]\). Every
\(d\le T\) divides a member of this block. If
\(x\in U_n\setminus P\) and \(\Omega(x)\ge h\), then every rank-\(q\)
divisor \(d\mid x\) satisfies

\[
  d\le \frac{x}{2^{h-q}}\le T,
\]

and hence divides a member of \(P\). Erdős--Kac gives \(\Theta(n)\)
upper-half integers with \(\Omega(x)\ge h\), and \(U_n\) itself is an
antichain. Consequently

\[
  \operatorname{width}(R_q(P))=\Theta(n).
\]

This counterexample fits inside the sweep budget, because

\[
  T
  =
  \frac{n}{(\log n)^{0.3465\ldots+o(1)}}
  \ll
  \frac{n}{(\log n)^{0.1534\ldots+o(1)}}
  =A_q(n).
\]

Thus no arbitrary-prefix or static-shadow lemma can prove the needed
closure. The interleaved Shortener moves are the only possible source of the
missing estimate.

The underlying packet volume is genuinely linear, not a loose union bound.
For fixed \(0<\alpha<1/2\), put \(T=N^\alpha\) and take \(T\) consecutive
upper shields. Every \(d\le T\) divides one shield. The targets

\[
  V=\left\{
    dq\in(2N/3,3N/4]:
    2\le d\le T,\ q\text{ prime}
  \right\}
\]

have unique representations because \(q>N^{1-\alpha}>\sqrt N\), and the
prime number theorem gives

\[
  |V|
  \sim
  \frac N{12}
  \sum_{d\le T}\frac1{d\log(N/d)}
  \sim
  \frac{-\log(1-\alpha)}{12}N.
\]

Finite checks at \((N,\alpha)=(10^6,.30),(2\cdot10^6,.40),(5\cdot10^6,.45)\)
gave respectively \(2.80\%\), \(4.13\%\), and \(4.89\%\) of \(N\), close to
the asymptotic \(2.97\%\), \(4.26\%\), and \(4.98\%\).

## 3. What survives from the divisor-cloud recurrence

For one carrier \(s\le N\), the old rank-one count obstruction is small in
weighted volume. If \(Q_d\) is the set of primes in any fixed-ratio interval
\((aN/d,bN/d]\), then

\[
  \sum_{\substack{d\mid s\\2\le d\le N/2}}|Q_d|
  \ll
  \frac{N\log\log N}{\log N}+N^{1/2+o(1)}
  =o(N).
\]

For \(d\le\sqrt N\), use
\[
  |Q_d|\ll\frac{N}{d\log(N/d)}
  \ll\frac{N}{d\log N}
\]
and \(\sum_{d\mid s}1/d=\sigma(s)/s\ll\log\log N\). For
\(d>\sqrt N\), use \(|Q_d|\le\sqrt N\) and
\(\tau(s)=N^{o(1)}\). Restricting to prime divisors improves
\(\log\log N\) to \(\log\log\log N\).

The preceding consecutive-block construction shows why this one-move bound
cannot simply be summed over a prefix. Many individually \(o(N)\) clouds can
have a linear union.

There is, however, an exact online refinement inside a large-prime
\(p\)-fiber. Take \(p>\sqrt n\), put \(N=\lfloor n/p\rfloor\to\infty\),
so \(pN=(1-o(1))n\), and for every \(d\le t=N^\alpha\) choose a distinct
marker prime

\[
  k_d\in\left(\frac{2N}{3d},\frac{3N}{4d}\right]
\]

and plan the upper target \(x_d=pdk_d\), with residual packet

\[
  Z_d=
  \left\{
    pdq:
    q\in\left(\frac{2N}{3d},\frac{3N}{4d}\right]\cap\mathbb P,
    \ q\ne k_d
  \right\}.
\]

If Shortener invalidates \(x_d\) by a divisor containing the unique marker
\(k_d\), that move can snipe only this planned lift. If the divisor omits
\(k_d\), it divides \(pd\) and therefore kills all of \(Z_d\). An exact
upper-half reply installs the same shield. The game has therefore been
reduced to a weighted quotient race:

- securing \(d\) preserves packet weight \(\asymp N/(d\log N)\);
- playing a divisor \(e\) deletes the weights of multiples \(d\);
- a marker move removes only one planned packet.

Proving that Prolonger retains a positive fraction of
\(\sum_{d\le t}1/d\) would give a serious linear-lower-bound mechanism.
Proving that Shortener reduces the retained mass to \(o(\log t)\) would
support the reachable closure lemma. Neither direction is presently proved.

## 4. Why a local all-ranks lower bound cannot settle the problem

At rank \(h\), take \(h+1\) small primes
\(V=\{p_1,\ldots,p_{h+1}\}\), a common large prime \(q\), and the
\(h+1\) facet targets

\[
  t_i=q\prod_{j\ne i}p_j.
\]

After Prolonger plays \(t_i\), the lateral move \(qp_i\) is legal and divides
every other target \(t_j\), \(j\ne i\). Thus this whole fiber contributes at
most two actual game moves out of \(h+1\) raw targets. Exact minimax checks
at \(h=2,3,4\) give one Prolonger exact target out of \(3,4,5\),
respectively.

Squarefree-core mass is concentrated at
\(h=\log\log n+O(\sqrt{\log\log n})\). Hence any architecture that applies
a worst-case local fiber factor independently at each rank loses at least a
factor of order \(1/h\) in the central window and can certify at most
\(O(n/\log\log n)\), not \(\varepsilon n\).

This is not a proof of sublinearity. It says that a linear lower bound must
use a global strategy-generated invariant or compensation across fibers,
whereas a sublinear upper bound must prove online interdiction while the
large divisor shadow is being built.

## 5. Honest endpoint

The rank-three safe-edge gap is closed unconditionally in
R73-unconditional-T2-exact-move-potential. The original asymptotic dichotomy
is not.

The first surviving question is now exact:

> While Prolonger builds a collective divisor shadow large enough to preserve
> linear target mass, do Shortener's interleaved rank-\(q\) or multiscale
> moves necessarily delete comparable mass?

A positive answer in the fixed-rank formulation proves \(L(n)=o(n)\). A
negative answer implemented as a legal cover-or-snipe Prolonger strategy
would be a credible route to \(L(n)\ge\varepsilon n\).

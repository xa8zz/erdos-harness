---
id: R140-frozen-cone-harmful-mass
type: research
date: 2026-07-12
intent: >
  Independent full-solution attempt at the divisibility-game dichotomy
  L(n) = o(n) vs L(n) = Omega(n) on {2..n}, given the full compiled
  record including the net-surviving lower-route machinery (fan
  hierarchy, cover-shattering, universal block-product, interval
  antichain).
predecessors: []
action:
  kind: standalone
claim: >
  No unconditional proof or disproof follows from the record. New exact
  form of the crux — frozen-cone accounting: fix a position, assign
  each nonminimal legal x one minimal legal divisor rho(x), partition
  into cells C_m, and run the frozen sweep where Shortener plays
  surviving members of the frozen minimal layer. Lemma 1: the only way
  a frozen root m can die while a cell member x survives nonminimal is
  a Prolonger move a with m | a properly and a incomparable to x
  (proper divisors of m were legal at freeze time, contradicting
  minimality; playing m itself kills the cell; Shortener plays only
  frozen roots). Lemma 2: the surviving nonminimal mass after the
  sweep is at most sum over Prolonger moves a of the frozen harmful
  mass H(a) = #{x : rho(x) | a, x survives legal and nonminimal}. So a
  frozen sweep succeeds precisely when sum_a H(a) is small — not an
  endpoint degree, not a count of blocked roots. Randomizing root
  priorities or weighting by cell size recovers maximal-cone
  contraction in expectation but does NOT remove the obstruction: a
  carrier a invalidates every frozen root dividing it simultaneously,
  the relation m | a is priority-independent, and the record's
  direct-ancestor constructions show H(a) is bounded by no function of
  Delta, tau(a), |A| Delta, or any fixed o(n) allowance. The
  randomized cone strategy therefore needs exactly the
  trajectory-restricted estimate sum_{a in interval} H(a) <= o(M) +
  O(M log H / H) — a direct-ancestor version of aggregate-excess
  halving, supplied by none of the established theorems. Lower facts
  likewise do not disprove sublinearity (quantifier form).
implications:
  - Concurrence with the interval-exclusion form: the frozen harmful
    mass sum is the same chronological quantity in yet another dress;
    its per-interval control IS the halving statement.
  - The frozen accounting lemmas are simple and reusable for any sweep
    analysis; candidates for a quick confirmation audit.
verifiers_at_time: []
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/researcher-R140-solution-attempt-full-compilation.md
---

# Verdict

\[
\boxed{\text{I do not have a valid unconditional proof or disproof of }L(n)=o(n).}
\]

More strongly, after treating every listed result as established, I can isolate the exact inference that a proof would still need. None of the supplied upper-bound facts proves that inference, and none of the supplied lower-bound mechanisms contradicts \(L(n)=o(n)\). Presenting either conclusion as proved would therefore require inserting an unproved chronological statement.

This is not merely an appeal to the problem’s prior status. Below is a direct reduction showing why a seemingly promising new strategy—randomized processing of minimal legal cones—also terminates at the same direct-ancestor obstruction identified in the attachment. 

## 1. A frozen-cone reduction

Fix a position \(A_0\), and write

\[
M_0=\mathcal M(A_0),\qquad
Q_0=\mathcal L(A_0)\setminus M_0 .
\]

For every \(x\in Q_0\), choose one minimal legal divisor

\[
\rho(x)\in M_0,\qquad \rho(x)\mid x.
\]

This partitions \(Q_0\) into cells

\[
C_m=\{x\in Q_0:\rho(x)=m\},\qquad m\in M_0.
\]

Consider the natural frozen sweep in which Shortener attempts to play each still-legal \(m\in M_0\).

### Lemma 1: the only harmful way a frozen root can disappear is upward

Suppose \(m\in M_0\) becomes illegal during the sweep while some \(x\in C_m\) remains legal and nonminimal. Then the first move making \(m\) illegal is a Prolonger move \(a\) satisfying

\[
m\mid a,\qquad a\nmid x,\qquad x\nmid a.
\]

#### Proof

A move comparable with \(m\) either divides \(m\), equals \(m\), or is a proper multiple of \(m\).

A proper divisor \(a\mid m\) cannot be the responsible move. Legality only decreases as play proceeds, so if \(a\) was legal when selected, it was legal at \(A_0\). This contradicts the divisibility-minimality of \(m\), unless \(a=m\).

If \(a=m\), then every \(x\in C_m\) is a multiple of the selected move \(m\), hence becomes illegal. Thus this case cannot leave \(x\) legal.

Shortener plays only surviving members of \(M_0\), so a proper multiple of \(m\) can only be supplied by Prolonger. Finally, if that multiple were comparable with \(x\), then \(x\) would also become illegal. Therefore a surviving \(x\) is incomparable with \(a\). ∎

For a Prolonger move \(a\), define its frozen harmful mass

\[
H_{A_0}(a)
 =
\#\left\{
x\in Q_0:
\rho(x)\mid a
\text{ and }x\text{ is still nonminimal and legal at the end}
\right\}.
\]

### Lemma 2: exact frozen accounting

After the sweep,

\[
\#\{x\in Q_0:x\text{ is still legal and nonminimal}\}
\le
\sum_{a\in\mathcal P}H_{A_0}(a),
\tag{1}
\]

where \(\mathcal P\) is the set of Prolonger moves made during the sweep.

#### Proof

Take a surviving nonminimal \(x\in Q_0\), and put \(m=\rho(x)\).

If \(m\) remained legal until its scheduled turn, Shortener played it, which would have killed \(x\). Hence \(m\) was made illegal earlier. By Lemma 1, its first blocker was a Prolonger move \(a\) with \(m\mid a\), while \(x\) survived. Thus \(x\) is counted in \(H_{A_0}(a)\). ∎

This gives a particularly clean form of the difficulty:

\[
\boxed{\text{A frozen minimal-root sweep succeeds precisely when }
\sum_a H_{A_0}(a)\text{ is small.}}
\tag{2}
\]

The quantity in (2) is not an endpoint degree and not the number of roots blocked. It is the mass of targets that survive after their planned roots are destroyed by direct ancestors.

## 2. Why randomizing the root order does not remove the obstruction

A natural idea is to assign random priorities to \(M_0\), or to choose \(m\) with probability proportional to \(|C_m|\). Without interference, the expected deletion in one turn is governed by

\[
\frac{\sum_{m\in M_0}|C_m|^2}{|Q_0|}
\ge
\frac{|Q_0|}{|M_0|}.
\]

That recovers maximal-cone contraction.

But Prolonger moves before the next Shortener choice. A legal carrier \(a\) simultaneously invalidates every frozen root in

\[
D(a)=\{m\in M_0:m\mid a\}.
\]

If it is played immediately after activation, the random order has not yet protected any of those cells. Its harmful mass can be as large as

\[
\sum_{m\in D(a)}
\#\{x\in C_m:x\not\sim a\}.
\tag{3}
\]

The supplied direct-ancestor constructions show that (3) cannot be bounded by:

\[
O(\Delta(A_0)),\qquad
O(\tau(a)),\qquad
O\bigl(|A_0|\Delta(A_0)\bigr),
\]

or by any fixed exceptional allowance \(o(n)\). A single ancestor can affect many subsequently revealed, mutually unmergeable faces. Random priorities change which root Shortener would have played next; they do not change the simultaneous divisibility relation \(m\mid a\).

Thus the randomized cone strategy requires exactly a trajectory-restricted estimate of the form

\[
\sum_{a\text{ in an interval}}H_{A_t}(a)
\le o(M)+O\!\left(\frac{M\log H}{H}\right),
\tag{4}
\]

for an interval beginning with excess \(M\). Estimate (4) is a direct-ancestor version of aggregate-excess halving. It is not supplied by the static completion theorem, the LP relaxation, the trace inequality, the atomic ledger, or the frozen repair results.

## 3. Why the established upper facts do not imply sublinearity

### Static completion after peeling

After a peel costing at most \(n/H\) moves, static completion supplies some completion \(C\) with

\[
|C|=o(n).
\]

The continuation lemma then gives only

\[
\text{remaining length}\le(2H+1)|C|.
\]

To conclude \(o(n)\), one needs

\[
|C|=o(n/H),
\tag{5}
\]

not merely \(o(n)\).

There is no valid composition of the two little-\(o\) statements. For example, the qualitative estimate

\[
|C|\le \frac{n}{\log H}
\]

is consistent with \(|C|=o(n)\), while

\[
H|C|/n\ge \frac{H}{\log H}\longrightarrow\infty.
\]

The interval-blocker construction in the attachment demonstrates that this is not just an artificial modulus pathology.

### Pointwise degree growth

A guarantee \(\Delta_t\to\infty\) does not supply enough accumulated area. At a horizon \(t=n/H\), a degree scale such as

\[
\Delta_t\asymp\log\log H
\]

clears only

\[
t\Delta_t
\asymp
\frac{n\log\log H}{H}
=o(n).
\]

To prove sublinearity, the direct progress must be supplemented by a theorem controlling targets transferred through successive minimal-root refinements. That is again the content missing from (4).

### Fixed-depth layer iteration

For every fixed \(j\), the first \(j\) minimal layers have total size \(o(n)\): this follows inductively from static completion. But the relevant depth grows like

\[
j\asymp C\log\log H.
\]

A diagonal argument is not automatic because \(H\) and \(j\) are coupled. The worst-case static modulus can behave on the scale

\[
\mu(\alpha)\asymp \frac1{\log(1/\alpha)}.
\]

Beginning with \(\alpha_0=1/H\), the permissive iteration

\[
\alpha_{i+1}\approx
\alpha_i+\frac1{\log(1/\alpha_i)}
\]

passes through scales resembling

\[
\frac1H,\quad
\frac1{\log H},\quad
\frac1{\log\log H},\quad\ldots
\]

and need not remain small for a number of stages tending to infinity. The required control must use chronology, not independent worst-case applications of the static theorem.

## 4. Why the established lower facts do not disprove sublinearity

A disproof would require

\[
\limsup_{n\to\infty}\frac{L(n)}n>0.
\]

None of the accepted lower mechanisms establishes this.

The absorbing-fortress theorem at a growing cap \(H(n)\) gives only

\[
L(n)\ge \frac{cn}{H(n)}.
\]

Since \(H(n)\to\infty\), this is compatible with \(L(n)=o(n)\). Obtaining a positive density from this route would require either a bounded cap or an amplification converting \(n/H\) protected moves into \(cn\). Bounded-cap robust entry is explicitly ruled out.

Similarly, for every fixed \(k\),

\[
L(n)\ge
c_k\frac{n(\log\log n)^{k-1}}{\log n}
=o(n).
\]

The accepted multiplier-lock result prevents choosing \(k=k(n)\to\infty\) in that construction so as to obtain linear order.

Finally, an off-policy primorial fortress or a history defeating literal maximum degree does not lower-bound the minimax game. A lower bound must survive every Shortener strategy, including batch-guard and fixed-density clearing moves.

## 5. The exact remaining alternatives

An unconditional upper proof could proceed by establishing some genuinely trajectory-restricted statement such as:

\[
R(t)=M
\quad\Longrightarrow\quad
R\!\left(t+
O\!\left(\frac{M\log H}{H}\right)\right)
\le \frac M2
\]

under one fully specified legal Shortener policy, including all batch and fallback moves.

It need not literally use the ledger language, but it must control the same phenomenon represented by \(\sum H_{A_t}(a)\): a move played now becoming the common direct ancestor of many roots revealed only later.

An unconditional lower proof would instead need a Prolonger construction which, against every Shortener policy, maintains positive-density surviving or banked mass for \(\Theta(n)\) moves. The existing fortress, surviving-shadow, and fan constructions do not supply that arbitrary-policy positive-density mechanism.

Therefore the defensible conclusion is:

\[
\boxed{
\begin{array}{c}
\text{The supplied facts do not prove }L(n)=o(n),\\[1mm]
\text{and they do not prove }L(n)\not=o(n).\\[1mm]
\text{My attempted randomized-cone argument reduces to the same}\\
\text{unproved direct-ancestor aggregate bound.}
\end{array}}
\]

So I cannot honestly provide the requested unconditional resolution; doing so would require asserting precisely the chronological no-reuse/aggregate-halving estimate that remains unproved, or asserting an arbitrary-policy linear forcing theorem that has not been constructed.
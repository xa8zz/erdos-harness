---
id: R151-chronology-gap-audit
type: research
date: 2026-07-13
intent: >
  Determine whether the sublinearity question L(n)=o(n) for optimal-play length
  in the primitive-set divisibility game admits an unconditional proof or
  disproof, treating all previously established bounds and structural lemmas
  as given, by testing factorization-entropy compression, rank/height
  compression, static-completion-plus-peeling, and coatom/degree-availability
  accounting as candidate closing arguments.
predecessors: []
prompt: erdos-872/prompts/researcher-R151-solution-attempt-full-compilation.md
action:
  kind: standalone
claim: >
  No unconditional proof or disproof of L(n)=o(n) was obtained; every
  attempted closing route reduces to the same chronology-sensitive
  obstruction. (a) The coatom/degree-availability rate log log(n/t)
  integrates over an o(n)-move prefix to only o(n) cumulative deletion, so it
  cannot force a positive fraction of any dyadic shell to be removed; a
  trajectory with |Q_t| asymp n and max-degree Delta_t asymp log log(n/t)
  satisfies every accepted sparse-prefix estimate while keeping a linear
  target population. (b) Replacing prime coatoms x/p with all divisors x/s,
  s <= K, does not repair this rate: a single blocking move a = dk can
  invalidate many candidate high-degree roots at once without being
  comparable to any of them, so "many roots destroyed implies proportionally
  many moves" is false without an unproven lifetime no-reuse theorem for
  direct ancestors (direct ancestors may be inherited by H^Omega(1) later
  faces). (c) Composing an n/H-move layer peel with the static-completion
  theorem requires a completion of size o(n/H), not merely the o(n) the
  completion theorem supplies; no growing choice of H repairs this, since a
  completion modulus |C|/n asymp 1/log H is compatible with static
  o(n)-completion yet gives H|C|/n asymp H/log H -> infinity. (d) Combining a
  sparse rank/height sweep (poset height <= g reached in n/g moves) with
  layer-wise static completion is invalid because bounded height does not
  bound width: one legal divisor d can support the antichain
  {dp : n/(2d) < p <= n/d, p prime}, so a height-g legal poset can still
  carry a linear target reservoir through one-step edges. (e) For the second
  shell S_1 = (n/4, n/2], the canonical blocker a_x = 2 d_x (d_x | x, x/d_x
  odd) gives no usable capacity bound, since one blocker such as a = 4
  certifies illegality of 2x simultaneously for every x = 2m with m odd; the
  obstruction reduces to a stated cap-entry normal form -- failure of
  second-shell clearing is equivalent to reaching, after o(n) moves, a
  position with |Q_1| > eta|S_1| and max-degree Delta_{Q_1} <= H(n) for
  every H(n) -> infinity, sustained through a linear capped tail, which the
  log log H degree estimate does not exclude. On the lower-bound side, the
  fan-hierarchy construction gives L(n) >= c_k n(log log n)^{k-1}/log n with
  c_k = 2^{-k-2^{k-1}+1} decaying doubly-exponentially in k, and growing-cap
  fortress entry gives only L(n) >= c n/H(n) for H(n) -> infinity; both
  remain o(n), and no accepted amplification theorem converts either into a
  positive linear proportion. The missing ingredient is identified as a
  nonintegrable, chronological trichotomy (a fixed positive fraction of
  targets is directly deleted, or played by Prolonger, or transferred
  irreversibly to the minimal/exact bank within an o(n)-move interval),
  equivalent to an aggregate contraction recurrence
  R(t + C R(t) log H/H + K log n) <= (1/2) R(t) under one fixed online
  Shortener policy, which none of the accepted incidence, coatom,
  fractional-cover, or static-completion estimates supplies.
implications:
  - Rules out strengthening coatom/degree-availability accounting to a linear
    shell-clearing bound by widening the divisor window from primes to all
    divisors <= K; blocker multiplicity defeats any static per-move charge on
    destroyed high-degree roots.
  - Rules out composing static completion with an n/H-move layer peel as a
    sublinearity proof; any future upper-bound attempt on this route must
    supply a genuinely chronological (history-dependent) completion-size
    bound, not a static o(n) one.
  - Localizes the open gap to one explicit dyadic shell (n/4, n/2] and to the
    named cap-entry normal form obstruction, giving a concrete equivalent
    target for future dispatches.
  - Confirms the known lower-bound constructions (fan hierarchy, growing-cap
    fortress) remain strictly o(n) and cannot be boosted to a positive linear
    proportion without a currently-unproven amplification theorem.
confidence_at_time: medium
strategy_dependence: independent
---

# Verdict

\[
\boxed{\text{I do not have a valid unconditional proof or disproof of }L(n)=o(n).}
\]

After treating every listed result as an axiom and trying to close the remaining gap through factorization entropy, rank sweeps, Boolean-cube decompositions, and coatom accounting, each route still encounters the same chronology-sensitive obstruction already isolated in the record. Presenting either conclusion as a theorem would require inserting an unproved statement equivalent in substance to second-shell capped-tail exclusion or aggregate-excess halving.

What follows is the precise audit. It explains why a superficially plausible new proof still fails and why none of the lower constructions disproves sublinearity.

## 1. A useful structural lemma does not provide enough progress

Here is a basic fact that underlies most divisor-refinement arguments.

### Lemma
Suppose \(d\mid x\), and both \(d\) and \(x\) are legal at a position \(A\). Then every \(e\) satisfying

\[
d\mid e\mid x
\]

is legal.

### Proof
If \(e\) were illegal, some \(a\in A\) would be comparable with \(e\).

If \(a\mid e\), then \(a\mid x\), contradicting the legality of \(x\).

If \(e\mid a\), then \(d\mid a\), contradicting the legality of \(d\).

Thus \(e\) is legal. \(\square\)

Consequently, every nonminimal legal \(x\) has a legal coatom \(x/p\) for some prime \(p\mid x\): start with any proper legal divisor and extend it maximally below \(x\).

This suggests the following strategy: count legal coatoms of members of a dense target family \(Q\), and use averaging to find a legal divisor of high \(Q\)-degree. That is exactly the mechanism behind the accepted second-shell degree lemma.

But its best presently established rate is

\[
\Delta_Q(A)\gg_\eta \log\log \frac nt
\]

at a prefix of size \(t=o(n)\). This rate is too small in a precise, quantitative sense. If \(T=\varepsilon n\), then the total direct deletion certified solely by this estimate is on the scale

\[
n\int_0^\varepsilon
 \log\log\frac1s\,ds.
\]

As \(\varepsilon\downarrow0\),

\[
\int_0^\varepsilon
 \log\log\frac1s\,ds
=
\varepsilon\log\log\frac1\varepsilon
+
O\!\left(
 \frac{\varepsilon}{\log(1/\varepsilon)}
\right)
=o(1).
\]

Thus throughout every \(o(n)\)-move prefix, this estimate certifies only \(o(n)\) cumulative deletion. It cannot force the removal of a fixed positive fraction of a second shell.

This is not merely a weakness of the calculation. The compatible abstract trajectory in the assumptions,

\[
|Q_t|\asymp n,\qquad
|\mathcal M_t|\asymp
\frac{n}{\log\log(n/t)},\qquad
\Delta_t\asymp\log\log(n/t),
\]

satisfies all the accepted sparse-prefix estimates while preserving a linear target population. Therefore some genuinely additional chronological property is required.

## 2. Why using all small divisors does not repair the rate

A natural attempted improvement is to replace prime coatoms \(x/p\) with all divisors

\[
d=\frac{x}{s},
\qquad s\le K.
\]

For \(s\) in a short interval such as \((K/2,K]\), the possible \(d\)'s lie in a set of size roughly \(n/K\), so averaging appears capable of producing degree about \(K\), rather than only \(\log\log K\).

The obstruction is the blocker multiplicity. If \(d=x/s\) is illegal while \(x\) remains legal, then some selected move has the form

\[
a=dk
\]

with \(k\) incomparable to \(s\). For one fixed \(a\), its divisors \(d\mid a\) can each support many surviving quotients \(s\). Hence one actual move can invalidate an entire collection of high-degree roots without being comparable with their targets.

Restricting to prime \(s\), using divisor bounds for \(a\), or weighting the interval does not eliminate this. It merely replaces the known direct-ancestor jump by a different notation. In particular, the implication

\[
\text{many high-degree roots destroyed}
\quad\Longrightarrow\quad
\text{proportionally many actual moves}
\]

is false without a lifetime no-reuse theorem. The atomic ledger controls the opposite orientation, while direct ancestors may be inherited by \(H^{\Omega(1)}\) later faces.

So the apparent \(K\)-degree improvement cannot be summed chronologically.

## 3. Static completion still cannot be composed with peeling

Suppose Shortener first makes every integer at most \(n/H\) illegal. This costs at most \(n/H\) moves. At the resulting sparse position, static completion gives a maximal completion \(C\) with

\[
|C|=o(n).
\]

The continuation lemma then gives

\[
\text{remaining length}
\le (2H+1)|C|.
\]

To conclude sublinearity one needs

\[
|C|=o\!\left(\frac nH\right),
\]

not merely \(|C|=o(n)\).

There is no diagonal choice of a slowly growing \(H\) that supplies this missing estimate. A completion modulus of the form

\[
\frac{|C|}{n}\asymp\frac1{\log H}
\]

is compatible with static \(o(n)\)-completion, but then

\[
\frac{H|C|}{n}
\asymp\frac{H}{\log H}\longrightarrow\infty.
\]

The cone-weighted continuation estimate improves the contribution of roots near \(n\), but does not resolve a reservoir supported by roots around \(n/H\), each having \(\Theta(H)\) possible targets.

## 4. Rank and height compression also stop at the same point

The sparse rank sweep forces legal-poset height below \(g\) in \(n/g\) moves. It is tempting to combine this with static completion and sum over the remaining \(g\) layers.

That inference is invalid. Low height does not control width. A single legal root \(d\) may support a large antichain

\[
\left\{dp:
 \frac{n}{2d}<p\le\frac nd,\ p\ \text{prime}
\right\},
\]

all lying one \(\Omega\)-step above \(d\). More generally, successive blocking can replace one root by a wide family of quotient-prime refinements.

Thus a height-\(g\) legal poset can still carry a linear target reservoir through one-step edges. Controlling each fixed minimal layer by \(o(n)\) does not allow summation over a growing number of layers. The interval-blocker modulus and semiprime cross-product regeneration give the exact inflation mechanisms.

## 5. The first unresolved shell remains decisive

After the top shell has been processed, consider

\[
S_1=(n/4,n/2].
\]

Suppose \(Q_1\) remains of positive density. For most \(x\in Q_1\), \(2x\) is illegal. The canonical blocker therefore has the form

\[
a_x=2d_x,\qquad d_x\mid x,\qquad x/d_x\ \text{odd}.
\]

This gives a concrete certificate for every such \(x\), but it does not give a usable capacity bound. One blocker can certify many targets. For example, \(a=4\) certifies the illegality of \(2x\) for every

\[
x=2m,\qquad m\ \text{odd},
\]

in the appropriate range.

The remaining legal divisor of \(x\) must involve part of the quotient \(x/d_x\). Blocking that new divisor refines the target into another divisor class. Repeating this process is exactly the direct-ancestor refinement mechanism.

The cap-entry normal form says that failure of second-shell clearing is equivalent to reaching, after \(o(n)\) moves, an active position with

\[
|Q_1|>\eta |S_1|,
\qquad
\Delta_{Q_1}\le H(n)
\]

for every prescribed \(H(n)\to\infty\), followed by a linear capped tail. The degree estimate does not exclude this because at a horizon \(t\asymp n/H\) it yields only

\[
\Delta_{Q_1}\gg\log\log H=o(H).
\]

Nor does fixed-cap fortress exclusion apply after rescaling: the selected elements in \((n/2,n]\) are external blockers that are absent from the putative board of size \(n/2\).

Therefore a proof of \(\mathrm{FSC}(2,\eta)\) still requires a new assertion that accumulated refinement cannot sustain this capped tail. None of the accepted incidence, coatom, fractional-cover, or static-completion estimates supplies that assertion.

## 6. The lower constructions do not disprove sublinearity

The lower side also stops strictly short of a disproof.

For every fixed \(k\), the fan hierarchy gives

\[
L(n)\ge
c_k\frac{n(\log\log n)^{k-1}}{\log n},
\qquad
c_k=2^{-k-2^{k-1}+1}.
\]

This is \(o(n)\). The doubly exponential decay of \(c_k\) prevents choosing \(k=k(n)\to\infty\) to obtain a positive linear proportion.

A growing-cap fortress yields only

\[
L(n)\ge c\frac n{H(n)}.
\]

For every \(H(n)\to\infty\),

\[
\frac n{H(n)}=o(n).
\]

Even a bound such as \(n^{1-o(1)}\) is compatible with \(o(n)\). Obtaining \(\Omega(n)\) would require either a bounded cap, or an amplification showing that blocking a positive fraction of the roots produces linearly many genuinely private descendants.

But robust entry into a positive-density bounded-cap fortress is ruled out. No accepted amplification theorem converts the growing-cap fortress into a linear game. The surviving-shadow constructions likewise expose linear legal shadows but only \(o(n)\) next-layer minima.

Hence the lower machinery does not establish

\[
\limsup_{n\to\infty}\frac{L(n)}n>0.
\]

## 7. The exact missing statement

A valid upper resolution could be supplied by the aggregate contraction

\[
R\!\left(
t+C\,R(t)\frac{\log H}{H}+K\log n
\right)
\le \frac12 R(t),
\]

under one fixed online Shortener policy, with \(H\to\infty\), \(H^6=o(n)\), and mandatory succession while \(R>0\).

Equivalently, at the first nontrivial local level, it would be enough to prove second-shell capped-tail exclusion: a dense \(Q_1\) cannot, on the realized clearing trajectory, undergo linearly many turns while its maximum legal-divisor degree remains capped.

The missing ingredient must be nonintegrable and chronological. It must show that repeated root replacement forces, within an \(o(n)\)-turn interval, at least one of:

\[
\begin{aligned}
&\text{a fixed positive fraction of the targets is directly deleted},\\
&\text{a fixed positive fraction is played by Prolonger},\\
&\text{a fixed positive fraction transfers irreversibly to the minimal/exact bank}.
\end{aligned}
\]

Pointwise degree divergence, static covers, bounded snapshot incidence, and frozen repair potentials do not imply this trichotomy.

# Conclusion

The unconditional bounds remain compatible with both possibilities:

\[
c_\delta
\frac{n(\log\log n)^2}{\log n}
\le L(n)
\le
(0.1897123371+o(1))n.
\]

Every established lower bound is \(o(n)\), while every established upper strategy remains linear. The attempted factorization and coatom arguments above do not bridge the gap: they reduce exactly to the unresolved lifetime control of direct ancestors.

Thus the only mathematically defensible conclusion is

\[
\boxed{
\begin{array}{c}
\text{No unconditional proof or disproof of }L(n)=o(n)
\text{ has been obtained here;}\\[1mm]
\text{claiming one would conceal an unproved second-shell or}\\
\text{aggregate-excess chronology theorem.}
\end{array}}
\]
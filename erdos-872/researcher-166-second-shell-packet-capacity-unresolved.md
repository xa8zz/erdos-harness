---
id: R166-second-shell-packet-capacity-unresolved
type: research
date: 2026-07-15
intent: >
  Determine whether the established upper-bound and lower-bound machinery for
  a divisibility-antichain game, together with two natural new compositions
  of that machinery, closes the question of whether optimal game length is
  o(n).
predecessors: []
prompt: erdos-872/prompts/researcher-R166-solution-attempt-full-compilation.md
action:
  kind: standalone
claim: >
  No unconditional proof or disproof of L(n)=o(n) is obtained. (1) The
  upper-bound route stalls at the second dyadic shell: a hypothetical
  linear-length greedy phase there forces a tri-causal packet system
  (preparation, release, service) in which one Prolonger reply can
  simultaneously discharge a survivor deadline, release a future minimal
  root, and supply an inherited coatom preparation, so no pointwise
  one-reply-one-obligation charging argument can bound it; the missing
  ingredient is an amortized, preparation-sensitive capacity theorem for
  these packets. (2) The chronology-safe first-death ledger gives every
  actual move a bounded charge and hence O(n) capacity over a linear
  interval, but the Hall/persistent-root demand over that interval is also
  only Theta(n), so there is no overload; making the ledger weights
  nonsummable does not repair this, since positive-density rough families
  keep arbitrarily small summable coatom weight while unweighted demand is
  defeated by interval-blocker preparations — the missing statement must be
  inherently nonlinear and track shared preparation histories. A
  trajectory-uniform bound (SC*) is identified as exactly the missing first
  estimate but is unproved [NOTE: R167 subsequently proved (SC*) and its
  relative form circular — equivalent to the goal — so this identification
  is superseded]. (3.1) Combining the sparse-rank-sweep height bound with
  fixed-layer clearing at growing layer count J=g(n)->infinity is invalid:
  fixed-J clearing is o(n) for every fixed J, but the true layer-mass
  profile is (1-o(1))n once J grows to g(n), the same reciprocal scale at
  which the rank sweep costs n/g — qualitative fixed-prefix control does not
  transfer to diagonal control. (3.2) Combining static completion with
  repeated maximal-cone greedy halving is invalid because the minimal-root
  set regenerates during the halving interval: the achievable minimal-root
  density mu_n(alpha) satisfies mu_n(alpha) >~ 1/log(1/alpha) under the
  interval-blocker construction, giving a decay rate for the nonminimal
  population whose cumulative integral over a sparse prefix is
  O(eps*log(1/eps)) -> 0, so cumulative guaranteed deletion can be o(n) —
  the same integrability obstruction as the known second-shell log-log
  growth estimate. (4) No supplied Prolonger construction forces a positive
  density of moves against arbitrary Shortener play: the strongest
  unconditional family gives c_k*n(loglog n)^{k-1}/log n for fixed k with
  constants collapsing doubly exponentially as k grows; growing-cap fortress
  entry gives only n/H(n) = o(n); constructions defeating one specific
  Shortener policy are not game lower bounds since Shortener may adopt a
  different policy with batch guards. (5) The exact open statement: starting
  from an o(n)-move position with a linear second-shell nonminimal
  population, can Prolonger sustain a linear sequence of replies
  simultaneously satisfying a prefix Hall identity on released service
  roots, causal blocking of persistent high-incidence divisors before their
  deadlines, full coatom preparation of every released root by distinct
  earlier replies, and a primitive-set constraint, while the maximum-degree
  Shortener policy deletes only a bounded total — with neither a realizing
  construction nor an excluding capacity theorem known. Neither new
  composition (3.1, 3.2) nor the (SC*) target constitutes new mathematical
  content beyond the established record: they are re-derivations, from
  previously established reductions, of why two specific naive combinations
  fail, plus a precise restatement of the first open estimate.
implications:
  - The problem remains fully open; no promotion-grade upper- or lower-bound
    closure exists; the two composed routes (3.1, 3.2) fail for structural
    reasons (diagonal non-transfer; minimal-root regeneration), not
    unoptimized constants, so neither should be re-attempted.
  - The (SC*) target this round identifies as "the missing first estimate"
    was proven circular by R167 (equivalent to the goal); future upper-bound
    attempts must leave the capacity-inequality frame entirely.
  - The preparation-release-service packet structure is real and reusable,
    but as an inequality it does not close; a non-inequality use of the
    chronology, or a different decomposition, is required.
confidence_at_time: medium
strategy_dependence: independent
---

# Verdict

I do **not** have a valid unconditional proof or disproof of  
\[
L(n)=o(n).
\]

The statement remains unresolved under the supplied record. In particular, none of the established results can be composed to close the remaining chronological gap, and the two most plausible new compositions fail for precise quantifier reasons explained below.

A claimed proof at this point would have to introduce a genuinely new theorem controlling the preparation-sensitive, trajectory-restricted packet system. A claimed disproof would have to construct that packet system on an actual trajectory against **every** Shortener strategy. Neither has been obtained.

## 1. Why the existing upper-bound machinery stops

A proof of \(L(n)=o(n)\) would follow from the finite-shell statement
\[
\mathrm{FSC}(J,\eta)
\]
for every fixed \(J\) and \(\eta>0\), or from the stronger aggregate-excess statement \(\mathrm{AE}^{\dagger}\).

The top shell is settled. The first unresolved obstacle is the second shell. If a second-shell greedy phase has linear length, the accepted reductions give, after an \(o(n)\)-move activation prefix, a linear active interval with all of the following simultaneous properties:

1. A linear final survivor family \(X\subseteq S_1\).
2. A linear sequence of distinct greedy service roots \(g_t\), with a fixed positive fraction lying in a macroscopic interval
   \[
   [\alpha n,n/4].
   \]
3. A constant-degree suffix.
4. A linear family of persistent roots that were already legal at the sparse entry position.
5. For each service root not minimal at entry, a unique release time
   \[
   \gamma(t)<t.
   \]
6. The exact prefix Hall identity
   \[
   s
   =
   |\{t\le s:g_t\text{ was minimal at entry}\}|
   +
   \sum_{j<s}|C_j(s)|.
   \]
7. A strict three-stage chronology for almost every released root:
   \[
   \text{preparation}<\text{release}<\text{service}.
   \]
8. Causal survivor deadlines: sufficiently high-incidence divisors must be blocked by early **Prolonger** replies.

Thus a bad interval creates a tri-causal packet system. A Prolonger reply must potentially perform several tasks at once:

- discharge survivor deadlines;
- release future greedy roots;
- help create persistent roots;
- inherit the earlier coatom preparation needed for those releases.

The local packet example
\[
p=3m,\qquad (m,30)=1,
\]
shows that one reply can perform all three visible services simultaneously. Consequently, no pointwise “one reply, one obligation” argument can work.

The missing theorem is an amortized, preparation-sensitive capacity bound for these packets.

## 2. Why the chronology-safe ledger is insufficient

The strongest unconditional lifetime estimate supplied is the \(L^s\) first-death ledger: for \(s>2\), every actual move receives at most \(C_s\) total charge.

Over a linear interval of \(T=\Theta(n)\) moves, that gives capacity
\[
O(T)=O(n).
\]

But the demand forced by the Hall and persistent-root systems is also only \(\Theta(n)\) under these summable weights. Therefore there is no overload.

Trying to make the weights nonsummable does not repair this. Positive-density \(Y\)-rough families have arbitrarily small summable coatom weight, while unweighted coatom demand is defeated by interval-blocker preparations. The obstruction is not that a suitable coefficient has not been optimized; the obstruction is that the required capacity statement must be nonlinear and must recognize shared preparation histories.

The repaired target \((\mathrm{SC}^*)\) captures exactly the first missing estimate. With
\[
\Lambda_n=\sum_{p\le Z_n}\frac1p,
\]
it asks for a trajectory-uniform bound of the form
\[
\sup_I
\frac{
\left[
\sum_{t:g_t\ge \alpha n}\nu_{Z_n}(g_t)
-
C_\alpha E
\right]_+
}{
n\Lambda_n
}
\longrightarrow0,
\]
under the frozen-entry normalization
\[
Z_n^2a_n=o(n\log\log Z_n).
\]

A positive-density macroscopic root family has Turán–Kubilius demand
\[
\sum_t\nu_{Z_n}(g_t)
\ge
(\delta/3-o(1))n\Lambda_n.
\]
Since \(E=O(n)\) and \(\Lambda_n\to\infty\), \((\mathrm{SC}^*)\) would contradict a linear second-shell tail.

But \((\mathrm{SC}^*)\) has not been proved. Moreover, resolving it would settle the first unresolved shell, not automatically all deeper fixed shells: deeper shells inherit blocker histories from every preceding shell, and the present certificate control does not induct.

## 3. Two tempting new compositions that fail

### 3.1 Sparse rank sweep plus fixed-layer clearing

The sparse rank sweep says that, for any \(g\ge2\), Shortener can spend at most \(n/g\) moves and force
\[
d\mid x,\quad d,x\text{ legal}
\quad\Longrightarrow\quad
\Omega(x)-\Omega(d)<g.
\]
Hence the legal divisibility poset has height less than \(g\).

Separately, every fixed number \(J\) of minimal-legal layers can be cleared in \(o(n)\) moves from an \(o(n)\)-size position.

It is tempting to set \(J=g(n)\to\infty\). This is invalid. The fixed-\(J\) statement is not uniform on the diagonal \(J=g(n)\). The abstract profile
\[
|C_j|=\left\lfloor\frac{n}{g(n)}\right\rfloor,
\qquad
0\le j<g(n),
\]
satisfies
\[
\sum_{j<J}|C_j|=o(n)
\]
for every fixed \(J\), while
\[
\sum_{j<g(n)}|C_j|=(1-o(1))n.
\]

The rank sweep costs \(n/g\), so the starting density and the number of required layers are coupled at exactly the bad reciprocal scale. Qualitative fixed-prefix control does not yield diagonal control.

### 3.2 Static completion plus maximal-cone greedy halving

At a sparse position,
\[
|\mathcal M(A)|=o(n),
\]
and some minimal legal root divides at least
\[
\frac{|Q(A)|}{|\mathcal M(A)|}
\]
nonminimal legal elements.

One might therefore expect repeated maximal-cone moves to halve \(Q\) in \(o(n)\) time.

The defect is regeneration of the minimal-root set during the attempted halving interval. If
\[
\mu_n(\alpha)
=
\sup_{\substack{|A|\le\alpha n\\A\text{ primitive}}}
\frac{|\mathcal M(A)|}{n},
\]
the naïve differential progress is governed by roughly
\[
\frac{dQ}{dt}\lesssim-\frac{Q}{n\mu_n(t/n)}.
\]
The interval-blocker construction permits
\[
\mu_n(\alpha)\gtrsim\frac1{\log(1/\alpha)}.
\]
Consequently,
\[
\int_0^\varepsilon\frac{ds}{\mu_n(s)}
\lesssim
\int_0^\varepsilon \log(1/s)\,ds
=
\varepsilon\log(1/\varepsilon)+O(\varepsilon)
\longrightarrow0.
\]

Thus even the cumulative guaranteed deletion over an arbitrary sparse prefix may be \(o(n)\). Transfers into the minimal set do not by themselves fix this: the interval-blocker profile permits a sublinear but much larger-than-prefix minimal set while retaining a linear nonminimal reservoir.

This is the same integrability obstruction encountered by the explicit second-shell estimate
\[
\Delta_Q(A)\gg_\eta\log\log(n/|A|).
\]

## 4. Why the lower-bound machinery also does not decide the problem

No supplied Prolonger construction forces \(\Omega(n)\) moves against arbitrary Shortener play.

The strongest unconditional family is
\[
L(n)\ge
c_k\frac{n(\log\log n)^{k-1}}{\log n},
\qquad
c_k=2^{-k-2^{k-1}+1},
\]
for every fixed \(k\). The constants collapse doubly exponentially, so allowing \(k=k(n)\to\infty\) does not approach a positive density.

The fortress mechanism also cannot disprove \(o(n)\):

- Entry at cap \(H(n)\to\infty\) yields only
  \[
  \Omega(n/H(n)),
  \]
  which is still \(o(n)\).
- Fixed-cap robust entry from a sparse prefix is impossible.
- A construction that defeats the literal maximum-degree policy is not a game lower bound, because Shortener may adopt a different policy containing batch guards or fixed-density clearing sweeps.
- The explicit arithmetic multiple-cover schedules and the \(n=96N\) static construction do not prescribe an on-trajectory, arbitrary-reply-robust Prolonger strategy.

A genuine disproof would therefore need a positive-density mechanism outside the current fan hierarchy and outside growing-cap fortresses. In the language of the latest reductions, it would have to realize the full preparation–release–service packet chronology while preventing every possible Shortener response from producing a linear amount of direct deletion, exact play, or irreversible minimal-bank transfer.

## 5. Exact unresolved statement

The current obstruction can be stated without any endpoint ledger:

> Starting from an \(o(n)\)-move position with a linear second-shell nonminimal population, can Prolonger sustain a linear sequence of replies such that:
>
> - every prefix releases enough future minimal service roots to satisfy the prefix Hall identity;
> - every persistent high-incidence divisor is blocked before its causal deadline;
> - every released root has all off-branch coatoms prepared by distinct earlier replies;
> - the minimal-maximum-degree Shortener moves delete only the allowed bounded total \(E\);
> - all selected moves remain a primitive set?

No construction realizing this is known. No capacity theorem excluding it is known.

That is not a cosmetic gap. It is precisely the point at which:

- instantaneous capacities fail under refinement;
- fixed-\(Y\) capacities remain only linear;
- summable lifetime weights match rather than exceed linear demand;
- raw higher-moment witness sums overcount;
- static blocker schedules ignore greedy timing;
- endpoint accounting permits postponed-service laundering.

## Conclusion

The mathematically defensible conclusion is:

\[
\boxed{\text{The supplied results do not prove or disprove }L(n)=o(n).}
\]

The first unresolved concrete subproblem is already the trajectory-restricted second-shell capped-tail exclusion. Its present core is the nonadditive, preparation-sensitive packet-capacity problem. Even a resolution of that first obstruction would still need a uniform extension through every fixed dyadic shell, or a direct proof of aggregate-excess halving, before yielding the full statement.
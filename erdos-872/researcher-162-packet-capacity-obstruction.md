---
id: R162-packet-capacity-obstruction
type: research
date: 2026-07-15
intent: >
  Attempt a full unconditional proof or disproof of L(n) = o(n) for the
  divisibility antichain game on {2,...,n}, given complete established
  results on second-shell greedy structure, chronology-safe weighted
  ledgers, and packet preparation, and identify precisely where such a
  proof must close if it cannot be completed.
predecessors: []
prompt: erdos-872/prompts/researcher-R162-solution-attempt-full-compilation.md
action:
  kind: standalone
claim: >
  In the second-shell greedy phase, on a linear tail of T >= cn active
  Shortener turns, an upper-bound proof must supply a packet-capacity
  theorem showing that only T Prolonger replies cannot simultaneously
  satisfy the prefix Hall demand, the persistent-root demand, survivor
  deadlines, and the tri-causal preparation structure (preparation <
  release < service) for every root; no current ledger supplies this.
  The L^s first-death ledger, bounding total charge sum(d/x)^s over first
  deaths of surviving divisors by C_s times the move count, cannot close
  this: for fixed s>2 and eps>0, choosing Y so the prime tail sum over
  pi>Y of pi^{-s} is below eps makes every Y-rough root's coatom weight
  below eps, Y-rough integers have positive density rho_Y in every
  macroscopic dyadic range, so a linear root family has total L^s weight
  at most eps times its size, arbitrarily below capacity C_s*c*n — a
  general obstruction to any additive coatom ledger with summable prime
  weights. Unweighted coatom counts also fail: with k=floor(rho n),
  N=floor(n/2), blocker set P={N+1,...,N+k}, every d<=k divides some
  member of P; for Y=2n/(5k), every Y-rough root r in (n/3,2n/5] has
  every proper divisor below k and hence dividing some blocker in P; the
  resulting root family has size >> n/log(1/rho) against only rho*n
  blockers, and since 1/log(1/rho) >> rho for small rho, a linear reply
  family prepares a much larger linear root family. The packet
  obstruction is genuinely simultaneous: a reply p=3m, (m,30)=1, can at
  once discharge a survivor deadline, release a future service root, and
  release/prepare a persistent root, so no additive inequality bounding
  their sum by C times reply count holds with C strictly below the
  demand ratio forced by every tail; the needed statement must be
  chronological, preparation-history-sensitive, degree-evolution-
  sensitive, trajectory-restricted, and nonadditive. No disproof follows
  from this material: a lower bound needs one Prolonger strategy
  surviving every Shortener strategy (fixed-density sweeps, anticipatory
  batch blockers, prime-product guards, non-maximum-degree policies,
  policies attacking preparation infrastructure), and defeating only the
  maximum-degree policy shows policy sensitivity, not a lower bound.
  Logical status: the aggregate-excess halving statement implies
  L(n)=o(n), and FSC(J,eta) for every fixed J,eta implies L(n)=o(n); the
  first unresolved case FSC(2,eta) is exactly equivalent to excluding
  the time-ordered primitive multiple-cover schedule with its repaired
  causal deadlines; failure of FSC(2,eta) for the greedy policy alone
  would not disprove L(n)=o(n) since Shortener may have a different
  sublinear strategy. Neither L(n)=o(n) nor L(n)>=cn is established.
implications:
  - Any additive coatom ledger with summable prime weights (fixed exponent
    s>2) is provably insufficient to close the upper bound; only
    nonadditive, chronological, trajectory-restricted capacity arguments
    remain viable.
  - Unweighted coatom-count ledgers are also ruled out via an explicit
    interval-blocker construction (n/log(1/rho) root family against rho*n
    blockers).
  - The remaining open step localizes to the single dyadic case FSC(2,eta) -
    closing it either direction (chronological packet-capacity theorem, or
    an arbitrary-Shortener Prolonger construction) resolves that shell;
    only the full FSC family plus deep-shell size control resolves
    L(n)=o(n).
  - Confirms that defeating only the maximum-degree Shortener policy cannot
    establish a lower bound; any Omega(n) construction must survive
    arbitrary replies including batch/prime-product guards.
confidence_at_time: medium
strategy_dependence: greedy-policy-dependent
---

## Verdict

I do **not** have a valid unconditional proof or disproof of  
\[
L(n)=o(n).
\]

After attempting to combine the strongest supplied ingredients—first-failure localization, the second-shell normal form, causal deadlines, prefix Hall accounting, tri-causal preparation, and the chronology-safe \(L^{s}\) ledger—the argument still stops at the preparation-sensitive packet-capacity problem identified in the prompt.

Claiming a resolution from the stated results would require inserting an unproved assertion. Below is the precise obstruction, including a clean reason that the most natural remaining weighted-ledger argument cannot close the gap.

---

# 1. Where an upper-bound proof must close

Suppose the second-shell greedy phase has a linear tail of \(T\ge cn\) active Shortener turns from a sparse position \(B\), and let \(X\) be its final surviving target set.

After passing to the minimal-maximum-degree version of the policy, the established results give the following structure.

For all but \(o(n)\) service times \(t\), the greedy root \(g_t\) was not minimal at \(B\). It therefore has a unique release reply \(p_{\gamma(t)}\), with
\[
\gamma(t)<t.
\]
Moreover, for every prefix \(s\le T\),
\[
s
=
\#\{t\le s:g_t\text{ was minimal at }B\}
+
\sum_{j<s}|C_j(s)|,
\]
where \(C_j(s)\) consists of roots serviced by time \(s\) and released by reply \(p_j\). Hence
\[
\sum_{j<s}|C_j(s)|\ge s-o(n)
\tag{1}
\]
on every linear prefix.

There is also a linear family of persistent final roots. These roots remain legal through the interval, eventually support \(X\), and are never serviced during the tail. Thus the replies must create both:

1. essentially one future service root per turn, by (1);
2. a further linear persistent-root population.

For every released root \(r\), tri-causal preparation says that there is a prime \(q\mid r\) such that

- the release reply is divisible by the last legal coatom
  \[
  \lambda=\frac rq;
  \]
- for every other distinct prime \(\pi\mid r\), the coatom
  \[
  \frac r\pi
  \]
  was first blocked by a distinct, strictly earlier Prolonger reply.

Thus every noninitial root carries a causal structure
\[
\text{preparation}<\text{release}<\text{service}.
\tag{2}
\]

An upper proof therefore needs a theorem saying that a sequence of only \(T\) Prolonger replies cannot simultaneously satisfy:

- the prefix Hall demand (1);
- the persistent-root demand;
- all survivor deadlines;
- all the preparations in (2);
- the greedy degree ledger;
- primitiveness of the complete alternating history.

That theorem is not supplied by any of the current ledgers.

---

# 2. Why the \(L^{s}\) first-death ledger does not finish the proof

For \(s>2\), define the coatom weight of a root by
\[
W_s(r)=\sum_{\pi\mid r}\frac1{\pi^s},
\]
where the sum is over distinct prime divisors.

The chronology-safe first-death theorem gives a constant \(C_s\) such that, over any interval of \(m\) moves, the total charge
\[
\sum \left(\frac d x\right)^s
\]
assigned to first deaths of divisors \(d\mid x\), for targets \(x\in(n/4,n/2]\) surviving the interval, is at most
\[
C_s m.
\tag{3}
\]

For a coatom \(d=r/\pi\), its weight is precisely \(\pi^{-s}\). It is therefore tempting to sum the preparation demand of all released and persistent roots and contradict (3).

That fails for an unavoidable reason.

## Summable-weight barrier

Fix \(s>2\) and \(\varepsilon>0\). Choose \(Y\) so large that
\[
\sum_{\substack{\pi\ \mathrm{prime}\\ \pi>Y}}\frac1{\pi^s}<\varepsilon.
\tag{4}
\]

Every \(Y\)-rough integer \(r\)—one having no prime factor at most \(Y\)—then satisfies
\[
W_s(r)<\varepsilon.
\tag{5}
\]

For fixed \(Y\), the \(Y\)-rough integers have positive density in every fixed macroscopic interval \((\alpha n,\beta n]\). In particular, there is a constant \(\rho_Y>0\) such that
\[
\#\{r\in(\alpha n,\beta n]:r\text{ is }Y\text{-rough}\}
=
(\rho_Y+o(1))n.
\tag{6}
\]

Consequently, there are linear root families \(R\) for which
\[
\sum_{r\in R}W_s(r)
\le
\varepsilon |R|.
\tag{7}
\]

The linear-tail constant \(c\) in a hypothetical countertrajectory is not bounded below universally; a failure of sublinearity could occur with an arbitrarily small fixed \(c>0\). Taking \(Y\) sufficiently large relative to that density leaves enough \(Y\)-rough integers to supply all required roots, while making the total \(L^s\) demand in (7) arbitrarily small.

Meanwhile the ledger capacity in (3) is
\[
C_sT=C_scn.
\]
Thus no contradiction follows.

This is not merely a bad choice of exponent. It is a general obstruction to any additive coatom ledger with summable prime weights: a sufficiently rough positive-density family makes the total demand per root arbitrarily small.

---

# 3. Why replacing the weights by unweighted coatom counts also fails

One might instead count every distinct prime coatom with weight \(1\). Then a positive-density family has average coatom demand on the \(\log\log n\) scale.

But there is no bounded per-reply capacity for this unweighted demand.

Let
\[
k=\lfloor \rho n\rfloor,\qquad
N=\lfloor n/2\rfloor,
\]
where \(\rho>0\) is sufficiently small, and take the primitive interval blocker
\[
P=\{N+1,N+2,\dots,N+k\}.
\tag{8}
\]

Every \(d\le k\) divides at least one member of \(P\), because every block of \(k\) consecutive integers contains a multiple of \(d\).

Put
\[
Y=\frac{2n}{5k}.
\]
For a \(Y\)-rough integer
\[
r\in(n/3,2n/5],
\]
every proper divisor \(d<r\) satisfies
\[
d\le \frac r{p_{\min}(r)}
<
\frac{2n/5}{Y}
=
k.
\tag{9}
\]

Hence every proper divisor of \(r\), and in particular every prime coatom \(r/\pi\), divides some blocker in \(P\).

For \(\rho\) small enough, every \(a\in P\) lies strictly between \(r\) and \(2r\). Thus \(a\) is incomparable with \(r\). The roots themselves remain legal while all their proper divisors are blocked.

The resulting root family has size
\[
\gg \frac{n}{\log Y}
\asymp
\frac{n}{\log(1/\rho)},
\tag{10}
\]
while the blocker family has only
\[
|P|=\rho n
\tag{11}
\]
members.

For small \(\rho\),
\[
\frac{1}{\log(1/\rho)}\gg \rho.
\]
Thus a linear reply family can prepare a much larger linear root family, and each reply can own many coatom obligations.

This is exactly why an unweighted “one preparation, one unit of reply capacity” argument is false. The static linear-scale construction supplied in the record strengthens this obstruction further: primitiveness, survivor avoidance, all prefix deadlines, and postponed final minimality can all coexist.

What the interval construction does **not** supply is the greedy on-trajectory timing. That is the remaining load-bearing condition.

---

# 4. The packet obstruction is genuinely simultaneous

The obstruction cannot be removed by separately charging the three causal roles.

A reply can simultaneously:

- discharge a survivor deadline;
- release a future service root;
- release or prepare a persistent root.

The example in the record,
\[
p=3m,\qquad (m,30)=1,
\]
already realizes these roles in one packet. Therefore an inequality such as
\[
\#\text{deadline services}
+
\#\text{future releases}
+
\#\text{persistent releases}
\le
C\,\#\text{replies}
\]
is useless unless \(C\) is strictly smaller than the demand ratio forced by every possible tail.

No such strict constant exists pointwise. Large common-core packets and interval blockers show that the relevant statement would have to be:

- chronological rather than pointwise;
- sensitive to the entire preparation history;
- sensitive to the greedy degree evolution;
- trajectory-restricted;
- nonadditive, because additive first-death weights are defeated by rough roots.

That is precisely the preparation-sensitive packet-capacity theorem currently missing.

---

# 5. Why the same material does not give a disproof

The static and chronological packet constructions do not establish
\[
L(n)\ge cn.
\]

A lower bound for the game must give one Prolonger strategy that survives **every** Shortener strategy. In particular, it must survive:

- fixed-density clearing sweeps;
- anticipatory batch blockers;
- prime-product guards;
- policies that do not follow maximum degree;
- policies that attack the preparation infrastructure rather than the current reservoir.

A history defeating the literal maximum-degree policy establishes only policy sensitivity. The fixed-cap entry theorem already rules out the simplest attempt to turn a capped reservoir into a universal lower-bound strategy.

Likewise, an off-policy primitive schedule satisfying all deadlines does not show that Prolonger can force the schedule on the realized game tree.

Thus the lower route still lacks an arbitrary-reply-robust on-trajectory construction.

---

# 6. Exact logical status

The supplied facts establish the following implications:

\[
\mathrm{AE}^{\dagger}
\Longrightarrow
L(n)=o(n),
\]
and
\[
\bigl[\mathrm{FSC}(J,\eta)
\text{ for every fixed }J,\eta\bigr]
\Longrightarrow
L(n)=o(n).
\]

The first unresolved dyadic case is \(\mathrm{FSC}(2,\eta)\), and that statement is exactly equivalent to excluding the time-ordered primitive multiple-cover schedule with its causal deadlines.

The tri-causal refinement shows what any attempted exclusion must additionally control, but it does not itself exclude the schedule.

Conversely, failure of \(\mathrm{FSC}(2,\eta)\) for the greedy policy would not disprove \(L(n)=o(n)\), because Shortener may have a different sublinear strategy.

Therefore neither conclusion follows:

\[
\boxed{\text{No unconditional proof of }L(n)=o(n)\text{ has been obtained here.}}
\]

\[
\boxed{\text{No Prolonger strategy forcing }L(n)\ge cn\text{ has been obtained either.}}
\]

The exact unresolved assertion is not another static incidence estimate. It is a nonadditive, preparation-sensitive, chronological capacity theorem for packets on the realized trajectory—or an arbitrary-Shortener Prolonger construction showing that such packets can be maintained at linear scale.
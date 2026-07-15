---
id: R168-reframe-reconfirms-invariant-gap
type: research
date: 2026-07-15
intent: >
  With the capacity-inequality decomposition explicitly marked closed and its
  machinery offered only as reusable tools, attempt a fresh unconditional
  proof or disproof of L(n)=o(n) for the divisibility-antichain game via a
  global chronology-respecting argument or any other route.
predecessors: []
prompt: erdos-872/prompts/researcher-R168-solution-attempt-full-compilation.md
action:
  kind: standalone
claim: >
  No unconditional proof or disproof of L(n)=o(n) is obtained; even when
  invited to leave the capacity-inequality frame, the analysis re-converges
  to the same invariant chronological gap by six independent routes. (1)
  Sparse-rank compression (forcing legal-poset height below g(n) in n/g(n)
  moves) plus fixed-depth clearing does not finish: fixed-depth o(n) clearing
  holds for each fixed J but the true minimal-layer mass profile is
  (1-o(1))n once J grows to g(n), so qualitative fixed-prefix control does
  not transfer to diagonal control. (2) The chronology-sensitive second-shell
  degree estimate Delta_Q >>_eta loglog(n/t) is integrable at the sparse
  endpoint (integral of loglog(1/s) vanishes), so its accumulated deletion
  over a linear-but-vanishing prefix is o(n). (3) A hypothetical linear
  second-shell tail supplies exactly the four-layer causal packet system
  (shadow < coatom < release < service) with prefix Hall identities and
  distinct-earlier-reply coatom preparation, but no scalar or additive
  charge bounds it. (4) The chronology-safe L^s first-death ledger gives
  Theta(n) capacity over a linear interval, exactly matching the Theta(n)
  Hall/persistent-root demand — no overload. (5) The multiscale d^{-s}
  hazard strategy stops at the same shallow-cone point (the required cone
  sparsity does not follow from cumulative minimal-root sparsity, whose
  worst-case modulus mu_n(alpha) ~ 1/log(1/alpha) permits a linear cone).
  (6) The lower-bound machinery does not disprove the conjecture: the rank-k
  fan family gives c_k n(loglog n)^{k-1}/log n with doubly-exponentially
  decaying c_k, growing-cap fortress entry gives only n/H(n)=o(n), and
  single-policy defeats are not game lower bounds. The exact unresolved
  statement is unchanged from prior rounds: whether a linear active
  second-shell interval can be realized on-trajectory against the
  maximum-degree policy with all four causal layers satisfied and bounded
  total deletion — no realizing construction and no excluding theorem is
  known on either side. No new theorem or construction is produced; the round
  is a re-synthesis confirming, from a deliberately non-capacity starting
  point, that the invariant gap is reached by every available route.
implications:
  - Two post-reframe free-roams (R166, R168) reconfirm the identical
    chronological gap with no new content — strong evidence that
    within-family (single-model) upper-bound exploration is saturated on this
    problem; the productive next moves are cross-family verification or the
    lower-bound/disproof direction attacked in its own right.
  - Every catalogued upper-bound route (rank sweep, fixed-depth clearing,
    integrable degree estimates, first-death ledger, hazard/shallow-cone,
    capacity inequalities) is now recorded as reaching the same gap, so
    future dispatches must introduce a genuinely new object rather than
    recombine these.
  - The gap has been invariant in strength since the (AE-dagger) formulation
    (~R130): roughly 35 rounds of real machinery accumulation without moving
    it, which is itself the signal that a different model family or a
    different problem angle is required.
confidence_at_time: medium
strategy_dependence: independent
---

# Verdict

I do **not** have a valid unconditional proof or disproof of  
\[
L(n)=o(n).
\]

More strongly, the proposed routes in the record do not presently compose into one. The obstruction is not a missing estimate that can be supplied by choosing parameters more slowly: it is the genuinely chronological second-shell mechanism already isolated in the prompt. Presenting either conclusion as established would require silently assuming precisely the theorem that remains unproved.

Below is the audit of the strongest plausible route from the supplied facts.

---

## 1. Sparse rank compression does not finish the proof

Let  
\[
\Omega_g(x)=\Omega(x)\pmod g.
\]
The sparse-rank sweep gives, in at most \(n/g\) Shortener moves, a position at which every legal pair \(d\mid x\) satisfies
\[
\Omega(x)-\Omega(d)<g.
\]
Thus the remaining legal divisibility poset has height at most \(g\).

One might now try to invoke the established theorem that every fixed number \(J\) of successive minimal-legal layers can be cleared in \(o(n)\) moves and then choose \(J=g(n)\to\infty\) slowly.

That diagonalization is invalid. The numerical profile
\[
|C_j(n)|=\left\lfloor \frac{n}{g(n)}\right\rfloor ,
\qquad 0\le j<g(n),
\]
has the properties
\[
\sum_{j<J}|C_j(n)|
   \le \frac{Jn}{g(n)}
   =o(n)
\]
for every fixed \(J\), while
\[
\sum_{j<g(n)}|C_j(n)|
   =(1-o(1))n.
\]
It also has height \(g(n)\). Therefore:

\[
\boxed{\text{fixed-depth }o(n)\text{ clearing}
\;+\;\text{height }g(n)
\not\Longrightarrow o(n)\text{ total clearing}.}
\]

Randomizing the stopping depth does not help. For example, if \(J\) is uniform on \(\{0,\ldots ,g-1\}\), the expected mass in the first \(J\) layers of the profile above is
\[
\frac{1}{g}\sum_{J=0}^{g-1}\frac{Jn}{g}
  =\left(\frac12+o(1)\right)n.
\]
So the randomized multiscale-stopping idea from the preceding attempt also fails without an additional theorem controlling the **joint** layer profile.

This profile is only an abstract obstruction, not a game construction. Its role is to show that the accepted rank and fixed-layer facts do not prove the conjecture.

---

## 2. The chronology-sensitive degree estimate is still integrable

At a sparse position of size \(t=o(n)\), the second-shell degree theorem gives
\[
\Delta_t\gg_\eta \log\log\frac nt .
\]
Even granting this lower bound on every Shortener turn, its accumulated guaranteed progress during an \(\alpha n\)-move prefix is only
\[
\sum_{1\le t\le \alpha n}
  \log\log\frac nt
 =
 n\int_0^\alpha
    \log\log\frac1s\,ds+o(n).
\]
For sufficiently small \(\alpha\),
\[
\int_0^\alpha\log\log\frac1s\,ds
 \le 2\alpha\log\log\frac1\alpha,
\]
and hence
\[
n\int_0^\alpha\log\log\frac1s\,ds=o(n)
\qquad(\alpha\downarrow0).
\]

Thus this estimate cannot force a positive fraction of a shell to disappear in an \(o(n)\)-move window. Any proof that merely sums the available pointwise degree bound is necessarily insufficient.

---

## 3. What a hypothetical linear second-shell tail really supplies

Suppose the second-shell greedy phase has a bad tail of length
\[
T\ge cn
\]
from a sparse entry position \(B\), and let \(X\) be the final survivor set.

The accepted causal results then give all of the following.

1. **Causal deadline.**  
   If \(d\) is legal at \(B\) and
   \[
   k_X(d)>\frac{E}{s},
   \qquad
   E=|Q_1(B)\setminus X|,
   \]
   then a Prolonger reply among the first \(s-1\) replies must be divisible by \(d\).

2. **Persistent-root mass.**  
   There are linearly many distinct final minimal roots that were already legal at \(B\) and remain legal throughout the tail.

3. **Prefix Hall equality.**  
   Apart from the \(o(n)\) roots minimal at entry, each service root has a unique earlier release reply, and for every prefix the number of services equals the number of released future roots available to that prefix.

4. **Tri-causal preparation.**  
   A service root
   \[
   r=\lambda q
   \]
   released from its last legal ancestor \(\lambda\) is a prime lift. Every off-branch prime coatom \(r/\pi\), \(\pi\ne q\), was first blocked by a distinct, strictly earlier Prolonger reply.

Consequently, a bad tail is not an arbitrary scalar degree sequence. It is a time-ordered system
\[
\text{preparation}<\text{release}<\text{service}
\]
in which the same replies may simultaneously:

- discharge survivor deadlines;
- prepare several future roots;
- release a present service root;
- prepare persistent roots.

The explicit packet examples in the record show that one reply may perform all three relevant kinds of service at once.

---

## 4. Why the established lifetime ledger still does not contradict the tail

For fixed \(s>2\), the chronology-safe first-death ledger gives
\[
\sum_{\text{blocked }(x,d)}
 \left(\frac d x\right)^s
 \le C_sT.
\]
When \(T\asymp n\), the right-hand side is \(\Theta(n)\).

The Hall-forced releases and persistent-root preparations also have total \(L^s\)-demand only \(\Theta(n)\). Thus this ledger gives
\[
\text{demand}=\Theta(n),
\qquad
\text{capacity}=\Theta(n),
\]
not an overload.

Choosing different summable prime weights cannot repair this. For every large fixed \(Y\), the \(Y\)-rough integers have positive density in a macroscopic interval, while their total summable coatom weight can be made arbitrarily small. Thus no additive summable ledger can force the required contradiction.

Using unsummable small-prime weight produces demand on the scale
\[
n\Lambda_Y,
\qquad
\Lambda_Y=\sum_{p\le Y}\frac1p,
\]
but the record already establishes that the corresponding normalized capacity assertion is equivalent to the desired second-shell clearing statement after a slow-cutoff diagonalization. It is therefore not an independent lemma from which clearing follows.

---

## 5. Why the multiscale hazard strategy also stops at the same point

A natural randomized policy mixes root scales. At a dyadic root scale
\[
m\asymp \frac nH,
\]
one can assign probability mass \(\pi_H\) to that scale, giving an individual root probability approximately
\[
\frac{H\pi_H}{n}.
\]
A target supported by such a root therefore needs roughly
\[
\frac{n}{H\pi_H}
\]
turns for constant killing probability.

For one fixed scale this is useful. The obstruction is simultaneous control over all scales. Since
\[
\sum_H\pi_H\le1,
\]
there are scales along which \(\pi_H\) is arbitrarily small. To overcome this, one would need a theorem saying that the total target mass carried by roots at those poorly weighted scales is negligible.

Cumulative minimal-root sparsity does not say this. It controls
\[
\left|\bigcup_{t<T}\mathcal M(A_t)\right|=o(n),
\]
but not its cone-weighted mass
\[
\sum_{m\text{ ever minimal}}\frac nm.
\]
The established counter-profile
\[
\frac nG\text{ roots at scale }\frac nG,
\qquad
G\text{ quotients per root},
\]
has a sparse root set and linear cone mass. This is exactly why the fixed-\(s\) hazard theorem needs the additional shallow-cone hypothesis.

Thus the randomized multiscale strategy does not presently provide an unconditional proof.

---

## 6. The lower-bound side does not disprove the conjecture

None of the established lower mechanisms gives positive density.

A growing-cap fortress at cap \(H(n)\to\infty\) yields only
\[
L(n)\ge \frac{cn}{H(n)},
\]
which remains \(o(n)\). To obtain \(\Omega(n)\) from this mechanism one needs either:

- fixed \(H=O(1)\), whose robust entry is ruled out; or
- a new amplification theorem converting the \(n/H\) guaranteed moves into \(cn\).

No such amplification is established.

Likewise, the rank-\(k\) hierarchy gives
\[
L(n)\ge
c_k\,\frac{n(\log\log n)^{k-1}}{\log n},
\qquad
c_k=2^{-k-2^{k-1}+1}.
\]
The doubly exponential decay of \(c_k\) dominates every admissible choice \(k=k(n)\to\infty\); the resulting bound remains \(o(n)\).

Finally, any genuine lower bound must survive **arbitrary** Shortener replies. A construction that only defeats maximum-degree, smallest-prime, or another named policy is not a game lower bound.

---

## 7. Exact unresolved statement

The missing assertion can be stated without a scalar capacity inequality.

> **Chronological trichotomy needed for an upper proof.**  
> In every sparse realized second-shell interval carrying a positive-density nonminimal population, within \(o(n)\) actual moves a fixed positive fraction of that population must be:
> \[
> \text{directly deleted},\qquad
> \text{played},\qquad\text{or}\qquad
> \text{irreversibly transferred to the minimal bank}.
> \]
> The assertion must hold against the joint preparation–release–deadline packet system of the actual Prolonger replies.

This is equivalent in strength to excluding the time-ordered primitive multiple-cover schedule described in the record. None of the degree, static-completion, fractional-cover, fixed-depth, \(L^s\)-ledger, or frozen-repair results proves this trichotomy.

A disproof, conversely, would require an actual Prolonger strategy realizing that schedule on the game trajectory against arbitrary Shortener play. The existing linear-scale static construction does not supply the greedy timing or arbitrary-policy robustness.

---

# Conclusion

The supplied results narrow the problem to a very precise chronological obstruction, but they do not resolve it. The sparse-rank and randomized multiscale ideas do not bridge the gap; they fail respectively on the growing-layer profile and on uncontrolled cone-weighted root mass. The lower constructions remain sublinear or policy-specific.

Therefore the mathematically defensible conclusion is:

\[
\boxed{\text{No unconditional proof or disproof of }L(n)=o(n)
\text{ has been obtained here.}}
\]

Any claimed complete proof from the listed ingredients must contain, explicitly or implicitly, a new theorem excluding the preparation-sensitive time-ordered multiple-cover system; any claimed disproof must construct that system as an arbitrary-reply-robust Prolonger strategy.
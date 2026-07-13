---
id: R148-second-shell-cumulative-sparsity-still-open
type: research
date: 2026-07-12
intent: >
  Determine whether the length of the divisibility antichain game on
  {2,...,n} satisfies L(n) = o(n), by attempting to close the second-shell
  case of finite-shell clearing and to upgrade the known static-completion
  bound on minimal legal elements to a cumulative-over-time bound.
predecessors: []
prompt: erdos-872/prompts/researcher-R148-solution-attempt-full-compilation.md
action:
  kind: standalone
claim: >
  Two new structural lemmas about primitive sets are proved. First
  (canonical-lift blocker lemma): if x in (n/4, n/2] is legal but its
  canonical lift 2x is illegal, every blocking move a comparable to 2x has
  the form a = 2^(v+1) e where x = 2^v m (m odd) and e is a proper divisor
  of m; this constrains blockers but does not bound how many targets one
  blocker can kill, since the single move a=4 blocks 2x for every x=2m with
  m odd in (n/8, n/4], a set of size Theta(n). Second (coatom ownership /
  cumulative sparsity): if x is minimal legal, then for each distinct prime
  divisor p of x the element x/p must be blocked by a distinct chosen move
  (at least omega(x) distinct blockers are required), and consequently,
  along any game prefix using t = o(n) moves, only o(n) integers in any
  fixed interval (alpha n, beta n] can ever become minimal legal at any
  point during that prefix -- a cumulative-in-time strengthening of the
  known single-snapshot static-completion bound. Neither lemma closes the
  gap to L(n) = o(n): targets can avoid ever becoming minimal legal by
  repeatedly switching between distinct incomparable legal divisors after
  each is individually blocked, and this switching mechanism is controlled
  by neither lemma. L(n) = o(n) is therefore neither proved nor disproved;
  the bounds c_delta n(log log n)^2/log n <= L(n) <= (0.1897123371+o(1)) n
  stand unchanged.
implications:
  - The single-snapshot static-completion bound (|P|=o(n) implies o(n)
    minimal legal elements) is extended to a cumulative-over-a-sparse-prefix
    statement for any fixed interval shell -- strictly stronger, but still
    insufficient to force L(n)=o(n).
  - The canonical-lift approach to the second-shell finite-shell-clearing
    case is confirmed unable to yield a bounded-multiplicity charging
    argument on its own, since one move can block Theta(n) canonical lifts
    at once.
  - The remaining gap is isolated to targets that survive by divisor
    refinement (switching to a new incomparable legal divisor after the old
    one is blocked) rather than by becoming minimal legal, reinforcing that
    the open direct-ancestor bounded lifetime ownership question is the
    correct remaining obstruction.
  - Neither the upper-bound nor lower-bound direction gained unconditional
    progress; known lower-bound mechanisms (fixed-cap fortress entry,
    rank-k fan hierarchy with doubly-exponentially collapsing constants
    c_k) are reconfirmed insufficient to force Omega(n).
confidence_at_time: medium
strategy_dependence: independent
---

## Verdict

After carrying the two most promising attacks through their bookkeeping, **no valid unconditional proof or disproof survives**. The mathematically correct conclusion from the supplied record is

\[
\boxed{\text{The assertion }L(n)=o(n)\text{ remains unresolved.}}
\]

The known estimates

\[
c_\delta\,\frac{n(\log\log n)^2}{\log n}
   \le L(n)
   \le (0.1897123371+o(1))n
\]

are compatible both with \(L(n)=o(n)\) and with \(\limsup L(n)/n>0\). 

This is not just an appeal to the word “open.” I tried to close the first unresolved finite-shell case. The attack produces two valid structural lemmas, including a cumulative fixed-shell result that appears stronger than the ordinary static-completion statement, but it still encounters precisely the direct-ancestor/shared-core obstruction identified in the record.

## 1. A precise second-shell blocker lemma

Let \(A\) be the current primitive set. Suppose

\[
x\in S_1=\left(\frac n4,\frac n2\right]
\]

is legal, but \(2x\in(n/2,n]\) is illegal. Choose \(a\in A\) comparable with \(2x\).

### Lemma 1

Writing \(x=2^v m\), with \(m\) odd, one necessarily has

\[
a=2^{v+1}e
\qquad\text{for some }e\mid m,\quad e<m.
\]

### Proof

Because \(x\) is legal, no member of \(A\) is comparable with \(x\).

If \(2x\mid a\), then \(x\mid a\), contradicting legality of \(x\). Hence \(a\mid2x\). But \(a\nmid x\), again because \(x\) is legal.

Now

\[
2x=2^{v+1}m.
\]

A divisor of \(2^{v+1}m\) which does not divide \(2^vm\) must contain the full \(2^{v+1}\)-part. Thus \(a=2^{v+1}e\) for some \(e\mid m\). If \(e=m\), then \(a=2x\), hence \(x\mid a\), again impossible. Therefore \(e<m\). ∎

This is a genuine constraint: every external blocker of the canonical lift \(2x\) replaces an odd part of \(x\) by one extra factor of \(2\).

It does **not**, however, give bounded multiplicity. For example, the single chosen move

\[
a=4
\]

blocks \(2x\) for every

\[
x=2m,\qquad m\text{ odd},\qquad \frac n8<m\le\frac n4.
\]

All these \(x\) are incomparable with \(4\), and there are \(\Theta(n)\) of them. Thus the canonical-lift map cannot by itself charge external blocking to \(o(n)\) targets. This is exactly the phenomenon making \(S_1\) different from the top shell; the supplied record identifies the second-shell phase as the first unresolved FSC case. 

## 2. Coatom ownership

There is a stronger ownership fact once a number actually becomes minimal legal.

### Lemma 2

Let \(x\) be legal and minimal legal relative to \(A\). For every distinct prime divisor \(p\mid x\), let

\[
d_p=\frac{x}{p}.
\]

Then the divisors \(d_p\), as \(p\) ranges over the distinct prime factors of \(x\), require **distinct** blocking moves from \(A\). Consequently, at least \(\omega(x)\) distinct chosen moves are needed to make \(x\) minimal while preserving its legality.

### Proof

Since \(x\) is minimal legal, every \(d_p\) is illegal. Choose \(a_p\in A\) comparable with \(d_p\).

The relation \(a_p\mid d_p\) is impossible, since then

\[
a_p\mid d_p\mid x,
\]

which would make \(x\) illegal. Therefore

\[
d_p\mid a_p.
\]

Suppose the same \(a\in A\) blocked \(d_p\) and \(d_q\) for distinct primes \(p,q\mid x\). Then

\[
\operatorname{lcm}\!\left(\frac{x}{p},\frac{x}{q}\right)=x
\]

divides \(a\). Hence \(x\mid a\), again contradicting legality of \(x\). Thus the blockers are distinct. ∎

This yields a useful cumulative strengthening.

### Corollary 3: cumulative fixed-shell minima are sparse

Fix \(0<\alpha<\beta\le1\), and consider the shell

\[
I_n=(\alpha n,\beta n].
\]

During any prefix containing \(t=o(n)\) chosen moves, only \(o(n)\) distinct members of \(I_n\) can ever become minimal legal.

### Proof

Fix a constant \(Y\). Split the integers that become minimal into two classes.

First, the \(Y\)-rough integers, having no prime divisor at most \(Y\), number

\[
O\!\left(n\prod_{p\le Y}\left(1-\frac1p\right)\right)
 =O\!\left(\frac n{\log Y}\right).
\]

Now let \(x\in I_n\) have a prime divisor \(p\le Y\), and suppose \(x\) becomes minimal while legal. By Lemma 2, \(d=x/p\) is blocked by some chosen \(a\) satisfying \(d\mid a\). Write

\[
a=dq=\frac{x}{p}q.
\]

Since \(d\ge\alpha n/Y\) and \(a\le n\),

\[
q\le\frac{Y}{\alpha}.
\]

For a fixed chosen move \(a\), the pair \((p,q)\) determines

\[
x=\frac{ap}{q}.
\]

There are at most

\[
\pi(Y)\left\lfloor\frac{Y}{\alpha}\right\rfloor
   =O_\alpha(Y^2)
\]

such pairs. Hence the number of non-\(Y\)-rough integers in \(I_n\) that ever become minimal is at most

\[
O_\alpha(Y^2t).
\]

Altogether,

\[
\#\{x\in I_n:x\text{ ever becomes minimal}\}
 \le O\!\left(\frac n{\log Y}\right)+O_\alpha(Y^2t).
\]

Given \(\varepsilon>0\), first choose fixed \(Y\) sufficiently large that the first term is below \(\varepsilon n\), and then use \(t=o(n)\) to make the second term below \(\varepsilon n\). This proves the claim. ∎

So, during a sparse prefix, **even cumulative transfers into the minimal layer of any fixed dyadic shell are \(o(n)\)**. This is stronger than merely saying the active minimal layer at a single snapshot is \(o(n)\).

## 3. Why this still does not prove \(L(n)=o(n)\)

The missing step is not the control of targets that become minimal. It is the control of targets that remain nonminimal by repeatedly switching among incomparable legal divisors.

If a legal divisor \(d\mid x\) is killed by an upward blocker \(a=dq\), the target \(x=dr\) may survive whenever \(q\) and \(r\) are incomparable. It may then possess a different legal divisor \(d'\mid x\), incomparable with \(d\). A single shared-core blocker can cause this replacement simultaneously for a very large family of targets. None of those targets has yet entered the cumulative-minimum bank controlled by Corollary 3.

Thus a long bad trajectory can, in principle, have:

\[
\text{few direct deletions}
\quad+\quad
\text{few transfers to minimality}
\quad+\quad
\text{many divisor refinements}.
\]

To rule that out, one needs a lifetime ownership bound saying that an earlier blocker cannot repeatedly erase large families of future repair faces without paying proportional new move-debt. The record calls this the **direct-ancestor bounded lifetime ownership** problem and states that it remains open. 

The two tempting shortcuts do not repair it:

1. **Static completion does not self-bootstrap.** The interval-blocker construction permits a completion modulus on the order of \(1/\log(1/\alpha)\), much larger than the prefix density \(\alpha\). Therefore iterating “the current minimal layer is \(o(n)\)” can reach a nonsparse scale before enough targets have been removed. 

2. **Pointwise degree divergence does not give accumulated area.** At a prefix of size \(n/H\), a guaranteed degree only on the \(\log\log H\) scale yields total certified deletion

\[
\frac nH\,O(\log\log H)=o(n),
\]

so it cannot by itself clear a positive-density shell. This is explicitly one of the ruled-out arguments in the supplied record. 

## 4. The lower-bound direction also remains incomplete

A disproof would require a strategy forcing \(\Omega(n)\) moves. The available fortresses give only

\[
\Omega\!\left(\frac nH\right)
\]

when their degree cap is \(H\to\infty\). Keeping \(H\) fixed would give a linear lower bound, but the fixed-cap entry theorem says Shortener can prevent a positive-density upper reservoir from being robustly entered at such a cap. Meanwhile, the fixed-rank fan hierarchy loses a doubly exponentially decaying constant \(c_k\), so letting the rank grow cannot produce linearity. 

Therefore neither known lower mechanism can disprove sublinearity.

## Final conclusion

The strongest unconditional conclusion justified here is:

\[
c_\delta\frac{n(\log\log n)^2}{\log n}
\le L(n)
\le(0.1897123371+o(1))n,
\]

together with the two lemmas above. They do not decide whether \(L(n)/n\to0\).

A proof of \(L(n)=o(n)\) would still need, at minimum, a valid second-shell clearing theorem or an equivalent online-area/lifetime-ownership argument. A disproof would need a new positive-density mechanism avoiding both the fixed-cap entry obstruction and the collapsing-rank constants. Providing either conclusion without such an argument would be a fabricated proof rather than an unconditional settlement.

[Uploaded problem record](sandbox:/mnt/data/Pasted%20text(184).txt)
---
id: R18-pro-matching-sublinear-reduction
type: research
date: 2026-04-19
intent: >
  Attempt to prove an unconditional sublinear upper bound on L(n), or reduce
  it to a minimal certificate condition that Shortener must satisfy.
predecessors: []
prompt: erdos-872/prompts/round18-matching-T2-upper-bound.md
action:
  kind: standalone
claim: >
  No unconditional sublinear bound established; best unconditional remains
  L(n) <= 0.18969n + o(n). Certificate Reduction Lemma established: for any
  certificate C_n, after C_n is exhausted the residual R(A_0) bounds
  remaining moves. Sublinear holds iff |C_n| + max_{A in reach} |R(A)| = o(n).
---

# Round 18 Pro #2 — matching sublinear not proved; certificate reduction lemma established

I worked this through under your no-search constraint. I do **not** have a rigorous unconditional sublinear upper bound to report. The tightest unconditional upper bound I can honestly stand behind from the material supplied remains the existing linear one, (L(n)\le 0.18969,n+o(n)). I can, however, give a clean reduction that isolates exactly what a sublinear proof would need, and I can rule out several tempting “almost proofs” that would otherwise look convincing.

The most useful rigorous takeaway I can establish is this certificate lemma.

Let (C_n\subseteq{2,\dots,n}). Suppose Shortener uses the strategy:

> While some element of (C_n) is legal, play a legal element of (C_n).
> Once no element of (C_n) is legal, switch to any strategy.

Let (A_0) be the antichain at the first time no element of (C_n) is legal, and let

[
R(A_0)={x\le n:x\text{ is incomparable with every }a\in A_0}.
]

Then

[
L(n)\le 2|C_n|+1+
\sup_{\substack{A\text{ antichain}\ C_n\subseteq \operatorname{Comp}(A)\ |A|\le 2|C_n|+1}}
w(R(A)),
]

where (w(R)) is the maximum size of an antichain inside (R), and (\operatorname{Comp}(A)) is the set of all integers comparable with some element of (A).

So a sublinear upper bound would follow from finding (C_n=o(n)) such that every antichain of size (O(|C_n|)) which makes all of (C_n) illegal leaves only (o(n)) residual width.

That is the right abstraction: it separates the game dynamics from the static residual-width problem. Unfortunately, none of the natural (C_n)’s I can prove strong enough.

For example, (C_n={\text{primes}\le n}) is not enough at the static level. Consider

[
A={2p:p\le n/2,\ p\text{ odd prime}}\cup{p:n/2<p\le n,\ p\text{ prime}}.
]

This is an antichain, and every prime is comparable with some element of (A). But the residual still contains every odd composite in ((n/2,n]), because such an (x) is odd, composite, larger than (n/2), and is incomparable with every (2p) and every prime (>n/2). Hence

[
w(R(A))\ge #{x\in(n/2,n]:x\text{ odd composite}}
=\frac n4-o(n).
]

So “Shortener plays legal primes until none remain” cannot be certified by a simple domination argument.

The next natural candidate is

[
C_{n,h}={m\le n:\Omega(m)\le h}.
]

For (h=o(\log\log n)), Landau’s estimate gives

[
|C_{n,h}|
\sim
\frac{n}{\log n}
\sum_{j\le h}\frac{(\log\log n)^{j-1}}{(j-1)!},
]

which is (n/(\log n)^{1-o(1)}) for the slow choices of (h) in your lower-bound construction. This is exactly the right size scale. The missing statement would be something like:

[
\sup_{\substack{A\text{ antichain}\ C_{n,h}\subseteq \operatorname{Comp}(A)\ |A|\le O(|C_{n,h}|)}}
w(R(A))
\le
\frac{n}{(\log n)^{1-o(1)}}.
]

If that lemma were true for (h=\lfloor \log_2\log\log\log n\rfloor), then the certificate lemma would give

[
L(n)\le \frac{n}{(\log n)^{1-o(1)}},
]

matching the slow-growth lower scale. But I cannot prove that residual-width lemma. It is precisely where the known obstacles bite: a Prolonger move can kill many low-(\Omega) certificates at once, and the remaining legal integers can be supported on cross-products of the killed certificates. A naive divisor-shadow or Bonferroni estimate overcounts by a factor large enough to lose sublinearity.

The strongest honest conclusion I can give is therefore:

[
\boxed{\text{I cannot establish an unconditional sublinear upper bound from the present reasoning.}}
]

What I *can* establish rigorously is the reduction above. In particular, the problem is equivalent, for this class of Shortener strategies, to finding a sublinear certificate family (C_n) with sublinear robust residual width. The family (C_{n,h}={\Omega\le h}) is the only candidate I see that has the right cardinality to match the known lower scale, but proving its residual-width bound remains the unresolved core.

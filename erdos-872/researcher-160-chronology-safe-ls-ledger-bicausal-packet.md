---
id: R160-chronology-safe-ls-ledger-bicausal-packet
type: research
date: 2026-07-15
intent: >
  Attempt a full unconditional proof or disproof of L(n)=o(n) for the
  primitive-set divisibility game, building a chronology-safe lifetime
  capacity ledger for direct-ancestor divisor release and testing whether
  it forces a reply-capacity overload.
predecessors: []
prompt: erdos-872/prompts/researcher-R160-solution-attempt-full-compilation.md
action:
  kind: standalone
claim: >
  (1) Rigid coatom-release lemma: if r is legal and nonminimal immediately
  before move p, and after p is played r remains legal and becomes minimal
  legal, then there is a unique prime q | r such that the coatom
  lambda = r/q was legal immediately before p, and lambda | p.
  (2) Chronology-safe L^s first-death ledger: fix X subset (n/4, n/2] legal
  throughout an interval; for every pair (x,d) with x in X, d | x, d < x,
  charge (x,d) to the first move a that makes d illegal. For every fixed
  s>2 there is a constant C_s, independent of n, the history, and X, such
  that every actual move receives total charge at most C_s under weight
  w(x,d) = (d/x)^s; consequently over any interval with m actual moves,
  sum over (x,d) with x in X, d | x, d < x, d first dying in the interval,
  of (d/x)^s <= C_s*m.
  (3) For a family R of newly minimal roots in [alpha*n, n/4] (alpha>0
  fixed) each with a distinct witness x_r in X, r | x_r, and fixed K:
  #{r in R : P^-(r) <= K} <= C_{s,alpha} K^s m, and since K-rough
  exceptional roots in a fixed linear interval number O_alpha(n/log K),
  |R| <= C_{s,alpha} K^s m + O_alpha(n/log K); for m = o(n) this gives
  cumulative fixed-shell sparsity, but for m ~ n it only gives |R| = O(n),
  no stronger than existing Hall-release/persistent-root bounds.
  (4) Local bi-causal packet: for m coprime to 30, setting r_future = 2m,
  r_persistent = 5m, p = 3m, y = 22m, x = 35m (after rescaling into the
  second shell with 2m,3m,5m below n/4), if m is legal before p is played
  and every other proper divisor needed to make 2m and 5m minimal has
  already been blocked, then playing p = 3m simultaneously (i) first-blocks
  the survivor-incident divisor m | 35m, (ii) releases 2m as a possible
  future greedy root killing 22m, and (iii) releases 5m as a possible
  persistent root of 35m — so no pointwise inequality of the form "number
  of causal services performed by one move <= 1 + o(1)" can hold, even
  locally.
  (5) Consequently the ledger from (2) does not prove L(n)=o(n): over
  T = cn replies its bound is C_s*T = Theta(n), matching rather than
  contradicting the combined Theta(n) demand from Hall-forced future-root
  release and linear persistent-root formation, because the packet in (4)
  shows a single reply can discharge multiple required causal services at
  once using shared preparation.
implications:
  - The direct-ancestor divisor-release channel now has a genuine
    chronology-safe lifetime bound (the L^s ledger), closing the earlier gap
    where only invalid instantaneous-to-lifetime promotions or atomic-ledger
    arguments (which excluded direct ancestors) were available.
  - The ledger's total capacity over any linear-length interval is provably
    Theta(n), matching rather than exceeding the demand from future-root
    release plus persistent-root formation, so this specific route cannot
    yield an unconditional linear lower bound on Prolonger service demand
    without a further preparation-sensitive joint inequality.
  - The bi-causal packet construction is a genuine obstruction to any
    pointwise "one reply, one obligation" capacity theorem, meaning any
    future closing argument must amortize over the preparation history of
    such multi-service packets rather than charge services move-by-move.
  - The open gap is now sharply localized to a single missing object - a
    joint, preparation-sensitive packet-capacity theorem bounding
    simultaneous deadline discharge, future-root release, and
    persistent-root creation against arbitrary Shortener replies, or an
    explicit on-trajectory Prolonger construction refuting it.
confidence_at_time: medium
strategy_dependence: independent
---

## Verdict

I do **not** obtain a valid unconditional proof or disproof of  
\[
L(n)=o(n).
\]

The supplied results reduce the problem to a genuine chronological obstruction, and the natural new capacity estimate I can prove below is not strong enough to resolve it. In particular, it yields a true lifetime ledger, rather than another invalid snapshot charge, but its total capacity over a linear tail is still \(\Theta(n)\). A single reply can also simultaneously perform several of the required causal services, so no pointwise “one reply, one obligation” strengthening is possible.

What follows is the strongest rigorous conclusion I can presently derive.

---

# 1. A rigid coatom-release lemma

Let \(r\) be legal and nonminimal immediately before a move \(p\), and suppose that after \(p\) is selected:

1. \(r\) remains legal; and
2. \(r\) becomes minimal legal.

Then there is a **unique** prime \(q\mid r\) such that the coatom
\[
\lambda=\frac rq
\]
was legal immediately before \(p\), and necessarily
\[
\lambda\mid p.
\]

### Proof

Because \(r\) was nonminimal, it had a legal proper divisor \(e\). Choose a prime \(q\mid r/e\). Then
\[
e\mid \frac rq\mid r.
\]
The legal divisors of a legal integer form an upper ideal, so \(r/q\) was legal. Thus at least one legal coatom existed.

Every such legal coatom becomes illegal after \(p\). Since \(r\) remains legal, \(p\nmid r\). Consequently \(p\) cannot divide a coatom \(r/q\), because then \(p\mid r\). Therefore each formerly legal coatom must divide \(p\).

But two distinct coatoms have least common multiple \(r\):
\[
\operatorname{lcm}\!\left(\frac r{q_1},\frac r{q_2}\right)=r
\qquad(q_1\ne q_2).
\]
If two distinct coatoms divided \(p\), then \(r\mid p\), contradicting the legality of \(r\) after \(p\). Hence exactly one coatom was legal, and it divides \(p\). ∎

This sharpens the general “last legal ancestor” description: every one-move release is a **prime-coatom release**.

---

# 2. A chronology-safe \(L^s\) first-death ledger

Fix a set
\[
X\subseteq \left(\frac n4,\frac n2\right]
\]
that stays legal throughout an interval of play. For every pair \((x,d)\), where \(x\in X\) and \(d\mid x\), \(d<x\), suppose \(d\) becomes illegal during the interval. Charge \((x,d)\) to the **first** selected move \(a\) making \(d\) illegal.

Then, for every fixed \(s>2\), there is a constant \(C_s\), independent of \(n\), the history, and \(X\), such that every actual move \(a\) receives total charge at most \(C_s\) under the weighting
\[
w(x,d)=\left(\frac d x\right)^s.
\]

Consequently, over any interval containing \(m\) actual moves,
\[
\boxed{\quad
\sum_{\substack{x\in X,\ d\mid x,\ d<x\\
d\text{ first dies in the interval}}}
\left(\frac d x\right)^s
\le C_s m.
\quad} \tag{2.1}
\]

### Proof

Let \(a\) be the first move making \(d\) illegal. Since \(x\) remains legal, it is impossible that \(a\mid d\), because then
\[
a\mid d\mid x,
\]
which would make \(x\) illegal. Hence
\[
d\mid a.
\]

For fixed \(a\), its total charge is therefore at most
\[
\sum_{\substack{d\mid a\\d\le n/4}}
\ \sum_{\substack{q\ge2\\n/4<dq\le n/2}}
q^{-s},
\]
because \(x=dq\) and \(d/x=1/q\).

Put \(Y=n/(4d)\ge1\). For \(s>1\),
\[
\sum_{q>Y}q^{-s}
\le
\left(1+\frac1{s-1}\right)Y^{\,1-s}.
\]
It follows that the charge to \(a\) is at most
\[
c_s\sum_{d\mid a}\left(\frac{4d}{n}\right)^{s-1}
=
c_s4^{s-1}n^{1-s}\sum_{d\mid a}d^{s-1}.
\]
Writing \(d=a/e\),
\[
\sum_{d\mid a}d^{s-1}
=
a^{s-1}\sum_{e\mid a}e^{-(s-1)}
\le
a^{s-1}\zeta(s-1).
\]
Since \(a\le n\),
\[
\text{charge}(a)
\le
c_s4^{s-1}\zeta(s-1)=:C_s.
\]
Summing over the \(m\) first-owner moves proves (2.1). ∎

This is a genuine lifetime estimate:

* it uses first deaths, so there is no redundant rewitnessing;
* one divisor cannot be charged repeatedly;
* it remains valid through arbitrary later refinements;
* it does not use the invalid instantaneous-to-lifetime promotion;
* it also covers the direct-ancestor orientation that escapes the atomic \(\kappa(F)\mid c\) ledger.

---

# 3. What the ledger proves about large released roots

Suppose a family \(\mathcal R\) of newly minimal roots lies in
\[
[\alpha n,n/4]
\]
for fixed \(\alpha>0\), and give each \(r\in\mathcal R\) a distinct witness
\[
x_r\in X,\qquad r\mid x_r.
\]

Such distinct witnesses are available for:

* future greedy roots, using the distinct future-service targets; and
* final persistent roots, after assigning one distinct survivor to each root.

Fix \(K\). If \(r\) has a prime factor \(\ell\le K\), then the coatom
\[
d=\frac r\ell
\]
must have died no later than the time \(r\) became minimal. Moreover,
\[
\frac d{x_r}
=
\frac r{\ell x_r}
\ge
\frac{2\alpha}{K},
\]
because \(x_r\le n/2\).

Thus (2.1) implies
\[
\#\{r\in\mathcal R:P^-(r)\le K\}
\le
C_{s,\alpha}K^s m. \tag{3.1}
\]

The \(K\)-rough exceptional roots in a fixed linear interval number
\[
O_\alpha\!\left(\frac n{\log K}\right).
\]
Hence
\[
|\mathcal R|
\le
C_{s,\alpha}K^s m
+
O_\alpha\!\left(\frac n{\log K}\right). \tag{3.2}
\]

This recovers cumulative fixed-shell sparsity when \(m=o(n)\), by first fixing \(K\) large and then letting \(m/n\to0\).

But for a proposed tail with \(m\asymp n\), (3.2) only says
\[
|\mathcal R|=O(n).
\]
That is exactly the scale already forced by Hall release and persistent-root counting. There is no contradiction.

---

# 4. A local bi-causal packet showing why pointwise capacity fails

The failure is not merely a poor choice of constants. One reply can genuinely perform several required services at once.

Take \(m\) coprime to \(30\), and consider the numbers
\[
r_{\rm future}=2m,\qquad
r_{\rm persistent}=5m,\qquad
p=3m,
\]
together with targets
\[
y=22m,\qquad x=35m.
\]

After a harmless rescaling, both \(x,y\) can lie in the second shell and all three of \(2m,3m,5m\) below \(n/4\). They satisfy

\[
2m\mid22m,\qquad
5m\mid35m,
\]
but
\[
2m\nmid35m,\qquad
3m\nmid22m,\qquad
3m\nmid35m.
\]

Assume that, before \(p=3m\) is played:

* \(m\) is legal;
* every other proper divisor needed to make \(2m\) and \(5m\) minimal has already been blocked.

Then playing \(3m\):

1. first-blocks the survivor-incident divisor \(m\mid35m\);
2. releases \(2m\), which may be the root of a future greedy move killing \(22m\);
3. releases \(5m\), which may remain as the persistent root of \(35m\).

Thus one reply simultaneously supplies

\[
\text{deadline service}
+
\text{future-root release}
+
\text{persistent-root release}.
\]

This is only a local packet, not an on-policy Prolonger construction: preparing the alternate coatoms, doing so chronologically, and surviving the greedy degree ledger are precisely the unresolved tasks. But it proves that any inequality of the form

\[
\text{number of services performed by }p_j\le1+o(1)
\]

is false even locally. A successful capacity theorem must amortize the **preparation history** of such packets.

---

# 5. Why this does not prove \(L(n)=o(n)\)

A linear second-shell tail requires two simultaneous streams.

First, the prefix Hall equality forces essentially one newly released future greedy root per reply:
\[
\#\{\text{future greedy roots released before }s\}
\ge s-o(n).
\]

Second, the final survivor population forces a linear family of persistent roots. These too must mostly be released by Prolonger replies.

The ledger above charges every such release to genuine, chronologically earlier first deaths. But over \(T=cn\) replies its right side is
\[
C_sT=\Theta(n),
\]
while the combined release demand is also only \(\Theta(n)\). The local packet shows that the two streams can share a reply and can share preparation.

Therefore the ledger does **not** imply an overload such as
\[
\text{required causal service}
>
\text{available reply capacity}.
\]

To close the upper route, one still needs a genuinely joint historical inequality saying, roughly, that after accounting for the preparation needed to create multi-release packets, a sequence of \(T\) replies cannot simultaneously:

\[
\begin{aligned}
&\text{discharge every survivor deadline,}\\
&\text{release }T-o(n)\text{ future greedy roots,}\\
&\text{and create a linear persistent-root family,}
\end{aligned}
\]
while keeping the maximum-degree area
\[
\sum_{t<T}\Delta_t\le |S_1|
\]
and all final survivors incomparable with every selected move.

Conversely, a disproof must exhibit an actual Prolonger strategy that realizes exactly such a prepared packet schedule against **arbitrary** Shortener replies—not merely a static primitive configuration or a trajectory defeating one heuristic policy.

---

# Conclusion

The unconditional statement
\[
L(n)=o(n)
\]
is not resolved by the supplied results, and the chronology-safe extension above does not resolve it either.

The new \(L^s\) first-death ledger shows that direct-ancestor preparation does admit a legitimate lifetime accounting. Its exact limitation is decisive: it gives only linear total capacity over a linear interval, and bi-causal packets can use that capacity simultaneously for deadline discharge and both kinds of root release. The missing result remains a **joint, preparation-sensitive packet-capacity theorem**, or an on-trajectory construction refuting one. Any claimed unconditional proof that skips that step is incomplete; any claimed linear lower bound that supplies only the arithmetic schedule but not the arbitrary-reply Prolonger strategy is also incomplete.
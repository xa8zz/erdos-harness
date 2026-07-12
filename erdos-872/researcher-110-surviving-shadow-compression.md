---
id: R110-surviving-shadow-compression
type: research
date: 2026-07-12
intent: >
  Prove or disprove the cumulative minimal-layer statement (CL): some
  H(n) -> infinity and Shortener sweep policy keep the total minimal-
  layer mass across the peeling sweeps o(n) against every Prolonger
  strategy.
predecessors: [R105-ordered-shadow-refuted, R101-one-sweep-shadow-containment]
action:
  kind: extends
  target: R105-ordered-shadow-refuted
claim: >
  (CL) remains unresolved, with the obstruction sharpened in both
  directions. Surviving-shadow theorem (new): for every cap
  H(n) -> infinity with H < n^(1/4) there are obtainable post-peel
  positions where, against EVERY ordering of M_0, Prolonger forces
  |D(A_1) ∩ Sh^-(K_0)| >= epsilon*n at the end of the first sweep — a
  linear part of the shadow remains LEGAL, refuting the hoped-for
  strengthening that carriers destroy their own shadow. However legal
  mass and minimal-layer mass are radically different: within a rough-
  root cone, divisibility is quotient divisibility, the next minimal
  elements are exactly the prime multiples mp, so a cone with ~K_m
  legal survivors contributes only ~pi(K_m) elements to M_1; summing,
  |M_1| << n*loglog(h)/log(h) = o(n). So the construction exhibits
  linear legal descendant mass with sublinear next minimal layer, and
  the obvious recursive counterexample loses density at each iteration
  (private-coordinate cost). A disproof of (CL) must expose the linear
  reservoir through linearly many SUCCESSIVE minimal layers; a proof
  must show the compression into sublinear minimal covers persists
  under repeated regeneration.
implications:
  - Carrier self-destruction is NOT a viable proof mechanism for (CL);
    the surviving legal mass is provably linear.
  - The compression phenomenon (legal mass linear, exposed minimal
    layer sublinear) is the exact live battleground; quotient-poset
    structure inside cones is the controlling object.
verifiers_at_time: []
confidence_at_time: low
strategy_dependence: independent
prompt: erdos-872/prompts/researcher-R110-cumulative-layer-surviving-shadow.md
---

## Verdict

I do **not** have a valid unconditional proof or disproof of \((\mathrm{CL})\). The accepted facts leave a genuine chronological gap, and claiming either conclusion would require an inference not presently justified.

I can, however, prove a substantially stronger obstruction than the attached raw-shadow construction: for every slowly growing cap \(H<n^{1/4}\), there are obtainable post-peel positions where Prolonger forces **linearly many descendants that are still legal at the end of the first sweep**, against every ordering of \(M_0\). Thus the problem cannot be solved merely by observing that the killing carriers destroy their own raw shadows. What remains unresolved is whether the linear legal reservoir can be exposed through linearly many subsequent minimal layers, rather than compressed by a sublinear covering layer.

The definitions and accepted framework below are those in the uploaded analysis. 

---

# 1. A surviving-shadow theorem

Write

\[
h=H(n),\qquad Y=\left\lfloor\frac nh\right\rfloor,
\qquad N=\left\lfloor\frac n2\right\rfloor.
\]

Assume throughout this section that

\[
h\longrightarrow\infty,
\qquad
h<n^{1/4}.
\tag{1}
\]

## Theorem 1

There is an absolute constant \(\varepsilon>0\) such that, for every \(h\) satisfying (1) and all sufficiently large \(n\), there is an obtainable post-Phase-0 position \(A_0\) with the following property.

For every ordering of the first minimal layer \(M_0\), Prolonger has a legal continuation through the first sweep such that, at its conclusion \(A_1\),

\[
\left|
D(A_1)\cap\operatorname{Sh}^{-}(K_0)
\right|
\ge \varepsilon n.
\tag{2}
\]

Thus a linear part of the shadow not only exists formally: it survives every carrier and every exact move made during the first sweep.

This disproves the possible strengthening

\[
\left|
D(A_1)\cap\operatorname{Sh}^{-}(K_0)
\right|=o(n)
\tag{3}
\]

uniformly over post-peel positions.

---

# 2. The post-peel position

As in the attached construction, take

\[
S_Y=
\left\{
\left\lfloor\frac Y2\right\rfloor+1,\ldots,Y
\right\}.
\]

It is an antichain. Moreover every \(d\le Y\) divides an element of \(S_Y\), so after all members of \(S_Y\) have been selected, every integer at most \(Y\) is illegal. The alternating play required to select \(S_Y\) is legal because its elements are mutually incomparable. A harmless upper-half prime can absorb a parity discrepancy.

Hence we obtain a post-Phase-0 position \(A_0\) satisfying

\[
[2,Y]\cap\mathcal L(A_0)=\varnothing.
\tag{4}
\]

Only this property of \(A_0\) will be used.

---

# 3. Rough roots and almost non-destructive carriers

Let \(\mathcal R\) consist of the \(h\)-rough integers \(m\) in complete dyadic intervals contained in

\[
2Y<m\le\frac n{10},
\qquad
P^{-}(m)>h.
\tag{5}
\]

The same rough-number estimate used in the attached construction gives absolute constants \(\eta,C>0\) such that

\[
\sum_{m\in\mathcal R}\frac1m\ge\eta,
\qquad
|\mathcal R|\le C\frac n{\log h}=o(n).
\tag{6}
\]

Indeed, there are \(\Theta(\log h)\) relevant dyadic intervals, and each contributes \(\gg1/\log h\) to the reciprocal sum.

For \(m\in\mathcal R\), define

\[
K_m=\left\lfloor\frac Nm\right\rfloor.
\tag{7}
\]

Because \(m>2Y\),

\[
K_m<\frac h3
\tag{8}
\]

for large \(n\); because \(m\le n/10\), we also have \(K_m\ge4\).

Choose, by Bertrand’s theorem, a prime

\[
\frac{K_m}{2}<q_m\le K_m,
\tag{9}
\]

and define the carrier

\[
c_m=mq_m.
\tag{10}
\]

The point of placing \(q_m\) in the top half of the multiplier interval is that among \(2,\ldots,K_m\), its only multiple is \(q_m\) itself.

## Lemma 2

For every \(m\in\mathcal R\):

1. \(m\in M_0\);
2. \(c_m\) is legal at \(A_0\);
3. among the roots in \(M_0\), the only divisor of \(c_m\) is \(m\);
4. the carriers \(c_m\) are pairwise incomparable.

### Proof

Every proper divisor \(d\mid m\) satisfies

\[
d\le \frac{m}{P^{-}(m)}
<\frac mh
\le \frac{n}{10h}<Y.
\tag{11}
\]

Thus every proper divisor of \(m\) is illegal by (4). No member of \(S_Y\) divides \(m\), while \(m>Y\) cannot divide a member of \(S_Y\). Hence \(m\) is legal and minimal.

Now consider a proper divisor of \(c_m=mq_m\) other than \(m\). It has the form \(d\) or \(dq_m\), where \(d\mid m\) is proper. Using (7)–(9),

\[
dq_m
\le
\frac{m}{P^{-}(m)}K_m
<
\frac mh\frac Nm
=
\frac Nh
\le\frac Y2+O(1).
\tag{12}
\]

So every such divisor is already illegal. Therefore \(c_m\) is legal, and its only divisor belonging to \(M_0\) is \(m\).

Finally, every prime factor of \(m\) exceeds \(h\), whereas \(q_m<h\). If

\[
m q_m\mid m' q_{m'},
\]

comparison of the prime factors exceeding \(h\) gives \(m\mid m'\). But distinct members of \(\mathcal R\) cannot divide one another: if \(m\mid m'\) properly, then \(m'/m>h\), while from (5),

\[
\frac{m'}m<\frac{n/10}{2n/h}<\frac h{10}.
\]

Thus \(m=m'\), and then \(q_m=q_{m'}\). The carriers are pairwise incomparable. ∎

---

# 4. A whole descendant cone survives each carrier

For \(m\in\mathcal R\), define

\[
\Gamma_m
=
\left\{
mk:2\le k\le K_m,\ k\ne q_m
\right\}.
\tag{13}
\]

Thus

\[
|\Gamma_m|=K_m-2.
\tag{14}
\]

## Lemma 3

Suppose Prolonger plays carriers \(c_m\) for a subfamily \(B\subseteq\mathcal R\), while the other moves during the sweep are exact selections from \(M_0\). At the end of the sweep,

\[
\bigcup_{m\in B}\Gamma_m\subseteq D(A_1).
\tag{15}
\]

Moreover, the sets \(\Gamma_m\) are pairwise disjoint.

### Proof

Fix \(x=mk\in\Gamma_m\).

First compare \(x\) with its own carrier \(c_m=mq_m\). We have

\[
c_m\mid x \iff q_m\mid k.
\]

Since \(q_m>K_m/2\) and \(k\le K_m\), this happens only for \(k=q_m\), which was excluded. Conversely,

\[
x\mid c_m \iff k\mid q_m.
\]

Because \(q_m\) is prime and \(k\ge2\), this again forces \(k=q_m\). Hence \(x\) is incomparable with \(c_m\).

For a different carrier \(c_{m'}=m'q_{m'}\), note that \(k,q_{m'}<h\), while all prime factors of \(m,m'\) exceed \(h\). If \(c_{m'}\mid x\), comparison of the \(>h\) parts gives \(m'\mid m\); if \(x\mid c_{m'}\), it gives \(m\mid m'\). Both are impossible for distinct roots.

It remains to check exact selections from \(M_0\). Suppose \(r\in M_0\) divides \(x=mk\). If \(r\) omits even one prime factor of \(m\), counted with multiplicity, then

\[
r\le \frac{x}{P^{-}(m)}
\le \frac Nh
\le\frac Y2+O(1),
\]

contradicting the legality of \(r\). Therefore \(m\mid r\), say \(r=md\) with \(d\mid k\). If \(d>1\), then the legal integer \(m\) properly divides \(r\), contradicting \(r\in M_0\). Thus \(r=m\), and \(m\) was not selected exactly: it was killed by \(c_m\).

Conversely, if \(x\mid r\in M_0\), then \(m\mid r\); since \(m,r\in M_0\), their incomparability forces \(m=r\), impossible because \(x>m\).

So every exact selection from \(M_0\) other than \(m\) is incomparable with \(x\). This proves (15).

Finally, if

\[
mk=m'k',
\qquad
k,k'<h,
\]

comparison of prime factors exceeding \(h\) gives \(m=m'\), and then \(k=k'\). Hence the cones are disjoint. ∎

The carrier \(c_m\) therefore destroys exactly one point of the lower-half cone of \(m\), namely \(mq_m\), rather than a positive fraction of it.

---

# 5. Prolonger secures linear surviving mass against every order

Assign to \(m\in\mathcal R\) the weight

\[
w(m)=|\Gamma_m|=K_m-2.
\tag{16}
\]

While some member of \(\mathcal R\) remains legal, Prolonger chooses a surviving root of maximum weight and plays its carrier.

The private-carrier property means that each such move kills exactly the chosen root among \(M_0\). Pair every root from \(\mathcal R\) selected exactly by Shortener, except possibly her first one, with the carrier move immediately preceding its selection. At that preceding move the selected root was still available, so the maximum-weight rule chose a root of at least as much weight. Distinct Shortener roots receive distinct partners.

Consequently, if \(B\subseteq\mathcal R\) is the family killed by Prolonger’s carriers, then

\[
\sum_{m\in B}w(m)
\ge
\frac12
\left(
\sum_{m\in\mathcal R}w(m)
-
\max_{m\in\mathcal R}w(m)
\right).
\tag{17}
\]

After no root from \(\mathcal R\) remains, Prolonger may select any remaining legal member of \(M_0\) exactly. Such roots are incomparable with all the survivor cones by Lemma 3, so this finishes the sweep harmlessly.

Using \(K_m\ge N/m-1\), (6) gives

\[
\begin{aligned}
\sum_{m\in\mathcal R}w(m)
&=
\sum_{m\in\mathcal R}(K_m-2)\\
&\ge
N\sum_{m\in\mathcal R}\frac1m
-3|\mathcal R|\\
&\ge
\eta N-o(n)
\ge c n
\end{aligned}
\tag{18}
\]

for an absolute \(c>0\). On the other hand,

\[
\max_m w(m)\le\max_m K_m<h=o(n).
\tag{19}
\]

Combining (17)–(19),

\[
\sum_{m\in B}|\Gamma_m|\ge \varepsilon n
\tag{20}
\]

for some absolute \(\varepsilon>0\). By Lemma 3, all these integers remain legal at the end of the first sweep. They are also proper multiples of advance-killed roots, so they lie in \(\operatorname{Sh}^{-}(K_0)\).

This proves Theorem 1.

---

# 6. Why this still does not disprove \((\mathrm{CL})\)

The obstruction is that **legal mass and minimal-layer mass are radically different quantities**.

Inside a cone \(\Gamma_m\), divisibility is exactly quotient divisibility:

\[
mk\mid mk'
\iff
k\mid k'.
\tag{21}
\]

Moreover, the proof of Lemma 3 shows that every legal divisor of a cone element must itself contain the whole rough root \(m\). Thus, after \(m\) is killed, the next minimal elements in this cone are precisely

\[
mp,
\qquad
p\le K_m\text{ prime},\quad p\ne q_m.
\tag{22}
\]

So a cone with \(K_m-O(1)\) legal elements contributes only approximately \(\pi(K_m)\) elements to \(M_1\).

In fact, grouping the roots according to \(K_m\asymp2^s\), the upper rough-number estimate and \(\pi(x)\ll x/\log x\) give

\[
\begin{aligned}
\left|
M_1\cap\bigcup_{m\in B}\Gamma_m
\right|
&\le
\sum_{m\in\mathcal R}\pi(K_m)\\
&\ll
\frac n{\log h}
\sum_{1\le s\ll\log h}\frac1s\\
&\ll
n\,\frac{\log\log h}{\log h}
=o(n).
\end{aligned}
\tag{23}
\]

Thus the construction exhibits the exact phenomenon that blocks a quick disproof:

\[
\boxed{
\text{linear legal descendant mass}
\quad\text{but}\quad
\text{sublinear next minimal layer}.
}
\]

The later sweeps then operate on the quotient divisibility posets

\[
\{2,\ldots,K_m\},
\qquad K_m\le h.
\tag{24}
\]

Prolonger may again advance-kill prime or composite quotient roots, while Shortener may select a sparse family that covers a large fraction of each cone. Controlling the total number of quotient minima exposed over \(\log h\) rounds is a scaled version of the same chronological problem.

The static-completion theorem is perfectly consistent with (20): the first-sweep position has \(o(n)\) played elements, so its entire linear legal set can be covered by \(o(n)\) current minimal elements. What is unknown is how much that cover regenerates after Prolonger preempts parts of it.

There is also a quantifier issue. The position \(A_0\) above is **obtainable**, but \((\mathrm{CL})\) only concerns the positions actually produced against Shortener’s chosen Phase-0 policy. Therefore an all-depth counterexample at this particular \(A_0\) would still have to be made forceable against that policy.

---

# 7. Why the obvious recursive counterexample loses density

A natural attempted upgrade is a complement cascade. At some stage take active roots

\[
d_1,\ldots,d_q.
\]

After Shortener selects \(d_i\), Prolonger would like one carrier \(a_i\) satisfying

\[
d_j\mid a_i\quad(j\ne i),
\qquad
d_i\nmid a_i.
\tag{25}
\]

It would kill all unselected roots in one move and expose a new generation.

There is a sharp arithmetic cost.

## Lemma 4: private-coordinate cost

If integers \(d_1,\ldots,d_q\) admit carriers satisfying (25), then there are \(q\) distinct primes \(p_1,\ldots,p_q\) such that

\[
v_{p_i}(d_i)>
\max_{j\ne i}v_{p_i}(d_j).
\tag{26}
\]

Consequently every \(a_i\) is at least the product of \(q-1\) distinct primes, and hence

\[
a_i\ge (q-1)^\#,
\tag{27}
\]

where \((q-1)^\#\) denotes the product of the first \(q-1\) primes.

### Proof

Let

\[
L_i=\operatorname{lcm}_{j\ne i}d_j.
\]

By (25), \(L_i\mid a_i\). Since \(d_i\nmid a_i\), necessarily \(d_i\nmid L_i\). Hence some prime \(p_i\) has

\[
v_{p_i}(d_i)>v_{p_i}(L_i)
=
\max_{j\ne i}v_{p_i}(d_j).
\]

A single prime cannot be a strict unique maximum for two different roots, so the primes \(p_i\) are distinct. For \(j\ne i\), \(d_j\mid a_i\), and therefore \(a_i\) contains the private prime \(p_j\). This proves (27). ∎

If one replicates such a \(q\)-root gadget through product-separated cores, the board bound permits at most \(O(n/(q-1)^\#)\) copies, while a \(q\)-stage cascade contributes only \(O(q^2)\) layer elements per copy. Its total contribution is therefore at most

\[
O\left(
n\frac{q^2}{(q-1)^\#}
\right)
=o(n)
\qquad(q\to\infty).
\tag{28}
\]

This rigorously rules out the cleanest arbitrary-order recursive version of the quadratic semiprime construction. It does **not** rule out more complicated overlapping, coded, or non-complement cascades; proving that every robust cascade incurs comparable entropy is precisely the missing global theorem.

---

# 8. The exact remaining separator

A proof of \((\mathrm{CL})\) now needs a chronological covering statement of the following kind:

> After a first sweep, even if a linear legal descendant family survives, the sum of the minimal covers exposed by successively preempting those covers is \(o(n)\), uniformly through \(\lceil\log_2H\rceil\) generations.

A disproof needs the opposite:

> A Prolonger strategy, forceable against Shortener’s actual Phase-0 and sweep policies, that repeatedly converts sparse covers into new covers whose cumulative cardinality is \(\Omega(n)\), while avoiding the private-coordinate/primorial density loss.

The supplied static theorems, raw-shadow construction, root-indexed lifetime ledger, and the survivor theorem above establish neither assertion. In particular:

\[
\text{linear raw shadow}
\;\not\Rightarrow\;
\text{linear legal descendants}
\;\not\Rightarrow\;
\text{linear cumulative minimal layers}.
\]

The first implication is false in general, and Theorem 1 shows that even making the middle term linear still does not resolve the second.

Therefore the honest conclusion is

\[
\boxed{
\text{\((\mathrm{CL})\) is not proved or disproved by a valid argument here.}
}
\]

The new rigorous advance is that **first-sweep carrier self-destruction is not sufficient**: in the natural slowly growing regime, Prolonger can force a linear shadow that genuinely survives the entire first sweep. The unresolved difficulty begins only when that linear legal mass is compressed into, and repeatedly regenerated from, subsequent sublinear minimal covers.
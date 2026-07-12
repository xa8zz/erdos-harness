---
id: R101-one-sweep-shadow-containment
type: research
date: 2026-07-12
intent: >
  Prove or disprove the growing-depth uniformity statement: the
  cumulative minimal-layer mass across log_2 H peeling sweeps is o(n)
  for some H -> infinity, in the divisibility antichain game on {2..n}.
predecessors: [R96-layer-peeling-chronological-separator]
action:
  kind: extends
  target: R96-layer-peeling-chronological-separator
claim: >
  One-sweep containment theorem: in the layer-peeling sweep with
  J = ceil(log_2 H) layers M_0, M_1, ..., call m in M_j advance-killed
  if a proper multiple of m is played before Shortener reaches m (Lemma:
  a minimal element can only be selected exactly or killed upward, by
  legality monotonicity). Then for every j, the union of all later
  layers M_(j+1) ... M_(J-1) is contained in the proper-lower-multiple
  shadow Sh^-(K_j) of the advance-killed set K_j alone, and the layers
  are pairwise disjoint, giving sum_(l<J) |M_l| <= |M_0| + |Sh^-(K_0)|.
  Since |M_0| = o(n) by static completion, growing-depth uniformity
  reduces to the single first-sweep ordered-shadow statement (OS): there
  is H -> infinity such that Shortener can order M_0 so that
  |Sh^-(K_0)| = o(n) against every legal Prolonger continuation.
  Localization: roots with at most R_n proper multiples contribute
  R_n|M_0| = o(n), so any counterexample must force linear shadow weight
  from roots with n/H < m < n/(2(R_n+1)). (OS) is neither proved nor
  disproved: static completion does not control the shadow of the
  online-preempted subset, and the quadratic semiprime regeneration
  example does not supply advance-killing against arbitrary orderings
  (a batch carrier divisible by several current roots dies permanently
  as soon as Shortener selects any one of them).
implications:
  - No iteration of static completion across growing depth is needed;
    the entire upper-route uniformity question is one first-sweep
    adaptive transversal problem on divisor traces.
  - A disproof must chronologically expose a linear advance-killed
    shadow as later minimal layers, forced against every sweep ordering
    — strictly harder than exhibiting static quadratic regeneration.
verifiers_at_time: []
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/researcher-R101-growing-depth-uniformity.md
---

## Verdict

I do **not** have a valid proof or disproof of the stated cumulative minimal-layer claim. However, the apparent need to control \(\log_2 H\) successive applications of the static-completion theorem can be eliminated.

There is an exact one-sweep containment principle: **every minimal element appearing after the first sweep is a proper multiple of a first-layer element that Prolonger preempted by playing a proper multiple of it.** Consequently, the entire growing-depth problem reduces to controlling one dynamically generated lower-multiple shadow after the first sweep.

I use the Phase 0 construction, sweep definition, and multiplicative-chain lemma exactly as supplied. 

---

# 1. Advance-killed elements of one sweep

Fix \(H\to\infty\), and put

\[
J=\left\lceil \log_2 H\right\rceil.
\]

Consider sweep \(j\), beginning from \(A_j\), with legal lower set \(D_j\) and minimal layer

\[
M_j=\min_{\mid} D_j.
\]

Call \(m\in M_j\) **selected** if either player actually plays \(m\) during that sweep. Call \(m\) **advance-killed** if, before Shortener reaches \(m\) in her ordering, some player plays a proper multiple of \(m\), making \(m\) illegal. Let

\[
K_j=\{m\in M_j:m\text{ is advance-killed during sweep }j\}.
\]

For the specified sweep strategy, Shortener herself only selects elements of \(M_j\), so every member of \(K_j\) is normally advance-killed by a Prolonger move. The definition also accommodates any extra interleaved Shortener moves.

We first record why these are the only possibilities.

### Lemma 1: a minimal element can only be removed upward or selected exactly

Suppose \(m\in M_j\), and a legal move \(c\) made after the start of sweep \(j\) is the first new move comparable with \(m\). Then either

\[
c=m
\qquad\text{or}\qquad
m\mid c,\quad m<c.
\]

#### Proof

Legality is monotone decreasing: if \(c\) is legal when played, then it was legal at the start of the sweep. Since \(m\) was minimal in \(D_j\), no proper divisor \(c\mid m\), \(2\le c<m\), was legal at that time. Hence a newly played comparator cannot be a proper divisor of \(m\). The only remaining possibilities are \(c=m\) or \(m\mid c\) properly. ∎

Thus the distinction between selected and advance-killed is exhaustive.

---

# 2. The one-sweep ancestry container

For \(K\subseteq L_n\), define its proper lower-multiple shadow by

\[
\operatorname{Sh}^{-}(K)
=
\left\{
x\le \frac n2:
\text{there is }m\in K\text{ with }m\mid x,\ m<x
\right\}.
\]

### Theorem 2: tail compression into one advance-killed shadow

For every sweep index \(j<J\),

\[
\boxed{
\bigcup_{\ell=j+1}^{J-1} M_\ell
\subseteq
\operatorname{Sh}^{-}(K_j).
}
\tag{5}
\]

Consequently,

\[
\boxed{
\sum_{\ell=j}^{J-1}|M_\ell|
\le
|M_j|+\bigl|\operatorname{Sh}^{-}(K_j)\bigr|.
}
\tag{6}
\]

#### Proof

Take

\[
x\in M_\ell,\qquad \ell>j.
\]

Because the legal sets are decreasing,

\[
x\in D_\ell\subseteq D_{j+1}\subseteq D_j.
\]

Every member of a finite divisibility poset lies above a minimal member, so there is some

\[
m\in M_j,\qquad m\mid x.
\]

We cannot have \(m=x\), since \(M_j\cap D_{j+1}=\varnothing\), whereas \(x\in D_{j+1}\). Thus \(m<x\).

During sweep \(j\), \(m\) ceased to be legal. If either player had selected \(m\) exactly, then \(m\in A\) afterward, and \(m\mid x\) would make \(x\) illegal for every later position. This contradicts \(x\in M_\ell\). Therefore \(m\) was not selected exactly. By Lemma 1, it was advance-killed by a proper multiple. Hence

\[
m\in K_j.
\]

Thus \(x\in\operatorname{Sh}^{-}(K_j)\), proving (5).

The sets \(M_j,M_{j+1},\ldots\) are pairwise disjoint because

\[
D_{r+1}\subseteq D_r\setminus M_r.
\]

Taking cardinalities in (5) therefore gives (6). ∎

This is stronger than merely assigning every later element an ancestor in \(M_0\): only the ancestors that Prolonger preempts upward can have surviving descendants.

---

# 3. Application to the first sweep

Taking \(j=0\) in (6) gives

\[
\boxed{
\sum_{\ell<J}|M_\ell|
\le
|M_0|+\bigl|\operatorname{Sh}^{-}(K_0)\bigr|.
}
\tag{7}
\]

After Phase 0, the complete history has at most

\[
\frac{2n}{H}+1=o(n)
\]

moves. The supplied static-completion theorem therefore gives, uniformly over Phase 0 histories,

\[
|M_0|=o(n).
\tag{8}
\]

Hence the desired cumulative minimal-layer criterion follows from the single statement

\[
\bigl|\operatorname{Sh}^{-}(K_0)\bigr|=o(n).
\tag{9}
\]

No iteration of the qualitative static theorem through \(J=\log_2 H\) stages is required.

There is also a useful weighted sufficient form. A root \(m\) has exactly

\[
w_H(m)
:=
\max\left\{0,
\left\lfloor\frac{n}{2m}\right\rfloor-1
\right\}
\]

proper multiples in \(L_n\). Therefore

\[
\bigl|\operatorname{Sh}^{-}(K_0)\bigr|
\le
\sum_{m\in K_0}w_H(m),
\tag{10}
\]

and, because every \(m\in M_0\) satisfies \(m>n/H\),

\[
w_H(m)<\frac H2.
\]

Thus

\[
\sum_{\ell<J}|M_\ell|
\le
|M_0|
+
\sum_{m\in K_0}
\left(
\left\lfloor\frac{n}{2m}\right\rfloor-1
\right)
\le
|M_0|+\frac H2|K_0|.
\tag{11}
\]

The last inequality recovers the naive \(H|M_0|\)-type estimate, but (7) is sharper because it counts the union of the descendant shadows and only uses advance-killed roots.

---

# 4. What a counterexample would now have to do

Suppose that for some fixed \(\varepsilon>0\), Prolonger could force

\[
\sum_{\ell<J}|M_\ell|\ge \varepsilon n
\tag{12}
\]

against every choice of sweep order. Since \(|M_0|=o(n)\), (7) would force

\[
\bigl|\operatorname{Sh}^{-}(K_0)\bigr|
\ge
(\varepsilon-o(1))n.
\tag{13}
\]

Therefore every genuine disproof must already accomplish the following during the **first** minimal-layer sweep:

1. Against Shortener’s chosen ordering of \(M_0\), Prolonger must advance-kill a subset \(K_0\subseteq M_0\).
2. Those advance-killed roots must have a linear-sized proper-multiple shadow.
3. A linear part of that shadow must survive the actual carriers and Shortener’s subsequent moves long enough to appear in later minimal layers.

This is substantially stronger than exhibiting a static family with quadratic regeneration.

For example, the semiprime construction

\[
\{p_iq_i:1\le i\le t\}
\]

does show that preempted factors can leave \(t(t-1)\) cross-products. But it does not by itself show that the relevant roots can be advance-killed against an arbitrary ordering. If a proposed batch carrier \(c\) is divisible by several current roots, then as soon as Shortener selects any one of those roots, \(c\) becomes permanently illegal. Prolonger must therefore select an adaptive sequence of divisor traces avoiding the entire Shortener-claimed prefix.

That chronological requirement is absent from the static quadratic example.

---

# 5. The exact online object

At the beginning of the first sweep, let \(M=M_0\). Every currently legal proper-multiple carrier \(c\) has a trace

\[
T_M(c)=\{m\in M:m\mid c\}.
\]

The sweep induces the following online game.

- Shortener claims the first surviving vertex of \(M\) in her chosen order.
- Prolonger may play a legal carrier \(c\), which advance-kills every member of \(T_M(c)\).
- Once Shortener has claimed \(m\), every future carrier whose trace contains \(m\) is illegal.
- Prolonger’s successive carriers must also remain pairwise incomparable with all earlier actual moves.
- The cost of the advance-killed set \(K\) is not merely \(|K|\), but the size of
  \[
  \operatorname{Sh}^{-}(K).
  \]

This is a weighted, adaptive transversal problem on divisor traces. Generic set-cover information is insufficient because it ignores both permanent illegality and the lower-multiple shadow of the vertices deleted before being claimed.

---

# 6. The single sub-step I cannot close

The precise sufficient statement is the following.

### First-sweep ordered-shadow statement

There exists \(H=H(n)\to\infty\) such that, for every position \(A_0\) obtainable after Phase 0, Shortener can choose an ordering of \(M_0\) for which, against every legal Prolonger continuation during the first sweep,

\[
\boxed{
\left|
\bigcup_{m\in K_0}
\left\{
2m,3m,\ldots,
\left\lfloor\frac{n}{2m}\right\rfloor m
\right\}
\right|
=o(n).
}
\tag{OS}
\]

The stronger weighted version would be

\[
\boxed{
\sum_{m\in K_0}
\left(
\left\lfloor\frac{n}{2m}\right\rfloor-1
\right)
=o(n).
}
\tag{WOS}
\]

Either \((\mathrm{OS})\) or \((\mathrm{WOS})\) proves the requested statement immediately through (7).

Conversely, any disproof of the cumulative-layer claim must defeat \((\mathrm{OS})\): by (13), it must force a linear advance-killed shadow against every first-sweep ordering. It must then show that the linear shadow is not merely potential shadow but is chronologically exposed as later minimal elements.

I could not prove \((\mathrm{OS})\). The supplied static-completion theorem controls

\[
|M_0|=o(n),
\]

but not the multiple shadow of the subset preempted online. The known \(t(t-1)\) cross-product construction demonstrates possible inflation, but it does not provide an arbitrary-order strategy forcing the required \(K_0\). Random witness selection and lifetime divisor bounds likewise do not control the union in \((\mathrm{OS})\).

A further localization follows from (10). Write

\[
\varepsilon_n=\frac{|M_0|}{n}=o(1)
\]

and choose \(R_n\to\infty\) so slowly that

\[
R_n\varepsilon_n=o(1).
\]

The roots with \(w_H(m)\le R_n\) contribute only

\[
\sum_{\substack{m\in K_0\\w_H(m)\le R_n}}w_H(m)
\le R_n|M_0|
=o(n).
\]

Thus any counterexample must force linear weight specifically from roots satisfying

\[
w_H(m)>R_n,
\qquad\text{hence}\qquad
\frac nH<m<\frac{n}{2(R_n+1)}.
\tag{14}
\]

So the obstruction cannot be spread among the almost-exact roots near \(n/2\); it must consist of an online-forceable family of relatively low first-layer roots with unbounded descendant capacity.

---

# Conclusion

The requested cumulative-layer statement is not proved or disproved here. The strongest rigorous advance is the exact tail containment

\[
\boxed{
\sum_{\ell<J}|M_\ell|
\le
|M_0|+
\bigl|\operatorname{Sh}^{-}(K_0)\bigr|,
}
\]

where \(K_0\) consists only of first-layer minima advance-killed by proper-multiple carriers.

Accordingly, the single unresolved sub-step is:

\[
\boxed{
\text{Can Shortener order }M_0\text{ so that the proper-multiple shadow of }
K_0\text{ is }o(n)\text{ against all legal replies?}
}
\]

This formulation incorporates the sweep order, permanent blockers, batch carriers, and all later regeneration in one chronological object. It also shows what a valid disproof must force before any higher-layer construction can succeed.
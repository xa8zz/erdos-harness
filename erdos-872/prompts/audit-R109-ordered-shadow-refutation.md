Don't search the internet. You are an adversarial referee. A proof claiming to REFUTE a combinatorial-game statement is reproduced verbatim below (Document B). The statement (OS) it refutes was formulated inside an earlier analysis, reproduced first (Document A) — (OS) is defined in Document A's Section 6, using Document A's Phase 0 and sweep framework. Your sole job: decide whether Document B's refutation of (OS) is correct. Verdict: VALID / REPAIRABLE (state the gap and repair) / REFUTED (exact false step or why the construction fails). Do not grade generously.

## The game

For \(n\ge2\), two players alternately choose previously unchosen integers from \(\{2,\ldots,n\}\), always keeping the chosen set an antichain under divisibility (a primitive set). The game ends when the set is maximal. Prolonger moves first and maximizes the total number of moves; Shortener minimizes it. "Legal" at position \(A\) = unchosen and incomparable with every member of \(A\).

## Key checks (examine each explicitly)

1. OBTAINABILITY: (OS) quantifies over positions \(A_0\) obtainable after Phase 0. Is Document B's \(A_0\) genuinely reachable by legal alternating play consistent with the Phase 0 defined in Document A — including Shortener playing her specified Phase 0 moves — or does it require cooperative/impossible play from Shortener? This is the single most likely failure point.
2. Are the claimed roots really in the FIRST minimal layer \(M_0\) at \(A_0\) (no smaller legal divisor)?
3. Private carriers: is \(c_m=2m\) (rough regime) legal at the relevant moments, and comparable to no other root in the family? Do Prolonger's carrier moves stay legal as the sweep and his own earlier moves accumulate?
4. The drafting lemma (Prolonger secures half the shadow value against every ordering): is the alternation accounting right — can Shortener burn carriers faster than Prolonger can use them, or kill shadow with her own sweep moves in a way the lemma ignores?
5. The rough-number and prime constructions: check the density/Mertens-type estimates, the constant-reciprocal-mass subfamily, and the Bonferroni step for the \(H\ge n^{1/4}\) regime.
6. Shadow accounting: disjointness claims, the union lower bound, and whether the final quantifier order exactly negates (OS) (for all H, exists obtainable A_0, for all orderings, exists legal continuation, shadow >= epsilon n).
7. Document B's own scope claim (Section 7): does the refutation really leave the cumulative minimal-layer (growing-depth uniformity) statement open, or does the construction, if correct, do more than claimed?

## Document A (verbatim; defines Phase 0, sweeps, advance-killing, Sh^-, K_0, and (OS)/(WOS) in its Section 6)

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

## Document B (verbatim; the refutation under audit)

# Verdict

\[
\boxed{\text{The first-sweep ordered-shadow statement (OS) is false.}}
\]

In fact, the negation holds in a quantitatively strong form.

> **Theorem.** There is an absolute constant \(\varepsilon>0\) such that, for every function \(H(n)\to\infty\) and all sufficiently large \(n\), one can obtain a post-Phase-0 position \(A_0\) with the following property: for **every** ordering of its first minimal layer \(M_0\), Prolonger has a legal continuation during the first sweep for which
> \[
> \left|\operatorname{Sh}^{-}(K_0)\right|\ge \varepsilon n.
> \]
> Consequently neither (OS) nor the stronger weighted statement (WOS) holds.

I use the literal definitions of the first sweep, advance-killing, and the proper-multiple shadow from the attachment. 

The counterexample is genuinely first-sweep-local. It is not a terminal-position loophole, and it does not by itself resolve \(L(n)\): the shadow in (OS) counts potential proper multiples without requiring those multiples to remain legal after the killing carriers are played.

---

## 1. A post-peel position available for every \(H\)

Fix a proposed function \(H=H(n)\to\infty\), and write

\[
h:=H(n),\qquad Y:=\left\lfloor \frac nh\right\rfloor .
\]

Assume first \(Y\ge2\), and define

\[
S_Y:=\left\{\left\lfloor\frac Y2\right\rfloor+1,\ldots,Y\right\}.
\]

This is an antichain: if \(a,b\in S_Y\) and \(a<b\), then \(2a>Y\ge b\), so \(a\nmid b\).

Moreover, every integer \(d\in[2,Y]\) is comparable with an element of \(S_Y\). This is immediate when \(d\in S_Y\). If \(d\le Y/2\), put

\[
q=\left\lfloor\frac Yd\right\rfloor .
\]

Then \(q\ge2\), and

\[
qd=Y-r>Y-d\ge \frac Y2
\]

for some \(0\le r<d\). Hence \(qd\in S_Y\) and \(d\mid qd\).

The players can select the members of \(S_Y\) successively during Phase 0. Every unselected member remains legal because \(S_Y\) is an antichain. Once all of \(S_Y\) has been selected, every integer at most \(Y\) is illegal.

Depending on the parity convention for the transition from Phase 0 to the sweep, Prolonger may receive one additional turn after the last member of \(S_Y\) is selected. On that turn he chooses a prime

\[
q_n\in(n/2,n],
\]

which exists by Bertrand’s theorem. This upper-half prime is incomparable with all of \(S_Y\) and has no proper divisor in the board that affects the lower legal set. Thus the resulting post-peel position is either

\[
A_0=S_Y
\qquad\text{or}\qquad
A_0=S_Y\cup\{q_n\}.
\tag{1}
\]

Both have exactly the same legal lower set.

When \(Y<2\), Prolonger simply takes such an upper-half prime \(q_n\) on his initial turn. There is no integer \(d\ge2\) with \(d\le n/h\), so Phase 0 immediately ends with \(A_0=\{q_n\}\).

Thus, in every case, we have an obtainable post-peel position satisfying:

\[
\boxed{\text{Every integer }2\le d\le Y\text{ is illegal at }A_0.}
\tag{2}
\]

The optional upper-half prime will be harmless in everything below, because all of our roots and carriers lie at most \(n/2\) and are composite when necessary.

---

## 2. The private-carrier drafting lemma

The following elementary online lemma handles the arbitrary ordering quantifier in (OS).

### Lemma 1: private carriers force half the shadow value

Let \(M\) be the first minimal layer at a position \(A_0\), and let \(K\subseteq M\). Suppose that for every \(v\in K\) there is an integer \(c_v\) satisfying:

1. \(c_v\) is legal at \(A_0\);
2. \(v\mid c_v\) properly;
3. among the elements of \(M\), the only one dividing \(c_v\) is \(v\):
   \[
   \{m\in M:m\mid c_v\}=\{v\};
   \tag{3}
   \]
4. the carriers \(c_v\), \(v\in K\), are pairwise incomparable.

Let \(F:2^K\to\mathbb R_{\ge0}\) be monotone, submodular, and satisfy \(F(\varnothing)=0\). Put

\[
b:=\max_{v\in K}F(\{v\}).
\]

Then, against every ordering of \(M\), Prolonger can force an advance-killed set \(B\subseteq K\) satisfying

\[
\boxed{F(B)\ge \frac{F(K)-b}{2}.}
\tag{4}
\]

#### Proof

On each Prolonger turn, as long as some element of \(K\) remains legal, let \(B\) denote the roots whose carriers Prolonger has already played. Choose a surviving \(v\in K\) maximizing

\[
F(B\cup\{v\})-F(B),
\]

and play \(c_v\).

This move is legal. It is incomparable with all earlier carriers by condition 4. If a Shortener-selected root \(r\in M\) divided \(c_v\), condition 3 would give \(r=v\), impossible because \(v\) is still legal. Conversely, if \(c_v\mid r\), then

\[
v\mid c_v\mid r,
\]

contradicting the fact that the distinct minimal elements \(v,r\in M\) are incomparable.

Condition 3 also shows that playing \(c_v\) advance-kills exactly one surviving member of \(K\), namely \(v\).

At the end of the sweep, partition

\[
K=B\sqcup T,
\]

where \(T\) consists of the roots selected exactly by Shortener. Except possibly for the first element of \(T\) when Shortener moves first, each \(t\in T\) has an immediately preceding Prolonger turn. Pair \(t\) with the root \(v(t)\in B\) chosen on that preceding turn. These paired roots of \(B\) are distinct.

Let \(B_t\) be the set of roots already taken by Prolonger immediately before \(v(t)\) was chosen. At that moment \(t\) was still available, so greedy choice gives

\[
F(B_t\cup\{v(t)\})-F(B_t)
\ge
F(B_t\cup\{t\})-F(B_t).
\tag{5}
\]

Now add the elements of \(T\) to the final set \(B\) in chronological order. By submodularity, the marginal contribution of \(t\) when added to \(B\) and the earlier members of \(T\) is at most its marginal over the smaller set \(B_t\). Hence (5) charges that marginal to the marginal by which \(v(t)\) entered \(B\).

Because distinct \(t\)'s are paired with distinct elements of \(B\), the total contribution of all paired elements of \(T\) is at most \(F(B)\). The one possible unpaired initial root contributes at most \(b\). Therefore

\[
F(K)-F(B)
=
F(B\cup T)-F(B)
\le F(B)+b.
\]

Rearranging yields (4). ∎

We will apply this to the coverage function

\[
F(B):=
\left|
\bigcup_{m\in B}
\{2m,3m,\ldots,\lfloor n/(2m)\rfloor m\}
\right|.
\tag{6}
\]

Coverage functions are monotone and submodular.

---

## 3. A standard rough-number estimate

We use the following unconditional form of the one-dimensional sieve.

### Lemma 2: rough integers in a dyadic interval

There are absolute constants \(a,A>0\) such that, whenever \(z\) is sufficiently large and \(X\ge z^3\),

\[
a\frac{X}{\log z}
\le
\#\{m:X<m\le2X,\;P^{-}(m)>z\}
\le
A\frac{X}{\log z},
\tag{7}
\]

where \(P^{-}(m)\) is the least prime factor of \(m\).

This is the usual fundamental lemma of the dimension-one linear sieve. For completeness, take the interval sequence \(\mathcal A=(X,2X]\) and sieve by the primes up to \(z\). For squarefree \(d\),

\[
|\{m\in\mathcal A:d\mid m\}|=\frac Xd+O(1).
\]

Use Rosser lower and upper weights at level

\[
D=\frac{X}{(\log X)^4}.
\]

The total remainder is \(O(D)=o(X/\log z)\). Since

\[
s=\frac{\log D}{\log z}\ge3-o(1),
\]

the lower linear-sieve function is bounded positively—the explicit formula in \(2<s\le4\) is

\[
f(s)=\frac{2e^\gamma}{s}\log(s-1)>0,
\]

while the upper sieve function is bounded. Finally,

\[
\prod_{p\le z}\left(1-\frac1p\right)\asymp\frac1{\log z}
\]

by Mertens’ theorem. This gives both inequalities in (7).

---

## 4. The rough-root construction: \(h<n^{1/4}\)

Assume

\[
h<n^{1/4}.
\tag{8}
\]

For large \(n\), \(h>20\). Let \(K\) be the set of integers \(m\) satisfying

\[
Y<m\le\frac n5,
\qquad
P^{-}(m)>h.
\tag{9}
\]

We may restrict \(K\) to the union of the dyadic intervals used below.

### 4.1. Every \(m\in K\) is in \(M_0\)

Because \(m\) is \(h\)-rough, every proper divisor \(d\mid m\) satisfies

\[
d\le\frac{m}{P^{-}(m)}
<
\frac{m}{h}
\le
\frac{n}{5h}
<
\frac Y2
\tag{10}
\]

for all sufficiently large \(n\).

By (2), all such proper divisors are already illegal. Also, no selected member of \(S_Y\subset(Y/2,Y]\) divides \(m\), by the same bound, and \(m>Y\) cannot divide a member of \(S_Y\). Thus \(m\) is legal and has no legal proper divisor. Since \(m\le n/5<n/2\),

\[
m\in M_0.
\tag{11}
\]

### 4.2. The carrier \(c_m=2m\) is private

Since \(h>2\), every \(m\in K\) is odd. Every divisor of \(2m\) has the form \(d\) or \(2d\), with \(d\mid m\).

Apart from \(m\) and \(2m\), such a divisor is at most

\[
\frac{2m}{P^{-}(m)}
<
\frac{2n}{5h}
<
\frac Y2.
\tag{12}
\]

Consequently no element of \(S_Y\) divides \(2m\). The optional upper-half prime in (1) is also incomparable with \(2m<n/2\). Hence \(2m\) is legal at \(A_0\).

Among the minimal roots \(M_0\), the only divisor of \(2m\) is \(m\): all the other proper divisors are already illegal, and \(2m\) itself is not minimal because \(m\) is legal. Therefore

\[
\{r\in M_0:r\mid2m\}=\{m\}.
\tag{13}
\]

The carriers \(2m\) are pairwise incomparable. Indeed, if \(m<m'\) and \(2m\mid2m'\), then \(m\mid m'\). The quotient \(m'/m\) is a divisor of the \(h\)-rough integer \(m'\), so either it is \(1\) or it exceeds \(h\). But

\[
1<\frac{m'}m
<
\frac{n/5}{n/h}
=
\frac h5,
\]

a contradiction.

Thus the hypotheses of Lemma 1 are satisfied.

### 4.3. The shadows are disjoint

Suppose

\[
km=k'm'
\tag{14}
\]

for \(m,m'\in K\), with

\[
2\le k\le\left\lfloor\frac{n}{2m}\right\rfloor,
\qquad
2\le k'\le\left\lfloor\frac{n}{2m'}\right\rfloor.
\]

Because \(m,m'>n/h\),

\[
k,k'<\frac h2.
\tag{15}
\]

Every prime factor of \(k,k'\) is therefore less than \(h\), while every prime factor of \(m,m'\) is greater than \(h\). Unique factorization applied to (14) gives

\[
k=k',\qquad m=m'.
\]

Hence the proper shadows of distinct roots in \(K\) are pairwise disjoint, and

\[
F(K)
=
\sum_{m\in K}
\left(\left\lfloor\frac{n}{2m}\right\rfloor-1\right).
\tag{16}
\]

### 4.4. The total shadow is linear

Take disjoint dyadic intervals

\[
(X_j,2X_j],\qquad X_j=2^{j+1}Y,
\]

for all \(j\) such that \(2X_j\le n/5\). Their number is

\[
J=\Theta(\log h).
\tag{17}
\]

Moreover \(X_j\ge2Y\ge h^3\) for large \(n\), because \(h<n^{1/4}\). Lemma 2 shows that every interval contains at least

\[
a\frac{X_j}{\log h}
\]

\(h\)-rough integers. Therefore its contribution to the reciprocal sum is at least

\[
\sum_{\substack{X_j<m\le2X_j\\P^{-}(m)>h}}\frac1m
\ge
\frac{a}{2\log h}.
\]

Summing over \(J=\Theta(\log h)\) intervals gives an absolute constant \(\eta>0\) such that

\[
\sum_{m\in K}\frac1m\ge\eta.
\tag{18}
\]

The upper half of Lemma 2, summed dyadically, gives

\[
|K|=O\!\left(\frac n{\log h}\right)=o(n).
\tag{19}
\]

Let \(N=\lfloor n/2\rfloor\). From (16),

\[
\begin{aligned}
F(K)
&\ge
\sum_{m\in K}\left(\frac Nm-2\right)\\
&=
N\sum_{m\in K}\frac1m-2|K|\\
&\ge
\eta N-o(n).
\end{aligned}
\]

Thus, for some absolute \(c_1>0\),

\[
F(K)\ge c_1n.
\tag{20}
\]

On the other hand,

\[
\max_{m\in K}F(\{m\})
\le
\max_{m\in K}\frac{N}{m}
<
\frac h2
=
o(n).
\tag{21}
\]

Lemma 1 now gives a Prolonger continuation producing an advance-killed set \(B\subseteq K\) with

\[
F(B)\ge \frac{c_1n-o(n)}2\ge\frac{c_1}{3}n
\tag{22}
\]

for large \(n\).

Since \(B\subseteq K_0\),

\[
|\operatorname{Sh}^{-}(K_0)|
\ge F(B)
\ge \frac{c_1}{3}n.
\tag{23}
\]

This works against every first-layer ordering.

---

## 5. The prime-root construction: \(h\ge n^{1/4}\)

Now suppose

\[
h\ge n^{1/4}.
\tag{24}
\]

Then

\[
Y\le n^{3/4}.
\tag{25}
\]

We divide only according to whether the element \(2\) was selected during the peel.

### 5.1. When \(Y\ge4\)

Consider the prime interval

\[
2n^{3/4}<p\le\frac n4.
\tag{26}
\]

Every such prime exceeds \(Y\), so it is legal and minimal at \(A_0\), hence lies in \(M_0\).

Its private carrier is

\[
c_p=2p.
\]

This carrier is at most \(n/2\). Its only nontrivial proper divisors are \(2\) and \(p\). Since \(Y\ge4\), the selected interval \(S_Y\) begins above \(2\), while \(2\) is nevertheless already illegal by (2). Hence \(2p\) is legal, and among \(M_0\) its only divisor is \(p\). Distinct carriers \(2p\) are incomparable.

### 5.2. When \(Y<4\)

Use instead primes

\[
n^{1/4}<p\le n^{1/3}
\tag{27}
\]

and carriers

\[
c_p=p^2.
\]

For large \(n\), these primes exceed every member of the post-peel position. Also,

\[
p^2\le n^{2/3}<\frac n2.
\]

The only nontrivial proper divisor of \(p^2\) is \(p\), so \(p^2\) is legal and has trace exactly \(\{p\}\) on \(M_0\). Distinct prime squares are incomparable.

The optional upper-half prime in \(A_0\) is incomparable with all these roots and carriers.

### 5.3. Choose a constant-reciprocal-mass subfamily

Mertens’ theorem for prime reciprocals gives, in the first case,

\[
\sum_{2n^{3/4}<p\le n/4}\frac1p
=
\log\frac43+o(1),
\tag{28}
\]

and in the second case,

\[
\sum_{n^{1/4}<p\le n^{1/3}}\frac1p
=
\log\frac43+o(1).
\tag{29}
\]

Fix, for example,

\[
\sigma=\frac1{10}.
\]

Choose primes successively from the relevant interval until their reciprocal sum first exceeds \(\sigma\). Let \(K\) be the resulting family and put

\[
s:=\sum_{p\in K}\frac1p.
\]

Because every individual reciprocal tends to zero,

\[
s=\sigma+o(1).
\tag{30}
\]

Also \(|K|=o(n)\).

### 5.4. Bonferroni gives a linear shadow

For \(p\in K\), let

\[
U_p:=\{p,2p,\ldots,\lfloor N/p\rfloor p\},
\qquad N=\lfloor n/2\rfloor.
\]

Second-order Bonferroni gives

\[
\begin{aligned}
\left|\bigcup_{p\in K}U_p\right|
&\ge
\sum_{p\in K}\left\lfloor\frac Np\right\rfloor
-
\sum_{\substack{p,q\in K\\p<q}}
\left\lfloor\frac N{pq}\right\rfloor\\
&\ge
Ns-|K|
-
N\sum_{p<q}\frac1{pq}\\
&\ge
Ns-|K|-\frac N2s^2.
\end{aligned}
\tag{31}
\]

Passing from \(U_p\) to the proper shadow merely removes the distinct primes \(p\), so

\[
F(K)
\ge
N\left(s-\frac{s^2}{2}\right)-2|K|.
\tag{32}
\]

Using \(s=1/10+o(1)\) and \(|K|=o(n)\), we obtain an absolute \(c_2>0\) such that

\[
F(K)\ge c_2n.
\tag{33}
\]

The largest individual shadow is sublinear. In the first case,

\[
\max_{p\in K}F(\{p\})
\le
\frac{n}{4n^{3/4}}
=O(n^{1/4}),
\tag{34}
\]

while in the second,

\[
\max_{p\in K}F(\{p\})
\le
\frac12n^{3/4}.
\tag{35}
\]

Thus in both cases the quantity \(b\) from Lemma 1 is \(o(n)\). The lemma produces \(B\subseteq K_0\) such that

\[
|\operatorname{Sh}^{-}(K_0)|
\ge F(B)
\ge \frac{c_2n-o(n)}2
\ge\frac{c_2}{3}n.
\tag{36}
\]

Again, this holds against every ordering.

---

## 6. Negation of (OS)

Let

\[
\varepsilon:=\frac13\min\{c_1,c_2\}>0.
\]

For every proposed \(H(n)\to\infty\), every sufficiently large \(n\) is in exactly one of the two regimes:

\[
H(n)<n^{1/4}
\qquad\text{or}\qquad
H(n)\ge n^{1/4}.
\]

In the first regime, the rough-root construction gives an obtainable \(A_0\) satisfying

\[
\forall\text{ orderings of }M_0\quad
\exists\text{ legal Prolonger continuation}\quad
|\operatorname{Sh}^{-}(K_0)|\ge\varepsilon n.
\]

The prime-root construction gives the same conclusion in the second regime. Hence

\[
\boxed{
\forall H(n)\to\infty,\ 
\exists A_0\text{ obtainable after Phase 0},\
\forall\prec,\
\exists\text{ Prolonger continuation}:
|\operatorname{Sh}^{-}(K_0)|\ge\varepsilon n.
}
\tag{37}
\]

This is precisely the strong negation of (OS).

Since

\[
|\operatorname{Sh}^{-}(K_0)|
\le
\sum_{m\in K_0}
\left(\left\lfloor\frac{n}{2m}\right\rfloor-1\right),
\]

the same construction also disproves (WOS).

---

## 7. What failed in the formulation

The one-sweep containment theorem in the attachment is correct:

\[
\bigcup_{\ell\ge1}M_\ell
\subseteq
\operatorname{Sh}^{-}(K_0).
\]

The proof correctly uses monotonicity of legality, the fact that an exactly selected minimum blocks every later multiple, and the pairwise disjointness of successive minimal layers.

The failure is the attempted converse philosophy. A linear **raw** proper-multiple shadow can be created in the first sweep by a family of roots with private, pairwise-incomparable carriers, regardless of Shortener’s ordering. But the carriers themselves may simultaneously make large portions of that raw shadow illegal. Therefore

\[
|\operatorname{Sh}^{-}(K_0)|\gg n
\]

does not imply that linearly many descendants survive into later minimal layers.

Thus (OS) does not collapse to the full primitive-set game problem. Rather, it is an excessively strong sufficient condition: it forbids linear potential shadow even when much of that shadow is already blocked or is destroyed by the very moves creating \(K_0\).

\[
\boxed{\text{(OS) and (WOS) are unconditionally false.}}
\]

Report: a single verdict with decisive reasoning, then your assessment of each numbered check. REMEMBER: your value is in finding real errors, not in summarizing.
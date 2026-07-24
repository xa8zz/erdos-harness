Don't search the internet. You are refereeing a submitted manuscript that
claims to resolve an open problem. Your job is to find errors — not to
summarize, not to improve exposition. Assume the author is competent and
adversarially check every load-bearing step anyway. A wrong acceptance is
far more costly than a wrong rejection.

## The problem being claimed

Two players alternately pick integers from {2, 3, ..., n}, never picking an
integer that divides or is divisible by an already-picked integer; the game
ends when the picked set is a maximal antichain under divisibility.
Prolonger moves first and wants to maximize the total number of moves L(n)
made by both players; Shortener wants to minimize it. Both play optimally.
The manuscript claims a full unconditional proof that L(n) = o(n).

## Referee duties

Verify or refute, with specifics, at minimum each of the following:
(a) the definition of the robust game V_b(N) and the claim L(n) <= V_1(n),
including the roles of passes, the b opening moves, the allied free
erasures of upsets, and whether the sup/inf structure of the definition
supports every later use;
(b) whether the bound "total selections inside an active cone <=
V_{b+1}(q_t)" is valid given that external selections and erasures arrive
adversarially timed during the local game, and whether Shortener's optimal
local strategy is globally implementable;
(c) the drafting/pairing argument (4.1): does every post-opening cone
activation after the first really pair injectively with an earlier
Shortener sweep of at least equal weight — including the edge cases where a
sweep is unavailable because no live unprocessed root remains, and where
roots die as collateral between sweeps;
(d) the projection claims (3.12)-(3.14): that external selections kill
exactly a principal upset of the quotient and that cone-internal play is
exactly the robust game on the quotient downset;
(e) Lemma 3.1 and the disjointness/incomparability of root cones, and the
covering claim (3.7);
(f) Lemmas 2.1, 2.2, 2.3: the sieve bound, the K-dense density bound with
kappa = c0 log c0 - c0 + 1, c0 = 1/log 2, and the exceptional-set estimate,
including all constants and ranges;
(g) the passage to the limit in Section 5: the order of limits N -> infty
then A -> infty, the parameter schedule delta = A^{-2}, K = ceil(e^{A^3}),
the claim M_{b+1}(A) -> c_{b+1}, and the legitimacy of the telescoping
c_1 <= 2^{-r} c_{r+1} given that the inequality was derived for each fixed
b separately;
(h) the final bookkeeping (4.7): that every selection by either player in
the robust game falls into exactly one of the three counted classes;
(i) any unstated assumption anywhere (about D, about who moves when, about
ties, about the game ending, about 1 belonging to the board).

For each item: VALID, or FLAW(minor/major/fatal) with the precise line of
failure and, if you can, a counterexample configuration.

End with a verdict: ACCEPT / ACCEPT AFTER MINOR FIXES (list them) /
REJECT (fatal flaw, identify it). Do not grade on style.

## The manuscript

# Theorem

\[
\boxed{L(n)=o(n).}
\]

The multipartite packet theorem rules out an additive rank-by-rank argument, but it also points toward the correct replacement. One should not charge the many divisors deleted by a vehicle separately. Instead, almost every integer can be placed in a **quotient cone**
\[
t\{1,2,\ldots,\lfloor n/t\rfloor\},
\]
where the tags \(t\) are so rough that their minimal cones are pairwise noninteracting. Shortener greedily fires roughly half of those cones. Every cone Prolonger saves is a copy of the original game on a sublinear-sized quotient board, with only one extra move of initiative.

This yields a recursive density inequality
\[
c_b\le \frac12c_{b+1},
\]
where \(c_b\) is the upper density of a strengthened game in which Prolonger receives \(b\) opening moves and may adversarially erase divisibility-upsets. Since \(c_b\le1\), iteration forces \(c_1=0\).

The proof follows.

---

## 1. A robust envelope of the game

Write
\[
[N]=\{1,2,\ldots,N\}.
\]

A subset \(D\subseteq[N]\) is a divisibility downset if
\[
x\in D,\quad y\mid x
\quad\Longrightarrow\quad
y\in D.
\]

For an integer \(b\ge1\), define the following strengthened game on a downset \(D\).

1. Prolonger may make up to \(b\) legal selections before Shortener’s first selection.
2. Thereafter the two players alternate.
3. After the opening phase, Prolonger may pass.
4. An auxiliary adversary allied with Prolonger may, at any time, erase for free an arbitrary divisibility-upset \(U\subseteq D\): thus
   \[
   u\in U,\quad u\mid v\in D
   \quad\Longrightarrow\quad
   v\in U.
   \]
   Erased vertices cannot subsequently be selected.
5. Ordinary selections still kill all comparable live vertices, and only actual selections count toward the length.

Let \(V_b(N)\) be the maximum, over all downsets \(D\subseteq[N]\), of the minimax length of this robust game.

Plainly,
\[
0\le V_b(N)\le N. \tag{1.1}
\]

The original game is dominated by \(V_1\). Indeed, use \(D=[n]\). Prolonger chooses some \(x\ge2\) as the one opening move and never uses a pass or a free erasure. The selection of \(x\) kills \(1\), and from then onward the position on \(\{2,\ldots,n\}\) is exactly the original position after the move \(x\). Therefore
\[
L(n)\le V_1(n). \tag{1.2}
\]

It is consequently enough to prove
\[
V_1(N)=o(N).
\]

Set
\[
c_b=\limsup_{N\to\infty}\frac{V_b(N)}N.
\]
Our objective will be the recursive inequality
\[
c_b\le\frac12c_{b+1}. \tag{1.3}
\]

---

# 2. The arithmetic decomposition

For \(m>1\), let \(P^-(m)\) denote its least prime factor, and put
\[
P^-(1)=\infty.
\]

We first record the only sieve estimate needed.

## Lemma 2.1: Rough-number bound

Uniformly for \(X\ge2\) and \(z\ge2\),
\[
\Phi(X,z)
:=
\#\{m\le X:P^-(m)>z\}
\ll \frac{X}{\log z}+1. \tag{2.1}
\]

### Proof

It suffices to consider \(z\le X\). Put
\[
R=X^{1/6},
\qquad
z_0=\min(z,R),
\qquad
P=\prod_{p\le z_0}p.
\]

Let \(\mathcal D\) be the downward-closed family of squarefree integers \(d\le R\) all of whose prime factors divide \(P\), and set
\[
G=\sum_{d\in\mathcal D}\frac1{\varphi(d)}.
\]

For \(r\in\mathcal D\), define
\[
y_r=\frac{\mu(r)}{\varphi(r)G},
\]
and for \(d\in\mathcal D\) define the Selberg weights
\[
\lambda_d
=
d\sum_{\substack{r\in\mathcal D\\d\mid r}}
\mu(r/d)y_r.
\]

Möbius inversion gives
\[
\sum_{\substack{d\in\mathcal D\\q\mid d}}
\frac{\lambda_d}{d}=y_q,
\]
and in particular
\[
\lambda_1=\sum_{r\in\mathcal D}\mu(r)y_r=1.
\]

Hence
\[
1_{(m,P)=1}
\le
\left(\sum_{\substack{d\in\mathcal D\\d\mid m}}\lambda_d\right)^2.
\]

Summing over \(m\le X\),
\[
\begin{aligned}
\#\{m\le X:(m,P)=1\}
&\le
\sum_{d,e\in\mathcal D}
\lambda_d\lambda_e
\left\lfloor\frac X{[d,e]}\right\rfloor\\
&=
X\sum_{d,e\in\mathcal D}
\frac{\lambda_d\lambda_e}{[d,e]}
+
O\!\left(\left(\sum_{d\in\mathcal D}|\lambda_d|\right)^2\right).
\end{aligned}
\]

Using
\[
(d,e)=\sum_{q\mid d,e}\varphi(q),
\]
the main quadratic form diagonalizes:
\[
\begin{aligned}
\sum_{d,e}\frac{\lambda_d\lambda_e}{[d,e]}
&=
\sum_q\varphi(q)
\left(
\sum_{q\mid d}\frac{\lambda_d}{d}
\right)^2\\
&=
\sum_q\varphi(q)y_q^2
=
\frac1G.
\end{aligned}
\]

Also,
\[
\begin{aligned}
\sum_d|\lambda_d|
&\le
\frac1G
\sum_d d
\sum_{\substack{r\in\mathcal D\\d\mid r}}\frac1{\varphi(r)}\\
&=
\frac1G
\sum_{r\in\mathcal D}\frac{\sigma(r)}{\varphi(r)}
\ll R(\log R)^C
\end{aligned}
\]
for an absolute \(C\), since for squarefree \(r\),
\[
\frac{\sigma(r)}{\varphi(r)}
=
\prod_{p\mid r}\frac{p+1}{p-1}
\ll (\log R)^C.
\]

Finally,
\[
G
\ge
\sum_{\substack{d\le z_0\\d\ {\rm squarefree}}}\frac1d
\gg\log z_0.
\]
For completeness, the last estimate follows because the number of squarefree integers up to \(u\) is at least \(cu\): every nonsquarefree integer is divisible by some \(d^2\), \(d\ge2\), and
\[
\sum_{d\ge2}\frac1{d^2}<1.
\]
Partial summation then gives the logarithm.

Thus
\[
\#\{m\le X:(m,P)=1\}
\ll
\frac X{\log z_0}+X^{1/3}(\log X)^C.
\]

If \(z\le R\), then \(z_0=z\). If \(z>R\), then
\[
\log z_0=\frac16\log X\ge\frac16\log z.
\]
The error term is \(O(X/\log z)\) for sufficiently large \(X\). Since every \(z\)-rough integer is coprime to \(P\), (2.1) follows. ∎

---

## 2.2. The first large prime-factor jump

Fix \(K>2\).

For \(x\ge2\), write its prime factors with multiplicity as
\[
p_1\le p_2\le\cdots\le p_r.
\]

Let \(j\) be maximal such that
\[
p_i\le Kp_1p_2\cdots p_{i-1}
\qquad(1\le i\le j), \tag{2.2}
\]
where the empty product is \(1\).

Define
\[
a_K(x)=p_1p_2\cdots p_j,
\qquad
t_K(x)=\frac{x}{a_K(x)}.
\]

If already \(p_1>K\), then \(j=0\) and \(a_K(x)=1\).

The integer \(a=a_K(x)\) is the maximal initial factor block whose successive prime factors grow by at most a factor \(K\) relative to the accumulated product. If \(t=t_K(x)>1\), maximality gives
\[
P^-(t)>Ka. \tag{2.3}
\]

Call an integer \(a\) **\(K\)-dense** if all of its ordered prime factors satisfy (2.2). Every \(a_K(x)\) is \(K\)-dense.

We need the fact that large \(K\)-dense integers have density zero.

## Lemma 2.2: Sparse dense components

For every fixed \(K>2\), there exists \(\kappa>0\) such that
\[
D_K(X)
:=
\#\{a\le X:a\text{ is }K\text{-dense}\}
\ll_K
\frac{X}{(\log X)^\kappa}. \tag{2.4}
\]

### Proof

Suppose \(a\) is \(K\)-dense and
\[
\Omega(a)=r.
\]
Writing \(a_i=p_1\cdots p_i\), condition (2.2) gives
\[
a_i\le K a_{i-1}^2.
\]
Induction yields
\[
a_i\le K^{2^i-1}. \tag{2.5}
\]

Consequently, if
\[
\sqrt X<a\le X,
\]
then
\[
\Omega(a)
\ge
\frac1{\log2}\log\log X-O_K(1). \tag{2.6}
\]

Put
\[
c_0=\frac1{\log2};
\]
notice that
\[
1<c_0<2.
\]

For fixed \(1<z<2\), the standard multiplicative-moment estimate is
\[
\sum_{m\le X}z^{\Omega(m)}
\ll_z X(\log X)^{z-1}. \tag{2.7}
\]

Indeed, define the nonnegative multiplicative function \(h\) by
\[
h(p^e)=(z-1)z^{e-1}.
\]
Then
\[
z^{\Omega(m)}=\sum_{d\mid m}h(d),
\]
and therefore
\[
\begin{aligned}
\sum_{m\le X}z^{\Omega(m)}
&\le
X\prod_{p\le X}
\left(
1+\sum_{e\ge1}\frac{(z-1)z^{e-1}}{p^e}
\right)\\
&=
X\prod_{p\le X}
\left(1+\frac{z-1}{p-z}\right).
\end{aligned}
\]
Since
\[
\log\left(1+\frac{z-1}{p-z}\right)
=
\frac{z-1}{p}+O_z(p^{-2}),
\]
Mertens’ estimate
\[
\sum_{p\le X}\frac1p=\log\log X+O(1)
\]
gives (2.7).

Apply (2.7) with \(z=c_0\). By (2.6), the number of \(K\)-dense \(a\in(\sqrt X,X]\) is at most
\[
\begin{aligned}
c_0^{O_K(1)}
c_0^{-c_0\log\log X}
\sum_{m\le X}c_0^{\Omega(m)}
&\ll_K
X(\log X)^{c_0-1-c_0\log c_0}\\
&=
\frac{X}{(\log X)^\kappa},
\end{aligned}
\]
where
\[
\kappa=c_0\log c_0-c_0+1>0.
\]
The integers \(a\le\sqrt X\) contribute only \(O(\sqrt X)\). ∎

---

## 2.3. Almost every integer has a medium component

Fix
\[
0<\delta<1,\qquad A\ge2,\qquad 0<\gamma<1.
\]

Call \(x\le N\) **useful** if
\[
x>\delta N
\quad\text{and}\quad
A<a_K(x)\le N^\gamma. \tag{2.8}
\]

For sufficiently large \(N\), a useful \(x\) automatically has \(t_K(x)>1\), because otherwise
\[
x=a_K(x)\le N^\gamma<\delta N.
\]

Let \(\mathcal E_N\) be the exceptional set of non-useful integers.

## Lemma 2.3: Exceptional-set estimate

For fixed \(A,K,\delta,\gamma\),
\[
|\mathcal E_N|
\le
\left(
\delta+
C\frac{1+\log A}{\log K}
\right)N
+o_{A,K,\delta,\gamma}(N), \tag{2.9}
\]
where \(C\) is absolute.

### Proof

The integers \(x\le\delta N\) contribute at most \(\delta N\).

Suppose next that
\[
a=a_K(x)\le A.
\]
Writing \(x=at\), relation (2.3) says
\[
P^-(t)>Ka.
\]
Therefore Lemma 2.1 gives
\[
\begin{aligned}
\#\{x\le N:a_K(x)\le A\}
&\le
\sum_{a\le A}\Phi(N/a,Ka)\\
&\ll
N\sum_{a\le A}\frac1{a\log(Ka)}+O(A)\\
&\ll
N\frac{1+\log A}{\log K}+O(A).
\end{aligned} \tag{2.10}
\]

It remains to count \(x\) for which
\[
a=a_K(x)>N^\gamma.
\]
Every such \(a\) is \(K\)-dense.

First consider
\[
N^\gamma<a\le\sqrt{N/K}.
\]
Then \(Ka\le N/a\), so Lemma 2.1 gives
\[
\Phi(N/a,Ka)
\ll
\frac{N}{a\log(Ka)}+1.
\]
Since \(a>N^\gamma\),
\[
\log(Ka)\ge\gamma\log N.
\]
By Lemma 2.2 and partial summation,
\[
\sum_{\substack{a>N^\gamma\\a\ K\text{-dense}}}\frac1a
\ll_K
(\log N)^{1-\kappa}.
\]
Hence the number of corresponding \(x\) is
\[
\ll_K
\frac N{\log N}(\log N)^{1-\kappa}
+D_K(N)
=o(N). \tag{2.11}
\]

Finally, if
\[
a>\sqrt{N/K},
\]
then
\[
Ka>\frac Na.
\]
If \(t>1\), then
\[
P^-(t)>Ka>\frac Na\ge t,
\]
which is impossible. Thus \(t=1\), and \(x=a\) itself is \(K\)-dense. Lemma 2.2 again gives \(o(N)\) possibilities.

Combining these estimates proves (2.9). ∎

---

# 3. Self-rough tags and disjoint cones

Let
\[
x=a t
\]
be useful, where
\[
a=a_K(x),\qquad t=t_K(x).
\]

Define the quotient scale
\[
\nu_t=\frac Nt.
\]

Since
\[
\delta N<x=at\le N,
\]
we have
\[
a\le\nu_t<\frac a\delta. \tag{3.1}
\]
Therefore
\[
A<\nu_t\le\frac{N^\gamma}{\delta}. \tag{3.2}
\]

Moreover, by (2.3) and (3.1),
\[
P^-(t)>Ka>K\delta\,\nu_t. \tag{3.3}
\]

Choose the parameters so that
\[
H:=K\delta>1. \tag{3.4}
\]

Thus every useful tag satisfies the **self-roughness condition**
\[
P^-(t)>H\frac Nt. \tag{3.5}
\]

This condition forces a strong laminarity property.

## Lemma 3.1: Self-rough tags with a common multiple are nested

Suppose \(s,t\le N\) satisfy
\[
P^-(s)>H\frac Ns,
\qquad
P^-(t)>H\frac Nt
\]
for some \(H>1\).

If
\[
\operatorname{lcm}(s,t)\le N,
\]
then \(s\mid t\) or \(t\mid s\).

### Proof

Put
\[
\nu_t=\frac Nt,\qquad \nu_s=\frac Ns,
\]
and suppose without loss of generality that
\[
\nu_t\ge\nu_s.
\]

Assume \(t\nmid s\). Then some prime \(p\) occurs to a higher exponent in \(t\) than in \(s\). In particular,
\[
p\ge P^-(t)>H\nu_t.
\]
Thus
\[
\operatorname{lcm}(s,t)\ge sp
>
\frac N{\nu_s}H\nu_t
\ge HN>N,
\]
a contradiction. Therefore \(t\mid s\). ∎

---

## 3.2. Minimal tags

Now fix an arbitrary initial downset \(D\subseteq[N]\). Let \(\mathcal T\) be the set of tags \(t_K(x)\) arising from useful \(x\in D\).

Because \(t\mid x\) and \(D\) is a downset, every \(t\in\mathcal T\) belongs to \(D\).

Let \(\mathcal R\) be the set of divisibility-minimal elements of \(\mathcal T\). Call these the **root tags**.

For \(t\in\mathcal R\), define its full cone
\[
C_t
=
\{t,2t,\ldots,q_t t\},
\qquad
q_t=\left\lfloor\frac Nt\right\rfloor. \tag{3.6}
\]

Distinct root tags have no common multiple at most \(N\). Indeed, if
\[
\operatorname{lcm}(s,t)\le N,
\]
Lemma 3.1 says they are comparable, contradicting minimality.

Consequently:

1. the cones \(C_t\), \(t\in\mathcal R\), are pairwise disjoint;
2. no vertex of one root cone is comparable with a vertex of another root cone;
3. every useful \(x\in D\) lies in some root cone.

For the third point, the tag \(t_K(x)\) is divisible by some minimal tag \(r\in\mathcal R\), and hence \(r\mid x\).

Thus
\[
D\setminus\bigcup_{t\in\mathcal R}C_t
\subseteq \mathcal E_N. \tag{3.7}
\]

The cone weights satisfy useful global bounds. Put
\[
\nu_t=\frac Nt.
\]
From (3.2),
\[
A<\nu_t\le\frac{N^\gamma}{\delta}. \tag{3.8}
\]
Since \(A\) is an integer,
\[
q_t=\lfloor\nu_t\rfloor\ge A.
\]

Because the cones are disjoint,
\[
\sum_{t\in\mathcal R}q_t\le N. \tag{3.9}
\]
It follows that
\[
|\mathcal R|\le\frac NA \tag{3.10}
\]
and
\[
\sum_{t\in\mathcal R}\nu_t
\le
\sum_t(q_t+1)
\le
N+\frac NA. \tag{3.11}
\]

---

## 3.3. Exact projection of external moves

The reason for introducing free upset erasures in the robust game is the following exact fact.

Fix a root cone \(C_t\), and let \(r\notin C_t\). Suppose \(r\) is comparable with some \(tm\in C_t\).

It is impossible that
\[
tm\mid r,
\]
because then \(t\mid r\), and \(r\le N\) would imply \(r\in C_t\).

Therefore
\[
r\mid tm.
\]

Write
\[
g=(r,t),\qquad r=gq,\qquad t=gs,\qquad (q,s)=1.
\]
Then
\[
r\mid tm
\quad\Longleftrightarrow\quad
q\mid m. \tag{3.12}
\]

Hence an external selection \(r\) kills inside \(C_t\) exactly a principal upset of the quotient board:
\[
\{m\le q_t:q\mid m\}.
\]

Likewise, the intersection of any globally erased upset with \(C_t\) becomes an upset in the quotient.

Finally, inside one cone,
\[
tm_1\mid tm_2
\quad\Longleftrightarrow\quad
m_1\mid m_2. \tag{3.13}
\]

Thus, after division by \(t\), play inside \(C_t\cap D\) is exactly a robust divisibility game on the downset
\[
D_t=\{m\le q_t:tm\in D\}. \tag{3.14}
\]

This remains true under arbitrary moves and erasures outside the cone.

---

# 4. Shortener’s root-cone sweep

Fix \(b\ge1\). We now give a Shortener strategy in the robust \(b\)-opening game.

Order the root tags by decreasing weight
\[
\nu_t=\frac Nt.
\]

Each root cone is assigned one of three states:

- **unprocessed**;
- **active**, if Prolonger has selected a vertex in it;
- **cleared**, if Shortener has selected its root tag.

During Prolonger’s opening block, every cone he enters is marked active. At most \(b\) cones become active this way.

After the opening block, Shortener plays as follows.

### Response rule

If Prolonger has just moved in an already active cone, Shortener responds there according to an optimal local robust strategy, after division by its tag.

Otherwise, Shortener performs a **root sweep**:

1. scan the unprocessed roots in decreasing order of \(\nu_t\);
2. discard any root whose entire cone has already died or been erased;
3. play the first remaining live root tag \(t\).

Playing \(t\) kills every remaining vertex of \(C_t\), so that cone is cleared in one move.

If Prolonger has just entered an unprocessed cone, that cone is first marked active and omitted from the sweep.

If no unprocessed live root remains, Shortener continues the active local games, treating a global Prolonger move elsewhere as a local pass when necessary.

---

## 4.1. Why an unprocessed dead root has a dead cone

Suppose an unprocessed root tag \(t\) is no longer live.

If it was erased by an upset, every multiple \(tm\in D\) was erased as well.

Otherwise it was killed by a selected comparable integer \(r\). If
\[
t\mid r,
\]
then \(r\in C_t\), so the cone would already be active. Since the root is unprocessed, this has not happened.

Therefore
\[
r\mid t.
\]
But then \(r\mid tm\) for every \(m\), so the entire cone is dead.

Hence discarding such a root loses no subsequent moves.

---

## 4.2. The drafting inequality

Let \(\mathcal A\) be the set of root cones that Prolonger activates, and let \(\mathcal C\) be the set of roots Shortener fires.

Put
\[
W_{\mathcal A}=\sum_{t\in\mathcal A}\nu_t,
\qquad
W_{\mathcal C}=\sum_{t\in\mathcal C}\nu_t,
\qquad
\nu_{\max}=\max_{t\in\mathcal R}\nu_t.
\]

There are at most \(b\) unpaired activations during the initial opening block.

Afterward, consider the successive new activations by Prolonger. Shortener sweeps immediately after each such activation unless no live unprocessed root remains. A future root that Prolonger later activates was already live and unprocessed at every earlier sweep: legality and availability only decrease. Hence the root taken by Shortener at an earlier sweep has weight at least that of the next future activation.

Thus every post-opening activation except possibly the first is paired with an earlier Shortener sweep of at least the same weight. We obtain
\[
W_{\mathcal A}
\le
W_{\mathcal C}+(b+1)\nu_{\max}. \tag{4.1}
\]

Since \(\mathcal C\subseteq\mathcal R\setminus\mathcal A\),
\[
W_{\mathcal C}
\le
\sum_{t\in\mathcal R}\nu_t-W_{\mathcal A}.
\]
Therefore
\[
2W_{\mathcal A}
\le
\sum_{t\in\mathcal R}\nu_t+(b+1)\nu_{\max}.
\]

Using (3.8) and (3.11),
\[
W_{\mathcal A}
\le
\frac12
\left(
N+\frac NA+(b+1)\frac{N^\gamma}{\delta}
\right). \tag{4.2}
\]

This is the global halving step.

---

## 4.3. Each active cone is a smaller robust game

Consider an active cone \(C_t\).

During the global opening block, it can receive at most \(b\) Prolonger selections. After global alternation starts, it can receive at most one further Prolonger selection before Shortener’s first local response: whenever Prolonger subsequently returns to an active cone, Shortener responds there immediately.

Therefore, after quotienting by \(t\), the projected local play is a valid robust game with at most
\[
b+1
\]
opening Prolonger moves.

Moves elsewhere project to pauses or Prolonger passes. External selections and global free erasures project, by (3.12), to permitted quotient-upset erasures.

Consequently, the total number of selected vertices in \(C_t\) is at most
\[
V_{b+1}(q_t). \tag{4.3}
\]

Define the tail density
\[
M_b(A)=\sup_{m\ge A}\frac{V_b(m)}m. \tag{4.4}
\]

Since \(q_t\ge A\),
\[
V_{b+1}(q_t)\le M_{b+1}(A)q_t.
\]
Also \(q_t\le\nu_t\), so by (4.2),
\[
\sum_{t\in\mathcal A}V_{b+1}(q_t)
\le
M_{b+1}(A)
\frac12
\left(
N+\frac NA+(b+1)\frac{N^\gamma}{\delta}
\right). \tag{4.5}
\]

---

## 4.4. Counting every move

Every selected vertex belongs to exactly one of the following classes:

1. a vertex in an active cone;
2. a root tag fired by Shortener;
3. a vertex outside all root cones.

The first class is bounded by (4.5).

The number of fired root tags is at most
\[
|\mathcal R|\le\frac NA. \tag{4.6}
\]

By (3.7), all selected vertices outside the root cones belong to \(\mathcal E_N\).

Therefore
\[
\boxed{
\begin{aligned}
V_b(N)
\le\;&
|\mathcal E_N|+\frac NA\\
&+
\frac{M_{b+1}(A)}2
\left(
N+\frac NA+(b+1)\frac{N^\gamma}{\delta}
\right).
\end{aligned}
} \tag{4.7}
\]

This inequality holds uniformly over

- the initial downset \(D\);
- Prolonger’s strategy;
- every adaptive sequence of free upset erasures.

---

# 5. The density recursion

Divide (4.7) by \(N\), use Lemma 2.3, and let \(N\to\infty\), keeping \(A,K,\delta,\gamma,b\) fixed.

Because \(\gamma<1\),
\[
N^{\gamma-1}\longrightarrow0.
\]

Hence
\[
c_b
\le
\delta
+
C\frac{1+\log A}{\log K}
+
\frac1A
+
\frac12\left(1+\frac1A\right)M_{b+1}(A). \tag{5.1}
\]

Now let \(A\to\infty\), choosing, for example,
\[
\delta=A^{-2},
\qquad
K=\left\lceil e^{A^3}\right\rceil.
\]
Then
\[
K\delta>1,
\]
and
\[
\delta+
C\frac{1+\log A}{\log K}
+\frac1A
\longrightarrow0.
\]

Moreover,
\[
M_{b+1}(A)
=
\sup_{m\ge A}\frac{V_{b+1}(m)}m
\longrightarrow
\limsup_{m\to\infty}\frac{V_{b+1}(m)}m
=
c_{b+1}.
\]

Thus (5.1) gives
\[
\boxed{c_b\le\frac12c_{b+1}.} \tag{5.2}
\]

But \(V_b(N)\le N\), so
\[
0\le c_b\le1.
\]
Iterating (5.2), for every \(r\ge1\),
\[
0\le c_1
\le
2^{-r}c_{r+1}
\le
2^{-r}.
\]
Letting \(r\to\infty\),
\[
c_1=0.
\]

Therefore
\[
V_1(N)=o(N).
\]
Finally, by (1.2),
\[
\boxed{L(n)=o(n).}
\]

---

# 6. How this resolves the packet obstruction

The argument does not assert that a packet’s rank-\(j\) deletion mass is small. The multipartite construction proves that such an assertion is false.

Instead, it proves a geometric localization statement.

Suppose useful targets \(y_1,\ldots,y_k\) are all divisors of a single vehicle \(X\le N\). If \(y_i\in C_{t_i}\), then
\[
t_i\mid y_i\mid X.
\]
Thus \(X\) is a common multiple of all the root tags \(t_i\). Distinct root tags have no common multiple at most \(N\), so
\[
t_1=t_2=\cdots=t_k.
\]

Hence:

\[
\boxed{\text{Every useful packet carried by one legal vehicle lies inside one root cone.}}
\]

A packet may have enormous internal tensor mass, and its lower faces may all be dead. But saving that packet activates only one cone. While Prolonger activates cones, Shortener greedily fires other cones of at least comparable quotient size. The total active cone mass is at most one half of the ambient mass, up to \(o(N)\).

Inside an active cone, packet behavior can recur without any additive loss. That is why the local game is not estimated by a divisor-mass potential; it is replaced by the entire strengthened game \(V_{b+1}(q_t)\). The quotient size satisfies
\[
q_t\le \frac{N^\gamma}{\delta}=o(N),
\]
and the price of deferring Shortener’s first local response is only one additional opening move. Repeating this produces the factor \(1/2\) at every recursive level.

Thus the answers to the three alternatives are:

- **Packing:** positive-density tiling is impossible. Almost every target is confined to a root cone, and Prolonger cannot activate root-cone weight faster than Shortener clears it.
- **Pre-emption:** Shortener need not recognize packets or attack their facet blockers. Shortener fires the largest available minimal self-rough tag.
- **Survivor regularity:** after removing \(o(N)\) exceptional integers, the stock is covered by pairwise incomparable self-rough cones; unprotected cones are killed in one root move, and the protected cones reproduce the same robust game on sublinear quotient boards.

The bookkeeping issue concerning interior selections is also automatically resolved: the proof bounds the **total number of selections**, both interior and top-half, by \(o(n)\).
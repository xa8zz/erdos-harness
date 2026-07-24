---
id: R179-lean-verified-manuscript
type: synthesis
date: 2026-07-24
intent: >
  Produce the final self-contained divisor-antichain manuscript after formal
  verification exposed two additional strategy-scheduling ambiguities and one
  provenance ambiguity, none of which changes a numerical estimate.
predecessors: [R177-repaired-manuscript, V178-lean-r177-partial-verification]
action:
  kind: supersedes
  target: R177-repaired-manuscript
claim: >
  The robust-game proof yields L(n)=o(n); the total Shortener policy uses the
  first response clause that supplies a legal move, each projected cone trace
  ends its local opening without an illegal pre-response pass, and the three
  counting classes are assigned by strategy provenance.
failure_mechanism: >
  The superseded manuscript did not say how the response rule falls through
  when a Prolonger selection terminates its local cone, allowed an inserted
  local Prolonger pass before the first local Shortener selection even though
  ending the opening already schedules Shortener, and described fired roots
  numerically rather than by the root-sweep action that selected them.
verifiers_at_time:
  - [lean-4.28-local, confirms-tier1]
confidence_at_time: high
strategy_dependence: independent
prompt: erdos-872/prompts/codex-R179-tier1-verification.md
---

# Theorem

For an integer \(n\ge 2\), the **divisor-antichain game** is played on

\[
\{2,3,\ldots,n\}.
\]

Prolonger and Shortener alternately select previously unselected integers, with Prolonger moving first, subject to the rule that the selected integers must remain an antichain under divisibility. Equivalently, a vertex is legal exactly when it is incomparable under divisibility with every earlier selection. The game ends when no legal vertex remains, so the selected set is a maximal divisibility antichain. Prolonger maximizes the total number of selections and Shortener minimizes it. Let \(L(n)\) denote the backward-induction value of this finite perfect-information game.

Then

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
Every nonempty divisibility downset contains \(1\). This is intended. The empty downset is also allowed and will have value zero.

Fix an integer \(b\ge1\) and a downset \(D\subseteq[N]\). We define a finite extensive-form game of perfect information. A position records the set \(S\subseteq D\) of vertices already selected, the set of vertices erased by the erasure actor, the current phase, and the scheduled player. The currently live legal vertices are the unselected, unerased vertices of \(D\) that are incomparable under divisibility with every member of \(S\).

Prolonger and the erasure actor jointly maximize the number of actual selections. Shortener minimizes it. All selections, erasures, passes, and the declaration ending the opening are publicly observed before the next decision.

The protocol is as follows.

1. The opening consists of at most \(b\) consecutive legal Prolonger selections, with no intervening Shortener selection. Before each scheduled Prolonger action in the opening, the erasure actor has the erasure opportunity described below. If a live legal vertex remains, Prolonger either selects one or explicitly declares the opening ended. Prolonger must end the opening no later than after his \(b\)-th opening selection.
2. When the opening ends, Shortener is scheduled first. Thereafter Shortener and Prolonger alternate.
3. Before every scheduled player action, including every opening action, the erasure actor may choose any divisibility-upset \(U\subseteq D\) and erase every currently unselected live vertex in \(U\). Thus
   \[
   u\in U,\quad u\mid v\in D
   \quad\Longrightarrow\quad
   v\in U.
   \]
   The erasure actor may choose \(U\) adaptively from the complete preceding history.
4. After the opening, Prolonger may either make a legal selection or pass. Shortener has no pass option: whenever a live legal vertex remains on her scheduled action, she must select one.
5. An ordinary selection is added permanently to \(S\) and blocks every vertex of \(D\) comparable with it. Only actual selections count toward the length. Erasures affect availability only: they never remove an earlier selection from \(S\), undo the blocking effect of an earlier selection, or revive any vertex.
6. The game ends exactly when no live legal vertex remains. In particular, Prolonger cannot prevent termination by passing, because each Prolonger pass is followed either by a Shortener selection or by termination.

Multiple erasures between two actual selections can be replaced, on the realized history, by their union, which is again an upset in the original \(D\). Null erasures may be suppressed. The game tree is finite: every actual selection or nontrivial erasure strictly reduces the finite live state, the opening can end only once, and every Prolonger pass is followed by a Shortener selection unless the game has terminated.

A strategy is a history-dependent rule assigning a legal action at every public history at which its actor moves. Let \(\ell(D;b;\sigma_S,\sigma_P,\sigma_E)\) be the number of actual selections in the resulting play. Define
\[
v_b(D)
=
\inf_{\sigma_S}
\sup_{\sigma_P,\sigma_E}
\ell(D;b;\sigma_S,\sigma_P,\sigma_E),
\]
and
\[
V_b(N)
=
\max_{\substack{D\subseteq[N]\\D\text{ a divisibility downset}}}
v_b(D).
\]
Because the game tree is finite, these are its backward-induction values; in particular, one Shortener strategy attains the bound simultaneously against every adaptive Prolonger strategy and every adaptive erasure strategy.

Plainly,
\[
0\le V_b(N)\le N. \tag{1.1}
\]

The original game is dominated by \(V_1\). Take \(D=[n]\). Prolonger makes one opening selection \(x\ge2\), explicitly ends the opening, uses no erasures, and never passes. The selection of \(x\) kills \(1\), along with exactly the vertices of \([n]\) comparable with \(x\). Thereafter the position on \(\{2,\ldots,n\}\) agrees exactly with the original game after its first move \(x\). Since the robust game only gives the maximizing side additional options,
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

## 2. The arithmetic decomposition

For \(m>1\), let \(P^-(m)\) denote its least prime factor, and put
\[
P^-(1)=\infty.
\]

We first record the only sieve estimate needed.

### Lemma 2.1: Rough-number bound

Uniformly for \(X\ge2\) and \(z\ge2\),
\[
\Phi(X,z)
:=
\#\{m\le X:P^-(m)>z\}
\ll \frac{X}{\log z}+1. \tag{2.1}
\]

#### Proof

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
\sum_{\substack{d\le z_0\\d\text{ squarefree}}}\frac1d
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

If \(z\le R\), then \(z_0=z\). If \(z>R\), then, in the range \(z\le X\) under consideration,
\[
\log z_0=\frac16\log X\ge\frac16\log z.
\]
The error term is \(O(X/\log z)\) for sufficiently large \(X\). Since every \(z\)-rough integer is coprime to \(P\), (2.1) follows. ∎

---

### 2.2. The first large prime-factor jump

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

### Lemma 2.2: Sparse dense components

For every fixed \(K>2\), there exists \(\kappa>0\) such that
\[
D_K(X)
:=
\#\{a\le X:a\text{ is }K\text{-dense}\}
\ll_K
\frac{X}{(\log X)^\kappa}. \tag{2.4}
\]

#### Proof

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

### 2.3. Almost every integer has a medium component

Fix
\[
0<\delta<1,
\qquad
A\in\mathbb N,\quad A\ge2,
\qquad
0<\gamma<1.
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

### Lemma 2.3: Exceptional-set estimate

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

#### Proof

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

## 3. Self-rough tags and disjoint cones

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

### Lemma 3.1: Self-rough tags with a common multiple are nested

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

#### Proof

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

### 3.2. Minimal tags

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
Since \(A\in\mathbb N\),
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

### 3.3. Exact projection of external moves

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

## 4. Shortener’s root-cone sweep

Fix \(b\ge1\). We now give a total Shortener strategy in the robust \(b\)-opening game.

Order the root tags by decreasing weight
\[
\nu_t=\frac Nt,
\]
using an arbitrary fixed deterministic tie-breaking rule. Only weak inequalities between weights will be used.

Each root cone is assigned one of three states:

- **unprocessed**;
- **active**, if Prolonger has selected a vertex in it;
- **cleared**, if Shortener has selected its root tag.

During Prolonger’s opening block, every cone he enters is marked active. At most \(b\) cones become active this way.

After the opening block, Shortener plays as follows.

### Response rule

Shortener applies the following clauses in order and executes the first clause that supplies a legal selection.

If Prolonger has just selected a vertex in an already active cone and that cone's optimal local robust strategy supplies a legal response, Shortener makes that response there, after division by the tag. If the projected local position has instead become terminal, this clause supplies no move and Shortener continues to the next clause.

If the first clause supplies no move, Shortener performs a **root sweep** whenever one is available:

1. scan the unprocessed roots in decreasing order of \(\nu_t\), using the fixed deterministic tie-breaking rule;
2. discard any root whose entire cone has already died or been erased;
3. select the first remaining live root tag \(t\).

Selecting \(t\) kills every remaining vertex of \(C_t\), so that cone is cleared in one move.

If Prolonger has just entered an unprocessed cone, that cone is first marked active and omitted from the sweep.

If no root sweep is available, Shortener advances an active local game whose local strategy supplies a legal move, treating a global Prolonger selection or pass outside that cone as a local pass when necessary and only after that local game has already made its first Shortener selection. If several active local games supply such a move, she uses any fixed deterministic choice among them.

If no root sweep is available and no active local strategy supplies a legal move, Shortener selects an arbitrary legal vertex outside all root cones. This final rule is applicable whenever the global position is nonterminal and the preceding two rules supply no move: a legal vertex in an unprocessed cone would have a live root by §4.1, a legal vertex in an active cone would leave its local game nonterminal, and a cleared cone has no live vertex.

Shortener never passes.

---

### 4.1. Why an unprocessed dead root has a dead cone

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

### 4.2. The drafting inequality

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

### 4.3. Each active cone is a smaller robust game

Fix an active cone \(C_t\). We first bound the number of projected Prolonger selections that occur before Shortener’s first selection in this cone.

- If \(C_t\) received \(k\) selections during the global opening, then \(k\le b\), and at most one further local Prolonger selection can occur before the first local Shortener response or local termination.
- If \(C_t\) received no opening selection and is first activated later, then at most two Prolonger selections can occur in it before the first local Shortener response or local termination: the activation selection and one return selection.

Since \(b\ge1\), the number of local opening selections is therefore at most
\[
\max\{b+1,2\}=b+1.
\]

Form the projected local history as follows.

1. Retain every actual selection made inside \(C_t\).
2. Project every external selection and every global erasure to the corresponding quotient-upset erasure supplied by §3.3. Projected erasures accumulated between retained local actions may be replaced by their union.
3. Ignore a global pair of player turns on which neither player selects inside \(C_t\), while carrying any projected erasures forward to the next retained local action.
4. After the first local Shortener selection, if Shortener later selects inside \(C_t\) after a global Prolonger selection or pass outside \(C_t\), insert a local Prolonger pass before that later Shortener selection.
5. Before the first local Shortener selection, regard all projected Prolonger selections as the opening block. After its last selection, explicitly end the local opening if a legal local vertex remains; this schedules Shortener's first local selection. If no legal local vertex remains, the projected local game terminates immediately. In particular, no local Prolonger pass is inserted before the first local Shortener selection.

After Shortener’s first local selection, every actual Prolonger selection inside an already active cone receives an immediate Shortener response there whenever the local strategy supplies one; if it supplies none, the local position is terminal. Thus no two later local Prolonger selections occur without an intervening local Shortener selection. The resulting local history is a legal robust game with at most \(b+1\) opening selections.

The optimal local strategies can be run simultaneously. There is never more than one active cone whose strategy can require an immediate legal local response after a global Prolonger selection: it is the cone in which that selection was made. If that local position is terminal, the first response clause supplies no move and the policy falls through. Every other local game remains frozen. When Prolonger acts outside all active cones, Shortener may sweep a root, advance one active local game while treating the external action as a local pass after that game's first local Shortener selection, or use the exceptional outside-vertex rule from §4. External erasure histories may be correlated across cones, but each local strategy handles every adaptive quotient-upset erasure history; no independence is required.

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

### 4.4. Counting every move

Every actual selection is assigned, according to the strategy clause that produced it and the cone history at that time, to exactly one of the following three classes:

1. a vertex in an active cone;
2. a root tag selected by Shortener specifically through the root-sweep firing rule;
3. a vertex outside all root cones.

These classes are exhaustive and disjoint as classes of selection occurrences. Every Prolonger selection in a root cone makes that cone active, and that activation selection and all later selections there belong to class 1. A root selected through the root-sweep rule belongs to a cone that was not active; that selection clears the cone, so it can never subsequently become active. Every remaining selection is outside the union of the root cones and belongs to class 3. In particular, if an active local strategy happens to select a vertex numerically equal to its root tag, that occurrence remains in class 1 and is not counted as a root-sweep firing.

A vertex may be arithmetically exceptional while lying inside an active cone, but it is assigned only to class 1. The term \(|\mathcal E_N|\) below is used only for selections outside the union of the root cones, so there is no double counting.

The first class is bounded by (4.5).

The number of fired root tags is at most
\[
|\mathcal R|\le\frac NA. \tag{4.6}
\]

By (3.7), all selected vertices outside the root cones, including every selection made by the exceptional-vertex fallback, belong to \(\mathcal E_N\).

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

## 5. The density recursion

Fix \(\gamma\in(0,1)\) once and for all. Divide (4.7) by \(N\), use Lemma 2.3, and let \(N\to\infty\), keeping \(A,K,\delta,\gamma,b\) fixed.

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

Now let the integer \(A\to\infty\), while the same \(\gamma\in(0,1)\) remains fixed, choosing, for example,
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

## 6. How this resolves the packet obstruction

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

---

## Appendix: analytic inputs in axiom-ready form

Throughout the appendix, \(\mathbb N=\{1,2,3,\ldots\}\), \(\log\) is the natural logarithm, \(P^-(1)=\infty\), and \(P^-(m)\) is the least prime factor of every integer \(m\ge2\).

### Lemma 2.1: Rough-number bound, explicit form

There exists a real constant \(C_{\mathrm{rough}}>0\) such that all of the following hold:

- \(C_{\mathrm{rough}}\) is absolute; it is independent of \(X\) and \(z\).
- For every real number \(X\ge2\) and every real number \(z\ge2\), if
  \[
  \Phi(X,z)
  :=
  \#\{m\in\mathbb N:1\le m\le X\text{ and }P^-(m)>z\},
  \]
  then
  \[
  \Phi(X,z)
  \le
  C_{\mathrm{rough}}
  \left(\frac{X}{\log z}+1\right).
  \]

### Lemma 2.2: Sparse dense components, explicit form

Define the absolute real constant
\[
c_0:=\frac1{\log2}
\]
and the absolute real constant
\[
\kappa:=c_0\log c_0-c_0+1.
\]
Then \(\kappa>0\), and the following statement holds.

For every real number \(K>2\), there exists a real constant \(C_{\mathrm{dense}}(K)>0\) such that \(C_{\mathrm{dense}}(K)\) depends only on \(K\) and such that, for every real number \(X\ge2\),
\[
D_K(X)
\le
C_{\mathrm{dense}}(K)
\frac{X}{(\log X)^\kappa},
\]
where \(D_K(X)\) is defined as follows.

- The integer \(1\) is \(K\)-dense.
- For every integer \(a\ge2\), let \(r=\Omega(a)\), and let \(p_1,\ldots,p_r\) be the prime factors of \(a\), listed with multiplicity and satisfying \(p_1\le\cdots\le p_r\). The integer \(a\) is \(K\)-dense if and only if, for every integer \(i\) with \(1\le i\le r\),
  \[
  p_i
  \le
  K\prod_{h=1}^{i-1}p_h,
  \]
  with the product over the empty index set equal to \(1\).
- For every real number \(X\ge2\),
  \[
  D_K(X)
  :=
  \#\{a\in\mathbb N:1\le a\le X\text{ and }a\text{ is }K\text{-dense}\}.
  \]

The exponent \(\kappa\) is absolute and independent of \(K\) and \(X\). The multiplicative constant \(C_{\mathrm{dense}}(K)\) may depend on \(K\) and on no other parameter.

### Lemma 2.3: Exceptional-set estimate, explicit form

There exists a real constant \(C_{\mathrm{exc}}>0\) such that all of the following hold:

- \(C_{\mathrm{exc}}\) is absolute; it is independent of \(A\), \(K\), \(\delta\), \(\gamma\), \(\varepsilon\), and \(N\).
- For every real number \(K>2\), every integer \(A\in\mathbb N\) with \(A\ge2\), every real number \(\delta\) with \(0<\delta<1\), every real number \(\gamma\) with \(0<\gamma<1\), and every real number \(\varepsilon>0\), there exists an integer
  \[
  N_0=N_0(A,K,\delta,\gamma,\varepsilon)\in\mathbb N
  \]
  such that the conclusion below holds for every integer \(N\in\mathbb N\) with \(N\ge N_0\).

For every integer \(x\ge2\), let \(r=\Omega(x)\), and let \(p_1,\ldots,p_r\) be the prime factors of \(x\), listed with multiplicity and satisfying \(p_1\le\cdots\le p_r\). Define
\[
j_K(x)
:=
\max\left\{
j\in\{0,1,\ldots,r\}:
\text{for every }i\in\mathbb N\text{ with }1\le i\le j,\quad
p_i\le K\prod_{h=1}^{i-1}p_h
\right\}.
\]
Define
\[
a_K(x):=\prod_{i=1}^{j_K(x)}p_i,
\qquad
t_K(x):=\frac{x}{a_K(x)},
\]
where an empty product equals \(1\).

For every integer \(N\ge N_0\), define
\[
\mathcal E_N
:=
\{1\}
\cup
\left\{
x\in\mathbb N:
2\le x\le N
\text{ and }
\left(
x\le\delta N
\text{ or }
a_K(x)\le A
\text{ or }
a_K(x)>N^\gamma
\right)
\right\}.
\]
Then
\[
|\mathcal E_N|
\le
\left(
\delta
+
C_{\mathrm{exc}}\frac{1+\log A}{\log K}
+
\varepsilon
\right)N.
\]

Equivalently, \(\mathcal E_N\) is exactly the set of integers in \([N]\) that are not useful under (2.8), with \(1\) declared non-useful because \(a_K(1)\) is not required. The quantified \(\varepsilon\)-form above is the full meaning of the term \(o_{A,K,\delta,\gamma}(N)\) in (2.9).

---

## CHANGE LOG

1. **Fix 1 — §1:** Replaced the informal minimax description by a finite perfect-information extensive-form game and defined \(v_b(D)=\inf_{\sigma_S}\sup_{\sigma_P,\sigma_E}\ell\) and \(V_b(N)\) with adaptive strategy quantifiers.
2. **Fix 2 — §1:** Specified the erasure opportunity before every scheduled action, upset-union protocol, public information, opening-end declaration, exact termination rule, and the fact that erasures never undo selections, blocking, or deaths.
3. **Fix 3 — §4.3:** Replaced the false one-move sentence by the two-case local count \(\max\{b+1,2\}=b+1\), and supplied the referee’s projected local-trace and simultaneous-implementation argument.
4. **Fix 4 — §§4 and 4.4:** Added the arbitrary legal outside-cone selection when neither a root sweep nor an active local strategy supplies a move, and made the three move classes explicitly exhaustive, disjoint, and free of exceptional-set double counting.
5. **Fix 5 — §§1, 2.3, 3.2, 4, and 5:** Declared the treatment of \(1\) and the empty downset, \(A\in\mathbb N\), fixed deterministic root tie-breaking, Shortener’s no-pass rule, and a fixed \(\gamma\in(0,1)\) through both limiting operations.
6. **Fix 6 — §4 response rule:** Made the clauses explicitly first-applicable and required the immediate local-response clause to fall through when the projected local position is terminal.
7. **Fix 7 — §4.3:** Restricted inserted local Prolonger passes to times after the first local Shortener selection, explicitly ended the projected opening before that first selection, and included local termination in the two-case opening count.
8. **Fix 8 — §4.4:** Defined the three selection classes by strategy provenance, so a root-valued selection made by an active local strategy remains in class 1 rather than being misclassified as a root-sweep firing.

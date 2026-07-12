Don't search the internet. You are an adversarial referee. Three short proofs about a divisibility game are reproduced verbatim below. Your job is to find fatal errors if they exist. For EACH of the three items, give a verdict: VALID (proof correct as stated), REPAIRABLE (gap exists, state it and the repair), or REFUTED (give an explicit counterexample or the exact false step). Do not grade generously; a proof with a quantifier slip, a missing legality case, or a hidden assumption is not VALID.

## The game

For \(n\ge2\), two players alternately choose previously unchosen integers from \(\{2,\ldots,n\}\), always keeping the chosen set an antichain under divisibility (a primitive set). The game ends when the set is maximal. Prolonger moves first and maximizes the total number of moves; Shortener minimizes it; \(L(n)\) is the length under optimal play. An integer is "legal" at a position \(A\) if it is unchosen and incomparable (under divisibility) with every member of \(A\).

## Item 1 — prime-product legality lemma and a residual-channel computation

Check specifically: the legality proof's case analysis (including a member of \(A\) equal to the product, and whether "some prime in S divides a" really contradicts legality of that prime in every case); and in the residual computation, whether inequality (4) [double counting via "one actual move cannot first-kill two different prime tags of the same still-legal face" and the atomic-ledger capacity 2^r tau(c)] is a correct lifetime bound or silently promotes an instantaneous bound.

## Verdict

I do **not** obtain a valid proof or disproof of the statement.

The established machinery closes the residual lifetime channel and the literal trace-\(1\) anchor channel. After those are removed, the argument reduces to one precise, policy-dependent assertion:

\[
\boxed{\text{a uniform chronological first-exit bound for direct ancestors.}}
\]

Neither the supplied facts nor the arguments below prove that bound. Conversely, the known direct-ancestor examples do not give the persistent, policy-independent Prolonger strategy required for a disproof.

I will make this reduction precise and show that there is only one remaining gap.

---

# 1. The residual channel really can be closed

Put

\[
\mathfrak T(n):=\max_{m\le n}\tau(m).
\]

Fix \(\delta>0\), and choose

\[
H=\mathfrak T(n)^{1+\delta}.
\tag{1}
\]

The elementary maximal-divisor estimate gives \(\mathfrak T(n)=n^{o(1)}\), so \(H=n^{o(1)}\). Choose

\[
r=\left\lfloor (\log H)^{1/3}\right\rfloor .
\]

Then

\[
2^r=H^{o(1)},\qquad
W_r:=\binom r{\lfloor r/2\rfloor}=H^{o(1)}.
\]

Let

\[
E_H=|\{p:H<p\le 2H,\ p\text{ prime}\}|
  \asymp \frac H{\log H},
\]

and let

\[
q_H:=E_H-(2W_r+1)
     =(1-o(1))E_H
     \asymp \frac H{\log H}.
\tag{2}
\]

Thus a face which is unusable at first activation because fewer than \(2W_r+1\) lifts remain has at least \(q_H\) distinct dead face-tag pairs.

Consider \(t\) actual moves \(c_1,\dots,c_t\). For the residual channel, the atomic ledger gives

\[
\#\{F:c_i\text{ ever appears in the residual record of }F\}
 \le 2^r\tau(c_i)
 \le 2^r\mathfrak T(n).
\tag{3}
\]

One actual move cannot first-kill two different prime tags of the same still-legal face. Therefore, double-counting residual face-blocker incidences gives

\[
q_H\,|\mathcal E_{\mathrm{res}}|
 \le
 \sum_{i\le t}2^r\tau(c_i)
 \le
 2^r\mathfrak T(n)t.
\tag{4}
\]

Consequently,

\[
|\mathcal E_{\mathrm{res}}|
 \le
 \frac{2^r\mathfrak T(n)}{q_H}\,t.
\tag{5}
\]

By (1) and (2),

\[
\frac{2^r\mathfrak T(n)}{q_H}
 \ll
 \frac{H^{o(1)}\mathfrak T(n)\log H}{H}
 =
 \mathfrak T(n)^{-\delta+o(1)}\log \mathfrak T(n)
 =o(1).
\tag{6}
\]

Under a degree cap \(O(H)\), each face has shell weight \(O(H)\). Hence the total residual-channel repair mass is

\[
O(H)|\mathcal E_{\mathrm{res}}|
   =o(Ht).
\tag{7}
\]

Any extra \(2^{O(r)}\) cell, signature, or narrow-window factors remain \(H^{o(1)}\) and are absorbed by the fixed \(\delta\) margin in (6).

Thus the residual channel is not the remaining obstruction.

---

# 2. The trace-\(1\) prime anchor can be defeated by a legal online guard

There is a useful legality fact which makes the batch response completely explicit.

### Lemma 1: product of currently legal primes

Let \(A\) be the present primitive set, and let \(S\) be a finite set of primes, every one of which is currently legal. If

\[
B_S:=\prod_{p\in S}p\le n,
\]

then \(B_S\) is legal.

### Proof

Suppose some \(a\in A\) is comparable with \(B_S\).

If \(a\mid B_S\), then \(a\) is a nontrivial squarefree product of primes from \(S\). In particular, some \(p\in S\) divides \(a\), contradicting the legality of \(p\).

If \(B_S\mid a\), then every \(p\in S\) divides \(a\), again contradicting the legality of \(p\).

Thus \(B_S\) is incomparable with every member of \(A\). ∎

So whenever the full packet product fits on the board, Shortener can play the product of **all currently legal** lift primes. Prolonger can steal at most the one prime played immediately before that response.

The same idea works when the full packet product does not fit. Partition \(\mathcal P_H\) into groups of size

\[
g=\left\lfloor
\frac{\log n}{20\log(2H)}
\right\rfloor .
\tag{8}
\]

Because \(H=n^{o(1)}\), we have \(g\to\infty\). For each group, Shortener recomputes the currently legal primes and, when at least \(g/2\) remain, plays their product. This product is legal by Lemma 1 and satisfies

\[
B\le (2H)^g\le n^{1/20}.
\tag{9}
\]

There are only

\[
G
 \le 1+\frac{E_H}{g}
 =O\!\left(\frac{H}{\log n}\right)+1
 =n^{o(1)}
\tag{10}
\]

guard turns. During the entire guard phase, Prolonger can play at most \(G+1\) singleton lift primes. Since

\[
\frac{G}{E_H}
 =
 O\!\left(\frac{\log H}{\log n}\right)+o(1)
 =o(1),
\tag{11}
\]

only \(o(E_H)\) tags can acquire trace \(1\) in this way.

If fewer than \(g/2\) primes remain legal in a group, then at least \(g/2\) tags in that group have already been destroyed by previous chronological blockers. That group is not a free anchor: its depletion must already be charged to one of the residual or direct-ancestor channels.

The collateral of a good guard product is negligible. Indeed, with \(|S|\ge g/2\),

\[
B_S\ge H^{g/2}=n^{\Omega(1)},
\]

while \(B_S\) has only

\[
\tau(B_S)=2^{|S|}\le 2^g=n^{o(1)}
\]

divisors. Thus the faces comparable with guard products contribute only the accepted high-lcm and bottom-shell errors.

Therefore the literal anchor strategy against maximum current degree is not a universal disproof: a completely legal online batch guard eliminates it.

---

# 3. What remains is not a lift-death problem

After the two preceding reductions, the unresolved obstruction is the direct-ancestor channel.

Let \(\mathscr F_s\) be the latent canonical faces relevant to shell \(S_X\) at time \(s\), and let \(w_s(F)\) denote the residual shell mass represented by \(F\). Count a face only at its first exit.

A direct-ancestor event is qualitatively different from a residual lift death:

- in the residual channel, \(F\) remains legal and a specific lift \(Fp\) becomes illegal;
- in the direct-ancestor channel, an earlier move makes the intended ancestor or root unavailable before \(F\) is activated.

Thus no actual lift target need leave \(Q_X\) when the bookkeeping family is erased. The first-death normal form does not apply because its hypothesis is that the face stays legal.

Define

\[
\operatorname{Anc}_X(t)
:=
\sum_{\substack{F\text{ whose first exit occurs before }t\\
                 \text{through the direct-ancestor channel}}}
w(F).
\tag{12}
\]

The needed statement is the following.

## Ancestor-harvest inequality

There must be a fully specified online Shortener policy \(\sigma\) such that, uniformly over every Prolonger play and every stopping time before the shell is already halved,

\[
\boxed{
\operatorname{Anc}_X(t)
\le
\varepsilon(H)X
+
C\sum_{i<t}\Delta_i
+
CHt,
\qquad
\varepsilon(H)\longrightarrow0,
}
\tag{AH}
\]

where \(\Delta_i\) is the contemporaneous shell area removed on turn \(i\).

Under the degree cap \(\Delta_i\le H\), this reduces to

\[
\operatorname{Anc}_X(t)
\le o(X)+O(Ht).
\tag{13}
\]

This is precisely the ancestor-harvest formulation named in the question.

---

# 4. Why neither maximum degree nor the atomic ledger proves (AH)

The atomic ledger cannot be extended to this channel. Fact 3 explicitly supplies examples in which a fixed blocker of bounded divisor count is inherited by \(H^{\Omega(1)}\) unmergeable descendant faces. Thus an estimate of the form

\[
\#\{F:c\text{ directly removes }F\}
 \le M\tau(c)
\]

is false for every acceptable \(M=H^{o(1)}\).

Maximum current \(Q_X\)-degree does not fix this. A move can erase a collection of latent roots while leaving most of the upper targets represented by those roots legal. Consequently,

\[
\text{first-exit root mass}
\not\ll
\text{current target degree of the move}.
\]

The one-carrier construction in the assumptions gives exactly this quantitative failure: a legal carrier can remove \(H\) incomparable roots, each having degree at most \(H\), with total root-shadow mass \(\Omega(H^2)\). Its contemporaneous target area need only be \(O(H)\).

Therefore a target-death potential sees the wrong object.

---

# 5. Why the prime batch trick does not extend automatically

The legality of the prime product in Lemma 1 is special. Even two individually legal composite threats need not have any common legal blocker.

For example, take the current primitive set

\[
A=\{6,35\}.
\]

Both \(10\) and \(15\) are legal:

\[
10\parallel 6,\quad 10\parallel35,\qquad
15\parallel6,\quad15\parallel35,
\]

where \(\parallel\) denotes incomparability.

But there is no legal integer comparable with both \(10\) and \(15\).

Indeed, such an integer \(b\) must fall into one of four cases.

1. If \(b\mid10\) and \(b\mid15\), then \(b=5\), which is illegal because \(5\mid35\).

2. If \(10\mid b\) and \(15\mid b\), then \(30\mid b\), which is illegal because \(6\mid b\).

3. The relation \(15\mid b\mid10\) is impossible.

4. The relation \(10\mid b\mid15\) is impossible.

Thus two legal dangerous carriers can fail to admit even one legal batch blocker.

This does not prove that Shortener loses globally. Shortener might harvest one threatened family, use a blocker acting through another coordinate, or exploit interactions with other shells. But it rules out the pointwise strategy

> whenever several dangerous moves exist, play one product or lcm that blocks all of them.

The prime anchor is therefore genuinely easier than the general direct-ancestor channel.

---

# 6. Conditional completion if (AH) were proved

Suppose a legal online policy satisfying (AH) were available.

From Section 1, the residual-channel repair mass in \(t\) rounds is

\[
o(Ht).
\tag{14}
\]

From Section 2, pure trace-\(1\) anchoring contributes only the negligible guard error, while groups already depleted by composite moves are assigned to the residual or direct-ancestor ledger.

The ordinary first-death, high-lcm, boundary, and canonical-cube errors are already controlled by the established facts. Hence the total repair term would satisfy

\[
\operatorname{Repair}_X(t)
\le
o(X)
+
O(Ht)
+
C\sum_{i<t}\Delta_i.
\tag{15}
\]

This is exactly the contemporaneous-area repair estimate required in fact 1. That reduction would then give

\[
|Q_X(\mathrm{end})|
\le
\frac12|Q_X(\mathrm{start})|
+
\frac{X}{h(n)^2}
\]

for some \(h(n)\to\infty\), uniformly over shells. The trapping sweep, geometric shell summation, and static completion would then imply

\[
L(n)=o(n).
\]

Thus proving (AH) completes the sublinear side without any additional unproved transition.

---

# 7. Why the present obstructions do not disprove the statement

To disprove the statement, it is not enough to exhibit:

- the trace-\(1\) anchor against maximum degree;
- one direct-ancestor carrier with anomalously large first-exit mass;
- one state with no common legal blocker;
- or one stopping time at which a repair potential jumps.

The prime guard above already defeats the first item. The other examples are local. A disproof must show that, against **every** legal online Shortener policy, Prolonger can concatenate such events for

\[
t\asymp \frac XH
\]

rounds while simultaneously maintaining:

\[
|Q_X(t)|\asymp X,
\qquad
\sum_{i<t}\Delta_i=o(X),
\]

and preventing the lost ancestor mass from being transferred into the minimal or exact-only bank.

None of the supplied mechanisms gives that persistent universal strategy. In particular, repeating independent local gadgets is not automatic: Shortener may use cross-gadget batch blockers, and proving that all such blockers can themselves be avoided is precisely an online cover-free or transversal problem.

---

# Final separator

The argument therefore stops at exactly one assertion:

\[
\boxed{
\begin{minipage}{0.88\linewidth}
Construct a fully specified legal online Shortener policy, including its
batch and fallback moves, for which the cumulative residual weight of
canonical faces lost through first-exit direct ancestors satisfies
\[
\operatorname{Anc}_X(t)
\le o(X)+O(Ht)
\]
uniformly at every stopping time before the degree cap or shell halving.
\end{minipage}
}
\]

Equivalently, construct a repair potential dominating direct-ancestor regeneration whose chronological increment is controlled by contemporaneous shell area.

I do not see a valid proof of this inequality, and the known local direct-ancestor examples do not yield the universal persistent exploit needed to refute it. Therefore the stated existence claim—and hence the sublinear question—remains unresolved at this single sub-step.

## Item 2 — one-sweep containment theorem

Check specifically: Lemma 1's use of legality monotonicity (can a proper divisor of a first-layer minimal element BECOME relevant later?); Theorem 2's claim that a selected-exactly minimum kills all its multiples forever; whether the layers M_l are really pairwise disjoint as claimed; and whether "every member of a finite divisibility poset lies above a minimal member" is applied to the correct poset (D_j vs D_l).

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

## Item 3 — equivalence of a post-peel completion statement with the full problem

Check specifically: the converse direction's terminal-position witness (is the clause "every legal integer at A exceeds n/H" really vacuous at a terminal position; is C allowed to be empty; is the move-count clause satisfied); and the uniformity argument converting little-o over strategies into a single epsilon(n).

## Verdict

The supplied material does **not** justify a proof or a disproof of (S). The decisive reason is stronger than the one stated in the prompt:

\[
\boxed{\text{(S) holds if and only if }L(n)=o(n).}
\]

Thus (S) is not merely a sufficient intermediate statement or a particular “peeling route.” It is an exact reformulation of the original sublinearity question, because the position \(A\) in (S) is allowed to be terminal. The definitions of (S), \(L(n)\), and the continuation lemma are those in the uploaded problem. 

Here is the complete equivalence proof.

---

## Theorem

Under the natural uniform interpretation of the asymptotic notation in (S),

\[
\text{(S)}\quad\Longleftrightarrow\quad L(n)=o(n).
\]

### Proof that (S) implies \(L(n)=o(n)\)

Assume (S). Then there are:

- a function \(H(n)\to\infty\);
- a constant \(K\);
- a Shortener strategy;
- and a function \(\varepsilon(n)\to0\);

such that against every Prolonger strategy, play reaches a position \(A\) after at most

\[
K\frac{n}{H}
\]

moves, every legal integer at \(A\) exceeds \(n/H\), and there is a legal set \(C\) satisfying

\[
A\cup C\text{ is maximal primitive},
\qquad
|C|\le \varepsilon(n)\frac{n}{H}.
\]

The uniform \(\varepsilon(n)\) formulation is equivalent to the ordinary meaning of the assertion “against every Prolonger strategy, \(|C|=o(n/H)\).” Indeed, if uniformity failed, for infinitely many \(n\) one could choose a worst offending Prolonger strategy, producing a sequence against which the little-\(o\) assertion failed.

By the given continuation lemma, from \(A\) every continuation has at most

\[
(2H+1)|C|
\]

additional moves. Hence Shortener can guarantee total length at most

\[
K\frac{n}{H}+(2H+1)|C|.
\]

Using the bound on \(C\),

\[
\begin{aligned}
L(n)
&\le K\frac{n}{H}
 +(2H+1)\varepsilon(n)\frac{n}{H} \\
&=n\left(
\frac K H+
\left(2+\frac1H\right)\varepsilon(n)
\right).
\end{aligned}
\]

Both terms in parentheses tend to zero. Therefore

\[
L(n)=o(n).
\]

This is the implication already noted in the prompt.

---

### Proof that \(L(n)=o(n)\) implies (S)

Now assume

\[
L(n)=o(n).
\]

Because this is a finite perfect-information game, for each \(n\) there is a Shortener strategy \(\sigma_n\) whose worst-case terminal length is at most \(L(n)\).

Define, for example,

\[
H(n)=\frac{n}{L(n)+1}.
\]

Since \(L(n)=o(n)\),

\[
H(n)\longrightarrow\infty.
\]

Use \(\sigma_n\) and let \(A\) be the **terminal position** reached against the given Prolonger strategy. Then

\[
|A|\le L(n)<L(n)+1=\frac{n}{H(n)}.
\]

Thus the number of moves made is \(O(n/H)\), in fact less than \(n/H\).

Since \(A\) is terminal,

\[
\mathcal L(A)=\varnothing.
\]

Consequently:

1. Every integer legal at \(A\) exceeds \(n/H\), vacuously.
2. We may take
   \[
   C=\varnothing.
   \]
3. We have \(C\subseteq\mathcal L(A)\).
4. The set \(A\cup C=A\) is maximal primitive.
5. Finally,
   \[
   |C|=0=o(n/H).
   \]

All clauses of (S) hold. This proves the reverse implication and hence the equivalence. ∎

---

## Consequences for the requested proof or disproof

The equivalence changes the interpretation of both outcomes.

A proof of (S) would be a full proof of

\[
L(n)=o(n).
\]

A disproof of (S) would imply

\[
L(n)\ne o(n),
\]

or equivalently

\[
\limsup_{n\to\infty}\frac{L(n)}n>0.
\]

Thus a disproof would yield an \(\varepsilon>0\) and infinitely many \(n\) for which Prolonger can force

\[
L(n)\ge \varepsilon n.
\]

So a disproof would not merely “close this route.” It would establish a linear lower bound along an infinite subsequence and settle the central dichotomy in the opposite direction.

The known lower bound

\[
L(n)\ge
c_\delta\frac{n(\log\log n)^2}{\log n}
\]

has ratio tending to zero, while the known upper bound only gives a positive constant times \(n\). Both are compatible with either truth value of (S).

---

## Why the static-completion argument still does not prove (S)

The most tempting attempted proof is:

1. Peel until every legal integer is above \(m=n/H\), using \(O(m)\) moves.
2. Apply static completion to obtain \(C=o(n)\).
3. Choose \(H\) sufficiently slowly so that \(C=o(m)\).

Step 3 is invalid.

A useful uniform notation is

\[
\mu_n(\alpha)
=
\sup\left\{
\frac{|\mathcal M(P)|}{n}:
P\text{ primitive},\ |P|\le\alpha n
\right\}.
\]

The static completion theorem says that whenever \(\alpha_n\to0\),

\[
\mu_n(\alpha_n)\to0.
\]

For a peel with \(|A|=O(n/H)\), this only gives

\[
|C|\le n\,\mu_n(O(1/H))=o(n).
\]

What (S) requires is

\[
|C|=o(n/H),
\]

namely

\[
H\,\mu_n(O(1/H))\to0.
\]

The first limit does not imply the second. Abstractly, behavior such as

\[
\mu_n(1/H)\asymp \frac1{\log H}
\]

is compatible with \(\mu_n(1/H)\to0\), but gives

\[
H\mu_n(1/H)\asymp\frac{H}{\log H}\to\infty.
\]

Likewise, a modulus resembling \(\mu(\alpha)=\sqrt\alpha\) tends to zero but is much larger than \(\alpha\). This is exactly why taking \(H\) “arbitrarily slowly” is not a valid diagonal argument.

---

## Why pointwise growing degree does not close the equivalence

There is also a clean but insufficient observation behind the degree approach.

At any position \(A\), every legal integer is a multiple of some minimal legal element. Therefore, if \(N(A)=|\mathcal L(A)|\), some \(m\in\mathcal M(A)\) has at least

\[
\frac{N(A)}{|\mathcal M(A)|}
\]

legal multiples. Playing that \(m\) removes at least this many legal integers.

Since static completion gives \(|\mathcal M(A)|=o(n)\) at sublinear positions, this shows that the best available degree tends to infinity whenever \(N(A)\) remains linear.

But pointwise divergence is not enough. If at time \(t=\alpha n\) the worst uniform completion modulus behaves like

\[
|\mathcal M(A)|\approx n\sqrt{\alpha},
\]

then the guaranteed number removed per Shortener turn is only on the order of \(1/\sqrt\alpha\). The total normalized progress by time \(\alpha n\) is comparable to

\[
\int_0^\alpha \frac{ds}{\sqrt{s}}
=2\sqrt{\alpha},
\]

which tends to zero with \(\alpha\). Thus no \(o(n)\)-time clearing follows. A chronology-sensitive estimate, stronger than pointwise degree divergence, is indispensable.

---

## Final conclusion

The exact unconditional mathematical conclusion available here is:

\[
\boxed{\text{(S) is equivalent to }L(n)=o(n).}
\]

Accordingly, none of the accepted facts in the prompt supplies a complete truth-value resolution. A claimed proof of (S) must add a genuinely new chronology-sensitive upper-bound theorem, such as the unresolved shell-area or growing-depth uniformity statement. A claimed disproof must add a Prolonger theorem strong enough to force a positive linear density, not merely a growing-cap \(n/H(n)\) fortress. Presenting either conclusion without such a new theorem would leave precisely the gap identified throughout the problem statement.

Report: three verdicts with one-paragraph justifications each, then any cross-cutting observation. REMEMBER: your value is in finding real errors, not in summarizing.

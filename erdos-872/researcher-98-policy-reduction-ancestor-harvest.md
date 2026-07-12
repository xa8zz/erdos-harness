---
id: R98-policy-reduction-ancestor-harvest
type: research
date: 2026-07-12
intent: >
  Design a fully specified Shortener policy and prove the chronological
  repair theorem needed for the sublinear side of the divisibility
  antichain game on {2..n}.
predecessors: [R94-atomic-ledger-ancestor-harvest, R97-anchor-trace1-olcm-false]
action:
  kind: extends
  target: R94-atomic-ledger-ancestor-harvest
claim: >
  With H = T(n)^(1+delta) for T(n) = max_{m<=n} tau(m) and
  r = floor((log H)^(1/3)): (i) the residual lifetime channel is closed
  unconditionally — double-counting first-kills against the atomic ledger
  gives residual repair mass o(Ht) since 2^r*T(n)/q_H = o(1) with
  q_H ~ H/log H; (ii) the trace-1 prime anchor is defeated by a legal
  online guard: the product of any set of currently legal primes is
  itself legal (short proof), so grouped guard products of size
  g = floor(log n / (20 log 2H)) <= n^(1/20) block whole tag groups in
  n^(o(1)) guard turns, leaving only o(E_H) stealable tags; (iii) the
  direct-ancestor channel provably escapes every M*tau(c) lifetime bound
  and every current-target-degree potential (a legal carrier can erase H
  incomparable roots of root-shadow mass Omega(H^2) at contemporaneous
  area O(H)); (iv) two individually legal threats need not admit any
  common legal blocker (position {6,35}, threats {10,15}); hence the
  sublinear side reduces to exactly one assertion (AH): a fully specified
  legal online Shortener policy under which first-exit direct-ancestor
  mass satisfies Anc_X(t) <= o(X) + O(Ht) uniformly at every stopping
  time. (AH) implies the contemporaneous-area repair estimate and hence
  L(n) = o(n) with no further unproved transition. Neither a proof nor a
  refutation of (AH) is obtained.
implications:
  - The residual channel and the literal anchor exploit are no longer
    obstructions; prompts should mark them closed at H = T(n)^(1+delta).
  - The prime-product legality lemma is a new general-purpose Shortener
    batch tool (any set of currently legal primes multiplies to a legal
    move if the product fits).
  - A disproof of the sublinear route must now force persistent
    direct-ancestor harvesting against every policy including batch
    guards — local gadgets ({6,35} etc.) do not suffice.
verifiers_at_time: []
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/researcher-R98-policy-chronology-theorem.md
---

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
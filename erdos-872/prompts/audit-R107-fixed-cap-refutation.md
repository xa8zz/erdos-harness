Don't search the internet. You are an adversarial referee. A proof claiming to REFUTE a game-theoretic statement is reproduced verbatim below. Your sole job is to decide whether the refutation is correct. Verdict options: VALID (the refutation is correct as stated), REPAIRABLE (a real gap, state it and the repair), REFUTED (the refutation itself is wrong — give the exact false step or a counterexample strategy). Do not grade generously.

## The game

For \(n\ge2\), two players alternately choose previously unchosen integers from \(\{2,\ldots,n\}\), always keeping the chosen set an antichain under divisibility (a primitive set). The game ends when the set is maximal. Prolonger moves first and maximizes the total number of moves; Shortener minimizes it. For a position \(A\): \(U_n=(n/2,n]\), \(L_n=[2,n/2]\); \(R(A)\subseteq U_n\) and \(D(A)\subseteq L_n\) are the integers still legal relative to \(A\); \(\deg_A(d)=\#\{u\in R(A):d\mid u\}\), \(\Delta(A)=\max_d\deg_A(d)\).

## The statement being refuted

(F): there exist a constant \(H_0\) and \(c>0\) such that for all large \(n\), Prolonger has a strategy forcing, against every Shortener strategy, arrival at a primorial-batched position with degree cap \(\Delta_Q\le H_0\) and trapped reservoir of size at least \(cn\) (absorbing-fortress entry at fixed cap).

## Established facts the refutation is allowed to use (take as given)

- Degree availability: at any position with \(|A|=o(n)\) and \(|R(A)|\ge\eta n\), some legal lower move kills at least \((2\eta-o(1))r(n)\) live targets, with \(r(n)\to\infty\) (\(\log\log\) scale).
- Absorbing fortress: once a primorial-batched position with degree cap \(\Delta_Q\le H\) and a linear trapped reservoir is reached, it is stable against arbitrary play — blocked small divisors remain illegal forever, the cap is monotone along every continuation, and the remaining game value is at least \(|E(A)|+|Q(A)|/H\) (E = exact-only bank). The reservoir \(Q(A)\) consists of live upper targets: \(Q(A)\subseteq R(A)\).
- Legality is monotone decreasing along play.

## Key checks (examine each explicitly)

1. Lemma 1's uniformity claim: the degree-availability fact is stated with a non-uniform \(o(1)\); is the contradiction/subsequence argument for uniformity over positions with \(|A|\le n/\sqrt{r_n}\) valid?
2. Lemma 1's move accounting: Shortener needs \(K_n\) max-degree turns; total moves \(2K_n+1\); does the degree guarantee really persist through the whole sweep, including Prolonger's interleaved moves?
3. Lemma 2's charging: is it true that an upper move removes at most one reservoir member and a lower move at most \(H\)? Watch the hypothesis: the cap (3) is stated at the entry position \(A_0\); the moves considered are AFTER \(A_0\); is 'x legal when played implies x in D(A_0)' airtight?
4. Case split completeness: entry before vs after the sweep-completion time \(\sigma\); is any timing scenario missed (e.g. entry DURING the sweep, or the game ending before \(\sigma\))?
5. The 'stronger consequence' extension to caps \(H(n)=o(r(n))\): does the arithmetic hold?
6. Any hidden player-quantifier reversal (a Shortener-side theorem used inside a Prolonger guarantee or vice versa)?

## The refutation, verbatim

# Verdict

\[
\boxed{\text{Statement (F) is false.}}
\]

In fact, a stronger statement holds:

> For every fixed \(H_0<\infty\) and every fixed \(c>0\), Shortener has a strategy which, for all sufficiently large \(n\), prevents the appearance at any time of an \(H_0\)-capped trapped upper reservoir of size at least \(cn\).

The proof uses only the supplied degree-availability theorem, monotonicity of legality, and the fact that the fortress reservoir lies in the live upper set \(R(A)\subseteq (n/2,n]\). 

The key incompatibility is:

1. Shortener can reduce the **entire** live upper set below any fixed positive density in \(o(n)\) actual moves.
2. Once a fixed-cap upper reservoir of linear size exists, only \(O(1)\) of its members can disappear per subsequent move.

Thus such a reservoir cannot appear either before or after Shortener’s density-clearing sweep.

---

## 1. A fixed-density clearing lemma

Let \(r(n)\to\infty\) be the function in the degree-availability statement.

### Lemma 1

For every fixed \(\eta>0\), Shortener has a strategy under which, after \(o(n)\) actual moves, either the game has ended or

\[
|R(A)|<\eta n.
\]

### Proof

Fix \(\eta>0\). Put \(r_n=r(n)\), and define

\[
M_n=\left\lfloor \frac{n}{\sqrt{r_n}}\right\rfloor.
\]

Since \(M_n=o(n)\), the degree-availability theorem implies that, uniformly over all positions satisfying

\[
|A|\le M_n,
\qquad
|R(A)|\ge \eta n,
\]

we have, for all sufficiently large \(n\),

\[
\Delta(A)\ge \eta r_n.
\tag{1}
\]

Here is the standard justification for the uniformity in (1). If it failed, then for infinitely many \(n\) one could choose a position \(A_n\) with

\[
|A_n|\le M_n=o(n),\qquad |R(A_n)|\ge\eta n,
\qquad \Delta(A_n)<\eta r_n.
\]

But the supplied degree theorem, applied to this sequence, gives

\[
\Delta(A_n)\ge (2\eta-o(1))r_n>\eta r_n,
\]

a contradiction.

Shortener now follows this policy:

> While \(|R(A)|\ge\eta n\), choose a legal lower integer of maximum degree.

By (1), provided the total number of moves is at most \(M_n\), each such Shortener move removes at least \(\eta r_n\) currently live upper integers.

Set

\[
K_n
=
\left\lceil
\frac{|U_n|-\eta n}{\eta r_n}
\right\rceil+1.
\]

Since \(|U_n|\le n/2+1\),

\[
K_n=O_\eta\!\left(\frac{n}{r_n}\right)=o(n).
\]

Before Shortener has made \(K_n\) moves, the total number of actual moves is at most

\[
2K_n+1=O_\eta\!\left(\frac{n}{r_n}\right).
\]

Because \(r_n\to\infty\),

\[
2K_n+1
=
o\!\left(\frac{n}{\sqrt{r_n}}\right)
=o(M_n),
\]

so in particular \(2K_n+1\le M_n\) for all sufficiently large \(n\). Thus the degree guarantee (1) remains valid throughout the proposed sweep.

If \(|R(A)|\ge\eta n\) held at all of Shortener’s first \(K_n\) turns, those turns would remove at least

\[
K_n\eta r_n>|U_n|-\eta n
\]

distinct currently live upper targets. Prolonger’s intervening moves cannot increase \(R(A)\). Hence after those turns,

\[
|R(A)|<\eta n.
\]

Therefore the threshold is crossed after at most

\[
N_\eta(n):=2K_n+1
=
O_\eta\!\left(\frac{n}{r(n)}\right)
=o(n)
\tag{2}
\]

actual moves. ∎

---

## 2. A capped upper reservoir erodes only at bounded speed

The next observation is purely deterministic. It does not need the full absorbing-fortress theorem.

### Lemma 2

Suppose that at a position \(A_0\) there is a set

\[
Q_0\subseteq R(A_0)\subseteq U_n
\]

such that

\[
\max_{d\in D(A_0)}
\#\{q\in Q_0:d\mid q\}\le H.
\tag{3}
\]

Then after any \(m\) subsequent actual moves, at least

\[
|Q_0|-\max\{H,1\}m
\tag{4}
\]

members of \(Q_0\) are still legal.

The same conclusion holds for a fortress reservoir \(E_0\sqcup Q_0\), where \(E_0\) is the exact-only bank and (3) holds for \(Q_0\).

### Proof

Track the members of the entry reservoir that cease to be legal. Charge each such target \(q\) to the first subsequently played integer \(x\) comparable with \(q\).

Legality is monotone: an integer legal at a later time was also legal at \(A_0\).

Consider one subsequently played move \(x\).

#### Case 1: \(x\in U_n\)

Distinct integers in \(U_n=(n/2,n]\) are incomparable under divisibility. Indeed, if \(u<v\) and \(u\mid v\), then \(v\ge2u>n\), impossible.

Thus an upper move can remove at most one member of the entry reservoir, namely itself.

#### Case 2: \(x\in L_n\)

If \(x\) removes \(q\in Q_0\), then \(x\mid q\). Since \(x\) is legal when played, it was legal at \(A_0\). Therefore \(x\in D(A_0)\), and (3) shows that it divides at most \(H\) members of \(Q_0\).

If \(e\in E_0\) is exact-only at \(A_0\), no legal proper divisor of \(e\) exists at \(A_0\). Hence no later legal lower move can remove \(e\); it can disappear only by being selected itself.

Consequently every actual move is charged by at most

\[
h:=\max\{H,1\}
\]

entry-reservoir targets. After \(m\) moves, at most \(hm\) have disappeared, proving (4). ∎

This lemma also explains directly why the fixed-cap condition is so restrictive: a linear upper reservoir cannot be destroyed in \(o(n)\) moves once \(H\) is fixed.

---

## 3. Shortener’s counterstrategy to (F)

Fix arbitrary constants

\[
H_0<\infty,\qquad c>0.
\]

If \(c>1/2+o(1)\), the claimed reservoir is impossible simply because \(|U_n|\le n/2+1\). So assume \(0<c\le1/2\).

Set

\[
\eta=\frac c4.
\]

Shortener uses the strategy from Lemma 1. Let \(\sigma\) be the first time at which

\[
|R(A_\sigma)|<\eta n=\frac c4n,
\]

or the time the game ends. By Lemma 1,

\[
\sigma\le N_\eta(n)=o(n)
\tag{5}
\]

in terms of the number of actual moves.

Suppose, toward a contradiction, that Prolonger nevertheless forces arrival at a primorial-batched fortress position \(A_\tau\) with cap at most \(H_0\) and trapped reservoir of size at least \(cn\).

There are two possibilities.

### Case 1: \(\tau\ge\sigma\)

Since legality is monotone,

\[
R(A_\tau)\subseteq R(A_\sigma).
\]

Therefore

\[
|R(A_\tau)|<\frac c4n,
\]

so \(A_\tau\) cannot contain a live reservoir of size \(cn\). Contradiction.

### Case 2: \(\tau<\sigma\)

Let \(T_\tau\) be the trapped entry reservoir. Thus

\[
|T_\tau|\ge cn.
\]

If the stated reservoir is \(Q(A_\tau)\), apply Lemma 2 directly to \(Q(A_\tau)\). If the convention is that the reservoir is \(E(A_\tau)\sqcup Q(A_\tau)\), apply the second part of Lemma 2.

Put

\[
h=\max\{1,\lceil H_0\rceil\}.
\]

Between times \(\tau\) and \(\sigma\), there are at most \(N_\eta(n)=o(n)\) actual moves. Lemma 2 therefore gives

\[
|T_\tau\cap R(A_\sigma)|
\ge
cn-hN_\eta(n)
=
(c-o(1))n.
\]

Because \(h\) is fixed, for all sufficiently large \(n\),

\[
cn-hN_\eta(n)>\frac c2n.
\]

Hence

\[
|R(A_\sigma)|\ge\frac c2n,
\]

contradicting the defining property

\[
|R(A_\sigma)|<\frac c4n.
\]

Both cases are impossible.

Thus for the arbitrary pair \((H_0,c)\), Shortener’s strategy prevents the claimed entry for all sufficiently large \(n\). Since \(H_0\) and \(c\) were arbitrary, (F) is false. ∎

---

## Stronger consequence

The same proof gives more than fixed cap.

Let \(H(n)\) be any cap satisfying

\[
H(n)=o(r(n)),
\]

where \(r(n)\to\infty\) is the degree-availability scale. Lemma 1 clears a fixed density in

\[
O\!\left(\frac{n}{r(n)}\right)
\]

actual moves, while an \(H(n)\)-capped reservoir can lose at most

\[
O\!\left(
H(n)\frac{n}{r(n)}
\right)
=o(n)
\]

members during that interval. Therefore:

\[
\boxed{
\text{No linear upper reservoir can be robustly entered with cap }
H(n)=o(r(n)).
}
\]

In particular, every fixed cap is ruled out.

This does **not** prove \(L(n)=o(n)\). The sweep only reduces \(R(A)\) below an arbitrarily chosen **fixed** density \(\eta n\). The degree-availability theorem supplied in the problem is not uniform as \(\eta=\eta(n)\to0\), which is precisely why the growing-depth/OA problem remains. What is closed is the fixed-cap absorbing-fortress route: a cap small enough that the reservoir erodes only \(o(n)\) during the fixed-density sweep cannot coexist with that sweep.

Report: a single verdict (VALID / REPAIRABLE / REFUTED) with the decisive reasoning, then your assessment of each numbered check. REMEMBER: your value is in finding real errors, not in summarizing.
---
id: R92-arbitrary-reply-persistence-claim
type: research
date: 2026-07-12
intent: >
  Prove or refute the shared ordered-multiplicity statement (time-area
  form) with all three sibling toolkits available.
predecessors:
  - R89-blocker-game-time-area
  - R88-lift-exhaustion-reduction
  - R83-block-harvest-temporal-hall
action:
  kind: extends
  target: R89-blocker-game-time-area
claim: >
  CLAIMED (unaudited): the ordered-multiplicity statement is true at the
  maximal-divisor scale. One ordered cross-spoiler has temporal face
  capacity at most binom(r, r/2) T(n), where T(n) = max_{m<=n} tau(m) =
  n^{o(1)} is the maximal divisor count; combined with the Omega(H/log H)
  lift-exhaustion cost this proves the time-area inequality whenever
  binom(r, r/2) T(n) log H = o(H). Taking H = T(n)^{1+delta}, a
  deterministic canonical lift scheduler (fixed core / colex split-face /
  increasing-lift ordering with canonical common-core splits and
  exhaustion charging) is claimed robust against EVERY opposing policy:
  Prolonger forces either Omega(n/H) moves before entry finishes or a
  linear-reservoir position with degree cap O(H), and the
  absorbing-fortress theorem supplies the same tail, giving
  L(n) >>_delta n/T(n)^{1+delta} = n^{1-o(1)} against arbitrary play.
  Explicitly does NOT establish Theta(n) (H grows), and the numerical
  bound is asymptotically SMALLER than the existing
  n(log log n)^2/log n bound since T(n)^{1+delta} = exp((1+o(1))(1+delta)
  log 2 log n/log log n) exceeds every power of log n. The substantive
  advance, if it survives audit, is the arbitrary-reply persistence
  theorem and closure of the temporal Hall-capacity gap at the
  divisor-width threshold, ruling out the ordered-area no-direction at
  these cap scales; a stronger game bound requires beating the threshold
  via cross-core coded repairs.
implications:
  - If audited sound, the online-area route to L(n) = o(n) is dead at maximal-divisor cap scales, and the sublinear side must work below the divisor-width threshold.
  - Must be checked against the refinement-forest necessary condition and the Omega(H) one-carrier loss established concurrently.
confidence_at_time: low
strategy_dependence: independent
prompt: erdos-872/prompts/followup-R92-ordered-multiplicity-final.md
---

# Verdict

The shared ordered-multiplicity statement is **true at the maximal-divisor scale**.

Let

[
\mathfrak T(n):=\max_{1\le m\le n}\tau(m),
]

where (\tau(m)) is the number of divisors of (m). For every fixed (\delta>0), set

[
H(n):=\mathfrak T(n)^{,1+\delta}.
\tag{1}
]

Then (H(n)=n^{o(1)}), and the primorial entry scheduler can be made robust against **every** opposing policy. More precisely, Prolonger can force either

[
\Omega!\left(\frac nH\right)
]

moves before entry has finished, or a position with a linear live upper reservoir and residual degree cap (O(H)). The absorbing-fortress theorem then supplies the same (\Omega(n/H)) tail.

Consequently,

[
\boxed{
L(n)\gg_\delta
\frac{n}{\mathfrak T(n)^{1+\delta}}.
}
\tag{2}
]

An elementary estimate

[
\mathfrak T(n)
\le
\exp!\left(
4\frac{\log n}{\log\log n}
\right)
\tag{3}
]

therefore gives the explicit bound

[
\boxed{
L(n)
\gg_\delta
n\exp!\left(
-4(1+\delta)\frac{\log n}{\log\log n}
\right)
=======

n^{1-o(1)}.
}
\tag{4}
]

The proof is policy-independent. It applies in particular against maximum-degree and minimal-legal play, but uses neither assumption.

I use the game notation and the accepted static, trapping, and regeneration results from the supplied manuscript. 

---

# 1. The missing temporal Hall bound

Fix a dyadic shell (S_X), a cap parameter (H), and the canonical rank-(r) primorial scheduler from the accepted lift-exhaustion reduction.

Choose one fixed primorial coordinate set

[
\mathcal P={p:p\le y},
\qquad
y=
\left\lfloor
\frac{\log H}{(\log\log H)^2}
\right\rfloor,
]

and put

[
r=|\mathcal P|.
]

The associated primorial is admissible because

[
\log\prod_{p\le y}p
\le
\pi(y)\log y
\le
y\log y
=o(\log H).
]

Thus the product is (H^{o(1)}<H).

After dynamic common-core splitting, every currently active face (F) has:

1. an integer arithmetic core (\kappa(F));
2. one of at most
   [
   B_r:=\binom r{\lfloor r/2\rfloor}
   \tag{5}
   ]
   surviving face signatures over that core.

The central-binomial bound is precisely the accepted common-core splitting lemma. Equivalently, for each fixed core (b), the active split signatures form an antichain in the rank-(r) Boolean lattice, and hence number at most (B_r).

Because (r\le y),

[
B_r\le 2^r
\le
\exp!\left(
O!\left(
\frac{\log H}{(\log\log H)^2}
\right)
\right)
=======

H^{o(1)}.
\tag{6}
]

## Ordered core-incidence lemma

Let (c) be any actual opposing move, and let (\Gamma(c)) be the collection of active primorial faces which lose one currently available prime lift because of (c). Then

[
\boxed{
|\Gamma(c)|\le B_r,\tau(c).
}
\tag{7}
]

### Proof

Ordinary lift failures and pairwise cross-carrier effects have already been removed by the accepted reductions. In the remaining ordered cross-spoiler case, the common-core normalization has exactly the orientation

[
\kappa(F)\mid c.
\tag{8}
]

This is the same condition appearing in the block-harvest formulation: a move can kill an (i)-star in a block only when the block core divides that move.

There are at most (\tau(c)) possible values of the integer core (\kappa(F)). For each fixed core, there are at most (B_r) active split-face signatures. Therefore

[
|\Gamma(c)|
\le
\sum_{b\mid c}B_r
=================

B_r\tau(c).
]

This argument is unaffected by when the face was created or split. ∎

Define

[
\mu(n,H):=
B_r\mathfrak T(n).
\tag{9}
]

Then every actual opposing move has cross-face incidence capacity at most (\mu(n,H)).

This is already the desired temporal and shell-stable Hall bound: for every set (J) of earlier opposing moves,

[
\boxed{
#{\text{ordered lost-lift incidences caused by }J}
\le
\mu(n,H)|J|.
}
\tag{10}
]

It is temporal because only actual earlier moves are counted, and shell-stable because deleting targets or descending to lower shells cannot increase the number of core divisors of a fixed move.

---

# 2. Combining incidence capacity with lift exhaustion

The accepted lift-exhaustion lemma says that, after common-core splitting, removing all the prime lifts of one currently legal degree-(H) face requires

[
q_H
\ge
c_0\frac{H}{\log H}
\tag{11}
]

**distinct earlier actual moves**, for some absolute (c_0>0).

Let (\mathcal E_t) be the faces exhausted by time (t), and let (t) also denote the number of opposing replies made during this part of the scheduler. Counting incidences in two ways gives

[
q_H|\mathcal E_t|
\le
\sum_{j<t}|\Gamma(c_j)|
\le
\mu(n,H)t.
]

Therefore

[
\boxed{
|\mathcal E_t|
\le
\frac{\mu(n,H)\log H}{c_0H},t.
}
\tag{12}
]

This is the unweighted face version. The accepted shell reduction uses the corresponding weighted version: a degree-(H) face has (O(H)) shell capacity, and dynamic splitting closes partial losses into descendant face packets. Thus the total residual shell area resolved through ordered cross-spoiling is at most

[
O(H)|\mathcal E_t|
\le
C_0\mu(n,H)\log H,t.
\tag{13}
]

Equivalently, if (N_{\rm att}(t)) is the number of actual carrier attempts, then (t\le N_{\rm att}(t)+1), and

[
\sum_{i<t}\Delta_i^{\rm cross}
\le
C_1\mu(n,H)\log H,N_{\rm att}(t)+O(\mu\log H).
\tag{14}
]

The ordinary lift failures, pair effects, and already-separated exceptional family contribute, by hypothesis, a term of the form

[
\rho(H)X+\rho(H)H N_{\rm att}(t),
\qquad
\rho(H)\longrightarrow0.
\tag{15}
]

Combining (14) and (15), define

[
\varepsilon(n,H)
:=
\rho(H)
+
C_2\frac{\mu(n,H)\log H}{H}.
\tag{16}
]

Then the required time-area inequality follows:

[
\boxed{
\sum_{i<t}\Delta_i
\le
\varepsilon(n,H)X
+
\varepsilon(n,H)H N_{\rm att}(t).
}
\tag{TA}
]

Thus everything reduces to choosing (H) so that

[
\boxed{
B_r\mathfrak T(n)\log H=o(H).
}
\tag{17}
]

---

# 3. Choosing the cap

Take any fixed (\delta>0) and set

[
H=\mathfrak T(n)^{1+\delta}.
]

By (6),

[
B_r=H^{o(1)}
============

\mathfrak T(n)^{o(1)}.
]

Hence

[
\begin{aligned}
\frac{B_r\mathfrak T(n)\log H}{H}
&=
\mathfrak T(n)^{
1+o(1)-(1+\delta)
}
\log H
\
&=
\mathfrak T(n)^{-\delta+o(1)}
\log \mathfrak T(n)
\
&\longrightarrow0.
\end{aligned}
\tag{18}
]

The final convergence is quantitative because

[
\mathfrak T(n)\ge \tau!\left(2^{\lfloor\log_2 n\rfloor}\right)
\asymp\log n.
]

Therefore (\varepsilon(n,H)\to0), and (TA) holds.

One can reduce the fixed-(\delta) slack. For example,

[
H
=

\mathfrak T(n)
\exp!\left(
\frac{10\log\mathfrak T(n)}
{\log\log\mathfrak T(n)}
\right)
=======

\mathfrak T(n)^{1+o(1)}
\tag{19}
]

also satisfies (17), because

[
\log B_r
========

O!\left(
\frac{\log H}{(\log\log H)^2}
\right),
]

while the extra factor in (19) has logarithm of order

[
\frac{\log\mathfrak T(n)}
{\log\log\mathfrak T(n)}.
]

Thus the most compact form of the result is

[
\boxed{
H=\mathfrak T(n)^{1+o(1)}
\quad\Longrightarrow\quad
L(n)\gg \frac{n}{H}.
}
\tag{20}
]

---

# 4. The actual Prolonger strategy

The strategy is the canonical lift scheduler made deterministic.

Fix the selected shell (S_X), the primorial coordinate set (\mathcal P), and an ordering of:

1. arithmetic cores (b), by increasing (b);
2. split-face signatures, in colexicographic order;
3. prime lifts, by increasing lift prime.

Maintain a queue of active face tasks.

On each Prolonger turn:

1. Pop the first active face.
2. Scan its unused prime lifts in the fixed order.
3. Play the first currently legal carrier lift.
4. If an opposing move cross-spoils the face, apply the accepted canonical common-core split and insert the surviving descendants into the queue in colex order.
5. If all lifts have been lost, mark the face exhausted and charge it to the (q_H) distinct earlier spoilers guaranteed by the exhaustion lemma.

This is an actual online rule: it uses only the current position and the already-played spoiler history.

Let

[
T_X=\left\lfloor c\frac XH\right\rfloor
\tag{21}
]

for a sufficiently small absolute constant (c>0).

There are two possibilities.

## Case 1: (T_X) carrier attempts occur

Then the game has already lasted at least

[
T_X=\Omega(X/H)
]

moves. No entry theorem is needed.

## Case 2: the scheduler reaches the degree cap first

Before (T_X) attempts, (TA) gives

[
\sum_{i<t}\Delta_i
\le
\varepsilon X
+
\varepsilon H\frac{cX}{H}
=========================

o(X).
\tag{22}
]

Prolonger’s own carrier moves remove at most (T_X=o(X)) upper targets.

If at least (T_X) exact-only targets have already been played, those are themselves (T_X) actual moves and again the desired lower bound has already been obtained. Otherwise, the loss caused by played exact-only targets is also (o(X)); unplayed exact-only targets remain in the reservoir and are banked.

Hence, when the scheduler completes,

[
|R(A_\star)|\ge \varepsilon_0X
\tag{23}
]

for some absolute (\varepsilon_0>0), while

[
\Delta_Q(A_\star)\le C H.
\tag{24}
]

The constant (C) is harmless and may be absorbed into the definition of (H).

The exact-bank fortress potential gives

[
V(A_\star)
\ge
|E(A_\star)|
+
\frac{|Q(A_\star)|}{CH}.
]

Since (R=E\sqcup Q),

[
|E|+\frac{|Q|}{CH}
\ge
\frac{|E|+|Q|}{CH}
==================

\frac{|R|}{CH},
]

and so

[
V(A_\star)
\ge
\frac{\varepsilon_0X}{CH}
=========================

\Omega(X/H).
\tag{25}
]

Thus either branch forces (\Omega(X/H)) moves.

The shell supplied by the entry reduction has (X\gg n), so

[
L(n)\gg \frac nH.
]

Nothing in this strategy assumes that the opponent chooses maximum degree, minimum legal elements, or any other specified policy. The only fact used about a reply (c) is

[
c\le n
\quad\text{and}\quad
#{b:b\mid c}\le\tau(c).
]

Therefore the conclusion holds against arbitrary opposition.

---

# 5. Elementary maximal-divisor estimate

For completeness, write

[
L=\log n,
\qquad
\ell=\log L,
\qquad
z=\frac{L}{\ell^2}.
]

Let (m\le n), and factor

[
m=m_{\mathrm{small}}m_{\mathrm{large}},
]

where (m_{\mathrm{small}}) contains the prime powers with prime at most (z), and (m_{\mathrm{large}}) contains the remaining prime powers.

For the small-prime part, every exponent is at most (L/\log2), and there are at most (z) possible primes. Hence

[
\begin{aligned}
\log\tau(m_{\mathrm{small}})
&\le
\pi(z)\log\left(1+\frac L{\log2}\right)
\
&\le
z(\ell+O(1))
\
&\le
2\frac L\ell
\end{aligned}
\tag{26}
]

for sufficiently large (n).

For the large-prime part,

[
\Omega(m_{\mathrm{large}})
\le
\frac L{\log z}.
]

Since (a+1\le2^a),

[
\tau(m_{\mathrm{large}})
\le
2^{\Omega(m_{\mathrm{large}})},
]

and therefore

[
\log\tau(m_{\mathrm{large}})
\le
(\log2)\frac L{\log z}
\le
2(\log2)\frac L\ell.
\tag{27}
]

Combining (26) and (27),

[
\log\tau(m)
\le
4\frac{\log n}{\log\log n}
]

for large (n). This proves (3).

Taking (H=\mathfrak T(n)^{1+\delta}) now yields

[
H
\le
\exp!\left(
4(1+\delta)\frac{\log n}{\log\log n}
\right)
=======

n^{o(1)},
]

and hence (4).

---

# 6. Why the divisor factor is real

The factor (\mathfrak T(n)) is not merely a loose artifact of the proof.

Let

[
G=p_1p_2\cdots p_k
]

be squarefree. Consider the middle-layer divisors

[
b_S=\prod_{i\in S}p_i,
\qquad
|S|=\lfloor k/2\rfloor.
]

They form an antichain of size

[
\binom{k}{\lfloor k/2\rfloor}.
]

For any prime (q\nmid G), the single move

[
c=Gq
]

is divisible by every (b_S). Thus one ordered spoiler can simultaneously strike a middle-layer family of

[
\binom{k}{\lfloor k/2\rfloor}
=============================

\frac{2^{k+o(k)}}{\sqrt{k}}
]

different cores.

So no constant or polylogarithmic per-spoiler multiplicity bound follows from divisibility alone. At the raw arithmetic level, maximal divisor width really is of size

[
\exp!\left(
\Theta!\left(
\frac{\log n}{\log\log n}
\right)
\right).
]

Obtaining persistence for substantially smaller (H), such as (H=(\log n)^{o(1)}), would therefore require an additional coded-sharing argument that treats many divisor cores simultaneously, rather than charging them separately.

---

# Conclusion

The shared ordered-multiplicity problem has a positive resolution at the maximal-divisor scale:

[
\boxed{
\text{one ordered spoiler has temporal face capacity at most }
\binom r{\lfloor r/2\rfloor}\mathfrak T(n).
}
]

Combined with the accepted (\Omega(H/\log H)) lift-exhaustion cost, this proves the time-area inequality whenever

[
\binom r{\lfloor r/2\rfloor}
\mathfrak T(n)\log H=o(H).
]

In particular, for every fixed (\delta>0),

[
\boxed{
H=\mathfrak T(n)^{1+\delta}
\quad\Longrightarrow\quad
L(n)\gg_\delta
\frac n{\mathfrak T(n)^{1+\delta}}
==================================

n^{1-o(1)}.
}
]

The result holds against every opposing strategy, not merely maximum-degree or minimal-legal play. It rules out the ordered-area no-direction at these cap scales.

It does not establish (L(n)=\Theta(n)), since (H\to\infty). Also, at the explicit maximal-divisor scale, the numerical bound in (4) is asymptotically smaller than the already supplied (n(\log\log n)^2/\log n) lower bound. The substantive advance is therefore the arbitrary-reply persistence theorem and the closure of the temporal Hall-capacity gap at the natural divisor-width threshold; a stronger game bound requires beating that threshold through genuinely cross-core coded repairs.

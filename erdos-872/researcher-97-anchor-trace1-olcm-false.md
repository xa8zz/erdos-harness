---
id: R97-anchor-trace1-olcm-false
type: research
date: 2026-07-12
intent: >
  Prove or disprove the shell-stable low-lcm energy estimate (OLCM),
  dispatched as a single-lemma question with the trace normal form, the
  energy lemma, the rectangle example, and the frozen repair results.
predecessors:
  - R93-trace-rectangle-olcm-reduction
action:
  kind: extends
  target: R93-trace-rectangle-olcm-reduction
claim: >
  (OLCM) as literally stated is FALSE, by a forceable anchor
  construction; but its failure does not prove the game lower bound,
  and the genuinely open statement is a minimax residual-weighted
  chronological inequality (RCM). Construction: on a board
  N = (B_H P_H^#)^{12} with B_H = lcm(2..H) and P_H the primes in
  (H, 2H], Prolonger opens with the anchor B_H — every integer in
  [2, H] instantly becomes illegal while all of P_H stays legal — then
  plays unplayed primes p in P_H. Lemma (preemption impossibility):
  before the stopping time, a legal proper multiple x = pm of an
  unplayed p is never a maximum-degree move, because reserved semiprime
  targets u = pr (r prime near N/p) survive in R_p but not R_x, so
  deg(p) > deg(x); hence the maximum-degree policy can touch p only by
  playing p itself, which is the trace-1 spoiler Prolonger wants. By
  time T <= 2E_H + 1 every p in P_H is played; at most o(Y) shell faces
  die (each move a > H is comparable with at most 2Y/a + tau(a)
  <= 2Y/H + 2 sqrt(N) shell elements, and Y = N^{2/3} makes the total
  o(Y)); so (1-o(1))Y faces survive with every one of their E_H prime
  lifts spoiled at trace d = 1, each played prime being the genuine
  FIRST blocker of fp — the incidence survives the canonical
  first-witness interpretation. Hence Lambda_s >= binom(E_H, s) for
  every s, and no s(H) makes (OLCM) hold. Why the game is not decided:
  (i) negating (OLCM) concerns histories against ONE fixed policy;
  a lower bound needs a Prolonger strategy against ALL replies — an
  unrestricted Shortener answers the anchor with the batch blocker
  P_H^# (legal: disjoint support from B_H, size <= N^{1/12}), killing
  every lift prime at once with traces of lcm essentially P_H^#, i.e.
  exponentially small shell density; maximum-degree refuses that move
  only because each individual p dominates it in degree. (ii) A lower
  bound on Lambda_s does not lower-bound exhausted-face mass (redundant
  atoms); positive density here was proved separately. (iii) Positive
  density at one stopping time is not persistence over X/H rounds. The
  isolated missing statement (RCM): for k_T(f) = number of lift primes
  with a canonical first blocker while f stayed legal, some s <= E_H
  has (1/Y) sum over legal shell faces of binom(k_T(f), s) =
  o(binom(E_H, s)) uniformly over stopping times — equivalently an
  anchor-neutralization / batch-persistence lemma for the fully
  specified coded-repair policy. No shell-local estimate in the trace
  lcms alone can work: the anchor eliminates every small repair divisor
  without appearing in any trace lcm.
implications:
  - Direct tension with the claimed canonical first-witness resolution - that claim asserts advance-depletion is uniformly expensive, this construction makes (1-o(1))Y faces fully first-witness-exhausted in O(H/log H) moves against the literal maximum-degree policy; the running adversarial audits must adjudicate whether the claimed Theorem 3 payment accounting absorbs the anchor construction or is refuted by it.
  - The definition of the Shortener policy is now load-bearing: literal maximum-degree admits the anchor exploit, while a coded-repair override (playing batch blockers like P_H^#) neutralizes it at negligible density cost; the policy must be specified before either direction can close.
  - Fifth formulation of the residual open lemma, now with the correct minimax quantifiers: (RCM) residual-weighted moments over legal faces, not raw energy over atoms.
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/researcher-R97-olcm-single-lemma.md
---

# Verdict

The estimate **(OLCM), as literally stated, is false**. The obstruction is the trace-(1) channel. In fact, under the literal maximum-degree rule, Prolonger can force a stopping time and a dyadic shell in which

[
|\mathcal E_{E_H}|=(1-o(1))Y
]

and simultaneously, for **every** (1\le s\le E_H),

[
\Lambda_s(\mathcal I_T)\ge \binom{E_H}{s}.
]

Thus no choice of (s(H)) can make (OLCM) hold.

There is, however, a separate logical issue: the requested “disproof against every legal reply sequence” is strictly stronger than the negation of (OLCM), which concerns histories against one fixed Shortener policy. Consequently, the failure of (OLCM) does **not** by itself prove (L(n)\gg n/H). The advertised equivalence between the two assertions is invalid.

I will first prove the counterexample, then isolate the exact unresolved minimax statement.

---

## 1. The anchor construction

Write

[
P_H^#=\prod_{p\in\mathcal P_H}p,
\qquad
B_H=\operatorname{lcm}(2,3,\ldots,\lfloor H\rfloor).
]

Choose the board size

[
N=N(H):=(B_HP_H^#)^{12}.
]

Thus (B_H,P_H^#\le N^{1/12}), while (H=o(N^\varepsilon)) for every fixed (\varepsilon>0). Put

[
Y=\lfloor N^{2/3}\rfloor
]

and consider the shell

[
\mathcal S_Y=(Y,2Y]\cap\mathbb Z.
]

For sufficiently large (H),

[
(2Y)(2H)<N,
]

so every (fp), with (f\in\mathcal S_Y) and (p\in\mathcal P_H), lies on the board.

Prolonger starts by playing

[
B_H.
]

This is the anchor. Every integer (d\in[2,H]) divides (B_H), and hence immediately becomes illegal. On the other hand, every (p\in\mathcal P_H) is incomparable with (B_H), because no prime in ((H,2H]) divides (B_H).

After the anchor, Prolonger's strategy is simply:

> On every turn, play any still-unplayed prime (p\in\mathcal P_H).

The only question is whether the maximum-degree Shortener policy can preempt such a prime by playing a proper multiple of it.

It cannot.

---

## 2. A maximum-degree reply cannot preempt an unplayed lift prime

Here “maximum degree” is used in its usual sense from the reductions: for a currently legal (x),

[
\deg_A(x)=#{u\in R(A):x\mid u},
]

where (R(A)) is the current legal upper-target set. The only property needed is the obvious inclusion monotonicity

[
x\mid y
\quad\Longrightarrow\quad
{u:y\mid u}\subseteq{u:x\mid u}.
]

### Lemma

Before the stopping time defined below, if (p\in\mathcal P_H) is still unplayed, then no legal proper multiple (x=pm), (m>1), can be a maximum-degree move.

### Proof

Fix an unplayed (p). Consider primes (r) in

[
\frac N{2p}<r\le \frac Np.
]

For each such (r),

[
u=pr\in (N/2,N].
]

There are far more than (10E_H) such primes (r). Reserve (10E_H) of them.

The anchor (B_H) is incomparable with every such (u). Indeed, (u) is the product of two primes greater than (H), whereas all prime factors of (B_H) are at most (H).

Before all primes of (\mathcal P_H) have been dealt with, fewer than (2E_H+1) actual moves have occurred. One previous actual move can make at most one reserved (u=pr) illegal:

* If (a\mid pr), then because (pr) is semiprime,
  [
  a\in{p,r,pr}.
  ]
  Since (p) is assumed unplayed, this identifies at most one (r).
* If (pr\mid a), then (pr>N/2) and (a\le N), so necessarily (a=pr), again identifying at most one (r).

Consequently, several reserved upper targets (u=pr) remain legal.

Now let (x=pm), (m>1), be a legal proper multiple of (p). Every legal upper multiple of (x) is also a legal upper multiple of (p), so

[
R_x\subseteq R_p.
]

Choose a surviving reserved (r) for which (m\nmid r). This is always possible: since (r) is prime and (m>1), the relation (m\mid r) can occur for at most one reserved (r), namely (r=m) when (m) happens to be prime.

Then

[
u=pr\in R_p\setminus R_x.
]

Hence

[
\deg_A(p)>\deg_A(x).
]

Therefore (x) cannot be a maximum-degree move. ∎

---

## 3. Every lift prime itself is eventually played

An unplayed prime (p\in\mathcal P_H) can become illegal only if an actual move equal to (p), or a multiple of (p), is selected.

By the lemma, the maximum-degree policy cannot choose a proper multiple of (p). Thus Shortener can affect (p) only by choosing (p) itself. Such a move is already exactly the trace-(1) spoiler Prolonger wants.

Therefore, on every Prolonger turn, some still-unplayed (p\in\mathcal P_H) can be selected. Shortener may herself select some of these primes, but this only accelerates the process.

Let (T) be the first time by which every (p\in\mathcal P_H) has been selected by one of the two players. Then

[
T\le 2E_H+1.
]

At this stopping time, the actual primitive set contains every lift prime (p\in\mathcal P_H).

---

## 4. A positive proportion of the shell is still legal

After the anchor, every legal move is greater than (H), since every integer in ([2,H]) divides (B_H).

Fix an actual move (a>H). The number of shell elements (f\in(Y,2Y]) comparable with (a) is at most

[
#{f\in(Y,2Y]:a\mid f}
+
#{f\in(Y,2Y]:f\mid a}.
]

The first term is at most

[
\frac{2Y}{a}+1\le \frac{2Y}{H}+1.
]

The second is at most (\tau(a)), and the elementary divisor bound gives

[
\tau(a)\le 2\sqrt a\le 2\sqrt N.
]

Since at most (2E_H+1=O(H/\log H)) actual moves have occurred by time (T), the total number of shell elements made illegal is at most

[
O!\left(\frac{H}{\log H}\right)
\left(
\frac{2Y}{H}+1+2\sqrt N
\right).
]

Using (Y=N^{2/3}), this is

[
O!\left(\frac{Y}{\log H}\right)
+
O!\left(\frac{H\sqrt N}{\log H}\right)
======================================

o(Y),
]

because

[
\frac{H\sqrt N}{Y\log H}
========================

\frac{H}{N^{1/6}\log H}
\longrightarrow 0.
]

Hence the set (F_T) of currently legal faces in the shell satisfies

[
|F_T|=(1-o(1))Y.
\tag{1}
]

---

## 5. Every surviving face has all (E_H) lifts exhausted by trace (1)

Let (f\in F_T). Since every (p\in\mathcal P_H) is an actual selected move and (f) is still legal, necessarily (p\nmid f). Otherwise the selected move (p) would divide (f).

Moreover,

[
fp\le (2Y)(2H)<N.
]

The actual move (p) divides (fp), while (p) is incomparable with (f). Thus it is a spoiler with trace

[
d=1.
]

In fact, (p) is the first blocker of (fp). Before (p) was selected:

* no proper multiple of (p) had been chosen, by the maximum-degree lemma;
* no divisor of (fp) not involving (p) could have been chosen while (f) remained legal, since such a divisor would divide (f);
* no multiple of (fp) could have been chosen while (f) remained legal, since (f\mid fp).

So the trace-(1) incidence survives even if (\mathcal I_T) is interpreted as using canonical first witnesses.

Therefore every (f\in F_T) has all (E_H) distinct prime lifts spoiled, and

[
|\mathcal E_{E_H}|
\ge |F_T|
=(1-o(1))Y.
\tag{2}
]

This is a genuine positive-density failure at the stopping time (T).

---

## 6. Direct failure of the low-lcm energy estimate

For every (p\in\mathcal P_H), let

[
\alpha_p=(a_p,p,d_p)=(p,p,1).
]

These (E_H) atoms all lie in (\mathcal I_T). Hence for every (1\le s\le E_H),

[
\begin{aligned}
\Lambda_s(\mathcal I_T)
&\ge
\sum_{\substack{S\subseteq\mathcal P_H\|S|=s}}
\frac1{\operatorname{lcm}(1,\ldots,1)}
\
&=
\binom{E_H}{s}.
\end{aligned}
\tag{3}
]

Consequently,

[
\frac{\Lambda_s(\mathcal I_T)}
{\binom{E_H}{s}}
\ge 1
]

for every possible choice of (s=s(H)). In particular, this ratio cannot tend to zero.

Thus the literal estimate (OLCM) is false.

---

# Why this does not prove (L(N)\gg N/H)

The condition demanded in the question for an acceptable disproof,

[
\exists\text{ a Prolonger strategy }
\forall\text{ legal Shortener replies},
]

is not the logical negation of an assertion about histories against one fixed policy (S^\star).

The quantifiers in (OLCM) are of the form

[
\exists s(H);
\forall\text{ Prolonger histories against }S^\star;
\forall T:
\quad \Lambda_s=o!\binom{E_H}{s}.
]

Its negation is

[
\forall s(H);
\exists\text{ a Prolonger history against }S^\star;
\exists T:
\quad \Lambda_s\not=o!\binom{E_H}{s}.
]

By contrast, the game-theoretic lower-bound requirement is essentially

[
\exists\text{ a Prolonger strategy };
\forall\text{ Shortener strategies},
]

together with persistence for (\asymp X/H) rounds. The latter is strictly stronger.

The distinction is visible in the construction itself. After Prolonger plays (B_H), an unrestricted Shortener could reply with

[
M_H=P_H^#=\prod_{p\in\mathcal P_H}p.
]

This move is legal:

* (B_H) and (M_H) have disjoint prime supports;
* neither divides the other;
* (M_H\le N^{1/12}<N).

It immediately makes every (p\in\mathcal P_H) illegal. The traces supplied by this batch blocker have lcm essentially (M_H), so their shell density is exponentially small in (H). The maximum-degree rule does not choose this move because each individual (p) strictly dominates it in degree, but an arbitrary reply is allowed to do so.

Thus the same example also shows exactly why

[
\text{failure against the prescribed policy}
\quad\not\Longrightarrow\quad
\text{forceability against arbitrary replies}.
]

There is a second logical issue. The low-lcm lemma gives only the upper bound

[
|\mathcal E_E|\binom Es
\le 2Y\Lambda_s.
]

A lower bound on (\Lambda_s) does not, in general, imply a lower bound on (|\mathcal E_E|). Large raw energy can arise from redundant atoms. In the construction above, positive density was proved separately in (1)–(2); it does not follow from (3).

Finally, positive density at one stopping time is not the same as positive density throughout (\asymp X/H) subsequent rounds. That chronological persistence is precisely what is needed for the claimed game lower bound.

---

# The exact remaining sub-step

If “coded-repair” is intended to override the maximum-degree choice and permit a batch move such as (P_H^#), then the actual policy has not been formally specified in the question, and the literal maximum-degree counterexample does not determine the behavior of that unspecified override.

The single missing statement is the following minimax chronological lemma.

## Anchor-neutralization / batch-persistence lemma

Whenever previous Prolonger moves have made a large family of low-product repair divisors illegal, the prescribed coded-repair reply must produce a legal batch blocker such that, hereditarily under every later packet refinement, either

[
\text{a positive fraction of the remaining lift-prime colors
is removed from every low-lcm transversal},
]

or

[
\text{the current residual shell loses a proportional amount of face mass}.
]

Moreover, this alternative must hold repeatedly for (\asymp X/H) rounds, not merely in a frozen snapshot.

A precise residual moment formulation is the following. For a currently legal face (f), let (k_T(f)) be the number of distinct lift primes having a canonical first blocker while (f) remained legal. One needs some (s\le E_H) for which

[
\boxed{
\frac1Y
\sum_{\substack{f\in(Y,2Y]\ f\text{ legal at }T}}
\binom{k_T(f)}s
===============

o!\left(\binom{E_H}{s}\right)
}
\tag{RCM}
]

uniformly over stopping times.

Unlike raw (OLCM), this quantity remembers the correlation between:

* the spoiler traces;
* the moves that made repair divisors illegal;
* the residual face set that survived those moves;
* the chronology of first witnesses.

The anchor (B_H) demonstrates that no shell-local estimate involving only

[
\sum_J\frac1{\operatorname{lcm}(d_\alpha:\alpha\in J)}
]

can capture this correlation. A single move can eliminate every small repair divisor without appearing in any of the trace lcms. Frozen repairs do not control that phenomenon, and high-lcm truncation does not charge it.

Therefore the mathematical conclusion is:

[
\boxed{\text{The raw shell-stable estimate (OLCM) is false.}}
]

The game direction is not decided by this failure. What remains genuinely open in the supplied framework is the minimax, residual-weighted chronological inequality (RCM), or equivalently the anchor-neutralization lemma for the fully specified coded-repair policy.

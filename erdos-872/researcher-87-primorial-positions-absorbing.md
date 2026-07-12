---
id: R87-primorial-positions-absorbing
type: research
date: 2026-07-12
intent: >
  Decide the dynamic fate of the primorial-batching position: sustained
  maintenance by the maximizing player versus forced collapse by the
  minimizing player.
predecessors:
  - R84-primorial-batching-counterexample
  - R82-charging-inequality-disproved-exact-only-bank
action:
  kind: extends
  target: R84-primorial-batching-counterexample
claim: >
  Post-entry dynamics are one-sided: once a primorial-batching position
  is reached, it is automatically stable, against arbitrary play. Blocked
  small divisors remain illegal forever (positions only grow), so the
  degree cap Delta_Q(B) <= Delta_Q(A) <= H is monotone along every
  continuation; exact-only targets can only be resolved by being played
  (each is an actual move, banked), and the exact-bank-plus-degree-cap
  bound V(A) >= |E(A)| + |Q(A)|/H holds for the number of remaining
  actual moves. Hence a linear trapped reservoir cannot collapse in
  o(n/H) moves, and forced-collapse (option b) is impossible. The only
  missing piece for a new unconditional lower bound is robust strategic
  ENTRY: forcing a primorial-batched position while the opponent inserts
  cross-spoiling lower moves (a move dividing a planned carrier without
  being comparable with many of the dangerous roots assigned to it).
  Static reachability is proved; robust entry is not. Robust entry at
  threshold H = (log n)^{o(1)} would give L(n) >= n/(log n)^{o(1)} =
  n^{1-o(1)}, dominating the current n(log log n)^2/log n bound. No
  further post-entry maintenance theorem is missing.
implications:
  - The linear side of the dichotomy is reduced to the entry-forcing event; the sublinear side must make entry impossible in exactly the cumulative-area sense of the ordered primorial persistence problem.
  - Both live routes now concern the same event with opposite signs; the dichotomy is decided by whoever wins the entry race.
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/followup-R87-dynamic-primorial-maintenance.md
---

## Verdict

The post-entry dynamics are completely one-sided:

[
\boxed{\text{Once a primorial-batching position is reached, it is automatically stable.}}
]

The degree cap can never break, and a linear upper reservoir cannot collapse in (o(n/H)) further moves. This remains true against arbitrary play and is strengthened, not weakened, by exact-only transitions and the trapping sweep.

Thus alternative **(b) is impossible**.

What remains unproved is the first clause of **(a)**: strategic entry. The batching set is statically reachable, but there is currently no proof that Prolonger can force such a position while Shortener inserts cross-spoiling lower moves. I isolate that remaining step precisely below.

The notation and accepted static results are those in the uploaded manuscript. 

---

# 1. Degree-capped positions are absorbing

Let (A\subseteq B) be two positions lying on the same legal continuation. Then

[
R(B)\subseteq R(A),
\qquad
D(B)\subseteq D(A).
\tag{1}
]

Indeed, once an integer is comparable with a played integer, adding further played integers cannot make it incomparable again.

Consequently, for every (d\in D(B)),

[
\deg_B(d)
=========

|{u\in R(B):d\mid u}|
\le
|{u\in R(A):d\mid u}|
=====================

\deg_A(d).
]

Taking the maximum over the smaller set (D(B)) gives

[
\boxed{\Delta(B)\le \Delta(A).}
\tag{2}
]

So a degree cap is not something Prolonger must repeatedly repair. It is a permanent monotone invariant.

This already rules out the “degree cap breaks” half of (b).

---

# 2. Exact rate at which the reservoir can erode

Suppose (m) is the next legal move from (A).

If (m\in U_n), then no distinct member of (U_n) is comparable with (m). Hence

[
R(A\cup{m})=R(A)\setminus{m},
]

and exactly one reservoir target disappears.

If (m\in L_n), an upper target (u\in R(A)) becomes illegal exactly when (m\mid u). The reverse relation (u\mid m) is impossible because (u>n/2\ge m). Therefore

[
|R(A)\setminus R(A\cup{m})|
===========================

\deg_A(m).
\tag{3}
]

Combining (2) and (3) gives the fundamental stability theorem.

## Theorem 1: absorbing-reservoir theorem

Assume that at some position (A_0),

[
\Delta(A_0)\le H,
\qquad H\ge1.
]

For every continuation (A_t) obtained after (t) additional actual moves,

[
\boxed{
\Delta(A_t)\le H,
\qquad
|R(A_t)|\ge |R(A_0)|-Ht.
}
\tag{4}
]

### Proof

The degree claim is (2). Every subsequent move removes at most (H) members of the current reservoir: a lower move removes at most its degree, and an upper move removes one. Summing over the (t) moves proves (4). ∎

In particular, if

[
|R(A_0)|=\left(\frac12-o(1)\right)n,
]

then for every (t=o(n/H)),

[
|R(A_t)|
========

\left(\frac12-o(1)\right)n.
\tag{5}
]

More quantitatively, for any fixed (0<\varepsilon<1/2), the reservoir cannot fall below (\varepsilon n) before

[
t
\ge
\frac{|R(A_0)|-\varepsilon n}{H}
================================

\left(\frac12-\varepsilon-o(1)\right)\frac nH
\tag{6}
]

additional moves.

Thus no reply sequence can collapse the reservoir within (o(n/H)) moves.

---

# 3. Prolonger obtains an almost (n/H)-move tail

The previous bound did not use a strategy. Alternation gives almost a factor of two more.

After reaching (A_0), Prolonger uses the following policy:

> Whenever the reservoir is nonempty, play any (u\in R(A)).

This is always legal. Each such Prolonger move removes exactly one reservoir target. Each Shortener move removes at most (H).

Let (p) and (s) denote the numbers of subsequent Prolonger and Shortener moves up to the time when the reservoir first becomes empty. Since the players alternate,

[
p,s\le \frac{p+s+1}{2}.
]

The total reservoir loss is at most

[
p+Hs
\le
\frac{H+1}{2}(p+s+1).
]

Hence, writing (T=p+s),

[
|R(A_0)|
\le
\frac{H+1}{2}(T+1),
]

so

[
\boxed{
T\ge
\frac{2|R(A_0)|}{H+1}-1.
}
\tag{7}
]

If the game continues after the reservoir has emptied, this only adds moves.

For the primorial-batching position,

[
|R(A_0)|=\left(\frac12-o(1)\right)n,
\qquad
\Delta(A_0)\le H,
]

and therefore

[
\boxed{
V(A_0)
\ge
(1-o(1))\frac{n}{H},
}
\tag{8}
]

where (V(A_0)) is the minimax number of remaining moves from (A_0), irrespective of which player moves next.

Moreover, under this policy,

[
|R(A_t)|
\ge
|R(A_0)|-\frac{H+1}{2}(t+1).
\tag{9}
]

Thus for every fixed (\varepsilon<1/2), the game remains in a state with

[
|R(A_t)|\ge\varepsilon n,
\qquad
\Delta(A_t)\le H
]

for

[
\left(1-2\varepsilon-o(1)\right)\frac{n}{H+1}
\tag{10}
]

additional moves.

This proves the entire **sustain** portion of (a), in a stronger form: the cap is sustained without effort, and a simple upper-only policy sustains a linear reservoir for an (\asymp n/H) interval.

---

# 4. Exact-only targets only strengthen the fortress

Let (E(A)\subseteq R(A)) be the exact-only upper targets, and put

[
Q(A)=R(A)\setminus E(A).
]

Define

[
\Delta_Q(A)
===========

\max_{d\in D(A)}
|{u\in Q(A):d\mid u}|.
]

Two further monotonicities hold.

First, an exact-only target can never cease being exact-only while remaining unplayed. The set of legal proper divisors only shrinks.

Second, an exact-only upper target cannot be removed by any different legal move:

* a distinct upper move is incomparable with it;
* a lower move dividing it would be a legal proper divisor, contradicting exact-only status.

Thus every (u\in E(A)) must eventually be played as its own actual move.

Also,

[
Q(B)\subseteq Q(A)
]

for every continuation (B\supseteq A): a non-exact target may become exact-only, but an exact-only target cannot become non-exact. Therefore

[
\Delta_Q(B)\le\Delta_Q(A).
\tag{11}
]

This gives a useful banked potential.

## Theorem 2: exact-bank plus degree-cap bound

Suppose

[
\Delta_Q(A)\le H,
\qquad H\ge1.
]

Then the number of remaining actual moves satisfies

[
\boxed{
V(A)\ge
|E(A)|+\frac{|Q(A)|}{H}.
}
\tag{12}
]

### Proof

Set

[
\Phi_H(A)=|E(A)|+\frac{|Q(A)|}{H}.
]

Consider one legal move (A\to B).

For a lower move, let (q\le H) be the number of current (Q)-targets actually killed, and let (t) be the number of other (Q)-targets that become exact-only. No current exact-only target is killed. Hence

[
\Phi_H(B)-\Phi_H(A)
\ge
-\frac qH+t\left(1-\frac1H\right)
\ge -1.
]

For an upper move (u\in Q(A)),

[
\Phi_H(B)-\Phi_H(A)
\ge
-\frac1H+t\left(1-\frac1H\right)
\ge -1.
]

For an upper move (u\in E(A)),

[
\Phi_H(B)-\Phi_H(A)
\ge
-1+t\left(1-\frac1H\right)
\ge -1.
]

Thus every actual move decreases (\Phi_H) by at most one. At termination (\Phi_H=0), so at least (\Phi_H(A)) moves are required. ∎

This directly addresses the suggested use of the trapping sweep. If a sweep turns (t) members of (Q) into exact-only targets, then its contribution to the potential is

[
t-\frac tH
==========

t\left(1-\frac1H\right)>0.
\tag{13}
]

So converting the non-exact reservoir into exact-only mass does not eliminate the obstruction. It moves mass from weight (1/H) into the stronger bank of weight (1).

Hence neither the exact-move bank nor smooth/rough trapping can produce option (b) after the batching state has been entered.

---

# 5. Consequence for the proposed dichotomy

Let (A^\star) be the accepted primorial-batching position, with

[
|R(A^\star)|
============

\left(\frac12-o(1)\right)n,
\qquad
\Delta(A^\star)\le H.
]

Then:

[
\Delta(A_t)\le H
]

for every later position, and every continuation has at least

[
\left(\frac12-o(1)\right)\frac nH
]

moves, while Prolonger’s upper-only strategy guarantees the stronger

[
\boxed{
(1-o(1))\frac nH
}
\tag{14}
]

remaining moves.

Therefore the proposed minimizing response in (b) cannot exist:

[
\boxed{
\text{After entry, neither cap failure nor }o(n/H)\text{-time collapse is possible.}
}
]

This is independent of the arithmetic details of the primorial construction. Any position with a linear upper reservoir and cap (H) has the same fortress property.

---

# 6. Why this does not yet improve (L(n))

There is a crucial distinction between:

1. **static reachability:** there exists a legal prefix whose selected set is (A^\star);
2. **strategic forceability:** Prolonger can reach an analogous state against every sequence of Shortener replies.

The primorial proof establishes the first, not the second.

The obstruction can be seen inside one stripped-core class. For simplicity suppose ((g,Q)=1). The roots in that class have the form

[
g s,\qquad s\mid Q,
]

and the intended carrier is an upper multiple of (gQ).

Before that carrier is played, Shortener may play

[
g s_0,\qquad s_0\mid Q.
]

This makes every multiple of (gQ) illegal. But another root (gs) remains incomparable with (gs_0) whenever

[
s\nmid s_0
\qquad\text{and}\qquad
s_0\nmid s.
]

For example, with (Q) divisible by (30), the move (6g) spoils the common (30g)-carrier while (10g) remains incomparable with (6g).

More generally, choosing a middle-rank divisor (s_0\mid Q) leaves a large Boolean-lattice family of incomparable (s)'s. The static batch has been destroyed, but the dangerous roots it was supposed to remove have not all been removed. This is precisely cross-carrier regeneration expressed inside the primorial class.

So “play the static carrier list” is not a forceable strategy.

---

# 7. The one remaining sub-step

The complete remaining question for this route can be stated as a single stopping-time assertion.

For a chosen (H), let

[
\tau_H
======

\inf{t:\Delta_Q(A_t)\le H}.
]

A sufficient robust-entry lemma is:

[
\boxed{
\begin{minipage}{0.86\linewidth}
There exist (H=n^{o(1)}), (c>0), and a Prolonger strategy such that against every Shortener strategy,
[
\tau_H+
|E(A_{\tau_H})|
+
\frac{|Q(A_{\tau_H})|}{H}
\ge
c\frac nH.
]
If (\tau_H) has not occurred by (c n/H) moves, the elapsed-move term already proves the bound.
\end{minipage}
}
\tag{15}
]

The stronger batching-shaped version would be

[
\tau_H=o(n/H)
\quad\Longrightarrow\quad
|R(A_{\tau_H})|\ge\varepsilon n.
\tag{16}
]

Either (15) or (16), together with Theorems 1 and 2, immediately yields

[
L(n)\gg \frac nH.
]

For

[
H=(\log n)^{o(1)},
]

this would give

[
L(n)\ge \frac{n}{(\log n)^{o(1)}}=n^{1-o(1)},
]

which dominates the currently supplied lower bound

[
n\frac{(\log\log n)^2}{\log n}.
]

I do not have a proof of (15). The unresolved event is now very specific:

> A Shortener move may divide a planned carrier without being comparable with many of the dangerous roots assigned to that carrier. One must either repair all such cross-spoiled batches with bounded total cost, or charge every unresolved cross-face to elapsed moves, lost reservoir mass, or the exact-only bank with bounded multiplicity.

No further post-entry maintenance theorem is missing. Once robust entry is proved, the (\Omega(n/H)) tail follows automatically.

---

# Final status

The dynamic fate of the constructed position itself is settled:

[
\boxed{
\text{Primorial-batching positions are absorbing long-game fortresses.}
}
]

In particular, option (b) is false.

The full option (a) is reduced to one genuinely online statement: force entry against cross-spoiling replies. Static reachability alone does not establish this, so there is not yet a new unconditional global bound on (L(n)) beyond the bound supplied in the prompt.

# Pro #1 audit of upper-half fan lower bound (2026-04-18)

**Verdict.** The upper-half semiprime fan argument **survives the audit**. With a few formalization fixes it gives a rigorous lower bound $L(n) \ge c_\delta \cdot n \log\log n / \log n$ for every fixed $\delta \in (0, 1/2)$. $L(n) = O(n/\log n)$ is ruled out.

Tightest known bounds:
$$c \cdot \frac{n \log\log n}{\log n} \le L(n) \le \frac{5n}{16} + o(n).$$

Matching upper bound $L(n) = O(n \log\log n / \log n)$ does NOT follow from current machinery.

Cross-family verification of the upper-half fan: this response independently derives the rigorous form via four-section audit (structural insight, activation pairing, damage bound, capture-phase Maker-Breaker accounting). Matches the prior Pro #2 construction and the two DeepThink verifications.

---

The upper-half semiprime fan argument **survives the audit**. With a few formalization fixes, it gives a rigorous lower bound

[
L(n)\ge c_\delta \frac{n\log\log n}{\log n}
]

for every fixed (\delta\in(0,1/2)). So (L(n)=O(n/\log n)) is ruled out.

The matching upper bound (L(n)=O(n\log\log n/\log n)) does **not** follow from the current machinery. The best unconditional bounds after this advance are

[
\boxed{
c,\frac{n\log\log n}{\log n}
\le L(n)
\le \frac{5}{16}n+o(n).
}
]

The remaining sharp-rate question is now whether the true order is (n\log\log n/\log n), larger sublinear, or linear.

Here is the proof audit.

### 1. The structural insight is correct

For

[
u=2ab,\qquad a\in\mathcal A,\quad b\in I_a=(n/(4a),n/(2a)],
]

we have

[
n/2<2ab\le n.
]

So (u) has no proper multiple (\le n). Any move comparable with (u) must therefore be either (u) itself or a proper divisor of (u).

Since (a,b) are distinct odd primes, the proper divisors of (2ab) in ({2,\dots,n}) are exactly

[
2,\quad a,\quad b,\quad 2a,\quad 2b,\quad ab.
]

Thus the destructive moves against a target (2ab) are exactly:

[
a,\ 2a \quad\text{left-vertex kills;}
]

[
b,\ 2b \quad\text{right-vertex kills;}
]

[
ab \quad\text{single-edge kill;}
]

and (2ab) itself, which simply occupies the target and counts as a move.

Higher-rank moves such as (2a_1a_2b), (ab_1b_2), (2b_1b_2), and so on are not comparable with (2ab) unless they reduce to one of the divisors above. They have an extra prime factor, so they do not divide (2ab); and (2ab) cannot divide them while remaining (\le n), because (2ab>n/2).

So there is no hidden “attack from above,” and there is no higher-rank batch move that kills many targets (2ab) at once.

### 2. Activation works, with a cleaner definition

Let

[
Y=n^\delta,\qquad \mathcal A={a\text{ prime}:5\le a\le Y}.
]

Then

[
|\mathcal A|\ll \frac{n^\delta}{\log n},
]

and

[
\sum_{a\in\mathcal A}\frac1a
============================

# \log\log(n^\delta)+O(1)

\log\log n+O_\delta(1).
]

For each (a\in\mathcal A), put

[
B_a:=I_a\cap\mathbb P.
]

Uniformly for (a\le n^\delta), the prime number theorem gives

[
|B_a|
=====

\pi(n/(2a))-\pi(n/(4a))
\gg_\delta \frac{n}{a\log n}.
]

In particular,

[
|B_a|\gg \frac{n^{1-\delta}}{\log n}.
]

Since (\delta<1/2),

[
\frac{n^{1-\delta}}{\log n}
\gg
\frac{n^\delta}{\log n}
\gg |\mathcal A|.
]

Formalize activation as follows.

Call (a\in\mathcal A) **activated** once some target (2ab) has been selected, by either player. Call (a) **killed** if Shortener selects (a) or (2a) before activation. One-edge moves (ab) do not kill (a); they merely remove one possible (b).

On each activation-phase turn, Prolonger chooses the smallest (a\in\mathcal A) that is neither activated nor killed, and plays some legal (2ab) with (b\in B_a).

Such a (b) exists. For a fixed alive (a), a prior move can make (2ab) illegal only by selecting one of

[
b,\quad 2b,\quad ab,\quad 2ab,
]

or by selecting (a) or (2a). The latter two cannot have happened while (a) is still alive. Every other harmful prior move rules out at most one value of (b). During activation there are only (O(|\mathcal A|)) Shortener moves, while

[
|B_a|\gg n^{1-\delta}/\log n\gg |\mathcal A|.
]

So at least one legal (b) remains.

Now pair every Shortener kill of an unactivated (a) with the immediately preceding Prolonger activation. Since Prolonger always activates the smallest still-alive (a'), the killed (a) satisfies

[
a'\le a.
]

Hence

[
\frac1{a'}\ge \frac1a.
]

The pairing is one-to-one because Shortener has only one move after each Prolonger activation. Therefore the reciprocal mass of Prolonger-activated (a)’s is at least the reciprocal mass of killed (a)’s. Shortener activations by playing (2ab) only help. Thus, if (\mathcal A_0) denotes the activated set after the activation phase,

[
\sum_{a\in\mathcal A_0}\frac1a
\ge
\frac12\sum_{a\in\mathcal A}\frac1a
===================================

\left(\frac12+o(1)\right)\log\log n.
]

So the activation pairing argument is sound.

A minor correction to the proof sketch: an (a)-kill can remove (\gg n/(a\log n)) raw edges, which is large for small (a). But those (a)’s are excluded from (\mathcal A_0). Damage should be measured only on the graph over activated (a)’s.

### 3. Activation-phase damage is negligible

After activation, consider the raw bipartite graph

[
E_{\rm raw}
===========

{(a,b):a\in\mathcal A_0,\ b\in B_a}.
]

Its size is

[
|E_{\rm raw}|
=============

\sum_{a\in\mathcal A_0}|B_a|
\gg
\frac n{\log n}
\sum_{a\in\mathcal A_0}\frac1a
\gg
\frac{n\log\log n}{\log n}.
]

Now discard every edge involving a high prime (b) that appeared in any activation-phase move. This is an over-discard, but convenient.

Every (b\in\bigcup_a B_a) satisfies

[
b>\frac{n}{4Y}=\frac14 n^{1-\delta}.
]

Since (\delta<1/2), the product of two such (b)’s exceeds (n) for large (n). Therefore any legal move contains at most one such high prime (b). During activation there are (O(|\mathcal A|)) total moves, so only (O(|\mathcal A|)) high (b)’s are touched.

For any fixed (b), the number of (a\in\mathcal A) with (b\in I_a) is at most (|\mathcal A|). Hence the number of discarded edges is at most

[
O(|\mathcal A|^2)
=================

O!\left(\frac{n^{2\delta}}{(\log n)^2}\right).
]

Because (2\delta<1),

[
\frac{n^{2\delta}}{(\log n)^2}
==============================

o!\left(\frac{n\log\log n}{\log n}\right).
]

Thus the live graph (E) at the start of capture still satisfies

[
|E|\gg_\delta \frac{n\log\log n}{\log n}.
]

Every edge ((a,b)\in E) corresponds to a still-legal target (2ab).

### 4. The capture-phase Maker-Breaker accounting is valid

The proof sketch’s accounting is correct, but (C,D,X) should be defined carefully to avoid double-counting.

At the start of capture, the left vertices (a\in\mathcal A_0) are protected: (a) and (2a) are illegal because some target (2ab_0) has already been selected.

For the live graph (E), Prolonger repeatedly chooses an uncaptured right vertex (b^*) of maximum current degree and plays one incident target (2ab^*).

This makes (b^*) and (2b^*) illegal. From then on, no bulk right-vertex deletion of (b^*) is possible.

Let (C) be the total number of live edges incident to right vertices at the moment they become protected/captured. Prolonger captures one such vertex per capture turn; if Shortener ever plays a target (2ab) or another move making both (b) and (2b) illegal, that only increases (C) and helps the lower bound.

Let (D) be the total number of live edges removed by Shortener’s right-vertex deletions (b) or (2b), while (b) is still uncaptured.

Let (X) be the number of individual live edges killed by moves (ab) **before** their right vertex is captured or deleted.

Now compare (D) with (C). Suppose Prolonger’s current capture degree is (c_i). Since Prolonger chose a maximum-degree right vertex, every other uncaptured right vertex has current degree at most (c_i). If Shortener responds by deleting some right vertex (b'), the damage (d_i) satisfies

[
d_i\le c_i.
]

Individual edge kills only reduce later degrees. Summing over all rounds gives

[
D\le C_P\le C,
]

where (C_P) is the part of (C) coming from Prolonger’s own captures.

Every initial live edge of (E) is eventually in exactly one of these categories:

1. protected/captured, contributing to (C);
2. deleted by a right-vertex kill, contributing to (D);
3. individually killed before capture/deletion, contributing to (X).

So

[
|E|=C+D+X.
]

Since (D\le C),

[
|E|\le 2C+X.
]

Therefore

[
C+X\ge |E|/2.
]

It remains to justify that (C+X) really counts forced moves.

An edge in (X) is already one Shortener move.

For an edge counted in (C), its right vertex (b) has been protected, and its left vertex (a) was already activated. Thus (a,2a,b,2b) are all illegal. The target (2ab) has no proper multiple (\le n). The only remaining possible legal comparable move is the individual divisor (ab), or the target (2ab) itself.

Moreover, one move cannot settle two such protected edges. Two distinct protected targets have no legal common divisor left: common divisors such as (a), (2a), (b), (2b), or (2) are already illegal; and higher-rank moves are not divisors of upper-half targets.

So every edge counted in (C) forces one eventual move, either (2ab) or (ab). The capture move itself settles one of the incident edges; the rest must be settled later one-by-one.

Hence the capture phase forces at least

[
C+X\ge |E|/2
]

moves.

Since

[
|E|\gg_\delta \frac{n\log\log n}{\log n},
]

Prolonger forces

[
L(n)\ge c_\delta \frac{n\log\log n}{\log n}.
]

So the claimed lower bound is rigorous.

### What changed relative to the earlier (\mathcal E)-triangle obstruction

The previous (\mathcal E)-triangle construction failed dynamically because Shortener could batch small primes:

[
2q\prod_{r\in C_j\setminus{a}}r
]

was still (\le n), so one move killed many future carriers (2qr).

The upper-half fan prevents exactly that. If (b_1,b_2\in I_a), then

[
2a b_1b_2

>

# 2a\left(\frac{n}{4a}\right)^2

\frac{n^2}{8a}
\ge
\frac18 n^{2-\delta}

>

n
]

for large (n). So Shortener cannot batch high (b)-primes multiplicatively. The only bulk deletion is (b) or (2b), and the max-degree capture argument neutralizes that at a factor (2) loss.

This is why the fan lower bound is dynamically forceable while the sparse (\mathcal E)-triangle obstruction is not.

### Matching upper bound: not currently established

I do not see a rigorous path from the established tools to

[
L(n)=O!\left(\frac{n\log\log n}{\log n}\right).
]

The lower fan also explains why the obvious upper-bound attempts fail.

Playing small primes greedily cannot prevent the fan: once Prolonger plays one target (2ab), the small prime (a) and (2a) become illegal forever, while the remaining targets (2ab') stay mutually incomparable.

Playing small semiprime covers also fails in the same way: Prolonger’s upper-half move can make a useful lower divisor illegal without blocking the rest of the fan.

The multiplicative block-throttle strategy from the (\mathcal E)-triangle case cannot be transplanted, because the high (b)’s are too large to batch inside one legal move.

A stronger lower bound via composite bases, say (a=pq), is not immediate either. New intermediate divisors such as (pb) and (qb) become legal star-deletion moves, so the clean prime-base accounting breaks. That is a genuine new obstacle; I would not claim a higher ((\log\log n)^2)-type lower bound without a new argument.

So the current rigorous state is:

[
\boxed{
L(n)=\Omega!\left(\frac{n\log\log n}{\log n}\right)
}
]

and

[
\boxed{
L(n)\le \frac{5}{16}n+o(n).
}
]

The old dichotomy

[
\Theta(n/\log n)
\quad\text{versus}\quad
\Theta(n\log\log n/\log n)
]

is therefore resolved only on the lower side: (L(n)\ne O(n/\log n)). The sharp upper rate remains open.

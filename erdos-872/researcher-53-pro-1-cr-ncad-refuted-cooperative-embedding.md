---
id: R53-pro-1-cr-ncad-refuted
type: refutation
date: 2026-04-19
intent: >
  Name the CR-NCAD conjecture and refute it via cooperative-embedding
  construction.
predecessors: [R52-pro-spectral-live-space]
action:
  kind: standalone
claim: >
  CR-NCAD (Central-Rank No-Cheap Avoidance-Design Conjecture) named and
  refuted: cooperative-embedding construction achieves cheap avoidance
  designs at central rank h. Prolonger cooperatively embeds a sparse
  covering design into the central-rank families, refuting CR-NCAD.
failure_mechanism: >
  Cooperative embedding: Prolonger uses two coordinated sub-strategies
  that jointly implement a sparse covering design at rank h. Sub-strategy A
  creates the complement family; sub-strategy B ensures the antichain
  legality. Neither sub-strategy alone achieves the avoidance design but
  their cooperation does, violating the no-cheap-avoidance hypothesis.
---

I would name it the **Central-Rank No-Cheap Avoidance-Design Conjecture**, abbreviated **CR-NCAD**:

[
\textbf{CR-NCAD:}\qquad
\text{In a central-rank packet of the antichain divisibility game, Prolonger cannot maintain a }q\text{-avoidance covering design at packet cost }< r_1(n).
]

Under the natural packet-local reading, **CR-NCAD is false**.

The refutation is not merely an abstract covering-design example. The cheap design can be embedded into an actual legal state of the antichain divisibility game, inside a genuine central-rank divisor packet, with total first-shadow cost

[
n^{1/2+o(1)}=o(r_1(n)).
]

So a no-cheap-design theorem cannot be the missing ingredient. The missing ingredient would have to be an **adversarial online robustness theorem**, not a static packet-cost theorem.

---

Fix (0<\alpha<1/2). Let

[
h=\lfloor \log\log n\rfloor,\qquad
\ell=\left\lfloor \frac{h}{\log h}\right\rfloor,\qquad
q=\lfloor \alpha h\rfloor .
]

I will construct a central packet (P) of (h) primes and a family of Prolonger blockers whose induced complements form a (q)-avoidance covering design.

Choose

[
Y=n^{1/(2h)}.
]

By the prime number theorem, for all sufficiently large (n), the dyadic interval ([Y,2Y]) contains more than (h) primes. Choose distinct primes

[
P={p_1,\dots,p_h}\subset [Y,2Y].
]

Let

[
R=\prod_{p\in P}p.
]

Then

[
n^{1/2}\le R\le (2Y)^h=2^h n^{1/2}=n^{1/2+o(1)}.
]

By Bertrand’s postulate, since (n/(2R)\to\infty), there is a prime

[
a\in \left(\frac{n}{2R},\frac{n}{R}\right].
]

Set

[
u=aR.
]

Then

[
u\in (n/2,n],
]

and (u) contains the packet (P) as (h) squarefree prime coordinates. Since (h=\log\log n+O(1)), this is a central-rank packet.

Now build the sparse covering design.

Let

[
\delta=\frac{\binom{h-q}{\ell}}{\binom{h}{\ell}}.
]

Choose (s) random (\ell)-subsets of (P), where

[
s=\left\lceil \frac{2\log \left(\sum_{j=0}^q\binom{h}{j}\right)}{\delta}\right\rceil .
]

For a fixed (Q\subseteq P) with (|Q|\le q), the probability that a random (\ell)-set (C) is disjoint from (Q) is at least (\delta). Hence the probability that none of the (s) chosen (C)’s is disjoint from (Q) is at most

[
(1-\delta)^s\le e^{-s\delta}
\le
\left(\sum_{j=0}^q\binom{h}{j}\right)^{-2}.
]

A union bound over all (Q\subseteq P) with (|Q|\le q) shows that there exists a family

[
\mathcal C\subseteq \binom{P}{\ell}
]

such that for every (Q\subseteq P), (|Q|\le q), there is some (C\in\mathcal C) with

[
C\cap Q=\varnothing .
]

Moreover,

[
\log |\mathcal C|
=================

\left(\log \frac1{1-\alpha}+o(1)\right)\frac{h}{\log h}.
]

Thus

[
|\mathcal C|
============

\exp!\left(
\left(\log \frac1{1-\alpha}+o(1)\right)\frac{h}{\log h}
\right)
=======

n^{o(1)}.
]

For each (C\in\mathcal C), define a Prolonger blocker

[
b_C=\prod_{p\in P\setminus C}p.
]

Each (b_C) divides (u), hence lies in the divisor packet of (u). Also each (b_C\le R<n), and all (b_C)’s have the same number (h-\ell) of prime factors. Therefore the (b_C)’s are pairwise incomparable under divisibility.

The complement of the (P)-support of (b_C) is exactly (C). Hence the induced complement family is precisely (\mathcal C).

Now take any relative Shortener support (Q\subseteq P) with

[
|Q|\le q.
]

By construction, there is (C\in\mathcal C) with (C\cap Q=\varnothing). Therefore

[
Q\subseteq P\setminus C,
]

so

[
\prod_{p\in Q}p \mid b_C.
]

Thus the relative move supported on (Q) is illegal after the blocker (b_C) has been played. Since this holds for every (|Q|\le q), the Prolonger blockers form a genuine (q)-avoidance covering design.

This already refutes CR-NCAD at the level of packet-local realizability. But we can say more: the state is reachable in the actual game.

Because

[
|\mathcal C|=n^{o(1)}
]

and the interval ((n/2,n]) contains (\sim n/(2\log n)) primes, there are enough large primes in ((n/2,n]) to serve as harmless Shortener filler moves. These large primes are pairwise incomparable and are incomparable with every (b_C), because every (b_C\le R=n^{1/2+o(1)}<n/2) for large (n), while the filler primes are (>n/2).

So one legal play sequence is:

[
\text{Prolonger plays } b_{C_1},\quad
\text{Shortener plays a fresh large prime},\quad
\text{Prolonger plays } b_{C_2},\quad \dots
]

At the end, the played set is still an antichain, and Prolonger has realized the desired (q)-avoidance design inside the central packet of (u).

Now measure the cost.

For every (C\in\mathcal C),

[
b_C
===

\prod_{p\in P\setminus C}p
\ge
Y^{h-\ell}
==========

# n^{(h-\ell)/(2h)}

n^{1/2-1/(2\log h)+o(1)}.
]

The number of elements of (U=(n/2,n]) divisible by (b_C) is at most (n/b_C). Therefore the total first-shadow cost of the whole blocker family satisfies

[
\Gamma_U(\mathcal C)
\le
\sum_{C\in\mathcal C}\frac{n}{b_C}
\le
|\mathcal C|,
n^{1/2+1/(2\log h)+o(1)}.
]

Since (|\mathcal C|=n^{o(1)}),

[
\Gamma_U(\mathcal C)
\le
n^{1/2+o(1)}.
]

But

[
r_1(n)
======

# \frac{n(\log\log n)^2}{\log n}

n^{1-o(1)}.
]

Hence

[
\Gamma_U(\mathcal C)=o(r_1(n)).
]

So the conjecture fails not only for raw move cost

[
|\mathcal C|=n^{o(1)}=o(r_1(n)),
]

but also for the much stronger terminal-shadow cost

[
\Gamma_U(\mathcal C)=n^{1/2+o(1)}=o(r_1(n)).
]

I also checked the covering-design arithmetic in the Python sandbox. For (\alpha=1/4), using natural logarithms:

[
\begin{array}{c|c|c|c}
h & \ell=\lfloor h/\log h\rfloor & q=\lfloor h/4\rfloor & \log s\
\hline
100 & 21 & 25 & 11.56\
200 & 37 & 50 & 17.33\
500 & 80 & 125 & 31.75\
1000 & 144 & 250 & 52.32
\end{array}
]

The design size is indeed (\exp(\Theta(h/\log h))), not (\exp(\Theta(h))).

---

The precise conclusion is:

[
\boxed{
\text{CR-NCAD, as a packet-cost non-realizability conjecture, is false.}
}
]

Sparse (q)-avoidance covering designs are not too expensive to realize in the divisibility game. They can be realized in a central packet at cost (o(r_1(n))), even if cost is measured by the number of (U)-elements shadowed by the Prolonger blockers.

What survives is a different conjecture, with an explicitly adversarial online quantifier.

Given a Shortener packet history (\mathcal R\subseteq 2^P), a future Prolonger complement (C) must satisfy

[
C\cap R\neq\varnothing
\qquad \forall R\in\mathcal R,
]

because otherwise the corresponding blocker would be divisible by a previous Shortener move. A robust online avoidance family must therefore satisfy

[
\forall Q\subseteq P,\ |Q|\le q,\
\left(\forall R\in\mathcal R,\ R\nsubseteq Q\right)
\Longrightarrow
\exists C\in\mathcal C
\text{ such that }
C\cap Q=\varnothing
\text{ and }
C\cap R\neq\varnothing\ \forall R\in\mathcal R.
]

This is the correct object: a **relative online cover-free transversal system**.

The static case (\mathcal R=\varnothing) is exactly the cheap construction above. Therefore any valid upper-bound route cannot prove that sparse covering designs are intrinsically expensive. They are not.

The only viable strengthened theorem would be something like:

[
\boxed{
\text{Adversarial Online Relative-Design Cost Theorem}
}
]

stating that, under arbitrary Shortener interference (\mathcal R_t), Prolonger cannot keep producing relative cover-free transversal systems without either paying (r_1)-scale terminal shadow or allowing Shortener’s own packet moves to contribute the missing game length.

That is a genuinely different statement. The named CR-NCAD is refuted.

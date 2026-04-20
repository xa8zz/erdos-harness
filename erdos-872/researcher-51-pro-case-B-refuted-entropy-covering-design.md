---
id: R51-pro-case-B-refuted-entropy-covering-design
type: refutation
date: 2026-04-19
intent: >
  Refute Case B of the WLST/entropy-separator approach via covering-design
  obstruction.
predecessors: [R50-pro-wlst-refuted-parity-cube]
action:
  kind: standalone
claim: >
  Case B false via covering-design obstruction: Bernoulli extraction fails
  because Prolonger's complements form a sparse covering design for all
  small proposed Shortener transversals, while the live packet still has
  essentially full entropy. No prior Shortener blockers are needed; this
  is a pure game-structure obstruction.
failure_mechanism: >
  Covering-design obstruction: Prolonger places packet complements as a
  sparse (h, h/2, 1)-covering design on the prime-factor positions. Every
  Shortener transversal of size <= h/2 misses at least one complement block.
  The covering design ensures no small separator captures a constant fraction
  of the entropy, even though the packet has full entropy (H = h bits).
---

Case B, in the stated form, is false.

There is a fourth obstruction beyond apex-star, parity-cube, and atomized relative cones: a **covering-design obstruction**. It has no prior Shortener blockers at all, so it cannot be repaired by a more careful treatment of (\mathcal D). The obstruction is that Bernoulli extraction can fail because Prolonger’s complements form a sparse covering design for all small proposed Shortener transversals, while the live packet still has essentially full entropy.

Here is the precise counterexample.

Let

[
K=h+L,\qquad L=\left\lfloor \frac{h}{\log h}\right\rfloor,\qquad q=\left\lfloor \frac h2\right\rfloor,
]

and let (P) be a packet of (K) primes. Work with rank-(h) Prolonger moves (B=P\setminus C), where (C\in \binom{P}{L}).

Take

[
\mathcal D=\varnothing.
]

So there are no prior Shortener blockers. In particular, all game-legality issues involving (D_j\not\subseteq Q) disappear.

Now choose a family of (h)-sets

[
A_1,\dots,A_s\subseteq P,\qquad |A_i|=h,
]

such that every (q)-subset (R\subseteq P) is contained in at least one (A_i). Equivalently, ({A_i}) is a covering design for (q)-sets by (h)-sets.

Then define Prolonger complements

[
C_i=P\setminus A_i,\qquad |C_i|=L.
]

The played Prolonger moves are

[
B_i=A_i.
]

They are all rank (h), hence pairwise incomparable. Since (\mathcal D=\varnothing), this is a legal packet state.

A standard probabilistic covering argument gives such a family with

[
s\le
\left\lceil
\frac{\binom{K}{q}}{\binom{h}{q}}
\left(\log\binom{K}{q}+1\right)
\right\rceil .
]

Indeed, choose random (h)-sets (A_i). A fixed (q)-set (R) is contained in a random (A_i) with probability

[
p=\frac{\binom{K-q}{h-q}}{\binom{K}{h}}
=\frac{\binom{h}{q}}{\binom{K}{q}}.
]

With (s\ge p^{-1}(\log\binom Kq+1)), the expected number of uncovered (q)-sets is (<1), so a covering family exists.

For (q=h/2+O(1)),

[
\log\frac{\binom{K}{q}}{\binom{h}{q}}
=====================================

# \log\frac{\binom{h+L}{q}}{\binom{h}{q}}

(\log 2+o(1))L.
]

Also (\log\log\binom Kq=O(\log h)=o(L)). Therefore

[
\boxed{
\log |\mathcal C|
=================

# \log s

(\log 2+o(1))L.
}
]

Now check the Bernoulli separator hypothesis.

Let (x_p\in[0,1]), and write

[
X=\sum_{p\in P}x_p\le \frac h4.
]

Let (R\subseteq P) be the random set obtained by including each (p) independently with probability (x_p). Then

[
\mathbb E |R|=X\le \frac h4,
]

so by Markov,

[
\Pr(|R|>q)\le \frac{X}{q}\le \frac12+o(1).
]

On the event (|R|\le q), extend (R) to some (q)-set (R'). By construction, (R'\subseteq A_i) for some (i). Hence

[
R\subseteq A_i=P\setminus C_i,
]

so

[
R\cap C_i=\varnothing.
]

Therefore, on (|R|\le q), at least one Prolonger complement (C_i) is missed by (R). Thus

[
\sum_i \mathbf 1_{{R\cap C_i=\varnothing}}\ge 1
]

on that event. Taking expectations gives

[
\sum_i \prod_{p\in C_i}(1-x_p)
==============================

\mathbb E\sum_i \mathbf 1_{{R\cap C_i=\varnothing}}
\ge
\Pr(|R|\le q)
\ge
\frac12-o(1).
]

Since (\mathcal D=\varnothing), the second Bernoulli term is absent. Hence for every admissible (x),

[
\sum_i \prod_{p\in C_i}(1-x_p)
+
\sum_j \prod_{p\in D_j}x_p

>

\frac14
]

for all sufficiently large (h).

So the Bernoulli hypothesis fails decisively.

But the live residual entropy is still essentially maximal. Since (\mathcal D=\varnothing), the live complement space is

[
\Omega_{\mathrm{live}}
======================

\binom{P}{L}\setminus \mathcal C.
]

Let

[
M=\binom{K}{L}.
]

We have

[
\log M
======

# L\log\frac{eK}{L}+O(L^2/K+\log L)

(1+o(1))L\log(e\log h).
]

Meanwhile

[
\log |\mathcal C|
=================

(\log 2+o(1))L.
]

Since

[
\log M-\log|\mathcal C|
=======================

L\bigl(\log(eK/L)-\log 2+o(1)\bigr)
\to\infty,
]

we have (|\mathcal C|=o(M)). Under the uniform packet measure,

[
H(\Omega_{\mathrm{live}}\mid \mathcal C)
========================================

# \log(M-|\mathcal C|)

(1-o(1))\log M.
]

Therefore

[
\boxed{
\frac{H(\Omega_{\mathrm{live}}\mid \mathcal C)}
{\log|\mathcal C|}
\ge
(1-o(1))
\frac{\log(eK/L)}{\log 2}
\sim
\frac{\log\log h}{\log 2}.
}
]

Thus any Case B inequality of the proposed form

[
H(\Omega_{\mathrm{live}}\mid \mathcal C)
\le
\kappa(h,L)\log|\mathcal C|
]

requires

[
\boxed{
\kappa(h,L)\ge (1-o(1))\frac{\log(eK/L)}{\log 2}
\sim
\frac{\log\log h}{\log 2}.
}
]

So there is no (O(1))-compression to (\log|\mathcal C|). More importantly, the obstruction is not caused by (\mathcal D), parity, atomization, or relative cones. It appears already with (\mathcal D=\varnothing).

The same lower bound survives Sathe-Selberg weighting inside a dyadic packet. If atom weights vary by at most (\exp(O(L))) across the packet, then

[
H_{\mathrm{SS}}(\Omega_{\mathrm{live}}\mid \mathcal C)
\ge
\log(M-|\mathcal C|)-O(L),
]

and the ratio is still

[
\ge
(1-o(1))
\frac{\log(eK/L)}{\log 2}.
]

The (O(L)) distortion is negligible compared with

[
L\log(eK/L).
]

There is also no hidden small legal separator. If (Q) hits every (C_i), then (Q) cannot have size (\le q), because every (q)-set is contained in some (A_i=P\setminus C_i), hence is disjoint from some (C_i). Thus every legal blocker satisfies

[
|Q|>q\sim h/2.
]

Consequently its ambient packet capture is at most

[
\frac{\binom{K-q}{L}}{\binom{K}{L}}
\le
\left(1-\frac qK\right)^L
=========================

\exp\bigl(-(\log 2+o(1))L\bigr).
]

So this is genuinely a no-small-separator state, but the live entropy is still almost the full packet entropy.

I checked the scale numerically using exact log-binomial values. Natural logarithms:

[
\begin{array}{c|c|c|c|c|c}
h & L & K/L & \log\binom{K}{L} & \log s_{\mathrm{cover}} & \text{ratio} \
\hline
1000 & 144 & 7.94 & 429.63 & 97.33 & 4.41 \
3000 & 374 & 9.02 & 1171.29 & 246.16 & 4.76 \
10000 & 1085 & 10.22 & 3547.27 & 707.77 & 5.01 \
100000 & 8685 & 12.51 & 30268.70 & 5683.79 & 5.33
\end{array}
]

The ratio grows like (\log(eK/L)/\log 2), as predicted.

The proposed amortized entropy compression therefore has a named gap:

[
\boxed{
\text{covering-design entropy amplification.}
}
]

Bernoulli failure does not imply that the residual packet entropy is saturated by (\log|\mathcal C|). It may only mean that the complements (P\setminus C_i) form a covering design for all small proposed Shortener transversals. Such a covering design can have only (2^{(1+o(1))L}) members while the live packet has entropy about

[
L\log(K/L)\sim L\log\log h.
]

Conditional Shearer does not repair this: in the construction above, the residual distribution still has near-maximal coordinate entropy. Moser-Tardos rounding also does not repair it: every small rounded set (Q) is deterministically killed by the covering design.

So the two-outcome dichotomy must be expanded. A correct version would need a third outcome, something like:

[
\boxed{
\text{either separator, or atomized/parity saturation, or small-transversal covering-design saturation.}
}
]

The missing ingredient would have to be a **shadow-cover entropy inequality** involving the (q)-shadow

[
\Gamma_q(\mathcal C)
====================

\left{
R\in\binom Pq:
\exists i,\ R\subseteq P\setminus C_i
\right},
]

not merely (\log|\mathcal C|). In this counterexample,

[
\Gamma_q(\mathcal C)=\binom Pq,
]

while

[
\log|\mathcal C|\asymp L
\quad\text{and}\quad
H(\Omega_{\mathrm{live}})\asymp L\log(K/L).
]

Thus the blocker-duality program is not dead, but the proposed Case A/Case B split is incomplete. The next theorem cannot charge entropy only to the number of played Prolonger complements. It must also charge the **covering power of their upper shadows**.

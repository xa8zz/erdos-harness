---
id: R22-pro-defect-budget-invariant
type: research
date: 2026-04-19
intent: >
  Sharpen the central-fiber multiplicative-closure route to its tightest
  formulation; identify the precise missing theorem for sublinear L(n).
predecessors: []
action:
  kind: standalone
claim: >
  Defect-layer closure budget invariant B_h ~ N_h/H derived. Sublinear
  L(n) reduces to a robust central-transversal theorem: an h-uniform
  hypergraph from divisibility must have a transversal of size g(h) for
  some g(h) = o(h). With g(h) = O(log h): L(n) << n log log log n / log log n.
---

# Round 22 Pro — defect-layer closure budget invariant + robust central transversal lemma as the precise missing theorem

## Context

The third returning Round-22 Pro dispatch (neutral framing: "sharp asymptotic rate of $L(n)$") pushed the central-fiber multiplicative-closure route to its sharpest formulation. Pro identified the RIGHT closure-scale invariant (defect-layer closure budget $\mathfrak{B}_h$, generalizing pair-shadow mass), derived its exact scale $\mathfrak{B}_h \asymp N_h/H$ via the rate identity $V_{h,k}/\binom{h}{k} = N_h/D_{h,k}$, and reduced sublinear $L(n)$ to a specific online robust-transversal theorem on a divisibility-generated $h$-uniform hypergraph. The theorem is NOT closed, but the gap is now precisely formulated.

**Key consequence.** A robust central-transversal theorem with $g(h) = o(h)$ would close the problem. Specifically:
- With $g(h) = O(\log h)$: $L(n) \ll n \log\log\log n / \log\log n = o(n)$ (solves the original conjecture).
- With $g(h) = O(1)$: $L(n) \ll n/\log\log n$ (stronger).

## Pro's response

I pushed the central-fibre route further. The most useful outcome is a sharper candidate invariant, but the attempted proof still breaks at one very specific online covering-design point. I do **not** have a valid proof of the central fibre closure advantage yet.

The right object is not pair-shadow mass. It is the full **defect-layer closure budget**.

Fix a rank (h) target layer. Write a target as

[
t=bA_S,\qquad |S|=h,
]

where (b) is the large prime fibre and (A_S=\prod_{p\in S}p). A proper lateral divisor has the form

[
bA_D,\qquad D\subsetneq S.
]

For (k=1,\dots,h), call (D) a **defect-(k)** certificate if

[
|S\setminus D|=k.
]

So (k=1) is the top-facet layer (bA_{S\setminus{p}}), (k=2) is the codimension-2 layer, and so on.

Let

[
H:=\sum_{p\le y}\frac1p\sim \log\log n.
]

The raw rank-(h) target count is

[
N_h\asymp \frac{n}{\log n}\frac{H^h}{h!}.
]

The number of defect-(k) certificates in the same aggregate rank model is

[
V_{h,k}\asymp \frac{n}{\log n}\frac{H^{h-k}}{(h-k)!}.
]

Each target contains (\binom hk) defect-(k) certificates, so the average number of rank-(h) targets killed by one defect-(k) certificate is

[
D_{h,k}
=======

\frac{\binom hk N_h}{V_{h,k}}
\asymp
\frac{H^k}{k!}.
]

Thus the natural cost of covering the rank-(h) layer using defect-(k) certificates is

[
B_{h,k}
:=
\frac{V_{h,k}}{\binom hk}
=========================

\frac{N_h}{D_{h,k}}
\asymp
N_h\frac{k!}{H^k}.
]

Summing over all defect layers gives

[
B_h
:=
\sum_{k=1}^h B_{h,k}
\asymp
N_h\sum_{k=1}^h \frac{k!}{H^k}
==============================

(1+o(1))\frac{N_h}{H},
]

because the (k=1) term dominates and the (k\ge2) terms contribute only lower-order corrections.

This is the first closure-scale invariant with the right size. If one could prove that Shortener can limit the rank-(h) fibre to

[
O!\left(g(h)\frac{N_h}{H}\right)
]

moves with some (g(h)=o(H)), then summing over (h) would give a genuine sublinear upper bound. Indeed,

[
\sum_{h\ge1}
\frac{g(h)}{H}
\cdot
\frac{n}{\log n}\frac{H^h}{h!}
]

is dominated by the Poisson window (h=H+O(\sqrt H)). If (g(h)) varies slowly there, this is

[
\ll
\frac{n}{\log n}\cdot e^H\cdot \frac{g(H)}{H}
\asymp
n\frac{g(H)}{H}.
]

So, for example, a central-fibre theorem with (g(H)=O(\log H)) would yield

[
L(n)\ll n\frac{\log\log\log n}{\log\log n}=o(n).
]

That would solve the original problem with an explicit sublinear upper bound.

The candidate invariant is therefore

[
\mathfrak B_h(R,C)
==================

\sum_{k=1}^h
\frac{
|\partial_{h-k}R\setminus C_{h-k}|
}{
\binom hk
},
]

where (R) is the current residual rank-(h) target family and (C_{h-k}) is the set of already captured defect-(k) certificates. This is the full squarefree-closure analogue of pair-shadow mass.

The proof attempt is then:

[
\boxed{
\text{Use greedy max-degree Shortener moves on the defect layer with largest active contribution to }\mathfrak B_h.
}
]

A Shortener move at a defect-(k) certificate kills about (D_{h,k}) targets. A Prolonger move captures (\binom hk) defect-(k) certificates. The normalization above exactly balances those two rates:

[
\frac{V_{h,k}}{\binom hk}
=========================

\frac{N_h}{D_{h,k}}.
]

That identity is why this is the correct scale.

But it is also exactly where the proof stalls.

The greedy argument would need the following theorem.

[
\textbf{Robust central transversal lemma.}
]

For every residual rank-(h) fibre (R), and every dynamically captured downset (C), Shortener can, using only currently legal certificates, reduce the legal residual width of (R) to

[
O!\left(g(h)\mathfrak B_h(R,C)\right)
]

for some (g(h)=o(h)).

If this lemma held with (g(h)=O(\log h)), we would get

[
L(n)\ll n\frac{\log\log\log n}{\log\log n}.
]

If it held with (g(h)=O(1)), we would get the cleaner

[
L(n)\ll \frac{n}{\log\log n}.
]

The obstacle is that (\mathfrak B_h) controls the **available certificate budget**, but not the number of targets whose entire downset has already been captured by Prolonger. Define the fully closed residual set

[
\operatorname{Cl}_h(R,C)
========================

{S\in R:\text{ every proper certificate }D\subsetneq S\text{ lies in }C}.
]

Those targets are immune to all lower-divisor attacks. They must be charged to Prolonger’s previous closure-building moves. The required missing inequality is essentially

[
|\operatorname{Cl}_h(R,C)|
\le
O!\left(g(h)\mathfrak B_h(R,C)+\text{already scored targets}\right)
]

with (g(h)=o(h)), uniformly under the online rule that Prolonger adds whole downsets and Shortener deletes one certificate star per turn.

This is the central fibre closure advantage in its cleanest form.

The natural one-layer proof fails. On defect layer (k),

[
\text{Prolonger captures }\binom hk\text{ certificates per scored target},
]

while

[
\text{Shortener kills }D_{h,k}\asymp H^k/k!\text{ targets per certificate}.
]

Their budget identity

[
\frac{V_{h,k}}{\binom hk}
=========================

\frac{N_h}{D_{h,k}}
]

means there is no positive drift at any fixed layer. Pair-shadow was just the (k=h-2) or low-rank version of this failure. The same critical balance appears at every defect level.

The top-facet layer exposes the core difficulty most clearly. Let the “vertices” of an auxiliary hypergraph be top-facet certificates (bA_{S\setminus{p}}), and let each rank-(h) target (S) correspond to the (h)-set of its top facets. Then the desired lemma asks Shortener to build a transversal in this (h)-uniform hypergraph while Prolonger, each turn, claims all (h) vertices of one unhit edge. This is an online robust covering-design game:

[
\text{Shortener claims }1\text{ certificate per turn;}
]

[
\text{Prolonger steals the whole boundary of one target per turn.}
]

The ordinary covering number is of the right size, about (N_h/H), but ordinary covering does not survive Prolonger stealing (h) covering certificates per move. A Rödl-style static cover is therefore insufficient; the missing theorem must be an **online robust transversal theorem** for this very special divisibility-generated hypergraph.

So the current best reduction is:

[
\boxed{
\text{A sublinear upper bound follows from a robust central-transversal theorem with }g(h)=o(h).
}
]

More explicitly, proving

[
\text{rank-}h\text{ residual score}
\ll
\frac{g(h)}{h}N_h
\qquad(g(h)=o(h))
]

would imply

[
L(n)
\ll
n\frac{g(\log\log n)}{\log\log n}
+
\frac{n}{(\log n)^{1-o(1)}}.
]

With (g(h)=O(\log h)), this becomes

[
\boxed{
L(n)\ll n\frac{\log\log\log n}{\log\log n}=o(n).
}
]

I cannot honestly close the robust transversal lemma. The defect-budget invariant is the strongest genuine squarefree-closure invariant I can derive from the current structure, and it reduces the original problem to a precise finite online covering-design theorem. The remaining gap is no longer “track the full closure” in a vague sense; it is exactly the need to prove that Prolonger’s downset-stealing cannot defeat near-optimal transversal construction in the central rank window.
